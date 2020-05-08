FROM node:14.2.0 as node
FROM ruby:2.7.1
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /opt/yarn-v1.22.4 /opt/yarn
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler
RUN bundle install

EXPOSE 3000

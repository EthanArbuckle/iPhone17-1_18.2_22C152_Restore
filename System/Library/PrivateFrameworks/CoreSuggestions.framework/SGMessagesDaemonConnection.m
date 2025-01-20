@interface SGMessagesDaemonConnection
- (SGMessagesDaemonConnection)initWithDaemonConnectionFuture:(id)a3;
- (id)remoteSuggestionManagerWithErrorHandler:(id)a3;
- (void)setManagerForTesting:(id)a3;
@end

@implementation SGMessagesDaemonConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSuggestionManagerForTesting, 0);

  objc_storeStrong((id *)&self->_daemonConnectionFuture, 0);
}

- (void)setManagerForTesting:(id)a3
{
}

- (id)remoteSuggestionManagerWithErrorHandler:(id)a3
{
  remoteSuggestionManagerForTesting = self->_remoteSuggestionManagerForTesting;
  if (remoteSuggestionManagerForTesting)
  {
    v4 = remoteSuggestionManagerForTesting;
  }
  else
  {
    daemonConnectionFuture = self->_daemonConnectionFuture;
    id v7 = a3;
    id v8 = [(SGFuture *)daemonConnectionFuture wait];
    v9 = [(SGFuture *)self->_daemonConnectionFuture result];
    v4 = [v9 remoteObjectProxyWithErrorHandler:v7];
  }

  return v4;
}

- (SGMessagesDaemonConnection)initWithDaemonConnectionFuture:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMessagesDaemonConnection;
  v6 = [(SGMessagesDaemonConnection *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_daemonConnectionFuture, a3);
  }

  return v7;
}

@end
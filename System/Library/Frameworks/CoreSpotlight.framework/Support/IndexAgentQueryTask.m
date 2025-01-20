@interface IndexAgentQueryTask
- (BOOL)clientCanceled;
- (OS_xpc_object)clientConnection;
- (void)setClientCanceled:(BOOL)a3;
- (void)setClientConnection:(id)a3;
@end

@implementation IndexAgentQueryTask

- (OS_xpc_object)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (BOOL)clientCanceled
{
  return self->_clientCanceled;
}

- (void)setClientCanceled:(BOOL)a3
{
  self->_clientCanceled = a3;
}

- (void).cxx_destruct
{
}

@end
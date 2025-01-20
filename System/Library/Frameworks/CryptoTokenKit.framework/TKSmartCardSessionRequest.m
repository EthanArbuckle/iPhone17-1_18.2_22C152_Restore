@interface TKSmartCardSessionRequest
- (NSDictionary)parameters;
- (NSXPCConnection)connection;
- (id)reply;
- (void)setConnection:(id)a3;
- (void)setParameters:(id)a3;
- (void)setReply:(id)a3;
@end

@implementation TKSmartCardSessionRequest

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParameters:(id)a3
{
}

- (id)reply
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setReply:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong(&self->_reply, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
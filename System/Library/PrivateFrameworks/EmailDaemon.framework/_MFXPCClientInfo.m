@interface _MFXPCClientInfo
- (MFXPCClient)client;
- (NSXPCConnection)connection;
- (id)description;
- (void)setClient:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation _MFXPCClientInfo

- (id)description
{
  return [(MFXPCClient *)self->_client description];
}

- (MFXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end
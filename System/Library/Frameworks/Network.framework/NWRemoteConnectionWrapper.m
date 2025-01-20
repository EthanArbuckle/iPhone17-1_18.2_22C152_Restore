@interface NWRemoteConnectionWrapper
- (NSUUID)clientID;
- (NWConnection)connection;
- (void)setClientID:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation NWRemoteConnectionWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

- (void)setConnection:(id)a3
{
}

- (NWConnection)connection
{
  return (NWConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientID:(id)a3
{
}

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

@end
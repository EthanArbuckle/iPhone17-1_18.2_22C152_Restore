@interface ENRemoteUISession
- (ENXPCConnection)connection;
- (NSUUID)sessionID;
- (OS_xpc_object)originalRequest;
- (void)setConnection:(id)a3;
- (void)setOriginalRequest:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation ENRemoteUISession

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (ENXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (ENXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)originalRequest
{
  return self->_originalRequest;
}

- (void)setOriginalRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_destroyWeak((id *)&self->_connection);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
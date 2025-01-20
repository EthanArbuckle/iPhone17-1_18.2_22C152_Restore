@interface ANPlaybackSessionClient
+ (id)clientWithXPCConnection:(id)a3;
- (NSString)groupID;
- (NSString)sessionID;
- (NSUUID)endpointID;
- (NSXPCConnection)connection;
- (id)copy;
- (id)description;
- (void)setConnection:(id)a3;
- (void)setEndpointID:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation ANPlaybackSessionClient

+ (id)clientWithXPCConnection:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = [v5 UUIDString];
  [v4 setSessionID:v6];

  [v4 setConnection:v3];
  return v4;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(ANPlaybackSessionClient *)self connection];
  v5 = [(ANPlaybackSessionClient *)self sessionID];
  v6 = [(ANPlaybackSessionClient *)self groupID];
  v7 = [v3 stringWithFormat:@"Connection = %@, Session ID: = %@, Group ID = %@", v4, v5, v6];

  return v7;
}

- (id)copy
{
  id v3 = objc_opt_new();
  v4 = [(ANPlaybackSessionClient *)self connection];
  [v3 setConnection:v4];

  v5 = [(ANPlaybackSessionClient *)self sessionID];
  [v3 setSessionID:v5];

  v6 = [(ANPlaybackSessionClient *)self groupID];
  [v3 setGroupID:v6];

  v7 = [(ANPlaybackSessionClient *)self endpointID];
  [v3 setEndpointID:v7];

  return v3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSUUID)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
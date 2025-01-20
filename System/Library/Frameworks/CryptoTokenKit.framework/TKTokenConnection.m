@interface TKTokenConnection
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMapTable)sessions;
- (NSXPCListener)listener;
- (TKToken)token;
- (TKTokenConnection)initWithToken:(id)a3;
- (id)initialKeepAlive;
- (void)dealloc;
- (void)invalidate;
- (void)setInitialKeepAlive:(id)a3;
@end

@implementation TKTokenConnection

- (TKTokenConnection)initWithToken:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TKTokenConnection;
  v6 = [(TKTokenConnection *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    sessions = v7->_sessions;
    v7->_sessions = (NSMapTable *)v8;

    v10 = [(TKTokenConnection *)v7 token];
    v11 = [v10 tokenDriver];
    uint64_t v12 = [v11 keepAlive];
    id initialKeepAlive = v7->_initialKeepAlive;
    v7->_id initialKeepAlive = (id)v12;

    uint64_t v14 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v14;

    [(NSXPCListener *)v7->_listener setDelegate:v7];
    [(NSXPCListener *)v7->_listener resume];
  }

  return v7;
}

- (void)invalidate
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  v7 = [v5 interfaceWithProtocol:&unk_1F19FF8D8];
  [v6 setExportedInterface:v7];

  uint64_t v8 = [[TKTokenSessionConnection alloc] initWithTokenConnection:self];
  [v6 setExportedObject:v8];

  [v6 resume];
  return 1;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3 = [(TKTokenConnection *)self token];
  [v3 terminate];

  v4.receiver = self;
  v4.super_class = (Class)TKTokenConnection;
  [(TKTokenConnection *)&v4 dealloc];
}

- (TKToken)token
{
  return self->_token;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSMapTable)sessions
{
  return self->_sessions;
}

- (id)initialKeepAlive
{
  return self->_initialKeepAlive;
}

- (void)setInitialKeepAlive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialKeepAlive, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end
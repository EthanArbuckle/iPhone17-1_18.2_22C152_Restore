@interface GCIPCRemoteIncomingConnection
+ (id)sharedConnectionWorkloop;
- (GCIPCRemoteIncomingConnection)initWithConnection:(id)a3;
- (id)remoteProxy;
- (id)remoteProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteProxyWithErrorHandler:(id)a3;
@end

@implementation GCIPCRemoteIncomingConnection

+ (id)sharedConnectionWorkloop
{
  if (sharedConnectionWorkloop_onceToken != -1) {
    dispatch_once(&sharedConnectionWorkloop_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedConnectionWorkloop__workloop;

  return v2;
}

void __57__GCIPCRemoteIncomingConnection_sharedConnectionWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("CoreController.incoming-connection-workloop");
  v1 = (void *)sharedConnectionWorkloop__workloop;
  sharedConnectionWorkloop__workloop = (uint64_t)inactive;

  v2 = sharedConnectionWorkloop__workloop;

  dispatch_activate(v2);
}

- (GCIPCRemoteIncomingConnection)initWithConnection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCIPCRemoteIncomingConnection;
  v3 = [(GCIPCRemoteConnection *)&v8 initWithConnection:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(GCIPCRemoteConnection *)v3 connection];
    v6 = [(id)objc_opt_class() sharedConnectionWorkloop];
    [v5 _setQueue:v6];
  }
  return v4;
}

- (id)remoteProxy
{
  v2 = [(GCIPCRemoteConnection *)self connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)remoteProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(GCIPCRemoteConnection *)self connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)synchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(GCIPCRemoteConnection *)self connection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

@end
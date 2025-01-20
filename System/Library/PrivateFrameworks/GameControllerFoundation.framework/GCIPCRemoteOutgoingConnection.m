@interface GCIPCRemoteOutgoingConnection
+ (id)sharedConnectionWorkloop;
- (GCIPCRemoteOutgoingConnection)initWithConnection:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (id)remoteProxy;
- (id)remoteProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteProxyWithErrorHandler:(id)a3;
@end

@implementation GCIPCRemoteOutgoingConnection

+ (id)sharedConnectionWorkloop
{
  if (sharedConnectionWorkloop_onceToken_0 != -1) {
    dispatch_once(&sharedConnectionWorkloop_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedConnectionWorkloop__workloop_0;

  return v2;
}

void __57__GCIPCRemoteOutgoingConnection_sharedConnectionWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("CoreController.server-connection-workloop");
  v1 = (void *)sharedConnectionWorkloop__workloop_0;
  sharedConnectionWorkloop__workloop_0 = (uint64_t)inactive;

  v2 = sharedConnectionWorkloop__workloop_0;

  dispatch_activate(v2);
}

- (GCIPCRemoteOutgoingConnection)initWithConnection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCIPCRemoteOutgoingConnection;
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

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(GCIPCRemoteConnection *)self connection];
  v5 = [v4 serviceName];
  v6 = +[NSString stringWithFormat:@"<%@ service: '%@'>", v3, v5];

  return v6;
}

- (id)redactedDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(GCIPCRemoteConnection *)self connection];
  v5 = [v4 serviceName];
  v6 = +[NSString stringWithFormat:@"<%@ service: '%@'>", v3, v5];

  return v6;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(GCIPCRemoteConnection *)self connection];
  v5 = [v4 serviceName];
  v6 = +[NSString stringWithFormat:@"<%@ %p service: '%@'>", v3, self, v5];

  return v6;
}

@end
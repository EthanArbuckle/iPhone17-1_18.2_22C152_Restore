@interface CPLDaemonConnection
- (CPLDaemonConnection)init;
- (OS_dispatch_queue)queue;
- (id)proxyWithErrorHandler:(id)a3;
- (void)close;
- (void)dealloc;
@end

@implementation CPLDaemonConnection

- (CPLDaemonConnection)init
{
  v10.receiver = self;
  v10.super_class = (Class)CPLDaemonConnection;
  v2 = [(CPLDaemonConnection *)&v10 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.cloudphotod.daemon" options:0];
    v4 = CPLDaemonProcessInterface();
    [(NSXPCConnection *)v3 setRemoteObjectInterface:v4];

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cpl.daemon.connection", 0);
    [(NSXPCConnection *)v3 _setQueue:v5];

    connection = v2->_connection;
    v2->_connection = v3;

    uint64_t v7 = [(NSXPCConnection *)v2->_connection _queue];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CPLDaemonConnection;
  [(CPLDaemonConnection *)&v3 dealloc];
}

- (void)close
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  if (!connection) {
    sub_10001FF18((uint64_t)self, (uint64_t)a2);
  }
  uint64_t v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
@interface DCDeviceMetadataDaemonConnection
- (DCDeviceMetadataDaemonConnection)init;
- (id)connection;
- (id)remoteObjectProxy:(id)a3;
- (id)synchronousRemoteObjectProxy:(id)a3;
@end

@implementation DCDeviceMetadataDaemonConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connLock, 0);

  objc_storeStrong((id *)&self->_conn, 0);
}

- (id)synchronousRemoteObjectProxy:(id)a3
{
  id v4 = a3;
  v5 = [(DCDeviceMetadataDaemonConnection *)self connection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)connection
{
  [(NSLock *)self->_connLock lock];
  conn = self->_conn;
  if (!conn)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.devicecheckd" options:0];
    v5 = self->_conn;
    self->_conn = v4;

    objc_initWeak(&location, self);
    v6 = self->_conn;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __46__DCDeviceMetadataDaemonConnection_connection__block_invoke;
    v14[3] = &unk_264CE7220;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v6 setInvalidationHandler:v14];
    v7 = self->_conn;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__DCDeviceMetadataDaemonConnection_connection__block_invoke_2;
    v12[3] = &unk_264CE7220;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)v7 setInterruptionHandler:v12];
    v8 = self->_conn;
    v9 = +[DCDeviceMetadataInterface XPCInterface];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_conn resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    conn = self->_conn;
  }
  v10 = conn;
  [(NSLock *)self->_connLock unlock];

  return v10;
}

- (DCDeviceMetadataDaemonConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)DCDeviceMetadataDaemonConnection;
  v2 = [(DCDeviceMetadataDaemonConnection *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    connLock = v2->_connLock;
    v2->_connLock = v3;
  }
  return v2;
}

void __46__DCDeviceMetadataDaemonConnection_connection__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[2] lock];
    id v2 = v3[1];
    v3[1] = 0;

    [v3[2] unlock];
    WeakRetained = v3;
  }
}

void __46__DCDeviceMetadataDaemonConnection_connection__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[2] lock];
    id v2 = v3[1];
    v3[1] = 0;

    [v3[2] unlock];
    WeakRetained = v3;
  }
}

- (id)remoteObjectProxy:(id)a3
{
  id v4 = a3;
  v5 = [(DCDeviceMetadataDaemonConnection *)self connection];
  objc_super v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

@end
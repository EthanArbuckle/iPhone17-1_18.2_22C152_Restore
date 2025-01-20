@interface CDPDaemonConnection
- (CDPDaemonConnection)init;
- (NSXPCListenerEndpoint)daemonXPCEndpoint;
- (id)connection;
- (id)daemon;
- (id)daemonWithErrorHandler:(id)a3;
- (id)synchronousDaemonWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)setDaemonXPCEndpoint:(id)a3;
@end

@implementation CDPDaemonConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_connLock, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (CDPDaemonConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPDaemonConnection;
  v2 = [(CDPDaemonConnection *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    connLock = v2->_connLock;
    v2->_connLock = v3;
  }
  return v2;
}

- (id)daemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CDPDaemonConnection *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__CDPDaemonConnection_daemonWithErrorHandler___block_invoke;
  v9[3] = &unk_264316F68;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)connection
{
  [(NSLock *)self->_connLock lock];
  conn = self->_conn;
  if (!conn)
  {
    daemonXPCEndpoint = self->_daemonXPCEndpoint;
    id v5 = objc_alloc(MEMORY[0x263F08D68]);
    if (daemonXPCEndpoint) {
      id v6 = (NSXPCConnection *)[v5 initWithListenerEndpoint:self->_daemonXPCEndpoint];
    }
    else {
      id v6 = (NSXPCConnection *)[v5 initWithMachServiceName:@"com.apple.cdp.daemon" options:0];
    }
    v7 = self->_conn;
    self->_conn = v6;

    objc_initWeak(&location, self);
    v8 = self->_conn;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __33__CDPDaemonConnection_connection__block_invoke;
    v16[3] = &unk_264317EB8;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v8 setInvalidationHandler:v16];
    v9 = self->_conn;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __33__CDPDaemonConnection_connection__block_invoke_21;
    v14[3] = &unk_264317EB8;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v9 setInterruptionHandler:v14];
    id v10 = self->_conn;
    v11 = CDPDaemonExportedInterface();
    [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

    [(NSXPCConnection *)self->_conn resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    conn = self->_conn;
  }
  v12 = conn;
  [(NSLock *)self->_connLock unlock];
  return v12;
}

void __33__CDPDaemonConnection_connection__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__CDPDaemonConnection_connection__block_invoke_cold_1(v2);
  }

  if (WeakRetained)
  {
    [WeakRetained[2] lock];
    id v3 = WeakRetained[1];
    WeakRetained[1] = 0;

    [WeakRetained[2] unlock];
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_conn invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CDPDaemonConnection;
  [(CDPDaemonConnection *)&v3 dealloc];
}

void __33__CDPDaemonConnection_connection__block_invoke_21(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __33__CDPDaemonConnection_connection__block_invoke_21_cold_1(v2);
  }

  if (WeakRetained)
  {
    [WeakRetained[2] lock];
    id v3 = WeakRetained[1];
    WeakRetained[1] = 0;

    [WeakRetained[2] unlock];
  }
}

- (id)daemon
{
  id v3 = [(CDPDaemonConnection *)self connection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__CDPDaemonConnection_daemon__block_invoke;
  v6[3] = &unk_264317018;
  v6[4] = self;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

void __29__CDPDaemonConnection_daemon__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __29__CDPDaemonConnection_daemon__block_invoke_cold_1((uint64_t)v3, v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
}

void __46__CDPDaemonConnection_daemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)synchronousDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDaemonConnection *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__CDPDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_264316F68;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __57__CDPDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (NSXPCListenerEndpoint)daemonXPCEndpoint
{
  return self->_daemonXPCEndpoint;
}

- (void)setDaemonXPCEndpoint:(id)a3
{
}

void __33__CDPDaemonConnection_connection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Daemon connection invalidated!", v1, 2u);
}

void __33__CDPDaemonConnection_connection__block_invoke_21_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "Daemon connection interrupted!", v1, 2u);
}

void __29__CDPDaemonConnection_daemon__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "XPC Error from daemon: %@", (uint8_t *)&v2, 0xCu);
}

@end
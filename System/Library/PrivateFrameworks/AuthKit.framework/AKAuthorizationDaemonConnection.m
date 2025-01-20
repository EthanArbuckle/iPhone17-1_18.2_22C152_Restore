@interface AKAuthorizationDaemonConnection
- (AKAuthorizationDaemonConnection)init;
- (AKAuthorizationDaemonConnection)initWithListenerEndpoint:(id)a3 exportedInterface:(id)a4;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (id)_connection;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_connectionInterruptionHandler;
- (void)_connectionInvalidationHandler;
- (void)dealloc;
@end

@implementation AKAuthorizationDaemonConnection

- (AKAuthorizationDaemonConnection)init
{
  return [(AKAuthorizationDaemonConnection *)self initWithListenerEndpoint:0 exportedInterface:0];
}

- (AKAuthorizationDaemonConnection)initWithListenerEndpoint:(id)a3 exportedInterface:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationDaemonConnection;
  v9 = [(AKAuthorizationDaemonConnection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listenerEndpoint, a3);
    objc_storeStrong((id *)&v10->_contextManager, a4);
    v10->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)dealloc
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(AKCustodianDaemonConnection *)(uint64_t)self dealloc];
  }

  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationDaemonConnection;
  [(AKAuthorizationDaemonConnection *)&v5 dealloc];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AKAuthorizationDaemonConnection *)self _connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AKAuthorizationDaemonConnection *)self _connection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_connection
{
  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AKAuthorizationDaemonConnection__connection__block_invoke;
  v5[3] = &unk_1E575FA90;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  v3 = __46__AKAuthorizationDaemonConnection__connection__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_unfairLock);

  return v3;
}

id __46__AKAuthorizationDaemonConnection__connection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_initWeak(&location, v2);
    id v4 = *(id *)(*(void *)(a1 + 32) + 32);
    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    if (v4) {
      uint64_t v6 = [v5 initWithListenerEndpoint:v4];
    }
    else {
      uint64_t v6 = [v5 initWithMachServiceName:@"com.apple.ak.authorizationservices.xpc" options:0];
    }
    uint64_t v7 = v6;

    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    v10 = *(void **)(*(void *)(a1 + 32) + 16);
    v11 = +[AKAuthorizationDaemonInterface XPCInterface];
    [v10 setRemoteObjectInterface:v11];

    [*(id *)(*(void *)(a1 + 32) + 16) setExportedObject:*(void *)(*(void *)(a1 + 32) + 24)];
    objc_super v12 = *(void **)(*(void *)(a1 + 32) + 16);
    v13 = +[AKAuthorizationClientInterface XPCInterface];
    [v12 setExportedInterface:v13];

    v14 = *(void **)(*(void *)(a1 + 32) + 16);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46__AKAuthorizationDaemonConnection__connection__block_invoke_2;
    v19[3] = &unk_1E575EA98;
    objc_copyWeak(&v20, &location);
    [v14 setInterruptionHandler:v19];
    v15 = *(void **)(*(void *)(a1 + 32) + 16);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__AKAuthorizationDaemonConnection__connection__block_invoke_3;
    v17[3] = &unk_1E575EA98;
    objc_copyWeak(&v18, &location);
    [v15 setInvalidationHandler:v17];
    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }

  return v3;
}

void __46__AKAuthorizationDaemonConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterruptionHandler];
}

void __46__AKAuthorizationDaemonConnection__connection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidationHandler];
}

- (void)_connectionInterruptionHandler
{
  v2 = _AKLogSiwa();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AKCustodianDaemonConnection _connectionInterruptionHandler](v2);
  }
}

- (void)_connectionInvalidationHandler
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AKCustodianDaemonConnection _connectionInvalidationHandler](v3);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__AKAuthorizationDaemonConnection__connectionInvalidationHandler__block_invoke;
  v4[3] = &unk_1E575EA70;
  v4[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __65__AKAuthorizationDaemonConnection__connectionInvalidationHandler__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(&self->_unfairLock);
}

void __65__AKAuthorizationDaemonConnection__connectionInvalidationHandler__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_contextManager, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end
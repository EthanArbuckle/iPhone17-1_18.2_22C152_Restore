@interface AAAccountUserNotificationDaemonConnection
- (AAAccountUserNotificationDaemonConnection)init;
- (AAAccountUserNotificationDaemonConnection)initWithListenerEndpoint:(id)a3;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (id)_connection;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_connectionInterruptionHandler;
- (void)_connectionInvalidationHandler;
- (void)dealloc;
@end

@implementation AAAccountUserNotificationDaemonConnection

- (AAAccountUserNotificationDaemonConnection)init
{
  return [(AAAccountUserNotificationDaemonConnection *)self initWithListenerEndpoint:0];
}

- (AAAccountUserNotificationDaemonConnection)initWithListenerEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAAccountUserNotificationDaemonConnection;
  v6 = [(AAAccountUserNotificationDaemonConnection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v7->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"AAAccountUserNotificationDaemonConnection.m", 52, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v6 = [(AAAccountUserNotificationDaemonConnection *)self _connection];
  v7 = [v6 remoteObjectProxyWithErrorHandler:v5];

  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"AAAccountUserNotificationDaemonConnection.m", 57, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v6 = [(AAAccountUserNotificationDaemonConnection *)self _connection];
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v5];

  return v7;
}

- (id)_connection
{
  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke;
  v5[3] = &unk_1E5A48330;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  uint64_t v3 = __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_unfairLock);

  return v3;
}

id __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[2];
  if (!v3)
  {
    objc_initWeak(&location, v2);
    id v4 = *(id *)(*(void *)(a1 + 32) + 24);
    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    if (v4) {
      uint64_t v6 = [v5 initWithListenerEndpoint:v4];
    }
    else {
      uint64_t v6 = [v5 initWithMachServiceName:@"com.apple.aa.usernotifications.xpc" options:0];
    }
    uint64_t v7 = v6;

    uint64_t v8 = *(void *)(a1 + 32);
    objc_super v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    v10 = *(void **)(*(void *)(a1 + 32) + 16);
    v11 = +[AAAccountUserNotificationDaemonInterface XPCInterface];
    [v10 setRemoteObjectInterface:v11];

    v12 = *(void **)(*(void *)(a1 + 32) + 16);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke_2;
    v25[3] = &unk_1E5A48308;
    objc_copyWeak(&v26, &location);
    [v12 setInterruptionHandler:v25];
    v13 = *(void **)(*(void *)(a1 + 32) + 16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke_3;
    v23[3] = &unk_1E5A48308;
    objc_copyWeak(&v24, &location);
    [v13 setInvalidationHandler:v23];
    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }

  return v3;
}

void __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterruptionHandler];
}

void __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidationHandler];
}

- (void)_connectionInterruptionHandler
{
}

void __75__AAAccountUserNotificationDaemonConnection__connectionInterruptionHandler__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void)_connectionInvalidationHandler
{
}

void __75__AAAccountUserNotificationDaemonConnection__connectionInvalidationHandler__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __56__AAAccountUserNotificationDaemonConnection__connection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
@interface ACRemoteAccountStoreSession
- (ACRemoteAccountStoreSession)init;
- (ACRemoteAccountStoreSession)initWithListenerEndpoint:(id)a3;
- (BOOL)notificationsEnabled;
- (NSString)effectiveBundleID;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (id)_connection;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_locked_configureRemoteAccountStoreWithConnection:(id)a3;
- (void)_locked_connection:(id)a3 setEffectiveBundleID:(id)a4;
- (void)_locked_connection:(id)a3 setNotificationsEnabled:(BOOL)a4;
- (void)_setConnectionInterrupted;
- (void)_setConnectionInvalidated;
- (void)dealloc;
- (void)setEffectiveBundleID:(id)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
@end

@implementation ACRemoteAccountStoreSession

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(ACRemoteAccountStoreSession *)self _connection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_connection
{
  p_connectionLock = &self->_connectionLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v7 = __42__ACRemoteAccountStoreSession__connection__block_invoke;
  v8 = &unk_1E5BCE988;
  v9 = self;
  v3 = v6;
  os_unfair_lock_lock(p_connectionLock);
  id v4 = v7((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);

  return v4;
}

id __42__ACRemoteAccountStoreSession__connection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (!v3)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__ACRemoteAccountStoreSession__connection__block_invoke_2;
    v19[3] = &unk_1E5BCE960;
    v19[4] = v2;
    id v4 = (void (**)(void))MEMORY[0x1A626DA80](v19);
    uint64_t v5 = v4[2]();
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    v8 = +[ACRemoteAccountStoreInterface XPCInterface];
    [*(id *)(*(void *)(a1 + 32) + 8) setRemoteObjectInterface:v8];

    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA20C40];
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedInterface:v9];

    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:*(void *)(*(void *)(a1 + 32) + 24)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__ACRemoteAccountStoreSession__connection__block_invoke_3;
    v16[3] = &unk_1E5BCD248;
    objc_copyWeak(&v17, &location);
    [*(id *)(*(void *)(a1 + 32) + 8) setInterruptionHandler:v16];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __42__ACRemoteAccountStoreSession__connection__block_invoke_52;
    v14 = &unk_1E5BCD248;
    objc_copyWeak(&v15, &location);
    [*(id *)(*(void *)(a1 + 32) + 8) setInvalidationHandler:&v11];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "resume", v11, v12, v13, v14);
    objc_msgSend(*(id *)(a1 + 32), "_locked_configureRemoteAccountStoreWithConnection:", *(void *)(*(void *)(a1 + 32) + 8));
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }

  return v3;
}

ACTrackedXPCConnection *__42__ACRemoteAccountStoreSession__connection__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  v3 = [ACTrackedXPCConnection alloc];
  if (v2) {
    id v4 = [(ACTrackedXPCConnection *)v3 initWithListenerEndpoint:*(void *)(*(void *)(a1 + 32) + 40)];
  }
  else {
    id v4 = [(ACTrackedXPCConnection *)v3 initWithMachServiceName:@"com.apple.accountsd.accountmanager" options:0];
  }

  return v4;
}

- (ACRemoteAccountStoreSession)initWithListenerEndpoint:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACRemoteAccountStoreSession;
  uint64_t v6 = [(ACRemoteAccountStoreSession *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_connectionLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v7->_notificationsEnabled = 1;
    v8 = objc_alloc_init(ACAccountStoreClientSideListener);
    clientSideListener = v7->_clientSideListener;
    v7->_clientSideListener = v8;
  }
  return v7;
}

- (void)_locked_configureRemoteAccountStoreWithConnection:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"ACRemoteAccountStoreSession.m", 94, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  os_unfair_lock_assert_owner(&self->_connectionLock);
  id v5 = self->_effectiveBundleID;
  if (v5) {
    [(ACRemoteAccountStoreSession *)self _locked_connection:v7 setEffectiveBundleID:v5];
  }
  if (!self->_notificationsEnabled) {
    [(ACRemoteAccountStoreSession *)self _locked_connection:v7 setNotificationsEnabled:0];
  }
}

- (void)setEffectiveBundleID:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_effectiveBundleID isEqualToString:v4])
  {
    id v5 = (NSString *)[v4 copy];
    effectiveBundleID = self->_effectiveBundleID;
    self->_effectiveBundleID = v5;

    p_connectionLock = &self->_connectionLock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v10 = __52__ACRemoteAccountStoreSession_setEffectiveBundleID___block_invoke;
    objc_super v11 = &unk_1E5BCCD58;
    uint64_t v12 = self;
    id v13 = v4;
    v8 = v9;
    os_unfair_lock_lock(p_connectionLock);
    v10((uint64_t)v8);
    os_unfair_lock_unlock(p_connectionLock);
  }
}

void *__52__ACRemoteAccountStoreSession_setEffectiveBundleID___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  uint64_t v3 = result[1];
  if (v3) {
    return objc_msgSend(result, "_locked_connection:setEffectiveBundleID:", v3, *(void *)(a1 + 40));
  }
  return result;
}

- (void)dealloc
{
  clientSideListener = self->_clientSideListener;
  self->_clientSideListener = 0;

  [(NSXPCConnection *)self->_connection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)ACRemoteAccountStoreSession;
  [(ACRemoteAccountStoreSession *)&v4 dealloc];
}

- (void)_locked_connection:(id)a3 setEffectiveBundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ACRemoteAccountStoreSession.m", 153, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  os_unfair_lock_assert_owner(&self->_connectionLock);
  v9 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_65;
  v12[3] = &unk_1E5BCE9D8;
  id v13 = v8;
  id v10 = v8;
  [v9 setClientBundleID:v10 withHandler:v12];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ACRemoteAccountStoreSession *)self _connection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

void __42__ACRemoteAccountStoreSession__connection__block_invoke_52(uint64_t a1)
{
  uint64_t v2 = _ACLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A57C5000, v2, OS_LOG_TYPE_DEFAULT, "\"The connection to ACDAccountStore was invalidated.\"", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setConnectionInvalidated];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveBundleID, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_clientSideListener, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_65(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _ACLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_65_cold_1(a1, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_cold_1((uint64_t)v5, v7);
  }
}

- (ACRemoteAccountStoreSession)init
{
  return [(ACRemoteAccountStoreSession *)self initWithListenerEndpoint:0];
}

void __42__ACRemoteAccountStoreSession__connection__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _ACLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A57C5000, v2, OS_LOG_TYPE_DEFAULT, "\"The connection to ACDAccountStore was interrupted.\"", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setConnectionInterrupted];
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  if (self->_notificationsEnabled != a3)
  {
    self->_notificationsEnabled = a3;
    p_connectionLock = &self->_connectionLock;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    uint64_t v6 = __55__ACRemoteAccountStoreSession_setNotificationsEnabled___block_invoke;
    id v7 = &unk_1E5BCE9B0;
    id v8 = self;
    BOOL v9 = a3;
    id v4 = v5;
    os_unfair_lock_lock(p_connectionLock);
    v6((uint64_t)v4);
    os_unfair_lock_unlock(p_connectionLock);
  }
}

void *__55__ACRemoteAccountStoreSession_setNotificationsEnabled___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  uint64_t v3 = result[1];
  if (v3) {
    return objc_msgSend(result, "_locked_connection:setNotificationsEnabled:", v3, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)_setConnectionInterrupted
{
  p_connectionLock = &self->_connectionLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v5 = __56__ACRemoteAccountStoreSession__setConnectionInterrupted__block_invoke;
  uint64_t v6 = &unk_1E5BCD220;
  id v7 = self;
  uint64_t v3 = v4;
  os_unfair_lock_lock(p_connectionLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);
}

void __56__ACRemoteAccountStoreSession__setConnectionInterrupted__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)_setConnectionInvalidated
{
  p_connectionLock = &self->_connectionLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v5 = __56__ACRemoteAccountStoreSession__setConnectionInvalidated__block_invoke;
  uint64_t v6 = &unk_1E5BCD220;
  id v7 = self;
  uint64_t v3 = v4;
  os_unfair_lock_lock(p_connectionLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);
}

void __56__ACRemoteAccountStoreSession__setConnectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

void __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)_locked_connection:(id)a3 setNotificationsEnabled:(BOOL)a4
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"ACRemoteAccountStoreSession.m", 171, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  os_unfair_lock_assert_owner(&self->_connectionLock);
  uint64_t v6 = [v8 remoteObjectProxy];
  [v6 setNotificationsEnabled:0];
}

- (id)remoteObjectProxy
{
  id v2 = [(ACRemoteAccountStoreSession *)self _connection];
  uint64_t v3 = [v2 remoteObjectProxy];

  return v3;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (NSString)effectiveBundleID
{
  return self->_effectiveBundleID;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

void __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_ERROR, "\"Error setting the client's bundle ID: %@\"", (uint8_t *)&v2, 0xCu);
}

void __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_65_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_DEBUG, "\"Spoofed the client's bundle ID to: %@\"", (uint8_t *)&v3, 0xCu);
}

@end
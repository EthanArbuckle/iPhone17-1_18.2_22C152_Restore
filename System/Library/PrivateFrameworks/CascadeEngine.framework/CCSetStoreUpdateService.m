@interface CCSetStoreUpdateService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CCSetStoreUpdateService)initWithQueue:(id)a3;
@end

@implementation CCSetStoreUpdateService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x24C5B0A20]();
  v9 = [MEMORY[0x263F29E80] processWithXPCConnection:v7];
  v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 executableName];
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    __int16 v29 = 1024;
    int v30 = [v9 pid];
    _os_log_impl(&dword_249B69000, v10, OS_LOG_TYPE_DEFAULT, "Incoming connection from %{public}@(%d)", buf, 0x12u);
  }
  v12 = [MEMORY[0x263F29E58] policyForProcess:v9 connectionFlags:0 useCase:*MEMORY[0x263F29E30]];
  char v13 = [v12 allowsConnectionToSetStoreUpdateService];
  if (v13)
  {
    if (self->_eagerExitTimer)
    {
      v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v9 executableName];
        int v16 = [v9 pid];
        *(_DWORD *)buf = 138543618;
        v28 = v15;
        __int16 v29 = 1024;
        int v30 = v16;
        _os_log_impl(&dword_249B69000, v14, OS_LOG_TYPE_DEFAULT, "Resetting eager-exit timer for incoming connection from %{public}@(%d)", buf, 0x12u);
      }
      [(_PASSimpleCoalescingTimer *)self->_eagerExitTimer cancelPendingOperations];
    }
    v17 = [[CCSetStoreUpdateServiceExported alloc] initWithQueue:self->_queue process:v9 connection:v7 writeAccess:self->_writeAccess donateConnectionFactory:self->_donateConnectionFactory];
    v18 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDC2490];
    [v7 setExportedInterface:v18];

    [v7 setExportedObject:v17];
    v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDC76D8];
    [v7 setRemoteObjectInterface:v19];

    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __62__CCSetStoreUpdateService_listener_shouldAcceptNewConnection___block_invoke;
    v24 = &unk_265278238;
    v25 = self;
    id v26 = v9;
    [v7 setInvalidationHandler:&v21];
    objc_msgSend(v7, "resume", v21, v22, v23, v24, v25);
  }
  else
  {
    __biome_log_for_category();
    v17 = (CCSetStoreUpdateServiceExported *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR)) {
      -[CCSetStoreUpdateService listener:shouldAcceptNewConnection:](v9);
    }
  }

  return v13;
}

uint64_t __62__CCSetStoreUpdateService_listener_shouldAcceptNewConnection___block_invoke(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(result + 32) + 32))
  {
    uint64_t v1 = result;
    v2 = __biome_log_for_category();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [*(id *)(v1 + 40) executableName];
      int v4 = [*(id *)(v1 + 40) pid];
      int v5 = 138543874;
      id v6 = v3;
      __int16 v7 = 1024;
      int v8 = v4;
      __int16 v9 = 2048;
      uint64_t v10 = 10;
      _os_log_impl(&dword_249B69000, v2, OS_LOG_TYPE_DEFAULT, "Connection from %{public}@(%d) was invalidated, will attempt to eager exit in %lu seconds if there are no more connections", (uint8_t *)&v5, 0x1Cu);
    }
    return [*(id *)(*(void *)(v1 + 32) + 32) runAfterDelaySeconds:1 coalescingBehavior:10.0];
  }
  return result;
}

- (CCSetStoreUpdateService)initWithQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CCSetStoreUpdateService;
  id v6 = [(CCSetStoreUpdateService *)&v19 init];
  __int16 v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [MEMORY[0x263F316E0] defaultInstance];
    writeAccess = v7->_writeAccess;
    v7->_writeAccess = (CCDataResourceWriteAccess *)v8;

    uint64_t v10 = [[CCDonateRequestManager alloc] initWithWriteAccess:v7->_writeAccess];
    donateRequestManager = v7->_donateRequestManager;
    v7->_donateRequestManager = v10;

    v12 = [[CCDonateConnectionFactory alloc] initWithRequestManager:v7->_donateRequestManager];
    donateConnectionFactory = v7->_donateConnectionFactory;
    v7->_donateConnectionFactory = v12;

    if ([MEMORY[0x263F29E68] platform] == 7)
    {
      v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_249B69000, v14, OS_LOG_TYPE_DEFAULT, "CCSetStoreUpdateService is running on HomePod, will attempt to eager exit after handling each connection", v18, 2u);
      }

      uint64_t v15 = [objc_alloc(MEMORY[0x263F61E98]) initWithQueue:v7->_queue operation:&__block_literal_global_3];
      eagerExitTimer = v7->_eagerExitTimer;
      v7->_eagerExitTimer = (_PASSimpleCoalescingTimer *)v15;
    }
  }

  return v7;
}

uint64_t __41__CCSetStoreUpdateService_initWithQueue___block_invoke()
{
  v0 = __biome_log_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_249B69000, v0, OS_LOG_TYPE_DEFAULT, "Eager-exit coalescing timer fired, will attempt to exit when clean", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eagerExitTimer, 0);
  objc_storeStrong((id *)&self->_donateConnectionFactory, 0);
  objc_storeStrong((id *)&self->_donateRequestManager, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  v2 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_0_3(&dword_249B69000, v3, v4, "Refusing connection from %{public}@(%d), process not properly entitled", v5, v6, v7, v8, 2u);
}

@end
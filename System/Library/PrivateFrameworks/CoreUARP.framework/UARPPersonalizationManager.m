@interface UARPPersonalizationManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcConnectionHasEntitlement:(id)a3;
- (UARPPersonalizationManager)initWithMachServiceName:(id)a3 entitlement:(id)a4 delegate:(id)a5 queue:(id)a6;
- (void)dealloc;
- (void)getOutstandingPersonalizationRequests:(id)a3 reply:(id)a4;
- (void)personalizationResponse:(id)a3 updaterName:(id)a4;
@end

@implementation UARPPersonalizationManager

- (UARPPersonalizationManager)initWithMachServiceName:(id)a3 entitlement:(id)a4 delegate:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)UARPPersonalizationManager;
  v14 = [(UARPPersonalizationManager *)&v25 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v12);
    objc_storeStrong((id *)&v15->_queue, a6);
    uint64_t v16 = [v10 copy];
    serviceName = v15->_serviceName;
    v15->_serviceName = (NSString *)v16;

    uint64_t v18 = [v11 copy];
    entitlement = v15->_entitlement;
    v15->_entitlement = (NSString *)v18;

    os_log_t v20 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
    log = v15->_log;
    v15->_log = (OS_os_log *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v15->_serviceName];
    listener = v15->_listener;
    v15->_listener = (NSXPCListener *)v22;

    [(NSXPCListener *)v15->_listener setDelegate:v15];
    [(NSXPCListener *)v15->_listener activate];
  }

  return v15;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UARPPersonalizationManager;
  [(UARPPersonalizationManager *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [v7 processIdentifier];
    *(_DWORD *)buf = 67109120;
    int v22 = v9;
    _os_log_impl(&dword_21E079000, (os_log_t)v8, OS_LOG_TYPE_INFO, "Connection from PID %d", buf, 8u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_2644926C8;
  block[4] = self;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v11 = v7;
  dispatch_sync(queue, block);
  BOOL v12 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) xpcConnectionHasEntitlement:*(void *)(a1 + 40)])
  {
    v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF036D8];
    [*(id *)(a1 + 40) setExportedInterface:v2];

    [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 32)];
    int v3 = [*(id *)(a1 + 40) processIdentifier];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2;
    v9[3] = &unk_2644926A0;
    v4 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    int v10 = v3;
    [v4 setInterruptionHandler:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_11;
    v7[3] = &unk_2644926A0;
    v5 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    int v8 = v3;
    [v5 setInvalidationHandler:v7];
    [*(id *)(a1 + 40) _setQueue:*(void *)(*(void *)(a1 + 32) + 16)];
    [*(id *)(a1 + 40) resume];
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = v3;
      _os_log_impl(&dword_21E079000, v6, OS_LOG_TYPE_INFO, "New connection from PID %d", buf, 8u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(a1, v2);
  }
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_11(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_21E079000, v2, OS_LOG_TYPE_INFO, "Connection from PID %d invalidated", (uint8_t *)v4, 8u);
  }
}

- (BOOL)xpcConnectionHasEntitlement:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPPersonalizationManager xpcConnectionHasEntitlement:](log, v4);
  }
  id v6 = [v4 valueForEntitlement:self->_entitlement];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    BOOL v7 = 1;
  }
  else
  {
    int v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[UARPPersonalizationManager xpcConnectionHasEntitlement:](v8, v4);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)getOutstandingPersonalizationRequests:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[UARPPersonalizationManager getOutstandingPersonalizationRequests:reply:]";
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v10 = [WeakRetained personalizationHelperQueryPendingTssRequests:v6];

  id v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[UARPPersonalizationManager getOutstandingPersonalizationRequests:reply:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "%s: Updater Name %@, pending tss requests %@", (uint8_t *)&v12, 0x20u);
  }
  v7[2](v7, v10);
}

- (void)personalizationResponse:(id)a3 updaterName:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "-[UARPPersonalizationManager personalizationResponse:updaterName:]";
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: Updater Name %@", (uint8_t *)&v11, 0x16u);
  }
  int v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "-[UARPPersonalizationManager personalizationResponse:updaterName:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_21E079000, v9, OS_LOG_TYPE_INFO, "%s: TSS Response %@", (uint8_t *)&v11, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained personalizationHelperTssResponse:v6 updaterName:v7];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Connection to PID %d interrupted", (uint8_t *)v3, 8u);
}

- (void)xpcConnectionHasEntitlement:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 processIdentifier];
  OUTLINED_FUNCTION_0_5(&dword_21E079000, v4, v5, "Connection from PID %d does not have the correct entitlement", v6, v7, v8, v9, 0);
}

- (void)xpcConnectionHasEntitlement:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 processIdentifier];
  OUTLINED_FUNCTION_0_5(&dword_21E079000, v4, v5, "Connection from PID %d checking entitlement", v6, v7, v8, v9, 0);
}

@end
@interface BLSHDiagnosticsServer
+ (BLSHDiagnosticsServer)serverWithFlipbookDiagnosticsProvider:(id)a3;
+ (id)domainSpecification;
- (BLSHDiagnosticsServer)initWithFlipbookDiagnosticsProvider:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation BLSHDiagnosticsServer

+ (BLSHDiagnosticsServer)serverWithFlipbookDiagnosticsProvider:(id)a3
{
  id v3 = a3;
  v4 = [[BLSHDiagnosticsServer alloc] initWithFlipbookDiagnosticsProvider:v3];
  v5 = bls_diagnostics_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[BLSHDiagnosticsServer serverWithFlipbookDiagnosticsProvider:]();
  }

  return v4;
}

+ (id)domainSpecification
{
  if (domainSpecification_onceToken_1 != -1) {
    dispatch_once(&domainSpecification_onceToken_1, &__block_literal_global_22);
  }
  v2 = (void *)domainSpecification_domain_1;

  return v2;
}

void __44__BLSHDiagnosticsServer_domainSpecification__block_invoke()
{
  v0 = [MEMORY[0x263F2BA00] bootstrapConfiguration];
  v1 = [MEMORY[0x263F299E8] identifier];
  v2 = [v0 domainsContainingServiceIdentifier:v1];

  uint64_t v3 = [v2 anyObject];
  v4 = (void *)domainSpecification_domain_1;
  domainSpecification_domain_1 = v3;

  v5 = [MEMORY[0x263F2B9C0] defaultShellMachName];
  v6 = [v0 domainForMachName:v5];

  if (v6) {
    BOOL v7 = v6 == (void *)domainSpecification_domain_1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v8 = bls_diagnostics_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __44__BLSHDiagnosticsServer_domainSpecification__block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
}

- (BLSHDiagnosticsServer)initWithFlipbookDiagnosticsProvider:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BLSHDiagnosticsServer;
  v6 = [(BLSHDiagnosticsServer *)&v27 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_flipbookDiagnosticsProvider, a3);
    v8 = +[BLSHDiagnosticsServer domainSpecification];
    if (v8)
    {
      v9 = bls_diagnostics_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        [(BLSHDiagnosticsServer *)(uint64_t)v7 initWithFlipbookDiagnosticsProvider:v9];
      }

      v10 = [MEMORY[0x263F299E8] serviceQuality];
      v11 = [MEMORY[0x263F29C50] serial];
      v12 = objc_msgSend(v11, "serviceClass:relativePriority:", objc_msgSend(v10, "serviceClass"), objc_msgSend(v10, "relativePriority"));
      uint64_t v13 = BSDispatchQueueCreate();
      callbackQueue = v7->_callbackQueue;
      v7->_callbackQueue = (OS_dispatch_queue *)v13;

      v15 = (void *)MEMORY[0x263F2B9E0];
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      v23 = __61__BLSHDiagnosticsServer_initWithFlipbookDiagnosticsProvider___block_invoke;
      v24 = &unk_264532838;
      id v25 = v8;
      v16 = v7;
      v26 = v16;
      uint64_t v17 = [v15 listenerWithConfigurator:&v21];
      serviceListener = v16->_serviceListener;
      v16->_serviceListener = (BSServiceConnectionListener *)v17;

      v19 = bls_diagnostics_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        [(BLSHDiagnosticsServer *)(uint64_t)v16 initWithFlipbookDiagnosticsProvider:v19];
      }

      [(BSServiceConnectionListener *)v16->_serviceListener activate];
    }
  }
  return v7;
}

void __61__BLSHDiagnosticsServer_initWithFlipbookDiagnosticsProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setDomain:v5];

  v6 = [MEMORY[0x263F299E8] identifier];
  [v4 setService:v6];

  uint64_t v8 = *(void *)(a1 + 40);
  BOOL v7 = (uint64_t *)(a1 + 40);
  [v4 setDelegate:v8];

  v9 = bls_diagnostics_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __61__BLSHDiagnosticsServer_initWithFlipbookDiagnosticsProvider___block_invoke_cold_1(v7, v9);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke;
  v12 = &unk_264532888;
  uint64_t v13 = self;
  id v7 = v6;
  id v14 = v7;
  [v7 configureConnection:&v9];
  objc_msgSend(v7, "activate", v9, v10, v11, v12, v13);
  uint64_t v8 = bls_diagnostics_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BLSHDiagnosticsServer listener:didReceiveConnection:withContext:]();
  }
}

void __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = [[BLSHDiagnosticsHostPeer alloc] initWithFlipbookDiagnosticsProvider:*(void *)(*(void *)(a1 + 32) + 8) peer:*(void *)(a1 + 40)];
  id v4 = [MEMORY[0x263F299E8] serviceQuality];
  [v3 setServiceQuality:v4];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  id v5 = [MEMORY[0x263F299E8] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:v12[5]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_8;
  v8[3] = &unk_264532860;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  uint64_t v10 = &v11;
  id v9 = v6;
  [v3 setInvalidationHandler:v8];
  id v7 = bls_diagnostics_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_cold_1();
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1)
{
  v2 = bls_diagnostics_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_8_cold_1();
  }

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  return [*(id *)(a1 + 40) invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);

  objc_storeStrong((id *)&self->_flipbookDiagnosticsProvider, 0);
}

+ (void)serverWithFlipbookDiagnosticsProvider:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "did startServer:%{public}@ withFlipbookDiagnosticsProvider:%{public}@");
}

void __44__BLSHDiagnosticsServer_domainSpecification__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = domainSpecification_domain_1;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "if we own the defaultShellMachName:%{public}@ then BacklightServices.diagnostics must be registered there not:%@", (uint8_t *)&v2, 0x16u);
}

- (void)initWithFlipbookDiagnosticsProvider:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, (uint64_t)a2, a3, "%p diagnostics init with listener:%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)initWithFlipbookDiagnosticsProvider:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 identifier];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ init with diagnostics domain:%{public}@", (uint8_t *)&v6, 0x16u);
}

void __61__BLSHDiagnosticsServer_initWithFlipbookDiagnosticsProvider___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%p did config diagnostics server", (uint8_t *)&v3, 0xCu);
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p did activate diagnostics peer:%{public}@");
}

void __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p did configure diagnostics connection:%{public}@");
}

void __67__BLSHDiagnosticsServer_listener_didReceiveConnection_withContext___block_invoke_8_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_21FCFC000, v1, OS_LOG_TYPE_DEBUG, "%p did invalidate diagnostics connection for interfaceTarget:%{public}@", v2, 0x16u);
}

@end
@interface BLSHXPCAssertionServiceHostServer
+ (id)domainSpecification;
+ (id)serverWithLocalAssertionService:(id)a3;
- (BLSHXPCAssertionServiceHostServer)initWithLocalAssertionService:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation BLSHXPCAssertionServiceHostServer

+ (id)serverWithLocalAssertionService:(id)a3
{
  id v3 = a3;
  v4 = [[BLSHXPCAssertionServiceHostServer alloc] initWithLocalAssertionService:v3];
  v5 = bls_assertions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[BLSHXPCAssertionServiceHostServer serverWithLocalAssertionService:]();
  }

  return v4;
}

+ (id)domainSpecification
{
  if (domainSpecification_onceToken_0 != -1) {
    dispatch_once(&domainSpecification_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)domainSpecification_domain_0;

  return v2;
}

void __56__BLSHXPCAssertionServiceHostServer_domainSpecification__block_invoke()
{
  v0 = [MEMORY[0x263F2BA00] bootstrapConfiguration];
  v1 = [MEMORY[0x263F29AF0] identifier];
  v2 = [v0 domainsContainingServiceIdentifier:v1];

  uint64_t v3 = [v2 anyObject];
  v4 = (void *)domainSpecification_domain_0;
  domainSpecification_domain_0 = v3;

  v5 = [MEMORY[0x263F2B9C0] defaultShellMachName];
  v6 = [v0 domainForMachName:v5];

  if (v6) {
    BOOL v7 = v6 == (void *)domainSpecification_domain_0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v8 = bls_assertions_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __56__BLSHXPCAssertionServiceHostServer_domainSpecification__block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
}

- (BLSHXPCAssertionServiceHostServer)initWithLocalAssertionService:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BLSHXPCAssertionServiceHostServer;
  v6 = [(BLSHXPCAssertionServiceHostServer *)&v28 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localAssertionService, a3);
    v8 = +[BLSHXPCAssertionServiceHostServer domainSpecification];
    v9 = bls_assertions_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(BLSHXPCBacklightProxyHostServer *)(uint64_t)v7 initWithLocalBacklightProxy:v9];
    }

    v10 = [MEMORY[0x263F29AF0] serviceQuality];
    v11 = [MEMORY[0x263F29C50] serial];
    v12 = objc_msgSend(v11, "serviceClass:relativePriority:", objc_msgSend(v10, "serviceClass"), objc_msgSend(v10, "relativePriority"));
    uint64_t v13 = BSDispatchQueueCreate();
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)MEMORY[0x263F2B9E0];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __67__BLSHXPCAssertionServiceHostServer_initWithLocalAssertionService___block_invoke;
    v25 = &unk_264532838;
    id v16 = v8;
    id v26 = v16;
    v17 = v7;
    v27 = v17;
    uint64_t v18 = [v15 listenerWithConfigurator:&v22];
    serviceListener = v17->_serviceListener;
    v17->_serviceListener = (BSServiceConnectionListener *)v18;

    v20 = bls_assertions_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      [(BLSHXPCBacklightProxyHostServer *)(uint64_t)v17 initWithLocalBacklightProxy:v20];
    }

    [(BSServiceConnectionListener *)v17->_serviceListener activate];
  }

  return v7;
}

void __67__BLSHXPCAssertionServiceHostServer_initWithLocalAssertionService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setDomain:v5];

  v6 = [MEMORY[0x263F29AF0] identifier];
  [v4 setService:v6];

  uint64_t v8 = *(void *)(a1 + 40);
  BOOL v7 = (uint64_t *)(a1 + 40);
  [v4 setDelegate:v8];

  v9 = bls_assertions_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __63__BLSHXPCBacklightProxyHostServer_initWithLocalBacklightProxy___block_invoke_cold_1(v7, v9);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __79__BLSHXPCAssertionServiceHostServer_listener_didReceiveConnection_withContext___block_invoke;
  v12 = &unk_264532888;
  uint64_t v13 = self;
  id v7 = v6;
  id v14 = v7;
  [v7 configureConnection:&v9];
  objc_msgSend(v7, "activate", v9, v10, v11, v12, v13);
  uint64_t v8 = bls_assertions_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BLSHXPCBacklightProxyHostServer listener:didReceiveConnection:withContext:]();
  }
}

void __79__BLSHXPCAssertionServiceHostServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  id v16 = [[BLSHXPCAssertionServiceHost alloc] initWithLocalService:*(void *)(*(void *)(a1 + 32) + 8) peer:*(void *)(a1 + 40)];
  id v4 = [MEMORY[0x263F29AF0] serviceQuality];
  [v3 setServiceQuality:v4];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  id v5 = [MEMORY[0x263F29AF0] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:v12[5]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__BLSHXPCAssertionServiceHostServer_listener_didReceiveConnection_withContext___block_invoke_8;
  v8[3] = &unk_264532860;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  uint64_t v10 = &v11;
  id v9 = v6;
  [v3 setInvalidationHandler:v8];
  id v7 = bls_assertions_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_cold_1();
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __79__BLSHXPCAssertionServiceHostServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1)
{
  v2 = bls_assertions_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_8_cold_1();
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

  objc_storeStrong((id *)&self->_localAssertionService, 0);
}

+ (void)serverWithLocalAssertionService:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "did startServer:%{public}@ withLocalAssertionService:%{public}@");
}

void __56__BLSHXPCAssertionServiceHostServer_domainSpecification__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = domainSpecification_domain_0;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "if we own the defaultShellMachName:%{public}@ then BacklightServices.assertions must be registered there not:%@", (uint8_t *)&v2, 0x16u);
}

@end
@interface BLSHXPCBacklightProxyHostServer
+ (BLSHXPCBacklightProxyHostServer)serverWithLocalBacklightProxy:(id)a3;
+ (id)domainSpecification;
- (BLSHXPCBacklightProxyHostServer)initWithLocalBacklightProxy:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation BLSHXPCBacklightProxyHostServer

+ (BLSHXPCBacklightProxyHostServer)serverWithLocalBacklightProxy:(id)a3
{
  id v3 = a3;
  v4 = [[BLSHXPCBacklightProxyHostServer alloc] initWithLocalBacklightProxy:v3];
  v5 = bls_backlight_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[BLSHXPCBacklightProxyHostServer serverWithLocalBacklightProxy:]();
  }

  return v4;
}

+ (id)domainSpecification
{
  if (domainSpecification_onceToken != -1) {
    dispatch_once(&domainSpecification_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)domainSpecification_domain;

  return v2;
}

void __54__BLSHXPCBacklightProxyHostServer_domainSpecification__block_invoke()
{
  v0 = [MEMORY[0x263F2BA00] bootstrapConfiguration];
  v1 = [MEMORY[0x263F29AF8] identifier];
  v2 = [v0 domainsContainingServiceIdentifier:v1];

  uint64_t v3 = [v2 anyObject];
  v4 = (void *)domainSpecification_domain;
  domainSpecification_domain = v3;

  v5 = [MEMORY[0x263F2B9C0] defaultShellMachName];
  v6 = [v0 domainForMachName:v5];

  if (v6) {
    BOOL v7 = v6 == (void *)domainSpecification_domain;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v8 = bls_backlight_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __54__BLSHXPCBacklightProxyHostServer_domainSpecification__block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
}

- (BLSHXPCBacklightProxyHostServer)initWithLocalBacklightProxy:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BLSHXPCBacklightProxyHostServer;
  v6 = [(BLSHXPCBacklightProxyHostServer *)&v28 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localBacklightProxy, a3);
    v8 = +[BLSHXPCBacklightProxyHostServer domainSpecification];
    v9 = bls_backlight_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(BLSHXPCBacklightProxyHostServer *)(uint64_t)v7 initWithLocalBacklightProxy:v9];
    }

    v10 = [MEMORY[0x263F29AF8] serviceQuality];
    v11 = [MEMORY[0x263F29C50] serial];
    v12 = objc_msgSend(v11, "serviceClass:relativePriority:", objc_msgSend(v10, "serviceClass"), objc_msgSend(v10, "relativePriority"));
    uint64_t v13 = BSDispatchQueueCreate();
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)MEMORY[0x263F2B9E0];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __63__BLSHXPCBacklightProxyHostServer_initWithLocalBacklightProxy___block_invoke;
    v25 = &unk_264532838;
    id v16 = v8;
    id v26 = v16;
    v17 = v7;
    v27 = v17;
    uint64_t v18 = [v15 listenerWithConfigurator:&v22];
    serviceListener = v17->_serviceListener;
    v17->_serviceListener = (BSServiceConnectionListener *)v18;

    v20 = bls_backlight_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      [(BLSHXPCBacklightProxyHostServer *)(uint64_t)v17 initWithLocalBacklightProxy:v20];
    }

    [(BSServiceConnectionListener *)v17->_serviceListener activate];
  }

  return v7;
}

void __63__BLSHXPCBacklightProxyHostServer_initWithLocalBacklightProxy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setDomain:v5];

  v6 = [MEMORY[0x263F29AF8] identifier];
  [v4 setService:v6];

  uint64_t v8 = *(void *)(a1 + 40);
  BOOL v7 = (uint64_t *)(a1 + 40);
  [v4 setDelegate:v8];

  v9 = bls_backlight_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __63__BLSHXPCBacklightProxyHostServer_initWithLocalBacklightProxy___block_invoke_cold_1(v7, v9);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke;
  v12 = &unk_264532888;
  uint64_t v13 = self;
  id v7 = v6;
  id v14 = v7;
  [v7 configureConnection:&v9];
  objc_msgSend(v7, "activate", v9, v10, v11, v12, v13);
  uint64_t v8 = bls_backlight_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BLSHXPCBacklightProxyHostServer listener:didReceiveConnection:withContext:]();
  }
}

void __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = [[BLSHXPCBacklightProxyHost alloc] initWithLocalBacklightProxy:*(void *)(*(void *)(a1 + 32) + 8) peer:*(void *)(a1 + 40)];
  id v4 = [MEMORY[0x263F29AF8] serviceQuality];
  [v3 setServiceQuality:v4];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  id v5 = [MEMORY[0x263F29AF8] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:v12[5]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_8;
  v8[3] = &unk_264532860;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  uint64_t v10 = &v11;
  id v9 = v6;
  [v3 setInvalidationHandler:v8];
  id v7 = bls_backlight_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_cold_1();
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1)
{
  v2 = bls_backlight_log();
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

  objc_storeStrong((id *)&self->_localBacklightProxy, 0);
}

+ (void)serverWithLocalBacklightProxy:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "did startServer:%{public}@ withLocalBacklightProxy:%{public}@");
}

void __54__BLSHXPCBacklightProxyHostServer_domainSpecification__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = domainSpecification_domain;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "if we own the defaultShellMachName:%{public}@ then BacklightServices.backlight must be registered there not:%@", (uint8_t *)&v2, 0x16u);
}

- (void)initWithLocalBacklightProxy:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, (uint64_t)a2, a3, "%p init with listener:%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)initWithLocalBacklightProxy:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 identifier];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ init with domain:%{public}@", (uint8_t *)&v6, 0x16u);
}

void __63__BLSHXPCBacklightProxyHostServer_initWithLocalBacklightProxy___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%p did config", (uint8_t *)&v3, 0xCu);
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p did activate peer:%{public}@");
}

void __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p did configure connection:%{public}@");
}

void __77__BLSHXPCBacklightProxyHostServer_listener_didReceiveConnection_withContext___block_invoke_8_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_21FCFC000, v1, OS_LOG_TYPE_DEBUG, "%p did invalidate connection for interfaceTarget:%{public}@", v2, 0x16u);
}

@end
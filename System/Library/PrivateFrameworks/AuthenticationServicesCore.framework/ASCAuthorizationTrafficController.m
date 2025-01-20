@interface ASCAuthorizationTrafficController
+ (ASCAuthorizationTrafficController)sharedInstance;
+ (BOOL)_appWithAppIdentifierIsWebBrowser:(id)a3;
- (ASCAuthorizationTrafficController)init;
- (void)beginAuthorizationForApplicationIdentifier:(id)a3 token:(id)a4 withClearanceHandler:(id)a5;
- (void)cancelAuthorizationForAppIdentifierIfNecessary:(id)a3 token:(id)a4;
- (void)endAuthorizationForAppIdentifier:(id)a3 token:(id)a4 clearanceHandler:(id)a5;
@end

@implementation ASCAuthorizationTrafficController

+ (ASCAuthorizationTrafficController)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return (ASCAuthorizationTrafficController *)v2;
}

uint64_t __51__ASCAuthorizationTrafficController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ASCAuthorizationTrafficController);

  return MEMORY[0x270F9A758]();
}

- (ASCAuthorizationTrafficController)init
{
  v13.receiver = self;
  v13.super_class = (Class)ASCAuthorizationTrafficController;
  v2 = [(ASCAuthorizationTrafficController *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    appsWithActiveRequests = v2->_appsWithActiveRequests;
    v2->_appsWithActiveRequests = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationClearanceQueue", 0);
    clearanceQueue = v2->_clearanceQueue;
    v2->_clearanceQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationTrafficQueue", 0);
    trafficQueue = v2->_trafficQueue;
    v2->_trafficQueue = (OS_dispatch_queue *)v7;

    v9 = [[_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager alloc] initWithNumberOfOperationsBeforeTriggeringBackoff:1 minimumCooldownDurationSeconds:10.0];
    backoffManager = v2->_backoffManager;
    v2->_backoffManager = v9;

    v11 = v2;
  }

  return v2;
}

+ (BOOL)_appWithAppIdentifierIsWebBrowser:(id)a3
{
  uint64_t v9 = 0;
  v3 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:a3 error:&v9];
  v4 = v3;
  if (v3)
  {
    dispatch_queue_t v5 = [v3 entitlements];
    v6 = [v5 objectForKey:@"com.apple.developer.web-browser" ofClass:objc_opt_class()];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)beginAuthorizationForApplicationIdentifier:(id)a3 token:(id)a4 withClearanceHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__0;
  v21[4] = __Block_byref_object_dispose__0;
  id v22 = 0;
  trafficQueue = self->_trafficQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke;
  block[3] = &unk_26439F3C0;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  v20 = v21;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(trafficQueue, block);

  _Block_object_dispose(v21, 8);
}

void __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    if ((objc_msgSend(MEMORY[0x263F086E0], "safari_isSafariFamilyBundleIdentifier:") & 1) != 0
      || +[ASCAuthorizationTrafficController _appWithAppIdentifierIsWebBrowser:*(void *)(a1 + 32)])
    {
      int v2 = 0;
    }
    else
    {
      id v14 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:*(void *)(a1 + 32)];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        id v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F08338];
        v31 = @"Request already in progress for specified application identifier.";
        v17 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        uint64_t v18 = [v16 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v17];
        uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
        v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        char v4 = 0;
        goto LABEL_15;
      }
      int v2 = 1;
    }
    id v3 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (!v3)
    {
      id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [*(id *)(*(void *)(a1 + 40) + 8) setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    [v3 addObject:*(void *)(a1 + 48)];

    if (!v2)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v12 = *(void **)(v10 + 32);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_2;
      v24[3] = &unk_26439F350;
      v24[4] = v10;
      id v25 = *(id *)(a1 + 56);
      [v12 performAfterBackoffForContext:v11 completionHandler:v24];
      id v13 = v25;
LABEL_16:

      return;
    }
    char v4 = 1;
LABEL_15:
    v21 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_24;
    block[3] = &unk_26439F398;
    id v22 = *(id *)(a1 + 56);
    char v29 = v4;
    uint64_t v23 = *(void *)(a1 + 64);
    id v27 = v22;
    uint64_t v28 = v23;
    dispatch_async(v21, block);
    id v13 = v27;
    goto LABEL_16;
  }
  dispatch_queue_t v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_cold_1(v5);
  }
  uint64_t v6 = *(void *)(a1 + 56);
  char v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v32 = *MEMORY[0x263F08338];
  v33[0] = @"No application identifier specified for authorization request.";
  id v8 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  id v9 = [v7 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:1 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v9);
}

uint64_t __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_3;
  block[3] = &unk_26439F008;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endAuthorizationForAppIdentifier:(id)a3 token:(id)a4 clearanceHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  trafficQueue = self->_trafficQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __93__ASCAuthorizationTrafficController_endAuthorizationForAppIdentifier_token_clearanceHandler___block_invoke;
  v15[3] = &unk_26439F3E8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(trafficQueue, v15);
}

void __93__ASCAuthorizationTrafficController_endAuthorizationForAppIdentifier_token_clearanceHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if ([v2 containsObject:*(void *)(a1 + 48)])
  {
    [v2 removeObject:*(void *)(a1 + 48)];
    if (![v2 count]) {
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__ASCAuthorizationTrafficController_endAuthorizationForAppIdentifier_token_clearanceHandler___block_invoke_2;
  block[3] = &unk_26439F008;
  id v5 = *(id *)(a1 + 56);
  dispatch_async(v3, block);
}

uint64_t __93__ASCAuthorizationTrafficController_endAuthorizationForAppIdentifier_token_clearanceHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelAuthorizationForAppIdentifierIfNecessary:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    trafficQueue = self->_trafficQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__ASCAuthorizationTrafficController_cancelAuthorizationForAppIdentifierIfNecessary_token___block_invoke;
    block[3] = &unk_26439F150;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(trafficQueue, block);
  }
}

void __90__ASCAuthorizationTrafficController_cancelAuthorizationForAppIdentifierIfNecessary_token___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  if ([v2 containsObject:a1[6]])
  {
    [v2 removeObject:a1[6]];
    if (![v2 count]) {
      [*(id *)(a1[4] + 8) setObject:0 forKeyedSubscript:a1[5]];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffManager, 0);
  objc_storeStrong((id *)&self->_trafficQueue, 0);
  objc_storeStrong((id *)&self->_clearanceQueue, 0);

  objc_storeStrong((id *)&self->_appsWithActiveRequests, 0);
}

void __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_219326000, log, OS_LOG_TYPE_FAULT, "Could not fetch bundle identifier for client process.", v1, 2u);
}

@end
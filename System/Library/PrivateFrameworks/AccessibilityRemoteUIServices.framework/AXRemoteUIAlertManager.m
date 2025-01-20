@interface AXRemoteUIAlertManager
+ (id)sharedInstance;
- (NSMutableDictionary)remoteCallbackHolders;
- (id)_init;
- (void)_sbs_presentRemoteUIAlertWithIdentifier:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5 presentationHandler:(id)a6 dismissalHandler:(id)a7;
- (void)presentRemoteUIAlertWithIdentifier:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5 presentationHandler:(id)a6 dismissalHandler:(id)a7;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setRemoteCallbackHolders:(id)a3;
@end

@implementation AXRemoteUIAlertManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __40__AXRemoteUIAlertManager_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = [[AXRemoteUIAlertManager alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)AXRemoteUIAlertManager;
  v2 = [(AXRemoteUIAlertManager *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(AXRemoteUIAlertManager *)v2 setRemoteCallbackHolders:v3];
  }
  return v2;
}

- (void)presentRemoteUIAlertWithIdentifier:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5 presentationHandler:(id)a6 dismissalHandler:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void *))a7;
  v17 = [(AXRemoteUIAlertManager *)self remoteCallbackHolders];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    id v33 = v14;
    id v34 = v13;
    id v35 = v12;
    v19 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v20 = [(AXRemoteUIAlertManager *)self remoteCallbackHolders];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v26 = [(AXRemoteUIAlertManager *)self remoteCallbackHolders];
          v27 = [v26 objectForKeyedSubscript:v25];

          v28 = [v27 remoteAlertHandle];
          [v28 invalidate];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v22);
    }

    id v29 = v19;
    AXPerformBlockOnMainThread();
    AXPerformBlockOnMainThread();
    if (v16)
    {
      v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08320];
      v41 = @"dismissing existing remote UI alert";
      v31 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v32 = [v30 errorWithDomain:@"com.apple.AccessibilityRemoteUIServices" code:-110 userInfo:v31];
      v16[2](v16, v32);
    }
    id v13 = v34;
    id v12 = v35;
    id v14 = v33;
  }
  else
  {
    [(AXRemoteUIAlertManager *)self _sbs_presentRemoteUIAlertWithIdentifier:v12 viewControllerClassName:v13 userInfo:v14 presentationHandler:v15 dismissalHandler:v16];
  }
}

void __131__AXRemoteUIAlertManager_presentRemoteUIAlertWithIdentifier_viewControllerClassName_userInfo_presentationHandler_dismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        v8 = objc_msgSend(*(id *)(a1 + 40), "remoteCallbackHolders", (void)v14);
        v9 = [v8 objectForKeyedSubscript:v7];

        v10 = [v9 dismissalHandler];

        if (v10)
        {
          v11 = [v9 dismissalHandler];
          id v12 = (void (**)(void, void))[v11 copy];

          v12[2](v12, 0);
        }
        id v13 = [*(id *)(a1 + 40) remoteCallbackHolders];
        [v13 removeObjectForKey:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

void __131__AXRemoteUIAlertManager_presentRemoteUIAlertWithIdentifier_viewControllerClassName_userInfo_presentationHandler_dismissalHandler___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteCallbackHolders];
  [v1 removeAllObjects];
}

- (void)_sbs_presentRemoteUIAlertWithIdentifier:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5 presentationHandler:(id)a6 dismissalHandler:(id)a7
{
  v28[2] = *MEMORY[0x263EF8340];
  id v12 = (objc_class *)MEMORY[0x263F79410];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = (void *)[[v12 alloc] initWithServiceName:v17 viewControllerClassName:v16];

  id v19 = objc_alloc_init(MEMORY[0x263F79408]);
  v20 = (void *)[MEMORY[0x263F79428] newHandleWithDefinition:v18 configurationContext:v19];
  [v20 registerObserver:self];
  uint64_t v21 = [v20 handleID];
  id v22 = objc_alloc_init(MEMORY[0x263F793F8]);
  id v23 = (id)MEMORY[0x263EFFA78];
  if (v15) {
    id v23 = v15;
  }
  v27[0] = @"userInfo";
  v27[1] = @"handleId";
  v28[0] = v23;
  v28[1] = v21;
  v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v22 setUserInfo:v24];

  uint64_t v25 = objc_opt_new();
  [v25 setPresentationHandler:v14];

  [v25 setDismissalHandler:v13];
  [v25 setRemoteAlertHandle:v20];
  v26 = [(AXRemoteUIAlertManager *)self remoteCallbackHolders];
  [v26 setObject:v25 forKeyedSubscript:v21];

  [v20 activateWithContext:v22];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v4 = [a3 handleID];
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __55__AXRemoteUIAlertManager_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteCallbackHolders];
  id v5 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = [v5 presentationHandler];

  if (v3)
  {
    uint64_t v4 = [v5 presentationHandler];
    v4[2](v4, 0);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v4 = [a3 handleID];
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __57__AXRemoteUIAlertManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteCallbackHolders];
  id v7 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = [v7 dismissalHandler];

  if (v3)
  {
    uint64_t v4 = [v7 dismissalHandler];
    id v5 = (void (**)(void, void))[v4 copy];

    v5[2](v5, 0);
  }
  uint64_t v6 = [*(id *)(a1 + 32) remoteCallbackHolders];
  [v6 removeObjectForKey:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)remoteCallbackHolders
{
  return self->_remoteCallbackHolders;
}

- (void)setRemoteCallbackHolders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
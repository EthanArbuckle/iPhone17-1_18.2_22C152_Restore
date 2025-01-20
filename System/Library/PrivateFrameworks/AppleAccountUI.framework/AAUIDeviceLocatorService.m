@interface AAUIDeviceLocatorService
+ (id)sharedInstance;
- (AAUIDeviceLocatorService)init;
- (BOOL)isChangingState;
- (BOOL)isEnabled;
- (BOOL)isStateKnown;
- (BOOL)shouldEnable;
- (void)_updateStateAndNotify:(BOOL)a3 completion:(id)a4;
- (void)disableInContext:(unint64_t)a3 withWipeToken:(id)a4;
- (void)disableInContext:(unint64_t)a3 withWipeToken:(id)a4 completion:(id)a5;
- (void)enableInContext:(unint64_t)a3;
- (void)enableInContext:(unint64_t)a3 completion:(id)a4;
- (void)refreshCurrentState:(id)a3;
- (void)setShouldEnable:(BOOL)a3;
@end

@implementation AAUIDeviceLocatorService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___service;
  return v2;
}

void __42__AAUIDeviceLocatorService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AAUIDeviceLocatorService);
  v1 = (void *)sharedInstance___service;
  sharedInstance___service = (uint64_t)v0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = (const void *)sharedInstance___service;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F3CC80];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_AAUIHandleFMIPStateChange, v4, 0, (CFNotificationSuspensionBehavior)0);
}

- (AAUIDeviceLocatorService)init
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIDeviceLocatorService;
  v2 = [(AAUIDeviceLocatorService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.accounts.dls.update", v3);
    stateUpdateQueue = v2->_stateUpdateQueue;
    v2->_stateUpdateQueue = (OS_dispatch_queue *)v4;

    v2->_lastKnownState = 4;
  }
  return v2;
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasAttemptedToFetchState)
  {
    BOOL v3 = v2->_lastKnownState - 1 < 2;
  }
  else
  {
    [(AAUIDeviceLocatorService *)v2 _updateStateAndNotify:1 completion:0];
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isChangingState
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasAttemptedToFetchState)
  {
    BOOL v3 = (v2->_lastKnownState & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else
  {
    BOOL v3 = 1;
    [(AAUIDeviceLocatorService *)v2 _updateStateAndNotify:1 completion:0];
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isStateKnown
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_lastKnownState != 4;
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateStateAndNotify:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke;
  aBlock[3] = &unk_263F92828;
  BOOL v15 = a3;
  aBlock[4] = self;
  id v14 = v6;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  stateUpdateQueue = self->_stateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke_2;
  block[3] = &unk_263F92048;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(stateUpdateQueue, block);
}

uint64_t __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  *(void *)(*(void *)(a1 + 32) + 8) = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"AADeviceLocatorStateDidChange" object:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke_2(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Refreshing FMiP state...", buf, 2u);
  }

  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  BOOL v3 = [MEMORY[0x263F3CC60] sharedInstance];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke_6;
  v5[3] = &unk_263F92850;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 fmipStateWithCompletion:v5];
}

void __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "findmydeviced provided FMiP state %lu and error %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
}

- (void)refreshCurrentState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__AAUIDeviceLocatorService_refreshCurrentState___block_invoke;
  v6[3] = &unk_263F92878;
  id v7 = v4;
  id v5 = v4;
  [(AAUIDeviceLocatorService *)self _updateStateAndNotify:1 completion:v6];
}

uint64_t __48__AAUIDeviceLocatorService_refreshCurrentState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableInContext:(unint64_t)a3
{
}

- (void)enableInContext:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  stateUpdateQueue = self->_stateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__AAUIDeviceLocatorService_enableInContext_completion___block_invoke;
  block[3] = &unk_263F928A0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(stateUpdateQueue, block);
}

void __55__AAUIDeviceLocatorService_enableInContext_completion___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(void *)(a1[4] + 8) = 1;
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = (void *)a1[6];
    int v8 = 134217984;
    __int16 v9 = v3;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Dispatching request to enable FMiP with context %lu", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [MEMORY[0x263F3CC60] sharedInstance];
  id v5 = [v4 enableFMIPInContext:a1[6]];

  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    __int16 v9 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Request to enable FMiP completed with error: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = a1[5];
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v5 == 0);
  }
}

- (void)disableInContext:(unint64_t)a3 withWipeToken:(id)a4
{
}

- (void)disableInContext:(unint64_t)a3 withWipeToken:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (![v8 length])
  {
    uint64_t v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "OOPS: The disable-FMiP request came in with an empty token. This will not end well.", buf, 2u);
    }
  }
  stateUpdateQueue = self->_stateUpdateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__AAUIDeviceLocatorService_disableInContext_withWipeToken_completion___block_invoke;
  block[3] = &unk_263F928A0;
  id v16 = v9;
  unint64_t v17 = a3;
  id v15 = v8;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(stateUpdateQueue, block);
}

void __70__AAUIDeviceLocatorService_disableInContext_withWipeToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = v3;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Dispatching request to disable FMiP with context %lu", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263F3CC60] sharedInstance];
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__AAUIDeviceLocatorService_disableInContext_withWipeToken_completion___block_invoke_8;
  v7[3] = &unk_263F928C8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v4 disableFMIPUsingToken:v6 inContext:v5 completion:v7];
}

void __70__AAUIDeviceLocatorService_disableInContext_withWipeToken_completion___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Request to disable FMiP completed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 != 0);
  }
}

- (void)setShouldEnable:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_wantsToEnable = a3;
  objc_sync_exit(obj);
}

- (BOOL)shouldEnable
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL wantsToEnable = v2->_wantsToEnable;
  objc_sync_exit(v2);

  return wantsToEnable;
}

- (void).cxx_destruct
{
}

@end
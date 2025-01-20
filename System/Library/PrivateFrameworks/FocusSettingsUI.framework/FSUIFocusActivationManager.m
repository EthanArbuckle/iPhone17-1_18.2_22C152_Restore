@interface FSUIFocusActivationManager
+ (id)sharedInstance;
- (BOOL)isActiveMode:(id)a3;
- (FSUIFocusActivationManager)init;
- (id)_modeSelectionService;
- (void)_notifyListenersOfActiveModeAssertionChange:(id)a3;
- (void)addListenerForFocusActivationChanges:(id)a3;
- (void)dealloc;
- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5;
- (void)removeListenerForFocusActivationChanges:(id)a3;
- (void)setMode:(id)a3 isActive:(BOOL)a4;
@end

@implementation FSUIFocusActivationManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__FSUIFocusActivationManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __44__FSUIFocusActivationManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (FSUIFocusActivationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)FSUIFocusActivationManager;
  v2 = [(FSUIFocusActivationManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(FSUIFocusActivationManager *)v2 _modeSelectionService];
    modeSelectionService = v3->_modeSelectionService;
    v3->_modeSelectionService = (DNDModeSelectionService *)v4;

    [(DNDModeSelectionService *)v3->_modeSelectionService addListener:v3 withCompletionHandler:&__block_literal_global];
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    listeners = v3->_listeners;
    v3->_listeners = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.donotdisturb.FCUIFocusActivationManager", v8);
    listenersQueue = v3->_listenersQueue;
    v3->_listenersQueue = (OS_dispatch_queue *)v9;
  }
  return v3;
}

void __34__FSUIFocusActivationManager_init__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __34__FSUIFocusActivationManager_init__block_invoke_cold_1((uint64_t)v4);
  }
}

- (void)dealloc
{
  v3 = [(FSUIFocusActivationManager *)self _modeSelectionService];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)FSUIFocusActivationManager;
  [(FSUIFocusActivationManager *)&v4 dealloc];
}

- (BOOL)isActiveMode:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    latestModeAssertion = v5->_latestModeAssertion;
    if (!latestModeAssertion)
    {
      modeSelectionService = v5->_modeSelectionService;
      id v16 = 0;
      uint64_t v8 = [(DNDModeSelectionService *)modeSelectionService activeModeAssertionWithError:&v16];
      id v9 = v16;
      v10 = v5->_latestModeAssertion;
      v5->_latestModeAssertion = (DNDModeAssertion *)v8;

      latestModeAssertion = v5->_latestModeAssertion;
    }
    v11 = [(DNDModeAssertion *)latestModeAssertion details];
    objc_super v12 = [v11 modeIdentifier];
    v13 = [v4 modeIdentifier];
    char v14 = [v12 isEqualToString:v13];
  }
  else
  {
    char v14 = 0;
  }
  objc_sync_exit(v5);

  return v14;
}

- (void)setMode:(id)a3 isActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F3A778]);
    [v7 setIdentifier:@"com.apple.FocusSettings"];
    uint64_t v8 = [v12 modeIdentifier];
    [v7 setModeIdentifier:v8];

    [v7 setReason:1];
    id v9 = [MEMORY[0x263F3A6E8] lifetimeUntilEndOfScheduleWithIdentifier:*MEMORY[0x263F3A678]];
    [v7 setLifetime:v9];
  }
  else
  {
    id v7 = 0;
  }
  v10 = [(FSUIFocusActivationManager *)v6 _modeSelectionService];
  [v10 activateModeWithDetails:v7 error:0];

  latestModeAssertion = v6->_latestModeAssertion;
  v6->_latestModeAssertion = 0;

  objc_sync_exit(v6);
}

- (void)addListenerForFocusActivationChanges:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  listenersQueue = self->_listenersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__FSUIFocusActivationManager_addListenerForFocusActivationChanges___block_invoke;
  block[3] = &unk_264585280;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listenersQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__FSUIFocusActivationManager_addListenerForFocusActivationChanges___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[3] addObject:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (void)removeListenerForFocusActivationChanges:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  listenersQueue = self->_listenersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__FSUIFocusActivationManager_removeListenerForFocusActivationChanges___block_invoke;
  block[3] = &unk_264585280;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listenersQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__FSUIFocusActivationManager_removeListenerForFocusActivationChanges___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_220D02000, &_os_log_internal, OS_LOG_TYPE_INFO, "Did receive updated active mode assertion", v12, 2u);
  }
  objc_storeStrong((id *)&v11->_latestModeAssertion, a4);
  [(FSUIFocusActivationManager *)v11 _notifyListenersOfActiveModeAssertionChange:v9];
  objc_sync_exit(v11);
}

- (void)_notifyListenersOfActiveModeAssertionChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  listenersQueue = self->_listenersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__FSUIFocusActivationManager__notifyListenersOfActiveModeAssertionChange___block_invoke;
  block[3] = &unk_264585280;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listenersQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __74__FSUIFocusActivationManager__notifyListenersOfActiveModeAssertionChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = WeakRetained[3];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v9, "didUpdateActiveModesForActivationManager:assertion:", v3, *(void *)(a1 + 32), (void)v10);
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (id)_modeSelectionService
{
  modeSelectionService = self->_modeSelectionService;
  if (!modeSelectionService)
  {
    id v4 = [MEMORY[0x263F3A748] serviceForClientIdentifier:@"com.apple.FocusSettings"];
    uint64_t v5 = self->_modeSelectionService;
    self->_modeSelectionService = v4;

    modeSelectionService = self->_modeSelectionService;
  }
  return modeSelectionService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenersQueue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_latestModeAssertion, 0);
  objc_storeStrong((id *)&self->_modeSelectionService, 0);
}

void __34__FSUIFocusActivationManager_init__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_220D02000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to connect to the mode selection service with error: %@", (uint8_t *)&v1, 0xCu);
}

@end
@interface CSDaemon
+ (id)_sharedInstance;
+ (id)run;
- (BOOL)_shouldRunSafeguards;
- (BOOL)runInternalOnly;
- (CSContextStore)contextStore;
- (CSRestrictionDataProvider)restrictionDataProvider;
- (CSRestrictionManager)restrictionsManager;
- (OS_dispatch_queue)mainQueue;
- (id)_init;
- (void)_start;
- (void)setContextStore:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setRestrictionDataProvider:(id)a3;
- (void)setRestrictionsManager:(id)a3;
- (void)setRunInternalOnly:(BOOL)a3;
- (void)updateContextForIdentifier:(id)a3 withState:(id)a4;
@end

@implementation CSDaemon

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)CSDaemon;
  v2 = [(CSDaemon *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_runInternalOnly = 1;
    uint64_t v4 = getMainQueue();
    mainQueue = v3->_mainQueue;
    v3->_mainQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken_0 != -1) {
    dispatch_once(&_sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)_sharedInstance___sharedInstance_0;
  return v2;
}

uint64_t __27__CSDaemon__sharedInstance__block_invoke()
{
  _sharedInstance___sharedInstance_0 = [[CSDaemon alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (void)_start
{
  BOOL v3 = [(CSDaemon *)self _shouldRunSafeguards];
  uint64_t v4 = +[CSLogger defaultCategory];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24A698000, v4, OS_LOG_TYPE_DEFAULT, "Starting Compute Safeguards System", buf, 2u);
    }

    mainQueue = self->_mainQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __18__CSDaemon__start__block_invoke;
    block[3] = &unk_26528B0A8;
    block[4] = self;
    dispatch_async(mainQueue, block);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24A698000, v4, OS_LOG_TYPE_DEFAULT, "Could not start the Safeguards System", buf, 2u);
    }
  }
}

uint64_t __18__CSDaemon__start__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = +[CSContextStore sharedInstance];
  [v2 setContextStore:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  BOOL v5 = objc_alloc_init(CSRestrictionDataProvider);
  [v4 setRestrictionDataProvider:v5];

  v6 = *(void **)(a1 + 32);
  objc_super v7 = [v6 restrictionDataProvider];
  v8 = +[CSRestrictionManager sharedInstanceWithDataProvider:v7];
  [v6 setRestrictionsManager:v8];

  v9 = +[CSLogger defaultCategory];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [*(id *)(a1 + 32) restrictionsManager];
    int v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_24A698000, v9, OS_LOG_TYPE_INFO, "Created restrictionsManager: %@", (uint8_t *)&v12, 0xCu);
  }
  return +[CSViolationHandlerService run];
}

- (BOOL)_shouldRunSafeguards
{
  if (_os_feature_enabled_impl())
  {
    if (!self->_runInternalOnly || (isInternalBuild() & 1) != 0) {
      return 1;
    }
    uint64_t v4 = +[CSLogger defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      BOOL v5 = "Not an internal build, Safeguards are currenlty internal-only";
      v6 = (uint8_t *)&v7;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = +[CSLogger defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      BOOL v5 = "Safeguards are disabled";
      v6 = (uint8_t *)&v8;
LABEL_9:
      _os_log_impl(&dword_24A698000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }

  return 0;
}

+ (id)run
{
  if (run_onceToken_0 != -1) {
    dispatch_once(&run_onceToken_0, &__block_literal_global_9);
  }
  return +[CSDaemon _sharedInstance];
}

void __15__CSDaemon_run__block_invoke()
{
  id v0 = +[CSDaemon _sharedInstance];
  [v0 _start];
}

- (void)updateContextForIdentifier:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mainQueue = self->_mainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CSDaemon_updateContextForIdentifier_withState___block_invoke;
  block[3] = &unk_26528B180;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mainQueue, block);
}

void __49__CSDaemon_updateContextForIdentifier_withState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contextStore];
  [v2 updateState:*(void *)(a1 + 40) forIdentifier:*(void *)(a1 + 48)];
}

- (BOOL)runInternalOnly
{
  return self->_runInternalOnly;
}

- (void)setRunInternalOnly:(BOOL)a3
{
  self->_runInternalOnly = a3;
}

- (OS_dispatch_queue)mainQueue
{
  return self->_mainQueue;
}

- (void)setMainQueue:(id)a3
{
}

- (CSRestrictionDataProvider)restrictionDataProvider
{
  return self->_restrictionDataProvider;
}

- (void)setRestrictionDataProvider:(id)a3
{
}

- (CSRestrictionManager)restrictionsManager
{
  return self->_restrictionsManager;
}

- (void)setRestrictionsManager:(id)a3
{
}

- (CSContextStore)contextStore
{
  return self->_contextStore;
}

- (void)setContextStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_restrictionsManager, 0);
  objc_storeStrong((id *)&self->_restrictionDataProvider, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
}

@end
@interface DAPriorityManager
+ (id)sharedManager;
+ (void)vendPriorityManagers;
- (DAPriorityManager)init;
- (NSMapTable)clientsToPriorityRequests;
- (NSMutableDictionary)cachedAppState;
- (RBSProcessMonitor)processMonitor;
- (id)appIDsToDataclasses;
- (id)stateString;
- (int)_recalculatePriority;
- (int)currentPriority;
- (int64_t)foregroundDataclasses;
- (void)_setForegroundDataclasses:(int64_t)a3;
- (void)_setNewPriority;
- (void)_updateForegroundDataclasses;
- (void)appWithBundleID:(id)a3 isNowRunningAndVisible:(BOOL)a4;
- (void)bumpDataclassesToUIPriority:(int64_t)a3;
- (void)dealloc;
- (void)requestPriority:(int)a3 forClient:(id)a4 dataclasses:(int64_t)a5;
- (void)setCachedAppState:(id)a3;
- (void)setClientsToPriorityRequests:(id)a3;
- (void)setForegroundDataclasses:(int64_t)a3;
- (void)setProcessMonitor:(id)a3;
- (void)setupProcessStateMonitor;
@end

@implementation DAPriorityManager

+ (void)vendPriorityManagers
{
  sVendPriorityManagers = 1;
}

+ (id)sharedManager
{
  if (sVendPriorityManagers == 1)
  {
    if (sharedManager_onceToken != -1) {
      dispatch_once(&sharedManager_onceToken, &__block_literal_global_14);
    }
    id v2 = (id)sharedManager_sSharedDAPriorityManager;
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __34__DAPriorityManager_sharedManager__block_invoke()
{
  sharedManager_sSharedDAPriorityManager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (id)appIDsToDataclasses
{
  if (appIDsToDataclasses_onceToken != -1) {
    dispatch_once(&appIDsToDataclasses_onceToken, &__block_literal_global_14_0);
  }
  id v2 = (void *)appIDsToDataclasses_sAppIDsToDataclasses;
  return v2;
}

void __40__DAPriorityManager_appIDsToDataclasses__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57868];
  v2[1] = @"com.apple.MobileAddressBook";
  v3[0] = &unk_1F13E5848;
  v3[1] = &unk_1F13E5860;
  v2[2] = @"com.apple.mobilephone";
  v2[3] = @"com.apple.mobilenotes";
  v3[2] = &unk_1F13E5860;
  v3[3] = &unk_1F13E5878;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)appIDsToDataclasses_sAppIDsToDataclasses;
  appIDsToDataclasses_sAppIDsToDataclasses = v0;
}

- (void)appWithBundleID:(id)a3 isNowRunningAndVisible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_cachedAppState objectForKeyedSubscript:v6];
  int v8 = [v7 BOOLValue];

  v9 = [NSNumber numberWithBool:v4];
  [(NSMutableDictionary *)self->_cachedAppState setObject:v9 forKeyedSubscript:v6];

  if (v8 != v4) {
    [(DAPriorityManager *)self _updateForegroundDataclasses];
  }
  v10 = DALoggingwithCategory();
  os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v10, v11))
  {
    int64_t foregroundDataclasses = self->_foregroundDataclasses;
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    __int16 v17 = 2048;
    int64_t v18 = foregroundDataclasses;
    _os_log_impl(&dword_1BA384000, v10, v11, "App state changed; %@ now has foreground status: %{BOOL}i. Foreground dataclasses are 0x%lx",
      (uint8_t *)&v13,
      0x1Cu);
  }
}

- (void)_updateForegroundDataclasses
{
  int64_t foregroundDataclasses = self->_foregroundDataclasses;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  BOOL v4 = [(DAPriorityManager *)self appIDsToDataclasses];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__DAPriorityManager__updateForegroundDataclasses__block_invoke;
  v6[3] = &unk_1E6211EC0;
  v6[4] = self;
  v6[5] = &v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  int64_t v5 = v8[3];
  if (v5 != foregroundDataclasses)
  {
    self->_int64_t foregroundDataclasses = v5;
    [(DAPriorityManager *)self _setNewPriority];
  }
  _Block_object_dispose(&v7, 8);
}

void __49__DAPriorityManager__updateForegroundDataclasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  int64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:a2];
  int v6 = [v5 BOOLValue];

  if (v6) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= (int)[v7 intValue];
  }
}

- (DAPriorityManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)DAPriorityManager;
  id v2 = [(DAPriorityManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithWeakToStrongObjects];
    clientsToPriorityRequests = v2->_clientsToPriorityRequests;
    v2->_clientsToPriorityRequests = (NSMapTable *)v3;

    id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
    int v6 = [(DAPriorityManager *)v2 appIDsToDataclasses];
    uint64_t v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
    cachedAppState = v2->_cachedAppState;
    v2->_cachedAppState = (NSMutableDictionary *)v7;

    [(DAPriorityManager *)v2 setupProcessStateMonitor];
    char v12 = 0;
    uint64_t v9 = SBSSpringBoardServerPort();
    MEMORY[0x1BA9E9F10](v9, &sDeviceIsLocked, &v12);
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_30);
    }
    notify_register_dispatch((const char *)*MEMORY[0x1E4FA77B8], &init_notifToken, (dispatch_queue_t)init_SBLockQueue, &__block_literal_global_34);
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__setNewPriority name:@"SBLockStateChanged" object:0];

    v2->_currentPriority = 0x80000000;
    [(DAPriorityManager *)v2 _setNewPriority];
  }
  return v2;
}

uint64_t __25__DAPriorityManager_init__block_invoke()
{
  init_SBLockQueue = (uint64_t)dispatch_queue_create("com.apple.dataaccessd.sblockqueue", 0);
  return MEMORY[0x1F41817F8]();
}

void __25__DAPriorityManager_init__block_invoke_2()
{
  uint64_t state64 = 0;
  notify_get_state(init_notifToken, &state64);
  sDeviceIsLocked = state64 != 0;
  uint64_t v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBLockStateChanged" object:0];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBLockStateChanged" object:0];

  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  v4.receiver = self;
  v4.super_class = (Class)DAPriorityManager;
  [(DAPriorityManager *)&v4 dealloc];
}

- (void)setupProcessStateMonitor
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x1E4F96418];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__DAPriorityManager_setupProcessStateMonitor__block_invoke;
  v6[3] = &unk_1E6211F30;
  objc_copyWeak(&v7, &location);
  objc_super v4 = [v3 monitorWithConfiguration:v6];
  processMonitor = self->_processMonitor;
  self->_processMonitor = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __45__DAPriorityManager_setupProcessStateMonitor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = [MEMORY[0x1E4F96448] descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&unk_1F13E5890];
  [v3 setStateDescriptor:v4];
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained appIDsToDataclasses];
  int v8 = [v7 allKeys];

  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * v13)];
        [v9 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [v3 setPredicates:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__DAPriorityManager_setupProcessStateMonitor__block_invoke_2;
  v15[3] = &unk_1E6211F08;
  objc_copyWeak(&v16, v5);
  [v3 setUpdateHandler:v15];
  objc_destroyWeak(&v16);
}

void __45__DAPriorityManager_setupProcessStateMonitor__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 state];
  int v9 = [v8 taskState];

  id v10 = [v7 state];

  uint64_t v11 = [v10 endowmentNamespaces];

  unsigned int v12 = [v11 containsObject:@"com.apple.frontboard.visibility"];
  uint64_t v13 = [v6 bundle];
  id v14 = [v13 identifier];

  if (v14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v16 = WeakRetained;
    if (v9 == 4) {
      uint64_t v17 = v12;
    }
    else {
      uint64_t v17 = 0;
    }
    [WeakRetained appWithBundleID:v14 isNowRunningAndVisible:v17];
  }
  else
  {
    id v16 = DALoggingwithCategory();
    os_log_type_t v18 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v16, v18))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1BA384000, v16, v18, "Ignoring an update for a process (%@) without a bundle identifier", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)_setForegroundDataclasses:(int64_t)a3
{
  self->_int64_t foregroundDataclasses = a3;
}

- (id)stateString
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  objc_super v4 = self;
  objc_sync_enter(v4);
  id v5 = [(DAPriorityManager *)v4 clientsToPriorityRequests];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [v3 appendString:@"------\nDAPriorityManager: \n"];
    id v7 = [(DAPriorityManager *)v4 clientsToPriorityRequests];
    int v8 = [v7 keyEnumerator];
    int v9 = 0;
    while (1)
    {

      uint64_t v10 = [v8 nextObject];

      if (!v10) {
        break;
      }
      uint64_t v11 = [(DAPriorityManager *)v4 clientsToPriorityRequests];
      id v7 = [v11 objectForKey:v10];

      if (([v7 refreshDataclasses] & 0x7F) == 0)
      {
        int v9 = (void *)v10;
        if (([v7 UIDataclasses] & 0x7F) == 0) {
          continue;
        }
      }
      [v3 appendFormat:@"\t[%@ ", v10];
      if (([v7 refreshDataclasses] & 0x7F) != 0) {
        objc_msgSend(v3, "appendFormat:", @"Refresh: 0x%lx ", objc_msgSend(v7, "refreshDataclasses") & 0x7F);
      }
      if (([v7 UIDataclasses] & 0x7F) != 0) {
        objc_msgSend(v3, "appendFormat:", @"UI: 0x%lx ", objc_msgSend(v7, "UIDataclasses") & 0x7F);
      }
      [v3 appendFormat:@"]\n"];
      int v9 = (void *)v10;
    }
    [v3 appendString:@"------\n"];
  }
  objc_sync_exit(v4);

  return v3;
}

- (int)_recalculatePriority
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(DAPriorityManager *)v2 clientsToPriorityRequests];
  objc_super v4 = [v3 keyEnumerator];
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  for (i = 0; ; i = (void *)v8)
  {

    uint64_t v8 = [v4 nextObject];

    if (!v8) {
      break;
    }
    int v9 = [(DAPriorityManager *)v2 clientsToPriorityRequests];
    id v3 = [v9 objectForKey:v8];

    v6 |= [v3 refreshDataclasses];
    v5 |= [v3 UIDataclasses];
  }

  objc_sync_exit(v2);
  if (v5) {
    return 0;
  }
  if (sDeviceIsLocked || (v2->_foregroundDataclasses & v6) != 0) {
    return 18;
  }
  return 4096;
}

- (void)_setNewPriority
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = [(DAPriorityManager *)self _recalculatePriority];
  if (v3 != self->_currentPriority)
  {
    int v4 = v3;
    uint64_t v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v5, v6))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl(&dword_1BA384000, v5, v6, "DAPERF: DAPriorityManager is changing the priority to %d", (uint8_t *)v7, 8u);
    }

    setpriority(4, 0, v4);
    self->_currentPriority = v4;
  }
}

- (void)requestPriority:(int)a3 forClient:(id)a4 dataclasses:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"DAPriorityManager.m" lineNumber:258 description:@"You can't request priority with a nil client"];
  }
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(DAPriorityManager *)v10 clientsToPriorityRequests];
  unsigned int v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    unsigned int v12 = objc_opt_new();
    [(NSMapTable *)v10->_clientsToPriorityRequests setObject:v12 forKey:v9];
  }
  uint64_t v13 = DALoggingwithCategory();
  os_log_type_t v14 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v13, v14))
  {
    if (a3 > 2) {
      __int16 v15 = @"Unknown";
    }
    else {
      __int16 v15 = off_1E6211F50[a3];
    }
    int v22 = 138412802;
    id v23 = v9;
    __int16 v24 = 2112;
    v25 = v15;
    __int16 v26 = 2048;
    int64_t v27 = a5;
    _os_log_impl(&dword_1BA384000, v13, v14, "Client %@ requested priority %@ for dataclasses 0x%lx", (uint8_t *)&v22, 0x20u);
  }

  switch(a3)
  {
    case 2:
      int64_t v18 = a5 & 0x7F;
      objc_msgSend(v12, "setRefreshDataclasses:", objc_msgSend(v12, "refreshDataclasses") & (v18 ^ 0x7F));
      uint64_t v17 = [v12 UIDataclasses] | v18;
      goto LABEL_16;
    case 1:
      int64_t v19 = a5 & 0x7F;
      objc_msgSend(v12, "setRefreshDataclasses:", objc_msgSend(v12, "refreshDataclasses") | v19);
      uint64_t v17 = [v12 UIDataclasses] & (v19 ^ 0x7F);
      goto LABEL_16;
    case 0:
      uint64_t v16 = ~(_BYTE)a5 & 0x7F;
      objc_msgSend(v12, "setRefreshDataclasses:", objc_msgSend(v12, "refreshDataclasses") & v16);
      uint64_t v17 = [v12 UIDataclasses] & v16;
LABEL_16:
      [v12 setUIDataclasses:v17];
      break;
  }
  if (![v12 refreshDataclasses] && !objc_msgSend(v12, "UIDataclasses"))
  {
    id v20 = [(DAPriorityManager *)v10 clientsToPriorityRequests];
    [v20 removeObjectForKey:v9];
  }
  [(DAPriorityManager *)v10 _setNewPriority];

  objc_sync_exit(v10);
}

- (void)bumpDataclassesToUIPriority:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    int v13 = 134217984;
    int64_t v14 = a3;
    _os_log_impl(&dword_1BA384000, v5, v6, "Bumping all client priority requests for dataclasses 0x%lx to UI. Open bar, dude!", (uint8_t *)&v13, 0xCu);
  }

  id v7 = [(DAPriorityManager *)v4 clientsToPriorityRequests];
  uint64_t v8 = [v7 keyEnumerator];

  for (i = 0; ; i = (void *)v10)
  {
    uint64_t v10 = [v8 nextObject];

    if (!v10) {
      break;
    }
    uint64_t v11 = [(DAPriorityManager *)v4 clientsToPriorityRequests];
    unsigned int v12 = [v11 objectForKey:v10];

    objc_msgSend(v12, "setUIDataclasses:", objc_msgSend(v12, "UIDataclasses") | objc_msgSend(v12, "refreshDataclasses") & a3);
    objc_msgSend(v12, "setRefreshDataclasses:", objc_msgSend(v12, "refreshDataclasses") & ~a3 & 0x7FLL);
  }
  objc_sync_exit(v4);

  [(DAPriorityManager *)v4 _setNewPriority];
}

- (NSMapTable)clientsToPriorityRequests
{
  return self->_clientsToPriorityRequests;
}

- (void)setClientsToPriorityRequests:(id)a3
{
}

- (int)currentPriority
{
  return self->_currentPriority;
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
}

- (NSMutableDictionary)cachedAppState
{
  return self->_cachedAppState;
}

- (void)setCachedAppState:(id)a3
{
}

- (int64_t)foregroundDataclasses
{
  return self->_foregroundDataclasses;
}

- (void)setForegroundDataclasses:(int64_t)a3
{
  self->_int64_t foregroundDataclasses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAppState, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_clientsToPriorityRequests, 0);
}

@end
@interface AXFrontBoardProcessWatcher
+ (id)accessibilitySpokenNameForProcess:(id)a3;
+ (id)processForBundleIdentifier:(id)a3;
+ (void)validateFocusedAppsWithEvent:(int64_t)a3;
- (AXFrontBoardProcessWatcher)init;
- (BOOL)_processStateChangeIsTaskStateChangeFrom:(id)a3 to:(id)a4;
- (BOOL)_processStateChangeIsVisibilityStateChangeFrom:(id)a3 to:(id)a4;
- (id)_processDescriptionForPID:(int)a3;
- (void)_validateFocusedApps:(int64_t)a3;
- (void)dealloc;
- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5;
- (void)processDidExit:(id)a3;
- (void)processManager:(id)a3 didAddProcess:(id)a4;
@end

@implementation AXFrontBoardProcessWatcher

+ (void)validateFocusedAppsWithEvent:(int64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = AXValidateFocusedAppsNotification;
  v8 = @"event";
  v6 = [NSNumber numberWithInteger:a3];
  v9[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 postNotificationName:v5 object:0 userInfo:v7];
}

- (AXFrontBoardProcessWatcher)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)AXFrontBoardProcessWatcher;
  v2 = [(AXFrontBoardProcessWatcher *)&v27 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F22868]);
    uint64_t v4 = [v3 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    appTransitionTimer = v2->_appTransitionTimer;
    v2->_appTransitionTimer = (AXDispatchTimer *)v4;

    [(AXDispatchTimer *)v2->_appTransitionTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    uint64_t v6 = [MEMORY[0x263EFFA08] set];
    cachedFocusedAppPIDs = v2->_cachedFocusedAppPIDs;
    v2->_cachedFocusedAppPIDs = (NSSet *)v6;

    v8 = [MEMORY[0x263F3F460] sharedInstance];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v9 = [v8 allProcesses];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v12++) addObserver:v2];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }

    [v8 addObserver:v2];
    objc_initWeak(location, v2);
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v14 = AXValidateFocusedAppsNotification;
    v15 = [MEMORY[0x263F08A48] mainQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __34__AXFrontBoardProcessWatcher_init__block_invoke;
    v20[3] = &unk_264702258;
    objc_copyWeak(&v21, location);
    uint64_t v16 = [v13 addObserverForName:v14 object:0 queue:v15 usingBlock:v20];
    id observerToken = v2->_observerToken;
    v2->_id observerToken = (id)v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
  v18 = AXRuntimeLogPID();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_224D52000, v18, OS_LOG_TYPE_INFO, "did initialize AXFrontBoardProcessWatcher", (uint8_t *)location, 2u);
  }

  return v2;
}

void __34__AXFrontBoardProcessWatcher_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 userInfo];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"event"];
  objc_msgSend(WeakRetained, "_validateFocusedApps:", objc_msgSend(v5, "integerValue"));
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(AXDispatchTimer *)self->_appTransitionTimer cancel];
  appTransitionTimer = self->_appTransitionTimer;
  self->_appTransitionTimer = 0;

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self->_observerToken];

  id observerToken = self->_observerToken;
  self->_id observerToken = 0;

  uint64_t v6 = [MEMORY[0x263F3F460] sharedInstance];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [v6 allProcesses];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v11++) removeObserver:self];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [v6 removeObserver:self];
  v12.receiver = self;
  v12.super_class = (Class)AXFrontBoardProcessWatcher;
  [(AXFrontBoardProcessWatcher *)&v12 dealloc];
}

- (id)_processDescriptionForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [MEMORY[0x263F3F460] sharedInstance];
  uint64_t v5 = [v4 processForPID:v3];
  uint64_t v6 = v5;
  v7 = NSString;
  uint64_t v8 = (int)v3;
  if (v5)
  {
    uint64_t v9 = [v5 handle];
    uint64_t v10 = [v9 name];
    uint64_t v11 = [v6 bundleIdentifier];
    objc_super v12 = [v7 stringWithFormat:@"PID:%ld Name:%@ BundleID:%@", v8, v10, v11];
  }
  else
  {
    objc_super v12 = objc_msgSend(NSString, "stringWithFormat:", @"PID:%ld <no other info available>", (int)v3);
  }

  return v12;
}

- (void)_validateFocusedApps:(int64_t)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v5 = AXRuntimeLogPID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "AXValidateFocusedAppsEventAppStateVisibilityDidChange";
    __int16 v65 = 2048;
    int64_t v66 = a3;
    _os_log_impl(&dword_224D52000, v5, OS_LOG_TYPE_INFO, "Received focused app validation event: %s (%ld)", buf, 0x16u);
  }

  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  v7 = AXFrontBoardFocusedAppPIDs();
  uint64_t v8 = [v6 setWithArray:v7];

  p_cachedFocusedAppPIDs = &self->_cachedFocusedAppPIDs;
  if (([v8 isEqualToSet:self->_cachedFocusedAppPIDs] & 1) == 0)
  {
    uint64_t v10 = AXRuntimeLogPID();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      objc_super v12 = AXRuntimeLogPID();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[AXFrontBoardProcessWatcher _validateFocusedApps:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
      v52 = v8;

      v20 = AXRuntimeLogPID();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[AXFrontBoardProcessWatcher _validateFocusedApps:](v20, v21, v22, v23, v24, v25, v26, v27);
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v28 = *p_cachedFocusedAppPIDs;
      uint64_t v29 = [(NSSet *)v28 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v58;
        do
        {
          uint64_t v32 = 0;
          do
          {
            if (*(void *)v58 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v57 + 1) + 8 * v32);
            v34 = AXRuntimeLogPID();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              -[AXFrontBoardProcessWatcher _processDescriptionForPID:](self, "_processDescriptionForPID:", [v33 integerValue]);
              v35 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v64 = v35;
              _os_log_debug_impl(&dword_224D52000, v34, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);
            }
            ++v32;
          }
          while (v30 != v32);
          uint64_t v30 = [(NSSet *)v28 countByEnumeratingWithState:&v57 objects:v62 count:16];
        }
        while (v30);
      }

      v36 = AXRuntimeLogPID();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[AXFrontBoardProcessWatcher _validateFocusedApps:](v36, v37, v38, v39, v40, v41, v42, v43);
      }

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v44 = v52;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v54;
        do
        {
          uint64_t v48 = 0;
          do
          {
            if (*(void *)v54 != v47) {
              objc_enumerationMutation(v44);
            }
            v49 = *(void **)(*((void *)&v53 + 1) + 8 * v48);
            v50 = AXRuntimeLogPID();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              -[AXFrontBoardProcessWatcher _processDescriptionForPID:](self, "_processDescriptionForPID:", [v49 integerValue]);
              v51 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v64 = v51;
              _os_log_debug_impl(&dword_224D52000, v50, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);
            }
            ++v48;
          }
          while (v46 != v48);
          uint64_t v46 = [v44 countByEnumeratingWithState:&v53 objects:v61 count:16];
        }
        while (v46);
      }

      p_cachedFocusedAppPIDs = &self->_cachedFocusedAppPIDs;
      uint64_t v8 = v52;
    }
    objc_storeStrong((id *)p_cachedFocusedAppPIDs, v8);
    UIAccessibilityPostNotification(0x1389u, 0);
  }
}

- (BOOL)_processStateChangeIsVisibilityStateChangeFrom:(id)a3 to:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 visibility];
  uint64_t v7 = [v5 visibility];

  if (v6 == 1 && !v7) {
    return 0;
  }
  if (v6) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7 == 1;
  }
  return !v9 && v6 != v7;
}

- (BOOL)_processStateChangeIsTaskStateChangeFrom:(id)a3 to:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 taskState];
  uint64_t v7 = [v5 taskState];

  return v6 != v7;
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5 = a4;
  [v5 addObserver:self];
  uint64_t v6 = AXRuntimeLogPID();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AXFrontBoardProcessWatcher processManager:didAddProcess:](v5, v6);
  }

  uint64_t v7 = [v5 state];
  int v8 = [v7 pid];

  if (v8 >= 1)
  {
    BOOL v9 = [v5 state];
    uint64_t v10 = [v9 taskState];

    if (v10 == 2)
    {
      BOOL v11 = [v5 state];
      [v11 pid];
      AXProcessIsCarPlay();
      AXPidUnsuspend();
    }
  }
}

- (void)processDidExit:(id)a3
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 pid];
  if ((int)v3 >= 1)
  {
    v5[0] = @"pid";
    uint64_t v4 = [NSNumber numberWithInt:v3];
    v5[1] = @"terminated";
    v6[0] = v4;
    v6[1] = @"true";
    [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
    AXPushNotificationToSystemForBroadcast();
  }
}

- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 pid];
  objc_super v12 = AXRuntimeLogPID();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_debug_impl(&dword_224D52000, v12, OS_LOG_TYPE_DEBUG, "Process state change:%@.\n From:%@\nTo:%@", buf, 0x20u);
  }

  if (v11 >= 1
    && [(AXFrontBoardProcessWatcher *)self _processStateChangeIsTaskStateChangeFrom:v9 to:v10])
  {
    uint64_t v13 = [v10 taskState];
    AXProcessIsCarPlay();
    if (v13 == 2) {
      AXPidUnsuspend();
    }
    else {
      AXPidSuspend();
    }
  }
  if ([(AXFrontBoardProcessWatcher *)self _processStateChangeIsVisibilityStateChangeFrom:v9 to:v10])
  {
    [(AXDispatchTimer *)self->_appTransitionTimer cancel];
    if (v11 >= 1 && [v10 visibility] != 2)
    {
      AXProcessIsCarPlay();
      AXTentativePidSuspend();
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__AXFrontBoardProcessWatcher_process_stateDidChangeFromState_toState___block_invoke;
    block[3] = &unk_2647022A8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __70__AXFrontBoardProcessWatcher_process_stateDidChangeFromState_toState___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = AXFrontBoardFocusedAppPIDs();
  uint64_t v4 = [v2 setWithArray:v3];

  if ((unint64_t)[v4 count] < 2)
  {
    [*(id *)(a1 + 32) _validateFocusedApps:0];
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __70__AXFrontBoardProcessWatcher_process_stateDidChangeFromState_toState___block_invoke_2;
    void v6[3] = &unk_264702280;
    objc_copyWeak(&v7, &location);
    [v5 afterDelay:v6 processBlock:0 cancelBlock:2.0];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __70__AXFrontBoardProcessWatcher_process_stateDidChangeFromState_toState___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _validateFocusedApps:0];
}

+ (id)processForBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  uint64_t v4 = AXFrontBoardRunningAppProcesses();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__AXFrontBoardProcessWatcher_processForBundleIdentifier___block_invoke;
  v8[3] = &unk_2647022D0;
  id v5 = v3;
  id v9 = v5;
  id v10 = &v11;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __57__AXFrontBoardProcessWatcher_processForBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 bundleIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)accessibilitySpokenNameForProcess:(id)a3
{
  id v3 = a3;
  if ([v3 isApplicationProcess])
  {
    id v4 = v3;
    objc_getAssociatedObject(v4, &_AXSpokenNameKey);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([(__CFString *)v5 isEqualToString:@"NO-SPOKEN-NAME"])
    {

      id v5 = 0;
    }
    else if (!v5)
    {
      id v6 = [v4 bundleIdentifier];
      AXApplicationNameLabelForBundleIdentifier((uint64_t)v6);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        id v7 = v4;
        int v8 = v5;
      }
      else
      {
        int v8 = @"NO-SPOKEN-NAME";
        id v7 = v4;
      }
      objc_setAssociatedObject(v7, &_AXSpokenNameKey, v8, (void *)0x303);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFocusedAppPIDs, 0);
  objc_storeStrong((id *)&self->_appTransitionTimer, 0);

  objc_storeStrong(&self->_observerToken, 0);
}

- (void)_validateFocusedApps:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_validateFocusedApps:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_validateFocusedApps:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)processManager:(void *)a1 didAddProcess:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = [a1 state];
  int v5 = 138412546;
  id v6 = a1;
  __int16 v7 = 2112;
  int v8 = v4;
  _os_log_debug_impl(&dword_224D52000, a2, OS_LOG_TYPE_DEBUG, "Did add new process: %@\nState: %@", (uint8_t *)&v5, 0x16u);
}

@end
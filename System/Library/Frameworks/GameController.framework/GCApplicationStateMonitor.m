@interface GCApplicationStateMonitor
+ (id)sharedInstance;
- (BOOL)applicationCanReceiveEvents:(int)a3;
- (GCApplicationStateMonitor)init;
- (NSString)frontmostApplicationIdentifier;
- (int)frontmostApplication;
- (void)addObserver:(id)a3 forProcessIdentifier:(int)a4;
- (void)dealloc;
- (void)initializeStateMonitor;
- (void)onFrontmostApplicationChanged:(int)a3;
- (void)removeApplicationFromCanReceiveEventsMonitoring:(int)a3;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forProcessIdentifier:(int)a4;
- (void)setApplicationCanReceiveEvents:(BOOL)a3 forPID:(int)a4;
- (void)setFrontmostApplication:(int)a3;
- (void)setFrontmostApplicationIdentifier:(id)a3;
- (void)updateInterestedBundleIDs;
@end

@implementation GCApplicationStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_46);
  }
  v2 = (void *)sharedInstance_sharedStateMonitor;

  return v2;
}

void __43__GCApplicationStateMonitor_sharedInstance__block_invoke()
{
  if (currentProcessIsGameControllerDaemon())
  {
    uint64_t v0 = objc_opt_new();
    v1 = (void *)sharedInstance_sharedStateMonitor;
    sharedInstance_sharedStateMonitor = v0;
  }
  else if (gc_isInternalBuild())
  {
    v2 = getGCAppStateMonitorLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __43__GCApplicationStateMonitor_sharedInstance__block_invoke_cold_1(v2);
    }
  }
}

- (GCApplicationStateMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)GCApplicationStateMonitor;
  v2 = [(GCApplicationStateMonitor *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable weakToStrongObjectsMapTable];
    observerToPIDs = v2->_observerToPIDs;
    v2->_observerToPIDs = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable strongToStrongObjectsMapTable];
    pidToObservers = v2->_pidToObservers;
    v2->_pidToObservers = (NSMapTable *)v5;

    uint64_t v7 = objc_opt_new();
    pidToBundleIdentifier = v2->_pidToBundleIdentifier;
    v2->_pidToBundleIdentifier = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    pidToCanReceiveEvents = v2->_pidToCanReceiveEvents;
    v2->_pidToCanReceiveEvents = (NSMutableDictionary *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.gamecontroller.appstatemonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    [(GCApplicationStateMonitor *)v2 initializeStateMonitor];
    [(GCApplicationStateMonitor *)v2 initializeForegroundMonitor];
  }
  return v2;
}

- (void)setFrontmostApplication:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gc_isInternalBuild())
  {
    v12 = getGCLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[GCApplicationStateMonitor setFrontmostApplication:](v3, v12);
    }
  }
  self->_uint64_t frontmostApplication = v3;
  if (v3)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = +[NSNumber numberWithInt:self->_frontmostApplication];
    v6 = [(NSMutableDictionary *)self->_pidToBundleIdentifier objectForKey:v5];
    if (v6)
    {
      objc_storeStrong((id *)&self->_frontmostApplicationIdentifier, v6);
      if (gc_isInternalBuild())
      {
        uint64_t v7 = getGCLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[GCApplicationStateMonitor setFrontmostApplication:]();
        }
      }
    }
    else
    {
      bksStateMonitor = self->_bksStateMonitor;
      uint64_t frontmostApplication = self->_frontmostApplication;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke;
      v13[3] = &unk_26D22D218;
      objc_copyWeak(&v14, &location);
      [(BKSApplicationStateMonitor *)bksStateMonitor applicationInfoForPID:frontmostApplication completion:v13];
      objc_destroyWeak(&v14);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    frontmostApplicationIdentifier = self->_frontmostApplicationIdentifier;
    self->_frontmostApplicationIdentifier = 0;

    if (gc_isInternalBuild())
    {
      uint64_t v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCApplicationStateMonitor setFrontmostApplication:]();
      }
    }
  }
}

void __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke_2;
    v7[3] = &unk_26D22A8E8;
    id v8 = v3;
    uint64_t v9 = v5;
    dispatch_async(v6, v7);
  }
}

void __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateDisplayIDKey];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 64), v2);
  if (gc_isInternalBuild())
  {
    id v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke_2_cold_1();
    }
  }
}

- (void)initializeStateMonitor
{
  id v3 = (BKSApplicationStateMonitor *)objc_opt_new();
  bksStateMonitor = self->_bksStateMonitor;
  self->_bksStateMonitor = v3;

  [(BKSApplicationStateMonitor *)self->_bksStateMonitor updateInterestedStates:11];
  objc_initWeak(&location, self);
  uint64_t v5 = self->_bksStateMonitor;
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = __51__GCApplicationStateMonitor_initializeStateMonitor__block_invoke;
  uint64_t v9 = &unk_26D22D218;
  objc_copyWeak(&v10, &location);
  [(BKSApplicationStateMonitor *)v5 setHandler:&v6];
  [(GCApplicationStateMonitor *)self updateInterestedBundleIDs];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__GCApplicationStateMonitor_initializeStateMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      v6 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v3;
        _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_DEFAULT, "Received user info: %@", buf, 0xCu);
      }
    }
    uint64_t v5 = WeakRetained[2];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __51__GCApplicationStateMonitor_initializeStateMonitor__block_invoke_89;
    v7[3] = &unk_26D22A8E8;
    id v8 = v3;
    uint64_t v9 = WeakRetained;
    dispatch_async(v5, v7);
  }
}

void __51__GCApplicationStateMonitor_initializeStateMonitor__block_invoke_89(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateKey];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateProcessIDKey];
  int v4 = [v2 intValue];
  uint64_t v5 = [v3 intValue];
  v6 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v3];
  if ((v4 - 1) > 1)
  {
    uint64_t v7 = v5;
    if (v4 != 8) {
      goto LABEL_6;
    }
  }
  else
  {
    if ([*(id *)(a1 + 40) frontmostApplication] != v5) {
      goto LABEL_6;
    }
    uint64_t v7 = 0;
  }
  [*(id *)(a1 + 40) setFrontmostApplication:v7];
LABEL_6:
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((v4 - 1) > 1)
          {
            if (v4 == 8) {
              objc_msgSend(v13, "applicationForegrounded:", v5, (void)v14);
            }
          }
          else
          {
            [v13 applicationBackgrounded:v5];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)addObserver:(id)a3 forProcessIdentifier:(int)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke;
  block[3] = &unk_26D22C200;
  objc_copyWeak(&v12, &location);
  int v13 = a4;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__10;
    v30 = __Block_byref_object_dispose__10;
    id v31 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    int v4 = [WeakRetained[3] objectForKey:v27[5]];
    BOOL v5 = v4 == 0;

    if (v5)
    {
      id v6 = WeakRetained[3];
      uint64_t v7 = objc_opt_new();
      [v6 setObject:v7 forKey:v27[5]];
    }
    id v8 = [WeakRetained[3] objectForKey:v27[5]];
    if ([v8 containsObject:*(void *)(a1 + 32)])
    {
      if (!gc_isInternalBuild())
      {
LABEL_15:

        _Block_object_dispose(&v26, 8);
        goto LABEL_16;
      }
      uint64_t v9 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = v27[5];
        uint64_t v11 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v33 = v10;
        __int16 v34 = 2112;
        v35 = v11;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "addObserver - Process %@ is already observed by %@, no need to re-register", buf, 0x16u);
      }
    }
    else
    {
      [v8 addObject:*(void *)(a1 + 32)];
      if (gc_isInternalBuild())
      {
        v20 = getGCAppStateMonitorLogger();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = v27[5];
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = v21;
          __int16 v34 = 2112;
          v35 = v8;
          _os_log_impl(&dword_220998000, v20, OS_LOG_TYPE_INFO, "addObserver - Process %@ has the following observers: %@", buf, 0x16u);
        }
      }
      id v12 = [WeakRetained[4] objectForKey:*(void *)(a1 + 32)];
      BOOL v13 = v12 == 0;

      if (v13)
      {
        id v14 = WeakRetained[4];
        long long v15 = objc_opt_new();
        [v14 setObject:v15 forKey:*(void *)(a1 + 32)];
      }
      uint64_t v9 = [WeakRetained[4] objectForKey:*(void *)(a1 + 32)];
      [v9 addObject:v27[5]];
      if (gc_isInternalBuild())
      {
        v22 = getGCAppStateMonitorLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = v23;
          __int16 v34 = 2112;
          v35 = v9;
          _os_log_impl(&dword_220998000, v22, OS_LOG_TYPE_INFO, "addObserver - %@ is observing the following processes: %@", buf, 0x16u);
        }
      }
      long long v16 = [WeakRetained[5] objectForKey:v27[5]];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        id v18 = WeakRetained[1];
        uint64_t v19 = *(unsigned int *)(a1 + 56);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_91;
        v24[3] = &unk_26D22D268;
        objc_copyWeak(&v25, v2);
        v24[4] = *(void *)(a1 + 40);
        v24[5] = &v26;
        [v18 applicationInfoForPID:v19 completion:v24];
        objc_destroyWeak(&v25);
      }
    }

    goto LABEL_15;
  }
LABEL_16:
}

void __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_91(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[2];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_2;
    v7[3] = &unk_26D22D240;
    id v8 = v3;
    uint64_t v9 = v5;
    long long v10 = *(_OWORD *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

void __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateDisplayIDKey];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 40) + 40) setObject:v2 forKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    if (gc_isInternalBuild())
    {
      id v3 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        int v6 = 138412546;
        uint64_t v7 = v4;
        __int16 v8 = 2112;
        uint64_t v9 = v2;
        _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "addObserver - Registered pid %@ with bundle identifier %@", (uint8_t *)&v6, 0x16u);
      }
    }
    [*(id *)(a1 + 48) updateInterestedBundleIDs];
  }
  else if (gc_isInternalBuild())
  {
    BOOL v5 = getGCAppStateMonitorLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_2_cold_1();
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __44__GCApplicationStateMonitor_removeObserver___block_invoke;
  v7[3] = &unk_26D22B668;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__GCApplicationStateMonitor_removeObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      id v10 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v11;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "removeObserver - Removing all observers for %@", buf, 0xCu);
      }
    }
    id v3 = [WeakRetained[4] objectForKey:*(void *)(a1 + 32)];
    id v4 = (void *)[v3 copy];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(a1 + 40), "removeObserver:forProcessIdentifier:", *(void *)(a1 + 32), objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9++), "intValue", (void)v12));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)removeObserver:(id)a3 forProcessIdentifier:(int)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__GCApplicationStateMonitor_removeObserver_forProcessIdentifier___block_invoke;
  block[3] = &unk_26D22C200;
  objc_copyWeak(&v12, &location);
  int v13 = a4;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __65__GCApplicationStateMonitor_removeObserver_forProcessIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    id v4 = [WeakRetained[3] objectForKey:v3];
    if ([v4 containsObject:*(void *)(a1 + 32)])
    {
      [v4 removeObject:*(void *)(a1 + 32)];
      if (![v4 count])
      {
        [WeakRetained[3] removeObjectForKey:v3];
        if (gc_isInternalBuild())
        {
          int v13 = getGCAppStateMonitorLogger();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v17 = 138412290;
            uint64_t v18 = v3;
            _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "removeObserver - %@ is no longer being observed by anything, removing pid:observer mapping.", (uint8_t *)&v17, 0xCu);
          }
        }
      }
      if (gc_isInternalBuild())
      {
        uint64_t v9 = getGCAppStateMonitorLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412546;
          uint64_t v18 = v3;
          __int16 v19 = 2112;
          v20 = v4;
          _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "removeObserver - Process %@ has the following observers: %@", (uint8_t *)&v17, 0x16u);
        }
      }
      id v5 = [WeakRetained[4] objectForKey:*(void *)(a1 + 32)];
      [v5 removeObject:v3];
      if (gc_isInternalBuild())
      {
        id v10 = getGCAppStateMonitorLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = *(void **)(a1 + 32);
          int v17 = 138412546;
          uint64_t v18 = v11;
          __int16 v19 = 2112;
          v20 = v5;
          _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "removeObserver - %@ is no longer observing the following processes: %@", (uint8_t *)&v17, 0x16u);
        }
      }
      if (![v5 count])
      {
        [WeakRetained[4] removeObjectForKey:*(void *)(a1 + 32)];
        if (gc_isInternalBuild())
        {
          long long v14 = getGCAppStateMonitorLogger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            long long v15 = *(void **)(a1 + 32);
            int v17 = 138412290;
            uint64_t v18 = v15;
            _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_INFO, "removeObserver - %@ is no longer observing anything, removing observer:pid mapping.", (uint8_t *)&v17, 0xCu);
          }
        }
      }
      uint64_t v6 = [WeakRetained[5] objectForKey:v3];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        char v8 = [v4 containsObject:*(void *)(a1 + 32)];

        if ((v8 & 1) == 0)
        {
          if (gc_isInternalBuild())
          {
            long long v16 = getGCAppStateMonitorLogger();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              int v17 = 138412290;
              uint64_t v18 = v3;
              _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_INFO, "removeObserver - %@ is no longer being observed by anything, removing bundleIdentifier mapping", (uint8_t *)&v17, 0xCu);
            }
          }
          [WeakRetained[5] removeObjectForKey:v3];
          [*(id *)(a1 + 40) updateInterestedBundleIDs];
        }
      }
    }
    else
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_15;
      }
      id v5 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v12 = *(NSObject **)(a1 + 32);
        int v17 = 138412546;
        uint64_t v18 = v3;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "removeObserver - Process %@ is not observed by %@, no need to unregister", (uint8_t *)&v17, 0x16u);
      }
    }

LABEL_15:
  }
}

- (void)updateInterestedBundleIDs
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __54__GCApplicationStateMonitor_updateInterestedBundleIDs__block_invoke;
  block[3] = &unk_26D22B950;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__GCApplicationStateMonitor_updateInterestedBundleIDs__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C6E130]();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = [WeakRetained[4] objectEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 unionSet:*(void *)(*((void *)&v26 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v7);
    }

    if (gc_isInternalBuild())
    {
      v20 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v4;
        _os_log_impl(&dword_220998000, v20, OS_LOG_TYPE_INFO, "updateInterestedBundleIDs - observed PIDs: %@", buf, 0xCu);
      }
    }
    id v10 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = objc_msgSend(WeakRetained[5], "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * v15), (void)v22);
          if (v16) {
            [v10 addObject:v16];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v13);
    }

    int v17 = GCGameIntentBlocklist();
    [v10 unionSet:v17];

    if (gc_isInternalBuild())
    {
      uint64_t v21 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v10;
        _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_INFO, "updateInterestedBundleIDs - observed bundle identifiers: %@", buf, 0xCu);
      }
    }
    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 8);
    __int16 v19 = objc_msgSend(v10, "allObjects", (void)v22);
    [v18 updateInterestedBundleIDs:v19];
  }
}

- (void)onFrontmostApplicationChanged:(int)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __59__GCApplicationStateMonitor_onFrontmostApplicationChanged___block_invoke;
  v6[3] = &unk_26D22D290;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  int v8 = a3;
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __59__GCApplicationStateMonitor_onFrontmostApplicationChanged___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) frontmostApplication];
    [*(id *)(a1 + 32) setFrontmostApplication:*(unsigned int *)(a1 + 48)];
    if (gc_isInternalBuild())
    {
      uint64_t v18 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109120;
        int v31 = v19;
        _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_INFO, "Frontmost application is now %d", buf, 8u);
      }
    }
    id v4 = +[NSNumber numberWithInt:v3];
    id v5 = [WeakRetained[3] objectForKey:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v25;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * v10++) applicationBackgrounded:v3];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v8);
      }
    }
    id v11 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];

    uint64_t v12 = [WeakRetained[3] objectForKey:v11];

    if (v12)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17++), "applicationForegrounded:", *(unsigned int *)(a1 + 48), (void)v20);
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v15);
      }
    }
  }
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_bksStateMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GCApplicationStateMonitor;
  [(GCApplicationStateMonitor *)&v3 dealloc];
}

- (int)frontmostApplication
{
  return self->_frontmostApplication;
}

- (NSString)frontmostApplicationIdentifier
{
  return self->_frontmostApplicationIdentifier;
}

- (void)setFrontmostApplicationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontmostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_pidToCanReceiveEvents, 0);
  objc_storeStrong((id *)&self->_pidToBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observerToPIDs, 0);
  objc_storeStrong((id *)&self->_pidToObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_bksStateMonitor, 0);
}

- (BOOL)applicationCanReceiveEvents:(int)a3
{
  id v4 = +[NSNumber numberWithInt:*(void *)&a3];
  id v5 = [(NSMutableDictionary *)self->_pidToCanReceiveEvents objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_pidToCanReceiveEvents objectForKeyedSubscript:v4];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)setApplicationCanReceiveEvents:(BOOL)a3 forPID:(int)a4
{
  BOOL v5 = a3;
  char v7 = +[NSNumber numberWithInt:*(void *)&a4];
  uint64_t v8 = +[NSNumber numberWithBool:v5];
  [(NSMutableDictionary *)self->_pidToCanReceiveEvents setObject:v8 forKeyedSubscript:v7];

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __91__GCApplicationStateMonitor_ClientCanReceiveEvents__setApplicationCanReceiveEvents_forPID___block_invoke;
  block[3] = &unk_26D22D2B8;
  objc_copyWeak(&v11, &location);
  BOOL v13 = v5;
  int v12 = a4;
  dispatch_async(queue, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __91__GCApplicationStateMonitor_ClientCanReceiveEvents__setApplicationCanReceiveEvents_forPID___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v10 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = *(unsigned __int8 *)(a1 + 44);
        int v12 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 67109376;
        int v19 = v11;
        __int16 v20 = 1024;
        int v21 = v12;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "setApplicationCanReceiveEvents %d forPID: %d", buf, 0xEu);
      }
    }
    objc_super v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    id v4 = [WeakRetained[3] objectForKey:v3];
    BOOL v5 = v4;
    if (v4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * v9++) applicationCanReceiveEventsDidChange:*(unsigned __int8 *)(a1 + 44) forPID:*(unsigned int *)(a1 + 40)];
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)removeApplicationFromCanReceiveEventsMonitoring:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gc_isInternalBuild())
  {
    uint64_t v6 = getGCAppStateMonitorLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_INFO, "removeApplicationFromCanReceiveEventsMonitoring %d", (uint8_t *)v7, 8u);
    }
  }
  BOOL v5 = +[NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)self->_pidToCanReceiveEvents removeObjectForKey:v5];
}

void __43__GCApplicationStateMonitor_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_220998000, log, OS_LOG_TYPE_ERROR, "GCApplicationStateMonitor is not accessible from this process.", v1, 2u);
}

- (void)setFrontmostApplication:.cold.1()
{
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_0_27(&dword_220998000, v0, v1, "Setting frontmostApplicationIdentifier to %@", v2, v3, v4, v5, v6);
}

- (void)setFrontmostApplication:.cold.2()
{
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_0_27(&dword_220998000, v0, v1, "Setting frontmostApplicationIdentifier to %@", v2, v3, v4, v5, v6);
}

- (void)setFrontmostApplication:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithInt:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "setFrontmostApplication %@", (uint8_t *)&v4, 0xCu);
}

void __53__GCApplicationStateMonitor_setFrontmostApplication___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_0_27(&dword_220998000, v0, v1, "Setting frontmostApplicationIdentifier to %@", v2, v3, v4, v5, v6);
}

void __62__GCApplicationStateMonitor_addObserver_forProcessIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_23();
  _os_log_error_impl(&dword_220998000, v0, OS_LOG_TYPE_ERROR, "addObserver - Error: unable to locate bundle identifier for pid %@", v1, 0xCu);
}

@end
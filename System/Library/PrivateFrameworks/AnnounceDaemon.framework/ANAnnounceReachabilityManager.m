@interface ANAnnounceReachabilityManager
- (ANAnnounceReachabilityManager)init;
- (ANAnnounceReachabilityManagerDelegate)delegate;
- (ANRapportConnectionProvider)rapportConnection;
- (BOOL)started;
- (NSArray)monitoredHomes;
- (NSMutableDictionary)homeReachability;
- (OS_dispatch_queue)serialQueue;
- (OS_os_log)log;
- (id)monitoredRoomsForHome:(id)a3;
- (unint64_t)_filteredReachabilityLevelFromReachabilityLevel:(unint64_t)a3 forHome:(id)a4;
- (unint64_t)_reachabilityForHome:(id)a3;
- (unint64_t)_reachabilityForRoom:(id)a3 inHome:(id)a4;
- (unint64_t)reachabilityForHome:(id)a3;
- (unint64_t)reachabilityForRoom:(id)a3 inHome:(id)a4;
- (void)_initializeReachabilityStatus;
- (void)_notifyClientsReachabilityChangeForHome:(id)a3 toLevel:(unint64_t)a4;
- (void)_notifyClientsReachabilityChangeForRoom:(id)a3 inHome:(id)a4 toLevel:(unint64_t)a5;
- (void)_rapportActivationHandler:(id)a3;
- (void)_reevaluateHomeKitReachabilityForHome:(id)a3;
- (void)_updateReachabilityLevelWithReachabilityLevel:(unint64_t)a3 forAccessory:(id)a4 operation:(unint64_t)a5;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)connection:(id)a3 didFindDevice:(id)a4;
- (void)connection:(id)a3 didLoseDevice:(id)a4;
- (void)didAddHome:(id)a3;
- (void)didRemoveHome:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation ANAnnounceReachabilityManager

- (ANAnnounceReachabilityManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)ANAnnounceReachabilityManager;
  v2 = [(ANAnnounceReachabilityManager *)&v13 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.announce", "ReachabilityMgr");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.announce.reachability-queue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    homeReachability = v2->_homeReachability;
    v2->_homeReachability = (NSMutableDictionary *)v7;

    uint64_t v9 = +[ANRapportConnection sharedConnection];
    rapportConnection = v2->_rapportConnection;
    v2->_rapportConnection = (ANRapportConnectionProvider *)v9;

    v2->_started = 0;
    v11 = +[ANHomeManager shared];
    [v11 registerDelegate:v2 queue:v2->_serialQueue];

    [(ANAnnounceReachabilityManager *)v2 _initializeReachabilityStatus];
  }
  return v2;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(ANAnnounceReachabilityManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BCE168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) started])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E6BCE1C0;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [*(id *)(a1 + 32) setStarted:1];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = [*(id *)(a1 + 32) rapportConnection];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_3;
    v3[3] = &unk_1E6BCE210;
    v3[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v5, &location);
    id v4 = *(id *)(a1 + 40);
    [v2 activateLinkWithOptions:7 completion:v3];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6BCE1E8;
  objc_copyWeak(&v10, a1 + 6);
  id v9 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_5;
  v6[3] = &unk_1E6BCE1C0;
  id v7 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v10);
}

void __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _rapportActivationHandler:*(void *)(a1 + 32)];
}

uint64_t __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stop
{
  id v3 = [(ANAnnounceReachabilityManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ANAnnounceReachabilityManager_stop__block_invoke;
  block[3] = &unk_1E6BCE238;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __37__ANAnnounceReachabilityManager_stop__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F4A950] sharedManager];
  [v2 transaction:*MEMORY[0x1E4F4A870] setActive:0];

  if ([*(id *)(a1 + 32) started])
  {
    [*(id *)(a1 + 32) setStarted:0];
    id v3 = [*(id *)(a1 + 32) rapportConnection];
    [v3 deactivateLinkWithOptions:2];
  }
}

- (unint64_t)reachabilityForHome:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(ANAnnounceReachabilityManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ANAnnounceReachabilityManager_reachabilityForHome___block_invoke;
  block[3] = &unk_1E6BCDF68;
  void block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __53__ANAnnounceReachabilityManager_reachabilityForHome___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reevaluateHomeKitReachabilityForHome:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) _reachabilityForHome:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)reachabilityForRoom:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v8 = [(ANAnnounceReachabilityManager *)self serialQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__ANAnnounceReachabilityManager_reachabilityForRoom_inHome___block_invoke;
  v13[3] = &unk_1E6BCE260;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v13);

  unint64_t v11 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __60__ANAnnounceReachabilityManager_reachabilityForRoom_inHome___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reevaluateHomeKitReachabilityForHome:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) _reachabilityForRoom:*(void *)(a1 + 48) inHome:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)monitoredRoomsForHome:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  id v17 = (id)objc_opt_new();
  id v5 = [(ANAnnounceReachabilityManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ANAnnounceReachabilityManager_monitoredRoomsForHome___block_invoke;
  block[3] = &unk_1E6BCDF68;
  void block[4] = self;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  dispatch_sync(v5, block);

  id v7 = [(id)v13[5] allObjects];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__ANAnnounceReachabilityManager_monitoredRoomsForHome___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) homeReachability];
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = [v4 allKeys];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
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
          id v10 = [*(id *)(a1 + 40) accessoryWithUniqueIdentifier:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
          unint64_t v11 = [v10 room];

          if (v11) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v11];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (NSArray)monitoredHomes
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  unint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = (id)objc_opt_new();
  id v3 = [(ANAnnounceReachabilityManager *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ANAnnounceReachabilityManager_monitoredHomes__block_invoke;
  v6[3] = &unk_1E6BCDF40;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] allObjects];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __47__ANAnnounceReachabilityManager_monitoredHomes__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) homeReachability];
  id v3 = [v2 allKeys];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        id v10 = +[ANHomeManager shared];
        unint64_t v11 = [v10 homeForID:v9];

        if (v11) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (unint64_t)_filteredReachabilityLevelFromReachabilityLevel:(unint64_t)a3 forHome:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[ANHomeManager shared];
  uint64_t v7 = [v6 currentAccessory];
  if (v7)
  {
  }
  else
  {
    int v8 = objc_msgSend(v5, "hmu_isRemoteAccessAllowedForCurrentUser");

    if (!v8) {
      a3 &= ~2uLL;
    }
  }

  return a3;
}

- (void)_initializeReachabilityStatus
{
  id v3 = [MEMORY[0x1E4F4A950] sharedManager];
  [v3 transaction:*MEMORY[0x1E4F4A870] setActive:1];

  id v4 = [(ANAnnounceReachabilityManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ANAnnounceReachabilityManager__initializeReachabilityStatus__block_invoke;
  block[3] = &unk_1E6BCE238;
  void block[4] = self;
  dispatch_sync(v4, block);
}

void __62__ANAnnounceReachabilityManager__initializeReachabilityStatus__block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "Initializing Reachability Status", buf, 2u);
  }

  id v3 = +[ANHomeManager shared];
  id v4 = [v3 allHomes];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v4;
  uint64_t v40 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v53;
    *(void *)&long long v5 = 138412546;
    long long v37 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v6;
        uint64_t v7 = *(void **)(*((void *)&v52 + 1) + 8 * v6);
        uint64_t v8 = objc_opt_new();
        uint64_t v9 = [*(id *)(a1 + 32) homeReachability];
        id v10 = [v7 uniqueIdentifier];
        v43 = (void *)v8;
        [v9 setObject:v8 forKeyedSubscript:v10];

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        unint64_t v11 = (void *)MEMORY[0x1E4F2E4F8];
        long long v12 = [v7 accessories];
        long long v13 = [v11 announceAccessoriesWithAnnounceEnabledFromAccessories:v12];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v63 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v49 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              uint64_t v19 = objc_msgSend(v18, "settings", v37);
              if ([v19 isControllable]) {
                uint64_t v20 = 2;
              }
              else {
                uint64_t v20 = 0;
              }

              uint64_t v21 = [*(id *)(a1 + 32) _filteredReachabilityLevelFromReachabilityLevel:v20 forHome:v7];
              v22 = [NSNumber numberWithUnsignedInteger:v21];
              v23 = [v18 uniqueIdentifier];
              [v43 setObject:v22 forKeyedSubscript:v23];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v48 objects:v63 count:16];
          }
          while (v15);
        }

        v24 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [v7 name];
          v26 = objc_msgSend(MEMORY[0x1E4F4A8A0], "stringForAnnounceReachabilityLevel:", objc_msgSend(*(id *)(a1 + 32), "_reachabilityForHome:", v7));
          *(_DWORD *)buf = v37;
          v57 = v25;
          __int16 v58 = 2112;
          v59 = v26;
          _os_log_impl(&dword_1DA5ED000, v24, OS_LOG_TYPE_DEFAULT, "Initial Reachability [Home = %@]: %@", buf, 0x16u);
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v42 = [v7 rooms];
        uint64_t v27 = [v42 countByEnumeratingWithState:&v44 objects:v62 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v45 != v29) {
                objc_enumerationMutation(v42);
              }
              v31 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              v32 = objc_msgSend(*(id *)(a1 + 32), "log", v37);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = [v7 name];
                v34 = [v31 name];
                v35 = objc_msgSend(MEMORY[0x1E4F4A8A0], "stringForAnnounceReachabilityLevel:", objc_msgSend(*(id *)(a1 + 32), "_reachabilityForRoom:inHome:", v31, v7));
                *(_DWORD *)buf = 138412802;
                v57 = v33;
                __int16 v58 = 2112;
                v59 = v34;
                __int16 v60 = 2112;
                v61 = v35;
                _os_log_impl(&dword_1DA5ED000, v32, OS_LOG_TYPE_DEFAULT, "Initial Reachability [Home = %@, Room = %@]: %@", buf, 0x20u);
              }
            }
            uint64_t v28 = [v42 countByEnumeratingWithState:&v44 objects:v62 count:16];
          }
          while (v28);
        }

        uint64_t v6 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v40);
  }

  v36 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA5ED000, v36, OS_LOG_TYPE_DEFAULT, "Finished Setting Reachability Status", buf, 2u);
  }
}

- (void)_reevaluateHomeKitReachabilityForHome:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(ANAnnounceReachabilityManager *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = (void *)MEMORY[0x1E4F2E4F8];
  v22 = v4;
  uint64_t v7 = [v4 accessories];
  uint64_t v8 = [v6 announceAccessoriesWithAnnounceEnabledFromAccessories:v7];

  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = [(ANAnnounceReachabilityManager *)self log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v13 home];
          uint64_t v16 = [v15 name];
          uint64_t v17 = [v13 name];
          v18 = [v13 settings];
          int v19 = [v18 isControllable];
          *(_DWORD *)buf = 138412802;
          uint64_t v29 = v16;
          __int16 v30 = 2112;
          v31 = v17;
          __int16 v32 = 1024;
          int v33 = v19;
          _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_DEFAULT, "Re-evaluating Reachability for Accessory [Home = %@]: %@, Controllable = %d", buf, 0x1Cu);
        }
        uint64_t v20 = [v13 settings];
        uint64_t v21 = [v20 isControllable] ^ 1;

        [(ANAnnounceReachabilityManager *)self _updateReachabilityLevelWithReachabilityLevel:2 forAccessory:v13 operation:v21];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v10);
  }
}

- (void)_rapportActivationHandler:(id)a3
{
  id v4 = a3;
  long long v5 = [(ANAnnounceReachabilityManager *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    [(ANAnnounceReachabilityManager *)self setStarted:0];
    uint64_t v6 = [(ANAnnounceReachabilityManager *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ANAnnounceReachabilityManager _rapportActivationHandler:]((uint64_t)v4, v6);
    }
  }
  else
  {
    uint64_t v7 = [(ANAnnounceReachabilityManager *)self rapportConnection];
    uint64_t v8 = [(ANAnnounceReachabilityManager *)self serialQueue];
    [v7 addDeviceDelegate:self queue:v8];
  }
}

- (unint64_t)_reachabilityForHome:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(ANAnnounceReachabilityManager *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(ANAnnounceReachabilityManager *)self homeReachability];
  uint64_t v7 = [v4 uniqueIdentifier];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          v12 |= [v15 unsignedIntegerValue];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v12 = 0;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (unint64_t)_reachabilityForRoom:(id)a3 inHome:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = [(ANAnnounceReachabilityManager *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(ANAnnounceReachabilityManager *)self homeReachability];
  uint64_t v29 = v6;
  id v9 = [v6 uniqueIdentifier];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v26 = v10;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      unint64_t v27 = 0;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          long long v17 = objc_msgSend(v29, "accessoryWithUniqueIdentifier:", v16, v26);
          long long v18 = v17;
          if (v17)
          {
            long long v19 = [v17 room];
            long long v20 = [v19 uniqueIdentifier];
            uint64_t v21 = [v28 uniqueIdentifier];
            int v22 = [v20 isEqual:v21];

            if (v22)
            {
              v23 = [v11 objectForKeyedSubscript:v16];
              v27 |= [v23 unsignedIntegerValue];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }
    else
    {
      unint64_t v27 = 0;
    }

    uint64_t v10 = v26;
    unint64_t v24 = v27;
  }
  else
  {
    unint64_t v24 = 0;
  }

  return v24;
}

- (void)_updateReachabilityLevelWithReachabilityLevel:(unint64_t)a3 forAccessory:(id)a4 operation:(unint64_t)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(ANAnnounceReachabilityManager *)self serialQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [(ANAnnounceReachabilityManager *)self homeReachability];
  id v11 = [v8 home];
  uint64_t v12 = [v11 uniqueIdentifier];
  uint64_t v13 = [v10 objectForKeyedSubscript:v12];

  if (v13)
  {
    uint64_t v14 = [v8 uniqueIdentifier];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    if (v15)
    {
      uint64_t v16 = [v8 home];
      long long v17 = [v8 room];
      unint64_t v18 = [(ANAnnounceReachabilityManager *)self _reachabilityForRoom:v17 inHome:v16];
      unint64_t v38 = [(ANAnnounceReachabilityManager *)self _reachabilityForHome:v16];
      uint64_t v19 = [v15 unsignedIntegerValue];
      uint64_t v20 = v19;
      unint64_t v21 = v19 | a3;
      if (a5) {
        unint64_t v21 = v19;
      }
      if (a5 == 1) {
        unint64_t v22 = v19 & ~a3;
      }
      else {
        unint64_t v22 = v21;
      }
      unint64_t v23 = [(ANAnnounceReachabilityManager *)self _filteredReachabilityLevelFromReachabilityLevel:v22 forHome:v16];
      if (v23 != v20)
      {
        unint64_t v24 = [NSNumber numberWithUnsignedInteger:v23];
        long long v25 = [v8 uniqueIdentifier];
        [v13 setObject:v24 forKeyedSubscript:v25];
      }
      unint64_t v26 = [(ANAnnounceReachabilityManager *)self _reachabilityForRoom:v17 inHome:v16];
      unint64_t v27 = [(ANAnnounceReachabilityManager *)self _reachabilityForHome:v16];
      if (v26 != v18)
      {
        id v28 = [MEMORY[0x1E4F4A8A0] stringForAnnounceReachabilityLevel:v18];
        long long v37 = [MEMORY[0x1E4F4A8A0] stringForAnnounceReachabilityLevel:v26];
        uint64_t v29 = [(ANAnnounceReachabilityManager *)self log];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          [v16 name];
          long long v30 = v35 = v27;
          [v17 name];
          long long v31 = v36 = v28;
          *(_DWORD *)buf = 138413058;
          uint64_t v41 = v30;
          __int16 v42 = 2112;
          v43 = v31;
          __int16 v44 = 2112;
          long long v45 = v36;
          __int16 v46 = 2112;
          long long v47 = v37;
          _os_log_impl(&dword_1DA5ED000, v29, OS_LOG_TYPE_DEFAULT, "Reachability Changed [Home = %@, Room = %@]: %@ -> %@", buf, 0x2Au);

          id v28 = v36;
          unint64_t v27 = v35;
        }

        [(ANAnnounceReachabilityManager *)self _notifyClientsReachabilityChangeForRoom:v17 inHome:v16 toLevel:v26];
      }
      if (v27 != v38)
      {
        uint64_t v39 = objc_msgSend(MEMORY[0x1E4F4A8A0], "stringForAnnounceReachabilityLevel:");
        long long v32 = [MEMORY[0x1E4F4A8A0] stringForAnnounceReachabilityLevel:v27];
        long long v33 = [(ANAnnounceReachabilityManager *)self log];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [v16 name];
          *(_DWORD *)buf = 138412802;
          uint64_t v41 = v34;
          __int16 v42 = 2112;
          v43 = v39;
          __int16 v44 = 2112;
          long long v45 = v32;
          _os_log_impl(&dword_1DA5ED000, v33, OS_LOG_TYPE_DEFAULT, "Reachability Changed [Home = %@]: %@ -> %@", buf, 0x20u);
        }
        [(ANAnnounceReachabilityManager *)self _notifyClientsReachabilityChangeForHome:v16 toLevel:v27];
      }
    }
  }
}

- (void)_notifyClientsReachabilityChangeForRoom:(id)a3 inHome:(id)a4 toLevel:(unint64_t)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = [(ANAnnounceReachabilityManager *)self delegate];

  if (v9)
  {
    uint64_t v10 = [(ANAnnounceReachabilityManager *)self delegate];
    [v10 reachabilityLevel:a5 didChangeForRoom:v11 inHome:v8];
  }
}

- (void)_notifyClientsReachabilityChangeForHome:(id)a3 toLevel:(unint64_t)a4
{
  id v8 = a3;
  id v6 = [(ANAnnounceReachabilityManager *)self delegate];

  if (v6)
  {
    uint64_t v7 = [(ANAnnounceReachabilityManager *)self delegate];
    [v7 reachabilityLevel:a4 didChangeForHome:v8];
  }
}

- (ANAnnounceReachabilityManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANAnnounceReachabilityManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ANRapportConnectionProvider)rapportConnection
{
  return self->_rapportConnection;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableDictionary)homeReachability
{
  return self->_homeReachability;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_homeReachability, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_rapportConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didAddHome:(id)a3
{
  id v10 = a3;
  id v4 = [(ANAnnounceReachabilityManager *)self homeReachability];
  long long v5 = [v10 uniqueIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    id v8 = [(ANAnnounceReachabilityManager *)self homeReachability];
    id v9 = [v10 uniqueIdentifier];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
}

- (void)didRemoveHome:(id)a3
{
  id v4 = a3;
  id v6 = [(ANAnnounceReachabilityManager *)self homeReachability];
  long long v5 = [v4 uniqueIdentifier];

  [v6 setObject:0 forKeyedSubscript:v5];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (objc_msgSend(v6, "hmu_isHomePod") && objc_msgSend(v6, "an_supportsAnnounce"))
  {
    uint64_t v7 = [(ANAnnounceReachabilityManager *)self homeReachability];
    id v8 = [v14 uniqueIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = [v6 settings];
      if ([v10 isControllable]) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 0;
      }

      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
      uint64_t v13 = [v6 uniqueIdentifier];
      [v9 setObject:v12 forKeyedSubscript:v13];

      [(ANAnnounceReachabilityManager *)self _updateReachabilityLevelWithReachabilityLevel:v11 forAccessory:v6 operation:0];
    }
  }
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (objc_msgSend(v6, "hmu_isHomePod"))
  {
    uint64_t v7 = [(ANAnnounceReachabilityManager *)self homeReachability];
    id v8 = [v11 uniqueIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      [(ANAnnounceReachabilityManager *)self _updateReachabilityLevelWithReachabilityLevel:3 forAccessory:v6 operation:1];
      id v10 = [v6 uniqueIdentifier];
      [v9 setObject:0 forKeyedSubscript:v10];
    }
  }
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v6 = a3;
  if (objc_msgSend(v6, "hmu_isHomePod"))
  {
    id v4 = [v6 settings];
    uint64_t v5 = [v4 isControllable] ^ 1;

    [(ANAnnounceReachabilityManager *)self _updateReachabilityLevelWithReachabilityLevel:2 forAccessory:v6 operation:v5];
  }
}

- (void)connection:(id)a3 didFindDevice:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 isAccessory])
  {
    id v6 = [(ANAnnounceReachabilityManager *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v5;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "Rapport Did Find Accessory Device: %@", buf, 0xCu);
    }

    uint64_t v7 = +[ANHomeManager shared];
    id v8 = [v7 allHomes];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v8;
    uint64_t v24 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v10 = *(void *)v31;
      uint64_t v22 = *(void *)v31;
      unint64_t v23 = self;
      long long v25 = v9;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v13 = objc_msgSend(v12, "accessories", v22);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                unint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                uint64_t v19 = [v18 uniqueIdentifier];
                uint64_t v20 = [v5 homeKitIdentifier];
                int v21 = [v19 isEqual:v20];

                if (v21)
                {
                  [(ANAnnounceReachabilityManager *)v23 _updateReachabilityLevelWithReachabilityLevel:1 forAccessory:v18 operation:0];

                  id v9 = v25;
                  goto LABEL_21;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          id v9 = v25;
          uint64_t v10 = v22;
        }
        uint64_t v24 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v24);
    }
LABEL_21:
  }
}

- (void)connection:(id)a3 didLoseDevice:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 isAccessory])
  {
    id v6 = [(ANAnnounceReachabilityManager *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v5;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "Rapport Did Lose Accessory Device: %@", buf, 0xCu);
    }

    uint64_t v7 = +[ANHomeManager shared];
    id v8 = [v7 allHomes];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v8;
    uint64_t v24 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v10 = *(void *)v31;
      uint64_t v22 = *(void *)v31;
      unint64_t v23 = self;
      long long v25 = v9;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v13 = objc_msgSend(v12, "accessories", v22);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                unint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                uint64_t v19 = [v18 uniqueIdentifier];
                uint64_t v20 = [v5 homeKitIdentifier];
                int v21 = [v19 isEqual:v20];

                if (v21)
                {
                  [(ANAnnounceReachabilityManager *)v23 _updateReachabilityLevelWithReachabilityLevel:1 forAccessory:v18 operation:1];

                  id v9 = v25;
                  goto LABEL_21;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          id v9 = v25;
          uint64_t v10 = v22;
        }
        uint64_t v24 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v24);
    }
LABEL_21:
  }
}

- (void)_rapportActivationHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA5ED000, a2, OS_LOG_TYPE_ERROR, "Rapport activation failed %@", (uint8_t *)&v2, 0xCu);
}

@end
@interface LCSCaptureApplicationTCCMonitor
+ (LCSCaptureApplicationTCCMonitor)sharedMonitor;
+ (id)TCCServer;
- (BOOL)_bundleHasCameraEntitlement:(id)a3;
- (LCSCaptureApplicationTCCMonitor)init;
- (id)_fetchCameraTCCUpdatesForBundleIdentifiers:(id)a3;
- (id)_tccUpdateForAuthorizationRecord:(id)a3;
- (id)addObserver:(id)a3 forBundleIdentifiers:(id)a4;
- (unint64_t)cameraTCCStatusForBundleIdentifier:(id)a3;
- (void)_beginObservingTCC;
- (void)_endObservingTCC;
- (void)_notifyObserversOfUpdates:(id)a3;
- (void)_observerQueue_fetchInitialTCCStateForUpdatedBundleIdentifiers;
- (void)_observerQueue_notifyObserversOfUpdates:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)_setupQueue_setupTCCEventsSubscription;
- (void)_tccUpdatesAccessQueue_handleTCCEventOfType:(unint64_t)a3 authorizationRecord:(id)a4;
@end

@implementation LCSCaptureApplicationTCCMonitor

+ (LCSCaptureApplicationTCCMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedMonitor_sharedMonitor;
  return (LCSCaptureApplicationTCCMonitor *)v2;
}

uint64_t __48__LCSCaptureApplicationTCCMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(LCSCaptureApplicationTCCMonitor);
  uint64_t v1 = sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)TCCServer
{
  if (TCCServer_onceToken != -1) {
    dispatch_once(&TCCServer_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)TCCServer_tccServer;
  return v2;
}

void __44__LCSCaptureApplicationTCCMonitor_TCCServer__block_invoke()
{
  id Serial = (id)BSDispatchQueueCreateSerial();
  uint64_t v0 = tcc_server_create();
  uint64_t v1 = (void *)TCCServer_tccServer;
  TCCServer_tccServer = v0;
}

- (LCSCaptureApplicationTCCMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)LCSCaptureApplicationTCCMonitor;
  v2 = [(LCSCaptureApplicationTCCMonitor *)&v10 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = BSDispatchQueueCreateSerial();
    tccUpdatesAccessQueue = v2->_tccUpdatesAccessQueue;
    v2->_tccUpdatesAccessQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = BSDispatchQueueCreateSerial();
    tccSetupQueue = v2->_tccSetupQueue;
    v2->_tccSetupQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (id)addObserver:(id)a3 forBundleIdentifiers:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:a4];
  v8 = objc_alloc_init(_LCSCaptureApplicationTCCObservationToken);
  [(_LCSCaptureApplicationTCCObservationToken *)v8 setObserver:v6];
  [(_LCSCaptureApplicationTCCObservationToken *)v8 setBundleIdentifiers:v7];
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__LCSCaptureApplicationTCCMonitor_addObserver_forBundleIdentifiers___block_invoke;
  v15[3] = &unk_2653BECE8;
  objc_copyWeak(&v20, &location);
  id v16 = v6;
  id v17 = v7;
  objc_super v10 = v8;
  v18 = v10;
  v19 = self;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(observerQueue, v15);
  v13 = v10;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v13;
}

void __68__LCSCaptureApplicationTCCMonitor_addObserver_forBundleIdentifiers___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[3];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__LCSCaptureApplicationTCCMonitor_addObserver_forBundleIdentifiers___block_invoke_2;
    v15[3] = &unk_2653BECC0;
    id v16 = *(id *)(a1 + 32);
    uint64_t v5 = objc_msgSend(v4, "bs_firstObjectPassingTest:", v15);
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = *(void **)(a1 + 40);
      v8 = [v5 bundleIdentifiers];
      char v9 = [v7 isEqualToSet:v8];
    }
    else
    {
      char v9 = 0;
    }
    id v10 = v3[3];
    if (v10)
    {
      id v11 = (void *)[v10 mutableCopy];
    }
    else
    {
      id v11 = [MEMORY[0x263EFF9C0] set];
    }
    id v12 = v11;
    if (v6) {
      [v11 removeObject:v6];
    }
    [v12 addObject:*(void *)(a1 + 48)];
    uint64_t v13 = [v12 copy];
    id v14 = v3[3];
    v3[3] = (id)v13;

    if ((v9 & 1) == 0) {
      objc_msgSend(*(id *)(a1 + 56), "_observerQueue_fetchInitialTCCStateForUpdatedBundleIdentifiers");
    }
    if ([v3[3] count] == 1) {
      [*(id *)(a1 + 56) _beginObservingTCC];
    }
  }
}

BOOL __68__LCSCaptureApplicationTCCMonitor_addObserver_forBundleIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 observer];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (unint64_t)cameraTCCStatusForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  tccUpdatesAccessQueue = self->_tccUpdatesAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__LCSCaptureApplicationTCCMonitor_cameraTCCStatusForBundleIdentifier___block_invoke;
  block[3] = &unk_2653BED10;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(tccUpdatesAccessQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __70__LCSCaptureApplicationTCCMonitor_cameraTCCStatusForBundleIdentifier___block_invoke(void *a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  v3 = v2;
  if (v2) {
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v2 tccStatus];
  }
  if (!*(void *)(*(void *)(a1[6] + 8) + 24))
  {
    id v4 = (void *)a1[4];
    v16[0] = a1[5];
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    id v6 = [v4 _fetchCameraTCCUpdatesForBundleIdentifiers:v5];

    unint64_t v7 = [v6 firstObject];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 tccStatus];
      if (v9)
      {
        uint64_t v10 = v9;
        *(void *)(*(void *)(a1[6] + 8) + 24) = v9;
        id v11 = (void *)[*(id *)(a1[4] + 40) mutableCopy];
        uint64_t v12 = [[LCSCaptureApplicationTCCUpdate alloc] initWithBundleIdentifier:a1[5] status:v10];
        [v11 setObject:v12 forKeyedSubscript:a1[5]];

        uint64_t v13 = [v11 copy];
        uint64_t v14 = a1[4];
        uint64_t v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;
      }
    }
  }
}

- (void)_removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__LCSCaptureApplicationTCCMonitor__removeObserver___block_invoke;
  v7[3] = &unk_2653BED38;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(observerQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__LCSCaptureApplicationTCCMonitor__removeObserver___block_invoke(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[3] allObjects];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__LCSCaptureApplicationTCCMonitor__removeObserver___block_invoke_2;
    v9[3] = &unk_2653BECC0;
    id v10 = a1[4];
    uint64_t v5 = objc_msgSend(v4, "bs_firstObjectPassingTest:", v9);

    if (v5)
    {
      id v6 = (void *)[v3[3] mutableCopy];
      [v6 removeObject:v5];
      uint64_t v7 = [v6 copy];
      id v8 = v3[3];
      v3[3] = (id)v7;

      if (![v3[3] count]) {
        [a1[5] _endObservingTCC];
      }
    }
  }
}

BOOL __51__LCSCaptureApplicationTCCMonitor__removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 observer];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_observerQueue_fetchInitialTCCStateForUpdatedBundleIdentifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(NSSet *)self->_observerQueue_observerTokens count])
  {
    v3 = [MEMORY[0x263EFF9C0] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v4 = self->_observerQueue_observerTokens;
    uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v17 + 1) + 8 * v8) bundleIdentifiers];
          id v10 = [v9 allObjects];
          [v3 addObjectsFromArray:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    objc_initWeak(&location, self);
    tccUpdatesAccessQueue = self->_tccUpdatesAccessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__LCSCaptureApplicationTCCMonitor__observerQueue_fetchInitialTCCStateForUpdatedBundleIdentifiers__block_invoke;
    block[3] = &unk_2653BED60;
    objc_copyWeak(&v15, &location);
    id v14 = v3;
    id v12 = v3;
    dispatch_async(tccUpdatesAccessQueue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __97__LCSCaptureApplicationTCCMonitor__observerQueue_fetchInitialTCCStateForUpdatedBundleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_39;
  }
  from = v2;
  uint64_t v5 = [WeakRetained[5] allKeys];
  uint64_t v6 = [MEMORY[0x263EFF9C0] set];
  uint64_t v7 = [MEMORY[0x263EFF9C0] set];
  v42 = v5;
  if ([v5 count] && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    uint64_t v8 = [*(id *)(a1 + 32) allObjects];
    uint64_t v9 = [v8 differenceFromArray:v5];

    if ([v9 hasChanges])
    {
      id v10 = v4;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v54 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            long long v17 = [v16 object];
            uint64_t v18 = [v16 changeType];
            long long v19 = v7;
            if (v18 == 1 || (uint64_t v20 = [v16 changeType], v19 = v6, !v20)) {
              [v19 addObject:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v13);
      }

      BOOL v4 = v10;
      uint64_t v5 = v42;
    }
  }
  else
  {
    if (![*(id *)(a1 + 32) count]) {
      goto LABEL_19;
    }
    uint64_t v9 = [*(id *)(a1 + 32) allObjects];
    [v6 addObjectsFromArray:v9];
  }

LABEL_19:
  if ([v7 count] || objc_msgSend(v6, "count"))
  {
    v21 = [MEMORY[0x263EFF980] array];
    uint64_t v22 = (void *)[v4[5] mutableCopy];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v23 = v7;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(v23);
          }
          [v22 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * j)];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v25);
    }

    v28 = [v6 allObjects];
    v40 = v4;
    v29 = [v4 _fetchCameraTCCUpdatesForBundleIdentifiers:v28];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v45 + 1) + 8 * k);
          v36 = [v35 bundleIdentifier];
          [v22 setObject:v35 forKeyedSubscript:v36];
          [v21 addObject:v35];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v32);
    }

    uint64_t v37 = [v22 copy];
    BOOL v4 = v40;
    id v38 = v40[5];
    v40[5] = (id)v37;

    if ([v21 count]) {
      [v40 _notifyObserversOfUpdates:v21];
    }
    v39 = v40[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__LCSCaptureApplicationTCCMonitor__observerQueue_fetchInitialTCCStateForUpdatedBundleIdentifiers__block_invoke_2;
    block[3] = &unk_2653BEA18;
    objc_copyWeak(&v44, from);
    dispatch_async(v39, block);
    objc_destroyWeak(&v44);

    uint64_t v5 = v42;
  }

LABEL_39:
}

void __97__LCSCaptureApplicationTCCMonitor__observerQueue_fetchInitialTCCStateForUpdatedBundleIdentifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setupQueue_setupTCCEventsSubscription");
    id WeakRetained = v2;
  }
}

- (id)_fetchCameraTCCUpdatesForBundleIdentifiers:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = tcc_service_singleton_for_CF_name();
  uint64_t v8 = tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  uint64_t v9 = [(id)objc_opt_class() TCCServer];
  uint64_t v33 = MEMORY[0x263EF8330];
  uint64_t v34 = 3221225472;
  v35 = __78__LCSCaptureApplicationTCCMonitor__fetchCameraTCCUpdatesForBundleIdentifiers___block_invoke;
  v36 = &unk_2653BED88;
  uint64_t v37 = self;
  id v38 = v4;
  id v39 = v5;
  id v10 = v6;
  id v40 = v10;
  uint64_t v25 = (void *)v8;
  uint64_t v26 = (void *)v7;
  tcc_server_message_get_authorization_records_by_service();

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __78__LCSCaptureApplicationTCCMonitor__fetchCameraTCCUpdatesForBundleIdentifiers___block_invoke_2;
  v31[3] = &unk_2653BEDB0;
  id v23 = v39;
  id v24 = v38;
  id v32 = v23;
  id v11 = objc_msgSend(v38, "bs_filter:", v31);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        BOOL v17 = [(LCSCaptureApplicationTCCMonitor *)self _bundleHasCameraEntitlement:v16];
        uint64_t v18 = [LCSCaptureApplicationTCCUpdate alloc];
        if (v17) {
          uint64_t v19 = 4;
        }
        else {
          uint64_t v19 = 1;
        }
        uint64_t v20 = [(LCSCaptureApplicationTCCUpdate *)v18 initWithBundleIdentifier:v16 status:v19];
        [v10 addObject:v20];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v13);
  }
  v21 = (void *)[v10 copy];

  return v21;
}

void __78__LCSCaptureApplicationTCCMonitor__fetchCameraTCCUpdatesForBundleIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    id v4 = [*(id *)(a1 + 32) _tccUpdateForAuthorizationRecord:a2];
    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 40);
      id v9 = v4;
      uint64_t v6 = [v4 bundleIdentifier];
      LODWORD(v5) = [v5 containsObject:v6];

      id v4 = v9;
      if (v5)
      {
        uint64_t v7 = *(void **)(a1 + 48);
        uint64_t v8 = [v9 bundleIdentifier];
        [v7 addObject:v8];

        [*(id *)(a1 + 56) addObject:v9];
        id v4 = v9;
      }
    }
  }
}

uint64_t __78__LCSCaptureApplicationTCCMonitor__fetchCameraTCCUpdatesForBundleIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (BOOL)_bundleHasCameraEntitlement:(id)a3
{
  v3 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:a3 allowPlaceholder:1 error:0];
  id v4 = [v3 entitlements];
  uint64_t v5 = self;
  uint64_t v6 = [v4 objectForKey:@"com.apple.private.tcc.allow" ofClass:v5];

  LOBYTE(v5) = [v6 containsObject:*MEMORY[0x263F7C510]];
  return (char)v5;
}

- (void)_beginObservingTCC
{
  objc_initWeak(&location, self);
  tccSetupQueue = self->_tccSetupQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__LCSCaptureApplicationTCCMonitor__beginObservingTCC__block_invoke;
  v4[3] = &unk_2653BEA18;
  objc_copyWeak(&v5, &location);
  dispatch_async(tccSetupQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__LCSCaptureApplicationTCCMonitor__beginObservingTCC__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setupQueue_setupTCCEventsSubscription");
    id WeakRetained = v2;
  }
}

- (void)_setupQueue_setupTCCEventsSubscription
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = (id)*MEMORY[0x263F7C510];
  xpc_object_t v4 = xpc_array_create(0, 0);
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__LCSCaptureApplicationTCCMonitor__setupQueue_setupTCCEventsSubscription__block_invoke;
  block[3] = &unk_2653BEA90;
  void block[4] = self;
  void block[5] = &v32;
  dispatch_sync(observerQueue, block);
  uint64_t v6 = [MEMORY[0x263EFF9C0] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = (id)v33[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [*(id *)(*((void *)&v27 + 1) + 8 * i) bundleIdentifiers];
        uint64_t v12 = [v11 allObjects];
        [v6 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, (const char *)[*(id *)(*((void *)&v23 + 1) + 8 * j) cStringUsingEncoding:4]);
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v40 count:16];
    }
    while (v14);
  }

  id v17 = v3;
  keys = (char *)[v17 UTF8String];
  id v18 = v4;
  xpc_object_t values = v18;
  xpc_object_t v19 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  uint64_t v20 = (void *)tcc_events_filter_create_with_criteria();
  objc_initWeak(&location, self);
  [@"com.apple.LockedContentServices.TCCMonitor" cStringUsingEncoding:4];
  objc_copyWeak(&v21, &location);
  tcc_events_subscribe();
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v32, 8);
}

void __73__LCSCaptureApplicationTCCMonitor__setupQueue_setupTCCEventsSubscription__block_invoke(uint64_t a1)
{
}

void __73__LCSCaptureApplicationTCCMonitor__setupQueue_setupTCCEventsSubscription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_tccUpdatesAccessQueue_handleTCCEventOfType:authorizationRecord:", a2, v7);
  }
}

- (void)_tccUpdatesAccessQueue_handleTCCEventOfType:(unint64_t)a3 authorizationRecord:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v5 = [(LCSCaptureApplicationTCCMonitor *)self _tccUpdateForAuthorizationRecord:a4];
    if (v5)
    {
      uint64_t v6 = (void *)[(NSDictionary *)self->_tccUpdatesAccessQueue_latestTCCUpdatesByBundleIdentifier mutableCopy];
      id v7 = [v5 bundleIdentifier];
      [v6 setObject:v5 forKeyedSubscript:v7];

      uint64_t v8 = (NSDictionary *)[v6 copy];
      tccUpdatesAccessQueue_latestTCCUpdatesByBundleIdentifier = self->_tccUpdatesAccessQueue_latestTCCUpdatesByBundleIdentifier;
      self->_tccUpdatesAccessQueue_latestTCCUpdatesByBundleIdentifier = v8;

      v11[0] = v5;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      [(LCSCaptureApplicationTCCMonitor *)self _notifyObserversOfUpdates:v10];
    }
  }
}

- (id)_tccUpdateForAuthorizationRecord:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = tcc_authorization_record_get_subject_identity();
  if (tcc_identity_get_type())
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = [NSString stringWithCString:tcc_identity_get_identifier() encoding:4];
    id v7 = [LCSCaptureApplicationTCCUpdate alloc];
    unint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    if (authorization_right > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_255095F60[authorization_right];
    }
    id v5 = [(LCSCaptureApplicationTCCUpdate *)v7 initWithBundleIdentifier:v6 status:v9];
  }
  return v5;
}

- (void)_notifyObserversOfUpdates:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__LCSCaptureApplicationTCCMonitor__notifyObserversOfUpdates___block_invoke;
  block[3] = &unk_2653BED60;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__LCSCaptureApplicationTCCMonitor__notifyObserversOfUpdates___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_observerQueue_notifyObserversOfUpdates:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)_observerQueue_notifyObserversOfUpdates:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSSet *)self->_observerQueue_observerTokens allObjects];
  id v6 = (void *)[v5 copy];

  if ([v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __75__LCSCaptureApplicationTCCMonitor__observerQueue_notifyObserversOfUpdates___block_invoke;
          v15[3] = &unk_2653BEE00;
          void v15[4] = v11;
          uint64_t v12 = objc_msgSend(v4, "bs_filter:", v15);
          id v13 = [v11 observer];
          [v13 tccMonitor:self didUpdateCameraTCCStatuses:v12];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __75__LCSCaptureApplicationTCCMonitor__observerQueue_notifyObserversOfUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 bundleIdentifiers];
  id v5 = [v3 bundleIdentifier];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (void)_endObservingTCC
{
}

uint64_t __51__LCSCaptureApplicationTCCMonitor__endObservingTCC__block_invoke()
{
  uint64_t v0 = [@"com.apple.LockedContentServices.TCCMonitor" cStringUsingEncoding:4];
  return MEMORY[0x270F796D0](v0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccUpdatesAccessQueue_latestTCCUpdatesByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_tccUpdatesAccessQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue_observerTokens, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_tccSetupQueue, 0);
}

@end
@interface HFLocationManagerDispatcher
+ (HFLocationManagerDispatcher)sharedDispatcher;
- (BOOL)hasInitializedAuthorizationStatus;
- (CLLocationManager)locationManager;
- (HFLocationManagerDispatcher)init;
- (NAFuture)authorizationStatusFuture;
- (NSHashTable)locationObservers;
- (NSMutableArray)pendingAuthorizationStatusFutures;
- (OS_dispatch_queue)queue;
- (id)getAuthorizationStatusAsync;
- (int)authorizationStatus;
- (int)cachedAuthorizationStatus;
- (void)_updateCachedAuthorizationStatus:(int)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)dispatchLocationManagerObserverMessage:(SEL)a3 withBlock:(id)a4 sender:(id)a5;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didFinishDeferredUpdatesWithError:(id)a4;
- (void)locationManager:(id)a3 didRangeBeacons:(id)a4 inRegion:(id)a5;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 didUpdateHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)locationManager:(id)a3 rangingBeaconsDidFailForRegion:(id)a4 withError:(id)a5;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)locationManagerDidPauseLocationUpdates:(id)a3;
- (void)locationManagerDidResumeLocationUpdates:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCachedAuthorizationStatus:(int)a3;
- (void)setHasInitializedAuthorizationStatus:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)triggerLocationFetch;
@end

@implementation HFLocationManagerDispatcher

void __64__HFLocationManagerDispatcher__updateCachedAuthorizationStatus___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v4 = "unavailable";
    if ((v3 - 3) < 2) {
      v4 = "available";
    }
    *(_DWORD *)buf = 67109378;
    int v10 = v3;
    __int16 v11 = 2080;
    v12 = v4;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Updating location services authorization status to %d (%s)", buf, 0x12u);
  }

  [*(id *)(a1 + 32) setHasInitializedAuthorizationStatus:1];
  [*(id *)(a1 + 32) setCachedAuthorizationStatus:*(unsigned int *)(a1 + 40)];
  v5 = [*(id *)(a1 + 32) pendingAuthorizationStatusFutures];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HFLocationManagerDispatcher__updateCachedAuthorizationStatus___block_invoke_17;
  v7[3] = &__block_descriptor_36_e18_v16__0__NAFuture_8l;
  int v8 = *(_DWORD *)(a1 + 40);
  objc_msgSend(v5, "na_each:", v7);

  v6 = [*(id *)(a1 + 32) pendingAuthorizationStatusFutures];
  [v6 removeAllObjects];
}

- (NSMutableArray)pendingAuthorizationStatusFutures
{
  return self->_pendingAuthorizationStatusFutures;
}

- (void)setHasInitializedAuthorizationStatus:(BOOL)a3
{
  self->_hasInitializedAuthorizationStatus = a3;
}

- (void)setCachedAuthorizationStatus:(int)a3
{
  self->_cachedAuthorizationStatus = a3;
}

+ (HFLocationManagerDispatcher)sharedDispatcher
{
  if (_MergedGlobals_217 != -1) {
    dispatch_once(&_MergedGlobals_217, &__block_literal_global_4);
  }
  v2 = (void *)qword_26AB2ED08;
  return (HFLocationManagerDispatcher *)v2;
}

void __58__HFLocationManagerDispatcher_getAuthorizationStatusAsync__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "authorizationStatus"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 finishWithResult:v5];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (+[HFUtilities isAMac]
    || +[HFUtilities isAVisionPro])
  {
    -[HFLocationManagerDispatcher _updateMacAuthorizationStatus:](self, "_updateMacAuthorizationStatus:", [v5 authorizationStatus]);
  }
  v6 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v5;
    __int16 v12 = 1024;
    int v13 = [v5 authorizationStatus];
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "locationManagerDidChangeAuthorization: %@ status: %d", buf, 0x12u);
  }

  -[HFLocationManagerDispatcher _updateCachedAuthorizationStatus:](self, "_updateCachedAuthorizationStatus:", [v5 authorizationStatus]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__HFLocationManagerDispatcher_locationManagerDidChangeAuthorization___block_invoke;
  v8[3] = &unk_26408E618;
  id v9 = v5;
  id v7 = v5;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v8 sender:0];
}

- (int)authorizationStatus
{
  LODWORD(v3) = [(HFLocationManagerDispatcher *)self cachedAuthorizationStatus];
  if (![(HFLocationManagerDispatcher *)self hasInitializedAuthorizationStatus])
  {
    id v4 = (void *)MEMORY[0x263F00A60];
    id v5 = HFPlatformSpecificHomeAppBundleID();
    uint64_t v3 = [v4 authorizationStatusForBundleIdentifier:v5];

    [(HFLocationManagerDispatcher *)self _updateCachedAuthorizationStatus:v3];
  }
  return v3;
}

void __35__HFLocationManagerDispatcher_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F00A60]);
  uint64_t v3 = HFPlatformSpecificHomeAppBundleID();
  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 queue];
  v6 = (void *)[v2 initWithEffectiveBundleIdentifier:v3 delegate:v4 onQueue:v5];
  [*(id *)(a1 + 32) setLocationManager:v6];

  id v7 = *(void **)(a1 + 32);
  id v8 = [v7 locationManager];
  objc_msgSend(v7, "_updateCachedAuthorizationStatus:", objc_msgSend(v8, "authorizationStatus"));
}

- (void)_updateCachedAuthorizationStatus:(int)a3
{
  id v5 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__HFLocationManagerDispatcher__updateCachedAuthorizationStatus___block_invoke;
  v6[3] = &unk_26408E528;
  int v7 = a3;
  v6[4] = self;
  [v5 performBlock:v6];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setLocationManager:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (NAFuture)authorizationStatusFuture
{
  BOOL v3 = [(HFLocationManagerDispatcher *)self hasInitializedAuthorizationStatus];
  id v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[HFLocationManagerDispatcher cachedAuthorizationStatus](self, "cachedAuthorizationStatus"));
    id v6 = [v4 futureWithResult:v5];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F58190]);
    id v5 = [(HFLocationManagerDispatcher *)self pendingAuthorizationStatusFutures];
    [v5 addObject:v6];
  }

  return (NAFuture *)v6;
}

- (BOOL)hasInitializedAuthorizationStatus
{
  return self->_hasInitializedAuthorizationStatus;
}

- (int)cachedAuthorizationStatus
{
  return self->_cachedAuthorizationStatus;
}

void __87__HFLocationManagerDispatcher_dispatchLocationManagerObserverMessage_withBlock_sender___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [*(id *)(a1 + 32) locationObservers];
  BOOL v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v9 = HFLogForCategory(0x2BuLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v8;
          _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "observer:%@", buf, 0xCu);
        }

        if (v8 != *(void *)(a1 + 40) && (objc_opt_respondsToSelector() & 1) != 0)
        {
          int v10 = HFLogForCategory(0x2BuLL);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = v8;
            _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "observer responds to selector:%@", buf, 0xCu);
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

uint64_t __69__HFLocationManagerDispatcher_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManagerDidChangeAuthorization:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFLocationManagerDispatcher *)self locationObservers];
  [v5 addObject:v4];
}

- (void)dispatchLocationManagerObserverMessage:(SEL)a3 withBlock:(id)a4 sender:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = [(HFLocationManagerDispatcher *)self locationObservers];
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "all observers:%@", buf, 0xCu);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__HFLocationManagerDispatcher_dispatchLocationManagerObserverMessage_withBlock_sender___block_invoke;
  v14[3] = &unk_26408E578;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  SEL v17 = a3;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

- (NSHashTable)locationObservers
{
  return self->_locationObservers;
}

- (id)getAuthorizationStatusAsync
{
  id v2 = (void *)MEMORY[0x263F58190];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HFLocationManagerDispatcher_getAuthorizationStatusAsync__block_invoke;
  v6[3] = &unk_26408E4E0;
  v6[4] = self;
  BOOL v3 = [MEMORY[0x263F581B8] globalAsyncScheduler];
  id v4 = [v2 futureWithBlock:v6 scheduler:v3];

  return v4;
}

uint64_t __47__HFLocationManagerDispatcher_sharedDispatcher__block_invoke_2()
{
  v0 = objc_alloc_init(HFLocationManagerDispatcher);
  uint64_t v1 = qword_26AB2ED08;
  qword_26AB2ED08 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFLocationManagerDispatcher)init
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)HFLocationManagerDispatcher;
  id v2 = [(HFLocationManagerDispatcher *)&v18 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFF8000, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Home.LocationDispatcher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    pendingAuthorizationStatusFutures = v2->_pendingAuthorizationStatusFutures;
    v2->_pendingAuthorizationStatusFutures = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    locationObservers = v2->_locationObservers;
    v2->_locationObservers = (NSHashTable *)v8;

    int v10 = HFLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      locationManager = v2->_locationManager;
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v2;
      __int16 v21 = 2112;
      v22 = locationManager;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Initialized location manager dispatcher: %@ with manager: %@", buf, 0x16u);
    }

    id v12 = HFLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v2->_locationObservers;
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (HFLocationManagerDispatcher *)v13;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Initializing location observers: %@", buf, 0xCu);
    }

    long long v14 = [(HFLocationManagerDispatcher *)v2 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__HFLocationManagerDispatcher_init__block_invoke;
    block[3] = &unk_26408DDE0;
    SEL v17 = v2;
    dispatch_async(v14, block);
  }
  return v2;
}

- (void)dealloc
{
  BOOL v3 = [(HFLocationManagerDispatcher *)self locationManager];
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    id v5 = [(HFLocationManagerDispatcher *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__HFLocationManagerDispatcher_dealloc__block_invoke;
    block[3] = &unk_26408DDE0;
    id v8 = v3;
    dispatch_after(v4, v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)HFLocationManagerDispatcher;
  [(HFLocationManagerDispatcher *)&v6 dealloc];
}

void __64__HFLocationManagerDispatcher__updateCachedAuthorizationStatus___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = *(unsigned int *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithInt:v3];
  [v4 finishWithResult:v5];
}

- (void)triggerLocationFetch
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(HFLocationManagerDispatcher *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__HFLocationManagerDispatcher_triggerLocationFetch__block_invoke;
  v4[3] = &unk_26408E550;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__HFLocationManagerDispatcher_triggerLocationFetch__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained locationManager];
  int v2 = [v1 locationServicesEnabled];

  if (v2)
  {
    uint64_t v3 = [WeakRetained locationManager];
    [v3 requestLocation];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFLocationManagerDispatcher *)self locationObservers];
  [v5 removeObject:v4];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__HFLocationManagerDispatcher_locationManager_didUpdateLocations___block_invoke;
  v11[3] = &unk_26408E5A0;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v11 sender:0];
}

uint64_t __66__HFLocationManagerDispatcher_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManager:*(void *)(a1 + 32) didUpdateLocations:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "didUpdateHeading: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__HFLocationManagerDispatcher_locationManager_didUpdateHeading___block_invoke;
  v12[3] = &unk_26408E5A0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v12 sender:0];
}

uint64_t __64__HFLocationManagerDispatcher_locationManager_didUpdateHeading___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManager:*(void *)(a1 + 32) didUpdateHeading:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = a4;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "didDetermineState: %d forRegion: %@", buf, 0x12u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__HFLocationManagerDispatcher_locationManager_didDetermineState_forRegion___block_invoke;
  v14[3] = &unk_26408E5C8;
  id v16 = v10;
  int64_t v17 = a4;
  id v15 = v9;
  id v12 = v10;
  id v13 = v9;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v14 sender:0];
}

uint64_t __75__HFLocationManagerDispatcher_locationManager_didDetermineState_forRegion___block_invoke(void *a1, void *a2)
{
  return [a2 locationManager:a1[4] didDetermineState:a1[6] forRegion:a1[5]];
}

- (void)locationManager:(id)a3 didRangeBeacons:(id)a4 inRegion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "didRangeBeacons: %@ inRegion: %@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __72__HFLocationManagerDispatcher_locationManager_didRangeBeacons_inRegion___block_invoke;
  v16[3] = &unk_26408E5F0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v16 sender:0];
}

uint64_t __72__HFLocationManagerDispatcher_locationManager_didRangeBeacons_inRegion___block_invoke(void *a1, void *a2)
{
  return [a2 locationManager:a1[4] didRangeBeacons:a1[5] inRegion:a1[6]];
}

- (void)locationManager:(id)a3 rangingBeaconsDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "rangingBeaconsDidFailForRegion: %@ withError: %@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__HFLocationManagerDispatcher_locationManager_rangingBeaconsDidFailForRegion_withError___block_invoke;
  v16[3] = &unk_26408E5F0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v16 sender:0];
}

uint64_t __88__HFLocationManagerDispatcher_locationManager_rangingBeaconsDidFailForRegion_withError___block_invoke(void *a1, void *a2)
{
  return [a2 locationManager:a1[4] rangingBeaconsDidFailForRegion:a1[5] withError:a1[6]];
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "didEnterRegion: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HFLocationManagerDispatcher_locationManager_didEnterRegion___block_invoke;
  v12[3] = &unk_26408E5A0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v12 sender:0];
}

uint64_t __62__HFLocationManagerDispatcher_locationManager_didEnterRegion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManager:*(void *)(a1 + 32) didEnterRegion:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "didExitRegion: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__HFLocationManagerDispatcher_locationManager_didExitRegion___block_invoke;
  v12[3] = &unk_26408E5A0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v12 sender:0];
}

uint64_t __61__HFLocationManagerDispatcher_locationManager_didExitRegion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManager:*(void *)(a1 + 32) didExitRegion:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "didFailWithError: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__HFLocationManagerDispatcher_locationManager_didFailWithError___block_invoke;
  v12[3] = &unk_26408E5A0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v12 sender:0];
}

uint64_t __64__HFLocationManagerDispatcher_locationManager_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManager:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "monitoringDidFailForRegion: %@ withError: %@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__HFLocationManagerDispatcher_locationManager_monitoringDidFailForRegion_withError___block_invoke;
  v16[3] = &unk_26408E5F0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v16 sender:0];
}

uint64_t __84__HFLocationManagerDispatcher_locationManager_monitoringDidFailForRegion_withError___block_invoke(void *a1, void *a2)
{
  return [a2 locationManager:a1[4] monitoringDidFailForRegion:a1[5] withError:a1[6]];
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "didStartMonitoringForRegion: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HFLocationManagerDispatcher_locationManager_didStartMonitoringForRegion___block_invoke;
  v12[3] = &unk_26408E5A0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v12 sender:0];
}

uint64_t __75__HFLocationManagerDispatcher_locationManager_didStartMonitoringForRegion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManager:*(void *)(a1 + 32) didStartMonitoringForRegion:*(void *)(a1 + 40)];
}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  id v5 = a3;
  objc_super v6 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "DidPauseLocationUpdates", buf, 2u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HFLocationManagerDispatcher_locationManagerDidPauseLocationUpdates___block_invoke;
  v8[3] = &unk_26408E618;
  id v9 = v5;
  id v7 = v5;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v8 sender:0];
}

uint64_t __70__HFLocationManagerDispatcher_locationManagerDidPauseLocationUpdates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManagerDidPauseLocationUpdates:*(void *)(a1 + 32)];
}

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  id v5 = a3;
  objc_super v6 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "DidResumeLocationUpdates", buf, 2u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__HFLocationManagerDispatcher_locationManagerDidResumeLocationUpdates___block_invoke;
  v8[3] = &unk_26408E618;
  id v9 = v5;
  id v7 = v5;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v8 sender:0];
}

uint64_t __71__HFLocationManagerDispatcher_locationManagerDidResumeLocationUpdates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManagerDidResumeLocationUpdates:*(void *)(a1 + 32)];
}

- (void)locationManager:(id)a3 didFinishDeferredUpdatesWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "didFinishDeferredUpdatesWithError: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__HFLocationManagerDispatcher_locationManager_didFinishDeferredUpdatesWithError___block_invoke;
  v12[3] = &unk_26408E5A0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(HFLocationManagerDispatcher *)self dispatchLocationManagerObserverMessage:a2 withBlock:v12 sender:0];
}

uint64_t __81__HFLocationManagerDispatcher_locationManager_didFinishDeferredUpdatesWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationManager:*(void *)(a1 + 32) didFinishDeferredUpdatesWithError:*(void *)(a1 + 40)];
}

- (void)setQueue:(id)a3
{
}

- (void)setLocationObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAuthorizationStatusFutures, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
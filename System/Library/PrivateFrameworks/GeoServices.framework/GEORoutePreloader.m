@interface GEORoutePreloader
- (BOOL)isPluggedIn;
- (GEOApplicationAuditToken)auditToken;
- (GEOComposedRoute)route;
- (GEORoutePreloader)init;
- (GEORoutePreloader)initWithRoute:(id)a3 strategies:(id)a4;
- (GEORoutePreloader)initWithRoute:(id)a3 strategies:(id)a4 auditToken:(id)a5;
- (GEORoutePreloaderDelegate)delegate;
- (unint64_t)networkQuality;
- (void)_networkReachabilityChanged:(id)a3;
- (void)_performTearDown;
- (void)_registerForBatteryStatusChanges;
- (void)_registerForNetworkQualityObservation;
- (void)_start;
- (void)_stop;
- (void)_unregisterForBatteryStatusChanges;
- (void)_unregisterForNetworkQualityObservation;
- (void)_updateBatteryState;
- (void)_updateObservedNetworkPerformanceForDownload:(unint64_t)a3 duration:(double)a4;
- (void)dealloc;
- (void)incrementTileLoadStatistic:(int64_t)a3 amount:(unint64_t)a4;
- (void)preloadStrategy:(uint64_t)a3 failedToLoadTileKey:(uint64_t)a4 error:(void *)a5;
- (void)preloadStrategy:(uint64_t)a3 loadedTileKey:(uint64_t)a4 source:(uint64_t)a5 sizeInBytes:(uint64_t)a6;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)tearDown;
- (void)tileLoader:(void *)a3 failedTileKey:(unsigned char *)a4 error:(void *)a5 withOptions:(char)a6;
- (void)tileLoader:(void *)a3 loadedTileKey:(unsigned char *)a4 sizeInBytes:(uint64_t)a5 fromSource:(uint64_t)a6 withOptions:(char)a7;
- (void)updateObservedNetworkPerformanceForDownload:(unint64_t)a3 duration:(double)a4;
- (void)updateObservedNetworkPerformanceWithServerError;
- (void)updateWithRouteMatch:(id)a3;
@end

@implementation GEORoutePreloader

void __58__GEORoutePreloader__registerForNetworkQualityObservation__block_invoke(uint64_t a1)
{
  v2 = +[GEONetworkObserver sharedNetworkObserver];
  char v3 = [v2 isNetworkReachable];

  if (v3)
  {
    v4 = +[GEONetworkObserver sharedNetworkObserver];
    int v5 = [v4 isCellConnection];

    uint64_t v6 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 6;
    }
    if (*(unsigned char *)(v6 + 76)) {
      ++v7;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = 1;
  }
  *(void *)(v6 + 40) = v7;
}

void __49__GEORoutePreloader__networkReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  char v3 = [v2 objectForKey:@"GEONetworkObserverReachable"];

  int v4 = [v3 BOOLValue];
  int v5 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "[NetworkQuality] Network reachability changed: %i", buf, 8u);
  }

  *(void *)buf = 0;
  v29 = buf;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __49__GEORoutePreloader__networkReachabilityChanged___block_invoke_14;
  v18 = &unk_1E53DD2E8;
  uint64_t v19 = v6;
  v20 = buf;
  char v22 = v4;
  v21 = &v23;
  geo_isolate_sync_data();
  if (*((void *)v29 + 3) != v24[3])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 40) + 16);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "observedNetworkQualityDidChangeFrom:to:", *((void *)v29 + 3), v24[3], (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v27 count:16];
      }
      while (v8);
    }
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(buf, 8);
}

- (void)preloadStrategy:(uint64_t)a3 loadedTileKey:(uint64_t)a4 source:(uint64_t)a5 sizeInBytes:(uint64_t)a6
{
  [*(id *)(a1 + 80) loadedTileKey:a4 source:a5 sizeInBytes:a6];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained routePreloader:a1 loadedTileKey:a4 source:a5];
}

void __42__GEORoutePreloader_updateWithRouteMatch___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) route];
  char v3 = *(void **)(*(void *)(a1 + 40) + 24);

  if (v2 != v3)
  {
    int v4 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Active route changed", buf, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 32) route];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 40) + 16);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (v2 == v3) {
          objc_msgSend(v13, "updateWithRouteMatch:", *(void *)(a1 + 32), (void)v14);
        }
        else {
          [v13 updateWithRoute:*(void *)(*(void *)(a1 + 40) + 24) routeMatch:*(void *)(a1 + 32)];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_unregisterForNetworkQualityObservation
{
  char v3 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "[NetworkQuality] No longer listening for network reachability changes", v5, 2u);
  }

  int v4 = +[GEONetworkObserver sharedNetworkObserver];
  [v4 removeNetworkReachableObserver:self];
}

- (GEORoutePreloader)init
{
  result = (GEORoutePreloader *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORoutePreloader)initWithRoute:(id)a3 strategies:(id)a4
{
  return [(GEORoutePreloader *)self initWithRoute:a3 strategies:a4 auditToken:0];
}

- (GEORoutePreloader)initWithRoute:(id)a3 strategies:(id)a4 auditToken:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isOfflineRoute])
  {
    uint64_t v25 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)GEORoutePreloader;
    uint64_t v12 = [(GEORoutePreloader *)&v31 init];
    if (v12)
    {
      uint64_t v13 = geo_dispatch_queue_create();
      workQueue = v12->_workQueue;
      v12->_workQueue = (OS_dispatch_queue *)v13;

      uint64_t v15 = geo_isolater_create();
      deviceQualitiesIsolation = v12->_deviceQualitiesIsolation;
      v12->_deviceQualitiesIsolation = (geo_isolater *)v15;

      objc_storeStrong((id *)&v12->_route, a3);
      objc_storeStrong((id *)&v12->_auditToken, a5);
      v12->_networkQuality = 4;
      v12->_batteryNotificationToken = -1;
      uint64_t v17 = [v10 copy];
      strategies = v12->_strategies;
      v12->_strategies = (NSArray *)v17;

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v19 = v12->_strategies;
      uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v28 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            objc_msgSend(v24, "setPreloader:", v12, (void)v27);
            [v24 updateWithRoute:v12->_route routeMatch:0];
          }
          uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v21);
      }
    }
    self = v12;
    uint64_t v25 = self;
  }

  return v25;
}

- (void)tearDown
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __29__GEORoutePreloader_tearDown__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_didTearDown, v2);
}

void __29__GEORoutePreloader_tearDown__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__GEORoutePreloader_tearDown__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __29__GEORoutePreloader_tearDown__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performTearDown];
}

- (void)dealloc
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__GEORoutePreloader_dealloc__block_invoke;
  v4[3] = &unk_1E53D79D8;
  v4[4] = self;
  GEOOnce((uint64_t)&self->_didTearDown, v4);
  v3.receiver = self;
  v3.super_class = (Class)GEORoutePreloader;
  [(GEORoutePreloader *)&v3 dealloc];
}

uint64_t __28__GEORoutePreloader_dealloc__block_invoke(uint64_t a1)
{
  v2 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_FAULT, "Client did not tear down instance. -dealloc was called without a call to -tearDown", v4, 2u);
  }

  return [*(id *)(a1 + 32) _performTearDown];
}

- (void)_performTearDown
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[GEOTileLoader modernLoader];
  [v3 unregisterObserver:self];

  [(GEORoutePreloader *)self _unregisterForNetworkQualityObservation];
  [(GEORoutePreloader *)self _unregisterForBatteryStatusChanges];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v4 = self->_strategies;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "performTearDown", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  statistics = self->_statistics;
  [(GEOComposedRoute *)self->_route distance];
  -[GEORoutePreloaderStatisticsInfo finishAndReportIfNecessaryForDistance:](statistics, "finishAndReportIfNecessaryForDistance:");
}

- (void)stop
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__GEORoutePreloader_stop__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __25__GEORoutePreloader_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)_stop
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_running)
  {
    self->_running = 0;
    objc_super v3 = +[GEOTileLoader modernLoader];
    [v3 unregisterObserver:self];

    int v4 = +[GEONetworkObserver sharedNetworkObserver];
    [v4 removeNetworkReachableObserver:self];

    [(GEORoutePreloader *)self _unregisterForBatteryStatusChanges];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = self->_strategies;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "stop", (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)start
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__GEORoutePreloader_start__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __26__GEORoutePreloader_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)_start
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_running) {
    [(GEORoutePreloader *)self _stop];
  }
  objc_super v3 = +[GEOTileLoader modernLoader];
  [v3 registerObserver:self];

  [(GEORoutePreloader *)self _registerForNetworkQualityObservation];
  [(GEORoutePreloader *)self _registerForBatteryStatusChanges];
  if (!self->_statistics)
  {
    int v4 = [[GEORoutePreloaderStatisticsInfo alloc] initWithTransportType:[(GEOComposedRoute *)self->_route transportType]];
    statistics = self->_statistics;
    self->_statistics = v4;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_strategies;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "start", (void)v11);
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)updateWithRouteMatch:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__GEORoutePreloader_updateWithRouteMatch___block_invoke;
  v7[3] = &unk_1E53D8998;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (unint64_t)networkQuality
{
  uint64_t v5 = self->_deviceQualitiesIsolation;
  _geo_isolate_lock_data();
  unint64_t networkQuality = self->_networkQuality;
  _geo_isolate_unlock();

  return networkQuality;
}

- (void)_registerForNetworkQualityObservation
{
  objc_super v3 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "[NetworkQuality] Listening for network reachability changes", buf, 2u);
  }

  id v4 = +[GEONetworkObserver sharedNetworkObserver];
  [v4 addNetworkReachableObserver:self selector:sel__networkReachabilityChanged_];

  geo_isolate_sync();
}

- (void)_networkReachabilityChanged:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__GEORoutePreloader__networkReachabilityChanged___block_invoke;
  v7[3] = &unk_1E53D8998;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __49__GEORoutePreloader__networkReachabilityChanged___block_invoke_14(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 40);
  if (*(unsigned char *)(a1 + 56) != (*(void *)(*(void *)(a1 + 32) + 40) == 1))
  {
    if (*(unsigned char *)(a1 + 56))
    {
      v2 = +[GEONetworkObserver sharedNetworkObserver];
      char v3 = [v2 isCellConnection];

      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      if (v3) {
        uint64_t v5 = 4;
      }
      else {
        uint64_t v5 = 6;
      }
      if (*(unsigned char *)(*(void *)(a1 + 32) + 76)) {
        ++v5;
      }
    }
    else
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v5 = 1;
    }
    *(void *)(v4 + 24) = v5;
    *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (void)updateObservedNetworkPerformanceForDownload:(unint64_t)a3 duration:(double)a4
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__GEORoutePreloader_updateObservedNetworkPerformanceForDownload_duration___block_invoke;
  block[3] = &unk_1E53D7FE8;
  block[4] = self;
  void block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(workQueue, block);
}

uint64_t __74__GEORoutePreloader_updateObservedNetworkPerformanceForDownload_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateObservedNetworkPerformanceForDownload:*(void *)(a1 + 40) duration:*(double *)(a1 + 48)];
}

- (void)_updateObservedNetworkPerformanceForDownload:(unint64_t)a3 duration:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __75__GEORoutePreloader__updateObservedNetworkPerformanceForDownload_duration___block_invoke;
  uint64_t v16 = &unk_1E53DD298;
  uint64_t v17 = self;
  v18 = &v26;
  double v21 = a4;
  uint64_t v19 = &v22;
  unint64_t v20 = a3;
  geo_isolate_sync_data();
  if (v27[3] != v23[3])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = self->_strategies;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "observedNetworkQualityDidChangeFrom:to:", v27[3], v23[3], (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v30 count:16];
      }
      while (v6);
    }
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

void __75__GEORoutePreloader__updateObservedNetworkPerformanceForDownload_duration___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 40);
  unint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40) & 0xFFFFFFFFFFFFFFFELL;
  if (v2 == 2)
  {
    unint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      double v10 = *(double *)(a1 + 64);
      if (v10 < 5.0 || (double)v9 / 1000.0 / v10 > 20.0)
      {
        long long v11 = GEOGetRoutePreloaderLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          unint64_t v12 = *(void *)(a1 + 56);
          double v13 = (double)v12 / 1000.0 / *(double *)(a1 + 64);
          int v14 = 134349312;
          unint64_t v15 = v12;
          __int16 v16 = 2048;
          double v17 = v13;
          _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "[NetworkQuality] Loaded %{public,bytes}llu with network data rate of %.1fKB/s. Transitioning to good network quality", (uint8_t *)&v14, 0x16u);
        }

        BOOL v7 = *(unsigned char *)(*(void *)(a1 + 32) + 76) == 0;
        uint64_t v8 = 4;
        goto LABEL_14;
      }
    }
LABEL_17:
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    goto LABEL_18;
  }
  if (v2 != 4) {
    goto LABEL_17;
  }
  double v3 = *(double *)(a1 + 64);
  if (v3 < 10.0 || (double)*(unint64_t *)(a1 + 56) / 1000.0 / v3 >= 5.0) {
    goto LABEL_17;
  }
  uint64_t v4 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t v5 = *(void *)(a1 + 56);
    double v6 = (double)v5 / 1000.0 / *(double *)(a1 + 64);
    int v14 = 134349312;
    unint64_t v15 = v5;
    __int16 v16 = 2048;
    double v17 = v6;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "[NetworkQuality] Loaded %{public,bytes}llu with network data rate of %.1fKB/s. Transitioning to bad network quality", (uint8_t *)&v14, 0x16u);
  }

  BOOL v7 = *(unsigned char *)(*(void *)(a1 + 32) + 76) == 0;
  uint64_t v8 = 2;
LABEL_14:
  if (!v7) {
    ++v8;
  }
LABEL_18:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)updateObservedNetworkPerformanceWithServerError
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__GEORoutePreloader_updateObservedNetworkPerformanceWithServerError__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __68__GEORoutePreloader_updateObservedNetworkPerformanceWithServerError__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __68__GEORoutePreloader_updateObservedNetworkPerformanceWithServerError__block_invoke_2;
  int v14 = &unk_1E53D89E8;
  uint64_t v15 = v2;
  __int16 v16 = &v22;
  double v17 = &v18;
  geo_isolate_sync_data();
  if (v23[3] != v19[3])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "observedNetworkQualityDidChangeFrom:to:", v23[3], v19[3], (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v26 count:16];
      }
      while (v4);
    }
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __68__GEORoutePreloader_updateObservedNetworkPerformanceWithServerError__block_invoke_2(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 40);
  if ((*(void *)(*(void *)(a1[5] + 8) + 24) & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v2 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "[NetworkQuality] Server error encountered while on good network. Transitioning to bad network.", v4, 2u);
    }

    uint64_t v3 = 2;
    if (*(unsigned char *)(a1[4] + 76)) {
      uint64_t v3 = 3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1[4] + 40);
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  *(void *)(a1[4] + 40) = *(void *)(*(void *)(a1[6] + 8) + 24);
}

- (BOOL)isPluggedIn
{
  uint64_t v2 = self;
  uint64_t v4 = self->_deviceQualitiesIsolation;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_pluggedIn;
  _geo_isolate_unlock();

  return (char)v2;
}

- (void)_registerForBatteryStatusChanges
{
  uint64_t v3 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "[BatteryState] Observing battery state", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  p_batteryNotificationToken = &self->_batteryNotificationToken;
  workQueue = self->_workQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __53__GEORoutePreloader__registerForBatteryStatusChanges__block_invoke;
  handler[3] = &unk_1E53DD2C0;
  objc_copyWeak(&v9, buf);
  if (notify_register_dispatch("com.apple.system.powersources.source", &self->_batteryNotificationToken, workQueue, handler))
  {
    uint64_t v6 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v7 = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "[BatteryState] Failed to register observer", v7, 2u);
    }

    int *p_batteryNotificationToken = -1;
  }
  else
  {
    [(GEORoutePreloader *)self _updateBatteryState];
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __53__GEORoutePreloader__registerForBatteryStatusChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBatteryState];
}

- (void)_unregisterForBatteryStatusChanges
{
  notify_cancel(self->_batteryNotificationToken);
  self->_batteryNotificationToken = -1;
  uint64_t v3 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "[BatteryState] No longer observing battery state", v4, 2u);
  }
}

- (void)_updateBatteryState
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v3 = IOPSDrawingUnlimitedPower();
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  __int16 v16 = __40__GEORoutePreloader__updateBatteryState__block_invoke;
  double v17 = &unk_1E53DD2E8;
  char v21 = v3;
  uint64_t v18 = self;
  uint64_t v19 = &v26;
  uint64_t v20 = &v22;
  geo_isolate_sync_data();
  uint64_t v4 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = @"battery";
    if (v3) {
      uint64_t v5 = @"power";
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v5;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "[BatteryState] Updated battery state: %{public}@", buf, 0xCu);
  }

  if (v23[3] != v27[3])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = self->_strategies;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "observedNetworkQualityDidChangeFrom:to:", v27[3], v23[3], (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v30 count:16];
      }
      while (v7);
    }
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

uint64_t __40__GEORoutePreloader__updateBatteryState__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 76) = *(unsigned char *)(result + 56);
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 40);
  if (*(unsigned char *)(result + 56))
  {
    switch(v1)
    {
      case 2:
        uint64_t v1 = 3;
        break;
      case 6:
        uint64_t v1 = 7;
        break;
      case 4:
        uint64_t v1 = 5;
        break;
    }
  }
  else
  {
    switch(v1)
    {
      case 3:
        uint64_t v1 = 2;
        break;
      case 7:
        uint64_t v1 = 6;
        break;
      case 5:
        uint64_t v1 = 4;
        break;
    }
  }
  *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24) = v1;
  *(void *)(*(void *)(result + 32) + 40) = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24);
  return result;
}

- (void)tileLoader:(void *)a3 loadedTileKey:(unsigned char *)a4 sizeInBytes:(uint64_t)a5 fromSource:(uint64_t)a6 withOptions:(char)a7
{
  id v12 = a3;
  if ((a7 & 4) == 0 && (*a4 & 0x7F) != 8)
  {
    int v13 = 0;
    if (GEOTileKeyStyle((uint64_t)a4, &v13))
    {
      switch(v13)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
          [*(id *)(a1 + 80) incrementTileLoadStatistic:6 amount:1];
          if (a6 == 2) {
            [*(id *)(a1 + 80) missedTileKey:a4 loadedSuccessfully:1 sizeInBytes:a5];
          }
          break;
        default:
          break;
      }
    }
  }
}

- (void)tileLoader:(void *)a3 failedTileKey:(unsigned char *)a4 error:(void *)a5 withOptions:(char)a6
{
  id v11 = a3;
  id v10 = a5;
  if ((a6 & 4) == 0 && (*a4 & 0x7F) != 8)
  {
    int v12 = 0;
    if (GEOTileKeyStyle((uint64_t)a4, &v12))
    {
      switch(v12)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
          [*(id *)(a1 + 80) incrementTileLoadStatistic:6 amount:1];
          if ((a6 & 2) != 0) {
            [*(id *)(a1 + 80) missedTileKey:a4 loadedSuccessfully:0 sizeInBytes:0];
          }
          break;
        default:
          break;
      }
    }
  }
}

- (void)preloadStrategy:(uint64_t)a3 failedToLoadTileKey:(uint64_t)a4 error:(void *)a5
{
  uint64_t v7 = (id *)(a1 + 88);
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained routePreloader:a1 failedToLoadTileKey:a4 error:v8];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEORoutePreloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEORoutePreloaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_deviceQualitiesIsolation, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_strategies, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)incrementTileLoadStatistic:(int64_t)a3 amount:(unint64_t)a4
{
}

@end
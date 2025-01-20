@interface DBLocationManager
+ (id)homeKitLocationManager;
+ (void)homeKitLocationManager;
- (BOOL)authorized;
- (BOOL)locationActive;
- (CARObserverHashTable)observers;
- (CLLocation)cachedCurrentLocation;
- (CLLocation)currentLocation;
- (CLLocation)lastPostedLocation;
- (CLLocationManager)locationManager;
- (DBLocationManager)initWithBundleIdentifier:(id)a3;
- (DBLocationManager)initWithBundlePath:(id)a3;
- (DBLocationManager)initWithLocationManager:(id)a3 locationQueue:(id)a4;
- (NSBundle)bundle;
- (NSMutableDictionary)monitoringRegions;
- (NSMutableSet)activeAssertions;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)description;
- (OS_dispatch_queue)locationQueue;
- (id)_name;
- (unint64_t)cacheUsedCount;
- (void)_authorizeIfNeeded;
- (void)_commonInit;
- (void)_commonPostInit;
- (void)_didEnterRegionWithIdentifier:(id)a3;
- (void)_didExitRegionWithIDentifier:(id)a3;
- (void)_startUpdatingLocationNow;
- (void)_stopUpdatingLocationNow;
- (void)_updateCurrentLocation:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveAssertions:(id)a3;
- (void)setCacheUsedCount:(unint64_t)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setLastPostedLocation:(id)a3;
- (void)setLocationActive:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationQueue:(id)a3;
- (void)setMonitoringRegions:(id)a3;
- (void)setObservers:(id)a3;
- (void)startMonitoringForRegionWithIdentifier:(id)a3 locationCoordinate:(CLLocationCoordinate2D)a4 range:(double)a5;
- (void)startUpdatingLocationWithIdentifier:(id)a3;
- (void)stopMonitoringForRegionWithIdentifier:(id)a3;
- (void)stopUpdatingLocationWithIdentifier:(id)a3;
@end

@implementation DBLocationManager

+ (id)homeKitLocationManager
{
  v2 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[DBLocationManager homeKitLocationManager];
  }

  v10 = [[DBLocationManager alloc] initWithBundlePath:@"/System/Library/LocationBundles/CarPlayHomeLocation.bundle"];
  return v10;
}

- (DBLocationManager)initWithLocationManager:(id)a3 locationQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DBLocationManager;
  uint64_t v9 = [(DBLocationManager *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationQueue, a4);
    [(DBLocationManager *)v10 _commonInit];
    objc_storeStrong((id *)&v10->_locationManager, a3);
    [(DBLocationManager *)v10 _commonPostInit];
    v11 = v10;
  }

  return v10;
}

- (DBLocationManager)initWithBundlePath:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DBLocationManager;
  uint64_t v6 = [(DBLocationManager *)&v20 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundlePath, a3);
    id v8 = MEMORY[0x230F8C990]([(DBLocationManager *)v7 _commonInit]);
    uint64_t v9 = [v8 stringByAppendingPathComponent:v5];

    id v10 = objc_alloc(MEMORY[0x263F086E0]);
    v11 = [NSURL fileURLWithPath:v9];
    uint64_t v12 = [v10 initWithURL:v11];
    bundle = v7->_bundle;
    v7->_bundle = (NSBundle *)v12;

    objc_initWeak(&location, v7);
    locationQueue = v7->_locationQueue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __40__DBLocationManager_initWithBundlePath___block_invoke;
    v17[3] = &unk_2649B4738;
    objc_copyWeak(&v18, &location);
    dispatch_async(locationQueue, v17);
    v15 = v7;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __40__DBLocationManager_initWithBundlePath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_alloc(MEMORY[0x263F00A60]);
  v2 = [WeakRetained bundle];
  uint64_t v3 = [WeakRetained locationQueue];
  uint64_t v4 = (void *)[v1 initWithEffectiveBundle:v2 delegate:WeakRetained onQueue:v3];
  [WeakRetained setLocationManager:v4];

  [WeakRetained _commonPostInit];
}

- (DBLocationManager)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DBLocationManager;
  uint64_t v6 = [(DBLocationManager *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    [(DBLocationManager *)v7 _commonInit];
    objc_initWeak(&location, v7);
    locationQueue = v7->_locationQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__DBLocationManager_initWithBundleIdentifier___block_invoke;
    v11[3] = &unk_2649B4738;
    objc_copyWeak(&v12, &location);
    dispatch_async(locationQueue, v11);
    uint64_t v9 = v7;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __46__DBLocationManager_initWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_alloc(MEMORY[0x263F00A60]);
  v2 = [WeakRetained bundleIdentifier];
  uint64_t v3 = [WeakRetained locationQueue];
  uint64_t v4 = (void *)[v1 initWithEffectiveBundleIdentifier:v2 delegate:WeakRetained onQueue:v3];
  [WeakRetained setLocationManager:v4];

  [WeakRetained _commonPostInit];
}

- (void)_commonInit
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "init locationManager %{public}p", v2, v3, v4, v5, v6);
}

- (void)_commonPostInit
{
  uint64_t v3 = [(DBLocationManager *)self locationManager];
  [v3 setDelegate:self];

  double v4 = *MEMORY[0x263F00B18];
  uint64_t v5 = [(DBLocationManager *)self locationManager];
  [v5 setDistanceFilter:v4];

  uint8_t v6 = [(DBLocationManager *)self locationManager];
  [v6 setDesiredAccuracy:v4];

  [(DBLocationManager *)self _authorizeIfNeeded];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "dealloc locationManager %{public}p", v2, v3, v4, v5, v6);
}

- (BOOL)authorized
{
  uint64_t v3 = [(DBLocationManager *)self bundleIdentifier];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F00A60];
    uint64_t v5 = [(DBLocationManager *)self bundleIdentifier];
    int v6 = [v4 authorizationStatusForBundleIdentifier:v5];
  }
  else
  {
    id v7 = [(DBLocationManager *)self bundlePath];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x263F00A60];
      uint64_t v5 = [(DBLocationManager *)self bundle];
      int v6 = [v8 authorizationStatusForBundle:v5];
    }
    else
    {
      uint64_t v5 = [(DBLocationManager *)self locationManager];
      int v6 = [v5 authorizationStatus];
    }
  }
  int v9 = v6;

  return (v9 - 3) < 2;
}

- (CLLocation)currentLocation
{
  currentLocation = self->_currentLocation;
  unint64_t v4 = [(DBLocationManager *)self cacheUsedCount];
  unint64_t v5 = v4;
  if (currentLocation)
  {
    if (v4)
    {
      unint64_t v6 = [(DBLocationManager *)self cacheUsedCount];
      id v7 = [MEMORY[0x263EFF910] now];
      id v8 = +[DBDateFormatter formattedDateTimeStamp:v7];

      int v9 = dispatch_get_global_queue(17, 0);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      objc_super v20 = __36__DBLocationManager_currentLocation__block_invoke_87;
      v21 = &unk_2649B4138;
      v22 = self;
      id v23 = v8;
      unint64_t v24 = v6;
      id v10 = v8;
      dispatch_async(v9, &v18);
    }
    -[DBLocationManager setCacheUsedCount:](self, "setCacheUsedCount:", 0, v18, v19, v20, v21, v22);
    v11 = self->_currentLocation;
  }
  else
  {
    [(DBLocationManager *)self setCacheUsedCount:v4 + 1];
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v5, 2) <= 0xCCCCCCCCCCCCCCCuLL)
    {
      unint64_t v12 = [(DBLocationManager *)self cacheUsedCount] - 1;
      objc_super v13 = [MEMORY[0x263EFF910] now];
      objc_super v14 = +[DBDateFormatter formattedDateTimeStamp:v13];

      v15 = dispatch_get_global_queue(17, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__DBLocationManager_currentLocation__block_invoke;
      block[3] = &unk_2649B4138;
      block[4] = self;
      id v26 = v14;
      unint64_t v27 = v12;
      id v16 = v14;
      dispatch_async(v15, block);
    }
    v11 = [(DBLocationManager *)self cachedCurrentLocation];
  }
  return v11;
}

void __36__DBLocationManager_currentLocation__block_invoke()
{
  v0 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __36__DBLocationManager_currentLocation__block_invoke_cold_1();
  }
}

void __36__DBLocationManager_currentLocation__block_invoke_87()
{
  v0 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __36__DBLocationManager_currentLocation__block_invoke_87_cold_1();
  }
}

- (CLLocation)cachedCurrentLocation
{
  cachedCurrentLocation = self->_cachedCurrentLocation;
  if (!cachedCurrentLocation
    || ([(CLLocation *)cachedCurrentLocation timestamp],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 timeIntervalSinceNow],
        double v6 = fabs(v5),
        v4,
        v6 > 15.0))
  {
    id v7 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__DBLocationManager_cachedCurrentLocation__block_invoke;
    block[3] = &unk_2649B3E90;
    block[4] = self;
    dispatch_async(v7, block);

    id v8 = [(DBLocationManager *)self locationManager];
    int v9 = [v8 location];
    id v10 = self->_cachedCurrentLocation;
    self->_cachedCurrentLocation = v9;
  }
  v11 = self->_cachedCurrentLocation;
  return v11;
}

void __42__DBLocationManager_cachedCurrentLocation__block_invoke(uint64_t a1)
{
  uint64_t v2 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__DBLocationManager_cachedCurrentLocation__block_invoke_cold_1(a1, v2);
  }
}

- (void)startUpdatingLocationWithIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(DBLocationManager *)self activeAssertions];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DBLocationManager startUpdatingLocationWithIdentifier:]();
    }

    [(DBLocationManager *)self _authorizeIfNeeded];
    id v8 = [(DBLocationManager *)self activeAssertions];
    [v8 addObject:v4];

    if (![(DBLocationManager *)self locationActive])
    {
      int v9 = DBLogForCategory(7uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[DBLocationManager startUpdatingLocationWithIdentifier:]();
      }

      [(DBLocationManager *)self _startUpdatingLocationNow];
    }
  }
}

- (void)_startUpdatingLocationNow
{
  [(DBLocationManager *)self setLocationActive:1];
  uint64_t v3 = [(DBLocationManager *)self locationManager];
  [v3 startUpdatingLocation];

  id v4 = [(DBLocationManager *)self locationManager];
  id v6 = [v4 location];

  double v5 = v6;
  if (v6)
  {
    [(DBLocationManager *)self _updateCurrentLocation:v6];
    double v5 = v6;
  }
}

- (void)stopUpdatingLocationWithIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(DBLocationManager *)self activeAssertions];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DBLocationManager stopUpdatingLocationWithIdentifier:]();
    }

    id v8 = [(DBLocationManager *)self activeAssertions];
    [v8 removeObject:v4];

    if ([(DBLocationManager *)self locationActive])
    {
      int v9 = [(DBLocationManager *)self activeAssertions];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        v11 = DBLogForCategory(7uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[DBLocationManager stopUpdatingLocationWithIdentifier:]();
        }

        [(DBLocationManager *)self _stopUpdatingLocationNow];
      }
    }
  }
}

- (void)_stopUpdatingLocationNow
{
  uint64_t v3 = [(DBLocationManager *)self locationManager];
  [v3 stopUpdatingLocation];

  [(DBLocationManager *)self setCurrentLocation:0];
  [(DBLocationManager *)self setLocationActive:0];
}

- (void)startMonitoringForRegionWithIdentifier:(id)a3 locationCoordinate:(CLLocationCoordinate2D)a4 range:(double)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v9 = a3;
  [(DBLocationManager *)self _authorizeIfNeeded];
  uint64_t v10 = [(DBLocationManager *)self locationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__DBLocationManager_startMonitoringForRegionWithIdentifier_locationCoordinate_range___block_invoke;
  block[3] = &unk_2649B3F80;
  CLLocationDegrees v14 = latitude;
  CLLocationDegrees v15 = longitude;
  block[4] = self;
  id v13 = v9;
  double v16 = a5;
  id v11 = v9;
  dispatch_async(v10, block);
}

void __85__DBLocationManager_startMonitoringForRegionWithIdentifier_locationCoordinate_range___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) currentLocation];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:*(double *)(a1 + 48) longitude:*(double *)(a1 + 56)];
  [v2 distanceFromLocation:v3];
  uint64_t v5 = v4;

  int v6 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 64);
    int v13 = 138544130;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2050;
    uint64_t v18 = v5;
    __int16 v19 = 2050;
    uint64_t v20 = v12;
    _os_log_debug_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ identifier=%{public}@ currentDistance=%{public}.1f range=%{public}.1f", (uint8_t *)&v13, 0x2Au);
  }

  if ([MEMORY[0x263F00A60] isMonitoringAvailableForClass:objc_opt_class()])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263F00A28]), "initWithCenter:radius:identifier:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    [v7 setNotifyOnExit:1];
    [v7 setNotifyOnEntry:1];
    id v8 = [*(id *)(a1 + 32) monitoringRegions];
    [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];

    id v9 = [*(id *)(a1 + 32) locationManager];
    [v9 startMonitoringForRegion:v7];
  }
}

- (void)stopMonitoringForRegionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBLocationManager *)self locationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__DBLocationManager_stopMonitoringForRegionWithIdentifier___block_invoke;
  v7[3] = &unk_2649B3D30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__DBLocationManager_stopMonitoringForRegionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__DBLocationManager_stopMonitoringForRegionWithIdentifier___block_invoke_cold_1(a1, v2);
  }

  if ([MEMORY[0x263F00A60] isMonitoringAvailableForClass:objc_opt_class()])
  {
    uint64_t v3 = [*(id *)(a1 + 32) monitoringRegions];
    id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) locationManager];
      [v5 stopMonitoringForRegion:v4];

      id v6 = [*(id *)(a1 + 32) monitoringRegions];
      [v6 removeObjectForKey:*(void *)(a1 + 40)];
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBLocationManager *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBLocationManager *)self observers];
  [v5 removeObserver:v4];
}

- (void)_authorizeIfNeeded
{
  uint64_t v3 = [(DBLocationManager *)self locationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__DBLocationManager__authorizeIfNeeded__block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(v3, block);
}

void __39__DBLocationManager__authorizeIfNeeded__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) authorized] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) locationManager];
    [v2 requestWhenInUseAuthorization];
  }
}

- (id)_name
{
  uint64_t v3 = [(DBLocationManager *)self bundlePath];
  char v4 = [v3 isEqualToString:@"/System/Library/LocationBundles/CarPlayHomeLocation.bundle"];

  if (v4)
  {
    id v5 = @"HomeKit";
  }
  else
  {
    id v6 = [(DBLocationManager *)self bundlePath];

    if (v6)
    {
      id v5 = [(DBLocationManager *)self bundlePath];
    }
    else
    {
      id v7 = [(DBLocationManager *)self bundleIdentifier];

      if (v7)
      {
        id v5 = [(DBLocationManager *)self bundleIdentifier];
      }
      else
      {
        id v5 = @"Unnamed";
      }
    }
  }
  return v5;
}

- (NSString)description
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v4 = [(DBLocationManager *)self activeAssertions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v22 + 1) + 8 * i) description];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v21 = NSString;
  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  uint64_t v12 = [(DBLocationManager *)self _name];
  if ([(DBLocationManager *)self authorized]) {
    int v13 = @"YES";
  }
  else {
    int v13 = @"NO";
  }
  if ([(DBLocationManager *)self locationActive]) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  __int16 v15 = [(DBLocationManager *)self monitoringRegions];
  uint64_t v16 = [v15 allKeys];
  __int16 v17 = [v16 componentsJoinedByString:@", "];
  uint64_t v18 = [v3 componentsJoinedByString:@", "];
  __int16 v19 = [v21 stringWithFormat:@"<%@: %p %@ authorized=%@ active=%@ regions=[%@] assertions=[%@]>", v11, self, v12, v13, v14, v17, v18];

  return (NSString *)v19;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(DBLocationManager *)(uint64_t)self locationManagerDidChangeAuthorization:v5];
  }

  [(DBLocationManager *)self _authorizeIfNeeded];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = [a3 location];
  [(DBLocationManager *)self _updateCurrentLocation:v5];
}

- (void)_updateCurrentLocation:(id)a3
{
  id v13 = a3;
  currentLocation = self->_currentLocation;
  uint64_t v6 = [(DBLocationManager *)self lastPostedLocation];
  [v6 distanceFromLocation:v13];
  double v8 = v7;

  p_currentLocation = &self->_currentLocation;
  if (v8 > 10.0)
  {
    objc_storeStrong((id *)p_currentLocation, a3);
    objc_storeStrong((id *)&self->_cachedCurrentLocation, a3);
LABEL_5:
    [(DBLocationManager *)self setLastPostedLocation:v13];
    uint64_t v11 = [(DBLocationManager *)self observers];
    uint64_t v12 = [(DBLocationManager *)self currentLocation];
    [v11 locationManager:self didUpdateLocation:v12];

    uint64_t v10 = v13;
    goto LABEL_6;
  }
  objc_storeStrong((id *)p_currentLocation, a3);
  objc_storeStrong((id *)&self->_cachedCurrentLocation, a3);
  uint64_t v10 = v13;
  if (v13 && !currentLocation) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBLocationManager locationManager:didFailWithError:]();
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a5;
  double v8 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [v7 identifier];
    int v11 = 138543874;
    uint64_t v12 = self;
    __int16 v13 = 2050;
    int64_t v14 = a4;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_debug_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ state=%{public}ld region=%{public}@", (uint8_t *)&v11, 0x20u);
  }
  if (a4 == 2)
  {
    id v9 = [v7 identifier];
    [(DBLocationManager *)self _didExitRegionWithIDentifier:v9];
    goto LABEL_7;
  }
  if (a4 == 1)
  {
    id v9 = [v7 identifier];
    [(DBLocationManager *)self _didEnterRegionWithIdentifier:v9];
LABEL_7:
  }
}

- (void)_didEnterRegionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBLocationManager _didEnterRegionWithIdentifier:]();
  }

  uint64_t v6 = [(DBLocationManager *)self observers];
  [v6 locationManager:self didEnterRegionIdentifier:v4];

  id v7 = [(DBLocationManager *)self observers];
  double v8 = [(DBLocationManager *)self currentLocation];
  [v7 locationManager:self didUpdateLocation:v8];
}

- (void)_didExitRegionWithIDentifier:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBLocationManager _didEnterRegionWithIdentifier:]();
  }

  uint64_t v6 = [(DBLocationManager *)self observers];
  [v6 locationManager:self didExitRegionIdentifier:v4];

  id v7 = [(DBLocationManager *)self observers];
  double v8 = [(DBLocationManager *)self currentLocation];
  [v7 locationManager:self didUpdateLocation:v8];
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setCurrentLocation:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (OS_dispatch_queue)locationQueue
{
  return self->_locationQueue;
}

- (void)setLocationQueue:(id)a3
{
}

- (NSMutableSet)activeAssertions
{
  return self->_activeAssertions;
}

- (void)setActiveAssertions:(id)a3
{
}

- (BOOL)locationActive
{
  return self->_locationActive;
}

- (void)setLocationActive:(BOOL)a3
{
  self->_locationActive = a3;
}

- (CLLocation)lastPostedLocation
{
  return self->_lastPostedLocation;
}

- (void)setLastPostedLocation:(id)a3
{
}

- (NSMutableDictionary)monitoringRegions
{
  return self->_monitoringRegions;
}

- (void)setMonitoringRegions:(id)a3
{
}

- (unint64_t)cacheUsedCount
{
  return self->_cacheUsedCount;
}

- (void)setCacheUsedCount:(unint64_t)a3
{
  self->_cacheUsedCount = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_monitoringRegions, 0);
  objc_storeStrong((id *)&self->_lastPostedLocation, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_locationQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_cachedCurrentLocation, 0);
}

+ (void)homeKitLocationManager
{
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, a1, a3, "bundlePath=%@", a5, a6, a7, a8, 2u);
}

void __36__DBLocationManager_currentLocation__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ delayed(%{public}@) used cachedCurrentLocation count=%{public}ld", v1, 0x20u);
}

void __36__DBLocationManager_currentLocation__block_invoke_87_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22D6F0000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ delayed(%{public}@) cachedCurrentLocation used count=%{public}ld", v1, 0x20u);
}

void __42__DBLocationManager_cachedCurrentLocation__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x263EFF910] now];
  id v5 = +[DBDateFormatter formattedDateTimeStamp:v4];
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ delayed(%{public}@) updated cachedCurrentLocation", (uint8_t *)&v6, 0x16u);
}

- (void)startUpdatingLocationWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "%{public}@ starting", v2, v3, v4, v5, v6);
}

- (void)startUpdatingLocationWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ startActiveLocationUpdatesFor=%{public}@");
}

- (void)stopUpdatingLocationWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "%{public}@ stopping", v2, v3, v4, v5, v6);
}

- (void)stopUpdatingLocationWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ stopActiveLocationUpdatesFor=%{public}@");
}

void __59__DBLocationManager_stopMonitoringForRegionWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ identifier=%{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)locationManagerDidChangeAuthorization:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 1026;
  int v7 = [a2 authorizationStatus];
  _os_log_debug_impl(&dword_22D6F0000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ status=%{public}d", (uint8_t *)&v4, 0x12u);
}

- (void)locationManager:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ error=%{public}@");
}

- (void)_didEnterRegionWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ region=%{public}@");
}

@end
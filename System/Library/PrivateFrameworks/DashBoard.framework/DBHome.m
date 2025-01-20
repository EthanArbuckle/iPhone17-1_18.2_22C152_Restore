@interface DBHome
+ (double)maxDistance;
- (BOOL)garageDoorRefreshScheduled;
- (BOOL)hasCachedGarageDoors;
- (BOOL)hasGarageDoor;
- (BOOL)inAllowedPeriod;
- (BOOL)inExtendedRange;
- (BOOL)inHomeRange;
- (BOOL)inLocationRange;
- (BOOL)inRange;
- (BOOL)previouslyInRange;
- (BOOL)usable;
- (CARObserverHashTable)observers;
- (CLLocation)location;
- (DBGarageDoor)lastUsedGarageDoor;
- (DBHome)initWithHome:(id)a3 resourceProvider:(id)a4;
- (DBLocationManager)locationManager;
- (DBNetworkPathMonitor)networkPathMonitor;
- (HMHome)home;
- (NSArray)garageDoors;
- (NSDictionary)cachedGarageDoors;
- (NSMutableDictionary)lastUsedIdentifiersByServiceType;
- (NSMutableSet)updatingLastUsedServiceTypes;
- (NSString)description;
- (NSString)formattedUniqueIdentifier;
- (NSString)name;
- (NSString)stateDescription;
- (NSUUID)uniqueIdentifier;
- (double)distance;
- (double)lastLoggedDistance;
- (void)_scheduleGarageDoorRefresh;
- (void)_setValue:(id)a3 forCharacteristic:(id)a4 completion:(id)a5;
- (void)_updateCachedGarageDoors;
- (void)_updateInRangeIfNeeded;
- (void)_updateLastUsedServiceOfType:(id)a3;
- (void)addObserver:(id)a3;
- (void)cachedGarageDoors;
- (void)dealloc;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4;
- (void)home:(id)a3 didUpdateLocation:(id)a4;
- (void)homeDidUpdateHomeLocationStatus:(id)a3;
- (void)locationManager:(id)a3 didEnterRegionIdentifier:(id)a4;
- (void)locationManager:(id)a3 didExitRegionIdentifier:(id)a4;
- (void)networkPathMonitor:(id)a3 didChangeNetworkReachable:(BOOL)a4;
- (void)networkPathMonitorDidChangeNetworkPath:(id)a3;
- (void)refreshGarageDoors;
- (void)removeObserver:(id)a3;
- (void)restrictedGuestAllowedPeriodEnded:(id)a3;
- (void)restrictedGuestAllowedPeriodStarted:(id)a3;
- (void)setCachedGarageDoors:(id)a3;
- (void)setGarageDoorRefreshScheduled:(BOOL)a3;
- (void)setInExtendedRange:(BOOL)a3;
- (void)setLastLoggedDistance:(double)a3;
- (void)setObservers:(id)a3;
- (void)setPreviouslyInRange:(BOOL)a3;
@end

@implementation DBHome

- (DBHome)initWithHome:(id)a3 resourceProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)DBHome;
  v9 = [(DBHome *)&v25 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    updatingLastUsedServiceTypes = v9->_updatingLastUsedServiceTypes;
    v9->_updatingLastUsedServiceTypes = (NSMutableSet *)v10;

    uint64_t v12 = objc_opt_new();
    lastUsedIdentifiersByServiceType = v9->_lastUsedIdentifiersByServiceType;
    v9->_lastUsedIdentifiersByServiceType = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v9->_home, a3);
    [(HMHome *)v9->_home setDelegate:v9];
    uint64_t v14 = [v8 locationManager];
    locationManager = v9->_locationManager;
    v9->_locationManager = (DBLocationManager *)v14;

    v9->_lastLoggedDistance = -1.0;
    [(DBLocationManager *)v9->_locationManager addObserver:v9];
    uint64_t v16 = [v8 networkPathMonitor];
    networkPathMonitor = v9->_networkPathMonitor;
    v9->_networkPathMonitor = (DBNetworkPathMonitor *)v16;

    [(DBNetworkPathMonitor *)v9->_networkPathMonitor addObserver:v9];
    uint64_t v18 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1A25D0];
    observers = v9->_observers;
    v9->_observers = (CARObserverHashTable *)v18;

    v20 = v9->_locationManager;
    v21 = [(DBHome *)v9 formattedUniqueIdentifier];
    v22 = [v7 location];
    [v22 coordinate];
    -[DBLocationManager startMonitoringForRegionWithIdentifier:locationCoordinate:range:](v20, "startMonitoringForRegionWithIdentifier:locationCoordinate:range:", v21);

    v23 = [(HMHome *)v9->_home currentUser];
    [v23 setDelegate:v9];
  }
  return v9;
}

- (void)dealloc
{
  locationManager = self->_locationManager;
  v4 = [(DBHome *)self formattedUniqueIdentifier];
  [(DBLocationManager *)locationManager stopMonitoringForRegionWithIdentifier:v4];

  v5.receiver = self;
  v5.super_class = (Class)DBHome;
  [(DBHome *)&v5 dealloc];
}

- (NSString)formattedUniqueIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [(DBHome *)self uniqueIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@ %@>", v5, v6];

  return (NSString *)v7;
}

+ (double)maxDistance
{
  return 700.0;
}

- (CLLocation)location
{
  v2 = [(DBHome *)self home];
  v3 = [v2 location];

  return (CLLocation *)v3;
}

- (BOOL)inRange
{
  v3 = [MEMORY[0x263F30E28] smartWidgetRelaxHomeInRangeCheck];
  int v4 = [v3 valueBool];

  BOOL v5 = [(DBHome *)self inHomeRange];
  if (!v4 || v5) {
    return v4 | v5;
  }
  return [(DBHome *)self inLocationRange];
}

- (BOOL)inLocationRange
{
  [(DBHome *)self distance];
  double v3 = v2;
  [(id)objc_opt_class() maxDistance];
  return v3 < v4;
}

- (BOOL)inHomeRange
{
  double v3 = [(DBHome *)self home];
  if ([v3 homeLocationStatus] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(DBHome *)self home];
    BOOL v4 = [v5 homeLocationStatus] == 3;
  }
  return v4;
}

- (BOOL)inAllowedPeriod
{
  double v3 = [(DBHome *)self home];
  BOOL v4 = [v3 currentUser];

  BOOL v5 = [(DBHome *)self home];
  v6 = [v5 homeAccessControlForUser:v4];

  if ([v6 isRestrictedGuest])
  {
    id v7 = [v6 restrictedGuestAccessSettings];
    id v8 = [v7 guestAccessSchedule];
    if (v8) {
      char v9 = [v6 isRestrictedGuestInAllowedPeriod];
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)hasGarageDoor
{
  v7[1] = *MEMORY[0x263EF8340];
  double v2 = [(DBHome *)self home];
  v7[0] = *MEMORY[0x263F0D6F8];
  double v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  BOOL v4 = [v2 servicesWithTypes:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (NSArray)garageDoors
{
  double v2 = [(DBHome *)self cachedGarageDoors];
  double v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSDictionary)cachedGarageDoors
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v2 = self;
  objc_sync_enter(v2);
  v23 = v2;
  cachedGarageDoors = v2->_cachedGarageDoors;
  p_cachedGarageDoors = (id *)&v2->_cachedGarageDoors;
  id v3 = cachedGarageDoors;
  if (!cachedGarageDoors)
  {
    location = p_cachedGarageDoors;
    v6 = objc_opt_new();
    id v7 = [(DBHome *)v23 lastUsedIdentifiersByServiceType];
    uint64_t v21 = *MEMORY[0x263F0D6F8];
    id v8 = objc_msgSend(v7, "objectForKeyedSubscript:");

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    char v9 = [(DBHome *)v23 home];
    uint64_t v28 = v21;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
    id obj = [v9 servicesWithTypes:v10];

    uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = [(DBHomeKitService *)[DBGarageDoor alloc] initWithHome:v23 service:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          v15 = [(DBHomeKitService *)v14 uniqueIdentifier];
          [(DBHomeKitService *)v14 setLastWritten:+[DBComparison isValue:v8 equalTo:v15]];

          uint64_t v16 = [(DBHomeKitService *)v14 uniqueIdentifier];
          [v6 setObject:v14 forKeyedSubscript:v16];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    objc_storeStrong(p_cachedGarageDoors, v6);
    v17 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[DBHome cachedGarageDoors]();
    }

    [(DBHome *)v23 _updateLastUsedServiceOfType:v21];
    id v3 = *p_cachedGarageDoors;
  }
  uint64_t v18 = objc_msgSend(v3, "copy", location);
  objc_sync_exit(v23);

  return (NSDictionary *)v18;
}

- (BOOL)hasCachedGarageDoors
{
  double v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSDictionary *)v2->_cachedGarageDoors count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSMutableSet)updatingLastUsedServiceTypes
{
  double v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_updatingLastUsedServiceTypes;
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateCachedGarageDoors
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "%{public}@ updating garagedoor cache...", v2, v3, v4, v5, v6);
}

- (void)_updateLastUsedServiceOfType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBHome _updateLastUsedServiceOfType:]();
  }

  uint8_t v6 = [(DBHome *)self updatingLastUsedServiceTypes];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    id v8 = [(DBHome *)self updatingLastUsedServiceTypes];
    [v8 addObject:v4];

    objc_initWeak(&location, self);
    char v9 = [(DBHome *)self home];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__DBHome__updateLastUsedServiceOfType___block_invoke;
    v10[3] = &unk_2649B5678;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [v9 fetchLastModifiedServiceOfType:v11 completionHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __39__DBHome__updateLastUsedServiceOfType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    v22 = [v5 uniqueIdentifier];
    v23 = [v22 UUIDString];
    int v24 = 138544130;
    id v25 = WeakRetained;
    __int16 v26 = 2114;
    uint64_t v27 = v21;
    __int16 v28 = 2114;
    v29 = v23;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_debug_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ serviceType=%{public}@ service.uniqueIdentifier=%{public}@ error=%{public}@", (uint8_t *)&v24, 0x2Au);
  }
  char v9 = [WeakRetained updatingLastUsedServiceTypes];
  [v9 removeObject:*(void *)(a1 + 32)];

  uint64_t v10 = [WeakRetained lastUsedIdentifiersByServiceType];
  id v11 = [(id)v10 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v12 = [v5 uniqueIdentifier];
  LOBYTE(v10) = +[DBComparison isValue:v11 equalTo:v12];

  if ((v10 & 1) == 0)
  {
    v13 = [WeakRetained cachedGarageDoors];
    uint64_t v14 = [v13 objectForKeyedSubscript:v11];
    [v14 setLastWritten:0];

    v15 = [v5 uniqueIdentifier];
    uint64_t v16 = [WeakRetained lastUsedIdentifiersByServiceType];
    [v16 setObject:v15 forKeyedSubscript:*(void *)(a1 + 32)];

    v17 = [WeakRetained cachedGarageDoors];
    uint64_t v18 = [v5 uniqueIdentifier];
    v19 = [v17 objectForKeyedSubscript:v18];
    [v19 setLastWritten:1];

    v20 = [WeakRetained observers];
    [v20 home:WeakRetained didUpdateLastUsedServiceOfType:*(void *)(a1 + 32)];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHome *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHome *)self observers];
  [v5 removeObserver:v4];
}

- (void)_updateInRangeIfNeeded
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([a1 previouslyInRange]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v5 = [a1 home];
  int v6 = 138543874;
  char v7 = a1;
  __int16 v8 = 2114;
  char v9 = v4;
  __int16 v10 = 2050;
  uint64_t v11 = [v5 homeLocationStatus];
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ previouslyInRange=%{public}@ homeLocationStatus=%{public}ld", (uint8_t *)&v6, 0x20u);
}

- (NSString)description
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(DBHome *)self updatingLastUsedServiceTypes];
  id v5 = [v4 allObjects];
  id v31 = [v5 componentsJoinedByString:@", "];

  int v6 = [(DBHome *)self lastUsedIdentifiersByServiceType];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __21__DBHome_description__block_invoke;
  v32[3] = &unk_2649B56A0;
  id v7 = v3;
  id v33 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v32];

  __int16 v28 = NSString;
  __int16 v8 = (objc_class *)objc_opt_class();
  __int16 v30 = NSStringFromClass(v8);
  v29 = [(DBHome *)self name];
  char v9 = [(DBHome *)self uniqueIdentifier];
  __int16 v10 = @"YES";
  if ([(DBHome *)self hasGarageDoor]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  uint64_t v27 = v11;
  if ([(DBHome *)self hasCachedGarageDoors]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  __int16 v26 = v12;
  if ([(DBHome *)self inAllowedPeriod]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if ([(DBHome *)self inExtendedRange]) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  if ([(DBHome *)self inRange]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  [(DBHome *)self distance];
  double v17 = v16;
  double v18 = *MEMORY[0x263F009F8];
  if (v16 == *MEMORY[0x263F009F8])
  {
    uint64_t v21 = @"Unknown";
  }
  else
  {
    v19 = NSString;
    [(DBHome *)self distance];
    uint64_t v21 = [v19 stringWithFormat:@"%.2f", v20];
  }
  if ([(DBHome *)self inLocationRange]) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  if (![(DBHome *)self inHomeRange]) {
    __int16 v10 = @"NO";
  }
  v23 = [v7 componentsJoinedByString:@", "];
  int v24 = [v28 stringWithFormat:@"<%@: %p %@ uniqueIdentifier=%@ hasGarageDoor=%@ hasCachedGarageDoors=%@ inAllowedPeriod=%@ inExtendedRange=%@ inRange=%@ distance=%@ inLocationRange=%@ inHomeRange=%@ lastUsed=[%@] updatingLastUsed=[%@]>", v30, self, v29, v9, v27, v26, v13, v14, v15, v21, v22, v10, v23, v31];

  if (v17 != v18) {
  return (NSString *)v24;
  }
}

void __21__DBHome_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSString;
  id v6 = a2;
  id v8 = [a3 UUIDString];
  id v7 = [v5 stringWithFormat:@"(%@: %@)", v6, v8];

  [v4 addObject:v7];
}

- (void)refreshGarageDoors
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

- (void)_setValue:(id)a3 forCharacteristic:(id)a4 completion:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = (void *)MEMORY[0x263F0E2A8];
  id v9 = a5;
  __int16 v10 = [v8 writeRequestWithCharacteristic:a4 value:a3];
  uint64_t v11 = (void *)MEMORY[0x263F0E250];
  v15[0] = v10;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v13 = [v11 characteristicBatchRequestWithWriteRequests:v12];

  [v13 setCompletionHandler:v9];
  [v13 setProgressHandler:&__block_literal_global_13];
  uint64_t v14 = [(DBHome *)self home];
  [v14 performBatchCharacteristicRequest:v13];
}

- (NSUUID)uniqueIdentifier
{
  uint64_t v2 = [(DBHome *)self home];
  uint64_t v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (NSString)name
{
  uint64_t v2 = [(DBHome *)self home];
  uint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (BOOL)usable
{
  return 1;
}

- (NSString)stateDescription
{
  uint64_t v3 = NSString;
  if ([(DBHome *)self inRange]) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [(DBHome *)self distance];
  uint64_t v6 = v5;
  if ([(DBHome *)self inExtendedRange]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if ([(DBHome *)self inLocationRange]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  if ([(DBHome *)self inHomeRange]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  return (NSString *)[v3 stringWithFormat:@"[inRange=%@ distance=%.2f inExtendedRange%@ inLocationRange=%@ inHomeRange=%@]", v4, v6, v7, v8, v9];
}

- (double)distance
{
  uint64_t v3 = [(DBHome *)self location];
  if (!v3) {
    return *MEMORY[0x263F009F8];
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = [(DBHome *)self locationManager];
  uint64_t v6 = [v5 currentLocation];

  if (!v6) {
    return *MEMORY[0x263F009F8];
  }
  id v7 = [(DBHome *)self home];
  id v8 = [v7 location];
  id v9 = [(DBHome *)self locationManager];
  __int16 v10 = [v9 currentLocation];
  [v8 distanceFromLocation:v10];
  double v12 = v11;

  return v12;
}

- (void)locationManager:(id)a3 didEnterRegionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DBHome *)self formattedUniqueIdentifier];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    [(DBHome *)self setInExtendedRange:1];
    __int16 v10 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[DBHome locationManager:didEnterRegionIdentifier:]();
    }

    [(DBHome *)self _updateCachedGarageDoors];
    double v11 = [(DBHome *)self formattedUniqueIdentifier];
    [v6 startUpdatingLocationWithIdentifier:v11];

    double v12 = [(DBHome *)self observers];
    [v12 homeDidEnterExtendedRange:self];
  }
}

- (void)locationManager:(id)a3 didExitRegionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DBHome *)self formattedUniqueIdentifier];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    [(DBHome *)self setInExtendedRange:0];
    __int16 v10 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[DBHome locationManager:didExitRegionIdentifier:]();
    }

    [(DBHome *)self _updateCachedGarageDoors];
    double v11 = [(DBHome *)self formattedUniqueIdentifier];
    [v6 stopUpdatingLocationWithIdentifier:v11];

    double v12 = [(DBHome *)self observers];
    [v12 homeDidExitExtendedRange:self];
  }
}

- (void)networkPathMonitor:(id)a3 didChangeNetworkReachable:(BOOL)a4
{
  uint64_t v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBHome networkPathMonitor:didChangeNetworkReachable:]();
  }

  [(DBHome *)self _scheduleGarageDoorRefresh];
}

- (void)networkPathMonitorDidChangeNetworkPath:(id)a3
{
  uint64_t v4 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[DBHome networkPathMonitorDidChangeNetworkPath:]();
  }

  [(DBHome *)self _scheduleGarageDoorRefresh];
}

- (void)_scheduleGarageDoorRefresh
{
  if (![(DBHome *)self garageDoorRefreshScheduled])
  {
    [(DBHome *)self setGarageDoorRefreshScheduled:1];
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__DBHome__scheduleGarageDoorRefresh__block_invoke;
    block[3] = &unk_2649B3E90;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __36__DBHome__scheduleGarageDoorRefresh__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshGarageDoors];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setGarageDoorRefreshScheduled:0];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  uint64_t v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBHome home:didAddAccessory:]();
  }

  [(DBHome *)self _updateCachedGarageDoors];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  uint64_t v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBHome home:didRemoveAccessory:]();
  }

  [(DBHome *)self _updateCachedGarageDoors];
}

- (void)home:(id)a3 didUpdateLocation:(id)a4
{
  uint64_t v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBHome home:didUpdateLocation:]();
  }

  [(DBHome *)self _updateInRangeIfNeeded];
}

- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4
{
  id v6 = a3;
  id v7 = [a4 uniqueIdentifier];
  id v8 = [v6 currentUser];

  int v9 = [v8 uniqueIdentifier];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    double v11 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[DBHome home:didUpdateAccessControlForUser:]();
    }

    [(DBHome *)self _updateCachedGarageDoors];
    double v12 = [(DBHome *)self observers];
    [v12 homeDidUpdateAccess:self];
  }
}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  uint64_t v4 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[DBHome homeDidUpdateHomeLocationStatus:]();
  }

  [(DBHome *)self _updateInRangeIfNeeded];
}

- (void)restrictedGuestAllowedPeriodStarted:(id)a3
{
  uint64_t v4 = [a3 uniqueIdentifier];
  uint64_t v5 = [(DBHome *)self home];
  id v6 = [v5 currentUser];
  id v7 = [v6 uniqueIdentifier];
  int v8 = [v4 isEqual:v7];

  if (v8)
  {
    int v9 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[DBHome restrictedGuestAllowedPeriodStarted:]();
    }

    int v10 = [(DBHome *)self observers];
    [v10 homeDidUpdateAccess:self];
  }
}

- (void)restrictedGuestAllowedPeriodEnded:(id)a3
{
  uint64_t v4 = [a3 uniqueIdentifier];
  uint64_t v5 = [(DBHome *)self home];
  id v6 = [v5 currentUser];
  id v7 = [v6 uniqueIdentifier];
  int v8 = [v4 isEqual:v7];

  if (v8)
  {
    int v9 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[DBHome restrictedGuestAllowedPeriodEnded:]();
    }

    int v10 = [(DBHome *)self observers];
    [v10 homeDidUpdateAccess:self];
  }
}

- (DBGarageDoor)lastUsedGarageDoor
{
  return self->_lastUsedGarageDoor;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setCachedGarageDoors:(id)a3
{
}

- (NSMutableDictionary)lastUsedIdentifiersByServiceType
{
  return self->_lastUsedIdentifiersByServiceType;
}

- (BOOL)garageDoorRefreshScheduled
{
  return self->_garageDoorRefreshScheduled;
}

- (void)setGarageDoorRefreshScheduled:(BOOL)a3
{
  self->_garageDoorRefreshScheduled = a3;
}

- (DBLocationManager)locationManager
{
  return self->_locationManager;
}

- (BOOL)previouslyInRange
{
  return self->_previouslyInRange;
}

- (void)setPreviouslyInRange:(BOOL)a3
{
  self->_previouslyInRange = a3;
}

- (BOOL)inExtendedRange
{
  return self->_inExtendedRange;
}

- (void)setInExtendedRange:(BOOL)a3
{
  self->_inExtendedRange = a3;
}

- (double)lastLoggedDistance
{
  return self->_lastLoggedDistance;
}

- (void)setLastLoggedDistance:(double)a3
{
  self->_lastLoggedDistance = a3;
}

- (DBNetworkPathMonitor)networkPathMonitor
{
  return self->_networkPathMonitor;
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
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lastUsedIdentifiersByServiceType, 0);
  objc_storeStrong((id *)&self->_cachedGarageDoors, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_lastUsedGarageDoor, 0);
  objc_storeStrong((id *)&self->_updatingLastUsedServiceTypes, 0);
}

- (void)cachedGarageDoors
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ updated garage door cache. garageDoors=%{public}@");
}

- (void)_updateLastUsedServiceOfType:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ serviceType=%{public}@");
}

- (void)locationManager:didEnterRegionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)locationManager:didExitRegionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)networkPathMonitor:didChangeNetworkReachable:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)networkPathMonitorDidChangeNetworkPath:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)home:didAddAccessory:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)home:didRemoveAccessory:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)home:didUpdateLocation:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)home:didUpdateAccessControlForUser:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)homeDidUpdateHomeLocationStatus:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)restrictedGuestAllowedPeriodStarted:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

- (void)restrictedGuestAllowedPeriodEnded:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_22D6F0000, v0, v1, "%s %{public}@", v2, v3, v4, v5, 2u);
}

@end
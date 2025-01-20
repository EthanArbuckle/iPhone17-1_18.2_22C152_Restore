@interface CAFCar
- (BOOL)hasAccessoryType:(id)a3;
- (BOOL)isConfigured;
- (BOOL)receivedAllValues;
- (BOOL)registeredForAccessory:(id)a3;
- (BOOL)rightHandDrive;
- (BOOL)trimmedAccessories;
- (BOOL)usable;
- (CAFAudioSettings)audioSettings;
- (CAFAutomakerExteriorCamera)automakerExteriorCamera;
- (CAFAutomakerNotificationHistory)automakerNotificationHistory;
- (CAFAutomakerSettings)automakerSettings;
- (CAFCachedDescription)cachedDescription;
- (CAFCar)initWithManager:(id)a3 car:(id)a4;
- (CAFCarConfiguration)car;
- (CAFCarManager)carManager;
- (CAFCarObserver)combineObserver;
- (CAFCharging)charging;
- (CAFClimate)climate;
- (CAFClosure)closure;
- (CAFDimensionManager)dimensionManager;
- (CAFDriveState)driveState;
- (CAFDriverAssistance)driverAssistance;
- (CAFElectricEngine)electricEngine;
- (CAFEnvironmentalConditions)environmentalConditions;
- (CAFFuel)fuel;
- (CAFHighVoltageBattery)highVoltageBattery;
- (CAFInternalCombustionEngine)internalCombustionEngine;
- (CAFMedia)media;
- (CAFMediaItems)np_currentMediaItems;
- (CAFMediaSource)currentMediaSource;
- (CAFNowPlayingInformation)nowPlayingInformation;
- (CAFPairedDevices)pairedDevices;
- (CAFPositionManager)positionManager;
- (CAFSeat)seat;
- (CAFTire)tire;
- (CAFTripComputer)tripComputer;
- (CAFUInt32Range)np_currentFrequencyRange;
- (CAFValueMonitor)valueMonitor;
- (CAFVehicleMotion)vehicleMotion;
- (CAFVehicleResources)vehicleResources;
- (CAFVehicleUnits)vehicleUnits;
- (CARObserverHashTable)observers;
- (Class)baseCAFClass;
- (NSArray)allAccessories;
- (NSArray)automakerInputStreams;
- (NSArray)automakerNotifications;
- (NSArray)automakerRequestContent;
- (NSArray)comparisonKeys;
- (NSArray)sortedAccessories;
- (NSArray)testingUseOnly;
- (NSArray)uiControl;
- (NSDictionary)accessories;
- (NSDictionary)accessoriesByCategory;
- (NSDictionary)updatables;
- (NSMutableSet)accessoryTypes;
- (NSMutableSet)processedPluginIDs;
- (NSString)description;
- (NSString)name;
- (NSString)np_titleForCurrentMediaSource;
- (NSString)typeName;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)refreshQueue;
- (id)accessoriesForCategory:(id)a3;
- (id)currentDescriptionForCache:(id)a3;
- (id)mediaSourceWithIdentifier:(id)a3;
- (id)observableCache;
- (int64_t)compare:(id)a3;
- (unint64_t)state;
- (unsigned)np_currentFrequency;
- (void)_accessoryDidUpdate:(id)a3 service:(id)a4 characteristic:(id)a5;
- (void)_accessoryDidUpdate:(id)a3 service:(id)a4 control:(id)a5;
- (void)_accessoryReceivedAllValues:(id)a3;
- (void)_groupInitialization:(id)a3 controls:(id)a4;
- (void)_refreshAccessories;
- (void)addRegistrationForCharacteristics:(id)a3;
- (void)dealloc;
- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5;
- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6;
- (void)didUpdatePluginID:(id)a3 values:(id)a4;
- (void)enableNotificationForCharacteristic:(id)a3 enable:(BOOL)a4 response:(id)a5;
- (void)enableNotificationForControl:(id)a3 enable:(BOOL)a4 response:(id)a5;
- (void)invalidate;
- (void)notifyControl:(id)a3 value:(id)a4;
- (void)performGroupRead:(id)a3 completion:(id)a4;
- (void)performGroupWrite:(id)a3 completion:(id)a4;
- (void)performGroupedRequest:(id)a3 key:(id)a4 value:(id)a5 withResponse:(id)a6;
- (void)readCharacteristic:(id)a3 response:(id)a4;
- (void)refreshAllCharacteristics;
- (void)refreshCharacteristics:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeRegistrationForCharacteristics:(id)a3;
- (void)requestControl:(id)a3 value:(id)a4 response:(id)a5;
- (void)setAccessories:(id)a3;
- (void)setAccessoriesByCategory:(id)a3;
- (void)setAllAccessories:(id)a3;
- (void)setCachedDescription:(id)a3;
- (void)setCar:(id)a3;
- (void)setObservableCache:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPositionManager:(id)a3;
- (void)setReceivedAllValues:(BOOL)a3;
- (void)setRefreshQueue:(id)a3;
- (void)setTrimmedAccessories:(BOOL)a3;
- (void)setUpdatables:(id)a3;
- (void)setValueMonitor:(id)a3;
- (void)trimAccessories;
- (void)unregisterObserver:(id)a3;
- (void)writeCharacteristic:(id)a3 value:(id)a4 response:(id)a5;
@end

@implementation CAFCar

- (CAFCar)initWithManager:(id)a3 car:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)CAFCar;
  v9 = [(CAFCar *)&v40 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_carManager, a3);
    objc_storeStrong((id *)&v10->_car, a4);
    [(CAFCarConfiguration *)v10->_car setDelegate:v10];
    uint64_t v11 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26FD961D0];
    observers = v10->_observers;
    v10->_observers = (CARObserverHashTable *)v11;

    v13 = [[CAFCachedDescription alloc] initWithCacheable:v10];
    cachedDescription = v10->_cachedDescription;
    v10->_cachedDescription = v13;

    v15 = [[CAFValueMonitor alloc] initWithDelegate:v10];
    valueMonitor = v10->_valueMonitor;
    v10->_valueMonitor = v15;

    v17 = [[CAFPositionManager alloc] initWithCar:v10];
    positionManager = v10->_positionManager;
    v10->_positionManager = v17;

    v19 = [[CAFDimensionManager alloc] initWithCar:v10];
    dimensionManager = v10->_dimensionManager;
    v10->_dimensionManager = v19;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.CarAccessoryFramework.Car.Refresh", v22);
    refreshQueue = v10->_refreshQueue;
    v10->_refreshQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = objc_opt_new();
    updatables = v10->_updatables;
    v10->_updatables = (NSDictionary *)v25;

    uint64_t v27 = objc_opt_new();
    accessoryTypes = v10->_accessoryTypes;
    v10->_accessoryTypes = (NSMutableSet *)v27;

    uint64_t v29 = objc_opt_new();
    accessories = v10->_accessories;
    v10->_accessories = (NSDictionary *)v29;

    uint64_t v31 = objc_opt_new();
    accessoriesByCategory = v10->_accessoriesByCategory;
    v10->_accessoriesByCategory = (NSDictionary *)v31;

    uint64_t v33 = objc_opt_new();
    processedPluginIDs = v10->_processedPluginIDs;
    v10->_processedPluginIDs = (NSMutableSet *)v33;

    v35 = [v8 pluginConfigs];
    uint64_t v36 = [v35 count];

    if (v36) {
      [(CAFCar *)v10 _refreshAccessories];
    }
    v37 = [(CAFCar *)v10 cachedDescription];
    [v37 setNeedsRefreshDescription];

    v38 = CAFCarLogging();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      -[CAFCar initWithManager:car:]();
    }
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[CAFCar dealloc]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_249710000, a2, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v2, 0x16u);
}

- (BOOL)rightHandDrive
{
  int v2 = [(CAFCar *)self car];
  char v3 = [v2 rightHandDrive];

  return v3;
}

- (NSArray)sortedAccessories
{
  int v2 = [(CAFCar *)self accessories];
  char v3 = [v2 allValues];
  __int16 v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v4;
}

- (void)setReceivedAllValues:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_receivedAllValues != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = CAFCarLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = @"YES";
      if (self->_receivedAllValues) {
        uint64_t v11 = @"YES";
      }
      else {
        uint64_t v11 = @"NO";
      }
      int v12 = 138543874;
      v13 = self;
      if (!v3) {
        v10 = @"NO";
      }
      __int16 v14 = 2112;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_debug_impl(&dword_249710000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ receivedAllValues transitioning from %@ to %@", (uint8_t *)&v12, 0x20u);
    }

    if (v3)
    {
      self->_receivedAllValues = v3;
      uint64_t v6 = [(CAFCar *)self cachedDescription];
      [v6 setNeedsRefreshDescription];

      id v7 = CARSignpostLogForCategory();
      if (os_signpost_enabled(v7))
      {
        int v12 = 138412290;
        v13 = self;
        _os_signpost_emit_with_name_impl(&dword_249710000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedAllValues", "%@", (uint8_t *)&v12, 0xCu);
      }

      id v8 = [(CAFCar *)self combineObserver];
      [v8 carDidUpdate:self receivedAllValues:1];

      v9 = [(CAFCar *)self observers];
      [v9 carDidUpdate:self receivedAllValues:1];
    }
    else
    {
      v9 = CAFGeneralLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[CAFCar setReceivedAllValues:]();
      }
    }
  }
}

- (id)accessoriesForCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAFCar *)self accessoriesByCategory];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)refreshAllCharacteristics
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ refreshing", v2, v3, v4, v5, v6);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCar *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCar *)self observers];
  [v5 unregisterObserver:v4];
}

- (NSString)description
{
  uint64_t v2 = [(CAFCar *)self cachedDescription];
  uint64_t v3 = [v2 description];

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

- (void)_refreshAccessories
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ triggered", v2, v3, v4, v5, v6);
}

void __29__CAFCar__refreshAccessories__block_invoke(uint64_t a1)
{
  uint64_t v2 = CAFCarLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __29__CAFCar__refreshAccessories__block_invoke_cold_2();
  }

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 32);
  uint64_t v5 = [v4 accessories];
  uint8_t v6 = (void *)[v5 mutableCopy];

  id v7 = [*v3 accessoriesByCategory];
  id v8 = (void *)[v7 mutableCopy];

  v9 = objc_opt_new();
  v10 = objc_opt_new();
  uint64_t v11 = [*v3 updatables];
  int v12 = (void *)[v11 mutableCopy];

  v13 = [*v3 car];
  __int16 v14 = [v13 pluginConfigs];
  v15 = (void *)[v14 copy];

  __int16 v16 = objc_opt_new();
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __29__CAFCar__refreshAccessories__block_invoke_92;
  v38[3] = &unk_265263FE8;
  v38[4] = *v3;
  id v17 = v6;
  id v39 = v17;
  v45 = &v46;
  id v18 = v9;
  id v40 = v18;
  id v19 = v12;
  id v41 = v19;
  id v20 = v10;
  id v42 = v20;
  id v21 = v8;
  id v43 = v21;
  id v22 = v16;
  id v44 = v22;
  [v15 enumerateKeysAndObjectsUsingBlock:v38];
  dispatch_queue_t v23 = [*v3 processedPluginIDs];
  [v23 addObjectsFromArray:v22];

  if (*((unsigned char *)v47 + 24))
  {
    [*v3 setAccessories:v17];
    [*v3 setAccessoriesByCategory:v21];
    v24 = [v17 allValues];
    [*v3 setAllAccessories:v24];

    [*v3 setUpdatables:v19];
    uint64_t v25 = [*v3 cachedDescription];
    [v25 setNeedsRefreshDescription];

    v26 = [*v3 combineObserver];
    [v26 carDidUpdateAccessories:*v3];

    uint64_t v27 = [*v3 observers];
    [v27 carDidUpdateAccessories:*v3];
  }
  if ([*v3 isConfigured])
  {
    v28 = [*v3 cachedDescription];
    [v28 setNeedsRefreshDescription];

    uint64_t v29 = [*v3 observers];
    [v29 carIsConfigured:*v3];

    v30 = [*v3 observers];
    [v30 carHasAllBridges:*v3];

    uint64_t v31 = [*v3 valueMonitor];
    [v31 signalReadyToMonitor];

    v32 = [*v3 valueMonitor];
    objc_msgSend(*v3, "setReceivedAllValues:", objc_msgSend(v32, "receivedAllValues"));
  }
  [*v3 _groupInitialization:v18 controls:v20];
  uint64_t v33 = CAFCarLogging();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    __29__CAFCar__refreshAccessories__block_invoke_cold_1();
  }

  v34 = CARSignpostLogForCategory();
  if (*v3)
  {
    v35 = CARSignpostLogForCategory();
    os_signpost_id_t v36 = os_signpost_id_make_with_pointer(v35, *v3);

    if (v36 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_15;
    }
  }
  else
  {
    os_signpost_id_t v36 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)v37 = 0;
    _os_signpost_emit_with_name_impl(&dword_249710000, v34, OS_SIGNPOST_INTERVAL_END, v36, "Car-RefreshAccessories", (const char *)&unk_2497DFEC6, v37, 2u);
  }
LABEL_15:

  _Block_object_dispose(&v46, 8);
}

void __29__CAFCar__refreshAccessories__block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) processedPluginIDs];
  int v8 = [v7 containsObject:v5];

  v9 = CAFCarLogging();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      __29__CAFCar__refreshAccessories__block_invoke_92_cold_1();
    }
  }
  else
  {
    if (v10) {
      __29__CAFCar__refreshAccessories__block_invoke_92_cold_3();
    }

    objc_opt_class();
    id v11 = [v6 objectForKeyedSubscript:@"accessories"];
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
      v9 = v11;
    }
    else {
      v9 = 0;
    }

    if (v9)
    {
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      id v20 = __29__CAFCar__refreshAccessories__block_invoke_94;
      id v21 = &unk_265263FC0;
      id v12 = v5;
      uint64_t v13 = *(void *)(a1 + 32);
      __int16 v14 = *(void **)(a1 + 40);
      id v22 = v12;
      uint64_t v23 = v13;
      id v15 = v14;
      uint64_t v16 = *(void *)(a1 + 88);
      id v24 = v15;
      uint64_t v29 = v16;
      id v25 = *(id *)(a1 + 48);
      id v26 = *(id *)(a1 + 56);
      id v27 = *(id *)(a1 + 64);
      id v28 = *(id *)(a1 + 72);
      [v9 enumerateObjectsUsingBlock:&v18];
    }
    objc_msgSend(*(id *)(a1 + 80), "addObject:", v5, v18, v19, v20, v21);
    id v17 = CAFCarLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __29__CAFCar__refreshAccessories__block_invoke_92_cold_2();
    }
  }
}

void __29__CAFCar__refreshAccessories__block_invoke_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    id v5 = [v4 objectForKeyedSubscript:@"iid"];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (!v6)
    {
      int v8 = CAFCarLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __29__CAFCar__refreshAccessories__block_invoke_94_cold_2();
      }
      goto LABEL_24;
    }
    int v8 = +[CAFCarConfiguration getType:v4];
    v9 = [*(id *)(a1 + 40) accessoryTypes];
    [v9 addObject:v8];

    BOOL v10 = [*(id *)(a1 + 40) carManager];
    int v11 = [v10 shouldAllocAccessoryType:v8];

    if (!v11)
    {
LABEL_24:

      id v7 = v4;
      goto LABEL_25;
    }
    id v12 = +[CAFCarConfiguration getUUID:*(void *)(a1 + 32) instanceID:v6];
    uint64_t v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:v12];
    if (!v13)
    {
      __int16 v14 = CAFCarLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __29__CAFCar__refreshAccessories__block_invoke_94_cold_4();
      }

      uint64_t v15 = +[CAFAccessory accessoryWithCar:*(void *)(a1 + 40) pluginID:*(void *)(a1 + 32) config:v4];
      if (!v15)
      {
        uint64_t v13 = CAFCarLogging();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __29__CAFCar__refreshAccessories__block_invoke_94_cold_3();
        }
        goto LABEL_21;
      }
      uint64_t v13 = v15;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v12];
      if (([v13 receivedAllValues] & 1) == 0)
      {
        uint64_t v16 = [*(id *)(a1 + 40) valueMonitor];
        id v17 = [v13 uniqueIdentifier];
        [v16 monitorForValue:v17];
      }
      uint64_t v18 = [v13 allCharacteristics];
      [*(id *)(a1 + 56) addObjectsFromArray:v18];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __29__CAFCar__refreshAccessories__block_invoke_98;
      v30[3] = &unk_265263F70;
      id v31 = *(id *)(a1 + 64);
      [v18 enumerateObjectsUsingBlock:v30];
      uint64_t v19 = [v13 allControls];
      [*(id *)(a1 + 72) addObjectsFromArray:v19];
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      id v27 = __29__CAFCar__refreshAccessories__block_invoke_2;
      id v28 = &unk_265263F98;
      id v29 = *(id *)(a1 + 64);
      [v19 enumerateObjectsUsingBlock:&v25];
    }
    id v20 = *(void **)(a1 + 80);
    id v21 = [v13 categoryType];
    id v22 = [v20 objectForKeyedSubscript:v21];

    if (!v22)
    {
      id v22 = objc_opt_new();
      uint64_t v23 = *(void **)(a1 + 80);
      id v24 = [v13 categoryType];
      [v23 setObject:v22 forKeyedSubscript:v24];
    }
    [v22 addObject:v13];

LABEL_21:
    goto LABEL_24;
  }

  id v7 = CAFCarLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __29__CAFCar__refreshAccessories__block_invoke_94_cold_1();
  }
LABEL_25:
}

void __29__CAFCar__refreshAccessories__block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 pluginID];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = objc_msgSend(v3, "allInstanceIDs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 setObject:v3 forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void __29__CAFCar__refreshAccessories__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 pluginID];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = objc_msgSend(v3, "allInstanceIDs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 setObject:v3 forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)performGroupRead:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CAFGroupRequest *)[CAFGroupReadRequest alloc] initWithCar:self];
  [(CAFGroupRequest *)v8 addCharacteristics:v7];

  [(CAFGroupRequest *)v8 performWithCompletion:v6];
}

- (void)performGroupWrite:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CAFGroupRequest *)[CAFGroupWriteRequest alloc] initWithCar:self];
  [(CAFGroupWriteRequest *)v8 addCharacteristicsAndValues:v7];

  [(CAFGroupRequest *)v8 performWithCompletion:v6];
}

- (void)_groupInitialization:(id)a3 controls:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v45 = a4;
  uint64_t v46 = [(CAFGroupRequest *)[CAFGroupReadRequest alloc] initWithCar:self];
  id v7 = [(CAFGroupRequest *)[CAFGroupEnableNotificationRequest alloc] initWithCar:self];
  uint64_t v8 = CAFCarLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v59 = objc_msgSend(v6, "count", v45);
    __int16 v60 = 2112;
    v61 = v46;
    __int16 v62 = 2112;
    v63 = v7;
    _os_log_debug_impl(&dword_249710000, v8, OS_LOG_TYPE_DEBUG, "Group initialization start (count=%lu) read=%@ notify=%@", buf, 0x20u);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v71 count:16];
  v47 = v7;
  uint64_t v48 = v9;
  if (!v10)
  {
    char v49 = 0;
    uint64_t v12 = 0;
    long long v13 = 0;
    goto LABEL_30;
  }
  uint64_t v11 = v10;
  char v49 = 0;
  uint64_t v12 = 0;
  long long v13 = 0;
  uint64_t v14 = *(void *)v55;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v55 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8 * v15);
      if ((objc_msgSend(v16, "shouldInitialize", v45) & 1) == 0)
      {
        id v17 = CAFCarLogging();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_13;
        }
        uint64_t v18 = [v16 pluginID];
        uint64_t v19 = [v16 instanceID];
        *(_DWORD *)buf = 138412546;
        uint64_t v59 = (uint64_t)v18;
        __int16 v60 = 2112;
        v61 = v19;
        id v20 = v17;
        id v21 = "Skipping pluginID: %@ instanceID: %@";
        goto LABEL_26;
      }
      if ([v16 hasLargePayload])
      {
        id v17 = CAFCarLogging();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
LABEL_13:

          long long v13 = (CAFGroupReadRequest *)((char *)v13 + 1);
          goto LABEL_14;
        }
        uint64_t v18 = [v16 pluginID];
        uint64_t v19 = [v16 instanceID];
        *(_DWORD *)buf = 138412546;
        uint64_t v59 = (uint64_t)v18;
        __int16 v60 = 2112;
        v61 = v19;
        id v20 = v17;
        id v21 = "Skipping large payload pluginID: %@ instanceID: %@";
LABEL_26:
        _os_log_debug_impl(&dword_249710000, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0x16u);

        id v9 = v48;
        goto LABEL_13;
      }
      if ([v16 notifies])
      {
        id v22 = CAFCarLogging();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          id v24 = [v16 pluginID];
          uint64_t v25 = [v16 instanceID];
          *(_DWORD *)buf = 138412546;
          uint64_t v59 = (uint64_t)v24;
          __int16 v60 = 2112;
          v61 = v25;
          _os_log_debug_impl(&dword_249710000, v22, OS_LOG_TYPE_DEBUG, "Notifies pluginID: %@ instanceID: %@", buf, 0x16u);

          id v7 = v47;
          id v9 = v48;
        }

        [(CAFGroupRequest *)v7 addCharacteristic:v16];
        [v16 groupInitializationRequested];
        ++v12;
      }
      else if ([v16 readable] && (objc_msgSend(v16, "hasInitialValue") & 1) == 0)
      {
        uint64_t v23 = CAFCarLogging();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = [v16 pluginID];
          id v27 = [v16 instanceID];
          *(_DWORD *)buf = 138412546;
          uint64_t v59 = (uint64_t)v26;
          __int16 v60 = 2112;
          v61 = v27;
          _os_log_debug_impl(&dword_249710000, v23, OS_LOG_TYPE_DEBUG, "Read pluginID: %@ instanceID: %@", buf, 0x16u);

          id v9 = v48;
          id v7 = v47;
        }

        [(CAFGroupRequest *)v46 addCharacteristic:v16];
        [v16 groupInitializationRequested];
        char v49 = (CAFGroupEnableNotificationRequest *)((char *)v49 + 1);
      }
LABEL_14:
      ++v15;
    }
    while (v11 != v15);
    uint64_t v28 = [v9 countByEnumeratingWithState:&v54 objects:v71 count:16];
    uint64_t v11 = v28;
  }
  while (v28);
LABEL_30:

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v29 = v45;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v70 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if (objc_msgSend(v34, "shouldInitialize", v45))
        {
          if ([v34 notifies])
          {
            v35 = CAFCarLogging();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              id v39 = [v34 pluginID];
              id v40 = [v34 instanceID];
              *(_DWORD *)buf = 138412546;
              uint64_t v59 = (uint64_t)v39;
              __int16 v60 = 2112;
              v61 = v40;
              _os_log_debug_impl(&dword_249710000, v35, OS_LOG_TYPE_DEBUG, "Notifies pluginID: %@ instanceID: %@", buf, 0x16u);

              id v7 = v47;
            }

            [(CAFGroupEnableNotificationRequest *)v7 addControl:v34];
            ++v12;
          }
        }
        else
        {
          os_signpost_id_t v36 = CAFCarLogging();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            v37 = [v34 pluginID];
            v38 = [v34 instanceID];
            *(_DWORD *)buf = 138412546;
            uint64_t v59 = (uint64_t)v37;
            __int16 v60 = 2112;
            v61 = v38;
            _os_log_debug_impl(&dword_249710000, v36, OS_LOG_TYPE_DEBUG, "Skipping pluginID: %@ instanceID: %@", buf, 0x16u);

            id v7 = v47;
          }

          long long v13 = (CAFGroupReadRequest *)((char *)v13 + 1);
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v50 objects:v70 count:16];
    }
    while (v31);
  }

  id v41 = CAFCarLogging();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = [v48 count];
    uint64_t v44 = [v29 count];
    *(_DWORD *)buf = 134219266;
    uint64_t v59 = v44 + v43;
    __int16 v60 = 2048;
    v61 = v13;
    __int16 v62 = 2048;
    v63 = v49;
    __int16 v64 = 2048;
    uint64_t v65 = v12;
    __int16 v66 = 2112;
    v67 = v46;
    __int16 v68 = 2112;
    v69 = v7;
    _os_log_debug_impl(&dword_249710000, v41, OS_LOG_TYPE_DEBUG, "Group initialization perform (total: %lu skipped: %lu read: %lu notify: %lu) read: %@ notify: %@", buf, 0x3Eu);
  }

  if ([(CAFGroupRequest *)v7 count]) {
    [(CAFGroupRequest *)v7 performWithCompletion:&__block_literal_global_6];
  }
  if ([(CAFGroupRequest *)v46 count]) {
    [(CAFGroupRequest *)v46 performWithCompletion:&__block_literal_global_111_0];
  }
  id v42 = CAFCarLogging();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    -[CAFCar _groupInitialization:controls:]();
  }
}

void __40__CAFCar__groupInitialization_controls___block_invoke()
{
  v0 = CAFCarLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __40__CAFCar__groupInitialization_controls___block_invoke_cold_1();
  }
}

void __40__CAFCar__groupInitialization_controls___block_invoke_109()
{
  v0 = CAFCarLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __40__CAFCar__groupInitialization_controls___block_invoke_109_cold_1();
  }
}

- (BOOL)registeredForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCar *)self carManager];
  id v6 = [v5 config];
  id v7 = [v6 registrations];
  char v8 = [v7 hasAccessory:v4];

  return v8;
}

- (BOOL)hasAccessoryType:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCar *)self accessoryTypes];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isConfigured
{
  id v3 = [(CAFCar *)self car];
  if ([v3 isConfigured])
  {
    id v4 = [(CAFCar *)self processedPluginIDs];
    uint64_t v5 = [v4 count];
    char v6 = [(CAFCar *)self car];
    BOOL v7 = v5 == [v6 pluginCount];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)trimAccessories
{
  id v3 = [(CAFCar *)self refreshQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__CAFCar_trimAccessories__block_invoke;
  block[3] = &unk_265263258;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __25__CAFCar_trimAccessories__block_invoke(uint64_t a1)
{
  uint64_t v2 = CAFCarLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __25__CAFCar_trimAccessories__block_invoke_cold_1();
  }

  uint64_t v3 = MEMORY[0x263EFFA78];
  [*(id *)(a1 + 32) setAccessories:MEMORY[0x263EFFA78]];
  [*(id *)(a1 + 32) setAllAccessories:MEMORY[0x263EFFA68]];
  [*(id *)(a1 + 32) setAccessoriesByCategory:v3];
  return [*(id *)(a1 + 32) setTrimmedAccessories:1];
}

- (void)removeRegistrationForCharacteristics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAFGroupRequest *)[CAFGroupDisableNotificationRequest alloc] initWithCar:self];
  [(CAFGroupDisableNotificationRequest *)v5 setNeedsForced];
  [(CAFGroupRequest *)v5 addCharacteristics:v4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CAFCar_removeRegistrationForCharacteristics___block_invoke;
  v7[3] = &unk_265264030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CAFGroupRequest *)v5 performWithCompletion:v7];
}

void __47__CAFCar_removeRegistrationForCharacteristics___block_invoke(uint64_t a1)
{
  uint64_t v2 = CAFCarLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47__CAFCar_removeRegistrationForCharacteristics___block_invoke_cold_1(a1);
  }
}

- (void)addRegistrationForCharacteristics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAFGroupRequest *)[CAFGroupEnableNotificationRequest alloc] initWithCar:self];
  [(CAFGroupRequest *)v5 addCharacteristics:v4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CAFCar_addRegistrationForCharacteristics___block_invoke;
  v7[3] = &unk_265264030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CAFGroupRequest *)v5 performWithCompletion:v7];
}

void __44__CAFCar_addRegistrationForCharacteristics___block_invoke(uint64_t a1)
{
  uint64_t v2 = CAFCarLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __44__CAFCar_addRegistrationForCharacteristics___block_invoke_cold_1(a1);
  }
}

- (void)didUpdatePluginID:(id)a3 values:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v11 = CAFGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAFCar didUpdatePluginID:values:]();
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = CAFGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAFCar didUpdatePluginID:values:]((uint64_t)v6, (uint64_t)v7, v11);
    }
LABEL_10:

    goto LABEL_17;
  }
  id v8 = CARSignpostLogForCategory();
  if (!self)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
LABEL_12:
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = [v7 count];
      _os_signpost_emit_with_name_impl(&dword_249710000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Car-UpdateValues", "Update values from pluginID: %@ with value count %ld", buf, 0x16u);
    }
    goto LABEL_14;
  }
  id v9 = CARSignpostLogForCategory();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL) {
    goto LABEL_12;
  }
LABEL_14:

  uint64_t v12 = CAFGeneralLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CAFCar didUpdatePluginID:values:]((uint64_t)v6, v7);
  }

  long long v13 = [(CAFCar *)self refreshQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__CAFCar_didUpdatePluginID_values___block_invoke;
  block[3] = &unk_265263398;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_async(v13, block);

LABEL_17:
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke(id *a1)
{
  os_signpost_id_t v2 = 0xEEEEB0B5B2B2EEEELL;
  uint64_t v3 = [a1[4] updatables];
  id v4 = [v3 objectForKeyedSubscript:a1[5]];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = a1[6];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __35__CAFCar_didUpdatePluginID_values___block_invoke_113;
    id v17 = &unk_265264058;
    id v18 = v4;
    id v19 = a1[5];
    id v20 = a1[6];
    id v7 = v5;
    uint64_t v21 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:&v14];
    if ((unint64_t)objc_msgSend(a1[6], "count", v14, v15, v16, v17) >= 2)
    {
      id v8 = CAFCarLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_3(a1 + 6, v7);
      }

      [v7 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_119];
    }
    id v9 = CAFGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_2((uint64_t)(a1 + 5), a1 + 6);
    }

    os_signpost_id_t v10 = CARSignpostLogForCategory();
    if (!a1[4]
      || (CARSignpostLogForCategory(),
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          os_signpost_id_t v2 = os_signpost_id_make_with_pointer(v11, a1[4]),
          v11,
          v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_249710000, v10, OS_SIGNPOST_INTERVAL_END, v2, "Car-UpdateValues", (const char *)&unk_2497DFEC6, buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v12 = CAFGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_1();
    }

    id v7 = CARSignpostLogForCategory();
    if (!a1[4]
      || (CARSignpostLogForCategory(),
          long long v13 = objc_claimAutoreleasedReturnValue(),
          os_signpost_id_t v2 = os_signpost_id_make_with_pointer(v13, a1[4]),
          v13,
          v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_249710000, v7, OS_SIGNPOST_INTERVAL_END, v2, "Car-UpdateValues", (const char *)&unk_2497DFEC6, buf, 2u);
      }
    }
  }
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_113(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] objectForKeyedSubscript:v5];
  id v8 = v7;
  if (!v7)
  {
    id v9 = CAFCarLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __35__CAFCar_didUpdatePluginID_values___block_invoke_113_cold_1();
    }
    goto LABEL_9;
  }
  [v7 handleUpdateWithInstanceID:v5 value:v6];
  if ((unint64_t)[a1[6] count] >= 2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      os_signpost_id_t v10 = [v9 service];
      uint64_t v11 = [v10 uniqueIdentifier];

      uint64_t v12 = [a1[7] objectForKeyedSubscript:v11];
      if (!v12)
      {
        uint64_t v12 = [MEMORY[0x263EFF9C0] set];
      }
      [v12 addObject:v9];
      [a1[7] setObject:v12 forKey:v11];

LABEL_9:
    }
  }
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_116(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v6 = [v3 anyObject];
  id v4 = [v6 service];
  id v5 = [v3 allObjects];

  [v4 _didUpdateValuesForGroupedCharacteristics:v5];
}

- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = CARSignpostLogForCategory();
  if (self)
  {
    uint64_t v15 = CARSignpostLogForCategory();
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);

    if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    os_signpost_id_t v16 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2048;
    uint64_t v34 = [v12 count];
    _os_signpost_emit_with_name_impl(&dword_249710000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Car-RequestValues", "Request from pluginID: %@ instanceID: %@ with request count %ld", buf, 0x20u);
  }
LABEL_7:

  id v17 = CAFGeneralLogging();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = [v12 count];
    *(_DWORD *)buf = 138412802;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2048;
    uint64_t v34 = v23;
    _os_log_debug_impl(&dword_249710000, v17, OS_LOG_TYPE_DEBUG, "Request received from pluginID: %@ instanceID: %@ with request count %ld START", buf, 0x20u);
  }

  id v18 = [(CAFCar *)self refreshQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke;
  block[3] = &unk_2652640A0;
  block[4] = self;
  id v25 = v10;
  id v27 = v12;
  id v28 = v13;
  id v26 = v11;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  id v22 = v10;
  dispatch_async(v18, block);
}

void __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = [*(id *)(a1 + 32) updatables];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v9 = CAFGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_1();
    }

    id v10 = CARSignpostLogForCategory();
    if (*(void *)(a1 + 32))
    {
      id v11 = CARSignpostLogForCategory();
      os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, *(const void **)(a1 + 32));

      if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_23:

        uint64_t v15 = *(void *)(a1 + 64);
        id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v4);
        goto LABEL_24;
      }
    }
    else
    {
      os_signpost_id_t v12 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v10))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_249710000, v10, OS_SIGNPOST_INTERVAL_END, v12, "Car-RequestValues", (const char *)&unk_2497DFEC6, (uint8_t *)&v19, 2u);
    }
    goto LABEL_23;
  }
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (!v4)
  {
    id v13 = CAFCarLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_2();
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = CAFCarLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_3();
    }
LABEL_18:

    uint64_t v14 = *(void *)(a1 + 64);
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
    (*(void (**)(uint64_t, void, NSObject *))(v14 + 16))(v14, 0, v6);
    goto LABEL_19;
  }
  [v4 handleRequestWithValue:*(void *)(a1 + 56) withResponse:*(void *)(a1 + 64)];
  id v5 = CAFGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = [*(id *)(a1 + 56) count];
    int v19 = 138412802;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v17;
    __int16 v23 = 2048;
    uint64_t v24 = v18;
    _os_log_debug_impl(&dword_249710000, v5, OS_LOG_TYPE_DEBUG, "Request received from pluginID: %@ instanceID: %@ with request count %ld END", (uint8_t *)&v19, 0x20u);
  }

  id v6 = CARSignpostLogForCategory();
  if (!*(void *)(a1 + 32))
  {
    os_signpost_id_t v8 = 0xEEEEB0B5B2B2EEEELL;
    goto LABEL_26;
  }
  id v7 = CARSignpostLogForCategory();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_26:
    if (os_signpost_enabled(v6))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_249710000, v6, OS_SIGNPOST_INTERVAL_END, v8, "Car-RequestValues", (const char *)&unk_2497DFEC6, (uint8_t *)&v19, 2u);
    }
  }
LABEL_19:

LABEL_24:
}

- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CARSignpostLogForCategory();
  if (self)
  {
    os_signpost_id_t v12 = CARSignpostLogForCategory();
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

    if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    os_signpost_id_t v13 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = [v10 count];
    _os_signpost_emit_with_name_impl(&dword_249710000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "Car-RequestValues", "Notification from pluginID: %@ instanceID: %@ with request count %ld", buf, 0x20u);
  }
LABEL_7:

  uint64_t v14 = CAFGeneralLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [v10 count];
    *(_DWORD *)buf = 138412802;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = v19;
    _os_log_debug_impl(&dword_249710000, v14, OS_LOG_TYPE_DEBUG, "Notification received from pluginID: %@ instanceID: %@ with request count %ld START", buf, 0x20u);
  }

  uint64_t v15 = [(CAFCar *)self refreshQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke;
  v20[3] = &unk_2652640C8;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  dispatch_async(v15, v20);
}

void __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = [*(id *)(a1 + 32) updatables];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];
    if (!v4)
    {
      id v6 = CAFCarLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_2();
      }
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = CAFCarLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_3();
      }
      goto LABEL_24;
    }
    [v4 handleNotificationWithValue:*(void *)(a1 + 56)];
    id v5 = CAFGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = [*(id *)(a1 + 56) count];
      int v15 = 138412802;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      _os_log_debug_impl(&dword_249710000, v5, OS_LOG_TYPE_DEBUG, "Notification received from pluginID: %@ instanceID: %@ with request count %ld END", (uint8_t *)&v15, 0x20u);
    }

    id v6 = CARSignpostLogForCategory();
    if (*(void *)(a1 + 32))
    {
      id v7 = CARSignpostLogForCategory();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));

      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      os_signpost_id_t v8 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v6))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_249710000, v6, OS_SIGNPOST_INTERVAL_END, v8, "Car-RequestValues", (const char *)&unk_2497DFEC6, (uint8_t *)&v15, 2u);
    }
    goto LABEL_24;
  }
  id v9 = CAFGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_1();
  }

  id v4 = CARSignpostLogForCategory();
  if (*(void *)(a1 + 32))
  {
    id v10 = CARSignpostLogForCategory();
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 32));

    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_25;
    }
  }
  else
  {
    os_signpost_id_t v11 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v4))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_249710000, v4, OS_SIGNPOST_INTERVAL_END, v11, "Car-RequestValues", (const char *)&unk_2497DFEC6, (uint8_t *)&v15, 2u);
  }
LABEL_25:
}

- (void)requestControl:(id)a3 value:(id)a4 response:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CAFCar *)self carManager];
  [v11 requestControl:v10 value:v9 response:v8];
}

- (void)notifyControl:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAFCar *)self carManager];
  [v8 notifyControl:v7 value:v6];
}

- (void)readCharacteristic:(id)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAFCar *)self carManager];
  [v8 readCharacteristic:v7 response:v6];
}

- (void)writeCharacteristic:(id)a3 value:(id)a4 response:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CAFCar *)self carManager];
  [v11 writeCharacteristic:v10 value:v9 response:v8];
}

- (void)enableNotificationForCharacteristic:(id)a3 enable:(BOOL)a4 response:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CAFCar *)self carManager];
  [v10 enableNotificationForCharacteristic:v9 enable:v5 response:v8];
}

- (void)enableNotificationForControl:(id)a3 enable:(BOOL)a4 response:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CAFCar *)self carManager];
  [v10 enableNotificationForControl:v9 enable:v5 response:v8];
}

- (void)performGroupedRequest:(id)a3 key:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CAFCar *)self carManager];
  [v14 performGroupedRequest:v13 key:v12 value:v11 withResponse:v10];
}

- (void)_accessoryDidUpdate:(id)a3 service:(id)a4 characteristic:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CAFCar *)self observers];
  [v11 carDidUpdate:self accessory:v10 service:v9 characteristic:v8];
}

- (void)refreshCharacteristics:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) updateValueRequiringRead:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_accessoryReceivedAllValues:(id)a3
{
  id v4 = a3;
  id v6 = [(CAFCar *)self valueMonitor];
  uint64_t v5 = [v4 uniqueIdentifier];

  -[CAFCar setReceivedAllValues:](self, "setReceivedAllValues:", [v6 valueReceivedFor:v5]);
}

- (void)_accessoryDidUpdate:(id)a3 service:(id)a4 control:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CAFCar *)self observers];
  [v11 carDidUpdate:self accessory:v10 service:v9 control:v8];
}

- (NSUUID)uniqueIdentifier
{
  os_signpost_id_t v2 = [(CAFCar *)self car];
  id v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (NSString)name
{
  os_signpost_id_t v2 = [(CAFCar *)self car];
  id v3 = [v2 name];
  id v4 = v3;
  if (!v3) {
    id v3 = @"_unnamed_";
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSString)typeName
{
  return (NSString *)@"Car";
}

- (BOOL)usable
{
  os_signpost_id_t v2 = [(CAFCar *)self accessories];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (Class)baseCAFClass
{
  return (Class)objc_opt_class();
}

- (NSArray)comparisonKeys
{
  return (NSArray *)&unk_26FD90960;
}

- (void)invalidate
{
  uint64_t v1 = [a1 allAccessories];
  [v1 count];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%{public}@ time to invalidate (%lu)", v4, v5, v6, v7, v8);
}

- (CAFCarObserver)combineObserver
{
  id v2 = [(CAFCar *)self observableCache];
  if ([v2 conformsToProtocol:&unk_26FD96140]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (CAFCarObserver *)v3;
}

- (id)currentDescriptionForCache:(id)a3
{
  if ([(CAFCar *)self trimmedAccessories])
  {
    uint64_t v4 = @"Accessories Trimmed";
  }
  else
  {
    uint64_t v5 = NSString;
    uint64_t v6 = NSNumber;
    uint64_t v7 = [(CAFCar *)self accessories];
    uint8_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    [v5 stringWithFormat:@"accessoriesCount=%@", v8];
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v9 = NSString;
  uint64_t v10 = objc_opt_class();
  id v11 = [(CAFCar *)self name];
  id v12 = [(CAFCar *)self uniqueIdentifier];
  if ([(CAFCar *)self isConfigured]) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  if ([(CAFCar *)self receivedAllValues]) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  int v15 = [v9 stringWithFormat:@"<%@ %p: name=%@ uniqueIdentifier=%@ %@ isConfigured=%@ recievedAllValues=%@>", v10, self, v11, v12, v4, v13, v14];

  return v15;
}

- (unint64_t)state
{
  if ([(CAFCar *)self receivedAllValues]) {
    return 3;
  }
  else {
    return 6;
  }
}

- (id)observableCache
{
  return self->_observableCache;
}

- (void)setObservableCache:(id)a3
{
}

- (CAFCarManager)carManager
{
  return self->_carManager;
}

- (CAFPositionManager)positionManager
{
  return self->_positionManager;
}

- (void)setPositionManager:(id)a3
{
}

- (NSDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (BOOL)receivedAllValues
{
  return self->_receivedAllValues;
}

- (CAFDimensionManager)dimensionManager
{
  return self->_dimensionManager;
}

- (CAFCarConfiguration)car
{
  return self->_car;
}

- (void)setCar:(id)a3
{
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
}

- (CAFValueMonitor)valueMonitor
{
  return self->_valueMonitor;
}

- (void)setValueMonitor:(id)a3
{
}

- (NSMutableSet)processedPluginIDs
{
  return self->_processedPluginIDs;
}

- (BOOL)trimmedAccessories
{
  return self->_trimmedAccessories;
}

- (void)setTrimmedAccessories:(BOOL)a3
{
  self->_trimmedAccessories = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)refreshQueue
{
  return self->_refreshQueue;
}

- (void)setRefreshQueue:(id)a3
{
}

- (NSMutableSet)accessoryTypes
{
  return self->_accessoryTypes;
}

- (NSArray)allAccessories
{
  return self->_allAccessories;
}

- (void)setAllAccessories:(id)a3
{
}

- (NSDictionary)accessoriesByCategory
{
  return self->_accessoriesByCategory;
}

- (void)setAccessoriesByCategory:(id)a3
{
}

- (NSDictionary)updatables
{
  return self->_updatables;
}

- (void)setUpdatables:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatables, 0);
  objc_storeStrong((id *)&self->_accessoriesByCategory, 0);
  objc_storeStrong((id *)&self->_allAccessories, 0);
  objc_storeStrong((id *)&self->_accessoryTypes, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_processedPluginIDs, 0);
  objc_storeStrong((id *)&self->_valueMonitor, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_car, 0);
  objc_storeStrong((id *)&self->_dimensionManager, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_positionManager, 0);
  objc_storeStrong((id *)&self->_carManager, 0);
  objc_storeStrong(&self->_observableCache, 0);
}

- (id)mediaSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAFCar *)self media];
  uint64_t v6 = [v5 mediaSources];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__CAFCar_CAFNowPlaying__mediaSourceWithIdentifier___block_invoke;
  v13[3] = &unk_265264418;
  id v7 = v4;
  id v14 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v13];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = [(CAFCar *)self media];
    id v11 = [v10 mediaSources];
    id v9 = [v11 objectAtIndexedSubscript:v8];
  }
  return v9;
}

uint64_t __51__CAFCar_CAFNowPlaying__mediaSourceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (CAFMediaSource)currentMediaSource
{
  id v3 = [(CAFCar *)self nowPlayingInformation];
  uint64_t v4 = [v3 nowPlaying];
  uint64_t v5 = [v4 currentMediaSourceIdentifier];

  uint64_t v6 = [(CAFCar *)self mediaSourceWithIdentifier:v5];

  return (CAFMediaSource *)v6;
}

- (unsigned)np_currentFrequency
{
  id v2 = [(CAFCar *)self currentMediaSource];
  unsigned int v3 = [v2 currentFrequency];

  return v3;
}

- (CAFUInt32Range)np_currentFrequencyRange
{
  id v2 = [(CAFCar *)self currentMediaSource];
  unsigned int v3 = [v2 currentFrequencyRange];

  return (CAFUInt32Range *)v3;
}

- (CAFMediaItems)np_currentMediaItems
{
  id v2 = [(CAFCar *)self currentMediaSource];
  unsigned int v3 = [v2 mediaItems];

  return (CAFMediaItems *)v3;
}

- (NSString)np_titleForCurrentMediaSource
{
  id v2 = [(CAFCar *)self currentMediaSource];
  unsigned int v3 = [v2 userVisibleLabel];

  return (NSString *)v3;
}

- (CAFAudioSettings)audioSettings
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000002000001"];

  objc_opt_class();
  uint64_t v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000002000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFAudioSettings *)v8;
}

- (CAFAutomakerExteriorCamera)automakerExteriorCamera
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001300001"];

  objc_opt_class();
  uint64_t v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001300001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFAutomakerExteriorCamera *)v8;
}

- (NSArray)automakerInputStreams
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x000000000C000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x000000000C000001"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (CAFAutomakerNotificationHistory)automakerNotificationHistory
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001400001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001400001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFAutomakerNotificationHistory *)v8;
}

- (NSArray)automakerNotifications
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000006000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000006000001"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSArray)automakerRequestContent
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001200001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001200001"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (CAFAutomakerSettings)automakerSettings
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000005000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000005000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFAutomakerSettings *)v8;
}

- (CAFCharging)charging
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000009000008"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000009000008"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFCharging *)v8;
}

- (CAFClimate)climate
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFClimate *)v8;
}

- (CAFClosure)closure
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x000000000D000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x000000000D000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFClosure *)v8;
}

- (CAFDriveState)driveState
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000009000003"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000009000003"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFDriveState *)v8;
}

- (CAFDriverAssistance)driverAssistance
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x000000000E000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x000000000E000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFDriverAssistance *)v8;
}

- (CAFElectricEngine)electricEngine
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000009000004"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000009000004"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFElectricEngine *)v8;
}

- (CAFEnvironmentalConditions)environmentalConditions
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001600001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001600001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFEnvironmentalConditions *)v8;
}

- (CAFFuel)fuel
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000009000006"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000009000006"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFFuel *)v8;
}

- (CAFHighVoltageBattery)highVoltageBattery
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000009000007"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000009000007"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFHighVoltageBattery *)v8;
}

- (CAFInternalCombustionEngine)internalCombustionEngine
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000009000005"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000009000005"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFInternalCombustionEngine *)v8;
}

- (CAFMedia)media
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000003000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000003000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFMedia *)v8;
}

- (CAFNowPlayingInformation)nowPlayingInformation
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x000000000F000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x000000000F000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFNowPlayingInformation *)v8;
}

- (CAFPairedDevices)pairedDevices
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x000000000B000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x000000000B000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFPairedDevices *)v8;
}

- (CAFSeat)seat
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001500001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001500001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFSeat *)v8;
}

- (NSArray)testingUseOnly
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x00000000FD000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x00000000FD000001"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (CAFTire)tire
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x000000000A000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x000000000A000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFTire *)v8;
}

- (CAFTripComputer)tripComputer
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000004000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000004000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFTripComputer *)v8;
}

- (NSArray)uiControl
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001100001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001100001"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (CAFVehicleMotion)vehicleMotion
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000009000001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000009000001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFVehicleMotion *)v8;
}

- (CAFVehicleResources)vehicleResources
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001200002"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001200002"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFVehicleResources *)v8;
}

- (CAFVehicleUnits)vehicleUnits
{
  unsigned int v3 = [(CAFCar *)self carManager];
  uint64_t v4 = [v3 config];
  uint64_t v5 = [v4 registrations];
  [v5 validateRegisteredForAccessory:@"0x0000000001700001"];

  objc_opt_class();
  id v6 = [(CAFCar *)self accessoriesForCategory:@"0x0000000001700001"];
  id v7 = [v6 firstObject];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (CAFVehicleUnits *)v8;
}

- (void)initWithManager:car:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ done", v2, v3, v4, v5, v6);
}

- (void)setReceivedAllValues:.cold.1()
{
  OUTLINED_FUNCTION_12();
  _os_log_fault_impl(&dword_249710000, v0, OS_LOG_TYPE_FAULT, "receivedAllValues should not go back to NO", v1, 2u);
}

void __29__CAFCar__refreshAccessories__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_249710000, v0, v1, "%{public}@ done didUpdate=%@");
}

void __29__CAFCar__refreshAccessories__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ start", v2, v3, v4, v5, v6);
}

void __29__CAFCar__refreshAccessories__block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "Already parsed pluginID %@", v2, v3, v4, v5, v6);
}

void __29__CAFCar__refreshAccessories__block_invoke_92_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "Parsing pluginID %@ done", v2, v3, v4, v5, v6);
}

void __29__CAFCar__refreshAccessories__block_invoke_92_cold_3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "Parsing pluginID %@ start", v2, v3, v4, v5, v6);
}

void __29__CAFCar__refreshAccessories__block_invoke_94_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_249710000, v0, v1, "Parsing accessory config from pluginID: %@ failed for accessory", v2, v3, v4, v5, v6);
}

void __29__CAFCar__refreshAccessories__block_invoke_94_cold_2()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_249710000, v0, v1, "Parsing accessory config from pluginID: %@ failed for instanceID", v2, v3, v4, v5, v6);
}

void __29__CAFCar__refreshAccessories__block_invoke_94_cold_3()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_249710000, v0, v1, "Creating accessory from pluginID: %@ instanceID: %@ failed");
}

void __29__CAFCar__refreshAccessories__block_invoke_94_cold_4()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_249710000, v0, v1, "New accessory from pluginID: %@ instanceID: %@ found");
}

- (void)_groupInitialization:controls:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_249710000, v0, v1, "Group initialization inflight", v2, v3, v4, v5, v6);
}

void __40__CAFCar__groupInitialization_controls___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_249710000, v0, v1, "Group notify request completed", v2, v3, v4, v5, v6);
}

void __40__CAFCar__groupInitialization_controls___block_invoke_109_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_249710000, v0, v1, "Group read request completed", v2, v3, v4, v5, v6);
}

void __25__CAFCar_trimAccessories__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%@ trimming!", v2, v3, v4, v5, v6);
}

void __47__CAFCar_removeRegistrationForCharacteristics___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) count];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_249710000, v1, v2, "%@ group unregister completed for %lu", v3, v4, v5, v6, v7);
}

void __44__CAFCar_addRegistrationForCharacteristics___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) count];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_249710000, v1, v2, "%@ group register completed for %lu", v3, v4, v5, v6, v7);
}

- (void)didUpdatePluginID:values:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5_0(&dword_249710000, v0, v1, "Error updating pluginID: %@ without values", v2, v3, v4, v5, v6);
}

- (void)didUpdatePluginID:(uint64_t)a1 values:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "Update values from pluginID: %@ with value count %ld START", v4, v5, v6, v7, v8);
}

- (void)didUpdatePluginID:(NSObject *)a3 values:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  id v8 = (id)objc_opt_class();
  id v4 = v8;
  _os_log_error_impl(&dword_249710000, a3, OS_LOG_TYPE_ERROR, "Error updating pluginID: %@ with wrong updates type: %@", (uint8_t *)&v5, 0x16u);
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_249710000, v0, v1, "Update values from pluginID: %@, but updatables do not exist.", v2, v3, v4, v5, v6);
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_2(uint64_t a1, id *a2)
{
  [*a2 count];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "Update values from pluginID: %@ with value count %ld END", v4, v5, v6, v7, v8);
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_3(id *a1, void *a2)
{
  [*a1 count];
  [a2 count];
  OUTLINED_FUNCTION_8(&dword_249710000, v3, v4, "Received grouped update for %lu values across %lu services", v5, v6, v7, v8, 0);
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_113_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_249710000, v0, v1, "Received update from pluginID: %@, but updatable for instanceID: %@ does not exist.");
}

void __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_249710000, v0, v1, "Request received from pluginID: %@, but updatables do not exist.", v2, v3, v4, v5, v6);
}

void __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_249710000, v0, v1, "Request received from pluginID: %@, but updatable for instanceID: %@ does not exist.");
}

void __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_249710000, v0, v1, "Request received from pluginID: %@, but updatable for instanceID: %@ is not a control.");
}

void __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_249710000, v0, v1, "Notification received from pluginID: %@, but updatables do not exist.", v2, v3, v4, v5, v6);
}

void __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_249710000, v0, v1, "Notification received from pluginID: %@, but updatable for instanceID: %@ does not exist.");
}

void __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_249710000, v0, v1, "Notification received from pluginID: %@, but updatable for instanceID: %@ is not a control.");
}

@end
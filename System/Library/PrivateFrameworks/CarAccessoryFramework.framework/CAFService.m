@interface CAFService
+ (id)indexBy;
+ (id)observerProtocol;
+ (id)registeredServiceClasses;
+ (id)serviceIdentifier;
+ (id)serviceType;
+ (id)serviceWithAccessory:(id)a3 config:(id)a4;
+ (void)load;
+ (void)registerServiceClass:(Class)a3;
- (BOOL)hasError;
- (BOOL)receivedAllValues;
- (BOOL)usable;
- (CAFAccessory)accessory;
- (CAFCachedDescription)cachedDescription;
- (CAFCar)car;
- (CAFService)initWithAccessory:(id)a3 config:(id)a4;
- (CAFValueMonitor)valueMonitor;
- (CARObserverHashTable)observers;
- (Class)baseCAFClass;
- (NSArray)characteristicsWithLargePayload;
- (NSArray)comparisonKeys;
- (NSArray)sortedCharacteristics;
- (NSArray)sortedControls;
- (NSDictionary)characteristics;
- (NSDictionary)characteristicsByType;
- (NSDictionary)controls;
- (NSDictionary)controlsByType;
- (NSNumber)instanceID;
- (NSString)description;
- (NSString)serviceType;
- (NSString)typeName;
- (NSUUID)uniqueIdentifier;
- (id)characteristicForName:(id)a3;
- (id)characteristicForType:(id)a3;
- (id)controlForName:(id)a3;
- (id)controlForType:(id)a3;
- (id)currentDescriptionForCache:(id)a3;
- (id)indexBy;
- (id)observableCache;
- (id)pluginID;
- (int64_t)compare:(id)a3;
- (unint64_t)state;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)_controlDidUpdate:(id)a3;
- (void)_didUpdateValuesForGroupedCharacteristics:(id)a3;
- (void)_updateReceivedValuesWithCharacteristic:(id)a3;
- (void)invalidate;
- (void)refreshCharacteristics;
- (void)registerAllRawDataIfNeeded;
- (void)registerObserver:(id)a3;
- (void)setCachedDescription:(id)a3;
- (void)setObservableCache:(id)a3;
- (void)setObservers:(id)a3;
- (void)setReceivedAllValues:(BOOL)a3;
- (void)setTypeName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setValueMonitor:(id)a3;
- (void)unregisterAllRawDataIfNeeded;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFService

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[CAFService registerServiceClass:v3];
  }
}

+ (void)registerServiceClass:(Class)a3
{
  if (registerServiceClass__onceToken != -1) {
    dispatch_once(&registerServiceClass__onceToken, &__block_literal_global);
  }
  id obj = (id)_registeredServiceClasses;
  objc_sync_enter(obj);
  v4 = (void *)_registeredServiceClasses;
  v5 = [(objc_class *)a3 serviceType];
  [v4 setObject:a3 forKeyedSubscript:v5];

  objc_sync_exit(obj);
}

uint64_t __35__CAFService_registerServiceClass___block_invoke()
{
  _registeredServiceClasses = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)registeredServiceClasses
{
  id v2 = (id)_registeredServiceClasses;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(id)_registeredServiceClasses copy];
  objc_sync_exit(v2);

  return v3;
}

+ (id)serviceWithAccessory:(id)a3 config:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[CAFCarConfiguration getType:v5];
  v8 = +[CAFService registeredServiceClasses];
  v9 = +[CAFServiceTypes serviceNameByType];
  v10 = [v9 objectForKeyedSubscript:v7];
  v11 = (objc_class *)[v8 objectForKeyedSubscript:v10];

  if (!v11) {
    v11 = (objc_class *)objc_opt_class();
  }
  v12 = (void *)[[v11 alloc] initWithAccessory:v6 config:v5];

  return v12;
}

- (CAFService)initWithAccessory:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v64.receiver = self;
  v64.super_class = (Class)CAFService;
  v8 = [(CAFService *)&v64 init];
  uint64_t v9 = (uint64_t)v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_opt_class();
    id v10 = [v7 objectForKeyedSubscript:@"iid"];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    v12 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v11;

    if (*(void *)(v9 + 48))
    {
      uint64_t v13 = +[CAFCarConfiguration getType:v7];
      v14 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v13;

      if (*(void *)(v9 + 56))
      {
        v15 = [v6 pluginID];
        uint64_t v16 = +[CAFCarConfiguration getUUID:v15 instanceID:*(void *)(v9 + 48)];
        v17 = *(void **)(v9 + 64);
        *(void *)(v9 + 64) = v16;

        uint64_t v18 = +[CAFServiceTypes serviceNameForType:*(void *)(v9 + 56)];
        v19 = *(void **)(v9 + 72);
        *(void *)(v9 + 72) = v18;

        id v20 = objc_alloc(MEMORY[0x263F30E18]);
        v21 = [(id)objc_opt_class() observerProtocol];
        uint64_t v22 = [v20 initWithProtocol:v21];
        v23 = *(void **)(v9 + 120);
        *(void *)(v9 + 120) = v22;

        v24 = [[CAFCachedDescription alloc] initWithCacheable:v9];
        v25 = *(void **)(v9 + 80);
        *(void *)(v9 + 80) = v24;

        v26 = [[CAFValueMonitor alloc] initWithDelegate:v9];
        v27 = *(void **)(v9 + 88);
        *(void *)(v9 + 88) = v26;

        id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
        objc_opt_class();
        id v31 = [v7 objectForKeyedSubscript:@"characteristics"];
        if (v31 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v32 = v31;
        }
        else {
          id v32 = 0;
        }

        if (v32)
        {
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __39__CAFService_initWithAccessory_config___block_invoke;
          v58[3] = &unk_2652631E0;
          id v59 = v6;
          id v60 = (id)v9;
          id v61 = v28;
          id v62 = v29;
          id v63 = v30;
          [v32 enumerateObjectsUsingBlock:v58];
        }
        v52 = v28;
        objc_storeStrong((id *)(v9 + 32), v28);
        objc_storeStrong((id *)(v9 + 96), v29);
        objc_storeStrong((id *)(v9 + 104), v30);
        id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        objc_opt_class();
        id v36 = [v7 objectForKeyedSubscript:@"controls"];
        if (v36 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v37 = v36;
        }
        else {
          id v37 = 0;
        }

        if (v37)
        {
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __39__CAFService_initWithAccessory_config___block_invoke_32;
          v53[3] = &unk_265263208;
          id v54 = v6;
          id v55 = (id)v9;
          id v56 = v34;
          id v57 = v35;
          [v37 enumerateObjectsUsingBlock:v53];
        }
        objc_storeStrong((id *)(v9 + 40), v34);
        v38 = *(void **)(v9 + 112);
        *(void *)(v9 + 112) = v35;
        id v39 = v35;

        v40 = [(id)v9 cachedDescription];
        [v40 setNeedsRefreshDescription];

        v41 = CAFServiceLogging();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[CAFService initWithAccessory:config:](v9, v41, v42, v43, v44, v45, v46, v47);
        }

        [*(id *)(v9 + 88) signalReadyToMonitor];
        uint64_t v48 = [*(id *)(v9 + 88) receivedAllValues];

        [(id)v9 setReceivedAllValues:v48];
        goto LABEL_26;
      }
      v50 = CAFServiceLogging();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[CAFService initWithAccessory:config:](v6);
      }
    }
    else
    {
      v33 = CAFServiceLogging();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[CAFService initWithAccessory:config:](v6);
      }
    }
    v49 = 0;
    goto LABEL_31;
  }
LABEL_26:
  v49 = (CAFService *)(id)v9;
LABEL_31:

  return v49;
}

void __39__CAFService_initWithAccessory_config___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = +[CAFCarConfiguration getType:v4];
    id v6 = (void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 40) car];
    v8 = [v7 carManager];
    uint64_t v9 = [*(id *)(a1 + 40) accessory];
    id v10 = [v9 categoryType];
    id v11 = [*(id *)(a1 + 40) serviceType];
    int v12 = [v8 shouldAllocAccessoryType:v10 serviceType:v11 characteristicType:v5];

    if (v12)
    {
      uint64_t v13 = +[CAFCharacteristic characteristicWithService:*v6 config:v4];
      v14 = v13;
      if (v13)
      {
        if ([v13 usable])
        {
          v15 = *(void **)(a1 + 48);
          uint64_t v16 = [v14 uniqueIdentifier];
          [v15 setObject:v14 forKeyedSubscript:v16];

          if (([v14 isCurrent] & 1) == 0)
          {
            v17 = *(void **)(*v6 + 88);
            uint64_t v18 = [v14 uniqueIdentifier];
            [v17 monitorForValue:v18];
          }
          v19 = *(void **)(a1 + 56);
          id v20 = [v14 name];
          v21 = [v19 objectForKeyedSubscript:v20];

          if (!v21)
          {
            v21 = objc_opt_new();
            uint64_t v22 = *(void **)(a1 + 56);
            v23 = [v14 name];
            [v22 setObject:v21 forKeyedSubscript:v23];
          }
          [v21 addObject:v14];
          if ([v14 hasLargePayload]) {
            [*(id *)(a1 + 64) addObject:v14];
          }
        }
      }
      else
      {
        v25 = CAFServiceLogging();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          __39__CAFService_initWithAccessory_config___block_invoke_cold_2(a1);
        }
      }
    }

    v24 = v4;
  }
  else
  {

    v24 = CAFServiceLogging();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __39__CAFService_initWithAccessory_config___block_invoke_cold_1(a1);
    }
  }
}

void __39__CAFService_initWithAccessory_config___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = +[CAFCarConfiguration getType:v4];
    id v6 = [*(id *)(a1 + 40) car];
    id v7 = [v6 carManager];
    v8 = [*(id *)(a1 + 40) accessory];
    uint64_t v9 = [v8 categoryType];
    id v10 = [*(id *)(a1 + 40) serviceType];
    int v11 = [v7 shouldAllocAccessoryType:v9 serviceType:v10 controlType:v5];

    if (v11)
    {
      int v12 = +[CAFControl controlWithService:*(void *)(a1 + 40) config:v4];
      uint64_t v13 = v12;
      if (v12)
      {
        if ([v12 usable])
        {
          v14 = *(void **)(a1 + 48);
          v15 = [v13 uniqueIdentifier];
          [v14 setObject:v13 forKeyedSubscript:v15];

          uint64_t v16 = *(void **)(a1 + 56);
          v17 = [v13 name];
          uint64_t v18 = [v16 objectForKeyedSubscript:v17];

          if (!v18)
          {
            uint64_t v18 = objc_opt_new();
            v19 = *(void **)(a1 + 56);
            id v20 = [v13 name];
            [v19 setObject:v18 forKeyedSubscript:v20];
          }
          [v18 addObject:v13];
        }
      }
      else
      {
        uint64_t v22 = CAFServiceLogging();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          __39__CAFService_initWithAccessory_config___block_invoke_32_cold_2(a1);
        }
      }
    }

    v21 = v4;
  }
  else
  {

    v21 = CAFServiceLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __39__CAFService_initWithAccessory_config___block_invoke_32_cold_1(a1);
    }
  }
}

- (CAFCar)car
{
  id v2 = [(CAFService *)self accessory];
  id v3 = [v2 car];

  return (CAFCar *)v3;
}

- (id)characteristicForType:(id)a3
{
  id v4 = a3;
  id v5 = +[CAFCharacteristicTypes characteristicNameByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [(CAFService *)self characteristicForName:v6];

  return v7;
}

- (id)characteristicForName:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFService *)self characteristicsByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 firstObject];

  return v7;
}

- (id)controlForType:(id)a3
{
  id v4 = a3;
  id v5 = +[CAFControlTypes controlNameByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [(CAFService *)self controlForName:v6];

  return v7;
}

- (id)controlForName:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFService *)self controlsByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 firstObject];

  return v7;
}

- (BOOL)hasError
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CAFService *)self characteristics];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasError])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)sortedCharacteristics
{
  id v2 = [(CAFService *)self characteristics];
  uint64_t v3 = [v2 allValues];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v4;
}

- (NSArray)sortedControls
{
  id v2 = [(CAFService *)self controls];
  uint64_t v3 = [v2 allValues];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v4;
}

- (void)setReceivedAllValues:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_receivedAllValues != a3)
  {
    BOOL v3 = a3;
    id v5 = CAFServiceLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      long long v10 = @"YES";
      if (self->_receivedAllValues) {
        int v11 = @"YES";
      }
      else {
        int v11 = @"NO";
      }
      int v12 = 138543874;
      uint64_t v13 = self;
      if (!v3) {
        long long v10 = @"NO";
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
      id v6 = [(CAFService *)self cachedDescription];
      [v6 setNeedsRefreshDescription];

      long long v7 = CARSignpostLogForCategory();
      if (os_signpost_enabled(v7))
      {
        int v12 = 138412290;
        uint64_t v13 = self;
        _os_signpost_emit_with_name_impl(&dword_249710000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedAllValues", "%@", (uint8_t *)&v12, 0xCu);
      }

      long long v8 = [(CAFService *)self accessory];
      [v8 _serviceReceivedAllValues:self];

      long long v9 = [(CAFService *)self observers];
      [v9 serviceDidUpdate:self receivedAllValues:1];
    }
    else
    {
      long long v9 = CAFGeneralLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[CAFService setReceivedAllValues:](v9);
      }
    }
  }
}

- (void)refreshCharacteristics
{
}

- (void)registerAllRawDataIfNeeded
{
  BOOL v3 = [(CAFService *)self characteristicsWithLargePayload];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__CAFService_registerAllRawDataIfNeeded__block_invoke;
    block[3] = &unk_265263258;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __40__CAFService_registerAllRawDataIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = CAFServiceLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__CAFService_registerAllRawDataIfNeeded__block_invoke_cold_1(a1);
  }

  BOOL v3 = [CAFGroupEnableNotificationRequest alloc];
  uint64_t v4 = [*(id *)(a1 + 32) car];
  id v5 = [(CAFGroupRequest *)v3 initWithCar:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) characteristicsWithLargePayload];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CAFGroupRequest *)v5 addCharacteristic:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__CAFService_registerAllRawDataIfNeeded__block_invoke_45;
  v11[3] = &unk_265263230;
  v11[4] = *(void *)(a1 + 32);
  [(CAFGroupRequest *)v5 performWithCompletion:v11];
}

void __40__CAFService_registerAllRawDataIfNeeded__block_invoke_45(uint64_t a1)
{
  id v2 = CAFServiceLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__CAFService_registerAllRawDataIfNeeded__block_invoke_45_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (void)unregisterAllRawDataIfNeeded
{
  uint64_t v3 = [(CAFService *)self characteristicsWithLargePayload];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke;
    block[3] = &unk_265263258;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = CAFServiceLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_cold_1(a1);
  }

  uint64_t v3 = [CAFGroupDisableNotificationRequest alloc];
  uint64_t v4 = [*(id *)(a1 + 32) car];
  uint64_t v5 = [(CAFGroupRequest *)v3 initWithCar:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [*(id *)(a1 + 32) characteristicsWithLargePayload];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CAFGroupRequest *)v5 addCharacteristic:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_48;
  v11[3] = &unk_265263230;
  v11[4] = *(void *)(a1 + 32);
  [(CAFGroupRequest *)v5 performWithCompletion:v11];
}

void __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_48(uint64_t a1)
{
  id v2 = CAFServiceLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_48_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CAFServiceLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CAFService registerObserver:]();
  }

  uint64_t v6 = [(CAFService *)self observers];
  char v7 = [v6 hasObservers];

  uint64_t v8 = [(CAFService *)self observers];
  [v8 registerObserver:v4];

  uint64_t v9 = [(CAFService *)self cachedDescription];
  [v9 setNeedsRefreshDescription];

  if ((v7 & 1) == 0) {
    [(CAFService *)self registerAllRawDataIfNeeded];
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAFService *)self observers];
  [v5 unregisterObserver:v4];

  uint64_t v6 = [(CAFService *)self cachedDescription];
  [v6 setNeedsRefreshDescription];

  char v7 = CAFServiceLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CAFService unregisterObserver:]();
  }

  uint64_t v8 = [(CAFService *)self observers];
  char v9 = [v8 hasObservers];

  if ((v9 & 1) == 0) {
    [(CAFService *)self unregisterAllRawDataIfNeeded];
  }
}

- (NSString)description
{
  id v2 = [(CAFService *)self cachedDescription];
  uint64_t v3 = [v2 description];

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

+ (id)serviceType
{
  uint64_t v3 = +[CAFServiceTypes serviceNameByType];
  id v4 = [a1 serviceIdentifier];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

- (id)indexBy
{
  id v2 = objc_opt_class();
  return (id)[v2 indexBy];
}

- (void)_updateReceivedValuesWithCharacteristic:(id)a3
{
  id v6 = a3;
  if ([v6 isCurrent])
  {
    id v4 = [(CAFService *)self valueMonitor];
    uint64_t v5 = [v6 uniqueIdentifier];
    -[CAFService setReceivedAllValues:](self, "setReceivedAllValues:", [v4 valueReceivedFor:v5]);
  }
}

- (id)pluginID
{
  id v2 = [(CAFService *)self accessory];
  uint64_t v3 = [v2 pluginID];

  return v3;
}

+ (id)serviceIdentifier
{
  return &stru_26FD46EB0;
}

+ (id)observerProtocol
{
  return &unk_26FD96388;
}

+ (id)indexBy
{
  return 0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = CAFServiceLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CAFService _characteristicDidUpdate:fromGroupUpdate:]();
  }

  uint64_t v8 = [(CAFService *)self accessory];
  [v8 _serviceDidUpdate:self characteristic:v6];

  char v9 = [(CAFService *)self observers];
  [v9 serviceDidUpdate:self characteristic:v6 fromGroupUpdate:v4];

  [(CAFService *)self _updateReceivedValuesWithCharacteristic:v6];
}

- (void)_didUpdateValuesForGroupedCharacteristics:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) setCachedValueIfAvailableForGroupUpdate:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  char v9 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CAFService__didUpdateValuesForGroupedCharacteristics___block_invoke;
  block[3] = &unk_265263258;
  block[4] = self;
  dispatch_barrier_async(v9, block);
}

void __56__CAFService__didUpdateValuesForGroupedCharacteristics___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 serviceDidFinishGroupUpdate:*(void *)(a1 + 32)];
}

- (void)_controlDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CAFServiceLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CAFService _controlDidUpdate:]();
  }

  uint64_t v6 = [(CAFService *)self accessory];
  [v6 _serviceDidUpdate:self control:v4];

  uint64_t v7 = [(CAFService *)self observers];
  [v7 serviceDidUpdate:self control:v4];
}

- (void)invalidate
{
}

- (BOOL)usable
{
  uint64_t v3 = [(CAFService *)self characteristics];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(CAFService *)self controls];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (Class)baseCAFClass
{
  return (Class)objc_opt_class();
}

- (NSArray)comparisonKeys
{
  return (NSArray *)&unk_26FD908D0;
}

- (id)currentDescriptionForCache:(id)a3
{
  BOOL v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CAFService *)self name];
  uint64_t v7 = [(CAFService *)self pluginID];
  uint64_t v8 = [(CAFService *)self instanceID];
  char v9 = [(CAFService *)self serviceType];
  uint64_t v10 = [(CAFService *)self accessory];
  long long v11 = [(CAFService *)self accessory];
  long long v12 = [v11 instanceID];
  BOOL v13 = [(CAFService *)self receivedAllValues];
  long long v14 = @"NO";
  if (v13) {
    long long v14 = @"YES";
  }
  long long v15 = [v4 stringWithFormat:@"<%@: %p %@ %@ %@ type=%@ accessory=(%p)%@ recievedAllValues=%@>", v5, self, v6, v7, v8, v9, v10, v12, v14];

  return v15;
}

- (unint64_t)state
{
  if ([(CAFService *)self receivedAllValues]) {
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

- (CAFAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (CAFAccessory *)WeakRetained;
}

- (NSDictionary)characteristics
{
  return self->_characteristics;
}

- (BOOL)receivedAllValues
{
  return self->_receivedAllValues;
}

- (NSDictionary)controls
{
  return self->_controls;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setTypeName:(id)a3
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

- (NSDictionary)characteristicsByType
{
  return self->_characteristicsByType;
}

- (NSArray)characteristicsWithLargePayload
{
  return self->_characteristicsWithLargePayload;
}

- (NSDictionary)controlsByType
{
  return self->_controlsByType;
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
  objc_storeStrong((id *)&self->_controlsByType, 0);
  objc_storeStrong((id *)&self->_characteristicsWithLargePayload, 0);
  objc_storeStrong((id *)&self->_characteristicsByType, 0);
  objc_storeStrong((id *)&self->_valueMonitor, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong(&self->_observableCache, 0);
}

- (void)initWithAccessory:(void *)a1 config:.cold.1(void *a1)
{
  id v2 = [a1 pluginID];
  char v9 = [a1 instanceID];
  OUTLINED_FUNCTION_1(&dword_249710000, v3, v4, "Parsing service config from pluginID: %@ accessory instanceID: %@ failed for instanceID", v5, v6, v7, v8, 2u);
}

- (void)initWithAccessory:(void *)a1 config:.cold.2(void *a1)
{
  v1 = [a1 pluginID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_249710000, v2, v3, "Parsing service config from pluginID: %@ instanceID: %@ failed for serviceType", v4, v5, v6, v7, v8);
}

- (void)initWithAccessory:(uint64_t)a3 config:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__CAFService_initWithAccessory_config___block_invoke_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_7(a1) pluginID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_249710000, v2, v3, "Parsing accessory config from pluginID: %@ instanceID: %@ failed for characteristic", v4, v5, v6, v7, v8);
}

void __39__CAFService_initWithAccessory_config___block_invoke_cold_2(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_7(a1) pluginID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_249710000, v2, v3, "Creating characteristic from pluginID: %@ instanceID: %@ failed", v4, v5, v6, v7, v8);
}

void __39__CAFService_initWithAccessory_config___block_invoke_32_cold_1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_7(a1) pluginID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_249710000, v2, v3, "Parsing accessory config from pluginID: %@ instanceID: %@ failed for control", v4, v5, v6, v7, v8);
}

void __39__CAFService_initWithAccessory_config___block_invoke_32_cold_2(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_7(a1) pluginID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_249710000, v2, v3, "Creating control from pluginID: %@ instanceID: %@ failed", v4, v5, v6, v7, v8);
}

- (void)setReceivedAllValues:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_249710000, log, OS_LOG_TYPE_FAULT, "receivedAllValues should not go back to NO", v1, 2u);
}

void __40__CAFService_registerAllRawDataIfNeeded__block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) characteristicsWithLargePayload];
  [v1 count];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%@ register large payloads count=%lu", v4, v5, v6, v7, v8);
}

void __40__CAFService_registerAllRawDataIfNeeded__block_invoke_45_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) characteristicsWithLargePayload];
  [v1 count];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%@ unregister large payloads count=%lu", v4, v5, v6, v7, v8);
}

void __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_48_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerObserver:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_249710000, v0, v1, "%@ adding observer %@");
}

- (void)unregisterObserver:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_249710000, v0, v1, "%@ removed observer %@");
}

- (void)_characteristicDidUpdate:fromGroupUpdate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_249710000, v0, v1, "%{public}@ characteristic=%{public}@");
}

- (void)_controlDidUpdate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_249710000, v0, v1, "%{public}@ control=%{public}@ updated");
}

@end
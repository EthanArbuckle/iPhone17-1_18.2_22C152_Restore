@interface CAFAccessory
+ (CAFAccessory)accessoryWithCar:(id)a3 pluginID:(id)a4 config:(id)a5;
+ (id)_sharedServiceGroupInitQueue;
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (id)registeredAccessoryClasses;
+ (void)load;
+ (void)registerAccessoryClass:(Class)a3;
- (BOOL)receivedAllValues;
- (BOOL)usable;
- (CAFAccessory)initWithCar:(id)a3 pluginID:(id)a4 config:(id)a5;
- (CAFCachedDescription)cachedDescription;
- (CAFCar)car;
- (CAFValueMonitor)valueMonitor;
- (CARObserverHashTable)observers;
- (Class)baseCAFClass;
- (NSArray)allCharacteristics;
- (NSArray)allControls;
- (NSArray)allServices;
- (NSArray)comparisonKeys;
- (NSArray)sortedServices;
- (NSDictionary)services;
- (NSDictionary)servicesByType;
- (NSDictionary)servicesIndexBy;
- (NSNumber)instanceID;
- (NSNumber)pluginID;
- (NSString)categoryType;
- (NSString)description;
- (NSString)typeName;
- (NSString)version;
- (NSUUID)uniqueIdentifier;
- (id)currentDescriptionForCache:(id)a3;
- (id)servicesForIndexBy:(id)a3;
- (id)servicesForType:(id)a3;
- (int64_t)compare:(id)a3;
- (os_unfair_lock_s)indexLock;
- (unint64_t)state;
- (void)_serviceDidUpdate:(id)a3 characteristic:(id)a4;
- (void)_serviceDidUpdate:(id)a3 control:(id)a4;
- (void)_serviceReceivedAllValues:(id)a3;
- (void)invalidate;
- (void)refreshCharacteristics;
- (void)registerObserver:(id)a3;
- (void)setCachedDescription:(id)a3;
- (void)setIndexLock:(os_unfair_lock_s)a3;
- (void)setObservers:(id)a3;
- (void)setReceivedAllValues:(BOOL)a3;
- (void)setTypeName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setValueMonitor:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFAccessory

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[CAFAccessory registerAccessoryClass:v3];
  }
}

+ (void)registerAccessoryClass:(Class)a3
{
  if (registerAccessoryClass__onceToken != -1) {
    dispatch_once(&registerAccessoryClass__onceToken, &__block_literal_global_11);
  }
  id obj = (id)_registeredAccessoryClasses;
  objc_sync_enter(obj);
  v4 = (void *)_registeredAccessoryClasses;
  v5 = [(objc_class *)a3 accessoryIdentifier];
  [v4 setObject:a3 forKeyedSubscript:v5];

  objc_sync_exit(obj);
}

uint64_t __39__CAFAccessory_registerAccessoryClass___block_invoke()
{
  _registeredAccessoryClasses = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)registeredAccessoryClasses
{
  id v2 = (id)_registeredAccessoryClasses;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(id)_registeredAccessoryClasses copy];
  objc_sync_exit(v2);

  return v3;
}

+ (CAFAccessory)accessoryWithCar:(id)a3 pluginID:(id)a4 config:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[CAFCarConfiguration getType:v7];
  v11 = +[CAFAccessory registeredAccessoryClasses];
  v12 = (objc_class *)[v11 objectForKeyedSubscript:v10];

  if (!v12) {
    v12 = (objc_class *)objc_opt_class();
  }
  v13 = (void *)[[v12 alloc] initWithCar:v9 pluginID:v8 config:v7];

  return (CAFAccessory *)v13;
}

+ (id)_sharedServiceGroupInitQueue
{
  if (_sharedServiceGroupInitQueue_onceToken != -1) {
    dispatch_once(&_sharedServiceGroupInitQueue_onceToken, &__block_literal_global_24);
  }
  id v2 = (void *)_sharedServiceGroupInitQueue__sharedServiceGroupInitQueue;
  return v2;
}

void __44__CAFAccessory__sharedServiceGroupInitQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.CarAccessoryFramework.Accessory.ServiceGroupInit", v2);
  v1 = (void *)_sharedServiceGroupInitQueue__sharedServiceGroupInitQueue;
  _sharedServiceGroupInitQueue__sharedServiceGroupInitQueue = (uint64_t)v0;
}

- (CAFAccessory)initWithCar:(id)a3 pluginID:(id)a4 config:(id)a5
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v90.receiver = self;
  v90.super_class = (Class)CAFAccessory;
  v11 = [(CAFAccessory *)&v90 init];
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_indexLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_car, v8);
    v13 = (uint64_t *)(v12 + 40);
    objc_storeStrong((id *)(v12 + 40), a4);
    objc_opt_class();
    id v14 = [v10 objectForKeyedSubscript:@"iid"];
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = *(void **)(v12 + 48);
    *(void *)(v12 + 48) = v15;

    if (*(void *)(v12 + 48))
    {
      uint64_t v17 = +[CAFCarConfiguration getType:v10];
      v18 = *(void **)(v12 + 56);
      *(void *)(v12 + 56) = v17;

      if (*(void *)(v12 + 56))
      {
        uint64_t v19 = +[CAFCarConfiguration getUUID:*(void *)(v12 + 40) instanceID:*(void *)(v12 + 48)];
        v20 = *(void **)(v12 + 64);
        *(void *)(v12 + 64) = v19;

        uint64_t v21 = +[CAFAccessoryTypes accessoryNameForType:*(void *)(v12 + 56)];
        v22 = *(void **)(v12 + 72);
        *(void *)(v12 + 72) = v21;

        objc_opt_class();
        id v23 = [v10 objectForKeyedSubscript:@"version"];
        if (v23 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v24 = v23;
        }
        else {
          id v24 = 0;
        }

        v26 = *(void **)(v12 + 24);
        *(void *)(v12 + 24) = v24;

        id v27 = objc_alloc(MEMORY[0x263F30E18]);
        v28 = [(id)objc_opt_class() observerProtocol];
        uint64_t v29 = [v27 initWithProtocol:v28];
        v30 = *(void **)(v12 + 136);
        *(void *)(v12 + 136) = v29;

        v31 = [[CAFCachedDescription alloc] initWithCacheable:v12];
        v32 = *(void **)(v12 + 80);
        *(void *)(v12 + 80) = v31;

        v33 = [[CAFValueMonitor alloc] initWithDelegate:v12];
        v34 = *(void **)(v12 + 88);
        *(void *)(v12 + 88) = v33;

        v35 = objc_opt_new();
        v36 = objc_opt_new();
        v76 = objc_opt_new();
        objc_opt_class();
        id v37 = [v10 objectForKeyedSubscript:@"services"];
        if (v37 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v38 = v37;
        }
        else {
          id v38 = 0;
        }
        id v74 = v9;
        id v75 = v8;

        if (v38)
        {
          v85[0] = MEMORY[0x263EF8330];
          v85[1] = 3221225472;
          v85[2] = __44__CAFAccessory_initWithCar_pluginID_config___block_invoke;
          v85[3] = &unk_265263208;
          id v86 = (id)v12;
          id v87 = v35;
          id v88 = v36;
          id v89 = v76;
          [v38 enumerateObjectsUsingBlock:v85];
        }
        v70 = v38;
        id obj = v36;
        id v73 = v10;
        os_unfair_lock_lock((os_unfair_lock_t)(v12 + 12));
        objc_storeStrong((id *)(v12 + 32), v35);
        v72 = v35;
        uint64_t v39 = [v35 allValues];
        v40 = *(void **)(v12 + 96);
        *(void *)(v12 + 96) = v39;

        v41 = objc_opt_new();
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v42 = *(id *)(v12 + 96);
        uint64_t v43 = [v42 countByEnumeratingWithState:&v81 objects:v92 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v82 != v45) {
                objc_enumerationMutation(v42);
              }
              v47 = [*(id *)(*((void *)&v81 + 1) + 8 * i) characteristics];
              v48 = [v47 allValues];
              [v41 addObjectsFromArray:v48];
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v81 objects:v92 count:16];
          }
          while (v44);
        }

        objc_storeStrong((id *)(v12 + 104), v41);
        v49 = objc_opt_new();
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v50 = *(id *)(v12 + 96);
        uint64_t v51 = [v50 countByEnumeratingWithState:&v77 objects:v91 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v78;
          do
          {
            for (uint64_t j = 0; j != v52; ++j)
            {
              if (*(void *)v78 != v53) {
                objc_enumerationMutation(v50);
              }
              v55 = [*(id *)(*((void *)&v77 + 1) + 8 * j) controls];
              v56 = [v55 allValues];
              [v49 addObjectsFromArray:v56];
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v77 objects:v91 count:16];
          }
          while (v52);
        }

        objc_storeStrong((id *)(v12 + 112), v49);
        objc_storeStrong((id *)(v12 + 120), obj);
        v57 = *(void **)(v12 + 128);
        *(void *)(v12 + 128) = v76;
        id v58 = v76;

        os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 12));
        v59 = [(id)v12 cachedDescription];
        [v59 setNeedsRefreshDescription];

        v60 = CAFAccessoryLogging();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          -[CAFService initWithAccessory:config:](v12, v60, v61, v62, v63, v64, v65, v66);
        }

        [*(id *)(v12 + 88) signalReadyToMonitor];
        uint64_t v67 = [*(id *)(v12 + 88) receivedAllValues];

        [(id)v12 setReceivedAllValues:v67];
        id v9 = v74;
        id v8 = v75;
        id v10 = v73;
        goto LABEL_37;
      }
      v25 = CAFAccessoryLogging();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[CAFAccessory initWithCar:pluginID:config:](v13, (uint64_t *)(v12 + 48), v25);
      }
    }
    else
    {
      v25 = CAFAccessoryLogging();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[CAFAccessory initWithCar:pluginID:config:](v13, v25);
      }
    }

    v68 = 0;
    goto LABEL_41;
  }
LABEL_37:
  v68 = (CAFAccessory *)(id)v12;
LABEL_41:

  return v68;
}

void __44__CAFAccessory_initWithCar_pluginID_config___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (!v4 || (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = CAFAccessoryLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __44__CAFAccessory_initWithCar_pluginID_config___block_invoke_cold_1(a1);
    }
    id v10 = 0;
    goto LABEL_17;
  }
  v5 = (id *)(a1 + 32);
  v6 = [*(id *)(a1 + 32) car];
  id v7 = [v6 carManager];
  id v8 = [*(id *)(a1 + 32) categoryType];
  int v9 = [v7 shouldAllocAccessoryType:v8 serviceConfig:v4];

  id v10 = v4;
  if (v9)
  {
    v11 = +[CAFService serviceWithAccessory:*v5 config:v4];
    if (v11)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
      uint64_t v12 = *(void **)(a1 + 40);
      v13 = [v11 uniqueIdentifier];
      [v12 setObject:v11 forKeyedSubscript:v13];

      if (([v11 receivedAllValues] & 1) == 0)
      {
        id v14 = [*v5 valueMonitor];
        id v15 = [v11 uniqueIdentifier];
        [v14 monitorForValue:v15];
      }
      v16 = *(void **)(a1 + 48);
      uint64_t v17 = [v11 serviceType];
      v18 = [v16 objectForKeyedSubscript:v17];

      if (!v18)
      {
        v18 = objc_opt_new();
        uint64_t v19 = *(void **)(a1 + 48);
        v20 = [v11 serviceType];
        [v19 setObject:v18 forKeyedSubscript:v20];
      }
      [v18 addObject:v11];
      uint64_t v21 = [v11 indexBy];

      if (v21)
      {
        v22 = *(void **)(a1 + 56);
        id v23 = [v11 serviceType];
        id v24 = [v22 objectForKeyedSubscript:v23];

        if (!v24)
        {
          id v24 = objc_opt_new();
          v25 = *(void **)(a1 + 56);
          v26 = [v11 serviceType];
          [v25 setObject:v24 forKeyedSubscript:v26];
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)*v5 + 3);
    }
    else
    {
      id v27 = CAFAccessoryLogging();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __44__CAFAccessory_initWithCar_pluginID_config___block_invoke_cold_2(v5);
      }
    }
    id v10 = v4;
LABEL_17:
  }
}

- (NSArray)sortedServices
{
  id v2 = [(CAFAccessory *)self services];
  id v3 = [v2 allValues];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v4;
}

- (void)setReceivedAllValues:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_receivedAllValues != a3)
  {
    BOOL v3 = a3;
    v5 = CAFAccessoryLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v10 = @"YES";
      if (self->_receivedAllValues) {
        v11 = @"YES";
      }
      else {
        v11 = @"NO";
      }
      int v12 = 138543874;
      v13 = self;
      if (!v3) {
        id v10 = @"NO";
      }
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_debug_impl(&dword_249710000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ receivedAllValues transitioning from %@ to %@", (uint8_t *)&v12, 0x20u);
    }

    if (v3)
    {
      self->_receivedAllValues = v3;
      v6 = [(CAFAccessory *)self cachedDescription];
      [v6 setNeedsRefreshDescription];

      id v7 = CARSignpostLogForCategory();
      if (os_signpost_enabled(v7))
      {
        int v12 = 138412290;
        v13 = self;
        _os_signpost_emit_with_name_impl(&dword_249710000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedAllValues", "%@", (uint8_t *)&v12, 0xCu);
      }

      id v8 = [(CAFAccessory *)self car];
      [v8 _accessoryReceivedAllValues:self];

      int v9 = [(CAFAccessory *)self observers];
      [v9 accessoryDidUpdate:self receivedAllValues:1];
    }
    else
    {
      int v9 = CAFGeneralLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[CAFService setReceivedAllValues:](v9);
      }
    }
  }
}

- (id)servicesForType:(id)a3
{
  id v4 = a3;
  v5 = [(CAFAccessory *)self servicesByType];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)servicesForIndexBy:(id)a3
{
  p_indexLock = &self->_indexLock;
  id v5 = a3;
  os_unfair_lock_lock(p_indexLock);
  v6 = [(CAFAccessory *)self servicesIndexBy];
  id v7 = [v6 objectForKeyedSubscript:v5];

  id v8 = (void *)[v7 copy];
  os_unfair_lock_unlock(p_indexLock);
  return v8;
}

- (void)refreshCharacteristics
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = CAFAccessoryLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(CAFService *)(uint64_t)self refreshCharacteristics];
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [(CAFAccessory *)self services];
  v11 = [v10 allValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v15++) refreshCharacteristics];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFAccessory *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFAccessory *)self observers];
  [v5 unregisterObserver:v4];
}

- (NSString)description
{
  id v2 = [(CAFAccessory *)self cachedDescription];
  BOOL v3 = [v2 description];

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

- (void)_serviceReceivedAllValues:(id)a3
{
  id v4 = a3;
  id v6 = [(CAFAccessory *)self valueMonitor];
  id v5 = [v4 uniqueIdentifier];

  -[CAFAccessory setReceivedAllValues:](self, "setReceivedAllValues:", [v6 valueReceivedFor:v5]);
}

+ (id)accessoryIdentifier
{
  return &stru_26FD46EB0;
}

+ (id)observerProtocol
{
  return &unk_26FDA8670;
}

- (void)_serviceDidUpdate:(id)a3 characteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 indexBy];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = [v7 characteristicType];
    v11 = [v6 indexBy];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      os_unfair_lock_lock(&self->_indexLock);
      uint64_t v13 = [(CAFAccessory *)self servicesIndexBy];
      uint64_t v14 = [v6 serviceType];
      uint64_t v15 = [v13 objectForKeyedSubscript:v14];

      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__1;
      v32 = __Block_byref_object_dispose__1;
      id v33 = 0;
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      id v24 = __49__CAFAccessory__serviceDidUpdate_characteristic___block_invoke;
      v25 = &unk_265264468;
      id v16 = v6;
      id v26 = v16;
      id v27 = &v28;
      [v15 enumerateKeysAndObjectsUsingBlock:&v22];
      if (v29[5]) {
        objc_msgSend(v15, "removeObjectForKey:", v22, v23, v24, v25);
      }
      long long v17 = objc_msgSend(v16, "indexBy", v22, v23, v24, v25);
      long long v18 = [v16 characteristicForType:v17];
      long long v19 = [v18 value];

      if (v19) {
        [v15 setObject:v16 forKeyedSubscript:v19];
      }
      os_unfair_lock_unlock(&self->_indexLock);

      _Block_object_dispose(&v28, 8);
    }
  }
  v20 = [(CAFAccessory *)self car];
  [v20 _accessoryDidUpdate:self service:v6 characteristic:v7];

  uint64_t v21 = [(CAFAccessory *)self observers];
  [v21 accessoryDidUpdate:self service:v6 characteristic:v7];
}

void __49__CAFAccessory__serviceDidUpdate_characteristic___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a3;
  id v10 = [v8 uniqueIdentifier];
  v11 = [v9 uniqueIdentifier];

  LODWORD(v9) = [v10 isEqual:v11];
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_serviceDidUpdate:(id)a3 control:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CAFAccessory *)self car];
  [v8 _accessoryDidUpdate:self service:v7 control:v6];

  id v9 = [(CAFAccessory *)self observers];
  [v9 accessoryDidUpdate:self service:v7 control:v6];
}

- (BOOL)usable
{
  id v2 = [(CAFAccessory *)self services];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (Class)baseCAFClass
{
  return (Class)objc_opt_class();
}

- (NSArray)comparisonKeys
{
  return (NSArray *)&unk_26FD909A8;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = CAFGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(CAFService *)(uint64_t)self invalidate];
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = [(CAFAccessory *)self allServices];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) invalidate];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (id)currentDescriptionForCache:(id)a3
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CAFAccessory *)self name];
  uint64_t v7 = [(CAFAccessory *)self pluginID];
  uint64_t v8 = [(CAFAccessory *)self instanceID];
  uint64_t v9 = [(CAFAccessory *)self categoryType];
  id v10 = [(CAFAccessory *)self version];
  BOOL v11 = [(CAFAccessory *)self receivedAllValues];
  uint64_t v12 = @"NO";
  if (v11) {
    uint64_t v12 = @"YES";
  }
  uint64_t v13 = [v4 stringWithFormat:@"<%@: %p %@ %@ %@ type=%@ version=%@ recievedAllValues=%@>", v5, self, v6, v7, v8, v9, v10, v12];

  return v13;
}

- (unint64_t)state
{
  if ([(CAFAccessory *)self receivedAllValues]) {
    return 3;
  }
  else {
    return 6;
  }
}

- (CAFCar)car
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_car);
  return (CAFCar *)WeakRetained;
}

- (NSString)version
{
  return self->_version;
}

- (NSDictionary)services
{
  return self->_services;
}

- (BOOL)receivedAllValues
{
  return self->_receivedAllValues;
}

- (NSNumber)pluginID
{
  return self->_pluginID;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSString)categoryType
{
  return self->_categoryType;
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

- (NSArray)allServices
{
  return self->_allServices;
}

- (NSArray)allCharacteristics
{
  return self->_allCharacteristics;
}

- (NSArray)allControls
{
  return self->_allControls;
}

- (NSDictionary)servicesByType
{
  return self->_servicesByType;
}

- (NSDictionary)servicesIndexBy
{
  return self->_servicesIndexBy;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (os_unfair_lock_s)indexLock
{
  return self->_indexLock;
}

- (void)setIndexLock:(os_unfair_lock_s)a3
{
  self->_indexLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_servicesIndexBy, 0);
  objc_storeStrong((id *)&self->_servicesByType, 0);
  objc_storeStrong((id *)&self->_allControls, 0);
  objc_storeStrong((id *)&self->_allCharacteristics, 0);
  objc_storeStrong((id *)&self->_allServices, 0);
  objc_storeStrong((id *)&self->_valueMonitor, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_pluginID, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_destroyWeak((id *)&self->_car);
}

- (void)initWithCar:(uint64_t *)a1 pluginID:(NSObject *)a2 config:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_249710000, a2, OS_LOG_TYPE_ERROR, "Parsing accessory config from pluginID: %@ failed for instanceID", (uint8_t *)&v3, 0xCu);
}

- (void)initWithCar:(uint64_t *)a1 pluginID:(uint64_t *)a2 config:(os_log_t)log .cold.2(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "Parsing accessory config from pluginID: %@ instanceID: %@ failed for categoryType", (uint8_t *)&v5, 0x16u);
}

void __44__CAFAccessory_initWithCar_pluginID_config___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pluginID];
  uint64_t v3 = [*(id *)(a1 + 32) instanceID];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_249710000, v4, v5, "Parsing accessory config from pluginID: %@ instanceID: %@ failed for service", v6, v7, v8, v9, v10);
}

void __44__CAFAccessory_initWithCar_pluginID_config___block_invoke_cold_2(id *a1)
{
  uint64_t v2 = [*a1 pluginID];
  uint64_t v3 = [*a1 instanceID];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_249710000, v4, v5, "Creating service from pluginID: %@ instanceID: %@ failed", v6, v7, v8, v9, v10);
}

@end
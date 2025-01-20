@interface CAFPositionManager
- (BOOL)_isVehicleLayoutKeyCharacteristic:(id)a3;
- (BOOL)accessoryIsTracked:(id)a3;
- (CAFCar)car;
- (CAFPositionManager)initWithCar:(id)a3;
- (CARObserverHashTable)observers;
- (NSArray)positionedServices;
- (NSArray)vehicleLayoutKeys;
- (NSDictionary)servicesForVehicleLayoutKey;
- (NSDictionary)vehicleLayoutKeysForServiceType;
- (NSSet)positionedAccessories;
- (OS_dispatch_queue)workQueue;
- (id)_positionedServices;
- (id)servicesFor:(Class)a3 row:(unint64_t)a4 column:(unint64_t)a5;
- (id)servicesForVehicleLayoutKey:(id)a3;
- (id)vehicleLayoutKeysFor:(Class)a3;
- (unint64_t)_queue_currentState;
- (unint64_t)_queue_positionServicesState;
- (unint64_t)_stateForPositionedServices:(id)a3;
- (unint64_t)state;
- (void)_queue_buildTrackingCache;
- (void)_rebuildCacheIfNeededforReason:(id)a3;
- (void)carDidUpdateAccessories:(id)a3;
- (void)registerObserver:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)setObservers:(id)a3;
- (void)setPositionedAccessories:(id)a3;
- (void)setPositionedServices:(id)a3;
- (void)setServicesForVehicleLayoutKey:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setVehicleLayoutKeysForServiceType:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFPositionManager

- (CAFPositionManager)initWithCar:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAFPositionManager;
  v5 = [(CAFPositionManager *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_car, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.CarAccessoryFramework.PositionManager", v8);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26FDAF520];
    observers = v6->_observers;
    v6->_observers = (CARObserverHashTable *)v11;

    uint64_t v13 = objc_opt_new();
    servicesForVehicleLayoutKey = v6->_servicesForVehicleLayoutKey;
    v6->_servicesForVehicleLayoutKey = (NSDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    vehicleLayoutKeysForServiceType = v6->_vehicleLayoutKeysForServiceType;
    v6->_vehicleLayoutKeysForServiceType = (NSDictionary *)v15;

    [(CAFPositionManager *)v6 setState:6];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_car);
    [WeakRetained registerObserver:v6];
  }
  return v6;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_state != a3)
  {
    v5 = CAFPositionManagerLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = NSStringFromCharacteristicState(self->_state);
      v8 = NSStringFromCharacteristicState(a3);
      int v9 = 138543874;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v7;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_249710000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ transitioning state from %@ to %@", (uint8_t *)&v9, 0x20u);
    }
    self->_state = a3;
    v6 = [(CAFPositionManager *)self observers];
    [v6 positionManager:self didUpdateState:self->_state];
  }
}

- (unint64_t)_queue_currentState
{
  v3 = [(CAFPositionManager *)self car];
  int v4 = [v3 isConfigured];

  if (!v4) {
    return 6;
  }
  return [(CAFPositionManager *)self _queue_positionServicesState];
}

- (unint64_t)_queue_positionServicesState
{
  v3 = [(CAFPositionManager *)self positionedServices];
  unint64_t v4 = [(CAFPositionManager *)self _stateForPositionedServices:v3];

  return v4;
}

- (unint64_t)_stateForPositionedServices:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          __int16 v11 = [v10 vehicleLayoutKeyCharacteristic];

          if (v11)
          {
            v12 = [v10 vehicleLayoutKeyCharacteristic];
            unint64_t v13 = [v12 state];

            if (v13 <= 6 && ((1 << v13) & 0x71) != 0)
            {
              v16 = CAFPositionManagerLogging();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
                [(CAFPositionManager *)(uint64_t)self _stateForPositionedServices:v16];
              }

              unint64_t v15 = 6;
              goto LABEL_21;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        unint64_t v15 = 3;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v15 = 3;
    }
LABEL_21:
  }
  else
  {
    unint64_t v15 = 6;
  }

  return v15;
}

- (NSArray)vehicleLayoutKeys
{
  v2 = [(CAFPositionManager *)self servicesForVehicleLayoutKey];
  v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)servicesForVehicleLayoutKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFPositionManager *)self servicesForVehicleLayoutKey];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)vehicleLayoutKeysFor:(Class)a3
{
  int v5 = [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  id v6 = (id)MEMORY[0x263EFFA68];
  if (v5)
  {
    uint64_t v7 = [(objc_class *)a3 serviceIdentifier];
    uint64_t v8 = [(CAFPositionManager *)self vehicleLayoutKeysForServiceType];
    int v9 = [v8 objectForKeyedSubscript:v7];
    uint64_t v10 = [v9 allObjects];
    __int16 v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v6;
    }
    id v6 = v12;
  }
  return v6;
}

- (BOOL)accessoryIsTracked:(id)a3
{
  id v4 = a3;
  int v5 = [(CAFPositionManager *)self positionedAccessories];
  id v6 = [v4 uniqueIdentifier];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFPositionManager *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFPositionManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (id)_positionedServices
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [(CAFPositionManager *)self car];
  id v5 = [v4 accessories];
  id v6 = [v5 allValues];

  obuint64_t j = v6;
  uint64_t v19 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        int v9 = [v8 services];
        uint64_t v10 = [v9 allValues];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(id *)(*((void *)&v20 + 1) + 8 * j);
              if ([v15 conformsToProtocol:&unk_26FD98038])
              {
                if (!v15) {
                  continue;
                }
                [v15 registerObserver:self];
                [v3 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v12);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  return v3;
}

- (void)_rebuildCacheIfNeededforReason:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFPositionManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__CAFPositionManager__rebuildCacheIfNeededforReason___block_invoke;
  v7[3] = &unk_265263280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__CAFPositionManager__rebuildCacheIfNeededforReason___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) _positionedServices];
  uint64_t v4 = [*v2 _stateForPositionedServices:v3];
  id v5 = CAFPositionManagerLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [v10 positionedServices];
    uint64_t v13 = [v12 count];
    uint64_t v14 = [v3 count];
    *(_DWORD *)v16 = 138413570;
    id v15 = @"NO";
    *(void *)&v16[4] = v10;
    *(_WORD *)&v16[12] = 2080;
    *(void *)&v16[14] = "-[CAFPositionManager _rebuildCacheIfNeededforReason:]_block_invoke";
    *(_WORD *)&v16[22] = 2112;
    if (v4 == 3) {
      id v15 = @"YES";
    }
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    long long v23 = v15;
    _os_log_debug_impl(&dword_249710000, v5, OS_LOG_TYPE_DEBUG, "%@ %s (%@) %lu services already tracked. Considering tracking %lu. readyToBuildCache=%@", v16, 0x3Eu);
  }
  if (v4 == 3)
  {
    [*v2 setPositionedServices:v3];
    objc_msgSend(*v2, "_queue_buildTrackingCache");
    id v6 = CAFPositionManagerLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __53__CAFPositionManager__rebuildCacheIfNeededforReason___block_invoke_cold_1(v2, v6);
    }

    uint64_t v7 = [*v2 car];
    int v8 = [v7 isConfigured];

    if (v8) {
      [*v2 setState:3];
    }
    int v9 = objc_msgSend(*v2, "observers", *(_OWORD *)v16, *(void *)&v16[16]);
    [v9 positionManagerDidUpdateTracking:*v2];
  }
}

- (void)_queue_buildTrackingCache
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v26 = self;
  id v6 = [(CAFPositionManager *)self positionedServices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v11 vehicleLayoutKey];

        if (v12)
        {
          uint64_t v13 = [v11 accessory];
          uint64_t v14 = [v13 uniqueIdentifier];
          [v5 addObject:v14];

          id v15 = [v11 vehicleLayoutKey];
          v16 = [v3 objectForKeyedSubscript:v15];

          if (!v16)
          {
            uint64_t v17 = objc_opt_new();
            __int16 v18 = [v11 vehicleLayoutKey];
            [v3 setObject:v17 forKeyedSubscript:v18];
          }
          uint64_t v19 = [v11 vehicleLayoutKey];
          __int16 v20 = [v3 objectForKeyedSubscript:v19];
          [v20 addObject:v11];

          uint64_t v21 = [(id)objc_opt_class() serviceIdentifier];
          __int16 v22 = [v4 objectForKeyedSubscript:v21];

          if (!v22)
          {
            long long v23 = objc_opt_new();
            [v4 setObject:v23 forKeyedSubscript:v21];
          }
          uint64_t v24 = [v4 objectForKeyedSubscript:v21];
          long long v25 = [v11 vehicleLayoutKey];
          [v24 addObject:v25];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  [(CAFPositionManager *)v26 setPositionedAccessories:v5];
  [(CAFPositionManager *)v26 setServicesForVehicleLayoutKey:v3];
  [(CAFPositionManager *)v26 setVehicleLayoutKeysForServiceType:v4];
}

- (BOOL)_isVehicleLayoutKeyCharacteristic:(id)a3
{
  v3 = [a3 typeName];
  uint64_t v4 = +[CAFCharacteristicTypes characteristicNameByType];
  id v5 = [v4 objectForKeyedSubscript:@"0x0000000036000065"];
  char v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)carDidUpdateAccessories:(id)a3
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  if ([(CAFPositionManager *)self _isVehicleLayoutKeyCharacteristic:a4])
  {
    [(CAFPositionManager *)self _rebuildCacheIfNeededforReason:@"Service Update"];
  }
}

- (id)servicesFor:(Class)a3 row:(unint64_t)a4 column:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(CAFPositionManager *)self positionedServices];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([(id)objc_opt_class() isEqual:a3]) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (CAFCar)car
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_car);
  return (CAFCar *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSSet)positionedAccessories
{
  return self->_positionedAccessories;
}

- (void)setPositionedAccessories:(id)a3
{
}

- (NSArray)positionedServices
{
  return self->_positionedServices;
}

- (void)setPositionedServices:(id)a3
{
}

- (NSDictionary)servicesForVehicleLayoutKey
{
  return self->_servicesForVehicleLayoutKey;
}

- (void)setServicesForVehicleLayoutKey:(id)a3
{
}

- (NSDictionary)vehicleLayoutKeysForServiceType
{
  return self->_vehicleLayoutKeysForServiceType;
}

- (void)setVehicleLayoutKeysForServiceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleLayoutKeysForServiceType, 0);
  objc_storeStrong((id *)&self->_servicesForVehicleLayoutKey, 0);
  objc_storeStrong((id *)&self->_positionedServices, 0);
  objc_storeStrong((id *)&self->_positionedAccessories, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_car);
}

- (void)_stateForPositionedServices:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  char v6 = "-[CAFPositionManager _stateForPositionedServices:]";
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_249710000, log, OS_LOG_TYPE_DEBUG, "%{public}@ %s vehicleLayoutKey pending for %@", (uint8_t *)&v3, 0x20u);
}

void __53__CAFPositionManager__rebuildCacheIfNeededforReason___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = *a1;
  uint64_t v4 = [*a1 positionedServices];
  int v5 = 138412802;
  id v6 = v3;
  __int16 v7 = 2080;
  uint64_t v8 = "-[CAFPositionManager _rebuildCacheIfNeededforReason:]_block_invoke";
  __int16 v9 = 2048;
  uint64_t v10 = [v4 count];
  _os_log_debug_impl(&dword_249710000, a2, OS_LOG_TYPE_DEBUG, "%@ %s cache was rebuilt, now tracking %lu services.", (uint8_t *)&v5, 0x20u);
}

@end
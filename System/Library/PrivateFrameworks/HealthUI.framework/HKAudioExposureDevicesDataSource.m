@interface HKAudioExposureDevicesDataSource
- (BOOL)isReady;
- (HKAudioExposureDevicesDataSource)initWithDeviceType:(unint64_t)a3 healthStore:(id)a4;
- (HKHealthStore)healthStore;
- (HKObserverSet)observers;
- (HKQuery)query;
- (NSDictionary)devicesByName;
- (NSSet)devices;
- (id)_localizedNameForDevice:(id)a3;
- (id)_makeDeviceQueryForDeviceType;
- (id)_sampleTypeForDeviceType;
- (int64_t)deviceCount;
- (unint64_t)deviceType;
- (void)_cleanUp;
- (void)_notify_dataSourceIsReady;
- (void)addObserver:(id)a3;
- (void)cancelQuery;
- (void)removeObserver:(id)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setDevices:(id)a3;
- (void)setDevicesByName:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQuery:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)startQuery;
@end

@implementation HKAudioExposureDevicesDataSource

- (HKAudioExposureDevicesDataSource)initWithDeviceType:(unint64_t)a3 healthStore:(id)a4
{
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HKAudioExposureDevicesDataSource;
  v8 = [(HKAudioExposureDevicesDataSource *)&v21 init];
  v9 = v8;
  if (v8)
  {
    v8->_ready = 0;
    v8->_deviceType = a3;
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    devices = v9->_devices;
    v9->_devices = (NSSet *)v10;

    devicesByName = v9->_devicesByName;
    v9->_devicesByName = (NSDictionary *)MEMORY[0x1E4F1CC08];

    objc_storeStrong((id *)&v9->_healthStore, a4);
    id v13 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = HKLogInfrastructure();
    uint64_t v17 = [v13 initWithName:v15 loggingCategory:v16];
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v17;

    query = v9->_query;
    v9->_query = 0;
  }
  return v9;
}

- (int64_t)deviceCount
{
  v2 = [(HKAudioExposureDevicesDataSource *)self devices];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)startQuery
{
  [(HKAudioExposureDevicesDataSource *)self setReady:0];
  int64_t v3 = [(HKAudioExposureDevicesDataSource *)self _makeDeviceQueryForDeviceType];
  [(HKAudioExposureDevicesDataSource *)self setQuery:v3];

  id v5 = [(HKAudioExposureDevicesDataSource *)self healthStore];
  v4 = [(HKAudioExposureDevicesDataSource *)self query];
  [v5 executeQuery:v4];
}

- (void)cancelQuery
{
  [(HKAudioExposureDevicesDataSource *)self setReady:0];
  [(HKAudioExposureDevicesDataSource *)self _cleanUp];
}

- (void)_cleanUp
{
  int64_t v3 = [(HKAudioExposureDevicesDataSource *)self healthStore];
  v4 = [(HKAudioExposureDevicesDataSource *)self query];
  [v3 stopQuery:v4];

  [(HKAudioExposureDevicesDataSource *)self setQuery:0];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HKAudioExposureDevicesDataSource *)self observers];
  [v5 registerObserver:v4 queue:MEMORY[0x1E4F14428]];

  if ([(HKAudioExposureDevicesDataSource *)self isReady])
  {
    [(HKAudioExposureDevicesDataSource *)self _notify_dataSourceIsReady];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HKAudioExposureDevicesDataSource *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)_notify_dataSourceIsReady
{
  int64_t v3 = [(HKAudioExposureDevicesDataSource *)self observers];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__HKAudioExposureDevicesDataSource__notify_dataSourceIsReady__block_invoke;
  v4[3] = &unk_1E6D54578;
  v4[4] = self;
  [v3 notifyObservers:v4];
}

void __61__HKAudioExposureDevicesDataSource__notify_dataSourceIsReady__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 audioExposureDataSourceIsReady:*(void *)(a1 + 32)];
  }
}

- (id)_makeDeviceQueryForDeviceType
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke;
  aBlock[3] = &unk_1E6D545C8;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  id v4 = objc_alloc(MEMORY[0x1E4F2AF30]);
  id v5 = [(HKAudioExposureDevicesDataSource *)self _sampleTypeForDeviceType];
  v6 = (void *)[v4 initWithObjectType:v5 predicate:0 resultsHandler:v3];

  return v6;
}

void __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) _cleanUp];
  v23 = v8;
  v24 = v9;
  if (v9)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke_cold_1((uint64_t)v24, v10);
    }
  }
  else
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__14;
    v41 = __Block_byref_object_dispose__14;
    id v42 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__14;
    v35 = __Block_byref_object_dispose__14;
    id v36 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)v38[5];
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1E4E40740]();
          v16 = [*(id *)(a1 + 32) _localizedNameForDevice:v14];
          uint64_t v17 = [(id)v32[5] objectForKeyedSubscript:v16];
          v18 = v17;
          if (!v17)
          {
            uint64_t v17 = [MEMORY[0x1E4F1CAD0] set];
            id v4 = v17;
          }
          v19 = (void *)[v17 mutableCopy];
          if (!v18) {

          }
          [v19 addObject:v14];
          v20 = (void *)v32[5];
          objc_super v21 = (void *)[v19 copy];
          [v20 setValue:v21 forKey:v16];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v11);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke_282;
    block[3] = &unk_1E6D545A0;
    block[4] = *(void *)(a1 + 32);
    block[5] = &v37;
    block[6] = &v31;
    dispatch_async(MEMORY[0x1E4F14428], block);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
  }
}

uint64_t __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke_282(uint64_t a1)
{
  [*(id *)(a1 + 32) setDevices:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(a1 + 32) setDevicesByName:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(a1 + 32) setReady:1];
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_notify_dataSourceIsReady");
}

- (id)_sampleTypeForDeviceType
{
  v2 = [(HKAudioExposureDevicesDataSource *)self deviceType];
  if (v2)
  {
    if (v2 != (void *)1) {
      goto LABEL_6;
    }
    id v3 = (void *)MEMORY[0x1E4F2A7F0];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F2A820];
  }
  v2 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*v3];
LABEL_6:
  return v2;
}

- (id)_localizedNameForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];

  if (!v4)
  {
    id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = v8;
    uint64_t v10 = @"UNKNOWN_DEVICE_NAME";
    goto LABEL_5;
  }
  id v5 = [v3 name];
  v6 = [v5 lowercaseString];
  int v7 = [v6 isEqualToString:@"wired"];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = v8;
    uint64_t v10 = @"WIRED_HEADPHONE_DEVICE_NAME";
LABEL_5:
    uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    goto LABEL_7;
  }
  uint64_t v11 = [v3 name];
LABEL_7:

  return v11;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSDictionary)devicesByName
{
  return self->_devicesByName;
}

- (void)setDevicesByName:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (HKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_devicesByName, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

void __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Error querying for audio exposure sample devices: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
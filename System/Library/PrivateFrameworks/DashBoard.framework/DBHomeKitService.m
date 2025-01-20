@interface DBHomeKitService
+ (DBHomeKitService)serviceWithHome:(id)a3 service:(id)a4;
+ (id)observerProtocol;
+ (id)registeredServiceClasses;
+ (id)serviceType;
+ (void)load;
+ (void)registerServiceClass:(Class)a3;
- (BOOL)_tracksLastUsed;
- (BOOL)current;
- (BOOL)hasError;
- (BOOL)interactive;
- (BOOL)lastWritten;
- (BOOL)pendingRead;
- (BOOL)pendingWrite;
- (BOOL)reachable;
- (BOOL)usable;
- (CARObserverHashTable)observers;
- (DBHome)home;
- (DBHomeKitService)initWithHome:(id)a3 service:(id)a4;
- (HMService)service;
- (NSDictionary)characteristics;
- (NSDictionary)characteristicsByType;
- (NSString)description;
- (NSString)name;
- (NSString)stateDescription;
- (NSString)type;
- (NSUUID)homeUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (double)distance;
- (id)characteristicForName:(id)a3;
- (id)characteristicForType:(id)a3;
- (id)managedCharacteristics;
- (id)serviceType;
- (void)_characteristicDidUpdate:(id)a3;
- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)accessoryDidUpdateServices:(id)a3;
- (void)addObserver:(id)a3;
- (void)refreshCharacteristicValues;
- (void)removeObserver:(id)a3;
- (void)setLastWritten:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setService:(id)a3;
@end

@implementation DBHomeKitService

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[DBHomeKitService registerServiceClass:v3];
  }
}

+ (void)registerServiceClass:(Class)a3
{
  if (registerServiceClass__onceToken != -1) {
    dispatch_once(&registerServiceClass__onceToken, &__block_literal_global_12);
  }
  id obj = (id)_registeredServiceClasses;
  objc_sync_enter(obj);
  v4 = (void *)_registeredServiceClasses;
  v5 = [(objc_class *)a3 serviceType];
  [v4 setObject:a3 forKeyedSubscript:v5];

  objc_sync_exit(obj);
}

uint64_t __41__DBHomeKitService_registerServiceClass___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _registeredServiceClasses;
  _registeredServiceClasses = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)registeredServiceClasses
{
  id v2 = (id)_registeredServiceClasses;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(id)_registeredServiceClasses copy];
  objc_sync_exit(v2);

  return v3;
}

+ (DBHomeKitService)serviceWithHome:(id)a3 service:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[DBHomeKitService registeredServiceClasses];
  v8 = +[DBHomeKitServiceTypes serviceNameByType];
  v9 = [v5 serviceType];
  v10 = [v8 objectForKeyedSubscript:v9];
  v11 = (objc_class *)[v7 objectForKeyedSubscript:v10];

  if (!v11) {
    v11 = (objc_class *)objc_opt_class();
  }
  v12 = (void *)[[v11 alloc] initWithHome:v6 service:v5];

  return (DBHomeKitService *)v12;
}

- (DBHomeKitService)initWithHome:(id)a3 service:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)DBHomeKitService;
  v8 = [(DBHomeKitService *)&v35 init];
  v9 = v8;
  if (v8)
  {
    id v29 = v7;
    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v9->_service, a4);
    id v10 = objc_alloc(MEMORY[0x263F30E18]);
    v11 = [(id)objc_opt_class() observerProtocol];
    uint64_t v12 = [v10 initWithProtocol:v11];
    observers = v9->_observers;
    v9->_observers = (CARObserverHashTable *)v12;

    v14 = [(HMService *)v9->_service accessory];
    [v14 setDelegate:v9];

    id obj = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v16 = [(HMService *)v9->_service characteristics];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = +[DBHomeKitCharacteristic chacteristicWithService:v9 characteristic:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          if ([v21 usable])
          {
            v22 = [v21 uniqueIdentifier];
            [obj setObject:v21 forKeyedSubscript:v22];
          }
          v23 = [v21 name];
          v24 = [v15 objectForKeyedSubscript:v23];

          if (!v24)
          {
            v24 = objc_opt_new();
            v25 = [v21 name];
            [v15 setObject:v24 forKeyedSubscript:v25];
          }
          [v24 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v18);
    }

    objc_storeStrong((id *)&v9->_characteristics, obj);
    objc_storeStrong((id *)&v9->_characteristicsByType, v15);
    if ([(DBHomeKitService *)v9 _tracksLastUsed])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v9->_home);
      v27 = [(HMService *)v9->_service serviceType];
      [WeakRetained _updateLastUsedServiceOfType:v27];
    }
    id v7 = v29;
  }

  return v9;
}

- (id)characteristicForType:(id)a3
{
  id v4 = a3;
  id v5 = +[DBHomeKitCharacteristicTypes characteristicNameByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [(DBHomeKitService *)self characteristicForName:v6];

  return v7;
}

- (id)characteristicForName:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHomeKitService *)self characteristicsByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 firstObject];

  return v7;
}

- (BOOL)interactive
{
  id v2 = [(DBHomeKitService *)self service];
  char v3 = [v2 isUserInteractive];

  return v3;
}

- (NSString)type
{
  char v3 = +[DBHomeKitServiceTypes serviceNameByType];
  id v4 = [(DBHomeKitService *)self service];
  id v5 = [v4 serviceType];
  id v6 = [v3 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = [(DBHomeKitService *)self service];
    id v7 = [v8 serviceType];
  }
  return (NSString *)v7;
}

- (BOOL)reachable
{
  id v2 = [(DBHomeKitService *)self service];
  char v3 = [v2 accessory];
  char v4 = [v3 isReachable];

  return v4;
}

- (BOOL)current
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(DBHomeKitService *)self characteristics];
  char v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    int v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 &= [*(id *)(*((void *)&v10 + 1) + 8 * i) current];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)pendingWrite
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(DBHomeKitService *)self characteristics];
  char v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v10 + 1) + 8 * i) pendingWrite];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (BOOL)pendingRead
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(DBHomeKitService *)self characteristics];
  char v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) pendingRead])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasError
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(DBHomeKitService *)self characteristics];
  char v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) hasError])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHomeKitService *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHomeKitService *)self observers];
  [v5 removeObserver:v4];
}

- (NSString)description
{
  uint64_t v18 = NSString;
  uint64_t v17 = objc_opt_class();
  uint64_t v15 = [(DBHomeKitService *)self name];
  v14 = [(DBHomeKitService *)self uniqueIdentifier];
  uint64_t v13 = [(DBHomeKitService *)self home];
  v16 = [(DBHomeKitService *)self home];
  char v3 = [v16 uniqueIdentifier];
  id v4 = [(DBHomeKitService *)self type];
  if ([(DBHomeKitService *)self interactive]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  if ([(DBHomeKitService *)self reachable]) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  if ([(DBHomeKitService *)self current]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  if ([(DBHomeKitService *)self pendingWrite]) {
    long long v8 = @"YES";
  }
  else {
    long long v8 = @"NO";
  }
  if ([(DBHomeKitService *)self pendingRead]) {
    long long v9 = @"YES";
  }
  else {
    long long v9 = @"NO";
  }
  if ([(DBHomeKitService *)self hasError]) {
    long long v10 = @"YES";
  }
  else {
    long long v10 = @"NO";
  }
  long long v11 = [v18 stringWithFormat:@"<%@: %p name=%@ uniqueIdentifier=%@ home=(%p)%@ type=%@ interactive=%@ reachable=%@ current=%@ pendingWrite=%@ pendingRead=%@ hasError=%@>", v17, self, v15, v14, v13, v3, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (void)refreshCharacteristicValues
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v3 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetHomePrediction serviceDidUpdate:]((uint64_t)self, v3);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(DBHomeKitService *)self characteristics];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) updateValueRequiringRead:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  long long v10 = [(DBHomeKitService *)self observers];
  [v10 serviceDidUpdate:self];
}

+ (id)serviceType
{
  return @"generic";
}

+ (id)observerProtocol
{
  return &unk_26E1A3560;
}

- (id)managedCharacteristics
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)serviceType
{
  id v2 = [(DBHomeKitService *)self service];
  char v3 = [v2 serviceType];

  return v3;
}

- (void)_characteristicDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBHomeKitService _characteristicDidUpdate:]();
  }

  uint64_t v6 = [(DBHomeKitService *)self observers];
  [v6 serviceDidUpdate:self];
}

- (BOOL)_tracksLastUsed
{
  return 0;
}

- (NSUUID)uniqueIdentifier
{
  id v2 = [(DBHomeKitService *)self service];
  char v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (NSString)name
{
  id v2 = [(DBHomeKitService *)self service];
  char v3 = [v2 name];

  return (NSString *)v3;
}

- (BOOL)usable
{
  char v3 = [(DBHomeKitService *)self characteristics];
  if ([v3 count])
  {
    id v4 = [(DBHomeKitService *)self service];
    id v5 = [v4 serviceType];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F0D610]] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSString)stateDescription
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v3 = objc_opt_new();
  id v4 = [(DBHomeKitService *)self managedCharacteristics];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(DBHomeKitService *)self characteristics];
    id v6 = [v7 allValues];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) stateDescription];
        [v3 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v14 = NSString;
  if ([(DBHomeKitService *)self reachable]) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  if ([(DBHomeKitService *)self current]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  uint64_t v17 = [v3 componentsJoinedByString:@", "];
  uint64_t v18 = [v14 stringWithFormat:@"[reachable=%@ current=%@ \n%@]", v15, v16, v17];

  return (NSString *)v18;
}

- (double)distance
{
  id v2 = [(DBHomeKitService *)self home];
  [v2 distance];
  double v4 = v3;

  return v4;
}

- (void)accessoryDidUpdateServices:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBHomeKitService accessoryDidUpdateServices:]();
  }

  id v6 = [(DBHomeKitService *)self observers];
  [v6 serviceDidUpdate:self];
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138544130;
    long long v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    __int16 v26 = 2114;
    id v27 = v10;
    _os_log_debug_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ accessory=%{public}@ HMService=%{public}@ HMCharacteristic=%{public}@", (uint8_t *)&v20, 0x2Au);
  }

  long long v12 = [v9 uniqueIdentifier];
  long long v13 = [(DBHomeKitService *)self uniqueIdentifier];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    uint64_t v15 = [(DBHomeKitService *)self characteristics];
    uint64_t v16 = [v10 uniqueIdentifier];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];

    [v17 updateValueRequiringRead:0];
    if ([(DBHomeKitService *)self _shouldUpdateLastUsedForCharacteristic:v17])
    {
      uint64_t v18 = [(DBHomeKitService *)self home];
      uint64_t v19 = [v9 serviceType];
      [v18 _updateLastUsedServiceOfType:v19];
    }
  }
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBHomeKitService accessoryDidUpdateServices:]();
  }

  id v6 = [(DBHomeKitService *)self observers];
  [v6 serviceDidUpdate:self];
}

- (NSUUID)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (DBHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (DBHome *)WeakRetained;
}

- (NSDictionary)characteristics
{
  return self->_characteristics;
}

- (BOOL)lastWritten
{
  return self->_lastWritten;
}

- (void)setLastWritten:(BOOL)a3
{
  self->_lastWritten = a3;
}

- (HMService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSDictionary)characteristicsByType
{
  return self->_characteristicsByType;
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
  objc_storeStrong((id *)&self->_characteristicsByType, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
}

- (void)_characteristicDidUpdate:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ characteristic=%{public}@");
}

- (void)accessoryDidUpdateServices:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ accessory=%{public}@");
}

@end
@interface CAFCarManager
- (BOOL)shouldAllocAccessoryType:(id)a3;
- (BOOL)shouldAllocAccessoryType:(id)a3 serviceConfig:(id)a4;
- (BOOL)shouldAllocAccessoryType:(id)a3 serviceType:(id)a4 characteristicType:(id)a5;
- (BOOL)shouldAllocAccessoryType:(id)a3 serviceType:(id)a4 controlType:(id)a5;
- (BOOL)shouldInitializeCharacteristic:(id)a3;
- (BOOL)shouldInitializeControl:(id)a3;
- (CAFCar)currentCar;
- (CAFCarManager)init;
- (CAFCarManager)initWithConfig:(id)a3;
- (CAFCarManager)initWithIdentifier:(id)a3;
- (CAFCarManager)initWithRegistrationFilePath:(id)a3;
- (CAFCarManagerConfiguration)config;
- (CARObserverHashTable)observers;
- (NSString)description;
- (OS_dispatch_queue)notifyQueue;
- (_CAFCarDataClientProxy)connectionProxy;
- (id)observableCache;
- (int)carDataToken;
- (os_unfair_lock_s)connectionLock;
- (void)_closeConnectionWithReason:(id)a3;
- (void)_didReceiveLifecycleNotification:(id)a3;
- (void)_locked_closeConnectionWithReason:(id)a3;
- (void)_setupCafdConnectionIfAvailable;
- (void)_updateCar;
- (void)dealloc;
- (void)enableNotificationForCharacteristic:(id)a3 enable:(BOOL)a4 response:(id)a5;
- (void)enableNotificationForControl:(id)a3 enable:(BOOL)a4 response:(id)a5;
- (void)handleResponse:(id)a3 instanceID:(id)a4 response:(id)a5;
- (void)invalidate;
- (void)notifyControl:(id)a3 value:(id)a4;
- (void)performGroupedRequest:(id)a3 key:(id)a4 value:(id)a5 withResponse:(id)a6;
- (void)readCharacteristic:(id)a3 response:(id)a4;
- (void)registerObserver:(id)a3;
- (void)requestControl:(id)a3 value:(id)a4 response:(id)a5;
- (void)setCarDataToken:(int)a3;
- (void)setConfig:(id)a3;
- (void)setConnectionLock:(os_unfair_lock_s)a3;
- (void)setConnectionProxy:(id)a3;
- (void)setCurrentCar:(id)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setObservableCache:(id)a3;
- (void)setObservers:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)writeCharacteristic:(id)a3 value:(id)a4 response:(id)a5;
@end

@implementation CAFCarManager

- (CAFCarManager)init
{
  v3 = CAFAppIdentifier();
  v4 = [(CAFCarManager *)self initWithIdentifier:v3];

  return v4;
}

- (CAFCarManager)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = CAFCarManagerLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager initWithIdentifier:]();
  }

  v6 = [[CAFCarManagerMutableConfiguration alloc] initWithIdentifier:v4];
  v7 = [(CAFCarManager *)self initWithConfig:v6];

  return v7;
}

- (CAFCarManager)initWithRegistrationFilePath:(id)a3
{
  id v4 = CAFCarManagerLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager initWithRegistrationFilePath:]();
  }

  v5 = CAFAppIdentifier();
  v6 = [(CAFCarManager *)self initWithIdentifier:v5];

  return v6;
}

- (CAFCarManager)initWithConfig:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CAFCarManager;
  v5 = [(CAFCarManager *)&v42 init];
  v6 = v5;
  if (v5)
  {
    v5->_connectionLock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.caraccessoryframework.notifyQueue", v7);
    notifyQueue = v6->_notifyQueue;
    v6->_notifyQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [v4 copy];
    config = v6->_config;
    v6->_config = (CAFCarManagerConfiguration *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26FDB2758];
    observers = v6->_observers;
    v6->_observers = (CARObserverHashTable *)v12;

    objc_initWeak(&location, v6);
    v14 = [(CAFCarManager *)v6 notifyQueue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __32__CAFCarManager_initWithConfig___block_invoke;
    handler[3] = &unk_2652641D0;
    objc_copyWeak(&v40, &location);
    uint32_t v15 = notify_register_dispatch("com.apple.private.caraccessoryframework.cardata.available", &v6->_carDataToken, v14, handler);

    if (v15)
    {
      v16 = CAFGeneralLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CAFCarManager initWithConfig:](v15, v16);
      }
    }
    [(CAFCarManager *)v6 _setupCafdConnectionIfAvailable];
    v17 = CAFCarManagerLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[CAFCarManager initWithConfig:]();
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v18 = [(CAFCarManager *)v6 config];
    v19 = [v18 registrations];
    v20 = [v19 treeLogLines];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v36;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * v23);
          v25 = CAFRegistrationLogging();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v45 = v24;
            _os_log_debug_impl(&dword_249710000, v25, OS_LOG_TYPE_DEBUG, "registrations %{public}@", buf, 0xCu);
          }

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v46 count:16];
      }
      while (v21);
    }

    v26 = [MEMORY[0x263F08A00] defaultCenter];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v27 = [&unk_26FD90990 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(&unk_26FD90990);
          }
          [v26 addObserver:v6 selector:sel__didReceiveLifecycleNotification_ name:*(void *)(*((void *)&v31 + 1) + 8 * i) object:0];
        }
        uint64_t v27 = [&unk_26FD90990 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v27);
    }

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __32__CAFCarManager_initWithConfig___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CAFCarManagerLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __32__CAFCarManager_initWithConfig___block_invoke_cold_1();
    }

    [WeakRetained _setupCafdConnectionIfAvailable];
  }
}

- (void)_didReceiveLifecycleNotification:(id)a3
{
  id v4 = a3;
  v5 = CAFCarManagerLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(CAFCarManager *)(uint64_t)self _didReceiveLifecycleNotification:v5];
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCarManager *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCarManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CAFCarManager *)self config];
  v6 = [(CAFCarManager *)self currentCar];
  v7 = [v3 stringWithFormat:@"<%@: %p config=[%@] car=%@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
}

- (void)_setupCafdConnectionIfAvailable
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = @"YES";
  if (a2) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [a1 connectionProxy];
  if (v7) {
    dispatch_queue_t v8 = @"YES";
  }
  else {
    dispatch_queue_t v8 = @"NO";
  }
  v9 = [a1 connectionProxy];
  uint64_t v10 = &stru_26FD46EB0;
  if (v9)
  {
    id v5 = [a1 connectionProxy];
    if ([(__CFString *)v5 invalidated]) {
      uint64_t v10 = @" (INVALIDATED)";
    }
  }
  int v11 = 136316162;
  uint64_t v12 = "-[CAFCarManager _setupCafdConnectionIfAvailable]";
  __int16 v13 = 2114;
  v14 = a1;
  __int16 v15 = 2112;
  v16 = v6;
  __int16 v17 = 2112;
  v18 = v8;
  __int16 v19 = 2112;
  v20 = v10;
  _os_log_debug_impl(&dword_249710000, a3, OS_LOG_TYPE_DEBUG, "%s %{public}@: carDataAvailable %@ connectionProxy %@%@", (uint8_t *)&v11, 0x34u);
  if (v9) {
}
  }

- (void)_closeConnectionWithReason:(id)a3
{
  p_connectionLock = &self->_connectionLock;
  id v5 = a3;
  os_unfair_lock_lock(p_connectionLock);
  [(CAFCarManager *)self _locked_closeConnectionWithReason:v5];

  os_unfair_lock_unlock(p_connectionLock);
}

- (void)_locked_closeConnectionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCarManager *)self currentCar];

  if (v5)
  {
    v6 = [(CAFCarManager *)self observers];
    [v6 carManagerWillUpdateCar:self];

    v7 = [(CAFCarManager *)self currentCar];
    [v7 invalidate];

    [(CAFCarManager *)self setCurrentCar:0];
    dispatch_queue_t v8 = [(CAFCarManager *)self observers];
    [v8 carManager:self didUpdateCurrentCar:0];
  }
  v9 = [(CAFCarManager *)self connectionProxy];
  [v9 invalidate];

  uint64_t v10 = CAFCarManagerLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager _locked_closeConnectionWithReason:]();
  }
}

- (BOOL)shouldAllocAccessoryType:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCarManager *)self config];
  if (([v5 sparseTree] & 1) == 0)
  {

    goto LABEL_7;
  }
  v6 = [(CAFCarManager *)self config];
  v7 = [v6 registrations];
  char v8 = [v7 hasAccessory:v4];

  if (v8)
  {
LABEL_7:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  v9 = CAFRegistrationLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager shouldAllocAccessoryType:]((uint64_t)v4);
  }

  BOOL v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)shouldAllocAccessoryType:(id)a3 serviceConfig:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = +[CAFCarConfiguration getType:v7];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v9 = [(CAFCarManager *)self config];
  if ([v9 sparseTree])
  {
    BOOL v10 = [(CAFCarManager *)self config];
    int v11 = [v10 registrations];
    char v12 = [v11 hasAccessory:v6 service:v8];
  }
  else
  {
    char v12 = 1;
  }

  char v29 = v12;
  if (!*((unsigned char *)v27 + 24)) {
    goto LABEL_7;
  }
  __int16 v13 = [(CAFCarManager *)self config];
  v14 = [v13 registrations];
  __int16 v15 = [v14 nodeForAccessory:v6 serviceType:v8];

  v16 = [v15 children];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke;
  v21[3] = &unk_265264220;
  id v22 = v7;
  id v23 = v6;
  id v24 = v8;
  v25 = &v26;
  [v16 enumerateKeysAndObjectsUsingBlock:v21];

  if (*((unsigned char *)v27 + 24))
  {
    BOOL v17 = 1;
  }
  else
  {
LABEL_7:
    v18 = CAFRegistrationLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = +[CAFAccessoryTypes accessoryNameForType:v6];
      +[CAFServiceTypes serviceNameForType:v8];
      objc_claimAutoreleasedReturnValue();
      -[CAFCarManager shouldAllocAccessoryType:serviceConfig:]();
    }

    BOOL v17 = *((unsigned char *)v27 + 24) != 0;
  }
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  v9 = [v8 registeredValues];
  if ([v9 count])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy_;
    id v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    objc_opt_class();
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"characteristics"];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (v11)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke_115;
      v17[3] = &unk_2652641F8;
      id v18 = v7;
      id v19 = &v20;
      [v11 enumerateObjectsUsingBlock:v17];
    }
    if (v21[5])
    {
      if (objc_msgSend(v9, "containsObject:"))
      {
LABEL_15:

        _Block_object_dispose(&v20, 8);
        goto LABEL_16;
      }
      char v12 = CAFRegistrationLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = +[CAFAccessoryTypes accessoryNameForType:*(void *)(a1 + 40)];
        v14 = +[CAFServiceTypes serviceNameForType:*(void *)(a1 + 48)];
        uint64_t v15 = v21[5];
        *(_DWORD *)buf = 138544130;
        id v27 = v13;
        __int16 v28 = 2114;
        char v29 = v14;
        __int16 v30 = 2114;
        uint64_t v31 = v15;
        __int16 v32 = 2114;
        long long v33 = v9;
        _os_log_debug_impl(&dword_249710000, v12, OS_LOG_TYPE_DEBUG, "characteristic %{public}@.%{public}@ value %{public}@ is not in registered values %{public}@", buf, 0x2Au);
      }
    }
    else
    {
      char v12 = CAFRegistrationLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v16 = +[CAFAccessoryTypes accessoryNameForType:*(void *)(a1 + 40)];
        +[CAFServiceTypes serviceNameForType:*(void *)(a1 + 48)];
        objc_claimAutoreleasedReturnValue();
        __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke_cold_1();
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_15;
  }
LABEL_16:
}

void __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke_115(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  id v12 = v6;
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = +[CAFCarConfiguration getType:v12];
    id v8 = v7;
    if (v7 && [v7 isEqualToString:*(void *)(a1 + 32)])
    {
      uint64_t v9 = [v12 objectForKeyedSubscript:@"initialValue"];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      *a4 = 1;
    }
  }
}

- (BOOL)shouldAllocAccessoryType:(id)a3 serviceType:(id)a4 characteristicType:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAFCarManager *)self config];
  if (([v11 sparseTree] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v12 = [(CAFCarManager *)self config];
  id v13 = [v12 registrations];
  char v14 = [v13 hasAccessory:v8 service:v9 characteristic:v10];

  if (v14)
  {
LABEL_7:
    BOOL v16 = 1;
    goto LABEL_8;
  }
  uint64_t v15 = CAFRegistrationLogging();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v18 = +[CAFAccessoryTypes accessoryNameForType:v8];
    id v19 = +[CAFServiceTypes serviceNameForType:v9];
    uint64_t v20 = +[CAFCharacteristicTypes characteristicNameForType:v10];
    int v21 = 138543874;
    uint64_t v22 = v18;
    __int16 v23 = 2114;
    id v24 = v19;
    __int16 v25 = 2114;
    uint64_t v26 = v20;
    _os_log_debug_impl(&dword_249710000, v15, OS_LOG_TYPE_DEBUG, "should not allocate characteristic %{public}@.%{public}@.%{public}@", (uint8_t *)&v21, 0x20u);
  }
  BOOL v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)shouldAllocAccessoryType:(id)a3 serviceType:(id)a4 controlType:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAFCarManager *)self config];
  if (([v11 sparseTree] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v12 = [(CAFCarManager *)self config];
  id v13 = [v12 registrations];
  char v14 = [v13 hasAccessory:v8 service:v9 control:v10];

  if (v14)
  {
LABEL_7:
    BOOL v16 = 1;
    goto LABEL_8;
  }
  uint64_t v15 = CAFRegistrationLogging();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v18 = +[CAFAccessoryTypes accessoryNameForType:v8];
    id v19 = +[CAFServiceTypes serviceNameForType:v9];
    uint64_t v20 = +[CAFControlTypes controlNameForType:v10];
    int v21 = 138543874;
    uint64_t v22 = v18;
    __int16 v23 = 2114;
    id v24 = v19;
    __int16 v25 = 2114;
    uint64_t v26 = v20;
    _os_log_debug_impl(&dword_249710000, v15, OS_LOG_TYPE_DEBUG, "should not allocate control %{public}@.%{public}@.%{public}@", (uint8_t *)&v21, 0x20u);
  }
  BOOL v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)shouldInitializeCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCarManager *)self config];
  id v6 = [v5 registrations];
  id v7 = [v4 accessory];
  id v8 = [v7 categoryType];
  id v9 = [v4 service];
  id v10 = [v9 serviceType];
  id v11 = [v4 characteristicType];

  LOBYTE(v4) = [v6 hasAccessory:v8 service:v10 characteristic:v11];
  return (char)v4;
}

- (BOOL)shouldInitializeControl:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCarManager *)self config];
  id v6 = [v5 registrations];
  id v7 = [v4 accessory];
  id v8 = [v7 categoryType];
  id v9 = [v4 service];
  id v10 = [v9 serviceType];
  id v11 = [v4 controlType];

  LOBYTE(v4) = [v6 hasAccessory:v8 service:v10 control:v11];
  return (char)v4;
}

- (void)_updateCar
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = [a1 currentCar];
  id v7 = [v6 uniqueIdentifier];
  id v8 = [a2 uniqueIdentifier];
  id v9 = [a1 connectionProxy];
  OUTLINED_FUNCTION_13();
  id v13 = v8;
  __int16 v14 = v10;
  uint64_t v15 = v11;
  _os_log_debug_impl(&dword_249710000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ updating car! currentCar.uniqueIdentifier=%@ rawCar.uniqueIdentifier=%@ connectionProxy=%@", v12, 0x2Au);
}

- (void)requestControl:(id)a3 value:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = CAFRequestResponseLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager requestControl:value:response:]();
  }

  id v12 = [(CAFCarManager *)self connectionProxy];
  id v13 = [v12 remoteProxy];
  __int16 v14 = [v8 pluginID];
  uint64_t v15 = [v8 instanceID];
  uint64_t v16 = [v8 priority];
  [v13 requestPluginID:v14 instanceID:v15 value:v10 priority:v16 withResponse:v9];
}

- (void)notifyControl:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CAFRequestResponseLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager notifyControl:value:]();
  }

  id v9 = [(CAFCarManager *)self connectionProxy];
  id v10 = [v9 remoteProxy];
  uint64_t v11 = [v6 pluginID];
  id v12 = [v6 instanceID];
  id v13 = [v6 priority];
  [v10 notifyPluginID:v11 instanceID:v12 value:v7 priority:v13];
}

- (void)handleResponse:(id)a3 instanceID:(id)a4 response:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    if (v17)
    {
      id v9 = [v17 error];

      if (v9)
      {
        id v10 = [CAFCharacteristicValue alloc];
        uint64_t v11 = [v17 error];
        uint64_t v12 = [(CAFCharacteristicValue *)v10 initWithValue:0 error:v11];
      }
      else
      {
        id v13 = [v17 values];

        if (!v13) {
          goto LABEL_8;
        }
        uint64_t v11 = [v17 values];
        uint64_t v12 = [v11 objectForKeyedSubscript:v7];
      }
      __int16 v14 = (CAFCharacteristicValue *)v12;

      if (v14)
      {
LABEL_9:
        v8[2](v8, v14);

        goto LABEL_10;
      }
    }
LABEL_8:
    uint64_t v15 = [CAFCharacteristicValue alloc];
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:7 userInfo:0];
    __int16 v14 = [(CAFCharacteristicValue *)v15 initWithValue:0 error:v16];

    goto LABEL_9;
  }
LABEL_10:
}

- (void)readCharacteristic:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CAFRequestResponseLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager readCharacteristic:response:]();
  }

  id v9 = [(CAFCarManager *)self connectionProxy];
  id v10 = [v9 remoteProxy];
  uint64_t v11 = [v6 pluginID];
  uint64_t v12 = [v6 readInstanceIDs];
  id v13 = [v6 priority];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__CAFCarManager_readCharacteristic_response___block_invoke;
  v16[3] = &unk_265264248;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [v10 readFromPluginID:v11 instanceIDs:v12 priority:v13 withResponse:v16];
}

void __45__CAFCarManager_readCharacteristic_response___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 instanceID];
  [v3 handleResponse:v5 instanceID:v6 response:a1[6]];
}

- (void)writeCharacteristic:(id)a3 value:(id)a4 response:(id)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CAFRequestResponseLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager writeCharacteristic:value:response:]();
  }

  uint64_t v20 = [(CAFCarManager *)self connectionProxy];
  uint64_t v12 = [v20 remoteProxy];
  id v13 = [v8 pluginID];
  id v14 = [v8 instanceID];
  id v24 = v14;
  id v15 = v9;
  if (!v9)
  {
    id v15 = [MEMORY[0x263EFF9D0] null];
  }
  v25[0] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v17 = [v8 priority];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__CAFCarManager_writeCharacteristic_value_response___block_invoke;
  v21[3] = &unk_265264248;
  void v21[4] = self;
  id v22 = v8;
  id v23 = v10;
  id v18 = v10;
  id v19 = v8;
  [v12 writeToPluginID:v13 values:v16 priority:v17 withResponse:v21];

  if (!v9) {
}
  }

void __52__CAFCarManager_writeCharacteristic_value_response___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 instanceID];
  [v3 handleResponse:v5 instanceID:v6 response:a1[6]];
}

- (void)enableNotificationForCharacteristic:(id)a3 enable:(BOOL)a4 response:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = CAFRequestResponseLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager enableNotificationForCharacteristic:enable:response:](v6, v8);
  }

  uint64_t v11 = [(CAFCarManager *)self connectionProxy];
  uint64_t v12 = [v11 remoteProxy];
  id v13 = [v8 pluginID];
  id v14 = [v8 registrationInstanceIDs];
  id v15 = [v8 priority];
  if (v6)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    void v25[2] = __69__CAFCarManager_enableNotificationForCharacteristic_enable_response___block_invoke;
    v25[3] = &unk_265264248;
    uint64_t v16 = &v26;
    v25[4] = self;
    id v26 = v8;
    id v17 = &v27;
    id v27 = v9;
    id v18 = v9;
    id v19 = v8;
    [v12 addRegistrationToPluginID:v13 instanceIDs:v14 priority:v15 withResponse:v25];
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __69__CAFCarManager_enableNotificationForCharacteristic_enable_response___block_invoke_2;
    v22[3] = &unk_265264248;
    uint64_t v16 = &v23;
    v22[4] = self;
    id v23 = v8;
    id v17 = &v24;
    id v24 = v9;
    id v20 = v9;
    id v21 = v8;
    [v12 removeRegistrationFromPluginID:v13 instanceIDs:v14 priority:v15 withResponse:v22];
  }
}

void __69__CAFCarManager_enableNotificationForCharacteristic_enable_response___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 instanceID];
  [v3 handleResponse:v5 instanceID:v6 response:a1[6]];
}

void __69__CAFCarManager_enableNotificationForCharacteristic_enable_response___block_invoke_2(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 instanceID];
  [v3 handleResponse:v5 instanceID:v6 response:a1[6]];
}

- (void)enableNotificationForControl:(id)a3 enable:(BOOL)a4 response:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = CAFRequestResponseLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CAFCarManager enableNotificationForControl:enable:response:](v6, v8);
  }

  uint64_t v11 = [(CAFCarManager *)self connectionProxy];
  uint64_t v12 = [v11 remoteProxy];
  id v13 = [v8 pluginID];
  id v14 = [v8 registrationInstanceIDs];
  id v15 = [v8 priority];
  if (v6)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    void v25[2] = __62__CAFCarManager_enableNotificationForControl_enable_response___block_invoke;
    v25[3] = &unk_265264248;
    uint64_t v16 = &v26;
    v25[4] = self;
    id v26 = v8;
    id v17 = &v27;
    id v27 = v9;
    id v18 = v9;
    id v19 = v8;
    [v12 addRegistrationToPluginID:v13 instanceIDs:v14 priority:v15 withResponse:v25];
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __62__CAFCarManager_enableNotificationForControl_enable_response___block_invoke_2;
    v22[3] = &unk_265264248;
    uint64_t v16 = &v23;
    v22[4] = self;
    id v23 = v8;
    id v17 = &v24;
    id v24 = v9;
    id v20 = v9;
    id v21 = v8;
    [v12 removeRegistrationFromPluginID:v13 instanceIDs:v14 priority:v15 withResponse:v22];
  }
}

void __62__CAFCarManager_enableNotificationForControl_enable_response___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 instanceID];
  [v3 handleResponse:v5 instanceID:v6 response:a1[6]];
}

void __62__CAFCarManager_enableNotificationForControl_enable_response___block_invoke_2(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 instanceID];
  [v3 handleResponse:v5 instanceID:v6 response:a1[6]];
}

- (void)performGroupedRequest:(id)a3 key:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = CAFRequestResponseLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CAFCarManager performGroupedRequest:key:value:withResponse:]();
    }

    id v15 = [(CAFCarManager *)self connectionProxy];
    uint64_t v16 = [v15 remoteProxy];
    id v17 = [v11 pluginID];
    id v18 = [v11 priority];
    [v16 readFromPluginID:v17 instanceIDs:v12 priority:v18 withResponse:v13];
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = CAFRequestResponseLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CAFCarManager performGroupedRequest:key:value:withResponse:]();
    }

    id v15 = [(CAFCarManager *)self connectionProxy];
    uint64_t v16 = [v15 remoteProxy];
    id v17 = [v11 pluginID];
    id v18 = [v11 priority];
    [v16 addRegistrationToPluginID:v17 instanceIDs:v12 priority:v18 withResponse:v13];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = CAFRequestResponseLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[CAFCarManager performGroupedRequest:key:value:withResponse:]();
    }

    id v15 = [(CAFCarManager *)self connectionProxy];
    uint64_t v16 = [v15 remoteProxy];
    id v17 = [v11 pluginID];
    id v18 = [v11 priority];
    [v16 removeRegistrationFromPluginID:v17 instanceIDs:v12 priority:v18 withResponse:v13];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = CAFRequestResponseLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[CAFCarManager performGroupedRequest:key:value:withResponse:].cold.4();
    }

    id v15 = [(CAFCarManager *)self connectionProxy];
    uint64_t v16 = [v15 remoteProxy];
    id v17 = [v11 pluginID];
    id v18 = [v11 priority];
    [v16 writeToPluginID:v17 values:v12 priority:v18 withResponse:v13];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)invalidate
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ time to invalidate", v2, v3, v4, v5, v6);
}

- (id)observableCache
{
  return self->_observableCache;
}

- (void)setObservableCache:(id)a3
{
}

- (CAFCar)currentCar
{
  return self->_currentCar;
}

- (void)setCurrentCar:(id)a3
{
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CAFCarManagerConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (int)carDataToken
{
  return self->_carDataToken;
}

- (void)setCarDataToken:(int)a3
{
  self->_carDataToken = a3;
}

- (_CAFCarDataClientProxy)connectionProxy
{
  return self->_connectionProxy;
}

- (void)setConnectionProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProxy, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_currentCar, 0);
  objc_storeStrong(&self->_observableCache, 0);
}

- (void)initWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "init with identifier of %@", v2, v3, v4, v5, v6);
}

- (void)initWithRegistrationFilePath:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_249710000, v0, v1, "plist registation requested, using identifier instead", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_1(&dword_249710000, v0, v1, "%s %{public}@", (uint8_t *)v2);
}

- (void)initWithConfig:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_249710000, a2, OS_LOG_TYPE_ERROR, "Unable to register for car data available notifications (%i)", (uint8_t *)v2, 8u);
}

void __32__CAFCarManager_initWithConfig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_249710000, v0, v1, "Received car data available notification", v2, v3, v4, v5, v6);
}

- (void)_didReceiveLifecycleNotification:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 name];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v5;
  OUTLINED_FUNCTION_8_1(&dword_249710000, a3, v6, "%{public}@ notification %@ fired, trigger refresh", (uint8_t *)&v7);
}

- (void)_locked_closeConnectionWithReason:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_5_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_249710000, v2, OS_LOG_TYPE_DEBUG, "%s %{public}@: connection cleared for %{public}@", (uint8_t *)v3, 0x20u);
}

- (void)shouldAllocAccessoryType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = +[CAFAccessoryTypes accessoryNameForType:a1];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_20(&dword_249710000, v2, v3, "should not allocate accessory %{public}@", v4, v5, v6, v7, v8);
}

- (void)shouldAllocAccessoryType:serviceConfig:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_8_1(&dword_249710000, v7, v5, "should not allocate service %{public}@.%{public}@", v6);
}

void __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_8_1(&dword_249710000, v7, v5, "characteristic %{public}@.%{public}@ value is not available!", v6);
}

- (void)requestControl:value:response:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  [v2 pluginID];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_16() instanceID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_17() priority];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v4, v5, "Request pluginID: %@ instanceID: %@ with priority: %@", v6, v7, v8, v9, v10);
}

- (void)notifyControl:value:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  [v2 pluginID];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_16() instanceID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_17() priority];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v4, v5, "Notify pluginID: %@ instanceID: %@ value with priority: %@", v6, v7, v8, v9, v10);
}

- (void)readCharacteristic:response:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  [v2 pluginID];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_16() instanceID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_17() priority];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v4, v5, "Read characteristic pluginID: %@ instanceID: %@ value with priority: %@", v6, v7, v8, v9, v10);
}

- (void)writeCharacteristic:value:response:.cold.1()
{
  OUTLINED_FUNCTION_6_1();
  id v2 = [v1 pluginID];
  uint64_t v3 = [v0 instanceID];
  uint64_t v4 = [v0 priority];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9_0(&dword_249710000, v5, v6, "Write characteristic pluginID: %@ instanceID: %@ value: %@ with priority: %@", v7, v8, v9, v10, v11);
}

- (void)enableNotificationForCharacteristic:(uint64_t)a1 enable:(void *)a2 response:.cold.1(uint64_t a1, void *a2)
{
  [a2 pluginID];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_16() instanceID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_17() priority];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_0(&dword_249710000, v5, v6, "%@ notification characteristic pluginID: %@ instanceID: %@ with priority: %@", v7, v8, v9, v10, v11);
}

- (void)enableNotificationForControl:(uint64_t)a1 enable:(void *)a2 response:.cold.1(uint64_t a1, void *a2)
{
  [a2 pluginID];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_16() instanceID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_17() priority];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_0(&dword_249710000, v5, v6, "%@ notification control pluginID: %@ instanceID: %@ with priority: %@", v7, v8, v9, v10, v11);
}

- (void)performGroupedRequest:key:value:withResponse:.cold.1()
{
  OUTLINED_FUNCTION_6_1();
  [v1 pluginID];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  id v2 = [(id)OUTLINED_FUNCTION_18() priority];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v3, v4, "Perform group read request pluginID: %@ instanceID count: %lu with priority: %@", v5, v6, v7, v8, v9);
}

- (void)performGroupedRequest:key:value:withResponse:.cold.2()
{
  OUTLINED_FUNCTION_6_1();
  [v1 pluginID];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  id v2 = [(id)OUTLINED_FUNCTION_18() priority];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v3, v4, "Perform group register request pluginID: %@ instanceID count: %lu with priority: %@", v5, v6, v7, v8, v9);
}

- (void)performGroupedRequest:key:value:withResponse:.cold.3()
{
  OUTLINED_FUNCTION_6_1();
  [v1 pluginID];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  id v2 = [(id)OUTLINED_FUNCTION_18() priority];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v3, v4, "Perform group unregister request pluginID: %@ instanceID count: %lu with priority: %@", v5, v6, v7, v8, v9);
}

- (void)performGroupedRequest:key:value:withResponse:.cold.4()
{
  OUTLINED_FUNCTION_6_1();
  [v1 pluginID];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  id v2 = [(id)OUTLINED_FUNCTION_18() priority];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v3, v4, "Perform group write request pluginID: %@ instanceID count: %lu with priority: %@", v5, v6, v7, v8, v9);
}

@end
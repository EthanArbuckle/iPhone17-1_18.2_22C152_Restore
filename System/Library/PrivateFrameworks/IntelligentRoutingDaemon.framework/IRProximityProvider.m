@interface IRProximityProvider
+ (BOOL)didContainer:(id)a3 changeWithUpdatetContainer:(id)a4 andRangeThreshold:(double)a5;
+ (BOOL)isBLEProximityType:(id)a3;
+ (BOOL)isUWBProximityType:(id)a3;
- (BOOL)_isPdedestrianFenceAvailable;
- (BOOL)isUwbFenceSessionStarted;
- (IRCMPDRFenceBridge)uwbFenceBridge;
- (IRProximityProvider)init;
- (NSDate)freezeDateNIHomeDevice;
- (NSHashTable)observers;
- (NSMutableDictionary)proximityBridges;
- (NSMutableDictionary)retryCountPerProximityType;
- (NSMutableSet)cachedNearbyDevices;
- (OS_dispatch_queue)queue;
- (void)_filterDevicesWithNearbyDevice:(id)a3;
- (void)_incrementRetryCount:(id)a3;
- (void)_inspectNearbyDevicesAndSetPedestrianFenceSessionState:(id)a3;
- (void)_invalidateAndNullifyAllBridges;
- (void)_invalidateBridge:(id)a3;
- (void)_removeAllDevicesForProximityType:(id)a3;
- (void)_removeAllUwbDevicesAndClearFence;
- (void)_resetRetryCount:(id)a3;
- (void)_setupAndRunAllBridges;
- (void)_setupAndRunBridge:(id)a3;
- (void)_setupNIDevicePresenceBridgeIfNeeded;
- (void)_setupNIHomeDeviceObserverBridgeIfNeeded;
- (void)_setupProxControlSessionIfNeeded;
- (void)_updateObservers:(id)a3 withDevices:(id)a4 andProvider:(id)a5;
- (void)addObserver:(id)a3;
- (void)didBridgeFail:(id)a3;
- (void)didBridgeRunSuccesfully:(id)a3;
- (void)didBridgeSuspendEndedWithName:(id)a3;
- (void)didBridgeSuspendStartedWithName:(id)a3;
- (void)didInvalidateAllDevices:(id)a3;
- (void)didRemoveDevice:(id)a3 withName:(id)a4;
- (void)didUpdateNearbyDevice:(id)a3 withName:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setCachedNearbyDevices:(id)a3;
- (void)setFreezeDateNIHomeDevice:(id)a3;
- (void)setIsUwbFenceSessionStarted:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setProximityBridges:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRetryCountPerProximityType:(id)a3;
- (void)setUwbFenceBridge:(id)a3;
@end

@implementation IRProximityProvider

- (IRProximityProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)IRProximityProvider;
  v2 = [(IRProximityProvider *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(IRProximityProvider *)v2 setObservers:v3];

    v4 = objc_opt_new();
    [(IRProximityProvider *)v2 setCachedNearbyDevices:v4];

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.intelligentroutingd.proximityprovider", v5);
    [(IRProximityProvider *)v2 setQueue:v6];

    v7 = objc_opt_new();
    [(IRProximityProvider *)v2 setRetryCountPerProximityType:v7];

    v8 = [(IRProximityProvider *)v2 retryCountPerProximityType];
    [v8 setObject:&unk_2703AF080 forKeyedSubscript:@"NIHomeDevice"];

    v9 = [(IRProximityProvider *)v2 retryCountPerProximityType];
    [v9 setObject:&unk_2703AF080 forKeyedSubscript:@"NIDevicePresence"];

    v10 = [(IRProximityProvider *)v2 retryCountPerProximityType];
    [v10 setObject:&unk_2703AF080 forKeyedSubscript:@"ProxControl"];

    v11 = objc_opt_new();
    [(IRProximityProvider *)v2 setProximityBridges:v11];

    v12 = [[IRCMPDRFenceBridge alloc] initWithFenceIdentifier:@"uwb.suspend"];
    [(IRProximityProvider *)v2 setUwbFenceBridge:v12];
  }
  return v2;
}

- (void)_filterDevicesWithNearbyDevice:(id)a3
{
  id v13 = a3;
  v4 = [(IRProximityProvider *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x263F08A98];
  dispatch_queue_t v6 = [v13 idsIdentifier];
  if (v6)
  {
    v7 = [v13 idsIdentifier];
  }
  else
  {
    v7 = @"invalid-no-match";
  }
  v8 = [v13 mediaRemoteIdentifier];
  if (v8)
  {
    v9 = [v13 mediaRemoteIdentifier];
  }
  else
  {
    v9 = @"invalid-no-match";
  }
  v10 = [v13 proximityType];
  v11 = [v5 predicateWithFormat:@"NOT ((%K = %@ OR %K = %@)AND %K = %@)", @"idsIdentifier", v7, @"mediaRemoteIdentifier", v9, @"proximityType", v10];

  if (v8) {
  if (v6)
  }

  v12 = [(IRProximityProvider *)self cachedNearbyDevices];
  [v12 filterUsingPredicate:v11];
}

- (void)_setupNIDevicePresenceBridgeIfNeeded
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 debugDescription];
  int v5 = 138412290;
  dispatch_queue_t v6 = v4;
  _os_log_error_impl(&dword_25418E000, v3, OS_LOG_TYPE_ERROR, "#proximity-provider, [ErrorId - NI presence config error] NIConfiguration error while setting up NI presence: %@", (uint8_t *)&v5, 0xCu);
}

- (void)_setupNIHomeDeviceObserverBridgeIfNeeded
{
  v3 = [(IRProximityProvider *)self proximityBridges];
  v4 = [v3 objectForKeyedSubscript:@"NIHomeDevice"];

  if (!v4)
  {
    int v5 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_INFO, "#proximity-provider, Starting NI home device observer session", buf, 2u);
    }
    id v6 = objc_alloc(MEMORY[0x263F140A0]);
    uint64_t v7 = objc_opt_new();
    v8 = (void *)[v6 initWithRegions:v7];

    [v8 setAllowedDevices:2];
    [v8 setAnchor:1];
    objc_initWeak(&location, self);
    v9 = [IRNearbyInteractionBridge alloc];
    id v10 = objc_loadWeakRetained(&location);
    v11 = [(IRNearbyInteractionBridge *)v9 initWithDelegate:v10 NIConfiguration:v8 observer:1 name:@"NIHomeDevice"];

    [(IRNearbyInteractionBridge *)v11 setTrackUpdates:1];
    v12 = [(IRProximityProvider *)self proximityBridges];
    [v12 setObject:v11 forKeyedSubscript:@"NIHomeDevice"];

    objc_destroyWeak(&location);
  }
}

- (void)_setupProxControlSessionIfNeeded
{
  v3 = [(IRProximityProvider *)self proximityBridges];
  v4 = [v3 objectForKeyedSubscript:@"ProxControl"];

  if (!v4)
  {
    int v5 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_INFO, "#proximity-provider, Starting prox control session", buf, 2u);
    }
    objc_initWeak(&location, self);
    id v6 = [IRProxcontrolBridge alloc];
    id v7 = objc_loadWeakRetained(&location);
    v8 = [(IRProxcontrolBridge *)v6 initWithDelegate:v7 name:@"ProxControl"];
    v9 = [(IRProximityProvider *)self proximityBridges];
    [v9 setObject:v8 forKeyedSubscript:@"ProxControl"];

    objc_destroyWeak(&location);
  }
}

- (void)_invalidateBridge:(id)a3
{
  id v4 = a3;
  id v6 = [(IRProximityProvider *)self proximityBridges];
  int v5 = [v6 objectForKeyedSubscript:v4];

  [v5 invalidate];
}

- (void)_setupAndRunBridge:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:@"NIDevicePresence"])
  {
    [(IRProximityProvider *)self _setupNIDevicePresenceBridgeIfNeeded];
  }
  else if ([v6 isEqualToString:@"NIHomeDevice"])
  {
    [(IRProximityProvider *)self _setupNIHomeDeviceObserverBridgeIfNeeded];
  }
  else if ([v6 isEqualToString:@"ProxControl"])
  {
    [(IRProximityProvider *)self _setupProxControlSessionIfNeeded];
  }
  id v4 = [(IRProximityProvider *)self proximityBridges];
  int v5 = [v4 objectForKeyedSubscript:v6];
  [v5 run];
}

- (void)_invalidateAndNullifyAllBridges
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->_proximityBridges allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8 = [(IRProximityProvider *)self proximityBridges];
  [v8 removeAllObjects];
}

- (void)_setupAndRunAllBridges
{
  [(IRProximityProvider *)self _setupAndRunBridge:@"NIDevicePresence"];
  [(IRProximityProvider *)self _setupAndRunBridge:@"NIHomeDevice"];

  [(IRProximityProvider *)self _setupAndRunBridge:@"ProxControl"];
}

- (void)_resetRetryCount:(id)a3
{
  id v4 = a3;
  id v5 = [(IRProximityProvider *)self retryCountPerProximityType];
  [v5 setObject:&unk_2703AF080 forKeyedSubscript:v4];
}

- (void)_incrementRetryCount:(id)a3
{
  id v4 = NSNumber;
  retryCountPerProximityType = self->_retryCountPerProximityType;
  id v6 = a3;
  id v9 = [(NSMutableDictionary *)retryCountPerProximityType objectForKeyedSubscript:v6];
  uint64_t v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
  v8 = [(IRProximityProvider *)self retryCountPerProximityType];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)_removeAllDevicesForProximityType:(id)a3
{
  id v4 = a3;
  id v5 = [(IRProximityProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (%K = %@)", @"proximityType", v4];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(IRProximityProvider *)self cachedNearbyDevices];
  [v6 filterUsingPredicate:v9];

  uint64_t v7 = [(IRProximityProvider *)self observers];
  v8 = [(IRProximityProvider *)self cachedNearbyDevices];
  [(IRProximityProvider *)self _updateObservers:v7 withDevices:v8 andProvider:self];
}

- (void)_removeAllUwbDevicesAndClearFence
{
  v3 = [(IRProximityProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  [(IRProximityProvider *)self setFreezeDateNIHomeDevice:0];
  [(IRProximityProvider *)self _removeAllDevicesForProximityType:@"NIHomeDevice"];
  [(IRProximityProvider *)self _removeAllDevicesForProximityType:@"ProxControl"];
  id v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Removing All Uwb Devices", v6, 2u);
  }
  id v5 = [(IRProximityProvider *)self uwbFenceBridge];
  [v5 clearFence];
}

- (void)_inspectNearbyDevicesAndSetPedestrianFenceSessionState:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(IRProximityProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(IRProximityProvider *)self _isPdedestrianFenceAvailable])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          long long v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) proximityType];
          BOOL v11 = +[IRProximityProvider isUWBProximityType:v10];

          if (v11)
          {
            LODWORD(v7) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    BOOL v12 = [(IRProximityProvider *)self isUwbFenceSessionStarted];
    if ((v7 & 1) == 0 && v12)
    {
      id v13 = [(IRProximityProvider *)self uwbFenceBridge];
      [v13 endSession];

      [(IRProximityProvider *)self setIsUwbFenceSessionStarted:0];
      uint64_t v14 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Ending fence session", v17, 2u);
      }
    }
    if (![(IRProximityProvider *)self isUwbFenceSessionStarted]
      && ((v7 ^ 1) & 1) == 0)
    {
      v15 = [(IRProximityProvider *)self uwbFenceBridge];
      [v15 startSession];

      [(IRProximityProvider *)self setIsUwbFenceSessionStarted:1];
      v16 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_25418E000, v16, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Starting fence session", v17, 2u);
      }
    }
  }
}

- (BOOL)_isPdedestrianFenceAvailable
{
  v2 = +[IRPreferences shared];
  v3 = [v2 uwbSuspendPedestrianFenceEnable];
  if ([v3 BOOLValue]) {
    BOOL v4 = +[IRCMPDRFenceBridge isAvailable];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__IRProximityProvider_addObserver___block_invoke;
  v7[3] = &unk_26539FC98;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__IRProximityProvider_addObserver___block_invoke(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained + 5;
    if (([WeakRetained[5] containsObject:a1[4]] & 1) == 0)
    {
      id v5 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
        __35__IRProximityProvider_addObserver___block_invoke_cold_1(v3 + 5, v5);
      }
      [*v4 addObject:a1[4]];
      id v6 = [*v4 allObjects];
      uint64_t v7 = [v6 count];

      if (v7 == 1) {
        [v3 _setupAndRunAllBridges];
      }
      id v8 = [IRNearbyDeviceContainerDO alloc];
      id v9 = [a1[5] freezeDateNIHomeDevice];
      id v10 = (void *)[v9 copy];
      BOOL v11 = (void *)[v3[4] copy];
      BOOL v12 = [(IRNearbyDeviceContainerDO *)v8 initWithFreezeDateNIHomeDevice:v10 nearbyDevices:v11];

      [a1[4] provider:a1[5] didUpdateNearbyDevices:v12];
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__IRProximityProvider_removeObserver___block_invoke;
  v7[3] = &unk_26539FC98;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__IRProximityProvider_removeObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained + 5;
    if ([WeakRetained[5] containsObject:*(void *)(a1 + 32)])
    {
      [*(id *)(*(void *)(a1 + 40) + 40) removeObject:*(void *)(a1 + 32)];
      id v5 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
        __38__IRProximityProvider_removeObserver___block_invoke_cold_1(v3 + 5, v5);
      }
      id v6 = [*v4 allObjects];
      uint64_t v7 = [v6 count];

      if (!v7) {
        [v3 _invalidateAndNullifyAllBridges];
      }
    }
  }
}

- (void)_updateObservers:(id)a3 withDevices:(id)a4 andProvider:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(IRProximityProvider *)self _inspectNearbyDevicesAndSetPedestrianFenceSessionState:v9];
  BOOL v11 = [IRNearbyDeviceContainerDO alloc];
  BOOL v12 = [(IRProximityProvider *)self freezeDateNIHomeDevice];
  id v13 = (void *)[v12 copy];
  uint64_t v14 = (void *)[v9 copy];
  v15 = [(IRNearbyDeviceContainerDO *)v11 initWithFreezeDateNIHomeDevice:v13 nearbyDevices:v14];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "provider:didUpdateNearbyDevices:", v10, v15, (void)v21);
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }
}

- (void)didUpdateNearbyDevice:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mediaRemoteIdentifier];
  if (v8)
  {

LABEL_4:
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__IRProximityProvider_didUpdateNearbyDevice_withName___block_invoke;
    block[3] = &unk_26539FCC0;
    objc_copyWeak(&v15, &location);
    id v12 = v7;
    id v13 = v6;
    uint64_t v14 = self;
    dispatch_async(queue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    goto LABEL_5;
  }
  id v9 = [v6 idsIdentifier];

  if (v9) {
    goto LABEL_4;
  }
LABEL_5:
}

void __54__IRProximityProvider_didUpdateNearbyDevice_withName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _resetRetryCount:*(void *)(a1 + 32)];
    id v4 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
      __54__IRProximityProvider_didUpdateNearbyDevice_withName___block_invoke_cold_1(a1, v4, v5);
    }
    [v3 _filterDevicesWithNearbyDevice:*(void *)(a1 + 40)];
    id v6 = [v3 cachedNearbyDevices];
    [v6 addObject:*(void *)(a1 + 40)];

    id v7 = *(void **)(a1 + 48);
    id v8 = [v3 observers];
    id v9 = [v3 cachedNearbyDevices];
    [v7 _updateObservers:v8 withDevices:v9 andProvider:v3];
  }
}

- (void)didBridgeRunSuccesfully:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__IRProximityProvider_didBridgeRunSuccesfully___block_invoke;
  block[3] = &unk_26539FCE8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __47__IRProximityProvider_didBridgeRunSuccesfully___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_25418E000, v2, OS_LOG_TYPE_INFO, "#proximity-provider, Bridge RunSuccesfully: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didBridgeFail:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__IRProximityProvider_didBridgeFail___block_invoke;
  block[3] = &unk_26539FD10;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__IRProximityProvider_didBridgeFail___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v4;
      _os_log_impl(&dword_25418E000, v3, OS_LOG_TYPE_INFO, "#proximity-provider, Bridge failed: %@", (uint8_t *)&v9, 0xCu);
    }
    [WeakRetained _incrementRetryCount:*(void *)(a1 + 32)];
    [WeakRetained _invalidateBridge:*(void *)(a1 + 32)];
    [WeakRetained _removeAllDevicesForProximityType:*(void *)(a1 + 32)];
    uint64_t v5 = [WeakRetained[7] objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v6 = +[IRPreferences shared];
    id v7 = [v6 proximitySessionRetryCountThreshold];
    int v8 = [v5 isLessThanOrEqualTo:v7];

    if (v8) {
      [WeakRetained _setupAndRunBridge:*(void *)(a1 + 32)];
    }
  }
}

- (void)didInvalidateAllDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IRProximityProvider *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__IRProximityProvider_didInvalidateAllDevices___block_invoke;
  v7[3] = &unk_26539FD38;
  id v8 = v4;
  id v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);
}

uint64_t __47__IRProximityProvider_didInvalidateAllDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _removeAllDevicesForProximityType:*(void *)(a1 + 32)];
}

- (void)didRemoveDevice:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 idsIdentifier];
  if (v8)
  {

LABEL_4:
    uint64_t v10 = [(IRProximityProvider *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48__IRProximityProvider_didRemoveDevice_withName___block_invoke;
    v11[3] = &unk_26539FD60;
    id v12 = v7;
    id v13 = v6;
    IRDispatchAsyncWithStrongSelf(v10, self, v11);

    goto LABEL_5;
  }
  int v9 = [v6 mediaRemoteIdentifier];

  if (v9) {
    goto LABEL_4;
  }
LABEL_5:
}

void __48__IRProximityProvider_didRemoveDevice_withName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 freezeDateNIHomeDevice];
  if (v4
    && (uint64_t v5 = (void *)v4,
        BOOL v6 = +[IRProximityProvider isUWBProximityType:*(void *)(a1 + 32)], v5, v6))
  {
    id v7 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 138412546;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Bridge %@ removed device %@, device frozen since fence active", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    [v3 _filterDevicesWithNearbyDevice:*(void *)(a1 + 40)];
    uint64_t v10 = [v3 observers];
    uint64_t v11 = [v3 cachedNearbyDevices];
    [v3 _updateObservers:v10 withDevices:v11 andProvider:v3];

    id v12 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
      __48__IRProximityProvider_didRemoveDevice_withName___block_invoke_cold_1((uint64_t)v3, v12, v13);
    }
  }
}

- (void)didBridgeSuspendStartedWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IRProximityProvider *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke;
  v7[3] = &unk_26539FD60;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);
}

void __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:@"NIHomeDevice"]
    && [v3 _isPdedestrianFenceAvailable]
    && ([v3 isUwbFenceSessionStarted] & 1) != 0)
  {
    id v4 = [v3 uwbFenceBridge];
    [v4 clearFence];

    uint64_t v5 = +[IRPreferences shared];
    id v6 = [v5 uwbSuspendPedestrianFenceRadiusMeters];
    [v6 floatValue];
    int v8 = v7;

    uint64_t v9 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = NSNumber;
      id v12 = v9;
      LODWORD(v13) = v8;
      int v14 = [v11 numberWithFloat:v13];
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v10;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_25418E000, v12, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Setting PDR Fence for bridge %@, with radius:%@", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x263EFF910] now];
    [v3 setFreezeDateNIHomeDevice:v15];

    objc_initWeak((id *)buf, v3);
    __int16 v16 = [v3 uwbFenceBridge];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke_53;
    v27[3] = &unk_26539FA70;
    objc_copyWeak(&v28, (id *)buf);
    LODWORD(v17) = v8;
    [v16 setFence:v27 withCompletion:v17];

    uint64_t v18 = *(void **)(a1 + 40);
    uint64_t v19 = [v3 observers];
    uint64_t v20 = [v3 cachedNearbyDevices];
    [v18 _updateObservers:v19 withDevices:v20 andProvider:v3];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [v3 _removeAllDevicesForProximityType:*(void *)(a1 + 32)];
    long long v21 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      long long v23 = NSNumber;
      long long v24 = v21;
      v25 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v3, "isUwbFenceSessionStarted"));
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", +[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable"));
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      v32 = v25;
      __int16 v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_25418E000, v24, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Bridge suspended without setting fence, name:%@, isFenceSessionStarted:%@, isFenceAvailable:%@", buf, 0x20u);
    }
  }
}

void __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke_53(uint64_t a1)
{
  v2 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25418E000, v2, OS_LOG_TYPE_DEFAULT, "#proximity-provider, Fence completion called", v6, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained queue];
    IRDispatchAsyncWithStrongSelf(v5, v4, &__block_literal_global_6);
  }
}

uint64_t __55__IRProximityProvider_didBridgeSuspendStartedWithName___block_invoke_54(uint64_t a1, void *a2)
{
  return [a2 _removeAllUwbDevicesAndClearFence];
}

- (void)didBridgeSuspendEndedWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IRProximityProvider *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__IRProximityProvider_didBridgeSuspendEndedWithName___block_invoke;
  v7[3] = &unk_26539FD60;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);
}

void __53__IRProximityProvider_didBridgeSuspendEndedWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_INFO, "#proximity-provider, Bridge session suspend ended: %@", (uint8_t *)&v8, 0xCu);
  }
  if (+[IRProximityProvider isUWBProximityType:*(void *)(a1 + 32)])
  {
    [v3 _removeAllUwbDevicesAndClearFence];
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"NIDevicePresence"])
  {
    id v6 = [*(id *)(a1 + 40) proximityBridges];
    int v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v7 run];
  }
}

+ (BOOL)isUWBProximityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"ProxControl"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqual:@"NIHomeDevice"];
  }

  return v4;
}

+ (BOOL)isBLEProximityType:(id)a3
{
  return [a3 isEqual:@"NIDevicePresence"];
}

+ (BOOL)didContainer:(id)a3 changeWithUpdatetContainer:(id)a4 andRangeThreshold:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [MEMORY[0x263EFF910] now];
  id v12 = [v7 nearbyDevices];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __81__IRProximityProvider_didContainer_changeWithUpdatetContainer_andRangeThreshold___block_invoke;
  v26[3] = &unk_26539FDA8;
  id v27 = v9;
  double v29 = a5;
  id v13 = v11;
  id v28 = v13;
  id v14 = v9;
  [v12 enumerateObjectsUsingBlock:v26];

  uint64_t v15 = [v8 nearbyDevices];

  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  long long v21 = __81__IRProximityProvider_didContainer_changeWithUpdatetContainer_andRangeThreshold___block_invoke_2;
  uint64_t v22 = &unk_26539FDA8;
  double v25 = a5;
  id v23 = v10;
  id v24 = v13;
  id v16 = v13;
  id v17 = v10;
  [v15 enumerateObjectsUsingBlock:&v19];

  LODWORD(v13) = objc_msgSend(v14, "isEqualToSet:", v17, v19, v20, v21, v22) ^ 1;
  return (char)v13;
}

void __81__IRProximityProvider_didContainer_changeWithUpdatetContainer_andRangeThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v4 range];
  id v7 = (id)[v4 copyWithReplacementRange:dbl_25420FA00[v5 < *(double *)(a1 + 48)]];

  id v6 = (void *)[v7 copyWithReplacementMeasurementDate:*(void *)(a1 + 40)];
  [v3 addObject:v6];
}

void __81__IRProximityProvider_didContainer_changeWithUpdatetContainer_andRangeThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v4 range];
  id v7 = (id)[v4 copyWithReplacementRange:dbl_25420FA00[v5 < *(double *)(a1 + 48)]];

  id v6 = (void *)[v7 copyWithReplacementMeasurementDate:*(void *)(a1 + 40)];
  [v3 addObject:v6];
}

- (NSMutableDictionary)proximityBridges
{
  return self->_proximityBridges;
}

- (void)setProximityBridges:(id)a3
{
}

- (IRCMPDRFenceBridge)uwbFenceBridge
{
  return self->_uwbFenceBridge;
}

- (void)setUwbFenceBridge:(id)a3
{
}

- (NSMutableSet)cachedNearbyDevices
{
  return self->_cachedNearbyDevices;
}

- (void)setCachedNearbyDevices:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)retryCountPerProximityType
{
  return self->_retryCountPerProximityType;
}

- (void)setRetryCountPerProximityType:(id)a3
{
}

- (BOOL)isUwbFenceSessionStarted
{
  return self->_isUwbFenceSessionStarted;
}

- (void)setIsUwbFenceSessionStarted:(BOOL)a3
{
  self->_isUwbFenceSessionStarted = a3;
}

- (NSDate)freezeDateNIHomeDevice
{
  return self->_freezeDateNIHomeDevice;
}

- (void)setFreezeDateNIHomeDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freezeDateNIHomeDevice, 0);
  objc_storeStrong((id *)&self->_retryCountPerProximityType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedNearbyDevices, 0);
  objc_storeStrong((id *)&self->_uwbFenceBridge, 0);

  objc_storeStrong((id *)&self->_proximityBridges, 0);
}

void __35__IRProximityProvider_addObserver___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = *a1;
  id v3 = a2;
  id v4 = [v2 allObjects];
  int v6 = 134217984;
  uint64_t v7 = [v4 count];
  OUTLINED_FUNCTION_0_1(&dword_25418E000, v3, v5, "#proximity-provider, Add observer, num observers before = %lu", (uint8_t *)&v6);
}

void __38__IRProximityProvider_removeObserver___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = *a1;
  id v3 = a2;
  int v5 = 134217984;
  uint64_t v6 = [v2 count];
  OUTLINED_FUNCTION_0_1(&dword_25418E000, v3, v4, "#proximity-provider, Removing observer, num observers after = %lu", (uint8_t *)&v5);
}

void __54__IRProximityProvider_didUpdateNearbyDevice_withName___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_25418E000, a2, a3, "#proximity-provider, Bridge updated device: %@", (uint8_t *)&v4);
}

void __48__IRProximityProvider_didRemoveDevice_withName___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_25418E000, a2, a3, "#proximity-provider, Updated cached nearby devices: %@", (uint8_t *)&v4);
}

@end
@interface HUNearbyController
+ (HUNearbyController)sharedInstance;
- (AXDispatchTimer)nearbyHysteresisTimer;
- (AXDispatchTimer)startTimer;
- (BOOL)hasPendingNearbyUpdates;
- (BOOL)shouldPublishNearbyUpdates;
- (HUNearbyController)init;
- (IDSService)service;
- (NSArray)availableDevices;
- (NSArray)availableWatches;
- (NSMutableArray)registeredDomains;
- (NSMutableDictionary)discoveryUpdates;
- (NSMutableDictionary)domainQueues;
- (NSMutableDictionary)loggingUpdates;
- (NSMutableDictionary)messageUpdates;
- (OS_dispatch_queue)nearbyUpdatesQueue;
- (id)descriptionForIDSDevice:(id)a3;
- (id)descriptionForPriority:(unint64_t)a3;
- (id)nearbyDeviceWithIdentifier:(id)a3 justCreated:(BOOL *)a4;
- (id)nearbyDevices;
- (void)discoverNearbyDevicesWithDomain:(id)a3;
- (void)logIDSDevices:(id)a3 withTitle:(id)a4;
- (void)logMessage:(id)a3;
- (void)logMessageWithDomain:(id)a3 message:(id)a4;
- (void)logNearbyDevices:(id)a3 withTitle:(id)a4;
- (void)nearbyDevicesDidUpdateWithNewDevices:(id)a3 forDomain:(id)a4;
- (void)processIDSDevices:(id)a3;
- (void)registerBlock:(id)a3 forKey:(id)a4 withUpdateGroup:(id)a5 forDomain:(id)a6 withListener:(id)a7;
- (void)registerDiscoveryBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5;
- (void)registerLoggingBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5;
- (void)registerMessageBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5;
- (void)registerQueue:(id)a3 forDomain:(id)a4;
- (void)sendMessage:(id)a3 toDevicesWithDomain:(id)a4 excludingState:(id)a5 withPriority:(unint64_t)a6;
- (void)sendMessage:(id)a3 toDevicesWithDomain:(id)a4 withPriority:(unint64_t)a5;
- (void)sendMessage:(id)a3 toWatchDevicesWithDomain:(id)a4 excludingState:(id)a5 withPriority:(unint64_t)a6;
- (void)sendMessage:(id)a3 toWatchDevicesWithDomain:(id)a4 withPriority:(unint64_t)a5;
- (void)sendMessage:(id)a3 withDomain:(id)a4 toDevices:(id)a5 withPriority:(unint64_t)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setAvailableDevices:(id)a3;
- (void)setDiscoveryUpdates:(id)a3;
- (void)setDomainQueues:(id)a3;
- (void)setHasPendingNearbyUpdates:(BOOL)a3;
- (void)setLoggingUpdates:(id)a3;
- (void)setMessageUpdates:(id)a3;
- (void)setNearbyHysteresisTimer:(id)a3;
- (void)setNearbyUpdatesQueue:(id)a3;
- (void)setRegisteredDomains:(id)a3;
- (void)setService:(id)a3;
- (void)setShouldPublishNearbyUpdates:(BOOL)a3;
- (void)setStartTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)stopDiscoveringDevicesWithDomain:(id)a3;
@end

@implementation HUNearbyController

+ (HUNearbyController)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_NearbyController_0;

  return (HUNearbyController *)v2;
}

uint64_t __36__HUNearbyController_sharedInstance__block_invoke()
{
  sharedInstance_NearbyController_0 = objc_alloc_init(HUNearbyController);

  return MEMORY[0x270F9A758]();
}

- (HUNearbyController)init
{
  v23.receiver = self;
  v23.super_class = (Class)HUNearbyController;
  v2 = [(HUNearbyController *)&v23 init];
  v3 = v2;
  if (v2)
  {
    v2->_syncLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v6 = dispatch_queue_create("hu_nearby_updates_queue", v5);
    [(HUNearbyController *)v3 setNearbyUpdatesQueue:v6];

    id v7 = objc_alloc(MEMORY[0x263F21398]);
    v8 = [(HUNearbyController *)v3 nearbyUpdatesQueue];
    v9 = (void *)[v7 initWithTargetSerialQueue:v8];
    [(HUNearbyController *)v3 setNearbyHysteresisTimer:v9];

    v3->_shouldPublishNearbyUpdates = 1;
    v10 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUNearbyController *)v3 setDomainQueues:v10];

    v11 = [MEMORY[0x263EFF980] array];
    [(HUNearbyController *)v3 setRegisteredDomains:v11];

    v12 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUNearbyController *)v3 setLoggingUpdates:v12];

    v13 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUNearbyController *)v3 setMessageUpdates:v13];

    v14 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUNearbyController *)v3 setDiscoveryUpdates:v14];

    availableDevices = v3->_availableDevices;
    v16 = (NSArray *)MEMORY[0x263EFFA68];
    v3->_availableDevices = (NSArray *)MEMORY[0x263EFFA68];

    availableWatches = v3->_availableWatches;
    v3->_availableWatches = v16;

    id v18 = objc_alloc(MEMORY[0x263F21398]);
    v19 = [(HUNearbyController *)v3 nearbyUpdatesQueue];
    uint64_t v20 = [v18 initWithTargetSerialQueue:v19];
    startTimer = v3->_startTimer;
    v3->_startTimer = (AXDispatchTimer *)v20;

    [(AXDispatchTimer *)v3->_startTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v3;
}

- (NSArray)availableDevices
{
  return self->_availableDevices;
}

- (void)setAvailableDevices:(id)a3
{
  objc_storeStrong((id *)&self->_availableDevices, a3);
  id v7 = a3;
  v5 = [(NSArray *)self->_availableDevices ax_filteredArrayUsingBlock:&__block_literal_global_35];
  availableWatches = self->_availableWatches;
  self->_availableWatches = v5;
}

uint64_t __42__HUNearbyController_setAvailableDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isWatch];
}

- (NSArray)availableWatches
{
  return self->_availableWatches;
}

- (id)nearbyDevices
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  v3 = [(HUNearbyController *)self nearbyUpdatesQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__HUNearbyController_nearbyDevices__block_invoke;
  v6[3] = &unk_2640FD6A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__HUNearbyController_nearbyDevices__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) availableDevices];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)logMessage:(id)a3
{
}

- (void)logMessageWithDomain:(id)a3 message:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_queue_t v6 = (objc_class *)NSString;
  id v7 = a4;
  v8 = (void *)[[v6 alloc] initWithFormat:v7 locale:0 arguments:&v15];

  if (v5)
  {
    id v10 = v5;
    id v11 = v8;
    AX_PERFORM_WITH_LOCK();
  }
  else
  {
    uint64_t v9 = HCLogHearingNearby();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
}

void __51__HUNearbyController_logMessageWithDomain_message___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__HUNearbyController_logMessageWithDomain_message___block_invoke_2;
  v3[3] = &unk_2640FCDB0;
  id v4 = *(id *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __51__HUNearbyController_logMessageWithDomain_message___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void (**)(void, void))MEMORY[0x2105575F0](a3);
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, *(void *)(a1 + 32));
    id v4 = (void (**)(void, void))v5;
  }
}

- (id)descriptionForIDSDevice:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  id v5 = [v4 name];
  dispatch_queue_t v6 = [v4 productName];
  id v7 = [v4 uniqueID];
  v8 = (void *)IDSCopyIDForDevice();

  uint64_t v9 = [v3 stringWithFormat:@"%@ - %@ [%@] - [%@]", v5, v6, v7, v8];

  return v9;
}

- (id)descriptionForPriority:(unint64_t)a3
{
  uint64_t v3 = @"Default";
  if (a3 == 2) {
    uint64_t v3 = @"NoWake";
  }
  if (a3 == 1) {
    return @"High";
  }
  else {
    return v3;
  }
}

- (void)logIDSDevices:(id)a3 withTitle:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(HUNearbyController *)self descriptionForIDSDevice:*(void *)(*((void *)&v16 + 1) + 8 * v13)];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  [(HUNearbyController *)self logMessageWithDomain:0, @"%@ count: %@, %@", v7, v15, v8 message];
}

- (void)logNearbyDevices:(id)a3 withTitle:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) description];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  [(HUNearbyController *)self logMessageWithDomain:0, @"%@ count: %@, %@", v7, v15, v8 message];
}

- (void)discoverNearbyDevicesWithDomain:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(HUNearbyController *)self nearbyUpdatesQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__HUNearbyController_discoverNearbyDevicesWithDomain___block_invoke;
    v6[3] = &unk_2640FC938;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __54__HUNearbyController_discoverNearbyDevicesWithDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registeredDomains];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = *(void **)(a1 + 32);
    if (!v4[5])
    {
      [v4 start];
      id v4 = *(void **)(a1 + 32);
    }
    id v5 = [v4 registeredDomains];
    [v5 addObject:*(void *)(a1 + 40)];
  }
}

- (void)stopDiscoveringDevicesWithDomain:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(HUNearbyController *)self nearbyUpdatesQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__HUNearbyController_stopDiscoveringDevicesWithDomain___block_invoke;
    v6[3] = &unk_2640FC938;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __55__HUNearbyController_stopDiscoveringDevicesWithDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registeredDomains];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) registeredDomains];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 stop];
  }
}

- (void)start
{
  if (!self->_service)
  {
    if ([MEMORY[0x263F472B0] isProtectedDataAvailable])
    {
      uint64_t v3 = +[HUNearbySettings timeStamp];
      [(HUNearbyController *)self logMessageWithDomain:0, @"IDS Start at %@", v3 message];

      uint64_t v4 = (IDSService *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.hearing"];
      service = self->_service;
      self->_service = v4;

      id v6 = objc_alloc_init(MEMORY[0x263F4A0D0]);
      [v6 setWantsCrossAccountMessaging:0];
      id v7 = self->_service;
      v8 = [(HUNearbyController *)self nearbyUpdatesQueue];
      [(IDSService *)v7 addDelegate:self withDelegateProperties:v6 queue:v8];

      dispatch_time_t v9 = dispatch_time(0, 1000000000);
      uint64_t v10 = [(HUNearbyController *)self nearbyUpdatesQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __27__HUNearbyController_start__block_invoke;
      block[3] = &unk_2640FC960;
      block[4] = self;
      dispatch_after(v9, v10, block);
    }
    else
    {
      [(HUNearbyController *)self logMessageWithDomain:0 message:@"Waiting IDS Start"];
      objc_initWeak(&location, self);
      uint64_t v11 = [(HUNearbyController *)self startTimer];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __27__HUNearbyController_start__block_invoke_2;
      v12[3] = &unk_2640FC910;
      objc_copyWeak(&v13, &location);
      [v11 afterDelay:v12 processBlock:0.5];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __27__HUNearbyController_start__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[5];
  id v3 = [v2 devices];
  [v1 service:v2 devicesChanged:v3];
}

void __27__HUNearbyController_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained start];
}

- (void)stop
{
  id v3 = +[HUNearbySettings timeStamp];
  [(HUNearbyController *)self logMessageWithDomain:0, @"IDS Stop at %@", v3 message];

  service = self->_service;
  self->_service = 0;

  availableDevices = self->_availableDevices;
  id v6 = (NSArray *)MEMORY[0x263EFFA68];
  self->_availableDevices = (NSArray *)MEMORY[0x263EFFA68];

  availableWatches = self->_availableWatches;
  self->_availableWatches = v6;

  id v8 = [(HUNearbyController *)self startTimer];
  [v8 cancel];
}

- (id)nearbyDeviceWithIdentifier:(id)a3 justCreated:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  id v45 = 0;
  id v7 = [(HUNearbyController *)self availableDevices];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke;
  v38[3] = &unk_2640FE080;
  id v8 = v6;
  id v39 = v8;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v38];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(HUNearbyController *)self logMessageWithDomain:0 message:@"Device not found by ID, asking IDS service"];
    uint64_t v10 = [(HUNearbyController *)self service];
    id v11 = [v10 deviceForFromID:v8];

    if (v11)
    {
      uint64_t v12 = [(HUNearbyController *)self availableDevices];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke_2;
      v36[3] = &unk_2640FE080;
      id v11 = v11;
      id v37 = v11;
      uint64_t v13 = [v12 indexOfObjectPassingTest:v36];

      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(HUNearbyController *)self logMessageWithDomain:0 message:@"Device not found. Creating from idsDevice"];
        uint64_t v14 = +[HUNearbyDevice nearbyDeviceWithIDSDevice:v11];
        uint64_t v15 = (void *)v41[5];
        v41[5] = v14;

        [(HUNearbyController *)self logMessageWithDomain:0, @"Added device %@", v41[5] message];
        if (a4 && v41[5]) {
          *a4 = 1;
        }
      }
      else
      {
        v24 = [(HUNearbyController *)self availableDevices];
        uint64_t v25 = [v24 objectAtIndex:v13];
        v26 = (void *)v41[5];
        v41[5] = v25;
      }
      objc_super v23 = v37;
    }
    else
    {
      [(HUNearbyController *)self logMessageWithDomain:0 message:@"Device not found. Creating."];
      long long v18 = [(HUNearbyController *)self service];
      long long v19 = [v18 devices];
      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 3221225472;
      v31 = __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke_3;
      v32 = &unk_2640FE0A8;
      v33 = self;
      id v20 = v8;
      id v34 = v20;
      v35 = &v40;
      [v19 enumerateObjectsUsingBlock:&v29];

      if (!v41[5])
      {
        uint64_t v21 = +[HUNearbyDevice nearbyDeviceWithIDSIdentifier:v20];
        v22 = (void *)v41[5];
        v41[5] = v21;

        [(HUNearbyController *)self logMessageWithDomain:0, @"Added device with just identifier %@", v41[5], v29, v30, v31, v32, v33 message];
      }
      if (a4 && v41[5]) {
        *a4 = 1;
      }
      objc_super v23 = v34;
    }
  }
  else
  {
    id v11 = [(HUNearbyController *)self availableDevices];
    uint64_t v16 = [v11 objectAtIndex:v9];
    long long v17 = (void *)v41[5];
    v41[5] = v16;
  }
  id v27 = (id)v41[5];

  _Block_object_dispose(&v40, 8);

  return v27;
}

uint64_t __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 equalsToIdentifier:*(void *)(a1 + 32)];
}

uint64_t __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 idsDevice];
  uint64_t v4 = [v3 uniqueIDOverride];
  id v5 = [*(id *)(a1 + 32) uniqueIDOverride];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

void __61__HUNearbyController_nearbyDeviceWithIdentifier_justCreated___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [v6 descriptionForIDSDevice:v15];
  [v6 logMessageWithDomain:0, @"Checking %@ - %@", v7, v8 message];

  uint64_t v9 = [v15 uniqueID];
  if ([v9 isEqualToString:*(void *)(a1 + 40)])
  {
  }
  else
  {
    uint64_t v10 = (void *)IDSCopyIDForDevice();
    int v11 = [v10 containsString:*(void *)(a1 + 40)];

    if (!v11) {
      goto LABEL_5;
    }
  }
  uint64_t v12 = +[HUNearbyDevice nearbyDeviceWithIDSDevice:v15];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  [*(id *)(a1 + 32) logMessageWithDomain:0, @"Added device %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) message];
  *a4 = 1;
LABEL_5:
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v9 = a6;
  char v21 = 0;
  id v10 = a5;
  uint64_t v11 = [(HUNearbyController *)self nearbyDeviceWithIdentifier:v9 justCreated:&v21];
  uint64_t v12 = (void *)v11;
  if (v21) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    [(HUNearbyController *)self logMessageWithDomain:0, @"Incoming message creating: %@", v11 message];
    uint64_t v14 = [(HUNearbyController *)self availableDevices];
    id v15 = [v14 arrayByAddingObject:v12];
    [(HUNearbyController *)self setAvailableDevices:v15];

    v22[0] = v12;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    [(HUNearbyController *)self nearbyDevicesDidUpdateWithNewDevices:v16 forDomain:0];
  }
  [(HUNearbyController *)self logMessageWithDomain:0, @"Incoming message %@ - %@ - %@", v9, v10, v12 message];
  long long v17 = +[HUUtilities objectFromXDCObject:v10];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke;
  v19[3] = &unk_2640FE148;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 enumerateKeysAndObjectsUsingBlock:v19];
}

void __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__4;
  uint64_t v30 = __Block_byref_object_dispose__4;
  id v31 = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  char v21 = __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_2;
  v22 = &unk_2640FE0D0;
  uint64_t v25 = &v26;
  uint64_t v23 = v7;
  id v24 = v5;
  AX_PERFORM_WITH_LOCK();
  id v8 = [*(id *)(a1 + 32) domainQueues];
  id v9 = [v8 objectForKey:v24];

  id v10 = (void *)v27[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_3;
  v14[3] = &unk_2640FE120;
  id v11 = v9;
  id v15 = v11;
  id v16 = *(id *)(a1 + 40);
  id v12 = v6;
  id v17 = v12;
  id v13 = v24;
  id v18 = v13;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];

  _Block_object_dispose(&v26, 8);
}

void __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) messageUpdates];
  uint64_t v2 = [v6 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  id v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_4;
    block[3] = &unk_2640FE0F8;
    id v16 = v4;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v6, block);
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  uint64_t v7 = +[HUNearbySettings sharedInstance];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 40) idsDevice];
  uint64_t v11 = [v10 deviceType];
  id v12 = [*(id *)(a1 + 40) deviceTypeDescription];
  [v7 incomingIDSMessage:v9 domain:v8 deviceType:v11 deviceTypeDescription:v12];
}

uint64_t __69__HUNearbyController_service_account_incomingMessage_fromID_context___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  if (!a5 || a7 || !a6) {
    [(HUNearbyController *)self logMessageWithDomain:0, @"IDS didSendWithSuccess GUID %@, success %d, error: %@", a5, a6, a7 message];
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  [(HUNearbyController *)self logIDSDevices:v5 withTitle:@"Devices changed"];
  [(HUNearbyController *)self processIDSDevices:v5];
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
}

- (void)processIDSDevices:(id)a3
{
  id v4 = a3;
  [(HUNearbyController *)self logIDSDevices:v4 withTitle:@"Process IDS Devices"];
  id v5 = [(HUNearbyController *)self nearbyUpdatesQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HUNearbyController_processIDSDevices___block_invoke;
  v7[3] = &unk_2640FC938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__HUNearbyController_processIDSDevices___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldPublishNearbyUpdates];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 logMessageWithDomain:0 message:@"Publishing updates"];
    [*(id *)(a1 + 32) setHasPendingNearbyUpdates:0];
    [*(id *)(a1 + 32) setShouldPublishNearbyUpdates:0];
    id v4 = [MEMORY[0x263EFF980] array];
    id v5 = [MEMORY[0x263EFF980] array];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __40__HUNearbyController_processIDSDevices___block_invoke_2;
    v15[3] = &unk_2640FE170;
    id v6 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v5;
    id v17 = v4;
    id v7 = v4;
    id v8 = v5;
    [v6 enumerateObjectsUsingBlock:v15];
    [*(id *)(a1 + 32) setAvailableDevices:v7];
    [*(id *)(a1 + 32) nearbyDevicesDidUpdateWithNewDevices:v8 forDomain:0];
    [*(id *)(a1 + 32) logNearbyDevices:v7 withTitle:@"Saved devices"];
  }
  else
  {
    [v3 logMessageWithDomain:0 message:@"Pending updates. Skipping for now."];
    [*(id *)(a1 + 32) setHasPendingNearbyUpdates:1];
  }
  uint64_t v9 = [*(id *)(a1 + 32) nearbyHysteresisTimer];
  char v10 = [v9 isPending];

  if ((v10 & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v11 = [*(id *)(a1 + 32) nearbyHysteresisTimer];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__HUNearbyController_processIDSDevices___block_invoke_3;
    v12[3] = &unk_2640FDBA0;
    objc_copyWeak(&v13, &location);
    void v12[4] = *(void *)(a1 + 32);
    [v11 afterDelay:v12 processBlock:60.0];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __40__HUNearbyController_processIDSDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 uniqueID];

  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 descriptionForIDSDevice:v3];
    [v5 logMessageWithDomain:0, @"IDS device uniqueID is nil %@", v6 message];
  }
  char v10 = 0;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v3 uniqueID];
  uint64_t v9 = [v7 nearbyDeviceWithIdentifier:v8 justCreated:&v10];

  if (v10) {
    [*(id *)(a1 + 40) hcSafeAddObject:v9];
  }
  [*(id *)(a1 + 48) hcSafeAddObject:v9];
}

void __40__HUNearbyController_processIDSDevices___block_invoke_3(uint64_t a1)
{
  int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setShouldPublishNearbyUpdates:1];

  id v4 = objc_loadWeakRetained(v2);
  int v5 = [v4 hasPendingNearbyUpdates];

  if (v5)
  {
    [*(id *)(a1 + 32) logMessageWithDomain:0 message:@"Nearby Hysteresis Timer fired"];
    id v10 = objc_loadWeakRetained(v2);
    id v6 = [v10 service];
    id v7 = objc_loadWeakRetained(v2);
    id v8 = [v7 service];
    uint64_t v9 = [v8 devices];
    [v10 service:v6 devicesChanged:v9];
  }
}

- (void)nearbyDevicesDidUpdateWithNewDevices:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HUNearbyController *)self logNearbyDevices:v6 withTitle:@"New devices"];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke;
  id v18 = &unk_2640FD6A0;
  uint64_t v19 = self;
  uint64_t v20 = &v21;
  AX_PERFORM_WITH_LOCK();
  id v8 = (void *)v22[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_2;
  v11[3] = &unk_2640FE1C0;
  id v9 = v7;
  id v12 = v9;
  id v13 = self;
  id v10 = v6;
  id v14 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];

  _Block_object_dispose(&v21, 8);
}

uint64_t __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) discoveryUpdates];

  return MEMORY[0x270F9A758]();
}

void __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(a1 + 32) || objc_msgSend(v5, "isEqualToString:"))
  {
    id v7 = [*(id *)(a1 + 40) domainQueues];
    id v8 = [v7 objectForKey:v5];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_3;
    v10[3] = &unk_2640FE198;
    id v11 = v8;
    id v12 = *(id *)(a1 + 48);
    id v9 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  id v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_4;
    v7[3] = &unk_2640FCD88;
    id v9 = v4;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v6, v7);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, *(void *)(a1 + 40));
  }
}

uint64_t __69__HUNearbyController_nearbyDevicesDidUpdateWithNewDevices_forDomain___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
}

- (void)sendMessage:(id)a3 toDevicesWithDomain:(id)a4 withPriority:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HUNearbyController *)self nearbyUpdatesQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__HUNearbyController_sendMessage_toDevicesWithDomain_withPriority___block_invoke;
  v13[3] = &unk_2640FCE28;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __67__HUNearbyController_sendMessage_toDevicesWithDomain_withPriority___block_invoke(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v5 = [v2 availableDevices];
  [v2 sendMessage:v3 withDomain:v4 toDevices:v5 withPriority:a1[7]];
}

- (void)sendMessage:(id)a3 toWatchDevicesWithDomain:(id)a4 withPriority:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HUNearbyController *)self nearbyUpdatesQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__HUNearbyController_sendMessage_toWatchDevicesWithDomain_withPriority___block_invoke;
  v13[3] = &unk_2640FCE28;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __72__HUNearbyController_sendMessage_toWatchDevicesWithDomain_withPriority___block_invoke(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v5 = [v2 availableWatches];
  [v2 sendMessage:v3 withDomain:v4 toDevices:v5 withPriority:a1[7]];
}

- (void)sendMessage:(id)a3 toDevicesWithDomain:(id)a4 excludingState:(id)a5 withPriority:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HUNearbyController *)self nearbyUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HUNearbyController_sendMessage_toDevicesWithDomain_excludingState_withPriority___block_invoke;
  block[3] = &unk_2640FE210;
  void block[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  unint64_t v21 = a6;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __82__HUNearbyController_sendMessage_toDevicesWithDomain_excludingState_withPriority___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) availableDevices];
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __82__HUNearbyController_sendMessage_toDevicesWithDomain_excludingState_withPriority___block_invoke_2;
  id v7 = &unk_2640FE1E8;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "sendMessage:withDomain:toDevices:withPriority:", *(void *)(a1 + 56), *(void *)(a1 + 40), v3, *(void *)(a1 + 64), v4, v5, v6, v7);
}

uint64_t __82__HUNearbyController_sendMessage_toDevicesWithDomain_excludingState_withPriority___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stateForDomain:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 40)] ^ 1;

  return v4;
}

- (void)sendMessage:(id)a3 toWatchDevicesWithDomain:(id)a4 excludingState:(id)a5 withPriority:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HUNearbyController *)self nearbyUpdatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__HUNearbyController_sendMessage_toWatchDevicesWithDomain_excludingState_withPriority___block_invoke;
  block[3] = &unk_2640FE210;
  void block[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  unint64_t v21 = a6;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __87__HUNearbyController_sendMessage_toWatchDevicesWithDomain_excludingState_withPriority___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) availableWatches];
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __87__HUNearbyController_sendMessage_toWatchDevicesWithDomain_excludingState_withPriority___block_invoke_2;
  id v7 = &unk_2640FE1E8;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "sendMessage:withDomain:toDevices:withPriority:", *(void *)(a1 + 56), *(void *)(a1 + 40), v3, *(void *)(a1 + 64), v4, v5, v6, v7);
}

uint64_t __87__HUNearbyController_sendMessage_toWatchDevicesWithDomain_excludingState_withPriority___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stateForDomain:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 40)] ^ 1;

  return v4;
}

- (void)sendMessage:(id)a3 withDomain:(id)a4 toDevices:(id)a5 withPriority:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 count] && objc_msgSend(v11, "length") && objc_msgSend(v10, "count"))
  {
    id v13 = [(HUNearbyController *)self descriptionForPriority:a6];
    id v14 = [NSNumber numberWithInt:sendMessage_withDomain_toDevices_withPriority__MessageCount];
    [(HUNearbyController *)self logMessageWithDomain:v11, @"IDS Sending(%@) %@ to %@ with %@, priority: %@", v14, v10, v12, v11, v13 message];

    int v15 = sendMessage_withDomain_toDevices_withPriority__MessageCount++;
    id v16 = [(HUNearbyController *)self nearbyUpdatesQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__HUNearbyController_sendMessage_withDomain_toDevices_withPriority___block_invoke;
    block[3] = &unk_2640FE260;
    id v19 = v10;
    unint64_t v24 = a6;
    id v20 = v11;
    id v21 = v13;
    id v22 = v12;
    uint64_t v23 = self;
    int v25 = v15;
    id v17 = v13;
    dispatch_async(v16, block);
  }
}

void __68__HUNearbyController_sendMessage_withDomain_toDevices_withPriority___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  int v2 = +[HUNearbySettings sharedInstance];
  [v2 sentIDSMessage:*(void *)(a1 + 32) domain:*(void *)(a1 + 40) priority:*(void *)(a1 + 72) priorityDescription:*(void *)(a1 + 48)];

  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  uint64_t v4 = *(void **)(a1 + 56);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__HUNearbyController_sendMessage_withDomain_toDevices_withPriority___block_invoke_2;
  v19[3] = &unk_2640FE238;
  id v5 = v3;
  id v20 = v5;
  [v4 enumerateObjectsUsingBlock:v19];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 40);
  v22[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  if (*(void *)(a1 + 72) == 2)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F30]];
    [v8 setObject:&unk_26C1E56F0 forKeyedSubscript:*MEMORY[0x263F49F50]];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [*(id *)(a1 + 64) service];
  id v10 = +[HUUtilities XDCObjectFromObject:v7];
  if ((unint64_t)(*(void *)(a1 + 72) - 1) >= 2) {
    uint64_t v11 = 200;
  }
  else {
    uint64_t v11 = 300;
  }
  id v17 = 0;
  id v18 = 0;
  [v9 sendMessage:v10 toDestinations:v5 priority:v11 options:v8 identifier:&v18 error:&v17];
  id v12 = v18;
  id v13 = v17;

  if (v13) {
    [*(id *)(a1 + 64) logMessageWithDomain:*(void *)(a1 + 40), @"Error sending %@", v13 message];
  }
  if (v12)
  {
    id v14 = *(void **)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
    [v14 logMessageWithDomain:v15, @"IDS sent message: %@, GUID: %@", v16, v12 message];
  }
}

void __68__HUNearbyController_sendMessage_withDomain_toDevices_withPriority___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

- (void)registerBlock:(id)a3 forKey:(id)a4 withUpdateGroup:(id)a5 forDomain:(id)a6 withListener:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
    id v18 = v13;
    id v19 = v14;
    id v20 = v11;
    id v21 = v12;
    AX_PERFORM_WITH_LOCK();
  }
}

void __82__HUNearbyController_registerBlock_forKey_withUpdateGroup_forDomain_withListener___block_invoke(uint64_t a1)
{
  id v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) objectForKey:*(void *)(a1 + 48)];
  if (!v2) {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v3 = *(void **)(a1 + 56);
  if (v3)
  {
    uint64_t v4 = (void *)[v3 copy];
    [v2 setObject:v4 forKey:v6];

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUNearbyControllerDestructionHelperKey);
    id v5 = (HUNearbyListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      id v5 = [[HUNearbyListenerHelper alloc] initWithListenerAddress:*(void *)(a1 + 32) andDelegate:*(void *)(a1 + 64)];
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUNearbyControllerDestructionHelperKey, v5, (void *)1);
    }
    [(HUNearbyListenerHelper *)v5 addKey:*(void *)(a1 + 72) forDomain:*(void *)(a1 + 48)];
  }
  else
  {
    [v2 removeObjectForKey:v6];
  }
  [*(id *)(a1 + 40) setObject:v2 forKey:*(void *)(a1 + 48)];
}

- (void)registerQueue:(id)a3 forDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUNearbyController *)self domainQueues];
  [v8 setObject:v7 forKey:v6];
}

- (void)registerLoggingBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)MEMORY[0x2105575F0](a3);
  [(HUNearbyController *)self registerBlock:v10 forKey:@"HUNearbyControllerLoggingKey" withUpdateGroup:self->_loggingUpdates forDomain:v9 withListener:v8];
}

- (void)registerDiscoveryBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)MEMORY[0x2105575F0](a3);
  [(HUNearbyController *)self registerBlock:v10 forKey:@"HUNearbyControllerDiscoveryKey" withUpdateGroup:self->_discoveryUpdates forDomain:v9 withListener:v8];
}

- (void)registerMessageBlock:(id)a3 forDomain:(id)a4 withListener:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)MEMORY[0x2105575F0](a3);
  [(HUNearbyController *)self registerBlock:v10 forKey:@"HUNearbyControllerMessageKey" withUpdateGroup:self->_messageUpdates forDomain:v9 withListener:v8];
}

- (OS_dispatch_queue)nearbyUpdatesQueue
{
  return self->_nearbyUpdatesQueue;
}

- (void)setNearbyUpdatesQueue:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)domainQueues
{
  return self->_domainQueues;
}

- (void)setDomainQueues:(id)a3
{
}

- (NSMutableArray)registeredDomains
{
  return self->_registeredDomains;
}

- (void)setRegisteredDomains:(id)a3
{
}

- (NSMutableDictionary)loggingUpdates
{
  return self->_loggingUpdates;
}

- (void)setLoggingUpdates:(id)a3
{
}

- (NSMutableDictionary)messageUpdates
{
  return self->_messageUpdates;
}

- (void)setMessageUpdates:(id)a3
{
}

- (NSMutableDictionary)discoveryUpdates
{
  return self->_discoveryUpdates;
}

- (void)setDiscoveryUpdates:(id)a3
{
}

- (AXDispatchTimer)nearbyHysteresisTimer
{
  return self->_nearbyHysteresisTimer;
}

- (void)setNearbyHysteresisTimer:(id)a3
{
}

- (BOOL)shouldPublishNearbyUpdates
{
  return self->_shouldPublishNearbyUpdates;
}

- (void)setShouldPublishNearbyUpdates:(BOOL)a3
{
  self->_shouldPublishNearbyUpdates = a3;
}

- (BOOL)hasPendingNearbyUpdates
{
  return self->_hasPendingNearbyUpdates;
}

- (void)setHasPendingNearbyUpdates:(BOOL)a3
{
  self->_hasPendingNearbyUpdates = a3;
}

- (AXDispatchTimer)startTimer
{
  return self->_startTimer;
}

- (void)setStartTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTimer, 0);
  objc_storeStrong((id *)&self->_nearbyHysteresisTimer, 0);
  objc_storeStrong((id *)&self->_discoveryUpdates, 0);
  objc_storeStrong((id *)&self->_messageUpdates, 0);
  objc_storeStrong((id *)&self->_loggingUpdates, 0);
  objc_storeStrong((id *)&self->_registeredDomains, 0);
  objc_storeStrong((id *)&self->_domainQueues, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_nearbyUpdatesQueue, 0);
  objc_storeStrong((id *)&self->_availableWatches, 0);

  objc_storeStrong((id *)&self->_availableDevices, 0);
}

@end
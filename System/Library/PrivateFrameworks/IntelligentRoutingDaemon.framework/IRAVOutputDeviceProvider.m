@interface IRAVOutputDeviceProvider
- (IRAVOutputDeviceDiscoverySessionController)discoverySessionController;
- (IRAVOutputDeviceProvider)init;
- (NSHashTable)observers;
- (NSSet)availableOutputDevices;
- (NSSet)cachedDevices;
- (OS_dispatch_queue)queue;
- (id)_logDevicesString:(id)a3;
- (void)addObserver:(id)a3;
- (void)didUpdateAVOutputDevices:(id)a3;
- (void)logActiveDevices;
- (void)removeObserver:(id)a3;
- (void)setCachedDevices:(id)a3;
- (void)setDiscoverySessionController:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IRAVOutputDeviceProvider

void __53__IRAVOutputDeviceProvider_didUpdateAVOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 cachedDevices];
  char v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)[*(id *)(a1 + 32) copy];
    [v3 setCachedDevices:v6];

    v7 = [v3 cachedDevices];
    v8 = (void *)[v7 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = objc_msgSend(v3, "observers", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v13++) provider:v3 didUpdateAVOutputDevices:v8];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v11);
    }

    v14 = (void *)*MEMORY[0x263F500A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = v14;
      v17 = [v3 _logDevicesString:v15];
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_25418E000, v16, OS_LOG_TYPE_DEFAULT, "#avod-provider, %@", buf, 0xCu);
    }
  }
}

- (NSSet)cachedDevices
{
  return self->_cachedDevices;
}

- (void)didUpdateAVOutputDevices:(id)a3
{
  id v4 = a3;
  char v5 = [(IRAVOutputDeviceProvider *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__IRAVOutputDeviceProvider_didUpdateAVOutputDevices___block_invoke;
  v7[3] = &unk_2653A05E8;
  id v8 = v4;
  id v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IRAVOutputDeviceProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)IRAVOutputDeviceProvider;
  v2 = [(IRAVOutputDeviceProvider *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.intelligentroutingd.IRAVOutputDeviceProvider", v3);
    [(IRAVOutputDeviceProvider *)v2 setQueue:v4];

    char v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(IRAVOutputDeviceProvider *)v2 setObservers:v5];

    id v6 = objc_alloc_init(MEMORY[0x263EFFA08]);
    [(IRAVOutputDeviceProvider *)v2 setCachedDevices:v6];
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  char v5 = [(IRAVOutputDeviceProvider *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__IRAVOutputDeviceProvider_addObserver___block_invoke;
  v7[3] = &unk_2653A05E8;
  id v8 = v4;
  id v6 = v4;
  IRDispatchSyncWithStrongSelf(v5, self, v7);
}

void __40__IRAVOutputDeviceProvider_addObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 observers];
  char v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if ((v5 & 1) == 0)
  {
    id v6 = [v3 observers];
    [v6 addObject:*(void *)(a1 + 32)];

    v7 = [v3 observers];
    id v8 = [v7 allObjects];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      uint64_t v10 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      uint64_t v11 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        v17 = "#avod-provider, ";
        __int16 v18 = 2112;
        long long v19 = v10;
        _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_INFO, "%s[%@], Registering for output devices notification", (uint8_t *)&v16, 0x16u);
      }

      uint64_t v12 = [v3 discoverySessionController];
      [v12 registerForAvailableOutputDevicesNotification];
    }
    uint64_t v13 = *(void **)(a1 + 32);
    v14 = [v3 cachedDevices];
    uint64_t v15 = (void *)[v14 copy];
    [v13 provider:v3 didUpdateAVOutputDevices:v15];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  char v5 = [(IRAVOutputDeviceProvider *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__IRAVOutputDeviceProvider_removeObserver___block_invoke;
  v7[3] = &unk_2653A05E8;
  id v8 = v4;
  id v6 = v4;
  IRDispatchSyncWithStrongSelf(v5, self, v7);
}

void __43__IRAVOutputDeviceProvider_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 observers];
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = [v3 observers];
    [v6 removeObject:*(void *)(a1 + 32)];

    v7 = [v3 observers];
    id v8 = [v7 allObjects];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      uint64_t v10 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      uint64_t v11 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        int v13 = 136315394;
        v14 = "#avod-provider, ";
        __int16 v15 = 2112;
        int v16 = v10;
        _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_INFO, "%s[%@], Unregistering for output devices notification", (uint8_t *)&v13, 0x16u);
      }

      uint64_t v12 = [v3 discoverySessionController];
      [v12 unregisterForAvailableOutputDevicesNotification];
    }
  }
}

- (void)logActiveDevices
{
  id v3 = [(IRAVOutputDeviceProvider *)self queue];
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_14);
}

void __44__IRAVOutputDeviceProvider_logActiveDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = a2;
    id v6 = [v5 cachedDevices];
    v7 = [v5 _logDevicesString:v6];

    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "#avod-provider, %@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)_logDevicesString:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __46__IRAVOutputDeviceProvider__logDevicesString___block_invoke;
  int v13 = &unk_2653A0630;
  id v14 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:&v10];

  id v6 = NSString;
  v7 = [v5 componentsJoinedByString:@"\n"];
  int v8 = [v6 stringWithFormat:@"AVOD Active Devices:\n%@", v7, v10, v11, v12, v13];

  return v8;
}

void __46__IRAVOutputDeviceProvider__logDevicesString___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSString;
  id v4 = a2;
  id v13 = [v4 deviceID];
  id v5 = [v4 modelID];
  id v6 = [v4 deviceName];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "discoveredOverInfra"));
  int v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "hasAirplayProperties"));
  uint64_t v9 = IRAVOutputDeviceTypeToString([v4 deviceType]);
  unint64_t v10 = [v4 deviceSubType];

  uint64_t v11 = IRAVOutputDeviceSubTypeToString(v10);
  uint64_t v12 = [v3 stringWithFormat:@"ID: %@, model: %@, name: %@, infra: %@, hasAirplay: %@, type: %@, subtype: %@", v13, v5, v6, v7, v8, v9, v11];
  [v2 addObject:v12];
}

- (NSSet)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (IRAVOutputDeviceDiscoverySessionController)discoverySessionController
{
  return self->_discoverySessionController;
}

- (void)setDiscoverySessionController:(id)a3
{
}

- (void)setCachedDevices:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedDevices, 0);
  objc_storeStrong((id *)&self->_discoverySessionController, 0);

  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
}

@end
@interface HUAccessoryManager
+ (HUAccessoryManager)sharedInstance;
- (CBCentralManager)centralManager;
- (CBController)bluetoothController;
- (CBDiscovery)bluetoothDiscovery;
- (HUAccessoryManager)init;
- (NSArray)peripherals;
- (NSMutableArray)registeredCharacteristics;
- (NSMutableDictionary)audioOwnershipByAddress;
- (NSMutableDictionary)bluetoothStateUpdates;
- (NSMutableDictionary)discoveryUpdates;
- (NSMutableDictionary)loggingUpdates;
- (NSMutableDictionary)updateUpdates;
- (NSString)localBluetoothAddress;
- (OS_dispatch_queue)bluetoothCentralQueue;
- (id)availableAddresses;
- (id)availableAddressesWithCharacteristicSupport:(id)a3;
- (id)characteristicWithUUID:(id)a3 forPeripheral:(id)a4;
- (id)identifierFromBluetoothAddress:(id)a3;
- (id)sharedQueue;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)discoverAccessories;
- (void)getAddressesFromIdentifiers:(id)a3 withCompletion:(id)a4;
- (void)getAudioOwnershipForAddress:(id)a3 withCompletion:(id)a4;
- (void)getAvailableAddressesSupportingCharacteristic:(id)a3 withCompletion:(id)a4;
- (void)getBluetoothState:(id)a3;
- (void)getIdentifiersFromAddresses:(id)a3 withCompletion:(id)a4;
- (void)logMessage:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)readValueForCharacteristicUUID:(id)a3;
- (void)registerBluetoothStateBlock:(id)a3 withListener:(id)a4;
- (void)registerDiscoveryBlock:(id)a3 withListener:(id)a4;
- (void)registerLoggingBlock:(id)a3 withListener:(id)a4;
- (void)registerUpdateBlock:(id)a3 forCharacteristicUUIDs:(id)a4 withListener:(id)a5;
- (void)removeDiscoveredAccessories;
- (void)setAudioOwnershipByAddress:(id)a3;
- (void)setBluetoothCentralQueue:(id)a3;
- (void)setBluetoothController:(id)a3;
- (void)setBluetoothDiscovery:(id)a3;
- (void)setBluetoothStateUpdates:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setDiscoveryUpdates:(id)a3;
- (void)setLocalBluetoothAddress:(id)a3;
- (void)setLoggingUpdates:(id)a3;
- (void)setNotify:(BOOL)a3 forCharacteristicUUIDs:(id)a4;
- (void)setPeripherals:(id)a3;
- (void)setRegisteredCharacteristics:(id)a3;
- (void)setUpdateUpdates:(id)a3;
- (void)setupBluetoothController;
- (void)updateBluetoothAvailability;
- (void)updateNotify:(BOOL)a3 forPeripheral:(id)a4 withCharacteristicUUIDs:(id)a5;
- (void)writeValue:(id)a3 forCharacteristicUUID:(id)a4 andAddress:(id)a5;
@end

@implementation HUAccessoryManager

void __33__HUAccessoryManager_logMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = (void (**)(void, void))MEMORY[0x2105575F0](a3);
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, *(void *)(a1 + 32));
    v4 = (void (**)(void, void))v5;
  }
}

uint64_t __65__HUAccessoryManager_getAudioOwnershipForAddress_withCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) audioOwnershipByAddress];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  v6 = [NSNumber numberWithBool:v4];
  [v5 logMessage:@"Found audio ownership %@ for address %@", v6, *(void *)(a1 + 40)];

  v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v7();
}

uint64_t __33__HUAccessoryManager_logMessage___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];

  return MEMORY[0x270F9A758]();
}

- (void)logMessage:(id)a3
{
  id v4 = a3;
  v22 = &v23;
  id v5 = (void *)[[NSString alloc] initWithFormat:v4 locale:0 arguments:&v23];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __33__HUAccessoryManager_logMessage___block_invoke;
  v13 = &unk_2640FD6A0;
  v14 = self;
  v15 = &v16;
  AX_PERFORM_WITH_LOCK();
  v6 = (void *)v17[5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__HUAccessoryManager_logMessage___block_invoke_2;
  v8[3] = &unk_2640FCDB0;
  id v7 = v5;
  id v9 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  _Block_object_dispose(&v16, 8);
}

- (void)getAudioOwnershipForAddress:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__HUAccessoryManager_getAudioOwnershipForAddress_withCompletion___block_invoke;
    block[3] = &unk_2640FD7E0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(bluetoothCentralQueue, block);
  }
}

- (NSMutableDictionary)audioOwnershipByAddress
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

+ (HUAccessoryManager)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_AccessoryManager;

  return (HUAccessoryManager *)v2;
}

uint64_t __36__HUAccessoryManager_sharedInstance__block_invoke()
{
  sharedInstance_AccessoryManager = objc_alloc_init(HUAccessoryManager);

  return MEMORY[0x270F9A758]();
}

- (HUAccessoryManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)HUAccessoryManager;
  v2 = [(HUAccessoryManager *)&v24 init];
  v3 = v2;
  if (v2)
  {
    v2->_syncLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F472B0] bluetoothManagerQueue];
    bluetoothCentralQueue = v3->_bluetoothCentralQueue;
    v3->_bluetoothCentralQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(MEMORY[0x263EFEF00]);
    id v7 = v3->_bluetoothCentralQueue;
    v8 = NSDictionary;
    id v9 = [NSNumber numberWithBool:1];
    id v10 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x263EFED30], 0);
    uint64_t v11 = [v6 initWithDelegate:v3 queue:v7 options:v10];
    centralManager = v3->_centralManager;
    v3->_centralManager = (CBCentralManager *)v11;

    v13 = v3->_bluetoothCentralQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__HUAccessoryManager_init__block_invoke;
    block[3] = &unk_2640FC960;
    v14 = v3;
    uint64_t v23 = v14;
    dispatch_async(v13, block);
    v15 = [MEMORY[0x263EFF980] array];
    [(HUAccessoryManager *)v14 setRegisteredCharacteristics:v15];

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUAccessoryManager *)v14 setLoggingUpdates:v16];

    v17 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUAccessoryManager *)v14 setUpdateUpdates:v17];

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUAccessoryManager *)v14 setDiscoveryUpdates:v18];

    v19 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUAccessoryManager *)v14 setBluetoothStateUpdates:v19];

    v20 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUAccessoryManager *)v14 setAudioOwnershipByAddress:v20];

    [(HUAccessoryManager *)v14 setupBluetoothController];
  }
  return v3;
}

uint64_t __26__HUAccessoryManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBluetoothAvailability];
}

- (id)sharedQueue
{
  return self->_bluetoothCentralQueue;
}

- (void)registerLoggingBlock:(id)a3 withListener:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = v5;
    AX_PERFORM_WITH_LOCK();
  }
}

void __56__HUAccessoryManager_registerLoggingBlock_withListener___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 64);
  id v7 = (id)v2;
  if (v3)
  {
    id v5 = (void *)[v3 copy];
    [v4 setObject:v5 forKey:v7];

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey);
    id v6 = (HUAccessoryListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      id v6 = [[HUAccessoryListenerHelper alloc] initWithListenerAddress:*(void *)(a1 + 32) andDelegate:*(void *)(a1 + 40)];
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey, v6, (void *)1);
    }
    [(HUAccessoryListenerHelper *)v6 addKey:@"HUAccessoryManagerLoggingKey"];
  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:");
  }
}

- (void)updateNotify:(BOOL)a3 forPeripheral:(id)a4 withCharacteristicUUIDs:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 services];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__HUAccessoryManager_updateNotify_forPeripheral_withCharacteristicUUIDs___block_invoke;
  v13[3] = &unk_2640FD718;
  id v14 = v9;
  v15 = self;
  BOOL v17 = a3;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  [v10 enumerateObjectsUsingBlock:v13];
}

void __73__HUAccessoryManager_updateNotify_forPeripheral_withCharacteristicUUIDs___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 characteristics];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__HUAccessoryManager_updateNotify_forPeripheral_withCharacteristicUUIDs___block_invoke_2;
  v7[3] = &unk_2640FD6F0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  char v11 = *(unsigned char *)(a1 + 56);
  id v10 = v6;
  [v3 enumerateObjectsUsingBlock:v7];
}

void __73__HUAccessoryManager_updateNotify_forPeripheral_withCharacteristicUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  uint64_t v5 = [v3 UUID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    [*(id *)(a1 + 40) logMessage:@"Setting notify %d for peripheral: %@ - %@", *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48), v6];
    [*(id *)(a1 + 48) setNotifyValue:*(unsigned __int8 *)(a1 + 56) forCharacteristic:v6];
  }
}

- (void)setNotify:(BOOL)a3 forCharacteristicUUIDs:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke;
    block[3] = &unk_2640FD790;
    BOOL v11 = a3;
    id v9 = v6;
    id v10 = self;
    dispatch_async(bluetoothCentralQueue, block);
  }
}

void __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke_2;
    v10[3] = &unk_2640FD740;
    uint64_t v2 = *(void **)(a1 + 32);
    v10[4] = *(void *)(a1 + 40);
    [v2 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) registeredCharacteristics];
    [v3 removeObjectsInArray:*(void *)(a1 + 32)];
  }
  id v4 = [*(id *)(a1 + 40) peripherals];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke_3;
  v7[3] = &unk_2640FD768;
  char v9 = *(unsigned char *)(a1 + 48);
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  [v4 enumerateObjectsUsingBlock:v7];
}

void __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) registeredCharacteristics];
  char v4 = [v3 containsObject:v6];

  if ((v4 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) registeredCharacteristics];
    [v5 addObject:v6];
  }
}

uint64_t __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateNotify:*(unsigned __int8 *)(a1 + 48) forPeripheral:a2 withCharacteristicUUIDs:*(void *)(a1 + 40)];
}

- (void)registerUpdateBlock:(id)a3 forCharacteristicUUIDs:(id)a4 withListener:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    [(HUAccessoryManager *)self setNotify:v8 != 0 forCharacteristicUUIDs:a4];
    id v10 = v9;
    id v11 = v8;
    AX_PERFORM_WITH_LOCK();
  }
}

void __78__HUAccessoryManager_registerUpdateBlock_forCharacteristicUUIDs_withListener___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 48);
  char v4 = *(void **)(*(void *)(a1 + 40) + 72);
  id v7 = (id)v2;
  if (v3)
  {
    id v5 = (void *)[v3 copy];
    [v4 setObject:v5 forKey:v7];

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey);
    id v6 = (HUAccessoryListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      id v6 = [[HUAccessoryListenerHelper alloc] initWithListenerAddress:*(void *)(a1 + 32) andDelegate:*(void *)(a1 + 40)];
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey, v6, (void *)1);
    }
    [(HUAccessoryListenerHelper *)v6 addKey:@"HUAccessoryManagerUpdateKey"];
  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:");
  }
}

- (void)registerDiscoveryBlock:(id)a3 withListener:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = v5;
    AX_PERFORM_WITH_LOCK();
  }
}

void __58__HUAccessoryManager_registerDiscoveryBlock_withListener___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 48);
  char v4 = *(void **)(*(void *)(a1 + 40) + 80);
  id v7 = (id)v2;
  if (v3)
  {
    id v5 = (void *)[v3 copy];
    [v4 setObject:v5 forKey:v7];

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey);
    id v6 = (HUAccessoryListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      id v6 = [[HUAccessoryListenerHelper alloc] initWithListenerAddress:*(void *)(a1 + 32) andDelegate:*(void *)(a1 + 40)];
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey, v6, (void *)1);
    }
    [(HUAccessoryListenerHelper *)v6 addKey:@"HUAccessoryManagerDiscoveryKey"];
  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:");
  }
}

- (void)registerBluetoothStateBlock:(id)a3 withListener:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = v5;
    AX_PERFORM_WITH_LOCK();
  }
}

void __63__HUAccessoryManager_registerBluetoothStateBlock_withListener___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 48);
  char v4 = *(void **)(*(void *)(a1 + 40) + 88);
  id v7 = (id)v2;
  if (v3)
  {
    id v5 = (void *)[v3 copy];
    [v4 setObject:v5 forKey:v7];

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey);
    id v6 = (HUAccessoryListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      id v6 = [[HUAccessoryListenerHelper alloc] initWithListenerAddress:*(void *)(a1 + 32) andDelegate:*(void *)(a1 + 40)];
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey, v6, (void *)1);
    }
    [(HUAccessoryListenerHelper *)v6 addKey:@"HUAccessoryManagerBluetoothStateKey"];
  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:");
  }
}

- (void)getBluetoothState:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__HUAccessoryManager_getBluetoothState___block_invoke;
    v7[3] = &unk_2640FCD88;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(bluetoothCentralQueue, v7);
  }
}

uint64_t __40__HUAccessoryManager_getBluetoothState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 9));
}

- (NSArray)peripherals
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSArray *)v2->_peripherals copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setPeripherals:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  peripherals = v4->_peripherals;
  v4->_peripherals = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)getAvailableAddressesSupportingCharacteristic:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__HUAccessoryManager_getAvailableAddressesSupportingCharacteristic_withCompletion___block_invoke;
    block[3] = &unk_2640FD7E0;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(bluetoothCentralQueue, block);
  }
}

void __83__HUAccessoryManager_getAvailableAddressesSupportingCharacteristic_withCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = [MEMORY[0x263EFEF88] UUIDWithString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [*(id *)(a1 + 40) peripherals];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __83__HUAccessoryManager_getAvailableAddressesSupportingCharacteristic_withCompletion___block_invoke_2;
  id v12 = &unk_2640FD7B8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = v2;
  id v16 = v3;
  id v7 = v3;
  id v8 = v2;
  [v4 enumerateObjectsUsingBlock:&v9];

  [*(id *)(a1 + 40) logMessage:@"Found identifiers for %@ = %@", *(void *)(a1 + 32), v7, v9, v10, v11, v12];
  [*(id *)(a1 + 40) getAddressesFromIdentifiers:v7 withCompletion:*(void *)(a1 + 48)];
}

void __83__HUAccessoryManager_getAvailableAddressesSupportingCharacteristic_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (![*(id *)(a1 + 32) length]
    || ([*(id *)(a1 + 40) characteristicWithUUID:*(void *)(a1 + 48) forPeripheral:v7],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = *(void **)(a1 + 56);
    id v5 = [v7 identifier];
    uint64_t v6 = [v5 UUIDString];
    [v4 hcSafeAddObject:v6];
  }
}

- (void)getIdentifiersFromAddresses:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke;
    block[3] = &unk_2640FD7E0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(bluetoothCentralQueue, block);
  }
}

void __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke(id *a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  id v3 = [a1[4] bluetoothController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke_2;
  v5[3] = &unk_2640FD830;
  id v6 = a1[5];
  id v7 = v2;
  id v8 = a1[4];
  id v9 = a1[6];
  id v4 = v2;
  [v3 getDevicesWithFlags:0 completionHandler:v5];
}

void __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke_3;
  v4[3] = &unk_2640FD808;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 enumerateObjectsUsingBlock:v4];
  [*(id *)(a1 + 48) logMessage:@"Found identifiers %@", *(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v9 = v3;
  id v5 = [v3 btAddressData];
  id v6 = CUPrintNSDataAddress();
  LODWORD(v4) = [v4 containsObject:v6];

  if (v4)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v9 identifier];
    [v7 hcSafeAddObject:v8];
  }
}

- (void)getAddressesFromIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke;
    block[3] = &unk_2640FD7E0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(bluetoothCentralQueue, block);
  }
}

void __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke(id *a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  id v3 = [a1[4] bluetoothController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke_2;
  v5[3] = &unk_2640FD830;
  id v6 = a1[5];
  id v7 = v2;
  id v8 = a1[4];
  id v9 = a1[6];
  id v4 = v2;
  [v3 getDevicesWithFlags:0 completionHandler:v5];
}

void __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke_3;
  v4[3] = &unk_2640FD808;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 enumerateObjectsUsingBlock:v4];
  [*(id *)(a1 + 48) logMessage:@"Found addresses %@", *(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v9 = v3;
  id v5 = [v3 identifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v9 btAddressData];
    id v8 = CUPrintNSDataAddress();
    [v6 hcSafeAddObject:v8];
  }
}

- (void)readValueForCharacteristicUUID:(id)a3
{
  id v4 = a3;
  bluetoothCentralQueue = self->_bluetoothCentralQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke;
  v7[3] = &unk_2640FC938;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(bluetoothCentralQueue, v7);
}

void __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) peripherals];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_2;
  v3[3] = &unk_2640FD858;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 services];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_3;
  v6[3] = &unk_2640FD180;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_4;
  v4[3] = &unk_2640FD158;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 UUID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    [*(id *)(a1 + 40) readValueForCharacteristic:v8];
    *a4 = 1;
  }
}

- (void)writeValue:(id)a3 forCharacteristicUUID:(id)a4 andAddress:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length]
    && [v10 length]
    && ([v9 UUIDString],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 length],
        v11,
        v12))
  {
    v18[0] = v10;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66__HUAccessoryManager_writeValue_forCharacteristicUUID_andAddress___block_invoke;
    v14[3] = &unk_2640FD880;
    v14[4] = self;
    id v15 = v9;
    id v16 = v8;
    id v17 = v10;
    [(HUAccessoryManager *)self getIdentifiersFromAddresses:v13 withCompletion:v14];
  }
  else
  {
    [(HUAccessoryManager *)self logMessage:@"Skipping write request. Missing value %@, %@ = %@", v10, v9, v8];
  }
}

void __66__HUAccessoryManager_writeValue_forCharacteristicUUID_andAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  uint64_t v4 = [v3 length];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 peripherals];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__HUAccessoryManager_writeValue_forCharacteristicUUID_andAddress___block_invoke_2;
    v10[3] = &unk_2640FD7B8;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    id v14 = *(id *)(a1 + 48);
    [v6 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    [v5 logMessage:@"Skipping write request. No identifier found for %@", *(void *)(a1 + 56)];
  }
}

void __66__HUAccessoryManager_writeValue_forCharacteristicUUID_andAddress___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 identifier];
  id v7 = [v6 UUIDString];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) characteristicWithUUID:*(void *)(a1 + 48) forPeripheral:v10];
    [*(id *)(a1 + 40) logMessage:@"Writing %@ to %@ - %@", v9, v10, *(void *)(a1 + 56)];
    if (v9) {
      [v10 writeValue:*(void *)(a1 + 56) forCharacteristic:v9 type:1];
    }
    else {
      [*(id *)(a1 + 40) logMessage:@"Error: Could not write nil characteristic %@ - %@, %@", v10, *(void *)(a1 + 56), *(void *)(a1 + 48)];
    }
    *a4 = 1;
  }
}

- (void)updateBluetoothAvailability
{
  unint64_t v3 = [(CBController *)self->_bluetoothController bluetoothState];
  int bluetoothAvailable = self->_bluetoothAvailable;
  int v5 = v3 == 5;
  self->_int bluetoothAvailable = v5;
  if (v3 > 0xA) {
    id v6 = "?";
  }
  else {
    id v6 = off_2640FDAA8[v3];
  }
  [(HUAccessoryManager *)self logMessage:@"Updating BT state %s", v6];
  if (self->_bluetoothAvailable) {
    [(HUAccessoryManager *)self discoverAccessories];
  }
  else {
    [(HUAccessoryManager *)self removeDiscoveredAccessories];
  }
  if (bluetoothAvailable != v5)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__1;
    id v13 = __Block_byref_object_dispose__1;
    id v14 = 0;
    v8[5] = MEMORY[0x263EF8330];
    v8[6] = 3221225472;
    v8[7] = __49__HUAccessoryManager_updateBluetoothAvailability__block_invoke;
    v8[8] = &unk_2640FD6A0;
    v8[9] = self;
    v8[10] = &v9;
    AX_PERFORM_WITH_LOCK();
    id v7 = (void *)v10[5];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__HUAccessoryManager_updateBluetoothAvailability__block_invoke_2;
    v8[3] = &unk_2640FD8A8;
    void v8[4] = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __49__HUAccessoryManager_updateBluetoothAvailability__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 88) copy];

  return MEMORY[0x270F9A758]();
}

uint64_t __49__HUAccessoryManager_updateBluetoothAvailability__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(unsigned __int8 *)(*(void *)(a1 + 32) + 9));
}

- (void)setupBluetoothController
{
  bluetoothCentralQueue = self->_bluetoothCentralQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(bluetoothCentralQueue, block);
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = objc_alloc_init(MEMORY[0x263EFEF18]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(a1 + 32) + 40) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 40);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_2;
  v22[3] = &unk_2640FD8D0;
  v22[4] = v5;
  objc_copyWeak(&v23, &location);
  [v6 getControllerInfoWithCompletion:v22];
  id v7 = *(void **)(*(void *)(a1 + 32) + 40);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_3;
  v20[3] = &unk_2640FC910;
  objc_copyWeak(&v21, &location);
  [v7 setBluetoothStateChangedHandler:v20];
  int v8 = *(void **)(*(void *)(a1 + 32) + 40);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_4;
  v18[3] = &unk_2640FD8F8;
  objc_copyWeak(&v19, &location);
  [v8 activateWithCompletion:v18];
  id v9 = objc_alloc_init(MEMORY[0x263EFEF30]);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v9;

  [*(id *)(*(void *)(a1 + 32) + 48) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  [*(id *)(*(void *)(a1 + 32) + 48) setDiscoveryFlags:0x80000200000];
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 48);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_5;
  v16[3] = &unk_2640FD920;
  objc_copyWeak(&v17, &location);
  [v12 setDeviceFoundHandler:v16];
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 48);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_8;
  v15[3] = &unk_2640FD948;
  v15[4] = v13;
  [v14 activateWithCompletion:v15];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) logMessage:@"Error getting controller info"];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [v8 hardwareAddressData];
    id v7 = CUPrintNSDataAddress();
    [WeakRetained setLocalBluetoothAddress:v7];
  }
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateBluetoothAvailability];
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained logMessage:@"Activated bluetooth controller with error %@", v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 updateBluetoothAvailability];
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [v3 btAddressData];
  id v7 = CUPrintNSDataAddress();

  char v8 = [v3 deviceFlags];
  uint64_t v9 = [v7 length];
  id v10 = objc_loadWeakRetained(v4);
  uint64_t v11 = v10;
  if (v9)
  {
    unint64_t v12 = v8 & 0x40;
    uint64_t v13 = [v10 audioOwnershipByAddress];
    id v14 = [v13 objectForKey:v7];

    if ([v14 BOOLValue] != (v12 >> 6))
    {
      BOOL v15 = v12 != 0;
      id v16 = objc_loadWeakRetained(v4);
      id v17 = [NSNumber numberWithBool:v15];
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "deviceFlags"));
      [v16 logMessage:@"Found discovery audio ownership %@ - %@ = %@", v17, v18, v7];

      id v19 = objc_loadWeakRetained(v4);
      v20 = [v19 audioOwnershipByAddress];
      id v21 = [NSNumber numberWithBool:v15];
      [v20 setObject:v21 forKey:v7];

      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__1;
      v35 = __Block_byref_object_dispose__1;
      id v36 = 0;
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      v27 = __46__HUAccessoryManager_setupBluetoothController__block_invoke_6;
      v28 = &unk_2640FD6A0;
      id v29 = WeakRetained;
      v30 = &v31;
      AX_PERFORM_WITH_LOCK();
      v22 = (void *)v32[5];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_7;
      v23[3] = &unk_2640FCDB0;
      id v24 = v7;
      [v22 enumerateKeysAndObjectsUsingBlock:v23];

      _Block_object_dispose(&v31, 8);
    }
  }
  else
  {
    [v10 logMessage:@"Missing address in discovery callback %@", v3];
  }
}

uint64_t __46__HUAccessoryManager_setupBluetoothController__block_invoke_6(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) copy];

  return MEMORY[0x270F9A758]();
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void, void, void))MEMORY[0x2105575F0](a3);
  if (v4)
  {
    v6[0] = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
}

uint64_t __46__HUAccessoryManager_setupBluetoothController__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logMessage:@"Activated bluetooth discovery %@", a2];
}

- (void)discoverAccessories
{
  v16[1] = *MEMORY[0x263EF8340];
  if (self->_centralIsOn && self->_bluetoothAvailable)
  {
    centralManager = self->_centralManager;
    uint64_t v15 = *MEMORY[0x263EFEE58];
    uint64_t v4 = *MEMORY[0x263EFEEB8];
    id v5 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
    id v14 = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    v16[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [(CBCentralManager *)centralManager registerForConnectionEventsWithOptions:v7];

    char v8 = self->_centralManager;
    uint64_t v9 = [MEMORY[0x263EFEF88] UUIDWithString:v4];
    uint64_t v13 = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    uint64_t v11 = [(CBCentralManager *)v8 retrieveConnectedPeripheralsWithServices:v10];

    [(HUAccessoryManager *)self setPeripherals:v11];
    [(HUAccessoryManager *)self logMessage:@"Found peripherals %@", v11];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__HUAccessoryManager_discoverAccessories__block_invoke;
    v12[3] = &unk_2640FD858;
    v12[4] = self;
    [v11 enumerateObjectsUsingBlock:v12];
  }
  else
  {
    [(HUAccessoryManager *)self logMessage:@"Skipping discovery %d, %d", self->_centralIsOn, self->_bluetoothAvailable];
  }
}

uint64_t __41__HUAccessoryManager_discoverAccessories__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) connectPeripheral:a2 options:0];
}

- (void)removeDiscoveredAccessories
{
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(HUAccessoryManager *)self peripherals];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke;
  v10[3] = &unk_2640FD858;
  id v5 = v3;
  id v11 = v5;
  [v4 enumerateObjectsUsingBlock:v10];

  id v6 = [MEMORY[0x263EFF8C0] array];
  [(HUAccessoryManager *)self setPeripherals:v6];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__1;
  void v8[4] = __Block_byref_object_dispose__1;
  id v9 = 0;
  void v7[5] = MEMORY[0x263EF8330];
  v7[6] = 3221225472;
  v7[7] = __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_2;
  v7[8] = &unk_2640FD6A0;
  v7[9] = self;
  v7[10] = v8;
  AX_PERFORM_WITH_LOCK();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_3;
  v7[3] = &unk_2640FD970;
  void v7[4] = v8;
  [(HUAccessoryManager *)self getAddressesFromIdentifiers:v5 withCompletion:v7];
  _Block_object_dispose(v8, 8);
}

void __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 identifier];
  id v3 = [v4 UUIDString];
  [v2 hcSafeAddObject:v3];
}

uint64_t __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) copy];

  return MEMORY[0x270F9A758]();
}

void __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_4;
  v6[3] = &unk_2640FCDB0;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id)MEMORY[0x2105575F0](a3);
  (*((void (**)(id, void, void))v4 + 2))(v4, 0, *(void *)(a1 + 32));
}

- (id)characteristicWithUUID:(id)a3 forPeripheral:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  id v7 = [v6 services];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__HUAccessoryManager_characteristicWithUUID_forPeripheral___block_invoke;
  v11[3] = &unk_2640FD290;
  id v8 = v5;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __59__HUAccessoryManager_characteristicWithUUID_forPeripheral___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a2 characteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__HUAccessoryManager_characteristicWithUUID_forPeripheral___block_invoke_2;
  v9[3] = &unk_2640FD268;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a4;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __59__HUAccessoryManager_characteristicWithUUID_forPeripheral___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 UUID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  -[HUAccessoryManager logMessage:](self, "logMessage:", @"Central state (%ld) %d", [v4 state], self->_centralIsOn);
  uint64_t v5 = [v4 state];

  if (v5 == 5)
  {
    self->_centralIsOn = 1;
    [(HUAccessoryManager *)self logMessage:@"centralManager ON"];
    [(HUAccessoryManager *)self discoverAccessories];
  }
  else
  {
    self->_centralIsOn = 0;
    [(HUAccessoryManager *)self logMessage:@"centralManager OFF"];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  [v5 setDelegate:self];
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
  int v8 = objc_msgSend(v6, "arrayWithObjects:", v7, 0);
  [v5 discoverServices:v8];

  id v9 = [v5 identifier];
  id v10 = [v9 UUIDString];

  if ([v10 length])
  {
    v14[0] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__HUAccessoryManager_centralManager_didConnectPeripheral___block_invoke;
    v12[3] = &unk_2640FD998;
    v12[4] = self;
    id v13 = v5;
    [(HUAccessoryManager *)self getAddressesFromIdentifiers:v11 withCompletion:v12];
  }
}

void __58__HUAccessoryManager_centralManager_didConnectPeripheral___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  [*(id *)(a1 + 32) logMessage:@"Connected to %@ - %@", v3, *(void *)(a1 + 40)];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  v30[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HUAccessoryManager *)self peripherals];
  uint64_t v12 = (void *)[v11 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke;
  v28[3] = &unk_2640FD9C0;
  id v13 = v9;
  id v29 = v13;
  objc_msgSend(v12, "ax_removeObjectsFromArrayUsingBlock:", v28);
  [(HUAccessoryManager *)self setPeripherals:v12];
  uint64_t v14 = [v13 identifier];
  uint64_t v15 = [v14 UUIDString];

  if ([v15 length])
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__1;
    v26[4] = __Block_byref_object_dispose__1;
    id v27 = 0;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_2;
    id v23 = &unk_2640FD6A0;
    id v24 = self;
    uint64_t v25 = v26;
    AX_PERFORM_WITH_LOCK();
    v30[0] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_3;
    v17[3] = &unk_2640FD9E8;
    v17[4] = self;
    id v18 = v13;
    id v19 = v26;
    [(HUAccessoryManager *)self getAddressesFromIdentifiers:v16 withCompletion:v17];

    _Block_object_dispose(v26, 8);
  }
}

uint64_t __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) copy];

  return MEMORY[0x270F9A758]();
}

void __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  [*(id *)(a1 + 32) logMessage:@"Disconnected from %@ - %@", v3, *(void *)(a1 + 40)];
  if ([v3 length])
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_4;
    v5[3] = &unk_2640FCDB0;
    id v6 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void, void, void))MEMORY[0x2105575F0](a3);
  if (v4)
  {
    v6[0] = *(void *)(a1 + 32);
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v7 = a5;
  [(HUAccessoryManager *)self logMessage:@"Connection changed %ld - %@", a4, v7];
  if (a4 == 1)
  {
    id v8 = [(HUAccessoryManager *)self peripherals];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __75__HUAccessoryManager_centralManager_connectionEventDidOccur_forPeripheral___block_invoke;
    v13[3] = &unk_2640FD9C0;
    id v9 = v7;
    id v14 = v9;
    uint64_t v10 = [v8 indexOfObjectPassingTest:v13];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [(HUAccessoryManager *)self peripherals];
      uint64_t v12 = [v11 arrayByAddingObject:v9];
      [(HUAccessoryManager *)self setPeripherals:v12];
    }
    [(CBCentralManager *)self->_centralManager connectPeripheral:v9 options:0];
  }
}

uint64_t __75__HUAccessoryManager_centralManager_connectionEventDidOccur_forPeripheral___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 services];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HUAccessoryManager_peripheral_didDiscoverServices___block_invoke;
  v7[3] = &unk_2640FDA10;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __53__HUAccessoryManager_peripheral_didDiscoverServices___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 UUID];
  id v4 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEB8]];
  int v5 = [v3 isEqual:v4];

  if (v5) {
    [*(id *)(a1 + 32) discoverCharacteristics:0 forService:v6];
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 characteristics];
  [(HUAccessoryManager *)self logMessage:@"Found characteristics %@ - %@", v8, v11];

  uint64_t v12 = [(HUAccessoryManager *)self registeredCharacteristics];
  [(HUAccessoryManager *)self updateNotify:1 forPeripheral:v8 withCharacteristicUUIDs:v12];

  id v13 = [v8 identifier];
  id v14 = [v13 UUIDString];

  if ([v14 length])
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__1;
    v17[4] = __Block_byref_object_dispose__1;
    id v18 = 0;
    v16[5] = MEMORY[0x263EF8330];
    v16[6] = 3221225472;
    v16[7] = __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
    v16[8] = &unk_2640FD6A0;
    v16[9] = self;
    v16[10] = v17;
    AX_PERFORM_WITH_LOCK();
    v19[0] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2;
    v16[3] = &unk_2640FD970;
    void v16[4] = v17;
    [(HUAccessoryManager *)self getAddressesFromIdentifiers:v15 withCompletion:v16];

    _Block_object_dispose(v17, 8);
  }
}

uint64_t __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) copy];

  return MEMORY[0x270F9A758]();
}

void __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  if ([v3 length])
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_3;
    v5[3] = &unk_2640FCDB0;
    id v6 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void, void, void))MEMORY[0x2105575F0](a3);
  if (v4)
  {
    v6[0] = *(void *)(a1 + 32);
    int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    ((void (**)(void, void *, void))v4)[2](v4, v5, 0);
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 UUID];
  uint64_t v12 = [v9 value];
  id v13 = [v8 identifier];
  id v14 = [v13 UUIDString];

  if ([v14 length])
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__1;
    v26[4] = __Block_byref_object_dispose__1;
    id v27 = 0;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke;
    id v23 = &unk_2640FD6A0;
    id v24 = self;
    uint64_t v25 = v26;
    AX_PERFORM_WITH_LOCK();
    v28[0] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke_2;
    v16[3] = &unk_2640FDA60;
    id v19 = v26;
    id v17 = v11;
    id v18 = v12;
    [(HUAccessoryManager *)self getAddressesFromIdentifiers:v15 withCompletion:v16];

    _Block_object_dispose(v26, 8);
  }
}

uint64_t __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];

  return MEMORY[0x270F9A758]();
}

void __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  if ([v3 length])
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke_3;
    v5[3] = &unk_2640FDA38;
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void (**)(void, void, void, void))MEMORY[0x2105575F0](a3);
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, a1[4], a1[5], a1[6]);
    id v4 = (void (**)(void, void, void, void))v5;
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (id)availableAddresses
{
  return [(HUAccessoryManager *)self availableAddressesWithCharacteristicSupport:0];
}

- (id)availableAddressesWithCharacteristicSupport:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__HUAccessoryManager_availableAddressesWithCharacteristicSupport___block_invoke;
  v10[3] = &unk_2640FDA88;
  uint64_t v12 = &v13;
  id v6 = v5;
  uint64_t v11 = v6;
  [(HUAccessoryManager *)self getAvailableAddressesSupportingCharacteristic:v4 withCompletion:v10];
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v6, v7);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __66__HUAccessoryManager_availableAddressesWithCharacteristicSupport___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)identifierFromBluetoothAddress:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  if ([v4 length])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v20[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__HUAccessoryManager_identifierFromBluetoothAddress___block_invoke;
    v11[3] = &unk_2640FDA88;
    uint64_t v13 = &v14;
    dispatch_time_t v7 = v5;
    uint64_t v12 = v7;
    [(HUAccessoryManager *)self getIdentifiersFromAddresses:v6 withCompletion:v11];

    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v7, v8);
  }
  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

intptr_t __53__HUAccessoryManager_identifierFromBluetoothAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (OS_dispatch_queue)bluetoothCentralQueue
{
  return self->_bluetoothCentralQueue;
}

- (void)setBluetoothCentralQueue:(id)a3
{
}

- (CBController)bluetoothController
{
  return self->_bluetoothController;
}

- (void)setBluetoothController:(id)a3
{
}

- (CBDiscovery)bluetoothDiscovery
{
  return self->_bluetoothDiscovery;
}

- (void)setBluetoothDiscovery:(id)a3
{
}

- (NSMutableArray)registeredCharacteristics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegisteredCharacteristics:(id)a3
{
}

- (NSMutableDictionary)loggingUpdates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLoggingUpdates:(id)a3
{
}

- (NSMutableDictionary)updateUpdates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUpdateUpdates:(id)a3
{
}

- (NSMutableDictionary)discoveryUpdates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDiscoveryUpdates:(id)a3
{
}

- (NSMutableDictionary)bluetoothStateUpdates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBluetoothStateUpdates:(id)a3
{
}

- (void)setAudioOwnershipByAddress:(id)a3
{
}

- (NSString)localBluetoothAddress
{
  return self->_localBluetoothAddress;
}

- (void)setLocalBluetoothAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localBluetoothAddress, 0);
  objc_storeStrong((id *)&self->_audioOwnershipByAddress, 0);
  objc_storeStrong((id *)&self->_bluetoothStateUpdates, 0);
  objc_storeStrong((id *)&self->_discoveryUpdates, 0);
  objc_storeStrong((id *)&self->_updateUpdates, 0);
  objc_storeStrong((id *)&self->_loggingUpdates, 0);
  objc_storeStrong((id *)&self->_registeredCharacteristics, 0);
  objc_storeStrong((id *)&self->_bluetoothDiscovery, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
  objc_storeStrong((id *)&self->_bluetoothCentralQueue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);

  objc_storeStrong((id *)&self->_peripherals, 0);
}

@end
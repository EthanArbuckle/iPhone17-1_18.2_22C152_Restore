@interface HKHealthServicesManager
+ (id)taskIdentifier;
- (HKHealthServicesManager)initWithHealthStore:(id)a3;
- (HKHealthServicesManager)initWithWeakHealthStore:(id)a3;
- (NSMutableDictionary)discoveries;
- (NSMutableDictionary)sessions;
- (NSMutableSet)discoveriesEnded;
- (NSMutableSet)sessionsEnded;
- (id)activeHealthServiceDiscoveries;
- (id)activeHealthServiceSessions;
- (id)bluetoothStatusHandler;
- (id)startAllHealthServicesDiscoveryWithHandler:(id)a3;
- (void)_addEndedDiscovery:(id)a3;
- (void)_addEndedSession:(id)a3;
- (void)_fetchHealthServicesServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_fetchSupportedServiceIDsWithCompletion:(id)a3;
- (void)_getCBPeripheralforIdentifer:(id)a3 withCompletion:(id)a4;
- (void)_getHealthPeripheralsStatus:(id)a3 withCompletion:(id)a4;
- (void)_setHealthPeripheralsStatus:(id)a3 status:(BOOL)a4 withCompletion:(id)a5;
- (void)_startHealthServiceExtendedDiscovery:(id)a3 withHandler:(id)a4;
- (void)addHealthServicePairing:(id)a3 withCompletion:(id)a4;
- (void)clientRemote_deliverBluetoothStatus:(int64_t)a3 withError:(id)a4;
- (void)clientRemote_deliverDiscoveryHealthService:(id)a3 toClient:(unint64_t)a4 finished:(BOOL)a5 withError:(id)a6;
- (void)clientRemote_deliverSessionCharacteristics:(id)a3 forService:(id)a4 toClient:(unint64_t)a5 withError:(id)a6;
- (void)clientRemote_deliverSessionHealthServiceStatus:(int64_t)a3 toClient:(unint64_t)a4 finished:(BOOL)a5 withError:(id)a6;
- (void)connectionInterrupted;
- (void)endBluetoothStatusUpdates;
- (void)endHealthServiceDiscovery:(id)a3;
- (void)endHealthServiceSession:(id)a3;
- (void)getEnabledStatusForPeripheral:(id)a3 withCompletion:(id)a4;
- (void)getHealthServiceProperty:(id)a3 forSession:(id)a4 withHandler:(id)a5;
- (void)getHealthServicePropertyNamesWithHandler:(id)a3;
- (void)healthPeripheralsWithCustomProperties:(id)a3 withCompletion:(id)a4;
- (void)healthPeripheralsWithFilter:(unint64_t)a3 handler:(id)a4;
- (void)healthServicePairingsWithHandler:(id)a3;
- (void)performHealthServiceOperation:(id)a3 onSession:(id)a4 withParameters:(id)a5 completion:(id)a6;
- (void)registerPeripheralIdentifier:(id)a3 name:(id)a4 services:(id)a5 withCompletion:(id)a6;
- (void)removeHealthServicePairing:(id)a3 withCompletion:(id)a4;
- (void)setBluetoothStatusHandler:(id)a3;
- (void)setDiscoveries:(id)a3;
- (void)setDiscoveriesEnded:(id)a3;
- (void)setEnabledStatus:(BOOL)a3 forPeripheral:(id)a4 withCompletion:(id)a5;
- (void)setSessions:(id)a3;
- (void)setSessionsEnded:(id)a3;
- (void)startBluetoothStatusUpdates:(id)a3;
- (void)startHealthServiceDiscovery:(id)a3 withHandler:(id)a4;
- (void)startHealthServiceSession:(id)a3 withHandler:(id)a4;
- (void)unregisterPeripheralIdentifier:(id)a3 withCompletion:(id)a4;
@end

@implementation HKHealthServicesManager

- (HKHealthServicesManager)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHealthServicesManager;
  v5 = [(HKHealthServicesManager *)&v14 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    v11 = objc_alloc_init(_HKCBCentralManagerLoader);
    bluetoothManagerLoader = v5->_bluetoothManagerLoader;
    v5->_bluetoothManagerLoader = v11;
  }
  return v5;
}

- (HKHealthServicesManager)initWithWeakHealthStore:(id)a3
{
  v3 = [(HKHealthServicesManager *)self initWithHealthStore:a3];
  id v4 = v3;
  if (v3) {
    [(HKProxyProvider *)v3->_proxyProvider referenceSourceWeakly];
  }
  return v4;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)_fetchHealthServicesServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)startBluetoothStatusUpdates:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 68, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke;
  aBlock[3] = &unk_1E58BDD68;
  aBlock[4] = self;
  id v15 = v5;
  id v6 = v5;
  v7 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_3;
  v12[3] = &unk_1E58C9938;
  v12[4] = self;
  id v13 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_4;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v8 = v13;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v12 errorHandler:v10];
}

void __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_2;
  block[3] = &unk_1E58BDD40;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 40);
  id v7 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  objc_msgSend(v7, "remote_beginBluetoothStatusUpdates:", *(void *)(a1 + 40));
}

uint64_t __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endBluetoothStatusUpdates
{
  v3 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _fetchHealthServicesServerProxyWithHandler:&__block_literal_global_140 errorHandler:&__block_literal_global_22];
}

uint64_t __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endBluetoothStatusUpdates");
}

void __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogServices;
  if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_ERROR)) {
    __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

- (void)_fetchSupportedServiceIDsWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 96, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__HKHealthServicesManager__fetchSupportedServiceIDsWithCompletion___block_invoke;
  v11[3] = &unk_1E58C9980;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HKHealthServicesManager__fetchSupportedServiceIDsWithCompletion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v7 = v12;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __67__HKHealthServicesManager__fetchSupportedServiceIDsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSupportedServiceIDsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __67__HKHealthServicesManager__fetchSupportedServiceIDsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startHealthServiceDiscovery:(id)a3 withHandler:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 108, @"Invalid parameter not satisfying: %@", @"discovery" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 109, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  [(HKHealthServicesManager *)self _startHealthServiceExtendedDiscovery:v10 withHandler:v7];
}

- (id)startAllHealthServicesDiscoveryWithHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 115, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v6 = [[HKHealthServiceDiscovery alloc] initForAllTypes];
  [(HKHealthServicesManager *)self _startHealthServiceExtendedDiscovery:v6 withHandler:v5];

  return v6;
}

- (void)_startHealthServiceExtendedDiscovery:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke;
  v12[3] = &unk_1E58C99F8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_37;
  v10[3] = &unk_1E58BBC48;
  void v10[4] = self;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v12 errorHandler:v10];
}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  id v5 = [v3 discoveries];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [a1[4] setDiscoveries:v6];
  }
  uint64_t v7 = [a1[5] serviceType];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_2;
  v8[3] = &unk_1E58C99D0;
  v8[4] = a1[4];
  id v10 = a1[6];
  id v9 = a1[5];
  objc_msgSend(v4, "remote_startHealthServiceDiscovery:withCompletion:", v7, v8);
}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_3;
  block[3] = &unk_1E58C99A8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v13 = a2;
  void block[4] = v7;
  id v12 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v6, block);
}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    id v4 = [*(id *)(a1 + 32) discoveries];

    if (v4)
    {
      [*(id *)(a1 + 48) setDiscoveryIdentifier:*(void *)(a1 + 64)];
      [*(id *)(a1 + 48) setDiscoveryHandler:*(void *)(a1 + 56)];
      uint64_t v5 = *(void *)(a1 + 48);
      id v11 = [*(id *)(a1 + 32) discoveries];
      id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
      [v11 setObject:v5 forKeyedSubscript:v6];
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_ERROR)) {
        __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_3_cold_1();
      }
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
      [v7 _addEndedDiscovery:v8];

      uint64_t v9 = *(void *)(a1 + 56);
      if (v9)
      {
        if (*(void *)(a1 + 40))
        {
          (*(void (**)(void, void, uint64_t))(v9 + 16))(*(void *)(a1 + 56), 0, 1);
        }
        else
        {
          id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 301, @"Discovery services ended unexpectedly.");
          (*(void (**)(uint64_t, void, uint64_t, void *))(v9 + 16))(v9, 0, 1, v10);
        }
      }
    }
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_2_38;
  v7[3] = &unk_1E58BBF10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_2_38(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(result + 16))(result, 0, 1, *(void *)(a1 + 32));
  }
  return result;
}

- (void)endHealthServiceDiscovery:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke;
  v8[3] = &unk_1E58C9A20;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_3;
  v6[3] = &unk_1E58C4FC0;
  v6[4] = self;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v8 errorHandler:v6];
}

void __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_2;
  v6[3] = &unk_1E58BBBD0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) discoveryIdentifier];
  if (result)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) discoveryIdentifier];
    return objc_msgSend(v3, "remote_endHealthServiceDiscovery:", v4);
  }
  return result;
}

void __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_4;
  v6[3] = &unk_1E58BBBD0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) discoveryHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, 0, 1, *(void *)(a1 + 40));
    uint64_t v2 = (void (**)(void, void, void, void))v3;
  }
}

- (id)activeHealthServiceDiscoveries
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__61;
  id v11 = __Block_byref_object_dispose__61;
  id v12 = 0;
  id v3 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HKHealthServicesManager_activeHealthServiceDiscoveries__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__HKHealthServicesManager_activeHealthServiceDiscoveries__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) discoveries];
  uint64_t v3 = [v5 count];
  if (v3)
  {
    v1 = [*(id *)(a1 + 32) discoveries];
    id v4 = [v1 allValues];
  }
  else
  {
    id v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (v3)
  {
  }
}

- (void)startHealthServiceSession:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 service];

  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"HKHealthServiceSession service cannot be nil."];
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"HKHealthServicesSessionHandler cannot be nil."];
    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke;
  v13[3] = &unk_1E58C99F8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_5;
  v11[3] = &unk_1E58BBC48;
  void v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v13 errorHandler:v11];
}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_2;
  v7[3] = &unk_1E58BBB10;
  id v5 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessions];

  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 32) setSessions:v3];
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) service];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_3;
  v6[3] = &unk_1E58C99D0;
  void v6[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "remote_startHealthServiceSession:withCompletion:", v5, v6);
}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_4;
  block[3] = &unk_1E58C99A8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v13 = a2;
  void block[4] = v7;
  id v12 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v6, block);
}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_4(uint64_t a1)
{
  if (!*(void *)(a1 + 64))
  {
    [*(id *)(a1 + 40) code];
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
    return;
  }
  id v3 = [*(id *)(a1 + 32) sessions];

  uint64_t v4 = *(void *)(a1 + 64);
  if (v3)
  {
    [*(id *)(a1 + 48) setSessionIdentifier:v4];
    [*(id *)(a1 + 48) setSessionHandler:*(void *)(a1 + 56)];
    uint64_t v5 = *(void *)(a1 + 48);
    id v14 = [*(id *)(a1 + 32) sessions];
    id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    [v14 setObject:v5 forKeyedSubscript:v6];

    uint64_t v7 = v14;
LABEL_7:

    return;
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = [NSNumber numberWithUnsignedInteger:v4];
  [v8 _addEndedSession:v9];

  uint64_t v10 = *(void *)(a1 + 56);
  if (!v10) {
    return;
  }
  if (!*(void *)(a1 + 40))
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Service session ended unexpectedly.");
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 16))(v10, 0, 1, v13);
    uint64_t v7 = (void *)v13;
    goto LABEL_7;
  }
  id v11 = *(void (**)(uint64_t, void, uint64_t))(v10 + 16);
  uint64_t v12 = *(void *)(a1 + 56);

  v11(v12, 0, 1);
}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_6;
  v7[3] = &unk_1E58BBF10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 1, *(void *)(a1 + 32));
}

- (void)endHealthServiceSession:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HKHealthServicesManager_endHealthServiceSession___block_invoke;
  v8[3] = &unk_1E58C9A20;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_3;
  v6[3] = &unk_1E58C4FC0;
  void v6[4] = self;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v8 errorHandler:v6];
}

void __51__HKHealthServicesManager_endHealthServiceSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_2;
  v6[3] = &unk_1E58BBBD0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) sessionIdentifier];

  return objc_msgSend(v1, "remote_endHealthServiceSession:", v2);
}

void __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_4;
  v6[3] = &unk_1E58BBBD0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, 0, 1, *(void *)(a1 + 40));
    uint64_t v2 = (void (**)(void, void, void, void))v3;
  }
}

- (id)activeHealthServiceSessions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__61;
  id v11 = __Block_byref_object_dispose__61;
  id v12 = 0;
  id v3 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HKHealthServicesManager_activeHealthServiceSessions__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__HKHealthServicesManager_activeHealthServiceSessions__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sessions];
  uint64_t v3 = [v5 count];
  if (v3)
  {
    v1 = [*(id *)(a1 + 32) sessions];
    id v4 = [v1 allValues];
  }
  else
  {
    id v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (v3)
  {
  }
}

- (void)healthServicePairingsWithHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 248, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__HKHealthServicesManager_healthServicePairingsWithHandler___block_invoke;
  v11[3] = &unk_1E58C9980;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HKHealthServicesManager_healthServicePairingsWithHandler___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v7 = v12;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __60__HKHealthServicesManager_healthServicePairingsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getHealthPeripheralsWithFilter:handler:", 0, *(void *)(a1 + 32));
}

uint64_t __60__HKHealthServicesManager_healthServicePairingsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)healthPeripheralsWithFilter:(unint64_t)a3 handler:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 261, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  id v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__HKHealthServicesManager_healthPeripheralsWithFilter_handler___block_invoke;
  v13[3] = &unk_1E58C9A48;
  unint64_t v15 = a3;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__HKHealthServicesManager_healthPeripheralsWithFilter_handler___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v14;
  id v9 = v14;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __63__HKHealthServicesManager_healthPeripheralsWithFilter_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getHealthPeripheralsWithFilter:handler:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __63__HKHealthServicesManager_healthPeripheralsWithFilter_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addHealthServicePairing:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 273, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke;
  v15[3] = &unk_1E58C99F8;
  v15[4] = self;
  id v16 = v7;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke_3;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v10 = v17;
  id v11 = v7;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v15 errorHandler:v13];
}

void __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke_2;
  block[3] = &unk_1E58BBA78;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remote_addPairingForHealthService:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeHealthServicePairing:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 287, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke;
  v15[3] = &unk_1E58C99F8;
  v15[4] = self;
  id v16 = v7;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke_3;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v10 = v17;
  id v11 = v7;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v15 errorHandler:v13];
}

void __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke_2;
  block[3] = &unk_1E58BBA78;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remote_removePairingForHealthService:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerPeripheralIdentifier:(id)a3 name:(id)a4 services:(id)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 301, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  unint64_t v15 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v14];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__HKHealthServicesManager_registerPeripheralIdentifier_name_services_withCompletion___block_invoke;
  v23[3] = &unk_1E58C9A70;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__HKHealthServicesManager_registerPeripheralIdentifier_name_services_withCompletion___block_invoke_2;
  v21[3] = &unk_1E58BBD88;
  id v22 = v27;
  id v16 = v27;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v23 errorHandler:v21];
}

uint64_t __85__HKHealthServicesManager_registerPeripheralIdentifier_name_services_withCompletion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addPeripheral:name:forServices:withCompletion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __85__HKHealthServicesManager_registerPeripheralIdentifier_name_services_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterPeripheralIdentifier:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 313, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__HKHealthServicesManager_unregisterPeripheralIdentifier_withCompletion___block_invoke;
  v15[3] = &unk_1E58C9938;
  id v16 = v7;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HKHealthServicesManager_unregisterPeripheralIdentifier_withCompletion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v10 = v17;
  id v11 = v7;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __73__HKHealthServicesManager_unregisterPeripheralIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removePeripheral:withCompletion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __73__HKHealthServicesManager_unregisterPeripheralIdentifier_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getEnabledStatusForPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  objc_initWeak(&location, self);
  id v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke;
  v11[3] = &unk_1E58C1FB8;
  id v9 = v8;
  id v13 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v6;
  id v12 = v10;
  [(HKHealthServicesManager *)self _getHealthPeripheralsStatus:v10 withCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke_2;
    v8[3] = &unk_1E58C9938;
    id v9 = a1[4];
    id v10 = a1[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke_3;
    v6[3] = &unk_1E58BBD88;
    id v7 = a1[5];
    [WeakRetained _fetchHealthServicesServerProxyWithHandler:v8 errorHandler:v6];
  }
  else
  {
    id v5 = (void (*)(void))*((void *)a1[5] + 2);
    v5();
  }
}

uint64_t __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getEnabledStatusForPeripheral:withCompletion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setEnabledStatus:(BOOL)a3 forPeripheral:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  objc_initWeak(&location, self);
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke;
  v13[3] = &unk_1E58C9AC0;
  id v11 = v10;
  id v15 = v11;
  objc_copyWeak(&v16, &location);
  BOOL v17 = v6;
  id v12 = v8;
  id v14 = v12;
  [(HKHealthServicesManager *)self _setHealthPeripheralsStatus:v12 status:v6 withCompletion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke_2;
    v7[3] = &unk_1E58C9A98;
    char v10 = *(unsigned char *)(a1 + 56);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke_3;
    v5[3] = &unk_1E58BBD88;
    id v6 = *(id *)(a1 + 40);
    [WeakRetained _fetchHealthServicesServerProxyWithHandler:v7 errorHandler:v5];
  }
}

uint64_t __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setEnabledStatus:forPeripheral:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getHealthServicePropertyNamesWithHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 367, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HKHealthServicesManager_getHealthServicePropertyNamesWithHandler___block_invoke;
  v11[3] = &unk_1E58C9980;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKHealthServicesManager_getHealthServicePropertyNamesWithHandler___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v7 = v12;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __68__HKHealthServicesManager_getHealthServicePropertyNamesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getSupportedPropertyNamesWithHandler:", *(void *)(a1 + 32));
}

uint64_t __68__HKHealthServicesManager_getHealthServicePropertyNamesWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getHealthServiceProperty:(id)a3 forSession:(id)a4 withHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 381, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 382, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    goto LABEL_4;
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 380, @"Invalid parameter not satisfying: %@", @"propertyName" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  id v12 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v11];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__HKHealthServicesManager_getHealthServiceProperty_forSession_withHandler___block_invoke;
  v21[3] = &unk_1E58C99F8;
  id v22 = v9;
  id v23 = v10;
  id v24 = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__HKHealthServicesManager_getHealthServiceProperty_forSession_withHandler___block_invoke_2;
  v19[3] = &unk_1E58BBD88;
  id v20 = v24;
  id v13 = v24;
  id v14 = v10;
  id v15 = v9;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v21 errorHandler:v19];
}

void __75__HKHealthServicesManager_getHealthServiceProperty_forSession_withHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  objc_msgSend(v5, "remote_getHealthServiceProperty:forSession:withHandler:", v3, objc_msgSend(v4, "sessionIdentifier"), a1[6]);
}

uint64_t __75__HKHealthServicesManager_getHealthServiceProperty_forSession_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performHealthServiceOperation:(id)a3 onSession:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 394, @"Invalid parameter not satisfying: %@", @"op" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 395, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke;
  v24[3] = &unk_1E58C9AE8;
  v24[4] = self;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_3;
  v21[3] = &unk_1E58C9B10;
  id v22 = v25;
  id v23 = v28;
  void v21[4] = self;
  id v15 = v25;
  id v16 = v28;
  id v17 = v13;
  id v18 = v12;
  [(HKHealthServicesManager *)self _fetchHealthServicesServerProxyWithHandler:v24 errorHandler:v21];
}

void __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_2;
  block[3] = &unk_1E58C0958;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) sessionIdentifier];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);

  return objc_msgSend(v2, "remote_performHealthServiceOperation:onSession:withParameters:completion:", v3, v4, v5, v6);
}

void __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_4;
  block[3] = &unk_1E58BB9A0;
  id v9 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)_addEndedDiscovery:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthServicesManager *)self discoveriesEnded];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    [(HKHealthServicesManager *)self setDiscoveriesEnded:v6];
  }
  id v7 = [(HKHealthServicesManager *)self discoveriesEnded];
  [v7 addObject:v4];
}

- (void)_addEndedSession:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthServicesManager *)self sessionsEnded];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    [(HKHealthServicesManager *)self setSessionsEnded:v6];
  }
  id v7 = [(HKHealthServicesManager *)self sessionsEnded];
  [v7 addObject:v4];
}

- (void)healthPeripheralsWithCustomProperties:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthServicesManager.m", 427, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  bluetoothManagerLoader = self->_bluetoothManagerLoader;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__HKHealthServicesManager_healthPeripheralsWithCustomProperties_withCompletion___block_invoke;
  v13[3] = &unk_1E58C9B38;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  [(_HKCBCentralManagerLoader *)bluetoothManagerLoader getCentralManagerWithCompletion:v13];
}

void __80__HKHealthServicesManager_healthPeripheralsWithCustomProperties_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__HKHealthServicesManager_healthPeripheralsWithCustomProperties_withCompletion___block_invoke_2;
  v4[3] = &unk_1E58C3E80;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 retrievePeripheralsWithCustomProperties:v3 completion:v4];
}

void __80__HKHealthServicesManager_healthPeripheralsWithCustomProperties_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
          id v13 = [HKCBPeripheral alloc];
          id v14 = -[HKCBPeripheral initWithCBPeripheral:](v13, "initWithCBPeripheral:", v12, (void)v15);
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_getCBPeripheralforIdentifer:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  bluetoothManagerLoader = self->_bluetoothManagerLoader;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HKHealthServicesManager__getCBPeripheralforIdentifer_withCompletion___block_invoke;
  v11[3] = &unk_1E58C9B38;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_HKCBCentralManagerLoader *)bluetoothManagerLoader getCentralManagerWithCompletion:v11];
}

void __71__HKHealthServicesManager__getCBPeripheralforIdentifer_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v16[0] = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v16 count:1];
  id v6 = [v4 retrievePeripheralsWithIdentifiers:v5];

  if ([v6 count] == 1)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [v6 firstObject];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    uint64_t v9 = [v6 count];
    _HKInitializeLogging();
    id v10 = (void *)HKLogServices;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_FAULT)) {
        __71__HKHealthServicesManager__getCBPeripheralforIdentifer_withCompletion___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void **)(a1 + 32);
      id v12 = v10;
      id v13 = [v11 UUIDString];
      int v14 = 138412290;
      long long v15 = v13;
      _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "No CBPeripheral found for identifier %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_getHealthPeripheralsStatus:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HKHealthServicesManager__getHealthPeripheralsStatus_withCompletion___block_invoke;
  v9[3] = &unk_1E58C9B60;
  id v10 = v7;
  id v8 = v7;
  [(HKHealthServicesManager *)self _getCBPeripheralforIdentifer:v6 withCompletion:v9];
}

void __70__HKHealthServicesManager__getHealthPeripheralsStatus_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 customProperty:@"UpdateHealth"];
    id v4 = v3;
    if (v3 && ![v3 isEqual:&stru_1EEC60288])
    {
      [v4 BOOLValue];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_FAULT)) {
        __70__HKHealthServicesManager__getHealthPeripheralsStatus_withCompletion___block_invoke_cold_1();
      }
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 304, @"Migration to CBPeripheral is not complete");
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 304, @"No Device found");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v8);
  }
}

- (void)_setHealthPeripheralsStatus:(id)a3 status:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HKHealthServicesManager__setHealthPeripheralsStatus_status_withCompletion___block_invoke;
  v11[3] = &unk_1E58C9B88;
  id v12 = v9;
  BOOL v13 = a4;
  id v10 = v9;
  [(HKHealthServicesManager *)self _getCBPeripheralforIdentifer:v8 withCompletion:v11];
}

void __77__HKHealthServicesManager__setHealthPeripheralsStatus_status_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = @"1";
    }
    else {
      uint64_t v3 = @"0";
    }
    [a2 setCustomProperty:@"UpdateHealth" value:v3];
    notify_post("HKHealthPeripheralStatusDidChangeNotification");
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_FAULT)) {
      __77__HKHealthServicesManager__setHealthPeripheralsStatus_status_withCompletion___block_invoke_cold_1();
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 304, @"No Device found");
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

- (void)clientRemote_deliverBluetoothStatus:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HKHealthServicesManager_clientRemote_deliverBluetoothStatus_withError___block_invoke;
  block[3] = &unk_1E58BBBF8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __73__HKHealthServicesManager_clientRemote_deliverBluetoothStatus_withError___block_invoke(void *a1)
{
  uint64_t result = *(void *)(a1[4] + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[6], a1[5]);
  }
  return result;
}

- (void)clientRemote_deliverDiscoveryHealthService:(id)a3 toClient:(unint64_t)a4 finished:(BOOL)a5 withError:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  BOOL v13 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke;
  v16[3] = &unk_1E58C9BB0;
  unint64_t v19 = a4;
  SEL v20 = a2;
  v16[4] = self;
  id v17 = v11;
  id v18 = v12;
  BOOL v21 = a5;
  id v14 = v12;
  id v15 = v11;
  dispatch_async(v13, v16);
}

void __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 56))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v4];
    uint64_t v7 = [v6 discoveryHandler];
    id v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, void, void, void))(v7 + 16))(v7, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 48));
      if (*(unsigned char *)(a1 + 72))
      {
        [*(id *)(a1 + 32) _addEndedDiscovery:v4];
        [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v4];
      }
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (*(void *)(v9 + 24) && ![*(id *)(v9 + 32) containsObject:v4])
      {
        dispatch_time_t v11 = dispatch_time(0, 250000000);
        id v12 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        void v16[2] = __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_91;
        v16[3] = &unk_1E58C9BB0;
        uint64_t v13 = *(void *)(a1 + 56);
        uint64_t v20 = *(void *)(a1 + 64);
        uint64_t v21 = v13;
        id v17 = *(id *)(a1 + 40);
        id v14 = *(id *)(a1 + 48);
        uint64_t v15 = *(void *)(a1 + 32);
        id v18 = v14;
        uint64_t v19 = v15;
        char v22 = *(unsigned char *)(a1 + 72);
        dispatch_after(v11, v12, v16);
      }
      else
      {
        _HKInitializeLogging();
        id v10 = (void *)HKLogServices;
        if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEBUG)) {
          __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_cold_1(a1, v10);
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogServices;
    if (!os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v3 = *(const char **)(a1 + 64);
    id v4 = v2;
    uint64_t v5 = NSStringFromSelector(v3);
    *(_DWORD *)buf = 138543362;
    id v24 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@, Invalid discovery client returned and ignored.", buf, 0xCu);
  }
}

uint64_t __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_91(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogServices;
  if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEBUG)) {
    __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_91_cold_1(a1, v2);
  }
  return objc_msgSend(*(id *)(a1 + 48), "clientRemote_deliverDiscoveryHealthService:toClient:finished:withError:", *(void *)(a1 + 32), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40));
}

- (void)clientRemote_deliverSessionHealthServiceStatus:(int64_t)a3 toClient:(unint64_t)a4 finished:(BOOL)a5 withError:(id)a6
{
  id v11 = a6;
  id v12 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke;
  v14[3] = &unk_1E58C9BD8;
  unint64_t v16 = a4;
  SEL v17 = a2;
  int64_t v18 = a3;
  v14[4] = self;
  id v15 = v11;
  BOOL v19 = a5;
  id v13 = v11;
  dispatch_async(v12, v14);
}

void __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v6 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v4];
    uint64_t v7 = [v6 sessionHandler];
    id v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, void, void, void))(v7 + 16))(v7, *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40));
      if (*(unsigned char *)(a1 + 72))
      {
        [*(id *)(a1 + 32) _addEndedSession:v4];
        [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v4];
      }
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (*(void *)(v9 + 40) && ![*(id *)(v9 + 48) containsObject:v4])
      {
        dispatch_time_t v11 = dispatch_time(0, 200000000);
        id v12 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_92;
        v18[3] = &unk_1E58C9BD8;
        uint64_t v13 = *(void *)(a1 + 64);
        id v15 = *(void **)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v21 = *(void *)(a1 + 56);
        uint64_t v22 = v14;
        uint64_t v23 = v13;
        id v16 = v15;
        uint64_t v17 = *(void *)(a1 + 32);
        id v19 = v16;
        uint64_t v20 = v17;
        char v24 = *(unsigned char *)(a1 + 72);
        dispatch_after(v11, v12, v18);
      }
      else
      {
        _HKInitializeLogging();
        id v10 = (void *)HKLogServices;
        if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEBUG)) {
          __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_cold_1(a1, v10);
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogServices;
    if (!os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v3 = *(const char **)(a1 + 56);
    id v4 = v2;
    uint64_t v5 = NSStringFromSelector(v3);
    *(_DWORD *)buf = 138543362;
    id v26 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@, Invalid session client returned and ignored.", buf, 0xCu);
  }
}

uint64_t __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_92(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogServices;
  if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEBUG)) {
    __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_92_cold_1(a1, v2);
  }
  return objc_msgSend(*(id *)(a1 + 40), "clientRemote_deliverSessionHealthServiceStatus:toClient:finished:withError:", *(void *)(a1 + 64), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 32));
}

- (void)clientRemote_deliverSessionCharacteristics:(id)a3 forService:(id)a4 toClient:(unint64_t)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__HKHealthServicesManager_clientRemote_deliverSessionCharacteristics_forService_toClient_withError___block_invoke;
  block[3] = &unk_1E58C9C00;
  id v20 = v12;
  unint64_t v21 = a5;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __100__HKHealthServicesManager_clientRemote_deliverSessionCharacteristics_forService_toClient_withError___block_invoke(void *a1)
{
  if (a1[8])
  {
    uint64_t v2 = *(void **)(a1[4] + 40);
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v6 = [v2 objectForKeyedSubscript:v3];

    uint64_t v4 = [v6 characteristicsHandler];
    uint64_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, void, void, void))(v4 + 16))(v4, a1[5], a1[6], a1[7]);
    }
  }
}

- (void)connectionInterrupted
{
  uint64_t v3 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKHealthServicesManager_connectionInterrupted__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __48__HKHealthServicesManager_connectionInterrupted__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  if (v3)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v4 = [v3 allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v43 + 1) + 8 * i) discoveryHandler];
          id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 301, @"Connection interrupted");
          ((void (**)(void, void, uint64_t, void *))v9)[2](v9, 0, 1, v10);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v6);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 32);
    if (!v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 32);
      *(void *)(v14 + 32) = v13;

      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 32);
    }
    id v16 = [*(id *)(v11 + 24) allKeys];
    [v12 addObjectsFromArray:v16];

    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 24);
    *(void *)(v17 + 24) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 48))
  {
    uint64_t v38 = a1;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = [*(id *)(v2 + 40) allValues];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          char v24 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          uint64_t v25 = [v24 sessionHandler];
          id v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = [v24 service];
          id v28 = [v27 name];
          v29 = objc_msgSend(v26, "hk_error:format:", 300, @"The connection to %@ has unexpectedly been lost.", v28);
          ((void (**)(void, uint64_t, uint64_t, void *))v25)[2](v25, 5, 1, v29);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v21);
    }

    uint64_t v30 = *(void *)(v38 + 32);
    v31 = *(void **)(v30 + 48);
    if (!v31)
    {
      uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v33 = *(void *)(v38 + 32);
      v34 = *(void **)(v33 + 48);
      *(void *)(v33 + 48) = v32;

      uint64_t v30 = *(void *)(v38 + 32);
      v31 = *(void **)(v30 + 48);
    }
    v35 = [*(id *)(v30 + 40) allKeys];
    [v31 addObjectsFromArray:v35];

    uint64_t v36 = *(void *)(v38 + 32);
    v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = 0;
  }
}

- (NSMutableDictionary)discoveries
{
  return self->_discoveries;
}

- (void)setDiscoveries:(id)a3
{
}

- (NSMutableSet)discoveriesEnded
{
  return self->_discoveriesEnded;
}

- (void)setDiscoveriesEnded:(id)a3
{
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (NSMutableSet)sessionsEnded
{
  return self->_sessionsEnded;
}

- (void)setSessionsEnded:(id)a3
{
}

- (id)bluetoothStatusHandler
{
  return self->_bluetoothStatusHandler;
}

- (void)setBluetoothStatusHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bluetoothStatusHandler, 0);
  objc_storeStrong((id *)&self->_sessionsEnded, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_discoveriesEnded, 0);
  objc_storeStrong((id *)&self->_discoveries, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerLoader, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to get health services proxy: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_19C023000, v0, OS_LOG_TYPE_ERROR, "*** Ending discovery after server failure.", v1, 2u);
}

void __71__HKHealthServicesManager__getCBPeripheralforIdentifer_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_13(&dword_19C023000, v0, v1, "More then one peripheral was returned for identifier on get write status", v2, v3, v4, v5, v6);
}

void __70__HKHealthServicesManager__getHealthPeripheralsStatus_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_13(&dword_19C023000, v0, v1, "BTLE device is missing custom property UpdateHealth", v2, v3, v4, v5, v6);
}

void __77__HKHealthServicesManager__setHealthPeripheralsStatus_status_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_13(&dword_19C023000, v0, v1, "BTLE Device missing when updating property", v2, v3, v4, v5, v6);
}

void __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(const char **)(a1 + 64);
  uint64_t v3 = a2;
  uint64_t v4 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5_1(&dword_19C023000, v3, v5, "%{public}@, discovery for canceled client ID %d. service: %@, error: %@", v6);
}

void __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_91_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(const char **)(a1 + 56);
  uint64_t v3 = a2;
  uint64_t v4 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5_1(&dword_19C023000, v3, v5, "%{public}@, rescheduling, discovery not yet available for client ID %d. service: %{public}@, error: %{public}@", v6);
}

void __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(const char **)(a1 + 56);
  uint64_t v4 = a2;
  uint64_t v5 = NSStringFromSelector(v3);
  uint8_t v6 = _HKStringForHealthServiceStatus(*(void *)(a1 + 64));
  int v8 = 138544130;
  uint64_t v9 = v5;
  OUTLINED_FUNCTION_0_22();
  OUTLINED_FUNCTION_5_1(&dword_19C023000, v4, v7, "%{public}@, session for canceled client ID %d. status: %{public}@, error: %{public}@", (uint8_t *)&v8);
}

void __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_92_cold_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(const char **)(a1 + 48);
  uint64_t v4 = a2;
  uint64_t v5 = NSStringFromSelector(v3);
  uint8_t v6 = _HKStringForHealthServiceStatus(*(void *)(a1 + 64));
  int v8 = 138544130;
  uint64_t v9 = v5;
  OUTLINED_FUNCTION_0_22();
  OUTLINED_FUNCTION_5_1(&dword_19C023000, v4, v7, "%{public}@, rescheduling, session not yet available for client ID %d. status: %{public}@, error: %{public}@", (uint8_t *)&v8);
}

@end
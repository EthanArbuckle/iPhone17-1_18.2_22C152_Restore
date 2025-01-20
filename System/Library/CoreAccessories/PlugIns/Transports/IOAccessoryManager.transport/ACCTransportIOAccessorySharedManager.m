@interface ACCTransportIOAccessorySharedManager
+ (id)IOAccessoryClassStringForIOAccessoryClassType:(int)a3;
+ (id)sharedManager;
+ (int)IOAccessoryClassTypeForIOAccessoryClassString:(id)a3;
- (ACCSettingsState)enableDirectAWCAuth;
- (ACCTransportIOAccessoryListener)ioAccessoryListener;
- (ACCTransportIOAccessoryManager)rootE75Manager;
- (ACCTransportIOAccessoryManager)rootOrionManager;
- (ACCTransportIOAccessorySharedManager)init;
- (ACCTransportPluginIOAccessoryManager)delegate;
- (BOOL)IOAccessoryEADataArrived:(id)a3 eaEndpointUUID:(id)a4;
- (BOOL)IOAccessoryOOBPairingDataArrived:(id)a3 endpointUUID:(id)a4;
- (BOOL)IOAccessoryOOBPairingDataFinishedForEndpointUUID:(id)a3;
- (BOOL)IOAccessoryOOBPairingDataStartedForEndpointUUID:(id)a3;
- (BOOL)IOAccessoryOOBPairingInfoArrived:(id)a3 endpointUUID:(id)a4;
- (BOOL)IOAccessoryPortDataArrived:(id)a3 endpointUUID:(id)a4;
- (BOOL)_addACCTransportToManager:(id)a3;
- (BOOL)_managerForConnectionUUIDHasActiveEndpoint:(id)a3;
- (BOOL)bIsWatch;
- (BOOL)configureAccessoryPowerMode:(int)a3 forConnectionUUID:(id)a4;
- (BOOL)connectedThroughAdapter:(id)a3;
- (BOOL)isB139OrB164Connected;
- (BOOL)isBatteryPackModeEnabled:(id)a3;
- (BOOL)isPowerDuringSleepEnabled:(id)a3;
- (BOOL)isPowerDuringSleepSupported:(id)a3;
- (BOOL)openEASession:(id)a3 withEAEndpointUUID:(id)a4;
- (BOOL)resetAccessoryBaseCurrent:(id)a3;
- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4;
- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4;
- (BOOL)setBatteryPackMode:(BOOL)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5;
- (BOOL)setFeaturesFromAuthStatus:(int)a3 andAuthCert:(id)a4 certType:(int)a5 forConnectionUUID:(id)a6 withConnectionType:(int)a7;
- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3 forConnectionUUID:(id)a4;
- (BOOL)setProperties:(id)a3 forManager:(id)a4;
- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5;
- (BOOL)setUSBCurrentOffset:(int)a3 forConnectionUUID:(id)a4;
- (BOOL)setUSBMode:(int)a3 forConnectionUUID:(id)a4;
- (BOOL)setUSBMode:(int)a3 forEndpointUUID:(id)a4;
- (BOOL)shouldEnableDirectAWCAuth;
- (NSMutableArray)deferAuthCPServiceArray;
- (NSMutableArray)deferEAServiceArray;
- (NSMutableSet)allIOAccessories;
- (NSMutableSet)allIOAccessoryManagers;
- (NSMutableSet)rootIOAccessoryManagers;
- (NSRecursiveLock)accessoryPortLock;
- (OS_dispatch_queue)listQ;
- (id)IOAccessoryPortArrived:(id)a3 withEndpointProtocol:(int)a4 publish:(BOOL)a5;
- (id)_basePortForConnectionUUID:(id)a3;
- (id)_basePortForEndpointUUID:(id)a3;
- (id)_basePortForService:(unsigned int)a3;
- (id)_managerContainingBase:(id)a3;
- (id)_managerForBase:(id)a3;
- (id)_managerForBaseEndpointUUID:(id)a3;
- (id)_managerForConnectionUUID:(id)a3;
- (id)_managerForIOService:(unsigned int)a3 shouldCreateNewService:(BOOL)a4;
- (id)_portForManagerMatchingPrimaryPort:(id)a3;
- (id)digitalIDDataForUpstreamConnection:(id)a3;
- (id)managerForIOAccessoryManagerService:(unsigned int)a3;
- (int)CableType:(id)a3;
- (int)USBModeForConnectionUUID:(id)a3;
- (int)USBModeForEndpointUUID:(id)a3;
- (int)_accPlatformPowerModeToIOAccessoryPowerMode:(int)a3;
- (int)_connectionTypeForIOAccessoryPort:(id)a3;
- (int)_endpointTransportTypeForIOAccessoryPort:(id)a3;
- (unsigned)USBChargingVoltageInmV:(id)a3;
- (unsigned)USBCurrentLimitBaseInmA:(id)a3;
- (unsigned)USBCurrentLimitInmA:(id)a3;
- (unsigned)USBCurrentLimitOffsetInmA:(id)a3;
- (unsigned)accessoryChargingCurrentInmA:(id)a3;
- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3 forConnectionUUID:(id)a4;
- (unsigned)sleepPowerCurrentLimitInmA:(id)a3;
- (void)IOAccessoryAuthCPServiceArrived:(unsigned int)a3;
- (void)IOAccessoryAuthCPServiceAuthStatusChanged:(int)a3 authType:(int)a4 authCert:(id)a5 certType:(int)a6 authCTA:(BOOL)a7 service:(unsigned int)a8;
- (void)IOAccessoryAuthCPServiceTerminated:(unsigned int)a3;
- (void)IOAccessoryConfigStreamMessageArrived:(id)a3 endpointUUID:(id)a4;
- (void)IOAccessoryConfigStreamServiceArrived:(unsigned int)a3;
- (void)IOAccessoryConfigStreamServiceTerminated:(unsigned int)a3;
- (void)IOAccessoryConfigStreamUpdateAccesssoryInfo:(id)a3;
- (void)IOAccessoryEAServiceArrived:(unsigned int)a3;
- (void)IOAccessoryEAServiceTerminated:(unsigned int)a3;
- (void)IOAccessoryManagerResistorIDChanged:(int)a3 forManager:(id)a4;
- (void)IOAccessoryManagerServiceArrived:(unsigned int)a3;
- (void)IOAccessoryManagerServiceDetached:(unsigned int)a3;
- (void)IOAccessoryManagerServiceInfoSet:(unsigned int)a3;
- (void)IOAccessoryManagerServiceTerminated:(unsigned int)a3;
- (void)IOAccessoryManagerSupervisedTransportsRestrictedDidChange:(BOOL)a3 forManager:(id)a4;
- (void)IOAccessoryOOBPairingServiceArrived:(unsigned int)a3;
- (void)IOAccessoryOOBPairingServiceTerminated:(unsigned int)a3;
- (void)IOAccessoryPortDetach:(id)a3;
- (void)IOAccessoryPortPropertyChanged:(id)a3;
- (void)IOAccessoryPortPublish:(id)a3;
- (void)IOAccessoryPortServiceArrived:(unsigned int)a3;
- (void)IOAccessoryPortServiceTerminated:(unsigned int)a3;
- (void)_IOAccessoryPortDetachInternal:(id)a3;
- (void)_addIOAccessoryManagerWithIOService:(unsigned int)a3;
- (void)_clearChildPortEndpointsForManagerDisconnection:(id)a3;
- (void)_createEAEndpointForProtocol:(id)a3 andManager:(id)a4;
- (void)_createEAProtocolsForManager:(id)a3;
- (void)_createModuleConnectionAndEndpoint:(id)a3;
- (void)_handleRequestForIAPDPortB139B164Connected:(id)a3;
- (void)_handleRequestForPrimaryPort:(id)a3;
- (void)_handleUSBHostPluginArrived:(id)a3;
- (void)_processEAService:(unsigned int)a3 andPublish:(BOOL)a4;
- (void)closeEASession:(id)a3;
- (void)dealloc;
- (void)handleCloseEASessionNotification:(id)a3;
- (void)handleOpenEASessionNotification:(id)a3;
- (void)lockAccessoryPorts;
- (void)resetLightningBusForEndpointWithUUID:(id)a3;
- (void)setAccessoryPortLock:(id)a3;
- (void)setAllIOAccessories:(id)a3;
- (void)setAllIOAccessoryManagers:(id)a3;
- (void)setDeferAuthCPServiceArray:(id)a3;
- (void)setDeferEAServiceArray:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableDirectAWCAuth:(id)a3;
- (void)setIoAccessoryListener:(id)a3;
- (void)setListQ:(id)a3;
- (void)setRootIOAccessoryManagers:(id)a3;
- (void)shouldEnableDirectAWCAuth;
- (void)startIOACCTransportManager;
- (void)stopIOACCTransportManager;
- (void)transmitData:(id)a3 forEndpointUUID:(id)a4;
- (void)unlockAccessoryPorts;
@end

@implementation ACCTransportIOAccessorySharedManager

- (ACCTransportIOAccessorySharedManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)ACCTransportIOAccessorySharedManager;
  v2 = [(ACCTransportIOAccessorySharedManager *)&v22 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessoryd.ioaccmgr.listq", 0);
    listQ = v2->_listQ;
    v2->_listQ = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    allIOAccessoryManagers = v2->_allIOAccessoryManagers;
    v2->_allIOAccessoryManagers = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    allIOAccessories = v2->_allIOAccessories;
    v2->_allIOAccessories = (NSMutableSet *)v7;

    v9 = [[ACCTransportIOAccessoryListener alloc] initWithDelegate:v2];
    ioAccessoryListener = v2->_ioAccessoryListener;
    v2->_ioAccessoryListener = v9;

    v2->_isB139OrB164Connected = 0;
    v11 = [[ACCSettingsState alloc] initWithKey:@"EnableDirectAWCAuth" applicationID:@"com.apple.CoreAccessories" notification:@"com.apple.CoreAccessories.PreferencesDidChangeNotification" defaultValue:0 invalidValue:-1];
    enableDirectAWCAuth = v2->_enableDirectAWCAuth;
    v2->_enableDirectAWCAuth = v11;

    objc_storeWeak((id *)&v2->_delegate, 0);
    v13 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    accessoryPortLock = v2->_accessoryPortLock;
    v2->_accessoryPortLock = v13;

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v2 selector:sel__handleRequestForIAPDPortB139B164Connected_ name:*MEMORY[0x263F34030] object:0];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v2 selector:sel__handleRequestForPrimaryPort_ name:*MEMORY[0x263F34038] object:0];

    v2->_bIsWatch = MGGetSInt32Answer() == 6;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    deferAuthCPServiceArray = v2->_deferAuthCPServiceArray;
    v2->_deferAuthCPServiceArray = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    deferEAServiceArray = v2->_deferEAServiceArray;
    v2->_deferEAServiceArray = v19;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_sync((dispatch_queue_t)self->_listQ, &__block_literal_global_5);
  listQ = self->_listQ;
  self->_listQ = 0;

  [(NSMutableSet *)self->_allIOAccessoryManagers removeAllObjects];
  allIOAccessoryManagers = self->_allIOAccessoryManagers;
  self->_allIOAccessoryManagers = 0;

  [(NSMutableSet *)self->_allIOAccessories removeAllObjects];
  allIOAccessories = self->_allIOAccessories;
  self->_allIOAccessories = 0;

  ioAccessoryListener = self->_ioAccessoryListener;
  self->_ioAccessoryListener = 0;

  accessoryPortLock = self->_accessoryPortLock;
  self->_accessoryPortLock = 0;

  deferAuthCPServiceArray = self->_deferAuthCPServiceArray;
  self->_deferAuthCPServiceArray = 0;

  deferEAServiceArray = self->_deferEAServiceArray;
  self->_deferEAServiceArray = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v10.receiver = self;
  v10.super_class = (Class)ACCTransportIOAccessorySharedManager;
  [(ACCTransportIOAccessorySharedManager *)&v10 dealloc];
}

- (void)startIOACCTransportManager
{
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  EnableAccessoryPowerForPortService(ServiceWithPrimaryPort, 1);
  IOObjectRelease(ServiceWithPrimaryPort);
  dispatch_time_t v4 = dispatch_time(0, 1250000000);
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ACCTransportIOAccessorySharedManager_startIOACCTransportManager__block_invoke;
  block[3] = &unk_26466B8C8;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

uint64_t __66__ACCTransportIOAccessorySharedManager_startIOACCTransportManager__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 2;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    dispatch_time_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    dispatch_time_t v4 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__ACCTransportIOAccessorySharedManager_startIOACCTransportManager__block_invoke_cold_1(v4, v5, v6);
  }

  return [*(id *)(*(void *)(a1 + 32) + 56) startListening];
}

- (void)stopIOACCTransportManager
{
}

- (id)_managerForBase:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke;
  block[3] = &unk_26466BA58;
  v25 = &v26;
  block[4] = self;
  id v6 = v4;
  id v24 = v6;
  dispatch_sync(listQ, block);
  if ([(id)v27[5] count] != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v7 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(id)v27[5] count];
      uint64_t v15 = v27[5];
      *(_DWORD *)buf = 134218242;
      uint64_t v33 = v14;
      __int16 v34 = 2112;
      uint64_t v35 = v15;
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "found %lu IOAccMgr Ports contained in set! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = (id)v27[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v36 count:16];
  if (!v8)
  {
LABEL_18:
    id v9 = 0;
    goto LABEL_19;
  }
  id v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    uint64_t v11 = 0;
    v12 = v9;
    do
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      id v9 = *(id *)(*((void *)&v19 + 1) + 8 * v11);

      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v36 count:16];
  }
  while (v8);
LABEL_19:

  v16 = v24;
  id v17 = v9;

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) allIOAccessoryManagers];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2;
  v6[3] = &unk_26466C210;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 objectsPassingTest:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

BOOL __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v8 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2_cold_3(v5, a1);
  }

  int v9 = [v5 ioService];
  int v10 = [*(id *)(a1 + 32) upstreamManagerService];
  if (v9 == v10)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2_cold_1();
    }

    *a3 = 1;
  }

  return v9 == v10;
}

- (id)_managerContainingBase:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke;
  block[3] = &unk_26466BA58;
  v25 = &v26;
  block[4] = self;
  id v6 = v4;
  id v24 = v6;
  dispatch_sync(listQ, block);
  if ([(id)v27[5] count] != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(id)v27[5] count];
      uint64_t v15 = v27[5];
      *(_DWORD *)buf = 134218242;
      uint64_t v33 = v14;
      __int16 v34 = 2112;
      uint64_t v35 = v15;
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "unexpectedly found more than 1, %lu IOAccMgr Ports contained in set! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = (id)v27[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v36 count:16];
  if (!v8)
  {
LABEL_18:
    id v9 = 0;
    goto LABEL_19;
  }
  id v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    uint64_t v11 = 0;
    id v12 = v9;
    do
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      id v9 = *(id *)(*((void *)&v19 + 1) + 8 * v11);

      ++v11;
      id v12 = v9;
    }
    while (v8 != v11);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v36 count:16];
  }
  while (v8);
LABEL_19:

  v16 = v24;
  id v17 = v9;

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) allIOAccessoryManagers];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke_2;
  v6[3] = &unk_26466C210;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 objectsPassingTest:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 ioAccessoryChildPorts];
  uint64_t v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 2;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v9 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      id v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke_2_cold_1();
    }

    *a3 = 1;
  }
  return v6;
}

- (id)managerForIOAccessoryManagerService:(unsigned int)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(ACCTransportIOAccessorySharedManager *)self allIOAccessoryManagers];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__ACCTransportIOAccessorySharedManager_managerForIOAccessoryManagerService___block_invoke;
  v20[3] = &__block_descriptor_36_e44_B24__0__ACCTransportIOAccessoryManager_8_B16l;
  unsigned int v21 = a3;
  id v5 = [v4 objectsPassingTest:v20];

  if ([v5 count] != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v6 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v6 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v5 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "unexpectedly found > 1, %lu ACCTransportIOAccessoryManagers contained in set! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (!v7)
  {
LABEL_18:
    id v9 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v17;
  do
  {
    uint64_t v11 = 0;
    id v12 = v9;
    do
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v6);
      }
      id v9 = *(id *)(*((void *)&v16 + 1) + 8 * v11);

      ++v11;
      id v12 = v9;
    }
    while (v8 != v11);
    uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
  }
  while (v8);
LABEL_19:

  return v9;
}

BOOL __76__ACCTransportIOAccessorySharedManager_managerForIOAccessoryManagerService___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ioService] == *(_DWORD *)(a1 + 32);
}

- (id)_managerForIOService:(unsigned int)a3 shouldCreateNewService:(BOOL)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  uint64_t v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__ACCTransportIOAccessorySharedManager__managerForIOService_shouldCreateNewService___block_invoke;
  block[3] = &unk_26466C258;
  unsigned int v8 = a3;
  block[4] = self;
  void block[5] = &v10;
  BOOL v9 = a4;
  dispatch_sync(listQ, block);
  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __84__ACCTransportIOAccessorySharedManager__managerForIOService_shouldCreateNewService___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v2 = (int *)(a1 + 48);
  uint64_t UpstreamService = IOAccessoryManagerGetUpstreamService();
  if (!UpstreamService)
  {
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 2;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __84__ACCTransportIOAccessorySharedManager__managerForIOService_shouldCreateNewService___block_invoke_cold_1(v2, v11, v12);
    }
    goto LABEL_17;
  }
  uint64_t v4 = UpstreamService;
  uint64_t v5 = [*(id *)(a1 + 32) managerForIOAccessoryManagerService:UpstreamService];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && *(unsigned char *)(a1 + 52))
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      unsigned int v8 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v8 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109120;
      int v20 = v4;
      _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "Creating new IOAccMgrService, calling IOAccessoryManagerServiceArrived for serviceID %d?", (uint8_t *)&v19, 8u);
    }

    [*(id *)(a1 + 32) _addIOAccessoryManagerWithIOService:v4];
    uint64_t v14 = [*(id *)(a1 + 32) managerForIOAccessoryManagerService:v4];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = *v2;
      int v19 = 67109376;
      int v20 = v4;
      __int16 v21 = 1024;
      int v22 = v18;
      _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "Created new ACCTransportIOAccessoryManager with  service %d for downstream service %d", (uint8_t *)&v19, 0xEu);
    }
LABEL_17:
  }
}

- (void)_addIOAccessoryManagerWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v23) = 67109120;
    HIDWORD(v23) = v3;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "adding io acc mgr with service %d", (uint8_t *)&v23, 8u);
  }

  unsigned int v8 = [[ACCTransportIOAccessoryManager alloc] initWithIOService:v3];
  [(NSMutableSet *)self->_allIOAccessoryManagers addObject:v8];
  [(NSMutableSet *)self->_allIOAccessories addObject:v8];
  if ([(ACCTransportIOAccessoryManager *)v8 isRootPort])
  {
    [(NSMutableSet *)self->_rootIOAccessoryManagers addObject:v8];
    switch([(ACCTransportIOAccessoryManager *)v8 connectionType])
    {
      case 1:
        objc_storeStrong((id *)&self->_rootE75Manager, v8);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          BOOL v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          BOOL v9 = MEMORY[0x263EF8438];
          id v10 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[ACCTransportIOAccessorySharedManager _addIOAccessoryManagerWithIOService:].cold.4();
        }
        break;
      case 3:
        objc_storeStrong((id *)&self->_rootOrionManager, v8);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          BOOL v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          BOOL v9 = MEMORY[0x263EF8438];
          id v16 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[ACCTransportIOAccessorySharedManager _addIOAccessoryManagerWithIOService:]();
        }
        break;
      case 4:
        if (gLogObjects && gNumLogObjects >= 2)
        {
          BOOL v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          BOOL v9 = MEMORY[0x263EF8438];
          id v17 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          id v13 = "not caching inductive root manager to a root port variable";
          goto LABEL_61;
        }
        break;
      case 8:
        if (gLogObjects && gNumLogObjects >= 2)
        {
          BOOL v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          BOOL v9 = MEMORY[0x263EF8438];
          id v18 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          id v13 = "Not caching AWC root manager to a root port variable";
          goto LABEL_61;
        }
        break;
      case 0xB:
        if (gLogObjects && gNumLogObjects >= 2)
        {
          BOOL v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          BOOL v9 = MEMORY[0x263EF8438];
          id v19 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          id v13 = "Not caching unknown root manager to a root port variable";
LABEL_61:
          uint64_t v14 = v9;
          uint32_t v15 = 2;
          goto LABEL_62;
        }
        break;
      default:
        if (gLogObjects && gNumLogObjects >= 2)
        {
          BOOL v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          BOOL v9 = MEMORY[0x263EF8438];
          id v11 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v12 = [(ACCTransportIOAccessoryManager *)v8 connectionType];
          LODWORD(v23) = 67109120;
          HIDWORD(v23) = v12;
          id v13 = "Not caching unhandled root port connectionType %d to a root port variable";
          uint64_t v14 = v9;
          uint32_t v15 = 8;
LABEL_62:
          _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v23, v15);
        }
        break;
    }
  }
  if ([(ACCTransportIOAccessoryManager *)v8 connectionType] == 1)
  {
    int v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:self selector:sel__handleUSBHostPluginArrived_ name:@"ACCTransportIOAccessory_USBHostPluginArrivedNotification" object:0];
  }
  __int16 v21 = [MEMORY[0x263F08A00] defaultCenter];
  [v21 postNotificationName:@"ACCTransportIOAccessory_IOAccessoryManagerArrivedNotification" object:0];

  if ([(ACCTransportIOAccessoryManager *)v8 connectionType] == 8) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 3;
  }
  [(ACCTransportIOAccessoryManager *)v8 setAccessoryPowerMode:v22];
}

- (id)_managerForBaseEndpointUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _basePortForEndpointUUID:v4];
  if (!v5)
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 2;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    else
    {
      id v10 = *(id *)(gLogObjects + 8);
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_34;
    }
    int v17 = 138412290;
    id v18 = v4;
    uint64_t v14 = "Unable to find accBaseTransport for endpointUUID %@";
    goto LABEL_33;
  }
  uint64_t v6 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v5];
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects <= 1;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (!v6)
  {
    if (v8)
    {
      id v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_34;
    }
    int v17 = 138412290;
    id v18 = v5;
    uint64_t v14 = "Unable to find accMgrTransport for base transport %@";
LABEL_33:
    _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 0xCu);
LABEL_34:
    BOOL v9 = 0;
    goto LABEL_35;
  }
  BOOL v9 = (void *)v6;
  if (v8)
  {
    id v10 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessorySharedManager _managerForBaseEndpointUUID:](v9);
  }
LABEL_35:

  return v9;
}

- (id)_managerForConnectionUUID:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  if (v4)
  {
    listQ = self->_listQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke;
    block[3] = &unk_26466BA58;
    v43 = &v44;
    block[4] = self;
    id v42 = v4;
    dispatch_sync(listQ, block);
  }
  else
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 2;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v9 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:].cold.9(v9);
    }
  }
  id v10 = (void *)v45[5];
  if (!v10)
  {
LABEL_34:
    int v20 = -[ACCTransportIOAccessorySharedManager _basePortForConnectionUUID:](self, "_basePortForConnectionUUID:", v5, (void)v37);
    if (v20)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        __int16 v21 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        __int16 v21 = MEMORY[0x263EF8438];
        id v25 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CE3000, v21, OS_LOG_TYPE_INFO, "Found base port owning connectionUUID, stop looking", buf, 2u);
      }
      id v13 = 0;
      goto LABEL_90;
    }
    uint64_t ServiceWithPort = IOAccessoryPortGetServiceWithPort();
    if (ServiceWithPort)
    {
      uint64_t v23 = [(ACCTransportIOAccessorySharedManager *)self _managerForIOService:ServiceWithPort shouldCreateNewService:0];
      if (v23)
      {
        id v13 = v23;
        if (gLogObjects && gNumLogObjects >= 2)
        {
          uint64_t v24 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          uint64_t v24 = MEMORY[0x263EF8438];
          id v27 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CE3000, v24, OS_LOG_TYPE_DEFAULT, "Found USB port ACCTransportIOAccessoryManager", buf, 2u);
        }

        goto LABEL_76;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v26 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v26 = MEMORY[0x263EF8438];
        id v29 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CE3000, v26, OS_LOG_TYPE_DEFAULT, "Couldn't find ACCTransportIOAccessoryManager for portServiceUSB", buf, 2u);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v26 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v26 = MEMORY[0x263EF8438];
        id v28 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:]();
      }
    }

    v30 = [(ACCTransportIOAccessorySharedManager *)self rootE75Manager];
    BOOL v31 = v30 == 0;

    if (!v31)
    {
      id v13 = [(ACCTransportIOAccessorySharedManager *)self rootE75Manager];
      if (gLogObjects && gNumLogObjects >= 2)
      {
        __int16 v21 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        __int16 v21 = MEMORY[0x263EF8438];
        id v34 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_90;
      }
      *(_WORD *)buf = 0;
      uint64_t v33 = "Did not find manager for USB port. Setting to root Lightning port";
LABEL_89:
      _os_log_impl(&dword_222CE3000, v21, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
LABEL_90:

      goto LABEL_91;
    }
    id v13 = 0;
LABEL_76:
    if (gLogObjects && gNumLogObjects >= 2)
    {
      __int16 v21 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      __int16 v21 = MEMORY[0x263EF8438];
      id v32 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_90;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "ERROR: No root lightning port manager is present";
    goto LABEL_89;
  }
  if ([v10 count] != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      BOOL v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v11 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(id)v45[5] count];
      uint64_t v19 = v45[5];
      *(_DWORD *)buf = 134218498;
      uint64_t v51 = v18;
      __int16 v52 = 2112;
      v53 = v5;
      __int16 v54 = 2112;
      uint64_t v55 = v19;
      _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "Found %lu IOAccMgr Ports contained in set for connectionUUID %@! %@", buf, 0x20u);
    }
    goto LABEL_33;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  BOOL v11 = (id)v45[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v56 count:16];
  if (!v12)
  {
LABEL_33:

    goto LABEL_34;
  }
  id v13 = 0;
  uint64_t v14 = *(void *)v38;
  do
  {
    uint64_t v15 = 0;
    id v16 = v13;
    do
    {
      if (*(void *)v38 != v14) {
        objc_enumerationMutation(v11);
      }
      id v13 = *(id *)(*((void *)&v37 + 1) + 8 * v15);

      ++v15;
      id v16 = v13;
    }
    while (v12 != v15);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v56 count:16];
  }
  while (v12);

  if (!v13) {
    goto LABEL_34;
  }
LABEL_91:
  id v35 = v13;
  _Block_object_dispose(&v44, 8);

  return v35;
}

void __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) allIOAccessoryManagers];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2;
  v6[3] = &unk_26466C210;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 objectsPassingTest:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2_cold_3(v5);
  }

  BOOL v9 = [v5 connectionUUID];
  uint64_t v11 = *(void *)(a1 + 32);
  id v10 = (uint64_t *)(a1 + 32);
  uint64_t v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v13 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2_cold_1(v10, v13);
    }

    *a3 = 1;
  }

  return v12;
}

- (BOOL)_managerForConnectionUUIDHasActiveEndpoint:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:a3];
  uint64_t v4 = v3;
  if (!v3)
  {
    BOOL v19 = 0;
    goto LABEL_59;
  }
  [v3 ioAccessoryChildPorts];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v6)
  {
    BOOL v19 = 0;
    goto LABEL_58;
  }
  uint64_t v7 = v6;
  id v28 = v4;
  uint64_t v8 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      NSClassFromString(&cfstr_Acctransportio_23.isa);
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        uint64_t v12 = [v11 ioAccPortEndpointUUID];

        if (v12)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            int v20 = *(id *)(gLogObjects + 8);
            uint64_t v4 = v28;
          }
          else
          {
            uint64_t v4 = v28;
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            int v20 = MEMORY[0x263EF8438];
            id v21 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_57;
          }
          uint64_t v22 = [v11 ioAccPortEndpointUUID];
          *(_DWORD *)buf = 138412290;
          id v34 = v22;
          uint64_t v23 = "found IOAccessoryPort with active endpointUUID %@";
LABEL_56:
          _os_log_impl(&dword_222CE3000, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);

LABEL_57:
          BOOL v19 = 1;
          goto LABEL_58;
        }
      }
      else
      {
        NSClassFromString(&cfstr_Acctransportio_24.isa);
        if (objc_opt_isKindOfClass())
        {
          id v13 = v10;
          id v14 = [v13 endpointUUID];

          if (v14)
          {
            if (gLogObjects && gNumLogObjects >= 2)
            {
              int v20 = *(id *)(gLogObjects + 8);
              uint64_t v4 = v28;
            }
            else
            {
              uint64_t v4 = v28;
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              int v20 = MEMORY[0x263EF8438];
              id v24 = MEMORY[0x263EF8438];
            }
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_57;
            }
            uint64_t v22 = [v13 endpointUUID];
            *(_DWORD *)buf = 138412290;
            id v34 = v22;
            uint64_t v23 = "found IOAccessoryEA with active endpointUUID %@";
            goto LABEL_56;
          }
        }
        else
        {
          NSClassFromString(&cfstr_Acctransportio_25.isa);
          if (objc_opt_isKindOfClass())
          {
            id v15 = v10;
            id v16 = [v15 endpointUUID];

            if (v16)
            {
              if (gLogObjects && gNumLogObjects >= 2)
              {
                int v20 = *(id *)(gLogObjects + 8);
                uint64_t v4 = v28;
              }
              else
              {
                uint64_t v4 = v28;
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                  -[ACCTransportIOAccessoryOOBPairing dealloc]();
                }
                int v20 = MEMORY[0x263EF8438];
                id v25 = MEMORY[0x263EF8438];
              }
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              uint64_t v22 = [v15 endpointUUID];
              *(_DWORD *)buf = 138412290;
              id v34 = v22;
              uint64_t v23 = "found IOAccessoryOOBPairing with active endpointUUID %@";
              goto LABEL_56;
            }
          }
          else
          {
            NSClassFromString(&cfstr_Acctransportio_26.isa);
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            id v17 = v10;
            uint64_t v18 = [v17 endpointUUID];

            if (v18)
            {
              if (gLogObjects && gNumLogObjects >= 2)
              {
                int v20 = *(id *)(gLogObjects + 8);
                uint64_t v4 = v28;
              }
              else
              {
                uint64_t v4 = v28;
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                  -[ACCTransportIOAccessoryOOBPairing dealloc]();
                }
                int v20 = MEMORY[0x263EF8438];
                id v26 = MEMORY[0x263EF8438];
              }
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              uint64_t v22 = [v17 endpointUUID];
              *(_DWORD *)buf = 138412290;
              id v34 = v22;
              uint64_t v23 = "found IOAccessoryConfigStream with active endpointUUID %@";
              goto LABEL_56;
            }
          }
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v7) {
      continue;
    }
    break;
  }
  BOOL v19 = 0;
  uint64_t v4 = v28;
LABEL_58:

LABEL_59:
  return v19;
}

- (id)_basePortForService:(unsigned int)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__0;
  long long v29 = __Block_byref_object_dispose__0;
  id v30 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ACCTransportIOAccessorySharedManager__basePortForService___block_invoke;
  block[3] = &unk_26466C2A0;
  block[4] = self;
  void block[5] = &v25;
  unsigned int v24 = a3;
  dispatch_sync(listQ, block);
  if ([(id)v26[5] count] != 1)
  {
    uint64_t v10 = [(id)v26[5] count];
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects <= 1;
    }
    else {
      BOOL v11 = 1;
    }
    int v12 = !v11;
    if (v10)
    {
      if (v12)
      {
        uint64_t v4 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v4 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
        goto LABEL_31;
      }
    }
    else
    {
      if (v12)
      {
        uint64_t v4 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v4 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
        goto LABEL_31;
      }
    }
    uint64_t v15 = [(id)v26[5] count];
    uint64_t v16 = v26[5];
    *(_DWORD *)buf = 134218242;
    uint64_t v32 = v15;
    __int16 v33 = 2112;
    uint64_t v34 = v16;
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_INFO, "Found %lu IOBase Ports contained in set! %@", buf, 0x16u);
LABEL_31:
    id v6 = 0;
    goto LABEL_32;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = (id)v26[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v35 count:16];
  if (!v5) {
    goto LABEL_31;
  }
  id v6 = 0;
  uint64_t v7 = *(void *)v20;
  do
  {
    uint64_t v8 = 0;
    BOOL v9 = v6;
    do
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      id v6 = *(id *)(*((void *)&v19 + 1) + 8 * v8);

      ++v8;
      BOOL v9 = v6;
    }
    while (v5 != v8);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v35 count:16];
  }
  while (v5);
LABEL_32:

  id v17 = v6;
  _Block_object_dispose(&v25, 8);

  return v17;
}

void __60__ACCTransportIOAccessorySharedManager__basePortForService___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) allIOAccessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__ACCTransportIOAccessorySharedManager__basePortForService___block_invoke_2;
  v6[3] = &__block_descriptor_36_e41_B24__0__ACCTransportIOAccessoryBase_8_B16l;
  int v7 = *(_DWORD *)(a1 + 48);
  uint64_t v3 = [v2 objectsPassingTest:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

BOOL __60__ACCTransportIOAccessorySharedManager__basePortForService___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 ioService];
  int v6 = *(_DWORD *)(a1 + 32);
  if (v5 == v6) {
    *a3 = 1;
  }
  return v5 == v6;
}

- (id)_basePortForEndpointUUID:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  __int16 v33 = __Block_byref_object_copy__0;
  uint64_t v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ACCTransportIOAccessorySharedManager__basePortForEndpointUUID___block_invoke;
  block[3] = &unk_26466C2F0;
  long long v29 = &v30;
  block[4] = self;
  uint64_t v23 = @"ACCTransportIOAccessoryPort";
  id v6 = v4;
  id v24 = v6;
  uint64_t v25 = @"ACCTransportIOAccessoryEA";
  id v26 = @"ACCTransportIOAccessoryOOBPairing";
  uint64_t v27 = @"ACCTransportIOAccessoryAuthCP";
  id v28 = @"ACCTransportIOAccessoryConfigStream";
  dispatch_sync(listQ, block);
  if ([(id)v31[5] count] != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      int v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(id)v31[5] count];
      *(_DWORD *)buf = 134218242;
      uint64_t v37 = v14;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_INFO, "Found %lu IOBase Ports contained in set for endpointUUID! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v7 = (id)v31[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v40 count:16];
  if (!v8)
  {
LABEL_18:
    id v9 = 0;
    goto LABEL_19;
  }
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    uint64_t v11 = 0;
    int v12 = v9;
    do
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      id v9 = *(id *)(*((void *)&v18 + 1) + 8 * v11);

      ++v11;
      int v12 = v9;
    }
    while (v8 != v11);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v40 count:16];
  }
  while (v8);
LABEL_19:

  uint64_t v15 = v28;
  id v16 = v9;

  _Block_object_dispose(&v30, 8);
  return v16;
}

void __65__ACCTransportIOAccessorySharedManager__basePortForEndpointUUID___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) allIOAccessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__ACCTransportIOAccessorySharedManager__basePortForEndpointUUID___block_invoke_2;
  v6[3] = &unk_26466C2C8;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 80);
  uint64_t v3 = [v2 objectsPassingTest:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __65__ACCTransportIOAccessorySharedManager__basePortForEndpointUUID___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  NSClassFromString(*(NSString **)(a1 + 32));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSClassFromString(*(NSString **)(a1 + 48));
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v5 endpointUUID];
      int v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

      if (!v10) {
        goto LABEL_35;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v8 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v8 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_47;
      }
      uint64_t v19 = *(void *)(a1 + 40);
      int v29 = 138412290;
      uint64_t v30 = v19;
      uint64_t v15 = "Found IOAccessoryEA with endpointUUID %@";
    }
    else
    {
      NSClassFromString(*(NSString **)(a1 + 56));
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v5 endpointUUID];
        int v12 = [v11 isEqualToString:*(void *)(a1 + 40)];

        if (!v12) {
          goto LABEL_35;
        }
        if (gLogObjects && gNumLogObjects >= 2)
        {
          id v8 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v8 = MEMORY[0x263EF8438];
          id v24 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          goto LABEL_47;
        }
        uint64_t v25 = *(void *)(a1 + 40);
        int v29 = 138412290;
        uint64_t v30 = v25;
        uint64_t v15 = "Found IOAccessoryOOBPairing with endpointUUID %@";
      }
      else
      {
        NSClassFromString(*(NSString **)(a1 + 64));
        if (objc_opt_isKindOfClass())
        {
          id v16 = [v5 endpointUUID];
          int v17 = [v16 isEqualToString:*(void *)(a1 + 40)];

          if (!v17) {
            goto LABEL_35;
          }
          if (gLogObjects && gNumLogObjects >= 2)
          {
            id v8 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            id v8 = MEMORY[0x263EF8438];
            id v26 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
            goto LABEL_47;
          }
          uint64_t v27 = *(void *)(a1 + 40);
          int v29 = 138412290;
          uint64_t v30 = v27;
          uint64_t v15 = "Found IOAccessoryAuthCP with endpointUUID %@";
        }
        else
        {
          NSClassFromString(*(NSString **)(a1 + 72));
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_35;
          }
          long long v20 = [v5 endpointUUID];
          int v21 = [v20 isEqualToString:*(void *)(a1 + 40)];

          if (!v21) {
            goto LABEL_35;
          }
          id v8 = logObjectForModule_0(1);
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
LABEL_47:

            uint64_t v23 = 1;
            *a3 = 1;
            goto LABEL_48;
          }
          uint64_t v22 = *(void *)(a1 + 40);
          int v29 = 138412290;
          uint64_t v30 = v22;
          uint64_t v15 = "Found IOAccessoryConfigStream with endpointUUID %@";
        }
      }
    }
LABEL_46:
    _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v29, 0xCu);
    goto LABEL_47;
  }
  id v6 = [v5 ioAccPortEndpointUUID];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 40)];

  if (v7)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v8 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v8 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_47;
    }
    uint64_t v14 = *(void *)(a1 + 40);
    int v29 = 138412290;
    uint64_t v30 = v14;
    uint64_t v15 = "Found IOAccessoryPort with endpointUUID %@";
    goto LABEL_46;
  }
LABEL_35:
  uint64_t v23 = 0;
LABEL_48:

  return v23;
}

- (id)_basePortForConnectionUUID:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  int v29 = __Block_byref_object_copy__0;
  uint64_t v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ACCTransportIOAccessorySharedManager__basePortForConnectionUUID___block_invoke;
  block[3] = &unk_26466C340;
  uint64_t v25 = &v26;
  block[4] = self;
  uint64_t v23 = @"ACCTransportIOAccessoryAuthCP";
  id v6 = v4;
  id v24 = v6;
  dispatch_sync(listQ, block);
  if ([(id)v27[5] count] != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      int v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(id)v27[5] count];
      *(_DWORD *)buf = 134218242;
      uint64_t v33 = v14;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_INFO, "Found %lu IOBase Ports contained in set for connectionUUID! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v7 = (id)v27[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v36 count:16];
  if (!v8)
  {
LABEL_18:
    id v9 = 0;
    goto LABEL_19;
  }
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    uint64_t v11 = 0;
    int v12 = v9;
    do
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      id v9 = *(id *)(*((void *)&v18 + 1) + 8 * v11);

      ++v11;
      int v12 = v9;
    }
    while (v8 != v11);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v36 count:16];
  }
  while (v8);
LABEL_19:

  uint64_t v15 = v24;
  id v16 = v9;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __67__ACCTransportIOAccessorySharedManager__basePortForConnectionUUID___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) allIOAccessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__ACCTransportIOAccessorySharedManager__basePortForConnectionUUID___block_invoke_2;
  v6[3] = &unk_26466C318;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 objectsPassingTest:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __67__ACCTransportIOAccessorySharedManager__basePortForConnectionUUID___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  NSClassFromString(*(NSString **)(a1 + 32));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 connectionUUID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:*(void *)(a1 + 40)],
        v6,
        v7))
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v8 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v8 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    uint64_t v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_INFO, "Found IOAccessoryAuthCP with connectionUUID %@", (uint8_t *)&v13, 0xCu);
    }

    *a3 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_portForManagerMatchingPrimaryPort:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  int v29 = __Block_byref_object_copy__0;
  uint64_t v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__ACCTransportIOAccessorySharedManager__portForManagerMatchingPrimaryPort___block_invoke;
  block[3] = &unk_26466C390;
  uint64_t v25 = &v26;
  id v6 = v4;
  id v24 = v6;
  dispatch_sync(listQ, block);
  if ([(id)v27[5] count] != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      int v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(id)v27[5] count];
      int v15 = [v6 primaryPortNumber];
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = v14;
      __int16 v34 = 1024;
      int v35 = v15;
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_INFO, "Found %lu IOBase Ports contained in set for primaryPort %d", buf, 0x12u);
    }
    goto LABEL_18;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v7 = (id)v27[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v36 count:16];
  if (!v8)
  {
LABEL_18:
    id v9 = 0;
    goto LABEL_19;
  }
  id v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    uint64_t v11 = 0;
    int v12 = v9;
    do
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      id v9 = *(id *)(*((void *)&v19 + 1) + 8 * v11);

      ++v11;
      int v12 = v9;
    }
    while (v8 != v11);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v36 count:16];
  }
  while (v8);
LABEL_19:

  id v16 = v24;
  id v17 = v9;

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __75__ACCTransportIOAccessorySharedManager__portForManagerMatchingPrimaryPort___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) ioAccessoryChildPorts];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__ACCTransportIOAccessorySharedManager__portForManagerMatchingPrimaryPort___block_invoke_2;
  v6[3] = &unk_26466C368;
  id v7 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 objectsPassingTest:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __75__ACCTransportIOAccessorySharedManager__portForManagerMatchingPrimaryPort___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  id v6 = v5;
  int v7 = [v6 portIDNumber];
  if (v7 != [*(id *)(a1 + 32) primaryPortNumber])
  {

LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v8 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v8 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [v6 portIDNumber];
    int v12 = [*(id *)(a1 + 32) primaryPortNumber];
    v14[0] = 67109376;
    v14[1] = v11;
    __int16 v15 = 1024;
    int v16 = v12;
    _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "Found IOAccessoryPort with portID %d, matching primaryPort %d", (uint8_t *)v14, 0xEu);
  }

  uint64_t v9 = 1;
  *a3 = 1;

LABEL_14:
  return v9;
}

- (void)_processEAService:(unsigned int)a3 andPublish:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  int v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForIOService:*(void *)&a3 shouldCreateNewService:1];
  if ([v7 isAuthenticated])
  {
    uint64_t v8 = [[ACCTransportIOAccessoryEA alloc] initWithDelegate:self andIOService:v5];
    if ([(ACCTransportIOAccessorySharedManager *)self _addACCTransportToManager:v8])
    {
      listQ = self->_listQ;
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      int v29 = __69__ACCTransportIOAccessorySharedManager__processEAService_andPublish___block_invoke;
      uint64_t v30 = &unk_26466BB38;
      id v31 = self;
      uint64_t v32 = v8;
      dispatch_sync(listQ, &v27);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v10 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Successfully added io accessory EA service to all ports list", buf, 2u);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v13 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v13 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v34) = [(ACCTransportIOAccessoryBase *)v8 ioService];
        _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_INFO, "Couldn't find upstream io acc manager service for accEA service %d", buf, 8u);
      }
    }
    long long v19 = [(ACCTransportIOAccessoryEA *)v8 deviceModelNumber];
    if ([v19 isEqualToString:@"A1468"])
    {
    }
    else
    {
      long long v20 = [(ACCTransportIOAccessoryEA *)v8 deviceModelNumber];
      int v21 = [v20 isEqualToString:@"A1450"];

      if (!v21)
      {
LABEL_44:
        [(ACCTransportIOAccessorySharedManager *)self _createEAProtocolsForManager:v7];
        if (v4)
        {
          uint64_t v25 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          uint64_t v26 = [v7 connectionUUID];
          [v25 publishConnectionWithUUID:v26];
        }
        goto LABEL_47;
      }
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      long long v22 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      long long v22 = MEMORY[0x263EF8438];
      id v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [(ACCTransportIOAccessoryEA *)v8 deviceModelNumber];
      *(_DWORD *)buf = 138412290;
      __int16 v34 = v24;
      _os_log_impl(&dword_222CE3000, v22, OS_LOG_TYPE_DEFAULT, "Have a B139/B164 connected, accEA.deviceModelNumber %@", buf, 0xCu);
    }
    self->_isB139OrB164Connected = 1;
    goto LABEL_44;
  }
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 2;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v14 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v14 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v34 = v7;
    __int16 v35 = 1024;
    int v36 = [v7 isAuthenticated];
    __int16 v37 = 1024;
    int v38 = v5;
    _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ isAuthenticated=%d Defer creating of ACCTransportIOAccessoryEA until auth passes for accEa %d", buf, 0x18u);
  }

  deferEAServiceArray = self->_deferEAServiceArray;
  int v16 = [[DeferredEAServiceWrapper alloc] initWithIOService:v5 withMgr:v7];
  [(NSMutableArray *)deferEAServiceArray addObject:v16];

  IOObjectRetain(v5);
LABEL_47:
}

uint64_t __69__ACCTransportIOAccessorySharedManager__processEAService_andPublish___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)_createEAProtocolsForManager:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 connectionUUID];

    if (!v5)
    {
      id v6 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      int v7 = objc_msgSend(v6, "createConnectionWithType:andIdentifier:", objc_msgSend(v4, "connectionType"), 0);

      uint64_t v8 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      objc_msgSend(v8, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v4, "supervisedTransportsRestricted"), v7);

      [v4 setConnectionUUID:v7];
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v9 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        BOOL v11 = [v4 connectionUUID];
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = (uint64_t)v11;
        _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_INFO, "Created a new connection with UUID: %@", buf, 0xCu);
      }
      v42[0] = *MEMORY[0x263F34178];
      id v12 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v4, "primaryPortNumber"));
      v43[0] = v12;
      v42[1] = *MEMORY[0x263F34150];
      id v13 = [v4 digitalID];
      uint64_t v14 = v13;
      if (!v13)
      {
        uint64_t v14 = [MEMORY[0x263EFF9D0] null];
      }
      v43[1] = v14;
      __int16 v15 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
      if (!v13) {

      }
      int v16 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      id v17 = (void *)[v15 copy];
      [v16 setProperties:v17 forConnectionWithUUID:v7];
    }
    id v18 = [v4 eaProtocolChildPorts];
    if (gLogObjects && gNumLogObjects >= 2)
    {
      long long v19 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      long long v19 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = (uint64_t)v18;
      _os_log_impl(&dword_222CE3000, v19, OS_LOG_TYPE_INFO, "accEAEndpointsForManager = %@", buf, 0xCu);
    }

    int v21 = [(ACCTransportIOAccessorySharedManager *)self delegate];

    if (v21)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      __int16 v35 = v18;
      id v22 = v18;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v38;
        uint64_t v26 = MEMORY[0x263EF8438];
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v38 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v28 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            int v29 = [v28 endpointUUID];

            if (v29)
            {
              uint64_t v30 = gLogObjects;
              int v31 = gNumLogObjects;
              if (gLogObjects) {
                BOOL v32 = gNumLogObjects < 2;
              }
              else {
                BOOL v32 = 1;
              }
              if (v32)
              {
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  uint64_t v45 = v30;
                  __int16 v46 = 1024;
                  int v47 = v31;
                  _os_log_error_impl(&dword_222CE3000, v26, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                uint64_t v33 = v26;
                __int16 v34 = v26;
              }
              else
              {
                __int16 v34 = *(id *)(gLogObjects + 8);
              }
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_222CE3000, v34, OS_LOG_TYPE_INFO, "Skipped re-creating endpoint with existing UUID.", buf, 2u);
              }
            }
            else
            {
              [(ACCTransportIOAccessorySharedManager *)self _createEAEndpointForProtocol:v28 andManager:v4];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v24);
      }

      id v18 = v35;
    }
  }
}

- (void)_createEAEndpointForProtocol:(id)a3 andManager:(id)a4
{
  v43[9] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  if (v8)
  {
    uint64_t v30 = self;
    v42[0] = *MEMORY[0x263F34110];
    __int16 v35 = [v6 deviceName];
    v43[0] = v35;
    v42[1] = *MEMORY[0x263F34108];
    __int16 v34 = [v6 deviceModelNumber];
    v43[1] = v34;
    void v42[2] = *MEMORY[0x263F34100];
    uint64_t v33 = [v6 deviceVendorName];
    void v43[2] = v33;
    v42[3] = *MEMORY[0x263F34130];
    BOOL v32 = [v6 deviceSerialNumber];
    v43[3] = v32;
    v42[4] = *MEMORY[0x263F340F0];
    int v31 = [v6 deviceFirmwareRevision];
    v43[4] = v31;
    v42[5] = *MEMORY[0x263F340F8];
    uint64_t v9 = [v6 deviceHardwareRevision];
    v43[5] = v9;
    v42[6] = *MEMORY[0x263F34118];
    id v10 = [v7 ppid];
    BOOL v11 = v10;
    if (!v10)
    {
      BOOL v11 = [MEMORY[0x263EFF9D0] null];
    }
    v43[6] = v11;
    v42[7] = *MEMORY[0x263F34128];
    id v12 = [v7 regionCode];
    id v13 = v12;
    if (!v12)
    {
      id v13 = [MEMORY[0x263EFF9D0] null];
    }
    v43[7] = v13;
    v42[8] = *MEMORY[0x263F340E0];
    uint64_t v14 = [v7 inductiveDeviceUID];
    __int16 v15 = v14;
    if (!v14)
    {
      __int16 v15 = [MEMORY[0x263EFF9D0] null];
    }
    v43[8] = v15;
    int v16 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:9];
    if (!v14) {

    }
    if (!v12) {
    if (!v10)
    }

    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v17 = *(id *)(gLogObjects + 8);
      id v18 = v30;
    }
    else
    {
      id v18 = v30;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v17 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v20 = [v6 eaProtocol];
      int v21 = [v7 connectionUUID];
      *(_DWORD *)buf = 138412802;
      long long v37 = v16;
      __int16 v38 = 2112;
      long long v39 = v20;
      __int16 v40 = 2112;
      uint64_t v41 = v21;
      _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_INFO, "accInfoDictionary = %@, accEAProtocol.eaProtocol = %@, ioAccMgr.connectionUUID = %@", buf, 0x20u);
    }
    id v22 = [(ACCTransportIOAccessorySharedManager *)v18 delegate];
    uint64_t v23 = [v6 eaProtocol];
    uint64_t v24 = [v7 connectionUUID];
    uint64_t v25 = (void *)[v24 copy];
    uint64_t v26 = [v22 createEndpointWithTransportType:5 andProtocol:5 andIdentifier:v23 forConnectionWithUUID:v25 publishConnection:0];

    uint64_t v27 = [(ACCTransportIOAccessorySharedManager *)v18 delegate];
    [v27 setAccessoryInfo:v16 forEndpointWithUUID:v26];

    uint64_t v28 = (void *)[v26 copy];
    [v6 setEndpointUUID:v28];

    int v29 = [v7 connectionUUID];
    [v6 setParentConnectionUUID:v29];
  }
}

- (void)_clearChildPortEndpointsForManagerDisconnection:(id)a3
{
  id v3 = [a3 ioAccessoryChildPorts];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_107];
}

void __88__ACCTransportIOAccessorySharedManager__clearChildPortEndpointsForManagerDisconnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 2;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      id v6 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 ioAccPortEndpointUUID];
      int v20 = 138412290;
      int v21 = v7;
      _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "Clearing endpointUUID %@ from childIOAccessoryPort", (uint8_t *)&v20, 0xCu);
    }
    [v3 setIoAccPortEndpointUUID:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v2;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v9 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [v8 endpointUUID];
      int v20 = 138412290;
      int v21 = v11;
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "Clearing endpointUUID %@ from childEAAccessoryPort", (uint8_t *)&v20, 0xCu);
    }
    [v8 setEndpointUUID:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v2;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v13 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [v12 endpointUUID];
      int v20 = 138412290;
      int v21 = v15;
      _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEFAULT, "Clearing endpointUUID %@ from childOOBPairingPort", (uint8_t *)&v20, 0xCu);
    }
    [v12 setEndpointUUID:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v2;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v17 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v17 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v16 endpointUUID];
      int v20 = 138412290;
      int v21 = v19;
      _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_DEFAULT, "Clearing endpointUUID %@ from childConfigStreamPort", (uint8_t *)&v20, 0xCu);
    }
    [v16 setEndpointUUID:0];
  }
}

- (int)_connectionTypeForIOAccessoryPort:(id)a3
{
  id v4 = a3;
  [v4 upstreamManagerService];
  char Type = IOAccessoryManagerGetType();
  if (Type == 3 || (!self->_bIsWatch && (Type & 0xF) != 5 ? (int v6 = 1) : (int v6 = 4), Type == 6)) {
    int v6 = 6;
  }
  int v7 = [v4 portIDNumber];

  if (v7 == 257) {
    return 8;
  }
  if (v7 == 256) {
    return 3;
  }
  return v6;
}

- (int)_endpointTransportTypeForIOAccessoryPort:(id)a3
{
  id v3 = a3;
  int v4 = [v3 portIDNumber];
  if ((v4 - 6) <= 0xF)
  {
    int v5 = [v3 portTransportType];
    int v6 = v5;
    if (v5 == 7) {
      goto LABEL_18;
    }
    if (v5 != 19)
    {
      int v6 = 1;
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  int v6 = 5;
  if (v4 > 256)
  {
    if (v4 == 257)
    {
      int v6 = 9;
      goto LABEL_18;
    }
    if (v4 == 512)
    {
LABEL_14:
      if ([v3 portStreamType] == 5) {
        int v6 = 14;
      }
      else {
        int v6 = 12;
      }
    }
  }
  else
  {
    if (v4 == 2) {
      int v7 = 0;
    }
    else {
      int v7 = 5;
    }
    if (v4 == 1) {
      int v6 = 6;
    }
    else {
      int v6 = v7;
    }
  }
LABEL_18:

  return v6;
}

- (BOOL)_addACCTransportToManager:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v4];
  int v6 = (void *)v5;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects <= 1;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (v5)
  {
    if (v8)
    {
      uint64_t v9 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      LODWORD(v15) = [v6 ioService];
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "Found IOAccessoryManager with service %u, adding child port to manager", (uint8_t *)&v14, 8u);
    }

    [v6 addIOAccessoryChildPort:v4];
  }
  else
  {
    if (v8)
    {
      id v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v14 = 138413058;
      id v15 = v4;
      __int16 v16 = 1024;
      int v17 = [v4 ioService];
      __int16 v18 = 1024;
      int v19 = [v4 primaryPortNumber];
      __int16 v20 = 1024;
      int v21 = [v4 upstreamManagerService];
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Couldn't find Manager for basePort %@, ioService %d, primaryPortNumber %d, upstreamManagerService %d", (uint8_t *)&v14, 0x1Eu);
    }
  }
  return v6 != 0;
}

- (void)_handleRequestForIAPDPortB139B164Connected:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ACCTransportIOAccessorySharedManager *)self isB139OrB164Connected];
  id v4 = [NSNumber numberWithBool:v3];
  uint64_t v7 = *MEMORY[0x263F34020];
  v8[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:*MEMORY[0x263F34050] object:0 userInfo:v5];
}

- (void)_handleRequestForPrimaryPort:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F34028]];
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    int v8 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v5;
    _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_INFO, "Request for primary port: connectionUUID = %@", buf, 0xCu);
  }

  uint64_t v9 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v5];
  id v10 = (void *)v9;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 1;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v9)
  {
    if (v12)
    {
      id v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v13 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v10 primaryPortNumber];
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v16;
      _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEFAULT, "Request for primary port: found managerForConnectionUUID. PrimaryPort is %d", buf, 8u);
    }

    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "primaryPortNumber"));
  }
  else
  {
    if (v12)
    {
      int v14 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v14 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_DEFAULT, "Request for primary port: did not find managerForConnectionUUID for primary port! Assume primary port number is built-in port", buf, 2u);
    }

    uint64_t v17 = [NSNumber numberWithInt:1];
  }
  int v19 = (void *)v17;
  uint64_t v22 = *MEMORY[0x263F34018];
  uint64_t v23 = v17;
  __int16 v20 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  int v21 = [MEMORY[0x263F08A00] defaultCenter];
  [v21 postNotificationName:*MEMORY[0x263F34058] object:0 userInfo:v20];
}

- (void)handleOpenEASessionNotification:(id)a3
{
  BOOL v3 = [(ACCTransportIOAccessorySharedManager *)self _basePortForEndpointUUID:a3];
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = [v3 ioServiceClassType] == 2;
    BOOL v3 = v5;
    if (v4)
    {
      [v5 openEAServiceSession];
      BOOL v3 = v5;
    }
  }
}

- (void)handleCloseEASessionNotification:(id)a3
{
  BOOL v3 = [(ACCTransportIOAccessorySharedManager *)self _basePortForEndpointUUID:a3];
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = [v3 ioServiceClassType] == 2;
    BOOL v3 = v5;
    if (v4)
    {
      [v5 closeEAServiceSession];
      BOOL v3 = v5;
    }
  }
}

- (void)_handleUSBHostPluginArrived:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = @"ACCTransportIOAccessory_USBHostPluginArrivedNotification";
    __int16 v10 = 2112;
    BOOL v11 = @"ACCTransportIOAccessory_IOAccessoryManagerArrivedNotification";
    _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "Received %@ notification, notifying %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"ACCTransportIOAccessory_IOAccessoryManagerArrivedNotification" object:0];
}

- (void)transmitData:(id)a3 forEndpointUUID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 2;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    __int16 v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    __int16 v10 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
  }

  if (acc_userDefaultsLogging_BOOLForKey(@"TransportSignpost"))
  {
    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      BOOL v11 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
      }
      BOOL v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    uint64_t v13 = [v7 hash];
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v11))
      {
        int v19 = 138412546;
        id v20 = v7;
        __int16 v21 = 2048;
        uint64_t v22 = [v6 length];
        _os_signpost_emit_with_name_impl(&dword_222CE3000, v11, OS_SIGNPOST_EVENT, v14, "Endpoint SEND", "Send outgoing data! %@, %lu bytes", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  id v15 = [(ACCTransportIOAccessorySharedManager *)self _basePortForEndpointUUID:v7];
  int v16 = v15;
  if (v15)
  {
    [v15 transmitData:v6];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v17 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v17 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v7;
      _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_INFO, "No ACCTransport handler for connectionUUID %@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (BOOL)shouldEnableDirectAWCAuth
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 2;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessorySharedManager shouldEnableDirectAWCAuth]((uint64_t)self);
  }

  return [(ACCSettingsState *)self->_enableDirectAWCAuth BOOLValue];
}

- (BOOL)setProperties:(id)a3 forManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  id v9 = v8;
  char v10 = 0;
  if (v6 && v8)
  {

    if (!v7)
    {
      char v10 = 0;
      goto LABEL_6;
    }
    id v9 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    BOOL v11 = [v7 connectionUUID];
    char v10 = [v9 setProperties:v6 forConnectionWithUUID:v11];
  }
LABEL_6:

  return v10;
}

- (BOOL)openEASession:(id)a3 withEAEndpointUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 2;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    char v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    char v10 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Opening EA session for protocol %@ and endpoint UUID %@", (uint8_t *)&v17, 0x16u);
  }

  BOOL v11 = [(ACCTransportIOAccessorySharedManager *)self _basePortForEndpointUUID:v7];
  id v12 = v11;
  if (v11)
  {
    char v13 = [v11 openEAServiceSession];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      os_signpost_id_t v14 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      os_signpost_id_t v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_INFO, "Could not find ACCTransportIOAccessoryEA object for protocol %@", (uint8_t *)&v17, 0xCu);
    }

    char v13 = 0;
  }

  return v13;
}

- (void)closeEASession:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_INFO, "Closing EA session for eaEndpointUUID %@", (uint8_t *)&v12, 0xCu);
  }

  BOOL v8 = [(ACCTransportIOAccessorySharedManager *)self _basePortForEndpointUUID:v4];
  id v9 = v8;
  if (v8)
  {
    [v8 closeEAServiceSession];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      char v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      char v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Could not find ACCTransportIOAccessoryEA object for eaEndpointUUID %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (BOOL)setUSBMode:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v6];
  BOOL v8 = v7;
  if (!v7)
  {
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects < 2;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_34;
  }
  int v9 = [v7 setUSBMode:v4];
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 1;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (!v9)
  {
    if (v11)
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager setUSBMode:forConnectionUUID:].cold.4();
    }
LABEL_34:
    BOOL v16 = 0;
    goto LABEL_35;
  }
  if (v11)
  {
    int v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v12 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessorySharedManager setUSBMode:forConnectionUUID:]();
  }
  BOOL v16 = 1;
LABEL_35:

  return v16;
}

- (BOOL)setUSBMode:(int)a3 forEndpointUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForBaseEndpointUUID:v6];
  BOOL v8 = v7;
  if (!v7)
  {
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects < 2;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base endpoint UUID %@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_34;
  }
  int v9 = [v7 setUSBMode:v4];
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 1;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (!v9)
  {
    if (v11)
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager setUSBMode:forEndpointUUID:].cold.4();
    }
LABEL_34:
    BOOL v16 = 0;
    goto LABEL_35;
  }
  if (v11)
  {
    int v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v12 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessorySharedManager setUSBMode:forEndpointUUID:]();
  }
  BOOL v16 = 1;
LABEL_35:

  return v16;
}

- (int)USBModeForConnectionUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 getUSBMode];
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessorySharedManager setUSBMode:forConnectionUUID:]();
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }
    int v7 = -1;
  }

  return v7;
}

- (int)USBModeForEndpointUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForBaseEndpointUUID:v4];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 getUSBMode];
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessorySharedManager setUSBMode:forEndpointUUID:]();
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base endpoint UUID %@", (uint8_t *)&v14, 0xCu);
    }
    int v7 = -1;
  }

  return v7;
}

- (int)_accPlatformPowerModeToIOAccessoryPowerMode:(int)a3
{
  return a3;
}

- (BOOL)configureAccessoryPowerMode:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(ACCTransportIOAccessorySharedManager *)self _accPlatformPowerModeToIOAccessoryPowerMode:v4];
  BOOL v8 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v6];
  id v9 = v8;
  if (v8)
  {
    [v8 setAccessoryPowerMode:v7];
    BOOL v10 = [v9 accessoryPowerMode] == v7;
  }
  else
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 2;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v13 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v13 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v15, 0xCu);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)setUSBCurrentOffset:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v6];
  BOOL v8 = v7;
  if (v7)
  {
    char v9 = [v7 setUSBCurrentOffset:v4];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      id v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    char v9 = 0;
  }

  return v9;
}

- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  char v9 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v8];
  BOOL v10 = v9;
  if (v9)
  {
    char v11 = [v9 setUSBCurrentLimitBase:v6 forceResponse:v5];
  }
  else
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 2;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v14 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      int v14 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v16, 0xCu);
    }

    char v11 = 0;
  }

  return v11;
}

- (unsigned)USBCurrentLimitInmA:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 USBCurrentLimitInmA];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    unsigned int v7 = 0;
  }

  return v7;
}

- (unsigned)USBCurrentLimitBaseInmA:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 USBCurrentLimitBaseInmA];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    unsigned int v7 = 0;
  }

  return v7;
}

- (unsigned)USBCurrentLimitOffsetInmA:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 USBCurrentLimitOffsetInmA];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    unsigned int v7 = 0;
  }

  return v7;
}

- (unsigned)USBChargingVoltageInmV:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 USBChargingVoltageInmV];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    unsigned int v7 = 0;
  }

  return v7;
}

- (int)CableType:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 cableType];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    int v7 = 0;
  }

  return v7;
}

- (unsigned)sleepPowerCurrentLimitInmA:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    if (([v5 isRootPort] & 1) == 0)
    {
      int v7 = [v6 connectionType];
      if (v7 == 1)
      {
        uint64_t v8 = 64;
      }
      else
      {
        if (v7 != 3) {
          goto LABEL_23;
        }
        uint64_t v8 = 72;
      }
      id v13 = *(id *)((char *)&self->super.isa + v8);
      if (v13)
      {
        char v11 = v13;
        unsigned int v12 = [v13 sleepPowerCurrentLimitInmA];
        unsigned int v14 = [v6 sleepPowerCurrentLimitInmA];
        unsigned int v15 = v14;
        if (v12 >= v14)
        {
          char v17 = 0;
          unsigned int v12 = v14;
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            int v16 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            int v16 = MEMORY[0x263EF8438];
            id v26 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v27 = [v6 connectionUUID];
            int v29 = [v6 primaryPortNumber];
            uint64_t v28 = [v11 connectionUUID];
            *(_DWORD *)buf = 138413826;
            id v31 = v4;
            __int16 v32 = 2112;
            uint64_t v33 = v27;
            __int16 v34 = 1024;
            int v35 = v29;
            __int16 v36 = 2112;
            long long v37 = v28;
            __int16 v38 = 1024;
            int v39 = [v11 primaryPortNumber];
            __int16 v40 = 1024;
            unsigned int v41 = v15;
            __int16 v42 = 1024;
            unsigned int v43 = v12;
            _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_INFO, "connectionUUID %@, accMgrTransport %@ (%d), rootMgr %@ (%d), sleepPowerCurrentLimitInmA=%d -> %d", buf, 0x38u);
          }
          char v17 = 0;
        }
        goto LABEL_24;
      }
    }
LABEL_23:
    unsigned int v12 = [v6 sleepPowerCurrentLimitInmA];
    char v11 = 0;
    char v17 = 1;
LABEL_24:
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v18 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v20 = [v6 connectionUUID];
      int v21 = [v6 primaryPortNumber];
      int v22 = v21;
      if (v17)
      {
        *(_DWORD *)buf = 138413570;
        id v31 = v4;
        __int16 v32 = 2112;
        uint64_t v33 = v20;
        __int16 v34 = 1024;
        int v35 = v21;
        __int16 v36 = 2112;
        long long v37 = 0;
        __int16 v38 = 1024;
        int v39 = -1;
        __int16 v40 = 1024;
        unsigned int v41 = v12;
        _os_log_impl(&dword_222CE3000, v18, OS_LOG_TYPE_INFO, "connectionUUID %@, accMgrTransport %@ (%d), rootMgr %@ (%d), sleepPowerCurrentLimitInmA=%d", buf, 0x32u);
      }
      else
      {
        uint64_t v23 = [v11 connectionUUID];
        int v24 = [v11 primaryPortNumber];
        *(_DWORD *)buf = 138413570;
        id v31 = v4;
        __int16 v32 = 2112;
        uint64_t v33 = v20;
        __int16 v34 = 1024;
        int v35 = v22;
        __int16 v36 = 2112;
        long long v37 = v23;
        __int16 v38 = 1024;
        int v39 = v24;
        __int16 v40 = 1024;
        unsigned int v41 = v12;
        _os_log_impl(&dword_222CE3000, v18, OS_LOG_TYPE_INFO, "connectionUUID %@, accMgrTransport %@ (%d), rootMgr %@ (%d), sleepPowerCurrentLimitInmA=%d", buf, 0x32u);
      }
    }

    goto LABEL_36;
  }
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 2;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    char v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    char v11 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v4;
    _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", buf, 0xCu);
  }
  unsigned int v12 = 0;
LABEL_36:

  return v12;
}

- (BOOL)isPowerDuringSleepSupported:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [v5 isPowerDuringSleepSupported];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      id v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    char v7 = 0;
  }

  return v7;
}

- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3 forConnectionUUID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v6];
  BOOL v8 = v7;
  if (v7)
  {
    char v9 = [v7 setPowerDuringSleepEnabled:v4];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    char v9 = 0;
  }

  return v9;
}

- (BOOL)isPowerDuringSleepEnabled:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 isPowerDuringSleepEnabled];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    char v7 = 0;
  }

  return v7;
}

- (BOOL)setBatteryPackMode:(BOOL)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v8];
  BOOL v10 = v9;
  if (v9)
  {
    char v11 = [v9 setBatteryPackMode:v6 forceResponse:v5];
  }
  else
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 2;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v14 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v14 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v16, 0xCu);
    }

    char v11 = 0;
  }

  return v11;
}

- (BOOL)isBatteryPackModeEnabled:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  BOOL v6 = v5;
  if (v5)
  {
    char v7 = [v5 isBatteryPackModeEnabled];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    char v7 = 0;
  }

  return v7;
}

- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v6];
  BOOL v8 = v7;
  if (v7)
  {
    char v9 = [v7 setAccessoryRequestedCurrent:v4];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    char v9 = 0;
  }

  return v9;
}

- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v6];
  BOOL v8 = v7;
  if (v7)
  {
    char v9 = [v7 setAccessoryUsedCurrent:v4];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    char v9 = 0;
  }

  return v9;
}

- (BOOL)resetAccessoryBaseCurrent:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 resetAccessoryBaseCurrent];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    char v7 = 0;
  }

  return v7;
}

- (unsigned)accessoryChargingCurrentInmA:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v4];
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 accessoryChargingCurrentInmA];
  }
  else
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 2;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    unsigned int v7 = 0;
  }

  return v7;
}

- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unsigned int v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:v6];
  BOOL v8 = v7;
  if (v7)
  {
    unsigned int v9 = [v7 accessoryPowerModeCurrentLimitInmA:v4];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      int v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    unsigned int v9 = 0;
  }

  return v9;
}

- (id)digitalIDDataForUpstreamConnection:(id)a3
{
  uint64_t v4 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:a3];
  BOOL v5 = -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", [v4 upstreamManagerService]);
  id v6 = [v5 digitalID];

  return v6;
}

- (BOOL)connectedThroughAdapter:(id)a3
{
  uint64_t v4 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:a3];
  BOOL v5 = -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", [v4 upstreamManagerService]);
  id v6 = [v5 digitalID];
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)setFeaturesFromAuthStatus:(int)a3 andAuthCert:(id)a4 certType:(int)a5 forConnectionUUID:(id)a6 withConnectionType:(int)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  uint64_t v13 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUID:a6];
  int v14 = (void *)v13;
  if (a7 == 1 && !v13)
  {
    if (gLogObjects) {
      BOOL v15 = gNumLogObjects < 2;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v17 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    else
    {
      id v17 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_DEFAULT, "Setting allowed features for root E75", v20, 2u);
    }

    int v14 = [(ACCTransportIOAccessorySharedManager *)self rootE75Manager];
  }
  char v18 = [v14 setFeaturesFromAuthStatus:v10 authCert:v12 certType:v9];

  return v18;
}

- (void)_createModuleConnectionAndEndpoint:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 accConnectionType] == 7)
  {
    unsigned int v5 = [v4 representsInternalModule] - 1;
    if (v5 <= 2)
    {
      uint64_t v6 = dword_222D4A378[v5];
      BOOL v7 = off_26466C418[v5];
      BOOL v8 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      objc_msgSend(v8, "createConnectionWithType:andIdentifier:", objc_msgSend(v4, "accConnectionType"), 0);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      uint64_t v10 = -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", [v4 upstreamManagerService]);

      if (v10)
      {
        id v11 = [(ACCTransportIOAccessorySharedManager *)self delegate];
        id v12 = -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", [v4 upstreamManagerService]);
        objc_msgSend(v11, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v12, "supervisedTransportsRestricted"), v9);
      }
      if (v9)
      {
        uint64_t v13 = [(ACCTransportIOAccessorySharedManager *)self delegate];
        int v14 = (void *)[(__CFString *)v9 copy];
        BOOL v15 = [v13 createEndpointWithTransportType:v6 andProtocol:2 andIdentifier:0 forConnectionWithUUID:v14 publishConnection:0];

        if (v15)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            id v16 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            id v16 = MEMORY[0x263EF8438];
            id v17 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            __int16 v32 = v15;
            __int16 v33 = 2112;
            __int16 v34 = v7;
            _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_DEFAULT, "Created endpointUUID %{public}@ for %@ AppleAuthCP", buf, 0x16u);
          }

          char v18 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          [v18 publishConnectionWithUUID:v9];

          [v4 setConnectionUUID:v9];
          [v4 setEndpointUUID:v15];
          uint64_t v19 = *MEMORY[0x263F34108];
          v29[0] = *MEMORY[0x263F34110];
          v29[1] = v19;
          v30[0] = @"Internal Hardware";
          v30[1] = v7;
          uint64_t v20 = *MEMORY[0x263F34130];
          v29[2] = *MEMORY[0x263F34100];
          v29[3] = v20;
          v30[2] = @"Apple Inc.";
          v30[3] = @"NotApplicable";
          uint64_t v21 = *MEMORY[0x263F340F8];
          v29[4] = *MEMORY[0x263F340F0];
          v29[5] = v21;
          v30[4] = @"NotApplicable";
          v30[5] = @"NotApplicable";
          int v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:6];
          if (gLogObjects && gNumLogObjects >= 2)
          {
            uint64_t v23 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            uint64_t v23 = MEMORY[0x263EF8438];
            id v24 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v32 = v22;
            __int16 v33 = 2112;
            __int16 v34 = v9;
            _os_log_impl(&dword_222CE3000, v23, OS_LOG_TYPE_DEFAULT, "accInfoDictionary for hardware accessory = %@, connectionUUID = %@", buf, 0x16u);
          }

          uint64_t v25 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          [v25 setAccessoryInfo:v22 forEndpointWithUUID:v15];

          if (gLogObjects && gNumLogObjects >= 2)
          {
            id v26 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            id v26 = MEMORY[0x263EF8438];
            id v27 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v32 = v9;
            _os_log_impl(&dword_222CE3000, v26, OS_LOG_TYPE_DEFAULT, "Publishing connection: %@ with eACCEndpoint_Protocol_InternalInfo", buf, 0xCu);
          }

          uint64_t v28 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          [v28 publishConnectionWithUUID:v9];
        }
        else
        {
          BOOL v15 = logObjectForModule_0(1);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            __int16 v32 = v7;
            __int16 v33 = 2112;
            __int16 v34 = v9;
            _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEFAULT, "Failed to create endpointUUID for %{public}@ AppleAuthCP and to publish connection: %@", buf, 0x16u);
          }
        }
      }
    }
  }
}

- (void)IOAccessoryManagerServiceArrived:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v12 = a3;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_INFO, "IOAccMgr service arrived with service %d", buf, 8u);
  }

  listQ = self->_listQ;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceArrived___block_invoke;
  v9[3] = &unk_26466C1E8;
  v9[4] = self;
  unsigned int v10 = a3;
  dispatch_sync(listQ, v9);
}

void __73__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceArrived___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managerForIOAccessoryManagerService:*(unsigned int *)(a1 + 40)];
  if (v2)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 1;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v5 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(a1 + 40);
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "Already connected IOAccMgr service with service %d", (uint8_t *)v7, 8u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _addIOAccessoryManagerWithIOService:*(unsigned int *)(a1 + 40)];
  }
}

- (void)IOAccessoryManagerServiceDetached:(unsigned int)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceDetached___block_invoke;
  block[3] = &unk_26466C2A0;
  unsigned int v18 = a3;
  void block[4] = self;
  void block[5] = &v19;
  dispatch_sync(listQ, block);
  BOOL v7 = (void *)v20[5];
  if (v7)
  {
    uint64_t v8 = [v7 connectionUUID];

    if (v8)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v9 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v9 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = [(id)v20[5] connectionUUID];
        *(_DWORD *)buf = 67109378;
        unsigned int v26 = a3;
        __int16 v27 = 2112;
        uint64_t v28 = v12;
        _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager service %d detach, remove connectionUUID %@", buf, 0x12u);
      }
      uint64_t v13 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      int v14 = [(id)v20[5] connectionUUID];
      [v13 destroyConnectionWithUUID:v14];

      [(id)v20[5] setConnectionUUID:0];
      [(ACCTransportIOAccessorySharedManager *)self _clearChildPortEndpointsForManagerDisconnection:v20[5]];
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      unsigned int v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unsigned int v10 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v26 = a3;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Couldn't find ACCTransportIOAccessoryManager for service %d", buf, 8u);
    }
  }
  id v16 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v16 unlock];

  _Block_object_dispose(&v19, 8);
}

void __74__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceDetached___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 2;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager SERVICE DETACH: handling detach for io acc mgr with service %d", (uint8_t *)v9, 8u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) managerForIOAccessoryManagerService:*(unsigned int *)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)IOAccessoryManagerServiceTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v8 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v25 = v3;
    _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager SERVICE TERMINATED: removing io acc mgr with service %d", buf, 8u);
  }

  uint64_t v9 = [(ACCTransportIOAccessorySharedManager *)self managerForIOAccessoryManagerService:v3];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [v9 connectionUUID];

    if (v11)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        unsigned int v12 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        unsigned int v12 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v10 connectionUUID];
        *(_DWORD *)buf = 67109378;
        int v25 = v3;
        __int16 v26 = 2112;
        __int16 v27 = v15;
        _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager service %d terminated, remove connectionUUID %@", buf, 0x12u);
      }
      id v16 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      id v17 = [v10 connectionUUID];
      [v16 destroyConnectionWithUUID:v17];

      [v10 setConnectionUUID:0];
      [(ACCTransportIOAccessorySharedManager *)self _clearChildPortEndpointsForManagerDisconnection:v10];
    }
    listQ = self->_listQ;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceTerminated___block_invoke;
    v21[3] = &unk_26466BB38;
    int v22 = v10;
    uint64_t v23 = self;
    dispatch_sync(listQ, v21);
    uint64_t v13 = v22;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v13 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = v3;
      _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_INFO, "Couldn't find ACCTransportIOAccessoryManager for service %d on service termination", buf, 8u);
    }
  }

  uint64_t v20 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v20 unlock];
}

void __76__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceTerminated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) transportClassTerminated];
  [*(id *)(*(void *)(a1 + 40) + 40) removeObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 32) removeObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 48) removeObject:*(void *)(a1 + 32)];
  int v2 = [*(id *)(a1 + 32) ioService];
  uint64_t v3 = [*(id *)(a1 + 40) rootE75Manager];
  int v4 = [v3 ioService];

  if (v2 == v4)
  {
    uint64_t v5 = 64;
  }
  else
  {
    int v6 = [*(id *)(a1 + 32) ioService];
    id v7 = [*(id *)(a1 + 40) rootOrionManager];
    int v8 = [v7 ioService];

    if (v6 != v8) {
      return;
    }
    uint64_t v5 = 72;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + v5);
  *(void *)(v9 + v5) = 0;
}

- (void)IOAccessoryManagerServiceInfoSet:(unsigned int)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  int v4 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v4 lock];

  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "Accessory info set for IOAccessoryManager service %d", buf, 8u);
  }

  *(void *)buf = 0;
  v121 = buf;
  uint64_t v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__0;
  v124 = __Block_byref_object_dispose__0;
  id v125 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceInfoSet___block_invoke;
  block[3] = &unk_26466C2A0;
  void block[4] = self;
  void block[5] = buf;
  unsigned int v110 = a3;
  dispatch_sync(listQ, block);
  uint64_t v9 = [*((id *)v121 + 5) connectionUUID];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v115 = 67109120;
      LODWORD(v116) = a3;
      _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "No connectionUUID for IOAccessoryManager service %d yet, creating one", v115, 8u);
    }

    uint64_t v13 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    id v14 = objc_msgSend(v13, "createConnectionWithType:andIdentifier:", objc_msgSend(*((id *)v121 + 5), "connectionType"), 0);

    id v15 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    objc_msgSend(v15, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(*((id *)v121 + 5), "supervisedTransportsRestricted"), v14);

    [*((id *)v121 + 5) setConnectionUUID:v14];
    v118[0] = *MEMORY[0x263F34178];
    id v16 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(*((id *)v121 + 5), "primaryPortNumber"));
    v119[0] = v16;
    v118[1] = *MEMORY[0x263F34150];
    id v17 = [*((id *)v121 + 5) digitalID];
    unsigned int v18 = v17;
    if (!v17)
    {
      unsigned int v18 = [MEMORY[0x263EFF9D0] null];
    }
    v119[1] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:2];
    if (!v17) {

    }
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v19];
    if ([*((id *)v121 + 5) isAdapter])
    {
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*((id *)v121 + 5), "isAdapter"));
      [v20 setObject:v21 forKey:*MEMORY[0x263F34168]];
    }
    int v22 = [*((id *)v121 + 5) managerParent];

    if (v22)
    {
      uint64_t v23 = [*((id *)v121 + 5) managerParent];
      [v20 setObject:v23 forKey:*MEMORY[0x263F34170]];
    }
    id v24 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    int v25 = (void *)[v20 copy];
    [v24 setProperties:v25 forConnectionWithUUID:v14];
  }
  if ([*((id *)v121 + 5) connectionType] != 4 || self->_bIsWatch)
  {
    id v26 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    __int16 v27 = [*((id *)v121 + 5) connectionUUID];
    id v28 = [v27 copy];
    uint64_t v29 = [v26 createEndpointWithTransportType:5 andProtocol:2 andIdentifier:0 forConnectionWithUUID:v28 publishConnection:0];

    goto LABEL_32;
  }
  v68 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  v69 = [*((id *)v121 + 5) connectionUUID];
  v70 = [v68 endpointUUIDsForConnectionWithUUID:v69];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v26 = v70;
  uint64_t v71 = [v26 countByEnumeratingWithState:&v105 objects:v117 count:16];
  if (!v71)
  {

LABEL_143:
    __int16 v27 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    v86 = [*((id *)v121 + 5) connectionUUID];
    v87 = (void *)[v86 copy];
    uint64_t v29 = [v27 createEndpointWithTransportType:12 andProtocol:1 andIdentifier:0 forConnectionWithUUID:v87 publishConnection:0];

    goto LABEL_32;
  }
  uint64_t v29 = 0;
  uint64_t v72 = *(void *)v106;
  do
  {
    for (uint64_t i = 0; i != v71; ++i)
    {
      if (*(void *)v106 != v72) {
        objc_enumerationMutation(v26);
      }
      v74 = *(void **)(*((void *)&v105 + 1) + 8 * i);
      v75 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      int v76 = [v75 transportTypeForEndpointWithUUID:v74];

      v77 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      int v78 = [v77 protocolForEndpointWithUUID:v74];

      if (v76 == 12 && v78 == 1)
      {
        id v80 = v74;

        uint64_t v29 = v80;
      }
    }
    uint64_t v71 = [v26 countByEnumeratingWithState:&v105 objects:v117 count:16];
  }
  while (v71);

  if (!v29) {
    goto LABEL_143;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    __int16 v27 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    __int16 v27 = MEMORY[0x263EF8438];
    id v88 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v115 = 138412290;
    v116 = v29;
    _os_log_impl(&dword_222CE3000, v27, OS_LOG_TYPE_DEFAULT, "Found existing endpointUUID %@ for IOAccessoryManager accessory info", v115, 0xCu);
  }
LABEL_32:

  if (gLogObjects) {
    BOOL v30 = gNumLogObjects <= 1;
  }
  else {
    BOOL v30 = 1;
  }
  int v31 = !v30;
  if (v29)
  {
    if (v31)
    {
      __int16 v32 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      __int16 v32 = MEMORY[0x263EF8438];
      id v34 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v115 = 138412290;
      v116 = v29;
      _os_log_impl(&dword_222CE3000, v32, OS_LOG_TYPE_DEFAULT, "Created endpointUUID %@ for IOAccessoryManager accessory info", v115, 0xCu);
    }

    v113[0] = *MEMORY[0x263F34110];
    v103 = [*((id *)v121 + 5) deviceName];
    uint64_t v35 = (uint64_t)v103;
    if (!v103)
    {
      uint64_t v35 = [MEMORY[0x263EFF9D0] null];
    }
    v96 = (void *)v35;
    v114[0] = v35;
    v113[1] = *MEMORY[0x263F34108];
    v100 = [*((id *)v121 + 5) deviceModelNumber];
    uint64_t v36 = (uint64_t)v100;
    if (!v100)
    {
      uint64_t v36 = [MEMORY[0x263EFF9D0] null];
    }
    v95 = (void *)v36;
    v114[1] = v36;
    v113[2] = *MEMORY[0x263F34100];
    v99 = [*((id *)v121 + 5) deviceVendorName];
    uint64_t v37 = (uint64_t)v99;
    if (!v99)
    {
      uint64_t v37 = [MEMORY[0x263EFF9D0] null];
    }
    v94 = (void *)v37;
    v114[2] = v37;
    v113[3] = *MEMORY[0x263F34130];
    v98 = [*((id *)v121 + 5) deviceSerialNumber];
    uint64_t v38 = (uint64_t)v98;
    if (!v98)
    {
      uint64_t v38 = [MEMORY[0x263EFF9D0] null];
    }
    v93 = (void *)v38;
    v114[3] = v38;
    v113[4] = *MEMORY[0x263F340F0];
    v101 = [*((id *)v121 + 5) deviceFirmwareRevision];
    uint64_t v39 = (uint64_t)v101;
    if (!v101)
    {
      uint64_t v39 = [MEMORY[0x263EFF9D0] null];
    }
    v92 = (void *)v39;
    v114[4] = v39;
    v113[5] = *MEMORY[0x263F340F8];
    v97 = [*((id *)v121 + 5) deviceHardwareRevision];
    uint64_t v40 = (uint64_t)v97;
    if (!v97)
    {
      uint64_t v40 = [MEMORY[0x263EFF9D0] null];
    }
    v91 = (void *)v40;
    v114[5] = v40;
    v113[6] = *MEMORY[0x263F34118];
    unsigned int v41 = [*((id *)v121 + 5) ppid];
    uint64_t v42 = (uint64_t)v41;
    if (!v41)
    {
      uint64_t v42 = [MEMORY[0x263EFF9D0] null];
    }
    v90 = (void *)v42;
    v114[6] = v42;
    v113[7] = *MEMORY[0x263F34128];
    unsigned int v43 = [*((id *)v121 + 5) regionCode];
    uint64_t v44 = (uint64_t)v43;
    if (!v43)
    {
      uint64_t v44 = [MEMORY[0x263EFF9D0] null];
    }
    v89 = (void *)v44;
    v114[7] = v44;
    v113[8] = *MEMORY[0x263F340E0];
    uint64_t v45 = [*((id *)v121 + 5) inductiveDeviceUID];
    __int16 v46 = v45;
    if (!v45)
    {
      __int16 v46 = [MEMORY[0x263EFF9D0] null];
    }
    v114[8] = v46;
    v113[9] = *MEMORY[0x263F34138];
    int v47 = [*((id *)v121 + 5) vendorID];
    uint64_t v48 = v47;
    if (!v47)
    {
      uint64_t v48 = [MEMORY[0x263EFF9D0] null];
    }
    v114[9] = v48;
    v113[10] = *MEMORY[0x263F34120];
    id v49 = [*((id *)v121 + 5) productID];
    v50 = v49;
    if (!v49)
    {
      v50 = [MEMORY[0x263EFF9D0] null];
    }
    v114[10] = v50;
    v104 = [NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:11];
    if (!v49) {

    }
    if (!v47) {
    if (!v45)
    }

    if (!v43) {
    if (!v41)
    }

    if (!v97) {
    if (!v101)
    }

    if (!v98) {
    if (!v99)
    }

    if (!v100) {
    if (!v103)
    }

    uint64_t v51 = [*((id *)v121 + 5) connectionUUID];
    NSLog(&cfstr_Accinfodiction.isa, v104, v51);

    __int16 v52 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    [v52 setAccessoryInfo:v104 forEndpointWithUUID:v29];

    v53 = [*((id *)v121 + 5) inductiveLocalDeviceID];

    if (v53)
    {
      uint64_t v111 = *MEMORY[0x263F34160];
      __int16 v54 = [*((id *)v121 + 5) inductiveLocalDeviceID];
      v112 = v54;
      uint64_t v55 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];

      v56 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      uint64_t v57 = [*((id *)v121 + 5) connectionUUID];
      [v56 setProperties:v55 forConnectionWithUUID:v57];
    }
    v58 = [*((id *)v121 + 5) eaProtocolChildPorts];
    int v59 = [v58 count];

    v60 = [*((id *)v121 + 5) oobPairingChildPorts];
    int v61 = [v60 count];

    v62 = [*((id *)v121 + 5) configStreamChildPorts];
    int v63 = [v62 count];

    if (gLogObjects) {
      BOOL v64 = gNumLogObjects <= 1;
    }
    else {
      BOOL v64 = 1;
    }
    int v65 = !v64;
    if (v59 || v61 || v63)
    {
      if (v65)
      {
        v67 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v67 = MEMORY[0x263EF8438];
        id v84 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        -[ACCTransportIOAccessorySharedManager IOAccessoryManagerServiceInfoSet:]((uint64_t)v115, [*((id *)v121 + 5) ioService], v67);
      }
    }
    else
    {
      if (v65)
      {
        v66 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v66 = MEMORY[0x263EF8438];
        id v82 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v115 = 0;
        _os_log_impl(&dword_222CE3000, v66, OS_LOG_TYPE_DEFAULT, "Publishing connection with eACCEndpoint_Protocol_InternalInfo", v115, 2u);
      }

      v67 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      v83 = [*((id *)v121 + 5) connectionUUID];
      [v67 publishConnectionWithUUID:v83];
    }
  }
  else
  {
    if (v31)
    {
      __int16 v33 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      __int16 v33 = MEMORY[0x263EF8438];
      id v81 = MEMORY[0x263EF8438];
    }
    v104 = v33;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v115 = 67109120;
      LODWORD(v116) = a3;
      _os_log_impl(&dword_222CE3000, v33, OS_LOG_TYPE_DEFAULT, "Failed to create endpointUUID for IOAccessoryManager info for service %d", v115, 8u);
    }
  }

  v85 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v85 unlock];

  _Block_object_dispose(buf, 8);
}

uint64_t __73__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceInfoSet___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) managerForIOAccessoryManagerService:*(unsigned int *)(a1 + 48)];
  return MEMORY[0x270F9A758]();
}

- (void)IOAccessoryManagerResistorIDChanged:(int)a3 forManager:(id)a4
{
  v29[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ACCTransportIOAccessorySharedManager *)self _portForManagerMatchingPrimaryPort:v6];
  int v8 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v8 lock];

  if (v7)
  {
    uint64_t v9 = [v7 ioAccPortEndpointUUID];

    if (v9)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        BOOL v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        BOOL v10 = MEMORY[0x263EF8438];
        id v15 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      id v16 = [v6 connectionUUID];
      id v17 = [v7 ioAccPortEndpointUUID];
      int v24 = 138412546;
      int v25 = v16;
      __int16 v26 = 2112;
      __int16 v27 = v17;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "Already have a connection %@ and an endpoint %@ when handling resistorIDChanged...ignore it", (uint8_t *)&v24, 0x16u);
    }
    else
    {
      id v11 = [(ACCTransportIOAccessorySharedManager *)self IOAccessoryPortArrived:v7 withEndpointProtocol:3 publish:1];
      BOOL v10 = v11;
      if (v11)
      {
        id v12 = [v11 copy];
        [v7 setIoAccPortEndpointUUID:v12];
      }
      uint64_t v13 = [v6 connectionUUID];

      if (!v13) {
        goto LABEL_24;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        id v14 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v14 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [v6 connectionUUID];
        int v24 = 138412290;
        int v25 = v19;
        _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_DEFAULT, "SharedManager: Have a connection UUID %@, sending resistorID notification", (uint8_t *)&v24, 0xCu);
      }
      id v16 = [NSNumber numberWithInteger:a3];
      v28[0] = *MEMORY[0x263F34028];
      uint64_t v20 = [v6 connectionUUID];
      v28[1] = *MEMORY[0x263F34040];
      v29[0] = v20;
      v29[1] = v16;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

      int v22 = [MEMORY[0x263F08A00] defaultCenter];
      [v22 postNotificationName:*MEMORY[0x263F34048] object:0 userInfo:v21];
    }
LABEL_24:
  }
  uint64_t v23 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v23 unlock];
}

- (void)IOAccessoryManagerSupervisedTransportsRestrictedDidChange:(BOOL)a3 forManager:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v7 lock];

  if (v6
    && ([v6 connectionUUID], int v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v9 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v6 connectionUUID];
      v17[0] = 67109378;
      v17[1] = v4;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "sending supervisedTransports %d notification for connectionUUID %@", (uint8_t *)v17, 0x12u);
    }
    id v12 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    id v15 = [v6 connectionUUID];
    [v12 setSupervisedTransportsRestricted:v4 forConnectionWithUUID:v15];
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      id v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_DEFAULT, "no connectionUUID, not sending supervisedTransports notification", (uint8_t *)v17, 2u);
    }
  }

  id v16 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v16 unlock];
}

- (void)IOAccessoryPortServiceArrived:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = [(ACCTransportIOAccessorySharedManager *)self _managerForIOService:*(void *)&a3 shouldCreateNewService:1];
  id v6 = [(ACCTransportIOAccessorySharedManager *)self _basePortForService:v3];
  if (v6)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 2;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v11 = (ACCTransportIOAccessoryPort *)MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      id v11 = (ACCTransportIOAccessoryPort *)*(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v22 = v3;
      _os_log_impl(&dword_222CE3000, &v11->super.super, OS_LOG_TYPE_DEFAULT, "already existing ACCTransportIOAccessoryPort for service ID %d", buf, 8u);
    }
  }
  else
  {
    id v11 = [[ACCTransportIOAccessoryPort alloc] initWithDelegate:self andIOService:v3];
    if ([(ACCTransportIOAccessorySharedManager *)self _addACCTransportToManager:v11])
    {
      listQ = self->_listQ;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      id v17 = __70__ACCTransportIOAccessorySharedManager_IOAccessoryPortServiceArrived___block_invoke;
      __int16 v18 = &unk_26466BB38;
      id v19 = self;
      id v11 = v11;
      uint64_t v20 = v11;
      dispatch_sync(listQ, &v15);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        BOOL v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        BOOL v10 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v22 = v3;
        _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "Successfully added io accessory port service %d to all ports list", buf, 8u);
      }

      [(ACCTransportIOAccessoryPort *)v11 portServiceRegistrationComplete];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v12 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v12 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v22 = [(ACCTransportIOAccessoryBase *)v11 ioService];
        _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "Couldn't find upstream io acc manager service for accPort service %d", buf, 8u);
      }
    }
  }
}

uint64_t __70__ACCTransportIOAccessorySharedManager_IOAccessoryPortServiceArrived___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)IOAccessoryPortServiceTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = [(ACCTransportIOAccessorySharedManager *)self _basePortForService:v3];
  BOOL v7 = (void *)v6;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 1;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      BOOL v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = v3;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "IOAccessoryPort TERMINATED: found terminated service %d", buf, 8u);
    }

    [v7 transportClassTerminated];
    [(ACCTransportIOAccessorySharedManager *)self _IOAccessoryPortDetachInternal:v7];
    uint64_t v13 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v7];
    id v11 = v13;
    if (gLogObjects) {
      BOOL v14 = gNumLogObjects <= 1;
    }
    else {
      BOOL v14 = 1;
    }
    int v15 = !v14;
    if (v13)
    {
      if (v15)
      {
        uint64_t v16 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v16 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [v11 ioService];
        *(_DWORD *)buf = 67109376;
        int v27 = v19;
        __int16 v28 = 1024;
        int v29 = v3;
        _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_DEFAULT, "Found manager with service %d for removed IOAccessoryPortService  %d", buf, 0xEu);
      }

      [v11 removeIOAccessoryChildPort:v7];
    }
    else
    {
      if (v15)
      {
        id v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v17 = MEMORY[0x263EF8438];
        id v21 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v27 = v3;
        _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_INFO, "Didn't find manager for removed accessory port service %d", buf, 8u);
      }
    }
    listQ = self->_listQ;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __73__ACCTransportIOAccessorySharedManager_IOAccessoryPortServiceTerminated___block_invoke;
    v24[3] = &unk_26466BB38;
    v24[4] = self;
    id v25 = v7;
    dispatch_sync(listQ, v24);
  }
  else
  {
    if (v9)
    {
      id v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = v3;
      _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed IOPort service %d", buf, 8u);
    }
  }

  uint64_t v23 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v23 unlock];
}

uint64_t __73__ACCTransportIOAccessorySharedManager_IOAccessoryPortServiceTerminated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)IOAccessoryAuthCPServiceArrived:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v59[2] = *MEMORY[0x263EF8340];
  IOAccessoryManagerGetUpstreamService();
  BOOL v5 = (IOAccessoryManagerGetType() & 0xF) == 5;
  BOOL bIsWatch = self->_bIsWatch;
  BOOL v7 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v7 lock];

  BOOL v8 = [(ACCTransportIOAccessorySharedManager *)self _managerForIOService:v3 shouldCreateNewService:1];
  if (([v8 needsOOBPairing] & 1) == 0)
  {
    if (v8) {
      uint64_t v10 = [v8 connectionType];
    }
    else {
      uint64_t v10 = 7;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      int v15 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v15 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = v10;
      _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_INFO, "ACCTransportIOAccessoryAuthCP connectionchar Type = %d", buf, 8u);
    }

    id v17 = [[ACCTransportIOAccessoryAuthCP alloc] initWithDelegate:self andIOService:v3 connectionType:v10];
    BOOL v14 = v17;
    if (v17)
    {
      if (!v8)
      {
        listQ = self->_listQ;
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke_130;
        v48[3] = &unk_26466BB38;
        v48[4] = self;
        BOOL v14 = v17;
        id v49 = v14;
        dispatch_sync(listQ, v48);
        if ([(ACCTransportIOAccessoryAuthCP *)v14 representsInternalModule]
           - 1 <= 2)
          [(ACCTransportIOAccessorySharedManager *)self _createModuleConnectionAndEndpoint:v14];
        if (gLogObjects && gNumLogObjects >= 2)
        {
          id v21 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v21 = MEMORY[0x263EF8438];
          id v23 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CE3000, v21, OS_LOG_TYPE_DEFAULT, "Starting auth process for AuthCP Service that has no associated parent IOAccMgr", buf, 2u);
        }

        int v24 = v49;
        goto LABEL_70;
      }
      if ([(ACCTransportIOAccessorySharedManager *)self _addACCTransportToManager:v17])
      {
        id v18 = self->_listQ;
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke;
        v50[3] = &unk_26466BB38;
        v50[4] = self;
        BOOL v14 = v14;
        uint64_t v51 = v14;
        dispatch_sync(v18, v50);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          int v19 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          int v19 = MEMORY[0x263EF8438];
          id v25 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CE3000, v19, OS_LOG_TYPE_INFO, "Successfully added io accessory authCP to all ports list", buf, 2u);
        }

        if (bIsWatch || v5)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            __int16 v26 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            __int16 v26 = MEMORY[0x263EF8438];
            id v29 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CE3000, v26, OS_LOG_TYPE_DEFAULT, "bIsInductive is true, should create connectionUUID for watchOS and iOS", buf, 2u);
          }

          uint64_t v30 = [v8 connectionUUID];

          if (!v30)
          {
            int v31 = [(ACCTransportIOAccessorySharedManager *)self delegate];
            __int16 v32 = objc_msgSend(v31, "createConnectionWithType:andIdentifier:", objc_msgSend(v8, "connectionType"), 0);

            __int16 v33 = [(ACCTransportIOAccessorySharedManager *)self delegate];
            objc_msgSend(v33, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v8, "supervisedTransportsRestricted"), v32);

            [v8 setConnectionUUID:v32];
            v58[0] = *MEMORY[0x263F34178];
            id v34 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v8, "primaryPortNumber"));
            v59[0] = v34;
            v58[1] = *MEMORY[0x263F34150];
            uint64_t v35 = [v8 digitalID];
            uint64_t v36 = v35;
            if (!v35)
            {
              uint64_t v36 = [MEMORY[0x263EFF9D0] null];
            }
            v59[1] = v36;
            uint64_t v37 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
            if (!v35) {

            }
            uint64_t v38 = [(ACCTransportIOAccessorySharedManager *)self delegate];
            uint64_t v39 = (void *)[v37 copy];
            [v38 setProperties:v39 forConnectionWithUUID:v32];
          }
        }
        int v24 = v51;
LABEL_70:

        int v13 = 1;
        goto LABEL_71;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        unsigned int v22 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        unsigned int v22 = MEMORY[0x263EF8438];
        id v27 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        unsigned int v28 = [(ACCTransportIOAccessoryBase *)v14 ioService];
        *(_DWORD *)buf = 67109120;
        LODWORD(v53) = v28;
        _os_log_impl(&dword_222CE3000, v22, OS_LOG_TYPE_INFO, "Couldn't find upstream io acc manager service for authCP service %d", buf, 8u);
      }
    }
    int v13 = 0;
    goto LABEL_71;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v9 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v9 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v53 = v8;
    __int16 v54 = 1024;
    int v55 = [v8 needsOOBPairing];
    __int16 v56 = 1024;
    int v57 = v3;
    _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ needsOOBPairing=%d Defer creating of ACCTransportIOAccessoryAuthCP until OOBPairing processing for %d", buf, 0x18u);
  }

  IOObjectRetain(v3);
  id v12 = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke_131;
  block[3] = &unk_26466C3D8;
  void block[4] = self;
  int v47 = v3;
  id v46 = v8;
  dispatch_async(v12, block);

  int v13 = 0;
  BOOL v14 = 0;
LABEL_71:
  uint64_t v40 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v40 unlock];

  if (v13 && [(ACCTransportIOAccessoryAuthCP *)v14 requiresAuthenticationProcess])
  {
    [(ACCTransportIOAccessoryAuthCP *)v14 startAuthenticationProcess];
  }
  else
  {
    io_registry_entry_t v41 = [(ACCTransportIOAccessoryBase *)v14 ioService];
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v41, @"AuthFullPass", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        unsigned int v43 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        unsigned int v43 = MEMORY[0x263EF8438];
        id v44 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CE3000, v43, OS_LOG_TYPE_DEFAULT, "doPostAuthentication", buf, 2u);
      }

      [(ACCTransportIOAccessoryAuthCP *)v14 doPostAuthentication];
    }
  }
}

uint64_t __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke_130(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

void __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke_131(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 96);
  int v2 = [[DeferredAuthCPServiceWrapper alloc] initWithIOService:*(unsigned int *)(a1 + 48) withMgr:*(void *)(a1 + 40)];
  [v1 addObject:v2];
}

- (void)IOAccessoryAuthCPServiceTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  *(void *)&v35[5] = *MEMORY[0x263EF8340];
  BOOL v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = [(ACCTransportIOAccessorySharedManager *)self _basePortForService:v3];
  BOOL v7 = v6;
  if (v6)
  {
    [v6 transportClassTerminated];
    [v7 startShutdownProcess];
    uint64_t v8 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v7];
    int v9 = v8;
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects <= 1;
    }
    else {
      BOOL v10 = 1;
    }
    int v11 = !v10;
    if (v8)
    {
      if (v11)
      {
        id v12 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v12 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v35[0] = [v9 ioService];
        LOWORD(v35[1]) = 1024;
        *(_DWORD *)((char *)&v35[1] + 2) = v3;
        _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "AUTH CP Terminated: found manager with service %d for terminated service %d", buf, 0xEu);
      }

      [v9 removeIOAccessoryChildPort:v7];
      [v9 setIsAuthenticated:0];
    }
    else
    {
      if (v11)
      {
        int v15 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v15 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v35[0] = v3;
        _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_INFO, "Didn't find manager for removed auth CP service %d", buf, 8u);
      }
    }
    listQ = self->_listQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceTerminated___block_invoke;
    block[3] = &unk_26466BB38;
    void block[4] = self;
    id v33 = v7;
    dispatch_sync(listQ, block);
    uint64_t v19 = [v9 connectionUUID];
    if (v19)
    {
      id v20 = (void *)v19;
      id v21 = [v9 connectionUUID];
      BOOL v22 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUIDHasActiveEndpoint:v21];

      if (!v22)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          id v23 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v23 = MEMORY[0x263EF8438];
          id v24 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v9 connectionUUID];
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v35 = v25;
          _os_log_impl(&dword_222CE3000, v23, OS_LOG_TYPE_DEFAULT, "No active endpoint for AuthCP Service connection, remove connectionUUID %@", buf, 0xCu);
        }
        __int16 v26 = [(ACCTransportIOAccessorySharedManager *)self delegate];
        id v27 = [v9 connectionUUID];
        [v26 destroyConnectionWithUUID:v27];

        [v9 setConnectionUUID:0];
        [(ACCTransportIOAccessorySharedManager *)self _clearChildPortEndpointsForManagerDisconnection:v9];
      }
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects < 2;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v9 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    else
    {
      int v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v35[0] = v3;
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed Auth CP service %d", buf, 8u);
    }
  }

  unsigned int v28 = self->_listQ;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __75__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceTerminated___block_invoke_136;
  v30[3] = &unk_26466C1E8;
  v30[4] = self;
  int v31 = v3;
  dispatch_async(v28, v30);
  id v29 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v29 unlock];
}

uint64_t __75__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceTerminated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

void __75__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceTerminated___block_invoke_136(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "service", (void)v12) == *(_DWORD *)(a1 + 40))
        {
          [*(id *)(*(void *)(a1 + 32) + 96) removeObject:v7];
          IOObjectRelease(*(_DWORD *)(a1 + 40));
          if (gLogObjects && gNumLogObjects >= 2)
          {
            uint64_t v8 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            uint64_t v8 = MEMORY[0x263EF8438];
            id v9 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = *(_DWORD *)(a1 + 40);
            uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 96) count];
            *(_DWORD *)buf = 67109376;
            int v17 = v10;
            __int16 v18 = 2048;
            uint64_t v19 = v11;
            _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "Removing dangling deferred AuthCP service %d due to service termination.  Remaining array count = %lu", buf, 0x12u);
          }

          goto LABEL_19;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

- (void)IOAccessoryEAServiceArrived:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  [(ACCTransportIOAccessorySharedManager *)self _processEAService:v3 andPublish:1];
  id v6 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v6 unlock];
}

- (void)IOAccessoryEAServiceTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = [(ACCTransportIOAccessorySharedManager *)self _basePortForService:v3];
  BOOL v7 = (void *)v6;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 1;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      int v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)int v65 = v3;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "EA SERVICE Terminated: found terminated service %d", buf, 8u);
    }

    [v7 transportClassTerminated];
    uint64_t v13 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v7];
    uint64_t v11 = v13;
    if (gLogObjects) {
      BOOL v14 = gNumLogObjects <= 1;
    }
    else {
      BOOL v14 = 1;
    }
    int v15 = !v14;
    if (v13)
    {
      if (v15)
      {
        id v16 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v16 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v19 = [v11 ioService];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v65 = v19;
        *(_WORD *)&v65[4] = 1024;
        *(_DWORD *)&v65[6] = v3;
        _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_INFO, "Found manager with service %d for incoming service %d", buf, 0xEu);
      }

      [v11 removeIOAccessoryChildPort:v7];
    }
    else
    {
      if (v15)
      {
        int v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v17 = MEMORY[0x263EF8438];
        id v21 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)int v65 = v3;
        _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_INFO, "Didn't find manager for removed EA service %d", buf, 8u);
      }
    }
    BOOL v22 = [v7 deviceModelNumber];
    if ([v22 isEqualToString:@"A1468"])
    {
    }
    else
    {
      id v23 = [v7 deviceModelNumber];
      int v24 = [v23 isEqualToString:@"A1450"];

      if (!v24)
      {
LABEL_57:
        unsigned int v28 = [v7 endpointUUID];
        id v29 = (void *)[v28 copy];

        if (gLogObjects && gNumLogObjects >= 2)
        {
          uint64_t v30 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          uint64_t v30 = MEMORY[0x263EF8438];
          id v31 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)int v65 = v29;
          _os_log_impl(&dword_222CE3000, v30, OS_LOG_TYPE_DEFAULT, "Remove EA Service endpointUUID %@", buf, 0xCu);
        }

        if (v29)
        {
          __int16 v32 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          int v33 = [v32 destroyEndpointWithUUID:v29];

          if (v33)
          {
            if (gLogObjects && gNumLogObjects >= 2)
            {
              id v34 = *(id *)(gLogObjects + 8);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              id v34 = MEMORY[0x263EF8438];
              id v35 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v36 = [v7 eaProtocol];
              *(_DWORD *)buf = 138412546;
              *(void *)int v65 = v29;
              *(_WORD *)&v65[8] = 2112;
              *(void *)&v65[10] = v36;
              _os_log_impl(&dword_222CE3000, v34, OS_LOG_TYPE_DEFAULT, "Removed EA service endpoint %@ for protocol %@", buf, 0x16u);
            }
            [v7 setEndpointUUID:0];
            [v7 setParentConnectionUUID:0];
          }
        }
        listQ = self->_listQ;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __71__ACCTransportIOAccessorySharedManager_IOAccessoryEAServiceTerminated___block_invoke;
        block[3] = &unk_26466BB38;
        void block[4] = self;
        id v62 = v7;
        dispatch_sync(listQ, block);
        uint64_t v38 = [v11 connectionUUID];
        if (v38)
        {
          uint64_t v39 = (void *)v38;
          uint64_t v40 = [v11 connectionUUID];
          BOOL v41 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUIDHasActiveEndpoint:v40];

          if (!v41)
          {
            if (gLogObjects && gNumLogObjects >= 2)
            {
              uint64_t v42 = *(id *)(gLogObjects + 8);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              uint64_t v42 = MEMORY[0x263EF8438];
              id v43 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              id v44 = [v11 connectionUUID];
              *(_DWORD *)buf = 138412290;
              *(void *)int v65 = v44;
              _os_log_impl(&dword_222CE3000, v42, OS_LOG_TYPE_DEFAULT, "No active endpoint for EA Service connection, remove connectionUUID %@", buf, 0xCu);
            }
            uint64_t v45 = [(ACCTransportIOAccessorySharedManager *)self delegate];
            id v46 = [v11 connectionUUID];
            [v45 destroyConnectionWithUUID:v46];

            [v11 setConnectionUUID:0];
            [(ACCTransportIOAccessorySharedManager *)self _clearChildPortEndpointsForManagerDisconnection:v11];
          }
        }

        goto LABEL_88;
      }
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v25 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v25 = MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [v7 deviceModelNumber];
      *(_DWORD *)buf = 138412290;
      *(void *)int v65 = v27;
      _os_log_impl(&dword_222CE3000, v25, OS_LOG_TYPE_DEFAULT, "Detaching a B139/B164, baseAccessoryEA %@", buf, 0xCu);
    }
    self->_isB139OrB164Connected = 0;
    goto LABEL_57;
  }
  if (v9)
  {
    uint64_t v11 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v11 = MEMORY[0x263EF8438];
    id v20 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)int v65 = v3;
    _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed EA service %d", buf, 8u);
  }
LABEL_88:

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  int v47 = self->_deferEAServiceArray;
  uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v58 != v50) {
          objc_enumerationMutation(v47);
        }
        __int16 v52 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v52, "service", (void)v57) == v3)
        {
          [(NSMutableArray *)self->_deferEAServiceArray removeObject:v52];
          IOObjectRelease(v3);
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v53 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            v53 = MEMORY[0x263EF8438];
            id v54 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v55 = [(NSMutableArray *)self->_deferEAServiceArray count];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)int v65 = v3;
            *(_WORD *)&v65[4] = 2048;
            *(void *)&v65[6] = v55;
            _os_log_impl(&dword_222CE3000, v53, OS_LOG_TYPE_DEFAULT, "Removing dangling deferred EA service %d due to service termination.  Remaining array count = %lu", buf, 0x12u);
          }

          goto LABEL_106;
        }
      }
      uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v49) {
        continue;
      }
      break;
    }
  }
LABEL_106:

  __int16 v56 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v56 unlock];
}

uint64_t __71__ACCTransportIOAccessorySharedManager_IOAccessoryEAServiceTerminated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)IOAccessoryOOBPairingServiceArrived:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v66[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = [(ACCTransportIOAccessorySharedManager *)self _managerForIOService:v3 shouldCreateNewService:1];
  BOOL v7 = [[ACCTransportIOAccessoryOOBPairing alloc] initWithDelegate:self andIOService:v3];
  [(ACCTransportIOAccessoryOOBPairing *)v7 openServiceSession];
  if (!v6)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Starting OOBPairing Service that has no associated parent IOAccMgr";
    BOOL v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 2;
    goto LABEL_36;
  }
  if (![(ACCTransportIOAccessorySharedManager *)self _addACCTransportToManager:v7])
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v41 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 67109120;
    unsigned int v58 = [(ACCTransportIOAccessoryBase *)v7 ioService];
    uint64_t v13 = "Couldn't find upstream io acc manager service for OOBPairing service %d";
    BOOL v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 8;
LABEL_36:
    _os_log_impl(&dword_222CE3000, v14, v15, v13, buf, v16);
LABEL_37:

    goto LABEL_44;
  }
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingServiceArrived___block_invoke;
  block[3] = &unk_26466BB38;
  void block[4] = self;
  int v9 = v7;
  __int16 v56 = v9;
  dispatch_sync(listQ, block);
  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v10 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v10 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Successfully added io accessory OOBPairing to all ports list", buf, 2u);
  }
  uint64_t v50 = v7;

  id v18 = [v6 connectionUUID];

  if (!v18)
  {
    int v19 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    id v20 = objc_msgSend(v19, "createConnectionWithType:andIdentifier:", objc_msgSend(v6, "connectionType"), 0);

    id v21 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    objc_msgSend(v21, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v6, "supervisedTransportsRestricted"), v20);

    [v6 setConnectionUUID:v20];
    v65[0] = *MEMORY[0x263F34178];
    BOOL v22 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v6, "primaryPortNumber"));
    v66[0] = v22;
    v65[1] = *MEMORY[0x263F34150];
    id v23 = [v6 digitalID];
    int v24 = v23;
    if (!v23)
    {
      int v24 = [MEMORY[0x263EFF9D0] null];
    }
    v66[1] = v24;
    id v25 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
    if (!v23) {

    }
    id v26 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    id v27 = (void *)[v25 copy];
    [v26 setProperties:v27 forConnectionWithUUID:v20];
  }
  v63[0] = *MEMORY[0x263F34110];
  v53 = [(ACCTransportIOAccessoryOOBPairing *)v9 deviceName];
  v64[0] = v53;
  v63[1] = *MEMORY[0x263F34100];
  __int16 v52 = [(ACCTransportIOAccessoryOOBPairing *)v9 deviceVendorName];
  v64[1] = v52;
  v63[2] = *MEMORY[0x263F34108];
  uint64_t v51 = [(ACCTransportIOAccessoryOOBPairing *)v9 deviceModelNumber];
  v64[2] = v51;
  v63[3] = *MEMORY[0x263F34130];
  [(ACCTransportIOAccessoryOOBPairing *)v9 deviceSerialNumber];
  unsigned int v28 = v54 = v6;
  v64[3] = v28;
  v63[4] = *MEMORY[0x263F340F8];
  id v29 = [(ACCTransportIOAccessoryOOBPairing *)v9 deviceHardwareRevision];
  v64[4] = v29;
  v63[5] = *MEMORY[0x263F340F0];
  uint64_t v30 = [(ACCTransportIOAccessoryOOBPairing *)v9 deviceFirmwareRevision];
  v64[5] = v30;
  v63[6] = *MEMORY[0x263F340E0];
  id v31 = [(ACCTransportIOAccessoryOOBPairing *)v9 deviceUID];
  v64[6] = v31;
  v63[7] = *MEMORY[0x263F340E8];
  __int16 v32 = [(ACCTransportIOAccessoryOOBPairing *)v9 devicePlatformID];
  v64[7] = v32;
  v63[8] = @"SupportedTypes";
  int v33 = [(ACCTransportIOAccessoryOOBPairing *)v9 deviceSupportedTypes];
  v64[8] = v33;
  v63[9] = @"Supports2Way";
  id v34 = [(ACCTransportIOAccessoryOOBPairing *)v9 supports2way];
  v64[9] = v34;
  id v35 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:10];

  uint64_t v6 = v54;
  uint64_t v36 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  uint64_t v37 = [v54 connectionUUID];
  uint64_t v38 = (void *)[v37 copy];
  uint64_t v39 = [v36 createEndpointWithTransportType:9 andProtocol:8 andIdentifier:0 forConnectionWithUUID:v38 publishConnection:0];

  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v40 = *(id *)(gLogObjects + 8);
    BOOL v7 = v50;
  }
  else
  {
    BOOL v7 = v50;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v40 = MEMORY[0x263EF8438];
    id v42 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    unsigned int v43 = [(ACCTransportIOAccessoryBase *)v9 ioService];
    *(_DWORD *)buf = 67109634;
    unsigned int v58 = v43;
    __int16 v59 = 2112;
    long long v60 = v39;
    __int16 v61 = 2112;
    id v62 = v35;
    _os_log_impl(&dword_222CE3000, v40, OS_LOG_TYPE_INFO, "setAccessoryInfo for OOBPairing service %d, endpointUUID %@, accInfo %@", buf, 0x1Cu);
  }

  id v44 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  [v44 setAccessoryInfo:v35 forEndpointWithUUID:v39];

  uint64_t v45 = (void *)[v39 copy];
  [(ACCTransportIOAccessoryOOBPairing *)v9 setEndpointUUID:v45];

  id v46 = [v54 connectionUUID];
  [(ACCTransportIOAccessoryOOBPairing *)v9 setParentConnectionUUID:v46];

  int v47 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  uint64_t v48 = [v54 connectionUUID];
  [v47 publishConnectionWithUUID:v48];

LABEL_44:
  uint64_t v49 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v49 unlock];
}

uint64_t __76__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingServiceArrived___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)IOAccessoryOOBPairingServiceTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  *(void *)&v44[5] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = [(ACCTransportIOAccessorySharedManager *)self _basePortForService:v3];
  BOOL v7 = v6;
  if (v6)
  {
    [v6 closeServiceSession];
    uint64_t v8 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v7];
    int v9 = v8;
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects <= 1;
    }
    else {
      BOOL v10 = 1;
    }
    int v11 = !v10;
    if (v8)
    {
      if (v11)
      {
        id v12 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v12 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v44[0] = [v9 ioService];
        LOWORD(v44[1]) = 1024;
        *(_DWORD *)((char *)&v44[1] + 2) = v3;
        _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_INFO, "OOBPairing Terminated: found manager with service %d for terminated service %d", buf, 0xEu);
      }

      [v9 setNeedsOOBPairing:[v9 primaryPortNumber] == 257];
      [v9 removeIOAccessoryChildPort:v7];
    }
    else
    {
      if (v11)
      {
        os_log_type_t v15 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        os_log_type_t v15 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v44[0] = v3;
        _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_INFO, "Didn't find manager for removed auth CP service %d", buf, 8u);
      }
    }
    id v18 = [v7 endpointUUID];
    int v19 = (void *)[v18 copy];

    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v20 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v20 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v44 = v19;
      _os_log_impl(&dword_222CE3000, v20, OS_LOG_TYPE_DEFAULT, "Remove OOBPairing Service endpointUUID %@", buf, 0xCu);
    }

    if (v19)
    {
      BOOL v22 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      int v23 = [v22 destroyEndpointWithUUID:v19];

      if (v23)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          int v24 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          int v24 = MEMORY[0x263EF8438];
          id v25 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v44 = v19;
          _os_log_impl(&dword_222CE3000, v24, OS_LOG_TYPE_DEFAULT, "Removed OOBPairing service endpoint %@", buf, 0xCu);
        }

        [v7 setEndpointUUID:0];
        [v7 setParentConnectionUUID:0];
      }
    }
    listQ = self->_listQ;
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    uint64_t v39 = __79__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingServiceTerminated___block_invoke;
    uint64_t v40 = &unk_26466BB38;
    id v41 = self;
    id v42 = v7;
    dispatch_sync(listQ, &v37);
    uint64_t v27 = [v9 connectionUUID];
    if (v27)
    {
      unsigned int v28 = (void *)v27;
      id v29 = [v9 connectionUUID];
      BOOL v30 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUIDHasActiveEndpoint:v29];

      if (!v30)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          id v31 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v31 = MEMORY[0x263EF8438];
          id v32 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = [v9 connectionUUID];
          *(_DWORD *)buf = 138412290;
          *(void *)id v44 = v33;
          _os_log_impl(&dword_222CE3000, v31, OS_LOG_TYPE_DEFAULT, "No active endpoint for OOBPairing Service connection, remove connectionUUID %@", buf, 0xCu);
        }
        id v34 = [(ACCTransportIOAccessorySharedManager *)self delegate];
        id v35 = [v9 connectionUUID];
        [v34 destroyConnectionWithUUID:v35];

        [v9 setConnectionUUID:0];
        [(ACCTransportIOAccessorySharedManager *)self _clearChildPortEndpointsForManagerDisconnection:v9];
      }
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects < 2;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v9 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    else
    {
      int v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v44[0] = v3;
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed OOBPairing service %d", buf, 8u);
    }
  }

  uint64_t v36 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v36 unlock];
}

uint64_t __79__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingServiceTerminated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (id)IOAccessoryPortArrived:(id)a3 withEndpointProtocol:(int)a4 publish:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v9 lock];

  unint64_t v10 = 0x26ABFC000uLL;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 2;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v13 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    *(void *)v73 = v8;
    *(_WORD *)&v73[8] = 1024;
    *(_DWORD *)&v73[10] = [v8 primaryPortNumber];
    __int16 v74 = 1024;
    unsigned int v75 = [v8 portIDNumber];
    __int16 v76 = 1024;
    int v77 = [v8 portStreamType];
    __int16 v78 = 1024;
    int v79 = v6;
    __int16 v80 = 1024;
    BOOL v81 = v5;
    _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_INFO, "IOAccessoryPortArrived: port %@ (%d / %d) streamType %d, endpointProtocol %{coreacc:ACCEndpoint_Protocol_t}d, publish %d", buf, 0x2Au);
  }

  id v14 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  if (v14)
  {
    unsigned int v65 = [(ACCTransportIOAccessorySharedManager *)self _endpointTransportTypeForIOAccessoryPort:v8];
    os_log_type_t v15 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v8];
    id v16 = [v15 connectionUUID];

    unsigned int v64 = v6;
    if (v16)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v17 = MEMORY[0x263EF8438];
        id v32 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ACCTransportIOAccessorySharedManager IOAccessoryPortArrived:withEndpointProtocol:publish:].cold.5(v15);
      }

      int v33 = [(ACCTransportIOAccessorySharedManager *)self delegate];

      if (!v33
        || ([v15 inductiveLocalDeviceID],
            id v34 = objc_claimAutoreleasedReturnValue(),
            v34,
            !v34))
      {
LABEL_35:
        uint64_t v36 = [(ACCTransportIOAccessorySharedManager *)self delegate];
        uint64_t v37 = [v15 connectionUUID];
        uint64_t v38 = [v36 createEndpointWithTransportType:v65 andProtocol:v6 andIdentifier:0 forConnectionWithUUID:v37 publishConnection:0];

        uint64_t v39 = [v15 connectionUUID];
        [v8 setIoAccPortParentConnectionUUID:v39];

        if (!__isForcePassthroughIOAccessoryManagerPort()) {
          goto LABEL_47;
        }
        int isForcePassthroughIOAccessoryManagerPort = __isForcePassthroughIOAccessoryManagerPort();
        if (isForcePassthroughIOAccessoryManagerPort == 2)
        {
          id v41 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          [v41 setProperties:&unk_26D5AF8E0 forEndpointWithUUID:v38];
        }
        else
        {
          if (isForcePassthroughIOAccessoryManagerPort != 1) {
            goto LABEL_47;
          }
          id v41 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          id v42 = (void *)[&unk_26D5AF8B8 copy];
          [v41 setProperties:v42 forEndpointWithUUID:v38];
        }
LABEL_47:
        id v44 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v45 = *(void *)(v10 + 2264);
        if (v45 && gNumLogObjects >= 2)
        {
          id v46 = *(id *)(v45 + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v46 = MEMORY[0x263EF8438];
          id v47 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          int v48 = [v15 resistorID];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v73 = v48;
          _os_log_impl(&dword_222CE3000, v46, OS_LOG_TYPE_INFO, "resistorID from manager in IOAccessoryPortArrived: %u", buf, 8u);
        }

        if ([v15 resistorID] != 100
          && [v15 resistorID] != -1)
        {
          uint64_t v49 = *(void *)(v10 + 2264);
          if (v49 && gNumLogObjects >= 2)
          {
            uint64_t v50 = *(id *)(v49 + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            uint64_t v50 = MEMORY[0x263EF8438];
            id v51 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            int v52 = [v15 resistorID];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v73 = v52;
            _os_log_impl(&dword_222CE3000, v50, OS_LOG_TYPE_DEFAULT, "Sending resistorID %d with IOAccessoryPort endpoint properties", buf, 8u);
          }

          v53 = objc_msgSend(NSNumber, "numberWithInt:", -[NSObject resistorID](v15, "resistorID"));
          [v44 setObject:v53 forKey:*MEMORY[0x263F34208]];
        }
        id v54 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v8, "portIDNumber"));
        [v44 setObject:v54 forKey:*MEMORY[0x263F34200]];

        uint64_t v55 = [(ACCTransportIOAccessorySharedManager *)self delegate];
        __int16 v56 = (void *)[v44 copy];
        [v55 setProperties:v56 forEndpointWithUUID:v38];

        if (v5)
        {
          long long v57 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          unsigned int v58 = [v15 connectionUUID];
          [v57 publishConnectionWithUUID:v58];
        }
        uint64_t v59 = *(void *)(v10 + 2264);
        if (v59 && gNumLogObjects >= 2)
        {
          long long v60 = *(id *)(v59 + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          long long v60 = MEMORY[0x263EF8438];
          id v61 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v73 = v65;
          *(_WORD *)&v73[4] = 2112;
          *(void *)&v73[6] = v38;
          __int16 v74 = 1024;
          unsigned int v75 = v64;
          _os_log_impl(&dword_222CE3000, v60, OS_LOG_TYPE_DEFAULT, "IOAccessoryPort arrived, transportType: %{coreacc:ACCEndpoint_TransportType_t}d, assigned endpointUUID %@, endpoint protocol %{coreacc:ACCEndpoint_Protocol_t}d", buf, 0x18u);
        }

        goto LABEL_77;
      }
      uint64_t v70 = *MEMORY[0x263F34160];
      id v35 = [v15 inductiveLocalDeviceID];
      uint64_t v71 = v35;
      id v21 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];

      id v29 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      BOOL v30 = (void *)[v21 copy];
      id v31 = [v15 connectionUUID];
      [v29 setProperties:v30 forConnectionWithUUID:v31];
LABEL_34:

      uint64_t v6 = v64;
      goto LABEL_35;
    }
    id v18 = [(ACCTransportIOAccessorySharedManager *)self delegate];

    if (!v18) {
      goto LABEL_35;
    }
    uint64_t v19 = [(ACCTransportIOAccessorySharedManager *)self _connectionTypeForIOAccessoryPort:v8];
    id v20 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    id v21 = [v20 createConnectionWithType:v19 andIdentifier:0];

    BOOL v22 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    objc_msgSend(v22, "setSupervisedTransportsRestricted:forConnectionWithUUID:", -[NSObject supervisedTransportsRestricted](v15, "supervisedTransportsRestricted"), v21);

    [v15 setConnectionUUID:v21];
    int v23 = [v15 inductiveLocalDeviceID];

    int v24 = (void *)MEMORY[0x263F34150];
    if (v23)
    {
      v68[0] = *MEMORY[0x263F34178];
      id v25 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v8, "primaryPortNumber"));
      v69[0] = v25;
      v68[1] = *v24;
      id v26 = [v15 digitalID];
      uint64_t v27 = v26;
      if (!v26)
      {
        uint64_t v27 = [MEMORY[0x263EFF9D0] null];
      }
      v69[1] = v27;
      v68[2] = *MEMORY[0x263F34160];
      unsigned int v28 = [v15 inductiveLocalDeviceID];
      v69[2] = v28;
      id v29 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:3];

      if (v26) {
        goto LABEL_25;
      }
    }
    else
    {
      v66[0] = *MEMORY[0x263F34178];
      id v25 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v8, "primaryPortNumber"));
      v66[1] = *v24;
      v67[0] = v25;
      id v26 = [v15 digitalID];
      uint64_t v27 = v26;
      if (!v26)
      {
        uint64_t v27 = [MEMORY[0x263EFF9D0] null];
      }
      v67[1] = v27;
      id v29 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
      if (v26) {
        goto LABEL_25;
      }
    }

LABEL_25:
    BOOL v30 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    id v31 = (void *)[v29 copy];
    [v30 setProperties:v31 forConnectionWithUUID:v21];
    unint64_t v10 = 0x26ABFC000;
    goto LABEL_34;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    os_log_type_t v15 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    os_log_type_t v15 = MEMORY[0x263EF8438];
    id v43 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_INFO, "Can't find delegate for ACCTransportIOAccessoryPortProtocol accessoryPortAttached", buf, 2u);
  }
  uint64_t v38 = 0;
LABEL_77:

  id v62 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v62 unlock];

  return v38;
}

- (void)_IOAccessoryPortDetachInternal:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 ioAccPortEndpointUUID];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(ACCTransportIOAccessorySharedManager *)self delegate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [v4 ioAccPortEndpointUUID];
    int v9 = [v8 copy];

    if (gLogObjects && gNumLogObjects >= 2)
    {
      unint64_t v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unint64_t v10 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412290;
      BOOL v30 = v9;
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "IOAccessoryPortDetachInternal: remove endpointUUID %@", (uint8_t *)&v29, 0xCu);
    }

    if (v9
      && ([(ACCTransportIOAccessorySharedManager *)self delegate],
          id v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = [v14 destroyEndpointWithUUID:v9],
          v14,
          v15))
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v16 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v16 = MEMORY[0x263EF8438];
        id v19 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        BOOL v30 = v9;
        _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_DEFAULT, "Successfully sent io accessory port detach for endpointToRemove %@", (uint8_t *)&v29, 0xCu);
      }

      id v17 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v4];
      [v4 setIoAccPortEndpointUUID:0];
      [v4 setIoAccPortParentConnectionUUID:0];
      uint64_t v20 = [v17 connectionUUID];
      if (v20)
      {
        id v21 = (void *)v20;
        BOOL v22 = [v17 connectionUUID];
        BOOL v23 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUIDHasActiveEndpoint:v22];

        if (!v23)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            int v24 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            int v24 = MEMORY[0x263EF8438];
            id v25 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = [v17 connectionUUID];
            int v29 = 138412290;
            BOOL v30 = v26;
            _os_log_impl(&dword_222CE3000, v24, OS_LOG_TYPE_DEFAULT, "No active endpoint for IOAccessoryPort, remove connectionUUID %@", (uint8_t *)&v29, 0xCu);
          }
          uint64_t v27 = [(ACCTransportIOAccessorySharedManager *)self delegate];
          unsigned int v28 = [v17 connectionUUID];
          [v27 destroyConnectionWithUUID:v28];

          [v17 setConnectionUUID:0];
          [(ACCTransportIOAccessorySharedManager *)self _clearChildPortEndpointsForManagerDisconnection:v17];
        }
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v17 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessorySharedManager _IOAccessoryPortDetachInternal:]();
      }
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 2;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v9 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    else
    {
      int v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 67109120;
      LODWORD(v30) = [v4 ioService];
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "No active endpointUUID for IOAccessoryPort service %d", (uint8_t *)&v29, 8u);
    }
  }
}

- (void)IOAccessoryPortDetach:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  [(ACCTransportIOAccessorySharedManager *)self _IOAccessoryPortDetachInternal:v4];
  id v6 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v6 unlock];
}

- (BOOL)IOAccessoryPortDataArrived:(id)a3 endpointUUID:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogSignpostObjects) {
    BOOL v8 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    unint64_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    unint64_t v10 = *(id *)(gLogSignpostObjects + 24);
  }
  uint64_t v11 = [v7 hash];
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      int v27 = 138412546;
      unsigned int v28 = (const char *)v7;
      __int16 v29 = 2048;
      uint64_t v30 = [v6 length];
      _os_signpost_emit_with_name_impl(&dword_222CE3000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming data! %@, %lu bytes", (uint8_t *)&v27, 0x16u);
    }
  }

  uint64_t v13 = [v7 hash];
  os_signpost_id_t v14 = [v6 hash] ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    int v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    int v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = [v6 length];
    int v27 = 138412546;
    unsigned int v28 = (const char *)v7;
    __int16 v29 = 2048;
    uint64_t v30 = v17;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming data! %@, %lu bytes", (uint8_t *)&v27, 0x16u);
  }

  id v18 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v18 lock];

  id v19 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  if (v19)
  {
    uint64_t v20 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    LODWORD(v19) = [v20 processIncomingData:v6 forEndpointWithUUID:v7];
  }
  id v21 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v21 unlock];

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    BOOL v22 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    BOOL v22 = MEMORY[0x263EF8438];
    id v23 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    if (v19) {
      int v24 = "SUCCESS";
    }
    else {
      int v24 = "ERROR";
    }
    uint64_t v25 = [v6 length];
    int v27 = 136315650;
    unsigned int v28 = v24;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v7;
    __int16 v31 = 2048;
    uint64_t v32 = v25;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v22, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming data! %@, %lu bytes", (uint8_t *)&v27, 0x20u);
  }

  return (char)v19;
}

- (void)IOAccessoryPortPropertyChanged:(id)a3
{
  *(void *)&v22[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", [v4 ioService], 1);
  id v7 = (void *)v6;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 1;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (!v6)
  {
    if (v9)
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 67109376;
      v22[0] = [v4 ioService];
      LOWORD(v22[1]) = 1024;
      *(_DWORD *)((char *)&v22[1] + 2) = [v4 portIDNumber];
      _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "Didn't find existing manager for property change IOAccessoryPortService %d, portID %d", (uint8_t *)&v21, 0xEu);
    }
    goto LABEL_39;
  }
  if (v9)
  {
    unint64_t v10 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    unint64_t v10 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 67109376;
    v22[0] = [v7 ioService];
    LOWORD(v22[1]) = 1024;
    *(_DWORD *)((char *)&v22[1] + 2) = [v4 ioService];
    _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, "Found manager with service %d for property change IOAccessoryPort service %d, will remove from its child ports", (uint8_t *)&v21, 0xEu);
  }

  [v7 removeIOAccessoryChildPort:v4];
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v13 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v4 ioAccPortParentConnectionUUID];
    int v21 = 138412290;
    *(void *)BOOL v22 = v15;
    _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEFAULT, "Current parent connectionUUID for port is %@", (uint8_t *)&v21, 0xCu);
  }
  id v16 = [v4 ioAccPortParentConnectionUUID];

  if (v16)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v4 ioAccPortEndpointUUID];
      int v21 = 138412290;
      *(void *)BOOL v22 = v18;
      _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "Current endpointUUID for port is %@", (uint8_t *)&v21, 0xCu);
    }
LABEL_39:
  }
  [(ACCTransportIOAccessorySharedManager *)self _addACCTransportToManager:v4];
  uint64_t v20 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v20 unlock];
}

- (void)IOAccessoryPortPublish:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", [v4 ioService], 1);
  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109376;
      v14[1] = [v6 ioService];
      __int16 v15 = 1024;
      int v16 = [v4 ioService];
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "Found manager with service %d for property change IOAccessoryPort service %d, will publish", (uint8_t *)v14, 0xEu);
    }

    int v9 = [(ACCTransportIOAccessorySharedManager *)self delegate];

    if (v9)
    {
      unint64_t v10 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      uint64_t v11 = [v6 connectionUUID];
      [v10 publishConnectionWithUUID:v11];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        unint64_t v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        unint64_t v10 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Can't find delegate for ACCTransportIOAccessoryPortProtocol skip Publish", (uint8_t *)v14, 2u);
      }
    }
  }
  uint64_t v13 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v13 unlock];
}

- (void)IOAccessoryAuthCPServiceAuthStatusChanged:(int)a3 authType:(int)a4 authCert:(id)a5 certType:(int)a6 authCTA:(BOOL)a7 service:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v9 = a7;
  uint64_t v11 = *(void *)&a3;
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v14 lock];

  __int16 v15 = [(ACCTransportIOAccessorySharedManager *)self _managerForIOService:v8 shouldCreateNewService:0];
  uint64_t v70 = self;
  int v16 = [(ACCTransportIOAccessorySharedManager *)self _basePortForService:v8];
  uint64_t v17 = +[ACCTransportIOAccessorySharedManager sharedManager];
  v68 = [v17 delegate];

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v18 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v18 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    LODWORD(v79) = v11;
    WORD2(v79) = 1024;
    *(_DWORD *)((char *)&v79 + 6) = 2;
    WORD5(v79) = 1024;
    HIDWORD(v79) = a4;
    __int16 v80 = 1024;
    int v81 = v8;
    __int16 v82 = 1024;
    int v83 = (unsigned __int16)v15;
    __int16 v84 = 1024;
    int v85 = (unsigned __int16)v16;
    _os_log_impl(&dword_222CE3000, v18, OS_LOG_TYPE_DEFAULT, "newAuthStatus = %d (passed = %d), authchar Type = %d, ioService = %d, accMgrInstance: %04X, authCPInstance = %04X", buf, 0x26u);
  }

  IOAccessoryManagerGetUpstreamService();
  p_isa = (id *)&v70->super.isa;
  if (!(v70->_bIsWatch | ((IOAccessoryManagerGetType() & 0xF) == 5)))
  {
    if (v15
      && ([v15 connectionUUID], int v21 = objc_claimAutoreleasedReturnValue(),
                                               v21,
                                               !v21))
    {
      if (v11 != 2) {
        goto LABEL_21;
      }
      v67 = v16;
      id v55 = v13;
      __int16 v56 = [(ACCTransportIOAccessorySharedManager *)v70 delegate];
      BOOL v22 = objc_msgSend(v56, "createConnectionWithType:andIdentifier:", objc_msgSend(v15, "connectionType"), 0);

      long long v57 = [(ACCTransportIOAccessorySharedManager *)v70 delegate];
      objc_msgSend(v57, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v15, "supervisedTransportsRestricted"), v22);

      [v15 setConnectionUUID:v22];
      v76[0] = *MEMORY[0x263F34178];
      unsigned int v58 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v15, "primaryPortNumber"));
      v77[0] = v58;
      v76[1] = *MEMORY[0x263F34150];
      uint64_t v59 = [v15 digitalID];
      long long v60 = v59;
      if (!v59)
      {
        long long v60 = [MEMORY[0x263EFF9D0] null];
      }
      v77[1] = v60;
      id v61 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
      if (!v59) {

      }
      id v62 = [(ACCTransportIOAccessorySharedManager *)v70 delegate];
      int v63 = (void *)[v61 copy];
      [v62 setProperties:v63 forConnectionWithUUID:v22];

      p_isa = (id *)&v70->super.isa;
      id v13 = v55;
      int v16 = v67;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        BOOL v22 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        BOOL v22 = MEMORY[0x263EF8438];
        id v23 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[ACCTransportIOAccessorySharedManager IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:].cold.7(v15);
      }
    }
  }
LABEL_21:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v24 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v24 = MEMORY[0x263EF8438];
    id v25 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [v15 connectionUUID];
    *(_DWORD *)buf = 67109378;
    LODWORD(v79) = (unsigned __int16)v15;
    WORD2(v79) = 2112;
    *(void *)((char *)&v79 + 6) = v26;
    _os_log_impl(&dword_222CE3000, v24, OS_LOG_TYPE_DEFAULT, "accMgrInstance: %04X, connectionUUID:[%@]", buf, 0x12u);
  }
  if (v11 == 2) {
    uint64_t v27 = 2;
  }
  else {
    uint64_t v27 = 1;
  }
  unsigned int v28 = v15;
  if (v15
    || v16
    && ([v16 connectionUUID],
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        v30,
        unsigned int v28 = v16,
        v30))
  {
    __int16 v29 = [v28 connectionUUID];
    if (v29
      && ([v68 setAuthenticationStatus:v27 andCertificateData:v13 authCTA:v9 forConnectionWithUUID:v29] & 1) != 0)
    {
      if (!v15) {
        goto LABEL_67;
      }
      goto LABEL_57;
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      __int16 v31 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      __int16 v31 = MEMORY[0x263EF8438];
      id v32 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, v31, OS_LOG_TYPE_INFO, "auth status changed, but no connectionUUID is associated with the auth status event", buf, 2u);
    }

    __int16 v29 = 0;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v33 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v33 = MEMORY[0x263EF8438];
    id v34 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportIOAccessorySharedManager IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:]();
  }

  if (v15)
  {
LABEL_57:
    if (([v15 setFeaturesFromAuthStatus:v11 authCert:v13 certType:a6] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v35 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v35 = MEMORY[0x263EF8438];
        id v36 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessorySharedManager IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:]();
      }
    }
  }
LABEL_67:
  if (v11 == 2)
  {
    unsigned int v64 = v29;
    id v65 = v13;
    uint64_t v66 = v16;
    uint64_t v37 = [MEMORY[0x263EFF980] array];
    [v15 setIsAuthenticated:1];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v38 = p_isa[13];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      id v41 = MEMORY[0x263EF8438];
      uint64_t v42 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v72 != v42) {
            objc_enumerationMutation(v38);
          }
          id v44 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          uint64_t v45 = [v44 mgr];

          if (v45 == v15)
          {
            uint64_t v46 = gLogObjects;
            int v47 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v48 = gNumLogObjects < 2;
            }
            else {
              BOOL v48 = 1;
            }
            if (v48)
            {
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)&long long v79 = v46;
                WORD4(v79) = 1024;
                *(_DWORD *)((char *)&v79 + 10) = v47;
                _os_log_error_impl(&dword_222CE3000, v41, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              uint64_t v49 = v41;
              uint64_t v50 = v41;
            }
            else
            {
              uint64_t v50 = *(id *)(gLogObjects + 8);
            }
            p_isa = (id *)&v70->super.isa;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              int v51 = [v44 service];
              *(_DWORD *)buf = 138412546;
              *(void *)&long long v79 = v15;
              WORD4(v79) = 1024;
              *(_DWORD *)((char *)&v79 + 10) = v51;
              _os_log_impl(&dword_222CE3000, v50, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ Auth passed. Processing deferred EA service %d, and remove it from deferral list", buf, 0x12u);
            }

            -[ACCTransportIOAccessorySharedManager _processEAService:andPublish:](v70, "_processEAService:andPublish:", [v44 service], 0);
            IOObjectRelease([v44 service]);
            [v37 addObject:v44];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v71 objects:v75 count:16];
      }
      while (v40);
    }

    id v13 = v65;
    if ([v37 count])
    {
      int v52 = [p_isa delegate];
      v53 = [v15 connectionUUID];
      [v52 publishConnectionWithUUID:v53];
    }
    [p_isa[13] removeObjectsInArray:v37];

    int v16 = v66;
    __int16 v29 = v64;
  }
  else if (v11 == 4)
  {
    [v15 setIsAuthTimedOut:1];
  }
  id v54 = [p_isa accessoryPortLock];
  [v54 unlock];
}

- (BOOL)IOAccessoryEADataArrived:(id)a3 eaEndpointUUID:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogSignpostObjects) {
    BOOL v8 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    unint64_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    unint64_t v10 = *(id *)(gLogSignpostObjects + 24);
  }
  uint64_t v11 = [v7 hash];
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      int v26 = 138412546;
      uint64_t v27 = (const char *)v7;
      __int16 v28 = 2048;
      uint64_t v29 = [v6 length];
      _os_signpost_emit_with_name_impl(&dword_222CE3000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming EA data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
    }
  }

  uint64_t v13 = [v7 hash];
  os_signpost_id_t v14 = [v6 hash] ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    __int16 v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    __int16 v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = [v6 length];
    int v26 = 138412546;
    uint64_t v27 = (const char *)v7;
    __int16 v28 = 2048;
    uint64_t v29 = v17;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming EA data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
  }

  id v18 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  if (v18)
  {
    id v19 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    int v20 = [v19 processIncomingData:v6 forEndpointWithUUID:v7];
  }
  else
  {
    int v20 = 0;
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    int v21 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    int v21 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    if (v20) {
      id v23 = "SUCCESS";
    }
    else {
      id v23 = "ERROR";
    }
    uint64_t v24 = [v6 length];
    int v26 = 136315650;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v7;
    __int16 v30 = 2048;
    uint64_t v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v21, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming EA data! %@, %lu bytes", (uint8_t *)&v26, 0x20u);
  }

  return v20;
}

- (BOOL)IOAccessoryOOBPairingInfoArrived:(id)a3 endpointUUID:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogSignpostObjects) {
    BOOL v8 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    unint64_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    unint64_t v10 = *(id *)(gLogSignpostObjects + 24);
  }
  uint64_t v11 = [v7 hash];
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      int v26 = 138412546;
      uint64_t v27 = (const char *)v7;
      __int16 v28 = 2048;
      uint64_t v29 = [v6 length];
      _os_signpost_emit_with_name_impl(&dword_222CE3000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming OOBPairingInfo data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
    }
  }

  uint64_t v13 = [v7 hash];
  os_signpost_id_t v14 = [v6 hash] ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    __int16 v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    __int16 v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = [v6 length];
    int v26 = 138412546;
    uint64_t v27 = (const char *)v7;
    __int16 v28 = 2048;
    uint64_t v29 = v17;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming OOBPairingInfo data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
  }

  id v18 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  if (v18)
  {
    id v19 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    int v20 = [v19 processIncomingData:v6 forEndpointWithUUID:v7];
  }
  else
  {
    int v20 = 0;
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    int v21 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    int v21 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    if (v20) {
      id v23 = "SUCCESS";
    }
    else {
      id v23 = "ERROR";
    }
    uint64_t v24 = [v6 length];
    int v26 = 136315650;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v7;
    __int16 v30 = 2048;
    uint64_t v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v21, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming OOBPairingInfo data! %@, %lu bytes", (uint8_t *)&v26, 0x20u);
  }

  return v20;
}

- (BOOL)IOAccessoryOOBPairingDataArrived:(id)a3 endpointUUID:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogSignpostObjects) {
    BOOL v8 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    unint64_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    unint64_t v10 = *(id *)(gLogSignpostObjects + 24);
  }
  uint64_t v11 = [v7 hash];
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      int v26 = 138412546;
      uint64_t v27 = (const char *)v7;
      __int16 v28 = 2048;
      uint64_t v29 = [v6 length];
      _os_signpost_emit_with_name_impl(&dword_222CE3000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming OOBPairingData data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
    }
  }

  uint64_t v13 = [v7 hash];
  os_signpost_id_t v14 = [v6 hash] ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    __int16 v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    __int16 v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = [v6 length];
    int v26 = 138412546;
    uint64_t v27 = (const char *)v7;
    __int16 v28 = 2048;
    uint64_t v29 = v17;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming OOBPairingData data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
  }

  id v18 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  if (v18)
  {
    id v19 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    int v20 = [v19 processIncomingData:v6 forEndpointWithUUID:v7];
  }
  else
  {
    int v20 = 0;
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    int v21 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    int v21 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    if (v20) {
      id v23 = "SUCCESS";
    }
    else {
      id v23 = "ERROR";
    }
    uint64_t v24 = [v6 length];
    int v26 = 136315650;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v7;
    __int16 v30 = 2048;
    uint64_t v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v21, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming OOBPairingData data! %@, %lu bytes", (uint8_t *)&v26, 0x20u);
  }

  return v20;
}

- (BOOL)IOAccessoryOOBPairingDataStartedForEndpointUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "IOAccessoryOOBPairingDataStartedForEndpointUUID: %@", (uint8_t *)&v8, 0xCu);
  }

  return 1;
}

- (BOOL)IOAccessoryOOBPairingDataFinishedForEndpointUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "IOAccessoryOOBPairingDataFinishedForEndpointUUID: %@", buf, 0xCu);
  }

  int v8 = [(ACCTransportIOAccessorySharedManager *)self _basePortForEndpointUUID:v4];
  id v9 = v8;
  if (v8 && [v8 ioServiceClassType] == 4)
  {
    uint64_t v10 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v9];
    if (v10)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v11 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v11 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [v10 needsOOBPairing];
        *(_DWORD *)buf = 138412546;
        id v20 = v10;
        __int16 v21 = 1024;
        int v22 = v13;
        _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ OOBPairing finished. Reset needsOOBPairing, current %d", buf, 0x12u);
      }

      [v10 setNeedsOOBPairing:0];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  listQ = self->_listQ;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _DWORD v17[2] = __89__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingDataFinishedForEndpointUUID___block_invoke;
  v17[3] = &unk_26466BB38;
  v17[4] = self;
  id v18 = v10;
  id v15 = v10;
  dispatch_async(listQ, v17);

  return 1;
}

void __89__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingDataFinishedForEndpointUUID___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v29;
    int v8 = MEMORY[0x263EF8438];
    *(void *)&long long v5 = 134218240;
    long long v23 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "mgr", v23);
        id v12 = *(void **)(a1 + 40);

        if (v11 == v12)
        {
          uint64_t v13 = gLogObjects;
          int v14 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v15 = gNumLogObjects < 2;
          }
          else {
            BOOL v15 = 1;
          }
          if (v15)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              uint64_t v34 = v13;
              __int16 v35 = 1024;
              int v36 = v14;
              _os_log_error_impl(&dword_222CE3000, v8, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v16 = v8;
            uint64_t v17 = v8;
          }
          else
          {
            uint64_t v17 = *(id *)(gLogObjects + 8);
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = *(void *)(a1 + 40);
            int v19 = [v10 service];
            *(_DWORD *)buf = 138412546;
            uint64_t v34 = v18;
            __int16 v35 = 1024;
            int v36 = v19;
            _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ OOBPairing finished. Found deferred AuthCP service %d, remove it from deferral list", buf, 0x12u);
          }

          [v2 addObject:v10];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 32) + 96) removeObjectsInArray:v2];
  if ([v2 count])
  {
    id v20 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingDataFinishedForEndpointUUID___block_invoke_157;
    block[3] = &unk_26466BA30;
    id v25 = v2;
    id v21 = *(id *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 32);
    id v26 = v21;
    uint64_t v27 = v22;
    dispatch_async(v20, block);
  }
}

void __89__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingDataFinishedForEndpointUUID___block_invoke_157(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    long long v5 = MEMORY[0x263EF8438];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v8 = gLogObjects;
        int v9 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v10 = gNumLogObjects < 2;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v22 = v8;
            __int16 v23 = 1024;
            int v24 = v9;
            _os_log_error_impl(&dword_222CE3000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v11 = v5;
          id v12 = v5;
        }
        else
        {
          id v12 = *(id *)(gLogObjects + 8);
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 40);
          int v14 = [v7 service];
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v13;
          __int16 v23 = 1024;
          int v24 = v14;
          _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ OOBPairing finished. Processing deferred AuthCP service %d", buf, 0x12u);
        }

        objc_msgSend(*(id *)(a1 + 48), "IOAccessoryAuthCPServiceArrived:", objc_msgSend(v7, "service"));
        IOObjectRelease([v7 service]);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

- (void)IOAccessoryConfigStreamServiceArrived:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v72[2] = *MEMORY[0x263EF8340];
  long long v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = [(ACCTransportIOAccessorySharedManager *)self _managerForIOService:v3 shouldCreateNewService:1];
  uint64_t v7 = [[ACCTransportIOAccessoryConfigStream alloc] initWithDelegate:self andIOService:v3];
  if (!v6)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Starting ConfigStream Service that has no associated parent IOAccMgr";
    int v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 2;
    goto LABEL_48;
  }
  if (![(ACCTransportIOAccessorySharedManager *)self _addACCTransportToManager:v7])
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v11 = MEMORY[0x263EF8438];
      id v37 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)unsigned int v64 = [(ACCTransportIOAccessoryBase *)v7 ioService];
    uint64_t v13 = "Couldn't find upstream io acc manager service for ConfigStream service %d";
    int v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 8;
LABEL_48:
    _os_log_impl(&dword_222CE3000, v14, v15, v13, buf, v16);
LABEL_49:

    goto LABEL_64;
  }
  listQ = self->_listQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__ACCTransportIOAccessorySharedManager_IOAccessoryConfigStreamServiceArrived___block_invoke;
  block[3] = &unk_26466BB38;
  void block[4] = self;
  int v9 = v7;
  id v62 = v9;
  dispatch_sync(listQ, block);
  if (gLogObjects && gNumLogObjects >= 2)
  {
    BOOL v10 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v10 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  id v54 = v7;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_INFO, "Successfully added io accessory ConfigStream to all ports list", buf, 2u);
  }

  long long v18 = [v6 connectionUUID];

  if (!v18)
  {
    long long v19 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    id v20 = objc_msgSend(v19, "createConnectionWithType:andIdentifier:", objc_msgSend(v6, "connectionType"), 0);

    id v21 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    objc_msgSend(v21, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v6, "supervisedTransportsRestricted"), v20);

    [v6 setConnectionUUID:v20];
    v71[0] = *MEMORY[0x263F34178];
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v6, "primaryPortNumber"));
    v72[0] = v22;
    v71[1] = *MEMORY[0x263F34150];
    __int16 v23 = [v6 digitalID];
    int v24 = v23;
    if (!v23)
    {
      int v24 = [MEMORY[0x263EFF9D0] null];
    }
    v72[1] = v24;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
    if (!v23) {

    }
    id v26 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    uint64_t v27 = (void *)[v25 copy];
    [v26 setProperties:v27 forConnectionWithUUID:v20];
  }
  v69[0] = *MEMORY[0x263F34110];
  uint64_t v59 = [(ACCTransportIOAccessoryConfigStream *)v9 deviceName];
  v70[0] = v59;
  v69[1] = *MEMORY[0x263F34100];
  unsigned int v58 = [(ACCTransportIOAccessoryConfigStream *)v9 deviceManufacturer];
  v70[1] = v58;
  v69[2] = *MEMORY[0x263F34108];
  long long v57 = [(ACCTransportIOAccessoryConfigStream *)v9 deviceModel];
  v70[2] = v57;
  void v69[3] = *MEMORY[0x263F34130];
  __int16 v56 = [(ACCTransportIOAccessoryConfigStream *)v9 deviceSerialNumber];
  v70[3] = v56;
  v69[4] = *MEMORY[0x263F340F8];
  id v55 = [(ACCTransportIOAccessoryConfigStream *)v9 deviceHardwareVersion];
  v70[4] = v55;
  v69[5] = *MEMORY[0x263F340F0];
  long long v28 = [(ACCTransportIOAccessoryConfigStream *)v9 deviceFirmwareVersion];
  v70[5] = v28;
  v69[6] = *MEMORY[0x263F34118];
  long long v60 = v9;
  long long v29 = [(ACCTransportIOAccessoryConfigStream *)v9 devicePPID];
  long long v30 = v29;
  if (!v29)
  {
    long long v30 = [MEMORY[0x263EFF9D0] null];
  }
  v70[6] = v30;
  v69[7] = *MEMORY[0x263F34128];
  long long v31 = [v6 regionCode];
  uint64_t v32 = v31;
  if (!v31)
  {
    uint64_t v32 = [MEMORY[0x263EFF9D0] null];
  }
  v70[7] = v32;
  v69[8] = *MEMORY[0x263F340E0];
  uint64_t v33 = [v6 inductiveDeviceUID];
  uint64_t v34 = v33;
  if (!v33)
  {
    uint64_t v34 = [MEMORY[0x263EFF9D0] null];
  }
  v70[8] = v34;
  __int16 v35 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:9];
  if (!v33) {

  }
  if (!v31) {
  if (!v29)
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v36 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v36 = MEMORY[0x263EF8438];
    id v38 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    unsigned int v39 = [(ACCTransportIOAccessoryBase *)v60 ioService];
    uint64_t v40 = [v6 connectionUUID];
    *(_DWORD *)buf = 136316162;
    *(void *)unsigned int v64 = "-[ACCTransportIOAccessorySharedManager IOAccessoryConfigStreamServiceArrived:]";
    *(_WORD *)&v64[8] = 1024;
    *(_DWORD *)&void v64[10] = 3213;
    __int16 v65 = 1024;
    *(_DWORD *)uint64_t v66 = v39;
    *(_WORD *)&void v66[4] = 2112;
    *(void *)&v66[6] = v40;
    __int16 v67 = 2112;
    v68 = v35;
    _os_log_impl(&dword_222CE3000, v36, OS_LOG_TYPE_INFO, "%s:%d service %d, connectionUUID %@, accInfo %@", buf, 0x2Cu);
  }
  id v41 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  uint64_t v42 = [v6 connectionUUID];
  id v43 = (void *)[v42 copy];
  id v44 = [v41 createEndpointWithTransportType:12 andProtocol:11 andIdentifier:0 forConnectionWithUUID:v43 publishConnection:0];

  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v45 = *(id *)(gLogObjects + 8);
    uint64_t v7 = v54;
  }
  else
  {
    uint64_t v7 = v54;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v45 = MEMORY[0x263EF8438];
    id v46 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    unsigned int v47 = [(ACCTransportIOAccessoryBase *)v60 ioService];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)unsigned int v64 = v47;
    *(_WORD *)&v64[4] = 2112;
    *(void *)&v64[6] = v44;
    __int16 v65 = 2112;
    *(void *)uint64_t v66 = v35;
    _os_log_impl(&dword_222CE3000, v45, OS_LOG_TYPE_INFO, "setAccessoryInfo for ConfigStream service %d, endpointUUID %@, accInfo %@", buf, 0x1Cu);
  }

  BOOL v48 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  [v48 setAccessoryInfo:v35 forEndpointWithUUID:v44];

  uint64_t v49 = (void *)[v44 copy];
  [(ACCTransportIOAccessoryConfigStream *)v60 setEndpointUUID:v49];

  uint64_t v50 = [v6 connectionUUID];
  [(ACCTransportIOAccessoryConfigStream *)v60 setParentConnectionUUID:v50];

  int v51 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  int v52 = [v6 connectionUUID];
  [v51 publishConnectionWithUUID:v52];

LABEL_64:
  v53 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v53 unlock];
}

uint64_t __78__ACCTransportIOAccessorySharedManager_IOAccessoryConfigStreamServiceArrived___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)IOAccessoryConfigStreamServiceTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  *(void *)&v43[5] = *MEMORY[0x263EF8340];
  long long v5 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v5 lock];

  uint64_t v6 = [(ACCTransportIOAccessorySharedManager *)self _basePortForService:v3];
  if (v6)
  {
    uint64_t v7 = [(ACCTransportIOAccessorySharedManager *)self _managerForBase:v6];
    uint64_t v8 = v7;
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects <= 1;
    }
    else {
      BOOL v9 = 1;
    }
    int v10 = !v9;
    if (v7)
    {
      if (v10)
      {
        uint64_t v11 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v11 = MEMORY[0x263EF8438];
        id v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v43[0] = [v8 ioService];
        LOWORD(v43[1]) = 1024;
        *(_DWORD *)((char *)&v43[1] + 2) = v3;
        _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_INFO, "ConfigStream Terminated: found manager with service %d for terminated service %d", buf, 0xEu);
      }

      [v8 removeIOAccessoryChildPort:v6];
    }
    else
    {
      if (v10)
      {
        int v14 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v14 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v43[0] = v3;
        _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_INFO, "Didn't find manager for removed auth CP service %d", buf, 8u);
      }
    }
    id v17 = [v6 endpointUUID];
    long long v18 = (void *)[v17 copy];

    if (gLogObjects && gNumLogObjects >= 2)
    {
      long long v19 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      long long v19 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v43 = v18;
      _os_log_impl(&dword_222CE3000, v19, OS_LOG_TYPE_DEFAULT, "Remove ConfigStream Service endpointUUID %@", buf, 0xCu);
    }

    if (v18)
    {
      id v21 = [(ACCTransportIOAccessorySharedManager *)self delegate];
      int v22 = [v21 destroyEndpointWithUUID:v18];

      if (v22)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          __int16 v23 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          __int16 v23 = MEMORY[0x263EF8438];
          id v24 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v43 = v18;
          _os_log_impl(&dword_222CE3000, v23, OS_LOG_TYPE_DEFAULT, "Removed ConfigStream service endpoint %@", buf, 0xCu);
        }

        [v6 setEndpointUUID:0];
        [v6 setParentConnectionUUID:0];
      }
    }
    listQ = self->_listQ;
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    id v38 = __81__ACCTransportIOAccessorySharedManager_IOAccessoryConfigStreamServiceTerminated___block_invoke;
    unsigned int v39 = &unk_26466BB38;
    uint64_t v40 = self;
    id v41 = v6;
    dispatch_sync(listQ, &v36);
    uint64_t v26 = [v8 connectionUUID];
    if (v26)
    {
      uint64_t v27 = (void *)v26;
      long long v28 = [v8 connectionUUID];
      BOOL v29 = [(ACCTransportIOAccessorySharedManager *)self _managerForConnectionUUIDHasActiveEndpoint:v28];

      if (!v29)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          long long v30 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          long long v30 = MEMORY[0x263EF8438];
          id v31 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [v8 connectionUUID];
          *(_DWORD *)buf = 138412290;
          *(void *)id v43 = v32;
          _os_log_impl(&dword_222CE3000, v30, OS_LOG_TYPE_DEFAULT, "No active endpoint for ConfigStream Service connection, remove connectionUUID %@", buf, 0xCu);
        }
        uint64_t v33 = [(ACCTransportIOAccessorySharedManager *)self delegate];
        uint64_t v34 = [v8 connectionUUID];
        [v33 destroyConnectionWithUUID:v34];

        [v8 setConnectionUUID:0];
        [(ACCTransportIOAccessorySharedManager *)self _clearChildPortEndpointsForManagerDisconnection:v8];
      }
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 2;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v8 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v43[0] = v3;
      _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed ConfigStream service %d", buf, 8u);
    }
  }

  __int16 v35 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v35 unlock];
}

uint64_t __81__ACCTransportIOAccessorySharedManager_IOAccessoryConfigStreamServiceTerminated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)IOAccessoryConfigStreamUpdateAccesssoryInfo:(id)a3
{
  v23[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22[0] = *MEMORY[0x263F34110];
  long long v5 = [v4 deviceName];
  v23[0] = v5;
  v22[1] = *MEMORY[0x263F34100];
  uint64_t v6 = [v4 deviceManufacturer];
  v23[1] = v6;
  v22[2] = *MEMORY[0x263F34108];
  uint64_t v7 = [v4 deviceModel];
  v23[2] = v7;
  v22[3] = *MEMORY[0x263F34130];
  uint64_t v8 = [v4 deviceSerialNumber];
  v23[3] = v8;
  v22[4] = *MEMORY[0x263F340F8];
  BOOL v9 = [v4 deviceHardwareVersion];
  v23[4] = v9;
  v22[5] = *MEMORY[0x263F340F0];
  int v10 = [v4 deviceFirmwareVersion];
  v23[5] = v10;
  v22[6] = *MEMORY[0x263F34118];
  uint64_t v11 = [v4 devicePPID];
  v23[6] = v11;
  BOOL v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:7];

  id v13 = [v4 endpointUUID];
  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v14 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v14 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v17[0] = 67109634;
    v17[1] = [v4 ioService];
    __int16 v18 = 2112;
    long long v19 = v13;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_INFO, "setAccessoryInfo for ConfigStream service %d, endpointUUID %@, accInfo %@", (uint8_t *)v17, 0x1Cu);
  }

  id v16 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  [v16 setAccessoryInfo:v12 forEndpointWithUUID:v13];
}

- (void)IOAccessoryConfigStreamMessageArrived:(id)a3 endpointUUID:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogSignpostObjects) {
    BOOL v8 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    int v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    int v10 = *(id *)(gLogSignpostObjects + 24);
  }
  uint64_t v11 = [v7 hash];
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      int v25 = 138412546;
      uint64_t v26 = (const char *)v7;
      __int16 v27 = 2048;
      uint64_t v28 = [v6 length];
      _os_signpost_emit_with_name_impl(&dword_222CE3000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming ConfigStream data! %@, %lu bytes", (uint8_t *)&v25, 0x16u);
    }
  }

  uint64_t v13 = [v7 hash];
  os_signpost_id_t v14 = [v6 hash] ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    id v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = [v6 length];
    int v25 = 138412546;
    uint64_t v26 = (const char *)v7;
    __int16 v27 = 2048;
    uint64_t v28 = v17;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming ConfigStream data! %@, %lu bytes", (uint8_t *)&v25, 0x16u);
  }

  __int16 v18 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  long long v19 = "ERROR";
  if (v18)
  {
    __int16 v20 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    int v21 = [v20 processIncomingData:v6 forEndpointWithUUID:v7];

    if (v21) {
      long long v19 = "SUCCESS";
    }
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    int v22 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:]();
    }
    int v22 = MEMORY[0x263EF8438];
    id v23 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    uint64_t v24 = [v6 length];
    int v25 = 136315650;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    uint64_t v28 = (uint64_t)v7;
    __int16 v29 = 2048;
    uint64_t v30 = v24;
    _os_signpost_emit_with_name_impl(&dword_222CE3000, v22, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming ConfigStream data! %@, %lu bytes", (uint8_t *)&v25, 0x20u);
  }
}

- (void)lockAccessoryPorts
{
  id v2 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v2 lock];
}

- (void)unlockAccessoryPorts
{
  id v2 = [(ACCTransportIOAccessorySharedManager *)self accessoryPortLock];
  [v2 unlock];
}

- (void)resetLightningBusForEndpointWithUUID:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  io_connect_t connect = 0;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v4;
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "Resetting lightning bus for endpoint %@...", buf, 0xCu);
  }

  BOOL v8 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  if (!v8) {
    goto LABEL_15;
  }
  id v9 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  int v10 = [(ACCTransportIOAccessorySharedManager *)self delegate];
  uint64_t v11 = [v10 connectionUUIDForEndpointWithUUID:v4];
  int v12 = [v9 connectionTypeForConnectionWithUUID:v11];

  if (v12 != 1)
  {
LABEL_15:
    id v16 = logObjectForModule_0(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:]();
    }
    io_object_t ManagerPrimaryPort = 0;
    goto LABEL_172;
  }
  uint64_t v13 = [(ACCTransportIOAccessorySharedManager *)self delegate];

  if (v13)
  {
    os_signpost_id_t v14 = [(ACCTransportIOAccessorySharedManager *)self delegate];
    int v15 = [v14 transportTypeForEndpointWithUUID:v4];
  }
  else
  {
    int v15 = 17;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    __int16 v18 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    __int16 v18 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    [(ACCTransportIOAccessorySharedManager *)v15 resetLightningBusForEndpointWithUUID:v20];
  }

  int v21 = [(ACCTransportIOAccessorySharedManager *)self _managerForBaseEndpointUUID:v4];
  id v16 = v21;
  if (v21)
  {
    if ([v21 ioService])
    {
      io_object_t ManagerPrimaryPort = [v16 ioService];
      IOObjectRetain(ManagerPrimaryPort);
      if (!ManagerPrimaryPort) {
        goto LABEL_163;
      }
      goto LABEL_52;
    }
LABEL_43:
    io_object_t ManagerPrimaryPort = 0;
    goto LABEL_163;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    int v22 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v22 = MEMORY[0x263EF8438];
    id v23 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, v22, OS_LOG_TYPE_DEFAULT, "Could not find endpoint, falling back to most downstream port...", buf, 2u);
  }

  io_object_t ServiceWithPort = IOAccessoryPortGetServiceWithPort();
  if (!ServiceWithPort) {
    goto LABEL_43;
  }
  io_object_t v25 = ServiceWithPort;
  io_object_t ManagerPrimaryPort = IOAccessoryPortGetManagerPrimaryPort();
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v26 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v26 = MEMORY[0x263EF8438];
    id v27 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v67) = ManagerPrimaryPort;
    _os_log_impl(&dword_222CE3000, v26, OS_LOG_TYPE_INFO, "primaryPortNumber: %d", buf, 8u);
  }

  if (ManagerPrimaryPort) {
    io_object_t ManagerPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  }
  IOObjectRelease(v25);
  if (!ManagerPrimaryPort) {
    goto LABEL_163;
  }
LABEL_52:
  if (!IOServiceOpen(ManagerPrimaryPort, *MEMORY[0x263EF8960], 0, &connect))
  {
    unsigned int v28 = v15 & 0xFFFFFFF7;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      __int16 v29 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      __int16 v29 = MEMORY[0x263EF8438];
      id v30 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v67) = 1250;
      _os_log_impl(&dword_222CE3000, v29, OS_LOG_TYPE_DEFAULT, "Toggling lightning bus for %dms...", buf, 8u);
    }

    if (v28) {
      goto LABEL_62;
    }
    USBConnectchar Type = IOAccessoryManagerGetUSBConnectType();
    if (USBConnectType)
    {
      mach_error_t v63 = USBConnectType;
      unsigned int v64 = logObjectForModule_0(1);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:]9(v63);
      }

      goto LABEL_172;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v33 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v33 = MEMORY[0x263EF8438];
      id v34 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v67) = -1;
      _os_log_impl(&dword_222CE3000, v33, OS_LOG_TYPE_INFO, "Current USB Connection Type: %d", buf, 8u);
    }

    if (gLogObjects && gNumLogObjects >= 2)
    {
      __int16 v35 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      __int16 v35 = MEMORY[0x263EF8438];
      id v36 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v67) = 0;
      _os_log_impl(&dword_222CE3000, v35, OS_LOG_TYPE_INFO, "Current USB Connection Active: %d", buf, 8u);
    }

    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v37 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v37 = MEMORY[0x263EF8438];
      id v38 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, v37, OS_LOG_TYPE_INFO, "Disabling USB...", buf, 2u);
    }

    mach_error_t v39 = IOAccessoryManagerConfigureUSBMode();
    if (!v39)
    {
LABEL_62:
      int v31 = 1;
    }
    else
    {
      mach_error_t v40 = v39;
      if (gLogObjects && gNumLogObjects >= 2)
      {
        id v41 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        id v41 = MEMORY[0x263EF8438];
        id v42 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.7(v40);
      }

      int v31 = 0;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v43 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v43 = MEMORY[0x263EF8438];
      id v44 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, v43, OS_LOG_TYPE_DEFAULT, "Disabling accessory power...", buf, 2u);
    }

    mach_error_t v45 = IOAccessoryManagerConfigurePower();
    if (v45)
    {
      mach_error_t v46 = v45;
      if (gLogObjects && gNumLogObjects >= 2)
      {
        unsigned int v47 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        unsigned int v47 = MEMORY[0x263EF8438];
        id v48 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:]1(v46);
      }

      int v31 = 0;
    }
    usleep(0x1312D0u);
    if (!v28)
    {
      mach_error_t v49 = IOAccessoryManagerConfigureUSBMode();
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v50 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v50 = MEMORY[0x263EF8438];
        id v51 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CE3000, v50, OS_LOG_TYPE_INFO, "Enabling USB...", buf, 2u);
      }

      if (gLogObjects && gNumLogObjects >= 2)
      {
        int v52 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v52 = MEMORY[0x263EF8438];
        id v53 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = 4;
        _os_log_impl(&dword_222CE3000, v52, OS_LOG_TYPE_INFO, "USB mode: %d", buf, 8u);
      }

      if (v49)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          id v54 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v54 = MEMORY[0x263EF8438];
          id v55 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.7(v49);
        }

        int v31 = 0;
      }
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      __int16 v56 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      __int16 v56 = MEMORY[0x263EF8438];
      id v57 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, v56, OS_LOG_TYPE_DEFAULT, "Enabling accessory power...", buf, 2u);
    }

    mach_error_t v58 = IOAccessoryManagerConfigurePower();
    if (!v58)
    {

      if (v31) {
        goto LABEL_173;
      }
      goto LABEL_164;
    }
    mach_error_t v59 = v58;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      long long v60 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      long long v60 = MEMORY[0x263EF8438];
      id v61 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.4(v59);
    }
  }
LABEL_163:

LABEL_164:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v16 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v16 = MEMORY[0x263EF8438];
    id v62 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:]();
  }
LABEL_172:

LABEL_173:
  if (connect) {
    IOServiceClose(connect);
  }
  if (ManagerPrimaryPort) {
    IOObjectRelease(ManagerPrimaryPort);
  }
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ACCTransportIOAccessorySharedManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  id v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

uint64_t __53__ACCTransportIOAccessorySharedManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (id)IOAccessoryClassStringForIOAccessoryClassType:(int)a3
{
  switch(a3)
  {
    case 0:
      id v4 = NSString;
      BOOL v5 = "IOAccessoryManager";
      goto LABEL_16;
    case 1:
      id v4 = NSString;
      BOOL v5 = "IOAccessoryPort";
      goto LABEL_16;
    case 2:
      id v4 = NSString;
      BOOL v5 = "IOAccessoryEAInterface";
      goto LABEL_16;
    case 3:
      id v4 = NSString;
      BOOL v5 = "AppleAuthCP";
      goto LABEL_16;
    case 4:
      id v4 = NSString;
      BOOL v5 = "IOAccessoryOOBPairingInterface";
      goto LABEL_16;
    case 6:
      id v4 = NSString;
      BOOL v5 = "IOAccessoryConfigStreamInterface";
LABEL_16:
      BOOL v8 = [v4 stringWithUTF8String:v5];
      break;
    default:
      if (gLogObjects) {
        BOOL v6 = gNumLogObjects < 1;
      }
      else {
        BOOL v6 = 1;
      }
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        int v10 = MEMORY[0x263EF8438];
        id v7 = MEMORY[0x263EF8438];
      }
      else
      {
        int v10 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[ACCTransportIOAccessorySharedManager IOAccessoryClassStringForIOAccessoryClassType:](a3, v10);
      }

      BOOL v8 = 0;
      break;
  }
  return v8;
}

+ (int)IOAccessoryClassTypeForIOAccessoryClassString:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [NSString stringWithUTF8String:"IOAccessoryManager"];
  char v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v7 = [NSString stringWithUTF8String:"IOAccessoryPort"];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int v6 = 1;
      goto LABEL_11;
    }
    id v9 = [NSString stringWithUTF8String:"IOAccessoryEAInterface"];
    char v10 = [v3 isEqualToString:v9];

    if (v10)
    {
      int v6 = 2;
      goto LABEL_11;
    }
    uint64_t v11 = [NSString stringWithUTF8String:"AppleAuthCP"];
    char v12 = [v3 isEqualToString:v11];

    if (v12)
    {
      int v6 = 3;
      goto LABEL_11;
    }
    uint64_t v13 = [NSString stringWithUTF8String:"IOAccessoryConfigStreamInterface"];
    char v14 = [v3 isEqualToString:v13];

    if (v14)
    {
      int v6 = 6;
      goto LABEL_11;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v16 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v3;
      _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_INFO, "Unknown classString %@", (uint8_t *)&v18, 0xCu);
    }
  }
  int v6 = 0;
LABEL_11:

  return v6;
}

- (ACCTransportPluginIOAccessoryManager)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCTransportPluginIOAccessoryManager *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isB139OrB164Connected
{
  return self->_isB139OrB164Connected;
}

- (OS_dispatch_queue)listQ
{
  return self->_listQ;
}

- (void)setListQ:(id)a3
{
}

- (NSMutableSet)allIOAccessories
{
  return self->_allIOAccessories;
}

- (void)setAllIOAccessories:(id)a3
{
}

- (NSMutableSet)allIOAccessoryManagers
{
  return self->_allIOAccessoryManagers;
}

- (void)setAllIOAccessoryManagers:(id)a3
{
}

- (NSMutableSet)rootIOAccessoryManagers
{
  return self->_rootIOAccessoryManagers;
}

- (void)setRootIOAccessoryManagers:(id)a3
{
}

- (ACCTransportIOAccessoryListener)ioAccessoryListener
{
  return self->_ioAccessoryListener;
}

- (void)setIoAccessoryListener:(id)a3
{
}

- (ACCTransportIOAccessoryManager)rootE75Manager
{
  return self->_rootE75Manager;
}

- (ACCTransportIOAccessoryManager)rootOrionManager
{
  return self->_rootOrionManager;
}

- (NSRecursiveLock)accessoryPortLock
{
  return self->_accessoryPortLock;
}

- (void)setAccessoryPortLock:(id)a3
{
}

- (ACCSettingsState)enableDirectAWCAuth
{
  return self->_enableDirectAWCAuth;
}

- (void)setEnableDirectAWCAuth:(id)a3
{
}

- (BOOL)bIsWatch
{
  return self->_bIsWatch;
}

- (NSMutableArray)deferAuthCPServiceArray
{
  return self->_deferAuthCPServiceArray;
}

- (void)setDeferAuthCPServiceArray:(id)a3
{
}

- (NSMutableArray)deferEAServiceArray
{
  return self->_deferEAServiceArray;
}

- (void)setDeferEAServiceArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferEAServiceArray, 0);
  objc_storeStrong((id *)&self->_deferAuthCPServiceArray, 0);
  objc_storeStrong((id *)&self->_enableDirectAWCAuth, 0);
  objc_storeStrong((id *)&self->_accessoryPortLock, 0);
  objc_storeStrong((id *)&self->_rootOrionManager, 0);
  objc_storeStrong((id *)&self->_rootE75Manager, 0);
  objc_storeStrong((id *)&self->_ioAccessoryListener, 0);
  objc_storeStrong((id *)&self->_rootIOAccessoryManagers, 0);
  objc_storeStrong((id *)&self->_allIOAccessoryManagers, 0);
  objc_storeStrong((id *)&self->_allIOAccessories, 0);
  objc_storeStrong((id *)&self->_listQ, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __66__ACCTransportIOAccessorySharedManager_startIOACCTransportManager__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = 1250;
  OUTLINED_FUNCTION_12_0(&dword_222CE3000, a1, a3, "about to call startListeningBlock block after delay of %d Ms", (uint8_t *)v3);
}

void __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_12(&dword_222CE3000, v0, v1, "_managerForBase found IOAccMgr class instance for base port", v2, v3, v4, v5, v6);
}

void __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2_cold_3(void *a1, uint64_t a2)
{
  [a1 ioService];
  [*(id *)(a2 + 32) upstreamManagerService];
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0xEu);
}

void __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_12(&dword_222CE3000, v0, v1, "found IOAccMgr class instance for base port by checking the child port list", v2, v3, v4, v5, v6);
}

void __84__ACCTransportIOAccessorySharedManager__managerForIOService_shouldCreateNewService___block_invoke_cold_1(int *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_12_0(&dword_222CE3000, a2, a3, "ACCTransportIOAccessoryManager already exists for service %d, or there is no upstream manager service", (uint8_t *)v4);
}

- (void)_addIOAccessoryManagerWithIOService:.cold.2()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_12(&dword_222CE3000, v0, v1, "Adding root Orion manager", v2, v3, v4, v5, v6);
}

- (void)_addIOAccessoryManagerWithIOService:.cold.4()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_12(&dword_222CE3000, v0, v1, "Adding root E75 manager", v2, v3, v4, v5, v6);
}

- (void)_managerForBaseEndpointUUID:(void *)a1 .cold.3(void *a1)
{
  [a1 ioService];
  id v7 = [a1 connectionUUID];
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x1Cu);
}

- (void)_managerForConnectionUUID:.cold.3()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "IOAccessoryPortGetServiceWithPort for kIOAccessoryPortIDUSB failed!", v2, v3, v4, v5, v6);
}

- (void)_managerForConnectionUUID:(os_log_t)log .cold.9(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_debug_impl(&dword_222CE3000, log, OS_LOG_TYPE_DEBUG, "no connectionUUID %@ to find manager for", (uint8_t *)&v1, 0xCu);
}

void __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_222CE3000, a2, OS_LOG_TYPE_DEBUG, "found IOAccMgr class instance for connectionUUID %@", (uint8_t *)&v3, 0xCu);
}

void __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2_cold_3(void *a1)
{
  int v1 = [a1 connectionUUID];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)transmitData:forEndpointUUID:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2(&dword_222CE3000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", v1, v2, v3, v4, v5);
}

- (void)transmitData:forEndpointUUID:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_222CE3000, v1, OS_LOG_TYPE_DEBUG, "Sending outgoing data %@ for endpointUUID %@", v2, 0x16u);
}

- (void)shouldEnableDirectAWCAuth
{
  [*(id *)(a1 + 88) BOOLValue];
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 8u);
}

- (void)setUSBMode:forConnectionUUID:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_0(&dword_222CE3000, v0, v1, "usbMode %d for connectionUUID %@");
}

- (void)setUSBMode:forConnectionUUID:.cold.4()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0(&dword_222CE3000, v0, v1, "Error setting USB mode type %d for connectionUUID %@");
}

- (void)setUSBMode:forEndpointUUID:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_0(&dword_222CE3000, v0, v1, "usbMode %d for endpointUUID %@");
}

- (void)setUSBMode:forEndpointUUID:.cold.4()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0(&dword_222CE3000, v0, v1, "Error setting USB mode type %d for endpointUUID %@");
}

- (void)IOAccessoryManagerServiceInfoSet:(NSObject *)a3 .cold.2(uint64_t a1, int a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_12_0(&dword_222CE3000, a3, (uint64_t)a3, "IOAccessoryManager with service %d has EAService, OOBPairing child ports. Those handlers publish the eACCEndpoint_Protocol_InternalInfo endpoint", (uint8_t *)a1);
}

- (void)IOAccessoryPortArrived:(void *)a1 withEndpointProtocol:publish:.cold.5(void *a1)
{
  os_log_t v1 = [a1 connectionUUID];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);
}

- (void)_IOAccessoryPortDetachInternal:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8_0();
  _os_log_error_impl(&dword_222CE3000, v0, OS_LOG_TYPE_ERROR, "Error, IOAccessoryPort endpointUUID %@ unable to detach", v1, 0xCu);
}

- (void)IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "IOAccMgr setFeaturesFromAuthStatus: failed!", v2, v3, v4, v5, v6);
}

- (void)IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:.cold.3()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "Delegate setAuthenticationStatus: failed!", v2, v3, v4, v5, v6);
}

- (void)IOAccessoryAuthCPServiceAuthStatusChanged:(void *)a1 authType:authCert:certType:authCTA:service:.cold.7(void *a1)
{
  uint8_t v6 = [a1 connectionUUID];
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x12u);
}

- (void)resetLightningBusForEndpointWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_0(&dword_222CE3000, v0, v1, "Cannot reset lightning bus for non-lightning connection!", v2, v3, v4, v5, v6);
}

- (void)resetLightningBusForEndpointWithUUID:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8_0();
  _os_log_error_impl(&dword_222CE3000, v0, OS_LOG_TYPE_ERROR, "Could not reset lighting port associated with endpoint %@!", v1, 0xCu);
}

- (void)resetLightningBusForEndpointWithUUID:(mach_error_t)a1 .cold.4(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_1(&dword_222CE3000, v1, v2, "Could not enable ACC power: %s", v3, v4, v5, v6, v7);
}

- (void)resetLightningBusForEndpointWithUUID:(mach_error_t)a1 .cold.7(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_1(&dword_222CE3000, v1, v2, "Could not configure USB mode: %s", v3, v4, v5, v6, v7);
}

- (void)resetLightningBusForEndpointWithUUID:(mach_error_t)a1 .cold.11(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_1(&dword_222CE3000, v1, v2, "Could not disable ACC power: %s", v3, v4, v5, v6, v7);
}

- (void)resetLightningBusForEndpointWithUUID:(mach_error_t)a1 .cold.19(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_1(&dword_222CE3000, v1, v2, "Could not get USB Connect Type! (ret: %s)", v3, v4, v5, v6, v7);
}

- (void)resetLightningBusForEndpointWithUUID:(uint64_t)a3 .cold.23(int a1, NSObject *a2, uint64_t a3)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_12_0(&dword_222CE3000, a2, a3, "transportType: %{coreacc:ACCEndpoint_TransportType_t}d", (uint8_t *)v3);
}

+ (void)IOAccessoryClassStringForIOAccessoryClassType:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_222CE3000, a2, OS_LOG_TYPE_ERROR, "Unknown classType %d", (uint8_t *)v2, 8u);
}

@end
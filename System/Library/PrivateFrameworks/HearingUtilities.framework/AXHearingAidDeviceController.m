@interface AXHearingAidDeviceController
+ (id)sharedController;
- (AXHearingAidDeviceController)init;
- (BOOL)isBluetoothAvailable;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isPaired;
- (BOOL)isPartiallyConnected;
- (BOOL)isScanning;
- (BOOL)representsLocalDevices;
- (BOOL)shouldActiveScan;
- (BOOL)shouldRelinquishForPartialConnection;
- (NSMutableArray)availablePeripherals;
- (NSMutableArray)availableSearchBlocks;
- (NSMutableArray)centralRequestBlocks;
- (NSMutableArray)connectedDevices;
- (NSMutableArray)connectedSearchBlocks;
- (NSMutableArray)loadedDevices;
- (NSMutableArray)persistentDevices;
- (NSMutableArray)updateDeviceBlocks;
- (id)hearingAidForDeviceID:(id)a3;
- (id)hearingAidForPeripheral:(id)a3;
- (id)hearingAidsForPeripheral:(id)a3;
- (id)hearingAidsForUUID:(id)a3;
- (id)pairedHearingDevice;
- (id)valueForProperty:(unint64_t)a3 forDeviceID:(id)a4;
- (void)addAvailableDevice:(id)a3;
- (void)addConnectedDevice:(id)a3;
- (void)addLoadedDevice:(id)a3;
- (void)cancelPendingConnections;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didRetrieveConnectedPeripherals:(id)a4;
- (void)centralManager:(id)a3 didRetrievePeripherals:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkPartiallyPairedWithCompletion:(id)a3;
- (void)checkPeripheralPaired:(id)a3 withCompletion:(id)a4;
- (void)clearAvailableDevices;
- (void)clearConnectedDevices;
- (void)clearLoadedDevices;
- (void)clearMissingHearingAids;
- (void)connectToPeripheral:(id)a3;
- (void)dealloc;
- (void)deviceDidFinishLoading:(id)a3;
- (void)disconnectFromHearingAidWithDeviceUUID:(id)a3;
- (void)disconnectFromPeripheral:(id)a3;
- (void)forgetDevice:(id)a3;
- (void)loadedDevicesDidChange;
- (void)mergeDevice:(id)a3 withDevice:(id)a4;
- (void)pairedHearingAidsDidChange;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)persistPairedHearingAids;
- (void)removeAvailableDevice:(id)a3;
- (void)removeConnectedDevice:(id)a3;
- (void)removeLoadedDevice:(id)a3;
- (void)replaceDevice:(id)a3 withDevice:(id)a4;
- (void)resetConnectionToPeripheral:(id)a3;
- (void)searchForAvailableDevices;
- (void)searchForAvailableDevicesWithCompletion:(id)a3;
- (void)searchForConnectedDevices;
- (void)sendRequestToCentralManager:(id)a3;
- (void)setAvailablePeripherals:(id)a3;
- (void)setAvailableSearchBlocks:(id)a3;
- (void)setCentralRequestBlocks:(id)a3;
- (void)setConnectedDevices:(id)a3;
- (void)setConnectedSearchBlocks:(id)a3;
- (void)setLoadedDevices:(id)a3;
- (void)setPersistentDevices:(id)a3;
- (void)setShouldActiveScan:(BOOL)a3;
- (void)setUpdateDeviceBlocks:(id)a3;
- (void)stopSearching;
- (void)unpairPeripheralWithUUID:(id)a3;
@end

@implementation AXHearingAidDeviceController

+ (id)sharedController
{
  if (sharedController_onceToken_1 != -1) {
    dispatch_once(&sharedController_onceToken_1, &__block_literal_global_14);
  }
  v2 = (void *)sharedController_HearingAidController;

  return v2;
}

uint64_t __48__AXHearingAidDeviceController_sharedController__block_invoke()
{
  sharedController_HearingAidController = objc_alloc_init(AXHearingAidDeviceController);

  return MEMORY[0x270F9A758]();
}

- (void)searchForAvailableDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __72__AXHearingAidDeviceController_searchForAvailableDevicesWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connectedDevices];
  id v19 = (id)[v2 copy];

  id v3 = [*(id *)(a1 + 32) persistentDevices];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) persistentDevices];
    uint64_t v6 = [v19 arrayByAddingObjectsFromArray:v5];

    id v19 = (id)v6;
  }
  v7 = [*(id *)(a1 + 32) availablePeripherals];
  id v8 = (id)[v7 arrayByAddingObjectsFromArray:v19];

  v9 = [*(id *)(a1 + 32) loadedDevices];
  v10 = [v19 indexesOfObjectsPassingTest:&__block_literal_global_3];
  v11 = [v19 objectsAtIndexes:v10];
  id v12 = (id)[v9 arrayByAddingObjectsFromArray:v11];

  if (*(void *)(a1 + 40))
  {
    v13 = [*(id *)(a1 + 32) availableSearchBlocks];
    [v13 removeAllObjects];

    v14 = (void *)[*(id *)(a1 + 40) copy];
    v15 = [*(id *)(a1 + 32) availableSearchBlocks];
    v16 = (void *)MEMORY[0x2105575F0](v14);
    [v15 addObject:v16];

    v17 = [*(id *)(a1 + 32) connectedSearchBlocks];
    v18 = (void *)MEMORY[0x2105575F0](v14);
    [v17 addObject:v18];
  }
  [*(id *)(a1 + 32) searchForAvailableDevices];
}

uint64_t __72__AXHearingAidDeviceController_searchForAvailableDevicesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didLoadBasicProperties];
}

- (AXHearingAidDeviceController)init
{
  if (([MEMORY[0x263F472B0] currentProcessIsHeard] & 1) != 0 || _AXSInUnitTestMode())
  {
    v37.receiver = self;
    v37.super_class = (Class)AXHearingAidDeviceController;
    id v3 = [(HUDeviceController *)&v37 init];
    if (v3)
    {
      uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      availableSearchBlocks = v3->_availableSearchBlocks;
      v3->_availableSearchBlocks = v4;

      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      connectedSearchBlocks = v3->_connectedSearchBlocks;
      v3->_connectedSearchBlocks = v6;

      id v8 = [MEMORY[0x263EFF980] array];
      [(AXHearingAidDeviceController *)v3 setUpdateDeviceBlocks:v8];

      v9 = [MEMORY[0x263EFF980] array];
      [(AXHearingAidDeviceController *)v3 setAvailablePeripherals:v9];

      v10 = [MEMORY[0x263EFF980] array];
      [(AXHearingAidDeviceController *)v3 setLoadedDevices:v10];

      v11 = [MEMORY[0x263EFF980] array];
      [(AXHearingAidDeviceController *)v3 setConnectedDevices:v11];

      id v12 = [MEMORY[0x263EFF980] array];
      [(AXHearingAidDeviceController *)v3 setCentralRequestBlocks:v12];

      v13 = [MEMORY[0x263EFF980] array];
      [(AXHearingAidDeviceController *)v3 setPersistentDevices:v13];

      dispatch_queue_t v14 = dispatch_queue_create("com.apple.ax.hearingaids", 0);
      bluetoothCentralQueue = v3->_bluetoothCentralQueue;
      v3->_bluetoothCentralQueue = (OS_dispatch_queue *)v14;

      id v16 = objc_alloc(MEMORY[0x263EFEF00]);
      v17 = v3->_bluetoothCentralQueue;
      v18 = NSDictionary;
      id v19 = [NSNumber numberWithBool:1];
      v20 = objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, *MEMORY[0x263EFED30], 0);
      uint64_t v21 = [v16 initWithDelegate:v3 queue:v17 options:v20];
      bluetoothManager = v3->_bluetoothManager;
      v3->_bluetoothManager = (CBCentralManager *)v21;

      v23 = [(CBCentralManager *)v3->_bluetoothManager sharedPairingAgent];
      [v23 setDelegate:v3];

      v3->_centralIsOn = [(CBCentralManager *)v3->_bluetoothManager state] == 5;
      v24 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
      centralRequestsLock = v3->_centralRequestsLock;
      v3->_centralRequestsLock = v24;

      v26 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
      dispatch_queue_t v27 = dispatch_queue_create("ha_updates_queue", v26);
      deviceUpdatesQueue = v3->_deviceUpdatesQueue;
      v3->_deviceUpdatesQueue = (OS_dispatch_queue *)v27;

      uint64_t v29 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:0];
      availableDeviceTimer = v3->_availableDeviceTimer;
      v3->_availableDeviceTimer = (AXDispatchTimer *)v29;

      [(AXDispatchTimer *)v3->_availableDeviceTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
      dispatch_time_t v31 = dispatch_time(0, 100000000);
      v32 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__AXHearingAidDeviceController_init__block_invoke;
      block[3] = &unk_2640FC960;
      v36 = v3;
      dispatch_after(v31, v32, block);
    }
    self = v3;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __36__AXHearingAidDeviceController_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) pairedHearingAidsDidChange];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = +[HUHearingAidSettings sharedInstance];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__AXHearingAidDeviceController_init__block_invoke_2;
  v3[3] = &unk_2640FC910;
  objc_copyWeak(&v4, &location);
  [v2 registerUpdateBlock:v3 forRetrieveSelector:sel_pairedHearingAids withListener:*(void *)(a1 + 32)];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __36__AXHearingAidDeviceController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pairedHearingAidsDidChange];
}

- (void)dealloc
{
  [(AXHearingAidDeviceController *)self setAvailablePeripherals:0];
  [(AXHearingAidDeviceController *)self setLoadedDevices:0];
  [(AXHearingAidDeviceController *)self setConnectedDevices:0];
  [(AXHearingAidDeviceController *)self setUpdateDeviceBlocks:0];
  [(AXHearingAidDeviceController *)self setAvailableSearchBlocks:0];
  [(AXHearingAidDeviceController *)self setConnectedSearchBlocks:0];
  [(AXHearingAidDeviceController *)self setCentralRequestBlocks:0];
  [(AXHearingAidDeviceController *)self setPersistentDevices:0];
  v3.receiver = self;
  v3.super_class = (Class)AXHearingAidDeviceController;
  [(AXHearingAidDeviceController *)&v3 dealloc];
}

- (void)clearMissingHearingAids
{
  [(AXDispatchTimer *)self->_advertisingTimeoutTimer cancel];
  objc_initWeak(&location, self);
  advertisingTimeoutTimer = self->_advertisingTimeoutTimer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke;
  v4[3] = &unk_2640FD1D0;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [(AXDispatchTimer *)advertisingTimeoutTimer afterDelay:v4 processBlock:10.0];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 120);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke_2;
  v6[3] = &unk_2640FE560;
  v2 = (id *)(a1 + 40);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v1 enumerateKeysAndObjectsUsingBlock:v6];
  id WeakRetained = objc_loadWeakRetained(v2);
  int v4 = [WeakRetained isScanning];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 clearMissingHearingAids];
  }
  objc_destroyWeak(&v7);
}

void __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF910] date];
  [v7 timeIntervalSinceDate:v6];
  double v9 = v8;

  if (v9 >= 10.0)
  {
    v10 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v12 = [WeakRetained hearingAidsForUUID:v5];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke_3;
    v13[3] = &unk_2640FE538;
    objc_copyWeak(&v14, v10);
    [v12 enumerateObjectsUsingBlock:v13];
    objc_destroyWeak(&v14);
  }
}

void __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 isConnected] & 1) == 0 && (objc_msgSend(v3, "isPersistent") & 1) == 0)
  {
    HAInitializeLogging();
    int v4 = [NSString stringWithFormat:@"Device stopped advertising. Removing %@", v3];
    id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController clearMissingHearingAids]_block_invoke_3", 193, v4];
    id v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      double v8 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v13 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    double v9 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v9);
    [WeakRetained removeLoadedDevice:v3];

    id v11 = objc_loadWeakRetained(v9);
    [v11 removeAvailableDevice:v3];
  }
}

- (void)searchForAvailableDevices
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_isScanning)
  {
    HAInitializeLogging();
    id v3 = [NSString stringWithFormat:@"Already scanning"];
    id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController searchForAvailableDevices]", 261, v3];
    id v5 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v4;
      id v6 = v5;
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = [v4 UTF8String];
      _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
    double v8 = [(AXHearingAidDeviceController *)self persistentDevices];
    double v9 = [v8 lastObject];

    if (v9)
    {
      v10 = [v9 leftPeripheralUUID];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v13 = [v9 leftPeripheralUUID];
        uint64_t v14 = (void *)[v12 initWithUUIDString:v13];

        if (v14) {
          [v7 addObject:v14];
        }
      }
      v15 = [v9 rightPeripheralUUID];
      uint64_t v16 = [v15 length];

      if (v16)
      {
        id v17 = objc_alloc(MEMORY[0x263F08C38]);
        v18 = [v9 rightPeripheralUUID];
        id v19 = (void *)[v17 initWithUUIDString:v18];

        if (v19) {
          [v7 addObject:v19];
        }
      }
    }
    if (!self->_advertisingTimeoutTimer)
    {
      v20 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x263F21398]);
      advertisingTimeoutTimer = self->_advertisingTimeoutTimer;
      self->_advertisingTimeoutTimer = v20;
    }
    if (!self->_advertisingTimestamps)
    {
      v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      advertisingTimestamps = self->_advertisingTimestamps;
      self->_advertisingTimestamps = v22;
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __57__AXHearingAidDeviceController_searchForAvailableDevices__block_invoke;
    v24[3] = &unk_2640FE058;
    v24[4] = self;
    id v25 = v7;
    id v26 = v9;
    id v4 = v9;
    id v3 = v7;
    [(AXHearingAidDeviceController *)self sendRequestToCentralManager:v24];
  }
  [(AXHearingAidDeviceController *)self loadedDevicesDidChange];
}

void __57__AXHearingAidDeviceController_searchForAvailableDevices__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) retrievePeripheralsWithIdentifiers:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__AXHearingAidDeviceController_searchForAvailableDevices__block_invoke_2;
  v5[3] = &unk_2640FE588;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v8 = v2;
  id v4 = v2;
  [v3 checkPartiallyPairedWithCompletion:v5];
}

uint64_t __57__AXHearingAidDeviceController_searchForAvailableDevices__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) shouldActiveScan]) {
    return [*(id *)(a1 + 32) centralManager:*(void *)(*(void *)(a1 + 32) + 40) didRetrievePeripherals:*(void *)(a1 + 56)];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (![*(id *)(a1 + 48) count]) {
      goto LABEL_14;
    }
LABEL_7:
    if (![*(id *)(a1 + 56) count]) {
      a2 = 1;
    }
    if (v6)
    {
      if (!a2) {
        return [*(id *)(a1 + 32) centralManager:*(void *)(*(void *)(a1 + 32) + 40) didRetrievePeripherals:*(void *)(a1 + 56)];
      }
    }
    else
    {

      if ((a2 & 1) == 0) {
        return [*(id *)(a1 + 32) centralManager:*(void *)(*(void *)(a1 + 32) + 40) didRetrievePeripherals:*(void *)(a1 + 56)];
      }
    }
    goto LABEL_14;
  }
  v2 = +[HUHearingAidSettings sharedInstance];
  id v3 = [v2 pairedHearingAids];
  if (v3 && [*(id *)(a1 + 48) count]) {
    goto LABEL_7;
  }

LABEL_14:
  HAInitializeLogging();
  id v7 = [NSString stringWithFormat:@"Starting scan %@", *(void *)(a1 + 48)];
  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController searchForAvailableDevices]_block_invoke_2", 249, v7];
  double v9 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    uint64_t v11 = v9;
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = [v10 UTF8String];
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  id v12 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v13 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v14 = [MEMORY[0x263EFEF88] UUIDWithString:@"7D74F4BD-C74A-4431-862C-CCE884371592"];
  v15 = objc_msgSend(v13, "arrayWithObjects:", v14, 0);
  uint64_t v16 = NSDictionary;
  id v17 = [NSNumber numberWithBool:1];
  uint64_t v18 = *MEMORY[0x263EFED50];
  id v19 = [NSNumber numberWithBool:1];
  v20 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, v18, v19, *MEMORY[0x263EFEE70], 0);
  [v12 scanForPeripheralsWithServices:v15 options:v20];

  [*(id *)(a1 + 32) clearMissingHearingAids];
  return [*(id *)(a1 + 32) centralManager:*(void *)(*(void *)(a1 + 32) + 40) didRetrievePeripherals:*(void *)(a1 + 56)];
}

- (void)searchForConnectedDevices
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__AXHearingAidDeviceController_searchForConnectedDevices__block_invoke;
  v2[3] = &unk_2640FC960;
  v2[4] = self;
  [(AXHearingAidDeviceController *)self sendRequestToCentralManager:v2];
}

void __57__AXHearingAidDeviceController_searchForConnectedDevices__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [MEMORY[0x263EFEF88] UUIDWithString:@"7D74F4BD-C74A-4431-862C-CCE884371592"];
  id v5 = objc_msgSend(v3, "arrayWithObjects:", v4, 0);
  id v6 = [v2 retrieveConnectedPeripheralsWithServices:v5];

  [*(id *)(a1 + 32) centralManager:*(void *)(*(void *)(a1 + 32) + 40) didRetrieveConnectedPeripherals:v6];
}

- (void)resetConnectionToPeripheral:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  id v5 = [NSString stringWithFormat:@"Resetting connection to %@", v4];
  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController resetConnectionToPeripheral:]", 277, v5];
  id v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    double v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v4) {
    [(AXHearingAidDeviceController *)self disconnectFromPeripheral:v4];
  }
}

- (void)connectToPeripheral:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__AXHearingAidDeviceController_connectToPeripheral___block_invoke;
    v6[3] = &unk_2640FC938;
    id v7 = v4;
    id v8 = self;
    [(AXHearingAidDeviceController *)self sendRequestToCentralManager:v6];
  }
}

void __52__AXHearingAidDeviceController_connectToPeripheral___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v2 = NSString;
  id v3 = +[HUNearbyHearingAidController sharedInstance];
  id v4 = [v3 descriptionForCurrentState];
  id v5 = [v2 stringWithFormat:@"Requesting connection in state %@ to %@", v4, *(void *)(a1 + 32)];

  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 289, v5];
  id v7 = (os_log_t *)MEMORY[0x263F47290];
  id v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v6;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v78 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v11 = [*(id *)(a1 + 40) hearingAidForPeripheral:*(void *)(a1 + 32)];
  if ([v11 isPaired])
  {
    uint64_t v12 = [v11 leftPeripheral];
    uint64_t v13 = *(void **)(a1 + 32);

    if (v12 == v13)
    {
      uint64_t v24 = +[HUHearingAidSettings sharedInstance];
      int v25 = [v24 shouldStreamToLeftAid];

      HAInitializeLogging();
      if (v25)
      {
        id v26 = [NSString stringWithFormat:@"Enabling streaming to LEFT %@", *(void *)(a1 + 32)];
        dispatch_queue_t v27 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 298, v26];
        os_log_t v28 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = v27;
          v30 = v28;
          uint64_t v31 = [v29 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v78 = v31;
          _os_log_impl(&dword_20CC86000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        [*(id *)(a1 + 32) axUntag:@"DisableLEA"];
      }
      else
      {
        v32 = [NSString stringWithFormat:@"Disabling streaming to LEFT %@", *(void *)(a1 + 32)];
        v33 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 303, v32];
        os_log_t v34 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = v33;
          v36 = v34;
          uint64_t v37 = [v35 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v78 = v37;
          _os_log_impl(&dword_20CC86000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        [*(id *)(a1 + 32) axTag:@"DisableLEA"];
      }
      BOOL v38 = compoundAttributeContainsAttribute([v11 earsSupportingWatch], 2);
      HAInitializeLogging();
      if (v38)
      {
        v39 = [NSString stringWithFormat:@"Enabling watch support LEFT %@", *(void *)(a1 + 32)];
        v40 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 310, v39];
        os_log_t v41 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      v42 = [NSString stringWithFormat:@"Disabling watch support LEFT %@", *(void *)(a1 + 32)];
      v43 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 315, v42];
      os_log_t v44 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v14 = [v11 rightPeripheral];
      v15 = *(void **)(a1 + 32);

      if (v14 != v15)
      {
LABEL_32:
        [v11 updateInputTagsAndReset:0];
        goto LABEL_33;
      }
      uint64_t v16 = +[HUHearingAidSettings sharedInstance];
      int v17 = [v16 shouldStreamToRightAid];

      HAInitializeLogging();
      if (v17)
      {
        uint64_t v18 = [NSString stringWithFormat:@"Enabling streaming to RIGHT %@", *(void *)(a1 + 32)];
        id v19 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 324, v18];
        os_log_t v20 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = v19;
          v22 = v20;
          uint64_t v23 = [v21 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v78 = v23;
          _os_log_impl(&dword_20CC86000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        [*(id *)(a1 + 32) axUntag:@"DisableLEA"];
      }
      else
      {
        v45 = [NSString stringWithFormat:@"Disabling streaming to RIGHT %@", *(void *)(a1 + 32)];
        v46 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 329, v45];
        os_log_t v47 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          id v48 = v46;
          v49 = v47;
          uint64_t v50 = [v48 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v78 = v50;
          _os_log_impl(&dword_20CC86000, v49, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        [*(id *)(a1 + 32) axTag:@"DisableLEA"];
      }
      BOOL v51 = compoundAttributeContainsAttribute([v11 earsSupportingWatch], 4);
      HAInitializeLogging();
      if (v51)
      {
        v39 = [NSString stringWithFormat:@"Enabling watch support RIGHT %@", *(void *)(a1 + 32)];
        v40 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 336, v39];
        os_log_t v41 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_27:
          id v52 = v40;
          v53 = v41;
          uint64_t v54 = [v52 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v78 = v54;
          _os_log_impl(&dword_20CC86000, v53, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
LABEL_28:

        [*(id *)(a1 + 32) axTag:@"HearingAidSupportsWatch"];
        goto LABEL_32;
      }
      v42 = [NSString stringWithFormat:@"Disabling watch support RIGHT %@", *(void *)(a1 + 32)];
      v43 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 341, v42];
      os_log_t v44 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        id v55 = v43;
        v56 = v44;
        uint64_t v57 = [v55 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v78 = v57;
        _os_log_impl(&dword_20CC86000, v56, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }

    [*(id *)(a1 + 32) axUntag:@"HearingAidSupportsWatch"];
    goto LABEL_32;
  }
LABEL_33:
  v58 = +[HUNearbyHearingAidController sharedInstance];
  int v59 = [v58 shouldConnect];

  v60 = [*(id *)(a1 + 40) persistentDevices];
  v61 = [v60 firstObject];

  if (v61)
  {
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __52__AXHearingAidDeviceController_connectToPeripheral___block_invoke_74;
    v73[3] = &unk_2640FE5B0;
    id v62 = *(id *)(a1 + 32);
    char v76 = v59;
    uint64_t v63 = *(void *)(a1 + 40);
    id v74 = v62;
    uint64_t v75 = v63;
    [v61 checkPairingStatusWithCompletion:v73];
    v64 = v74;
LABEL_42:

    goto LABEL_43;
  }
  if ([*(id *)(a1 + 32) state] == 2) {
    int v65 = 0;
  }
  else {
    int v65 = v59;
  }
  if (v65 == 1)
  {
    v66 = HCLogHearingHandoff();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v67 = [*(id *)(a1 + 32) state];
      v68 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v78 = v67;
      __int16 v79 = 2112;
      v80 = v68;
      _os_log_impl(&dword_20CC86000, v66, OS_LOG_TYPE_DEFAULT, "BT connectPeripheral state: %ld, %@", buf, 0x16u);
    }
    uint64_t v69 = *(void *)(a1 + 32);
    v70 = *(void **)(*(void *)(a1 + 40) + 40);
    v71 = NSDictionary;
    v64 = [NSNumber numberWithBool:0];
    v72 = [v71 dictionaryWithObject:v64 forKey:*MEMORY[0x263EFEE38]];
    [v70 connectPeripheral:v69 options:v72];

    goto LABEL_42;
  }
LABEL_43:
}

void __52__AXHearingAidDeviceController_connectToPeripheral___block_invoke_74(uint64_t a1, char a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) state] != 2)
  {
    if (*(unsigned char *)(a1 + 48)
      || ([*(id *)(a1 + 40) persistentDevices],
          id v4 = objc_claimAutoreleasedReturnValue(),
          uint64_t v5 = [v4 count],
          v4,
          v5 == 1)
      && (a2 & 1) == 0)
    {
      id v6 = HCLogHearingHandoff();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 32) state];
        id v8 = [*(id *)(a1 + 32) identifier];
        int v15 = 134218242;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "BT connectPeripheral state: %ld, %@", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v10 = a1 + 32;
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(*(void *)(v10 + 8) + 40);
      uint64_t v12 = NSDictionary;
      uint64_t v13 = [NSNumber numberWithBool:0];
      uint64_t v14 = [v12 dictionaryWithObject:v13 forKey:*MEMORY[0x263EFEE38]];
      [v11 connectPeripheral:v9 options:v14];
    }
  }
}

- (void)disconnectFromPeripheral:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    HAInitializeLogging();
    uint64_t v5 = [NSString stringWithFormat:@"disconnectFromPeripheral from %@", v4];
    id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController disconnectFromPeripheral:]", 378, v5];
    uint64_t v7 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      uint64_t v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v14 = [v8 UTF8String];
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__AXHearingAidDeviceController_disconnectFromPeripheral___block_invoke;
    v10[3] = &unk_2640FC938;
    id v11 = v4;
    uint64_t v12 = self;
    [(AXHearingAidDeviceController *)self sendRequestToCentralManager:v10];
  }
}

void __57__AXHearingAidDeviceController_disconnectFromPeripheral___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = HCLogHearingHandoff();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) state];
    id v4 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 134218242;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_20CC86000, v2, OS_LOG_TYPE_DEFAULT, "BT disconnectFromPeripheral: state: %ld, %@", buf, 0x16u);
  }
  uint64_t v6 = a1 + 32;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(*(void *)(v6 + 8) + 40);
  uint64_t v8 = *MEMORY[0x263EFED00];
  v10[0] = *MEMORY[0x263EFED08];
  v10[1] = v8;
  v11[0] = MEMORY[0x263EFFA88];
  v11[1] = MEMORY[0x263EFFA88];
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v7 cancelPeripheralConnection:v5 options:v9];
}

- (void)disconnectFromHearingAidWithDeviceUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [(AXHearingAidDeviceController *)self hearingAidForDeviceID:a3];
  uint64_t v5 = +[HUNearbyHearingAidController sharedInstance];
  char v6 = [v5 shouldDisconnect];

  uint64_t v7 = HCLogHearingHandoff();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) == 0)
  {
    if (v8)
    {
      id v11 = [v4 name];
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "Disconnection is not allowed from %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v9 = [v4 name];
    int v12 = 138412290;
    uint64_t v13 = v9;
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "Disconnection from %@", (uint8_t *)&v12, 0xCu);
  }
  if (v4)
  {
    uint64_t v10 = [v4 leftPeripheral];
    [(AXHearingAidDeviceController *)self disconnectFromPeripheral:v10];

    uint64_t v7 = [v4 rightPeripheral];
    [(AXHearingAidDeviceController *)self disconnectFromPeripheral:v7];
LABEL_8:
  }
}

- (void)cancelPendingConnections
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  bluetoothCentralQueue = self->_bluetoothCentralQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__AXHearingAidDeviceController_cancelPendingConnections__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(bluetoothCentralQueue, block);
  HAInitializeLogging();
  id v4 = [NSString stringWithFormat:@"Cancelling connections"];
  uint64_t v5 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController cancelPendingConnections]", 407, v4];
  char v6 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    BOOL v8 = v6;
    uint64_t v9 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v14 = v9;
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v10 = [(AXHearingAidDeviceController *)self availablePeripherals];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __56__AXHearingAidDeviceController_cancelPendingConnections__block_invoke_82;
  v11[3] = &unk_2640FE5D8;
  v11[4] = self;
  [v10 enumerateObjectsUsingBlock:v11];
}

void __56__AXHearingAidDeviceController_cancelPendingConnections__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) centralRequestBlocks];
  [v1 removeAllObjects];
}

void __56__AXHearingAidDeviceController_cancelPendingConnections__block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 leftPeripheral];
  [v3 disconnectFromPeripheral:v5];

  char v6 = *(void **)(a1 + 32);
  id v7 = [v4 rightPeripheral];

  [v6 disconnectFromPeripheral:v7];
}

- (BOOL)isBluetoothAvailable
{
  return self->_centralIsOn;
}

- (void)stopSearching
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v3 = [NSString stringWithFormat:@"Stopping scan"];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController stopSearching]", 422, v3];
  uint64_t v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(CBCentralManager *)self->_bluetoothManager stopScan];
  self->_isScanning = 0;
  BOOL v8 = [(AXHearingAidDeviceController *)self loadedDevices];
  if ([v8 count]) {
    [v8 enumerateObjectsUsingBlock:&__block_literal_global_87_0];
  }
}

void __45__AXHearingAidDeviceController_stopSearching__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setKeepInSync:", objc_msgSend(v2, "isPaired"));
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (BOOL)shouldRelinquishForPartialConnection
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXHearingAidDeviceController *)self loadedDevices];
  id v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_90];

  if ([v4 count] != 1)
  {
    HAInitializeLogging();
    id v21 = NSString;
    v22 = [(AXHearingAidDeviceController *)self loadedDevices];
    id v6 = [v21 stringWithFormat:@"Wrong number of paired devices %@", v22];

    id v18 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController shouldRelinquishForPartialConnection]", 458, v6];
    uint64_t v23 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v18;
      uint64_t v24 = v23;
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = [v18 UTF8String];
      _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
LABEL_10:
    BOOL v20 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [(AXHearingAidDeviceController *)self loadedDevices];
  id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "firstIndex"));

  HAInitializeLogging();
  id v7 = NSString;
  unsigned int v8 = [v6 leftAvailable];
  unsigned int v9 = [v6 rightAvailable];
  uint64_t v10 = [v6 leftPeripheral];
  BOOL v11 = [v10 state] == 2;
  int v12 = [v6 rightPeripheral];
  uint64_t v13 = [v7 stringWithFormat:@"Should relinquish %d, %d, %d, %d", v8, v9, v11, objc_msgSend(v12, "state") != 2];

  uint64_t v14 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController shouldRelinquishForPartialConnection]", 450, v13];
  uint64_t v15 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v14;
    __int16 v17 = v15;
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = [v16 UTF8String];
    _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (![v6 leftAvailable] || !objc_msgSend(v6, "rightAvailable"))
  {
    BOOL v20 = 0;
    goto LABEL_13;
  }
  id v18 = [v6 leftPeripheral];
  if ([v18 state] != 2) {
    goto LABEL_10;
  }
  uint64_t v19 = [v6 rightPeripheral];
  BOOL v20 = [v19 state] != 2;

LABEL_11:
LABEL_13:

  return v20;
}

uint64_t __68__AXHearingAidDeviceController_shouldRelinquishForPartialConnection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPaired];
}

- (void)checkPartiallyPairedWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v5 = self->_loadedDevices;
  objc_sync_enter(v5);
  id v6 = [(AXHearingAidDeviceController *)self loadedDevices];
  id v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_98];

  if ([v7 count] == 1)
  {
    unsigned int v8 = [(AXHearingAidDeviceController *)self loadedDevices];
    unsigned int v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "firstIndex"));

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __67__AXHearingAidDeviceController_checkPartiallyPairedWithCompletion___block_invoke_2;
    v18[3] = &unk_2640FE640;
    id v10 = v9;
    v22 = &v23;
    id v19 = v10;
    BOOL v20 = self;
    id v21 = v4;
    [v10 checkPairingStatusWithCompletion:v18];
  }
  else
  {
    HAInitializeLogging();
    BOOL v11 = NSString;
    uint64_t v12 = *((unsigned __int8 *)v24 + 24);
    uint64_t v13 = [(AXHearingAidDeviceController *)self loadedDevices];
    uint64_t v14 = [v11 stringWithFormat:@"Partial pair %d = %@", v12, v13];

    uint64_t v15 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController checkPartiallyPairedWithCompletion:]", 491, v14];
    id v16 = (id)*MEMORY[0x263F47290];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v15 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = v17;
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    (*((void (**)(id, void))v4 + 2))(v4, *((unsigned __int8 *)v24 + 24));
  }

  objc_sync_exit(v5);
  _Block_object_dispose(&v23, 8);
}

uint64_t __67__AXHearingAidDeviceController_checkPartiallyPairedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPaired];
}

uint64_t __67__AXHearingAidDeviceController_checkPartiallyPairedWithCompletion___block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = [*(id *)(a1 + 32) leftUUID];
  if ([v6 length])
  {
    id v7 = [*(id *)(a1 + 32) rightUUID];
    BOOL v8 = [v7 length] == 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  if ([*(id *)(a1 + 32) leftAvailable]) {
    int v9 = 0;
  }
  else {
    int v9 = [*(id *)(a1 + 32) rightAvailable] ^ 1;
  }
  int v10 = [*(id *)(a1 + 32) leftAvailable];
  if (((a2 & ~(v10 ^ [*(id *)(a1 + 32) rightAvailable] | a3) | v9 | v8) & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  HAInitializeLogging();
  BOOL v11 = NSString;
  uint64_t v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v13 = [*(id *)(a1 + 40) loadedDevices];
  uint64_t v14 = [v11 stringWithFormat:@"Partial pair %d = %@", v12, v13];

  uint64_t v15 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController checkPartiallyPairedWithCompletion:]_block_invoke_2", 485, v14];
  id v16 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v15;
    id v18 = v16;
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = [v17 UTF8String];
    _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)isPartiallyConnected
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = self->_loadedDevices;
  objc_sync_enter(v3);
  id v4 = [(AXHearingAidDeviceController *)self loadedDevices];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__AXHearingAidDeviceController_isPartiallyConnected__block_invoke;
  v6[3] = &unk_2640FE668;
  void v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  objc_sync_exit(v3);
  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __52__AXHearingAidDeviceController_isPartiallyConnected__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 hasConnection]
    && ([v6 isConnected] & 1) == 0
    && [v6 isPaired])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isPaired
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = self->_loadedDevices;
  objc_sync_enter(v3);
  id v4 = [(AXHearingAidDeviceController *)self loadedDevices];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__AXHearingAidDeviceController_isPaired__block_invoke;
  v6[3] = &unk_2640FE668;
  void v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  objc_sync_exit(v3);
  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __40__AXHearingAidDeviceController_isPaired__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isPaired]
    && (([v6 leftAvailable] & 1) != 0 || objc_msgSend(v6, "rightAvailable")))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isConnected
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = self->_loadedDevices;
  objc_sync_enter(v3);
  id v4 = [(AXHearingAidDeviceController *)self loadedDevices];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__AXHearingAidDeviceController_isConnected__block_invoke;
  v6[3] = &unk_2640FE668;
  void v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  objc_sync_exit(v3);
  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __43__AXHearingAidDeviceController_isConnected__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if ([v6 hasConnection] && objc_msgSend(v6, "isPaired"))
  {
    HAInitializeLogging();
    uint64_t v7 = [NSString stringWithFormat:@"Found connected device %@", v6];
    BOOL v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController isConnected]_block_invoke", 541, v7];
    uint64_t v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      BOOL v11 = v9;
      *(_DWORD *)buf = 136446210;
      uint64_t v13 = [v10 UTF8String];
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isConnecting
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = self->_loadedDevices;
  objc_sync_enter(v3);
  id v4 = [(AXHearingAidDeviceController *)self loadedDevices];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__AXHearingAidDeviceController_isConnecting__block_invoke;
  v6[3] = &unk_2640FE668;
  void v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  objc_sync_exit(v3);
  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __44__AXHearingAidDeviceController_isConnecting__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if ([v6 isAnyPeripheralInConnectingState] && objc_msgSend(v6, "isPaired"))
  {
    HAInitializeLogging();
    uint64_t v7 = [NSString stringWithFormat:@"Found connecting device %@", v6];
    BOOL v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController isConnecting]_block_invoke", 560, v7];
    uint64_t v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      BOOL v11 = v9;
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = [v10 UTF8String];
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  uint64_t v12 = HCLogHearingHandoff();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __44__AXHearingAidDeviceController_isConnecting__block_invoke_cold_2(v6);
  }

  uint64_t v13 = HCLogHearingHandoff();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __44__AXHearingAidDeviceController_isConnecting__block_invoke_cold_1(v6);
  }
}

- (id)hearingAidsForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__5;
  id v18 = __Block_byref_object_dispose__5;
  id v19 = [MEMORY[0x263EFF980] array];
  if (v4 && [v4 length])
  {
    availablePeripherals = self->_availablePeripherals;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __51__AXHearingAidDeviceController_hearingAidsForUUID___block_invoke;
    BOOL v11 = &unk_2640FE690;
    id v12 = v4;
    uint64_t v13 = &v14;
    [(NSMutableArray *)availablePeripherals enumerateObjectsUsingBlock:&v8];
  }
  id v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v15[5], v8, v9, v10, v11);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __51__AXHearingAidDeviceController_hearingAidsForUUID___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v5 = [v11 leftUUID];
  id v6 = v11;
  if (v5)
  {
    id v2 = [v11 leftUUID];
    if ([v2 isEqual:*(void *)(a1 + 32)])
    {

      goto LABEL_13;
    }
    id v6 = v11;
  }
  uint64_t v7 = [v6 rightUUID];
  if (v7
    && ([v11 rightUUID],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        ([v3 isEqual:*(void *)(a1 + 32)] & 1) != 0))
  {
    int v8 = 1;
  }
  else
  {
    uint64_t v9 = [v11 deviceUUID];
    int v8 = [v9 isEqualToString:*(void *)(a1 + 32)];

    if (!v7) {
      goto LABEL_11;
    }
  }

LABEL_11:
  if (v5)
  {

    id v10 = v11;
    if ((v8 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v10 = v11;
  if (v8)
  {
LABEL_13:
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
    id v10 = v11;
  }
LABEL_14:
}

- (id)pairedHearingDevice
{
  uint64_t v3 = +[AXHAController sharedController];
  id v4 = [v3 pairedDeviceUUID];
  uint64_t v5 = [(AXHearingAidDeviceController *)self hearingAidForDeviceID:v4];

  return v5;
}

- (id)hearingAidForPeripheral:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  if (v4)
  {
    id v6 = [v4 identifier];

    if (v6)
    {
      uint64_t v7 = [v5 identifier];
      int v8 = [v7 UUIDString];
    }
    else
    {
      int v8 = 0;
    }
    id v10 = self->_availablePeripherals;
    objc_sync_enter(v10);
    availablePeripherals = self->_availablePeripherals;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __56__AXHearingAidDeviceController_hearingAidForPeripheral___block_invoke;
    v15[3] = &unk_2640FE6B8;
    id v12 = v8;
    id v16 = v12;
    id v17 = v5;
    id v18 = &v19;
    [(NSMutableArray *)availablePeripherals enumerateObjectsUsingBlock:v15];

    objc_sync_exit(v10);
    uint64_t v9 = (void *)v20[5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v13 = v9;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __56__AXHearingAidDeviceController_hearingAidForPeripheral___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if (([v11 containsPeripheralWithUUID:a1[4]] & 1) == 0)
  {
    uint64_t v7 = [v11 leftPeripheral];
    int v8 = v7;
    if (v7 == (void *)a1[5])
    {
    }
    else
    {
      uint64_t v9 = [v11 rightPeripheral];
      id v10 = (void *)a1[5];

      if (v9 != v10) {
        goto LABEL_7;
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  *a4 = 1;
LABEL_7:
}

- (id)hearingAidForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__5;
  id v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  uint64_t v5 = self->_availablePeripherals;
  objc_sync_enter(v5);
  availablePeripherals = self->_availablePeripherals;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __54__AXHearingAidDeviceController_hearingAidForDeviceID___block_invoke;
  v10[3] = &unk_2640FE690;
  id v7 = v4;
  id v11 = v7;
  id v12 = &v13;
  [(NSMutableArray *)availablePeripherals enumerateObjectsUsingBlock:v10];

  objc_sync_exit(v5);
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __54__AXHearingAidDeviceController_hearingAidForDeviceID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 deviceUUID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)hearingAidsForPeripheral:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  if (v4)
  {
    id v6 = [v4 identifier];

    if (v6)
    {
      id v7 = [v4 identifier];
      int v8 = [v7 UUIDString];
    }
    else
    {
      int v8 = 0;
    }
    id v9 = self->_availablePeripherals;
    objc_sync_enter(v9);
    availablePeripherals = self->_availablePeripherals;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__AXHearingAidDeviceController_hearingAidsForPeripheral___block_invoke;
    v13[3] = &unk_2640FDB28;
    id v11 = v8;
    id v14 = v11;
    id v15 = v4;
    id v16 = v5;
    [(NSMutableArray *)availablePeripherals enumerateObjectsUsingBlock:v13];

    objc_sync_exit(v9);
  }

  return v5;
}

void __57__AXHearingAidDeviceController_hearingAidsForPeripheral___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 containsPeripheralWithUUID:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v3 = [v7 leftPeripheral];
    id v4 = v3;
    if (v3 == *(void **)(a1 + 40))
    {
    }
    else
    {
      uint64_t v5 = [v7 rightPeripheral];
      id v6 = *(void **)(a1 + 40);

      if (v5 != v6) {
        goto LABEL_7;
      }
    }
  }
  [*(id *)(a1 + 48) addObject:v7];
LABEL_7:
}

- (void)loadedDevicesDidChange
{
  if (([(AXDispatchTimer *)self->_availableDeviceTimer isActive] & 1) == 0)
  {
    objc_initWeak(&location, self);
    availableDeviceTimer = self->_availableDeviceTimer;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __54__AXHearingAidDeviceController_loadedDevicesDidChange__block_invoke;
    v4[3] = &unk_2640FD1D0;
    v4[4] = self;
    objc_copyWeak(&v5, &location);
    [(AXDispatchTimer *)availableDeviceTimer afterDelay:v4 processBlock:0 cancelBlock:0.2];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __54__AXHearingAidDeviceController_loadedDevicesDidChange__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) copy];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained availableSearchBlocks];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AXHearingAidDeviceController_loadedDevicesDidChange__block_invoke_2;
  v6[3] = &unk_2640FE6E0;
  id v7 = v2;
  id v5 = v2;
  [v4 enumerateObjectsUsingBlock:v6];
}

uint64_t __54__AXHearingAidDeviceController_loadedDevicesDidChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)addLoadedDevice:(id)a3
{
  id v5 = a3;
  id v4 = self->_loadedDevices;
  objc_sync_enter(v4);
  if (v5 && ([(NSMutableArray *)self->_loadedDevices containsObject:v5] & 1) == 0)
  {
    [(NSMutableArray *)self->_loadedDevices addObject:v5];
    [(AXHearingAidDeviceController *)self loadedDevicesDidChange];
  }
  objc_sync_exit(v4);
}

- (void)removeLoadedDevice:(id)a3
{
  id v5 = a3;
  id v4 = self->_loadedDevices;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_loadedDevices removeObject:v5];
  [(AXHearingAidDeviceController *)self loadedDevicesDidChange];
  objc_sync_exit(v4);
}

- (void)clearLoadedDevices
{
  obj = self->_loadedDevices;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_loadedDevices removeAllObjects];
  [(AXHearingAidDeviceController *)self loadedDevicesDidChange];
  objc_sync_exit(obj);
}

- (void)addAvailableDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_availablePeripherals;
    objc_sync_enter(v5);
    if (([(NSMutableArray *)self->_availablePeripherals containsObject:v6] & 1) == 0) {
      [(NSMutableArray *)self->_availablePeripherals addObject:v6];
    }
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeAvailableDevice:(id)a3
{
  id v5 = a3;
  id v4 = self->_availablePeripherals;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_availablePeripherals removeObject:v5];
  objc_sync_exit(v4);
}

- (void)clearAvailableDevices
{
  obj = self->_availablePeripherals;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_availablePeripherals removeAllObjects];
  objc_sync_exit(obj);
}

- (void)addConnectedDevice:(id)a3
{
  id v5 = a3;
  id v4 = self->_connectedDevices;
  objc_sync_enter(v4);
  if (v5 && ([(NSMutableArray *)self->_connectedDevices containsObject:v5] & 1) == 0) {
    [(NSMutableArray *)self->_connectedDevices addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)removeConnectedDevice:(id)a3
{
  id v5 = a3;
  id v4 = self->_connectedDevices;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_connectedDevices removeObject:v5];
  objc_sync_exit(v4);
}

- (void)clearConnectedDevices
{
  obj = self->_connectedDevices;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_connectedDevices removeAllObjects];
  objc_sync_exit(obj);
}

- (void)replaceDevice:(id)a3 withDevice:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  HAInitializeLogging();
  int v8 = [NSString stringWithFormat:@"Replacing %@ with %@", v6, v7];
  id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController replaceDevice:withDevice:]", 778, v8];
  id v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(AXHearingAidDeviceController *)self removeLoadedDevice:v6];
  [(AXHearingAidDeviceController *)self removeAvailableDevice:v6];
  [(AXHearingAidDeviceController *)self removeConnectedDevice:v6];
  if ([v7 isConnected]) {
    [(AXHearingAidDeviceController *)self addConnectedDevice:v7];
  }
  if ([v6 isPaired])
  {
    uint64_t v13 = +[HUHearingAidSettings sharedInstance];
    char v14 = [v13 isiCloudPaired];

    if ((v14 & 1) == 0)
    {
      id v15 = [(AXHearingAidDeviceController *)self persistentDevices];
      [v15 removeAllObjects];

      id v16 = +[HUHearingAidSettings sharedInstance];
      id v17 = [v7 persistentRepresentation];
      [v16 setPairedHearingAids:v17];

      id v18 = +[AXHAController sharedController];
      uint64_t v19 = [v7 deviceUUID];
      [v18 setPairedHearingAidID:v19];
    }
  }
  [(HUDeviceController *)self device:v7 didUpdateProperty:69206024];
}

- (void)mergeDevice:(id)a3 withDevice:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  HAInitializeLogging();
  int v8 = [NSString stringWithFormat:@"Device %@ did merge with: %@", v6, v7];
  id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController mergeDevice:withDevice:]", 801, v8];
  id v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v28 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v6 && v7)
  {
    id v13 = v7;
    id v14 = v6;
    id v15 = v13;
    id v16 = v14;
    if ([v14 leftAvailable])
    {

      id v16 = v13;
      id v15 = v14;
    }
    uint64_t v17 = objc_opt_class();
    if (v17 == objc_opt_class())
    {
      uint64_t v18 = [objc_alloc((Class)objc_opt_class()) initWithLeftDevice:v15 andRightDevice:v16];
      if (v18)
      {
        uint64_t v19 = (void *)v18;
        [(AXHearingAidDeviceController *)self addLoadedDevice:v18];
        [(AXHearingAidDeviceController *)self addAvailableDevice:v19];
        if ([v19 isConnected]) {
          [(AXHearingAidDeviceController *)self addConnectedDevice:v19];
        }
        if ([v19 isPaired])
        {
          BOOL v20 = +[HUHearingAidSettings sharedInstance];
          char v21 = [v20 isiCloudPaired];

          if ((v21 & 1) == 0)
          {
            uint64_t v22 = [(AXHearingAidDeviceController *)self persistentDevices];
            [v22 removeAllObjects];

            uint64_t v23 = +[HUHearingAidSettings sharedInstance];
            id v24 = [v19 persistentRepresentation];
            [v23 setPairedHearingAids:v24];

            uint64_t v25 = +[AXHAController sharedController];
            char v26 = [v19 deviceUUID];
            [v25 setPairedHearingAidID:v26];
          }
        }
        [(AXHearingAidDeviceController *)self removeAvailableDevice:v14];
        [(AXHearingAidDeviceController *)self removeConnectedDevice:v14];
        [(AXHearingAidDeviceController *)self removeLoadedDevice:v14];
        [(AXHearingAidDeviceController *)self removeAvailableDevice:v13];
        [(AXHearingAidDeviceController *)self removeConnectedDevice:v13];
        [(AXHearingAidDeviceController *)self removeLoadedDevice:v13];
        [(HUDeviceController *)self device:v19 didUpdateProperty:69206024];
      }
    }
  }
}

- (void)deviceDidFinishLoading:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(AXHearingAidDeviceController *)self addAvailableDevice:v4];
    [(AXHearingAidDeviceController *)self addLoadedDevice:v4];
    id v5 = [v4 leftPeripheral];
    id v6 = [v4 deviceUUID];
    [v5 tag:v6];

    id v7 = [v4 leftPeripheral];
    [v7 tag:@"Left HA"];

    int v8 = [v4 rightPeripheral];
    id v9 = [v4 deviceUUID];
    [v8 tag:v9];

    id v10 = [v4 rightPeripheral];
    [v10 tag:@"Right HA"];

    if (([v4 isPaired] & 1) == 0) {
      [v4 disconnectAndUnpair:0];
    }
  }
  HAInitializeLogging();
  id v11 = [NSString stringWithFormat:@"Device finished loading %@", v4];
  id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController deviceDidFinishLoading:]", 865, v11];
  id v13 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v12;
    id v15 = v13;
    *(_DWORD *)buf = 136446210;
    uint64_t v17 = [v14 UTF8String];
    _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([v4 keepInSync] && objc_msgSend(v4, "isConnected")) {
    [v4 loadRequiredProperties];
  }
}

- (void)forgetDevice:(id)a3
{
  if (a3)
  {
    id v4 = [a3 deviceUUID];
    id v6 = [(AXHearingAidDeviceController *)self hearingAidForDeviceID:v4];

    [(AXHearingAidDeviceController *)self removeLoadedDevice:v6];
    [(AXHearingAidDeviceController *)self removeAvailableDevice:v6];
    [(AXHearingAidDeviceController *)self removeConnectedDevice:v6];
    id v5 = [(AXHearingAidDeviceController *)self persistentDevices];
    [v5 removeObject:v6];
  }
}

- (void)sendRequestToCentralManager:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (self->_centralIsOn)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    HAInitializeLogging();
    id v6 = [NSString stringWithFormat:@"BT not available. Caching [%ld, %d]", -[CBCentralManager state](self->_bluetoothManager, "state"), self->_centralIsOn];
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController sendRequestToCentralManager:]", 895, v6];
    int v8 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      id v10 = v8;
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = [v9 UTF8String];
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__AXHearingAidDeviceController_sendRequestToCentralManager___block_invoke;
    block[3] = &unk_2640FCD88;
    void block[4] = self;
    id v13 = v5;
    dispatch_async(bluetoothCentralQueue, block);
  }
}

void __60__AXHearingAidDeviceController_sendRequestToCentralManager___block_invoke(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 40) copy];
  id v2 = [*(id *)(a1 + 32) centralRequestBlocks];
  uint64_t v3 = (void *)MEMORY[0x2105575F0](v4);
  [v2 addObject:v3];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Central state (%ld) %d = %d", objc_msgSend(v4, "state"), -[AXHearingAidDeviceController isBluetoothAvailable](self, "isBluetoothAvailable"), self->_centralIsOn);
  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManagerDidUpdateState:]", 909, v5];
  id v7 = (os_log_t *)MEMORY[0x263F47290];
  int v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v6;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([v4 state] == 5)
  {
    self->_centralIsOn = 1;
    HAInitializeLogging();
    id v11 = [NSString stringWithFormat:@"centralManager ON"];
    id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManagerDidUpdateState:]", 914, v11];
    os_log_t v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v12;
      uint64_t v15 = v13;
      uint64_t v16 = [v14 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v29 = v16;
      _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(AXHearingAidDeviceController *)self pairedHearingAidsDidChange];
    uint64_t v17 = [(AXHearingAidDeviceController *)self persistentDevices];
    uint64_t v18 = [v17 firstObject];
    [v18 connect];

    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__AXHearingAidDeviceController_centralManagerDidUpdateState___block_invoke;
    block[3] = &unk_2640FC960;
    void block[4] = self;
    dispatch_async(bluetoothCentralQueue, block);
  }
  else
  {
    self->_centralIsOn = 0;
    HAInitializeLogging();
    BOOL v20 = [NSString stringWithFormat:@"centralManager OFF"];
    char v21 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManagerDidUpdateState:]", 934, v20];
    os_log_t v22 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v21;
      id v24 = v22;
      uint64_t v25 = [v23 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v29 = v25;
      _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (self->_isScanning)
    {
      self->_isScanning = 0;
      [(AXHearingAidDeviceController *)self searchForAvailableDevices];
    }
    [(AXHearingAidDeviceController *)self clearAvailableDevices];
    [(AXHearingAidDeviceController *)self clearConnectedDevices];
    [(AXHearingAidDeviceController *)self clearLoadedDevices];
    [(AXHearingAidDeviceController *)self pairedHearingAidsDidChange];
  }
  char v26 = +[HUNearbyHearingAidController sharedInstance];
  [v26 sendConnectionUpdateToPeers];
}

void __61__AXHearingAidDeviceController_centralManagerDidUpdateState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) centralRequestBlocks];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_136];

  id v3 = [*(id *)(a1 + 32) centralRequestBlocks];
  [v3 removeAllObjects];
}

void __61__AXHearingAidDeviceController_centralManagerDidUpdateState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = (void (**)(void))MEMORY[0x2105575F0](a2);
  v2[2]();
}

- (void)centralManager:(id)a3 didRetrievePeripherals:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  HAInitializeLogging();
  id v6 = NSString;
  id v7 = [(AXHearingAidDeviceController *)self persistentDevices];
  int v8 = [v6 stringWithFormat:@"%@ - %@", v5, v7];

  id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didRetrievePeripherals:]", 956, v8];
  id v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  os_log_t v13 = HCLogHearingHandoff();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "CentralManager didRetrievePeripherals", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke;
  v14[3] = &unk_2640FD858;
  v14[4] = self;
  [v5 enumerateObjectsUsingBlock:v14];
}

void __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) persistentDevices];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) persistentDevices];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke_3;
    v25[3] = &unk_2640FE750;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v26 = v7;
    uint64_t v27 = v8;
    [v6 enumerateObjectsUsingBlock:v25];

    [*(id *)(a1 + 32) loadedDevicesDidChange];
    id v9 = v26;
  }
  else
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__5;
    v36 = __Block_byref_object_dispose__5;
    uint64_t v37 = 0;
    id v10 = +[HUHearingAidSettings sharedInstance];
    id v11 = [v10 pairedHearingAids];

    id v12 = [v11 objectForKey:@"ax_hearing_device_left_peripheral_key"];
    os_log_t v13 = [v11 objectForKey:@"ax_hearing_device_right_peripheral_key"];
    id v14 = [MEMORY[0x263EFF980] array];
    if (v12)
    {
      uint64_t v15 = [v12 objectForKey:@"ax_hearing_device_uuid_key"];

      if (v15)
      {
        uint64_t v16 = [v12 objectForKey:@"ax_hearing_device_uuid_key"];
        [v14 addObject:v16];
      }
    }
    if (v13)
    {
      uint64_t v17 = [v13 objectForKey:@"ax_hearing_device_uuid_key"];

      if (v17)
      {
        uint64_t v18 = [v13 objectForKey:@"ax_hearing_device_uuid_key"];
        [v14 addObject:v18];
      }
    }
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke_2;
    v28[3] = &unk_2640FE728;
    id v19 = v3;
    id v29 = v19;
    id v20 = v11;
    id v30 = v20;
    uint64_t v31 = &v32;
    [v14 enumerateObjectsUsingBlock:v28];
    char v21 = (void *)v33[5];
    if (v21)
    {
      [v21 setIsPaired:1];
      [*(id *)(a1 + 32) connectToPeripheral:v19];
      [*(id *)(a1 + 32) addAvailableDevice:v33[5]];
      os_log_t v22 = [*(id *)(a1 + 32) persistentDevices];
      uint64_t v23 = [v22 indexOfObject:v33[5]];

      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v24 = [*(id *)(a1 + 32) persistentDevices];
        [v24 addObject:v33[5]];
      }
    }

    _Block_object_dispose(&v32, 8);
    id v9 = v37;
  }
}

void __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 identifier];
  id v6 = [v5 UUIDString];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    if (a1[5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)(*(void *)(a1[6] + 8) + 40) = [[AXHearingAidDevice alloc] initWithPeripheral:a1[4]];
        MEMORY[0x270F9A758]();
      }
    }
  }
}

uint64_t __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 addPeripheral:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 40) addLoadedDevice:v10];
    [*(id *)(a1 + 40) addAvailableDevice:v10];
    [v10 setIsPersistent:1];
    [v10 setIsPaired:1];
    [*(id *)(a1 + 40) connectToPeripheral:*(void *)(a1 + 32)];
    id v6 = [*(id *)(a1 + 40) persistentDevices];
    uint64_t v7 = [v6 indexOfObject:v10];

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [*(id *)(a1 + 40) persistentDevices];
      [v8 addObject:v10];
    }
    *a4 = 1;
  }

  return MEMORY[0x270F9A758]();
}

- (void)centralManager:(id)a3 didRetrieveConnectedPeripherals:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  HAInitializeLogging();
  id v6 = [NSString stringWithFormat:@"%@", v5];
  uint64_t v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didRetrieveConnectedPeripherals:]", 1024, v6];
  uint64_t v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __79__AXHearingAidDeviceController_centralManager_didRetrieveConnectedPeripherals___block_invoke;
  v11[3] = &unk_2640FD858;
  v11[4] = self;
  [v5 enumerateObjectsUsingBlock:v11];
}

void __79__AXHearingAidDeviceController_centralManager_didRetrieveConnectedPeripherals___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 hearingAidForPeripheral:v4];
  [*(id *)(a1 + 32) addAvailableDevice:v5];
  if ([v5 didLoadBasicProperties]) {
    [*(id *)(a1 + 32) addLoadedDevice:v5];
  }
  id v6 = HCLogHearingHandoff();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "CentralManager didRetrieveConnectedPeripherals, Connect", v7, 2u);
  }

  [*(id *)(a1 + 32) connectToPeripheral:v4];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v10 = a4;
  id v11 = a5;
  id v42 = a6;
  id v12 = [(AXHearingAidDeviceController *)self hearingAidForPeripheral:v10];
  HAInitializeLogging();
  uint64_t v13 = NSString;
  uint64_t v14 = *MEMORY[0x263EFECD8];
  uint64_t v15 = [v11 objectForKey:*MEMORY[0x263EFECD8]];
  uint64_t v16 = [v13 stringWithFormat:@"%@ - %@ - %@ - %@", v10, v11, v12, v15];

  uint64_t v17 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", 1042, v16];
  uint64_t v18 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v17;
    id v20 = v18;
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = [v19 UTF8String];
    _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  if (v12)
  {
    [v12 updateNameWithAdvertisingData:v11];
    [(AXHearingAidDeviceController *)self addAvailableDevice:v12];
    char v21 = [v12 deviceUUID];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      advertisingTimestamps = self->_advertisingTimestamps;
      id v24 = [MEMORY[0x263EFF910] date];
      uint64_t v25 = [v12 deviceUUID];
      [(NSMutableDictionary *)advertisingTimestamps setObject:v24 forKey:v25];
    }
    if (([v12 didLoadBasicProperties] & 1) != 0 || objc_msgSend(v12, "isPersistent")) {
      [(AXHearingAidDeviceController *)self addLoadedDevice:v12];
    }
    HAInitializeLogging();
    id v26 = NSString;
    if ([v12 isConnected])
    {
      uint64_t v27 = 0;
    }
    else if (([v12 isPaired] & 1) != 0 || !objc_msgSend(v12, "didLoadBasicProperties"))
    {
      uint64_t v27 = 1;
    }
    else
    {
      uint64_t v27 = [v12 isConnecting];
    }
    uint64_t v32 = [v26 stringWithFormat:@"Connecting %d = [%d, %d, %d, %d]", v27, objc_msgSend(v12, "isConnected") ^ 1, objc_msgSend(v12, "isPaired"), objc_msgSend(v12, "didLoadBasicProperties") ^ 1, objc_msgSend(v12, "isConnecting")];
    v33 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", 1077, v32];
    uint64_t v34 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v35 = v33;
      v36 = v34;
      uint64_t v37 = [v35 UTF8String];
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_20CC86000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    if (([v12 isConnected] & 1) == 0
      && (([v12 isPaired] & 1) != 0
       || ![v12 didLoadBasicProperties]
       || [v12 isConnecting]))
    {
      [v12 addPeripheral:v10];
      BOOL v38 = HCLogHearingHandoff();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_20CC86000, v38, OS_LOG_TYPE_DEFAULT, "CentralManager didDiscoverPeripheral, Connect", (uint8_t *)&buf, 2u);
      }

      v39 = [v12 leftPeripheral];
      [(AXHearingAidDeviceController *)self connectToPeripheral:v39];

      v40 = [v12 rightPeripheral];
      [(AXHearingAidDeviceController *)self connectToPeripheral:v40];
    }
    if ([v12 isConnected]) {
      [(AXHearingAidDeviceController *)self addConnectedDevice:v12];
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__5;
    uint64_t v50 = __Block_byref_object_dispose__5;
    id v51 = 0;
    uint64_t v28 = [v11 objectForKey:v14];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __92__AXHearingAidDeviceController_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke;
    v44[3] = &unk_2640FE778;
    p_long long buf = &buf;
    id v29 = v10;
    id v45 = v29;
    [v28 enumerateObjectsUsingBlock:v44];

    id v30 = *(void **)(*((void *)&buf + 1) + 40);
    if (v30)
    {
      [v30 updateNameWithAdvertisingData:v11];
      uint64_t v31 = HCLogHearingHandoff();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_20CC86000, v31, OS_LOG_TYPE_DEFAULT, "CentralManager didDiscoverPeripheral, Connect", v43, 2u);
      }

      [(AXHearingAidDeviceController *)self connectToPeripheral:v29];
      [(AXHearingAidDeviceController *)self addAvailableDevice:*(void *)(*((void *)&buf + 1) + 40)];
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __92__AXHearingAidDeviceController_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)MEMORY[0x263EFEF88];
  id v7 = a2;
  uint64_t v8 = [v6 UUIDWithString:@"7D74F4BD-C74A-4431-862C-CCE884371592"];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = [[AXHearingAidDevice alloc] initWithPeripheral:*(void *)(a1 + 32)];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v6 = a4;
  id v7 = HCLogHearingHandoff();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 state];
    int v9 = [v6 identifier];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v53 = v8;
    __int16 v54 = 2112;
    id v55 = v9;
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "CentralManager didConnectPeripheral state: %ld %@", buf, 0x16u);
  }
  id v10 = [(AXHearingAidDeviceController *)self hearingAidsForPeripheral:v6];
  HAInitializeLogging();
  uint64_t v11 = [NSString stringWithFormat:@"%@ in %@", v6, v10];
  id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didConnectPeripheral:]", 1097, v11];
  uint64_t v13 = (os_log_t *)MEMORY[0x263F47290];
  uint64_t v14 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v12;
    uint64_t v16 = v14;
    uint64_t v17 = [v15 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v53 = v17;
    _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([v10 count])
  {
    if ([v10 count] == 1)
    {
      uint64_t v18 = [v10 firstObject];
    }
    else
    {
      uint64_t v25 = [v10 indexesOfObjectsPassingTest:&__block_literal_global_169];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __68__AXHearingAidDeviceController_centralManager_didConnectPeripheral___block_invoke_2;
      v49[3] = &unk_2640FE5D8;
      v49[4] = self;
      [v10 enumerateObjectsAtIndexes:v25 options:0 usingBlock:v49];
      uint64_t v26 = [v10 count];
      if (v26 - [v25 count] == 1)
      {
        uint64_t v18 = [(AXHearingAidDeviceController *)self hearingAidForPeripheral:v6];
      }
      else
      {
        HAInitializeLogging();
        uint64_t v27 = NSString;
        uint64_t v28 = [(AXHearingAidDeviceController *)self hearingAidsForPeripheral:v6];
        id v29 = [v27 stringWithFormat:@"More than one valid hearing device %@", v28];

        id v30 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didConnectPeripheral:]", 1123, v29];
        os_log_t v31 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = v30;
          v33 = v31;
          uint64_t v34 = [v32 UTF8String];
          *(_DWORD *)long long buf = 136446210;
          uint64_t v53 = v34;
          _os_log_impl(&dword_20CC86000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        uint64_t v18 = 0;
      }
    }
    [v18 addPeripheral:v6];
    [(AXHearingAidDeviceController *)self addConnectedDevice:v18];
  }
  else
  {
    HAInitializeLogging();
    id v19 = [NSString stringWithFormat:@"No device for peripheral %@", v6];
    id v20 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didConnectPeripheral:]", 1132, v19];
    os_log_t v21 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v20;
      uint64_t v23 = v21;
      uint64_t v24 = [v22 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v53 = v24;
      _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(AXHearingAidDeviceController *)self disconnectFromPeripheral:v6];
    uint64_t v18 = 0;
  }
  [v6 axTag:@"IsHearingAid"];
  [v18 connectionDidChange];
  if ([v18 isPaired])
  {
    id v35 = +[HUNearbyHearingAidController sharedInstance];
    [v35 sendConnectionUpdateToPeers];

    v36 = self->_availablePeripherals;
    objc_sync_enter(v36);
    availablePeripherals = self->_availablePeripherals;
    id v51 = v18;
    BOOL v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
    [(NSMutableArray *)availablePeripherals setArray:v38];

    objc_sync_exit(v36);
    loadedDevices = self->_loadedDevices;
    uint64_t v50 = v18;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
    [(NSMutableArray *)loadedDevices setArray:v40];

    id v41 = [(AXHearingAidDeviceController *)self persistentDevices];
    LODWORD(v40) = [v41 indexOfObject:v18] == 0x7FFFFFFFFFFFFFFFLL;

    if (v40)
    {
      id v42 = [(AXHearingAidDeviceController *)self persistentDevices];
      [v42 addObject:v18];
    }
    [(AXHearingAidDeviceController *)self loadedDevicesDidChange];
  }
  if ([v18 didLoadBasicProperties]) {
    [(AXHearingAidDeviceController *)self deviceDidFinishLoading:v18];
  }
  v43 = (void *)MEMORY[0x263EFF8C0];
  os_log_t v44 = [MEMORY[0x263EFEF88] UUIDWithString:@"7D74F4BD-C74A-4431-862C-CCE884371592"];
  id v45 = [MEMORY[0x263EFEF88] UUIDWithString:@"180a"];
  v46 = [MEMORY[0x263EFEF88] UUIDWithString:@"8341F2B4-C013-4F04-8197-C4CDB42E26DC"];
  os_log_t v47 = objc_msgSend(v43, "arrayWithObjects:", v44, v45, v46, 0);
  [v6 discoverServices:v47];
}

BOOL __68__AXHearingAidDeviceController_centralManager_didConnectPeripheral___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 didLoadPersistentProperties])
  {
    id v3 = [v2 leftPeripheral];
    if (v3)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v5 = [v2 rightPeripheral];
      BOOL v4 = v5 == 0;
    }
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

uint64_t __68__AXHearingAidDeviceController_centralManager_didConnectPeripheral___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeAvailableDevice:a2];
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  HAInitializeLogging();
  uint64_t v11 = [NSString stringWithFormat:@"%@ - %@", v9, v10];
  id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didFailToConnectPeripheral:error:]", 1168, v11];
  uint64_t v13 = (os_log_t *)MEMORY[0x263F47290];
  uint64_t v14 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13;
    id v16 = v10;
    id v17 = v9;
    uint64_t v18 = self;
    id v19 = v8;
    id v20 = v12;
    os_log_t v21 = v14;
    id v22 = v20;
    id v8 = v19;
    self = v18;
    id v9 = v17;
    id v10 = v16;
    uint64_t v13 = v15;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v54 = [v22 UTF8String];
    _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  unint64_t v23 = [v10 code];
  if (v23 <= 0x10)
  {
    if (((1 << v23) & 0x8EF9) != 0)
    {
      HAInitializeLogging();
      uint64_t v24 = [NSString stringWithFormat:@"Non fatal error. Attempting reconnect"];
      uint64_t v25 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didFailToConnectPeripheral:error:]", 1183, v24];
      os_log_t v26 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = v8;
        id v28 = v25;
        id v29 = v26;
        id v30 = v28;
        id v8 = v27;
        uint64_t v31 = [v30 UTF8String];
        *(_DWORD *)long long buf = 136446210;
        uint64_t v54 = v31;
        _os_log_impl(&dword_20CC86000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      id v32 = HCLogHearingHandoff();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v9 identifier];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v54 = (uint64_t)v33;
        _os_log_impl(&dword_20CC86000, v32, OS_LOG_TYPE_DEFAULT, "CentralManager: didFailToConnectPeripheral, Non fatal, Reconnect: %@", buf, 0xCu);
      }
      [(AXHearingAidDeviceController *)self connectToPeripheral:v9];
      goto LABEL_17;
    }
    if (((1 << v23) & 0x13106) != 0)
    {
      HAInitializeLogging();
      uint64_t v34 = [NSString stringWithFormat:@"Fatal error"];
      id v35 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController centralManager:didFailToConnectPeripheral:error:]", 1195, v34];
      os_log_t v36 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = v35;
        BOOL v38 = v36;
        uint64_t v39 = [v37 UTF8String];
        *(_DWORD *)long long buf = 136446210;
        uint64_t v54 = v39;
        _os_log_impl(&dword_20CC86000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      v40 = HCLogHearingHandoff();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v41 = [v9 identifier];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v54 = (uint64_t)v41;
      id v42 = "CentralManager: didFailToConnectPeripheral, Fatal: %@";
    }
    else
    {
      v43 = +[HUHearingAidSettings sharedInstance];
      int v44 = [v43 clearPartialPairing];

      if (v44)
      {
        id v45 = [v8 sharedPairingAgent];
        [v45 unpairPeer:v9];
      }
      else
      {
        v46 = (void *)MEMORY[0x263F472C0];
        os_log_t v47 = (void *)MEMORY[0x263F472B0];
        uint64_t v51 = *MEMORY[0x263F47270];
        uint64_t v52 = &unk_26C1E5798;
        id v48 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        v49 = [v47 messagePayloadFromDictionary:v48 andIdentifier:0x8000000000000000];
        id v45 = [v46 messageWithPayload:v49];

        uint64_t v50 = +[AXHeardController sharedServer];
        [v50 sendUpdateMessage:v45 forIdentifier:0x8000000000000000];
      }
      v40 = HCLogHearingHandoff();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v41 = [v9 identifier];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v54 = (uint64_t)v41;
      id v42 = "CentralManager: didFailToConnectPeripheral, Pairing info was removed: %@";
    }
    _os_log_impl(&dword_20CC86000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);

LABEL_16:
  }
LABEL_17:
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(AXHearingAidDeviceController *)self hearingAidForPeripheral:v7];
  [v9 updateBatteryServiceForPeripheral:v7];
  id v10 = HCLogHearingHandoff();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 state];
    id v12 = [v7 identifier];
    uint64_t v13 = [v9 name];
    int v20 = 134218754;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    unint64_t v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "CentralManager didDisconnectPeripheral state: %ld %@ %@ error: %@", (uint8_t *)&v20, 0x2Au);
  }
  if (![v9 isPaired]) {
    goto LABEL_10;
  }
  uint64_t v14 = +[HUHearingAidSettings sharedInstance];
  if ([v14 isiCloudPaired])
  {

    goto LABEL_10;
  }
  id v15 = +[HUHearingAidSettings sharedInstance];
  id v16 = [v15 pairedHearingAids];

  if (!v16)
  {
LABEL_10:
    if (v9)
    {
      [(HUDeviceController *)self device:v9 didUpdateProperty:69206016];
      [(AXHearingAidDeviceController *)self removeConnectedDevice:v9];
      id v19 = [(AXHearingAidDeviceController *)self persistentDevices];
      [v19 removeObject:v9];

      [(AXHearingAidDeviceController *)self loadedDevicesDidChange];
    }
    goto LABEL_12;
  }
  [(HUDeviceController *)self device:v9 didUpdateProperty:0x200000];
  [(AXHearingAidDeviceController *)self removeConnectedDevice:v9];
  [v9 connectionDidChange];
  id v17 = +[HUNearbyHearingAidController sharedInstance];
  [v17 sendConnectionUpdateToPeers];

  uint64_t v18 = HCLogHearingHandoff();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "CentralManager didDisconnectPeripheral, Connect", (uint8_t *)&v20, 2u);
  }

  [(AXHearingAidDeviceController *)self connectToPeripheral:v7];
LABEL_12:
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 hasTag:@"IsHearingAid"])
  {
    id v6 = v5;
    id v7 = +[HUHearingAidSettings sharedInstance];
    id v8 = [v7 pairedHearingAids];

    HAInitializeLogging();
    id v9 = [NSString stringWithFormat:@"Pairing completed %@ - %@", v6, v8];
    id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1249, v9];
    uint64_t v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      uint64_t v13 = v11;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v68 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v14 = [(AXHearingAidDeviceController *)self hearingAidForPeripheral:v6];
    if (v14) {
      goto LABEL_32;
    }
    id v15 = +[HUHearingAidSettings sharedInstance];
    id v16 = [v15 pairedHearingAids];

    if (!v16)
    {
      int v47 = [v6 hasTag:@"Left HA"];
      id v48 = @"ax_hearing_device_right_peripheral_key";
      if (v47) {
        id v48 = @"ax_hearing_device_left_peripheral_key";
      }
      v49 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v50 = v48;
      uint64_t v51 = +[HUHearingAidSettings sharedInstance];
      uint64_t v52 = [v51 knownPeripheralUUIDs];
      uint64_t v18 = [v49 dictionaryWithDictionary:v52];

      if (!v18)
      {
        uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v53 = [v6 identifier];
      uint64_t v54 = [v53 UUIDString];
      [v18 setValue:v54 forKey:v50];

      uint64_t v55 = +[HUHearingAidSettings sharedInstance];
      [v55 setKnownPeripheralUUIDs:v18];

      HAInitializeLogging();
      uint64_t v25 = [NSString stringWithFormat:@"Not iCloud paired. Storing UUIDs %@", v18];
      id v56 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1301, v25];
      uint64_t v57 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v56 = v56;
        v58 = v57;
        uint64_t v59 = [v56 UTF8String];
        *(_DWORD *)long long buf = 136446210;
        uint64_t v68 = v59;
        _os_log_impl(&dword_20CC86000, v58, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      goto LABEL_31;
    }
    id v17 = [v8 objectForKey:@"ax_hearing_device_left_peripheral_key"];
    uint64_t v18 = [v17 objectForKey:@"ax_hearing_device_hiid_key"];

    id v19 = [v8 objectForKey:@"ax_hearing_device_left_peripheral_key"];
    v66 = [v19 objectForKey:@"ax_hearing_device_hiidother_key"];

    int v20 = [v8 objectForKey:@"ax_hearing_device_right_peripheral_key"];
    uint64_t v21 = [v20 objectForKey:@"ax_hearing_device_hiid_key"];

    __int16 v22 = [v8 objectForKey:@"ax_hearing_device_right_peripheral_key"];
    unint64_t v23 = [v22 objectForKey:@"ax_hearing_device_hiidother_key"];

    uint64_t v63 = v23;
    if (![v18 length])
    {
      id v24 = v23;

      uint64_t v18 = v24;
    }
    uint64_t v25 = v66;
    if (![v21 length])
    {
      id v26 = v66;

      uint64_t v21 = v26;
    }
    v64 = v21;
    uint64_t v27 = +[AXHearingAidDevice deviceIDFromLeftID:v18 andRightID:v21];
    int v28 = [v6 hasTag:v27];
    HAInitializeLogging();
    int v65 = (void *)v27;
    if (v28)
    {
      id v29 = [NSString stringWithFormat:@"Found easy paired peripheral %@ - %@", v27, v6];
      id v30 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1272, v29];
      uint64_t v31 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v32 = v30;
        v33 = v31;
        uint64_t v34 = [v32 UTF8String];
        *(_DWORD *)long long buf = 136446210;
        uint64_t v68 = v34;
        _os_log_impl(&dword_20CC86000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      id v35 = [(AXHearingAidDeviceController *)self hearingAidForDeviceID:v65];
      if (!v35)
      {
        id v35 = [[AXHearingAidDevice alloc] initWithPersistentRepresentation:v8];
        [(AXHearingAidDeviceController *)self addAvailableDevice:v35];
        [(AXHearingAidDeviceController *)self addLoadedDevice:v35];
        HAInitializeLogging();
        os_log_t v36 = [NSString stringWithFormat:@"Creating new easy pairing device %@", v35];
        id v37 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1279, v36];
        BOOL v38 = (void *)*MEMORY[0x263F47290];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
        {
          id v62 = v36;
          id v39 = v37;
          v40 = v38;
          id v41 = v39;
          os_log_t v36 = v62;
          uint64_t v42 = [v41 UTF8String];
          *(_DWORD *)long long buf = 136446210;
          uint64_t v68 = v42;
          _os_log_impl(&dword_20CC86000, v40, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
      }
      -[AXHearingAidDevice addPeripheral:asLeft:](v35, "addPeripheral:asLeft:", v6, [v6 hasTag:@"Left HA"]);
      id v43 = +[HUHearingAidSettings sharedInstance];
      int v44 = [(AXHearingAidDevice *)v35 persistentRepresentation];
      [v43 setPairedHearingAids:v44];
    }
    else
    {
      id v35 = [NSString stringWithFormat:@"Peripheral missing tag %@", v27];
      id v43 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1286, v35];
      v60 = (void *)*MEMORY[0x263F47290];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

        id v56 = v64;
LABEL_31:

LABEL_32:
        [v14 addPeripheral:v6];
        [v14 pairingDidCompleteForPeripheral:v6];
        [v14 checkPairingStatusWithCompletion:&__block_literal_global_211];
        [(AXHearingAidDeviceController *)self loadedDevicesDidChange];

        goto LABEL_33;
      }
      id v43 = v43;
      int v44 = v60;
      uint64_t v61 = [v43 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v68 = v61;
      _os_log_impl(&dword_20CC86000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    uint64_t v25 = v66;
    goto LABEL_30;
  }
  HAInitializeLogging();
  id v6 = [NSString stringWithFormat:@"Skipping pairing becuase not a hearing device %@", v5];
  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1319, v6];
  id v45 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v8;
    v46 = v45;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v68 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
LABEL_33:
}

void __68__AXHearingAidDeviceController_pairingAgent_peerDidCompletePairing___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2 && (a3 & 1) == 0)
  {
    id v3 = +[AXHAController sharedController];
    [v3 setListenForAvailableDeviceUpdates:0];

    id v4 = +[HUHearingAidSettings sharedInstance];
    [v4 setClearPartialPairing:0];
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  HAInitializeLogging();
  id v9 = [NSString stringWithFormat:@"%@ - %@", v7, v8];

  id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairingAgent:peerDidFailToCompletePairing:error:]", 1325, v9];
  uint64_t v11 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v10;
    uint64_t v13 = v11;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v17 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v7;
    id v15 = [(AXHearingAidDeviceController *)self hearingAidForPeripheral:v14];
    [v15 pairingDidCompleteForPeripheral:v14];

    [(AXHearingAidDeviceController *)self loadedDevicesDidChange];
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(AXHearingAidDeviceController *)self hearingAidForPeripheral:v5];
  HAInitializeLogging();
  id v7 = [NSString stringWithFormat:@"Did Unpair %@ in device %@", v5, v6];

  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairingAgent:peerDidUnpair:]", 1339, v7];
  id v9 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    uint64_t v11 = v9;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v14 = [v10 UTF8String];
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v6)
  {
    [(AXHearingAidDeviceController *)self forgetDevice:v6];
    [(AXHearingAidDeviceController *)self loadedDevicesDidChange];
    [v6 disconnectAndUnpair:1];
    id v12 = +[HUHearingAidSettings sharedInstance];
    [v12 setPairedHearingAids:0];
  }
}

- (void)checkPeripheralPaired:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    if (_AXSInUnitTestMode())
    {
      v7[2](v7, 1);
    }
    else if (v6)
    {
      bluetoothCentralQueue = self->_bluetoothCentralQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__AXHearingAidDeviceController_checkPeripheralPaired_withCompletion___block_invoke;
      block[3] = &unk_2640FD7E0;
      void block[4] = self;
      id v10 = v6;
      uint64_t v11 = v7;
      dispatch_async(bluetoothCentralQueue, block);
    }
    else
    {
      v7[2](v7, 0);
    }
  }
}

uint64_t __69__AXHearingAidDeviceController_checkPeripheralPaired_withCompletion___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 40) sharedPairingAgent];
  [v2 isPeerPaired:a1[5]];

  id v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

- (void)unpairPeripheralWithUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __57__AXHearingAidDeviceController_unpairPeripheralWithUUID___block_invoke;
    v10[3] = &unk_2640FC938;
    id v11 = v4;
    id v12 = self;
    [(AXHearingAidDeviceController *)self sendRequestToCentralManager:v10];
    id v5 = v11;
  }
  else
  {
    HAInitializeLogging();
    id v5 = [NSString stringWithFormat:@"Not Unpairing %@", v4];
    id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController unpairPeripheralWithUUID:]", 1400, v5];
    id v7 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      id v9 = v7;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v14 = [v8 UTF8String];
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __57__AXHearingAidDeviceController_unpairPeripheralWithUUID___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(a1 + 32)];
  id v3 = *(void **)(*(void *)(a1 + 40) + 40);
  v21[0] = v2;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  id v5 = [v3 retrievePeripheralsWithIdentifiers:v4];

  id v6 = [v5 firstObject];
  if (!v6)
  {
    HAInitializeLogging();
    uint64_t v14 = [NSString stringWithFormat:@"Not unpairing %@", *(void *)(a1 + 32)];
    uint64_t v15 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController unpairPeripheralWithUUID:]_block_invoke", 1394, v14];
    id v16 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      uint64_t v18 = v16;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = [v17 UTF8String];
      _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    goto LABEL_9;
  }
  id v7 = [*(id *)(*(void *)(a1 + 40) + 40) sharedPairingAgent];
  unsigned int v8 = [v7 isPeerPaired:v6];

  HAInitializeLogging();
  id v9 = [NSString stringWithFormat:@"Unpairing [%d] %@", v8, *(void *)(a1 + 32)];
  id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController unpairPeripheralWithUUID:]_block_invoke", 1386, v9];
  id v11 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v10;
    uint64_t v13 = v11;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v20 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v8)
  {
    uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 40) sharedPairingAgent];
    [v14 unpairPeer:v6];
LABEL_9:
  }
}

- (void)persistPairedHearingAids
{
  id v2 = [(AXHearingAidDeviceController *)self persistentDevices];
  id v3 = [v2 firstObject];
  id v5 = [v3 persistentRepresentation];

  if ([v5 count])
  {
    id v4 = +[HUHearingAidSettings sharedInstance];
    [v4 setPairedHearingAids:v5];
  }
}

- (void)pairedHearingAidsDidChange
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v3 = +[HUHearingAidSettings sharedInstance];
  id v4 = [v3 pairedHearingAids];

  HAInitializeLogging();
  id v5 = [NSString stringWithFormat:@"New aids: %@", v4];
  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairedHearingAidsDidChange]", 1420, v5];
  id v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    id v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v74 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (!v4)
  {
    uint64_t v18 = +[AXHAController sharedController];
    id v19 = [v18 liveListenController];
    int v20 = [v19 isListening];

    if (!v20) {
      goto LABEL_33;
    }
    uint64_t v21 = +[AXHAController sharedController];
    __int16 v22 = [v21 liveListenController];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke;
    v71[3] = &unk_2640FE7C0;
    v71[4] = self;
    [v22 stopListeningWithCompletion:v71];

LABEL_32:
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v4 valueForKey:@"HAFakeSearch"];
    char v11 = [v10 BOOLValue];

    if ((v11 & 1) == 0)
    {
      uint64_t v21 = [v4 valueForKey:@"ax_hearing_device_fake_type_key"];
      if (v21)
      {
        unint64_t v23 = -[AXFakeHearingAidDevice initWithDeviceType:]([AXFakeHearingAidDevice alloc], "initWithDeviceType:", [v21 intValue]);
        id v24 = [(AXHearingAidDeviceController *)self persistentDevices];
        [v24 addObject:v23];

        [(AXHearingAidDeviceController *)self addLoadedDevice:v23];
        [(AXHearingAidDeviceController *)self addAvailableDevice:v23];
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v25 = [MEMORY[0x263EFF980] array];
      id v26 = [[AXHearingAidDevice alloc] initWithPersistentRepresentation:v4];
      uint64_t v27 = [(AXHearingAidDevice *)v26 deviceUUID];
      int v28 = [(AXHearingAidDeviceController *)self hearingAidForDeviceID:v27];

      if (v28)
      {
        id v29 = v28;

        id v26 = v29;
      }
      else if (!v26)
      {
        goto LABEL_17;
      }
      if ([(AXHearingAidDevice *)v26 didLoadPersistentProperties])
      {
        id v30 = [(AXHearingAidDeviceController *)self persistentDevices];
        v72 = v26;
        uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
        [v30 setArray:v31];

        [(AXHearingAidDeviceController *)self addLoadedDevice:v26];
        [(AXHearingAidDeviceController *)self addAvailableDevice:v26];
LABEL_18:
        v33 = [(AXHearingAidDevice *)v26 leftPeripheralUUID];

        if (v33)
        {
          uint64_t v34 = [(AXHearingAidDevice *)v26 leftPeripheralUUID];
          [v25 addObject:v34];
        }
        id v35 = [(AXHearingAidDevice *)v26 rightPeripheralUUID];

        if (v35)
        {
          os_log_t v36 = [(AXHearingAidDevice *)v26 rightPeripheralUUID];
          [v25 addObject:v36];
        }
        HAInitializeLogging();
        id v37 = NSString;
        BOOL v38 = [(AXHearingAidDeviceController *)self persistentDevices];
        id v39 = [v37 stringWithFormat:@"Persistent device %@, %@", v26, v38];

        v40 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairedHearingAidsDidChange]", 1489, v39];
        id v41 = (void *)*MEMORY[0x263F47290];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v42 = v25;
          id v43 = v28;
          id v44 = v40;
          id v45 = v41;
          v46 = v44;
          int v28 = v43;
          uint64_t v25 = v42;
          uint64_t v21 = 0;
          uint64_t v47 = [v46 UTF8String];
          *(_DWORD *)long long buf = 136446210;
          uint64_t v74 = v47;
          _os_log_impl(&dword_20CC86000, v45, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        id v48 = [(AXHearingAidDeviceController *)self connectedDevices];
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_240;
        v69[3] = &unk_2640FE5D8;
        unint64_t v23 = v25;
        v70 = v23;
        [v48 enumerateObjectsUsingBlock:v69];

        v49 = [MEMORY[0x263EFF980] array];
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_3_242;
        v67[3] = &unk_2640FE810;
        id v50 = v49;
        id v68 = v50;
        [(AXFakeHearingAidDevice *)v23 enumerateObjectsUsingBlock:v67];
        if ([v50 count])
        {
          v64[0] = MEMORY[0x263EF8330];
          v64[1] = 3221225472;
          v64[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_4;
          v64[3] = &unk_2640FE058;
          v64[4] = self;
          id v65 = v50;
          v66 = v26;
          [(AXHearingAidDeviceController *)self sendRequestToCentralManager:v64];
        }
        else
        {
          uint64_t v51 = +[HUHearingAidSettings sharedInstance];
          char v52 = [v51 isiCloudPaired];

          if ((v52 & 1) == 0)
          {
            HAInitializeLogging();
            uint64_t v53 = [NSString stringWithFormat:@"No BT identifiers %@, unpairing rep %@", v23, v4];
            uint64_t v54 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairedHearingAidsDidChange]", 1543, v53];
            uint64_t v55 = (void *)*MEMORY[0x263F47290];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v63 = v53;
              id v56 = v54;
              uint64_t v57 = v55;
              v58 = v56;
              uint64_t v53 = v63;
              uint64_t v59 = [v58 UTF8String];
              *(_DWORD *)long long buf = 136446210;
              uint64_t v74 = v59;
              _os_log_impl(&dword_20CC86000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            }
            v60 = +[HUHearingAidSettings sharedInstance];
            [v60 setPairedHearingAids:0];

            uint64_t v61 = [(AXHearingAidDeviceController *)self persistentDevices];
            id v62 = [v61 firstObject];
            [v62 disconnectAndUnpair:1];

            [(AXHearingAidDeviceController *)self searchForAvailableDevices];
          }
        }

        goto LABEL_31;
      }
LABEL_17:
      [(AXHearingAidDevice *)v26 disconnectAndUnpair:1];
      id v32 = +[HUHearingAidSettings sharedInstance];
      [v32 setPairedHearingAids:0];

      goto LABEL_18;
    }
  }
  id v12 = [v4 valueForKey:@"HAFakeSearch"];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [[AXFakeHearingAidDevice alloc] initWithDeviceType:2];
    [(AXHearingAidDeviceController *)self addLoadedDevice:v14];
    [(AXHearingAidDeviceController *)self addAvailableDevice:v14];
    uint64_t v15 = [[AXFakeHearingAidDevice alloc] initWithDeviceType:4];

    [(AXHearingAidDeviceController *)self addLoadedDevice:v15];
    [(AXHearingAidDeviceController *)self addAvailableDevice:v15];
    id v16 = [[AXFakeHearingAidDevice alloc] initWithDeviceType:8];

    [(AXHearingAidDeviceController *)self addLoadedDevice:v16];
    [(AXHearingAidDeviceController *)self addAvailableDevice:v16];
    id v17 = [[AXFakeHearingAidDevice alloc] initWithDeviceType:64];

    [(AXHearingAidDeviceController *)self addLoadedDevice:v17];
    [(AXHearingAidDeviceController *)self addAvailableDevice:v17];
  }
LABEL_33:
}

uint64_t __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) persistentDevices];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_2;
  v4[3] = &unk_2640FE5D8;
  v4[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v4];

  return AXPerformBlockOnMainThread();
}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 disconnectAndUnpair:1];
  [*(id *)(a1 + 32) removeLoadedDevice:v3];
  [*(id *)(a1 + 32) removeAvailableDevice:v3];
  [v3 setIsPaired:0];
}

uint64_t __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) persistentDevices];
  [v2 removeAllObjects];

  id v3 = *(void **)(a1 + 32);

  return [v3 loadedDevicesDidChange];
}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_240(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_2_241;
  v7[3] = &unk_2640FE7E8;
  id v8 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v7];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [v5 disconnectAndUnpair:1];
  }
  [v5 setIsPaired:v6 != 0x7FFFFFFFFFFFFFFFLL];
}

uint64_t __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_2_241(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsPeripheralWithUUID:a2];
}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_3_242(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithUUIDString:v4];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    id v5 = v6;
  }
}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) retrievePeripheralsWithIdentifiers:*(void *)(a1 + 40)];
  if ([v2 count])
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_246;
    v15[3] = &unk_2640FE810;
    id v16 = *(id *)(a1 + 48);
    [v2 enumerateObjectsUsingBlock:v15];
    id v3 = +[HUHearingAidSettings sharedInstance];
    int v4 = [v3 isiCloudPaired];

    if (v4)
    {
      id v5 = +[HUHearingAidSettings sharedInstance];
      id v6 = [*(id *)(a1 + 48) persistentRepresentation];
      [v5 setPairedHearingAids:v6];
    }
    [*(id *)(a1 + 32) centralManager:*(void *)(*(void *)(a1 + 32) + 40) didRetrievePeripherals:v2];
  }
  else
  {
    HAInitializeLogging();
    id v7 = [NSString stringWithFormat:@"No BT peripherals with identifiers, unpairing %@", *(void *)(a1 + 40)];
    id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairedHearingAidsDidChange]_block_invoke_4", 1522, v7];
    id v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      char v11 = v9;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v18 = [v10 UTF8String];
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v12 = +[HUHearingAidSettings sharedInstance];
    [v12 setPairedHearingAids:0];

    int v13 = [*(id *)(a1 + 32) persistentDevices];
    uint64_t v14 = [v13 firstObject];
    [v14 disconnectAndUnpair:1];

    [*(id *)(a1 + 32) searchForAvailableDevices];
  }
}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_246(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  LODWORD(v2) = [v2 addPeripheral:v3];
  HAInitializeLogging();
  int v4 = [NSString stringWithFormat:@"Adding peripheral to device [%d] %@", v2, v3];

  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDeviceController pairedHearingAidsDidChange]_block_invoke", 1531, v4];
  id v6 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v10 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (id)valueForProperty:(unint64_t)a3 forDeviceID:(id)a4
{
  id v5 = [(AXHearingAidDeviceController *)self hearingAidForDeviceID:a4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 valueForProperty:a3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)representsLocalDevices
{
  return 1;
}

- (NSMutableArray)availablePeripherals
{
  return self->_availablePeripherals;
}

- (void)setAvailablePeripherals:(id)a3
{
}

- (NSMutableArray)loadedDevices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLoadedDevices:(id)a3
{
}

- (NSMutableArray)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
}

- (NSMutableArray)centralRequestBlocks
{
  return self->centralRequestBlocks;
}

- (void)setCentralRequestBlocks:(id)a3
{
}

- (NSMutableArray)availableSearchBlocks
{
  return self->_availableSearchBlocks;
}

- (void)setAvailableSearchBlocks:(id)a3
{
}

- (NSMutableArray)connectedSearchBlocks
{
  return self->_connectedSearchBlocks;
}

- (void)setConnectedSearchBlocks:(id)a3
{
}

- (NSMutableArray)updateDeviceBlocks
{
  return self->_updateDeviceBlocks;
}

- (void)setUpdateDeviceBlocks:(id)a3
{
}

- (NSMutableArray)persistentDevices
{
  return self->_persistentDevices;
}

- (void)setPersistentDevices:(id)a3
{
}

- (BOOL)shouldActiveScan
{
  return self->_shouldActiveScan;
}

- (void)setShouldActiveScan:(BOOL)a3
{
  self->_shouldActiveScan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentDevices, 0);
  objc_storeStrong((id *)&self->centralRequestBlocks, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_loadedDevices, 0);
  objc_storeStrong((id *)&self->_availablePeripherals, 0);
  objc_storeStrong((id *)&self->_availableDeviceTimer, 0);
  objc_storeStrong((id *)&self->_advertisingTimestamps, 0);
  objc_storeStrong((id *)&self->_advertisingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_deviceUpdatesDescription, 0);
  objc_storeStrong((id *)&self->_deviceUpdatesQueue, 0);
  objc_storeStrong((id *)&self->_updateDeviceBlocks, 0);
  objc_storeStrong((id *)&self->_connectedSearchBlocks, 0);
  objc_storeStrong((id *)&self->_availableSearchBlocks, 0);
  objc_storeStrong((id *)&self->_bluetoothCentralQueue, 0);
  objc_storeStrong((id *)&self->_centralRequestsLock, 0);

  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

void __44__AXHearingAidDeviceController_isConnecting__block_invoke_cold_1(void *a1)
{
  id v2 = [a1 rightPeripheral];
  id v3 = objc_msgSend(a1, "descriptionForCBPeripheralState:", objc_msgSend(v2, "state"));
  int v4 = [a1 rightPeripheral];
  id v5 = [v4 identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20CC86000, v6, v7, "rightPeripheral state: %@ %@", v8, v9, v10, v11, v12);
}

void __44__AXHearingAidDeviceController_isConnecting__block_invoke_cold_2(void *a1)
{
  id v2 = [a1 leftPeripheral];
  id v3 = objc_msgSend(a1, "descriptionForCBPeripheralState:", objc_msgSend(v2, "state"));
  int v4 = [a1 leftPeripheral];
  id v5 = [v4 identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20CC86000, v6, v7, "leftPeripheral state: %@ %@", v8, v9, v10, v11, v12);
}

@end
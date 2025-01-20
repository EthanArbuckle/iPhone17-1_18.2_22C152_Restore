@interface CBCentralManager
+ (BOOL)supportsFeatures:(CBCentralManagerFeature)features;
- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3;
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (BOOL)isScanning;
- (CBCentralManager)init;
- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options;
- (NSArray)retrieveConnectedPeripheralsWithServices:(NSArray *)serviceUUIDs;
- (NSArray)retrievePeripheralsWithIdentifiers:(NSArray *)identifiers;
- (NSMapTable)peripherals;
- (NSMutableArray)discoveredPeripherals;
- (OS_dispatch_source)updateTimer;
- (id)createCBPeripheralsFromIDs:(id)a3;
- (id)createPeripheralWithAddress:(id)a3 andIdentifier:(id)a4;
- (id)dataArrayToUUIDArray:(id)a3;
- (id)delegate;
- (id)getLPEMData:(id)a3;
- (id)isApplicationConnectedToAnyPeripherals:(id)a3;
- (id)peripheralWithIdentifier:(id)a3;
- (id)peripheralWithInfo:(id)a3;
- (id)retrieveAddressForPeripheral:(id)a3;
- (id)retrieveConnectedPeripheralsWithServices:(id)a3 allowAll:(BOOL)a4;
- (id)retrieveConnectingPeripherals;
- (id)retrievePairingInfoForPeripheral:(id)a3;
- (id)retrievePeripheralWithAddress:(id)a3;
- (id)retrieveState;
- (id)retrieveWhbCBPeripheralWithInfo:(id)a3;
- (id)scanCompletion;
- (id)startConnectionEventCounterForPeripheral:(id)a3;
- (id)stopConnectionEventCounterForPeripheral:(id)a3;
- (unsigned)getRemainingAdvancedMatchingRule;
- (unsigned)getTotalSupportedAdvancedMatchingRules;
- (unsigned)retrieveMaxConnectionForUsecase:(unsigned int)a3;
- (void)HandleBluetoothPhyStatisticEventMsg:(id)a3;
- (void)HandleBluetoothUsageEventMsg:(id)a3;
- (void)HandleCSProcedureEventMsg:(id)a3;
- (void)HandleControllerBTClockUpdateMsg:(id)a3;
- (void)HandleRssiDetectionUpdateMsg:(id)a3;
- (void)_scanForPeripheralsWithServices:(id)a3 options:(id)a4;
- (void)activateWhbCnxForCBPeripheral:(id)a3 infoDict:(id)a4;
- (void)addAdvancedMatchingRule:(id)a3;
- (void)addIRKwithBTAddress:(id)a3 irk:(id)a4;
- (void)cancelPeripheralConnection:(CBPeripheral *)peripheral;
- (void)cancelPeripheralConnection:(id)a3 force:(BOOL)a4;
- (void)cancelPeripheralConnection:(id)a3 options:(id)a4;
- (void)clearDuplicateFilterCache:(id)a3;
- (void)connectPeripheral:(CBPeripheral *)peripheral options:(NSDictionary *)options;
- (void)connectWhbCBPeripheral:(id)a3 withCompletion:(id)a4;
- (void)createOfflineLEPairing:(unsigned __int16)a3;
- (void)createPeripheralFromIdentifier:(id)a3 completion:(id)a4;
- (void)csCreateConfig:(id)a3 options:(id)a4;
- (void)csProcedureEnable:(id)a3 options:(id)a4;
- (void)csReadLocalFAETable;
- (void)csReadLocalSupportedCapabilities;
- (void)csReadRemoteFAETable:(id)a3;
- (void)csReadRemoteSupportedCapabilities:(id)a3;
- (void)csRemoveConfig:(id)a3 options:(id)a4;
- (void)csSecurityEnable:(id)a3;
- (void)csSetAfh:(id)a3;
- (void)csSetDefaultSettings:(id)a3 options:(id)a4;
- (void)csSetProcedureParams:(id)a3 options:(id)a4;
- (void)csTest:(id)a3;
- (void)csWriteCachedRemoteSupportedCapabilities:(id)a3 options:(id)a4;
- (void)csWriteRemoteFAETable:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)deleteDevice:(id)a3;
- (void)enableMrc:(id)a3 options:(id)a4;
- (void)enablePrivateModeForPeripheral:(id)a3 forDuration:(unsigned __int16)a4;
- (void)enablePrivateModeForSessionWithIdentifier:(id)a3 forDuration:(unsigned __int16)a4;
- (void)forEachPeripheral:(id)a3;
- (void)handleAncsAuthChanged:(id)a3;
- (void)handleApplicationActivityEvent:(id)a3;
- (void)handleApplicationConnectionEventDidOccur:(id)a3;
- (void)handleConnectionParametersUpdated:(id)a3;
- (void)handleDidReceiveDataFromPeripheral:(id)a3;
- (void)handleDidSendBytesToPeripheralwithError:(id)a3;
- (void)handleFindMyDevicesUpdated:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handlePeerMTUChanged:(id)a3;
- (void)handlePeripheralCLReady:(id)a3;
- (void)handlePeripheralConnectionCompleted:(id)a3;
- (void)handlePeripheralConnectionStateUpdated:(id)a3;
- (void)handlePeripheralDisconnectionCompleted:(id)a3;
- (void)handlePeripheralDiscovered:(id)a3;
- (void)handlePeripheralInvalidated:(id)a3;
- (void)handlePeripheralTrackingUpdated:(id)a3;
- (void)handleReadyForUpdates:(id)a3;
- (void)handleRestoringState:(id)a3;
- (void)handleScanComplete:(id)a3;
- (void)handleScanFailedToStartWithError:(id)a3;
- (void)handleScanParamsUpdated:(id)a3;
- (void)handleSupportedFeatures:(id)a3;
- (void)handleZoneLost:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)orphanPeripherals;
- (void)pauseLeConnectionManager;
- (void)pauseScans;
- (void)powerAssertionNearCompletion;
- (void)randomizeAFHMapForPeripheral:(id)a3;
- (void)readLocalFastLeConnectionCachedControllerInfoWithcompletion:(id)a3;
- (void)registerForConnectionEventsWithOptions:(NSDictionary *)options;
- (void)removeAdvancedMatchingRule:(id)a3;
- (void)removeIRKwithBTAddress:(id)a3;
- (void)removeMultipleEntriesDuplicateFilter:(id)a3;
- (void)removeSingleEntryDuplicateFilter:(id)a3;
- (void)resumeLeConnectionManager;
- (void)resumeScans;
- (void)retrieveBTDeviceCacheInfo:(id)a3 withCompletion:(id)a4;
- (void)retrieveConnectedPeripherals;
- (void)retrieveConnectedPeripheralsWithServices:(id)a3 completion:(id)a4;
- (void)retrieveConnectionHandleWithIdentifier:(id)a3 completion:(id)a4;
- (void)retrievePeripherals:(id)a3;
- (void)retrievePeripheralsWithCustomProperties:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithFindMyIds:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithFindMySerialNumberStrings:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithFindMySerialNumbers:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithTags:(id)a3 completion:(id)a4;
- (void)scanForPeripheralsWithServices:(NSArray *)serviceUUIDs options:(NSDictionary *)options;
- (void)scanForPeripheralsWithServices:(id)a3 options:(id)a4 completion:(id)a5;
- (void)sendData:(id)a3 toPeripheral:(id)a4;
- (void)setBluetoothPhyStatisticsNotifications:(id)a3 options:(id)a4;
- (void)setBluetoothUsageNotifications:(id)a3 options:(id)a4;
- (void)setConnectionEventOptions:(id)a3;
- (void)setDataLengthChange:(id)a3 options:(id)a4;
- (void)setDelegate:(id)delegate;
- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4;
- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4 completion:(id)a5;
- (void)setDiscoveredPeripherals:(id)a3;
- (void)setEnhancedScanEnable:(id)a3;
- (void)setEnhancedSetScanParamtersMultiCore:(id)a3;
- (void)setHostState:(BOOL)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)setLESetPhy:(id)a3 options:(id)a4;
- (void)setLeAFHMap:(id)a3;
- (void)setLePowerControl:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setMatchActionRules:(id)a3;
- (void)setRSSIStatisticsDetection:(id)a3 options:(id)a4;
- (void)setScanCompletion:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)startTrackingPeripheral:(id)a3 options:(id)a4;
- (void)stopScan;
- (void)stopTrackingPeripheral:(id)a3 options:(id)a4;
- (void)updatePeripheral:(id)a3 options:(id)a4;
- (void)wipeDuplicateFilterList:(id)a3;
@end

@implementation CBCentralManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredPeripherals, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong(&self->_scanCompletion, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)scanForPeripheralsWithServices:(NSArray *)serviceUUIDs options:(NSDictionary *)options
{
  id scanCompletion = self->_scanCompletion;
  self->_id scanCompletion = 0;
  v7 = options;
  v8 = serviceUUIDs;

  id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];

  [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"kCBMsgArgHasCompletionBlock"];
  [(CBCentralManager *)self _scanForPeripheralsWithServices:v8 options:v9];
}

- (void)_scanForPeripheralsWithServices:(id)a3 options:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = (id)MEMORY[0x1E4F1CBF0];
  if (a3) {
    id v6 = a3;
  }
  v12[0] = @"kCBMsgArgUUIDs";
  v12[1] = @"kCBMsgArgOptions";
  id v7 = (id)MEMORY[0x1E4F1CC08];
  if (a4) {
    id v7 = a4;
  }
  v13[0] = v6;
  v13[1] = v7;
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 dictionaryWithObjects:v13 forKeys:v12 count:2];

  LODWORD(v10) = [(CBManager *)self sendMsg:71 args:v11];
  if (v10) {
    [(CBCentralManager *)self setIsScanning:1];
  }
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (void)stopScan
{
  if ([(CBManager *)self sendMsg:72 args:0])
  {
    [(CBCentralManager *)self setIsScanning:0];
  }
}

- (void)dealloc
{
  [(CBCentralManager *)self orphanPeripherals];
  if (self->_observingKeyPaths)
  {
    [(CBCentralManager *)self removeObserver:self forKeyPath:@"delegate" context:objc_opt_class()];
    [(CBCentralManager *)self removeObserver:self forKeyPath:@"state" context:objc_opt_class()];
    [(CBCentralManager *)self removeObserver:self forKeyPath:@"localName" context:objc_opt_class()];
    self->_observingKeyPaths = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CBCentralManager;
  [(CBManager *)&v3 dealloc];
}

- (void)orphanPeripherals
{
  [(CBCentralManager *)self forEachPeripheral:&__block_literal_global];
  peripherals = self->_peripherals;

  [(NSMapTable *)peripherals removeAllObjects];
}

- (void)forEachPeripheral:(id)a3
{
  v8 = (void (**)(id, void *))a3;
  v4 = [(NSMapTable *)self->_peripherals objectEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      v8[2](v8, v6);
      uint64_t v7 = [v4 nextObject];

      id v6 = (void *)v7;
    }
    while (v7);
  }
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  BOOL result = 1;
  if ((a3 - 8) >= 2 && a3 != 206)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)CBCentralManager;
    return -[CBManager isMsgAllowedAlways:](&v7, sel_isMsgAllowedAlways_);
  }
  return result;
}

- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options
{
  id v9 = delegate;
  id v10 = queue;
  v11 = options;
  v46.receiver = self;
  v46.super_class = (Class)CBCentralManager;
  v12 = [(CBManager *)&v46 initInternal];
  if (!v12) {
    goto LABEL_36;
  }
  SEL v45 = a2;
  [(CBCentralManager *)v12 addObserver:v12 forKeyPath:@"state" options:0 context:objc_opt_class()];
  [(CBCentralManager *)v12 addObserver:v12 forKeyPath:@"delegate" options:0 context:objc_opt_class()];
  [(CBCentralManager *)v12 addObserver:v12 forKeyPath:@"localName" options:0 context:objc_opt_class()];
  int v13 = 1;
  v12->_observingKeyPaths = 1;
  [(CBCentralManager *)v12 setDelegate:v9];
  v12->_isScanning = 0;
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:0];
  peripherals = v12->_peripherals;
  v12->_peripherals = (NSMapTable *)v14;

  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  discoveredPeripherals = v12->_discoveredPeripherals;
  v12->_discoveredPeripherals = v16;

  [(CBManager *)v12 setTccComplete:0];
  v18 = [MEMORY[0x1E4F28B50] mainBundle];
  v19 = [v18 objectForInfoDictionaryKey:@"UIBackgroundModes"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v19 containsObject:@"bluetooth-central"]) {
      int v13 = 0;
    }
    else {
      int v13 = [v19 containsObject:@"bluetooth"] ^ 1;
    }
  }
  v20 = [(NSDictionary *)v11 objectForKeyedSubscript:@"kCBInitOptionRestoreIdentifier"];

  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = v12->_delegateFlags;
  v22 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
  uint64_t v23 = [(CBManager *)v12 getCBPrivacySupported];
  v24 = [NSNumber numberWithBool:v23];
  [v22 setObject:v24 forKey:@"kCBManagerPrivacySupported"];

  if (!v20)
  {
    if (*(unsigned char *)&delegateFlags)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        -[CBCentralManager initWithDelegate:queue:options:]();
      }
    }
    goto LABEL_15;
  }
  if ((*(unsigned char *)&delegateFlags & 1) == 0)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:v45, v12, @"CBCentralManager.m", 358, @"%@ has provided a restore identifier but the delegate doesn't implement the centralManager:willRestoreState: method", v12 object file lineNumber description];

    if (!v13) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  if (v13)
  {
LABEL_9:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v45, v12, @"CBCentralManager.m", 360, @"State restoration of CBCentralManager is only allowed for applications that have specified the \"bluetooth-central\" background mode", v12);
  }
LABEL_15:
  v26 = [MEMORY[0x1E4F28F80] processInfo];
  v27 = [v26 environment];
  v28 = [v27 objectForKeyedSubscript:@"XCTestConfigurationFilePath"];

  if (!v28)
  {
    if (_os_feature_enabled_impl())
    {
      unint64_t v29 = 0x1E4F28000uLL;
      if (+[CBManager tccAvailable]
        && +[CBManager preflightCheckForTCC] == 2)
      {
        v30 = [MEMORY[0x1E4F28B50] mainBundle];
        v31 = [v30 objectForInfoDictionaryKey:@"NSAccessorySetupKitSupports"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v32 = [v31 containsObject:@"Bluetooth"];
        }
        else {
          int v32 = 0;
        }
        uint64_t v33 = xpc_copy_entitlement_for_self();
        v34 = (void *)v33;
        if (v33 && MEMORY[0x1AD1120E0](v33) == MEMORY[0x1E4F14570] && xpc_BOOL_get_value(v34)) {
          v32 |= xpc_BOOL_get_value(v34);
        }
      }
      else
      {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
      unint64_t v29 = 0x1E4F28000;
    }
    v35 = [*(id *)(v29 + 2896) mainBundle];
    v36 = [v35 objectForInfoDictionaryKey:@"NSBluetoothServices"];

    v37 = [*(id *)(v29 + 2896) mainBundle];
    v38 = [v37 objectForInfoDictionaryKey:@"NSBluetoothCompanyIdentifiers"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v39 = 1;
    }
    else
    {
      objc_opt_class();
      int v39 = objc_opt_isKindOfClass() & 1;
    }
    int v40 = v39 | v32;
    v41 = [NSNumber numberWithBool:dyld_program_sdk_at_least()];
    [v22 setObject:v41 forKey:@"kCBManagerAppSDKSupportASK"];

    if (v40) {
      [v22 setObject:MEMORY[0x1E4F1CC38] forKey:@"kCBManagerRequiresPlistInspection"];
    }
  }
  v42 = (void *)[v22 copy];
  [(CBManager *)v12 startWithQueue:v10 options:v42 sessionType:0];

LABEL_36:
  return v12;
}

- (id)peripheralWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  if (v5)
  {
    peripherals = self->_peripherals;
    objc_super v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    uint64_t v5 = [(NSMapTable *)peripherals objectForKey:v7];

    if (v5)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
      if (v8)
      {
        id v9 = [(CBPeripheral *)v5 name];
        char v10 = [v9 isEqualToString:v8];

        if ((v10 & 1) == 0) {
          [(CBPeripheral *)v5 setName:v8];
        }
      }
      [(CBPeripheral *)v5 updateFindMyInfo:v4];
      v11 = [v4 objectForKey:@"kCBMsgArgVisibleInSettings"];

      if (v11)
      {
        v12 = [v4 objectForKeyedSubscript:@"kCBMsgArgVisibleInSettings"];
        -[CBPeripheral setVisibleInSettings:](v5, "setVisibleInSettings:", [v12 BOOLValue]);
      }
      else
      {
        [(CBPeripheral *)v5 setVisibleInSettings:1];
      }
    }
    else
    {
      uint64_t v5 = [[CBPeripheral alloc] initWithCentralManager:self info:v4];
      int v13 = self->_peripherals;
      uint64_t v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
      [(NSMapTable *)v13 setObject:v5 forKey:v8];
    }
  }

  return v5;
}

- (void)handlePeripheralDiscovered:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isScanning && (*(unsigned char *)&self->_delegateFlags & 2) != 0)
  {
    uint64_t v5 = [(CBCentralManager *)self peripheralWithInfo:v4];
    id v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgAdvertisingMoreAvailable"];
    uint64_t v7 = [v6 integerValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgAdvertisingIsFromADVBuff"];
    uint64_t v9 = [v8 integerValue];

    if (!v5)
    {
      if (!v7 && v9 && (*((unsigned char *)&self->_delegateFlags + 1) & 0x40) != 0)
      {
        uint64_t v33 = [(CBCentralManager *)self delegate];
        if ([(NSMutableArray *)self->_discoveredPeripherals count]) {
          discoveredPeripherals = self->_discoveredPeripherals;
        }
        else {
          discoveredPeripherals = 0;
        }
        [v33 centralManager:self didDiscoverMultiplePeripherals:discoveredPeripherals];

        [(NSMutableArray *)self->_discoveredPeripherals removeAllObjects];
      }
      goto LABEL_40;
    }
    uint64_t v44 = v9;
    char v10 = [v4 objectForKeyedSubscript:@"kCBMsgArgAdvertisementData"];
    v11 = (void *)[v10 mutableCopy];

    uint64_t v46 = [v4 objectForKeyedSubscript:@"kCBMsgArgRssi"];
    v12 = [v11 objectForKeyedSubscript:@"kCBAdvDataServiceUUIDs"];
    if (v12)
    {
      int v13 = [(CBCentralManager *)self dataArrayToUUIDArray:v12];
      [v11 setObject:v13 forKeyedSubscript:@"kCBAdvDataServiceUUIDs"];
    }
    uint64_t v14 = [v11 objectForKeyedSubscript:@"kCBAdvDataSolicitedServiceUUIDs"];
    if (v14)
    {
      v15 = [(CBCentralManager *)self dataArrayToUUIDArray:v14];
      [v11 setObject:v15 forKeyedSubscript:@"kCBAdvDataSolicitedServiceUUIDs"];
    }
    SEL v45 = (void *)v14;
    v16 = [v11 objectForKeyedSubscript:@"kCBAdvDataHashedServiceUUIDs"];
    if (v16)
    {
      v17 = [(CBCentralManager *)self dataArrayToUUIDArray:v16];
      [v11 setObject:v17 forKeyedSubscript:@"kCBAdvDataHashedServiceUUIDs"];
    }
    v18 = [v4 objectForKey:@"kCBScanOptionFilterIdentifier"];

    if (v18)
    {
      v19 = NSNumber;
      v20 = [v4 objectForKeyedSubscript:@"kCBScanOptionFilterIdentifier"];
      v21 = objc_msgSend(v19, "numberWithUnsignedLongLong:", objc_msgSend(v20, "unsignedLongLongValue"));
      [v11 setObject:v21 forKeyedSubscript:@"kCBScanOptionFilterIdentifier"];
    }
    v22 = [v4 objectForKey:@"kCBScanOptionFilterIdentifierString"];

    if (v22)
    {
      uint64_t v23 = [v4 objectForKeyedSubscript:@"kCBScanOptionFilterIdentifierString"];
      [v11 setObject:v23 forKeyedSubscript:@"kCBScanOptionFilterIdentifierString"];
    }
    v24 = @"kCBAdvDataServiceData";
    v47 = [v11 objectForKeyedSubscript:@"kCBAdvDataServiceData"];
    if (v47)
    {
      uint64_t v42 = v7;
      v43 = v12;
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v26 = v47;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        int v39 = @"kCBAdvDataServiceData";
        int v40 = v16;
        v41 = v5;
        unint64_t v29 = 0;
        uint64_t v30 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            while (1)
            {
              if (*(void *)v49 != v30) {
                objc_enumerationMutation(v26);
              }
              uint64_t v32 = *(void *)(*((void *)&v48 + 1) + 8 * i);
              if (v29) {
                break;
              }
              unint64_t v29 = +[CBUUID UUIDWithData:v32];
              if (v28 == ++i) {
                goto LABEL_17;
              }
            }
            [v25 setObject:v32 forKeyedSubscript:v29];

            unint64_t v29 = 0;
          }
LABEL_17:
          uint64_t v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v52, 16, v39, v40, v41);
        }
        while (v28);

        v16 = v40;
        uint64_t v5 = v41;
        v24 = v39;
      }

      [v11 setObject:v25 forKeyedSubscript:v24];
      uint64_t v7 = v42;
      v12 = v43;
    }
    if (v44)
    {
      v35 = v45;
      v36 = (void *)v46;
      if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x40) == 0)
      {
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v37 setObject:v5 forKeyedSubscript:@"kCBMsgArgAdvertisementPeripheral"];
      [v37 setObject:v46 forKeyedSubscript:@"kCBMsgArgRssi"];
      [v37 setObject:v11 forKeyedSubscript:@"kCBMsgArgAdvertisementData"];
      [(NSMutableArray *)self->_discoveredPeripherals addObject:v37];
      if (!v7)
      {
        v38 = [(CBCentralManager *)self delegate];
        [v38 centralManager:self didDiscoverMultiplePeripherals:self->_discoveredPeripherals];

        [(NSMutableArray *)self->_discoveredPeripherals removeAllObjects];
      }
      v36 = (void *)v46;
    }
    else
    {
      id v37 = [(CBCentralManager *)self delegate];
      v36 = (void *)v46;
      [v37 centralManager:self didDiscoverPeripheral:v5 advertisementData:v11 RSSI:v46];
    }

    v35 = v45;
    goto LABEL_39;
  }
LABEL_41:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_opt_class() == a6)
  {
    if ([v10 isEqualToString:@"state"])
    {
      if ([(CBManager *)self state] != CBManagerStatePoweredOn && [(CBManager *)self state] != 10)
      {
        [(CBCentralManager *)self setIsScanning:0];
        [(CBCentralManager *)self forEachPeripheral:&__block_literal_global_25];
        if ([(CBManager *)self state] == CBManagerStateResetting) {
          [(CBCentralManager *)self orphanPeripherals];
        }
      }
      int v13 = [(CBCentralManager *)self delegate];
      [v13 centralManagerDidUpdateState:self];
    }
    else
    {
      if (![v10 isEqualToString:@"delegate"]) {
        goto LABEL_90;
      }
      uint64_t v14 = [(CBCentralManager *)self delegate];
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);

      v15 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v16 = 2;
      }
      else {
        int v16 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFD | v16);

      v17 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v18 = 4;
      }
      else {
        int v18 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFB | v18);

      v19 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v20 = 8;
      }
      else {
        int v20 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFF7 | v20);

      v21 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v22 = 16;
      }
      else {
        int v22 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFEF | v22);

      uint64_t v23 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v24 = 32;
      }
      else {
        int v24 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFDF | v24);

      id v25 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v26 = 64;
      }
      else {
        int v26 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFBF | v26);

      uint64_t v27 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v28 = 128;
      }
      else {
        int v28 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFF7F | v28);

      unint64_t v29 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v30 = 256;
      }
      else {
        int v30 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFEFF | v30);

      v31 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v32 = 512;
      }
      else {
        int v32 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFDFF | v32);

      uint64_t v33 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v34 = 1024;
      }
      else {
        int v34 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFBFF | v34);

      v35 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v36 = 2048;
      }
      else {
        int v36 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFF7FF | v36);

      id v37 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v38 = 4096;
      }
      else {
        int v38 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFEFFF | v38);

      int v39 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v40 = 0x2000;
      }
      else {
        int v40 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFDFFF | v40);

      v41 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v42 = 0x4000;
      }
      else {
        int v42 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFBFFF | v42);

      v43 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v44 = 0x8000;
      }
      else {
        int v44 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFF7FFF | v44);

      SEL v45 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v46 = 0x10000;
      }
      else {
        int v46 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFEFFFF | v46);

      v47 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v48 = 0x20000;
      }
      else {
        int v48 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFDFFFF | v48);

      long long v49 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v50 = 0x40000;
      }
      else {
        int v50 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFBFFFF | v50);

      long long v51 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v52 = 0x80000;
      }
      else {
        int v52 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFF7FFFF | v52);

      uint64_t v53 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v54 = 0x100000;
      }
      else {
        int v54 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFEFFFFF | v54);

      v55 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v56 = 0x200000;
      }
      else {
        int v56 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFDFFFFF | v56);

      v57 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v58 = 0x400000;
      }
      else {
        int v58 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFBFFFFF | v58);

      v59 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v60 = 0x800000;
      }
      else {
        int v60 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFF7FFFFF | v60);

      v61 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v62 = 0x1000000;
      }
      else {
        int v62 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFEFFFFFF | v62);

      v63 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v64 = 0x2000000;
      }
      else {
        int v64 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFDFFFFFF | v64);

      int v13 = [(CBCentralManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        int v65 = 0x4000000;
      }
      else {
        int v65 = 0;
      }
      self->_$07E581FC71E438F638AFE4D881A2E6BE delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFBFFFFFF | v65);
    }

    goto LABEL_90;
  }
  v66.receiver = self;
  v66.super_class = (Class)CBCentralManager;
  [(CBCentralManager *)&v66 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_90:
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  switch((int)v4)
  {
    case 16:
    case 17:
    case 18:
      id v12 = [(CBManager *)self sharedPairingAgent];
      [v12 handlePairingMessage:v4 args:v7];

      return;
    case 23:
    case 24:
    case 165:
    case 166:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 185:
    case 189:
    case 190:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 203:
    case 204:
      goto LABEL_2;
    case 29:
      [(CBCentralManager *)self handleSupportedFeatures:v6];

      return;
    case 56:
      int v11 = 0;
      uint64_t v8 = sel_handleReadyForUpdates_;
      goto LABEL_4;
    case 59:
      uint64_t v8 = sel_handleAdvertisingAddressChanged_;
      goto LABEL_29;
    case 84:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralDiscovered_;
      goto LABEL_4;
    case 85:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralConnectionCompleted_;
      goto LABEL_4;
    case 86:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralCLReady_;
      goto LABEL_4;
    case 87:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralDisconnectionCompleted_;
      goto LABEL_4;
    case 88:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralConnectionStateUpdated_;
      goto LABEL_4;
    case 89:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralTrackingUpdated_;
      goto LABEL_4;
    case 90:
      int v11 = 0;
      uint64_t v8 = sel_handleZoneLost_;
      goto LABEL_4;
    case 91:
      int v11 = 0;
      uint64_t v8 = sel_handleApplicationActivityEvent_;
      goto LABEL_4;
    case 92:
      uint64_t v8 = sel_handleRestoringState_;
LABEL_29:
      int v11 = 1;
      goto LABEL_4;
    case 94:
      int v11 = 0;
      uint64_t v8 = sel_handleApplicationConnectionEventDidOccur_;
      goto LABEL_4;
    case 110:
      [(CBCentralManager *)self handleAncsAuthChanged:v6];

      return;
    case 129:
      int v11 = 0;
      uint64_t v8 = sel_handleScanFailedToStartWithError_;
      goto LABEL_4;
    case 133:
      [(CBCentralManager *)self handleScanComplete:v6];

      return;
    case 134:
      [(CBCentralManager *)self handleScanParamsUpdated:v6];

      return;
    case 135:
      [(CBCentralManager *)self handleFindMyDevicesUpdated:v6];

      return;
    case 136:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralInvalidated_;
      goto LABEL_4;
    case 138:
      int v11 = 0;
      uint64_t v8 = sel_handleDidSendBytesToPeripheralwithError_;
      goto LABEL_4;
    case 139:
      int v11 = 0;
      uint64_t v8 = sel_handleDidReceiveDataFromPeripheral_;
      goto LABEL_4;
    case 164:
      uint64_t v8 = sel_handlePeerMTUChanged_;
LABEL_2:
      uint64_t v9 = [v6 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
      id v10 = [(CBCentralManager *)self peripheralWithIdentifier:v9];

      [v10 handleMsg:v4 args:v7];
      if (v4 != 164) {
        goto LABEL_7;
      }
      int v11 = 0;
LABEL_4:
      if ([(CBManager *)self state] == CBManagerStatePoweredOn
        || (([(CBManager *)self state] != 10) & ~v11) == 0)
      {
        objc_msgSend(self, v8, v7);
LABEL_7:

        return;
      }
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      -[CBCentralManager handleMsg:args:]();

      return;
    case 167:
      int v11 = 0;
      uint64_t v8 = sel_handleConnectionParametersUpdated_;
      goto LABEL_4;
    case 210:
      int v11 = 0;
      uint64_t v8 = sel_HandleControllerBTClockUpdateMsg_;
      goto LABEL_4;
    case 213:
      int v11 = 0;
      uint64_t v8 = sel_handleUpdateUsageNotificationForPeripheral_;
      goto LABEL_4;
    case 214:
      int v11 = 0;
      uint64_t v8 = sel_HandleRssiDetectionUpdateMsg_;
      goto LABEL_4;
    case 215:
      int v11 = 0;
      uint64_t v8 = sel_HandleBluetoothUsageEventMsg_;
      goto LABEL_4;
    case 216:
      int v11 = 0;
      uint64_t v8 = sel_HandleBluetoothPhyStatisticEventMsg_;
      goto LABEL_4;
    case 221:
      int v11 = 0;
      uint64_t v8 = sel_HandleCSProcedureEventMsg_;
      goto LABEL_4;
    default:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      int v13 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      -[CBCentralManager handleMsg:args:](v4, v13);

      return;
  }
}

- (void)handleSupportedFeatures:(id)a3
{
  gSupportedFeatures = 0;
  id v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgSupportedFeatures"];
  uint64_t v3 = [v4 objectForKey:@"kCBMsgArgSupportsExtendedScanAndConnect"];

  if (v3) {
    gSupportedFeatures = 1;
  }
}

- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v12 = @"kCBInitOptionShowPowerAlert";
  v13[0] = MEMORY[0x1E4F1CC38];
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v7 = queue;
  id v8 = delegate;
  uint64_t v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = [(CBCentralManager *)self initWithDelegate:v8 queue:v7 options:v9];

  return v10;
}

- (id)peripheralWithIdentifier:(id)a3
{
  return [(NSMapTable *)self->_peripherals objectForKey:a3];
}

- (void)powerAssertionNearCompletion
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.bluetooth.powerAssertion.end" object:self];
}

void __37__CBCentralManager_orphanPeripherals__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    __37__CBCentralManager_orphanPeripherals__block_invoke_cold_1();
  }
  [v2 handleDisconnection];
  [v2 setOrphan];
}

- (id)dataArrayToUUIDArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __67__CBCentralManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleDisconnection];
}

- (CBCentralManager)init
{
  return [(CBCentralManager *)self initWithDelegate:0 queue:0];
}

- (void)retrievePeripherals:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(CBCentralManager *)self retrievePeripheralsWithIdentifiers:v4];
    uint64_t v8 = [(CBManager *)self getCurrentQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__CBCentralManager_retrievePeripherals___block_invoke;
    v10[3] = &unk_1E5E31068;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_async(v8, v10);
  }
}

void __40__CBCentralManager_retrievePeripherals___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 centralManager:*(void *)(a1 + 32) didRetrievePeripherals:*(void *)(a1 + 40)];
}

- (id)retrievePairingInfoForPeripheral:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CBCentralManager.m", 418, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  id v11 = @"kCBMsgArgDeviceUUID";
  char v6 = [v5 identifier];
  v12[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v8 = [(CBManager *)self sendSyncMsg:111 args:v7];

  return v8;
}

- (id)createCBPeripheralsFromIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)retrievePeripheralsWithIdentifiers:(NSArray *)identifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = identifiers;
  if (!v5)
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"CBCentralManager.m", 437, @"Invalid parameter not satisfying: %@", @"identifiers != nil" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = v5;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        while (1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          long long v14 = [(CBCentralManager *)self peripheralWithIdentifier:v13];
          if (v14) {
            break;
          }
          [v7 addObject:v13];

          if (v10 == ++i) {
            goto LABEL_5;
          }
        }
        [v6 addObject:v14];
      }
LABEL_5:
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    id v25 = @"kCBMsgArgUUIDs";
    id v26 = v7;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    long long v16 = [(CBManager *)self sendSyncMsg:63 args:v15];

    uint64_t v17 = [v16 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    uint64_t v18 = [(CBCentralManager *)self createCBPeripheralsFromIDs:v17];
    [v6 addObjectsFromArray:v18];
  }

  return (NSArray *)v6;
}

- (void)retrievePeripheralsWithIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"CBCentralManager.m", 463, @"Invalid parameter not satisfying: %@", @"identifiers != nil" object file lineNumber description];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        while (1)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v17 = [(CBCentralManager *)self peripheralWithIdentifier:v16];
          if (v17) {
            break;
          }
          [v10 addObject:v16];

          if (v13 == ++i) {
            goto LABEL_5;
          }
        }
        [v9 addObject:v17];
      }
LABEL_5:
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    id v37 = @"kCBMsgArgUUIDs";
    id v38 = v10;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke;
    v30[3] = &unk_1E5E31090;
    v19 = (id *)v31;
    v31[0] = v9;
    v31[1] = self;
    id v32 = v8;
    id v20 = v8;
    id v21 = v9;
    [(CBManager *)self sendMsg:63 args:v18 withReply:v30];

    long long v22 = v32;
  }
  else
  {
    long long v23 = [(CBManager *)self getCurrentQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke_2;
    block[3] = &unk_1E5E310B8;
    v19 = &v29;
    id v28 = v9;
    id v29 = v8;
    id v24 = v8;
    id v25 = v9;
    dispatch_async(v23, block);

    long long v22 = v28;
  }
}

uint64_t __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v4 = [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(a1 + 32);
          id v10 = [*(id *)(a1 + 40) peripheralWithInfo:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
          [v9 addObject:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)retrieveConnectionHandleWithIdentifier:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBCentralManager.m", 498, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  long long v14 = @"kCBMsgArgUUID";
  v15[0] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __70__CBCentralManager_retrieveConnectionHandleWithIdentifier_completion___block_invoke;
  v12[3] = &unk_1E5E310E0;
  id v13 = v8;
  id v10 = v8;
  [(CBManager *)self sendMsg:64 args:v9 withReply:v12];
}

void __70__CBCentralManager_retrieveConnectionHandleWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = [v14 objectForKeyedSubscript:@"kCBMsgArgConnectionHandle"];

  if (v6)
  {
    id v7 = [v14 objectForKeyedSubscript:@"kCBMsgArgConnectionHandle"];
    [v7 unsignedShortValue];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = [v5 userInfo];
    id v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = MEMORY[0x1E4F1CC08];
    }
    id v13 = [v9 errorWithInfo:v12];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v13);
  }
}

- (void)retrievePeripheralsWithTags:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 516, @"Invalid parameter not satisfying: %@", @"tags != nil" object file lineNumber description];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = @"kCBMsgArgTags";
  v19[0] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CBCentralManager_retrievePeripheralsWithTags_completion___block_invoke;
  v14[3] = &unk_1E5E31090;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  [(CBManager *)self sendMsg:65 args:v10 withReply:v14];
}

void __59__CBCentralManager_retrievePeripheralsWithTags_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(a1 + 32);
        id v9 = [*(id *)(a1 + 40) peripheralWithInfo:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)retrievePeripheralsWithCustomProperties:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 534, @"Invalid parameter not satisfying: %@", @"properties != nil" object file lineNumber description];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = @"kCBMsgArgCustomProperties";
  v19[0] = v7;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__CBCentralManager_retrievePeripheralsWithCustomProperties_completion___block_invoke;
  v14[3] = &unk_1E5E31090;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  [(CBManager *)self sendMsg:66 args:v10 withReply:v14];
}

void __71__CBCentralManager_retrievePeripheralsWithCustomProperties_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(a1 + 32);
        id v9 = [*(id *)(a1 + 40) peripheralWithInfo:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)retrieveState
{
  id v2 = [(CBManager *)self sendSyncMsg:207 args:0];
  id v3 = [v2 objectForKeyedSubscript:@"kCBMsgArgs"];

  return v3;
}

- (void)retrieveConnectedPeripherals
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(CBCentralManager *)self retrieveConnectedPeripheralsWithServices:MEMORY[0x1E4F1CBF0]];
    uint64_t v6 = [(CBManager *)self getCurrentQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__CBCentralManager_retrieveConnectedPeripherals__block_invoke;
    v8[3] = &unk_1E5E31068;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    dispatch_async(v6, v8);
  }
}

void __48__CBCentralManager_retrieveConnectedPeripherals__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 centralManager:*(void *)(a1 + 32) didRetrieveConnectedPeripherals:*(void *)(a1 + 40)];
}

- (NSArray)retrieveConnectedPeripheralsWithServices:(NSArray *)serviceUUIDs
{
  uint64_t v5 = serviceUUIDs;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 567, @"Invalid parameter not satisfying: %@", @"serviceUUIDs != nil" object file lineNumber description];
  }
  uint64_t v6 = [(CBCentralManager *)self retrieveConnectedPeripheralsWithServices:v5 allowAll:0];

  return (NSArray *)v6;
}

- (id)retrieveConnectedPeripheralsWithServices:(id)a3 allowAll:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v6 = a3;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  v15[0] = @"kCBMsgArgUUIDs";
  v15[1] = @"kCBMsgArgState";
  v16[0] = v6;
  id v7 = NSNumber;
  id v8 = a3;
  id v9 = [v7 numberWithBool:v4];
  v16[1] = v9;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  long long v11 = [(CBManager *)self sendSyncMsg:67 args:v10];

  long long v12 = [v11 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  long long v13 = [(CBCentralManager *)self createCBPeripheralsFromIDs:v12];

  return v13;
}

- (void)retrieveConnectedPeripheralsWithServices:(id)a3 completion:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (id)MEMORY[0x1E4F1CBF0];
  if (a3) {
    id v7 = a3;
  }
  v14[0] = @"kCBMsgArgUUIDs";
  v14[1] = @"kCBMsgArgState";
  v15[0] = v7;
  v15[1] = MEMORY[0x1E4F1CC38];
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a3;
  long long v10 = [v8 dictionaryWithObjects:v15 forKeys:v14 count:2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __72__CBCentralManager_retrieveConnectedPeripheralsWithServices_completion___block_invoke;
  v12[3] = &unk_1E5E31108;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(CBManager *)self sendMsg:67 args:v10 withReply:v12];
}

void __72__CBCentralManager_retrieveConnectedPeripheralsWithServices_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  BOOL v4 = [v3 createCBPeripheralsFromIDs:v5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)retrievePeripheralsWithFindMySerialNumbers:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = [NSString alloc];
        uint64_t v16 = objc_msgSend(v15, "initWithData:encoding:", v14, 4, (void)v17);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(CBCentralManager *)self retrievePeripheralsWithFindMySerialNumberStrings:v8 completion:v7];
}

- (void)retrievePeripheralsWithFindMySerialNumberStrings:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v14 = @"kCBMsgArgFindMySerialNumberString";
  if (a3) {
    id v7 = a3;
  }
  else {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  v15[0] = v7;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a3;
  uint64_t v10 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __80__CBCentralManager_retrievePeripheralsWithFindMySerialNumberStrings_completion___block_invoke;
  v12[3] = &unk_1E5E31108;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(CBManager *)self sendMsg:69 args:v10 withReply:v12];
}

void __80__CBCentralManager_retrievePeripheralsWithFindMySerialNumberStrings_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  BOOL v4 = [v3 createCBPeripheralsFromIDs:v5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)retrievePeripheralsWithFindMyIds:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v14 = @"kCBMsgArgUUIDs";
  if (a3) {
    id v7 = a3;
  }
  else {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  v15[0] = v7;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a3;
  uint64_t v10 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __64__CBCentralManager_retrievePeripheralsWithFindMyIds_completion___block_invoke;
  v12[3] = &unk_1E5E31108;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(CBManager *)self sendMsg:70 args:v10 withReply:v12];
}

void __64__CBCentralManager_retrievePeripheralsWithFindMyIds_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  BOOL v4 = [v3 createCBPeripheralsFromIDs:v5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (id)retrieveConnectingPeripherals
{
  id v3 = [(CBManager *)self sendSyncMsg:68 args:0];
  BOOL v4 = [v3 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  id v5 = [(CBCentralManager *)self createCBPeripheralsFromIDs:v4];

  return v5;
}

- (void)scanForPeripheralsWithServices:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)MEMORY[0x1AD111AA0](a5);
  id scanCompletion = self->_scanCompletion;
  self->_id scanCompletion = v10;

  id v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];

  [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kCBMsgArgHasCompletionBlock"];
  [(CBCentralManager *)self _scanForPeripheralsWithServices:v9 options:v12];
}

- (void)connectPeripheral:(CBPeripheral *)peripheral options:(NSDictionary *)options
{
  id v7 = peripheral;
  id v8 = options;
  id v9 = [(NSDictionary *)v8 valueForKey:@"kCBConnectOptionAutoReconnect"];

  if (!v9 || ($07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags, (*(unsigned char *)&delegateFlags & 0x20) != 0))
  {
    if (!v7)
    {
      long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"CBCentralManager.m", 673, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__CBCentralManager_connectPeripheral_options___block_invoke;
    v18[3] = &unk_1E5E31130;
    v18[4] = self;
    id v13 = v7;
    long long v19 = v13;
    uint64_t v14 = v8;
    long long v20 = v14;
    id v15 = (void (**)(void))MEMORY[0x1AD111AA0](v18);
    uint64_t v16 = [(NSDictionary *)v14 valueForKey:@"kCBConnectOptionUseWHB"];

    if (v16) {
      [(CBCentralManager *)self connectWhbCBPeripheral:v13 withCompletion:v15];
    }
    else {
      v15[2](v15);
    }
  }
  else if ((*(unsigned char *)&delegateFlags & 8) != 0)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithInfo:&unk_1F0302188];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained centralManager:self didFailToConnectPeripheral:v7 error:v11];
  }
}

void __46__CBCentralManager_connectPeripheral_options___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  BOOL v4 = (void *)v3;
  v9[1] = @"kCBMsgArgOptions";
  uint64_t v5 = *(void *)(a1 + 48);
  if (!v5) {
    uint64_t v5 = MEMORY[0x1E4F1CC08];
  }
  v10[0] = v3;
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  int v7 = [v2 sendMsg:73 args:v6];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) state];
    if (v8 == 3 || !v8) {
      [*(id *)(a1 + 40) setState:1];
    }
  }
}

- (void)enableMrc:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 702, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  uint64_t v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:220 args:v12];
}

- (id)retrieveWhbCBPeripheralWithInfo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgWhbStableIdentifier"];
  id v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];
  if (v6)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v8 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v5;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_1AB9F0000, v8, OS_LOG_TYPE_DEFAULT, "Retrieving peripheral for device:%@ with info %@", buf, 0x16u);
    }
    id v24 = @"kCBMsgArgWhbStableIdentifier";
    id v25 = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v10 = [(CBManager *)self sendSyncMsg:146 args:v9];

    id v11 = [v10 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    if (!v11)
    {
      id v13 = [(CBCentralManager *)self peripheralWithIdentifier:v5];
      if (!v13)
      {
        id v13 = [(CBCentralManager *)self peripheralWithInfo:v4];
      }
      [v13 setStableIdentifier:v6];
      [v13 setRemoteControllerId:v7];
      if (CBLogInitOnce == -1)
      {
        uint64_t v19 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
      }
      else
      {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        uint64_t v19 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v5;
      id v15 = "Retrieved non local peripheral successfully for device:%@";
      uint64_t v16 = v19;
      uint32_t v17 = 12;
      goto LABEL_21;
    }
    id v12 = [(CBCentralManager *)self peripheralWithIdentifier:v11];
    if (v12)
    {
      id v13 = v12;
      [v12 setStableIdentifier:v6];
      if (CBLogInitOnce != -1)
      {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        uint64_t v14 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        goto LABEL_10;
      }
      uint64_t v14 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v11;
        __int16 v28 = 2112;
        id v29 = v5;
        id v15 = "Retrieved local peripheral:%@ successfully for device:%@";
        uint64_t v16 = v14;
        uint32_t v17 = 22;
LABEL_21:
        _os_log_impl(&dword_1AB9F0000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
LABEL_22:
      id v18 = v13;
LABEL_27:

      goto LABEL_28;
    }
    long long v20 = (void *)[v4 mutableCopy];
    [v20 setObject:v11 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    [v20 setObject:0 forKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];
    id v21 = [(CBCentralManager *)self peripheralWithInfo:v20];
    [v21 setStableIdentifier:v6];
    if (CBLogInitOnce == -1)
    {
      uint64_t v22 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        id v18 = v21;

        goto LABEL_27;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      uint64_t v22 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_1AB9F0000, v22, OS_LOG_TYPE_DEFAULT, "Created local peripheral:%@ successfully for device:%@", buf, 0x16u);
    goto LABEL_26;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBCentralManager retrieveWhbCBPeripheralWithInfo:]();
  }
  id v18 = 0;
LABEL_28:

  return v18;
}

- (void)activateWhbCnxForCBPeripheral:(id)a3 infoDict:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  uint64_t v9 = [(CBManager *)self getCnxInstanceForIdentifier:v8];

  if (v9)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBCentralManager activateWhbCnxForCBPeripheral:infoDict:]();
    }
  }
  else
  {
    uint64_t v9 = [(CBManager *)self createCnxWithInfo:v7];
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    uint64_t v10 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v7;
      _os_log_impl(&dword_1AB9F0000, v10, OS_LOG_TYPE_DEFAULT, "Setup WHB cnx: infoDict %@", buf, 0xCu);
    }
    id v11 = [v6 identifier];
    id v12 = [v9 peerDevice];
    id v13 = [v12 identifier];
    [(CBManager *)self setWhbLocalId:v11 forRemoteId:v13];
  }
  uint64_t v14 = [v9 peerDevice];
  id v15 = [v14 identifier];

  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
  int v17 = (*(unsigned int *)&delegateFlags >> 3) & 1;
  int v18 = (*(unsigned int *)&delegateFlags >> 4) & 1;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke;
  v27[3] = &unk_1E5E31158;
  v27[4] = self;
  id v19 = v6;
  id v28 = v19;
  id v20 = v15;
  id v29 = v20;
  int v30 = v18;
  [v9 setInterruptionHandler:v27];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_214;
  v23[3] = &unk_1E5E31180;
  v23[4] = self;
  id v24 = v19;
  id v25 = v20;
  int v26 = v17;
  id v21 = v20;
  id v22 = v19;
  [v9 activateWithCompletion:v23];
}

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke(uint64_t a1)
{
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_cold_1();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [v2 removeCnxInstanceForIdentifier:v3];

  [*(id *)(a1 + 32) removeWhbRemoteId:*(void *)(a1 + 48)];
  if (*(_DWORD *)(a1 + 56))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithInfo:&unk_1F03021B0];
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    [v5 centralManager:*(void *)(a1 + 32) didDisconnectPeripheral:*(void *)(a1 + 40) error:v4];
  }
}

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_214(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1AB9F0000, v4, OS_LOG_TYPE_DEFAULT, "Got WHB CBConnection completed with error %@", (uint8_t *)&v8, 0xCu);
  }
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) identifier];
    [v5 removeCnxInstanceForIdentifier:v6];

    [*(id *)(a1 + 32) removeWhbRemoteId:*(void *)(a1 + 48)];
    if (*(_DWORD *)(a1 + 56))
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 centralManager:*(void *)(a1 + 32) didFailToConnectPeripheral:*(void *)(a1 + 40) error:v3];
    }
  }
}

- (void)connectWhbCBPeripheral:(id)a3 withCompletion:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 remoteControllerId];
  if (v8)
  {
  }
  else
  {
    id v9 = [v6 stableIdentifier];

    if (!v9)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
        -[CBCentralManager connectWhbCBPeripheral:withCompletion:]();
        if ((*(unsigned char *)&self->_delegateFlags & 8) == 0) {
          goto LABEL_13;
        }
      }
      else if ((*(unsigned char *)&self->_delegateFlags & 8) == 0)
      {
        goto LABEL_13;
      }
      id v13 = [MEMORY[0x1E4F28C58] errorWithInfo:&unk_1F03021D8];
      id v19 = [(CBCentralManager *)self delegate];
      [v19 centralManager:self didFailToConnectPeripheral:v6 error:v13];
      goto LABEL_11;
    }
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA60];
  id v32 = @"kCBMsgArgDeviceUUID";
  id v11 = [v6 identifier];
  v33[0] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  id v13 = [v10 dictionaryWithDictionary:v12];

  uint64_t v14 = [v6 remoteControllerId];

  if (v14)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v15 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      int v17 = [v6 remoteControllerId];
      *(_DWORD *)buf = 138412290;
      v31 = v17;
      _os_log_impl(&dword_1AB9F0000, v16, OS_LOG_TYPE_DEFAULT, "Setting up WhbCnx using manually entered remoteControllerId %@", buf, 0xCu);
    }
    int v18 = [v6 remoteControllerId];
    [v13 setValue:v18 forKey:@"kCBMsgArgWhbRemoteControllerId"];

    [(CBCentralManager *)self activateWhbCnxForCBPeripheral:v6 infoDict:v13];
    goto LABEL_12;
  }
  id v19 = [v6 stableIdentifier];
  int v20 = (*(_DWORD *)&self->_delegateFlags >> 3) & 1;
  id v28 = @"kCBMsgArgWhbStableIdentifier";
  id v29 = v19;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__CBCentralManager_connectWhbCBPeripheral_withCompletion___block_invoke;
  v22[3] = &unk_1E5E311A8;
  int v27 = v20;
  id v23 = v6;
  id v24 = self;
  id v26 = v7;
  id v13 = v13;
  id v25 = v13;
  [(CBManager *)self sendMsg:145 args:v21 withReply:v22];

LABEL_11:
LABEL_12:

LABEL_13:
}

void __58__CBCentralManager_connectWhbCBPeripheral_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteDeviceUUID"];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v6 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1AB9F0000, v6, OS_LOG_TYPE_DEFAULT, "Whb connect request to p %@, routing via %@", (uint8_t *)&v10, 0x16u);
  }
  if (v4)
  {
    if ([v4 isEqualToString:@"CBLocalHostID"])
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      [*(id *)(a1 + 48) setValue:v4 forKey:@"kCBMsgArgWhbRemoteControllerId"];
      if (v5) {
        [*(id *)(a1 + 48) setValue:v5 forKey:@"kCBMsgArgWhbRemoteDeviceUUID"];
      }
      [*(id *)(a1 + 40) activateWhbCnxForCBPeripheral:*(void *)(a1 + 32) infoDict:*(void *)(a1 + 48)];
    }
  }
  else if (*(_DWORD *)(a1 + 64))
  {
    int v8 = [MEMORY[0x1E4F28C58] errorWithInfo:v3];
    id v9 = [*(id *)(a1 + 40) delegate];
    [v9 centralManager:*(void *)(a1 + 40) didFailToConnectPeripheral:*(void *)(a1 + 32) error:v8];
  }
}

- (void)randomizeAFHMapForPeripheral:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 854, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  id v9 = @"kCBMsgArgDeviceUUID";
  id v6 = [v5 identifier];
  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(CBManager *)self sendMsg:99 args:v7];
}

- (void)setLeAFHMap:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CBCentralManager.m", 861, @"Invalid parameter not satisfying: %@", @"map != nil" object file lineNumber description];
  }
  int v8 = @"kCBMsgArgLeAFHMap";
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [(CBManager *)self sendMsg:100 args:v6];
}

- (void)setHostState:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"kCBMsgArgState";
  id v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(CBManager *)self sendDebugMsg:1 args:v5];
}

- (void)setLePowerControl:(id)a3 options:(id)a4 completion:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a4) {
    id v9 = a4;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }
  v16[0] = @"kCBMsgArgOptions";
  v16[1] = @"kCBMsgArgDeviceUUID";
  v17[0] = v9;
  id v10 = a4;
  uint64_t v11 = [a3 identifier];
  v17[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __57__CBCentralManager_setLePowerControl_options_completion___block_invoke;
  v14[3] = &unk_1E5E310E0;
  id v15 = v8;
  id v13 = v8;
  [(CBManager *)self sendMsg:219 args:v12 withReply:v14];
}

uint64_t __57__CBCentralManager_setLePowerControl_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)wipeDuplicateFilterList:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:101 args:v7];
}

- (void)addAdvancedMatchingRule:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:108 args:v7];
}

- (void)removeAdvancedMatchingRule:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:109 args:v7];
}

- (void)setEnhancedScanEnable:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:106 args:v7];
}

- (void)setEnhancedSetScanParamtersMultiCore:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:107 args:v7];
}

- (void)removeSingleEntryDuplicateFilter:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"kCBMsgArgOptions";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [(CBManager *)self sendMsg:102 args:v6];
}

- (void)removeMultipleEntriesDuplicateFilter:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"kCBMsgArgOptions";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [(CBManager *)self sendMsg:103 args:v6];
}

- (void)clearDuplicateFilterCache:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"kCBMsgArgOptions";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [(CBManager *)self sendMsg:104 args:v6];
}

- (unsigned)getTotalSupportedAdvancedMatchingRules
{
  uint64_t v2 = [(CBManager *)self sendSyncMsg:105 args:0];
  id v3 = [v2 valueForKey:@"kCBScanOptionTotalAdvMatchingRules"];
  unsigned __int16 v4 = [v3 intValue];

  return v4;
}

- (unsigned)getRemainingAdvancedMatchingRule
{
  uint64_t v2 = [(CBManager *)self sendSyncMsg:105 args:MEMORY[0x1E4F1CC08]];
  id v3 = [v2 valueForKey:@"kCBScanOptionRemainingAdvMatchingRules"];
  unsigned __int16 v4 = [v3 intValue];

  return v4;
}

- (void)setDataLengthChange:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 954, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:113 args:v12];
}

- (void)csReadLocalSupportedCapabilities
{
  id v2 = [(CBManager *)self sendSyncMsg:114 args:0];
}

- (void)csReadRemoteSupportedCapabilities:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 968, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  uint64_t v9 = @"kCBMsgArgDeviceUUID";
  id v6 = [v5 identifier];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(CBManager *)self sendMsg:115 args:v7];
}

- (void)csWriteCachedRemoteSupportedCapabilities:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 974, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:116 args:v12];
}

- (void)csSecurityEnable:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 981, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  uint64_t v9 = @"kCBMsgArgDeviceUUID";
  id v6 = [v5 identifier];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(CBManager *)self sendMsg:117 args:v7];
}

- (void)csTest:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 987, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  uint64_t v9 = @"kCBMsgArgDeviceUUID";
  id v6 = [v5 identifier];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(CBManager *)self sendMsg:118 args:v7];
}

- (void)csCreateConfig:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 993, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:119 args:v12];
}

- (void)csRemoveConfig:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1000, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:120 args:v12];
}

- (void)csProcedureEnable:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1007, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:121 args:v12];
}

- (void)csSetProcedureParams:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1014, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:122 args:v12];
}

- (void)csSetAfh:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:123 args:v7];
}

- (void)csSetDefaultSettings:(id)a3 options:(id)a4
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"kCBMsgArgDeviceUUID";
  id v6 = a4;
  uint64_t v7 = [a3 identifier];
  id v8 = (void *)v7;
  v11[1] = @"kCBMsgArgOptions";
  id v9 = (id)MEMORY[0x1E4F1CC08];
  if (v6) {
    id v9 = v6;
  }
  v12[0] = v7;
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  [(CBManager *)self sendMsg:124 args:v10];
}

- (void)csReadLocalFAETable
{
  id v2 = [(CBManager *)self sendSyncMsg:125 args:0];
}

- (void)csReadRemoteFAETable:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"kCBMsgArgDeviceUUID";
  id v4 = [a3 identifier];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(CBManager *)self sendMsg:126 args:v5];
}

- (void)csWriteRemoteFAETable:(id)a3 options:(id)a4
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"kCBMsgArgDeviceUUID";
  id v6 = a4;
  uint64_t v7 = [a3 identifier];
  id v8 = (void *)v7;
  v11[1] = @"kCBMsgArgOptions";
  id v9 = (id)MEMORY[0x1E4F1CC08];
  if (v6) {
    id v9 = v6;
  }
  v12[0] = v7;
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  [(CBManager *)self sendMsg:127 args:v10];
}

- (void)setLESetPhy:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1048, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:128 args:v12];
}

- (void)setRSSIStatisticsDetection:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1057, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:142 args:v12];
}

- (void)setBluetoothUsageNotifications:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1066, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:143 args:v12];
}

- (void)setBluetoothPhyStatisticsNotifications:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1075, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CBManager *)self sendMsg:144 args:v12];
}

- (void)cancelPeripheralConnection:(id)a3 options:(id)a4
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1084, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v15[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v15[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v11 = v8;
  }
  v16[0] = v9;
  v16[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  BOOL v13 = [(CBManager *)self sendMsg:74 args:v12];

  if (v13 && (unint64_t)([v7 state] - 1) <= 1) {
    [v7 setState:3];
  }
}

- (void)cancelPeripheralConnection:(CBPeripheral *)peripheral
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = peripheral;
  id v7 = [v4 dictionary];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  [v7 setObject:MEMORY[0x1E4F1CC28] forKey:@"kCBCancelConnectOptionForce"];
  [v7 setObject:v6 forKey:@"kCBCancelConnectOptionDoNotAutoConnectBuiltInServices"];
  [(CBCentralManager *)self cancelPeripheralConnection:v5 options:v7];
}

- (void)cancelPeripheralConnection:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1115, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = v7;
  uint64_t v9 = MEMORY[0x1E4F1CC28];
  if (v4) {
    uint64_t v10 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CC28];
  }
  [v7 setObject:v10 forKey:@"kCBCancelConnectOptionForce"];
  [v8 setObject:v9 forKey:@"kCBCancelConnectOptionDoNotAutoConnectBuiltInServices"];
  [(CBCentralManager *)self cancelPeripheralConnection:v12 options:v8];
}

- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4
{
  void v13[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1127, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v12[0] = @"kCBMsgArgDeviceUUID";
  id v8 = [v7 identifier];
  v13[0] = v8;
  v13[1] = MEMORY[0x1E4F1CC28];
  v12[1] = @"kCBMsgArgHasCompletionBlock";
  void v12[2] = @"kCBMsgArgConnectionLatency";
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  void v13[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  [(CBManager *)self sendMsg:163 args:v10];
}

- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4 completion:(id)a5
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1137, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  v18[0] = @"kCBMsgArgDeviceUUID";
  id v11 = [v9 identifier];
  v19[0] = v11;
  v19[1] = MEMORY[0x1E4F1CC38];
  v18[1] = @"kCBMsgArgHasCompletionBlock";
  v18[2] = @"kCBMsgArgConnectionLatency";
  id v12 = [NSNumber numberWithInteger:a3];
  void v19[2] = v12;
  BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __73__CBCentralManager_setDesiredConnectionLatency_forPeripheral_completion___block_invoke;
  void v16[3] = &unk_1E5E310E0;
  id v17 = v10;
  id v14 = v10;
  [(CBManager *)self sendMsg:163 args:v13 withReply:v16];
}

void __73__CBCentralManager_setDesiredConnectionLatency_forPeripheral_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithInfo:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)startTrackingPeripheral:(id)a3 options:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = v14;
  if (!v14)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1150, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];

    id v8 = 0;
  }
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = [v8 identifier];
  id v11 = v7;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  id v12 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"kCBMsgArgDeviceUUID", v11, @"kCBMsgArgOptions", 0);
  [(CBManager *)self sendMsg:205 args:v12];

  if (!v7) {
}
  }

- (void)stopTrackingPeripheral:(id)a3 options:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = v14;
  if (!v14)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1161, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];

    id v8 = 0;
  }
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = [v8 identifier];
  id v11 = v7;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  id v12 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"kCBMsgArgDeviceUUID", v11, @"kCBMsgArgOptions", 0);
  [(CBManager *)self sendMsg:206 args:v12];

  if (!v7) {
}
  }

- (void)enablePrivateModeForPeripheral:(id)a3 forDuration:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  void v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"kCBMsgArgPrivateModeTimeout";
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedShort:v4];
  v11[1] = @"kCBMsgArgDeviceUUID";
  v12[0] = v8;
  id v9 = [v7 identifier];

  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [(CBManager *)self sendMsg:42 args:v10];
}

- (void)enablePrivateModeForSessionWithIdentifier:(id)a3 forDuration:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  void v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"kCBMsgArgPrivateModeTimeout";
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedShort:v4];
  v10[1] = @"kCBMsgArgPrivateModeSessionIdentifier";
  v11[0] = v8;
  v11[1] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(CBManager *)self sendMsg:42 args:v9];
}

- (void)registerForConnectionEventsWithOptions:(NSDictionary *)options
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (options) {
    uint64_t v4 = options;
  }
  else {
    uint64_t v4 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v6 = options;
  id v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:93 args:v7];
}

- (void)pauseLeConnectionManager
{
}

- (void)resumeLeConnectionManager
{
}

- (void)pauseScans
{
}

- (void)resumeScans
{
}

- (void)sendData:(id)a3 toPeripheral:(id)a4
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"kCBMsgArgDeviceUUID";
  id v6 = a3;
  id v7 = [a4 identifier];
  v9[1] = @"kCBMsgArgObjectDiscoveryData";
  v10[0] = v7;
  v10[1] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  [(CBManager *)self sendMsg:137 args:v8];
}

- (void)setConnectionEventOptions:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:93 args:v7];
}

- (void)setMatchActionRules:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v8 = @"kCBMsgArgRules";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:112 args:v7];
}

+ (BOOL)supportsFeatures:(CBCentralManagerFeature)features
{
  return (features & ~(unint64_t)gSupportedFeatures) == 0;
}

- (id)startConnectionEventCounterForPeripheral:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v10 = @"kCBMsgArgDeviceUUID";
  id v5 = [a3 identifier];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = [(CBManager *)self sendSyncMsg:140 args:v6];
  id v8 = [v4 errorWithInfo:v7];

  return v8;
}

- (id)stopConnectionEventCounterForPeripheral:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v10 = @"kCBMsgArgDeviceUUID";
  id v5 = [a3 identifier];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = [(CBManager *)self sendSyncMsg:141 args:v6];
  id v8 = [v4 errorWithInfo:v7];

  return v8;
}

- (id)isApplicationConnectedToAnyPeripherals:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = @"kCBMsgArgAnyConnectedPeripheralsPerApp";
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(CBManager *)self sendSyncMsg:78 args:v6];

  return v7;
}

- (void)createOfflineLEPairing:(unsigned __int16)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"kCBMsgArgDevices";
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(CBManager *)self sendMsg:79 args:v5];
}

- (id)getLPEMData:(id)a3
{
  id v4 = a3;
  id v5 = [(CBManager *)self sendSyncMsg:211 args:MEMORY[0x1E4F1CC08]];
  id v6 = [v5 objectForKeyedSubscript:@"kCBMsgArgLPEMData"];
  [v4 setData:v6];

  id v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v5];

  return v7;
}

- (unsigned)retrieveMaxConnectionForUsecase:(unsigned int)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = @"kCBMsgArgUseCase";
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = [(CBManager *)self sendSyncMsg:80 args:v5];

  id v7 = [v6 objectForKeyedSubscript:@"kCBMsgArgUsecaseCount"];
  LOWORD(self) = [v7 intValue];

  return (unsigned __int16)self;
}

- (id)retrieveAddressForPeripheral:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1264, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }
  id v12 = @"kCBMsgArgDeviceUUID";
  id v6 = [v5 identifier];
  v13[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v8 = [(CBManager *)self sendSyncMsg:217 args:v7];

  id v9 = [v8 objectForKeyedSubscript:@"kCBMsgArgAddressString"];

  return v9;
}

- (void)updatePeripheral:(id)a3 options:(id)a4
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"kCBMsgArgDeviceUUID";
  id v6 = a4;
  uint64_t v7 = [a3 identifier];
  id v8 = (void *)v7;
  v11[1] = @"kCBMsgArgOptions";
  id v9 = (id)MEMORY[0x1E4F1CC08];
  if (v6) {
    id v9 = v6;
  }
  v12[0] = v7;
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  [(CBManager *)self sendMsg:81 args:v10];
}

- (void)retrieveBTDeviceCacheInfo:(id)a3 withCompletion:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v13 = @"kCBMsgArgOptions";
  v14[0] = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __61__CBCentralManager_retrieveBTDeviceCacheInfo_withCompletion___block_invoke;
  void v11[3] = &unk_1E5E310E0;
  id v12 = v6;
  id v10 = v6;
  [(CBManager *)self sendMsg:83 args:v9 withReply:v11];
}

uint64_t __61__CBCentralManager_retrieveBTDeviceCacheInfo_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleRestoringState:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((*(unsigned char *)&self->_delegateFlags & 1) == 0)
  {
    int v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2 object:self file:@"CBCentralManager.m" lineNumber:1307 description:@"Registered delegate no longer supports restoring"];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kCBMsgArgOptions"];
  if (v7)
  {
    [(CBCentralManager *)self setIsScanning:1];
    id v8 = [v7 objectForKeyedSubscript:@"kCBMsgArgUUIDs"];
    if ([v8 count])
    {
      id v9 = [(CBCentralManager *)self dataArrayToUUIDArray:v8];
      [v6 setObject:v9 forKeyedSubscript:@"kCBRestoredScanServices"];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = [v7 objectForKeyedSubscript:@"kCBScanOptionSolicitedServiceUUIDs"];
    if ([v11 count])
    {
      id v12 = [(CBCentralManager *)self dataArrayToUUIDArray:v11];
      [v10 setObject:v12 forKeyedSubscript:@"kCBScanOptionSolicitedServiceUUIDs"];
    }
    BOOL v13 = [v7 objectForKeyedSubscript:@"kCBScanOptionAllowDuplicates"];
    int v14 = [v13 BOOLValue];

    if (v14) {
      [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kCBScanOptionAllowDuplicates"];
    }
    if ([v10 count]) {
      [v6 setObject:v10 forKeyedSubscript:@"kCBRestoredScanOptions"];
    }
  }
  v61 = v7;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v63 = v5;
  obuint64_t j = [v5 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  uint64_t v68 = [obj countByEnumeratingWithState:&v108 objects:v119 count:16];
  if (v68)
  {
    uint64_t v65 = *(void *)v109;
    objc_super v66 = v15;
    v67 = self;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v109 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v69 = v16;
        id v17 = *(void **)(*((void *)&v108 + 1) + 8 * v16);
        int v18 = -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v17, v61);
        id v19 = [v17 objectForKeyedSubscript:@"kCBMsgArgState"];
        if ([v19 BOOLValue]) {
          uint64_t v20 = 2;
        }
        else {
          uint64_t v20 = 1;
        }
        [v18 setState:v20];

        objc_msgSend(v18, "setCanSendWriteWithoutResponse:", objc_msgSend(v18, "state") == 2);
        id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v77 = [v17 objectForKeyedSubscript:@"kCBMsgArgSubscribedHandles"];
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id v70 = [v17 objectForKeyedSubscript:@"kCBMsgArgServices"];
        uint64_t v72 = [v70 countByEnumeratingWithState:&v104 objects:v118 count:16];
        if (v72)
        {
          uint64_t v71 = *(void *)v105;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v105 != v71) {
                objc_enumerationMutation(v70);
              }
              uint64_t v73 = v21;
              id v23 = *(void **)(*((void *)&v104 + 1) + 8 * v21);
              id v24 = [[CBService alloc] initWithPeripheral:v18 dictionary:v23];
              id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v100 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              id v26 = [v23 objectForKeyedSubscript:@"kCBMsgArgIncludedServices"];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v100 objects:v117 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v101;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v101 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v100 + 1) + 8 * i);
                    v115[0] = @"service";
                    v115[1] = @"incInfo";
                    v116[0] = v24;
                    v116[1] = v31;
                    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
                    [v76 addObject:v32];
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v100 objects:v117 count:16];
                }
                while (v28);
              }

              long long v98 = 0u;
              long long v99 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              id v75 = [v23 objectForKeyedSubscript:@"kCBMsgArgCharacteristics"];
              uint64_t v81 = [v75 countByEnumeratingWithState:&v96 objects:v114 count:16];
              if (v81)
              {
                uint64_t v78 = *(void *)v97;
                v79 = v25;
                v80 = v24;
                do
                {
                  uint64_t v33 = 0;
                  do
                  {
                    if (*(void *)v97 != v78) {
                      objc_enumerationMutation(v75);
                    }
                    uint64_t v82 = v33;
                    long long v36 = *(void **)(*((void *)&v96 + 1) + 8 * v33);
                    id v37 = [[CBCharacteristic alloc] initWithService:v24 dictionary:v36];
                    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    v94[0] = MEMORY[0x1E4F143A8];
                    v94[1] = 3221225472;
                    v94[2] = __41__CBCentralManager_handleRestoringState___block_invoke;
                    v94[3] = &unk_1E5E311D0;
                    int v39 = v37;
                    v95 = v39;
                    [v77 enumerateObjectsUsingBlock:v94];
                    long long v92 = 0u;
                    long long v93 = 0u;
                    long long v90 = 0u;
                    long long v91 = 0u;
                    uint64_t v40 = [v36 objectForKeyedSubscript:@"kCBMsgArgDescriptors"];
                    uint64_t v41 = [v40 countByEnumeratingWithState:&v90 objects:v113 count:16];
                    if (v41)
                    {
                      uint64_t v42 = v41;
                      uint64_t v43 = *(void *)v91;
                      do
                      {
                        for (uint64_t j = 0; j != v42; ++j)
                        {
                          if (*(void *)v91 != v43) {
                            objc_enumerationMutation(v40);
                          }
                          SEL v45 = [[CBDescriptor alloc] initWithCharacteristic:v39 dictionary:*(void *)(*((void *)&v90 + 1) + 8 * j)];
                          [v38 addObject:v45];
                          int v46 = [(CBDescriptor *)v45 handle];
                          [v18 setAttribute:v45 forHandle:v46];
                        }
                        uint64_t v42 = [v40 countByEnumeratingWithState:&v90 objects:v113 count:16];
                      }
                      while (v42);
                    }

                    if ([v38 count]) {
                      [(CBCharacteristic *)v39 setDescriptors:v38];
                    }
                    id v25 = v79;
                    [v79 addObject:v39];
                    long long v34 = [(CBCharacteristic *)v39 handle];
                    [v18 setAttribute:v39 forHandle:v34];

                    long long v35 = [(CBCharacteristic *)v39 valueHandle];
                    [v18 setAttribute:v39 forHandle:v35];

                    uint64_t v33 = v82 + 1;
                    id v24 = v80;
                  }
                  while (v82 + 1 != v81);
                  uint64_t v81 = [v75 countByEnumeratingWithState:&v96 objects:v114 count:16];
                }
                while (v81);
              }

              if ([v25 count]) {
                [(CBService *)v24 setCharacteristics:v25];
              }
              [v74 addObject:v24];
              id v22 = [(CBService *)v24 startHandle];
              [v18 setAttribute:v24 forHandle:v22];

              uint64_t v21 = v73 + 1;
            }
            while (v73 + 1 != v72);
            uint64_t v72 = [v70 countByEnumeratingWithState:&v104 objects:v118 count:16];
          }
          while (v72);
        }

        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v47 = v76;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v86 objects:v112 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v87;
          do
          {
            for (uint64_t k = 0; k != v49; ++k)
            {
              if (*(void *)v87 != v50) {
                objc_enumerationMutation(v47);
              }
              int v52 = *(void **)(*((void *)&v86 + 1) + 8 * k);
              uint64_t v53 = [v52 objectForKeyedSubscript:@"service"];
              int v54 = [CBService alloc];
              v55 = [v52 objectForKeyedSubscript:@"incInfo"];
              int v56 = [(CBService *)v54 initWithPeripheral:0 dictionary:v55];

              v83[0] = MEMORY[0x1E4F143A8];
              v83[1] = 3221225472;
              v83[2] = __41__CBCentralManager_handleRestoringState___block_invoke_2;
              v83[3] = &unk_1E5E311F8;
              v84 = v56;
              id v85 = v53;
              id v57 = v53;
              int v58 = v56;
              [v74 enumerateObjectsUsingBlock:v83];
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v86 objects:v112 count:16];
          }
          while (v49);
        }

        if ([v74 count]) {
          [v18 setServices:v74];
        }
        id v15 = v66;
        [v66 addObject:v18];

        uint64_t v16 = v69 + 1;
        self = v67;
      }
      while (v69 + 1 != v68);
      uint64_t v68 = [obj countByEnumeratingWithState:&v108 objects:v119 count:16];
    }
    while (v68);
  }

  if ([v15 count]) {
    [v6 setObject:v15 forKeyedSubscript:@"kCBRestoredPeripherals"];
  }
  v59 = [(CBCentralManager *)self delegate];
  [v59 centralManager:self willRestoreState:v6];
}

void __41__CBCentralManager_handleRestoringState___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 handle];
  int v9 = [v7 isEqualToNumber:v8];

  if (v9)
  {
    [*(id *)(a1 + 32) setIsNotifying:1];
    *a4 = 1;
  }
}

void __41__CBCentralManager_handleRestoringState___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v6 = [v15 UUID];
  id v7 = [*(id *)(a1 + 32) UUID];
  if (([v6 isEqual:v7] & 1) == 0) {
    goto LABEL_7;
  }
  id v8 = [v15 startHandle];
  int v9 = [*(id *)(a1 + 32) startHandle];
  if (![v8 isEqualToNumber:v9])
  {

LABEL_7:
    goto LABEL_8;
  }
  id v10 = [v15 endHandle];
  id v11 = [*(id *)(a1 + 32) endHandle];
  int v12 = [v10 isEqualToNumber:v11];

  if (!v12) {
    goto LABEL_9;
  }
  BOOL v13 = [*(id *)(a1 + 40) includedServices];
  if (v13)
  {
    int v14 = [*(id *)(a1 + 40) includedServices];
    id v6 = (id)[v14 mutableCopy];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  [v6 addObject:v15];
  [*(id *)(a1 + 40) setIncludedServices:v6];
  *a4 = 1;
LABEL_8:

LABEL_9:
}

- (void)handlePeripheralInvalidated:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  if (v4)
  {
    uint64_t v6 = v4;
    id v5 = [(CBCentralManager *)self peripheralWithIdentifier:v4];
    if (v5) {
      [(NSMapTable *)self->_peripherals removeObjectForKey:v6];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)handleScanComplete:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_scanCompletion)
  {
    id v10 = v4;
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    id scanCompletion = (void (**)(id, void *, void *))self->_scanCompletion;
    if (v6)
    {
      id v8 = [v10 objectForKeyedSubscript:@"kCBScanOptionTotalRXTimeMS"];
      scanCompletion[2](scanCompletion, v6, v8);
    }
    else
    {
      scanCompletion[2](self->_scanCompletion, 0, 0);
    }
    id v9 = self->_scanCompletion;
    self->_id scanCompletion = 0;

    id v5 = v10;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)handleScanParamsUpdated:(id)a3
{
  if ((*((unsigned char *)&self->_delegateFlags + 3) & 2) != 0)
  {
    id v4 = a3;
    id v5 = [(CBCentralManager *)self delegate];
    [v5 centralManager:self didUpdateScanParams:v4];
  }
}

- (void)handleFindMyDevicesUpdated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*((unsigned char *)&self->_delegateFlags + 3) & 4) != 0)
  {
    id v5 = objc_opt_new();
    uint64_t v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [(CBCentralManager *)self peripheralWithInfo:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    int v12 = [(CBCentralManager *)self delegate];
    [v12 centralManager:self didUpdateFindMyPeripherals:v5];
  }
}

- (void)handlePeripheralConnectionCompleted:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v6 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    if (v7)
    {
      [v6 handleFailedConnection];
      uint64_t v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
      uint64_t v9 = [NSNumber numberWithInt:341];
      int v10 = [v8 isEqualToNumber:v9];

      if (v10)
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
        {
          -[CBCentralManager handlePeripheralConnectionCompleted:]();
          if ((*(unsigned char *)&self->_delegateFlags & 8) == 0) {
            goto LABEL_22;
          }
          goto LABEL_20;
        }
      }
      else
      {
        long long v13 = [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
        long long v14 = [NSNumber numberWithInt:348];
        int v15 = [v13 isEqualToNumber:v14];

        if (v15)
        {
          if (CBLogInitOnce != -1) {
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          }
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
          {
            -[CBCentralManager handlePeripheralConnectionCompleted:]();
            if ((*(unsigned char *)&self->_delegateFlags & 8) == 0) {
              goto LABEL_22;
            }
            goto LABEL_20;
          }
        }
      }
      if ((*(unsigned char *)&self->_delegateFlags & 8) != 0)
      {
LABEL_20:
        int v12 = [(CBCentralManager *)self delegate];
        [v12 centralManager:self didFailToConnectPeripheral:v6 error:v7];
        goto LABEL_21;
      }
    }
    else
    {
      [v6 handleSuccessfulConnection:v4];
      if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
      {
        int v12 = [(CBCentralManager *)self delegate];
        [v12 centralManager:self didConnectPeripheral:v6];
LABEL_21:
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v11 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_1AB9F0000, v11, OS_LOG_TYPE_DEFAULT, "No peripheral found for args %@", (uint8_t *)&v16, 0xCu);
  }
LABEL_23:
}

- (void)handlePeripheralCLReady:(id)a3
{
  id v8 = a3;
  id v4 = [v8 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = [(CBCentralManager *)self peripheralWithIdentifier:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v8];
    if (!v6 && (*((unsigned char *)&self->_delegateFlags + 2) & 1) != 0)
    {
      uint64_t v7 = [(CBCentralManager *)self delegate];
      [v7 centralManager:self canSendDataToPeripheral:v5];
    }
  }
}

- (void)handlePeripheralDisconnectionCompleted:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v6 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    id v8 = [v4 objectForKeyedSubscript:@"kCBDisconnectInfoTimestamp"];
    [v8 doubleValue];
    double v10 = v9;

    id v11 = [v4 objectForKeyedSubscript:@"kCBDisconnectInfoIsReconnecting"];
    uint64_t v12 = [v11 BOOLValue];

    [v6 handleDisconnection];
    if (v12) {
      [v6 setState:1];
    }
    long long v13 = [v6 identifier];
    long long v14 = [(CBManager *)self getCnxInstanceForIdentifier:v13];

    if (v14)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      int v15 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v6;
        _os_log_impl(&dword_1AB9F0000, v15, OS_LOG_TYPE_DEFAULT, "WHB device %@ disconnected", (uint8_t *)&v21, 0xCu);
      }
      int v16 = [v14 peerDevice];
      id v17 = [v16 identifier];
      [(CBManager *)self removeWhbRemoteId:v17];

      uint64_t v18 = [v6 identifier];
      [(CBManager *)self removeCnxInstanceForIdentifier:v18];
    }
    $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
    if ((*(unsigned char *)&delegateFlags & 0x10) != 0)
    {
      uint64_t v20 = [(CBCentralManager *)self delegate];
      [v20 centralManager:self didDisconnectPeripheral:v6 error:v7];
    }
    else
    {
      if ((*(unsigned char *)&delegateFlags & 0x20) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v20 = [(CBCentralManager *)self delegate];
      [v20 centralManager:self didDisconnectPeripheral:v6 timestamp:v12 isReconnecting:v7 error:v10];
    }

    goto LABEL_15;
  }
LABEL_16:
}

- (void)handleApplicationConnectionEventDidOccur:(id)a3
{
  id v4 = a3;
  id v5 = [(CBCentralManager *)self peripheralWithInfo:v4];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionEvent"];
  int v7 = [v6 intValue];

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBCentralManager handleApplicationConnectionEventDidOccur:]();
    if (!v5) {
      goto LABEL_7;
    }
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 8) != 0)
  {
    [v5 handleConnectionStateUpdated:v7 != 0];
    id v8 = [(CBCentralManager *)self delegate];
    [v8 centralManager:self connectionEventDidOccur:v7 forPeripheral:v5];
  }
LABEL_7:
}

- (void)handleScanFailedToStartWithError:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBCentralManager handleScanFailedToStartWithError:]();
  }
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
  uint64_t v6 = [NSNumber numberWithInt:341];
  int v7 = [v5 isEqualToNumber:v6];

  if (v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT)) {
LABEL_8:
    }
      -[CBCentralManager handleScanFailedToStartWithError:]();
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
    double v9 = [NSNumber numberWithInt:348];
    int v10 = [v8 isEqualToNumber:v9];

    if (!v10) {
      goto LABEL_12;
    }
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
    }
    -[CBCentralManager handleScanFailedToStartWithError:]();
  }
LABEL_12:
  if ((*((unsigned char *)&self->_delegateFlags + 2) & 2) != 0)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    uint64_t v12 = [(CBCentralManager *)self delegate];
    [v12 centralManager:self didFailToScanWithError:v11];
  }
}

- (void)handlePeripheralConnectionStateUpdated:(id)a3
{
  id v7 = a3;
  id v4 = -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:");
  if (v4)
  {
    id v5 = [v7 objectForKeyedSubscript:@"kCBMsgArgConnectionState"];
    objc_msgSend(v4, "handleConnectionStateUpdated:", objc_msgSend(v5, "BOOLValue"));
    if ((*(unsigned char *)&self->_delegateFlags & 0x40) != 0)
    {
      uint64_t v6 = [(CBCentralManager *)self delegate];
      [v6 centralManager:self didUpdatePeripheralConnectionState:v4];
    }
  }
}

- (void)handlePeripheralTrackingUpdated:(id)a3
{
  id v4 = a3;
  id v10 = [(CBCentralManager *)self peripheralWithInfo:v4];
  id v5 = [v4 objectForKeyedSubscript:@"kCBTrackingOptionType"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCBTrackingOptionState"];

  if (v10 && v5 && v6)
  {
    int v7 = [v6 isEqual:&unk_1F0301948];
    $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
    if (v7)
    {
      if ((*(_WORD *)&delegateFlags & 0x100) == 0) {
        goto LABEL_10;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained centralManager:self didLosePeripheral:v10 forType:v5];
    }
    else
    {
      if ((*(unsigned char *)&delegateFlags & 0x80) == 0) {
        goto LABEL_10;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained centralManager:self didFindPeripheral:v10 forType:v5];
    }
  }
LABEL_10:
}

- (void)handleApplicationActivityEvent:(id)a3
{
  id v4 = a3;
  id v12 = [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgState"];

  uint64_t v6 = [v5 BOOLValue];
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v8 = WeakRetained;
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        [v11 centralManager:self application:v12 isActive:v6];
      }
    }
  }
}

- (void)handleZoneLost:(id)a3
{
  id v4 = a3;
  id v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgLeZone"];
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgLeZoneMask"];

  if ((*((unsigned char *)&self->_delegateFlags + 1) & 2) != 0)
  {
    uint64_t v6 = [(CBCentralManager *)self delegate];
    [v6 centralManager:self didLoseZone:v7 mask:v5];
  }
}

- (void)HandleControllerBTClockUpdateMsg:(id)a3
{
  id v14 = a3;
  id v4 = [v14 objectForKeyedSubscript:@"kCBGetControllerBTClockSeconds"];
  id v5 = [v14 objectForKeyedSubscript:@"kCBGetControllerBTClockMicroSeconds"];
  uint64_t v6 = [v14 objectForKeyedSubscript:@"kCBGetControllerBTClockEventType"];
  id v7 = [v14 objectForKeyedSubscript:@"kCBGetControllerBTLocalClock"];
  id v8 = [v14 objectForKeyedSubscript:@"kCBGetControllerBTRemoteClock"];
  id v9 = [v14 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  char v10 = [(CBCentralManager *)self peripheralWithIdentifier:v9];

  if (v10)
  {
    $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
    if ((*(_DWORD *)&delegateFlags & 0x40000) != 0)
    {
      id v12 = [(CBCentralManager *)self delegate];
      [v12 centralManager:self didUpdateControllerBTClockForPeripheral:v10 eventType:v6 seconds:v4 microseconds:v5 localClock:v7 remoteClock:v8];

      $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
    }
    if ((*(_DWORD *)&delegateFlags & 0x80000) != 0)
    {
      long long v13 = [(CBCentralManager *)self delegate];
      [v13 centralManager:self didUpdateControllerBTClockDictForPeripheral:v10 results:v14];
    }
  }
}

- (void)HandleRssiDetectionUpdateMsg:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v6 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  id v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (v6)
  {
    if ((*((unsigned char *)&self->_delegateFlags + 2) & 0x20) != 0)
    {
      id v8 = [(CBCentralManager *)self delegate];
      [v8 centralManager:self didUpdateRSSIStatisticsDetectionForPeripheral:v6 results:v4 error:v7];
    }
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v9 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1AB9F0000, v9, OS_LOG_TYPE_DEFAULT, "No peripheral found in HandleRssiDetectionUpdateMsg for args %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)HandleBluetoothUsageEventMsg:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v6 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  id v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (v6)
  {
    if ((*((unsigned char *)&self->_delegateFlags + 2) & 0x40) != 0)
    {
      id v8 = [(CBCentralManager *)self delegate];
      [v8 centralManager:self didUpdateUsageStatisticEvent:v6 results:v4 error:v7];
    }
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v9 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1AB9F0000, v9, OS_LOG_TYPE_DEFAULT, "No peripheral found in HandleBluetoothUsageEventMsg for args %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)HandleBluetoothPhyStatisticEventMsg:(id)a3
{
  id v8 = a3;
  id v4 = [v8 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = [(CBCentralManager *)self peripheralWithIdentifier:v4];

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v8];
  if (v5 && (*((unsigned char *)&self->_delegateFlags + 2) & 0x80) != 0)
  {
    id v7 = [(CBCentralManager *)self delegate];
    [v7 centralManager:self didUpdatePhyStatisticEvent:v5 results:v8 error:v6];
  }
}

- (void)HandleCSProcedureEventMsg:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v6 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  id v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (v6)
  {
    if (*((unsigned char *)&self->_delegateFlags + 3))
    {
      id v8 = [(CBCentralManager *)self delegate];
      [v8 centralManager:self didChannelSoundingProcedureEvent:v6 results:v4 error:v7];
    }
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v9 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1AB9F0000, v9, OS_LOG_TYPE_DEFAULT, "No peripheral found in HandleCSProcedureEventMsg for args %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)handleConnectionParametersUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v10 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionInterval"];
  id v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionLatency"];
  id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgSupervisionTimeout"];

  if (v10 && (*((unsigned char *)&self->_delegateFlags + 1) & 4) != 0)
  {
    id v9 = [(CBCentralManager *)self delegate];
    [v9 centralManager:self didUpdateConnectionParameters:v10 interval:v6 latency:v7 supervisionTimeout:v8];
  }
}

- (void)handleReadyForUpdates:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMapTable *)self->_peripherals objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) isReadyForUpdates];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)retrievePeripheralWithAddress:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v12 = @"kCBMsgArgAddressString";
    uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
    v13[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    long long v8 = [(CBManager *)self sendSyncMsg:75 args:v7];

    long long v9 = [v8 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    if (v9)
    {
      long long v10 = [(CBCentralManager *)self peripheralWithInfo:v9];
      [v10 setBDAddress:v4];
    }
    else
    {
      long long v10 = 0;
    }
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBCentralManager retrievePeripheralWithAddress:]();
    }
    long long v10 = 0;
  }

  return v10;
}

- (void)addIRKwithBTAddress:(id)a3 irk:(id)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = (id)MEMORY[0x1E4F1CBF0];
  if (a3) {
    id v6 = a3;
  }
  v12[0] = @"kCBSetIRKForAddressPublicAddress";
  v12[1] = @"kCBSetIRKForAddressIRK";
  id v7 = (id)MEMORY[0x1E4F1CC08];
  if (a4) {
    id v7 = a4;
  }
  v13[0] = v6;
  v13[1] = v7;
  long long v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a4;
  id v10 = a3;
  long long v11 = [v8 dictionaryWithObjects:v13 forKeys:v12 count:2];

  [(CBManager *)self sendMsg:130 args:v11];
}

- (void)removeIRKwithBTAddress:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  long long v8 = @"kCBSetIRKForAddressPublicAddress";
  v9[0] = v4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(CBManager *)self sendMsg:131 args:v7];
}

- (void)deleteDevice:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"kCBMsgArgDeviceUUID";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CBManager *)self sendMsg:132 args:v6];

  [(NSMapTable *)self->_peripherals removeObjectForKey:v5];
}

- (id)createPeripheralWithAddress:(id)a3 andIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = [v7 dictionary];
  [v9 setObject:v8 forKeyedSubscript:@"kCBAdvOptionInstanceRandomAddressBytes"];

  if (v6) {
    [v9 setObject:v6 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  }
  id v10 = [(CBManager *)self sendSyncMsg:76 args:v9];
  long long v11 = [v10 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  if (v11)
  {
    uint64_t v12 = [(CBCentralManager *)self peripheralWithInfo:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)createPeripheralFromIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = [v7 dictionary];
  [v9 setObject:v8 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __62__CBCentralManager_createPeripheralFromIdentifier_completion___block_invoke;
  void v11[3] = &unk_1E5E31220;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(CBManager *)self sendMsg:77 args:v9 withReply:v11];
}

void __62__CBCentralManager_createPeripheralFromIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    id v7 = (id)v5;
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) peripheralWithInfo:v5];
    }
    else
    {
      id v6 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)readLocalFastLeConnectionCachedControllerInfoWithcompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__CBCentralManager_readLocalFastLeConnectionCachedControllerInfoWithcompletion___block_invoke;
  v6[3] = &unk_1E5E310E0;
  id v7 = v4;
  id v5 = v4;
  [(CBManager *)self sendMsg:82 args:MEMORY[0x1E4F1CC08] withReply:v6];
}

void __80__CBCentralManager_readLocalFastLeConnectionCachedControllerInfoWithcompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = objc_opt_new();
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v5, v7);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v9];
    id v8 = [v9 objectForKeyedSubscript:@"kCBFastLeConnectionInfoData"];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
}

- (void)handleDidSendBytesToPeripheralwithError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v9 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgBytesSent"];
  id v7 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];

  if (v9 && (*((unsigned char *)&self->_delegateFlags + 1) & 0x10) != 0)
  {
    id v8 = [(CBCentralManager *)self delegate];
    [v8 centralManager:self didSendBytes:v6 toPeripheral:v9 withError:v7];
  }
}

- (void)handleDidReceiveDataFromPeripheral:(id)a3
{
  id v12 = a3;
  id v4 = [v12 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = [(CBCentralManager *)self peripheralWithIdentifier:v4];

  uint64_t v6 = v12;
  if (v5) {
    goto LABEL_6;
  }
  id v7 = [v12 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v7, 0);
  id v9 = [(CBCentralManager *)self retrievePeripheralsWithIdentifiers:v8];
  if (![v9 count])
  {

    uint64_t v6 = v12;
    goto LABEL_9;
  }
  id v5 = [v9 objectAtIndexedSubscript:0];

  uint64_t v6 = v12;
  if (v5)
  {
LABEL_6:
    id v10 = [v6 objectForKeyedSubscript:@"kCBMsgArgObjectDiscoveryData"];
    if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x20) != 0)
    {
      long long v11 = [(CBCentralManager *)self delegate];
      [v11 centralManager:self didReceiveData:v10 fromPeripheral:v5];
    }
    uint64_t v6 = v12;
  }
LABEL_9:
}

- (void)handleAncsAuthChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v9 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  uint64_t v6 = [v4 objectForKey:@"kCBMsgArgAncsAuthorization"];

  uint64_t v7 = [v6 BOOLValue];
  if (v9)
  {
    [v9 setAncsAuthorized:v7];
    if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x80) != 0)
    {
      id v8 = [(CBCentralManager *)self delegate];
      [v8 centralManager:self didUpdateANCSAuthorizationForPeripheral:v9];
    }
  }
}

- (void)handlePeerMTUChanged:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBCentralManager handlePeerMTUChanged:]();
  }
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v6 = [(CBCentralManager *)self peripheralWithIdentifier:v5];

  if (v6 && (*((unsigned char *)&self->_delegateFlags + 2) & 0x10) != 0)
  {
    uint64_t v7 = [(CBCentralManager *)self delegate];
    [v7 centralManager:self didUpdateMTUForPeripheral:v6];
  }
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return (a3 & 0xFFFFFFFB) == 10;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (NSMapTable)peripherals
{
  return self->_peripherals;
}

- (id)scanCompletion
{
  return self->_scanCompletion;
}

- (void)setScanCompletion:(id)a3
{
}

- (OS_dispatch_source)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (NSMutableArray)discoveredPeripherals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDiscoveredPeripherals:(id)a3
{
}

void __37__CBCentralManager_orphanPeripherals__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1AB9F0000, v0, v1, "Orphaning %@", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:queue:options:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: %@ has no restore identifier but the delegate implements the centralManager:willRestoreState: method. Restoring will not be supported", v2, v3, v4, v5, v6);
}

- (void)retrieveWhbCBPeripheralWithInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "Cannot retrieve WHB peripheral as stableId is null for peripheral %@", v2, v3, v4, v5, v6);
}

- (void)activateWhbCnxForCBPeripheral:infoDict:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "WHB cnx instance for localPeripheral %@ already exists", v2, v3, v4, v5, v6);
}

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1AB9F0000, v0, OS_LOG_TYPE_ERROR, "CBCentralManager->WHB shim interrupted", v1, 2u);
}

- (void)connectWhbCBPeripheral:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "No remoteId/stableId for this WHB peripheral %@, aborting", v2, v3, v4, v5, v6);
}

- (void)handlePeripheralConnectionCompleted:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1AB9F0000, v0, v1, "BundleID is NOT in the allowed CBCentralSession list for connection. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
}

- (void)handlePeripheralConnectionCompleted:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1AB9F0000, v0, v1, "CBUseCase is not provided in connectPeripheral while it is required. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
}

- (void)handleApplicationConnectionEventDidOccur:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1AB9F0000, v0, v1, "ConnectionEventDidOccur %@", v2, v3, v4, v5, v6);
}

- (void)handleScanFailedToStartWithError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1AB9F0000, v0, v1, "BundleID is NOT in the allowed CBCentralSession list for scanning. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
}

- (void)handleScanFailedToStartWithError:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1AB9F0000, v0, v1, "CBUseCase is not provided in scanForPeripheralsWithServices while it is required. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
}

- (void)handleScanFailedToStartWithError:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1AB9F0000, v0, v1, "handleScanFailedToStartWithError %@", v2, v3, v4, v5, v6);
}

- (void)retrievePeripheralWithAddress:.cold.1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1AB9F0000, v0, OS_LOG_TYPE_ERROR, "WARNING: Invalid address specified, cannot create a CBPeripheral from an empty string", v1, 2u);
}

- (void)handlePeerMTUChanged:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1AB9F0000, v0, v1, "handlePeerMTUChanged %@", v2, v3, v4, v5, v6);
}

- (void)handleMsg:(int)a1 args:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_ERROR, "Unhandled XPC message: %u", (uint8_t *)v2, 8u);
}

- (void)handleMsg:args:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1AB9F0000, v1, OS_LOG_TYPE_DEBUG, "%@ is not powered on, ignoring message: %u", v2, 0x12u);
}

@end
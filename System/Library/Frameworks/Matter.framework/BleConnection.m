@interface BleConnection
+ (void)fillServiceWithCharacteristicUuids:(id)a3 svcId:(ChipBleUUID *)a4 charId:(ChipBleUUID *)a5;
- (BOOL)checkDiscriminator:(unsigned __int16)a3;
- (BOOL)found;
- (BOOL)isConnecting;
- (BleConnection)initWithDelegate:(BleScannerDelegate *)a3 prewarm:(BOOL)a4 queue:(id)a5;
- (BleConnection)initWithDiscriminator:(const SetupDiscriminator *)a3 queue:(id)a4;
- (BleConnection)initWithQueue:(id)a3;
- (BleLayer)mBleLayer;
- (BleScannerDelegate)scannerDelegate;
- (CBCentralManager)centralManager;
- (CBPeripheral)peripheral;
- (CBUUID)shortServiceUUID;
- (NSMutableDictionary)cachedPeripherals;
- (OS_dispatch_queue)chipWorkQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)timer;
- (SetupDiscriminator)deviceDiscriminator;
- (id).cxx_construct;
- (int)totalDevicesAdded;
- (int)totalDevicesRemoved;
- (unsigned)currentMode;
- (void)_resetCounters;
- (void)addPeripheralToCache:(id)a3 data:(id)a4;
- (void)appState;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)clearTimer;
- (void)connect:(id)a3;
- (void)detachScannerDelegate;
- (void)dispatchConnectionComplete:(id)a3;
- (void)dispatchConnectionError:(ChipError *)a3;
- (void)onConnectionComplete;
- (void)onConnectionError;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)removePeripheralFromCache:(id)a3;
- (void)removePeripheralsFromCache;
- (void)setAppState:(void *)a3;
- (void)setBleLayer:(BleLayer *)a3;
- (void)setCachedPeripherals:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setChipWorkQueue:(id)a3;
- (void)setDeviceDiscriminator:(SetupDiscriminator)a3;
- (void)setFound:(BOOL)a3;
- (void)setMBleLayer:(BleLayer *)a3;
- (void)setOnConnectionComplete:(void *)a3;
- (void)setOnConnectionError:(void *)a3;
- (void)setPeripheral:(id)a3;
- (void)setScannerDelegate:(BleScannerDelegate *)a3;
- (void)setShortServiceUUID:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setupTimer:(unint64_t)a3;
- (void)start;
- (void)startScanning;
- (void)stop;
- (void)stopScanning;
- (void)updateWithDelegate:(BleScannerDelegate *)a3 prewarm:(BOOL)a4;
- (void)updateWithDiscriminator:(const SetupDiscriminator *)a3;
- (void)updateWithPeripheral:(id)a3;
@end

@implementation BleConnection

- (BleConnection)initWithQueue:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BleConnection;
  v7 = [(BleConnection *)&v17 init];
  if (v7)
  {
    v8 = objc_msgSend_GetShortestServiceUUID_(MTRUUIDHelper, v6, (uint64_t)&unk_244EAE1D8);
    objc_msgSend_setShortServiceUUID_(v7, v9, (uint64_t)v8);

    if (qword_26B0D43B0 != -1) {
      dispatch_once_f(&qword_26B0D43B0, &byte_26B0D4370, (dispatch_function_t)sub_2446D7DB8);
    }
    objc_storeStrong((id *)&v7->_chipWorkQueue, (id)qword_26B0D4398);
    objc_storeStrong((id *)&v7->_workQueue, a3);
    v10 = (CBCentralManager *)objc_alloc(MEMORY[0x263EFEF00]);
    centralManager = v7->_centralManager;
    v7->_centralManager = v10;

    v7->_found = 0;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedPeripherals = v7->_cachedPeripherals;
    v7->_cachedPeripherals = v12;

    v7->_currentMode = 0;
    objc_msgSend__resetCounters(v7, v14, v15);
  }

  return v7;
}

- (BleConnection)initWithDelegate:(BleScannerDelegate *)a3 prewarm:(BOOL)a4 queue:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v10 = objc_msgSend_initWithQueue_(self, v9, (uint64_t)v8);
  v12 = (BleConnection *)v10;
  if (v10)
  {
    *(void *)(v10 + 104) = a3;
    if (v5)
    {
      *(unsigned char *)(v10 + 8) = 2;
      objc_msgSend_setupTimer_((void *)v10, v11, 120);
    }
    else
    {
      *(unsigned char *)(v10 + 8) = 1;
    }
  }

  return v12;
}

- (BleConnection)initWithDiscriminator:(const SetupDiscriminator *)a3 queue:(id)a4
{
  id v6 = a4;
  uint64_t v8 = objc_msgSend_initWithQueue_(self, v7, (uint64_t)v6);
  uint64_t v10 = (BleConnection *)v8;
  if (v8)
  {
    unsigned __int16 mDiscriminator = a3->mDiscriminator;
    *(unsigned char *)(v8 + 12) = a3->mIsShortDiscriminator;
    *(_WORD *)(v8 + 10) = mDiscriminator;
    *(unsigned char *)(v8 + 8) = 3;
    objc_msgSend_setupTimer_((void *)v8, v9, 60);
  }

  return v10;
}

- (BOOL)isConnecting
{
  return self->_currentMode == 3;
}

- (void)setupTimer:(unint64_t)a3
{
  objc_msgSend_clearTimer(self, a2, a3);
  BOOL v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_workQueue);
  timer = self->_timer;
  self->_timer = v5;

  v7 = self->_timer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_244D793DC;
  handler[3] = &unk_265193E58;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  int64_t v8 = 1000000000 * a3;
  v9 = self->_timer;
  dispatch_time_t v10 = dispatch_walltime(0, v8);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)clearTimer
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)dispatchConnectionError:(ChipError *)a3
{
  chipWorkQueue = self->_chipWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_244D79578;
  v4[3] = &unk_2651A9280;
  v4[4] = self;
  ChipError v5 = *a3;
  dispatch_async(chipWorkQueue, v4);
}

- (void)dispatchConnectionComplete:(id)a3
{
  id v4 = a3;
  chipWorkQueue = self->_chipWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244D79670;
  v7[3] = &unk_265193DC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(chipWorkQueue, v7);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  *(_DWORD *)buf = 2;
  v24 = "dwnpm_ble_cbmgr_state";
  int v25 = objc_msgSend_state(v4, v5, v6);
  char v26 = 2;
  sub_244D7E78C((uint64_t)buf);
  switch(objc_msgSend_state(v4, v7, v8))
  {
    case 0:
      v9 = sub_244CC8484(2u, "Ble");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_INFO, "CBManagerState: UNKNOWN", buf, 2u);
      }

      if (sub_244CC4E58(3u)) {
        goto LABEL_17;
      }
      break;
    case 1:
      dispatch_time_t v10 = sub_244CC8484(2u, "Ble");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_INFO, "CBManagerState: RESETTING", buf, 2u);
      }

      if (sub_244CC4E58(3u)) {
        goto LABEL_17;
      }
      break;
    case 2:
      v11 = sub_244CC8484(2u, "Ble");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_INFO, "CBManagerState: UNSUPPORTED", buf, 2u);
      }

      if (sub_244CC4E58(3u)) {
        goto LABEL_17;
      }
      break;
    case 3:
      v12 = sub_244CC8484(2u, "Ble");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_INFO, "CBManagerState: Unauthorized", buf, 2u);
      }

      if (sub_244CC4E58(3u)) {
LABEL_17:
      }
        sub_244CC4DE0(2u, 3);
      break;
    case 4:
      v13 = sub_244CC8484(2u, "Ble");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_INFO, "CBManagerState: OFF", buf, 2u);
      }

      if (sub_244CC4E58(3u)) {
        sub_244CC4DE0(2u, 3);
      }
      objc_msgSend_stop(self, v14, v15);
      int v20 = 1037;
      v21 = "src/platform/Darwin/BleConnectionDelegateImpl.mm";
      int v22 = 351;
      objc_msgSend_dispatchConnectionError_(self, v16, (uint64_t)&v20);
      break;
    case 5:
      objc_super v17 = sub_244CC8484(2u, "Ble");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_INFO, "CBManagerState: ON", buf, 2u);
      }

      if (sub_244CC4E58(3u)) {
        sub_244CC4DE0(2u, 3);
      }
      objc_msgSend_start(self, v18, v19);
      break;
    default:
      break;
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v77 = a3;
  id v79 = a4;
  id v10 = a5;
  id v78 = a6;
  objc_msgSend_objectForKey_(v10, v11, *MEMORY[0x263EFECD0]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v80, v86, 16);
  objc_super v17 = v12;
  if (v16)
  {
    uint64_t v18 = *(void *)v81;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v81 != v18) {
        objc_enumerationMutation(v12);
      }
      int v20 = *(void **)(*((void *)&v80 + 1) + 8 * v19);
      v21 = objc_msgSend_data(v20, v14, v15);
      v24 = objc_msgSend_data(self->_shortServiceUUID, v22, v23);
      int isEqualToData = objc_msgSend_isEqualToData_(v21, v25, (uint64_t)v24);

      if (isEqualToData) {
        break;
      }
      if (v16 == ++v19)
      {
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v80, v86, 16);
        if (v16) {
          goto LABEL_3;
        }
        objc_super v17 = v12;
        goto LABEL_45;
      }
    }
    objc_super v17 = objc_msgSend_objectForKey_(v12, v14, (uint64_t)v20);

    if (!v17) {
      goto LABEL_46;
    }
    v76 = objc_msgSend_objectForKey_(v10, v27, *MEMORY[0x263EFEC98]);
    int v30 = objc_msgSend_BOOLValue(v76, v28, v29);
    *(_DWORD *)buf = 1;
    *(void *)&v85[4] = "dwnpm_ble_discovered_peripheral";
    *(_DWORD *)&v85[12] = v30;
    v85[16] = 1;
    sub_244D7E78C((uint64_t)buf);
    if (objc_msgSend_BOOLValue(v76, v31, v32))
    {
      id v33 = v17;
      v36 = (unsigned __int8 *)objc_msgSend_bytes(v33, v34, v35);
      if (objc_msgSend_length(v33, v37, v38) == 8)
      {
        unsigned int v41 = *v36;
        if (v41 < 2)
        {
          int v65 = v36[1];
          unsigned __int8 v66 = v36[2];
          if (objc_msgSend_isConnecting(self, v39, v40))
          {
            uint64_t v68 = v65 & 0xFFFFF0FF | ((v66 & 0xF) << 8);
            if (objc_msgSend_checkDiscriminator_(self, v67, v68))
            {
              *(_DWORD *)buf = 0;
              *(void *)&v85[4] = "dwnpm_ble_discovered_matching_peripheral";
              v85[16] = 0;
              sub_244D7E78C((uint64_t)buf);
              v69 = sub_244CC8484(2u, "Ble");
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)v85 = v79;
                *(_WORD *)&v85[8] = 1024;
                *(_DWORD *)&v85[10] = v68;
                _os_log_impl(&dword_2446BD000, v69, OS_LOG_TYPE_DEFAULT, "Connecting to device %p with discriminator: %d", buf, 0x12u);
              }

              if (sub_244CC4E58(2u))
              {
                id v74 = v79;
                uint64_t v75 = v68;
                sub_244CC4DE0(2u, 2);
              }
              objc_msgSend_connect_(self, v70, (uint64_t)v79, v74, v75);
              objc_msgSend_stopScanning(self, v71, v72);
            }
            else
            {
              v73 = sub_244CC8484(2u, "Ble");
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)v85 = v79;
                *(_WORD *)&v85[8] = 1024;
                *(_DWORD *)&v85[10] = v68;
                _os_log_impl(&dword_2446BD000, v73, OS_LOG_TYPE_ERROR, "A device (%p) with a matching Matter UUID has been discovered but the service data discriminator not match our expectation (discriminator = %u).", buf, 0x12u);
              }

              if (sub_244CC4E58(1u)) {
                sub_244CC4DE0(2u, 1);
              }
              *(_DWORD *)buf = 2;
              *(void *)&v85[4] = "dwnpm_ble_mismatched_discriminator";
              v85[16] = 0;
              sub_244D7E78C((uint64_t)buf);
            }
          }
          else
          {
            objc_msgSend_addPeripheralToCache_data_(self, v67, (uint64_t)v79, v33);
          }
        }
        else
        {
          v42 = sub_244CC8484(2u, "Ble");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)v85 = v79;
            *(_WORD *)&v85[8] = 1024;
            *(_DWORD *)&v85[10] = v41;
            _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_ERROR, "A device (%p) with a matching Matter UUID has been discovered but the service data opCode not match our expectation (opCode = %u).", buf, 0x12u);
          }

          if (sub_244CC4E58(1u)) {
            sub_244CC4DE0(2u, 1);
          }
          *(_DWORD *)buf = 2;
          *(void *)&v85[4] = "dwnpm_ble_bad_opcode";
          *(_DWORD *)&v85[12] = v41;
          v85[16] = 2;
          sub_244D7E78C((uint64_t)buf);
        }
      }
      else
      {
        v44 = (void *)MEMORY[0x263F089D8];
        uint64_t v45 = objc_msgSend_length(v33, v39, v40);
        v49 = objc_msgSend_stringWithCapacity_(v44, v46, 2 * v45);
        for (unint64_t i = 0; i < objc_msgSend_length(v33, v47, v48); ++i)
        {
          v52 = objc_msgSend_stringWithFormat_(NSString, v51, @"%02lx", v36[i]);
          objc_msgSend_appendString_(v49, v53, (uint64_t)v52);
        }
        v54 = sub_244CC8484(2u, "Ble");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          id v55 = v49;
          uint64_t v58 = objc_msgSend_UTF8String(v55, v56, v57);
          *(_DWORD *)buf = 134218242;
          *(void *)v85 = v79;
          *(_WORD *)&v85[8] = 2080;
          *(void *)&v85[10] = v58;
          _os_log_impl(&dword_2446BD000, v54, OS_LOG_TYPE_ERROR, "A device (%p) with a matching Matter UUID has been discovered but the service data len does not match our expectation (serviceData = %s)", buf, 0x16u);
        }

        if (sub_244CC4E58(1u))
        {
          id v61 = v49;
          id v74 = v79;
          uint64_t v75 = objc_msgSend_UTF8String(v61, v62, v63);
          sub_244CC4DE0(2u, 1);
        }
        int v64 = objc_msgSend_length(v33, v59, v60, v74, v75);
        *(_DWORD *)buf = 2;
        *(void *)&v85[4] = "dwnpm_ble_bad_service_data";
        *(_DWORD *)&v85[12] = v64;
        v85[16] = 2;
        sub_244D7E78C((uint64_t)buf);
      }
    }
    else
    {
      v43 = sub_244CC8484(2u, "Ble");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v85 = v79;
        _os_log_impl(&dword_2446BD000, v43, OS_LOG_TYPE_ERROR, "A device (%p) with a matching Matter UUID has been discovered but it is not connectable.", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(2u, 1);
      }
    }
  }
LABEL_45:

LABEL_46:
}

- (BOOL)checkDiscriminator:(unsigned __int16)a3
{
  if (self->_deviceDiscriminator.mIsShortDiscriminator) {
    int v3 = HIBYTE(a3);
  }
  else {
    int v3 = a3;
  }
  return self->_deviceDiscriminator.mDiscriminator == v3;
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = a4;
  int v8 = 1;
  v9 = "dwnpm_ble_connect_peripheral";
  char v10 = 0;
  sub_244D7E78C((uint64_t)&v8);
  int v8 = 0;
  v9 = "dwnpm_ble_discovered_svs";
  char v10 = 0;
  sub_244D7E78C((uint64_t)&v8);
  objc_msgSend_setDelegate_(v5, v6, (uint64_t)self);
  objc_msgSend_discoverServices_(v5, v7, 0);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v49 = a4;
  if (v49)
  {
    int v8 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v49, v9, v10);
      id v11 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315138;
      *(void *)v59 = objc_msgSend_UTF8String(v11, v12, v13);
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "BLE:Error finding Chip Service in the device: [%s]", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      objc_msgSend_localizedDescription(v49, v6, v7);
      id v14 = objc_claimAutoreleasedReturnValue();
      uint64_t v47 = objc_msgSend_UTF8String(v14, v15, v16);
      sub_244CC4DE0(2u, 1);
    }
  }
  uint64_t v17 = objc_msgSend_code(v49, v6, v7, v47);
  *(_DWORD *)buf = 1;
  *(void *)&v59[4] = "dwnpm_ble_discovered_svs";
  int v60 = v17 & 0xFFFFFF | 0x1000000;
  char v61 = 3;
  sub_244D7E78C((uint64_t)buf);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  int v20 = objc_msgSend_services(v48, v18, v19);
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v53, v57, 16);
  if (v24)
  {
    uint64_t v25 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v54 != v25) {
          objc_enumerationMutation(v20);
        }
        v27 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v28 = objc_msgSend_UUID(v27, v22, v23);
        v31 = objc_msgSend_data(v28, v29, v30);
        v34 = objc_msgSend_data(self->_shortServiceUUID, v32, v33);
        if (objc_msgSend_isEqualToData_(v31, v35, (uint64_t)v34))
        {
          char v38 = objc_msgSend_found(self, v36, v37);

          if ((v38 & 1) == 0)
          {
            *(_DWORD *)buf = 0;
            *(void *)&v59[4] = "dwnpm_ble_discovered_chrs";
            char v61 = 0;
            sub_244D7E78C((uint64_t)buf);
            objc_msgSend_discoverCharacteristics_forService_(v48, v39, 0, v27);
            objc_msgSend_setFound_(self, v40, 1);
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v53, v57, 16);
    }
    while (v24);
  }
LABEL_17:

  char v43 = objc_msgSend_found(self, v41, v42);
  if (v49) {
    char v44 = 0;
  }
  else {
    char v44 = v43;
  }
  if ((v44 & 1) == 0)
  {
    uint64_t v45 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v45, OS_LOG_TYPE_ERROR, "Service not found on the device.", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(2u, 1);
    }
    *(_DWORD *)buf = 2;
    *(void *)&v59[4] = "dwnpm_ble_discovered_svs";
    int v60 = 3;
    char v61 = 3;
    sub_244D7E78C((uint64_t)buf);
    int v50 = 3;
    v51 = "src/platform/Darwin/BleConnectionDelegateImpl.mm";
    int v52 = 476;
    objc_msgSend_dispatchConnectionError_(self, v46, (uint64_t)&v50);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  *(_DWORD *)buf = 1;
  *(void *)&v25[4] = "dwnpm_ble_discovered_chrs";
  int v26 = objc_msgSend_code(v8, v9, v10) & 0xFFFFFF | 0x1000000;
  char v27 = 3;
  sub_244D7E78C((uint64_t)buf);
  if (v8)
  {
    id v12 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v8, v13, v14);
      id v15 = objc_claimAutoreleasedReturnValue();
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v25 = v18;
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "BLE:Error finding Characteristics in Chip service on the device: [%s]", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      objc_msgSend_localizedDescription(v8, v11, v19);
      id v20 = objc_claimAutoreleasedReturnValue();
      uint64_t v23 = objc_msgSend_UTF8String(v20, v21, v22);
      sub_244CC4DE0(2u, 1);
    }
  }
  objc_msgSend_dispatchConnectionComplete_(self, v11, (uint64_t)v7, v23);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (v11)
  {
    id v12 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v11, v13, v14);
      id v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = objc_msgSend_UTF8String(v15, v16, v17);
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "BLE:Error writing Characteristics in Chip service on the device: [%s]", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      objc_msgSend_localizedDescription(v11, v18, v19);
      id v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_UTF8String(v20, v21, v22);
      sub_244CC4DE0(2u, 1);
    }
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244D7AB64;
    block[3] = &unk_265193DC8;
    block[4] = self;
    id v28 = v8;
    id v24 = v8;
    dispatch_async(chipWorkQueue, block);
  }
  else
  {
    objc_msgSend_fillServiceWithCharacteristicUuids_svcId_charId_(BleConnection, v10, (uint64_t)v9, buf, &v33);
    uint64_t v25 = self->_chipWorkQueue;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_244D7AB4C;
    v29[3] = &unk_2651A92C8;
    v29[4] = self;
    id v30 = v8;
    long long v31 = *(_OWORD *)buf;
    long long v32 = v33;
    id v26 = v8;
    dispatch_async(v25, v29);
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char isNotifying = objc_msgSend_isNotifying(v9, v11, v12);
  if (v10)
  {
    id v15 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v10, v16, v17);
      id v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = objc_msgSend_UTF8String(v18, v19, v20);
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "BLE:Error subscribing/unsubcribing some characteristic on the device: [%s]", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      objc_msgSend_localizedDescription(v10, v21, v22);
      id v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_UTF8String(v23, v24, v25);
      sub_244CC4DE0(2u, 1);
    }
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244D7AEB8;
    block[3] = &unk_26519B3D0;
    char v32 = isNotifying;
    block[4] = self;
    id v31 = v8;
    id v27 = v8;
    dispatch_async(chipWorkQueue, block);
  }
  else
  {
    objc_msgSend_fillServiceWithCharacteristicUuids_svcId_charId_(BleConnection, v13, (uint64_t)v9, buf, &v38);
    id v28 = self->_chipWorkQueue;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_244D7AE94;
    v33[3] = &unk_2651A92F0;
    char v35 = isNotifying;
    v33[4] = self;
    id v34 = v8;
    long long v36 = *(_OWORD *)buf;
    long long v37 = v38;
    id v29 = v8;
    dispatch_async(v28, v33);
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (v11)
  {
    uint64_t v12 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v11, v13, v14);
      id v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = objc_msgSend_UTF8String(v15, v16, v17);
      _os_log_impl(&dword_2446BD000, v12, OS_LOG_TYPE_ERROR, "BLE:Error receiving indication of Characteristics on the device: [%s]", buf, 0xCu);
    }
    if (sub_244CC4E58(1u))
    {
      objc_msgSend_localizedDescription(v11, v18, v19);
      id v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_UTF8String(v20, v21, v22);
      sub_244CC4DE0(2u, 1);
    }
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244D7B478;
    block[3] = &unk_265193DC8;
    block[4] = self;
    id v32 = v8;
    id v24 = v8;
    dispatch_async(chipWorkQueue, block);
  }
  else
  {
    objc_msgSend_fillServiceWithCharacteristicUuids_svcId_charId_(BleConnection, v10, (uint64_t)v9, buf, &v39);
    id v27 = objc_msgSend_value(v9, v25, v26);
    id v28 = self->_chipWorkQueue;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    long long v37 = *(_OWORD *)buf;
    long long v38 = v39;
    v33[2] = sub_244D7B268;
    v33[3] = &unk_265193418;
    id v34 = v27;
    char v35 = self;
    id v36 = v8;
    id v29 = v8;
    id v30 = v27;
    dispatch_async(v28, v33);
  }
}

- (void)start
{
  if (self->_peripheral)
  {
    int v4 = 0;
    id v5 = "dwnpm_ble_discovered_matching_peripheral";
    char v6 = 0;
    sub_244D7E78C((uint64_t)&v4);
    objc_msgSend_connect_(self, v3, (uint64_t)self->_peripheral);
  }
  else
  {
    ((void (*)(BleConnection *, char *))MEMORY[0x270F9A6D0])(self, sel_startScanning);
  }
}

- (void)stop
{
  objc_msgSend_detachScannerDelegate(self, a2, v2);
  self->_found = 0;
  objc_msgSend_stopScanning(self, v4, v5);
  objc_msgSend_removePeripheralsFromCache(self, v6, v7);
  if (*(_OWORD *)&self->_centralManager != 0)
  {
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244D7B614;
    block[3] = &unk_265193E58;
    block[4] = self;
    dispatch_async(chipWorkQueue, block);
  }
}

- (void)_resetCounters
{
  *(void *)&self->_totalDevicesAdded = 0;
}

- (void)startScanning
{
  v16[1] = *MEMORY[0x263EF8340];
  if (self->_centralManager)
  {
    int v11 = 0;
    uint64_t v12 = "dwnpm_ble_scan";
    char v13 = 0;
    sub_244D7E78C((uint64_t)&v11);
    int v11 = 0;
    uint64_t v12 = "dwnpm_ble_discovered_peripheral";
    char v13 = 0;
    sub_244D7E78C((uint64_t)&v11);
    int v11 = 0;
    uint64_t v12 = "dwnpm_ble_discovered_matching_peripheral";
    char v13 = 0;
    sub_244D7E78C((uint64_t)&v11);
    objc_msgSend__resetCounters(self, v3, v4);
    uint64_t v15 = *MEMORY[0x263EFED50];
    v16[0] = MEMORY[0x263EFFA88];
    char v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v16, &v15, 1);
    centralManager = self->_centralManager;
    shortServiceUUID = self->_shortServiceUUID;
    id v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v8, (uint64_t)&shortServiceUUID, 1);
    objc_msgSend_scanForPeripheralsWithServices_options_(centralManager, v10, (uint64_t)v9, v6);
  }
}

- (void)stopScanning
{
  if (self->_centralManager)
  {
    int v9 = 1;
    id v10 = "dwnpm_ble_scan";
    char v11 = 0;
    sub_244D7E78C((uint64_t)&v9);
    objc_msgSend__resetCounters(self, v3, v4);
    objc_msgSend_clearTimer(self, v5, v6);
    objc_msgSend_stopScan(self->_centralManager, v7, v8);
  }
}

- (void)connect:(id)a3
{
  id v5 = a3;
  if (v5 && self->_centralManager)
  {
    int v7 = 1;
    uint64_t v8 = "dwnpm_ble_discovered_matching_peripheral";
    char v9 = 0;
    sub_244D7E78C((uint64_t)&v7);
    int v7 = 0;
    uint64_t v8 = "dwnpm_ble_connect_peripheral";
    char v9 = 0;
    sub_244D7E78C((uint64_t)&v7);
    objc_storeStrong((id *)&self->_peripheral, a3);
    objc_msgSend_connectPeripheral_options_(self->_centralManager, v6, (uint64_t)v5, 0);
  }
}

- (void)detachScannerDelegate
{
  scannerDelegate = self->_scannerDelegate;
  if (scannerDelegate)
  {
    self->_scannerDelegate = 0;
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244D7BA38;
    block[3] = &unk_2651997E0;
    block[4] = scannerDelegate;
    dispatch_async(chipWorkQueue, block);
  }
}

- (void)updateWithDelegate:(BleScannerDelegate *)a3 prewarm:(BOOL)a4
{
  BOOL v19 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_msgSend_detachScannerDelegate(self, a2, (uint64_t)a3);
  if (a3)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obj = self->_cachedPeripherals;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v25, v29, 16);
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v9, v13);
          uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"data");

          chipWorkQueue = self->_chipWorkQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_244D7BC80;
          block[3] = &unk_2651933A0;
          uint64_t v23 = v13;
          id v24 = a3;
          id v22 = v16;
          id v18 = v16;
          dispatch_async(chipWorkQueue, block);
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v25, v29, 16);
      }
      while (v10);
    }

    self->_scannerDelegate = a3;
  }
  if (v19)
  {
    self->_currentMode = 2;
    objc_msgSend_setupTimer_(self, v6, 120);
  }
  else
  {
    self->_currentMode = 1;
    objc_msgSend_clearTimer(self, v6, v7);
  }
}

- (void)updateWithDiscriminator:(const SetupDiscriminator *)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  objc_msgSend_detachScannerDelegate(self, a2, (uint64_t)a3);
  unsigned __int16 mDiscriminator = a3->mDiscriminator;
  self->_deviceDiscriminator.mIsShortDiscriminator = a3->mIsShortDiscriminator;
  self->_deviceDiscriminator.unsigned __int16 mDiscriminator = mDiscriminator;
  self->_currentMode = 3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = self->_cachedPeripherals;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, v37, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v8, (uint64_t)v12);
        uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"data");

        id v16 = v15;
        BOOL v19 = (_DWORD *)objc_msgSend_bytes(v16, v17, v18);
        if (objc_msgSend_checkDiscriminator_(self, v20, (*v19 >> 8) & 0xFFF))
        {
          id v21 = v12;

          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v30, v37, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v21 = 0;
LABEL_11:

  objc_msgSend_removePeripheralsFromCache(self, v22, v23);
  if (v21)
  {
    *(_DWORD *)buf = 0;
    *(void *)&v35[4] = "dwnpm_ble_discovered_matching_peripheral";
    char v36 = 0;
    sub_244D7E78C((uint64_t)buf);
    long long v25 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)char v35 = v21;
      _os_log_impl(&dword_2446BD000, v25, OS_LOG_TYPE_DEFAULT, "Connecting to cached device: %p", buf, 0xCu);
    }

    if (sub_244CC4E58(2u))
    {
      id v29 = v21;
      sub_244CC4DE0(2u, 2);
    }
    objc_msgSend_connect_(self, v26, (uint64_t)v21, v29);
    objc_msgSend_stopScanning(self, v27, v28);
  }
  else
  {
    objc_msgSend_setupTimer_(self, v24, 60);
  }
}

- (void)updateWithPeripheral:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_detachScannerDelegate(self, v5, v6);
  self->_currentMode = 3;
  *(_DWORD *)buf = 0;
  *(void *)&v13[4] = "dwnpm_ble_discovered_matching_peripheral";
  char v14 = 0;
  sub_244D7E78C((uint64_t)buf);
  uint64_t v7 = sub_244CC8484(2u, "Ble");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v13 = v4;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to device: %p", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    id v11 = v4;
    sub_244CC4DE0(2u, 2);
  }
  objc_msgSend_connect_(self, v8, (uint64_t)v4, v11);
  objc_msgSend_stopScanning(self, v9, v10);
}

- (void)addPeripheralToCache:(id)a3 data:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_msgSend_objectForKey_(self->_cachedPeripherals, v8, (uint64_t)v6);

  if (v9)
  {
    id v11 = objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v10, (uint64_t)v6);
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"data");
    int isEqualToData = objc_msgSend_isEqualToData_(v7, v14, (uint64_t)v13);

    if ((isEqualToData & 1) == 0)
    {
      uint64_t v17 = sub_244CC8484(2u, "Ble");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)long long v56 = v6;
        _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "Updating peripheral %p from the cache", buf, 0xCu);
      }

      if (sub_244CC4E58(2u))
      {
        id v42 = v6;
        sub_244CC4DE0(2u, 2);
      }
    }
    uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v16, (uint64_t)v6, v42);
    id v20 = objc_msgSend_objectForKeyedSubscript_(v18, v19, @"timer");

    int v21 = isEqualToData ^ 1;
  }
  else
  {
    id v22 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)long long v56 = v6;
      _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_DEFAULT, "Adding peripheral %p to the cache", buf, 0xCu);
    }

    if (sub_244CC4E58(2u))
    {
      id v42 = v6;
      sub_244CC4DE0(2u, 2);
    }
    scannerDelegate = self->_scannerDelegate;
    if (scannerDelegate)
    {
      chipWorkQueue = self->_chipWorkQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_244D7C7C8;
      block[3] = &unk_2651933A0;
      id v50 = v7;
      int v52 = scannerDelegate;
      id v51 = v6;
      dispatch_async(chipWorkQueue, block);
    }
    id v20 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_workQueue);
    uint64_t handler = MEMORY[0x263EF8330];
    uint64_t v44 = 3221225472;
    uint64_t v45 = sub_244D7C830;
    v46 = &unk_265193DC8;
    uint64_t v47 = self;
    id v48 = v6;
    dispatch_source_set_event_handler(v20, &handler);
    dispatch_resume(v20);

    int v21 = 1;
  }
  dispatch_time_t v25 = dispatch_walltime(0, 9000000000);
  dispatch_source_set_timer(v20, v25, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  long long v27 = objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v26, (uint64_t)v6);
  BOOL v28 = v27 == 0;

  if (v28)
  {
    int v30 = self->_totalDevicesAdded + 1;
    self->_totalDevicesAdded = v30;
    *(_DWORD *)buf = 2;
    *(void *)&v56[4] = "dwnpm_ble_peripheral_added";
    int v57 = v30;
    char v58 = 1;
    sub_244D7E78C((uint64_t)buf);
  }
  v53[0] = @"data";
  v53[1] = @"timer";
  v54[0] = v7;
  v54[1] = v20;
  long long v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v54, v53, 2, v42, handler, v44, v45, v46, v47);
  objc_msgSend_setObject_forKeyedSubscript_(self->_cachedPeripherals, v32, (uint64_t)v31, v6);

  if (v21)
  {
    id v33 = v7;
    unint64_t v36 = *objc_msgSend_bytes(v33, v34, v35);
    long long v37 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v56 = (v36 >> 20) & 0xF;
      _os_log_impl(&dword_2446BD000, v37, OS_LOG_TYPE_DEFAULT, "  - Version: %u", buf, 8u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(2u, 2);
    }
    uint64_t v38 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v56 = (v36 >> 8) & 0xFFF;
      _os_log_impl(&dword_2446BD000, v38, OS_LOG_TYPE_DEFAULT, "  - Discriminator: %u", buf, 8u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(2u, 2);
    }
    long long v39 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v56 = (unsigned __int16)(v36 >> 24);
      _os_log_impl(&dword_2446BD000, v39, OS_LOG_TYPE_DEFAULT, "  - VendorId: %u", buf, 8u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(2u, 2);
    }
    uint64_t v40 = sub_244CC8484(2u, "Ble");
    unint64_t v41 = v36 >> 40;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v56 = (unsigned __int16)v41;
      _os_log_impl(&dword_2446BD000, v40, OS_LOG_TYPE_DEFAULT, "  - ProductId: %u", buf, 8u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(2u, 2);
    }
  }
}

- (void)removePeripheralFromCache:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v6 = objc_msgSend_objectForKey_(self->_cachedPeripherals, v5, (uint64_t)v4);
  if (v6)
  {
    id v7 = sub_244CC8484(2u, "Ble");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v18 = v4;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_DEFAULT, "Removing peripheral %p from the cache", buf, 0xCu);
    }

    if (sub_244CC4E58(2u))
    {
      id v13 = v4;
      sub_244CC4DE0(2u, 2);
    }
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v6, v8, @"timer", v13);
    dispatch_source_cancel(v9);

    objc_msgSend_removeObjectForKey_(self->_cachedPeripherals, v10, (uint64_t)v4);
    scannerDelegate = self->_scannerDelegate;
    if (scannerDelegate)
    {
      chipWorkQueue = self->_chipWorkQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_244D7CA60;
      block[3] = &unk_26519B670;
      id v16 = scannerDelegate;
      id v15 = v4;
      dispatch_async(chipWorkQueue, block);
    }
  }
}

- (void)removePeripheralsFromCache
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend_allKeys(self->_cachedPeripherals, a2, v2, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v10, v14, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_removePeripheralFromCache_(self, v6, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v10, v14, 16);
    }
    while (v7);
  }
}

+ (void)fillServiceWithCharacteristicUuids:(id)a3 svcId:(ChipBleUUID *)a4 charId:(ChipBleUUID *)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v10 = objc_msgSend_UUID(v7, v8, v9);
  long long v13 = objc_msgSend_data(v10, v11, v12);
  uint64_t v16 = objc_msgSend_length(v13, v14, v15);

  if (v16 == 16)
  {
    uint64_t v19 = objc_msgSend_UUID(v7, v17, v18);
    objc_msgSend_data(v19, v20, v21);
    id v22 = objc_claimAutoreleasedReturnValue();
    *a5 = *(ChipBleUUID *)objc_msgSend_bytes(v22, v23, v24);

    *(void *)a4->var0 = 0;
    *(void *)&a4->var0[8] = 0;
    ChipBleUUID __dst = (ChipBleUUID)xmmword_244EC2740;
    long long v27 = objc_msgSend_service(v7, v25, v26);
    int v30 = objc_msgSend_UUID(v27, v28, v29);
    id v33 = objc_msgSend_data(v30, v31, v32);
    uint64_t v36 = objc_msgSend_length(v33, v34, v35);

    if (v36 == 2)
    {
      long long v39 = objc_msgSend_service(v7, v37, v38);
      id v42 = objc_msgSend_UUID(v39, v62, v63);
      objc_msgSend_data(v42, v64, v65);
      id v45 = objc_claimAutoreleasedReturnValue();
      *(_WORD *)&__dst.var0[2] = *(_WORD *)objc_msgSend_bytes(v45, v66, v67);
    }
    else
    {
      if (v36 != 4 && v36 != 16)
      {
        uint64_t v68 = sub_244CC8484(2u, "Ble");
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl(&dword_2446BD000, v68, OS_LOG_TYPE_ERROR, "Service UUIDs are incompatible", v69, 2u);
        }

        if (sub_244CC4E58(1u)) {
          sub_244CC4DE0(2u, 1);
        }
        goto LABEL_12;
      }
      long long v39 = objc_msgSend_service(v7, v37, v38);
      id v42 = objc_msgSend_UUID(v39, v40, v41);
      objc_msgSend_data(v42, v43, v44);
      id v45 = objc_claimAutoreleasedReturnValue();
      id v48 = (const void *)objc_msgSend_bytes(v45, v46, v47);
      id v51 = objc_msgSend_service(v7, v49, v50);
      long long v54 = objc_msgSend_UUID(v51, v52, v53);
      int v57 = objc_msgSend_data(v54, v55, v56);
      size_t v60 = objc_msgSend_length(v57, v58, v59);
      memcpy(&__dst, v48, v60);
    }
LABEL_12:
    *a4 = __dst;
    goto LABEL_13;
  }
  char v61 = sub_244CC8484(2u, "Ble");
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__dst.var0 = 0;
    _os_log_impl(&dword_2446BD000, v61, OS_LOG_TYPE_ERROR, "UUID of characteristic is incompatible", __dst.var0, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(2u, 1);
  }
LABEL_13:
}

- (void)setBleLayer:(BleLayer *)a3
{
  self->_mBleLayer = a3;
}

- (OS_dispatch_queue)chipWorkQueue
{
  return self->_chipWorkQueue;
}

- (void)setChipWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (CBUUID)shortServiceUUID
{
  return self->_shortServiceUUID;
}

- (void)setShortServiceUUID:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (unsigned)currentMode
{
  return self->_currentMode;
}

- (NSMutableDictionary)cachedPeripherals
{
  return self->_cachedPeripherals;
}

- (void)setCachedPeripherals:(id)a3
{
}

- (BOOL)found
{
  return self->_found;
}

- (void)setFound:(BOOL)a3
{
  self->_found = a3;
}

- (SetupDiscriminator)deviceDiscriminator
{
  return self->_deviceDiscriminator;
}

- (void)setDeviceDiscriminator:(SetupDiscriminator)a3
{
  self->_deviceDiscriminator = a3;
}

- (void)appState
{
  return self->_appState;
}

- (void)setAppState:(void *)a3
{
  self->_appState = a3;
}

- (void)onConnectionComplete
{
  return self->_onConnectionComplete;
}

- (void)setOnConnectionComplete:(void *)a3
{
  self->_onConnectionComplete = a3;
}

- (void)onConnectionError
{
  return self->_onConnectionError;
}

- (void)setOnConnectionError:(void *)a3
{
  self->_onConnectionError = a3;
}

- (BleScannerDelegate)scannerDelegate
{
  return self->_scannerDelegate;
}

- (void)setScannerDelegate:(BleScannerDelegate *)a3
{
  self->_scannerDelegate = a3;
}

- (BleLayer)mBleLayer
{
  return self->_mBleLayer;
}

- (void)setMBleLayer:(BleLayer *)a3
{
  self->_mBleLayer = a3;
}

- (int)totalDevicesAdded
{
  return self->_totalDevicesAdded;
}

- (int)totalDevicesRemoved
{
  return self->_totalDevicesRemoved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPeripherals, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_shortServiceUUID, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_chipWorkQueue, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 5) = 0;
  *((unsigned char *)self + 12) = 0;
  return self;
}

@end
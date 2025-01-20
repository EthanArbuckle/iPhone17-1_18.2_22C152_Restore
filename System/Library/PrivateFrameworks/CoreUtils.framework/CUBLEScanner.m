@interface CUBLEScanner
- (BOOL)_shouldScan;
- (CUBLEScanner)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)_scanParameters;
- (id)_scanParametersSummary:(id)a3;
- (id)bluetoothStateChangedHandler;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (int)bluetoothState;
- (int)rssiThreshold;
- (int)scanRate;
- (unsigned)changeFlags;
- (unsigned)scanFlags;
- (void)_invalidate;
- (void)_invalidated;
- (void)_stopScanIfNeededWithReason:(const char *)a3;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_updateScanRules:(id *)a3 payloadType:(unsigned __int8)a4 rssiThreshold:(int)a5;
- (void)activate;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setBluetoothState:(int)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRssiThreshold:(int)a3;
- (void)setScanFlags:(unsigned int)a3;
- (void)setScanRate:(int)a3;
@end

@implementation CUBLEScanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_scanParametersCurrent, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

- (int)scanRate
{
  return self->_scanRate;
}

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothState:(int)a3
{
  self->_bluetoothState = a3;
}

- (int)bluetoothState
{
  return self->_bluetoothState;
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v12 identifier];
  id v37 = [v14 UUIDString];

  v15 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v37];
  v16 = objc_alloc_init(CUBLEDevice);
  [(CUBLEDevice *)v16 setIdentifier:v37];
  uint64_t v17 = [v10 intValue];

  unsigned int v18 = [(CUBLEDevice *)v16 updateWithAdvertisementData:v11 rssi:v17 oldDevice:v15];
  uint64_t v19 = v18 | 0x18;
  if (v15) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v18 | 0x38;
  }
  [(CUBLEDevice *)v16 setChangeFlags:v20];
  v21 = [v13 sharedPairingAgent];

  uint64_t v22 = [v21 isPeerPaired:v12];
  [(CUBLEDevice *)v16 setDeviceFlags:v22];
  unsigned int scanFlags = self->_scanFlags;
  if ((scanFlags & 0xFE) != 0 && ([(CUBLEDevice *)v16 scanFlags] & scanFlags & 0xFE) == 0)
  {
    int v29 = 0;
    signed int v28 = 8;
  }
  else
  {
    signed int v28 = 9;
    int v29 = 1;
  }
  ucat = self->_ucat;
  if (v28 < ucat->var0) {
    goto LABEL_12;
  }
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, v28)) {
      goto LABEL_12;
    }
    ucat = self->_ucat;
  }
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", v28, (uint64_t)"Found: %@\n", v23, v24, v25, v26, (uint64_t)v16);
LABEL_12:
  if (!v29) {
    goto LABEL_23;
  }
  devices = self->_devices;
  if (!devices)
  {
    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v33 = self->_devices;
    self->_devices = v32;

    devices = self->_devices;
  }
  [(NSMutableDictionary *)devices setObject:v16 forKeyedSubscript:v37];
  if (!v15) {
    goto LABEL_20;
  }
  if ((self->_changeFlags & v19) == 0) {
    goto LABEL_23;
  }
  if ((scanFlags & 0x100) != 0)
  {
LABEL_20:
    v36 = _Block_copy(self->_deviceFoundHandler);
    v35 = v36;
    if (v36) {
      (*((void (**)(void *, CUBLEDevice *))v36 + 2))(v36, v16);
    }
  }
  else
  {
    v34 = _Block_copy(self->_deviceChangedHandler);
    v35 = v34;
    if (v34) {
      (*((void (**)(void *, CUBLEDevice *, uint64_t))v34 + 2))(v34, v16, v19);
    }
  }

LABEL_23:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unint64_t v6 = [v5 state];

  ucat = self->_ucat;
  if (ucat->var0 > 30) {
    goto LABEL_9;
  }
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
      goto LABEL_9;
    }
    ucat = self->_ucat;
  }
  if (v6 > 0xA) {
    id v12 = "?";
  }
  else {
    id v12 = off_1E55BDD88[v6];
  }
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner centralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth scanner state changed: %s\n", v7, v8, v9, v10, (uint64_t)v12);
LABEL_9:
  unint64_t v13 = v6 - 1;
  if (v13 > 9) {
    int v14 = 0;
  }
  else {
    int v14 = dword_18E4174EC[v13];
  }
  self->_bluetoothState = v14;
  v15 = _Block_copy(self->_bluetoothStateChangedHandler);
  v16 = v15;
  if (v15) {
    (*((void (**)(void *))v15 + 2))(v15);
  }

  switch(v13)
  {
    case 0uLL:
    case 3uLL:
      self->_scannerStartCalled = 0;
      break;
    case 4uLL:
    case 9uLL:
      [(CUBLEScanner *)self _update];
      break;
    default:
      return;
  }
}

- (void)_updateScanRules:(id *)a3 payloadType:(unsigned __int8)a4 rssiThreshold:(int)a5
{
  uint64_t v6 = a4;
  v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = [NSNumber numberWithUnsignedChar:v6];
  uint64_t v10 = getCBCentralManagerScanOptionMatchingRuleTypeKey[0]();
  [v8 setObject:v9 forKeyedSubscript:v10];

  if (a5) {
    uint64_t v11 = a5;
  }
  else {
    uint64_t v11 = 4294967216;
  }
  id v12 = [NSNumber numberWithInt:v11];
  unint64_t v13 = getCBCentralManagerScanOptionMatchingRuleRSSIKey[0]();
  [v8 setObject:v12 forKeyedSubscript:v13];

  uint64_t v21 = 0;
  v22[0] = 0;
  *(void *)((char *)v22 + 6) = 0;
  uint64_t v19 = 0;
  v20[0] = 0;
  *(void *)((char *)v20 + 6) = 0;
  int v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v21 length:22];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v19 length:22];
  v16 = getCBCentralManagerScanOptionMatchingRulePayloadKey[0]();
  [v8 setObject:v14 forKeyedSubscript:v16];

  uint64_t v17 = getCBCentralManagerScanOptionMatchingRuleMaskKey[0]();
  [v8 setObject:v15 forKeyedSubscript:v17];

  id v18 = *a3;
  if (!v18)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_storeStrong(a3, v18);
  }
  [v18 addObject:v8];
}

- (void)_stopScanIfNeededWithReason:(const char *)a3
{
  if (self->_scannerStartCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_6;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _stopScanIfNeededWithReason:]", 0x1Eu, (uint64_t)"Scanner stop (%s)\n", v3, v4, v5, v6, (uint64_t)a3);
    }
LABEL_6:
    self->_scannerStartCalled = 0;
    [(CBCentralManager *)self->_centralManager stopScan];
  }
  if (!self->_invalidateCalled)
  {
    uint64_t v10 = _Block_copy(self->_deviceLostHandler);
    if (v10)
    {
      devices = self->_devices;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __44__CUBLEScanner__stopScanIfNeededWithReason___block_invoke;
      v12[3] = &unk_1E55BD970;
      v12[4] = v10;
      [(NSMutableDictionary *)devices enumerateKeysAndObjectsUsingBlock:v12];
    }
  }
  [(NSMutableDictionary *)self->_devices removeAllObjects];
}

uint64_t __44__CUBLEScanner__stopScanIfNeededWithReason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldScan
{
  if ((self->_scanFlags & 1) != 0 || (BOOL v2 = [(CUSystemMonitor *)self->_systemMonitor screenOn])) {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (id)_scanParametersSummary:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  id v4 = (id)getCBCentralManagerScanOptionScanInterval[0]();
  CFDictionaryGetInt64Ranged(v3, v4, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  id v5 = (id)getCBCentralManagerScanOptionScanWindow[0]();
  int64_t Int64Ranged = CFDictionaryGetInt64Ranged(v3, v5, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  CFMutableStringRef v75 = 0;
  NSAppendPrintF(&v75, (uint64_t)"%d/%d ms (%d%%)", v7, v8, v9, v10, v11, v12, Int64Ranged);
  unint64_t v13 = v75;
  id v14 = (id)getCBCentralManagerScanOptionMatchingRuleKey[0]();
  CFTypeID TypeID = CFArrayGetTypeID();
  v16 = CFDictionaryGetTypedValue(v3, v14, TypeID, 0);
  if ([v16 count])
  {
    CFMutableStringRef v74 = v13;
    NSAppendPrintF(&v74, (uint64_t)", Filters[", v17, v18, v19, v20, v21, v22, v64);
    uint64_t v23 = v74;

    unint64_t v13 = v23;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v16;
  uint64_t v24 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = "";
    uint64_t v27 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v71 != v27) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v29 = *(const __CFDictionary **)(*((void *)&v70 + 1) + 8 * i);
        id v30 = (id)getCBCentralManagerScanOptionMatchingRuleTypeKey[0]();
        CFDictionaryGetInt64Ranged(v29, v30, 0, 255, 0);
        CFMutableStringRef v69 = v13;
        NSAppendPrintF(&v69, (uint64_t)"%s%s", v31, v32, v33, v34, v35, v36, (uint64_t)v26);
        id v37 = v69;

        id v38 = (id)getCBCentralManagerScanOptionMatchingRuleRSSIKey[0]();
        int64_t v39 = CFDictionaryGetInt64Ranged(v29, v38, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
        if (v39)
        {
          CFMutableStringRef v68 = v37;
          NSAppendPrintF(&v68, (uint64_t)", RSSI %d", v40, v41, v42, v43, v44, v45, v39);
          unint64_t v13 = v68;
        }
        else
        {
          unint64_t v13 = v37;
        }
        uint64_t v26 = "; ";
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
      uint64_t v26 = "; ";
    }
    while (v25);
  }

  if ([obj count])
  {
    CFMutableStringRef v67 = v13;
    NSAppendPrintF(&v67, (uint64_t)"]", v46, v47, v48, v49, v50, v51, v64);
    v52 = v67;

    unint64_t v13 = v52;
  }
  id v53 = (id)getCBCentralManagerScanOptionAllowDuplicatesKey[0]();
  if (CFDictionaryGetInt64(v3, v53, 0))
  {
    CFMutableStringRef v66 = v13;
    NSAppendPrintF(&v66, (uint64_t)", Dups", v54, v55, v56, v57, v58, v59, v64);
    v60 = v66;

    unint64_t v13 = v60;
  }
  if (v13) {
    v61 = v13;
  }
  else {
    v61 = @"?";
  }
  v62 = v61;

  return v62;
}

- (id)_scanParameters
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  unsigned int scanFlags = v2->_scanFlags;
  int v4 = v2->_changeFlags & 0x18;
  uint64_t rssiThreshold = v2->_rssiThreshold;
  int scanRate = v2->_scanRate;
  if (scanRate == 60) {
    int v7 = 30;
  }
  else {
    int v7 = 966;
  }
  if (scanRate == 50) {
    unsigned int v8 = 40;
  }
  else {
    unsigned int v8 = v7;
  }
  if (scanRate == 40) {
    unsigned int v9 = 60;
  }
  else {
    unsigned int v9 = 966;
  }
  if (scanRate == 30) {
    unsigned int v9 = 300;
  }
  if (scanRate <= 49) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v8;
  }
  objc_sync_exit(v2);

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((scanFlags & 0x40) != 0)
  {
    uint64_t v12 = getCBCentralManagerScanOptionActive[0]();
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v12];
  }
  if (v4)
  {
    unint64_t v13 = getCBCentralManagerScanOptionAllowDuplicatesKey[0]();
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v13];
  }
  id v14 = [NSNumber numberWithInt:v10];
  v15 = getCBCentralManagerScanOptionScanInterval[0]();
  [v11 setObject:v14 forKeyedSubscript:v15];

  v16 = [NSNumber numberWithInt:30];
  uint64_t v17 = getCBCentralManagerScanOptionScanWindow[0]();
  [v11 setObject:v16 forKeyedSubscript:v17];

  uint64_t v18 = getCBManagerIsPrivilegedDaemonKey_1456[0]();
  [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v18];

  uint64_t v23 = 0;
  if ((scanFlags & 2) != 0) {
    [(CUBLEScanner *)v2 _updateScanRules:&v23 payloadType:15 rssiThreshold:rssiThreshold];
  }
  if ((scanFlags & 4) != 0) {
    [(CUBLEScanner *)v2 _updateScanRules:&v23 payloadType:16 rssiThreshold:rssiThreshold];
  }
  if ((scanFlags & 0x90) != 0) {
    [(CUBLEScanner *)v2 _updateScanRules:&v23 payloadType:7 rssiThreshold:rssiThreshold];
  }
  if ((scanFlags & 0x20) != 0) {
    [(CUBLEScanner *)v2 _updateScanRules:&v23 payloadType:18 rssiThreshold:rssiThreshold];
  }
  uint64_t v19 = v23;
  if (v23)
  {
    uint64_t v20 = getCBCentralManagerScanOptionMatchingRuleKey[0]();
    [v11 setObject:v19 forKeyedSubscript:v20];

    uint64_t v21 = v23;
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v11;
}

- (void)_update
{
  v57[1] = *MEMORY[0x1E4F143B8];
  if (!self->_invalidateCalled)
  {
    centralManager = self->_centralManager;
    int v4 = centralManager;
    if (!centralManager)
    {
      id v5 = objc_alloc((Class)getCBCentralManagerClass_1462[0]());
      dispatchQueue = self->_dispatchQueue;
      int v7 = getCBManagerNeedsRestrictedStateOperation_1463[0]();
      uint64_t v56 = v7;
      v57[0] = MEMORY[0x1E4F1CC38];
      unsigned int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      unsigned int v9 = (CBCentralManager *)[v5 initWithDelegate:self queue:dispatchQueue options:v8];
      uint64_t v10 = self->_centralManager;
      self->_centralManager = v9;

      int v4 = self->_centralManager;
      if (!v4)
      {
        ucat = self->_ucat;
        if (ucat->var0 > 90) {
          return;
        }
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
            return;
          }
          ucat = self->_ucat;
        }
        uint64_t v36 = "### Create CBCentralManager failed\n";
        unsigned int v37 = 90;
        goto LABEL_44;
      }
    }
    uint64_t v15 = [(CBCentralManager *)v4 state];
    if (v15 != 5 && v15 != 10)
    {
      if (!centralManager) {
        return;
      }
      unint64_t v33 = v15;
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        return;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      if (v33 > 0xA) {
        uint64_t v35 = "?";
      }
      else {
        uint64_t v35 = off_1E55BDD18[v33];
      }
      uint64_t v53 = (uint64_t)v35;
      uint64_t v36 = "Deferring until Bluetooth powered: %s\n";
      unsigned int v37 = 30;
LABEL_44:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _update]", v37, (uint64_t)v36, v11, v12, v13, v14, v53);
      return;
    }
    if ((self->_scanFlags & 1) == 0 && !self->_systemMonitor)
    {
      uint64_t v17 = objc_alloc_init(CUSystemMonitor);
      systemMonitor = self->_systemMonitor;
      self->_systemMonitor = v17;

      [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __23__CUBLEScanner__update__block_invoke;
      v55[3] = &unk_1E55BFC18;
      v55[4] = self;
      [(CUSystemMonitor *)self->_systemMonitor setScreenOnChangedHandler:v55];
      uint64_t v19 = self->_systemMonitor;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __23__CUBLEScanner__update__block_invoke_2;
      v54[3] = &unk_1E55BFC18;
      v54[4] = self;
      [(CUSystemMonitor *)v19 activateWithCompletion:v54];
    }
    uint64_t v20 = self;
    objc_sync_enter(v20);
    BOOL changesPending = v20->_changesPending;
    v20->_BOOL changesPending = 0;
    objc_sync_exit(v20);

    if (![(CUBLEScanner *)v20 _shouldScan])
    {
      [(CUBLEScanner *)v20 _stopScanIfNeededWithReason:"criteria"];
      return;
    }
    if (v20->_scannerStartCalled)
    {
      if (!changesPending) {
        return;
      }
      uint64_t v22 = [(CUBLEScanner *)v20 _scanParameters];
      p_scanParametersCurrent = (id *)&v20->_scanParametersCurrent;
      scanParametersCurrent = v20->_scanParametersCurrent;
      uint64_t v25 = v22;
      uint64_t v26 = scanParametersCurrent;
      if (v25 == v26)
      {
      }
      else
      {
        uint64_t v27 = v26;
        if ((v25 == 0) == (v26 != 0))
        {

          goto LABEL_37;
        }
        char v28 = [(NSDictionary *)v25 isEqual:v26];

        if ((v28 & 1) == 0)
        {
LABEL_37:
          uint64_t v46 = v20->_ucat;
          if (v46->var0 <= 30)
          {
            if (v46->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v20->_ucat, 0x1Eu)) {
                goto LABEL_52;
              }
              uint64_t v46 = v20->_ucat;
            }
            uint64_t v47 = [(CUBLEScanner *)v20 _scanParametersSummary:v25];
            LogPrintF((uint64_t)v46, (uint64_t)"-[CUBLEScanner _update]", 0x1Eu, (uint64_t)"Scanner update: %@\n", v48, v49, v50, v51, (uint64_t)v47);
          }
LABEL_52:
          objc_storeStrong(p_scanParametersCurrent, v22);
          [(CBCentralManager *)self->_centralManager stopScan];
          goto LABEL_53;
        }
      }
      uint64_t v45 = v20->_ucat;
      if (v45->var0 <= 10)
      {
        if (v45->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v45, 0xAu)) {
            goto LABEL_54;
          }
          uint64_t v45 = v20->_ucat;
        }
        LogPrintF((uint64_t)v45, (uint64_t)"-[CUBLEScanner _update]", 0xAu, (uint64_t)"Scanner no changes\n", v29, v30, v31, v32, v53);
      }
LABEL_54:

      return;
    }
    id v38 = [(CUBLEScanner *)v20 _scanParameters];
    int64_t v39 = v20->_ucat;
    if (v39->var0 <= 30)
    {
      if (v39->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v20->_ucat, 0x1Eu)) {
          goto LABEL_48;
        }
        int64_t v39 = v20->_ucat;
      }
      uint64_t v40 = [(CUBLEScanner *)v20 _scanParametersSummary:v38];
      LogPrintF((uint64_t)v39, (uint64_t)"-[CUBLEScanner _update]", 0x1Eu, (uint64_t)"Scanner start: %@\n", v41, v42, v43, v44, (uint64_t)v40);
    }
LABEL_48:
    v52 = v20->_scanParametersCurrent;
    v20->_scanParametersCurrent = v38;
    uint64_t v25 = v38;

    v20->_scannerStartCalled = 1;
LABEL_53:
    [(CBCentralManager *)self->_centralManager scanForPeripheralsWithServices:0 options:v25];
    goto LABEL_54;
  }
}

uint64_t __23__CUBLEScanner__update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

uint64_t __23__CUBLEScanner__update__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  int v4 = (uint64_t (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_BOOL changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__CUBLEScanner__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E55BFC18;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __41__CUBLEScanner__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v15);
    }
  }
}

- (void)_invalidate
{
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v10);
  }
LABEL_6:
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  [(CUBLEScanner *)self _stopScanIfNeededWithReason:"invalidate"];
  [(CBCentralManager *)self->_centralManager setDelegate:0];
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  [(CUBLEScanner *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CUBLEScanner_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CUBLEScanner_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CUBLEScanner_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

uint64_t __24__CUBLEScanner_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (int *)v9[9];
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUBLEScanner activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
      uint64_t v9 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = (int *)v9[9];
      goto LABEL_3;
    }
  }
LABEL_5:
  return [v9 _update];
}

- (void)setScanRate:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__CUBLEScanner_setScanRate___block_invoke;
  v3[3] = &unk_1E55BDE70;
  int v4 = a3;
  v3[4] = self;
  [(CUBLEScanner *)self _updateIfNeededWithBlock:v3];
}

BOOL __28__CUBLEScanner_setScanRate___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 92);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 92) = v1;
  }
  return v1 != v3;
}

- (void)setScanFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__CUBLEScanner_setScanFlags___block_invoke;
  v3[3] = &unk_1E55BDE70;
  unsigned int v4 = a3;
  v3[4] = self;
  [(CUBLEScanner *)self _updateIfNeededWithBlock:v3];
}

BOOL __29__CUBLEScanner_setScanFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 88);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 88) = v1;
  }
  return v1 != v3;
}

- (void)setRssiThreshold:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__CUBLEScanner_setRssiThreshold___block_invoke;
  v3[3] = &unk_1E55BDE70;
  int v4 = a3;
  v3[4] = self;
  [(CUBLEScanner *)self _updateIfNeededWithBlock:v3];
}

BOOL __33__CUBLEScanner_setRssiThreshold___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 44);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 44) = v1;
  }
  return v1 != v3;
}

- (int)rssiThreshold
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int rssiThreshold = v2->_rssiThreshold;
  objc_sync_exit(v2);

  return rssiThreshold;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC478;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)setChangeFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__CUBLEScanner_setChangeFlags___block_invoke;
  v3[3] = &unk_1E55BDE70;
  unsigned int v4 = a3;
  v3[4] = self;
  [(CUBLEScanner *)self _updateIfNeededWithBlock:v3];
}

BOOL __31__CUBLEScanner_setChangeFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 84);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 84) = v1;
  }
  return v1 != v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUBLEScanner;
  [(CUBLEScanner *)&v4 dealloc];
}

- (CUBLEScanner)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUBLEScanner;
  uint64_t v2 = [(CUBLEScanner *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_int scanRate = 30;
    v3->_ucat = (LogCategory *)&gLogCategory_CUBLEScanner;
    objc_super v4 = v3;
  }

  return v3;
}

@end
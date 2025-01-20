@interface AXUIBluetoothHelper
+ (int)lastInitError;
- (AXUIBluetoothHelper)init;
- (BOOL)_onlySensorsConnected;
- (BOOL)_setup:(BTSessionImpl *)a3;
- (BOOL)attach:(id)a3;
- (BOOL)audioConnected;
- (BOOL)available;
- (BOOL)btleDeviceIsPaired:(id)a3;
- (BOOL)connectAddress:(id)a3;
- (BOOL)connectDevice:(id)a3;
- (BOOL)connectDevice:(id)a3 withServices:(unsigned int)a4;
- (BOOL)connectable;
- (BOOL)connected;
- (BOOL)devicePairingEnabled;
- (BOOL)deviceScanningEnabled;
- (BOOL)disconnectAddress:(id)a3;
- (BOOL)disconnectDevice:(id)a3;
- (BOOL)isAnyoneScanning;
- (BOOL)isDiscoverable;
- (BOOL)isPairedDeviceBrailleDisplay:(id)a3;
- (BOOL)isServiceSupported:(unsigned int)a3;
- (BOOL)peripheralMatchesUnadvertisedService:(id)a3;
- (BOOL)powered;
- (BOOL)setEnabled:(BOOL)a3;
- (BOOL)setPowered:(BOOL)a3;
- (BOOL)unpairAddress:(id)a3;
- (BOOL)unpairDevice:(id)a3;
- (BOOL)wasDeviceDiscovered:(id)a3;
- (CBCentralManager)centralManager;
- (NSArray)pairedBTLEDevices;
- (id)addDeviceIfNeeded:(BTDeviceImpl *)a3;
- (id)allowedServices;
- (id)connectingDevices;
- (id)deviceForPeripheral:(id)a3;
- (id)discoveredDevices;
- (id)pairedDevices;
- (int64_t)powerState;
- (unsigned)authorizedServices;
- (unsigned)authorizedServicesForDevice:(id)a3;
- (void)_addDiscoveredDevice:(id)a3;
- (void)_cleanup:(BOOL)a3;
- (void)_connectabilityChanged;
- (void)_connectedStatusChanged;
- (void)_discoveryStateChanged;
- (void)_peripheralDidCompletePairing:(id)a3;
- (void)_postNotification:(id)a3;
- (void)_postNotificationWithArray:(id)a3;
- (void)_powerChanged;
- (void)_removeDevice:(id)a3;
- (void)_restartScan;
- (void)_setDiscoveryAgentScanning:(BOOL)a3;
- (void)_setupCentralScanning:(BOOL)a3;
- (void)_updateCentralManagerScan;
- (void)acceptSSP:(int)a3 forDevice:(id)a4;
- (void)cancelPairing;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)clearDiscoveredDevices;
- (void)dealloc;
- (void)deviceDiscovered:(id)a3;
- (void)deviceRemoved:(id)a3;
- (void)deviceUpdated:(id)a3;
- (void)isAnyoneScanning;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)peripheralDidUpdateName:(id)a3;
- (void)postNotification:(id)a3;
- (void)postNotificationName:(id)a3 object:(id)a4;
- (void)postNotificationName:(id)a3 object:(id)a4 error:(id)a5;
- (void)resetDeviceScanning;
- (void)setAudioConnected:(BOOL)a3;
- (void)setAuthorizedServices:(unsigned int)a3;
- (void)setCentralManager:(id)a3;
- (void)setConnectable:(BOOL)a3;
- (void)setDevicePairingEnabled:(BOOL)a3;
- (void)setDeviceScanningEnabled:(BOOL)a3;
- (void)setDiscoverable:(BOOL)a3;
- (void)setPincode:(id)a3 forDevice:(id)a4;
- (void)unpairBTLEDevice:(id)a3;
@end

@implementation AXUIBluetoothHelper

+ (int)lastInitError
{
  return _lastInitError;
}

- (BOOL)available
{
  return self->_available == 2;
}

- (AXUIBluetoothHelper)init
{
  v11.receiver = self;
  v11.super_class = (Class)AXUIBluetoothHelper;
  v2 = [(AXUIBluetoothHelper *)&v11 init];
  v3 = v2;
  if (v2 && ![(AXUIBluetoothHelper *)v2 attach:&unk_1EDC62508])
  {
    v3->_authorizedServices = 0;
    [(AXUIBluetoothHelper *)v3 _cleanup:1];
    v9 = 0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    discoveredDevices = v3->_discoveredDevices;
    v3->_discoveredDevices = (NSMutableDictionary *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F1BD18]);
    v7 = (void *)[v6 initWithDelegate:v3 queue:MEMORY[0x1E4F14428] options:0];
    [(AXUIBluetoothHelper *)v3 setCentralManager:v7];

    v8 = [(CBCentralManager *)v3->_centralManager sharedPairingAgent];
    [v8 setDelegate:v3];

    v9 = v3;
  }

  return v9;
}

- (void)clearDiscoveredDevices
{
}

- (id)discoveredDevices
{
  return (id)[(NSMutableDictionary *)self->_discoveredDevices allValues];
}

- (BOOL)attach:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 integerValue] >= 1)
  {
    v5 = AXLogBluetooth();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = [v4 intValue];
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: attemping to re-attach in %d seconds", buf, 8u);
    }

    -[AXUIBluetoothHelper performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_attach_, 0, (double)(int)[v4 intValue]);
    goto LABEL_6;
  }
  if (self->_available)
  {
LABEL_6:
    BOOL v6 = 1;
    goto LABEL_7;
  }
  v8 = AXLogBluetooth();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "VOTBTM: attaching to BTServer", buf, 2u);
  }

  v9 = NSString;
  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v11 = [v10 bundleIdentifier];
  v12 = [v9 stringWithFormat:@"VOBTM%@-%u", v11, getpid()];

  id v13 = v12;
  [v13 cStringUsingEncoding:4];
  int v14 = BTSessionAttachWithQueue();
  v15 = AXLogBluetooth();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v14;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTSessionAttachWithRunLoopAsync failed with error %d", buf, 8u);
    }

    _lastInitError = v14;
    BOOL v6 = 0;
  }
  else
  {
    if (v16)
    {
      v17 = [NSNumber numberWithInt:0];
      *(_DWORD *)buf = 138412546;
      id v19 = v13;
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_DEFAULT, "VOTBTM: Did request attach to session with id: %@. result:%@", buf, 0x16u);
    }
    BOOL v6 = 1;
    self->_available = 1;
  }
LABEL_7:

  return v6;
}

- (BOOL)_setup:(BTSessionImpl *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_session = a3;
  int v4 = BTServiceAddCallbacks();
  if (v4)
  {
    int v5 = v4;
    BOOL v6 = AXLogBluetooth();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109120;
      int v17 = v5;
      v7 = "VOTBTM: BTServiceAddCallbacks failed with error %d";
LABEL_10:
      _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, 8u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  int Default = BTLocalDeviceGetDefault();
  if (Default)
  {
    int v5 = Default;
    BOOL v6 = AXLogBluetooth();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109120;
      int v17 = v5;
      v7 = "VOTBTM: BTLocalDeviceGetDefault failed with error %d";
      goto LABEL_10;
    }
LABEL_11:

    BOOL v10 = 0;
    _lastInitError = v5;
    return v10;
  }
  int v9 = BTLocalDeviceAddCallbacks();
  if (v9)
  {
    int v5 = v9;
    BOOL v6 = AXLogBluetooth();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109120;
      int v17 = v5;
      v7 = "VOTBTM: BTLocalDeviceAddCallbacks failed with %d";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v12 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
  btAddrDict = self->_btAddrDict;
  self->_btAddrDict = v12;

  int v14 = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
  btDeviceDict = self->_btDeviceDict;
  self->_btDeviceDict = v14;

  _lastInitError = 0;
  self->_available = 2;
  if (self->_wantsScanningEnabled) {
    [(AXUIBluetoothHelper *)self setDeviceScanningEnabled:1];
  }
  BOOL v10 = 1;
  if (self->_wantsDiscoveryEnabled) {
    [(AXUIBluetoothHelper *)self setDevicePairingEnabled:1];
  }
  return v10;
}

- (void)resetDeviceScanning
{
  p_discoveryAgent = &self->_discoveryAgent;
  if (self->_discoveryAgent)
  {
    BTDiscoveryAgentDestroy();
    *p_discoveryAgent = 0;
  }
}

- (BOOL)deviceScanningEnabled
{
  return self->_scanningEnabled;
}

- (void)setDeviceScanningEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_session)
  {
    int v5 = AXLogBluetooth();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = "disabled";
      if (v3) {
        BOOL v6 = "enabled";
      }
      int v9 = 136446210;
      BOOL v10 = v6;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting device scanning %{public}s", (uint8_t *)&v9, 0xCu);
    }

    [(AXUIBluetoothHelper *)self _setDiscoveryAgentScanning:v3];
    BOOL v7 = 0;
    self->_scanningEnabled = v3;
  }
  else
  {
    if (!a3) {
      return;
    }
    v8 = AXLogBluetooth();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "VOTBTM: attempted to start scanning, but there is not yet an active session", (uint8_t *)&v9, 2u);
    }

    BOOL v7 = 1;
  }
  self->_wantsScanningEnabled = v7;
}

- (void)_setDiscoveryAgentScanning:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_session)
  {
    p_discoveryAgent = &self->_discoveryAgent;
    discoveryAgent = self->_discoveryAgent;
    if (a3)
    {
      if (!discoveryAgent)
      {
        int v12 = BTDiscoveryAgentCreate();
        if (v12)
        {
          int v13 = v12;
          v8 = AXLogBluetooth();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 67109120;
            int v15 = v13;
            int v9 = "VOTBTM: discovery agent creation failed with error %d";
            goto LABEL_19;
          }
          goto LABEL_20;
        }
      }
      int started = BTDiscoveryAgentStartScan();
      if (started)
      {
        int v7 = started;
        v8 = AXLogBluetooth();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 67109120;
          int v15 = v7;
          int v9 = "VOTBTM: failed to start scanning with error %d";
LABEL_19:
          _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 8u);
        }
LABEL_20:

        return;
      }
    }
    else if (discoveryAgent)
    {
      uint64_t v11 = AXLogBluetooth();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_DEFAULT, "VOTBTM: stopping discovery agent", (uint8_t *)&v14, 2u);
      }

      BTDiscoveryAgentStopScan();
      BTDiscoveryAgentDestroy();
      *p_discoveryAgent = 0;
    }
    self->_wantsDiscoveryEnabled = 0;
    return;
  }
  if (a3)
  {
    BOOL v10 = AXLogBluetooth();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18D308000, v10, OS_LOG_TYPE_DEFAULT, "VOTBTM: Could not enable DiscoveryAgentScanning. session is nil", (uint8_t *)&v14, 2u);
    }

    self->_wantsDiscoveryEnabled = 1;
  }
}

- (void)_restartScan
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_scanningEnabled)
  {
    [(AXUIBluetoothHelper *)self _setDiscoveryAgentScanning:0];
    [(AXUIBluetoothHelper *)self _setDiscoveryAgentScanning:1];
    int started = BTDiscoveryAgentStartScan();
    if (started)
    {
      int v4 = started;
      int v5 = AXLogBluetooth();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to restart scanning with error %d", (uint8_t *)v6, 8u);
      }

      self->_scanningEnabled = 0;
    }
  }
}

- (void)_cleanup:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_available = 0;
  if (!a3)
  {
    if (self->_discoveryAgent)
    {
      BTDiscoveryAgentStopScan();
      BTDiscoveryAgentDestroy();
    }
    if (self->_pairingAgent)
    {
      BTPairingAgentStop();
      BTPairingAgentDestroy();
    }
    if (self->_localDevice) {
      BTLocalDeviceRemoveCallbacks();
    }
    if (self->_session)
    {
      BTServiceRemoveCallbacks();
      BTSessionDetachWithQueue();
    }
  }
  *(_WORD *)&self->_audioConnected = 0;
  self->_localDevice = 0;
  self->_session = 0;
  self->_discoveryAgent = 0;
  self->_pairingAgent = 0;
  btAddrDict = self->_btAddrDict;
  self->_btAddrDict = 0;

  btDeviceDict = self->_btDeviceDict;
  self->_btDeviceDict = 0;

  BOOL v6 = AXLogBluetooth();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up BT helper: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)dealloc
{
  BOOL v3 = [(AXUIBluetoothHelper *)self centralManager];
  int v4 = [v3 sharedPairingAgent];
  [v4 setDelegate:0];

  int v5 = [(AXUIBluetoothHelper *)self centralManager];
  [v5 setDelegate:0];

  [(AXUIBluetoothHelper *)self _cleanup:0];
  v6.receiver = self;
  v6.super_class = (Class)AXUIBluetoothHelper;
  [(AXUIBluetoothHelper *)&v6 dealloc];
}

- (void)_postNotificationWithArray:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = (void *)[v3 count];
  if (!v4)
  {
    objc_super v6 = 0;
    int v5 = &stru_1EDC3DEF8;
    goto LABEL_8;
  }
  int v5 = [v3 objectAtIndex:0];
  if (v4 == (void *)1)
  {
    objc_super v6 = 0;
  }
  else
  {
    objc_super v6 = [v3 objectAtIndex:1];
    if ((unint64_t)v4 >= 3)
    {
      int v7 = [v3 objectAtIndex:2];
      int v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v7, @"VOSBluetoothErrorKey", v5, @"VOSBluetoothNotificationNameKey", 0);

      goto LABEL_8;
    }
  }
  int v4 = 0;
LABEL_8:
  v8 = AXLogBluetooth();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "VOTBTM: posting notification %{public}@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:v5 object:v6 userInfo:v4];
}

- (void)_postNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AXLogBluetooth();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: posting notification %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:v4 object:self];
}

- (void)postNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __40__AXUIBluetoothHelper_postNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotification:*(void *)(a1 + 40)];
}

- (void)postNotificationName:(id)a3 object:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (v5 && v6)
  {
    id v8 = v5;
    id v9 = v7;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

void __51__AXUIBluetoothHelper_postNotificationName_object___block_invoke(void *a1)
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v1 = (void *)a1[4];
  uint64_t v2 = a1[6];
  v4[0] = a1[5];
  v4[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  [v1 _postNotificationWithArray:v3];
}

- (void)postNotificationName:(id)a3 object:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (v7 && v8 && v9)
  {
    id v11 = v7;
    id v12 = v8;
    id v13 = v10;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

void __57__AXUIBluetoothHelper_postNotificationName_object_error___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v3 count:3];
  [v1 _postNotificationWithArray:v2];
}

- (int64_t)powerState
{
  int64_t result = (int64_t)self->_localDevice;
  if (result)
  {
    BTLocalDeviceGetModulePower();
    return 0;
  }
  return result;
}

- (BOOL)powered
{
  return [(AXUIBluetoothHelper *)self powerState] == 2;
}

- (BOOL)setPowered:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  localDevice = self->_localDevice;
  if (localDevice)
  {
    BOOL v5 = a3;
    int v6 = BTLocalDeviceSetModulePower();
    if (v6)
    {
      int v7 = v6;
      id v8 = AXLogBluetooth();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = @"OFF";
        if (v5) {
          id v9 = @"ON";
        }
        int v11 = 138543618;
        id v12 = v9;
        __int16 v13 = 1024;
        int v14 = v7;
        _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "VOBTM: BTLocalDeviceSetModulePower with power %{public}@ failed with error %d", (uint8_t *)&v11, 0x12u);
      }

      LOBYTE(localDevice) = 0;
    }
    else
    {
      [(AXUIBluetoothHelper *)self postNotification:@"VOSBluetoothPowerChangedNotification"];
      LOBYTE(localDevice) = 1;
    }
  }
  return (char)localDevice;
}

- (void)_powerChanged
{
  if ([(AXUIBluetoothHelper *)self powerState] != 1)
  {
    [(AXUIBluetoothHelper *)self postNotification:@"VOSBluetoothPowerChangedNotification"];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.bluetooth.power-changed", 0, 0, 1u);
  }
}

- (BOOL)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    [(AXUIBluetoothHelper *)self setDeviceScanningEnabled:0];
  }

  return [(AXUIBluetoothHelper *)self setPowered:v3];
}

- (BOOL)btleDeviceIsPaired:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXUIBluetoothHelper *)self centralManager];
  int v6 = [v5 sharedPairingAgent];
  int v7 = [v4 peripheral];

  LOBYTE(v4) = [v6 isPeerPaired:v7];
  return (char)v4;
}

- (void)unpairBTLEDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = AXLogBluetooth();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "Unpairing BTLE device: %@", (uint8_t *)&v9, 0xCu);
  }

  int v6 = [(AXUIBluetoothHelper *)self centralManager];
  int v7 = [v6 sharedPairingAgent];
  id v8 = [v4 peripheral];
  [v7 unpairPeer:v8];
}

- (BOOL)unpairAddress:(id)a3
{
  *(void *)&v14[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 UTF8String];
  BTDeviceAddressFromString();
  int v5 = BTDeviceFromAddress();
  if (v5)
  {
    int v6 = AXLogBluetooth();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(AXUIBluetoothHelper *)(uint64_t)v4 unpairAddress:v6];
    }
  }
  else
  {
    int v7 = BTPairingAgentDeletePairedDevice();
    if (v7)
    {
      int v8 = v7;
      int v9 = AXLogBluetooth();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v14[0] = v8;
        LOWORD(v14[1]) = 2112;
        *(void *)((char *)&v14[1] + 2) = v4;
        _os_log_impl(&dword_18D308000, v9, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to unpair from device with error %d (address: %@)", buf, 0x12u);
      }
    }
    deviceUpdated = (void (**)(id, AXUIBluetoothDevice *))self->_deviceUpdated;
    if (deviceUpdated)
    {
      uint64_t v11 = [[AXUIBluetoothDevice alloc] initWithDevice:0 address:v4 helper:self];
      deviceUpdated[2](deviceUpdated, v11);
    }
    int v6 = AXLogBluetooth();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)int v14 = v4;
      _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_DEFAULT, "VOTBTM: Unpaired device address: %@", buf, 0xCu);
    }
  }

  return v5 == 0;
}

- (BOOL)unpairDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AXLogBluetooth();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: Unpairing device: %@", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
  {
    if ([v4 isBTLEDevice])
    {
      [(AXUIBluetoothHelper *)self unpairBTLEDevice:v4];
      BOOL v6 = 1;
    }
    else
    {
      if (!self->_pairingAgent) {
        [(AXUIBluetoothHelper *)self setDevicePairingEnabled:1];
      }
      [(AXUIBluetoothHelper *)self cancelPairing];
      [v4 device];
      int v7 = BTPairingAgentDeletePairedDevice();
      BOOL v6 = v7 == 0;
      if (v7)
      {
        int v8 = v7;
        int v9 = AXLogBluetooth();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138543618;
          id v13 = v4;
          __int16 v14 = 1024;
          int v15 = v8;
          _os_log_impl(&dword_18D308000, v9, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to unpair from device %{public}@ with error %d", (uint8_t *)&v12, 0x12u);
        }
      }
      deviceUpdated = (void (**)(id, id))self->_deviceUpdated;
      if (deviceUpdated) {
        deviceUpdated[2](deviceUpdated, v4);
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)devicePairingEnabled
{
  return self->_pairingAgent != 0;
}

- (void)setDevicePairingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = AXLogBluetooth();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = "disabled";
    if (v3) {
      BOOL v6 = "enabled";
    }
    int v18 = 136446210;
    id v19 = v6;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: trying setting device pairing %{public}s", (uint8_t *)&v18, 0xCu);
  }

  if (!self->_session || [(AXUIBluetoothHelper *)self devicePairingEnabled] == v3)
  {
    self->_wantsDiscoveryEnabled = 1;
    return;
  }
  int v7 = AXLogBluetooth();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = "disabled";
    if (v3) {
      int v8 = "enabled";
    }
    int v18 = 136446210;
    id v19 = v8;
    _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting device pairing %{public}s", (uint8_t *)&v18, 0xCu);
  }

  p_pairingAgent = &self->_pairingAgent;
  pairingAgent = self->_pairingAgent;
  if (!v3)
  {
    if (!pairingAgent) {
      return;
    }
    __int16 v14 = AXLogBluetooth();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_18D308000, v14, OS_LOG_TYPE_DEFAULT, "VOTBTM: stopping pairing agent", (uint8_t *)&v18, 2u);
    }

    BTPairingAgentStop();
LABEL_22:
    BTPairingAgentDestroy();
    *p_pairingAgent = 0;
    return;
  }
  if (!pairingAgent)
  {
    int v15 = BTPairingAgentCreate();
    if (v15)
    {
      int v16 = v15;
      int v17 = AXLogBluetooth();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109120;
        LODWORD(v19) = v16;
        _os_log_impl(&dword_18D308000, v17, OS_LOG_TYPE_DEFAULT, "VOTBTM: pairing agent creation failed with error %d", (uint8_t *)&v18, 8u);
      }

      return;
    }
  }
  int v11 = BTPairingAgentStart();
  int v12 = AXLogBluetooth();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int v18 = 67109120;
      LODWORD(v19) = v11;
      _os_log_impl(&dword_18D308000, v12, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to start pairing agent with error %d", (uint8_t *)&v18, 8u);
    }

    goto LABEL_22;
  }
  if (v13)
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_18D308000, v12, OS_LOG_TYPE_DEFAULT, "VOTBTM: started pairing agent ", (uint8_t *)&v18, 2u);
  }
}

- (void)cancelPairing
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_pairingAgent)
  {
    int v2 = BTPairingAgentCancelPairing();
    if (v2)
    {
      int v3 = v2;
      id v4 = AXLogBluetooth();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = v3;
        _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to cancel pairing with error %d", (uint8_t *)v5, 8u);
      }
    }
  }
}

- (id)deviceForPeripheral:(id)a3
{
  id v4 = a3;
  btleDevices = self->_btleDevices;
  uint64_t v6 = [v4 identifier];
  int v7 = [v6 UUIDString];
  int v8 = [(NSMutableDictionary *)btleDevices objectForKey:v7];

  if (!v8)
  {
    int v8 = [[AXUIBluetoothDevice alloc] initWithPeripheral:v4 helper:self];
    int v9 = self->_btleDevices;
    id v10 = [(AXUIBluetoothDevice *)v8 identifier];
    [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];
  }
  int v11 = v8;

  return v11;
}

- (BOOL)isPairedDeviceBrailleDisplay:(id)a3
{
  return 0;
}

- (NSArray)pairedBTLEDevices
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = objc_opt_new();
  id v4 = [(AXUIBluetoothHelper *)self centralManager];
  uint64_t v5 = [v4 state];

  if (v5 == 5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(AXUIBluetoothHelper *)self centralManager];
    int v7 = [v6 retrieveConnectedPeripheralsWithServices:0 allowAll:1];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          BOOL v13 = [v12 name];
          __int16 v14 = v13;
          if (!v13 || ([v13 containsString:@"Apple Pencil"] & 1) == 0)
          {
            int v15 = [(AXUIBluetoothHelper *)self deviceForPeripheral:v12];
            if (v15
              && ([v3 containsObject:v15] & 1) == 0
              && [(AXUIBluetoothHelper *)self isPairedDeviceBrailleDisplay:v15])
            {
              [v3 addObject:v15];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }

  return (NSArray *)v3;
}

- (id)pairedDevices
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA48] array];
  if (self->_localDevice)
  {
    uint64_t v40 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    int PairedDevices = BTLocalDeviceGetPairedDevices();
    uint64_t v5 = AXLogBluetooth();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (PairedDevices)
    {
      if (v6)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = PairedDevices;
        _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to get paired devices with error %d", buf, 8u);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v42 = v40;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTLocalDeviceGetPairedDevices returned %zd devices", buf, 0xCu);
    }
  }

  return v3;
}

- (void)setPincode:(id)a3 forDevice:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = AXLogBluetooth();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting pincode %{public}@ for device %{public}@", (uint8_t *)&v8, 0x16u);
  }

  if (v5)
  {
    [v6 device];
    [v5 UTF8String];
    BTPairingAgentSetPincode();
  }
  else
  {
    BTPairingAgentCancelPairing();
  }
}

- (BOOL)isAnyoneScanning
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int Scanning = BTLocalDeviceGetScanning();
    if (Scanning)
    {
      int v4 = Scanning;
      id v5 = AXLogBluetooth();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(AXUIBluetoothHelper *)v4 isAnyoneScanning];
      }
    }
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (BOOL)isDiscoverable
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int Discoverable = BTLocalDeviceGetDiscoverable();
    if (Discoverable)
    {
      int v4 = Discoverable;
      id v5 = AXLogBluetooth();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v8 = v4;
        _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTLocalDeviceGetDiscoverable returned error %d", buf, 8u);
      }
    }
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (void)setDiscoverable:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_localDevice)
  {
    BOOL v3 = a3;
    id v5 = AXLogBluetooth();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "disabled";
      if (v3) {
        id v6 = "enabled";
      }
      int v7 = 136446210;
      int v8 = v6;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting discoverable status %{public}s", (uint8_t *)&v7, 0xCu);
    }

    if (!BTLocalDeviceSetDiscoverable()) {
      [(AXUIBluetoothHelper *)self setDevicePairingEnabled:v3];
    }
  }
}

- (BOOL)wasDeviceDiscovered:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  if (!BTDiscoveryAgentGetDevices())
  {
    id v5 = AXLogBluetooth();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = 0;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTDiscoveryAgentGetDevices returned %zd devices", buf, 0xCu);
    }
  }
  return 0;
}

- (id)addDeviceIfNeeded:(BTDeviceImpl *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  btDeviceDict = self->_btDeviceDict;
  long long v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:");
  long long v7 = [(NSMutableDictionary *)btDeviceDict objectForKey:v6];

  if (v7)
  {
LABEL_2:
    long long v8 = 0;
    goto LABEL_3;
  }
  long long v8 = VOSAddressForBTDevice();
  long long v10 = [(NSMutableDictionary *)self->_btAddrDict objectForKey:v8];
  if (v10)
  {
    long long v7 = v10;
    if ((BTDeviceImpl *)[(BTDeviceImpl *)v10 device] != a3) {
      [(BTDeviceImpl *)v7 setDevice:a3];
    }
  }
  else
  {
    if (!v8)
    {
      long long v14 = AXLogBluetooth();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134217984;
        long long v16 = a3;
        _os_log_impl(&dword_18D308000, v14, OS_LOG_TYPE_DEFAULT, "VOTBTM: Failed to retrieve address for BTDevice %p. VOSBluetoothManager may be thoroughly confused.", (uint8_t *)&v15, 0xCu);
      }

      long long v7 = 0;
      goto LABEL_2;
    }
    long long v7 = (BTDeviceImpl *)[objc_allocWithZone((Class)AXUIBluetoothDevice) initWithDevice:a3 address:v8 helper:self];
    long long v11 = AXLogBluetooth();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      long long v16 = v7;
      _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_DEFAULT, "VOTBTM: Adding new device %{public}@", (uint8_t *)&v15, 0xCu);
    }

    [(NSMutableDictionary *)self->_btAddrDict setObject:v7 forKey:v8];
    long long v12 = self->_btDeviceDict;
    long long v13 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
    [(NSMutableDictionary *)v12 setObject:v7 forKey:v13];
  }
LABEL_3:

  return v7;
}

- (void)acceptSSP:(int)a3 forDevice:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v6 = AXLogBluetooth();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    uint64_t v11 = a3;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_DEFAULT, "VOTBTM: accepting SSP with error code %ld for device %{public}@", (uint8_t *)&v10, 0x16u);
  }

  [v5 device];
  int v7 = BTPairingAgentAcceptSSP();
  if (v7)
  {
    int v8 = v7;
    long long v9 = AXLogBluetooth();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      LODWORD(v11) = v8;
      _os_log_impl(&dword_18D308000, v9, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTPairingAgentAcceptSSP returned error %d", (uint8_t *)&v10, 8u);
    }
  }
}

- (BOOL)connectAddress:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v4];
  if (!v5)
  {
    long long v6 = AXLogBluetooth();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(AXUIBluetoothHelper *)self discoveredDevices];
      int v9 = 138412802;
      int v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_DEFAULT, "%@ Could not find device with address: %@ %@", (uint8_t *)&v9, 0x20u);
    }
  }
  [(AXUIBluetoothHelper *)self connectDevice:v5];

  return 1;
}

- (BOOL)disconnectAddress:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:a3];
  if (v4)
  {
    [(AXUIBluetoothHelper *)self disconnectDevice:v4];
  }
  else
  {
    id v5 = AXLogBluetooth();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "Could not find device with address, making new one", v7, 2u);
    }
  }
  return v4 != 0;
}

- (BOOL)disconnectDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 isBTLEDevice];
  long long v6 = AXLogBluetooth();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_DEFAULT, "VOTBTM: Disconnecting periperhal: %@", (uint8_t *)&v13, 0xCu);
    }

    int v8 = [(AXUIBluetoothHelper *)self centralManager];
    int v9 = [v4 peripheral];
    [v8 cancelPeripheralConnection:v9 options:0];
  }
  else
  {
    if (v7)
    {
      int v13 = 138543362;
      id v14 = v4;
      _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_DEFAULT, "VOTBTM: disconnecting services to device %{public}@", (uint8_t *)&v13, 0xCu);
    }

    [v4 device];
    int v10 = BTDeviceDisconnect();
    if (!v10)
    {
      LOBYTE(v5) = 1;
      goto LABEL_11;
    }
    int v11 = v10;
    int v8 = AXLogBluetooth();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = v4;
      __int16 v15 = 1024;
      int v16 = v11;
      _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "VOTBTM: disconnecting to device %{public}@ failed with error %d", (uint8_t *)&v13, 0x12u);
    }
  }

LABEL_11:
  return v5;
}

- (BOOL)connectDevice:(id)a3 withServices:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 isBTLEDevice];
  if (!v7)
  {
    int v16 = AXLogBluetooth();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109378;
      *(_DWORD *)long long v21 = a4;
      *(_WORD *)&v21[4] = 2114;
      *(void *)&v21[6] = v6;
      _os_log_impl(&dword_18D308000, v16, OS_LOG_TYPE_DEFAULT, "VOTBTM: connecting services 0x%08x to device %{public}@", (uint8_t *)&v20, 0x12u);
    }

    [v6 device];
    int v17 = BTDeviceConnectServices();
    if (v17)
    {
      int v18 = v17;
      __int16 v15 = AXLogBluetooth();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        *(void *)long long v21 = v6;
        *(_WORD *)&v21[8] = 1024;
        *(_DWORD *)&v21[10] = v18;
        _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_DEFAULT, "VOTBTM: connecting to device %{public}@ failed with error %d", (uint8_t *)&v20, 0x12u);
      }
      goto LABEL_13;
    }
LABEL_14:
    LOBYTE(v7) = 1;
    goto LABEL_15;
  }
  int v8 = AXLogBrailleHW();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 peripheral];
    int v20 = 138412290;
    *(void *)long long v21 = v9;
    _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "Attempt connect: Current peripheral state: %@", (uint8_t *)&v20, 0xCu);
  }
  int v10 = [v6 peripheral];
  char v11 = [v10 isConnectedToSystem];

  if (v11) {
    goto LABEL_14;
  }
  id v12 = AXLogBrailleHW();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v6 peripheral];
    int v20 = 138412290;
    *(void *)long long v21 = v13;
    _os_log_impl(&dword_18D308000, v12, OS_LOG_TYPE_DEFAULT, "Connecting: %@", (uint8_t *)&v20, 0xCu);
  }
  centralManager = self->_centralManager;
  __int16 v15 = [v6 peripheral];
  [(CBCentralManager *)centralManager connectPeripheral:v15 options:0];
LABEL_13:

LABEL_15:
  return v7;
}

- (BOOL)connectDevice:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(AXUIBluetoothHelper *)self connectDevice:v4 withServices:[(AXUIBluetoothHelper *)self authorizedServices]];

  return (char)self;
}

- (BOOL)connectable
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int Connectable = BTLocalDeviceGetConnectable();
    if (Connectable)
    {
      int v4 = Connectable;
      int v5 = AXLogBluetooth();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v8 = v4;
        _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "BT: BTLocalDeviceGetConnectable returned error %d", buf, 8u);
      }
    }
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (void)setConnectable:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_localDevice)
  {
    BOOL v3 = a3;
    int v4 = AXLogBluetooth();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = "disabled";
      if (v3) {
        int v5 = "enabled";
      }
      int v6 = 136446210;
      int v7 = v5;
      _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting connectable status %{public}s", (uint8_t *)&v6, 0xCu);
    }

    BTLocalDeviceSetConnectable();
  }
}

- (id)connectingDevices
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if (self->_localDevice)
  {
    uint64_t v40 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    int ConnectingDevices = BTLocalDeviceGetConnectingDevices();
    int v5 = AXLogBluetooth();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (ConnectingDevices)
    {
      if (v6)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = ConnectingDevices;
        _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to get connecting devices with error %d", buf, 8u);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v42 = v40;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTLocalDeviceGetConnectingDevices returned %zd devices", buf, 0xCu);
    }
  }

  return v3;
}

- (BOOL)_onlySensorsConnected
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_localDevice) {
    return 0;
  }
  int ConnectedDevices = BTLocalDeviceGetConnectedDevices();
  if (ConnectedDevices)
  {
    int v3 = ConnectedDevices;
    int v4 = AXLogBluetooth();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v3;
      _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTLocalDeviceGetConnectedDevices failed with error %d", buf, 8u);
    }
  }
  return 0;
}

- (BOOL)connected
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  localDevice = self->_localDevice;
  if (localDevice)
  {
    int ConnectionStatus = BTLocalDeviceGetConnectionStatus();
    if (ConnectionStatus)
    {
      int v4 = ConnectionStatus;
      int v5 = AXLogBluetooth();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v8 = v4;
        _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOBTM: BTLocalDeviceGetConnectionStatus failed with error %d", buf, 8u);
      }
    }
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (void)_connectedStatusChanged
{
}

- (void)_connectabilityChanged
{
}

- (BOOL)audioConnected
{
  return self->_audioConnected;
}

- (void)setAudioConnected:(BOOL)a3
{
  self->_audioConnected = a3;
}

- (void)_discoveryStateChanged
{
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    BTLocalDeviceSupportsService();
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (unsigned)authorizedServicesForDevice:(id)a3
{
  [a3 device];
  int AuthorizedServices = BTDeviceGetAuthorizedServices();
  if (!AuthorizedServices) {
    return 0;
  }
  int v4 = AuthorizedServices;
  int v5 = AXLogBluetooth();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[AXUIBluetoothHelper authorizedServicesForDevice:](v4, v5);
  }

  return 0;
}

- (void)_updateCentralManagerScan
{
  if ([(CBCentralManager *)self->_centralManager state] == 5)
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"VOSBluetoothCoreBluetoothManagerReadyNotification" object:0];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(AXUIBluetoothHelper *)self _updateCentralManagerScan];
  int v4 = AXLogBluetooth();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CBCentralManager state](self->_centralManager, "state"));
    *(_DWORD *)buf = 138412290;
    long long v22 = v5;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "Center manager did updated state: %@", buf, 0xCu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v6 = [(AXUIBluetoothHelper *)self centralManager];
  int v7 = [v6 retrieveConnectedPeripheralsWithServices:MEMORY[0x1E4F1CBF0]];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v17;
    *(void *)&long long v9 = 138412290;
    long long v15 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", *(void *)(*((void *)&v16 + 1) + 8 * v12), v15);
        long long v14 = AXLogBrailleHW();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          long long v22 = v13;
          _os_log_impl(&dword_18D308000, v14, OS_LOG_TYPE_DEFAULT, "Adding BTLE discovered device: %@", buf, 0xCu);
        }

        [(AXUIBluetoothHelper *)self _addDiscoveredDevice:v13];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [(AXUIBluetoothHelper *)self _setupCentralScanning:1];
}

- (void)_setupCentralScanning:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(AXUIBluetoothHelper *)self centralManager];
  uint64_t v6 = [v5 state];

  if (v6 == 5)
  {
    int v7 = [(AXUIBluetoothHelper *)self centralManager];
    id v9 = v7;
    if (v3)
    {
      [v7 scanForPeripheralsWithServices:0 options:0];

      uint64_t v8 = AXLogBrailleHW();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "Scanning for peripherals: ", buf, 2u);
      }
    }
    else
    {
      [v7 stopScan];
    }
  }
}

- (void)_removeDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 paired] & 1) == 0)
  {
    int v5 = AXLogBluetooth();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: Removing device %{public}@", (uint8_t *)&v10, 0xCu);
    }

    btAddrDict = self->_btAddrDict;
    int v7 = [v4 address];
    [(NSMutableDictionary *)btAddrDict removeObjectForKey:v7];

    btDeviceDict = self->_btDeviceDict;
    id v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", objc_msgSend(v4, "device"));
    [(NSMutableDictionary *)btDeviceDict removeObjectForKey:v9];
  }
}

- (void)deviceDiscovered:(id)a3
{
  self->_deviceDiscovered = _Block_copy(a3);

  MEMORY[0x1F41817F8]();
}

- (void)deviceRemoved:(id)a3
{
  self->_deviceRemoved = _Block_copy(a3);

  MEMORY[0x1F41817F8]();
}

- (void)deviceUpdated:(id)a3
{
  self->_deviceUpdated = _Block_copy(a3);

  MEMORY[0x1F41817F8]();
}

- (id)allowedServices
{
  _DWORD v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BD08]];
  v6[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"49535343-FE7D-4AE5-8FA9-9FAFD205E455"];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (BOOL)peripheralMatchesUnadvertisedService:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  if ([v4 hasPrefix:@"DotPad"])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 name];
    char v5 = [v6 hasPrefix:@"DotPocket"];
  }
  return v5;
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [a5 objectForKeyedSubscript:*MEMORY[0x1E4F1BC40]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
        long long v15 = [(AXUIBluetoothHelper *)self allowedServices];
        LOBYTE(v14) = [v15 containsObject:v14];

        if (v14)
        {

          BOOL v16 = 1;
          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = [(AXUIBluetoothHelper *)self peripheralMatchesUnadvertisedService:v8];
LABEL_11:
  long long v17 = AXLogBrailleHW();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    long long v18 = [NSNumber numberWithBool:v16];
    *(_DWORD *)buf = 138412802;
    id v26 = v8;
    __int16 v27 = 2112;
    long long v28 = v18;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_18D308000, v17, OS_LOG_TYPE_INFO, "Discovered periperal: %@, allowed %@ %@", buf, 0x20u);
  }
  if (v16)
  {
    long long v19 = [(AXUIBluetoothHelper *)self deviceForPeripheral:v8];
    long long v20 = AXLogBrailleHW();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v19;
      _os_log_impl(&dword_18D308000, v20, OS_LOG_TYPE_DEFAULT, "Adding BTLE discovered device: %@", buf, 0xCu);
    }

    [(AXUIBluetoothHelper *)self _addDiscoveredDevice:v19];
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(AXUIBluetoothHelper *)self deviceForPeripheral:v7];
  uint64_t v10 = AXLogBrailleHW();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    BOOL v16 = v9;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_error_impl(&dword_18D308000, v10, OS_LOG_TYPE_ERROR, "Failed to connected: %@, device: %@ error %@", (uint8_t *)&v13, 0x20u);
  }

  if (v9)
  {
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"VOSBluetoothDeviceConnectFailedNotification" object:v9];

    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"VOSBluetoothDeviceUpdatedNotification" object:v9];
  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [(AXUIBluetoothHelper *)self deviceForPeripheral:a4];
  char v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "Updated periperhal state for %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"VOSBluetoothDeviceUpdatedNotification" object:v4];
  }
}

- (void)_peripheralDidCompletePairing:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "Completed pairing to %@", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"VOSBluetoothDevicePairedNotification" object:v4];

    deviceUpdated = (void (**)(id, id))self->_deviceUpdated;
    if (deviceUpdated) {
      deviceUpdated[2](deviceUpdated, v4);
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  uint64_t v5 = [(AXUIBluetoothHelper *)self deviceForPeripheral:a4];
  if (v5)
  {
    uint64_t v8 = v5;
    [(AXUIBluetoothHelper *)self _peripheralDidCompletePairing:v5];
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"VOSBluetoothDeviceConnectSuccessNotification" object:v8];

    deviceUpdated = (void (**)(id, void))self->_deviceUpdated;
    if (deviceUpdated) {
      deviceUpdated[2](deviceUpdated, v8);
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v10 = a4;
  uint64_t v6 = [(AXUIBluetoothHelper *)self deviceForPeripheral:v10];
  if ([v10 state])
  {
    int v7 = [(AXUIBluetoothHelper *)self centralManager];
    [v7 cancelPeripheralConnection:v10];
  }
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"VOSBluetoothDeviceUnpairedNotification" object:v6];

    deviceUpdated = (void (**)(id, void *))self->_deviceUpdated;
    if (deviceUpdated) {
      deviceUpdated[2](deviceUpdated, v6);
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v7 = [(AXUIBluetoothHelper *)self deviceForPeripheral:a4];
  if (v7)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"VOSBluetoothDeviceDisconnectSuccessNotification" object:v7];

    deviceUpdated = (void (**)(id, id))self->_deviceUpdated;
    if (deviceUpdated) {
      deviceUpdated[2](deviceUpdated, v7);
    }
  }
}

- (void)peripheralDidUpdateName:(id)a3
{
  id v6 = [(AXUIBluetoothHelper *)self deviceForPeripheral:a3];
  if (v6)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"VOSBluetoothDeviceUpdatedNotification" object:v6];
  }
  deviceUpdated = (void (**)(id, id))self->_deviceUpdated;
  if (deviceUpdated) {
    deviceUpdated[2](deviceUpdated, v6);
  }
}

- (void)_addDiscoveredDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (AXUIBluetoothHelper *)a3;
  uint64_t v5 = v4;
  if (v4
    && ([(AXUIBluetoothHelper *)v4 address],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    discoveredDevices = self->_discoveredDevices;
    uint64_t v8 = [(AXUIBluetoothHelper *)v5 address];
    [(NSMutableDictionary *)discoveredDevices setObject:v5 forKeyedSubscript:v8];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"VOSBluetoothDeviceDiscoveredNotification" object:v5];

    id v10 = AXLogBluetooth();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_discoveredDevices;
      int v14 = 138412546;
      __int16 v15 = self;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      _os_log_impl(&dword_18D308000, v10, OS_LOG_TYPE_DEFAULT, "%@ Discovered devices: %@", (uint8_t *)&v14, 0x16u);
    }

    deviceDiscovered = (void (**)(id, void *))self->_deviceDiscovered;
    if (deviceDiscovered) {
      deviceDiscovered[2](deviceDiscovered, v5);
    }
  }
  else
  {
    int v13 = AXLogBluetooth();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      __int16 v15 = v5;
      _os_log_impl(&dword_18D308000, v13, OS_LOG_TYPE_DEFAULT, "Invalid discovered device: %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (unsigned)authorizedServices
{
  return self->_authorizedServices;
}

- (void)setAuthorizedServices:(unsigned int)a3
{
  self->_authorizedServices = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong(&self->_deviceRemoved, 0);
  objc_storeStrong(&self->_deviceUpdated, 0);
  objc_storeStrong(&self->_deviceDiscovered, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_btleDevices, 0);
  objc_storeStrong((id *)&self->_btDeviceDict, 0);

  objc_storeStrong((id *)&self->_btAddrDict, 0);
}

- (void)unpairAddress:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_18D308000, log, OS_LOG_TYPE_ERROR, "In sending control message, failed to look up BT address %@: %d", (uint8_t *)&v3, 0x12u);
}

- (void)isAnyoneScanning
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "VOTBTM: BTLocalDeviceGetScanning returned error %d", (uint8_t *)v2, 8u);
}

- (void)authorizedServicesForDevice:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "VOBTM: failed to get authorized services with error %d", (uint8_t *)v2, 8u);
}

@end
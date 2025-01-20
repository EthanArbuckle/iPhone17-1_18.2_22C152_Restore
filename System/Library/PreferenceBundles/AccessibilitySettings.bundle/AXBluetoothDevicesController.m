@interface AXBluetoothDevicesController
- (AXBluetoothDevicesController)init;
- (BOOL)_brailleConfigMatch:(id)a3 withConfig:(id)a4;
- (BOOL)_isBluetoothPowerFooterShowing;
- (BOOL)bluetoothIsBusy;
- (BOOL)peripheralMatchesUnadvertisedService:(id)a3;
- (BOOL)scanningEnabled;
- (BOOL)shouldAddBTLEDevice:(id)a3;
- (BOOL)shouldAddClassicDevice:(id)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (CBCentralManager)centralManager;
- (NSArray)mainSpecifiersGroup;
- (PSSpecifier)currentSpecifier;
- (id)allowedServices;
- (id)bluetoothPowerAlertMessage;
- (id)bluetoothPoweredOffFooter;
- (id)detailSpecifiersForDevice:(id)a3 withTarget:(id)a4;
- (id)devicesGroupName;
- (id)getDeviceForPeripheral:(id)a3;
- (id)pairedDeviceSpecifiers;
- (id)postDevicesSpecifiersGroup;
- (id)specifierForDevice:(id)a3;
- (id)specifierImmediatelyPrecedingDevices;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)window;
- (int64_t)axDeviceControllerType;
- (unsigned)authorizedServices;
- (void)_addDevice:(id)a3;
- (void)_cleanupPairing;
- (void)_peripheralDidCompletePairing:(id)a3;
- (void)_pinRequestHandler:(id)a3;
- (void)_removeDevice:(id)a3;
- (void)_setupCentralScanning:(BOOL)a3;
- (void)_showBluetoothPowerFooter:(BOOL)a3;
- (void)_showScanningUI:(BOOL)a3;
- (void)_sspConfirmationHandler:(id)a3;
- (void)_sspNumericComparisonHandler:(id)a3;
- (void)_sspPasskeyDisplayHandler:(id)a3;
- (void)_startConnectable;
- (void)_startDiscoverable;
- (void)_startScanning;
- (void)_stopConnectable;
- (void)_stopDiscoverable;
- (void)_stopScanning;
- (void)_updateDevicePosition:(id)a3;
- (void)alertSheetDismissed:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)authenticationRequestHandler:(id)a3;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)deviceConnectedHandler:(id)a3;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)deviceDiscoveredHandler:(id)a3;
- (void)devicePairedHandler:(id)a3;
- (void)deviceRemovedHandler:(id)a3;
- (void)deviceUnpairedHandler:(id)a3;
- (void)deviceUpdatedHandler:(id)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)peripheralConnectionTimeout:(id)a3;
- (void)peripheralDidUpdateName:(id)a3;
- (void)powerChangedHandler:(id)a3;
- (void)reloadSpecifiers;
- (void)setAuthorizedServices:(unsigned int)a3;
- (void)setBluetoothIsBusy:(BOOL)a3;
- (void)setCentralManager:(id)a3;
- (void)setMainSpecifiersGroup:(id)a3;
- (void)setScanningEnabled:(BOOL)a3;
- (void)showBluetoothPowerAlert:(BOOL)a3;
- (void)showPairingAlertForPairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updatePairedDevices;
- (void)viewDidAppear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation AXBluetoothDevicesController

- (AXBluetoothDevicesController)init
{
  v29.receiver = self;
  v29.super_class = (Class)AXBluetoothDevicesController;
  v2 = [(AXBluetoothDevicesController *)&v29 init];
  if (v2)
  {
    v3 = +[NSDate date];
    [v3 timeIntervalSince1970];
    srandom(v4);

    v5 = (NSMutableDictionary *)[objc_allocWithZone((Class)NSMutableDictionary) init];
    devicesDict = v2->_devicesDict;
    v2->_devicesDict = v5;

    v7 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:v2 queue:&_dispatch_main_q options:0];
    centralManager = v2->_centralManager;
    v2->_centralManager = v7;

    v9 = [(CBCentralManager *)v2->_centralManager sharedPairingAgent];
    [v9 setDelegate:v2];

    [(AXBluetoothDevicesController *)v2 setAuthorizedServices:0];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"applicationWillTerminate:" name:UIApplicationWillTerminateNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"powerChangedHandler:" name:VOSBluetoothPowerChangedNotification object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"powerChangedHandler:" name:VOSBluetoothAvailabilityChangedNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"deviceUpdatedHandler:" name:VOSBluetoothDeviceUpdatedNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"deviceDiscoveredHandler:" name:VOSBluetoothDeviceDiscoveredNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v2 selector:"deviceRemovedHandler:" name:VOSBluetoothDeviceRemovedNotification object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"deviceUnpairedHandler:" name:VOSBluetoothDeviceUnpairedNotification object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"deviceConnectedHandler:" name:VOSBluetoothDeviceConnectSuccessNotification object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v2 selector:"deviceConnectedHandler:" name:VOSBluetoothDeviceConnectFailedNotification object:0];

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v2 selector:"deviceDisconnectedHandler:" name:VOSBluetoothDeviceDisconnectSuccessNotification object:0];

    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v2 selector:"devicePairedHandler:" name:VOSBluetoothPairingPINResultFailedNotification object:0];

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v2 selector:"devicePairedHandler:" name:VOSBluetoothPairingPINResultSuccessNotification object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v2 selector:"authenticationRequestHandler:" name:VOSBluetoothPairingPINRequestNotification object:0];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v2 selector:"authenticationRequestHandler:" name:VOSBluetoothPairingUserConfirmationNotification object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v2 selector:"authenticationRequestHandler:" name:VOSBluetoothPairingUserNumericComparisionNotification object:0];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v2 selector:"authenticationRequestHandler:" name:VOSBluetoothPairingPassKeyDisplayNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  double v4 = [(AXBluetoothDevicesController *)self centralManager];
  v5 = [v4 sharedPairingAgent];
  [v5 setDelegate:0];

  v6 = [(AXBluetoothDevicesController *)self centralManager];
  [v6 setDelegate:0];

  [(AXBluetoothDevicesController *)self _stopScanning];
  [(AXBluetoothDevicesController *)self _stopDiscoverable];
  [(AXBluetoothDevicesController *)self _stopConnectable];
  [(VoiceOverBluetoothAlert *)self->_alert dismiss];
  v7.receiver = self;
  v7.super_class = (Class)AXBluetoothDevicesController;
  [(AXBluetoothDevicesController *)&v7 dealloc];
}

- (id)detailSpecifiersForDevice:(id)a3 withTarget:(id)a4
{
  return &__NSArray0__struct;
}

- (id)allowedServices
{
  v2 = +[CBUUID UUIDWithString:CBUUIDHumanInterfaceDeviceServiceString];
  v6[0] = v2;
  v3 = +[CBUUID UUIDWithString:@"49535343-FE7D-4AE5-8FA9-9FAFD205E455"];
  v6[1] = v3;
  double v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXBluetoothDevicesController;
  [(AXBluetoothDevicesController *)&v4 viewDidAppear:a3];
  if (!self->_bluetoothInitialized)
  {
    self->_bluetoothInitialized = 1;
    [(AXBluetoothDevicesController *)self _startScanning];
    [(AXBluetoothDevicesController *)self _startDiscoverable];
    [(AXBluetoothDevicesController *)self _startConnectable];
  }
}

- (id)devicesGroupName
{
  return 0;
}

- (id)bluetoothPoweredOffFooter
{
  return 0;
}

- (id)bluetoothPowerAlertMessage
{
  return 0;
}

- (void)applicationWillTerminate:(id)a3
{
  [(AXBluetoothDevicesController *)self _stopScanning];
  [(AXBluetoothDevicesController *)self _stopDiscoverable];

  [(AXBluetoothDevicesController *)self _stopConnectable];
}

- (void)applicationWillResignActive:(id)a3
{
  [(AXBluetoothDevicesController *)self _stopScanning];
  [(AXBluetoothDevicesController *)self _stopDiscoverable];
  [(AXBluetoothDevicesController *)self _stopConnectable];
  self->_togglingPower = 0;
  [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] setUserInteractionEnabled:1];
  [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];

  [(AXBluetoothDevicesController *)self _cleanupPairing];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)powerChangedHandler:(id)a3
{
  id v5 = a3;
  v6 = +[VOSBluetoothManager sharedInstance];
  unsigned int v7 = [v6 enabled];

  v8 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    v10 = +[AXSubsystemBrailleHardware identifier];
    v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = AXColorizeFormatLog();
      v14 = NSStringFromSelector(a2);
      v18 = [v5 name];
      uint64_t v19 = v7;
      v17 = v14;
      v15 = _AXStringForArgs();

      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_log_impl(&dword_0, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_power != v7)
  {
    self->_power = v7;
    self->_togglingPower = 0;
    [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] setUserInteractionEnabled:1];
    [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
    BOOL v16 = !self->_power;
    -[AXBluetoothDevicesController _showScanningUI:](self, "_showScanningUI:", v17, v18, v19);
    [(AXBluetoothDevicesController *)self showBluetoothPowerAlert:v16];
  }
}

- (void)deviceUpdatedHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_power && !self->_togglingPower)
  {
    v13 = v4;
    id v4 = (id)[(AXBluetoothDevicesController *)self scanningEnabled];
    id v5 = v13;
    if (v4)
    {
      v6 = [v13 object];
      devicesDict = self->_devicesDict;
      v8 = [v6 identifier];
      unsigned __int8 v9 = [(NSMutableDictionary *)devicesDict objectForKey:v8];

      if (v9)
      {
        v10 = [v6 identifier];
        v11 = [(AXBluetoothDevicesController *)self specifierForID:v10];

        os_log_type_t v12 = [v6 name];
        [v11 setName:v12];
        [v11 setProperty:v12 forKey:PSTitleKey];
        [(AXBluetoothDevicesController *)self _updateDevicePosition:v6];
      }
      else
      {
        [(AXBluetoothDevicesController *)self _addDevice:v6];
      }

      id v5 = v13;
    }
  }

  _objc_release_x1(v4, v5);
}

- (void)deviceDiscoveredHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_power && !self->_togglingPower)
  {
    unsigned int v7 = v4;
    id v4 = (id)[(AXBluetoothDevicesController *)self scanningEnabled];
    id v5 = v7;
    if (v4)
    {
      v6 = [v7 object];
      if ([v6 isNameCached]) {
        [(AXBluetoothDevicesController *)self _addDevice:v6];
      }

      id v5 = v7;
    }
  }

  _objc_release_x1(v4, v5);
}

- (void)deviceRemovedHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v9 = +[AXSubsystemBrailleHardware identifier];
    v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = AXColorizeFormatLog();
      v13 = NSStringFromSelector(a2);
      v14 = [v5 name];
      uint64_t v19 = [v6 name];
      v15 = _AXStringForArgs();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_power && !self->_togglingPower)
  {
    if ([(AXBluetoothDevicesController *)self scanningEnabled])
    {
      if (([v6 paired] & 1) == 0)
      {
        BOOL v16 = +[VOSBluetoothManager sharedInstance];
        v17 = [v16 connectingDevices];
        unsigned __int8 v18 = [v17 containsObject:v6];

        if ((v18 & 1) == 0) {
          [(AXBluetoothDevicesController *)self _removeDevice:v6];
        }
      }
    }
  }
}

- (void)deviceUnpairedHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = AXLogBrailleHW();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = NSStringFromSelector(a2);
    unsigned __int8 v9 = [v5 name];
    v10 = [v6 name];
    int v15 = 138543874;
    BOOL v16 = v8;
    __int16 v17 = 2114;
    unsigned __int8 v18 = v9;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ for device %{public}@", (uint8_t *)&v15, 0x20u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (+[VOSBluetoothManager sharedInstance],
        os_log_type_t v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 wasDeviceDiscovered:v6],
        v11,
        (v12 & 1) != 0))
  {
    v13 = AXLogBrailleHW();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      BOOL v16 = v6;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Device %{public}@ was unpaired and was discovered - updating position", (uint8_t *)&v15, 0xCu);
    }

    [(AXBluetoothDevicesController *)self _updateDevicePosition:v6];
  }
  else
  {
    v14 = AXLogBrailleHW();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      BOOL v16 = v6;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Device %{public}@ was unpaired and wasn't discovered - removing", (uint8_t *)&v15, 0xCu);
    }

    [(AXBluetoothDevicesController *)self _removeDevice:v6];
  }
}

- (void)deviceConnectedHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = AXLogBrailleHW();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = NSStringFromSelector(a2);
    unsigned __int8 v9 = [v5 name];
    v10 = [v6 name];
    int v25 = 138543874;
    v26 = v8;
    __int16 v27 = 2114;
    v28 = v9;
    __int16 v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ for device %{public}@", (uint8_t *)&v25, 0x20u);
  }
  if (self->_power && !self->_togglingPower && [(AXBluetoothDevicesController *)self scanningEnabled]
    || [v6 isBTLEDevice])
  {
    os_log_type_t v11 = [v6 address];
    unsigned __int8 v12 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
    unsigned int v13 = [v11 isEqualToString:v12];

    if (!v13)
    {
LABEL_19:
      [(AXBluetoothDevicesController *)self reloadSpecifierID:v11];

      goto LABEL_20;
    }
    v14 = [v5 name];
    unsigned int v15 = [v14 isEqualToString:VOSBluetoothDeviceConnectSuccessNotification];

    if (v15)
    {
      [(AXBluetoothDevicesController *)self deviceConnected:v6];
LABEL_16:
      v24 = AXLogBrailleHW();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Setting BT busy back to no on device connect", (uint8_t *)&v25, 2u);
      }

      [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
      goto LABEL_19;
    }
    [(AXBluetoothDevicesController *)self _cleanupPairing];
    BOOL v16 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
    __int16 v17 = [v16 objectForKey:@"PIN-ended"];

    unsigned __int8 v18 = [v5 name];
    if ([v18 isEqualToString:VOSBluetoothDeviceConnectFailedNotification]
      && !self->_alert)
    {
      unsigned __int8 v19 = [v17 isEqualToString:@"cancelled"];

      if (v19)
      {
LABEL_15:

        goto LABEL_16;
      }
      v20 = (VoiceOverBluetoothAlert *)[objc_allocWithZone((Class)VoiceOverBluetoothAlert) initWithDevice:v6];
      alert = self->_alert;
      self->_alert = v20;

      [(VoiceOverBluetoothAlert *)self->_alert setDelegate:self];
      v22 = self->_alert;
      unsigned __int8 v18 = [v5 userInfo];
      v23 = [v18 objectForKey:VOSBluetoothErrorKey];
      [(VoiceOverBluetoothAlert *)v22 showAlertWithResult:v23];
    }
    goto LABEL_15;
  }
LABEL_20:
}

- (id)window
{
  v2 = [(AXBluetoothDevicesController *)self view];
  v3 = [v2 window];

  return v3;
}

- (void)deviceDisconnectedHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v9 = +[AXSubsystemBrailleHardware identifier];
    v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      unsigned __int8 v12 = AXColorizeFormatLog();
      unsigned int v13 = NSStringFromSelector(a2);
      v14 = [v5 name];
      v20 = [v6 name];
      unsigned int v15 = _AXStringForArgs();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v15;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_power && !self->_togglingPower)
  {
    if ([(AXBluetoothDevicesController *)self scanningEnabled])
    {
      devicesDict = self->_devicesDict;
      __int16 v17 = [v6 identifier];
      unsigned __int8 v18 = [(NSMutableDictionary *)devicesDict objectForKey:v17];

      if (v18)
      {
        unsigned __int8 v19 = [v6 identifier];
        [(AXBluetoothDevicesController *)self reloadSpecifierID:v19];
      }
    }
  }
}

- (void)devicePairedHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v9 = +[AXSubsystemBrailleHardware identifier];
    v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      unsigned __int8 v12 = AXColorizeFormatLog();
      unsigned int v13 = NSStringFromSelector(a2);
      v14 = [v5 name];
      [v6 name];
      v40 = v39 = v14;
      v38 = v13;
      unsigned int v15 = _AXStringForArgs();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v15;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  BOOL v16 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
  __int16 v17 = [v16 objectForKey:@"PIN-ended"];

  if (!self->_power
    || self->_togglingPower
    || ![(AXBluetoothDevicesController *)self scanningEnabled])
  {
    goto LABEL_24;
  }
  unsigned __int8 v18 = [v6 address];
  unsigned __int8 v19 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
  unsigned __int8 v20 = [v18 isEqualToString:v19];

  if ((v20 & 1) == 0)
  {
    [(AXBluetoothDevicesController *)self _addDevice:v6];
LABEL_23:
    [(AXBluetoothDevicesController *)self _updateDevicePosition:v6];
    goto LABEL_24;
  }
  [(AXBluetoothDevicesController *)self _cleanupPairing];
  v21 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
  v22 = [v21 objectForKey:@"reverse-pairing"];
  unsigned int v23 = [v22 BOOLValue];

  if (v23) {
    [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
  }
  v24 = [v5 name];
  unsigned int v25 = [v24 isEqualToString:VOSBluetoothPairingPINResultFailedNotification];

  if (!v25) {
    goto LABEL_23;
  }
  if (self->_alert || ([v17 isEqualToString:@"cancelled"] & 1) != 0) {
    goto LABEL_30;
  }
  v26 = (VoiceOverBluetoothAlert *)[objc_allocWithZone((Class)VoiceOverBluetoothAlert) initWithDevice:v6];
  alert = self->_alert;
  self->_alert = v26;

  [(VoiceOverBluetoothAlert *)self->_alert setDelegate:self];
  if (v17) {
    goto LABEL_25;
  }
  sspAlert = self->_sspAlert;
  if (sspAlert
    && [(VOSBluetoothSSPPairingRequest *)sspAlert pairingStyle] != 2
    && [(VOSBluetoothSSPPairingRequest *)self->_sspAlert pairingStyle] != 3)
  {
    goto LABEL_21;
  }
  __int16 v29 = [(AXBluetoothDevicesController *)self rootController];
  v30 = [v29 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_25:
    if (![v17 isEqualToString:@"entered"])
    {
      v34 = [v5 userInfo];
      v33 = [v34 objectForKey:VOSBluetoothErrorKey];

      goto LABEL_29;
    }
    uint64_t v32 = 156;
  }
  else
  {
LABEL_21:
    uint64_t v32 = 1;
  }
  v33 = +[NSNumber numberWithUnsignedInt:v32];
LABEL_29:
  [(VoiceOverBluetoothAlert *)self->_alert showAlertWithResult:v33];

LABEL_30:
  v35 = +[VOSBluetoothManager sharedInstance];
  if ([v35 wasDeviceDiscovered:v6])
  {
  }
  else
  {
    unsigned __int8 v36 = [v6 paired];

    if ((v36 & 1) == 0)
    {
      [(AXBluetoothDevicesController *)self _removeDevice:v6];
      goto LABEL_24;
    }
  }
  v37 = [v6 address];
  [(AXBluetoothDevicesController *)self reloadSpecifierID:v37];

LABEL_24:
}

- (void)authenticationRequestHandler:(id)a3
{
  id v5 = a3;
  if (!self->_power
    || self->_togglingPower
    || ![(AXBluetoothDevicesController *)self scanningEnabled])
  {
    goto LABEL_13;
  }
  v6 = [(AXBluetoothDevicesController *)self rootController];
  unsigned int v7 = [v6 visibleViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || self->_sspAlert)
  {

    goto LABEL_7;
  }
  alert = self->_alert;

  if (!alert)
  {
    BOOL v16 = [v5 name];
    uint64_t v109 = VOSBluetoothPairingUserNumericComparisionNotification;
    if (objc_msgSend(v16, "isEqualToString:"))
    {
    }
    else
    {
      __int16 v17 = [v5 name];
      unsigned int v18 = [v17 isEqualToString:VOSBluetoothPairingPassKeyDisplayNotification];

      if (!v18)
      {
        os_log_type_t v11 = [v5 object];
LABEL_20:
        unsigned __int8 v20 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v21 = [v20 ignoreLogging];

        if ((v21 & 1) == 0)
        {
          v22 = +[AXSubsystemBrailleHardware identifier];
          unsigned int v23 = AXLoggerForFacility();

          os_log_type_t v24 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v23, v24))
          {
            uint64_t v25 = AXColorizeFormatLog();
            NSStringFromSelector(a2);
            v26 = oslog = v23;
            [v5 name];
            __int16 v27 = v106 = v24;
            [v11 name];
            v99 = v97 = v27;
            v94 = v26;
            type = (void *)v25;
            v28 = _AXStringForArgs();

            unsigned int v23 = oslog;
            if (os_log_type_enabled(oslog, v106))
            {
              *(_DWORD *)buf = 138543362;
              v111 = v28;
              _os_log_impl(&dword_0, oslog, v106, "%{public}@", buf, 0xCu);
            }
          }
        }
        -[AXBluetoothDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 1, v94, v97, v99);
        p_currentDeviceSpecifier = &self->_currentDeviceSpecifier;
        currentDeviceSpecifier = self->_currentDeviceSpecifier;
        if (currentDeviceSpecifier)
        {
          v31 = [(PSSpecifier *)currentDeviceSpecifier userInfo];
          [v31 removeObjectForKey:@"reverse-pairing"];
        }
        else
        {
          if ([v11 majorClass] == 256)
          {
            uint64_t v32 = [v5 userInfo];
            v33 = [v32 valueForKey:@"delayedPairingForNR"];

            if (!v33)
            {
              v79 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v80 = [v79 ignoreLogging];

              if ((v80 & 1) == 0)
              {
                v81 = +[AXSubsystemBrailleHardware identifier];
                v82 = AXLoggerForFacility();

                os_log_type_t v83 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v82, v83))
                {
                  v84 = AXColorizeFormatLog();
                  v85 = _AXStringForArgs();
                  if (os_log_type_enabled(v82, v83))
                  {
                    *(_DWORD *)buf = 138543362;
                    v111 = v85;
                    _os_log_impl(&dword_0, v82, v83, "%{public}@", buf, 0xCu);
                  }
                }
              }
              v86 = [v5 userInfo];
              v62 = +[NSMutableDictionary dictionaryWithDictionary:v86];

              [v62 setValue:&stru_20F6B8 forKey:@"delayedPairingForNR"];
              v87 = [v5 name];
              v88 = [v5 object];
              v89 = +[NSNotification notificationWithName:v87 object:v88 userInfo:v62];
              [(AXBluetoothDevicesController *)self performSelector:"authenticationRequestHandler:" withObject:v89 afterDelay:1.0];

              goto LABEL_75;
            }
          }
          v34 = [v11 address];
          v31 = [(AXBluetoothDevicesController *)self specifierForID:v34];

          v35 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v36 = [v35 ignoreLogging];

          if (v31)
          {
            if ((v36 & 1) == 0)
            {
              v37 = +[AXSubsystemBrailleHardware identifier];
              v38 = AXLoggerForFacility();

              os_log_type_t v39 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v38, v39))
              {
                AXColorizeFormatLog();
                uint64_t v40 = v100 = v38;
                v95 = NSStringFromSelector(a2);
                v98 = v31;
                os_log_t osloga = (os_log_t)v40;
                v38 = v100;
                v107 = _AXStringForArgs();

                if (os_log_type_enabled(v100, v39))
                {
                  *(_DWORD *)buf = 138543362;
                  v111 = v107;
                  _os_log_impl(&dword_0, v100, v39, "%{public}@", buf, 0xCu);
                }
              }
            }
            objc_storeStrong((id *)&self->_currentDeviceSpecifier, v31);
            [(AXBluetoothDevicesController *)self reloadSpecifier:*p_currentDeviceSpecifier];
          }
          else
          {
            if ((v36 & 1) == 0)
            {
              v41 = +[AXSubsystemBrailleHardware identifier];
              v42 = AXLoggerForFacility();

              os_log_type_t v43 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v42, v43))
              {
                AXColorizeFormatLog();
                uint64_t v44 = v101 = v42;
                v95 = NSStringFromSelector(a2);
                os_log_t oslogb = (os_log_t)v44;
                v42 = v101;
                v108 = _AXStringForArgs();

                if (os_log_type_enabled(v101, v43))
                {
                  *(_DWORD *)buf = 138543362;
                  v111 = v108;
                  _os_log_impl(&dword_0, v101, v43, "%{public}@", buf, 0xCu);
                }
              }
            }
            uint64_t v45 = -[AXBluetoothDevicesController specifierForDevice:](self, "specifierForDevice:", v11, v95);
            v46 = *p_currentDeviceSpecifier;
            *p_currentDeviceSpecifier = (PSSpecifier *)v45;

            [(AXBluetoothDevicesController *)self _addDevice:v11];
          }
          v47 = [(PSSpecifier *)*p_currentDeviceSpecifier userInfo];
          [v47 setObject:kCFBooleanTrue forKey:@"reverse-pairing"];
        }
        v48 = [(PSSpecifier *)*p_currentDeviceSpecifier userInfo];
        [v48 removeObjectForKey:@"PIN-ended"];

        if (!*p_currentDeviceSpecifier
          || ([v11 address],
              v49 = objc_claimAutoreleasedReturnValue(),
              [(PSSpecifier *)*p_currentDeviceSpecifier identifier],
              v50 = objc_claimAutoreleasedReturnValue(),
              unsigned int v51 = [v49 isEqualToString:v50],
              v50,
              v49,
              !v51))
        {
          v68 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v69 = [v68 ignoreLogging];

          if ((v69 & 1) == 0)
          {
            v70 = +[AXSubsystemBrailleHardware identifier];
            v71 = AXLoggerForFacility();

            os_log_type_t v72 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v71, v72))
            {
              v73 = AXColorizeFormatLog();
              v96 = NSStringFromSelector(a2);
              v74 = _AXStringForArgs();

              if (os_log_type_enabled(v71, v72))
              {
                *(_DWORD *)buf = 138543362;
                v111 = v74;
                _os_log_impl(&dword_0, v71, v72, "%{public}@", buf, 0xCu);
              }
            }
          }
          goto LABEL_12;
        }
        if ([v11 type] == 24)
        {
          v52 = [v5 name];
          uint64_t v53 = VOSBluetoothPairingPINRequestNotification;
          unsigned int v54 = [v52 isEqualToString:VOSBluetoothPairingPINRequestNotification];

          if (v54)
          {
            v55 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v56 = [v55 ignoreLogging];

            if ((v56 & 1) == 0)
            {
              v57 = +[AXSubsystemBrailleHardware identifier];
              v58 = AXLoggerForFacility();

              os_log_type_t v59 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v58, v59))
              {
                v60 = AXColorizeFormatLog();
                v61 = _AXStringForArgs();
                if (os_log_type_enabled(v58, v59))
                {
                  *(_DWORD *)buf = 138543362;
                  v111 = v61;
                  _os_log_impl(&dword_0, v58, v59, "%{public}@", buf, 0xCu);
                }
              }
            }
            v62 = +[NSNumber numberWithInt:((int)random() % 10000)];
            v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%04u", [v62 unsignedIntValue]);
            [v11 setPIN:v63];

            v64 = (VOSBluetoothSSPPairingRequest *)[objc_allocWithZone((Class)VOSBluetoothSSPPairingRequest) initWithDevice:v11 andSpecifier:*p_currentDeviceSpecifier];
            sspAlert = self->_sspAlert;
            self->_sspAlert = v64;

            [(VOSBluetoothSSPPairingRequest *)self->_sspAlert setPairingStyle:3 andPasskey:v62];
            v66 = self->_sspAlert;
            v67 = [(AXBluetoothDevicesController *)self window];
            [(VOSBluetoothSSPPairingRequest *)v66 showWithWindow:v67];

LABEL_75:
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v53 = VOSBluetoothPairingPINRequestNotification;
        }
        v75 = [v5 name];
        unsigned int v76 = [v75 isEqualToString:v53];

        if (v76)
        {
          [(AXBluetoothDevicesController *)self _pinRequestHandler:v5];
        }
        else
        {
          v77 = [v5 name];
          unsigned int v78 = [v77 isEqualToString:VOSBluetoothPairingUserConfirmationNotification];

          if (v78)
          {
            [(AXBluetoothDevicesController *)self _sspConfirmationHandler:v5];
          }
          else
          {
            v90 = [v5 name];
            unsigned int v91 = [v90 isEqualToString:v109];

            if (v91)
            {
              [(AXBluetoothDevicesController *)self _sspNumericComparisonHandler:v5];
            }
            else
            {
              v92 = [v5 name];
              unsigned int v93 = [v92 isEqualToString:VOSBluetoothPairingPassKeyDisplayNotification];

              if (v93) {
                [(AXBluetoothDevicesController *)self _sspPasskeyDisplayHandler:v5];
              }
            }
          }
        }
        goto LABEL_12;
      }
    }
    unsigned __int8 v19 = [v5 object];
    os_log_type_t v11 = [v19 valueForKey:@"device"];

    goto LABEL_20;
  }
LABEL_7:
  unsigned __int8 v8 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    v10 = +[AXSubsystemBrailleHardware identifier];
    os_log_type_t v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      unsigned int v13 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v111 = v14;
        _os_log_impl(&dword_0, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_pinRequestHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v9 = +[AXSubsystemBrailleHardware identifier];
    v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = AXColorizeFormatLog();
      unsigned int v13 = NSStringFromSelector(a2);
      v14 = [v5 name];
      unsigned int v18 = [v6 name];
      unsigned int v15 = _AXStringForArgs();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        unsigned __int8 v20 = v15;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  id v16 = [objc_allocWithZone((Class)AXUIVoiceOverBluetoothPairSetup) init];
  [(AXBluetoothDevicesController *)self setShowingSetupController:1];
  __int16 v17 = [(AXBluetoothDevicesController *)self rootController];
  [v16 setRootController:v17];

  [v16 setParentController:self];
  [v16 setSpecifier:self->_currentDeviceSpecifier];
  [(PSSpecifier *)self->_currentDeviceSpecifier setTarget:self];
  [(AXBluetoothDevicesController *)self showController:v16 animate:1];
}

- (void)_sspConfirmationHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v9 = +[AXSubsystemBrailleHardware identifier];
    v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = AXColorizeFormatLog();
      unsigned int v13 = NSStringFromSelector(a2);
      v14 = [v5 name];
      unsigned __int8 v20 = [v6 name];
      unsigned int v15 = _AXStringForArgs();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v15;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  id v16 = (VOSBluetoothSSPPairingRequest *)[objc_allocWithZone((Class)VOSBluetoothSSPPairingRequest) initWithDevice:v6 andSpecifier:self->_currentDeviceSpecifier];
  sspAlert = self->_sspAlert;
  self->_sspAlert = v16;

  [(VOSBluetoothSSPPairingRequest *)self->_sspAlert setPairingStyle:1 andPasskey:0];
  unsigned int v18 = self->_sspAlert;
  unsigned __int8 v19 = [(AXBluetoothDevicesController *)self window];
  [(VOSBluetoothSSPPairingRequest *)v18 showWithWindow:v19];
}

- (void)_sspNumericComparisonHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = [v6 valueForKey:@"device"];
  unsigned __int8 v8 = [v6 valueForKey:@"value"];
  unsigned __int8 v9 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v10 = [v9 ignoreLogging];

  if ((v10 & 1) == 0)
  {
    os_log_type_t v11 = +[AXSubsystemBrailleHardware identifier];
    os_log_type_t v12 = AXLoggerForFacility();

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      AXColorizeFormatLog();
      v14 = os_log_type_t v23 = v13;
      unsigned int v15 = NSStringFromSelector(a2);
      id v16 = [v5 name];
      v22 = [v7 name];
      os_log_type_t v24 = (void *)v14;
      __int16 v17 = _AXStringForArgs();

      if (os_log_type_enabled(v12, v23))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v17;
        _os_log_impl(&dword_0, v12, v23, "%{public}@", buf, 0xCu);
      }
    }
  }
  unsigned int v18 = (VOSBluetoothSSPPairingRequest *)[objc_allocWithZone((Class)VOSBluetoothSSPPairingRequest) initWithDevice:v7 andSpecifier:self->_currentDeviceSpecifier];
  sspAlert = self->_sspAlert;
  self->_sspAlert = v18;

  [(VOSBluetoothSSPPairingRequest *)self->_sspAlert setPairingStyle:0 andPasskey:v8];
  unsigned __int8 v20 = self->_sspAlert;
  unsigned __int8 v21 = [(AXBluetoothDevicesController *)self window];
  [(VOSBluetoothSSPPairingRequest *)v20 showWithWindow:v21];
}

- (void)_sspPasskeyDisplayHandler:(id)a3
{
  id v5 = a3;
  v6 = [v5 object];
  unsigned int v7 = [v6 valueForKey:@"device"];
  unsigned __int8 v8 = [v6 valueForKey:@"value"];
  unsigned __int8 v9 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v10 = [v9 ignoreLogging];

  if ((v10 & 1) == 0)
  {
    os_log_type_t v11 = +[AXSubsystemBrailleHardware identifier];
    os_log_type_t v12 = AXLoggerForFacility();

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      AXColorizeFormatLog();
      v14 = os_log_type_t v23 = v13;
      unsigned int v15 = NSStringFromSelector(a2);
      id v16 = [v5 name];
      v22 = [v7 name];
      os_log_type_t v24 = (void *)v14;
      __int16 v17 = _AXStringForArgs();

      if (os_log_type_enabled(v12, v23))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v17;
        _os_log_impl(&dword_0, v12, v23, "%{public}@", buf, 0xCu);
      }
    }
  }
  unsigned int v18 = (VOSBluetoothSSPPairingRequest *)[objc_allocWithZone((Class)VOSBluetoothSSPPairingRequest) initWithDevice:v7 andSpecifier:self->_currentDeviceSpecifier];
  sspAlert = self->_sspAlert;
  self->_sspAlert = v18;

  [(VOSBluetoothSSPPairingRequest *)self->_sspAlert setPairingStyle:2 andPasskey:v8];
  unsigned __int8 v20 = self->_sspAlert;
  unsigned __int8 v21 = [(AXBluetoothDevicesController *)self window];
  [(VOSBluetoothSSPPairingRequest *)v20 showWithWindow:v21];
}

- (BOOL)shouldAddClassicDevice:(id)a3
{
  return 1;
}

- (BOOL)shouldAddBTLEDevice:(id)a3
{
  return 1;
}

- (void)_addDevice:(id)a3
{
  id v4 = a3;
  if ([v4 isClassicDevice]
    && ![(AXBluetoothDevicesController *)self shouldAddClassicDevice:v4])
  {
    unsigned __int8 v8 = AXLogBrailleHW();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Not addding classic device: %@", buf, 0xCu);
    }
    goto LABEL_29;
  }
  unsigned int v5 = [v4 isBTLEDevice];
  if (!v5
    || ([v4 name],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 containsString:@"Apple Pencil"],
        v6,
        (v7 & 1) == 0))
  {
    unsigned __int8 v8 = [v4 identifier];
    unsigned __int8 v9 = AXLogBrailleHW();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v8;
      __int16 v38 = 2112;
      os_log_type_t v39 = v4;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Device id: %@ %@", buf, 0x16u);
    }

    if ([v8 length])
    {
      unsigned __int8 v10 = [(NSMutableDictionary *)self->_devicesDict objectForKey:v8];

      if (!v10)
      {
        os_log_type_t v11 = [(AXBluetoothDevicesController *)self specifierForDevice:v4];
        os_log_type_t v12 = AXLogBrailleHW();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v37 = v11;
          __int16 v38 = 2112;
          os_log_type_t v39 = v4;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Spec: %@ %@", buf, 0x16u);
        }

        id v13 = [(NSMutableDictionary *)self->_devicesDict count];
        [(NSMutableDictionary *)self->_devicesDict setObject:v4 forKey:v8];
        if (v13)
        {
          uint64_t v14 = (char *)[*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] count];
          v33 = [objc_allocWithZone((Class)NSMutableArray) init];
          uint64_t v32 = v11;
          uint64_t v15 = 0;
          if (v14)
          {
            for (i = 0; i != v14; ++i)
            {
              __int16 v17 = [(AXBluetoothDevicesController *)self specifierAtIndex:i];
              unsigned int v18 = [v17 userInfo];
              unsigned __int8 v19 = [v18 objectForKey:@"bt-device"];

              if (v19)
              {
                if ([v19 paired]) {
                  ++v15;
                }
                else {
                  [v33 addObject:v19];
                }
              }
            }
          }
          unsigned __int8 v20 = v33;
          [v33 addObject:v4];
          [v33 sortUsingSelector:"compare:"];
          unsigned __int8 v21 = [(NSMutableArray *)self->_deviceSpecifiersGroup objectAtIndex:0];
          v22 = (char *)[(AXBluetoothDevicesController *)self indexOfSpecifier:v21];
          os_log_type_t v23 = &v22[(void)[v33 indexOfObject:v4] + v15 + 1];

          os_log_type_t v24 = AXLogBrailleHW();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = +[NSNumber numberWithUnsignedInteger:v23];
            *(_DWORD *)buf = 138412546;
            v37 = v25;
            __int16 v38 = 2112;
            os_log_type_t v39 = v33;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Insert device: %@ : %@", buf, 0x16u);
          }
          os_log_type_t v11 = v32;
          [(AXBluetoothDevicesController *)self insertSpecifier:v32 atIndex:v23 animated:1];
        }
        else
        {
          uint64_t v26 = [(AXBluetoothDevicesController *)self specifierForID:@"PLACEHOLDER"];
          unsigned __int8 v20 = (void *)v26;
          if (v26)
          {
            uint64_t v35 = v26;
            __int16 v27 = +[NSArray arrayWithObjects:&v35 count:1];
            v34 = v11;
            v28 = +[NSArray arrayWithObjects:&v34 count:1];
            [(AXBluetoothDevicesController *)self replaceContiguousSpecifiers:v27 withSpecifiers:v28 animated:1];

            __int16 v29 = [(AXBluetoothDevicesController *)self specifierForID:@"DEVICES"];
            v30 = [v29 propertyForKey:@"VoiceOverTextSpinnerView"];
            [v30 showSpinner];
          }
        }

        if (v5)
        {
          v31 = +[VOSBluetoothManager sharedInstance];
          [v31 postNotificationName:VOSBluetoothDeviceConnectSuccessNotification object:v4];
        }
      }
    }
LABEL_29:
  }
}

- (void)_removeDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 identifier];
  v6 = [(NSMutableDictionary *)self->_devicesDict objectForKey:v5];

  if (v6)
  {
    -[AXBluetoothDevicesController specifierForID:](self, "specifierForID:", v5, 0, 0);
    unsigned __int8 v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    id v8 = [(AXBluetoothDevicesController *)self indexOfSpecifierID:v5];
    if (v7 && v7 == self->_currentDeviceSpecifier)
    {
      [v4 disconnect];
      [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
    }
    [(AXBluetoothDevicesController *)self getGroup:&v15 row:&v14 ofSpecifierAtIndex:v8];
    [(NSMutableDictionary *)self->_devicesDict removeObjectForKey:v5];
    if ([(NSMutableDictionary *)self->_devicesDict count])
    {
      [(AXBluetoothDevicesController *)self removeSpecifierAtIndex:v8 animated:1];
    }
    else
    {
      if (v7)
      {
        unsigned __int8 v9 = +[NSArray arrayWithObject:v7];
        unsigned __int8 v10 = [(NSMutableArray *)self->_deviceSpecifiersGroup objectAtIndex:1];
        os_log_type_t v11 = +[NSArray arrayWithObject:v10];
        [(AXBluetoothDevicesController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v11 animated:1];
      }
      os_log_type_t v12 = [(AXBluetoothDevicesController *)self specifierForID:@"DEVICES"];
      id v13 = [v12 propertyForKey:@"VoiceOverTextSpinnerView"];
      [v13 hideSpinner];
    }
  }
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    unsigned __int8 v7 = +[VOSBluetoothManager sharedInstance];
    [(NSMutableDictionary *)self->_devicesDict removeAllObjects];
    v60 = v7;
    unsigned int v8 = [v7 enabled];
    self->_power = v8;
    if (!self->_deviceSpecifiersGroup)
    {
      [(AXBluetoothDevicesController *)self _showBluetoothPowerFooter:v8 ^ 1];
      unsigned __int8 v9 = (NSMutableDictionary *)[objc_allocWithZone((Class)NSMutableDictionary) initWithCapacity:4];
      pairingPINDict = self->_pairingPINDict;
      self->_pairingPINDict = v9;

      os_log_type_t v11 = self->_pairingPINDict;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = PSCellClassKey;
      [(NSMutableDictionary *)v11 setObject:v12 forKey:PSCellClassKey];
      uint64_t v14 = self->_pairingPINDict;
      uint64_t v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      [(NSMutableDictionary *)v14 setObject:v16 forKey:PSDetailControllerClassKey];

      __int16 v17 = self->_pairingPINDict;
      unsigned int v18 = (objc_class *)objc_opt_class();
      unsigned __int8 v19 = NSStringFromClass(v18);
      [(NSMutableDictionary *)v17 setObject:v19 forKey:PSSetupCustomClassKey];

      [(NSMutableDictionary *)self->_pairingPINDict setObject:@"PSLinkCell" forKey:PSTableCellClassKey];
      unsigned __int8 v20 = (NSMutableArray *)[objc_allocWithZone((Class)NSMutableArray) init];
      deviceSpecifiersGroup = self->_deviceSpecifiersGroup;
      self->_deviceSpecifiersGroup = v20;

      v22 = [(AXBluetoothDevicesController *)self devicesGroupName];
      os_log_type_t v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:0 set:0 get:0 detail:0 cell:0 edit:0];

      os_log_type_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      [v23 setProperty:v25 forKey:PSHeaderCellClassGroupKey];

      uint64_t v26 = PSIDKey;
      [v23 setProperty:@"DEVICES" forKey:PSIDKey];
      [(NSMutableArray *)self->_deviceSpecifiersGroup addObject:v23];
      __int16 v27 = settingsLocString(@"SEARCHING", @"VoiceOverBluetoothDevices");
      v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:0 set:0 get:0 detail:0 cell:4 edit:0];

      [v28 setProperty:objc_opt_class() forKey:v13];
      [v28 setProperty:kCFBooleanFalse forKey:PSEnabledKey];
      [v28 setProperty:@"PLACEHOLDER" forKey:v26];
      [(NSMutableArray *)self->_deviceSpecifiersGroup addObject:v28];
    }
    id v29 = objc_allocWithZone((Class)NSMutableArray);
    v30 = [(AXBluetoothDevicesController *)self mainSpecifiersGroup];
    id v31 = [v29 initWithArray:v30];

    if (self->_power) {
      unsigned int v32 = [(AXBluetoothDevicesController *)self scanningEnabled];
    }
    else {
      unsigned int v32 = 0;
    }
    v33 = [(NSMutableArray *)self->_deviceSpecifiersGroup objectAtIndex:0];
    [v31 addObject:v33];

    v34 = 0;
    if (v32)
    {
      v34 = [(AXBluetoothDevicesController *)self pairedDeviceSpecifiers];
    }
    if ([v34 count])
    {
      [v31 addObjectsFromArray:v34];
      uint64_t v35 = [v31 specifierForID:@"DEVICES"];
      [v35 setProperty:kCFBooleanTrue forKey:@"VoiceOverTextSpinnerViewEnabled"];
    }
    else
    {
      uint64_t v35 = [(NSMutableArray *)self->_deviceSpecifiersGroup objectAtIndex:1];
      [v31 addObject:v35];
    }

    if (v32)
    {
      unsigned __int8 v36 = [v7 connectingDevices];
      v37 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v38 = [v37 ignoreLogging];

      if ((v38 & 1) == 0)
      {
        os_log_type_t v39 = +[AXSubsystemBrailleHardware identifier];
        uint64_t v40 = AXLoggerForFacility();

        os_log_type_t v41 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = AXColorizeFormatLog();
          os_log_type_t v43 = NSStringFromSelector(a2);
          id v57 = [v36 count];
          v58 = v36;
          unsigned __int8 v56 = v43;
          uint64_t v44 = _AXStringForArgs();

          if (os_log_type_enabled(v40, v41))
          {
            *(_DWORD *)buf = 138543362;
            v67 = v44;
            _os_log_impl(&dword_0, v40, v41, "%{public}@", buf, 0xCu);
          }
        }
      }
      os_log_type_t v59 = v34;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v45 = v36;
      id v46 = [v45 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v46)
      {
        id v47 = v46;
        uint64_t v48 = *(void *)v62;
        do
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(void *)v62 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * i), "address", v56, v57, v58);
            unsigned int v51 = [v31 specifierForID:v50];

            if (v51)
            {
              [(AXBluetoothDevicesController *)self setBluetoothIsBusy:1];
              objc_storeStrong((id *)&self->_currentDeviceSpecifier, v51);
            }
          }
          id v47 = [v45 countByEnumeratingWithState:&v61 objects:v65 count:16];
        }
        while (v47);
      }

      v34 = v59;
    }
    v52 = [(AXBluetoothDevicesController *)self postDevicesSpecifiersGroup];
    [v31 addObjectsFromArray:v52];

    uint64_t v53 = *(void **)&self->AXUISettingsBaseListController_opaque[v2];
    *(void *)&self->AXUISettingsBaseListController_opaque[v2] = v31;
    id v54 = v31;

    id v4 = *(id *)&self->AXUISettingsBaseListController_opaque[v2];
  }

  return v4;
}

- (id)specifierImmediatelyPrecedingDevices
{
  uint64_t v2 = [(AXBluetoothDevicesController *)self mainSpecifiersGroup];
  v3 = [v2 lastObject];

  return v3;
}

- (id)postDevicesSpecifiersGroup
{
  return &__NSArray0__struct;
}

- (BOOL)_isBluetoothPowerFooterShowing
{
  uint64_t v2 = [(AXBluetoothDevicesController *)self mainSpecifiersGroup];
  v3 = [v2 objectAtIndex:0];

  id v4 = [v3 propertyForKey:PSFooterTextGroupKey];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (void)_showBluetoothPowerFooter:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(AXBluetoothDevicesController *)self mainSpecifiersGroup];
  id v7 = [v5 objectAtIndex:0];

  if (v3)
  {
    v6 = [(AXBluetoothDevicesController *)self bluetoothPoweredOffFooter];
    [v7 setProperty:v6 forKey:PSFooterTextGroupKey];
  }
  else
  {
    [v7 removePropertyForKey:PSFooterTextGroupKey];
  }
}

- (void)setScanningEnabled:(BOOL)a3
{
  if (self->_scanningEnabled != a3)
  {
    self->_scanningEnabled = a3;
    -[AXBluetoothDevicesController _showScanningUI:](self, "_showScanningUI:");
  }
}

- (void)updatePairedDevices
{
  uint64_t v35 = OBJC_IVAR___PSListController__specifiers;
  BOOL v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = [(NSMutableArray *)self->_deviceSpecifiersGroup objectAtIndex:0];
  unsigned int v5 = (char *)[v3 indexOfObject:v4];

  v33 = v5;
  if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v34 = [objc_allocWithZone((Class)NSMutableArray) initWithArray:self->_deviceSpecifiersGroup];
    v6 = [v34 specifierForID:@"DEVICES"];
    id v7 = [v6 propertyForKey:@"VoiceOverTextSpinnerView"];
    [v7 hideSpinner];
  }
  else
  {
    id v34 = +[NSMutableArray array];
  }
  unsigned __int8 v36 = self;
  v37 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = *(id *)&self->AXUISettingsBaseListController_opaque[v35];
  id v9 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v44;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v14 = [v13 userInfo];
        uint64_t v15 = [v14 objectForKeyedSubscript:@"bt-device"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [v37 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v10);
  }

  __int16 v17 = self;
  [(AXBluetoothDevicesController *)self removeContiguousSpecifiers:v37];
  unsigned int v18 = [(AXBluetoothDevicesController *)self pairedDeviceSpecifiers];
  unsigned __int8 v19 = v34;
  if ([v18 count])
  {
    unsigned __int8 v20 = [(NSMutableArray *)v36->_deviceSpecifiersGroup objectAtIndex:1];
    id v21 = [v34 indexOfObject:v20];

    if (v21 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v22 = v18;
      id v23 = [v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v40;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v40 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
            v28 = *(void **)&v36->AXUISettingsBaseListController_opaque[v35];
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = __51__AXBluetoothDevicesController_updatePairedDevices__block_invoke;
            v38[3] = &unk_20A748;
            v38[4] = v27;
            if ((objc_msgSend(v28, "ax_containsObjectUsingBlock:", v38) & 1) == 0) {
              [v34 addObject:v27];
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v24);
      }

      __int16 v17 = v36;
      unsigned __int8 v19 = v34;
    }
    else
    {
      objc_msgSend(v34, "replaceObjectsInRange:withObjectsFromArray:", v21, 1, v18);
    }
    id v29 = [v19 specifierForID:@"DEVICES"];
    [v29 setProperty:kCFBooleanTrue forKey:@"VoiceOverTextSpinnerViewEnabled"];

    v30 = [v19 specifierForID:@"DEVICES"];
    id v31 = [v30 propertyForKey:@"VoiceOverTextSpinnerView"];
    [v31 showSpinner];
  }
  if (v33 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v32 = [(AXBluetoothDevicesController *)v17 specifierImmediatelyPrecedingDevices];
    [(AXBluetoothDevicesController *)v17 insertContiguousSpecifiers:v19 afterSpecifier:v32 animated:1];
  }
  else
  {
    [(AXBluetoothDevicesController *)v17 insertContiguousSpecifiers:v19 atIndex:v33 + 1];
  }
}

id __51__AXBluetoothDevicesController_updatePairedDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = PSIDKey;
  id v4 = [a2 propertyForKey:PSIDKey];
  unsigned int v5 = [*(id *)(a1 + 32) propertyForKey:v3];
  id v6 = [v4 isEqual:v5];

  return v6;
}

- (void)_showScanningUI:(BOOL)a3
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers]) {
    return;
  }
  BOOL v4 = a3;
  currentDeviceSpecifier = self->_currentDeviceSpecifier;
  self->_currentDeviceSpecifier = 0;

  [(AXBluetoothDevicesController *)self beginUpdates];
  if (v4)
  {
    if (self->_power)
    {
      if ([(AXBluetoothDevicesController *)self _isBluetoothPowerFooterShowing])
      {
        [(AXBluetoothDevicesController *)self _showBluetoothPowerFooter:0];
        id v7 = [(AXBluetoothDevicesController *)self mainSpecifiersGroup];
        id v8 = [v7 objectAtIndex:0];

        [(AXBluetoothDevicesController *)self reloadSpecifier:v8 animated:1];
      }
      if (self->_power && [(AXBluetoothDevicesController *)self scanningEnabled]) {
        [(AXBluetoothDevicesController *)self updatePairedDevices];
      }
    }
    [(AXBluetoothDevicesController *)self endUpdates];
    [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
    if (self->_power)
    {
      id v9 = +[UIApplication sharedApplication];
      id v10 = [v9 applicationState];

      if (!v10)
      {
        [(AXBluetoothDevicesController *)self _startScanning];
        [(AXBluetoothDevicesController *)self _startDiscoverable];
        [(AXBluetoothDevicesController *)self _startConnectable];
      }
    }
    return;
  }
  uint64_t v11 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  uint64_t v12 = [(NSMutableArray *)self->_deviceSpecifiersGroup objectAtIndex:0];
  if ([v11 indexOfObject:v12] != (id)0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)[(NSMutableArray *)self->_deviceSpecifiersGroup count] >= 2)
  {
    id v13 = [(AXBluetoothDevicesController *)self numberOfGroups];

    if ((uint64_t)v13 < 2) {
      goto LABEL_17;
    }
    uint64_t v12 = [(AXBluetoothDevicesController *)self specifiersInGroup:1];
    uint64_t v14 = +[NSArray arrayWithArray:v12];
    [(AXBluetoothDevicesController *)self removeContiguousSpecifiers:v14 animated:1];
  }
LABEL_17:
  [(AXBluetoothDevicesController *)self _cleanupPairing];
  if (!self->_power
    && ![(AXBluetoothDevicesController *)self _isBluetoothPowerFooterShowing])
  {
    [(AXBluetoothDevicesController *)self _showBluetoothPowerFooter:1];
    uint64_t v15 = [(AXBluetoothDevicesController *)self mainSpecifiersGroup];
    id v16 = [v15 objectAtIndex:0];

    [(AXBluetoothDevicesController *)self reloadSpecifier:v16 animated:1];
  }
  [(AXBluetoothDevicesController *)self endUpdates];
  __int16 v17 = [(AXBluetoothDevicesController *)self rootController];
  id v18 = [v17 popToViewController:self animated:1];

  [(NSMutableDictionary *)self->_devicesDict removeAllObjects];
  [(AXBluetoothDevicesController *)self _stopScanning];
  [(AXBluetoothDevicesController *)self _stopDiscoverable];

  [(AXBluetoothDevicesController *)self _stopConnectable];
}

- (void)setMainSpecifiersGroup:(id)a3
{
  if (self->_mainSpecifiersGroup != a3)
  {
    BOOL v4 = (NSMutableArray *)[a3 mutableCopyWithZone:0];
    mainSpecifiersGroup = self->_mainSpecifiersGroup;
    self->_mainSpecifiersGroup = v4;
    _objc_release_x1(v4, mainSpecifiersGroup);
  }
}

- (void)reloadSpecifiers
{
  pairingPINDict = self->_pairingPINDict;
  self->_pairingPINDict = 0;

  deviceSpecifiersGroup = self->_deviceSpecifiersGroup;
  self->_deviceSpecifiersGroup = 0;

  currentDeviceSpecifier = self->_currentDeviceSpecifier;
  self->_currentDeviceSpecifier = 0;

  v6.receiver = self;
  v6.super_class = (Class)AXBluetoothDevicesController;
  [(AXBluetoothDevicesController *)&v6 reloadSpecifiers];
}

- (id)pairedDeviceSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  BOOL v4 = +[VOSBluetoothManager sharedInstance];
  unsigned int v5 = [v4 pairedDevices];

  id v6 = [v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        if ([(AXBluetoothDevicesController *)self shouldAddClassicDevice:v10]
          && ([v3 containsObject:v10] & 1) == 0)
        {
          [v3 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v7);
  }

  uint64_t v11 = +[VOSBluetoothManager sharedInstance];
  uint64_t v12 = [v11 pairedBTLEDevices];
  [v3 axSafelyAddObjectsFromArray:v12];

  id v13 = [(AXBluetoothDevicesController *)self centralManager];
  uint64_t v14 = (char *)[v13 state];

  if (v14 == (unsigned char *)&dword_4 + 1)
  {
    uint64_t v15 = v3;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v16 = [(AXBluetoothDevicesController *)self centralManager];
    __int16 v17 = [v16 retrieveConnectedPeripheralsWithServices:0 allowAll:1];

    id v18 = [v17 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v46;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
          id v23 = [v22 name];
          id v24 = v23;
          if (!v23 || ([v23 containsString:@"Apple Pencil"] & 1) == 0)
          {
            uint64_t v25 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:v22];
            if (v25
              && ([v15 containsObject:v25] & 1) == 0
              && [(AXBluetoothDevicesController *)self shouldAddBTLEDevice:v25])
            {
              [v15 addObject:v25];
            }
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v19);
    }

    uint64_t v3 = v15;
  }
  uint64_t v26 = +[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:1];
  id v54 = v26;
  uint64_t v27 = +[NSArray arrayWithObjects:&v54 count:1];
  long long v39 = v3;
  v28 = [v3 sortedArrayUsingDescriptors:v27];

  id v29 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v28;
  id v30 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        id v34 = *(void **)(*((void *)&v41 + 1) + 8 * (void)k);
        uint64_t v35 = [(AXBluetoothDevicesController *)self specifierForDevice:v34];
        [v29 addObject:v35];
        devicesDict = self->_devicesDict;
        v37 = [v34 identifier];
        [(NSMutableDictionary *)devicesDict setObject:v34 forKey:v37];
      }
      id v31 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v31);
  }

  return v29;
}

- (id)specifierForDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 name];
  if (![(__CFString *)v5 length])
  {

    unsigned int v5 = &stru_20F6B8;
  }
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  id v7 = [objc_allocWithZone((Class)NSMutableDictionary) initWithDictionary:self->_pairingPINDict];
  [v7 setObject:v5 forKey:PSTitleKey];
  uint64_t v8 = +[NSNumber numberWithInteger:[(AXBluetoothDevicesController *)self axDeviceControllerType]];
  [v7 setObject:v8 forKey:@"axDeviceControllerType"];

  id v9 = [v4 identifier];
  [v7 setObject:v9 forKey:PSIDKey];

  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  [v7 setObject:v11 forKey:PSDetailControllerClassKey];

  [v6 setProperties:v7];
  id v12 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  [v12 setObject:v4 forKey:@"bt-device"];

  [v6 setUserInfo:v12];

  return v6;
}

- (int64_t)axDeviceControllerType
{
  return 0;
}

- (void)_updateDevicePosition:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 identifier];
  id v6 = [(AXBluetoothDevicesController *)self specifierForID:v5];

  id v7 = AXLogBrailleHW();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AXBluetoothDevicesController _updateDevicePosition:]();
  }

  if (v6)
  {
    uint64_t v8 = (char *)[(AXBluetoothDevicesController *)self indexOfSpecifier:v6];
    id v9 = [(AXBluetoothDevicesController *)self specifierAtIndex:v8 - 1];
    uint64_t v10 = [v9 userInfo];
    uint64_t v11 = [v10 objectForKey:@"bt-device"];

    id v12 = [(AXBluetoothDevicesController *)self specifierAtIndex:v8 + 1];
    id v13 = [v12 userInfo];
    uint64_t v14 = [v13 objectForKey:@"bt-device"];

    if (v11)
    {
      unsigned int v15 = [v11 paired];
      if (v15 != [v4 paired])
      {
        BOOL v16 = 1;
        if (!v14) {
          goto LABEL_12;
        }
LABEL_9:
        unsigned int v17 = [v14 paired];
        if (v17 != [v4 paired]) {
          goto LABEL_14;
        }
        id v18 = [v14 name];
        [v4 name];
        v20 = id v19 = v14;
        BOOL v21 = [v18 caseInsensitiveCompare:v20] != (char *)&dword_0 + 1;

        uint64_t v14 = v19;
LABEL_13:
        if (!v16 && !v21)
        {
          [(AXBluetoothDevicesController *)self reloadSpecifier:v6 animated:0];
LABEL_35:

          goto LABEL_36;
        }
LABEL_14:
        uint64_t v52 = 0;
        uint64_t v53 = 0;
        -[AXBluetoothDevicesController getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", &v53, &v52, v8, v14);
        [(AXBluetoothDevicesController *)self removeSpecifierAtIndex:v8 animated:1];
        uint64_t v25 = [(AXBluetoothDevicesController *)self specifierAtIndex:0];
        long long v51 = v11;
        if (v25)
        {
          uint64_t v26 = (void *)v25;
          uint64_t v27 = 0;
          int v28 = 0;
          while (1)
          {
            id v29 = [(AXBluetoothDevicesController *)self specifierAtIndex:v27];
            id v30 = [v29 userInfo];
            id v31 = [v30 objectForKey:@"bt-device"];

            if (v31) {
              break;
            }
            uint64_t v27 = (v28 + 1);
            uint64_t v26 = [(AXBluetoothDevicesController *)self specifierAtIndex:v27];
            ++v28;
            if (!v26) {
              goto LABEL_22;
            }
          }
          LODWORD(v27) = v28;
        }
        else
        {
          LODWORD(v27) = 0;
        }
LABEL_22:
        if (([v4 paired] & 1) == 0)
        {
          uint64_t v32 = v27;
          uint64_t v33 = [(AXBluetoothDevicesController *)self specifierAtIndex:v27];
          if (v33)
          {
            id v34 = (void *)v33;
            while (1)
            {
              uint64_t v35 = [(AXBluetoothDevicesController *)self specifierAtIndex:v32];
              unsigned __int8 v36 = [v35 userInfo];
              v37 = [v36 objectForKey:@"bt-device"];
              unsigned int v38 = [v37 paired];

              if (!v38) {
                break;
              }
              uint64_t v32 = (v27 + 1);
              id v34 = [(AXBluetoothDevicesController *)self specifierAtIndex:v32];
              LODWORD(v27) = v27 + 1;
              if (!v34) {
                goto LABEL_29;
              }
            }
          }
        }
        LODWORD(v32) = v27;
LABEL_29:
        uint64_t v39 = v32;
        long long v40 = [(AXBluetoothDevicesController *)self specifierAtIndex:v32];
        long long v41 = [v40 userInfo];
        long long v42 = [v41 objectForKey:@"bt-device"];

        uint64_t v11 = v51;
        if (v42)
        {
          do
          {
            unsigned int v43 = [v4 paired];
            if (v43 != [v42 paired]) {
              break;
            }
            long long v44 = [v4 name];
            long long v45 = [v42 name];
            id v46 = [v44 compare:v45 options:1];

            if (v46 == (id)-1) {
              break;
            }
            uint64_t v32 = (v32 + 1);
            long long v47 = [(AXBluetoothDevicesController *)self specifierAtIndex:v32];
            long long v48 = [v47 userInfo];
            uint64_t v49 = [v48 objectForKey:@"bt-device"];

            long long v42 = (void *)v49;
          }
          while (v49);
          uint64_t v39 = v32;
        }
        [(AXBluetoothDevicesController *)self insertSpecifier:v6 atIndex:v39 animated:1];
        uint64_t v14 = v50;
        goto LABEL_35;
      }
      id v22 = [v11 name];
      [v4 name];
      v24 = id v23 = v14;
      BOOL v16 = [v22 caseInsensitiveCompare:v24] != (id)-1;

      uint64_t v14 = v23;
      if (v23) {
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v16 = 0;
      if (v14) {
        goto LABEL_9;
      }
    }
LABEL_12:
    BOOL v21 = 0;
    goto LABEL_13;
  }
LABEL_36:
}

- (void)_startDiscoverable
{
  uint64_t v2 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = +[AXSubsystemBrailleHardware identifier];
    unsigned int v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = AXColorizeFormatLog();
      uint64_t v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_0, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v9 = +[VOSBluetoothManager sharedInstance];
  [v9 setDiscoverable:1];
}

- (void)_stopDiscoverable
{
  uint64_t v2 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = +[AXSubsystemBrailleHardware identifier];
    unsigned int v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = AXColorizeFormatLog();
      uint64_t v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_0, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v9 = +[VOSBluetoothManager sharedInstance];
  [v9 setDiscoverable:0];
}

- (void)_startConnectable
{
  uint64_t v2 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = +[AXSubsystemBrailleHardware identifier];
    unsigned int v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = AXColorizeFormatLog();
      uint64_t v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_0, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v9 = +[VOSBluetoothManager sharedInstance];
  [v9 setConnectable:1];
}

- (void)_stopConnectable
{
  uint64_t v2 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = +[AXSubsystemBrailleHardware identifier];
    unsigned int v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = AXColorizeFormatLog();
      uint64_t v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_0, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  id v9 = +[VOSBluetoothManager sharedInstance];
  [v9 setConnectable:0];
}

- (void)_startScanning
{
  unsigned __int8 v3 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[AXSubsystemBrailleHardware identifier];
    os_log_type_t v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog();
      id v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v11 = 138543362;
        id v12 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  int v10 = +[VOSBluetoothManager sharedInstance];
  objc_msgSend(v10, "setAuthorizedServices:", -[AXBluetoothDevicesController authorizedServices](self, "authorizedServices"));
  [v10 setDeviceScanningEnabled:1];
  [(AXBluetoothDevicesController *)self _setupCentralScanning:1];
}

- (void)_stopScanning
{
  unsigned __int8 v3 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[AXSubsystemBrailleHardware identifier];
    os_log_type_t v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog();
      id v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v12 = 138543362;
        id v13 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  int v10 = +[VOSBluetoothManager sharedInstance];
  [v10 setDeviceScanningEnabled:0];

  int v11 = +[VOSBluetoothManager sharedInstance];
  [v11 resetDeviceScanning];

  [(AXBluetoothDevicesController *)self _setupCentralScanning:0];
}

- (BOOL)_brailleConfigMatch:(id)a3 withConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_log_type_t v7 = [v5 objectForKeyedSubscript:kSCROBrailleDisplayBluetoothAddress];
  uint64_t v8 = [v6 objectForKeyedSubscript:kSCROBrailleDisplayBluetoothAddress];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    int v11 = [v5 objectForKeyedSubscript:kSCROBrailleDisplayBrailleVendorProductId];
    int v12 = [v6 objectForKeyedSubscript:kSCROBrailleDisplayBrailleVendorProductId];
    unsigned __int8 v10 = [v11 isEqualToString:v12];
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)AXBluetoothDevicesController;
  os_log_type_t v7 = [(AXBluetoothDevicesController *)&v31 tableView:a3 cellForRowAtIndexPath:v6];
  if ([v7 tag] == (char *)&dword_0 + 1)
  {
    id v8 = [(AXBluetoothDevicesController *)self indexForIndexPath:v6];
    unsigned __int8 v9 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
    unsigned __int8 v10 = [v9 userInfo];
    int v11 = [v10 objectForKey:@"bt-device"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v13 = [v12 ignoreLogging];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = +[AXSubsystemBrailleHardware identifier];
        unsigned int v15 = AXLoggerForFacility();

        os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v15, v16))
        {
          unsigned int v17 = AXColorizeFormatLog();
          id v18 = [v7 title];
          unsigned int v19 = [v11 paired];
          uint64_t v29 = [v11 connected];
          id v30 = v11;
          uint64_t v27 = v18;
          uint64_t v28 = v19;
          uint64_t v26 = v11;
          uint64_t v20 = _AXStringForArgs();

          if (os_log_type_enabled(v15, v16))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v33 = v20;
            _os_log_impl(&dword_0, v15, v16, "%{public}@", buf, 0xCu);
          }
        }
      }
      if ([(AXBluetoothDevicesController *)self bluetoothIsBusy])
      {
        BOOL v21 = [v11 identifier];
        id v22 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
        if ([v21 isEqualToString:v22])
        {
          unsigned __int8 v23 = [v11 connected];

          if ((v23 & 1) == 0)
          {
            if ([v11 paired]) {
              uint64_t v24 = 3;
            }
            else {
              uint64_t v24 = 1;
            }
            [v7 setDeviceState:v24];
            goto LABEL_18;
          }
        }
        else
        {
        }
      }
      objc_msgSend(v7, "setDeviceStatePaired:andConnected:", objc_msgSend(v11, "paired"), objc_msgSend(v11, "connected"));
    }
LABEL_18:
  }

  return v7;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  objc_msgSend(*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers], "objectAtIndex:", -[AXBluetoothDevicesController indexForIndexPath:](self, "indexForIndexPath:", a4));
  os_log_type_t v7 = (char *)objc_claimAutoreleasedReturnValue();
  id v5 = [objc_allocWithZone(*(Class *)&v7[OBJC_IVAR___PSSpecifier_detailControllerClass]) init];
  [(AXBluetoothDevicesController *)self setShowingSetupController:0];
  id v6 = [(AXBluetoothDevicesController *)self rootController];
  [v5 setRootController:v6];

  [v5 setParentController:self];
  [v5 setSpecifier:v7];
  [(AXBluetoothDevicesController *)self showController:v5 animate:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXBluetoothDevicesController *)self specifierAtIndex:[(AXBluetoothDevicesController *)self indexForIndexPath:v7]];
  unsigned __int8 v9 = [v8 userInfo];
  unsigned __int8 v10 = [v9 objectForKey:@"bt-device"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17.receiver = self;
    v17.super_class = (Class)AXBluetoothDevicesController;
    -[AXBluetoothDevicesController tableView:didSelectRowAtIndexPath:](&v17, "tableView:didSelectRowAtIndexPath:", v6, v7, v15.receiver, v15.super_class);
  }
  else if (v10)
  {
    if (![(AXBluetoothDevicesController *)self bluetoothIsBusy])
    {
      objc_storeStrong((id *)&self->_currentDeviceSpecifier, v8);
      [(AXBluetoothDevicesController *)self setBluetoothIsBusy:1];
      objc_msgSend(v10, "connectWithServices:", -[AXBluetoothDevicesController authorizedServices](self, "authorizedServices"));
      int v11 = [v10 identifier];
      id v12 = [(AXBluetoothDevicesController *)self indexOfSpecifierID:v11];

      if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v16.receiver = self;
        v16.super_class = (Class)AXBluetoothDevicesController;
        unsigned __int8 v13 = [(AXBluetoothDevicesController *)&v16 tableView:v6 cellForRowAtIndexPath:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v10 connected])
          {
            uint64_t v14 = 4;
          }
          else if ([v10 paired])
          {
            uint64_t v14 = 3;
          }
          else
          {
            uint64_t v14 = 1;
          }
          [v13 setDeviceState:v14];
        }
      }
    }
    [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] selectRowAtIndexPath:0 animated:1 scrollPosition:0];
  }
  else
  {
    -[AXBluetoothDevicesController tableView:didSelectRowAtIndexPath:](&v15, "tableView:didSelectRowAtIndexPath:", v6, v7, self, AXBluetoothDevicesController);
  }
}

- (void)showBluetoothPowerAlert:(BOOL)a3
{
  if (a3)
  {
    id v19 = +[VOSBluetoothManager sharedInstance];
    if (([v19 available] & 1) == 0)
    {
LABEL_5:

      return;
    }
    unsigned __int8 v4 = +[VOSBluetoothManager sharedInstance];
    if ([v4 enabled])
    {

      goto LABEL_5;
    }
    id v6 = [(AXBluetoothDevicesController *)self view];
    id v7 = [v6 window];
    unsigned int v8 = [v7 isKeyWindow];

    if (v8)
    {
      unsigned __int8 v9 = settingsLocString(@"BLUETOOTH_POWER_TITLE", @"VoiceOverBluetoothDevices");
      unsigned __int8 v10 = [(AXBluetoothDevicesController *)self bluetoothPowerAlertMessage];
      int v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];
      powerAlert = self->_powerAlert;
      self->_powerAlert = v11;

      unsigned __int8 v13 = settingsLocString(@"YES", @"VoiceOverBluetoothDevices");
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __56__AXBluetoothDevicesController_showBluetoothPowerAlert___block_invoke;
      v21[3] = &unk_208B68;
      v21[4] = self;
      uint64_t v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v21];

      [(UIAlertController *)self->_powerAlert addAction:v14];
      objc_super v15 = settingsLocString(@"NO", @"VoiceOverBluetoothDevices");
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __56__AXBluetoothDevicesController_showBluetoothPowerAlert___block_invoke_2;
      v20[3] = &unk_208B68;
      v20[4] = self;
      objc_super v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v20];

      [(UIAlertController *)self->_powerAlert addAction:v16];
      objc_super v17 = [(AXBluetoothDevicesController *)self window];
      id v18 = [v17 rootViewController];
      [v18 presentViewController:self->_powerAlert animated:1 completion:0];
    }
  }
  else
  {
    id v5 = self->_powerAlert;
    [(UIAlertController *)v5 dismissViewControllerAnimated:1 completion:0];
  }
}

void __56__AXBluetoothDevicesController_showBluetoothPowerAlert___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VOSBluetoothManager sharedInstance];
  [v2 setEnabled:1];

  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 1;
}

id __56__AXBluetoothDevicesController_showBluetoothPowerAlert___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) powerAlertCancelled];
}

- (void)willBecomeActive
{
}

- (void)willResignActive
{
}

- (void)setBluetoothIsBusy:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    id v7 = +[AXSubsystemBrailleHardware identifier];
    unsigned int v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      unsigned __int8 v10 = AXColorizeFormatLog();
      uint64_t v14 = +[NSNumber numberWithBool:v3];
      int v11 = _AXStringForArgs();

      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        objc_super v16 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (v3)
  {
    BOOL v12 = 1;
  }
  else
  {
    currentDeviceSpecifier = self->_currentDeviceSpecifier;
    self->_currentDeviceSpecifier = 0;

    BOOL v12 = 0;
  }
  self->_bluetoothIsBusy = v12;
}

- (void)alertSheetDismissed:(id)a3
{
  alert = self->_alert;
  self->_alert = 0;

  id v5 = [(AXBluetoothDevicesController *)self rootController];
  unsigned __int8 v6 = [v5 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(AXBluetoothDevicesController *)self rootController];
    unsigned int v8 = [v10 visibleViewController];
    os_log_type_t v9 = [v8 parentViewController];
    [v9 dismiss];
  }
}

- (void)_cleanupPairing
{
  [(VOSBluetoothSSPPairingRequest *)self->_sspAlert dismiss];
  sspAlert = self->_sspAlert;
  self->_sspAlert = 0;

  unsigned __int8 v4 = [(AXBluetoothDevicesController *)self rootController];
  id v5 = [v4 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(AXBluetoothDevicesController *)self rootController];
    id v7 = [v9 visibleViewController];
    unsigned int v8 = [v7 parentViewController];
    [v8 dismiss];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  if ([a3 state] == (char *)&dword_4 + 1
    && self->_power
    && *(void *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    unsigned __int8 v4 = +[NSMutableArray array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v5 = [(AXBluetoothDevicesController *)self centralManager];
    unsigned __int8 v6 = [v5 retrieveConnectedPeripheralsWithServices:0 allowAll:1];

    id v7 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          BOOL v12 = AXLogBrailleHW();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v40 = v11;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Retrieved periperal (all): %@", buf, 0xCu);
          }

          if ([(AXBluetoothDevicesController *)self peripheralMatchesUnadvertisedService:v11])
          {
            unsigned __int8 v13 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:v11];
            uint64_t v14 = [v11 identifier];
            objc_super v15 = [v14 UUIDString];
            [v4 addObject:v15];

            objc_super v16 = AXLogBrailleHW();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v40 = v13;
              _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Adding device: %@", buf, 0xCu);
            }

            if (v13) {
              [(AXBluetoothDevicesController *)self _addDevice:v13];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v8);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    objc_super v17 = [(AXBluetoothDevicesController *)self centralManager];
    id v18 = [(AXBluetoothDevicesController *)self allowedServices];
    id v19 = [v17 retrieveConnectedPeripheralsWithServices:v18 allowAll:0];

    id v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          uint64_t v25 = AXLogBrailleHW();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v40 = v24;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Retrieved periperal (some): %@", buf, 0xCu);
          }

          uint64_t v26 = [v24 identifier];
          uint64_t v27 = [v26 UUIDString];
          unsigned __int8 v28 = [v4 containsObject:v27];

          if ((v28 & 1) == 0)
          {
            uint64_t v29 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:v24];
            if (v29) {
              [(AXBluetoothDevicesController *)self _addDevice:v29];
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v21);
    }

    [(AXBluetoothDevicesController *)self _setupCentralScanning:1];
  }
}

- (BOOL)peripheralMatchesUnadvertisedService:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 name];
  if ([v4 hasPrefix:@"DotPad"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v6 = [v3 name];
    unsigned __int8 v5 = [v6 hasPrefix:@"DotPocket"];
  }
  return v5;
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8 = a4;
  [a5 objectForKeyedSubscript:CBAdvertisementDataServiceUUIDsKey];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      unsigned __int8 v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v13);
        objc_super v15 = [(AXBluetoothDevicesController *)self allowedServices];
        LOBYTE(v14) = [v15 containsObject:v14];

        if (v14)
        {

          BOOL v16 = 1;
          goto LABEL_11;
        }
        unsigned __int8 v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = [(AXBluetoothDevicesController *)self peripheralMatchesUnadvertisedService:v8];
LABEL_11:
  objc_super v17 = AXLogBrailleHW();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = +[NSNumber numberWithBool:v16];
    *(_DWORD *)buf = 138412546;
    id v33 = v8;
    __int16 v34 = 2112;
    long long v35 = v18;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Discovered periperal: %@, allowed %@", buf, 0x16u);
  }
  if (v16)
  {
    id v19 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:v8];
    if (v19)
    {
      id v20 = AXLogBrailleHW();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        devicesDict = self->_devicesDict;
        uint64_t v22 = [v19 identifier];
        unsigned __int8 v23 = [(NSMutableDictionary *)devicesDict objectForKey:v22];
        *(_DWORD *)buf = 138412546;
        id v33 = v19;
        __int16 v34 = 2112;
        long long v35 = v23;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Adding device: %@ in cache? %@", buf, 0x16u);
      }
      uint64_t v24 = self->_devicesDict;
      uint64_t v25 = [v19 identifier];
      uint64_t v26 = [(NSMutableDictionary *)v24 objectForKey:v25];

      if (v26)
      {
        [(AXBluetoothDevicesController *)self _updateDevicePosition:v19];
        uint64_t v27 = [v19 identifier];
        [(AXBluetoothDevicesController *)self reloadSpecifierID:v27 animated:0];
      }
      else
      {
        [(AXBluetoothDevicesController *)self _addDevice:v19];
      }
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:v7];
  id v10 = AXLogBrailleHW();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[AXBluetoothDevicesController centralManager:didFailToConnectPeripheral:error:]();
  }

  if (v9)
  {
    id v11 = [v9 identifier];
    uint64_t v12 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
    unsigned int v13 = [v11 isEqualToString:v12];

    if (v13) {
      [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
    }
    uint64_t v14 = [v9 identifier];
    [(AXBluetoothDevicesController *)self reloadSpecifierID:v14];
  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  unsigned __int8 v5 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:a4];
  if (v5)
  {
    id v10 = v5;
    if ([v5 connected])
    {
      [(AXBluetoothDevicesController *)self deviceConnected:v10];
    }
    else
    {
      unsigned __int8 v6 = [v10 identifier];
      id v7 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
      unsigned int v8 = [v6 isEqualToString:v7];

      if (v8) {
        [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
      }
    }
    [(AXBluetoothDevicesController *)self _updateDevicePosition:v10];
    id v9 = [v10 identifier];
    [(AXBluetoothDevicesController *)self reloadSpecifierID:v9];

    unsigned __int8 v5 = v10;
  }
}

- (void)_peripheralDidCompletePairing:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Completed pairing to %@", (uint8_t *)&v10, 0xCu);
  }

  unsigned __int8 v6 = [v4 identifier];
  id v7 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8) {
    [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
  }
  [(AXBluetoothDevicesController *)self _updateDevicePosition:v4];
  id v9 = [v4 identifier];
  [(AXBluetoothDevicesController *)self reloadSpecifierID:v9];
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  uint64_t v5 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:a4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v8 = v5;
    [(AXBluetoothDevicesController *)self _peripheralDidCompletePairing:v5];
    id v7 = +[VOSBluetoothManager sharedInstance];
    [v7 postNotificationName:VOSBluetoothDeviceConnectSuccessNotification object:v8];

    uint64_t v6 = v8;
  }

  _objc_release_x1(v5, v6);
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v13 = a4;
  uint64_t v6 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:v13];
  if ([v13 state])
  {
    id v7 = [(AXBluetoothDevicesController *)self centralManager];
    [v7 cancelPeripheralConnection:v13];
  }
  if (v6)
  {
    uint64_t v8 = [v6 identifier];
    id v9 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
    unsigned int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      id v11 = (VoiceOverBluetoothAlert *)[objc_allocWithZone((Class)VoiceOverBluetoothAlert) initWithDevice:v6];
      alert = self->_alert;
      self->_alert = v11;

      [(VoiceOverBluetoothAlert *)self->_alert setDelegate:self];
      [(VoiceOverBluetoothAlert *)self->_alert showAlertWithResult:&off_229AB0];
    }
    [(AXBluetoothDevicesController *)self _peripheralDidCompletePairing:v6];
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  uint64_t v5 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:a4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v9 = (void *)v5;
    [(AXBluetoothDevicesController *)self _updateDevicePosition:v5];
    id v7 = [v9 identifier];
    [(AXBluetoothDevicesController *)self reloadSpecifierID:v7];

    uint64_t v8 = +[VOSBluetoothManager sharedInstance];
    [v8 postNotificationName:VOSBluetoothDeviceDisconnectSuccessNotification object:v9];

    uint64_t v6 = (uint64_t)v9;
  }

  _objc_release_x1(v5, v6);
}

- (void)peripheralDidUpdateName:(id)a3
{
  id v4 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:a3];
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = [v4 identifier];
    uint64_t v6 = [(AXBluetoothDevicesController *)self specifierForID:v5];

    id v7 = [v9 name];
    [v6 setName:v7];

    uint64_t v8 = [v9 name];
    [v6 setProperty:v8 forKey:PSTitleKey];

    [(AXBluetoothDevicesController *)self _updateDevicePosition:v9];
    id v4 = v9;
  }
}

- (void)peripheralConnectionTimeout:(id)a3
{
  id v10 = [a3 userInfo];
  id v4 = [v10 identifier];
  uint64_t v5 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    if (([v10 connected] & 1) == 0)
    {
      id v7 = (VoiceOverBluetoothAlert *)[objc_allocWithZone((Class)VoiceOverBluetoothAlert) initWithDevice:v10];
      alert = self->_alert;
      self->_alert = v7;

      [(VoiceOverBluetoothAlert *)self->_alert setDelegate:self];
      [(VoiceOverBluetoothAlert *)self->_alert showAlertWithResult:&off_229AC8];
      [v10 disconnect];
    }
    [(AXBluetoothDevicesController *)self setBluetoothIsBusy:0];
    id v9 = [v10 identifier];
    [(AXBluetoothDevicesController *)self reloadSpecifierID:v9];
  }
}

- (id)getDeviceForPeripheral:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  unsigned int v6 = [v5 UUIDString];

  id v7 = [(NSMutableDictionary *)self->_devicesDict objectForKey:v6];
  uint64_t v8 = AXLogBrailleHW();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Get device: %@", (uint8_t *)&v14, 0xCu);
  }

  if (!v7)
  {
    id v9 = [v4 name];
    if ([v9 length])
    {
      unsigned int v10 = [v4 visibleInSettings];

      if (v10)
      {
        id v11 = objc_alloc((Class)AXUIBluetoothDevice);
        uint64_t v12 = +[VOSBluetoothManager sharedInstance];
        id v7 = [v11 initWithPeripheral:v4 helper:v12];

        [v4 setDelegate:self];
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v7 = 0;
  }
LABEL_9:

  return v7;
}

- (void)_setupCentralScanning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AXBluetoothDevicesController *)self centralManager];
  unsigned int v6 = (char *)[v5 state];

  if (v6 == (unsigned char *)&dword_4 + 1)
  {
    id v7 = [(AXBluetoothDevicesController *)self centralManager];
    id v8 = v7;
    if (v3) {
      [v7 scanForPeripheralsWithServices:0 options:0];
    }
    else {
      [v7 stopScan];
    }
  }
}

- (void)showPairingAlertForPairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v11;
    uint64_t v14 = [(AXBluetoothDevicesController *)self getDeviceForPeripheral:v13];
    id v15 = (void *)v14;
    if (v14)
    {
      BOOL v16 = a5 == 4 || a5 == 1;
      if (a5 == 1 || a5 == 4 || !a5)
      {
        uint64_t v24 = (void *)v14;
        objc_initWeak(location, self);
        id v23 = objc_allocWithZone((Class)VOSBluetoothSSPPairingRequest);
        currentDeviceSpecifier = self->_currentDeviceSpecifier;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = __99__AXBluetoothDevicesController_showPairingAlertForPairingAgent_peerDidRequestPairing_type_passkey___block_invoke;
        v29[3] = &unk_20ACF8;
        BOOL v34 = v16;
        id v30 = v10;
        id v31 = v13;
        v33[1] = (id)a5;
        id v19 = v12;
        id v32 = v19;
        BOOL v35 = a5 == 0;
        objc_copyWeak(v33, location);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = __99__AXBluetoothDevicesController_showPairingAlertForPairingAgent_peerDidRequestPairing_type_passkey___block_invoke_3;
        v25[3] = &unk_20AD20;
        id v26 = v30;
        id v27 = v31;
        v28[1] = (id)a5;
        objc_copyWeak(v28, location);
        id v15 = v24;
        id v20 = (VOSBluetoothSSPPairingRequest *)[v23 initWithDevice:v24 andSpecifier:currentDeviceSpecifier acceptPairingBlock:v29 cancelPairingBlock:v25];
        sspAlert = self->_sspAlert;
        self->_sspAlert = v20;

        [(VOSBluetoothSSPPairingRequest *)self->_sspAlert setPairingStyle:a5 == 0 andPasskey:v19];
        [(VOSBluetoothSSPPairingRequest *)self->_sspAlert showWithViewController:self];
        objc_destroyWeak(v28);

        objc_destroyWeak(v33);
        objc_destroyWeak(location);
      }
      else
      {
        [v10 respondToPairingRequest:v13 type:a5 accept:0 data:0];
        objc_super v17 = [(AXBluetoothDevicesController *)self centralManager];
        [v17 cancelPeripheralConnection:v13];

        id v18 = self->_sspAlert;
        self->_sspAlert = 0;
      }
    }
  }
}

void __99__AXBluetoothDevicesController_showPairingAlertForPairingAgent_peerDidRequestPairing_type_passkey___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v8 = CBPairingAgentPairingDataPasskeyKey;
    uint64_t v9 = v5;
    unsigned int v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v2 respondToPairingRequest:v3 type:v4 accept:1 data:v6];
  }
  else if (*(unsigned char *)(a1 + 73))
  {
    [*(id *)(a1 + 32) respondToPairingRequest:*(void *)(a1 + 40) type:*(void *)(a1 + 64) accept:1 data:0];
  }
  objc_copyWeak(&v7, (id *)(a1 + 56));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v7);
}

void __99__AXBluetoothDevicesController_showPairingAlertForPairingAgent_peerDidRequestPairing_type_passkey___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupPairing];
}

void __99__AXBluetoothDevicesController_showPairingAlertForPairingAgent_peerDidRequestPairing_type_passkey___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) respondToPairingRequest:*(void *)(a1 + 40) type:*(void *)(a1 + 56) accept:0 data:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained centralManager];
  [v3 cancelPeripheralConnection:*(void *)(a1 + 40)];

  objc_copyWeak(&v4, (id *)(a1 + 48));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v4);
}

void __99__AXBluetoothDevicesController_showPairingAlertForPairingAgent_peerDidRequestPairing_type_passkey___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupPairing];
}

- (BOOL)scanningEnabled
{
  return self->_scanningEnabled;
}

- (BOOL)bluetoothIsBusy
{
  return self->_bluetoothIsBusy;
}

- (PSSpecifier)currentSpecifier
{
  return self->_currentDeviceSpecifier;
}

- (NSArray)mainSpecifiersGroup
{
  return &self->_mainSpecifiersGroup->super;
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
  objc_storeStrong((id *)&self->_powerAlert, 0);
  objc_storeStrong((id *)&self->_sspAlert, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_currentDeviceSpecifier, 0);
  objc_storeStrong((id *)&self->_pairingPINDict, 0);
  objc_storeStrong((id *)&self->_devicesDict, 0);
  objc_storeStrong((id *)&self->_deviceSpecifiersGroup, 0);

  objc_storeStrong((id *)&self->_mainSpecifiersGroup, 0);
}

- (void)_updateDevicePosition:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "device spec: %@ %@", v1, 0x16u);
}

- (void)centralManager:didFailToConnectPeripheral:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Failed to connected: %@, error %@", v1, 0x16u);
}

@end
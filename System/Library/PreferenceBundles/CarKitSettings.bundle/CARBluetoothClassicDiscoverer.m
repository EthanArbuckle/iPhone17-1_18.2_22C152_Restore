@interface CARBluetoothClassicDiscoverer
+ (id)_sanitizeName:(id)a3;
- (BOOL)_supportsCarPlay:(id)a3;
- (BOOL)discoveryEnabled;
- (BOOL)isCarPlaySetupEnabled;
- (BOOL)isPairing;
- (BOOL)pairBluetoothDevice:(id)a3;
- (CARBluetoothClassicDiscoverer)init;
- (CARBluetoothClassicDiscovery)bluetoothDiscoveryDelegate;
- (CARBluetoothPairingPrompt)outstandingPairingPrompt;
- (CARBluetoothSyncContactsPrompt)outstandingContactsPrompt;
- (NSMutableDictionary)deviceForAddress;
- (NSSet)discoveredBluetoothDevices;
- (id)_presentingViewController;
- (id)_vehicleDeviceFromBluetoothDevice:(id)a3;
- (void)_allowBluetoothConnections:(BOOL)a3;
- (void)_handleRemovedDevice:(id)a3;
- (void)_handleUpdatedDevice:(id)a3;
- (void)_presentPairingFailedForDevice:(id)a3 error:(int)a4;
- (void)_saveVehicleForDevice:(id)a3;
- (void)_shouldListenToBluetoothNotifications:(BOOL)a3;
- (void)dealloc;
- (void)deviceAuthenticationRequestHandler:(id)a3;
- (void)deviceConnectedHandler:(id)a3;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)deviceDiscoveredHandler:(id)a3;
- (void)devicePairingFailureHandler:(id)a3;
- (void)devicePairingSuccessHandler:(id)a3;
- (void)deviceRemovedHandler:(id)a3;
- (void)deviceUnpairedHandler:(id)a3;
- (void)deviceUpdatedHandler:(id)a3;
- (void)handleChangedDiscoveryState:(BOOL)a3;
- (void)handleDiscoveredVehicle:(id)a3;
- (void)handlePowerChangedNotification:(id)a3;
- (void)handleRemovedVehicle:(id)a3;
- (void)handleUpdatedVehicle:(id)a3;
- (void)pauseDiscovery;
- (void)pauseDiscoveryForApplicationNotification:(id)a3;
- (void)restartDiscoveryForApplicationNotification:(id)a3;
- (void)setBluetoothDiscoveryDelegate:(id)a3;
- (void)setDeviceForAddress:(id)a3;
- (void)setDiscoveryEnabled:(BOOL)a3;
- (void)setOutstandingContactsPrompt:(id)a3;
- (void)setOutstandingPairingPrompt:(id)a3;
- (void)setPairing:(BOOL)a3;
- (void)startDiscovery;
- (void)stopDiscovery;
@end

@implementation CARBluetoothClassicDiscoverer

+ (id)_sanitizeName:(id)a3
{
  id v3 = a3;
  v4 = +[NSScanner scannerWithString:v3];
  v5 = +[NSCharacterSet illegalCharacterSet];
  [v4 setCharactersToBeSkipped:v5];

  v6 = +[NSMutableString string];
  id v7 = +[NSMutableString string];
  while (1)
  {
    v8 = v7;
    v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v16 = v7;
    unsigned int v10 = [v4 scanUpToCharactersFromSet:v9 intoString:&v16];
    id v7 = v16;

    if (!v10) {
      break;
    }
    [v6 appendString:v7];
    v11 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    unsigned int v12 = [v4 scanCharactersFromSet:v11 intoString:0];

    if (v12) {
      [v6 appendString:@" "];
    }
  }
  if ((unint64_t)[v6 length] < 0x33)
  {
    id v13 = v6;
  }
  else
  {
    id v13 = [v6 substringToIndex:50];
  }
  v14 = v13;

  return v14;
}

- (CARBluetoothClassicDiscoverer)init
{
  v10.receiver = self;
  v10.super_class = (Class)CARBluetoothClassicDiscoverer;
  v2 = [(CARBluetoothClassicDiscoverer *)&v10 init];
  if (v2)
  {
    id v3 = +[NSMutableDictionary dictionary];
    [(CARBluetoothClassicDiscoverer *)v2 setDeviceForAddress:v3];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"restartDiscoveryForApplicationNotification:" name:UIApplicationDidBecomeActiveNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"pauseDiscoveryForApplicationNotification:" name:UIApplicationWillResignActiveNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"pauseDiscoveryForApplicationNotification:" name:UIApplicationWillTerminateNotification object:0];

    [(CARBluetoothClassicDiscoverer *)v2 _shouldListenToBluetoothNotifications:1];
    id v7 = objc_alloc_init((Class)CRCarPlayPreferences);
    v8 = [v7 isCarPlaySetupEnabled];
    v2->_carPlaySetupEnabled = [v8 BOOLValue];

    v2->_pairing = 0;
  }
  return v2;
}

- (void)_shouldListenToBluetoothNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  v6 = v5;
  if (v3)
  {
    [v5 addObserver:self selector:"handlePowerChangedNotification:" name:BluetoothAvailabilityChangedNotification object:0];

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"handlePowerChangedNotification:" name:BluetoothPowerChangedNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"deviceDiscoveredHandler:" name:BluetoothDeviceDiscoveredNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"deviceUpdatedHandler:" name:BluetoothDeviceUpdatedNotification object:0];

    objc_super v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"deviceRemovedHandler:" name:BluetoothDeviceRemovedNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"deviceUnpairedHandler:" name:BluetoothDeviceUnpairedNotification object:0];

    unsigned int v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:self selector:"deviceConnectedHandler:" name:BluetoothDeviceConnectSuccessNotification object:0];

    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"deviceConnectedHandler:" name:BluetoothDeviceConnectFailedNotification object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"deviceDisconnectedHandler:" name:BluetoothDeviceDisconnectSuccessNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:self selector:"devicePairingFailureHandler:" name:BluetoothPairingPINResultFailedNotification object:0];

    id v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:self selector:"devicePairingSuccessHandler:" name:BluetoothPairingPINResultSuccessNotification object:0];

    id v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:self selector:"deviceAuthenticationRequestHandler:" name:BluetoothPairingUserNumericComparisionNotification object:0];
  }
  else
  {
    [v5 removeObserver:self name:BluetoothAvailabilityChangedNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 removeObserver:self name:BluetoothPowerChangedNotification object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 removeObserver:self name:BluetoothDeviceDiscoveredNotification object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 removeObserver:self name:BluetoothDeviceUpdatedNotification object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 removeObserver:self name:BluetoothDeviceRemovedNotification object:0];

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 removeObserver:self name:BluetoothDeviceUnpairedNotification object:0];

    v22 = +[NSNotificationCenter defaultCenter];
    [v22 removeObserver:self name:BluetoothDeviceConnectSuccessNotification object:0];

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 removeObserver:self name:BluetoothDeviceConnectFailedNotification object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 removeObserver:self name:BluetoothDeviceDisconnectSuccessNotification object:0];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 removeObserver:self name:BluetoothPairingPINResultFailedNotification object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 removeObserver:self name:BluetoothPairingPINResultSuccessNotification object:0];

    id v27 = +[NSNotificationCenter defaultCenter];
    [v27 removeObserver:self name:BluetoothPairingUserNumericComparisionNotification object:0];
  }
}

- (void)dealloc
{
  [(CARBluetoothClassicDiscoverer *)self stopDiscovery];
  v3.receiver = self;
  v3.super_class = (Class)CARBluetoothClassicDiscoverer;
  [(CARBluetoothClassicDiscoverer *)&v3 dealloc];
}

- (void)_allowBluetoothConnections:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3
    || (+[UIApplication sharedApplication],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 applicationState],
        v5,
        !v6))
  {
    id v7 = +[BluetoothManager sharedInstance];
    [v7 setDiscoverable:v3];

    v8 = +[BluetoothManager sharedInstance];
    [v8 setConnectable:v3];

    v9 = +[BluetoothManager sharedInstance];
    [v9 setDeviceScanningEnabled:v3];

    objc_super v10 = +[BluetoothManager sharedInstance];
    [v10 setDevicePairingEnabled:v3];

    if (!v3)
    {
      v11 = +[BluetoothManager sharedInstance];
      [v11 resetDeviceScanning];
    }
  }

  [(CARBluetoothClassicDiscoverer *)self handleChangedDiscoveryState:v3];
}

- (void)startDiscovery
{
  [(CARBluetoothClassicDiscoverer *)self _shouldListenToBluetoothNotifications:1];
  [(CARBluetoothClassicDiscoverer *)self setDiscoveryEnabled:1];

  [(CARBluetoothClassicDiscoverer *)self _allowBluetoothConnections:1];
}

- (void)pauseDiscovery
{
}

- (void)stopDiscovery
{
  [(CARBluetoothClassicDiscoverer *)self setDiscoveryEnabled:0];
  [(CARBluetoothClassicDiscoverer *)self _allowBluetoothConnections:0];

  [(CARBluetoothClassicDiscoverer *)self _shouldListenToBluetoothNotifications:0];
}

- (void)restartDiscoveryForApplicationNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E538;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)pauseDiscoveryForApplicationNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E5F8;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handlePowerChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E674;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleChangedDiscoveryState:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
    [v7 bluetoothDiscoverer:self changedDiscoveryState:v3];
  }
}

- (void)handleDiscoveredVehicle:(id)a3
{
  id v7 = a3;
  v4 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
    [v6 bluetoothDiscoverer:self didDiscoverDevice:v7];
  }
}

- (void)handleUpdatedVehicle:(id)a3
{
  id v7 = a3;
  v4 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
    [v6 bluetoothDiscoverer:self didUpdateDevice:v7];
  }
}

- (void)handleRemovedVehicle:(id)a3
{
  id v7 = a3;
  v4 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
    [v6 bluetoothDiscoverer:self didRemoveDevice:v7];
  }
}

- (NSSet)discoveredBluetoothDevices
{
  v2 = [(CARBluetoothClassicDiscoverer *)self deviceForAddress];
  BOOL v3 = [v2 allValues];
  v4 = +[NSSet setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)_supportsCarPlay:(id)a3
{
  return [a3 isServiceSupported:0x40000];
}

- (id)_vehicleDeviceFromBluetoothDevice:(id)a3
{
  id v4 = a3;
  char v5 = [v4 address];
  if ([(CARBluetoothClassicDiscoverer *)self _supportsCarPlay:v4])
  {
    char v6 = [(CARBluetoothClassicDiscoverer *)self deviceForAddress];
    id v7 = [v6 objectForKey:v5];

    if (!v7)
    {
      id v7 = objc_alloc_init(CARBluetoothClassicDevice);
      v8 = [v4 address];
      [(CARBluetoothClassicDevice *)v7 setBluetoothAddress:v8];

      v9 = [(CARBluetoothClassicDiscoverer *)self deviceForAddress];
      [v9 setObject:v7 forKey:v5];
    }
    objc_super v10 = [v4 name];
    [(CARBluetoothClassicDevice *)v7 setName:v10];

    -[CARBluetoothClassicDevice setPaired:](v7, "setPaired:", [v4 paired]);
    if ([v4 connected]) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 1;
    }
    [(CARBluetoothClassicDevice *)v7 setConnectionStatus:v11];
    [(CARBluetoothClassicDevice *)v7 setBtDevice:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setPairing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_pairing = a3;
  id v4 = CarPairingLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v6 = 138543362;
    CFStringRef v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "is pairing: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)pairBluetoothDevice:(id)a3
{
  id v4 = a3;
  if ([(CARBluetoothClassicDiscoverer *)self isCarPlaySetupEnabled])
  {
    CFStringRef v5 = [v4 bluetoothAddress];
    int v6 = CarPairingLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558275;
      uint64_t v15 = 1752392040;
      __int16 v16 = 2113;
      v17 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "starting pairing for  %{private, mask.hash}@", buf, 0x16u);
    }

    [(CARBluetoothClassicDiscoverer *)self setPairing:1];
    [(CARBluetoothClassicDiscoverer *)self pauseDiscovery];
    unsigned int v12 = v5;
    id v13 = v4;
    id v7 = v5;
    CRStartBluetoothClassicPairing();

    BOOL v8 = 0;
  }
  else
  {
    v9 = [v4 btDevice];
    objc_super v10 = v9;
    BOOL v8 = v9 != 0;
    if (v9) {
      [v9 connect];
    }
  }
  [v4 setConnectionStatus:2];
  [(CARBluetoothClassicDiscoverer *)self handleUpdatedVehicle:v4];

  return v8;
}

- (void)deviceDiscoveredHandler:(id)a3
{
  id v4 = [a3 object];
  CFStringRef v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 address];
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "discovered %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(CARBluetoothClassicDiscoverer *)self _vehicleDeviceFromBluetoothDevice:v4];
  if (v7) {
    [(CARBluetoothClassicDiscoverer *)self handleDiscoveredVehicle:v7];
  }
}

- (void)_handleUpdatedDevice:(id)a3
{
  uint64_t v4 = [(CARBluetoothClassicDiscoverer *)self _vehicleDeviceFromBluetoothDevice:a3];
  if (v4) {
    [(CARBluetoothClassicDiscoverer *)self handleUpdatedVehicle:v4];
  }

  _objc_release_x1();
}

- (void)_handleRemovedDevice:(id)a3
{
  id v7 = a3;
  uint64_t v4 = -[CARBluetoothClassicDiscoverer _vehicleDeviceFromBluetoothDevice:](self, "_vehicleDeviceFromBluetoothDevice:");
  if (v4)
  {
    [(CARBluetoothClassicDiscoverer *)self handleRemovedVehicle:v4];
    CFStringRef v5 = [(CARBluetoothClassicDiscoverer *)self deviceForAddress];
    int v6 = [v7 address];
    [v5 removeObjectForKey:v6];
  }
}

- (void)deviceUpdatedHandler:(id)a3
{
  uint64_t v4 = [a3 object];
  CFStringRef v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 address];
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "updated %@", (uint8_t *)&v7, 0xCu);
  }
  [(CARBluetoothClassicDiscoverer *)self _handleUpdatedDevice:v4];
}

- (void)devicePairingFailureHandler:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 object];
  int v6 = [v4 userInfo];
  int v7 = [v6 objectForKey:BluetoothErrorKey];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v8 = [v7 intValue];
  }
  else {
    id v8 = 0;
  }
  v9 = CarGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_14DA4((uint64_t)v4, v9);
  }

  [(CARBluetoothClassicDiscoverer *)self _presentPairingFailedForDevice:v5 error:v8];
  [(CARBluetoothClassicDiscoverer *)self _handleUpdatedDevice:v5];
}

- (void)devicePairingSuccessHandler:(id)a3
{
  id v4 = a3;
  if ([(CARBluetoothClassicDiscoverer *)self isCarPlaySetupEnabled])
  {
    CFStringRef v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_14E1C(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    CFStringRef v5 = [v4 object];
    id v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v5 address];
      int v15 = 138412290;
      __int16 v16 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "paired %@", (uint8_t *)&v15, 0xCu);
    }
    [(CARBluetoothClassicDiscoverer *)self setPairing:0];
    [(CARBluetoothClassicDiscoverer *)self _saveVehicleForDevice:v5];
    [(CARBluetoothClassicDiscoverer *)self _handleUpdatedDevice:v5];
  }
}

- (void)deviceRemovedHandler:(id)a3
{
  id v4 = [a3 object];
  CFStringRef v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 address];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "removed %@", (uint8_t *)&v7, 0xCu);
  }
  [(CARBluetoothClassicDiscoverer *)self _handleUpdatedDevice:v4];
}

- (void)deviceUnpairedHandler:(id)a3
{
  id v4 = [a3 object];
  CFStringRef v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 address];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "unpaired %@", (uint8_t *)&v7, 0xCu);
  }
  [(CARBluetoothClassicDiscoverer *)self _handleUpdatedDevice:v4];
}

- (void)deviceConnectedHandler:(id)a3
{
  id v4 = [a3 object];
  CFStringRef v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 address];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "connected %@", (uint8_t *)&v7, 0xCu);
  }
  [(CARBluetoothClassicDiscoverer *)self _handleUpdatedDevice:v4];
}

- (void)deviceDisconnectedHandler:(id)a3
{
  id v4 = [a3 object];
  CFStringRef v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 address];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "disconnected %@", (uint8_t *)&v7, 0xCu);
  }
  [(CARBluetoothClassicDiscoverer *)self _handleUpdatedDevice:v4];
}

- (void)deviceAuthenticationRequestHandler:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    int v7 = [v4 object];
    *(_DWORD *)buf = 138412546;
    v28 = v6;
    __int16 v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "deviceAuthenticationRequestHandler received %@ for %@", buf, 0x16u);
  }
  uint64_t v8 = [v4 name];
  unsigned int v9 = [v8 isEqualToString:BluetoothPairingUserNumericComparisionNotification];

  if (v9)
  {
    uint64_t v10 = [v4 object];
    uint64_t v11 = [v10 valueForKey:@"device"];

    uint64_t v12 = [v4 object];
    id v13 = [v12 valueForKey:@"value"];

    v14 = [v11 address];
    int v15 = objc_opt_class();
    __int16 v16 = [v11 name];
    v17 = [v15 _sanitizeName:v16];

    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%06u", [v13 unsignedIntValue]);
    if ([(CARBluetoothClassicDiscoverer *)self isCarPlaySetupEnabled])
    {
      if ([(CARBluetoothClassicDiscoverer *)self isPairing])
      {
        v19 = CarPairingLogging();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "not handling authentication request, already pairing using CarPlay Setup", buf, 2u);
        }
      }
      else
      {
        v25[1] = _NSConcreteStackBlock;
        v25[2] = (id)3221225472;
        v25[3] = sub_FC70;
        v25[4] = &unk_24C10;
        v25[5] = self;
        id v26 = v14;
        CRConfirmAndContinueBluetoothClassicPairing();
      }
    }
    else
    {
      [(CARBluetoothClassicDiscoverer *)self setPairing:1];
      v20 = [[CARBluetoothPairingPrompt alloc] initWithPairingStyle:0 deviceName:v17 passKey:v18];
      [(CARBluetoothClassicDiscoverer *)self setOutstandingPairingPrompt:v20];
      objc_initWeak((id *)buf, self);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_FE64;
      v22[3] = &unk_24C60;
      objc_copyWeak(v25, (id *)buf);
      v23 = v11;
      v24 = self;
      [(CARBluetoothPairingPrompt *)v20 setConfirmationCompletion:v22];
      v21 = [(CARBluetoothClassicDiscoverer *)self _presentingViewController];
      [(CARBluetoothPairingPrompt *)v20 presentFromViewController:v21];

      objc_destroyWeak(v25);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    uint64_t v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_14E54(v4, v11);
    }
  }
}

- (void)_presentPairingFailedForDevice:(id)a3 error:(int)a4
{
  id v5 = a3;
  if ([(CARBluetoothClassicDiscoverer *)self isCarPlaySetupEnabled])
  {
    uint64_t v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_14EF0(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    if ([(CARBluetoothClassicDiscoverer *)self isPairing])
    {
      v14 = [v5 address];
      int v15 = objc_opt_class();
      __int16 v16 = [v5 name];
      v17 = [v15 _sanitizeName:v16];

      v18 = [(CARBluetoothClassicDiscoverer *)self _presentingViewController];
      if (v18)
      {
        v19 = [(CARBluetoothClassicDiscoverer *)self outstandingPairingPrompt];

        if (v19
          || ([(CARBluetoothClassicDiscoverer *)self outstandingContactsPrompt],
              v20 = objc_claimAutoreleasedReturnValue(),
              v20,
              v20))
        {
          [v18 dismissViewControllerAnimated:1 completion:0];
        }
        +[CARBluetoothPairingFailedPrompt presentPairingFailure:v19 != 0 forDeviceName:v17 fromViewController:v18 completion:0];
      }
      [(CARBluetoothClassicDiscoverer *)self setOutstandingPairingPrompt:0];
      [(CARBluetoothClassicDiscoverer *)self setOutstandingContactsPrompt:0];
    }
    [(CARBluetoothClassicDiscoverer *)self setPairing:0];
  }
}

- (void)_saveVehicleForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 address];
  id v5 = objc_opt_class();
  uint64_t v6 = [v3 name];

  uint64_t v7 = [v5 _sanitizeName:v6];

  uint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "telling carkitd to handle the pairing for \"%@\" (%@)", (uint8_t *)&v9, 0x16u);
  }

  CRHandleBluetoothClassicPairingCompleted();
}

- (id)_presentingViewController
{
  id v3 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CARBluetoothClassicDiscoverer *)self bluetoothDiscoveryDelegate];
    uint64_t v6 = [v5 viewControllerPresentingPairingForBluetoothDiscoverer:self];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (CARBluetoothClassicDiscovery)bluetoothDiscoveryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothDiscoveryDelegate);

  return (CARBluetoothClassicDiscovery *)WeakRetained;
}

- (void)setBluetoothDiscoveryDelegate:(id)a3
{
}

- (BOOL)isCarPlaySetupEnabled
{
  return self->_carPlaySetupEnabled;
}

- (BOOL)discoveryEnabled
{
  return self->_discoveryEnabled;
}

- (void)setDiscoveryEnabled:(BOOL)a3
{
  self->_discoveryEnabled = a3;
}

- (NSMutableDictionary)deviceForAddress
{
  return self->_deviceForAddress;
}

- (void)setDeviceForAddress:(id)a3
{
}

- (CARBluetoothPairingPrompt)outstandingPairingPrompt
{
  return self->_outstandingPairingPrompt;
}

- (void)setOutstandingPairingPrompt:(id)a3
{
}

- (CARBluetoothSyncContactsPrompt)outstandingContactsPrompt
{
  return self->_outstandingContactsPrompt;
}

- (void)setOutstandingContactsPrompt:(id)a3
{
}

- (BOOL)isPairing
{
  return self->_pairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingContactsPrompt, 0);
  objc_storeStrong((id *)&self->_outstandingPairingPrompt, 0);
  objc_storeStrong((id *)&self->_deviceForAddress, 0);

  objc_destroyWeak((id *)&self->_bluetoothDiscoveryDelegate);
}

@end
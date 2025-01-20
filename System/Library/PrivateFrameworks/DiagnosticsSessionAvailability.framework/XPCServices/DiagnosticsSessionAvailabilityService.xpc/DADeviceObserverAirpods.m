@interface DADeviceObserverAirpods
+ (id)primarySerialNumberForAirpodsDevice:(id)a3;
- (BOOL)_isBeatsDevice:(id)a3;
- (BOOL)_isBluetoothDeviceServicableAirpods:(id)a3;
- (BOOL)initialDevicesFetched;
- (BOOL)useSupportedDeviceAllowList;
- (BluetoothManager)btManager;
- (DADeviceObserverAirpods)init;
- (NSMutableDictionary)handlers;
- (NSMutableSet)devices;
- (NSSet)supportedDeviceAllowList;
- (OS_dispatch_queue)airpodsRegistrationQueue;
- (OS_dispatch_semaphore)btManagerAvailableSemaphore;
- (id)_airpodsDeviceFromDevice:(id)a3;
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)_addAirpodsDevice:(id)a3;
- (void)_beginObserving;
- (void)_bluetoothPairingStatusChanged:(id)a3;
- (void)_btManagerAvailable;
- (void)_endObserving;
- (void)_ensureInitialDevicesFetched;
- (void)_forceDiscoverAllDevices;
- (void)_purgeUnpairedDevices;
- (void)_updateHandlers;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
- (void)endDiscoveringDevicesWithIdentifier:(id)a3;
- (void)setAirpodsRegistrationQueue:(id)a3;
- (void)setBtManager:(id)a3;
- (void)setBtManagerAvailableSemaphore:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setInitialDevicesFetched:(BOOL)a3;
- (void)setUseSupportedDeviceAllowList:(BOOL)a3;
@end

@implementation DADeviceObserverAirpods

+ (id)primarySerialNumberForAirpodsDevice:(id)a3
{
  id v3 = a3;
  v4 = [v3 accessoryInfo];
  v5 = [v4 objectForKeyedSubscript:@"AACPVersionInfo"];

  v6 = [v5 objectAtIndexedSubscript:3];
  v7 = v6;
  if (!v6 || ![v6 length] || objc_msgSend(v7, "isEqualToString:", @"?"))
  {
    v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Case serial number is missing for airpods device. Falling back to left bud", buf, 2u);
    }

    v9 = [v5 objectAtIndexedSubscript:8];

    if (v9 && [v9 length] && !objc_msgSend(v9, "isEqualToString:", @"?"))
    {
      v7 = v9;
    }
    else
    {
      v10 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Left bud serial number is missing for airpods device. Falling back to right bud", v13, 2u);
      }

      v7 = [v5 objectAtIndexedSubscript:9];

      if (!v7 || ![v7 length] || objc_msgSend(v7, "isEqualToString:", @"?"))
      {
        v11 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10000CE7C((uint64_t)v3, v11);
        }
      }
    }
  }

  return v7;
}

- (DADeviceObserverAirpods)init
{
  v24.receiver = self;
  v24.super_class = (Class)DADeviceObserverAirpods;
  v2 = [(DADeviceObserverAirpods *)&v24 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Diagnostics.airpodsRegistrationQueue", 0);
    airpodsRegistrationQueue = v2->_airpodsRegistrationQueue;
    v2->_airpodsRegistrationQueue = (OS_dispatch_queue *)v3;

    v2->_isObserving = 0;
    uint64_t v5 = +[NSMutableSet set];
    devices = v2->_devices;
    v2->_devices = (NSMutableSet *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v7;

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    btManagerAvailableSemaphore = v2->_btManagerAvailableSemaphore;
    v2->_btManagerAvailableSemaphore = (OS_dispatch_semaphore *)v9;

    v2->_initialDevicesFetched = 0;
    uint64_t v11 = +[NSSet setWithArray:&off_100015480];
    supportedDeviceAllowList = v2->_supportedDeviceAllowList;
    v2->_supportedDeviceAllowList = (NSSet *)v11;

    v13 = +[NSBundle mainBundle];
    v14 = [v13 bundleIdentifier];
    unsigned int v15 = [v14 isEqualToString:@"com.apple.Diagnostics"];

    if (v15)
    {
      id v16 = +[NSUserDefaults standardUserDefaults];
    }
    else
    {
      id v16 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Diagnostics"];
    }
    v17 = v16;
    v18 = [v16 objectForKey:@"ShowAllBluetoothAudioAccessories"];
    v2->_useSupportedDeviceAllowList = [v18 BOOLValue] ^ 1;
    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"_btManagerAvailable" name:BluetoothAvailabilityChangedNotification object:0];

    if (qword_10001C3D0 != -1) {
      dispatch_once(&qword_10001C3D0, &stru_100014820);
    }
    v20 = qword_10001C3D8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B8F4;
    block[3] = &unk_1000147C8;
    v23 = v2;
    dispatch_sync(v20, block);
  }
  return v2;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_10001C3D8;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B9EC;
  v7[3] = &unk_100014648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSUUID UUID];
  id v6 = [(DADeviceObserverAirpods *)self airpodsRegistrationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BBBC;
  block[3] = &unk_1000147A0;
  void block[4] = self;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  dispatch_async(v6, block);

  dispatch_semaphore_t v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DADeviceObserverAirpods *)self airpodsRegistrationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BCE8;
  v7[3] = &unk_100014708;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_beginObserving
{
  if (!self->_isObserving)
  {
    self->_isObserving = 1;
    dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_bluetoothPairingStatusChanged:" name:BluetoothPairedStatusChangedNotification object:0];
  }
  uint64_t v4 = [(DADeviceObserverAirpods *)self btManager];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        [(DADeviceObserverAirpods *)self btManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 available],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id v8 = [(DADeviceObserverAirpods *)self btManagerAvailableSemaphore];
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v8, v9);
  }
  [(DADeviceObserverAirpods *)self _ensureInitialDevicesFetched];
  [(DADeviceObserverAirpods *)self _updateHandlers];
}

- (void)_endObserving
{
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:BluetoothPairedStatusChangedNotification object:0];
  }
}

- (void)_updateHandlers
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(DADeviceObserverAirpods *)self handlers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        id v10 = [(DADeviceObserverAirpods *)self handlers];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          v12 = [(DADeviceObserverAirpods *)self devices];
          ((void (**)(void, void *))v11)[2](v11, v12);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_btManagerAvailable
{
  [(DADeviceObserverAirpods *)self _ensureInitialDevicesFetched];
  id v3 = [(DADeviceObserverAirpods *)self btManagerAvailableSemaphore];
  dispatch_semaphore_signal(v3);
}

- (BOOL)_isBluetoothDeviceServicableAirpods:(id)a3
{
  id v4 = a3;
  if ([v4 isAppleAudioDevice]) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = [(DADeviceObserverAirpods *)self _isBeatsDevice:v4];
  }
  unsigned int v6 = [v4 isTemporaryPaired];
  if ([(DADeviceObserverAirpods *)self useSupportedDeviceAllowList])
  {
    uint64_t v7 = [(DADeviceObserverAirpods *)self supportedDeviceAllowList];
    id v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 productId]);
    unsigned int v9 = [v7 containsObject:v8];
  }
  else
  {
    id v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Supported device allow list is disabled.", (uint8_t *)&v13, 2u);
    }

    unsigned int v9 = 1;
  }
  uint64_t v11 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413314;
    id v14 = v4;
    __int16 v15 = 1024;
    int v16 = v5 & ~v6 & v9;
    __int16 v17 = 1024;
    unsigned int v18 = v5;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    __int16 v21 = 1024;
    unsigned int v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BluetoothDevice (%@) is servicable: (%d) appleAudioDevice: (%d) tempPaired: (%d) allowed: (%d)", (uint8_t *)&v13, 0x24u);
  }

  return v5 & ~(_BYTE)v6 & v9;
}

- (BOOL)_isBeatsDevice:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 productId];
  if (v4 == 8209)
  {
    unsigned int v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device (%@) is a AirPods-like Beats device that does not report as an Apple Audio Device", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 == 8209;
}

- (void)_bluetoothPairingStatusChanged:(id)a3
{
  unsigned int v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DADeviceObserverAirpods recieved notification that bluetooth statuses have changed. Looking for any new devices...", v5, 2u);
  }

  [(DADeviceObserverAirpods *)self _purgeUnpairedDevices];
  [(DADeviceObserverAirpods *)self _forceDiscoverAllDevices];
  [(DADeviceObserverAirpods *)self _updateHandlers];
}

- (void)_forceDiscoverAllDevices
{
  id v3 = [(DADeviceObserverAirpods *)self devices];
  objc_sync_enter(v3);
  unsigned int v4 = [(DADeviceObserverAirpods *)self btManager];
  unsigned int v5 = [v4 pairedDevices];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v15;
    *(void *)&long long v8 = 138412290;
    long long v13 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[DADeviceObserverAirpods _isBluetoothDeviceServicableAirpods:](self, "_isBluetoothDeviceServicableAirpods:", v11, v13, (void)v14))
        {
          v12 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DADeviceObserverAirpods found an AppleAudioDevice: %@", buf, 0xCu);
          }

          [(DADeviceObserverAirpods *)self _addAirpodsDevice:v11];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v3);
}

- (void)_purgeUnpairedDevices
{
  id obj = [(DADeviceObserverAirpods *)self devices];
  objc_sync_enter(obj);
  id v3 = [(DADeviceObserverAirpods *)self devices];
  id v4 = [v3 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 airpodsDevice];
        unsigned __int8 v11 = [v10 paired];

        if ((v11 & 1) == 0)
        {
          v12 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unsigned int v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing Airpods device %@", buf, 0xCu);
          }

          long long v13 = [(DADeviceObserverAirpods *)self devices];
          [v13 removeObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

- (void)_ensureInitialDevicesFetched
{
  if (![(DADeviceObserverAirpods *)self initialDevicesFetched])
  {
    [(DADeviceObserverAirpods *)self _forceDiscoverAllDevices];
    [(DADeviceObserverAirpods *)self setInitialDevicesFetched:1];
  }
}

- (void)_addAirpodsDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(DADeviceObserverAirpods *)self _airpodsDeviceFromDevice:v4];
  id v6 = DiagnosticLogHandleForCategory();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding Bluetooth device: %@", (uint8_t *)&v10, 0xCu);
    }

    long long v8 = [(DADeviceObserverAirpods *)self devices];
    unsigned __int8 v9 = [v8 containsObject:v5];

    if (v9)
    {
      uint64_t v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connected bluetooth device %@ is already in device list", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      uint64_t v7 = [(DADeviceObserverAirpods *)self devices];
      [v7 addObject:v5];
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000CEF4((uint64_t)v4, v7);
  }
}

- (id)_airpodsDeviceFromDevice:(id)a3
{
  id v3 = a3;
  id v4 = NSClassFromString(@"DADeviceAirpods");
  if (v4)
  {
    id v5 = [[v4 alloc] initWithBluetoothDevice:v3];
    if (v5)
    {
      Class v6 = NSClassFromString(@"DADeviceDecoratorWithUI");
      if (v6)
      {
        uint64_t v7 = [(objc_class *)v6 performSelector:"decorateWithDevice:" withObject:v5];
      }
      else
      {
        unsigned __int8 v9 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10000CF6C(v9);
        }

        uint64_t v7 = (DADeviceRepresentation *)v5;
      }
      goto LABEL_11;
    }
LABEL_7:
    long long v8 = 0;
    goto LABEL_12;
  }
  id v5 = +[DADeviceObserverAirpods primarySerialNumberForAirpodsDevice:v3];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v7 = [[DADeviceRepresentation alloc] initWithSerialNumber:v5 isLocal:1 attributes:&__NSDictionary0__struct];
LABEL_11:
  long long v8 = v7;
LABEL_12:

  return v8;
}

- (OS_dispatch_queue)airpodsRegistrationQueue
{
  return self->_airpodsRegistrationQueue;
}

- (void)setAirpodsRegistrationQueue:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
}

- (OS_dispatch_semaphore)btManagerAvailableSemaphore
{
  return self->_btManagerAvailableSemaphore;
}

- (void)setBtManagerAvailableSemaphore:(id)a3
{
}

- (BOOL)initialDevicesFetched
{
  return self->_initialDevicesFetched;
}

- (void)setInitialDevicesFetched:(BOOL)a3
{
  self->_initialDevicesFetched = a3;
}

- (NSSet)supportedDeviceAllowList
{
  return self->_supportedDeviceAllowList;
}

- (BOOL)useSupportedDeviceAllowList
{
  return self->_useSupportedDeviceAllowList;
}

- (void)setUseSupportedDeviceAllowList:(BOOL)a3
{
  self->_useSupportedDeviceAllowList = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedDeviceAllowList, 0);
  objc_storeStrong((id *)&self->_btManagerAvailableSemaphore, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_airpodsRegistrationQueue, 0);
}

@end
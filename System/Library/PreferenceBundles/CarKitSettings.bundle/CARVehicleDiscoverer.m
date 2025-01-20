@interface CARVehicleDiscoverer
+ (BOOL)isBluetoothLEEnabled;
- (BOOL)_removeVehicleForAccessory:(id)a3 removedVehicle:(id *)a4;
- (BOOL)bluetoothPairVehicle:(id)a3;
- (BOOL)isWirelessDiscovering;
- (CARBluetoothClassicDiscoverer)bluetoothClassicDiscoverer;
- (CARBluetoothLEDiscoverer)bluetoothLEDiscoverer;
- (CARSessionStatus)sessionStatus;
- (CARVehicleDiscoverer)init;
- (CARVehicleDiscovery)discoveryDelegate;
- (CRVehicleAccessoryManager)accessoryManager;
- (NSMutableDictionary)vehicleForBluetoothAddress;
- (NSMutableDictionary)vehicleForBluetoothLEIdentifier;
- (NSSet)discoveredVehicles;
- (id)_removeVehicleForBluetoothDevice:(id)a3;
- (id)_removeVehicleForBluetoothLEDevice:(id)a3;
- (id)_vehicleForAccessory:(id)a3;
- (id)_vehicleForBluetoothAddress:(id)a3;
- (id)_vehicleForBluetoothDevice:(id)a3;
- (id)_vehicleForBluetoothLEDevice:(id)a3;
- (id)_vehicleForBluetoothLEIdentifier:(id)a3;
- (id)viewControllerPresentingPairingForBluetoothDiscoverer:(id)a3;
- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4;
- (void)accessoryManager:(id)a3 didDisconnectVehicleAccessory:(id)a4;
- (void)bluetoothDiscoverer:(id)a3 changedDiscoveryState:(BOOL)a4;
- (void)bluetoothDiscoverer:(id)a3 didDiscoverDevice:(id)a4;
- (void)bluetoothDiscoverer:(id)a3 didRemoveDevice:(id)a4;
- (void)bluetoothDiscoverer:(id)a3 didUpdateDevice:(id)a4;
- (void)bluetoothLEDiscoverer:(id)a3 changedDiscoveryState:(BOOL)a4;
- (void)bluetoothLEDiscoverer:(id)a3 didDiscoverDevice:(id)a4;
- (void)bluetoothLEDiscoverer:(id)a3 didRemoveDevice:(id)a4;
- (void)bluetoothLEDiscoverer:(id)a3 didUpdateDevice:(id)a4;
- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3;
- (void)dealloc;
- (void)handleChangedWirelessDiscoveryState:(BOOL)a3;
- (void)handleDiscoveredVehicle:(id)a3;
- (void)handleRemovedVehicle:(id)a3;
- (void)handleUpdatedVehicle:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)setAccessoryManager:(id)a3;
- (void)setBluetoothClassicDiscoverer:(id)a3;
- (void)setBluetoothLEDiscoverer:(id)a3;
- (void)setDiscoveryDelegate:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setVehicleForBluetoothAddress:(id)a3;
- (void)setVehicleForBluetoothLEIdentifier:(id)a3;
- (void)setWirelessDiscovering:(BOOL)a3;
- (void)startWirelessDiscovery;
- (void)startedConnectionAttemptOnTransport:(unint64_t)a3;
- (void)stopWirelessDiscovery;
@end

@implementation CARVehicleDiscoverer

+ (BOOL)isBluetoothLEEnabled
{
  CFBooleanRef v2 = (const __CFBoolean *)CFPreferencesCopyValue(@"EnableBLE", @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

- (CARVehicleDiscoverer)init
{
  v15.receiver = self;
  v15.super_class = (Class)CARVehicleDiscoverer;
  CFBooleanRef v2 = [(CARVehicleDiscoverer *)&v15 init];
  CFBooleanRef v3 = v2;
  if (v2)
  {
    [(CARVehicleDiscoverer *)v2 setWirelessDiscovering:0];
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [(CARVehicleDiscoverer *)v3 setVehicleForBluetoothAddress:v4];

    BOOL v5 = objc_alloc_init(CARBluetoothClassicDiscoverer);
    [(CARVehicleDiscoverer *)v3 setBluetoothClassicDiscoverer:v5];

    v6 = [(CARVehicleDiscoverer *)v3 bluetoothClassicDiscoverer];
    [v6 setBluetoothDiscoveryDelegate:v3];

    if ([(id)objc_opt_class() isBluetoothLEEnabled])
    {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      [(CARVehicleDiscoverer *)v3 setVehicleForBluetoothLEIdentifier:v7];

      v8 = objc_alloc_init(CARBluetoothLEDiscoverer);
      [(CARVehicleDiscoverer *)v3 setBluetoothLEDiscoverer:v8];

      v9 = [(CARVehicleDiscoverer *)v3 bluetoothLEDiscoverer];
      [v9 setBluetoothDiscoveryDelegate:v3];
    }
    id v10 = objc_alloc_init((Class)CRVehicleAccessoryManager);
    [(CARVehicleDiscoverer *)v3 setAccessoryManager:v10];

    v11 = [(CARVehicleDiscoverer *)v3 accessoryManager];
    [v11 addObserver:v3];

    id v12 = objc_alloc_init((Class)CARSessionStatus);
    [(CARVehicleDiscoverer *)v3 setSessionStatus:v12];

    v13 = [(CARVehicleDiscoverer *)v3 sessionStatus];
    [v13 addSessionObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  [(CARVehicleDiscoverer *)self stopWirelessDiscovery];
  CFBooleanRef v3 = [(CARVehicleDiscoverer *)self accessoryManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CARVehicleDiscoverer;
  [(CARVehicleDiscoverer *)&v4 dealloc];
}

- (void)startWirelessDiscovery
{
  [(CARVehicleDiscoverer *)self setWirelessDiscovering:1];
  CFBooleanRef v3 = [(CARVehicleDiscoverer *)self bluetoothClassicDiscoverer];
  [v3 startDiscovery];

  id v4 = [(CARVehicleDiscoverer *)self bluetoothLEDiscoverer];
  [v4 startDiscovery];
}

- (void)stopWirelessDiscovery
{
  [(CARVehicleDiscoverer *)self setWirelessDiscovering:0];
  CFBooleanRef v3 = [(CARVehicleDiscoverer *)self bluetoothClassicDiscoverer];
  [v3 stopDiscovery];

  id v4 = [(CARVehicleDiscoverer *)self bluetoothLEDiscoverer];
  [v4 stopDiscovery];
}

- (void)handleChangedWirelessDiscoveryState:(BOOL)a3
{
  BOOL v3 = a3;
  -[CARVehicleDiscoverer setWirelessDiscovering:](self, "setWirelessDiscovering:");
  BOOL v5 = [(CARVehicleDiscoverer *)self discoveryDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CARVehicleDiscoverer *)self discoveryDelegate];
    [v7 vehicleDiscoverer:self changedWirelessDiscoveryState:v3];
  }
}

- (void)handleDiscoveredVehicle:(id)a3
{
  id v7 = a3;
  id v4 = [(CARVehicleDiscoverer *)self discoveryDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CARVehicleDiscoverer *)self discoveryDelegate];
    [v6 vehicleDiscoverer:self didDiscoverVehicle:v7];
  }
}

- (void)handleUpdatedVehicle:(id)a3
{
  id v7 = a3;
  id v4 = [(CARVehicleDiscoverer *)self discoveryDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CARVehicleDiscoverer *)self discoveryDelegate];
    [v6 vehicleDiscoverer:self didUpdateVehicle:v7];
  }
}

- (void)handleRemovedVehicle:(id)a3
{
  id v7 = a3;
  id v4 = [(CARVehicleDiscoverer *)self discoveryDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CARVehicleDiscoverer *)self discoveryDelegate];
    [v6 vehicleDiscoverer:self didRemoveVehicle:v7];
  }
}

- (id)_vehicleForBluetoothAddress:(id)a3
{
  id v4 = a3;
  char v5 = [(CARVehicleDiscoverer *)self vehicleForBluetoothAddress];
  char v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    char v6 = objc_alloc_init(CARDiscoveredVehicle);
    id v7 = [(CARVehicleDiscoverer *)self vehicleForBluetoothAddress];
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

- (id)_vehicleForBluetoothDevice:(id)a3
{
  id v4 = a3;
  char v5 = [v4 bluetoothAddress];
  if (v5)
  {
    char v6 = [(CARVehicleDiscoverer *)self _vehicleForBluetoothAddress:v5];
    [v6 setBluetoothDevice:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_vehicleForAccessory:(id)a3
{
  id v4 = a3;
  char v5 = [v4 bluetoothAddress];
  if (v5)
  {
    char v6 = [(CARVehicleDiscoverer *)self _vehicleForBluetoothAddress:v5];
  }
  else
  {
    char v6 = objc_alloc_init(CARDiscoveredVehicle);
  }
  id v7 = v6;
  [(CARDiscoveredVehicle *)v6 setAccessory:v4];

  return v7;
}

- (id)_removeVehicleForBluetoothDevice:(id)a3
{
  id v4 = [a3 bluetoothAddress];
  char v5 = [(CARVehicleDiscoverer *)self vehicleForBluetoothAddress];
  char v6 = [v5 objectForKey:v4];

  if (v6 && ([v6 accessory], id v7 = [v6 setBluetoothDevice:0];
  {
    v9 = [(CARVehicleDiscoverer *)self vehicleForBluetoothAddress];
    [v9 removeObjectForKey:v4];

    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_vehicleForBluetoothLEIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(CARVehicleDiscoverer *)self vehicleForBluetoothLEIdentifier];
  char v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    char v6 = objc_alloc_init(CARDiscoveredVehicle);
    id v7 = [(CARVehicleDiscoverer *)self vehicleForBluetoothLEIdentifier];
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

- (id)_vehicleForBluetoothLEDevice:(id)a3
{
  id v4 = a3;
  char v5 = [v4 identifier];
  if (v5)
  {
    char v6 = [(CARVehicleDiscoverer *)self _vehicleForBluetoothLEIdentifier:v5];
    [v6 setBluetoothLEDevice:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_removeVehicleForBluetoothLEDevice:(id)a3
{
  id v4 = [a3 identifier];
  char v5 = [(CARVehicleDiscoverer *)self vehicleForBluetoothLEIdentifier];
  char v6 = [v5 objectForKey:v4];

  if (v6 && ([v6 accessory], id v7 = [v6 setBluetoothLEDevice:0];
  {
    v9 = [(CARVehicleDiscoverer *)self vehicleForBluetoothLEIdentifier];
    [v9 removeObjectForKey:v4];

    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_removeVehicleForAccessory:(id)a3 removedVehicle:(id *)a4
{
  char v6 = [a3 bluetoothAddress];
  id v7 = [(CARVehicleDiscoverer *)self vehicleForBluetoothAddress];
  id v8 = [v7 objectForKey:v6];

  [v8 setAccessory:0];
  if (a4) {
    *a4 = v8;
  }
  if (v8)
  {
    v9 = [v8 bluetoothDevice];
    char v10 = v9 == 0;

    if (!v9 && v6)
    {
      v11 = [(CARVehicleDiscoverer *)self vehicleForBluetoothAddress];
      [v11 removeObjectForKey:v6];

      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)bluetoothPairVehicle:(id)a3
{
  id v4 = a3;
  char v5 = [v4 bluetoothLEDevice];

  if (v5)
  {
    char v6 = [(CARVehicleDiscoverer *)self bluetoothLEDiscoverer];
    uint64_t v7 = [v4 bluetoothLEDevice];
LABEL_5:
    v9 = (void *)v7;
    LOBYTE(v8) = [v6 pairBluetoothDevice:v7];

    goto LABEL_6;
  }
  id v8 = [v4 bluetoothDevice];

  if (v8)
  {
    char v6 = [(CARVehicleDiscoverer *)self bluetoothClassicDiscoverer];
    uint64_t v7 = [v4 bluetoothDevice];
    goto LABEL_5;
  }
LABEL_6:

  return (char)v8;
}

- (NSSet)discoveredVehicles
{
  BOOL v3 = [(CARVehicleDiscoverer *)self vehicleForBluetoothAddress];
  id v4 = [v3 allValues];
  char v5 = +[NSSet setWithArray:v4];
  id v6 = [v5 mutableCopy];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [(CARVehicleDiscoverer *)self accessoryManager];
  id v8 = [v7 connectedVehicleAccessories];

  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [(CARVehicleDiscoverer *)self _vehicleForAccessory:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        [v6 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = [(CARVehicleDiscoverer *)self bluetoothClassicDiscoverer];
  objc_super v15 = [v14 discoveredBluetoothDevices];

  id v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [(CARVehicleDiscoverer *)self _vehicleForBluetoothDevice:*(void *)(*((void *)&v22 + 1) + 8 * (void)j)];
        [v6 addObject:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  return (NSSet *)v6;
}

- (void)bluetoothDiscoverer:(id)a3 changedDiscoveryState:(BOOL)a4
{
}

- (void)bluetoothDiscoverer:(id)a3 didDiscoverDevice:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "bluetooth discovered %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(CARVehicleDiscoverer *)self _vehicleForBluetoothDevice:v5];
  [(CARVehicleDiscoverer *)self handleDiscoveredVehicle:v7];
}

- (void)bluetoothDiscoverer:(id)a3 didUpdateDevice:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "bluetooth updated %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(CARVehicleDiscoverer *)self _vehicleForBluetoothDevice:v5];
  [(CARVehicleDiscoverer *)self handleUpdatedVehicle:v7];
}

- (void)bluetoothDiscoverer:(id)a3 didRemoveDevice:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "bluetooth removed %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(CARVehicleDiscoverer *)self _removeVehicleForBluetoothDevice:v5];
  if (v7) {
    [(CARVehicleDiscoverer *)self handleRemovedVehicle:v7];
  }
}

- (id)viewControllerPresentingPairingForBluetoothDiscoverer:(id)a3
{
  id v4 = [(CARVehicleDiscoverer *)self discoveryDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CARVehicleDiscoverer *)self discoveryDelegate];
    uint64_t v7 = [v6 viewControllerPresentingPairingForVehicleDiscoverer:self];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)bluetoothLEDiscoverer:(id)a3 changedDiscoveryState:(BOOL)a4
{
}

- (void)bluetoothLEDiscoverer:(id)a3 didDiscoverDevice:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "bluetooth LE discovered %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(CARVehicleDiscoverer *)self _vehicleForBluetoothLEDevice:v5];
  [(CARVehicleDiscoverer *)self handleDiscoveredVehicle:v7];
}

- (void)bluetoothLEDiscoverer:(id)a3 didUpdateDevice:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "bluetooth LE updated %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(CARVehicleDiscoverer *)self _vehicleForBluetoothLEDevice:v5];
  [(CARVehicleDiscoverer *)self handleUpdatedVehicle:v7];
}

- (void)bluetoothLEDiscoverer:(id)a3 didRemoveDevice:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "bluetooth LE removed %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(CARVehicleDiscoverer *)self _removeVehicleForBluetoothLEDevice:v5];
  if (v7) {
    [(CARVehicleDiscoverer *)self handleRemovedVehicle:v7];
  }
}

- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "accessory connected %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v7 = [v5 bluetoothAddress];
  if (!v7)
  {
    id v10 = [(CARVehicleDiscoverer *)self _vehicleForAccessory:v5];
LABEL_7:
    [(CARVehicleDiscoverer *)self handleDiscoveredVehicle:v10];
    goto LABEL_8;
  }
  int v8 = [(CARVehicleDiscoverer *)self vehicleForBluetoothAddress];
  id v9 = [v8 objectForKey:v7];

  id v10 = [(CARVehicleDiscoverer *)self _vehicleForAccessory:v5];
  if (!v9) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)accessoryManager:(id)a3 didDisconnectVehicleAccessory:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "accessory disconnected %@", buf, 0xCu);
  }

  id v9 = 0;
  unsigned int v7 = [(CARVehicleDiscoverer *)self _removeVehicleForAccessory:v5 removedVehicle:&v9];
  id v8 = v9;
  if (v7) {
    [(CARVehicleDiscoverer *)self handleRemovedVehicle:v8];
  }
  else {
    [(CARVehicleDiscoverer *)self handleUpdatedVehicle:v8];
  }
}

- (void)startedConnectionAttemptOnTransport:(unint64_t)a3
{
  if (a3 == 3)
  {
    block[5] = v3;
    block[6] = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_12E84;
    block[3] = &unk_24818;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3
{
  if (a3 == 3)
  {
    block[5] = v3;
    block[6] = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_12F48;
    block[3] = &unk_24818;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)sessionDidConnect:(id)a3
{
  uint64_t v4 = [a3 configuration];
  id v5 = (char *)[v4 transportType];

  if (v5 == (unsigned char *)&dword_0 + 3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13038;
    block[3] = &unk_24818;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)isWirelessDiscovering
{
  return self->_wirelessDiscovering;
}

- (void)setWirelessDiscovering:(BOOL)a3
{
  self->_wirelessDiscovering = a3;
}

- (CARVehicleDiscovery)discoveryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryDelegate);

  return (CARVehicleDiscovery *)WeakRetained;
}

- (void)setDiscoveryDelegate:(id)a3
{
}

- (NSMutableDictionary)vehicleForBluetoothAddress
{
  return self->_vehicleForBluetoothAddress;
}

- (void)setVehicleForBluetoothAddress:(id)a3
{
}

- (CARBluetoothClassicDiscoverer)bluetoothClassicDiscoverer
{
  return self->_bluetoothClassicDiscoverer;
}

- (void)setBluetoothClassicDiscoverer:(id)a3
{
}

- (NSMutableDictionary)vehicleForBluetoothLEIdentifier
{
  return self->_vehicleForBluetoothLEIdentifier;
}

- (void)setVehicleForBluetoothLEIdentifier:(id)a3
{
}

- (CARBluetoothLEDiscoverer)bluetoothLEDiscoverer
{
  return self->_bluetoothLEDiscoverer;
}

- (void)setBluetoothLEDiscoverer:(id)a3
{
}

- (CRVehicleAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong((id *)&self->_bluetoothLEDiscoverer, 0);
  objc_storeStrong((id *)&self->_vehicleForBluetoothLEIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothClassicDiscoverer, 0);
  objc_storeStrong((id *)&self->_vehicleForBluetoothAddress, 0);

  objc_destroyWeak((id *)&self->_discoveryDelegate);
}

@end
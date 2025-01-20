@interface CARDiscoveredVehicle
- (BOOL)isConnecting;
- (CARBluetoothClassicDevice)bluetoothDevice;
- (CARBluetoothLEDevice)bluetoothLEDevice;
- (CARDiscoveredVehicle)init;
- (CRVehicleAccessory)accessory;
- (NSString)bluetoothAddress;
- (NSString)connectionStatusDescription;
- (NSString)debugConnectionStatusDescription;
- (NSString)displayName;
- (NSString)identifier;
- (id)description;
- (void)setAccessory:(id)a3;
- (void)setBluetoothDevice:(id)a3;
- (void)setBluetoothLEDevice:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CARDiscoveredVehicle

- (CARDiscoveredVehicle)init
{
  v6.receiver = self;
  v6.super_class = (Class)CARDiscoveredVehicle;
  v2 = [(CARDiscoveredVehicle *)&v6 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    v4 = [v3 UUIDString];
    [(CARDiscoveredVehicle *)v2 setIdentifier:v4];
  }
  return v2;
}

- (NSString)displayName
{
  v3 = [(CARDiscoveredVehicle *)self accessory];
  v4 = [v3 displayName];

  if (!v4)
  {
    objc_super v6 = [(CARDiscoveredVehicle *)self bluetoothDevice];

    if (!v6
      || ([(CARDiscoveredVehicle *)self bluetoothDevice],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v7 name],
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v4))
    {
      v8 = [(CARDiscoveredVehicle *)self bluetoothLEDevice];

      if (!v8
        || ([(CARDiscoveredVehicle *)self bluetoothLEDevice],
            v9 = objc_claimAutoreleasedReturnValue(),
            [v9 name],
            v4 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            v9,
            !v4))
      {
        v4 = &stru_24F60;
      }
    }
  }

  return (NSString *)v4;
}

- (NSString)connectionStatusDescription
{
  return 0;
}

- (NSString)debugConnectionStatusDescription
{
  v3 = [(CARDiscoveredVehicle *)self accessory];

  if (v3)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"DEBUG_ACCESSORY_CONNECTED";
    goto LABEL_3;
  }
  v9 = [(CARDiscoveredVehicle *)self bluetoothDevice];

  if (v9)
  {
    v10 = [(CARDiscoveredVehicle *)self bluetoothDevice];
    v11 = (int *)[v10 connectionStatus];

    if (v11 == &dword_4) {
      goto LABEL_14;
    }
    if (v11 == (int *)((char *)&dword_0 + 2))
    {
LABEL_13:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      v5 = v4;
      CFStringRef v6 = @"DEBUG_BLUETOOTH_CONNECTING";
      goto LABEL_3;
    }
    v12 = [(CARDiscoveredVehicle *)self bluetoothDevice];
    unsigned int v13 = [v12 isPaired];

    if (v13) {
      goto LABEL_16;
    }
  }
  v14 = [(CARDiscoveredVehicle *)self bluetoothLEDevice];

  if (!v14) {
    goto LABEL_17;
  }
  v15 = [(CARDiscoveredVehicle *)self bluetoothLEDevice];
  v16 = (int *)[v15 connectionStatus];

  if (v16 == &dword_4)
  {
LABEL_14:
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"DEBUG_BLUETOOTH_CONNECTED";
    goto LABEL_3;
  }
  if (v16 == (int *)((char *)&dword_0 + 2)) {
    goto LABEL_13;
  }
  v17 = [(CARDiscoveredVehicle *)self bluetoothLEDevice];
  unsigned int v18 = [v17 isPaired];

  if (v18)
  {
LABEL_16:
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"DEBUG_BLUETOOTH_PAIRED";
    goto LABEL_3;
  }
LABEL_17:
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = v4;
  CFStringRef v6 = @"DEBUG_NOT_CONNECTED";
LABEL_3:
  v7 = [v4 localizedStringForKey:v6 value:&stru_24F60 table:@"Localizable"];

  return (NSString *)v7;
}

- (BOOL)isConnecting
{
  v3 = [(CARDiscoveredVehicle *)self bluetoothDevice];

  if (v3)
  {
    v4 = [(CARDiscoveredVehicle *)self bluetoothDevice];
  }
  else
  {
    v5 = [(CARDiscoveredVehicle *)self bluetoothLEDevice];

    if (!v5) {
      return 0;
    }
    v4 = [(CARDiscoveredVehicle *)self bluetoothLEDevice];
  }
  CFStringRef v6 = v4;
  v7 = (int *)[v4 connectionStatus];

  if (v7 == (int *)((char *)&dword_0 + 2)) {
    return 1;
  }
  if (v7 != &dword_4) {
    return 0;
  }
  v8 = [(CARDiscoveredVehicle *)self accessory];
  BOOL v9 = v8 == 0;

  return v9;
}

- (NSString)bluetoothAddress
{
  v3 = [(CARDiscoveredVehicle *)self accessory];
  v4 = [v3 bluetoothAddress];

  if (!v4)
  {
    v5 = [(CARDiscoveredVehicle *)self bluetoothDevice];
    v4 = [v5 bluetoothAddress];
  }

  return (NSString *)v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CARDiscoveredVehicle;
  v3 = [(CARDiscoveredVehicle *)&v7 description];
  v4 = [(CARDiscoveredVehicle *)self identifier];
  v5 = +[NSString stringWithFormat:@"%@ (identifier: %@)", v3, v4];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CRVehicleAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (CRVehicleAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (CARBluetoothClassicDevice)bluetoothDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothDevice);

  return (CARBluetoothClassicDevice *)WeakRetained;
}

- (void)setBluetoothDevice:(id)a3
{
}

- (CARBluetoothLEDevice)bluetoothLEDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothLEDevice);

  return (CARBluetoothLEDevice *)WeakRetained;
}

- (void)setBluetoothLEDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bluetoothLEDevice);
  objc_destroyWeak((id *)&self->_bluetoothDevice);
  objc_destroyWeak((id *)&self->_accessory);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
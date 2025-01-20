@interface BTSDeviceClassic
+ (id)deviceWithDevice:(id)a3;
- (BOOL)ancsAuthorized;
- (BOOL)cloudPaired;
- (BOOL)connect;
- (BOOL)connected;
- (BOOL)doesSupportBackgroundNI;
- (BOOL)isApplePencil:(int *)a3;
- (BOOL)isCTKDDevice;
- (BOOL)isCarPlayDevice;
- (BOOL)isFirmwareUpdateRequiredDevice;
- (BOOL)isHIDDevice;
- (BOOL)isHealthDevice;
- (BOOL)isLimitedConnectivityDevice;
- (BOOL)isManagedByAliroWallet;
- (BOOL)isManagedByDeviceAccess;
- (BOOL)isManagedByWallet;
- (BOOL)isMyDevice;
- (BOOL)isTemporaryPairedDevice;
- (BOOL)magicPaired;
- (BOOL)paired;
- (BOOL)setUserName:(id)a3;
- (BOOL)shouldDenyIncomingClassicConnection;
- (BOOL)supportsANCS;
- (BTSDeviceClassic)initWithDevice:(id)a3;
- (BluetoothDevice)device;
- (id)accessorySetupKitDisplayName;
- (id)classicDevice;
- (id)description;
- (id)healthDeviceType;
- (id)identifier;
- (id)name;
- (id)productName;
- (int)userSelectedHealthDataSyncConfig;
- (void)disconnect;
- (void)setAccessorySetupKitDisplayName:(id)a3;
- (void)setCtkdDevice:(BOOL)a3;
- (void)setDenyIncomingClassicConnection:(BOOL)a3;
- (void)setManagedByAliroWallet:(BOOL)a3;
- (void)setManagedByWallet:(BOOL)a3;
- (void)setSupportsBackgroundNI:(BOOL)a3;
- (void)unpair;
@end

@implementation BTSDeviceClassic

+ (id)deviceWithDevice:(id)a3
{
  id v3 = a3;
  v4 = [[BTSDeviceClassic alloc] initWithDevice:v3];

  return v4;
}

- (id)identifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  id v3 = [WeakRetained address];

  return v3;
}

- (BTSDeviceClassic)initWithDevice:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTSDeviceClassic;
  v5 = [(BTSDeviceClassic *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_device, v4);
  }

  return v6;
}

- (id)classicDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return WeakRetained;
}

- (id)productName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  id v3 = [WeakRetained productName];

  return v3;
}

- (BOOL)isCTKDDevice
{
  return self->ctkdDevice;
}

- (BOOL)connected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  char v3 = [WeakRetained connected];

  return v3;
}

- (BOOL)paired
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  char v3 = [WeakRetained paired];

  return v3;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(BTSDeviceClassic *)self isMyDevice]) {
    v5 = "yes";
  }
  else {
    v5 = "no";
  }
  if ([(BTSDeviceClassic *)self isHealthDevice]) {
    v6 = "yes";
  }
  else {
    v6 = "no";
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  if ([(BTSDeviceClassic *)self isTemporaryPairedDevice]) {
    objc_super v8 = "yes";
  }
  else {
    objc_super v8 = "no";
  }
  v9 = [v3 stringWithFormat:@"<%@: %p, myDevice = %s, healthDevice = %s, classicDevice = %@>, guest = %s", v4, self, v5, v6, WeakRetained, v8];

  return v9;
}

- (id)name
{
  accessorySetupKitDisplayName = self->accessorySetupKitDisplayName;
  if (accessorySetupKitDisplayName)
  {
    char v3 = accessorySetupKitDisplayName;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    char v3 = [WeakRetained name];
  }

  return v3;
}

- (id)healthDeviceType
{
  return 0;
}

- (BOOL)cloudPaired
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  char v3 = [WeakRetained cloudPaired];

  return v3;
}

- (BOOL)magicPaired
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  char v3 = [WeakRetained magicPaired];

  return v3;
}

- (BOOL)isTemporaryPairedDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  char v3 = [WeakRetained isTemporaryPaired];

  return v3;
}

- (BOOL)isHealthDevice
{
  return 0;
}

- (BOOL)isMyDevice
{
  BOOL v3 = [(BTSDeviceClassic *)self paired];
  if (v3) {
    LOBYTE(v3) = ![(BTSDeviceClassic *)self isTemporaryPairedDevice];
  }
  return v3;
}

- (BOOL)setUserName:(id)a3
{
  p_device = &self->_device;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_device);
  char v6 = [WeakRetained setUserName:v4];

  return v6;
}

- (BOOL)connect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  [WeakRetained connect];

  return 1;
}

- (void)disconnect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  [WeakRetained disconnect];
}

- (void)unpair
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  [WeakRetained unpair];
}

- (BOOL)supportsANCS
{
  return 0;
}

- (BOOL)isManagedByWallet
{
  return self->managedByWallet;
}

- (BOOL)isManagedByAliroWallet
{
  return self->managedByAliroWallet;
}

- (BOOL)isManagedByDeviceAccess
{
  return 0;
}

- (BOOL)ancsAuthorized
{
  return 0;
}

- (int)userSelectedHealthDataSyncConfig
{
  return 2;
}

- (BOOL)isApplePencil:(int *)a3
{
  return 0;
}

- (BOOL)doesSupportBackgroundNI
{
  return self->supportsBackgroundNI;
}

- (BOOL)isLimitedConnectivityDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  BOOL v3 = [WeakRetained getBehaviorForHIDDevice] != 0;

  return v3;
}

- (BOOL)isFirmwareUpdateRequiredDevice
{
  return 0;
}

- (BOOL)isHIDDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  char v3 = [WeakRetained isServiceSupported:32];

  return v3;
}

- (BOOL)isCarPlayDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  char v3 = [WeakRetained isServiceSupported:0x40000];

  return v3;
}

- (BluetoothDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (BluetoothDevice *)WeakRetained;
}

- (void)setCtkdDevice:(BOOL)a3
{
  self->ctkdDevice = a3;
}

- (void)setManagedByWallet:(BOOL)a3
{
  self->managedByWallet = a3;
}

- (void)setManagedByAliroWallet:(BOOL)a3
{
  self->managedByAliroWallet = a3;
}

- (void)setSupportsBackgroundNI:(BOOL)a3
{
  self->supportsBackgroundNI = a3;
}

- (id)accessorySetupKitDisplayName
{
  return self->accessorySetupKitDisplayName;
}

- (void)setAccessorySetupKitDisplayName:(id)a3
{
}

- (BOOL)shouldDenyIncomingClassicConnection
{
  return self->denyIncomingClassicConnection;
}

- (void)setDenyIncomingClassicConnection:(BOOL)a3
{
  self->denyIncomingClassicConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->accessorySetupKitDisplayName, 0);

  objc_destroyWeak((id *)&self->_device);
}

@end
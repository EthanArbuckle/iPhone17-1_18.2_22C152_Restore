@interface BTSDeviceLE
+ (id)deviceWithPeripheral:(id)a3 manager:(id)a4;
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
- (BOOL)paired;
- (BOOL)setUserName:(id)a3;
- (BOOL)shouldDenyIncomingClassicConnection;
- (BOOL)supportsANCS;
- (BOOL)supportsCTKD;
- (BTSDeviceLE)initWithPeripheral:(id)a3 manager:(id)a4;
- (DADevice)underlyingDADevice;
- (id)classicDevice;
- (id)description;
- (id)healthDeviceType;
- (id)identifier;
- (id)linkedRadioAddress;
- (id)name;
- (id)relatedFutureRadioAddress;
- (int)userSelectedHealthDataSyncConfig;
- (void)disconnect;
- (void)setANCSAuthorization:(BOOL)a3;
- (void)setCtkdDevice:(BOOL)a3;
- (void)setDenyIncomingClassicConnection:(BOOL)a3;
- (void)setHealthDevice:(BOOL)a3;
- (void)setManagedByAliroWallet:(BOOL)a3;
- (void)setManagedByWallet:(BOOL)a3;
- (void)setSupportsBackgroundNI:(BOOL)a3;
- (void)setUnderlyingDADevice:(id)a3;
- (void)setUserSelectedHealthDataSyncConfig:(int)a3;
- (void)unpair;
@end

@implementation BTSDeviceLE

- (BTSDeviceLE)initWithPeripheral:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BTSDeviceLE;
  v9 = [(BTSDeviceLE *)&v11 init];
  if (v9)
  {
    if ([v7 hasTag:@"IsHearingAid"])
    {

      v9 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v9->_peripheral, a3);
      objc_storeStrong((id *)&v9->_centralManager, a4);
    }
  }

  return v9;
}

+ (id)deviceWithPeripheral:(id)a3 manager:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[BTSDeviceLE alloc] initWithPeripheral:v6 manager:v5];

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(BTSDeviceLE *)self isMyDevice]) {
    id v5 = "yes";
  }
  else {
    id v5 = "no";
  }
  if ([(BTSDeviceLE *)self isHealthDevice]) {
    id v6 = "yes";
  }
  else {
    id v6 = "no";
  }
  peripheral = self->_peripheral;
  underlyingDADevice = self->_underlyingDADevice;
  if ([(BTSDeviceLE *)self isTemporaryPairedDevice]) {
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, myDevice = %s, healthDevice = %s, peripheral = %@, daDevice = %@>, guest = %s", v4, self, v5, v6, peripheral, underlyingDADevice, v9];
}

- (id)identifier
{
  v2 = [(CBPeripheral *)self->_peripheral identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)name
{
  v3 = [self->_underlyingDADevice name];

  if (v3)
  {
    id v4 = [self->_underlyingDADevice name];
  }
  else
  {
    id v5 = [(BTSDeviceLE *)self healthDeviceType];

    if (v5)
    {
      id v6 = NSString;
      id v7 = [(CBPeripheral *)self->_peripheral name];
      id v4 = [v6 stringWithFormat:@"GHSS %@", v7];
    }
    else
    {
      id v8 = [(CBPeripheral *)self->_peripheral name];
      v9 = v8;
      if (v8)
      {
        id v4 = v8;
      }
      else
      {
        v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v4 = [v10 localizedStringForKey:@"ACCESSORY" value:&stru_1F4097960 table:@"Devices"];
      }
    }
  }

  return v4;
}

- (id)healthDeviceType
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"enableHealthDevices", @"com.apple.bluetooth", &keyExistsAndHasValidFormat);
  id v4 = 0;
  if (_os_feature_enabled_impl() && AppBooleanValue && keyExistsAndHasValidFormat)
  {
    id v5 = [(CBPeripheral *)self->_peripheral customProperty:@"GHSDeviceType"];
    if (v5)
    {
      id v6 = v5;
      if (([v5 isEqualToString:@"4103"] & 1) != 0
        || ([v6 isEqualToString:@"4104"] & 1) != 0
        || ([v6 isEqualToString:@"4113"] & 1) != 0
        || [v6 isEqualToString:@"4111"])
      {
        id v4 = v6;
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (BOOL)connected
{
  return [(CBPeripheral *)self->_peripheral isConnectedToSystem];
}

- (BOOL)paired
{
  v2 = self;
  v3 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
  LOBYTE(v2) = [v3 isPeerPaired:v2->_peripheral];

  return (char)v2;
}

- (BOOL)isTemporaryPairedDevice
{
  return 0;
}

- (BOOL)cloudPaired
{
  v2 = self;
  v3 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
  LOBYTE(v2) = [v3 isPeerCloudPaired:v2->_peripheral];

  return (char)v2;
}

- (id)classicDevice
{
  if ([(BTSDeviceLE *)self supportsCTKD])
  {
    v3 = [MEMORY[0x1E4F50B70] sharedInstance];
    id v4 = [(CBPeripheral *)self->_peripheral identifier];
    id v5 = [v3 deviceFromIdentifier:v4];

    id v6 = +[BTSDeviceClassic deviceWithDevice:v5];
    id v7 = [v6 classicDevice];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isMyDevice
{
  if ([(BTSDeviceLE *)self paired]
    || [(BTSDeviceLE *)self connected]
    || [(BTSDeviceLE *)self isHealthDevice])
  {
    return 1;
  }

  return [(BTSDeviceLE *)self isManagedByDeviceAccess];
}

- (BOOL)setUserName:(id)a3
{
  return 1;
}

- (BOOL)connect
{
  char v3 = [(CBPeripheral *)self->_peripheral isConnectedToSystem];
  if ((v3 & 1) == 0) {
    [(CBCentralManager *)self->_centralManager connectPeripheral:self->_peripheral options:0];
  }
  return v3 ^ 1;
}

- (void)disconnect
{
}

- (void)unpair
{
  if (_os_feature_enabled_impl())
  {
    char v3 = [(CBPeripheral *)self->_peripheral customProperty:@"Fitness"];

    if (v3)
    {
      [(CBPeripheral *)self->_peripheral setCustomProperty:@"Fitness" value:0];
      [(CBPeripheral *)self->_peripheral setCustomProperty:@"UpdateHealth" value:0];
      [(CBPeripheral *)self->_peripheral untag:*MEMORY[0x1E4F2A828]];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.bluetooth.settings.fitness-device-pairing-state-changed", 0, 0, 1u);
    }
  }
  id v5 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
  [v5 unpairPeer:self->_peripheral];
}

- (BOOL)supportsCTKD
{
  return [(CBPeripheral *)self->_peripheral hasTag:@"_CTKD_"];
}

- (BOOL)supportsANCS
{
  if ([(CBPeripheral *)self->_peripheral hasTag:@"ANCSAuthorized"]) {
    return 1;
  }
  peripheral = self->_peripheral;

  return [(CBPeripheral *)peripheral hasTag:@"ANCSUnauthorized"];
}

- (BOOL)isManagedByWallet
{
  peripheral = self->_peripheral;
  if (peripheral) {
    LOBYTE(peripheral) = [(CBPeripheral *)peripheral hasTag:@"_MANAGED_BY_WALLET_"];
  }
  return (char)peripheral;
}

- (BOOL)isManagedByAliroWallet
{
  peripheral = self->_peripheral;
  if (peripheral) {
    LOBYTE(peripheral) = [(CBPeripheral *)peripheral hasTag:@"_MANAGED_BY_ALIRO_WALLET_"];
  }
  return (char)peripheral;
}

- (BOOL)isManagedByDeviceAccess
{
  LODWORD(peripheral) = _os_feature_enabled_impl();
  if (peripheral)
  {
    peripheral = self->_peripheral;
    if (peripheral) {
      LOBYTE(peripheral) = [(CBPeripheral *)peripheral hasTag:@"DA_ASK_RETAIN_DEVICE"];
    }
    if (self->_underlyingDADevice) {
      LOBYTE(peripheral) = 1;
    }
  }
  return (char)peripheral;
}

- (BOOL)shouldDenyIncomingClassicConnection
{
  return [(CBPeripheral *)self->_peripheral hasTag:@"_DENY_INCOMING_CLASSIC_CONNECTION_"];
}

- (id)relatedFutureRadioAddress
{
  if ([(BTSDeviceLE *)self isManagedByDeviceAccess])
  {
    char v3 = [(CBPeripheral *)self->_peripheral customProperty:@"ASK_RELATED_RADIO_ADDRESS"];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)linkedRadioAddress
{
  if ([(BTSDeviceLE *)self isManagedByDeviceAccess])
  {
    char v3 = [(CBPeripheral *)self->_peripheral customProperty:@"ASK_LINKED_RADIO_ADDRESS"];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (void)setDenyIncomingClassicConnection:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BTSDeviceLE *)self shouldDenyIncomingClassicConnection];
  if (v3)
  {
    if (!v5)
    {
      peripheral = self->_peripheral;
      [(CBPeripheral *)peripheral tag:@"_DENY_INCOMING_CLASSIC_CONNECTION_"];
    }
  }
  else if (v5)
  {
    id v7 = self->_peripheral;
    [(CBPeripheral *)v7 untag:@"_DENY_INCOMING_CLASSIC_CONNECTION_"];
  }
}

- (BOOL)ancsAuthorized
{
  return [(CBPeripheral *)self->_peripheral hasTag:@"ANCSAuthorized"];
}

- (void)setANCSAuthorization:(BOOL)a3
{
  peripheral = self->_peripheral;
  BOOL v5 = !a3;
  if (a3) {
    id v6 = @"ANCSAuthorized";
  }
  else {
    id v6 = @"ANCSUnauthorized";
  }
  if (v5) {
    id v7 = @"ANCSAuthorized";
  }
  else {
    id v7 = @"ANCSUnauthorized";
  }
  [(CBPeripheral *)peripheral tag:v6];
  id v8 = self->_peripheral;

  [(CBPeripheral *)v8 untag:v7];
}

- (int)userSelectedHealthDataSyncConfig
{
  BOOL v3 = [(BTSDeviceLE *)self healthDeviceType];

  if (!v3) {
    return 2;
  }
  id v4 = [(CBPeripheral *)self->_peripheral customProperty:@"UserSelectedHealthDataSyncConfig"];
  if ([v4 isEqualToString:@"HealthDataSyncAlways"])
  {
    int v5 = 0;
  }
  else if ([v4 isEqualToString:@"HealthDataSyncWithUserConfirm"])
  {
    int v5 = 1;
  }
  else
  {
    [v4 isEqualToString:@"HealthDataSyncNever"];
    int v5 = 2;
  }

  return v5;
}

- (void)setUserSelectedHealthDataSyncConfig:(int)a3
{
  int v5 = [(BTSDeviceLE *)self healthDeviceType];

  if (v5)
  {
    id v6 = @"0";
    id v7 = @"HealthDataSyncNever";
    if (!a3)
    {
      id v7 = @"HealthDataSyncAlways";
      id v6 = @"1";
    }
    BOOL v8 = a3 == 1;
    if (a3 == 1) {
      v9 = @"HealthDataSyncWithUserConfirm";
    }
    else {
      v9 = v7;
    }
    if (v8) {
      v10 = @"1";
    }
    else {
      v10 = v6;
    }
    objc_super v11 = [(CBPeripheral *)self->_peripheral customProperty:@"UpdateHealth"];

    if (!v11) {
      [(CBPeripheral *)self->_peripheral setCustomProperty:@"UpdateHealth" value:v10];
    }
    peripheral = self->_peripheral;
    [(CBPeripheral *)peripheral setCustomProperty:@"UserSelectedHealthDataSyncConfig" value:v9];
  }
}

- (BOOL)isApplePencil:(int *)a3
{
  if ([(CBPeripheral *)self->_peripheral hasTag:@"A1603"]) {
    goto LABEL_5;
  }
  if ([(CBPeripheral *)self->_peripheral hasTag:@"A2051"])
  {
    int v5 = 1;
    goto LABEL_6;
  }
  if ([(CBPeripheral *)self->_peripheral hasTag:@"A3085"])
  {
LABEL_5:
    int v5 = 0;
    goto LABEL_6;
  }
  int v6 = [(CBPeripheral *)self->_peripheral hasTag:@"A2538"];
  if (!v6) {
    return v6;
  }
  int v5 = 2;
LABEL_6:
  *a3 = v5;
  LOBYTE(v6) = 1;
  return v6;
}

- (BOOL)doesSupportBackgroundNI
{
  return [(CBPeripheral *)self->_peripheral hasTag:@"niBackground"];
}

- (BOOL)isLimitedConnectivityDevice
{
  int v4 = 0;
  return ![(BTSDeviceLE *)self isApplePencil:&v4]
      && (([(CBPeripheral *)self->_peripheral hasTag:@"HIDDeviceUnknownBehavior"] & 1) != 0
       || ([(CBPeripheral *)self->_peripheral hasTag:@"HIDDeviceKnownPoorBehavior"] & 1) != 0);
}

- (BOOL)isFirmwareUpdateRequiredDevice
{
  return [(CBPeripheral *)self->_peripheral hasTag:@"XboxControllerRequiresFWUpdate"];
}

- (BOOL)isHIDDevice
{
  if ([(CBPeripheral *)self->_peripheral hasTag:@"IsLEKeyboard"]) {
    return 1;
  }
  peripheral = self->_peripheral;

  return [(CBPeripheral *)peripheral hasTag:@"IsLEMouse"];
}

- (BOOL)isCarPlayDevice
{
  return [(CBPeripheral *)self->_peripheral hasTag:@"_CARPLAY_DEVICE_"];
}

- (BOOL)isHealthDevice
{
  return self->healthDevice;
}

- (void)setHealthDevice:(BOOL)a3
{
  self->healthDevice = a3;
}

- (BOOL)isCTKDDevice
{
  return self->ctkdDevice;
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

- (DADevice)underlyingDADevice
{
  return self->_underlyingDADevice;
}

- (void)setUnderlyingDADevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDADevice, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);

  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
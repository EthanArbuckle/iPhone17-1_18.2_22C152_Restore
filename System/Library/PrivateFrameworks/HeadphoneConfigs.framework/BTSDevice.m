@interface BTSDevice
- (BOOL)ancsAuthorized;
- (BOOL)cloudPaired;
- (BOOL)connect;
- (BOOL)connected;
- (BOOL)doesSupportBackgroundNI;
- (BOOL)isApplePencil:(int *)a3;
- (BOOL)isCTKDDevice;
- (BOOL)isCarPlayDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirmwareUpdateRequiredDevice;
- (BOOL)isHIDDevice;
- (BOOL)isHealthDevice;
- (BOOL)isLimitedConnectivityDevice;
- (BOOL)isManagedByAliroWallet;
- (BOOL)isManagedByDeviceAccess;
- (BOOL)isManagedByWallet;
- (BOOL)isMyDevice;
- (BOOL)isTemporaryPairedDevice;
- (BOOL)isiPad;
- (BOOL)paired;
- (BOOL)shouldDenyIncomingClassicConnection;
- (BOOL)supportsANCS;
- (NSString)accessorySetupKitDisplayName;
- (NSString)linkedRadioAddress;
- (NSString)relatedFutureRadioAddress;
- (id)classicDevice;
- (id)healthDeviceType;
- (id)identifier;
- (id)name;
- (id)productName;
- (int)userSelectedHealthDataSyncConfig;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)disconnect;
- (void)setANCSAuthorization:(BOOL)a3;
- (void)setAccessorySetupKitDisplayName:(id)a3;
- (void)setCtkdDevice:(BOOL)a3;
- (void)setDenyIncomingClassicConnection:(BOOL)a3;
- (void)setHealthDevice:(BOOL)a3;
- (void)setLinkedRadioAddress:(id)a3;
- (void)setManagedByAliroWallet:(BOOL)a3;
- (void)setManagedByWallet:(BOOL)a3;
- (void)setRelatedFutureRadioAddress:(id)a3;
- (void)setSupportsBackgroundNI:(BOOL)a3;
- (void)setUserSelectedHealthDataSyncConfig:(int)a3;
- (void)unpair;
@end

@implementation BTSDevice

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BTSDevice *)self identifier];
    v7 = [v5 identifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(BTSDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)identifier
{
  return 0;
}

- (id)name
{
  return 0;
}

- (id)productName
{
  return 0;
}

- (id)healthDeviceType
{
  return 0;
}

- (BOOL)connected
{
  return 0;
}

- (BOOL)paired
{
  return 0;
}

- (BOOL)isTemporaryPairedDevice
{
  return 0;
}

- (BOOL)cloudPaired
{
  return 0;
}

- (id)classicDevice
{
  return 0;
}

- (BOOL)isHealthDevice
{
  return 0;
}

- (void)setHealthDevice:(BOOL)a3
{
}

- (int)userSelectedHealthDataSyncConfig
{
  return 2;
}

- (void)setUserSelectedHealthDataSyncConfig:(int)a3
{
}

- (BOOL)isCTKDDevice
{
  return 0;
}

- (void)setCtkdDevice:(BOOL)a3
{
}

- (BOOL)isManagedByWallet
{
  return 0;
}

- (void)setManagedByWallet:(BOOL)a3
{
}

- (BOOL)isManagedByAliroWallet
{
  return 0;
}

- (void)setManagedByAliroWallet:(BOOL)a3
{
}

- (BOOL)isManagedByDeviceAccess
{
  return 0;
}

- (BOOL)isMyDevice
{
  return 0;
}

- (BOOL)connect
{
  return 0;
}

- (void)disconnect
{
}

- (void)unpair
{
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int v5 = [(BTSDevice *)self shouldDenyIncomingClassicConnection];
  if (v5 != [v4 shouldDenyIncomingClassicConnection])
  {
    BOOL v6 = [(BTSDevice *)self shouldDenyIncomingClassicConnection];
LABEL_5:
    BOOL v8 = !v6;
    goto LABEL_6;
  }
  int v7 = [(BTSDevice *)self connected];
  if (v7 != [v4 connected])
  {
    BOOL v6 = [(BTSDevice *)self connected];
    goto LABEL_5;
  }
  int v11 = [(BTSDevice *)self paired]
     || [(BTSDevice *)self isHealthDevice]
     || [(BTSDevice *)self isManagedByDeviceAccess];
  if ([v4 paired] & 1) != 0 || (objc_msgSend(v4, "isHealthDevice")) {
    int v12 = 1;
  }
  else {
    int v12 = [v4 isManagedByDeviceAccess];
  }
  if (v12 == v11)
  {
    v13 = [(BTSDevice *)self name];
    v14 = [v4 name];
    int64_t v9 = [v13 compare:v14 options:1];

    goto LABEL_9;
  }
  BOOL v8 = v11 == 0;
LABEL_6:
  if (v8) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = -1;
  }
LABEL_9:

  return v9;
}

- (BOOL)supportsANCS
{
  return 0;
}

- (BOOL)ancsAuthorized
{
  return 0;
}

- (void)setANCSAuthorization:(BOOL)a3
{
}

- (BOOL)isApplePencil:(int *)a3
{
  return 0;
}

- (BOOL)doesSupportBackgroundNI
{
  return 0;
}

- (void)setSupportsBackgroundNI:(BOOL)a3
{
}

- (BOOL)isLimitedConnectivityDevice
{
  return 0;
}

- (BOOL)isFirmwareUpdateRequiredDevice
{
  return 0;
}

- (BOOL)isHIDDevice
{
  return 0;
}

- (BOOL)isiPad
{
  v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (BOOL)isCarPlayDevice
{
  return 0;
}

- (BOOL)shouldDenyIncomingClassicConnection
{
  return 0;
}

- (NSString)relatedFutureRadioAddress
{
  return 0;
}

- (NSString)linkedRadioAddress
{
  return 0;
}

- (void)setDenyIncomingClassicConnection:(BOOL)a3
{
}

- (NSString)accessorySetupKitDisplayName
{
  return self->_accessorySetupKitDisplayName;
}

- (void)setAccessorySetupKitDisplayName:(id)a3
{
}

- (void)setRelatedFutureRadioAddress:(id)a3
{
}

- (void)setLinkedRadioAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedRadioAddress, 0);
  objc_storeStrong((id *)&self->_relatedFutureRadioAddress, 0);

  objc_storeStrong((id *)&self->_accessorySetupKitDisplayName, 0);
}

@end
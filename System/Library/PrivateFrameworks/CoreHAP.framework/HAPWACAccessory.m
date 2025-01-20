@interface HAPWACAccessory
- (BOOL)homeKitPaired;
- (BOOL)isAirPlayAccessory;
- (BOOL)isHomeKitAccessory;
- (BOOL)pairSetupWAC;
- (BOOL)requiresOwnershipToken;
- (BOOL)supportsAirPlay;
- (BOOL)supportsCertAuth;
- (BOOL)supportsLegacyWAC;
- (BOOL)supportsTokenAuth;
- (BOOL)supportsWAC2;
- (CUWiFiDevice)cuWiFiDevice;
- (HAPWACAccessory)initWithName:(id)a3 identifier:(id)a4 category:(id)a5 ssid:(id)a6 deviceId:(id)a7 flags:(unsigned int)a8;
- (HAPWACAccessory)initWithWiFiDevice:(id)a3;
- (NSData)bssid;
- (NSData)setupHash;
- (NSDictionary)rawScanResult;
- (NSNumber)rssi;
- (NSNumber)wacCategory;
- (NSString)deviceId;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)ssid;
- (NSUUID)identifier;
- (double)discoveryTime;
- (id)description;
- (unint64_t)authFeatures;
- (unint64_t)supportedWiFiBands;
- (unint64_t)version;
- (void)__setupSupportedFlags:(unsigned int)a3;
- (void)setDiscoveryTime:(double)a3;
- (void)updateWithHAPWACAccessory:(id)a3;
@end

@implementation HAPWACAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cuWiFiDevice, 0);
  objc_storeStrong((id *)&self->_rawScanResult, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_wacCategory, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (CUWiFiDevice)cuWiFiDevice
{
  return self->_cuWiFiDevice;
}

- (void)setDiscoveryTime:(double)a3
{
  self->_discoveryTime = a3;
}

- (double)discoveryTime
{
  return self->_discoveryTime;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)authFeatures
{
  return self->_authFeatures;
}

- (BOOL)pairSetupWAC
{
  return self->_pairSetupWAC;
}

- (BOOL)homeKitPaired
{
  return self->_homeKitPaired;
}

- (unint64_t)supportedWiFiBands
{
  return self->_supportedWiFiBands;
}

- (BOOL)requiresOwnershipToken
{
  return self->_requiresOwnershipToken;
}

- (BOOL)supportsAirPlay
{
  return self->_supportsAirPlay;
}

- (NSDictionary)rawScanResult
{
  return self->_rawScanResult;
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (NSData)bssid
{
  return self->_bssid;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (NSNumber)wacCategory
{
  return self->_wacCategory;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isAirPlayAccessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_supportsAirPlay && self->_version == 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isHomeKitAccessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_version) {
    BOOL v4 = self->_authFeatures != 0;
  }
  else {
    BOOL v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)supportsCertAuth
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL pairSetupWAC = 0;
  if ((self->_authFeatures & 8) != 0) {
    BOOL pairSetupWAC = self->_pairSetupWAC;
  }
  os_unfair_lock_unlock(p_lock);
  return pairSetupWAC;
}

- (BOOL)supportsTokenAuth
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL pairSetupWAC = 0;
  if ((self->_authFeatures & 2) != 0) {
    BOOL pairSetupWAC = self->_pairSetupWAC;
  }
  os_unfair_lock_unlock(p_lock);
  return pairSetupWAC;
}

- (BOOL)supportsWAC2
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_authFeatures) {
    BOOL pairSetupWAC = self->_pairSetupWAC;
  }
  else {
    BOOL pairSetupWAC = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return pairSetupWAC;
}

- (BOOL)supportsLegacyWAC
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = (self->_authFeatures & 0xD) != 0 && !self->_pairSetupWAC;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateWithHAPWACAccessory:(id)a3
{
  id v30 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v4 = [v30 cuWiFiDevice];
  cuWiFiDevice = self->_cuWiFiDevice;
  self->_cuWiFiDevice = v4;

  v6 = [v30 name];
  name = self->_name;
  self->_name = v6;

  v8 = [v30 model];
  model = self->_model;
  self->_model = v8;

  v10 = [v30 manufacturer];
  manufacturer = self->_manufacturer;
  self->_manufacturer = v10;

  v12 = [v30 wacCategory];
  wacCategory = self->_wacCategory;
  self->_wacCategory = v12;

  v14 = [v30 rssi];
  rssi = self->_rssi;
  self->_rssi = v14;

  v16 = [v30 bssid];
  bssid = self->_bssid;
  self->_bssid = v16;

  v18 = [v30 ssid];
  ssid = self->_ssid;
  self->_ssid = v18;

  v20 = [v30 identifier];
  identifier = self->_identifier;
  self->_identifier = v20;

  v22 = [v30 setupHash];
  setupHash = self->_setupHash;
  self->_setupHash = v22;

  v24 = [v30 deviceId];
  deviceId = self->_deviceId;
  self->_deviceId = v24;

  v26 = [v30 rawScanResult];
  rawScanResult = self->_rawScanResult;
  self->_rawScanResult = v26;

  self->_supportsAirPlay = 0;
  self->_homeKitPaired = 0;
  self->_BOOL pairSetupWAC = 0;
  self->_supportedWiFiBands = 0;
  self->_authFeatures = 0;
  v28 = [v30 cuWiFiDevice];
  -[HAPWACAccessory __setupSupportedFlags:](self, "__setupSupportedFlags:", [v28 deviceIEFlags]);

  [v30 discoveryTime];
  self->_discoveryTime = v29;
  os_unfair_lock_unlock(&self->_lock);
}

- (id)description
{
  v24 = NSString;
  BOOL v29 = HAPIsInternalBuild();
  if (v29)
  {
    v3 = [(HAPWACAccessory *)self name];
  }
  else
  {
    v3 = @"<private>";
  }
  BOOL v27 = HAPIsInternalBuild();
  if (v27)
  {
    BOOL v4 = [(HAPWACAccessory *)self model];
  }
  else
  {
    BOOL v4 = @"<private>";
  }
  BOOL v23 = HAPIsInternalBuild();
  if (v23)
  {
    v5 = [(HAPWACAccessory *)self manufacturer];
  }
  else
  {
    v5 = @"<private>";
  }
  uint64_t v6 = [(HAPWACAccessory *)self wacCategory];
  BOOL v20 = HAPIsInternalBuild();
  if (v20)
  {
    id v30 = [(HAPWACAccessory *)self bssid];
  }
  else
  {
    id v30 = @"<private>";
  }
  BOOL v19 = HAPIsInternalBuild();
  v28 = v3;
  v26 = v4;
  v21 = (void *)v6;
  v22 = v5;
  if (v19)
  {
    v7 = [(HAPWACAccessory *)self ssid];
  }
  else
  {
    v7 = @"<private>";
  }
  v18 = [(HAPWACAccessory *)self identifier];
  v8 = [(HAPWACAccessory *)self deviceId];
  v9 = [(HAPWACAccessory *)self setupHash];
  if ([(HAPWACAccessory *)self supportsAirPlay]) {
    v10 = @"Yes";
  }
  else {
    v10 = @"No";
  }
  if ([(HAPWACAccessory *)self homeKitPaired]) {
    v11 = @"Yes";
  }
  else {
    v11 = @"No";
  }
  if ([(HAPWACAccessory *)self pairSetupWAC]) {
    v12 = @"Yes";
  }
  else {
    v12 = @"No";
  }
  if ([(HAPWACAccessory *)self version] == 1)
  {
    v13 = @"HAPWACV1";
  }
  else if ([(HAPWACAccessory *)self version] == 2)
  {
    v13 = @"HAPWACV2";
  }
  else
  {
    v13 = @"?";
  }
  v14 = HAPAuthFeaturesToString([(HAPWACAccessory *)self authFeatures]);
  v15 = HAPWACWiFiBandToString([(HAPWACAccessory *)self supportedWiFiBands]);
  [(HAPWACAccessory *)self discoveryTime];
  v25 = [v24 stringWithFormat:@"\n Name: %@\n Model: %@\n Manufacturer: %@\n Category: %@\n BSSID: %@\n SSID: %@\n Identifier: %@\n DeviceId: %@\n setup hash: %@\n AirPlay: %@\n HomeKit Paired: %@\n Pair Setup WAC: %@\n HomeKit Version: %@\n Auth: %@\n Supported WiFi Band(s): %@\n DiscoveryTime: %f sec\n ", v28, v26, v22, v21, v30, v7, v18, v8, v9, v10, v11, v12, v13, v14, v15, v16];

  if (v19) {
  if (v20)
  }

  if (v23) {
  if (v27)
  }

  if (v29) {

  }
  return v25;
}

- (HAPWACAccessory)initWithName:(id)a3 identifier:(id)a4 category:(id)a5 ssid:(id)a6 deviceId:(id)a7 flags:(unsigned int)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HAPWACAccessory;
  v18 = [(HAPWACAccessory *)&v23 init];
  BOOL v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_identifier, a4);
    objc_storeStrong((id *)&v19->_wacCategory, a5);
    objc_storeStrong((id *)&v19->_ssid, a6);
    objc_storeStrong((id *)&v19->_deviceId, a7);
    [(HAPWACAccessory *)v19 __setupSupportedFlags:a8];
  }

  return v19;
}

- (void)__setupSupportedFlags:(unsigned int)a3
{
  if ((a3 & 0x1000) != 0) {
    self->_supportsAirPlay = 1;
  }
  if ((a3 & 0x20000) != 0) {
    self->_supportedWiFiBands |= 1uLL;
  }
  if ((a3 & 0x10000) != 0) {
    self->_supportedWiFiBands |= 2uLL;
  }
  if ((a3 & 0x4000) != 0)
  {
    self->_version = 1;
    if ((a3 & 0x2000) == 0)
    {
LABEL_9:
      if ((a3 & 0x400000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((a3 & 0x2000) == 0)
  {
    goto LABEL_9;
  }
  self->_version = 2;
  if ((a3 & 0x400000) == 0)
  {
LABEL_10:
    if ((a3 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  self->_homeKitPaired = 1;
  if ((a3 & 0x800) != 0) {
LABEL_11:
  }
    self->_BOOL pairSetupWAC = 1;
LABEL_12:
  if ((a3 & 0x20000400) != 0) {
    self->_authFeatures |= 1uLL;
  }
  if ((a3 & 0x40000) != 0)
  {
    self->_authFeatures |= 4uLL;
    if ((a3 & 0x200) == 0)
    {
LABEL_16:
      if ((a3 & 0x100) == 0) {
        goto LABEL_17;
      }
      goto LABEL_25;
    }
  }
  else if ((a3 & 0x200) == 0)
  {
    goto LABEL_16;
  }
  self->_authFeatures |= 2uLL;
  if ((a3 & 0x100) == 0)
  {
LABEL_17:
    if ((a3 & 0x20) == 0) {
      return;
    }
LABEL_26:
    self->_requiresOwnershipToken = 1;
    return;
  }
LABEL_25:
  self->_authFeatures |= 8uLL;
  if ((a3 & 0x20) != 0) {
    goto LABEL_26;
  }
}

- (HAPWACAccessory)initWithWiFiDevice:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HAPWACAccessory;
  uint64_t v6 = [(HAPWACAccessory *)&v33 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cuWiFiDevice, a3);
    uint64_t v8 = [v5 deviceIEName];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    uint64_t v10 = [v5 deviceIEModel];
    model = v7->_model;
    v7->_model = (NSString *)v10;

    uint64_t v12 = [v5 deviceIEManufacturer];
    manufacturer = v7->_manufacturer;
    v7->_manufacturer = (NSString *)v12;

    int v14 = [v5 deviceIECategory];
    if (v14)
    {
      id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "deviceIECategory"));
    }
    else
    {
      id v15 = &unk_1F2C80BB0;
    }
    objc_storeStrong((id *)&v7->_wacCategory, v15);
    if (v14) {

    }
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "rssi"));
    rssi = v7->_rssi;
    v7->_rssi = (NSNumber *)v16;

    uint64_t v18 = [v5 bssid];
    bssid = v7->_bssid;
    v7->_bssid = (NSData *)v18;

    uint64_t v20 = [v5 ssid];
    ssid = v7->_ssid;
    v7->_ssid = (NSString *)v20;

    uint64_t v22 = [v5 identifier];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v22;

    uint64_t v24 = [v5 deviceIDSetupHash];
    setupHash = v7->_setupHash;
    v7->_setupHash = (NSData *)v24;

    id v26 = [v5 deviceIEDeviceID];
    [v26 bytes];
    BOOL v27 = [v5 deviceIEDeviceID];
    [v27 length];
    HardwareAddressToCString();

    uint64_t v28 = [NSString stringWithCString:v34 encoding:4];
    deviceId = v7->_deviceId;
    v7->_deviceId = (NSString *)v28;

    uint64_t v30 = [v5 rawScanResult];
    rawScanResult = v7->_rawScanResult;
    v7->_rawScanResult = (NSDictionary *)v30;

    v7->_supportsAirPlay = 0;
    v7->_homeKitPaired = 0;
    v7->_BOOL pairSetupWAC = 0;
    v7->_requiresOwnershipToken = 0;
    v7->_supportedWiFiBands = 0;
    v7->_authFeatures = 0;
    -[HAPWACAccessory __setupSupportedFlags:](v7, "__setupSupportedFlags:", [v5 deviceIEFlags]);
  }

  return v7;
}

@end
@interface BluetoothDevice
- ($70344DAF05348A783186C1CF166707C1)getCallManagementConfig;
- ($9BEB610D0CE1B1EDC3D89DA2464F985F)syncSettings;
- (BOOL)_isNameCached;
- (BOOL)batteryStatus:(id *)a3;
- (BOOL)cloudPaired;
- (BOOL)connected;
- (BOOL)featureCapability:(int)a3;
- (BOOL)getAACPCapabilityBit:(int)a3;
- (BOOL)getAdaptiveVolumeSupport;
- (BOOL)getAutoANCSupport;
- (BOOL)getConversationDetectSupport;
- (BOOL)getDeviceSoundProfileAllowed;
- (BOOL)getDeviceSoundProfileSupport;
- (BOOL)getSSLSupport;
- (BOOL)getWirelessSharingSpatialSupport;
- (BOOL)headTrackingAvailable;
- (BOOL)hearingAidEnabled;
- (BOOL)hearingAidEnrolled;
- (BOOL)hearingAidSupport;
- (BOOL)hearingTestSupport;
- (BOOL)inEarDetectEnabled;
- (BOOL)inEarStatusPrimary:(int *)a3 secondary:(int *)a4;
- (BOOL)isAccessory;
- (BOOL)isAppleAudioDevice;
- (BOOL)isGenuineAirPods;
- (BOOL)isGuestPairingMode;
- (BOOL)isProController;
- (BOOL)isProxCardShowedForFeature:(int)a3;
- (BOOL)isProxCardSupportedForFeature:(int)a3;
- (BOOL)isServiceSupported:(unsigned int)a3;
- (BOOL)isTemporaryPaired;
- (BOOL)magicPaired;
- (BOOL)paired;
- (BOOL)pairedDeviceNameUpdated;
- (BOOL)setAutoAnswerMode:(int)a3;
- (BOOL)setCallConfig:(id)a3;
- (BOOL)setChimeVolume:(unsigned int)a3;
- (BOOL)setClickHoldMode:(int)a3 rightMode:(int)a4;
- (BOOL)setClickHoldModes:(id)a3;
- (BOOL)setCrownRotationDirection:(int)a3;
- (BOOL)setDoubleClickMode:(int)a3;
- (BOOL)setDoubleTapAction:(unsigned int)a3;
- (BOOL)setDoubleTapActionEx:(unsigned int)a3 rightAction:(unsigned int)a4;
- (BOOL)setHeartRateMonitorEnabled:(unsigned int)a3;
- (BOOL)setInEarDetectEnabled:(BOOL)a3;
- (BOOL)setIsHidden:(BOOL)a3;
- (BOOL)setListeningMode:(unsigned int)a3;
- (BOOL)setListeningModeConfigs:(unsigned int)a3;
- (BOOL)setMicMode:(unsigned int)a3;
- (BOOL)setSingleClickMode:(int)a3;
- (BOOL)setSmartRouteMode:(unsigned __int8)a3;
- (BOOL)setSpatialAudioAllowed:(BOOL)a3;
- (BOOL)setSpatialAudioConfig:(id)a3 spatialMode:(int)a4 headTracking:(BOOL)a5;
- (BOOL)setSpatialAudioMode:(unsigned __int8)a3;
- (BOOL)setUserName:(id)a3;
- (BOOL)setUserSelectedDeviceType:(int)a3;
- (BOOL)smartRouteSupport;
- (BOOL)spatialAudioActive;
- (BOOL)spatialAudioAllowed;
- (BOOL)spatialAudioConfig:(id)a3 spatialMode:(int *)a4 headTracking:(BOOL *)a5;
- (BOOL)supportsBatteryLevel;
- (BOOL)supportsHS;
- (BTDeviceImpl)device;
- (BluetoothDevice)initWithDevice:(BTDeviceImpl *)a3 address:(id)a4;
- (id)accessoryInfo;
- (id)aclUID;
- (id)address;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getAACPCapabilityBits;
- (id)getServiceSetting:(unsigned int)a3 key:(id)a4;
- (id)gyroInformation;
- (id)name;
- (id)productName;
- (id)scoUID;
- (id)syncGroups;
- (int)accessorySettingFeatureBitMask;
- (int)autoAnswerMode;
- (int)batteryLevel;
- (int)crownRotationDirection;
- (int)doubleClickMode;
- (int)getBehaviorForHIDDevice;
- (int)getDeviceColor:(unsigned int *)a3;
- (int)getHexDeviceAddress:(id *)a3;
- (int)getLowSecurityStatus;
- (int)getStereoHFPSupport;
- (int)getUserSelectedDeviceType;
- (int)primaryBudSide:(int *)a3;
- (int)singleClickMode;
- (int)type;
- (int64_t)compare:(id)a3;
- (unint64_t)connectedServices;
- (unint64_t)connectedServicesCount;
- (unsigned)SendSetupCommand:(unsigned __int8)a3;
- (unsigned)chimeVolume;
- (unsigned)clickHoldMode:(int *)a3 rightAction:(int *)a4;
- (unsigned)clickHoldModes:(id *)a3;
- (unsigned)doubleTapAction;
- (unsigned)doubleTapActionEx:(unsigned int *)a3 rightAction:(unsigned int *)a4;
- (unsigned)doubleTapCapability;
- (unsigned)getAACPCapabilityInteger:(int)a3;
- (unsigned)getAdaptiveVolumeMode;
- (unsigned)getConnectingServiceMask;
- (unsigned)getConversationDetectMode;
- (unsigned)getDeviceAdaptiveVolumeMode;
- (unsigned)getDeviceConversationDetect;
- (unsigned)getHeartRateMonitorEnabled;
- (unsigned)getSSLMode;
- (unsigned)getSpatialAudioPlatformSupport;
- (unsigned)listeningMode;
- (unsigned)listeningModeConfigs;
- (unsigned)majorClass;
- (unsigned)micMode;
- (unsigned)minorClass;
- (unsigned)productId;
- (unsigned)smartRouteMode;
- (unsigned)spatialAudioMode;
- (unsigned)vendorId;
- (unsigned)vendorIdSrc;
- (void)_clearName;
- (void)acceptSSP:(int64_t)a3;
- (void)accessorySettingFeatureBitMask;
- (void)autoAnswerMode;
- (void)chimeVolume;
- (void)connect;
- (void)connectWithServices:(unsigned int)a3;
- (void)crownRotationDirection;
- (void)dealloc;
- (void)disconnect;
- (void)doubleClickMode;
- (void)doubleTapAction;
- (void)doubleTapCapability;
- (void)endVoiceCommand;
- (void)getAdaptiveVolumeSupport;
- (void)getAutoANCSupport;
- (void)getBehaviorForHIDDevice;
- (void)getCallManagementConfig;
- (void)getConversationDetectSupport;
- (void)getDeviceAdaptiveVolumeMode;
- (void)getDeviceConversationDetect;
- (void)getDeviceSoundProfileAllowed;
- (void)getDeviceSoundProfileSupport;
- (void)getHeartRateMonitorEnabled;
- (void)getSSLMode;
- (void)getSSLSupport;
- (void)getSpatialAudioPlatformSupport;
- (void)getStereoHFPSupport;
- (void)getWirelessSharingSpatialSupport;
- (void)gyroInformation;
- (void)hearingAidEnabled;
- (void)hearingAidEnrolled;
- (void)inEarDetectEnabled;
- (void)isGenuineAirPods;
- (void)isGuestPairingMode;
- (void)listeningMode;
- (void)listeningModeConfigs;
- (void)micMode;
- (void)pairedDeviceNameUpdated;
- (void)setAdaptiveVolumeMode:(int)a3;
- (void)setConnectingServicemask:(unsigned int)a3;
- (void)setConversationDetectMode:(int)a3;
- (void)setDevice:(BTDeviceImpl *)a3;
- (void)setDeviceAdaptiveVolumeMode:(int)a3;
- (void)setDeviceConversationDetect:(int)a3;
- (void)setDeviceSoundProfileAllowed:(BOOL)a3;
- (void)setGuestPairingMode:(BOOL)a3;
- (void)setHearingAidEnabled:(BOOL)a3;
- (void)setHearingAidEnrolled:(BOOL)a3;
- (void)setPIN:(id)a3;
- (void)setProxCardShowedForFeature:(int)a3 showed:(BOOL)a4;
- (void)setSSLMode:(int)a3;
- (void)setServiceSetting:(unsigned int)a3 key:(id)a4 value:(id)a5;
- (void)setSyncGroup:(int)a3 enabled:(BOOL)a4;
- (void)setSyncSettings:(id)a3;
- (void)singleClickMode;
- (void)smartRouteMode;
- (void)spatialAudioAllowed;
- (void)spatialAudioMode;
- (void)startVoiceCommand;
- (void)unpair;
@end

@implementation BluetoothDevice

- (BluetoothDevice)initWithDevice:(BTDeviceImpl *)a3 address:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BluetoothDevice;
  v6 = [(BluetoothDevice *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(BluetoothDevice *)v6 setDevice:a3];
    v7->_address = (NSString *)a4;
    v7->_connectingServiceMask = 0;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BluetoothDevice;
  [(BluetoothDevice *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [(NSString *)self->_name copyWithZone:a3];
  v5[3] = [(NSString *)self->_address copyWithZone:a3];
  [v5 setDevice:self->_device];
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = [(BluetoothDevice *)self name];
  uint64_t v5 = [a3 name];
  return [v4 compare:v5 options:1];
}

- (BTDeviceImpl)device
{
  return self->_device;
}

- (void)setDevice:(BTDeviceImpl *)a3
{
  if (self->_device != a3) {
    self->_device = a3;
  }
}

- (void)_clearName
{
  self->_name = 0;
}

- (BOOL)_isNameCached
{
  return self->_name != 0;
}

- (id)name
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  name = self->_name;
  if (!name)
  {
    uint64_t v22 = 0;
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
    long long v7 = 0u;
    if (BTDeviceGetName()
      || (uint64_t v5 = (NSString *)[NSString stringWithUTF8String:&v7]) == 0)
    {
      if (BTDeviceGetDefaultName()) {
        return [(BluetoothDevice *)self address];
      }
      else {
        return (id)[NSString stringWithUTF8String:&v7];
      }
    }
    else
    {
      name = v5;
      self->_name = v5;
    }
  }
  return name;
}

- (id)productName
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  productName = self->_productName;
  if (!productName)
  {
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
    if (BTDeviceGetProductName()) {
      return [(BluetoothDevice *)self address];
    }
    id v4 = (NSString *)[NSString stringWithUTF8String:&v6];
    if (!v4)
    {
      return [(BluetoothDevice *)self address];
    }
    else
    {
      productName = v4;
      self->_productName = v4;
    }
  }
  return productName;
}

- (id)address
{
  id result = self->_address;
  if (!result)
  {
    id result = (id)AddressForBTDevice();
    self->_address = (NSString *)result;
  }
  return result;
}

- (int)type
{
  if (BTDeviceGetDeviceType()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)majorClass
{
  if (BTDeviceGetDeviceClass()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)minorClass
{
  if (BTDeviceGetDeviceClass()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"\"%@\" %@", -[BluetoothDevice name](self, "name"), -[BluetoothDevice address](self, "address")];
}

- (id)scoUID
{
  return (id)[NSString stringWithFormat:@"%@%@", -[BluetoothDevice address](self, "address"), @"-tsco"];
}

- (id)aclUID
{
  return (id)[NSString stringWithFormat:@"%@%@", -[BluetoothDevice address](self, "address"), @"-tacl"];
}

- (unsigned)vendorId
{
  if (BTDeviceGetDeviceId()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)vendorIdSrc
{
  if (BTDeviceGetDeviceId()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (unsigned)productId
{
  if (BTDeviceGetDeviceId()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (BOOL)paired
{
  return 0;
}

- (BOOL)cloudPaired
{
  return 0;
}

- (BOOL)magicPaired
{
  return 0;
}

- (BOOL)connected
{
  return 0;
}

- (BOOL)isTemporaryPaired
{
  return 0;
}

- (unint64_t)connectedServices
{
  return 0;
}

- (unint64_t)connectedServicesCount
{
  return 0;
}

- (BOOL)supportsBatteryLevel
{
  return BTAccessoryManagerGetDeviceBatteryLevel() == 0;
}

- (int)batteryLevel
{
  if (BTAccessoryManagerGetDeviceBatteryLevel()) {
    return -1;
  }
  else {
    return 0;
  }
}

- (BOOL)batteryStatus:(id *)a3
{
  if (a3)
  {
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    LOBYTE(v4) = BTAccessoryManagerGetDeviceBatteryStatus() == 0;
  }
  else
  {
    uint64_t v5 = sharedBluetoothManagerLogComponent();
    BOOL v4 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[BluetoothDevice batteryStatus:]();
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (int)primaryBudSide:(int *)a3
{
  uint64_t v5 = [+[BluetoothManager sharedInstance] _accessoryManager];
  long long v6 = [(BluetoothDevice *)self device];
  return MEMORY[0x270F4AA20](v5, v6, a3);
}

- (BOOL)setIsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    long long v6 = "no";
    if (v3) {
      long long v6 = "yes";
    }
    int v10 = 136315138;
    long long v11 = v6;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set isHidden : %s", (uint8_t *)&v10, 0xCu);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int IsHidden = BTAccessoryManagerSetIsHidden();
  if (IsHidden)
  {
    long long v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setIsHidden:]();
    }
  }
  return IsHidden == 0;
}

- (BOOL)inEarDetectEnabled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v3 = BTAccessoryManagerGetInEarDetectionEnable();
  BOOL v4 = sharedBluetoothManagerLogComponent();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice inEarDetectEnabled]();
    }
    return 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = 1;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "inEarDetectEnabled : %d", buf, 8u);
    }
    return 1;
  }
}

- (BOOL)setInEarDetectEnabled:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = a3 << 31 >> 31;
  uint64_t v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set inEarDetectEnabled : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSetInEarDetectionEnable();
  if (v6)
  {
    long long v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setInEarDetectEnabled:]();
    }
  }
  return v6 == 0;
}

- (BOOL)setSpatialAudioAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Set setSpatialAudioAllowed : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSpatialAudioAllowed();
  if (v6)
  {
    long long v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setSpatialAudioAllowed:]();
    }
  }
  return v6 == 0;
}

- (BOOL)spatialAudioAllowed
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int SpatialAudioAllowed = BTAccessoryManagerGetSpatialAudioAllowed();
  int v4 = sharedBluetoothManagerLogComponent();
  uint64_t v5 = v4;
  if (SpatialAudioAllowed)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice spatialAudioAllowed]();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = 0;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Spatial Audio User selection : %d", buf, 8u);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)spatialAudioActive
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int SpatialAudioActive = BTAccessoryManagerGetSpatialAudioActive();
  int v4 = sharedBluetoothManagerLogComponent();
  uint64_t v5 = v4;
  if (SpatialAudioActive)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice spatialAudioAllowed]();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = 0;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Spatial Audio Active  : %d", buf, 8u);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)setSpatialAudioMode:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set SpatialAudioMode : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSpatialAudioConfig();
  if (v6)
  {
    long long v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setSpatialAudioMode:]();
    }
  }
  return v6 == 0;
}

- (unsigned)spatialAudioMode
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int SpatialAudioConfig = BTAccessoryManagerGetSpatialAudioConfig();
  int v4 = sharedBluetoothManagerLogComponent();
  uint64_t v5 = v4;
  if (SpatialAudioConfig)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice spatialAudioMode]();
    }
    return 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v9 = 255;
      __int16 v10 = 1024;
      int v11 = -1;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Audio : %d Head Tracking %d", buf, 0xEu);
    }
    return -1;
  }
}

- (BOOL)setSpatialAudioConfig:(id)a3 spatialMode:(int)a4 headTracking:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v9 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = a3;
    __int16 v15 = 1024;
    int v16 = a4;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl(&dword_2129B4000, v9, OS_LOG_TYPE_DEFAULT, "set Spatial Audio Config : [%@] %d head Tracking %d", (uint8_t *)&v13, 0x18u);
  }
  if (!a3) {
    goto LABEL_7;
  }
  [a3 UTF8String];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (!BTAccessoryManagerSpatialAudioConfig())
  {
    LOBYTE(v11) = 1;
    return v11;
  }
  __int16 v10 = sharedBluetoothManagerLogComponent();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    -[BluetoothDevice setSpatialAudioMode:]();
LABEL_7:
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)headTrackingAvailable
{
  return 1;
}

- (BOOL)spatialAudioConfig:(id)a3 spatialMode:(int *)a4 headTracking:(BOOL *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *a4 = 255;
  if (!a3) {
    goto LABEL_5;
  }
  [a3 UTF8String];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetSpatialAudioConfig())
  {
    int v9 = sharedBluetoothManagerLogComponent();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      -[BluetoothDevice spatialAudioMode]();
LABEL_5:
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    *a5 = 1;
    BOOL v11 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *a4;
      BOOL v13 = *a5;
      *(_DWORD *)buf = 138412802;
      id v16 = a3;
      __int16 v17 = 1024;
      int v18 = v12;
      __int16 v19 = 1024;
      BOOL v20 = v13;
      _os_log_impl(&dword_2129B4000, v11, OS_LOG_TYPE_DEFAULT, "get SpatialAudio Config : [%@] %d Head Tracking %d", buf, 0x18u);
    }
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)setSmartRouteMode:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set smartRouteMode : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSmartRouteMode();
  if (v6)
  {
    long long v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setSmartRouteMode:]();
    }
  }
  return v6 == 0;
}

- (unsigned)smartRouteMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int SmartRouteMode = BTAccessoryManagerGetSmartRouteMode();
  int v4 = sharedBluetoothManagerLogComponent();
  BOOL v5 = v4;
  if (SmartRouteMode)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice smartRouteMode]();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "Manual";
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "smart Routing : %s", buf, 0xCu);
  }
  return 2;
}

- (BOOL)smartRouteSupport
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  BTAccessoryManagerGetSmartRouteSupport();
  int v3 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "NOT Supported";
    _os_log_impl(&dword_2129B4000, v3, OS_LOG_TYPE_INFO, "Smart Routing : %s", buf, 0xCu);
  }
  return 0;
}

- (BOOL)inEarStatusPrimary:(int *)a3 secondary:(int *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *a3 = 3;
  *a4 = 3;
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v7 = BTAccessoryManagerGetInEarStatus();
  int v8 = sharedBluetoothManagerLogComponent();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice inEarStatusPrimary:secondary:]();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *a3;
    int v11 = *a4;
    v13[0] = 67109376;
    v13[1] = v10;
    __int16 v14 = 1024;
    int v15 = v11;
    _os_log_impl(&dword_2129B4000, v9, OS_LOG_TYPE_DEFAULT, "Retrieved inEarStatus Primary : %u, Secondary : %u", (uint8_t *)v13, 0xEu);
  }
  return v7 == 0;
}

- (unsigned)SendSetupCommand:(unsigned __int8)a3
{
  if (a3 == 3)
  {
    int v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      BOOL v5 = "SendSetupCommand Stop";
      int v6 = (uint8_t *)&v8;
      goto LABEL_7;
    }
LABEL_8:
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    return BTAccessoryManagerSetupCommand();
  }
  if (a3 == 1)
  {
    int v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      BOOL v5 = "SendSetupCommand Start";
      int v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 0;
}

- (unsigned)micMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int MicMode = BTAccessoryManagerGetMicMode();
  int v4 = sharedBluetoothManagerLogComponent();
  BOOL v5 = v4;
  if (MicMode)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice micMode]();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = 0;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "micMode : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setMicMode:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set micMode : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSetMicMode();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setMicMode:]();
    }
  }
  return v6 == 0;
}

- (unsigned)doubleTapAction
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetDoubleTapAction())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice doubleTapAction]();
    }
  }
  int v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = 1;
    _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_INFO, "doubleTapAction : %d", buf, 8u);
  }
  return 1;
}

- (BOOL)setDoubleTapAction:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set doubleTapAction : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSetDoubleTapAction();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setDoubleTapAction:]();
    }
  }
  return v6 == 0;
}

- (unsigned)doubleTapCapability
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetDoubleTapCapability())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice doubleTapCapability]();
    }
  }
  int v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = 0;
    _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_INFO, "doubleTapCapability : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)featureCapability:(int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetFeatureCapability())
  {
    BOOL v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice featureCapability:]();
    }
  }
  int v6 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v9 = a3;
    __int16 v10 = 1024;
    int v11 = 0;
    _os_log_impl(&dword_2129B4000, v6, OS_LOG_TYPE_INFO, "%d capability : %d", buf, 0xEu);
  }
  return 0;
}

- (unsigned)doubleTapActionEx:(unsigned int *)a3 rightAction:(unsigned int *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  unsigned int DoubleTapAction = BTAccessoryManagerGetDoubleTapActionEx();
  if (DoubleTapAction)
  {
    uint64_t v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice doubleTapActionEx:rightAction:]();
    }
  }
  int v9 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unsigned int v10 = *a3;
    unsigned int v11 = *a4;
    v13[0] = 67109376;
    v13[1] = v10;
    __int16 v14 = 1024;
    unsigned int v15 = v11;
    _os_log_impl(&dword_2129B4000, v9, OS_LOG_TYPE_INFO, "doubleTapActionEx Left : %d, Right : %d", (uint8_t *)v13, 0xEu);
  }
  return DoubleTapAction;
}

- (BOOL)setDoubleTapActionEx:(unsigned int)a3 rightAction:(unsigned int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v7 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109376;
    v11[1] = a3;
    __int16 v12 = 1024;
    unsigned int v13 = a4;
    _os_log_impl(&dword_2129B4000, v7, OS_LOG_TYPE_INFO, "Set doubleTapActionEx Left : %d, Right : %d", (uint8_t *)v11, 0xEu);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v8 = BTAccessoryManagerSetDoubleTapActionEx();
  if (v8)
  {
    int v9 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setDoubleTapActionEx:rightAction:]();
    }
  }
  return v8 == 0;
}

- (unsigned)listeningMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetControlCommand())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice listeningMode]();
    }
  }
  int v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = 0;
    _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_INFO, "listening mode : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setListeningMode:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set listening mode : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setListeningMode:]();
    }
  }
  return v6 == 0;
}

- (BOOL)setHeartRateMonitorEnabled:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set Heart Rate Monitor State : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setHeartRateMonitorEnabled:]();
    }
  }
  return v6 == 0;
}

- (unsigned)getHeartRateMonitorEnabled
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetControlCommand())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getHeartRateMonitorEnabled]();
    }
  }
  int v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = 0;
    _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_INFO, "HRM state : %d", buf, 8u);
  }
  return 0;
}

- (unsigned)listeningModeConfigs
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetControlCommand())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice listeningModeConfigs]();
    }
  }
  int v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = 0;
    _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_INFO, "listening mode configs : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setListeningModeConfigs:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set listening mode configs : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setListeningModeConfigs:]();
    }
  }
  return v6 == 0;
}

- (int)singleClickMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetControlCommand())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice singleClickMode]();
    }
  }
  int v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = 0;
    _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_INFO, "single click mode : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setSingleClickMode:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set single click mode : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setSingleClickMode:]();
    }
  }
  return v6 == 0;
}

- (int)doubleClickMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetControlCommand())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice doubleClickMode]();
    }
  }
  int v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = 0;
    _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_INFO, "double click mode : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setDoubleClickMode:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set double click mode : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setDoubleClickMode:]();
    }
  }
  return v6 == 0;
}

- (unsigned)clickHoldModes:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(void *)&a3->int var0 = 0;
  *(void *)&a3->int var2 = 0;
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  unsigned int ControlCommand = BTAccessoryManagerGetControlCommand();
  if (ControlCommand)
  {
    int v6 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice clickHoldModes:]();
    }
  }
  a3->int var0 = 0;
  *(int8x8_t *)&a3->int var1 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(0), (uint32x2_t)0xFFFFFFF0FFFFFFF8), (int8x8_t)0xFF000000FFLL);
  a3->int var3 = 0;
  int v7 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int var0 = a3->var0;
    int var1 = a3->var1;
    int var2 = a3->var2;
    int var3 = a3->var3;
    *(_DWORD *)buf = 67109888;
    int v14 = var0;
    __int16 v15 = 1024;
    int v16 = var1;
    __int16 v17 = 1024;
    int v18 = var2;
    __int16 v19 = 1024;
    int v20 = var3;
    _os_log_impl(&dword_2129B4000, v7, OS_LOG_TYPE_INFO, "Click Hold Modes: right 0x%02X, left 0x%02X, prevRightMode 0x%02X, prevLeftMode 0x%02X", buf, 0x1Au);
  }
  return ControlCommand;
}

- (unsigned)clickHoldMode:(int *)a3 rightAction:(int *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  unsigned int ControlCommand = BTAccessoryManagerGetControlCommand();
  if (ControlCommand)
  {
    uint64_t v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice clickHoldModes:]();
    }
  }
  *a3 = 0;
  *a4 = 0;
  int v9 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = *a3;
    int v11 = *a4;
    *(_DWORD *)buf = 67109376;
    int v14 = v10;
    __int16 v15 = 1024;
    int v16 = v11;
    _os_log_impl(&dword_2129B4000, v9, OS_LOG_TYPE_INFO, "click hold leftMode : %d rightMode : %d", buf, 0xEu);
  }
  return ControlCommand;
}

- (BOOL)setClickHoldMode:(int)a3 rightMode:(int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v7 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109376;
    v11[1] = a3;
    __int16 v12 = 1024;
    int v13 = a4;
    _os_log_impl(&dword_2129B4000, v7, OS_LOG_TYPE_INFO, "Set click hold leftMode : %d rightMode : %d", (uint8_t *)v11, 0xEu);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v8 = BTAccessoryManagerSendControlCommand();
  if (v8)
  {
    int v9 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setClickHoldMode:rightMode:]();
    }
  }
  return v8 == 0;
}

- (BOOL)setClickHoldModes:(id)a3
{
  int var2 = a3.var2;
  int var0 = a3.var0;
  uint64_t v19 = *MEMORY[0x263EF8340];
  int var1 = a3.var1;
  int var3 = a3.var3;
  int v8 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109888;
    v12[1] = var1;
    __int16 v13 = 1024;
    int v14 = var3;
    __int16 v15 = 1024;
    int v16 = var0;
    __int16 v17 = 1024;
    int v18 = var2;
    _os_log_impl(&dword_2129B4000, v8, OS_LOG_TYPE_INFO, "Set click hold currentLeftMode : %d previousLeftMode : %d currentRightMode : %d previousRightMode %d", (uint8_t *)v12, 0x1Au);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v9 = BTAccessoryManagerSendControlCommand();
  if (v9)
  {
    int v10 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setClickHoldMode:rightMode:]();
    }
  }
  return v9 == 0;
}

- (int)crownRotationDirection
{
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetControlCommand())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice crownRotationDirection]();
    }
  }
  return 0;
}

- (BOOL)setCrownRotationDirection:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set crown rotation dir : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setCrownRotationDirection:]();
    }
  }
  return v6 == 0;
}

- (unsigned)chimeVolume
{
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetControlCommand())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice chimeVolume]();
    }
  }
  return 0;
}

- (BOOL)setChimeVolume:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set chime volume : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setChimeVolume:]();
    }
  }
  return v6 == 0;
}

- (int)autoAnswerMode
{
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetControlCommand())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice autoAnswerMode]();
    }
  }
  return 0;
}

- (BOOL)setAutoAnswerMode:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Set auto answer mode : %d", (uint8_t *)v9, 8u);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    int v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setAutoAnswerMode:]();
    }
  }
  return v6 == 0;
}

- (int)accessorySettingFeatureBitMask
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetSettingFeatureBitMask())
  {
    int v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice accessorySettingFeatureBitMask]();
    }
  }
  int v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = 0;
    _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_INFO, "Accessory feature bitmask : %x", buf, 8u);
  }
  return 0;
}

- (BOOL)pairedDeviceNameUpdated
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  memset(v12, 0, sizeof(v12));
  if (BTDeviceGetName())
  {
LABEL_2:
    LOBYTE(v3) = 0;
    return v3;
  }
  uint64_t v3 = [NSString stringWithUTF8String:v12];
  if (!v3) {
    return v3;
  }
  int v4 = (void *)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    int v6 = sharedBluetoothManagerLogComponent();
    LODWORD(v3) = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    [(BluetoothDevice *)(uint64_t)v4 pairedDeviceNameUpdated];
    goto LABEL_2;
  }
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    int v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = [v4 length];
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Magic paired device name updated to %@ (%lu)", (uint8_t *)&v8, 0x16u);
  }
  [(BluetoothDevice *)self _clearName];
  self->_name = (NSString *)[v4 copy];
  LOBYTE(v3) = 1;
  return v3;
}

- (id)accessoryInfo
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = malloc_type_malloc(0x1F40uLL, 0xAFA720BAuLL);
  if (!v3) {
    return (id)MEMORY[0x263EFFA78];
  }
  int v4 = v3;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int AccessoryInfo = BTAccessoryManagerGetAccessoryInfo();
  if (AccessoryInfo || v17 == 0)
  {
    BOOL v9 = 0;
    int v8 = 0;
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v4);
    int v8 = (void *)[MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v16];
    BOOL v9 = v16 != 0;
  }
  free(v4);
  if (!AccessoryInfo && !v9)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v11 = sharedBluetoothManagerLogComponent();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    uint64_t v13 = v16;
    if (v12)
    {
      *(_DWORD *)buf = 67109378;
      int v19 = AccessoryInfo;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_error_impl(&dword_2129B4000, v11, OS_LOG_TYPE_ERROR, "BTAccessoryManagerGetAccessoryInfo result %d, JSON error %@", buf, 0x12u);
      uint64_t v13 = v16;
    }
  }
  BOOL v14 = !AccessoryInfo && v13 == 0;
  if (v14 && [v8 count]) {
    return (id)[v8 copy];
  }
  else {
    return (id)MEMORY[0x263EFFA78];
  }
}

- (BOOL)getAACPCapabilityBit:(int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v5 = malloc_type_malloc(0x3E8uLL, 0xC17A1536uLL);
  if (v5)
  {
    int v6 = v5;
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    BTAccessoryManagerGetAACPCapabilityBits();
    uint64_t v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v10 = a3;
      __int16 v11 = 1024;
      int v12 = 0;
      _os_log_impl(&dword_2129B4000, v7, OS_LOG_TYPE_DEFAULT, "getAACPCapabilityBit: bit %d retval %d", buf, 0xEu);
    }
    free(v6);
  }
  return 0;
}

- (id)getAACPCapabilityBits
{
  id result = malloc_type_malloc(0x3E8uLL, 0x58670634uLL);
  if (result)
  {
    id v4 = result;
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    BTAccessoryManagerGetAACPCapabilityBits();
    free(v4);
    return (id)[0 copy];
  }
  return result;
}

- (unsigned)getAACPCapabilityInteger:(int)a3
{
  if (a3 > 0xFF) {
    return 3;
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetAACPCapabilityInteger())
  {
    BOOL v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getAACPCapabilityInteger:]();
    }
  }
  return 0;
}

- (BOOL)isAccessory
{
  return 0;
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int SupportedServices = BTDeviceGetSupportedServices();
  BOOL v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v8 = a3;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 1024;
    int v12 = SupportedServices;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Asking for service 0x%x supported, services 0x%x, result %d", buf, 0x14u);
  }
  return 0;
}

- (id)getServiceSetting:(unsigned int)a3 key:(id)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_msgSend(a4, "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  if (BTDeviceGetServiceSettings()) {
    return 0;
  }
  else {
    return (id)[[NSString alloc] initWithUTF8String:&v5];
  }
}

- (void)setServiceSetting:(unsigned int)a3 key:(id)a4 value:(id)a5
{
  [a4 UTF8String];
  [a5 UTF8String];
  if (BTDeviceSetServiceSettings())
  {
    uint64_t v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setServiceSetting:key:value:](self, v7);
    }
  }
}

- (void)connect
{
  uint64_t v3 = +[BluetoothManager sharedInstance];
  [(BluetoothManager *)v3 connectDevice:self];
}

- (void)connectWithServices:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v5 = +[BluetoothManager sharedInstance];
  [(BluetoothManager *)v5 connectDevice:self withServices:v3];
}

- (void)disconnect
{
  uint64_t v3 = +[BluetoothManager sharedInstance];
  [(BluetoothManager *)v3 disconnectDevice:self];
}

- (void)setPIN:(id)a3
{
  long long v5 = +[BluetoothManager sharedInstance];
  [(BluetoothManager *)v5 setPincode:a3 forDevice:self];
}

- (void)acceptSSP:(int64_t)a3
{
  long long v5 = +[BluetoothManager sharedInstance];
  [(BluetoothManager *)v5 acceptSSP:a3 forDevice:self];
}

- (void)unpair
{
  uint64_t v3 = +[BluetoothManager sharedInstance];
  [(BluetoothManager *)v3 unpairDevice:self];
}

- (void)startVoiceCommand
{
  uint64_t v3 = +[BluetoothManager sharedInstance];
  [(BluetoothManager *)v3 startVoiceCommand:self];
}

- (void)endVoiceCommand
{
  uint64_t v3 = +[BluetoothManager sharedInstance];
  [(BluetoothManager *)v3 endVoiceCommand:self];
}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)syncSettings
{
  BTDeviceGetSyncSettings();
  uint32x4_t v2 = vmovl_u16((uint16x4_t)(*(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(0) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFFFFFDFFFCFFFELL) & 0xFF01FF01FF01FF01));
  v3.i64[0] = v2.u32[0];
  v3.i64[1] = v2.u32[1];
  v4.i64[0] = 255;
  v4.i64[1] = 255;
  uint64x2_t v5 = (uint64x2_t)vandq_s8(v3, v4);
  v3.i64[0] = v2.u32[2];
  v3.i64[1] = v2.u32[3];
  int8x16_t v6 = vorrq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_2129C7580), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, v4), (uint64x2_t)xmmword_2129C7570));
  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
}

- (void)setSyncSettings:(id)a3
{
}

- (id)syncGroups
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint32x4_t v2 = (void *)[MEMORY[0x263EFF980] array];
  bzero(v4, 0x400uLL);
  BTDeviceGetGroups();
  return v2;
}

- (void)setSyncGroup:(int)a3 enabled:(BOOL)a4
{
}

- (BOOL)isAppleAudioDevice
{
  uint64_t IsAppleAudioDevice = BTDeviceIsAppleAudioDevice();
  if (IsAppleAudioDevice) {
    NSLog(&cfstr_BtmFailedToChe.isa, IsAppleAudioDevice);
  }
  return 0;
}

- (BOOL)supportsHS
{
  uint64_t v2 = BTDeviceSupportsHS();
  if (v2) {
    NSLog(&cfstr_BtmFailedToChe_0.isa, v2);
  }
  return 0;
}

- (BOOL)isProController
{
  uint64_t IsProController = BTDeviceIsProController();
  if (IsProController) {
    NSLog(&cfstr_BtmFailedToChe_1.isa, IsProController);
  }
  return 0;
}

- (BOOL)setUserName:(id)a3
{
  if (!-[NSString isEqualToString:](self->_name, "isEqualToString:"))
  {
    [a3 cStringUsingEncoding:4];
    uint64_t v5 = BTDeviceSetUserName();
    if (v5)
    {
      NSLog(&cfstr_BtmFailedToSet.isa, v5);
      return 0;
    }
    [(BluetoothDevice *)self _clearName];
    self->_name = (NSString *)[a3 copy];
  }
  return 1;
}

- (void)setConnectingServicemask:(unsigned int)a3
{
  self->_connectingServiceMask = a3;
}

- (unsigned)getConnectingServiceMask
{
  return self->_connectingServiceMask;
}

- (int)getLowSecurityStatus
{
  uint64_t LowSecurityStatus = BTDeviceGetLowSecurityStatus();
  if (LowSecurityStatus) {
    NSLog(&cfstr_BtmFailedToChe_2.isa, LowSecurityStatus);
  }
  return 0;
}

- (int)getBehaviorForHIDDevice
{
  if (BTDeviceGetHIDDeviceBehavior())
  {
    uint64_t v2 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getBehaviorForHIDDevice]();
    }
  }
  return 0;
}

- (int)getStereoHFPSupport
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetStereoHFPSupport())
  {
    int8x16_t v3 = sharedBluetoothManagerLogComponent();
    int result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (result)
    {
      -[BluetoothDevice getStereoHFPSupport]();
      return 0;
    }
  }
  else
  {
    uint64_t v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "spatial not supported";
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Support for Stereo HFP : %s", buf, 0xCu);
    }
    return 0;
  }
  return result;
}

- (BOOL)getDeviceSoundProfileSupport
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int DeviceSoundProfileSupport = BTAccessoryManagerGetDeviceSoundProfileSupport();
  int8x16_t v4 = sharedBluetoothManagerLogComponent();
  uint64_t v5 = v4;
  if (DeviceSoundProfileSupport)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice getDeviceSoundProfileSupport]();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v9 = "NOT Supported";
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Accessory support for Spatial Profile: : %s", buf, 0xCu);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)getDeviceSoundProfileAllowed
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int DeviceSoundProfileAllowed = BTAccessoryManagerGetDeviceSoundProfileAllowed();
  int8x16_t v4 = sharedBluetoothManagerLogComponent();
  uint64_t v5 = v4;
  if (DeviceSoundProfileAllowed)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice getDeviceSoundProfileAllowed]();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v9 = "NOT Allowed";
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Accessory Allowed for Spatial Profile: %s", buf, 0xCu);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)setDeviceSoundProfileAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "NOT Allowed";
    if (v3) {
      BOOL v6 = "Allowed";
    }
    int v8 = 136315138;
    __int16 v9 = v6;
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Accessory Allowed for Spatial Profile: %s", (uint8_t *)&v8, 0xCu);
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerSetDeviceSoundProfileAllowed())
  {
    uint64_t v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getDeviceSoundProfileAllowed]();
    }
  }
}

- (unsigned)getSpatialAudioPlatformSupport
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int SpatialAudioPlatformSupport = BTAccessoryManagerGetSpatialAudioPlatformSupport();
  int8x16_t v4 = sharedBluetoothManagerLogComponent();
  uint64_t v5 = v4;
  if (SpatialAudioPlatformSupport)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getSpatialAudioPlatformSupport]();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "NOT Supported";
    _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Platform Spatial Audio Support : %s", buf, 0xCu);
  }
  return 2;
}

- (int)getUserSelectedDeviceType
{
  if (BTDeviceGetUserSelectedDeviceType()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (BOOL)setUserSelectedDeviceType:(int)a3
{
  uint64_t v3 = BTDeviceSetUserSelectedDeviceType();
  int v4 = v3;
  if (v3) {
    NSLog(&cfstr_BtmFailedToSet_0.isa, v3);
  }
  return v4 == 0;
}

- (id)gyroInformation
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetGyroInformation())
  {
    int v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice gyroInformation]();
    }
  }
  else
  {
    uint64_t v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v8 = v3;
      __int16 v9 = 1024;
      int v10 = 0;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "gyroInformation - Generated gyro information %@ from data with length %u", buf, 0x12u);
    }
  }
  return v3;
}

- (int)getHexDeviceAddress:(id *)a3
{
  [(NSString *)self->_address UTF8String];
  return BTDeviceAddressFromString();
}

- (int)getDeviceColor:(unsigned int *)a3
{
  uint64_t v5 = [+[BluetoothManager sharedInstance] _accessoryManager];
  BOOL v6 = [(BluetoothDevice *)self device];
  return MEMORY[0x270F4A9B0](v5, v6, a3);
}

- (BOOL)isGenuineAirPods
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int IsGenuineAirPods = BTAccessoryManagerIsGenuineAirPods();
  int v4 = sharedBluetoothManagerLogComponent();
  uint64_t v5 = v4;
  if (IsGenuineAirPods)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice isGenuineAirPods]();
    }
    return 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = -1;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Is Genuine AirPods : %d", buf, 8u);
    }
    return 1;
  }
}

- ($70344DAF05348A783186C1CF166707C1)getCallManagementConfig
{
  int v5 = 0;
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  if (BTAccessoryManagerGetCallManagementConfig())
  {
    uint64_t v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getCallManagementConfig]();
    }
    BYTE1(v5) = 0;
  }
  return ($70344DAF05348A783186C1CF166707C1)((unint64_t)*(unsigned __int16 *)((char *)&v5 + 1) << 32);
}

- (BOOL)setCallConfig:(id)a3
{
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v4 = BTAccessoryManagerSendControlCommand();
  if (v4)
  {
    int v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setCallConfig:]();
    }
  }
  return v4 == 0;
}

- (unsigned)getDeviceAdaptiveVolumeMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && ([+[BluetoothManager sharedInstance] _accessoryManager], [(BluetoothDevice *)self device], BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    uint64_t v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getDeviceAdaptiveVolumeMode]();
    }
  }
  else
  {
    int v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = 0;
      _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_DEFAULT, "Adaptive Volume: Get Mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setDeviceAdaptiveVolumeMode:(int)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    int v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Adaptive Volume: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerSendControlCommand())
    {
      BOOL v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice setDeviceAdaptiveVolumeMode:]();
      }
    }
  }
}

- (BOOL)getAdaptiveVolumeSupport
{
  if (_os_feature_enabled_impl())
  {
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerGetHeadphoneFeatureValue())
    {
      unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice getAdaptiveVolumeSupport]();
      }
    }
  }
  return 0;
}

- (unsigned)getAdaptiveVolumeMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && ([+[BluetoothManager sharedInstance] _accessoryManager], [(BluetoothDevice *)self device], BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getDeviceAdaptiveVolumeMode]();
    }
  }
  else
  {
    int v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = 0;
      _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_DEFAULT, "Adaptive Volume: Get Mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setAdaptiveVolumeMode:(int)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    int v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Adaptive Volume: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerSendControlCommand())
    {
      BOOL v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice setDeviceAdaptiveVolumeMode:]();
      }
    }
  }
}

- (BOOL)getAutoANCSupport
{
  if (_os_feature_enabled_impl())
  {
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerGetHeadphoneFeatureValue())
    {
      unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice getAutoANCSupport]();
      }
    }
  }
  return 0;
}

- (unsigned)getDeviceConversationDetect
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && ([+[BluetoothManager sharedInstance] _accessoryManager], [(BluetoothDevice *)self device], BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getDeviceConversationDetect]();
    }
  }
  else
  {
    int v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = 0;
      _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_DEFAULT, "Conversation Detect: mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setDeviceConversationDetect:(int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    int v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Conversation Detect: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerSendControlCommand())
    {
      BOOL v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice setDeviceConversationDetect:]();
      }
    }
  }
}

- (BOOL)getConversationDetectSupport
{
  if (_os_feature_enabled_impl())
  {
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerGetHeadphoneFeatureValue())
    {
      unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice getConversationDetectSupport]();
      }
    }
  }
  return 0;
}

- (unsigned)getConversationDetectMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && ([+[BluetoothManager sharedInstance] _accessoryManager], [(BluetoothDevice *)self device], BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getDeviceConversationDetect]();
    }
  }
  else
  {
    int v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = 0;
      _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_DEFAULT, "Conversation Detect: mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setConversationDetectMode:(int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    int v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Conversation Detect: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerSendControlCommand())
    {
      BOOL v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice setDeviceConversationDetect:]();
      }
    }
  }
}

- (BOOL)getSSLSupport
{
  if (_os_feature_enabled_impl())
  {
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerGetHeadphoneFeatureValue())
    {
      unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice getSSLSupport]();
      }
    }
  }
  return 0;
}

- (unsigned)getSSLMode
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && ([+[BluetoothManager sharedInstance] _accessoryManager], [(BluetoothDevice *)self device], BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getSSLMode]();
    }
  }
  else
  {
    int v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = 0;
      _os_log_impl(&dword_2129B4000, v4, OS_LOG_TYPE_DEFAULT, "SSL: mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setSSLMode:(int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    int v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "SSL: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerSendControlCommand())
    {
      BOOL v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice setSSLMode:]();
      }
    }
  }
}

- (BOOL)getWirelessSharingSpatialSupport
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && ([+[BluetoothManager sharedInstance] _accessoryManager], [(BluetoothDevice *)self device], BTAccessoryManagerGetWirelessSharingSpatial()))
  {
    unsigned __int8 v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice getWirelessSharingSpatialSupport]();
    }
    return 1;
  }
  else
  {
    int v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = 1;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_INFO, "Is Spatial Supported during Wireless splitter : %d", buf, 8u);
    }
    return 1;
  }
}

- (BOOL)isGuestPairingMode
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    int HeadphoneFeatureValue = BTAccessoryManagerGetHeadphoneFeatureValue();
    int v4 = sharedBluetoothManagerLogComponent();
    int v5 = v4;
    if (HeadphoneFeatureValue)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice isGuestPairingMode]();
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v9 = 0;
      __int16 v10 = 1024;
      int v11 = 0;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Result: %u, Mode:  %u", buf, 0xEu);
    }
  }
  else
  {
    BOOL v6 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice isGuestPairingMode]();
    }
  }
  return 0;
}

- (void)setGuestPairingMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    int v5 = BTAccessoryManagerSetHeadphoneFeatureValue();
    BOOL v6 = sharedBluetoothManagerLogComponent();
    int v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice setGuestPairingMode:]();
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109376;
      v9[1] = 0;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl(&dword_2129B4000, v7, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Result: %u, Mode Set To:  %u", (uint8_t *)v9, 0xEu);
    }
  }
  else
  {
    uint64_t v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setGuestPairingMode:]();
    }
  }
}

- (BOOL)isProxCardSupportedForFeature:(int)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice isProxCardSupportedForFeature:].cold.4();
    }
    goto LABEL_12;
  }
  unsigned int v5 = [(BluetoothDevice *)self productId];
  BOOL v6 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = v5;
    _os_log_impl(&dword_2129B4000, v6, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Product ID is %i", buf, 8u);
  }
  if (a3 == 2)
  {
    LOBYTE(v7) = 0;
    switch(v5)
    {
      case 0x2019u:
      case 0x201Eu:
        BOOL v7 = [(BluetoothDevice *)self getAdaptiveVolumeSupport];
        __int16 v10 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          if (v7) {
            BOOL v11 = "Yes";
          }
          else {
            BOOL v11 = "No";
          }
          if ([(BluetoothDevice *)self getAdaptiveVolumeSupport]) {
            uint64_t v12 = "Yes";
          }
          else {
            uint64_t v12 = "No";
          }
          *(_DWORD *)buf = 136315394;
          v32 = v11;
          __int16 v33 = 2080;
          v34 = v12;
          uint64_t v13 = "Prox Card Status: Adaptive Controls: Support: %s -> AdaptiveVolume: %s";
          BOOL v14 = v10;
          uint32_t v15 = 22;
          goto LABEL_67;
        }
        return v7;
      case 0x201Au:
      case 0x201Cu:
      case 0x201Du:
      case 0x201Fu:
      case 0x2021u:
      case 0x2022u:
      case 0x2023u:
        return v7;
      case 0x201Bu:
      case 0x2020u:
        if ([(BluetoothDevice *)self getAdaptiveVolumeSupport]) {
          BOOL v7 = [(BluetoothDevice *)self getConversationDetectSupport];
        }
        else {
          BOOL v7 = 0;
        }
        v25 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          if (v7) {
            v26 = "Yes";
          }
          else {
            v26 = "No";
          }
          if ([(BluetoothDevice *)self getAdaptiveVolumeSupport]) {
            v27 = "Yes";
          }
          else {
            v27 = "No";
          }
          BOOL v28 = [(BluetoothDevice *)self getConversationDetectSupport];
          *(_DWORD *)buf = 136315650;
          if (v28) {
            v29 = "Yes";
          }
          else {
            v29 = "No";
          }
          v32 = v26;
          __int16 v33 = 2080;
          v34 = v27;
          __int16 v35 = 2080;
          v36 = v29;
          uint64_t v13 = "Prox Card Status: Adaptive Controls: Support: %s -> AdaptiveVolume: %s, CD: %s";
          BOOL v14 = v25;
          uint32_t v15 = 32;
          goto LABEL_67;
        }
        return v7;
      case 0x2024u:
        goto LABEL_35;
      default:
        if (v5 != 8212) {
          return v7;
        }
LABEL_35:
        BOOL v7 = [(BluetoothDevice *)self getSSLSupport]
          && [(BluetoothDevice *)self getAdaptiveVolumeSupport]
          && [(BluetoothDevice *)self getConversationDetectSupport];
        int v19 = sharedBluetoothManagerLogComponent();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          return v7;
        }
        if (v7) {
          __int16 v20 = "Yes";
        }
        else {
          __int16 v20 = "No";
        }
        if ([(BluetoothDevice *)self getSSLSupport]) {
          uint64_t v21 = "Yes";
        }
        else {
          uint64_t v21 = "No";
        }
        if ([(BluetoothDevice *)self getAdaptiveVolumeSupport]) {
          uint64_t v22 = "Yes";
        }
        else {
          uint64_t v22 = "No";
        }
        BOOL v23 = [(BluetoothDevice *)self getConversationDetectSupport];
        *(_DWORD *)buf = 136315906;
        if (v23) {
          v24 = "Yes";
        }
        else {
          v24 = "No";
        }
        v32 = v20;
        __int16 v33 = 2080;
        v34 = v21;
        __int16 v35 = 2080;
        v36 = v22;
        __int16 v37 = 2080;
        v38 = v24;
        uint64_t v13 = "Prox Card Status: Adaptive Controls: Support: %s -> SSL: %s, AV: %s, CD: %s";
        BOOL v14 = v19;
        uint32_t v15 = 42;
        break;
    }
    goto LABEL_67;
  }
  if (a3 == 1)
  {
    if (v5 == 8218)
    {
      uint64_t v17 = sharedBluetoothManagerLogComponent();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
    if (v5 == 8230)
    {
      uint64_t v16 = sharedBluetoothManagerLogComponent();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
LABEL_26:
      -[BluetoothDevice isProxCardSupportedForFeature:]();
      goto LABEL_12;
    }
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerGetCallManagementConfig())
    {
      int v18 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice isProxCardSupportedForFeature:]();
      }
      goto LABEL_12;
    }
    LOBYTE(v7) = 0;
    v30 = sharedBluetoothManagerLogComponent();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      return v7;
    }
    *(_DWORD *)buf = 136315394;
    v32 = "No";
    __int16 v33 = 1024;
    LODWORD(v34) = 0;
    uint64_t v13 = "Prox Card Status: Mute Call: Support: %s -> Version: %d";
    BOOL v14 = v30;
    uint32_t v15 = 18;
LABEL_67:
    _os_log_impl(&dword_2129B4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    return v7;
  }
  if (a3)
  {
LABEL_12:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (v5 - 8203 >= 0xC) {
    LOBYTE(v7) = 0;
  }
  else {
    LOBYTE(v7) = (0x8C1u >> (v5 - 11)) & 1;
  }
  return v7;
}

- (BOOL)isProxCardShowedForFeature:(int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v6 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice isProxCardShowedForFeature:]();
    }
    return 1;
  }
  if (a3 <= 1)
  {
    unsigned int v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Mute Call: Card Discontinued, Return as Showed", buf, 2u);
    }
    return 1;
  }
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int FeatureProxCardStatus = BTAccessoryManagerGetFeatureProxCardStatus();
  if (FeatureProxCardStatus)
  {
    int v9 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice isProxCardShowedForFeature:]();
    }
  }
  else if (a3 == 2)
  {
    __int16 v10 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "No";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      _os_log_impl(&dword_2129B4000, v10, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Adaptive Controls: Showed: %s -> Prox Card Status: 0x%08llx", buf, 0x16u);
    }
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    BTAccessoryManagerSetFeatureProxCardStatus();
    BOOL v11 = 0;
    return FeatureProxCardStatus || v11;
  }
  BOOL v11 = 1;
  return FeatureProxCardStatus || v11;
}

- (void)setProxCardShowedForFeature:(int)a3 showed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if (a3 <= 1)
    {
      *(_DWORD *)((char *)&v29 + 3) = 0;
      LODWORD(v29) = 0;
      [+[BluetoothManager sharedInstance] _accessoryManager];
      [(BluetoothDevice *)self device];
      if (BTAccessoryManagerGetCallManagementConfig())
      {
        BOOL v7 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.4();
        }
        return;
      }
      __int16 v10 = sharedBluetoothManagerLogComponent();
      BOOL v11 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110656;
        *(_DWORD *)v31 = v29;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = BYTE1(v29);
        __int16 v32 = 1024;
        int v33 = BYTE2(v29);
        __int16 v34 = 1024;
        int v35 = BYTE3(v29);
        __int16 v36 = 1024;
        int v37 = BYTE4(v29);
        __int16 v38 = 1024;
        int v39 = BYTE5(v29);
        __int16 v40 = 1024;
        int v41 = BYTE6(v29);
        _os_log_impl(&dword_2129B4000, v11, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Set: Call Management Version: %d, [0] status: %u, endCall: %u, [1] End Call Status: %u, End Call Config: %u, Mute Call Status: %u, Mute Call Config: %u", buf, 0x2Cu);
      }
      char v14 = v29;
      if (a3)
      {
        if (v29 != 1)
        {
          __int16 v20 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[BluetoothDevice setProxCardShowedForFeature:showed:]((uint64_t)&v29, v20, v22, v23, v24, v25, v26, v27);
          }
          return;
        }
        if (v4) {
          char v14 = v29 + 1;
        }
        BYTE5(v29) = v14;
        uint64_t v15 = sharedBluetoothManagerLogComponent();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
LABEL_50:
          [(BluetoothDevice *)self setCallConfig:v29 | ((unint64_t)(WORD2(v29) | (BYTE6(v29) << 16)) << 32)];
          return;
        }
        if (BYTE5(v29) == 2) {
          uint64_t v16 = "Set";
        }
        else {
          uint64_t v16 = "Disabled";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v31 = v16;
        uint64_t v17 = "Prox Card Status: Mute Call: Set: Version: 1, Mute Call Status: %s";
      }
      else if (v29 == 1)
      {
        if (v4) {
          char v14 = v29 + 1;
        }
        BYTE3(v29) = v14;
        uint64_t v15 = sharedBluetoothManagerLogComponent();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        if (BYTE3(v29) == 2) {
          BOOL v28 = "Set";
        }
        else {
          BOOL v28 = "Disabled";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v31 = v28;
        uint64_t v17 = "Prox Card Status: End Call: Set: Version: 1, End Call Status: %s";
      }
      else
      {
        if (v4) {
          char v18 = 2;
        }
        else {
          char v18 = 1;
        }
        BYTE1(v29) = v18;
        uint64_t v15 = sharedBluetoothManagerLogComponent();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        if (BYTE1(v29) == 2) {
          int v19 = "Set";
        }
        else {
          int v19 = "Disabled";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v31 = v19;
        uint64_t v17 = "Prox Card Status: End Call: Set: Version: 0, End Call Status: %s";
      }
      _os_log_impl(&dword_2129B4000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      goto LABEL_50;
    }
    uint64_t v29 = 0;
    [+[BluetoothManager sharedInstance] _accessoryManager];
    [(BluetoothDevice *)self device];
    if (BTAccessoryManagerGetFeatureProxCardStatus())
    {
      int v9 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.6();
      }
    }
    else
    {
      if (a3 == 2 && v4)
      {
        v29 |= 3uLL;
        uint64_t v12 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v31 = "Set";
          _os_log_impl(&dword_2129B4000, v12, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Adaptive Controls: Set: Status: %s", buf, 0xCu);
        }
      }
      [+[BluetoothManager sharedInstance] _accessoryManager];
      [(BluetoothDevice *)self device];
      if (BTAccessoryManagerSetFeatureProxCardStatus())
      {
        uint64_t v13 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.5();
        }
      }
    }
  }
  else
  {
    uint64_t v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.7();
    }
  }
}

- (BOOL)hearingAidSupport
{
  return [(BluetoothDevice *)self getAACPCapabilityInteger:192] == 2;
}

- (BOOL)hearingAidEnrolled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int HeadphoneFeatureValue = BTAccessoryManagerGetHeadphoneFeatureValue();
  BOOL v4 = sharedBluetoothManagerLogComponent();
  unsigned int v5 = v4;
  if (HeadphoneFeatureValue)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice hearingAidEnrolled]();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v9 = 0;
      __int16 v10 = 1024;
      int v11 = 0;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Hearing Aid: Result: %d, Get Enrolled:  %u", buf, 0xEu);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)setHearingAidEnrolled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v5 = BTAccessoryManagerSetHeadphoneFeatureValue();
  BOOL v6 = sharedBluetoothManagerLogComponent();
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setHearingAidEnrolled:]();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = 0;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_2129B4000, v7, OS_LOG_TYPE_DEFAULT, "Hearing Aid: Result: %d, Set Enrolled:  %u", (uint8_t *)v8, 0xEu);
  }
}

- (BOOL)hearingAidEnabled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int HeadphoneFeatureValue = BTAccessoryManagerGetHeadphoneFeatureValue();
  BOOL v4 = sharedBluetoothManagerLogComponent();
  int v5 = v4;
  if (HeadphoneFeatureValue)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice hearingAidEnabled]();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v9 = 0;
      __int16 v10 = 1024;
      int v11 = 0;
      _os_log_impl(&dword_2129B4000, v5, OS_LOG_TYPE_DEFAULT, "Hearing Aid: Result: %d, Get Enabled:  %u", buf, 0xEu);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)setHearingAidEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  [+[BluetoothManager sharedInstance] _accessoryManager];
  [(BluetoothDevice *)self device];
  int v5 = BTAccessoryManagerSetHeadphoneFeatureValue();
  BOOL v6 = sharedBluetoothManagerLogComponent();
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BluetoothDevice setHearingAidEnabled:]();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = 0;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_2129B4000, v7, OS_LOG_TYPE_DEFAULT, "Hearing Aid: Result: %d, Set Enabled:  %u", (uint8_t *)v8, 0xEu);
  }
}

- (BOOL)hearingTestSupport
{
  return [(BluetoothDevice *)self getAACPCapabilityInteger:208] == 2;
}

- (void)batteryStatus:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2129B4000, v0, v1, "Invalid BTDeviceBatteryStatus", v2, v3, v4, v5, v6);
}

- (void)setIsHidden:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set isHidden : %d", v2, v3, v4, v5, v6);
}

- (void)inEarDetectEnabled
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get inEar detect enabled : %d", v2, v3, v4, v5, v6);
}

- (void)setInEarDetectEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set inEar detect enabled : %d", v2, v3, v4, v5, v6);
}

- (void)setSpatialAudioAllowed:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set SpatialAudioAllowed : %d", v2, v3, v4, v5, v6);
}

- (void)spatialAudioAllowed
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get Spatial Allowed : %d", v2, v3, v4, v5, v6);
}

- (void)setSpatialAudioMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set SpatialAudioMode : %d", v2, v3, v4, v5, v6);
}

- (void)spatialAudioMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get Spatial mode : %d", v2, v3, v4, v5, v6);
}

- (void)setSmartRouteMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set smartRouteMode : %d", v2, v3, v4, v5, v6);
}

- (void)smartRouteMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get Smart Routing mode : %d", v2, v3, v4, v5, v6);
}

- (void)inEarStatusPrimary:secondary:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get inEarStatus : %d", v2, v3, v4, v5, v6);
}

- (void)micMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get mic mode : %d", v2, v3, v4, v5, v6);
}

- (void)setMicMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set mic mode : %d", v2, v3, v4, v5, v6);
}

- (void)doubleTapAction
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get doubleTap action : %d", v2, v3, v4, v5, v6);
}

- (void)setDoubleTapAction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set doubleTap action : %d", v2, v3, v4, v5, v6);
}

- (void)doubleTapCapability
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get doubleTap capabilty : %d", v2, v3, v4, v5, v6);
}

- (void)featureCapability:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_2129B4000, v1, OS_LOG_TYPE_ERROR, "Failed to get %d capability : %d", v2, 0xEu);
}

- (void)doubleTapActionEx:rightAction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get doubleTapEx action : %d", v2, v3, v4, v5, v6);
}

- (void)setDoubleTapActionEx:rightAction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set doubleTapEx action : %d", v2, v3, v4, v5, v6);
}

- (void)listeningMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get listening mode : %d", v2, v3, v4, v5, v6);
}

- (void)setListeningMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set listening mode : %d", v2, v3, v4, v5, v6);
}

- (void)setHeartRateMonitorEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set heart rate monitor state : %d", v2, v3, v4, v5, v6);
}

- (void)getHeartRateMonitorEnabled
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get heart rate monitor state : %d", v2, v3, v4, v5, v6);
}

- (void)listeningModeConfigs
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get listening mode configs : %d", v2, v3, v4, v5, v6);
}

- (void)setListeningModeConfigs:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set listening mode configs : %d", v2, v3, v4, v5, v6);
}

- (void)singleClickMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get single click mode : %d", v2, v3, v4, v5, v6);
}

- (void)setSingleClickMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set single click mode : %d", v2, v3, v4, v5, v6);
}

- (void)doubleClickMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get double click mode : %d", v2, v3, v4, v5, v6);
}

- (void)setDoubleClickMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set double click mode : %d", v2, v3, v4, v5, v6);
}

- (void)clickHoldModes:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get click hold mode : %d", v2, v3, v4, v5, v6);
}

- (void)setClickHoldMode:rightMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set click hold mode : %d", v2, v3, v4, v5, v6);
}

- (void)crownRotationDirection
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get crown rotation dir : %d", v2, v3, v4, v5, v6);
}

- (void)setCrownRotationDirection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set crown rotation dir : %d", v2, v3, v4, v5, v6);
}

- (void)chimeVolume
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get chime volume : %d", v2, v3, v4, v5, v6);
}

- (void)setChimeVolume:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set chime volume : %d", v2, v3, v4, v5, v6);
}

- (void)autoAnswerMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get auto answer mode : %d", v2, v3, v4, v5, v6);
}

- (void)setAutoAnswerMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set auto answer mode : %d", v2, v3, v4, v5, v6);
}

- (void)accessorySettingFeatureBitMask
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Error in retrieving BTAccessorySettings Feature bitmask : %d", v2, v3, v4, v5, v6);
}

- (void)pairedDeviceNameUpdated
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2129B4000, a2, OS_LOG_TYPE_ERROR, "Unable to clear Magic paired device name %@", (uint8_t *)&v2, 0xCu);
}

- (void)getAACPCapabilityInteger:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "BTAccessoryManagerGetAACPCapabilityInteger error %d", v2, v3, v4, v5, v6);
}

- (void)setServiceSetting:(void *)a1 key:(NSObject *)a2 value:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = [a1 name];
  _os_log_error_impl(&dword_2129B4000, a2, OS_LOG_TYPE_ERROR, "Failed to set service setting for device \"%@\"", (uint8_t *)&v3, 0xCu);
}

- (void)getBehaviorForHIDDevice
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "BTM : Failed to get HID device behavior with error: %d", v2, v3, v4, v5, v6);
}

- (void)getStereoHFPSupport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get Accessory support Head Tracked FT : %d", v2, v3, v4, v5, v6);
}

- (void)getDeviceSoundProfileSupport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get Accessory support for Spatial Profile: : %d", v2, v3, v4, v5, v6);
}

- (void)getDeviceSoundProfileAllowed
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get Accessory Allowed for Spatial Profile: %d", v2, v3, v4, v5, v6);
}

- (void)getSpatialAudioPlatformSupport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get Platform Spatial Audio Support : %d", v2, v3, v4, v5, v6);
}

- (void)gyroInformation
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "gyroInformation - Failed to get gyro information. result: %u", v2, v3, v4, v5, v6);
}

- (void)isGenuineAirPods
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get Is Genuine AirPods : %d", v2, v3, v4, v5, v6);
}

- (void)getCallManagementConfig
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get call managment configuration : %d", v2, v3, v4, v5, v6);
}

- (void)setCallConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to set end call config : %d", v2, v3, v4, v5, v6);
}

- (void)getDeviceAdaptiveVolumeMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Adaptive Volume: Failed to get mode - %d", v2, v3, v4, v5, v6);
}

- (void)setDeviceAdaptiveVolumeMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Adaptive Volume: Failed to set mode : %d", v2, v3, v4, v5, v6);
}

- (void)getAdaptiveVolumeSupport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Adaptive Volume: Failed to get support - %d", v2, v3, v4, v5, v6);
}

- (void)getAutoANCSupport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "AutoANC: Failed to get support - %d", v2, v3, v4, v5, v6);
}

- (void)getDeviceConversationDetect
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Conversation Detect: Failed to get mode - %d", v2, v3, v4, v5, v6);
}

- (void)setDeviceConversationDetect:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Conversation Detect: Failed to set mode - %d", v2, v3, v4, v5, v6);
}

- (void)getConversationDetectSupport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Conversation Detect: Failed to get support - %d", v2, v3, v4, v5, v6);
}

- (void)getSSLSupport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "SSL: Failed to get support - %d", v2, v3, v4, v5, v6);
}

- (void)getSSLMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "SSL: Failed to get mode - %d", v2, v3, v4, v5, v6);
}

- (void)setSSLMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "SSL: Failed to set mode - %d", v2, v3, v4, v5, v6);
}

- (void)getWirelessSharingSpatialSupport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed spatial support in WS : %d", v2, v3, v4, v5, v6);
}

- (void)isGuestPairingMode
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2129B4000, v0, v1, "Guest Pairing: Failed to get mode, feature not enabled", v2, v3, v4, v5, v6);
}

- (void)setGuestPairingMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Guest Pairing: Failed to set mode, result: %d", v2, v3, v4, v5, v6);
}

- (void)setGuestPairingMode:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2129B4000, v0, v1, "Guest Pairing: Failed to set mode, feature not enabled", v2, v3, v4, v5, v6);
}

- (void)isProxCardSupportedForFeature:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Prox Card Status: Mute Call: Support: Failed to get Call Management Status, result: %d", v2, v3, v4, v5, v6);
}

- (void)isProxCardSupportedForFeature:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2129B4000, v0, v1, "Prox Card Status: Mute Call: Support: Mute Call Card is NOT supported for this device", v2, v3, v4, v5, v6);
}

- (void)isProxCardSupportedForFeature:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2129B4000, v0, v1, "Prox Card Status: Feature NOT Enabled, Return as NOT Supported", v2, v3, v4, v5, v6);
}

- (void)isProxCardShowedForFeature:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Prox Card Status: Showed: Failed to get Prox Card Status, result: %d, Return as Showed", v2, v3, v4, v5, v6);
}

- (void)isProxCardShowedForFeature:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2129B4000, v0, v1, "Prox Card Status: Feature NOT Enabled, Cannot Get, Return as Showed", v2, v3, v4, v5, v6);
}

- (void)setProxCardShowedForFeature:(uint64_t)a3 showed:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setProxCardShowedForFeature:(uint64_t)a3 showed:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setProxCardShowedForFeature:(uint64_t)a3 showed:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setProxCardShowedForFeature:showed:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Prox Card Status: Set: Failed to set Call Management Status, result: %d", v2, v3, v4, v5, v6);
}

- (void)setProxCardShowedForFeature:showed:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Prox Card Status: Failed to Set Prox Card Status, result: %d", v2, v3, v4, v5, v6);
}

- (void)setProxCardShowedForFeature:showed:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Prox Card Status: Set: Failed to get Prox Card Status, result: %d, Return", v2, v3, v4, v5, v6);
}

- (void)setProxCardShowedForFeature:showed:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2129B4000, v0, v1, "Prox Card Status: Set: Feature NOT Enabled", v2, v3, v4, v5, v6);
}

- (void)hearingAidEnrolled
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Hearing Aid: Failed to get enrolled, result: %d", v2, v3, v4, v5, v6);
}

- (void)setHearingAidEnrolled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Hearing Aid: Failed to set enrolled, result: %d", v2, v3, v4, v5, v6);
}

- (void)hearingAidEnabled
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Hearing Aid: Failed to get enabled, result: %d", v2, v3, v4, v5, v6);
}

- (void)setHearingAidEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Hearing Aid: Failed to set enabled, result: %d", v2, v3, v4, v5, v6);
}

@end
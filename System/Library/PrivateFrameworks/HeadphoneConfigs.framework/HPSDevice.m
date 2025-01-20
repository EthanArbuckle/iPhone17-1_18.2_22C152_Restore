@interface HPSDevice
+ (id)deviceKey;
- ($70344DAF05348A783186C1CF166707C1)getCallManagementConfig;
- ($9BEB610D0CE1B1EDC3D89DA2464F985F)syncSettings;
- (BOOL)ancsAuthorized;
- (BOOL)batteryStatus:(id *)a3;
- (BOOL)cloudPaired;
- (BOOL)connected;
- (BOOL)doesSupportBackgroundNI;
- (BOOL)featureCapability:(int)a3;
- (BOOL)getAACPCapabilityBit:(int)a3;
- (BOOL)getAdaptiveVolumeSupport;
- (BOOL)getAutoANCSupport;
- (BOOL)getConversationDetectSupport;
- (BOOL)getDeviceSoundProfileAllowed;
- (BOOL)getHexDeviceAddress:(id *)a3;
- (BOOL)hearingAidEnabled;
- (BOOL)hearingAidEnrolled;
- (BOOL)hearingAidSupport;
- (BOOL)hearingTestSupport;
- (BOOL)inEarDetectEnabled;
- (BOOL)inEarStatusPrimary:(int *)a3 secondary:(int *)a4;
- (BOOL)isAppleAudioDevice;
- (BOOL)isCTKDDevice;
- (BOOL)isFirmwareUpdateRequiredDevice;
- (BOOL)isGenuineAirPods;
- (BOOL)isGuestPairingMode;
- (BOOL)isLimitedConnectivityDevice;
- (BOOL)isManagedByAliroWallet;
- (BOOL)isManagedByWallet;
- (BOOL)isServiceSupported:(unsigned int)a3;
- (BOOL)isTemporaryPaired;
- (BOOL)magicPaired;
- (BOOL)paired;
- (BOOL)setAutoAnswerMode:(int)a3;
- (BOOL)setCallConfig:(id)a3;
- (BOOL)setClickHoldMode:(int)a3 rightMode:(int)a4;
- (BOOL)setClickHoldModes:(id)a3;
- (BOOL)setCrownRotationDirection:(int)a3;
- (BOOL)setDoubleTapAction:(unsigned int)a3;
- (BOOL)setDoubleTapActionEx:(unsigned int)a3 rightAction:(unsigned int)a4;
- (BOOL)setInEarDetectEnabled:(BOOL)a3;
- (BOOL)setListeningMode:(unsigned int)a3;
- (BOOL)setListeningModeConfigs:(unsigned int)a3;
- (BOOL)setMicMode:(unsigned int)a3;
- (BOOL)setSmartRouteMode:(unsigned __int8)a3;
- (BOOL)setUserName:(id)a3;
- (BOOL)setUserSelectedDeviceType:(int)a3;
- (BOOL)smartRouteSupport;
- (BOOL)supportsANCS;
- (BTSDevice)btsDevice;
- (HPMHeadphoneDevice)headphoneDevice;
- (HPSDevice)initWithHeadphoneDevice:(id)a3 btsDevice:(id)a4;
- (NSString)debugDescription;
- (id)accessoryInfo;
- (id)address;
- (id)getServiceSetting:(unsigned int)a3 key:(id)a4;
- (id)healthDeviceType;
- (id)identifier;
- (id)name;
- (id)productName;
- (id)syncGroups;
- (int)accessorySettingFeatureBitMask;
- (int)autoAnswerMode;
- (int)crownRotationDirection;
- (int)getDeviceColor:(unsigned int *)a3;
- (int)getLowSecurityStatus;
- (int)getUserSelectedDeviceType;
- (unsigned)SendSetupCommand:(unsigned __int8)a3;
- (unsigned)clickHoldMode:(int *)a3 rightAction:(int *)a4;
- (unsigned)clickHoldModes:(id *)a3;
- (unsigned)doubleTapAction;
- (unsigned)doubleTapActionEx:(unsigned int *)a3 rightAction:(unsigned int *)a4;
- (unsigned)doubleTapCapability;
- (unsigned)getAdaptiveVolumeMode;
- (unsigned)getConversationDetectMode;
- (unsigned)getDeviceAdaptiveVolumeMode;
- (unsigned)getSpatialAudioPlatformSupport;
- (unsigned)listeningMode;
- (unsigned)listeningModeConfigs;
- (unsigned)micMode;
- (unsigned)productId;
- (unsigned)smartRouteMode;
- (unsigned)userSelectedHealthDataSyncConfig;
- (unsigned)vendorId;
- (void)_logExpectationFormatStringForUsecase:(id)a3 btsDeviceValue:(id)a4 headphoneDeviceValue:(id)a5;
- (void)_logExpectationFormatStringForUsecase:(id)a3 queryValue:(id)a4 btsDeviceValue:(id)a5 headphoneDeviceValue:(id)a6;
- (void)_logSetterExpectationFormatStringForUsecase:(id)a3 inputValue:(id)a4 existingValue:(id)a5 readBackValue:(id)a6;
- (void)btsDevice;
- (void)disconnect;
- (void)setANCSAuthorization:(BOOL)a3;
- (void)setAdaptiveVolumeMode:(int)a3;
- (void)setBtsDevice:(id)a3;
- (void)setConversationDetectMode:(int)a3;
- (void)setCtkdDevice:(BOOL)a3;
- (void)setDeviceAdaptiveVolumeMode:(int)a3;
- (void)setDeviceSoundProfileAllowed:(BOOL)a3;
- (void)setGuestPairingMode:(BOOL)a3;
- (void)setHeadphoneDevice:(id)a3;
- (void)setHearingAidEnabled:(BOOL)a3;
- (void)setHearingAidEnrolled:(BOOL)a3;
- (void)setManagedByAliroWallet:(BOOL)a3;
- (void)setManagedByWallet:(BOOL)a3;
- (void)setServiceSetting:(unsigned int)a3 key:(id)a4 value:(id)a5;
- (void)setSupportsBackgroundNI:(BOOL)a3;
- (void)setSyncGroup:(int)a3 enabled:(BOOL)a4;
- (void)setSyncSettings:(id)a3;
- (void)setUserSelectedHealthDataSyncConfig:(unsigned __int8)a3;
- (void)unpair;
@end

@implementation HPSDevice

- (HPSDevice)initWithHeadphoneDevice:(id)a3 btsDevice:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HPSDevice;
  v9 = [(HPSDevice *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_btsDevice, a4);
    p_headphoneDevice = (void **)&v10->_headphoneDevice;
    objc_storeStrong((id *)&v10->_headphoneDevice, a3);
    v12 = +[HPSHeadphoneManager sharedInstance];
    v10->_ffValue = [v12 isFeatureEnabled];

    v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v25 = v8;
      __int16 v26 = 2048;
      id v27 = v7;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: %p %p", buf, 0x16u);
    }

    if (v8)
    {
      if (v10->_ffValue)
      {
        v14 = [MEMORY[0x1E4F65650] shared];
        v15 = [v14 connectedHeadphones];
        v16 = [v8 classicDevice];
        v17 = [v16 address];
        v18 = [v17 stringByReplacingOccurrencesOfString:@":" withString:@"-"];
        uint64_t v19 = [v15 objectForKey:v18];
        v20 = *p_headphoneDevice;
        *p_headphoneDevice = (void *)v19;

        if (!*p_headphoneDevice)
        {
          v21 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[HPSDevice initWithHeadphoneDevice:btsDevice:]();
          }
        }
      }
    }
  }

  return v10;
}

- (id)address
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    v3 = [(HPSDevice *)self headphoneDevice];
    v4 = [v3 btAddress];
    v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:@":"];

    v6 = [(HPSDevice *)self btsDevice];
    id v7 = [v6 classicDevice];
    id v8 = [v7 address];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[address]" btsDeviceValue:v8 headphoneDeviceValue:v5];

    v9 = [(HPSDevice *)self headphoneDevice];
    v10 = [v9 btAddress];
    if (v10)
    {
      v11 = v5;
    }
    else
    {
      v17 = [(HPSDevice *)self btsDevice];
      v18 = [v17 classicDevice];
      v11 = [v18 address];
    }
  }
  else
  {
    v12 = [(HPSDevice *)self btsDevice];
    v13 = [v12 classicDevice];
    v11 = [v13 address];

    v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(HPSDevice *)self btsDevice];
      v15 = [v14 classicDevice];
      v16 = [v15 address];
      int v20 = 138412546;
      v21 = v16;
      __int16 v22 = 2112;
      objc_super v23 = v11;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [address] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v20, 0x16u);
    }
  }

  return v11;
}

- (BOOL)batteryStatus:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v5 = [(HPSDevice *)self btsDevice];
  v6 = [v5 classicDevice];
  int v7 = [v6 batteryStatus:a3];

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"\n battIsChagingCase: %i \nbattIsChargingLeft: %i \nbattIsChargingRight: %i \nbattIsChargingSingle: %i \nbattLevelCase: %i \nbattLevelLeft: %i \nbattLevelRight: %i \nbattLevelSingle: %i \n", a3->var7, a3->var5, a3->var3, a3->var1, a3->var6, a3->var4, a3->var2, a3->var0);
  if (self->_ffValue && self->_headphoneDevice)
  {
    v9 = [(HPSDevice *)self headphoneDevice];
    int v7 = [v9 batteryStateCase];

    v10 = [(HPSDevice *)self headphoneDevice];
    LODWORD(v9) = [v10 batteryStateLeft];

    v11 = [(HPSDevice *)self headphoneDevice];
    LODWORD(v10) = [v11 batteryStateRight];

    v12 = [(HPSDevice *)self headphoneDevice];
    LODWORD(v11) = [v12 batteryStateMain];

    v13 = [(HPSDevice *)self headphoneDevice];
    [v13 batteryLevelCase];
    a3->var6 = (int)(float)(v14 * 100.0);

    v15 = [(HPSDevice *)self headphoneDevice];
    [v15 batteryLevelLeft];
    a3->var4 = (int)(float)(v16 * 100.0);

    v17 = [(HPSDevice *)self headphoneDevice];
    [v17 batteryLevelRight];
    a3->var2 = (int)(float)(v18 * 100.0);

    uint64_t v19 = [(HPSDevice *)self headphoneDevice];
    [v19 batteryLevelMain];
    a3->var0 = (int)(float)(v20 * 100.0);

    a3->var7 = v7 == 1;
    a3->var5 = v9 == 1;
    a3->var3 = v10 == 1;
    a3->var1 = v11 == 1;
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"\n battIsChagingCase: %i \nbattIsChargingLeft: %i \nbattIsChargingRight: %i \nbattIsChargingSingle: %i \nbattLevelCase: %i \nbattLevelLeft: %i \nbattLevelRight: %i \nbattLevelSingle: %i \n", v7 == 1, v9 == 1, v10 == 1, v11 == 1, a3->var6, a3->var4, a3->var2, a3->var0);
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[batteryStatus:]" btsDeviceValue:v8 headphoneDeviceValue:v21];

    LOBYTE(v7) = 1;
  }
  else
  {
    __int16 v22 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v23 = [(HPSDevice *)self btsDevice];
      uint64_t v24 = [v23 classicDevice];
      id v25 = [v24 address];
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v25;
      __int16 v29 = 2112;
      v30 = v8;
      __int16 v31 = 1024;
      int v32 = v7;
      _os_log_impl(&dword_1E4BFE000, v22, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [batteryStatus:] [BTDevice-Only] btDevice: %@, values:%@, returnValue:%i", buf, 0x1Cu);
    }
  }

  return v7;
}

- (unsigned)clickHoldMode:(int *)a3 rightAction:(int *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v7 = [(HPSDevice *)self btsDevice];
  id v8 = [v7 classicDevice];
  unsigned int v9 = [v8 clickHoldMode:a3 rightAction:a4];

  v10 = NSString;
  v11 = [NSNumber numberWithUnsignedInt:*a3];
  v12 = [v11 stringValue];
  v13 = [NSNumber numberWithUnsignedInt:*a4];
  float v14 = [v13 stringValue];
  v15 = [v10 stringWithFormat:@"%@-%@", v12, v14];

  if (self->_ffValue && self->_headphoneDevice)
  {
    float v16 = [(HPSDevice *)self headphoneDevice];
    *a3 = [v16 clickHoldModeLeft];

    v17 = [(HPSDevice *)self headphoneDevice];
    *a4 = [v17 clickHoldModeRight];

    float v18 = NSString;
    uint64_t v19 = [NSNumber numberWithUnsignedInt:*a3];
    float v20 = [v19 stringValue];
    v21 = [NSNumber numberWithUnsignedInt:*a4];
    __int16 v22 = [v21 stringValue];
    objc_super v23 = [v18 stringWithFormat:@"%@-%@", v20, v22];

    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[clickHoldMode:rightAction:]" btsDeviceValue:v15 headphoneDeviceValue:v23];
    unsigned int v9 = 1;
  }
  else
  {
    uint64_t v24 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(HPSDevice *)self btsDevice];
      __int16 v26 = [v25 classicDevice];
      id v27 = [v26 address];
      int v28 = *a3;
      int v29 = *a4;
      *(_DWORD *)buf = 138413058;
      int v32 = v27;
      __int16 v33 = 1024;
      int v34 = v28;
      __int16 v35 = 1024;
      int v36 = v29;
      __int16 v37 = 1024;
      unsigned int v38 = v9;
      _os_log_impl(&dword_1E4BFE000, v24, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [clickHoldMode:rightAction:] [BTDevice-Only] btDevice: %@, leftMode:%i, rightMode:%i, returnValue:%i", buf, 0x1Eu);
    }
  }

  return v9;
}

- (int)crownRotationDirection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = [v4 crownRotationDirection];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 crownRotationDirection];

    id v8 = [NSNumber numberWithUnsignedInt:v5];
    unsigned int v9 = [v8 stringValue];
    v10 = [NSNumber numberWithUnsignedChar:v7];
    v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[crownRotationDirection]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    if (v7 == 1) {
      int v12 = 1;
    }
    else {
      int v12 = 2;
    }
    if (v7) {
      LODWORD(v5) = v12;
    }
    else {
      LODWORD(v5) = 0;
    }
  }
  else
  {
    v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      float v14 = [(HPSDevice *)self btsDevice];
      v15 = [v14 classicDevice];
      float v16 = [v15 address];
      int v18 = 138412546;
      uint64_t v19 = v16;
      __int16 v20 = 1024;
      int v21 = v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [crownRotationDirection] [BTDevice-Only] btDevice: %@,  returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
  }
  return v5;
}

- (unsigned)doubleTapAction
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 doubleTapAction];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    unsigned int v7 = [v6 doubleTapActionLeft] - 1;
    if (v7 >= 5) {
      uint64_t v8 = 0xFFFFLL;
    }
    else {
      uint64_t v8 = v7;
    }

    uint64_t v5 = [NSNumber numberWithUnsignedInt:v5];
    unsigned int v9 = [v5 stringValue];
    v10 = [NSNumber numberWithUnsignedInt:v8];
    v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[doubleTapAction]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LODWORD(v5) = v8;
  }
  else
  {
    int v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(HPSDevice *)self btsDevice];
      float v14 = [v13 classicDevice];
      v15 = [v14 address];
      int v17 = 138412546;
      int v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [doubleTapAction] [BTDevice-Only] btDevice: %@,  returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return v5;
}

- (unsigned)doubleTapActionEx:(unsigned int *)a3 rightAction:(unsigned int *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = [(HPSDevice *)self btsDevice];
  uint64_t v8 = [v7 classicDevice];
  unsigned int v9 = [v8 doubleTapActionEx:a3 rightAction:a4];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v10 = NSString;
    v11 = [NSNumber numberWithUnsignedInt:*a3];
    int v12 = [NSNumber numberWithUnsignedInt:*a4];
    v13 = [v10 stringWithFormat:@"%@-%@", v11, v12];

    float v14 = [(HPSDevice *)self headphoneDevice];
    unsigned int v15 = [v14 doubleTapActionLeft] - 1;
    if (v15 >= 5) {
      unsigned int v15 = 0xFFFF;
    }
    *a3 = v15;

    float v16 = [(HPSDevice *)self headphoneDevice];
    unsigned int v17 = [v16 doubleTapActionRight] - 1;
    if (v17 >= 5) {
      unsigned int v17 = 0xFFFF;
    }
    *a4 = v17;

    int v18 = NSString;
    __int16 v19 = [NSNumber numberWithUnsignedInt:*a3];
    int v20 = [NSNumber numberWithUnsignedInt:*a4];
    uint64_t v21 = [v18 stringWithFormat:@"%@-%@", v19, v20];

    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[doubleTapActionEx:rightAction:]" btsDeviceValue:v13 headphoneDeviceValue:v21];
    return 1;
  }
  else
  {
    uint64_t v22 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v23 = [(HPSDevice *)self btsDevice];
      uint64_t v24 = [v23 classicDevice];
      id v25 = [v24 address];
      unsigned int v26 = *a3;
      unsigned int v27 = *a4;
      *(_DWORD *)buf = 138413058;
      v30 = v25;
      __int16 v31 = 1024;
      unsigned int v32 = v26;
      __int16 v33 = 1024;
      unsigned int v34 = v27;
      __int16 v35 = 1024;
      unsigned int v36 = v9;
      _os_log_impl(&dword_1E4BFE000, v22, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [doubleTapActionEx:rightAction:] [BTDevice-Only] btDevice: %@, inLeftAction:%i, inRightAction:%i,  returnValue:%i", buf, 0x1Eu);
    }
  }
  return v9;
}

- (unsigned)getAdaptiveVolumeMode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 getAdaptiveVolumeMode];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    if ([v6 adaptiveVolume]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }

    uint64_t v5 = [NSNumber numberWithUnsignedChar:v5];
    uint64_t v8 = [v5 stringValue];
    unsigned int v9 = [NSNumber numberWithUnsignedChar:v7];
    v10 = [v9 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getAdaptiveVolumeMode]" btsDeviceValue:v8 headphoneDeviceValue:v10];

    LOBYTE(v5) = v7;
  }
  else
  {
    v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(HPSDevice *)self btsDevice];
      v13 = [v12 classicDevice];
      float v14 = [v13 address];
      int v16 = 138412546;
      unsigned int v17 = v14;
      __int16 v18 = 1024;
      int v19 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getAdaptiveVolumeMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);
    }
  }
  return v5;
}

- (BOOL)getAdaptiveVolumeSupport
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 getAdaptiveVolumeSupport];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 supportsFeatureWithFeature:20];

    uint64_t v5 = [NSNumber numberWithBool:v5];
    uint64_t v8 = [v5 stringValue];
    unsigned int v9 = [NSNumber numberWithBool:v7];
    v10 = [v9 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getAdaptiveVolumeSupport]" btsDeviceValue:v8 headphoneDeviceValue:v10];

    LOBYTE(v5) = v7;
  }
  else
  {
    v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(HPSDevice *)self btsDevice];
      v13 = [v12 classicDevice];
      float v14 = [v13 address];
      int v16 = 138412546;
      unsigned int v17 = v14;
      __int16 v18 = 1024;
      int v19 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getAdaptiveVolumeSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)getAutoANCSupport
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 getAutoANCSupport];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 cbDevice];
    uint64_t v8 = [v7 autoAncCapability];

    uint64_t v5 = [NSNumber numberWithBool:v5];
    unsigned int v9 = [v5 stringValue];
    v10 = [NSNumber numberWithUnsignedChar:v8];
    v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getAutoANCSupport]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LOBYTE(v5) = v8 != 0;
  }
  else
  {
    int v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(HPSDevice *)self btsDevice];
      float v14 = [v13 classicDevice];
      unsigned int v15 = [v14 address];
      int v17 = 138412546;
      __int16 v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getAutoANCSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)getConversationDetectSupport
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 getConversationDetectSupport];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 supportsFeatureWithFeature:19];

    uint64_t v5 = [NSNumber numberWithBool:v5];
    uint64_t v8 = [v5 stringValue];
    unsigned int v9 = [NSNumber numberWithBool:v7];
    v10 = [v9 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getConversationDetectSupport]" btsDeviceValue:v8 headphoneDeviceValue:v10];

    LOBYTE(v5) = v7;
  }
  else
  {
    v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(HPSDevice *)self btsDevice];
      v13 = [v12 classicDevice];
      float v14 = [v13 address];
      int v16 = 138412546;
      int v17 = v14;
      __int16 v18 = 1024;
      int v19 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getConversationDetectSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);
    }
  }
  return (char)v5;
}

- (unsigned)getDeviceAdaptiveVolumeMode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 getDeviceAdaptiveVolumeMode];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 cbDevice];
    uint64_t v8 = [v7 adaptiveVolumeConfig];

    uint64_t v5 = [NSNumber numberWithUnsignedChar:v5];
    unsigned int v9 = [v5 stringValue];
    v10 = [NSNumber numberWithUnsignedChar:v8];
    v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getDeviceAdaptiveVolumeMode]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LOBYTE(v5) = v8;
  }
  else
  {
    int v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(HPSDevice *)self btsDevice];
      float v14 = [v13 classicDevice];
      unsigned int v15 = [v14 address];
      int v17 = 138412546;
      __int16 v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getDeviceAdaptiveVolumeMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return v5;
}

- (BOOL)getHexDeviceAddress:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HPSDevice *)self btsDevice];
  v6 = [v5 classicDevice];
  int v7 = [v6 getHexDeviceAddress:a3];

  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:6];
  if (self->_ffValue && self->_headphoneDevice)
  {
    unsigned int v9 = [(HPSDevice *)self headphoneDevice];
    v10 = [v9 cbDevice];
    v11 = [v10 btAddressData];

    id v12 = v11;
    a3->var0[0] = *(unsigned char *)[v12 bytes];
    id v13 = v12;
    a3->var0[1] = *(unsigned char *)([v13 bytes] + 1);
    id v14 = v13;
    a3->var0[2] = *(unsigned char *)([v14 bytes] + 2);
    id v15 = v14;
    a3->var0[3] = *(unsigned char *)([v15 bytes] + 3);
    id v16 = v15;
    a3->var0[4] = *(unsigned char *)([v16 bytes] + 4);
    id v17 = v16;
    a3->var0[5] = *(unsigned char *)([v17 bytes] + 5);
    __int16 v18 = [v8 description];
    __int16 v19 = [v17 description];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getHexDeviceAddress:]" btsDeviceValue:v18 headphoneDeviceValue:v19];

    BOOL v20 = 1;
  }
  else
  {
    uint64_t v21 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [(HPSDevice *)self btsDevice];
      objc_super v23 = [v22 classicDevice];
      uint64_t v24 = [v23 address];
      int v25 = a3->var0[0];
      int v26 = a3->var0[1];
      int v27 = a3->var0[2];
      int v28 = a3->var0[3];
      int v29 = a3->var0[4];
      int v30 = a3->var0[5];
      int v32 = 138414082;
      __int16 v33 = v24;
      __int16 v34 = 1024;
      int v35 = v25;
      __int16 v36 = 1024;
      int v37 = v26;
      __int16 v38 = 1024;
      int v39 = v27;
      __int16 v40 = 1024;
      int v41 = v28;
      __int16 v42 = 1024;
      int v43 = v29;
      __int16 v44 = 1024;
      int v45 = v30;
      __int16 v46 = 1024;
      int v47 = v7;
      _os_log_impl(&dword_1E4BFE000, v21, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getHexDeviceAddress:] [BTDevice-Only] btDevice: %@, inAddress:0x%02X%02X%02X%02X%02X%02X, returnValue:%i", (uint8_t *)&v32, 0x36u);
    }
    BOOL v20 = v7 == 0;
  }

  return v20;
}

- (BOOL)inEarDetectEnabled
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 inEarDetectEnabled];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    int v7 = [v6 cbDevice];
    BOOL v8 = [v7 placementMode] == 1;

    uint64_t v5 = [NSNumber numberWithBool:v5];
    unsigned int v9 = [v5 stringValue];
    v10 = [NSNumber numberWithBool:v8];
    v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[inEarDetectEnabled]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LOBYTE(v5) = v8;
  }
  else
  {
    id v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(HPSDevice *)self btsDevice];
      id v14 = [v13 classicDevice];
      id v15 = [v14 address];
      int v17 = 138412546;
      __int16 v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [inEarDetectEnabled] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)inEarStatusPrimary:(int *)a3 secondary:(int *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v7 = [(HPSDevice *)self btsDevice];
  BOOL v8 = [v7 classicDevice];
  LODWORD(v9) = [v8 inEarStatusPrimary:a3 secondary:a4];

  v10 = NSString;
  v11 = [NSNumber numberWithUnsignedInt:*a3];
  id v12 = [NSNumber numberWithUnsignedInt:*a4];
  id v13 = [v10 stringWithFormat:@"%@-%@", v11, v12];

  if (self->_ffValue && self->_headphoneDevice)
  {
    id v14 = [(HPSDevice *)self headphoneDevice];
    id v15 = [v14 cbDevice];
    unsigned int v16 = [v15 primaryPlacement] - 1;
    if (v16 > 6) {
      int v17 = 3;
    }
    else {
      int v17 = dword_1E4CC4830[v16];
    }
    *a3 = v17;

    uint64_t v24 = [(HPSDevice *)self headphoneDevice];
    int v25 = [v24 cbDevice];
    unsigned int v26 = [v25 secondaryPlacement] - 1;
    if (v26 > 6) {
      int v27 = 3;
    }
    else {
      int v27 = dword_1E4CC4830[v26];
    }
    *a4 = v27;

    int v28 = NSString;
    int v29 = [NSNumber numberWithUnsignedInt:*a3];
    int v30 = [NSNumber numberWithUnsignedInt:*a4];
    unsigned int v9 = [v28 stringWithFormat:@"%@-%@", v29, v30];

    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[inEarStatusPrimary:secondary:]" btsDeviceValue:v13 headphoneDeviceValue:v9];
    LOBYTE(v9) = 1;
  }
  else
  {
    __int16 v18 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = [(HPSDevice *)self btsDevice];
      int v20 = [v19 classicDevice];
      uint64_t v21 = [v20 address];
      int v22 = *a3;
      int v23 = *a4;
      *(_DWORD *)buf = 138413058;
      __int16 v33 = v21;
      __int16 v34 = 1024;
      int v35 = v22;
      __int16 v36 = 1024;
      int v37 = v23;
      __int16 v38 = 1024;
      int v39 = (int)v9;
      _os_log_impl(&dword_1E4BFE000, v18, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [inEarStatusPrimary:secondary:] [BTDevice-Only] btDevice: %@, inPrimary:%i, inSecondary:%i, returnValue:%i", buf, 0x1Eu);
    }
  }

  return (char)v9;
}

- (BOOL)isAppleAudioDevice
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 isAppleAudioDevice];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    int v7 = [v6 cbDevice];
    int v8 = [v7 productID];
    uint64_t v9 = ((v8 - 8194) < 0x25) & (0x1C7BB7FF9BuLL >> (v8 - 2));

    uint64_t v5 = [NSNumber numberWithBool:v5];
    v10 = [v5 stringValue];
    v11 = [NSNumber numberWithBool:v9];
    id v12 = [v11 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[isAppleAudioDevice]" btsDeviceValue:v10 headphoneDeviceValue:v12];

    LOBYTE(v5) = v9;
  }
  else
  {
    id v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(HPSDevice *)self btsDevice];
      id v15 = [v14 classicDevice];
      unsigned int v16 = [v15 address];
      int v18 = 138412546;
      __int16 v19 = v16;
      __int16 v20 = 1024;
      int v21 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isAppleAudioDevice] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)isGenuineAirPods
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 isGenuineAirPods];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    int v7 = [v6 cbDevice];
    BOOL v8 = ([v7 gapaFlags] & 2) == 0;

    uint64_t v5 = [NSNumber numberWithBool:v5];
    uint64_t v9 = [v5 stringValue];
    v10 = [NSNumber numberWithBool:v8];
    v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[isGenuineAirPods]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LOBYTE(v5) = v8;
  }
  else
  {
    id v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(HPSDevice *)self btsDevice];
      id v14 = [v13 classicDevice];
      id v15 = [v14 address];
      int v17 = 138412546;
      int v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isGenuineAirPods] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return (char)v5;
}

- (unsigned)listeningModeConfigs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 listeningModeConfigs];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 listeningModeConfigs];

    uint64_t v5 = [NSNumber numberWithUnsignedInt:v5];
    BOOL v8 = [v5 stringValue];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v7];
    v10 = [v9 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[listeningModeConfigs]" btsDeviceValue:v8 headphoneDeviceValue:v10];

    LODWORD(v5) = v7;
  }
  else
  {
    v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(HPSDevice *)self btsDevice];
      id v13 = [v12 classicDevice];
      id v14 = [v13 address];
      int v16 = 138412546;
      int v17 = v14;
      __int16 v18 = 1024;
      int v19 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [listeningModeConfigs] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);
    }
  }
  return v5;
}

- (unsigned)micMode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 micMode];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    int v7 = [v6 microphoneMode];
    if (v7 == 3) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2 * (v7 == 2);
    }

    uint64_t v5 = [NSNumber numberWithUnsignedInt:v5];
    uint64_t v9 = [v5 stringValue];
    v10 = [NSNumber numberWithUnsignedInt:v8];
    v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[micMode]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LODWORD(v5) = v8;
  }
  else
  {
    id v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(HPSDevice *)self btsDevice];
      id v14 = [v13 classicDevice];
      id v15 = [v14 address];
      int v17 = 138412546;
      __int16 v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [micMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return v5;
}

- (unsigned)productId
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HPSDevice *)self btsDevice];
  v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 productId];

  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = [(HPSDevice *)self headphoneDevice];
    int v7 = [v6 productInfo];
    uint64_t v8 = [v7 productID];

    uint64_t v5 = [NSNumber numberWithUnsignedInt:v5];
    uint64_t v9 = [v5 stringValue];
    v10 = [NSNumber numberWithUnsignedInt:v8];
    v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[productId]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LODWORD(v5) = v8;
  }
  else
  {
    id v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(HPSDevice *)self btsDevice];
      id v14 = [v13 classicDevice];
      id v15 = [v14 address];
      int v17 = 138412546;
      __int16 v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [productId] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return v5;
}

- (void)setAdaptiveVolumeMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [(HPSDevice *)self btsDevice];
    v6 = [v5 classicDevice];
    char v7 = [v6 getAdaptiveVolumeMode];

    uint64_t v8 = [(HPSDevice *)self headphoneDevice];
    [v8 setAdaptiveVolume:v3 == 1];

    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    [v9 updateFeatureValuesWithFeature:20];

    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    v11 = dispatch_get_global_queue(0, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __35__HPSDevice_setAdaptiveVolumeMode___block_invoke;
    v18[3] = &unk_1E6EA8EA8;
    v18[4] = self;
    int v19 = v3;
    char v20 = v7;
    dispatch_after(v10, v11, v18);
  }
  else
  {
    id v12 = [(HPSDevice *)self btsDevice];
    id v13 = [v12 classicDevice];
    [v13 setAdaptiveVolumeMode:v3];

    id v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(HPSDevice *)self btsDevice];
      int v16 = [v15 classicDevice];
      int v17 = [v16 address];
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v17;
      __int16 v23 = 1024;
      int v24 = v3;
      _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setAdaptiveVolumeMode:] [BTDevice-Only] btDevice: %@, inputAdaptiveVolumeMode:%i", buf, 0x12u);
    }
  }
}

void __35__HPSDevice_setAdaptiveVolumeMode___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = [v11 stringValue];
  v4 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 44)];
  uint64_t v5 = [v4 stringValue];
  v6 = NSNumber;
  char v7 = [*(id *)(a1 + 32) btsDevice];
  uint64_t v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(v8, "getAdaptiveVolumeMode"));
  dispatch_time_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setAdaptiveVolumeMode:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (BOOL)setClickHoldMode:(int)a3 rightMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    unsigned int v36 = 0;
    *(_DWORD *)buf = 0;
    [(HPSDevice *)self clickHoldMode:buf rightAction:&v36];
    char v7 = NSString;
    uint64_t v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
    uint64_t v9 = [v8 stringValue];
    dispatch_time_t v10 = [NSNumber numberWithUnsignedInt:v36];
    id v11 = [v10 stringValue];
    id v12 = [v7 stringWithFormat:@"%@-%@", v9, v11];

    id v13 = NSString;
    id v14 = [NSNumber numberWithUnsignedInt:v5];
    id v15 = [v14 stringValue];
    int v16 = [NSNumber numberWithUnsignedInt:v4];
    int v17 = [v16 stringValue];
    __int16 v18 = [v13 stringWithFormat:@"%@-%@", v15, v17];

    int v19 = [(HPSDevice *)self headphoneDevice];
    [v19 setClickHoldModeLeft:v5];

    char v20 = [(HPSDevice *)self headphoneDevice];
    [v20 setClickHoldModeRight:v4];

    uint64_t v21 = [(HPSDevice *)self headphoneDevice];
    [v21 updateFeatureValuesWithFeature:2];

    dispatch_time_t v22 = dispatch_time(0, 5000000000);
    __int16 v23 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__HPSDevice_setClickHoldMode_rightMode___block_invoke;
    block[3] = &unk_1E6EA8998;
    block[4] = self;
    id v34 = v18;
    id v35 = v12;
    id v24 = v12;
    id v25 = v18;
    dispatch_after(v22, v23, block);

    LOBYTE(v25) = 1;
  }
  else
  {
    unsigned int v26 = [(HPSDevice *)self btsDevice];
    int v27 = [v26 classicDevice];
    LODWORD(v25) = [v27 setClickHoldMode:v5 rightMode:v4];

    int v28 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [(HPSDevice *)self btsDevice];
      int v30 = [v29 classicDevice];
      __int16 v31 = [v30 address];
      *(_DWORD *)buf = 138413058;
      __int16 v38 = v31;
      __int16 v39 = 1024;
      int v40 = v5;
      __int16 v41 = 1024;
      int v42 = v4;
      __int16 v43 = 1024;
      int v44 = (int)v25;
      _os_log_impl(&dword_1E4BFE000, v28, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setClickHoldMode:rightMode:] [BTDevice-Only] btDevice: %@, inputLeftMode:%i, inputRightMode:%i, returnValue:%i", buf, 0x1Eu);
    }
  }
  return (char)v25;
}

void __40__HPSDevice_setClickHoldMode_rightMode___block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  [*(id *)(a1 + 32) clickHoldMode:(char *)&v8 + 4 rightAction:&v8];
  v2 = NSString;
  uint64_t v3 = [NSNumber numberWithUnsignedInt:HIDWORD(v8)];
  uint64_t v4 = [v3 stringValue];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v8];
  v6 = [v5 stringValue];
  char v7 = [v2 stringWithFormat:@"%@-%@", v4, v6];

  [*(id *)(a1 + 32) _logSetterExpectationFormatStringForUsecase:@"[setClickHoldMode:rightMode:]" inputValue:*(void *)(a1 + 40) existingValue:*(void *)(a1 + 48) readBackValue:v7];
}

- (void)setConversationDetectMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = a3;
    v6 = [(HPSDevice *)self btsDevice];
    char v7 = [v6 classicDevice];
    uint64_t v8 = [v7 getConversationDetectMode];

    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    [v9 setConversationDetect:v3 == 1];

    dispatch_time_t v10 = [(HPSDevice *)self headphoneDevice];
    [v10 updateFeatureValuesWithFeature:19];

    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    id v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HPSDevice_setConversationDetectMode___block_invoke;
    block[3] = &unk_1E6EA89C0;
    block[4] = self;
    void block[5] = v5;
    block[6] = v8;
    dispatch_after(v11, v12, block);
  }
  else
  {
    id v13 = [(HPSDevice *)self btsDevice];
    id v14 = [v13 classicDevice];
    [v14 setConversationDetectMode:v3];

    id v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(HPSDevice *)self btsDevice];
      int v16 = [v15 classicDevice];
      int v17 = [v16 address];
      *(_DWORD *)buf = 138412546;
      char v20 = v17;
      __int16 v21 = 1024;
      int v22 = v3;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setConversationDetectMode:] [BTDevice-Only] btDevice: %@, inputConversationDetectMode:%i", buf, 0x12u);
    }
  }
}

void __39__HPSDevice_setConversationDetectMode___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  uint64_t v3 = [v11 stringValue];
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  uint64_t v5 = [v4 stringValue];
  v6 = NSNumber;
  char v7 = [*(id *)(a1 + 32) btsDevice];
  uint64_t v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(v8, "getConversationDetectMode"));
  dispatch_time_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setConversationDetectMode:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (BOOL)setCrownRotationDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = a3;
    v6 = [(HPSDevice *)self btsDevice];
    char v7 = [v6 classicDevice];
    uint64_t v8 = [v7 crownRotationDirection];

    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    [v9 setCrownRotationDirection:v3];

    dispatch_time_t v10 = [(HPSDevice *)self headphoneDevice];
    [v10 updateFeatureValuesWithFeature:4];

    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    id v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HPSDevice_setCrownRotationDirection___block_invoke;
    block[3] = &unk_1E6EA89C0;
    block[4] = self;
    void block[5] = v5;
    block[6] = v8;
    dispatch_after(v11, v12, block);

    LOBYTE(v12) = 1;
  }
  else
  {
    id v13 = [(HPSDevice *)self btsDevice];
    id v14 = [v13 classicDevice];
    LODWORD(v12) = [v14 setCrownRotationDirection:v3];

    id v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(HPSDevice *)self btsDevice];
      int v17 = [v16 classicDevice];
      __int16 v18 = [v17 address];
      *(_DWORD *)buf = 138412802;
      int v22 = v18;
      __int16 v23 = 1024;
      int v24 = v3;
      __int16 v25 = 1024;
      int v26 = (int)v12;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setCrownRotationDirection:] [BTDevice-Only] btDevice: %@, inputCrownDirection:%i, resultValue:%i", buf, 0x18u);
    }
  }
  return (char)v12;
}

void __39__HPSDevice_setCrownRotationDirection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  uint64_t v3 = [v11 stringValue];
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  uint64_t v5 = [v4 stringValue];
  v6 = NSNumber;
  char v7 = [*(id *)(a1 + 32) btsDevice];
  uint64_t v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "crownRotationDirection"));
  dispatch_time_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setCrownRotationDirection:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (void)setDeviceSoundProfileAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [(HPSDevice *)self btsDevice];
    v6 = [v5 classicDevice];
    char v7 = [v6 getDeviceSoundProfileAllowed];

    uint64_t v8 = objc_alloc_init(MEMORY[0x1E4F1BD38]);
    uint64_t v9 = v8;
    if (v3) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    [v8 setSpatialSoundProfileAllowed:v10];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1BD30]);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__HPSDevice_setDeviceSoundProfileAllowed___block_invoke;
    v18[3] = &unk_1E6EA8ED0;
    id v19 = v11;
    char v20 = self;
    BOOL v21 = v3;
    char v22 = v7;
    id v12 = v11;
    [v12 modifyControllerSettings:v9 completionHandler:v18];
  }
  else
  {
    id v13 = [(HPSDevice *)self btsDevice];
    id v14 = [v13 classicDevice];
    [v14 setDeviceSoundProfileAllowed:v3];

    uint64_t v9 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(HPSDevice *)self btsDevice];
      int v16 = [v15 classicDevice];
      int v17 = [v16 address];
      *(_DWORD *)buf = 138412546;
      int v24 = v17;
      __int16 v25 = 1024;
      BOOL v26 = v3;
      _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setDeviceSoundProfileAllowed:] [BTDevice-Only] btDevice: %@, inputEnabled:%i,", buf, 0x12u);
    }
  }
}

void __42__HPSDevice_setDeviceSoundProfileAllowed___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = *(void **)(a1 + 40);
  id v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  BOOL v3 = [v11 stringValue];
  uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  uint64_t v5 = [v4 stringValue];
  v6 = NSNumber;
  char v7 = [*(id *)(a1 + 40) btsDevice];
  uint64_t v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v8, "getDeviceSoundProfileAllowed"));
  uint64_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setDeviceSoundProfileAllowed:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (BOOL)setDoubleTapAction:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [(HPSDevice *)self headphoneDevice];
    unsigned int v6 = [v5 doubleTapActionRight] - 1;
    if (v6 >= 5) {
      uint64_t v7 = 0xFFFFLL;
    }
    else {
      uint64_t v7 = v6;
    }

    char v8 = cbTapActionForBT(v3);
    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    uint64_t v10 = v8;
    [v9 setDoubleTapActionLeft:v10];

    id v11 = [(HPSDevice *)self headphoneDevice];
    [v11 setDoubleTapActionRight:v10];

    id v12 = [(HPSDevice *)self headphoneDevice];
    [v12 updateFeatureValuesWithFeature:3];

    dispatch_time_t v14 = dispatch_time(0, 5000000000);
    id v13 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__HPSDevice_setDoubleTapAction___block_invoke;
    block[3] = &unk_1E6EA8EF8;
    int v23 = v3;
    block[4] = self;
    void block[5] = v7;
    dispatch_after(v14, v13, block);

    LOBYTE(v14) = 1;
  }
  else
  {
    id v15 = [(HPSDevice *)self btsDevice];
    int v16 = [v15 classicDevice];
    LODWORD(v14) = [v16 setDoubleTapAction:v3];

    int v17 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [(HPSDevice *)self btsDevice];
      id v19 = [v18 classicDevice];
      char v20 = [v19 address];
      *(_DWORD *)buf = 138412802;
      __int16 v25 = v20;
      __int16 v26 = 1024;
      int v27 = v3;
      __int16 v28 = 1024;
      int v29 = v14;
      _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setDoubleTapAction:] [BTDevice-Only] btDevice: %@, inputAction:%i, resultValue:%i", buf, 0x18u);
    }
  }
  return v14;
}

void __32__HPSDevice_setDoubleTapAction___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v11 stringValue];
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  uint64_t v5 = [v4 stringValue];
  unsigned int v6 = NSNumber;
  uint64_t v7 = [*(id *)(a1 + 32) btsDevice];
  char v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "doubleTapAction"));
  uint64_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setDoubleTapAction:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (BOOL)setDoubleTapActionEx:(unsigned int)a3 rightAction:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v7 = NSString;
    char v8 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v4];
    uint64_t v10 = [v7 stringWithFormat:@"%@-%@", v8, v9];

    unsigned int v36 = 0;
    *(_DWORD *)buf = 0;
    id v11 = [(HPSDevice *)self btsDevice];
    id v12 = [v11 classicDevice];
    [v12 doubleTapActionEx:buf rightAction:&v36];

    id v13 = NSString;
    dispatch_time_t v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
    id v15 = [NSNumber numberWithUnsignedInt:v36];
    int v16 = [v13 stringWithFormat:@"%@-%@", v14, v15];

    char v17 = cbTapActionForBT(v5);
    __int16 v18 = [(HPSDevice *)self headphoneDevice];
    [v18 setDoubleTapActionLeft:v17];

    char v19 = cbTapActionForBT(v4);
    char v20 = [(HPSDevice *)self headphoneDevice];
    [v20 setDoubleTapActionRight:v19];

    BOOL v21 = [(HPSDevice *)self headphoneDevice];
    [v21 updateFeatureValuesWithFeature:3];

    dispatch_time_t v22 = dispatch_time(0, 5000000000);
    int v23 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HPSDevice_setDoubleTapActionEx_rightAction___block_invoke;
    block[3] = &unk_1E6EA8998;
    block[4] = self;
    id v34 = v10;
    id v35 = v16;
    id v24 = v16;
    id v25 = v10;
    dispatch_after(v22, v23, block);

    LOBYTE(v25) = 1;
  }
  else
  {
    __int16 v26 = [(HPSDevice *)self btsDevice];
    int v27 = [v26 classicDevice];
    LODWORD(v25) = [v27 setDoubleTapActionEx:v5 rightAction:v4];

    __int16 v28 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [(HPSDevice *)self btsDevice];
      uint64_t v30 = [v29 classicDevice];
      __int16 v31 = [v30 address];
      *(_DWORD *)buf = 138413058;
      __int16 v38 = v31;
      __int16 v39 = 1024;
      int v40 = v5;
      __int16 v41 = 1024;
      int v42 = v4;
      __int16 v43 = 1024;
      int v44 = (int)v25;
      _os_log_impl(&dword_1E4BFE000, v28, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setDoubleTapActionEx:rightAction:] [BTDevice-Only] btDevice: %@, inputLeftAction:%i, inputRightAction:%i, returnValue:%i", buf, 0x1Eu);
    }
  }
  return (char)v25;
}

void __46__HPSDevice_setDoubleTapActionEx_rightAction___block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  v2 = [*(id *)(a1 + 32) btsDevice];
  uint64_t v3 = [v2 classicDevice];
  [v3 doubleTapActionEx:(char *)&v8 + 4 rightAction:&v8];

  uint64_t v4 = NSString;
  uint64_t v5 = [NSNumber numberWithUnsignedInt:HIDWORD(v8)];
  unsigned int v6 = [NSNumber numberWithUnsignedInt:v8];
  uint64_t v7 = [v4 stringWithFormat:@"%@-%@", v5, v6];

  [*(id *)(a1 + 32) _logSetterExpectationFormatStringForUsecase:@"[setDoubleTapActionEx:rightAction:]" inputValue:*(void *)(a1 + 40) existingValue:*(void *)(a1 + 48) readBackValue:v7];
}

- (BOOL)setListeningModeConfigs:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [(HPSDevice *)self btsDevice];
    unsigned int v6 = [v5 classicDevice];
    int v12 = [v6 listeningModeConfigs];

    uint64_t v7 = [(HPSDevice *)self headphoneDevice];
    [v7 setListeningModeConfigs:v3];

    uint64_t v8 = objc_opt_new();
    [v8 setListeningModeConfigs:v3];
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [(HPSDevice *)self headphoneDevice];
    id v11 = [v10 cbDevice];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __37__HPSDevice_setListeningModeConfigs___block_invoke;
    v19[3] = &unk_1E6EA8F20;
    v19[4] = self;
    int v20 = v3;
    int v21 = v12;
    [v9 modifyDevice:v11 settings:v8 completion:v19];

    LOBYTE(v12) = 1;
  }
  else
  {
    id v13 = [(HPSDevice *)self btsDevice];
    dispatch_time_t v14 = [v13 classicDevice];
    int v12 = [v14 setListeningModeConfigs:v3];

    uint64_t v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(HPSDevice *)self btsDevice];
      int v16 = [v15 classicDevice];
      char v17 = [v16 address];
      *(_DWORD *)buf = 138412802;
      int v23 = v17;
      __int16 v24 = 1024;
      int v25 = v3;
      __int16 v26 = 1024;
      int v27 = v12;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setListeningModeConfigs:] [BTDevice-Only] btDevice: %@, inputModeConfigs:%i, returnValue:%i", buf, 0x18u);
    }
  }

  return v12;
}

void __37__HPSDevice_setListeningModeConfigs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    unsigned int v6 = *(void **)(a1 + 32);
    uint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    uint64_t v5 = [v4 stringValue];
    uint64_t v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
    uint64_t v8 = [v7 stringValue];
    uint64_t v9 = NSNumber;
    uint64_t v10 = [*(id *)(a1 + 32) btsDevice];
    id v11 = [v10 classicDevice];
    int v12 = objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v11, "listeningModeConfigs"));
    id v13 = [v12 stringValue];
    [v6 _logSetterExpectationFormatStringForUsecase:@"[setListeningModeConfigs:]" inputValue:v5 existingValue:v8 readBackValue:v13];

    goto LABEL_5;
  }
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 localizedDescription];
    int v14 = 138412290;
    id v15 = v5;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: setListeningModeConfigs: unable to modify modeCofig %@", (uint8_t *)&v14, 0xCu);
LABEL_5:
  }
}

- (BOOL)setMicMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    unsigned int v5 = [(HPSDevice *)self micMode];
    LOBYTE(v6) = 1;
    if (v3 == 2) {
      unsigned int v7 = 2;
    }
    else {
      unsigned int v7 = 1;
    }
    if (v3 == 1) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = v7;
    }
    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    [v9 setMicrophoneMode:v8];

    uint64_t v10 = [(HPSDevice *)self headphoneDevice];
    [v10 updateFeatureValuesWithFeature:7];

    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    int v12 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __24__HPSDevice_setMicMode___block_invoke;
    v20[3] = &unk_1E6EA8318;
    v20[4] = self;
    int v21 = v3;
    unsigned int v22 = v5;
    dispatch_after(v11, v12, v20);
  }
  else
  {
    id v13 = [(HPSDevice *)self btsDevice];
    int v14 = [v13 classicDevice];
    int v6 = [v14 setMicMode:v3];

    id v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(HPSDevice *)self btsDevice];
      char v17 = [v16 classicDevice];
      __int16 v18 = [v17 address];
      *(_DWORD *)buf = 138412802;
      __int16 v24 = v18;
      __int16 v25 = 1024;
      int v26 = v3;
      __int16 v27 = 1024;
      int v28 = v6;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setMicMode:] [BTDevice-Only] btDevice: %@, inputMode:%i, returnValue:%i", buf, 0x18u);
    }
  }
  return v6;
}

void __24__HPSDevice_setMicMode___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = [v11 stringValue];
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
  unsigned int v5 = [v4 stringValue];
  int v6 = NSNumber;
  unsigned int v7 = [*(id *)(a1 + 32) btsDevice];
  uint64_t v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "micMode"));
  uint64_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setMicMode:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (BOOL)setSmartRouteMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    unsigned int v5 = [(HPSDevice *)self btsDevice];
    int v6 = [v5 classicDevice];
    uint64_t v7 = [v6 smartRouteMode];

    uint64_t v8 = [(HPSDevice *)self headphoneDevice];
    [v8 setSmartRoutingMode:(char)v3];

    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    [v9 updateFeatureValuesWithFeature:6];

    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    uint64_t v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__HPSDevice_setSmartRouteMode___block_invoke;
    block[3] = &unk_1E6EA8F48;
    char v20 = v3;
    block[4] = self;
    void block[5] = v7;
    dispatch_after(v11, v10, block);

    LOBYTE(v11) = 1;
  }
  else
  {
    int v12 = [(HPSDevice *)self btsDevice];
    id v13 = [v12 classicDevice];
    LODWORD(v11) = [v13 setSmartRouteMode:v3];

    int v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(HPSDevice *)self btsDevice];
      uint64_t v16 = [v15 classicDevice];
      char v17 = [v16 address];
      *(_DWORD *)buf = 138412802;
      unsigned int v22 = v17;
      __int16 v23 = 1024;
      int v24 = v3;
      __int16 v25 = 1024;
      int v26 = v11;
      _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setSmartRouteMode:] [BTDevice-Only] btDevice: %@, inputSRMode:%i, returnValue:%i", buf, 0x18u);
    }
  }
  return v11;
}

void __31__HPSDevice_setSmartRouteMode___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v3 = [v11 stringValue];
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  unsigned int v5 = [v4 stringValue];
  int v6 = NSNumber;
  uint64_t v7 = [*(id *)(a1 + 32) btsDevice];
  uint64_t v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(v8, "smartRouteMode"));
  uint64_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setSmartRouteMode:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (unsigned)smartRouteMode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 classicDevice];
  unsigned int v5 = (void *)[v4 smartRouteMode];

  if (self->_ffValue && self->_headphoneDevice)
  {
    int v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 smartRoutingMode];

    unsigned int v5 = [NSNumber numberWithUnsignedChar:v5];
    uint64_t v8 = [v5 stringValue];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v7];
    uint64_t v10 = [v9 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[smartRouteMode]" btsDeviceValue:v8 headphoneDeviceValue:v10];

    LOBYTE(v5) = v7;
  }
  else
  {
    id v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(HPSDevice *)self btsDevice];
      id v13 = [v12 classicDevice];
      int v14 = [v13 address];
      int v16 = 138412546;
      char v17 = v14;
      __int16 v18 = 1024;
      int v19 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [smartRouteMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);
    }
  }
  return v5;
}

- (BOOL)smartRouteSupport
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 classicDevice];
  unsigned int v5 = (void *)[v4 smartRouteSupport];

  if (self->_ffValue && self->_headphoneDevice)
  {
    int v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 supportsFeatureWithFeature:6];

    unsigned int v5 = [NSNumber numberWithBool:v5];
    uint64_t v8 = [v5 stringValue];
    uint64_t v9 = [NSNumber numberWithBool:v7];
    uint64_t v10 = [v9 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[smartRouteSupport]" btsDeviceValue:v8 headphoneDeviceValue:v10];

    LOBYTE(v5) = v7;
  }
  else
  {
    id v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(HPSDevice *)self btsDevice];
      id v13 = [v12 classicDevice];
      int v14 = [v13 address];
      int v16 = 138412546;
      char v17 = v14;
      __int16 v18 = 1024;
      int v19 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [smartRouteSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);
    }
  }
  return (char)v5;
}

- (unsigned)vendorId
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 classicDevice];
  unsigned __int8 v5 = [v4 vendorId];

  if (self->_ffValue && self->_headphoneDevice)
  {
    int v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 cbDevice];
    uint64_t v8 = [v7 vendorID];

    uint64_t v9 = [NSNumber numberWithUnsignedChar:v5];
    uint64_t v10 = [v9 stringValue];
    id v11 = [NSNumber numberWithUnsignedInt:v8];
    int v12 = [v11 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[vendorId]" btsDeviceValue:v10 headphoneDeviceValue:v12];
  }
  else
  {
    id v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [(HPSDevice *)self btsDevice];
      id v15 = [v14 classicDevice];
      int v16 = [v15 address];
      LODWORD(v8) = v5;
      int v18 = 138412546;
      int v19 = v16;
      __int16 v20 = 1024;
      int v21 = v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [vendorId] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
    else
    {
      LODWORD(v8) = v5;
    }
  }
  return v8;
}

- (BOOL)connected
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 classicDevice];
  unsigned __int8 v5 = (void *)[v4 connected];

  if (self->_ffValue && self->_headphoneDevice)
  {
    int v6 = [MEMORY[0x1E4F65650] shared];
    uint64_t v7 = [v6 connectedHeadphones];
    uint64_t v8 = [(HPSDevice *)self address];
    uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@":" withString:@"-"];
    uint64_t v10 = [v7 objectForKey:v9];
    BOOL v11 = v10 != 0;

    unsigned __int8 v5 = [NSNumber numberWithBool:v5];
    int v12 = [v5 stringValue];
    id v13 = [NSNumber numberWithBool:v11];
    int v14 = [v13 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[connected]" btsDeviceValue:v12 headphoneDeviceValue:v14];

    LOBYTE(v5) = v11;
  }
  else
  {
    id v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(HPSDevice *)self btsDevice];
      char v17 = [v16 classicDevice];
      int v18 = [v17 address];
      int v20 = 138412546;
      int v21 = v18;
      __int16 v22 = 1024;
      int v23 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [connected] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v20, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)featureCapability:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v5 = [(HPSDevice *)self btsDevice];
  int v6 = [v5 classicDevice];
  uint64_t v7 = (void *)[v6 featureCapability:v3];

  if (self->_ffValue && self->_headphoneDevice)
  {
    switch(v3)
    {
      case 0x1C:
        BOOL v11 = [(HPSDevice *)self headphoneDevice];
        int v19 = [v11 cbDevice];
        if ([v19 autoAncCapability] == 1)
        {
          uint64_t v13 = 1;
        }
        else
        {
          int v20 = [(HPSDevice *)self headphoneDevice];
          uint64_t v13 = [v20 supportsFeatureWithFeature:1];
        }
        int v14 = @"FEATURE_LISTENING_MODE_CYCLABLE";
        break;
      case 0x20:
        BOOL v11 = [(HPSDevice *)self headphoneDevice];
        uint64_t v13 = [v11 supportsFeatureWithFeature:6];
        int v14 = @"FEATURE_TIPI";
        break;
      case 0x1E:
        uint64_t v8 = [(HPSDevice *)self headphoneDevice];
        uint64_t v9 = [v8 productInfo];
        char v10 = [v9 flags];

        BOOL v11 = [(HPSDevice *)self headphoneDevice];
        unsigned int v12 = [v11 supportsFeatureWithFeature:2];
        if ((v10 & 8) != 0) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = v12;
        }
        int v14 = @"FEATURE_CLICK_HOLD";
        break;
      default:
        -[HPSDevice featureCapability:]();
    }

    uint64_t v7 = [NSNumber numberWithBool:v7];
    int v21 = [v7 stringValue];
    __int16 v22 = [NSNumber numberWithBool:v13];
    int v23 = [v22 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[featureCapability:]" queryValue:v14 btsDeviceValue:v21 headphoneDeviceValue:v23];

    LOBYTE(v7) = v13;
  }
  else
  {
    id v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(HPSDevice *)self btsDevice];
      char v17 = [v16 classicDevice];
      int v18 = [v17 address];
      int v25 = 138412802;
      int v26 = v18;
      __int16 v27 = 1024;
      int v28 = v3;
      __int16 v29 = 1024;
      int v30 = (int)v7;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [featureCapability:] [BTDevice-Only] btDevice: %@, inputFeaturet:%i, returnValue:%i", (uint8_t *)&v25, 0x18u);
    }
  }
  return (char)v7;
}

- (id)identifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 identifier];

  if (self->_ffValue && self->_headphoneDevice)
  {
    unsigned __int8 v5 = [(HPSDevice *)self headphoneDevice];
    int v6 = [v5 btAddress];
    id v7 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@":"];

    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[identifier]" btsDeviceValue:v4 headphoneDeviceValue:v7];
  }
  else
  {
    uint64_t v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(HPSDevice *)self btsDevice];
      char v10 = [v9 classicDevice];
      BOOL v11 = [v10 address];
      int v13 = 138412546;
      int v14 = v11;
      __int16 v15 = 2112;
      int v16 = v4;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [identifier] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v13, 0x16u);
    }
    id v7 = v4;
  }

  return v7;
}

- (unsigned)listeningMode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 classicDevice];
  unsigned __int8 v5 = [v4 listeningMode];

  if (self->_ffValue && self->_headphoneDevice)
  {
    int v6 = [(HPSDevice *)self headphoneDevice];
    uint64_t v7 = [v6 listeningMode];

    uint64_t v8 = [NSNumber numberWithUnsignedChar:v5];
    uint64_t v9 = [v8 stringValue];
    char v10 = [NSNumber numberWithUnsignedInt:v7];
    BOOL v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[listeningMode]" btsDeviceValue:v9 headphoneDeviceValue:v11];
  }
  else
  {
    uint64_t v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [(HPSDevice *)self btsDevice];
      int v13 = [v12 classicDevice];
      int v14 = [v13 address];
      LODWORD(v7) = v5;
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 1024;
      int v19 = v5;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [listeningMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);
    }
    else
    {
      LODWORD(v7) = v5;
    }
  }

  return v7;
}

- (id)name
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 name];

  if (self->_ffValue && self->_headphoneDevice)
  {
    unsigned __int8 v5 = [(HPSDevice *)self headphoneDevice];
    id v6 = [v5 name];

    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[name]" btsDeviceValue:v4 headphoneDeviceValue:v6];
  }
  else
  {
    uint64_t v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(HPSDevice *)self btsDevice];
      uint64_t v9 = [v8 classicDevice];
      char v10 = [v9 address];
      int v12 = 138412546;
      int v13 = v10;
      __int16 v14 = 2112;
      __int16 v15 = v4;
      _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [name] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v12, 0x16u);
    }
    id v6 = v4;
  }

  return v6;
}

- (BOOL)setListeningMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    unsigned __int8 v5 = [(HPSDevice *)self btsDevice];
    id v6 = [v5 classicDevice];
    unsigned int v7 = [v6 listeningMode];

    uint64_t v8 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v37 = 0;
    uint64_t v32 = 0;
    __int16 v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 1;
    dispatch_group_enter(v8);
    uint64_t v9 = objc_opt_new();
    [v9 setListeningMode:v3];
    char v10 = objc_opt_new();
    BOOL v11 = dispatch_get_global_queue(0, 0);
    [v10 setDispatchQueue:v11];

    int v12 = [(HPSDevice *)self headphoneDevice];
    [v12 setIsUpdatingDeviceConfig:1];

    int v13 = [(HPSDevice *)self headphoneDevice];
    [v13 setListeningMode:v3];

    __int16 v14 = [(HPSDevice *)self headphoneDevice];
    __int16 v15 = [v14 cbDevice];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __30__HPSDevice_setListeningMode___block_invoke;
    v26[3] = &unk_1E6EA8F70;
    v26[4] = self;
    int v28 = buf;
    int v31 = v3;
    __int16 v29 = &v32;
    uint64_t v30 = v7;
    uint64_t v16 = v8;
    __int16 v27 = v16;
    [v10 modifyDevice:v15 settings:v9 completion:v26];

    dispatch_time_t v17 = dispatch_time(0, 100000000);
    dispatch_group_wait(v16, v17);
    if (*((unsigned char *)v33 + 24))
    {
      __int16 v18 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[HPSDevice setListeningMode:](v18);
      }
    }
    LOBYTE(v19) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v20 = [(HPSDevice *)self btsDevice];
    int v21 = [v20 classicDevice];
    int v19 = [v21 setListeningMode:v3];

    uint64_t v16 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [(HPSDevice *)self btsDevice];
      int v23 = [v22 classicDevice];
      uint64_t v24 = [v23 address];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v3;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v19;
      _os_log_impl(&dword_1E4BFE000, v16, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setListeningMode:] [BTDevice-Only] btDevice: %@, inputMode:%i, returnValue:%i", buf, 0x18u);
    }
  }

  return v19;
}

void __30__HPSDevice_setListeningMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 64);
    unsigned __int8 v5 = [*(id *)(a1 + 32) headphoneDevice];
    [v5 setListeningMode:v4];

    id v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [v3 localizedDescription];
      *(_DWORD *)buf = 138412290;
      __int16 v15 = v7;
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setListeningMode]: unable to modify mode %@", buf, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__HPSDevice_setListeningMode___block_invoke_154;
    block[3] = &unk_1E6EA8EF8;
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = *(_DWORD *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 64);
    block[4] = v9;
    void block[5] = v10;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
  BOOL v11 = [*(id *)(a1 + 32) headphoneDevice];
  [v11 setIsUpdatingDeviceConfig:0];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __30__HPSDevice_setListeningMode___block_invoke_154(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  id v3 = [v11 stringValue];
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  unsigned __int8 v5 = [v4 stringValue];
  id v6 = NSNumber;
  unsigned int v7 = [*(id *)(a1 + 32) headphoneDevice];
  dispatch_time_t v8 = [v7 cbDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v8, "listeningMode"));
  uint64_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"setListeningMode:" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (void)disconnect
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    id v3 = [(HPSDevice *)self btsDevice];
    uint64_t v4 = [v3 classicDevice];
    uint64_t v5 = [v4 connected];

    id v6 = objc_opt_new();
    unsigned int v7 = [(HPSDevice *)self headphoneDevice];
    dispatch_time_t v8 = [v7 cbDevice];
    [v6 setPeerDevice:v8];

    [v6 setServiceFlags:0xFFFFFFFFLL];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __23__HPSDevice_disconnect__block_invoke;
    v11[3] = &unk_1E6EA8F20;
    v11[4] = self;
    v11[5] = v5;
    [v6 disconnectWithCompletion:v11];
  }
  else
  {
    uint64_t v9 = [(HPSDevice *)self btsDevice];
    [v9 disconnect];

    id v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(HPSDevice *)self btsDevice];
      *(_DWORD *)buf = 138412290;
      int v13 = v10;
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [disconnect] [BTDevice-Only] btDevice: %@", buf, 0xCu);
    }
  }
}

void __23__HPSDevice_disconnect__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __23__HPSDevice_disconnect__block_invoke_cold_1(v3);
    }
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v4 = [&unk_1F40ABC98 stringValue];
    id v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    unsigned int v7 = [v6 stringValue];
    dispatch_time_t v8 = NSNumber;
    uint64_t v9 = [*(id *)(a1 + 32) btsDevice];
    uint64_t v10 = [v9 classicDevice];
    id v11 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v10, "connected"));
    int v12 = [v11 stringValue];
    [v5 _logSetterExpectationFormatStringForUsecase:@"[setListeningMode:]" inputValue:v4 existingValue:v7 readBackValue:v12];
  }
}

- (BOOL)paired
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = (void *)[v3 paired];

  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [MEMORY[0x1E4F65650] shared];
    id v6 = [v5 connectedHeadphones];
    unsigned int v7 = [(HPSDevice *)self address];
    dispatch_time_t v8 = [v7 stringByReplacingOccurrencesOfString:@":" withString:@"-"];
    uint64_t v9 = [v6 objectForKey:v8];
    BOOL v10 = v9 != 0;

    uint64_t v4 = [NSNumber numberWithBool:v4];
    id v11 = [v4 stringValue];
    int v12 = [NSNumber numberWithBool:v10];
    int v13 = [v12 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[paired]" btsDeviceValue:v11 headphoneDeviceValue:v13];

    LOBYTE(v4) = v10;
  }
  else
  {
    uint64_t v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [(HPSDevice *)self btsDevice];
      uint64_t v16 = [v15 classicDevice];
      dispatch_time_t v17 = [v16 address];
      int v19 = 138412546;
      uint64_t v20 = v17;
      __int16 v21 = 1024;
      int v22 = (int)v4;
      _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [paired] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v19, 0x12u);
    }
  }
  return (char)v4;
}

- (id)productName
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 productName];

  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [(HPSDevice *)self headphoneDevice];
    id v6 = [v5 cbDevice];
    id v7 = [v6 productName];

    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[productName]" btsDeviceValue:v4 headphoneDeviceValue:v7];
  }
  else
  {
    dispatch_time_t v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(HPSDevice *)self btsDevice];
      BOOL v10 = [v9 classicDevice];
      id v11 = [v10 address];
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [productName] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v13, 0x16u);
    }
    id v7 = v4;
  }

  return v7;
}

- (void)unpair
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    id v3 = [(HPSDevice *)self btsDevice];
    uint64_t v4 = [v3 classicDevice];
    uint64_t v5 = [v4 paired];

    id v6 = objc_opt_new();
    id v7 = [(HPSDevice *)self headphoneDevice];
    dispatch_time_t v8 = [v7 cbDevice];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __19__HPSDevice_unpair__block_invoke;
    v11[3] = &unk_1E6EA8F20;
    v11[4] = self;
    v11[5] = v5;
    [v6 deleteDevice:v8 completion:v11];
  }
  else
  {
    uint64_t v9 = [(HPSDevice *)self btsDevice];
    [v9 unpair];

    id v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(HPSDevice *)self btsDevice];
      *(_DWORD *)buf = 138412290;
      int v13 = v10;
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [unpair] [BTDevice-Only] btDevice: %@", buf, 0xCu);
    }
  }
}

void __19__HPSDevice_unpair__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __19__HPSDevice_unpair__block_invoke_cold_1(v3);
    }
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v4 = [&unk_1F40ABC98 stringValue];
    id v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    id v7 = [v6 stringValue];
    dispatch_time_t v8 = NSNumber;
    uint64_t v9 = [*(id *)(a1 + 32) btsDevice];
    BOOL v10 = [v9 classicDevice];
    id v11 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v10, "paired"));
    int v12 = [v11 stringValue];
    [v5 _logSetterExpectationFormatStringForUsecase:@"[unpair]" inputValue:v4 existingValue:v7 readBackValue:v12];
  }
}

- (unsigned)doubleTapCapability
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 doubleTapCapability];

  if (self->_ffValue && self->_headphoneDevice)
  {
    id v6 = [(HPSDevice *)self headphoneDevice];
    id v7 = [v6 cbDevice];
    int v8 = [v7 doubleTapCapability];
    if (v8 == 3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 2;
    }

    uint64_t v5 = [NSNumber numberWithUnsignedInt:v5];
    BOOL v10 = [v5 stringValue];
    id v11 = [NSNumber numberWithUnsignedInt:v9];
    int v12 = [v11 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[doubleTapCapability]" btsDeviceValue:v10 headphoneDeviceValue:v12];

    LODWORD(v5) = v9;
  }
  else
  {
    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(HPSDevice *)self btsDevice];
      __int16 v15 = [v14 classicDevice];
      uint64_t v16 = [v15 address];
      int v18 = 138412546;
      int v19 = v16;
      __int16 v20 = 1024;
      int v21 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [doubleTapCapability] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
  }
  return v5;
}

- (unsigned)getConversationDetectMode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 getConversationDetectMode];

  if (self->_ffValue && self->_headphoneDevice)
  {
    id v6 = [(HPSDevice *)self headphoneDevice];
    if ([v6 conversationDetect]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }

    uint64_t v5 = [NSNumber numberWithUnsignedChar:v5];
    int v8 = [v5 stringValue];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v7];
    BOOL v10 = [v9 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getConversationDetectMode]" btsDeviceValue:v8 headphoneDeviceValue:v10];

    LOBYTE(v5) = v7;
  }
  else
  {
    id v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(HPSDevice *)self btsDevice];
      int v13 = [v12 classicDevice];
      uint64_t v14 = [v13 address];
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 1024;
      int v19 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getConversationDetectMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);
    }
  }
  return v5;
}

- (void)setDeviceAdaptiveVolumeMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [(HPSDevice *)self btsDevice];
    id v6 = [v5 classicDevice];
    char v7 = [v6 getDeviceAdaptiveVolumeMode];

    [(HPSDevice *)self setAdaptiveVolumeMode:v3];
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__HPSDevice_setDeviceAdaptiveVolumeMode___block_invoke;
    v16[3] = &unk_1E6EA8EA8;
    v16[4] = self;
    int v17 = v3;
    char v18 = v7;
    dispatch_after(v8, v9, v16);
  }
  else
  {
    BOOL v10 = [(HPSDevice *)self btsDevice];
    id v11 = [v10 classicDevice];
    [v11 setDeviceAdaptiveVolumeMode:v3];

    int v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(HPSDevice *)self btsDevice];
      uint64_t v14 = [v13 classicDevice];
      __int16 v15 = [v14 address];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v15;
      __int16 v21 = 1024;
      int v22 = v3;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setDeviceAdaptiveVolumeMode:] [BTDevice-Only] btDevice: %@, volMode:%i", buf, 0x12u);
    }
  }
}

void __41__HPSDevice_setDeviceAdaptiveVolumeMode___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = [v11 stringValue];
  uint64_t v4 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 44)];
  uint64_t v5 = [v4 stringValue];
  id v6 = NSNumber;
  char v7 = [*(id *)(a1 + 32) btsDevice];
  dispatch_time_t v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(v8, "getDeviceAdaptiveVolumeMode"));
  BOOL v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setDeviceAdaptiveVolumeMode:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- (BOOL)setUserName:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_ffValue && self->_headphoneDevice)
  {
    id v6 = v4;
    char v7 = [(HPSDevice *)self btsDevice];
    uint64_t v14 = [v7 name];

    dispatch_time_t v8 = [(HPSDevice *)self headphoneDevice];
    [v8 setName:v6];

    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    [v9 updateFeatureValuesWithFeature:0];

    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__HPSDevice_setUserName___block_invoke;
    block[3] = &unk_1E6EA8998;
    block[4] = self;
    id v22 = v6;
    id v23 = v14;
    id v12 = v14;
    int v13 = v6;
    dispatch_after(v10, v11, block);

    LOBYTE(v14) = 1;
  }
  else
  {
    __int16 v15 = [(HPSDevice *)self btsDevice];
    int v16 = [v15 classicDevice];
    LODWORD(v14) = [v16 setUserName:v5];

    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [(HPSDevice *)self btsDevice];
      char v18 = [v17 classicDevice];
      int v19 = [v18 address];
      *(_DWORD *)buf = 138412802;
      int v25 = v19;
      __int16 v26 = 2112;
      __int16 v27 = v5;
      __int16 v28 = 1024;
      int v29 = (int)v14;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setUserName:] [BTDevice-Only] btDevice: %@, inputName:%@ didSet:%i", buf, 0x1Cu);
    }
  }

  return (char)v14;
}

void __25__HPSDevice_setUserName___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v5 = [v1 btsDevice];
  id v4 = [v5 name];
  [v1 _logSetterExpectationFormatStringForUsecase:@"[setUserName:]" inputValue:v2 existingValue:v3 readBackValue:v4];
}

- (BOOL)setInEarDetectEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    id v5 = [(HPSDevice *)self btsDevice];
    id v6 = [v5 classicDevice];
    char v7 = [v6 inEarDetectEnabled];

    dispatch_time_t v8 = [(HPSDevice *)self headphoneDevice];
    [v8 setInEarDetection:v3];

    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    [v9 updateFeatureValuesWithFeature:5];

    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    id v11 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__HPSDevice_setInEarDetectEnabled___block_invoke;
    v20[3] = &unk_1E6EA8F98;
    v20[4] = self;
    BOOL v21 = v3;
    char v22 = v7;
    dispatch_after(v10, v11, v20);

    LOBYTE(v12) = 1;
  }
  else
  {
    int v13 = [(HPSDevice *)self btsDevice];
    uint64_t v14 = [v13 classicDevice];
    int v12 = [v14 setInEarDetectEnabled:v3];

    __int16 v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(HPSDevice *)self btsDevice];
      int v17 = [v16 classicDevice];
      char v18 = [v17 address];
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v18;
      __int16 v25 = 1024;
      BOOL v26 = v3;
      __int16 v27 = 1024;
      int v28 = v12;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setInEarDetectEnabled:] [BTDevice-Only] btDevice: %@, inputEnabled:%i, returnValue:%i", buf, 0x18u);
    }
  }
  return v12;
}

void __35__HPSDevice_setInEarDetectEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  BOOL v3 = [v11 stringValue];
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  id v5 = [v4 stringValue];
  id v6 = NSNumber;
  char v7 = [*(id *)(a1 + 32) btsDevice];
  dispatch_time_t v8 = [v7 classicDevice];
  uint64_t v9 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v8, "inEarDetectEnabled"));
  dispatch_time_t v10 = [v9 stringValue];
  [v2 _logSetterExpectationFormatStringForUsecase:@"[setInEarDetectEnabled:]" inputValue:v3 existingValue:v5 readBackValue:v10];
}

- ($70344DAF05348A783186C1CF166707C1)getCallManagementConfig
{
  uint64_t v2 = self;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HPSDevice *)self btsDevice];
  id v4 = [v3 classicDevice];
  unint64_t v5 = [v4 getCallManagementConfig];

  uint64_t v6 = BYTE6(v5);
  char v7 = objc_msgSend(NSString, "stringWithFormat:", @"\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n", v5, BYTE2(v5), BYTE4(v5), BYTE6(v5));
  if (v2->_ffValue && v2->_headphoneDevice)
  {
    dispatch_time_t v8 = [(HPSDevice *)v2 headphoneDevice];
    id v11 = [v8 cbDevice];
    LODWORD(v5) = [v11 muteControlCapability];

    uint64_t v9 = [(HPSDevice *)v2 headphoneDevice];
    int v10 = [v9 endCallGesture];
    LODWORD(v11) = v10;
    if (v5)
    {
      int v12 = [(HPSDevice *)v2 headphoneDevice];
      uint64_t v6 = [v12 muteControlGesture];

      LODWORD(v12) = 0;
    }
    else
    {
      uint64_t v6 = 0;
      LODWORD(v12) = v10;
      LODWORD(v11) = 0;
    }

    int v17 = objc_msgSend(NSString, "stringWithFormat:", @"\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n", v5, v12, v11, v6);
    [(HPSDevice *)v2 _logExpectationFormatStringForUsecase:@"[getCallManagementConfig]" btsDeviceValue:v7 headphoneDeviceValue:v17];

    unsigned __int8 v18 = 0;
    LOBYTE(v17) = 0;
    LOBYTE(v2) = 0;
  }
  else
  {
    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(HPSDevice *)v2 btsDevice];
      __int16 v15 = [v14 classicDevice];
      int v16 = [v15 address];
      *(_DWORD *)buf = 138412546;
      BOOL v21 = v16;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getCallManagementConfig] [BTDevice-Only] btDevice: %@, returnValue:%@", buf, 0x16u);
    }
    uint64_t v2 = (HPSDevice *)(v5 >> 8);
    int v12 = (void *)(v5 >> 16);
    int v17 = (void *)(v5 >> 24);
    id v11 = (void *)(HIDWORD(v5) & 0xFFFFFF);
    unsigned __int8 v18 = BYTE5(v5);
  }

  return ($70344DAF05348A783186C1CF166707C1)(((unint64_t)v18 << 40) | (v6 << 48) | ((unint64_t)v11 << 32) | ((unint64_t)v17 << 24) | ((unint64_t)v12 << 16) | ((unint64_t)v2 << 8) | v5);
}

- (BOOL)setCallConfig:(id)a3
{
  uint64_t v3 = *(void *)&a3.var0;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    unint64_t v5 = [(HPSDevice *)self btsDevice];
    uint64_t v6 = [v5 classicDevice];
    uint64_t v7 = [v6 getCallManagementConfig];

    dispatch_time_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n", v7, BYTE2(v7), BYTE4(v7), BYTE6(v7));
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n", v3, BYTE2(v3), BYTE4(v3), BYTE6(v3));
    int v10 = [(HPSDevice *)self headphoneDevice];
    id v11 = v10;
    if ((_BYTE)v3)
    {
      [v10 setEndCallGesture:BYTE4(v3)];

      id v11 = [(HPSDevice *)self headphoneDevice];
      [v11 setMuteControlGesture:BYTE6(v3)];
    }
    else
    {
      [v10 setEndCallGesture:BYTE2(v3)];
    }

    int v19 = [(HPSDevice *)self headphoneDevice];
    [v19 updateFeatureValuesWithFeature:17];

    dispatch_time_t v20 = dispatch_time(0, 5000000000);
    BOOL v21 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__HPSDevice_setCallConfig___block_invoke;
    block[3] = &unk_1E6EA8998;
    block[4] = self;
    id v25 = v9;
    id v26 = v8;
    id v22 = v8;
    uint64_t v14 = v9;
    dispatch_after(v20, v21, block);

    LOBYTE(v9) = 1;
  }
  else
  {
    int v12 = [(HPSDevice *)self btsDevice];
    int v13 = [v12 classicDevice];
    LODWORD(v9) = [v13 setCallConfig:v3 & 0xFFFFFFFFFFFFFFLL];

    uint64_t v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [(HPSDevice *)self btsDevice];
      int v16 = [v15 classicDevice];
      int v17 = [v16 address];
      unsigned __int8 v18 = objc_msgSend(NSString, "stringWithFormat:", @"\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n", v3, BYTE2(v3), BYTE4(v3), (v3 & 0xFFFFFFFFFFFFFFuLL) >> 48);
      *(_DWORD *)buf = 138412802;
      int v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      __int16 v31 = 1024;
      int v32 = (int)v9;
      _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setCallConfig:] [BTDevice-Only] btDevice: %@, inputConfig:%@, returnValue:%i", buf, 0x1Cu);
    }
  }

  return (char)v9;
}

void __27__HPSDevice_setCallConfig___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v7 = [v1 btsDevice];
  id v4 = [v7 classicDevice];
  uint64_t v5 = [v4 getCallManagementConfig];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n", v5, BYTE2(v5), BYTE4(v5), BYTE6(v5));
  [v1 _logSetterExpectationFormatStringForUsecase:@"[setCallConfig:]" inputValue:v2 existingValue:v3 readBackValue:v6];
}

- (BOOL)isTemporaryPaired
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  id v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 isTemporaryPaired];

  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v6 = [(HPSDevice *)self headphoneDevice];
    id v7 = [v6 cbDevice];
    unint64_t v8 = [v7 deviceFlags];

    uint64_t v9 = (v8 >> 25) & 1;
    uint64_t v5 = [NSNumber numberWithBool:v5];
    int v10 = [v5 stringValue];
    id v11 = [NSNumber numberWithBool:v9];
    int v12 = [v11 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[isTemporaryPaired]" btsDeviceValue:v10 headphoneDeviceValue:v12];

    LOBYTE(v5) = v9;
  }
  else
  {
    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(HPSDevice *)self btsDevice];
      __int16 v15 = [v14 classicDevice];
      int v16 = [v15 address];
      int v18 = 138412546;
      int v19 = v16;
      __int16 v20 = 1024;
      int v21 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isTemporaryPaired] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)magicPaired
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  id v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 magicPaired];

  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v6 = [(HPSDevice *)self headphoneDevice];
    id v7 = [v6 cbDevice];
    unint64_t v8 = [v7 deviceFlags];

    uint64_t v9 = (v8 >> 1) & 1;
    uint64_t v5 = [NSNumber numberWithBool:v5];
    int v10 = [v5 stringValue];
    id v11 = [NSNumber numberWithBool:v9];
    int v12 = [v11 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[magicPaired]" btsDeviceValue:v10 headphoneDeviceValue:v12];

    LOBYTE(v5) = v9;
  }
  else
  {
    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(HPSDevice *)self btsDevice];
      __int16 v15 = [v14 classicDevice];
      int v16 = [v15 address];
      int v18 = 138412546;
      int v19 = v16;
      __int16 v20 = 1024;
      int v21 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [magicPaired] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)getDeviceSoundProfileAllowed
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  id v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 getDeviceSoundProfileAllowed];

  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v6 = [(HPSDevice *)self headphoneDevice];
    id v7 = [v6 cbDevice];
    unint64_t v8 = [v7 deviceFlags];

    uint64_t v9 = (v8 >> 28) & 1;
    uint64_t v5 = [NSNumber numberWithBool:v5];
    int v10 = [v5 stringValue];
    id v11 = [NSNumber numberWithBool:v9];
    int v12 = [v11 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getDeviceSoundProfileAllowed]" btsDeviceValue:v10 headphoneDeviceValue:v12];

    LOBYTE(v5) = v9;
  }
  else
  {
    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(HPSDevice *)self btsDevice];
      __int16 v15 = [v14 classicDevice];
      int v16 = [v15 address];
      int v18 = 138412546;
      int v19 = v16;
      __int16 v20 = 1024;
      int v21 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getDeviceSoundProfileAllowed] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)cloudPaired
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  id v4 = (void *)[v3 cloudPaired];

  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [(HPSDevice *)self headphoneDevice];
    uint64_t v6 = [v5 cbDevice];
    unint64_t v7 = [v6 deviceFlags];

    uint64_t v8 = (v7 >> 15) & 1;
    id v4 = [NSNumber numberWithBool:v4];
    uint64_t v9 = [v4 stringValue];
    int v10 = [NSNumber numberWithBool:v8];
    id v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[cloudPaired]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LOBYTE(v4) = v8;
  }
  else
  {
    int v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(HPSDevice *)self btsDevice];
      uint64_t v14 = [v13 classicDevice];
      __int16 v15 = [v14 address];
      int v17 = 138412546;
      int v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v4;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [cloudPaired] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return (char)v4;
}

- (int)autoAnswerMode
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  id v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 autoAnswerMode];

  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v6 = [(HPSDevice *)self headphoneDevice];
    unint64_t v7 = [v6 cbDevice];
    int v8 = [v7 deviceFlags];

    if (v8 < 0) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    uint64_t v5 = [NSNumber numberWithUnsignedInt:v5];
    int v10 = [v5 stringValue];
    id v11 = [NSNumber numberWithUnsignedInt:v9];
    int v12 = [v11 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[autoAnswerMode]" btsDeviceValue:v10 headphoneDeviceValue:v12];

    LODWORD(v5) = v9;
  }
  else
  {
    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(HPSDevice *)self btsDevice];
      __int16 v15 = [v14 classicDevice];
      int v16 = [v15 address];
      int v18 = 138412546;
      __int16 v19 = v16;
      __int16 v20 = 1024;
      int v21 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [autoAnswerMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
  }
  return (int)v5;
}

- (BOOL)setAutoAnswerMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v5 = [(HPSDevice *)self btsDevice];
    uint64_t v6 = [v5 classicDevice];
    BOOL v7 = [v6 autoAnswerMode] != 0;

    int v8 = objc_opt_new();
    [v8 setDeviceFlagsMask:0x80000000];
    [v8 setDeviceFlagsValue:(unint64_t)(v3 == 1) << 31];
    id v11 = objc_opt_new();
    uint64_t v9 = [(HPSDevice *)self headphoneDevice];
    int v10 = [v9 cbDevice];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __31__HPSDevice_setAutoAnswerMode___block_invoke;
    v18[3] = &unk_1E6EA8FC0;
    void v18[4] = self;
    int v19 = v3;
    BOOL v20 = v7;
    [v11 modifyDevice:v10 settings:v8 completion:v18];

    LOBYTE(v11) = 1;
  }
  else
  {
    int v12 = [(HPSDevice *)self btsDevice];
    int v13 = [v12 classicDevice];
    LODWORD(v11) = [v13 setAutoAnswerMode:v3];

    int v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(HPSDevice *)self btsDevice];
      __int16 v15 = [v14 classicDevice];
      int v16 = [v15 address];
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v16;
      __int16 v23 = 1024;
      int v24 = v3;
      __int16 v25 = 1024;
      int v26 = (int)v11;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setAutoAnswerMode:] [BTDevice-Only] btDevice: %@, inputMode:%i didSet:%i", buf, 0x18u);
    }
  }

  return (char)v11;
}

void __31__HPSDevice_setAutoAnswerMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    uint64_t v5 = [v4 stringValue];
    BOOL v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
    int v8 = [v7 stringValue];
    uint64_t v9 = NSNumber;
    int v10 = [*(id *)(a1 + 32) btsDevice];
    id v11 = [v10 classicDevice];
    int v12 = objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v11, "autoAnswerMode"));
    int v13 = [v12 stringValue];
    [v6 _logSetterExpectationFormatStringForUsecase:@"setAutoAnswerMode:" inputValue:v5 existingValue:v8 readBackValue:v13];

    goto LABEL_5;
  }
  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 localizedDescription];
    int v14 = 138412290;
    __int16 v15 = v5;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setListeningModeConfigs]: unable to modify modeCofig %@", (uint8_t *)&v14, 0xCu);
LABEL_5:
  }
}

- (unsigned)getSpatialAudioPlatformSupport
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(HPSDevice *)self btsDevice];
  id v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 getSpatialAudioPlatformSupport];

  if (self->_ffValue && self->_headphoneDevice)
  {
    uint64_t v6 = [(HPSDevice *)self headphoneDevice];
    BOOL v7 = [v6 cbDevice];
    int v8 = [v7 deviceFlags];

    if ((v8 & 0x10000000) != 0) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    uint64_t v5 = [NSNumber numberWithUnsignedChar:v5];
    int v10 = [v5 stringValue];
    id v11 = [NSNumber numberWithUnsignedChar:v9];
    int v12 = [v11 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[getSpatialAudioPlatformSupport]" btsDeviceValue:v10 headphoneDeviceValue:v12];

    LOBYTE(v5) = v9;
  }
  else
  {
    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [(HPSDevice *)self btsDevice];
      __int16 v15 = [v14 classicDevice];
      uint64_t v16 = [v15 address];
      int v18 = 138412546;
      int v19 = v16;
      __int16 v20 = 1024;
      int v21 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getSpatialAudioPlatformSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);
    }
  }
  return v5;
}

- (int)accessorySettingFeatureBitMask
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = +[HPSHeadphoneManager sharedInstance];
  if ([v3 allowReplayAccessory])
  {
    id v4 = [(HPSDevice *)self btsDevice];

    if (!v4)
    {
      uint64_t v5 = [(HPSDevice *)self headphoneDevice];
      int v6 = [v5 accessorySettingFeatureBitMask];

      return v6;
    }
  }
  else
  {
  }
  BOOL v7 = [(HPSDevice *)self btsDevice];
  int v8 = [v7 classicDevice];
  int v6 = [v8 accessorySettingFeatureBitMask];

  uint64_t v9 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(HPSDevice *)self btsDevice];
    id v11 = [v10 classicDevice];
    int v12 = [v11 address];
    int v14 = 138412546;
    __int16 v15 = v12;
    __int16 v16 = 1024;
    int v17 = v6;
    _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [accessorySettingFeatureBitMask] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v14, 0x12u);
  }
  return v6;
}

- (BOOL)setClickHoldModes:(id)a3
{
  unint64_t v3 = *(void *)&a3.var2;
  unint64_t v4 = *(void *)&a3.var0;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = [(HPSDevice *)self btsDevice];
  BOOL v7 = [v6 classicDevice];
  int v8 = objc_msgSend(v7, "setClickHoldModes:", v4, v3);

  uint64_t v9 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(HPSDevice *)self btsDevice];
    id v11 = [v10 classicDevice];
    int v12 = [v11 address];
    int v13 = objc_msgSend(NSString, "stringWithFormat:", @"\n rightMode: %i \nleftMode: %i \nprevRightMode: %i \nprevLeftMode: %i \n", v4, HIDWORD(v4), v3, HIDWORD(v3));
    *(_DWORD *)buf = 138412802;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 1024;
    int v20 = v8;
    _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setClickHoldModes:] [BTDevice-Only] btDevice: %@, clockHoldModes:%@, result:%i", buf, 0x1Cu);
  }
  return v8;
}

- (unsigned)clickHoldModes:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HPSDevice *)self btsDevice];
  int v6 = [v5 classicDevice];
  unsigned int v7 = [v6 clickHoldModes:a3];

  int v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(HPSDevice *)self btsDevice];
    int v10 = [v9 classicDevice];
    id v11 = [v10 address];
    int v12 = objc_msgSend(NSString, "stringWithFormat:", @"\n rightMode: %i \nleftMode: %i \nprevRightMode: %i \nprevLeftMode: %i \n", *(void *)&a3->var0, HIDWORD(*(void *)&a3->var0), *(void *)&a3->var2, HIDWORD(*(void *)&a3->var2));
    *(_DWORD *)buf = 138412802;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    __int16 v17 = v12;
    __int16 v18 = 1024;
    unsigned int v19 = v7;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [clickHoldModes:] [BTDevice-Only] btDevice: %@, inputModes:%@ returnValue:%i", buf, 0x1Cu);
  }
  return v7;
}

- (int)getDeviceColor:(unsigned int *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[HPSHeadphoneManager sharedInstance];
  if ([v5 allowReplayAccessory])
  {
    int v6 = [(HPSDevice *)self btsDevice];

    if (v6) {
      goto LABEL_5;
    }
    uint64_t v5 = [(HPSDevice *)self headphoneDevice];
    *a3 = [v5 deviceColor];
  }

LABEL_5:
  unsigned int v7 = [(HPSDevice *)self btsDevice];
  int v8 = [v7 classicDevice];
  int v9 = [v8 getDeviceColor:a3];

  int v10 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(HPSDevice *)self btsDevice];
    int v12 = [v11 classicDevice];
    int v13 = [v12 address];
    unsigned int v14 = *a3;
    int v16 = 138412802;
    __int16 v17 = v13;
    __int16 v18 = 1024;
    unsigned int v19 = v14;
    __int16 v20 = 1024;
    int v21 = v9;
    _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getDeviceColor:] [BTDevice-Only] btDevice: %@, inColor:%i, returnValue:%i", (uint8_t *)&v16, 0x18u);
  }
  return v9;
}

- (BOOL)getAACPCapabilityBit:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HPSDevice *)self btsDevice];
  int v6 = [v5 classicDevice];
  int v7 = [v6 getAACPCapabilityBit:v3];

  int v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(HPSDevice *)self btsDevice];
    int v10 = [v9 classicDevice];
    id v11 = [v10 address];
    int v13 = 138412802;
    unsigned int v14 = v11;
    __int16 v15 = 1024;
    int v16 = v3;
    __int16 v17 = 1024;
    int v18 = v7;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getAACPCapabilityBit:] [BTDevice-Only] btDevice: %@, inputBit:%i, returnValue:%i", (uint8_t *)&v13, 0x18u);
  }
  return v7;
}

- (BOOL)hearingAidSupport
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  unint64_t v4 = [v3 classicDevice];
  uint64_t v5 = (void *)[v4 hearingAidSupport];

  if (self->_ffValue && self->_headphoneDevice)
  {
    int v6 = [(HPSDevice *)self headphoneDevice];
    int v7 = [v6 cbDevice];
    BOOL v8 = [v7 hearingAidSupport] == 1;

    uint64_t v5 = [NSNumber numberWithBool:v5];
    int v9 = [v5 stringValue];
    int v10 = [NSNumber numberWithBool:v8];
    id v11 = [v10 stringValue];
    [(HPSDevice *)self _logExpectationFormatStringForUsecase:@"[hearingAidSupport]" btsDeviceValue:v9 headphoneDeviceValue:v11];

    LOBYTE(v5) = v8;
  }
  else
  {
    int v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(HPSDevice *)self btsDevice];
      unsigned int v14 = [v13 classicDevice];
      __int16 v15 = [v14 address];
      int v17 = 138412546;
      int v18 = v15;
      __int16 v19 = 1024;
      int v20 = (int)v5;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [hearingAidSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);
    }
  }
  return (char)v5;
}

- (BOOL)hearingAidEnrolled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  unint64_t v4 = [v3 classicDevice];
  int v5 = [v4 hearingAidEnrolled];

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    BOOL v8 = [v7 classicDevice];
    int v9 = [v8 address];
    int v11 = 138412546;
    int v12 = v9;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [hearingAidEnrolled] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);
  }
  return v5;
}

- (void)setHearingAidEnrolled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = [(HPSDevice *)self btsDevice];
  int v6 = [v5 classicDevice];
  [v6 setHearingAidEnrolled:v3];

  int v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(HPSDevice *)self btsDevice];
    int v9 = [v8 classicDevice];
    int v10 = [v9 address];
    int v11 = 138412546;
    int v12 = v10;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setHearingAidEnrolled:] [BTDevice-Only] btDevice: %@, inputEnrolled:%i", (uint8_t *)&v11, 0x12u);
  }
}

- (BOOL)hearingAidEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HPSDevice *)self btsDevice];
  unint64_t v4 = [v3 classicDevice];
  int v5 = [v4 hearingAidEnabled];

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    BOOL v8 = [v7 classicDevice];
    int v9 = [v8 address];
    int v11 = 138412546;
    int v12 = v9;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [hearingAidEnabled] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);
  }
  return v5;
}

- (void)setHearingAidEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = [(HPSDevice *)self btsDevice];
  int v6 = [v5 classicDevice];
  [v6 setHearingAidEnabled:v3];

  int v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(HPSDevice *)self btsDevice];
    int v9 = [v8 classicDevice];
    int v10 = [v9 address];
    int v11 = 138412546;
    int v12 = v10;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setHearingAidEnabled:] [BTDevice-Only] btDevice: %@, inputEnrolled:%i", (uint8_t *)&v11, 0x12u);
  }
}

- (BOOL)hearingTestSupport
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HPSDevice *)self btsDevice];
  unint64_t v4 = [v3 classicDevice];
  int v5 = [v4 hearingTestSupport];

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    BOOL v8 = [v7 classicDevice];
    int v9 = [v8 address];
    int v11 = 138412546;
    int v12 = v9;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [hearingTestSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);
  }
  return v5;
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v5 = +[HPSHeadphoneManager sharedInstance];
  if ([v5 allowReplayAccessory])
  {
    int v6 = [(HPSDevice *)self btsDevice];

    if (!v6)
    {
      int v7 = [(HPSDevice *)self headphoneDevice];
      char v8 = [v7 isServiceSupported:v3];

      return v8;
    }
  }
  else
  {
  }
  int v10 = [(HPSDevice *)self btsDevice];
  int v11 = [v10 classicDevice];
  int v12 = [v11 isServiceSupported:v3];

  __int16 v13 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [(HPSDevice *)self btsDevice];
    uint64_t v15 = [v14 classicDevice];
    int v16 = [v15 address];
    int v17 = 138412802;
    int v18 = v16;
    __int16 v19 = 1024;
    int v20 = v3;
    __int16 v21 = 1024;
    int v22 = v12;
    _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isServiceSupported:] ff == off btDevice: %@, inputService:%i didSet:%i", (uint8_t *)&v17, 0x18u);
  }
  return v12;
}

- (id)healthDeviceType
{
  uint64_t v2 = [(HPSDevice *)self btsDevice];
  uint64_t v3 = [v2 healthDeviceType];

  return v3;
}

- (unsigned)userSelectedHealthDataSyncConfig
{
  uint64_t v2 = [(HPSDevice *)self btsDevice];
  unsigned __int8 v3 = [v2 userSelectedHealthDataSyncConfig];

  return v3;
}

- (void)setUserSelectedHealthDataSyncConfig:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(HPSDevice *)self btsDevice];
  [v4 setUserSelectedHealthDataSyncConfig:v3];
}

- (unsigned)SendSetupCommand:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = [(HPSDevice *)self btsDevice];
  int v6 = [v5 classicDevice];
  int v7 = [v6 SendSetupCommand:v3];

  char v8 = sharedBluetoothSettingsLogComponent();
  unsigned int v9 = v7 != 0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(HPSDevice *)self btsDevice];
    int v11 = [v10 classicDevice];
    int v12 = [v11 address];
    int v14 = 138412546;
    uint64_t v15 = v12;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [SendSetupCommand:] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v14, 0x12u);
  }
  return v9;
}

- (int)getUserSelectedDeviceType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  id v4 = [v3 classicDevice];
  int v5 = [v4 getUserSelectedDeviceType];

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    char v8 = [v7 classicDevice];
    unsigned int v9 = [v8 address];
    int v11 = 138412546;
    int v12 = v9;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getUserSelectedDeviceType] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);
  }
  return v5;
}

- (id)accessoryInfo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  id v4 = [v3 classicDevice];
  int v5 = [v4 accessoryInfo];

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    char v8 = [v7 classicDevice];
    unsigned int v9 = [v8 address];
    int v11 = 138412546;
    int v12 = v9;
    __int16 v13 = 2112;
    int v14 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [accessoryInfo] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

- (id)getServiceSetting:(unsigned int)a3 key:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(HPSDevice *)self btsDevice];
  char v8 = [v7 classicDevice];
  unsigned int v9 = [v8 getServiceSetting:v4 key:v6];

  int v10 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [(HPSDevice *)self btsDevice];
    int v12 = [v11 classicDevice];
    __int16 v13 = [v12 address];
    int v15 = 138413058;
    __int16 v16 = v13;
    __int16 v17 = 1024;
    int v18 = v4;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    int v22 = v9;
    _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getServiceSetting:key:] [BTDevice-Only] btDevice: %@, serviceID:%i, key:%@, returnVal:%@", (uint8_t *)&v15, 0x26u);
  }

  return v9;
}

- (int)getLowSecurityStatus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  uint64_t v4 = [v3 classicDevice];
  int v5 = [v4 getLowSecurityStatus];

  id v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    char v8 = [v7 classicDevice];
    unsigned int v9 = [v8 address];
    int v11 = 138412546;
    int v12 = v9;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getLowSecurityStatus] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);
  }
  return v5;
}

- (BOOL)ancsAuthorized
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  int v4 = [v3 ancsAuthorized];

  int v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HPSDevice *)self btsDevice];
    int v7 = [v6 classicDevice];
    char v8 = [v7 address];
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [ancsAuthorized] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v10, 0x12u);
  }
  return v4;
}

- (BOOL)isFirmwareUpdateRequiredDevice
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  int v4 = [v3 isFirmwareUpdateRequiredDevice];

  int v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HPSDevice *)self btsDevice];
    int v7 = [v6 classicDevice];
    char v8 = [v7 address];
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isFirmwareUpdateRequiredDevice] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v10, 0x12u);
  }
  return v4;
}

- (BOOL)isLimitedConnectivityDevice
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  int v4 = [v3 isLimitedConnectivityDevice];

  int v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HPSDevice *)self btsDevice];
    int v7 = [v6 classicDevice];
    char v8 = [v7 address];
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isLimitedConnectivityDevice] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v10, 0x12u);
  }
  return v4;
}

- (void)setANCSAuthorization:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [(HPSDevice *)self btsDevice];
  [v5 setANCSAuthorization:v3];

  id v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    int v8 = 138412290;
    unsigned int v9 = v7;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setANCSAuthorization:] [BTDevice-Only] btDevice: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)supportsANCS
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HPSDevice *)self btsDevice];
  int v4 = [v3 supportsANCS];

  int v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HPSDevice *)self btsDevice];
    int v7 = [v6 classicDevice];
    int v8 = [v7 address];
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [supportsANCS] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v10, 0x12u);
  }
  return v4;
}

- (BOOL)isGuestPairingMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HPSDevice *)self btsDevice];
  int v4 = [v3 classicDevice];
  int v5 = [v4 isGuestPairingMode];

  id v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    int v8 = [v7 classicDevice];
    unsigned int v9 = [v8 address];
    int v11 = 138412546;
    __int16 v12 = v9;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isGuestPairingMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);
  }
  return v5;
}

- (void)setGuestPairingMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = [(HPSDevice *)self btsDevice];
  id v6 = [v5 classicDevice];
  [v6 setGuestPairingMode:v3];

  int v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(HPSDevice *)self btsDevice];
    unsigned int v9 = [v8 classicDevice];
    int v10 = [v9 address];
    int v11 = 138412546;
    __int16 v12 = v10;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setGuestPairingMode:] [BTDevice-Only] btDevice: %@, mode:%i", (uint8_t *)&v11, 0x12u);
  }
}

- (void)setServiceSetting:(unsigned int)a3 key:(id)a4 value:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = [(HPSDevice *)self btsDevice];
  int v11 = [v10 classicDevice];
  [v11 setServiceSetting:v6 key:v8 value:v9];

  __int16 v12 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = [(HPSDevice *)self btsDevice];
    BOOL v14 = [v13 classicDevice];
    uint64_t v15 = [v14 address];
    int v16 = 138413058;
    __int16 v17 = v15;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setServiceSetting:key:value:] [BTDevice-Only] btDevice: %@, serviceID:%i, key:%@, value:%@", (uint8_t *)&v16, 0x26u);
  }
}

- (void)setSyncGroup:(int)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v7 = [(HPSDevice *)self btsDevice];
  id v8 = [v7 classicDevice];
  [v8 setSyncGroup:v5 enabled:v4];

  id v9 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(HPSDevice *)self btsDevice];
    int v11 = [v10 classicDevice];
    __int16 v12 = [v11 address];
    int v13 = 138412802;
    BOOL v14 = v12;
    __int16 v15 = 1024;
    int v16 = v5;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setSyncGroup:enabled:] [BTDevice-Only] btDevice: %@, inputSyncGroup:%i, inputEnabled:%i", (uint8_t *)&v13, 0x18u);
  }
}

- (void)setSyncSettings:(id)a3
{
  unint64_t v3 = *(void *)&a3.var0;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HPSDevice *)self btsDevice];
  uint64_t v6 = [v5 classicDevice];
  [v6 setSyncSettings:v3 & 0xFFFFFFFFFFLL];

  int v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(HPSDevice *)self btsDevice];
    id v9 = [v8 classicDevice];
    int v10 = [v9 address];
    int v11 = objc_msgSend(NSString, "stringWithFormat:", @"\n supported: %i \nenabled: %i \nfavorites: %i \nrecents: %i \nuserPermissionGranted: %i \n", v3 & 1, (v3 >> 8) & 1, WORD1(v3) & 1, BYTE3(v3) & 1, HIDWORD(v3) & 1);
    *(_DWORD *)buf = 138412546;
    int v13 = v10;
    __int16 v14 = 2112;
    __int16 v15 = v11;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setSyncSettings:] [BTDevice-Only] btDevice: %@, inputSettings:%@", buf, 0x16u);
  }
}

- (BOOL)setUserSelectedDeviceType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HPSDevice *)self btsDevice];
  uint64_t v6 = [v5 classicDevice];
  int v7 = [v6 setUserSelectedDeviceType:v3];

  id v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(HPSDevice *)self btsDevice];
    int v10 = [v9 classicDevice];
    int v11 = [v10 address];
    int v13 = 138412802;
    __int16 v14 = v11;
    __int16 v15 = 1024;
    int v16 = v3;
    __int16 v17 = 1024;
    int v18 = v7;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setUserSelectedDeviceType:] [BTDevice-Only] btDevice: %@, inputType:%i didSet:%i", (uint8_t *)&v13, 0x18u);
  }
  return v7;
}

- (id)syncGroups
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  BOOL v4 = [v3 classicDevice];
  uint64_t v5 = [v4 syncGroups];

  uint64_t v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    id v8 = [v7 classicDevice];
    id v9 = [v8 address];
    int v11 = 138412546;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    __int16 v14 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [syncGroups] [BTDevice-Only] btDevice: %@, value:%@", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)syncSettings
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSDevice *)self btsDevice];
  BOOL v4 = [v3 classicDevice];
  unint64_t v5 = [v4 syncSettings];

  uint64_t v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HPSDevice *)self btsDevice];
    id v8 = [v7 classicDevice];
    id v9 = [v8 address];
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"\n supported: %i \nenabled: %i \nfavorites: %i \nrecents: %i \nuserPermissionGranted: %i \n", v5 & 1, (v5 >> 8) & 1, WORD1(v5) & 1, BYTE3(v5) & 1, HIDWORD(v5) & 1);
    *(_DWORD *)buf = 138412546;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [syncSettings] [BTDevice-Only] btDevice: %@, value:%@", buf, 0x16u);
  }
  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)v5;
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(HPSDevice *)self btsDevice];
  uint64_t v6 = [v5 classicDevice];
  int v7 = [v6 address];
  id v8 = [(HPSDevice *)self headphoneDevice];
  id v9 = [(HPSDevice *)self address];
  int v10 = [(HPSDevice *)self name];
  int v11 = [v3 stringWithFormat:@"<%@: %p> btsDevice:%@ headphoneDevice:%@  address:%@  name:%@", v4, self, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BTSDevice)btsDevice
{
  if (!self->_ffValue)
  {
    if (self->_headphoneDevice)
    {
      btsDevice = self->_btsDevice;
      if (!btsDevice
        || ([(BTSDevice *)btsDevice classicDevice],
            uint64_t v6 = objc_claimAutoreleasedReturnValue(),
            v6,
            !v6))
      {
        int v7 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[HPSDevice btsDevice](v7);
        }
      }
    }
  }
  uint64_t v3 = self->_btsDevice;

  return v3;
}

- (HPMHeadphoneDevice)headphoneDevice
{
  return self->_headphoneDevice;
}

- (void)_logExpectationFormatStringForUsecase:(id)a3 btsDeviceValue:(id)a4 headphoneDeviceValue:(id)a5
{
}

- (void)_logExpectationFormatStringForUsecase:(id)a3 queryValue:(id)a4 btsDeviceValue:(id)a5 headphoneDeviceValue:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_ffValue || !self->_headphoneDevice)
  {
    __int16 v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[HPSDevice _logExpectationFormatStringForUsecase:queryValue:btsDeviceValue:headphoneDeviceValue:](self, v14);
    }

    if (([v12 isEqualToString:v13] & 1) == 0)
    {
      uint64_t v15 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [(HPSDevice *)self btsDevice];
        __int16 v17 = [v16 classicDevice];
        int v18 = [v17 address];
        uint64_t v19 = [(HPSDevice *)self headphoneDevice];
        int v20 = 138413570;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v11;
        __int16 v24 = 2112;
        id v25 = v12;
        __int16 v26 = 2112;
        id v27 = v13;
        __int16 v28 = 2112;
        __int16 v29 = v18;
        __int16 v30 = 2112;
        __int16 v31 = v19;
        _os_log_error_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_ERROR, "HeadphoneInfrastructureReDesign: %@, [Query]=%@, btsDevice.value: %@, headphoneDevice.value:%@, btsDevice:%@, headphoneDevice:%@", (uint8_t *)&v20, 0x3Eu);
      }
    }
  }
}

- (void)_logSetterExpectationFormatStringForUsecase:(id)a3 inputValue:(id)a4 existingValue:(id)a5 readBackValue:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_ffValue || !self->_headphoneDevice)
  {
    __int16 v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [MEMORY[0x1E4F65650] shared];
      [v15 connectedHeadphones];
      id v25 = v12;
      v17 = id v16 = v10;
      int v18 = [(HPSDevice *)self headphoneDevice];
      uint64_t v19 = [(HPSDevice *)self headphoneDevice];
      int v20 = [v19 cbDevice];
      *(_DWORD *)buf = 138412802;
      id v27 = v17;
      __int16 v28 = 2048;
      id v29 = v18;
      __int16 v30 = 2048;
      id v31 = v20;
      _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: State log connected: %@ , headphoneDevice: %p, cbDevice: %p", buf, 0x20u);

      id v10 = v16;
      id v12 = v25;
    }
    if (([v11 isEqualToString:v13] & 1) == 0)
    {
      id v21 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = [(HPSDevice *)self btsDevice];
        id v23 = [v22 debugDescription];
        __int16 v24 = [(HPSDevice *)self headphoneDevice];
        *(_DWORD *)buf = 138413570;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v11;
        __int16 v30 = 2112;
        id v31 = v12;
        __int16 v32 = 2112;
        id v33 = v13;
        __int16 v34 = 2112;
        char v35 = v23;
        __int16 v36 = 2112;
        char v37 = v24;
        _os_log_error_impl(&dword_1E4BFE000, v21, OS_LOG_TYPE_ERROR, "HeadphoneInfrastructureReDesign: %@, input.value: %@, existing.value: %@, readback.value: %@, btsDevice:%@, headphoneDevice:%@", buf, 0x3Eu);
      }
    }
  }
}

+ (id)deviceKey
{
  return @"hps-device-key";
}

- (BOOL)isManagedByWallet
{
  return self->managedByWallet;
}

- (void)setManagedByWallet:(BOOL)a3
{
  self->managedByWallet = a3;
}

- (BOOL)isManagedByAliroWallet
{
  return self->managedByAliroWallet;
}

- (void)setManagedByAliroWallet:(BOOL)a3
{
  self->managedByAliroWallet = a3;
}

- (BOOL)doesSupportBackgroundNI
{
  return self->supportsBackgroundNI;
}

- (void)setSupportsBackgroundNI:(BOOL)a3
{
  self->supportsBackgroundNI = a3;
}

- (BOOL)isCTKDDevice
{
  return self->ctkdDevice;
}

- (void)setCtkdDevice:(BOOL)a3
{
  self->ctkdDevice = a3;
}

- (void)setHeadphoneDevice:(id)a3
{
}

- (void)setBtsDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btsDevice, 0);

  objc_storeStrong((id *)&self->_headphoneDevice, 0);
}

- (void)initWithHeadphoneDevice:btsDevice:.cold.1()
{
  v0 = [MEMORY[0x1E4F65650] shared];
  v1 = [v0 connectedHeadphones];
  OUTLINED_FUNCTION_0_1(&dword_1E4BFE000, v2, v3, "HeadphoneInfrastructureReDesign: unable to get headphoneDevice falling back to [BTDevice-Only]! %@", v4, v5, v6, v7, 2u);
}

- (void)featureCapability:.cold.1()
{
}

- (void)setListeningMode:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4BFE000, log, OS_LOG_TYPE_ERROR, "HeadphoneInfrastructureReDesign: [setListeningMode:] timed out!", v1, 2u);
}

void __23__HPSDevice_disconnect__block_invoke_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_1(&dword_1E4BFE000, v2, v3, "HeadphoneInfrastructureReDesign: [disconnect] Failed! %@", v4, v5, v6, v7, 2u);
}

void __19__HPSDevice_unpair__block_invoke_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_1(&dword_1E4BFE000, v2, v3, "HeadphoneInfrastructureReDesign: [unpair] Failed! %@", v4, v5, v6, v7, 2u);
}

- (void)btsDevice
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4BFE000, log, OS_LOG_TYPE_ERROR, "HeadphoneInfrastructureReDesign: btsDevice not found for ff off case!", v1, 2u);
}

- (void)_logExpectationFormatStringForUsecase:(void *)a1 queryValue:(NSObject *)a2 btsDeviceValue:headphoneDeviceValue:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F65650] shared];
  uint64_t v5 = [v4 connectedHeadphones];
  uint64_t v6 = [a1 headphoneDevice];
  uint64_t v7 = [a1 headphoneDevice];
  id v8 = [v7 cbDevice];
  int v9 = 138412802;
  id v10 = v5;
  __int16 v11 = 2048;
  id v12 = v6;
  __int16 v13 = 2048;
  __int16 v14 = v8;
  _os_log_debug_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_DEBUG, "HeadphoneInfrastructureReDesign: State log connected: %@ , headphoneDevice: %p, cbDevice: %p", (uint8_t *)&v9, 0x20u);
}

@end
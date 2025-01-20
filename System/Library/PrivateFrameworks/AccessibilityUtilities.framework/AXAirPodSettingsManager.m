@interface AXAirPodSettingsManager
+ (id)sharedInstance;
- (BOOL)caseTonesEnabledForDeviceAddress:(id)a3;
- (BOOL)ignoreSettingNotifications;
- (BOOL)isAirPodProduct:(id)a3;
- (BOOL)isBeatsProduct:(id)a3;
- (BOOL)isConnectedToBluetoothSystem;
- (BOOL)noiseCancellationEnabledWithOneUnitForDeviceAddress:(id)a3;
- (BOOL)nps_noiseCancellationEnabledWithOneUnitForDeviceAddress:(id)a3;
- (BOOL)nps_volumeSwipeEnabledForDeviceAddress:(id)a3;
- (BOOL)pairedAirPodsSupportSpatialAudio;
- (BOOL)supportsCaseTonesForDeviceAddress:(id)a3;
- (BOOL)supportsHoldDurationForDeviceAddress:(id)a3;
- (BOOL)supportsNoiseCancellationEnabledForDeviceAddress:(id)a3;
- (BOOL)supportsSpatialAudio;
- (BOOL)supportsSpatialAudioForDeviceAddress:(id)a3;
- (BOOL)supportsTapSpeedForDeviceAddress:(id)a3;
- (BOOL)supportsToneVolumeForDeviceAddress:(id)a3;
- (BOOL)supportsVolumeSwipeForDeviceAddress:(id)a3;
- (BOOL)volumeSwipeEnabledForDeviceAddress:(id)a3;
- (NSArray)pairedAirPods;
- (float)holdDurationForDeviceAddress:(id)a3;
- (float)nps_holdDurationForDeviceAddress:(id)a3;
- (float)nps_tapSpeedForDeviceAddress:(id)a3;
- (float)nps_toneVolumeForDeviceAddress:(id)a3;
- (float)nps_volumeSwipeDurationForDeviceAddress:(id)a3;
- (float)tapSpeedForDeviceAddress:(id)a3;
- (float)volumeSwipeDurationForDeviceAddress:(id)a3;
- (id)_deviceWithDeviceAddress:(id)a3;
- (id)_nps_airPodsDictionaryForPreference:(id)a3;
- (id)_productIdentifierForBTDevice:(id)a3;
- (id)accessibilityDomainAccessor;
- (id)disambiguationString;
- (id)initSharedInstance;
- (id)readyBlock;
- (id)titleForSettings;
- (unsigned)defaultToneVolumeForDeviceAddress:(id)a3;
- (unsigned)nps_defaultToneVolumeForDeviceAddress:(id)a3;
- (unsigned)toneVolumeForDeviceAddress:(id)a3;
- (void)_accessoryEventForManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6;
- (void)_applySettings;
- (void)_applySettingsForAddress:(id)a3;
- (void)_didConnectWithSession:(BTSessionImpl *)a3;
- (void)_didDisconnect;
- (void)_nps_updateAirPodsDictionaryForPreference:(id)a3 deviceAddress:(id)a4 value:(id)a5;
- (void)_probeAccessories;
- (void)_retrieveSettingsForAddress:(id)a3;
- (void)_retrieveSettingsFromDevices:(id)a3;
- (void)_serviceEventForDevice:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 eventType:(int)a5 specificEvent:(unsigned int)a6 result:(int)a7;
- (void)_sessionEventForSession:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)dealloc;
- (void)nps_setHoldDuration:(float)a3 forDeviceAddress:(id)a4;
- (void)nps_setNoiseCancellationEnabledWithOneUnit:(BOOL)a3 forDeviceAddress:(id)a4;
- (void)nps_setTapSpeed:(float)a3 forDeviceAddress:(id)a4;
- (void)nps_setToneVolume:(float)a3 forDeviceAddress:(id)a4;
- (void)nps_setVolumeSwipeDuration:(float)a3 forDeviceAddress:(id)a4;
- (void)nps_setVolumeSwipeEnabled:(BOOL)a3 forDeviceAddress:(id)a4;
- (void)setCaseTonesEnabled:(BOOL)a3 forDeviceAddress:(id)a4;
- (void)setHoldDuration:(float)a3 forDeviceAddress:(id)a4;
- (void)setIgnoreSettingNotifications:(BOOL)a3;
- (void)setNoiseCancellationEnabledWithOneUnit:(BOOL)a3 forDeviceAddress:(id)a4;
- (void)setReadyBlock:(id)a3;
- (void)setTapSpeed:(float)a3 forDeviceAddress:(id)a4;
- (void)setToneVolume:(unsigned int)a3 forDeviceAddress:(id)a4;
- (void)setVolumeSwipeDuration:(float)a3 forDeviceAddress:(id)a4;
- (void)setVolumeSwipeEnabled:(BOOL)a3 forDeviceAddress:(id)a4;
- (void)start;
- (void)startWithCallback:(id)a3;
@end

@implementation AXAirPodSettingsManager

- (id)_productIdentifierForBTDevice:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 vendorId];
  uint64_t v6 = [v4 productId];

  return (id)objc_msgSend(v3, "stringWithFormat:", @"%d,%d", v5, v6);
}

- (NSArray)pairedAirPods
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = AXLogAirPodSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = NSNumber;
    id v4 = [MEMORY[0x1E4F50B70] sharedInstance];
    uint64_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "enabled"));
    uint64_t v6 = NSNumber;
    v7 = [MEMORY[0x1E4F50B70] sharedInstance];
    v8 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "bluetoothState"));
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_18D308000, v2, OS_LOG_TYPE_DEFAULT, "state: %@ %@", buf, 0x16u);
  }
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [MEMORY[0x1E4F50B70] sharedInstance];
  v11 = [v10 pairedDevices];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__AXAirPodSettingsManager_pairedAirPods__block_invoke;
  v15[3] = &unk_1E5586970;
  id v12 = v9;
  id v16 = v12;
  [v11 enumerateObjectsUsingBlock:v15];

  v13 = AXLogAirPodSettings();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v12;
    _os_log_impl(&dword_18D308000, v13, OS_LOG_TYPE_INFO, "Air!: %@", buf, 0xCu);
  }

  return (NSArray *)v12;
}

void __40__AXAirPodSettingsManager_pairedAirPods__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AXLogAirPodSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "vendorId"));
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "productId"));
    int v8 = 138412802;
    id v9 = v3;
    __int16 v10 = 2112;
    v11 = v5;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_INFO, "BT device: %@ %@ %@", (uint8_t *)&v8, 0x20u);
  }
  if ([v3 vendorId] == 76
    && ([v3 productId] == 8206
     || [v3 productId] == 8202
     || [v3 productId] == 8211
     || [v3 productId] == 8212
     || [v3 productId] == 8228
     || [v3 productId] == 8217
     || [v3 productId] == 8219
     || [v3 productId] == 8222
     || [v3 productId] == 8223
     || AXIsBeatsProductId(v3)))
  {
    v7 = AXLogAirPodSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_INFO, "Air!: %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)supportsSpatialAudio
{
  if (supportsSpatialAudio_onceToken != -1) {
    dispatch_once(&supportsSpatialAudio_onceToken, &__block_literal_global_7);
  }
  return supportsSpatialAudio_SupportsSpatialAudio;
}

uint64_t __47__AXAirPodSettingsManager_supportsSpatialAudio__block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  supportsSpatialAudio_SupportsSpatialAudio = result ^ 1;
  return result;
}

- (BOOL)pairedAirPodsSupportSpatialAudio
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(AXAirPodSettingsManager *)self pairedAirPods];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 vendorId] != 76 || objc_msgSend(v7, "productId") != 8203)
        {
          BOOL v8 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)titleForSettings
{
  uint64_t v3 = AXAirPodsLocalizedStringForKey(@"AirPodTitle");
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v4 = [(AXAirPodSettingsManager *)self pairedAirPods];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__AXAirPodSettingsManager_titleForSettings__block_invoke;
  v8[3] = &unk_1E5586998;
  v8[4] = &v13;
  v8[5] = &v9;
  [v4 enumerateObjectsUsingBlock:v8];

  if (*((unsigned char *)v10 + 24))
  {
    if (*((unsigned char *)v14 + 24)) {
      uint64_t v5 = @"AirPodTitleBoth";
    }
    else {
      uint64_t v5 = @"AirPodTitleBeats";
    }
    uint64_t v6 = AXAirPodsB494LocalizedStringForKey(v5);

    uint64_t v3 = (void *)v6;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v3;
}

uint64_t __43__AXAirPodSettingsManager_titleForSettings__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 productId] == 8206
    || [v5 productId] == 8202
    || [v5 productId] == 8211
    || [v5 productId] == 8212
    || [v5 productId] == 8228
    || [v5 productId] == 8217
    || [v5 productId] == 8219
    || [v5 productId] == 8222
    || [v5 productId] == 8223)
  {
    uint64_t v3 = (unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
LABEL_11:
    unsigned char *v3 = 1;
    goto LABEL_12;
  }
  if (AXIsBeatsProductId(v5))
  {
    uint64_t v3 = (unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    goto LABEL_11;
  }
LABEL_12:

  return MEMORY[0x1F41817F8]();
}

- (id)disambiguationString
{
  uint64_t v3 = AXAirPodsLocalizedStringForKey(@"AirPodSelection");
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v4 = [(AXAirPodSettingsManager *)self pairedAirPods];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__AXAirPodSettingsManager_disambiguationString__block_invoke;
  v8[3] = &unk_1E5586998;
  v8[4] = &v13;
  v8[5] = &v9;
  [v4 enumerateObjectsUsingBlock:v8];

  if (*((unsigned char *)v10 + 24))
  {
    if (*((unsigned char *)v14 + 24)) {
      id v5 = @"AirPodSelectionBoth";
    }
    else {
      id v5 = @"AirPodSelectionBeats";
    }
    uint64_t v6 = AXAirPodsB494LocalizedStringForKey(v5);

    uint64_t v3 = (void *)v6;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v3;
}

uint64_t __47__AXAirPodSettingsManager_disambiguationString__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 productId] == 8206
    || [v5 productId] == 8202
    || [v5 productId] == 8211
    || [v5 productId] == 8212
    || [v5 productId] == 8228
    || [v5 productId] == 8217
    || [v5 productId] == 8219
    || [v5 productId] == 8222
    || [v5 productId] == 8223)
  {
    uint64_t v3 = (unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
LABEL_11:
    unsigned char *v3 = 1;
    goto LABEL_12;
  }
  if (AXIsBeatsProductId(v5))
  {
    uint64_t v3 = (unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    goto LABEL_11;
  }
LABEL_12:

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isBeatsProduct:(id)a3
{
  return AXIsBeatsProductId(a3);
}

- (BOOL)isAirPodProduct:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 vendorId] == 76
    && ([v3 productId] == 8206
     || [v3 productId] == 8202
     || [v3 productId] == 8211
     || [v3 productId] == 8212
     || [v3 productId] == 8228
     || [v3 productId] == 8217
     || [v3 productId] == 8219
     || [v3 productId] == 8222
     || [v3 productId] == 8223);

  return v4;
}

- (id)_deviceWithDeviceAddress:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  char v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v5 = [(AXAirPodSettingsManager *)self pairedAirPods];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__AXAirPodSettingsManager__deviceWithDeviceAddress___block_invoke;
  v9[3] = &unk_1E55869C0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__AXAirPodSettingsManager__deviceWithDeviceAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 address];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)supportsTapSpeedForDeviceAddress:(id)a3
{
  id v3 = self;
  id v4 = [(AXAirPodSettingsManager *)self _deviceWithDeviceAddress:a3];
  LOBYTE(v3) = [(AXAirPodSettingsManager *)v3 isAirPodProduct:v4];

  return (char)v3;
}

- (float)tapSpeedForDeviceAddress:(id)a3
{
  _AXSAirPodsTapSpeed();
  return result;
}

- (void)setTapSpeed:(float)a3 forDeviceAddress:(id)a4
{
  id v7 = a4;
  _AXSSetAirPodsTapSpeed();
  *(float *)&double v6 = a3;
  [(AXAirPodSettingsManager *)self nps_setTapSpeed:v7 forDeviceAddress:v6];
}

- (BOOL)supportsNoiseCancellationEnabledForDeviceAddress:(id)a3
{
  id v3 = [(AXAirPodSettingsManager *)self _deviceWithDeviceAddress:a3];
  BOOL v4 = [v3 vendorId] == 76
    && ([v3 productId] == 8206
     || [v3 productId] == 8210
     || [v3 productId] == 8212
     || [v3 productId] == 8228
     || [v3 productId] == 8219
     || [v3 productId] == 8221);

  return v4;
}

- (BOOL)noiseCancellationEnabledWithOneUnitForDeviceAddress:(id)a3
{
  return _AXSAirPodsNoiseCancellationWithOneUnit() != 0;
}

- (void)setNoiseCancellationEnabledWithOneUnit:(BOOL)a3 forDeviceAddress:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  _AXSSetAirPodsNoiseCancellationWithOneUnit();
  [(AXAirPodSettingsManager *)self nps_setNoiseCancellationEnabledWithOneUnit:v4 forDeviceAddress:v6];
}

- (BOOL)supportsToneVolumeForDeviceAddress:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(AXAirPodSettingsManager *)self _deviceWithDeviceAddress:a3];
  unsigned int v4 = [v3 getAACPCapabilityInteger:7];
  uint64_t v5 = [v3 connected];
  id v6 = AXLogAirPodSettings();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithInteger:v4];
    int v8 = [NSNumber numberWithBool:v5];
    int v11 = 138412802;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    char v16 = v8;
    _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_DEFAULT, "BT Device has AACP Capability: %@ = %@ and connected %@", (uint8_t *)&v11, 0x20u);
  }
  if (v4) {
    BOOL v9 = v5;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)supportsCaseTonesForDeviceAddress:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(AXAirPodSettingsManager *)self _deviceWithDeviceAddress:a3];
  int v4 = [v3 productId];
  BOOL v6 = v4 == 8230 || v4 == 8221;
  uint64_t v7 = [v3 connected];
  int v8 = AXLogAirPodSettings();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [NSNumber numberWithBool:v6];
    id v10 = [NSNumber numberWithBool:v7];
    int v12 = 138412802;
    __int16 v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "BT Device supports Case Tones: %@ = %@ and connected %@", (uint8_t *)&v12, 0x20u);
  }
  return v7 & v6;
}

- (void)setCaseTonesEnabled:(BOOL)a3 forDeviceAddress:(id)a4
{
}

- (BOOL)caseTonesEnabledForDeviceAddress:(id)a3
{
  return _AXSHeadsetCaseTonesEnabled() != 0;
}

- (unsigned)defaultToneVolumeForDeviceAddress:(id)a3
{
  return _AXSAirPodsDefaultToneVolume();
}

- (unsigned)toneVolumeForDeviceAddress:(id)a3
{
  return _AXSAirPodsToneVolume();
}

- (void)setToneVolume:(unsigned int)a3 forDeviceAddress:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = AXLogAirPodSettings();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [NSNumber numberWithUnsignedInt:v4];
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_DEFAULT, "Setting tone volume %@ for %@", (uint8_t *)&v10, 0x16u);
  }
  _AXSSetAirPodsToneVolume();
  *(float *)&double v9 = (float)v4;
  [(AXAirPodSettingsManager *)self nps_setToneVolume:v6 forDeviceAddress:v9];
}

- (BOOL)supportsHoldDurationForDeviceAddress:(id)a3
{
  id v3 = self;
  uint64_t v4 = [(AXAirPodSettingsManager *)self _deviceWithDeviceAddress:a3];
  LOBYTE(v3) = [(AXAirPodSettingsManager *)v3 isAirPodProduct:v4];

  return (char)v3;
}

- (float)holdDurationForDeviceAddress:(id)a3
{
  _AXSAirPodsHoldDuration();
  return result;
}

- (void)setHoldDuration:(float)a3 forDeviceAddress:(id)a4
{
  id v7 = a4;
  _AXSSetAirPodsHoldDuration();
  *(float *)&double v6 = a3;
  [(AXAirPodSettingsManager *)self nps_setHoldDuration:v7 forDeviceAddress:v6];
}

- (BOOL)supportsVolumeSwipeForDeviceAddress:(id)a3
{
  id v3 = [(AXAirPodSettingsManager *)self _deviceWithDeviceAddress:a3];
  BOOL v4 = [v3 vendorId] == 76
    && ([v3 productId] == 8212 || objc_msgSend(v3, "productId") == 8228);

  return v4;
}

- (BOOL)volumeSwipeEnabledForDeviceAddress:(id)a3
{
  return _AXSAirPodsVolumeSwipeEnabled() != 0;
}

- (void)setVolumeSwipeEnabled:(BOOL)a3 forDeviceAddress:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  _AXSSetAirPodsVolumeSwipeEnabled();
  [(AXAirPodSettingsManager *)self nps_setVolumeSwipeEnabled:v4 forDeviceAddress:v6];
}

- (float)volumeSwipeDurationForDeviceAddress:(id)a3
{
  _AXSAirPodsVolumeSwipeDuration();
  return result;
}

- (void)setVolumeSwipeDuration:(float)a3 forDeviceAddress:(id)a4
{
  id v7 = a4;
  _AXSSetAirPodsVolumeSwipeDuration();
  *(float *)&double v6 = a3;
  [(AXAirPodSettingsManager *)self nps_setVolumeSwipeDuration:v7 forDeviceAddress:v6];
}

- (BOOL)supportsSpatialAudioForDeviceAddress:(id)a3
{
  id v3 = [(AXAirPodSettingsManager *)self _deviceWithDeviceAddress:a3];
  BOOL v4 = [v3 vendorId] != 76
    || [v3 productId] != 8203 && objc_msgSend(v3, "productId") != 8230;

  return v4;
}

- (id)accessibilityDomainAccessor
{
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  id v3 = [v2 getActivePairedDevice];

  if (v3
    && ([v3 valueForProperty:*MEMORY[0x1E4F79DA0]],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 BOOLValue],
        v4,
        (v5 & 1) == 0))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F79CD8]);
    double v6 = (void *)[v7 initWithDomain:*MEMORY[0x1E4FB8FD8] pairedDevice:v3];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_nps_airPodsDictionaryForPreference:(id)a3
{
  id v4 = a3;
  char v5 = [(AXAirPodSettingsManager *)self accessibilityDomainAccessor];
  id v6 = (id)[v5 synchronize];
  id v7 = [v5 dictionaryForKey:v4];

  return v7;
}

- (void)_nps_updateAirPodsDictionaryForPreference:(id)a3 deviceAddress:(id)a4 value:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = AXLogAirPodSettings();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_INFO, "[NPS] Updating device %@, %@ => %@", buf, 0x20u);
  }

  if ([v8 length] && (uint64_t v12 = objc_msgSend(v9, "length"), v10) && v12)
  {
    id v13 = [(AXAirPodSettingsManager *)self accessibilityDomainAccessor];
    if (v13)
    {
      uint64_t v14 = [(AXAirPodSettingsManager *)self _nps_airPodsDictionaryForPreference:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v15 = [v14 mutableCopy];
      }
      else
      {
        __int16 v15 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      __int16 v16 = v15;
      [v15 setObject:v10 forKeyedSubscript:v9];
      [v13 setObject:v16 forKey:v8];
      id v17 = (id)[v13 synchronize];
      uint64_t v18 = objc_opt_new();
      __int16 v19 = [v13 domain];
      v20 = (void *)MEMORY[0x1E4F1CAD0];
      id v23 = v8;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      v22 = [v20 setWithArray:v21];
      [v18 synchronizeNanoDomain:v19 keys:v22];
    }
    else
    {
      __int16 v16 = AXLogAirPodSettings();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D308000, v16, OS_LOG_TYPE_INFO, "[NPS] No domain accessor!", buf, 2u);
      }
    }
  }
  else
  {
    id v13 = AXLogAirPodSettings();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v13, OS_LOG_TYPE_INFO, "[NPS] invalid parameters!", buf, 2u);
    }
  }
}

- (float)nps_tapSpeedForDeviceAddress:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB9040];
  id v5 = a3;
  id v6 = [(AXAirPodSettingsManager *)self _nps_airPodsDictionaryForPreference:v4];
  id v7 = [v6 objectForKeyedSubscript:v5];

  float v8 = 0.25;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      float v8 = v9;
    }
  }

  return v8;
}

- (void)nps_setTapSpeed:(float)a3 forDeviceAddress:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FB9040];
  id v7 = NSNumber;
  id v8 = a4;
  *(float *)&double v9 = a3;
  id v10 = [v7 numberWithFloat:v9];
  [(AXAirPodSettingsManager *)self _nps_updateAirPodsDictionaryForPreference:v6 deviceAddress:v8 value:v10];
}

- (BOOL)nps_noiseCancellationEnabledWithOneUnitForDeviceAddress:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB9020];
  id v5 = a3;
  uint64_t v6 = [(AXAirPodSettingsManager *)self _nps_airPodsDictionaryForPreference:v4];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v8 = [v7 BOOLValue];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)nps_setNoiseCancellationEnabledWithOneUnit:(BOOL)a3 forDeviceAddress:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = *MEMORY[0x1E4FB9020];
  id v7 = NSNumber;
  id v8 = a4;
  id v9 = [v7 numberWithBool:v4];
  [(AXAirPodSettingsManager *)self _nps_updateAirPodsDictionaryForPreference:v6 deviceAddress:v8 value:v9];
}

- (float)nps_holdDurationForDeviceAddress:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB9010];
  id v5 = a3;
  uint64_t v6 = [(AXAirPodSettingsManager *)self _nps_airPodsDictionaryForPreference:v4];
  id v7 = [v6 objectForKeyedSubscript:v5];

  float v8 = 0.5;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      float v8 = v9;
    }
  }

  return v8;
}

- (void)nps_setHoldDuration:(float)a3 forDeviceAddress:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FB9010];
  id v7 = NSNumber;
  id v8 = a4;
  *(float *)&double v9 = a3;
  id v10 = [v7 numberWithFloat:v9];
  [(AXAirPodSettingsManager *)self _nps_updateAirPodsDictionaryForPreference:v6 deviceAddress:v8 value:v10];
}

- (unsigned)nps_defaultToneVolumeForDeviceAddress:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB9000];
  id v5 = a3;
  uint64_t v6 = [(AXAirPodSettingsManager *)self _nps_airPodsDictionaryForPreference:v4];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v8 = [v7 unsignedIntValue];
  }
  else {
    unsigned int v8 = 80;
  }

  return v8;
}

- (float)nps_toneVolumeForDeviceAddress:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB9038];
  id v5 = a3;
  uint64_t v6 = [(AXAirPodSettingsManager *)self _nps_airPodsDictionaryForPreference:v4];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v7 floatValue];
    float v9 = v8;
  }
  else
  {
    float v9 = 80.0;
  }

  return v9;
}

- (void)nps_setToneVolume:(float)a3 forDeviceAddress:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FB9038];
  id v7 = NSNumber;
  id v8 = a4;
  *(float *)&double v9 = a3;
  id v10 = [v7 numberWithFloat:v9];
  [(AXAirPodSettingsManager *)self _nps_updateAirPodsDictionaryForPreference:v6 deviceAddress:v8 value:v10];
}

- (BOOL)nps_volumeSwipeEnabledForDeviceAddress:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB9060];
  id v5 = a3;
  uint64_t v6 = [(AXAirPodSettingsManager *)self _nps_airPodsDictionaryForPreference:v4];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v8 = [v7 BOOLValue];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (void)nps_setVolumeSwipeEnabled:(BOOL)a3 forDeviceAddress:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = *MEMORY[0x1E4FB9060];
  id v7 = NSNumber;
  id v8 = a4;
  id v9 = [v7 numberWithBool:v4];
  [(AXAirPodSettingsManager *)self _nps_updateAirPodsDictionaryForPreference:v6 deviceAddress:v8 value:v9];
}

- (float)nps_volumeSwipeDurationForDeviceAddress:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB9050];
  id v5 = a3;
  uint64_t v6 = [(AXAirPodSettingsManager *)self _nps_airPodsDictionaryForPreference:v4];
  id v7 = [v6 objectForKeyedSubscript:v5];

  float v8 = 0.5;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      float v8 = v9;
    }
  }

  return v8;
}

- (void)nps_setVolumeSwipeDuration:(float)a3 forDeviceAddress:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FB9050];
  id v7 = NSNumber;
  id v8 = a4;
  *(float *)&double v9 = a3;
  id v10 = [v7 numberWithFloat:v9];
  [(AXAirPodSettingsManager *)self _nps_updateAirPodsDictionaryForPreference:v6 deviceAddress:v8 value:v10];
}

- (void)_serviceEventForDevice:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 eventType:(int)a5 specificEvent:(unsigned int)a6 result:(int)a7
{
  delayTimer = self->_delayTimer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__AXAirPodSettingsManager__serviceEventForDevice_serviceMask_eventType_specificEvent_result___block_invoke;
  v8[3] = &unk_1E5585F48;
  v8[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](delayTimer, "afterDelay:processBlock:", v8, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, 0.5);
}

uint64_t __93__AXAirPodSettingsManager__serviceEventForDevice_serviceMask_eventType_specificEvent_result___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _probeAccessories];
}

- (void)_accessoryEventForManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6
{
  delayTimer = self->_delayTimer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__AXAirPodSettingsManager__accessoryEventForManager_event_device_state___block_invoke;
  v7[3] = &unk_1E5585F48;
  v7[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](delayTimer, "afterDelay:processBlock:", v7, *(void *)&a4, a5, *(void *)&a6, 0.5);
}

uint64_t __72__AXAirPodSettingsManager__accessoryEventForManager_event_device_state___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) _probeAccessories];
  v2 = AXLogAirPodSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __72__AXAirPodSettingsManager__accessoryEventForManager_event_device_state___block_invoke_cold_1((uint64_t)v1, v2);
  }

  return [*v1 _retrieveSettingsFromDevices:*((void *)*v1 + 7)];
}

- (BOOL)isConnectedToBluetoothSystem
{
  return self->_session != 0;
}

- (void)_sessionEventForSession:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  if ((a4 - 1) >= 3)
  {
    if (a4) {
      return;
    }
    double v9 = SWCHLogHW();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v9, OS_LOG_TYPE_DEFAULT, "BTSession attached.", buf, 2u);
    }

    if (!a5)
    {
      [(AXAirPodSettingsManager *)self _didConnectWithSession:a3];
      return;
    }
    goto LABEL_10;
  }
  id v7 = SWCHLogHW();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_DEFAULT, "BTSession detached.", v10, 2u);
  }

  if (self->_session == a3) {
LABEL_10:
  }
    [(AXAirPodSettingsManager *)self _didDisconnect];
}

- (void)_didConnectWithSession:(BTSessionImpl *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = AXLogAirPodSettings();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Connecting to BT session for AirPod settings: %d", buf, 8u);
  }

  if (!self->_session)
  {
    self->_session = a3;
    BTAccessoryManagerGetDefault();
    BTLocalDeviceGetDefault();
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    *(void *)buf = accessoryEventCallback;
    BTAccessoryManagerAddCallbacks();
    BTServiceAddCallbacks();
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AXAirPodSettingsManager__didConnectWithSession___block_invoke;
    block[3] = &unk_1E5585F48;
    block[4] = self;
    dispatch_async(queue, block);
    id v7 = [(AXAirPodSettingsManager *)self readyBlock];

    if (v7)
    {
      id v8 = [(AXAirPodSettingsManager *)self readyBlock];
      dispatch_async(MEMORY[0x1E4F14428], v8);
    }
  }
}

uint64_t __50__AXAirPodSettingsManager__didConnectWithSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _probeAccessories];
}

- (void)_didDisconnect
{
  if (self->_session)
  {
    BTServiceRemoveCallbacks();
    BTSessionDetachWithQueue();
    self->_session = 0;
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __41__AXAirPodSettingsManager__didDisconnect__block_invoke(uint64_t a1)
{
  v2 = AXLogAirPodSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_18D308000, v2, OS_LOG_TYPE_DEFAULT, "BT disconnected, restarting session", v4, 2u);
  }

  return [*(id *)(a1 + 32) start];
}

- (void)_probeAccessories
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "BTLocalDeviceGetConnectedDevices failed: %d", (uint8_t *)v2, 8u);
}

- (void)_retrieveSettingsFromDevices:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AXAirPodSettingsManager *)self _retrieveSettingsForAddress:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_applySettings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableSet *)self->_deviceMap count])
  {
    uint64_t v3 = AXLogAirPodSettings();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_DEFAULT, "Trying to apply settings, but no devices, so probing immediately", buf, 2u);
    }

    [(AXAirPodSettingsManager *)self _probeAccessories];
  }
  id v4 = AXLogAirPodSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    deviceMap = self->_deviceMap;
    *(_DWORD *)buf = 138412290;
    id v17 = deviceMap;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "Applying airpod settings to: %@", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_deviceMap;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[AXAirPodSettingsManager _applySettingsForAddress:](self, "_applySettingsForAddress:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_retrieveSettingsForAddress:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 UTF8String];
  BTDeviceAddressFromString();
  if (BTDeviceFromAddress())
  {
    uint64_t v5 = AXLogAirPodSettings();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AXAirPodSettingsManager _retrieveSettingsForAddress:]();
    }
  }
  else
  {
    [(AXAirPodSettingsManager *)self setIgnoreSettingNotifications:1];
    int ControlCommand = BTAccessoryManagerGetControlCommand();
    if (ControlCommand)
    {
      int v7 = ControlCommand;
      uint64_t v8 = AXLogAirPodSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v27 = v7;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v4;
        __int16 v28 = 1024;
        int v29 = 0;
        _os_log_error_impl(&dword_18D308000, v8, OS_LOG_TYPE_ERROR, "could not get click speed[%d] for air pods: %@ -> [%d]", buf, 0x18u);
      }
    }
    else
    {
      _AXSAirPodsTapSpeed();
      if (v9 != 0.25) {
        _AXSSetAirPodsTapSpeed();
      }
      uint64_t v8 = AXLogAirPodSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)id v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 0;
        _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "retrieved click speed for air pods: %@ -> [%d]", buf, 0x12u);
      }
    }

    uint64_t v10 = BTAccessoryManagerGetControlCommand();
    if (v10)
    {
      uint64_t v11 = v10;
      long long v12 = AXLogAirPodSettings();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(AXAirPodSettingsManager *)(uint64_t)v4 _retrieveSettingsForAddress:v12];
      }
    }
    else
    {
      long long v12 = AXLogAirPodSettings();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXAirPodSettingsManager _retrieveSettingsForAddress:]();
      }
    }

    int v13 = BTAccessoryManagerGetControlCommand();
    if (v13)
    {
      int v14 = v13;
      __int16 v15 = AXLogAirPodSettings();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v27 = v14;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v4;
        __int16 v28 = 1024;
        int v29 = 0;
        _os_log_error_impl(&dword_18D308000, v15, OS_LOG_TYPE_ERROR, "could not get hold duration [%d] for air pods: %@ -> [%d]", buf, 0x18u);
      }
    }
    else
    {
      _AXSAirPodsHoldDuration();
      if (v16 != 0.5) {
        _AXSSetAirPodsHoldDuration();
      }
      __int16 v15 = AXLogAirPodSettings();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)id v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 0;
        _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_DEFAULT, "retrieved hold duration for air pods: %@ -> [%d]", buf, 0x12u);
      }
    }

    int v17 = BTAccessoryManagerGetControlCommand();
    if (v17)
    {
      __int16 v19 = AXLogAirPodSettings();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v27 = v17;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v4;
        __int16 v28 = 1024;
        int v29 = 2;
        _os_log_error_impl(&dword_18D308000, v19, OS_LOG_TYPE_ERROR, "could not get volume swipe mode[%d]: %@ -> %d", buf, 0x18u);
      }
    }
    else
    {
      int v18 = 2;
      if (_AXSAirPodsVolumeSwipeEnabled() != (v18 == 1)) {
        _AXSSetAirPodsVolumeSwipeEnabled();
      }
      __int16 v19 = AXLogAirPodSettings();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)id v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 2;
        _os_log_impl(&dword_18D308000, v19, OS_LOG_TYPE_DEFAULT, "retrieved volume swipe enabled for air pods: %@ -> [%d]", buf, 0x12u);
      }
    }

    int v20 = BTAccessoryManagerGetControlCommand();
    if (v20)
    {
      int v21 = v20;
      v22 = AXLogAirPodSettings();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v27 = v21;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v4;
        __int16 v28 = 1024;
        int v29 = 0;
        _os_log_error_impl(&dword_18D308000, v22, OS_LOG_TYPE_ERROR, "could not get volume swipe duration [%d] for air pods: %@ -> [%d]", buf, 0x18u);
      }
    }
    else
    {
      _AXSAirPodsVolumeSwipeDuration();
      if (v23 != 0.5) {
        _AXSSetAirPodsVolumeSwipeDuration();
      }
      v22 = AXLogAirPodSettings();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)id v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 0;
        _os_log_impl(&dword_18D308000, v22, OS_LOG_TYPE_DEFAULT, "retrieved volume swipe duration for air pods: %@ -> [%d]", buf, 0x12u);
      }
    }

    int v24 = BTAccessoryManagerGetControlCommand();
    if (v24)
    {
      id v25 = AXLogAirPodSettings();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v27 = v24;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v4;
        __int16 v28 = 1024;
        int v29 = 2;
        _os_log_error_impl(&dword_18D308000, v25, OS_LOG_TYPE_ERROR, "could not get case tones mode[%d]: %@ -> %d", buf, 0x18u);
      }
    }
    else
    {
      if (_AXSHeadsetCaseTonesEnabled()) {
        _AXSSetHeadsetCaseTonesEnabled();
      }
      id v25 = AXLogAirPodSettings();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)id v27 = v4;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = 0;
        _os_log_impl(&dword_18D308000, v25, OS_LOG_TYPE_DEFAULT, "retrieved case tones enabled for beats: %@ -> [%d]", buf, 0x12u);
      }
    }

    [(AXAirPodSettingsManager *)self setIgnoreSettingNotifications:0];
  }
}

- (void)_applySettingsForAddress:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AXLogAirPodSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v52 = v3;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "Applying AirPod settings for %@", buf, 0xCu);
  }

  WORD2(v50) = 0;
  LODWORD(v50) = 0;
  id v5 = v3;
  [v5 UTF8String];
  BTDeviceAddressFromString();
  if (BTDeviceFromAddress())
  {
    uint64_t v6 = AXLogAirPodSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXAirPodSettingsManager _retrieveSettingsForAddress:]();
    }
LABEL_76:

    goto LABEL_77;
  }
  uint64_t v7 = _AXSAirPodsToneVolume();
  uint64_t v8 = _AXSAirPodsDefaultToneVolume();
  uint64_t v9 = v7 | (v8 << 8);
  int v10 = BTAccessoryManagerSendControlCommand();
  uint64_t v11 = AXLogAirPodSettings();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = objc_msgSend(NSNumber, "numberWithInt:", v9, 0, v50);
    int v13 = [NSNumber numberWithUnsignedInt:v7];
    int v14 = [NSNumber numberWithUnsignedInt:v8];
    *(_DWORD *)buf = 138413058;
    *(void *)v52 = v12;
    *(_WORD *)&v52[8] = 2112;
    *(void *)&v52[10] = v13;
    __int16 v53 = 2112;
    double v54 = *(double *)&v14;
    __int16 v55 = 2112;
    id v56 = v5;
    _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_DEFAULT, "Set tone volume: %@ (%@/%@) on %@", buf, 0x2Au);
  }
  if (v10)
  {
    __int16 v15 = AXLogAirPodSettings();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AXAirPodSettingsManager _applySettingsForAddress:].cold.4((uint64_t)v5, v9);
    }
  }
  _AXSAirPodsTapSpeed();
  double v17 = v16;
  if (fabs(v16 + -0.25) < 0.001) {
    goto LABEL_17;
  }
  if (fabs(v17 + -0.45) < 0.001)
  {
    int v18 = 1;
    goto LABEL_18;
  }
  if (fabs(v17 + -0.65) >= 0.001) {
LABEL_17:
  }
    int v18 = 0;
  else {
    int v18 = 2;
  }
LABEL_18:
  int v19 = BTAccessoryManagerSendControlCommand();
  int v20 = AXLogAirPodSettings();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v18;
    *(_WORD *)&v52[4] = 2112;
    *(void *)&v52[6] = v5;
    _os_log_impl(&dword_18D308000, v20, OS_LOG_TYPE_INFO, "Set double click mode: %d on %@", buf, 0x12u);
  }

  if (v19)
  {
    int v21 = AXLogAirPodSettings();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v52 = v5;
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = v17;
      __int16 v53 = 1024;
      LODWORD(v54) = v18;
      _os_log_error_impl(&dword_18D308000, v21, OS_LOG_TYPE_ERROR, "could not set click speed for air pods: %@ -> [%f > %d]", buf, 0x1Cu);
    }
  }
  _AXSAirPodsHoldDuration();
  double v23 = v22;
  if (fabs(v22 + -0.5) < 0.001) {
    goto LABEL_29;
  }
  if (fabs(v23 + -0.4) >= 0.001)
  {
    if (fabs(v23 + -0.35) < 0.001)
    {
      int v24 = 2;
      goto LABEL_30;
    }
LABEL_29:
    int v24 = 0;
    goto LABEL_30;
  }
  int v24 = 1;
LABEL_30:
  int v25 = BTAccessoryManagerSendControlCommand();
  __int16 v26 = AXLogAirPodSettings();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v24;
    *(_WORD *)&v52[4] = 2112;
    *(void *)&v52[6] = v5;
    _os_log_impl(&dword_18D308000, v26, OS_LOG_TYPE_DEFAULT, "Set hold duration mode: %d on %@", buf, 0x12u);
  }

  if (v25)
  {
    id v27 = AXLogAirPodSettings();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v52 = v5;
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = v23;
      __int16 v53 = 1024;
      LODWORD(v54) = v24;
      _os_log_error_impl(&dword_18D308000, v27, OS_LOG_TYPE_ERROR, "could not set hold duration for air pods: %@ -> [%f > %d]", buf, 0x1Cu);
    }
  }
  int v28 = _AXSAirPodsNoiseCancellationWithOneUnit();
  if (v28) {
    uint64_t v29 = 1;
  }
  else {
    uint64_t v29 = 2;
  }
  uint64_t v30 = AXLogAirPodSettings();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v29;
    *(_WORD *)&v52[4] = 2112;
    *(void *)&v52[6] = v5;
    _os_log_impl(&dword_18D308000, v30, OS_LOG_TYPE_DEFAULT, "Set noise cancellation with one bud: %d on %@", buf, 0x12u);
  }

  if (BTAccessoryManagerSendControlCommand())
  {
    v31 = AXLogAirPodSettings();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[AXAirPodSettingsManager _applySettingsForAddress:]();
    }
  }
  int v32 = _AXSAirPodsVolumeSwipeEnabled();
  if (v32) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 2;
  }
  v34 = AXLogAirPodSettings();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [NSNumber numberWithUnsignedInt:v33];
    *(_DWORD *)buf = 138412290;
    *(void *)v52 = v35;
    _os_log_impl(&dword_18D308000, v34, OS_LOG_TYPE_DEFAULT, "Set volume swipe enabled: %@", buf, 0xCu);
  }
  if (BTAccessoryManagerSendControlCommand())
  {
    v36 = AXLogAirPodSettings();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[AXAirPodSettingsManager _applySettingsForAddress:]();
    }
  }
  _AXSAirPodsVolumeSwipeDuration();
  double v38 = v37;
  if (fabs(v37 + -0.5) < 0.001) {
    goto LABEL_59;
  }
  if (fabs(v38 + -0.4) < 0.001)
  {
    int v39 = 1;
    goto LABEL_60;
  }
  if (fabs(v38 + -0.35) >= 0.001) {
LABEL_59:
  }
    int v39 = 0;
  else {
    int v39 = 2;
  }
LABEL_60:
  int v40 = BTAccessoryManagerSendControlCommand();
  v41 = AXLogAirPodSettings();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v39;
    *(_WORD *)&v52[4] = 2112;
    *(void *)&v52[6] = v5;
    _os_log_impl(&dword_18D308000, v41, OS_LOG_TYPE_DEFAULT, "Set volume swipe duration mode: %d on %@", buf, 0x12u);
  }

  if (v40)
  {
    v42 = AXLogAirPodSettings();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v52 = v5;
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = v38;
      __int16 v53 = 1024;
      LODWORD(v54) = v39;
      _os_log_error_impl(&dword_18D308000, v42, OS_LOG_TYPE_ERROR, "could not set volume swipe duration for air pods: %@ -> [%f > %d]", buf, 0x1Cu);
    }
  }
  v43 = AXLogAirPodSettings();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = [NSNumber numberWithUnsignedInt:v29];
    *(_DWORD *)buf = 138413826;
    *(void *)v52 = v5;
    *(_WORD *)&v52[8] = 2048;
    *(double *)&v52[10] = v17;
    __int16 v53 = 2048;
    double v54 = v23;
    __int16 v55 = 2112;
    id v56 = v44;
    __int16 v57 = 1024;
    int v58 = v28;
    __int16 v59 = 1024;
    int v60 = v32;
    __int16 v61 = 2048;
    double v62 = v38;
    _os_log_impl(&dword_18D308000, v43, OS_LOG_TYPE_DEFAULT, "Set click and hold speed for airpod: %@ [click %f, hold %f, ANC: (BT:%@, setting:%d)] Vol Swipe [%d, %lf]", buf, 0x40u);
  }
  uint64_t v45 = _AXSHeadsetCaseTonesEnabled();
  if (v45) {
    uint64_t v46 = 1;
  }
  else {
    uint64_t v46 = 2;
  }
  v47 = AXLogAirPodSettings();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = [NSNumber numberWithUnsignedChar:v45];
    v49 = [NSNumber numberWithUnsignedInt:v46];
    *(_DWORD *)buf = 138412546;
    *(void *)v52 = v48;
    *(_WORD *)&v52[8] = 2112;
    *(void *)&v52[10] = v49;
    _os_log_impl(&dword_18D308000, v47, OS_LOG_TYPE_DEFAULT, "Set case tones enabled: %@, BT value: %@", buf, 0x16u);
  }
  if (BTAccessoryManagerSendControlCommand())
  {
    uint64_t v6 = AXLogAirPodSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXAirPodSettingsManager _applySettingsForAddress:]();
    }
    goto LABEL_76;
  }
LABEL_77:
}

- (id)initSharedInstance
{
  v10.receiver = self;
  v10.super_class = (Class)AXAirPodSettingsManager;
  v2 = [(AXAirPodSettingsManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deviceMap = v2->_deviceMap;
    v2->_deviceMap = (NSMutableSet *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("airpod-bt-monitor-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F48318]) initWithTargetSerialQueue:v2->_queue];
    delayTimer = v2->_delayTimer;
    v2->_delayTimer = (AXDispatchTimer *)v7;

    [(AXDispatchTimer *)v2->_delayTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v2;
}

- (void)start
{
}

- (void)startWithCallback:(id)a3
{
  [(AXAirPodSettingsManager *)self setReadyBlock:a3];
  int v14 = sessionEventCallback;
  if (BTSessionAttachWithQueue())
  {
    uint64_t v3 = AXLogAirPodSettings();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AXAirPodSettingsManager startWithCallback:](v3);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E4FB9028], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  dispatch_queue_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E4FB9008], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E4FB9018], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E4FB9030], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E4FB8FF8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E4FB9058], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_super v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E4FB9048], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v11, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x1E4FB9190], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  long long v12 = AXLogAirPodSettings();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v13 = 0;
    _os_log_impl(&dword_18D308000, v12, OS_LOG_TYPE_INFO, "Listening for AirPods and Beats", v13, 2u);
  }
}

- (void)dealloc
{
  if (self->_session) {
    BTSessionDetachWithQueue();
  }
  v3.receiver = self;
  v3.super_class = (Class)AXAirPodSettingsManager;
  [(AXAirPodSettingsManager *)&v3 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_350);
  }
  v2 = (void *)sharedInstance_shared;

  return v2;
}

uint64_t __41__AXAirPodSettingsManager_sharedInstance__block_invoke()
{
  sharedInstance_shared = [[AXAirPodSettingsManager alloc] initSharedInstance];

  return MEMORY[0x1F41817F8]();
}

- (id)readyBlock
{
  return self->_readyBlock;
}

- (void)setReadyBlock:(id)a3
{
}

- (BOOL)ignoreSettingNotifications
{
  return self->_ignoreSettingNotifications;
}

- (void)setIgnoreSettingNotifications:(BOOL)a3
{
  self->_ignoreSettingNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readyBlock, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_deviceListeners, 0);
}

void __72__AXAirPodSettingsManager__accessoryEventForManager_event_device_state___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 56);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18D308000, a2, OS_LOG_TYPE_DEBUG, "Will retrieve Settings from devices: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_retrieveSettingsForAddress:.cold.1()
{
  v0 = [NSNumber numberWithInt:0];
  OUTLINED_FUNCTION_2(&dword_18D308000, v1, v2, "default tone volume is not valid [%@] for air pods: %@", v3, v4, v5, v6, 2u);
}

- (void)_retrieveSettingsForAddress:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_1_0(&dword_18D308000, a2, a3, "could not get tone volume [%d] for air pods: %@", v3, (void)v4, WORD4(v4), *MEMORY[0x1E4F143B8]);
}

- (void)_retrieveSettingsForAddress:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18D308000, v0, v1, "In sending control message, failed to look up BT address %@: %d");
}

- (void)_applySettingsForAddress:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18D308000, v0, v1, "could not set case tones mode: %@ -> %d");
}

- (void)_applySettingsForAddress:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18D308000, v0, v1, "could not set volume swipe mode: %@ -> %d");
}

- (void)_applySettingsForAddress:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18D308000, v0, v1, "could not set one bud mode: %@ -> %d");
}

- (void)_applySettingsForAddress:(uint64_t)a1 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = [NSNumber numberWithInt:a2];
  OUTLINED_FUNCTION_2(&dword_18D308000, v2, v3, "could not set tone volume for air pods: %@ -> [%@]", v4, v5, v6, v7, 2u);
}

- (void)startWithCallback:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_18D308000, log, OS_LOG_TYPE_ERROR, "Could not attach to BT session", v1, 2u);
}

@end
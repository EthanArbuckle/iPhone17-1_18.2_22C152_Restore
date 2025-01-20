@interface HAENUnknownDeviceManager
+ (id)sharedInstance;
- (BOOL)_isAlertSupported;
- (BOOL)_isUnknownWiredHeadset:(id)a3;
- (BOOL)_shouldSurfaceAlert:(id)a3;
- (BOOL)isDeviceHeadphoneJack:(id)a3;
- (BOOL)isUSBCPort;
- (BOOL)unknownWiredHeadsetConnectedThroughB204;
- (HAENUnknownDeviceManager)init;
- (id)getDeviceName;
- (id)getDeviceUID;
- (void)_processPrompt:(id)a3;
- (void)_processWiredDevice:(id)a3;
- (void)_resetWiredStatus;
- (void)_updateMXVolumeLimitStatus:(id)a3;
- (void)_wiredDeviceSessionCreated:(id)a3 SessionID:(unint64_t)a4;
- (void)_wiredDeviceSessionDestroyed:(id)a3;
- (void)_wiredDeviceSessionInit:(id)a3;
- (void)deviceSessionCreated:(id)a3 SessionID:(unint64_t)a4;
- (void)deviceSessionDestroyed:(id)a3 isWired:(BOOL)a4;
- (void)registerDevice:(id)a3;
- (void)setDeviceConnectionState:(id)a3 isConnected:(BOOL)a4;
- (void)surfaceAlertBox;
- (void)unknownWiredConnectionDidChange:(BOOL)a3;
- (void)updateWiredDeviceStatus;
@end

@implementation HAENUnknownDeviceManager

+ (id)sharedInstance
{
  if ((+[HAENDefaults isCurrentProcessMediaserverd]
     || +[HAENDefaults isRunningCITests])
    && sharedInstance_once_6 != -1)
  {
    dispatch_once(&sharedInstance_once_6, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_instance_6;
  return v2;
}

uint64_t __42__HAENUnknownDeviceManager_sharedInstance__block_invoke()
{
  sharedInstance_instance_6 = objc_alloc_init(HAENUnknownDeviceManager);
  return MEMORY[0x270F9A758]();
}

- (HAENUnknownDeviceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)HAENUnknownDeviceManager;
  v2 = [(HAENUnknownDeviceManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_alertSupported = [(HAENUnknownDeviceManager *)v2 _isAlertSupported];
    deviceName = v3->_deviceName;
    v3->_deviceName = 0;

    deviceUID = v3->_deviceUID;
    v3->_deviceUID = 0;

    v3->_connectionCnt = 0;
    v3->_alertPending = 0;
    v3->_isWiredUnknown = 0;
    v3->_adamSessionID = 561211748;
  }
  return v3;
}

- (void)deviceSessionCreated:(id)a3 SessionID:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = v6;
  if (v6)
  {
    self->_isWiredUnknown = 0;
    v8 = [v6 objectForKey:@"_HAENMetadataIdentifierHeadsetIsWired"];
    int v9 = [v8 BOOLValue];

    if (v9)
    {
      v10 = [v7 objectForKey:@"_HAENMetadataIdentifierDeviceName"];
      v11 = [v7 objectForKey:@"_HAENMetadataIdentifierHeadsetIsUnknown"];
      self->_isWiredUnknown = [v11 BOOLValue];

      v12 = [v7 objectForKey:@"_HAENMetadataIdentifierDeviceIdentifier"];
      deviceUID = self->_deviceUID;
      self->_deviceUID = v12;

      if (v10)
      {
        [(HAENUnknownDeviceManager *)self _wiredDeviceSessionCreated:v10 SessionID:a4];
      }
      else
      {
        v14 = HAENotificationsLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[HAENUnknownDeviceManager deviceSessionCreated:SessionID:]((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);
        }
      }
    }
    v21 = +[HAENVolumeControl sharedInstance];
    [v21 setDeviceInfo:v7];
  }
}

- (void)registerDevice:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(HAENUnknownDeviceManager *)self isUSBCPort])
  {
    int v9 = HAENotificationsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HAENUnknownDeviceManager registerDevice:]((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_7;
  }
  if (v4)
  {
    v5 = [v4 objectForKey:@"_HAENMetadataIdentifierDeviceIdentifier"];
    deviceUID = self->_deviceUID;
    self->_deviceUID = v5;

    objc_super v7 = [v4 objectForKey:@"_HAENMetadataIdentifierHeadsetIsUnknown"];
    if ([v7 BOOLValue])
    {
      v8 = [v4 objectForKey:@"_HAENMetadataIdentifierHeadsetIsWired"];
      self->_isWiredUnknown = [v8 BOOLValue];
    }
    else
    {
      self->_isWiredUnknown = 0;
    }

    uint64_t v16 = [v4 objectForKey:@"_HAENMetadataIdentifierDeviceName"];
    int v9 = v16;
    if (self->_deviceUID)
    {
      uint64_t v17 = [v16 copy];
      deviceName = self->_deviceName;
      self->_deviceName = v17;

      if (self->_alertSupported && [(HAENUnknownDeviceManager *)self _shouldSurfaceAlert:v9])
      {
        uint64_t v19 = +[HAENDefaults sharedInstance];
        uint64_t v20 = [v19 getAudioAccessoryConnectionInfoWithKey:self->_deviceUID];

        v21 = HAENotificationsLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 134217984;
          uint64_t v30 = v20;
          _os_log_impl(&dword_21FABA000, v21, OS_LOG_TYPE_DEFAULT, "accessory returned value: %ld", (uint8_t *)&v29, 0xCu);
        }

        if (v20 == -1) {
          [(HAENUnknownDeviceManager *)self surfaceAlertBox];
        }
      }
LABEL_7:

      os_unfair_lock_unlock(&self->_lock);
      goto LABEL_8;
    }
    v22 = HAENotificationsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[HAENUnknownDeviceManager deviceSessionCreated:SessionID:]((uint64_t)v4, v22, v23, v24, v25, v26, v27, v28);
    }
  }
LABEL_8:
}

- (void)setDeviceConnectionState:(id)a3 isConnected:(BOOL)a4
{
  id v14 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(HAENUnknownDeviceManager *)self isUSBCPort])
  {
    objc_super v7 = +[HAENDefaults sharedInstance];
    uint64_t v8 = [v7 getAudioAccessoryConnectionInfoWithKey:v14];

    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F28C30]);
      uint64_t v10 = v9;
      uint64_t v11 = *MEMORY[0x263F28BA0];
      if (a4)
      {
        uint64_t v12 = [NSNumber numberWithInt:0];
        id v13 = (id)[v10 setPreferenceFor:v11 value:v12 notify:1];
      }
      else
      {
        [v9 removePreferenceFor:*MEMORY[0x263F28BA0]];
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_wiredDeviceSessionCreated:(id)a3 SessionID:(unint64_t)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  [(HAENUnknownDeviceManager *)self _wiredDeviceSessionInit:v7];
  if (self->_adamSessionID != a4)
  {
    ++self->_connectionCnt;
    self->_adamSessionID = a4;
  }
  [(HAENUnknownDeviceManager *)self _processWiredDevice:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)_wiredDeviceSessionInit:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isEqualToString:self->_deviceName] & 1) == 0)
  {
    v5 = HAENotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      int connectionCnt = self->_connectionCnt;
      int v11 = 138412802;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = deviceName;
      __int16 v15 = 1024;
      int v16 = connectionCnt;
      _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "new wired headset [%@], previous [%@], session count [%d]", (uint8_t *)&v11, 0x1Cu);
    }

    if (self->_connectionCnt >= 1)
    {
      uint64_t v8 = HAENotificationsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_21FABA000, v8, OS_LOG_TYPE_DEFAULT, "**** old device has not been released yet, but replacing with new device", (uint8_t *)&v11, 2u);
      }
    }
    [(HAENUnknownDeviceManager *)self _resetWiredStatus];
    id v9 = (NSString *)[v4 copy];
    uint64_t v10 = self->_deviceName;
    self->_deviceName = v9;
  }
}

- (void)_processWiredDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  BOOL alertSupported = self->_alertSupported;
  id v6 = HAENotificationsLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (alertSupported)
  {
    if (v7)
    {
      int connectionCnt = self->_connectionCnt;
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 1024;
      int v14 = connectionCnt;
      _os_log_impl(&dword_21FABA000, v6, OS_LOG_TYPE_DEFAULT, "wired headset connected [%@], session count [%d]", (uint8_t *)&v11, 0x12u);
    }

    if ([(HAENUnknownDeviceManager *)self _shouldSurfaceAlert:v4])
    {
      if ([(HAENUnknownDeviceManager *)self isUSBCPort])
      {
        deviceUID = self->_deviceUID;
        uint64_t v10 = self;
      }
      else
      {
        uint64_t v10 = self;
        deviceUID = v4;
      }
      [(HAENUnknownDeviceManager *)v10 _processPrompt:deviceUID];
    }
    else
    {
      [(HAENUnknownDeviceManager *)self _updateMXVolumeLimitStatus:v4];
    }
  }
  else
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_21FABA000, v6, OS_LOG_TYPE_DEFAULT, "Alert not supported: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)updateWiredDeviceStatus
{
}

- (BOOL)unknownWiredHeadsetConnectedThroughB204
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(HAENUnknownDeviceManager *)v2 _isUnknownWiredHeadset:v2->_deviceName];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)getDeviceName
{
  return self->_deviceName;
}

- (id)getDeviceUID
{
  return self->_deviceUID;
}

- (BOOL)isDeviceHeadphoneJack:(id)a3
{
  return [a3 isEqualToString:@"Codec"];
}

- (BOOL)isUSBCPort
{
  return MGGetBoolAnswer();
}

- (void)unknownWiredConnectionDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(HAENUnknownDeviceManager *)self _isUnknownWiredHeadset:self->_deviceName])
  {
    id v6 = +[HAENVolumeControl sharedInstance];
    [v6 wiredHeadphoneConnected:v3];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_processPrompt:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HAENotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "found unknown wired headset!", (uint8_t *)&v18, 2u);
  }

  BOOL v6 = [(HAENUnknownDeviceManager *)self isUSBCPort];
  BOOL v7 = +[HAENDefaults sharedInstance];
  uint64_t v8 = v7;
  if (v6) {
    uint64_t v9 = [v7 getAudioAccessoryConnectionInfoWithKey:v4];
  }
  else {
    uint64_t v9 = [v7 getAudioAccessoryConnectionInfo];
  }
  unint64_t v10 = v9;

  int v11 = HAENotificationsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    unint64_t v19 = v10;
    _os_log_impl(&dword_21FABA000, v11, OS_LOG_TYPE_DEFAULT, "accessory returned value: %ld", (uint8_t *)&v18, 0xCu);
  }

  if (v10 < 2)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F28C30]);
    uint64_t v13 = *MEMORY[0x263F28BA0];
    int v14 = [NSNumber numberWithInt:v10 == 1];
    id v15 = (id)[v12 setPreferenceFor:v13 value:v14 notify:1];

LABEL_14:
    goto LABEL_15;
  }
  if (v10 != -1)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F28C30]);
    id v17 = (id)[v16 setPreferenceFor:*MEMORY[0x263F28BA0] value:&unk_26D151FF0 notify:1];

    id v12 = HAENotificationsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      unint64_t v19 = v10;
      _os_log_impl(&dword_21FABA000, v12, OS_LOG_TYPE_DEFAULT, "notice: could not get accessory info: %ld, assumed to be headphone", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_14;
  }
  [(HAENUnknownDeviceManager *)self surfaceAlertBox];
LABEL_15:
}

- (void)_updateMXVolumeLimitStatus:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HAENUnknownDeviceManager *)self _isUnknownWiredHeadset:v4])
  {
    v5 = +[HAENDefaults sharedInstance];
    if ([v5 softwareVersionEnabled])
    {
    }
    else
    {
      char v10 = _os_feature_enabled_impl();

      if ((v10 & 1) == 0) {
        goto LABEL_9;
      }
    }
    int v11 = +[HAENDefaults sharedInstance];
    char v12 = [v11 isConnectedUnknownWiredDeviceHeadphone];

    if ((v12 & 1) == 0)
    {
      id v13 = objc_alloc_init(MEMORY[0x263F28C30]);
      id v14 = (id)[v13 setPreferenceFor:*MEMORY[0x263F28BA0] value:&unk_26D151FF0];
    }
LABEL_9:
    BOOL v6 = HAENotificationsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      BOOL v7 = "assuming connected unknown device is headphone.";
      uint64_t v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v6 = HAENotificationsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    BOOL v7 = "Calibrated wired connection: %@";
    uint64_t v8 = v6;
    uint32_t v9 = 12;
LABEL_11:
    _os_log_impl(&dword_21FABA000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, v9);
  }
LABEL_12:

  id v15 = +[HAENVolumeControl sharedInstance];
  [v15 wiredHeadphoneConnected:1];
}

- (void)surfaceAlertBox
{
  if (self->_alertPending)
  {
    v2 = HAENotificationsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FABA000, v2, OS_LOG_TYPE_DEFAULT, "alert box pending...", buf, 2u);
    }
  }
  else
  {
    self->_alertPending = 1;
    id v4 = HAENotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "surfacing alert box", buf, 2u);
    }

    *(void *)buf = 0;
    BOOL v7 = buf;
    uint64_t v8 = 0x3042000000;
    uint32_t v9 = __Block_byref_object_copy_;
    char v10 = __Block_byref_object_dispose_;
    objc_initWeak(&v11, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__HAENUnknownDeviceManager_surfaceAlertBox__block_invoke;
    v5[3] = &unk_2645275E0;
    v5[4] = self;
    v5[5] = buf;
    dispatch_async(MEMORY[0x263EF83A0], v5);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v11);
  }
}

void __43__HAENUnknownDeviceManager_surfaceAlertBox__block_invoke(uint64_t a1)
{
  uint64_t v26 = NSDictionary;
  uint64_t v28 = HAENLocalizationUtilityGetBundle();
  v1 = [v28 localizedStringForKey:@"AlertUnknownHeadsetTitle" value:&stru_26D14F6C0 table:0];
  uint64_t v2 = *MEMORY[0x263EFFFC8];
  BOOL v3 = HAENLocalizationUtilityGetBundle();
  if (MGGetBoolAnswer()) {
    id v4 = @"AlertUnknownHeadsetMessage";
  }
  else {
    id v4 = @"AlertUnknownHeadsetMessageNoHaptics";
  }
  v5 = [v3 localizedStringForKey:v4 value:&stru_26D14F6C0 table:0];
  uint64_t v6 = *MEMORY[0x263EFFFD8];
  BOOL v7 = HAENLocalizationUtilityGetBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"AlertButtonHeadphone" value:&stru_26D14F6C0 table:0];
  uint64_t v9 = *MEMORY[0x263F00000];
  char v10 = HAENLocalizationUtilityGetBundle();
  id v11 = [v10 localizedStringForKey:@"AlertButtonOtherDevice" value:&stru_26D14F6C0 table:0];
  objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v1, v2, v5, v6, v8, v9, v11, *MEMORY[0x263EFFFE8], 0);
  CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v12);
  WeakRetained[2] = v14;
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v14, 0.0, &responseFlags);
  if (responseFlags == 1)
  {
    v22 = HAENotificationsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_21FABA000, v22, OS_LOG_TYPE_INFO, "device is not a headphone", v30, 2u);
    }

    int v23 = [*(id *)(a1 + 32) isUSBCPort];
    id v17 = +[HAENDefaults sharedInstance];
    uint64_t v18 = v17;
    if (v23)
    {
      uint64_t v20 = WeakRetained[3];
      uint64_t v19 = WeakRetained[4];
      uint64_t v21 = 0;
      goto LABEL_14;
    }
    uint64_t v24 = WeakRetained[3];
    uint64_t v25 = 0;
LABEL_19:
    [v17 setAudioAccessoryIsConnectedToHeadphones:v25 withName:v24];
    goto LABEL_20;
  }
  if (!responseFlags)
  {
    id v15 = HAENotificationsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FABA000, v15, OS_LOG_TYPE_INFO, "device is a headphone", buf, 2u);
    }

    int v16 = [*(id *)(a1 + 32) isUSBCPort];
    id v17 = +[HAENDefaults sharedInstance];
    uint64_t v18 = v17;
    if (v16)
    {
      uint64_t v20 = WeakRetained[3];
      uint64_t v19 = WeakRetained[4];
      uint64_t v21 = 1;
LABEL_14:
      [v17 setAudioAccessoryIsConnectedToHeadphones:v21 withKey:v19 name:v20];
      goto LABEL_20;
    }
    uint64_t v24 = WeakRetained[3];
    uint64_t v25 = 1;
    goto LABEL_19;
  }
  uint64_t v18 = HAENotificationsLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v29 = 0;
    _os_log_impl(&dword_21FABA000, v18, OS_LOG_TYPE_DEFAULT, "device is unknown", v29, 2u);
  }
LABEL_20:

  WeakRetained[2] = 0;
  *((unsigned char *)WeakRetained + 48) = 0;
}

- (BOOL)_isAlertSupported
{
  uint64_t v2 = (void *)MGGetStringAnswer();
  if (([v2 isEqualToString:@"iPhone"] & 1) != 0
    || ([v2 isEqualToString:@"iPad"] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isEqualToString:@"iPod"];
  }

  return v3;
}

- (BOOL)_shouldSurfaceAlert:(id)a3
{
  id v4 = a3;
  v5 = +[HAENDefaults sharedInstance];
  if ([v5 isHAENFeatureEnabled])
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v7 = +[HAENDefaults sharedInstance];
    if ([v7 isReduceLoudSoundEnabled])
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v8 = +[HAENDefaults sharedInstance];
      if ([v8 isHKWriteEnabled])
      {
        uint64_t v9 = +[HAENDefaults sharedInstance];
        if ([v9 isHAEOtherDevicesEnabled]) {
          BOOL v6 = 1;
        }
        else {
          BOOL v6 = (_os_feature_enabled_impl() & 1) != 0 && [(HAENUnknownDeviceManager *)self isUSBCPort];
        }
      }
      else if (_os_feature_enabled_impl())
      {
        BOOL v6 = [(HAENUnknownDeviceManager *)self isUSBCPort];
      }
      else
      {
        BOOL v6 = 0;
      }
    }
  }

  BOOL v10 = [(HAENUnknownDeviceManager *)self _isUnknownWiredHeadset:v4];
  return v10 && v6;
}

- (void)deviceSessionDestroyed:(id)a3 isWired:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if (v4) {
      [(HAENUnknownDeviceManager *)self _wiredDeviceSessionDestroyed:v6];
    }
    BOOL v7 = +[HAENVolumeControl sharedInstance];
    [v7 applyVolumeLoweringAtNextSession];
  }
  else
  {
    BOOL v7 = HAENotificationsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HAENUnknownDeviceManager deviceSessionDestroyed:isWired:](v7);
    }
  }
}

- (void)_wiredDeviceSessionDestroyed:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  char v6 = [v5 isEqualToString:self->_deviceName];

  if (v6)
  {
    notification = self->_notification;
    if (notification)
    {
      CFUserNotificationCancel(notification);
      self->_notification = 0;
      self->_alertPending = 0;
    }
    int connectionCnt = self->_connectionCnt;
    BOOL v9 = __OFSUB__(connectionCnt--, 1);
    self->_int connectionCnt = connectionCnt;
    if ((connectionCnt < 0) ^ v9 | (connectionCnt == 0))
    {
      BOOL v10 = HAENotificationsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->_connectionCnt;
        int v14 = 67109120;
        LODWORD(v15) = v11;
        _os_log_impl(&dword_21FABA000, v10, OS_LOG_TYPE_DEFAULT, "reset wire due to ZERO session count: %d", (uint8_t *)&v14, 8u);
      }

      [(HAENUnknownDeviceManager *)self _resetWiredStatus];
    }
  }
  else
  {
    CFDictionaryRef v12 = HAENotificationsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      int v14 = 138412290;
      id v15 = deviceName;
      _os_log_impl(&dword_21FABA000, v12, OS_LOG_TYPE_DEFAULT, "**** device [%@] already released?", (uint8_t *)&v14, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_resetWiredStatus
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_deviceName)
  {
    char v3 = HAENotificationsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      int v7 = 138412290;
      uint64_t v8 = deviceName;
      _os_log_impl(&dword_21FABA000, v3, OS_LOG_TYPE_DEFAULT, "reset wired status: %@", (uint8_t *)&v7, 0xCu);
    }

    if ([(HAENUnknownDeviceManager *)self _isUnknownWiredHeadset:self->_deviceName])
    {
      id v5 = objc_alloc_init(MEMORY[0x263F28C30]);
      [v5 removePreferenceFor:*MEMORY[0x263F28BA0]];
    }
    else
    {
      id v5 = +[HAENVolumeControl sharedInstance];
      [v5 wiredHeadphoneConnected:0];
    }

    char v6 = self->_deviceName;
    self->_deviceName = 0;
  }
  self->_int connectionCnt = 0;
  self->_adamSessionID = 561211748;
}

- (BOOL)_isUnknownWiredHeadset:(id)a3
{
  return ([a3 isEqualToString:@"Wired"] & 1) != 0 || self->_isWiredUnknown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (void)deviceSessionCreated:(uint64_t)a3 SessionID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerDevice:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deviceSessionDestroyed:(os_log_t)log isWired:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FABA000, log, OS_LOG_TYPE_ERROR, "no device UID", v1, 2u);
}

@end
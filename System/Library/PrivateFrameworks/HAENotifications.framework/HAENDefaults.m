@interface HAENDefaults
+ (BOOL)HAENSupportedForCurrentDeviceClass;
+ (BOOL)isCurrentProcessMediaserverd;
+ (BOOL)isRunningCITests;
+ (id)sharedInstance;
- (BOOL)_shouldRepromptSinceDate:(id)a3;
- (BOOL)isConnectedUnknownWiredDeviceHeadphone;
- (BOOL)isCurrentAudioAccessoryHeadphone;
- (BOOL)isCurrentAudioAccessoryHeadphoneWithKey:(id)a3;
- (BOOL)isEUVolumeLimitOn;
- (BOOL)isHAENFeatureEnabled;
- (BOOL)isHAENFeatureMandatory;
- (BOOL)isHAENFeatureOptedIn;
- (BOOL)isHAEOtherDevicesEnabled;
- (BOOL)isHKWriteEnabled;
- (BOOL)isReduceLoudSoundEnabled;
- (BOOL)isSKVolumeLimitOn;
- (BOOL)softwareVersionEnabled;
- (HAENDefaults)init;
- (double)getLiveMonitorTimeWindowInSeconds;
- (double)getLiveMonitoringThreshold;
- (double)volumeReductionDelta;
- (id)_generateAccessoryKeyWithManufacture:(id)a3 andSerialNumber:(id)a4;
- (int)getReduceLoudSoundThreshold;
- (int64_t)getAudioAccessoryConnectionInfo;
- (int64_t)getAudioAccessoryConnectionInfoWithKey:(id)a3;
- (void)_registerNotification:(id)a3;
- (void)_updateSetting:(id)a3 value:(id)a4 notify:(BOOL)a5;
- (void)forceReadDefaults;
- (void)getAudioAccessoryConnectionInfo;
- (void)removeAllAdapters;
- (void)setAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 withKey:(id)a4 name:(id)a5;
- (void)setAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 withName:(id)a4;
- (void)setUserVolumeWithValue:(float)a3 mininum:(float)a4;
- (void)updateAudioAccessoryIsConnectedToHeadphones:(int64_t)a3;
- (void)updateAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 WithKey:(id)a4;
- (void)updateRLSSettings;
- (void)updateUserVolumeForVolumeLimit;
- (void)wiredDeviceStatusDidChange;
@end

@implementation HAENDefaults

+ (id)sharedInstance
{
  if (sharedInstance_once_5 != -1) {
    dispatch_once(&sharedInstance_once_5, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_instance_5;
  return v2;
}

uint64_t __30__HAENDefaults_sharedInstance__block_invoke()
{
  sharedInstance_instance_5 = objc_alloc_init(HAENDefaults);
  return MEMORY[0x270F9A758]();
}

- (HAENDefaults)init
{
  v8.receiver = self;
  v8.super_class = (Class)HAENDefaults;
  v2 = [(HAENDefaults *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    if (+[HAENDefaults isCurrentProcessMediaserverd])
    {
      id v4 = objc_alloc_init(MEMORY[0x263F28C30]);
      [v4 removePreferenceFor:*MEMORY[0x263F28BA0] notify:0];
    }
    [(HAENDefaults *)v3 forceReadDefaults];
    [(HAENDefaults *)v3 _registerNotification:*MEMORY[0x263F28B70]];
    [(HAENDefaults *)v3 _registerNotification:*MEMORY[0x263F28B58]];
    [(HAENDefaults *)v3 _registerNotification:*MEMORY[0x263F28B78]];
    if (+[HAENDefaults isCurrentProcessMediaserverd])
    {
      [(HAENDefaults *)v3 _registerNotification:*MEMORY[0x263F28B60]];
      [(HAENDefaults *)v3 _registerNotification:*MEMORY[0x263F28B80]];
    }
    v5 = (void *)MGGetStringAnswer();
    if ([(HAENDefaults *)v3 isHAENFeatureEnabled]
      || ([v5 isEqualToString:@"iPad"] & 1) == 0)
    {
      v3->_EUVolumeLimitFlag = MGGetBoolAnswer();
      char v6 = MGGetBoolAnswer();
    }
    else
    {
      char v6 = 0;
      v3->_EUVolumeLimitFlag = 0;
    }
    v3->_SKVolumeLimitFlag = v6;
  }
  return v3;
}

- (void)forceReadDefaults
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = HAENotificationsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"re-load";
    if (!self->_domainSettings) {
      id v4 = @"load";
    }
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_21FABA000, v3, OS_LOG_TYPE_DEFAULT, "%@ defaults...", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  id v5 = objc_alloc_init(MEMORY[0x263F28C30]);
  uint64_t v6 = *MEMORY[0x263F28C00];
  v17[0] = *MEMORY[0x263F28BE0];
  v17[1] = v6;
  uint64_t v7 = *MEMORY[0x263F28BF0];
  v17[2] = *MEMORY[0x263F28C20];
  v17[3] = v7;
  uint64_t v8 = *MEMORY[0x263F28BD8];
  v17[4] = *MEMORY[0x263F28BD0];
  v17[5] = v8;
  uint64_t v9 = *MEMORY[0x263F28BA0];
  v17[6] = *MEMORY[0x263F28BF8];
  v17[7] = v9;
  uint64_t v10 = *MEMORY[0x263F28C18];
  v17[8] = *MEMORY[0x263F28C10];
  v17[9] = v10;
  v17[10] = *MEMORY[0x263F28C08];
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:11];
  v12 = [v5 getPreferencesFor:v11];
  v13 = (NSMutableDictionary *)[v12 mutableCopy];
  domainSettings = self->_domainSettings;
  self->_domainSettings = v13;

  os_unfair_lock_unlock(&self->_lock);
  v15 = HAENotificationsLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_domainSettings;
    *(_DWORD *)buf = 138412290;
    v19 = v16;
    _os_log_impl(&dword_21FABA000, v15, OS_LOG_TYPE_DEFAULT, "HAEN Defaults: %@", buf, 0xCu);
  }
}

- (void)updateUserVolumeForVolumeLimit
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F28C30]);
  uint64_t v4 = *MEMORY[0x263F28C10];
  id v5 = [v3 getPreferenceFor:*MEMORY[0x263F28C10]];
  uint64_t v6 = HAENotificationsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_domainSettings objectForKey:v4];
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_21FABA000, v6, OS_LOG_TYPE_DEFAULT, "VolumeLimit: %@ -> %@", buf, 0x16u);
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_domainSettings objectForKey:v4];
  if (![v8 BOOLValue]) {
    goto LABEL_6;
  }
  char v9 = [v5 BOOLValue];

  if ((v9 & 1) == 0)
  {
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__HAENDefaults_updateUserVolumeForVolumeLimit__block_invoke;
    block[3] = &unk_2645274F0;
    block[4] = self;
    dispatch_async(v8, block);
LABEL_6:
  }
}

uint64_t __46__HAENDefaults_updateUserVolumeForVolumeLimit__block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = 0.5;
  LODWORD(a3) = 0.5;
  return [*(id *)(a1 + 32) setUserVolumeWithValue:a2 mininum:a3];
}

- (void)setUserVolumeWithValue:(float)a3 mininum:(float)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  getpid();
  int v5 = CMSessionManagerPerformVolumeOperationWithSequenceNumber();
  uint64_t v6 = HAENotificationsLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HAENDefaults setUserVolumeWithValue:mininum:](v5, v7);
    }
LABEL_4:

    return;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v11 = -1.0;
    _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, "[VolumeLimit] current Volume  %f", buf, 0xCu);
  }

  if (a4 < -1.0)
  {
    getpid();
    int v8 = CMSessionManagerPerformVolumeOperationWithSequenceNumber();
    char v9 = HAENotificationsLog();
    uint64_t v7 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[HAENDefaults setUserVolumeWithValue:mininum:](v8, v7);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v11 = -1.0;
      _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, "setUserVolumeWithValue success to %f", buf, 0xCu);
    }
    goto LABEL_4;
  }
}

- (double)getLiveMonitoringThreshold
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BF0]];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 100.0;
  }

  return v6;
}

- (BOOL)isHAENFeatureEnabled
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc_init(MEMORY[0x263F28C30]);
  double v5 = [v4 getPreferenceFor:*MEMORY[0x263F28BE8]];

  double v6 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BE0]];
  os_unfair_lock_unlock(p_lock);
  uint64_t v7 = _os_feature_enabled_impl();
  BOOL v8 = +[HAENDefaults HAENSupportedForCurrentDeviceClass];
  BOOL v9 = v8;
  uint64_t v10 = 0;
  if (v7 && v8) {
    uint64_t v10 = [v6 BOOLValue];
  }
  double v11 = HAENotificationsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [NSNumber numberWithBool:v10];
    __int16 v13 = [NSNumber numberWithBool:v7];
    v14 = [NSNumber numberWithBool:v9];
    int v16 = 138413314;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2112;
    v23 = v13;
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_21FABA000, v11, OS_LOG_TYPE_DEFAULT, "hean feature status: [%@] mandatory: %@, enabled: %@, feature flag: %@ device supported: %@", (uint8_t *)&v16, 0x34u);
  }
  return v10;
}

- (BOOL)isHAENFeatureOptedIn
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc_init(MEMORY[0x263F28C30]);
  double v5 = [v4 getPreferenceFor:*MEMORY[0x263F28BE8]];

  double v6 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BE0]];
  os_unfair_lock_unlock(p_lock);
  if ([v5 BOOLValue]) {
    char v7 = 0;
  }
  else {
    char v7 = [v6 BOOLValue];
  }

  return v7;
}

- (BOOL)isEUVolumeLimitOn
{
  return self->_EUVolumeLimitFlag;
}

- (BOOL)isSKVolumeLimitOn
{
  return self->_SKVolumeLimitFlag;
}

- (BOOL)isHAENFeatureMandatory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v3 = objc_alloc_init(MEMORY[0x263F28C30]);
  id v4 = [v3 getPreferenceFor:*MEMORY[0x263F28BE8]];

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = [v4 BOOLValue];

  return (char)p_lock;
}

- (BOOL)isConnectedUnknownWiredDeviceHeadphone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BA0]];
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = [v4 BOOLValue];

  return (char)p_lock;
}

- (double)getLiveMonitorTimeWindowInSeconds
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BF8]];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 30.0;
  }

  return v6;
}

- (BOOL)isReduceLoudSoundEnabled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28C10]];
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = [v4 BOOLValue];

  return (char)p_lock;
}

- (BOOL)isHKWriteEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x263F28C30]);
  id v3 = [v2 getPreferenceFor:*MEMORY[0x263F28BA8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isHAEOtherDevicesEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x263F28C30]);
  id v3 = [v2 getPreferenceFor:*MEMORY[0x263F28BB0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int)getReduceLoudSoundThreshold
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v4 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28C18]];
  os_unfair_lock_unlock(p_lock);
  LODWORD(p_lock) = [v4 intValue];

  return (int)p_lock;
}

- (void)updateRLSSettings
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F28C30]);
  uint64_t v4 = *MEMORY[0x263F28C10];
  double v5 = [v3 getPreferenceFor:*MEMORY[0x263F28C10]];
  uint64_t v6 = *MEMORY[0x263F28C18];
  char v7 = [v3 getPreferenceFor:*MEMORY[0x263F28C18]];
  os_unfair_lock_lock(&self->_lock);
  domainSettings = self->_domainSettings;
  if (v5) {
    [(NSMutableDictionary *)domainSettings setObject:v5 forKey:v4];
  }
  else {
    [(NSMutableDictionary *)domainSettings removeObjectForKey:v4];
  }
  BOOL v9 = self->_domainSettings;
  if (v7) {
    [(NSMutableDictionary *)v9 setObject:v7 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)v9 removeObjectForKey:v6];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v10 = HAENotificationsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21FABA000, v10, OS_LOG_TYPE_DEFAULT, "updated RLS status, enabled: (%@), threshold: (%@)", (uint8_t *)&v11, 0x16u);
  }
}

- (double)volumeReductionDelta
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28C20]];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    [v4 doubleValue];
    if (v5 > 1.0 || v5 < 0.0) {
      double v7 = 0.125;
    }
    else {
      double v7 = v5;
    }
  }
  else
  {
    double v7 = 0.125;
  }

  return v7;
}

- (id)_generateAccessoryKeyWithManufacture:(id)a3 andSerialNumber:(id)a4
{
  double v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)[[v5 alloc] initWithFormat:@"%@_%@", v7, v6];

  return v8;
}

- (int64_t)getAudioAccessoryConnectionInfoWithKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  double v5 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BD0]];
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    int64_t v11 = -1;
    goto LABEL_25;
  }
  id v6 = [v5 objectForKey:v4];
  id v7 = v6;
  if (!v6)
  {
    int64_t v11 = -1;
LABEL_24:

    goto LABEL_25;
  }
  BOOL v8 = [v6 objectForKey:@"value"];
  int v9 = [v8 intValue];

  if (v9 == 1)
  {
    int64_t v11 = 1;
    goto LABEL_24;
  }
  if (v9)
  {
    uint64_t v10 = HAENotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HAENDefaults getAudioAccessoryConnectionInfoWithKey:]();
    }
    int64_t v11 = -1;
    goto LABEL_23;
  }
  uint64_t v10 = MGGetStringAnswer();
  if (![v10 isEqualToString:@"iPad"]
    || (MGGetBoolAnswer() & 1) == 0)
  {
    uint64_t v12 = [v7 objectForKey:@"count"];
    int v13 = [v12 intValue];

    if (v13 <= 2
      && ([v7 objectForKey:@"date"],
          v14 = objc_claimAutoreleasedReturnValue(),
          BOOL v15 = [(HAENDefaults *)self _shouldRepromptSinceDate:v14],
          v14,
          v15))
    {
      int v16 = HAENotificationsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109120;
        int v19 = v13;
        _os_log_impl(&dword_21FABA000, v16, OS_LOG_TYPE_DEFAULT, "re-surfacing prompt for not headphone. query count: %d", (uint8_t *)&v18, 8u);
      }
      int64_t v11 = -1;
    }
    else
    {
      int v16 = HAENotificationsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109120;
        int v19 = v13;
        _os_log_impl(&dword_21FABA000, v16, OS_LOG_TYPE_DEFAULT, "skipped re-surfacing prompt for not headphone. query count: %d", (uint8_t *)&v18, 8u);
      }
      int64_t v11 = 0;
    }

LABEL_23:
    goto LABEL_24;
  }

  int64_t v11 = 0;
LABEL_25:

  return v11;
}

- (int64_t)getAudioAccessoryConnectionInfo
{
  id v15 = 0;
  id v3 = +[HAENAccessoryInfo getAccessoryInfo:&v15];
  id v4 = v15;
  double v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    int64_t v11 = [v3 manufacturer];
    uint64_t v12 = [v3 serialNumber];
    int v13 = [(HAENDefaults *)self _generateAccessoryKeyWithManufacture:v11 andSerialNumber:v12];

    int64_t v10 = [(HAENDefaults *)self getAudioAccessoryConnectionInfoWithKey:v13];
    goto LABEL_14;
  }
  if (v4)
  {
    id v7 = HAENAccessoryInfoErrorDomain;
    BOOL v8 = [v4 domain];
    if ([(__CFString *)v7 isEqualToString:v8])
    {
      uint64_t v9 = [v5 code];

      if (v9 == 1) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    int v13 = HAENotificationsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[HAENDefaults getAudioAccessoryConnectionInfo]();
    }
    int64_t v10 = -2;
LABEL_14:

    goto LABEL_15;
  }
LABEL_8:
  int64_t v10 = -2;
LABEL_15:

  return v10;
}

- (BOOL)isCurrentAudioAccessoryHeadphoneWithKey:(id)a3
{
  id v4 = a3;
  if (+[HAENDefaults isRunningCITests]) {
    [(HAENDefaults *)self forceReadDefaults];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v6 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BD0]];
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    BOOL v11 = 1;
    goto LABEL_12;
  }
  id v7 = [v6 objectForKey:v4];
  BOOL v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v9 = [v7 objectForKey:@"value"];
  unsigned int v10 = [v9 intValue];

  BOOL v11 = v10 != 0;
  if (v10 >= 2)
  {
    uint64_t v12 = HAENotificationsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HAENDefaults getAudioAccessoryConnectionInfoWithKey:]();
    }

LABEL_9:
    BOOL v11 = 1;
  }

LABEL_12:
  return v11;
}

- (BOOL)isCurrentAudioAccessoryHeadphone
{
  id v15 = 0;
  id v3 = +[HAENAccessoryInfo getAccessoryInfo:&v15];
  id v4 = v15;
  double v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    BOOL v11 = [v3 manufacturer];
    uint64_t v12 = [v3 serialNumber];
    int v13 = [(HAENDefaults *)self _generateAccessoryKeyWithManufacture:v11 andSerialNumber:v12];

    BOOL v10 = [(HAENDefaults *)self isCurrentAudioAccessoryHeadphoneWithKey:v13];
    goto LABEL_14;
  }
  if (v4)
  {
    id v7 = HAENAccessoryInfoErrorDomain;
    BOOL v8 = [v4 domain];
    if ([(__CFString *)v7 isEqualToString:v8])
    {
      uint64_t v9 = [v5 code];

      if (v9 == 1) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    int v13 = HAENotificationsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[HAENDefaults getAudioAccessoryConnectionInfo]();
    }
    BOOL v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
LABEL_8:
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)_shouldRepromptSinceDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  BOOL v6 = [v4 now];
  [v6 timeIntervalSinceDate:v5];
  double v8 = v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v10 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BD8]];
  os_unfair_lock_unlock(p_lock);
  if (!v10)
  {
    BOOL v11 = HAENotificationsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = 0;
      _os_log_impl(&dword_21FABA000, v11, OS_LOG_TYPE_DEFAULT, "invalid expiryDays %@", (uint8_t *)&v16, 0xCu);
    }

    BOOL v10 = &unk_26D151FC0;
  }
  [v10 doubleValue];
  double v13 = v12 * 24.0 * 60.0 * 60.0;
  if (v8 >= v13)
  {
    v14 = HAENotificationsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21FABA000, v14, OS_LOG_TYPE_DEFAULT, "re-surface prompt", (uint8_t *)&v16, 2u);
    }
  }
  return v8 >= v13;
}

- (void)setAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 withKey:(id)a4 name:(id)a5
{
  v35[4] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v31 = *MEMORY[0x263F28BD0];
  BOOL v10 = -[NSMutableDictionary objectForKey:](self->_domainSettings, "objectForKey:");
  os_unfair_lock_unlock(&self->_lock);
  v32 = v10;
  if (v10) {
    id v11 = (id)[v10 mutableCopy];
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  double v12 = v11;
  double v13 = [v11 objectForKey:v8];
  v33 = v13;
  if (v13
    && ([v13 objectForKey:@"value"],
        int64_t v14 = a3,
        id v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v16 = (int)[v15 intValue],
        v15,
        a3 = v14,
        v16 == v14))
  {
    int64_t v17 = v14;
    uint64_t v18 = (void *)[v33 mutableCopy];
    int v19 = [v33 objectForKey:@"count"];
    uint64_t v20 = [v19 intValue] + 1;

    v21 = [NSNumber numberWithInt:v20];
    [v18 setObject:v21 forKey:@"count"];

    __int16 v22 = [MEMORY[0x263EFF910] now];
    [v18 setObject:v22 forKey:@"date"];

    int64_t v23 = v17;
    [v18 setObject:v9 forKey:@"name"];
  }
  else
  {
    id v30 = v8;
    __int16 v24 = (void *)MEMORY[0x263EFF9A0];
    v35[0] = &unk_26D151FD8;
    v34[0] = @"count";
    v34[1] = @"date";
    v25 = [MEMORY[0x263EFF910] now];
    v35[1] = v25;
    v34[2] = @"value";
    uint64_t v26 = [NSNumber numberWithInteger:a3];
    v34[3] = @"name";
    v35[2] = v26;
    v35[3] = v9;
    v27 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
    [v24 dictionaryWithDictionary:v27];
    uint64_t v18 = v23 = a3;

    id v8 = v30;
  }
  [v12 setValue:v18 forKey:v8];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_domainSettings setObject:v12 forKey:v31];
  os_unfair_lock_unlock(&self->_lock);
  [(HAENDefaults *)self _updateSetting:v31 value:v12 notify:1];
  uint64_t v28 = *MEMORY[0x263F28BA0];
  v29 = [NSNumber numberWithBool:v23 == 1];
  [(HAENDefaults *)self _updateSetting:v28 value:v29 notify:1];
}

- (void)setAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v14 = 0;
  double v7 = +[HAENAccessoryInfo getAccessoryInfo:&v14];
  id v8 = v14;
  id v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    double v12 = [v7 manufacturer];
    double v13 = [v7 serialNumber];
    id v11 = [(HAENDefaults *)self _generateAccessoryKeyWithManufacture:v12 andSerialNumber:v13];

    [(HAENDefaults *)self setAudioAccessoryIsConnectedToHeadphones:a3 withKey:v11 name:v6];
  }
  else
  {
    id v11 = HAENotificationsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HAENDefaults setAudioAccessoryIsConnectedToHeadphones:withName:]();
    }
  }
}

- (void)updateAudioAccessoryIsConnectedToHeadphones:(int64_t)a3 WithKey:(id)a4
{
  v26[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = *MEMORY[0x263F28BD0];
  double v7 = [(NSMutableDictionary *)self->_domainSettings objectForKey:*MEMORY[0x263F28BD0]];
  os_unfair_lock_unlock(&self->_lock);
  if (v7) {
    id v8 = (id)[v7 mutableCopy];
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v9 = v8;
  BOOL v10 = [v8 objectForKey:v5];
  id v11 = v10;
  if (!v10
    || ([v10 objectForKey:@"value"],
        double v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = v5,
        uint64_t v14 = (int)[v12 intValue],
        v12,
        BOOL v15 = v14 == a3,
        id v5 = v13,
        !v15))
  {
    id v22 = v5;
    uint64_t v16 = HAENotificationsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FABA000, v16, OS_LOG_TYPE_DEFAULT, "reset accessory info...", buf, 2u);
    }

    int64_t v17 = (void *)MEMORY[0x263EFF9A0];
    v26[0] = &unk_26D151FD8;
    v25[0] = @"count";
    v25[1] = @"date";
    uint64_t v18 = [MEMORY[0x263EFF910] now];
    v26[1] = v18;
    v25[2] = @"value";
    int v19 = [NSNumber numberWithInteger:a3];
    v26[2] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    v21 = [v17 dictionaryWithDictionary:v20];

    id v5 = v22;
    [v9 setValue:v21 forKey:v22];
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_domainSettings setObject:v9 forKey:v6];
    os_unfair_lock_unlock(&self->_lock);
    [(HAENDefaults *)self _updateSetting:v6 value:v9 notify:1];
  }
}

- (void)updateAudioAccessoryIsConnectedToHeadphones:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = HAENotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = a3;
    _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "Update AudioAccessory Is Connected To Headphones %d", buf, 8u);
  }

  if ([(HAENDefaults *)self isHAENFeatureEnabled])
  {
    if (MGGetBoolAnswer())
    {
      uint64_t v6 = +[HAENUnknownDeviceManager sharedInstance];
      double v7 = [v6 getDeviceUID];
    }
    else
    {
      id v13 = 0;
      id v8 = +[HAENAccessoryInfo getAccessoryInfo:&v13];
      id v9 = v13;
      uint64_t v6 = v9;
      if (!v8 || v9)
      {
        BOOL v10 = HAENotificationsLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[HAENDefaults setAudioAccessoryIsConnectedToHeadphones:withName:]();
        }
        double v7 = 0;
      }
      else
      {
        BOOL v10 = [v8 manufacturer];
        id v11 = [v8 serialNumber];
        double v7 = [(HAENDefaults *)self _generateAccessoryKeyWithManufacture:v10 andSerialNumber:v11];
      }
    }

    if (v7)
    {
      [(HAENDefaults *)self updateAudioAccessoryIsConnectedToHeadphones:a3 WithKey:v7];
    }
    else
    {
      double v12 = HAENotificationsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[HAENDefaults updateAudioAccessoryIsConnectedToHeadphones:](v12);
      }
    }
  }
  else
  {
    double v7 = HAENotificationsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, "do not update accessory database since HAEN is disabled", buf, 2u);
    }
  }
}

- (void)removeAllAdapters
{
  id v3 = HAENotificationsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21FABA000, v3, OS_LOG_TYPE_DEFAULT, "removing all adapters...", v8, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  domainSettings = self->_domainSettings;
  uint64_t v6 = *MEMORY[0x263F28BD0];
  [(NSMutableDictionary *)domainSettings removeObjectForKey:*MEMORY[0x263F28BD0]];
  os_unfair_lock_unlock(p_lock);
  id v7 = objc_alloc_init(MEMORY[0x263F28C30]);
  [v7 removePreferenceFor:v6 notify:1];
}

- (void)wiredDeviceStatusDidChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F28C30]);
  uint64_t v4 = *MEMORY[0x263F28BA0];
  id v5 = [v3 getPreferenceFor:*MEMORY[0x263F28BA0]];

  os_unfair_lock_lock(&self->_lock);
  domainSettings = self->_domainSettings;
  if (v5)
  {
    [(NSMutableDictionary *)domainSettings setObject:v5 forKey:v4];
    os_unfair_lock_unlock(&self->_lock);
    -[HAENDefaults updateAudioAccessoryIsConnectedToHeadphones:](self, "updateAudioAccessoryIsConnectedToHeadphones:", [v5 BOOLValue]);
    id v7 = +[HAENUnknownDeviceManager sharedInstance];
    uint64_t v8 = [v5 BOOLValue];
    id v9 = v7;
  }
  else
  {
    [(NSMutableDictionary *)domainSettings removeObjectForKey:v4];
    os_unfair_lock_unlock(&self->_lock);
    id v9 = +[HAENUnknownDeviceManager sharedInstance];
    id v7 = v9;
    uint64_t v8 = 0;
  }
  [v9 unknownWiredConnectionDidChange:v8];

  BOOL v10 = HAENotificationsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    double v12 = v5;
    _os_log_impl(&dword_21FABA000, v10, OS_LOG_TYPE_DEFAULT, "wired device is headphone: %@ ", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_updateSetting:(id)a3 value:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263F28C30]);
  BOOL v10 = [v9 setPreferenceFor:v7 value:v8 notify:v5];

  if (v10)
  {
    int v11 = HAENotificationsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HAENDefaults _updateSetting:value:notify:]();
    }
  }
}

- (BOOL)softwareVersionEnabled
{
  return 1;
}

- (void)_registerNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)settingsChanged, v4, 0, (CFNotificationSuspensionBehavior)0);
  uint64_t v6 = HAENotificationsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_21FABA000, v6, OS_LOG_TYPE_DEFAULT, "HAENDefaults registered darwin notification: %@", (uint8_t *)&v7, 0xCu);
  }
}

+ (BOOL)HAENSupportedForCurrentDeviceClass
{
  if (HAENSupportedForCurrentDeviceClass_once != -1) {
    dispatch_once(&HAENSupportedForCurrentDeviceClass_once, &__block_literal_global_50);
  }
  return HAENSupportedForCurrentDeviceClass_ans;
}

void __50__HAENDefaults_HAENSupportedForCurrentDeviceClass__block_invoke()
{
  id v1 = (id)MGGetStringAnswer();
  if (([v1 isEqualToString:@"iPhone"] & 1) != 0
    || ([v1 isEqualToString:@"iPad"] & 1) != 0
    || ([v1 isEqualToString:@"iPod"] & 1) != 0)
  {
    char v0 = 1;
  }
  else
  {
    char v0 = [v1 isEqualToString:@"Watch"];
  }
  HAENSupportedForCurrentDeviceClass_ans = v0;
}

+ (BOOL)isCurrentProcessMediaserverd
{
  if (isCurrentProcessMediaserverd_once != -1) {
    dispatch_once(&isCurrentProcessMediaserverd_once, &__block_literal_global_61);
  }
  return isCurrentProcessMediaserverd_ans;
}

void __44__HAENDefaults_isCurrentProcessMediaserverd__block_invoke()
{
  int v0 = _os_feature_enabled_impl();
  id v1 = @"mediaserverd";
  if (v0) {
    id v1 = @"audiomxd";
  }
  id v2 = (void *)MEMORY[0x263F08AB0];
  id v3 = v1;
  id v6 = [v2 processInfo];
  uint64_t v4 = [v6 processName];
  char v5 = [v4 isEqualToString:v3];

  isCurrentProcessMediaserverd_ans = v5;
}

+ (BOOL)isRunningCITests
{
  if (isRunningCITests_once != -1) {
    dispatch_once(&isRunningCITests_once, &__block_literal_global_72);
  }
  return isRunningCITests_ans;
}

void __32__HAENDefaults_isRunningCITests__block_invoke()
{
  id v1 = [MEMORY[0x263F08AB0] processInfo];
  int v0 = [v1 processName];
  isRunningCITests_ans = [v0 isEqualToString:@"xctest"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainSettings, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)setUserVolumeWithValue:(int)a1 mininum:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FABA000, a2, OS_LOG_TYPE_ERROR, "CMSessionManager failed to set volume with Error %d", (uint8_t *)v2, 8u);
}

- (void)setUserVolumeWithValue:(int)a1 mininum:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FABA000, a2, OS_LOG_TYPE_ERROR, "CMSessionManager failed to get the existing volume with Error %d", (uint8_t *)v2, 8u);
}

- (void)getAudioAccessoryConnectionInfoWithKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "unknown accessory info stored: %ld", v2, v3, v4, v5, v6);
}

- (void)getAudioAccessoryConnectionInfo
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "Unable to obtain accessory info: %@", v2, v3, v4, v5, v6);
}

- (void)setAudioAccessoryIsConnectedToHeadphones:withName:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_21FABA000, v0, v1, "failed to fetch current accesorry info %@, %@");
}

- (void)updateAudioAccessoryIsConnectedToHeadphones:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21FABA000, log, OS_LOG_TYPE_ERROR, "accessory key not available ", v1, 2u);
}

- (void)_updateSetting:value:notify:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_21FABA000, v0, v1, "failed to update known accessory settings for key: %@, value: %@");
}

@end
@interface ADASManager
- (ADASManager)init;
- (BOOL)_featureFlagEnabled;
- (BOOL)_isAlertSupported;
- (BOOL)_isDeviceMandatoryForHAENotification:(BOOL)a3;
- (BOOL)nanoSettingsAvailable;
- (BOOL)shouldSufaceHAENotificationMigrationAlert;
- (id)_error:(int64_t)a3;
- (id)_getCurrentVolumeLimit;
- (id)_getDefaultsFor:(id)a3;
- (id)_getDefaultsKey:(id)a3;
- (id)_getDeviceSpecificDefaultsFor:(id)a3;
- (id)_getSpecialKeys:(id)a3 nano:(BOOL)a4;
- (id)_migrateVolumeLimitThreshold:(BOOL)a3;
- (id)_setChainedKeys:(id)a3 val:(id)a4 nano:(BOOL)a5 modifiedKeys:(id)a6;
- (id)_setDefaultValueIfNeeded:(id)a3 nano:(BOOL)a4 sync:(BOOL)a5;
- (id)_setDefaultsFor:(id)a3 value:(id)a4;
- (id)_setDeviceSpecificDefaultsFor:(id)a3 value:(id)a4;
- (id)getNanoPreferenceFor:(id)a3;
- (id)getNanoPreferencesFor:(id)a3;
- (id)getPreferenceFor:(id)a3;
- (id)getPreferencesFor:(id)a3;
- (id)setNanoPreferenceFor:(id)a3 value:(id)a4;
- (id)setNanoPreferenceFor:(id)a3 value:(id)a4 notify:(BOOL)a5;
- (id)setPreferenceFor:(id)a3 value:(id)a4;
- (id)setPreferenceFor:(id)a3 value:(id)a4 notify:(BOOL)a5;
- (void)_clearCurrentVolumeLimit;
- (void)_donateSignalToTipsKit:(BOOL)a3;
- (void)_getCurrentVolumeLimit;
- (void)_notify:(id)a3;
- (void)_sync;
- (void)_syncDeviceSpecificDomain;
- (void)_syncNanoDeviceSpecificForRead:(id)a3;
- (void)_syncNanoForRead:(id)a3;
- (void)_syncNanoForWrite:(id)a3;
- (void)didSurfaceMigrationAlert;
- (void)migrateKeyEnableHAEHKMeasurement:(BOOL)a3;
- (void)removeNanoPreferenceFor:(id)a3;
- (void)removeNanoPreferenceFor:(id)a3 notify:(BOOL)a4;
- (void)removePreferenceFor:(id)a3;
- (void)removePreferenceFor:(id)a3 notify:(BOOL)a4;
@end

@implementation ADASManager

- (id)_getDefaultsKey:(id)a3
{
  prefStore = self->_prefStore;
  id v4 = a3;
  v5 = [(ADASPreferenceStore *)prefStore keyMap];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)_isDeviceMandatoryForHAENotification:(BOOL)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = (void *)MEMORY[0x263EFFA08];
    v19[0] = @"HAENFeatureMandatoryOverride";
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v6 = [v4 setWithArray:v5];
    [(ADASManager *)self _syncNanoForRead:v6];

    v7 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
    v8 = [v7 objectForKey:@"HAENFeatureMandatoryOverride"];

    if (!v8)
    {
      v9 = (void *)MEMORY[0x263EFFA08];
      v16 = @"HAENFeatureMandatory";
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
      v11 = [v9 setWithArray:v10];
      [(ADASManager *)self _syncNanoDeviceSpecificForRead:v11];

      v12 = [(ADASPreferenceStore *)self->_prefStore coreAudioDeviceDomain];
      v8 = [v12 objectForKey:@"HAENFeatureMandatory"];

      if (!v8) {
        goto LABEL_9;
      }
      goto LABEL_13;
    }
LABEL_6:
    v13 = ADAFLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_21873E000, v13, OS_LOG_TYPE_DEFAULT, "device has HAEN turned on through defaults: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  [(ADASManager *)self _sync];
  v8 = [(ADASManager *)self _getDefaultsFor:@"HAENFeatureMandatoryOverride"];
  if (v8) {
    goto LABEL_6;
  }
  [(ADASManager *)self _syncDeviceSpecificDomain];
  v8 = [(ADASManager *)self _getDeviceSpecificDefaultsFor:@"HAENFeatureMandatory"];
  if (!v8)
  {
LABEL_9:
    v13 = ADAFLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ADASManager _isDeviceMandatoryForHAENotification:]();
    }
    v8 = (void *)MEMORY[0x263EFFA88];
LABEL_12:
  }
LABEL_13:
  char v14 = [v8 BOOLValue];

  return v14;
}

- (void)migrateKeyEnableHAEHKMeasurement:(BOOL)a3
{
  BOOL v3 = a3;
  v20[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    v20[0] = @"EnableHAEHKWrite";
    v20[1] = @"HAENSampleTransient";
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    v7 = [v5 setWithArray:v6];
    [(ADASManager *)self _syncNanoForRead:v7];

    v8 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
    v9 = [v8 objectForKey:@"EnableHAEHKWrite"];

    v10 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
    v11 = [v10 objectForKey:@"HAENSampleTransient"];

    if (!v11)
    {
LABEL_5:
      uint64_t v12 = [NSNumber numberWithBool:0];
      v13 = (void *)v12;
      if (v9)
      {
        v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "BOOLValue") ^ 1);

        if (([v9 BOOLValue] & 1) == 0)
        {
          if (v3)
          {
            char v14 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
            v15 = [NSNumber numberWithBool:1];
            [v14 setObject:v15 forKey:@"HAENSurfaceMigrationAlert"];

LABEL_11:
            id v16 = [(ADASManager *)self setNanoPreferenceFor:@"_ADAFPreferenceKeyHAESampleTransient" value:v11 notify:0];
            goto LABEL_14;
          }
          v17 = [NSNumber numberWithBool:1];
          id v18 = [(ADASManager *)self _setDefaultsFor:@"HAENSurfaceMigrationAlert" value:v17];

LABEL_13:
          id v19 = [(ADASManager *)self _setDefaultsFor:@"HAENSampleTransient" value:v11];
          [(ADASManager *)self _sync];
          goto LABEL_14;
        }
      }
      else
      {
        v11 = (void *)v12;
      }
      if (v3) {
        goto LABEL_11;
      }
      goto LABEL_13;
    }
  }
  else
  {
    v9 = [(ADASManager *)self _getDefaultsFor:@"EnableHAEHKWrite"];
    v11 = [(ADASManager *)self _getDefaultsFor:@"HAENSampleTransient"];
    if (!v11) {
      goto LABEL_5;
    }
  }
LABEL_14:
}

- (id)_getDefaultsFor:(id)a3
{
  BOOL v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.coreaudio");

  return v3;
}

void __33__ADASManager_getPreferencesFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _getSpecialKeys:v3 nano:0];
  if (v4) {
    goto LABEL_2;
  }
  uint64_t v6 = [*(id *)(a1 + 32) _getDefaultsKey:v3];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [*(id *)(a1 + 32) _getDefaultsFor:v6];
    if (v8)
    {
      id v4 = v8;
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) _setDefaultValueIfNeeded:v7 nano:0 sync:0];

      if (!v4) {
        goto LABEL_3;
      }
    }
LABEL_2:
    [*(id *)(a1 + 40) setObject:v4 forKey:v3];
LABEL_3:
    v5 = ADAFLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_21873E000, v5, OS_LOG_TYPE_DEFAULT, "get preferences for: %@ -> %@", (uint8_t *)&v9, 0x16u);
    }

    goto LABEL_6;
  }
  id v4 = ADAFLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __33__ADASManager_getPreferencesFor___block_invoke_cold_1();
  }
LABEL_6:
}

- (id)_getSpecialKeys:(id)a3 nano:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:@"_ADAFPreferenceKeyHAENotificationIsMandatory"])
  {
    if ([(ADASManager *)self _featureFlagEnabled])
    {
      BOOL v7 = [(ADASManager *)self _isDeviceMandatoryForHAENotification:v4];
      if (v7) {
        [(ADASManager *)self migrateKeyEnableHAEHKMeasurement:v4];
      }
      uint64_t v8 = [NSNumber numberWithBool:v7];
      goto LABEL_8;
    }
    int v9 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    if ([v6 isEqualToString:@"_ADAFPreferenceKeyVolumeLimitThreshold"])
    {
      uint64_t v8 = [(ADASManager *)self _migrateVolumeLimitThreshold:v4];
LABEL_8:
      int v9 = (void *)v8;
      goto LABEL_11;
    }
    int v9 = 0;
  }
LABEL_11:

  return v9;
}

- (id)getPreferencesFor:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(ADASManager *)self _sync];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __33__ADASManager_getPreferencesFor___block_invoke;
  uint64_t v13 = &unk_2643373D8;
  char v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  [(ADASManager *)self _sync];
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (void)_sync
{
}

- (void)_syncDeviceSpecificDomain
{
}

- (id)_getDeviceSpecificDefaultsFor:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.coreaudio.device");

  return v3;
}

- (BOOL)_featureFlagEnabled
{
  return _os_feature_enabled_impl();
}

- (ADASManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADASManager;
  v2 = [(ADASManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ADASPreferenceStore sharedInstance];
    prefStore = v2->_prefStore;
    v2->_prefStore = (ADASPreferenceStore *)v3;
  }
  return v2;
}

- (id)getPreferenceFor:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(ADASManager *)self _sync];
  id v5 = [(ADASManager *)self _getSpecialKeys:v4 nano:0];
  if (!v5)
  {
    objc_super v6 = [(ADASManager *)self _getDefaultsKey:v4];
    if (v6)
    {
      id v5 = [(ADASManager *)self _getDefaultsFor:v6];
      if (!v5)
      {
        id v5 = [(ADASManager *)self _setDefaultValueIfNeeded:v6 nano:0 sync:1];
      }
    }
    else
    {
      id v7 = ADAFLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ADASManager getPreferenceFor:]();
      }

      id v5 = 0;
    }
  }
  uint64_t v8 = ADAFLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_21873E000, v8, OS_LOG_TYPE_DEFAULT, "get preference: %@ -> %@", (uint8_t *)&v10, 0x16u);
  }

  return v5;
}

- (id)_setDefaultValueIfNeeded:(id)a3 nano:(BOOL)a4 sync:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = [(ADASPreferenceStore *)self->_prefStore defaultValues];
  int v10 = [v9 objectForKey:v8];

  if (v10)
  {
    int v11 = [v8 isEqualToString:@"EnableHAELiveMonitor"];
    if (v6)
    {
      if (v11)
      {
        __int16 v12 = [(ADASPreferenceStore *)self->_prefStore coreAudioDeviceDomain];
        uint64_t v13 = [v12 objectForKey:@"HAENFeatureMandatory"];

        if (v13 && ([v13 BOOLValue] & 1) == 0)
        {

          int v10 = &unk_26C9D94B0;
        }
      }
      uint64_t v14 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
      [v14 setObject:v10 forKey:v8];

      if (v5)
      {
        id v15 = (void *)MEMORY[0x263EFFA08];
        v27[0] = v8;
        id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
        v17 = [v15 setWithArray:v16];
        [(ADASManager *)self _syncNanoForWrite:v17];
      }
    }
    else
    {
      if (v11)
      {
        id v18 = [(ADASManager *)self _getDeviceSpecificDefaultsFor:@"HAENFeatureMandatory"];
        id v19 = v18;
        if (v18 && ([v18 BOOLValue] & 1) == 0)
        {

          int v10 = &unk_26C9D94B0;
        }
      }
      id v20 = [(ADASManager *)self _setDefaultsFor:v8 value:v10];
      if (v5) {
        [(ADASManager *)self _sync];
      }
    }
    v21 = ADAFLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_21873E000, v21, OS_LOG_TYPE_DEFAULT, "setting default value for key [ %@ ] -> [ %@ ]", (uint8_t *)&v23, 0x16u);
    }
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (id)setPreferenceFor:(id)a3 value:(id)a4
{
  return [(ADASManager *)self setPreferenceFor:a3 value:a4 notify:1];
}

- (id)setPreferenceFor:(id)a3 value:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = ADAFLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_21873E000, v10, OS_LOG_TYPE_DEFAULT, "set preference for %@ to %@", (uint8_t *)&v22, 0x16u);
  }

  int v11 = [(ADASManager *)self _getDefaultsKey:v8];
  if (!v11)
  {
    id v15 = "yek!";
LABEL_11:
    uint64_t v13 = [(ADASManager *)self _error:*(void *)v15];
    goto LABEL_22;
  }
  if (!v9)
  {
    id v16 = ADAFLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ADASManager setPreferenceFor:value:notify:]();
    }

    id v15 = "lav!";
    goto LABEL_11;
  }
  __int16 v12 = [(ADASManager *)self _setDefaultsFor:v11 value:v9];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(ADASManager *)self _setChainedKeys:v8 val:v9 nano:0 modifiedKeys:0];
    if (v14)
    {
      v17 = ADAFLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ADASManager setPreferenceFor:value:notify:]();
      }
    }
    [(ADASManager *)self _sync];
    if (v5)
    {
      id v18 = [(ADASPreferenceStore *)self->_prefStore specialDarwinKeys];
      id v19 = [v18 objectForKey:v8];

      if (v19) {
        id v20 = v19;
      }
      else {
        id v20 = @"AppleHAESettingsChanged";
      }
      [(ADASManager *)self _notify:v20];
    }
  }

LABEL_22:

  return v13;
}

- (id)setNanoPreferenceFor:(id)a3 value:(id)a4
{
  return [(ADASManager *)self setNanoPreferenceFor:a3 value:a4 notify:1];
}

- (id)setNanoPreferenceFor:(id)a3 value:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (![(ADASManager *)self nanoSettingsAvailable])
  {
    v17 = ADAFLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ADASManager setNanoPreferenceFor:value:notify:]();
    }

    id v18 = "nan!";
    goto LABEL_19;
  }
  if (!v9)
  {
    id v19 = ADAFLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ADASManager setPreferenceFor:value:notify:]();
    }

    id v18 = "lav!";
LABEL_19:
    id v16 = [(ADASManager *)self _error:*(void *)v18];
    goto LABEL_22;
  }
  int v10 = [(ADASManager *)self _getDefaultsKey:v8];
  if (v10)
  {
    int v11 = ADAFLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v22 = v10;
      _os_log_impl(&dword_21873E000, v11, OS_LOG_TYPE_DEFAULT, "setting nano preference for key: %@", buf, 0xCu);
    }

    __int16 v12 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
    [v12 setObject:v9 forKey:v10];

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v10, 0);
    id v14 = [(ADASManager *)self _setChainedKeys:v8 val:v9 nano:1 modifiedKeys:v13];
    if (v14)
    {
      id v15 = ADAFLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ADASManager setNanoPreferenceFor:value:notify:]();
      }
    }
    [(ADASManager *)self _syncNanoForWrite:v13];
    if (v5) {
      [(ADASManager *)self _notify:@"NanoHAESettingsChanged"];
    }

    id v16 = 0;
  }
  else
  {
    id v16 = [(ADASManager *)self _error:*(void *)"yek!"];
  }

LABEL_22:

  return v16;
}

- (id)getNanoPreferenceFor:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = ADAFLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_21873E000, v5, OS_LOG_TYPE_DEFAULT, "get nano preference for %@", (uint8_t *)&v16, 0xCu);
  }

  if ([(ADASManager *)self nanoSettingsAvailable])
  {
    BOOL v6 = [(ADASManager *)self _getSpecialKeys:v4 nano:1];
    if (v6) {
      goto LABEL_19;
    }
    uint64_t v7 = [(ADASManager *)self _getDefaultsKey:v4];
    id v8 = (void *)v7;
    if (v7)
    {
      id v9 = (void *)MEMORY[0x263EFFA08];
      v20[0] = v7;
      int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      int v11 = [v9 setWithArray:v10];
      [(ADASManager *)self _syncNanoForRead:v11];

      __int16 v12 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
      BOOL v6 = [v12 objectForKey:v8];

      if (!v6)
      {
        BOOL v6 = [(ADASManager *)self _setDefaultValueIfNeeded:v8 nano:1 sync:1];
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_18:

LABEL_19:
        id v14 = ADAFLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412546;
          id v17 = v4;
          __int16 v18 = 2112;
          id v19 = v6;
          _os_log_impl(&dword_21873E000, v14, OS_LOG_TYPE_DEFAULT, "get nano preference: %@ -> %@", (uint8_t *)&v16, 0x16u);
        }
        goto LABEL_21;
      }
      uint64_t v13 = ADAFLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ADASManager getNanoPreferenceFor:]();
      }
    }
    else
    {
      BOOL v6 = ADAFLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[ADASManager getNanoPreferenceFor:]();
      }
    }

    BOOL v6 = 0;
    goto LABEL_18;
  }
  id v14 = ADAFLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[ADASManager setNanoPreferenceFor:value:notify:]();
  }
  BOOL v6 = 0;
LABEL_21:

  return v6;
}

- (void)removePreferenceFor:(id)a3
{
}

- (void)removePreferenceFor:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = ADAFLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_21873E000, v7, OS_LOG_TYPE_DEFAULT, "remove preference for %@", (uint8_t *)&v14, 0xCu);
  }

  id v8 = [(ADASManager *)self _getDefaultsKey:v6];
  if (!v8)
  {
    __int16 v12 = ADAFLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ADASManager removePreferenceFor:notify:]();
    }
    goto LABEL_11;
  }
  id v9 = [(ADASManager *)self _setDefaultsFor:v8 value:0];
  id v10 = [(ADASManager *)self _setChainedKeys:v6 val:0 nano:0 modifiedKeys:0];
  [(ADASManager *)self _sync];
  if (v4)
  {
    int v11 = [(ADASPreferenceStore *)self->_prefStore specialDarwinKeys];
    __int16 v12 = [v11 objectForKey:v6];

    if (v12) {
      uint64_t v13 = (__CFString *)v12;
    }
    else {
      uint64_t v13 = @"AppleHAESettingsChanged";
    }
    [(ADASManager *)self _notify:v13];
LABEL_11:
  }
}

- (void)removeNanoPreferenceFor:(id)a3
{
}

- (void)removeNanoPreferenceFor:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = ADAFLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_21873E000, v7, OS_LOG_TYPE_DEFAULT, "remove nano preference for %@", buf, 0xCu);
  }

  if ([(ADASManager *)self nanoSettingsAvailable])
  {
    id v8 = [(ADASManager *)self _getDefaultsKey:v6];
    id v9 = ADAFLog();
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl(&dword_21873E000, v10, OS_LOG_TYPE_DEFAULT, "removing nano preference for defaults key %@", buf, 0xCu);
      }

      int v11 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
      [v11 removeObjectForKey:v8];

      id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v8, 0);
      __int16 v12 = [(ADASManager *)self _setChainedKeys:v6 val:0 nano:1 modifiedKeys:v10];
      if (v12)
      {
        uint64_t v13 = ADAFLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[ADASManager removeNanoPreferenceFor:notify:]();
        }
      }
      [(ADASManager *)self _syncNanoForWrite:v10];
      if (v4) {
        [(ADASManager *)self _notify:@"NanoHAESettingsChanged"];
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[ADASManager getPreferenceFor:]();
    }
  }
  else
  {
    id v8 = ADAFLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ADASManager setNanoPreferenceFor:value:notify:]();
    }
  }
}

- (id)getNanoPreferencesFor:(id)a3
{
  id v4 = a3;
  if ([(ADASManager *)self nanoSettingsAvailable])
  {
    BOOL v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
    [(ADASManager *)self _syncNanoForRead:v5];

    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __37__ADASManager_getNanoPreferencesFor___block_invoke;
    int v14 = &unk_2643373D8;
    id v15 = self;
    id v16 = v6;
    uint64_t v7 = v6;
    [v4 enumerateObjectsUsingBlock:&v11];
    id v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v4, v11, v12, v13, v14, v15);
    [(ADASManager *)self _syncNanoForWrite:v8];

    id v9 = [v7 copy];
  }
  else
  {
    uint64_t v7 = ADAFLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ADASManager setNanoPreferenceFor:value:notify:]();
    }
    id v9 = 0;
  }

  return v9;
}

void __37__ADASManager_getNanoPreferencesFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _getSpecialKeys:v3 nano:1];
  if (!v4)
  {
    id v6 = [*(id *)(a1 + 32) _getDefaultsKey:v3];
    if (!v6)
    {
      id v8 = ADAFLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __37__ADASManager_getNanoPreferencesFor___block_invoke_cold_1();
      }
      BOOL v5 = 0;
      goto LABEL_15;
    }
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) coreAudioDomain];
    BOOL v5 = [v7 objectForKey:v6];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = ADAFLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __37__ADASManager_getNanoPreferencesFor___block_invoke_cold_2();
        }
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      BOOL v5 = [*(id *)(a1 + 32) _setDefaultValueIfNeeded:v6 nano:1 sync:0];
      if (!v5) {
        goto LABEL_13;
      }
    }
    [*(id *)(a1 + 40) setObject:v5 forKey:v3];
LABEL_13:
    id v8 = ADAFLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_21873E000, v8, OS_LOG_TYPE_DEFAULT, "get preferences for: %@ -> %@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_15;
  }
  BOOL v5 = (void *)v4;
  [*(id *)(a1 + 40) setObject:v4 forKey:v3];
LABEL_16:
}

- (id)_setDefaultsFor:(id)a3 value:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = (__CFString *)a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = ADAFLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = [(__CFString *)v5 UTF8String];
      _os_log_impl(&dword_21873E000, v7, OS_LOG_TYPE_DEFAULT, "removing key: %s", (uint8_t *)&v9, 0xCu);
    }
  }
  CFPreferencesSetAppValue(v5, v6, @"com.apple.coreaudio");

  return 0;
}

- (id)_setDeviceSpecificDefaultsFor:(id)a3 value:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = (__CFString *)a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = ADAFLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_21873E000, v7, OS_LOG_TYPE_DEFAULT, "removing key: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  CFPreferencesSetAppValue(v5, v6, @"com.apple.coreaudio.device");

  return 0;
}

- (void)_notify:(id)a3
{
  name = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
}

- (void)_syncNanoForRead:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  [v5 synchronizeNanoDomain:@"com.apple.coreaudio" keys:v4];

  id v7 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
  id v6 = (id)[v7 synchronize];
}

- (void)_syncNanoDeviceSpecificForRead:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  [v5 synchronizeNanoDomain:@"com.apple.coreaudio.device" keys:v4];

  id v7 = [(ADASPreferenceStore *)self->_prefStore coreAudioDeviceDomain];
  id v6 = (id)[v7 synchronize];
}

- (void)_syncNanoForWrite:(id)a3
{
  prefStore = self->_prefStore;
  id v4 = a3;
  BOOL v5 = [(ADASPreferenceStore *)prefStore coreAudioDomain];
  id v6 = (id)[v5 synchronize];

  id v7 = (id)objc_opt_new();
  [v7 synchronizeNanoDomain:@"com.apple.coreaudio" keys:v4];
}

- (id)_setChainedKeys:(id)a3 val:(id)a4 nano:(BOOL)a5 modifiedKeys:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = [v10 isEqualToString:@"_ADAFPreferenceKeyHAEEnableHKWrite"];
  if (v11 && v13 && ([v11 BOOLValue] & 1) == 0)
  {
    id v16 = ADAFLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v18 = 0;
      _os_log_impl(&dword_21873E000, v16, OS_LOG_TYPE_DEFAULT, "HAE being turned off -> turning off notification feature as well.", v18, 2u);
    }

    if (v7)
    {
      id v17 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
      [v17 setObject:v11 forKey:@"EnableHAELiveMonitor"];

      int v14 = 0;
      if (!v12) {
        goto LABEL_8;
      }
    }
    else
    {
      int v14 = [(ADASManager *)self _setDefaultsFor:@"EnableHAELiveMonitor" value:v11];
      if (!v12) {
        goto LABEL_8;
      }
    }
    [v12 addObject:@"EnableHAELiveMonitor"];
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"_ADAFPreferenceKeyHAENotificationFeatureEnabled"]
    && ![(ADASManager *)self _isDeviceMandatoryForHAENotification:v7])
  {
    -[ADASManager _donateSignalToTipsKit:](self, "_donateSignalToTipsKit:", [v11 BOOLValue]);
  }
  int v14 = 0;
LABEL_8:

  return v14;
}

- (id)_migrateVolumeLimitThreshold:(BOOL)a3
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  if (a3)
  {
    BOOL v5 = [(ADASPreferenceStore *)self->_prefStore coreAudioDomain];
    id v18 = [v5 objectForKey:@"VolumeLimitThreshold"];
  }
  else
  {
    id v18 = [(ADASManager *)self _getDefaultsFor:@"VolumeLimitThreshold"];
  }
  id v6 = (void *)v14[5];
  if (!v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    id v8 = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__ADASManager__migrateVolumeLimitThreshold___block_invoke;
    block[3] = &unk_264337400;
    BOOL v12 = a3;
    block[4] = self;
    block[5] = &v13;
    dispatch_after(v7, v8, block);

    id v6 = (void *)v14[5];
  }
  id v9 = v6;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __44__ADASManager__migrateVolumeLimitThreshold___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _getCurrentVolumeLimit];
  id v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    int v22 = v2;
    _os_log_impl(&dword_21873E000, v3, OS_LOG_TYPE_DEFAULT, "VLT currentLimit = %@", (uint8_t *)&v21, 0xCu);
  }

  if (v2 && ([v2 floatValue], v4 > 0.0))
  {
    [v2 floatValue];
    float v6 = v5;
    if (v5 >= 0.5)
    {
      if (v5 >= 0.6)
      {
        if (v5 >= 0.7)
        {
          if (v5 >= 0.8)
          {
            if (v5 >= 0.9)
            {
              if (v5 >= 1.0) {
                goto LABEL_25;
              }
              int v7 = 1120403456;
            }
            else
            {
              int v7 = 1119748096;
            }
          }
          else
          {
            int v7 = 1119092736;
          }
        }
        else
        {
          int v7 = 1118437376;
        }
      }
      else
      {
        int v7 = 1117782016;
      }
    }
    else
    {
      int v7 = 1117126656;
    }
    float v9 = *(float *)&v7;
    id v10 = ADAFLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(unsigned __int8 *)(a1 + 48);
      int v21 = 138413058;
      int v22 = v2;
      __int16 v23 = 2048;
      double v24 = v6;
      __int16 v25 = 2048;
      double v26 = v9;
      __int16 v27 = 1024;
      int v28 = v11;
      _os_log_impl(&dword_21873E000, v10, OS_LOG_TYPE_DEFAULT, "migrating %@ (%f) to %f\n nano? %d", (uint8_t *)&v21, 0x26u);
    }

    [*(id *)(a1 + 32) _clearCurrentVolumeLimit];
    *(float *)&double v12 = v9;
    uint64_t v13 = [NSNumber numberWithFloat:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (*(unsigned char *)(a1 + 48)) {
      id v18 = (id)[v16 setNanoPreferenceFor:@"_ADAFPreferenceKeyVolumeLimitThreshold" value:v17 notify:1];
    }
    else {
      id v19 = (id)[v16 setPreferenceFor:@"_ADAFPreferenceKeyVolumeLimitThreshold" value:v17 notify:1];
    }
  }
  else
  {
    id v8 = ADAFLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__ADASManager__migrateVolumeLimitThreshold___block_invoke_cold_1();
    }
  }
LABEL_25:
  id v20 = ADAFLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_21873E000, v20, OS_LOG_TYPE_DEFAULT, "VLT migration done...", (uint8_t *)&v21, 2u);
  }
}

- (id)_getCurrentVolumeLimit
{
  LODWORD(v2) = -1.0;
  id v3 = [NSNumber numberWithFloat:v2];
  id v19 = v3;
  if (+[ADAFUtil isProcessMediaserverd])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F544E8]);
    uint64_t v5 = [v4 copyAttributeForKey:*MEMORY[0x263F546B0] withValueOut:&v19];
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = ADAFLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(ADASManager *)v6 _getCurrentVolumeLimit];
      }

      LODWORD(v14) = -1.0;
      uint64_t v15 = [NSNumber numberWithFloat:v14];
      id v16 = v19;
      id v19 = v15;
    }
    id v3 = v19;
  }
  id v17 = v3;

  return v17;
}

- (void)_clearCurrentVolumeLimit
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "error clearing current volume limit %@", v2, v3, v4, v5, v6);
}

- (BOOL)shouldSufaceHAENotificationMigrationAlert
{
  if (![(ADASManager *)self _isAlertSupported]) {
    return 0;
  }
  [(ADASManager *)self _sync];
  uint64_t v3 = [(ADASManager *)self _getDefaultsFor:@"HAENMigrationAlertSurfaced"];
  if ([v3 BOOLValue])
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v5 = [(ADASManager *)self _getDefaultsFor:@"HAENSurfaceMigrationAlert"];
    char v4 = [v5 BOOLValue];
  }
  return v4;
}

- (void)didSurfaceMigrationAlert
{
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_21873E000, v3, OS_LOG_TYPE_DEFAULT, "didSurfaceMigrationAlert...", v7, 2u);
  }

  if (+[ADAFUtil isProcessMediaserverd])
  {
    char v4 = [NSNumber numberWithBool:1];
    id v5 = [(ADASManager *)self _setDefaultsFor:@"HAENMigrationAlertSurfaced" value:v4];

    id v6 = [(ADASManager *)self _setDefaultsFor:@"HAENSurfaceMigrationAlert" value:0];
    [(ADASManager *)self _sync];
  }
}

- (id)_error:(int64_t)a3
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"ADAFErrorDomain" code:a3 userInfo:0];
}

- (BOOL)_isAlertSupported
{
  v9[4] = *MEMORY[0x263EF8340];
  if (!+[ADAFUtil isProcessMediaserverd]) {
    return 0;
  }
  [(ADASManager *)self _sync];
  uint64_t v3 = [(ADASManager *)self _getDefaultsFor:@"DisableHAENMigrationAlert"];
  char v4 = v3;
  if (v3 && ([v3 BOOLValue] & 1) != 0)
  {
    char v5 = 0;
  }
  else
  {
    id v6 = (void *)MGGetStringAnswer();
    v9[0] = @"iPhone";
    v9[1] = @"iPad";
    v9[2] = @"iPod";
    v9[3] = @"Watch";
    int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];
    char v5 = [v7 containsObject:v6];
  }
  return v5;
}

- (BOOL)nanoSettingsAvailable
{
  uint64_t v2 = self;
  [(ADASPreferenceStore *)self->_prefStore initNPSDomain];
  uint64_t v3 = [(ADASPreferenceStore *)v2->_prefStore coreAudioDomain];
  LOBYTE(v2) = v3 != 0;

  return (char)v2;
}

- (void)_donateSignalToTipsKit:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263F2A9C0] discoverabilitySignal];
  char v4 = [v8 source];
  id v5 = objc_alloc(MEMORY[0x263F2A788]);
  if (v3) {
    id v6 = @"true";
  }
  else {
    id v6 = @"false";
  }
  int v7 = (void *)[v5 initWithIdentifier:@"com.apple.Health.Hearing.HAENOptIn" bundleID:@"com.apple.Health" context:v6];
  [v4 sendEvent:v7];
}

- (void)setPreferenceFor:value:notify:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "value cannot be null for key %@", v2, v3, v4, v5, v6);
}

- (void)setPreferenceFor:value:notify:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21873E000, v0, v1, "failed to handle special key for %@ value: %@");
}

- (void)setNanoPreferenceFor:value:notify:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21873E000, v0, v1, "failed to handle nano special key for %@ value: %@");
}

- (void)setNanoPreferenceFor:value:notify:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21873E000, v0, v1, "nano settings not available", v2, v3, v4, v5, v6);
}

- (void)getPreferenceFor:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "defaults key %@ unknown to ADASManager.", v2, v3, v4, v5, v6);
}

- (void)getNanoPreferenceFor:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "defaults nano key %@ unknown to ADASManager.", v2, v3, v4, v5, v6);
}

- (void)getNanoPreferenceFor:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "result type must be a NSNumber for key:%@", v2, v3, v4, v5, v6);
}

- (void)removePreferenceFor:notify:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "unknown defaults key %@", v2, v3, v4, v5, v6);
}

- (void)removeNanoPreferenceFor:notify:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "failed to remove nano chained key for %@", v2, v3, v4, v5, v6);
}

void __33__ADASManager_getPreferencesFor___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "key %@ unknown to ADASManager.", v2, v3, v4, v5, v6);
}

void __37__ADASManager_getNanoPreferencesFor___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "nano key %@ unknown to ADASManager", v2, v3, v4, v5, v6);
}

void __37__ADASManager_getNanoPreferencesFor___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "result type must be a NSNumber for key: %@", v2, v3, v4, v5, v6);
}

void __44__ADASManager__migrateVolumeLimitThreshold___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21873E000, v0, v1, "failed to fetch current volume limit", v2, v3, v4, v5, v6);
}

- (void)_getCurrentVolumeLimit
{
}

- (void)_isDeviceMandatoryForHAENotification:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21873E000, v0, v1, "feature mandatory flag is not set, default to mandatory", v2, v3, v4, v5, v6);
}

@end
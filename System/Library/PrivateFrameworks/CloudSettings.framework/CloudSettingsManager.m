@interface CloudSettingsManager
+ (id)sharedCloudSettingsManager;
- (BOOL)isEnabledForStore:(id)a3;
- (BOOL)isServiceKnownForStore:(id)a3;
- (id)activeXPCConnectionForStore:(id)a3;
- (id)currentConflictDictionary;
- (id)currentStateDictionary;
- (id)defaultSettingsDictionary;
- (id)deviceSettingsForStore:(id)a3;
- (id)knownServiceNames;
- (int64_t)conflictStateForStore:(id)a3;
- (void)applyCloudSettingsToDevice:(id)a3 forStore:(id)a4;
- (void)applySettingsToDevice:(id)a3 forStore:(id)a4;
- (void)performFirstTimeSetup:(id)a3;
- (void)setConflict:(int64_t)a3 forStore:(id)a4;
- (void)setEnabled:(BOOL)a3 forStore:(id)a4;
- (void)writeConflictsDictionaryToPrefs:(id)a3;
- (void)writeSettingsDictionaryToPrefs:(id)a3;
- (void)writeToCloudSettings:(id)a3 forStore:(id)a4;
@end

@implementation CloudSettingsManager

+ (id)sharedCloudSettingsManager
{
  if (sharedCloudSettingsManager_onceToken != -1) {
    dispatch_once(&sharedCloudSettingsManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedCloudSettingsManager_sharedCloudSettingsManager;

  return v2;
}

uint64_t __50__CloudSettingsManager_sharedCloudSettingsManager__block_invoke()
{
  sharedCloudSettingsManager_sharedCloudSettingsManager = objc_alloc_init(CloudSettingsManager);

  return MEMORY[0x270F9A758]();
}

- (void)setEnabled:(BOOL)a3 forStore:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = _os_feature_enabled_impl();
  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v8) {
      goto LABEL_19;
    }
    LOWORD(v16) = 0;
    v13 = &_os_log_internal;
    v14 = "[setEnabled: forStore] - cloudsettings feature disabled";
    uint32_t v15 = 2;
LABEL_15:
    _os_log_impl(&dword_2188A2000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, v15);
    goto LABEL_19;
  }
  if (v8)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[setEnabled:forstore] - cloudsettings feature enabled, enter, calling isServiceKnown", (uint8_t *)&v16, 2u);
  }
  BOOL v9 = [(CloudSettingsManager *)self isServiceKnownForStore:v6];
  BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v10) {
      goto LABEL_19;
    }
    int v16 = 138412290;
    *(void *)v17 = v6;
    v13 = &_os_log_internal;
    v14 = "ERROR | setEnabled - unknown service: %@";
    uint32_t v15 = 12;
    goto LABEL_15;
  }
  if (v10)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[setEnabled:forstore] - is a known service, getting current state dict, and checking if setting is on/off", (uint8_t *)&v16, 2u);
  }
  v11 = [(CloudSettingsManager *)self currentStateDictionary];
  if ([(CloudSettingsManager *)self isEnabledForStore:v6] == v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109378;
      *(_DWORD *)v17 = v4;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v6;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "setEnabled is already set to %d for: %@", (uint8_t *)&v16, 0x12u);
    }
  }
  else
  {
    v12 = [NSNumber numberWithBool:v4];
    [v11 setObject:v12 forKey:v6];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109634;
      *(_DWORD *)v17 = v4;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v6;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "in setEnabled: %d, for identifier: %@, new dictionary: %@", (uint8_t *)&v16, 0x1Cu);
    }
    [(CloudSettingsManager *)self writeSettingsDictionaryToPrefs:v11];
  }

LABEL_19:
}

- (BOOL)isEnabledForStore:(id)a3
{
  *(void *)&v13[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "isEnabledForStore enter", (uint8_t *)&v12, 2u);
  }
  int v5 = _os_feature_enabled_impl();
  BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "isEnabledForStore os_feature_enabled = YES", (uint8_t *)&v12, 2u);
    }
    if ([(CloudSettingsManager *)self isServiceKnownForStore:v4])
    {
      int v7 = [(CloudSettingsManager *)self currentStateDictionary];
      BOOL v8 = [v7 objectForKey:v4];
      if (v8)
      {
        BOOL v9 = v8;
        int v10 = [v8 BOOLValue];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412290;
          *(void *)v13 = v4;
          _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "State dictionary did not locate a state for: %@, returning YES by default", (uint8_t *)&v12, 0xCu);
        }

        int v10 = 1;
      }
    }
    else
    {
      int v10 = 0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        *(void *)v13 = v4;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | isEnabledForStore - unknown store:  %@", (uint8_t *)&v12, 0xCu);
        int v10 = 0;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109378;
      v13[0] = v10;
      LOWORD(v13[1]) = 2112;
      *(void *)((char *)&v13[1] + 2) = v4;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "isEnabledForStore returning: %d, for identifier: %@", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[isEnabledForStore] - cloudsettings feature disabled, returning: NO", (uint8_t *)&v12, 2u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setConflict:(int64_t)a3 forStore:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (_os_feature_enabled_impl())
  {
    if ([(CloudSettingsManager *)self isServiceKnownForStore:v6])
    {
      if ((unint64_t)a3 < 5)
      {
        int v10 = [(CloudSettingsManager *)self currentConflictDictionary];
        v11 = [NSNumber numberWithInteger:a3];
        [v10 setObject:v11 forKey:v6];

        [(CloudSettingsManager *)self writeConflictsDictionaryToPrefs:v10];
        goto LABEL_12;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        id v13 = v6;
        __int16 v14 = 2048;
        int64_t v15 = a3;
        int v7 = &_os_log_internal;
        BOOL v8 = "ERROR | setConflict: %@ - out of range: %ld, exit without setting";
        uint32_t v9 = 22;
LABEL_10:
        _os_log_impl(&dword_2188A2000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v9);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      int v7 = &_os_log_internal;
      BOOL v8 = "ERROR | setConflict - unknown store:  %@";
      uint32_t v9 = 12;
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    int v7 = &_os_log_internal;
    BOOL v8 = "[conflictStateForStore] - cloudsettings feature disabled, returning: not evaluated";
    uint32_t v9 = 2;
    goto LABEL_10;
  }
LABEL_12:
}

- (int64_t)conflictStateForStore:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    if ([(CloudSettingsManager *)self isServiceKnownForStore:v4])
    {
      int v5 = [(CloudSettingsManager *)self currentConflictDictionary];
      id v6 = [v5 objectForKey:v4];
      if (objc_opt_respondsToSelector())
      {
        unsigned int v7 = [v6 intValue];
        int64_t v8 = (int)v7;
        if (v7 < 5)
        {
LABEL_17:

          goto LABEL_18;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412546;
          id v16 = v4;
          __int16 v17 = 2048;
          int64_t v18 = v8;
          uint32_t v9 = &_os_log_internal;
          int v10 = "ERROR | conflictStateForStore: %@ - out of range: %ld, returning 0";
LABEL_15:
          _os_log_impl(&dword_2188A2000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, 0x16u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        int64_t v18 = (int64_t)v6;
        uint32_t v9 = &_os_log_internal;
        int v10 = "ERROR | conflictStateForStore: %@ - value: %@ does not respond to intValue";
        goto LABEL_15;
      }
      int64_t v8 = 0;
      goto LABEL_17;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      v11 = &_os_log_internal;
      int v12 = "ERROR | conflictStateForStore - unknown store:  %@";
      uint32_t v13 = 12;
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    v11 = &_os_log_internal;
    int v12 = "[conflictStateForStore] - cloudsettings feature disabled, returning: not evaluated";
    uint32_t v13 = 2;
LABEL_11:
    _os_log_impl(&dword_2188A2000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v13);
  }
  int64_t v8 = 0;
LABEL_18:

  return v8;
}

- (BOOL)isServiceKnownForStore:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    int v5 = [(CloudSettingsManager *)self knownServiceNames];
    id v6 = [v5 objectForKey:v4];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[isServiceKnownForStore] - cloudsettings feature disabled, returning: NO", (uint8_t *)&v9, 2u);
      BOOL v7 = 0;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 1024;
    BOOL v12 = v7;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[isServiceKnownForStore] - %@ - returning: %d", (uint8_t *)&v9, 0x12u);
  }

  return v7;
}

- (void)performFirstTimeSetup:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v21 = v4;
    int v5 = [v4 objectForKey:@"newDevice"];
    unsigned int v22 = [v5 BOOLValue];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v22;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - isNewDevice: %d, dispatching to all enabled services", buf, 8u);
    }
    [(CloudSettingsManager *)self knownServiceNames];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int64_t v8 = &_os_log_internal;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v11;
            _os_log_impl(&dword_2188A2000, v8, OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - Checking service: %@", buf, 0xCu);
          }
          BOOL v12 = [(CloudSettingsManager *)self isEnabledForStore:v11];
          BOOL v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (v13)
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v29 = v11;
              _os_log_impl(&dword_2188A2000, v8, OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - setting: %@ first time setup being called", buf, 0xCu);
            }
            __int16 v14 = [(CloudSettingsManager *)self activeXPCConnectionForStore:v11];
            int v15 = v14;
            if (v14)
            {
              id v16 = [v14 remoteObjectProxy];
              if (!v16 && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2188A2000, v8, OS_LOG_TYPE_DEFAULT, "ERROR | remoteObjectProxy returned nil", buf, 2u);
              }
              char v17 = objc_opt_respondsToSelector();
              BOOL v18 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
              if (v17)
              {
                if (v18)
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v29 = v11;
                  uint64_t v19 = v8;
                  uint64_t v20 = "%@ responds to selector";
                  goto LABEL_27;
                }
              }
              else if (v18)
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v29 = v11;
                uint64_t v19 = v8;
                uint64_t v20 = "%@ DOES NOT respond to selector";
LABEL_27:
                _os_log_impl(&dword_2188A2000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
              }
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v29 = v11;
                __int16 v30 = 1024;
                unsigned int v31 = v22;
                _os_log_impl(&dword_2188A2000, v8, OS_LOG_TYPE_DEFAULT, "In framework - [performFirstTimeSetup] have a service, calling performFirstTimeSetupForStore for: %@, with isNewDevice: %d", buf, 0x12u);
              }
              [v16 performFirstTimeSetupForStore:v11 newDevice:v22];
              [v15 invalidate];
            }
            else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v29 = v11;
              _os_log_impl(&dword_2188A2000, v8, OS_LOG_TYPE_DEFAULT, "ERROR | performFirstTimeSetup unable to get connection for: %@", buf, 0xCu);
            }

            continue;
          }
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v11;
            _os_log_impl(&dword_2188A2000, v8, OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - setting: %@ is disabled skip first time setup", buf, 0xCu);
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v7);
    }

    id v4 = v21;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[performFirstTimeSetup] - cloudsettings feature disabled", buf, 2u);
  }
}

- (void)applyCloudSettingsToDevice:(id)a3 forStore:(id)a4
{
  *(void *)&v20[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    LOWORD(v17) = 0;
    __int16 v14 = &_os_log_internal;
    int v15 = "[applyCloudSettingsToDevice:forStore] - cloudsettings feature disabled";
    uint32_t v16 = 2;
LABEL_14:
    _os_log_impl(&dword_2188A2000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, v16);
    goto LABEL_18;
  }
  int v8 = ![(CloudSettingsManager *)self isServiceKnownForStore:v7];
  int v9 = ![(CloudSettingsManager *)self isEnabledForStore:v7];
  BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v8 & 1) != 0 || (v9)
  {
    if (!v10) {
      goto LABEL_18;
    }
    int v17 = 138412802;
    id v18 = v7;
    __int16 v19 = 1024;
    *(_DWORD *)uint64_t v20 = v8;
    v20[2] = 1024;
    *(_DWORD *)&v20[3] = v9;
    __int16 v14 = &_os_log_internal;
    int v15 = "ERROR | applyCloudSettingsToDevice for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v16 = 24;
    goto LABEL_14;
  }
  if (v10)
  {
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    *(void *)uint64_t v20 = v7;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "In framework - applyCloudSettingsToDevice array: %@, for store: %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v11 = [(CloudSettingsManager *)self activeXPCConnectionForStore:v7];
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "In framework - have a service, calling applyCloudSettingsToDevice", (uint8_t *)&v17, 2u);
    }
    BOOL v13 = [v11 remoteObjectProxy];
    [v13 applyCloudSettingsToDevice:0 forStore:v7];

    [v11 invalidate];
  }
  else if (v12)
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | writeToCloudSettings unable to get connection for: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_18:
}

- (void)writeToCloudSettings:(id)a3 forStore:(id)a4
{
  *(void *)&v20[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    LOWORD(v17) = 0;
    __int16 v14 = &_os_log_internal;
    int v15 = "[writeToCloudSettings:forStore] - cloudsettings feature disabled";
    uint32_t v16 = 2;
LABEL_14:
    _os_log_impl(&dword_2188A2000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, v16);
    goto LABEL_18;
  }
  int v8 = ![(CloudSettingsManager *)self isServiceKnownForStore:v7];
  int v9 = ![(CloudSettingsManager *)self isEnabledForStore:v7];
  BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v8 & 1) != 0 || (v9)
  {
    if (!v10) {
      goto LABEL_18;
    }
    int v17 = 138412802;
    id v18 = v7;
    __int16 v19 = 1024;
    *(_DWORD *)uint64_t v20 = v8;
    v20[2] = 1024;
    *(_DWORD *)&v20[3] = v9;
    __int16 v14 = &_os_log_internal;
    int v15 = "ERROR | writeToCloudSettings for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v16 = 24;
    goto LABEL_14;
  }
  if (v10)
  {
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    *(void *)uint64_t v20 = v7;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "In framework - writeToCloudSettings array: %@, for store: %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v11 = [(CloudSettingsManager *)self activeXPCConnectionForStore:v7];
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "In framework - have a service, calling writeToCloudSettings", (uint8_t *)&v17, 2u);
    }
    BOOL v13 = [v11 remoteObjectProxy];
    [v13 writeToCloudSettings:v6 forStore:v7];

    [v11 invalidate];
  }
  else if (v12)
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | writeToCloudSettings unable to get connection for: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_18:
}

- (id)deviceSettingsForStore:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      __int16 v14 = &_os_log_internal;
      int v15 = "[deviceSettingsForStore] - cloudsettings feature disabled, returning nil";
      uint32_t v16 = 2;
LABEL_16:
      _os_log_impl(&dword_2188A2000, v14, OS_LOG_TYPE_DEFAULT, v15, v21, v16);
    }
LABEL_17:
    BOOL v13 = 0;
    goto LABEL_29;
  }
  int v5 = ![(CloudSettingsManager *)self isServiceKnownForStore:v4];
  int v6 = ![(CloudSettingsManager *)self isEnabledForStore:v4];
  BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v5 & 1) != 0 || (v6)
  {
    if (v7)
    {
      *(_DWORD *)id v21 = 138412802;
      *(void *)&v21[4] = v4;
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = v5;
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v14 = &_os_log_internal;
      int v15 = "ERROR | deviceSettingsForStore for store: %@, unknown store: %d, or store is disabled: %d";
      uint32_t v16 = 24;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v7)
  {
    *(_DWORD *)id v21 = 138412290;
    *(void *)&v21[4] = v4;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "In framework - deviceSettingsForStore: %@", v21, 0xCu);
  }
  int v8 = [(CloudSettingsManager *)self activeXPCConnectionForStore:v4];
  int v9 = v8;
  if (!v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v21 = 138412290;
      *(void *)&v21[4] = v4;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | writeToCloudSettings unable to get connection for: %@", v21, 0xCu);
    }
    BOOL v13 = 0;
    goto LABEL_28;
  }
  BOOL v10 = [v8 remoteObjectProxy];
  if (v10)
  {
    char v11 = objc_opt_respondsToSelector();
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        *(_WORD *)id v21 = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "In framework - service responds to deviceSettings", v21, 2u);
      }
      BOOL v13 = [v10 deviceSettings];
      goto LABEL_27;
    }
    if (v12)
    {
      *(_WORD *)id v21 = 0;
      int v17 = &_os_log_internal;
      id v18 = "Service does not support deviceSettings, return nil";
      uint32_t v19 = 2;
      goto LABEL_25;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v21 = 138412290;
    *(void *)&v21[4] = v4;
    int v17 = &_os_log_internal;
    id v18 = "ERROR | deviceSettingsForStore unable to get connection for: %@";
    uint32_t v19 = 12;
LABEL_25:
    _os_log_impl(&dword_2188A2000, v17, OS_LOG_TYPE_DEFAULT, v18, v21, v19);
  }
  BOOL v13 = 0;
LABEL_27:
  objc_msgSend(v9, "invalidate", *(_OWORD *)v21);

LABEL_28:
LABEL_29:

  return v13;
}

- (void)applySettingsToDevice:(id)a3 forStore:(id)a4
{
  *(void *)&v20[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    LOWORD(v17) = 0;
    __int16 v14 = &_os_log_internal;
    int v15 = "[applySettingsToDevice:forStore] - cloudsettings feature disabled";
    uint32_t v16 = 2;
LABEL_16:
    _os_log_impl(&dword_2188A2000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, v16);
    goto LABEL_23;
  }
  int v8 = ![(CloudSettingsManager *)self isServiceKnownForStore:v7];
  int v9 = ![(CloudSettingsManager *)self isEnabledForStore:v7];
  BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v8 & 1) != 0 || (v9)
  {
    if (!v10) {
      goto LABEL_23;
    }
    int v17 = 138412802;
    id v18 = v7;
    __int16 v19 = 1024;
    *(_DWORD *)uint64_t v20 = v8;
    v20[2] = 1024;
    *(_DWORD *)&v20[3] = v9;
    __int16 v14 = &_os_log_internal;
    int v15 = "ERROR | applySettingsToDevice for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v16 = 24;
    goto LABEL_16;
  }
  if (v10)
  {
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    *(void *)uint64_t v20 = v7;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "In framework - applySettingsToDevice settings: %@, for store: %@", (uint8_t *)&v17, 0x16u);
  }
  char v11 = [(CloudSettingsManager *)self activeXPCConnectionForStore:v7];
  BOOL v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 remoteObjectProxy];
    if (v13)
    {
      if (objc_opt_respondsToSelector())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "In framework - have a service, calling writeToCloudSettings", (uint8_t *)&v17, 2u);
        }
        [v13 applySettingsToDevice:v6];
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Service does not support applySettingsToDevice - exit", (uint8_t *)&v17, 2u);
    }
    [v12 invalidate];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | writeToCloudSettings unable to get connection for: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_23:
}

- (id)knownServiceNames
{
  if (_os_feature_enabled_impl()) {
    return &unk_26CA05A18;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[knownServiceNames] - cloudsettings feature disabled", v3, 2u);
  }
  return 0;
}

- (id)defaultSettingsDictionary
{
  v7[16] = *MEMORY[0x263EF8340];
  v2 = [NSNumber numberWithBool:1];
  v6[0] = @"com.apple.cloudsettings.general";
  v6[1] = @"com.apple.cloudsettings.appearance";
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = @"com.apple.cloudsettings.sound";
  v6[3] = @"com.apple.cloudsettings.keyboard";
  v7[2] = v2;
  v7[3] = v2;
  v6[4] = @"com.apple.cloudsettings.mouse";
  v6[5] = @"com.apple.cloudsettings.trackpad";
  v7[4] = v2;
  v7[5] = v2;
  v6[6] = @"com.apple.cloudsettings.pencil";
  v6[7] = @"com.apple.cloudsettings.desktop";
  v7[6] = v2;
  v7[7] = v2;
  v6[8] = @"com.apple.cloudsettings.controlcenter";
  v6[9] = @"com.apple.cloudsettings.homescreen";
  v7[8] = v2;
  v7[9] = v2;
  v6[10] = @"com.apple.cloudsettings.screensaver";
  v6[11] = @"com.apple.cloudsettings.languageregion";
  v7[10] = v2;
  v7[11] = v2;
  v6[12] = @"com.apple.cloudsettings.displays";
  v6[13] = @"com.apple.cloudsettings.gamecontroller";
  v7[12] = v2;
  v7[13] = v2;
  v6[14] = @"com.apple.cloudsettings.international";
  v6[15] = @"com.apple.cloudsettings.datetime";
  v7[14] = v2;
  v7[15] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:16];
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];

  return v4;
}

- (void)writeSettingsDictionaryToPrefs:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "writesettings enter, with: %@", (uint8_t *)&v4, 0xCu);
  }
  CFPreferencesSetValue(@"CloudSettingsState", v3, @"com.apple.cloudsettings", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
}

- (id)currentStateDictionary
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "currentStateDictionary enter, calling copy pref", (uint8_t *)&v7, 2u);
  }
  CFPropertyListRef v2 = CFPreferencesCopyValue(@"CloudSettingsState", @"com.apple.cloudsettings", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "currentStateDictionary return from copy pref", (uint8_t *)&v7, 2u);
  }
  if (v2)
  {
    CFTypeID v3 = CFGetTypeID(v2);
    if (v3 == CFDictionaryGetTypeID())
    {
      int v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v2];
      CFRelease(v2);
      if (v4) {
        goto LABEL_13;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsState storage is not a dictionary", (uint8_t *)&v7, 2u);
      }
      CFRelease(v2);
    }
  }
  int v4 = [MEMORY[0x263EFF9A0] dictionary];
LABEL_13:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "currentStateDictionary returning: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (id)activeXPCConnectionForStore:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:v3];
  if (v4)
  {
    id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA06BE8];
    [v4 setRemoteObjectInterface:v5];

    [v4 resume];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | could not init service with identifier: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (id)currentConflictDictionary
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "currentConflictDictionary enter, calling copy pref", (uint8_t *)&v7, 2u);
  }
  CFPropertyListRef v2 = CFPreferencesCopyValue(@"CloudSettingsConflict", @"com.apple.cloudsettings", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "currentConflictDictionary return from copy pref", (uint8_t *)&v7, 2u);
  }
  if (v2)
  {
    CFTypeID v3 = CFGetTypeID(v2);
    if (v3 == CFDictionaryGetTypeID())
    {
      int v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v2];
      CFRelease(v2);
      if (v4) {
        goto LABEL_13;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | currentConflictDictionary storage is not a dictionary", (uint8_t *)&v7, 2u);
      }
      CFRelease(v2);
    }
  }
  int v4 = [MEMORY[0x263EFF9A0] dictionary];
LABEL_13:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "currentConflictDictionary returning: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)writeConflictsDictionaryToPrefs:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "writeconflicts enter, with: %@", (uint8_t *)&v4, 0xCu);
  }
  CFPreferencesSetValue(@"CloudSettingsConflict", v3, @"com.apple.cloudsettings", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
}

@end
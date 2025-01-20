@interface CloudSettingsStore
- (BOOL)BOOLForKey:(id)a3;
- (CloudSettingsStore)initWithStoreIdentifier:(id)a3;
- (NSString)serviceIdentifier;
- (NSUbiquitousKeyValueStore)kvsStore;
- (id)arrayForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryRepresentation;
- (id)numberForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int)keyExists:(id)a3 andIsOfType:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setArray:(id)a3 forKey:(id)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setData:(id)a3 forKey:(id)a4;
- (void)setDictionary:(id)a3 forKey:(id)a4;
- (void)setNumber:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4;
- (void)syncNow:(BOOL)a3;
@end

@implementation CloudSettingsStore

- (CloudSettingsStore)initWithStoreIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    if (v5)
    {
      v6 = +[CloudSettingsManager sharedCloudSettingsManager];
      int v7 = [v6 isServiceKnownForStore:v5];

      if (v7)
      {
        v16.receiver = self;
        v16.super_class = (Class)CloudSettingsStore;
        v8 = [(CloudSettingsStore *)&v16 init];
        v9 = (CloudSettingsStore **)v8;
        if (!v8)
        {
LABEL_16:
          self = v9;
          v11 = self;
          goto LABEL_17;
        }
        objc_storeStrong((id *)&v8->_serviceIdentifier, a3);
        uint64_t v10 = [objc_alloc(MEMORY[0x263F08C40]) _initWithStoreIdentifier:v5 usingEndToEndEncryption:1];
        self = v9[2];
        v9[2] = (CloudSettingsStore *)v10;
LABEL_15:

        goto LABEL_16;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v5;
        v12 = &_os_log_internal;
        v13 = "ERROR | CloudSettingsStore attempt to init with unknown identifier: %@";
        uint32_t v14 = 12;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = &_os_log_internal;
      v13 = "ERROR | CloudSettingsStore init attempted with nil identifier";
      uint32_t v14 = 2;
LABEL_13:
      _os_log_impl(&dword_2188A2000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
    }
    v9 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[initWithStoreIdentifier] - cloudsettings feature disabled, returning nil", buf, 2u);
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (int)keyExists:(id)a3 andIsOfType:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      id v18 = &_os_log_internal;
      uint64_t v19 = "[keyExists:andIsOfType] - cloudsettings feature disabled, returning param error";
      uint32_t v20 = 2;
LABEL_18:
      _os_log_impl(&dword_2188A2000, v18, OS_LOG_TYPE_DEFAULT, v19, v28, v20);
    }
LABEL_19:
    int v17 = 3;
    goto LABEL_20;
  }
  if (!v6 || !v7 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      *(_DWORD *)v28 = 67109632;
      *(_DWORD *)&v28[4] = v6 == 0;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)&v28[10] = v7 == 0;
      *(_WORD *)&v28[14] = 1024;
      *(_DWORD *)&v28[16] = serviceIdentifier == 0;
      id v18 = &_os_log_internal;
      uint64_t v19 = "ERROR | keyExists andIsOfType attempted with nil, key: %d, type: %d identifier: %d";
      uint32_t v20 = 20;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138412546;
    *(void *)&v28[4] = v6;
    *(_WORD *)&v28[12] = 2112;
    *(void *)&v28[14] = objc_opt_class();
    id v8 = *(id *)&v28[14];
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "key: %@, inType: %@", v28, 0x16u);
  }
  v9 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v10 = [v9 isServiceKnownForStore:self->_serviceIdentifier];

  v11 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v12 = [v11 isEnabledForStore:self->_serviceIdentifier];

  int v13 = v10 ^ 1;
  if (v13 & 1) != 0 || ((v12 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v23 = self->_serviceIdentifier;
    *(_DWORD *)v28 = 138412802;
    *(void *)&v28[4] = v23;
    *(_WORD *)&v28[12] = 1024;
    *(_DWORD *)&v28[14] = v13;
    *(_WORD *)&v28[18] = 1024;
    *(_DWORD *)&v28[20] = v12 ^ 1;
    id v18 = &_os_log_internal;
    uint64_t v19 = "ERROR | keyExists:andIsOfType for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v20 = 24;
    goto LABEL_18;
  }
  uint32_t v14 = [(NSUbiquitousKeyValueStore *)self->_kvsStore objectForKey:v6];
  if (v14)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (isKindOfClass)
    {
      if (v16)
      {
        *(_DWORD *)v28 = 67109120;
        *(_DWORD *)&v28[4] = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Object found and is correct class, setting (success) result: %d", v28, 8u);
      }
      int v17 = 0;
    }
    else
    {
      int v17 = 2;
      if (v16)
      {
        v24 = objc_opt_class();
        id v25 = v24;
        v26 = objc_opt_class();
        *(_DWORD *)v28 = 138412802;
        *(void *)&v28[4] = v24;
        *(_WORD *)&v28[12] = 2112;
        *(void *)&v28[14] = v26;
        *(_WORD *)&v28[22] = 1024;
        int v29 = 2;
        id v27 = v26;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Object found, but wrong class, expected: %@, got: %@, setting (wrong class) result: %d", v28, 0x1Cu);
      }
    }
  }
  else
  {
    int v17 = 1;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v28 = 67109120;
      *(_DWORD *)&v28[4] = 1;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Object not found in store, setting (not found) result: %d", v28, 8u);
    }
  }

LABEL_20:
  return v17;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v18) = 0;
    int v13 = &_os_log_internal;
    uint32_t v14 = "[setBool forKey] - cloudsettings feature disabled";
    uint32_t v15 = 2;
LABEL_13:
    _os_log_impl(&dword_2188A2000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v6 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    BOOL v16 = self->_serviceIdentifier == 0;
    int v18 = 67109376;
    *(_DWORD *)uint64_t v19 = v6 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    int v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setBoolForKey attempted with a nil, key: %d, identifier: %d";
    uint32_t v15 = 14;
    goto LABEL_13;
  }
  id v7 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v8 = [v7 isServiceKnownForStore:self->_serviceIdentifier];

  v9 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v10 = [v9 isEnabledForStore:self->_serviceIdentifier];

  int v11 = v8 ^ 1;
  if (v11 & 1) != 0 || ((v10 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v18 = 138412802;
    *(void *)uint64_t v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    int v20 = v11;
    __int16 v21 = 1024;
    int v22 = v10 ^ 1;
    int v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setBool:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v15 = 24;
    goto LABEL_13;
  }
  int v12 = [NSNumber numberWithBool:v4];
  [(CloudSettingsStore *)self setObject:v12 forKey:v6];

LABEL_14:
}

- (BOOL)BOOLForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    BOOL v9 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v16) = 0;
    int v10 = &_os_log_internal;
    int v11 = "[BOOLForKey] - cloudsettings feature disabled, returning NO";
    uint32_t v12 = 2;
LABEL_13:
    _os_log_impl(&dword_2188A2000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v12);
    BOOL v9 = 0;
    goto LABEL_14;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    BOOL v9 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    BOOL v13 = self->_serviceIdentifier == 0;
    int v16 = 67109376;
    *(_DWORD *)int v17 = v4 == 0;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v13;
    int v10 = &_os_log_internal;
    int v11 = "ERROR | BOOLForKey attempted with a nil, key: %d, identifier: %d";
    uint32_t v12 = 14;
    goto LABEL_13;
  }
  id v5 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v6 = [v5 isServiceKnownForStore:self->_serviceIdentifier];

  id v7 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v8 = [v7 isEnabledForStore:self->_serviceIdentifier];

  if ((v6 ^ 1) & 1) != 0 || ((v8 ^ 1))
  {
    BOOL v9 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v16 = 138412802;
    *(void *)int v17 = serviceIdentifier;
    *(_WORD *)&v17[8] = 1024;
    int v18 = v6 ^ 1;
    __int16 v19 = 1024;
    int v20 = v8 ^ 1;
    int v10 = &_os_log_internal;
    int v11 = "ERROR | BOOLForKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v12 = 24;
    goto LABEL_13;
  }
  BOOL v9 = [(NSUbiquitousKeyValueStore *)self->_kvsStore BOOLForKey:v4];
LABEL_14:

  return v9;
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v18) = 0;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "[setNumber forKey] - cloudsettings feature disabled";
    uint32_t v15 = 2;
LABEL_13:
    _os_log_impl(&dword_2188A2000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    BOOL v16 = self->_serviceIdentifier == 0;
    int v18 = 67109376;
    *(_DWORD *)__int16 v19 = v7 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setBoolForKey attempted with a nil, key: %d, identifier: %d";
    uint32_t v15 = 14;
    goto LABEL_13;
  }
  int v8 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v9 = [v8 isServiceKnownForStore:self->_serviceIdentifier];

  int v10 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v11 = [v10 isEnabledForStore:self->_serviceIdentifier];

  int v12 = v9 ^ 1;
  if (v12 & 1) != 0 || ((v11 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v18 = 138412802;
    *(void *)__int16 v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    int v20 = v12;
    __int16 v21 = 1024;
    int v22 = v11 ^ 1;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setNumber:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v15 = 24;
    goto LABEL_13;
  }
  [(CloudSettingsStore *)self setObject:v6 forKey:v7];
LABEL_14:
}

- (id)numberForKey:(id)a3
{
  *(void *)&v21[5] = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      int v12 = &_os_log_internal;
      BOOL v13 = "[numberForKey] - cloudsettings feature disabled";
LABEL_15:
      uint32_t v14 = 2;
LABEL_20:
      _os_log_impl(&dword_2188A2000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v14);
    }
LABEL_21:
    int v10 = 0;
    goto LABEL_22;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      int v18 = 138412546;
      __int16 v19 = v4;
      __int16 v20 = 2112;
      *(void *)__int16 v21 = serviceIdentifier;
      int v12 = &_os_log_internal;
      BOOL v13 = "ERROR | objectForKey, key: %@, returned nil for service: %@";
      uint32_t v14 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v5 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v6 = [v5 isServiceKnownForStore:self->_serviceIdentifier];

  id v7 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v8 = [v7 isEnabledForStore:self->_serviceIdentifier];

  int v9 = v6 ^ 1;
  if (v9 & 1) != 0 || ((v8 ^ 1))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = self->_serviceIdentifier;
      int v18 = 138412802;
      __int16 v19 = v16;
      __int16 v20 = 1024;
      *(_DWORD *)__int16 v21 = v9;
      v21[2] = 1024;
      *(_DWORD *)&v21[3] = v8 ^ 1;
      int v12 = &_os_log_internal;
      BOOL v13 = "ERROR | numberForKey for store: %@, unknown store: %d, or store is disabled: %d";
      uint32_t v14 = 24;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  int v10 = [(CloudSettingsStore *)self objectForKey:v4];
  BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v11) {
      goto LABEL_21;
    }
    LOWORD(v18) = 0;
    int v12 = &_os_log_internal;
    BOOL v13 = "ERROR | numberForKey - objectForKey returned nil";
    goto LABEL_15;
  }
  if (v11)
  {
    int v18 = 138412290;
    __int16 v19 = v10;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "numberForKey - found a value: %@, checking if it is an NSNumber", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      __int16 v19 = v10;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | numberForKey - returned value is not a number: %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (void)setString:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v18) = 0;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "[setString forKey] - cloudsettings feature disabled";
    uint32_t v15 = 2;
LABEL_13:
    _os_log_impl(&dword_2188A2000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    BOOL v16 = self->_serviceIdentifier == 0;
    int v18 = 67109376;
    *(_DWORD *)__int16 v19 = v7 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setStringForKey attempted with a nil, key: %d, identifier: %d";
    uint32_t v15 = 14;
    goto LABEL_13;
  }
  int v8 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v9 = [v8 isServiceKnownForStore:self->_serviceIdentifier];

  int v10 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v11 = [v10 isEnabledForStore:self->_serviceIdentifier];

  int v12 = v9 ^ 1;
  if (v12 & 1) != 0 || ((v11 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v18 = 138412802;
    *(void *)__int16 v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    int v20 = v12;
    __int16 v21 = 1024;
    int v22 = v11 ^ 1;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setString:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v15 = 24;
    goto LABEL_13;
  }
  [(CloudSettingsStore *)self setObject:v6 forKey:v7];
LABEL_14:
}

- (id)stringForKey:(id)a3
{
  *(void *)&v21[5] = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      int v12 = &_os_log_internal;
      BOOL v13 = "[stringForKey] - cloudsettings feature disabled, returning nil";
LABEL_15:
      uint32_t v14 = 2;
LABEL_20:
      _os_log_impl(&dword_2188A2000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v14);
    }
LABEL_21:
    int v10 = 0;
    goto LABEL_22;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      int v18 = 138412546;
      __int16 v19 = v4;
      __int16 v20 = 2112;
      *(void *)__int16 v21 = serviceIdentifier;
      int v12 = &_os_log_internal;
      BOOL v13 = "ERROR | objectForKey, key: %@, returned nil for service: %@";
      uint32_t v14 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v5 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v6 = [v5 isServiceKnownForStore:self->_serviceIdentifier];

  id v7 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v8 = [v7 isEnabledForStore:self->_serviceIdentifier];

  int v9 = v6 ^ 1;
  if (v9 & 1) != 0 || ((v8 ^ 1))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = self->_serviceIdentifier;
      int v18 = 138412802;
      __int16 v19 = v16;
      __int16 v20 = 1024;
      *(_DWORD *)__int16 v21 = v9;
      v21[2] = 1024;
      *(_DWORD *)&v21[3] = v8 ^ 1;
      int v12 = &_os_log_internal;
      BOOL v13 = "ERROR | stringForKey for store: %@, unknown store: %d, or store is disabled: %d";
      uint32_t v14 = 24;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  int v10 = [(CloudSettingsStore *)self objectForKey:v4];
  BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v11) {
      goto LABEL_21;
    }
    LOWORD(v18) = 0;
    int v12 = &_os_log_internal;
    BOOL v13 = "ERROR | stringForKey - objectForKey returned nil";
    goto LABEL_15;
  }
  if (v11)
  {
    int v18 = 138412290;
    __int16 v19 = v10;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "stringForKey - found a value: %@, checking if it is an NSString", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      __int16 v19 = v10;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | stringForKey - returned value is not a string: %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v18) = 0;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "[setArray forKey] - cloudsettings feature disabled";
    uint32_t v15 = 2;
LABEL_13:
    _os_log_impl(&dword_2188A2000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    BOOL v16 = self->_serviceIdentifier == 0;
    int v18 = 67109376;
    *(_DWORD *)__int16 v19 = v7 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setArrayForKey attempted with a nil, key: %d, identifier: %d";
    uint32_t v15 = 14;
    goto LABEL_13;
  }
  int v8 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v9 = [v8 isServiceKnownForStore:self->_serviceIdentifier];

  int v10 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v11 = [v10 isEnabledForStore:self->_serviceIdentifier];

  int v12 = v9 ^ 1;
  if (v12 & 1) != 0 || ((v11 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v18 = 138412802;
    *(void *)__int16 v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    int v20 = v12;
    __int16 v21 = 1024;
    int v22 = v11 ^ 1;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setArray:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v15 = 24;
    goto LABEL_13;
  }
  [(CloudSettingsStore *)self setObject:v6 forKey:v7];
LABEL_14:
}

- (id)arrayForKey:(id)a3
{
  *(void *)&v21[5] = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      int v12 = &_os_log_internal;
      BOOL v13 = "[arrayForKey] - cloudsettings feature disabled, returning nil";
LABEL_15:
      uint32_t v14 = 2;
LABEL_20:
      _os_log_impl(&dword_2188A2000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v14);
    }
LABEL_21:
    int v10 = 0;
    goto LABEL_22;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      int v18 = 138412546;
      __int16 v19 = v4;
      __int16 v20 = 2112;
      *(void *)__int16 v21 = serviceIdentifier;
      int v12 = &_os_log_internal;
      BOOL v13 = "ERROR | objectForKey, key: %@, returned nil for service: %@";
      uint32_t v14 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v5 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v6 = [v5 isServiceKnownForStore:self->_serviceIdentifier];

  id v7 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v8 = [v7 isEnabledForStore:self->_serviceIdentifier];

  int v9 = v6 ^ 1;
  if (v9 & 1) != 0 || ((v8 ^ 1))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = self->_serviceIdentifier;
      int v18 = 138412802;
      __int16 v19 = v16;
      __int16 v20 = 1024;
      *(_DWORD *)__int16 v21 = v9;
      v21[2] = 1024;
      *(_DWORD *)&v21[3] = v8 ^ 1;
      int v12 = &_os_log_internal;
      BOOL v13 = "ERROR | arrayForKey for store: %@, unknown store: %d, or store is disabled: %d";
      uint32_t v14 = 24;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  int v10 = [(CloudSettingsStore *)self objectForKey:v4];
  BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v11) {
      goto LABEL_21;
    }
    LOWORD(v18) = 0;
    int v12 = &_os_log_internal;
    BOOL v13 = "ERROR | arrayForKey - objectForKey returned nil";
    goto LABEL_15;
  }
  if (v11)
  {
    int v18 = 138412290;
    __int16 v19 = v10;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "arrayForKey - found a value: %@, checking if it is an NSArray", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      __int16 v19 = v10;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | arrayForKey - returned value is not an array: %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (void)setData:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v18) = 0;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "[setData forKey] - cloudsettings feature disabled";
    uint32_t v15 = 2;
LABEL_13:
    _os_log_impl(&dword_2188A2000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v15);
    goto LABEL_14;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    BOOL v16 = self->_serviceIdentifier == 0;
    int v18 = 67109376;
    *(_DWORD *)__int16 v19 = v7 == 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v16;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setData attempted with a nil, key: %d, identifier: %d";
    uint32_t v15 = 14;
    goto LABEL_13;
  }
  int v8 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v9 = [v8 isServiceKnownForStore:self->_serviceIdentifier];

  int v10 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v11 = [v10 isEnabledForStore:self->_serviceIdentifier];

  int v12 = v9 ^ 1;
  if (v12 & 1) != 0 || ((v11 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v18 = 138412802;
    *(void *)__int16 v19 = serviceIdentifier;
    *(_WORD *)&v19[8] = 1024;
    int v20 = v12;
    __int16 v21 = 1024;
    int v22 = v11 ^ 1;
    BOOL v13 = &_os_log_internal;
    uint32_t v14 = "ERROR | setData:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v15 = 24;
    goto LABEL_13;
  }
  [(CloudSettingsStore *)self setObject:v6 forKey:v7];
LABEL_14:
}

- (id)dataForKey:(id)a3
{
  *(void *)&v21[5] = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  if (!_os_feature_enabled_impl())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      int v12 = &_os_log_internal;
      BOOL v13 = "[dataForKey] - cloudsettings feature disabled, returning nil";
LABEL_15:
      uint32_t v14 = 2;
LABEL_20:
      _os_log_impl(&dword_2188A2000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v14);
    }
LABEL_21:
    int v10 = 0;
    goto LABEL_22;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      serviceIdentifier = self->_serviceIdentifier;
      int v18 = 138412546;
      __int16 v19 = v4;
      __int16 v20 = 2112;
      *(void *)__int16 v21 = serviceIdentifier;
      int v12 = &_os_log_internal;
      BOOL v13 = "ERROR | dataForKey, key: %@, returned nil for service: %@";
      uint32_t v14 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v5 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v6 = [v5 isServiceKnownForStore:self->_serviceIdentifier];

  id v7 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v8 = [v7 isEnabledForStore:self->_serviceIdentifier];

  int v9 = v6 ^ 1;
  if (v9 & 1) != 0 || ((v8 ^ 1))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = self->_serviceIdentifier;
      int v18 = 138412802;
      __int16 v19 = v16;
      __int16 v20 = 1024;
      *(_DWORD *)__int16 v21 = v9;
      v21[2] = 1024;
      *(_DWORD *)&v21[3] = v8 ^ 1;
      int v12 = &_os_log_internal;
      BOOL v13 = "ERROR | dataForKey for store: %@, unknown store: %d, or store is disabled: %d";
      uint32_t v14 = 24;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  int v10 = [(CloudSettingsStore *)self objectForKey:v4];
  BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v11) {
      goto LABEL_21;
    }
    LOWORD(v18) = 0;
    int v12 = &_os_log_internal;
    BOOL v13 = "ERROR | dataForKey - objectForKey returned nil";
    goto LABEL_15;
  }
  if (v11)
  {
    int v18 = 138412290;
    __int16 v19 = v10;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "dataForKey - found a value: %@, checking if it is an NSData", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      __int16 v19 = v10;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | dataForKey - returned value is not NSData: %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    LOWORD(v19) = 0;
    uint32_t v14 = &_os_log_internal;
    uint32_t v15 = "[setDictionary forKey] - cloudsettings feature disabled";
    uint32_t v16 = 2;
LABEL_16:
    _os_log_impl(&dword_2188A2000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v16);
    goto LABEL_17;
  }
  if (!v7 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    BOOL v17 = self->_serviceIdentifier == 0;
    int v19 = 67109376;
    *(_DWORD *)__int16 v20 = v7 == 0;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v17;
    uint32_t v14 = &_os_log_internal;
    uint32_t v15 = "ERROR | setDictionaryForKey attempted with a nil, key: %d, identifier: %d";
    uint32_t v16 = 14;
    goto LABEL_16;
  }
  int v8 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v9 = [v8 isServiceKnownForStore:self->_serviceIdentifier];

  int v10 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v11 = [v10 isEnabledForStore:self->_serviceIdentifier];

  int v12 = v9 ^ 1;
  if (v12 & 1) != 0 || ((v11 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v19 = 138412802;
    *(void *)__int16 v20 = serviceIdentifier;
    *(_WORD *)&v20[8] = 1024;
    int v21 = v12;
    __int16 v22 = 1024;
    int v23 = v11 ^ 1;
    uint32_t v14 = &_os_log_internal;
    uint32_t v15 = "ERROR | setDictionary:forKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v16 = 24;
    goto LABEL_16;
  }
  [(NSUbiquitousKeyValueStore *)self->_kvsStore setDictionary:v6 forKey:v7];
  BOOL v13 = [(NSUbiquitousKeyValueStore *)self->_kvsStore objectForKey:v7];
  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "setDictionary - check of set value returned nil", (uint8_t *)&v19, 2u);
  }

LABEL_17:
}

- (id)dictionaryForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v17) = 0;
    int v11 = &_os_log_internal;
    int v12 = "[dictionaryForKey] - cloudsettings feature disabled";
    uint32_t v13 = 2;
LABEL_13:
    _os_log_impl(&dword_2188A2000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v13);
    goto LABEL_14;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    BOOL v14 = self->_serviceIdentifier == 0;
    int v17 = 67109376;
    *(_DWORD *)int v18 = v4 == 0;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v14;
    int v11 = &_os_log_internal;
    int v12 = "ERROR | dictionaryForKey attempted with a nil, key: %d, identifier: %d";
    uint32_t v13 = 14;
    goto LABEL_13;
  }
  id v5 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v6 = [v5 isServiceKnownForStore:self->_serviceIdentifier];

  id v7 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v8 = [v7 isEnabledForStore:self->_serviceIdentifier];

  int v9 = v6 ^ 1;
  if ((v9 & 1) == 0 && ((v8 ^ 1) & 1) == 0)
  {
    int v10 = [(NSUbiquitousKeyValueStore *)self->_kvsStore dictionaryForKey:v4];
    goto LABEL_15;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    int v17 = 138412802;
    *(void *)int v18 = serviceIdentifier;
    *(_WORD *)&v18[8] = 1024;
    int v19 = v9;
    __int16 v20 = 1024;
    int v21 = v8 ^ 1;
    int v11 = &_os_log_internal;
    int v12 = "ERROR | dictionaryForKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v13 = 24;
    goto LABEL_13;
  }
LABEL_14:
  int v10 = 0;
LABEL_15:

  return v10;
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    LOWORD(v16) = 0;
    int v11 = &_os_log_internal;
    int v12 = "[removeObjectForKey] - cloudsettings feature disabled";
    uint32_t v13 = 2;
LABEL_16:
    _os_log_impl(&dword_2188A2000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v13);
    goto LABEL_17;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    BOOL v14 = self->_serviceIdentifier == 0;
    int v16 = 67109376;
    *(_DWORD *)int v17 = v4 == 0;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v14;
    int v11 = &_os_log_internal;
    int v12 = "ERROR | removeObjectForKey attempted with a nil, key: %d, or identifier: %d";
    uint32_t v13 = 14;
    goto LABEL_16;
  }
  id v5 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v6 = [v5 isServiceKnownForStore:self->_serviceIdentifier];

  id v7 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v8 = [v7 isEnabledForStore:self->_serviceIdentifier];

  int v9 = v6 ^ 1;
  if (v9 & 1) != 0 || ((v8 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v16 = 138412802;
    *(void *)int v17 = serviceIdentifier;
    *(_WORD *)&v17[8] = 1024;
    int v18 = v9;
    __int16 v19 = 1024;
    int v20 = v8 ^ 1;
    int v11 = &_os_log_internal;
    int v12 = "ERROR | removeObjectForKey for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v13 = 24;
    goto LABEL_16;
  }
  [(NSUbiquitousKeyValueStore *)self->_kvsStore removeObjectForKey:v4];
  int v10 = [(NSUbiquitousKeyValueStore *)self->_kvsStore objectForKey:v4];
  if (v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "removeObjectForKey - check of set value did NOT return nil", (uint8_t *)&v16, 2u);
  }

LABEL_17:
}

- (id)dictionaryRepresentation
{
  return [(NSUbiquitousKeyValueStore *)self->_kvsStore dictionaryRepresentation];
}

- (void)syncNow:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!_os_feature_enabled_impl())
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v14) = 0;
    int v10 = &_os_log_internal;
    int v11 = "[syncNow] - cloudsettings feature disabled";
LABEL_12:
    uint32_t v12 = 2;
    goto LABEL_13;
  }
  if (!self->_serviceIdentifier)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v14) = 0;
    int v10 = &_os_log_internal;
    int v11 = "ERROR | syncNow attempted with a nil identifier";
    goto LABEL_12;
  }
  id v4 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v5 = [v4 isServiceKnownForStore:self->_serviceIdentifier];

  int v6 = +[CloudSettingsManager sharedCloudSettingsManager];
  int v7 = [v6 isEnabledForStore:self->_serviceIdentifier];

  int v8 = v5 ^ 1;
  if (v8 & 1) != 0 || ((v7 ^ 1))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    serviceIdentifier = self->_serviceIdentifier;
    int v14 = 138412802;
    uint32_t v15 = serviceIdentifier;
    __int16 v16 = 1024;
    int v17 = v8;
    __int16 v18 = 1024;
    int v19 = v7 ^ 1;
    int v10 = &_os_log_internal;
    int v11 = "ERROR | syncNow for store: %@, unknown store: %d, or store is disabled: %d";
    uint32_t v12 = 24;
LABEL_13:
    _os_log_impl(&dword_2188A2000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v12);
    return;
  }
  kvsStore = self->_kvsStore;

  [(NSUbiquitousKeyValueStore *)kvsStore synchronize];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v6 && v7 && self->_serviceIdentifier)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(CloudSettingsStore *)self serviceIdentifier];
      kvsStore = self->_kvsStore;
      int v13 = 138413058;
      *(void *)int v14 = v9;
      *(_WORD *)&v14[8] = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      int v17 = v8;
      __int16 v18 = 2112;
      int v19 = kvsStore;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "IN FRAMEWORK, likely from service, writing to store: %@ value: %@, for key: %@, to store: %@", (uint8_t *)&v13, 0x2Au);
    }
    [(NSUbiquitousKeyValueStore *)self->_kvsStore setObject:v6 forKey:v8];
    int v11 = [(NSUbiquitousKeyValueStore *)self->_kvsStore objectForKey:v8];
    if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "setObject - check of set value returned nil", (uint8_t *)&v13, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    int v13 = 67109632;
    *(_DWORD *)int v14 = v6 == 0;
    *(_WORD *)&v14[4] = 1024;
    *(_DWORD *)&v14[6] = v8 == 0;
    LOWORD(v15) = 1024;
    *(_DWORD *)((char *)&v15 + 2) = serviceIdentifier == 0;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | setObject attempted with a nil, value:%d, key:%d, identifier:%d", (uint8_t *)&v13, 0x14u);
  }
}

- (id)objectForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (!self->_kvsStore)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      int v9 = &_os_log_internal;
      int v10 = "ERROR | _kvsStore is nil";
      uint32_t v11 = 2;
      goto LABEL_11;
    }
LABEL_12:
    id v7 = 0;
    goto LABEL_13;
  }
  if (!v4 || !self->_serviceIdentifier)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = self->_serviceIdentifier == 0;
      int v13 = 67109376;
      *(_DWORD *)int v14 = v5 == 0;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = v8;
      int v9 = &_os_log_internal;
      int v10 = "ERROR | objectForKey attempted with a nil, key: %d, identifier: %d";
      uint32_t v11 = 14;
LABEL_11:
      _os_log_impl(&dword_2188A2000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CloudSettingsStore *)self serviceIdentifier];
    int v13 = 138412546;
    *(void *)int v14 = v5;
    *(_WORD *)&v14[8] = 2112;
    id v15 = v6;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "_kvsStore getting:%@, for store: %@", (uint8_t *)&v13, 0x16u);
  }
  id v7 = [(NSUbiquitousKeyValueStore *)self->_kvsStore objectForKey:v5];
LABEL_13:

  return v7;
}

- (NSString)serviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUbiquitousKeyValueStore)kvsStore
{
  return (NSUbiquitousKeyValueStore *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvsStore, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
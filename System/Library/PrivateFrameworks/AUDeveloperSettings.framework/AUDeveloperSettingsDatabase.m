@interface AUDeveloperSettingsDatabase
+ (id)sharedDatabase;
- (AUDeveloperSettingsDatabase)init;
- (BOOL)isSeedParticipationEnabled:(id)a3;
- (BOOL)isValidLocationType:(unint64_t)a3;
- (NSDictionary)accessoriesDictionary;
- (id)seedParticipationDictionary;
- (unint64_t)urlLocationTypeForAccessory:(id)a3;
- (void)accessoriesDictionary;
- (void)accessoryNameForIdentifier:(id)a3 name:(id *)a4 serialNumber:(id *)a5 fusingType:(unint64_t *)a6;
- (void)addAccessoryWithSerialNumber:(id)a3 info:(id)a4;
- (void)migrateExistingDefaults;
- (void)removeAccessoryWithSerialNumber:(id)a3;
- (void)seedParticipationDictionary;
- (void)setAccessoriesDictionary:(id)a3;
- (void)updateAccessory:(id)a3 locationType:(unint64_t)a4;
@end

@implementation AUDeveloperSettingsDatabase

+ (id)sharedDatabase
{
  if (sharedDatabase_onceToken != -1) {
    dispatch_once(&sharedDatabase_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedDatabase_sharedDatabase;
  return v2;
}

uint64_t __45__AUDeveloperSettingsDatabase_sharedDatabase__block_invoke()
{
  sharedDatabase_sharedDatabase = objc_alloc_init(AUDeveloperSettingsDatabase);
  return MEMORY[0x270F9A758]();
}

- (AUDeveloperSettingsDatabase)init
{
  v6.receiver = self;
  v6.super_class = (Class)AUDeveloperSettingsDatabase;
  v2 = [(AUDeveloperSettingsDatabase *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create((const char *)[@"com.apple.AUDeveloperSettings" UTF8String], "default");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    [(AUDeveloperSettingsDatabase *)v2 migrateExistingDefaults];
  }
  return v2;
}

- (void)setAccessoriesDictionary:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[AUDeveloperSettingsDatabase setAccessoriesDictionary:]((uint64_t)v4, log);
  }
  [MEMORY[0x263EFFA40] AUDeveloperSettingsSetObject:v4 withKey:@"accessories"];
}

- (NSDictionary)accessoriesDictionary
{
  id v3 = [MEMORY[0x263EFFA40] AUDeveloperSettingsObjectWithKey:@"accessories"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v3) {
      goto LABEL_8;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[AUDeveloperSettingsDatabase accessoriesDictionary]();
    }
  }
  id v3 = objc_alloc_init(NSDictionary);
LABEL_8:
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[AUDeveloperSettingsDatabase accessoriesDictionary]();
  }
  return (NSDictionary *)v3;
}

- (BOOL)isSeedParticipationEnabled:(id)a3
{
  return [(AUDeveloperSettingsDatabase *)self urlLocationTypeForAccessory:a3] == 3;
}

- (unint64_t)urlLocationTypeForAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 objectForKeyedSubscript:@"assetLocation"];
  unint64_t v8 = AUDeveloperSettingsURLStringToType(v7);

  return v8;
}

- (void)updateAccessory:(id)a3 locationType:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(AUDeveloperSettingsDatabase *)self isValidLocationType:a4])
  {
    v7 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
    unint64_t v8 = [v7 objectForKeyedSubscript:v6];
    v9 = (void *)[v8 mutableCopy];

    v10 = [NSString stringWithUTF8String:AUDeveloperSettingsURLTypeToString(a4)];
    [v9 setObject:v10 forKeyedSubscript:@"assetLocation"];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = log;
      v13 = AUDeveloperSettingsURLTypeToString(a4);
      v14 = [v9 objectForKeyedSubscript:@"name"];
      int v16 = 136315650;
      v17 = "-[AUDeveloperSettingsDatabase updateAccessory:locationType:]";
      __int16 v18 = 2080;
      v19 = v13;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_2283E9000, v12, OS_LOG_TYPE_DEFAULT, "%s: Updating location = %s for accessoryName = %@", (uint8_t *)&v16, 0x20u);
    }
    v15 = [NSDictionary dictionaryWithDictionary:v9];
    [(AUDeveloperSettingsDatabase *)self addAccessoryWithSerialNumber:v6 info:v15];
  }
}

- (void)addAccessoryWithSerialNumber:(id)a3 info:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    unint64_t v8 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
    v9 = (void *)[v8 mutableCopy];

    [v9 setObject:v7 forKeyedSubscript:v6];
    [(AUDeveloperSettingsDatabase *)self setAccessoriesDictionary:v9];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "-[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_2283E9000, log, OS_LOG_TYPE_DEFAULT, "%s: Not adding empty serial number with info = %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)removeAccessoryWithSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
  id v6 = (id)[v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  [(AUDeveloperSettingsDatabase *)self setAccessoriesDictionary:v6];
}

- (BOOL)isValidLocationType:(unint64_t)a3
{
  return a3 < 7;
}

- (void)migrateExistingDefaults
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [(AUDeveloperSettingsDatabase *)self seedParticipationDictionary];
  id v3 = (void *)[v2 mutableCopy];

  if ([v3 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v21 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v10 = [v4 objectForKeyedSubscript:v9];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v24 = 0;
            unint64_t v25 = 4;
            id v23 = 0;
            [(AUDeveloperSettingsDatabase *)self accessoryNameForIdentifier:v9 name:&v24 serialNumber:&v23 fusingType:&v25];
            id v12 = v24;
            id v13 = v23;
            if (v13)
            {
              id v14 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
              uint64_t v15 = [v14 allKeys];
              char v16 = [v15 containsObject:v13];

              if ((v16 & 1) == 0)
              {
                v17 = [MEMORY[0x263EFF9A0] dictionary];
                __int16 v18 = [v4 objectForKeyedSubscript:v9];
                [v17 setObject:v18 forKeyedSubscript:@"assetLocation"];

                if (v12) {
                  [v17 setObject:v12 forKeyedSubscript:@"name"];
                }
                if (v25 <= 2)
                {
                  v19 = [NSString stringWithUTF8String:AUDeveloperSettingsAccessoryFusingTypeToString(v25)];
                  [v17 setObject:v19 forKeyedSubscript:@"fusing"];
                }
                __int16 v20 = [NSDictionary dictionaryWithDictionary:v17];
                [(AUDeveloperSettingsDatabase *)self addAccessoryWithSerialNumber:v13 info:v20];
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v6);
    }

    id v3 = v21;
  }
}

- (id)seedParticipationDictionary
{
  id v3 = [MEMORY[0x263EFFA40] AUDeveloperSettingsObjectWithKey:@"seedParticipation"];
  if (!v3) {
    id v3 = objc_alloc_init(NSDictionary);
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[AUDeveloperSettingsDatabase seedParticipationDictionary]();
  }
  return v3;
}

- (void)accessoryNameForIdentifier:(id)a3 name:(id *)a4 serialNumber:(id *)a5 fusingType:(unint64_t *)a6
{
  id v14 = [a3 componentsSeparatedByString:@"+"];
  BOOL v9 = [v14 count] == 3;
  v10 = v14;
  if (v9)
  {
    if (a6)
    {
      int v11 = [v14 objectAtIndexedSubscript:0];
      *a6 = AUDeveloperSettingsAccessoryFusingStringToType(v11);
    }
    if (a5)
    {
      id v12 = [v14 objectAtIndexedSubscript:1];
      *a5 = (id)[v12 copy];
    }
    v10 = v14;
    if (a4)
    {
      id v13 = [v14 objectAtIndexedSubscript:2];
      *a4 = (id)[v13 copy];

      v10 = v14;
    }
  }
}

- (void).cxx_destruct
{
}

- (void)setAccessoriesDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  id v3 = "-[AUDeveloperSettingsDatabase setAccessoriesDictionary:]";
  __int16 v4 = 2112;
  uint64_t v5 = @"accessories";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl(&dword_2283E9000, a2, OS_LOG_TYPE_DEBUG, "%s: seting %@:%@", (uint8_t *)&v2, 0x20u);
}

- (void)accessoriesDictionary
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2283E9000, v0, OS_LOG_TYPE_ERROR, "%s: received unknown object = %@", (uint8_t *)v1, 0x16u);
}

- (void)seedParticipationDictionary
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_2283E9000, v0, OS_LOG_TYPE_DEBUG, "%s: dictionary = %@", (uint8_t *)v1, 0x16u);
}

@end
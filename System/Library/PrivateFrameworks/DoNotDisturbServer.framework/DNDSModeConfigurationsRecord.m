@interface DNDSModeConfigurationsRecord
+ (id)backingStoreWithFileURL:(id)a3 secureFileURL:(id)a4;
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5;
- (BOOL)isEqual:(id)a3;
- (DNDSModeConfigurationsRecord)init;
- (NSArray)modeConfigurations;
- (NSString)description;
- (id)_initWithModeConfigurations:(id)a3;
- (id)_initWithRecord:(id)a3;
- (id)configurationForModeIdentifier:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)modeConfigurationForModeIdentifier:(id)a3;
- (id)modeForModeIdentifier:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)triggersForModeIdentifier:(id)a3;
- (unint64_t)hash;
- (void)log:(id)a3 withMessage:(id)a4;
@end

@implementation DNDSModeConfigurationsRecord

- (id)modeConfigurationForModeIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_modeConfigurationsByModeIdentifier objectForKeyedSubscript:a3];
}

+ (id)backingStoreWithFileURL:(id)a3 secureFileURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[DNDSJSONBackingStore alloc] initWithRecordClass:a1 fileURL:v7 secureFileURL:v6 versionNumber:2 securityClass:2];

  return v8;
}

- (DNDSModeConfigurationsRecord)init
{
  return (DNDSModeConfigurationsRecord *)[(DNDSModeConfigurationsRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  v4 = [a3 modeConfigurations];
  id v5 = [(DNDSModeConfigurationsRecord *)self _initWithModeConfigurations:v4];

  return v5;
}

- (id)_initWithModeConfigurations:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DNDSModeConfigurationsRecord;
  id v5 = [(DNDSModeConfigurationsRecord *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    modeConfigurationsByModeIdentifier = v5->_modeConfigurationsByModeIdentifier;
    v5->_modeConfigurationsByModeIdentifier = (NSMutableDictionary *)v6;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = v5->_modeConfigurationsByModeIdentifier;
          v15 = objc_msgSend(v13, "mode", (void)v18);
          v16 = [v15 modeIdentifier];
          [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (NSArray)modeConfigurations
{
  return (NSArray *)[(NSMutableDictionary *)self->_modeConfigurationsByModeIdentifier allValues];
}

- (id)configurationForModeIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_modeConfigurationsByModeIdentifier objectForKeyedSubscript:a3];
  id v4 = [v3 configuration];

  return v4;
}

- (id)triggersForModeIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_modeConfigurationsByModeIdentifier objectForKeyedSubscript:a3];
  id v4 = [v3 triggers];

  return v4;
}

- (id)modeForModeIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_modeConfigurationsByModeIdentifier objectForKeyedSubscript:a3];
  id v4 = [v3 mode];

  return v4;
}

- (void)log:(id)a3 withMessage:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v7;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = self->_modeConfigurationsByModeIdentifier;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v13 log:v6 withMessage:@"Record"];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_modeConfigurationsByModeIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSModeConfigurationsRecord *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(DNDSModeConfigurationsRecord *)self modeConfigurations];
      id v7 = [(DNDSModeConfigurationsRecord *)v5 modeConfigurations];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        id v8 = [(DNDSModeConfigurationsRecord *)self modeConfigurations];
        if (v8)
        {
          uint64_t v9 = [(DNDSModeConfigurationsRecord *)v5 modeConfigurations];
          if (v9)
          {
            uint64_t v10 = [(DNDSModeConfigurationsRecord *)self modeConfigurations];
            uint64_t v11 = [(DNDSModeConfigurationsRecord *)v5 modeConfigurations];
            char v12 = [v10 isEqual:v11];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; modeConfigurations: %@>",
                       objc_opt_class(),
                       self,
                       self->_modeConfigurationsByModeIdentifier);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [DNDSMutableModeConfigurationsRecord alloc];
  return [(DNDSModeConfigurationsRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"modeConfigurations", objc_opt_class());
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = +[DNDSModeConfigurationRecord newWithDictionaryRepresentation:context:](DNDSModeConfigurationRecord, "newWithDictionaryRepresentation:context:", *(void *)(*((void *)&v18 + 1) + 8 * v14), v7, (void)v18);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  long long v16 = (void *)[objc_alloc((Class)a1) _initWithModeConfigurations:v9];
  return v16;
}

+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v26 = v7;
  id v10 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"modeConfigurations", objc_opt_class());
  v25 = v8;
  uint64_t v11 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"secureModeConfigurations", objc_opt_class());
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        long long v19 = [v13 objectForKeyedSubscript:v18];
        long long v20 = [v11 objectForKeyedSubscript:v18];
        id v21 = +[DNDSModeConfigurationRecord newWithDictionaryRepresentation:v19 partitionedDictionaryRepresentation:v20 context:v9];
        [v12 addObject:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  objc_super v22 = (void *)[objc_alloc((Class)a1) _initWithModeConfigurations:v12];
  return v22;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = v5;
  if ([v4 partitionType])
  {
    id v6 = (void *)[v4 mutableCopy];
    [v6 setPartitionType:1];
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v29 = self;
    id v8 = [(NSMutableDictionary *)self->_modeConfigurationsByModeIdentifier allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v14 = [v13 dictionaryRepresentationWithContext:v6];
          uint64_t v15 = [v13 mode];
          uint64_t v16 = [v15 modeIdentifier];
          [v7 setObject:v14 forKeyedSubscript:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v10);
    }

    id v5 = v30;
    [v30 setObject:v7 forKeyedSubscript:@"modeConfigurations"];

    self = v29;
  }
  if (([v4 partitionType] & 2) != 0)
  {
    long long v17 = (void *)[v4 mutableCopy];
    [v17 setPartitionType:2];
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v19 = [(NSMutableDictionary *)self->_modeConfigurationsByModeIdentifier allValues];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          v25 = [v24 dictionaryRepresentationWithContext:v4];
          v26 = [v24 mode];
          long long v27 = [v26 modeIdentifier];
          [v18 setObject:v25 forKeyedSubscript:v27];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v21);
    }

    id v5 = v30;
    [v30 setObject:v18 forKeyedSubscript:@"secureModeConfigurations"];
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end
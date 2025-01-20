@interface DNDSModeConfigurationTriggersRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5;
- (BOOL)isEqual:(id)a3;
- (DNDSModeConfigurationTriggersRecord)init;
- (NSArray)triggers;
- (NSString)description;
- (id)_initWithRecord:(id)a3;
- (id)_initWithTriggers:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSModeConfigurationTriggersRecord

- (DNDSModeConfigurationTriggersRecord)init
{
  return (DNDSModeConfigurationTriggersRecord *)[(DNDSModeConfigurationTriggersRecord *)self _initWithRecord:0];
}

- (id)_initWithTriggers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSModeConfigurationTriggersRecord;
  v5 = [(DNDSModeConfigurationTriggersRecord *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    triggers = v5->_triggers;
    v5->_triggers = (NSArray *)v6;
  }
  return v5;
}

- (id)_initWithRecord:(id)a3
{
  id v4 = [a3 triggers];
  id v5 = [(DNDSModeConfigurationTriggersRecord *)self _initWithTriggers:v4];

  return v5;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_triggers hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSModeConfigurationTriggersRecord *)a3;
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
      uint64_t v6 = [(DNDSModeConfigurationTriggersRecord *)self triggers];
      v7 = [(DNDSModeConfigurationTriggersRecord *)v5 triggers];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDSModeConfigurationTriggersRecord *)self triggers];
        if (v8)
        {
          objc_super v9 = [(DNDSModeConfigurationTriggersRecord *)v5 triggers];
          if (v9)
          {
            v10 = [(DNDSModeConfigurationTriggersRecord *)self triggers];
            v11 = [(DNDSModeConfigurationTriggersRecord *)v5 triggers];
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
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DNDSModeConfigurationTriggersRecord *)self triggers];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; triggers: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableModeConfigurationTriggersRecord alloc];
  return [(DNDSModeConfigurationTriggersRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = objc_msgSend(a3, "bs_safeArrayForKey:", @"triggers");
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "bs_safeStringForKey:", @"class");
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (([&unk_1F2A5DF60 containsObject:v14] & 1) != 0
          || [&unk_1F2A5DF78 containsObject:v14])
        {
          v15 = (void *)[NSClassFromString(v14) newWithDictionaryRepresentation:v13 context:v5];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v16 = (void *)[objc_alloc((Class)a1) initWithTriggers:v7];
  return v16;
}

+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v28 = a4;
  id v7 = a5;
  id v8 = objc_msgSend(a3, "bs_safeArrayForKey:", @"triggers");
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "bs_safeStringForKey:", @"class");
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (([&unk_1F2A5DF90 containsObject:v15] & 1) != 0
          || [&unk_1F2A5DFA8 containsObject:v15])
        {
          v16 = (void *)[NSClassFromString(v15) newWithDictionaryRepresentation:v14 context:v7];
          [v9 addObject:v16];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v11);
  }

  v17 = objc_msgSend(v28, "bs_safeArrayForKey:", @"triggers");
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        objc_msgSend(v22, "bs_safeStringForKey:", @"class");
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        if ([&unk_1F2A5DFC0 containsObject:v23])
        {
          uint64_t v24 = (void *)[NSClassFromString(v23) newWithDictionaryRepresentation:v22 context:v7];
          [v9 addObject:v24];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v19);
  }
  v25 = (void *)[objc_alloc((Class)a1) initWithTriggers:v9];

  return v25;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = self->_triggers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        if (objc_msgSend(v4, "partitionType", (void)v18))
        {
          int v14 = [&unk_1F2A5DFD8 containsObject:v13];
          if (([v4 partitionType] & 2) != 0)
          {
LABEL_12:
            if (([&unk_1F2A5DFF0 containsObject:v13] & 1) == 0) {
              goto LABEL_14;
            }
LABEL_13:
            v15 = [v11 dictionaryRepresentationWithContext:v4];
            [v5 addObject:v15];

            goto LABEL_14;
          }
          if (v14) {
            goto LABEL_13;
          }
        }
        else if (([v4 partitionType] & 2) != 0)
        {
          goto LABEL_12;
        }
LABEL_14:
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  long long v22 = @"triggers";
  v23 = v5;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  return v16;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void).cxx_destruct
{
}

@end
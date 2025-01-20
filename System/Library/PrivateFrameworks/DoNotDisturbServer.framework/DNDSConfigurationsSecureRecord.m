@interface DNDSConfigurationsSecureRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSConfigurationsSecureRecord)init;
- (NSDictionary)modeConfigurations;
- (NSString)description;
- (id)_initWithModeConfigurations:(id)a3;
- (id)_initWithRecord:(id)a3;
- (id)configurationForModeIdentifier:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSConfigurationsSecureRecord

- (DNDSConfigurationsSecureRecord)init
{
  return (DNDSConfigurationsSecureRecord *)[(DNDSConfigurationsSecureRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  v4 = [a3 modeConfigurations];
  id v5 = [(DNDSConfigurationsSecureRecord *)self _initWithModeConfigurations:v4];

  return v5;
}

- (id)_initWithModeConfigurations:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSConfigurationsSecureRecord;
  id v5 = [(DNDSConfigurationsSecureRecord *)&v11 init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    v7 = v6;
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    modeConfigurations = v5->_modeConfigurations;
    v5->_modeConfigurations = v8;
  }
  return v5;
}

- (id)configurationForModeIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_modeConfigurations objectForKey:a3];
}

- (unint64_t)hash
{
  v2 = [(DNDSConfigurationsSecureRecord *)self modeConfigurations];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSConfigurationsSecureRecord *)a3;
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
      v6 = [(DNDSConfigurationsSecureRecord *)self modeConfigurations];
      v7 = [(DNDSConfigurationsSecureRecord *)v5 modeConfigurations];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDSConfigurationsSecureRecord *)self modeConfigurations];
        if (v8)
        {
          v9 = [(DNDSConfigurationsSecureRecord *)v5 modeConfigurations];
          if (v9)
          {
            v10 = [(DNDSConfigurationsSecureRecord *)self modeConfigurations];
            objc_super v11 = [(DNDSConfigurationsSecureRecord *)v5 modeConfigurations];
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
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DNDSConfigurationsSecureRecord *)self modeConfigurations];
  v6 = [v3 stringWithFormat:@"<%@: %p; modeConfigurations: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableConfigurationsSecureRecord alloc];
  return [(DNDSConfigurationsSecureRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  v17 = (objc_class *)a1;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 objectForKey:@"modeConfigurations"];
  v7 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v6 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v6, "objectForKey:", v12, v17);
        id v14 = +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:v13 context:v5];

        [v7 setObject:v14 forKey:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  v15 = (void *)[[v17 alloc] _initWithModeConfigurations:v7];
  return v15;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if (([v4 partitionType] & 2) != 0)
  {
    v18 = v5;
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = [(DNDSConfigurationsSecureRecord *)self modeConfigurations];
    uint64_t v8 = [v7 allKeys];

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
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v14 = [(DNDSConfigurationsSecureRecord *)self modeConfigurations];
          v15 = [v14 objectForKey:v13];

          v16 = [v15 dictionaryRepresentationWithContext:v4];
          [v6 setObject:v16 forKey:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    id v5 = v18;
    [v18 setObject:v6 forKey:@"modeConfigurations"];
  }
  return v5;
}

- (NSDictionary)modeConfigurations
{
  return &self->_modeConfigurations->super;
}

- (void).cxx_destruct
{
}

@end
@interface TKTokenKeychainContents
- (NSArray)items;
- (NSDictionary)certificates;
- (NSDictionary)keys;
- (NSString)tokenID;
- (TKTokenConfiguration)configuration;
- (TKTokenKeychainCertificate)certificateForObjectID:(TKTokenObjectID)objectID error:(NSError *)error;
- (TKTokenKeychainContents)initWithConfiguration:(id)a3;
- (TKTokenKeychainContents)initWithTokenID:(id)a3;
- (TKTokenKeychainKey)keyForObjectID:(TKTokenObjectID)objectID error:(NSError *)error;
- (id)certificateForKey:(id)a3;
- (void)fillWithItems:(NSArray *)items;
@end

@implementation TKTokenKeychainContents

- (TKTokenKeychainContents)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKTokenKeychainContents;
  v6 = [(TKTokenKeychainContents *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (TKTokenKeychainContents)initWithTokenID:(id)a3
{
  id v5 = a3;
  v6 = [[TKTokenID alloc] initWithTokenID:v5];

  v7 = +[TKTokenDriverConfiguration driverConfigurations];
  v8 = [(TKTokenID *)v6 classID];
  objc_super v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TKTokenKeychainItem.m", 522, @"Failed to get driver configuration for %@", v6 object file lineNumber description];
  }
  v10 = [v9 tokenConfigurations];
  v11 = [(TKTokenID *)v6 instanceID];
  v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12)
  {
    v13 = [(TKTokenID *)v6 instanceID];
    v12 = [v9 addTokenConfigurationForTokenInstanceID:v13];
  }
  v14 = [(TKTokenKeychainContents *)self initWithConfiguration:v12];

  return v14;
}

- (void)fillWithItems:(NSArray *)items
{
  v4 = items;
  id v5 = [(TKTokenKeychainContents *)self configuration];
  [v5 setKeychainItems:v4];

  v6 = self->_items;
  self->_items = v4;
}

- (NSArray)items
{
  items = self->_items;
  if (!items)
  {
    v4 = [(TKTokenKeychainContents *)self configuration];
    id v5 = [v4 keychainItems];
    v6 = self->_items;
    self->_items = v5;

    items = self->_items;
  }

  return items;
}

- (NSDictionary)certificates
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(TKTokenKeychainContents *)self items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v9 objectID];
          [v3 setObject:v9 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = (void *)[v3 copy];

  return (NSDictionary *)v11;
}

- (NSDictionary)keys
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(TKTokenKeychainContents *)self items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v9 objectID];
          [v3 setObject:v9 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = (void *)[v3 copy];

  return (NSDictionary *)v11;
}

- (TKTokenKeychainCertificate)certificateForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  TKTokenObjectID v6 = objectID;
  uint64_t v7 = [(TKTokenKeychainContents *)self certificates];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = TK_LOG_token_2();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TKTokenConfiguration keyForObjectID:error:]((uint64_t)v6, self);
    }

    if (error)
    {
      *error = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:MEMORY[0x1E4F1CC08]];
    }
  }

  return (TKTokenKeychainCertificate *)v8;
}

- (TKTokenKeychainKey)keyForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  TKTokenObjectID v6 = objectID;
  uint64_t v7 = [(TKTokenKeychainContents *)self keys];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = TK_LOG_token_2();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TKTokenConfiguration certificateForObjectID:error:]((uint64_t)v6, self);
    }

    if (error)
    {
      *error = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:MEMORY[0x1E4F1CC08]];
    }
  }

  return (TKTokenKeychainKey *)v8;
}

- (id)certificateForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(TKTokenKeychainContents *)self items];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v4 publicKeyHash];
          v11 = [v9 publicKeyHash];
          char v12 = [v10 isEqualToData:v11];

          if (v12)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (TKTokenConfiguration)configuration
{
  return (TKTokenConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)tokenID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end
@interface HMApplicationData
+ (NSSet)allowedObjectClasses;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (HMApplicationData)init;
- (HMApplicationData)initWithContentsOfDictionary:(id)a3;
- (HMApplicationData)initWithDictionaryFromCoder:(id)a3 key:(id)a4;
- (NSArray)allKeys;
- (NSArray)allValues;
- (NSDictionary)dictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)objectForKey:(id)a3;
- (unint64_t)hash;
- (void)setDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)validateObject:(uint64_t)a1;
@end

@implementation HMApplicationData

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(HMApplicationData *)self dictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)dictionary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_applicationData copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (HMApplicationData)init
{
  return [(HMApplicationData *)self initWithContentsOfDictionary:0];
}

- (HMApplicationData)initWithDictionaryFromCoder:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() allowedObjectClasses];
  v9 = [v7 decodeObjectOfClasses:v8 forKey:v6];

  v10 = [(HMApplicationData *)self initWithContentsOfDictionary:v9];
  return v10;
}

- (HMApplicationData)initWithContentsOfDictionary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)HMApplicationData;
  v5 = [(HMApplicationData *)&v44 init];
  id v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v32 = v5;
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
      v33 = v4;
      v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      id v7 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"kAssetsKey");
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v35 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v41 != v35) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            v12 = objc_msgSend(v7, "hmf_dictionaryForKey:", v11);
            v13 = v12;
            if (v12)
            {
              v14 = v7;
              v15 = objc_msgSend(v12, "hmf_stringForKey:", @"kIdentifierKey");
              v16 = objc_msgSend(v13, "hmf_stringForKey:", @"kAssetURLKey");
              if (v16)
              {
                v17 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
              }
              else
              {
                v17 = 0;
              }
              v18 = objc_msgSend(v13, "hmf_dictionaryForKey:", @"kAssetMetadataKey");
              v19 = [[HMAsset alloc] initWithIdentifier:v15 metadata:v18 resourceURL:v17];
              [(NSMutableDictionary *)v34 setObject:v19 forKeyedSubscript:v11];

              id v7 = v14;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v9);
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v4 = v33;
      id v20 = v33;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v45 count:16];
      v22 = v34;
      if (v21)
      {
        uint64_t v23 = v21;
        uint64_t v24 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v20);
            }
            v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (([v26 isEqualToString:@"kAssetsKey"] & 1) == 0)
            {
              v27 = [v20 objectForKeyedSubscript:v26];
              [(NSMutableDictionary *)v34 setObject:v27 forKeyedSubscript:v26];
            }
          }
          uint64_t v23 = [v20 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v23);
      }

      uint64_t v28 = [(NSMutableDictionary *)v34 mutableCopy];
      id v6 = v32;
      applicationData = v32->_applicationData;
      v32->_applicationData = (NSMutableDictionary *)v28;
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
      v22 = v6->_applicationData;
      v6->_applicationData = (NSMutableDictionary *)v30;
    }
  }
  return v6;
}

+ (NSSet)allowedObjectClasses
{
  if (allowedObjectClasses__hmf_once_t0 != -1) {
    dispatch_once(&allowedObjectClasses__hmf_once_t0, &__block_literal_global_12349);
  }
  v2 = (void *)allowedObjectClasses__hmf_once_v1;

  return (NSSet *)v2;
}

- (void).cxx_destruct
{
}

uint64_t __41__HMApplicationData_allowedObjectClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  uint64_t v9 = allowedObjectClasses__hmf_once_v1;
  allowedObjectClasses__hmf_once_uint64_t v1 = v8;

  return MEMORY[0x1F41817F8](v8, v9);
}

- (id)dictionaryRepresentation
{
  uint64_t v2 = [(HMApplicationData *)self dictionary];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __45__HMApplicationData_dictionaryRepresentation__block_invoke;
  v13 = &unk_1E593F310;
  id v5 = v4;
  id v14 = v5;
  id v6 = v3;
  id v15 = v6;
  [v2 enumerateKeysAndObjectsUsingBlock:&v10];
  if (objc_msgSend(v5, "count", v10, v11, v12, v13))
  {
    uint64_t v7 = (void *)[v5 copy];
    [v6 setObject:v7 forKeyedSubscript:@"kAssetsKey"];
  }
  uint64_t v8 = (void *)[v6 copy];

  return v8;
}

void __45__HMApplicationData_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 dictionaryRepresentation];

    uint64_t v10 = (id *)(a1 + 32);
    uint64_t v8 = (void *)v9;
  }
  else
  {
    uint64_t v10 = (id *)(a1 + 40);
    uint64_t v9 = (uint64_t)v5;
  }
  [*v10 setObject:v9 forKeyedSubscript:v11];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [HMApplicationData alloc];
  id v5 = [(HMApplicationData *)self dictionary];
  id v6 = [(HMApplicationData *)v4 initWithContentsOfDictionary:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = [(HMApplicationData *)self dictionary];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMApplicationData *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(HMApplicationData *)self dictionary];
      id v7 = [(HMApplicationData *)v5 dictionary];

      char v8 = HMFEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void)setDictionary:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    -[HMApplicationData validateObject:]((uint64_t)self, v4);
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    [(NSMutableDictionary *)self->_applicationData setDictionary:v6];
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    [(NSMutableDictionary *)self->_applicationData removeAllObjects];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)validateObject:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v23 != v7) {
              objc_enumerationMutation(v4);
            }
            -[HMApplicationData validateObject:](a1, *(void *)(*((void *)&v22 + 1) + 8 * i));
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v6);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v3;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __36__HMApplicationData_validateObject___block_invoke;
        v19[3] = &unk_1E593F2E8;
        id v20 = v9;
        uint64_t v21 = a1;
        [v9 enumerateKeysAndObjectsUsingBlock:v19];
        id v4 = v20;
      }
      else
      {
        [(id)objc_opt_class() allowedObjectClasses];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v4 countByEnumeratingWithState:&v15 objects:v26 count:16];
        if (!v10) {
          goto LABEL_21;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
LABEL_15:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v4);
          }
          if (objc_opt_isKindOfClass()) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [v4 countByEnumeratingWithState:&v15 objects:v26 count:16];
            if (!v11)
            {
LABEL_21:

              [NSString stringWithFormat:@"Unsupported data type %@ - allowed %@", objc_opt_class(), v4, v15];
              id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
              objc_exception_throw(v14);
            }
            goto LABEL_15;
          }
        }
      }
    }
  }
}

void __36__HMApplicationData_validateObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [NSString stringWithFormat:@"Unsupported dictionary key type %@, must be NSString", objc_opt_class()];
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v6);
  }
  -[HMApplicationData validateObject:](*(void *)(a1 + 40), v5);
}

- (BOOL)isEmpty
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = [(NSMutableDictionary *)v2->_applicationData count] == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    -[HMApplicationData validateObject:]((uint64_t)self, v8);
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    [(NSMutableDictionary *)self->_applicationData setObject:v8 forKey:v6];
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    [(NSMutableDictionary *)self->_applicationData removeObjectForKey:v6];
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)allValues
{
  uint64_t v2 = [(HMApplicationData *)self dictionary];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)allKeys
{
  uint64_t v2 = [(HMApplicationData *)self dictionary];
  id v3 = [v2 allKeys];

  return (NSArray *)v3;
}

@end
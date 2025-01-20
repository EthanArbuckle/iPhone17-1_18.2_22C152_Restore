@interface APSettingsStorageCloud
- (APSettingsStorageCloud)initWithDefaultValues:(id)a3;
- (APSettingsStorageCloud)initWithDefaultValues:(id)a3 shouldUseLocalPersistance:(BOOL)a4 forSubclass:(Class)a5;
- (BOOL)useLocalPersistance;
- (NSDictionary)defaults;
- (NSMutableDictionary)cloudStore;
- (NSString)settingsClassNameForCloud;
- (NSString)settingsClassNameForEFS;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)persistLocallyIfNeeded;
- (void)setCloudStore:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)synchronize;
- (void)updateCloudStore:(id)a3;
@end

@implementation APSettingsStorageCloud

- (APSettingsStorageCloud)initWithDefaultValues:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"initWithDefaultValues: is not available on APSettingsStorageCloud. Please use initWithDefaultValues:shouldUseLocalPersistance:forSubclass: instead."];
  v5 = APLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_ERROR, "Error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (APSettingsStorageCloud)initWithDefaultValues:(id)a3 shouldUseLocalPersistance:(BOOL)a4 forSubclass:(Class)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v40.receiver = self;
  v40.super_class = (Class)APSettingsStorageCloud;
  v8 = [(APSettingsStorageCloud *)&v40 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    defaults = v8->_defaults;
    v8->_defaults = (NSDictionary *)v9;

    v8->_useLocalPersistance = a4;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v12 sha256hash];
    if ((unint64_t)[v13 length] >= 9)
    {
      uint64_t v14 = [v13 substringToIndex:8];

      v13 = (void *)v14;
    }
    uint64_t v15 = [NSString stringWithFormat:@"cloud/%@", v13];
    settingsClassNameForEFS = v8->_settingsClassNameForEFS;
    v8->_settingsClassNameForEFS = (NSString *)v15;

    uint64_t v17 = [NSString stringWithFormat:@"%@", v13];
    settingsClassNameForCloud = v8->_settingsClassNameForCloud;
    v8->_settingsClassNameForCloud = (NSString *)v17;

    v19 = [MEMORY[0x1E4F29130] defaultStore];
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v8 selector:sel_updateCloudStore_ name:*MEMORY[0x1E4F28A30] object:v19];

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    cloudStore = v8->_cloudStore;
    v8->_cloudStore = (NSMutableDictionary *)v21;

    if (!v8->_useLocalPersistance) {
      goto LABEL_19;
    }
    v23 = objc_alloc_init(APStorageManager);
    v24 = v8->_settingsClassNameForEFS;
    id v39 = 0;
    BOOL v25 = [(APStorageManager *)v23 fileExistsAtPath:v24 error:&v39];
    id v26 = v39;
    if (v26)
    {
      v27 = APLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v26;
        _os_log_impl(&dword_1D70B2000, v27, OS_LOG_TYPE_ERROR, "Error finding local cloud object: %{public}@", buf, 0xCu);
      }
    }
    if (v25)
    {
      v28 = v8->_settingsClassNameForEFS;
      id v37 = 0;
      v29 = [(APStorageManager *)v23 objectStoredAtPath:v28 error:&v37];
      id v30 = v37;
      uint64_t v31 = [v29 mutableCopy];
      v32 = v8->_cloudStore;
      v8->_cloudStore = (NSMutableDictionary *)v31;

      if (v30)
      {
        v33 = APLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = v30;
          _os_log_impl(&dword_1D70B2000, v33, OS_LOG_TYPE_ERROR, "Error finding EFS Settings object: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      v34 = (void *)[(NSMutableDictionary *)v8->_cloudStore copy];
      v35 = v8->_settingsClassNameForEFS;
      id v38 = 0;
      [(APStorageManager *)v23 storeObject:v34 atPath:v35 error:&v38];
      id v30 = v38;

      if (!v30)
      {
LABEL_18:

LABEL_19:
        [v19 synchronize];

        goto LABEL_20;
      }
      v29 = APLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v30;
        _os_log_impl(&dword_1D70B2000, v29, OS_LOG_TYPE_ERROR, "Error storing local cloud object: %{public}@", buf, 0xCu);
      }
    }

    goto LABEL_18;
  }
LABEL_20:

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F28A30];
  v5 = [MEMORY[0x1E4F29130] defaultStore];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)APSettingsStorageCloud;
  [(APSettingsStorageCloud *)&v6 dealloc];
}

- (void)persistLocallyIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(APSettingsStorageCloud *)self useLocalPersistance])
  {
    v3 = objc_alloc_init(APStorageManager);
    uint64_t v4 = [(APSettingsStorageCloud *)self cloudStore];
    v5 = [(APSettingsStorageCloud *)self settingsClassNameForEFS];
    id v8 = 0;
    [(APStorageManager *)v3 storeObject:v4 atPath:v5 error:&v8];
    id v6 = v8;

    if (v6)
    {
      id v7 = APLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v6;
        _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "Error storing local cloud object: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)updateCloudStore:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userInfo];
  v5 = [v4 objectForKey:*MEMORY[0x1E4F28A20]];
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 integerValue];
    if (v7 > 1)
    {
      if (v7 != 2) {
        goto LABEL_17;
      }
      id v10 = APLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "Received quota violation for iCloud Key Value store", buf, 2u);
      }
    }
    else
    {
      uint64_t v21 = v6;
      id v8 = [v4 objectForKey:*MEMORY[0x1E4F28A28]];
      uint64_t v9 = [MEMORY[0x1E4F29130] defaultStore];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            v16 = [(APSettingsStorageCloud *)self settingsClassNameForCloud];
            int v17 = [v15 isEqualToString:v16];

            if (v17)
            {
              v18 = (void *)MEMORY[0x1E4F1CA60];
              v19 = [v9 objectForKey:v15];
              v20 = [v18 dictionaryWithDictionary:v19];
              [(APSettingsStorageCloud *)self setCloudStore:v20];

              [(APSettingsStorageCloud *)self persistLocallyIfNeeded];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v12);
      }

      id v6 = v21;
    }
  }
LABEL_17:
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_valueForKey_error_);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(APSettingsStorageCloud *)self cloudStore];
  unint64_t v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = [(APSettingsStorageCloud *)self defaults];
    id v10 = [v5 lastNamespacedComponent];
    id v8 = [v9 objectForKey:v10];
  }
  return v8;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = [(APSettingsStorageCloud *)self defaults];
  uint64_t v9 = [v7 lastNamespacedComponent];
  id v10 = [v8 objectForKey:v9];

  uint64_t v11 = [(APSettingsStorageCloud *)self settingsClassNameForCloud];
  uint64_t v12 = [(APSettingsStorageCloud *)self cloudStore];
  uint64_t v13 = [MEMORY[0x1E4F29130] defaultStore];
  int v14 = [v10 isEqual:v15];
  if (!v15 || v14) {
    [v12 setValue:0 forKey:v7];
  }
  else {
    [v12 setObject:v15 forKey:v7];
  }

  [(APSettingsStorageCloud *)self persistLocallyIfNeeded];
  [v13 setObject:v12 forKey:v11];
  [(APSettingsStorageCloud *)self synchronize];
}

- (void)synchronize
{
  id v2 = [MEMORY[0x1E4F29130] defaultStore];
  [v2 synchronize];
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (NSMutableDictionary)cloudStore
{
  return self->_cloudStore;
}

- (void)setCloudStore:(id)a3
{
}

- (BOOL)useLocalPersistance
{
  return self->_useLocalPersistance;
}

- (NSString)settingsClassNameForCloud
{
  return self->_settingsClassNameForCloud;
}

- (NSString)settingsClassNameForEFS
{
  return self->_settingsClassNameForEFS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsClassNameForEFS, 0);
  objc_storeStrong((id *)&self->_settingsClassNameForCloud, 0);
  objc_storeStrong((id *)&self->_cloudStore, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
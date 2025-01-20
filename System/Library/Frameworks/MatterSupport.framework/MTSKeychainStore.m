@interface MTSKeychainStore
+ (id)logCategory;
- (BOOL)removeAllDataWithError:(id *)a3;
- (BOOL)removeDataForKey:(id)a3 error:(id *)a4;
- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5;
- (MTSKeychainStore)initWithScope:(id)a3;
- (MTSKeychainStore)initWithScope:(id)a3 dataSource:(id)a4;
- (MTSKeychainStoreDataSource)dataSource;
- (NSDictionary)allDataByKey;
- (NSString)scope;
- (id)attributeDictionaryForAddingData:(id)a3 forKey:(id)a4;
- (id)attributeDictionaryForUpdatingData:(id)a3;
- (id)dataForKey:(id)a3;
- (id)queryDictionaryForKey:(id)a3 isExpectingReturnData:(BOOL)a4;
@end

@implementation MTSKeychainStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_scope, 0);
}

- (MTSKeychainStoreDataSource)dataSource
{
  return (MTSKeychainStoreDataSource *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)scope
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDictionaryForUpdatingData:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F175A8];
  v8[0] = a3;
  v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)attributeDictionaryForAddingData:(id)a3 forKey:(id)a4
{
  v17[8] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F171C8];
  uint64_t v7 = *MEMORY[0x263F16E80];
  v16[0] = *MEMORY[0x263F171B8];
  v16[1] = v7;
  v17[0] = v6;
  v17[1] = @"com.apple.matter.support";
  v16[2] = *MEMORY[0x263F17090];
  id v8 = a4;
  id v9 = a3;
  v10 = [(MTSKeychainStore *)self scope];
  uint64_t v11 = *MEMORY[0x263F170B0];
  v17[2] = v10;
  v17[3] = MEMORY[0x263EFFA88];
  uint64_t v12 = *MEMORY[0x263F16E90];
  v16[3] = v11;
  v16[4] = v12;
  v17[4] = *MEMORY[0x263F16E98];
  v17[5] = MEMORY[0x263EFFA88];
  uint64_t v13 = *MEMORY[0x263F16ED8];
  v16[5] = *MEMORY[0x263F16F38];
  v16[6] = v13;
  v16[7] = *MEMORY[0x263F175A8];
  v17[6] = v8;
  v17[7] = v9;
  v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:8];

  return v14;
}

- (id)queryDictionaryForKey:(id)a3 isExpectingReturnData:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  id v8 = [v6 dictionary];
  [v8 setObject:*MEMORY[0x263F171C8] forKeyedSubscript:*MEMORY[0x263F171B8]];
  [v8 setObject:@"com.apple.matter.support" forKeyedSubscript:*MEMORY[0x263F16E80]];
  id v9 = [(MTSKeychainStore *)self scope];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F17090]];

  [v8 setObject:*MEMORY[0x263F170B8] forKeyedSubscript:*MEMORY[0x263F170B0]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x263F16ED8]];

  if (v4)
  {
    uint64_t v10 = MEMORY[0x263EFFA88];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F17520]];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F17518]];
    uint64_t v11 = (void *)MEMORY[0x263F17410];
    if (!v7) {
      uint64_t v11 = (void *)MEMORY[0x263F17408];
    }
    [v8 setObject:*v11 forKeyedSubscript:*MEMORY[0x263F17400]];
  }
  uint64_t v12 = (void *)[v8 copy];

  return v12;
}

- (BOOL)removeAllDataWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x245697870](self, a2);
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_2450FD000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing all data", buf, 0xCu);
  }
  id v9 = [(MTSKeychainStore *)v6 queryDictionaryForKey:0 isExpectingReturnData:0];
  uint64_t v10 = (void *)MEMORY[0x245697870]();
  uint64_t v11 = v6;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    __int16 v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Removing all keychain items matching query: %@", buf, 0x16u);
  }
  v14 = [(MTSKeychainStore *)v11 dataSource];
  id v23 = 0;
  char v15 = [v14 removeItemsMatchingQuery:v9 error:&v23];
  id v16 = v23;

  if ((v15 & 1) != 0 || [v16 code] == -25300)
  {
    BOOL v17 = 1;
  }
  else
  {
    v19 = (void *)MEMORY[0x245697870]();
    v20 = v11;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v25 = v22;
      __int16 v26 = 2112;
      v27 = v9;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_2450FD000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all keychain items %@: %@", buf, 0x20u);
    }
    BOOL v17 = 0;
    if (a3) {
      *a3 = v16;
    }
  }

  return v17;
}

- (BOOL)removeDataForKey:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x245697870]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing data for key: %@", buf, 0x16u);
  }
  uint64_t v11 = [(MTSKeychainStore *)v8 queryDictionaryForKey:v6 isExpectingReturnData:0];
  uint64_t v12 = (void *)MEMORY[0x245697870]();
  uint64_t v13 = v8;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    char v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v27 = v15;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_2450FD000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Removing keychain item matching query: %@", buf, 0x16u);
  }
  id v16 = [(MTSKeychainStore *)v13 dataSource];
  id v25 = 0;
  char v17 = [v16 removeItemsMatchingQuery:v11 error:&v25];
  id v18 = v25;

  if ((v17 & 1) != 0 || [v18 code] == -25300)
  {
    BOOL v19 = 1;
  }
  else
  {
    v21 = (void *)MEMORY[0x245697870]();
    v22 = v13;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v27 = v24;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl(&dword_2450FD000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove keychain item with query %@: %@", buf, 0x20u);
    }
    BOOL v19 = 0;
    if (a4) {
      *a4 = v18;
    }
  }

  return v19;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x245697870]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v41 = v13;
    __int16 v42 = 2112;
    id v43 = v9;
    _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting data for key: %@", buf, 0x16u);
  }
  v14 = [(MTSKeychainStore *)v11 attributeDictionaryForAddingData:v8 forKey:v9];
  char v15 = (void *)MEMORY[0x245697870]();
  id v16 = v11;
  char v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v41 = v18;
    __int16 v42 = 2112;
    id v43 = v14;
    _os_log_impl(&dword_2450FD000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Adding keychain item with attributes: %@", buf, 0x16u);
  }
  BOOL v19 = [(MTSKeychainStore *)v16 dataSource];
  id v39 = 0;
  char v20 = [v19 addItemWithAttributes:v14 error:&v39];
  id v21 = v39;

  if (v20)
  {
    BOOL v22 = 1;
LABEL_19:
    v24 = v14;
    goto LABEL_20;
  }
  if ([v21 code] != -25299)
  {
    __int16 v28 = (void *)MEMORY[0x245697870]();
    id v29 = v16;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v41 = v31;
      __int16 v42 = 2112;
      id v43 = v14;
      __int16 v44 = 2112;
      id v45 = v21;
      _os_log_impl(&dword_2450FD000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to add keychain item with attributes %@: %@", buf, 0x20u);
    }
    BOOL v22 = 0;
    if (a5) {
      *a5 = v21;
    }
    goto LABEL_19;
  }
  id v23 = [(MTSKeychainStore *)v16 queryDictionaryForKey:v9 isExpectingReturnData:0];
  v24 = [(MTSKeychainStore *)v16 attributeDictionaryForUpdatingData:v8];

  id v25 = [(MTSKeychainStore *)v16 dataSource];
  id v38 = 0;
  char v26 = [v25 updateItemMatchingQuery:v23 withAttributes:v24 error:&v38];
  id v27 = v38;

  if (v26)
  {

    BOOL v22 = 1;
  }
  else
  {
    uint64_t v32 = (void *)MEMORY[0x245697870]();
    v33 = v16;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = v37 = v32;
      *(_DWORD *)buf = 138544130;
      v41 = v35;
      __int16 v42 = 2112;
      id v43 = v23;
      __int16 v44 = 2112;
      id v45 = v24;
      __int16 v46 = 2112;
      id v47 = v27;
      _os_log_impl(&dword_2450FD000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to update keychain item with query %@ and attributes %@: %@", buf, 0x2Au);

      uint64_t v32 = v37;
    }

    if (a5) {
      *a5 = v27;
    }

    BOOL v22 = 0;
  }
LABEL_20:

  return v22;
}

- (NSDictionary)allDataByKey
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = [(MTSKeychainStore *)self queryDictionaryForKey:0 isExpectingReturnData:1];
  BOOL v4 = [(MTSKeychainStore *)self dataSource];
  id v40 = 0;
  v5 = [v4 resultMatchingQuery:v3 error:&v40];
  id v6 = v40;

  if (v5)
  {
    id v7 = v5;
    objc_opt_class();
    int v8 = objc_opt_isKindOfClass() & 1;
    if (v8) {
      id v9 = v7;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v8)
    {
      id v34 = v6;
      v35 = v3;
      uint64_t v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v12 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v37;
        uint64_t v15 = *MEMORY[0x263F16ED8];
        uint64_t v16 = *MEMORY[0x263F175A8];
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v37 != v14) {
              objc_enumerationMutation(v10);
            }
            id v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            BOOL v19 = [v18 objectForKeyedSubscript:v15];
            char v20 = [v18 objectForKeyedSubscript:v16];
            [v11 setObject:v20 forKeyedSubscript:v19];
          }
          uint64_t v13 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v13);
      }

      id v21 = (void *)[v11 copy];
      id v6 = v34;
      v3 = v35;
    }
    else
    {
      char v26 = (void *)MEMORY[0x245697870]();
      id v27 = self;
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = id v29 = v6;
        id v31 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v43 = v30;
        __int16 v44 = 2112;
        id v45 = v31;
        __int16 v46 = 2112;
        id v47 = v7;
        id v32 = v31;
        _os_log_impl(&dword_2450FD000, v28, OS_LOG_TYPE_ERROR, "%{public}@Keychain item query result was of unexpected class %@: %@", buf, 0x20u);

        id v6 = v29;
      }

      id v21 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    if ([v6 code] != -25300)
    {
      BOOL v22 = (void *)MEMORY[0x245697870]();
      id v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v43 = v25;
        __int16 v44 = 2112;
        id v45 = v6;
        _os_log_impl(&dword_2450FD000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to query all keychain items: %@", buf, 0x16u);
      }
    }
    id v21 = (void *)MEMORY[0x263EFFA78];
  }

  return (NSDictionary *)v21;
}

- (id)dataForKey:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTSKeychainStore *)self queryDictionaryForKey:v4 isExpectingReturnData:1];
  id v6 = [(MTSKeychainStore *)self dataSource];
  id v25 = 0;
  id v7 = [v6 resultMatchingQuery:v5 error:&v25];
  id v8 = v25;

  if (v7)
  {
    id v9 = v7;
    objc_opt_class();
    int v10 = objc_opt_isKindOfClass() & 1;
    if (v10) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v10)
    {
      uint64_t v13 = [v9 objectForKeyedSubscript:*MEMORY[0x263F175A8]];
    }
    else
    {
      id v18 = (void *)MEMORY[0x245697870]();
      BOOL v19 = self;
      char v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = HMFGetLogIdentifier();
        BOOL v22 = objc_opt_class();
        *(_DWORD *)buf = 138544130;
        id v27 = v21;
        __int16 v28 = 2112;
        id v29 = v4;
        __int16 v30 = 2112;
        id v31 = v22;
        __int16 v32 = 2112;
        id v33 = v9;
        id v23 = v22;
        _os_log_impl(&dword_2450FD000, v20, OS_LOG_TYPE_ERROR, "%{public}@Keychain item query result for key %@ was of unexpected class %@: %@", buf, 0x2Au);
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    if ([v8 code] != -25300)
    {
      uint64_t v14 = (void *)MEMORY[0x245697870]();
      uint64_t v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        char v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v27 = v17;
        __int16 v28 = 2112;
        id v29 = v4;
        __int16 v30 = 2112;
        id v31 = v8;
        _os_log_impl(&dword_2450FD000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to query keychain item for key %@: %@", buf, 0x20u);
      }
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (MTSKeychainStore)initWithScope:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v8 = v7;
  if (!v7)
  {
LABEL_7:
    uint64_t v13 = (MTSKeychainStore *)_HMFPreconditionFailure();
    return [(MTSKeychainStore *)v13 initWithScope:v15];
  }
  v16.receiver = self;
  v16.super_class = (Class)MTSKeychainStore;
  id v9 = [(MTSKeychainStore *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    scope = v9->_scope;
    v9->_scope = (NSString *)v10;

    objc_storeStrong((id *)&v9->_dataSource, a4);
  }

  return v9;
}

- (MTSKeychainStore)initWithScope:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    id v6 = objc_alloc_init(MTSKeychainStoreDataSource);
    id v7 = [(MTSKeychainStore *)self initWithScope:v5 dataSource:v6];

    return v7;
  }
  else
  {
    id v9 = (void *)_HMFPreconditionFailure();
    return (MTSKeychainStore *)+[MTSKeychainStore logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20 != -1) {
    dispatch_once(&logCategory__hmf_once_t20, &__block_literal_global);
  }
  v2 = (void *)logCategory__hmf_once_v21;

  return v2;
}

uint64_t __31__MTSKeychainStore_logCategory__block_invoke()
{
  logCategory__hmf_once_id v21 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

@end
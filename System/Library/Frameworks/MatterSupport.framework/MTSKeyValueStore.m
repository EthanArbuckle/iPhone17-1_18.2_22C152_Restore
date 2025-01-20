@interface MTSKeyValueStore
+ (id)logCategory;
- (BOOL)removeAllStoredValuesWithError:(id *)a3;
- (BOOL)removeStoredValueForKey:(id)a3 error:(id *)a4;
- (BOOL)setStoredValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (MTSKeyValueStore)init;
- (MTSKeyValueStore)initWithKeychainStore:(id)a3;
- (MTSKeychainStore)keychainStore;
- (NSDictionary)storedValuesByKey;
- (id)storedValueForKey:(id)a3;
@end

@implementation MTSKeyValueStore

- (void).cxx_destruct
{
}

- (MTSKeychainStore)keychainStore
{
  return (MTSKeychainStore *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)removeAllStoredValuesWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x245697870](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_impl(&dword_2450FD000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing all values", buf, 0xCu);
  }
  v9 = [(MTSKeyValueStore *)v6 keychainStore];
  id v17 = 0;
  char v10 = [v9 removeAllDataWithError:&v17];
  id v11 = v17;

  if ((v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x245697870]();
    v13 = v6;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_2450FD000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all values: %@", buf, 0x16u);
    }
    if (a3) {
      *a3 = v11;
    }
  }

  return v10;
}

- (BOOL)removeStoredValueForKey:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x245697870]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing value for key: %@", buf, 0x16u);
  }
  id v11 = [(MTSKeyValueStore *)v8 keychainStore];
  id v19 = 0;
  char v12 = [v11 removeDataForKey:v6 error:&v19];
  id v13 = v19;

  if ((v12 & 1) == 0)
  {
    v14 = (void *)MEMORY[0x245697870]();
    v15 = v8;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v21 = v17;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl(&dword_2450FD000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove value for key %@: %@", buf, 0x20u);
    }
    if (a4) {
      *a4 = v13;
    }
  }

  return v12;
}

- (BOOL)setStoredValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v10 = (void *)MEMORY[0x245697870]();
  id v11 = self;
  char v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v13;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting value for key: %@", buf, 0x16u);
  }
  int v33 = 0;
  v14 = (void *)MEMORY[0x2456976E0](v8, 8, &v33);
  if (!v14)
  {
    if (v33)
    {
      id v19 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v20 = *MEMORY[0x263F08410];
      uint64_t v21 = v33;
      uint64_t v40 = *MEMORY[0x263F08320];
      uint64_t v22 = [NSString stringWithUTF8String:DebugGetErrorString()];
      id v23 = (void *)v22;
      __int16 v24 = @"?";
      if (v22) {
        __int16 v24 = (__CFString *)v22;
      }
      v41[0] = v24;
      id v25 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
      id v17 = (id)[v19 initWithDomain:v20 code:v21 userInfo:v25];
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v26 = (void *)MEMORY[0x245697870]();
    v27 = v11;
    v28 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v35 = v29;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v17;
    v30 = "%{public}@Failed to encode value %@: %@";
    goto LABEL_15;
  }
  v15 = [(MTSKeyValueStore *)v11 keychainStore];
  id v32 = 0;
  char v16 = [v15 setData:v14 forKey:v9 error:&v32];
  id v17 = v32;

  if (v16)
  {
    BOOL v18 = 1;
    goto LABEL_19;
  }
  uint64_t v26 = (void *)MEMORY[0x245697870]();
  v27 = v11;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v35 = v29;
    __int16 v36 = 2112;
    id v37 = v9;
    __int16 v38 = 2112;
    id v39 = v17;
    v30 = "%{public}@Failed to set value for key %@: %@";
LABEL_15:
    _os_log_impl(&dword_2450FD000, v28, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);
  }
LABEL_16:

  if (a5)
  {
    id v17 = v17;
    BOOL v18 = 0;
    *a5 = v17;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)storedValueForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTSKeyValueStore *)self keychainStore];
  id v6 = [v5 dataForKey:v4];

  if (v6)
  {
    v7 = (void *)OPACKDecodeData();
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      char v10 = (void *)MEMORY[0x245697870]();
      id v11 = self;
      char v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        char v16 = v13;
        __int16 v17 = 2112;
        BOOL v18 = v6;
        __int16 v19 = 2112;
        uint64_t v20 = 0;
        _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode encoded value %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSDictionary)storedValuesByKey
{
  v3 = [(MTSKeyValueStore *)self keychainStore];
  id v4 = [v3 allDataByKey];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__MTSKeyValueStore_storedValuesByKey__block_invoke;
  v7[3] = &unk_2651C5BD0;
  v7[4] = self;
  v5 = objc_msgSend(v4, "na_dictionaryByMappingValues:", v7);

  return (NSDictionary *)v5;
}

id __37__MTSKeyValueStore_storedValuesByKey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)OPACKDecodeData();
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    char v10 = (void *)MEMORY[0x245697870]();
    id v11 = *(id *)(a1 + 32);
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      char v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode encoded value %@: %@", buf, 0x20u);
    }
  }

  return v8;
}

- (MTSKeyValueStore)initWithKeychainStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSKeyValueStore;
  id v6 = [(MTSKeyValueStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychainStore, a3);
  }

  return v7;
}

- (MTSKeyValueStore)init
{
  v3 = [[MTSKeychainStore alloc] initWithScope:@"com.apple.matter.support.key.value"];
  id v4 = [(MTSKeyValueStore *)self initWithKeychainStore:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13 != -1) {
    dispatch_once(&logCategory__hmf_once_t13, &__block_literal_global_477);
  }
  v2 = (void *)logCategory__hmf_once_v14;

  return v2;
}

uint64_t __31__MTSKeyValueStore_logCategory__block_invoke()
{
  logCategory__hmf_once_v14 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

@end
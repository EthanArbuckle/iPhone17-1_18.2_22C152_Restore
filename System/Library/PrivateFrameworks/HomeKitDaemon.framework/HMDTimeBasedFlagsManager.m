@interface HMDTimeBasedFlagsManager
+ (NSSet)allowedSpecifierClasses;
- (HMDTimeBasedFlagsManager)initWithDateProvider:(id)a3;
- (HMDTimeBasedFlagsManager)initWithStorage:(id)a3 dateProvider:(id)a4;
- (HMDTimeBasedFlagsStoring)flagsStorage;
- (HMMDateProvider)dateProvider;
- (NSMutableDictionary)flags;
- (OS_dispatch_queue)workQueue;
- (id)_fetchAllFlags;
- (id)flagForName:(id)a3 homeUUID:(id)a4 periodicity:(int64_t)a5;
- (id)flagForName:(id)a3 periodicity:(int64_t)a4;
- (id)flagForSpecifier:(id)a3 periodicity:(int64_t)a4;
- (id)newFlagForPeriodicity:(int64_t)a3;
- (id)unarchiveFlags;
- (id)unarchiveLegacyFlags;
- (void)_save;
- (void)forceSave;
- (void)setDateProvider:(id)a3;
- (void)setFlags:(id)a3;
@end

@implementation HMDTimeBasedFlagsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_flagsStorage, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDTimeBasedFlagsStoring)flagsStorage
{
  return (HMDTimeBasedFlagsStoring *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFlags:(id)a3
{
}

- (NSMutableDictionary)flags
{
  return self->_flags;
}

- (void)setDateProvider:(id)a3
{
}

- (HMMDateProvider)dateProvider
{
  return (HMMDateProvider *)objc_getProperty(self, a2, 24, 1);
}

- (id)unarchiveLegacyFlags
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v3 = [(HMDTimeBasedFlagsManager *)self flagsStorage];
  v4 = [v3 unarchiveLegacyEventFlags];

  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"HMDEventFlagsArchivedEventFlagsKey"];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"HMDEventFlagsArchivedEventFlagsSaveTimeKey"];
    v7 = (void *)v6;
    if (v5 && v6)
    {
      v32 = v4;
      v37 = [MEMORY[0x263EFF9A0] dictionary];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id obj = [v5 allKeys];
      uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v35)
      {
        uint64_t v34 = *(void *)v43;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v43 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v36 = v8;
            uint64_t v9 = *(void *)(*((void *)&v42 + 1) + 8 * v8);
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            v10 = [v5 objectForKeyedSubscript:v9];
            v11 = [v10 allKeys];

            uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v39;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v39 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                  v17 = [v5 objectForKeyedSubscript:v9];
                  v18 = [v17 objectForKeyedSubscript:v16];

                  v19 = +[HMDTimeBasedFlagDaily convertLegacyFlagBits:v18 lastSaveTIme:v7];
                  if (v19)
                  {
                    v20 = +[HMDTimeBasedFlagNameSpecifier specifierWithFlagName:v16];
                    [v37 setObject:v19 forKey:v20];
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
              }
              while (v13);
            }

            uint64_t v8 = v36 + 1;
          }
          while (v36 + 1 != v35);
          uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v35);
      }

      if ([v37 count]) {
        v21 = v37;
      }
      else {
        v21 = 0;
      }
      id v22 = v21;

      v4 = v32;
    }
    else
    {
      v27 = (void *)MEMORY[0x230FBD990]();
      v28 = self;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v49 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Legacy flags missing data", buf, 0xCu);
      }
      id v22 = 0;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v49 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@No legacy event flags found", buf, 0xCu);
    }
    id v22 = 0;
  }

  return v22;
}

- (id)unarchiveFlags
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDTimeBasedFlagsManager *)self flagsStorage];
  v5 = [v4 unarchive];

  if (v5) {
    goto LABEL_5;
  }
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v23 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Loading legacy flags", buf, 0xCu);
  }
  uint64_t v10 = [(HMDTimeBasedFlagsManager *)v7 unarchiveLegacyFlags];
  v5 = (void *)v10;
  if (v10)
  {
LABEL_5:
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42__HMDTimeBasedFlagsManager_unarchiveFlags__block_invoke;
    v20[3] = &unk_264A15F20;
    v20[4] = self;
    id v21 = v3;
    [v5 enumerateKeysAndObjectsUsingBlock:v20];
  }
  v15 = (void *)MEMORY[0x230FBD990](v10, v11, v12, v13, v14);
  uint64_t v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v23 = v18;
    __int16 v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Final restored flags: %@", buf, 0x16u);
  }
  return v3;
}

void __42__HMDTimeBasedFlagsManager_unarchiveFlags__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"periodicity"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    if ([v8 integerValue] == 1)
    {
      uint64_t v9 = [HMDTimeBasedFlagDaily alloc];
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v10 dateProvider];
      uint64_t v12 = [(HMDTimeBasedFlagDaily *)v9 initWithSerializedFlag:v5 context:v10 dateProvider:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
    [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v13];
  }
}

- (void)_save
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(HMDTimeBasedFlagsManager *)self _fetchAllFlags];
  v4 = [(HMDTimeBasedFlagsManager *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__HMDTimeBasedFlagsManager__save__block_invoke;
  v6[3] = &unk_264A2F820;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __33__HMDTimeBasedFlagsManager__save__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) flagsStorage];
  [v2 archiveDictionary:*(void *)(a1 + 40)];
}

- (id)_fetchAllFlags
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  flags = self->_flags;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__HMDTimeBasedFlagsManager__fetchAllFlags__block_invoke;
  v8[3] = &unk_264A15EF8;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)flags enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

void __42__HMDTimeBasedFlagsManager__fetchAllFlags__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 serializeToDictionary];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (void)forceSave
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMDTimeBasedFlagsManager *)self _save];
  os_unfair_lock_unlock(p_lock);
}

- (id)newFlagForPeriodicity:(int64_t)a3
{
  if (a3 != 1) {
    return 0;
  }
  v4 = [HMDTimeBasedFlagDaily alloc];
  id v5 = [(HMDTimeBasedFlagsManager *)self dateProvider];
  id v6 = [(HMDTimeBasedFlagDaily *)v4 initWithContext:self dateProvider:v5];

  return v6;
}

- (id)flagForSpecifier:(id)a3 periodicity:(int64_t)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v8 = [(HMDTimeBasedFlagsManager *)self flags];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    uint64_t v10 = +[HMDTimeBasedFlagsManager allowedSpecifierClasses];
    char v11 = [v10 containsObject:objc_opt_class()];

    if ((v11 & 1) == 0)
    {
      uint64_t v14 = (void *)MEMORY[0x263EFF940];
      v15 = [NSString stringWithFormat:@"Specifier's class must be registered in the allowedSpecifierClasses in HMDTimeBasedFlagsManager: %@", objc_opt_class()];
      id v16 = [v14 exceptionWithName:*MEMORY[0x263EFF4A0] reason:v15 userInfo:0];

      objc_exception_throw(v16);
    }
    id v9 = [(HMDTimeBasedFlagsManager *)self newFlagForPeriodicity:a4];
    uint64_t v12 = [(HMDTimeBasedFlagsManager *)self flags];
    [v12 setObject:v9 forKeyedSubscript:v6];
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)flagForName:(id)a3 homeUUID:(id)a4 periodicity:(int64_t)a5
{
  id v7 = +[HMDTimeBasedFlagNameAndHomeSpecifier specifierWithFlagName:a3 homeUUID:a4];
  id v8 = [(HMDTimeBasedFlagsManager *)self flagForSpecifier:v7 periodicity:a5];

  return v8;
}

- (id)flagForName:(id)a3 periodicity:(int64_t)a4
{
  id v6 = +[HMDTimeBasedFlagNameSpecifier specifierWithFlagName:a3];
  id v7 = [(HMDTimeBasedFlagsManager *)self flagForSpecifier:v6 periodicity:a4];

  return v7;
}

- (HMDTimeBasedFlagsManager)initWithStorage:(id)a3 dateProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDTimeBasedFlagsManager;
  id v9 = [(HMDTimeBasedFlagsManager *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flagsStorage, a3);
    objc_storeStrong((id *)&v10->_dateProvider, a4);
    HMDispatchQueueNameString();
    id v11 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = (const char *)[v11 UTF8String];
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v15 = dispatch_queue_create(v12, v14);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [(HMDTimeBasedFlagsManager *)v10 unarchiveFlags];
    flags = v10->_flags;
    v10->_flags = (NSMutableDictionary *)v17;
  }
  return v10;
}

- (HMDTimeBasedFlagsManager)initWithDateProvider:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDPersistentStore);
  id v6 = [[HMDTimeBasedFlagsPersistentStore alloc] initWithPersistentStore:v5];
  id v7 = [(HMDTimeBasedFlagsManager *)self initWithStorage:v6 dateProvider:v4];

  if (v7) {
    objc_storeStrong((id *)&v7->_persistentStore, v5);
  }

  return v7;
}

+ (NSSet)allowedSpecifierClasses
{
  if (allowedSpecifierClasses__hmf_once_t4 != -1) {
    dispatch_once(&allowedSpecifierClasses__hmf_once_t4, &__block_literal_global_13294);
  }
  id v2 = (void *)allowedSpecifierClasses__hmf_once_v5;
  return (NSSet *)v2;
}

void __51__HMDTimeBasedFlagsManager_allowedSpecifierClasses__block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)allowedSpecifierClasses__hmf_once_v5;
  allowedSpecifierClasses__hmf_once_id v5 = v2;
}

@end
@interface HMDHomeManagerObjectLookup
+ (id)logCategory;
- (HMDHomeManager)homeManager;
- (HMDHomeManagerObjectLookup)initWithHomeManager:(id)a3;
- (void)_scanAccounts;
- (void)_scanCloudZones;
- (void)_scanHomes;
- (void)scanObjects;
- (void)setHomeManager:(id)a3;
@end

@implementation HMDHomeManagerObjectLookup

- (void).cxx_destruct
{
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)_scanAccounts
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = +[HMDAppleAccountManager sharedManager];
  v4 = [v3 account];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v26 = v4;
  v5 = [v4 modelBackedObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = [(HMDObjectLookup *)self uuidToObjectMapping];
          v12 = [v10 modelIdentifier];
          [v11 setObject:v10 forKey:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v7);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = +[HMDRemoteAccountManager sharedManager];
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      uint64_t v28 = v14;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * v16);
        if ([v17 isAuthenticated])
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v18 = [v17 modelBackedObjects];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v31 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v24 = [(HMDObjectLookup *)self uuidToObjectMapping];
                  v25 = [v23 modelIdentifier];
                  [v24 setObject:v23 forKey:v25];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
            }
            while (v20);
          }

          uint64_t v15 = v27;
          uint64_t v14 = v28;
        }
        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v14);
  }
}

- (void)_scanCloudZones
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(HMDHomeManagerObjectLookup *)self homeManager];
  v4 = [v3 cloudZones];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = [(HMDObjectLookup *)self uuidToObjectMapping];
        v11 = [v9 uuid];
        [v10 setObject:v9 forKey:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_scanHomes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(HMDHomeManagerObjectLookup *)self homeManager];
  v4 = [v3 homes];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = [(HMDObjectLookup *)self uuidToObjectMapping];
        v11 = [v9 uuid];
        [v10 setObject:v9 forKey:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)scanObjects
{
  v6.receiver = self;
  v6.super_class = (Class)HMDHomeManagerObjectLookup;
  [(HMDObjectLookup *)&v6 scanObjects];
  [(HMDHomeManagerObjectLookup *)self _scanAccounts];
  v3 = [(HMDHomeManagerObjectLookup *)self homeManager];
  v4 = [(HMDObjectLookup *)self uuidToObjectMapping];
  uint64_t v5 = [v3 uuid];
  [v4 setObject:v3 forKey:v5];
}

- (HMDHomeManagerObjectLookup)initWithHomeManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 workQueue];
  v8.receiver = self;
  v8.super_class = (Class)HMDHomeManagerObjectLookup;
  objc_super v6 = [(HMDObjectLookup *)&v8 initWithWorkQueue:v5];

  if (v6) {
    objc_storeWeak((id *)&v6->_homeManager, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_72072 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_72072, &__block_literal_global_72073);
  }
  v2 = (void *)logCategory__hmf_once_v1_72074;
  return v2;
}

void __41__HMDHomeManagerObjectLookup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_72074;
  logCategory__hmf_once_v1_72074 = v0;
}

@end
@interface HMDHomeObjectLookup
+ (id)logCategory;
- (HMDHome)home;
- (HMDHomeObjectLookup)initWithHome:(id)a3;
- (id)logIdentifier;
- (void)_scanAccessoriesAndServices;
- (void)_scanActionSets;
- (void)_scanMediaSystems;
- (void)_scanResidentDevices;
- (void)_scanRooms;
- (void)_scanServiceGroups;
- (void)_scanSettings:(id)a3;
- (void)_scanTriggers;
- (void)_scanUsers;
- (void)_scanZones;
- (void)scanObjects;
- (void)setHome:(id)a3;
@end

@implementation HMDHomeObjectLookup

- (void).cxx_destruct
{
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDHomeObjectLookup *)self home];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)_scanUsers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(HMDHomeObjectLookup *)self home];
  v4 = [v3 users];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        v10 = [(HMDObjectLookup *)self uuidToObjectMapping];
        v11 = [v9 uuid];
        [v10 setObject:v9 forKey:v11];

        v12 = [v9 assistantAccessControlModelUUID];

        if (v12)
        {
          v13 = [(HMDObjectLookup *)self uuidToObjectMapping];
          v14 = [v9 assistantAccessControlModelUUID];
          [v13 setObject:v9 forKey:v14];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)_scanMediaSystems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(HMDHomeObjectLookup *)self home];
  v4 = [v3 mediaSystems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        v10 = [(HMDObjectLookup *)self uuidToObjectMapping];
        v11 = [v9 uuid];
        [v10 setObject:v9 forKey:v11];

        v12 = [v9 settingsController];
        [(HMDHomeObjectLookup *)self _scanSettings:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_scanResidentDevices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(HMDHomeObjectLookup *)self home];
  v4 = [v3 residentDeviceManager];
  uint64_t v5 = [v4 residentDevices];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        v11 = [(HMDObjectLookup *)self uuidToObjectMapping];
        v12 = [v10 identifier];
        [v11 setObject:v10 forKey:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_scanTriggers
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = [(HMDHomeObjectLookup *)self home];
  v4 = [v3 triggers];

  id obj = v4;
  uint64_t v22 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v27 + 1) + 8 * v5);
        uint64_t v7 = [(HMDObjectLookup *)self uuidToObjectMapping];
        uint64_t v8 = [v6 uuid];
        [v7 setObject:v6 forKey:v8];

        id v9 = v6;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
        id v11 = v10;

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v12 = [v11 events];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
              uint64_t v18 = [(HMDObjectLookup *)self uuidToObjectMapping];
              v19 = [v17 uuid];
              [v18 setObject:v17 forKey:v19];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v14);
        }

        ++v5;
      }
      while (v5 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }
}

- (void)_scanServiceGroups
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(HMDHomeObjectLookup *)self home];
  v4 = [v3 serviceGroups];

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
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = [(HMDObjectLookup *)self uuidToObjectMapping];
        id v11 = [v9 uuid];
        [v10 setObject:v9 forKey:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_scanActionSets
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomeObjectLookup *)self home];
  v4 = [v3 actionSets];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v21 = v3;
  uint64_t v6 = [v3 triggerOwnedActionSets];
  [v5 addObjectsFromArray:v6];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v23 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        id v11 = [(HMDObjectLookup *)self uuidToObjectMapping];
        long long v12 = [v10 uuid];
        [v11 setObject:v10 forKey:v12];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v13 = [v10 actions];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
              v19 = [(HMDObjectLookup *)self uuidToObjectMapping];
              uint64_t v20 = [v18 uuid];
              [v19 setObject:v18 forKey:v20];

              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);
        }

        ++v9;
      }
      while (v9 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }
}

- (void)_scanZones
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(HMDHomeObjectLookup *)self home];
  v4 = [v3 zones];

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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = [(HMDObjectLookup *)self uuidToObjectMapping];
        id v11 = [v9 uuid];
        [v10 setObject:v9 forKey:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_scanRooms
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomeObjectLookup *)self home];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = objc_msgSend(v3, "rooms", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        v10 = [(HMDObjectLookup *)self uuidToObjectMapping];
        id v11 = [v9 uuid];
        [v10 setObject:v9 forKey:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  long long v12 = [(HMDObjectLookup *)self uuidToObjectMapping];
  long long v13 = [v3 roomForEntireHome];
  long long v14 = [v3 roomForEntireHome];
  long long v15 = [v14 uuid];
  [v12 setObject:v13 forKey:v15];
}

- (void)_scanSettings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 childrenIdentifiers];
  uint64_t v6 = [v4 transactionReceiver];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        long long v13 = [(HMDObjectLookup *)self uuidToObjectMapping];
        [v13 setObject:v6 forKey:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_scanAccessoriesAndServices
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v3 = [(HMDHomeObjectLookup *)self home];
  id v4 = [v3 accessories];

  id obj = v4;
  uint64_t v34 = [v4 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v41;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v40 + 1) + 8 * v5);
        id v7 = [(HMDObjectLookup *)self uuidToObjectMapping];
        uint64_t v8 = [v6 uuid];
        [v7 setObject:v6 forKey:v8];

        id v9 = v6;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        id v11 = v10;

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v35 = v11;
        uint64_t v12 = [v11 services];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v37;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v37 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v36 + 1) + 8 * v16);
              long long v18 = [(HMDObjectLookup *)self uuidToObjectMapping];
              uint64_t v19 = [v17 uuid];
              [v18 setObject:v17 forKey:v19];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v14);
        }

        id v20 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = 0;
        }
        id v22 = v21;

        if (v22)
        {
          uint64_t v23 = [v22 audioDestinationManager];
          if (v23)
          {
            long long v24 = [(HMDObjectLookup *)self uuidToObjectMapping];
            long long v25 = [v23 backingStoreHandler];
            long long v26 = [v23 identifier];
            [v24 setObject:v25 forKey:v26];
          }
          long long v27 = [v22 audioDestinationController];
          if (v27)
          {
            long long v28 = [(HMDObjectLookup *)self uuidToObjectMapping];
            long long v29 = [v27 backingStoreHandler];
            long long v30 = [v27 identifier];
            [v28 setObject:v29 forKey:v30];
          }
          long long v31 = [v22 settingsController];
          [(HMDHomeObjectLookup *)self _scanSettings:v31];
        }
        ++v5;
      }
      while (v5 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v34);
  }
}

- (void)scanObjects
{
  v8.receiver = self;
  v8.super_class = (Class)HMDHomeObjectLookup;
  [(HMDObjectLookup *)&v8 scanObjects];
  v3 = [(HMDHomeObjectLookup *)self home];
  id v4 = [(HMDObjectLookup *)self uuidToObjectMapping];
  uint64_t v5 = [v3 uuid];
  [v4 setObject:v3 forKey:v5];

  uint64_t v6 = [(HMDObjectLookup *)self uuidToObjectMapping];
  id v7 = [v3 homeConfigurationUUID];
  [v6 setObject:v3 forKey:v7];

  [(HMDHomeObjectLookup *)self _scanAccessoriesAndServices];
  [(HMDHomeObjectLookup *)self _scanRooms];
  [(HMDHomeObjectLookup *)self _scanZones];
  [(HMDHomeObjectLookup *)self _scanActionSets];
  [(HMDHomeObjectLookup *)self _scanServiceGroups];
  [(HMDHomeObjectLookup *)self _scanTriggers];
  [(HMDHomeObjectLookup *)self _scanResidentDevices];
  [(HMDHomeObjectLookup *)self _scanMediaSystems];
  [(HMDHomeObjectLookup *)self _scanUsers];
}

- (HMDHomeObjectLookup)initWithHome:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 workQueue];
  v8.receiver = self;
  v8.super_class = (Class)HMDHomeObjectLookup;
  uint64_t v6 = [(HMDObjectLookup *)&v8 initWithWorkQueue:v5];

  if (v6) {
    objc_storeWeak((id *)&v6->_home, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_93576 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_93576, &__block_literal_global_93577);
  }
  v2 = (void *)logCategory__hmf_once_v4_93578;
  return v2;
}

uint64_t __34__HMDHomeObjectLookup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_93578;
  logCategory__hmf_once_v4_93578 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
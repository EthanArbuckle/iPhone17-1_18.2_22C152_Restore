@interface HMDCapabilitiesController
+ (id)logCategory;
- (BOOL)areCurrentAccessoryCapabilitiesPresentAndDifferent:(id)a3;
- (BOOL)areCurrentResidentCapabilitiesPresentAndDifferent:(id)a3;
- (HMAccessoryCapabilities)currentAccessoryCapabilitiesInternal;
- (HMDCapabilitiesController)initWithQueue:(id)a3 dataSource:(id)a4;
- (HMResidentCapabilities)currentResidentCapabilitiesInternal;
- (id)_lastCachedAccessoryCapabilities;
- (id)_lastCachedResidentCapabilities;
- (id)_metadataForEvent;
- (id)accessoryUUID;
- (id)encodedCurrentAccessoryCapabilities;
- (id)encodedCurrentResidentCapabilities;
- (id)homeUUID;
- (id)logIdentifier;
- (void)_postCurrentAccessoryCapabilitiesEventIfNeeded:(uint64_t)a1;
- (void)_postCurrentResidentCapabilitiesEventIfNeeded:(uint64_t)a1;
- (void)currentAccessoryDidBecomeAvailable;
- (void)didRemoveCurrentAccessory:(id)a3;
- (void)setAccessoryUUID:(uint64_t)a1;
- (void)setCurrentAccessoryCapabilitiesInternal:(id)a3;
- (void)setCurrentResidentCapabilitiesInternal:(id)a3;
- (void)setHomeUUID:(uint64_t)a1;
- (void)updateCurrentAccessoryCapabilities;
@end

@implementation HMDCapabilitiesController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentResidentCapabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_currentAccessoryCapabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (BOOL)areCurrentResidentCapabilitiesPresentAndDifferent:(id)a3
{
  id v4 = a3;
  v5 = -[HMDCapabilitiesController _lastCachedResidentCapabilities]((uint64_t)self);
  v6 = (void *)[objc_alloc(MEMORY[0x263F0E6C0]) initWithProtoData:v4];

  if (v5) {
    int v7 = [v5 isLocalEqual:v6] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_lastCachedResidentCapabilities
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x263F0DFA8];
    uint64_t v3 = *MEMORY[0x263F0B308];
    id v4 = -[HMDCapabilitiesController homeUUID]((char *)a1);
    v5 = -[HMDCapabilitiesController accessoryUUID]((char *)a1);
    v6 = [v2 topicFromSuffixID:v3 homeUUID:v4 accessoryUUID:v5];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v8 = [WeakRetained eventStoreReadHandle];
    v9 = [v8 lastEventForTopic:v6];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x263F0E6C0]);
      v11 = [v9 encodedData];
      v12 = (void *)[v10 initWithProtoData:v11];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)homeUUID
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = (id *)v1[2];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)accessoryUUID
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = (id *)v1[3];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (BOOL)areCurrentAccessoryCapabilitiesPresentAndDifferent:(id)a3
{
  id v4 = a3;
  v5 = -[HMDCapabilitiesController _lastCachedAccessoryCapabilities]((uint64_t)self);
  v6 = (void *)[objc_alloc(MEMORY[0x263F0DF30]) initWithProtoData:v4];

  if (v5) {
    int v7 = [v5 isLocalEqual:v6] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_lastCachedAccessoryCapabilities
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x263F0DFA8];
    uint64_t v3 = *MEMORY[0x263F0B2D0];
    id v4 = -[HMDCapabilitiesController homeUUID]((char *)a1);
    v5 = -[HMDCapabilitiesController accessoryUUID]((char *)a1);
    v6 = [v2 topicFromSuffixID:v3 homeUUID:v4 accessoryUUID:v5];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v8 = [WeakRetained eventStoreReadHandle];
    v9 = [v8 lastEventForTopic:v6];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x263F0DF30]);
      v11 = [v9 encodedData];
      v12 = (void *)[v10 initWithProtoData:v11];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)didRemoveCurrentAccessory:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMDCapabilitiesController_didRemoveCurrentAccessory___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__HMDCapabilitiesController_didRemoveCurrentAccessory___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = -[HMDCapabilitiesController accessoryUUID](*(char **)(a1 + 32));
  int v3 = objc_msgSend(v2, "hmf_isEqualToUUID:", *(void *)(a1 + 40));

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Reset accessory on removal", (uint8_t *)&v8, 0xCu);
    }
    -[HMDCapabilitiesController setAccessoryUUID:](*(void *)(a1 + 32), 0);
    -[HMDCapabilitiesController setHomeUUID:](*(void *)(a1 + 32), 0);
  }
}

- (void)setAccessoryUUID:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v3 = [v5 copy];
    id v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v3;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (void)setHomeUUID:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v3 = [v5 copy];
    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v3;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (void)currentAccessoryDidBecomeAvailable
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDCapabilitiesController_currentAccessoryDidBecomeAvailable__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __63__HMDCapabilitiesController_currentAccessoryDidBecomeAvailable__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v35 = 138543362;
    v36 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Current accessory available", (uint8_t *)&v35, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 56));
    int v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v9 = [WeakRetained currentAccessoryHomeUUID];
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        v11 = [v8 currentAccessoryUUID];

        if (v11)
        {
          v12 = -[HMDCapabilitiesController homeUUID](*(char **)(a1 + 32));
          v13 = [v8 currentAccessoryHomeUUID];
          if (objc_msgSend(v12, "hmf_isEqualToUUID:", v13))
          {
            v14 = -[HMDCapabilitiesController accessoryUUID](*(char **)(a1 + 32));
            v15 = [v8 currentAccessoryUUID];
            char v16 = objc_msgSend(v14, "hmf_isEqualToUUID:", v15);

            if (v16) {
              goto LABEL_24;
            }
          }
          else
          {
          }
          v17 = (void *)MEMORY[0x230FBD990]();
          id v18 = *(id *)(a1 + 32);
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = HMFGetLogIdentifier();
            int v35 = 138543362;
            v36 = v20;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Current accessory became available and is different", (uint8_t *)&v35, 0xCu);
          }
          v21 = [v8 currentAccessoryHomeUUID];
          -[HMDCapabilitiesController setHomeUUID:](*(void *)(a1 + 32), v21);

          v22 = [v8 currentAccessoryUUID];
          -[HMDCapabilitiesController setAccessoryUUID:](*(void *)(a1 + 32), v22);

          v23 = -[HMDCapabilitiesController _lastCachedAccessoryCapabilities](*(void *)(a1 + 32));
          if (v23)
          {
            v24 = [*(id *)(a1 + 32) currentAccessoryCapabilitiesInternal];
            int v25 = [v23 isLocalEqual:v24];

            if (v25) {
              [*(id *)(a1 + 32) setCurrentAccessoryCapabilitiesInternal:v23];
            }
          }
          v26 = [*(id *)(a1 + 32) currentAccessoryCapabilitiesInternal];

          if (v26)
          {
            v27 = *(void **)(a1 + 32);
            v28 = [v27 currentAccessoryCapabilitiesInternal];
            -[HMDCapabilitiesController _postCurrentAccessoryCapabilitiesEventIfNeeded:]((uint64_t)v27, v28);
          }
          v29 = -[HMDCapabilitiesController _lastCachedResidentCapabilities](*(void *)(a1 + 32));
          if (v29)
          {
            v30 = [*(id *)(a1 + 32) currentResidentCapabilitiesInternal];
            int v31 = [v29 isLocalEqual:v30];

            if (v31) {
              [*(id *)(a1 + 32) setCurrentResidentCapabilitiesInternal:v29];
            }
          }
          v32 = [*(id *)(a1 + 32) currentResidentCapabilitiesInternal];

          if (v32)
          {
            v33 = *(void **)(a1 + 32);
            v34 = [v33 currentResidentCapabilitiesInternal];
            -[HMDCapabilitiesController _postCurrentResidentCapabilitiesEventIfNeeded:]((uint64_t)v33, v34);
          }
        }
      }
    }
  }
  else
  {
    int v8 = 0;
  }
LABEL_24:
}

- (void)_postCurrentAccessoryCapabilitiesEventIfNeeded:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      uint64_t v5 = -[HMDCapabilitiesController homeUUID]((char *)a1);
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        int v7 = -[HMDCapabilitiesController accessoryUUID]((char *)a1);

        if (v7)
        {
          int v8 = (void *)MEMORY[0x263F0DFA8];
          uint64_t v9 = *MEMORY[0x263F0B2D0];
          uint64_t v10 = -[HMDCapabilitiesController homeUUID]((char *)a1);
          v11 = -[HMDCapabilitiesController accessoryUUID]((char *)a1);
          v12 = [v8 topicFromSuffixID:v9 homeUUID:v10 accessoryUUID:v11];

          v13 = -[HMDCapabilitiesController _lastCachedAccessoryCapabilities](a1);
          char v14 = [v3 isLocalEqual:v13];
          v15 = (void *)MEMORY[0x230FBD990]();
          id v16 = (id)a1;
          v17 = HMFGetOSLogHandle();
          id v18 = v17;
          if (v14)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v19 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v29 = v19;
              __int16 v30 = 2112;
              id v31 = v3;
              _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Accessory capabilities are the same not posting: %@", buf, 0x16u);
            }
          }
          else
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v20 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v29 = v20;
              __int16 v30 = 2112;
              id v31 = v3;
              _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Posting event as current accessory capabilities are different: %@", buf, 0x16u);
            }
            id v21 = objc_alloc(MEMORY[0x263F49380]);
            v22 = [v3 pbCapabilities];
            v23 = [v22 data];
            v24 = -[HMDCapabilitiesController _metadataForEvent]((char *)v16);
            int v25 = (void *)[v21 initWithEventData:v23 metadata:v24];

            v26 = [WeakRetained eventForwarder];
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __76__HMDCapabilitiesController__postCurrentAccessoryCapabilitiesEventIfNeeded___block_invoke;
            v27[3] = &unk_264A2F3E8;
            v27[4] = v16;
            [v26 forwardEvent:v25 topic:v12 completion:v27];
          }
        }
      }
    }
  }
}

- (void)_postCurrentResidentCapabilitiesEventIfNeeded:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      uint64_t v5 = -[HMDCapabilitiesController homeUUID]((char *)a1);
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        int v7 = -[HMDCapabilitiesController accessoryUUID]((char *)a1);

        if (v7)
        {
          int v8 = (void *)MEMORY[0x263F0DFA8];
          uint64_t v9 = *MEMORY[0x263F0B308];
          uint64_t v10 = -[HMDCapabilitiesController homeUUID]((char *)a1);
          v11 = -[HMDCapabilitiesController accessoryUUID]((char *)a1);
          v12 = [v8 topicFromSuffixID:v9 homeUUID:v10 accessoryUUID:v11];

          v13 = -[HMDCapabilitiesController _lastCachedResidentCapabilities](a1);
          if ([v3 isLocalEqual:v13])
          {
            if (v3)
            {
              char v14 = (void *)MEMORY[0x230FBD990]();
              id v15 = (id)a1;
              id v16 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                v17 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                __int16 v30 = v17;
                __int16 v31 = 2112;
                id v32 = v3;
                _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Resident capabilities are the same not posting: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v18 = (void *)MEMORY[0x230FBD990]();
            id v19 = (id)a1;
            v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              __int16 v30 = v21;
              __int16 v31 = 2112;
              id v32 = v3;
              _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Posting event as current resident capabilities are different: %@", buf, 0x16u);
            }
            id v22 = objc_alloc(MEMORY[0x263F49380]);
            v23 = [v3 pbCapabilities];
            v24 = [v23 data];
            int v25 = -[HMDCapabilitiesController _metadataForEvent]((char *)v19);
            v26 = (void *)[v22 initWithEventData:v24 metadata:v25];

            v27 = [WeakRetained eventForwarder];
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __75__HMDCapabilitiesController__postCurrentResidentCapabilitiesEventIfNeeded___block_invoke;
            v28[3] = &unk_264A2F3E8;
            v28[4] = v19;
            [v27 forwardEvent:v26 topic:v12 completion:v28];
          }
        }
      }
    }
  }
}

- (id)_metadataForEvent
{
  id v2 = objc_alloc(MEMORY[0x263F49390]);
  id v3 = -[HMDCapabilitiesController accessoryUUID](a1);
  id v4 = [v3 UUIDString];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  uint64_t v5 = objc_msgSend(v2, "initWithSource:cachePolicy:combineType:timestamp:", v4, 2, 2);

  return v5;
}

void __75__HMDCapabilitiesController__postCurrentResidentCapabilitiesEventIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Posted event for current resident capabilities error: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __76__HMDCapabilitiesController__postCurrentAccessoryCapabilitiesEventIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Posted event for current accessory capabilities error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)encodedCurrentResidentCapabilities
{
  id v2 = [(HMDCapabilitiesController *)self currentResidentCapabilitiesInternal];
  id v3 = [v2 pbCapabilities];
  id v4 = [v3 data];

  return v4;
}

- (id)encodedCurrentAccessoryCapabilities
{
  id v2 = [(HMDCapabilitiesController *)self currentAccessoryCapabilitiesInternal];
  id v3 = [v2 pbCapabilities];
  id v4 = [v3 data];

  return v4;
}

- (void)setCurrentResidentCapabilitiesInternal:(id)a3
{
  id v4 = (HMResidentCapabilities *)a3;
  os_unfair_lock_lock_with_options();
  currentResidentCapabilitiesInternal = self->_currentResidentCapabilitiesInternal;
  self->_currentResidentCapabilitiesInternal = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMResidentCapabilities)currentResidentCapabilitiesInternal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentResidentCapabilitiesInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentAccessoryCapabilitiesInternal:(id)a3
{
  id v4 = (HMAccessoryCapabilities *)a3;
  os_unfair_lock_lock_with_options();
  currentAccessoryCapabilitiesInternal = self->_currentAccessoryCapabilitiesInternal;
  self->_currentAccessoryCapabilitiesInternal = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMAccessoryCapabilities)currentAccessoryCapabilitiesInternal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentAccessoryCapabilitiesInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateCurrentAccessoryCapabilities
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource)) != 0)
  {
    id v4 = WeakRetained;
    id v5 = [WeakRetained createCurrentAccessoryCapabilities];
    uint64_t v6 = -[HMDCapabilitiesController _lastCachedAccessoryCapabilities]((uint64_t)self);
    int v7 = v6;
    if (v6 && [v6 isLocalEqual:v5])
    {
      id v8 = v7;

      id v5 = v8;
    }
    objc_storeStrong((id *)&self->_currentAccessoryCapabilitiesInternal, v5);
    uint64_t v9 = [v4 createCurrentResidentCapabilities];
    __int16 v10 = -[HMDCapabilitiesController _lastCachedResidentCapabilities]((uint64_t)self);
    id v11 = v10;
    if (v10 && [v10 isLocalEqual:v9])
    {
      id v12 = v11;

      uint64_t v9 = v12;
    }
    objc_storeStrong((id *)&self->_currentResidentCapabilitiesInternal, v9);
    v13 = (void *)MEMORY[0x230FBD990]();
    char v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Finished loading current capabilities", buf, 0xCu);
    }
    queue = v14->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__HMDCapabilitiesController_updateCurrentAccessoryCapabilities__block_invoke;
    block[3] = &unk_264A2F2F8;
    block[4] = v14;
    id v25 = v5;
    id v26 = v9;
    id v18 = v9;
    id v19 = v5;
    dispatch_async(queue, block);
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil dataSource", buf, 0xCu);
    }
  }
}

void __63__HMDCapabilitiesController_updateCurrentAccessoryCapabilities__block_invoke(uint64_t a1)
{
  -[HMDCapabilitiesController _postCurrentAccessoryCapabilitiesEventIfNeeded:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  -[HMDCapabilitiesController _postCurrentResidentCapabilitiesEventIfNeeded:](v2, v3);
}

- (HMDCapabilitiesController)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCapabilitiesController;
  uint64_t v9 = [(HMDCapabilitiesController *)&v16 init];
  __int16 v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
    uint64_t v11 = [v8 currentAccessoryHomeUUID];
    homeUUID = v10->_homeUUID;
    v10->_homeUUID = (NSUUID *)v11;

    uint64_t v13 = [v8 currentAccessoryUUID];
    accessoryUUID = v10->_accessoryUUID;
    v10->_accessoryUUID = (NSUUID *)v13;
  }
  [(HMDCapabilitiesController *)v10 updateCurrentAccessoryCapabilities];

  return v10;
}

- (id)logIdentifier
{
  uint64_t v2 = -[HMDCapabilitiesController accessoryUUID]((char *)self);
  id v3 = [v2 UUIDString];

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_64725 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_64725, &__block_literal_global_64726);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_64727;
  return v2;
}

void __40__HMDCapabilitiesController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_64727;
  logCategory__hmf_once_v1_64727 = v0;
}

@end
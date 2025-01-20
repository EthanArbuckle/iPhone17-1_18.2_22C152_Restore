@interface HMIHomeKitClient
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isSetup;
- (HMHomeManager)homeManager;
- (HMIHomeKitClient)init;
- (HMIHomeKitClient)initWithCachePolicy:(unint64_t)a3;
- (HMIHomeKitClient)initWithNoCaching;
- (NSArray)homes;
- (NSOperationQueue)homeKitOperationQueue;
- (id)cameraProfileWithUUID:(id)a3;
- (id)homeForHMPersonManagerUUID:(id)a3;
- (id)homePersonManagerForHomeUUID:(id)a3;
- (id)homePersonManagersForCurrentDevice;
- (id)homeWithCameraProfileUUID:(id)a3;
- (id)photosPersonManagerForHomeUUID:(id)a3 sourceUUID:(id)a4;
- (unint64_t)cachePolicy;
- (void)setHomeManager:(id)a3;
- (void)setup;
@end

@implementation HMIHomeKitClient

- (HMIHomeKitClient)init
{
  return [(HMIHomeKitClient *)self initWithCachePolicy:2];
}

- (HMIHomeKitClient)initWithNoCaching
{
  return [(HMIHomeKitClient *)self initWithCachePolicy:0];
}

- (HMIHomeKitClient)initWithCachePolicy:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HMIHomeKitClient;
  v4 = [(HMIHomeKitClient *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_cachePolicy = a3;
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    homeKitOperationQueue = v5->_homeKitOperationQueue;
    v5->_homeKitOperationQueue = v6;

    [(NSOperationQueue *)v5->_homeKitOperationQueue setName:@"HMIHomeKitClient HomeKit Delegate Queue"];
    [(NSOperationQueue *)v5->_homeKitOperationQueue setMaxConcurrentOperationCount:1];
    v5->_setup = 0;
    homeManager = v5->_homeManager;
    v5->_homeManager = 0;
  }
  return v5;
}

- (NSArray)homes
{
  [(HMIHomeKitClient *)self setup];
  homes = self->_homes;
  return homes;
}

- (id)homePersonManagerForHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMIHomeKitClient *)self homes];
  v6 = objc_msgSend(v5, "hmf_firstObjectWithUUID:", v4);

  if (v6)
  {
    v7 = [v6 personManager];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)homeForHMPersonManagerUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMIHomeKitClient *)self homes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__HMIHomeKitClient_homeForHMPersonManagerUUID___block_invoke;
  v9[3] = &unk_26477BC78;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __47__HMIHomeKitClient_homeForHMPersonManagerUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 personManager];
  id v4 = [v3 UUID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)homePersonManagersForCurrentDevice
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = self;
  id v4 = [(HMIHomeKitClient *)self homes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v25;
    *(void *)&long long v6 = 138543618;
    long long v21 = v6;
    v22 = v3;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "residentDevices", v21);
        int v12 = objc_msgSend(v11, "na_any:", &__block_literal_global_4);

        if (v12)
        {
          v13 = [v10 personManager];
          if (v13)
          {
            [v3 addObject:v13];
          }
          else
          {
            v14 = v4;
            v15 = (void *)MEMORY[0x22A641C70]();
            v16 = v23;
            v17 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = HMFGetLogIdentifier();
              v19 = [v10 uuid];
              *(_DWORD *)buf = v21;
              v29 = v18;
              __int16 v30 = 2112;
              v31 = v19;
              _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_INFO, "%{public}@personManager is nil for homeUUID: %@", buf, 0x16u);

              v3 = v22;
            }

            id v4 = v14;
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }

  return v3;
}

uint64_t __54__HMIHomeKitClient_homePersonManagersForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentDevice];
}

- (id)photosPersonManagerForHomeUUID:(id)a3 sourceUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMIHomeKitClient *)self homes];
  v9 = objc_msgSend(v8, "hmf_firstObjectWithUUID:", v7);

  if (v9)
  {
    id v10 = [v9 photosPersonManagerWithUUID:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = [(HMIHomeKitClient *)self homes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v20 + 1) + 8 * i) residentDevices];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v16 + 1) + 8 * j);
              if ([v13 isCurrentDevice] && (objc_msgSend(v13, "status") & 2) != 0)
              {

                BOOL v14 = 1;
                goto LABEL_20;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      BOOL v14 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_20:

  return v14;
}

- (id)cameraProfileWithUUID:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [(HMIHomeKitClient *)self homes];
  uint64_t v18 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v18)
  {
    uint64_t v6 = *(void *)v28;
    long long v20 = v5;
    uint64_t v17 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v19 = v7;
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v9 = [v8 accessories];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              BOOL v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) cameraProfiles];
              v21[0] = MEMORY[0x263EF8330];
              v21[1] = 3221225472;
              v21[2] = __42__HMIHomeKitClient_cameraProfileWithUUID___block_invoke;
              v21[3] = &unk_26477BCC0;
              id v22 = v4;
              v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", v21);

              if (v15)
              {

                uint64_t v5 = v20;
                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v19 + 1;
        uint64_t v5 = v20;
        uint64_t v6 = v17;
      }
      while (v19 + 1 != v18);
      v15 = 0;
      uint64_t v18 = [v20 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v18);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

uint64_t __42__HMIHomeKitClient_cameraProfileWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)homeWithCameraProfileUUID:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [(HMIHomeKitClient *)self homes];
  uint64_t v19 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v19)
  {
    uint64_t v6 = *(void *)v30;
    id v22 = v5;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v20 = v7;
        long long v21 = v8;
        uint64_t v9 = objc_msgSend(v8, "accessories", v18);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v9);
              }
              BOOL v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) cameraProfiles];
              v23[0] = MEMORY[0x263EF8330];
              v23[1] = 3221225472;
              v23[2] = __46__HMIHomeKitClient_homeWithCameraProfileUUID___block_invoke;
              v23[3] = &unk_26477BCC0;
              id v24 = v4;
              v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", v23);

              if (v15)
              {
                id v16 = v21;

                uint64_t v5 = v22;
                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v20 + 1;
        uint64_t v5 = v22;
        uint64_t v6 = v18;
      }
      while (v20 + 1 != v19);
      id v16 = 0;
      uint64_t v19 = [v22 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v19);
  }
  else
  {
    id v16 = 0;
  }
LABEL_19:

  return v16;
}

uint64_t __46__HMIHomeKitClient_homeWithCameraProfileUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)setup
{
  v2 = self;
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (![(HMIHomeKitClient *)self isSetup])
  {
    uint64_t v3 = [MEMORY[0x263F0E5A8] defaultPrivateConfiguration];
    [v3 setOptions:1];
    objc_msgSend(v3, "setCachePolicy:", -[HMIHomeKitClient cachePolicy](v2, "cachePolicy"));
    [v3 setDiscretionary:1];
    uint64_t v4 = [(HMIHomeKitClient *)v2 homeKitOperationQueue];
    [v3 setDelegateQueue:v4];

    uint64_t v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    uint64_t v6 = objc_opt_new();
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __25__HMIHomeKitClient_setup__block_invoke;
    v49[3] = &unk_26477BCE8;
    uint64_t v7 = v5;
    v50 = v7;
    [v6 setDidUpdateHomes:v49];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F0E3C0]) initWithHomeMangerConfiguration:v3];
    [(HMIHomeKitClient *)v2 setHomeManager:v8];

    uint64_t v9 = [(HMIHomeKitClient *)v2 homeManager];
    [v9 setDelegate:v6];

    dispatch_group_enter(v7);
    uint64_t v10 = [(HMIHomeKitClient *)v2 homeManager];
    uint64_t v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:1.0e10];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __25__HMIHomeKitClient_setup__block_invoke_2;
    v47[3] = &unk_26477B940;
    uint64_t v12 = v7;
    v48 = v12;
    id v13 = (id)[v10 _refreshBeforeDate:v11 completionHandler:v47];

    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v12, v14);
    v15 = [(HMIHomeKitClient *)v2 homeManager];
    id v16 = [v15 homes];

    if (v16)
    {
      objc_storeStrong((id *)&v2->_homes, v16);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      obuint64_t j = v16;
      uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v59 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        v37 = v16;
        v38 = v12;
        v39 = v6;
        v40 = v3;
        uint64_t v19 = *(void *)v44;
        uint64_t v20 = obj;
        v41 = v2;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(v20);
            }
            id v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            long long v23 = (void *)MEMORY[0x22A641C70]();
            id v24 = v2;
            long long v25 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              long long v26 = HMFGetLogIdentifier();
              [v22 name];
              uint64_t v27 = v18;
              v29 = uint64_t v28 = v19;
              if ([v22 isPrimary]) {
                long long v30 = "Yes";
              }
              else {
                long long v30 = "No";
              }
              long long v31 = objc_msgSend(v22, "uuid", v37, v38, v39, v40);
              *(_DWORD *)buf = 138544130;
              v52 = v26;
              __int16 v53 = 2112;
              v54 = v29;
              __int16 v55 = 2080;
              v56 = v30;
              uint64_t v20 = obj;
              __int16 v57 = 2112;
              v58 = v31;
              _os_log_impl(&dword_225DC6000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Found home: name: %@, primary: %s, UUID: %@", buf, 0x2Au);

              uint64_t v19 = v28;
              uint64_t v18 = v27;

              v2 = v41;
            }
          }
          uint64_t v18 = [(NSArray *)v20 countByEnumeratingWithState:&v43 objects:v59 count:16];
        }
        while (v18);
        homes = v20;
        uint64_t v6 = v39;
        uint64_t v3 = v40;
        id v16 = v37;
        uint64_t v12 = v38;
      }
      else
      {
        homes = obj;
      }
    }
    else
    {
      uint64_t v33 = (void *)MEMORY[0x22A641C70]();
      v34 = v2;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v52 = v36;
        _os_log_impl(&dword_225DC6000, v35, OS_LOG_TYPE_ERROR, "%{public}@No homes were located", buf, 0xCu);
      }
      homes = v34->_homes;
      v34->_homes = (NSArray *)MEMORY[0x263EFFA68];
    }

    v2->_setup = 1;
  }
}

void __25__HMIHomeKitClient_setup__block_invoke(uint64_t a1)
{
}

void __25__HMIHomeKitClient_setup__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x22A641C70]();
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v7 = 138543618;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_ERROR, "%{public}@Error refreshing home data: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (NSOperationQueue)homeKitOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (HMHomeManager)homeManager
{
  return (HMHomeManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHomeManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_homeKitOperationQueue, 0);
  objc_storeStrong((id *)&self->_homes, 0);
}

@end
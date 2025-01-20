@interface HMDHomeNaturalLightingCurveWriter
+ (id)logCategory;
- (HMDHome)home;
- (HMDHomeNaturalLightingCurveWriter)initWithHome:(id)a3;
- (HMDHomeNaturalLightingCurveWriter)initWithHome:(id)a3 dataSource:(id)a4;
- (HMDLightProfileDataSource)dataSource;
- (NSString)logIdentifier;
- (void)setNaturalLightingEnabled:(BOOL)a3 forLightProfiles:(id)a4 completion:(id)a5;
@end

@implementation HMDHomeNaturalLightingCurveWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)logIdentifier
{
  v2 = [(HMDHomeNaturalLightingCurveWriter *)self home];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (void)setNaturalLightingEnabled:(BOOL)a3 forLightProfiles:(id)a4 completion:(id)a5
{
  BOOL v50 = a3;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v46 = a5;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting enabled for light profiles %@:%@", buf, 0x20u);
  }
  v47 = [MEMORY[0x263F08968] mapTableWithWeakToStrongObjects];
  v49 = [MEMORY[0x263F08968] mapTableWithWeakToStrongObjects];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v7;
  uint64_t v13 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v62 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        v18 = [(HMDHomeNaturalLightingCurveWriter *)v9 dataSource];
        v19 = [v18 date];
        v20 = [(HMDHomeNaturalLightingCurveWriter *)v9 dataSource];
        v21 = +[HMDCharacteristicWriteRequest writeRequestForTransitionStartWithLightProfile:v17 naturalLightingEnabled:v50 startDate:v19 type:0 dataSource:v20];

        if (v21)
        {
          [v49 setObject:v21 forKey:v17];
        }
        else
        {
          v22 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
          [v47 setObject:v22 forKey:v17];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v14);
  }

  v23 = v49;
  if ([v49 count])
  {
    v24 = [MEMORY[0x263EFF9C0] set];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v25 = v49;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v58 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [v25 objectForKey:*(void *)(*((void *)&v57 + 1) + 8 * j)];
          [v24 addObject:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v57 objects:v69 count:16];
      }
      while (v27);
    }

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke;
    aBlock[3] = &unk_264A1D850;
    aBlock[4] = v9;
    id v52 = obj;
    v31 = v47;
    id v53 = v47;
    v32 = v46;
    id v55 = v46;
    id v54 = v25;
    BOOL v56 = v50;
    v33 = _Block_copy(aBlock);
    v34 = [MEMORY[0x263F08C38] UUID];
    v35 = (void *)MEMORY[0x230FBD990]();
    v36 = v9;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      if (v34) {
        [v34 getUUIDBytes:buf];
      }
      else {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v65 = *(_OWORD *)buf;
      uint64_t v43 = [v24 count];
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(void *)&buf[20] = &v65;
      *(_WORD *)&buf[28] = 2114;
      *(void *)&buf[30] = v36;
      __int16 v67 = 2048;
      uint64_t v68 = v43;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Executing write requests for request identifier: %{public,uuid_t}.16P from natural lighting curve writer: %{public}@ count: %lu", buf, 0x30u);
    }
    v44 = [(HMDHomeNaturalLightingCurveWriter *)v36 home];
    v45 = [v24 allObjects];
    [v44 writeCharacteristicValues:v45 source:7 identifier:v34 transport:0 qualityOfService:-1 withCompletionHandler:v33];

    v23 = v49;
  }
  else
  {
    v39 = (void *)MEMORY[0x230FBD990]();
    v40 = v9;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v49;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = obj;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@No characteristic write request for light profiles %@:%@", buf, 0x20u);
    }
    v32 = v46;
    v31 = v47;
    (*((void (**)(id, void *))v46 + 2))(v46, v47);
  }
}

void __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v27 = a2;
  id v30 = a3;
  if (*(void *)(a1 + 32))
  {
    id v5 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = *(id *)(a1 + 56);
    uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v33;
      *(void *)&long long v7 = 138543874;
      long long v26 = v7;
      do
      {
        uint64_t v10 = 0;
        v11 = v5;
        uint64_t v28 = v8;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * v10);
          uint64_t v13 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v12, v26);
          uint64_t v14 = *(unsigned __int8 *)(a1 + 72);
          id v31 = v11;
          char v15 = objc_msgSend(v30, "hmd_isValidResponseForWriteRequest:naturalLightingEnabled:error:", v13, v14, &v31);
          id v5 = v31;

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = v9;
            uint64_t v17 = (void *)MEMORY[0x230FBD990]();
            uint64_t v18 = a1;
            id v19 = *(id *)(a1 + 32);
            v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v26;
              v41 = v21;
              __int16 v42 = 2112;
              id v43 = v30;
              __int16 v44 = 2112;
              id v45 = v27;
              _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate response for write request %@:%@", buf, 0x20u);
            }
            a1 = v18;
            [*(id *)(v18 + 48) setObject:v5 forKey:v12];
            uint64_t v9 = v16;
            uint64_t v8 = v28;
          }

          ++v10;
          v11 = v5;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v22 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(a1 + 48) setObject:v5 forKey:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
      }
      while (v23);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (HMDHomeNaturalLightingCurveWriter)initWithHome:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDLightProfileDataSource);
  uint64_t v6 = [(HMDHomeNaturalLightingCurveWriter *)self initWithHome:v4 dataSource:v5];

  return v6;
}

- (HMDHomeNaturalLightingCurveWriter)initWithHome:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHomeNaturalLightingCurveWriter;
  uint64_t v8 = [(HMDHomeNaturalLightingCurveWriter *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v9->_dataSource, a4);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_87611 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_87611, &__block_literal_global_87612);
  }
  v2 = (void *)logCategory__hmf_once_v5_87613;
  return v2;
}

void __48__HMDHomeNaturalLightingCurveWriter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_87613;
  logCategory__hmf_once_v5_87613 = v0;
}

@end
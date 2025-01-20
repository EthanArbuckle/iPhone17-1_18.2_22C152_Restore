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
  BOOL v49 = a3;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v46 = a5;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    v70 = v11;
    __int16 v71 = 2112;
    v72 = v12;
    __int16 v73 = 2112;
    id v74 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting enabled for light profiles %@:%@", buf, 0x20u);
  }
  v47 = [MEMORY[0x1E4F28E10] mapTableWithWeakToStrongObjects];
  v48 = [MEMORY[0x1E4F28E10] mapTableWithWeakToStrongObjects];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v64;
    do
    {
      v17 = v13;
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v64 != v16) {
          objc_enumerationMutation(v17);
        }
        uint64_t v19 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v20 = [(HMDHomeNaturalLightingCurveWriter *)v9 dataSource];
        v21 = [v20 date];
        v22 = [(HMDHomeNaturalLightingCurveWriter *)v9 dataSource];
        v23 = +[HMDCharacteristicWriteRequest writeRequestForTransitionStartWithLightProfile:v19 naturalLightingEnabled:v49 startDate:v21 type:0 dataSource:v22];

        if (v23)
        {
          [v48 setObject:v23 forKey:v19];
        }
        else
        {
          v24 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
          [v47 setObject:v24 forKey:v19];
        }
      }
      id v13 = v17;
      uint64_t v15 = [v17 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v15);
  }

  v25 = v48;
  if ([v48 count])
  {
    v26 = [MEMORY[0x1E4F1CA80] set];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v27 = v48;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v59 objects:v67 count:16];
    v29 = v47;
    if (v28)
    {
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v60 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = [v27 objectForKey:*(void *)(*((void *)&v59 + 1) + 8 * j)];
          [v26 addObject:v33];
        }
        uint64_t v30 = [v27 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v30);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke;
    aBlock[3] = &unk_1E6A0C2A8;
    aBlock[4] = v9;
    id v54 = v13;
    id v55 = v47;
    v34 = v46;
    id v57 = v46;
    id v56 = v27;
    BOOL v58 = v49;
    v35 = _Block_copy(aBlock);
    v36 = [(HMDHomeNaturalLightingCurveWriter *)v9 home];
    v37 = [v26 allObjects];
    v38 = [v36 performWriteRequests:v37 withRetries:4 timeInterval:v9 loggingObject:5.0];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke_5;
    v50[3] = &unk_1E6A0C2D0;
    BOOL v52 = v49;
    v50[4] = v9;
    id v51 = v35;
    id v39 = v35;
    id v40 = (id)[v38 addCompletionBlock:v50];

    v25 = v48;
  }
  else
  {
    id v41 = v13;
    v42 = (void *)MEMORY[0x1D9452090]();
    v43 = v9;
    v44 = HMFGetOSLogHandle();
    v29 = v47;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v70 = v45;
      __int16 v71 = 2112;
      v72 = v48;
      __int16 v73 = 2112;
      id v74 = v41;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@No characteristic write request for light profiles %@:%@", buf, 0x20u);
    }
    v34 = v46;
    (*((void (**)(id, void *))v46 + 2))(v46, v47);
    id v13 = v41;
  }
}

void __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v30 = a3;
  if (*(void *)(a1 + 32))
  {
    id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
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
          id v13 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v12, v26);
          uint64_t v14 = *(unsigned __int8 *)(a1 + 72);
          id v31 = v11;
          char v15 = objc_msgSend(v30, "hmd_isValidResponseForWriteRequest:naturalLightingEnabled:error:", v13, v14, &v31);
          id v5 = v31;

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = v9;
            v17 = (void *)MEMORY[0x1D9452090]();
            uint64_t v18 = a1;
            id v19 = *(id *)(a1 + 32);
            v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v26;
              id v41 = v21;
              __int16 v42 = 2112;
              id v43 = v30;
              __int16 v44 = 2112;
              id v45 = v27;
              _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate response for write request %@:%@", buf, 0x20u);
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
    id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
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

void __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    v11 = HMFBooleanToString();
    int v12 = 138543874;
    id v13 = v10;
    __int16 v14 = 2112;
    char v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished setting natural lighting enabled: %@, with error: %@", (uint8_t *)&v12, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HMDHomeNaturalLightingCurveWriter)initWithHome:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDLightProfileDataSource);
  id v6 = [(HMDHomeNaturalLightingCurveWriter *)self initWithHome:v4 dataSource:v5];

  return v6;
}

- (HMDHomeNaturalLightingCurveWriter)initWithHome:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHomeNaturalLightingCurveWriter;
  id v8 = [(HMDHomeNaturalLightingCurveWriter *)&v11 init];
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
  if (logCategory__hmf_once_t4_57496 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_57496, &__block_literal_global_57497);
  }
  v2 = (void *)logCategory__hmf_once_v5_57498;
  return v2;
}

uint64_t __48__HMDHomeNaturalLightingCurveWriter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_57498;
  logCategory__hmf_once_v5_57498 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
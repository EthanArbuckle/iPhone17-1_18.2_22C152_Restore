@interface HMDSiriEndpointOnboardingManager
- (BOOL)readyToApplyOnboardingSelectionsWithHomeUUID:(id)a3 accessoryUUID:(id)a4;
- (HMDSiriEndpointOnboardingManager)initWithDataSource:(id)a3;
- (HMDSiriEndpointOnboardingManagerDataSource)dataSource;
- (void)_applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 userUUID:(id)a6 cacheKey:(id)a7 completion:(id)a8;
- (void)_enableUserListeningHistoryForHomeUUID:(id)a3 accessoryUUID:(id)a4 userUUID:(id)a5;
- (void)_setNeedsOnboardingCompleteWitHomeUUID:(id)a3 accessoryUUID:(id)a4 completion:(id)a5;
- (void)applyCachedOnboardingSelectionsWithAccessoryUUID:(id)a3 homeUUID:(id)a4;
- (void)applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 userUUID:(id)a6 completion:(id)a7;
- (void)handleAccessoryConfigured:(id)a3;
- (void)handleCompositeSettingsControllerConfigured:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation HMDSiriEndpointOnboardingManager

- (void)handleAccessoryConfigured:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [v7 home];
    if (v8)
    {
      v9 = [v7 uuid];
      v10 = [v8 uuid];
      [(HMDSiriEndpointOnboardingManager *)self applyCachedOnboardingSelectionsWithAccessoryUUID:v9 homeUUID:v10];
    }
    else
    {
      v15 = (void *)MEMORY[0x1D9452090]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v18;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Accessory is configured with invalid home: %@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid HAP accessory is configured", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)applyCachedOnboardingSelectionsWithAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v40 = v11;
    __int16 v41 = 2112;
    id v42 = v7;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Apply cached onboarding selections: homeUUID: %@ accessoryUUID: %@", buf, 0x20u);
  }
  v12 = [(HMDSiriEndpointOnboardingManager *)v9 dataSource];
  v13 = [v12 needsOnboardingForHomeUUID:v7 accessoryUUID:v6];
  v14 = v13;
  if (v13)
  {
    if ([v13 BOOLValue])
    {
      v15 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_zeroUUID");
      v16 = [NSString stringWithFormat:@"%@.%@", v7, v6];
      p_lock = &v9->_lock;
      os_unfair_lock_lock_with_options();
      v18 = [(NSMutableDictionary *)v9->_onboardingSelections objectForKey:v16];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        context = (void *)MEMORY[0x1D9452090]();
        v31 = v9;
        HMFGetOSLogHandle();
        v32 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v40 = v33;
          __int16 v41 = 2112;
          id v42 = v16;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Onboarding selections matching key not found in the cache: %@", buf, 0x16u);
        }
        os_unfair_lock_unlock(p_lock);
      }
      else
      {
        v20 = [(NSMutableDictionary *)v9->_onboardingSelections objectForKeyedSubscript:v16];
        __int16 v21 = [(NSMutableDictionary *)v9->_onboardingUserUUID objectForKey:v16];

        if (v21)
        {
          uint64_t v22 = [(NSMutableDictionary *)v9->_onboardingUserUUID objectForKeyedSubscript:v16];

          v15 = (void *)v22;
        }
        os_unfair_lock_unlock(&v9->_lock);
        if ([(HMDSiriEndpointOnboardingManager *)v9 readyToApplyOnboardingSelectionsWithHomeUUID:v7 accessoryUUID:v6])
        {
          [(HMDSiriEndpointOnboardingManager *)v9 _applyOnboardingSelections:v20 accessoryUUID:v6 homeUUID:v7 userUUID:v15 cacheKey:v16 completion:0];
        }
        else
        {
          contexta = (void *)MEMORY[0x1D9452090]();
          v34 = v9;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v40 = v36;
            __int16 v41 = 2112;
            id v42 = v6;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@It's not ready to apply onboarding. accessoryUUID: %@", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = v9;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v40 = v30;
        __int16 v41 = 2112;
        id v42 = v6;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Onboarding selections are already configured on the accessory: %@", buf, 0x16u);
      }
      [(HMDSiriEndpointOnboardingManager *)v28 _setNeedsOnboardingCompleteWitHomeUUID:v7 accessoryUUID:v6 completion:0];
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    v24 = v9;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v26;
      __int16 v41 = 2112;
      id v42 = v6;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not determine needsOnboarding state. accessoryUUID: %@", buf, 0x16u);
    }
  }
}

- (HMDSiriEndpointOnboardingManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDSiriEndpointOnboardingManagerDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_onboardingUserUUID, 0);
  objc_storeStrong((id *)&self->_onboardingSelections, 0);
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)readyToApplyOnboardingSelectionsWithHomeUUID:(id)a3 accessoryUUID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDSiriEndpointOnboardingManager *)self dataSource];
  v9 = [v8 accessoryWithHomeUUID:v6 accessoryUUID:v7];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
    objc_opt_class();
    int v12 = objc_opt_isKindOfClass() & 1;
    if (v12) {
      v13 = v11;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (!v12)
    {
      __int16 v21 = (void *)MEMORY[0x1D9452090]();
      uint64_t v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        int v30 = 138543618;
        v31 = v24;
        __int16 v32 = 2112;
        id v33 = v7;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@HAP accessory is not found. accessoryUUID: %@", (uint8_t *)&v30, 0x16u);
      }
      goto LABEL_19;
    }
    if ([v11 isSecureSessionEstablished])
    {
      v15 = [v11 siriEndpointProfile];

      if (v15)
      {
        BOOL v16 = 1;
LABEL_20:

        goto LABEL_21;
      }
      __int16 v21 = (void *)MEMORY[0x1D9452090]();
      v28 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        int v30 = 138543618;
        v31 = v26;
        __int16 v32 = 2112;
        id v33 = v11;
        v27 = "%{public}@Siri endpoint profile is not created. Accessory: %@";
        goto LABEL_18;
      }
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x1D9452090]();
      v25 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        int v30 = 138543618;
        v31 = v26;
        __int16 v32 = 2112;
        id v33 = v11;
        v27 = "%{public}@Accessory is not configured. Accessory: %@";
LABEL_18:
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v30, 0x16u);
      }
    }
LABEL_19:

    BOOL v16 = 0;
    goto LABEL_20;
  }
  v17 = (void *)MEMORY[0x1D9452090]();
  v18 = self;
  BOOL v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    int v30 = 138543618;
    v31 = v20;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Accessory is not found. accessoryUUID: %@", (uint8_t *)&v30, 0x16u);
  }
  BOOL v16 = 0;
LABEL_21:

  return v16;
}

- (void)_enableUserListeningHistoryForHomeUUID:(id)a3 accessoryUUID:(id)a4 userUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HMDSiriEndpointOnboardingManager *)self dataSource];
  [v11 enableUserListeningHistoryForHomeUUID:v10 accessoryUUID:v9 userUUID:v8];
}

- (void)_setNeedsOnboardingCompleteWitHomeUUID:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HMDSiriEndpointOnboardingManager *)self dataSource];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__HMDSiriEndpointOnboardingManager__setNeedsOnboardingCompleteWitHomeUUID_accessoryUUID_completion___block_invoke;
  v13[3] = &unk_1E6A17D78;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 setNeedsOnboardingCompleteWitHomeUUID:v10 accessoryUUID:v9 completion:v13];
}

void __100__HMDSiriEndpointOnboardingManager__setNeedsOnboardingCompleteWitHomeUUID_accessoryUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Setting needsOnboarding complete failed with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)_applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 userUUID:(id)a6 cacheKey:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a3;
  v20 = [(HMDSiriEndpointOnboardingManager *)self dataSource];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __115__HMDSiriEndpointOnboardingManager__applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_cacheKey_completion___block_invoke;
  v26[3] = &unk_1E6A11AE0;
  v26[4] = self;
  id v27 = v15;
  id v28 = v14;
  id v29 = v17;
  id v30 = v16;
  id v31 = v18;
  id v21 = v18;
  id v22 = v16;
  id v23 = v17;
  id v24 = v14;
  id v25 = v15;
  [v20 applyOnboardingSelections:v19 accessoryUUID:v24 homeUUID:v25 completion:v26];
}

void __115__HMDSiriEndpointOnboardingManager__applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_cacheKey_completion___block_invoke(id *a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = a1[4];
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    id v10 = HMSiriEndpointOnboardingResultAsString();
    *(_DWORD *)buf = 138543874;
    id v23 = v9;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Apply result received from controller: %{public}@ error:%{public}@", buf, 0x20u);
  }
  if (v5 || a3 != 2)
  {
    id v14 = (void (**)(id, void, uint64_t))a1[9];
    if (v14) {
      v14[2](v14, 0, a3);
    }
  }
  else
  {
    objc_initWeak((id *)buf, a1[4]);
    id v11 = a1[4];
    id v12 = a1[5];
    id v13 = a1[6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __115__HMDSiriEndpointOnboardingManager__applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_cacheKey_completion___block_invoke_20;
    v15[3] = &unk_1E6A11AB8;
    objc_copyWeak(&v21, (id *)buf);
    id v16 = a1[7];
    id v17 = a1[5];
    id v18 = a1[6];
    id v19 = a1[8];
    id v20 = a1[9];
    [v11 _setNeedsOnboardingCompleteWitHomeUUID:v12 accessoryUUID:v13 completion:v15];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

void __115__HMDSiriEndpointOnboardingManager__applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_cacheKey_completion___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 72));
  if (!v3)
  {
    uint64_t v5 = os_unfair_lock_lock_with_options();
    id v6 = (void *)MEMORY[0x1D9452090](v5);
    id v7 = WeakRetained;
    HMFGetOSLogHandle();
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing cached onboarding selections, key: %@", (uint8_t *)&v12, 0x16u);
    }
    [v7[1] removeObjectForKey:*(void *)(a1 + 32)];
    [v7[2] removeObjectForKey:*(void *)(a1 + 32)];
    [v7 _enableUserListeningHistoryForHomeUUID:*(void *)(a1 + 40) accessoryUUID:*(void *)(a1 + 48) userUUID:*(void *)(a1 + 56)];
    uint64_t v11 = *(void *)(a1 + 64);
    if (v11) {
      (*(void (**)(uint64_t, void, uint64_t))(v11 + 16))(v11, 0, 2);
    }
    os_unfair_lock_unlock(WeakRetained + 6);
  }
}

- (void)applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 userUUID:(id)a6 completion:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v50 = a6;
  id v15 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_30;
  }
  if (!v13)
  {
LABEL_30:
    _HMFPreconditionFailure();
    goto LABEL_31;
  }
  if (!v14)
  {
LABEL_31:
    _HMFPreconditionFailure();
LABEL_32:
    _HMFPreconditionFailure();
  }
  uint64_t v16 = (void (**)(void, void, void))v15;
  if (!v15) {
    goto LABEL_32;
  }
  id v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    uint64_t v54 = (uint64_t)v20;
    __int16 v55 = 2112;
    id v56 = v12;
    __int16 v57 = 2112;
    id v58 = v14;
    __int16 v59 = 2112;
    id v60 = v13;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Apply onboarding selections: %@ homeUUID: %@ accessoryUUID: %@", buf, 0x2Au);
  }
  id v21 = [(HMDSiriEndpointOnboardingManager *)v18 dataSource];
  id v22 = [v21 needsOnboardingForHomeUUID:v14 accessoryUUID:v13];
  id v23 = v22;
  if (v22)
  {
    if ([v22 BOOLValue])
    {
      __int16 v24 = [NSString stringWithFormat:@"%@.%@", v14, v13];
      lock = &v18->_lock;
      os_unfair_lock_lock_with_options();
      id v25 = [(NSMutableDictionary *)v18->_onboardingSelections objectForKey:v24];

      context = (void *)MEMORY[0x1D9452090]();
      __int16 v26 = v18;
      if (v25)
      {
        HMFGetOSLogHandle();
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v54 = (uint64_t)v28;
          __int16 v55 = 2112;
          id v56 = v24;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Onboarding selections are already cached, key: %@", buf, 0x16u);
        }
        v16[2](v16, 0, 1);
        os_unfair_lock_unlock(lock);
      }
      else
      {
        HMFGetOSLogHandle();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v54 = v38;
          __int16 v55 = 2112;
          id v56 = v24;
          uint64_t v45 = (void *)v38;
          _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Caching onboarding selections, key: %@", buf, 0x16u);
        }
        contexta = (void *)MEMORY[0x1D9452090]([(NSMutableDictionary *)v18->_onboardingSelections setObject:v12 forKey:v24]);
        v39 = v26;
        HMFGetOSLogHandle();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          __int16 v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v54 = (uint64_t)v41;
          __int16 v55 = 2112;
          id v56 = v50;
          _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Caching onboarding user UUID %@", buf, 0x16u);
        }
        [v39[2] setObject:v50 forKey:v24];
        os_unfair_lock_unlock(lock);
        if ([v39 readyToApplyOnboardingSelectionsWithHomeUUID:v14 accessoryUUID:v13])
        {
          [v39 _applyOnboardingSelections:v12 accessoryUUID:v13 homeUUID:v14 userUUID:v50 cacheKey:v24 completion:v16];
        }
        else
        {
          os_unfair_lock_t locka = (os_unfair_lock_t)MEMORY[0x1D9452090]();
          id v42 = v39;
          __int16 v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            id v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v54 = (uint64_t)v44;
            __int16 v55 = 2112;
            id v56 = v13;
            _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@It's not ready to apply onboarding. accessoryUUID: %@", buf, 0x16u);
          }
          v16[2](v16, 0, 3);
        }
      }
    }
    else
    {
      id v33 = (void *)MEMORY[0x1D9452090]();
      uint64_t v34 = v18;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v54 = (uint64_t)v36;
        __int16 v55 = 2112;
        id v56 = v13;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Onboarding selections are already configured on the accessory: %@", buf, 0x16u);
      }
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __105__HMDSiriEndpointOnboardingManager_applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_completion___block_invoke;
      v51[3] = &unk_1E6A19358;
      v52 = v16;
      [(HMDSiriEndpointOnboardingManager *)v34 _setNeedsOnboardingCompleteWitHomeUUID:v14 accessoryUUID:v13 completion:v51];
      __int16 v24 = v52;
    }
  }
  else
  {
    id v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = v18;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v54 = (uint64_t)v32;
      __int16 v55 = 2112;
      id v56 = v13;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not determine needsOnboarding state. accessoryUUID: %@", buf, 0x16u);
    }
    __int16 v24 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    ((void (**)(void, void *, uint64_t))v16)[2](v16, v24, 1);
  }
}

uint64_t __105__HMDSiriEndpointOnboardingManager_applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleCompositeSettingsControllerConfigured:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"HMDHomeUUIDOwnerUUIDKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    int v9 = objc_msgSend(v8, "hmf_UUIDForKey:", @"HMDCompositeSettingControllerOwnerUUIDNotificationKey");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v12 = objc_msgSend(v8, "hmf_UUIDForKey:", @"HMDCompositeSettingControllerHomeUUIDNotificationKey");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;

      if (v14)
      {
        [(HMDSiriEndpointOnboardingManager *)self applyCachedOnboardingSelectionsWithAccessoryUUID:v11 homeUUID:v14];
      }
      else
      {
        id v23 = (void *)MEMORY[0x1D9452090]();
        __int16 v24 = self;
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = HMFGetLogIdentifier();
          int v27 = 138543362;
          uint64_t v28 = v26;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@CompositeSettingsController is congigured with invalid homeUUID", (uint8_t *)&v27, 0xCu);
        }
      }
    }
    else
    {
      id v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = self;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        int v27 = 138543362;
        uint64_t v28 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@CompositeSettingsController is congigured with invalid accessoryUUID", (uint8_t *)&v27, 0xCu);
      }
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v27 = 138543362;
      uint64_t v28 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@CompositeSettingsController is congigured with invalid homeUUID and ownerUUID info", (uint8_t *)&v27, 0xCu);
    }
  }
}

- (HMDSiriEndpointOnboardingManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDSiriEndpointOnboardingManager;
  uint64_t v5 = [(HMDSiriEndpointOnboardingManager *)&v13 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    onboardingSelections = v5->_onboardingSelections;
    v5->_onboardingSelections = v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    onboardingUserUUID = v5->_onboardingUserUUID;
    v5->_onboardingUserUUID = v8;

    objc_storeWeak((id *)&v5->_dataSource, v4);
  }
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:v5 selector:sel_handleCompositeSettingsControllerConfigured_ name:@"HMDCompositeSettingsControllerDidConfigureNotification" object:0];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:v5 selector:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConfiguredNotification" object:0];

  return v5;
}

@end
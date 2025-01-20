@interface HMLightProfile
+ (id)logCategory;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMLightProfile)initWithLightProfile:(id)a3;
- (HMLightProfileDelegate)delegate;
- (HMLightProfileSettings)settings;
- (NSString)logIdentifier;
- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 completion:(id)a4;
- (void)fetchSettingsWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNaturalLightingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setNaturalLightingEnabled:(BOOL)a3 shouldRetryOnFailure:(BOOL)a4 completion:(id)a5;
- (void)updateSettings:(id)a3 withReason:(id)a4;
@end

@implementation HMLightProfile

- (HMLightProfile)initWithLightProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMLightProfile;
  v5 = [(HMAccessoryProfile *)&v10 initWithAccessoryProfile:v4];
  if (v5)
  {
    v6 = [v4 profileUniqueIdentifier];
    uint64_t v7 = [v6 UUIDString];
    logIdentifier = v5->_logIdentifier;
    v5->_logIdentifier = (NSString *)v7;
  }
  return v5;
}

- (void)updateSettings:(id)a3 withReason:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMLightProfile *)self lightProfile];
  v9 = [v8 settings];
  char v10 = [v9 isEqual:v6];

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      v15 = [(HMLightProfile *)v12 settings];
      *(_DWORD *)buf = 138544130;
      v23 = v14;
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 2112;
      v27 = v15;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating settings with reason: %@ (%@:%@)", buf, 0x2Au);
    }
    v16 = [(HMLightProfile *)v12 lightProfile];
    [v16 setSettings:v6];

    v17 = [(HMLightProfile *)v12 lightProfile];
    v18 = [v17 context];
    v19 = [v18 delegateCaller];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__HMLightProfile_updateSettings_withReason___block_invoke;
    v20[3] = &unk_1E5945628;
    v20[4] = v12;
    id v21 = v6;
    [v19 invokeBlock:v20];
  }
}

- (HMLightProfileSettings)settings
{
  v2 = [(HMLightProfile *)self lightProfile];
  v3 = [v2 settings];

  return (HMLightProfileSettings *)v3;
}

- (void)setDelegate:(id)a3
{
}

uint64_t __31___HMLightProfile_lightProfile__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 lightProfile];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMLightProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMLightProfileDelegate *)WeakRetained;
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMLightProfile *)self lightProfile];
  id v6 = [v5 context];

  if (!v4)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMLightProfile fetchSettingsWithCompletion:]", @"completion"];
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      v32 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  if (v6)
  {
    id v7 = [(HMAccessoryProfile *)self accessory];
    v8 = [v7 home];

    if (v8)
    {
      v9 = [MEMORY[0x1E4F1CAD0] setWithObject:self];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46__HMLightProfile_fetchSettingsWithCompletion___block_invoke;
      v26[3] = &unk_1E59452C0;
      v26[4] = self;
      id v27 = v6;
      id v28 = v4;
      [v8 fetchSettingsForLightProfiles:v9 withCompletion:v26];
    }
    else
    {
      v14 = (void *)MEMORY[0x19F3A64A0]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v17;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Home is not set on light profile accessory", buf, 0xCu);
      }
      v18 = [v6 delegateCaller];
      v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      [v18 callCompletion:v4 obj:0 error:v19];

      v8 = 0;
    }
  }
  else
  {
    char v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v13;
      __int16 v31 = 2080;
      v32 = "-[HMLightProfile fetchSettingsWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __46__HMLightProfile_fetchSettingsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a3;
  v5 = [a2 objectForKey:*(void *)(a1 + 32)];
  id v6 = [v5 settings];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v8 = *(void *)(a1 + 48);
    v9 = [v5 settings];
    char v10 = v7;
    uint64_t v11 = v8;
    v12 = v9;
    v13 = 0;
LABEL_5:
    [v10 callCompletion:v11 obj:v12 error:v13];

    goto LABEL_6;
  }
  v14 = [v5 error];

  v15 = [*(id *)(a1 + 40) delegateCaller];
  id v7 = v15;
  uint64_t v16 = *(void *)(a1 + 48);
  if (v14)
  {
    v9 = [v5 error];
    char v10 = v7;
    uint64_t v11 = v16;
    v12 = 0;
    v13 = v9;
    goto LABEL_5;
  }
  [v15 callCompletion:v16 obj:0 error:v17];
LABEL_6:
}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMLightProfile *)self lightProfile];
  uint64_t v8 = [v7 context];

  if (!v6)
  {
    uint64_t v27 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMLightProfile fetchNaturalLightColorTemperatureForBrightness:completion:]", @"completion"];
    id v28 = (void *)MEMORY[0x19F3A64A0]();
    id v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v31;
      __int16 v40 = 2112;
      v41 = (const char *)v27;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v32);
  }
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F65488]);
    char v10 = [(HMLightProfile *)self lightProfile];
    uint64_t v11 = [v10 profileUniqueIdentifier];
    v12 = (void *)[v9 initWithTarget:v11];

    v36 = @"HMLightProfile.bmk";
    v13 = [NSNumber numberWithInteger:a3];
    v37 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];

    v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMLightProfile.fnlctfbm" destination:v12 payload:v14];
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v19;
      __int16 v40 = 2048;
      v41 = (const char *)a3;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetching natural lighting color temperature for brightness: %lu", buf, 0x16u);
    }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __76__HMLightProfile_fetchNaturalLightColorTemperatureForBrightness_completion___block_invoke;
    v33[3] = &unk_1E5945510;
    v33[4] = v17;
    id v34 = v8;
    id v35 = v6;
    [v15 setResponseHandler:v33];
    uint64_t v20 = [(HMLightProfile *)v17 lightProfile];
    id v21 = [v20 context];
    v22 = [v21 messageDispatcher];
    [v22 sendMessage:v15];
  }
  else
  {
    v23 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v26;
      __int16 v40 = 2080;
      v41 = "-[HMLightProfile fetchNaturalLightColorTemperatureForBrightness:completion:]";
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
  }
}

void __76__HMLightProfile_fetchNaturalLightColorTemperatureForBrightness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_numberForKey:", @"HMLightProfile.ctmk");
  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch natural lighting color temperature %@:%@", (uint8_t *)&v13, 0x20u);
    }
  }
  v12 = [*(id *)(a1 + 40) delegateCaller];
  [v12 callCompletion:*(void *)(a1 + 48) obj:v7 error:v5];
}

- (void)setNaturalLightingEnabled:(BOOL)a3 shouldRetryOnFailure:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(HMLightProfile *)self lightProfile];
  char v10 = [v9 context];

  if (!v8)
  {
    uint64_t v31 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMLightProfile setNaturalLightingEnabled:shouldRetryOnFailure:completion:]", @"completion"];
    id v32 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v33 = self;
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v35;
      __int16 v44 = 2112;
      v45 = (const char *)v31;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v31 userInfo:0];
    objc_exception_throw(v36);
  }
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    v12 = [(HMLightProfile *)self lightProfile];
    int v13 = [v12 profileUniqueIdentifier];
    v14 = (void *)[v11 initWithTarget:v13];

    v40[0] = @"HMLightProfile.snlemk";
    __int16 v15 = [NSNumber numberWithBool:v6];
    v40[1] = @"HMLightProfile.snlesrofk";
    v41[0] = v15;
    id v16 = [NSNumber numberWithBool:v5];
    v41[1] = v16;
    __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];

    id v18 = [MEMORY[0x1E4F654B0] messageWithName:@"HMLightProfile.snlem" destination:v14 payload:v17];
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      HMFEnabledStatusToString();
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v22;
      __int16 v44 = 2112;
      v45 = v23;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Setting Natural Lighting to: %@", buf, 0x16u);
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __76__HMLightProfile_setNaturalLightingEnabled_shouldRetryOnFailure_completion___block_invoke;
    v37[3] = &unk_1E5945510;
    v37[4] = v20;
    id v38 = v10;
    id v39 = v8;
    [v18 setResponseHandler:v37];
    __int16 v24 = [(HMLightProfile *)v20 lightProfile];
    id v25 = [v24 context];
    __int16 v26 = [v25 messageDispatcher];
    [v26 sendMessage:v18];
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
    id v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v30;
      __int16 v44 = 2080;
      v45 = "-[HMLightProfile setNaturalLightingEnabled:shouldRetryOnFailure:completion:]";
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v8 + 2))(v8, v14);
  }
}

void __76__HMLightProfile_setNaturalLightingEnabled_shouldRetryOnFailure_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(v6, "hmf_dataForKey:", @"hmlp.sck");
    id v23 = 0;
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v23];
    id v10 = v23;
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = *(id *)(a1 + 32);
    int v13 = HMFGetOSLogHandle();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v25 = v15;
        __int16 v26 = 2112;
        id v27 = v9;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Successfully updated settings to: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) updateSettings:v9 withReason:@"HMLightProfile.snlem"];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v25 = v20;
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode light profile settings: %@", buf, 0x16u);
      }
      id v21 = v10;

      id v5 = v21;
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the natural light setting: %@", buf, 0x16u);
    }
  }
  v22 = [*(id *)(a1 + 40) delegateCaller];
  [v22 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)setNaturalLightingEnabled:(BOOL)a3 completionHandler:(id)a4
{
}

void __44__HMLightProfile_updateSettings_withReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 lightProfile:*(void *)(a1 + 32) didUpdateSettings:*(void *)(a1 + 40)];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 settings];
    id v8 = [(HMLightProfile *)self settings];
    char v9 = [v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        v14 = [(HMLightProfile *)v11 lightProfile];
        __int16 v15 = [v14 settings];
        [v6 settings];
        id v16 = v23 = v10;
        *(_DWORD *)buf = 138543874;
        id v27 = v13;
        __int16 v28 = 2112;
        id v29 = v15;
        __int16 v30 = 2112;
        uint64_t v31 = v16;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating settings because of merge: %@ to %@ ", buf, 0x20u);

        id v10 = v23;
      }

      id v17 = [(HMLightProfile *)v11 lightProfile];
      [v17 setSettings:v7];

      id v18 = [(HMLightProfile *)v11 lightProfile];
      uint64_t v19 = [v18 context];
      uint64_t v20 = [v19 delegateCaller];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __37__HMLightProfile_mergeFromNewObject___block_invoke;
      v24[3] = &unk_1E5945628;
      v24[4] = v11;
      id v25 = v7;
      [v20 invokeBlock:v24];
    }
    char v21 = v9 ^ 1;
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

void __37__HMLightProfile_mergeFromNewObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 lightProfile:*(void *)(a1 + 32) didUpdateSettings:*(void *)(a1 + 40)];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_61864 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_61864, &__block_literal_global_61865);
  }
  id v2 = (void *)logCategory__hmf_once_v17_61866;

  return v2;
}

uint64_t __29__HMLightProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17_61866;
  logCategory__hmf_once_v17_61866 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end
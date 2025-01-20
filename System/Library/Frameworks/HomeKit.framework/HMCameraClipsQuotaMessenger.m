@interface HMCameraClipsQuotaMessenger
+ (NSUUID)UUID;
+ (id)logCategory;
- (HMCameraClipsQuotaMessenger)initWithContext:(id)a3;
- (_HMContext)context;
- (void)fetchNamesForZonesWithCloudStorageEnabledWithCompletion:(id)a3;
- (void)setCloudStorageEnabled:(BOOL)a3 forZoneWithName:(id)a4 completion:(id)a5;
@end

@implementation HMCameraClipsQuotaMessenger

- (void).cxx_destruct
{
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCloudStorageEnabled:(BOOL)a3 forZoneWithName:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Updating cloud storage"];
  v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    [v10 identifier];
    id v29 = v9;
    v16 = id v15 = v8;
    v17 = [v16 shortDescription];
    v18 = HMFEnabledStatusToString();
    *(_DWORD *)buf = 138543874;
    v37 = v14;
    __int16 v38 = 2114;
    v39 = v17;
    __int16 v40 = 2112;
    v41 = v18;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Setting cloud storage to %@", buf, 0x20u);

    id v8 = v15;
    id v9 = v29;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F65488]);
  v20 = [(id)objc_opt_class() UUID];
  v21 = (void *)[v19 initWithTarget:v20];

  v34[0] = @"HMCCQMR.mk.isEnabled";
  v22 = [NSNumber numberWithBool:v6];
  v34[1] = @"HMCCQMR.mk.zoneName";
  v35[0] = v22;
  v35[1] = v8;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  v24 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCQMR.m.updateCloudStorage" destination:v21 payload:v23];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __81__HMCameraClipsQuotaMessenger_setCloudStorageEnabled_forZoneWithName_completion___block_invoke;
  v30[3] = &unk_1E5943980;
  v30[4] = v12;
  id v31 = v10;
  BOOL v33 = v6;
  id v32 = v9;
  id v25 = v9;
  id v26 = v10;
  [v24 setResponseHandler:v30];
  v27 = [(HMCameraClipsQuotaMessenger *)v12 context];
  v28 = [v27 messageDispatcher];
  [v28 sendMessage:v24 completionHandler:0];
}

void __81__HMCameraClipsQuotaMessenger_setCloudStorageEnabled_forZoneWithName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 40) identifier];
      v13 = [v12 shortDescription];
      int v19 = 138543874;
      v20 = v11;
      __int16 v21 = 2114;
      v22 = v13;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to update cloud storage: %@", (uint8_t *)&v19, 0x20u);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v14 = [*(id *)(a1 + 40) identifier];
    id v15 = [v14 shortDescription];
    v16 = HMFEnabledStatusToString();
    int v19 = 138543874;
    v20 = v11;
    __int16 v21 = 2114;
    v22 = v15;
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully set cloud storage to %@", (uint8_t *)&v19, 0x20u);

    goto LABEL_6;
  }

  v17 = [*(id *)(a1 + 32) context];
  v18 = [v17 delegateCaller];
  [v18 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)fetchNamesForZonesWithCloudStorageEnabledWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetching names for zones with cloud storage enabled"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    v10 = [v5 identifier];
    v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching names for zones with cloud storage enabled", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  v13 = [(id)objc_opt_class() UUID];
  v14 = (void *)[v12 initWithTarget:v13];

  id v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCQMR.m.fetchNamesForZonesWithEnabledCloudStorage" destination:v14 payload:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__HMCameraClipsQuotaMessenger_fetchNamesForZonesWithCloudStorageEnabledWithCompletion___block_invoke;
  v20[3] = &unk_1E5945510;
  v20[4] = v7;
  id v21 = v5;
  id v22 = v4;
  id v16 = v4;
  id v17 = v5;
  [v15 setResponseHandler:v20];
  v18 = [(HMCameraClipsQuotaMessenger *)v7 context];
  int v19 = [v18 messageDispatcher];
  [v19 sendMessage:v15];
}

void __87__HMCameraClipsQuotaMessenger_fetchNamesForZonesWithCloudStorageEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = objc_msgSend(v6, "hmf_setForKey:", @"HMCCQMR.mk.zoneNames");
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      v13 = [*(id *)(a1 + 40) identifier];
      v14 = [v13 shortDescription];
      int v24 = 138543874;
      __int16 v25 = v12;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched names for zones with cloud storage enabled: %@", (uint8_t *)&v24, 0x20u);
    }
    id v15 = [*(id *)(a1 + 32) context];
    id v16 = [v15 delegateCaller];
    id v17 = v16;
    uint64_t v18 = *(void *)(a1 + 48);
    int v19 = v7;
    id v20 = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [*(id *)(a1 + 40) identifier];
      __int16 v23 = [v22 shortDescription];
      int v24 = 138543874;
      __int16 v25 = v21;
      __int16 v26 = 2114;
      uint64_t v27 = v23;
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch names for zones with cloud storage enabled: %@", (uint8_t *)&v24, 0x20u);
    }
    id v15 = [*(id *)(a1 + 32) context];
    id v16 = [v15 delegateCaller];
    id v17 = v16;
    uint64_t v18 = *(void *)(a1 + 48);
    int v19 = 0;
    id v20 = v5;
  }
  [v16 callCompletion:v18 obj:v19 error:v20];
}

- (HMCameraClipsQuotaMessenger)initWithContext:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMCameraClipsQuotaMessenger;
    v7 = [(HMCameraClipsQuotaMessenger *)&v12 init];
    id v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_context, a3);
    }

    return v8;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (HMCameraClipsQuotaMessenger *)+[HMCameraClipsQuotaMessenger logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_46718 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_46718, &__block_literal_global_46719);
  }
  v2 = (void *)logCategory__hmf_once_v7_46720;

  return v2;
}

uint64_t __42__HMCameraClipsQuotaMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_46720;
  logCategory__hmf_once_v7_46720 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSUUID)UUID
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"EF39674E-D774-4642-8D67-584A72131553"];

  return (NSUUID *)v2;
}

@end
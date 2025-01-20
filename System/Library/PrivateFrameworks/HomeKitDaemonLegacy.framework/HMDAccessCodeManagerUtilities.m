@interface HMDAccessCodeManagerUtilities
+ (BOOL)allModificationRequests:(id)a3 areAddingAccessCode:(id)a4;
+ (BOOL)anyModificationFailed:(id)a3;
+ (id)addedAccessoryAccessCodesFromModificationResponses:(id)a3;
+ (id)filteredFetchResponses:(id)a3 forUser:(id)a4;
+ (id)logCategory;
+ (id)removedAccessoryAccessCodesFromModificationResponses:(id)a3;
+ (id)updatedAccessoryAccessCodesFromModificationResponses:(id)a3;
@end

@implementation HMDAccessCodeManagerUtilities

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_2881 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_2881, &__block_literal_global_280);
  }
  v2 = (void *)logCategory__hmf_once_v10_2882;
  return v2;
}

uint64_t __44__HMDAccessCodeManagerUtilities_logCategory__block_invoke()
{
  logCategory__hmf_once_v10_2882 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)allModificationRequests:(id)a3 areAddingAccessCode:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__HMDAccessCodeManagerUtilities_allModificationRequests_areAddingAccessCode___block_invoke;
  v8[3] = &unk_1E6A059B8;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "na_all:", v8);

  return (char)a3;
}

uint64_t __77__HMDAccessCodeManagerUtilities_allModificationRequests_areAddingAccessCode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = [v5 accessCodeValue];
    id v9 = [v8 stringValue];
    uint64_t v10 = [v7 isEqualToString:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)anyModificationFailed:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_276);
}

BOOL __55__HMDAccessCodeManagerUtilities_anyModificationFailed___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)filteredFetchResponses:(id)a3 forUser:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 isAdministrator];
  id v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = a1;
  v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      v13 = HMFGetLogIdentifier();
      v14 = [v7 uuid];
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@User: %@ is an admin, so we can safely send all the fetch responses.", buf, 0x16u);
    }
    id v15 = v6;
  }
  else
  {
    if (v12)
    {
      v16 = HMFGetLogIdentifier();
      v17 = [v7 uuid];
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@User: %@ is not an admin, so redact all access codes except the user's own.", buf, 0x16u);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__HMDAccessCodeManagerUtilities_filteredFetchResponses_forUser___block_invoke;
    v19[3] = &unk_1E6A05630;
    id v20 = v7;
    objc_msgSend(v6, "na_map:", v19);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

id __64__HMDAccessCodeManagerUtilities_filteredFetchResponses_forUser___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 accessoryAccessCodeValues];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__HMDAccessCodeManagerUtilities_filteredFetchResponses_forUser___block_invoke_2;
  v11[3] = &unk_1E6A12720;
  id v12 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(v4, "na_filter:", v11);

  id v6 = objc_alloc(MEMORY[0x1E4F2E508]);
  id v7 = [v3 accessoryUUID];
  int v8 = [v3 error];

  id v9 = (void *)[v6 initWithAccessoryUUID:v7 accessoryAccessCodeValues:v5 error:v8];
  return v9;
}

uint64_t __64__HMDAccessCodeManagerUtilities_filteredFetchResponses_forUser___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accessCodeValue];
  v4 = [v3 stringValue];
  id v5 = [*(id *)(a1 + 32) accessCode];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

+ (id)removedAccessoryAccessCodesFromModificationResponses:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_270);
}

id __86__HMDAccessCodeManagerUtilities_removedAccessoryAccessCodesFromModificationResponses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 operationType];
  v4 = [v2 error];

  id v5 = 0;
  if (v3 == 2 && !v4)
  {
    id v5 = [v2 accessoryAccessCodeValue];
  }

  return v5;
}

+ (id)updatedAccessoryAccessCodesFromModificationResponses:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_268);
}

id __86__HMDAccessCodeManagerUtilities_updatedAccessoryAccessCodesFromModificationResponses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 operationType];
  v4 = [v2 error];

  id v5 = 0;
  if (v3 == 1 && !v4)
  {
    id v5 = [v2 accessoryAccessCodeValue];
  }

  return v5;
}

+ (id)addedAccessoryAccessCodesFromModificationResponses:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_266);
}

id __84__HMDAccessCodeManagerUtilities_addedAccessoryAccessCodesFromModificationResponses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 operationType];
  v4 = [v2 error];

  id v5 = 0;
  if (!v3 && !v4)
  {
    id v5 = [v2 accessoryAccessCodeValue];
  }

  return v5;
}

@end
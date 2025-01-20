@interface MKFUser
@end

@implementation MKFUser

void __39___MKFUser_additionalModelsForSameUser__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 idsMergeIdentifier];
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) idsMergeIdentifier];
    int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 32);
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = HMFGetLogIdentifier();
        v11 = *(void **)(a1 + 32);
        v12 = [v3 debugDescription];
        int v39 = 138543874;
        v40 = v10;
        __int16 v41 = 2112;
        id v42 = v11;
        __int16 v43 = 2112;
        v44 = v12;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@%@ matched additional user model with the same idsMergeIdentifier: %@", (uint8_t *)&v39, 0x20u);
      }
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v39 = 138543618;
      v40 = v16;
      __int16 v41 = 2112;
      id v42 = v3;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@User model missing idsMergeIdentifier: %@", (uint8_t *)&v39, 0x16u);
    }
    v17 = [v3 accountIdentifier];
    if (v17)
    {
      v18 = [*(id *)(a1 + 32) accountIdentifier];
      int v19 = [v17 isEqual:v18];

      if (v19)
      {
        v20 = (void *)MEMORY[0x230FBD990]();
        id v21 = *(id *)(a1 + 32);
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v23 = HMFGetLogIdentifier();
          v24 = *(void **)(a1 + 32);
          v25 = [v3 debugDescription];
          int v39 = 138543874;
          v40 = v23;
          __int16 v41 = 2112;
          id v42 = v24;
          __int16 v43 = 2112;
          v44 = v25;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@%@ matched additional user model with the same accountIdentifier: %@", (uint8_t *)&v39, 0x20u);
        }
        [*(id *)(a1 + 40) addObject:v3];
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = *(id *)(a1 + 32);
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = HMFGetLogIdentifier();
        int v39 = 138543618;
        v40 = v29;
        __int16 v41 = 2112;
        id v42 = v3;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@User model missing accountIdentifier: %@", (uint8_t *)&v39, 0x16u);
      }
      v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = *(id *)(a1 + 32);
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        int v39 = 138543618;
        v40 = v33;
        __int16 v41 = 2112;
        id v42 = v3;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine if this user model is a duplicate: %@", (uint8_t *)&v39, 0x16u);
      }
      v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = *(id *)(a1 + 32);
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = HMFGetLogIdentifier();
        v38 = [v3 debugDescription];
        int v39 = 138543618;
        v40 = v37;
        __int16 v41 = 2112;
        id v42 = v38;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v39, 0x16u);
      }
    }
  }
}

void __23___MKFUser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v26;
  logCategory__hmf_once_v26 = v0;
}

void __24___MKFUser_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v24;
  homeRelation__hmf_once_v24 = v0;
}

@end
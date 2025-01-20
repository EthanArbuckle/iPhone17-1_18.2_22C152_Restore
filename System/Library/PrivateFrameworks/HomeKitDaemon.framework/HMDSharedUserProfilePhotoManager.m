@interface HMDSharedUserProfilePhotoManager
+ (id)logCategory;
- (HMDCoreDataCloudTransform)cloudTransform;
- (HMDSharedUserProfilePhotoManager)initWithCloudTransform:(id)a3 delegate:(id)a4;
- (HMDSharedUserProfilePhotoManagerDelegate)delegate;
- (void)configure;
- (void)didInsertOrUpdateModel:(id)a3 changedProperties:(id)a4;
@end

@implementation HMDSharedUserProfilePhotoManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudTransform, 0);
}

- (HMDSharedUserProfilePhotoManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDSharedUserProfilePhotoManagerDelegate *)WeakRetained;
}

- (HMDCoreDataCloudTransform)cloudTransform
{
  return self->_cloudTransform;
}

- (void)didInsertOrUpdateModel:(id)a3 changedProperties:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v27 = 138543618;
      v28 = v14;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification about modified shared profile photo: %@", (uint8_t *)&v27, 0x16u);
    }
    v15 = [v10 workingStoreHomeMember];
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = v12;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      int v27 = 138543618;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@updating member %@", (uint8_t *)&v27, 0x16u);
    }
    v20 = [(HMDSharedUserProfilePhotoManager *)v17 delegate];
    v21 = [v15 idsMergeIdentifier];
    v22 = [v20 userWithMergeID:v21];

    if (!v22)
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = v17;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        int v27 = 138543874;
        v28 = v26;
        __int16 v29 = 2112;
        id v30 = 0;
        __int16 v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Found no user %@ for member: %@", (uint8_t *)&v27, 0x20u);
      }
    }
    [v22 sendSharedUserProfileMetadataUpdatedMessage];
  }
}

- (void)configure
{
  v6[1] = *MEMORY[0x263EF8340];
  v3 = [(HMDSharedUserProfilePhotoManager *)self cloudTransform];
  v4 = +[MKFCKSharedUserPhoto entity];
  v6[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 registerCloudChangeListener:self forEntities:v5];
}

- (HMDSharedUserProfilePhotoManager)initWithCloudTransform:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSharedUserProfilePhotoManager;
  v9 = [(HMDSharedUserProfilePhotoManager *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cloudTransform, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_122213 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_122213, &__block_literal_global_122214);
  }
  v2 = (void *)logCategory__hmf_once_v5_122215;
  return v2;
}

void __47__HMDSharedUserProfilePhotoManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_122215;
  logCategory__hmf_once_v5_122215 = v0;
}

@end
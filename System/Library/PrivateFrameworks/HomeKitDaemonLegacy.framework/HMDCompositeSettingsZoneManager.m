@interface HMDCompositeSettingsZoneManager
+ (id)logCategory;
- (BOOL)createZoneIfNotExist;
- (BOOL)isConfigured;
- (HMBCloudZone)cloudZone;
- (HMBLocalZone)localZone;
- (HMDCompositeSettingsZoneManager)initWithDatabase:(id)a3 workQueue:(id)a4 zoneName:(id)a5 createZoneIfNotExists:(BOOL)a6;
- (HMDDatabase)database;
- (NAFuture)configurationFuture;
- (NSString)zoneName;
- (OS_dispatch_queue)workQueue;
- (id)database:(id)a3 willRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)database:(id)a3 didReceiveMessageWithUserInfo:(id)a4;
- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)remove;
- (void)setCloudZone:(id)a3;
- (void)setLocalZone:(id)a3;
@end

@implementation HMDCompositeSettingsZoneManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationFuture, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (NAFuture)configurationFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)createZoneIfNotExist
{
  return self->_createZoneIfNotExist;
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 16, 1);
}

- (void)remove
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCompositeSettingsZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D9452090]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing Zone", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v5);
  v8 = [(HMDCompositeSettingsZoneManager *)v5 configurationFuture];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__HMDCompositeSettingsZoneManager_remove__block_invoke;
  v10[3] = &unk_1E6A14FA8;
  objc_copyWeak(&v11, (id *)buf);
  id v9 = (id)[v8 addSuccessBlock:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __41__HMDCompositeSettingsZoneManager_remove__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained localZone];
  if (v5)
  {
    v6 = [WeakRetained database];
    v7 = [v6 removeLocalAndCloudDataForLocalZone:v5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__HMDCompositeSettingsZoneManager_remove__block_invoke_18;
    v13[3] = &unk_1E6A17A30;
    v13[4] = WeakRetained;
    id v8 = (id)[v7 addCompletionBlock:v13];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil zone during cleanup", buf, 0xCu);
    }
  }
}

void __41__HMDCompositeSettingsZoneManager_remove__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v19 = v11;
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      id v23 = v6;
      v12 = "%{public}@Zone removal returned result:%@ error:%@";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v13, v14, v12, buf, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    __int16 v20 = 2112;
    id v21 = v5;
    v12 = "%{public}@Removed zone with result:%@";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 22;
    goto LABEL_6;
  }

  uint64_t v16 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HMDCompositeSettingsZoneManager_remove__block_invoke_19;
  block[3] = &unk_1E6A19B30;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v16, block);
}

uint64_t __41__HMDCompositeSettingsZoneManager_remove__block_invoke_19(uint64_t a1)
{
  [*(id *)(a1 + 32) setCloudZone:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setLocalZone:0];
}

- (void)database:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@did receive message with  user info %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(HMDCompositeSettingsZoneManager *)self zoneName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = [(HMDCompositeSettingsZoneManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__HMDCompositeSettingsZoneManager_database_didRemoveZoneWithName_isPrivate___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

uint64_t __76__HMDCompositeSettingsZoneManager_database_didRemoveZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Zone removed", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) setCloudZone:0];
  return [*(id *)(a1 + 32) setLocalZone:0];
}

- (id)database:(id)a3 willRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@will remove zone", (uint8_t *)&v15, 0xCu);
  }
  v13 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v13;
}

- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    __int16 v14 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@did create zone", (uint8_t *)&v13, 0xCu);
  }
}

- (BOOL)isConfigured
{
  v2 = [(HMDCompositeSettingsZoneManager *)self localZone];
  BOOL v3 = v2 != 0;

  return v3;
}

- (HMDCompositeSettingsZoneManager)initWithDatabase:(id)a3 workQueue:(id)a4 zoneName:(id)a5 createZoneIfNotExists:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v12)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  __int16 v14 = v13;
  if (!v13)
  {
LABEL_9:
    uint64_t v25 = _HMFPreconditionFailure();
    __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke(v25, v26);
    return result;
  }
  v29.receiver = self;
  v29.super_class = (Class)HMDCompositeSettingsZoneManager;
  uint64_t v15 = [(HMDCompositeSettingsZoneManager *)&v29 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_zoneName, a5);
    v16->_createZoneIfNotExist = a6;
    [(HMDDatabase *)v16->_database addDelegate:v16];
    uint64_t v17 = (void *)MEMORY[0x1E4F7A0D8];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke;
    v27[3] = &unk_1E6A15F20;
    v18 = v16;
    v28 = v18;
    v19 = (void *)MEMORY[0x1E4F7A0F0];
    __int16 v20 = [(HMDCompositeSettingsZoneManager *)v18 workQueue];
    id v21 = [v19 schedulerWithDispatchQueue:v20];
    uint64_t v22 = [v17 futureWithBlock:v27 scheduler:v21];
    configurationFuture = v18->_configurationFuture;
    v18->_configurationFuture = (NAFuture *)v22;
  }
  return v16;
}

void __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) workQueue];
    dispatch_assert_queue_V2(v5);

    id v6 = objc_alloc_init(MEMORY[0x1E4F69ED0]);
    int v7 = [v4 createZoneIfNotExist];
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = v4;
    id v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = [v9 zoneName];
        [v9 createZoneIfNotExist];
        __int16 v14 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        v55 = v14;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Finding Zone:%@ createIfNotExists:%@", buf, 0x20u);
      }
      uint64_t v15 = [v9 database];
      uint64_t v16 = [v9 zoneName];
      id v53 = 0;
      uint64_t v17 = [v15 privateZonesWithName:v16 configuration:v6 delegate:0 error:&v53];
    }
    else
    {
      if (v11)
      {
        v18 = HMFGetLogIdentifier();
        v19 = [v9 zoneName];
        [v9 createZoneIfNotExist];
        __int16 v20 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v55 = v20;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Finding Zone:%@ createIfNotExists:%@", buf, 0x20u);
      }
      uint64_t v15 = [v9 database];
      uint64_t v16 = [v9 zoneName];
      id v53 = 0;
      uint64_t v17 = [v15 existingPrivateZonesWithName:v16 configuration:v6 delegate:0 error:&v53];
    }
    id v21 = (void *)v17;
    id v22 = v53;

    if (v21)
    {
      id v23 = [v21 cloudZone];
      [v9 setCloudZone:v23];

      uint64_t v24 = [v9 cloudZone];
      id v25 = (id)[v24 registerSubscriptionForExternalRecordType:0];

      v26 = [v21 localZone];
      [v9 setLocalZone:v26];

      v27 = [v9 localZone];
      [v27 startUp];

      v28 = [v9 cloudZone];
      objc_super v29 = [v28 startUp];
      v47 = v21;
      id v30 = v22;
      id v31 = v6;
      id v32 = v3;
      v33 = (void *)MEMORY[0x1E4F7A0F0];
      v34 = [v9 workQueue];
      v35 = [v33 schedulerWithDispatchQueue:v34];
      v36 = [v29 reschedule:v35];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __45__HMDCompositeSettingsZoneManager__configure__block_invoke;
      v55 = &unk_1E6A197F0;
      id v56 = v9;
      v37 = [v36 addFailureBlock:buf];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __45__HMDCompositeSettingsZoneManager__configure__block_invoke_13;
      v52[3] = &unk_1E6A19708;
      v52[4] = v9;
      v4 = [v37 addSuccessBlock:v52];

      id v3 = v32;
      id v6 = v31;
      id v22 = v30;
      id v21 = v47;
    }
    else
    {
      v38 = (void *)MEMORY[0x1D9452090]();
      id v39 = v9;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to open zone: %@", buf, 0x16u);
      }
      v42 = (void *)MEMORY[0x1E4F7A0D8];
      v28 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:6];
      v4 = [v42 futureWithError:v28];
    }
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke_2;
  v50[3] = &unk_1E6A19708;
  id v43 = v3;
  id v51 = v43;
  v44 = [v4 addSuccessBlock:v50];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke_3;
  v48[3] = &unk_1E6A197F0;
  id v49 = v43;
  id v45 = v43;
  id v46 = (id)[v44 addFailureBlock:v48];
}

uint64_t __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __45__HMDCompositeSettingsZoneManager__configure__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@CloudZone Error: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __45__HMDCompositeSettingsZoneManager__configure__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@CloudZone startup success", (uint8_t *)&v8, 0xCu);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_163644 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_163644, &__block_literal_global_163645);
  }
  v2 = (void *)logCategory__hmf_once_v6_163646;
  return v2;
}

uint64_t __46__HMDCompositeSettingsZoneManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6_163646;
  logCategory__hmf_once_v6_163646 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
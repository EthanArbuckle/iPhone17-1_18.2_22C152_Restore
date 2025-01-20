@interface HMDCameraClipsQuotaManager
+ (HMDCameraClipsQuotaManager)defaultManager;
+ (id)_quotaErrorFromServerError:(id)a3;
+ (id)_quotaServerErrorFromServerError:(id)a3;
+ (id)logCategory;
- (HMDCameraClipsQuotaManager)init;
- (HMDCameraClipsQuotaManager)initWithDatabase:(id)a3;
- (HMDDatabase)database;
- (id)_addCodeOperationWithFunctionName:(id)a3 request:(id)a4 responseClass:(Class)a5;
- (id)database:(id)a3 willRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (id)disableCloudStorageForZoneWithName:(id)a3;
- (id)enableCloudStorageForZoneWithName:(id)a3;
- (id)fetchNamesForZonesWithEnabledCloudStorage;
- (id)logIdentifier;
- (void)synchronize;
@end

@implementation HMDCameraClipsQuotaManager

- (void).cxx_destruct
{
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCameraClipsQuotaManager *)self database];
  v3 = [v2 cloudDatabase];
  v4 = [v3 containerID];
  v5 = [v4 containerIdentifier];

  return v5;
}

- (id)database:(id)a3 willRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 hasPrefix:*MEMORY[0x1E4F2CC68]] && a5)
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Disabling cloud storage before removing zone with name %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v14 = [(HMDCameraClipsQuotaManager *)v11 disableCloudStorageForZoneWithName:v9];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  v15 = (void *)v14;

  return v15;
}

- (id)_addCodeOperationWithFunctionName:(id)a3 request:(id)a4 responseClass:(Class)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(HMDCameraClipsQuotaManager *)self database];
  v11 = [v10 cloudDatabase];
  v12 = [v11 performCodeOperationWithServiceName:@"HomeQuota" functionName:v9 request:v8 responseClass:a5];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__HMDCameraClipsQuotaManager__addCodeOperationWithFunctionName_request_responseClass___block_invoke;
  v15[3] = &unk_1E6A14048;
  v15[4] = self;
  v13 = [v12 recover:v15];

  return v13;
}

id __86__HMDCameraClipsQuotaManager__addCodeOperationWithFunctionName_request_responseClass___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() _quotaErrorFromServerError:v2];

  v4 = [MEMORY[0x1E4F7A0D8] futureWithError:v3];

  return v4;
}

- (id)disableCloudStorageForZoneWithName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(HMDCameraClipsQuotaDisableCameraMessage);
  v6 = (void *)MEMORY[0x1D9452090]([(HMDCameraClipsQuotaDisableCameraMessage *)v5 setZoneName:v4]);
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    int v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending disable camera message %@ for zone with name %@", buf, 0x20u);
  }
  v10 = [(HMDCameraClipsQuotaManager *)v7 _addCodeOperationWithFunctionName:@"disableCamera" request:v5 responseClass:objc_opt_class()];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__HMDCameraClipsQuotaManager_disableCloudStorageForZoneWithName___block_invoke;
  v15[3] = &unk_1E6A0A4E0;
  v15[4] = v7;
  v11 = [v10 flatMap:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HMDCameraClipsQuotaManager_disableCloudStorageForZoneWithName___block_invoke_28;
  v14[3] = &unk_1E6A14048;
  v14[4] = v7;
  v12 = [v11 recover:v14];

  return v12;
}

id __65__HMDCameraClipsQuotaManager_disableCloudStorageForZoneWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully disabled camera with response: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v8;
}

id __65__HMDCameraClipsQuotaManager_disableCloudStorageForZoneWithName___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:@"HMDCameraClipsQuotaErrorDomain"])
  {

    goto LABEL_7;
  }
  uint64_t v5 = [v3 code];

  if (v5 != 2)
  {
LABEL_7:
    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithError:v3];
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Assuming success for disable camera request because zone does not exist", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_8:
  v11 = (void *)v10;

  return v11;
}

- (id)enableCloudStorageForZoneWithName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(HMDCameraClipsQuotaEnableCameraMessage);
  v6 = (void *)MEMORY[0x1D9452090]([(HMDCameraClipsQuotaEnableCameraMessage *)v5 setZoneName:v4]);
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    int v17 = v5;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending enable camera message %@ for zone with name %@", buf, 0x20u);
  }
  uint64_t v10 = [(HMDCameraClipsQuotaManager *)v7 _addCodeOperationWithFunctionName:@"enableCamera" request:v5 responseClass:objc_opt_class()];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HMDCameraClipsQuotaManager_enableCloudStorageForZoneWithName___block_invoke;
  v13[3] = &unk_1E6A0A4E0;
  v13[4] = v7;
  v11 = [v10 flatMap:v13];

  return v11;
}

id __64__HMDCameraClipsQuotaManager_enableCloudStorageForZoneWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully enabled camera with response: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v8;
}

- (id)fetchNamesForZonesWithEnabledCloudStorage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(HMDCameraClipsQuotaGetActiveCamerasMessage);
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending get active cameras message %@", buf, 0x16u);
  }
  id v8 = [(HMDCameraClipsQuotaManager *)v5 _addCodeOperationWithFunctionName:@"getActiveCameras" request:v3 responseClass:objc_opt_class()];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HMDCameraClipsQuotaManager_fetchNamesForZonesWithEnabledCloudStorage__block_invoke;
  v11[3] = &unk_1E6A0A4E0;
  v11[4] = v5;
  id v9 = [v8 flatMap:v11];

  return v9;
}

id __71__HMDCameraClipsQuotaManager_fetchNamesForZonesWithEnabledCloudStorage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [v5 zoneNames];
    id v7 = (void *)v6;
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
    if (v6) {
      id v8 = (void *)v6;
    }
    id v9 = v8;

    int v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully got active cameras with zone names: %@", (uint8_t *)&v23, 0x16u);
    }
    __int16 v14 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    uint64_t v16 = [v14 futureWithResult:v15];
  }
  else
  {
    int v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 32);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v23 = 138543874;
      v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = objc_opt_class();
      __int16 v27 = 2112;
      id v28 = v3;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Received get active cameras response of unexpected type %@: %@", (uint8_t *)&v23, 0x20u);
    }
    id v21 = (void *)MEMORY[0x1E4F7A0D8];
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    uint64_t v16 = [v21 futureWithError:v9];
  }

  return v16;
}

- (void)synchronize
{
  id v3 = [(HMDCameraClipsQuotaManager *)self database];
  id v4 = [v3 cloudDatabase];
  id v5 = [v4 performInitialCloudSync];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__HMDCameraClipsQuotaManager_synchronize__block_invoke;
  v7[3] = &unk_1E6A17A30;
  v7[4] = self;
  id v6 = (id)[v5 addCompletionBlock:v7];
}

void __41__HMDCameraClipsQuotaManager_synchronize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    __int16 v12 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Finished initial cloud sync for camera clips quota manager cloud database", (uint8_t *)&v11, 0xCu);
  }
}

- (HMDCameraClipsQuotaManager)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraClipsQuotaManager;
  id v6 = [(HMDCameraClipsQuotaManager *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    [v5 addDelegate:v7];
  }

  return v7;
}

- (HMDCameraClipsQuotaManager)init
{
  id v3 = +[HMDDatabase cameraClipsDatabase];
  id v4 = [(HMDCameraClipsQuotaManager *)self initWithDatabase:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15 != -1) {
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_41051);
  }
  id v2 = (void *)logCategory__hmf_once_v16;
  return v2;
}

uint64_t __41__HMDCameraClipsQuotaManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v16;
  logCategory__hmf_once_uint64_t v16 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_quotaErrorFromServerError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _quotaServerErrorFromServerError:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_super v9 = HMFGetLogIdentifier();
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      int v17 = v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Determining quota error based on underlying quota server error: %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = [v5 code];
    if (v10 == 1003) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2 * (v10 == 1002);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  __int16 v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDCameraClipsQuotaErrorDomain" code:v11 userInfo:0];

  return v12;
}

+ (id)_quotaServerErrorFromServerError:(id)a3
{
  id v3 = [a3 userInfo];
  uint64_t v4 = *MEMORY[0x1E4F28A50];
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 userInfo];

  objc_super v9 = [v8 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  __int16 v12 = [v11 domain];
  if ([v12 isEqualToString:@"HomeQuotaError"]) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  return v14;
}

+ (HMDCameraClipsQuotaManager)defaultManager
{
  os_unfair_lock_lock_with_options();
  WeakRetained = (HMDCameraClipsQuotaManager *)objc_loadWeakRetained(&defaultManager_defaultManager);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(HMDCameraClipsQuotaManager);
    objc_storeWeak(&defaultManager_defaultManager, WeakRetained);
  }
  id v3 = WeakRetained;

  os_unfair_lock_unlock((os_unfair_lock_t)&defaultManager_defaultManagerLock);
  return v3;
}

@end
@interface HMDCameraClipsQuotaMessenger
+ (id)logCategory;
- (HMDCameraClipsQuotaMessenger)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)quotaManager;
- (id)quotaManagerFactory;
- (void)configure;
- (void)handleFetchNamesForZonesWithEnabledCloudStorageMessage:(id)a3;
- (void)handleUpdateCloudStorageMessage:(id)a3;
- (void)setQuotaManagerFactory:(id)a3;
@end

@implementation HMDCameraClipsQuotaMessenger

- (void).cxx_destruct
{
  objc_storeStrong(&self->_quotaManagerFactory, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setQuotaManagerFactory:(id)a3
{
}

- (id)quotaManagerFactory
{
  return objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)[MEMORY[0x1E4F2E718] UUID];
}

- (void)handleUpdateCloudStorageMessage:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    v34 = v8;
    __int16 v35 = 2114;
    v36 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update cloud storage message: %{public}@", buf, 0x16u);
  }
  v10 = [v4 stringForKey:*MEMORY[0x1E4F2CC50]];
  if (v10)
  {
    int v11 = [v4 BOOLForKey:*MEMORY[0x1E4F2CC48]];
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = v6;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      v16 = HMFEnabledStatusToString();
      *(_DWORD *)buf = 138543874;
      v34 = v15;
      __int16 v35 = 2112;
      v36 = v16;
      __int16 v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating cloud storage to %@ for zone with name: %@", buf, 0x20u);
    }
    v17 = [(HMDCameraClipsQuotaMessenger *)v13 quotaManager];
    v18 = v17;
    if (v11)
    {
      v19 = [v17 enableCloudStorageForZoneWithName:v10];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __64__HMDCameraClipsQuotaMessenger_handleUpdateCloudStorageMessage___block_invoke;
      v31[3] = &unk_1E6A17A30;
      id v32 = v4;
      id v20 = (id)[v19 addCompletionBlock:v31];

      v21 = v32;
    }
    else
    {
      v27 = [v17 disableCloudStorageForZoneWithName:v10];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __64__HMDCameraClipsQuotaMessenger_handleUpdateCloudStorageMessage___block_invoke_2;
      v29[3] = &unk_1E6A17A30;
      id v30 = v4;
      id v28 = (id)[v27 addCompletionBlock:v29];

      v21 = v30;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D9452090]();
    v23 = v6;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      v26 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v34 = v25;
      __int16 v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot find zone name in update cloud storage message payload: %@", buf, 0x16u);
    }
    v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v21];
  }
}

uint64_t __64__HMDCameraClipsQuotaMessenger_handleUpdateCloudStorageMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

uint64_t __64__HMDCameraClipsQuotaMessenger_handleUpdateCloudStorageMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleFetchNamesForZonesWithEnabledCloudStorageMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    __int16 v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling fetch names for zones with enabled cloud storage message: %{public}@", buf, 0x16u);
  }
  v10 = [(HMDCameraClipsQuotaMessenger *)v6 quotaManager];
  int v11 = [v10 fetchNamesForZonesWithEnabledCloudStorage];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HMDCameraClipsQuotaMessenger_handleFetchNamesForZonesWithEnabledCloudStorageMessage___block_invoke;
  v18[3] = &unk_1E6A12C08;
  v18[4] = v6;
  id v12 = v4;
  id v19 = v12;
  v13 = [v11 addSuccessBlock:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__HMDCameraClipsQuotaMessenger_handleFetchNamesForZonesWithEnabledCloudStorageMessage___block_invoke_13;
  v16[3] = &unk_1E6A196E0;
  v16[4] = v6;
  id v17 = v12;
  id v14 = v12;
  id v15 = (id)[v13 addFailureBlock:v16];
}

void __87__HMDCameraClipsQuotaMessenger_handleFetchNamesForZonesWithEnabledCloudStorageMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched names for zones with enabled cloud storage: %@", buf, 0x16u);
  }
  v8 = *(void **)(a1 + 40);
  uint64_t v10 = *MEMORY[0x1E4F2CC58];
  id v11 = v3;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v8 respondWithPayload:v9];
}

void __87__HMDCameraClipsQuotaMessenger_handleFetchNamesForZonesWithEnabledCloudStorageMessage___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch names for zones with enabled cloud storage: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) respondWithError:v3];
}

- (id)quotaManager
{
  v2 = [(HMDCameraClipsQuotaMessenger *)self quotaManagerFactory];
  id v3 = v2[2]();

  return v3;
}

- (void)configure
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[HMDXPCMessagePolicy policyWithEntitlements:133];
  id v4 = [(HMDCameraClipsQuotaMessenger *)self messageDispatcher];
  uint64_t v5 = *MEMORY[0x1E4F2CC40];
  v11[0] = v3;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v4 registerForMessage:v5 receiver:self policies:v6 selector:sel_handleFetchNamesForZonesWithEnabledCloudStorageMessage_];

  v7 = [(HMDCameraClipsQuotaMessenger *)self messageDispatcher];
  uint64_t v8 = *MEMORY[0x1E4F2CC60];
  __int16 v10 = v3;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v7 registerForMessage:v8 receiver:self policies:v9 selector:sel_handleUpdateCloudStorageMessage_];
}

- (HMDCameraClipsQuotaMessenger)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    uint64_t v14 = _HMFPreconditionFailure();
    return (HMDCameraClipsQuotaMessenger *)__68__HMDCameraClipsQuotaMessenger_initWithWorkQueue_messageDispatcher___block_invoke(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraClipsQuotaMessenger;
  __int16 v10 = [(HMDCameraClipsQuotaMessenger *)&v15 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workQueue, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
    id quotaManagerFactory = v11->_quotaManagerFactory;
    v11->_id quotaManagerFactory = &__block_literal_global_8826;
  }
  return v11;
}

HMDCameraClipsQuotaManager *__68__HMDCameraClipsQuotaMessenger_initWithWorkQueue_messageDispatcher___block_invoke()
{
  return +[HMDCameraClipsQuotaManager defaultManager];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_8838 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_8838, &__block_literal_global_19);
  }
  v2 = (void *)logCategory__hmf_once_v7_8839;
  return v2;
}

uint64_t __43__HMDCameraClipsQuotaMessenger_logCategory__block_invoke()
{
  logCategory__hmf_once_v7_8839 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end
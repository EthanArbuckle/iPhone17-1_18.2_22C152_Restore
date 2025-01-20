@interface HMDCameraClipFinalizeClipOperation
+ (id)logCategory;
+ (unint64_t)cameraClipOperationType;
- (void)main;
@end

@implementation HMDCameraClipFinalizeClipOperation

- (void)main
{
  v10.receiver = self;
  v10.super_class = (Class)HMDCameraClipFinalizeClipOperation;
  [(HMDCameraClipOperation *)&v10 main];
  v3 = [(HMDCameraClipOperation *)self fetchClipModel];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__HMDCameraClipFinalizeClipOperation_main__block_invoke;
  v9[3] = &unk_1E6A0BD10;
  v9[4] = self;
  v4 = [v3 flatMap:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__HMDCameraClipFinalizeClipOperation_main__block_invoke_3;
  v8[3] = &unk_1E6A17A58;
  v8[4] = self;
  v5 = [v4 addSuccessBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HMDCameraClipFinalizeClipOperation_main__block_invoke_5;
  v7[3] = &unk_1E6A197F0;
  v7[4] = self;
  id v6 = (id)[v5 addFailureBlock:v7];
}

id __42__HMDCameraClipFinalizeClipOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setIsComplete:MEMORY[0x1E4F1CC38]];
  v4 = [v3 duration];
  [v4 doubleValue];
  double v6 = v5;
  v7 = [*(id *)(a1 + 32) uploadOperationEvent];
  [v7 setTotalClipDuration:v6];

  v8 = [v3 duration];
  [v8 doubleValue];
  double v10 = v9;

  v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = *(id *)(a1 + 32);
  v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10 <= 0.0)
  {
    if (v14)
    {
      v17 = HMFGetLogIdentifier();
      v18 = [v3 duration];
      [v18 doubleValue];
      int v26 = 138543618;
      v27 = v17;
      __int16 v28 = 2048;
      uint64_t v29 = v19;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Finalized clip has duration %fs, deleting", (uint8_t *)&v26, 0x16u);
    }
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F69EF0]) initWithLabel:@"delete empty clip"];
    [v20 setQualityOfService:-1];
    v21 = [*(id *)(a1 + 32) localZone];
    v22 = (void *)MEMORY[0x1E4F1CAD0];
    v23 = [v3 hmbModelID];
    v24 = [v22 setWithObject:v23];
    v16 = [v21 removeModelIDs:v24 options:v20];
  }
  else
  {
    if (v14)
    {
      v15 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Marking clip complete", (uint8_t *)&v26, 0xCu);
    }
    v16 = [*(id *)(a1 + 32) updateClipModel:v3];
  }

  return v16;
}

void __42__HMDCameraClipFinalizeClipOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  double v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    double v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully finalized clip", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) finish];
}

void __42__HMDCameraClipFinalizeClipOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  double v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    double v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update clip model: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) cancelWithError:v3];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_53887 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_53887, &__block_literal_global_53888);
  }
  v2 = (void *)logCategory__hmf_once_v5_53889;
  return v2;
}

uint64_t __49__HMDCameraClipFinalizeClipOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_53889;
  logCategory__hmf_once_v5_53889 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (unint64_t)cameraClipOperationType
{
  return 5;
}

@end
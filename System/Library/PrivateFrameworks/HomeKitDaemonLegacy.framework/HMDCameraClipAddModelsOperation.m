@interface HMDCameraClipAddModelsOperation
+ (id)logCategory;
- (NSSet)modelsToAdd;
- (void)localZone:(id)a3 willPerformMirrorOutputForModel:(id)a4;
- (void)main;
@end

@implementation HMDCameraClipAddModelsOperation

- (void)localZone:(id)a3 willPerformMirrorOutputForModel:(id)a4
{
}

- (NSSet)modelsToAdd
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (void)main
{
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraClipAddModelsOperation;
  [(HMDCameraClipOperation *)&v16 main];
  v3 = [(HMDCameraClipOperation *)self localZone];
  [v3 addMirrorOutputObserver:self];

  id v4 = objc_alloc(MEMORY[0x1E4F69EF0]);
  v5 = [NSString stringWithFormat:@"add models for %@", objc_opt_class()];
  v6 = (void *)[v4 initWithLabel:v5];

  [v6 setQualityOfService:-1];
  [v6 setDisallowsCellularAccessForMirrorOutput:1];
  v7 = [(HMDCameraClipOperation *)self localZone];
  v8 = [(HMDCameraClipAddModelsOperation *)self modelsToAdd];
  v9 = [v7 addModels:v8 options:v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__HMDCameraClipAddModelsOperation_main__block_invoke;
  v15[3] = &unk_1E6A16F08;
  v15[4] = self;
  v10 = [v9 flatMap:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__HMDCameraClipAddModelsOperation_main__block_invoke_5;
  v14[3] = &unk_1E6A17A58;
  v14[4] = self;
  v11 = [v10 addSuccessBlock:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__HMDCameraClipAddModelsOperation_main__block_invoke_7;
  v13[3] = &unk_1E6A197F0;
  v13[4] = self;
  id v12 = (id)[v11 addFailureBlock:v13];
}

id __39__HMDCameraClipAddModelsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 mirrorOutputResult];

  if (v4)
  {
    v5 = [v3 mirrorOutputResult];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@No mirrorOutputResult future provided", (uint8_t *)&v13, 0xCu);
    }
    v10 = (void *)MEMORY[0x1E4F7A0D8];
    v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    v5 = [v10 futureWithError:v11];
  }
  return v5;
}

void __39__HMDCameraClipAddModelsOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully added models", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) finish];
}

void __39__HMDCameraClipAddModelsOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to add models: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) cancelWithError:v3];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_173717 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_173717, &__block_literal_global_173718);
  }
  v2 = (void *)logCategory__hmf_once_v4_173719;
  return v2;
}

uint64_t __46__HMDCameraClipAddModelsOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_173719;
  logCategory__hmf_once_v4_173719 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
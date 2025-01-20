@interface HMBShareOperation
+ (id)logCategory;
- (HMBCloudZone)cloudZone;
- (HMBShareOperation)initWithCloudZone:(id)a3 block:(id)a4;
- (void)main;
@end

@implementation HMBShareOperation

- (void).cxx_destruct
{
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 328, 1);
}

- (void)main
{
  v3 = [(HMBShareOperation *)self cloudZone];
  v4 = [v3 shareModel];
  v5 = [v4 share];

  v6 = [(HMBFutureOperation *)self block];
  v7 = v6[2]();

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __25__HMBShareOperation_main__block_invoke;
  v13[3] = &unk_1E69EA640;
  v13[4] = self;
  id v8 = (id)[v7 addSuccessBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __25__HMBShareOperation_main__block_invoke_2;
  v11[3] = &unk_1E69EABF0;
  v11[4] = self;
  id v12 = v5;
  id v9 = v5;
  id v10 = (id)[v7 addFailureBlock:v11];
}

void __25__HMBShareOperation_main__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 finish];
  id v5 = [*(id *)(a1 + 32) future];
  [v5 finishWithResult:v4];
}

void __25__HMBShareOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 hmbIsRetryShareOperationError];
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = *(id *)(a1 + 32);
  v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling retry share operation error: %@", buf, 0x16u);
    }
    id v10 = [*(id *)(a1 + 32) cloudZone];
    v11 = +[HMBProcessingOptions optionsWithLabel:@"Share Operation Retry"];
    id v12 = [v10 performCloudPullWithOptions:v11];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __25__HMBShareOperation_main__block_invoke_5;
    v18[3] = &unk_1E69EA668;
    v13 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v13;
    v14 = [v12 addSuccessBlock:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __25__HMBShareOperation_main__block_invoke_8;
    v17[3] = &unk_1E69EA690;
    v17[4] = *(void *)(a1 + 32);
    id v15 = (id)[v14 addFailureBlock:v17];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      __int16 v22 = 2114;
      id v23 = v3;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_ERROR, "%{public}@Share operation failed: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) cancelWithError:v3];
  }
}

void __25__HMBShareOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) cloudZone];
  id v5 = [v4 shareModel];
  id v6 = [v5 share];

  v7 = [v6 recordChangeTag];
  id v8 = [*(id *)(a1 + 40) recordChangeTag];
  int v9 = HMFEqualObjects();

  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 40);
      int v19 = 138543874;
      v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Not retrying share operation because no new CKShare changes were found after performing cloud pull (initialShare: %@, currentShare: %@)", (uint8_t *)&v19, 0x20u);
    }
    v16 = *(void **)(a1 + 32);
    v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    [v16 cancelWithError:v17];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@Retrying share operation after finishing cloud pull", (uint8_t *)&v19, 0xCu);
    }
    [*(id *)(a1 + 32) main];
  }
}

void __25__HMBShareOperation_main__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Canceling share operation due to failed cloud pull: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) cancelWithError:v3];
}

- (HMBShareOperation)initWithCloudZone:(id)a3 block:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBShareOperation;
  int v8 = [(HMBFutureOperation *)&v11 initWithBlock:a4];
  int v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_cloudZone, a3);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1) {
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_4156);
  }
  v2 = (void *)logCategory__hmf_once_v6;
  return v2;
}

uint64_t __32__HMBShareOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6;
  logCategory__hmf_once_id v6 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
@interface HMBFutureOperation
+ (id)logCategory;
- (HMBFutureOperation)initWithBlock:(id)a3;
- (NAFuture)future;
- (id)block;
- (void)cancelWithError:(id)a3;
- (void)main;
@end

@implementation HMBFutureOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong(&self->_block, 0);
}

- (NAFuture)future
{
  return (NAFuture *)objc_getProperty(self, a2, 320, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)main
{
  v3 = [(HMBFutureOperation *)self block];
  v4 = v3[2]();

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__HMBFutureOperation_main__block_invoke;
  v8[3] = &unk_1E69EA640;
  v8[4] = self;
  id v5 = (id)[v4 addSuccessBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__HMBFutureOperation_main__block_invoke_2;
  v7[3] = &unk_1E69EA690;
  v7[4] = self;
  id v6 = (id)[v4 addFailureBlock:v7];
}

void __26__HMBFutureOperation_main__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 finish];
  id v5 = [*(id *)(a1 + 32) future];
  [v5 finishWithResult:v4];
}

uint64_t __26__HMBFutureOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelWithError:a2];
}

- (void)cancelWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMBFutureOperation;
  id v4 = a3;
  [(HMFOperation *)&v6 cancelWithError:v4];
  id v5 = [(HMBFutureOperation *)self future];
  [v5 finishWithError:v4];
}

- (HMBFutureOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBFutureOperation;
  id v5 = [(HMFOperation *)&v11 initWithTimeout:0.0];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1D944CD20](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;

    v8 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    future = v5->_future;
    v5->_future = v8;
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_4076 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_4076, &__block_literal_global_4077);
  }
  v2 = (void *)logCategory__hmf_once_v1_4078;
  return v2;
}

uint64_t __33__HMBFutureOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_4078;
  logCategory__hmf_once_v1_4078 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
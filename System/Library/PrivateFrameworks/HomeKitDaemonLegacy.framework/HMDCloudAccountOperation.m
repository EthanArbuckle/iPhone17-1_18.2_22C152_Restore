@interface HMDCloudAccountOperation
- (HMDCloudAccountOperation)initWithBlock:(id)a3 clientQueue:(id)a4;
- (NSUUID)identifier;
- (OS_dispatch_queue)clientQueue;
- (id)description;
- (id)operationBlock;
- (void)main;
- (void)setOperationBlock:(id)a3;
@end

@implementation HMDCloudAccountOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationBlock, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setOperationBlock:(id)a3
{
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)main
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    v7 = [(HMDCloudAccountOperation *)v4 description];
    *(_DWORD *)buf = 138543618;
    id v27 = v6;
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting account operation %@", buf, 0x16u);
  }
  v8 = dispatch_group_create();
  objc_initWeak(&location, v4);
  dispatch_group_enter(v8);
  v9 = [(HMDCloudAccountOperation *)v4 clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMDCloudAccountOperation_main__block_invoke;
  block[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v24, &location);
  v10 = v8;
  v23 = v10;
  dispatch_async(v9, block);

  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = v4;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = [(HMDCloudAccountOperation *)v12 identifier];
    *(_DWORD *)buf = 138543618;
    id v27 = v14;
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Waiting for account operation %@ to complete", buf, 0x16u);
  }
  intptr_t v16 = dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v17 = (void *)MEMORY[0x1D9452090](v16);
  v18 = v12;
  HMFGetOSLogHandle();
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = [(HMDCloudAccountOperation *)v18 identifier];
    *(_DWORD *)buf = 138543618;
    id v27 = v20;
    __int16 v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Account operation %@ completed", buf, 0x16u);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __32__HMDCloudAccountOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained operationBlock];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__HMDCloudAccountOperation_main__block_invoke_2;
    v5[3] = &unk_1E6A19B30;
    id v6 = *(id *)(a1 + 32);
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
}

void __32__HMDCloudAccountOperation_main__block_invoke_2(uint64_t a1)
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMDCloudAccountOperation *)self identifier];
  id v6 = [v3 stringWithFormat:@"<%@, Identifier = %@>", v4, v5];

  return v6;
}

- (HMDCloudAccountOperation)initWithBlock:(id)a3 clientQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDCloudAccountOperation;
  v8 = [(HMDCloudAccountOperation *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    v11 = _Block_copy(v6);
    id operationBlock = v8->_operationBlock;
    v8->_id operationBlock = v11;

    objc_storeStrong((id *)&v8->_clientQueue, a4);
    v13 = v8;
  }

  return v8;
}

@end
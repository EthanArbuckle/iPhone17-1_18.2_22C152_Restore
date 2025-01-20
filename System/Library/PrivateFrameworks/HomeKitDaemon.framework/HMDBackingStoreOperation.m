@interface HMDBackingStoreOperation
+ (id)logCategory;
- (HMDBackingStore)store;
- (HMDBackingStoreOperation)init;
- (HMDBackingStoreOperation)initWithResultBlock:(id)a3;
- (NSString)description;
- (NSUUID)operationUUID;
- (id)logIdentifier;
- (id)mainReturningError;
- (id)operationFinishBlock;
- (id)resultBlock;
- (void)main;
- (void)setOperationFinishBlock:(id)a3;
- (void)setResultBlock:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation HMDBackingStoreOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong(&self->_operationFinishBlock, 0);
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

- (void)setStore:(id)a3
{
}

- (HMDBackingStore)store
{
  return self->_store;
}

- (void)setOperationFinishBlock:(id)a3
{
}

- (id)operationFinishBlock
{
  return objc_getProperty(self, a2, 264, 1);
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (void)setResultBlock:(id)a3
{
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (id)logIdentifier
{
  v2 = [(HMDBackingStoreOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HMDBackingStoreOperation *)self operationUUID];
  v7 = [v6 UUIDString];
  v8 = [v3 stringWithFormat:@"<%@: %@>", v5, v7];

  return (NSString *)v8;
}

- (void)main
{
  id v5 = [(HMDBackingStoreOperation *)self mainReturningError];
  v3 = [(HMDBackingStoreOperation *)self resultBlock];

  if (v3)
  {
    v4 = [(HMDBackingStoreOperation *)self resultBlock];
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

- (id)mainReturningError
{
  return 0;
}

- (HMDBackingStoreOperation)init
{
  return [(HMDBackingStoreOperation *)self initWithResultBlock:0];
}

- (HMDBackingStoreOperation)initWithResultBlock:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDBackingStoreOperation;
  id v5 = [(HMDBackingStoreOperation *)&v13 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id resultBlock = v5->_resultBlock;
    v5->_id resultBlock = v6;

    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    operationUUID = v5->_operationUUID;
    v5->_operationUUID = (NSUUID *)v8;

    id operationFinishBlock = v5->_operationFinishBlock;
    v5->_id operationFinishBlock = &__block_literal_global_190147;

    v11 = v5;
  }

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_190154 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_190154, &__block_literal_global_5_190155);
  }
  v2 = (void *)logCategory__hmf_once_v1_190156;
  return v2;
}

void __39__HMDBackingStoreOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_190156;
  logCategory__hmf_once_v1_190156 = v0;
}

@end
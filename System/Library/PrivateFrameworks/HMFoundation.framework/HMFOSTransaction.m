@interface HMFOSTransaction
- (HMFOSTransaction)initWithName:(id)a3;
- (OS_os_transaction)transaction;
- (double)creationTime;
- (void)dealloc;
@end

@implementation HMFOSTransaction

- (void).cxx_destruct
{
}

- (HMFOSTransaction)initWithName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMFOSTransaction;
  v5 = [(HMFOSTransaction *)&v18 init];
  if (v5)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v5->_creationTime = v6;
    v7 = [MEMORY[0x1E4F29128] UUID];
    v8 = [v4 stringByAppendingFormat:@"-%@", v7];

    id v9 = v8;
    [v9 UTF8String];
    uint64_t v10 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v10;

    v12 = (void *)MEMORY[0x19F3A87A0]();
    v13 = v5;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = HMFGetLogIdentifier(v13);
      v16 = v5->_transaction;
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Starting transaction: %@", buf, 0x16u);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A87A0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    double v6 = HMFGetLogIdentifier(v4);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v8 = v7 - v4->_creationTime;
    transaction = v4->_transaction;
    *(_DWORD *)buf = 138543874;
    v12 = v6;
    __int16 v13 = 2048;
    double v14 = v8;
    __int16 v15 = 2112;
    v16 = transaction;
    _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Finishing transaction after %.3fs: %@", buf, 0x20u);
  }
  v10.receiver = v4;
  v10.super_class = (Class)HMFOSTransaction;
  [(HMFOSTransaction *)&v10 dealloc];
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (double)creationTime
{
  return self->_creationTime;
}

@end
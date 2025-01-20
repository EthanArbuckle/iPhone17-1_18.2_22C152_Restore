@interface HMDBackingStoreLogAddTransactionOperation
- (BOOL)isAtomicSaveEnabled;
- (HMDBackingStoreLogAddTransactionOperation)initWithAtomicSaveEnabled:(BOOL)a3 transaction:(id)a4;
- (HMDBackingStoreLogAddTransactionOperation)initWithTransaction:(id)a3;
- (HMDBackingStoreTransactionBlock)transaction;
- (id)mainReturningError;
- (int64_t)pushFlags;
- (void)setPushFlags:(int64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation HMDBackingStoreLogAddTransactionOperation

- (void).cxx_destruct
{
}

- (BOOL)isAtomicSaveEnabled
{
  return self->_isAtomicSaveEnabled;
}

- (void)setPushFlags:(int64_t)a3
{
  self->_pushFlags = a3;
}

- (int64_t)pushFlags
{
  return self->_pushFlags;
}

- (void)setTransaction:(id)a3
{
}

- (HMDBackingStoreTransactionBlock)transaction
{
  return self->_transaction;
}

- (id)mainReturningError
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [(HMDBackingStoreOperation *)self store];
  v4 = [v3 local];
  id v5 = [v4 _begin];

  if (!v5)
  {
    v6 = [(HMDBackingStoreOperation *)self store];
    v7 = [v6 local];
    v8 = [(HMDBackingStoreOperation *)self store];
    v9 = [v8 root];
    v10 = [(HMDBackingStoreLogAddTransactionOperation *)self transaction];
    v11 = [(HMDBackingStoreLogAddTransactionOperation *)self transaction];
    v12 = [v11 options];
    id v31 = 0;
    v13 = objc_msgSend(v7, "_insertLogWithRoot:transaction:set:error:", v9, v10, objc_msgSend(v12, "destination") | 0x100000000000000, &v31);
    id v5 = v31;

    if (v5)
    {
      v14 = [(HMDBackingStoreOperation *)self store];
      v15 = [v14 local];
      [v15 _rollback];
    }
    else if ([(HMDBackingStoreLogAddTransactionOperation *)self isAtomicSaveEnabled])
    {
      objc_initWeak((id *)location, self);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __63__HMDBackingStoreLogAddTransactionOperation_mainReturningError__block_invoke;
      v27[3] = &unk_264A25078;
      objc_copyWeak(v29, (id *)location);
      v29[1] = v13;
      id v28 = 0;
      char v30 = 0;
      [(HMDBackingStoreOperation *)self setOperationFinishBlock:v27];

      objc_destroyWeak(v29);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v16 = [(HMDBackingStoreOperation *)self store];
      v17 = [v16 local];
      uint64_t v18 = [v17 _commit];

      v19 = (void *)MEMORY[0x230FBD990]();
      v20 = self;
      v21 = HMFGetOSLogHandle();
      v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          *(_DWORD *)location = 138543874;
          *(void *)&location[4] = v23;
          __int16 v33 = 2048;
          v34 = v13;
          __int16 v35 = 2112;
          uint64_t v36 = v18;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit non-atomic transaction %lu: %@", location, 0x20u);
        }
        id v5 = (id)v18;
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v24 = HMFGetLogIdentifier();
          *(_DWORD *)location = 138543618;
          *(void *)&location[4] = v24;
          __int16 v33 = 2048;
          v34 = v13;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully committed non-atomic transaction %lu to log", location, 0x16u);
        }
      }
    }
  }
  id v25 = v5;

  return v25;
}

void __63__HMDBackingStoreLogAddTransactionOperation_mainReturningError__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_13;
  }
  if (!v3)
  {
    v8 = [WeakRetained store];
    v9 = [v8 local];
    v6 = [v9 _commit];

    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = v5;
    v12 = HMFGetOSLogHandle();
    v13 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        uint64_t v15 = *(void *)(a1 + 48);
        uint64_t v16 = *(void *)(a1 + 32);
        int v22 = 138543874;
        v23 = v14;
        __int16 v24 = 2048;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v16;
        v17 = "%{public}@Failed to commit atomic transaction %lu: %@";
        uint64_t v18 = v13;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
        uint32_t v20 = 32;
LABEL_10:
        _os_log_impl(&dword_22F52A000, v18, v19, v17, (uint8_t *)&v22, v20);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 48);
      int v22 = 138543618;
      v23 = v14;
      __int16 v24 = 2048;
      uint64_t v25 = v21;
      v17 = "%{public}@Successfully committed atomic transaction %lu to log";
      uint64_t v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      uint32_t v20 = 22;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    v6 = [WeakRetained store];
    v7 = [v6 local];
    [v7 _rollback];

LABEL_12:
  }
LABEL_13:
}

- (HMDBackingStoreLogAddTransactionOperation)initWithAtomicSaveEnabled:(BOOL)a3 transaction:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDBackingStoreLogAddTransactionOperation;
  v8 = [(HMDBackingStoreOperation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transaction, a4);
    v9->_isAtomicSaveEnabled = a3;
    v10 = v9;
  }

  return v9;
}

- (HMDBackingStoreLogAddTransactionOperation)initWithTransaction:(id)a3
{
  id v4 = a3;
  isWatch();
  id v5 = [(HMDBackingStoreLogAddTransactionOperation *)self initWithAtomicSaveEnabled:1 transaction:v4];

  return v5;
}

@end
@interface HMDBackingStoreLocalFlushOperation
- (BOOL)clearCloud;
- (HMDBackingStoreLocal)store;
- (HMDBackingStoreLocalFlushOperation)initWithStore:(id)a3 clearCloud:(BOOL)a4 resultHandler:(id)a5;
- (id)resultHandler;
- (void)main;
- (void)setClearCloud:(BOOL)a3;
- (void)setResultHandler:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation HMDBackingStoreLocalFlushOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)setClearCloud:(BOOL)a3
{
  self->_clearCloud = a3;
}

- (BOOL)clearCloud
{
  return self->_clearCloud;
}

- (void)setResultHandler:(id)a3
{
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setStore:(id)a3
{
}

- (HMDBackingStoreLocal)store
{
  return self->_store;
}

- (void)main
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v53 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@removing all records and transactions", buf, 0xCu);
  }
  v7 = [(HMDBackingStoreLocalFlushOperation *)v4 store];
  id v51 = 0;
  id v8 = (id)[v7 _runSQLite3:"DELETE FROM record" bind:0 error:&v51];
  id v9 = v51;

  v10 = [(HMDBackingStoreLocalFlushOperation *)v4 store];
  id v50 = v9;
  id v11 = (id)[v10 _runSQLite3:"DELETE FROM xact_block" bind:0 error:&v50];
  id v12 = v50;

  v13 = [(HMDBackingStoreLocalFlushOperation *)v4 store];
  id v49 = v12;
  id v14 = (id)[v13 _runSQLite3:"DELETE FROM xact" bind:0 error:&v49];
  id v15 = v49;

  v16 = [(HMDBackingStoreLocalFlushOperation *)v4 store];
  id v48 = v15;
  id v17 = (id)[v16 _runSQLite3:"DELETE FROM archive" bind:0 error:&v48];
  id v18 = v48;

  if ([(HMDBackingStoreLocalFlushOperation *)v4 clearCloud])
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = v4;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v53 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@removing all zone cache information", buf, 0xCu);
    }
    v23 = [(HMDBackingStoreLocalFlushOperation *)v20 store];
    id v47 = v18;
    id v24 = (id)[v23 _runSQLite3:"DELETE FROM zone_share" bind:0 error:&v47];
    id v25 = v47;

    v26 = [(HMDBackingStoreLocalFlushOperation *)v20 store];
    id v46 = v25;
    id v27 = (id)[v26 _runSQLite3:"DELETE FROM zone_group" bind:0 error:&v46];
    id v28 = v46;

    v29 = [(HMDBackingStoreLocalFlushOperation *)v20 store];
    id v45 = v28;
    id v30 = (id)[v29 _runSQLite3:"DELETE FROM zone" bind:0 error:&v45];
    id v31 = v45;

    v32 = [(HMDBackingStoreLocalFlushOperation *)v20 store];
    id v44 = v31;
    id v33 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(v32, "_runSQLite3:bind:error:", "INSERT INTO zone (id, name) VALUES (0, '<NULL>');",
                                                        0,
                                                        &v44));
    id v34 = v44;

    v35 = [(HMDBackingStoreLocalFlushOperation *)v20 store];
    id v43 = v34;
    id v36 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(v35, "_runSQLite3:bind:error:", "INSERT INTO zone_group (id, zone_id, root, owner) VALUES (0, 0, '<NULL>', '<NULL>');",
                                                        0,
                                                        &v43));
    id v37 = v43;

    v38 = [(HMDBackingStoreLocalFlushOperation *)v20 store];
    id v42 = v37;
    id v39 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(v38, "_runSQLite3:bind:error:", "INSERT INTO zone_share (id, group_id, root) VALUES (0, 0, '<NULL>');",
                                                        0,
                                                        &v42));
    id v18 = v42;
  }
  if (!v18)
  {
    v40 = [(HMDBackingStoreLocalFlushOperation *)v4 store];
    id v18 = [v40 _fillZoneCache];
  }
  v41 = [(HMDBackingStoreLocalFlushOperation *)v4 resultHandler];
  ((void (**)(void, id))v41)[2](v41, v18);
}

- (HMDBackingStoreLocalFlushOperation)initWithStore:(id)a3 clearCloud:(BOOL)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDBackingStoreLocalFlushOperation;
  id v11 = [(HMDBackingStoreLocalFlushOperation *)&v17 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_store, a3);
    v13 = _Block_copy(v10);
    id resultHandler = v12->_resultHandler;
    v12->_id resultHandler = v13;

    v12->_clearCloud = a4;
    id v15 = v12;
  }

  return v12;
}

@end
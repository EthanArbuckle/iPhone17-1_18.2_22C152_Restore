@interface BCCloudKitSyncToCKTransaction
+ (id)transactionNameForEntityName:(id)a3;
- (BCCloudDataSyncProvider)syncManager;
- (BCCloudKitSyncToCKTransaction)initWithEntityName:(id)a3 syncManager:(id)a4 delegate:(id)a5;
- (double)coalescingDelay;
- (double)transactionLifetimeTimout;
- (void)performWorkWithCompletion:(id)a3;
- (void)setSyncManager:(id)a3;
@end

@implementation BCCloudKitSyncToCKTransaction

- (BCCloudKitSyncToCKTransaction)initWithEntityName:(id)a3 syncManager:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCCloudKitSyncToCKTransaction;
  v10 = [(BCCloudKitTransaction *)&v13 initWithEntityName:a3 delegate:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_syncManager, a4);
  }

  return v11;
}

+ (id)transactionNameForEntityName:(id)a3
{
  return (id)objc_msgSend_stringByAppendingString_(@"BCCloudKitSyncToCKTransaction-", a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)performWorkWithCompletion:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263F2BA58];
  id v5 = a3;
  objc_super v13 = objc_msgSend_shared(v4, v6, v7, v8, v9, v10, v11, v12);
  int v21 = objc_msgSend_verboseLoggingEnabled(v13, v14, v15, v16, v17, v18, v19, v20);

  if (v21)
  {
    v29 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend_entityName(self, v30, v31, v32, v33, v34, v35, v36);
      int v45 = 138412290;
      v46 = v37;
      _os_log_impl(&dword_2360BC000, v29, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction - Signaling Sync Manager for  %@\\\"\"", (uint8_t *)&v45, 0xCu);
    }
  }
  v38 = objc_msgSend_syncManager(self, v22, v23, v24, v25, v26, v27, v28);
  objc_msgSend_startSyncToCKWithCompletion_(v38, v39, (uint64_t)v5, v40, v41, v42, v43, v44);
}

- (double)coalescingDelay
{
  return 5.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
}

- (BCCloudDataSyncProvider)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
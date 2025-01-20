@interface BCCloudKitFetchChangesTransaction
+ (id)transactionNameForEntityName:(id)a3;
- (BCCloudKitController)cloudKitController;
- (BCCloudKitFetchChangesTransaction)initWithCloudKitController:(id)a3 delegate:(id)a4;
- (double)coalescingDelay;
- (double)transactionLifetimeTimout;
- (void)performWorkWithCompletion:(id)a3;
- (void)setCloudKitController:(id)a3;
@end

@implementation BCCloudKitFetchChangesTransaction

- (BCCloudKitFetchChangesTransaction)initWithCloudKitController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCCloudKitFetchChangesTransaction;
  v7 = [(BCCloudKitTransaction *)&v10 initWithEntityName:@"iBooks" delegate:a4];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_cloudKitController, v6);
  }

  return v8;
}

+ (id)transactionNameForEntityName:(id)a3
{
  return (id)objc_msgSend_stringByAppendingString_(@"BCCloudKitFetchChangesTransaction-", a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)performWorkWithCompletion:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12 = objc_msgSend_shared(MEMORY[0x263F2BA58], v5, v6, v7, v8, v9, v10, v11);
  int v20 = objc_msgSend_verboseLoggingEnabled(v12, v13, v14, v15, v16, v17, v18, v19);

  if (v20)
  {
    v28 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_msgSend_entityName(self, v29, v30, v31, v32, v33, v34, v35);
      *(_DWORD *)buf = 138412290;
      v58 = v36;
      _os_log_impl(&dword_2360BC000, v28, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudKitFetchChangesTransaction - Signaling Database to fetch changes for %@\\\"\"", buf, 0xCu);
    }
  }
  v37 = objc_msgSend_cloudKitController(self, v21, v22, v23, v24, v25, v26, v27);
  v45 = objc_msgSend_privateCloudDatabaseController(v37, v38, v39, v40, v41, v42, v43, v44);

  if (v45)
  {
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = sub_2360D36B8;
    v55[3] = &unk_264CA0C18;
    id v56 = v4;
    objc_msgSend_fetchChangesWithCompletion_(v45, v46, (uint64_t)v55, v47, v48, v49, v50, v51);
    v52 = v56;
  }
  else
  {
    v53 = BDSCloudKitLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_2361F81DC(v53);
    }

    v54 = _Block_copy(v4);
    v52 = v54;
    if (v54) {
      (*((void (**)(void *))v54 + 2))(v54);
    }
  }
}

- (double)coalescingDelay
{
  return 2.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
}

- (BCCloudKitController)cloudKitController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitController);
  return (BCCloudKitController *)WeakRetained;
}

- (void)setCloudKitController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
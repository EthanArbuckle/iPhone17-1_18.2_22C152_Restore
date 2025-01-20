@interface BDSReadingHistoryServiceClient
+ (id)sharedServiceProxy;
+ (void)clearDefaultsCachedDataWithCompletionHandler:(id)a3;
- (BDSReadingHistoryServiceClient)init;
- (BDSServiceProtocol)serviceProxy;
- (void)bookWidgetReadingHistoryStateInfoWithCompletionHandler:(id)a3;
- (void)handleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completion:(id)a5;
@end

@implementation BDSReadingHistoryServiceClient

+ (id)sharedServiceProxy
{
  if (qword_26AD776B8 != -1) {
    dispatch_once(&qword_26AD776B8, &unk_26E971950);
  }
  v2 = (void *)qword_26AD77688;
  return v2;
}

- (BDSReadingHistoryServiceClient)init
{
  v13.receiver = self;
  v13.super_class = (Class)BDSReadingHistoryServiceClient;
  v9 = [(BDSReadingHistoryServiceClient *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_sharedServiceProxy(BDSReadingHistoryServiceClient, v2, v3, v4, v5, v6, v7, v8);
    serviceProxy = v9->_serviceProxy;
    v9->_serviceProxy = (BDSServiceProtocol *)v10;
  }
  return v9;
}

- (void)handleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend_serviceProxy(self, v11, v12, v13, v14, v15, v16, v17);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryHandleSyncFileChangeWithSyncVersionInfo_updateInfo_completion_(v22, v18, (uint64_t)v10, (uint64_t)v9, (uint64_t)v8, v19, v20, v21);
}

+ (void)clearDefaultsCachedDataWithCompletionHandler:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedServiceProxy(BDSReadingHistoryServiceClient, v4, v5, v6, v7, v8, v9, v10);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryClearDefaultsCachedDataWithCompletion_(v17, v11, (uint64_t)v3, v12, v13, v14, v15, v16);
}

- (void)bookWidgetReadingHistoryStateInfoWithCompletionHandler:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BDSWidgetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v70) = 0;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "BDSReadingHistoryServiceClient bookWidgetReadingHistoryStateInfo reading file.", (uint8_t *)&v70, 2u);
  }

  uint64_t v13 = objc_msgSend_sharedInstance(BDSBookWidgetReadingHistoryDataFile, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_load(v13, v14, v15, v16, v17, v18, v19, v20);
  id v22 = BDSWidgetLog();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      LOWORD(v70) = 0;
      _os_log_impl(&dword_2360BC000, v22, OS_LOG_TYPE_DEFAULT, "BDSReadingHistoryServiceClient bookWidgetReadingHistoryStateInfo - Compute from saved data", (uint8_t *)&v70, 2u);
    }

    v24 = objc_alloc_init(BDSReadingHistoryStateEstimator);
    v32 = objc_msgSend_stateInfo(v21, v25, v26, v27, v28, v29, v30, v31);
    v39 = objc_msgSend_estimateCurrentStateInfoWithExistingStateInfo_(v24, v33, (uint64_t)v32, v34, v35, v36, v37, v38);

    v40 = BDSWidgetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      v71 = v39;
      _os_log_impl(&dword_2360BC000, v40, OS_LOG_TYPE_DEFAULT, "BDSReadingHistoryServiceClient bookWidgetReadingHistoryStateInfo - Return %@", (uint8_t *)&v70, 0xCu);
    }

    if (v39)
    {
      v41 = _Block_copy(v4);
      v42 = v41;
      if (v41) {
        (*((void (**)(void *, void *, uint64_t))v41 + 2))(v41, v39, 1);
      }
    }
    else
    {
      v56 = BDSWidgetLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_2361F82B8(v56);
      }

      v42 = objc_msgSend_serviceProxy(self, v57, v58, v59, v60, v61, v62, v63);
      objc_msgSend_bookWidgetReadingHistoryStateInfoWithCompletion_(v42, v64, (uint64_t)v4, v65, v66, v67, v68, v69);
    }
  }
  else
  {
    if (v23)
    {
      LOWORD(v70) = 0;
      _os_log_impl(&dword_2360BC000, v22, OS_LOG_TYPE_DEFAULT, "BDSReadingHistoryServiceClient bookWidgetReadingHistoryStateInfo - Cannot load saved data, fallback to XPC call", (uint8_t *)&v70, 2u);
    }

    objc_msgSend_serviceProxy(self, v43, v44, v45, v46, v47, v48, v49);
    v24 = (BDSReadingHistoryStateEstimator *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bookWidgetReadingHistoryStateInfoWithCompletion_(v24, v50, (uint64_t)v4, v51, v52, v53, v54, v55);
  }
}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
}

@end
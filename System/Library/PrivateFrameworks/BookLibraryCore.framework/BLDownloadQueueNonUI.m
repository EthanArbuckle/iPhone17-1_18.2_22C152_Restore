@interface BLDownloadQueueNonUI
+ (id)innerSharedInstance;
+ (void)cancelAllActiveDownloads;
+ (void)overrideSharedInstance:(id)a3;
+ (void)prepareForRemoveApp;
- (BLDownloadQueueNonUI)init;
- (BLDownloadQueueServerProgressObserver)serverProgressObserver;
- (BLServiceProxy)serviceProxy;
- (NSArray)downloads;
- (id)_dateFromObject:(id)a3;
- (id)_numberFromObject:(id)a3;
- (id)_stringFromObject:(id)a3;
- (void)_addDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 completion:(id)a5;
- (void)_cancelAllPausedDownloads;
- (void)_purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)addDownloadWithMetadata:(id)a3 completion:(id)a4;
- (void)addDownloadWithPermlink:(id)a3 title:(id)a4 completion:(id)a5;
- (void)addDownloadWithPurchaseParameters:(id)a3 completion:(id)a4;
- (void)addDownloadWithPurchaseParameters:(id)a3 storeID:(id)a4 completion:(id)a5;
- (void)addDownloadsWithManifestRequest:(id)a3 completion:(id)a4;
- (void)addDownloadsWithMetadata:(id)a3 completion:(id)a4;
- (void)addDownloadsWithRestoreContentRequestItems:(id)a3 completion:(id)a4;
- (void)addObserver:(id)a3;
- (void)addRestoreDownloadWithMetadata:(id)a3 completion:(id)a4;
- (void)addRestoreDownloadsWithMetadata:(id)a3 completion:(id)a4;
- (void)cancelAllActiveDownloadsWithCompletion:(id)a3;
- (void)cancelDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)pauseDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)processAutomaticDownloadsWithReply:(id)a3;
- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 completion:(id)a5;
- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 completion:(id)a6;
- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 userInfo:(id)a6 completion:(id)a7;
- (void)purchaseWithRequest:(id)a3 completion:(id)a4;
- (void)reloadFromServerWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)restartDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)resumeDownloadWithID:(id)a3 withCompletion:(id)a4;
@end

@implementation BLDownloadQueueNonUI

- (BLDownloadQueueNonUI)init
{
  v9.receiver = self;
  v9.super_class = (Class)BLDownloadQueueNonUI;
  v5 = [(BLDownloadQueueNonUI *)&v9 init];
  if (v5)
  {
    v6 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v2, v3, v4);
    objc_msgSend_addObserver_accountTypes_(v6, v7, (uint64_t)v5, 1);
  }
  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_msgSend_serverProgressObserver(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObserver_(v10, v8, (uint64_t)v4, v9);
}

- (NSArray)downloads
{
  id v4 = objc_msgSend_serverProgressObserver(self, a2, v2, v3);
  v8 = objc_msgSend_downloads(v4, v5, v6, v7);

  return (NSArray *)v8;
}

- (BLDownloadQueueServerProgressObserver)serverProgressObserver
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21DFE5C38;
  block[3] = &unk_26448B708;
  block[4] = self;
  if (qword_26AB3FFB8 != -1) {
    dispatch_once(&qword_26AB3FFB8, block);
  }
  return (BLDownloadQueueServerProgressObserver *)(id)qword_26AB3FFC0;
}

+ (void)overrideSharedInstance:(id)a3
{
  id v5 = a3;
  if (qword_26AB40060)
  {
    uint64_t v6 = BLDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_ERROR, "Attempting to set an overrideInstance when one is already set.", buf, 2u);
    }

    objc_msgSend_raise_format_(MEMORY[0x263EFF940], v7, @"BLDownloadQueueTooManyInstances", @"Attempting to set an overrideInstance when one is already set.");
  }
  objc_storeStrong((id *)&qword_26AB40060, a3);
  objc_msgSend_innerSharedInstance(a1, v8, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v5)
  {
    v12 = BLDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_ERROR, "You must use the BLDownloadQueue singleton before trying to use the BLDownloadQueueNonUI singleton.", v14, 2u);
    }

    objc_msgSend_raise_format_(MEMORY[0x263EFF940], v13, @"BLDownloadQueueTooManyInstances", @"You must use the BLDownloadQueue singleton before trying to use the BLDownloadQueueNonUI singleton.");
  }
}

+ (id)innerSharedInstance
{
  if (qword_26AB40078 != -1) {
    dispatch_once(&qword_26AB40078, &unk_26CED3F70);
  }
  uint64_t v2 = (void *)qword_26AB40080;

  return v2;
}

- (void)dealloc
{
  id v5 = objc_msgSend_serviceProxy(self, a2, v2, v3);
  objc_msgSend_shutdown(v5, v6, v7, v8);

  v12 = objc_msgSend_defaultCenter(MEMORY[0x263F087C8], v9, v10, v11);
  objc_msgSend_removeObserver_(v12, v13, (uint64_t)self, v14);

  v18 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v15, v16, v17);
  objc_msgSend_removeObserver_accountTypes_(v18, v19, (uint64_t)self, 1);

  v20.receiver = self;
  v20.super_class = (Class)BLDownloadQueueNonUI;
  [(BLDownloadQueueNonUI *)&v20 dealloc];
}

- (BLServiceProxy)serviceProxy
{
  id v4 = objc_msgSend_serverProgressObserver(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_serviceProxy(v4, v5, v6, v7);

  return (BLServiceProxy *)v8;
}

- (void)_cancelAllPausedDownloads
{
  objc_msgSend_serverProgressObserver(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelAllPausedDownloads(v7, v4, v5, v6);
}

- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 completion:(id)a5
{
  uint64_t v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_longLongValue(a4, v11, v12, v13);
  uint64_t v17 = objc_msgSend_numberWithLongLong_(v8, v15, v14, v16);
  objc_msgSend_requestWithBuyParameters_storeIdentifier_(BLPurchaseRequest, v18, (uint64_t)v10, (uint64_t)v17);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_purchaseWithRequest_completion_(self, v19, (uint64_t)v20, (uint64_t)v9);
}

- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = NSNumber;
  id v11 = a6;
  id v12 = a3;
  uint64_t v16 = objc_msgSend_longLongValue(a4, v13, v14, v15);
  v19 = objc_msgSend_numberWithLongLong_(v10, v17, v16, v18);
  objc_msgSend_requestWithBuyParameters_storeIdentifier_(BLPurchaseRequest, v20, (uint64_t)v12, (uint64_t)v19);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAudiobook_(v24, v21, v6, v22);
  objc_msgSend_purchaseWithRequest_completion_(self, v23, (uint64_t)v24, (uint64_t)v11);
}

- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 userInfo:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  id v12 = NSNumber;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  uint64_t v19 = objc_msgSend_longLongValue(a4, v16, v17, v18);
  uint64_t v22 = objc_msgSend_numberWithLongLong_(v12, v20, v19, v21);
  objc_msgSend_requestWithBuyParameters_storeIdentifier_(BLPurchaseRequest, v23, (uint64_t)v15, (uint64_t)v22);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAudiobook_(v29, v24, v8, v25);
  objc_msgSend_setAnalyticsInfo_(v29, v26, (uint64_t)v14, v27);

  objc_msgSend_purchaseWithRequest_completion_(self, v28, (uint64_t)v29, (uint64_t)v13);
}

- (void)_purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BLDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: purchaseWithBuyParameters:uiManager:", buf, 2u);
  }

  id v12 = _os_activity_create(&dword_21DFE3000, "purchaseWithBuyParameters:uiManager:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E037D3C;
  v16[3] = &unk_26448CE68;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  os_activity_apply(v12, v16);
}

- (void)purchaseWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_alloc_init(BLUIHostServiceNonUI);
  objc_msgSend__purchaseWithRequest_uiHostProxy_completion_(self, v8, (uint64_t)v7, (uint64_t)v9, v6);
}

- (void)addDownloadWithPurchaseParameters:(id)a3 storeID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = BLDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: addDownloadWithPurchaseParameters", buf, 2u);
  }

  id v12 = NSNumber;
  uint64_t v16 = objc_msgSend_longLongValue(v9, v13, v14, v15);

  id v19 = objc_msgSend_numberWithLongLong_(v12, v17, v16, v18);
  uint64_t v21 = objc_msgSend_requestWithBuyParameters_storeIdentifier_(BLPurchaseRequest, v20, (uint64_t)v10, (uint64_t)v19);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_21E0387C8;
  v24[3] = &unk_26448CE90;
  id v25 = v8;
  id v22 = v8;
  objc_msgSend_purchaseWithRequest_completion_(self, v23, (uint64_t)v21, (uint64_t)v24);
}

- (void)addDownloadWithPermlink:(id)a3 title:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BLDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: addDownloadWithPermlink", buf, 2u);
  }

  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = &unk_26CED3FB0;
  }
  id v13 = (void *)MEMORY[0x223C1EDC0](v12);

  id v17 = objc_msgSend_defaultBookLibrary(BLLibrary, v14, v15, v16);
  id v39 = 0;
  id v19 = objc_msgSend__bookItemFromPermlink_error_(v17, v18, (uint64_t)v8, (uint64_t)&v39);
  id v20 = v39;

  if (!v19)
  {
    v32 = objc_msgSend_serviceProxy(self, v21, v22, v23);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_21E038ADC;
    v35[3] = &unk_26448CED8;
    v38 = v13;
    v35[4] = self;
    id v36 = v8;
    id v37 = v9;
    objc_msgSend_downloadWithPermlink_title_reply_(v32, v33, (uint64_t)v36, (uint64_t)v37, v35);

    uint64_t v27 = v38;
LABEL_12:

    goto LABEL_13;
  }
  id v24 = objc_msgSend_defaultBookLibrary(BLLibrary, v21, v22, v23);
  id v34 = v20;
  objc_msgSend__addBookItemToEduContainer_error_(v24, v25, (uint64_t)v19, (uint64_t)&v34);
  id v26 = v34;

  if (v26)
  {
    uint64_t v27 = BLDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend_permlink(v19, v28, v29, v30);
      *(_DWORD *)buf = 138412546;
      v41 = v31;
      __int16 v42 = 2112;
      id v43 = v26;
      _os_log_impl(&dword_21DFE3000, v27, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadWithPermlink: could not add permlink to container %@.  It may already exist. Recevied error:  %@", buf, 0x16u);
    }
    id v20 = v26;
    goto LABEL_12;
  }
LABEL_13:
}

- (void)addDownloadWithMetadata:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadWithMetadata", v10, 2u);
  }

  objc_msgSend__addDownloadWithMetadata_isRestore_completion_(self, v9, (uint64_t)v7, 0, v6);
}

- (void)addRestoreDownloadWithMetadata:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addRestoreDownloadWithMetadata", v10, 2u);
  }

  objc_msgSend__addDownloadWithMetadata_isRestore_completion_(self, v9, (uint64_t)v7, 1, v6);
}

- (void)pauseDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: pauseDownloadWithID", v16, 2u);
  }

  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = &unk_26CED3FD0;
  }
  id v10 = (void *)MEMORY[0x223C1EDC0](v9);

  uint64_t v14 = objc_msgSend_serviceProxy(self, v11, v12, v13);
  objc_msgSend_pauseDownloadWithID_withReply_(v14, v15, (uint64_t)v7, (uint64_t)v10);
}

- (void)resumeDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: resumeDownloadWithID", buf, 2u);
  }

  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = &unk_26CED3FF0;
  }
  id v10 = (void *)MEMORY[0x223C1EDC0](v9);

  uint64_t v14 = objc_msgSend_serviceProxy(self, v11, v12, v13);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_21E0391F4;
  v18[3] = &unk_26448CF28;
  id v19 = v6;
  id v20 = v10;
  v18[4] = self;
  id v15 = v6;
  id v16 = v10;
  objc_msgSend_resumeDownloadWithID_withReply_(v14, v17, (uint64_t)v15, (uint64_t)v18);
}

- (void)cancelDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: cancelDownloadWithID", v22, 2u);
  }

  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = &unk_26CED4010;
  }
  id v10 = (void *)MEMORY[0x223C1EDC0](v9);

  uint64_t v14 = objc_msgSend_serviceProxy(self, v11, v12, v13);
  objc_msgSend_cancelDownloadWithID_withReply_(v14, v15, (uint64_t)v7, (uint64_t)v10);

  id v19 = objc_msgSend_serverProgressObserver(self, v16, v17, v18);
  objc_msgSend_notifyDidCompleteForDownloadID_(v19, v20, (uint64_t)v7, v21);
}

+ (void)cancelAllActiveDownloads
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = BLDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Cancelling all active book downloads.", buf, 2u);
  }

  uint64_t v3 = [BLServiceProxy alloc];
  id v15 = 0;
  id v6 = objc_msgSend_initWithError_(v3, v4, (uint64_t)&v15, v5);
  id v7 = v15;
  if (v7)
  {
    id v8 = BLDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "[DownloadQueue]: Error encountered creating service proxy: %@", buf, 0xCu);
    }
  }
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E039918;
  v13[3] = &unk_26448CE18;
  uint64_t v14 = v9;
  id v10 = v9;
  objc_msgSend_cancelAllActiveDownloadsWithReply_(v6, v11, (uint64_t)v13, v12);
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)prepareForRemoveApp
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = BLDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: prepareForRemoveApp", buf, 2u);
  }

  uint64_t v3 = [BLServiceProxy alloc];
  id v14 = 0;
  id v6 = objc_msgSend_initWithError_(v3, v4, (uint64_t)&v14, v5);
  id v7 = v14;
  if (v7)
  {
    id v8 = BLDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "[DownloadQueue]: Error encountered creating service proxy: %@", buf, 0xCu);
    }
  }
  else
  {
    id v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_21E039BB0;
    v12[3] = &unk_26448CE18;
    uint64_t v13 = v9;
    id v8 = v9;
    objc_msgSend_prepareForRemoveAppWithReply_(v6, v10, (uint64_t)v12, v11);
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)addDownloadsWithMetadata:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadsWithMetadata:", v16, 2u);
  }

  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = &unk_26CED4030;
  }
  id v10 = (void *)MEMORY[0x223C1EDC0](v9);

  id v14 = objc_msgSend_serviceProxy(self, v11, v12, v13);
  objc_msgSend_requestDownloadsWithMetadata_areRestore_reply_(v14, v15, (uint64_t)v7, 0, v10);
}

- (void)addRestoreDownloadsWithMetadata:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addRestoreDownloadsWithMetadata:", v16, 2u);
  }

  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = &unk_26CED4050;
  }
  id v10 = (void *)MEMORY[0x223C1EDC0](v9);

  id v14 = objc_msgSend_serviceProxy(self, v11, v12, v13);
  objc_msgSend_requestDownloadsWithMetadata_areRestore_reply_(v14, v15, (uint64_t)v7, 1, v10);
}

- (void)addDownloadsWithRestoreContentRequestItems:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: addDownloadsWithRestoreContentRequestItems:", v16, 2u);
  }

  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = &unk_26CED4070;
  }
  id v10 = (void *)MEMORY[0x223C1EDC0](v9);

  id v14 = objc_msgSend_serviceProxy(self, v11, v12, v13);
  objc_msgSend_requestDownloadsWithRestoreContentRequestItems_reply_(v14, v15, (uint64_t)v7, (uint64_t)v10);
}

- (void)addDownloadsWithManifestRequest:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadsWithManifestRequest:completion: for manifestRequest: %@", buf, 0xCu);
  }

  id v9 = _os_activity_create(&dword_21DFE3000, "addDownloadsWithManifestRequest:completion:", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E03A054;
  block[3] = &unk_26448CF90;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  os_activity_apply(v9, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_msgSend_serverProgressObserver(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterObserver_(v10, v8, (uint64_t)v4, v9);
}

- (void)addDownloadWithPurchaseParameters:(id)a3 completion:(id)a4
{
  id v4 = BLDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_ERROR, "This method is not implemented. Please file a radar.", v5, 2u);
  }
}

- (void)cancelAllActiveDownloadsWithCompletion:(id)a3
{
}

- (void)processAutomaticDownloadsWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: processAutomaticDownloadsWithReply", v14, 2u);
  }

  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = &unk_26CED40B0;
  }
  uint64_t v7 = (void *)MEMORY[0x223C1EDC0](v6);

  id v11 = objc_msgSend_serviceProxy(self, v8, v9, v10);
  objc_msgSend_processAutomaticDownloadsWithReply_(v11, v12, (uint64_t)v7, v13);
}

- (void)restartDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: restartDownloadWithID", v16, 2u);
  }

  if (v6) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = &unk_26CED40D0;
  }
  uint64_t v10 = (void *)MEMORY[0x223C1EDC0](v9);

  id v14 = objc_msgSend_serviceProxy(self, v11, v12, v13);
  objc_msgSend_restartDownloadWithID_withReply_(v14, v15, (uint64_t)v7, (uint64_t)v10);
}

- (void)reloadFromServerWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Request reload server download queue", v14, 2u);
  }

  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = &unk_26CED40F0;
  }
  id v7 = (void *)MEMORY[0x223C1EDC0](v6);

  id v11 = objc_msgSend_serviceProxy(self, v8, v9, v10);
  objc_msgSend_reloadFromServerWithReply_(v11, v12, (uint64_t)v7, v13);
}

- (void)_addDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  if (a5) {
    id v7 = a5;
  }
  else {
    id v7 = &unk_26CED4110;
  }
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x223C1EDC0](v7);
  uint64_t v10 = [BLDownloadMetadata alloc];
  uint64_t v13 = objc_msgSend_initWithDictionary_(v10, v11, (uint64_t)v8, v12);
  id v14 = NSNumber;
  uint64_t v18 = objc_msgSend_itemIdentifier(v13, v15, v16, v17);
  uint64_t v21 = objc_msgSend_numberWithUnsignedLongLong_(v14, v19, v18, v20);
  uint64_t v22 = NSNumber;
  uint64_t v26 = objc_msgSend_collectionIdentifier(v13, v23, v24, v25);
  uint64_t v29 = objc_msgSend_numberWithUnsignedLongLong_(v22, v27, v26, v28);
  v33 = objc_msgSend_kind(v13, v30, v31, v32);
  id v37 = objc_msgSend_serviceProxy(self, v34, v35, v36);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_21E03A5CC;
  v43[3] = &unk_26448CFB8;
  id v46 = v33;
  id v47 = v9;
  v43[4] = self;
  id v44 = v21;
  id v45 = v29;
  id v38 = v33;
  id v39 = v29;
  id v40 = v21;
  id v41 = v9;
  objc_msgSend_requestDownloadWithMetadata_isRestore_reply_(v37, v42, (uint64_t)v8, v5, v43);
}

- (id)_stringFromObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v4 = BUDynamicCast();
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      BOOL v5 = BUDynamicCast();
      id v4 = objc_msgSend_stringValue(v5, v6, v7, v8);

      goto LABEL_10;
    }
    uint64_t v9 = BLDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to neither an NSString nor an NSNumber", (uint8_t *)&v12, 0x16u);
    }
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

- (id)_numberFromObject:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v4 = BUDynamicCast();
      goto LABEL_8;
    }
    BOOL v5 = BLDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to an NSNumber", (uint8_t *)&v8, 0x16u);
    }
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

- (id)_dateFromObject:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v4 = BUDynamicCast();
      goto LABEL_8;
    }
    BOOL v5 = BLDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to an NSDate", (uint8_t *)&v8, 0x16u);
    }
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  if (a4 - 101 <= 1)
  {
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    uint64_t v7 = BLServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Account Changed.  Cancelling paused downloads", v11, 2u);
    }

    objc_msgSend__cancelAllPausedDownloads(self, v8, v9, v10);
  }
}

@end
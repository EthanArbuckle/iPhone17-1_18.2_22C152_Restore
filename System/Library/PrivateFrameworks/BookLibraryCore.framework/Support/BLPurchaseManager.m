@interface BLPurchaseManager
- (AMSPurchaseQueue)purchaseQueue;
- (AMSPurchaseQueueConfiguration)purchaseQueueConfiguration;
- (BLDatabaseManager)databaseManager;
- (BLDownloadPolicyManager)downloadPolicyManager;
- (BLOSTransactionCoordinating)transactionCoordinator;
- (BLOperationQueue)storeRequestOperationQueue;
- (BLProgressSender)progressSender;
- (BLPurchaseManager)initWithDatabaseManager:(id)a3 downloadPolicyManager:(id)a4 transactionCoordinator:(id)a5 progressSender:(id)a6;
- (BLPurchaseManagerDelegate)delegate;
- (BLPurchaseUIHelper)purchaseUIHelper;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)restoreAuthenticationQueue;
- (_BLOngoingPurchaseRequests)ongoingPurchaseRequests;
- (id)_accountIdentifierFromDownloadMetadata:(id)a3;
- (id)_distinctDownloadsArrayForDownloads:(id)a3;
- (id)_newCheckQueueOperationForQueueRequest:(id)a3;
- (id)_newLoadQueueOperationForQueueRequest:(id)a3;
- (id)_newQueueRequests;
- (id)_newQueueRequestsForPurchaseStoreIdentifier:(id)a3 suppressNetworkEvaluatorDialogs:(BOOL)a4;
- (id)dq_writeArtworkWithURL:(id)a3 downloadID:(id)a4;
- (id)dq_writeMetadata:(id)a3 clientIdentifier:(id)a4 downloadID:(id)a5;
- (id)dq_writeSinf:(id)a3 downloadID:(id)a4 downloadKind:(id)a5;
- (void)_addQueueOperationsForRequests:(id)a3 reason:(id)a4;
- (void)_checkStoreDownloadQueuesForPurchaseWithStoreIdentifier:(id)a3 suppressNetworkEvaluatorDialogs:(BOOL)a4;
- (void)_handleTriggerDownloadforRequest:(id)a3 withDownloadID:(id)a4;
- (void)_purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5;
- (void)_requestDownloadWithDownloadMetadata:(id)a3 isRestore:(BOOL)a4 completion:(id)a5;
- (void)_requestDownloadsWithRestoreDownloadItems:(id)a3 completion:(id)a4;
- (void)_requestDownloadsWithStoreDownloadItems:(id)a3 isRestore:(BOOL)a4 completion:(id)a5;
- (void)_updateNetworkPolicyForQueueDownloads:(id)a3 suppressDialogs:(BOOL)a4;
- (void)dealloc;
- (void)downloadWithPermlink:(id)a3 title:(id)a4 completion:(id)a5;
- (void)dq_performDownloadDownloadMetadata:(id)a3 downloadID:(id)a4 clientIdentifier:(id)a5 isRestoreItem:(BOOL)a6;
- (void)dq_performDownloadWithPermlink:(id)a3 title:(id)a4 clientIdentifier:(id)a5 downloadID:(id)a6 completion:(id)a7;
- (void)dq_performPurchaseWithRequest:(id)a3 downloadID:(id)a4 uiHostProxy:(id)a5 completion:(id)a6;
- (void)dq_triggerDownloadForDownloadID:(id)a3 urlToAsset:(id)a4;
- (void)dq_triggerRestartDownloadForDownloadID:(id)a3;
- (void)p_downloadIDForPermlink:(id)a3 completion:(id)a4;
- (void)p_downloadIDForRequest:(id)a3 completion:(id)a4;
- (void)processAutomaticDownloadsWithCompletion:(id)a3;
- (void)purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5;
- (void)reloadFromServerWithCompletion:(id)a3;
- (void)requestDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 completion:(id)a5;
- (void)requestDownloadsWithManifestRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5;
- (void)requestDownloadsWithRestoreContentRequestItems:(id)a3 completion:(id)a4;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDownloadPolicyManager:(id)a3;
- (void)setOngoingPurchaseRequests:(id)a3;
- (void)setPurchaseQueue:(id)a3;
- (void)setPurchaseQueueConfiguration:(id)a3;
- (void)setPurchaseUIHelper:(id)a3;
- (void)setRestoreAuthenticationQueue:(id)a3;
- (void)setStoreRequestOperationQueue:(id)a3;
- (void)setTransactionCoordinator:(id)a3;
@end

@implementation BLPurchaseManager

- (BLPurchaseManager)initWithDatabaseManager:(id)a3 downloadPolicyManager:(id)a4 transactionCoordinator:(id)a5 progressSender:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)BLPurchaseManager;
  v14 = [(BLPurchaseManager *)&v35 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_databaseManager, v10);
    objc_storeWeak((id *)&v15->_downloadPolicyManager, v11);
    objc_storeStrong((id *)&v15->_progressSender, a6);
    id v16 = objc_alloc((Class)AMSPurchaseQueueConfiguration);
    v17 = +[BUBag defaultBag];
    v18 = (AMSPurchaseQueueConfiguration *)[v16 initWithBag:v17];
    purchaseQueueConfiguration = v15->_purchaseQueueConfiguration;
    v15->_purchaseQueueConfiguration = v18;

    v20 = objc_alloc_init(BLPurchaseUIHelper);
    purchaseUIHelper = v15->_purchaseUIHelper;
    v15->_purchaseUIHelper = v20;

    [(AMSPurchaseQueueConfiguration *)v15->_purchaseQueueConfiguration setDelegate:v15->_purchaseUIHelper];
    v22 = (AMSPurchaseQueue *)[objc_alloc((Class)AMSPurchaseQueue) initWithConfiguration:v15->_purchaseQueueConfiguration];
    purchaseQueue = v15->_purchaseQueue;
    v15->_purchaseQueue = v22;

    v24 = objc_alloc_init(_BLOngoingPurchaseRequests);
    ongoingPurchaseRequests = v15->_ongoingPurchaseRequests;
    v15->_ongoingPurchaseRequests = v24;

    v26 = objc_alloc_init(BLOperationQueue);
    storeRequestOperationQueue = v15->_storeRequestOperationQueue;
    v15->_storeRequestOperationQueue = v26;

    [v12 addKeepAliveOperationQueue:v15->_storeRequestOperationQueue];
    objc_storeWeak((id *)&v15->_transactionCoordinator, v12);
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.ibooks.BLService.PurchaseManager", v28);
    dispatchQueue = v15->_dispatchQueue;
    v15->_dispatchQueue = (OS_dispatch_queue *)v29;

    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.ibooks.BLService.PurchaseManager.restoreAuthenticationQueue", v31);
    restoreAuthenticationQueue = v15->_restoreAuthenticationQueue;
    v15->_restoreAuthenticationQueue = (OS_dispatch_queue *)v32;
  }
  return v15;
}

- (void)dealloc
{
  v3 = [(BLPurchaseManager *)self transactionCoordinator];
  v4 = [(BLPurchaseManager *)self storeRequestOperationQueue];
  [v3 removeKeepAliveOperationQueue:v4];

  v5.receiver = self;
  v5.super_class = (Class)BLPurchaseManager;
  [(BLPurchaseManager *)&v5 dealloc];
}

- (void)purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Purchase-Mgr]: Attempting purchaseWithRequest:", buf, 2u);
  }

  id v12 = [(BLPurchaseManager *)self ongoingPurchaseRequests];
  unsigned int v13 = [v12 checkAndAddStoreIDForRequest:v8];

  if (v13)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100057B90;
    v19[3] = &unk_1001A29E8;
    v19[4] = self;
    id v20 = v8;
    id v21 = v10;
    [(BLPurchaseManager *)self _purchaseWithRequest:v20 uiHostProxy:v9 completion:v19];
  }
  else
  {
    v14 = BLServicePurchaseManagerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v8 storeIdentifier];
      id v16 = [v8 buyParameters];
      *(_DWORD *)buf = 138412546;
      v23 = v15;
      __int16 v24 = 2112;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Purchase-Mgr]: Skipping because there is ongoing purchase request for storeIdentifier=%@, buyParameters=%@", buf, 0x16u);
    }
    id v17 = objc_retainBlock(v10);
    v18 = v17;
    if (v17) {
      (*((void (**)(id, void, void, void))v17 + 2))(v17, 0, 0, 0);
    }
  }
}

- (void)_purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  objc_opt_class();
  id v12 = [v11 valueForEntitlement:@"com.apple.application-identifier"];
  unsigned int v13 = BUDynamicCast();

  if ([v8 isRestore])
  {
    v14 = BLServicePurchaseManagerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[Purchase-Mgr]: Unexpected restore path.", (uint8_t *)buf, 2u);
    }
  }
  v15 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Purchase-Mgr]: starting _purchaseWithRequest:", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100057F4C;
  v25[3] = &unk_1001A2A38;
  objc_copyWeak(&v26, buf);
  id v16 = objc_retainBlock(v25);
  if ([v8 isAudiobook])
  {
    ((void (*)(void *, id, void, void, id, id))v16[2])(v16, v8, 0, 0, v9, v10);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100058188;
    v17[3] = &unk_1001A2A88;
    objc_copyWeak(&v24, buf);
    id v18 = v8;
    v19 = self;
    id v22 = v10;
    v23 = v16;
    id v20 = v9;
    id v21 = v13;
    [(BLPurchaseManager *)self p_downloadIDForRequest:v18 completion:v17];

    objc_destroyWeak(&v24);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(buf);
}

- (void)downloadWithPermlink:(id)a3 title:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  objc_opt_class();
  id v12 = [v11 valueForEntitlement:@"com.apple.application-identifier"];
  unsigned int v13 = BUDynamicCast();

  v14 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Purchase-Mgr]: starting downloadWithPermlink:", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v15 = [v8 absoluteString];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100058A28;
  v20[3] = &unk_1001A2B00;
  id v16 = v10;
  id v24 = v16;
  v20[4] = self;
  id v17 = v8;
  id v21 = v17;
  id v18 = v13;
  id v22 = v18;
  objc_copyWeak(&v25, buf);
  id v19 = v9;
  id v23 = v19;
  [(BLPurchaseManager *)self p_downloadIDForPermlink:v15 completion:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(buf);
}

- (void)_requestDownloadWithDownloadMetadata:(id)a3 isRestore:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  objc_opt_class();
  id v11 = [v10 valueForEntitlement:@"com.apple.application-identifier"];
  id v12 = BUDynamicCast();

  unsigned int v13 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO";
    if (v6) {
      CFStringRef v14 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v33 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Purchase-Mgr]: starting requestDownloadWithMetadata:isRestore:%@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15 = [v8 redownloadActionParameters];
  id v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 itemIdentifier]);
  id v17 = +[BLPurchaseRequest requestWithBuyParameters:v15 storeIdentifier:v16];
  [v17 setRestore:v6];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100059164;
  v23[3] = &unk_1001A2B50;
  objc_copyWeak(&v30, (id *)buf);
  id v18 = v8;
  id v24 = v18;
  id v25 = self;
  id v19 = v9;
  id v29 = v19;
  id v20 = v12;
  id v26 = v20;
  BOOL v31 = v6;
  id v21 = v15;
  id v27 = v21;
  id v22 = v16;
  id v28 = v22;
  [(BLPurchaseManager *)self p_downloadIDForRequest:v17 completion:v23];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (void)requestDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc((Class)BLDownloadMetadata);
  id v11 = [v9 copy];

  id v12 = [v10 initWithDictionary:v11];
  [(BLPurchaseManager *)self _requestDownloadWithDownloadMetadata:v12 isRestore:v5 completion:v8];
}

- (void)_requestDownloadsWithStoreDownloadItems:(id)a3 isRestore:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v15 = a5;
  id v9 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100059FF0;
  v30[4] = sub_10005A000;
  id v31 = objc_alloc_init((Class)NSMutableArray);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2810000000;
  v28[3] = &unk_100176056;
  int v29 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v12);
        dispatch_group_enter(v9);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10005A008;
        v20[3] = &unk_1001A2B78;
        v20[4] = v13;
        id v22 = v28;
        id v23 = v30;
        id v21 = v9;
        [(BLPurchaseManager *)self _requestDownloadWithDownloadMetadata:v13 isRestore:v6 completion:v20];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A124;
  block[3] = &unk_1001A20D0;
  id v18 = v15;
  id v19 = v30;
  id v14 = v15;
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

- (void)requestDownloadsWithRestoreContentRequestItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v24 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[ContentRestore] Request restores for %lu item(s)", buf, 0xCu);
  }

  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v14);
        id v16 = [BLRestoreDownloadItem alloc];
        id v17 = -[BLRestoreContentItem initWithRestoreRequestItem:](v16, "initWithRestoreRequestItem:", v15, (void)v18);
        [v9 addObject:v17];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [(BLPurchaseManager *)self _requestDownloadsWithRestoreDownloadItems:v9 completion:v7];
}

- (void)_requestDownloadsWithRestoreDownloadItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  objc_initWeak(&location, self);
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_100059FF0;
  v44 = sub_10005A000;
  id v45 = 0;
  dispatch_group_t v9 = dispatch_group_create();
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10005A7C0;
  v34[3] = &unk_1001A2BC8;
  id v10 = v7;
  id v35 = v10;
  objc_copyWeak(&v39, &location);
  id v11 = v9;
  v36 = v11;
  id v12 = v8;
  id v37 = v12;
  v38 = &v40;
  uint64_t v13 = objc_retainBlock(v34);
  if ([v6 count])
  {
    id v14 = [BLRestoreDownloadsOperation alloc];
    uint64_t v15 = [(BLPurchaseManager *)self restoreAuthenticationQueue];
    id v16 = [(BLRestoreDownloadsOperation *)v14 initWithRestoreDownloadItems:v6 authenticationQueue:v15 responseItemBlock:v13];

    [(BLRestoreDownloadsOperation *)v16 start];
    id v17 = [(BLOperation *)v16 error];

    if (v17)
    {
      long long v18 = BLServiceLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v19 = [(BLOperation *)v16 error];
        *(_DWORD *)buf = 138412290;
        v48 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[ContentRestore] Operation encountered error:  %@", buf, 0xCu);
      }
    }
    long long v20 = [(BLOperation *)v16 error];
    long long v21 = v20;
    if (!v20) {
      long long v21 = (void *)v41[5];
    }
    id v22 = v21;

    id v23 = [(BLPurchaseManager *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005AB2C;
    block[3] = &unk_1001A1AB0;
    id v29 = v6;
    id v30 = v10;
    id v31 = v22;
    id v32 = v12;
    id v33 = v27;
    id v24 = v22;
    dispatch_group_notify(v11, v23, block);
  }
  else
  {
    long long v25 = BLServiceLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[ContentRestore] Restore request items array is empty", buf, 2u);
    }

    id v26 = objc_retainBlock(v27);
    id v24 = v26;
    if (v26) {
      (*((void (**)(id, void *, void))v26 + 2))(v26, &__NSArray0__struct, 0);
    }
  }

  objc_destroyWeak(&v39);
  _Block_object_dispose(&v40, 8);

  objc_destroyWeak(&location);
}

- (void)requestDownloadsWithManifestRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10005B08C;
  v24[4] = sub_10005B0B8;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005B0C0;
  v22[3] = &unk_1001A1530;
  id v10 = a5;
  id v23 = v10;
  long long v25 = objc_retainBlock(v22);
  objc_initWeak(&location, self);
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10005B168;
  long long v18 = &unk_1001A2BF0;
  objc_copyWeak(&v20, &location);
  long long v19 = v24;
  id v11 = objc_retainBlock(&v15);
  id v12 = [BLLoadExternalDownloadManifestOperation alloc];
  uint64_t v13 = -[BLLoadExternalDownloadManifestOperation initWithRequest:uiHostProxy:downloadBlock:](v12, "initWithRequest:uiHostProxy:downloadBlock:", v8, v9, v11, v15, v16, v17, v18);
  id v14 = [(BLPurchaseManager *)self storeRequestOperationQueue];
  [v14 addOperation:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v24, 8);
}

- (id)_distinctDownloadsArrayForDownloads:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "collectionIdentifier", (void)v16))
        {
          id v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 collectionIdentifier]);
          id v13 = [v4 objectForKeyedSubscript:v12];
          if (!v13)
          {
            id v13 = objc_alloc_init((Class)NSMutableArray);
            [v4 setObject:v13 forKeyedSubscript:v12];
          }
          [v13 addObject:v11];
        }
        else
        {
          id v20 = v11;
          id v12 = +[NSArray arrayWithObjects:&v20 count:1];
          [v5 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  id v14 = [v4 allValues];
  [v5 addObjectsFromArray:v14];

  return v5;
}

- (void)_updateNetworkPolicyForQueueDownloads:(id)a3 suppressDialogs:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating download policy for automatic downloads", buf, 2u);
  }

  id v28 = v6;
  [(BLPurchaseManager *)self _distinctDownloadsArrayForDownloads:v6];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v41;
    p_vtable = BLNotificationService.vtable;
    unsigned int v30 = v4;
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v12 = 0;
      id v31 = v9;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v12;
        id v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
        id v14 = [v13 firstObject];
        uint64_t v15 = [v14 transactionIdentifier];

        id v33 = [p_vtable + 477 copyEvaluatorDownloadForDownloadMetadataArray:v13 logKey:v15];
        long long v16 = [[BLReviewNetworkPolicyOperation alloc] initWithDownload:v33];
        [(BLReviewNetworkPolicyOperation *)v16 setSuppressDialogs:v4];
        [(BLReviewNetworkPolicyOperation *)v16 start];
        long long v17 = [(BLOperation *)v16 error];

        id v35 = v16;
        if (v17)
        {
          long long v18 = BLServiceDownloadPipelineLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            long long v19 = [(BLOperation *)v16 error];
            *(_DWORD *)buf = 138543618;
            v46 = v15;
            __int16 v47 = 2112;
            id v48 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[Purchase-Mgr]: [%{public}@] Cellular evaluation for automatic download failed due to  %@", buf, 0x16u);
          }
        }
        else
        {
          id v20 = [(BLReviewNetworkPolicyOperation *)v16 cellularResult];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v18 = v13;
          id v21 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v37;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v37 != v23) {
                  objc_enumerationMutation(v18);
                }
                long long v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                id v26 = BLServiceDownloadPipelineLog();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v46 = v15;
                  __int16 v47 = 2048;
                  id v48 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[Purchase-Mgr]: [%{public}@] Set cellular evaluation result for automatic download to %ld", buf, 0x16u);
                }

                id v27 = +[NSNumber numberWithInteger:v20];
                objc_msgSend(v25, "bl_setDownloadPolicyCellularResult:", v27);
              }
              id v22 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v22);
            uint64_t v4 = v30;
            uint64_t v10 = v29;
          }
          p_vtable = (void **)(BLNotificationService + 24);
          id v9 = v31;
        }

        uint64_t v12 = v34 + 1;
      }
      while ((id)(v34 + 1) != v9);
      id v9 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v9);
  }
}

- (void)processAutomaticDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Processing automatic downloads", buf, 2u);
  }

  id v6 = +[BLLoadStoreDownloadQueueOperation operationForAutomaticDownloadQueue];
  [v6 run];
  if ([v6 success])
  {
    id v7 = [v6 downloads];
    id v8 = [v7 array];

    id v9 = BLServicePurchaseManagerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 downloads];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Downloads found in automatic download queue: %@", buf, 0xCu);
    }
    [(BLPurchaseManager *)self _updateNetworkPolicyForQueueDownloads:v8 suppressDialogs:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005B9F8;
    v12[3] = &unk_1001A1530;
    id v13 = v4;
    [(BLPurchaseManager *)self _requestDownloadsWithStoreDownloadItems:v8 isRestore:0 completion:v12];
    id v11 = v13;
    goto LABEL_9;
  }
  id v8 = (void (**)(void, void, void))objc_retainBlock(v4);
  if (v8)
  {
    id v11 = [v6 error];
    ((void (**)(void, void *, void *))v8)[2](v8, &__NSArray0__struct, v11);
LABEL_9:
  }
}

- (void)reloadFromServerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking download queues at client request", v9, 2u);
  }

  id v6 = [(BLPurchaseManager *)self _newQueueRequests];
  if ([v6 count]) {
    [(BLPurchaseManager *)self _addQueueOperationsForRequests:v6 reason:@"other"];
  }
  id v7 = objc_retainBlock(v4);
  id v8 = v7;
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)_checkStoreDownloadQueuesForPurchaseWithStoreIdentifier:(id)a3 suppressNetworkEvaluatorDialogs:(BOOL)a4
{
  id v5 = [(BLPurchaseManager *)self _newQueueRequestsForPurchaseStoreIdentifier:a3 suppressNetworkEvaluatorDialogs:a4];
  if ([v5 count]) {
    [(BLPurchaseManager *)self _addQueueOperationsForRequests:v5 reason:@"trigger-download"];
  }
}

- (id)_newQueueRequests
{
  return [(BLPurchaseManager *)self _newQueueRequestsForPurchaseStoreIdentifier:0 suppressNetworkEvaluatorDialogs:1];
}

- (id)_newQueueRequestsForPurchaseStoreIdentifier:(id)a3 suppressNetworkEvaluatorDialogs:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = +[BUAccountsProvider sharedProvider];
  id v9 = [v8 activeStoreAccount];
  uint64_t v10 = objc_msgSend(v9, "ams_DSID");

  if (v10)
  {
    id v11 = [v7 objectForKeyedSubscript:v10];
    if (!v11)
    {
      id v11 = objc_alloc_init((Class)NSMutableSet);
      [v7 setObject:v11 forKeyedSubscript:v10];
    }
    uint64_t v12 = BLDownloadSupportedDownloadKinds();
    [v11 addObjectsFromArray:v12];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  objc_msgSend(v7, "allKeys", v10);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v34;
    id v26 = v7;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v13;
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * v13);
        uint64_t v15 = [v7 objectForKeyedSubscript:v14];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = sub_100056BD4(*(void **)(*((void *)&v29 + 1) + 8 * i));
              if (v20)
              {
                id v21 = objc_alloc_init(BLStoreDownloadQueueRequest);
                [(BLStoreDownloadQueueRequest *)v21 setAccountIdentifier:v14];
                [(BLStoreDownloadQueueRequest *)v21 setPurchaseStoreIdentifier:v5];
                [(BLStoreDownloadQueueRequest *)v21 setPurchaseSuppressNetworkEvaluatorDialogs:v4];
                [(BLStoreDownloadQueueRequest *)v21 setQueueIdentifier:v20];
                [v6 addObject:v21];
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v17);
        }

        uint64_t v13 = v28 + 1;
        id v7 = v26;
      }
      while ((id)(v28 + 1) != v27);
      id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v27);
  }

  return v6;
}

- (void)_addQueueOperationsForRequests:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 isEqualToString:@"trigger-download"];
  id v9 = BLServiceLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134218242;
      id v36 = [v6 count];
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Load Queue: Loading %lu queues with reason: %@", buf, 0x16u);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [(BLPurchaseManager *)self _newLoadQueueOperationForQueueRequest:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          id v17 = [(BLPurchaseManager *)self storeRequestOperationQueue];
          [v17 addOperation:v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v13);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 134218242;
      id v36 = [v6 count];
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Load Queue: Checking %lu queues with reason: %@", buf, 0x16u);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v6;
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = -[BLPurchaseManager _newCheckQueueOperationForQueueRequest:](self, "_newCheckQueueOperationForQueueRequest:", *(void *)(*((void *)&v25 + 1) + 8 * (void)j), (void)v25);
          id v24 = [(BLPurchaseManager *)self storeRequestOperationQueue];
          [v24 addOperation:v23];
        }
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }
  }
}

- (id)_newCheckQueueOperationForQueueRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[BLCheckDownloadQueueOperation alloc] initWithDownloadQueueRequest:v4];
  objc_initWeak(&location, v5);
  objc_initWeak(&from, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005C288;
  v8[3] = &unk_1001A2C18;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  id v6 = v4;
  id v9 = v6;
  [(BLCheckDownloadQueueOperation *)v5 setCompletionBlock:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_newLoadQueueOperationForQueueRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[BUBag defaultBag];
  id v6 = [v4 queueContentsURLBagKey];
  id v7 = [v5 URLForKey:v6];

  unsigned int v8 = [v4 accountIdentifier];
  id v9 = +[ACAccount bu_storeAccountWithDSID:v8];

  id v10 = [[BLLoadStoreDownloadQueueOperation alloc] initWithBagURL:v7 account:v9];
  objc_initWeak(&location, v10);
  objc_initWeak(&from, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005C4E8;
  v13[3] = &unk_1001A2C18;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  id v11 = v4;
  id v14 = v11;
  [(BLLoadStoreDownloadQueueOperation *)v10 setCompletionBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v10;
}

- (void)dq_performDownloadWithPermlink:(id)a3 title:(id)a4 clientIdentifier:(id)a5 downloadID:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v51 = a4;
  id v50 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(BLPurchaseManager *)self databaseManager];
  if (v12 && [v13 length])
  {
    id v16 = +[BLDownloadManager downloadDirectoryForDownloadID:v13];
    id v48 = [v16 path];

    v49 = [v48 stringByAppendingPathComponent:@"asset"];
    __int16 v47 = [v12 pathExtension];
    if ([v47 length])
    {
      uint64_t v17 = [v49 stringByAppendingPathExtension:v47];

      v49 = (void *)v17;
    }
    id v18 = +[NSFileManager defaultManager];
    id v74 = 0;
    unsigned int v19 = [v18 createDirectoryAtPath:v48 withIntermediateDirectories:1 attributes:0 error:&v74];
    id v20 = v74;

    if (v19)
    {
      id v21 = objc_alloc((Class)BLDownloadMetadata);
      CFStringRef v78 = @"metadata";
      id v22 = objc_opt_new();
      v79 = v22;
      id v23 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      id v24 = [v21 initWithDictionary:v23];

      [v24 setSortTitle:v51];
      [v24 setTitle:v51];
      long long v25 = [v12 absoluteString];
      [v24 setDownloadPermalink:v25];

      [v24 setSample:0];
      id v45 = [v24 artistName];
      long long v43 = [v24 title];
      long long v42 = [v24 title];
      long long v41 = [v24 genre];
      long long v40 = [v24 kind];
      long long v26 = [v24 thumbnailImageURL];
      long long v27 = [v26 absoluteString];

      long long v28 = [(BLPurchaseManager *)self dq_writeMetadata:v24 clientIdentifier:v50 downloadID:v13];
      long long v29 = [(BLPurchaseManager *)self transactionCoordinator];
      [v29 willStartTransactionWithIdentifier:v13];

      objc_initWeak((id *)location, self);
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10005D0E8;
      v64[3] = &unk_1001A2C80;
      id v39 = v28;
      id v65 = v39;
      id v66 = v49;
      id v67 = v47;
      id v37 = v45;
      id v68 = v37;
      id v38 = v43;
      id v69 = v38;
      id v44 = v42;
      id v70 = v44;
      id v46 = v41;
      id v71 = v46;
      id v30 = v40;
      id v72 = v30;
      id v31 = v27;
      id v73 = v31;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_10005D234;
      v59[3] = &unk_1001A2CD0;
      objc_copyWeak(&v63, (id *)location);
      id v60 = v13;
      id v61 = v12;
      id v62 = v14;
      [v15 updateDownloadWithID:v60 updateBlock:v64 completion:v59];

      objc_destroyWeak(&v63);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v36 = BLServicePurchaseManagerLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v13;
        __int16 v76 = 2112;
        id v77 = v20;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: Failed to create target path for download, moving download failed. Error:  %@", location, 0x16u);
      }

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10005D498;
      v55[3] = &unk_1001A2858;
      id v58 = v14;
      id v56 = v13;
      id v57 = v20;
      [v15 saveDownloadStateWithId:v56 state:6 completion:v55];

      id v24 = v58;
    }
  }
  else
  {
    BOOL v32 = [v13 length] == 0;
    long long v33 = BLServicePurchaseManagerLog();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        *(_WORD *)id location = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[Purchase-Mgr]: Unknown download.", location, 2u);
      }

      id v20 = objc_retainBlock(v14);
      if (v20)
      {
        long long v35 = sub_10004B6AC(23, 0, 0);
        (*((void (**)(id, id, void *))v20 + 2))(v20, v13, v35);
      }
    }
    else
    {
      if (v34)
      {
        *(_DWORD *)id location = 138543362;
        *(void *)&location[4] = v13;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: No permlink available to download", location, 0xCu);
      }

      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10005D4F4;
      v52[3] = &unk_1001A2CF8;
      id v54 = v14;
      id v53 = v13;
      [v15 saveDownloadStateWithId:v53 state:6 completion:v52];

      id v20 = v54;
    }
  }
}

- (void)dq_performPurchaseWithRequest:(id)a3 downloadID:(id)a4 uiHostProxy:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  v146 = self;
  id v14 = [(BLPurchaseManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(__CFString *)v11 length];
    CFStringRef v17 = @"<Audiobook>";
    if (v16) {
      CFStringRef v17 = v11;
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v176 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Processing purchase request on dispatchQueue", buf, 0xCu);
  }

  id v18 = [(BLPurchaseManager *)self databaseManager];
  unsigned int v19 = +[BLDownloadManager downloadDirectoryForDownloadID:v11];
  id v20 = [v19 path];

  v139 = v20;
  v140 = v18;
  if (![(__CFString *)v11 length])
  {
    id v133 = 0;
LABEL_9:
    id v24 = v13;
    long long v25 = [v10 buyParameters];
    v132 = +[NSURL bu_dictionaryForQueryString:v25 unescapedValues:0];
    id v26 = [v132 mutableCopy];
    [v26 setObject:@"true" forKeyedSubscript:@"wasWarnedOverLimitBuyOnCellular"];
    v131 = v26;
    id v27 = [v26 copy];
    uint64_t v28 = +[NSURL bu_queryStringForDictionary:v27 escapedValues:1];

    v130 = (void *)v28;
    id v29 = [objc_alloc((Class)AMSBuyParams) initWithString:v28];
    uint64_t v30 = [v10 accountIdentifier];
    id v31 = +[BUAccountsProvider sharedProvider];
    BOOL v32 = [v31 activeStoreAccount];

    v138 = v32;
    long long v33 = objc_msgSend(v32, "ams_DSID");
    BOOL v34 = v33;
    if (v30 && v33 && ([v33 isEqualToNumber:v30] & 1) == 0)
    {
      long long v35 = [v10 accountIdentifier];
      [v29 setParameter:v35 forKey:AMSBuyParamPropertyOwnerDsid];
    }
    id v36 = [objc_alloc((Class)AMSPurchase) initWithPurchaseType:0 buyParams:v29];
    objc_msgSend(v36, "setUserInitiated:", objc_msgSend(v10, "isUserInitiated"));
    [v36 setCallerBundleId:@"com.apple.iBooks"];
    [v36 setClientId:@"com.apple.iBooks"];
    [v36 setOwnerAccountId:v30];
    [v36 setAccount:v138];
    id v37 = [v10 logUUID];
    [v36 setLogUUID:v37];

    v143 = v36;
    [v36 setRequiresAccount:1];
    id v38 = BLServicePurchaseManagerLog();
    v128 = (void *)v30;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = [v10 presentingSceneIdentifier];
      *(_DWORD *)buf = 138543618;
      CFStringRef v176 = v11;
      __int16 v177 = 2112;
      id v178 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: presentingSceneIdentifier: %@", buf, 0x16u);
    }
    long long v40 = [v10 presentingSceneIdentifier];
    [v36 setPresentingSceneIdentifier:v40];

    if (v12)
    {
      long long v41 = [(BLPurchaseManager *)v146 purchaseUIHelper];
      [v41 setUiHostProxy:v12];
    }
    long long v42 = BLServicePurchaseManagerLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v176 = v11;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: About to enqueue AMS purchase request", buf, 0xCu);
    }

    long long v43 = [(BLPurchaseManager *)v146 purchaseQueue];
    id v182 = v36;
    id v44 = +[NSArray arrayWithObjects:&v182 count:1];
    id v45 = [v43 enquePurchases:v44];

    id v173 = 0;
    v126 = v45;
    id v46 = [v45 resultWithError:&v173];
    id v135 = v173;
    __int16 v47 = BLServicePurchaseManagerLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v176 = v11;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: AMS purchase promise fulfilled.", buf, 0xCu);
    }
    id v134 = v12;

    v142 = [v46 firstObject];
    id v48 = v24;
    if (v11) {
      [v140 syncTouchDownloadWithId:v11];
    }
    if (v142)
    {
      id v49 = [objc_alloc((Class)BLPurchaseResponse) initWithAMSPurchaseResult:v142];
      id v141 = [v142 error];
    }
    else if (v135)
    {
      id v53 = [objc_alloc((Class)BLPurchaseResponse) initWithPurchase:v143 error:v135];
      id v141 = v135;
      id v48 = v24;
      id v49 = v53;
    }
    else
    {
      sub_10004B6AC(13, @"No Purchase Result", @"Purchase results was empty with no error.");
      id v141 = (id)objc_claimAutoreleasedReturnValue();
      id v48 = v24;
      id v49 = 0;
    }
    v125 = v46;
    id v129 = v29;
    id v54 = [v49 item];

    v127 = v34;
    if (v54)
    {
      id v54 = objc_alloc((Class)BLDownloadMetadata);
      v55 = [v49 item];
      id v56 = [v54 initWithDictionary:v55];

      LODWORD(v54) = objc_msgSend(v56, "bl_isPurchaseRedownload");
    }
    id v57 = objc_opt_new();
    id v58 = [v49 storeID];
    [v57 setObject:v58 forKeyedSubscript:BLDownloadQueuePropertyStoreItemIdentifier];

    v59 = [v49 downloadID];
    [v57 setObject:v59 forKeyedSubscript:BLDownloadQueuePropertyDownloadIdentifier];

    id v60 = [v49 purchaseParameters];
    [v57 setObject:v60 forKeyedSubscript:BLDownloadQueuePropertyPurchaseParameters];

    id v61 = [v49 currency];
    [v57 setObject:v61 forKeyedSubscript:BLDownloadQueuePropertyPurchaseCurrency];

    id v62 = [v49 price];
    [v57 setObject:v62 forKeyedSubscript:BLDownloadQueuePropertyPurchasePrice];

    id v63 = [v141 userInfo];
    v64 = [v63 description];
    [v57 setObject:v64 forKeyedSubscript:BLDownloadQueuePropertyPurchaseErrorInfo];

    id v65 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v141 code]);
    [v57 setObject:v65 forKeyedSubscript:BLDownloadQueuePropertyPurchaseErrorCode];

    id v66 = [v141 domain];
    [v57 setObject:v66 forKeyedSubscript:BLDownloadQueuePropertyPurchaseErrorDomain];

    id v67 = [v141 localizedDescription];
    [v57 setObject:v67 forKeyedSubscript:BLDownloadQueuePropertyPurchaseErrorDescription];

    id v68 = [v49 logUUID];
    [v57 setObject:v68 forKeyedSubscript:BLDownloadQueuePropertyPurchaseLogUUID];

    id v69 = +[NSNumber numberWithInt:v54 ^ 1];
    v137 = v57;
    [v57 setObject:v69 forKeyedSubscript:BLDownloadQueuePropertyIsPurchase];

    id v70 = BLServiceDownloadPipelineLog();
    BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
    if (v141)
    {
      id v72 = v139;
      id v73 = v142;
      if (v71)
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v176 = v11;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Posting BLDownloadQueuePurchaseFailedNotification.", buf, 0xCu);
      }

      id v74 = [(BLPurchaseManager *)v146 progressSender];
      [v74 sendPurchaseFailedWithUserInfo:v137];
    }
    else
    {
      id v72 = v139;
      id v73 = v142;
      if (v71)
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v176 = v11;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Posting BLDownloadQueuePurchaseSucceededNotification.", buf, 0xCu);
      }

      id v74 = [(BLPurchaseManager *)v146 progressSender];
      [v74 sendPurchaseSucceededWithUserInfo:v137];
    }

    v75 = [v73 responseDictionary];

    v136 = v48;
    if (v75)
    {
      __int16 v76 = BLServicePurchaseManagerLog();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v176 = v11;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: AMS purchase response is non-empty", buf, 0xCu);
      }
      v148 = v49;

      id v77 = [v73 responseDictionary];
      v123 = [v77 objectForKeyedSubscript:@"trigger-download"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v123 BOOLValue])
      {
        CFStringRef v78 = BLServicePurchaseManagerLog();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v176 = v11;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Got trigger-download in purchase response", buf, 0xCu);
        }

        [(BLPurchaseManager *)v146 _handleTriggerDownloadforRequest:v10 withDownloadID:v11];
      }
      v79 = [v10 storeIdentifiersToDownload];
      v80 = [v148 purchaseResponseItems];
      id v122 = v10;
      v144 = v11;
      v124 = v77;
      if ([v80 count])
      {
        v81 = +[BLEvaluatorDownload copyEvaluatorDownloadForPurchaseResponse:v148 storeIdentifiersToDownload:v79];
        v147 = [[BLReviewNetworkPolicyOperation alloc] initWithDownload:v81];
        if ([v10 shouldSuppressNetworkEvaluatorDialogs]) {
          uint64_t v82 = 1;
        }
        else {
          uint64_t v82 = [v10 isUserInitiated] ^ 1;
        }
        -[BLReviewNetworkPolicyOperation setSuppressDialogs:](v147, "setSuppressDialogs:", v82, v10);
        [(BLReviewNetworkPolicyOperation *)v147 start];
        [(BLReviewNetworkPolicyOperation *)v147 waitUntilFinished];
      }
      else
      {
        v81 = BLServicePurchaseManagerLog();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "[Purchase-Mgr]: Purchase response items is empty", buf, 2u);
        }
        v147 = 0;
      }

      v94 = dispatch_group_create();
      long long v169 = 0u;
      long long v170 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      id obj = v80;
      id v150 = [obj countByEnumeratingWithState:&v169 objects:v181 count:16];
      if (v150)
      {
        uint64_t v149 = *(void *)v170;
        do
        {
          for (i = 0; i != v150; i = (char *)i + 1)
          {
            if (*(void *)v170 != v149) {
              objc_enumerationMutation(obj);
            }
            v96 = *(void **)(*((void *)&v169 + 1) + 8 * i);
            dispatch_group_enter(v94);
            v97 = [v96 item];
            v98 = [v96 metadata];
            v99 = [v98 objectForKeyedSubscript:@"itemId"];
            v100 = BLGetNSNumberFromValue();

            if (v79 && ([v79 containsObject:v100] & 1) == 0)
            {
              id v105 = [objc_alloc((Class)BLDownloadMetadata) initWithDictionary:v97];
              v106 = [(BLPurchaseManager *)v146 _accountIdentifierFromDownloadMetadata:v105];
              v107 = [v100 stringValue];
              v108 = [v105 transactionIdentifier];
              v109 = BLServiceDownloadPipelineLog();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                CFStringRef v176 = v107;
                _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Skipping download", buf, 0xCu);
              }

              v167[0] = _NSConcreteStackBlock;
              v167[1] = 3221225472;
              v167[2] = sub_10005EAC8;
              v167[3] = &unk_1001A2080;
              v168 = v107;
              v110 = v107;
              +[BLServerDownloadDoneRequest notifyDownloadDoneWithAccountID:v106 downloadID:v110 storeID:v100 transactionID:v108 completion:v167];
              dispatch_group_leave(v94);
            }
            else
            {
              v101 = [(BLOperation *)v147 error];

              if (v101)
              {
                v102 = BLServiceDownloadPipelineLog();
                if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                {
                  v103 = [v148 logUUID];
                  v104 = [(BLOperation *)v147 error];
                  *(_DWORD *)buf = 138543874;
                  CFStringRef v176 = v144;
                  __int16 v177 = 2114;
                  id v178 = v103;
                  __int16 v179 = 2112;
                  id v180 = v104;
                  _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "(dID=%{public}@) {logUUID=%{public}@} [Purchase-Mgr]: Cellular evaluation for download failed due to  %@", buf, 0x20u);
                }
              }
              else
              {
                id v111 = [(BLReviewNetworkPolicyOperation *)v147 cellularResult];
                v112 = BLServiceDownloadPipelineLog();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                {
                  v113 = [v148 logUUID];
                  *(_DWORD *)buf = 138543874;
                  CFStringRef v176 = v144;
                  __int16 v177 = 2114;
                  id v178 = v113;
                  __int16 v179 = 2048;
                  id v180 = v111;
                  _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) {logUUID=%{public}@} [Purchase-Mgr]: Set cellular evaluation result for download to %ld", buf, 0x20u);
                }
                v102 = [v97 mutableCopy];
                v114 = +[NSNumber numberWithInteger:v111];
                +[BLDownloadMetadata bl_setDownloadPolicyCellularResult:v114 toDictionary:v102];

                id v115 = [v102 copy];
                v97 = v115;
              }

              objc_opt_class();
              v116 = [v96 metadata];
              v117 = [v116 objectForKeyedSubscript:@"kind"];
              BUDynamicCast();
              id v105 = (id)objc_claimAutoreleasedReturnValue();

              v106 = BLDownloadSupportedDownloadKinds();
              if ([v106 containsObject:v105])
              {
                v163[0] = _NSConcreteStackBlock;
                v163[1] = 3221225472;
                v163[2] = sub_10005EB98;
                v163[3] = &unk_1001A2D20;
                v163[4] = v146;
                v163[5] = v96;
                id v164 = v148;
                id v105 = v105;
                id v165 = v105;
                v166 = v94;
                [(BLPurchaseManager *)v146 requestDownloadWithMetadata:v97 isRestore:0 completion:v163];
              }
              else
              {
                v118 = BLServiceDownloadPipelineLog();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                {
                  v119 = [v148 logUUID];
                  *(_DWORD *)buf = 138543874;
                  CFStringRef v176 = v144;
                  __int16 v177 = 2114;
                  id v178 = v119;
                  __int16 v179 = 2114;
                  id v180 = v105;
                  _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "(dID=%{public}@) {logUUID=%{public}@}[Purchase-Mgr]: Skipping download due to unrecognized kind '%{public}@'", buf, 0x20u);
                }
                dispatch_group_leave(v94);
              }
            }
          }
          id v150 = [obj countByEnumeratingWithState:&v169 objects:v181 count:16];
        }
        while (v150);
      }

      v120 = [(BLPurchaseManager *)v146 dispatchQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005ED3C;
      block[3] = &unk_1001A2D48;
      v92 = v141;
      id v158 = v141;
      v93 = v143;
      id v159 = v143;
      id v162 = v136;
      id v11 = v144;
      v160 = v144;
      id v161 = v148;
      dispatch_group_notify(v94, v120, block);

      id v49 = v148;
      id v10 = v122;
      v89 = (void (**)(id, id, id, id))v123;
      id v20 = v139;
      v87 = v129;
      v121 = v127;
      v90 = v135;
    }
    else
    {
      v83 = [v141 userInfo];
      v84 = [v83 objectForKeyedSubscript:AMSErrorUserInfoKeyServerPayload];
      v85 = [v84 objectForKeyedSubscript:@"trigger-download"];

      v124 = v85;
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v85 BOOLValue])
      {
        v86 = BLServicePurchaseManagerLog();
        v87 = v129;
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          CFStringRef v176 = v11;
          __int16 v177 = 2112;
          id v178 = v141;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: Got trigger-download in error of purchase response, error:  %@", buf, 0x16u);
        }

        [(BLPurchaseManager *)v146 _handleTriggerDownloadforRequest:v10 withDownloadID:v11];
      }
      else
      {
        v88 = BLServicePurchaseManagerLog();
        v87 = v129;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          CFStringRef v176 = v11;
          __int16 v177 = 2112;
          id v178 = v141;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: AMS purchase response is empty, error:  %@", buf, 0x16u);
        }
      }
      id v20 = v72;
      v89 = objc_retainBlock(v48);
      v90 = v135;
      if (v89)
      {
        v91 = v89;
        v92 = v141;
        v89[2](v89, v11, v49, v141);
        v89 = v91;
        v93 = v143;
      }
      else
      {
        v93 = v143;
        v92 = v141;
      }
      v121 = v127;
    }

    v52 = v130;
    id v51 = v133;
    id v12 = v134;
    id v18 = v140;
    id v13 = v136;
    goto LABEL_93;
  }
  id v21 = +[NSFileManager defaultManager];
  id v174 = 0;
  unsigned int v22 = [v21 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v174];
  id v23 = v174;

  if (v22)
  {
    id v133 = v23;
    goto LABEL_9;
  }
  id v50 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v176 = v11;
    __int16 v177 = 2112;
    id v178 = v23;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: Failed to create target path for download, moving download to failed. Error:  %@", buf, 0x16u);
  }

  v151[0] = _NSConcreteStackBlock;
  v151[1] = 3221225472;
  v151[2] = sub_10005EE90;
  v151[3] = &unk_1001A2D70;
  id v152 = v10;
  v153 = v11;
  v154 = v146;
  id v156 = v13;
  id v51 = v23;
  id v155 = v51;
  [v18 saveDownloadStateWithId:v153 state:6 completion:v151];

  v52 = v152;
LABEL_93:
}

- (void)_handleTriggerDownloadforRequest:(id)a3 withDownloadID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 storeIdentifier];
  if ([v6 shouldSuppressNetworkEvaluatorDialogs]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [v6 isUserInitiated] ^ 1;
  }
  [(BLPurchaseManager *)self _checkStoreDownloadQueuesForPurchaseWithStoreIdentifier:v8 suppressNetworkEvaluatorDialogs:v9];

  id v10 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Handling for trigger-download completed", (uint8_t *)&v11, 0xCu);
  }
}

- (void)dq_performDownloadDownloadMetadata:(id)a3 downloadID:(id)a4 clientIdentifier:(id)a5 isRestoreItem:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v113 = a5;
  id v12 = [(BLPurchaseManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v174 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Preparing the download asset on dispatchQueue based on the downloadsMetadata.", buf, 0xCu);
  }

  id v14 = +[BLDownloadManager downloadDirectoryForDownloadID:v11];
  v118 = [v14 path];

  v119 = [v118 stringByAppendingPathComponent:@"asset"];
  v117 = [v10 fileExtension];
  if ([v117 length])
  {
    uint64_t v15 = [v119 stringByAppendingPathExtension:v117];

    v119 = (void *)v15;
  }
  v116 = [(BLPurchaseManager *)self databaseManager];
  id v16 = +[NSFileManager defaultManager];
  id v170 = 0;
  unsigned int v17 = [v16 createDirectoryAtPath:v118 withIntermediateDirectories:1 attributes:0 error:&v170];
  id v114 = v170;

  if (v17)
  {
    v112 = objc_msgSend(v10, "bl_assetFileSize");
    v107 = [v10 primaryAssetURL];
    id v115 = [v10 sinfs];
    v99 = [v10 epubRightsData];
    objc_opt_class();
    id v18 = [v115 firstObject];
    v104 = BUDynamicCast();

    objc_opt_class();
    unsigned int v19 = [v104 objectForKeyedSubscript:@"dpInfo"];
    v98 = BUDynamicCast();

    id v169 = 0;
    id v105 = +[NSPropertyListSerialization dataWithPropertyList:v115 format:200 options:0 error:&v169];
    id v70 = v169;
    if (v115 && !v105)
    {
      id v20 = BLServicePurchaseManagerLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v174 = v11;
        __int16 v175 = 2112;
        id v176 = v70;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: Error serializing sinfInfo:  %@", buf, 0x16u);
      }
    }
    v97 = [v10 fullSizeImageURL];
    v96 = [v10 publicationVersion];
    v93 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isAutomaticDownload]);
    if (a6)
    {
      v109 = &__kCFBooleanTrue;
    }
    else
    {
      v109 = objc_msgSend(v10, "valueForFirstAvailableKey:", BLSSDownloadPropertyIsRestore, 0);
    }
    v95 = [v10 downloadKey];
    v94 = objc_msgSend(v10, "valueForFirstAvailableKey:", BLDownloadMetadataKeyIsZipStreamable, 0);
    v92 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 itemIdentifier]);
    v91 = [v10 artistName];
    v90 = [v10 title];
    v87 = [v10 title];
    v86 = [v10 collectionArtistName];
    v89 = [v10 collectionName];
    v88 = [v10 genre];
    v110 = [v10 kind];
    unsigned int v22 = [v10 thumbnailImageURL];
    v85 = [v22 absoluteString];

    v84 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isSample]);
    v83 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "bl_isPurchaseRedownload") ^ 1);
    uint64_t v82 = [v10 purchaseDate];
    v81 = [v10 transactionIdentifier];
    id v23 = [v10 cancelDownloadURL];
    v80 = [v23 absoluteString];

    v103 = [v10 valueForMetadataKey:BLDownloadMetadataKeyAdditionalInfo];
    objc_opt_class();
    id v24 = [v10 valueForMetadataKey:@"local-server-info"];
    v79 = BUDynamicCast();

    v108 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 collectionIdentifier]);
    CFStringRef v78 = [v10 racGUID];
    id v77 = [v10 valueForMetadataKey:@"encryptionKey"];
    __int16 v76 = [v10 valueForMetadataKey:@"salt"];
    if (v103)
    {
      v75 = [v103 objectForKey:BLDownloadMetadataKeyRequestPersistentID];
    }
    else
    {
      v75 = 0;
    }
    long long v25 = objc_msgSend(v10, "bl_downloadPolicyCellularResult");
    v102 = v25;
    if (v25)
    {
      id v26 = [v25 integerValue];
      id v27 = BLServiceDownloadPipelineLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v174 = v11;
        __int16 v175 = 2048;
        id v176 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Cellular evaluation result for download was %ld", buf, 0x16u);
      }

      v100 = +[BLDownloadPolicy policyInfoWithCellularResult:v26];
    }
    else
    {
      v100 = 0;
    }
    v101 = [(BLPurchaseManager *)self downloadPolicyManager];
    [v101 addOrUpdateDownloadPolicyWithInfo:v100 withPolicyID:v11 storePlaylistIdentifier:v108];
    unsigned int v28 = [v109 BOOLValue];
    id v29 = BLServicePurchaseManagerLog();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (!v30) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      id v31 = "[Purchase-Mgr]: isRestore is TRUE";
    }
    else
    {
      if (!v30) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      id v31 = "[Purchase-Mgr]: isRestore is FALSE";
    }
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
LABEL_31:

    id v111 = [(BLPurchaseManager *)self _accountIdentifierFromDownloadMetadata:v10];
    BOOL v32 = objc_msgSend(v10, "bl_purchaserAccountIdentifier");
    unsigned int v33 = [BLDownloadKindAudiobook isEqualToString:v110];
    id v106 = 0;
    if (v111) {
      unsigned int v34 = v33;
    }
    else {
      unsigned int v34 = 0;
    }
    if (v34 != 1 || !v32) {
      goto LABEL_59;
    }
    if ([v111 isEqualToNumber:v32])
    {
      id v106 = 0;
LABEL_59:
      if (v112) {
        id v49 = v112;
      }
      id v50 = objc_msgSend(v10, "valueForFirstAvailableKey:", BLDownloadMetadataKeyHashChunks, 0);
      objc_opt_class();
      id v51 = BUDynamicCast();
      if (v51)
      {
        id v74 = [v50 objectForKey:BLDownloadMetadataKeyHashChunkHashes];
        objc_opt_class();
        v52 = [v51 objectForKeyedSubscript:BLDownloadMetadataKeyHashChunkSize];
        id v53 = BUDynamicCast();

        id v54 = v53;
        v55 = v112;
        id v72 = v54;
      }
      else
      {
        objc_opt_class();
        id v56 = objc_msgSend(v10, "valueForFirstAvailableKey:", BLDownloadMetadataKeyMD5, 0);
        v55 = BUDynamicCast();

        if (v55)
        {
          long long v171 = v55;
          id v74 = +[NSArray arrayWithObjects:&v171 count:1];
        }
        else
        {
          id v74 = 0;
        }
        id v72 = 0;
        id v54 = v112;
      }

      if (v107 && [v11 length])
      {
        id v57 = [(BLPurchaseManager *)self transactionCoordinator];
        [v57 willStartTransactionWithIdentifier:v11];

        id v69 = +[BLAssetContainerFactory assetContainerForDownloadKind:v110 isPermlink:0];
        [v69 purchasedAssetWithMetadata:v10 familyAccountID:v106];
        id v58 = [(BLPurchaseManager *)self dq_writeMetadata:v10 clientIdentifier:v113 downloadID:v11];
        v59 = [v10 kind];
        id v60 = [(BLPurchaseManager *)self dq_writeSinf:v99 downloadID:v11 downloadKind:v59];

        id v61 = [(BLPurchaseManager *)self dq_writeArtworkWithURL:v97 downloadID:v11];
        objc_initWeak((id *)buf, self);
        v124[0] = _NSConcreteStackBlock;
        v124[1] = 3221225472;
        v124[2] = sub_1000604B0;
        v124[3] = &unk_1001A2D98;
        id v65 = v58;
        id v125 = v65;
        id v126 = v119;
        id v67 = v60;
        id v127 = v67;
        id v62 = v61;
        id v128 = v62;
        id v129 = v98;
        id v130 = v105;
        id v131 = v117;
        id v132 = v96;
        id v133 = v93;
        id v63 = v107;
        id v134 = v63;
        id v135 = v109;
        id v136 = v84;
        id v137 = v83;
        id v138 = v79;
        id v139 = v82;
        id v140 = v95;
        id v141 = v112;
        id v142 = v111;
        id v143 = v106;
        id v144 = v92;
        id v145 = v75;
        id v146 = v81;
        id v147 = v80;
        id v148 = v94;
        id v149 = v74;
        id v150 = v54;
        id v151 = v72;
        id v152 = v91;
        id v153 = v90;
        id v154 = v87;
        id v155 = v86;
        id v156 = v89;
        id v157 = v88;
        id v158 = v110;
        id v159 = v85;
        id v160 = v108;
        id v161 = v78;
        id v162 = v77;
        id v163 = v76;
        v120[0] = _NSConcreteStackBlock;
        v120[1] = 3221225472;
        v120[2] = sub_1000607C0;
        v120[3] = &unk_1001A1EA8;
        objc_copyWeak(&v123, (id *)buf);
        id v121 = v11;
        id v122 = v63;
        [v116 updateDownloadWithID:v121 updateBlock:v124 completion:v120];

        objc_destroyWeak(&v123);
        objc_destroyWeak((id *)buf);
      }
      else if ([v11 length])
      {
        v64 = BLServicePurchaseManagerLog();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v174 = v11;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: No url available to download", buf, 0xCu);
        }

        [v116 saveDownloadStateWithId:v11 state:6 completion:0];
      }

      goto LABEL_75;
    }
    long long v35 = BLServicePurchaseManagerLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v174 = v11;
      __int16 v175 = 2112;
      id v176 = v32;
      __int16 v177 = 2112;
      id v178 = v111;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: purchaserAccountID (%@) different from accountID (%@), retrieving family info to verify whether purchaser is a family member", buf, 0x20u);
    }

    id v36 = objc_alloc((Class)AMSFamilyInfoLookupTask);
    id v37 = +[BUAccountsProvider sharedProvider];
    id v38 = [v37 activeStoreAccount];
    id v39 = +[BUBag defaultBag];
    id v73 = [v36 initWithAccount:v38 bag:v39];

    BOOL v71 = [v73 performFamilyInfoLookup];
    id v168 = 0;
    id v68 = [v71 resultWithTimeout:&v168 error:15.0];
    id v66 = v168;
    if (v66)
    {
      long long v40 = BLServicePurchaseManagerLog();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
      *(_DWORD *)buf = 138543618;
      id v174 = v11;
      __int16 v175 = 2112;
      id v176 = v32;
      long long v41 = "(dID=%{public}@) [Purchase-Mgr]: failed to retrieve family information to identify purchaserID (%@)";
    }
    else
    {
      long long v166 = 0u;
      long long v167 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      long long v40 = [v68 familyMembers];
      id v42 = [v40 countByEnumeratingWithState:&v164 objects:v172 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v165;
        while (2)
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v165 != v43) {
              objc_enumerationMutation(v40);
            }
            id v45 = *(void **)(*((void *)&v164 + 1) + 8 * i);
            id v46 = [v45 iTunesDSID];
            if ([v46 isEqualToNumber:v32])
            {
              id v106 = v46;
              __int16 v47 = BLServicePurchaseManagerLog();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                id v48 = [v45 iTunesUsername];
                *(_DWORD *)buf = 138543874;
                id v174 = v11;
                __int16 v175 = 2112;
                id v176 = v32;
                __int16 v177 = 2112;
                id v178 = v48;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Verified purchaserAccountID (%@) belongs to a family member (%@)", buf, 0x20u);
              }
              goto LABEL_58;
            }
          }
          id v42 = [v40 countByEnumeratingWithState:&v164 objects:v172 count:16];
          if (v42) {
            continue;
          }
          break;
        }
      }

      long long v40 = BLServicePurchaseManagerLog();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
      *(_DWORD *)buf = 138543618;
      id v174 = v11;
      __int16 v175 = 2112;
      id v176 = v32;
      long long v41 = "(dID=%{public}@) [Purchase-Mgr]: purchaserAccountID (%@) does not belong to a family member; ignoring";
    }
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 0x16u);
LABEL_44:
    id v106 = 0;
LABEL_58:

    goto LABEL_59;
  }
  id v21 = BLServicePurchaseManagerLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v174 = v11;
    __int16 v175 = 2112;
    id v176 = v114;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: Failed to create target path for download, moving it to failed. Error:  %@", buf, 0x16u);
  }

  [v116 saveDownloadStateWithId:v11 state:6 completion:0];
LABEL_75:
}

- (void)dq_triggerDownloadForDownloadID:(id)a3 urlToAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(BLPurchaseManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(BLPurchaseManager *)self delegate];
  v15[0] = @"downloadID";
  v15[1] = @"url";
  v16[0] = v7;
  id v10 = [v6 absoluteString];
  v16[1] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100060B04;
  v13[3] = &unk_1001A2DC0;
  id v14 = v6;
  id v12 = v6;
  [v9 purchaseManager:self requestDownloadWithParameters:v11 completion:v13];
}

- (void)dq_triggerRestartDownloadForDownloadID:(id)a3
{
  id v4 = a3;
  id v5 = [(BLPurchaseManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BLPurchaseManager *)self delegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100060D9C;
  v8[3] = &unk_1001A14B8;
  id v9 = v4;
  id v7 = v4;
  [v6 purchaseManager:self restartDownloadWithID:v7 withCompletion:v8];
}

- (id)dq_writeMetadata:(id)a3 clientIdentifier:(id)a4 downloadID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BLPurchaseManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [[BLITunesMetadataHelper alloc] initWithClientIdentifier:v9 downloadMetadata:v10];
  id v17 = 0;
  id v13 = [(BLITunesMetadataHelper *)v12 writePlistWithDownloadID:v8 error:&v17];
  id v14 = v17;
  if (![v13 length])
  {
    uint64_t v15 = BLBookInstallLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: Failed to write iTunesMetadata.plist for download. Error:  %@", buf, 0x16u);
    }
  }

  return v13;
}

- (id)dq_writeSinf:(id)a3 downloadID:(id)a4 downloadKind:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BLPurchaseManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v11);

  LODWORD(v11) = [v10 isEqualToString:BLDownloadKindPDF];
  if (v11)
  {
    id v12 = BLBookInstallLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Purchase-Mgr]: Skip writing sinf.xml for PDF download.", buf, 0xCu);
    }
    id v13 = 0;
  }
  else
  {
    id v17 = 0;
    id v14 = +[BLSinfHelper writeSinfForDownloadID:v9 epubRightsData:v8 error:&v17];
    id v12 = v17;
    if (!v14)
    {
      uint64_t v15 = BLBookInstallLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: Failed to write sinf.xml for download.  Error: %@", buf, 0x16u);
      }
    }
    id v13 = [v14 path];
  }

  return v13;
}

- (id)dq_writeArtworkWithURL:(id)a3 downloadID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BLPurchaseManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v13 = 0;
  id v9 = +[BLArtworkHelper writeArtworkDownloadID:v6 artworkURL:v7 error:&v13];

  id v10 = v13;
  if (![v9 length])
  {
    id v11 = BLBookInstallLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Purchase-Mgr]: Failed to write iTunesArtwork for download.  Error:  %@", buf, 0x16u);
    }
  }

  return v9;
}

- (void)p_downloadIDForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 buyParameters];
  id v9 = [v6 storeIdentifier];
  uint64_t v10 = (uint64_t)[v9 longLongValue];

  if (v10 < 1)
  {
    if (![v8 length]) {
      goto LABEL_7;
    }
    uint64_t v11 = +[BLUtilities storeIDFromBuyParameters:v8];
  }
  else
  {
    uint64_t v11 = [v6 storeIdentifier];
  }
  id v12 = (void *)v11;
  if (v11)
  {
    id v13 = +[NSPredicate predicateWithFormat:@"%K = %@", @"storeIdentifier", v11];
    goto LABEL_10;
  }
LABEL_7:
  if ([v8 length])
  {
    id v13 = +[NSPredicate predicateWithFormat:@"%K CONTAINS %@", @"buyParameters", v8];
    id v12 = 0;
  }
  else
  {
    id v12 = 0;
    id v13 = 0;
  }
LABEL_10:
  if ([v6 isRestore])
  {
    id v14 = objc_retainBlock(v7);
    id v15 = v14;
    if (v14) {
      (*((void (**)(id, void, void, void, void))v14 + 2))(v14, 0, 0, 0, 0);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v13)
  {
    id v15 = objc_retainBlock(v7);
    if (v15)
    {
      id v17 = sub_10004B6AC(0, 0, @"We have neither a storeID nor purchase parameters for this request");
      (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v17);
    }
    goto LABEL_17;
  }
  __int16 v16 = [(BLPurchaseManager *)self databaseManager];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000615E8;
  v18[3] = &unk_1001A2E10;
  objc_copyWeak(&v20, &location);
  id v19 = v7;
  [v16 fetchModifiableDownloadsMatchingPredicate:v13 results:v18 completion:0];

  objc_destroyWeak(&v20);
LABEL_18:

  objc_destroyWeak(&location);
}

- (void)p_downloadIDForPermlink:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    objc_initWeak(&location, self);
    id v8 = +[NSPredicate predicateWithFormat:@"%K = %@", @"permlink", v6];
    id v9 = [(BLPurchaseManager *)self databaseManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100061BFC;
    v12[3] = &unk_1001A2E10;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    [v9 fetchDownloadListWithPredicate:v8 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = (void (**)(id, void, void *))objc_retainBlock(v7);
    if (v10)
    {
      uint64_t v11 = sub_10004B6AC(13, 0, @"Missing buy parameters.");
      v10[2](v10, 0, v11);
    }
  }
}

- (id)_accountIdentifierFromDownloadMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 downloaderAccountIdentifier];
  if (!v4)
  {
    id v4 = objc_msgSend(v3, "valueForFirstAvailableKey:", BLSSDownloadPropertyStoreAccountIdentifier, 0);
    if (!v4)
    {
      id v5 = +[BUAccountsProvider sharedProvider];
      id v6 = [v5 activeStoreAccount];
      id v4 = objc_msgSend(v6, "ams_DSID");
    }
  }

  return v4;
}

- (BLPurchaseManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLPurchaseManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)restoreAuthenticationQueue
{
  return self->_restoreAuthenticationQueue;
}

- (void)setRestoreAuthenticationQueue:(id)a3
{
}

- (BLDatabaseManager)databaseManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);

  return (BLDatabaseManager *)WeakRetained;
}

- (void)setDatabaseManager:(id)a3
{
}

- (BLDownloadPolicyManager)downloadPolicyManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadPolicyManager);

  return (BLDownloadPolicyManager *)WeakRetained;
}

- (void)setDownloadPolicyManager:(id)a3
{
}

- (_BLOngoingPurchaseRequests)ongoingPurchaseRequests
{
  return self->_ongoingPurchaseRequests;
}

- (void)setOngoingPurchaseRequests:(id)a3
{
}

- (AMSPurchaseQueue)purchaseQueue
{
  return self->_purchaseQueue;
}

- (void)setPurchaseQueue:(id)a3
{
}

- (AMSPurchaseQueueConfiguration)purchaseQueueConfiguration
{
  return self->_purchaseQueueConfiguration;
}

- (void)setPurchaseQueueConfiguration:(id)a3
{
}

- (BLPurchaseUIHelper)purchaseUIHelper
{
  return self->_purchaseUIHelper;
}

- (void)setPurchaseUIHelper:(id)a3
{
}

- (BLOperationQueue)storeRequestOperationQueue
{
  return self->_storeRequestOperationQueue;
}

- (void)setStoreRequestOperationQueue:(id)a3
{
}

- (BLOSTransactionCoordinating)transactionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionCoordinator);

  return (BLOSTransactionCoordinating *)WeakRetained;
}

- (void)setTransactionCoordinator:(id)a3
{
}

- (BLProgressSender)progressSender
{
  return self->_progressSender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSender, 0);
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_storeStrong((id *)&self->_storeRequestOperationQueue, 0);
  objc_storeStrong((id *)&self->_purchaseUIHelper, 0);
  objc_storeStrong((id *)&self->_purchaseQueueConfiguration, 0);
  objc_storeStrong((id *)&self->_purchaseQueue, 0);
  objc_storeStrong((id *)&self->_ongoingPurchaseRequests, 0);
  objc_destroyWeak((id *)&self->_downloadPolicyManager);
  objc_destroyWeak((id *)&self->_databaseManager);
  objc_storeStrong((id *)&self->_restoreAuthenticationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
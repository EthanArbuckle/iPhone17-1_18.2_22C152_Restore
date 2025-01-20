@interface BLService
- (BAMetadataStoreManager)metadataStoreManager;
- (BLBookInstallManager)installManager;
- (BLDatabaseManager)databaseManager;
- (BLDownloadManager)downloadManager;
- (BLDownloadPolicyManager)downloadPolicyManager;
- (BLProgressSender)progressSender;
- (BLPurchaseManager)purchaseManager;
- (BLRestoreManager)restoreManager;
- (BLService)init;
- (BOOL)aliveForOperationQueues;
- (NSMutableDictionary)transactionsMap;
- (NSMutableSet)keepAliveOperationQueues;
- (void)_cancelAllActiveDownloads;
- (void)_deleteMetadataStoreWithCompletion:(id)a3;
- (void)_operationCountChanged:(id)a3;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)addKeepAliveOperationQueue:(id)a3;
- (void)cancelAllActiveDownloadsWithReply:(id)a3;
- (void)cancelDownloadWithID:(id)a3 withReply:(id)a4;
- (void)cleanupOrphanedScratchDirectoriesWithCompletion:(id)a3;
- (void)dealloc;
- (void)didFinishTransactionWithIdenfifier:(id)a3;
- (void)downloadWithPermlink:(id)a3 title:(id)a4 reply:(id)a5;
- (void)dq_reloadOperationKeepAliveTransaction;
- (void)fetchDownloadFromDownloadID:(id)a3 withReply:(id)a4;
- (void)fetchDownloadListWithReply:(id)a3;
- (void)getCrashSimulationOverrideValuesWithReply:(id)a3;
- (void)getValueSimulateDeviceOutOfSpaceWithReply:(id)a3;
- (void)migrationInfoWithStoreID:(int64_t)a3 withReply:(id)a4;
- (void)migrationInfosWithStates:(id)a3 withReply:(id)a4;
- (void)migrationInfosWithStoreIDs:(id)a3 withReply:(id)a4;
- (void)monitorProgressWithReply:(id)a3;
- (void)pauseDownloadWithID:(id)a3 withReply:(id)a4;
- (void)performPreListenerStartupWithCompletion:(id)a3;
- (void)prepareForRemoveAppWithReply:(id)a3;
- (void)processAutomaticDownloadsWithReply:(id)a3;
- (void)purchaseManager:(id)a3 requestDownloadWithParameters:(id)a4 completion:(id)a5;
- (void)purchaseManager:(id)a3 restartDownloadWithID:(id)a4 withCompletion:(id)a5;
- (void)purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5;
- (void)racGUIDForStoreID:(int64_t)a3 withReply:(id)a4;
- (void)reloadFromServerWithReply:(id)a3;
- (void)removeAllMigrationInfosExcludingStates:(id)a3 withReply:(id)a4;
- (void)removeKeepAliveOperationQueue:(id)a3;
- (void)removeMigrationInfoForStoreID:(int64_t)a3 withReply:(id)a4;
- (void)removeRacGUIDForStoreID:(int64_t)a3 withReply:(id)a4;
- (void)requestDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 reply:(id)a5;
- (void)requestDownloadWithParameters:(id)a3 reply:(id)a4;
- (void)requestDownloadsWithManifestRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5;
- (void)requestDownloadsWithMetadata:(id)a3 areRestore:(BOOL)a4 reply:(id)a5;
- (void)requestDownloadsWithRestoreContentRequestItems:(id)a3 reply:(id)a4;
- (void)resetAllCrashSimulationOverridesWithReply:(id)a3;
- (void)restartDownloadWithID:(id)a3 withReply:(id)a4;
- (void)resumeDownloadWithID:(id)a3 withReply:(id)a4;
- (void)setAliveForOperationQueues:(BOOL)a3;
- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiHostProxy:(id)a4 reply:(id)a5;
- (void)setDatabaseManager:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setDownloadPolicyManager:(id)a3;
- (void)setInstallManager:(id)a3;
- (void)setKeepAliveOperationQueues:(id)a3;
- (void)setMetadataStoreManager:(id)a3;
- (void)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 withReply:(id)a5;
- (void)setPurchaseManager:(id)a3;
- (void)setRacGUID:(id)a3 forStoreID:(int64_t)a4 withReply:(id)a5;
- (void)setRestoreManager:(id)a3;
- (void)setTransactionsMap:(id)a3;
- (void)setValueSimulateCrashAtInstallDuringDecrypt:(BOOL)a3 withReply:(id)a4;
- (void)setValueSimulateCrashAtInstallDuringFinish:(BOOL)a3 withReply:(id)a4;
- (void)setValueSimulateCrashAtInstallDuringUnzip:(BOOL)a3 withReply:(id)a4;
- (void)setValueSimulateCrashAtInstallStart:(BOOL)a3 withReply:(id)a4;
- (void)setValueSimulateDeviceOutOfSpace:(BOOL)a3 withReply:(id)a4;
- (void)startPendingOperations;
- (void)willStartTransactionWithIdentifier:(id)a3;
@end

@implementation BLService

- (void)fetchDownloadListWithReply:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service]: fetchDownloadListWithReply", v8, 2u);
  }

  v6 = [(BLService *)self downloadManager];

  if (v6)
  {
    v7 = [(BLService *)self downloadManager];
    [v7 fetchDownloadListWithCompletion:v4];
  }
  else
  {
    v7 = sub_10004B6AC(34, @"nil download manager", @"bookassetd is missing a download manager");
    v4[2](v4, 0, v7);
  }
}

- (BLDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)monitorProgressWithReply:(id)a3
{
  id v4 = a3;
  v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service]: monitorProgressWithReply:]", buf, 2u);
  }

  v6 = [(BLService *)self progressSender];

  if (v6)
  {
    v7 = +[NSXPCConnection currentConnection];
    v8 = +[BLServiceInterface progressInterface];
    [v7 setRemoteObjectInterface:v8];
    v9 = [v7 remoteObjectProxy];
    *(void *)buf = 0;
    v22 = buf;
    uint64_t v23 = 0x3042000000;
    v24 = sub_100005B3C;
    v25 = sub_100013570;
    id v26 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100013578;
    v20[3] = &unk_1001A15F8;
    v20[4] = self;
    v20[5] = buf;
    [v9 synchronousRemoteObjectProxyWithErrorHandler:v20];
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100013674;
    v17 = &unk_1001A11A8;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v10;
    v19 = self;
    [v7 setInvalidationHandler:&v14];
    objc_storeWeak((id *)v22 + 5, v10);
    v11 = [(BLService *)self progressSender];
    [v11 registerProgressReceiver:v10];

    id v12 = objc_retainBlock(v4);
    v13 = v12;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v26);

    goto LABEL_9;
  }
  v7 = (void (**)(void, void))objc_retainBlock(v4);
  if (v7)
  {
    v8 = sub_10004B6AC(34, @"nil progressSender", @"bookassetd is missing a progressSender");
    ((void (**)(void, void *))v7)[2](v7, v8);
LABEL_9:
  }
}

- (BLProgressSender)progressSender
{
  return self->_progressSender;
}

- (BLService)init
{
  v36.receiver = self;
  v36.super_class = (Class)BLService;
  v2 = [(BLService *)&v36 init];
  if (!v2) {
    goto LABEL_9;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.bookassetd.BLService", v3);
  dispatchQueue = v2->_dispatchQueue;
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  v2->_transactionsUpdateLock._os_unfair_lock_opaque = 0;
  uint64_t v6 = objc_opt_new();
  transactionsMap = v2->_transactionsMap;
  v2->_transactionsMap = (NSMutableDictionary *)v6;

  v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  keepAliveOperationQueues = v2->_keepAliveOperationQueues;
  v2->_keepAliveOperationQueues = v8;

  id v10 = objc_alloc_init(BLDatabaseManager);
  databaseManager = v2->_databaseManager;
  v2->_databaseManager = v10;

  if (!v2->_databaseManager)
  {
    v32 = BLServiceLog();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)v35 = 0;
    v33 = "[Service]: FATAL ERROR: could not setup the database manager.";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, v35, 2u);
    goto LABEL_23;
  }
  id v12 = [[BLDownloadPolicyManager alloc] initWithDatabaseManager:v2->_databaseManager];
  downloadPolicyManager = v2->_downloadPolicyManager;
  v2->_downloadPolicyManager = v12;

  v14 = [[BLBookInstallManager alloc] initWithDatabaseManager:v2->_databaseManager];
  installManager = v2->_installManager;
  v2->_installManager = v14;

  if (!v2->_installManager)
  {
    v32 = BLServiceLog();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)v35 = 0;
    v33 = "[Service]: FATAL ERROR: could not setup the install manager.";
    goto LABEL_22;
  }
  v16 = objc_alloc_init(BLProgressSender);
  progressSender = v2->_progressSender;
  v2->_progressSender = v16;

  if (!v2->_progressSender)
  {
    v32 = BLServiceLog();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)v35 = 0;
    v33 = "[Service]: FATAL ERROR: could not setup the progress sender.";
    goto LABEL_22;
  }
  id v18 = [[BLDownloadManager alloc] initWithDatabaseManager:v2->_databaseManager downloadPolicyManager:v2->_downloadPolicyManager transactionCoordinator:v2 installManager:v2->_installManager progressSender:v2->_progressSender];
  downloadManager = v2->_downloadManager;
  v2->_downloadManager = v18;

  if (!v2->_downloadManager)
  {
    v32 = BLServiceLog();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)v35 = 0;
    v33 = "[Service]: FATAL ERROR: could not setup the download manager.";
    goto LABEL_22;
  }
  v20 = [[BLPurchaseManager alloc] initWithDatabaseManager:v2->_databaseManager downloadPolicyManager:v2->_downloadPolicyManager transactionCoordinator:v2 progressSender:v2->_progressSender];
  purchaseManager = v2->_purchaseManager;
  v2->_purchaseManager = v20;

  v22 = v2->_purchaseManager;
  if (!v22)
  {
    v32 = BLServiceLog();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)v35 = 0;
    v33 = "[Service]: FATAL ERROR: could not setup the purchase manager.";
    goto LABEL_22;
  }
  [(BLPurchaseManager *)v22 setDelegate:v2];
  uint64_t v23 = [(BLDownloadManager *)v2->_downloadManager installProgressDelegate];
  [(BLBookInstallManager *)v2->_installManager setProgressDelegate:v23];

  uint64_t v24 = +[BLRestoreManager sharedInstance];
  restoreManager = v2->_restoreManager;
  v2->_restoreManager = (BLRestoreManager *)v24;

  id v26 = v2->_restoreManager;
  if (!v26)
  {
    v32 = BLServiceLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v35 = 0;
      v33 = "[Service]: FATAL ERROR: could not setup the restore manager.";
      goto LABEL_22;
    }
LABEL_23:

    v31 = 0;
    goto LABEL_24;
  }
  [(BLRestoreManager *)v26 setupWithDownloadManager:v2->_downloadManager];
  v27 = objc_alloc_init(BAMetadataStoreManager);
  metadataStoreManager = v2->_metadataStoreManager;
  v2->_metadataStoreManager = v27;

  +[BLAssetContainerFactory setMetadataStoreManager:v2->_metadataStoreManager];
  v29 = +[BUAccountsProvider sharedProvider];
  [v29 addObserver:v2 accountTypes:1];

  v30 = +[NSUserDefaults standardUserDefaults];
  [v30 registerDefaults:&off_1001B0258];

LABEL_9:
  v31 = v2;
LABEL_24:

  return v31;
}

- (void)dealloc
{
  v3 = +[BUAccountsProvider sharedProvider];
  [v3 removeObserver:self accountTypes:1];

  dispatch_queue_t v4 = BLServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Service]: Shutting down.", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)BLService;
  [(BLService *)&v5 dealloc];
}

- (void)performPreListenerStartupWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BLService *)self downloadManager];

  if (!v5)
  {
    uint64_t v6 = BLServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[Service]: Could not setup a download manager.", (uint8_t *)buf, 2u);
    }
  }
  v7 = [(BLService *)self installManager];

  if (!v7)
  {
    v8 = BLServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[Service]: Could not setup a install manager.", (uint8_t *)buf, 2u);
    }
  }
  objc_initWeak(buf, self);
  v9 = [(BLService *)self downloadManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001187C;
  v11[3] = &unk_1001A1490;
  objc_copyWeak(&v13, buf);
  id v10 = v4;
  id v12 = v10;
  [v9 purgeStaleDownloadsWithCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (void)startPendingOperations
{
  [(BLService *)self willStartTransactionWithIdentifier:@"com.apple.bookassetd.cleanup.transaction"];
  [(BLService *)self willStartTransactionWithIdentifier:@"com.apple.bookassetd.startup.transaction"];
  v3 = BLServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Service]: Restarting interrupted installs.", buf, 2u);
  }

  id v4 = [(BLService *)self installManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011B90;
  v7[3] = &unk_1001A14B8;
  v7[4] = self;
  [v4 restartInterruptedInstalls:v7];

  objc_super v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service]: Cleaning up orphaned directories.", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011BA0;
  v6[3] = &unk_1001A14B8;
  v6[4] = self;
  [(BLService *)self cleanupOrphanedScratchDirectoriesWithCompletion:v6];
}

- (void)cleanupOrphanedScratchDirectoriesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BLService *)self databaseManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011C5C;
  v7[3] = &unk_1001A1530;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchDownloadListWithCompletion:v7];
}

- (void)fetchDownloadFromDownloadID:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Service]: fetchDownloadFromDownloadID", v11, 2u);
  }

  v9 = [(BLService *)self downloadManager];

  if (v9)
  {
    id v10 = [(BLService *)self downloadManager];
    [v10 fetchDownloadFromDownloadID:v6 withCompletion:v7];
  }
  else
  {
    id v10 = sub_10004B6AC(34, @"nil download manager", @"bookassetd is missing a download manager");
    v7[2](v7, 0, v10);
  }
}

- (void)requestDownloadWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Service]: requestDownloadWithParameters", v11, 2u);
  }

  v9 = [(BLService *)self downloadManager];

  if (v9)
  {
    id v10 = [(BLService *)self downloadManager];
    [v10 requestDownloadWithParameters:v6 completion:v7];
  }
  else
  {
    id v10 = sub_10004B6AC(34, @"nil download manager", @"bookassetd is missing a download manager");
    v7[2](v7, 0, v10);
  }
}

- (void)requestDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, void, void *))a5;
  id v10 = BLServiceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Service]: requestDownloadWithMetadata", v13, 2u);
  }

  v11 = [(BLService *)self purchaseManager];

  if (v11)
  {
    id v12 = [(BLService *)self purchaseManager];
    [v12 requestDownloadWithMetadata:v8 isRestore:v6 completion:v9];
  }
  else
  {
    id v12 = sub_10004B6AC(34, @"nil purchase manager", @"bookassetd is missing a purchase manager");
    v9[2](v9, 0, v12);
  }
}

- (void)requestDownloadsWithMetadata:(id)a3 areRestore:(BOOL)a4 reply:(id)a5
{
  BOOL v21 = a4;
  id v18 = a3;
  id v19 = a5;
  BOOL v6 = BLServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Service]: requestDownloadWithMetadata", buf, 2u);
  }

  v7 = [(BLService *)self purchaseManager];

  if (v7)
  {
    id v8 = dispatch_group_create();
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    queue = dispatch_queue_create("com.apple.bookassetd.BLService", v9);

    id v10 = objc_opt_new();
    *(void *)buf = 0;
    objc_super v36 = buf;
    uint64_t v37 = 0x3032000000;
    v38 = sub_10001261C;
    v39 = sub_10001262C;
    id v40 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v18;
    id v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v32;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v13);
          dispatch_group_enter(v8);
          uint64_t v15 = [(BLService *)self purchaseManager];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100012634;
          v27[3] = &unk_1001A1558;
          id v28 = v10;
          v30 = buf;
          v29 = v8;
          [v15 requestDownloadWithMetadata:v14 isRestore:v21 completion:v27];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v11);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000126B8;
    block[3] = &unk_1001A1580;
    id v24 = v10;
    id v25 = v19;
    id v26 = buf;
    id v16 = v10;
    dispatch_group_notify(v8, queue, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v8 = sub_10004B6AC(34, @"nil purchase manager", @"bookassetd is missing a purchase manager");
    (*((void (**)(id, void, NSObject *))v19 + 2))(v19, 0, v8);
  }
}

- (void)requestDownloadsWithRestoreContentRequestItems:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Service]: requestDownloadsWithRestoreContentRequestDictionary", v11, 2u);
  }

  v9 = [(BLService *)self purchaseManager];

  if (v9)
  {
    id v10 = [(BLService *)self purchaseManager];
    [v10 requestDownloadsWithRestoreContentRequestItems:v6 completion:v7];
  }
  else
  {
    id v10 = sub_10004B6AC(34, @"nil purchase manager", @"bookassetd is missing a purchase manager");
    v7[2](v7, 0, v10);
  }
}

- (void)requestDownloadsWithManifestRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = BLServiceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Service]: requestDownloadsWithManifestRequest", v14, 2u);
  }

  uint64_t v12 = [(BLService *)self purchaseManager];

  if (v12)
  {
    id v13 = [(BLService *)self purchaseManager];
    [v13 requestDownloadsWithManifestRequest:v8 uiHostProxy:v9 completion:v10];
  }
  else
  {
    id v13 = sub_10004B6AC(34, @"nil purchase manager", @"bookassetd is missing a purchase manager");
    v10[2](v10, 0, v13);
  }
}

- (void)pauseDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Service]: pauseDownloadWithID", v11, 2u);
  }

  id v9 = [(BLService *)self downloadManager];

  if (v9)
  {
    id v10 = [(BLService *)self downloadManager];
    [v10 pauseDownloadWithID:v6 withCompletion:v7];
  }
  else
  {
    id v10 = sub_10004B6AC(34, @"nil download manager", @"bookassetd is missing a download manager");
    v7[2](v7, v10);
  }
}

- (void)resumeDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Service]: resumeDownloadWithID", v11, 2u);
  }

  id v9 = [(BLService *)self downloadManager];

  if (v9)
  {
    id v10 = [(BLService *)self downloadManager];
    [v10 resumeDownloadWithID:v6 withCompletion:v7];
  }
  else
  {
    id v10 = sub_10004B6AC(34, @"nil download manager", @"bookassetd is missing a download manager");
    v7[2](v7, v10);
  }
}

- (void)restartDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Service]: restartDownloadWithID", v11, 2u);
  }

  id v9 = [(BLService *)self downloadManager];

  if (v9)
  {
    id v10 = [(BLService *)self downloadManager];
    [v10 restartDownloadWithID:v6 withCompletion:v7];
  }
  else
  {
    id v10 = sub_10004B6AC(34, @"nil download manager", @"bookassetd is missing a download manager");
    v7[2](v7, v10);
  }
}

- (void)cancelDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Service]: cancelDownloadWithID", v11, 2u);
  }

  id v9 = [(BLService *)self downloadManager];

  if (v9)
  {
    id v10 = [(BLService *)self downloadManager];
    [v10 cancelDownloadWithID:v6 withCompletion:v7];
  }
  else
  {
    id v10 = sub_10004B6AC(34, @"nil download manager", @"bookassetd is missing a download manager");
    v7[2](v7, v10);
  }
}

- (void)cancelAllActiveDownloadsWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  objc_super v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service]: cancelAllActiveDownloadsWithReply", v6, 2u);
  }

  [(BLService *)self _cancelAllActiveDownloads];
  v4[2](v4, 0);
}

- (void)purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BLServiceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Service]: purchaseWithRequest:uiHostProxy:reply:", buf, 2u);
  }

  uint64_t v12 = [v8 buyParameters];
  id v13 = [v12 length];

  if (!v13)
  {
    v17 = @"nil purchase parameters";
    id v18 = @"bookassetd cannot effect a purchase without purchase parameters";
LABEL_8:
    id v16 = sub_10004B6AC(34, v17, v18);
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v16);
    goto LABEL_9;
  }
  uint64_t v14 = [(BLService *)self purchaseManager];

  if (!v14)
  {
    v17 = @"nil purchase manager";
    id v18 = @"bookassetd is missing a purchase manager";
    goto LABEL_8;
  }
  uint64_t v15 = [(BLService *)self purchaseManager];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100012F48;
  v19[3] = &unk_1001A15A8;
  id v20 = v10;
  [v15 purchaseWithRequest:v8 uiHostProxy:v9 completion:v19];

  id v16 = v20;
LABEL_9:
}

- (void)downloadWithPermlink:(id)a3 title:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = BLServiceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Service]: downloadWithPermlink", v14, 2u);
  }

  uint64_t v12 = [(BLService *)self purchaseManager];

  if (v12)
  {
    id v13 = [(BLService *)self purchaseManager];
    [v13 downloadWithPermlink:v8 title:v9 completion:v10];
  }
  else
  {
    id v13 = sub_10004B6AC(34, @"nil purchase manager", @"bookassetd is missing a purchase manager");
    v10[2](v10, 0, v13);
  }
}

- (void)processAutomaticDownloadsWithReply:(id)a3
{
  id v7 = a3;
  id v4 = [(BLService *)self purchaseManager];

  if (v4)
  {
    objc_super v5 = [(BLService *)self purchaseManager];
    [v5 processAutomaticDownloadsWithCompletion:v7];
  }
  else
  {
    objc_super v5 = (void (**)(void, void, void))objc_retainBlock(v7);
    if (v5)
    {
      id v6 = sub_10004B6AC(34, @"nil purchase manager", @"bookassetd is missing a purchase manager");
      ((void (**)(void, void *, void *))v5)[2](v5, &__NSArray0__struct, v6);
    }
  }
}

- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = BLServiceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Service]: setAutomaticDownloadEnabled: %d", buf, 8u);
  }

  id v11 = [(BLService *)self downloadManager];

  if (v11)
  {
    uint64_t v12 = [(BLService *)self downloadManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001338C;
    v15[3] = &unk_1001A15D0;
    id v16 = (void (**)(id, void *))v9;
    [v12 setAutomaticDownloadEnabled:v6 uiHostProxy:v8 withCompletion:v15];

    id v13 = v16;
  }
  else
  {
    id v13 = (void (**)(id, void *))objc_retainBlock(v9);
    if (v13)
    {
      uint64_t v14 = sub_10004B6AC(34, @"nil download manager", @"bookassetd is missing a download manager");
      v13[2](v13, v14);
    }
  }
}

- (void)reloadFromServerWithReply:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service]: reloadFromServerWithReply", buf, 2u);
  }

  if (BUIsGDPRAcknowledgementNeededForBooks())
  {
    BOOL v6 = BLServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "bookassetd cannot download purchases without GDPR", v12, 2u);
    }

    id v7 = (void (**)(void, void))objc_retainBlock(v4);
    if (v7)
    {
      id v8 = @"GDPR not accepted";
      id v9 = @"bookassetd cannot download purchases without GDPR";
LABEL_12:
      id v11 = sub_10004B6AC(34, v8, v9);
      ((void (**)(void, void *))v7)[2](v7, v11);
    }
  }
  else
  {
    id v10 = [(BLService *)self purchaseManager];

    if (v10)
    {
      id v7 = [(BLService *)self purchaseManager];
      [v7 reloadFromServerWithCompletion:v4];
    }
    else
    {
      id v7 = (void (**)(void, void))objc_retainBlock(v4);
      if (v7)
      {
        id v8 = @"nil purchase manager";
        id v9 = @"bookassetd is missing a purchase manager";
        goto LABEL_12;
      }
    }
  }
}

- (void)setRacGUID:(id)a3 forStoreID:(int64_t)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BLService *)self metadataStoreManager];
  id v11 = [v10 metadataStore];

  if (v11)
  {
    uint64_t v12 = [(BLService *)self metadataStoreManager];
    id v13 = [v12 metadataStore];
    id v18 = 0;
    unsigned int v14 = [v13 setRacGUID:v8 forStoreID:a4 error:&v18];
    uint64_t v15 = (void (**)(id, void *))v18;

    id v16 = objc_retainBlock(v9);
    v17 = v16;
    if (v14)
    {
      if (v16) {
        (*((void (**)(id, void))v16 + 2))(v16, 0);
      }
    }
    else if (v16)
    {
      (*((void (**)(id, id))v16 + 2))(v16, v15);
    }
    goto LABEL_9;
  }
  uint64_t v15 = (void (**)(id, void *))objc_retainBlock(v9);
  if (v15)
  {
    v17 = sub_10004B6AC(34, @"No Metadata Store", @"bookassetd does not have a metadata store.");
    v15[2](v15, v17);
LABEL_9:
  }
}

- (void)racGUIDForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v10 = a4;
  BOOL v6 = [(BLService *)self metadataStoreManager];
  id v7 = [v6 metadataStore];

  if (v7)
  {
    id v8 = [(BLService *)self metadataStoreManager];
    id v9 = [v8 metadataStore];
    [v9 racGUIDForStoreID:a3 result:v10];
  }
  else
  {
    id v8 = (void (**)(void, void, void))objc_retainBlock(v10);
    if (!v8) {
      goto LABEL_6;
    }
    id v9 = sub_10004B6AC(34, @"No Metadata Store", @"bookassetd does not have a metadata store.");
    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
  }

LABEL_6:
}

- (void)removeRacGUIDForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = [(BLService *)self metadataStoreManager];
  id v8 = [v7 metadataStore];
  id v13 = 0;
  unsigned int v9 = [v8 removeRacGUIDForStoreID:a3 error:&v13];
  id v10 = v13;

  id v11 = (void (**)(id, void))objc_retainBlock(v6);
  if (v11)
  {
    if (v9) {
      id v12 = 0;
    }
    else {
      id v12 = v10;
    }
    ((void (**)(id, id))v11)[2](v11, v12);
  }
}

- (void)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(BLService *)self metadataStoreManager];
  id v11 = [v10 metadataStore];
  id v16 = 0;
  unsigned int v12 = [v11 setMigrationState:a3 forStoreIDs:v9 error:&v16];

  id v13 = v16;
  unsigned int v14 = (void (**)(id, void))objc_retainBlock(v8);

  if (v14)
  {
    if (v12) {
      id v15 = 0;
    }
    else {
      id v15 = v13;
    }
    ((void (**)(id, id))v14)[2](v14, v15);
  }
}

- (void)migrationInfoWithStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  id v8 = [(BLService *)self metadataStoreManager];
  id v7 = [v8 metadataStore];
  [v7 migrationInfoWithStoreID:a3 completion:v6];
}

- (void)migrationInfosWithStoreIDs:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BLService *)self metadataStoreManager];
  id v8 = [v9 metadataStore];
  [v8 migrationInfosWithStoreIDs:v7 completion:v6];
}

- (void)migrationInfosWithStates:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BLService *)self metadataStoreManager];
  id v8 = [v9 metadataStore];
  [v8 migrationInfosWithStates:v7 completion:v6];
}

- (void)removeMigrationInfoForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = [(BLService *)self metadataStoreManager];
  id v8 = [v7 metadataStore];
  id v13 = 0;
  unsigned int v9 = [v8 removeMigrationInfoForStoreID:a3 error:&v13];
  id v10 = v13;

  id v11 = (void (**)(id, void))objc_retainBlock(v6);
  if (v11)
  {
    if (v9) {
      id v12 = 0;
    }
    else {
      id v12 = v10;
    }
    ((void (**)(id, id))v11)[2](v11, v12);
  }
}

- (void)removeAllMigrationInfosExcludingStates:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BLService *)self metadataStoreManager];
  unsigned int v9 = [v8 metadataStore];
  id v14 = 0;
  unsigned int v10 = [v9 removeAllMigrationInfosExcludingStates:v7 error:&v14];

  id v11 = v14;
  id v12 = (void (**)(id, void))objc_retainBlock(v6);

  if (v12)
  {
    if (v10) {
      id v13 = 0;
    }
    else {
      id v13 = v11;
    }
    ((void (**)(id, id))v12)[2](v12, v13);
  }
}

- (void)prepareForRemoveAppWithReply:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service]: prepareForRemoveAppWithReply", v6, 2u);
  }

  [(BLService *)self _cancelAllActiveDownloads];
  [(BLService *)self _deleteMetadataStoreWithCompletion:v4];
}

- (void)setValueSimulateCrashAtInstallStart:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v4 forKey:@"BKSimulateCrashAtInstallStart"];

  v6[2](v6, 0);
}

- (void)setValueSimulateCrashAtInstallDuringDecrypt:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v4 forKey:@"BKSimulateCrashAtInstallDuringDecrypt"];

  v6[2](v6, 0);
}

- (void)setValueSimulateCrashAtInstallDuringUnzip:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v4 forKey:@"BKSimulateCrashAtInstallDuringUnzip"];

  v6[2](v6, 0);
}

- (void)setValueSimulateCrashAtInstallDuringFinish:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v4 forKey:@"BKSimulateCrashAtInstallDuringFinish"];

  v6[2](v6, 0);
}

- (void)getCrashSimulationOverrideValuesWithReply:(id)a3
{
  id v11 = (void (**)(id, id, id, id, id, void))a3;
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 BOOLForKey:@"BKSimulateCrashAtInstallStart"];

  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 BOOLForKey:@"BKSimulateCrashAtInstallDuringDecrypt"];

  id v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = [v7 BOOLForKey:@"BKSimulateCrashAtInstallDuringUnzip"];

  unsigned int v9 = +[NSUserDefaults standardUserDefaults];
  id v10 = [v9 BOOLForKey:@"BKSimulateCrashAtInstallDuringFinish"];

  v11[2](v11, v4, v6, v8, v10, 0);
}

- (void)resetAllCrashSimulationOverridesWithReply:(id)a3
{
  id v7 = (void (**)(id, void))a3;
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:@"BKSimulateCrashAtInstallStart"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObjectForKey:@"BKSimulateCrashAtInstallDuringDecrypt"];

  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"BKSimulateCrashAtInstallDuringUnzip"];

  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObjectForKey:@"BKSimulateCrashAtInstallDuringFinish"];

  v7[2](v7, 0);
}

- (void)setValueSimulateDeviceOutOfSpace:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void))a4;
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = v5;
  if (v4) {
    [v5 setBool:1 forKey:@"BKSimulateDeviceOutOfSpace"];
  }
  else {
    [v5 removeObjectForKey:@"BKSimulateDeviceOutOfSpace"];
  }

  v7[2](v7, 0);
}

- (void)getValueSimulateDeviceOutOfSpaceWithReply:(id)a3
{
  objc_super v5 = (void (**)(id, id, void))a3;
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 BOOLForKey:@"BKSimulateDeviceOutOfSpace"];

  v5[2](v5, v4, 0);
}

- (void)willStartTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Service]: Received a transaction-start for identifier: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  os_unfair_lock_lock(&self->_transactionsUpdateLock);
  id v6 = [(NSMutableDictionary *)self->_transactionsMap objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v7 = [BLOSTransaction alloc];
    id v8 = v4;
    id v6 = -[BLOSTransaction initWithTransactionName:](v7, "initWithTransactionName:", [v8 cStringUsingEncoding:4]);
    [(NSMutableDictionary *)self->_transactionsMap setObject:v6 forKeyedSubscript:v8];
  }
  os_unfair_lock_unlock(&self->_transactionsUpdateLock);
}

- (void)didFinishTransactionWithIdenfifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Service]: Received a transaction-end for identifier: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  os_unfair_lock_lock(&self->_transactionsUpdateLock);
  [(NSMutableDictionary *)self->_transactionsMap setObject:0 forKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_transactionsUpdateLock);
}

- (void)addKeepAliveOperationQueue:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014698;
  v7[3] = &unk_1001A11A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)removeKeepAliveOperationQueue:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000147F0;
  v7[3] = &unk_1001A11A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)dq_reloadOperationKeepAliveTransaction
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v3 = [(BLService *)self keepAliveOperationQueues];
  uint64_t v4 = (uint64_t)[v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        if ((uint64_t)[*(id *)(*((void *)&v7 + 1) + 8 * i) operationCount] > 0)
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = (uint64_t)[v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v4 != [(BLService *)self aliveForOperationQueues])
  {
    [(BLService *)self setAliveForOperationQueues:v4];
    if ([(BLService *)self aliveForOperationQueues]) {
      [(BLService *)self willStartTransactionWithIdentifier:@"com.apple.bookassetd.keepQueuesAlive"];
    }
    else {
      [(BLService *)self didFinishTransactionWithIdenfifier:@"com.apple.bookassetd.keepQueuesAlive"];
    }
  }
}

- (void)_operationCountChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014A6C;
  block[3] = &unk_1001A0FE8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)purchaseManager:(id)a3 requestDownloadWithParameters:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(BLService *)self downloadManager];
  [v9 requestDownloadWithParameters:v8 completion:v7];
}

- (void)purchaseManager:(id)a3 restartDownloadWithID:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(BLService *)self downloadManager];
  [v9 restartDownloadWithID:v8 withCompletion:v7];
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  if (a4 - 101 <= 1)
  {
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    id v7 = BLServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Service]: Account Changed.  Cancelling active downloads", v8, 2u);
    }

    [(BLService *)self _cancelAllActiveDownloads];
  }
}

- (void)_cancelAllActiveDownloads
{
  v3 = [(BLService *)self downloadManager];

  if (v3)
  {
    [(BLService *)self willStartTransactionWithIdentifier:@"cancellingAllTransactions"];
    uint64_t v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    uint64_t v5 = [(BLService *)self downloadManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100014CD8;
    v7[3] = &unk_1001A1620;
    void v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    [v5 fetchDownloadListWithCompletion:v7];

    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_deleteMetadataStoreWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BLService *)self metadataStoreManager];

  if (v5)
  {
    [(BLService *)self willStartTransactionWithIdentifier:@"deleteMetadataStoreTransactions"];
    id v6 = [(BLService *)self metadataStoreManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100015060;
    v11[3] = &unk_1001A1648;
    void v11[4] = self;
    id v12 = v4;
    [v6 deleteStoreWithCompletion:v11];
  }
  else
  {
    id v7 = sub_10004B6AC(0, @"Unexpected nil metadataStoreManager", 0);
    id v8 = BLServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[Service]: Unexpected error:  %@", buf, 0xCu);
    }

    id v9 = objc_retainBlock(v4);
    uint64_t v10 = v9;
    if (v9) {
      (*((void (**)(id, void *))v9 + 2))(v9, v7);
    }
  }
}

- (void)setDownloadManager:(id)a3
{
}

- (BLBookInstallManager)installManager
{
  return self->_installManager;
}

- (void)setInstallManager:(id)a3
{
}

- (BLDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (BLPurchaseManager)purchaseManager
{
  return self->_purchaseManager;
}

- (void)setPurchaseManager:(id)a3
{
}

- (BLDownloadPolicyManager)downloadPolicyManager
{
  return self->_downloadPolicyManager;
}

- (void)setDownloadPolicyManager:(id)a3
{
}

- (BLRestoreManager)restoreManager
{
  return self->_restoreManager;
}

- (void)setRestoreManager:(id)a3
{
}

- (BAMetadataStoreManager)metadataStoreManager
{
  return self->_metadataStoreManager;
}

- (void)setMetadataStoreManager:(id)a3
{
}

- (NSMutableDictionary)transactionsMap
{
  return self->_transactionsMap;
}

- (void)setTransactionsMap:(id)a3
{
}

- (BOOL)aliveForOperationQueues
{
  return self->_aliveForOperationQueues;
}

- (void)setAliveForOperationQueues:(BOOL)a3
{
  self->_aliveForOperationQueues = a3;
}

- (NSMutableSet)keepAliveOperationQueues
{
  return self->_keepAliveOperationQueues;
}

- (void)setKeepAliveOperationQueues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAliveOperationQueues, 0);
  objc_storeStrong((id *)&self->_transactionsMap, 0);
  objc_storeStrong((id *)&self->_metadataStoreManager, 0);
  objc_storeStrong((id *)&self->_restoreManager, 0);
  objc_storeStrong((id *)&self->_progressSender, 0);
  objc_storeStrong((id *)&self->_downloadPolicyManager, 0);
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_installManager, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
@interface BLDownloadManager
+ (id)downloadDirectoryForDownloadID:(id)a3;
+ (id)downloadsDirectory;
+ (void)cleanupDownloadScratchDirectoryForDownloadID:(id)a3;
- (BLDatabaseManager)databaseManager;
- (BLDownloadManager)initWithDatabaseManager:(id)a3 downloadPolicyManager:(id)a4 transactionCoordinator:(id)a5 installManager:(id)a6 progressSender:(id)a7;
- (BLDownloadPipeline)downloadPipeline;
- (BLDownloadPolicyManager)downloadPolicyManager;
- (BLOSTransactionCoordinating)transactionCoordinator;
- (OS_dispatch_queue)dispatchQueue;
- (void)_pauseDownloadsWithIDs:(id)a3 withCompletion:(id)a4;
- (void)_resumeDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)_resumeDownloadsWithIDs:(id)a3 prioritizeDownloadID:(id)a4 withCompletion:(id)a5;
- (void)cancelDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)checkDownloadsWithCompletion:(id)a3;
- (void)downloadCompletedWithDownloadID:(id)a3;
- (void)dq_purgeStaleDownloadsWithCompletion:(id)a3;
- (void)dq_startNextDownloadsFromList:(id)a3;
- (void)fetchDownloadFromDownloadID:(id)a3 withCompletion:(id)a4;
- (void)fetchDownloadListWithCompletion:(id)a3;
- (void)pauseDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)purgeStaleDownloadsWithCompletion:(id)a3;
- (void)requestDownloadWithParameters:(id)a3 completion:(id)a4;
- (void)restartDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)resumeDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiHostProxy:(id)a4 withCompletion:(id)a5;
- (void)setDatabaseManager:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDownloadPipeline:(id)a3;
- (void)setDownloadPolicyManager:(id)a3;
- (void)setTransactionCoordinator:(id)a3;
- (void)updatePoliciesForRestoreDownloadsWithCompletion:(id)a3;
@end

@implementation BLDownloadManager

- (void)fetchDownloadListWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Download-Mgr]: Request to list downloads.", buf, 2u);
  }

  v6 = [(BLDownloadManager *)self dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004DCC;
  v8[3] = &unk_1001A1430;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BLDatabaseManager)databaseManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);

  return (BLDatabaseManager *)WeakRetained;
}

- (BLDownloadManager)initWithDatabaseManager:(id)a3 downloadPolicyManager:(id)a4 transactionCoordinator:(id)a5 installManager:(id)a6 progressSender:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)BLDownloadManager;
  v17 = [(BLDownloadManager *)&v26 init];
  if (v17)
  {
    v18 = BLServiceDownloadManagerLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[Download-Mgr]: Initializing download manager.", v25, 2u);
    }

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.ibooks.BLService.DownloadManager", v19);
    dispatchQueue = v17->_dispatchQueue;
    v17->_dispatchQueue = (OS_dispatch_queue *)v20;

    objc_storeWeak((id *)&v17->_databaseManager, v12);
    objc_storeWeak((id *)&v17->_downloadPolicyManager, v13);
    objc_storeWeak((id *)&v17->_transactionCoordinator, v14);
    v22 = [[BLDownloadPipeline alloc] initWithDatabaseManager:v12 downloadPolicyManager:v13 transactionCoordinator:v14 installManager:v15 progressSender:v16];
    downloadPipeline = v17->_downloadPipeline;
    v17->_downloadPipeline = v22;
  }
  return v17;
}

+ (id)downloadsDirectory
{
  if (qword_1001C81D8 != -1) {
    dispatch_once(&qword_1001C81D8, &stru_1001A2768);
  }
  v2 = (void *)qword_1001C81D0;

  return v2;
}

+ (id)downloadDirectoryForDownloadID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [a1 downloadsDirectory];
    v6 = [v5 URLByAppendingPathComponent:v4];
  }
  else
  {
    id v7 = BLServiceDownloadManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[Download-Mgr]: downloadDirectoryForDownloadID: received a nil downloadID.", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (void)cleanupDownloadScratchDirectoryForDownloadID:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    v3 = +[BLDownloadManager downloadDirectoryForDownloadID:v5];
    id v4 = +[NSFileManager defaultManager];
    [v4 removeItemAtURL:v3 error:0];
  }
}

- (void)checkDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[Download-Mgr]: Checking for downloads.", v7, 2u);
  }

  v6 = [(BLDownloadManager *)self downloadPipeline];
  [v6 startupDownloadsWithCompletion:v4];
}

- (void)purgeStaleDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Download-Mgr]: Purging stale downloads from the database.", buf, 2u);
  }

  v6 = [(BLDownloadManager *)self dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005102C;
  v8[3] = &unk_1001A1430;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)fetchDownloadFromDownloadID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "(dID=%{public}@) [Download-Mgr]: Info requested for download", buf, 0xCu);
  }

  id v9 = [(BLDownloadManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005118C;
  block[3] = &unk_1001A1B00;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)requestDownloadWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Download-Mgr]: New download requested", buf, 2u);
  }

  id v9 = [(BLDownloadManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000514A0;
  block[3] = &unk_1001A1B00;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)pauseDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v15 = v6;
    v8 = +[NSArray arrayWithObjects:&v15 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000518B8;
    v12[3] = &unk_1001A2830;
    id v14 = v7;
    id v13 = v6;
    [(BLDownloadManager *)self _pauseDownloadsWithIDs:v8 withCompletion:v12];
  }
  else
  {
    id v9 = sub_10004B6AC(37, @"Missing downloadID", @"Missing downloadID");
    id v10 = objc_retainBlock(v7);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v9);
    }
  }
}

- (void)_pauseDownloadsWithIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Download-Mgr]: Pausing downloads: %@", buf, 0xCu);
  }

  id v9 = [(BLDownloadManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051AC0;
  block[3] = &unk_1001A1B00;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)cancelDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download-Mgr]: Canceling download", buf, 0xCu);
  }

  id v9 = [(BLDownloadManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052044;
  block[3] = &unk_1001A1B00;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_resumeDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v15 = v6;
    v8 = +[NSArray arrayWithObjects:&v15 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005250C;
    v12[3] = &unk_1001A1B28;
    id v14 = v7;
    id v13 = v6;
    [(BLDownloadManager *)self _resumeDownloadsWithIDs:v8 prioritizeDownloadID:v13 withCompletion:v12];
  }
  else
  {
    id v9 = sub_10004B6AC(37, @"Missing downloadID", @"Missing downloadID");
    id v10 = objc_retainBlock(v7);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v9);
    }
  }
}

- (void)_resumeDownloadsWithIDs:(id)a3 prioritizeDownloadID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Download-Mgr]: Attempting to resume downloads: %@", buf, 0xCu);
  }

  id v12 = [(BLDownloadManager *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005273C;
  v16[3] = &unk_1001A2920;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)resumeDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download-Mgr]: Determining cellularResult before resuming download", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100052EC4;
  v11[3] = &unk_1001A2948;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BLDownloadManager *)self fetchDownloadFromDownloadID:v10 withCompletion:v11];
}

- (void)restartDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download-Mgr]: Restarting download", buf, 0xCu);
  }

  if (v6)
  {
    id v9 = +[NSOrderedSet orderedSetWithObjects:](NSOrderedSet, "orderedSetWithObjects:", v6, 0);
    id v10 = [(BLDownloadManager *)self downloadPipeline];
    [v10 restartDownloadsWithIdentifiers:v9 completion:v7];
  }
  else
  {
    id v9 = sub_10004B6AC(37, @"Missing downloadID", @"Missing downloadID");
    id v11 = objc_retainBlock(v7);
    id v10 = v11;
    if (v11) {
      (*((void (**)(id, void *))v11 + 2))(v11, v9);
    }
  }
}

- (void)updatePoliciesForRestoreDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSPredicate predicateWithFormat:@"(%K = %@) && (%K = %@ || %K = %@)", @"isRestore", &__kCFBooleanTrue, @"state", &off_1001AF898, @"state", &off_1001AF8B0];
  id v6 = [(BLDownloadManager *)self databaseManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005343C;
  v8[3] = &unk_1001A19C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchDownloadListWithPredicate:v5 completion:v8];
}

- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiHostProxy:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)NSSet) initWithArray:&off_1001B0280];
  id v11 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Download-Mgr]: Attempting to set automatic download enabled to %d", buf, 8u);
  }

  id v12 = +[BUAccountsProvider sharedProvider];
  id v13 = [v12 activeStoreAccount];

  uint64_t v14 = [v13 objectForKeyedSubscript:@"automaticDownloadKinds"];
  id v15 = (void *)v14;
  id v16 = &__NSArray0__struct;
  if (v14) {
    id v16 = (void *)v14;
  }
  id v17 = v16;

  id v18 = BLServiceDownloadManagerLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "local enabledMediaKinds before attempting to save: %@", buf, 0xCu);
  }

  id v19 = [objc_alloc((Class)NSMutableSet) initWithArray:v17];
  dispatch_queue_t v20 = v19;
  if (v6) {
    [v19 unionSet:v10];
  }
  else {
    [v19 minusSet:v10];
  }
  id v21 = [[BLSetAutomaticDownloadKindsOperation alloc] initWithEnabledMediaKinds:v20 account:v13];
  [(BLSetAutomaticDownloadKindsOperation *)v21 setUiHostProxy:v9];

  v22 = [(BLDownloadManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053980;
  block[3] = &unk_1001A2970;
  BOOL v28 = v6;
  objc_super v26 = v21;
  id v27 = v8;
  id v23 = v8;
  v24 = v21;
  dispatch_async(v22, block);
}

- (void)downloadCompletedWithDownloadID:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadManager *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100053B90;
  v7[3] = &unk_1001A11A8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)dq_purgeStaleDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BLDownloadManager *)self databaseManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053D10;
  v8[3] = &unk_1001A15D0;
  id v9 = v4;
  id v7 = v4;
  [v6 purgeAllStaleDownloadsWithCompletion:v8];
}

- (void)dq_startNextDownloadsFromList:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100053EF0;
  v7[3] = &unk_1001A2250;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(BLDownloadManager *)self dq_purgeStaleDownloadsWithCompletion:v7];
}

- (void)setDispatchQueue:(id)a3
{
}

- (BLDownloadPipeline)downloadPipeline
{
  return self->_downloadPipeline;
}

- (void)setDownloadPipeline:(id)a3
{
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

- (BLOSTransactionCoordinating)transactionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionCoordinator);

  return (BLOSTransactionCoordinating *)WeakRetained;
}

- (void)setTransactionCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_destroyWeak((id *)&self->_downloadPolicyManager);
  objc_destroyWeak((id *)&self->_databaseManager);
  objc_storeStrong((id *)&self->_downloadPipeline, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
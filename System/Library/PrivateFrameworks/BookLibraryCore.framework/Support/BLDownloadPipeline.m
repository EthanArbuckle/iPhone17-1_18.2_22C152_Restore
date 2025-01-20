@interface BLDownloadPipeline
- (BLBookInstallManager)installManager;
- (BLDatabaseManager)databaseManager;
- (BLDownloadPipeline)initWithDatabaseManager:(id)a3 downloadPolicyManager:(id)a4 transactionCoordinator:(id)a5 installManager:(id)a6 progressSender:(id)a7;
- (BLDownloadPipelineQueue)downloadPipelineQueue;
- (BLDownloadPolicyManager)downloadPolicyManager;
- (BLOSTransactionCoordinating)transactionCoordinator;
- (BLOperationQueueProtocol)backgroundOperationQueue;
- (BLOperationQueueProtocol)cellularDownloadOperationQueue;
- (BLOperationQueueProtocol)discretionaryDownloadOperationQueue;
- (BLOperationQueueProtocol)nonDiscretionaryDownloadOperationQueue;
- (BLOperationQueueProtocol)preparationOperationQueue;
- (BLOperationQueueProtocol)processingOperationQueue;
- (BLOperationQueueProtocol)sampleDownloadOperationQueue;
- (BLProgressSender)progressSender;
- (BOOL)_allowsCellularDownload:(id)a3;
- (BOOL)dq_setSessionTaskPriorityToHighForDownloadID:(id)a3;
- (NSMapTable)taskStates;
- (NSMutableDictionary)urlSessions;
- (NSMutableOrderedSet)preparationDownloadIDs;
- (NSMutableSet)activeTaskStates;
- (NSMutableSet)dirtyTaskStates;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)progressTimer;
- (OS_dispatch_source)reconnectTimer;
- (id)dq_getTaskStateFromDownloadID:(id)a3;
- (id)newOperationQueue;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_addDownloads:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)doq_performDownloadOperation:(id)a3 completion:(id)a4;
- (void)dq_cancelProgressTimer;
- (void)dq_clearIsLocalServerCacheForDownloadID:(id)a3 completion:(id)a4;
- (void)dq_commitProgress;
- (void)dq_logDownloadEvent:(id)a3 forTaskWithState:(id)a4;
- (void)dq_notifyServerOfDownloadCancelledWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 cancelDownloadURL:(id)a7 completion:(id)a8;
- (void)dq_notifyServerOfDownloadCancelledWithTaskState:(id)a3;
- (void)dq_prepareDownloadsForDownloads:(id)a3 filtersExistingTasks:(BOOL)a4 completion:(id)a5;
- (void)dq_processCompletedDownloadWithTaskState:(id)a3 postProgress:(BOOL)a4;
- (void)dq_processDownloadFailureWithTaskState:(id)a3 task:(id)a4 cancelReason:(int64_t)a5;
- (void)dq_pumpDownloadsWithCompletion:(id)a3;
- (void)dq_removeDownloadFromPipelineQueue:(id)a3;
- (void)dq_saveState:(int64_t)a3 forDownloadID:(id)a4 completion:(id)a5;
- (void)dq_scheduleReconnect;
- (void)dq_setDownloadState:(int64_t)a3 forDownloadIdentifier:(id)a4 completion:(id)a5;
- (void)dq_startProgressTimer;
- (void)installManager:(id)a3 didFinishInstallForOperation:(id)a4;
- (void)installManager:(id)a3 didStartInstallWithOperation:(id)a4 forDownloadID:(id)a5;
- (void)installManager:(id)a3 updatedProgress:(id)a4 forInstallOperation:(id)a5;
- (void)installManager:(id)a3 willRestartInstallForDownload:(id)a4;
- (void)notifyServerForFailedDownloadsWithCompletion:(id)a3;
- (void)prioritizeDownloadWithIdentifier:(id)a3 completion:(id)a4;
- (void)pumpDownloadsWithCompletion:(id)a3;
- (void)reconnectWithURLSessionTasks;
- (void)restartDownloadsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)retryDownloadWithIdentifier:(id)a3 completion:(id)a4;
- (void)setActiveTaskStates:(id)a3;
- (void)setBackgroundOperationQueue:(id)a3;
- (void)setCellularDownloadOperationQueue:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDirtyTaskStates:(id)a3;
- (void)setDiscretionaryDownloadOperationQueue:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDownloadPolicyManager:(id)a3;
- (void)setInstallManager:(id)a3;
- (void)setNonDiscretionaryDownloadOperationQueue:(id)a3;
- (void)setPreparationDownloadIDs:(id)a3;
- (void)setPreparationOperationQueue:(id)a3;
- (void)setProcessingOperationQueue:(id)a3;
- (void)setProgressTimer:(id)a3;
- (void)setReconnectTimer:(id)a3;
- (void)setSampleDownloadOperationQueue:(id)a3;
- (void)setTaskStates:(id)a3;
- (void)setTransactionCoordinator:(id)a3;
- (void)setUrlSessions:(id)a3;
- (void)startupDownloadsWithCompletion:(id)a3;
- (void)stopDownloadsWithIdentifiers:(id)a3 reason:(int64_t)a4 completion:(id)a5;
@end

@implementation BLDownloadPipeline

- (id)newOperationQueue
{
  return objc_alloc_init(BLOperationQueue);
}

- (BLDownloadPipeline)initWithDatabaseManager:(id)a3 downloadPolicyManager:(id)a4 transactionCoordinator:(id)a5 installManager:(id)a6 progressSender:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v49.receiver = self;
  v49.super_class = (Class)BLDownloadPipeline;
  v17 = [(BLDownloadPipeline *)&v49 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_databaseManager, v12);
    objc_storeWeak((id *)&v18->_installManager, v15);
    objc_storeWeak((id *)&v18->_transactionCoordinator, v14);
    objc_storeWeak((id *)&v18->_downloadPolicyManager, v13);
    objc_storeStrong((id *)&v18->_progressSender, a7);
    v19 = [(BLDownloadPipeline *)v18 newOperationQueue];
    backgroundOperationQueue = v18->_backgroundOperationQueue;
    v18->_backgroundOperationQueue = v19;

    [(BLOperationQueueProtocol *)v18->_backgroundOperationQueue setMaxConcurrentOperationCount:1];
    [(BLOperationQueueProtocol *)v18->_backgroundOperationQueue setName:@"com.apple.bookassetd.BLDownloadPipeline.background"];
    v21 = [(BLDownloadPipeline *)v18 newOperationQueue];
    preparationOperationQueue = v18->_preparationOperationQueue;
    v18->_preparationOperationQueue = v21;

    [(BLOperationQueueProtocol *)v18->_preparationOperationQueue setMaxConcurrentOperationCount:1];
    [(BLOperationQueueProtocol *)v18->_preparationOperationQueue setName:@"com.apple.bookassetd.BLDownloadPipeline.prepare"];
    v23 = [(BLDownloadPipeline *)v18 newOperationQueue];
    processingOperationQueue = v18->_processingOperationQueue;
    v18->_processingOperationQueue = v23;

    [(BLOperationQueueProtocol *)v18->_processingOperationQueue setMaxConcurrentOperationCount:3];
    [(BLOperationQueueProtocol *)v18->_processingOperationQueue setName:@"com.apple.bookassetd.BLDownloadPipeline.processing"];
    v25 = [(BLDownloadPipeline *)v18 newOperationQueue];
    sampleDownloadOperationQueue = v18->_sampleDownloadOperationQueue;
    v18->_sampleDownloadOperationQueue = v25;

    [(BLOperationQueueProtocol *)v18->_sampleDownloadOperationQueue setMaxConcurrentOperationCount:1];
    [(BLOperationQueueProtocol *)v18->_sampleDownloadOperationQueue setName:@"com.apple.bookassetd.BLDownloadPipeline.sampleDownloads"];
    v27 = [(BLDownloadPipeline *)v18 newOperationQueue];
    cellularDownloadOperationQueue = v18->_cellularDownloadOperationQueue;
    v18->_cellularDownloadOperationQueue = v27;

    [(BLOperationQueueProtocol *)v18->_cellularDownloadOperationQueue setMaxConcurrentOperationCount:3];
    [(BLOperationQueueProtocol *)v18->_cellularDownloadOperationQueue setName:@"com.apple.bookassetd.BLDownloadPipeline.cellularDownloads"];
    v29 = [(BLDownloadPipeline *)v18 newOperationQueue];
    discretionaryDownloadOperationQueue = v18->_discretionaryDownloadOperationQueue;
    v18->_discretionaryDownloadOperationQueue = v29;

    [(BLOperationQueueProtocol *)v18->_discretionaryDownloadOperationQueue setMaxConcurrentOperationCount:3];
    [(BLOperationQueueProtocol *)v18->_discretionaryDownloadOperationQueue setName:@"com.apple.bookassetd.BLDownloadPipeline.discretionaryDownloads"];
    v31 = [(BLDownloadPipeline *)v18 newOperationQueue];
    nonDiscretionaryDownloadOperationQueue = v18->_nonDiscretionaryDownloadOperationQueue;
    v18->_nonDiscretionaryDownloadOperationQueue = v31;

    [(BLOperationQueueProtocol *)v18->_nonDiscretionaryDownloadOperationQueue setMaxConcurrentOperationCount:3];
    [(BLOperationQueueProtocol *)v18->_nonDiscretionaryDownloadOperationQueue setName:@"com.apple.bookassetd.BLDownloadPipeline.nonDiscretionaryDownloads"];
    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v34 = dispatch_queue_create("com.apple.bookassetd.BLDownloadPipeline", v33);
    dispatchQueue = v18->_dispatchQueue;
    v18->_dispatchQueue = (OS_dispatch_queue *)v34;

    v36 = [[BLDownloadPipelineQueue alloc] initWithQueue:v18->_dispatchQueue];
    downloadPipelineQueue = v18->_downloadPipelineQueue;
    v18->_downloadPipelineQueue = v36;

    v38 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    dirtyTaskStates = v18->_dirtyTaskStates;
    v18->_dirtyTaskStates = v38;

    v40 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeTaskStates = v18->_activeTaskStates;
    v18->_activeTaskStates = v40;

    v42 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    preparationDownloadIDs = v18->_preparationDownloadIDs;
    v18->_preparationDownloadIDs = v42;

    v44 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    taskStates = v18->_taskStates;
    v18->_taskStates = v44;

    v46 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    urlSessions = v18->_urlSessions;
    v18->_urlSessions = v46;
  }
  return v18;
}

- (void)dealloc
{
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v4 = self->_progressTimer;
    self->_progressTimer = 0;
  }
  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    dispatch_source_cancel(reconnectTimer);
    v6 = self->_reconnectTimer;
    self->_reconnectTimer = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)BLDownloadPipeline;
  [(BLDownloadPipeline *)&v7 dealloc];
}

- (void)pumpDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BLDownloadPipeline *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DC38;
  v7[3] = &unk_1001A1430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)reconnectWithURLSessionTasks
{
  v3 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DCCC;
  block[3] = &unk_1001A0FE8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)prioritizeDownloadWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DF98;
  block[3] = &unk_1001A1B00;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)startupDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BLDownloadPipeline *)self transactionCoordinator];
  [v5 willStartTransactionWithIdentifier:@"com.apple.bookassetd.restart-downloads-at-startup"];

  id v6 = [(BLDownloadPipeline *)self dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E270;
  v8[3] = &unk_1001A1430;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)restartDownloadsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E764;
  block[3] = &unk_1001A1B00;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)retryDownloadWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EAF8;
  block[3] = &unk_1001A1E80;
  void block[4] = self;
  id v12 = v6;
  id v9 = v6;
  objc_copyWeak(&v14, &location);
  id v13 = v7;
  id v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)stopDownloadsWithIdentifiers:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BLDownloadPipeline *)self dispatchQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002EDBC;
  v13[3] = &unk_1001A1ED0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (id)dq_getTaskStateFromDownloadID:(id)a3
{
  id v4 = a3;
  v5 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BLDownloadPipeline *)self activeTaskStates];
  id v7 = [v6 objectEnumerator];

  id v8 = 0;
  do
  {
    id v9 = v8;
    id v8 = [v7 nextObject];

    if (!v8) {
      break;
    }
    id v10 = [v8 downloadIdentifier];
    unsigned int v11 = [v10 isEqualToString:v4];
  }
  while (!v11);

  return v8;
}

- (void)installManager:(id)a3 willRestartInstallForDownload:(id)a4
{
  id v5 = a4;
  id v6 = [(BLDownloadPipeline *)self transactionCoordinator];
  id v7 = [v5 downloadID];
  [v6 willStartTransactionWithIdentifier:v7];

  id v8 = [(BLDownloadPipeline *)self dispatchQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F678;
  v10[3] = &unk_1001A11A8;
  id v11 = v5;
  id v12 = self;
  id v9 = v5;
  dispatch_async(v8, v10);
}

- (void)installManager:(id)a3 didStartInstallWithOperation:(id)a4 forDownloadID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F7EC;
  block[3] = &unk_1001A10C8;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)installManager:(id)a3 updatedProgress:(id)a4 forInstallOperation:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FB1C;
  block[3] = &unk_1001A10C8;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)installManager:(id)a3 didFinishInstallForOperation:(id)a4
{
  id v5 = a4;
  id v6 = [(BLDownloadPipeline *)self dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002FC88;
  v8[3] = &unk_1001A11A8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(v7, "bl_dataConsumer");
  id v21 = 0;
  unsigned __int8 v10 = [v9 consumeData:v8 error:&v21];

  id v11 = v21;
  id v12 = [(BLDownloadPipeline *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002FFF4;
  v16[3] = &unk_1001A1EF8;
  unsigned __int8 v20 = v10;
  v16[4] = self;
  id v17 = v7;
  id v18 = v11;
  id v19 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v7;
  dispatch_async(v12, v16);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = (void (**)(id, uint64_t))a6;
  uint64_t v11 = (uint64_t)objc_msgSend(v9, "bl_statusCode");
  uint64_t v12 = v11;
  if (v11 <= 399)
  {
    id v13 = objc_msgSend(v8, "bl_dataConsumer");
    id v14 = [v13 resumptionOffset];
    if (v12 != 206 && v14)
    {
      id v15 = BLServiceDownloadPipelineLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134217984;
        id v27 = [v8 taskIdentifier];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Download]: Did not receive partial content response for task: %lu", (uint8_t *)&v26, 0xCu);
      }

      [v13 truncate];
    }
    v10[2](v10, 1);

    goto LABEL_26;
  }
  if (v11 == 416)
  {
    id v17 = BLServiceDownloadPipelineLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134217984;
      id v27 = [v8 taskIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Download]: Truncate and restart task: %lu after 416 response", (uint8_t *)&v26, 0xCu);
    }

    int64_t v16 = objc_msgSend(v8, "bl_dataConsumer");
    [v16 truncate];
    goto LABEL_15;
  }
  if (v11 == 408)
  {
    int64_t v16 = BLServiceDownloadPipelineLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134217984;
      id v27 = [v8 taskIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Download]: Restart task: %lu after 408 response", (uint8_t *)&v26, 0xCu);
    }
LABEL_15:

    objc_msgSend(v8, "bl_cancelWithReason:error:", 5, 0);
    v10[2](v10, 0);
    goto LABEL_26;
  }
  id v18 = BLServiceDownloadPipelineLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 134218240;
    id v27 = [v8 taskIdentifier];
    __int16 v28 = 2048;
    uint64_t v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Download]: Cancel download task: %lu for invalid HTTP status code: %ld", (uint8_t *)&v26, 0x16u);
  }

  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned __int8 v20 = +[NSNumber numberWithInteger:v12];
  [v19 setObject:v20 forKeyedSubscript:@"BLKeyHTTPResponseCode"];

  id v21 = objc_msgSend(v9, "bl_allHeaderFields");
  v22 = sub_1000266D4(v21, @"X-Apple-JADownloadQueue-Token");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v19 setObject:v22 forKeyedSubscript:BLDownloadErrorKeyJADownloadQueueToken];
  }
  v23 = sub_1000266D4(v21, @"Retry-After");

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v19 setObject:v23 forKeyedSubscript:BLDownloadErrorKeyRetryInterval];
  }
  id v24 = [v19 copy];
  if (v12 == 403) {
    +[NSError errorWithDomain:NSURLErrorDomain code:-1102 userInfo:v24];
  }
  else {
  v25 = sub_10004B7C4(3, 0, 0, v24);
  }

  objc_msgSend(v8, "bl_cancelWithReason:error:", 1, v25);
  v10[2](v10, 0);

LABEL_26:
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = BLServiceDownloadPipelineLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[Download] URLSession finish collecting metrics. task=%@, metrics=%@", buf, 0x16u);
  }

  unsigned __int8 v10 = [(BLDownloadPipeline *)self dispatchQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003080C;
  v13[3] = &unk_1001A11A8;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, v13);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = BLServiceDownloadPipelineLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[Download] URLSession task complete. task=%@", buf, 0xCu);
  }

  unsigned __int8 v10 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003096C;
  block[3] = &unk_1001A10C8;
  id v14 = v7;
  id v15 = v8;
  int64_t v16 = self;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v7 = (void (**)(id, uint64_t, void))a6;
  id v8 = [a5 protectionSpace];
  id v9 = [v8 authenticationMethod];
  if ([v9 isEqualToString:NSURLAuthenticationMethodClientCertificate])
  {
    unsigned __int8 v10 = BLServiceDownloadPipelineLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      id v11 = "Asked to use client certificate authentication";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ([v9 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    if (!MGGetBoolAnswer()
      || (+[AMSDefaults QAMode] & 1) == 0
      && !+[AMSDefaults ignoreServerTrustEvaluation])
    {
      unsigned __int8 v10 = BLServiceDownloadPipelineLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        id v11 = "Asked to perform server trust authentication";
        goto LABEL_17;
      }
LABEL_18:

      v7[2](v7, 1, 0);
      goto LABEL_19;
    }
    id v12 = BLServiceDownloadPipelineLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109632;
      *(_DWORD *)id v18 = 1;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = +[AMSDefaults QAMode];
      __int16 v19 = 1024;
      unsigned int v20 = +[AMSDefaults ignoreServerTrustEvaluation];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring server trust!! (internalBuild:%d, QAMode:%d, ignoreServerTrustEvaluation: %d)", (uint8_t *)&v17, 0x14u);
    }

    id v13 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v8 serverTrust]);
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v13);
  }
  else
  {
    unsigned int v14 = [v9 isEqualToString:NSURLAuthenticationMethodHTTPBasic];
    id v15 = BLServiceDownloadPipelineLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Basic authentication is not supported by bookassetd", (uint8_t *)&v17, 2u);
      }

      v7[2](v7, 2, 0);
    }
    else
    {
      if (v16)
      {
        int v17 = 138543362;
        *(void *)id v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "This authentication method %{public}@ is not supported by bookassetd ... try the next protection space", (uint8_t *)&v17, 0xCu);
      }

      v7[2](v7, 3, 0);
    }
  }
LABEL_19:
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003147C;
  block[3] = &unk_1001A10C8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(BLDownloadPipeline *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100031744;
  v16[3] = &unk_1001A1AD8;
  id v17 = v10;
  id v18 = v9;
  __int16 v19 = self;
  id v20 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

- (void)_addDownloads:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031B80;
  block[3] = &unk_1001A1B00;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)dq_startProgressTimer
{
  v3 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipeline *)self progressTimer];

  if (!v4)
  {
    objc_initWeak(&location, self);
    id v5 = [(BLDownloadPipeline *)self dispatchQueue];
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    [(BLDownloadPipeline *)self setProgressTimer:v6];

    id v7 = [(BLDownloadPipeline *)self progressTimer];
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);

    id v9 = [(BLDownloadPipeline *)self progressTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100032038;
    handler[3] = &unk_1001A1F70;
    handler[4] = self;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v9, handler);

    id v10 = [(BLDownloadPipeline *)self progressTimer];
    dispatch_resume(v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)dq_commitProgress
{
  v3 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipeline *)self dirtyTaskStates];
  id v5 = [v4 count];

  if (v5)
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id obj = [(BLDownloadPipeline *)self dirtyTaskStates];
    id v80 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
    if (v80)
    {
      uint64_t v79 = *(void *)v82;
      uint64_t v78 = BLDownloadQueuePropertyBytesDownloaded;
      uint64_t v77 = BLDownloadQueuePropertyBytesTotal;
      uint64_t v76 = BLDownloadQueuePropertyEstimatedTimeRemaining;
      uint64_t v75 = BLDownloadQueuePropertyPercentComplete;
      uint64_t v74 = BLDownloadQueuePropertyStoreItemIdentifier;
      uint64_t v73 = BLDownloadQueuePropertyStorePlaylistIdentifier;
      uint64_t v72 = BLDownloadQueuePropertyDownloadIdentifier;
      uint64_t v71 = BLDownloadQueuePropertyArtistName;
      uint64_t v70 = BLDownloadQueuePropertyTitle;
      uint64_t v69 = BLDownloadQueuePropertySubTitle;
      uint64_t v68 = BLDownloadQueuePropertyCollectionArtistName;
      uint64_t v67 = BLDownloadQueuePropertyCollectionTitle;
      uint64_t v66 = BLDownloadQueuePropertyGenre;
      uint64_t v65 = BLDownloadQueuePropertyKind;
      uint64_t v64 = BLDownloadQueuePropertyThumbnailImageURL;
      uint64_t v63 = BLDownloadQueuePropertyPermLink;
      uint64_t v62 = BLDownloadQueuePropertyDownloadPhase;
      v61 = (void *)BLDownloadKindAudiobook;
      uint64_t v60 = BLDownloadQueuePropertyIsAudiobook;
      uint64_t v59 = BLDownloadQueuePropertyIsRestore;
      uint64_t v58 = BLDownloadQueuePropertyIsSample;
      uint64_t v57 = BLDownloadQueuePropertyIsPurchase;
      uint64_t v56 = BLDownloadQueuePropertyPurchaseDate;
      uint64_t v55 = BLDownloadQueuePropertyPersistentIdentifier;
      *(void *)&long long v6 = 138543874;
      long long v52 = v6;
      uint64_t v54 = BLDownloadQueuePropertyStoreAccountIdentifier;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v82 != v79) {
            objc_enumerationMutation(obj);
          }
          dispatch_time_t v8 = *(void **)(*((void *)&v81 + 1) + 8 * (void)v7);
          id v10 = [v8 downloadIdentifier];
          id v11 = [v8 overallProgress];
          [v11 snapshot];
          double v12 = (double)(uint64_t)[v11 currentValue];
          double v13 = v12 / (double)(uint64_t)[v11 maxValue];
          id v14 = objc_opt_new();
          id v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 transferBytesWritten]);
          [v14 setObject:v15 forKeyedSubscript:v78];

          BOOL v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 transferBytesExpected]);
          [v14 setObject:v16 forKeyedSubscript:v77];

          [v11 estimatedTimeRemaining];
          id v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v14 setObject:v17 forKeyedSubscript:v76];

          id v18 = +[NSNumber numberWithDouble:v13];
          [v14 setObject:v18 forKeyedSubscript:v75];

          __int16 v19 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 assetIdentifier]);
          [v14 setObject:v19 forKeyedSubscript:v74];

          id v20 = [v8 playlistIdentifier];
          [v14 setObject:v20 forKeyedSubscript:v73];

          [v14 setObject:v10 forKeyedSubscript:v72];
          id v21 = [v8 artistName];
          [v14 setObject:v21 forKeyedSubscript:v71];

          v22 = [v8 title];
          [v14 setObject:v22 forKeyedSubscript:v70];

          v23 = [v8 subtitle];
          [v14 setObject:v23 forKeyedSubscript:v69];

          id v24 = [v8 collectionArtistName];
          [v14 setObject:v24 forKeyedSubscript:v68];

          v25 = [v8 collectionTitle];
          [v14 setObject:v25 forKeyedSubscript:v67];

          int v26 = [v8 genre];
          [v14 setObject:v26 forKeyedSubscript:v66];

          id v27 = [v8 kind];
          [v14 setObject:v27 forKeyedSubscript:v65];

          __int16 v28 = [v8 thumbnailImageURL];
          [v14 setObject:v28 forKeyedSubscript:v64];

          uint64_t v29 = [v8 permLink];
          [v14 setObject:v29 forKeyedSubscript:v63];

          v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 downloadPhase]);
          [v14 setObject:v30 forKeyedSubscript:v62];

          v31 = [v8 kind];
          v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v61 isEqualToString:v31]);
          [v14 setObject:v32 forKeyedSubscript:v60];

          v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isRestore]);
          [v14 setObject:v33 forKeyedSubscript:v59];

          dispatch_queue_t v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isSample]);
          [v14 setObject:v34 forKeyedSubscript:v58];

          v35 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isPurchase]);
          [v14 setObject:v35 forKeyedSubscript:v57];

          v36 = [v8 purchaseDate];
          [v14 setObject:v36 forKeyedSubscript:v56];

          v37 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 persistentIdentifier]);
          [v14 setObject:v37 forKeyedSubscript:v55];

          v38 = [v8 storeAccountIdentifier];
          [v14 setObject:v38 forKeyedSubscript:v54];

          if (v14)
          {
            if ([v8 downloadPhase] == (id)5 || objc_msgSend(v8, "downloadPhase") == (id)4)
            {
              v39 = BLServiceDownloadPipelineLog();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v86 = v10;
                __int16 v87 = 2048;
                double v88 = *(double *)&v8;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download]: Posting the BLDownloadQueueDownloadFailedNotification, taskState: %p", buf, 0x16u);
              }

              v40 = [(BLDownloadPipeline *)self progressSender];
              [v40 sendDidFailNotificatonWithUserInfo:v14];
            }
            else
            {
              id v44 = [v8 downloadPhase];
              v45 = BLServiceDownloadPipelineLog();
              BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
              if (v44 == (id)8)
              {
                if (v46)
                {
                  *(_DWORD *)buf = 138543618;
                  v86 = v10;
                  __int16 v87 = 2048;
                  double v88 = *(double *)&v8;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download]: Posting the DownloadCompleteNotification, taskState: %p", buf, 0x16u);
                }

                v47 = [(BLDownloadPipeline *)self progressSender];
                [v47 sendDownloadCompleteWithUserInfo:v14];

                v40 = _os_activity_create((void *)&_mh_execute_header, "Posting PlistChanged to itunesstored", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
                os_activity_apply(v40, &stru_1001A1F90);
              }
              else
              {
                if (v46)
                {
                  if ((uint64_t)[v8 transferBytesExpected] < 1)
                  {
                    double v49 = 0.0;
                  }
                  else
                  {
                    double v48 = (double)(uint64_t)[v8 transferBytesWritten];
                    double v49 = v48 / (double)(uint64_t)[v8 transferBytesExpected];
                  }
                  *(_DWORD *)buf = v52;
                  v86 = v10;
                  __int16 v87 = 2048;
                  double v88 = v49;
                  __int16 v89 = 2048;
                  v90 = v8;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download]: Posting download/install progress for download [%.2f%% complete], taskState: %p", buf, 0x20u);
                }

                v40 = [(BLDownloadPipeline *)self progressSender];
                [v40 sendProgressNotificationWithUserInfo:v14];
              }
            }

            if ([v8 downloadPhase] == (id)3
              || [v8 downloadPhase] == (id)5
              || [v8 downloadPhase] == (id)8
              || [v8 downloadPhase] == (id)4)
            {
              v41 = BLServiceDownloadPipelineLog();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v86 = v10;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "(dID=%{public}@) [Download]: Sending the didFinishTransactionWithIdenfifier", buf, 0xCu);
              }

              [(BLDownloadPipeline *)self dq_removeDownloadFromPipelineQueue:v10];
              v42 = BLServiceDownloadPipelineLog();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v86 = v10;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download]: dq_commitProgress is going to call dq_pumpDownloadsWithCompletion", buf, 0xCu);
              }

              [(BLDownloadPipeline *)self dq_pumpDownloadsWithCompletion:0];
              v43 = [(BLDownloadPipeline *)self transactionCoordinator];
              [v43 didFinishTransactionWithIdenfifier:v10];
            }
          }

          id v7 = (char *)v7 + 1;
        }
        while (v80 != v7);
        id v50 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
        id v80 = v50;
      }
      while (v50);
    }

    v51 = [(BLDownloadPipeline *)self dirtyTaskStates];
    [v51 removeAllObjects];
  }
  [(BLDownloadPipeline *)self dq_cancelProgressTimer];
}

- (void)dq_removeDownloadFromPipelineQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  long long v6 = [(BLDownloadPipeline *)self downloadPipelineQueue];
  [v6 removeDownloadWithDownloadID:v4];

  id v7 = BLServiceDownloadQueueLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v8 = [(BLDownloadPipeline *)self downloadPipelineQueue];
    id v9 = [v8 inFlightDiscretionaryDownloadIDs];
    id v10 = [v9 count];
    id v11 = [(BLDownloadPipeline *)self downloadPipelineQueue];
    double v12 = [v11 inFlightNondiscretionaryDownloadIDs];
    int v18 = 138543874;
    id v19 = v4;
    __int16 v20 = 2048;
    id v21 = v10;
    __int16 v22 = 2048;
    id v23 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) Removing from inFlight lists. New discretionary count %lu, New nondiscretionary count %lu", (uint8_t *)&v18, 0x20u);
  }
  double v13 = BLServiceDownloadQueueLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [(BLDownloadPipeline *)self downloadPipelineQueue];
    id v15 = [v14 inFlightDiscretionaryDownloadIDs];
    BOOL v16 = [(BLDownloadPipeline *)self downloadPipelineQueue];
    id v17 = [v16 inFlightNondiscretionaryDownloadIDs];
    int v18 = 138543618;
    id v19 = v15;
    __int16 v20 = 2114;
    id v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "In flight discretionary %{public}@\nIn flight nondiscrtionary %{public}@", (uint8_t *)&v18, 0x16u);
  }
}

- (void)dq_cancelProgressTimer
{
  v3 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipeline *)self progressTimer];

  if (v4)
  {
    id v5 = [(BLDownloadPipeline *)self progressTimer];
    dispatch_source_cancel(v5);

    [(BLDownloadPipeline *)self setProgressTimer:0];
  }
}

- (void)dq_saveState:(int64_t)a3 forDownloadID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v10);

  objc_initWeak(&location, self);
  id v11 = [(BLDownloadPipeline *)self databaseManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032F74;
  v13[3] = &unk_1001A1490;
  objc_copyWeak(&v15, &location);
  id v12 = v9;
  id v14 = v12;
  [v11 saveDownloadStateWithId:v8 state:a3 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)dq_clearIsLocalServerCacheForDownloadID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, self);
  id v9 = [(BLDownloadPipeline *)self databaseManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000331DC;
  v11[3] = &unk_1001A1490;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v9 saveIsLocalCacheServerWithId:v6 isLocal:0 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)dq_setSessionTaskPriorityToHighForDownloadID:(id)a3
{
  id v23 = a3;
  id v4 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [(BLDownloadPipeline *)self taskStates];
  id v6 = (char *)[v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    char v22 = 0;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          id v10 = BUDynamicCast();
          id v11 = [(BLDownloadPipeline *)self taskStates];
          id v12 = [v11 objectForKey:v10];

          id v13 = [v12 downloadIdentifier];
          unsigned int v14 = [v23 isEqualToString:v13];
          id v15 = BLServiceDownloadPipelineLog();
          BOOL v16 = v15;
          if (v14)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = [v10 taskIdentifier];
              *(_DWORD *)buf = 138543618;
              uint64_t v29 = v13;
              __int16 v30 = 2048;
              id v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download]: Reprioritizing to high task: %lu", buf, 0x16u);
            }
            char v22 = 1;
            float v18 = NSURLSessionTaskPriorityHigh;
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              id v19 = [v10 taskIdentifier];
              *(_DWORD *)buf = 138543618;
              uint64_t v29 = v13;
              __int16 v30 = 2048;
              id v31 = v19;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "(dID=%{public}@) [Download]: Reprioritizing to default task: %lu to restart download", buf, 0x16u);
            }
            float v18 = NSURLSessionTaskPriorityDefault;
          }

          *(float *)&double v20 = v18;
          [v10 setPriority:v20];
        }
      }
      id v7 = (char *)[v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }
  else
  {
    char v22 = 0;
  }

  return v22 & 1;
}

- (void)dq_pumpDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = BLServiceDownloadQueueLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Pumping Downloads", buf, 2u);
  }

  id v7 = [(BLDownloadPipeline *)self downloadPipelineQueue];
  id v8 = [v7 availableSampleDownloads];

  id v9 = [(BLDownloadPipeline *)self downloadPipelineQueue];
  id v10 = [v9 availableCellularDownloads];

  id v11 = [(BLDownloadPipeline *)self downloadPipelineQueue];
  id v12 = [v11 availableDiscretionaryDownloads];

  id v13 = [(BLDownloadPipeline *)self downloadPipelineQueue];
  id v14 = [v13 availableNondiscretionaryDownloads];

  id v15 = BLServiceDownloadQueueLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    id v35 = v12;
    __int16 v36 = 2048;
    id v37 = v14;
    __int16 v38 = 2048;
    id v39 = v8;
    __int16 v40 = 2048;
    id v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Available discretionary %lu, nondiscretionary %lu, sample %lu, cellular %lu", buf, 0x2Au);
  }

  BOOL v16 = BLServiceDownloadQueueLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = [(BLDownloadPipeline *)self downloadPipelineQueue];
    id v17 = [v29 inFlightDiscretionaryDownloadIDs];
    long long v27 = [(BLDownloadPipeline *)self downloadPipelineQueue];
    float v18 = [v27 inFlightNondiscretionaryDownloadIDs];
    [(BLDownloadPipeline *)self downloadPipelineQueue];
    id v19 = v31 = v8;
    [v19 inFlightSampleDownloadIDs];
    double v20 = v30 = v4;
    [(BLDownloadPipeline *)self downloadPipelineQueue];
    id v28 = v14;
    v22 = id v21 = v10;
    id v23 = [v22 inFlightCellularDownloadIDs];
    *(_DWORD *)buf = 138544130;
    id v35 = v17;
    __int16 v36 = 2114;
    id v37 = v18;
    __int16 v38 = 2114;
    id v39 = v20;
    __int16 v40 = 2114;
    id v41 = v23;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "In flight discretionary %{public}@\nIn flight nondiscretionary %{public}@\nIn flight sample %{public}@\nIn flight cellular %{public}@", buf, 0x2Au);

    id v10 = v21;
    id v14 = v28;

    id v4 = v30;
    id v8 = v31;
  }
  if (v12 || v14 || v8 || v10)
  {
    long long v26 = [(BLDownloadPipeline *)self databaseManager];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003399C;
    v32[3] = &unk_1001A19C0;
    v32[4] = self;
    id v33 = v4;
    [v26 fetchListOfPendingDownloadsSortedByStartTime:v32];
  }
  else
  {
    id v24 = objc_retainBlock(v4);
    long long v25 = v24;
    if (v24) {
      (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
    }
  }
}

- (void)doq_performDownloadOperation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BLDownloadPipeline *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034650;
  block[3] = &unk_1001A1B00;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)dq_logDownloadEvent:(id)a3 forTaskWithState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = BLServiceDownloadPipelineLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 downloadIdentifier];
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download]: logged event: %{public}@ for task", (uint8_t *)&v11, 0x16u);
  }
}

- (void)dq_prepareDownloadsForDownloads:(id)a3 filtersExistingTasks:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v10);

  if (v6)
  {
    id v11 = objc_alloc_init((Class)NSMutableSet);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = [(BLDownloadPipeline *)self taskStates];
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        BOOL v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v16);
          float v18 = [(BLDownloadPipeline *)self taskStates];
          id v19 = [v18 objectForKey:v17];

          double v20 = [v19 downloadIdentifier];
          [v11 addObject:v20];

          BOOL v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v11 = 0;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100035248;
  v25[3] = &unk_1001A2058;
  id v26 = v11;
  long long v27 = self;
  id v28 = v9;
  id v21 = v9;
  id v22 = v11;
  id v23 = objc_retainBlock(v25);
  id v24 = [(BLDownloadPipeline *)self downloadPolicyManager];
  +[BLPrepareDownloadOperation enumerateOperationsWithDownloads:v8 downloadPolicyManager:v24 usingBlock:v23];
}

- (BOOL)_allowsCellularDownload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 isRestore];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = +[BLRestoreManager sharedInstance];
    id v8 = [v7 isCellularAllowed];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(BLDownloadPipeline *)self downloadPolicyManager];
  id v10 = [v4 downloadID];
  id v11 = [v9 downloadPolicyForID:v10];

  LOBYTE(v9) = +[BLPrepareDownloadOperation allowsCellularAccessForAsset:v4 policy:v11 isCellularAllowedForRestores:v8];
  return (char)v9;
}

- (void)dq_processCompletedDownloadWithTaskState:(id)a3 postProgress:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  unsigned int v6 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    [v9 setTransferProgress:1.0];
    id v7 = [(BLDownloadPipeline *)self dirtyTaskStates];
    [v7 addObject:v9];

    [(BLDownloadPipeline *)self dq_startProgressTimer];
  }
  id v8 = [v9 downloadIdentifier];
  [(BLDownloadPipeline *)self dq_setDownloadState:7 forDownloadIdentifier:v8 completion:0];
}

- (void)dq_processDownloadFailureWithTaskState:(id)a3 task:(id)a4 cancelReason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v10);

  int64_t v11 = a5 - 1;
  if ((unint64_t)(a5 - 1) > 3)
  {
    CFStringRef v13 = @"Download Error";
    uint64_t v12 = 5;
  }
  else
  {
    uint64_t v12 = qword_1001606B0[v11];
    CFStringRef v13 = *(&off_1001A2118 + v11);
  }
  [v8 setDownloadPhase:v12];
  id v14 = BLServiceDownloadPipelineLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = [v8 downloadIdentifier];
    int v19 = 138543618;
    double v20 = v15;
    __int16 v21 = 2114;
    CFStringRef v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Download]: Download Failed reason: %{public}@", (uint8_t *)&v19, 0x16u);
  }
  if ((unint64_t)(a5 - 5) <= 0xFFFFFFFFFFFFFFFDLL) {
    [v8 setTransferProgress:1.0];
  }
  BOOL v16 = [(BLDownloadPipeline *)self dirtyTaskStates];
  [v16 addObject:v8];

  uint64_t v17 = [(BLDownloadPipeline *)self activeTaskStates];
  [v17 removeObject:v8];

  if (v9)
  {
    float v18 = [(BLDownloadPipeline *)self taskStates];
    [v18 removeObjectForKey:v9];
  }
  [(BLDownloadPipeline *)self dq_startProgressTimer];
  if ([v8 downloadPhase] == (id)5 || objc_msgSend(v8, "downloadPhase") == (id)4) {
    [(BLDownloadPipeline *)self dq_notifyServerOfDownloadCancelledWithTaskState:v8];
  }
}

- (void)dq_notifyServerOfDownloadCancelledWithTaskState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 storeAccountIdentifier];
  unsigned int v6 = [v4 downloadIdentifier];
  id v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 assetIdentifier]);
  id v8 = [v4 transactionIdentifier];
  id v9 = [v4 cancelDownloadURL];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035958;
  v11[3] = &unk_1001A2080;
  id v12 = v4;
  id v10 = v4;
  [(BLDownloadPipeline *)self dq_notifyServerOfDownloadCancelledWithAccountID:v5 downloadID:v6 storeID:v7 transactionID:v8 cancelDownloadURL:v9 completion:v11];
}

- (void)dq_notifyServerOfDownloadCancelledWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 cancelDownloadURL:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  double v20 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v20);

  __int16 v21 = BLServiceDownloadPipelineLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543362;
    id v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Download]: Marking download as [cancelled] for server.", (uint8_t *)&v22, 0xCu);
  }

  +[BLServerDownloadDoneRequest notifyDownloadCancelledWithAccountID:v19 downloadID:v14 storeID:v18 transactionID:v17 cancelDownloadURL:v16 completion:v15];
}

- (void)notifyServerForFailedDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadPipeline *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035C40;
  v7[3] = &unk_1001A1430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)dq_scheduleReconnect
{
  v3 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipeline *)self reconnectTimer];

  if (v4)
  {
    source = [(BLDownloadPipeline *)self reconnectTimer];
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(source, v5, 0, 0);
  }
  else
  {
    id v6 = [(BLDownloadPipeline *)self dispatchQueue];
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    [(BLDownloadPipeline *)self setReconnectTimer:v7];

    id v8 = [(BLDownloadPipeline *)self reconnectTimer];
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v8, v9, 0, 0);

    objc_initWeak(&location, self);
    id v10 = [(BLDownloadPipeline *)self reconnectTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003642C;
    handler[3] = &unk_1001A20F8;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v10, handler);

    int64_t v11 = [(BLDownloadPipeline *)self reconnectTimer];
    dispatch_resume(v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)dq_setDownloadState:(int64_t)a3 forDownloadIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BLDownloadPipeline *)self dispatchQueue];
  dispatch_assert_queue_V2(v10);

  int64_t v11 = BLServiceDownloadPipelineLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = NSStringFromBLDownloadState();
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "(dID=%{public}@) [Download]: Setting phase to %{public}@", (uint8_t *)&v13, 0x16u);
  }
  [(BLDownloadPipeline *)self dq_saveState:a3 forDownloadID:v8 completion:v9];
}

- (BLDatabaseManager)databaseManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);

  return (BLDatabaseManager *)WeakRetained;
}

- (void)setDatabaseManager:(id)a3
{
}

- (BLBookInstallManager)installManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_installManager);

  return (BLBookInstallManager *)WeakRetained;
}

- (void)setInstallManager:(id)a3
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

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BLOperationQueueProtocol)backgroundOperationQueue
{
  return self->_backgroundOperationQueue;
}

- (void)setBackgroundOperationQueue:(id)a3
{
}

- (NSMutableSet)dirtyTaskStates
{
  return self->_dirtyTaskStates;
}

- (void)setDirtyTaskStates:(id)a3
{
}

- (NSMutableOrderedSet)preparationDownloadIDs
{
  return self->_preparationDownloadIDs;
}

- (void)setPreparationDownloadIDs:(id)a3
{
}

- (BLOperationQueueProtocol)preparationOperationQueue
{
  return self->_preparationOperationQueue;
}

- (void)setPreparationOperationQueue:(id)a3
{
}

- (BLOperationQueueProtocol)processingOperationQueue
{
  return self->_processingOperationQueue;
}

- (void)setProcessingOperationQueue:(id)a3
{
}

- (OS_dispatch_source)reconnectTimer
{
  return self->_reconnectTimer;
}

- (void)setReconnectTimer:(id)a3
{
}

- (OS_dispatch_source)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
}

- (NSMapTable)taskStates
{
  return self->_taskStates;
}

- (void)setTaskStates:(id)a3
{
}

- (NSMutableSet)activeTaskStates
{
  return self->_activeTaskStates;
}

- (void)setActiveTaskStates:(id)a3
{
}

- (NSMutableDictionary)urlSessions
{
  return self->_urlSessions;
}

- (void)setUrlSessions:(id)a3
{
}

- (BLOperationQueueProtocol)sampleDownloadOperationQueue
{
  return self->_sampleDownloadOperationQueue;
}

- (void)setSampleDownloadOperationQueue:(id)a3
{
}

- (BLOperationQueueProtocol)cellularDownloadOperationQueue
{
  return self->_cellularDownloadOperationQueue;
}

- (void)setCellularDownloadOperationQueue:(id)a3
{
}

- (BLOperationQueueProtocol)discretionaryDownloadOperationQueue
{
  return self->_discretionaryDownloadOperationQueue;
}

- (void)setDiscretionaryDownloadOperationQueue:(id)a3
{
}

- (BLOperationQueueProtocol)nonDiscretionaryDownloadOperationQueue
{
  return self->_nonDiscretionaryDownloadOperationQueue;
}

- (void)setNonDiscretionaryDownloadOperationQueue:(id)a3
{
}

- (BLDownloadPipelineQueue)downloadPipelineQueue
{
  return self->_downloadPipelineQueue;
}

- (BLProgressSender)progressSender
{
  return self->_progressSender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSender, 0);
  objc_storeStrong((id *)&self->_downloadPipelineQueue, 0);
  objc_storeStrong((id *)&self->_nonDiscretionaryDownloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_discretionaryDownloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_cellularDownloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_sampleDownloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_urlSessions, 0);
  objc_storeStrong((id *)&self->_activeTaskStates, 0);
  objc_storeStrong((id *)&self->_taskStates, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_processingOperationQueue, 0);
  objc_storeStrong((id *)&self->_preparationOperationQueue, 0);
  objc_storeStrong((id *)&self->_preparationDownloadIDs, 0);
  objc_storeStrong((id *)&self->_dirtyTaskStates, 0);
  objc_storeStrong((id *)&self->_backgroundOperationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_destroyWeak((id *)&self->_downloadPolicyManager);
  objc_destroyWeak((id *)&self->_installManager);

  objc_destroyWeak((id *)&self->_databaseManager);
}

@end
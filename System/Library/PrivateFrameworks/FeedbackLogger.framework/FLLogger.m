@interface FLLogger
+ (BOOL)isManagedProcess;
+ (id)fixedCategoryForBundleID:(id)a3;
+ (id)sharedLogger;
+ (id)sharedLoggerWithPersistenceConfiguration:(unint64_t)a3;
- (BOOL)_isHoldingWriteTransaction;
- (BOOL)isHoldingWriteTransaction;
- (FLLogger)initWithContext:(id)a3;
- (FLLogger)initWithPersistenceConfiguration:(unint64_t)a3;
- (FLLoggingContext)context;
- (FLWriteTransaction)writeTransaction;
- (NSDistributedNotificationCenter)notificationCenter;
- (NSMutableDictionary)dbConnections;
- (NSMutableDictionary)persistentStores;
- (OS_dispatch_source)persistentStoreCacheTTLTimer;
- (OS_dispatch_source)writeTransactionTTLTimer;
- (OS_os_log)log;
- (id)__dispatched_databaseConnectionWithStorePath:(id)a3;
- (id)__dispatched_persistentStoreWithId:(id)a3 category:(id)a4;
- (id)__dispatched_persistentStoreWithId:(id)a3 category:(id)a4 storePath:(id)a5;
- (id)_nextStoreCacheTimerFireDate;
- (id)categoryForSiriPayload:(id)a3 autoBugCaptureBlock:(id)a4;
- (id)dataUploadStoreIdForApplicationIdentifier:(id)a3;
- (id)parsecCategoryForPayload:(id)a3;
- (id)parsecPersistentStoreForBundleID:(id)a3;
- (id)parsecStoreId;
- (id)readSiriCategoryFrom:(id)a3 recursive:(BOOL)a4 autoBugCaptureBlock:(id)a5;
- (id)registerSiriInstrumentationObserver:(id)a3 observer:(id)a4;
- (id)siriReadingStoreForBundleID:(id)a3;
- (id)siriReadingStoreForBundleID:(id)a3 directoryPath:(id)a4;
- (id)siriStoreIdForBundleId:(id)a3;
- (id)siriWritingStoreForBundleID:(id)a3 category:(id)a4;
- (id)uploadHeaders;
- (os_unfair_lock_s)lock;
- (unint64_t)writeTransactionTTL;
- (void)_cancelStoreCacheTimer;
- (void)_cancelWriteTransactionTTLTimer;
- (void)_claimWriteTransaction;
- (void)_cleanPersistantStores;
- (void)_closeAllStores;
- (void)_relinquishWriteTransaction;
- (void)_scheduleStoreCacheTimer;
- (void)_scheduleWriteTransactionTTLTimer;
- (void)_setupStoreCacheTimer;
- (void)_setupWriteTransactionTTLTimer;
- (void)_writeTransactionTTLTimerDidFire;
- (void)cancelWriteTransactionTTLTimer;
- (void)closeAllStores;
- (void)closeOpenBatchesAndStores;
- (void)closeStoreForApplicationFromNotification:(id)a3;
- (void)closeStoreForBundleID:(id)a3;
- (void)dealloc;
- (void)removeSiriInstrumentationObserver:(id)a3;
- (void)report:(id)a3 application:(id)a4;
- (void)report:(id)a3 application:(id)a4 onComplete:(id)a5;
- (void)reportDataPlatformBatchedEvent:(id)a3 forBundleID:(id)a4 ofSchema:(id)a5 completion:(id)a6;
- (void)reportDataPlatformSingleEvent:(id)a3 forBundleID:(id)a4 ofSchema:(id)a5 completion:(id)a6;
- (void)reportDataUploadEvent:(id)a3 application:(id)a4 completion:(id)a5;
- (void)reportParsecFeedback:(id)a3 completion:(id)a4;
- (void)reportSiriInstrumentationEvent:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)runOnStoreForBundleID:(id)a3 block:(id)a4;
- (void)runOnStoreForBundleID:(id)a3 directoryPath:(id)a4 block:(id)a5;
- (void)scheduleImmediateUpload;
- (void)setContext:(id)a3;
- (void)setDbConnections:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPersistentStoreCacheTTLTimer:(id)a3;
- (void)setPersistentStores:(id)a3;
- (void)setValue:(id)a3 forUploadHeaderNamed:(id)a4;
- (void)setWriteTransaction:(id)a3;
- (void)setWriteTransactionTTL:(unint64_t)a3;
- (void)setWriteTransactionTTLTimer:(id)a3;
- (void)write:(id)a3 category:(id)a4 toStoreWithID:(id)a5 completion:(id)a6;
- (void)write:(id)a3 store:(id)a4 preferredBatchSize:(unint64_t)a5 completion:(id)a6;
@end

@implementation FLLogger

void __42__FLLogger__setupWriteTransactionTTLTimer__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v2, OS_LOG_TYPE_DEBUG, "Write transaction TTL timer fired.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _writeTransactionTTLTimerDidFire];
  }
}

- (void)_writeTransactionTTLTimerDidFire
{
  v3 = [(FLLogger *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_DEBUG, "Invalidating write transaction after TTL expiration.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  [(FLLogger *)self _relinquishWriteTransaction];
  [(FLLogger *)self _cancelWriteTransactionTTLTimer];
  os_unfair_lock_unlock(&self->_lock);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)_relinquishWriteTransaction
{
  if ([(id)objc_opt_class() isManagedProcess])
  {
    [(FLLogger *)self _cancelStoreCacheTimer];
    [(FLLogger *)self _cleanPersistantStores];
  }
  writeTransaction = self->_writeTransaction;
  self->_writeTransaction = 0;
}

+ (BOOL)isManagedProcess
{
  if (isManagedProcess_onceToken != -1) {
    dispatch_once(&isManagedProcess_onceToken, &__block_literal_global);
  }
  return isManagedProcess__isManagedProcess;
}

- (void)_cancelWriteTransactionTTLTimer
{
  v3 = [(FLLogger *)self writeTransactionTTLTimer];
  if (v3)
  {
    v4 = v3;
    dispatch_source_cancel(v3);
    [(FLLogger *)self setWriteTransactionTTLTimer:0];
    v3 = v4;
  }
}

- (OS_dispatch_source)writeTransactionTTLTimer
{
  return self->_writeTransactionTTLTimer;
}

- (void)setWriteTransactionTTLTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeTransactionTTLTimer, 0);
  objc_storeStrong((id *)&self->_writeTransaction, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_persistentStoreCacheTTLTimer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_persistentStores, 0);
  objc_storeStrong((id *)&self->_dbConnections, 0);
}

- (void)setWriteTransactionTTL:(unint64_t)a3
{
  self->_writeTransactionTTL = a3;
}

- (unint64_t)writeTransactionTTL
{
  return self->_writeTransactionTTL;
}

- (void)setWriteTransaction:(id)a3
{
}

- (BOOL)isHoldingWriteTransaction
{
  return self->_isHoldingWriteTransaction;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setPersistentStoreCacheTTLTimer:(id)a3
{
}

- (OS_dispatch_source)persistentStoreCacheTTLTimer
{
  return self->_persistentStoreCacheTTLTimer;
}

- (void)setLog:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (FLLoggingContext)context
{
  return self->_context;
}

- (void)setPersistentStores:(id)a3
{
}

- (NSMutableDictionary)persistentStores
{
  return self->_persistentStores;
}

- (void)setDbConnections:(id)a3
{
}

- (NSMutableDictionary)dbConnections
{
  return self->_dbConnections;
}

- (void)report:(id)a3 application:(id)a4 onComplete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __42__FLLogger_report_application_onComplete___block_invoke;
  v19 = &unk_1E6208898;
  objc_copyWeak(&v22, &location);
  id v11 = v9;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  v13 = _Block_copy(&v16);
  v14 = -[FLLogger categoryForSiriPayload:autoBugCaptureBlock:](self, "categoryForSiriPayload:autoBugCaptureBlock:", v12, v13, v16, v17, v18, v19);
  v15 = [(FLLogger *)self siriStoreIdForBundleId:v11];
  [(FLLogger *)self write:v12 category:v14 toStoreWithID:v15 completion:v10];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __42__FLLogger_report_application_onComplete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = [FLAutoBugHelper alloc];
  id v8 = [WeakRetained context];
  id v9 = [v8 autoBugCapture];
  id v10 = [(FLAutoBugHelper *)v7 initWithAutoBugCapture:v9 bundleID:*(void *)(a1 + 32) eventValue:*(void *)(a1 + 40)];

  if (v11) {
    [(FLAutoBugHelper *)v10 triggerABCWithSubtype:v5 additionalEventName:v11];
  }
  else {
    [(FLAutoBugHelper *)v10 triggerABCWithSubtype:v5];
  }
}

- (void)report:(id)a3 application:(id)a4
{
}

- (void)runOnStoreForBundleID:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FLLogger *)self context];
  id v9 = [v8 pathForStore:v6];

  id v10 = [(FLLogger *)self context];
  id v11 = [v10 queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__FLLogger_runOnStoreForBundleID_block___block_invoke;
  v15[3] = &unk_1E6208840;
  v15[4] = self;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v12 = v7;
  id v13 = v9;
  id v14 = v6;
  dispatch_sync(v11, v15);
}

void __40__FLLogger_runOnStoreForBundleID_block___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = [v2 siriStoreIdForBundleId:a1[5]];
  objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:storePath:", v3, 0, a1[6]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(a1[7] + 16))();
    v4 = v5;
  }
}

- (void)runOnStoreForBundleID:(id)a3 directoryPath:(id)a4 block:(id)a5
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = NSString;
  v24[0] = a4;
  v24[1] = @"data.sqlite";
  id v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = a4;
  id v13 = [v11 arrayWithObjects:v24 count:2];
  id v14 = [v10 pathWithComponents:v13];

  v15 = [(FLLogger *)self context];
  id v16 = [v15 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FLLogger_runOnStoreForBundleID_directoryPath_block___block_invoke;
  block[3] = &unk_1E6208840;
  block[4] = self;
  id v21 = v8;
  id v22 = v14;
  id v23 = v9;
  id v17 = v9;
  id v18 = v14;
  id v19 = v8;
  dispatch_sync(v16, block);
}

void __54__FLLogger_runOnStoreForBundleID_directoryPath_block___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = [v2 siriStoreIdForBundleId:a1[5]];
  objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:storePath:", v3, 0, a1[6]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(a1[7] + 16))();
    v4 = v5;
  }
}

- (void)reportDataPlatformSingleEvent:(id)a3 forBundleID:(id)a4 ofSchema:(id)a5 completion:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  if (!+[FLDPGBatchFactory allowDPGBundleID:v11])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = -9;
    goto LABEL_5;
  }
  if ((unint64_t)[v10 length] >= 0x1F0000)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = -5;
LABEL_5:
    id v16 = (void *)[v14 initWithDomain:@"FLErrorDomain" code:v15 userInfo:0];
    v13[2](v13, v16);

    goto LABEL_9;
  }
  id v17 = +[FLDPGBatchFactory makeBatchWithPayload:v10 bundleID:v11 schema:v12];
  id v18 = [v17 bundleID];
  v27 = v17;
  id v19 = [v17 payload];
  id v20 = (void *)os_transaction_create();
  id v21 = [(FLLogger *)self log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v18;
    __int16 v35 = 2048;
    uint64_t v36 = [v19 length];
    _os_log_debug_impl(&dword_1BA2B8000, v21, OS_LOG_TYPE_DEBUG, "Received persist data request for store (%@) for %lu bytes", buf, 0x16u);
  }

  id v22 = [(FLLogger *)self context];
  id v23 = [v22 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__FLLogger_reportDataPlatformSingleEvent_forBundleID_ofSchema_completion___block_invoke;
  block[3] = &unk_1E6208818;
  block[4] = self;
  id v29 = v18;
  id v30 = v19;
  id v31 = v20;
  v32 = v13;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  dispatch_async(v23, block);

LABEL_9:
}

void __74__FLLogger_reportDataPlatformSingleEvent_forBundleID_ofSchema_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "__dispatched_persistentStoreWithId:category:", *(void *)(a1 + 40), &unk_1F13BBA38);
  v3 = [v2 persistUploadPayload:*(void *)(a1 + 48)];

  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 48) length];
    id v8 = @"failed";
    int v9 = 138412802;
    uint64_t v10 = v6;
    if (!v3) {
      id v8 = @"completed successfully";
    }
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_debug_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_DEBUG, "Persist data request for store (%@) for %lu bytes %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 64);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
  }
}

- (void)reportDataPlatformBatchedEvent:(id)a3 forBundleID:(id)a4 ofSchema:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (+[FLDPGBatchFactory allowDPGBundleID:v11])
  {
    if ((unint64_t)[v10 length] < 0x80000)
    {
      uint64_t v15 = +[FLDPGBatchFactory makeBatchWithPayload:v10 bundleID:v11 schema:v12];
      id v16 = [v15 payload];
      id v17 = [v15 bundleID];
      id v18 = [(FLLogger *)self siriStoreIdForBundleId:v17];

      id v23 = [(FLLogger *)self writeTransaction];
      id v19 = [(FLLogger *)self log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v27 = v18;
        __int16 v28 = 2112;
        id v29 = &unk_1F13BBA38;
        __int16 v30 = 2048;
        uint64_t v31 = [v16 length];
        _os_log_debug_impl(&dword_1BA2B8000, v19, OS_LOG_TYPE_DEBUG, "Received persist request for store (%@, %@) for %lu bytes", buf, 0x20u);
      }

      id v20 = [(FLLogger *)self context];
      [v20 queue];
      v22 = id v21 = v16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__FLLogger_reportDataPlatformBatchedEvent_forBundleID_ofSchema_completion___block_invoke;
      block[3] = &unk_1E6208818;
      block[4] = self;
      void block[5] = v18;
      block[6] = v21;
      block[7] = v23;
      id v25 = v13;
      dispatch_async(v22, block);
    }
    else
    {
      [(FLLogger *)self reportDataPlatformSingleEvent:v10 forBundleID:v11 ofSchema:v12 completion:v13];
    }
  }
  else
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"FLErrorDomain" code:-9 userInfo:0];
    (*((void (**)(id, void *))v13 + 2))(v13, v14);
  }
}

void __75__FLLogger_reportDataPlatformBatchedEvent_forBundleID_ofSchema_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__dispatched_persistentStoreWithId:category:", *(void *)(a1 + 40), &unk_1F13BBA38);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)([v3 currentBatchEventCount] - 1000) < 0xFFFFFFFFFFFFFC17
    || (uint64_t v2 = [v3 currentBatchPayloadSize],
        (unint64_t)([*(id *)(a1 + 48) length] + v2) >= 0x1F0000))
  {
    [v3 initializeNewBatch];
  }
  [*(id *)(a1 + 32) write:*(void *)(a1 + 48) store:v3 preferredBatchSize:0x200000 completion:*(void *)(a1 + 64)];
}

- (void)reportDataUploadEvent:(id)a3 application:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)os_transaction_create();
  id v12 = [v10 data];

  id v13 = [(FLLogger *)self log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v8;
    __int16 v27 = 2048;
    uint64_t v28 = [v12 length];
    _os_log_debug_impl(&dword_1BA2B8000, v13, OS_LOG_TYPE_DEBUG, "Received persist data request for store (%@) for %lu bytes", buf, 0x16u);
  }

  id v14 = [(FLLogger *)self context];
  uint64_t v15 = [v14 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__FLLogger_reportDataUploadEvent_application_completion___block_invoke;
  block[3] = &unk_1E6208818;
  block[4] = self;
  id v21 = v8;
  id v23 = v11;
  id v24 = v9;
  id v22 = v12;
  id v16 = v11;
  id v17 = v9;
  id v18 = v12;
  id v19 = v8;
  dispatch_async(v15, block);
}

void __57__FLLogger_reportDataUploadEvent_application_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__dispatched_persistentStoreWithId:category:", *(void *)(a1 + 40), &unk_1F13BBA38);
  id v3 = [v2 persistUploadPayload:*(void *)(a1 + 48)];

  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 48) length];
    id v8 = @"failed";
    int v9 = 138412802;
    uint64_t v10 = v6;
    if (!v3) {
      id v8 = @"completed successfully";
    }
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_debug_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_DEBUG, "Persist data request for store (%@) for %lu bytes %@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 64);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
  }
}

- (id)dataUploadStoreIdForApplicationIdentifier:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)removeSiriInstrumentationObserver:(id)a3
{
  v4 = a3;
  uint64_t v5 = [(FLLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_DEBUG, "Removing siri instrumentation observer", v6, 2u);
  }

  dispatch_source_cancel(v4);
}

- (id)registerSiriInstrumentationObserver:(id)a3 observer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FLLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_DEBUG, "Registering new siri instrumentation observer", v12, 2u);
  }

  int v9 = [(FLLogger *)self siriReadingStoreForBundleID:v7];

  [(FLLogger *)self _cancelStoreCacheTimer];
  uint64_t v10 = [v9 registerInsertionObserver:v6];

  return v10;
}

- (void)reportSiriInstrumentationEvent:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)MEMORY[0x1BA9E8750]();
  uint64_t v12 = [v8 data];
  objc_initWeak(&location, self);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __66__FLLogger_reportSiriInstrumentationEvent_forBundleID_completion___block_invoke;
  id v21 = &unk_1E6208898;
  objc_copyWeak(&v24, &location);
  id v13 = v9;
  id v22 = v13;
  id v14 = v12;
  id v23 = v14;
  uint64_t v15 = _Block_copy(&v18);
  id v16 = -[FLLogger categoryForSiriPayload:autoBugCaptureBlock:](self, "categoryForSiriPayload:autoBugCaptureBlock:", v14, v15, v18, v19, v20, v21);
  id v17 = [(FLLogger *)self siriStoreIdForBundleId:v13];
  [(FLLogger *)self write:v14 category:v16 toStoreWithID:v17 completion:v10];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __66__FLLogger_reportSiriInstrumentationEvent_forBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = [FLAutoBugHelper alloc];
  id v8 = [WeakRetained context];
  id v9 = [v8 autoBugCapture];
  id v10 = [(FLAutoBugHelper *)v7 initWithAutoBugCapture:v9 bundleID:*(void *)(a1 + 32) eventValue:*(void *)(a1 + 40)];

  if (v11) {
    [(FLAutoBugHelper *)v10 triggerABCWithSubtype:v5 additionalEventName:v11];
  }
  else {
    [(FLAutoBugHelper *)v10 triggerABCWithSubtype:v5];
  }
}

- (id)siriReadingStoreForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [(FLLogger *)self context];
  id v6 = [v5 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FLLogger_siriReadingStoreForBundleID___block_invoke;
  block[3] = &unk_1E62087F0;
  id v11 = v4;
  uint64_t v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __40__FLLogger_siriReadingStoreForBundleID___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v6 = [v2 siriStoreIdForBundleId:a1[5]];
  uint64_t v3 = objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:", v6, 0);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)siriReadingStoreForBundleID:(id)a3 directoryPath:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v8 = NSString;
  v27[0] = v7;
  v27[1] = @"data.sqlite";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v10 = [v8 pathWithComponents:v9];

  id v11 = [(FLLogger *)self context];
  uint64_t v12 = [v11 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FLLogger_siriReadingStoreForBundleID_directoryPath___block_invoke;
  block[3] = &unk_1E62087C8;
  block[4] = self;
  id v18 = v6;
  id v19 = v10;
  id v20 = &v21;
  id v13 = v10;
  id v14 = v6;
  dispatch_sync(v12, block);

  id v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __54__FLLogger_siriReadingStoreForBundleID_directoryPath___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v6 = [v2 siriStoreIdForBundleId:a1[5]];
  uint64_t v3 = objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:storePath:", v6, 0, a1[6]);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)siriWritingStoreForBundleID:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v8 = [(FLLogger *)self context];
  id v9 = [v8 queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__FLLogger_siriWritingStoreForBundleID_category___block_invoke;
  v14[3] = &unk_1E62087C8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v17 = &v18;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, v14);

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __49__FLLogger_siriWritingStoreForBundleID_category___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v6 = [v2 siriStoreIdForBundleId:a1[5]];
  uint64_t v3 = objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:", v6, a1[6]);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)siriStoreIdForBundleId:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)categoryForSiriPayload:(id)a3 autoBugCaptureBlock:(id)a4
{
  id v6 = (void (**)(id, __CFString *, void))a4;
  id v7 = a3;
  if (![v7 length]) {
    v6[2](v6, @"AnyEventTypePayloadSizeZero", 0);
  }
  id v8 = (void *)[(id)objc_opt_new() initWithData:v7];

  if (v8)
  {
    id v9 = [(FLLogger *)self readSiriCategoryFrom:v8 recursive:1 autoBugCaptureBlock:v6];
  }
  else
  {
    v6[2](v6, @"AnyEventTypeReaderNil", 0);
    id v9 = 0;
  }

  return v9;
}

- (id)readSiriCategoryFrom:(id)a3 recursive:(BOOL)a4 autoBugCaptureBlock:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = (char *)a5;
  uint64_t v9 = 0;
  v52 = 0;
  char v51 = 0;
  id v10 = @"AnyEventTypeFoundButValueSizeZero_nonrecursive";
  id v11 = v8 + 16;
  if (v6) {
    id v10 = @"AnyEventTypeFoundButValueSizeZero_recursive";
  }
  v50 = v10;
  id v12 = (int *)MEMORY[0x1E4F940E8];
  id v13 = (int *)MEMORY[0x1E4F940E0];
  id v14 = (int *)MEMORY[0x1E4F940C8];
  id v15 = (int *)MEMORY[0x1E4F940B8];
  char v53 = 1;
  char v16 = 1;
  do
  {
    if (*(void *)&v7[*v12] >= *(void *)&v7[*v13] || v7[*v14]) {
      break;
    }
    char v17 = 0;
    unsigned int v18 = 0;
    unint64_t v19 = 0;
    do
    {
      uint64_t v20 = *v12;
      unint64_t v21 = *(void *)&v7[v20];
      if (v21 == -1 || v21 >= *(void *)&v7[*v13])
      {
        v7[*v14] = 1;
LABEL_15:
        if (!v7[*v14]) {
          goto LABEL_16;
        }
LABEL_45:
        if (v6) {
          __int16 v35 = @"AnyEventTypeReaderHasError_recursive";
        }
        else {
          __int16 v35 = @"AnyEventTypeReaderHasError_nonrecursive";
        }
        (*((void (**)(char *, __CFString *, void))v8 + 2))(v8, v35, 0);
        goto LABEL_49;
      }
      char v22 = *(unsigned char *)(*(void *)&v7[*v15] + v21);
      *(void *)&v7[v20] = v21 + 1;
      v19 |= (unint64_t)(v22 & 0x7F) << v17;
      if ((v22 & 0x80) == 0) {
        goto LABEL_15;
      }
      v17 += 7;
      BOOL v23 = v18++ >= 9;
    }
    while (!v23);
    unint64_t v19 = 0;
    if (v7[*v14]) {
      goto LABEL_45;
    }
LABEL_16:
    if ((v19 & 7) == 4) {
      break;
    }
    if ((v19 >> 3) == 2)
    {
      if (!v6)
      {
        if (PBReaderSkipValueWithTag()) {
          continue;
        }
        (*((void (**)(char *, __CFString *, void))v8 + 2))(v8, @"PayloadFoundButValueSizeZero_nonrecursive", 0);
LABEL_92:
        v46 = 0;
        goto LABEL_79;
      }
      BOOL v30 = v6;
      uint64_t v31 = v11;
      uint64_t v32 = v8;
      uint64_t v33 = PBReaderReadData();

      if (!v9) {
        (*((void (**)(char *, __CFString *, void))v32 + 2))(v32, @"PayloadFoundButValueSizeZero_recursive", 0);
      }
      char v53 = 0;
      v52 = (void *)v33;
      id v8 = v32;
      id v11 = v31;
      BOOL v6 = v30;
      id v14 = (int *)MEMORY[0x1E4F940C8];
    }
    else
    {
      if ((v19 >> 3) == 1)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v9 = 0;
        while (1)
        {
          uint64_t v26 = *v12;
          unint64_t v27 = *(void *)&v7[v26];
          if (v27 == -1 || v27 >= *(void *)&v7[*v13]) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)&v7[*v15] + v27);
          *(void *)&v7[v26] = v27 + 1;
          v9 |= (unint64_t)(v28 & 0x7F) << v24;
          if ((v28 & 0x80) == 0) {
            goto LABEL_33;
          }
          v24 += 7;
          if (v25++ > 8) {
            goto LABEL_38;
          }
        }
        v7[*v14] = 1;
LABEL_33:
        if (v7[*v14]) {
          BOOL v34 = 1;
        }
        else {
          BOOL v34 = v9 == 0;
        }
        if (v34)
        {
LABEL_38:
          (*((void (**)(char *, __CFString *, void))v8 + 2))(v8, v50, 0);
          uint64_t v9 = 0;
        }
        if (v6)
        {
          char v16 = 0;
          char v51 = 1;
          continue;
        }
LABEL_78:
        v46 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
        goto LABEL_79;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        if (v6) {
          v48 = @"SkipTagButValueSizeZero_recursive";
        }
        else {
          v48 = @"SkipTagButValueSizeZero_nonrecursive";
        }
        (*((void (**)(char *, __CFString *, void))v8 + 2))(v8, v48, 0);
        goto LABEL_92;
      }
    }
  }
  while ((v16 & 1) != 0 || (v53 & 1) != 0);
LABEL_49:
  if ((v51 & 1) == 0)
  {
    if (v6) {
      uint64_t v36 = @"AnyEventTypeNeverFound_recursive";
    }
    else {
      uint64_t v36 = @"AnyEventTypeNeverFound_nonrecursive";
    }
    (*((void (**)(char *, __CFString *, void))v8 + 2))(v8, v36, 0);
  }
  if (!v6 || v9 != 6) {
    goto LABEL_78;
  }
  uint64_t v37 = (unsigned char *)[(id)objc_opt_new() initWithData:v52];
  while (1)
  {
    if (*(void *)&v37[*v12] >= *(void *)&v37[*v13] || v37[*v14]) {
      goto LABEL_77;
    }
    char v38 = 0;
    unsigned int v39 = 0;
    unint64_t v40 = 0;
    while (1)
    {
      uint64_t v41 = *v12;
      unint64_t v42 = *(void *)&v37[v41];
      if (v42 == -1 || v42 >= *(void *)&v37[*v13]) {
        break;
      }
      char v43 = *(unsigned char *)(*(void *)&v37[*v15] + v42);
      *(void *)&v37[v41] = v42 + 1;
      v40 |= (unint64_t)(v43 & 0x7F) << v38;
      if ((v43 & 0x80) == 0) {
        goto LABEL_67;
      }
      v38 += 7;
      BOOL v23 = v39++ >= 9;
      if (v23)
      {
        unint64_t v40 = 0;
        int v44 = v37[*v14];
        goto LABEL_69;
      }
    }
    v37[*v14] = 1;
LABEL_67:
    int v44 = v37[*v14];
    if (v37[*v14]) {
      unint64_t v40 = 0;
    }
LABEL_69:
    if (v44)
    {
      v45 = [(FLLogger *)self log];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BA2B8000, v45, OS_LOG_TYPE_ERROR, "Error with PBReader with payload having outer event AnyOrderedEventType", buf, 2u);
      }

LABEL_77:
      (*((void (**)(char *, __CFString *, void))v8 + 2))(v8, @"InnerAnyEventTypeNeverFound", 0);

      goto LABEL_78;
    }
    if ((v40 & 7) == 4) {
      goto LABEL_77;
    }
    if ((v40 >> 3) == 2) {
      break;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0)
    {
      (*((void (**)(char *, __CFString *, void))v8 + 2))(v8, @"InnerSkipTagButValueSizeZero", 0);
      goto LABEL_89;
    }
  }
  *(void *)buf = 0;
  uint64_t v55 = 0;
  if (PBReaderPlaceMark())
  {
    v46 = [(FLLogger *)self readSiriCategoryFrom:v37 recursive:0 autoBugCaptureBlock:v8];
    goto LABEL_90;
  }
  (*((void (**)(char *, __CFString *, void))v8 + 2))(v8, @"InnerAnyEventTypeFoundButPlaceMarkError", 0);
LABEL_89:
  v46 = 0;
LABEL_90:

LABEL_79:
  return v46;
}

- (void)reportParsecFeedback:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v9 = [a3 data];
  id v7 = [(FLLogger *)self parsecCategoryForPayload:v9];
  id v8 = [(FLLogger *)self parsecStoreId];
  [(FLLogger *)self write:v9 category:v7 toStoreWithID:v8 completion:v6];
}

- (id)parsecPersistentStoreForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v5 = [(FLLogger *)self context];
  id v6 = [v5 queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__FLLogger_parsecPersistentStoreForBundleID___block_invoke;
  v9[3] = &unk_1E62087A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __45__FLLogger_parsecPersistentStoreForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = [v2 parsecStoreId];
  uint64_t v3 = objc_msgSend(v2, "__dispatched_persistentStoreWithId:category:", v6, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)parsecCategoryForPayload:(id)a3
{
  return 0;
}

- (id)parsecStoreId
{
  return @"com.apple.parsec.feedbackv2";
}

- (void)write:(id)a3 category:(id)a4 toStoreWithID:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(FLLogger *)self writeTransaction];
  id v15 = [(FLLogger *)self log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2048;
    uint64_t v33 = [v10 length];
    _os_log_debug_impl(&dword_1BA2B8000, v15, OS_LOG_TYPE_DEBUG, "Received persist request for store (%@, %@) for %lu bytes", buf, 0x20u);
  }

  char v16 = [(FLLogger *)self context];
  char v17 = [v16 queue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__FLLogger_write_category_toStoreWithID_completion___block_invoke;
  v22[3] = &unk_1E6208778;
  v22[4] = self;
  id v23 = v12;
  id v24 = v11;
  id v25 = v10;
  uint64_t v26 = v14;
  id v27 = v13;
  id v18 = v13;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  dispatch_async(v17, v22);
}

void __52__FLLogger_write_category_toStoreWithID_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__dispatched_persistentStoreWithId:category:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) write:*(void *)(a1 + 56) store:v2 preferredBatchSize:0 completion:*(void *)(a1 + 72)];
}

- (void)write:(id)a3 store:(id)a4 preferredBatchSize:(unint64_t)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  id v13 = [(FLLogger *)self context];
  if ([v13 persistenceConfiguration] == 1)
  {
    id v14 = [(FLLogger *)self context];
    char v15 = [v14 deviceUnlockedSinceBoot];

    if ((v15 & 1) == 0)
    {
      char v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = -10;
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (v11)
  {
    uint64_t v18 = [v11 persist:v10 preferredBatchSize:a5];
    goto LABEL_9;
  }
  char v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = -8;
LABEL_8:
  uint64_t v18 = [v16 errorWithDomain:@"FLErrorDomain" code:v17 userInfo:0];
LABEL_9:
  id v19 = (void *)v18;
  id v20 = [(FLLogger *)self log];
  id v21 = v20;
  if (v19)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    char v22 = [v11 storeIdentifier];
    int v23 = 138412802;
    id v24 = v22;
    __int16 v25 = 2048;
    uint64_t v26 = [v10 length];
    __int16 v27 = 2112;
    char v28 = v19;
    _os_log_error_impl(&dword_1BA2B8000, v21, OS_LOG_TYPE_ERROR, "Persist request for store (%@) for %lu bytes failed with error %@.", (uint8_t *)&v23, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    char v22 = [v11 storeIdentifier];
    int v23 = 138412546;
    id v24 = v22;
    __int16 v25 = 2048;
    uint64_t v26 = [v10 length];
    _os_log_debug_impl(&dword_1BA2B8000, v21, OS_LOG_TYPE_DEBUG, "Persist request for store (%@) for %lu bytes completed successfully.", (uint8_t *)&v23, 0x16u);
  }

LABEL_13:
  if (v12) {
    v12[2](v12, v19);
  }
}

- (void)scheduleImmediateUpload
{
  uint64_t v3 = [(FLLogger *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_INFO, "Immediate upload requested. Requesting stores be closed.", buf, 2u);
  }
  [(FLLogger *)self closeAllStores];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  id v5 = [(FLLogger *)self context];
  id v6 = [v5 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FLLogger_scheduleImmediateUpload__block_invoke;
  block[3] = &unk_1E62089D8;
  id v9 = v3;
  id v7 = v3;
  dispatch_after(v4, v6, block);
}

uint64_t __35__FLLogger_scheduleImmediateUpload__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1BA2B8000, v1, OS_LOG_TYPE_INFO, "Telling FBF to upload immediately.", v3, 2u);
  }
  return notify_post((const char *)[@"com.apple.parsec-fbf.FLUploadImmediately" UTF8String]);
}

- (id)uploadHeaders
{
  id v2 = [(FLLogger *)self context];
  uint64_t v3 = [v2 userDefaults];
  dispatch_time_t v4 = [v3 objectForKey:@"FLUploadHeaders"];

  return v4;
}

- (void)setValue:(id)a3 forUploadHeaderNamed:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(FLLogger *)self context];
  id v8 = [v7 userDefaults];

  id v9 = [v8 objectForKey:@"FLUploadHeaders"];
  id v10 = v9;
  if (v9)
  {
    id v11 = (void *)[v9 mutableCopy];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v12 = v11;
  if (v13) {
    [v11 setObject:v13 forKey:v6];
  }
  else {
    [v11 removeObjectForKey:v6];
  }
  [v8 setObject:v12 forKey:@"FLUploadHeaders"];
}

- (void)_closeAllStores
{
  uint64_t v3 = [(FLLogger *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_DEBUG, "Closing all stores", v7, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(FLLogger *)self persistentStores];
  [v5 removeAllObjects];

  id v6 = [(FLLogger *)self dbConnections];
  [v6 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (void)closeOpenBatchesAndStores
{
  uint64_t v3 = [(FLLogger *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_INFO, "Received notification to close all stores and any open batches, closing", buf, 2u);
  }

  dispatch_time_t v4 = [(FLLogger *)self context];
  id v5 = [v4 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__FLLogger_closeOpenBatchesAndStores__block_invoke;
  block[3] = &unk_1E62089D8;
  void block[4] = self;
  dispatch_async(v5, block);
}

void __37__FLLogger_closeOpenBatchesAndStores__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) persistentStores];
  uint64_t v3 = [v2 allValues];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "forceCloseOpenBatches", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 32) _closeAllStores];
}

- (void)closeAllStores
{
  uint64_t v3 = [(FLLogger *)self context];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__FLLogger_closeAllStores__block_invoke;
  block[3] = &unk_1E62089D8;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __26__FLLogger_closeAllStores__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeAllStores];
}

- (void)_cancelStoreCacheTimer
{
  uint64_t v3 = [(FLLogger *)self persistentStoreCacheTTLTimer];

  if (v3)
  {
    id v4 = [(FLLogger *)self persistentStoreCacheTTLTimer];
    dispatch_source_cancel(v4);

    [(FLLogger *)self setPersistentStoreCacheTTLTimer:0];
  }
}

- (void)_scheduleStoreCacheTimer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FLLogger *)self context];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  [(FLLogger *)self _setupStoreCacheTimer];
  uint64_t v5 = [(FLLogger *)self _nextStoreCacheTimerFireDate];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  char v7 = [v5 isEqualToDate:v6];

  if ((v7 & 1) == 0)
  {
    [v5 timeIntervalSinceNow];
    double v9 = v8;
    objc_initWeak(&location, self);
    if (v9 <= 0.0)
    {
      id v13 = [(FLLogger *)self context];
      uint64_t v14 = [v13 queue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __36__FLLogger__scheduleStoreCacheTimer__block_invoke;
      v15[3] = &unk_1E6208750;
      objc_copyWeak(&v16, &location);
      dispatch_async(v14, v15);

      objc_destroyWeak(&v16);
    }
    else
    {
      long long v10 = [(FLLogger *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v19 = v9;
        _os_log_debug_impl(&dword_1BA2B8000, v10, OS_LOG_TYPE_DEBUG, "Scheduling store cache TTL timer for %f seconds from now.", buf, 0xCu);
      }

      long long v11 = [(FLLogger *)self persistentStoreCacheTTLTimer];
      dispatch_time_t v12 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
    objc_destroyWeak(&location);
  }
}

void __36__FLLogger__scheduleStoreCacheTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanPersistantStores];
    id WeakRetained = v2;
  }
}

- (void)_setupStoreCacheTimer
{
  uint64_t v3 = [(FLLogger *)self context];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(FLLogger *)self persistentStoreCacheTTLTimer];

  if (!v5)
  {
    uint64_t v6 = [(FLLogger *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1BA2B8000, v6, OS_LOG_TYPE_DEBUG, "Creating new store cache TTL timer", (uint8_t *)location, 2u);
    }

    char v7 = [(FLLogger *)self context];
    double v8 = [v7 queue];
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);
    [(FLLogger *)self setPersistentStoreCacheTTLTimer:v9];

    objc_initWeak(location, self);
    long long v10 = [(FLLogger *)self persistentStoreCacheTTLTimer];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __33__FLLogger__setupStoreCacheTimer__block_invoke;
    char v15 = &unk_1E6208700;
    id v16 = self;
    objc_copyWeak(&v17, location);
    dispatch_source_set_event_handler(v10, &v12);

    long long v11 = [(FLLogger *)self persistentStoreCacheTTLTimer];
    dispatch_activate(v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
}

void __33__FLLogger__setupStoreCacheTimer__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v2, OS_LOG_TYPE_DEBUG, "Store cache TTL timer fired.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_debug_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_DEBUG, "Purging persistent store cache after inactivity", v6, 2u);
    }

    [v4 _cancelStoreCacheTimer];
    [v4 _cleanPersistantStores];
  }
}

- (id)_nextStoreCacheTimerFireDate
{
  uint64_t v3 = [(FLLogger *)self context];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(FLLogger *)self persistentStores];
  uint64_t v6 = [v5 keyEnumerator];

  char v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v8 = [v6 nextObject];
  if (v8)
  {
    dispatch_source_t v9 = (void *)v8;
    while (1)
    {
      long long v10 = [(FLLogger *)self persistentStores];
      long long v11 = [v10 objectForKeyedSubscript:v9];

      uint64_t v12 = [v11 currentBatchCreationDate];
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F1C9C8] date];
      }
      char v15 = v14;

      [v11 batchMaximumDuration];
      id v16 = objc_msgSend(v15, "dateByAddingTimeInterval:");
      id v17 = [v16 earlierDate:v7];

      [v17 timeIntervalSinceNow];
      if (v18 <= 0.0) {
        break;
      }

      uint64_t v19 = [v6 nextObject];

      dispatch_source_t v9 = (void *)v19;
      char v7 = v17;
      if (!v19) {
        goto LABEL_10;
      }
    }
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  else
  {
    id v17 = v7;
LABEL_10:
    id v17 = v17;
    uint64_t v20 = v17;
  }

  return v20;
}

- (void)_cleanPersistantStores
{
  uint64_t v3 = [(FLLogger *)self context];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(FLLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v21 = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_DEBUG, "Closing all open database connections.", v21, 2u);
  }

  uint64_t v6 = [(FLLogger *)self persistentStores];
  char v7 = [v6 keyEnumerator];

  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    dispatch_source_t v9 = (void *)v8;
    do
    {
      long long v10 = [(FLLogger *)self persistentStores];
      long long v11 = [v10 objectForKeyedSubscript:v9];

      uint64_t v12 = [v11 currentBatchCreationDate];
      [v11 batchMaximumDuration];
      uint64_t v13 = objc_msgSend(v12, "dateByAddingTimeInterval:");
      [v13 timeIntervalSinceNow];
      double v15 = v14;

      if (v15 <= 0.0)
      {
        id v16 = [(FLLogger *)self persistentStores];
        id v17 = [v16 objectForKeyedSubscript:v9];
        [v17 closeOpenBatch];
      }
      uint64_t v18 = [v7 nextObject];

      dispatch_source_t v9 = (void *)v18;
    }
    while (v18);
  }
  uint64_t v19 = [(FLLogger *)self persistentStores];
  [v19 removeAllObjects];

  uint64_t v20 = [(FLLogger *)self dbConnections];
  [v20 removeAllObjects];

  [(FLLogger *)self _cancelStoreCacheTimer];
}

- (void)closeStoreForApplicationFromNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:@"bundleIdentifier"];

  uint64_t v5 = v6;
  if (v6)
  {
    [(FLLogger *)self closeStoreForBundleID:v6];
    uint64_t v5 = v6;
  }
}

- (void)closeStoreForBundleID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FLLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_debug_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_DEBUG, "Received notification to close stores for %@", buf, 0xCu);
  }

  id v6 = (void *)os_transaction_create();
  char v7 = [(FLLogger *)self context];
  uint64_t v8 = [v7 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__FLLogger_closeStoreForBundleID___block_invoke;
  block[3] = &unk_1E6208728;
  id v12 = v4;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v4;
  dispatch_async(v8, block);
}

void __34__FLLogger_closeStoreForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"%@-", *(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) persistentStores];
  id v4 = [v3 allKeys];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 hasPrefix:v2])
        {
          long long v11 = [*(id *)(a1 + 40) persistentStores];
          id v12 = [v11 objectForKeyedSubscript:v10];
          [v12 closeOpenBatch];

          uint64_t v13 = [*(id *)(a1 + 40) persistentStores];
          [v13 removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)__dispatched_persistentStoreWithId:(id)a3 category:(id)a4 storePath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(FLLogger *)self context];
  id v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  if (v9)
  {
    id v13 = [NSString stringWithFormat:@"%@-%@", v8, v9];
  }
  else
  {
    id v13 = v8;
  }
  long long v14 = v13;
  long long v15 = [(FLLogger *)self persistentStores];
  long long v16 = [v15 objectForKeyedSubscript:v14];

  [(FLLogger *)self _scheduleStoreCacheTimer];
  if (v16)
  {
    long long v17 = v16;
  }
  else
  {
    uint64_t v18 = [(FLLogger *)self __dispatched_databaseConnectionWithStorePath:v10];
    if (v18)
    {
      uint64_t v19 = [FLSQLitePersistence alloc];
      uint64_t v20 = [(FLLogger *)self context];
      id v21 = [(FLSQLitePersistence *)v19 initWithStoreId:v8 dbConnection:v18 loggingContext:v20];

      char v22 = [(FLLogger *)self persistentStores];
      [v22 setObject:v21 forKeyedSubscript:v14];

      long long v17 = v21;
    }
    else
    {
      long long v17 = 0;
    }
  }
  return v17;
}

- (id)__dispatched_persistentStoreWithId:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FLLogger *)self context];
  id v9 = [v8 queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(FLLogger *)self context];
  long long v11 = [v10 pathForStore:v7];

  id v12 = [(FLLogger *)self __dispatched_persistentStoreWithId:v7 category:v6 storePath:v11];

  return v12;
}

- (id)__dispatched_databaseConnectionWithStorePath:(id)a3
{
  id v4 = a3;
  id v5 = [(FLLogger *)self context];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = v4;
    id v8 = [(FLLogger *)self dbConnections];
    id v9 = [v8 objectForKeyedSubscript:v7];

    if (!v9)
    {
      id v9 = [[FLSQLiteDatabaseConnection alloc] initWithStorePath:v7];
      id v10 = [(FLLogger *)self dbConnections];
      [v10 setObject:v9 forKeyedSubscript:v7];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)cancelWriteTransactionTTLTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(FLLogger *)self _cancelWriteTransactionTTLTimer];
  os_unfair_lock_unlock(p_lock);
}

- (void)_scheduleWriteTransactionTTLTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  writeTransactionTTLTimer = self->_writeTransactionTTLTimer;
  id v4 = [(FLLogger *)self log];
  id v5 = v4;
  if (writeTransactionTTLTimer)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134217984;
      unint64_t v9 = [(FLLogger *)self writeTransactionTTL];
      _os_log_debug_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_DEBUG, "Scheduling the write transaction TTL timer for %lu seconds from now.", (uint8_t *)&v8, 0xCu);
    }

    id v6 = self->_writeTransactionTTLTimer;
    dispatch_time_t v7 = dispatch_walltime(0, 1000000000 * [(FLLogger *)self writeTransactionTTL]);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_ERROR, "TTL timer scheduling was requested, but no timer was found.", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_setupWriteTransactionTTLTimer
{
  uint64_t v3 = [(FLLogger *)self context];
  id v4 = [v3 queue];
  id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  writeTransactionTTLTimer = self->_writeTransactionTTLTimer;
  self->_writeTransactionTTLTimer = v5;

  objc_initWeak(&location, self);
  dispatch_time_t v7 = [(FLLogger *)self writeTransactionTTLTimer];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__FLLogger__setupWriteTransactionTTLTimer__block_invoke;
  handler[3] = &unk_1E6208700;
  handler[4] = self;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, handler);

  dispatch_activate((dispatch_object_t)self->_writeTransactionTTLTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (FLWriteTransaction)writeTransaction
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (![(FLLogger *)self _isHoldingWriteTransaction])
  {
    id v4 = [(FLLogger *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)dispatch_time_t v7 = 0;
      _os_log_debug_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_DEBUG, "Initializing new write transaction.", v7, 2u);
    }

    [(FLLogger *)self _claimWriteTransaction];
    [(FLLogger *)self _setupWriteTransactionTTLTimer];
  }
  [(FLLogger *)self _scheduleWriteTransactionTTLTimer];
  id v5 = self->_writeTransaction;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)_claimWriteTransaction
{
  self->_writeTransaction = objc_alloc_init(FLWriteTransaction);
  MEMORY[0x1F41817F8]();
}

- (BOOL)_isHoldingWriteTransaction
{
  return self->_writeTransaction != 0;
}

- (FLLogger)initWithPersistenceConfiguration:(unint64_t)a3
{
  id v5 = [FLLoggingContext alloc];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  dispatch_time_t v7 = [(FLLoggingContext *)v5 initWithFileManager:v6 persistenceConfiguration:a3];

  int v8 = [(FLLogger *)self initWithContext:v7];
  return v8;
}

- (void)dealloc
{
  [(FLLogger *)self _closeAllStores];
  [(NSDistributedNotificationCenter *)self->_notificationCenter removeObserver:self];
  [(FLLogger *)self _cancelStoreCacheTimer];
  [(FLLogger *)self cancelWriteTransactionTTLTimer];
  v3.receiver = self;
  v3.super_class = (Class)FLLogger;
  [(FLLogger *)&v3 dealloc];
}

- (FLLogger)initWithContext:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FLLogger;
  id v6 = [(FLLogger *)&v17 init];
  dispatch_time_t v7 = v6;
  if (FLSignpostLoggingInit_onceToken != -1)
  {
    dispatch_once(&FLSignpostLoggingInit_onceToken, &__block_literal_global_640);
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    int v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    persistentStores = v7->_persistentStores;
    v7->_persistentStores = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dbConnections = v7->_dbConnections;
    v7->_dbConnections = v10;

    uint64_t v12 = flLogForObject(v7);
    log = v7->_log;
    v7->_log = (OS_os_log *)v12;

    objc_storeStrong((id *)&v7->_context, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_writeTransactionTTL = 5;
    uint64_t v14 = [MEMORY[0x1E4F28C40] defaultCenter];
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = (NSDistributedNotificationCenter *)v14;

    [(NSDistributedNotificationCenter *)v7->_notificationCenter addObserver:v7 selector:sel_closeOpenBatchesAndStores name:@"FLCloseAllStores" object:0];
    [(NSDistributedNotificationCenter *)v7->_notificationCenter addObserver:v7 selector:sel_closeStoreForApplicationFromNotification_ name:@"FLCloseStore" object:0];
  }
LABEL_4:

  return v7;
}

+ (id)fixedCategoryForBundleID:(id)a3
{
  if (+[FLDPGBatchFactory isDPGBundleID:a3]) {
    return &unk_1F13BBA38;
  }
  else {
    return 0;
  }
}

+ (id)sharedLoggerWithPersistenceConfiguration:(unint64_t)a3
{
  if (sharedLoggerWithPersistenceConfiguration__onceToken != -1) {
    dispatch_once(&sharedLoggerWithPersistenceConfiguration__onceToken, &__block_literal_global_29);
  }
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  os_unfair_lock_lock((os_unfair_lock_t)&sharedLoggerWithPersistenceConfiguration__lock);
  id v6 = [(id)sharedLoggerWithPersistenceConfiguration__sharedLoggersByConfiguration objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = (void *)[objc_alloc((Class)a1) initWithPersistenceConfiguration:a3];
    [(id)sharedLoggerWithPersistenceConfiguration__sharedLoggersByConfiguration setObject:v6 forKeyedSubscript:v5];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedLoggerWithPersistenceConfiguration__lock);

  return v6;
}

uint64_t __53__FLLogger_sharedLoggerWithPersistenceConfiguration___block_invoke()
{
  sharedLoggerWithPersistenceConfiguration__lock = 0;
  sharedLoggerWithPersistenceConfiguration__sharedLoggersByConfiguration = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedLogger
{
  return (id)[a1 sharedLoggerWithPersistenceConfiguration:0];
}

void __28__FLLogger_isManagedProcess__block_invoke()
{
  id v0 = [MEMORY[0x1E4F963E8] currentProcess];
  isManagedProcess__isManagedProcess = [v0 isManaged];
}

@end
@interface MSASAssetTransferer
- (BOOL)MMCSEngine:(id)a3 shouldLogAtLogLevel:(int)a4;
- (BOOL)hasShutDown;
- (MMCSEngine)engine;
- (MSASAssetTransferer)initWithPersonID:(id)a3;
- (MSASAssetTransferer)initWithPersonID:(id)a3 eventQueue:(id)a4;
- (MSASPersonModel)model;
- (MSAlbumSharingDaemon)daemon;
- (MSBackoffManager)backoffManager;
- (NSString)focusAlbumGUID;
- (NSString)focusAssetCollectionGUID;
- (NSString)personID;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_queue)workQueue;
- (double)maxMMCSTokenValidityTimeInterval;
- (double)workQueueMaxMMCSTokenValidityTimeInterval;
- (id)_MMCSTokenTooOldError;
- (id)_canceledError;
- (id)_missingMMCSTokenError;
- (id)_missingURLError;
- (id)_pathForPersonID:(id)a3;
- (id)delegate;
- (int)maxBatchCount;
- (int)maxRetryCount;
- (unint64_t)workQueueNextItemID;
- (void)MMCSEngine:(id)a3 logMessage:(id)a4 logLevel:(int)a5;
- (void)MMCSEngine:(id)a3 logPerformanceMetrics:(id)a4;
- (void)_rereadPerformanceLoggingSetting;
- (void)_sendDidIdleNotification;
- (void)cancelCompletionBlock:(id)a3;
- (void)retryOutstandingActivities;
- (void)setBackoffManager:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setFocusAlbumGUID:(id)a3;
- (void)setFocusAssetCollectionGUID:(id)a3;
- (void)setHasShutDown:(BOOL)a3;
- (void)setMaxBatchCount:(int)a3;
- (void)setMaxMMCSTokenValidityTimeInterval:(double)a3;
- (void)setMaxRetryCount:(int)a3;
- (void)setModel:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
- (void)stopCompletionBlock:(id)a3;
- (void)workQueueShutDownCompletionBlock:(id)a3;
- (void)workQueueStop;
@end

@implementation MSASAssetTransferer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_focusAssetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_focusAlbumGUID, 0);
  objc_destroyWeak((id *)&self->_backoffManager);
  objc_destroyWeak((id *)&self->_model);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_destroyWeak(&self->_delegate);
}

- (void)setHasShutDown:(BOOL)a3
{
  self->_hasShutDown = a3;
}

- (BOOL)hasShutDown
{
  return self->_hasShutDown;
}

- (void)setEventQueue:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)focusAssetCollectionGUID
{
  return self->_focusAssetCollectionGUID;
}

- (NSString)focusAlbumGUID
{
  return self->_focusAlbumGUID;
}

- (void)setMaxRetryCount:(int)a3
{
  self->_maxRetryCount = a3;
}

- (int)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxBatchCount:(int)a3
{
  self->_maxBatchCount = a3;
}

- (int)maxBatchCount
{
  return self->_maxBatchCount;
}

- (void)setBackoffManager:(id)a3
{
}

- (MSBackoffManager)backoffManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backoffManager);
  return (MSBackoffManager *)WeakRetained;
}

- (void)setModel:(id)a3
{
}

- (MSASPersonModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (MSASPersonModel *)WeakRetained;
}

- (void)setDaemon:(id)a3
{
}

- (MSAlbumSharingDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (MSAlbumSharingDaemon *)WeakRetained;
}

- (double)maxMMCSTokenValidityTimeInterval
{
  return self->_maxMMCSTokenValidityTimeInterval;
}

- (MMCSEngine)engine
{
  return self->_engine;
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)MMCSEngine:(id)a3 logPerformanceMetrics:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138543618;
    v7 = self;
    __int16 v8 = 2114;
    id v9 = a4;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)MMCSEngine:(id)a3 logMessage:(id)a4 logLevel:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  MSASPlatform();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v8 = [(MSASAssetTransferer *)self personID];
  [v9 logLevel:v5, v8, 0, @"%@", v7 personID albumGUID format];
}

- (BOOL)MMCSEngine:(id)a3 shouldLogAtLogLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = MSASPlatform();
  LOBYTE(v4) = [v5 shouldLogAtLevel:v4];

  return v4;
}

- (void)_sendDidIdleNotification
{
  v3 = [(MSASAssetTransferer *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MSASAssetTransferer__sendDidIdleNotification__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__MSASAssetTransferer__sendDidIdleNotification__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MSASAssetTransfererDidIdle" object:*(void *)(a1 + 32)];
}

- (id)_canceledError
{
  if (_canceledError_onceToken_6140 != -1) {
    dispatch_once(&_canceledError_onceToken_6140, &__block_literal_global_37_6141);
  }
  id v2 = (void *)_canceledError_error_6142;
  return v2;
}

void __37__MSASAssetTransferer__canceledError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_ASSET_TRANS_CANCELED");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASAssetTransferErrorDomain" code:3 description:v3];
  id v2 = (void *)_canceledError_error_6142;
  _canceledError_error_6142 = v1;
}

- (id)_MMCSTokenTooOldError
{
  if (_MMCSTokenTooOldError_onceToken != -1) {
    dispatch_once(&_MMCSTokenTooOldError_onceToken, &__block_literal_global_32_6148);
  }
  id v2 = (void *)_MMCSTokenTooOldError_error;
  return v2;
}

void __44__MSASAssetTransferer__MMCSTokenTooOldError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_ASSET_TRANS_MMCS_TOKEN_TOO_OLD");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASAssetTransferErrorDomain" code:2 description:v3];
  id v2 = (void *)_MMCSTokenTooOldError_error;
  _MMCSTokenTooOldError_error = v1;
}

- (id)_missingMMCSTokenError
{
  if (_missingMMCSTokenError_onceToken != -1) {
    dispatch_once(&_missingMMCSTokenError_onceToken, &__block_literal_global_27_6153);
  }
  id v2 = (void *)_missingMMCSTokenError_error;
  return v2;
}

void __45__MSASAssetTransferer__missingMMCSTokenError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_ASSET_TRANS_MISSING_MMCS_TOKEN");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASAssetTransferErrorDomain" code:1 description:v3];
  id v2 = (void *)_missingMMCSTokenError_error;
  _missingMMCSTokenError_error = v1;
}

- (id)_missingURLError
{
  if (_missingURLError_onceToken != -1) {
    dispatch_once(&_missingURLError_onceToken, &__block_literal_global_6158);
  }
  id v2 = (void *)_missingURLError_error;
  return v2;
}

void __39__MSASAssetTransferer__missingURLError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_ASSET_TRANS_MISSING_URL");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASAssetTransferErrorDomain" code:0 description:v3];
  id v2 = (void *)_missingURLError_error;
  _missingURLError_error = v1;
}

- (id)_pathForPersonID:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[MSASAssetTransferer _pathForPersonID:]", "MSASAssetTransferer.m", 176, "0");
}

- (double)workQueueMaxMMCSTokenValidityTimeInterval
{
  return self->_maxMMCSTokenValidityTimeInterval;
}

- (unint64_t)workQueueNextItemID
{
  id v2 = [(MSASAssetTransferer *)self model];
  unint64_t v3 = [v2 nextMMCSItemID];

  return v3;
}

- (void)retryOutstandingActivities
{
  unint64_t v3 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MSASAssetTransferer_retryOutstandingActivities__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__MSASAssetTransferer_retryOutstandingActivities__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)workQueueShutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  engine = self->_engine;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MSASAssetTransferer_workQueueShutDownCompletionBlock___block_invoke;
  v8[3] = &unk_1E6C3DB00;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(MMCSEngine *)engine shutDownCompletionBlock:v8];
}

void __56__MSASAssetTransferer_workQueueShutDownCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MSASAssetTransferer_workQueueShutDownCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E6C3DB00;
  unint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __56__MSASAssetTransferer_workQueueShutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) eventQueue];
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASAssetTransferer *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MSASAssetTransferer_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__MSASAssetTransferer_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasShutDown:1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__MSASAssetTransferer_shutDownCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E6C3DB00;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 workQueueShutDownCompletionBlock:v4];
}

void __47__MSASAssetTransferer_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) eventQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)cancelCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASAssetTransferer *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MSASAssetTransferer_cancelCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__MSASAssetTransferer_cancelCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) workQueueCancel];
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) eventQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)workQueueStop
{
}

- (void)stopCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASAssetTransferer *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__MSASAssetTransferer_stopCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__MSASAssetTransferer_stopCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) workQueueStop];
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) eventQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)setMaxMMCSTokenValidityTimeInterval:(double)a3
{
  id v5 = [(MSASAssetTransferer *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__MSASAssetTransferer_setMaxMMCSTokenValidityTimeInterval___block_invoke;
  v6[3] = &unk_1E6C3DAB0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

double __59__MSASAssetTransferer_setMaxMMCSTokenValidityTimeInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

- (void)setFocusAssetCollectionGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASAssetTransferer *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MSASAssetTransferer_setFocusAssetCollectionGUID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__MSASAssetTransferer_setFocusAssetCollectionGUID___block_invoke(uint64_t a1)
{
}

- (void)setFocusAlbumGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASAssetTransferer *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__MSASAssetTransferer_setFocusAlbumGUID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__MSASAssetTransferer_setFocusAlbumGUID___block_invoke(uint64_t a1)
{
}

- (MSASAssetTransferer)initWithPersonID:(id)a3 eventQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MSASAssetTransferer;
  id v9 = [(MSASAssetTransferer *)&v26 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("MSASAssetTransferer work queue", 0);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v10;

    if (v8) {
      dispatch_queue_t v12 = (dispatch_queue_t)v8;
    }
    else {
      dispatch_queue_t v12 = dispatch_queue_create("MSASAssetTransferer event queue", 0);
    }
    eventQueue = v9->_eventQueue;
    v9->_eventQueue = (OS_dispatch_queue *)v12;

    v14 = v9->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke;
    block[3] = &unk_1E6C3DB28;
    v15 = v9;
    v24 = v15;
    id v25 = v7;
    dispatch_sync(v14, block);
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v17 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke_2;
    v21[3] = &unk_1E6C3CFB0;
    v18 = v15;
    v22 = v18;
    id v19 = (id)[v16 addObserverForName:@"MSPlatformPerformanceLoggingSettingDidChange" object:0 queue:v17 usingBlock:v21];

    *(void *)&v18->_maxBatchCount = 0x30000000ALL;
    objc_storeStrong((id *)&v18->_personID, a3);
  }
  return v9;
}

void __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke(uint64_t a1)
{
  v20[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MSASPlatform();
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = MSASPlatform();
    uint64_t v5 = [v4 MMCSConcurrentConnectionsCount];
  }
  else
  {
    uint64_t v5 = 1;
  }
  v19[0] = *MEMORY[0x1E4F73810];
  id v6 = [NSNumber numberWithInt:v5];
  uint64_t v7 = *MEMORY[0x1E4F73800];
  v20[0] = v6;
  v20[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F73808];
  v19[1] = v7;
  v19[2] = v8;
  v19[3] = *MEMORY[0x1E4F737F8];
  v20[2] = MEMORY[0x1E4F1CC38];
  v20[3] = MEMORY[0x1E4F1CC38];
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  dispatch_queue_t v10 = [MMCSEngine alloc];
  v11 = (void *)MEMORY[0x1E4F1CB10];
  dispatch_queue_t v12 = [*(id *)(a1 + 32) _pathForPersonID:*(void *)(a1 + 40)];
  v13 = [v11 fileURLWithPath:v12];
  v14 = MSPlatform();
  v15 = [v14 appBundleInfoString];
  uint64_t v16 = [(MMCSEngine *)v10 initWithWorkPath:v13 appIDHeader:v15 dataClass:@"com.apple.Dataclass.SharedStreams" options:v9];
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setDelegate:");
  [*(id *)(a1 + 32) _rereadPerformanceLoggingSetting];
}

void __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[12];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke_3;
  block[3] = &unk_1E6C3DA38;
  id v4 = v1;
  dispatch_async(v2, block);
}

uint64_t __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rereadPerformanceLoggingSetting];
}

- (MSASAssetTransferer)initWithPersonID:(id)a3
{
  return [(MSASAssetTransferer *)self initWithPersonID:a3 eventQueue:0];
}

- (void)_rereadPerformanceLoggingSetting
{
  char v3 = MSPlatform();
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    engine = self->_engine;
    MSPlatform();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MMCSEngine setIsMetricsGatheringEnabled:](engine, "setIsMetricsGatheringEnabled:", [v6 isPerformanceLoggingEnabled]);
  }
}

@end
@interface HMDSyncOperationManager
+ (id)logCategory;
- (BOOL)addCloudPostFetchOperationIfNonePresent:(id)a3;
- (BOOL)addCloudQueryDatabaseOperationIfNonePresent:(id)a3;
- (BOOL)addCloudZoneFetchOperation:(id)a3 delay:(double)a4;
- (BOOL)addCloudZonePushOperation:(id)a3 delay:(double)a4;
- (BOOL)dropCloudPostFetchOperationsIfPresent;
- (BOOL)pauseQueue;
- (BOOL)popCloudZoneFetchOperationAndMoveQueueToEnd:(id *)a3;
- (BOOL)wasSyncLoopDialogDisplayed;
- (HMDSyncOperation)currentOperation;
- (HMDSyncOperationManager)initWithClientQueue:(id)a3 dataSource:(id)a4;
- (HMDSyncOperationManager)initWithClientQueue:(id)a3 dataSource:(id)a4 timerFactory:(id)a5;
- (HMDSyncOperationManagerDataSource)dataSource;
- (HMDSyncOperationQueue)cloudFetchOperations;
- (HMDSyncOperationQueue)cloudPushOperations;
- (HMFExponentialBackoffTimer)cloudPushDelayTimer;
- (NSArray)cloudCancelPauseOperations;
- (NSArray)cloudPostFetchOperations;
- (NSArray)cloudQueryDatabaseOperations;
- (NSArray)cloudVerifyAccountOperations;
- (NSArray)cloudZoneFetchOperationQueues;
- (NSArray)cloudZonePushOperationQueues;
- (NSString)description;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)workQueue;
- (id)_dequeueNextOperation;
- (id)cloudZoneFetchOperations;
- (id)dumpState;
- (id)popCloudCancelPauseOperation;
- (id)popCloudPostFetchOperation;
- (id)popCloudQueryDatabaseOperation;
- (id)popCloudVerifyAccountOperation;
- (id)popCloudZonePushOperationAndMoveQueueToEnd;
- (id)timerFactory;
- (int64_t)pauseCloudPushLevel;
- (void)_dropWithoutAlreadyScheduledOperation:(id)a3;
- (void)_handleCancelledOperations:(id)a3;
- (void)_handleNextOperation;
- (void)_reportPossibleSyncLoop;
- (void)addCloudCancelPauseOperation:(id)a3;
- (void)addCloudVerifyAccountOperation:(id)a3;
- (void)addOperation:(id)a3;
- (void)addOperation:(id)a3 withDelay:(double)a4;
- (void)addOperationRespectingOptions:(id)a3 withDelay:(double)a4;
- (void)cancelOperations;
- (void)kick;
- (void)pause;
- (void)pauseAndWaitForCurrentOperationCompletion:(id)a3;
- (void)pauseCloudPush;
- (void)removeCloudZoneFetchOperationQueue:(id)a3;
- (void)removeCloudZonePushOperationQueue:(id)a3;
- (void)resetCloudPushTimer:(id)a3;
- (void)resume;
- (void)resumeCloudPush;
- (void)setCloudPushDelayTimer:(id)a3;
- (void)setCurrentOperation:(id)a3;
- (void)setPauseCloudPushLevel:(int64_t)a3;
- (void)setPauseQueue:(BOOL)a3;
- (void)setSyncLoopDialogDisplayed:(BOOL)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSyncOperationManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timerFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_cloudPushDelayTimer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cloudFetchOperations, 0);
  objc_storeStrong((id *)&self->_cloudPushOperations, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_cloudZoneFetchOperationQueuesMap, 0);
  objc_storeStrong((id *)&self->_cloudZonePushOperationQueuesMap, 0);
  objc_storeStrong((id *)&self->_cloudPostFetchOperations, 0);
  objc_storeStrong((id *)&self->_cloudQueryDatabaseOperations, 0);
  objc_storeStrong((id *)&self->_cloudCancelPauseOperations, 0);
  objc_storeStrong((id *)&self->_cloudZoneFetchOperationQueues, 0);
  objc_storeStrong((id *)&self->_cloudZonePushOperationQueues, 0);
  objc_storeStrong((id *)&self->_cloudVerifyAccountOperations, 0);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 160, 1);
}

- (HMDSyncOperationManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDSyncOperationManagerDataSource *)WeakRetained;
}

- (void)setCurrentOperation:(id)a3
{
}

- (HMDSyncOperation)currentOperation
{
  return self->_currentOperation;
}

- (void)setSyncLoopDialogDisplayed:(BOOL)a3
{
  self->_syncLoopDialogDisplayed = a3;
}

- (BOOL)wasSyncLoopDialogDisplayed
{
  return self->_syncLoopDialogDisplayed;
}

- (void)setCloudPushDelayTimer:(id)a3
{
}

- (HMFExponentialBackoffTimer)cloudPushDelayTimer
{
  return self->_cloudPushDelayTimer;
}

- (void)setPauseCloudPushLevel:(int64_t)a3
{
  self->_pauseCloudPushLevel = a3;
}

- (int64_t)pauseCloudPushLevel
{
  return self->_pauseCloudPushLevel;
}

- (void)setPauseQueue:(BOOL)a3
{
  self->_pauseQueue = a3;
}

- (BOOL)pauseQueue
{
  return self->_pauseQueue;
}

- (NSArray)cloudZoneFetchOperationQueues
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSyncOperationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HMDSyncOperationManager_timerDidFire___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__HMDSyncOperationManager_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) cloudFetchOperations];
  int v3 = [v2 processFiredTimer:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
LABEL_4:
    [v4 _handleNextOperation];
    return;
  }
  v5 = [v4 cloudPushOperations];
  int v6 = [v5 processFiredTimer:*(void *)(a1 + 40)];

  if (v6)
  {
    id v4 = *(void **)(a1 + 32);
    goto LABEL_4;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v7 = [*(id *)(a1 + 32) cloudZoneFetchOperations];
  id v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v14 = *(void **)(a1 + 40);
        v15 = [v13 backoffTimer];
        if (v14 == v15)
        {
          uint64_t v16 = [v13 countTotal];

          if (!v16)
          {
            [v13 processFiredTimer:*(void *)(a1 + 40)];
            [*(id *)(a1 + 32) removeCloudZoneFetchOperationQueue:v13];
            goto LABEL_33;
          }
        }
        else
        {
        }
        if ([v13 processFiredTimer:*(void *)(a1 + 40)])
        {
LABEL_30:
          [*(id *)(a1 + 32) _handleNextOperation];
          goto LABEL_33;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v17 = objc_msgSend(*(id *)(a1 + 32), "cloudZonePushOperationQueues", 0);
  id v8 = (void *)[v17 copy];

  uint64_t v18 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v8);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        v23 = *(void **)(a1 + 40);
        v24 = [v22 backoffTimer];
        if (v23 == v24)
        {
          uint64_t v25 = [v22 countTotal];

          if (!v25)
          {
            [v22 processFiredTimer:*(void *)(a1 + 40)];
            [*(id *)(a1 + 32) removeCloudZonePushOperationQueue:v22];
            goto LABEL_33;
          }
        }
        else
        {
        }
        if ([v22 processFiredTimer:*(void *)(a1 + 40)]) {
          goto LABEL_30;
        }
      }
      uint64_t v19 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_33:
}

- (void)resetCloudPushTimer:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSyncOperationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HMDSyncOperationManager_resetCloudPushTimer___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__HMDSyncOperationManager_resetCloudPushTimer___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting cloud upload timer", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) cloudPushOperations];
  [v6 resetBackoffTimer];

  if (*(void *)(a1 + 40))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = objc_msgSend(*(id *)(a1 + 32), "cloudZonePushOperationQueues", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v13 = *(void **)(a1 + 40);
          v14 = [v12 name];
          LODWORD(v13) = [v13 isEqualToString:v14];

          if (v13) {
            [v12 resetBackoffTimer];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)resumeCloudPush
{
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HMDSyncOperationManager_resumeCloudPush__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __42__HMDSyncOperationManager_resumeCloudPush__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) pauseCloudPushLevel] >= 1) {
    objc_msgSend(*(id *)(a1 + 32), "setPauseCloudPushLevel:", objc_msgSend(*(id *)(a1 + 32), "pauseCloudPushLevel") - 1);
  }
  uint64_t v2 = [*(id *)(a1 + 32) pauseCloudPushLevel];
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2 < 1)
  {
    if (v6)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Resuming cloud push queue", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) _handleNextOperation];
  }
  else
  {
    if (v6)
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = [*(id *)(a1 + 32) pauseCloudPushLevel];
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Cloud push queue is still paused because push level is %tu", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)pauseCloudPush
{
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HMDSyncOperationManager_pauseCloudPush__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __41__HMDSyncOperationManager_pauseCloudPush__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990](objc_msgSend(*(id *)(a1 + 32), "setPauseCloudPushLevel:", objc_msgSend(*(id *)(a1 + 32), "pauseCloudPushLevel") + 1));
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 32) pauseCloudPushLevel];
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Pausing cloud push queue, level is %tu", (uint8_t *)&v7, 0x16u);
  }
}

- (void)kick
{
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HMDSyncOperationManager_kick__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__HMDSyncOperationManager_kick__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNextOperation];
}

- (void)resume
{
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HMDSyncOperationManager_resume__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __33__HMDSyncOperationManager_resume__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setPauseQueue:0]);
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Resuming sync manager queue", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _handleNextOperation];
}

- (void)pause
{
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMDSyncOperationManager_pause__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __32__HMDSyncOperationManager_pause__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setPauseQueue:1]);
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Pausing sync manager queue", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_handleCancelledOperations:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSyncOperationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v7 = (void *)MEMORY[0x230FBD990]();
        id v8 = *(id *)(a1 + 40);
        uint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v19 = v10;
          __int16 v20 = 2114;
          uint64_t v21 = v6;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Cancelling sync operation %{public}@", buf, 0x16u);
        }
        uint64_t v11 = [*(id *)(a1 + 40) clientQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke_177;
        block[3] = &unk_264A2F820;
        block[4] = *(void *)(a1 + 40);
        void block[5] = v6;
        dispatch_async(v11, block);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v3);
  }
}

void __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke_177(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke_2;
  v5[3] = &unk_264A2F370;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = _Block_copy(v5);
  uint64_t v3 = [*(id *)(a1 + 40) operationBlock];
  uint64_t v4 = [*(id *)(a1 + 40) options];
  ((void (**)(void, void *, void *, uint64_t))v3)[2](v3, v2, v4, 1);
}

void __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  long long v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) identifier];
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v7;
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Sync operation %{public}@ cancelled", buf, 0x16u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "operationCompletions", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [*(id *)(a1 + 40) removeAllOperationCompletions];
}

- (void)_handleNextOperation
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDSyncOperationManager *)self _dequeueNextOperation];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    long long v6 = self;
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v30 = v8;
      __int16 v31 = 2114;
      long long v32 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Starting sync operation %{public}@", buf, 0x16u);
    }
    logger = v6->_logger;
    if (os_signpost_enabled(logger))
    {
      uint64_t v10 = logger;
      uint64_t v11 = [v4 zoneName];
      uint64_t v12 = [v4 identifier];
      *(_DWORD *)buf = 138412546;
      long long v30 = v11;
      __int16 v31 = 2112;
      long long v32 = v12;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SyncOperation", "zone=%{signpost.description:attribute}@ identifier=%{signpost.description:attribute}@ ", buf, 0x16u);
    }
    [(HMDSyncOperationManager *)v6 setCurrentOperation:v4];
    uint64_t v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    long long v14 = [(HMDSyncOperationManager *)v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__HMDSyncOperationManager__handleNextOperation__block_invoke;
    block[3] = &unk_264A2F820;
    long long v15 = v13;
    long long v27 = v15;
    id v16 = v4;
    id v28 = v16;
    dispatch_async(v14, block);

    long long v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = v6;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = HMFGetLogIdentifier();
      __int16 v21 = [v16 identifier];
      *(_DWORD *)buf = 138543618;
      long long v30 = v20;
      __int16 v31 = 2114;
      long long v32 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting for sync operation %{public}@ to complete", buf, 0x16u);
    }
    uint64_t v22 = [(HMDSyncOperationManager *)v18 workQueue];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __47__HMDSyncOperationManager__handleNextOperation__block_invoke_176;
    v23[3] = &unk_264A2E458;
    v23[4] = v18;
    id v24 = v16;
    unint64_t v25 = 0xEEEEB0B5B2B2EEEELL;
    dispatch_group_notify(v15, v22, v23);
  }
}

void __47__HMDSyncOperationManager__handleNextOperation__block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  int v7 = __47__HMDSyncOperationManager__handleNextOperation__block_invoke_2;
  id v8 = &unk_264A2F370;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v2 = _Block_copy(&v5);
  objc_msgSend(*(id *)(a1 + 40), "operationBlock", v5, v6, v7, v8);
  id v3 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [*(id *)(a1 + 40) options];
  ((void (**)(void, void *, void *, void))v3)[2](v3, v2, v4, 0);
}

uint64_t __47__HMDSyncOperationManager__handleNextOperation__block_invoke_176(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) identifier];
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    long long v14 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Sync operation %@ completed", (uint8_t *)&v11, 0x16u);
  }
  int v7 = *(id *)(*(void *)(a1 + 32) + 80);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SyncOperation", "", (uint8_t *)&v11, 2u);
  }

  [*(id *)(a1 + 32) setCurrentOperation:0];
  return [*(id *)(a1 + 32) _handleNextOperation];
}

void __47__HMDSyncOperationManager__handleNextOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "operationCompletions", 0);
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 40) removeAllOperationCompletions];
}

- (id)_dequeueNextOperation
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDSyncOperationManager *)self currentOperation];

  if (!v4)
  {
    long long v11 = [(HMDSyncOperationManager *)self dataSource];
    int v12 = [v11 isCloudAccountActive];
    char v13 = [v11 zoneFetchFailed];
    int v14 = [v11 legacyZoneHasRecordsAvailable];
    if ([(HMDSyncOperationManager *)self pauseQueue])
    {
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = self;
      long long v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        long long v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v41 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Cannot dequeue operation because sync manager queue is paused", buf, 0xCu);
      }
      long long v10 = 0;
LABEL_30:

      goto LABEL_31;
    }
    long long v10 = [(HMDSyncOperationManager *)self popCloudCancelPauseOperation];
    if (!v10)
    {
      long long v10 = [(HMDSyncOperationManager *)self popCloudQueryDatabaseOperation];
      if (!v10)
      {
        if (![v11 isNetworkConnectionAvailable])
        {
LABEL_27:
          long long v10 = 0;
          goto LABEL_28;
        }
        long long v10 = [(HMDSyncOperationManager *)self popCloudVerifyAccountOperation];
        if (v10) {
          goto LABEL_28;
        }
        uint64_t v19 = [(HMDSyncOperationManager *)self cloudFetchOperations];
        uint64_t v20 = [v19 countTotal];

        if (v20)
        {
          __int16 v21 = [(HMDSyncOperationManager *)self cloudFetchOperations];
          uint64_t v22 = [v21 count];

          if (v22)
          {
            uint64_t v23 = [(HMDSyncOperationManager *)self cloudFetchOperations];
LABEL_16:
            id v24 = v23;
            long long v10 = [v23 nextOperation];

            goto LABEL_28;
          }
          goto LABEL_27;
        }
        if (!v12)
        {
          long long v27 = (void *)MEMORY[0x230FBD990]();
          id v28 = self;
          long long v29 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
LABEL_26:

            goto LABEL_27;
          }
          long long v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v41 = v30;
          __int16 v31 = "%{public}@Cannot dequeue as no active account";
LABEL_25:
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, v31, buf, 0xCu);

          goto LABEL_26;
        }
        if (!v14)
        {
          if (v13) {
            goto LABEL_27;
          }
LABEL_35:
          uint64_t v23 = [(HMDSyncOperationManager *)self cloudPushOperations];
          goto LABEL_16;
        }
        id v39 = 0;
        BOOL v25 = [(HMDSyncOperationManager *)self popCloudZoneFetchOperationAndMoveQueueToEnd:&v39];
        id v26 = v39;
        long long v10 = v26;
        if (v25)
        {
          if (v26) {
            goto LABEL_28;
          }
          long long v27 = (void *)MEMORY[0x230FBD990]();
          id v28 = self;
          long long v29 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_26;
          }
          long long v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v41 = v30;
          __int16 v31 = "%{public}@Waiting for delayed fetches to finish.";
          goto LABEL_25;
        }
        uint64_t v35 = [(HMDSyncOperationManager *)self popCloudPostFetchOperation];

        long long v10 = (void *)v35;
        if (!v35)
        {
          if ([(HMDSyncOperationManager *)self pauseCloudPushLevel] > 0
            || ([(HMDSyncOperationManager *)self popCloudZonePushOperationAndMoveQueueToEnd], (long long v10 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            uint64_t v36 = [(HMDSyncOperationManager *)self cloudPushOperations];
            if (![v36 count])
            {

              goto LABEL_27;
            }
            uint64_t v37 = [(HMDSyncOperationManager *)self pauseCloudPushLevel];

            if (v37 > 0) {
              char v38 = 1;
            }
            else {
              char v38 = v13;
            }
            if (v38) {
              goto LABEL_27;
            }
            goto LABEL_35;
          }
        }
      }
    }
LABEL_28:
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    long long v32 = self;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v33;
      __int16 v42 = 2114;
      v43 = v10;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Dequeued operation to process %{public}@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    long long v9 = [(HMDSyncOperationManager *)v6 currentOperation];
    *(_DWORD *)buf = 138543618;
    v41 = v8;
    __int16 v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Already executing operation %@", buf, 0x16u);
  }
  long long v10 = 0;
LABEL_31:
  return v10;
}

- (void)cancelOperations
{
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMDSyncOperationManager_cancelOperations__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __43__HMDSyncOperationManager_cancelOperations__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v36 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Cancelling all unprocessed sync operation", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  [v6 addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 16)];
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 104) operationsToCancel];
  [v6 addObjectsFromArray:v8];

  long long v9 = [*(id *)(*(void *)(a1 + 32) + 96) operationsToCancel];
  [v6 addObjectsFromArray:v9];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v10);
        }
        int v14 = [*(id *)(*((void *)&v29 + 1) + 8 * v13) operationsToCancel];
        [v6 addObjectsFromArray:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v18), "operationsToCancel", (void)v25);
        [v6 addObjectsFromArray:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  [v6 addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 56)];
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  os_unfair_lock_unlock(v7);
  uint64_t v20 = [*(id *)(a1 + 32) cloudPushDelayTimer];
  [v20 suspend];

  __int16 v21 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setCloudPushDelayTimer:0]);
  id v22 = *(id *)(a1 + 32);
  uint64_t v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v36 = v24;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Cancelling all sync operations, resuming cloud push queue", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setPauseCloudPushLevel:0];
  [*(id *)(a1 + 32) _handleCancelledOperations:v6];
}

- (void)pauseAndWaitForCurrentOperationCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__HMDSyncOperationManager_pauseAndWaitForCurrentOperationCompletion___block_invoke;
  aBlock[3] = &unk_264A21430;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = +[HMDSyncOperation cancelOperationWithBlock:v6];
  [(HMDSyncOperationManager *)self addOperation:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__HMDSyncOperationManager_pauseAndWaitForCurrentOperationCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained pause];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)addOperationRespectingOptions:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(HMDSyncOperationManager *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__HMDSyncOperationManager_addOperationRespectingOptions_withDelay___block_invoke;
    block[3] = &unk_264A2E458;
    void block[4] = self;
    id v9 = v6;
    double v10 = a4;
    dispatch_async(v7, block);
  }
}

uint64_t __67__HMDSyncOperationManager_addOperationRespectingOptions_withDelay___block_invoke(uint64_t a1)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v139 = v5;
    __int16 v140 = 2112;
    v141 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Will attempt to add operation %@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 40) operationType] == 1 || objc_msgSend(*(id *)(a1 + 40), "operationType") == 2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) cloudPushOperations];
    uint64_t v8 = [v7 backoffTimer];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        uint64_t v13 = NSNumber;
        int v14 = [*(id *)(a1 + 32) cloudPushOperations];
        id v15 = [v14 backoffTimer];
        [v15 timeInterval];
        uint64_t v16 = objc_msgSend(v13, "numberWithDouble:");
        *(_DWORD *)buf = 138543618;
        v139 = v12;
        __int16 v140 = 2114;
        v141 = v16;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Current push delay is: %{public}@", buf, 0x16u);
      }
    }
    uint64_t v17 = [*(id *)(a1 + 32) cloudPushOperations];
    int v18 = [v17 isInMaximumTimeInterval];

    if (v18)
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 32);
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v139 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Scheduling legacy push at maximum time interval, maybe in a sync loop", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _reportPossibleSyncLoop];
    }
    uint64_t v23 = [*(id *)(a1 + 32) dataSource];
    int v24 = [v23 legacyZoneHasRecordsAvailable];

    if (!v24)
    {
      char v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = *(id *)(a1 + 32);
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = HMFGetLogIdentifier();
        __int16 v42 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v41;
        __int16 v140 = 2114;
        v141 = v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Staging cloud push operation %{public}@", buf, 0x16u);
      }
      long long v26 = [*(id *)(a1 + 32) cloudPushOperations];
      [v26 stageOperation:*(void *)(a1 + 40)];
      goto LABEL_37;
    }
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v25 = [*(id *)(a1 + 32) cloudPushOperations];
    long long v26 = [v25 allOperations];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v132 objects:v137 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v133;
LABEL_16:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v133 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v132 + 1) + 8 * v30);
        if ([v31 operationType] == 2) {
          break;
        }
        if (v28 == ++v30)
        {
          uint64_t v28 = [v26 countByEnumeratingWithState:&v132 objects:v137 count:16];
          if (v28) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
      v48 = (void *)MEMORY[0x230FBD990]();
      id v49 = *(id *)(a1 + 32);
      v50 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_INFO)) {
        goto LABEL_36;
      }
      v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v139 = v51;
      v52 = "%{public}@Unprocessed cloud force push operation in queue, dropping new push operation";
      v53 = v50;
      uint32_t v54 = 12;
      goto LABEL_35;
    }
LABEL_22:

    long long v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = *(id *)(a1 + 32);
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      uint64_t v36 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v139 = v35;
      __int16 v140 = 2114;
      v141 = v36;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Adding cloud push operation %{public}@", buf, 0x16u);
    }
    uint64_t v37 = [*(id *)(a1 + 32) cloudPushOperations];
LABEL_25:
    long long v26 = v37;
    [v37 addOperation:*(void *)(a1 + 40) withDelay:*(double *)(a1 + 48)];
    goto LABEL_37;
  }
  if ([*(id *)(a1 + 40) operationType] == 3)
  {
    v43 = (void *)MEMORY[0x230FBD990]();
    id v44 = *(id *)(a1 + 32);
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = HMFGetLogIdentifier();
      v47 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v139 = v46;
      __int16 v140 = 2114;
      v141 = v47;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Adding cloud verify account operation %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) addCloudVerifyAccountOperation:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _handleNextOperation];
  }
  if ([*(id *)(a1 + 40) operationType] != 4)
  {
    uint64_t v75 = [*(id *)(a1 + 40) operationType];
    v76 = *(void **)(a1 + 40);
    if (v75 == 5)
    {
      long long v26 = [v76 zoneName];
      v77 = (void *)MEMORY[0x230FBD990]();
      id v78 = *(id *)(a1 + 32);
      v79 = HMFGetOSLogHandle();
      v80 = v79;
      if (v26)
      {
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          v81 = HMFGetLogIdentifier();
          v82 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v139 = v81;
          __int16 v140 = 2114;
          v141 = v82;
          _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_INFO, "%{public}@Adding cloud zone push operation %{public}@", buf, 0x16u);
        }
        if ([*(id *)(a1 + 32) addCloudZonePushOperation:*(void *)(a1 + 40) delay:*(double *)(a1 + 48)])
        {
          v83 = (void *)MEMORY[0x230FBD990]();
          id v84 = *(id *)(a1 + 32);
          v85 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            v86 = HMFGetLogIdentifier();
            v87 = [*(id *)(a1 + 40) zoneName];
            *(_DWORD *)buf = 138543618;
            v139 = v86;
            __int16 v140 = 2114;
            v141 = v87;
            _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_ERROR, "%{public}@Scheduling zone %{public}@ push at maximum time interval, maybe in a sync loop", buf, 0x16u);
          }
          [*(id *)(a1 + 32) _reportPossibleSyncLoop];
        }
        goto LABEL_37;
      }
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        v99 = HMFGetLogIdentifier();
        v100 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v99;
        __int16 v140 = 2114;
        v141 = v100;
        v101 = "%{public}@Cannot add operation to zone push without a zoneName %{public}@";
LABEL_90:
        _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_ERROR, v101, buf, 0x16u);

        goto LABEL_91;
      }
      goto LABEL_91;
    }
    uint64_t v89 = [v76 operationType];
    v90 = *(void **)(a1 + 40);
    if (v89 == 6)
    {
      long long v26 = [v90 zoneName];
      v77 = (void *)MEMORY[0x230FBD990]();
      id v78 = *(id *)(a1 + 32);
      v91 = HMFGetOSLogHandle();
      v80 = v91;
      if (v26)
      {
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          v92 = HMFGetLogIdentifier();
          v93 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v139 = v92;
          __int16 v140 = 2114;
          v141 = v93;
          _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_INFO, "%{public}@Adding cloud zone fetch operation %{public}@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) addCloudZoneFetchOperation:*(void *)(a1 + 40) delay:*(double *)(a1 + 48)];
        goto LABEL_37;
      }
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        v99 = HMFGetLogIdentifier();
        v117 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v99;
        __int16 v140 = 2114;
        v141 = v117;
        v101 = "%{public}@Cannot add operation to zone fetch without a zoneName %{public}@";
        goto LABEL_90;
      }
LABEL_91:

      [*(id *)(a1 + 32) _dropWithoutAlreadyScheduledOperation:*(void *)(a1 + 40)];
      goto LABEL_37;
    }
    if ([v90 operationType] == 7)
    {
      v94 = (void *)MEMORY[0x230FBD990]();
      id v95 = *(id *)(a1 + 32);
      v96 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        v97 = HMFGetLogIdentifier();
        v98 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v97;
        __int16 v140 = 2112;
        v141 = v98;
        _os_log_impl(&dword_22F52A000, v96, OS_LOG_TYPE_INFO, "%{public}@Adding cloud cancel pause operation %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) addCloudCancelPauseOperation:*(void *)(a1 + 40)];
      return [*(id *)(a1 + 32) _handleNextOperation];
    }
    if ([*(id *)(a1 + 40) operationType] == 8)
    {
      v102 = (void *)MEMORY[0x230FBD990]();
      id v103 = *(id *)(a1 + 32);
      v104 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        v105 = HMFGetLogIdentifier();
        v106 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v105;
        __int16 v140 = 2114;
        v141 = v106;
        _os_log_impl(&dword_22F52A000, v104, OS_LOG_TYPE_INFO, "%{public}@Adding cloud query database operation %{public}@", buf, 0x16u);
      }
      if (([*(id *)(a1 + 32) addCloudQueryDatabaseOperationIfNonePresent:*(void *)(a1 + 40)] & 1) == 0)
      {
        v107 = (void *)MEMORY[0x230FBD990]();
        id v108 = *(id *)(a1 + 32);
        v109 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          v110 = HMFGetLogIdentifier();
          v111 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v139 = v110;
          __int16 v140 = 2114;
          v141 = v111;
          _os_log_impl(&dword_22F52A000, v109, OS_LOG_TYPE_INFO, "%{public}@Already have a query operation scheduled, dropping operation %{public}@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) _dropWithoutAlreadyScheduledOperation:*(void *)(a1 + 40)];
      }
      if (![*(id *)(a1 + 32) dropCloudPostFetchOperationsIfPresent]) {
        return [*(id *)(a1 + 32) _handleNextOperation];
      }
      v112 = (void *)MEMORY[0x230FBD990]();
      id v113 = *(id *)(a1 + 32);
      v114 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
      {
        v115 = HMFGetLogIdentifier();
        v116 = [*(id *)(a1 + 32) cloudPostFetchOperations];
        *(_DWORD *)buf = 138543618;
        v139 = v115;
        __int16 v140 = 2114;
        v141 = v116;
        _os_log_impl(&dword_22F52A000, v114, OS_LOG_TYPE_INFO, "%{public}@Dropping post fetch because new query was added: %{public}@", buf, 0x16u);

LABEL_101:
      }
    }
    else
    {
      uint64_t v118 = [*(id *)(a1 + 40) operationType];
      v112 = (void *)MEMORY[0x230FBD990]();
      id v113 = *(id *)(a1 + 32);
      v119 = HMFGetOSLogHandle();
      v114 = v119;
      if (v118 == 9)
      {
        if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
        {
          v120 = HMFGetLogIdentifier();
          v121 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v139 = v120;
          __int16 v140 = 2114;
          v141 = v121;
          _os_log_impl(&dword_22F52A000, v114, OS_LOG_TYPE_INFO, "%{public}@Adding cloud post fetch operation %{public}@", buf, 0x16u);
        }
        if (([*(id *)(a1 + 32) addCloudPostFetchOperationIfNonePresent:*(void *)(a1 + 40)] & 1) == 0)
        {
          v122 = (void *)MEMORY[0x230FBD990]();
          id v123 = *(id *)(a1 + 32);
          v124 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
          {
            v125 = HMFGetLogIdentifier();
            v126 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v139 = v125;
            __int16 v140 = 2114;
            v141 = v126;
            _os_log_impl(&dword_22F52A000, v124, OS_LOG_TYPE_INFO, "%{public}@Already have a post fetch operation scheduled, dropping operation %{public}@", buf, 0x16u);
          }
          [*(id *)(a1 + 32) _dropWithoutAlreadyScheduledOperation:*(void *)(a1 + 40)];
        }
        return [*(id *)(a1 + 32) _handleNextOperation];
      }
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      {
        v115 = HMFGetLogIdentifier();
        v127 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v115;
        __int16 v140 = 2114;
        v141 = v127;
        _os_log_impl(&dword_22F52A000, v114, OS_LOG_TYPE_ERROR, "%{public}@Unknown sync operation type, dropping %{public}@", buf, 0x16u);
        goto LABEL_101;
      }
    }

    return [*(id *)(a1 + 32) _handleNextOperation];
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  v57 = objc_msgSend(*(id *)(a1 + 32), "cloudFetchOperations", 0);
  long long v26 = [v57 allOperations];

  uint64_t v58 = [v26 countByEnumeratingWithState:&v128 objects:v136 count:16];
  if (!v58)
  {
LABEL_54:

    v70 = (void *)MEMORY[0x230FBD990]();
    id v71 = *(id *)(a1 + 32);
    v72 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      v73 = HMFGetLogIdentifier();
      v74 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v139 = v73;
      __int16 v140 = 2114;
      v141 = v74;
      _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_INFO, "%{public}@Adding cloud fetch operation %{public}@", buf, 0x16u);
    }
    uint64_t v37 = [*(id *)(a1 + 32) cloudFetchOperations];
    goto LABEL_25;
  }
  uint64_t v59 = v58;
  uint64_t v60 = *(void *)v129;
LABEL_42:
  uint64_t v61 = 0;
  while (1)
  {
    if (*(void *)v129 != v60) {
      objc_enumerationMutation(v26);
    }
    long long v31 = *(void **)(*((void *)&v128 + 1) + 8 * v61);
    v62 = [*(id *)(a1 + 40) options];
    if (([v62 isCloudConflict] & 1) == 0) {
      break;
    }
    v63 = [v31 options];
    char v64 = [v63 isCloudConflict];

    if (v64) {
      goto LABEL_49;
    }
    v65 = [*(id *)(a1 + 32) cloudFetchOperations];
    [v65 dropOperation:v31];

    v66 = *(void **)(a1 + 40);
    v67 = [v31 operationCompletions];
    [v66 updateOperationCompletionsWithArray:v67];
LABEL_50:

LABEL_52:
    if (v59 == ++v61)
    {
      uint64_t v59 = [v26 countByEnumeratingWithState:&v128 objects:v136 count:16];
      if (v59) {
        goto LABEL_42;
      }
      goto LABEL_54;
    }
  }

LABEL_49:
  v67 = [*(id *)(a1 + 40) options];
  if ([v67 isCloudConflict]) {
    goto LABEL_50;
  }
  v68 = [v31 options];
  int v69 = [v68 isCloudConflict];

  if (!v69) {
    goto LABEL_52;
  }
  v48 = (void *)MEMORY[0x230FBD990]();
  id v49 = *(id *)(a1 + 32);
  v50 = HMFGetOSLogHandle();
  if (!os_log_type_enabled(v50, OS_LOG_TYPE_INFO)) {
    goto LABEL_36;
  }
  v51 = HMFGetLogIdentifier();
  v88 = *(void **)(a1 + 40);
  *(_DWORD *)buf = 138543618;
  v139 = v51;
  __int16 v140 = 2114;
  v141 = v88;
  v52 = "%{public}@Already have a legacy conflict fetch scheduled, dropping non-conflict fetch operation %{public}@";
  v53 = v50;
  uint32_t v54 = 22;
LABEL_35:
  _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, v52, buf, v54);

LABEL_36:
  v55 = [*(id *)(a1 + 40) operationCompletions];
  [v31 updateOperationCompletionsWithArray:v55];

LABEL_37:
  return [*(id *)(a1 + 32) _handleNextOperation];
}

- (void)_dropWithoutAlreadyScheduledOperation:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:23 description:@"Operation was dropped before it could run" reason:@"HMDSyncOperationManager dropped the operation" suggestion:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = objc_msgSend(v3, "operationCompletions", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addOperation:(id)a3 withDelay:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 > 0.0)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = HMFGetLogIdentifier();
      long long v11 = [v6 identifier];
      long long v12 = [v11 UUIDString];
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding operation delay, respect this delay: %@", (uint8_t *)&v14, 0x16u);
    }
    long long v13 = [v6 options];
    [v13 setDelayRespected:1];
  }
  [(HMDSyncOperationManager *)self addOperationRespectingOptions:v6 withDelay:a4];
}

- (void)addOperation:(id)a3
{
}

- (void)_reportPossibleSyncLoop
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDSyncOperationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v5 = +[HMDUploadMaximumDelayLogEvent uploadMaximumDelay];
  [v4 submitLogEvent:v5];

  if (isInternalBuild()
    && ![(HMDSyncOperationManager *)self wasSyncLoopDialogDisplayed])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      long long v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting dialog about possible sync loop", (uint8_t *)&v11, 0xCu);
    }
    [(HMDSyncOperationManager *)v7 setSyncLoopDialogDisplayed:1];
    long long v10 = +[HMDTTRManager sharedManager];
    [v10 requestRadarWithDisplayReason:@"maximum push delay was reached" radarTitle:@"HomeKit maximum push delay reached"];
  }
}

- (id)dumpState
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMDSyncOperationQueue *)self->_cloudPushOperations description];
  [v3 addObject:v5];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v6 = self->_cloudVerifyAccountOperations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = [*(id *)(*((void *)&v58 + 1) + 8 * i) description];
        [v3 addObject:v10];
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v7);
  }

  int v11 = [(HMDSyncOperationQueue *)self->_cloudFetchOperations description];
  [v3 addObject:v11];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v12 = self->_cloudZonePushOperationQueues;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v12);
        }
        __int16 v16 = [*(id *)(*((void *)&v54 + 1) + 8 * j) description];
        [v3 addObject:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v13);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v17 = self->_cloudZoneFetchOperationQueues;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v17);
        }
        __int16 v21 = [*(id *)(*((void *)&v50 + 1) + 8 * k) description];
        [v3 addObject:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v18);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v22 = self->_cloudCancelPauseOperations;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v64 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v22);
        }
        long long v26 = [*(id *)(*((void *)&v46 + 1) + 8 * m) description];
        [v3 addObject:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v23);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v27 = self->_cloudQueryDatabaseOperations;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v63 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v27);
        }
        long long v31 = [*(id *)(*((void *)&v42 + 1) + 8 * n) description];
        [v3 addObject:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v63 count:16];
    }
    while (v28);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v32 = self->_cloudPostFetchOperations;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v38 objects:v62 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v39;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v36 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * ii), "description", (void)v38);
        [v3 addObject:v36];
      }
      uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v38 objects:v62 count:16];
    }
    while (v33);
  }

  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (NSString)description
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [NSString stringWithFormat:@"<%@, Push Operations = %@, Verify Account Operations = %@, Fetch Operations = %@, Zone Push = %@, Zone Fetch = %@, Cancel = %@, Query = %@>, Post Fetch = %@", objc_opt_class(), self->_cloudPushOperations, self->_cloudVerifyAccountOperations, self->_cloudFetchOperations, self->_cloudZonePushOperationQueues, self->_cloudZoneFetchOperationQueues, self->_cloudCancelPauseOperations, self->_cloudQueryDatabaseOperations, self->_cloudPostFetchOperations];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (id)popCloudPostFetchOperation
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_cloudPostFetchOperations count])
  {
    id v4 = [(NSMutableArray *)self->_cloudPostFetchOperations objectAtIndex:0];
    [(NSMutableArray *)self->_cloudPostFetchOperations removeObjectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)dropCloudPostFetchOperationsIfPresent
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableArray *)self->_cloudPostFetchOperations count];
  if (v4)
  {
    uint64_t v5 = (void *)[(NSMutableArray *)self->_cloudPostFetchOperations copy];
    [(NSMutableArray *)self->_cloudPostFetchOperations removeAllObjects];
  }
  else
  {
    uint64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        -[HMDSyncOperationManager _dropWithoutAlreadyScheduledOperation:](self, "_dropWithoutAlreadyScheduledOperation:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4 != 0;
}

- (BOOL)addCloudPostFetchOperationIfNonePresent:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableArray *)self->_cloudPostFetchOperations count];
  if (!v5) {
    [(NSMutableArray *)self->_cloudPostFetchOperations addObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5 == 0;
}

- (id)popCloudQueryDatabaseOperation
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_cloudQueryDatabaseOperations count])
  {
    id v4 = [(NSMutableArray *)self->_cloudQueryDatabaseOperations objectAtIndex:0];
    [(NSMutableArray *)self->_cloudQueryDatabaseOperations removeObjectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)addCloudQueryDatabaseOperationIfNonePresent:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableArray *)self->_cloudQueryDatabaseOperations count];
  if (!v5) {
    [(NSMutableArray *)self->_cloudQueryDatabaseOperations addObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5 == 0;
}

- (id)popCloudCancelPauseOperation
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_cloudCancelPauseOperations count])
  {
    id v4 = [(NSMutableArray *)self->_cloudCancelPauseOperations objectAtIndex:0];
    [(NSMutableArray *)self->_cloudCancelPauseOperations removeObjectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addCloudCancelPauseOperation:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_cloudCancelPauseOperations addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)popCloudZoneFetchOperationAndMoveQueueToEnd:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = (void *)[(NSMutableArray *)self->_cloudZoneFetchOperationQueues copy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  char v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        BOOL v12 = [v11 countTotal] != 0;
        id v13 = [v11 nextOperation];
        v7 |= v12;
        *a3 = v13;
        if (v13)
        {
          [(NSMutableArray *)self->_cloudZoneFetchOperationQueues removeObject:v11];
          if ([v11 countTotal] < 1)
          {
            long long v14 = [v11 name];
            [(NSMutableDictionary *)self->_cloudZoneFetchOperationQueuesMap setObject:0 forKeyedSubscript:v14];
          }
          else
          {
            [(NSMutableArray *)self->_cloudZoneFetchOperationQueues addObject:v11];
          }
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(lock);
  return v7 & 1;
}

- (void)removeCloudZoneFetchOperationQueue:(id)a3
{
  id v7 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_cloudZoneFetchOperationQueues removeObject:v7];
  cloudZoneFetchOperationQueuesMap = self->_cloudZoneFetchOperationQueuesMap;
  id v6 = [v7 name];
  [(NSMutableDictionary *)cloudZoneFetchOperationQueuesMap setObject:0 forKeyedSubscript:v6];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)addCloudZoneFetchOperation:(id)a3 delay:(double)a4
{
  id v6 = a3;
  id v7 = [v6 zoneName];
  os_unfair_lock_lock_with_options();
  id v8 = [(NSMutableDictionary *)self->_cloudZoneFetchOperationQueuesMap objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = [[HMDSyncOperationQueue alloc] initName:v7 syncManager:self initialDelay:0 initialBackoff:0.0 hasBackoff:0.0];
    [(NSMutableArray *)self->_cloudZoneFetchOperationQueues addObject:v8];
    [(NSMutableDictionary *)self->_cloudZoneFetchOperationQueuesMap setObject:v8 forKeyedSubscript:v7];
  }
  [v8 addOperation:v6 withDelay:a4];
  os_unfair_lock_unlock(&self->_lock);

  return 0;
}

- (id)popCloudZonePushOperationAndMoveQueueToEnd
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (void *)[(NSMutableArray *)self->_cloudZonePushOperationQueues copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v8 nextOperation];
        if (v9)
        {
          [(NSMutableArray *)self->_cloudZonePushOperationQueues removeObject:v8];
          if ([v8 countTotal] <= 0
            && ([v8 backoffTimer],
                long long v10 = objc_claimAutoreleasedReturnValue(),
                BOOL v11 = v10 == 0,
                v10,
                v11))
          {
            id v13 = [v8 name];
            [(NSMutableDictionary *)self->_cloudZonePushOperationQueuesMap setObject:0 forKeyedSubscript:v13];
          }
          else
          {
            [(NSMutableArray *)self->_cloudZonePushOperationQueues addObject:v8];
          }
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_13:

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)removeCloudZonePushOperationQueue:(id)a3
{
  id v7 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_cloudZonePushOperationQueues removeObject:v7];
  cloudZonePushOperationQueuesMap = self->_cloudZonePushOperationQueuesMap;
  uint64_t v6 = [v7 name];
  [(NSMutableDictionary *)cloudZonePushOperationQueuesMap setObject:0 forKeyedSubscript:v6];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)addCloudZonePushOperation:(id)a3 delay:(double)a4
{
  id v6 = a3;
  id v7 = [v6 zoneName];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v9 = [(NSMutableDictionary *)self->_cloudZonePushOperationQueuesMap objectForKeyedSubscript:v7];
  if (v9)
  {
    char v10 = 0;
  }
  else
  {
    BOOL v11 = [HMDSyncOperationQueue alloc];
    id v9 = [(HMDSyncOperationQueue *)v11 initName:v7 syncManager:self initialDelay:1 initialBackoff:(double)(unint64_t)cloudZoneUploadTimerInitialInterval hasBackoff:(double)(unint64_t)cloudZoneUploadTimerInterval];
    [(NSMutableArray *)self->_cloudZonePushOperationQueues addObject:v9];
    [(NSMutableDictionary *)self->_cloudZonePushOperationQueuesMap setObject:v9 forKeyedSubscript:v7];
    char v10 = [v9 isInMaximumTimeInterval];
  }
  [v9 addOperation:v6 withDelay:a4];
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)popCloudVerifyAccountOperation
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_cloudVerifyAccountOperations count])
  {
    id v4 = [(NSMutableArray *)self->_cloudVerifyAccountOperations objectAtIndex:0];
    [(NSMutableArray *)self->_cloudVerifyAccountOperations removeObjectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addCloudVerifyAccountOperation:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_cloudVerifyAccountOperations addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)cloudPostFetchOperations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_cloudPostFetchOperations copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)cloudQueryDatabaseOperations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_cloudQueryDatabaseOperations copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)cloudCancelPauseOperations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_cloudCancelPauseOperations copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)cloudZoneFetchOperations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_cloudZoneFetchOperationQueues copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)cloudZonePushOperationQueues
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_cloudZonePushOperationQueues copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDSyncOperationQueue)cloudFetchOperations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_cloudFetchOperations;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)cloudVerifyAccountOperations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_cloudVerifyAccountOperations copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDSyncOperationQueue)cloudPushOperations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_cloudPushOperations;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDSyncOperationManager)initWithClientQueue:(id)a3 dataSource:(id)a4 timerFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)HMDSyncOperationManager;
  BOOL v11 = [(HMDSyncOperationManager *)&v45 init];
  if (v11)
  {
    uint64_t v12 = HMFGetOSLogHandle();
    logger = v11->_logger;
    v11->_logger = (OS_os_log *)v12;

    HMDispatchQueueNameString();
    id v14 = objc_claimAutoreleasedReturnValue();
    long long v15 = (char *)[v14 UTF8String];
    long long v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = v8;
    if (!v8)
    {
      HMDispatchQueueNameString();
      id v14 = objc_claimAutoreleasedReturnValue();
      long long v20 = (const char *)[v14 UTF8String];
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      long long v15 = (char *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v19 = dispatch_queue_create(v20, (dispatch_queue_attr_t)v15);
    }
    objc_storeStrong((id *)&v11->_clientQueue, v19);
    if (!v8)
    {
    }
    objc_storeWeak((id *)&v11->_dataSource, v9);
    v11->_lock._os_unfair_lock_opaque = 0;
    __int16 v21 = _Block_copy(v10);
    id timerFactory = v11->_timerFactory;
    v11->_id timerFactory = v21;

    uint64_t v23 = [HMDSyncOperationQueue alloc];
    uint64_t v24 = [(HMDSyncOperationQueue *)v23 initName:@"LegacyPush" syncManager:v11 initialDelay:1 initialBackoff:(double)(unint64_t)cloudUploadTimerInterval hasBackoff:(double)(unint64_t)cloudUploadTimerInterval];
    cloudPushOperations = v11->_cloudPushOperations;
    v11->_cloudPushOperations = (HMDSyncOperationQueue *)v24;

    v11->_pauseCloudPushLevel = 0;
    uint64_t v26 = [MEMORY[0x263EFF980] array];
    cloudVerifyAccountOperations = v11->_cloudVerifyAccountOperations;
    v11->_cloudVerifyAccountOperations = (NSMutableArray *)v26;

    uint64_t v28 = [[HMDSyncOperationQueue alloc] initName:@"LegacyFetch" syncManager:v11 initialDelay:0 initialBackoff:0.0 hasBackoff:0.0];
    cloudFetchOperations = v11->_cloudFetchOperations;
    v11->_cloudFetchOperations = v28;

    uint64_t v30 = [MEMORY[0x263EFF980] array];
    cloudZonePushOperationQueues = v11->_cloudZonePushOperationQueues;
    v11->_cloudZonePushOperationQueues = (NSMutableArray *)v30;

    uint64_t v32 = [MEMORY[0x263EFF9A0] dictionary];
    cloudZonePushOperationQueuesMap = v11->_cloudZonePushOperationQueuesMap;
    v11->_cloudZonePushOperationQueuesMap = (NSMutableDictionary *)v32;

    uint64_t v34 = [MEMORY[0x263EFF980] array];
    cloudZoneFetchOperationQueues = v11->_cloudZoneFetchOperationQueues;
    v11->_cloudZoneFetchOperationQueues = (NSMutableArray *)v34;

    uint64_t v36 = [MEMORY[0x263EFF9A0] dictionary];
    cloudZoneFetchOperationQueuesMap = v11->_cloudZoneFetchOperationQueuesMap;
    v11->_cloudZoneFetchOperationQueuesMap = (NSMutableDictionary *)v36;

    uint64_t v38 = [MEMORY[0x263EFF980] array];
    cloudCancelPauseOperations = v11->_cloudCancelPauseOperations;
    v11->_cloudCancelPauseOperations = (NSMutableArray *)v38;

    uint64_t v40 = [MEMORY[0x263EFF980] array];
    cloudQueryDatabaseOperations = v11->_cloudQueryDatabaseOperations;
    v11->_cloudQueryDatabaseOperations = (NSMutableArray *)v40;

    uint64_t v42 = [MEMORY[0x263EFF980] array];
    cloudPostFetchOperations = v11->_cloudPostFetchOperations;
    v11->_cloudPostFetchOperations = (NSMutableArray *)v42;

    v11->_syncLoopDialogDisplayed = 0;
  }

  return v11;
}

- (HMDSyncOperationManager)initWithClientQueue:(id)a3 dataSource:(id)a4
{
  return [(HMDSyncOperationManager *)self initWithClientQueue:a3 dataSource:a4 timerFactory:&__block_literal_global_131_140206];
}

id __58__HMDSyncOperationManager_initWithClientQueue_dataSource___block_invoke(double a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:a1];
  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t53_140210 != -1) {
    dispatch_once(&logCategory__hmf_once_t53_140210, &__block_literal_global_149_140211);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v54_140212;
  return v2;
}

void __38__HMDSyncOperationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v54_140212;
  logCategory__hmf_once_v54_140212 = v0;
}

@end
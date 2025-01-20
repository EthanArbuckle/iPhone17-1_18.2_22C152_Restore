@interface CAMTimelapseBackendController
- (BKSApplicationStateMonitor)_applicationStateMonitor;
- (BOOL)_deleteItemAtPath:(id)a3;
- (BOOL)_isCameraRunning;
- (BOOL)_isCapturing;
- (BOOL)_oldMovieWriterEnabled;
- (BOOL)_scheduleDelayedMovieWriteIfNeededForTimelapseUUID:(id)a3;
- (BOOL)_shouldSaveLastTimelapseDataForDebugging;
- (BOOL)_writingMovie;
- (CAMNebulaKeepAliveController)_keepAliveController;
- (CAMPersistenceController)_persistenceController;
- (CAMTimelapseBackendController)init;
- (CAMTimelapseBackendController)initWithPersistenceController:(id)a3 keepAliveController:(id)a4;
- (CAMTimelapseMovieWriterProtocol)_movieWriter;
- (CAMTimelapseState)_currentState;
- (CGAffineTransform)_frameTransformForState:(SEL)a3;
- (NSMutableArray)_sessionContexts;
- (NSMutableDictionary)_transactionForPersistenceUUID;
- (OS_dispatch_queue)_workQueue;
- (id)_getOrCreateSessionContextForTimelapseUUID:(id)a3;
- (int)_notifyRegisterTokenResumeIO;
- (int)_notifyRegisterTokenSuspendIO;
- (int)_pidForApplication:(id)a3;
- (void)_createPlaceholderAssetForState:(id)a3;
- (void)_dispatchToMainQueueWithBlock:(id)a3;
- (void)_dispatchToWorkQueueAfterDelay:(double)a3 withBlock:(id)a4;
- (void)_dispatchToWorkQueueWithBlock:(id)a3;
- (void)_movieWrittenToFilePath:(id)a3 duration:(id *)a4 metadata:(id)a5 state:(id)a6;
- (void)_notifyAssetsdOfIncomingMovieAtPath:(id)a3 duration:(id *)a4 metadata:(id)a5 state:(id)a6;
- (void)_performPendingWork;
- (void)_permanentlyFailTimelapseUUID:(id)a3 withState:(id)a4;
- (void)_reserveDummyFileForTimelapseUUID:(id)a3 firstImageFilePath:(id)a4 useHEVC:(BOOL)a5;
- (void)_saveTimelapseDirectoryForDebuggingTimelapseUUID:(id)a3;
- (void)_setCapturing:(BOOL)a3;
- (void)_setCurrentState:(id)a3;
- (void)_updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3;
- (void)_updateSessionContext:(id)a3 withState:(id)a4;
- (void)_workQueue_destroyApplicationStateMonitor;
- (void)_workQueue_setupCameraProcessMonitoringIfNecessary;
- (void)_writeMovieForSessionContext:(id)a3;
- (void)dealloc;
- (void)finishCaptureForTimelapseWithUUID:(id)a3;
- (void)handleClientConnection:(id)a3;
- (void)handleClientDisconnection;
- (void)resumeTimelapseWithUUID:(id)a3;
- (void)startTimelapseWithUUID:(id)a3;
- (void)stopTimelapseWithUUID:(id)a3;
- (void)updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3;
- (void)updateTimelapseWithUUID:(id)a3;
- (void)videoRequestDidCompleteRemotePersistence:(id)a3 withResponse:(id)a4 error:(id)a5;
@end

@implementation CAMTimelapseBackendController

- (CAMTimelapseBackendController)initWithPersistenceController:(id)a3 keepAliveController:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v28 = a4;
  v38.receiver = self;
  v38.super_class = (Class)CAMTimelapseBackendController;
  v7 = [(CAMTimelapseBackendController *)&v38 init];
  if (v7)
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "CAMTimelapseBackendController initialized", (uint8_t *)buf, 2u);
    }

    objc_storeStrong((id *)&v7->__persistenceController, a3);
    objc_storeStrong((id *)&v7->__keepAliveController, a4);
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "array", v27);
    sessionContexts = v7->__sessionContexts;
    v7->__sessionContexts = (NSMutableArray *)v9;

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.camera.timelapse.backend.work", v11);
    workQueue = v7->__workQueue;
    v7->__workQueue = (OS_dispatch_queue *)v12;

    v14 = +[CAMTimelapseDiskUtilities readSortedStatesFromDiskMergeSecondaryState:1];
    v15 = [v14 lastObject];
    [(CAMTimelapseBackendController *)v7 _setCurrentState:v15];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v35;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v16);
          }
          keepAliveController = v7->__keepAliveController;
          v21 = [*(id *)(*((void *)&v34 + 1) + 8 * v19) timelapseUUID];
          [(CAMNebulaKeepAliveController *)keepAliveController startKeepAliveForIdentifier:v21];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v17);
    }

    objc_initWeak(buf, v7);
    v22 = [(CAMTimelapseBackendController *)v7 _workQueue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __83__CAMTimelapseBackendController_initWithPersistenceController_keepAliveController___block_invoke;
    handler[3] = &unk_263FA0BE0;
    objc_copyWeak(&v32, buf);
    notify_register_dispatch("com.apple.camera.nebulad.io.suspend", &v7->__notifyRegisterTokenSuspendIO, v22, handler);

    v23 = [(CAMTimelapseBackendController *)v7 _workQueue];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __83__CAMTimelapseBackendController_initWithPersistenceController_keepAliveController___block_invoke_5;
    v29[3] = &unk_263FA0BE0;
    objc_copyWeak(&v30, buf);
    notify_register_dispatch("com.apple.camera.nebulad.io.resume", &v7->__notifyRegisterTokenResumeIO, v23, v29);

    v7->__oldMovieWriterEnabled = CFPreferencesGetAppBooleanValue(@"CAMTimelapseOldMovieWriterEnabled", @"com.apple.camera", 0) != 0;
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    transactionForPersistenceUUID = v7->__transactionForPersistenceUUID;
    v7->__transactionForPersistenceUUID = v24;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(buf);
  }
  return v7;
}

void __83__CAMTimelapseBackendController_initWithPersistenceController_keepAliveController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _movieWriter];
  if (v2)
  {
    v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Suspending timelapse IO work for Camera", v4, 2u);
    }

    [v2 setSuspended:1];
    objc_msgSend(WeakRetained, "_workQueue_setupCameraProcessMonitoringIfNecessary");
  }
}

void __83__CAMTimelapseBackendController_initWithPersistenceController_keepAliveController___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _movieWriter];
  if (v2)
  {
    v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Resuming timelapse IO work", v4, 2u);
    }

    [v2 setSuspended:0];
  }
}

- (CAMTimelapseBackendController)init
{
  [(CAMTimelapseBackendController *)self doesNotRecognizeSelector:a2];
  return [(CAMTimelapseBackendController *)self initWithPersistenceController:0 keepAliveController:0];
}

- (void)dealloc
{
  notify_cancel(self->__notifyRegisterTokenSuspendIO);
  notify_cancel(self->__notifyRegisterTokenResumeIO);
  v3 = [(CAMTimelapseBackendController *)self _workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CAMTimelapseBackendController_dealloc__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)CAMTimelapseBackendController;
  [(CAMTimelapseBackendController *)&v4 dealloc];
}

uint64_t __40__CAMTimelapseBackendController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_destroyApplicationStateMonitor");
}

- (void)_setCurrentState:(id)a3
{
  v5 = (CAMTimelapseState *)a3;
  p_currentState = &self->__currentState;
  if (self->__currentState != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_currentState, a3);
    p_currentState = (CAMTimelapseState **)[(CAMTimelapseBackendController *)self _setCapturing:[(CAMTimelapseState *)self->__currentState canContinueCapture]];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_currentState, v5);
}

- (void)_setCapturing:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->__capturing != a3)
  {
    self->__BOOL capturing = a3;
    objc_super v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL capturing = self->__capturing;
      v6[0] = 67109120;
      v6[1] = capturing;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Capturing=%d", (uint8_t *)v6, 8u);
    }
  }
}

- (void)_dispatchToWorkQueueWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  workQueue = self->__workQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__CAMTimelapseBackendController__dispatchToWorkQueueWithBlock___block_invoke;
  v9[3] = &unk_263FA0C08;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(workQueue, v9);
}

void __63__CAMTimelapseBackendController__dispatchToWorkQueueWithBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21050BCA0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_dispatchToWorkQueueAfterDelay:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = (void *)os_transaction_create();
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  workQueue = self->__workQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__CAMTimelapseBackendController__dispatchToWorkQueueAfterDelay_withBlock___block_invoke;
  v12[3] = &unk_263FA0C08;
  id v13 = v7;
  id v14 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_after(v8, workQueue, v12);
}

void __74__CAMTimelapseBackendController__dispatchToWorkQueueAfterDelay_withBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21050BCA0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_dispatchToMainQueueWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)os_transaction_create();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CAMTimelapseBackendController__dispatchToMainQueueWithBlock___block_invoke;
  v7[3] = &unk_263FA0C08;
  id v8 = v4;
  id v9 = v3;
  id v5 = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __63__CAMTimelapseBackendController__dispatchToMainQueueWithBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21050BCA0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startTimelapseWithUUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(CAMNebulaKeepAliveController *)self->__keepAliveController startKeepAliveForIdentifier:v4];
  id v5 = +[CAMTimelapseDiskUtilities readStateForTimelapseUUID:v4 mergeSecondaryState:1];

  [(CAMTimelapseBackendController *)self _setCurrentState:v5];
}

- (void)resumeTimelapseWithUUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = +[CAMTimelapseDiskUtilities readStateForTimelapseUUID:v4 mergeSecondaryState:1];

  [(CAMTimelapseBackendController *)self _setCurrentState:v5];
}

- (void)updateTimelapseWithUUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = +[CAMTimelapseDiskUtilities readStateForTimelapseUUID:v4 mergeSecondaryState:1];
  [(CAMTimelapseBackendController *)self _setCurrentState:v5];
  id v6 = (void *)[(CAMTimelapseState *)self->__currentState copy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__CAMTimelapseBackendController_updateTimelapseWithUUID___block_invoke;
  v9[3] = &unk_263FA0CD0;
  void v9[4] = self;
  id v10 = v4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v4;
  [(CAMTimelapseBackendController *)self _dispatchToWorkQueueWithBlock:v9];
}

void __57__CAMTimelapseBackendController_updateTimelapseWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getOrCreateSessionContextForTimelapseUUID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateSessionContext:v2 withState:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _performPendingWork];
}

- (void)finishCaptureForTimelapseWithUUID:(id)a3
{
}

- (void)stopTimelapseWithUUID:(id)a3
{
}

- (void)updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __78__CAMTimelapseBackendController_updatePendingWorkFromDiskForceEndLastSession___block_invoke;
  v3[3] = &unk_263FA02A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CAMTimelapseBackendController *)self _dispatchToWorkQueueWithBlock:v3];
}

uint64_t __78__CAMTimelapseBackendController_updatePendingWorkFromDiskForceEndLastSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePendingWorkFromDiskForceEndLastSession:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "CAMTimelapseBackendController _updatePendingWorkFromDiskForceEndLastSession:%d", buf, 8u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  id v6 = +[CAMTimelapseDiskUtilities timelapseUUIDsOnDisk];
  id v7 = +[CAMTimelapseDiskUtilities readSortedStatesFromDiskMergeSecondaryState:1];
  id v8 = [MEMORY[0x263EFF9C0] set];
  id v9 = [MEMORY[0x263EFF9C0] setWithArray:v6];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke;
  v18[3] = &unk_263FA6ED8;
  id v10 = v8;
  id v19 = v10;
  id v11 = v9;
  id v20 = v11;
  [v7 enumerateObjectsUsingBlock:v18];
  [v10 enumerateObjectsUsingBlock:&__block_literal_global_59];
  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3;
  v17[3] = &unk_263FA6F20;
  v17[4] = self;
  v17[5] = buf;
  [v11 enumerateObjectsUsingBlock:v17];
  if (v22[24])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_21;
    v16[3] = &unk_263FA0208;
    v16[4] = self;
    [(CAMTimelapseBackendController *)self _dispatchToWorkQueueAfterDelay:v16 withBlock:5.0];
  }
  uint64_t v12 = [v7 count];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_2_22;
  v14[3] = &unk_263FA6F48;
  BOOL v15 = v3;
  v14[4] = self;
  v14[5] = v12 - 1;
  [v7 enumerateObjectsUsingBlock:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3_24;
  v13[3] = &unk_263FA6F70;
  v13[4] = self;
  [v7 enumerateObjectsUsingBlock:v13];
  [(CAMTimelapseBackendController *)self _performPendingWork];
  _Block_object_dispose(buf, 8);
}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 timelapseUUID];
  [v3 addObject:v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 timelapseUUID];

  [v6 removeObject:v7];
}

id __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CAMTimelapseDiskUtilities updateSecondaryStateForTimelapseUUID:a2 forStateReadSuccessfully:1];
}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[CAMTimelapseDiskUtilities updateSecondaryStateForTimelapseUUID:v3 forStateReadSuccessfully:0];
  uint64_t v5 = [v4 failedStateReadAttemptsCount];
  id v6 = +[CAMTimelapseSettings sharedInstance];
  uint64_t v7 = [v6 maxFailedStateReadAttempts];

  id v8 = os_log_create("com.apple.camera", "Nebula");
  id v9 = v8;
  if (v5 >= v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3_cold_1();
    }

    [*(id *)(a1 + 32) _permanentlyFailTimelapseUUID:v3 withState:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v3;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "No state found for directory %{public}@ after %ld attempts. Will retry...", (uint8_t *)&v10, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePendingWorkFromDiskForceEndLastSession:0];
}

uint64_t __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_2_22(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  uint64_t v5 = [v13 canContinueCapture];
  id v6 = v13;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v7 = 128;
    }
    else
    {
      if (*(void *)(a1 + 40) == a3)
      {
        uint64_t v5 = [*(id *)(a1 + 32) _isCameraRunning];
        id v6 = v13;
        if (v5) {
          goto LABEL_10;
        }
        uint64_t v7 = 64;
        id v8 = v13;
        goto LABEL_9;
      }
      uint64_t v7 = 16;
    }
    id v8 = v13;
LABEL_9:
    id v9 = [v8 timelapseUUID];
    int v10 = [MEMORY[0x263EFF910] date];
    id v11 = +[CAMTimelapseDiskUtilities updateSecondaryStateForTimelapseUUID:v9 withStopReasons:v7 stopTime:v10];

    [v13 mergeSecondaryState:v11];
    [v13 forceCompleted];
    +[CAMTimelapseDiskUtilities writeStateToDisk:v13 createDirectoryIfNeeded:0];

    id v6 = v13;
  }
LABEL_10:
  return MEMORY[0x270F9A758](v5, v6);
}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 timelapseUUID];
  id v4 = [*(id *)(a1 + 32) _getOrCreateSessionContextForTimelapseUUID:v5];
  [*(id *)(a1 + 32) _updateSessionContext:v4 withState:v3];
}

- (void)_updateSessionContext:(id)a3 withState:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  [v6 setState:v7];
  id v8 = [v6 timelapseUUID];
  id v9 = +[CAMTimelapseDiskUtilities readFrameFilePathsForTimelapseUUID:v8];

  if ([v9 count])
  {
    uint64_t v10 = [v7 frameIndexStride];
    char v11 = [v7 isReadyForWritingMovie];
    char v12 = [v7 canContinueCapture];
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__CAMTimelapseBackendController__updateSessionContext_withState___block_invoke;
    v23[3] = &unk_263FA6F98;
    uint64_t v26 = v10;
    id v15 = v13;
    id v24 = v15;
    char v27 = v12;
    id v16 = v14;
    id v25 = v16;
    [v9 enumerateKeysAndObjectsUsingBlock:v23];
    if ((v12 & 1) == 0 && (v11 & 1) == 0)
    {
      +[CAMTimelapseState maxTimeToWaitForWrittenFrameAfterStop];
      double v18 = v17;
      id v19 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v29 = v18;
        _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "Timelapse stopped but we are still waiting for the last frames to be written before we can write the movie. Will check again in %f seconds in case we are never notified of the final frames", buf, 0xCu);
      }

      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __65__CAMTimelapseBackendController__updateSessionContext_withState___block_invoke_27;
      v22[3] = &unk_263FA0208;
      v22[4] = self;
      [(CAMTimelapseBackendController *)self _dispatchToWorkQueueAfterDelay:v22 withBlock:v18];
    }
    id v20 = +[CAMTimelapseDiskUtilities sortedArrayFromFilePathDictionary:v15 reverse:1];
    v21 = +[CAMTimelapseDiskUtilities sortedArrayFromFilePathDictionary:v16 reverse:0];
  }
  else
  {
    v21 = 0;
    id v20 = 0;
  }
  [v6 setFilesToDelete:v20];
  [v6 setFilesToWrite:v21];
}

void __65__CAMTimelapseBackendController__updateSessionContext_withState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(uint64_t *)(a1 + 48) >= 2 && [v7 integerValue] % *(void *)(a1 + 48))
  {
    id v6 = (id *)(a1 + 32);
  }
  else
  {
    if (*(unsigned char *)(a1 + 56)) {
      goto LABEL_7;
    }
    id v6 = (id *)(a1 + 40);
  }
  [*v6 setObject:v5 forKey:v7];
LABEL_7:
}

uint64_t __65__CAMTimelapseBackendController__updateSessionContext_withState___block_invoke_27(uint64_t a1)
{
  id v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Checking if there is work to do after delay", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updatePendingWorkFromDiskForceEndLastSession:0];
}

- (id)_getOrCreateSessionContextForTimelapseUUID:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__32;
  uint64_t v23 = __Block_byref_object_dispose__32;
  id v24 = 0;
  sessionContexts = self->__sessionContexts;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __76__CAMTimelapseBackendController__getOrCreateSessionContextForTimelapseUUID___block_invoke;
  id v16 = &unk_263FA6FC0;
  id v6 = v4;
  id v17 = v6;
  double v18 = &v19;
  [(NSMutableArray *)sessionContexts enumerateObjectsUsingBlock:&v13];
  id v7 = (void *)v20[5];
  if (!v7)
  {
    id v8 = [CAMTimelapseBackendSessionContext alloc];
    uint64_t v9 = -[CAMTimelapseBackendSessionContext initWithTimelapseUUID:](v8, "initWithTimelapseUUID:", v6, v13, v14, v15, v16);
    uint64_t v10 = (void *)v20[5];
    v20[5] = v9;

    [(NSMutableArray *)self->__sessionContexts addObject:v20[5]];
    id v7 = (void *)v20[5];
  }
  id v11 = v7;

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __76__CAMTimelapseBackendController__getOrCreateSessionContextForTimelapseUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 timelapseUUID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_performPendingWork
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  sessionContexts = self->__sessionContexts;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke;
  v19[3] = &unk_263FA6FC0;
  v19[4] = self;
  v19[5] = &v20;
  [(NSMutableArray *)sessionContexts enumerateObjectsUsingBlock:v19];
  if (*((unsigned char *)v21 + 24)) {
    goto LABEL_7;
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__32;
  id v17 = __Block_byref_object_dispose__32;
  id v18 = 0;
  id v4 = self->__sessionContexts;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke_2;
  v12[3] = &unk_263FA6FC0;
  void v12[4] = self;
  v12[5] = &v13;
  [(NSMutableArray *)v4 enumerateObjectsUsingBlock:v12];
  id v5 = (void *)v14[5];
  if (v5)
  {
    id v6 = [v5 timelapseUUID];
    id v7 = [(id)v14[5] state];
    int v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v6;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Deleting timelapse session that completed with zero frames: %{public}@", buf, 0xCu);
    }

    [(CAMTimelapseBackendController *)self _permanentlyFailTimelapseUUID:v6 withState:v7];
    *((unsigned char *)v21 + 24) = 1;
  }
  _Block_object_dispose(&v13, 8);

  if (*((unsigned char *)v21 + 24)) {
    goto LABEL_7;
  }
  if (!self->__writingMovie)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__32;
    id v17 = __Block_byref_object_dispose__32;
    id v18 = 0;
    id v9 = self->__sessionContexts;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke_38;
    v11[3] = &unk_263FA6FC0;
    v11[4] = self;
    v11[5] = &v13;
    [(NSMutableArray *)v9 enumerateObjectsUsingBlock:v11];
    if (v14[5])
    {
      -[CAMTimelapseBackendController _writeMovieForSessionContext:](self, "_writeMovieForSessionContext:");
      *((unsigned char *)v21 + 24) = 1;
    }
    _Block_object_dispose(&v13, 8);

    if (*((unsigned char *)v21 + 24))
    {
LABEL_7:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke_2_39;
      v10[3] = &unk_263FA0208;
      v10[4] = self;
      [(CAMTimelapseBackendController *)self _dispatchToWorkQueueWithBlock:v10];
    }
  }
  _Block_object_dispose(&v20, 8);
}

void __52__CAMTimelapseBackendController__performPendingWork__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  id v6 = [v17 filesToDelete];
  if ([v6 count])
  {
    id v7 = [v6 lastObject];
    if ([v7 length]) {
      [*(id *)(a1 + 32) _deleteItemAtPath:v7];
    }
    int v8 = [v7 stringByDeletingPathExtension];
    id v9 = [v8 stringByAppendingPathExtension:@"DBG"];

    uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
    int v11 = [v10 fileExistsAtPath:v9];

    if (v11) {
      [*(id *)(a1 + 32) _deleteItemAtPath:v9];
    }
    char v12 = [v7 stringByDeletingPathExtension];
    uint64_t v13 = [v12 stringByAppendingPathExtension:@"tvis"];

    uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
    int v15 = [v14 fileExistsAtPath:v13];

    if (v15) {
      [*(id *)(a1 + 32) _deleteItemAtPath:v13];
    }
    if ((unint64_t)[v6 count] < 2)
    {
      id v16 = 0;
    }
    else
    {
      id v16 = objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);
    }
    [v17 setFilesToDelete:v16];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __52__CAMTimelapseBackendController__performPendingWork__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  int v8 = [v7 state];
  int v9 = [v8 isReadyForWritingMovie];
  uint64_t v10 = [v7 filesToWrite];
  uint64_t v11 = [v10 count];

  if (v9 && !v11)
  {
    char v12 = [v7 timelapseUUID];
    uint64_t v13 = +[CAMTimelapseDiskUtilities readFrameFilePathsForTimelapseUUID:v12];

    if ([v13 count])
    {
      uint64_t v14 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [v8 fullDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v15;
        _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, "Timelapse session thought it had no files to write but frames found on disk for: %{public}@", buf, 0xCu);
      }
      id v16 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke_37;
      v17[3] = &unk_263FA0208;
      v17[4] = v16;
      [v16 _dispatchToWorkQueueAfterDelay:v17 withBlock:2.0];
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

uint64_t __52__CAMTimelapseBackendController__performPendingWork__block_invoke_37(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePendingWorkFromDiskForceEndLastSession:0];
}

void __52__CAMTimelapseBackendController__performPendingWork__block_invoke_38(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = [v11 state];
  int v8 = [v11 filesToWrite];
  if ([v8 count])
  {
    if ([v7 isReadyForWritingMovie])
    {
      int v9 = *(void **)(a1 + 32);
      uint64_t v10 = [v11 timelapseUUID];
      LOBYTE(v9) = [v9 _scheduleDelayedMovieWriteIfNeededForTimelapseUUID:v10];

      if ((v9 & 1) == 0)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *a4 = 1;
      }
    }
  }
}

uint64_t __52__CAMTimelapseBackendController__performPendingWork__block_invoke_2_39(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPendingWork];
}

- (void)_permanentlyFailTimelapseUUID:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseBackendController _permanentlyFailTimelapseUUID:withState:](v7, v8);
    }
  }
  int v9 = +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:v6];
  if ([(CAMTimelapseBackendController *)self _shouldSaveLastTimelapseDataForDebugging])
  {
    [(CAMTimelapseBackendController *)self _saveTimelapseDirectoryForDebuggingTimelapseUUID:v6];
  }
  else
  {
    [(CAMTimelapseBackendController *)self _deleteItemAtPath:v9];
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__32;
  uint64_t v22 = __Block_byref_object_dispose__32;
  id v23 = 0;
  sessionContexts = self->__sessionContexts;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __73__CAMTimelapseBackendController__permanentlyFailTimelapseUUID_withState___block_invoke;
  int v15 = &unk_263FA6FC0;
  id v11 = v6;
  id v16 = v11;
  id v17 = &v18;
  [(NSMutableArray *)sessionContexts enumerateObjectsUsingBlock:&v12];
  if (v19[5]) {
    -[NSMutableArray removeObject:](self->__sessionContexts, "removeObject:", v12, v13, v14, v15);
  }
  -[CAMNebulaKeepAliveController stopKeepAliveForIdentifier:](self->__keepAliveController, "stopKeepAliveForIdentifier:", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v18, 8);
}

void __73__CAMTimelapseBackendController__permanentlyFailTimelapseUUID_withState___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 state];
  int v8 = [v7 timelapseUUID];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)_scheduleDelayedMovieWriteIfNeededForTimelapseUUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CAMTimelapseDiskUtilities readSecondaryStateForTimelapseUUID:v4];
  uint64_t v6 = [v5 movieWriteAttemptsCount];
  if (v6 < 1)
  {
    BOOL v16 = 0;
  }
  else
  {
    uint64_t v7 = v6;
    int v8 = [v5 lastMovieWriteAttemptTime];
    int v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSinceDate:v8];
    double v11 = v10;

    uint64_t v12 = +[CAMTimelapseSettings sharedInstance];
    [v12 waitTimeBeforeNextWriteForNumberOfPreviousAttempts:v7];
    double v14 = v13;

    double v15 = v14 - v11;
    BOOL v16 = v15 > 0.0;
    if (v15 > 0.0)
    {
      id v17 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v21 = v4;
        __int16 v22 = 2048;
        double v23 = v15;
        _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Not ready to write movie for timelapse %{public}@. Delaying %.2f seconds", buf, 0x16u);
      }

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __84__CAMTimelapseBackendController__scheduleDelayedMovieWriteIfNeededForTimelapseUUID___block_invoke;
      v19[3] = &unk_263FA0208;
      v19[4] = self;
      [(CAMTimelapseBackendController *)self _dispatchToWorkQueueAfterDelay:v19 withBlock:v15];
    }
  }
  return v16;
}

uint64_t __84__CAMTimelapseBackendController__scheduleDelayedMovieWriteIfNeededForTimelapseUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPendingWork];
}

- (BOOL)_deleteItemAtPath:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    id v9 = 0;
    char v5 = [v4 removeItemAtPath:v3 error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      uint64_t v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseBackendController _deleteItemAtPath:]();
      }
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_writeMovieForSessionContext:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  char v5 = [v4 state];
  uint64_t v6 = [v5 timelapseUUID];
  uint64_t v7 = os_log_create("com.apple.camera", "Nebula");
  v49 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 stopReasons];
    id v9 = [v49 fullDescription];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    char v5 = v49;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v9;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Starting to write timelapse movie for %{public}@ (stopReasons = %ld) %{public}@", buf, 0x20u);
  }
  v47 = +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:v6];
  uint64_t v10 = [v47 stringByAppendingPathComponent:@"MOVIE.MOV"];
  v46 = [MEMORY[0x263F08850] defaultManager];
  if ([v46 fileExistsAtPath:v10]) {
    [(CAMTimelapseBackendController *)self _deleteItemAtPath:v10];
  }
  v41 = (void *)v10;
  +[CAMTimelapseDiskUtilities removeDummyFileForTimelapseUUID:v6];
  v44 = (void *)v6;
  uint64_t v40 = +[CAMTimelapseDiskUtilities updateSecondaryStateForMovieWriteAttemptForTimelapseUUID:v6];
  v42 = self;
  [(CAMTimelapseBackendController *)self _createPlaceholderAssetForState:v5];
  v48 = v4;
  double v11 = [v4 filesToWrite];
  uint64_t v12 = (void *)[v11 copy];

  uint64_t v38 = [v12 count];
  double v13 = [MEMORY[0x263EFF980] array];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v61 + 1) + 8 * i) stringByDeletingPathExtension];
        uint64_t v20 = [v19 stringByAppendingPathExtension:@"tvis"];

        id v21 = [MEMORY[0x263F08850] defaultManager];
        char v22 = [v21 fileExistsAtPath:v20];

        if ((v22 & 1) == 0)
        {

          goto LABEL_15;
        }
        [v13 addObject:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  double v23 = +[CAMTimelapseSettings sharedInstance];
  [v23 outputFPSForFrameCount:v38];
  double v25 = v24;

  long long v66 = 0u;
  memset(buf, 0, sizeof(buf));
  [(CAMTimelapseBackendController *)v42 _frameTransformForState:v49];
  v39 = [v49 startTime];
  long long v37 = [v49 startLocation];
  char v26 = [v49 preferHEVC];
  char v27 = (void *)os_transaction_create();
  v42->__writingMovie = 1;
  [v13 count];
  id v28 = (CAMTimelapseMovieWriterProtocol *)objc_alloc_init((Class)objc_opt_class());
  movieWriter = v42->__movieWriter;
  v42->__movieWriter = v28;

  if (+[CAMProtectionController isCameraPerformingHighPriorityDiskActivity])
  {
    uint64_t v30 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_2099F8000, v30, OS_LOG_TYPE_DEFAULT, "Starting timelapse movie writer suspended for Camera", v50, 2u);
    }

    [(CAMTimelapseBackendController *)v42 _workQueue_setupCameraProcessMonitoringIfNecessary];
    [(CAMTimelapseMovieWriterProtocol *)v42->__movieWriter setSuspended:[(CAMTimelapseBackendController *)v42 _isCameraRunning]];
  }
  v31 = v42->__movieWriter;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke;
  v53[3] = &unk_263FA7010;
  v53[4] = v42;
  id v54 = v41;
  id v55 = v49;
  id v56 = v40;
  id v57 = v44;
  id v58 = v14;
  char v60 = v26;
  id v59 = v27;
  *(_OWORD *)v50 = *(_OWORD *)buf;
  long long v51 = *(_OWORD *)&buf[16];
  long long v52 = v66;
  id v43 = v27;
  id v32 = v14;
  id v45 = v44;
  id v33 = v40;
  id v34 = v49;
  id v35 = v41;
  LOBYTE(v36) = v26;
  [(CAMTimelapseMovieWriterProtocol *)v31 writeMovieFromImageFiles:v32 visMetadataFiles:v13 startDate:v39 location:v37 outputPath:v35 transform:v50 framesPerSecond:(uint64_t)v25 preferHEVC:v36 completionHandler:v53];
}

void __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke(uint64_t a1, char a2, long long *a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2;
  v11[3] = &unk_263FA6FE8;
  char v21 = a2;
  v11[4] = v8;
  id v9 = *(id *)(a1 + 40);
  long long v19 = *a3;
  uint64_t v20 = *((void *)a3 + 2);
  id v12 = v9;
  id v13 = v7;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 88);
  id v18 = *(id *)(a1 + 80);
  id v10 = v7;
  [v8 _dispatchToWorkQueueWithBlock:v11];
}

uint64_t __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 120))
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    long long v17 = *(_OWORD *)(a1 + 96);
    uint64_t v18 = *(void *)(a1 + 112);
    [v2 _movieWrittenToFilePath:v3 duration:&v17 metadata:v4 state:v5];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 64) movieWriteAttemptsCount];
    id v7 = +[CAMTimelapseSettings sharedInstance];
    uint64_t v8 = [v7 maxMovieWriteAttempts];

    id v9 = os_log_create("com.apple.camera", "Nebula");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6 >= v8)
    {
      if (v10) {
        __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2_cold_2();
      }

      [*(id *)(a1 + 32) _permanentlyFailTimelapseUUID:*(void *)(a1 + 72) withState:*(void *)(a1 + 56)];
    }
    else
    {
      if (v10) {
        __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2_cold_1();
      }

      double v11 = [*(id *)(a1 + 80) objectAtIndex:0];
      [*(id *)(a1 + 32) _reserveDummyFileForTimelapseUUID:*(void *)(a1 + 72) firstImageFilePath:v11 useHEVC:*(unsigned __int8 *)(a1 + 121)];
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  [*(id *)(*(void *)(a1 + 32) + 40) setSuspended:0];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_workQueue_destroyApplicationStateMonitor");
  id v14 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_47;
  v16[3] = &unk_263FA0208;
  v16[4] = v14;
  return [v14 _dispatchToWorkQueueWithBlock:v16];
}

uint64_t __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_47(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPendingWork];
}

- (void)_reserveDummyFileForTimelapseUUID:(id)a3 firstImageFilePath:(id)a4 useHEVC:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v11 = +[CAMTimelapseJPEGReader newDataFromFilePath:a4];
  uint64_t v8 = +[CAMTimelapseJPEGReader createPixelBufferFromData:v11 applyTransform:1 maxPixelSize:0 useBGRA:0];
  size_t Width = CVPixelBufferGetWidth(v8);
  size_t Height = CVPixelBufferGetHeight(v8);
  CVPixelBufferRelease(v8);
  +[CAMTimelapseDiskUtilities reserveDummyFileForTimelapseUUID:v7 width:Width height:Height useHEVC:v5];
}

- (void)_createPlaceholderAssetForState:(id)a3
{
  uint64_t v4 = +[CAMTimelapseController createPlaceholderResultForTimelapseState:a3];
  if (v4)
  {
    BOOL v5 = (void *)os_transaction_create();
    uint64_t v6 = [(CAMTimelapseBackendController *)self _persistenceController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__CAMTimelapseBackendController__createPlaceholderAssetForState___block_invoke;
    v8[3] = &unk_263FA5770;
    id v9 = v5;
    id v7 = v5;
    [v6 persistPlaceholderTimelapseVideoWithResult:v4 completionHandler:v8];
  }
}

- (void)_movieWrittenToFilePath:(id)a3 duration:(id *)a4 metadata:(id)a5 state:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  id v13 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v12 timelapseUUID];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Finished writing timelapse movie for %{public}@", buf, 0xCu);
  }
  id v15 = (void *)MEMORY[0x263F5DB30];
  id v16 = [v12 timelapseUUID];
  long long v17 = [v15 uniqueIncomingPathForAssetWithUUID:v16 andExtension:@"MOV" isPhotoStream:0];

  uint64_t v18 = [MEMORY[0x263F08850] defaultManager];
  id v27 = 0;
  int v19 = [v18 linkItemAtPath:v10 toPath:v17 error:&v27];
  id v20 = v27;
  if (v19)
  {
    BOOL v21 = [(CAMTimelapseBackendController *)self _shouldSaveLastTimelapseDataForDebugging];
    if (!v21) {
      [(CAMTimelapseBackendController *)self _deleteItemAtPath:v10];
    }
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(CAMTimelapseBackendController *)self _notifyAssetsdOfIncomingMovieAtPath:v17 duration:buf metadata:v11 state:v12];
    char v22 = [v12 timelapseUUID];
    double v23 = +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:v22];

    if (v21)
    {
      double v24 = [v12 timelapseUUID];
      [(CAMTimelapseBackendController *)self _saveTimelapseDirectoryForDebuggingTimelapseUUID:v24];
    }
    else
    {
      [(CAMTimelapseBackendController *)self _deleteItemAtPath:v23];
    }
    double v25 = [v12 timelapseUUID];
    char v26 = [(CAMTimelapseBackendController *)self _getOrCreateSessionContextForTimelapseUUID:v25];

    [(NSMutableArray *)self->__sessionContexts removeObject:v26];
  }
  else
  {
    double v23 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseBackendController _movieWrittenToFilePath:duration:metadata:state:]();
    }
  }
}

- (BOOL)_shouldSaveLastTimelapseDataForDebugging
{
  CFPreferencesAppSynchronize(@"com.apple.camera");
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(@"CAMSaveLastTimelapseData", @"com.apple.camera", &keyExistsAndHasValidFormat) != 0;
}

- (void)_saveTimelapseDirectoryForDebuggingTimelapseUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:v4];
  +[CAMTimelapseDiskUtilities removeDummyFileForTimelapseUUID:v4];

  uint64_t v6 = +[CAMTimelapseDiskUtilities timelapseDirectoryPath];
  id v7 = [v6 stringByDeletingLastPathComponent];
  uint64_t v8 = [v7 stringByAppendingPathComponent:@"LastTimelapse"];

  id v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8];

  if (v10) {
    [(CAMTimelapseBackendController *)self _deleteItemAtPath:v8];
  }
  id v11 = [MEMORY[0x263F08850] defaultManager];
  id v16 = 0;
  int v12 = [v11 moveItemAtPath:v5 toPath:v8 error:&v16];
  id v13 = v16;

  id v14 = os_log_create("com.apple.camera", "Nebula");
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "Copied timelapse directory from %{public}@ to %{public}@ for debugging", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_error_impl(&dword_2099F8000, v15, OS_LOG_TYPE_ERROR, "Deleting directory after failing to move %{public}@ to %{public}@: %{public}@", buf, 0x20u);
    }

    [(CAMTimelapseBackendController *)self _deleteItemAtPath:v5];
  }
}

- (void)_notifyAssetsdOfIncomingMovieAtPath:(id)a3 duration:(id *)a4 metadata:(id)a5 state:(id)a6
{
  workQueue = self->__workQueue;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v14 = [v11 captureOrientation];
  uint64_t v15 = [v11 captureDevice];
  id v16 = [v11 startLocation];
  long long v17 = [v11 timelapseUUID];
  uint64_t v18 = objc_alloc_init(CAMMutableVideoCaptureRequest);
  [(CAMMutableVideoCaptureRequest *)v18 setTorchMode:0];
  [(CAMMutableVideoCaptureRequest *)v18 setCaptureOrientation:v14];
  -[CAMMutableVideoCaptureRequest setCaptureMirrored:](v18, "setCaptureMirrored:", [v11 isCaptureMirrored]);
  [(CAMMutableVideoCaptureRequest *)v18 setCaptureDevice:v15];
  [(CAMMutableVideoCaptureRequest *)v18 setLocation:v16];
  [(CAMMutableVideoCaptureRequest *)v18 setPersistenceUUID:v17];
  [(CAMMutableVideoCaptureRequest *)v18 setTimelapse:1];
  LODWORD(v14) = [v11 preferHEVC];

  [(CAMMutableVideoCaptureRequest *)v18 setVideoEncodingBehavior:v14];
  [(CAMMutableVideoCaptureRequest *)v18 setDelegate:self];
  __int16 v19 = (void *)os_transaction_create();
  id v20 = [(CAMTimelapseBackendController *)self _transactionForPersistenceUUID];
  [v20 setObject:v19 forKeyedSubscript:v17];

  __int16 v21 = [NSURL fileURLWithPath:v13];

  id v22 = [CAMVideoCaptureResult alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v28 = *a4;
  long long v26 = *MEMORY[0x263F01090];
  uint64_t v27 = *(void *)(MEMORY[0x263F01090] + 16);
  LOBYTE(v25) = 0;
  uint64_t v23 = [(CAMVideoCaptureResult *)v22 initWithURL:v21 filteredLocalDestinationURL:0 duration:&v28 stillDisplayTime:&v26 dimensions:0 metadata:v12 videoZoomFactor:1.0 reason:0 videoPreviewPixelBuffer:0 coordinationInfo:0 error:0 slowWriterFrameDrops:v25];

  double v24 = [(CAMTimelapseBackendController *)self _persistenceController];
  [v24 videoRequest:v18 didCompleteCaptureWithResult:v23];
}

- (void)videoRequestDidCompleteRemotePersistence:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v6 = a3;
  id v7 = [(CAMTimelapseBackendController *)self _transactionForPersistenceUUID];
  uint64_t v8 = [v6 persistenceUUID];
  [v7 removeObjectForKey:v8];

  id v9 = [v6 persistenceUUID];

  [(CAMNebulaKeepAliveController *)self->__keepAliveController stopKeepAliveForIdentifier:v9];
}

- (CGAffineTransform)_frameTransformForState:(SEL)a3
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  id v7 = a4;
  int v8 = [v7 captureOrientation];
  int v9 = [v7 isCaptureMirrored];
  unint64_t v10 = [v7 captureDevice];

  unsigned int v12 = (v10 < 0xC) & (0xF02u >> v10);
  switch(v8)
  {
    case 1:
      int v13 = 90;
      break;
    case 2:
      int v13 = 270;
      break;
    case 3:
      if (v12) {
        int v13 = 180;
      }
      else {
        int v13 = 0;
      }
      break;
    case 4:
      if (v12) {
        int v13 = 0;
      }
      else {
        int v13 = 180;
      }
      break;
    default:
      int v13 = 0;
      break;
  }
  if (_frameTransformForState__onceToken != -1) {
    dispatch_once(&_frameTransformForState__onceToken, &__block_literal_global_68);
  }
  if (_frameTransformForState__frontCameraRotation) {
    unsigned int v14 = (v10 < 0xC) & (0xF02u >> v10);
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 == 1)
  {
    int v15 = _frameTransformForState__frontCameraRotation + v13;
    if (_frameTransformForState__frontCameraRotation + v13 > 359) {
      v15 -= 360;
    }
    if (v15 >= 0) {
      int v13 = v15;
    }
    else {
      int v13 = v15 + 360;
    }
  }
  if (v13)
  {
    CGAffineTransformMakeRotation(retstr, (double)v13 * 3.14159265 / 180.0);
    long long v16 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = (CGAffineTransform *)UIIntegralTransform();
    long long v17 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v17;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v22.tx;
  }
  if (v9)
  {
    v20.a = -1.0;
    v20.b = 0.0;
    v20.c = 0.0;
    v20.d = 1.0;
    v20.tx = 0.0;
    v20.ty = 0.0;
    long long v18 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v18;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v22, &t1, &v20);
    long long v19 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v19;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v22.tx;
  }
  return result;
}

uint64_t __57__CAMTimelapseBackendController__frameTransformForState___block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _frameTransformForState__frontCameraRotation = result;
  return result;
}

- (void)handleClientConnection:(id)a3
{
  id v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_V2(v4);

  long long v6 = [(CAMTimelapseState *)self->__currentState timelapseUUID];
  id v7 = +[CAMTimelapseDiskUtilities readStateForTimelapseUUID:v6 mergeSecondaryState:1];

  [(CAMTimelapseBackendController *)self _setCurrentState:v7];
}

- (void)handleClientDisconnection
{
}

- (int)_pidForApplication:(id)a3
{
  id v3 = a3;
  int v4 = -1;
  if (v3)
  {
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = -1;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = objc_alloc_init(MEMORY[0x263F28178]);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    unsigned int v12 = __52__CAMTimelapseBackendController__pidForApplication___block_invoke;
    int v13 = &unk_263FA7038;
    int v15 = &v16;
    id v7 = v5;
    unsigned int v14 = v7;
    [v6 applicationInfoForApplication:v3 completion:&v10];
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v7, v8);
    objc_msgSend(v6, "invalidate", v10, v11, v12, v13);
    int v4 = *((_DWORD *)v17 + 6);

    _Block_object_dispose(&v16, 8);
  }

  return v4;
}

void __52__CAMTimelapseBackendController__pidForApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F28170]];
  if (v3) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 intValue];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isCameraRunning
{
  return [(CAMTimelapseBackendController *)self _pidForApplication:@"com.apple.camera"] != 0;
}

- (void)_workQueue_setupCameraProcessMonitoringIfNecessary
{
  id v3 = [(CAMTimelapseBackendController *)self _workQueue];
  dispatch_assert_queue_V2(v3);

  if (!self->__applicationStateMonitor)
  {
    objc_initWeak(&location, self);
    int v4 = (BKSApplicationStateMonitor *)[objc_alloc(MEMORY[0x263F28178]) initWithBundleIDs:&unk_26BDE0580 states:1];
    applicationStateMonitor = self->__applicationStateMonitor;
    self->__applicationStateMonitor = v4;

    id v6 = self->__applicationStateMonitor;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __83__CAMTimelapseBackendController__workQueue_setupCameraProcessMonitoringIfNecessary__block_invoke;
    v7[3] = &unk_263FA44E0;
    objc_copyWeak(&v8, &location);
    [(BKSApplicationStateMonitor *)v6 setHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __83__CAMTimelapseBackendController__workQueue_setupCameraProcessMonitoringIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  dispatch_semaphore_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F28160]];

  if (v5 && [v5 integerValue] == 1)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    _DWORD v6[2] = __83__CAMTimelapseBackendController__workQueue_setupCameraProcessMonitoringIfNecessary__block_invoke_2;
    v6[3] = &unk_263FA0208;
    id v7 = WeakRetained;
    [v7 _dispatchToWorkQueueWithBlock:v6];
  }
}

void __83__CAMTimelapseBackendController__workQueue_setupCameraProcessMonitoringIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Resuming timelapse IO work because Camera has died", v4, 2u);
  }

  id v3 = [*(id *)(a1 + 32) _movieWriter];
  [v3 setSuspended:0];
}

- (void)_workQueue_destroyApplicationStateMonitor
{
  id v3 = [(CAMTimelapseBackendController *)self _workQueue];
  dispatch_assert_queue_V2(v3);

  [(BKSApplicationStateMonitor *)self->__applicationStateMonitor invalidate];
  applicationStateMonitor = self->__applicationStateMonitor;
  self->__applicationStateMonitor = 0;
}

- (NSMutableArray)_sessionContexts
{
  return self->__sessionContexts;
}

- (OS_dispatch_queue)_workQueue
{
  return self->__workQueue;
}

- (BOOL)_writingMovie
{
  return self->__writingMovie;
}

- (CAMTimelapseMovieWriterProtocol)_movieWriter
{
  return self->__movieWriter;
}

- (CAMTimelapseState)_currentState
{
  return self->__currentState;
}

- (BOOL)_isCapturing
{
  return self->__capturing;
}

- (CAMNebulaKeepAliveController)_keepAliveController
{
  return self->__keepAliveController;
}

- (CAMPersistenceController)_persistenceController
{
  return self->__persistenceController;
}

- (BOOL)_oldMovieWriterEnabled
{
  return self->__oldMovieWriterEnabled;
}

- (NSMutableDictionary)_transactionForPersistenceUUID
{
  return self->__transactionForPersistenceUUID;
}

- (int)_notifyRegisterTokenSuspendIO
{
  return self->__notifyRegisterTokenSuspendIO;
}

- (int)_notifyRegisterTokenResumeIO
{
  return self->__notifyRegisterTokenResumeIO;
}

- (BKSApplicationStateMonitor)_applicationStateMonitor
{
  return self->__applicationStateMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->__transactionForPersistenceUUID, 0);
  objc_storeStrong((id *)&self->__persistenceController, 0);
  objc_storeStrong((id *)&self->__keepAliveController, 0);
  objc_storeStrong((id *)&self->__currentState, 0);
  objc_storeStrong((id *)&self->__movieWriter, 0);
  objc_storeStrong((id *)&self->__workQueue, 0);
  objc_storeStrong((id *)&self->__sessionContexts, 0);
}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "No state found for directory %{public}@ after %ld attempts. Deleting directory.");
}

- (void)_permanentlyFailTimelapseUUID:(void *)a1 withState:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 fullDescription];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Permanently deleting timelapse with state: %{public}@", v4, 0xCu);
}

- (void)_deleteItemAtPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to remove %{public}@: %{public}@");
}

void __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Error: failed to write movie %ld times for timelapse %{public}@. Will retry.");
}

void __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Error: failed to write movie %ld times for timelapse %{public}@. Failing permanently.");
}

- (void)_movieWrittenToFilePath:duration:metadata:state:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2099F8000, v0, OS_LOG_TYPE_ERROR, "Error linking movie: %{public}@", v1, 0xCu);
}

@end
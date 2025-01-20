@interface CAMNebulaIrisBackendController
- (AVAssetExportSession)_activeExportSession;
- (BKSApplicationStateMonitor)_applicationStateMonitor;
- (BOOL)_coordinationQueue_isCrashRecoveryNeeded;
- (BOOL)_coordinationQueue_isIOWorkSuspended;
- (BOOL)_coordinationQueue_shouldCheckMarkerFileForIOWorkSuspension;
- (BOOL)_extractIrisPropertiesFromAVAsset:(id)a3 stillImageDisplayTime:(id *)a4 irisIdentifier:(id *)a5;
- (BOOL)_removeItemAtURL:(id)a3;
- (BOOL)_removeItemAtURL:(id)a3 maxAttempts:(int64_t)a4;
- (CAMNebulaIrisBackendController)init;
- (CAMNebulaIrisBackendController)initWithPersistenceController:(id)a3 keepAliveController:(id)a4;
- (CAMNebulaKeepAliveController)_keepAliveController;
- (CAMPersistenceController)_persistenceController;
- (NSHashTable)_clientConnections;
- (NSMutableArray)_pendingExportVideoJobs;
- (NSMutableDictionary)_bundleIdentifiersByVideoPersistenceUUID;
- (NSMutableDictionary)_pendingOrInFlightJobsByUniqueIdentifier;
- (NSMutableDictionary)_transactionForPersistenceUUID;
- (OS_dispatch_queue)_coordinationQueue;
- (OS_dispatch_queue)_linkWorkQueue;
- (id)_uniqueIdentifierForJob:(id)a3;
- (id)_videoJobFromURL:(id)a3;
- (int)_notifyRegisterTokenResumeIO;
- (int)_notifyRegisterTokenSuspendIO;
- (unint64_t)_coordinationQueue_failureCountForVideoURL:(id)a3;
- (void)_coordinationQueue_createJobsForCrashRecoveryIfNeeded;
- (void)_coordinationQueue_destroyApplicationStateMonitor;
- (void)_coordinationQueue_didCompleteExportJob:(id)a3;
- (void)_coordinationQueue_didPermanentlyFinishJob:(id)a3;
- (void)_coordinationQueue_enqueueAndTrackNewJob:(id)a3;
- (void)_coordinationQueue_enqueueJobs:(id)a3;
- (void)_coordinationQueue_enqueuePendingExportJobIfPossible;
- (void)_coordinationQueue_setCrashRecoveryNeeded:(BOOL)a3;
- (void)_coordinationQueue_setFailureCount:(unint64_t)a3 forVideoURL:(id)a4;
- (void)_coordinationQueue_setIOWorkSuspended:(BOOL)a3;
- (void)_coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:(BOOL)a3;
- (void)_coordinationQueue_setupCameraProcessingMonitoringIfNecessary;
- (void)_dispatchToCoordinationQueueAfterDelay:(double)a3 withBlock:(id)a4;
- (void)_dispatchToCoordinationQueueWithBlock:(id)a3;
- (void)_dispatchToLinkWorkQueueAfterDelay:(double)a3 withBlock:(id)a4;
- (void)_dispatchToLinkWorkQueueWithBlock:(id)a3;
- (void)_dispatchToMainQueueWithBlock:(id)a3;
- (void)_dispatchToQueue:(id)a3 afterDelay:(double)a4 withBlock:(id)a5;
- (void)_dispatchToQueue:(id)a3 withBlock:(id)a4;
- (void)_linkWorkQueue_linkAndPersistSelfContainedVideo:(id)a3;
- (void)_setActiveExportSession:(id)a3;
- (void)dealloc;
- (void)enqueueIrisVideoJobs:(id)a3;
- (void)handleClientConnection:(id)a3;
- (void)handleClientDisconnection:(id)a3;
- (void)performIrisCrashRecovery;
- (void)performIrisCrashRecoveryForceFileSystemCheck:(BOOL)a3;
- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6;
- (void)stillImageRequestDidCompleteVideoRemotePersistence:(id)a3 withResponse:(id)a4 error:(id)a5;
@end

@implementation CAMNebulaIrisBackendController

- (CAMNebulaIrisBackendController)initWithPersistenceController:(id)a3 keepAliveController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)CAMNebulaIrisBackendController;
  v9 = [(CAMNebulaIrisBackendController *)&v38 init];
  if (v9)
  {
    v10 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "CAMNebulaIrisBackendController initialized", (uint8_t *)&buf, 2u);
    }

    objc_storeStrong((id *)&v9->__persistenceController, a3);
    objc_storeStrong((id *)&v9->__keepAliveController, a4);
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.camera.nebula.iris.coordination", v11);
    coordinationQueue = v9->__coordinationQueue;
    v9->__coordinationQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.camera.nebula.iris.link-work", v14);
    linkWorkQueue = v9->__linkWorkQueue;
    v9->__linkWorkQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingOrInFlightJobsByUniqueIdentifier = v9->__pendingOrInFlightJobsByUniqueIdentifier;
    v9->__pendingOrInFlightJobsByUniqueIdentifier = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingExportVideoJobs = v9->__pendingExportVideoJobs;
    v9->__pendingExportVideoJobs = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bundleIdentifiersByVideoPersistenceUUID = v9->__bundleIdentifiersByVideoPersistenceUUID;
    v9->__bundleIdentifiersByVideoPersistenceUUID = v21;

    uint64_t v23 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    clientConnections = v9->__clientConnections;
    v9->__clientConnections = (NSHashTable *)v23;

    v9->__shouldCheckMarkerFileForIOWorkSuspension = 1;
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    transactionForPersistenceUUID = v9->__transactionForPersistenceUUID;
    v9->__transactionForPersistenceUUID = v25;

    objc_initWeak(&buf, v9);
    v27 = [(CAMNebulaIrisBackendController *)v9 _coordinationQueue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke;
    handler[3] = &unk_263FA0BE0;
    objc_copyWeak(&v36, &buf);
    notify_register_dispatch("com.apple.camera.nebulad.io.suspend", &v9->__notifyRegisterTokenSuspendIO, v27, handler);

    v28 = [(CAMNebulaIrisBackendController *)v9 _coordinationQueue];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke_2;
    v33[3] = &unk_263FA0BE0;
    objc_copyWeak(&v34, &buf);
    notify_register_dispatch("com.apple.camera.nebulad.io.resume", &v9->__notifyRegisterTokenResumeIO, v28, v33);

    if (+[CAMIrisDiskUtilities hasPendingWork])
    {
      v29 = [(CAMNebulaIrisBackendController *)v9 _coordinationQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke_3;
      block[3] = &unk_263FA0208;
      v32 = v9;
      dispatch_sync(v29, block);
    }
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&buf);
  }
  return v9;
}

void __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_coordinationQueue_setIOWorkSuspended:", 1);
  objc_msgSend(WeakRetained, "_coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:", 0);
}

void __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_coordinationQueue_setIOWorkSuspended:", 0);
  objc_msgSend(WeakRetained, "_coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:", 0);
}

uint64_t __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setCrashRecoveryNeeded:", 1);
}

- (CAMNebulaIrisBackendController)init
{
  [(CAMNebulaIrisBackendController *)self doesNotRecognizeSelector:a2];
  return [(CAMNebulaIrisBackendController *)self initWithPersistenceController:0 keepAliveController:0];
}

- (void)dealloc
{
  notify_cancel(self->__notifyRegisterTokenSuspendIO);
  notify_cancel(self->__notifyRegisterTokenResumeIO);
  v3 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CAMNebulaIrisBackendController_dealloc__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)CAMNebulaIrisBackendController;
  [(CAMNebulaIrisBackendController *)&v4 dealloc];
}

uint64_t __41__CAMNebulaIrisBackendController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_destroyApplicationStateMonitor");
}

- (void)_dispatchToQueue:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  v6 = a3;
  id v7 = (void *)os_transaction_create();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__CAMNebulaIrisBackendController__dispatchToQueue_withBlock___block_invoke;
  v10[3] = &unk_263FA0C08;
  id v11 = v7;
  id v12 = v5;
  id v8 = v7;
  id v9 = v5;
  dispatch_async(v6, v10);
}

void __61__CAMNebulaIrisBackendController__dispatchToQueue_withBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21050BCA0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_dispatchToQueue:(id)a3 afterDelay:(double)a4 withBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)os_transaction_create();
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__CAMNebulaIrisBackendController__dispatchToQueue_afterDelay_withBlock___block_invoke;
  v13[3] = &unk_263FA0C08;
  id v14 = v9;
  id v15 = v7;
  id v11 = v9;
  id v12 = v7;
  dispatch_after(v10, v8, v13);
}

void __72__CAMNebulaIrisBackendController__dispatchToQueue_afterDelay_withBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21050BCA0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_dispatchToMainQueueWithBlock:(id)a3
{
}

- (void)_dispatchToCoordinationQueueWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  [(CAMNebulaIrisBackendController *)self _dispatchToQueue:v5 withBlock:v4];
}

- (void)_dispatchToCoordinationQueueAfterDelay:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  [(CAMNebulaIrisBackendController *)self _dispatchToQueue:v7 afterDelay:v6 withBlock:a3];
}

- (void)_dispatchToLinkWorkQueueWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _linkWorkQueue];
  [(CAMNebulaIrisBackendController *)self _dispatchToQueue:v5 withBlock:v4];
}

- (void)_dispatchToLinkWorkQueueAfterDelay:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CAMNebulaIrisBackendController *)self _linkWorkQueue];
  [(CAMNebulaIrisBackendController *)self _dispatchToQueue:v7 afterDelay:v6 withBlock:a3];
}

- (void)handleClientConnection:(id)a3
{
  objc_initWeak(&location, a3);
  id v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_V2(v4);

  id v6 = [(CAMNebulaIrisBackendController *)self _clientConnections];
  id v7 = objc_loadWeakRetained(&location);
  [v6 addObject:v7];

  objc_destroyWeak(&location);
}

- (void)handleClientDisconnection:(id)a3
{
  objc_initWeak(&location, a3);
  id v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_V2(v4);

  id v6 = [(CAMNebulaIrisBackendController *)self _clientConnections];
  id v7 = objc_loadWeakRetained(&location);
  [v6 removeObject:v7];

  objc_destroyWeak(&location);
}

- (void)performIrisCrashRecoveryForceFileSystemCheck:(BOOL)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__CAMNebulaIrisBackendController_performIrisCrashRecoveryForceFileSystemCheck___block_invoke;
  v5[3] = &unk_263FA02A8;
  BOOL v6 = a3;
  v5[4] = self;
  [(CAMNebulaIrisBackendController *)self _dispatchToCoordinationQueueWithBlock:v5];
}

uint64_t __79__CAMNebulaIrisBackendController_performIrisCrashRecoveryForceFileSystemCheck___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setCrashRecoveryNeeded:", 1);
  }
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_coordinationQueue_createJobsForCrashRecoveryIfNeeded");
}

- (void)performIrisCrashRecovery
{
}

- (BOOL)_coordinationQueue_isIOWorkSuspended
{
  if ([(CAMNebulaIrisBackendController *)self _coordinationQueue_shouldCheckMarkerFileForIOWorkSuspension])
  {
    if (+[CAMProtectionController isCameraPerformingHighPriorityDiskActivity])
    {
      [(CAMNebulaIrisBackendController *)self _coordinationQueue_setIOWorkSuspended:1];
    }
    [(CAMNebulaIrisBackendController *)self _coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:0];
  }
  return self->__IOWorkSuspended;
}

- (void)_coordinationQueue_setIOWorkSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v5);

  if (self->__IOWorkSuspended != v3)
  {
    self->__IOWorkSuspended = v3;
    BOOL v6 = [(CAMNebulaIrisBackendController *)self _linkWorkQueue];
    id v7 = v6;
    if (v3)
    {
      dispatch_suspend(v6);

      id v8 = [(CAMNebulaIrisBackendController *)self _activeExportSession];
      if (v8) {
        [v8 cancelExport];
      }
      [(CAMNebulaIrisBackendController *)self _coordinationQueue_setupCameraProcessingMonitoringIfNecessary];
    }
    else
    {
      dispatch_resume(v6);

      [(CAMNebulaIrisBackendController *)self _coordinationQueue_enqueuePendingExportJobIfPossible];
      [(CAMNebulaIrisBackendController *)self _coordinationQueue_createJobsForCrashRecoveryIfNeeded];
    }
  }
}

- (void)_coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v5);

  if (self->__shouldCheckMarkerFileForIOWorkSuspension != v3) {
    self->__shouldCheckMarkerFileForIOWorkSuspension = v3;
  }
}

- (void)enqueueIrisVideoJobs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CAMNebulaIrisBackendController_enqueueIrisVideoJobs___block_invoke;
  v6[3] = &unk_263FA0408;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CAMNebulaIrisBackendController *)self _dispatchToCoordinationQueueWithBlock:v6];
}

uint64_t __55__CAMNebulaIrisBackendController_enqueueIrisVideoJobs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_enqueueJobs:", *(void *)(a1 + 40));
}

- (void)_coordinationQueue_enqueueJobs:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CAMNebulaIrisBackendController _coordinationQueue_enqueueAndTrackNewJob:](self, "_coordinationQueue_enqueueAndTrackNewJob:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(CAMNebulaIrisBackendController *)self _coordinationQueue_enqueuePendingExportJobIfPossible];
}

- (void)_coordinationQueue_enqueueAndTrackNewJob:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 filteredVideoURL];
  uint64_t v7 = [v4 filterName];
  uint64_t v8 = [(CAMNebulaIrisBackendController *)self _uniqueIdentifierForJob:v4];
  uint64_t v9 = [(CAMNebulaIrisBackendController *)self _pendingOrInFlightJobsByUniqueIdentifier];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];
  if (v10)
  {
    long long v11 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      id v15 = v8;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring incoming job because we already have one in-flight for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    [v9 setObject:v4 forKeyedSubscript:v8];
    [(CAMNebulaKeepAliveController *)self->__keepAliveController startKeepAliveForIdentifier:v8];
    if (!v7 || v6)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __75__CAMNebulaIrisBackendController__coordinationQueue_enqueueAndTrackNewJob___block_invoke;
      v12[3] = &unk_263FA0408;
      v12[4] = self;
      id v13 = v4;
      [(CAMNebulaIrisBackendController *)self _dispatchToLinkWorkQueueWithBlock:v12];

      goto LABEL_8;
    }
    long long v11 = [(CAMNebulaIrisBackendController *)self _pendingExportVideoJobs];
    [v11 addObject:v4];
  }

LABEL_8:
}

uint64_t __75__CAMNebulaIrisBackendController__coordinationQueue_enqueueAndTrackNewJob___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_linkWorkQueue_linkAndPersistSelfContainedVideo:", *(void *)(a1 + 40));
}

- (void)_coordinationQueue_didPermanentlyFinishJob:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(CAMNebulaIrisBackendController *)self _uniqueIdentifierForJob:v4];

  id v6 = [(CAMNebulaIrisBackendController *)self _pendingOrInFlightJobsByUniqueIdentifier];
  [v6 removeObjectForKey:v7];
  [(CAMNebulaKeepAliveController *)self->__keepAliveController stopKeepAliveForIdentifier:v7];
  [(CAMNebulaIrisBackendController *)self _coordinationQueue_createJobsForCrashRecoveryIfNeeded];
}

- (id)_uniqueIdentifierForJob:(id)a3
{
  id v3 = a3;
  id v4 = [v3 videoURL];
  id v5 = [v3 filteredVideoURL];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v4;
  }
  id v7 = [v6 path];

  return v7;
}

- (void)_linkWorkQueue_linkAndPersistSelfContainedVideo:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _linkWorkQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 videoURL];
  v46 = [v4 filteredVideoURL];
  v45 = [v4 stillImagePersistenceUUID];
  uint64_t v7 = [v4 videoPersistenceUUID];
  uint64_t v8 = [v4 irisIdentifier];
  uint64_t v9 = [v4 captureDevice];
  long long v71 = 0uLL;
  uint64_t v72 = 0;
  v44 = (void *)v8;
  uint64_t v39 = [v4 captureOrientation];
  if (v4)
  {
    [v4 duration];
    long long v69 = 0uLL;
    uint64_t v70 = 0;
    [v4 stillImageDisplayTime];
  }
  else
  {
    long long v69 = 0uLL;
    uint64_t v70 = 0;
  }
  [v4 captureTime];
  double v11 = v10;
  long long v12 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v13 = +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v7, @"MOV", +[CAMCaptureRequest shouldPersistToIncomingDirectoryWithPersistenceOptions:temporaryPersistenceOptions:](CAMCaptureRequest, "shouldPersistToIncomingDirectoryWithPersistenceOptions:temporaryPersistenceOptions:", [v4 persistenceOptions], objc_msgSend(v4, "temporaryPersistenceOptions")), v11);
  uint64_t v14 = [NSURL fileURLWithPath:v13 isDirectory:0];
  v42 = (void *)v7;
  v43 = (void *)v13;
  if (v46)
  {
    id v15 = [MEMORY[0x263F5DB30] filteredVideoPathForRecordedLivePhotoVideoPath:v13];
    id v16 = [NSURL fileURLWithPath:v15 isDirectory:0];
    id v68 = 0;
    int v17 = [v12 linkItemAtURL:v46 toURL:v16 error:&v68];
    id v41 = v68;

    if (!v17)
    {
      char v18 = 1;
      v19 = (void *)v14;
      v20 = 0;
LABEL_16:
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_3;
      v47[3] = &unk_263FA4490;
      v47[4] = self;
      id v48 = v19;
      id v16 = v16;
      id v49 = v16;
      id v50 = v6;
      id v51 = v12;
      char v56 = v17;
      id v34 = v20;
      id v52 = v34;
      char v57 = v18;
      id v53 = v46;
      id v33 = v41;
      id v54 = v33;
      id v55 = v4;
      [(CAMNebulaIrisBackendController *)self _dispatchToCoordinationQueueWithBlock:v47];

      v25 = v42;
      v32 = v44;
      goto LABEL_17;
    }
  }
  else
  {
    id v41 = 0;
    id v16 = 0;
  }
  id v67 = 0;
  v19 = (void *)v14;
  int v21 = [v12 linkItemAtURL:v6 toURL:v14 error:&v67];
  id v22 = v67;
  v20 = v22;
  if (!v21)
  {
    char v18 = 0;
    LOBYTE(v17) = 1;
    goto LABEL_16;
  }
  id v36 = v22;
  v37 = v12;
  objc_super v38 = v6;
  [(CAMNebulaIrisBackendController *)self _removeItemAtURL:v6 maxAttempts:3];
  if (v46) {
    [(CAMNebulaIrisBackendController *)self _removeItemAtURL:v46 maxAttempts:3];
  }
  if ([v4 isCTMVideo]) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 0;
  }
  v24 = objc_alloc_init(CAMMutableStillImageCaptureRequest);
  [(CAMMutableStillImageCaptureRequest *)v24 setCaptureOrientation:v39];
  [(CAMMutableStillImageCaptureRequest *)v24 setCaptureDevice:v9];
  [(CAMMutableStillImageCaptureRequest *)v24 setPersistenceUUID:v45];
  v25 = v42;
  [(CAMMutableStillImageCaptureRequest *)v24 setVideoPersistenceUUID:v42];
  [(CAMMutableStillImageCaptureRequest *)v24 setIrisIdentifier:v44];
  -[CAMMutableStillImageCaptureRequest setPersistenceOptions:](v24, "setPersistenceOptions:", [v4 persistenceOptions]);
  -[CAMMutableStillImageCaptureRequest setTemporaryPersistenceOptions:](v24, "setTemporaryPersistenceOptions:", [v4 temporaryPersistenceOptions]);
  [(CAMMutableStillImageCaptureRequest *)v24 setCtmCaptureType:v23];
  v40 = (void *)os_transaction_create();
  v26 = [(CAMNebulaIrisBackendController *)self _transactionForPersistenceUUID];
  [v26 setObject:v40 forKeyedSubscript:v42];

  [(CAMMutableStillImageCaptureRequest *)v24 setDelegate:self];
  v27 = [CAMVideoCaptureResult alloc];
  long long v65 = v71;
  uint64_t v66 = v72;
  long long v63 = v69;
  uint64_t v64 = v70;
  LOBYTE(v35) = 0;
  v28 = [(CAMVideoCaptureResult *)v27 initWithURL:v19 filteredLocalDestinationURL:v16 duration:&v65 stillDisplayTime:&v63 dimensions:0 metadata:0 videoZoomFactor:1.0 reason:0 videoPreviewPixelBuffer:0 coordinationInfo:0 error:0 slowWriterFrameDrops:v35];
  v29 = [(CAMNebulaIrisBackendController *)self _keepAliveController];
  [v29 startKeepAliveForIdentifier:v42];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke;
  v60[3] = &unk_263FA0CD0;
  v60[4] = self;
  id v61 = v42;
  id v30 = v4;
  id v62 = v30;
  [(CAMNebulaIrisBackendController *)self _dispatchToMainQueueWithBlock:v60];
  v31 = [(CAMNebulaIrisBackendController *)self _persistenceController];
  [v31 stillImageRequest:v24 didCompleteVideoCaptureWithResult:v28];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_2;
  v58[3] = &unk_263FA0408;
  v58[4] = self;
  id v59 = v30;
  [(CAMNebulaIrisBackendController *)self _dispatchToCoordinationQueueWithBlock:v58];

  v32 = v44;
  long long v12 = v37;
  id v6 = v38;
  id v33 = v41;
  id v34 = v36;
LABEL_17:
}

void __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 48) bundleIdentifier];
  v2 = [*(id *)(a1 + 32) _bundleIdentifiersByVideoPersistenceUUID];
  [v2 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
}

uint64_t __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_didPermanentlyFinishJob:", *(void *)(a1 + 40));
}

void __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_3(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _removeItemAtURL:*(void *)(a1 + 40) maxAttempts:3];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    [*(id *)(a1 + 32) _removeItemAtURL:v2 maxAttempts:3];
  }
  unint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_failureCountForVideoURL:", *(void *)(a1 + 56)) + 1;
  if (v3 <= 3
    && (id v4 = *(void **)(a1 + 64),
        [*(id *)(a1 + 56) path],
        id v5 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = [v4 fileExistsAtPath:v5],
        v5,
        v4))
  {
    if (*(unsigned char *)(a1 + 104))
    {
      id v6 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unint64_t v18 = *(void *)(a1 + 56);
        uint64_t v19 = *(void *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 72);
        *(_DWORD *)id buf = 138544130;
        unint64_t v27 = v18;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        __int16 v30 = 2048;
        unint64_t v31 = v3;
        __int16 v32 = 2114;
        uint64_t v33 = v20;
        _os_log_error_impl(&dword_2099F8000, v6, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@ (%lu attempts): %{public}@ (rescheduling)", buf, 0x2Au);
      }
    }
    if (*(unsigned char *)(a1 + 105))
    {
      uint64_t v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 48);
        unint64_t v22 = *(void *)(a1 + 80);
        uint64_t v23 = *(void *)(a1 + 88);
        *(_DWORD *)id buf = 138544130;
        unint64_t v27 = v22;
        __int16 v28 = 2114;
        uint64_t v29 = v21;
        __int16 v30 = 2048;
        unint64_t v31 = v3;
        __int16 v32 = 2114;
        uint64_t v33 = v23;
        _os_log_error_impl(&dword_2099F8000, v7, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@ (%lu attempts): %{public}@ (rescheduling)", buf, 0x2Au);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setFailureCount:forVideoURL:", v3, *(void *)(a1 + 56));
    uint64_t v8 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_23;
    v24[3] = &unk_263FA0408;
    v24[4] = v8;
    id v25 = *(id *)(a1 + 96);
    [v8 _dispatchToLinkWorkQueueAfterDelay:v24 withBlock:0.1];
  }
  else
  {
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 56);
        unint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 72);
        *(_DWORD *)id buf = 134218754;
        unint64_t v27 = v3;
        __int16 v28 = 2114;
        uint64_t v29 = v10;
        __int16 v30 = 2114;
        unint64_t v31 = v11;
        __int16 v32 = 2114;
        uint64_t v33 = v12;
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Deleting video after %lu attempts to link %{public}@ to %{public}@: %{public}@", buf, 0x2Au);
      }
    }
    if (*(unsigned char *)(a1 + 105))
    {
      uint64_t v13 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = *(void *)(a1 + 48);
        uint64_t v15 = *(void *)(a1 + 80);
        uint64_t v16 = *(void *)(a1 + 88);
        *(_DWORD *)id buf = 134218754;
        unint64_t v27 = v3;
        __int16 v28 = 2114;
        uint64_t v29 = v15;
        __int16 v30 = 2114;
        unint64_t v31 = v14;
        __int16 v32 = 2114;
        uint64_t v33 = v16;
        _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Deleting video after %lu attempts to link %{public}@ to %{public}@: %{public}@", buf, 0x2Au);
      }
    }
    [*(id *)(a1 + 32) _removeItemAtURL:*(void *)(a1 + 56) maxAttempts:3];
    uint64_t v17 = *(void *)(a1 + 80);
    if (v17) {
      [*(id *)(a1 + 32) _removeItemAtURL:v17 maxAttempts:3];
    }
    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_didPermanentlyFinishJob:", *(void *)(a1 + 96));
  }
}

uint64_t __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_linkWorkQueue_linkAndPersistSelfContainedVideo:", *(void *)(a1 + 40));
}

- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __124__CAMNebulaIrisBackendController_persistenceController_didGenerateVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
  v12[3] = &unk_263FA0CD0;
  id v13 = v9;
  unint64_t v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  [(CAMNebulaIrisBackendController *)self _dispatchToMainQueueWithBlock:v12];
}

void __124__CAMNebulaIrisBackendController_persistenceController_didGenerateVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  unint64_t v3 = [v2 videoPersistenceUUID];
  id v4 = [*(id *)(a1 + 40) _bundleIdentifiersByVideoPersistenceUUID];
  id v5 = [v4 objectForKeyedSubscript:v3];

  id v6 = [*(id *)(a1 + 40) _bundleIdentifiersByVideoPersistenceUUID];
  [v6 setObject:0 forKeyedSubscript:v3];

  uint64_t v7 = [*(id *)(a1 + 40) _clientConnections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v13 = [v12 bundleIdentifier];
        if ([v13 isEqualToString:v5]) {
          [v12 nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:*(void *)(a1 + 48)];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)stillImageRequestDidCompleteVideoRemotePersistence:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v8 = [a3 videoPersistenceUUID];
  id v6 = [(CAMNebulaIrisBackendController *)self _keepAliveController];
  [v6 stopKeepAliveForIdentifier:v8];
  uint64_t v7 = [(CAMNebulaIrisBackendController *)self _transactionForPersistenceUUID];
  [v7 removeObjectForKey:v8];
}

- (void)_coordinationQueue_enqueuePendingExportJobIfPossible
{
}

uint64_t __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_didPermanentlyFinishJob:", *(void *)(a1 + 40));
}

void __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 sourceImage];
  [*(id *)(a1 + 32) setValue:v5 forKey:*MEMORY[0x263F00968]];
  id v4 = [*(id *)(a1 + 32) outputImage];
  [v3 finishWithImage:v4 context:0];
}

void __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke_34(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke_2;
  v2[3] = &unk_263FA0408;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 48);
  [v1 _dispatchToCoordinationQueueWithBlock:v2];
}

uint64_t __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_didCompleteExportJob:", *(void *)(a1 + 40));
}

- (void)_coordinationQueue_didCompleteExportJob:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CAMNebulaIrisBackendController *)self _activeExportSession];
  [(CAMNebulaIrisBackendController *)self _setActiveExportSession:0];
  uint64_t v7 = [v6 status];
  id v8 = [v6 error];
  uint64_t v9 = [v4 videoURL];
  uint64_t v10 = [v6 outputURL];
  id v11 = (void *)v10;
  switch(v7)
  {
    case 0:
    case 1:
    case 2:
      uint64_t v12 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 134218498;
        unint64_t v46 = v7;
        __int16 v47 = 2114;
        id v48 = v6;
        __int16 v49 = 2114;
        id v50 = v9;
        _os_log_error_impl(&dword_2099F8000, v12, OS_LOG_TYPE_ERROR, "Unhandled status case %ld for completed exportSession %{public}@ (%{public}@)", buf, 0x20u);
      }
      goto LABEL_4;
    case 3:
      v37 = (void *)v10;
      uint64_t v39 = v8;
      [(CAMNebulaIrisBackendController *)self _coordinationQueue_setFailureCount:0 forVideoURL:v9];
      unint64_t v18 = [CAMIrisVideoJob alloc];
      uint64_t v19 = [v4 stillImagePersistenceUUID];
      uint64_t v20 = [v4 videoPersistenceUUID];
      uint64_t v21 = [v4 irisIdentifier];
      uint64_t v22 = [v4 captureDevice];
      v40 = (void *)v19;
      objc_super v38 = (void *)v20;
      uint64_t v36 = [v4 captureOrientation];
      if (v4)
      {
        [v4 duration];
        [v4 stillImageDisplayTime];
      }
      else
      {
        memset(v44, 0, sizeof(v44));
        memset(v43, 0, sizeof(v43));
      }
      [v4 captureTime];
      double v30 = v29;
      uint64_t v35 = [v4 filterName];
      uint64_t v31 = [v4 persistenceOptions];
      uint64_t v32 = [v4 temporaryPersistenceOptions];
      uint64_t v33 = [v4 bundleIdentifier];
      uint64_t v34 = [(CAMIrisVideoJob *)v18 initWithVideoURL:v9 stillImagePersistenceUUID:v40 videoPersistenceUUID:v38 irisIdentifier:v21 captureDevice:v22 captureOrientation:v36 duration:v30 stillImageDisplayTime:v44 captureTime:v43 captureError:0 filterName:v35 filteredVideoURL:v37 persistenceOptions:v31 temporaryPersistenceOptions:v32 bundleIdentifier:v33];

      id v11 = v37;
      [(CAMNebulaIrisBackendController *)self _coordinationQueue_enqueueAndTrackNewJob:v34];
      [(CAMNebulaIrisBackendController *)self _coordinationQueue_didPermanentlyFinishJob:v4];

      id v8 = v39;
      goto LABEL_23;
    case 4:
      uint64_t v23 = [v8 code];
      uint64_t v12 = os_log_create("com.apple.camera", "Nebula");
      BOOL v24 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v23 == -11847)
      {
        if (v24)
        {
          *(_DWORD *)id buf = 138543618;
          unint64_t v46 = (unint64_t)v9;
          __int16 v47 = 2114;
          id v48 = v8;
          id v25 = "Export of %{public}@ was interrupted (%{public}@).";
          v26 = v12;
          uint32_t v27 = 22;
LABEL_17:
          _os_log_impl(&dword_2099F8000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
LABEL_18:

        [(CAMNebulaIrisBackendController *)self _removeItemAtURL:v11 maxAttempts:3];
        __int16 v28 = [(CAMNebulaIrisBackendController *)self _pendingExportVideoJobs];
        [v28 addObject:v4];
      }
      else
      {
        if (v24)
        {
          *(_DWORD *)id buf = 138543874;
          unint64_t v46 = (unint64_t)v9;
          __int16 v47 = 2114;
          id v48 = v11;
          __int16 v49 = 2114;
          id v50 = v8;
          _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Export of %{public}@ to %{public}@ failed (%{public}@).", buf, 0x20u);
        }
LABEL_4:

        [(CAMNebulaIrisBackendController *)self _removeItemAtURL:v11 maxAttempts:3];
        unint64_t v13 = [(CAMNebulaIrisBackendController *)self _coordinationQueue_failureCountForVideoURL:v9]+ 1;
        if (v13 <= 3
          && ([MEMORY[0x263F08850] defaultManager],
              long long v14 = objc_claimAutoreleasedReturnValue(),
              [v9 path],
              long long v15 = objc_claimAutoreleasedReturnValue(),
              int v16 = [v14 fileExistsAtPath:v15],
              v15,
              v14,
              v16))
        {
          [(CAMNebulaIrisBackendController *)self _coordinationQueue_setFailureCount:v13 forVideoURL:v9];
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __74__CAMNebulaIrisBackendController__coordinationQueue_didCompleteExportJob___block_invoke;
          v41[3] = &unk_263FA0408;
          v41[4] = self;
          id v42 = v4;
          [(CAMNebulaIrisBackendController *)self _dispatchToCoordinationQueueAfterDelay:v41 withBlock:0.1];
        }
        else
        {
          long long v17 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id buf = 134218498;
            unint64_t v46 = v13;
            __int16 v47 = 2114;
            id v48 = v9;
            __int16 v49 = 2114;
            id v50 = v11;
            _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Deleting video after %lu attempts to export %{public}@ to %{public}@", buf, 0x20u);
          }

          [(CAMNebulaIrisBackendController *)self _removeItemAtURL:v9 maxAttempts:3];
          [(CAMNebulaIrisBackendController *)self _coordinationQueue_didPermanentlyFinishJob:v4];
        }
      }
LABEL_23:
      [(CAMNebulaIrisBackendController *)self _coordinationQueue_enqueuePendingExportJobIfPossible];

      return;
    case 5:
      uint64_t v12 = os_log_create("com.apple.camera", "Nebula");
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)id buf = 138543362;
      unint64_t v46 = (unint64_t)v9;
      id v25 = "Cancelled export session for %{public}@";
      v26 = v12;
      uint32_t v27 = 12;
      goto LABEL_17;
    default:
      goto LABEL_23;
  }
}

void __74__CAMNebulaIrisBackendController__coordinationQueue_didCompleteExportJob___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _pendingExportVideoJobs];
  [v2 addObject:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_enqueuePendingExportJobIfPossible");
}

- (void)_coordinationQueue_setCrashRecoveryNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v5);

  if (self->__crashRecoveryNeeded != v3)
  {
    self->__crashRecoveryNeeded = v3;
    keepAliveController = self->__keepAliveController;
    if (v3)
    {
      [(CAMNebulaKeepAliveController *)keepAliveController startKeepAliveForIdentifier:@"CAMNebulaIrisBackendControllerPendingCrashRecovery"];
    }
    else
    {
      [(CAMNebulaKeepAliveController *)keepAliveController stopKeepAliveForIdentifier:@"CAMNebulaIrisBackendControllerPendingCrashRecovery"];
    }
  }
}

- (void)_coordinationQueue_createJobsForCrashRecoveryIfNeeded
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v3);

  if ([(CAMNebulaIrisBackendController *)self _coordinationQueue_isCrashRecoveryNeeded])
  {
    id v4 = [(CAMNebulaIrisBackendController *)self _pendingOrInFlightJobsByUniqueIdentifier];
    if (![v4 count]
      && ![(CAMNebulaIrisBackendController *)self _coordinationQueue_isIOWorkSuspended]&& !+[CAMProtectionController isCameraPerformingHighPriorityDiskActivity])
    {
      uint64_t v5 = +[CAMIrisDiskUtilities irisVideoDirectoryPathCreateIfNeeded:0];
      id v6 = [MEMORY[0x263F08850] defaultManager];
      id v93 = 0;
      long long v69 = (void *)v5;
      uint64_t v7 = [v6 contentsOfDirectoryAtPath:v5 error:&v93];
      id v8 = v93;

      if (v8)
      {
        uint64_t v9 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 138543618;
          v100 = v69;
          __int16 v101 = 2114;
          id v102 = v8;
          _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get contents of %{public}@: %{public}@", buf, 0x16u);
        }

        uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
        id v92 = 0;
        id v11 = [v10 contentsOfDirectoryAtPath:v69 error:&v92];
        id v12 = v92;

        if (v12)
        {
          unint64_t v13 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id buf = 138543618;
            v100 = v69;
            __int16 v101 = 2114;
            id v102 = v12;
            _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Failed second attempt to get contents of %{public}@: %{public}@", buf, 0x16u);
          }
        }
      }
      else
      {
        id v12 = 0;
        id v11 = v7;
      }
      if ([v11 count])
      {
        id v60 = v12;
        id v62 = v4;
        id v65 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v70 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v71 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        uint64_t v64 = +[CAMIrisDiskUtilities videoPathExtension];
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v61 = v11;
        obuint64_t j = v11;
        uint64_t v14 = [obj countByEnumeratingWithState:&v88 objects:v98 count:16];
        if (!v14) {
          goto LABEL_28;
        }
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v89;
        while (1)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v89 != v16) {
              objc_enumerationMutation(obj);
            }
            unint64_t v18 = [v69 stringByAppendingPathComponent:*(void *)(*((void *)&v88 + 1) + 8 * i)];
            uint64_t v19 = [NSURL fileURLWithPath:v18];
            uint64_t v20 = [v19 pathExtension];
            uint64_t v21 = [v19 URLByDeletingPathExtension];
            uint64_t v22 = [v21 pathExtension];

            if ([v22 isEqualToString:@"FILTERED"])
            {
              uint64_t v23 = os_log_create("com.apple.camera", "Nebula");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)id buf = 138543362;
                v100 = v19;
                _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "Found a filtered video during crash recovery. Deleting and re-creating from the recorded %{public}@", buf, 0xCu);
              }

              BOOL v24 = v71;
LABEL_25:
              [v24 addObject:v19];
              goto LABEL_26;
            }
            if ([v20 isEqualToString:v64])
            {
              BOOL v25 = +[CAMIrisDiskUtilities isValidVideoDestinationPath:v18];
              BOOL v24 = v70;
              if (v25) {
                goto LABEL_25;
              }
            }
LABEL_26:
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v88 objects:v98 count:16];
          if (!v15)
          {
LABEL_28:

            long long v84 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            id obja = (id)[v65 copy];
            uint64_t v26 = [obja countByEnumeratingWithState:&v84 objects:v97 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v85;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v85 != v28) {
                    objc_enumerationMutation(obja);
                  }
                  double v30 = *(void **)(*((void *)&v84 + 1) + 8 * j);
                  uint64_t v31 = [v30 URLByDeletingPathExtension];
                  if ([v70 containsObject:v31])
                  {
                    uint64_t v32 = os_log_create("com.apple.camera", "Nebula");
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)id buf = 138543362;
                      v100 = v31;
                      _os_log_impl(&dword_2099F8000, v32, OS_LOG_TYPE_DEFAULT, "Found both an exported video and recorded video during crash recovery. Deleting the exported one and proceeding with the recorded video at %{public}@", buf, 0xCu);
                    }

                    [v71 addObject:v30];
                    [v65 removeObject:v30];
                  }
                }
                uint64_t v27 = [obja countByEnumeratingWithState:&v84 objects:v97 count:16];
              }
              while (v27);
            }

            id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v80 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            id v34 = v65;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v80 objects:v96 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v81;
              do
              {
                for (uint64_t k = 0; k != v36; ++k)
                {
                  if (*(void *)v81 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v39 = *(void **)(*((void *)&v80 + 1) + 8 * k);
                  v40 = [(CAMNebulaIrisBackendController *)self _videoJobFromURL:v39];
                  if (v40)
                  {
                    id v41 = v33;
                    id v42 = v40;
                  }
                  else
                  {
                    id v41 = v71;
                    id v42 = v39;
                  }
                  [v41 addObject:v42];
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v80 objects:v96 count:16];
              }
              while (v36);
            }

            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v43 = v70;
            uint64_t v44 = [v43 countByEnumeratingWithState:&v76 objects:v95 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              uint64_t v46 = *(void *)v77;
              do
              {
                for (uint64_t m = 0; m != v45; ++m)
                {
                  if (*(void *)v77 != v46) {
                    objc_enumerationMutation(v43);
                  }
                  id v48 = *(void **)(*((void *)&v76 + 1) + 8 * m);
                  __int16 v49 = [(CAMNebulaIrisBackendController *)self _videoJobFromURL:v48];
                  if (v49)
                  {
                    id v50 = v33;
                    uint64_t v51 = v49;
                  }
                  else
                  {
                    id v50 = v71;
                    uint64_t v51 = v48;
                  }
                  [v50 addObject:v51];
                }
                uint64_t v45 = [v43 countByEnumeratingWithState:&v76 objects:v95 count:16];
              }
              while (v45);
            }

            if (!+[CAMProtectionController isCameraPerformingHighPriorityDiskActivity])
            {
              id v63 = v43;
              id v66 = v34;
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v52 = v71;
              uint64_t v53 = [v52 countByEnumeratingWithState:&v72 objects:v94 count:16];
              if (v53)
              {
                uint64_t v54 = v53;
                uint64_t v55 = *(void *)v73;
                do
                {
                  for (uint64_t n = 0; n != v54; ++n)
                  {
                    if (*(void *)v73 != v55) {
                      objc_enumerationMutation(v52);
                    }
                    char v57 = *(void **)(*((void *)&v72 + 1) + 8 * n);
                    v58 = os_log_create("com.apple.camera", "Nebula");
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)id buf = 138543362;
                      v100 = v57;
                      _os_log_error_impl(&dword_2099F8000, v58, OS_LOG_TYPE_ERROR, "Crash recovery: deleting file that cannot be processed (invalid or no pending work) %{public}@", buf, 0xCu);
                    }

                    [(CAMNebulaIrisBackendController *)self _removeItemAtURL:v57 maxAttempts:3];
                  }
                  uint64_t v54 = [v52 countByEnumeratingWithState:&v72 objects:v94 count:16];
                }
                while (v54);
              }

              [(CAMNebulaIrisBackendController *)self _coordinationQueue_enqueueJobs:v33];
              [(CAMNebulaIrisBackendController *)self _coordinationQueue_setCrashRecoveryNeeded:0];
              id v34 = v66;
              id v43 = v63;
            }

            id v11 = v61;
            id v4 = v62;
            id v12 = v60;
            goto LABEL_74;
          }
        }
      }
      id v59 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_2099F8000, v59, OS_LOG_TYPE_DEFAULT, "Found no work to do in crash recovery pass", buf, 2u);
      }

      [(CAMNebulaIrisBackendController *)self _coordinationQueue_setCrashRecoveryNeeded:0];
LABEL_74:
    }
  }
}

- (id)_videoJobFromURL:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x21050BCA0]();
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  double v56 = 0.0;
  long long v54 = *MEMORY[0x263F01090];
  uint64_t v55 = *(void *)(MEMORY[0x263F01090] + 16);
  long long v52 = v54;
  uint64_t v53 = v55;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  id v6 = [v4 path];
  id v48 = 0;
  id v49 = 0;
  id v46 = 0;
  id v47 = 0;
  BOOL v7 = +[CAMIrisDiskUtilities parseVideoDestinationPath:v6 forStillImagePersistenceUUID:&v49 videoPersistenceUUID:&v48 captureDevice:&v58 captureOrientation:&v57 captureTime:&v56 persistenceOptions:&v51 temporaryPersistenceOptions:&v50 bundleIdentifier:&v47 filterName:&v46];
  id v8 = v49;
  id v9 = v48;
  id v10 = v47;
  uint64_t v39 = v9;
  id v40 = v46;
  if (v7)
  {
    objc_super v38 = v5;
    id v11 = [MEMORY[0x263EFA8D0] URLAssetWithURL:v4 options:0];
    id v12 = v11;
    if (v11)
    {
      [v11 duration];
      id v45 = 0;
      BOOL v13 = [(CAMNebulaIrisBackendController *)self _extractIrisPropertiesFromAVAsset:v12 stillImageDisplayTime:&v52 irisIdentifier:&v45];
      id v14 = v45;
      if (v13)
      {
LABEL_4:
        uint64_t v15 = [CAMIrisVideoJob alloc];
        *(_OWORD *)id buf = v54;
        uint64_t v60 = v55;
        long long v41 = v52;
        uint64_t v42 = v53;
        uint64_t v16 = v10;
        id v37 = v10;
        long long v17 = v8;
        unint64_t v18 = [(CAMIrisVideoJob *)v15 initWithVideoURL:v4 stillImagePersistenceUUID:v8 videoPersistenceUUID:v9 irisIdentifier:v14 captureDevice:v58 captureOrientation:v57 duration:v56 stillImageDisplayTime:buf captureTime:&v41 captureError:0 filterName:v40 filteredVideoURL:0 persistenceOptions:v51 temporaryPersistenceOptions:v50 bundleIdentifier:v37];
        uint64_t v19 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 138543362;
          *(void *)&uint8_t buf[4] = v18;
          _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "Crash recovery created job: %{public}@", buf, 0xCu);
        }
        int v20 = 0;
        goto LABEL_25;
      }
      uint64_t v31 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        *(void *)&uint8_t buf[4] = v4;
        _os_log_impl(&dword_2099F8000, v31, OS_LOG_TYPE_DEFAULT, "Attempting to consolidate video at %{public}@", buf, 0xCu);
      }

      id v44 = 0;
      char v32 = [MEMORY[0x263EFA5F8] consolidateMovieFragmentsInFile:v4 error:&v44];
      uint64_t v19 = v44;
      if (v32)
      {
        id v43 = v14;
        BOOL v33 = [(CAMNebulaIrisBackendController *)self _extractIrisPropertiesFromAVAsset:v12 stillImageDisplayTime:&v52 irisIdentifier:&v43];
        id v21 = v43;

        if (!v33)
        {
          uint64_t v16 = v10;
          long long v17 = v8;
          unint64_t v18 = 0;
          int v20 = 1;
          goto LABEL_26;
        }
        id v14 = v21;
        id v9 = v39;
        goto LABEL_4;
      }
      uint64_t v16 = v10;
      long long v17 = v8;
      id v34 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[CAMNebulaIrisBackendController _videoJobFromURL:]();
      }
    }
    else
    {
      uint64_t v16 = v10;
      uint64_t v19 = [MEMORY[0x263F08850] defaultManager];
      int v22 = [v19 fileExistsAtPath:v6];
      uint64_t v23 = os_log_create("com.apple.camera", "Nebula");
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      long long v17 = v8;
      if (v22)
      {
        if (v24) {
          -[CAMNebulaIrisBackendController _videoJobFromURL:]((uint64_t)v4, v23, v25, v26, v27, v28, v29, v30);
        }
      }
      else if (v24)
      {
        -[CAMNebulaIrisBackendController _videoJobFromURL:]((uint64_t)v4, v23, v25, v26, v27, v28, v29, v30);
      }

      id v14 = 0;
    }
    unint64_t v18 = 0;
    int v20 = 1;
LABEL_25:

    id v21 = v14;
LABEL_26:
    uint64_t v5 = v38;
    goto LABEL_27;
  }
  uint64_t v16 = v10;
  long long v17 = v8;
  id v12 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Could not extract the needed information from %{public}@", buf, 0xCu);
  }
  id v21 = 0;
  unint64_t v18 = 0;
  int v20 = 1;
LABEL_27:

  if (v20) {
    uint64_t v35 = 0;
  }
  else {
    uint64_t v35 = v18;
  }

  return v35;
}

- (BOOL)_extractIrisPropertiesFromAVAsset:(id)a3 stillImageDisplayTime:(id *)a4 irisIdentifier:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v13 = *MEMORY[0x263F01090];
  int64_t v14 = *(void *)(MEMORY[0x263F01090] + 16);
  BOOL v7 = [a3 URL];
  id v8 = [v7 path];
  PFReadImageDisplayTimeFromVideoFileAtPath();
  id v9 = PFReadPairingIdentifierFromVideoAtPath();
  id v10 = v9;
  if (v9)
  {
    if (a4)
    {
      *(_OWORD *)&a4->var0 = v13;
      a4->var3 = v14;
    }
    if (a5) {
      *a5 = v9;
    }
  }
  else
  {
    id v11 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      uint64_t v16 = v7;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Failed to retrieve irisIdentifier for %{public}@", buf, 0xCu);
    }
  }
  return v10 != 0;
}

- (void)_coordinationQueue_setFailureCount:(unint64_t)a3 forVideoURL:(id)a4
{
  unsigned __int16 v4 = a3;
  id v6 = a4;
  BOOL v7 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [MEMORY[0x263F5DB50] filesystemPersistenceBatchItemForFileAtURL:v6];

  [v8 setUInt16:v4 forKey:@"com.apple.assetsd.nebulad.failureCount"];
  [v8 persist];
}

- (unint64_t)_coordinationQueue_failureCountForVideoURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263F5DB50] persistedAttributesForFileAtURL:v4];

  unsigned __int16 v9 = 0;
  if ([v6 getUInt16:&v9 forKey:@"com.apple.assetsd.nebulad.failureCount"]) {
    unint64_t v7 = v9;
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)_coordinationQueue_setupCameraProcessingMonitoringIfNecessary
{
  BOOL v3 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v3);

  if (!self->__applicationStateMonitor)
  {
    objc_initWeak(&location, self);
    id v4 = (BKSApplicationStateMonitor *)[objc_alloc(MEMORY[0x263F28178]) initWithBundleIDs:&unk_26BDDFFC8 states:1];
    applicationStateMonitor = self->__applicationStateMonitor;
    self->__applicationStateMonitor = v4;

    id v6 = self->__applicationStateMonitor;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke;
    v7[3] = &unk_263FA44E0;
    objc_copyWeak(&v8, &location);
    [(BKSApplicationStateMonitor *)v6 setHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F28160]];
  id v4 = v3;
  if (v3 && [v3 integerValue] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke_2;
    v7[3] = &unk_263FA0208;
    id v8 = WeakRetained;
    id v6 = WeakRetained;
    [v6 _dispatchToCoordinationQueueWithBlock:v7];
  }
}

void __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke_2(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_isIOWorkSuspended"))
  {
    id v2 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Resuming IO work because Camera has died", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setIOWorkSuspended:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setCrashRecoveryNeeded:", 1);
    BOOL v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke_50;
    v4[3] = &unk_263FA0208;
    id v5 = v3;
    [v5 _dispatchToCoordinationQueueAfterDelay:v4 withBlock:1.0];
  }
}

uint64_t __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke_50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_createJobsForCrashRecoveryIfNeeded");
}

- (void)_coordinationQueue_destroyApplicationStateMonitor
{
  BOOL v3 = [(CAMNebulaIrisBackendController *)self _coordinationQueue];
  dispatch_assert_queue_V2(v3);

  [(BKSApplicationStateMonitor *)self->__applicationStateMonitor invalidate];
  applicationStateMonitor = self->__applicationStateMonitor;
  self->__applicationStateMonitor = 0;
}

- (BOOL)_removeItemAtURL:(id)a3 maxAttempts:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = 0;
  if (v6 && a4 >= 1)
  {
    int64_t v8 = 1;
    do
    {
      BOOL v9 = [(CAMNebulaIrisBackendController *)self _removeItemAtURL:v6];
      BOOL v7 = v9;
      if (v9) {
        break;
      }
    }
    while (v8++ < a4);
    char v11 = a4 < 2 || v9;
    if ((v11 & 1) == 0)
    {
      id v12 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CAMNebulaIrisBackendController _removeItemAtURL:maxAttempts:]((uint64_t)v6, a4, v12);
      }

      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_removeItemAtURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    id v12 = 0;
    char v5 = [v4 removeItemAtURL:v3 error:&v12];
    id v6 = v12;
    if ((v5 & 1) != 0
      || ([v3 path],
          BOOL v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v4 fileExistsAtPath:v7],
          v7,
          !v8))
    {
      BOOL v10 = 1;
    }
    else
    {
      BOOL v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CAMNebulaIrisBackendController _removeItemAtURL:]();
      }

      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (OS_dispatch_queue)_coordinationQueue
{
  return self->__coordinationQueue;
}

- (OS_dispatch_queue)_linkWorkQueue
{
  return self->__linkWorkQueue;
}

- (CAMPersistenceController)_persistenceController
{
  return self->__persistenceController;
}

- (CAMNebulaKeepAliveController)_keepAliveController
{
  return self->__keepAliveController;
}

- (int)_notifyRegisterTokenSuspendIO
{
  return self->__notifyRegisterTokenSuspendIO;
}

- (int)_notifyRegisterTokenResumeIO
{
  return self->__notifyRegisterTokenResumeIO;
}

- (BOOL)_coordinationQueue_shouldCheckMarkerFileForIOWorkSuspension
{
  return self->__shouldCheckMarkerFileForIOWorkSuspension;
}

- (NSMutableDictionary)_transactionForPersistenceUUID
{
  return self->__transactionForPersistenceUUID;
}

- (NSMutableDictionary)_pendingOrInFlightJobsByUniqueIdentifier
{
  return self->__pendingOrInFlightJobsByUniqueIdentifier;
}

- (NSMutableArray)_pendingExportVideoJobs
{
  return self->__pendingExportVideoJobs;
}

- (AVAssetExportSession)_activeExportSession
{
  return self->__activeExportSession;
}

- (void)_setActiveExportSession:(id)a3
{
}

- (NSMutableDictionary)_bundleIdentifiersByVideoPersistenceUUID
{
  return self->__bundleIdentifiersByVideoPersistenceUUID;
}

- (BOOL)_coordinationQueue_isCrashRecoveryNeeded
{
  return self->__crashRecoveryNeeded;
}

- (BKSApplicationStateMonitor)_applicationStateMonitor
{
  return self->__applicationStateMonitor;
}

- (NSHashTable)_clientConnections
{
  return self->__clientConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientConnections, 0);
  objc_storeStrong((id *)&self->__applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->__bundleIdentifiersByVideoPersistenceUUID, 0);
  objc_storeStrong((id *)&self->__activeExportSession, 0);
  objc_storeStrong((id *)&self->__pendingExportVideoJobs, 0);
  objc_storeStrong((id *)&self->__pendingOrInFlightJobsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->__transactionForPersistenceUUID, 0);
  objc_storeStrong((id *)&self->__keepAliveController, 0);
  objc_storeStrong((id *)&self->__persistenceController, 0);
  objc_storeStrong((id *)&self->__linkWorkQueue, 0);
  objc_storeStrong((id *)&self->__coordinationQueue, 0);
}

- (void)_videoJobFromURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_videoJobFromURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_videoJobFromURL:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to consolidate video at %{public}@: %{public}@.");
}

- (void)_removeItemAtURL:(NSObject *)a3 maxAttempts:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_5(&dword_2099F8000, a2, a3, "Giving up after %ld attempts to delete %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_removeItemAtURL:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to remove %{public}@: %{public}@");
}

@end
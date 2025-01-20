@interface CAMBurstController
- (CAMBurstController)init;
- (CAMBurstController)initWithProtectionController:(id)a3 powerController:(id)a4 remoteShutterController:(id)a5;
- (CAMBurstSession)_activeSession;
- (CAMPersistenceController)_persistenceController;
- (CAMPowerController)_powerController;
- (CAMProtectionController)_protectionController;
- (CAMRemoteShutterController)_remoteShutterController;
- (NSCountedSet)_inflightRequestsByIdentifier;
- (NSCountedSet)_requestsPendingPersistenceByIdentifier;
- (NSMutableDictionary)_analyticsEventsByIdentifier;
- (NSMutableDictionary)_faceResultsByIdentifier;
- (NSMutableDictionary)_sessionsByIdentifier;
- (NSString)currentBurstIdentifier;
- (OS_dispatch_queue)_analysisQueue;
- (OS_dispatch_queue)_mutexQueue;
- (id)startBurstCaptureWithAnalyticsEvent:(id)a3;
- (unint64_t)currentBurstCount;
- (unint64_t)estimatedCountForIdentifier:(id)a3;
- (unint64_t)inflightCountForIdentifier:(id)a3;
- (void)_mutexQueueProcessCompleteBurstSessionWithIdentifier:(id)a3 device:(int64_t)a4;
- (void)_setActiveSession:(id)a3;
- (void)cancelBurstCapture;
- (void)finishBurstCaptureForDevice:(int64_t)a3;
- (void)processCapturedRequest:(id)a3 withResult:(id)a4;
- (void)processEnqueuedRequest:(id)a3;
- (void)processFaceResults:(id)a3;
- (void)processPersistedRequest:(id)a3 withResult:(id)a4;
- (void)setPersistenceController:(id)a3;
@end

@implementation CAMBurstController

- (CAMBurstController)initWithProtectionController:(id)a3 powerController:(id)a4 remoteShutterController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CAMBurstController;
  v12 = [(CAMBurstController *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->__protectionController, a3);
    objc_storeStrong((id *)&v13->__powerController, a4);
    objc_storeStrong((id *)&v13->__remoteShutterController, a5);
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.camera.burst-controller.analysis-queue", v14);
    analysisQueue = v13->__analysisQueue;
    v13->__analysisQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.camera.burst-controller.mutex-queue", v17);
    mutexQueue = v13->__mutexQueue;
    v13->__mutexQueue = (OS_dispatch_queue *)v18;

    v20 = v13->__mutexQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__CAMBurstController_initWithProtectionController_powerController_remoteShutterController___block_invoke;
    block[3] = &unk_263FA0208;
    v21 = v13;
    v25 = v21;
    dispatch_sync(v20, block);
    v22 = v21;
  }
  return v13;
}

void __91__CAMBurstController_initWithProtectionController_powerController_remoteShutterController___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  id v8 = objc_alloc_init(MEMORY[0x263F08760]);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v8;

  id v11 = objc_alloc_init(MEMORY[0x263F08760]);
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 48);
  *(void *)(v15 + 48) = v14;

  uint64_t v17 = *(void *)(a1 + 32);
  dispatch_queue_t v18 = *(void **)(v17 + 56);
  *(void *)(v17 + 56) = 0;
}

- (void)setPersistenceController:(id)a3
{
  objc_initWeak(&location, a3);
  v4 = [(CAMBurstController *)self _mutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CAMBurstController_setPersistenceController___block_invoke;
  block[3] = &unk_263FA4E50;
  void block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_sync(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)_mutexQueue
{
  return self->__mutexQueue;
}

void __47__CAMBurstController_setPersistenceController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 72), WeakRetained);
}

- (unint64_t)estimatedCountForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(CAMBurstController *)self _mutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CAMBurstController_estimatedCountForIdentifier___block_invoke;
  block[3] = &unk_263FA4F18;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__CAMBurstController_estimatedCountForIdentifier___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _sessionsByIdentifier];
  id v2 = [v3 objectForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 estimatedCount];
}

- (NSMutableDictionary)_sessionsByIdentifier
{
  return self->__sessionsByIdentifier;
}

- (CAMBurstController)init
{
  [(CAMBurstController *)self doesNotRecognizeSelector:a2];
  return [(CAMBurstController *)self initWithProtectionController:0 powerController:0 remoteShutterController:0];
}

- (NSString)currentBurstIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17;
  id v11 = __Block_byref_object_dispose__17;
  id v12 = 0;
  id v3 = [(CAMBurstController *)self _mutexQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__CAMBurstController_currentBurstIdentifier__block_invoke;
  v6[3] = &unk_263FA35E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] identifier];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __44__CAMBurstController_currentBurstIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _activeSession];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (unint64_t)currentBurstCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17;
  id v11 = __Block_byref_object_dispose__17;
  id v12 = 0;
  uint64_t v3 = [(CAMBurstController *)self _mutexQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__CAMBurstController_currentBurstCount__block_invoke;
  v6[3] = &unk_263FA35E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = [(id)v8[5] count];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __39__CAMBurstController_currentBurstCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _activeSession];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)startBurstCaptureWithAnalyticsEvent:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v5 = [(CAMBurstController *)self _mutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CAMBurstController_startBurstCaptureWithAnalyticsEvent___block_invoke;
  block[3] = &unk_263FA3D60;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__CAMBurstController_startBurstCaptureWithAnalyticsEvent___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _activeSession];
  uint64_t v2 = objc_alloc_init(CAMBurstSession);
  [*(id *)(a1 + 32) _setActiveSession:v2];
  uint64_t v3 = [*(id *)(a1 + 32) _sessionsByIdentifier];
  uint64_t v4 = [(CAMBurstSession *)v2 identifier];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [v3 setObject:v2 forKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v7 = [*(id *)(a1 + 32) _analyticsEventsByIdentifier];
  [v7 setObject:*(void *)(a1 + 40) forKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  id v8 = [*(id *)(a1 + 32) _protectionController];
  [v8 startProtectingBurstProcessingForIdentifier:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [v8 startProtectingNebulaDaemonWritesForIdentifier:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)_mutexQueueProcessCompleteBurstSessionWithIdentifier:(id)a3 device:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(CAMBurstController *)self _protectionController];
    id v8 = [(CAMBurstController *)self _persistenceController];
    id v9 = [(CAMBurstController *)self _powerController];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke;
    v13[3] = &unk_263FA4EF0;
    v13[4] = self;
    id v14 = v6;
    id v15 = v9;
    id v17 = v7;
    int64_t v18 = a4;
    id v16 = v8;
    id v10 = v7;
    id v11 = v8;
    id v12 = v9;
    [v11 performDeferredRemotePersistenceWithCompletionHandler:v13];
  }
}

void __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  uint64_t v5 = [a1[4] _sessionsByIdentifier];
  id v6 = [v5 objectForKey:a1[5]];
  [v5 removeObjectForKey:a1[5]];
  id v7 = [v6 identifier];
  id v8 = [a1[4] _faceResultsByIdentifier];
  id v9 = [v6 identifier];
  [v8 removeObjectForKey:v9];

  objc_msgSend(a1[6], "addAssertionForIndentifier:withReason:", objc_msgSend(a1[6], "generateAssertionIdentifier"), 16);
  id v10 = [a1[4] _analysisQueue];
  v13 = v6;
  id v14 = a1[5];
  id v15 = a1[7];
  id v16 = a1[8];
  id v17 = a1[6];
  id v11 = v7;
  id v12 = v6;
  pl_dispatch_async();
}

void __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) performBurstAnalysisForDevice:*(void *)(a1 + 88)];
  id v3 = [*(id *)(a1 + 40) _analyticsEventsByIdentifier];
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 48)];

  uint64_t v5 = [*(id *)(a1 + 40) _analyticsEventsByIdentifier];
  [v5 removeObjectForKey:*(void *)(a1 + 48)];

  id v6 = [v2 allAssetIdentifiers];
  objc_msgSend(v4, "populateBurstLength:", objc_msgSend(v6, "count"));

  [v4 publish];
  id v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_2;
  v12[3] = &unk_263FA4EA0;
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 80);
  int v18 = *(_DWORD *)(a1 + 96);
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v9;
  uint64_t v16 = v10;
  id v17 = v2;
  id v11 = v2;
  [v7 persistBurstWithIdentifier:v8 result:v11 completionHandler:v12];
}

void __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) stopProtectingBurstProcessingForIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) stopProtectingNebulaDaemonWritesForIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) removeAssertionForIdentifier:*(unsigned int *)(a1 + 72) withReason:16];
  uint64_t v4 = [*(id *)(a1 + 56) _remoteShutterController];
  uint64_t v5 = v4;
  if (!a2 && *(void *)(a1 + 64) && [v4 isConnected])
  {
    id v6 = *(void **)(a1 + 64);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_3;
    id v17 = &unk_263FA4E78;
    id v18 = v5;
    id v7 = v6;
    uint64_t v8 = &v14;
    id v9 = objc_msgSend(v7, "bestAssetIdentifier", v14, v15);
    if (v9) {
      goto LABEL_8;
    }
    uint64_t v10 = [v7 goodAssetIdentifiers];
    id v9 = [v10 firstObject];

    if (v9
      || ([v7 allAssetIdentifiers],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [v11 firstObject],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v11,
          v9))
    {
LABEL_8:
      id v12 = [MEMORY[0x263F5DB40] sharedSystemLibraryAssetsdClient];
      id v13 = [v12 resourceInternalClient];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = ___loadThumbnailForBurstResult_block_invoke;
      v19[3] = &unk_263FA4F40;
      v20 = v8;
      [v13 requestMasterThumbnailForAssetUUID:v9 completionHandler:v19];
    }
    else
    {
      v16((uint64_t)v8, 0);
    }
  }
}

uint64_t __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) sendThumbnailData:a2 isVideo:0];
  }
  return result;
}

- (void)finishBurstCaptureForDevice:(int64_t)a3
{
  uint64_t v5 = [(CAMBurstController *)self _mutexQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__CAMBurstController_finishBurstCaptureForDevice___block_invoke;
  v6[3] = &unk_263FA04E0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

void __50__CAMBurstController_finishBurstCaptureForDevice___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _requestsPendingPersistenceByIdentifier];
  uint64_t v2 = [*(id *)(a1 + 32) _activeSession];
  id v3 = [v2 identifier];
  uint64_t v4 = [v5 countForObject:v3];
  [*(id *)(a1 + 32) _setActiveSession:0];
  if (!v4) {
    [*(id *)(a1 + 32) _mutexQueueProcessCompleteBurstSessionWithIdentifier:v3 device:*(void *)(a1 + 40)];
  }
}

- (void)cancelBurstCapture
{
  id v5 = [(CAMBurstController *)self _activeSession];
  id v3 = [v5 identifier];
  [(CAMBurstController *)self _setActiveSession:0];
  uint64_t v4 = [(CAMBurstController *)self _protectionController];
  [v4 stopProtectingBurstProcessingForIdentifier:v3];
  [v4 stopProtectingNebulaDaemonWritesForIdentifier:v3];
}

- (void)processEnqueuedRequest:(id)a3
{
  uint64_t v4 = [a3 burstIdentifier];
  if (v4)
  {
    id v5 = [(CAMBurstController *)self _mutexQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__CAMBurstController_processEnqueuedRequest___block_invoke;
    v7[3] = &unk_263FA0408;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(v5, v7);
  }
  else
  {
    id v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to enqueue a request for a burst session without an identifier specified!", buf, 2u);
    }
  }
}

void __45__CAMBurstController_processEnqueuedRequest___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _sessionsByIdentifier];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) _requestsPendingPersistenceByIdentifier];
    [v3 addObject:*(void *)(a1 + 40)];
    uint64_t v4 = [*(id *)(a1 + 32) _inflightRequestsByIdentifier];
    [v4 addObject:*(void *)(a1 + 40)];
  }
}

- (void)processCapturedRequest:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = [a3 burstIdentifier];
  if (v7)
  {
    id v8 = [(CAMBurstController *)self _mutexQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__CAMBurstController_processCapturedRequest_withResult___block_invoke;
    block[3] = &unk_263FA0CD0;
    void block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_sync(v8, block);
  }
  else
  {
    id v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to mark a request as captured for a burst session without an identifier specified!", buf, 2u);
    }
  }
}

void __56__CAMBurstController_processCapturedRequest_withResult___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _sessionsByIdentifier];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    [v2 addStillImageCaptureResult:*(void *)(a1 + 48)];
    uint64_t v4 = [*(id *)(a1 + 32) _inflightRequestsByIdentifier];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

- (void)processPersistedRequest:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 burstIdentifier];
  if (v8)
  {
    id v9 = [(CAMBurstController *)self _mutexQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__CAMBurstController_processPersistedRequest_withResult___block_invoke;
    v11[3] = &unk_263FA0A60;
    v11[4] = self;
    id v12 = v8;
    id v13 = v7;
    id v14 = v6;
    dispatch_sync(v9, v11);
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to add results to a burst session without an identifier specified!", buf, 2u);
    }
  }
}

void __57__CAMBurstController_processPersistedRequest_withResult___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _sessionsByIdentifier];
  uint64_t v2 = [v9 objectForKey:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) _faceResultsByIdentifier];
  uint64_t v4 = [v2 identifier];
  id v5 = [v3 objectForKey:v4];

  [v2 addStillImageLocalPersistenceResult:*(void *)(a1 + 48) withFaces:v5];
  [v5 removeAllObjects];
  id v6 = [*(id *)(a1 + 32) _requestsPendingPersistenceByIdentifier];
  [v6 removeObject:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 32) _activeSession];
  if (v7 != v2 && ![v6 countForObject:*(void *)(a1 + 40)])
  {
    id v8 = [*(id *)(a1 + 56) captureRequest];
    objc_msgSend(*(id *)(a1 + 32), "_mutexQueueProcessCompleteBurstSessionWithIdentifier:device:", *(void *)(a1 + 40), objc_msgSend(v8, "captureDevice"));
  }
}

- (void)processFaceResults:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMBurstController *)self _mutexQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__CAMBurstController_processFaceResults___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __41__CAMBurstController_processFaceResults___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _activeSession];
  if (v2)
  {
    id v6 = v2;
    id v3 = [v2 identifier];
    id v4 = [*(id *)(a1 + 32) _faceResultsByIdentifier];
    id v5 = [v4 objectForKey:v3];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v4 setObject:v5 forKey:v3];
    }
    [v5 addObjectsFromArray:*(void *)(a1 + 40)];

    uint64_t v2 = v6;
  }
}

- (unint64_t)inflightCountForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(CAMBurstController *)self _mutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CAMBurstController_inflightCountForIdentifier___block_invoke;
  block[3] = &unk_263FA3D60;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__CAMBurstController_inflightCountForIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _inflightRequestsByIdentifier];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 countForObject:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)_analyticsEventsByIdentifier
{
  return self->__analyticsEventsByIdentifier;
}

- (NSCountedSet)_inflightRequestsByIdentifier
{
  return self->__inflightRequestsByIdentifier;
}

- (NSCountedSet)_requestsPendingPersistenceByIdentifier
{
  return self->__requestsPendingPersistenceByIdentifier;
}

- (NSMutableDictionary)_faceResultsByIdentifier
{
  return self->__faceResultsByIdentifier;
}

- (CAMBurstSession)_activeSession
{
  return self->__activeSession;
}

- (void)_setActiveSession:(id)a3
{
}

- (OS_dispatch_queue)_analysisQueue
{
  return self->__analysisQueue;
}

- (CAMPersistenceController)_persistenceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__persistenceController);
  return (CAMPersistenceController *)WeakRetained;
}

- (CAMProtectionController)_protectionController
{
  return self->__protectionController;
}

- (CAMPowerController)_powerController
{
  return self->__powerController;
}

- (CAMRemoteShutterController)_remoteShutterController
{
  return self->__remoteShutterController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remoteShutterController, 0);
  objc_storeStrong((id *)&self->__powerController, 0);
  objc_storeStrong((id *)&self->__protectionController, 0);
  objc_destroyWeak((id *)&self->__persistenceController);
  objc_storeStrong((id *)&self->__analysisQueue, 0);
  objc_storeStrong((id *)&self->__activeSession, 0);
  objc_storeStrong((id *)&self->__faceResultsByIdentifier, 0);
  objc_storeStrong((id *)&self->__requestsPendingPersistenceByIdentifier, 0);
  objc_storeStrong((id *)&self->__inflightRequestsByIdentifier, 0);
  objc_storeStrong((id *)&self->__analyticsEventsByIdentifier, 0);
  objc_storeStrong((id *)&self->__sessionsByIdentifier, 0);
  objc_storeStrong((id *)&self->__mutexQueue, 0);
}

void __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to perform deferred remote persistence: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
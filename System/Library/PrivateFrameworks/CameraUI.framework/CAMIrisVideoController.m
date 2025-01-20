@interface CAMIrisVideoController
- (BOOL)isWaitingOnNebuladForRequest:(id)a3;
- (BOOL)shouldHandleLivePhotoRenderingForRequest:(id)a3;
- (CAMIrisVideoController)initWithNebulaDaemonProxyManager:(id)a3 delegate:(id)a4;
- (CAMIrisVideoControllerDelegate)delegate;
- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager;
- (NSMutableArray)_jobsToBeSent;
- (NSMutableDictionary)_pendingJobs;
- (OS_dispatch_queue)_mutexQueue;
- (void)_notifyDelegateOfVideoLocalPersistenceResult:(id)a3 forVideoPersistenceUUID:(id)a4;
- (void)_submitJob:(id)a3;
- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3;
- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4;
- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4;
@end

@implementation CAMIrisVideoController

- (CAMIrisVideoController)initWithNebulaDaemonProxyManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMIrisVideoController;
  v9 = [(CAMIrisVideoController *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->__nebulaDaemonProxyManager, a3);
    [(CAMNebulaDaemonProxyManager *)v10->__nebulaDaemonProxyManager setIrisClientDelegate:v10];
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    jobsToBeSent = v10->__jobsToBeSent;
    v10->__jobsToBeSent = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingJobs = v10->__pendingJobs;
    v10->__pendingJobs = v13;

    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.camera.iris-video-controller", v15);
    mutexQueue = v10->__mutexQueue;
    v10->__mutexQueue = (OS_dispatch_queue *)v16;

    v18 = v10;
  }

  return v10;
}

- (BOOL)shouldHandleLivePhotoRenderingForRequest:(id)a3
{
  return (unint64_t)([a3 effectFilterType] - 1) < 0xF;
}

- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CAMIrisVideoControllerJob alloc] initWithRequest:v7 videoCaptureResult:v6];

  v9 = [(CAMIrisVideoController *)self _mutexQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__CAMIrisVideoController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke;
  v11[3] = &unk_263FA0408;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_sync(v9, v11);
}

void __78__CAMIrisVideoController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _jobsToBeSent];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  dispatch_queue_t v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  id v8 = [(CAMIrisVideoController *)self _mutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke;
  block[3] = &unk_263FA35E8;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(v8, block);

  v9 = (void *)v13[5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke_3;
  v10[3] = &unk_263FA3910;
  v10[4] = self;
  [v9 enumerateObjectsUsingBlock:v10];
  _Block_object_dispose(&v12, 8);
}

void __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _jobsToBeSent];
  uint64_t v3 = [v2 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_26];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) _jobsToBeSent];
  [v6 removeAllObjects];
}

uint64_t __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 videoCaptureResult];
  id v6 = [v5 coordinationInfo];
  char v7 = [v6 resultSpecifiers];

  id v8 = [v4 videoCaptureResult];

  v9 = [v8 coordinationInfo];
  unsigned __int8 v10 = [v9 resultSpecifiers];

  if (v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v7) {
    return v11;
  }
  else {
    return v10 & ((v7 & 1) == 0);
  }
}

uint64_t __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _submitJob:a2];
}

- (void)_submitJob:(id)a3
{
  id v4 = a3;
  v5 = [v4 request];
  id v6 = [v4 videoCaptureResult];
  v33 = [v6 localDestinationURL];
  uint64_t v7 = objc_msgSend(v5, "isEV0LocalVideoDestinationURL:");
  v32 = [v5 irisStillImagePersistenceUUIDForEV0:v7];
  if ([v5 isCTMVideo]) {
    [v5 persistenceUUID];
  }
  else {
  id v8 = [v5 irisVideoPersistenceUUIDForEV0:v7];
  }
  v31 = [v5 irisIdentifierForEV0:v7];
  uint64_t v28 = [v5 captureDevice];
  uint64_t v9 = [v5 captureOrientation];
  v30 = +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", [v5 effectFilterType]);
  long long v50 = 0uLL;
  uint64_t v51 = 0;
  if (v6)
  {
    [v6 duration];
    long long v48 = 0uLL;
    uint64_t v49 = 0;
    [v6 stillDisplayTime];
  }
  else
  {
    long long v48 = 0uLL;
    uint64_t v49 = 0;
  }
  v29 = [v6 captureDate];
  [v29 timeIntervalSinceReferenceDate];
  double v11 = v10;
  uint64_t v12 = [v6 error];
  v13 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v14 = [v13 bundleIdentifier];

  v15 = [CAMIrisVideoJob alloc];
  uint64_t v16 = [v5 persistenceOptions];
  uint64_t v17 = [v5 temporaryPersistenceOptions];
  long long v46 = v50;
  uint64_t v47 = v51;
  long long v44 = v48;
  uint64_t v45 = v49;
  v18 = [(CAMIrisVideoJob *)v15 initWithVideoURL:v33 stillImagePersistenceUUID:v32 videoPersistenceUUID:v8 irisIdentifier:v31 captureDevice:v28 captureOrientation:v9 duration:v11 stillImageDisplayTime:&v46 captureTime:&v44 captureError:v12 filterName:v30 filteredVideoURL:0 persistenceOptions:v16 temporaryPersistenceOptions:v17 bundleIdentifier:v14];
  v19 = [(CAMIrisVideoController *)self delegate];

  if (v19)
  {
    objc_super v20 = [(CAMIrisVideoController *)self delegate];
    [v20 irisVideoController:self willPersistVideoCaptureResult:v6 forRequest:v5];
    double v22 = v21;

    if (v22 > 0.0)
    {
      v23 = dispatch_get_global_queue(25, 0);
      dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
      uint64_t v38 = MEMORY[0x263EF8330];
      uint64_t v39 = 3221225472;
      v40 = __37__CAMIrisVideoController__submitJob___block_invoke;
      v41 = &unk_263FA0408;
      v42 = self;
      id v43 = v8;
      pl_dispatch_after();
    }
  }
  v24 = [(CAMIrisVideoController *)self _mutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CAMIrisVideoController__submitJob___block_invoke_2;
  block[3] = &unk_263FA0A60;
  block[4] = self;
  id v35 = v8;
  id v36 = v4;
  v37 = v18;
  v25 = v18;
  id v26 = v4;
  id v27 = v8;
  dispatch_sync(v24, block);
}

uint64_t __37__CAMIrisVideoController__submitJob___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfVideoLocalPersistenceResult:0 forVideoPersistenceUUID:*(void *)(a1 + 40)];
}

void __37__CAMIrisVideoController__submitJob___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [*(id *)(a1 + 32) _pendingJobs];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

    [*(id *)(*(void *)(a1 + 32) + 24) ensureConnectionToDaemon];
  }
  v6[0] = *(void *)(a1 + 56);
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [*(id *)(*(void *)(a1 + 32) + 24) enqueueIrisVideoJobs:v5];
}

- (void)_notifyDelegateOfVideoLocalPersistenceResult:(id)a3 forVideoPersistenceUUID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAMIrisVideoController *)self delegate];

  if (v8)
  {
    uint64_t v19 = 0;
    objc_super v20 = &v19;
    uint64_t v21 = 0x3032000000;
    double v22 = __Block_byref_object_copy__10;
    v23 = __Block_byref_object_dispose__10;
    id v24 = 0;
    uint64_t v9 = [(CAMIrisVideoController *)self _mutexQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__CAMIrisVideoController__notifyDelegateOfVideoLocalPersistenceResult_forVideoPersistenceUUID___block_invoke;
    block[3] = &unk_263FA3938;
    v18 = &v19;
    block[4] = self;
    id v17 = v7;
    dispatch_sync(v9, block);

    if (v20[5])
    {
      if (!v6)
      {
        double v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          double v11 = [(id)v20[5] request];
          *(_DWORD *)buf = 138543362;
          id v26 = v11;
          _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Timed out while waiting for persistence result from nebulad for request %{public}@", buf, 0xCu);
        }
      }
      uint64_t v12 = [(CAMIrisVideoController *)self delegate];
      v13 = [(id)v20[5] videoCaptureResult];
      uint64_t v14 = [(id)v20[5] request];
      [v12 irisVideoController:self didPersistVideoCaptureResult:v6 forCaptureResult:v13 request:v14];
    }
    else
    {
      if (!v6) {
        goto LABEL_9;
      }
      uint64_t v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(id)v20[5] request];
        *(_DWORD *)buf = 138543362;
        id v26 = v15;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Received persistence result from nebulad but ignoring since we already timed out for %{public}@", buf, 0xCu);
      }
    }

LABEL_9:
    _Block_object_dispose(&v19, 8);
  }
}

void __95__CAMIrisVideoController__notifyDelegateOfVideoLocalPersistenceResult_forVideoPersistenceUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _pendingJobs];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [*(id *)(a1 + 32) _pendingJobs];
    [v6 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

    id v7 = *(void **)(*(void *)(a1 + 32) + 24);
    [v7 closeConnectionToDaemon];
  }
}

- (BOOL)isWaitingOnNebuladForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(CAMIrisVideoController *)self delegate];

  if (!v5)
  {
    id v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMIrisVideoController isWaitingOnNebuladForRequest:](v8);
    }
    goto LABEL_8;
  }
  if (!v4)
  {
    id v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMIrisVideoController isWaitingOnNebuladForRequest:](v8);
    }
LABEL_8:

    BOOL v7 = 0;
    goto LABEL_9;
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v6 = [(CAMIrisVideoController *)self _mutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CAMIrisVideoController_isWaitingOnNebuladForRequest___block_invoke;
  block[3] = &unk_263FA3938;
  uint64_t v12 = &v13;
  block[4] = self;
  id v11 = v4;
  dispatch_sync(v6, block);

  BOOL v7 = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
LABEL_9:

  return v7;
}

void __55__CAMIrisVideoController_isWaitingOnNebuladForRequest___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _pendingJobs];
  id v2 = [*(id *)(a1 + 40) videoPersistenceUUID];
  uint64_t v3 = [v7 objectForKeyedSubscript:v2];
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _pendingJobs];
    v5 = [*(id *)(a1 + 40) EV0VideoPersistenceUUID];
    id v6 = [v4 objectForKeyedSubscript:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 != 0;
  }
}

- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localPersistenceUUID];
  [(CAMIrisVideoController *)self _notifyDelegateOfVideoLocalPersistenceResult:v4 forVideoPersistenceUUID:v5];
}

- (CAMIrisVideoControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMIrisVideoControllerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)_mutexQueue
{
  return self->__mutexQueue;
}

- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager
{
  return self->__nebulaDaemonProxyManager;
}

- (NSMutableArray)_jobsToBeSent
{
  return self->__jobsToBeSent;
}

- (NSMutableDictionary)_pendingJobs
{
  return self->__pendingJobs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pendingJobs, 0);
  objc_storeStrong((id *)&self->__jobsToBeSent, 0);
  objc_storeStrong((id *)&self->__nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->__mutexQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)isWaitingOnNebuladForRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Cannot track nebulad requests if we don't have a delegate set up", v1, 2u);
}

- (void)isWaitingOnNebuladForRequest:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Cannot track nebulad requests for nil request", v1, 2u);
}

@end
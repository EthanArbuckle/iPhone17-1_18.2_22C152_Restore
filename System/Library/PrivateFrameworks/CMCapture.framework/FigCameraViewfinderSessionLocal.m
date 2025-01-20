@interface FigCameraViewfinderSessionLocal
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)usesMovieFileOutput;
- (BOOL)usesPhotoOutput;
- (id)_initWithOwningViewfinder:(id)a3 captureSessionProxy:(id)a4 delegateStorage:(id)a5;
- (id)viewfinder;
- (int64_t)identifier;
- (uint64_t)_closePreviewStream;
- (uint64_t)_setupStateMachine;
- (void)_captureSessionDidCapturePhotoWithStatus:(int)a3 thumbnailData:(id)a4 timestamp:(id *)a5;
- (void)_captureSessionDidFinishMovieRecording;
- (void)_captureSessionDidStartMovieRecording;
- (void)_captureSessionDidStop;
- (void)cameraViewfinderStream:(id)a3 didCloseWithStatus:(int)a4;
- (void)cameraViewfinderStreamDidOpen:(id)a3;
- (void)captureSession:(id)a3 previewTapDidOutputSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)captureSessionPreviewTapDidClose:(id)a3;
- (void)captureSessionPreviewTapDidOpen:(id)a3;
- (void)closePreviewStream;
- (void)dealloc;
- (void)openPreviewStreamWithOptions:(id)a3;
@end

@implementation FigCameraViewfinderSessionLocal

- (id)_initWithOwningViewfinder:(id)a3 captureSessionProxy:(id)a4 delegateStorage:(id)a5
{
  if (a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)FigCameraViewfinderSessionLocal;
    v8 = [(FigCameraViewfinderSession *)&v12 initSubclass];
    v9 = v8;
    if (v8)
    {
      -[FigCameraViewfinderSessionLocal _setupStateMachine]((uint64_t)v8);
      objc_storeWeak(v9 + 2, a3);
      v9[5] = a4;
      v9[6] = (id)[a4 identifier];
      v9[1] = a5;
      v9[8] = dispatch_queue_create("com.apple.coremedia.cameraviewfindersession.previewstream", 0);
      v10 = objc_alloc_init(FigCameraViewfinderStream);
      v9[7] = v10;
      [(FigCameraViewfinderStream *)v10 setDelegate:v9 queue:v9[8]];
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (uint64_t)_setupStateMachine
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [[FigStateMachine alloc] initWithLabel:@"FigCameraViewfinderSessionLocalStateMachine" stateCount:7 initialState:1 owner:result];
    *(void *)(v1 + 24) = v2;
    [(FigStateMachine *)v2 setLabel:@"Idle" forState:1];
    [*(id *)(v1 + 24) setLabel:@"OpeningPreviewStream" forState:2];
    [*(id *)(v1 + 24) setLabel:@"OpeningPreviewTap" forState:4];
    [*(id *)(v1 + 24) setLabel:@"StreamingPreview" forState:8];
    [*(id *)(v1 + 24) setLabel:@"ClosingPreviewTap" forState:16];
    [*(id *)(v1 + 24) setLabel:@"ClosingPreviewStream" forState:32];
    [*(id *)(v1 + 24) setLabel:@"SessionEnded" forState:64];
    [*(id *)(v1 + 24) markStateAsTerminal:64];
    [*(id *)(v1 + 24) setPerformsAtomicStateTransitions:0];
    [*(id *)(v1 + 24) whenTransitioningToState:8 callHandler:&__block_literal_global_50];
    [*(id *)(v1 + 24) whenTransitioningToStates:65 callHandler:&__block_literal_global_134];
    v3 = *(void **)(v1 + 24);
    return [v3 whenTransitioningToStateFails:2 callHandler:&__block_literal_global_139];
  }
  return result;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_captureSessionProxy;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result clientAuditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_viewfinder, 0);

  [(FigCameraViewfinderStream *)self->_previewStream setDelegate:0 queue:0];
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderSessionLocal;
  [(FigCameraViewfinderSession *)&v3 dealloc];
}

- (BOOL)usesPhotoOutput
{
  return [(FigCaptureSessionProxy *)self->_captureSessionProxy containsStillImageSink];
}

- (BOOL)usesMovieFileOutput
{
  return [(FigCaptureSessionProxy *)self->_captureSessionProxy containsMovieFileSink];
}

- (void)openPreviewStreamWithOptions:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5350)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  previewStreamQueue = self->_previewStreamQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__FigCameraViewfinderSessionLocal_openPreviewStreamWithOptions___block_invoke;
  v7[3] = &unk_1E5C24458;
  v7[4] = self;
  v7[5] = a3;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v7);
}

uint64_t __64__FigCameraViewfinderSessionLocal_openPreviewStreamWithOptions___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) transitionToState:2 fromState:1];
  if (result)
  {
    objc_super v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v5 = [v3 objectForKeyedSubscript:@"PreviewStreamDestination"];
    return [v4 openWithDestination:v5];
  }
  return result;
}

- (void)closePreviewStream
{
  previewStreamQueue = self->_previewStreamQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__FigCameraViewfinderSessionLocal_closePreviewStream__block_invoke;
  v3[3] = &unk_1E5C24430;
  v3[4] = self;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v3);
}

uint64_t __53__FigCameraViewfinderSessionLocal_closePreviewStream__block_invoke(uint64_t a1)
{
  return -[FigCameraViewfinderSessionLocal _closePreviewStream](*(void *)(a1 + 32));
}

- (uint64_t)_closePreviewStream
{
  if (result)
  {
    uint64_t v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v8 = v1;
      LODWORD(v7) = 0;
      FigDebugAssert3();
    }
    uint64_t result = objc_msgSend(*(id *)(v2 + 24), "currentState", v7, v8);
    if (result == 8 || result == 4)
    {
      uint64_t result = [*(id *)(v2 + 24) transitionToState:16 fromStates:12];
      if (result)
      {
        id v4 = (id)v2;
        uint64_t v5 = *(void **)(v2 + 40);
        return [v5 closePreviewTap];
      }
    }
    else if (result == 2)
    {
      uint64_t result = [*(id *)(v2 + 24) transitionToState:32 fromState:2];
      if (result)
      {
        v6 = *(void **)(v2 + 56);
        return [v6 close];
      }
    }
  }
  return result;
}

- (void)cameraViewfinderStreamDidOpen:(id)a3
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v9 = v3;
    LODWORD(v8) = 0;
    FigDebugAssert3();
  }
  if (-[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 4, 2, v8, v9))
  {
    int v5 = [(FigCaptureSessionProxy *)self->_captureSessionProxy openPreviewTapWithDelegate:self];
    if (v5)
    {
      int v6 = v5;
      if ([(FigStateMachine *)self->_stateMachine transitionToState:32 fromState:4])
      {
        self->_previewStreamClosedErrorStatus = v6;
        previewStream = self->_previewStream;
        [(FigCameraViewfinderStream *)previewStream close];
      }
    }
  }
}

- (void)cameraViewfinderStream:(id)a3 didCloseWithStatus:(int)a4
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v15 = v4;
    LODWORD(v14) = 0;
    FigDebugAssert3();
  }
  int v7 = [(FigStateMachine *)self->_stateMachine currentState];
  if (v7 <= 7)
  {
    if (v7 == 2)
    {
      if (self->_ended) {
        uint64_t v8 = 64;
      }
      else {
        uint64_t v8 = 1;
      }
      stateMachine = self->_stateMachine;
      uint64_t previewStreamClosedErrorStatus = self->_previewStreamClosedErrorStatus;
LABEL_26:
      [(FigStateMachine *)stateMachine transitionToState:v8 errorStatus:previewStreamClosedErrorStatus];
      return;
    }
    if (v7 != 4) {
      return;
    }
  }
  else if (v7 != 8)
  {
    if (v7 == 16)
    {
      self->_previewStreamClosed = 1;
      self->_uint64_t previewStreamClosedErrorStatus = a4;
      return;
    }
    if (v7 != 32) {
      return;
    }
    if (self->_ended) {
      uint64_t v8 = 64;
    }
    else {
      uint64_t v8 = 1;
    }
    unsigned int v9 = self->_previewStreamClosedErrorStatus;
    if (v9) {
      uint64_t previewStreamClosedErrorStatus = v9;
    }
    else {
      uint64_t previewStreamClosedErrorStatus = a4;
    }
    self->_uint64_t previewStreamClosedErrorStatus = previewStreamClosedErrorStatus;
    stateMachine = self->_stateMachine;
    goto LABEL_26;
  }
  if ([(FigStateMachine *)self->_stateMachine transitionToState:16 fromStates:12])
  {
    self->_previewStreamClosed = 1;
    self->_uint64_t previewStreamClosedErrorStatus = a4;
    objc_super v12 = self;
    captureSessionProxy = self->_captureSessionProxy;
    [(FigCaptureSessionProxy *)captureSessionProxy closePreviewTap];
  }
}

- (void)captureSessionPreviewTapDidOpen:(id)a3
{
  previewStreamQueue = self->_previewStreamQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__FigCameraViewfinderSessionLocal_captureSessionPreviewTapDidOpen___block_invoke;
  v4[3] = &unk_1E5C24430;
  v4[4] = self;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v4);
}

uint64_t __67__FigCameraViewfinderSessionLocal_captureSessionPreviewTapDidOpen___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) transitionToState:8 fromState:4];
}

- (void)captureSessionPreviewTapDidClose:(id)a3
{
  previewStreamQueue = self->_previewStreamQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__FigCameraViewfinderSessionLocal_captureSessionPreviewTapDidClose___block_invoke;
  v4[3] = &unk_1E5C24430;
  v4[4] = self;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v4);
}

void __68__FigCameraViewfinderSessionLocal_captureSessionPreviewTapDidClose___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) currentState] == 16)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v2 + 72))
    {
      if (*(unsigned char *)(v2 + 32)) {
        uint64_t v3 = 64;
      }
      else {
        uint64_t v3 = 1;
      }
      [*(id *)(v2 + 24) transitionToState:v3 errorStatus:*(unsigned int *)(v2 + 76)];
    }
    else if ([*(id *)(v2 + 24) transitionToState:32 fromState:16])
    {
      [*(id *)(*(void *)(a1 + 32) + 56) close];
    }
  }
  uint64_t v4 = *(void **)(a1 + 32);
}

- (void)captureSession:(id)a3 previewTapDidOutputSampleBuffer:(opaqueCMSampleBuffer *)a4
{
}

- (void)_captureSessionDidStop
{
  previewStreamQueue = self->_previewStreamQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__FigCameraViewfinderSessionLocal__captureSessionDidStop__block_invoke;
  v3[3] = &unk_1E5C24430;
  v3[4] = self;
  fig_dispatch_async_autoreleasepool(previewStreamQueue, v3);
}

uint64_t __57__FigCameraViewfinderSessionLocal__captureSessionDidStop__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) transitionToState:64 fromState:1];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    return -[FigCameraViewfinderSessionLocal _closePreviewStream](v3);
  }
  return result;
}

- (void)_captureSessionDidCapturePhotoWithStatus:(int)a3 thumbnailData:(id)a4 timestamp:(id *)a5
{
  if (!self->_ended)
  {
    delegateStorage = self->super._delegateStorage;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __100__FigCameraViewfinderSessionLocal__captureSessionDidCapturePhotoWithStatus_thumbnailData_timestamp___block_invoke;
    v6[3] = &unk_1E5C27170;
    int v7 = a3;
    v6[4] = self;
    v6[5] = a4;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a5;
    [(FigDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v6];
  }
}

uint64_t __100__FigCameraViewfinderSessionLocal__captureSessionDidCapturePhotoWithStatus_thumbnailData_timestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    long long v8 = *(_OWORD *)(a1 + 52);
    uint64_t v9 = *(void *)(a1 + 68);
    return [a2 cameraViewfinderSession:v6 didCapturePhotoWithStatus:v5 thumbnailData:v7 timestamp:&v8];
  }
  return result;
}

- (void)_captureSessionDidStartMovieRecording
{
  if (!self->_ended)
  {
    delegateStorage = self->super._delegateStorage;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __72__FigCameraViewfinderSessionLocal__captureSessionDidStartMovieRecording__block_invoke;
    v3[3] = &unk_1E5C25340;
    v3[4] = self;
    [(FigDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v3];
  }
}

uint64_t __72__FigCameraViewfinderSessionLocal__captureSessionDidStartMovieRecording__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 cameraViewfinderSessionDidStartMovieRecording:v5];
  }
  return result;
}

- (void)_captureSessionDidFinishMovieRecording
{
  if (!self->_ended)
  {
    delegateStorage = self->super._delegateStorage;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __73__FigCameraViewfinderSessionLocal__captureSessionDidFinishMovieRecording__block_invoke;
    v3[3] = &unk_1E5C25340;
    v3[4] = self;
    [(FigDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v3];
  }
}

uint64_t __73__FigCameraViewfinderSessionLocal__captureSessionDidFinishMovieRecording__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 cameraViewfinderSessionDidFinishMovieRecording:v5];
  }
  return result;
}

- (id)viewfinder
{
  return objc_loadWeak((id *)&self->_viewfinder);
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_2;
  v4[3] = &unk_1E5C25340;
  v4[4] = a2;
  return [v2 invokeDelegateCallbackWithBlock:v4];
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 cameraViewfinderSessionPreviewStreamDidOpen:v5];
  }
  return result;
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_3(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  *(unsigned char *)(a2 + 72) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  if (a3 != 1)
  {
    if (a5 == -50) {
      int v5 = -16290;
    }
    else {
      int v5 = a5;
    }
    uint64_t v6 = *(void **)(a2 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_4;
    v8[3] = &unk_1E5C25318;
    v8[4] = a2;
    int v9 = v5;
    return [v6 invokeDelegateCallbackWithBlock:v8];
  }
  return result;
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(unsigned int *)(a1 + 40);
    return [a2 cameraViewfinderSession:v5 previewStreamDidCloseWithStatus:v6];
  }
  return result;
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_5(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 64)
  {
    v7[5] = v3;
    void v7[6] = v4;
    uint64_t v5 = *(void **)(a2 + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_6;
    v7[3] = &unk_1E5C25340;
    v7[4] = a2;
    return [v5 invokeDelegateCallbackWithBlock:v7];
  }
  return result;
}

uint64_t __53__FigCameraViewfinderSessionLocal__setupStateMachine__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 cameraViewfinderSession:v5 previewStreamDidCloseWithStatus:4294951005];
  }
  return result;
}

@end
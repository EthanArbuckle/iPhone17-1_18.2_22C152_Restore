@interface FigCameraViewfinderSessionRemote
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)usesMovieFileOutput;
- (BOOL)usesPhotoOutput;
- (id)_initWithRemoteViewfinderSession:(id)a3 clientAuditToken:(id *)a4 usesPhotoOutput:(BOOL)a5 usesMovieFileOutput:(BOOL)a6 delegateStorage:(id)a7;
- (uint64_t)_setupStateMachine;
- (void)_clientDisconnectedFromServer;
- (void)_movieRecordingDidFinish;
- (void)_movieRecordingDidStart;
- (void)_previewStreamDidCloseWithStatus:(int)a3;
- (void)_previewStreamDidOpen;
- (void)_serverDied;
- (void)closePreviewStream;
- (void)dealloc;
- (void)openPreviewStreamWithOptions:(id)a3;
@end

@implementation FigCameraViewfinderSessionRemote

- (uint64_t)_setupStateMachine
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [[FigStateMachine alloc] initWithLabel:@"FigCameraViewfinderSessionRemoteStateMachine" stateCount:4 initialState:1 owner:result];
    *(void *)(v1 + 64) = v2;
    [(FigStateMachine *)v2 setLabel:@"Idle" forState:1];
    [*(id *)(v1 + 64) setLabel:@"OpeningPreviewStream" forState:2];
    [*(id *)(v1 + 64) setLabel:@"StreamingPreview" forState:4];
    [*(id *)(v1 + 64) setLabel:@"DetachedFromServer" forState:8];
    [*(id *)(v1 + 64) markStateAsTerminal:8];
    [*(id *)(v1 + 64) whenTransitioningToStates:9 callHandler:&__block_literal_global_154];
    [*(id *)(v1 + 64) whenTransitioningFromState:2 toState:4 callHandler:&__block_literal_global_160];
    v3 = *(void **)(v1 + 64);
    return [v3 whenTransitioningToStateFails:2 callHandler:&__block_literal_global_167];
  }
  return result;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (id)_initWithRemoteViewfinderSession:(id)a3 clientAuditToken:(id *)a4 usesPhotoOutput:(BOOL)a5 usesMovieFileOutput:(BOOL)a6 delegateStorage:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)FigCameraViewfinderSessionRemote;
  v12 = [(FigCameraViewfinderSession *)&v15 initSubclass];
  if (v12)
  {
    *((void *)v12 + 2) = a3;
    long long v13 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)(v12 + 24) = *(_OWORD *)a4->var0;
    *(_OWORD *)(v12 + 40) = v13;
    v12[56] = a5;
    v12[57] = a6;
    *((void *)v12 + 1) = a7;
    *((_DWORD *)v12 + 19) = 0;
    -[FigCameraViewfinderSessionRemote _setupStateMachine]((uint64_t)v12);
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderSessionRemote;
  [(FigCameraViewfinderSession *)&v3 dealloc];
}

- (BOOL)usesPhotoOutput
{
  return self->_usesPhotoOutput;
}

- (BOOL)usesMovieFileOutput
{
  return self->_usesMovieFileOutput;
}

- (void)openPreviewStreamWithOptions:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5790)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 2, 1, v6, v7))
  {
    [(FigCameraViewfinderSessionRemoteObject *)self->_remoteViewfinderSession openPreviewStreamWithOptions:a3];
  }
}

- (void)closePreviewStream
{
  unsigned int v3 = [(FigStateMachine *)self->_stateMachine currentState];
  if (v3 == 4 || v3 == 2)
  {
    remoteViewfinderSession = self->_remoteViewfinderSession;
    [(FigCameraViewfinderSessionRemoteObject *)remoteViewfinderSession closePreviewStream];
  }
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  if (a3 != 1)
  {
    uint64_t v11 = v5;
    uint64_t v12 = v6;
    uint64_t v7 = *(void **)(a2 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2;
    v9[3] = &unk_1E5C25318;
    v9[4] = a2;
    int v10 = a5;
    return [v7 invokeDelegateCallbackWithBlock:v9];
  }
  return result;
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (dword_1EB4C5790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSession:previewStreamDidCloseWithStatus:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 40), v6, v7);
  }
  return result;
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_158(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2_161;
  v4[3] = &unk_1E5C25340;
  v4[4] = a2;
  return [v2 invokeDelegateCallbackWithBlock:v4];
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2_161(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (dword_1EB4C5790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSessionPreviewStreamDidOpen:", *(void *)(a1 + 32), v6, v7);
  }
  return result;
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_164(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 8)
  {
    v7[5] = v3;
    v7[6] = v4;
    uint64_t v5 = *(void **)(a2 + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2_168;
    v7[3] = &unk_1E5C25340;
    v7[4] = a2;
    return [v5 invokeDelegateCallbackWithBlock:v7];
  }
  return result;
}

uint64_t __54__FigCameraViewfinderSessionRemote__setupStateMachine__block_invoke_2_168(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (dword_1EB4C5790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSession:previewStreamDidCloseWithStatus:", *(void *)(a1 + 32), 4294951005, v6, v7);
  }
  return result;
}

- (void)_serverDied
{
  [(FigStateMachine *)self->_stateMachine transitionToState:8 errorStatus:4294951004];
  [(FigCameraViewfinderSessionRemote *)self _movieRecordingDidFinish];
}

- (void)_clientDisconnectedFromServer
{
}

- (void)_previewStreamDidOpen
{
}

- (void)_previewStreamDidCloseWithStatus:(int)a3
{
}

- (void)_movieRecordingDidStart
{
  p_recordingMovieLock = &self->_recordingMovieLock;
  os_unfair_lock_lock(&self->_recordingMovieLock);
  BOOL recordingMovie = self->_recordingMovie;
  self->_BOOL recordingMovie = 1;
  os_unfair_lock_unlock(p_recordingMovieLock);
  if (!recordingMovie)
  {
    delegateStorage = self->super._delegateStorage;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__FigCameraViewfinderSessionRemote__movieRecordingDidStart__block_invoke;
    v6[3] = &unk_1E5C25288;
    v6[4] = self;
    [(FigDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v6];
  }
}

uint64_t __59__FigCameraViewfinderSessionRemote__movieRecordingDidStart__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (dword_1EB4C5790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSessionDidStartMovieRecording:", *(void *)(a1 + 32), v6, v7);
  }
  return result;
}

- (void)_movieRecordingDidFinish
{
  p_recordingMovieLock = &self->_recordingMovieLock;
  os_unfair_lock_lock(&self->_recordingMovieLock);
  BOOL recordingMovie = self->_recordingMovie;
  self->_BOOL recordingMovie = 0;
  os_unfair_lock_unlock(p_recordingMovieLock);
  if (recordingMovie)
  {
    delegateStorage = self->super._delegateStorage;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__FigCameraViewfinderSessionRemote__movieRecordingDidFinish__block_invoke;
    v6[3] = &unk_1E5C25288;
    v6[4] = self;
    [(FigDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v6];
  }
}

uint64_t __60__FigCameraViewfinderSessionRemote__movieRecordingDidFinish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (dword_1EB4C5790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinderSessionDidFinishMovieRecording:", *(void *)(a1 + 32), v6, v7);
  }
  return result;
}

@end
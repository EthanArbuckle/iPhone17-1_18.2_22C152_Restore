@interface AVOutputDeviceAuthorizationSession
+ (id)outputDeviceAuthorizationSessionWithEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3;
+ (id)sharedAuthorizationSession;
+ (void)initialize;
- (AVOutputDeviceAuthorizationSession)initWithOutputDeviceAuthorizationSessionImpl:(id)a3;
- (AVOutputDeviceAuthorizationSessionDelegate)delegate;
- (BOOL)outputDeviceAuthorizationSessionImpl:(id)a3 shouldRetryAuthorizationRequest:(id)a4 reason:(id)a5;
- (id)impl;
- (void)dealloc;
- (void)outputDeviceAuthorizationSessionImpl:(id)a3 didProvideAuthorizationRequest:(id)a4;
- (void)outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AVOutputDeviceAuthorizationSession

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (id)sharedAuthorizationSession
{
  if (sharedAuthorizationSession_onceToken != -1) {
    dispatch_once(&sharedAuthorizationSession_onceToken, &__block_literal_global_14);
  }
  return (id)sharedAuthorizationSession_session;
}

void __64__AVOutputDeviceAuthorizationSession_sharedAuthorizationSession__block_invoke()
{
  v0 = +[AVFigEndpointUIAgentOutputContextManagerImpl copySharedEndpointUIAgent];
  v1 = [[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl alloc] initWithFigEndpointUIAgent:v0];
  sharedAuthorizationSession_session = [[AVOutputDeviceAuthorizationSession alloc] initWithOutputDeviceAuthorizationSessionImpl:v1];
  AVOutputDeviceAuthorizationTokenTypePIN_block_invoke_notificationToken = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1EE5A8698, 0, 0, &__block_literal_global_25);

  if (v0)
  {
    CFRelease(v0);
  }
}

void __64__AVOutputDeviceAuthorizationSession_sharedAuthorizationSession__block_invoke_2()
{
  v0 = +[AVFigEndpointUIAgentOutputContextManagerImpl copySharedEndpointUIAgent];
  v1 = [[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl alloc] initWithFigEndpointUIAgent:v0];
  [(id)sharedAuthorizationSession_session outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl:v1];

  if (v0)
  {
    CFRelease(v0);
  }
}

- (AVOutputDeviceAuthorizationSession)initWithOutputDeviceAuthorizationSessionImpl:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceAuthorizationSession;
  v4 = [(AVOutputDeviceAuthorizationSession *)&v8 init];
  if (v4
    && (v5 = objc_alloc_init(AVOutputDeviceAuthorizationSessionInternal), (v4->_ivars = v5) != 0)
    && (v4->_ivars->impl = (AVOutputDeviceAuthorizationSessionImpl *)a3) != 0)
  {
    v4->_ivars->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputdeviceauthorizationsession.ivars");
    [(AVOutputDeviceAuthorizationSessionImpl *)v4->_ivars->impl setParentAuthorizationSession:v4];
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
    ivarAccessQueue = ivars->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      ivars = self->_ivars;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputDeviceAuthorizationSession;
  [(AVOutputDeviceAuthorizationSession *)&v5 dealloc];
}

- (id)impl
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVOutputDeviceAuthorizationSession_impl__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __42__AVOutputDeviceAuthorizationSession_impl__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVOutputDeviceAuthorizationSessionDelegate)delegate
{
  return (AVOutputDeviceAuthorizationSessionDelegate *)objc_loadWeak((id *)&self->_ivars->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)outputDeviceAuthorizationSessionImpl:(id)a3 didProvideAuthorizationRequest:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(AVOutputDeviceAuthorizationSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (dword_1E9356A10)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceAuthorizationSessionDelegate outputDeviceAuthorizationSession:didProvideAuthorizationRequest:](v6, "outputDeviceAuthorizationSession:didProvideAuthorizationRequest:", self, a4, v9, v10);
  }
  else if (dword_1E9356A10)
  {
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)outputDeviceAuthorizationSessionImpl:(id)a3 shouldRetryAuthorizationRequest:(id)a4 reason:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(AVOutputDeviceAuthorizationSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (dword_1E9356A10)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -[AVOutputDeviceAuthorizationSessionDelegate outputDeviceAuthorizationSession:shouldRetryAuthorizationRequest:reason:](v8, "outputDeviceAuthorizationSession:shouldRetryAuthorizationRequest:reason:", self, a4, a5, v12, v13);
  }
  else
  {
    if (dword_1E9356A10)
    {
      uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
}

- (void)outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__17;
  uint64_t v11 = __Block_byref_object_dispose__17;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__AVOutputDeviceAuthorizationSession_outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(id)v8[5] setParentAuthorizationSession:0];
  [a3 setParentAuthorizationSession:self];

  _Block_object_dispose(&v7, 8);
}

id __103__AVOutputDeviceAuthorizationSession_outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24));

  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)outputDeviceAuthorizationSessionWithEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3
{
  id v3 = [[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl alloc] initWithFigEndpointUIAgent:a3];
  v4 = [[AVOutputDeviceAuthorizationSession alloc] initWithOutputDeviceAuthorizationSessionImpl:v3];

  return v4;
}

@end
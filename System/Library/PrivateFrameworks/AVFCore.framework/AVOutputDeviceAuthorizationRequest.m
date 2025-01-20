@interface AVOutputDeviceAuthorizationRequest
- (AVOutputDevice)outputDevice;
- (AVOutputDeviceAuthorizationRequest)initWithOutputDeviceAuthorizationRequestImpl:(id)a3;
- (NSError)error;
- (NSString)ID;
- (NSString)authorizationTokenType;
- (id)description;
- (id)impl;
- (int64_t)status;
- (void)cancel;
- (void)dealloc;
- (void)respondWithAuthorizationToken:(id)a3 completionHandler:(id)a4;
@end

@implementation AVOutputDeviceAuthorizationRequest

- (AVOutputDeviceAuthorizationRequest)initWithOutputDeviceAuthorizationRequestImpl:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceAuthorizationRequest;
  v4 = [(AVOutputDeviceAuthorizationRequest *)&v8 init];
  if (v4
    && (v5 = objc_alloc_init(AVOutputDeviceAuthorizationRequestInternal), (v4->_ivars = v5) != 0)
    && (v4->_ivars->impl = (AVOutputDeviceAuthorizationRequestImpl *)a3) != 0)
  {
    v4->_ivars->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.output-device-auth-session.ivars");
    v4->_ivars->status = 0;
    v4->_ivars->error = 0;
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
  v5.super_class = (Class)AVOutputDeviceAuthorizationRequest;
  [(AVOutputDeviceAuthorizationRequest *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, ID=%@, outputDevice=%@, tokenType=%@>", NSStringFromClass(v4), self, -[AVOutputDeviceAuthorizationRequest ID](self, "ID"), -[AVOutputDeviceAuthorizationRequest outputDevice](self, "outputDevice"), -[AVOutputDeviceAuthorizationRequest authorizationTokenType](self, "authorizationTokenType")];
}

- (id)impl
{
  return self->_ivars->impl;
}

- (int64_t)status
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVOutputDeviceAuthorizationRequest_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVOutputDeviceAuthorizationRequest_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (NSError)error
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVOutputDeviceAuthorizationRequest_error__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVOutputDeviceAuthorizationRequest_error__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)ID
{
  id v2 = [(AVOutputDeviceAuthorizationRequest *)self impl];
  return (NSString *)[v2 ID];
}

- (AVOutputDevice)outputDevice
{
  id v2 = [(AVOutputDeviceAuthorizationRequest *)self impl];
  return (AVOutputDevice *)[v2 outputDevice];
}

- (NSString)authorizationTokenType
{
  id v2 = [(AVOutputDeviceAuthorizationRequest *)self impl];
  return (NSString *)[v2 authorizationTokenType];
}

- (void)respondWithAuthorizationToken:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A10)
  {
    int v13 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v8 = [(AVOutputDeviceAuthorizationRequest *)self impl];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__AVOutputDeviceAuthorizationRequest_respondWithAuthorizationToken_completionHandler___block_invoke;
  v11[3] = &unk_1E57B4C10;
  v11[4] = self;
  v11[5] = a4;
  [v8 respondWithAuthorizationToken:a3 completionHandler:v11];
}

uint64_t __86__AVOutputDeviceAuthorizationRequest_respondWithAuthorizationToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[28] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(*(void *)(v5 + 8) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVOutputDeviceAuthorizationRequest_respondWithAuthorizationToken_completionHandler___block_invoke_2;
  block[3] = &unk_1E57B2270;
  block[5] = a3;
  block[6] = a2;
  block[4] = v5;
  av_readwrite_dispatch_queue_write(v6, block);
  if (dword_1E9356A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2 == 3);
}

uint64_t __86__AVOutputDeviceAuthorizationRequest_respondWithAuthorizationToken_completionHandler___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDeviceAuthorizationRequest impl](self, "impl", v4, v5), "cancel");
}

@end
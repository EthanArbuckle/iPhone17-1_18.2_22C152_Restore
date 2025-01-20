@interface AVOutputContextManager
+ (id)outputContextManagerForAllOutputContexts;
- (AVOutputContextManager)initWithOutputContextManagerImpl:(id)a3;
- (void)dealloc;
- (void)outputContextManagerImpl:(id)a3 observedFailureToConnectToOutputDevice:(id)a4 reason:(id)a5 didFailToConnectToOutputDeviceDictionary:(id)a6;
- (void)outputContextManagerImplDidExpireWithReplacementImpl:(id)a3;
@end

@implementation AVOutputContextManager

+ (id)outputContextManagerForAllOutputContexts
{
  if (outputContextManagerForAllOutputContexts_onceToken != -1) {
    dispatch_once(&outputContextManagerForAllOutputContexts_onceToken, &__block_literal_global_418);
  }
  return (id)outputContextManagerForAllOutputContexts_sSharedManager;
}

void __66__AVOutputContextManager_outputContextManagerForAllOutputContexts__block_invoke()
{
  v0 = +[AVFigEndpointUIAgentOutputContextManagerImpl copySharedEndpointUIAgent];
  v1 = [[AVFigEndpointUIAgentOutputContextManagerImpl alloc] initWithEndpointUIAgent:v0];
  outputContextManagerForAllOutputContexts_sSharedManager = [[AVOutputContextManager alloc] initWithOutputContextManagerImpl:v1];
  AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped_block_invoke_notificationToken = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1EE5A8698, 0, 0, &__block_literal_global_423);
  if (v0) {
    CFRelease(v0);
  }
}

void __66__AVOutputContextManager_outputContextManagerForAllOutputContexts__block_invoke_2()
{
  v0 = +[AVFigEndpointUIAgentOutputContextManagerImpl copySharedEndpointUIAgent];
  v1 = [[AVFigEndpointUIAgentOutputContextManagerImpl alloc] initWithEndpointUIAgent:v0];
  [(id)outputContextManagerForAllOutputContexts_sSharedManager outputContextManagerImplDidExpireWithReplacementImpl:v1];

  if (v0)
  {
    CFRelease(v0);
  }
}

- (AVOutputContextManager)initWithOutputContextManagerImpl:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVOutputContextManager;
  v4 = [(AVOutputContextManager *)&v8 init];
  if (v4
    && (v5 = objc_alloc_init(AVOutputContextManagerInternal), (v4->_ivars = v5) != 0)
    && (v4->_ivars->impl = (AVOutputContextManagerImpl *)a3) != 0)
  {
    v4->_ivars->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputcontextmanager.ivars");
    [(AVOutputContextManagerImpl *)v4->_ivars->impl setParentOutputContextManager:v4];
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
  v5.super_class = (Class)AVOutputContextManager;
  [(AVOutputContextManager *)&v5 dealloc];
}

- (void)outputContextManagerImpl:(id)a3 observedFailureToConnectToOutputDevice:(id)a4 reason:(id)a5 didFailToConnectToOutputDeviceDictionary:(id)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  v11 = v10;
  if (a5) {
    [v10 setObject:a5 forKeyedSubscript:@"AVOutputContextManagerFailureReasonKey"];
  }
  if (a4) {
    [v11 setObject:a4 forKeyedSubscript:@"AVOutputContextManagerOutputDeviceKey"];
  }
  if (a6) {
    [v11 setObject:a6 forKeyedSubscript:@"AVOutputContextManagerDidFailToConnectToOutputDeviceUserInfoKey"];
  }
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v13, v14), "postNotificationName:object:userInfo:", @"AVOutputContextManagerOutputContextDidFailToConnectToOutputDeviceNotification", self, v11);
}

- (void)outputContextManagerImplDidExpireWithReplacementImpl:(id)a3
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__24;
  v11 = __Block_byref_object_dispose__24;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVOutputContextManager_outputContextManagerImplDidExpireWithReplacementImpl___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(id)v8[5] setParentOutputContextManager:0];
  [a3 setParentOutputContextManager:self];

  _Block_object_dispose(&v7, 8);
}

id __79__AVOutputContextManager_outputContextManagerImplDidExpireWithReplacementImpl___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 16));

  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16) = result;
  return result;
}

@end
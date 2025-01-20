@interface AVCaptureDeferredPhotoProcessor
+ (id)sharedPhotoProcessor;
+ (void)initialize;
- (AVCaptureDeferredPhotoProcessor)initWithApplicationIDOverride:(id)a3;
- (BOOL)_getValueForBooleanProperty:(__CFString *)a3;
- (BOOL)cancelProcessingForPhotoProxy:(id)a3 error:(id *)a4;
- (BOOL)isPaused;
- (BOOL)lastJobReusedGraph;
- (NSArray)persistentlyStoredDeferredPhotoProxies;
- (id)_processingRequestForCaptureRequestIdentifier:(id)a3;
- (id)prettyPrintDescriptionForContainer:(id)a3;
- (int)_establishServerConnection;
- (int)_executeBlockOnProcessorQueueSync:(id)a3;
- (void)_dispatchFailureCallbacks:(unsigned int)a3 forProcessingRequest:(id)a4 error:(id)a5;
- (void)_handleDidFinishProcessingPhotoProxyNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleNotification:(__CFString *)a3 payload:(id)a4;
- (void)_handleServerConnectionDiedAndRequestsWillBeReenqueued;
- (void)_handleServerConnectionDiedSendingClientNotification:(BOOL)a3;
- (void)_handleWillAbortProcessingDueToPriorityInversion;
- (void)_handleWillBeginProcessingPhotoProxyNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5 delegateQueue:(id)a6;
- (void)_reenqueueRequestsAfterPriorityInversion;
- (void)_resetFigCaptureDeferredPhotoProcessor;
- (void)_setFigCaptureDeferredPhotoProcessor:(OpaqueFigCaptureDeferredPhotoProcessor *)a3;
- (void)cancelAllPrewarming;
- (void)dealloc;
- (void)deletePersistentStorageForPhotoProxy:(id)a3;
- (void)prewarmWithSettings:(id)a3;
- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5;
- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5 delegateQueue:(id)a6;
- (void)setPaused:(BOOL)a3;
@end

@implementation AVCaptureDeferredPhotoProcessor

- (void)prewarmWithSettings:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (FigCaptureDeferredPhotoProcessorIsAllowedToPrewarm())
  {
    uint64_t v5 = [a3 captureSettings];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = [a3 serializedProcessingSettings];
      if (v7)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __55__AVCaptureDeferredPhotoProcessor_prewarmWithSettings___block_invoke;
        v9[3] = &unk_1E5A797A0;
        v9[4] = self;
        v9[5] = v6;
        v9[6] = v7;
        [(AVCaptureDeferredPhotoProcessor *)self _executeBlockOnProcessorQueueSync:v9];
      }
    }
  }
  else if (dword_1EB4C9180)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)_executeBlockOnProcessorQueueSync:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  processorQueue = self->_processorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AVCaptureDeferredPhotoProcessor__executeBlockOnProcessorQueueSync___block_invoke;
  block[3] = &unk_1E5A79890;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(processorQueue, block);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_handleNotification:(__CFString *)a3 payload:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234330](self->_requestsLock, a2);
  BOOL requestsWillBeReenqueued = self->_requestsWillBeReenqueued;
  MEMORY[0x1A6234340](self->_requestsLock);
  if (!FigCFEqual())
  {
    if (FigCFEqual())
    {
      processorQueue = self->_processorQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__AVCaptureDeferredPhotoProcessor__handleNotification_payload___block_invoke;
      block[3] = &unk_1E5A74028;
      BOOL v27 = requestsWillBeReenqueued;
      block[4] = self;
      dispatch_sync(processorQueue, block);
    }
    else
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F512B0]];
      if (v8)
      {
        uint64_t v9 = v8;
        id v10 = [(AVCaptureDeferredPhotoProcessor *)self _processingRequestForCaptureRequestIdentifier:v8];
        if (v10)
        {
          v11 = v10;
          if (FigCFEqual())
          {
            v20 = self;
            v12 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51310]];
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id obj = v12;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v28 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v23;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v23 != v15) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
                  v18 = [AVCaptureDeferredPhotoProxy alloc];
                  v19 = -[AVCaptureDeferredPhotoProxy initWithDeferredPhotoIdentifier:](v18, "initWithDeferredPhotoIdentifier:", [NSString stringWithFormat:@"%@/%@", v9, v17]);
                  [v11 addProxy:v19];
                }
                uint64_t v14 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
              }
              while (v14);
            }
            [(AVCaptureDeferredPhotoProcessor *)v20 _handleWillBeginProcessingPhotoProxyNotificationWithPayload:a4 forRequest:v11];
          }
          else if (FigCFEqual())
          {
            if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F512C8]), "intValue") == -16823)
            {
              if (!requestsWillBeReenqueued)
              {
                [(AVCaptureDeferredPhotoProcessor *)self _handleWillAbortProcessingDueToPriorityInversion];
              }
            }
            else
            {
              [(AVCaptureDeferredPhotoProcessor *)self _handleDidFinishProcessingPhotoProxyNotificationWithPayload:a4 forRequest:v11];
            }
          }
        }
      }
    }
  }
}

uint64_t __63__AVCaptureDeferredPhotoProcessor__handleNotification_payload___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 _handleServerConnectionDiedAndRequestsWillBeReenqueued];
  }
  else {
    return [v2 _handleServerConnectionDiedSendingClientNotification:1];
  }
}

uint64_t __69__AVCaptureDeferredPhotoProcessor__executeBlockOnProcessorQueueSync___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _establishServerConnection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

uint64_t __55__AVCaptureDeferredPhotoProcessor_prewarmWithSettings___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  uint64_t v2 = *(void *)(a1[4] + 24);
  uint64_t v3 = a1[6];
  if (v2 && (uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6) {
    return 4294954514;
  }

  return v6(v2, v1, v3);
}

- (void)_handleServerConnectionDiedSendingClientNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processorQueue);
  MEMORY[0x1A6234330](self->_requestsLock);
  uint64_t v5 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_requests];
  [(NSMutableArray *)self->_requests removeAllObjects];
  MEMORY[0x1A6234340](self->_requestsLock);
  uint64_t v6 = AVLocalizedErrorWithUnderlyingOSStatus();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        [(AVCaptureDeferredPhotoProcessor *)self _dispatchFailureCallbacks:3 forProcessingRequest:*(void *)(*((void *)&v13 + 1) + 8 * v10++) error:v6];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }
  [(AVCaptureDeferredPhotoProcessor *)self _resetFigCaptureDeferredPhotoProcessor];
  if (v3)
  {
    uint64_t v11 = AVLocalizedError();
    v12 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = @"AVCaptureDeferredPhotoProcessorCriticalErrorKey";
    uint64_t v18 = v11;
    objc_msgSend(v12, "postNotificationName:object:userInfo:", @"AVCaptureDeferredPhotoProcessorCriticalErrorNotification", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  }
}

- (void)_resetFigCaptureDeferredPhotoProcessor
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processorQueue);

  [(AVCaptureDeferredPhotoProcessor *)self _setFigCaptureDeferredPhotoProcessor:0];
}

- (int)_establishServerConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processorQueue);
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  uint64_t v10 = *MEMORY[0x1E4F1CFC8];
  processor = self->_processor;
  if (processor)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(OpaqueFigCaptureDeferredPhotoProcessor *, void, void, uint64_t *))(v6 + 48);
    if (v7)
    {
      v7(processor, *MEMORY[0x1E4F51390], *MEMORY[0x1E4F1CF80], &v10);
      uint64_t v3 = v10;
    }
    if (v3 != *MEMORY[0x1E4F1CFD0]) {
      return 0;
    }
  }
  else if (v3 != *MEMORY[0x1E4F1CFD0])
  {
    goto LABEL_12;
  }
  [(AVCaptureDeferredPhotoProcessor *)self _handleServerConnectionDiedSendingClientNotification:0];
LABEL_12:
  int v8 = FigCaptureDeferredPhotoProcessorRemoteCopyPhotoProcessor();
  if (!v8) {
    [(AVCaptureDeferredPhotoProcessor *)self _setFigCaptureDeferredPhotoProcessor:0];
  }
  return v8;
}

- (void)_setFigCaptureDeferredPhotoProcessor:(OpaqueFigCaptureDeferredPhotoProcessor *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processorQueue);
  processor = self->_processor;
  if (processor != a3)
  {
    if (processor)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avcdpp_NotificationCallback, 0, self->_processor);
      uint64_t v6 = self->_processor;
      if (v6)
      {
        CFRelease(v6);
        self->_processor = 0;
      }
    }
    if (a3)
    {
      self->_processor = (OpaqueFigCaptureDeferredPhotoProcessor *)CFRetain(a3);
      uint64_t v7 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      weakReference = self->_weakReference;
      [v7 addListenerWithWeakReference:weakReference callback:avcdpp_NotificationCallback name:0 object:a3 flags:0];
    }
  }
}

+ (id)sharedPhotoProcessor
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor))
  {
    if (sharedPhotoProcessor_sInstanceOnceToken != -1) {
      dispatch_once(&sharedPhotoProcessor_sInstanceOnceToken, &__block_literal_global_18);
    }
    return (id)sInstance;
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
    return 0;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

AVCaptureDeferredPhotoProcessor *__55__AVCaptureDeferredPhotoProcessor_sharedPhotoProcessor__block_invoke()
{
  uint64_t result = [[AVCaptureDeferredPhotoProcessor alloc] initWithApplicationIDOverride:0];
  sInstance = (uint64_t)result;
  return result;
}

- (AVCaptureDeferredPhotoProcessor)initWithApplicationIDOverride:(id)a3
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor))
  {
    v10.receiver = self;
    v10.super_class = (Class)AVCaptureDeferredPhotoProcessor;
    uint64_t v4 = [(AVCaptureDeferredPhotoProcessor *)&v10 init];
    if (v4)
    {
      v4->_weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v4];
      uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_processorQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.deferredphotoprocessor.queue", v5);
      v4->_requests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v4->_requestsLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_processPhotoProxyQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.deferredphotoprocessor.processphoto.queue", v6);
      uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_reenqueuePhotoProxyQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.deferredphotoprocessor.reenqueueproxyphoto.queue", v7);
    }
  }
  else
  {
    int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  processorQueue = self->_processorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVCaptureDeferredPhotoProcessor_dealloc__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = self;
  dispatch_sync(processorQueue, block);

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDeferredPhotoProcessor;
  [(AVCaptureDeferredPhotoProcessor *)&v4 dealloc];
}

uint64_t __42__AVCaptureDeferredPhotoProcessor_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetFigCaptureDeferredPhotoProcessor];
}

- (NSArray)persistentlyStoredDeferredPhotoProxies
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3052000000;
  v44 = __Block_byref_object_copy__6;
  v45 = __Block_byref_object_dispose__6;
  uint64_t v46 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __73__AVCaptureDeferredPhotoProcessor_persistentlyStoredDeferredPhotoProxies__block_invoke;
  v40[3] = &unk_1E5A79700;
  v40[4] = self;
  v40[5] = &v41;
  if ([(AVCaptureDeferredPhotoProcessor *)self _executeBlockOnProcessorQueueSync:v40])
  {
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v42[5], "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = (id)v42[5];
    uint64_t v2 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v2)
    {
      uint64_t v24 = *(void *)v37;
      uint64_t v23 = *MEMORY[0x1E4F51398];
      uint64_t v22 = *MEMORY[0x1E4F513A0];
      uint64_t v21 = *MEMORY[0x1E4F513B0];
      uint64_t v28 = *MEMORY[0x1E4F513B8];
      uint64_t v27 = *MEMORY[0x1E4F513A8];
      uint64_t v3 = *MEMORY[0x1E4F513C0];
      do
      {
        uint64_t v4 = 0;
        uint64_t v25 = v2;
        do
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void **)(*((void *)&v36 + 1) + 8 * v4);
          uint64_t v6 = [v5 objectForKeyedSubscript:v23];
          uint64_t v7 = [v5 objectForKeyedSubscript:v22];
          int v8 = (void *)[v5 objectForKeyedSubscript:v21];
          uint64_t v26 = v4;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v47 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v33 != v10) {
                  objc_enumerationMutation(v8);
                }
                v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                memset(&v31, 0, sizeof(v31));
                CMTimeMakeFromDictionary(&v31, (CFDictionaryRef)[v12 objectForKeyedSubscript:v28]);
                uint64_t v13 = [v12 objectForKeyedSubscript:v27];
                long long v14 = (void *)[v12 objectForKeyedSubscript:v3];
                long long v15 = [AVCaptureDeferredPhotoProxy alloc];
                uint64_t v16 = [v14 unsignedIntValue];
                CMTime v30 = v31;
                uint64_t v17 = [(AVCaptureDeferredPhotoProxy *)v15 initWithApplicationIdentifier:v6 captureRequestIdentifier:v7 photoIdentifier:v13 timestamp:&v30 expectedPhotoProcessingFlags:v16];
                [(NSArray *)v29 addObject:v17];
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v47 count:16];
            }
            while (v9);
          }
          uint64_t v4 = v26 + 1;
        }
        while (v26 + 1 != v25);
        uint64_t v2 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v2);
    }

    v42[5] = 0;
  }
  if (v29) {
    uint64_t v18 = v29;
  }
  else {
    uint64_t v18 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v41, 8);
  return v18;
}

uint64_t __73__AVCaptureDeferredPhotoProcessor_persistentlyStoredDeferredPhotoProxies__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v2 && (uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (v5) {
    uint64_t v6 = v5(v2);
  }
  else {
    uint64_t v6 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v6;
  return 0;
}

- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5
{
  processPhotoProxyQueue = self->_processPhotoProxyQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__AVCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate___block_invoke;
  v6[3] = &unk_1E5A79728;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_sync(processPhotoProxyQueue, v6);
}

uint64_t __76__AVCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPhotoProxy:*(void *)(a1 + 40) queuePosition:*(void *)(a1 + 48) delegate:*(void *)(a1 + 56) delegateQueue:MEMORY[0x1E4F14428]];
}

- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  processPhotoProxyQueue = self->_processPhotoProxyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__AVCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke;
  block[3] = &unk_1E5A79750;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_sync(processPhotoProxyQueue, block);
}

uint64_t __90__AVCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPhotoProxy:*(void *)(a1 + 40) queuePosition:*(void *)(a1 + 48) delegate:*(void *)(a1 + 56) delegateQueue:*(void *)(a1 + 64)];
}

- (void)_processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    MEMORY[0x1A6234330](self->_requestsLock, a2);
    requests = self->_requests;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __91__AVCaptureDeferredPhotoProcessor__processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke;
    v30[3] = &unk_1E5A79778;
    v30[4] = a3;
    v30[5] = &v31;
    [(NSMutableArray *)requests enumerateObjectsUsingBlock:v30];
    if (v32[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = [[AVCaptureDeferredPhotoProcessingRequest alloc] initWithPhotoProxy:a3 delegate:a5 delegateQueue:a6 qosClass:qos_class_self()];
    }
    else
    {
      v12 = (AVCaptureDeferredPhotoProcessingRequest *)(id)-[NSMutableArray objectAtIndexedSubscript:](self->_requests, "objectAtIndexedSubscript:");
      [(NSMutableArray *)self->_requests removeObjectAtIndex:v32[3]];
      [(AVCaptureDeferredPhotoProcessingRequest *)v12 addDelegate:a5];
      qos_class_t v14 = [(AVCaptureDeferredPhotoProcessingRequest *)v12 qosClass];
      if (v14 < qos_class_self()) {
        [(AVCaptureDeferredPhotoProcessingRequest *)v12 setQosClass:qos_class_self()];
      }
    }
    int v15 = [a4 isEqualToString:@"Head"];
    uint64_t v16 = self->_requests;
    if (v15) {
      [(NSMutableArray *)v16 insertObject:v12 atIndex:0];
    }
    else {
      [(NSMutableArray *)v16 addObject:v12];
    }
    BOOL requestsWillBeReenqueued = self->_requestsWillBeReenqueued;
    MEMORY[0x1A6234340](self->_requestsLock);
    if (dword_1EB4C9180)
    {
      unsigned int v29 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (requestsWillBeReenqueued) {
      goto LABEL_30;
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __91__AVCaptureDeferredPhotoProcessor__processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke_120;
    v27[3] = &unk_1E5A797A0;
    v27[4] = self;
    v27[5] = a3;
    v27[6] = a4;
    int v19 = [(AVCaptureDeferredPhotoProcessor *)self _executeBlockOnProcessorQueueSync:v27];
    int v20 = v19;
    if (v19 <= -16157)
    {
      if (v19 != -16823)
      {
        int v21 = -16822;
LABEL_20:
        if (v19 != v21)
        {
LABEL_29:
          [(AVCaptureDeferredPhotoProcessor *)self _dispatchFailureCallbacks:3 forProcessingRequest:v12 error:AVLocalizedErrorWithUnderlyingOSStatus()];
          goto LABEL_30;
        }
LABEL_21:
        if (dword_1EB4C9180)
        {
          unsigned int v29 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v23 = v29;
          if (os_log_type_enabled(v22, type)) {
            unsigned int v24 = v23;
          }
          else {
            unsigned int v24 = v23 & 0xFFFFFFFE;
          }
          if (v24)
          {
            uint64_t v25 = avcdpp_failureReasonStringForErrorStatus(v20);
            uint64_t v26 = [NSString stringWithFormat:@" (reason: %@)", @"potentially recoverable error"];
            int v35 = 136316162;
            long long v36 = "-[AVCaptureDeferredPhotoProcessor _processPhotoProxy:queuePosition:delegate:delegateQueue:]";
            __int16 v37 = 1024;
            int v38 = v20;
            __int16 v39 = 2114;
            v40 = v25;
            __int16 v41 = 1024;
            int v42 = -16825;
            __int16 v43 = 2114;
            uint64_t v44 = v26;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        goto LABEL_29;
      }
      [(AVCaptureDeferredPhotoProcessor *)self _handleWillAbortProcessingDueToPriorityInversion];
    }
    else
    {
      if ((v19 + 16156) < 2) {
        goto LABEL_21;
      }
      if (v19)
      {
        int v21 = -12785;
        goto LABEL_20;
      }
    }
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v13);
  }
  NSLog(&cfstr_SuppressingExc.isa, v13);
LABEL_31:
  _Block_object_dispose(&v31, 8);
}

uint64_t __91__AVCaptureDeferredPhotoProcessor__processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = objc_msgSend(a2, "photoProxies", 0);
  uint64_t result = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "captureRequestIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "captureRequestIdentifier")))
        {
          if (objc_msgSend((id)objc_msgSend(v12, "persistentStorageUUID"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "persistentStorageUUID")))
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
            *a4 = 1;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t result = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v9 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __91__AVCaptureDeferredPhotoProcessor__processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke_120(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) captureRequestIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) persistentStorageUUID];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v2 && (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v7 + 24);
  if (!v8) {
    return 4294954514;
  }

  return v8(v2, v3, v4, v5, 0);
}

- (BOOL)cancelProcessingForPhotoProxy:(id)a3 error:(id *)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__AVCaptureDeferredPhotoProcessor_cancelProcessingForPhotoProxy_error___block_invoke;
  v8[3] = &unk_1E5A797C8;
  v8[4] = self;
  v8[5] = a3;
  int v5 = [(AVCaptureDeferredPhotoProcessor *)self _executeBlockOnProcessorQueueSync:v8];
  int v6 = v5;
  if (a4 && v5) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
  }
  return v6 == 0;
}

uint64_t __71__AVCaptureDeferredPhotoProcessor_cancelProcessingForPhotoProxy_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) captureRequestIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) persistentStorageUUID];
  if (v2 && (uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  if (!v7) {
    return 4294954514;
  }

  return v7(v2, v3, v4);
}

- (void)deletePersistentStorageForPhotoProxy:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9180)
  {
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AVCaptureDeferredPhotoProcessor_deletePersistentStorageForPhotoProxy___block_invoke;
  v8[3] = &unk_1E5A797C8;
  v8[4] = self;
  v8[5] = a3;
  -[AVCaptureDeferredPhotoProcessor _executeBlockOnProcessorQueueSync:](self, "_executeBlockOnProcessorQueueSync:", v8, v6, v7);
}

uint64_t __72__AVCaptureDeferredPhotoProcessor_deletePersistentStorageForPhotoProxy___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) captureRequestIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) persistentStorageUUID];
  if (v2 && (uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 64);
  if (!v7) {
    return 4294954514;
  }

  return v7(v2, v3, v4);
}

- (id)prettyPrintDescriptionForContainer:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  int v10 = __Block_byref_object_dispose__6;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__AVCaptureDeferredPhotoProcessor_prettyPrintDescriptionForContainer___block_invoke;
  v5[3] = &unk_1E5A797F0;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  [(AVCaptureDeferredPhotoProcessor *)self _executeBlockOnProcessorQueueSync:v5];
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __70__AVCaptureDeferredPhotoProcessor_prettyPrintDescriptionForContainer___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(a1[4] + 24);
  if (v3 && (uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 72);
  if (v6) {
    uint64_t v7 = v6(v3, v2);
  }
  else {
    uint64_t v7 = 0;
  }
  *(void *)(*(void *)(a1[6] + 8) + 40) = v7;
  return 0;
}

- (void)cancelAllPrewarming
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (FigCaptureDeferredPhotoProcessorIsAllowedToPrewarm())
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__AVCaptureDeferredPhotoProcessor_cancelAllPrewarming__block_invoke;
    v4[3] = &unk_1E5A79818;
    v4[4] = self;
    [(AVCaptureDeferredPhotoProcessor *)self _executeBlockOnProcessorQueueSync:v4];
  }
  else if (dword_1EB4C9180)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __54__AVCaptureDeferredPhotoProcessor_cancelAllPrewarming__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v1 && (uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v3 + 56);
  if (!v4) {
    return 4294954514;
  }

  return v4(v1);
}

- (void)setPaused:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__AVCaptureDeferredPhotoProcessor_setPaused___block_invoke;
  v3[3] = &unk_1E5A79840;
  v3[4] = self;
  BOOL v4 = a3;
  [(AVCaptureDeferredPhotoProcessor *)self _executeBlockOnProcessorQueueSync:v3];
}

uint64_t __45__AVCaptureDeferredPhotoProcessor_setPaused___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 56);
  if (!v5) {
    return 4294954514;
  }
  uint64_t v6 = *MEMORY[0x1E4F51388];

  return v5(v1, v6, v2);
}

- (BOOL)_getValueForBooleanProperty:(__CFString *)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVCaptureDeferredPhotoProcessor__getValueForBooleanProperty___block_invoke;
  v5[3] = &unk_1E5A79868;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(AVCaptureDeferredPhotoProcessor *)self _executeBlockOnProcessorQueueSync:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVCaptureDeferredPhotoProcessor__getValueForBooleanProperty___block_invoke(void *a1)
{
  uint64_t v2 = (const void *)*MEMORY[0x1E4F1CFC8];
  char v9 = (const void *)*MEMORY[0x1E4F1CFC8];
  uint64_t v3 = *(void *)(a1[4] + 24);
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, void, const void **))(v6 + 48);
  if (v7)
  {
    v7(v3, v4, *MEMORY[0x1E4F1CF80], &v9);
    uint64_t v2 = v9;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v2 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v2) {
    CFRelease(v2);
  }
  return 0;
}

- (BOOL)isPaused
{
  return [(AVCaptureDeferredPhotoProcessor *)self _getValueForBooleanProperty:*MEMORY[0x1E4F51388]];
}

- (BOOL)lastJobReusedGraph
{
  return [(AVCaptureDeferredPhotoProcessor *)self _getValueForBooleanProperty:*MEMORY[0x1E4F51380]];
}

- (id)_processingRequestForCaptureRequestIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234330](self->_requestsLock, a2);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  requests = self->_requests;
  uint64_t v6 = [(NSMutableArray *)requests countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(requests);
        }
        int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "photoProxies"), "firstObject"), "captureRequestIdentifier"), "isEqualToString:", a3))
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)requests countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:
  MEMORY[0x1A6234340](self->_requestsLock);
  return v11;
}

- (void)_handleWillBeginProcessingPhotoProxyNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234330](self->_requestsLock, a2, a3);
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 1);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)[a4 delegatesStorage];
  uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v25 != v13)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v15 = v5;
        uint64_t v7 = *(void **)(*((void *)&v24 + 1) + 8 * v5);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v8 = (void *)[a4 photoProxies];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v8);
              }
              v22[0] = 0;
              v22[1] = v22;
              v22[2] = 0x3052000000;
              v22[3] = __Block_byref_object_copy__6;
              v22[4] = __Block_byref_object_dispose__6;
              uint64_t v23 = 0;
              uint64_t v23 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              v17[0] = MEMORY[0x1E4F143A8];
              v17[1] = 3221225472;
              v17[2] = __106__AVCaptureDeferredPhotoProcessor__handleWillBeginProcessingPhotoProxyNotificationWithPayload_forRequest___block_invoke;
              v17[3] = &unk_1E5A798B8;
              v17[4] = a4;
              v17[5] = self;
              v17[6] = v22;
              [v7 invokeDelegateCallbackWithBlock:v17];
              _Block_object_dispose(v22, 8);
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
          }
          while (v9);
        }
        uint64_t v5 = v15 + 1;
      }
      while (v15 + 1 != v14);
      uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v14);
  }
  MEMORY[0x1A6234340](self->_requestsLock);
}

uint64_t __106__AVCaptureDeferredPhotoProcessor__handleWillBeginProcessingPhotoProxyNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if ((objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "deferredPhotoIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "originalDeferredPhotoIdentifier")) & 1) == 0)*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = -[AVCaptureDeferredPhotoProxy initWithDeferredPhotoIdentifier:]([AVCaptureDeferredPhotoProxy alloc], "initWithDeferredPhotoIdentifier:", objc_msgSend(*(id *)(a1 + 32), "originalDeferredPhotoIdentifier")); {
    uint64_t v5 = *(void *)(a1 + 40);
    }
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    return [a2 processor:v5 willBeginProcessingPhotoProxy:v6];
  }
  return result;
}

- (void)_handleDidFinishProcessingPhotoProxyNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  int v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F512C8]), "intValue");
  if (v6) {
    uint64_t v48 = AVLocalizedErrorWithUnderlyingOSStatus();
  }
  else {
    uint64_t v48 = 0;
  }
  CFTypeRef cf = (CFTypeRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51340]];
  uint64_t v47 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51348]), "unsignedIntegerValue");
  uint64_t v46 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F512F0]];
  CMTime v71 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  CFDictionaryRef v7 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51328]];
  if (v7) {
    CMTimeMakeFromDictionary(&v71, v7);
  }
  BOOL v8 = v6 == 0;
  int v45 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F512F8]), "unsignedLongValue");
  int v44 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51300]), "intValue");
  CFTypeRef v50 = (CFTypeRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51360]];
  uint64_t v9 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F512B0]];
  uint64_t v10 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51308]];
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3052000000;
  v68 = __Block_byref_object_copy__6;
  v69 = __Block_byref_object_dispose__6;
  uint64_t v70 = 0;
  id v34 = a4;
  if (v8)
  {
    uint64_t v12 = v10;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v13 = (void *)[a4 photoProxies];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v62;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v62 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          long long v18 = (void *)[v17 deferredPhotoIdentifier];
          if ([v18 isEqualToString:objc_msgSend(NSString, "stringWithFormat:", @"%@/%@", v9, v12)])
          {
            id v11 = v17;
            goto LABEL_18;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v11 = (id)objc_msgSend((id)objc_msgSend(a4, "photoProxies"), "firstObject");
LABEL_18:
    v66[5] = (uint64_t)v11;
  }
  long long v19 = (void *)[v34 photoProxies];
  [v19 removeObject:v66[5]];
  objc_msgSend(v34, "setFiredPhotoCallbacksCount:", objc_msgSend(v34, "firedPhotoCallbacksCount") + 1);
  id v20 = v34;
  int v43 = [(id)v66[5] expectedPhotoProcessingFlags];
  MEMORY[0x1A6234330](self->_requestsLock);
  int v21 = [v34 firedPhotoCallbacksCount];
  if (v21 == [v34 expectedPhotoCount])
  {
    [(NSMutableArray *)self->_requests removeObject:v34];
    objc_msgSend(v34, "setFiredCallbackFlags:", objc_msgSend(v34, "firedCallbackFlags") | 2);
  }
  if ((objc_msgSend((id)objc_msgSend((id)v66[5], "deferredPhotoIdentifier"), "isEqualToString:", objc_msgSend(v34, "originalDeferredPhotoIdentifier")) & 1) == 0)
  {

    uint64_t v22 = -[AVCaptureDeferredPhotoProxy initWithDeferredPhotoIdentifier:]([AVCaptureDeferredPhotoProxy alloc], "initWithDeferredPhotoIdentifier:", [v34 originalDeferredPhotoIdentifier]);
    v66[5] = (uint64_t)v22;
  }
  uint64_t v23 = (const void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F512B8]];
  uint64_t v42 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F512C0]];
  long long v24 = (const void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51320]];
  uint64_t v41 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51318]];
  long long v25 = (const void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F512E8]];
  uint64_t v40 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F512E0]];
  long long v26 = (const void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51338]];
  uint64_t v39 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51330]];
  long long v27 = (const void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51358]];
  uint64_t v38 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51350]];
  uint64_t v28 = (const void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F512D8]];
  uint64_t v37 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F512D0]];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unsigned int v29 = (void *)[v34 delegatesStorage];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v57 objects:v72 count:16];
  if (v30)
  {
    uint64_t v36 = *(void *)v58;
    id obj = v29;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v58 != v36) {
          objc_enumerationMutation(obj);
        }
        long long v32 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        if (cf) {
          CFRetain(cf);
        }
        if (v50) {
          CFRetain(v50);
        }
        if (v23) {
          CFRetain(v23);
        }
        if (v24) {
          CFRetain(v24);
        }
        if (v25) {
          CFRetain(v25);
        }
        if (v26) {
          CFRetain(v26);
        }
        if (v27) {
          CFRetain(v27);
        }
        if (v28) {
          CFRetain(v28);
        }
        id v33 = (id)v66[5];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __106__AVCaptureDeferredPhotoProcessor__handleDidFinishProcessingPhotoProxyNotificationWithPayload_forRequest___block_invoke;
        v52[3] = &unk_1E5A798E0;
        CMTime v53 = v71;
        v52[14] = cf;
        v52[15] = v47;
        int v54 = v44;
        int v55 = v45;
        v52[16] = v50;
        v52[17] = v23;
        v52[4] = v46;
        v52[5] = v42;
        v52[18] = v24;
        v52[19] = v25;
        v52[6] = v41;
        v52[7] = v40;
        v52[20] = v26;
        v52[21] = v27;
        v52[8] = v39;
        v52[9] = v38;
        v52[22] = v28;
        int v56 = v43;
        v52[10] = v37;
        v52[11] = v48;
        v52[13] = &v65;
        v52[12] = self;
        [v32 invokeDelegateCallbackWithBlock:v52];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v57 objects:v72 count:16];
    }
    while (v30);
  }
  MEMORY[0x1A6234340](self->_requestsLock);

  _Block_object_dispose(&v65, 8);
}

void __106__AVCaptureDeferredPhotoProcessor__handleDidFinishProcessingPhotoProxyNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 112))
  {
    uint64_t v4 = [AVCapturePhoto alloc];
    uint64_t v5 = *(void *)(a1 + 112);
    uint64_t v6 = *(void *)(a1 + 120);
    id v7 = +[AVCapturePhoto AVFileTypeFromFigCaptureStillImageSettingsFileType:*(unsigned int *)(a1 + 208) codec:*(unsigned int *)(a1 + 212) unresolvedSettings:0];
    uint64_t v8 = *(void *)(a1 + 128);
    uint64_t v9 = *(void *)(a1 + 136);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 144);
    uint64_t v13 = *(void *)(a1 + 152);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 160);
    uint64_t v17 = *(void *)(a1 + 168);
    uint64_t v19 = *(void *)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 72);
    uint64_t v20 = *(void *)(a1 + 176);
    uint64_t v21 = *(void *)(a1 + 80);
    int v22 = *(_DWORD *)(a1 + 216);
    long long v37 = *(_OWORD *)(a1 + 184);
    uint64_t v38 = *(void *)(a1 + 200);
    LODWORD(v36) = v22;
    uint64_t v23 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](v4, "initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:", &v37, v5, v6, v7, 0, v8, v10, v9, v11, v12, v14,
            v13,
            v15,
            v16,
            v19,
            v17,
            v18,
            v20,
            v21,
            0,
            0,
            0,
            0,
            1,
            1,
            v36,
            @"AVCaptureDeviceTypeBuiltInDualCamera");
  }
  else
  {
    uint64_t v23 = 0;
  }
  long long v24 = (void *)[*(id *)(a1 + 88) userInfo];
  [v24 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  if (dword_1EB4C9180)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "processor:didFinishProcessingPhotoProxy:finalPhoto:error:", *(void *)(a1 + 96), *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), v23, *(void *)(a1 + 88), v34, v35);

  long long v26 = *(const void **)(a1 + 112);
  if (v26) {
    CFRelease(v26);
  }
  long long v27 = *(const void **)(a1 + 128);
  if (v27) {
    CFRelease(v27);
  }
  uint64_t v28 = *(const void **)(a1 + 136);
  if (v28) {
    CFRelease(v28);
  }
  unsigned int v29 = *(const void **)(a1 + 144);
  if (v29) {
    CFRelease(v29);
  }
  uint64_t v30 = *(const void **)(a1 + 152);
  if (v30) {
    CFRelease(v30);
  }
  uint64_t v31 = *(const void **)(a1 + 160);
  if (v31) {
    CFRelease(v31);
  }
  long long v32 = *(const void **)(a1 + 168);
  if (v32) {
    CFRelease(v32);
  }
  id v33 = *(const void **)(a1 + 176);
  if (v33) {
    CFRelease(v33);
  }
}

- (void)_handleWillAbortProcessingDueToPriorityInversion
{
  MEMORY[0x1A6234330](self->_requestsLock, a2);
  if (!self->_requestsWillBeReenqueued) {
    self->_BOOL requestsWillBeReenqueued = 1;
  }

  JUMPOUT(0x1A6234340);
}

- (void)_handleServerConnectionDiedAndRequestsWillBeReenqueued
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processorQueue);
  [(AVCaptureDeferredPhotoProcessor *)self _resetFigCaptureDeferredPhotoProcessor];
  processPhotoProxyQueue = self->_processPhotoProxyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__AVCaptureDeferredPhotoProcessor__handleServerConnectionDiedAndRequestsWillBeReenqueued__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = self;
  dispatch_sync(processPhotoProxyQueue, block);
}

uint64_t __89__AVCaptureDeferredPhotoProcessor__handleServerConnectionDiedAndRequestsWillBeReenqueued__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reenqueueRequestsAfterPriorityInversion];
}

- (void)_reenqueueRequestsAfterPriorityInversion
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v14 = v2;
    LODWORD(v13) = 0;
    FigDebugAssert3();
  }
  MEMORY[0x1A6234330](self->_requestsLock);
  uint64_t v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_requests];
  [(NSMutableArray *)self->_requests removeAllObjects];
  self->_BOOL requestsWillBeReenqueued = 0;
  MEMORY[0x1A6234340](self->_requestsLock);
  uint64_t v5 = (void *)[v4 sortedArrayUsingComparator:&__block_literal_global_137];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        dispatch_qos_class_t v11 = objc_msgSend(v10, "qosClass", v13, v14);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __75__AVCaptureDeferredPhotoProcessor__reenqueueRequestsAfterPriorityInversion__block_invoke_2;
        block[3] = &unk_1E5A72D70;
        block[4] = v10;
        void block[5] = self;
        dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, block);
        dispatch_async((dispatch_queue_t)self->_reenqueuePhotoProxyQueue, v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

uint64_t __75__AVCaptureDeferredPhotoProcessor__reenqueueRequestsAfterPriorityInversion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = [a2 qosClass];
  if (v5 == [a3 qosClass]) {
    return 0;
  }
  unsigned int v7 = [a2 qosClass];
  if (v7 > [a3 qosClass]) {
    return -1;
  }
  else {
    return 1;
  }
}

uint64_t __75__AVCaptureDeferredPhotoProcessor__reenqueueRequestsAfterPriorityInversion__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9180)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "delegatesStorage", v8, v9, 0);
  uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(a1 + 40), "_processPhotoProxy:queuePosition:delegate:delegateQueue:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "photoProxies"), "firstObject"), @"Tail", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "delegate"), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "delegateQueue"));
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)_dispatchFailureCallbacks:(unsigned int)a3 forProcessingRequest:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v9 = [a4 firedCallbackFlags];
  if ((((v9 & 2) == 0) & (a3 >> 1)) != 0) {
    int v10 = a3 & ((v9 & 1) == 0) | 2;
  }
  else {
    int v10 = a3 & ((v9 & 1) == 0);
  }
  MEMORY[0x1A6234330](self->_requestsLock);
  objc_msgSend(a4, "setFiredCallbackFlags:", v10 | objc_msgSend(a4, "firedCallbackFlags"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)[a4 delegatesStorage];
  uint64_t v11 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __88__AVCaptureDeferredPhotoProcessor__dispatchFailureCallbacks_forProcessingRequest_error___block_invoke;
        v17[3] = &unk_1E5A79928;
        int v18 = v10;
        v17[4] = a4;
        v17[5] = self;
        v17[6] = a5;
        [v15 invokeDelegateCallbackWithBlock:v17];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  [(NSMutableArray *)self->_requests removeObject:a4];
  MEMORY[0x1A6234340](self->_requestsLock);
}

uint64_t __88__AVCaptureDeferredPhotoProcessor__dispatchFailureCallbacks_forProcessingRequest_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)[*(id *)(a1 + 32) photoProxies];
  uint64_t result = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  uint64_t v15 = result;
  if (result)
  {
    uint64_t v14 = *(void *)v19;
    uint64_t v12 = *MEMORY[0x1E4F28A50];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v4;
        uint64_t v5 = *(void *)(*((void *)&v18 + 1) + 8 * v4);
        if (*(unsigned char *)(a1 + 56) & 1) != 0 && (objc_opt_respondsToSelector()) {
          [a2 processor:*(void *)(a1 + 40) willBeginProcessingPhotoProxy:v5];
        }
        if ((*(unsigned char *)(a1 + 56) & 2) != 0)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "userInfo"), "objectForKeyedSubscript:", v12);
          int v6 = [*(id *)(a1 + 32) expectedPhotoCount];
          if (v6 > (int)[*(id *)(a1 + 32) firedPhotoCallbacksCount])
          {
            signed int v7 = 0;
            do
            {
              if (dword_1EB4C9180)
              {
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(a2, "processor:didFinishProcessingPhotoProxy:finalPhoto:error:", *(void *)(a1 + 40), v5, 0, *(void *)(a1 + 48), v10, v11);
              ++v7;
              int v9 = [*(id *)(a1 + 32) expectedPhotoCount];
            }
            while (v7 < (int)(v9 - [*(id *)(a1 + 32) firedPhotoCallbacksCount]));
          }
        }
        uint64_t v4 = v16 + 1;
      }
      while (v16 + 1 != v15);
      uint64_t result = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v15 = result;
    }
    while (result);
  }
  return result;
}

@end
@interface AFSiriTaskExecution
- (AFSiriTaskExecution)init;
- (AFSiriTaskExecution)initWithRequest:(id)a3 taskDeliverer:(id)a4 usageResultListener:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_completeWithError:(id)a3;
- (void)_completeWithResponse:(id)a3;
- (void)_completeWithResponse:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5;
- (void)handleSiriResponse:(id)a3 atTime:(unint64_t)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDeliveryHandler:(id)a3;
- (void)start;
@end

@implementation AFSiriTaskExecution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskResponseListener, 0);
  objc_storeStrong((id *)&self->_taskResponseWatchdogTimer, 0);
  objc_storeStrong(&self->_keepAliveCycle, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_deliveryHandler, 0);
  objc_storeStrong((id *)&self->_usageResultListener, 0);
  objc_storeStrong((id *)&self->_taskDeliverer, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_completeWithError:(id)a3
{
}

- (void)_completeWithResponse:(id)a3
{
}

- (void)_completeWithResponse:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[AFSiriTaskExecution _completeWithResponse:error:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AFSiriTaskExecution__completeWithResponse_error___block_invoke;
  block[3] = &unk_1E592C338;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __51__AFSiriTaskExecution__completeWithResponse_error___block_invoke(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1[4] + 16);
    int v20 = 136315394;
    uint64_t v21 = "-[AFSiriTaskExecution _completeWithResponse:error:]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s cancelling watchdog for %@", (uint8_t *)&v20, 0x16u);
  }
  [*(id *)(a1[4] + 72) cancel];
  uint64_t v4 = a1[4];
  v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  uint64_t v6 = a1[4];
  if (*(void *)(v6 + 56) == 3)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[5];
      v9 = (__CFString *)a1[6];
      if (!v9) {
        v9 = &stru_1EEE35D28;
      }
      int v20 = 136315906;
      uint64_t v21 = "-[AFSiriTaskExecution _completeWithResponse:error:]_block_invoke";
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@ is already completed; not completing again with response %@ %@",
        (uint8_t *)&v20,
        0x2Au);
    }
  }
  else
  {
    *(void *)(v6 + 56) = 3;
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1[4] + 24) siriTaskDidFinish];
    }
    uint64_t v10 = a1[4];
    uint64_t v11 = *(void *)(v10 + 48);
    if (v11)
    {
      (*(void (**)(uint64_t, void, void))(v11 + 16))(v11, a1[5], a1[6]);
      uint64_t v10 = a1[4];
      v12 = *(void **)(v10 + 48);
    }
    else
    {
      v12 = 0;
    }
    *(void *)(v10 + 48) = 0;
  }
  id v13 = AFSiriLogContextConnection;
  BOOL v14 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  uint64_t v15 = a1[4];
  if (v14)
  {
    int v20 = 136315394;
    uint64_t v21 = "-[AFSiriTaskExecution _completeWithResponse:error:]_block_invoke";
    __int16 v22 = 2048;
    uint64_t v23 = v15;
    _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s <AFSiriTaskExecution %p> releasing listener", (uint8_t *)&v20, 0x16u);
    uint64_t v15 = a1[4];
  }
  [*(id *)(v15 + 80) setDelegate:0];
  [*(id *)(a1[4] + 80) invalidate];
  uint64_t v16 = a1[4];
  __int16 v17 = *(void **)(v16 + 80);
  *(void *)(v16 + 80) = 0;

  uint64_t v18 = a1[4];
  __int16 v19 = *(void **)(v18 + 64);
  *(void *)(v18 + 64) = 0;
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AFSiriTaskExecution_setCompletionHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__AFSiriTaskExecution_setCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (void)setDeliveryHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AFSiriTaskExecution_setDeliveryHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __42__AFSiriTaskExecution_setDeliveryHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)start
{
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__AFSiriTaskExecution_start__block_invoke;
  v3[3] = &unk_1E592B398;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(queue, v3);
}

void __28__AFSiriTaskExecution_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56) != 1)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"AFSiriTaskExecution.m" lineNumber:136 description:@"Task executions can only be started once"];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 56) = 2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 40) || *(void *)(v3 + 48)) {
    objc_storeStrong((id *)(v3 + 64), (id)v3);
  }
  id v4 = [AFSiriTask alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 16);
  id v7 = [*(id *)(v5 + 80) endpoint];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 32) endpoint];
  id v9 = [(AFSiriTask *)v4 _initWithRequest:v6 remoteResponseListenerEndpoint:v7 usageResultListenerEndpoint:v8];

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 24);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __28__AFSiriTaskExecution_start__block_invoke_2;
  v14[3] = &unk_1E59253F0;
  v14[4] = v10;
  id v12 = v9;
  id v15 = v12;
  objc_copyWeak(&v16, &location);
  [v11 deliverSiriTask:v12 completionHandler:v14];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __28__AFSiriTaskExecution_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__AFSiriTaskExecution_start__block_invoke_3;
  v7[3] = &unk_1E59253C8;
  v7[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  dispatch_async(v5, v7);
  objc_destroyWeak(&v10);
}

void __28__AFSiriTaskExecution_start__block_invoke_3(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  uint64_t v5 = AFSiriLogContextConnection;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = v6[3];
      *(_DWORD *)buf = 136315906;
      __int16 v22 = "-[AFSiriTaskExecution start]_block_invoke_3";
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      uint64_t v28 = v7;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s Delivery of task %@ by %@ failed with error %{public}@", buf, 0x2Au);
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
    }
    [v6 _completeWithError:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = v6[3];
      *(_DWORD *)buf = 136315650;
      __int16 v22 = "-[AFSiriTaskExecution start]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Task %@ was delivered successfully by %@", buf, 0x20u);
      id v6 = *(void **)(a1 + 32);
    }
    if (v6[7] != 3)
    {
      double v10 = AFPreferencesSiriTaskResponseTimeout();
      uint64_t v11 = [AFWatchdogTimer alloc];
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __28__AFSiriTaskExecution_start__block_invoke_34;
      v18[3] = &unk_1E59296A8;
      objc_copyWeak(v20, (id *)(a1 + 56));
      id v19 = *(id *)(a1 + 48);
      v20[1] = *(id *)&v10;
      uint64_t v13 = [(AFWatchdogTimer *)v11 initWithTimeoutInterval:v12 onQueue:v18 timeoutHandler:v10];
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 72);
      *(void *)(v14 + 72) = v13;

      [*(id *)(*(void *)(a1 + 32) + 72) start];
      objc_destroyWeak(v20);
    }
  }
}

void __28__AFSiriTaskExecution_start__block_invoke_34(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = 136315650;
    double v10 = "-[AFSiriTaskExecution start]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2050;
    uint64_t v14 = v8;
    _os_log_fault_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_FAULT, "%s Handling of %@ timed out after %{public}.2f seconds", (uint8_t *)&v9, 0x20u);
    if (!WeakRetained) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (WeakRetained)
  {
LABEL_3:
    uint64_t v4 = +[AFAnalytics sharedAnalytics];
    uint64_t v5 = objc_msgSend(WeakRetained[2], "_af_analyticsContextDescription");
    [v4 logEventWithType:502 context:v5];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kAFAssistantErrorDomain" code:702 userInfo:0];
    [WeakRetained _completeWithError:v6];
  }
LABEL_4:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__AFSiriTaskExecution_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_1E592C710;
  id v10 = v5;
  __int16 v11 = self;
  id v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

uint64_t __58__AFSiriTaskExecution_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEA1DC0];
  [v2 setExportedInterface:v3];

  [*(id *)(a1 + 32) setExportedObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 resume];
}

- (void)handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__AFSiriTaskExecution_handleFailureOfRequest_error_atTime___block_invoke;
  v13[3] = &unk_1E5929398;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  unint64_t v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __59__AFSiriTaskExecution_handleFailureOfRequest_error_atTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[AFAnalytics sharedAnalytics];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_af_analyticsContextDescription");
  [v2 logEventWithType:506 machAbsoluteTime:v3 context:v4];

  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  return [v5 _completeWithError:v6];
}

- (void)handleSiriResponse:(id)a3 atTime:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AFSiriTaskExecution_handleSiriResponse_atTime___block_invoke;
  block[3] = &unk_1E592B3C0;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __49__AFSiriTaskExecution_handleSiriResponse_atTime___block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AFAnalytics sharedAnalytics];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "_af_analyticsContextDescription");
  [v2 logEventWithType:506 machAbsoluteTime:v3 context:v4];

  if ([*(id *)(a1 + 40) _isForRequest:*(void *)(*(void *)(a1 + 32) + 16)])
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 _completeWithResponse:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
    v12[0] = @"SiriRequest";
    v12[1] = @"SiriResponse";
    v13[0] = v9;
    v13[1] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    unint64_t v11 = [v7 errorWithDomain:@"kAFAssistantErrorDomain" code:704 userInfo:v10];

    [*(id *)(a1 + 32) _completeWithError:v11];
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "-[AFSiriTaskExecution dealloc]";
    __int16 v7 = 2048;
    uint64_t v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s <AFSiriTaskExecution %p>", buf, 0x16u);
  }
  [(NSXPCListener *)self->_taskResponseListener setDelegate:0];
  [(NSXPCListener *)self->_taskResponseListener invalidate];
  v4.receiver = self;
  v4.super_class = (Class)AFSiriTaskExecution;
  [(AFSiriTaskExecution *)&v4 dealloc];
}

- (AFSiriTaskExecution)init
{
  return 0;
}

- (AFSiriTaskExecution)initWithRequest:(id)a3 taskDeliverer:(id)a4 usageResultListener:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AFSiriTaskExecution;
  id v12 = [(AFSiriTaskExecution *)&v21 init];
  if (v12)
  {
    __int16 v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v23 = "-[AFSiriTaskExecution initWithRequest:taskDeliverer:usageResultListener:]";
      __int16 v24 = 2048;
      __int16 v25 = v12;
      _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s <AFSiriTaskExecution %p>", buf, 0x16u);
    }
    id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("Siri Task Execution", v14);

    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v12->_taskDeliverer, a4);
    objc_storeStrong((id *)&v12->_usageResultListener, a5);
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = &__block_literal_global_3248;

    v12->_state = 1;
    uint64_t v18 = [MEMORY[0x1E4F29290] anonymousListener];
    taskResponseListener = v12->_taskResponseListener;
    v12->_taskResponseListener = (NSXPCListener *)v18;

    [(NSXPCListener *)v12->_taskResponseListener setDelegate:v12];
    [(NSXPCListener *)v12->_taskResponseListener resume];
  }

  return v12;
}

@end
@interface NSCFLocalSessionTask
@end

@implementation NSCFLocalSessionTask

void __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke_2(uint64_t a1)
{
}

uint64_t __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && *(void *)(v2 + 912))
  {
    int v3 = *(_DWORD *)(v2 + 920);
    if (v3 < 0) {
      __assert_rtn("-[__NSCFLocalSessionTask _onqueue_suspendWorkQueue]", "LocalSessionTask.mm", 1314, "_connectionWorkQueueSuspensionCount >= 0");
    }
    *(_DWORD *)(v2 + 920) = v3 + 1;
    if (!v3) {
      [*(id *)(v2 + 912) setSuspended:1];
    }
  }
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke_2;
  v8[3] = &unk_1E52582A0;
  uint64_t v6 = a1[6];
  v8[4] = v4;
  v8[5] = v6;
  return objc_msgSend(v4, "_onqueue_didReceiveResponse:completion:", v5, v8);
}

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = v1[88];
    if (!v2) {
      uint64_t v2 = v1[87];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v2, v1, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

uint64_t __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke_2(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && *(void *)(v5 + 912))
  {
    int v6 = *(_DWORD *)(v5 + 920);
    if (v6 <= 0) {
      __assert_rtn("-[__NSCFLocalSessionTask _onqueue_resumeWorkQueue]", "LocalSessionTask.mm", 1325, "_connectionWorkQueueSuspensionCount > 0");
    }
    int v7 = v6 - 1;
    *(_DWORD *)(v5 + 920) = v7;
    if (!v7) {
      [*(id *)(v5 + 912) setSuspended:0];
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v11 = *((void *)a2 + 2);
  long long v10 = *a2;
  return (*(uint64_t (**)(uint64_t, long long *, uint64_t))(v8 + 16))(v8, &v10, a3);
}

void __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(NSObject **)(v2 + 792);
  if (v3)
  {
    *(void *)(v2 + 792) = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_3;
    v5[3] = &unk_1E5257FB0;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v4;
    objc_msgSend(v4, "_task_onqueue_didReceiveDispatchData:completionHandler:", v3, v5);
    dispatch_release(v3);
  }
  else
  {
    -[__NSCFLocalSessionTask _finishBecomeDownload:](v2, *(void **)(a1 + 40));
  }
}

void __44____NSCFLocalSessionTask_startResourceTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    [*(id *)(a1 + 32) _timeoutIntervalForResource];
    -[__NSCFLocalSessionTask _onqueue_startResourceTimer:](v1, v3);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }

  -[__NSCFLocalSessionTask _onqueue_startStartTimer](v4);
}

uint64_t __65____NSCFLocalSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) cfConn];
  uint64_t v3 = *(unsigned __int16 *)(a1 + 40);

  return [v2 setTLSMaximumSupportedProtocolVersion:v3];
}

uint64_t __65____NSCFLocalSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) cfConn];
  uint64_t v3 = *(unsigned __int16 *)(a1 + 40);

  return [v2 setTLSMinimumSupportedProtocolVersion:v3];
}

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!v3) {
    goto LABEL_12;
  }
  id Property = objc_getProperty(v3, a2, 784, 1);
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!Property)
  {
    if (v3)
    {
      if (v3[927]) {
        goto LABEL_14;
      }
      v3[927] = 1;
      uint64_t v3 = *(unsigned char **)(a1 + 32);
    }
LABEL_12:
    -[NSURLSession _onqueue_didCompleteTask:withError:]([v3 session], *(void **)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "error"));
    goto LABEL_14;
  }
  if (v3) {
    uint64_t v3 = objc_getProperty(v3, v4, 784, 1);
  }
  int v7 = _Block_copy(v3);
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_setProperty_atomic_copy(v8, v6, 0, 784);
    uint64_t v8 = *(void **)(a1 + 32);
  }
  uint64_t v11 = __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_2;
  v12 = &unk_1E5258028;
  v13 = v8;
  v14 = v7;
  if (objc_msgSend(v8, "_callCompletionHandlerInline", MEMORY[0x1E4F143A8], 3221225472)) {
    v11((uint64_t)&v10);
  }
  else {
    -[NSURLSession runDelegateBlock:]([*(id *)(a1 + 32) session], &v10);
  }
LABEL_14:
  v9 = -[__NSCFLocalSessionTask localSession](*(void **)(a1 + 32));
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)v9, *(void *)(a1 + 32));
}

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 776);
  *(void *)(v2 + 776) = 0;
  uint64_t v4 = 0;
  if (![*(id *)(a1 + 32) error])
  {
    uint64_t v4 = (uint64_t)v3;
    if (!v3) {
      uint64_t v4 = [MEMORY[0x1E4F1C9B8] data];
    }
  }
  +[__NSURLSessionStatistics reportMetricsToSymptoms:*(void *)(a1 + 32)];
  (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), v4, [*(id *)(a1 + 32) response], objc_msgSend(*(id *)(a1 + 32), "error"));
  if (v3) {
    dispatch_release(v3);
  }
  _Block_release(*(const void **)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);

  [(NSURLSessionTask *)v6 _resetTaskDelegate];
}

uint64_t __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:](v1, *(unsigned int *)(a1 + 40));

  return objc_msgSend(v1, "_onqueue_cancel_with_error:", v2);
}

uint64_t __88____NSCFLocalSessionTask__onqueue_setupNextEffectiveConfigurationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(void *)(a1 + 40) != a2) {
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_adoptEffectiveConfiguration:", +[NSURLSessionConfiguration immutableEffectiveConfigurationFromConfig:](NSURLSessionConfiguration, "immutableEffectiveConfigurationFromConfig:", a2));
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 cancel];
  }
}

void __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 864);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 40) + 864));
    *(void *)(*(void *)(a1 + 40) + 864) = 0;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void (***)(void, void))(v5 + 40);
  if (v6)
  {
    *(void *)(v5 + 40) = 0;
    v6[2](v6, a2);
    _Block_release(v6);
  }
}

void __57____NSCFLocalSessionTask_set_timeoutIntervalForResource___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    double v2 = *(double *)(a1 + 40);
    uint64_t v3 = v1[102];
    v1[102] = 0;
    if (v3)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v4 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        int v5 = 138543618;
        uint64_t v6 = [v1 _loggableDescription];
        __int16 v7 = 2048;
        double v8 = v2;
        _os_log_impl(&dword_184085000, v4, OS_LOG_TYPE_INFO, "%{public}@ timeout changed to %f, should restart timer", (uint8_t *)&v5, 0x16u);
      }
      dispatch_source_cancel(v3);
      dispatch_release(v3);
      -[__NSCFLocalSessionTask _onqueue_startResourceTimer:]((uint64_t)v1, v2);
    }
  }
}

uint64_t __72____NSCFLocalSessionTask_connection_didReceiveTCPConnection_extraBytes___block_invoke(uint64_t a1)
{
  double v2 = (void *)(*(void *)(a1 + 32) + 888);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  int v5 = (std::__shared_weak_count *)v2[1];
  *double v2 = v4;
  v2[1] = v3;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(a1 + 32) + 904) = result;
  return result;
}

id __78____NSCFLocalSessionTask_connection_didReceiveSocketInputStream_outputStream___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 872) = *(id *)(a1 + 40);
  id result = *(id *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 880) = result;
  return result;
}

uint64_t __60____NSCFLocalSessionTask_connection_alternatePathAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_alternatePathAvailable:", *(unsigned int *)(a1 + 40));
}

uint64_t __69____NSCFLocalSessionTask_connection__conditionalRequirementsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_conditionalRequirementsChanged:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __55____NSCFLocalSessionTask_connection_waitingWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_connectionWaitingWithReason:", *(void *)(a1 + 40));
}

uint64_t __89____NSCFLocalSessionTask_connection__willSendRequestForEstablishedConnection_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_willSendRequestForEstablishedConnection:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __76____NSCFLocalSessionTask_connection_sentBodyBytes_totalBytes_expectedBytes___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) longLongValue];
  uint64_t v4 = [*(id *)(a1 + 48) longLongValue];
  uint64_t v5 = [*(id *)(a1 + 56) longLongValue];

  return objc_msgSend(v2, "_onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:", v3, v4, v5);
}

uint64_t __63____NSCFLocalSessionTask_connection_didReceiveData_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_didReceiveDispatchData:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __61____NSCFLocalSessionTask_connection_challenged_authCallback___block_invoke(void *a1)
{
  double v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = [v2 currentRequest];
  uint64_t v5 = a1[6];

  return objc_msgSend(v2, "_onqueue_didReceiveChallenge:request:withCompletion:", v3, v4, v5);
}

uint64_t __83____NSCFLocalSessionTask_connection_request_needsNewBodyStreamFromOffset_callback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_needNewBodyStream:fromOffset:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

uint64_t __72____NSCFLocalSessionTask_connection_request_needsNewBodyStreamCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_needNewBodyStream:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __63____NSCFLocalSessionTask_connection_didFinishLoadingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_didFinishWithError:", *(void *)(a1 + 40));
}

uint64_t __54____NSCFLocalSessionTask_connectionWillFinishLoading___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releasePreventIdleSleepAssertionIfAppropriate];
}

uint64_t __72____NSCFLocalSessionTask_connection_willCacheResponse_responseCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_willCacheResponse:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __69____NSCFLocalSessionTask_connection_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    double v2 = *(void **)(a1 + 40);
    uint64_t v3 = v1[88];
    if (!v3) {
      uint64_t v3 = v1[87];
    }
    -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:](v3, v1, v2);
  }
}

uint64_t __79____NSCFLocalSessionTask_connection_wasRedirected_newRequest_responseCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_didReceiveResponse:redirectRequest:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

uint64_t __44____NSCFLocalSessionTask_cancel_with_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel_with_error:", *(void *)(a1 + 40));
}

uint64_t __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  double v2 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = [*(id *)(a1 + 32) _loggableDescription];
    int v5 = 138543618;
    uint64_t v6 = v4;
    __int16 v7 = 1024;
    int v8 = 180;
    _os_log_error_impl(&dword_184085000, v2, OS_LOG_TYPE_ERROR, "%{public}@ will be canceled, because client didn't respond to delegate with new request in %d seconds", (uint8_t *)&v5, 0x12u);
  }
  [*(id *)(a1 + 32) cancel];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) updateCurrentRequest:a2];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke_2;
    v8[3] = &unk_1E5258028;
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[4] = a2;
    v8[5] = v5;
    return objc_msgSend(v4, "_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:", v8);
  }
  else
  {
    __int16 v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
}

uint64_t __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

unsigned char *__84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke(uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishAllow](*(unsigned char **)(a1 + 32));
}

uint64_t __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_3(uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishBecomeDownload:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3];
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 792);
    if (v4)
    {
      *(void *)(v3 + 792) = 0;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_4;
      v5[3] = &unk_1E52571D8;
      v5[4] = *(void *)(a1 + 32);
      long long v6 = *(_OWORD *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 56);
      objc_msgSend((id)v6, "_task_onqueue_didReceiveDispatchData:completionHandler:", v4, v5);
      dispatch_release(v4);
    }
    else
    {
      -[__NSCFLocalSessionTask _finishBecomeStream:forConnection:completionHandler:](v3, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56));
    }
  }
}

uint64_t __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishBecomeStream:forConnection:completionHandler:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56));
}

@end
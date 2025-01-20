@interface NSCFURLSessionDelegateWrapper
@end

@implementation NSCFURLSessionDelegateWrapper

void __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didReceiveData:*(void *)(a1 + 56)];
  v2 = *(NSObject **)(a1 + 64);
  v3 = *(void **)(a1 + 72);

  dispatch_async(v2, v3);
}

void __79____NSCFURLSessionDelegateWrapper_task_didCompleteWithError_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 56)];
  v2 = *(NSObject **)(a1 + 64);
  v3 = *(void **)(a1 + 72);

  dispatch_async(v2, v3);
}

void __85____NSCFURLSessionDelegateWrapper_task_didFinishCollectingMetrics_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didFinishCollectingMetrics:*(void *)(a1 + 56)];
  v2 = *(NSObject **)(a1 + 64);
  v3 = *(void **)(a1 + 72);

  dispatch_async(v2, v3);
}

uint64_t __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E52527E8;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 URLSession:v3 dataTask:v4 didReceiveResponse:v5 completionHandler:v6];
}

uint64_t __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __61____NSCFURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) didBecomeInvalidWithError:*(void *)(a1 + 48)];
  uint64_t v3 = *(void **)(a1 + 56);
  if (v3)
  {
    objc_setProperty_atomic(v3, v2, 0, 32);
  }
}

void __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke_2(uint64_t *a1)
{
  if (-[__NSCFDeallocBomb disarm](a1[4]))
  {
    v2 = a1[5];
    uint64_t v3 = (void *)a1[6];
    dispatch_async(v2, v3);
  }
}

void __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke_3;
    block[3] = &unk_1E5257DA8;
    v6 = *(NSObject **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3;
    block[3] = &unk_1E5257DA8;
    v6 = *(NSObject **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3;
    v5[3] = &unk_1E5258028;
    uint64_t v4 = *(NSObject **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

void __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
    v5[3] = &unk_1E5257C58;
    uint64_t v4 = *(NSObject **)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = a2;
    dispatch_async(v4, v5);
  }
}

void __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5258340;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:_willSendRequestForEstablishedConnection:completionHandler:", v3, v4, v5, v6);
}

void __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2;
  v6[3] = &unk_1E52573F0;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 URLSession:v3 task:v4 didReceiveChallenge:v5 completionHandler:v6];
}

void __92____NSCFURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didFinishDownloadingToURL:*(void *)(a1 + 56)];
  v2 = *(NSObject **)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 72);

  dispatch_async(v2, v3);
}

void __84____NSCFURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didBecomeDownloadTask:*(void *)(a1 + 56)];
  v2 = *(NSObject **)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 72);

  dispatch_async(v2, v3);
}

uint64_t __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __96____NSCFURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didSendBodyData:*(void *)(a1 + 56) totalBytesSent:*(void *)(a1 + 64) totalBytesExpectedToSend:*(void *)(a1 + 72)];
}

void __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke_2;
  v5[3] = &unk_1E52573F0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 URLSession:v3 didReceiveChallenge:v4 completionHandler:v5];
}

void __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke_2;
  v6[3] = &unk_1E52581A0;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:dataTask:_didReceiveData:completionHandler:", v3, v4, v5, v6);
}

uint64_t __73____NSCFURLSessionDelegateWrapper_didFinishEventsForBackgroundURLSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSessionDidFinishEventsForBackgroundURLSession:*(void *)(a1 + 40)];
}

void __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E52526A8;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 _URLSession:v3 task:v4 getAuthHeadersForResponse:v5 completionHandler:v6];
}

void __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke_3;
    v10[3] = &unk_1E5257300;
    id v9 = *(NSObject **)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    char v14 = a2;
    id v11 = v7;
    id v12 = v8;
    dispatch_async(v9, v10);
  }
}

uint64_t __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __74____NSCFURLSessionDelegateWrapper__openFileAtPath_mode_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _URLSession:*(void *)(a1 + 40) openFileAtPath:*(void *)(a1 + 48) mode:*(unsigned int *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

void __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E52526F8;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 URLSession:v3 task:v4 willBeginDelayedRequest:v5 completionHandler:v6];
}

void __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke_3;
    block[3] = &unk_1E5257DA8;
    id v6 = *(NSObject **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __64____NSCFURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) taskIsWaitingForConnectivity:*(void *)(a1 + 48)];
}

void __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5258340;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 88);
  [v2 URLSession:v3 task:v4 willPerformHTTPRedirection:v5 newRequest:v6 completionHandler:v7];
}

void __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
    v5[3] = &unk_1E5258028;
    uint64_t v4 = *(NSObject **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke_2;
  v5[3] = &unk_1E5252748;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 URLSession:v3 task:v4 needNewBodyStream:v5];
}

void __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5252748;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  [v2 URLSession:v3 task:v5 needNewBodyStreamFromOffset:v4 completionHandler:v6];
}

void __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[__NSCFDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5258028;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke_3;
    v5[3] = &unk_1E5258028;
    uint64_t v4 = *(NSObject **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5258340;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:_schemeUpgraded:completionHandler:", v3, v4, v5, v6);
}

void __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3;
    v5[3] = &unk_1E5258028;
    uint64_t v4 = *(NSObject **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72____NSCFURLSessionDelegateWrapper_task__conditionalRequirementsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:_conditionalRequirementsChanged:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __72____NSCFURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didReceiveInformationalResponse:*(void *)(a1 + 56)];
}

void __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5252BB0;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "_URLSession:task:_willUseEffectiveConfiguration:completionHandler:", v3, v4, v5, v6);
}

void __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke_3;
    v5[3] = &unk_1E5258028;
    uint64_t v4 = *(NSObject **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __73____NSCFURLSessionDelegateWrapper_task__isWaitingForConnectionWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:_isWaitingForConnectionWithError:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

uint64_t __73____NSCFURLSessionDelegateWrapper_task__isWaitingForConnectionWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:_taskIsWaitingForConnection:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __64____NSCFURLSessionDelegateWrapper_task__alternatePathAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:_alternatePathAvailable:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

void __82____NSCFURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didBecomeStreamTask:*(void *)(a1 + 56)];
  v2 = *(NSObject **)(a1 + 64);
  id v3 = *(void **)(a1 + 72);

  dispatch_async(v2, v3);
}

void __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5252810;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 URLSession:v3 dataTask:v4 willCacheResponse:v5 completionHandler:v6];
}

void __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[__NSCFDeallocBomb disarm](*(void *)(a1 + 32)))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke_3;
    v5[3] = &unk_1E5258028;
    uint64_t v4 = *(NSObject **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74____NSCFURLSessionDelegateWrapper__willRetryBackgroundDataTask_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:_willRetryBackgroundDataTask:withError:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

uint64_t __74____NSCFURLSessionDelegateWrapper__willRetryBackgroundDataTask_withError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:_willRetryBackgroundDataTask:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __123____NSCFURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didWriteData:*(void *)(a1 + 72) totalBytesWritten:*(void *)(a1 + 80) totalBytesExpectedToWrite:*(void *)(a1 + 88)];
  v2 = *(NSObject **)(a1 + 56);
  id v3 = *(void **)(a1 + 64);

  dispatch_async(v2, v3);
}

uint64_t __85____NSCFURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didResumeAtOffset:*(void *)(a1 + 56) expectedTotalBytes:*(void *)(a1 + 64)];
}

uint64_t __68____NSCFURLSessionDelegateWrapper_downloadTask__didReceiveResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didReceiveResponse:*(void *)(a1 + 56)];
}

void __77____NSCFURLSessionDelegateWrapper_readClosedForStreamTask_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) readClosedForStreamTask:*(void *)(a1 + 48)];
  v2 = *(NSObject **)(a1 + 56);
  id v3 = *(void **)(a1 + 64);

  dispatch_async(v2, v3);
}

void __78____NSCFURLSessionDelegateWrapper_writeClosedForStreamTask_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) writeClosedForStreamTask:*(void *)(a1 + 48)];
  v2 = *(NSObject **)(a1 + 56);
  id v3 = *(void **)(a1 + 64);

  dispatch_async(v2, v3);
}

uint64_t __70____NSCFURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) betterRouteDiscoveredForStreamTask:*(void *)(a1 + 48)];
}

void __98____NSCFURLSessionDelegateWrapper_streamTask_didBecomeInputStream_outputStream_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) streamTask:*(void *)(a1 + 48) didBecomeInputStream:*(void *)(a1 + 56) outputStream:*(void *)(a1 + 64)];
  v2 = *(NSObject **)(a1 + 72);
  id v3 = *(void **)(a1 + 80);

  dispatch_async(v2, v3);
}

uint64_t __71____NSCFURLSessionDelegateWrapper__connectionEstablishedForStreamTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _URLSession:*(void *)(a1 + 40) connectionEstablishedForStreamTask:*(void *)(a1 + 48)];
}

uint64_t __69____NSCFURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) webSocketTask:*(void *)(a1 + 48) didOpenWithProtocol:*(void *)(a1 + 56)];
}

uint64_t __73____NSCFURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) webSocketTask:*(void *)(a1 + 48) didCloseWithCode:*(void *)(a1 + 64) reason:*(void *)(a1 + 56)];
}

@end
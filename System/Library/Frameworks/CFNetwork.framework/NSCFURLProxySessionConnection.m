@interface NSCFURLProxySessionConnection
@end

@implementation NSCFURLProxySessionConnection

uint64_t __110____NSCFURLProxySessionConnection_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 92))
  {
    if ((v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "originalRequest"), "HTTPBodyStream")) != 0
      && (uint64_t v5 = (uint64_t)v4, ![v4 streamStatus])
      || ![a2 HTTPBodyStream]
      && ![a2 HTTPBody]
      && *(void *)(*(void *)(a1 + 32) + 120)
      && (uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA10], "inputStreamWithFileAtPath:")) != 0)
    {
      objc_msgSend((id)objc_msgSend(a2, "mutableCopy"), "setHTTPBodyStream:", v5);
    }
  }
  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v6();
}

void __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
}

void __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(dispatch_queue_t **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke_3;
  v3[3] = &unk_1E52582F0;
  v3[4] = v2;
  v3[5] = a2;
  v3[6] = *(void *)(a1 + 40);
  -[__NSCFURLSessionConnection withWorkQueueAsync:](v2, (const char *)v3);
}

void __64____NSCFURLProxySessionConnection__deliverDidCompleteWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  v2 = *(void **)(a1 + 32);
}

void __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1)
{
  -[__NSCFURLSessionConnection _storeCachedResponse:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  v2 = *(id **)(a1 + 32);
  v3 = *(void **)(a1 + 48);

  -[__NSCFURLProxySessionConnection _deliverDidCompleteWithError:](v2, v3);
}

uint64_t __107____NSCFURLProxySessionConnection_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    Property = *(id **)(a1 + 32);
    if (a2)
    {
      if (Property) {
        Property = (id *)objc_getProperty(Property, a2, 8, 1);
      }
      [Property updateCurrentRequest:a2];
    }
    else
    {
      [Property[10] cancel];
      *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    }
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

uint64_t __92____NSCFURLProxySessionConnection_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 1)) {
    -[__NSCFURLSessionConnection _tossCache](*(void *)(a1 + 32));
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __73____NSCFURLProxySessionConnection_setTLSMaximumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "set_TLSMaximumSupportedProtocolVersion:", *(unsigned __int16 *)(a1 + 40));
}

uint64_t __73____NSCFURLProxySessionConnection_setTLSMinimumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "set_TLSMinimumSupportedProtocolVersion:", *(unsigned __int16 *)(a1 + 40));
}

uint64_t __64____NSCFURLProxySessionConnection_expectedProgressTargetChanged__block_invoke(uint64_t a1, const char *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[9];
  uint64_t v4 = objc_msgSend(objc_getProperty(v2, a2, 8, 1), "_expectedProgressTarget");

  return objc_msgSend(v3, "set_expectedProgressTarget:", v4);
}

uint64_t __51____NSCFURLProxySessionConnection_setPoolPriority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "set_priority:", *(void *)(a1 + 40));
}

uint64_t __41____NSCFURLProxySessionConnection_resume__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) resume];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);

  return [v2 resume];
}

uint64_t __42____NSCFURLProxySessionConnection_suspend__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) suspend];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);

  return [v2 suspend];
}

uint64_t __41____NSCFURLProxySessionConnection_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) cancel];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);

  return [v2 cancel];
}

void __71____NSCFURLProxySessionConnection_initWithTask_delegate_delegateQueue___block_invoke(uint64_t a1, const char *a2)
{
}

@end
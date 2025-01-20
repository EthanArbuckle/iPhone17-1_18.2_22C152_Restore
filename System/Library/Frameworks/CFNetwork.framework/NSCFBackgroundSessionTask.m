@interface NSCFBackgroundSessionTask
@end

@implementation NSCFBackgroundSessionTask

NSDictionary *__49____NSCFBackgroundSessionTask_cookiesForRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  result = +[NSHTTPCookie requestHeaderFieldsWithCookies:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __50____NSCFBackgroundSessionTask_setTaskDescription___block_invoke(uint64_t a1)
{
  uint64_t result = -[__NSURLBackgroundSession ensureRemoteSession]([*(id *)(a1 + 32) session]);
  if (result)
  {
    v3 = (void *)result;
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) taskIdentifier];
    return [v3 setDescription:v4 forTask:v5];
  }
  return result;
}

uint64_t __57____NSCFBackgroundSessionTask_set_discretionaryOverride___block_invoke(uint64_t a1)
{
  uint64_t result = -[__NSURLBackgroundSession ensureRemoteSession]([*(id *)(a1 + 32) session]);
  if (result)
  {
    v3 = (void *)result;
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) taskIdentifier];
    return [v3 setDiscretionaryOverride:v4 forTaskWithIdentifier:v5];
  }
  return result;
}

uint64_t __70____NSCFBackgroundSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  uint64_t result = -[__NSURLBackgroundSession ensureRemoteSession]([*(id *)(a1 + 32) session]);
  if (result)
  {
    v3 = (void *)result;
    uint64_t v4 = *(unsigned __int16 *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) taskIdentifier];
    return [v3 setTLSMaximumSupportedProtocolVersion:v4 forTaskWithIdentifier:v5];
  }
  return result;
}

uint64_t __70____NSCFBackgroundSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  uint64_t result = -[__NSURLBackgroundSession ensureRemoteSession]([*(id *)(a1 + 32) session]);
  if (result)
  {
    v3 = (void *)result;
    uint64_t v4 = *(unsigned __int16 *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) taskIdentifier];
    return [v3 setTLSMinimumSupportedProtocolVersion:v4 forTaskWithIdentifier:v5];
  }
  return result;
}

uint64_t __95____NSCFBackgroundSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
@interface AVTCoreAnalyticsClient
- (void)sendEventForKey:(id)a3 payload:(id)a4;
@end

@implementation AVTCoreAnalyticsClient

- (void)sendEventForKey:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __50__AVTCoreAnalyticsClient_sendEventForKey_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
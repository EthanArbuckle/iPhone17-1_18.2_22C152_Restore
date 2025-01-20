@interface CMSAnalytics
+ (void)sendContentFailureEvent:(id)a3;
@end

@implementation CMSAnalytics

+ (void)sendContentFailureEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 eventName];
  v6 = v3;
  id v5 = v3;
  AnalyticsSendEventLazy();
}

uint64_t __40__CMSAnalytics_sendContentFailureEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encoded];
}

@end
@interface SKAnalyticsManager
+ (void)sendEvent:(id)a3;
+ (void)sendEventLazyWithName:(id)a3 buildEvent:(id)a4;
@end

@implementation SKAnalyticsManager

+ (void)sendEvent:(id)a3
{
  id v3 = a3;
  if ([v3 canCreatePayload])
  {
    v4 = [v3 eventName];
    id v6 = v3;
    AnalyticsSendEventLazy();
  }
  else
  {
    if (SKLogHandleForCategory_onceToken_0 != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken_0, &__block_literal_global_11);
    }
    v5 = SKLogHandleForCategory_logHandles_1_0;
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_1_0, OS_LOG_TYPE_ERROR)) {
      +[SKAnalyticsManager sendEvent:](v5);
    }
  }
}

uint64_t __32__SKAnalyticsManager_sendEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createPayload];
}

+ (void)sendEventLazyWithName:(id)a3 buildEvent:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __55__SKAnalyticsManager_sendEventLazyWithName_buildEvent___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if ([v1 canCreatePayload])
  {
    v2 = [v1 createPayload];
  }
  else
  {
    if (SKLogHandleForCategory_onceToken_0 != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken_0, &__block_literal_global_11);
    }
    id v3 = SKLogHandleForCategory_logHandles_1_0;
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_1_0, OS_LOG_TYPE_ERROR)) {
      +[SKAnalyticsManager sendEvent:](v3);
    }
    v2 = 0;
  }

  return v2;
}

+ (void)sendEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B005B000, log, OS_LOG_TYPE_ERROR, "Error sending CoreAnalytics event, invalid event provided", v1, 2u);
}

@end
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
    if (qword_10039FBE0 != -1) {
      dispatch_once(&qword_10039FBE0, &stru_100358BF0);
    }
    v5 = qword_10039FB98;
    if (os_log_type_enabled((os_log_t)qword_10039FB98, OS_LOG_TYPE_ERROR)) {
      sub_1002C409C(v5);
    }
  }
}

+ (void)sendEventLazyWithName:(id)a3 buildEvent:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

@end
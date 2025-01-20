@interface PMPowerModeAnalytics
+ (void)sendAnalyticsDaily:(id)a3 forStream:(id)a4;
+ (void)sendAnalyticsEvent:(id)a3 withBatteryLevel:(id)a4 fromSource:(id)a5 withCharger:(id)a6 withDurationInMinutes:(id)a7 forStream:(id)a8;
@end

@implementation PMPowerModeAnalytics

+ (void)sendAnalyticsEvent:(id)a3 withBatteryLevel:(id)a4 fromSource:(id)a5 withCharger:(id)a6 withDurationInMinutes:(id)a7 forStream:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (&_AnalyticsSendEventLazy)
  {
    id v17 = v12;
    id v18 = v13;
    id v19 = v14;
    id v20 = v15;
    id v21 = v16;
    AnalyticsSendEventLazy();
  }
}

+ (void)sendAnalyticsDaily:(id)a3 forStream:(id)a4
{
  id v4 = a3;
  v5 = v4;
  if (&_AnalyticsSendEventLazy)
  {
    id v6 = v4;
    AnalyticsSendEventLazy();
  }
}

@end
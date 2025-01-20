@interface _ARSessionMetricsDefaultReporter
- (void)postDarwinNotification:(id)a3;
- (void)sendEvent:(id)a3 dictionary:(id)a4;
@end

@implementation _ARSessionMetricsDefaultReporter

- (void)postDarwinNotification:(id)a3
{
  name = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
}

- (void)sendEvent:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (!+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.session.disableSessionMetricsReporting"])AnalyticsSendEventLazy(); {
}
  }

@end
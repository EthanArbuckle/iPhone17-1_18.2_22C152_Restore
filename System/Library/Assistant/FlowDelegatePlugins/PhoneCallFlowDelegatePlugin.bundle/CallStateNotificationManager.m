@interface CallStateNotificationManager
- (void)callStateChanged:(id)a3;
@end

@implementation CallStateNotificationManager

- (void)callStateChanged:(id)a3
{
  id v3 = a3;
  swift_retain();
  CallStateNotificationManager.callStateChanged(_:)((NSNotification)v3);

  swift_release();
}

@end
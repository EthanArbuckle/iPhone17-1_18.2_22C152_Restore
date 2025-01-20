@interface AEConcreteSystemNotificationPrimitives
- (id)observeSystemNotificationWithName:(id)a3 onQueue:(id)a4 withHandler:(id)a5;
- (void)postSystemNotificationWithName:(id)a3;
@end

@implementation AEConcreteSystemNotificationPrimitives

- (void)postSystemNotificationWithName:(id)a3
{
  name = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
}

- (id)observeSystemNotificationWithName:(id)a3 onQueue:(id)a4 withHandler:(id)a5
{
  return +[AESystemNotificationObservation observationWithNotificationName:a3 queue:a4 notificationHandler:a5];
}

@end
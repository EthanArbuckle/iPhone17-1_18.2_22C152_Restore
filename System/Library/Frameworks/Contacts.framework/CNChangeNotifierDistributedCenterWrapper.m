@interface CNChangeNotifierDistributedCenterWrapper
- (void)addObserver:(id)a3 notification:(id)a4;
- (void)postNotification:(id)a3;
- (void)removeObserver:(id)a3 notification:(id)a4;
@end

@implementation CNChangeNotifierDistributedCenterWrapper

- (void)addObserver:(id)a3 notification:(id)a4
{
  v5 = (__CFString *)a4;
  id observer = a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, observer, (CFNotificationCallback)CNChangesNotifierCFNotificationCenterCallback, v5, 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)removeObserver:(id)a3 notification:(id)a4
{
  v5 = (__CFString *)a4;
  id observer = a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, observer, v5, 0);
}

- (void)postNotification:(id)a3
{
  name = (__CFString *)a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, name, 0, 0, 0);
}

@end
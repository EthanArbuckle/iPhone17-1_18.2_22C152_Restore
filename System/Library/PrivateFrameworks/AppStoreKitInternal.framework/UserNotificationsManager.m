@interface UserNotificationsManager
- (void)appEnteredWhileAppeared;
- (void)cacheDidUpdate;
- (void)storeAccountDidChange;
@end

@implementation UserNotificationsManager

- (void)appEnteredWhileAppeared
{
}

- (void)storeAccountDidChange
{
  swift_retain();
  sub_1E18C4E28();
  swift_release();
}

- (void)cacheDidUpdate
{
}

@end
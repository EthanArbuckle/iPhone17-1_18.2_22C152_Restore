@interface ATXInternalUnLockedOrUnHiddenAppNotification
+ (void)postNotificationWithUnLockedOrUnHiddenApps:(id)a3;
- (ATXInternalUnLockedOrUnHiddenAppNotification)init;
- (void)registerForNotificationsWithUnLockedOrUnHiddenAppBlock:(id)a3;
@end

@implementation ATXInternalUnLockedOrUnHiddenAppNotification

- (ATXInternalUnLockedOrUnHiddenAppNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInternalUnLockedOrUnHiddenAppNotification;
  v2 = [(ATXInternalUnLockedOrUnHiddenAppNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd._ATXAppProtectionMonitor.appUnLockedOrUnHidden"];
    note = v2->_note;
    v2->_note = v3;
  }
  return v2;
}

- (void)registerForNotificationsWithUnLockedOrUnHiddenAppBlock:(id)a3
{
}

+ (void)postNotificationWithUnLockedOrUnHiddenApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
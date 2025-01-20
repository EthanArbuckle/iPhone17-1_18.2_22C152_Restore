@interface ATXInternalLockedOrHiddenAppNotification
+ (void)postNotificationWithLockedOrHiddenApps:(id)a3;
- (ATXInternalLockedOrHiddenAppNotification)init;
- (void)registerForNotificationsWithLockedOrHiddenAppBlock:(id)a3;
@end

@implementation ATXInternalLockedOrHiddenAppNotification

- (ATXInternalLockedOrHiddenAppNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInternalLockedOrHiddenAppNotification;
  v2 = [(ATXInternalLockedOrHiddenAppNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd._ATXAppProtectionMonitor.appLockedOrHidden"];
    note = v2->_note;
    v2->_note = v3;
  }
  return v2;
}

- (void)registerForNotificationsWithLockedOrHiddenAppBlock:(id)a3
{
}

+ (void)postNotificationWithLockedOrHiddenApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
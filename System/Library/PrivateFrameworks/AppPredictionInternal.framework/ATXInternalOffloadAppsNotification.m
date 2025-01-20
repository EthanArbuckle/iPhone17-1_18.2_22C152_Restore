@interface ATXInternalOffloadAppsNotification
+ (void)postNotificationWithOffloadSet:(id)a3;
- (ATXInternalOffloadAppsNotification)init;
- (void)registerForNotificationWithOffloadBlock:(id)a3;
@end

@implementation ATXInternalOffloadAppsNotification

- (ATXInternalOffloadAppsNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInternalOffloadAppsNotification;
  v2 = [(ATXInternalOffloadAppsNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd._ATXInternalUninstallNotification.appOffloaded"];
    note = v2->_note;
    v2->_note = v3;
  }
  return v2;
}

- (void)registerForNotificationWithOffloadBlock:(id)a3
{
}

+ (void)postNotificationWithOffloadSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
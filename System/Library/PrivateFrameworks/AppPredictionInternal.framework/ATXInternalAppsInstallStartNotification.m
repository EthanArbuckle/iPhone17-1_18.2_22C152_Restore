@interface ATXInternalAppsInstallStartNotification
+ (void)postNotificationWithInstallStartDictionary:(id)a3;
- (ATXInternalAppsInstallStartNotification)init;
- (void)registerForNotificationsWithInstallStartBlock:(id)a3;
@end

@implementation ATXInternalAppsInstallStartNotification

- (ATXInternalAppsInstallStartNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInternalAppsInstallStartNotification;
  v2 = [(ATXInternalAppsInstallStartNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd.ATXInternalAppsInstallStartNotification.appInstalling"];
    note = v2->_note;
    v2->_note = v3;
  }
  return v2;
}

+ (void)postNotificationWithInstallStartDictionary:(id)a3
{
  id v3 = a3;
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[ATXInternalAppsInstallStartNotification postNotificationWithInstallStartDictionary:]((uint64_t)v3, v4);
  }

  +[_ATXInternalNotification postData:v3 forNotificationNamed:@"com.apple.duetexpertd.ATXInternalAppsInstallStartNotification.appInstalling"];
}

- (void)registerForNotificationsWithInstallStartBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)postNotificationWithInstallStartDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXInternalAppsInstallStartNotification: posting install start notification with payload:\n%@", (uint8_t *)&v2, 0xCu);
}

@end
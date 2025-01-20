@interface CALNLegacyIdentifierUtils
+ (void)setLegacyIdentifier:(id)a3 onNotificationContent:(id)a4;
+ (void)setLegacyIdentifierForCalendarNotification:(id)a3 onNotificationContent:(id)a4;
@end

@implementation CALNLegacyIdentifierUtils

+ (void)setLegacyIdentifier:(id)a3 onNotificationContent:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 numberWithUnsignedInt:393216];
  v10 = v8;
  v11[0] = v7;
  v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [v6 setUserInfoValue:v9 forKey:@"BLTWatchLegacyMap"];
}

+ (void)setLegacyIdentifierForCalendarNotification:(id)a3 onNotificationContent:(id)a4
{
  id v6 = a4;
  id v7 = [a3 URL];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 absoluteString];
    [a1 setLegacyIdentifier:v9 onNotificationContent:v6];
  }
  else
  {
    v10 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:onNotificationContent:](v10);
    }
  }
}

+ (void)setLegacyIdentifierForCalendarNotification:(os_log_t)log onNotificationContent:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Cannot set legacy identifier for calendar notification with no URL.", v1, 2u);
}

@end
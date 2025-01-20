@interface CALNNotificationFilter
+ (BOOL)shouldIgnoreNotificationForEvent:(id)a3;
@end

@implementation CALNNotificationFilter

+ (BOOL)shouldIgnoreNotificationForEvent:(id)a3
{
  uint64_t v3 = [a3 junkStatus];
  if (v3 == 1)
  {
    v4 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[CALNNotificationFilter shouldIgnoreNotificationForEvent:](v4);
    }
  }
  return v3 == 1;
}

+ (void)shouldIgnoreNotificationForEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2216BB000, log, OS_LOG_TYPE_DEBUG, "Ignoring junk event", v1, 2u);
}

@end
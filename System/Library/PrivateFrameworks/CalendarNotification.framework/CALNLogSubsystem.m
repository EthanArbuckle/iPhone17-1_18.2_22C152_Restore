@interface CALNLogSubsystem
+ (OS_os_log)alarmEngine;
+ (OS_os_log)calendar;
+ (OS_os_log)defaultCategory;
@end

@implementation CALNLogSubsystem

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1) {
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)defaultCategory_logHandle;
  return (OS_os_log *)v2;
}

uint64_t __35__CALNLogSubsystem_defaultCategory__block_invoke()
{
  defaultCategory_logHandle = (uint64_t)os_log_create("com.apple.calendar.notification", "Default");
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)calendar
{
  if (calendar_onceToken != -1) {
    dispatch_once(&calendar_onceToken, &__block_literal_global_3_0);
  }
  v2 = (void *)calendar_logHandle;
  return (OS_os_log *)v2;
}

uint64_t __28__CALNLogSubsystem_calendar__block_invoke()
{
  calendar_logHandle = (uint64_t)os_log_create("com.apple.calendar.notification", "Calendar");
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)alarmEngine
{
  if (alarmEngine_onceToken != -1) {
    dispatch_once(&alarmEngine_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)alarmEngine_logHandle;
  return (OS_os_log *)v2;
}

uint64_t __31__CALNLogSubsystem_alarmEngine__block_invoke()
{
  alarmEngine_logHandle = (uint64_t)os_log_create("com.apple.calendar.notification", "AlarmEngine");
  return MEMORY[0x270F9A758]();
}

@end
@interface CalMigrationLog
+ (OS_os_log)calendar;
+ (OS_os_log)defaultCategory;
+ (OS_os_log)reminders;
@end

@implementation CalMigrationLog

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1) {
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)defaultCategory_logHandle;
  return (OS_os_log *)v2;
}

uint64_t __34__CalMigrationLog_defaultCategory__block_invoke()
{
  defaultCategory_logHandle = (uint64_t)os_log_create("com.apple.calendar.migration", "Default");
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)calendar
{
  if (calendar_onceToken != -1) {
    dispatch_once(&calendar_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)calendar_logHandle;
  return (OS_os_log *)v2;
}

uint64_t __27__CalMigrationLog_calendar__block_invoke()
{
  calendar_logHandle = (uint64_t)os_log_create("com.apple.calendar.migration", "Calendar");
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)reminders
{
  if (reminders_onceToken != -1) {
    dispatch_once(&reminders_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)reminders_logHandle;
  return (OS_os_log *)v2;
}

uint64_t __28__CalMigrationLog_reminders__block_invoke()
{
  reminders_logHandle = (uint64_t)os_log_create("com.apple.calendar.migration", "Reminders");
  return MEMORY[0x270F9A758]();
}

@end
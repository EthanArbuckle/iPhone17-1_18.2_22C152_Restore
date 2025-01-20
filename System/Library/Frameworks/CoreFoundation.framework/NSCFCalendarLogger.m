@interface NSCFCalendarLogger
@end

@implementation NSCFCalendarLogger

os_log_t ___NSCFCalendarLogger_block_invoke()
{
  os_log_t result = os_log_create("com.apple.NSCFCalendar", "general");
  _NSCFCalendarLogger__logger = (uint64_t)result;
  return result;
}

@end
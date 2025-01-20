@interface NSLocale(NSLocale_CalendarDirection)
- (uint64_t)_calendarDirection;
@end

@implementation NSLocale(NSLocale_CalendarDirection)

- (uint64_t)_calendarDirection
{
  return MEMORY[0x1F40D8E78]();
}

@end
@interface NSTimeZone(CalendarAdditions)
+ (id)calendarTimeZone;
@end

@implementation NSTimeZone(CalendarAdditions)

+ (id)calendarTimeZone
{
  v0 = (void *)CalCopyTimeZone();

  return v0;
}

@end
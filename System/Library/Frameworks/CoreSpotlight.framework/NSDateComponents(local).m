@interface NSDateComponents(local)
- (id)inclusiveDate;
@end

@implementation NSDateComponents(local)

- (id)inclusiveDate
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if ([a1 month] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = [v2 dateFromComponents:a1];
    [v2 rangeOfUnit:8 inUnit:4 forDate:v3];
    uint64_t v5 = v4;

    [a1 setMonth:v5];
  }
  if ([a1 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = [v2 dateFromComponents:a1];
    [v2 rangeOfUnit:16 inUnit:8 forDate:v6];
    uint64_t v8 = v7;

    [a1 setDay:v8];
  }
  if ([a1 hour] == 0x7FFFFFFFFFFFFFFFLL) {
    [a1 setHour:23];
  }
  if ([a1 minute] == 0x7FFFFFFFFFFFFFFFLL) {
    [a1 setMinute:59];
  }
  if ([a1 second] == 0x7FFFFFFFFFFFFFFFLL) {
    [a1 setSecond:59];
  }
  v9 = [v2 dateFromComponents:a1];

  return v9;
}

@end
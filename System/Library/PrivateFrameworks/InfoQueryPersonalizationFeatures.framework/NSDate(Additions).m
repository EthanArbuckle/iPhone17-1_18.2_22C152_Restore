@interface NSDate(Additions)
- (uint64_t)isDateInTodayOrFuture;
@end

@implementation NSDate(Additions)

- (uint64_t)isDateInTodayOrFuture
{
  [a1 timeIntervalSinceNow];
  if (v2 >= 0.0) {
    return 1;
  }
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v4 = [v3 isDateInToday:a1];

  return v4;
}

@end
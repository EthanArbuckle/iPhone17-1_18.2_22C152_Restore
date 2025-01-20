@interface NSCalendar(BSTimeUtilities)
- (uint64_t)date:()BSTimeUtilities isSameDayAsDate:;
- (uint64_t)date:()BSTimeUtilities isSameYearAsDate:;
@end

@implementation NSCalendar(BSTimeUtilities)

- (uint64_t)date:()BSTimeUtilities isSameDayAsDate:
{
  id v6 = a4;
  v7 = -[NSCalendar _dateOnlyComponentsForDate:](a1, a3);
  v8 = -[NSCalendar _dateOnlyComponentsForDate:](a1, v6);
  uint64_t v9 = [v7 isSameDayAsComponents:v8];

  return v9;
}

- (uint64_t)date:()BSTimeUtilities isSameYearAsDate:
{
  id v6 = a4;
  v7 = -[NSCalendar _dateOnlyComponentsForDate:](a1, a3);
  v8 = -[NSCalendar _dateOnlyComponentsForDate:](a1, v6);
  uint64_t v9 = [v7 isSameYearAsComponents:v8];

  return v9;
}

@end
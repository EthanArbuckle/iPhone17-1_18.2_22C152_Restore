@interface NSDate(CRXUExtensions)
+ (double)crxu_now;
+ (id)crxu_dateWithYear:()CRXUExtensions month:day:;
- (BOOL)crxu_isAfter:()CRXUExtensions;
- (BOOL)crxu_isBefore:()CRXUExtensions;
- (id)crxu_dateByAddingDays:()CRXUExtensions;
- (id)crxu_yearMonthDayComponents;
- (uint64_t)crxu_numberOfDaysAfterDate:()CRXUExtensions;
@end

@implementation NSDate(CRXUExtensions)

- (id)crxu_dateByAddingDays:()CRXUExtensions
{
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v7 = [v6 dateByAddingUnit:16 value:a3 toDate:a1 options:0];

  return v7;
}

- (id)crxu_yearMonthDayComponents
{
  id v2 = objc_alloc(MEMORY[0x263EFF8F0]);
  v3 = (void *)[v2 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v4 = [v3 components:28 fromDate:a1];

  return v4;
}

+ (id)crxu_dateWithYear:()CRXUExtensions month:day:
{
  id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v8 setDay:a5];
  [v8 setMonth:a4];
  [v8 setYear:a3];
  id v9 = objc_alloc(MEMORY[0x263EFF8F0]);
  v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v11 = [v10 dateFromComponents:v8];

  return v11;
}

- (uint64_t)crxu_numberOfDaysAfterDate:()CRXUExtensions
{
  v4 = (objc_class *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v14 = 0;
  [v7 rangeOfUnit:16 startDate:&v14 interval:0 forDate:v5];

  id v8 = v14;
  id v13 = 0;
  [v7 rangeOfUnit:16 startDate:&v13 interval:0 forDate:a1];
  id v9 = v13;
  v10 = [v7 components:16 fromDate:v8 toDate:v9 options:0];
  uint64_t v11 = [v10 day];

  return v11;
}

- (BOOL)crxu_isAfter:()CRXUExtensions
{
  id v4 = a3;
  [a1 timeIntervalSinceReferenceDate];
  double v6 = v5;
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v7;

  return v6 > v8;
}

- (BOOL)crxu_isBefore:()CRXUExtensions
{
  id v4 = a3;
  [a1 timeIntervalSinceReferenceDate];
  double v6 = v5;
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v7;

  return v6 < v8;
}

+ (double)crxu_now
{
  v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSinceReferenceDate];
  double v2 = v1;

  return v2;
}

@end
@interface NSDateInterval(HKCodingSupport)
+ (id)hk_dateIntervalWithCodableDateInterval:()HKCodingSupport sourceTimeZone:;
- (HKCodableDateInterval)hk_codableDateInterval;
@end

@implementation NSDateInterval(HKCodingSupport)

+ (id)hk_dateIntervalWithCodableDateInterval:()HKCodingSupport sourceTimeZone:
{
  id v5 = a4;
  id v6 = a3;
  [v6 startDate];
  v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  v8 = objc_msgSend(v7, "hk_dateFromSourceTimeZone:", v5);

  [v6 endDate];
  double v10 = v9;

  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v10];
  v12 = objc_msgSend(v11, "hk_dateFromSourceTimeZone:", v5);

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v12];
  return v13;
}

- (HKCodableDateInterval)hk_codableDateInterval
{
  v2 = objc_alloc_init(HKCodableDateInterval);
  v3 = [a1 startDate];
  [v3 timeIntervalSinceReferenceDate];
  -[HKCodableDateInterval setStartDate:](v2, "setStartDate:");

  v4 = [a1 endDate];
  [v4 timeIntervalSinceReferenceDate];
  -[HKCodableDateInterval setEndDate:](v2, "setEndDate:");

  return v2;
}

@end
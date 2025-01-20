@interface NSCalendarDate(EKMSUIDAdditions)
- (id)ekmsuidGMTDateToDateInTimeZone:()EKMSUIDAdditions;
- (id)ekmsuidStringForYearMonthDay;
@end

@implementation NSCalendarDate(EKMSUIDAdditions)

- (id)ekmsuidGMTDateToDateInTimeZone:()EKMSUIDAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "dateByAddingYears:months:days:hours:minutes:seconds:", 0, 0, 0, 0, 0, -objc_msgSend(v4, "secondsFromGMTForDate:", a1));
  [v5 setTimeZone:v4];
  [v4 daylightSavingTimeOffsetForDate:a1];
  double v7 = v6;
  [v4 daylightSavingTimeOffsetForDate:v5];
  double v9 = v8;

  if (vabdd_f64(v7, v9) >= 2.22044605e-16)
  {
    uint64_t v10 = [v5 dateByAddingTimeInterval:v9 - v7];

    v5 = (void *)v10;
  }
  return v5;
}

- (id)ekmsuidStringForYearMonthDay
{
  v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  v3 = [a1 descriptionWithCalendarFormat:@"%Y%m%d" timeZone:v2 locale:0];

  return v3;
}

@end
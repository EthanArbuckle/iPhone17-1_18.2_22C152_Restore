@interface NSDateComponents(HKDayIndex)
+ (id)hk_componentsWithDayIndex:()HKDayIndex calendar:;
- (id)hk_dayIndexDateDescription;
- (uint64_t)hk_dayIndex;
@end

@implementation NSDateComponents(HKDayIndex)

+ (id)hk_componentsWithDayIndex:()HKDayIndex calendar:
{
  id v7 = a4;
  v8 = [v7 calendarIdentifier];
  char v9 = [v8 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v9 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSDateComponents+HKDayIndex.m", 64, @"Invalid parameter not satisfying: %@", @"[[calendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  HKCalendarComponentsFromDayIndex(a3, &v13);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v10 setCalendar:v7];

  [v10 setDay:v15];
  [v10 setMonth:v14];
  [v10 setYear:v13];

  return v10;
}

- (uint64_t)hk_dayIndex
{
  uint64_t v2 = [a1 year];
  uint64_t v3 = [a1 month];
  uint64_t v4 = [a1 day];
  uint64_t v5 = (v3 - 14) / 12;
  uint64_t v6 = v5 + v2;
  uint64_t v7 = 1461 * (v5 + v2);
  uint64_t v8 = v7 + 7012800;
  uint64_t v9 = v7 + 7012803;
  if (v8 >= 0) {
    uint64_t v9 = v8;
  }
  uint64_t v10 = (unsigned __int128)((367 * (v3 - 12 * v5) - 734) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
  return v4 + (v9 >> 2) + (v10 >> 1) + ((unint64_t)v10 >> 63) - 3 * ((v6 + 4900) / 100) / 4 - 2432076;
}

- (id)hk_dayIndexDateDescription
{
  uint64_t v2 = NSString;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "month"));
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "day"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "year"));
  uint64_t v6 = [v2 stringWithFormat:@"%@-%@-%@", v3, v4, v5];

  return v6;
}

@end
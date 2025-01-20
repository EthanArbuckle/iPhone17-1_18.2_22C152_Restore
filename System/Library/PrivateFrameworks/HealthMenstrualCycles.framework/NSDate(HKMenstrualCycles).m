@interface NSDate(HKMenstrualCycles)
- (id)hkmc_durationStringToEndDate:()HKMenstrualCycles calendar:;
@end

@implementation NSDate(HKMenstrualCycles)

- (id)hkmc_durationStringToEndDate:()HKMenstrualCycles calendar:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 components:16 fromDate:a1 toDate:v7 options:0];
  v9 = [v6 components:24 fromDate:a1 toDate:v7 options:0];
  v10 = [v6 components:12 fromDate:a1 toDate:v7 options:0];

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v8 day] == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v12 = objc_msgSend(v8, "day"), v13 = v8, v12 >= 61))
  {
    if ([v10 year] == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v14 = objc_msgSend(v10, "year"), v13 = v9, v14 >= 1)) {
      v13 = v10;
    }
  }
  id v15 = v13;
  v16 = [MEMORY[0x263EFF960] currentLocale];
  v17 = [v16 languageCode];
  int v18 = [v17 isEqualToString:@"en"];

  if (v18)
  {
    if ([v15 year] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v15, "year") >= 1)
    {
      v19 = objc_msgSend(NSString, "hkmc_stringForYears:", objc_msgSend(v15, "year"));
      [v11 addObject:v19];
    }
    if ([v15 month] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v15, "month") >= 1)
    {
      v20 = objc_msgSend(NSString, "hkmc_stringForMonths:", objc_msgSend(v15, "month"));
      [v11 addObject:v20];
    }
    if ([v15 day] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v15, "day") >= 1)
    {
      v21 = objc_msgSend(NSString, "hkmc_stringForDays:", objc_msgSend(v15, "day"));
      [v11 addObject:v21];
    }
    uint64_t v22 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v11];
  }
  else
  {
    uint64_t v22 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v15 unitsStyle:3];
  }
  v23 = (void *)v22;

  return v23;
}

@end
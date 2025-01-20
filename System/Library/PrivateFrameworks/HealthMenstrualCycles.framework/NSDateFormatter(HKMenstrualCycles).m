@interface NSDateFormatter(HKMenstrualCycles)
+ (id)hkmc_longNonRelativeDateFormatter;
+ (id)hkmc_longRelativeDateFormatter;
+ (id)hkmc_nonRelativeDateWithoutDayFormatter;
+ (uint64_t)hkmc_shouldUseRelativeFormatForFertileWindowEndDate:()HKMenstrualCycles gregorianCalendar:dateFormatArgumentOut:;
+ (uint64_t)localizedKeyDayNameFromDate:()HKMenstrualCycles gregorianCalendar:;
@end

@implementation NSDateFormatter(HKMenstrualCycles)

+ (id)hkmc_longRelativeDateFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  [v0 setTimeStyle:0];
  [v0 setDateStyle:4];
  [v0 setFormattingContext:5];
  [v0 setDoesRelativeDateFormatting:1];
  return v0;
}

+ (id)hkmc_longNonRelativeDateFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  [v0 setTimeStyle:0];
  [v0 setDateStyle:4];
  [v0 setFormattingContext:5];
  [v0 setDoesRelativeDateFormatting:0];
  return v0;
}

+ (id)hkmc_nonRelativeDateWithoutDayFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  [v0 setTimeStyle:0];
  [v0 setDateStyle:3];
  [v0 setFormattingContext:5];
  [v0 setDoesRelativeDateFormatting:0];
  return v0;
}

+ (uint64_t)hkmc_shouldUseRelativeFormatForFertileWindowEndDate:()HKMenstrualCycles gregorianCalendar:dateFormatArgumentOut:
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(MEMORY[0x263F08790], "hkmc_longRelativeDateFormatter");
  v10 = [v9 stringFromDate:v7];

  v11 = objc_msgSend(MEMORY[0x263F08790], "hkmc_longNonRelativeDateFormatter");
  v12 = [v11 stringFromDate:v7];

  int v13 = [v12 isEqualToString:v10];
  if (v13)
  {
    v22 = [MEMORY[0x263F08790] localizedKeyDayNameFromDate:v7 gregorianCalendar:v8];
    v14 = [NSString stringWithFormat:@"NOTIFICATION_UPDATE_FERTILE_WINDOW_BODY_WILL_END_ON_%@", v22];
    v15 = HKMCLocalizedString(v14);

    v16 = objc_msgSend(MEMORY[0x263F08790], "hkmc_nonRelativeDateWithoutDayFormatter");
    v17 = [v16 stringFromDate:v7];

    v18 = HKMCLocalizedString(@"NOTIFICATION_UPDATE_FERTILE_WINDOW_BODY_FULL_FORMAT_%@_%@");
    v19 = objc_msgSend(NSString, "stringWithFormat:", v18, v15, v17);
    v20 = v19;
    if (a5) {
      *a5 = v19;
    }
  }
  else if (a5)
  {
    *a5 = v10;
  }

  return v13 ^ 1u;
}

+ (uint64_t)localizedKeyDayNameFromDate:()HKMenstrualCycles gregorianCalendar:
{
  uint64_t v4 = [a4 component:512 fromDate:a3] - 1;
  return [&unk_26D7D01D8 objectAtIndexedSubscript:v4];
}

@end
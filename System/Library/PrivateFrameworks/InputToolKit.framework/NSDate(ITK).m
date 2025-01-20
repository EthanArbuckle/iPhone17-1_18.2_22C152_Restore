@interface NSDate(ITK)
- (BOOL)itk_isEarlierThanDate:()ITK;
- (BOOL)itk_isLaterThanDate:()ITK;
- (id)itk_briefFormattedDate:()ITK;
- (id)itk_shortFormattedDate;
- (uint64_t)itk_briefFormattedDate;
- (uint64_t)itk_briefFormattedDateForAccessibility;
- (uint64_t)itk_isToday;
- (uint64_t)itk_isYesterday;
- (uint64_t)itk_localDateWithSeconds;
@end

@implementation NSDate(ITK)

- (uint64_t)itk_isToday
{
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v3 = [v2 components:28 fromDate:a1];
  v4 = [v2 dateFromComponents:v3];
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [v2 components:28 fromDate:v5];

  v7 = [v2 dateFromComponents:v6];
  uint64_t v8 = [v4 isEqualToDate:v7];

  return v8;
}

- (uint64_t)itk_isYesterday
{
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v3 = [v2 components:28 fromDate:a1];
  v4 = [v2 dateFromComponents:v3];
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v5 setDay:-1];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = [v2 dateByAddingComponents:v5 toDate:v6 options:0];

  uint64_t v8 = [v2 components:28 fromDate:v7];
  v9 = [v2 dateFromComponents:v8];

  uint64_t v10 = [v4 isEqualToDate:v9];
  return v10;
}

- (uint64_t)itk_localDateWithSeconds
{
  if (itk_localDateWithSeconds_localFormatterOnceToken != -1) {
    dispatch_once(&itk_localDateWithSeconds_localFormatterOnceToken, &__block_literal_global_2);
  }
  v2 = (void *)itk_localDateWithSeconds_localFormatter;

  return [v2 stringFromDate:a1];
}

- (id)itk_shortFormattedDate
{
  if ((objc_msgSend(a1, "itk_isToday") & 1) != 0 || objc_msgSend(a1, "itk_isYesterday"))
  {
    if (itk_shortFormattedDate_shortRelativeOnceToken != -1) {
      dispatch_once(&itk_shortFormattedDate_shortRelativeOnceToken, &__block_literal_global_5);
    }
    v2 = &itk_shortFormattedDate_shortRelativeformatter;
  }
  else
  {
    if (itk_shortFormattedDate_shortStandardOnceToken != -1) {
      dispatch_once(&itk_shortFormattedDate_shortStandardOnceToken, &__block_literal_global_7);
    }
    v2 = &itk_shortFormattedDate_shortStandardformatter;
  }
  v3 = [(id)*v2 stringFromDate:a1];

  return v3;
}

- (uint64_t)itk_briefFormattedDate
{
  return objc_msgSend(a1, "itk_briefFormattedDate:", 0);
}

- (uint64_t)itk_briefFormattedDateForAccessibility
{
  return objc_msgSend(a1, "itk_briefFormattedDate:", 1);
}

- (id)itk_briefFormattedDate:()ITK
{
  id v4 = a1;
  id v5 = [MEMORY[0x263EFF910] distantFuture];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF910] date];

    id v4 = (id)v7;
  }
  if (objc_msgSend(v4, "itk_isToday"))
  {
    if (itk_briefFormattedDate__briefTodayOnceToken != -1) {
      dispatch_once(&itk_briefFormattedDate__briefTodayOnceToken, &__block_literal_global_9);
    }
    uint64_t v8 = [(id)itk_briefFormattedDate__briefTodayFormatter stringFromDate:v4];
  }
  else
  {
    v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    v11 = [v9 components:28 fromDate:v10];

    v12 = [v9 dateFromComponents:v11];
    v13 = [v9 dateByAddingUnit:16 value:-1 toDate:v12 options:0];
    v14 = [v9 dateByAddingUnit:0x2000 value:-1 toDate:v12 options:0];
    if ([v4 compare:v13] == 1 || objc_msgSend(v4, "compare:", v14) != 1)
    {
      if (a3)
      {
        if (itk_briefFormattedDate__templateOnceToken_14 != -1) {
          dispatch_once(&itk_briefFormattedDate__templateOnceToken_14, &__block_literal_global_16);
        }
        v15 = &itk_briefFormattedDate__accessibilityDateFormatter;
      }
      else
      {
        if (itk_briefFormattedDate__briefRelativeOnceToken != -1) {
          dispatch_once(&itk_briefFormattedDate__briefRelativeOnceToken, &__block_literal_global_18);
        }
        v15 = &itk_briefFormattedDate__briefRelativeFormatter;
      }
    }
    else
    {
      if (itk_briefFormattedDate__templateOnceToken != -1) {
        dispatch_once(&itk_briefFormattedDate__templateOnceToken, &__block_literal_global_11);
      }
      v15 = &itk_briefFormattedDate__templateFormatter;
    }
    uint64_t v8 = [(id)*v15 stringFromDate:v4];
  }

  return v8;
}

- (BOOL)itk_isEarlierThanDate:()ITK
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)itk_isLaterThanDate:()ITK
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end
@interface NSDate(WFFormatting)
- (id)wf_formattedStringWithDateStyle:()WFFormatting timeStyle:relativeDateStyle:customDateFormat:includeTimeForISO8601:timeZone:locale:;
@end

@implementation NSDate(WFFormatting)

- (id)wf_formattedStringWithDateStyle:()WFFormatting timeStyle:relativeDateStyle:customDateFormat:includeTimeForISO8601:timeZone:locale:
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  if (!v20)
  {
    id v20 = [MEMORY[0x263EFF960] currentLocale];
  }
  if ([v16 isEqualToString:@"Relative"])
  {
    id v21 = (id)objc_opt_new();
    [v21 setLocale:v20];
    v22 = [MEMORY[0x263EFF910] date];
    v23 = [v21 localizedStringForDate:a1 relativeToDate:v22];

    goto LABEL_17;
  }
  id v21 = objc_alloc_init(MEMORY[0x263F08790]);
  [v21 setTimeZone:v19];
  [v21 setLocale:v20];
  if ([v15 isEqualToString:@"Custom"])
  {
    [v21 setDateFormat:v18];
    v24 = [v20 localeIdentifier];
    if (([v24 hasSuffix:@"_POSIX"] & 1) == 0)
    {
      [NSString stringWithFormat:@"%@_POSIX", v24];
      v25 = id v31 = v17;
      v26 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v25];
      [v21 setLocale:v26];

      id v17 = v31;
    }

    goto LABEL_16;
  }
  if (![v15 isEqualToString:@"RFC 2822"])
  {
    if ([v15 isEqualToString:@"ISO 8601"])
    {
      v29 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
      [v21 setLocale:v29];

      if (a7) {
        v28 = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";
      }
      else {
        v28 = @"yyyy-MM-dd";
      }
      goto LABEL_15;
    }
    uint64_t v32 = 0;
    if ([v15 isEqualToString:@"Relative"])
    {
      [v21 setDoesRelativeDateFormatting:1];
      if ((WFDateFormatterStyleFromStyle(v17, &v32) & 1) == 0)
      {
LABEL_25:
        if (WFDateFormatterStyleFromStyle(v16, &v32)) {
          [v21 setTimeStyle:v32];
        }
        goto LABEL_16;
      }
    }
    else if (!WFDateFormatterStyleFromStyle(v15, &v32))
    {
      goto LABEL_25;
    }
    [v21 setDateStyle:v32];
    goto LABEL_25;
  }
  v27 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v21 setLocale:v27];

  v28 = @"EEE, dd MMM yyyy HH:mm:ss Z";
LABEL_15:
  [v21 setDateFormat:v28];
LABEL_16:
  v23 = [v21 stringFromDate:a1];
LABEL_17:

  return v23;
}

@end
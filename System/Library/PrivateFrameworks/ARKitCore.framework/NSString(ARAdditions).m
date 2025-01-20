@interface NSString(ARAdditions)
+ (id)ar_pathSafeTimestampWithDate:()ARAdditions;
+ (id)ar_timestampWithDate:()ARAdditions;
+ (id)ar_timestampWithDate:()ARAdditions timeZone:locale:;
+ (uint64_t)ar_hoursMinutesSecondsWithTimeInterval:()ARAdditions;
- (id)ar_removePrefix:()ARAdditions;
- (id)ar_removeSuffix:()ARAdditions;
@end

@implementation NSString(ARAdditions)

+ (uint64_t)ar_hoursMinutesSecondsWithTimeInterval:()ARAdditions
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%lu:%02lu:%02lu", (unint64_t)a1 / 0xE10, (unint64_t)a1 % 0xE10 / 0x3C, (unint64_t)a1 % 0xE10 % 0x3C);
}

+ (id)ar_timestampWithDate:()ARAdditions
{
  v4 = (void *)MEMORY[0x1E4F1CAF0];
  id v5 = a3;
  v6 = [v4 systemTimeZone];
  v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  v8 = objc_msgSend(a1, "ar_timestampWithDate:timeZone:locale:", v5, v6, v7);

  return v8;
}

+ (id)ar_timestampWithDate:()ARAdditions timeZone:locale:
{
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E4F1C9A8];
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    v11 = [v7 currentCalendar];
    [v11 setLocale:v8];
    [v11 setTimeZone:v9];
    v12 = [v11 components:33020 fromDate:v10];
    uint64_t v13 = (uint64_t)rint((double)[v12 nanosecond] / 1000.0);
    v14 = objc_opt_new();
    [v14 setDateFormat:@"Z"];
    [v14 setLocale:v8];

    [v14 setTimeZone:v9];
    v15 = [v14 stringFromDate:v10];

    v16 = [a1 stringWithFormat:@"%04ld-%02ld-%02ld %02ld:%02ld:%02ld.%06ld %@", objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day"), objc_msgSend(v12, "hour"), objc_msgSend(v12, "minute"), objc_msgSend(v12, "second"), v13, v15];
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)ar_pathSafeTimestampWithDate:()ARAdditions
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

- (id)ar_removePrefix:()ARAdditions
{
  id v4 = a3;
  if ([a1 hasPrefix:v4])
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (id)ar_removeSuffix:()ARAdditions
{
  id v4 = a3;
  if ([a1 hasSuffix:v4])
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }
  v6 = v5;

  return v6;
}

@end
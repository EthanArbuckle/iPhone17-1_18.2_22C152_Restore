@interface NSDateComponents(Suggestions)
+ (id)sg_dateComponentsFromISO8601String:()Suggestions;
@end

@implementation NSDateComponents(Suggestions)

+ (id)sg_dateComponentsFromISO8601String:()Suggestions
{
  v3 = &stru_1F24EEF20;
  if (a3) {
    v3 = a3;
  }
  v4 = v3;
  memset(&v23, 0, sizeof(v23));
  v5 = objc_opt_new();
  v6 = v4;
  v7 = strptime_l((const char *)[(__CFString *)v6 UTF8String], "%FT%H:%M:%S", &v23, 0);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1CB79B230]();
    v10 = [NSString stringWithUTF8String:v8];
    if (([v10 isEqualToString:&stru_1F24EEF20] & 1) == 0)
    {
      if ([v10 characterAtIndex:0] == 90)
      {
        v11 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
        [v5 setTimeZone:v11];
      }
      else
      {
        if ([v10 length] == 6)
        {
          v12 = [v10 substringToIndex:3];
          v13 = [v10 substringFromIndex:4];
          uint64_t v14 = [v12 stringByAppendingString:v13];

          v10 = (void *)v14;
        }
        if (objc_msgSend(v10, "length", *(void *)&v23.tm_sec) == 3)
        {
          uint64_t v15 = [v10 stringByAppendingString:@"00"];

          v10 = (void *)v15;
        }
        if ([v10 length] != 5) {
          goto LABEL_16;
        }
        v16 = [v10 substringToIndex:3];
        uint64_t v17 = [v16 integerValue];

        v18 = [v10 substringToIndex:1];
        v19 = [v10 substringFromIndex:3];
        v11 = [v18 stringByAppendingString:v19];

        uint64_t v20 = [v11 integerValue];
        v21 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:60 * (v20 + 60 * v17)];
        [v5 setTimeZone:v21];
      }
    }
LABEL_16:
    objc_msgSend(v5, "setHour:", v23.tm_hour, *(void *)&v23.tm_sec);
    [v5 setMinute:v23.tm_min];
    [v5 setSecond:v23.tm_sec];

    goto LABEL_17;
  }
  memset(&v23, 0, sizeof(v23));
  if (!strptime_l((const char *)[(__CFString *)v6 UTF8String], "%F", &v23, 0))
  {

    v5 = 0;
    goto LABEL_18;
  }
LABEL_17:
  [v5 setYear:v23.tm_year + 1900];
  [v5 setMonth:v23.tm_mon + 1];
  [v5 setDay:v23.tm_mday];
LABEL_18:

  return v5;
}

@end
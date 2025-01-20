@interface NSDate(InternetDateTime)
+ (id)dateFromInternetDateTimeString:()InternetDateTime formatHint:;
+ (id)dateFromRFC3339String:()InternetDateTime;
+ (id)dateFromRFC822String:()InternetDateTime;
+ (id)internetDateTimeFormatter;
@end

@implementation NSDate(InternetDateTime)

+ (id)dateFromRFC3339String:()InternetDateTime
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263EFF910] internetDateTimeFormatter];
    objc_sync_enter(v4);
    v5 = [NSString stringWithString:v3];
    v6 = [v5 uppercaseString];

    v7 = [v6 stringByReplacingOccurrencesOfString:@"Z" withString:@"-0000"];

    if ((unint64_t)[v7 length] >= 0x15)
    {
      uint64_t v8 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", @":", &stru_26F008428, 0, 20, objc_msgSend(v7, "length") - 20);

      v7 = (void *)v8;
    }
    [v4 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"];
    v9 = [v4 dateFromString:v7];
    if (!v9)
    {
      [v4 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ"];
      v9 = [v4 dateFromString:v7];
      if (!v9)
      {
        [v4 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss"];
        v9 = [v4 dateFromString:v7];
        if (!v9)
        {
          NSLog(&cfstr_CouldNotParseR_0.isa, v3);
          v9 = 0;
        }
      }
    }

    objc_sync_exit(v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)dateFromRFC822String:()InternetDateTime
{
  id v3 = a3;
  if (!v3)
  {
    v7 = 0;
    goto LABEL_15;
  }
  id v4 = [MEMORY[0x263EFF910] internetDateTimeFormatter];
  objc_sync_enter(v4);
  v5 = [NSString stringWithString:v3];
  v6 = [v5 uppercaseString];

  if ([v6 rangeOfString:@","] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setDateFormat:@"d MMM yyyy HH:mm:ss zzz"];
    v7 = [v4 dateFromString:v6];
    if (!v7)
    {
      [v4 setDateFormat:@"d MMM yyyy HH:mm zzz"];
      v7 = [v4 dateFromString:v6];
      if (!v7)
      {
        [v4 setDateFormat:@"d MMM yyyy HH:mm:ss"];
        v7 = [v4 dateFromString:v6];
        if (!v7)
        {
          uint64_t v8 = @"d MMM yyyy HH:mm";
          goto LABEL_12;
        }
      }
    }
  }
  else
  {
    [v4 setDateFormat:@"EEE, d MMM yyyy HH:mm:ss zzz"];
    v7 = [v4 dateFromString:v6];
    if (!v7)
    {
      [v4 setDateFormat:@"EEE, d MMM yyyy HH:mm zzz"];
      v7 = [v4 dateFromString:v6];
      if (!v7)
      {
        [v4 setDateFormat:@"EEE, d MMM yyyy HH:mm:ss"];
        v7 = [v4 dateFromString:v6];
        if (!v7)
        {
          uint64_t v8 = @"EEE, d MMM yyyy HH:mm";
LABEL_12:
          [v4 setDateFormat:v8];
          v7 = [v4 dateFromString:v6];
          if (!v7)
          {
            NSLog(&cfstr_CouldNotParseR.isa, v3);
            v7 = 0;
          }
        }
      }
    }
  }

  objc_sync_exit(v4);
LABEL_15:

  return v7;
}

+ (id)dateFromInternetDateTimeString:()InternetDateTime formatHint:
{
  id v5 = a3;
  if (!v5)
  {
    v6 = 0;
    goto LABEL_9;
  }
  if (a4 == 2)
  {
    v6 = [MEMORY[0x263EFF910] dateFromRFC3339String:v5];
    if (v6) {
      goto LABEL_9;
    }
    uint64_t v7 = [MEMORY[0x263EFF910] dateFromRFC822String:v5];
  }
  else
  {
    v6 = [MEMORY[0x263EFF910] dateFromRFC822String:v5];
    if (v6) {
      goto LABEL_9;
    }
    uint64_t v7 = [MEMORY[0x263EFF910] dateFromRFC3339String:v5];
  }
  v6 = (void *)v7;
LABEL_9:

  return v6;
}

+ (id)internetDateTimeFormatter
{
  id v1 = a1;
  objc_sync_enter(v1);
  if (!_internetDateTimeFormatter)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    id v3 = objc_alloc_init(MEMORY[0x263F08790]);
    id v4 = (void *)_internetDateTimeFormatter;
    _internetDateTimeFormatter = (uint64_t)v3;

    [(id)_internetDateTimeFormatter setLocale:v2];
    id v5 = (void *)_internetDateTimeFormatter;
    v6 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [v5 setTimeZone:v6];
  }
  objc_sync_exit(v1);

  uint64_t v7 = (void *)_internetDateTimeFormatter;
  return v7;
}

@end
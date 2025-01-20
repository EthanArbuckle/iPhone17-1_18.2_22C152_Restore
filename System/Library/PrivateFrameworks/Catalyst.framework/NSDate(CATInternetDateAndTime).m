@interface NSDate(CATInternetDateAndTime)
+ (id)cat_RFC3339Formatters;
+ (id)cat_dateWithInternetTimeString:()CATInternetDateAndTime;
- (id)cat_internetTimeString;
@end

@implementation NSDate(CATInternetDateAndTime)

+ (id)cat_RFC3339Formatters
{
  if (cat_RFC3339Formatters_onceToken != -1) {
    dispatch_once(&cat_RFC3339Formatters_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)cat_RFC3339Formatters_RFC3339DateFormatters;

  return v0;
}

+ (id)cat_dateWithInternetTimeString:()CATInternetDateAndTime
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = objc_msgSend(MEMORY[0x263EFF910], "cat_RFC3339Formatters", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) dateFromString:v3];
          if (v9)
          {
            v10 = (void *)v9;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    v10 = 0;
LABEL_12:
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)cat_internetTimeString
{
  v2 = objc_msgSend(MEMORY[0x263EFF910], "cat_RFC3339Formatters");
  id v3 = [v2 firstObject];
  v4 = [v3 stringFromDate:a1];

  return v4;
}

@end
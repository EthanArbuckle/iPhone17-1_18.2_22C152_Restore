@interface NSDateFormatter(AppleAccountUI)
+ (id)monthYearStringFromDate:()AppleAccountUI calendar:;
@end

@implementation NSDateFormatter(AppleAccountUI)

+ (id)monthYearStringFromDate:()AppleAccountUI calendar:
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x263F08790];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v9 = [MEMORY[0x263EFF960] currentLocale];
  v10 = [v5 calendarIdentifier];

  if (v10)
  {
    [v8 setCalendar:v5];
    v11 = [MEMORY[0x263EFF960] currentLocale];
    v12 = [v11 objectForKey:*MEMORY[0x263EFF500]];

    v13 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v12];
    v14 = (void *)[v13 mutableCopy];

    v15 = [v14 allKeys];
    v16 = (__CFString *)*MEMORY[0x263EFF4B8];
    int v17 = [v15 containsObject:*MEMORY[0x263EFF4B8]];

    v18 = [v5 calendarIdentifier];
    if (v17)
    {
      v19 = v14;
      v20 = v18;
      v21 = v16;
    }
    else
    {
      v21 = @"calendar";
      v19 = v14;
      v20 = v18;
    }
    [v19 setObject:v20 forKeyedSubscript:v21];

    v22 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v14];
    uint64_t v23 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v22];

    v9 = (void *)v23;
  }
  v24 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"MMyyyy" options:0 locale:v9];
  [v8 setDateFormat:v24];
  v25 = [v8 stringFromDate:v7];

  return v25;
}

@end
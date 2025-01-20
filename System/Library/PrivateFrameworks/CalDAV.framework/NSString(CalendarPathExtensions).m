@interface NSString(CalendarPathExtensions)
+ (id)stringWithContentsOfFile:()CalendarPathExtensions usingEncoding:;
@end

@implementation NSString(CalendarPathExtensions)

+ (id)stringWithContentsOfFile:()CalendarPathExtensions usingEncoding:
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5];
  if (v6)
  {
    v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v6 encoding:a4];
  }
  else
  {
    v8 = [MEMORY[0x263F34B30] sharedLogging];
    v9 = [v8 logHandleForAccountInfoProvider:0];
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_213CEC000, v10, OS_LOG_TYPE_ERROR, "unable to read data at path : %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

@end
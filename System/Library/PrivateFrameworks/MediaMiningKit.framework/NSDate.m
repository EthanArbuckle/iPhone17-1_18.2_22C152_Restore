@interface NSDate
@end

@implementation NSDate

uint64_t __56__NSDate_CLSNSDateExtensions__dateComponentsFromString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)dateComponentsFromString__formatter1;
  dateComponentsFromString__formatter1 = (uint64_t)v0;

  v2 = (void *)dateComponentsFromString__formatter1;
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v2 setLocale:v3];

  [(id)dateComponentsFromString__formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v5 = (void *)dateComponentsFromString__formatter2;
  dateComponentsFromString__formatter2 = (uint64_t)v4;

  v6 = (void *)dateComponentsFromString__formatter2;
  v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v6 setLocale:v7];

  [(id)dateComponentsFromString__formatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v9 = (void *)dateComponentsFromString__formatter3;
  dateComponentsFromString__formatter3 = (uint64_t)v8;

  v10 = (void *)dateComponentsFromString__formatter3;
  v11 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v10 setLocale:v11];

  [(id)dateComponentsFromString__formatter3 setDateFormat:@"yyyy-MM-dd"];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v13 = (void *)dateComponentsFromString__formatter4;
  dateComponentsFromString__formatter4 = (uint64_t)v12;

  v14 = (void *)dateComponentsFromString__formatter4;
  v15 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v14 setLocale:v15];

  [(id)dateComponentsFromString__formatter4 setDateFormat:@"HH:mm:ss"];
  id v16 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v17 = (void *)dateComponentsFromString__formatter5;
  dateComponentsFromString__formatter5 = (uint64_t)v16;

  v18 = (void *)dateComponentsFromString__formatter5;
  v19 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v18 setLocale:v19];

  [(id)dateComponentsFromString__formatter5 setDateFormat:@"HH:mm"];
  id v20 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  dateComponentsFromString__calendar = [v20 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  return MEMORY[0x1F41817F8]();
}

uint64_t __46__NSDate_CLSNSDateExtensions__dateFromString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)dateFromString__formatter1;
  dateFromString__formatter1 = (uint64_t)v0;

  v2 = (void *)dateFromString__formatter1;
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v2 setLocale:v3];

  [(id)dateFromString__formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v5 = (void *)dateFromString__formatter2;
  dateFromString__formatter2 = (uint64_t)v4;

  v6 = (void *)dateFromString__formatter2;
  v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v6 setLocale:v7];

  [(id)dateFromString__formatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v9 = (void *)dateFromString__formatter3;
  dateFromString__formatter3 = (uint64_t)v8;

  v10 = (void *)dateFromString__formatter3;
  v11 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v10 setLocale:v11];

  [(id)dateFromString__formatter3 setDateFormat:@"yyyy-MM-dd"];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v13 = (void *)dateFromString__formatter4;
  dateFromString__formatter4 = (uint64_t)v12;

  v14 = (void *)dateFromString__formatter4;
  v15 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v14 setLocale:v15];

  [(id)dateFromString__formatter4 setDateFormat:@"HH:mm:ss"];
  id v16 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v17 = (void *)dateFromString__formatter5;
  dateFromString__formatter5 = (uint64_t)v16;

  v18 = (void *)dateFromString__formatter5;
  v19 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v18 setLocale:v19];

  [(id)dateFromString__formatter5 setDateFormat:@"HH:mm"];
  id v20 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  dateFromString__calendar = [v20 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  return MEMORY[0x1F41817F8]();
}

@end
@interface MFTimezoneHelper
+ (id)citiesMatchingName:(id)a3;
+ (id)cityForTimeZone:(id)a3;
+ (id)log;
@end

@implementation MFTimezoneHelper

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MFTimezoneHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1) {
    dispatch_once(&log_onceToken_12, block);
  }
  v2 = (void *)log_log_12;

  return v2;
}

void __23__MFTimezoneHelper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_12;
  log_log_12 = (uint64_t)v1;
}

+ (id)cityForTimeZone:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F4BE38] sharedManager];
  v5 = [v4 defaultCityForTimeZone:v3];

  if (v5)
  {
    v6 = [MFCity alloc];
    v7 = [v5 displayNameIncludingCountry:0];
    v8 = [v5 displayNameIncludingCountry:1];
    v9 = [(MFCity *)v6 initWithCityName:v7 displayName:v8 timeZone:v3];
  }
  else
  {
    v10 = +[MFTimezoneHelper log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MFTimezoneHelper cityForTimeZone:]((uint64_t)v3, v10);
    }

    v9 = 0;
  }

  return v9;
}

+ (id)citiesMatchingName:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F4BE38] sharedManager];
  v5 = [v4 citiesMatchingName:v3];
  v6 = objc_msgSend(v5, "ef_map:", &__block_literal_global_36);

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  v8 = [v7 allObjects];
  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_9];

  return v9;
}

MFCity *__39__MFTimezoneHelper_citiesMatchingName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MFCity alloc];
  v4 = [v2 displayNameIncludingCountry:0];
  v5 = [v2 displayNameIncludingCountry:1];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAF0]);
  v7 = [v2 timeZone];
  v8 = (void *)[v6 initWithName:v7];
  v9 = [(MFCity *)v3 initWithCityName:v4 displayName:v5 timeZone:v8];

  return v9;
}

uint64_t __39__MFTimezoneHelper_citiesMatchingName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 displayName];
  id v6 = [v4 displayName];
  uint64_t v7 = [v5 localizedStandardCompare:v6];

  return v7;
}

+ (void)cityForTimeZone:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "The city for a time zone (%{public}@) does not exist.", (uint8_t *)&v2, 0xCu);
}

@end
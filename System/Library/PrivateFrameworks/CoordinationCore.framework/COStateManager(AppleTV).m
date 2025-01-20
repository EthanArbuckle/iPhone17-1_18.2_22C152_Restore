@interface COStateManager(AppleTV)
+ (id)appleTV_COStateManagerWithSuiteName:()AppleTV clusters:homeIdentifier:;
@end

@implementation COStateManager(AppleTV)

+ (id)appleTV_COStateManagerWithSuiteName:()AppleTV clusters:homeIdentifier:
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] == 1 && objc_msgSend(v6, "containsObject:", *MEMORY[0x263F33DB0]))
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F33FA8]) initWithSuiteName:v5 clusters:v6];
    v8 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      v11 = v7;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "Creating an AppleTV COStateManager instance %p", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v8 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[COStateManager(AppleTV) appleTV_COStateManagerWithSuiteName:clusters:homeIdentifier:]((uint64_t)v6, v8);
    }
    v7 = 0;
  }

  return v7;
}

+ (void)appleTV_COStateManagerWithSuiteName:()AppleTV clusters:homeIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "Failed to create an Apple TV COStateManager instance. Invalid clusters provided %@", (uint8_t *)&v2, 0xCu);
}

@end
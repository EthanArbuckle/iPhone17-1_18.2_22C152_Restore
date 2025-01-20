@interface NLRouterCacheManager
+ (void)deleteAll;
@end

@implementation NLRouterCacheManager

+ (void)deleteAll
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingString:@"/Library/Assistant/LLMCache/NLRouter"];

  v4 = [MEMORY[0x263F08850] defaultManager];
  if (([v4 removeItemAtPath:v3 error:0] & 1) == 0)
  {
    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "+[NLRouterCacheManager deleteAll]";
      __int16 v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to delete LLM Cache at directory: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

@end
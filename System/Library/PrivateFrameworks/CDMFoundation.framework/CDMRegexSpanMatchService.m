@interface CDMRegexSpanMatchService
+ (Class)spanMatcherClass;
- (id)setupSpanMatcher:(id)a3;
@end

@implementation CDMRegexSpanMatchService

+ (Class)spanMatcherClass
{
  return (Class)objc_opt_class();
}

- (id)setupSpanMatcher:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [a3 dynamicConfig];
  v4 = [v3 getAssetForFactorName:@"com.apple.siri.nl.voc"];

  v5 = [v4 getAssetPath];
  if (v5)
  {
    v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[CDMRegexSpanMatchService setupSpanMatcher:]";
      __int16 v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s Initializing RegexSpanMatcher from path %@", (uint8_t *)&v9, 0x16u);
    }

    v7 = [[CDMRegexSpanMatcher alloc] initWithCachePath:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
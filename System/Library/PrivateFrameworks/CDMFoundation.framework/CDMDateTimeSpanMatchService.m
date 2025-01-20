@interface CDMDateTimeSpanMatchService
+ (Class)spanMatcherClass;
- (id)setupSpanMatcher:(id)a3;
@end

@implementation CDMDateTimeSpanMatchService

+ (Class)spanMatcherClass
{
  return (Class)objc_opt_class();
}

- (id)setupSpanMatcher:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 dynamicConfig];
    v6 = [v5 languageCode];
    int v17 = 136315394;
    v18 = "-[CDMDateTimeSpanMatchService setupSpanMatcher:]";
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s Initializing CDMDateTimeSpanMatcher for locale %@", (uint8_t *)&v17, 0x16u);
  }
  v7 = [v3 dynamicConfig];
  v8 = [v7 getAssetBundlePathForFactorName:@"com.apple.siri.nl.data_detectors"];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF960]);
    v10 = [v3 dynamicConfig];
    v11 = [v10 languageCode];
    v12 = (void *)[v9 initWithLocaleIdentifier:v11];

    v13 = [CDMDateTimeProtoSpanMatcher alloc];
    v14 = [v8 resourcePath];
    v15 = [(CDMDateTimeProtoSpanMatcher *)v13 initWithDataDetectorPath:v14 locale:v12];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
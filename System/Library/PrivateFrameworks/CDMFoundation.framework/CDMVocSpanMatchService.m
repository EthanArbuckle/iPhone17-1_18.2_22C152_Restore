@interface CDMVocSpanMatchService
+ (Class)spanMatcherClass;
- (BOOL)shouldBeUsedForAsrAlternatives;
- (id)setupSpanMatcher:(id)a3;
@end

@implementation CDMVocSpanMatchService

+ (Class)spanMatcherClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldBeUsedForAsrAlternatives
{
  return 1;
}

- (id)setupSpanMatcher:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [a3 dynamicConfig];
  v4 = [v3 getAssetForFactorName:@"com.apple.siri.nl.voc"];

  v5 = [v4 getAssetPath];
  if (v5)
  {
    v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315394;
      v16 = "-[CDMVocSpanMatchService setupSpanMatcher:]";
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s Initializing VocSpanMatcher from path %@", (uint8_t *)&v15, 0x16u);
    }

    v7 = [v4 getAssetMetadata];
    v8 = v7;
    if (v7
      && ([v7 objectForKeyedSubscript:@"normalizeWords"],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
      v10 = [v8 objectForKeyedSubscript:@"normalizeWords"];
      uint64_t v11 = [v10 BOOLValue];

      v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315394;
        v16 = "-[CDMVocSpanMatchService setupSpanMatcher:]";
        __int16 v17 = 1024;
        LODWORD(v18) = v11;
        _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Voc asset sets normalizeWords to %d", (uint8_t *)&v15, 0x12u);
      }
    }
    else
    {
      v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315138;
        v16 = "-[CDMVocSpanMatchService setupSpanMatcher:]";
        _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Voc asset does not specify normalizeWords configuration", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v11 = 0;
    }

    v13 = [[CDMVocTrieProtoSpanMatcher alloc] initWithVocTriePath:v5 useNormalizedValues:v11];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
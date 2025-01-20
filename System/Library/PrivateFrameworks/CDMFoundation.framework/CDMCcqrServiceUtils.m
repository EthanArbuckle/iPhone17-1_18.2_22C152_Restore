@interface CDMCcqrServiceUtils
+ (BOOL)isNLRouterAssetAvailable;
+ (id)buildQueryRewriteRequest;
+ (id)leftShiftSiriResponse:(id)a3;
@end

@implementation CDMCcqrServiceUtils

+ (BOOL)isNLRouterAssetAvailable
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
    __int16 v22 = 2112;
    v23 = @"en";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Checking NLRouter assets for locale: %@", buf, 0x16u);
  }

  v3 = +[CDMAssetsUtils getCDMAssetsInfoForNLRouterWithLocale:@"en"];
  if (v3)
  {
    v4 = +[CDMAssetsManager getSingletonCDMAssetsManager];
    v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en"];
    if ([v4 shouldReSetupForLocale:@"en" cdmAssetsInfo:v3])
    {
      id v19 = 0;
      [v4 setupForLocale:v5 cdmAssetsInfo:v3 error:&v19];
      v6 = (__CFString *)v19;
      if (v6)
      {
        v7 = v6;
        v8 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
          __int16 v22 = 2112;
          v23 = v7;
          _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s NLRouter CDM assets manager failed to setup with error: %@.", buf, 0x16u);
        }
        goto LABEL_22;
      }
    }
    v7 = [v4 getAssetsByFactorNamesForCDMAssetsInfo:v3 assetDirPath:0 locale:v5];
    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v17 = [(__CFString *)v7 descriptionInStringsFileFormat];
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s AssetPath Info for NLRouter.  %@", buf, 0x16u);
    }
    id v18 = 0;
    char v10 = [v4 areAssetsAvailableForCDMAssetsInfo:v3 factorToAsset:v7 withError:&v18];
    v8 = v18;
    if (v8)
    {
      v11 = CDMOSLoggerForCategory(0);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
LABEL_21:

LABEL_22:
        BOOL v15 = 0;
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
      __int16 v22 = 2112;
      v23 = (__CFString *)v8;
      v12 = "%s NLRouter assets not available due to error %@.";
      v13 = v11;
      uint32_t v14 = 22;
    }
    else
    {
      if (v10)
      {
        BOOL v15 = 1;
LABEL_23:

        goto LABEL_24;
      }
      v11 = CDMOSLoggerForCategory(0);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136315138;
      v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
      v12 = "%s NLRouter assets not available";
      v13 = v11;
      uint32_t v14 = 12;
    }
    _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, v12, buf, v14);
    goto LABEL_21;
  }
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Failed to initialize CDMAssetsInfo for NLRouter. Asset registration failed", buf, 0xCu);
  }
  BOOL v15 = 0;
LABEL_24:

  return v15;
}

+ (id)buildQueryRewriteRequest
{
  v37[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F71ED0]);
  id v3 = objc_alloc_init(MEMORY[0x263F71D78]);
  [v2 setAsrId:v3];

  [v2 setUtterance:@"helloo world"];
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"helloo", 0);
  v5 = +[CDMToken getTokenWith:@"helloo" cleanValue:@"helloo" normalizedValues:v4 isSignificant:1 isWhitespace:0];
  v37[0] = v5;
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @" ", 0);
  v7 = +[CDMToken getTokenWith:@" " cleanValue:@" " normalizedValues:v6 isSignificant:0 isWhitespace:1];
  v37[1] = v7;
  v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"world", 0);
  v9 = +[CDMToken getTokenWith:@"world" cleanValue:@"world" normalizedValues:v8 isSignificant:1 isWhitespace:0];
  v37[2] = v9;
  char v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];
  v11 = (void *)[v10 copy];
  [v2 setNluInternalTokens:v11];

  v12 = (void *)MEMORY[0x263EFFA68];
  v13 = (void *)[MEMORY[0x263EFFA68] copy];
  [v2 setAsrUtteranceTokens:v13];

  [v2 setConfidence:0.0];
  id v14 = objc_alloc_init(MEMORY[0x263F71EC0]);
  id v36 = v2;
  BOOL v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  v16 = (void *)[v15 copy];
  [v14 setOriginalUtterances:v16];

  v17 = (void *)[v12 copy];
  [v14 setSiriResponses:v17];

  [v14 setLocale:@"en_US"];
  [v14 setTap2edit:0];
  [v14 setStartTimestamp:0];
  id v18 = objc_alloc_init(MEMORY[0x263F71ED0]);
  id v19 = objc_alloc_init(MEMORY[0x263F71D78]);
  [v18 setAsrId:v19];

  [v18 setUtterance:@"hello"];
  v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"hello", 0);
  v21 = +[CDMToken getTokenWith:@"hello" cleanValue:@"hello" normalizedValues:v20 isSignificant:1 isWhitespace:0];
  v35 = v21;
  __int16 v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  v23 = (void *)[v22 copy];
  [v18 setNluInternalTokens:v23];

  uint64_t v24 = (void *)[v12 copy];
  [v18 setAsrUtteranceTokens:v24];

  [v18 setConfidence:0.0];
  id v25 = objc_alloc_init(MEMORY[0x263F71EC0]);
  id v34 = v18;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  v27 = (void *)[v26 copy];
  [v25 setOriginalUtterances:v27];

  v28 = (void *)[v12 copy];
  [v25 setSiriResponses:v28];

  [v25 setLocale:@"en_US"];
  [v25 setTap2edit:0];
  [v25 setStartTimestamp:0];
  id v29 = objc_alloc_init(MEMORY[0x263F71EA8]);
  v33[0] = v14;
  v33[1] = v25;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  v31 = (void *)[v30 copy];
  [v29 setOriginalInteractions:v31];

  return v29;
}

+ (id)leftShiftSiriResponse:(id)a3
{
  id v3 = a3;
  v4 = (void *)[v3 copy];
  v5 = [v3 originalInteractions];
  uint64_t v6 = [v5 count];

  uint64_t v7 = v6 - 1;
  if (v6 > 1)
  {
    for (uint64_t i = 1; i != v6; ++i)
    {
      v9 = [v3 originalInteractions];
      char v10 = [v9 objectAtIndexedSubscript:i];
      v11 = [v10 siriResponses];
      v12 = [v4 originalInteractions];
      v13 = [v12 objectAtIndexedSubscript:i - 1];
      [v13 setSiriResponses:v11];
    }
  }
  if (v6 >= 1)
  {
    id v14 = objc_opt_new();
    BOOL v15 = [v4 originalInteractions];
    v16 = [v15 objectAtIndexedSubscript:v7];
    [v16 setSiriResponses:v14];
  }
  return v4;
}

@end
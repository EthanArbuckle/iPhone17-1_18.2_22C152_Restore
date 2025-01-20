@interface CDMUserDefaultsUtils
+ (BOOL)isAttachMDMRSpantoStringPayloadsEnabled;
+ (BOOL)isInsertEmbeddingOutputsToFeatureStoreEnabled;
+ (BOOL)isPrintUSOInSpanEnabled;
+ (BOOL)isSSURequestTimeoutDisabled;
+ (BOOL)isSkipNodeEnabled;
+ (BOOL)isTapToRadarDisabled;
+ (BOOL)isWriteDebugToDiskEnabled;
+ (BOOL)prewarmModels;
+ (BOOL)readUserDefaultForKeyBool:(id)a3 andDefaultValue:(BOOL)a4;
+ (BOOL)shouldUseSwiftBasedGraphRunner;
+ (id)getDefaultCustomAssetsRootPath;
+ (id)getDefaultCustomLogPath;
+ (id)readCustomAssetsRootPath;
+ (id)readCustomLogPath;
+ (id)readUaaPNLAppModelPaths;
+ (id)readUaaPNLCoreModelPath;
+ (id)readUaaPNLSystemConfigPath;
+ (id)readUserDefaultForKeyString:(id)a3 andDefaultValue:(id)a4;
+ (id)readUserDefaultLVCOverride;
+ (id)readUserDefaultPscOverride;
+ (id)readUserDefaultSnlcOverride;
+ (id)userDefaultsCache;
+ (unint64_t)readNLv4MaxNumParses;
+ (unint64_t)readUaaPNLMaxNumParses;
+ (unint64_t)readUserDefaultsValueForKeyUint64:(id)a3 defaultValue:(int64_t)a4;
+ (unsigned)readAsrAlternativeCount:(id)a3;
+ (unsigned)readGraphRunnerMaxConcurrentCount;
+ (unsigned)readNonSiriSelfSampleRate;
+ (unsigned)readXPCCallbackDefaultTimeout;
+ (void)initialize;
@end

@implementation CDMUserDefaultsUtils

+ (BOOL)prewarmModels
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"prewarm models" andDefaultValue:1];
}

+ (unsigned)readNonSiriSelfSampleRate
{
  if (+[CDMPlatformUtils isInternalInstall]) {
    return [a1 readUserDefaultsValueForKeyUint64:@"non siri sample rate" defaultValue:5];
  }
  else {
    return 5;
  }
}

+ (id)readCustomAssetsRootPath
{
  BOOL v2 = +[CDMPlatformUtils isInternalInstall];
  v3 = +[CDMUserDefaultsUtils getDefaultCustomAssetsRootPath];
  if (v2)
  {
    uint64_t v4 = +[CDMUserDefaultsUtils readUserDefaultForKeyString:@"custom assets root path" andDefaultValue:v3];

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)getDefaultCustomAssetsRootPath
{
  return @"/System/Library/PrivateFrameworks/ContinuousDialogManagerService.framework";
}

+ (unsigned)readGraphRunnerMaxConcurrentCount
{
  if (+[CDMPlatformUtils isInternalInstall]) {
    return [a1 readUserDefaultsValueForKeyUint64:@"graph runner max concurrent count" defaultValue:6];
  }
  else {
    return 6;
  }
}

+ (BOOL)isAttachMDMRSpantoStringPayloadsEnabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"attach mdmr spans to string payloads" andDefaultValue:0];
}

+ (BOOL)isPrintUSOInSpanEnabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"UsoInSpan" andDefaultValue:0];
}

+ (BOOL)isTapToRadarDisabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"disable taptoradar" andDefaultValue:0];
}

+ (BOOL)isInsertEmbeddingOutputsToFeatureStoreEnabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"insert embedding outputs to featurestore" andDefaultValue:0];
}

+ (BOOL)isSSURequestTimeoutDisabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"disable ssu request timeout" andDefaultValue:0];
}

+ (BOOL)isSkipNodeEnabled
{
  if (!+[CDMPlatformUtils isInternalInstall]) {
    return 1;
  }
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"enable skip node" andDefaultValue:1];
}

+ (BOOL)shouldUseSwiftBasedGraphRunner
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"swift graph runner" andDefaultValue:0];
}

+ (unsigned)readXPCCallbackDefaultTimeout
{
  if (+[CDMPlatformUtils isInternalInstall]) {
    return [a1 readUserDefaultsValueForKeyUint64:@"xpc callback timeout" defaultValue:2];
  }
  else {
    return 2;
  }
}

+ (unsigned)readAsrAlternativeCount:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.cdm"];
  if (+[CDMPlatformUtils isInternalInstall])
  {
    v5 = [v4 dictionaryForKey:@"asr alternatives count"];
    v6 = CDMOSLoggerForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315906;
      v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
      __int16 v19 = 2112;
      v20 = @"com.apple.siri.cdm";
      __int16 v21 = 2112;
      v22 = @"asr alternatives count";
      __int16 v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s defaults read \"%@\" \"%@\" -> %@", (uint8_t *)&v17, 0x2Au);
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = [&unk_26DA3E6D0 objectForKey:v3];
  v8 = v7;
  if (v5) {
    goto LABEL_7;
  }
  if (v7 && (int)[(__CFString *)v7 intValue] > 0)
  {
    if ((int)[(__CFString *)v8 intValue] < 1)
    {
LABEL_7:
      v9 = [(__CFString *)v5 objectForKey:v3];
      v10 = v9;
      if (v9 && (int)[(__CFString *)v9 intValue] > 0)
      {
        v11 = CDMOSLoggerForCategory(1);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v17 = 136315650;
          v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
          __int16 v19 = 2112;
          v20 = v3;
          __int16 v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s NSUserDefaults found AND locale=%@ found in dict, returning %@", (uint8_t *)&v17, 0x20u);
        }

        unsigned int v12 = [(__CFString *)v10 intValue];
      }
      else
      {
        v13 = CDMOSLoggerForCategory(1);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v17 = 136315650;
          v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
          __int16 v19 = 2112;
          v20 = v3;
          __int16 v21 = 2112;
          v22 = v5;
          _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Returning 1. NSUserDefaults found, BUT locale=%@'s value is invalid in it? %@", (uint8_t *)&v17, 0x20u);
        }

        unsigned int v12 = 1;
      }

      goto LABEL_25;
    }
    v14 = CDMOSLoggerForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315650;
      v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
      __int16 v19 = 2112;
      v20 = v3;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s NSUserDefaults not found. Locale=%@ found in default dict, returning %@", (uint8_t *)&v17, 0x20u);
    }

    unsigned int v12 = [(__CFString *)v8 intValue];
  }
  else
  {
    v15 = CDMOSLoggerForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315650;
      v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
      __int16 v19 = 2112;
      v20 = v3;
      __int16 v21 = 2112;
      v22 = (__CFString *)&unk_26DA3E6D0;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Returning 1. NSUserDefaults not found and locale=%@'s value is invalid in default dict? %@", (uint8_t *)&v17, 0x20u);
    }

    unsigned int v12 = 1;
  }
LABEL_25:

  return v12;
}

+ (BOOL)isWriteDebugToDiskEnabled
{
  BOOL v2 = +[CDMPlatformUtils isInternalInstall];
  if (v2)
  {
    LOBYTE(v2) = +[CDMUserDefaultsUtils readUserDefaultForKeyBool:@"write debug data" andDefaultValue:0];
  }
  return v2;
}

+ (id)readCustomLogPath
{
  BOOL v2 = +[CDMPlatformUtils isInternalInstall];
  v3 = +[CDMUserDefaultsUtils getDefaultCustomLogPath];
  if (v2)
  {
    uint64_t v4 = +[CDMUserDefaultsUtils readUserDefaultForKeyString:@"custom log path" andDefaultValue:v3];

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)getDefaultCustomLogPath
{
  return @"/tmp/";
}

+ (unint64_t)readUaaPNLMaxNumParses
{
  if (!+[CDMPlatformUtils isInternalInstall]) {
    return 3;
  }
  return [a1 readUserDefaultsValueForKeyUint64:@"UaaPNL max num parses" defaultValue:3];
}

+ (unint64_t)readNLv4MaxNumParses
{
  if (!+[CDMPlatformUtils isInternalInstall]) {
    return 1;
  }
  return [a1 readUserDefaultsValueForKeyUint64:@"NLv4 max num parses" defaultValue:1];
}

+ (unint64_t)readUserDefaultsValueForKeyUint64:(id)a3 defaultValue:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[CDMUserDefaultsUtils userDefaultsCache];
  v7 = [v6 objectForKey:v5];

  v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.cdm"];
  uint64_t v9 = [v8 integerForKey:v5];
  uint64_t v10 = v9;
  if (v9 >= 1) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = a4;
  }
  if (!v7 || [v7 integerValue] != v11)
  {
    unsigned int v12 = CDMOSLoggerForCategory(1);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v10 <= 0)
    {
      if (v13)
      {
        int v18 = 136315906;
        __int16 v19 = "+[CDMUserDefaultsUtils readUserDefaultsValueForKeyUint64:defaultValue:]";
        __int16 v20 = 2112;
        __int16 v21 = @"com.apple.siri.cdm";
        __int16 v22 = 2112;
        id v23 = v5;
        __int16 v24 = 2048;
        int64_t v25 = a4;
        v14 = "%s defaults read \"%@\" \"%@\" -> not set (or set to <= 0). Using default: count=%zd";
        goto LABEL_11;
      }
    }
    else if (v13)
    {
      int v18 = 136315906;
      __int16 v19 = "+[CDMUserDefaultsUtils readUserDefaultsValueForKeyUint64:defaultValue:]";
      __int16 v20 = 2112;
      __int16 v21 = @"com.apple.siri.cdm";
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2048;
      int64_t v25 = v10;
      v14 = "%s defaults read \"%@\" \"%@\" -> count=%zd";
LABEL_11:
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v18, 0x2Au);
    }

    v15 = [NSNumber numberWithInteger:v11];
    v16 = +[CDMUserDefaultsUtils userDefaultsCache];
    [v16 setObject:v15 forKeyedSubscript:v5];
  }
  return v11;
}

+ (id)readUserDefaultLVCOverride
{
  if (+[CDMPlatformUtils isInternalInstall])
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.cdm"];
    v3 = [v2 stringForKey:@"LVC override"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)readUserDefaultPscOverride
{
  if (+[CDMPlatformUtils isInternalInstall])
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.cdm"];
    v3 = [v2 stringForKey:@"PSC override"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)readUserDefaultSnlcOverride
{
  if (+[CDMPlatformUtils isInternalInstall])
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.cdm"];
    v3 = [v2 stringForKey:@"SNLC override"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)readUaaPNLSystemConfigPath
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!+[CDMPlatformUtils isInternalInstall])
  {
    v3 = 0;
    goto LABEL_10;
  }
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.internal.ck"];
  v3 = [v2 stringForKey:@"UaaPSystemConfigPath"];
  uint64_t v4 = CDMOSLoggerForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v10 = 136315394;
      unint64_t v11 = "+[CDMUserDefaultsUtils readUaaPNLSystemConfigPath]";
      __int16 v12 = 2112;
      BOOL v13 = v3;
      v6 = "%s UaaP system config path: %@";
      v7 = v4;
      uint32_t v8 = 22;
LABEL_8:
      _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    int v10 = 136315138;
    unint64_t v11 = "+[CDMUserDefaultsUtils readUaaPNLSystemConfigPath]";
    v6 = "%s No UaaP system config path provided via defaults write";
    v7 = v4;
    uint32_t v8 = 12;
    goto LABEL_8;
  }

LABEL_10:
  return v3;
}

+ (id)readUaaPNLCoreModelPath
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!+[CDMPlatformUtils isInternalInstall])
  {
    v3 = 0;
    goto LABEL_10;
  }
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.internal.ck"];
  v3 = [v2 stringForKey:@"UaaPCoreModelPath"];
  uint64_t v4 = CDMOSLoggerForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v10 = 136315394;
      unint64_t v11 = "+[CDMUserDefaultsUtils readUaaPNLCoreModelPath]";
      __int16 v12 = 2112;
      BOOL v13 = v3;
      v6 = "%s UaaP Core model path: %@";
      v7 = v4;
      uint32_t v8 = 22;
LABEL_8:
      _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    int v10 = 136315138;
    unint64_t v11 = "+[CDMUserDefaultsUtils readUaaPNLCoreModelPath]";
    v6 = "%s No UaaP Core model path provided via defaults write";
    v7 = v4;
    uint32_t v8 = 12;
    goto LABEL_8;
  }

LABEL_10:
  return v3;
}

+ (id)readUaaPNLAppModelPaths
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (+[CDMPlatformUtils isInternalInstall])
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.internal.ck"];
    v3 = [v2 objectForKey:@"UaaPModelPaths"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = objc_msgSend(v3, "_cdm_JSONDictionary");
      if (v4)
      {
        BOOL v5 = CDMOSLoggerForCategory(1);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int v7 = 136315394;
          uint32_t v8 = "+[CDMUserDefaultsUtils readUaaPNLAppModelPaths]";
          __int16 v9 = 2112;
          int v10 = v4;
          _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (id)readUserDefaultForKeyString:(id)a3 andDefaultValue:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = +[CDMUserDefaultsUtils userDefaultsCache];
  id v8 = [v7 objectForKey:v5];

  __int16 v9 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.cdm"];
  uint64_t v10 = [v9 stringForKey:v5];
  if (v10)
  {
    id v11 = (id)v10;
    if (v8) {
      BOOL v12 = v8 == (id)v10;
    }
    else {
      BOOL v12 = 0;
    }
    BOOL v13 = v8;
    if (v12) {
      goto LABEL_15;
    }
    uint64_t v14 = CDMOSLoggerForCategory(1);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    int v19 = 136315906;
    __int16 v20 = "+[CDMUserDefaultsUtils readUserDefaultForKeyString:andDefaultValue:]";
    __int16 v21 = 2112;
    __int16 v22 = @"com.apple.siri.cdm";
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 2112;
    id v26 = v11;
    v15 = "%s defaults read \"%@\" \"%@\" -> %@";
    goto LABEL_12;
  }
  id v16 = v6;
  id v11 = v16;
  if (v8 && v8 == v16) {
    goto LABEL_14;
  }
  uint64_t v14 = CDMOSLoggerForCategory(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315906;
    __int16 v20 = "+[CDMUserDefaultsUtils readUserDefaultForKeyString:andDefaultValue:]";
    __int16 v21 = 2112;
    __int16 v22 = @"com.apple.siri.cdm";
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 2112;
    id v26 = v11;
    v15 = "%s defaults read \"%@\" \"%@\" -> not set. Using default value: %@";
LABEL_12:
    _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v19, 0x2Au);
  }
LABEL_13:

  int v17 = +[CDMUserDefaultsUtils userDefaultsCache];
  [v17 setObject:v11 forKeyedSubscript:v5];

LABEL_14:
  BOOL v13 = v11;
LABEL_15:

  return v13;
}

+ (BOOL)readUserDefaultForKeyBool:(id)a3 andDefaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[CDMUserDefaultsUtils userDefaultsCache];
  int v7 = [v6 objectForKey:v5];

  id v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.cdm"];
  uint64_t v9 = [v8 objectForKey:v5];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    if (v7) {
      BOOL v11 = v7 == (void *)v9;
    }
    else {
      BOOL v11 = 0;
    }
    BOOL v12 = v7;
    if (!v11)
    {
      BOOL v13 = CDMOSLoggerForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v20 = 136315906;
        *(void *)&v20[4] = "+[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:]";
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = @"com.apple.siri.cdm";
        *(_WORD *)&v20[22] = 2112;
        id v21 = v5;
        LOWORD(v22) = 2112;
        *(void *)((char *)&v22 + 2) = v10;
        uint64_t v14 = "%s defaults read \"%@\" \"%@\" -> %@";
LABEL_14:
        _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, v14, v20, 0x2Au);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v15 = [NSNumber numberWithBool:v4];
    if (v7) {
      BOOL v16 = v7 == (void *)v15;
    }
    else {
      BOOL v16 = 0;
    }
    BOOL v12 = v7;
    if (!v16)
    {
      uint64_t v10 = (void *)v15;
      BOOL v13 = CDMOSLoggerForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v20 = 136315906;
        *(void *)&v20[4] = "+[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:]";
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = @"com.apple.siri.cdm";
        *(_WORD *)&v20[22] = 2112;
        id v21 = v5;
        LOWORD(v22) = 2112;
        *(void *)((char *)&v22 + 2) = v10;
        uint64_t v14 = "%s defaults read \"%@\" \"%@\" -> not set. Using default value: %@";
        goto LABEL_14;
      }
LABEL_15:

      int v17 = +[CDMUserDefaultsUtils userDefaultsCache];
      [v17 setObject:v10 forKeyedSubscript:v5];

      BOOL v12 = v10;
    }
  }
  char v18 = objc_msgSend(v12, "BOOLValue", *(_OWORD *)v20, *(void *)&v20[16], v21, v22);

  return v18;
}

+ (id)userDefaultsCache
{
  return (id)_userDefaultsCache;
}

+ (void)initialize
{
  _userDefaultsCache = objc_alloc_init(SafeMutableDictionary);
  MEMORY[0x270F9A758]();
}

@end
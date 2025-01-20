@interface NviUtils
+ (BOOL)_createDirAtPath:(id)a3;
+ (BOOL)createDirAtPath:(id)a3;
+ (BOOL)isNviEnabled;
+ (double)getVoiceTriggerEndSecsFromVTEI:(id)a3;
+ (id)getValueFromDictionaryOfDictionaries:(id)a3 keypath:(id)a4;
+ (id)readJsonDictionaryAt:(id)a3;
+ (id)strRepForNviDataSourceType:(unint64_t)a3;
+ (id)strRepForNviSignalMask:(unint64_t)a3;
+ (id)strRepForNviSignalType:(unint64_t)a3;
+ (id)timeStampString;
+ (int64_t)getVoiceTriggerEndSampleCountFromVTEI:(id)a3;
+ (unint64_t)nviDataSourceTypeForStr:(id)a3;
+ (unint64_t)nviSignalTypeForStr:(id)a3;
@end

@implementation NviUtils

+ (BOOL)createDirAtPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;
  if (v6) {
    char v5 = 0;
  }
  if ((v5 & 1) == 0)
  {
    v7 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[NviUtils createDirAtPath:]";
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to create dir at: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

+ (id)getValueFromDictionaryOfDictionaries:(id)a3 keypath:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = v7;
  if ([v6 count] == 1)
  {
LABEL_5:
    __int16 v12 = [v6 lastObject];
    id v13 = [v8 objectForKeyedSubscript:v12];
  }
  else
  {
    unint64_t v9 = 0;
    v10 = v7;
    while (1)
    {
      v11 = [v6 objectAtIndexedSubscript:v9];
      v8 = [v10 objectForKeyedSubscript:v11];

      if (!v8) {
        break;
      }
      ++v9;
      v10 = v8;
      if (v9 >= [v6 count] - 1) {
        goto LABEL_5;
      }
    }
    uint64_t v14 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = [v6 objectAtIndexedSubscript:v9];
      int v18 = 136315650;
      v19 = "+[NviUtils getValueFromDictionaryOfDictionaries:keypath:]";
      __int16 v20 = 2114;
      v21 = v16;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s Could not find <%{public}@> in Keypath=%{public}@", (uint8_t *)&v18, 0x20u);
    }
    id v13 = 0;
  }

  return v13;
}

+ (id)readJsonDictionaryAt:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v18 = 0;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5 isDirectory:&v18];

  if (v18)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NviUtils.m", 213, @"Unexpected!! Received dir for NviConfig: %@", v5 object file lineNumber description];

    if (v7)
    {
LABEL_3:
      id v17 = 0;
      v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5 options:0 error:&v17];
      id v9 = v17;
      if (v9 || !v8)
      {
        v11 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v20 = "+[NviUtils readJsonDictionaryAt:]";
          __int16 v21 = 2114;
          id v22 = v5;
          __int16 v23 = 2114;
          id v24 = v9;
          _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s Could not read Json file at: %{public}@, err: %{public}@", buf, 0x20u);
        }
        v10 = 0;
      }
      else
      {
        id v16 = 0;
        v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v16];
        id v9 = v16;
        if (v9 || !v10)
        {
          __int16 v12 = NviLogContextFacility;
          if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v20 = "+[NviUtils readJsonDictionaryAt:]";
            __int16 v21 = 2114;
            id v22 = v5;
            __int16 v23 = 2114;
            id v24 = v9;
            _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to parse json at: %{public}@, err: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          id v9 = 0;
        }
      }

      goto LABEL_18;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  uint64_t v14 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "+[NviUtils readJsonDictionaryAt:]";
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s Json file doesnt exist at: %{public}@", buf, 0x16u);
  }
  v10 = 0;
LABEL_18:

  return v10;
}

+ (double)getVoiceTriggerEndSecsFromVTEI:(id)a3
{
  id v3 = a3;
  v4 = v3;
  double v5 = -1.0;
  if (v3)
  {
    uint64_t v6 = *MEMORY[0x1E4F5D938];
    char v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5D938]];

    if (v7)
    {
      v8 = [v4 objectForKeyedSubscript:v6];
      [v8 floatValue];
      double v5 = v9;
    }
  }

  return v5;
}

+ (int64_t)getVoiceTriggerEndSampleCountFromVTEI:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3
    && (uint64_t v5 = *MEMORY[0x1E4F5D930],
        [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5D930]],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    char v7 = [v4 objectForKeyedSubscript:v5];
    int64_t v8 = [v7 integerValue];
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd_HHmmss.SSS"];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v2 stringFromDate:v4];

  return v5;
}

+ (BOOL)_createDirAtPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;
  if (v6) {
    char v5 = 0;
  }
  if ((v5 & 1) == 0)
  {
    char v7 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[NviUtils _createDirAtPath:]";
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to create dir at: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

+ (unint64_t)nviDataSourceTypeForStr:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"NviAudioDataSrcType"])
  {
    unint64_t v4 = 0;
  }
  else
  {
    char v5 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      int64_t v8 = "+[NviUtils nviDataSourceTypeForStr:]";
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Unknown DataSrcTypeStr(%{public}@)", (uint8_t *)&v7, 0x16u);
    }
    unint64_t v4 = 1;
  }

  return v4;
}

+ (id)strRepForNviDataSourceType:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return @"NviAudioDataSrcType";
  }
  unint64_t v4 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "+[NviUtils strRepForNviDataSourceType:]";
    __int16 v8 = 2050;
    unint64_t v9 = a3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Unknown DataSrc Type: %{public}lu", (uint8_t *)&v6, 0x16u);
  }
  return @"NviDataSource_END_MARKER";
}

+ (unint64_t)nviSignalTypeForStr:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"NviVADSignalType"])
  {
    unint64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"NviKwdSignalType"])
  {
    unint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"NviDirectionalitySignalType"])
  {
    unint64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"NviAsdAnchorSignalType"])
  {
    unint64_t v6 = 8;
  }
  else if ([v5 isEqualToString:@"NviAsdPayloadSignalType"])
  {
    unint64_t v6 = 16;
  }
  else
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"NviUtils.m", 144, @"Unknown NviSignalTypeString: <%@>", v5 object file lineNumber description];

    unint64_t v6 = -1;
  }

  return v6;
}

+ (id)strRepForNviSignalMask:(unint64_t)a3
{
  unsigned int v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F28E78] string];
  for (uint64_t i = 0; i != 5; ++i)
  {
    unint64_t v6 = +[NviUtils strRepForNviSignalType:(1 << i) & v3];
    [v4 appendFormat:@"|%@", v6];
  }
  [v4 appendString:@"|"];
  return v4;
}

+ (id)strRepForNviSignalType:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id result = @"NviVADSignalType";
  switch(a3)
  {
    case 1uLL:
      return result;
    case 2uLL:
      id result = @"NviKwdSignalType";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      id result = @"NviDirectionalitySignalType";
      break;
    case 8uLL:
      id result = @"NviAsdAnchorSignalType";
      break;
    default:
      if (a3 == 16)
      {
        id result = @"NviAsdPayloadSignalType";
      }
      else
      {
LABEL_5:
        id v5 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 136315394;
          int v7 = "+[NviUtils strRepForNviSignalType:]";
          __int16 v8 = 2048;
          unint64_t v9 = a3;
          _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s WARN: Invalid sigType: %lu", (uint8_t *)&v6, 0x16u);
        }
        id result = 0;
      }
      break;
  }
  return result;
}

+ (BOOL)isNviEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IsNviEnabled", @"com.apple.nvi", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

@end
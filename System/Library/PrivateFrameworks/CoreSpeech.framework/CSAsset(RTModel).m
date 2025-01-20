@interface CSAsset(RTModel)
+ (uint64_t)supportsMultiPhraseVoiceTriggerForEngineVersion:()RTModel engineMinorVersion:accessoryRTModelType:;
- (CSVoiceTriggerRTModel)_buildRTModelWithBlobConfig:()RTModel requestOptions:;
- (CSVoiceTriggerRTModel)createRTModelWithLocale:()RTModel;
- (__CFString)_userSelectedPhraseTypeToRTModelPhraseType:()RTModel;
- (id)RTModelWithFallbackLanguage:()RTModel;
- (id)_getFilteredAccessoryRTBlobListForRequestOptions:()RTModel accessoryBlobs:forceSkipEngineVersionCheck:;
- (id)_rtModelWithRequestOptions:()RTModel accessoryBlobs:;
- (id)_sha1:()RTModel;
- (id)_sha256:()RTModel;
- (id)_splitBlobsByPhraseType:()RTModel;
- (id)latestHearstRTModelWithRequestOptions:()RTModel;
- (id)localeMapWithName:()RTModel;
- (id)rtModelLocaleMapWithModelType:()RTModel;
- (id)rtModelWithRequestOptions:()RTModel;
- (uint64_t)_allowMultiPhrase:()RTModel forceSkipEngineVersionCheck:;
- (uint64_t)hearstRTModelLocaleMap;
- (uint64_t)jarvisRTModelLocaleMap;
- (uint64_t)remoraRTModelLocaleMap;
@end

@implementation CSAsset(RTModel)

- (__CFString)_userSelectedPhraseTypeToRTModelPhraseType:()RTModel
{
  if ([a3 unsignedIntegerValue] == 1) {
    return @"HSJS";
  }
  else {
    return @"HSOnly";
  }
}

- (uint64_t)_allowMultiPhrase:()RTModel forceSkipEngineVersionCheck:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  v6 = [v5 accessoryInfo];
  int v7 = [v6 supportsJustSiri];

  v8 = [v5 engineMajorVersion];
  int v9 = [v8 unsignedIntValue];

  v10 = [v5 engineMinorVersion];
  int v11 = [v10 unsignedIntValue];

  if (v9) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (a4) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  unsigned int v15 = [v5 allowMph];

  uint64_t v16 = v7 & v14 & v15;
  v17 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316162;
    v20 = "-[CSAsset(RTModel) _allowMultiPhrase:forceSkipEngineVersionCheck:]";
    __int16 v21 = 1024;
    int v22 = v7 & v14 & v15;
    __int16 v23 = 1024;
    int v24 = v7;
    __int16 v25 = 1024;
    int v26 = v14;
    __int16 v27 = 1024;
    unsigned int v28 = v15;
    _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s Multi-phrase keyword detection (%d): Accessory supports multi-phrase: %d, engine support multi-phrase: %d, device allows multi-phrase: %d", (uint8_t *)&v19, 0x24u);
  }
  return v16;
}

- (id)_rtModelWithRequestOptions:()RTModel accessoryBlobs:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [a1 _getFilteredAccessoryRTBlobListForRequestOptions:v6 accessoryBlobs:a4 forceSkipEngineVersionCheck:0];
  v8 = [v6 engineMajorVersion];
  int v9 = [v8 unsignedIntValue];

  v10 = [v6 engineMinorVersion];
  unsigned int v11 = [v10 unsignedIntValue];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int v24 = a1;
    id v25 = v6;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v17 = [v16 objectForKeyedSubscript:@"majorVersion"];
        int v18 = [v17 unsignedIntValue];

        int v19 = [v16 objectForKeyedSubscript:@"minorVersion"];
        unsigned int v20 = [v19 unsignedIntValue];

        if (v18 == v9 && v11 >= v20)
        {
          id v6 = v25;
          int v22 = [v24 _buildRTModelWithBlobConfig:v16 requestOptions:v25];
          goto LABEL_15;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    int v22 = 0;
    id v6 = v25;
  }
  else
  {
    int v22 = 0;
  }
LABEL_15:

  return v22;
}

- (id)_getFilteredAccessoryRTBlobListForRequestOptions:()RTModel accessoryBlobs:forceSkipEngineVersionCheck:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [a1 _splitBlobsByPhraseType:a4];
  v10 = [v8 userSelectedPhraseType];
  unsigned int v11 = [a1 _userSelectedPhraseTypeToRTModelPhraseType:v10];

  char v12 = [a1 _allowMultiPhrase:v8 forceSkipEngineVersionCheck:a5];
  uint64_t v13 = (NSObject **)MEMORY[0x1E4F5D180];
  if (v12)
  {
    if (!v11)
    {
      uint64_t v14 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    unsigned int v15 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      int v19 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
      __int16 v20 = 1024;
      *(_DWORD *)__int16 v21 = 0;
      *(_WORD *)&v21[4] = 2112;
      *(void *)&v21[6] = v8;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s Falling back to HSOnly phrase - Multi-phrase allowed: %d, request options: %@", (uint8_t *)&v18, 0x1Cu);
    }

    unsigned int v11 = @"HSOnly";
  }
  uint64_t v14 = [v9 objectForKeyedSubscript:v11];
LABEL_8:
  uint64_t v16 = *v13;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315651;
    int v19 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
    __int16 v20 = 2113;
    *(void *)__int16 v21 = v11;
    *(_WORD *)&v21[8] = 2113;
    *(void *)&v21[10] = v14;
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_INFO, "%s Selected phrase type: %{private}@ accessory RTBlobs: %{private}@", (uint8_t *)&v18, 0x20u);
  }

  return v14;
}

- (id)_splitBlobsByPhraseType:()RTModel
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"phraseType"];
        char v12 = (void *)v11;
        if (v11) {
          uint64_t v13 = (__CFString *)v11;
        }
        else {
          uint64_t v13 = @"HSOnly";
        }
        uint64_t v14 = v13;

        id v15 = [v4 objectForKey:v14];
        if (!v15)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v4 setObject:v15 forKey:v14];
        }
        [v15 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  uint64_t v16 = [v4 allKeys];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        uint64_t v22 = [v4 objectForKeyedSubscript:v21];
        id v23 = (id)[v22 sortedArrayUsingComparator:&__block_literal_global_67_8698];

        if (v23) {
          [v4 setObject:v23 forKeyedSubscript:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  return v4;
}

- (CSVoiceTriggerRTModel)_buildRTModelWithBlobConfig:()RTModel requestOptions:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"blob"];
  if (v8)
  {
    int v9 = [a1 resourcePath];
    v10 = [v9 stringByAppendingPathComponent:v8];

    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v12 = [v11 fileExistsAtPath:v10];

    uint64_t v13 = (os_log_t *)MEMORY[0x1E4F5D180];
    uint64_t v14 = *MEMORY[0x1E4F5D180];
    id v15 = *MEMORY[0x1E4F5D180];
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v44 = 2114;
        v45 = v10;
        _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s Reading blob from : %{public}@", buf, 0x16u);
      }
      uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v10];
      if (v16)
      {
        uint64_t v17 = [a1 _sha1:v16];
        v41 = objc_msgSend(v17, "substringWithRange:", 0, 20);

        v40 = [a1 _sha256:v16];
        uint64_t v18 = [v6 objectForKeyedSubscript:@"signature"];
        v39 = (void *)v18;
        if (v18)
        {
          uint64_t v19 = v18;
          __int16 v20 = [a1 resourcePath];
          uint64_t v21 = [v20 stringByAppendingPathComponent:v19];

          uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v23 = [v22 fileExistsAtPath:v21];

          if (v23)
          {
            v38 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v21];
          }
          else
          {
            v38 = 0;
          }
        }
        else
        {
          v38 = 0;
        }
        uint64_t v27 = [v6 objectForKeyedSubscript:@"cert"];
        v37 = (void *)v27;
        if (v27)
        {
          uint64_t v28 = v27;
          long long v29 = objc_msgSend(a1, "resourcePath", v27);
          long long v30 = [v29 stringByAppendingPathComponent:v28];

          long long v31 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v32 = [v31 fileExistsAtPath:v30];

          if (v32)
          {
            v33 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v30];
          }
          else
          {
            v33 = 0;
          }
        }
        else
        {
          v33 = 0;
        }
        v34 = [CSVoiceTriggerRTModel alloc];
        uint64_t v35 = [v7 siriLocale];
        long long v25 = [(CSVoiceTriggerRTModel *)v34 initWithData:v16 hash:v41 locale:v35 digest:v40 signature:v38 certificate:v33];
      }
      else
      {
        long long v26 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
          __int16 v44 = 2114;
          v45 = v10;
          _os_log_error_impl(&dword_1C9338000, v26, OS_LOG_TYPE_ERROR, "%s Blob is nil : %{public}@", buf, 0x16u);
        }
        long long v25 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v44 = 2114;
        v45 = v10;
        _os_log_error_impl(&dword_1C9338000, v14, OS_LOG_TYPE_ERROR, "%s blob file is not exists at %{public}@", buf, 0x16u);
      }
      long long v25 = 0;
    }
  }
  else
  {
    int v24 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
      _os_log_error_impl(&dword_1C9338000, v24, OS_LOG_TYPE_ERROR, "%s blob file name is not exists", buf, 0xCu);
    }
    long long v25 = 0;
  }

  return v25;
}

- (id)_sha256:()RTModel
{
  id v3 = (void *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  id v5 = [v3 dataWithLength:32];
  id v6 = v4;
  id v7 = (const void *)[v6 bytes];
  CC_LONG v8 = [v6 length];

  id v9 = v5;
  CC_SHA256(v7, v8, (unsigned __int8 *)[v9 mutableBytes]);
  return v9;
}

- (id)_sha1:()RTModel
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CC_SHA1((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  id v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

- (id)localeMapWithName:()RTModel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 dictionary];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [a1 dictionary];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];
    if (v8)
    {
      id v9 = (void *)v8;
      v10 = [a1 dictionary];
      uint64_t v11 = [v10 objectForKeyedSubscript:v4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v13 = [a1 dictionary];
        uint64_t v14 = [v13 objectForKeyedSubscript:v4];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v15 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v17 = 136315394;
    uint64_t v18 = "-[CSAsset(RTModel) localeMapWithName:]";
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_1C9338000, v15, OS_LOG_TYPE_ERROR, "%s Locale map for %{public}@ is not available on asset", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v14 = 0;
LABEL_9:

  return v14;
}

- (id)rtModelLocaleMapWithModelType:()RTModel
{
  if (a3 == 1) {
    [a1 remoraRTModelLocaleMap];
  }
  else {
  id v3 = [a1 hearstRTModelLocaleMap];
  }
  return v3;
}

- (uint64_t)remoraRTModelLocaleMap
{
  return [a1 localeMapWithName:@"adklocalemap"];
}

- (uint64_t)jarvisRTModelLocaleMap
{
  return [a1 localeMapWithName:@"jarvislocalemap"];
}

- (uint64_t)hearstRTModelLocaleMap
{
  return [a1 localeMapWithName:@"rtlocalemap"];
}

- (id)rtModelWithRequestOptions:()RTModel
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 accessoryModelType];
  uint64_t v6 = [v5 integerValue];

  if (v6) {
    id v7 = @"adkblobs";
  }
  else {
    id v7 = @"rtblobs";
  }
  uint64_t v8 = [a1 dictionary];
  if (!v8) {
    goto LABEL_7;
  }
  id v9 = (void *)v8;
  v10 = [a1 dictionary];
  uint64_t v11 = [v10 objectForKeyedSubscript:v7];

  if (v11)
  {
    char v12 = [a1 dictionary];
    uint64_t v13 = [v12 objectForKeyedSubscript:v7];

    uint64_t v14 = [a1 _rtModelWithRequestOptions:v4 accessoryBlobs:v13];
  }
  else
  {
LABEL_7:
    id v15 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[CSAsset(RTModel) rtModelWithRequestOptions:]";
      _os_log_error_impl(&dword_1C9338000, v15, OS_LOG_TYPE_ERROR, "%s corespeech.json doesn't contains rtblobs", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)latestHearstRTModelWithRequestOptions:()RTModel
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 dictionary];
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = (void *)v5;
  id v7 = [a1 dictionary];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"rtblobs"];

  if (!v8)
  {
LABEL_18:
    long long v25 = 0;
    goto LABEL_23;
  }
  id v9 = [a1 dictionary];
  v10 = [v9 objectForKeyedSubscript:@"rtblobs"];
  long long v30 = a1;
  id v31 = v4;
  uint64_t v11 = [a1 _getFilteredAccessoryRTBlobListForRequestOptions:v4 accessoryBlobs:v10 forceSkipEngineVersionCheck:1];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (!v12)
  {
    unint64_t v14 = 0;
    unint64_t v33 = 0;
    id v15 = 0;
    goto LABEL_20;
  }
  uint64_t v13 = v12;
  unint64_t v14 = 0;
  unint64_t v33 = 0;
  id v15 = 0;
  uint64_t v16 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v36 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      uint64_t v19 = [v18 objectForKeyedSubscript:@"majorVersion"];
      unint64_t v20 = [v19 unsignedIntValue];

      uint64_t v21 = [v18 objectForKeyedSubscript:@"minorVersion"];
      unint64_t v22 = [v21 unsignedIntValue];

      if (v14 < v20)
      {
        unint64_t v14 = v20;
LABEL_14:
        id v24 = v18;

        unint64_t v33 = v22;
        id v15 = v24;
        continue;
      }
      if (v14 == v20 && v33 < v22) {
        goto LABEL_14;
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
  }
  while (v13);
LABEL_20:

  long long v26 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v40 = "-[CSAsset(RTModel) latestHearstRTModelWithRequestOptions:]";
    __int16 v41 = 1024;
    int v42 = v14;
    __int16 v43 = 1024;
    int v44 = v33;
    __int16 v45 = 2113;
    uint64_t v46 = v15;
    _os_log_impl(&dword_1C9338000, v26, OS_LOG_TYPE_DEFAULT, "%s latestMajorVersion = %d, LatestMinorVersion = %d rtBlob = %{private}@", buf, 0x22u);
  }
  uint64_t v27 = [CSVoiceTriggerRTModelRequestOptions alloc];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__CSAsset_RTModel__latestHearstRTModelWithRequestOptions___block_invoke;
  v34[3] = &__block_descriptor_48_e56_v16__0___CSVoiceTriggerRTModelRequestOptionsMutablity__8l;
  v34[4] = v14;
  v34[5] = v33;
  id v4 = v31;
  uint64_t v28 = [(CSVoiceTriggerRTModelRequestOptions *)v27 initWithCSRTModelRequestOptions:v31 builder:v34];
  long long v25 = [v30 _buildRTModelWithBlobConfig:v15 requestOptions:v28];

LABEL_23:
  return v25;
}

- (id)RTModelWithFallbackLanguage:()RTModel
{
  v2 = objc_msgSend(MEMORY[0x1E4F5D450], "getSiriLanguageWithFallback:");
  id v3 = [a1 createRTModelWithLocale:v2];

  return v3;
}

- (CSVoiceTriggerRTModel)createRTModelWithLocale:()RTModel
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 resourcePath];
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F5D180];
  unint64_t v7 = 0x1E4FB4000uLL;
  if (v5
    && (uint64_t v8 = (void *)v5,
        [a1 path],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = [a1 resourcePath];
    uint64_t v11 = [v10 stringByAppendingPathComponent:@"config_rtv2.txt"];

    uint64_t v12 = [a1 resourcePath];
    uint64_t v13 = [v12 stringByAppendingPathComponent:@"config_rt.txt"];

    unint64_t v14 = [a1 resourcePath];
    id v15 = [v14 stringByAppendingPathComponent:@"config.txt"];

    int v16 = CSHasAOP();
    int v17 = v15;
    if (v16)
    {
      uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v19 = [v18 fileExistsAtPath:v11 isDirectory:0];

      int v17 = v11;
      if ((v19 & 1) == 0)
      {
        unint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v21 = [v20 fileExistsAtPath:v13 isDirectory:0];

        int v17 = v13;
        if ((v21 & 1) == 0)
        {
          unint64_t v22 = *v6;
          BOOL v23 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
          int v17 = v15;
          if (v23)
          {
            int v42 = 136315650;
            __int16 v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
            __int16 v44 = 2114;
            __int16 v45 = 0;
            __int16 v46 = 2114;
            v47 = v15;
            _os_log_impl(&dword_1C9338000, v22, OS_LOG_TYPE_DEFAULT, "%s RT specific configuration %{public}@ does not exist, defaulting to unified configuration %{public}@", (uint8_t *)&v42, 0x20u);
            int v17 = v15;
          }
        }
      }
    }
    id v24 = v17;
    long long v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 136315394;
      __int16 v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v44 = 2114;
      __int16 v45 = v24;
      _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_DEFAULT, "%s Creating RT blob using: %{public}@", (uint8_t *)&v42, 0x16u);
    }
    long long v26 = (void *)MEMORY[0x1E4FB4FD8];
    uint64_t v27 = [a1 resourcePath];
    uint64_t v28 = [v26 getBlobWithConfigFilename:v24 rootDirectory:v27];

    long long v29 = *v6;
    long long v30 = *v6;
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = 136315394;
        __int16 v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        __int16 v44 = 2114;
        __int16 v45 = v24;
        _os_log_impl(&dword_1C9338000, v29, OS_LOG_TYPE_DEFAULT, "%s CorealisRT model creation done successfully : %{public}@", (uint8_t *)&v42, 0x16u);
      }
      id v31 = [a1 assetHashInResourcePath:v24];
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v42 = 136315138;
        __int16 v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        _os_log_error_impl(&dword_1C9338000, v29, OS_LOG_TYPE_ERROR, "%s Failed to create CorealisRT model", (uint8_t *)&v42, 0xCu);
      }
      id v31 = 0;
    }
    unint64_t v7 = 0x1E4FB4000;

    if (v28)
    {
      uint64_t v39 = [a1 resourcePath];
      if (v39)
      {
        v40 = (void *)v39;
        __int16 v41 = [a1 path];

        if (v41) {
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    id v31 = 0;
    uint64_t v28 = 0;
  }
  int v32 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = 136315138;
    __int16 v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_impl(&dword_1C9338000, v32, OS_LOG_TYPE_DEFAULT, "%s Defaulting to en_US CorealisRT model", (uint8_t *)&v42, 0xCu);
  }
  uint64_t v33 = [*(id *)(v7 + 4056) getDefaultBlob];

  v34 = *v6;
  long long v35 = *v6;
  if (v33)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 136315138;
      __int16 v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      _os_log_impl(&dword_1C9338000, v34, OS_LOG_TYPE_DEFAULT, "%s Default CorealisRT model creation done successfully", (uint8_t *)&v42, 0xCu);
    }

    id v31 = @"nohash";
    uint64_t v28 = (void *)v33;
LABEL_21:
    long long v36 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 136315650;
      __int16 v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v44 = 2114;
      __int16 v45 = v4;
      __int16 v46 = 2114;
      v47 = v31;
      _os_log_impl(&dword_1C9338000, v36, OS_LOG_TYPE_DEFAULT, "%s RT Model queried - %{public}@ %{public}@", (uint8_t *)&v42, 0x20u);
    }
    long long v37 = [[CSVoiceTriggerRTModel alloc] initWithData:v28 hash:v31 locale:v4];

    goto LABEL_27;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    int v42 = 136315138;
    __int16 v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_error_impl(&dword_1C9338000, v34, OS_LOG_TYPE_ERROR, "%s Failed to create default CorealisRT model", (uint8_t *)&v42, 0xCu);
  }
  long long v37 = 0;
LABEL_27:

  return v37;
}

+ (uint64_t)supportsMultiPhraseVoiceTriggerForEngineVersion:()RTModel engineMinorVersion:accessoryRTModelType:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 unsignedIntegerValue];
  uint64_t v11 = [v8 unsignedIntegerValue];
  unint64_t v12 = [v9 unsignedIntegerValue];

  uint64_t v13 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    char v19 = "+[CSAsset(RTModel) supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:]";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_DEFAULT, "%s Incoming Major version:%@, Incoming Minor version:%@", (uint8_t *)&v18, 0x20u);
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  unsigned int v15 = !v14;
  if (v12 <= 1) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }

  return v16;
}

@end
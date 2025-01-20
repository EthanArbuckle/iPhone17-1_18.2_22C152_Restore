@interface CSAsset
+ (BOOL)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5;
- (BOOL)_allowMultiPhrase:(id)a3 forceSkipEngineVersionCheck:(BOOL)a4;
- (id)RTModelWithFallbackLanguage:(id)a3;
- (id)_buildRTModelWithBlobConfig:(id)a3 requestOptions:(id)a4;
- (id)_getFilteredAccessoryRTBlobListForRequestOptions:(id)a3 accessoryBlobs:(id)a4 forceSkipEngineVersionCheck:(BOOL)a5;
- (id)_rtModelWithRequestOptions:(id)a3 accessoryBlobs:(id)a4;
- (id)_sha1:(id)a3;
- (id)_sha256:(id)a3;
- (id)_splitBlobsByPhraseType:(id)a3;
- (id)_userSelectedPhraseTypeToRTModelPhraseType:(id)a3;
- (id)createRTModelWithLocale:(id)a3;
- (id)hearstRTModelLocaleMap;
- (id)jarvisRTModelLocaleMap;
- (id)latestHearstRTModelWithRequestOptions:(id)a3;
- (id)localeMapWithName:(id)a3;
- (id)remoraRTModelLocaleMap;
- (id)rtModelLocaleMapWithModelType:(int64_t)a3;
- (id)rtModelWithRequestOptions:(id)a3;
@end

@implementation CSAsset

- (id)_userSelectedPhraseTypeToRTModelPhraseType:(id)a3
{
  if ([a3 unsignedIntegerValue] == (id)1) {
    return @"HSJS";
  }
  else {
    return @"HSOnly";
  }
}

- (BOOL)_allowMultiPhrase:(id)a3 forceSkipEngineVersionCheck:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  v6 = [v5 accessoryInfo];
  unsigned int v7 = [v6 supportsJustSiri];

  v8 = [v5 engineMajorVersion];
  unsigned int v9 = [v8 unsignedIntValue];

  v10 = [v5 engineMinorVersion];
  unsigned int v11 = [v10 unsignedIntValue];

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

  char v16 = v7 & v14 & v15;
  v17 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316162;
    v20 = "-[CSAsset(RTModel) _allowMultiPhrase:forceSkipEngineVersionCheck:]";
    __int16 v21 = 1024;
    int v22 = v7 & v14 & v15;
    __int16 v23 = 1024;
    unsigned int v24 = v7;
    __int16 v25 = 1024;
    int v26 = v14;
    __int16 v27 = 1024;
    unsigned int v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Multi-phrase keyword detection (%d): Accessory supports multi-phrase: %d, engine support multi-phrase: %d, device allows multi-phrase: %d", (uint8_t *)&v19, 0x24u);
  }
  return v16;
}

- (id)_rtModelWithRequestOptions:(id)a3 accessoryBlobs:(id)a4
{
  id v6 = a3;
  unsigned int v7 = [(CSAsset *)self _getFilteredAccessoryRTBlobListForRequestOptions:v6 accessoryBlobs:a4 forceSkipEngineVersionCheck:0];
  v8 = [v6 engineMajorVersion];
  unsigned int v9 = [v8 unsignedIntValue];

  v10 = [v6 engineMinorVersion];
  unsigned int v11 = [v10 unsignedIntValue];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    unsigned int v24 = self;
    id v25 = v6;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        char v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v17 = [v16 objectForKeyedSubscript:@"majorVersion"];
        unsigned int v18 = [v17 unsignedIntValue];

        int v19 = [v16 objectForKeyedSubscript:@"minorVersion"];
        unsigned int v20 = [v19 unsignedIntValue];

        if (v18 == v9 && v11 >= v20)
        {
          id v6 = v25;
          int v22 = [(CSAsset *)v24 _buildRTModelWithBlobConfig:v16 requestOptions:v25];
          goto LABEL_15;
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
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

- (id)_getFilteredAccessoryRTBlobListForRequestOptions:(id)a3 accessoryBlobs:(id)a4 forceSkipEngineVersionCheck:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v9 = [(CSAsset *)self _splitBlobsByPhraseType:a4];
  v10 = [v8 userSelectedPhraseType];
  unsigned int v11 = [(CSAsset *)self _userSelectedPhraseTypeToRTModelPhraseType:v10];

  if ([(CSAsset *)self _allowMultiPhrase:v8 forceSkipEngineVersionCheck:v5])
  {
    if (!v11)
    {
      id v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      v17 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
      __int16 v18 = 1024;
      *(_DWORD *)int v19 = 0;
      *(_WORD *)&v19[4] = 2112;
      *(void *)&v19[6] = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Falling back to HSOnly phrase - Multi-phrase allowed: %d, request options: %@", (uint8_t *)&v16, 0x1Cu);
    }

    unsigned int v11 = @"HSOnly";
  }
  id v12 = [v9 objectForKeyedSubscript:v11];
LABEL_8:
  uint64_t v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315651;
    v17 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
    __int16 v18 = 2113;
    *(void *)int v19 = v11;
    *(_WORD *)&v19[8] = 2113;
    *(void *)&v19[10] = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Selected phrase type: %{private}@ accessory RTBlobs: %{private}@", (uint8_t *)&v16, 0x20u);
  }

  return v12;
}

- (id)_splitBlobsByPhraseType:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"phraseType"];
        id v12 = (void *)v11;
        if (v11) {
          id v13 = (__CFString *)v11;
        }
        else {
          id v13 = @"HSOnly";
        }
        uint64_t v14 = v13;

        id v15 = [v4 objectForKey:v14];
        if (!v15)
        {
          id v15 = objc_alloc_init((Class)NSMutableArray);
          [v4 setObject:v15 forKey:v14];
        }
        [v15 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  int v16 = [v4 allKeys];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        int v22 = [v4 objectForKeyedSubscript:v21];
        id v23 = [v22 sortedArrayUsingComparator:&stru_10001CAB0];

        if (v23) {
          [v4 setObject:v23 forKeyedSubscript:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  return v4;
}

- (id)_buildRTModelWithBlobConfig:(id)a3 requestOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"blob"];
  if (v8)
  {
    unsigned int v9 = [(CSAsset *)self resourcePath];
    v10 = [v9 stringByAppendingPathComponent:v8];

    uint64_t v11 = +[NSFileManager defaultManager];
    unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

    id v13 = CSLogContextFacilityCoreSpeech;
    if (v12)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v42 = 2114;
        v43 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Reading blob from : %{public}@", buf, 0x16u);
      }
      uint64_t v14 = +[NSData dataWithContentsOfFile:v10];
      if (v14)
      {
        id v15 = [(CSAsset *)self _sha1:v14];
        v39 = objc_msgSend(v15, "substringWithRange:", 0, 20);

        v38 = [(CSAsset *)self _sha256:v14];
        uint64_t v16 = [v6 objectForKeyedSubscript:@"signature"];
        v37 = (void *)v16;
        if (v16)
        {
          uint64_t v17 = v16;
          id v18 = [(CSAsset *)self resourcePath];
          uint64_t v19 = [v18 stringByAppendingPathComponent:v17];

          unsigned int v20 = +[NSFileManager defaultManager];
          unsigned int v21 = [v20 fileExistsAtPath:v19];

          if (v21)
          {
            v36 = +[NSData dataWithContentsOfFile:v19];
          }
          else
          {
            v36 = 0;
          }
        }
        else
        {
          v36 = 0;
        }
        uint64_t v25 = [v6 objectForKeyedSubscript:@"cert"];
        v35 = (void *)v25;
        if (v25)
        {
          uint64_t v26 = v25;
          long long v27 = [(CSAsset *)self resourcePath];
          long long v28 = [v27 stringByAppendingPathComponent:v26];

          long long v29 = +[NSFileManager defaultManager];
          unsigned int v30 = [v29 fileExistsAtPath:v28];

          if (v30)
          {
            long long v31 = +[NSData dataWithContentsOfFile:v28];
          }
          else
          {
            long long v31 = 0;
          }
        }
        else
        {
          long long v31 = 0;
        }
        long long v32 = [CSVoiceTriggerRTModel alloc];
        v33 = [v7 siriLocale];
        id v23 = [(CSVoiceTriggerRTModel *)v32 initWithData:v14 hash:v39 locale:v33 digest:v38 signature:v36 certificate:v31];
      }
      else
      {
        unsigned int v24 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
          __int16 v42 = 2114;
          v43 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Blob is nil : %{public}@", buf, 0x16u);
        }
        id v23 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v42 = 2114;
        v43 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s blob file is not exists at %{public}@", buf, 0x16u);
      }
      id v23 = 0;
    }
  }
  else
  {
    int v22 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s blob file name is not exists", buf, 0xCu);
    }
    id v23 = 0;
  }

  return v23;
}

- (id)_sha256:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableData dataWithLength:32];
  id v5 = v3;
  id v6 = [v5 bytes];
  CC_LONG v7 = [v5 length];

  id v8 = v4;
  CC_SHA256(v6, v7, (unsigned __int8 *)[v8 mutableBytes]);
  return v8;
}

- (id)_sha1:(id)a3
{
  id v3 = a3;
  CC_SHA1([v3 bytes], (CC_LONG)objc_msgSend(v3, "length"), md);
  id v4 = +[NSMutableString stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

- (id)localeMapWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSAsset *)self dictionary];
  if (v5)
  {
    id v6 = (void *)v5;
    CC_LONG v7 = [(CSAsset *)self dictionary];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];
    if (v8)
    {
      unsigned int v9 = (void *)v8;
      v10 = [(CSAsset *)self dictionary];
      uint64_t v11 = [v10 objectForKeyedSubscript:v4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v13 = [(CSAsset *)self dictionary];
        uint64_t v14 = [v13 objectForKeyedSubscript:v4];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v15 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v17 = 136315394;
    id v18 = "-[CSAsset(RTModel) localeMapWithName:]";
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Locale map for %{public}@ is not available on asset", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v14 = 0;
LABEL_9:

  return v14;
}

- (id)rtModelLocaleMapWithModelType:(int64_t)a3
{
  if (a3 == 1) {
    [(CSAsset *)self remoraRTModelLocaleMap];
  }
  else {
  id v3 = [(CSAsset *)self hearstRTModelLocaleMap];
  }
  return v3;
}

- (id)remoraRTModelLocaleMap
{
  return [(CSAsset *)self localeMapWithName:@"adklocalemap"];
}

- (id)jarvisRTModelLocaleMap
{
  return [(CSAsset *)self localeMapWithName:@"jarvislocalemap"];
}

- (id)hearstRTModelLocaleMap
{
  return [(CSAsset *)self localeMapWithName:@"rtlocalemap"];
}

- (id)rtModelWithRequestOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 accessoryModelType];
  id v6 = [v5 integerValue];

  if (v6) {
    CFStringRef v7 = @"adkblobs";
  }
  else {
    CFStringRef v7 = @"rtblobs";
  }
  uint64_t v8 = [(CSAsset *)self dictionary];
  if (!v8) {
    goto LABEL_7;
  }
  unsigned int v9 = (void *)v8;
  v10 = [(CSAsset *)self dictionary];
  uint64_t v11 = [v10 objectForKeyedSubscript:v7];

  if (v11)
  {
    unsigned __int8 v12 = [(CSAsset *)self dictionary];
    id v13 = [v12 objectForKeyedSubscript:v7];

    uint64_t v14 = [(CSAsset *)self _rtModelWithRequestOptions:v4 accessoryBlobs:v13];
  }
  else
  {
LABEL_7:
    id v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      id v18 = "-[CSAsset(RTModel) rtModelWithRequestOptions:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s corespeech.json doesn't contains rtblobs", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)latestHearstRTModelWithRequestOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSAsset *)self dictionary];
  if (!v5) {
    goto LABEL_18;
  }
  id v6 = (void *)v5;
  CFStringRef v7 = [(CSAsset *)self dictionary];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"rtblobs"];

  if (!v8)
  {
LABEL_18:
    uint64_t v25 = 0;
    goto LABEL_23;
  }
  unsigned int v9 = [(CSAsset *)self dictionary];
  v10 = [v9 objectForKeyedSubscript:@"rtblobs"];
  long long v29 = self;
  id v30 = v4;
  uint64_t v11 = [(CSAsset *)self _getFilteredAccessoryRTBlobListForRequestOptions:v4 accessoryBlobs:v10 forceSkipEngineVersionCheck:1];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (!v12)
  {
    unint64_t v14 = 0;
    unint64_t v32 = 0;
    id v15 = 0;
    goto LABEL_20;
  }
  id v13 = v12;
  unint64_t v14 = 0;
  unint64_t v32 = 0;
  id v15 = 0;
  uint64_t v16 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v35 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      __int16 v19 = [v18 objectForKeyedSubscript:@"majorVersion"];
      unint64_t v20 = [v19 unsignedIntValue];

      unsigned int v21 = [v18 objectForKeyedSubscript:@"minorVersion"];
      unint64_t v22 = [v21 unsignedIntValue];

      if (v14 < v20)
      {
        unint64_t v14 = v20;
LABEL_14:
        id v24 = v18;

        unint64_t v32 = v22;
        id v15 = v24;
        continue;
      }
      if (v14 == v20 && v32 < v22) {
        goto LABEL_14;
      }
    }
    id v13 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  }
  while (v13);
LABEL_20:

  uint64_t v26 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v39 = "-[CSAsset(RTModel) latestHearstRTModelWithRequestOptions:]";
    __int16 v40 = 1024;
    int v41 = v14;
    __int16 v42 = 1024;
    int v43 = v32;
    __int16 v44 = 2113;
    v45 = v15;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s latestMajorVersion = %d, LatestMinorVersion = %d rtBlob = %{private}@", buf, 0x22u);
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000FE40;
  v33[3] = &unk_10001CA70;
  v33[4] = v14;
  v33[5] = v32;
  id v4 = v30;
  long long v27 = [[CSVoiceTriggerRTModelRequestOptions alloc] initWithCSRTModelRequestOptions:v30 builder:v33];
  uint64_t v25 = [(CSAsset *)v29 _buildRTModelWithBlobConfig:v15 requestOptions:v27];

LABEL_23:
  return v25;
}

- (id)RTModelWithFallbackLanguage:(id)a3
{
  id v4 = +[CSUtils getSiriLanguageWithFallback:a3];
  uint64_t v5 = [(CSAsset *)self createRTModelWithLocale:v4];

  return v5;
}

- (id)createRTModelWithLocale:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = [(CSAsset *)self resourcePath];
  id v6 = &CC_SHA1_ptr;
  if (v5
    && (CFStringRef v7 = (void *)v5,
        [(CSAsset *)self path],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    unsigned int v9 = [(CSAsset *)self resourcePath];
    v10 = [v9 stringByAppendingPathComponent:@"config_rtv2.txt"];

    uint64_t v11 = [(CSAsset *)self resourcePath];
    id v12 = [v11 stringByAppendingPathComponent:@"config_rt.txt"];

    id v13 = [(CSAsset *)self resourcePath];
    unint64_t v14 = [v13 stringByAppendingPathComponent:@"config.txt"];

    int v15 = CSHasAOP();
    uint64_t v16 = v14;
    if (v15)
    {
      int v17 = +[NSFileManager defaultManager];
      unsigned __int8 v18 = [v17 fileExistsAtPath:v10 isDirectory:0];

      uint64_t v16 = v10;
      if ((v18 & 1) == 0)
      {
        __int16 v19 = +[NSFileManager defaultManager];
        unsigned __int8 v20 = [v19 fileExistsAtPath:v12 isDirectory:0];

        uint64_t v16 = v12;
        if ((v20 & 1) == 0)
        {
          unsigned int v21 = CSLogContextFacilityCoreSpeech;
          BOOL v22 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
          uint64_t v16 = v14;
          if (v22)
          {
            int v38 = 136315650;
            v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
            __int16 v40 = 2114;
            int v41 = 0;
            __int16 v42 = 2114;
            int v43 = v14;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s RT specific configuration %{public}@ does not exist, defaulting to unified configuration %{public}@", (uint8_t *)&v38, 0x20u);
            uint64_t v16 = v14;
          }
        }
      }
    }
    id v23 = v16;
    id v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315394;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v40 = 2114;
      int v41 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Creating RT blob using: %{public}@", (uint8_t *)&v38, 0x16u);
    }
    uint64_t v25 = [(CSAsset *)self resourcePath];
    uint64_t v26 = +[VTBlobBuilder getBlobWithConfigFilename:v23 rootDirectory:v25];

    long long v27 = CSLogContextFacilityCoreSpeech;
    if (v26)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 136315394;
        v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        __int16 v40 = 2114;
        int v41 = v23;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s CorealisRT model creation done successfully : %{public}@", (uint8_t *)&v38, 0x16u);
      }
      long long v28 = [(CSAsset *)self assetHashInResourcePath:v23];
    }
    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v38 = 136315138;
        v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Failed to create CorealisRT model", (uint8_t *)&v38, 0xCu);
      }
      long long v28 = 0;
    }
    id v6 = &CC_SHA1_ptr;

    if (v26)
    {
      uint64_t v35 = [(CSAsset *)self resourcePath];
      if (v35)
      {
        long long v36 = (void *)v35;
        long long v37 = [(CSAsset *)self path];

        if (v37) {
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    long long v28 = 0;
    uint64_t v26 = 0;
  }
  long long v29 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136315138;
    v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s Defaulting to en_US CorealisRT model", (uint8_t *)&v38, 0xCu);
  }
  uint64_t v30 = [v6[128] getDefaultBlob];

  long long v31 = CSLogContextFacilityCoreSpeech;
  if (v30)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315138;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Default CorealisRT model creation done successfully", (uint8_t *)&v38, 0xCu);
    }

    long long v28 = @"nohash";
    uint64_t v26 = (void *)v30;
LABEL_21:
    unint64_t v32 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315650;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v40 = 2114;
      int v41 = v4;
      __int16 v42 = 2114;
      int v43 = v28;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s RT Model queried - %{public}@ %{public}@", (uint8_t *)&v38, 0x20u);
    }
    v33 = [[CSVoiceTriggerRTModel alloc] initWithData:v26 hash:v28 locale:v4];

    goto LABEL_27;
  }
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v38 = 136315138;
    v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Failed to create default CorealisRT model", (uint8_t *)&v38, 0xCu);
  }
  v33 = 0;
LABEL_27:

  return v33;
}

+ (BOOL)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 unsignedIntegerValue];
  id v11 = [v8 unsignedIntegerValue];
  id v12 = [v9 unsignedIntegerValue];

  id v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    __int16 v19 = "+[CSAsset(RTModel) supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:]";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Incoming Major version:%@, Incoming Minor version:%@", (uint8_t *)&v18, 0x20u);
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  char v15 = !v14;
  if ((unint64_t)v12 <= 1) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = 0;
  }

  return v16;
}

@end
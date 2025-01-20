@interface CSAsset
+ (BOOL)isLeftConfigVersion:(id)a3 newerThanRightConfigVersion:(id)a4;
+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5;
+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6;
+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6 assetVariant:(unint64_t)a7 identity:(id)a8 assistantLanguageCode:(id)a9;
+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6 identity:(id)a7 assistantLanguageCode:(id)a8;
+ (id)decodeJson:(id)a3;
+ (id)defaultFallBackAssetForAdBlocker;
+ (id)defaultFallBackAssetForHearst;
+ (id)defaultFallBackAssetForVoiceTrigger;
+ (id)fallBackAssetResourcePath;
+ (id)getAssetFileForAssetType:(unint64_t)a3 resourcePath:(id)a4 assetProvider:(unint64_t)a5;
+ (id)getConfigFileNameForAssetType:(unint64_t)a3;
+ (id)hybridEndpointerAssetFilename;
+ (id)overrideAssetForVoiceTrigger;
+ (unint64_t)parseCompatibilityFromConfigVersion:(id)a3;
- (BOOL)containsCategory:(id)a3;
- (BOOL)containsKey:(id)a3 category:(id)a4;
- (BOOL)getBoolForKey:(id)a3 category:(id)a4 default:(BOOL)a5;
- (BOOL)isEqualAsset:(id)a3;
- (BOOL)isHSVoiceTrigger:(id)a3;
- (BOOL)isJSSupported;
- (BOOL)isJSVoiceTrigger:(id)a3;
- (BOOL)isMagusSupported;
- (BOOL)progCheckerShadowMode;
- (BOOL)shouldRunCAROverrideForCategory:(id)a3;
- (BOOL)shouldRunSpkrIdForCategory:(id)a3;
- (BOOL)useGazeSignal;
- (CSAsset)initWithResourcePath:(id)a3 configFile:(id)a4 configVersion:(id)a5 assetProvderType:(unint64_t)a6 assetType:(unint64_t)a7;
- (CSAsset)initWithResourcePath:(id)a3 configFile:(id)a4 configVersion:(id)a5 assetProvderType:(unint64_t)a6 assetType:(unint64_t)a7 assetVariant:(unint64_t)a8 identity:(id)a9 assistantLanguageCode:(id)a10;
- (NSArray)checkerThresholds;
- (NSArray)contConvRecognizerConfigFiles;
- (NSArray)contConvThresholds;
- (NSArray)progCheckerRecognizerConfigFiles;
- (NSDictionary)dictionary;
- (NSString)allowKeywordsFile;
- (NSString)assistantLanguageCode;
- (NSString)configVersion;
- (NSString)contConvConfigFile;
- (NSString)gazeDetectionModelFile;
- (NSString)hashFromResourcePath;
- (NSString)identity;
- (NSString)keywordDetectorConfigPathRecognizer;
- (NSString)lipMovementVADModelFile;
- (NSString)mimVotingConfigFile;
- (NSString)path;
- (NSString)progCheckerConfigFile;
- (NSString)resourcePath;
- (float)attendingTimeoutValueInSecs;
- (float)eagerMitigationDurationThreshold;
- (float)keywordDetectorThreshold;
- (float)keywordDetectorWaitTimeSinceVT;
- (float)mitigationModelDefaultAFTMScore;
- (float)mitigationModelDefaultELFusionScore;
- (float)mitigationModelDefaultNLDAScore;
- (float)startOfSpeechPrependAudioDuration;
- (float)startOfSpeechThresholdDuration;
- (id)_sha1ForString:(id)a3;
- (id)assetHashForTrial:(id)a3;
- (id)assetHashInResourcePath:(id)a3;
- (id)description;
- (id)getAllMitigationConfigFiles;
- (id)getAllNldaConfigFiles;
- (id)getCategoryKeyWithRecordCtx:(id)a3;
- (id)getNumberForKey:(id)a3 category:(id)a4 default:(id)a5;
- (id)getRecognizerConfigsFrom:(id)a3;
- (id)getStringForKey:(id)a3 category:(id)a4 default:(id)a5;
- (id)getValueForKey:(id)a3 category:(id)a4;
- (id)mitigationConfigFileForCategory:(id)a3;
- (id)mitigatonConfigFile;
- (id)nldaConfigFile;
- (id)nldaConfigFileForCategory:(id)a3;
- (id)stringForCurrentAssetProviderType;
- (id)uesConfigFileForCategory:(id)a3;
- (int64_t)numOfConsecutiveBoronActivationThreshold;
- (unint64_t)_mapInputOriginFromAssetToCSAudioRecordType:(id)a3;
- (unint64_t)allowListWordCountThreshold;
- (unint64_t)assetProvider;
- (unint64_t)assetType;
- (unint64_t)assetVariant;
- (unint64_t)supportedInputOrigins;
- (void)_updateAssetVariantIfNeeded;
- (void)logAssetVersionForInsight;
@end

@implementation CSAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantLanguageCode, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_decodedInfo, 0);
}

- (NSString)assistantLanguageCode
{
  return self->_assistantLanguageCode;
}

- (NSString)identity
{
  return self->_identity;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (unint64_t)assetVariant
{
  return self->_assetVariant;
}

- (unint64_t)assetProvider
{
  return self->_assetProvider;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (NSString)path
{
  return self->_path;
}

- (void)logAssetVersionForInsight
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(CSAsset *)self assetType]
    || [(CSAsset *)self assetType] == 5
    || [(CSAsset *)self assetType] == 7
    || [(CSAsset *)self assetType] == 8)
  {
    v3 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    v4 = v3;
    v5 = [(CSAsset *)self configVersion];
    int v7 = 136315394;
    v8 = "-[CSAsset logAssetVersionForInsight]";
    __int16 v9 = 2114;
    unint64_t v10 = (unint64_t)v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s [Asset Version Used]: VTAssetVersion: %{public}@", (uint8_t *)&v7, 0x16u);

    goto LABEL_7;
  }
  v6 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v6;
    int v7 = 136315394;
    v8 = "-[CSAsset logAssetVersionForInsight]";
    __int16 v9 = 2048;
    unint64_t v10 = [(CSAsset *)self assetType];
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s logAssetVersionForInsight for assetType: %lu", (uint8_t *)&v7, 0x16u);
LABEL_7:
  }
}

- (void)_updateAssetVariantIfNeeded
{
  if (!self->_assetVariant && self->_assetProvider - 1 <= 1) {
    self->_assetVariant = 2;
  }
}

- (id)_sha1ForString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 dataUsingEncoding:4];
  CC_SHA1((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

- (id)assetHashInResourcePath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(CSAsset *)self assetProvider] == 1 || [(CSAsset *)self assetProvider] == 2)
    {
      v5 = [(CSAsset *)self assetHashForTrial:v4];
    }
    else
    {
      id v16 = 0;
      v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"((?:[a-z]|[0-9])*)\\.asset" options:0 error:&v16];
      id v7 = v16;
      if (v7)
      {
        uint64_t v8 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v14 = v8;
          v15 = [v7 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v18 = "-[CSAsset assetHashInResourcePath:]";
          __int16 v19 = 2114;
          v20 = v15;
          _os_log_error_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_ERROR, "%s Failed to create regular expression : %{public}@", buf, 0x16u);
        }
        v5 = @"nohash";
      }
      else
      {
        __int16 v9 = objc_msgSend(v6, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
        unint64_t v10 = v9;
        if (v9 && (unint64_t)[v9 numberOfRanges] >= 2)
        {
          uint64_t v11 = [v10 rangeAtIndex:1];
          objc_msgSend(v4, "substringWithRange:", v11, v12);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = @"nohash";
        }
      }
    }
  }
  else
  {
    v5 = @"nohash";
  }

  return v5;
}

- (id)assetHashForTrial:(id)a3
{
  id v4 = [(CSAsset *)self _sha1ForString:a3];
  v5 = [NSString stringWithFormat:@"%@_%@", v4, self->_configVersion];

  return v5;
}

- (id)stringForCurrentAssetProviderType
{
  unint64_t assetProvider = self->_assetProvider;
  if (assetProvider > 2) {
    return @"Unknown";
  }
  else {
    return off_1E61FF4A8[assetProvider];
  }
}

- (BOOL)isEqualAsset:(id)a3
{
  path = self->_path;
  id v4 = [a3 path];
  LOBYTE(path) = [(NSString *)path isEqualToString:v4];

  return (char)path;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"configVersion:%@ resourcePath:%@ path:%@", self->_configVersion, self->_resourcePath, self->_path];
}

- (NSString)hashFromResourcePath
{
  id v3 = [(CSAsset *)self resourcePath];
  id v4 = [(CSAsset *)self assetHashInResourcePath:v3];

  return (NSString *)v4;
}

- (BOOL)containsCategory:(id)a3
{
  id v4 = a3;
  v5 = [(CSAsset *)self dictionary];
  if (v5)
  {
    v6 = [(CSAsset *)self dictionary];
    id v7 = [v6 objectForKeyedSubscript:v4];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)containsKey:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CSAsset *)self dictionary];
  if (v8)
  {
    __int16 v9 = [(CSAsset *)self dictionary];
    unint64_t v10 = [v9 objectForKeyedSubscript:v7];
    if (v10)
    {
      uint64_t v11 = [(CSAsset *)self dictionary];
      uint64_t v12 = [v11 objectForKeyedSubscript:v7];
      v13 = [v12 objectForKeyedSubscript:v6];
      BOOL v14 = v13 != 0;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)getValueForKey:(id)a3 category:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSAsset *)self dictionary];
  if (v8)
  {
    __int16 v9 = (void *)v8;
    unint64_t v10 = [(CSAsset *)self dictionary];
    uint64_t v11 = [v10 objectForKeyedSubscript:v7];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v13 = [(CSAsset *)self dictionary];
      BOOL v14 = [v13 objectForKeyedSubscript:v7];
      v15 = [v14 objectForKeyedSubscript:v6];

      if (v15)
      {
        id v16 = [(CSAsset *)self dictionary];
        v17 = [v16 objectForKeyedSubscript:v7];
        v18 = [v17 objectForKeyedSubscript:v6];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  __int16 v19 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 136315650;
    v22 = "-[CSAsset getValueForKey:category:]";
    __int16 v23 = 2114;
    id v24 = v7;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_debug_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEBUG, "%s Cannot access to %{public}@ %{public}@", (uint8_t *)&v21, 0x20u);
  }
  v18 = 0;
LABEL_9:

  return v18;
}

- (id)getStringForKey:(id)a3 category:(id)a4 default:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CSAsset *)self dictionary];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    v13 = [(CSAsset *)self dictionary];
    uint64_t v14 = [v13 objectForKeyedSubscript:v9];
    if (v14)
    {
      v15 = (void *)v14;
      id v16 = [(CSAsset *)self dictionary];
      v17 = [v16 objectForKeyedSubscript:v9];
      v18 = [v17 objectForKeyedSubscript:v8];

      if (v18)
      {
        __int16 v19 = [(CSAsset *)self dictionary];
        v20 = [v19 objectForKeyedSubscript:v9];
        int v21 = [v20 objectForKeyedSubscript:v8];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  v22 = CSLogContextFacilityCoreSpeech;
  int v21 = v10;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315906;
    __int16 v25 = "-[CSAsset getStringForKey:category:default:]";
    __int16 v26 = 2114;
    id v27 = v9;
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2114;
    id v31 = v10;
    _os_log_debug_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEBUG, "%s Cannot access to %{public}@ %{public}@ using default value=%{public}@", (uint8_t *)&v24, 0x2Au);
    int v21 = v10;
  }
LABEL_8:

  return v21;
}

- (BOOL)getBoolForKey:(id)a3 category:(id)a4 default:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 numberWithBool:v5];
  uint64_t v12 = [(CSAsset *)self getNumberForKey:v10 category:v9 default:v11];

  LOBYTE(v11) = [v12 BOOLValue];
  return (char)v11;
}

- (id)getNumberForKey:(id)a3 category:(id)a4 default:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CSAsset *)self dictionary];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    v13 = [(CSAsset *)self dictionary];
    uint64_t v14 = [v13 objectForKeyedSubscript:v9];
    if (v14)
    {
      v15 = (void *)v14;
      id v16 = [(CSAsset *)self dictionary];
      v17 = [v16 objectForKeyedSubscript:v9];
      v18 = [v17 objectForKeyedSubscript:v8];

      if (v18)
      {
        __int16 v19 = [(CSAsset *)self dictionary];
        v20 = [v19 objectForKeyedSubscript:v9];
        int v21 = [v20 objectForKeyedSubscript:v8];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  v22 = CSLogContextFacilityCoreSpeech;
  int v21 = v10;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315906;
    __int16 v25 = "-[CSAsset getNumberForKey:category:default:]";
    __int16 v26 = 2114;
    id v27 = v9;
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2114;
    id v31 = v10;
    _os_log_debug_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEBUG, "%s Cannot access to %{public}@ %{public}@ using default value=%{public}@", (uint8_t *)&v24, 0x2Au);
    int v21 = v10;
  }
LABEL_8:

  return v21;
}

- (NSDictionary)dictionary
{
  decodedInfo = self->_decodedInfo;
  if (!decodedInfo)
  {
    id v4 = +[CSAsset decodeJson:self->_path];
    BOOL v5 = self->_decodedInfo;
    self->_decodedInfo = v4;

    decodedInfo = self->_decodedInfo;
  }
  return decodedInfo;
}

- (CSAsset)initWithResourcePath:(id)a3 configFile:(id)a4 configVersion:(id)a5 assetProvderType:(unint64_t)a6 assetType:(unint64_t)a7 assetVariant:(unint64_t)a8 identity:(id)a9 assistantLanguageCode:(id)a10
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = (NSString *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  id v34 = a10;
  v35.receiver = self;
  v35.super_class = (Class)CSAsset;
  v18 = [(CSAsset *)&v35 init];
  if (!v18) {
    goto LABEL_7;
  }
  id v32 = v17;
  id v33 = v16;
  __int16 v19 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assis"
          "tantLanguageCode:]";
    __int16 v38 = 2114;
    v39 = v14;
    _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  v20 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a6, a7);
  int v21 = [(NSString *)v14 stringByAppendingPathComponent:v15];
  if ([v20 fileExistsAtPath:v14]
    && ([v20 fileExistsAtPath:v21] & 1) != 0)
  {
    objc_storeStrong((id *)&v18->_configVersion, a5);
    objc_storeStrong((id *)&v18->_resourcePath, a3);
    path = v18->_path;
    v18->_path = v21;
    __int16 v23 = v21;

    v18->_unint64_t assetProvider = v28;
    v18->_assetType = v30;
    objc_storeStrong((id *)&v18->_identity, a9);
    objc_storeStrong((id *)&v18->_assistantLanguageCode, a10);

    v18->_assetVariant = a8;
    [(CSAsset *)v18 _updateAssetVariantIfNeeded];

    id v17 = v32;
    id v16 = v33;
LABEL_7:
    int v24 = v18;
    goto LABEL_11;
  }
  __int16 v25 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assis"
          "tantLanguageCode:]";
    __int16 v38 = 2114;
    v39 = v21;
    _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, "%s Cannot find corespeech asset from resourcePath : %{public}@", buf, 0x16u);
  }

  int v24 = 0;
  id v16 = v33;
LABEL_11:

  return v24;
}

- (CSAsset)initWithResourcePath:(id)a3 configFile:(id)a4 configVersion:(id)a5 assetProvderType:(unint64_t)a6 assetType:(unint64_t)a7
{
  return [(CSAsset *)self initWithResourcePath:a3 configFile:a4 configVersion:a5 assetProvderType:a6 assetType:a7 assetVariant:0 identity:0 assistantLanguageCode:0];
}

+ (BOOL)isLeftConfigVersion:(id)a3 newerThanRightConfigVersion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v25 = "+[CSAsset isLeftConfigVersion:newerThanRightConfigVersion:]";
    __int16 v26 = 2114;
    id v27 = v5;
    __int16 v28 = 2114;
    id v29 = v6;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Comparing %{public}@ with %{public}@", buf, 0x20u);
  }
  id v8 = [v6 componentsSeparatedByString:@"."];
  if ((unint64_t)[v8 count] > 2)
  {
    uint64_t v11 = [v5 componentsSeparatedByString:@"."];
    if ((unint64_t)[v11 count] > 2)
    {
      v13 = [v11 objectAtIndexedSubscript:0];
      uint64_t v14 = [v8 objectAtIndexedSubscript:0];
      if ([v13 isEqualToString:v14])
      {
        id v15 = [v8 objectAtIndexedSubscript:1];
        id v16 = [v11 objectAtIndexedSubscript:1];
        uint64_t v17 = [v16 integerValue];
        if (v17 == [v15 integerValue])
        {
          v18 = [v11 objectAtIndexedSubscript:2];
          __int16 v19 = [v8 objectAtIndexedSubscript:2];
          __int16 v23 = v18;
          if ([v19 isEqualToString:@"Premium"]) {
            char v10 = 0;
          }
          else {
            char v10 = [v18 isEqualToString:@"Premium"];
          }
        }
        else
        {
          uint64_t v21 = [v16 integerValue];
          char v10 = v21 > [v15 integerValue];
        }
      }
      else
      {
        v20 = CSLogContextFacilityCoreSpeech;
        char v10 = 0;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v25 = "+[CSAsset isLeftConfigVersion:newerThanRightConfigVersion:]";
          __int16 v26 = 2114;
          id v27 = v13;
          _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Not comparable with %{public}@, ignore", buf, 0x16u);
          char v10 = 0;
        }
      }
    }
    else
    {
      uint64_t v12 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v25 = "+[CSAsset isLeftConfigVersion:newerThanRightConfigVersion:]";
        __int16 v26 = 2114;
        id v27 = v5;
        _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s Invalid leftConfig syntax : %{public}@", buf, 0x16u);
      }
      char v10 = 0;
    }
  }
  else
  {
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "+[CSAsset isLeftConfigVersion:newerThanRightConfigVersion:]";
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s Invalid rightConfig syntax : %{public}@", buf, 0x16u);
    }
    char v10 = 0;
  }

  return v10;
}

+ (id)decodeJson:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
    if (!v6)
    {
      uint64_t v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v19 = "+[CSAsset decodeJson:]";
        __int16 v20 = 2114;
        id v21 = v3;
        _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Cannot read configuration file : %{public}@", buf, 0x16u);
      }
      id v13 = 0;
      goto LABEL_18;
    }
    id v17 = 0;
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v17];
    id v8 = v17;
    if (v8)
    {
      id v9 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        char v10 = v9;
        uint64_t v11 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315394;
        __int16 v19 = "+[CSAsset decodeJson:]";
        __int16 v20 = 2114;
        id v21 = v11;
        _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Cannot decode configuration json file : %{public}@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v7;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      id v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v19 = "+[CSAsset decodeJson:]";
        _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Configuration json file is not expected format", buf, 0xCu);
      }
    }
    id v13 = 0;
    goto LABEL_17;
  }
  uint64_t v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "+[CSAsset decodeJson:]";
    __int16 v20 = 2114;
    id v21 = v3;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Configuration file is not exists : %{public}@", buf, 0x16u);
  }
  id v13 = 0;
LABEL_19:

  return v13;
}

+ (unint64_t)parseCompatibilityFromConfigVersion:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    unint64_t v5 = [v4 integerValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (id)overrideAssetForVoiceTrigger
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = +[CSFPreferences sharedPreferences];
  id v3 = [v2 fakeVoiceTriggerAssetPath];

  id v4 = [v3 stringByDeletingLastPathComponent];
  unint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v3];

  if (v6)
  {
    id v7 = +[CSAsset assetForAssetType:0 resourcePath:v4 configVersion:@"override-asset" assetProvider:2];
    id v8 = CSLogCategoryAsset;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "+[CSAsset overrideAssetForVoiceTrigger]";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Returning Overriding Asset", buf, 0xCu);
    }
    if (v7)
    {
      id v9 = +[CSOnDeviceCompilationHandler sharedHandler];

      if (v9)
      {
        char v10 = +[CSOnDeviceCompilationHandler sharedHandler];
        id v14 = 0;
        [v10 compileAndUpdateDeviceCachesWithAsset:v7 assetType:0 endpointId:0 errOut:&v14];
        id v11 = v14;

        uint64_t v12 = CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v16 = "+[CSAsset overrideAssetForVoiceTrigger]";
          __int16 v17 = 2112;
          id v18 = v11;
          _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Compile cached asset to onDevice CacheIr with error: %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)defaultFallBackAssetForVoiceTrigger
{
  v2 = [a1 fallBackAssetResourcePath];
  id v3 = [CSAsset alloc];
  id v4 = [v2 stringByAppendingPathComponent:@"iOS"];
  unint64_t v5 = [(CSAsset *)v3 initWithResourcePath:v4 configFile:@"corespeech.json" configVersion:@"defaultFallback" assetProvderType:0 assetType:0];

  return v5;
}

+ (id)defaultFallBackAssetForAdBlocker
{
  id v3 = [CSAsset alloc];
  id v4 = [a1 fallBackAssetResourcePath];
  unint64_t v5 = [(CSAsset *)v3 initWithResourcePath:v4 configFile:@"adBlockerPayload.bin" configVersion:@"defaultFallbackAdBlocker" assetProvderType:0 assetType:4];

  return v5;
}

+ (id)defaultFallBackAssetForHearst
{
  id v3 = [CSAsset alloc];
  id v4 = [a1 fallBackAssetResourcePath];
  unint64_t v5 = [(CSAsset *)v3 initWithResourcePath:v4 configFile:@"corespeech.json" configVersion:@"defaultFallbackHearst" assetProvderType:0 assetType:0];

  return v5;
}

+ (id)fallBackAssetResourcePath
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (+[CSUtils isDarwinOS])
  {
    v2 = @"/System/Library/PrivateFrameworks/CoreSpeechDarwin.framework";
  }
  else
  {
    v2 = +[CSUtils getResourcePathInSystemDomainMaskFromRootPathByAppending:@"PrivateFrameworks/CoreSpeech.framework"];
  }
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int v6 = "+[CSAsset fallBackAssetResourcePath]";
    __int16 v7 = 2114;
    id v8 = v2;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Fallback asset resource path : %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return v2;
}

+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6 assetVariant:(unint64_t)a7 identity:(id)a8 assistantLanguageCode:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = +[CSAsset getAssetFileForAssetType:a3 resourcePath:v18 assetProvider:a6];
  __int16 v20 = [[CSAsset alloc] initWithResourcePath:v18 configFile:v19 configVersion:v17 assetProvderType:a6 assetType:a3 assetVariant:a7 identity:v16 assistantLanguageCode:v15];

  return v20;
}

+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6 identity:(id)a7 assistantLanguageCode:(id)a8
{
  return (id)[a1 assetForAssetType:a3 resourcePath:a4 configVersion:a5 assetProvider:a6 assetVariant:0 identity:a7 assistantLanguageCode:a8];
}

+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = +[CSAsset getAssetFileForAssetType:a3 resourcePath:v10 assetProvider:a6];
  uint64_t v12 = [[CSAsset alloc] initWithResourcePath:v10 configFile:v11 configVersion:v9 assetProvderType:a6 assetType:a3 assetVariant:0 identity:0 assistantLanguageCode:0];

  return v12;
}

+ (id)getAssetFileForAssetType:(unint64_t)a3 resourcePath:(id)a4 assetProvider:(unint64_t)a5
{
  id v7 = a4;
  switch(a3)
  {
    case 0uLL:
    case 5uLL:
    case 7uLL:
      id v8 = @"corespeech.json";
      break;
    case 1uLL:
      id v8 = +[CSAsset hybridEndpointerAssetFilename];
      break;
    case 2uLL:
      id v8 = @"assets.json";
      break;
    case 3uLL:
      id v8 = @"speakerRecognition.json";
      break;
    case 4uLL:
      if (a5 == 1)
      {
        id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v10 = [v9 contentsOfDirectoryAtPath:v7 error:0];

        if (v10 && [v10 count])
        {
          id v8 = [v10 firstObject];
        }
        else
        {
          id v8 = 0;
        }
      }
      else
      {
        id v8 = @"adBlockerPayload.bin";
      }
      break;
    case 6uLL:
      id v8 = @"mitigation.json";
      break;
    case 8uLL:
      id v8 = @"repromptMetadata.json";
      break;
    default:
      id v8 = 0;
      break;
  }

  return v8;
}

+ (id)getConfigFileNameForAssetType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 5uLL:
    case 7uLL:
      int v5 = @"corespeech.json";
      break;
    case 1uLL:
      int v5 = +[CSAsset hybridEndpointerAssetFilename];
      break;
    case 2uLL:
      int v5 = @"assets.json";
      break;
    case 3uLL:
      int v5 = @"speakerRecognition.json";
      break;
    case 4uLL:
      int v5 = @"adBlockerPayload.bin";
      break;
    case 6uLL:
      int v5 = @"mitigation.json";
      break;
    case 8uLL:
      int v5 = @"repromptMetadata.json";
      break;
    default:
      int v5 = 0;
      break;
  }
  return v5;
}

+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5
{
  return +[CSAsset assetForAssetType:a3 resourcePath:a4 configVersion:a5 assetProvider:0];
}

+ (id)hybridEndpointerAssetFilename
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return @"hybridendpointer_marsh.json";
  }
  else {
    return @"hybridendpointer.json";
  }
}

- (id)getAllNldaConfigFiles
{
  uint64_t v3 = [(CSAsset *)self resourcePath];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v5 = [(CSAsset *)self nldaConfigFile];
    [v4 addObject:v5];

    int v6 = [(CSAsset *)self nldaConfigFileForCategory:@"AttSiriCC"];
    [v4 addObject:v6];

    id v7 = [(CSAsset *)self nldaConfigFileForCategory:@"AttSiriHS"];
    [v4 addObject:v7];

    id v8 = [(CSAsset *)self nldaConfigFileForCategory:@"AttSiriJS"];
    [v4 addObject:v8];

    id v9 = [v4 allObjects];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)getAllMitigationConfigFiles
{
  uint64_t v3 = [(CSAsset *)self resourcePath];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v5 = [(CSAsset *)self mitigatonConfigFile];
    [v4 addObject:v5];

    int v6 = [(CSAsset *)self mitigationConfigFileForCategory:@"AttSiriCC"];
    [v4 addObject:v6];

    id v7 = [(CSAsset *)self mitigationConfigFileForCategory:@"AttSiriHS"];
    [v4 addObject:v7];

    id v8 = [(CSAsset *)self mitigationConfigFileForCategory:@"AttSiriJS"];
    [v4 addObject:v8];

    id v9 = [v4 allObjects];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (float)eagerMitigationDurationThreshold
{
  v2 = [(CSAsset *)self getNumberForKey:@"defaultEagerMitigationDurationThreshold" category:@"AttSiri" default:&unk_1F13B8518];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (BOOL)isJSSupported
{
  return [(CSAsset *)self getBoolForKey:@"supportJS" category:@"AttSiri" default:0];
}

- (BOOL)isMagusSupported
{
  return [(CSAsset *)self getBoolForKey:@"supportMagus" category:@"AttSiri" default:0];
}

- (BOOL)isHSVoiceTrigger:(id)a3
{
  id v3 = a3;
  float v4 = v3;
  if (v3)
  {
    int v5 = [v3 objectForKeyedSubscript:@"triggeredPhrase"];

    if (v5)
    {
      int v6 = [v4 objectForKeyedSubscript:@"triggeredPhrase"];
      LOBYTE(v5) = [v6 isEqualToString:@"HS"];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (BOOL)isJSVoiceTrigger:(id)a3
{
  id v3 = a3;
  float v4 = v3;
  if (v3)
  {
    int v5 = [v3 objectForKeyedSubscript:@"triggeredPhrase"];

    if (v5)
    {
      int v6 = [v4 objectForKeyedSubscript:@"triggeredPhrase"];
      LOBYTE(v5) = [v6 isEqualToString:@"Siri"];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (id)getCategoryKeyWithRecordCtx:(id)a3
{
  id v4 = a3;
  int v5 = [v4 activationMetadata];
  if ([(CSAsset *)self isHSVoiceTrigger:v5])
  {
    int v6 = @"AttSiriHS";
  }
  else if ([(CSAsset *)self isJSVoiceTrigger:v5])
  {
    int v6 = @"AttSiriJS";
  }
  else if ([v4 isContinuousConversation])
  {
    int v6 = @"AttSiriCC";
  }
  else
  {
    int v6 = @"AttSiri";
  }

  return v6;
}

- (BOOL)shouldRunCAROverrideForCategory:(id)a3
{
  return [(CSAsset *)self getBoolForKey:@"enableConcurrentActiveRequestOverride" category:a3 default:0];
}

- (BOOL)shouldRunSpkrIdForCategory:(id)a3
{
  return [(CSAsset *)self getBoolForKey:@"useSpkrId" category:a3 default:1];
}

- (id)uesConfigFileForCategory:(id)a3
{
  id v4 = a3;
  int v5 = [(CSAsset *)self resourcePath];
  int v6 = [(CSAsset *)self getStringForKey:@"uesConfigFile" category:v4 default:@"uesConfig.json"];

  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (id)nldaConfigFileForCategory:(id)a3
{
  id v4 = a3;
  int v5 = [(CSAsset *)self resourcePath];
  int v6 = [(CSAsset *)self getStringForKey:@"nldaConfigFile" category:v4 default:@"nldaConfig.json"];

  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (id)mitigationConfigFileForCategory:(id)a3
{
  id v4 = a3;
  int v5 = [(CSAsset *)self resourcePath];
  int v6 = [(CSAsset *)self getStringForKey:@"mitigationModelConfigFile" category:v4 default:@"ouresConfig.json"];

  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (unint64_t)allowListWordCountThreshold
{
  v2 = [(CSAsset *)self getNumberForKey:@"allowKeywordCount" category:@"AttSiriCC" default:&unk_1F13B8278];
  [v2 floatValue];
  unint64_t v4 = (unint64_t)v3;

  return v4;
}

- (NSString)allowKeywordsFile
{
  float v3 = [(CSAsset *)self resourcePath];
  unint64_t v4 = [(CSAsset *)self getStringForKey:@"allowKeywordFile" category:@"AttSiriCC" default:@"allowList.txt"];
  int v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (id)nldaConfigFile
{
  float v3 = [(CSAsset *)self resourcePath];
  unint64_t v4 = [(CSAsset *)self getStringForKey:@"nldaConfigFile" category:@"AttSiri" default:@"nldaConfig.json"];
  int v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (float)mitigationModelDefaultNLDAScore
{
  v2 = [(CSAsset *)self getNumberForKey:@"defaultNLDAValue" category:@"AttSiri" default:&unk_1F13B8508];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)mitigationModelDefaultELFusionScore
{
  v2 = [(CSAsset *)self getNumberForKey:@"defaultELScoreValue" category:@"AttSiri" default:&unk_1F13B8508];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)mitigationModelDefaultAFTMScore
{
  v2 = [(CSAsset *)self getNumberForKey:@"defaultAFTMValue" category:@"AttSiri" default:&unk_1F13B8508];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (id)mitigatonConfigFile
{
  float v3 = [(CSAsset *)self resourcePath];
  float v4 = [(CSAsset *)self getStringForKey:@"mitigationModelConfigFile" category:@"AttSiri" default:@"ouresConfig.json"];
  int v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (float)attendingTimeoutValueInSecs
{
  v2 = [(CSAsset *)self getNumberForKey:@"attendingTimeoutInSecs" category:@"AttSiri" default:&unk_1F13B8508];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int64_t)numOfConsecutiveBoronActivationThreshold
{
  v2 = [(CSAsset *)self getNumberForKey:@"numOfConsecutiveBoronActivationThreshold" category:@"AttSiri" default:&unk_1F13B8260];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (BOOL)useGazeSignal
{
  return [(CSAsset *)self getBoolForKey:@"useGazeSignal" category:@"AttSiri" default:0];
}

- (float)startOfSpeechPrependAudioDuration
{
  v2 = [(CSAsset *)self getNumberForKey:@"prependingAudioDurationInMs" category:@"AttSiri" default:&unk_1F13B84F8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)startOfSpeechThresholdDuration
{
  v2 = [(CSAsset *)self getNumberForKey:@"startOfSpeechThresholdDuration" category:@"AttSiri" default:&unk_1F13B84E8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (NSString)lipMovementVADModelFile
{
  float v3 = [(CSAsset *)self resourcePath];
  float v4 = [(CSAsset *)self getStringForKey:@"visualActivityDetectorModelFile" category:@"AttSiri" default:@"vvad.mlmodelc"];
  int v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (NSString)gazeDetectionModelFile
{
  float v3 = [(CSAsset *)self resourcePath];
  float v4 = [(CSAsset *)self getStringForKey:@"gazeDetectionModelFile" category:@"AttSiri" default:@"gazeModel.mlmodelc"];
  int v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (NSString)mimVotingConfigFile
{
  float v3 = [(CSAsset *)self resourcePath];
  float v4 = [(CSAsset *)self getStringForKey:@"mimVotingConfigFile" category:@"AttSiri" default:@"mimConfig.json"];
  int v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (unint64_t)_mapInputOriginFromAssetToCSAudioRecordType:(id)a3
{
  v17[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v16[0] = &unk_1F13B82D8;
  v17[0] = @"Unspecified";
  v17[1] = @"VoiceTrigger";
  v16[1] = &unk_1F13B82F0;
  v16[2] = &unk_1F13B8308;
  v16[3] = &unk_1F13B8320;
  v17[2] = @"VoiceTrigger";
  v17[3] = @"ButtonPress";
  v16[4] = &unk_1F13B8338;
  v16[5] = &unk_1F13B8350;
  v17[4] = @"ButtonPress";
  v17[5] = @"VoiceTrigger";
  float v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CSAsset_Liminal___mapInputOriginFromAssetToCSAudioRecordType___block_invoke;
  v10[3] = &unk_1E61FFA88;
  id v5 = v3;
  id v11 = v5;
  int v6 = [v4 keysOfEntriesPassingTest:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CSAsset_Liminal___mapInputOriginFromAssetToCSAudioRecordType___block_invoke_2;
  v9[3] = &unk_1E61FFAB0;
  v9[4] = &v12;
  [v6 enumerateObjectsUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __64__CSAsset_Liminal___mapInputOriginFromAssetToCSAudioRecordType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:");
}

uint64_t __64__CSAsset_Liminal___mapInputOriginFromAssetToCSAudioRecordType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 unsignedIntValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 1 << result;
  return result;
}

- (id)getRecognizerConfigsFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    float v4 = +[CSAsset decodeJson:v3];
    id v5 = +[CSFModelConfigDecoder getAftmRecognizerRelativeConfigFromConfigDict:v4];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v7 = [v3 stringByDeletingLastPathComponent];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = objc_msgSend(v7, "stringByAppendingPathComponent:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
            [v6 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSArray)contConvThresholds
{
  v2 = [(CSAsset *)self contConvConfigFile];
  id v3 = +[CSAsset decodeJson:v2];
  float v4 = [v3 objectForKeyedSubscript:@"checkerConfig"];

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:@"thresholds"];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
      unint64_t v7 = [v4 objectForKeyedSubscript:@"thresholds"];
      id v5 = (void *)[v6 initWithArray:v7];
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)contConvRecognizerConfigFiles
{
  id v3 = [(CSAsset *)self contConvConfigFile];
  float v4 = [(CSAsset *)self getRecognizerConfigsFrom:v3];

  return (NSArray *)v4;
}

- (NSString)contConvConfigFile
{
  id v3 = [(CSAsset *)self resourcePath];
  float v4 = [(CSAsset *)self getStringForKey:@"contionusConversationConfigFile" category:@"Liminal" default:@"progChecker.json"];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (BOOL)progCheckerShadowMode
{
  v2 = [(CSAsset *)self progCheckerConfigFile];
  id v3 = +[CSAsset decodeJson:v2];
  float v4 = [v3 objectForKeyedSubscript:@"checkerConfig"];

  if (v4
    && ([v4 objectForKeyedSubscript:@"shadowMode"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = [v4 objectForKeyedSubscript:@"shadowMode"];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (NSArray)checkerThresholds
{
  v2 = [(CSAsset *)self progCheckerConfigFile];
  id v3 = +[CSAsset decodeJson:v2];
  float v4 = [v3 objectForKeyedSubscript:@"checkerConfig"];

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:@"thresholds"];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
      char v7 = [v4 objectForKeyedSubscript:@"thresholds"];
      id v5 = (void *)[v6 initWithArray:v7];
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (unint64_t)supportedInputOrigins
{
  id v3 = [(CSAsset *)self progCheckerConfigFile];
  float v4 = +[CSAsset decodeJson:v3];
  id v5 = [v4 objectForKeyedSubscript:@"checkerConfig"];

  if (v5
    && ([v5 objectForKeyedSubscript:@"validInputOrigins"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v8 = [v5 objectForKeyedSubscript:@"validInputOrigins"];
    uint64_t v9 = (void *)[v7 initWithArray:v8];

    unint64_t v10 = [(CSAsset *)self _mapInputOriginFromAssetToCSAudioRecordType:v9];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (NSArray)progCheckerRecognizerConfigFiles
{
  id v3 = [(CSAsset *)self progCheckerConfigFile];
  float v4 = [(CSAsset *)self getRecognizerConfigsFrom:v3];

  return (NSArray *)v4;
}

- (NSString)progCheckerConfigFile
{
  id v3 = [(CSAsset *)self resourcePath];
  float v4 = [(CSAsset *)self getStringForKey:@"progressiveCheckerConfigFile" category:@"Liminal" default:@"progChecker.json"];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (float)keywordDetectorWaitTimeSinceVT
{
  v2 = [(CSAsset *)self getNumberForKey:@"waitTimeSinceVT" category:@"keywordDetector" default:&unk_1F13B8578];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (NSString)keywordDetectorConfigPathRecognizer
{
  float v3 = [(CSAsset *)self resourcePath];
  float v4 = [(CSAsset *)self getStringForKey:@"configFileRecognizer" category:@"keywordDetector" default:@"keyword_detector.json"];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (float)keywordDetectorThreshold
{
  v2 = [(CSAsset *)self getNumberForKey:@"threshold" category:@"keywordDetector" default:&unk_1F13B8568];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

@end
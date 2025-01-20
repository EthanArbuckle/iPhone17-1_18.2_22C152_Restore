@interface LSRSpeechAssets
+ (id)assetConfigParameters:(id)a3;
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)_geoLMCompatibleWithMainAsset:(id)a3 geoAssetConfig:(id)a4;
- (id)installedGeoLMRegionSpecificAssetForLanguage:(id)a3 clientID:(id)a4 regionId:(id)a5 mainAssetConfig:(id)a6;
- (id)installedHammerConfigFileForLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5;
- (id)installedLanguageDetectorAssetWithClientID:(id)a3;
- (void)installedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4;
@end

@implementation LSRSpeechAssets

- (id)installedLanguageDetectorAssetWithClientID:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  v5 = [v4 stringForKey:kSFSpeechRecognizerCustomLIDAssetPathKey];

  if (v5 && [v5 length] && SFIsInternalInstall())
  {
    v6 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "-[LSRSpeechAssets installedLanguageDetectorAssetWithClientID:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Custom Language Detection asset path: %@", (uint8_t *)&v12, 0x16u);
    }
    id v7 = v5;
  }
  else
  {
    id v8 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:@"en-US" assetType:6];
    v9 = +[SFEntitledAssetManager sharedInstance];
    id v7 = [v9 installedAssetWithConfig:v8 regionId:0 shouldSubscribe:1 subscriberId:v3 expiration:0];

    v10 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "-[LSRSpeechAssets installedLanguageDetectorAssetWithClientID:]";
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Language Detection asset path: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v7;
}

- (BOOL)_geoLMCompatibleWithMainAsset:(id)a3 geoAssetConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v5];
  id v8 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v6];
  v9 = [v7 version];
  v10 = [v8 version];
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if (v11)
  {

    BOOL v12 = 1;
  }
  else
  {
    v13 = SFLogConnection;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v7 version];
      v16 = [v8 version];
      int v17 = 136316162;
      v18 = "-[LSRSpeechAssets _geoLMCompatibleWithMainAsset:geoAssetConfig:]";
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s GeoLM: model-info.version doesn't match. mainASRModelInfo.version=%@ geoLMModelInfo.version=%@ mainAssetConfig=%@ geoAssetConfig=%@", (uint8_t *)&v17, 0x34u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (id)installedGeoLMRegionSpecificAssetForLanguage:(id)a3 clientID:(id)a4 regionId:(id)a5 mainAssetConfig:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v10 assetType:5];
  id v15 = +[SFEntitledAssetManager sharedInstance];
  v16 = [v15 installedAssetWithConfig:v14 regionId:v11 shouldSubscribe:1 subscriberId:v13 expiration:0];

  if ([v16 length])
  {
    int v17 = +[SFEntitledAssetManager jsonFilenameForAssetType:5];
    v18 = [v16 stringByAppendingPathComponent:v17];

    if ([(LSRSpeechAssets *)self _geoLMCompatibleWithMainAsset:v12 geoAssetConfig:v18])
    {
      id v19 = v18;
    }
    else
    {
      __int16 v21 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_FAULT))
      {
        int v23 = 136315395;
        id v24 = "-[LSRSpeechAssets installedGeoLMRegionSpecificAssetForLanguage:clientID:regionId:mainAssetConfig:]";
        __int16 v25 = 2113;
        id v26 = v11;
        _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s GeoLM: Region specific asset for %{private}@ is incompatible with the main asset.", (uint8_t *)&v23, 0x16u);
      }
      id v19 = 0;
    }
  }
  else
  {
    v20 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315651;
      id v24 = "-[LSRSpeechAssets installedGeoLMRegionSpecificAssetForLanguage:clientID:regionId:mainAssetConfig:]";
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2113;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s GeoLM: No region specific asset found for language: %@, regionId: %{private}@", (uint8_t *)&v23, 0x20u);
    }
    id v19 = 0;
  }

  return v19;
}

- (id)installedHammerConfigFileForLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5
{
  id v7 = a3;
  if (a4 == 7)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = a5;
    id v10 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v7 assetType:1];
    id v11 = +[SFEntitledAssetManager sharedInstance];
    id v12 = [v11 installedAssetWithConfig:v10 regionId:0 shouldSubscribe:1 subscriberId:v9 expiration:0];

    if ([v12 length])
    {
      id v13 = +[SFEntitledAssetManager jsonFilenameForAssetType:1];
      id v14 = [v12 stringByAppendingPathComponent:v13];

      id v15 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v14];
      if (v15)
      {
        id v8 = v14;
      }
      else
      {
        int v17 = SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_FAULT))
        {
          int v19 = 136315394;
          v20 = "-[LSRSpeechAssets installedHammerConfigFileForLanguage:assetType:clientID:]";
          __int16 v21 = 2112;
          id v22 = v14;
          _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s Failed to read Hammer config file at path: %@", (uint8_t *)&v19, 0x16u);
        }
        id v8 = 0;
      }
    }
    else
    {
      v16 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        int v19 = 136315394;
        v20 = "-[LSRSpeechAssets installedHammerConfigFileForLanguage:assetType:clientID:]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s No Hammer asset found for language: %@", (uint8_t *)&v19, 0x16u);
      }
      id v8 = 0;
    }
  }

  return v8;
}

- (void)installedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = (void (**)(id, void *))a4;
    id v6 = +[SFEntitledAssetManager sharedInstance];
    id v7 = [v6 installedLanguagesForAssetType:a3];

    id v8 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      id v9 = v8;
      id v10 = SFEntitledAssetTypeToString();
      int v11 = 136315650;
      id v12 = "-[LSRSpeechAssets installedLanguagesForAssetType:completion:]";
      __int16 v13 = 2112;
      id v14 = v10;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Installed languages for %@: %@", (uint8_t *)&v11, 0x20u);
    }
    v5[2](v5, v7);
  }
}

+ (id)assetConfigParameters:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3];
  if (v4)
  {
    id v13 = 0;
    id v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v13];
    id v6 = v13;
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v10 = v5;
    }
    else
    {
      id v9 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "+[LSRSpeechAssets assetConfigParameters:]";
        __int16 v16 = 2112;
        id v17 = v3;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Failed to parse json config file:%@", buf, 0x16u);
      }
      id v10 = 0;
    }
  }
  else
  {
    int v11 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "+[LSRSpeechAssets assetConfigParameters:]";
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to read json file: %@", buf, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

+ (id)sharedInstance
{
  if (qword_100065430 != -1) {
    dispatch_once(&qword_100065430, &stru_100059B88);
  }
  v2 = (void *)qword_100065428;

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    SFLogInitIfNeeded();
  }
}

@end
@interface ESAssetManager
+ (id)sharedInstance;
- (BOOL)_geoLMCompatibleWithMainAsset:(id)a3 geoAssetConfig:(id)a4;
- (BOOL)geoLmInitialized;
- (BOOL)isTrialAssetDeliveryEnabled;
- (BOOL)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 error:(id *)a5;
- (BOOL)validateHammerConfigFile:(id)a3;
- (ESAssetManager)init;
- (id)_installedGeoLMRegionMappingForLanguage:(id)a3;
- (id)geoLMRegionIdForLocation:(id)a3;
- (id)installationStatusForLanguagesIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withError:(id *)a6;
- (id)installedGeoLMRegionSpecificAssetForLanguage:(id)a3 regionId:(id)a4 mainAssetConfig:(id)a5;
- (id)installedHammerConfigFileForLanguage:(id)a3;
- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4;
- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5;
- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5 ignoreSpellingModel:(BOOL)a6;
- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4;
- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5;
- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5 ignoreSpellingModel:(BOOL)a6;
- (void)_invalidateInstallationStatusCacheForAssetType:(unint64_t)a3;
- (void)cleanupUnusedSubscriptions;
- (void)dealloc;
- (void)handlePostUpgradeSubscriptions;
- (void)initializeGeoLMWithLanguage:(id)a3;
- (void)purgeUnusedGeoLMAssetsForLanguage:(id)a3;
- (void)registerNotifications;
@end

@implementation ESAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earGeoLMHelper, 0);
  objc_storeStrong((id *)&self->_profileAssetPathsInUse, 0);
  objc_storeStrong((id *)&self->_recognizerAssetPathsInUse, 0);
  objc_storeStrong((id *)&self->_tokenForAssetUpdateNotification, 0);
  objc_storeStrong((id *)&self->_languageInstallationCache, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)purgeUnusedGeoLMAssetsForLanguage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000117E8;
  block[3] = &unk_100051540;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (BOOL)_geoLMCompatibleWithMainAsset:(id)a3 geoAssetConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    id v9 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v5];
    id v10 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v7];
    v11 = [v9 version];
    v12 = [v10 version];
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if (v13)
    {

      BOOL v8 = 1;
    }
    else
    {
      v14 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = [v9 version];
        v17 = [v10 version];
        int v18 = 136316162;
        v19 = "-[ESAssetManager _geoLMCompatibleWithMainAsset:geoAssetConfig:]";
        __int16 v20 = 2112;
        v21 = v16;
        __int16 v22 = 2112;
        v23 = v17;
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v26 = 2112;
        v27 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s GeoLM: model-info.version doesn't match. mainASRModelInfo.version=%@ geoLMModelInfo.version=%@ mainAssetConfig=%@ geoAssetConfig=%@", (uint8_t *)&v18, 0x34u);
      }
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)installedGeoLMRegionSpecificAssetForLanguage:(id)a3 regionId:(id)a4 mainAssetConfig:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v7 assetType:5];
  v11 = +[SFEntitledAssetManager sharedInstance];
  v12 = +[NSBundle mainBundle];
  unsigned __int8 v13 = [v12 bundleIdentifier];
  v14 = [v11 installedAssetWithConfig:v10 regionId:v8 shouldSubscribe:1 subscriberId:v13 expiration:0];

  if (v14 && [v14 length])
  {
    v15 = +[SFEntitledAssetManager jsonFilenameForAssetType:5];
    v16 = [v14 stringByAppendingPathComponent:v15];
    v17 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 136315650;
      id v25 = "-[ESAssetManager installedGeoLMRegionSpecificAssetForLanguage:regionId:mainAssetConfig:]";
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s GeoLM: region specific [%@] geo-config json file=%@", (uint8_t *)&v24, 0x20u);
    }
    int v18 = +[CESRGeoLMRegionIDCache sharedInstance];
    [v18 updateGeoLMAssetsInfoDictWithRegionId:v8 language:v7];

    v19 = +[ESAssetManager sharedInstance];
    unsigned int v20 = [v19 _geoLMCompatibleWithMainAsset:v9 geoAssetConfig:v16];

    if (v20)
    {

      goto LABEL_13;
    }
    __int16 v22 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      int v24 = 136315394;
      id v25 = "-[ESAssetManager installedGeoLMRegionSpecificAssetForLanguage:regionId:mainAssetConfig:]";
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "%s GeoLM: geoLM region specific [%@] asset exists on device, but not compatible.", (uint8_t *)&v24, 0x16u);
    }
  }
  else
  {
    v21 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315650;
      id v25 = "-[ESAssetManager installedGeoLMRegionSpecificAssetForLanguage:regionId:mainAssetConfig:]";
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s GeoLM: region specific asset is not found for given language=%@ regionId=%@", (uint8_t *)&v24, 0x20u);
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (id)geoLMRegionIdForLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    v11 = AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
LABEL_8:
      id v9 = 0;
      goto LABEL_9;
    }
    int v14 = 136315138;
    v15 = "-[ESAssetManager geoLMRegionIdForLocation:]";
    v12 = "%s GeoLM: location is nil.";
LABEL_13:
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v14, 0xCu);
    goto LABEL_8;
  }
  [v4 coordinate];
  double v7 = v6;
  [v5 coordinate];
  earGeoLMHelper = self->_earGeoLMHelper;
  if (!earGeoLMHelper)
  {
    v11 = AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    int v14 = 136315138;
    v15 = "-[ESAssetManager geoLMRegionIdForLocation:]";
    v12 = "%s GeoLM: _EARGeoLMHelper not initialized";
    goto LABEL_13;
  }
  id v9 = -[_EARGeoLMHelper regionIdForLatitude:longitude:](earGeoLMHelper, "regionIdForLatitude:longitude:", v7);
  id v10 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315394;
    v15 = "-[ESAssetManager geoLMRegionIdForLocation:]";
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s GeoLM: For the given location, selected regionId=%@", (uint8_t *)&v14, 0x16u);
  }
LABEL_9:

  return v9;
}

- (void)initializeGeoLMWithLanguage:(id)a3
{
  if (a3)
  {
    id v4 = -[ESAssetManager _installedGeoLMRegionMappingForLanguage:](self, "_installedGeoLMRegionMappingForLanguage:");
    if (v4)
    {
      id v7 = v4;
      id v5 = (_EARGeoLMHelper *)[objc_alloc((Class)_EARGeoLMHelper) initWithConfiguration:v4];
      earGeoLMHelper = self->_earGeoLMHelper;
      self->_earGeoLMHelper = v5;

      id v4 = v7;
    }
  }
}

- (BOOL)geoLmInitialized
{
  return self->_earGeoLMHelper != 0;
}

- (id)_installedGeoLMRegionMappingForLanguage:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v3 assetType:4];
  id v5 = +[SFEntitledAssetManager sharedInstance];
  double v6 = +[NSBundle mainBundle];
  id v7 = [v6 bundleIdentifier];
  id v8 = [v5 installedAssetWithConfig:v4 regionId:0 shouldSubscribe:1 subscriberId:v7 expiration:0];

  if (v8 && [v8 length])
  {
    id v9 = +[SFEntitledAssetManager jsonFilenameForAssetType:4];
    id v10 = [v8 stringByAppendingPathComponent:v9];
    v11 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "-[ESAssetManager _installedGeoLMRegionMappingForLanguage:]";
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s GeoLM: region mapping json file=%@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v12 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[ESAssetManager _installedGeoLMRegionMappingForLanguage:]";
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s GeoLM: region mapping json file is nil Or there is no regionMapping for given language=%@", (uint8_t *)&v14, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

- (BOOL)validateHammerConfigFile:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:v3];
  id v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ESAssetManager validateHammerConfigFile:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Hammer model info=%@", (uint8_t *)&v7, 0x16u);
  }

  return 1;
}

- (id)installedHammerConfigFileForLanguage:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v3 assetType:1];

  id v5 = +[SFEntitledAssetManager sharedInstance];
  double v6 = [v5 installedAssetWithConfig:v4 regionId:0 shouldSubscribe:0 subscriberId:0 expiration:0];

  if (v6 && [v6 length])
  {
    int v7 = +[SFEntitledAssetManager jsonFilenameForAssetType:1];
    id v8 = [v6 stringByAppendingPathComponent:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isTrialAssetDeliveryEnabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.internal.ck"];
  id v3 = [v2 objectForKey:@"disableTrialAssetDelivery"];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ESAssetManager isTrialAssetDeliveryEnabled]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Trial asset delivery is explicitly disabled!", (uint8_t *)&v9, 0xCu);
    }
    unsigned __int8 v6 = 0;
  }
  else
  {
    int v7 = [v2 objectForKey:@"enableTrialAssetDelivery"];
    if ([v7 BOOLValue]) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = +[AFFeatureFlags isSiriXEnabled];
    }
  }
  return v6;
}

- (void)cleanupUnusedSubscriptions
{
  id v2 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "-[ESAssetManager cleanupUnusedSubscriptions]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Cleaning up unused subscriptions.", (uint8_t *)&v8, 0xCu);
  }
  id v3 = +[NSMutableSet set];
  unsigned int v4 = +[AFPreferences sharedPreferences];
  if ([v4 dictationIsEnabled])
  {
    id v5 = [v4 activeDictationLanguages];
    [v3 addObjectsFromArray:v5];
  }
  unsigned __int8 v6 = +[SFEntitledAssetManager subscriberIdForDictationAssets];
  id v7 = +[SFEntitledAssetManager unsubscribeFromAssetsWithAssetType:3 exceptLanguages:v3 subscriberId:v6];
}

- (void)handlePostUpgradeSubscriptions
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned int v3 = [v2 dictationIsEnabled];

  if (v3)
  {
    unsigned int v4 = +[SFEntitledAssetManager sharedInstance];
    id v5 = [v4 installationStatusForLanguagesWithAssetType:3];

    [v5 enumerateKeysAndObjectsUsingBlock:&stru_100050E10];
  }
}

- (BOOL)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000129B0;
  block[3] = &unk_100051470;
  unsigned __int8 v13 = self;
  unint64_t v14 = a4;
  id v12 = v7;
  id v9 = v7;
  dispatch_async(queue, block);

  return 1;
}

- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5 ignoreSpellingModel:(BOOL)a6
{
  BOOL v6 = a5;
  id v8 = a3;
  id v9 = [v8 language];
  if (v6)
  {
    id v10 = +[AFPreferences sharedPreferences];
    if (([v10 dictationIsEnabled] & 1) == 0
      && ([v10 assistantIsEnabled] & 1) == 0)
    {
      __int16 v28 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Siri and Dictation are both disabled, no need to access asset", buf, 0xCu);
      }
      goto LABEL_16;
    }
  }
  if (![(ESAssetManager *)self isTrialAssetDeliveryEnabled])
  {
LABEL_13:
    [v8 assetType];
    int v24 = SFEntitledAssetTypeToString();
    id v25 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]";
      __int16 v36 = 2114;
      v37 = v9;
      __int16 v38 = 2114;
      v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s No assets available for language: %{public}@, asset type: %{public}@", buf, 0x20u);
    }
    queue = self->_queue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100012E68;
    v29[3] = &unk_1000513D0;
    id v30 = v9;
    id v31 = v24;
    id v10 = v24;
    dispatch_async(queue, v29);

LABEL_16:
    v23 = 0;
    goto LABEL_17;
  }
  id v10 = +[SFEntitledAssetManager sharedInstance];
  v11 = +[NSBundle mainBundle];
  id v12 = [v11 bundleIdentifier];
  unsigned __int8 v13 = [v10 installedAssetWithConfig:v8 regionId:0 shouldSubscribe:v6 subscriberId:v12 expiration:0];

  if (!v13)
  {

    goto LABEL_13;
  }
  unint64_t v14 = (void *)qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    __int16 v16 = [v8 language];
    [v8 assetType];
    id v17 = SFEntitledAssetTypeToString();
    *(_DWORD *)buf = 136315906;
    v35 = "-[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]";
    __int16 v36 = 2114;
    v37 = v16;
    __int16 v38 = 2114;
    v39 = v17;
    __int16 v40 = 2114;
    v41 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Using ASR Trial assets for language: %{public}@, asset type: %{public}@, at path: %{public}@", buf, 0x2Au);
  }
  uint64_t v18 = [v10 modelQualityTypeStatusStringWithConfig:v8];
  v19 = (void *)v18;
  unsigned int v20 = &stru_1000519F0;
  if (v18) {
    unsigned int v20 = (__CFString *)v18;
  }
  v21 = v20;

  v32[0] = @"quasarModelPath";
  v32[1] = @"type";
  v33[0] = v13;
  v33[1] = v21;
  v32[2] = @"trial";
  __int16 v22 = +[NSNumber numberWithBool:1];
  v33[2] = v22;
  v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];

LABEL_17:

  return v23;
}

- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5
{
  return [(ESAssetManager *)self installedModelInfoForAssetConfig:a3 error:a4 triggerDownload:a5 ignoreSpellingModel:0];
}

- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4
{
  return [(ESAssetManager *)self installedModelInfoForAssetConfig:a3 error:a4 triggerDownload:1];
}

- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5 ignoreSpellingModel:(BOOL)a6
{
  BOOL v6 = [(ESAssetManager *)self installedModelInfoForAssetConfig:a3 error:a4 triggerDownload:a5 ignoreSpellingModel:a6];
  id v7 = [v6 objectForKey:@"quasarModelPath"];

  return v7;
}

- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5
{
  id v5 = [(ESAssetManager *)self installedModelInfoForAssetConfig:a3 error:a4 triggerDownload:a5];
  BOOL v6 = [v5 objectForKey:@"quasarModelPath"];

  return v6;
}

- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4
{
  unsigned int v4 = [(ESAssetManager *)self installedModelInfoForAssetConfig:a3 error:a4];
  id v5 = [v4 objectForKey:@"quasarModelPath"];

  return v5;
}

- (void)_invalidateInstallationStatusCacheForAssetType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[ESAssetManager _invalidateInstallationStatusCacheForAssetType:]";
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Invalidating installation status cache for %lu", (uint8_t *)&v11, 0x16u);
  }
  if (![(ESAssetManager *)self isTrialAssetDeliveryEnabled]
    || (id v6 = objc_alloc_init((Class)SFEntitledAssetManager),
        [v6 installationStatusForLanguagesWithAssetType:a3],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    id v8 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[ESAssetManager _invalidateInstallationStatusCacheForAssetType:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Language installation status query failed.", (uint8_t *)&v11, 0xCu);
    }
    id v7 = 0;
  }
  languageInstallationCache = self->_languageInstallationCache;
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)languageInstallationCache setObject:v7 forKeyedSubscript:v10];
}

- (id)installationStatusForLanguagesIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withError:(id *)a6
{
  BOOL v8 = a3;
  id v10 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    CFStringRef v11 = @"NO";
    if (v8) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ESAssetManager installationStatusForLanguagesIgnoringCache:assetType:withDetailedStatus:withError:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Installation status for languages (ignoring cache: %@)", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v19 = sub_1000133A0;
  unsigned int v20 = sub_1000133B0;
  id v21 = 0;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000133B8;
  v15[3] = &unk_100050DD0;
  v15[4] = self;
  v15[5] = buf;
  v15[6] = a4;
  BOOL v16 = v8;
  BOOL v17 = a5;
  dispatch_sync(queue, v15);
  id v13 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v13;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_tokenForAssetUpdateNotification enumerateKeysAndObjectsUsingBlock:&stru_100050DA8];
  v3.receiver = self;
  v3.super_class = (Class)ESAssetManager;
  [(ESAssetManager *)&v3 dealloc];
}

- (void)registerNotifications
{
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100013978;
  v19[3] = &unk_100050D68;
  objc_copyWeak(&v20, &location);
  objc_super v3 = objc_retainBlock(v19);
  v29[0] = @"com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_ASR_ASSISTANT";
  v29[1] = @"com.apple.siri.uaf.com.apple.siri.understanding";
  v29[2] = @"com.apple.MobileAsset.AutoAssetNotification^com.apple.MobileAsset.MAAutoAsset^STARTUP_ACTIVATED";
  +[NSArray arrayWithObjects:v29 count:3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        BOOL v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int out_token = 0;
        id v9 = v8;
        uint32_t v10 = notify_register_dispatch((const char *)[v9 UTF8String], &out_token, (dispatch_queue_t)self->_queue, v3);
        if (v10)
        {
          CFStringRef v11 = AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v23 = "-[ESAssetManager registerNotifications]";
            __int16 v24 = 2112;
            id v25 = v9;
            __int16 v26 = 1024;
            uint32_t v27 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to register for %@ update notifications: %u", buf, 0x1Cu);
          }
          int v12 = -1;
          int out_token = -1;
        }
        else
        {
          int v12 = out_token;
        }
        id v13 = +[NSNumber numberWithInteger:v12];
        [(NSMutableDictionary *)self->_tokenForAssetUpdateNotification setObject:v13 forKeyedSubscript:v9];
      }
      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (ESAssetManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)ESAssetManager;
  id v2 = [(ESAssetManager *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.siri.embeddedspeech.ESAssetManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    tokenForAssetUpdateNotification = v2->_tokenForAssetUpdateNotification;
    v2->_tokenForAssetUpdateNotification = (NSMutableDictionary *)v5;

    [(ESAssetManager *)v2 registerNotifications];
    uint64_t v7 = +[NSMutableDictionary dictionary];
    recognizerAssetPathsInUse = v2->_recognizerAssetPathsInUse;
    v2->_recognizerAssetPathsInUse = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    profileAssetPathsInUse = v2->_profileAssetPathsInUse;
    v2->_profileAssetPathsInUse = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    languageInstallationCache = v2->_languageInstallationCache;
    v2->_languageInstallationCache = (NSMutableDictionary *)v11;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10005D9C0 != -1) {
    dispatch_once(&qword_10005D9C0, &stru_100050D40);
  }
  id v2 = (void *)qword_10005D9B8;

  return v2;
}

@end
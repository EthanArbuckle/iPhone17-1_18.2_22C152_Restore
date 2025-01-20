@interface CSAssetController
+ (id)filteredAssetsForAssets:(id)a3 assetType:(unint64_t)a4 language:(id)a5;
+ (id)filteredAssetsForFetchRemoteMetaDataForAssets:(id)a3 assetType:(unint64_t)a4;
+ (id)getAdBlockerAssetTypeString;
+ (id)getAssetTypeStringForType:(unint64_t)a3;
+ (id)getEndpointAssetTypeString;
+ (id)getLanguageDetectorAssetTypeString;
+ (id)getSpeakerRecognitionAssetTypeString;
+ (id)getVoiceTriggerAssetTypeString;
+ (id)sharedController;
+ (unint64_t)getAdBlockerCurrentCompatibilityVersion;
+ (unint64_t)getEndpointAssetCurrentCompatibilityVersion;
+ (unint64_t)getLanguageDetectorCurrentCompatibilityVersion;
+ (unint64_t)getSpeakerRecognitionCurrentCompatibilityVersion;
+ (unint64_t)getVoiceTriggerAssetCurrentCompatibilityVersion;
+ (void)addKeyValuePairForQuery:(id *)a3 assetType:(unint64_t)a4;
- (BOOL)_isRetryRecommendedWithResult:(int64_t)a3;
- (CSAssetController)init;
- (NSDictionary)csAssetsDictionary;
- (NSMutableDictionary)observers;
- (OS_dispatch_queue)assetsMigrationQueue;
- (OS_dispatch_queue)queue;
- (id)_assetQueryForAssetType:(unint64_t)a3;
- (id)_defaultDownloadOptions;
- (id)_findLatestInstalledAsset:(id)a3;
- (id)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4;
- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4;
- (id)assetOfType:(unint64_t)a3 language:(id)a4;
- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4;
- (id)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4;
- (void)_cleanUpMobileAssetV1Directory;
- (void)_downloadAsset:(id)a3 withComplete:(id)a4;
- (void)_downloadAssetCatalogForAssetType:(unint64_t)a3 complete:(id)a4;
- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5;
- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 query:(id)a5 completion:(id)a6;
- (void)_installedAssetOfType:(unint64_t)a3 query:(id)a4 withLanguage:(id)a5 completion:(id)a6;
- (void)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5;
- (void)_runAssetQuery:(id)a3 completion:(id)a4;
- (void)_setAssetQueryParameters:(id)a3;
- (void)_startDownloadingAsset:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)_updateFromRemoteToLocalAssets:(id)a3 forAssetType:(unint64_t)a4 completion:(id)a5;
- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6;
- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5;
- (void)fetchRemoteMetaOfType:(unint64_t)a3;
- (void)fetchRemoteMetaOfType:(unint64_t)a3 allowRetry:(BOOL)a4;
- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5;
- (void)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)setAssetsMigrationQueue:(id)a3;
- (void)setCsAssetsDictionary:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAssetController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_csAssetsDictionary, 0);
  objc_storeStrong((id *)&self->_assetsMigrationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setCsAssetsDictionary:(id)a3
{
}

- (NSDictionary)csAssetsDictionary
{
  return self->_csAssetsDictionary;
}

- (void)setAssetsMigrationQueue:(id)a3
{
}

- (OS_dispatch_queue)assetsMigrationQueue
{
  return self->_assetsMigrationQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000095CC;
  block[3] = &unk_10001C778;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000976C;
  block[3] = &unk_10001C778;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_startDownloadingAsset:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (void *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[CSAssetController _startDownloadingAsset:progress:completion:]";
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2050;
    id v31 = [v8 state];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Attempting to download asset %{public}@, asset state : %{public}ld", buf, 0x20u);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100009BE4;
  v24[3] = &unk_10001CA28;
  id v13 = v9;
  id v26 = v13;
  id v14 = v8;
  id v25 = v14;
  v15 = objc_retainBlock(v24);
  switch((unint64_t)[v14 state])
  {
    case 0uLL:
      uint64_t v16 = CSErrorDomain;
      uint64_t v17 = 808;
      goto LABEL_5;
    case 1uLL:
      *(void *)buf = 0;
      unsigned int v20 = [v14 spaceCheck:buf];
      if (v20)
      {
        [v14 attachProgressCallBack:v15];
        v21 = [(CSAssetController *)self _defaultDownloadOptions];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100009C88;
        v22[3] = &unk_10001CA50;
        id v23 = v10;
        [v14 startDownload:v21 then:v22];

        v18 = 0;
      }
      else
      {
        v18 = +[NSError errorWithDomain:CSErrorDomain code:807 userInfo:0];
      }
      int v19 = v20 ^ 1;
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
      uint64_t v16 = CSErrorDomain;
      uint64_t v17 = 806;
      goto LABEL_5;
    case 4uLL:
      uint64_t v16 = CSErrorDomain;
      uint64_t v17 = 805;
LABEL_5:
      v18 = +[NSError errorWithDomain:v16 code:v17 userInfo:0];
      break;
    default:
      v18 = 0;
      break;
  }
  int v19 = 1;
  if (v10)
  {
LABEL_7:
    if (v19) {
      (*((void (**)(id, void *))v10 + 2))(v10, v18);
    }
  }
LABEL_9:
}

- (void)_downloadAsset:(id)a3 withComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAssetController _downloadAsset:withComplete:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ::: Start downloading asset", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009EA4;
  v11[3] = &unk_10001CA00;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(CSAssetController *)self _startDownloadingAsset:v10 progress:&stru_10001C9D8 completion:v11];
}

- (id)_defaultDownloadOptions
{
  v2 = objc_opt_new();
  [v2 setAllowsCellularAccess:0];
  [v2 setCanUseLocalCacheServer:0];
  [v2 setDiscretionary:0];
  return v2;
}

- (void)_updateFromRemoteToLocalAssets:(id)a3 forAssetType:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  v38 = self;
  id v39 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ::: Fetching remote asset", buf, 0xCu);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  long long v48 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (!v10)
  {
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    goto LABEL_24;
  }
  id v11 = v10;
  id v12 = 0;
  id v13 = 0;
  id v14 = 0;
  uint64_t v15 = *(void *)v49;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v49 != v15) {
        objc_enumerationMutation(v9);
      }
      uint64_t v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      if (v14)
      {
        if ([*(id *)(*((void *)&v48 + 1) + 8 * i) isLatestCompareTo:v14])
        {
          id v18 = v17;

          id v14 = v18;
        }
      }
      else
      {
        id v14 = v17;
      }
      if ([v17 isCSAssetInstalled])
      {
        if (!v13)
        {
          id v13 = v17;
          continue;
        }
        if ([v17 isLatestCompareTo:v13])
        {
          id v19 = v13;

          id v13 = v17;
        }
        else
        {
          if (![v17 isLatestCompareTo:v12]) {
            continue;
          }
          id v19 = v17;
        }
        id v12 = v19;
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v48 objects:v57 count:16];
  }
  while (v11);
LABEL_24:

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v45;
    id v40 = v20;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(id *)(*((void *)&v44 + 1) + 8 * (void)j);
        if (v25 != v14 && v25 != v13 && v25 != v12)
        {
          if ([*(id *)(*((void *)&v44 + 1) + 8 * (void)j) isDownloading])
          {
            [v25 cancelDownloadSync];
          }
          else if ([v25 canBePurged])
          {
            __int16 v28 = (void *)CSLogCategoryAsset;
            if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
            {
              id v29 = v28;
              __int16 v30 = [v25 path];
              *(_DWORD *)buf = 136315394;
              v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
              __int16 v54 = 2114;
              unint64_t v55 = (unint64_t)v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s ::: Purging installed asset : %{public}@", buf, 0x16u);
            }
            [v25 purgeSync];
            id v31 = +[CSFPreferences sharedPreferences];
            v32 = [v31 getOnDeviceCompilationCacheDirectory];
            id v33 = +[CSOnDeviceMAAssetCachedIrPurger purgeCachedIrForMAAsset:v25 cachedIrDir:v32];

            id v20 = v40;
          }
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v22);
  }

  if (!v14 || v14 == v13)
  {
    v35 = v39;
    if (v13)
    {
      if (v39) {
        (*((void (**)(id, void))v39 + 2))(v39, 0);
      }
    }
    else if (v39)
    {
      v36 = +[NSError errorWithDomain:CSErrorDomain code:802 userInfo:0];
      (*((void (**)(id, void *))v39 + 2))(v39, v36);
    }
  }
  else
  {
    v34 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
      __int16 v54 = 2050;
      unint64_t v55 = a4;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s ::: Request downloading remote asset for assetType %{public}lu", buf, 0x16u);
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000A6A4;
    v41[3] = &unk_10001C998;
    v35 = v39;
    v41[4] = v38;
    id v42 = v39;
    unint64_t v43 = a4;
    [(CSAssetController *)v38 _downloadAsset:v14 withComplete:v41];
  }
}

- (BOOL)_isRetryRecommendedWithResult:(int64_t)a3
{
  BOOL result = 1;
  if ((unint64_t)(a3 - 8) > 0x3F || ((1 << (a3 - 8)) & 0x800000800C410723) == 0) {
    return (unint64_t)(a3 - 1) < 3;
  }
  return result;
}

- (void)_downloadAssetCatalogForAssetType:(unint64_t)a3 complete:(id)a4
{
  id v6 = a4;
  csAssetsDictionary = self->_csAssetsDictionary;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSDictionary *)csAssetsDictionary objectForKeyedSubscript:v8];
  id v10 = [(CSAssetController *)self _defaultDownloadOptions];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000AA68;
  v12[3] = &unk_10001C970;
  id v13 = v6;
  unint64_t v14 = a3;
  v12[4] = self;
  id v11 = v6;
  +[MAAsset startCatalogDownload:v9 options:v10 then:v12];
}

- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 query:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v11 returnTypes:2];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000ACF0;
  v16[3] = &unk_10001C8A8;
  v16[4] = self;
  id v17 = v11;
  id v19 = v12;
  unint64_t v20 = a3;
  id v18 = v10;
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  [v15 queryMetaData:v16];
}

- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v11 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s ::: Request fetching remote asset", (uint8_t *)&v13, 0xCu);
  }
  id v12 = [(CSAssetController *)self _assetQueryForAssetType:a3];
  [(CSAssetController *)self _fetchRemoteAssetOfType:a3 withLanguage:v10 query:v12 completion:v9];
}

- (void)fetchRemoteMetaOfType:(unint64_t)a3 allowRetry:(BOOL)a4
{
  id v7 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSAssetController fetchRemoteMetaOfType:allowRetry:]";
    __int16 v12 = 1026;
    int v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ::: Request Fetching RemoteMetaData : assetType : %{public}d", buf, 0x12u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B200;
  v8[3] = &unk_10001C920;
  v8[4] = self;
  v8[5] = a3;
  BOOL v9 = a4;
  [(CSAssetController *)self _downloadAssetCatalogForAssetType:a3 complete:v8];
}

- (void)fetchRemoteMetaOfType:(unint64_t)a3
{
}

- (void)_runAssetQuery:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[CSAssetController _runAssetQuery:completion:]";
    __int16 v15 = 2082;
    uint64_t v16 = "-[CSAssetController _runAssetQuery:completion:]";
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ::: %{public}s; query: %{public}@", buf, 0x20u);
  }
  kdebug_trace();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B590;
  v10[3] = &unk_10001C8D0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v9 queryMetaData:v10];
}

- (void)_setAssetQueryParameters:(id)a3
{
  id v3 = a3;
  v4 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSAssetController _setAssetQueryParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s setDoNotBlockBeforeFirstUnlock: YES", (uint8_t *)&v5, 0xCu);
  }
  [v3 setDoNotBlockBeforeFirstUnlock:1];
}

- (id)_assetQueryForAssetType:(unint64_t)a3
{
  int v5 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[CSAssetController _assetQueryForAssetType:]";
    __int16 v16 = 2050;
    unint64_t v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ::: assetType: %{public}lu", buf, 0x16u);
  }
  id v6 = objc_alloc((Class)MAAssetQuery);
  csAssetsDictionary = self->_csAssetsDictionary;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSDictionary *)csAssetsDictionary objectForKeyedSubscript:v8];
  id v10 = [v6 initWithType:v9];

  id v13 = v10;
  +[CSAssetController addKeyValuePairForQuery:&v13 assetType:a3];
  id v11 = v13;

  [(CSAssetController *)self _setAssetQueryParameters:v11];
  return v11;
}

- (id)_findLatestInstalledAsset:(id)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v3)
  {
    id v5 = v3;
    id v6 = 0;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v4 = 136315394;
    long long v18 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v10 = (unint64_t)objc_msgSend(v9, "state", v18);
        id v11 = CSLogCategoryAsset;
        if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          id v25 = "-[CSAssetController _findLatestInstalledAsset:]";
          __int16 v26 = 2050;
          unint64_t v27 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Asset state : %{public}ld", buf, 0x16u);
        }
        if (v10 <= 6 && ((1 << v10) & 0x6C) != 0)
        {
          if (v6)
          {
            if ([v9 isLatestCompareTo:v6])
            {
              id v13 = v9;

              id v6 = v13;
            }
          }
          else
          {
            id v6 = v9;
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  id v14 = (void *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = v14;
    __int16 v16 = [v6 attributes];
    *(_DWORD *)buf = 136315394;
    id v25 = "-[CSAssetController _findLatestInstalledAsset:]";
    __int16 v26 = 2114;
    unint64_t v27 = (unint64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  return v6;
}

- (void)_installedAssetOfType:(unint64_t)a3 query:(id)a4 withLanguage:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v10 returnTypes:2];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000BD04;
  v16[3] = &unk_10001C8A8;
  id v20 = v12;
  unint64_t v21 = a3;
  id v17 = v10;
  id v18 = v11;
  id v19 = self;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [v15 queryMetaData:v16];
}

- (void)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CSAssetController *)self _assetQueryForAssetType:a3];
  [(CSAssetController *)self _installedAssetOfType:a3 query:v10 withLanguage:v9 completion:v8];
}

- (id)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSAssetController *)self _assetQueryForAssetType:a3];
  [v7 returnTypes:2];
  unint64_t v8 = (unint64_t)[v7 queryMetaDataSync];
  id v9 = [v7 results];
  id v10 = +[CSAssetController filteredAssetsForAssets:v9 assetType:a3 language:v6];

  id v11 = CSLogCategoryAsset;
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315906;
      id v18 = "-[CSAssetController _installedAssetOfType:withLanguage:]";
      __int16 v19 = 2050;
      unint64_t v20 = a3;
      __int16 v21 = 2114;
      unint64_t v22 = (unint64_t)v7;
      __int16 v23 = 2050;
      unint64_t v24 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu", (uint8_t *)&v17, 0x2Au);
    }
    id v12 = 0;
  }
  else
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      id v14 = [v10 count];
      id v15 = [v7 queryParams];
      int v17 = 136315906;
      id v18 = "-[CSAssetController _installedAssetOfType:withLanguage:]";
      __int16 v19 = 2050;
      unint64_t v20 = (unint64_t)v14;
      __int16 v21 = 2050;
      unint64_t v22 = a3;
      __int16 v23 = 2114;
      unint64_t v24 = (unint64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu assets for assetType=%{public}lu, matching query: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
    id v12 = [(CSAssetController *)self _findLatestInstalledAsset:v10];
  }

  return v12;
}

- (void)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C334;
  v13[3] = &unk_10001C880;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (id)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4
{
  id v6 = a4;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unint64_t v22 = sub_10000C5B4;
  __int16 v23 = sub_10000C5C4;
  id v24 = 0;
  queue = self->_queue;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10000C5CC;
  id v14 = &unk_10001C858;
  int v17 = &v19;
  unint64_t v18 = a3;
  id v15 = self;
  id v8 = v6;
  id v16 = v8;
  dispatch_sync((dispatch_queue_t)queue, &v11);
  id v9 = objc_msgSend((id)v20[5], "getCSAssetOfType:", a3, v11, v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (!v8)
  {
    id v10 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      id v13 = "-[CSAssetController installedAssetOfType:language:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", (uint8_t *)&v12, 0xCu);
      if (!v9) {
        goto LABEL_6;
      }
    }
    else if (!v9)
    {
      goto LABEL_6;
    }
    id v11 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    v9[2](v9, 0, v11);

    goto LABEL_6;
  }
  [(CSAssetController *)self installedAssetOfType:a3 withLanguage:v8 completion:v9];
LABEL_6:
}

- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(CSAssetController *)self installedAssetOfType:a3 withLanguage:v6];
  }
  else
  {
    id v8 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "-[CSAssetController installedAssetOfType:language:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  if (!v10)
  {
    id v13 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[CSAssetController assetOfType:language:compatibilityVersion:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", buf, 0xCu);
      if (!v11) {
        goto LABEL_6;
      }
    }
    else if (!v11)
    {
      goto LABEL_6;
    }
    id v14 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    v11[2](v11, 0, v14);

    goto LABEL_6;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CA14;
  block[3] = &unk_10001C830;
  block[4] = self;
  unint64_t v18 = a3;
  unint64_t v19 = a5;
  id v16 = v10;
  int v17 = v11;
  dispatch_async((dispatch_queue_t)queue, block);

LABEL_6:
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (!v8)
  {
    id v11 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v17 = "-[CSAssetController assetOfType:language:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", buf, 0xCu);
      if (!v9) {
        goto LABEL_6;
      }
    }
    else if (!v9)
    {
      goto LABEL_6;
    }
    int v12 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    v9[2](v9, 0, v12);

    goto LABEL_6;
  }
  [(CSAssetController *)self installedAssetOfType:a3 withLanguage:v8 completion:v9];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CE04;
  block[3] = &unk_10001C778;
  block[4] = self;
  unint64_t v15 = a3;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)queue, block);

LABEL_6:
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(CSAssetController *)self _assetQueryForAssetType:a3];
    [v7 returnTypes:2];
    unint64_t v8 = (unint64_t)[v7 queryMetaDataSync];
    id v9 = [v7 results];
    id v10 = +[CSAssetController filteredAssetsForAssets:v9 assetType:a3 language:v6];

    id v11 = CSLogCategoryAsset;
    if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v28 = "-[CSAssetController allInstalledAssetsOfType:language:]";
        __int16 v29 = 2050;
        unint64_t v30 = a3;
        __int16 v31 = 2114;
        unint64_t v32 = (unint64_t)v7;
        __int16 v33 = 2050;
        unint64_t v34 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu", buf, 0x2Au);
      }
      id v12 = 0;
    }
    else
    {
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v11;
        id v15 = [v10 count];
        id v16 = [v7 queryParams];
        *(_DWORD *)buf = 136315906;
        __int16 v28 = "-[CSAssetController allInstalledAssetsOfType:language:]";
        __int16 v29 = 2050;
        unint64_t v30 = (unint64_t)v15;
        __int16 v31 = 2050;
        unint64_t v32 = a3;
        __int16 v33 = 2114;
        unint64_t v34 = (unint64_t)v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu installed assets for assetType=%{public}lu, matching query: %{public}@", buf, 0x2Au);
      }
      int v17 = [v10 sortedArrayUsingComparator:&stru_10001C7B8];
      +[NSMutableArray array];
      uint64_t v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      __int16 v23 = sub_10000D144;
      id v24 = &unk_10001C7E0;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v26 = a3;
      id v18 = v25;
      [v17 enumerateObjectsUsingBlock:&v21];
      if (objc_msgSend(v18, "count", v21, v22, v23, v24)) {
        unint64_t v19 = v18;
      }
      else {
        unint64_t v19 = 0;
      }
      id v12 = v19;
    }
  }
  else
  {
    id v13 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v28 = "-[CSAssetController allInstalledAssetsOfType:language:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", buf, 0xCu);
    }
    id v12 = 0;
  }

  return v12;
}

- (id)assetOfType:(unint64_t)a3 language:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(CSAssetController *)self installedAssetOfType:a3 withLanguage:v6];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D384;
    block[3] = &unk_10001C778;
    block[4] = self;
    unint64_t v13 = a3;
    id v12 = v6;
    dispatch_async((dispatch_queue_t)queue, block);
  }
  else
  {
    id v9 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[CSAssetController assetOfType:language:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", buf, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_cleanUpMobileAssetV1Directory
{
  v2 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    unint64_t v8 = "-[CSAssetController _cleanUpMobileAssetV1Directory]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v3 = +[CSAssetController getVoiceTriggerAssetTypeString];
  _MACleanV1Repository();

  long long v4 = +[CSAssetController getEndpointAssetTypeString];
  _MACleanV1Repository();

  id v5 = +[CSAssetController getLanguageDetectorAssetTypeString];
  _MACleanV1Repository();

  id v6 = +[CSAssetController getAdBlockerAssetTypeString];
  _MACleanV1Repository();
}

- (CSAssetController)init
{
  v22.receiver = self;
  v22.super_class = (Class)CSAssetController;
  v2 = [(CSAssetController *)&v22 init];
  if (v2)
  {
    id v3 = +[CSAssetController getVoiceTriggerAssetTypeString];
    long long v4 = +[CSAssetController getEndpointAssetTypeString];
    id v5 = +[CSAssetController getLanguageDetectorAssetTypeString];
    id v6 = +[CSAssetController getAdBlockerAssetTypeString];
    int v7 = +[CSAssetController getSpeakerRecognitionAssetTypeString];
    uint64_t v8 = +[NSMutableDictionary dictionary];
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v8;

    v27[0] = &off_10001E258;
    v27[1] = &off_10001E270;
    v28[0] = v3;
    v28[1] = v4;
    v27[2] = &off_10001E288;
    v27[3] = &off_10001E2A0;
    v28[2] = v5;
    v28[3] = v7;
    v27[4] = &off_10001E2B8;
    v27[5] = &off_10001E2D0;
    v28[4] = v6;
    v28[5] = @"com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay";
    v27[6] = &off_10001E2E8;
    v28[6] = @"com.apple.MobileAsset.VoiceTriggerAssetsMac";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:7];
    csAssetsDictionary = v2->_csAssetsDictionary;
    v2->_csAssetsDictionary = (NSDictionary *)v10;

    id v12 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = v2->_csAssetsDictionary;
      *(_DWORD *)buf = 136315394;
      id v24 = "-[CSAssetController init]";
      __int16 v25 = 2114;
      unint64_t v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s _csAssetsDictionary = %{public}@", buf, 0x16u);
    }
    dispatch_queue_t v14 = dispatch_queue_create("Serial CSAssetController queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("V1 Assets Clean-up queue", 0);
    assetsMigrationQueue = v2->_assetsMigrationQueue;
    v2->_assetsMigrationQueue = (OS_dispatch_queue *)v16;

    id v18 = v2->_assetsMigrationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D74C;
    block[3] = &unk_10001C750;
    uint64_t v21 = v2;
    dispatch_async(v18, block);
  }
  return v2;
}

+ (id)getAssetTypeStringForType:(unint64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0uLL:
      id v3 = +[CSAssetController getVoiceTriggerAssetTypeString];
      break;
    case 1uLL:
      id v3 = +[CSAssetController getEndpointAssetTypeString];
      break;
    case 2uLL:
      id v3 = +[CSAssetController getLanguageDetectorAssetTypeString];
      break;
    case 3uLL:
      id v3 = +[CSAssetController getSpeakerRecognitionAssetTypeString];
      break;
    case 4uLL:
      id v3 = +[CSAssetController getAdBlockerAssetTypeString];
      break;
    case 5uLL:
      id v3 = @"com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay";
      break;
    case 7uLL:
      id v3 = @"com.apple.MobileAsset.VoiceTriggerAssetsMac";
      break;
    default:
      break;
  }
  return v3;
}

+ (id)sharedController
{
  if (qword_100022D70 != -1) {
    dispatch_once(&qword_100022D70, &stru_10001C728);
  }
  v2 = (void *)qword_100022D68;
  return v2;
}

+ (unint64_t)getSpeakerRecognitionCurrentCompatibilityVersion
{
  return 1;
}

+ (id)getSpeakerRecognitionAssetTypeString
{
  if (CSIsASMacWithAOP()) {
    return @"com.apple.MobileAsset.SpeakerRecognitionASMacAssets";
  }
  else {
    return @"com.apple.MobileAsset.SpeakerRecognitionAssets";
  }
}

+ (unint64_t)getAdBlockerCurrentCompatibilityVersion
{
  return 1;
}

+ (id)getAdBlockerAssetTypeString
{
  return @"com.apple.MobileAsset.AdBlockerAssets";
}

+ (unint64_t)getLanguageDetectorCurrentCompatibilityVersion
{
  return 4;
}

+ (id)getLanguageDetectorAssetTypeString
{
  return @"com.apple.MobileAsset.LanguageDetectorAssets";
}

+ (unint64_t)getEndpointAssetCurrentCompatibilityVersion
{
  if (CSIsWatch()) {
    return 3;
  }
  if (CSIsTV()) {
    return 5;
  }
  if (+[CSUtils shouldUseHorsemanSpeechEndpointAssets])return 2; {
  if (CSIsOSX())
  }
    return 6;
  return 3;
}

+ (id)getEndpointAssetTypeString
{
  if (CSIsWatch()) {
    return @"com.apple.MobileAsset.SpeechEndpointAssetsWatch";
  }
  if (CSIsTV()) {
    return @"com.apple.MobileAsset.SpeechEndpointAssetsTV";
  }
  if (+[CSUtils shouldUseHorsemanSpeechEndpointAssets])return @"com.apple.MobileAsset.SpeechEndpointMarshAssets"; {
  if (CSIsOSX())
  }
    return @"com.apple.MobileAsset.SpeechEndpointMacOSAssets";
  return @"com.apple.MobileAsset.SpeechEndpointAssets";
}

+ (unint64_t)getVoiceTriggerAssetCurrentCompatibilityVersion
{
  return (unint64_t)+[CSMobileAssetVersions getVoiceTriggerCurrentCompatibilityVersion];
}

+ (id)getVoiceTriggerAssetTypeString
{
  return +[CSMobileAssetVersions getVoiceTriggerAssetTypeString];
}

+ (void)addKeyValuePairForQuery:(id *)a3 assetType:(unint64_t)a4
{
  id v5 = *a3;
  unint64_t v6 = 15;
  switch(a4)
  {
    case 0uLL:
      unint64_t v6 = +[CSAssetController getVoiceTriggerAssetCurrentCompatibilityVersion];
      break;
    case 1uLL:
      unint64_t v6 = +[CSAssetController getEndpointAssetCurrentCompatibilityVersion];
      break;
    case 2uLL:
      unint64_t v6 = +[CSAssetController getLanguageDetectorCurrentCompatibilityVersion];
      break;
    case 3uLL:
      unint64_t v6 = +[CSAssetController getSpeakerRecognitionCurrentCompatibilityVersion];
      break;
    case 4uLL:
      unint64_t v6 = +[CSAssetController getAdBlockerCurrentCompatibilityVersion];
      break;
    case 5uLL:
      unint64_t v6 = 14;
      break;
    case 7uLL:
      break;
    default:
      int v7 = CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "+[CSAssetController(Utils) addKeyValuePairForQuery:assetType:]";
        __int16 v12 = 2050;
        unint64_t v13 = a4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ERR: Unknown AssetType: %{public}lu", buf, 0x16u);
      }
      unint64_t v6 = 0;
      break;
  }
  uint64_t v8 = ASAttributeCompatibilityVersion;
  id v9 = +[NSString stringWithFormat:@"%lu", v6];
  [v5 addKeyValuePair:v8 with:v9];
}

+ (id)filteredAssetsForAssets:(id)a3 assetType:(unint64_t)a4 language:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v30 = objc_alloc_init((Class)NSMutableArray);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    uint64_t v13 = kCSAssetLanguageKey;
    uint64_t v28 = kCSAssetFootprintKey;
    uint64_t v27 = kCSAssetPremiumKey;
    id v29 = v8;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        dispatch_queue_t v16 = objc_msgSend(v15, "attributes", v27);
        int v17 = [v16 valueForKey:v13];
        id v18 = v17;
        if (!v8 || [v17 containsObject:v8])
        {
          if (a4 <= 7
            && ((1 << a4) & 0xA1) != 0
            && (+[CSUtils supportPremiumAssets] & 1) == 0)
          {
            id v19 = v11;
            uint64_t v20 = v13;
            unint64_t v21 = a4;
            uint64_t v22 = v12;
            id v23 = v9;
            id v24 = [v16 objectForKey:v28];
            __int16 v25 = v24;
            if (!v24 || ([v24 isEqualToString:v27] & 1) == 0) {
              [v30 addObject:v15];
            }

            id v9 = v23;
            uint64_t v12 = v22;
            a4 = v21;
            uint64_t v13 = v20;
            id v11 = v19;
            id v8 = v29;
          }
          else
          {
            [v30 addObject:v15];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  return v30;
}

+ (id)filteredAssetsForFetchRemoteMetaDataForAssets:(id)a3 assetType:(unint64_t)a4
{
  return +[CSAssetController filteredAssetsForAssets:a3 assetType:a4 language:kCSAssetValueLanguageAny];
}

@end
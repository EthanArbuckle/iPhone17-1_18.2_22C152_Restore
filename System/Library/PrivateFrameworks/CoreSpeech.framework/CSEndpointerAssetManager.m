@interface CSEndpointerAssetManager
+ (id)_getFakeEndpointAsset;
+ (id)_getOEPAssetWithLanguage:(id)a3;
+ (id)_getOEPVersionFromPath:(id)a3;
+ (id)sharedManager;
- (BOOL)_isOSDIncludedInAsset:(id)a3;
- (CSAsset)currentHEPAsset;
- (CSAsset)currentOEPAsset;
- (CSEndpointerAssetManager)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (id)_fetchEndpointMobileAssetWithLanguage:(id)a3;
- (id)_getCurrentHEPAsset;
- (id)_getModelPathFromInstallationStatusString:(id)a3;
- (id)getCurrentEndpointerAsset;
- (id)getCurrentOSDAsset;
- (void)CSAssetManagerDidDownloadNewAsset:(id)a3;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)_notifyAssetsUpdate;
- (void)_notifyAssetsUpdateForObserver:(id)a3;
- (void)_registerForAssetUpdateNotifications;
- (void)_updateAssetWithCurrentLanguageForAssetType:(unint64_t)a3;
- (void)_updateAssetWithLanguage:(id)a3 assetType:(unint64_t)a4;
- (void)_updateEndpointerAssetsIfNeeded;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setCurrentHEPAsset:(id)a3;
- (void)setCurrentOEPAsset:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSEndpointerAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentOEPAsset, 0);
  objc_storeStrong((id *)&self->_currentHEPAsset, 0);
  objc_storeStrong((id *)&self->_tokenForAssetUpdateNotification, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setCurrentOEPAsset:(id)a3
{
}

- (CSAsset)currentOEPAsset
{
  return self->_currentOEPAsset;
}

- (void)setCurrentHEPAsset:(id)a3
{
}

- (CSAsset)currentHEPAsset
{
  return self->_currentHEPAsset;
}

- (BOOL)_isOSDIncludedInAsset:(id)a3
{
  v3 = [a3 resourcePath];
  v4 = [v3 stringByAppendingPathComponent:@"SPG.nnet"];

  v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (id)_getModelPathFromInstallationStatusString:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = [v4 componentsSeparatedByString:@"ModelInfo="];
    if ([v5 count] == (id)2)
    {
      unsigned __int8 v6 = [v5 objectAtIndexedSubscript:1];
      v7 = [v6 componentsSeparatedByString:@":"];

      if ((unint64_t)[v7 count] >= 2)
      {
        v8 = [v7 objectAtIndexedSubscript:0];
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_fetchEndpointMobileAssetWithLanguage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = +[CSFPreferences sharedPreferences];
  unsigned int v6 = [v5 isEndpointAssetOverridingEnabled];

  if (v6)
  {
    v7 = [(id)objc_opt_class() _getFakeEndpointAsset];
  }
  else
  {
    v8 = +[NSDate date];
    v9 = +[CSAssetManager sharedManager];
    v7 = [v9 assetOfType:1 language:v4];

    v10 = +[NSDate date];
    v11 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      [v10 timeIntervalSinceDate:v8];
      int v15 = 136315394;
      v16 = "-[CSEndpointerAssetManager _fetchEndpointMobileAssetWithLanguage:]";
      __int16 v17 = 2050;
      uint64_t v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s elapsed time to get HEP mobile assets: %{public}lf", (uint8_t *)&v15, 0x16u);
    }
  }

  return v7;
}

- (void)_notifyAssetsUpdateForObserver:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(CSEndpointerAssetManager *)self currentOEPAsset];
  if (v6
    && (v7 = (void *)v6,
        [(CSEndpointerAssetManager *)self currentOEPAsset],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [(CSEndpointerAssetManager *)self _isOSDIncludedInAsset:v8],
        v8,
        v7,
        v9))
  {
    v10 = [(CSEndpointerAssetManager *)self currentOEPAsset];
    v11 = [(CSEndpointerAssetManager *)self currentOEPAsset];
  }
  else
  {
    v10 = [(CSEndpointerAssetManager *)self currentHEPAsset];
    v11 = [(CSEndpointerAssetManager *)self currentHEPAsset];
    if (v10)
    {
      v12 = [(CSEndpointerAssetManager *)self currentOEPAsset];

      if (v12)
      {
        uint64_t v13 = [(CSEndpointerAssetManager *)self currentOEPAsset];

        v10 = (void *)v13;
      }
    }
  }
  v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    v16 = "-[CSEndpointerAssetManager _notifyAssetsUpdateForObserver:]";
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s endpointAsset: %{public}@, osdAsset: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  [v5 endpointerAssetManagerDidUpdateAsset:v10];
  [v5 endpointerAssetManagerDidUpdateOSDAsset:v11];
}

- (void)_notifyAssetsUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(CSEndpointerAssetManager *)self currentOEPAsset];
  if (v3
    && (id v4 = (void *)v3,
        [(CSEndpointerAssetManager *)self currentOEPAsset],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [(CSEndpointerAssetManager *)self _isOSDIncludedInAsset:v5],
        v5,
        v4,
        v6))
  {
    v7 = [(CSEndpointerAssetManager *)self currentOEPAsset];
    v8 = [(CSEndpointerAssetManager *)self currentOEPAsset];
  }
  else
  {
    v7 = [(CSEndpointerAssetManager *)self currentHEPAsset];
    v8 = [(CSEndpointerAssetManager *)self currentHEPAsset];
    if (v7)
    {
      unsigned int v9 = [(CSEndpointerAssetManager *)self currentOEPAsset];

      if (v9)
      {
        uint64_t v10 = [(CSEndpointerAssetManager *)self currentOEPAsset];

        v7 = (void *)v10;
      }
    }
  }
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[CSEndpointerAssetManager _notifyAssetsUpdate]";
    __int16 v34 = 2114;
    v35 = v7;
    __int16 v36 = 2114;
    v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s endpointAsset: %{public}@, osdAsset: %{public}@", buf, 0x20u);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = [(CSEndpointerAssetManager *)self observers];
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)v16) endpointerAssetManagerDidUpdateAsset:v7];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  __int16 v17 = [(CSEndpointerAssetManager *)self observers];
  id v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)v21) endpointerAssetManagerDidUpdateOSDAsset:v8];
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void)_updateAssetWithLanguage:(id)a3 assetType:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"Invalid CSEndpointerAssetType";
    if (a4 == 1) {
      v8 = @"HEP";
    }
    if (!a4) {
      v8 = @"OEP";
    }
    unsigned int v9 = v8;
    int v15 = 136315650;
    v16 = "-[CSEndpointerAssetManager _updateAssetWithLanguage:assetType:]";
    __int16 v17 = 2112;
    unint64_t v18 = (unint64_t)v9;
    __int16 v19 = 2112;
    id v20 = v6;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Updating %@ asset with language: %@", (uint8_t *)&v15, 0x20u);
  }
  if (a4 == 1)
  {
    id v13 = [(CSEndpointerAssetManager *)self _fetchEndpointMobileAssetWithLanguage:v6];
    currentHEPAsset = self->_currentHEPAsset;
    self->_currentHEPAsset = v13;
    goto LABEL_11;
  }
  if (!a4)
  {
    v11 = [(id)objc_opt_class() _getOEPAssetWithLanguage:v6];
    currentHEPAsset = self->_currentOEPAsset;
    self->_currentOEPAsset = v11;
LABEL_11:

    [(CSEndpointerAssetManager *)self _notifyAssetsUpdate];
    goto LABEL_14;
  }
  id v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    v16 = "-[CSEndpointerAssetManager _updateAssetWithLanguage:assetType:]";
    __int16 v17 = 2048;
    unint64_t v18 = a4;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Invalid CSEndpointerAssetType: %lu", (uint8_t *)&v15, 0x16u);
  }
LABEL_14:
}

- (void)_updateAssetWithCurrentLanguageForAssetType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  [(CSEndpointerAssetManager *)self _updateAssetWithLanguage:v5 assetType:a3];
}

- (void)_updateEndpointerAssetsIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSEndpointerAssetManager _updateEndpointerAssetsIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Updating endpointer assets if needed...", (uint8_t *)&v4, 0xCu);
  }
  [(CSEndpointerAssetManager *)self _updateAssetWithCurrentLanguageForAssetType:1];
  [(CSEndpointerAssetManager *)self _updateAssetWithCurrentLanguageForAssetType:0];
}

- (id)_getCurrentHEPAsset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  currentHEPAsset = self->_currentHEPAsset;
  if (currentHEPAsset)
  {
LABEL_6:
    v12 = currentHEPAsset;
    goto LABEL_7;
  }
  int v4 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  id v5 = [(CSEndpointerAssetManager *)self _fetchEndpointMobileAssetWithLanguage:v4];
  id v6 = self->_currentHEPAsset;
  self->_currentHEPAsset = v5;

  v7 = self->_currentHEPAsset;
  v8 = CSLogContextFacilityCoreSpeech;
  BOOL v9 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = v8;
      v11 = [(CSAsset *)v7 path];
      int v14 = 136315650;
      int v15 = "-[CSEndpointerAssetManager _getCurrentHEPAsset]";
      __int16 v16 = 2114;
      __int16 v17 = v7;
      __int16 v18 = 2114;
      __int16 v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s HEP Asset: %{public}@, path: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    [(CSEndpointerAssetManager *)self _notifyAssetsUpdate];
    currentHEPAsset = self->_currentHEPAsset;
    goto LABEL_6;
  }
  if (v9)
  {
    int v14 = 136315138;
    int v15 = "-[CSEndpointerAssetManager _getCurrentHEPAsset]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to get HEP asset", (uint8_t *)&v14, 0xCu);
  }
  v12 = 0;
LABEL_7:
  return v12;
}

- (void)_registerForAssetUpdateNotifications
{
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CSEndpointerAssetManager _registerForAssetUpdateNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Registering for asset update notifications...", buf, 0xCu);
  }
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C4FAC;
  v27[3] = &unk_100250AE0;
  objc_copyWeak(&v28, &location);
  int v4 = objc_retainBlock(v27);
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:2];
  tokenForAssetUpdateNotification = self->_tokenForAssetUpdateNotification;
  self->_tokenForAssetUpdateNotification = v5;

  v37[0] = @"com.apple.siri.uaf.com.apple.siri.understanding";
  v37[1] = @"com.apple.MobileAsset.AutoAssetNotification^com.apple.MobileAsset.MAAutoAsset^STARTUP_ACTIVATED";
  +[NSArray arrayWithObjects:v37 count:2];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int out_token = 0;
        id v12 = v11;
        uint32_t v13 = notify_register_dispatch((const char *)[v12 UTF8String], &out_token, (dispatch_queue_t)self->_queue, v4);
        if (v13)
        {
          int v14 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v31 = "-[CSEndpointerAssetManager _registerForAssetUpdateNotifications]";
            __int16 v32 = 2112;
            id v33 = v12;
            __int16 v34 = 1024;
            uint32_t v35 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to register for notification (%@), status: %u", buf, 0x1Cu);
          }
          int v15 = -1;
          int out_token = -1;
        }
        else
        {
          int v15 = out_token;
        }
        __int16 v16 = self->_tokenForAssetUpdateNotification;
        __int16 v17 = +[NSNumber numberWithInteger:v15];
        [(NSMutableDictionary *)v16 setObject:v17 forKey:v12];
      }
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v8);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C5018;
  block[3] = &unk_100250B08;
  id v21 = v4;
  __int16 v19 = v4;
  dispatch_async_and_wait(queue, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)CSAssetManagerDidDownloadNewAsset:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C50A0;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C51F0;
  v8[3] = &unk_100253B08;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_tokenForAssetUpdateNotification enumerateKeysAndObjectsUsingBlock:&stru_100250AB8];
  v3.receiver = self;
  v3.super_class = (Class)CSEndpointerAssetManager;
  [(CSEndpointerAssetManager *)&v3 dealloc];
}

- (id)getCurrentEndpointerAsset
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000C5500;
  uint64_t v10 = sub_1000C5510;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C5518;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getCurrentOSDAsset
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000C5500;
  uint64_t v10 = sub_1000C5510;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C56B8;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C57D0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C58BC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSEndpointerAssetManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)CSEndpointerAssetManager;
  v2 = [(CSEndpointerAssetManager *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSEndpointerAssetManager queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    [(CSEndpointerAssetManager *)v2 _registerForAssetUpdateNotifications];
    id v7 = +[CSLanguageCodeUpdateMonitor sharedInstance];
    [v7 addObserver:v2];

    id v8 = objc_alloc_init(CSAssetDownloadingOption);
    [(CSAssetDownloadingOption *)v8 setAllowEndpointAssetDownloading:1];
    id v9 = +[CSAssetManager sharedManager];
    [v9 setAssetDownloadingOption:v8];

    uint64_t v10 = +[CSAssetManager sharedManager];
    [v10 addObserver:v2 forAssetType:1];

    id v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v15 = "-[CSEndpointerAssetManager init]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }
  return v2;
}

+ (id)_getFakeEndpointAsset
{
  v2 = +[CSFPreferences sharedPreferences];
  dispatch_queue_t v3 = [v2 fakeEndpointAssetPath];

  id v4 = +[CSAsset assetForAssetType:1 resourcePath:v3 configVersion:@"0.0" assetProvider:1];
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[CSEndpointerAssetManager _getFakeEndpointAsset]";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Fake endpoint asset: %@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

+ (id)_getOEPVersionFromPath:(id)a3
{
  dispatch_queue_t v3 = [a3 stringByAppendingPathComponent:@"cs_hep.json"];
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = +[NSData dataWithContentsOfFile:v3];
    if (!v6)
    {
      id v12 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
        __int16 v18 = 2114;
        __int16 v19 = v3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }
      id v11 = @"0.0";
      goto LABEL_17;
    }
    id v15 = 0;
    int v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v15];
    id v8 = v15;
    if (v8)
    {
      __int16 v9 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
        __int16 v18 = 2114;
        __int16 v19 = v3;
        __int16 v20 = 2114;
        id v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Could not decode contents of: %{public}@: err: %{public}@", buf, 0x20u);
      }
    }
    else if (v7)
    {
      objc_super v13 = [v7 objectForKeyedSubscript:@"version"];

      if (v13)
      {
        id v11 = [v7 objectForKeyedSubscript:@"version"];
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
    }
    id v11 = @"0.0";
    goto LABEL_16;
  }
  uint64_t v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
    __int16 v18 = 2114;
    __int16 v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s File does not exist: %{public}@", buf, 0x16u);
  }
  id v11 = @"0.0";
LABEL_18:

  return v11;
}

+ (id)_getOEPAssetWithLanguage:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[CSFPreferences sharedPreferences];
  unsigned int v6 = [v5 isEndpointAssetBypassTrialEnabled];

  if (v6)
  {
    int v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      long long v26 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Bypass Trial Asset", (uint8_t *)&v25, 0xCu);
    }
    id v8 = 0;
  }
  else
  {
    __int16 v9 = +[CSFPreferences sharedPreferences];
    unsigned int v10 = [v9 isEndpointAssetOverridingEnabled];

    if (v10)
    {
      id v8 = [a1 _getFakeEndpointAsset];
    }
    else
    {
      id v11 = [objc_alloc((Class)SFEntitledAssetConfig) initWithAssetType:3 language:v4 regionId:0];
      id v12 = +[SFEntitledAssetManager sharedInstance];
      objc_super v13 = [v12 installedAssetWithConfig:v11];

      if (v13)
      {
        int v14 = [v13 stringByAppendingPathComponent:@"OEP"];
        id v15 = +[NSFileManager defaultManager];
        unsigned __int8 v16 = [v15 fileExistsAtPath:v14];

        __int16 v17 = CSLogContextFacilityCoreSpeech;
        if (v16)
        {
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v18 = v17;
            __int16 v19 = [v11 language];
            int v25 = 136315650;
            long long v26 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
            __int16 v27 = 2112;
            id v28 = v19;
            __int16 v29 = 2114;
            v30 = v14;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Found OEP asset for %@ at path: %{public}@", (uint8_t *)&v25, 0x20u);
          }
          __int16 v20 = [a1 _getOEPVersionFromPath:v14];
          id v8 = +[CSAsset assetForAssetType:1 resourcePath:v14 configVersion:v20 assetProvider:1];
        }
        else
        {
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            int v25 = 136315394;
            long long v26 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
            __int16 v27 = 2114;
            id v28 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s File does not exist: %{public}@", (uint8_t *)&v25, 0x16u);
          }
          id v8 = 0;
        }
      }
      else
      {
        id v21 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          long long v23 = v21;
          long long v24 = [v11 language];
          int v25 = 136315394;
          long long v26 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
          __int16 v27 = 2112;
          id v28 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s No OEP asset for %@ was found.", (uint8_t *)&v25, 0x16u);
        }
        id v8 = 0;
      }
    }
  }

  return v8;
}

+ (id)sharedManager
{
  if (qword_1002A3900 != -1) {
    dispatch_once(&qword_1002A3900, &stru_100250A78);
  }
  v2 = (void *)qword_1002A38F8;
  return v2;
}

@end
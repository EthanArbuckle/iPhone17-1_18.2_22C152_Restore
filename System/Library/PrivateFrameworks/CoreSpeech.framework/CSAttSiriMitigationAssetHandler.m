@interface CSAttSiriMitigationAssetHandler
+ (id)sharedHandler;
+ (id)sharedHandlerDisabledOnDeviceCompilation;
- (BOOL)overrideEnabled;
- (CSAsset)cachedAsset;
- (CSAssetManager)assetManager;
- (CSAttSiriMitigationAssetHandler)init;
- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8;
- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8 disableOnDeviceCompilation:(BOOL)a9;
- (CSAttSiriMitigationAssetHandler)initWithDisableOnDeviceCompilation;
- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor;
- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler;
- (CSUAFAssetManager)uafAssetManager;
- (CSUAFDownloadMonitor)uafDownloadMonitor;
- (NSHashTable)observers;
- (NSString)overridePath;
- (OS_dispatch_queue)queue;
- (id)getNeuralCombinerConfigFile;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)_getPreinstalledMitigationAssetForCurrentLocale:(id)a3;
- (void)_receivedNewAssetUpdate:(id)a3;
- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4;
- (void)getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)notifyObservers:(id)a3 endpointId:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setCachedAsset:(id)a3;
- (void)setCachedAssetWithOverride:(id)a3;
- (void)setLanguageCodeUpdateMonitor:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOnDeviceCompilationHandler:(id)a3;
- (void)setOverrideEnabled:(BOOL)a3;
- (void)setOverridePath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUafAssetManager:(id)a3;
- (void)setUafDownloadMonitor:(id)a3;
- (void)start;
- (void)triggerAssetRefresh;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSAttSiriMitigationAssetHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDeviceCompilationHandler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overridePath, 0);
  objc_storeStrong((id *)&self->_languageCodeUpdateMonitor, 0);
  objc_storeStrong((id *)&self->_uafDownloadMonitor, 0);
  objc_storeStrong((id *)&self->_uafAssetManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_cachedAsset, 0);
}

- (void)setOnDeviceCompilationHandler:(id)a3
{
}

- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler
{
  return self->_onDeviceCompilationHandler;
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

- (void)setOverridePath:(id)a3
{
}

- (NSString)overridePath
{
  return self->_overridePath;
}

- (void)setOverrideEnabled:(BOOL)a3
{
  self->_overrideEnabled = a3;
}

- (BOOL)overrideEnabled
{
  return self->_overrideEnabled;
}

- (void)setLanguageCodeUpdateMonitor:(id)a3
{
}

- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor
{
  return self->_languageCodeUpdateMonitor;
}

- (void)setUafDownloadMonitor:(id)a3
{
}

- (CSUAFDownloadMonitor)uafDownloadMonitor
{
  return self->_uafDownloadMonitor;
}

- (void)setUafAssetManager:(id)a3
{
}

- (CSUAFAssetManager)uafAssetManager
{
  return self->_uafAssetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (CSAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setCachedAsset:(id)a3
{
}

- (CSAsset)cachedAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 16, 1);
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && self->_onDeviceCompilationHandler)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004EB78;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_getPreinstalledMitigationAssetForCurrentLocale:(id)a3
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004F084;
  v23[3] = &unk_100252C58;
  id v3 = a3;
  id v24 = v3;
  BOOL v4 = objc_retainBlock(v23);
  v5 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  id v6 = +[CSAsset fallBackAssetResourcePath];
  v7 = [v6 stringByAppendingPathComponent:@"/PreinstalledAssets/preinstalledMeta.json"];

  v8 = +[NSFileManager defaultManager];
  unsigned __int8 v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    id v10 = +[CSAsset decodeJson:v7];
    v11 = [v10 objectForKeyedSubscript:v5];
    if (v11)
    {
      CSSystemRootDirectory();
      v12 = v22 = v5;
      v25[0] = v12;
      v13 = [v11 objectForKeyedSubscript:@"resourcePath"];
      v25[1] = v13;
      v25[2] = @"mitigation";
      v14 = +[NSArray arrayWithObjects:v25 count:3];
      id v15 = +[NSString pathWithComponents:v14];

      v16 = [v11 objectForKeyedSubscript:@"configVersion"];
      v17 = +[CSAsset assetForAssetType:6 resourcePath:v15 configVersion:v16 assetProvider:0];
      ((void (*)(void *, void *, void))v4[2])(v4, v17, 0);

      v5 = v22;
    }
    else
    {
      v20 = CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "-[CSAttSiriMitigationAssetHandler _getPreinstalledMitigationAssetForCurrentLocale:]";
        __int16 v28 = 2112;
        v29 = v5;
        __int16 v30 = 2112;
        id v31 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Could not find AssetMeta for current locale: %@, preinstalledAssetMeta: %@. No mitigation functionality", buf, 0x20u);
      }
      id v21 = objc_alloc((Class)NSError);
      id v15 = [v21 initWithDomain:CSErrorDomain code:1601 userInfo:0];
      ((void (*)(void *, void, id))v4[2])(v4, 0, v15);
    }
  }
  else
  {
    v18 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSAttSiriMitigationAssetHandler _getPreinstalledMitigationAssetForCurrentLocale:]";
      __int16 v28 = 2114;
      v29 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Preinstalled model meta not found: %{public}@. No mitigation functionality.", buf, 0x16u);
    }
    id v19 = objc_alloc((Class)NSError);
    id v10 = [v19 initWithDomain:CSErrorDomain code:1601 userInfo:0];
    ((void (*)(void *, void, id))v4[2])(v4, 0, v10);
  }
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  -[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:](self, "setCachedAssetWithOverride:", 0, a4);
  uafAssetManager = self->_uafAssetManager;
  id v6 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F154;
  v7[3] = &unk_100252DF0;
  v7[4] = self;
  [(CSUAFAssetManager *)uafAssetManager getInstalledAssetofType:6 forLocale:v6 completion:v7];
}

- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004F36C;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    v8 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CSAttSiriMitigationAssetHandler assetDownloadMonitorDelegate:assetType:]";
      __int16 v12 = 2048;
      unint64_t v13 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Ignore Trial asset update for type: %lu", buf, 0x16u);
    }
  }
}

- (id)getNeuralCombinerConfigFile
{
  return 0;
}

- (void)_receivedNewAssetUpdate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 assetProvider] != (id)2)
  {
    id v10 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      __int16 v12 = "-[CSAttSiriMitigationAssetHandler _receivedNewAssetUpdate:]";
      v7 = "%s Ignore MA asset update";
      v8 = v10;
      uint32_t v9 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    [(CSAttSiriMitigationAssetHandler *)self setCachedAssetWithOverride:v5];
    [(CSAttSiriMitigationAssetHandler *)self notifyObservers:v5 endpointId:0];
    id v6 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      __int16 v12 = "-[CSAttSiriMitigationAssetHandler _receivedNewAssetUpdate:]";
      __int16 v13 = 2112;
      v14 = v5;
      v7 = "%s Updated cache with new UAF asset %@";
      v8 = v6;
      uint32_t v9 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }
}

- (void)triggerAssetRefresh
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F6D4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004FB68;
  v16[3] = &unk_100252C58;
  id v6 = v5;
  id v17 = v6;
  v7 = objc_retainBlock(v16);
  v8 = (void (**)(void, void, void))v7;
  cachedAsset = self->_cachedAsset;
  if (cachedAsset)
  {
    ((void (*)(void *, CSAsset *, void))v7[2])(v7, cachedAsset, 0);
  }
  else
  {
    uafAssetManager = self->_uafAssetManager;
    if (uafAssetManager)
    {
      int v11 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10004FB80;
      v14[3] = &unk_1002529B8;
      v14[4] = self;
      id v15 = v8;
      [(CSUAFAssetManager *)uafAssetManager getInstalledAssetofType:6 forLocale:v11 completion:v14];
    }
    else
    {
      id v12 = objc_alloc((Class)NSError);
      id v13 = [v12 initWithDomain:CSErrorDomain code:1601 userInfo:0];
      ((void (**)(void, void, id))v8)[2](v8, 0, v13);
    }
  }
}

- (void)getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FD00;
  block[3] = &unk_100253280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setCachedAssetWithOverride:(id)a3
{
  id v4 = a3;
  if (self->_overrideEnabled)
  {
    id v5 = +[NSFileManager defaultManager];
    unsigned int v6 = [v5 fileExistsAtPath:self->_overridePath];

    if (v6)
    {
      id v7 = [(NSString *)self->_overridePath stringByDeletingLastPathComponent];
      uint64_t v8 = +[CSAsset assetForAssetType:6 resourcePath:v7 configVersion:@"override-asset" assetProvider:2];
      id v9 = (void *)qword_1002A3720;
      qword_1002A3720 = v8;

      id v10 = CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:]";
        __int16 v21 = 2112;
        uint64_t v22 = qword_1002A3720;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Using override asset: %@", buf, 0x16u);
      }
    }
  }
  int v11 = (void *)qword_1002A3720;
  if (!qword_1002A3720) {
    int v11 = v4;
  }
  id v12 = v11;
  cachedAsset = self->_cachedAsset;
  self->_cachedAsset = v12;

  onDeviceCompilationHandler = self->_onDeviceCompilationHandler;
  if (onDeviceCompilationHandler)
  {
    id v15 = self->_cachedAsset;
    id v18 = 0;
    [(CSOnDeviceCompilationHandler *)onDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:v15 assetType:6 endpointId:0 errOut:&v18];
    id v16 = v18;
    id v17 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:]";
      __int16 v21 = 2112;
      uint64_t v22 = (uint64_t)v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Compile override Mitigation asset to onDevice CacheIr with error: %@", buf, 0x16u);
    }
  }
}

- (void)notifyObservers:(id)a3 endpointId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FFD8;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050198;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005023C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)start
{
  [(CSUAFDownloadMonitor *)self->_uafDownloadMonitor addObserver:self];
  [(CSLanguageCodeUpdateMonitor *)self->_languageCodeUpdateMonitor addObserver:self];
  id v3 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [v3 addObserver:self];
}

- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8
{
  LOBYTE(v9) = 0;
  return [(CSAttSiriMitigationAssetHandler *)self initWithAssetManager:a3 withUAFAssetManager:a4 withUAFDownloadMonitor:a5 withLanguageCodeUpdateMonitor:a6 withAssetOverrideFlag:a7 withOverrideAssetPath:a8 disableOnDeviceCompilation:v9];
}

- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8 disableOnDeviceCompilation:(BOOL)a9
{
  BOOL v10 = a7;
  id v40 = a3;
  id v39 = a4;
  id v38 = a5;
  id v16 = a6;
  id v17 = a8;
  v41.receiver = self;
  v41.super_class = (Class)CSAttSiriMitigationAssetHandler;
  id v18 = [(CSAttSiriMitigationAssetHandler *)&v41 init];
  if (v18)
  {
    dispatch_queue_t v19 = dispatch_queue_create("CSAttSiriMitigationAssetHandler", 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v19;

    p_assetManager = (void **)&v18->_assetManager;
    objc_storeStrong((id *)&v18->_assetManager, a3);
    if (!v18->_assetManager)
    {
      uint64_t v22 = +[CSAssetManager sharedManager];
      v23 = *p_assetManager;
      *p_assetManager = (void *)v22;
    }
    p_uafDownloadMonitor = (void **)&v18->_uafDownloadMonitor;
    objc_storeStrong((id *)&v18->_uafDownloadMonitor, a5);
    if (!v18->_uafDownloadMonitor)
    {
      uint64_t v25 = +[CSUAFDownloadMonitor sharedInstance];
      v26 = *p_uafDownloadMonitor;
      *p_uafDownloadMonitor = (void *)v25;
    }
    p_uafAssetManager = (void **)&v18->_uafAssetManager;
    objc_storeStrong((id *)&v18->_uafAssetManager, a4);
    if (!v18->_uafAssetManager)
    {
      uint64_t v28 = +[CSUAFAssetManager sharedInstance];
      v29 = *p_uafAssetManager;
      *p_uafAssetManager = (void *)v28;
    }
    v18->_overrideEnabled = v10;
    if (v10) {
      objc_storeStrong((id *)&v18->_overridePath, a8);
    }
    p_languageCodeUpdateMonitor = (void **)&v18->_languageCodeUpdateMonitor;
    objc_storeStrong((id *)&v18->_languageCodeUpdateMonitor, a6);
    if (v18->_languageCodeUpdateMonitor)
    {
      if (a9) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v31 = +[CSLanguageCodeUpdateMonitor sharedInstance];
      v32 = *p_languageCodeUpdateMonitor;
      *p_languageCodeUpdateMonitor = (void *)v31;

      if (a9)
      {
LABEL_16:
        [(CSAttSiriMitigationAssetHandler *)v18 setCachedAssetWithOverride:0];
        [(CSAttSiriMitigationAssetHandler *)v18 start];
        uint64_t v35 = +[NSHashTable weakObjectsHashTable];
        observers = v18->_observers;
        v18->_observers = (NSHashTable *)v35;

        goto LABEL_17;
      }
    }
    if (!v18->_onDeviceCompilationHandler)
    {
      uint64_t v33 = +[CSOnDeviceCompilationHandler sharedHandler];
      onDeviceCompilationHandler = v18->_onDeviceCompilationHandler;
      v18->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v33;
    }
    goto LABEL_16;
  }
LABEL_17:

  return v18;
}

- (CSAttSiriMitigationAssetHandler)initWithDisableOnDeviceCompilation
{
  id v3 = +[CSFPreferences sharedPreferences];
  id v4 = [v3 isMitigationAssetOverridingEnabled];
  id v5 = +[CSFPreferences sharedPreferences];
  id v6 = [v5 fakeMitigationAssetPath];
  LOBYTE(v9) = 1;
  id v7 = [(CSAttSiriMitigationAssetHandler *)self initWithAssetManager:0 withUAFAssetManager:0 withUAFDownloadMonitor:0 withLanguageCodeUpdateMonitor:0 withAssetOverrideFlag:v4 withOverrideAssetPath:v6 disableOnDeviceCompilation:v9];

  return v7;
}

- (CSAttSiriMitigationAssetHandler)init
{
  id v3 = +[CSFPreferences sharedPreferences];
  id v4 = [v3 isMitigationAssetOverridingEnabled];
  id v5 = +[CSFPreferences sharedPreferences];
  id v6 = [v5 fakeMitigationAssetPath];
  id v7 = [(CSAttSiriMitigationAssetHandler *)self initWithAssetManager:0 withUAFAssetManager:0 withUAFDownloadMonitor:0 withLanguageCodeUpdateMonitor:0 withAssetOverrideFlag:v4 withOverrideAssetPath:v6];

  return v7;
}

+ (id)sharedHandlerDisabledOnDeviceCompilation
{
  if (qword_1002A3718 != -1) {
    dispatch_once(&qword_1002A3718, &stru_10024F3D0);
  }
  v2 = (void *)qword_1002A3710;
  return v2;
}

+ (id)sharedHandler
{
  if (qword_1002A3708 != -1) {
    dispatch_once(&qword_1002A3708, &stru_10024F3B0);
  }
  v2 = (void *)qword_1002A3700;
  return v2;
}

@end
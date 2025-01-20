@interface CSVoiceTriggerAssetHandlerMac
- (CSAsset)cachedAsset;
- (CSAsset)cachedAssistantAsset;
- (CSAssetManager)assetManager;
- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor;
- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler;
- (CSUAFAssetManager)uafAssetManager;
- (CSUAFDownloadMonitor)uafAssetDownloadMonitor;
- (CSVoiceTriggerAssetDownloadMonitor)voiceTriggerAssetDownloadMonitor;
- (CSVoiceTriggerAssetHandlerMac)init;
- (CSVoiceTriggerAssetHandlerMac)initWithDisableOnDeviceCompilation:(BOOL)a3;
- (CSVoiceTriggerAssetHandlerMac)initWithVoiceTriggerAssetDownloadMonitor:(id)a3 languageCodeUpdateMonitor:(id)a4 uafAssetDownloadMonitor:(id)a5 assetManager:(id)a6 uafAssetManager:(id)a7 disableOnDeviceCompilation:(BOOL)a8;
- (NSMutableDictionary)cachedEndpointAssets;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSVoiceTriggerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_checkNewAssetAvailability;
- (void)_checkNewAssetAvailabilityForEndpoint;
- (void)_getVoiceTriggerAssetFromAssetManager:(id)a3;
- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 completion:(id)a4;
- (void)_handleEndpointVoiceTriggerAsset:(id)a3 completion:(id)a4;
- (void)_handleVoiceTriggerAssetWithCompletion:(id)a3;
- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4;
- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)mapAssetToExclaveKit:(id)a3 completion:(id)a4;
- (void)setAssetManager:(id)a3;
- (void)setCachedAsset:(id)a3;
- (void)setCachedAssistantAsset:(id)a3;
- (void)setCachedEndpointAssets:(id)a3;
- (void)setLanguageCodeUpdateMonitor:(id)a3;
- (void)setOnDeviceCompilationHandler:(id)a3;
- (void)setUafAssetDownloadMonitor:(id)a3;
- (void)setUafAssetManager:(id)a3;
- (void)setVoiceTriggerAssetDownloadMonitor:(id)a3;
- (void)start;
- (void)triggerAssetRefresh;
@end

@implementation CSVoiceTriggerAssetHandlerMac

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDeviceCompilationHandler, 0);
  objc_storeStrong((id *)&self->_uafAssetManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_uafAssetDownloadMonitor, 0);
  objc_storeStrong((id *)&self->_languageCodeUpdateMonitor, 0);
  objc_storeStrong((id *)&self->_voiceTriggerAssetDownloadMonitor, 0);
  objc_storeStrong((id *)&self->_cachedEndpointAssets, 0);
  objc_storeStrong((id *)&self->_cachedAssistantAsset, 0);
  objc_storeStrong((id *)&self->_cachedAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setOnDeviceCompilationHandler:(id)a3
{
}

- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler
{
  return self->_onDeviceCompilationHandler;
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

- (void)setUafAssetDownloadMonitor:(id)a3
{
}

- (CSUAFDownloadMonitor)uafAssetDownloadMonitor
{
  return self->_uafAssetDownloadMonitor;
}

- (void)setLanguageCodeUpdateMonitor:(id)a3
{
}

- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor
{
  return self->_languageCodeUpdateMonitor;
}

- (void)setVoiceTriggerAssetDownloadMonitor:(id)a3
{
}

- (CSVoiceTriggerAssetDownloadMonitor)voiceTriggerAssetDownloadMonitor
{
  return self->_voiceTriggerAssetDownloadMonitor;
}

- (void)setCachedEndpointAssets:(id)a3
{
}

- (NSMutableDictionary)cachedEndpointAssets
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedAssistantAsset:(id)a3
{
}

- (CSAsset)cachedAssistantAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedAsset:(id)a3
{
}

- (CSAsset)cachedAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 32, 1);
}

- (void)mapAssetToExclaveKit:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035C9C;
  block[3] = &unk_100253280;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
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
    block[2] = sub_100035ED8;
    block[3] = &unk_100253AE0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      id v9 = "-[CSVoiceTriggerAssetHandlerMac assetDownloadMonitorDelegate:assetType:]";
      __int16 v10 = 2048;
      unint64_t v11 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Ignore UAF asset update for type: %lu", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [(CSVoiceTriggerAssetHandlerMac *)self _checkNewAssetAvailability];
    [(CSVoiceTriggerAssetHandlerMac *)self _checkNewAssetAvailabilityForEndpoint];
  }
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  id v6 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CSVoiceTriggerAssetHandlerMac CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Language Code Changed : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(CSVoiceTriggerAssetHandlerMac *)self _checkNewAssetAvailability];
  [(CSVoiceTriggerAssetHandlerMac *)self _checkNewAssetAvailabilityForEndpoint];
}

- (void)CSVoiceTriggerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4
{
  id v5 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[CSVoiceTriggerAssetHandlerMac CSVoiceTriggerAssetDownloadMonitor:didInstallNewAsset:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s new VoiceTrigger asset downloaded", (uint8_t *)&v6, 0xCu);
  }
  [(CSVoiceTriggerAssetHandlerMac *)self _checkNewAssetAvailability];
  [(CSVoiceTriggerAssetHandlerMac *)self _checkNewAssetAvailabilityForEndpoint];
}

- (void)triggerAssetRefresh
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003657C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_checkNewAssetAvailabilityForEndpoint
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003699C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_checkNewAssetAvailability
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100037020;
  v2[3] = &unk_100252DF0;
  v2[4] = self;
  [(CSVoiceTriggerAssetHandlerMac *)self _getVoiceTriggerAssetFromAssetManager:v2];
}

- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000375A4;
  v22[3] = &unk_1002529B8;
  id v10 = v8;
  id v23 = v10;
  id v11 = v9;
  id v24 = v11;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000376A8;
  v20[3] = &unk_10024EDF0;
  v20[4] = self;
  id v12 = objc_retainBlock(v22);
  id v21 = v12;
  v13 = objc_retainBlock(v20);
  if (a4)
  {
    ((void (*)(void *, void, void))v12[2])(v12, 0, 0);
  }
  else
  {
    id v14 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    if ([v10 isEqualToString:v14] && (uafAssetManager = self->_uafAssetManager) != 0)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10003774C;
      v16[3] = &unk_10024EE18;
      v18 = v12;
      v19 = v13;
      id v17 = v10;
      [(CSUAFAssetManager *)uafAssetManager getInstalledAssetofType:0 forLocale:v14 completion:v16];
    }
    else
    {
      ((void (*)(void *, id))v13[2])(v13, v10);
    }
  }
}

- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 completion:(id)a4
{
}

- (void)_getVoiceTriggerAssetFromAssetManager:(id)a3
{
  id v4 = a3;
  id v5 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  [(CSVoiceTriggerAssetHandlerMac *)self _getVoiceTriggerAssetFromAssetManagerWithLocale:v5 completion:v4];
}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100037AE4;
    block[3] = &unk_100253280;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    [(CSVoiceTriggerAssetHandlerMac *)self _handleVoiceTriggerAssetWithCompletion:v7];
  }
}

- (void)_handleEndpointVoiceTriggerAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (!v6)
  {
    id v9 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    v7[2](v7, 0, v9);
    goto LABEL_6;
  }
  id v8 = [(NSMutableDictionary *)self->_cachedEndpointAssets objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v10 = +[CSUtils getSiriLanguageWithEndpointId:v6 fallbackLanguage:@"en-US"];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100037C84;
    v11[3] = &unk_10024EDC8;
    v11[4] = self;
    id v12 = v6;
    v13 = v7;
    [(CSVoiceTriggerAssetHandlerMac *)self _getVoiceTriggerAssetFromAssetManagerWithLocale:v10 completion:v11];

    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = [(NSMutableDictionary *)self->_cachedEndpointAssets objectForKeyedSubscript:v6];
    ((void (**)(id, void *, void *))v7)[2](v7, v9, 0);
LABEL_6:
  }
LABEL_8:
}

- (void)_handleVoiceTriggerAssetWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(CSVoiceTriggerAssetHandlerMac *)self cachedAsset];

  if (v5)
  {
    if (v4)
    {
      id v6 = [(CSVoiceTriggerAssetHandlerMac *)self cachedAsset];
      v4[2](v4, v6, 0);
    }
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100038004;
    v7[3] = &unk_1002529B8;
    v7[4] = self;
    id v8 = v4;
    [(CSVoiceTriggerAssetHandlerMac *)self _getVoiceTriggerAssetFromAssetManager:v7];
  }
}

- (void)start
{
  [(CSVoiceTriggerAssetDownloadMonitor *)self->_voiceTriggerAssetDownloadMonitor addObserver:self];
  [(CSLanguageCodeUpdateMonitor *)self->_languageCodeUpdateMonitor addObserver:self];
  [(CSUAFDownloadMonitor *)self->_uafAssetDownloadMonitor addObserver:self];
  id v3 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [v3 addObserver:self];
}

- (CSVoiceTriggerAssetHandlerMac)initWithVoiceTriggerAssetDownloadMonitor:(id)a3 languageCodeUpdateMonitor:(id)a4 uafAssetDownloadMonitor:(id)a5 assetManager:(id)a6 uafAssetManager:(id)a7 disableOnDeviceCompilation:(BOOL)a8
{
  id v42 = a3;
  id v41 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v43.receiver = self;
  v43.super_class = (Class)CSVoiceTriggerAssetHandlerMac;
  id v17 = [(CSVoiceTriggerAssetHandler *)&v43 init];
  if (v17)
  {
    dispatch_queue_t v18 = dispatch_queue_create("CSVoiceTriggerHandlerMacQueue", 0);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    uint64_t v20 = +[NSMutableDictionary dictionary];
    cachedEndpointAssets = v17->_cachedEndpointAssets;
    v17->_cachedEndpointAssets = (NSMutableDictionary *)v20;

    p_voiceTriggerAssetDownloadMonitor = (void **)&v17->_voiceTriggerAssetDownloadMonitor;
    objc_storeStrong((id *)&v17->_voiceTriggerAssetDownloadMonitor, a3);
    if (!v17->_voiceTriggerAssetDownloadMonitor)
    {
      uint64_t v23 = +[CSVoiceTriggerAssetDownloadMonitor sharedInstance];
      id v24 = *p_voiceTriggerAssetDownloadMonitor;
      *p_voiceTriggerAssetDownloadMonitor = (void *)v23;
    }
    p_languageCodeUpdateMonitor = (void **)&v17->_languageCodeUpdateMonitor;
    objc_storeStrong((id *)&v17->_languageCodeUpdateMonitor, a4);
    if (!v17->_languageCodeUpdateMonitor)
    {
      uint64_t v26 = +[CSLanguageCodeUpdateMonitor sharedInstance];
      v27 = *p_languageCodeUpdateMonitor;
      *p_languageCodeUpdateMonitor = (void *)v26;
    }
    p_uafAssetDownloadMonitor = (void **)&v17->_uafAssetDownloadMonitor;
    objc_storeStrong((id *)&v17->_uafAssetDownloadMonitor, a5);
    if (!v17->_uafAssetDownloadMonitor)
    {
      uint64_t v29 = +[CSUAFDownloadMonitor sharedInstance];
      v30 = *p_uafAssetDownloadMonitor;
      *p_uafAssetDownloadMonitor = (void *)v29;
    }
    p_assetManager = (void **)&v17->_assetManager;
    objc_storeStrong((id *)&v17->_assetManager, a6);
    if (!v17->_assetManager)
    {
      uint64_t v32 = +[CSAssetManager sharedManager];
      v33 = *p_assetManager;
      *p_assetManager = (void *)v32;
    }
    p_uafAssetManager = (void **)&v17->_uafAssetManager;
    objc_storeStrong((id *)&v17->_uafAssetManager, a7);
    if (!v17->_uafAssetManager)
    {
      uint64_t v35 = +[CSUAFAssetManager sharedInstance];
      v36 = *p_uafAssetManager;
      *p_uafAssetManager = (void *)v35;
    }
    [(CSVoiceTriggerAssetHandlerMac *)v17 start];
    [(CSVoiceTriggerAssetHandlerMac *)v17 setCachedAsset:0];
    [(CSVoiceTriggerAssetHandlerMac *)v17 setCachedAssistantAsset:0];
    if (!a8 && !v17->_onDeviceCompilationHandler)
    {
      uint64_t v37 = +[CSOnDeviceCompilationHandler sharedHandler];
      onDeviceCompilationHandler = v17->_onDeviceCompilationHandler;
      v17->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v37;
    }
  }

  return v17;
}

- (CSVoiceTriggerAssetHandlerMac)initWithDisableOnDeviceCompilation:(BOOL)a3
{
  return [(CSVoiceTriggerAssetHandlerMac *)self initWithVoiceTriggerAssetDownloadMonitor:0 languageCodeUpdateMonitor:0 uafAssetDownloadMonitor:0 assetManager:0 uafAssetManager:0 disableOnDeviceCompilation:a3];
}

- (CSVoiceTriggerAssetHandlerMac)init
{
  return [(CSVoiceTriggerAssetHandlerMac *)self initWithVoiceTriggerAssetDownloadMonitor:0 languageCodeUpdateMonitor:0 uafAssetDownloadMonitor:0 assetManager:0 uafAssetManager:0 disableOnDeviceCompilation:0];
}

@end
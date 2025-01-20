@interface CSVoiceTriggerAssetHandlerDarwin
- (CSAsset)cachedAsset;
- (CSVoiceTriggerAssetHandlerDarwin)init;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSRemoteAssetManagerDidDownloadNewAsset:(id)a3;
- (void)_checkNewAssetAvailability;
- (void)_getVoiceTriggerAssetFromAssetManager:(id)a3;
- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)setCachedAsset:(id)a3;
- (void)start;
@end

@implementation CSVoiceTriggerAssetHandlerDarwin

- (void).cxx_destruct
{
}

- (void)setCachedAsset:(id)a3
{
}

- (CSAsset)cachedAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 24, 1);
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  v6 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[CSVoiceTriggerAssetHandlerDarwin CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Language Code Changed : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(CSVoiceTriggerAssetHandlerDarwin *)self _checkNewAssetAvailability];
  v7 = +[CSVoiceTriggerAssetMetaUpdateMonitor sharedInstance];
  [v7 notifyNewVoiceTriggerAssetMetaDataUpdated];
}

- (void)CSRemoteAssetManagerDidDownloadNewAsset:(id)a3
{
  v4 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[CSVoiceTriggerAssetHandlerDarwin CSRemoteAssetManagerDidDownloadNewAsset:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s new VoiceTrigger asset downloaded", buf, 0xCu);
  }
  id v5 = [(CSVoiceTriggerAssetHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100148B8C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)_checkNewAssetAvailability
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100148C00;
  v2[3] = &unk_100252DF0;
  v2[4] = self;
  [(CSVoiceTriggerAssetHandlerDarwin *)self _getVoiceTriggerAssetFromAssetManager:v2];
}

- (void)_getVoiceTriggerAssetFromAssetManager:(id)a3
{
  v3 = (void (**)(id, void, id))a3;
  v4 = +[CSRemoteAssetManager sharedManager];
  id v5 = [v4 assetForCurrentLanguageOfType:0];

  v6 = +[CSOnDeviceCompilationHandler sharedHandler];
  id v10 = 0;
  [v6 compileAndUpdateDeviceCachesWithAsset:v5 assetType:5 endpointId:0 errOut:&v10];
  id v7 = v10;

  int v8 = CSLogCategoryAsset;
  BOOL v9 = os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[CSVoiceTriggerAssetHandlerDarwin _getVoiceTriggerAssetFromAssetManager:]";
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Fetching CSVoiceTriggerAsset failed with error error %{public}@", buf, 0x16u);
    }
    if (v3) {
      v3[2](v3, 0, v7);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[CSVoiceTriggerAssetHandlerDarwin _getVoiceTriggerAssetFromAssetManager:]";
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset found: %{public}@", buf, 0x16u);
    }
    if (v3) {
      ((void (**)(id, void *, id))v3)[2](v3, v5, 0);
    }
  }
}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  v6 = [(CSVoiceTriggerAssetHandlerDarwin *)self cachedAsset];

  if (v6)
  {
    if (v5)
    {
      id v7 = [(CSVoiceTriggerAssetHandlerDarwin *)self cachedAsset];
      v5[2](v5, v7, 0);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100149144;
    v8[3] = &unk_1002529B8;
    v8[4] = self;
    BOOL v9 = v5;
    [(CSVoiceTriggerAssetHandlerDarwin *)self _getVoiceTriggerAssetFromAssetManager:v8];
  }
}

- (void)start
{
  v3 = +[CSRemoteAssetManager sharedManager];
  [v3 addObserver:self forAssetType:0];

  id v4 = +[CSLanguageCodeUpdateMonitor sharedInstance];
  [v4 addObserver:self];
}

- (CSVoiceTriggerAssetHandlerDarwin)init
{
  if (+[CSUtils isDarwinOS])
  {
    v7.receiver = self;
    v7.super_class = (Class)CSVoiceTriggerAssetHandlerDarwin;
    v3 = [(CSVoiceTriggerAssetHandler *)&v7 init];
    id v4 = v3;
    if (v3)
    {
      [(CSVoiceTriggerAssetHandlerDarwin *)v3 start];
      [(CSVoiceTriggerAssetHandlerDarwin *)v4 setCachedAsset:0];
    }
    self = v4;
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end
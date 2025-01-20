@interface CSAssetManager
+ (id)sharedManager;
- (BOOL)_canFetchRemoteAsset:(unint64_t)a3;
- (CSAssetManager)initWithDownloadOption:(id)a3;
- (NSString)currentLanguageCode;
- (OS_dispatch_queue)queue;
- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4;
- (id)assetForCurrentLanguageOfType:(unint64_t)a3;
- (id)assetOfType:(unint64_t)a3 language:(id)a4;
- (id)installedAssetForCurrentLanguageOfType:(unint64_t)a3;
- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4;
- (void)CSAdBlockerMetaUpdateMonitor:(id)a3 didReceiveNewAdBlockerAssetMetaData:(BOOL)a4;
- (void)CSAssetController:(id)a3 didDownloadNewAssetForType:(unint64_t)a4;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSSpeakerRecognitionAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeakerRecognitionAssetMetaData:(BOOL)a4;
- (void)CSSpeechEndpointAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeechEndpointAssetMetaData:(BOOL)a4;
- (void)CSVoiceTriggerAssetMetaUpdateMonitor:(id)a3 didReceiveNewVoiceTriggerAssetMetaData:(BOOL)a4;
- (void)_createPeriodicalDownloadTimer;
- (void)_fetchRemoteMetaData;
- (void)_startPeriodicalDownload;
- (void)_stopPeriodicalDownload;
- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)assetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4;
- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6;
- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5;
- (void)assetOfType:(unint64_t)a3 providerType:(unint64_t)a4 language:(id)a5 completion:(id)a6;
- (void)installedAssetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4;
- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)setAssetDownloadingOption:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_downloadingOption, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
  objc_storeStrong((id *)&self->_enablePolicy, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_stopPeriodicalDownload
{
  v3 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSAssetManager _stopPeriodicalDownload]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  if (self->_downloadTimerCount <= 0)
  {
    v4 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[CSAssetManager _stopPeriodicalDownload]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s No periodical downloading is scheduled, ignore request.", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    dispatch_suspend((dispatch_object_t)self->_downloadTimer);
    --self->_downloadTimerCount;
  }
}

- (void)_startPeriodicalDownload
{
  v3 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSAssetManager _startPeriodicalDownload]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  if (self->_downloadTimerCount < 1)
  {
    dispatch_resume((dispatch_object_t)self->_downloadTimer);
    ++self->_downloadTimerCount;
  }
  else
  {
    v4 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[CSAssetManager _startPeriodicalDownload]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Periodical downloading is already scheduled, ignore request.", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_createPeriodicalDownloadTimer
{
  v3 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSAssetManager _createPeriodicalDownloadTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_downloadTimerCount = 0;
  v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  downloadTimer = self->_downloadTimer;
  self->_downloadTimer = v4;

  dispatch_time_t v6 = dispatch_time(0, 0);
  dispatch_source_set_timer((dispatch_source_t)self->_downloadTimer, v6, 0x4E9491800000uLL, 0);
  objc_initWeak((id *)buf, self);
  v7 = self->_downloadTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10010DFDC;
  handler[3] = &unk_1002533D0;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_source_set_event_handler(v7, handler);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)CSAssetController:(id)a3 didDownloadNewAssetForType:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10010E110;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)CSSpeechEndpointAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeechEndpointAssetMetaData:(BOOL)a4
{
  if (a4)
  {
    int v5 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010E32C;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)CSSpeakerRecognitionAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeakerRecognitionAssetMetaData:(BOOL)a4
{
  if (a4)
  {
    int v5 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010E3D4;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)CSAdBlockerMetaUpdateMonitor:(id)a3 didReceiveNewAdBlockerAssetMetaData:(BOOL)a4
{
  if (a4)
  {
    int v5 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010E47C;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)CSVoiceTriggerAssetMetaUpdateMonitor:(id)a3 didReceiveNewVoiceTriggerAssetMetaData:(BOOL)a4
{
  if (a4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010E508;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010E664;
  block[3] = &unk_1002532A8;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010E7E0;
  block[3] = &unk_1002532A8;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v6 = a4;
  p_currentLanguageCode = &self->_currentLanguageCode;
  objc_storeStrong((id *)p_currentLanguageCode, a4);
  id v8 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *p_currentLanguageCode;
    int v10 = 136315394;
    unint64_t v11 = "-[CSAssetManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v12 = 2114;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s _currentLanguageCode changed: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (NSString)currentLanguageCode
{
  return self->_currentLanguageCode;
}

- (BOOL)_canFetchRemoteAsset:(unint64_t)a3
{
  int v3 = a3;
  switch(a3)
  {
    case 0uLL:
      downloadingOption = self->_downloadingOption;
      BOOL result = [(CSAssetDownloadingOption *)downloadingOption allowVoiceTriggerAssetDownloading];
      break;
    case 1uLL:
      id v6 = self->_downloadingOption;
      BOOL result = [(CSAssetDownloadingOption *)v6 allowEndpointAssetDownloading];
      break;
    case 2uLL:
      id v9 = self->_downloadingOption;
      BOOL result = [(CSAssetDownloadingOption *)v9 allowLanguageDetectorAssetDownloading];
      break;
    case 3uLL:
      int v10 = self->_downloadingOption;
      BOOL result = [(CSAssetDownloadingOption *)v10 allowSpeakerRecognitionAssetDownloading];
      break;
    case 4uLL:
      unint64_t v11 = self->_downloadingOption;
      BOOL result = [(CSAssetDownloadingOption *)v11 allowAdBlockerAssetDownloading];
      break;
    case 5uLL:
      v7 = self->_downloadingOption;
      BOOL result = [(CSAssetDownloadingOption *)v7 allowVoiceTriggerAccessoryAssetDownloading];
      break;
    case 7uLL:
      __int16 v12 = self->_downloadingOption;
      BOOL result = [(CSAssetDownloadingOption *)v12 allowGibraltarVoiceTriggerAssetDownloading];
      break;
    default:
      id v8 = CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        v14 = "-[CSAssetManager _canFetchRemoteAsset:]";
        __int16 v15 = 1026;
        int v16 = v3;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Undefined assetType : %{public}u", (uint8_t *)&v13, 0x12u);
      }
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)_fetchRemoteMetaData
{
  if ([(CSAssetManager *)self _canFetchRemoteAsset:0])
  {
    int v3 = +[CSAssetControllerFactory defaultController];
    [v3 fetchRemoteMetaOfType:0];
  }
  else
  {
    v4 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      __int16 v12 = "-[CSAssetManager _fetchRemoteMetaData]";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Cannot fetch VoiceTrigger asset meta data", (uint8_t *)&v11, 0xCu);
    }
  }
  if (+[CSUtils supportHybridEndpointer]
    && [(CSAssetManager *)self _canFetchRemoteAsset:1])
  {
    int v5 = +[CSAssetControllerFactory defaultController];
    [v5 fetchRemoteMetaOfType:1];
  }
  if (+[CSUtils supportLanguageDetector]
    && [(CSAssetManager *)self _canFetchRemoteAsset:2])
  {
    id v6 = +[CSAssetControllerFactory defaultController];
    [v6 fetchRemoteMetaOfType:2];
  }
  if (+[CSUtils supportAdBlocker]
    && [(CSAssetManager *)self _canFetchRemoteAsset:4])
  {
    v7 = +[CSAssetControllerFactory defaultController];
    [v7 fetchRemoteMetaOfType:4];
  }
  if (+[CSUtils supportsSpeakerRecognitionAssets]&& [(CSAssetManager *)self _canFetchRemoteAsset:3])
  {
    id v8 = +[CSAssetControllerFactory defaultController];
    [v8 fetchRemoteMetaOfType:3];
  }
  if ([(CSAssetManager *)self _canFetchRemoteAsset:5])
  {
    id v9 = +[CSAssetControllerFactory defaultController];
    [v9 fetchRemoteMetaOfType:5];
  }
  if ([(CSAssetManager *)self _canFetchRemoteAsset:7])
  {
    int v10 = +[CSAssetControllerFactory defaultController];
    [v10 fetchRemoteMetaOfType:7];
  }
}

- (void)assetOfType:(unint64_t)a3 providerType:(unint64_t)a4 language:(id)a5 completion:(id)a6
{
  if (a4 == 1)
  {
    id v8 = a6;
    id v9 = a5;
    id v11 = +[CSTrialAssetManager sharedInstance];
    [v11 getInstalledAssetofType:a3 forLocale:v9 completion:v8];
  }
  else
  {
    id v9 = a6;
    id v11 = a5;
    -[CSAssetManager assetOfType:language:completion:](self, "assetOfType:language:completion:", a3);
  }
}

- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[CSAssetControllerFactory defaultController];
  [v9 installedAssetOfType:a3 language:v8 completion:v7];
}

- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4
{
  id v5 = a4;
  id v6 = +[CSAssetControllerFactory defaultController];
  id v7 = [v6 installedAssetOfType:a3 language:v5];

  return v7;
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6
{
  id v12 = a4;
  id v10 = a6;
  if ([(CSAssetManager *)self _canFetchRemoteAsset:a3])
  {
    id v11 = +[CSAssetControllerFactory defaultController];
    [v11 assetOfType:a3 language:v12 compatibilityVersion:a5 completion:v10];
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  LODWORD(self) = [(CSAssetManager *)self _canFetchRemoteAsset:a3];
  id v10 = +[CSAssetControllerFactory defaultController];
  id v11 = v10;
  if (self) {
    [v10 assetOfType:a3 language:v9 completion:v8];
  }
  else {
    [v10 installedAssetOfType:a3 language:v9 completion:v8];
  }
}

- (id)assetOfType:(unint64_t)a3 language:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(CSAssetManager *)self _canFetchRemoteAsset:a3];
  id v8 = +[CSAssetControllerFactory defaultController];
  id v9 = v8;
  if (v7) {
    [v8 assetOfType:a3 language:v6];
  }
  else {
  id v10 = [v8 installedAssetOfType:a3 language:v6];
  }

  return v10;
}

- (void)installedAssetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4
{
  currentLanguageCode = self->_currentLanguageCode;
  id v7 = a4;
  id v8 = +[CSUtils getSiriLanguageWithFallback:currentLanguageCode];
  id v9 = self->_currentLanguageCode;
  self->_currentLanguageCode = v8;

  id v10 = +[CSAssetControllerFactory defaultController];
  [v10 installedAssetOfType:a3 language:self->_currentLanguageCode completion:v7];
}

- (id)installedAssetForCurrentLanguageOfType:(unint64_t)a3
{
  id v5 = +[CSUtils getSiriLanguageWithFallback:self->_currentLanguageCode];
  currentLanguageCode = self->_currentLanguageCode;
  self->_currentLanguageCode = v5;

  id v7 = +[CSAssetControllerFactory defaultController];
  id v8 = [v7 installedAssetOfType:a3 language:self->_currentLanguageCode];

  return v8;
}

- (void)assetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4
{
  currentLanguageCode = self->_currentLanguageCode;
  id v7 = a4;
  id v8 = +[CSUtils getSiriLanguageWithFallback:currentLanguageCode];
  id v9 = self->_currentLanguageCode;
  self->_currentLanguageCode = v8;

  unsigned int v10 = [(CSAssetManager *)self _canFetchRemoteAsset:a3];
  id v11 = +[CSAssetControllerFactory defaultController];
  id v12 = self->_currentLanguageCode;
  id v13 = v11;
  if (v10) {
    [v11 assetOfType:a3 language:v12 completion:v7];
  }
  else {
    [v11 installedAssetOfType:a3 language:v12 completion:v7];
  }
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4
{
  id v5 = a4;
  id v6 = +[CSAssetControllerFactory defaultController];
  id v7 = [v6 allInstalledAssetsOfType:a3 language:v5];

  return v7;
}

- (id)assetForCurrentLanguageOfType:(unint64_t)a3
{
  id v5 = +[CSUtils getSiriLanguageWithFallback:self->_currentLanguageCode];
  currentLanguageCode = self->_currentLanguageCode;
  self->_currentLanguageCode = v5;

  unsigned int v7 = [(CSAssetManager *)self _canFetchRemoteAsset:a3];
  id v8 = +[CSAssetControllerFactory defaultController];
  id v9 = v8;
  unsigned int v10 = self->_currentLanguageCode;
  if (v7) {
    [v8 assetOfType:a3 language:v10];
  }
  else {
  id v11 = [v8 installedAssetOfType:a3 language:v10];
  }

  return v11;
}

- (void)setAssetDownloadingOption:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010F624;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAssetManager)initWithDownloadOption:(id)a3
{
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CSAssetManager;
  id v6 = [(CSAssetManager *)&v39 init];
  unsigned int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downloadingOption, a3);
    dispatch_queue_t v8 = dispatch_queue_create("Serial CSAssetManager queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    observers = v7->_observers;
    v7->_observers = (NSMutableDictionary *)v10;

    currentLanguageCode = v7->_currentLanguageCode;
    v7->_currentLanguageCode = (NSString *)@"en-US";

    uint64_t v13 = +[CSUtils getSiriLanguageWithFallback:v7->_currentLanguageCode];
    v14 = v7->_currentLanguageCode;
    v7->_currentLanguageCode = (NSString *)v13;

    __int16 v15 = +[CSLanguageCodeUpdateMonitor sharedInstance];
    [v15 addObserver:v7];

    int v16 = +[CSVoiceTriggerAssetMetaUpdateMonitor sharedInstance];
    [v16 addObserver:v7];

    v17 = +[CSSpeechEndpointAssetMetaUpdateMonitor sharedInstance];
    [v17 addObserver:v7];

    v18 = +[CSAdBlockerAssetMetaUpdateMonitor sharedInstance];
    [v18 addObserver:v7];

    v19 = +[CSSpeakerRecognitionAssetMetaUpdateMonitor sharedInstance];
    [v19 addObserver:v7];

    v20 = +[CSAssetControllerFactory defaultController];
    [v20 addObserver:v7 forAssetType:0];

    v21 = +[CSAssetControllerFactory defaultController];
    [v21 addObserver:v7 forAssetType:1];

    v22 = +[CSAssetControllerFactory defaultController];
    [v22 addObserver:v7 forAssetType:4];

    v23 = +[CSAssetControllerFactory defaultController];
    [v23 addObserver:v7 forAssetType:3];

    v24 = +[CSAssetControllerFactory defaultController];
    [v24 addObserver:v7 forAssetType:5];

    v25 = +[CSAssetControllerFactory defaultController];
    [v25 addObserver:v7 forAssetType:7];

    v26 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v7->_currentLanguageCode;
      *(_DWORD *)buf = 136315394;
      v41 = "-[CSAssetManager initWithDownloadOption:]";
      __int16 v42 = 2114;
      v43 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s init-_currentLanguageCode: %{public}@", buf, 0x16u);
    }
    [(CSAssetManager *)v7 _createPeriodicalDownloadTimer];
    objc_initWeak(&location, v7);
    uint64_t v28 = +[CSAssetManagerEnablePolicyFactory assetManagerEnabledPolicy];
    enablePolicy = v7->_enablePolicy;
    v7->_enablePolicy = (CSPolicy *)v28;

    v30 = v7->_enablePolicy;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10010FDB0;
    v36[3] = &unk_100252EE0;
    objc_copyWeak(&v37, &location);
    [(CSPolicy *)v30 setCallback:v36];
    if ([(CSPolicy *)v7->_enablePolicy isEnabled])
    {
      v31 = CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[CSAssetManager initWithDownloadOption:]";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Asset Manager Policy has been enabled, start fetching meta data now", buf, 0xCu);
      }
      v32 = v7->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010FF24;
      block[3] = &unk_100253AE0;
      v35 = v7;
      dispatch_async(v32, block);
    }
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)sharedManager
{
  if (qword_1002A3A20 != -1) {
    dispatch_once(&qword_1002A3A20, &stru_100251BC0);
  }
  v2 = (void *)qword_1002A3A18;
  return v2;
}

@end
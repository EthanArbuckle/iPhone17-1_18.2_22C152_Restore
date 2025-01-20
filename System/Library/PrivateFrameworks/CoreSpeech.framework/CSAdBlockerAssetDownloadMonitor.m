@interface CSAdBlockerAssetDownloadMonitor
+ (id)sharedInstance;
- (CSAdBlockerAssetDownloadMonitor)init;
- (CSTrialAssetDownloadMonitor)monitor;
- (const)_notificationKey;
- (void)_didInstalledNewAdBlockerAsset;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setMonitor:(id)a3;
- (void)trialAssetDownloadMonitorDelegate:(id)a3 didInstallNewAsset:(BOOL)a4 assetType:(unint64_t)a5;
@end

@implementation CSAdBlockerAssetDownloadMonitor

- (void).cxx_destruct
{
}

- (void)setMonitor:(id)a3
{
}

- (CSTrialAssetDownloadMonitor)monitor
{
  return self->_monitor;
}

- (void)trialAssetDownloadMonitorDelegate:(id)a3 didInstallNewAsset:(BOOL)a4 assetType:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (a5 == 4)
  {
    if (v6)
    {
      self->_lastUpdatedAssetType = 1;
      [(CSAdBlockerAssetDownloadMonitor *)self _didInstalledNewAdBlockerAsset];
    }
  }
  else
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[CSAdBlockerAssetDownloadMonitor trialAssetDownloadMonitorDelegate:didInstallNewAsset:assetType:]";
      __int16 v12 = 2048;
      unint64_t v13 = a5;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s ERR: Delegate received for invalid Trial assetType:%lu", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  [(CSAdBlockerAssetDownloadMonitor *)self notifyObserver:v4];
  [v4 CSAdBlockerAssetDownloadMonitor:self didInstallNewAsset:1 assetProviderType:self->_lastUpdatedAssetType];
}

- (void)_didInstalledNewAdBlockerAsset
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v6 = "-[CSAdBlockerAssetDownloadMonitor _didInstalledNewAdBlockerAsset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s New AdBlockerAsset is now installed", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10013507C;
  v4[3] = &unk_100253A08;
  v4[4] = self;
  [(CSAdBlockerAssetDownloadMonitor *)self enumerateObserversInQueue:v4];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      BOOL v6 = "-[CSAdBlockerAssetDownloadMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AdBlocker Asset Download", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  p_int notifyToken = &self->_notifyToken;
  if (self->_notifyToken == -1)
  {
    int v5 = a3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10013528C;
    handler[3] = &unk_100253680;
    handler[4] = self;
    notify_register_dispatch([(CSAdBlockerAssetDownloadMonitor *)self _notificationKey], p_notifyToken, v5, handler);

    BOOL v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSAdBlockerAssetDownloadMonitor _startMonitoringWithQueue:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AdBlocker Asset Download", buf, 0xCu);
    }
  }
}

- (const)_notificationKey
{
  return "com.apple.MobileAsset.AdBlockerAssets.ma.new-asset-installed";
}

- (CSAdBlockerAssetDownloadMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSAdBlockerAssetDownloadMonitor;
  v2 = [(CSAdBlockerAssetDownloadMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_int notifyToken = -1;
    uint64_t v4 = +[CSTrialAssetDownloadMonitor sharedInstance];
    monitor = v3->_monitor;
    v3->_monitor = (CSTrialAssetDownloadMonitor *)v4;

    [(CSTrialAssetDownloadMonitor *)v3->_monitor addObserver:v3];
    v3->_lastUpdatedAssetType = 0;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3B20 != -1) {
    dispatch_once(&qword_1002A3B20, &stru_100252308);
  }
  v2 = (void *)qword_1002A3B18;
  return v2;
}

@end
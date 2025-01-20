@interface CSSpeakerRecognitionAssetDownloadMonitor
+ (CSSpeakerRecognitionAssetDownloadMonitor)sharedInstance;
- (CSSpeakerRecognitionAssetDownloadMonitor)init;
- (CSTrialAssetDownloadMonitor)trialAssetMonitor;
- (const)_notificationKey;
- (void)_didInstalledNewAsset;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setTrialAssetMonitor:(id)a3;
- (void)trialAssetDownloadMonitorDelegate:(id)a3 didInstallNewAsset:(BOOL)a4 assetType:(unint64_t)a5;
@end

@implementation CSSpeakerRecognitionAssetDownloadMonitor

- (void).cxx_destruct
{
}

- (void)setTrialAssetMonitor:(id)a3
{
}

- (CSTrialAssetDownloadMonitor)trialAssetMonitor
{
  return self->_trialAssetMonitor;
}

- (void)trialAssetDownloadMonitorDelegate:(id)a3 didInstallNewAsset:(BOOL)a4 assetType:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (a5 == 3)
  {
    if (v6)
    {
      self->_lastUpdatedAssetType = 1;
      [(CSSpeakerRecognitionAssetDownloadMonitor *)self _didInstalledNewAsset];
    }
  }
  else
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[CSSpeakerRecognitionAssetDownloadMonitor trialAssetDownloadMonitorDelegate:didInstallNewAsset:assetType:]";
      __int16 v12 = 2048;
      unint64_t v13 = a5;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s ERR: Delegate received for invalid Trial assetType:%lu", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  [(CSSpeakerRecognitionAssetDownloadMonitor *)self notifyObserver:v4];
  [v4 CSSpeakerRecognitionAssetDownloadMonitor:self didInstallNewAsset:1 assetProviderType:self->_lastUpdatedAssetType];
}

- (void)_didInstalledNewAsset
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v6 = "-[CSSpeakerRecognitionAssetDownloadMonitor _didInstalledNewAsset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s New SpeakerRecognition Assets is now installed", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001628A0;
  v4[3] = &unk_100253A08;
  v4[4] = self;
  [(CSSpeakerRecognitionAssetDownloadMonitor *)self enumerateObserversInQueue:v4];
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
      BOOL v6 = "-[CSSpeakerRecognitionAssetDownloadMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : SpeakerRecognition Assets Download", (uint8_t *)&v5, 0xCu);
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
    handler[2] = sub_100162AB0;
    handler[3] = &unk_100253680;
    handler[4] = self;
    notify_register_dispatch([(CSSpeakerRecognitionAssetDownloadMonitor *)self _notificationKey], p_notifyToken, v5, handler);

    BOOL v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSpeakerRecognitionAssetDownloadMonitor _startMonitoringWithQueue:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : SpeakerRecognition Asset Download", buf, 0xCu);
    }
  }
}

- (const)_notificationKey
{
  return "com.apple.MobileAsset.SpeakerRecognitionAssets.ma.new-asset-installed";
}

- (CSSpeakerRecognitionAssetDownloadMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSSpeakerRecognitionAssetDownloadMonitor;
  v2 = [(CSSpeakerRecognitionAssetDownloadMonitor *)&v9 init];
  if (v2)
  {
    v3 = +[CSFPreferences sharedPreferences];
    unsigned int v4 = [v3 isSpeakerRecognitionAvailable];

    if (!v4)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v2->_int notifyToken = -1;
    uint64_t v5 = +[CSTrialAssetDownloadMonitor sharedInstance];
    trialAssetMonitor = v2->_trialAssetMonitor;
    v2->_trialAssetMonitor = (CSTrialAssetDownloadMonitor *)v5;

    [(CSTrialAssetDownloadMonitor *)v2->_trialAssetMonitor addObserver:v2];
    v2->_lastUpdatedAssetType = 0;
  }
  v7 = v2;
LABEL_6:

  return v7;
}

+ (CSSpeakerRecognitionAssetDownloadMonitor)sharedInstance
{
  if (qword_1002A3C48 != -1) {
    dispatch_once(&qword_1002A3C48, &stru_1002532C8);
  }
  v2 = (void *)qword_1002A3C40;
  return (CSSpeakerRecognitionAssetDownloadMonitor *)v2;
}

@end
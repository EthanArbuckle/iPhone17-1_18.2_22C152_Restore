@interface CSSpeakerRecognitionAssetMetaUpdateMonitor
+ (id)sharedInstance;
- (CSSpeakerRecognitionAssetMetaUpdateMonitor)init;
- (const)_asssetMetaUpdatedKey;
- (void)_didReceiveSpeakerRecognitionAssetMetaData;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSpeakerRecognitionAssetMetaUpdateMonitor

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  [(CSSpeakerRecognitionAssetMetaUpdateMonitor *)self notifyObserver:v4];
  [v4 CSSpeakerRecognitionAssetMetaUpdateMonitor:self didReceiveNewSpeakerRecognitionAssetMetaData:1];
}

- (void)_didReceiveSpeakerRecognitionAssetMetaData
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSSpeakerRecognitionAssetMetaUpdateMonitor _didReceiveSpeakerRecognitionAssetMetaData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s New Speaker Recognition asset metadata is available", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015D88;
  v4[3] = &unk_100253A08;
  v4[4] = self;
  [(CSSpeakerRecognitionAssetMetaUpdateMonitor *)self enumerateObservers:v4];
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
      v6 = "-[CSSpeakerRecognitionAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : SpeakerRecognition Asset meta update", (uint8_t *)&v5, 0xCu);
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
    handler[2] = sub_100015F98;
    handler[3] = &unk_100253680;
    handler[4] = self;
    notify_register_dispatch([(CSSpeakerRecognitionAssetMetaUpdateMonitor *)self _asssetMetaUpdatedKey], p_notifyToken, v5, handler);

    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSpeakerRecognitionAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : SpeakerRecognition Asset meta update", buf, 0xCu);
    }
  }
}

- (const)_asssetMetaUpdatedKey
{
  return "com.apple.MobileAsset.SpeakerRecognitionAssets.ma.cached-metadata-updated";
}

- (CSSpeakerRecognitionAssetMetaUpdateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSpeakerRecognitionAssetMetaUpdateMonitor;
  result = [(CSSpeakerRecognitionAssetMetaUpdateMonitor *)&v3 init];
  if (result) {
    result->_int notifyToken = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_1002A3598 != -1) {
    dispatch_once(&qword_1002A3598, &stru_10024E5F8);
  }
  v2 = (void *)qword_1002A3590;
  return v2;
}

@end
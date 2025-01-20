@interface CSSpeechEndpointAssetMetaUpdateMonitor
+ (id)sharedInstance;
- (CSSpeechEndpointAssetMetaUpdateMonitor)init;
- (void)_didReceiveNewSpeechEndpointAssetMetaData;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSpeechEndpointAssetMetaUpdateMonitor

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  [(CSSpeechEndpointAssetMetaUpdateMonitor *)self notifyObserver:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 CSSpeechEndpointAssetMetaUpdateMonitor:self didReceiveNewSpeechEndpointAssetMetaData:1];
  }
}

- (void)_didReceiveNewSpeechEndpointAssetMetaData
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _didReceiveNewSpeechEndpointAssetMetaData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s New speech endpoint asset is available", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001076C;
  v4[3] = &unk_10001CB60;
  v4[4] = self;
  [(CSSpeechEndpointAssetMetaUpdateMonitor *)self enumerateObservers:v4];
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
      v6 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : speech endpoint asset meta update", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  if (self->_notifyToken == -1)
  {
    if (CSIsWatch())
    {
      int v5 = "com.apple.MobileAsset.SpeechEndpointAssetsWatch.ma.cached-metadata-updated";
    }
    else if (CSIsTV())
    {
      int v5 = "com.apple.MobileAsset.SpeechEndpointAssetsTV.ma.cached-metadata-updated";
    }
    else if (CSIsOSX())
    {
      int v5 = "com.apple.MobileAsset.SpeechEndpointMacOSAssets.ma.cached-metadata-updated";
    }
    else if (+[CSUtils shouldUseHorsemanSpeechEndpointAssets])
    {
      int v5 = "com.apple.MobileAsset.SpeechEndpointMarshAssets.ma.cached-metadata-updated";
    }
    else
    {
      int v5 = "com.apple.MobileAsset.SpeechEndpointAssets.ma.cached-metadata-updated";
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000109E4;
    handler[3] = &unk_10001CB38;
    handler[4] = self;
    notify_register_dispatch(v5, &self->_notifyToken, v4, handler);
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      __int16 v10 = 2080;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : speech endpoint asset meta update with key %s", buf, 0x16u);
    }
  }
}

- (CSSpeechEndpointAssetMetaUpdateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSpeechEndpointAssetMetaUpdateMonitor;
  result = [(CSSpeechEndpointAssetMetaUpdateMonitor *)&v3 init];
  if (result) {
    result->_int notifyToken = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_100022D80 != -1) {
    dispatch_once(&qword_100022D80, &stru_10001CAD0);
  }
  v2 = (void *)qword_100022D78;
  return v2;
}

@end
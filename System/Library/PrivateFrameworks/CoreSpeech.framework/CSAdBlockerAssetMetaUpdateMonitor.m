@interface CSAdBlockerAssetMetaUpdateMonitor
+ (id)sharedInstance;
- (CSAdBlockerAssetMetaUpdateMonitor)init;
- (const)_asssetMetaUpdatedKey;
- (void)_didReceiveNewAdBlockerAssetMetaData;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSAdBlockerAssetMetaUpdateMonitor

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  [(CSAdBlockerAssetMetaUpdateMonitor *)self notifyObserver:v4];
  [v4 CSAdBlockerMetaUpdateMonitor:self didReceiveNewAdBlockerAssetMetaData:1];
}

- (void)_didReceiveNewAdBlockerAssetMetaData
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSAdBlockerAssetMetaUpdateMonitor _didReceiveNewAdBlockerAssetMetaData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s New AdBlocker asset metadata is available", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100162F68;
  v4[3] = &unk_100253A08;
  v4[4] = self;
  [(CSAdBlockerAssetMetaUpdateMonitor *)self enumerateObservers:v4];
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
      v6 = "-[CSAdBlockerAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AdBlocker Asset meta update", (uint8_t *)&v5, 0xCu);
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
    handler[2] = sub_100163178;
    handler[3] = &unk_100253680;
    handler[4] = self;
    notify_register_dispatch([(CSAdBlockerAssetMetaUpdateMonitor *)self _asssetMetaUpdatedKey], p_notifyToken, v5, handler);

    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSAdBlockerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AdBlocker Asset meta update", buf, 0xCu);
    }
  }
}

- (const)_asssetMetaUpdatedKey
{
  return "com.apple.MobileAsset.AdBlockerAssets.ma.cached-metadata-updated";
}

- (CSAdBlockerAssetMetaUpdateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSAdBlockerAssetMetaUpdateMonitor;
  result = [(CSAdBlockerAssetMetaUpdateMonitor *)&v3 init];
  if (result) {
    result->_int notifyToken = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_1002A3C58 != -1) {
    dispatch_once(&qword_1002A3C58, &stru_100253308);
  }
  v2 = (void *)qword_1002A3C50;
  return v2;
}

@end
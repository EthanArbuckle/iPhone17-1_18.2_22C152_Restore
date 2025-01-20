@interface CSCoreSpeechDaemonStateMonitor
+ (id)sharedInstance;
- (CSCoreSpeechDaemonStateMonitor)init;
- (void)_didReceiveDaemonStateChanged:(unint64_t)a3;
- (void)_notifyObserver:(id)a3 withDaemonState:(unint64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)notifyDaemonStateChanged:(unint64_t)a3;
@end

@implementation CSCoreSpeechDaemonStateMonitor

- (void)_notifyObserver:(id)a3 withDaemonState:(unint64_t)a4
{
  id v6 = a3;
  [(CSCoreSpeechDaemonStateMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 coreSpeechDaemonStateMonitor:self didReceiveStateChanged:a4];
  }
}

- (void)_didReceiveDaemonStateChanged:(unint64_t)a3
{
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSCoreSpeechDaemonStateMonitor _didReceiveDaemonStateChanged:]";
    __int16 v9 = 1026;
    int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s CoreSpeechDaemon state changed to %{public}u", buf, 0x12u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100148568;
  v6[3] = &unk_100253878;
  v6[4] = self;
  v6[5] = a3;
  [(CSCoreSpeechDaemonStateMonitor *)self enumerateObservers:v6];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSCoreSpeechDaemonStateMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : corespeechd state", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001487B8;
    handler[3] = &unk_100253680;
    handler[4] = self;
    notify_register_dispatch("com.apple.corespeech.corespeechd.launch", &self->_notifyToken, v4, handler);
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v9 = "-[CSCoreSpeechDaemonStateMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Start monitoring : corespeechd state";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v9 = "-[CSCoreSpeechDaemonStateMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Cannot start monitoring corespeechd state because it was already started";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
}

- (void)notifyDaemonStateChanged:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[CSCoreSpeechDaemonStateMonitor notifyDaemonStateChanged:]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Notifying CoreSpeechDaemon launched", (uint8_t *)&v4, 0xCu);
    }
    notify_post("com.apple.corespeech.corespeechd.launch");
  }
}

- (CSCoreSpeechDaemonStateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSCoreSpeechDaemonStateMonitor;
  result = [(CSCoreSpeechDaemonStateMonitor *)&v3 init];
  if (result) {
    result->_int notifyToken = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_1002A3B98 != -1) {
    dispatch_once(&qword_1002A3B98, &stru_100252990);
  }
  v2 = (void *)qword_1002A3B90;
  return v2;
}

@end
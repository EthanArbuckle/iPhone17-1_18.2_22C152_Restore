@interface CSSoftwareUpdateCheckingMonitor
+ (id)sharedInstance;
- (BOOL)_checkSoftwareUpdateCheckingState;
- (BOOL)isSoftwareUpdateCheckingRunning;
- (CSSoftwareUpdateCheckingMonitor)init;
- (unsigned)_softwareUpdateCheckingState;
- (void)_didReceiveSoftwareUpdateCheckingStateChanged:(BOOL)a3;
- (void)_didReceiveSoftwareUpdateCheckingStateChangedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withSoftwareUpdateCheckingRunning:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSoftwareUpdateCheckingMonitor

- (void)_notifyObserver:(id)a3 withSoftwareUpdateCheckingRunning:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSSoftwareUpdateCheckingMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSSoftwareUpdateCheckingMonitor:self didReceiveStateChanged:v4];
  }
}

- (void)_didReceiveSoftwareUpdateCheckingStateChanged:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10016795C;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSSoftwareUpdateCheckingMonitor *)self enumerateObservers:v3];
}

- (void)_didReceiveSoftwareUpdateCheckingStateChangedInQueue:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001679E0;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSSoftwareUpdateCheckingMonitor *)self enumerateObserversInQueue:v3];
}

- (BOOL)isSoftwareUpdateCheckingRunning
{
  return self->_isSoftwareUpdateCheckingRunning;
}

- (unsigned)_softwareUpdateCheckingState
{
  int out_token = -1;
  notify_register_check("com.apple.duetscheduler.restartCheckNotification", &out_token);
  if (out_token == -1) {
    return 0;
  }
  uint64_t v4 = 0;
  notify_get_state(out_token, &v4);
  notify_cancel(out_token);
  if (v4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)_checkSoftwareUpdateCheckingState
{
  unsigned int v2 = [(CSSoftwareUpdateCheckingMonitor *)self _softwareUpdateCheckingState];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2 == 1) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 136315394;
    v7 = "-[CSSoftwareUpdateCheckingMonitor _checkSoftwareUpdateCheckingState]";
    __int16 v8 = 2114;
    CFStringRef v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Software update checking running : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v2 == 1;
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    CFStringRef v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      int v6 = "-[CSSoftwareUpdateCheckingMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Software update checking state", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  CFStringRef v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100167DAC;
    handler[3] = &unk_100253680;
    handler[4] = self;
    notify_register_dispatch("com.apple.duetscheduler.restartCheckNotification", &self->_notifyToken, v4, handler);
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFStringRef v9 = "-[CSSoftwareUpdateCheckingMonitor _startMonitoringWithQueue:]";
      int v6 = "%s Start monitoring : Software update checking state";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFStringRef v9 = "-[CSSoftwareUpdateCheckingMonitor _startMonitoringWithQueue:]";
      int v6 = "%s Cannot start monitoring software update checking state because it was already started";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_isSoftwareUpdateCheckingRunning = [(CSSoftwareUpdateCheckingMonitor *)self _checkSoftwareUpdateCheckingState];
}

- (CSSoftwareUpdateCheckingMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSoftwareUpdateCheckingMonitor;
  result = [(CSSoftwareUpdateCheckingMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_isSoftwareUpdateCheckingRunning = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_1002A3C80 != -1) {
    dispatch_once(&qword_1002A3C80, &stru_1002534F8);
  }
  unsigned int v2 = (void *)qword_1002A3C78;
  return v2;
}

@end
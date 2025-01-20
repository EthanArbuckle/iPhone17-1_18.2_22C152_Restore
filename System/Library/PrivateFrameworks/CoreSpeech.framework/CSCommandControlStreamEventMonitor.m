@interface CSCommandControlStreamEventMonitor
+ (id)sharedInstance;
- (BOOL)isStreaming;
- (CSCommandControlStreamEventMonitor)init;
- (void)_notifyStopCommandControl;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)commandControlBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6;
- (void)commandControlBehaviorMonitor:(id)a3 didStopStream:(id)a4;
- (void)commandControlBehaviorMonitor:(id)a3 willStopStream:(id)a4;
@end

@implementation CSCommandControlStreamEventMonitor

- (BOOL)isStreaming
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCommandControlStreaming = self->_isCommandControlStreaming;
    int v6 = 136315394;
    v7 = "-[CSCommandControlStreamEventMonitor isStreaming]";
    __int16 v8 = 1024;
    BOOL v9 = isCommandControlStreaming;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Fetching CommandControl Listening State: %d", (uint8_t *)&v6, 0x12u);
  }
  return self->_isCommandControlStreaming;
}

+ (id)sharedInstance
{
  if (qword_1002A3BD8 != -1) {
    dispatch_once(&qword_1002A3BD8, &stru_100252B18);
  }
  v2 = (void *)qword_1002A3BD0;
  return v2;
}

- (void)_notifyStopCommandControl
{
  if (self->_isCommandControlStreaming)
  {
    self->_BOOL isCommandControlStreaming = 0;
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10014E63C;
    v2[3] = &unk_100253A08;
    v2[4] = self;
    [(CSCommandControlStreamEventMonitor *)self enumerateObserversInQueue:v2];
  }
}

- (void)commandControlBehaviorMonitor:(id)a3 didStopStream:(id)a4
{
}

- (void)commandControlBehaviorMonitor:(id)a3 willStopStream:(id)a4
{
}

- (void)commandControlBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6
{
  if (a5) {
    self->_BOOL isCommandControlStreaming = 1;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10014E6D0;
  v6[3] = &unk_100253A08;
  v6[4] = self;
  -[CSCommandControlStreamEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6, a4);
}

- (void)_stopMonitoring
{
  v3 = +[CSCommandControlBehaviorMonitor sharedInstance];
  [v3 unregisterObserver:self];

  self->_BOOL isCommandControlStreaming = 0;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = +[CSCommandControlBehaviorMonitor sharedInstance];
  [v4 registerObserver:self];

  self->_BOOL isCommandControlStreaming = 0;
}

- (CSCommandControlStreamEventMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSCommandControlStreamEventMonitor;
  result = [(CSCommandControlStreamEventMonitor *)&v3 init];
  if (result) {
    result->_BOOL isCommandControlStreaming = 0;
  }
  return result;
}

@end
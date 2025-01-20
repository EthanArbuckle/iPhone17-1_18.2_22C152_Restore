@interface CSMXRingtoneMonitor
+ (id)sharedInstance;
- (BOOL)isAnyRingtoneCurrentlyPlaying;
- (CSMXRingtoneMonitor)init;
- (void)_cancelTimeoutTimer;
- (void)_handleEndRingtone;
- (void)_handleStartRingtone;
- (void)_notifyObserversOfRingtoneChange;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startTimeoutTimer;
- (void)_stopMonitoring;
- (void)_timerCallback;
- (void)mxSessionMonitorSomeClientWentActive:(id)a3;
- (void)setIsAnyRingtoneCurrentlyPlaying:(BOOL)a3;
@end

@implementation CSMXRingtoneMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMonitorQueue, 0);
  objc_storeStrong((id *)&self->_ringtoneTimeoutTimer, 0);
}

- (void)setIsAnyRingtoneCurrentlyPlaying:(BOOL)a3
{
  self->_isAnyRingtoneCurrentlyPlaying = a3;
}

- (BOOL)isAnyRingtoneCurrentlyPlaying
{
  return self->_isAnyRingtoneCurrentlyPlaying;
}

- (void)_notifyObserversOfRingtoneChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000791FC;
  v2[3] = &unk_100253A08;
  v2[4] = self;
  [(CSMXRingtoneMonitor *)self enumerateObserversInQueue:v2];
}

- (void)_startTimeoutTimer
{
  ringtoneTimeoutTimer = self->_ringtoneTimeoutTimer;
  if (ringtoneTimeoutTimer) {
    [(NSTimer *)ringtoneTimeoutTimer invalidate];
  }
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSMXRingtoneMonitor _startTimeoutTimer]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079324;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cancelTimeoutTimer
{
  ringtoneTimeoutTimer = self->_ringtoneTimeoutTimer;
  if (ringtoneTimeoutTimer) {
    [(NSTimer *)ringtoneTimeoutTimer invalidate];
  }
}

- (void)_timerCallback
{
  eventMonitorQueue = self->_eventMonitorQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079424;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(eventMonitorQueue, block);
}

- (void)_handleEndRingtone
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSMXRingtoneMonitor _handleEndRingtone]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s _handleEndRingtone : Reset isRingtone", (uint8_t *)&v4, 0xCu);
  }
  [(CSMXRingtoneMonitor *)self setIsAnyRingtoneCurrentlyPlaying:0];
  [(CSMXRingtoneMonitor *)self _cancelTimeoutTimer];
  [(CSMXRingtoneMonitor *)self _notifyObserversOfRingtoneChange];
}

- (void)_handleStartRingtone
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSMXRingtoneMonitor _handleStartRingtone]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s _handleStartRingtone : Set isRingtone", (uint8_t *)&v4, 0xCu);
  }
  [(CSMXRingtoneMonitor *)self setIsAnyRingtoneCurrentlyPlaying:1];
  [(CSMXRingtoneMonitor *)self _startTimeoutTimer];
  [(CSMXRingtoneMonitor *)self _notifyObserversOfRingtoneChange];
}

- (void)mxSessionMonitorSomeClientWentActive:(id)a3
{
  id v4 = a3;
  eventMonitorQueue = self->_eventMonitorQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100079714;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(eventMonitorQueue, v7);
}

- (void)_stopMonitoring
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[CSMXRingtoneMonitor _stopMonitoring]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v4 = +[CSMXSessionMonitor sharedInstance];
  [v4 removeObserver:self];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[CSMXRingtoneMonitor _startMonitoringWithQueue:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  int v5 = +[CSMXSessionMonitor sharedInstance];
  [v5 addObserver:self];
}

- (CSMXRingtoneMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSMXRingtoneMonitor;
  v2 = [(CSMXRingtoneMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSMXRingtoneMonitorQueue", 0);
    eventMonitorQueue = v2->_eventMonitorQueue;
    v2->_eventMonitorQueue = (OS_dispatch_queue *)v3;

    [(CSMXRingtoneMonitor *)v2 setIsAnyRingtoneCurrentlyPlaying:0];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3800 != -1) {
    dispatch_once(&qword_1002A3800, &stru_10024FDB8);
  }
  v2 = (void *)qword_1002A37F8;
  return v2;
}

@end
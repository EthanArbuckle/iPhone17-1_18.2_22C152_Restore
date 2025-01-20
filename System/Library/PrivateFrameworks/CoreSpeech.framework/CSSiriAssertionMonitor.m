@interface CSSiriAssertionMonitor
+ (CSSiriAssertionMonitor)sharedInstance;
- (BOOL)isEnabled;
- (CSSiriAssertionMonitor)init;
- (void)_notifyObserver:(BOOL)a3;
- (void)_notifyObserverBacklightOn:(BOOL)a3 atHostTime:(unint64_t)a4;
- (void)_stopMonitoring;
- (void)backlightOnAssertionReceived:(BOOL)a3 atHostTime:(unint64_t)a4;
- (void)dealloc;
- (void)disableAssertionReceived;
- (void)enableAssertionReceived;
@end

@implementation CSSiriAssertionMonitor

- (void).cxx_destruct
{
}

- (BOOL)isEnabled
{
  return self->_assertionState == 2;
}

- (void)_notifyObserverBacklightOn:(BOOL)a3 atHostTime:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10014ABC0;
  v4[3] = &unk_100252A50;
  BOOL v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  [(CSSiriAssertionMonitor *)self enumerateObserversInQueue:v4];
}

- (void)_notifyObserver:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10014AC94;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSSiriAssertionMonitor *)self enumerateObserversInQueue:v3];
}

- (void)backlightOnAssertionReceived:(BOOL)a3 atHostTime:(unint64_t)a4
{
}

- (void)disableAssertionReceived
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014AD88;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)enableAssertionReceived
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014AEE8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopMonitoring
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    BOOL v4 = "-[CSSiriAssertionMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring: siri assertion enable/disable", (uint8_t *)&v3, 0xCu);
  }
}

- (void)dealloc
{
  [(CSSiriAssertionMonitor *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)CSSiriAssertionMonitor;
  [(CSSiriAssertionMonitor *)&v3 dealloc];
}

- (CSSiriAssertionMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSSiriAssertionMonitor;
  v2 = [(CSSiriAssertionMonitor *)&v8 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_assertionState = 0;
    dispatch_queue_t v4 = dispatch_queue_create("CSSiriAssertionMonitor queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSSiriAssertionMonitor init]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring: siri assertion enable/disable", buf, 0xCu);
    }
  }
  return v3;
}

+ (CSSiriAssertionMonitor)sharedInstance
{
  if (qword_1002A3BA8 != -1) {
    dispatch_once(&qword_1002A3BA8, &stru_100252A28);
  }
  v2 = (void *)qword_1002A3BA0;
  return (CSSiriAssertionMonitor *)v2;
}

@end
@interface CSGestureMonitorPhone
- (CSGestureMonitorPhone)init;
- (void)_didReceiveSleepGesture;
- (void)_didReceiveWakeGesture;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4;
@end

@implementation CSGestureMonitorPhone

- (void).cxx_destruct
{
}

- (void)_didReceiveSleepGesture
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000CBB50;
  v3[3] = &unk_100253A08;
  v3[4] = self;
  v2.receiver = self;
  v2.super_class = (Class)CSGestureMonitorPhone;
  [(CSGestureMonitorPhone *)&v2 enumerateObserversInQueue:v3];
}

- (void)_didReceiveWakeGesture
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000CBC44;
  v3[3] = &unk_100253A08;
  v3[4] = self;
  v2.receiver = self;
  v2.super_class = (Class)CSGestureMonitorPhone;
  [(CSGestureMonitorPhone *)&v2 enumerateObserversInQueue:v3];
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 3)
  {
    uint64_t v8 = mach_absolute_time();
    v9.receiver = self;
    v9.super_class = (Class)CSGestureMonitorPhone;
    [(CSGestureMonitor *)&v9 setDismissalTimestamp:v8];
    [(CSGestureMonitorPhone *)self _didReceiveSleepGesture];
  }
  else if (a4 == 1)
  {
    uint64_t v7 = mach_absolute_time();
    v10.receiver = self;
    v10.super_class = (Class)CSGestureMonitorPhone;
    [(CSGestureMonitor *)&v10 setWakeGestureTimestamp:v7];
    [(CSGestureMonitorPhone *)self _didReceiveWakeGesture];
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  [(CMWakeGestureManager *)self->_gestureManager setDelegate:self];
  [(CMWakeGestureManager *)self->_gestureManager startWakeGestureUpdates];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSGestureMonitorPhone _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Start monitoring: wake Gesture", (uint8_t *)&v5, 0xCu);
  }
}

- (CSGestureMonitorPhone)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSGestureMonitorPhone;
  objc_super v2 = [(CSGestureMonitorPhone *)&v6 init];
  if (v2 && [sub_1000CBEA4() isWakeGestureAvailable])
  {
    uint64_t v3 = [sub_1000CBEA4() sharedManager];
    gestureManager = v2->_gestureManager;
    v2->_gestureManager = (CMWakeGestureManager *)v3;
  }
  return v2;
}

@end
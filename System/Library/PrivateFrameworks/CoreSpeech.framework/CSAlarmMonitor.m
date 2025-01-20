@interface CSAlarmMonitor
+ (id)sharedInstance;
- (CSAlarmMonitor)init;
- (int64_t)alarmState;
- (void)_alarmDismissed:(id)a3;
- (void)_alarmIsFiring:(id)a3;
- (void)_alarmStateReset:(id)a3;
- (void)_notifyObserver:(id)a3 alarmIsFiringState:(int64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)initializeAlarmState;
@end

@implementation CSAlarmMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (int64_t)alarmState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C9918;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_notifyObserver:(id)a3 alarmIsFiringState:(int64_t)a4
{
  id v6 = a3;
  self->_alarmFiringState = a4;
  [(CSAlarmMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSAlarmMonitor:self didReceiveAlarmChanged:a4];
  }
}

- (void)_alarmStateReset:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[CSAlarmMonitor _alarmStateReset:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_alarmFiringState)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C9AE8;
    v6[3] = &unk_100253A08;
    v6[4] = self;
    [(CSAlarmMonitor *)self enumerateObserversInQueue:v6];
  }
}

- (void)_alarmDismissed:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[CSAlarmMonitor _alarmDismissed:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_alarmFiringState != 2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C9C2C;
    v6[3] = &unk_100253A08;
    v6[4] = self;
    [(CSAlarmMonitor *)self enumerateObserversInQueue:v6];
  }
}

- (void)_alarmIsFiring:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[CSAlarmMonitor _alarmIsFiring:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_alarmFiringState != 1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C9D70;
    v6[3] = &unk_100253A08;
    v6[4] = self;
    [(CSAlarmMonitor *)self enumerateObserversInQueue:v6];
  }
}

- (void)_stopMonitoring
{
  int64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "-[CSAlarmMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v11, 0xCu);
  }
  id v4 = sub_1000C9F08();
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:v4 object:0];
  }
  id v6 = sub_1000CA020();
  if (v6)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:v6 object:0];
  }
  uint64_t v8 = sub_1000CA138();
  if (v8)
  {
    __int16 v9 = +[NSNotificationCenter defaultCenter];
    [v9 removeObserver:self name:v8 object:0];
  }
  alarmManager = self->_alarmManager;
  self->_alarmManager = 0;

  self->_alarmFiringState = 0;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSAlarmMonitor _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  [(CSAlarmMonitor *)self _stopMonitoring];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v6 = (void *)qword_1002A3918;
  uint64_t v19 = qword_1002A3918;
  if (!qword_1002A3918)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v21 = sub_1000CA740;
    v22 = &unk_100253440;
    v23 = &v16;
    sub_1000CA740((uint64_t)&buf);
    id v6 = (void *)v17[3];
  }
  v7 = v6;
  _Block_object_dispose(&v16, 8);
  uint64_t v8 = (MTAlarmManager *)objc_alloc_init(v7);
  alarmManager = self->_alarmManager;
  self->_alarmManager = v8;

  [(MTAlarmManager *)self->_alarmManager checkIn];
  id v10 = sub_1000C9F08();
  if (v10)
  {
    int v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_alarmIsFiring:" name:v10 object:0];
  }
  v12 = sub_1000CA020();
  if (v12)
  {
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"_alarmDismissed:" name:v12 object:0];
  }
  v14 = sub_1000CA138();
  if (v14)
  {
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:self selector:"_alarmStateReset:" name:v14 object:0];
  }
  self->_alarmFiringState = 0;
}

- (void)initializeAlarmState
{
  int64_t v3 = [(MTAlarmManager *)self->_alarmManager alarms];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CA864;
  v6[3] = &unk_100250BF0;
  v6[4] = self;
  id v4 = [v3 addSuccessBlock:v6];
  id v5 = [v4 addFailureBlock:&stru_100250C30];
}

- (CSAlarmMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAlarmMonitor;
  v2 = [(CSAlarmMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAlarmMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_alarmFiringState = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3910 != -1) {
    dispatch_once(&qword_1002A3910, &stru_100250BC8);
  }
  v2 = (void *)qword_1002A3908;
  return v2;
}

@end
@interface CSTimerMonitor
+ (id)sharedInstance;
- (BOOL)_isSleepTimer:(id)a3;
- (CSTimerMonitor)init;
- (int64_t)timerState;
- (void)_notifyObserver:(id)a3 timerIsFiringState:(int64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)_timerDismissed:(id)a3;
- (void)_timerIsFiring:(id)a3;
- (void)_timerStateReset:(id)a3;
- (void)initializeTimerState;
@end

@implementation CSTimerMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (int64_t)timerState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004C744;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_notifyObserver:(id)a3 timerIsFiringState:(int64_t)a4
{
  id v6 = a3;
  self->_timerFiringState = a4;
  [(CSTimerMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSTimerMonitor:self didReceiveTimerChanged:a4];
  }
}

- (void)_timerStateReset:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[CSTimerMonitor _timerStateReset:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_timerFiringState)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004C914;
    v6[3] = &unk_100253A08;
    v6[4] = self;
    [(CSTimerMonitor *)self enumerateObserversInQueue:v6];
  }
}

- (void)_timerDismissed:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[CSTimerMonitor _timerDismissed:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (self->_timerFiringState != 2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004CA58;
    v6[3] = &unk_100253A08;
    v6[4] = self;
    [(CSTimerMonitor *)self enumerateObserversInQueue:v6];
  }
}

- (void)_timerIsFiring:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[CSTimerMonitor _timerIsFiring:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }
  if (![(CSTimerMonitor *)self _isSleepTimer:v4] && self->_timerFiringState != 1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004CBAC;
    v6[3] = &unk_100253A08;
    v6[4] = self;
    [(CSTimerMonitor *)self enumerateObserversInQueue:v6];
  }
}

- (BOOL)_isSleepTimer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v5 = (void *)qword_1002A36E8;
  uint64_t v27 = qword_1002A36E8;
  if (!qword_1002A36E8)
  {
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10004CDF0;
    v22 = &unk_100253440;
    v23 = &v24;
    id v6 = (void *)sub_10004CE40();
    v25[3] = (uint64_t)dlsym(v6, "MTTimerManagerTimersKey");
    qword_1002A36E8 = *(void *)(v23[1] + 24);
    v5 = (void *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v5)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v7 = [v4 objectForKey:*v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) sound];
        unsigned __int8 v13 = [v12 interruptAudio];

        if (v13)
        {
          LOBYTE(v9) = 1;
          goto LABEL_14;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v9;
}

- (void)_stopMonitoring
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "-[CSTimerMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v11, 0xCu);
  }
  id v4 = sub_10004D14C();
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:v4 object:0];
  }
  id v6 = sub_10004D264();
  if (v6)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:v6 object:0];
  }
  id v8 = sub_10004D37C();
  if (v8)
  {
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 removeObserver:self name:v8 object:0];
  }
  timerManager = self->_timerManager;
  self->_timerManager = 0;

  self->_timerFiringState = 0;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSTimerMonitor _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  [(CSTimerMonitor *)self _stopMonitoring];
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v6 = (void *)qword_1002A36C0;
  uint64_t v19 = qword_1002A36C0;
  if (!qword_1002A36C0)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v21 = sub_10004D800;
    v22 = &unk_100253440;
    v23 = &v16;
    sub_10004D800((uint64_t)&buf);
    id v6 = (void *)v17[3];
  }
  v7 = v6;
  _Block_object_dispose(&v16, 8);
  id v8 = (MTTimerManager *)objc_alloc_init(v7);
  timerManager = self->_timerManager;
  self->_timerManager = v8;

  [(MTTimerManager *)self->_timerManager checkIn];
  uint64_t v10 = sub_10004D14C();
  if (v10)
  {
    int v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_timerIsFiring:" name:v10 object:0];
  }
  v12 = sub_10004D264();
  if (v12)
  {
    unsigned __int8 v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"_timerDismissed:" name:v12 object:0];
  }
  v14 = sub_10004D37C();
  if (v14)
  {
    long long v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:self selector:"_timerStateReset:" name:v14 object:0];
  }
  self->_timerFiringState = 0;
}

- (void)initializeTimerState
{
  id v3 = [(MTTimerManager *)self->_timerManager timers];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004D924;
  v6[3] = &unk_100250BF0;
  v6[4] = self;
  id v4 = [v3 addSuccessBlock:v6];
  id v5 = [v4 addFailureBlock:&stru_10024F358];
}

- (CSTimerMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSTimerMonitor;
  v2 = [(CSTimerMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSTimerMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_timerFiringState = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A36B8 != -1) {
    dispatch_once(&qword_1002A36B8, &stru_10024F338);
  }
  v2 = (void *)qword_1002A36B0;
  return v2;
}

@end
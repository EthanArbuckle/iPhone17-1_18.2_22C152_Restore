@interface CSBluetoothSpeakerStateMonitor
+ (id)sharedInstance;
- (BOOL)isActive;
- (CSBluetoothSpeakerStateMonitor)init;
- (OS_dispatch_queue)queue;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_didReceiveBluetoothSpeakerStateChangeNotification:(BOOL)a3;
- (void)_fetchSpeakerStateActiveInfo;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setIsActive:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation CSBluetoothSpeakerStateMonitor

- (void).cxx_destruct
{
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  v5[0] = @"AVVoiceTriggerPort_BluetoothSpeaker";
  v5[1] = @"AVVoiceTriggerPort_BuiltinSpeaker";
  v6[0] = &__kCFBooleanTrue;
  v6[1] = &__kCFBooleanTrue;
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v4 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  [v4 enableListeningOnPorts:v3 completionBlock:&stru_10024EA08];
}

- (void)_didReceiveBluetoothSpeakerStateChangeNotification:(BOOL)a3
{
  self->_isActive = a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000282D8;
  v3[3] = &unk_100253A08;
  v3[4] = self;
  [(CSBluetoothSpeakerStateMonitor *)self enumerateObserversInQueue:v3];
}

- (void)_stopMonitoring
{
  v2 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  [v2 setPortStateChangedBlock:0];
  v7[0] = @"AVVoiceTriggerPort_BluetoothSpeaker";
  v7[1] = @"AVVoiceTriggerPort_BuiltinSpeaker";
  v8[0] = &__kCFBooleanFalse;
  v8[1] = &__kCFBooleanFalse;
  v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 enableListeningOnPorts:v3 completionBlock:&stru_10024E9E8];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSBluetoothSpeakerStateMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : BT Speaker state from AVVC", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_10002870C;
  v12 = &unk_10024E9A8;
  objc_copyWeak(&v13, &location);
  [v5 setPortStateChangedBlock:&v9];
  v17[0] = @"AVVoiceTriggerPort_BluetoothSpeaker";
  v17[1] = @"AVVoiceTriggerPort_BuiltinSpeaker";
  v18[0] = &__kCFBooleanTrue;
  v18[1] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2, v9, v10, v11, v12);
  [v5 enableListeningOnPorts:v6 completionBlock:&stru_10024E9C8];
  v7 = +[CSAudioServerCrashMonitor sharedInstance];
  [v7 addObserver:self];

  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSBluetoothSpeakerStateMonitor _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : BT Speaker state from AVVC", buf, 0xCu);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100028B24;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_fetchSpeakerStateActiveInfo
{
  char v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028C7C;
  v9[3] = &unk_10024E980;
  v9[4] = self;
  int v5 = v3;
  uint64_t v10 = v5;
  [v4 portStateActiveCompletionBlock:v9];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v5, v6))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028D54;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)start
{
}

- (CSBluetoothSpeakerStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSBluetoothSpeakerStateMonitor;
  v2 = [(CSBluetoothSpeakerStateMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSBluetoothSpeakerStateMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isActive = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3658 != -1) {
    dispatch_once(&qword_1002A3658, &stru_10024E958);
  }
  v2 = (void *)qword_1002A3650;
  return v2;
}

@end
@interface CSAVVCRecordingClientMonitor
+ (id)sharedInstance;
- (CSAVVCRecordingClientMonitor)init;
- (OS_dispatch_queue)queue;
- (unint64_t)numOfAVVCRecordingClients;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)_didReceiveAVVCRecordingClientNumberChange:(unint64_t)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setQueue:(id)a3;
@end

@implementation CSAVVCRecordingClientMonitor

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)numOfAVVCRecordingClients
{
  return self->_numOfAVVCRecordingClients;
}

- (void)_didReceiveAVVCRecordingClientNumberChange:(unint64_t)a3
{
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSAVVCRecordingClientMonitor _didReceiveAVVCRecordingClientNumberChange:]";
    __int16 v8 = 2050;
    unint64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s update AVVC recording client # : %{public}lu", (uint8_t *)&v6, 0x16u);
  }
  self->_numOfAVVCRecordingClients = a3;
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[CSAVVCRecordingClientMonitor CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Reset AVVC recording client count due to audio server crash", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122820;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopMonitoring
{
  v3 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  [v3 setSiriClientRecordStateChangedBlock:0];

  v4 = +[CSAudioServerCrashMonitor sharedInstance];
  [v4 removeObserver:self];

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[CSAVVCRecordingClientMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AVVC recording client count", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100122B44;
  v10[3] = &unk_100251FA8;
  objc_copyWeak(&v11, &location);
  [v5 siriClientsRecordingCompletionBlock:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100122C30;
  v8[3] = &unk_100252EE0;
  objc_copyWeak(&v9, &location);
  [v5 setSiriClientRecordStateChangedBlock:v8];
  int v6 = +[CSAudioServerCrashMonitor sharedInstance];
  [v6 addObserver:self];

  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSAVVCRecordingClientMonitor _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AVVC recording client count", buf, 0xCu);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (CSAVVCRecordingClientMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAVVCRecordingClientMonitor;
  v2 = [(CSAVVCRecordingClientMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAVVCRecordingClientMonitor Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_numOfAVVCRecordingClients = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3AA0 != -1) {
    dispatch_once(&qword_1002A3AA0, &stru_100251F58);
  }
  v2 = (void *)qword_1002A3A98;
  return v2;
}

@end
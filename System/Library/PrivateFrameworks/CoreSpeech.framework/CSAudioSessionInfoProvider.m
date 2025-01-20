@interface CSAudioSessionInfoProvider
+ (id)sharedInstance;
- (CSAudioSessionInfoProvider)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)sessionInfoQueue;
- (unsigned)audioSessionIdForDeviceId:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_audioRouteChanged:(id)a3;
- (void)_deregisterAudioSessionNotifications;
- (void)_handleInterruption:(id)a3;
- (void)_registerAudioRouteChangeNotification;
- (void)_registerAudioSessionNotifications;
- (void)_registerInterruptionNotification;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSessionInfoQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSAudioSessionInfoProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sessionInfoQueue, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setSessionInfoQueue:(id)a3
{
}

- (OS_dispatch_queue)sessionInfoQueue
{
  return self->_sessionInfoQueue;
}

- (void)_deregisterAudioSessionNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSAudioSessionInfoProvider _deregisterAudioSessionNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring AudioSession activities", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_registerAudioSessionNotifications
{
  [(CSAudioSessionInfoProvider *)self _registerInterruptionNotification];
  [(CSAudioSessionInfoProvider *)self _registerAudioRouteChangeNotification];
}

- (void)_audioRouteChanged:(id)a3
{
  id v4 = a3;
  sessionInfoQueue = self->_sessionInfoQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002542C;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(sessionInfoQueue, v7);
}

- (void)_handleInterruption:(id)a3
{
  id v4 = a3;
  sessionInfoQueue = self->_sessionInfoQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025698;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionInfoQueue, v7);
}

- (void)_registerAudioRouteChangeNotification
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  int v5 = +[AVAudioSession sharedInstance];
  [v4 addObserver:self selector:"_audioRouteChanged:" name:AVAudioSessionRouteChangeNotification object:v5];

  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSAudioSessionInfoProvider _registerAudioRouteChangeNotification]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AudioSessionRouteChangeNotification", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_registerInterruptionNotification
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVAudioSessionInterruptionNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  int v5 = +[AVAudioSession sharedInstance];
  [v4 addObserver:self selector:"_handleInterruption:" name:AVAudioSessionInterruptionNotification object:v5];

  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSAudioSessionInfoProvider _registerInterruptionNotification]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AudioSessionInterruption", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_stopMonitoring
{
  v3 = +[CSAudioServerCrashMonitor sharedInstance];
  [v3 removeObserver:self];

  [(CSAudioSessionInfoProvider *)self _deregisterAudioSessionNotifications];
}

- (void)_startMonitoring
{
  v3 = +[CSAudioServerCrashMonitor sharedInstance];
  [v3 addObserver:self];

  [(CSAudioSessionInfoProvider *)self _registerAudioSessionNotifications];
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  sessionInfoQueue = self->_sessionInfoQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025BC0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(sessionInfoQueue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  sessionInfoQueue = self->_sessionInfoQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025DBC;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(sessionInfoQueue, block);
}

- (unsigned)audioSessionIdForDeviceId:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CSUtils supportRemoraVoiceTrigger];
  if (v3 && v4)
  {
    int v5 = +[CSAudioRecordContext contextForRemoraVoiceTriggerWithDeviceId:v3];
    id v6 = [v5 avvcContextSettings];

    int v7 = +[AVVCSessionFactory sharedInstance];
    id v15 = 0;
    id v8 = [v7 sessionForContext:v6 error:&v15];
    id v9 = v15;

    if (v8)
    {
      unsigned int v10 = [v8 opaqueSessionID];
    }
    else
    {
      v11 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v13 = v11;
        v14 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSAudioSessionInfoProvider audioSessionIdForDeviceId:]";
        __int16 v18 = 2114;
        v19 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Session Query Failed : %{public}@", buf, 0x16u);
      }
      unsigned int v10 = 0;
    }
  }
  else
  {
    id v6 = +[AVAudioSession sharedInstance];
    unsigned int v10 = [v6 opaqueSessionID];
  }

  return v10;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    sessionInfoQueue = self->_sessionInfoQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002619C;
    v7[3] = &unk_100253B08;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(sessionInfoQueue, v7);
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    sessionInfoQueue = self->_sessionInfoQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000262A0;
    v7[3] = &unk_100253B08;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(sessionInfoQueue, v7);
  }
}

- (void)dealloc
{
  [(CSAudioSessionInfoProvider *)self _deregisterAudioSessionNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CSAudioSessionInfoProvider;
  [(CSAudioSessionInfoProvider *)&v3 dealloc];
}

- (CSAudioSessionInfoProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSAudioSessionInfoProvider;
  v2 = [(CSAudioSessionInfoProvider *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioSessionInfoProvider", 0);
    sessionInfoQueue = v2->_sessionInfoQueue;
    v2->_sessionInfoQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3640 != -1) {
    dispatch_once(&qword_1002A3640, &stru_10024E878);
  }
  v2 = (void *)qword_1002A3648;
  return v2;
}

@end
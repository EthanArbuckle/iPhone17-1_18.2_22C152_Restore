@interface CSMediaPlayingMonitor
+ (id)sharedInstance;
- (CSMediaPlayingMonitor)init;
- (int64_t)mediaPlayingState;
- (void)_notePossiblePlayPausedStateChange:(id)a3;
- (void)_notifyObserver:(id)a3 mediaIsPlayingState:(int64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)initializeMediaPlayingState;
- (void)mediaPlayingStateWithCompletion:(id)a3;
@end

@implementation CSMediaPlayingMonitor

- (void).cxx_destruct
{
}

- (void)mediaPlayingStateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10016ABDC;
    v7[3] = &unk_1002535D8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (int64_t)mediaPlayingState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016ACAC;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_notifyObserver:(id)a3 mediaIsPlayingState:(int64_t)a4
{
  id v6 = a3;
  [(CSMediaPlayingMonitor *)self notifyObserver:v6];
  self->_mediaIsPlaying = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 CSMediaPlayingMonitor:self didReceiveMediaPlayingChanged:a4];
  }
}

- (void)_notePossiblePlayPausedStateChange:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKey:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey];
  unsigned int v6 = [v5 BOOLValue];

  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "NOT PLAYING";
    v12 = "-[CSMediaPlayingMonitor _notePossiblePlayPausedStateChange:]";
    *(_DWORD *)buf = 136315650;
    if (v6) {
      uint64_t v8 = "PLAYING";
    }
    __int16 v13 = 2080;
    v14 = v8;
    __int16 v15 = 1024;
    unsigned int v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s MediaRemote reported the now playing app playback state changed to %s (state %d)", buf, 0x1Cu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016AEC0;
  v9[3] = &unk_1002536A8;
  v9[4] = self;
  char v10 = v6;
  [(CSMediaPlayingMonitor *)self enumerateObserversInQueue:v9];
}

- (void)_stopMonitoring
{
  int64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[CSMediaPlayingMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring MediaRemote: media playback", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  [(CSMediaPlayingMonitor *)self _stopMonitoring];
  MRMediaRemoteRegisterForNowPlayingNotifications();

  int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_notePossiblePlayPausedStateChange:" name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  unsigned int v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSMediaPlayingMonitor _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring MediaRemote: media playback", (uint8_t *)&v7, 0xCu);
  }
}

- (void)initializeMediaPlayingState
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016B138;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSMediaPlayingMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSMediaPlayingMonitor;
  v2 = [(CSMediaPlayingMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSMediaPlayingMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_mediaIsPlaying = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1002A3C90 != -1) {
      dispatch_once(&qword_1002A3C90, &stru_100253588);
    }
    id v2 = (id)qword_1002A3C88;
  }
  return v2;
}

@end
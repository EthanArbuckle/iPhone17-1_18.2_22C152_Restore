@interface VMPlayerController
- (AVPlayer)player;
- (BOOL)isAudioSessionActive;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)shouldEnableProximityMonitoring;
- (BOOL)updateProximityMonitoring;
- (NSURL)URL;
- (VMPlayerController)init;
- (VMPlayerController)initWithPlayer:(id)a3;
- (VMPlayerController)initWithPlayerItem:(id)a3;
- (VMPlayerController)initWithURL:(id)a3;
- (VMPlayerControllerDelegate)delegate;
- (double)duration;
- (float)currentTime;
- (float)rate;
- (id)_audioSessionSerialQueue;
- (id)description;
- (int)audioSessionState;
- (int64_t)status;
- (int64_t)timeControlStatus;
- (unint64_t)delay;
- (void)activateAudioSessionIfNeededWithCompletion:(id)a3;
- (void)deactivateAudioSession;
- (void)dealloc;
- (void)handleAudioSessionInterruptionNotification:(id)a3;
- (void)handleAudioSessionMediaServicesWereLostNotification:(id)a3;
- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3;
- (void)handleAudioSessionRouteChangeNotification:(id)a3;
- (void)handleDeviceProximityStateDidChangeNotificationNotification:(id)a3;
- (void)handlePlayerItemDidPlayToEndTimeNotification:(id)a3;
- (void)handlePlayerItemFailedToPlayToEndTimeNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playURL:(id)a3;
- (void)seekToTime:(float)a3;
- (void)setAudioSessionState:(int)a3;
- (void)setDelay:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setRate:(float)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimeControlStatus:(int64_t)a3;
- (void)setURL:(id)a3;
- (void)stop;
- (void)updateAudioSessionNotifications;
@end

@implementation VMPlayerController

- (VMPlayerController)init
{
  return [(VMPlayerController *)self initWithPlayerItem:0];
}

- (VMPlayerController)initWithURL:(id)a3
{
  id v5 = a3;
  v6 = +[AVPlayerItem playerItemWithURL:v5];
  v7 = [(VMPlayerController *)self initWithPlayerItem:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_URL, a3);
  }

  return v8;
}

- (id)_audioSessionSerialQueue
{
  if (_audioSessionSerialQueue_onceToken != -1) {
    dispatch_once(&_audioSessionSerialQueue_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)_audioSessionSerialQueue___VMPlayerControllerAudioSessionQueue;

  return v2;
}

void __46__VMPlayerController__audioSessionSerialQueue__block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("VMPlayerControllerAudioSessionQueue", 0);
  uint64_t v2 = _audioSessionSerialQueue___VMPlayerControllerAudioSessionQueue;
  _audioSessionSerialQueue___VMPlayerControllerAudioSessionQueue = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (BOOL)isAudioSessionActive
{
  return [(VMPlayerController *)self audioSessionState] == 0;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(VMPlayerController *)self URL];
  [v3 appendFormat:@" url=%@", v4];

  [v3 appendFormat:@" audioSessionActive=%ld", [self isAudioSessionActive]];
  [v3 appendFormat:@" status=%ld", [self status]];
  [v3 appendFormat:@" timeControlStatus=%ld" [self timeControlStatus]];
  [v3 appendString:@">"];
  id v5 = [v3 copy];

  return v5;
}

- (VMPlayerController)initWithPlayerItem:(id)a3
{
  v4 = +[AVPlayer playerWithPlayerItem:a3];
  [v4 setActionAtItemEnd:1];
  [v4 setAllowsExternalPlayback:0];
  id v5 = [(VMPlayerController *)self initWithPlayer:v4];

  return v5;
}

- (VMPlayerController)initWithPlayer:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)VMPlayerController;
  v6 = [(VMPlayerController *)&v27 init];
  v7 = v6;
  if (v6)
  {
    v6->_audioSessionState = 1;
    p_player = (id *)&v6->_player;
    objc_storeStrong((id *)&v6->_player, a3);
    [v5 rate];
    v7->_rate = v9;
    v7->_status = (int64_t)[v5 status];
    v7->_timeControlStatus = (int64_t)[v5 timeControlStatus];
    objc_initWeak(&location, v7);
    player = v7->_player;
    CMTimeMake(&v25, 1, 100);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __37__VMPlayerController_initWithPlayer___block_invoke;
    v23[3] = &unk_10027DDD8;
    objc_copyWeak(&v24, &location);
    id v11 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:&v25 queue:0 usingBlock:v23];
    id v12 = *p_player;
    v13 = NSStringFromSelector("rate");
    [v12 addObserver:v7 forKeyPath:v13 options:0 context:&VMPlayerControllerKeyValueObserverContext];

    id v14 = *p_player;
    v15 = NSStringFromSelector("status");
    [v14 addObserver:v7 forKeyPath:v15 options:0 context:&VMPlayerControllerKeyValueObserverContext];

    id v16 = *p_player;
    v17 = NSStringFromSelector("timeControlStatus");
    [v16 addObserver:v7 forKeyPath:v17 options:0 context:&VMPlayerControllerKeyValueObserverContext];

    v18 = [*p_player currentItem];

    if (v18)
    {
      v19 = [*p_player currentItem];
      v20 = NSStringFromSelector("duration");
      [v19 addObserver:v7 forKeyPath:v20 options:0 context:&VMPlayerControllerKeyValueObserverContext];
    }
    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v7 selector:"handlePlayerItemDidPlayToEndTimeNotification:" name:AVPlayerItemDidPlayToEndTimeNotification object:0];
    [v21 addObserver:v7 selector:"handlePlayerItemFailedToPlayToEndTimeNotification:" name:AVPlayerItemFailedToPlayToEndTimeNotification object:0];
    [v21 addObserver:v7 selector:"handleAudioSessionMediaServicesWereResetNotification:" name:AVSystemController_ServerConnectionDiedNotification object:0];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __37__VMPlayerController_initWithPlayer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = [WeakRetained delegate];
    char v3 = objc_opt_respondsToSelector();

    id WeakRetained = v5;
    if (v3)
    {
      v4 = [v5 delegate];
      [v5 currentTime];
      [v4 playerController:didChangeToCurrentTime:v5];

      id WeakRetained = v5;
    }
  }
}

- (void)dealloc
{
  player = self->_player;
  v4 = NSStringFromSelector("rate");
  [(AVPlayer *)player removeObserver:self forKeyPath:v4 context:&VMPlayerControllerKeyValueObserverContext];

  id v5 = self->_player;
  v6 = NSStringFromSelector("status");
  [(AVPlayer *)v5 removeObserver:self forKeyPath:v6 context:&VMPlayerControllerKeyValueObserverContext];

  v7 = self->_player;
  v8 = NSStringFromSelector("timeControlStatus");
  [(AVPlayer *)v7 removeObserver:self forKeyPath:v8 context:&VMPlayerControllerKeyValueObserverContext];

  float v9 = [(AVPlayer *)self->_player currentItem];
  v10 = NSStringFromSelector("duration");
  [v9 removeObserver:self forKeyPath:v10 context:&VMPlayerControllerKeyValueObserverContext];

  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self];

  v12.receiver = self;
  v12.super_class = (Class)VMPlayerController;
  [(VMPlayerController *)&v12 dealloc];
}

- (void)setURL:(id)a3
{
  id v5 = (NSURL *)a3;
  if (self->_URL != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_URL, a3);
    if (self->_URL) {
      id v6 = [objc_alloc((Class)AVPlayerItem) initWithURL:v7];
    }
    else {
      id v6 = 0;
    }
    [(VMPlayerController *)self setPlayerItem:v6];

    id v5 = v7;
  }
}

- (void)setPlayerItem:(id)a3
{
  id v13 = a3;
  v4 = [(VMPlayerController *)self player];
  id v5 = [v4 currentItem];

  if (v5 != v13)
  {
    id v6 = [(VMPlayerController *)self player];
    v7 = [v6 currentItem];

    if (v7)
    {
      v8 = NSStringFromSelector("duration");
      [v7 removeObserver:self forKeyPath:v8 context:&VMPlayerControllerKeyValueObserverContext];
    }
    float v9 = [(VMPlayerController *)self player];
    [v9 replaceCurrentItemWithPlayerItem:v13];

    v10 = [(VMPlayerController *)self player];
    id v11 = [v10 currentItem];

    if (v11)
    {
      objc_super v12 = NSStringFromSelector("duration");
      [v11 addObserver:self forKeyPath:v12 options:0 context:&VMPlayerControllerKeyValueObserverContext];
    }
  }
}

- (float)currentTime
{
  memset(&v6, 0, sizeof(v6));
  uint64_t v2 = [(VMPlayerController *)self player];
  char v3 = v2;
  if (v2) {
    [v2 currentTime];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }

  CMTime v5 = v6;
  return CMTimeGetSeconds(&v5);
}

- (double)duration
{
  CMTime v7 = kCMTimeIndefinite;
  uint64_t v2 = [(VMPlayerController *)self player];
  char v3 = [v2 currentItem];

  if (v3) {
    [v3 duration];
  }
  CMTime v6 = v7;
  double Seconds = CMTimeGetSeconds(&v6);

  return Seconds;
}

- (void)pause
{
  char v3 = vm_ui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(VMPlayerController *)self URL];
    int v6 = 138412290;
    CMTime v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pause requested for item at %@", (uint8_t *)&v6, 0xCu);
  }
  CMTime v5 = [(VMPlayerController *)self player];
  [v5 pause];
}

- (void)play
{
  char v3 = vm_ui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(VMPlayerController *)self URL];
    *(_DWORD *)buf = 138412290;
    float v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Play requested for item at %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __26__VMPlayerController_play__block_invoke;
  v6[3] = &unk_10027D380;
  objc_copyWeak(&v7, (id *)buf);
  CMTime v5 = objc_retainBlock(v6);
  [(VMPlayerController *)self activateAudioSessionIfNeededWithCompletion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

uint64_t __26__VMPlayerController_play__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    CMTime v5 = WeakRetained;
    id WeakRetained = [WeakRetained isAudioSessionActive];
    id v2 = v5;
    if (WeakRetained)
    {
      char v3 = [v5 player];
      [v3 play];

      id v2 = v5;
    }
  }

  return _objc_release_x1(WeakRetained, v2);
}

- (void)playURL:(id)a3
{
  [(VMPlayerController *)self setURL:a3];

  [(VMPlayerController *)self play];
}

- (void)stop
{
  char v3 = vm_ui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(VMPlayerController *)self URL];
    int v5 = 138412290;
    int v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop requested for item at %@", (uint8_t *)&v5, 0xCu);
  }
  [(VMPlayerController *)self pause];
  [(VMPlayerController *)self seekToTime:0.0];
  if ([(VMPlayerController *)self isAudioSessionActive]) {
    [(VMPlayerController *)self deactivateAudioSession];
  }
}

- (void)seekToTime:(float)a3
{
  int v5 = [(VMPlayerController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(VMPlayerController *)self delegate];
    *(float *)&double v8 = a3;
    [v7 playerController:self willSeekToTime:v8];
  }
  memset(&v15, 0, sizeof(v15));
  CMTimeMakeWithSeconds(&v15, a3, 1);
  float v9 = [(VMPlayerController *)self player];
  CMTime v14 = v15;
  [v9 seekToTime:&v14];

  v10 = [(VMPlayerController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    objc_super v12 = [(VMPlayerController *)self delegate];
    *(float *)&double v13 = a3;
    [v12 playerController:self didSeekToTime:v13];
  }
}

- (BOOL)isPaused
{
  return [(VMPlayerController *)self timeControlStatus] == 0;
}

- (BOOL)isPlaying
{
  return (id)[(VMPlayerController *)self timeControlStatus] == (id)2;
}

- (void)setRate:(float)a3
{
  if (self->_rate != a3)
  {
    int v5 = [(VMPlayerController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(VMPlayerController *)self delegate];
      *(float *)&double v8 = a3;
      [v7 playerController:self willChangeToRate:v8];
    }
    self->_rate = a3;
    float v9 = [(VMPlayerController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v12 = [(VMPlayerController *)self delegate];
      *(float *)&double v11 = a3;
      [v12 playerController:self didChangeToRate:v11];
    }
  }
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    int v5 = [(VMPlayerController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(VMPlayerController *)self delegate];
      [v7 playerController:self willChangeToStatus:a3];
    }
    self->_status = a3;
    double v8 = [(VMPlayerController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(VMPlayerController *)self delegate];
      [v10 playerController:self didChangeToStatus:a3];
    }
  }
}

- (void)setTimeControlStatus:(int64_t)a3
{
  if (self->_timeControlStatus != a3)
  {
    int v5 = [(VMPlayerController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(VMPlayerController *)self delegate];
      [v7 playerController:self willChangeToTimeControlStatus:a3];
    }
    self->_timeControlStatus = a3;
    double v8 = [(VMPlayerController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(VMPlayerController *)self delegate];
      [v10 playerController:self didChangeToTimeControlStatus:a3];
    }
  }
}

- (void)updateAudioSessionNotifications
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ not updating audioSession notifications with pending audioSession deactivation", (uint8_t *)&v2, 0xCu);
}

- (void)activateAudioSessionIfNeededWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  if (![(VMPlayerController *)self isAudioSessionActive])
  {
    int v5 = vm_ui_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is activating an audio session.", buf, 0xCu);
    }

    if ([(VMPlayerController *)self audioSessionState] == 2)
    {
      char v6 = vm_ui_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ waiting for audio session to finish deactivating before activating new one", buf, 0xCu);
      }

      id v7 = [(VMPlayerController *)self _audioSessionSerialQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __65__VMPlayerController_activateAudioSessionIfNeededWithCompletion___block_invoke;
      v9[3] = &unk_10027CC38;
      v9[4] = self;
      id v10 = v4;
      dispatch_async(v7, v9);

      goto LABEL_11;
    }
    double v8 = +[AVAudioSession sharedInstance];
    -[VMPlayerController setAudioSessionState:](self, "setAudioSessionState:", [v8 activateVoicemailAudioSession] ^ 1);

    [(VMPlayerController *)self updateAudioSessionNotifications];
    [(VMPlayerController *)self updateProximityMonitoring];
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_11:
}

void __65__VMPlayerController_activateAudioSessionIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __65__VMPlayerController_activateAudioSessionIfNeededWithCompletion___block_invoke_2;
  v2[3] = &unk_10027CC38;
  dispatch_queue_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id __65__VMPlayerController_activateAudioSessionIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateAudioSessionIfNeededWithCompletion:*(void *)(a1 + 40)];
}

- (void)deactivateAudioSession
{
  if ([(VMPlayerController *)self isAudioSessionActive])
  {
    id v3 = vm_ui_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ is deactivating an audio session.", buf, 0xCu);
    }

    [(VMPlayerController *)self setAudioSessionState:2];
    objc_initWeak((id *)buf, self);
    v4 = [(VMPlayerController *)self _audioSessionSerialQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __44__VMPlayerController_deactivateAudioSession__block_invoke;
    v5[3] = &unk_10027C8A0;
    objc_copyWeak(&v6, (id *)buf);
    v5[4] = self;
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __44__VMPlayerController_deactivateAudioSession__block_invoke(uint64_t a1)
{
  int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = *(id *)(a1 + 32);
    int v5 = +[AVAudioSession sharedInstance];
    id v6 = v5;
    if (v5)
    {
      -[NSObject setAudioSessionState:](v4, "setAudioSessionState:", [v5 deactivateVoicemailAudioSession]);
      [v4 updateAudioSessionNotifications];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __44__VMPlayerController_deactivateAudioSession__block_invoke_105;
      v22[3] = &unk_10027C8A0;
      objc_copyWeak(&v23, v2);
      v22[4] = *(void *)(a1 + 32);
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v22);
      objc_destroyWeak(&v23);
    }
    else
    {
      CMTime v14 = PHDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __44__VMPlayerController_deactivateAudioSession__block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  else
  {
    v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__VMPlayerController_deactivateAudioSession__block_invoke_cold_1(v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void __44__VMPlayerController_deactivateAudioSession__block_invoke_105(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 updateProximityMonitoring];
  }
  else
  {
    v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__VMPlayerController_deactivateAudioSession__block_invoke_105_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (BOOL)shouldEnableProximityMonitoring
{
  if (![(VMPlayerController *)self isAudioSessionActive]) {
    return 0;
  }
  int v2 = +[AVAudioSession sharedInstance];
  id v3 = [v2 currentRoute];
  v4 = [v3 outputs];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 portType:v17];
        unsigned __int8 v12 = [v11 isEqualToString:AVAudioSessionPortBuiltInReceiver];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = [v10 portType];
          unsigned int v14 = [v13 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

          if (!v14 || !UIAccessibilityIsVoiceOverRunning()) {
            continue;
          }
        }
        BOOL v15 = 1;
        goto LABEL_15;
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)updateProximityMonitoring
{
  BOOL v3 = [(VMPlayerController *)self shouldEnableProximityMonitoring];
  v4 = +[UIDevice currentDevice];
  if (v3 != [v4 isProximityMonitoringEnabled])
  {
    [v4 setProximityMonitoringEnabled:v3];
    id v5 = +[NSNotificationCenter defaultCenter];
    id v6 = v5;
    if (v3) {
      [v5 addObserver:self selector:"handleDeviceProximityStateDidChangeNotificationNotification:" name:UIDeviceProximityStateDidChangeNotification object:v4];
    }
    else {
      [v5 removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:v4];
    }
  }
  unsigned __int8 v7 = [v4 isProximityMonitoringEnabled];

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v34 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned __int8 v12 = v11;
  if (a6 == &VMPlayerControllerKeyValueObserverContext)
  {
    if (v11)
    {
      uint64_t v13 = [v11 objectForKeyedSubscript:NSKeyValueChangeNotificationIsPriorKey];
      objc_opt_class();
      unsigned int v14 = (objc_opt_isKindOfClass() & 1) != 0
          ? [&__kCFBooleanTrue isEqualToNumber:v13]
          : 0;
    }
    else
    {
      unsigned int v14 = 0;
    }
    if (v34)
    {
      id v15 = [v34 length];
      if (v10)
      {
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v10;
            long long v17 = [(VMPlayerController *)self player];
            unsigned int v18 = [v16 isEqual:v17];

            if (v18)
            {
              long long v19 = NSStringFromSelector("rate");
              unsigned int v20 = [v34 isEqualToString:v19];

              if (v20)
              {
                if ((v14 & 1) == 0)
                {
                  [v16 rate];
                  -[VMPlayerController setRate:](self, "setRate:");
                }
              }
              else
              {
                v29 = NSStringFromSelector("status");
                unsigned int v30 = [v34 isEqualToString:v29];

                if (v30)
                {
                  if ((v14 & 1) == 0) {
                    -[VMPlayerController setStatus:](self, "setStatus:", [v16 status]);
                  }
                }
                else
                {
                  v31 = NSStringFromSelector("timeControlStatus");
                  unsigned int v32 = [v34 isEqualToString:v31];

                  if (((v32 ^ 1 | v14) & 1) == 0) {
                    -[VMPlayerController setTimeControlStatus:](self, "setTimeControlStatus:", [v16 timeControlStatus]);
                  }
                }
              }
            }
            goto LABEL_33;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_2;
          }
          id v21 = v10;
          v22 = [(VMPlayerController *)self player];
          id v23 = [v22 currentItem];
          LODWORD(v21) = [v21 isEqual:v23];

          if (!v21) {
            goto LABEL_33;
          }
          id v24 = NSStringFromSelector("duration");
          unsigned int v25 = [v34 isEqualToString:v24];

          if (!v25) {
            goto LABEL_33;
          }
          v26 = [(VMPlayerController *)self delegate];
          if (v14)
          {
            char v27 = objc_opt_respondsToSelector();

            if (v27)
            {
              v28 = [(VMPlayerController *)self delegate];
              [(VMPlayerController *)self duration];
              [v28 playerController:self willChangeToDuration:];
LABEL_32:
            }
          }
          else
          {
            int v33 = objc_opt_respondsToSelector();

            if (v33)
            {
              v28 = [(VMPlayerController *)self delegate];
              [(VMPlayerController *)self duration];
              [v28 playerController:didChangeToDuration:self];
              goto LABEL_32;
            }
          }
LABEL_33:
        }
      }
    }
  }
LABEL_2:
}

- (void)handleAudioSessionInterruptionNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

void __65__VMPlayerController_handleAudioSessionInterruptionNotification___block_invoke(uint64_t a1)
{
  int v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v11 = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v11, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) userInfo];
  id v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 objectForKeyedSubscript:AVAudioSessionInterruptionTypeKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 unsignedIntegerValue];
      if (v8 == (id)1)
      {
        [*(id *)(a1 + 32) pause];
        [*(id *)(a1 + 32) deactivateAudioSession];
      }
      else if (!v8)
      {
        uint64_t v9 = [v6 objectForKeyedSubscript:AVAudioSessionInterruptionOptionKey];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v9 unsignedIntegerValue];

          if (v10 == (id)1) {
            [*(id *)(a1 + 32) play];
          }
        }
        else
        {
        }
      }
    }
  }
}

- (void)handleAudioSessionRouteChangeNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

void __64__VMPlayerController_handleAudioSessionRouteChangeNotification___block_invoke(uint64_t a1)
{
  int v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) userInfo];
  id v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (char *)[v7 unsignedIntegerValue] - 1 <= (char *)3) {
      [*(id *)(a1 + 32) updateProximityMonitoring];
    }
  }
}

- (void)handleAudioSessionMediaServicesWereLostNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

id __74__VMPlayerController_handleAudioSessionMediaServicesWereLostNotification___block_invoke(uint64_t a1)
{
  int v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) stop];
}

- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

void __75__VMPlayerController_handleAudioSessionMediaServicesWereResetNotification___block_invoke(uint64_t a1)
{
  int v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 playerControllerDidReset:*(void *)(a1 + 32)];
  }
}

- (void)handlePlayerItemDidPlayToEndTimeNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

void __67__VMPlayerController_handlePlayerItemDidPlayToEndTimeNotification___block_invoke(uint64_t a1)
{
  int v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) object];
  if (v5)
  {
    char v6 = [*(id *)(a1 + 32) player];
    uint64_t v7 = [v6 currentItem];

    if (v5 == v7) {
      [*(id *)(a1 + 32) stop];
    }
  }
}

- (void)handleDeviceProximityStateDidChangeNotificationNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

id __82__VMPlayerController_handleDeviceProximityStateDidChangeNotificationNotification___block_invoke(uint64_t a1)
{
  int v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }

  id result = [*(id *)(a1 + 32) isAudioSessionActive];
  if (result)
  {
    char v6 = +[UIDevice currentDevice];
    unsigned int v7 = [v6 proximityState];

    id result = [*(id *)(a1 + 32) timeControlStatus];
    if ((unint64_t)result >= 2)
    {
      if (result == (id)2 && (v7 & 1) == 0) {
        return [*(id *)(a1 + 32) pause];
      }
    }
    else if (v7)
    {
      return [*(id *)(a1 + 32) play];
    }
  }
  return result;
}

- (void)handlePlayerItemFailedToPlayToEndTimeNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

void __72__VMPlayerController_handlePlayerItemFailedToPlayToEndTimeNotification___block_invoke(uint64_t a1)
{
  int v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v13 = 138412546;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v13, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) object];
  if (v5)
  {
    char v6 = [*(id *)(a1 + 32) player];
    unsigned int v7 = [v6 currentItem];

    if (v5 == v7)
    {
      int v8 = [*(id *)(a1 + 40) userInfo];
      uint64_t v9 = v8;
      if (v8)
      {
        __int16 v10 = [v8 objectForKeyedSubscript:AVPlayerItemFailedToPlayToEndTimeErrorKey];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if (v11)
          {
            uint64_t v12 = vm_ui_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              __72__VMPlayerController_handlePlayerItemFailedToPlayToEndTimeNotification___block_invoke_cold_1((uint64_t)v11, v12);
            }
          }
        }
      }
      [*(id *)(a1 + 32) stop];
    }
  }
}

- (VMPlayerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMPlayerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (unint64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(unint64_t)a3
{
  self->_delay = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)timeControlStatus
{
  return self->_timeControlStatus;
}

- (float)rate
{
  return self->_rate;
}

- (int64_t)status
{
  return self->_status;
}

- (int)audioSessionState
{
  return self->_audioSessionState;
}

- (void)setAudioSessionState:(int)a3
{
  self->_audioSessionState = a3;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __44__VMPlayerController_deactivateAudioSession__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__VMPlayerController_deactivateAudioSession__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__VMPlayerController_deactivateAudioSession__block_invoke_105_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__VMPlayerController_handlePlayerItemFailedToPlayToEndTimeNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end
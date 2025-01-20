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
  if (qword_1000695C0 != -1) {
    dispatch_once(&qword_1000695C0, &stru_10005D510);
  }
  v2 = (void *)qword_1000695C8;

  return v2;
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

  [v3 appendFormat:@" audioSessionActive=%ld", -[VMPlayerController isAudioSessionActive](self, "isAudioSessionActive")];
  [v3 appendFormat:@" status=%ld" , -[self status]];
  [v3 appendFormat:@" timeControlStatus=%ld" , -[self timeControlStatus]];
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
    v23[2] = sub_100012808;
    v23[3] = &unk_10005D538;
    objc_copyWeak(&v24, &location);
    id v11 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:&v25 queue:0 usingBlock:v23];
    id v12 = *p_player;
    v13 = NSStringFromSelector("rate");
    [v12 addObserver:v7 forKeyPath:v13 options:0 context:&off_10005D558];

    id v14 = *p_player;
    v15 = NSStringFromSelector("status");
    [v14 addObserver:v7 forKeyPath:v15 options:0 context:&off_10005D558];

    id v16 = *p_player;
    v17 = NSStringFromSelector("timeControlStatus");
    [v16 addObserver:v7 forKeyPath:v17 options:0 context:&off_10005D558];

    v18 = [*p_player currentItem];

    if (v18)
    {
      v19 = [*p_player currentItem];
      v20 = NSStringFromSelector("duration");
      [v19 addObserver:v7 forKeyPath:v20 options:0 context:&off_10005D558];
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

- (void)dealloc
{
  player = self->_player;
  v4 = NSStringFromSelector("rate");
  [(AVPlayer *)player removeObserver:self forKeyPath:v4 context:&off_10005D558];

  id v5 = self->_player;
  v6 = NSStringFromSelector("status");
  [(AVPlayer *)v5 removeObserver:self forKeyPath:v6 context:&off_10005D558];

  v7 = self->_player;
  v8 = NSStringFromSelector("timeControlStatus");
  [(AVPlayer *)v7 removeObserver:self forKeyPath:v8 context:&off_10005D558];

  float v9 = [(AVPlayer *)self->_player currentItem];
  v10 = NSStringFromSelector("duration");
  [v9 removeObserver:self forKeyPath:v10 context:&off_10005D558];

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
      [v7 removeObserver:self forKeyPath:v8 context:&off_10005D558];
    }
    float v9 = [(VMPlayerController *)self player];
    [v9 replaceCurrentItemWithPlayerItem:v13];

    v10 = [(VMPlayerController *)self player];
    id v11 = [v10 currentItem];

    if (v11)
    {
      objc_super v12 = NSStringFromSelector("duration");
      [v11 addObserver:self forKeyPath:v12 options:0 context:&off_10005D558];
    }
  }
}

- (float)currentTime
{
  memset(&v6, 0, sizeof(v6));
  v2 = [(VMPlayerController *)self player];
  v3 = v2;
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
  v2 = [(VMPlayerController *)self player];
  v3 = [v2 currentItem];

  if (v3) {
    [v3 duration];
  }
  CMTime v6 = v7;
  double Seconds = CMTimeGetSeconds(&v6);

  return Seconds;
}

- (void)pause
{
  v3 = vm_ui_log();
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
  v3 = vm_ui_log();
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
  v6[2] = sub_100012F28;
  v6[3] = &unk_10005D3F8;
  objc_copyWeak(&v7, (id *)buf);
  CMTime v5 = objc_retainBlock(v6);
  [(VMPlayerController *)self activateAudioSessionIfNeededWithCompletion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)playURL:(id)a3
{
  [(VMPlayerController *)self setURL:a3];

  [(VMPlayerController *)self play];
}

- (void)stop
{
  v3 = vm_ui_log();
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
  v3 = +[NSNotificationCenter defaultCenter];
  unsigned int v4 = [(VMPlayerController *)self audioSessionState];
  switch(v4)
  {
    case 2u:
      int v5 = vm_ui_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100041098((uint64_t)self, v5);
      }

      break;
    case 1u:
      [v3 removeObserver:self name:AVAudioSessionInterruptionNotification object:0];
      [v3 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];
      [v3 removeObserver:self name:AVAudioSessionMediaServicesWereLostNotification object:0];
      [v3 removeObserver:self name:AVAudioSessionMediaServicesWereResetNotification object:0];
      break;
    case 0u:
      [v3 addObserver:self selector:"handleAudioSessionInterruptionNotification:" name:AVAudioSessionInterruptionNotification object:0];
      [v3 addObserver:self selector:"handleAudioSessionRouteChangeNotification:" name:AVAudioSessionRouteChangeNotification object:0];
      [v3 addObserver:self selector:"handleAudioSessionMediaServicesWereLostNotification:" name:AVAudioSessionMediaServicesWereLostNotification object:0];
      [v3 addObserver:self selector:"handleAudioSessionMediaServicesWereResetNotification:" name:AVAudioSessionMediaServicesWereResetNotification object:0];
      break;
  }
}

- (void)activateAudioSessionIfNeededWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
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
      v9[2] = sub_10001386C;
      v9[3] = &unk_10005D568;
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

- (void)deactivateAudioSession
{
  if ([(VMPlayerController *)self isAudioSessionActive])
  {
    v3 = vm_ui_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ is deactivating an audio session.", buf, 0xCu);
    }

    [(VMPlayerController *)self setAudioSessionState:2];
    objc_initWeak((id *)buf, self);
    unsigned int v4 = [(VMPlayerController *)self _audioSessionSerialQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100013A70;
    v5[3] = &unk_10005D590;
    objc_copyWeak(&v6, (id *)buf);
    v5[4] = self;
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)shouldEnableProximityMonitoring
{
  if (![(VMPlayerController *)self isAudioSessionActive]) {
    return 0;
  }
  v2 = +[AVAudioSession sharedInstance];
  v3 = [v2 currentRoute];
  unsigned int v4 = [v3 outputs];

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
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v11 = [v10 portType:v17];
        unsigned __int8 v12 = [v11 isEqualToString:AVAudioSessionPortBuiltInReceiver];

        if ((v12 & 1) == 0)
        {
          double v13 = [v10 portType];
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
  unsigned int v4 = +[UIDevice currentDevice];
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
  if (a6 == &off_10005D558)
  {
    if (v11)
    {
      double v13 = [v11 objectForKeyedSubscript:NSKeyValueChangeNotificationIsPriorKey];
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
          v23 = [v22 currentItem];
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

- (void)handleAudioSessionRouteChangeNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

- (void)handleAudioSessionMediaServicesWereLostNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

- (void)handlePlayerItemDidPlayToEndTimeNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

- (void)handleDeviceProximityStateDidChangeNotificationNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

- (void)handlePlayerItemFailedToPlayToEndTimeNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
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

@end
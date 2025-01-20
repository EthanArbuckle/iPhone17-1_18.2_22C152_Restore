@interface HFAudioPlayer
- (AVAudioPlayer)audioPlayer;
- (AVAudioSession)audioSession;
- (BOOL)_configureAudioSession:(id *)a3;
- (BOOL)isAudioSessionActive;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)prepareToPlay:(id *)a3;
- (CADisplayLink)displayLink;
- (HFAudioPlayer)initWithAudioFileURL:(id)a3 audioSessionOptions:(unint64_t)a4 delegate:(id)a5;
- (HFAudioPlayerDelegate)delegate;
- (NSNumber)routeChangeReason;
- (NSURL)audioFileURL;
- (double)duration;
- (double)playerCurrentTime;
- (float)volume;
- (id)_audioSessionCategory;
- (unint64_t)_audioSessionCategoryOptions;
- (unint64_t)audioSessionOptions;
- (unint64_t)playerStopSource;
- (void)_cleanup;
- (void)_deactivateAudioSession;
- (void)_deregisterAudioSessionObservers;
- (void)_displayLinkUpdated:(id)a3;
- (void)_pauseWithReason:(id)a3;
- (void)_registerAudioSessionObservers;
- (void)_stopWithoutAudioSessionDeactivation;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)audioSessionDidInterrupt:(id)a3;
- (void)audioSessionMediaServicesWereLost:(id)a3;
- (void)audioSessionMediaServicesWereReset:(id)a3;
- (void)audioSessionRouteChanged:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)play;
- (void)resume;
- (void)setAudioFileURL:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setAudioSessionIsActive:(BOOL)a3;
- (void)setAudioSessionOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPlayerCurrentTime:(double)a3;
- (void)setPlayerStopSource:(unint64_t)a3;
- (void)setRouteChangeReason:(id)a3;
- (void)setVolume:(float)a3;
- (void)stop;
- (void)updateAudioFileURL:(id)a3;
@end

@implementation HFAudioPlayer

- (HFAudioPlayer)initWithAudioFileURL:(id)a3 audioSessionOptions:(unint64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFAudioPlayer;
  v11 = [(HFAudioPlayer *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_audioFileURL, a3);
    v12->_playerStopSource = 0;
    unint64_t v13 = 2;
    if ((a4 & 1) == 0) {
      unint64_t v13 = a4;
    }
    v12->_audioSessionOptions = v13;
  }

  return v12;
}

- (void)updateAudioFileURL:(id)a3
{
  v4 = (NSURL *)a3;
  if ([(HFAudioPlayer *)self isPlaying]) {
    [(HFAudioPlayer *)self _stopWithoutAudioSessionDeactivation];
  }
  audioFileURL = self->_audioFileURL;
  self->_audioFileURL = v4;
}

- (void)dealloc
{
  [(HFAudioPlayer *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)HFAudioPlayer;
  [(HFAudioPlayer *)&v3 dealloc];
}

- (void)_registerAudioSessionObservers
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_audioSessionDidInterrupt_ name:*MEMORY[0x263EF90A0] object:0];
  [v3 addObserver:self selector:sel_audioSessionRouteChanged_ name:*MEMORY[0x263EF9248] object:0];
  [v3 addObserver:self selector:sel_audioSessionMediaServicesWereLost_ name:*MEMORY[0x263EF90E8] object:0];
  [v3 addObserver:self selector:sel_audioSessionMediaServicesWereReset_ name:*MEMORY[0x263EF90F8] object:0];
}

- (void)_deregisterAudioSessionObservers
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EF90A0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263EF9248] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263EF90E8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263EF90F8] object:0];
}

- (void)_displayLinkUpdated:(id)a3
{
  v4 = [(HFAudioPlayer *)self audioPlayer];
  [v4 currentTime];
  -[HFAudioPlayer setPlayerCurrentTime:](self, "setPlayerCurrentTime:");

  v5 = [(HFAudioPlayer *)self audioPlayer];
  int v6 = [v5 isPlaying];

  if (!v6) {
    return;
  }
  uint64_t v7 = [(HFAudioPlayer *)self delegate];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(HFAudioPlayer *)self delegate];
    if (([v9 conformsToProtocol:&unk_26C1825E8] & 1) == 0)
    {

      goto LABEL_7;
    }
    id v10 = [(HFAudioPlayer *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v8 = [(HFAudioPlayer *)self delegate];
      [(HFAudioPlayer *)self playerCurrentTime];
      objc_msgSend(v8, "audioPlayer:didUpdatePlaybackTime:", self);
LABEL_7:
    }
  }
  uint64_t v12 = [(HFAudioPlayer *)self delegate];
  if (!v12) {
    return;
  }
  id v17 = (id)v12;
  unint64_t v13 = [(HFAudioPlayer *)self delegate];
  if ([v13 conformsToProtocol:&unk_26C1825E8])
  {
    v14 = [(HFAudioPlayer *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      return;
    }
    id v17 = [(HFAudioPlayer *)self delegate];
    unint64_t v13 = [(HFAudioPlayer *)self audioPlayer];
    [v13 averagePowerForChannel:0];
    [v17 audioPlayer:self didUpdateAveragePower:v16];
  }
}

- (BOOL)_configureAudioSession:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EF93E0] sharedInstance];
  [(HFAudioPlayer *)self setAudioSession:v5];

  int v6 = [(HFAudioPlayer *)self _audioSessionCategory];
  unint64_t v7 = [(HFAudioPlayer *)self _audioSessionCategoryOptions];
  v8 = HFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v22 = [NSNumber numberWithUnsignedInteger:v7];
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v22;
    _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Now setting audioSession Category = [%@] with Category Option = [%@]", buf, 0x16u);
  }
  id v9 = [(HFAudioPlayer *)self audioSession];
  uint64_t v10 = *MEMORY[0x263EF9150];
  id v24 = 0;
  char v11 = [v9 setCategory:v6 mode:v10 options:v7 error:&v24];
  id v12 = v24;

  if (v11)
  {

    unint64_t v13 = [(HFAudioPlayer *)self audioSession];
    id v23 = 0;
    char v14 = [v13 setActivationContext:MEMORY[0x263EFFA78] error:&v23];
    id v12 = v23;

    char v15 = HFLogForCategory(0xAuLL);
    float v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [(HFAudioPlayer *)self audioSession];
        v18 = [v17 outputDataSources];
        *(_DWORD *)buf = 138412290;
        id v26 = v18;
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Successfully configured Audio session with outputDataSources [%@]", buf, 0xCu);
      }
      BOOL v19 = 1;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v12;
        _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Error setting activation context [%@]", buf, 0xCu);
      }

      id v12 = v12;
      BOOL v19 = 0;
      *a3 = v12;
    }
  }
  else
  {
    v20 = HFLogForCategory(0xAuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v12;
      _os_log_error_impl(&dword_20B986000, v20, OS_LOG_TYPE_ERROR, "Error setting Default Audio Session Category [%@]", buf, 0xCu);
    }

    BOOL v19 = 0;
  }

  return v19;
}

- (void)_deactivateAudioSession
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HFAudioPlayer *)self audioSession];
  id v9 = 0;
  char v4 = [v3 setActive:0 withOptions:1 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    int v6 = HFLogForCategory(0xAuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Error deactivating audio session [%@]", buf, 0xCu);
    }
  }
  unint64_t v7 = [(HFAudioPlayer *)self audioSession];
  uint64_t v8 = 0;
  [v7 setActivationContext:MEMORY[0x263EFFA78] error:&v8];

  [(HFAudioPlayer *)self setAudioSessionIsActive:0];
}

- (id)_audioSessionCategory
{
  char v3 = [(HFAudioPlayer *)self audioSessionOptions];
  char v4 = [(HFAudioPlayer *)self audioSessionOptions];
  if ((v3 & 8) != 0)
  {
    id v5 = (void **)MEMORY[0x263EF9048];
  }
  else
  {
    id v5 = (void **)MEMORY[0x263EF9050];
    if ((v4 & 2) == 0) {
      id v5 = (void **)MEMORY[0x263EF9060];
    }
  }
  int v6 = *v5;
  return v6;
}

- (unint64_t)_audioSessionCategoryOptions
{
  if (([(HFAudioPlayer *)self audioSessionOptions] & 8) != 0) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = ((int64_t)([(HFAudioPlayer *)self audioSessionOptions] << 62) >> 63) & 0x2C;
  }
  return ([(HFAudioPlayer *)self audioSessionOptions] >> 3) & 2 | v3;
}

- (void)_pauseWithReason:(id)a3
{
  id v12 = a3;
  char v4 = [(HFAudioPlayer *)self audioPlayer];
  [v4 pause];

  id v5 = [(HFAudioPlayer *)self audioPlayer];
  [v5 currentTime];
  -[HFAudioPlayer setPlayerCurrentTime:](self, "setPlayerCurrentTime:");

  int v6 = [(HFAudioPlayer *)self displayLink];
  [v6 setPaused:1];

  self->_paused = 1;
  uint64_t v7 = [(HFAudioPlayer *)self delegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(HFAudioPlayer *)self delegate];
    if ([v9 conformsToProtocol:&unk_26C1825E8])
    {
      uint64_t v10 = [(HFAudioPlayer *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v8 = [(HFAudioPlayer *)self delegate];
      [v8 audioPlayer:self didPausePlaybackWithReason:v12];
    }
    else
    {
    }
  }
LABEL_7:
}

- (void)_stopWithoutAudioSessionDeactivation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t v3 = HFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(HFAudioPlayer *)self audioFileURL];
    int v13 = 138412290;
    char v14 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Stopping Audio Player for URL = [%@]", (uint8_t *)&v13, 0xCu);
  }
  id v5 = [(HFAudioPlayer *)self audioPlayer];
  [v5 pause];

  int v6 = [(HFAudioPlayer *)self audioPlayer];
  [v6 stop];

  uint64_t v7 = [(HFAudioPlayer *)self audioPlayer];
  [v7 setCurrentTime:0.0];

  self->_paused = 0;
  uint64_t v8 = [(HFAudioPlayer *)self delegate];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = [(HFAudioPlayer *)self delegate];
    if ([v10 conformsToProtocol:&unk_26C1825E8])
    {
      char v11 = [(HFAudioPlayer *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        return;
      }
      id v9 = [(HFAudioPlayer *)self delegate];
      [v9 audioPlayerDidStopPlayback:self];
    }
    else
    {
    }
  }
}

- (void)_cleanup
{
  int64_t v3 = [(HFAudioPlayer *)self audioPlayer];
  int v4 = [v3 isPlaying];

  if (v4)
  {
    id v5 = [(HFAudioPlayer *)self audioPlayer];
    [v5 stop];
  }
  [(CADisplayLink *)self->_displayLink invalidate];
  [(HFAudioPlayer *)self _deregisterAudioSessionObservers];
  [(HFAudioPlayer *)self _deactivateAudioSession];
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

  audioSession = self->_audioSession;
  self->_audioSession = 0;

  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_paused = 0;
}

- (BOOL)prepareToPlay:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc(MEMORY[0x263EF93B8]);
  int v6 = [(HFAudioPlayer *)self audioFileURL];
  id v26 = 0;
  uint64_t v7 = (void *)[v5 initWithContentsOfURL:v6 error:&v26];
  id v8 = v26;
  [(HFAudioPlayer *)self setAudioPlayer:v7];

  id v9 = [(HFAudioPlayer *)self audioPlayer];
  [v9 setMeteringEnabled:1];

  uint64_t v10 = [(HFAudioPlayer *)self audioPlayer];
  [v10 setDelegate:self];

  if (v8)
  {
    char v11 = HFLogForCategory(0xAuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Error initializing AVAudioPlayer [%@]", buf, 0xCu);
    }

    id v12 = v8;
    BOOL v13 = 0;
    *a3 = v12;
  }
  else if ([(HFAudioPlayer *)self isAudioSessionActive])
  {
    char v14 = HFLogForCategory(0xAuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(HFAudioPlayer *)self audioFileURL];
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Audio Session is already active continuining with AVAudioPlayer configured for URL [%@]", buf, 0xCu);
    }
    id v12 = 0;
    BOOL v13 = 1;
  }
  else
  {
    id v25 = 0;
    BOOL v16 = [(HFAudioPlayer *)self _configureAudioSession:&v25];
    id v17 = v25;
    v18 = v17;
    if (v16)
    {
      BOOL v19 = [(HFAudioPlayer *)self audioSession];
      id v24 = v18;
      char v20 = [v19 setActive:1 error:&v24];
      id v12 = v24;

      if (v20)
      {
        BOOL v13 = 1;
        [(HFAudioPlayer *)self setAudioSessionIsActive:1];
        v21 = [(HFAudioPlayer *)self audioPlayer];
        [v21 prepareToPlay];

        [(HFAudioPlayer *)self _registerAudioSessionObservers];
      }
      else
      {
        v22 = HFLogForCategory(0xAuLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v12;
          _os_log_error_impl(&dword_20B986000, v22, OS_LOG_TYPE_ERROR, "Failed activating audio session [%@]", buf, 0xCu);
        }

        [(HFAudioPlayer *)self setAudioSessionIsActive:0];
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
      id v12 = v17;
    }
  }

  return v13;
}

- (void)play
{
  int64_t v3 = [(HFAudioPlayer *)self displayLink];

  if (v3)
  {
    int v4 = [(HFAudioPlayer *)self displayLink];
    [v4 invalidate];
  }
  id v5 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__displayLinkUpdated_];
  [(HFAudioPlayer *)self setDisplayLink:v5];

  int v6 = [(HFAudioPlayer *)self displayLink];
  [v6 setPreferredFramesPerSecond:60];

  uint64_t v7 = [(HFAudioPlayer *)self displayLink];
  id v8 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v7 addToRunLoop:v8 forMode:*MEMORY[0x263EFF588]];

  id v9 = [(HFAudioPlayer *)self audioPlayer];
  [v9 play];
}

- (void)pause
{
}

- (void)resume
{
  int64_t v3 = [(HFAudioPlayer *)self audioPlayer];
  [v3 play];

  int v4 = [(HFAudioPlayer *)self audioPlayer];
  [(HFAudioPlayer *)self playerCurrentTime];
  double v6 = v5;
  [(HFAudioPlayer *)self playerCurrentTime];
  if (v6 >= 0.02) {
    double v7 = v7 + -0.02;
  }
  [v4 setCurrentTime:v7];

  id v8 = [(HFAudioPlayer *)self displayLink];
  [v8 setPaused:0];

  self->_paused = 0;
  uint64_t v9 = [(HFAudioPlayer *)self delegate];
  if (v9)
  {
    id v13 = (id)v9;
    uint64_t v10 = [(HFAudioPlayer *)self delegate];
    if ([v10 conformsToProtocol:&unk_26C1825E8])
    {
      char v11 = [(HFAudioPlayer *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        return;
      }
      id v13 = [(HFAudioPlayer *)self delegate];
      [v13 audioPlayerDidResumePlayback:self];
    }
    else
    {
    }
  }
}

- (void)stop
{
  [(HFAudioPlayer *)self _stopWithoutAudioSessionDeactivation];
  [(HFAudioPlayer *)self _cleanup];
}

- (BOOL)isPlaying
{
  v2 = [(HFAudioPlayer *)self audioPlayer];
  char v3 = [v2 isPlaying];

  return v3;
}

- (double)duration
{
  v2 = [(HFAudioPlayer *)self audioPlayer];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v5 = HFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Setting player volume to [%f]", (uint8_t *)&v8, 0xCu);
  }

  double v6 = [(HFAudioPlayer *)self audioPlayer];
  *(float *)&double v7 = a3;
  [v6 setVolume:v7];
}

- (float)volume
{
  v2 = [(HFAudioPlayer *)self audioPlayer];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (void)audioSessionDidInterrupt:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = HFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Audio Session was interrupted [%@]", (uint8_t *)&v6, 0xCu);
  }

  [(HFAudioPlayer *)self setPlayerStopSource:2];
  [(HFAudioPlayer *)self _pauseWithReason:@"Audio Session Interrupted"];
}

- (void)audioSessionMediaServicesWereLost:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = HFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Media Services Were Lost [%@]", (uint8_t *)&v6, 0xCu);
  }

  [(HFAudioPlayer *)self setPlayerStopSource:3];
  [(HFAudioPlayer *)self _pauseWithReason:@"Audio Session Lost"];
}

- (void)audioSessionMediaServicesWereReset:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = HFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Media Services Were Reset [%@]", (uint8_t *)&v6, 0xCu);
  }

  [(HFAudioPlayer *)self setPlayerStopSource:3];
  [(HFAudioPlayer *)self _pauseWithReason:@"Audio Session Reset"];
}

- (void)audioSessionRouteChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = HFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Audio Session Route Changed [%@]", (uint8_t *)&v11, 0xCu);
  }

  if ([(HFAudioPlayer *)self isAudioSessionActive])
  {
    int v6 = [v4 userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x263EF9268]];
    uint64_t v8 = [v7 unsignedIntegerValue];

    if ((unint64_t)(v8 - 1) <= 1)
    {
      double v9 = HFLogForCategory(0xAuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [NSNumber numberWithUnsignedInteger:v8];
        int v11 = 138412290;
        id v12 = v10;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Routes Changed for reason [%@]", (uint8_t *)&v11, 0xCu);
      }
      [(HFAudioPlayer *)self setPlayerStopSource:4];
      [(HFAudioPlayer *)self _pauseWithReason:@"Audio Routes Changed"];
    }
  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(HFAudioPlayer *)self displayLink];
  [v6 invalidate];

  [(HFAudioPlayer *)self setPlayerCurrentTime:0.0];
  uint64_t v7 = [(HFAudioPlayer *)self delegate];
  if (v7)
  {
    id v13 = (id)v7;
    uint64_t v8 = [(HFAudioPlayer *)self delegate];
    if ([v8 conformsToProtocol:&unk_26C1825E8])
    {
      double v9 = [(HFAudioPlayer *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0) {
        return;
      }
      int v11 = [(HFAudioPlayer *)self delegate];
      id v13 = v11;
      if (v4)
      {
        [v11 audioPlayerDidFinishPlayback:self withError:0];
      }
      else
      {
        id v12 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 60);
        [v13 audioPlayerDidFinishPlayback:self withError:v12];
      }
    }
    else
    {
    }
  }
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = HFLogForCategory(0xAuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Audio Player Decode Error [%@]", (uint8_t *)&v7, 0xCu);
  }

  [(HFAudioPlayer *)self _cleanup];
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (unint64_t)playerStopSource
{
  return self->_playerStopSource;
}

- (void)setPlayerStopSource:(unint64_t)a3
{
  self->_playerStopSource = a3;
}

- (NSNumber)routeChangeReason
{
  return self->_routeChangeReason;
}

- (void)setRouteChangeReason:(id)a3
{
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionIsActive;
}

- (void)setAudioSessionIsActive:(BOOL)a3
{
  self->_audioSessionIsActive = a3;
}

- (double)playerCurrentTime
{
  return self->_playerCurrentTime;
}

- (void)setPlayerCurrentTime:(double)a3
{
  self->_playerCurrentTime = a3;
}

- (unint64_t)audioSessionOptions
{
  return self->_audioSessionOptions;
}

- (void)setAudioSessionOptions:(unint64_t)a3
{
  self->_audioSessionOptions = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (HFAudioPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFAudioPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_routeChangeReason, 0);
}

@end
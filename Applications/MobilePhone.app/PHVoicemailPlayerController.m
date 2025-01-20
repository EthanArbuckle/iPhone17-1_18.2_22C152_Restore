@interface PHVoicemailPlayerController
+ (id)sharedPlayerController;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVAsset)currentAsset;
- (AVPlayer)audioPlayer;
- (AVPlayerItem)playerItem;
- (BOOL)beginInterruption;
- (BOOL)endInterruption;
- (BOOL)interrupted;
- (BOOL)isAtEnd;
- (BOOL)isPlaying;
- (BOOL)isWaitingForProximitySensor;
- (NSObject)didEnd;
- (NSObject)didStart;
- (NSObject)timeObserver;
- (PHVoicemailPlayerController)init;
- (id)_createAVPlayer;
- (int64_t)status;
- (void)_pause;
- (void)_play;
- (void)_proximityStateChanged:(id)a3;
- (void)beginInterruption;
- (void)currentAssetDurationWithBlock:(id)a3;
- (void)dealloc;
- (void)endInterruption;
- (void)handleAudioSessionRouteChangeNotification:(id)a3;
- (void)loadAudio:(id)a3 withObserverForInterval:(id *)a4 usingBlock:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)resetAudioPlayer;
- (void)seekToTime:(id *)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setDidEnd:(id)a3;
- (void)setDidStart:(id)a3;
- (void)setDuration:(id *)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setIsWaitingForProximitySensor:(BOOL)a3;
- (void)setPlayerItem:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimeObserver:(id)a3;
- (void)updateProximityMonitoring;
@end

@implementation PHVoicemailPlayerController

+ (id)sharedPlayerController
{
  if (sharedPlayerController_onceToken != -1) {
    dispatch_once(&sharedPlayerController_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)sharedPlayerController__sharedPlayerController;

  return v2;
}

void __53__PHVoicemailPlayerController_sharedPlayerController__block_invoke(id a1)
{
  v1 = objc_alloc_init(PHVoicemailPlayerController);
  uint64_t v2 = sharedPlayerController__sharedPlayerController;
  sharedPlayerController__sharedPlayerController = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (PHVoicemailPlayerController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PHVoicemailPlayerController;
  uint64_t v2 = [(PHVoicemailPlayerController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"handleAudioSessionRouteChangeNotification:" name:AVAudioSessionRouteChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(PHVoicemailPlayerController *)self resetAudioPlayer];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHVoicemailPlayerController;
  [(PHVoicemailPlayerController *)&v4 dealloc];
}

- (void)resetAudioPlayer
{
  [(AVPlayer *)self->_audioPlayer removeObserver:self forKeyPath:@"rate"];
  [(AVPlayer *)self->_audioPlayer removeObserver:self forKeyPath:@"status"];
  v3 = [(PHVoicemailPlayerController *)self didStart];

  if (v3)
  {
    audioPlayer = self->_audioPlayer;
    objc_super v5 = [(PHVoicemailPlayerController *)self didStart];
    [(AVPlayer *)audioPlayer removeTimeObserver:v5];

    [(PHVoicemailPlayerController *)self setDidStart:0];
  }
  v6 = [(PHVoicemailPlayerController *)self didEnd];

  if (v6)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    v8 = [(PHVoicemailPlayerController *)self didEnd];
    [v7 removeObserver:v8];

    [(PHVoicemailPlayerController *)self setDidEnd:0];
  }
  v9 = [(PHVoicemailPlayerController *)self timeObserver];

  if (v9)
  {
    v10 = self->_audioPlayer;
    v11 = [(PHVoicemailPlayerController *)self timeObserver];
    [(AVPlayer *)v10 removeTimeObserver:v11];

    [(PHVoicemailPlayerController *)self setTimeObserver:0];
  }
  [(PHVoicemailPlayerController *)self endInterruption];
  [(PHVoicemailPlayerController *)self setInterrupted:0];
  [(PHVoicemailPlayerController *)self setAudioPlayer:0];
  [(PHVoicemailPlayerController *)self setPlayerItem:0];
  self->_status = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  if ([a4 isEqual:self->_audioPlayer])
  {
    if ([v8 isEqualToString:@"status"])
    {
      AVPlayerStatus v9 = [(AVPlayer *)self->_audioPlayer status];
      if (v9 == AVPlayerStatusUnknown) {
        goto LABEL_21;
      }
      if (v9 != AVPlayerStatusFailed)
      {
        if (v9 == AVPlayerStatusReadyToPlay)
        {
          self->_status = 1;
LABEL_22:
          v10 = +[NSNotificationCenter defaultCenter];
          v11 = v10;
          CFStringRef v12 = @"kPHVoicemailPlayerControllerStatusChangedNotification";
          goto LABEL_23;
        }
        v18 = PHDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          AVPlayerStatus v19 = [(AVPlayer *)self->_audioPlayer status];
          int v20 = 134217984;
          AVPlayerStatus v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] PHVoicemailPlayerController encountered an AVPlayerStatus that is not known: %ld. Setting status to unknown.", (uint8_t *)&v20, 0xCu);
        }

LABEL_21:
        self->_status = 0;
        goto LABEL_22;
      }
      v13 = [(AVPlayer *)self->_audioPlayer error];
      v14 = PHDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PHVoicemailPlayerController observeValueForKeyPath:ofObject:change:context:]();
      }

      v15 = [v13 domain];
      if ([v15 isEqualToString:AVFoundationErrorDomain])
      {
        id v16 = [v13 code];

        if (v16 != (id)-11819)
        {
LABEL_17:

          goto LABEL_22;
        }
        v17 = PHDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "mediaserverd has crashed, resetting the player and notifying clients", (uint8_t *)&v20, 2u);
        }

        [(PHVoicemailPlayerController *)self resetAudioPlayer];
        self->_status = 2;
        v15 = +[NSNotificationCenter defaultCenter];
        [v15 postNotificationName:@"PHVoicemailPlayerControllerMediaServicesResetNotification" object:0];
      }

      goto LABEL_17;
    }
    if ([v8 isEqualToString:@"rate"])
    {
      [(PHVoicemailPlayerController *)self updateProximityMonitoring];
      v10 = +[NSNotificationCenter defaultCenter];
      v11 = v10;
      CFStringRef v12 = @"kPHVoicemailPlayerControllerRateChangedNotification";
LABEL_23:
      [v10 postNotificationName:v12 object:0];
    }
  }
}

- (BOOL)isPlaying
{
  v3 = [(PHVoicemailPlayerController *)self audioPlayer];
  [v3 rate];
  if (v4 == 1.0)
  {
    objc_super v5 = [(PHVoicemailPlayerController *)self audioPlayer];
    BOOL v6 = [v5 status] == (id)1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)beginInterruption
{
  if (![(PHVoicemailPlayerController *)self interrupted])
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "INTERRUPT: PHVoicemailPlayerController: Begin interruption", buf, 2u);
    }

    float v4 = +[AVAudioSession sharedInstance];
    id v15 = 0;
    unsigned int v5 = [v4 setCategory:AVAudioSessionCategoryVoiceMail error:&v15];
    id v6 = v15;

    if (v5)
    {
      v7 = +[AVAudioSession sharedInstance];
      id v14 = v6;
      unsigned int v8 = [v7 setActive:1 error:&v14];
      id v9 = v14;

      v10 = PHDefaultLog();
      v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "INTERRUPT: PHVoicemailPlayerController: Successful interruption", buf, 2u);
        }
        uint64_t v12 = 1;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[PHVoicemailPlayerController beginInterruption]();
        }
        uint64_t v12 = 0;
      }
    }
    else
    {
      v11 = PHDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PHVoicemailPlayerController beginInterruption]();
      }
      uint64_t v12 = 0;
      id v9 = v6;
    }

    [(PHVoicemailPlayerController *)self setInterrupted:v12];
  }
  return [(PHVoicemailPlayerController *)self interrupted];
}

- (BOOL)endInterruption
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "INTERRUPT: PHVoicemailPlayerController: End interruption", buf, 2u);
  }

  if (![(PHVoicemailPlayerController *)self interrupted]) {
    return 0;
  }
  float v4 = +[AVAudioSession sharedInstance];
  id v9 = 0;
  unsigned __int8 v5 = [v4 setActive:0 withOptions:1 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PHVoicemailPlayerController endInterruption]();
    }
  }
  [(PHVoicemailPlayerController *)self setInterrupted:0];

  return v5;
}

- (id)_createAVPlayer
{
  id v3 = objc_alloc((Class)AVPlayer);
  float v4 = [(PHVoicemailPlayerController *)self playerItem];
  id v5 = [v3 initWithPlayerItem:v4];

  [v5 setActionAtItemEnd:1];
  [v5 addObserver:self forKeyPath:@"status" options:0 context:0];
  [v5 addObserver:self forKeyPath:@"rate" options:0 context:0];
  CMTimeMake(&v10, 1, 3);
  id v6 = +[NSValue valueWithCMTime:&v10];
  v11 = v6;
  v7 = +[NSArray arrayWithObjects:&v11 count:1];
  unsigned int v8 = [v5 addBoundaryTimeObserverForTimes:v7 queue:0 usingBlock:&__block_literal_global_66];
  [(PHVoicemailPlayerController *)self setDidStart:v8];

  return v5;
}

void __46__PHVoicemailPlayerController__createAVPlayer__block_invoke(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"kPHVoicemailPlayerControllerDidStartPlayingNotification" object:0];
}

- (void)loadAudio:(id)a3 withObserverForInterval:(id *)a4 usingBlock:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    CMTime v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PHVoicemailPlayerController: Loading voicemail asset: %@", buf, 0xCu);
    }

    v11 = +[AVPlayerItem playerItemWithAsset:v8];
    [(PHVoicemailPlayerController *)self setPlayerItem:v11];

    if (!self->_audioPlayer)
    {
      uint64_t v12 = [(PHVoicemailPlayerController *)self _createAVPlayer];
      audioPlayer = self->_audioPlayer;
      self->_audioPlayer = v12;
    }
    long long v29 = *(_OWORD *)&kCMTimeIndefinite.value;
    CMTimeEpoch epoch = kCMTimeIndefinite.epoch;
    [(PHVoicemailPlayerController *)self setDuration:&v29];
    id v14 = self->_audioPlayer;
    *(_OWORD *)buf = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch var3 = kCMTimeZero.epoch;
    [(AVPlayer *)v14 seekToTime:buf];
    id v15 = self->_audioPlayer;
    id v16 = [(PHVoicemailPlayerController *)self timeObserver];
    [(AVPlayer *)v15 removeTimeObserver:v16];

    v17 = self->_audioPlayer;
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    CMTimeEpoch var3 = a4->var3;
    v18 = [(AVPlayer *)v17 addPeriodicTimeObserverForInterval:buf queue:0 usingBlock:v9];

    [(PHVoicemailPlayerController *)self setTimeObserver:v18];
    AVPlayerStatus v19 = [(PHVoicemailPlayerController *)self didEnd];

    if (v19)
    {
      int v20 = +[NSNotificationCenter defaultCenter];
      AVPlayerStatus v21 = [(PHVoicemailPlayerController *)self didEnd];
      [v20 removeObserver:v21];

      [(PHVoicemailPlayerController *)self setDidEnd:0];
    }
    v22 = +[NSNotificationCenter defaultCenter];
    v23 = [(PHVoicemailPlayerController *)self playerItem];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __76__PHVoicemailPlayerController_loadAudio_withObserverForInterval_usingBlock___block_invoke;
    v28[3] = &unk_10027DE88;
    v28[4] = self;
    v24 = [v22 addObserverForName:AVPlayerItemDidPlayToEndTimeNotification object:v23 queue:0 usingBlock:v28];
    [(PHVoicemailPlayerController *)self setDidEnd:v24];

    self->_status = 1;
    v25 = PHDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      [(PHVoicemailPlayerController *)self duration];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "PHVoicemailPlayerController: duration: %lld", buf, 0xCu);
    }

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 postNotificationName:@"kPHVoicemailPlayerControllerStatusChangedNotification" object:0];
  }
}

id __76__PHVoicemailPlayerController_loadAudio_withObserverForInterval_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"kPHVoicemailPlayerControllerDidPlayToEndNotification" object:0];

  [*(id *)(a1 + 32) updateProximityMonitoring];
  id v3 = *(void **)(a1 + 32);

  return [v3 endInterruption];
}

- (void)play
{
  id v3 = [(PHVoicemailPlayerController *)self playerItem];

  if (v3)
  {
    if (![(PHVoicemailPlayerController *)self interrupted]) {
      [(PHVoicemailPlayerController *)self beginInterruption];
    }
    float v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHVoicemailPlayerController: Starting voicemail playback", v15, 2u);
    }

    id v5 = [(AVPlayer *)self->_audioPlayer currentItem];
    id v6 = [(PHVoicemailPlayerController *)self playerItem];
    unsigned __int8 v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      audioPlayer = self->_audioPlayer;
      id v9 = [(PHVoicemailPlayerController *)self playerItem];
      [(AVPlayer *)audioPlayer replaceCurrentItemWithPlayerItem:v9];
    }
    CMTime v10 = +[PHAudioDeviceController sharedAudioDeviceController];
    unsigned int v11 = [v10 receiverRouteIsPicked];

    if (v11)
    {
      [(PHVoicemailPlayerController *)self setIsWaitingForProximitySensor:1];
      uint64_t v12 = +[UIDevice currentDevice];
      [v12 setProximityMonitoringEnabled:1];

      [(PHVoicemailPlayerController *)self performSelector:"_play" withObject:0 afterDelay:2.0];
      v13 = +[NSNotificationCenter defaultCenter];
      [v13 removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:0];

      id v14 = +[NSNotificationCenter defaultCenter];
      [v14 addObserver:self selector:"_proximityStateChanged:" name:UIDeviceProximityStateDidChangeNotification object:0];
    }
    else
    {
      [(PHVoicemailPlayerController *)self _play];
    }
  }
}

- (void)_play
{
  [(PHVoicemailPlayerController *)self setIsWaitingForProximitySensor:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:0];

  audioPlayer = self->_audioPlayer;

  [(AVPlayer *)audioPlayer play];
}

- (void)pause
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHVoicemailPlayerController: Pausing voicemail playback", buf, 2u);
  }

  if (+[NSThread isMainThread])
  {
    [(PHVoicemailPlayerController *)self _pause];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __36__PHVoicemailPlayerController_pause__block_invoke;
    block[3] = &unk_10027C670;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id __36__PHVoicemailPlayerController_pause__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pause];
}

- (void)_pause
{
  [(PHVoicemailPlayerController *)self setIsWaitingForProximitySensor:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:0];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_play" object:0];
  audioPlayer = self->_audioPlayer;

  [(AVPlayer *)audioPlayer pause];
}

- (void)seekToTime:(id *)a3
{
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
    CFStringRef v6 = CMTimeCopyDescription(0, (CMTime *)&v9);
    CFTypeRef v7 = CFAutorelease(v6);
    LODWORD(v9.var0) = 138412290;
    *(int64_t *)((char *)&v9.var0 + 4) = (int64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHVoicemailPlayerController: Seeking to time: %@", (uint8_t *)&v9, 0xCu);
  }

  audioPlayer = self->_audioPlayer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  [(AVPlayer *)audioPlayer seekToTime:&v9];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_audioPlayer;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result currentTime];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->CMTimeEpoch var3 = 0;
  return result;
}

- (BOOL)isAtEnd
{
  [(PHVoicemailPlayerController *)self currentTime];
  [(PHVoicemailPlayerController *)self currentTime];
  [(PHVoicemailPlayerController *)self duration];
  [(PHVoicemailPlayerController *)self duration];
  return v7 / v6 >= v5 / v4;
}

- (void)currentAssetDurationWithBlock:(id)a3
{
  id v4 = a3;
  [(PHVoicemailPlayerController *)self duration];
  if ((v10[60] & 1) != 0 && ([(PHVoicemailPlayerController *)self duration], (v10[36] & 0x10) != 0))
  {
    [(PHVoicemailPlayerController *)self currentAsset];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __61__PHVoicemailPlayerController_currentAssetDurationWithBlock___block_invoke;
    v6[3] = &unk_10027CFB8;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = self;
    id v9 = v4;
    id v5 = v7;
    [v5 loadValuesAsynchronouslyForKeys:&off_10028CD28 completionHandler:v6];
  }
  else
  {
    [(PHVoicemailPlayerController *)self duration];
    (*((void (**)(id, unsigned char *))v4 + 2))(v4, v10);
  }
}

void __61__PHVoicemailPlayerController_currentAssetDurationWithBlock___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v14 = 0;
  id v3 = [v2 statusOfValueForKey:@"duration" error:&v14];
  id v4 = v14;
  if (v3 == (id)2)
  {
    id v5 = (void *)a1[4];
    if (v5)
    {
      [v5 duration];
    }
    else
    {
      long long v12 = 0uLL;
      uint64_t v13 = 0;
    }
    int v6 = (void *)a1[5];
    long long v10 = v12;
    uint64_t v11 = v13;
    [v6 setDuration:&v10];
    id v7 = (void *)a1[5];
    uint64_t v8 = a1[6];
    if (v7) {
      [v7 duration];
    }
    else {
      memset(v9, 0, sizeof(v9));
    }
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

- (AVAsset)currentAsset
{
  uint64_t v2 = [(PHVoicemailPlayerController *)self playerItem];
  id v3 = [v2 asset];

  return (AVAsset *)v3;
}

- (void)handleAudioSessionRouteChangeNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUDispatchMainIfNecessary();
}

void __73__PHVoicemailPlayerController_handleAudioSessionRouteChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  if (v2)
  {
    id v4 = v2;
    id v3 = [v2 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (char *)[v3 unsignedIntegerValue] - 1 <= (char *)3) {
      [*(id *)(a1 + 40) updateProximityMonitoring];
    }

    uint64_t v2 = v4;
  }
}

- (void)updateProximityMonitoring
{
  id v3 = +[PHAudioDeviceController sharedAudioDeviceController];
  if ([v3 receiverRouteIsPicked])
  {
    unsigned int v4 = [(PHVoicemailPlayerController *)self isPlaying];

    if (v4)
    {
      id v5 = +[UIDevice currentDevice];
      id v7 = v5;
      uint64_t v6 = 1;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v5 = +[UIDevice currentDevice];
  id v7 = v5;
  uint64_t v6 = 0;
LABEL_6:
  [v5 setProximityMonitoringEnabled:v6];
}

- (void)_proximityStateChanged:(id)a3
{
  unsigned int v4 = +[UIDevice currentDevice];
  unsigned int v5 = [v4 proximityState];

  if (v5)
  {
    [(PHVoicemailPlayerController *)self _play];
  }
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)isWaitingForProximitySensor
{
  return self->_isWaitingForProximitySensor;
}

- (void)setIsWaitingForProximitySensor:(BOOL)a3
{
  self->_isWaitingForProximitySensor = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (NSObject)didStart
{
  return self->_didStart;
}

- (void)setDidStart:(id)a3
{
}

- (NSObject)didEnd
{
  return self->_didEnd;
}

- (void)setDidEnd:(id)a3
{
}

- (NSObject)timeObserver
{
  return self->_timeObserver;
}

- (void)setTimeObserver:(id)a3
{
}

- (AVPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_didEnd, 0);

  objc_storeStrong((id *)&self->_didStart, 0);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "PHVoicemailPlayerController encountered an error while loading: %@", v2, v3, v4, v5, v6);
}

- (void)beginInterruption
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "INTERRUPT: PHVoicemailPlayerController: Failed to set category: %@", v2, v3, v4, v5, v6);
}

- (void)endInterruption
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "INTERRUPT: PHVoicemailPlayerController: Failed to end interruption: %@", v2, v3, v4, v5, v6);
}

@end
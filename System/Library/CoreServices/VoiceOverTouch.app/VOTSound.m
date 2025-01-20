@interface VOTSound
- (BOOL)isPlaying;
- (BOOL)isVolumeSound;
- (BOOL)shouldUseAVAudioPlayer;
- (NSString)resolvedSoundPath;
- (SCRCThread)soundThread;
- (VOTSound)initWithSoundPath:(id)a3 thread:(id)a4;
- (id)action;
- (id)completionBlock;
- (id)delegate;
- (id)owner;
- (id)soundPath;
- (void)__updateAudioSessionProperties;
- (void)_cancelHelperFired:(unint64_t)a3;
- (void)_finishedPlaying;
- (void)_hearingAidRouteChange:(id)a3;
- (void)_sendFinishPlayingNotificationsWithCompletionBlock:(id)a3 delegate:(id)a4;
- (void)_updateAudioSessionProperties;
- (void)_updatePlayerWithAudioFile:(BOOL)a3;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)dealloc;
- (void)play;
- (void)playAvoidingSSS;
- (void)playAvoidingSSS:(BOOL)a3;
- (void)resetSoundForLostMediaSession;
- (void)setAction:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setIsVolumeSound:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setResolvedSoundPath:(id)a3;
- (void)setSoundThread:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation VOTSound

- (VOTSound)initWithSoundPath:(id)a3 thread:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)VOTSound;
  v9 = [(VOTSound *)&v34 init];
  v10 = v9;
  v11 = 0;
  if (v7)
  {
    if (v9)
    {
      [(VOTSound *)v9 setSoundThread:v8];
      objc_storeStrong((id *)&v10->_soundPath, a3);
      v12 = (SCRCTargetSelectorTimer *)[objc_alloc((Class)SCRCTargetSelectorTimer) initWithTarget:v10 selector:0 thread:v8];
      cancelHelperTimer = v10->_cancelHelperTimer;
      v10->_cancelHelperTimer = v12;

      dispatch_queue_t v14 = dispatch_queue_create("com.apple.accessibility.VOTSound.hearingAidStreamSerialQueue", 0);
      hearingAidStreamSerialQueue = v10->_hearingAidStreamSerialQueue;
      v10->_hearingAidStreamSerialQueue = (OS_dispatch_queue *)v14;

      v11 = 0;
      if (([v7 isEqualToString:@"KeyboardClick"] & 1) == 0)
      {
        v16 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v17 = [v16 resourcePath];

        id v18 = objc_allocWithZone((Class)NSURL);
        v29 = (void *)v17;
        v19 = +[NSString stringWithFormat:@"%@/%@", v17, v7];
        CFURLRef v20 = (const __CFURL *)[v18 initFileURLWithPath:v19 isDirectory:0];

        CFURLRef v28 = v20;
        OSStatus SystemSoundID = AudioServicesCreateSystemSoundID(v20, &v10->_soundID);
        v21 = +[NSNotificationCenter defaultCenter];
        v22 = +[AVAudioSession sharedInstance];
        [v21 addObserver:v10 selector:"_updateAudioSessionProperties" name:AVAudioSessionRouteChangeNotification object:v22];

        v23 = +[NSNotificationCenter defaultCenter];
        v24 = +[AVAudioSession sharedInstance];
        [v23 addObserver:v10 selector:"_updateAudioSessionProperties" name:AVAudioSessionInterruptionNotification object:v24];

        v25 = +[NSNotificationCenter defaultCenter];
        [v25 addObserver:v10 selector:"_hearingAidRouteChange:" name:AXHearingAidAudioRoutesChangedNotification object:0];

        [(VOTSound *)v10 _hearingAidRouteChange:0];
        if (SystemSoundID)
        {
          v11 = 0;
          v10->_soundID = 0;
        }
        else
        {
          objc_storeStrong((id *)&v10->_soundPath, a3);
          v10->_completionBlockLock._os_unfair_lock_opaque = 0;
          v10->_volume = 1.0;
          objc_initWeak(&from, v10);
          v26 = +[AXSettings sharedInstance];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100012B34;
          v31[3] = &unk_1001B35A8;
          objc_copyWeak(&v32, &from);
          [v26 registerUpdateBlock:v31 forRetrieveSelector:"_audioHardwareChannelLayout" withListener:v10];

          objc_destroyWeak(&v32);
          [(VOTSound *)v10 __updateAudioSessionProperties];
          v11 = v10;
          objc_destroyWeak(&from);
        }
      }
    }
  }

  return v11;
}

- (void)_hearingAidRouteChange:(id)a3
{
  hearingAidStreamSerialQueue = self->_hearingAidStreamSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012BE8;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(hearingAidStreamSerialQueue, block);
}

- (void)resetSoundForLostMediaSession
{
  player = self->_player;
  self->_player = 0;

  v4 = VOTLogAudio();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10011BD04((uint64_t)self, v4);
  }

  [(VOTSound *)self _updateAudioSessionProperties];
}

- (BOOL)shouldUseAVAudioPlayer
{
  if (!self->_soundChannels && !self->_hearingAidStreamSelected && ![(VOTSound *)self isVolumeSound])
  {
    v10 = +[VOTWorkspace sharedWorkspace];
    LODWORD(soundChannels) = [v10 currentCallState];

    if (soundChannels == 1)
    {
      v3 = VOTLogAudio();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
      LOWORD(v15) = 0;
      v6 = "Should use AVAudioPlayer for sound. Call is active";
    }
    else
    {
      v11 = +[AXAudioHardwareManager defaultPort];
      v12 = [v11 portType];
      unsigned __int8 v13 = [v12 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

      v3 = VOTLogAudio();
      BOOL v14 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v14)
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Should not use AVAudioPlayer for sound", (uint8_t *)&v15, 2u);
        }
        LOBYTE(soundChannels) = 0;
        goto LABEL_7;
      }
      if (!v14)
      {
        LOBYTE(soundChannels) = 1;
        goto LABEL_7;
      }
      LOWORD(v15) = 0;
      v6 = "Should use AVAudioPlayer for sound. Default port is not builtin-speaker";
    }
    LOBYTE(soundChannels) = 1;
    id v7 = v3;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
  v3 = VOTLogAudio();
  LOBYTE(soundChannels) = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int64_t soundChannels = self->_soundChannels;
    BOOL hearingAidStreamSelected = self->_hearingAidStreamSelected;
    int v15 = 134218496;
    int64_t v16 = soundChannels;
    __int16 v17 = 2048;
    BOOL v18 = hearingAidStreamSelected;
    __int16 v19 = 2048;
    uint64_t v20 = [(VOTSound *)self isVolumeSound];
    v6 = "Should use AVAudioPlayer for sound. soundChannels=%ld _hearingAidStreamSelected=%ld isVolumeSound=%ld";
    LOBYTE(soundChannels) = 1;
    id v7 = v3;
    uint32_t v8 = 32;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v15, v8);
  }
LABEL_7:

  return soundChannels;
}

- (void)_updatePlayerWithAudioFile:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VOTSound *)self soundPath];
  v6 = v5;
  if (v3)
  {
    id v7 = [v5 pathExtension];
    uint32_t v8 = [v6 stringByDeletingPathExtension];
    v9 = +[NSString stringWithFormat:@"%@-mono", v8];
    uint64_t v10 = [v9 stringByAppendingPathExtension:v7];

    v6 = (void *)v10;
  }
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 resourcePath];
  unsigned __int8 v13 = [v12 stringByAppendingPathComponent:v6];

  id v14 = [objc_allocWithZone((Class)NSURL) initFileURLWithPath:v13 isDirectory:0];
  id v20 = 0;
  int v15 = (AVAudioPlayer *)[objc_alloc((Class)AVAudioPlayer) initWithContentsOfURL:v14 error:&v20];
  id v16 = v20;
  p_player = &self->_player;
  player = self->_player;
  self->_player = v15;

  [(AVAudioPlayer *)self->_player setDelegate:self];
  [(VOTSound *)self setResolvedSoundPath:v6];
  __int16 v19 = VOTLogAudio();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10011BD80((uint64_t)v6, (id *)p_player);
  }
}

- (void)__updateAudioSessionProperties
{
  BOOL v3 = +[AXAudioHardwareManager sharedManager];
  v4 = +[AXAudioHardwareManager defaultRouteDescription];
  v5 = [v3 savedChannelsForOutput:v4 forSource:2];

  v6 = VOTLogAudio();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543362;
    v14[0] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Updating sound properties with new channels: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  id v7 = VOTLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10011BE10((uint64_t)self, v7);
  }

  id soundChannels = self->_soundChannels;
  if (soundChannels != [v5 count] || !self->_player) {
    -[VOTSound _updatePlayerWithAudioFile:](self, "_updatePlayerWithAudioFile:", [v5 count] != (id)2);
  }
  self->_id soundChannels = (int64_t)[v5 count];
  id v9 = [(AVAudioPlayer *)self->_player numberOfChannels];
  uint64_t v10 = VOTLogAudio();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unsigned int v11 = [v5 count];
    int v13 = 67109376;
    LODWORD(v14[0]) = v9;
    WORD2(v14[0]) = 1024;
    *(_DWORD *)((char *)v14 + 6) = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Player channels: %d, selected channels: %d", (uint8_t *)&v13, 0xEu);
  }

  if ([v5 count] && objc_msgSend(v5, "count") == v9)
  {
    v12 = +[TTSAudioSessionChannel convertChannels:v5];
    [(AVAudioPlayer *)self->_player setChannelAssignments:v12];
  }
  else
  {
    [(AVAudioPlayer *)self->_player setChannelAssignments:0];
  }
}

- (void)_updateAudioSessionProperties
{
  id v3 = [(VOTSound *)self soundThread];
  [v3 performSelector:"__updateAudioSessionProperties" onTarget:self count:0 objects:0];
}

- (id)soundPath
{
  return self->_soundPath;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
  -[AVAudioPlayer setVolume:](self->_player, "setVolume:");
}

- (void)dealloc
{
  SystemSoundID soundID = self->_soundID;
  if (soundID) {
    AudioServicesDisposeSystemSoundID(soundID);
  }
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    self->_id completionBlock = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VOTSound;
  [(VOTSound *)&v5 dealloc];
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  id completionBlock = self->_completionBlock;
  if (completionBlock != v4)
  {
    id v9 = v4;
    if (completionBlock)
    {
      [(VOTSound *)self _finishedPlaying];
      os_unfair_lock_lock(&self->_completionBlockLock);
      id v6 = self->_completionBlock;
      self->_id completionBlock = 0;

      os_unfair_lock_unlock(&self->_completionBlockLock);
      id v4 = v9;
    }
    if (v4)
    {
      os_unfair_lock_lock(&self->_completionBlockLock);
      id v7 = [v9 copy];
      id v8 = self->_completionBlock;
      self->_id completionBlock = v7;

      os_unfair_lock_unlock(&self->_completionBlockLock);
      id v4 = v9;
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setOwner:(id)a3
{
}

- (id)owner
{
  return self->_owner;
}

- (void)setAction:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)_finishedPlaying
{
  p_completionBlockLock = &self->_completionBlockLock;
  os_unfair_lock_lock(&self->_completionBlockLock);
  id v4 = objc_retainBlock(self->_completionBlock);
  objc_super v5 = [(VOTSound *)self delegate];
  id v6 = objc_retainBlock(v4);
  id v7 = objc_getAssociatedObject(v6, &unk_1001EB6C0);

  id v8 = VOTLogAudio();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10011BE8C();
  }

  if (([v7 BOOLValue] & 1) == 0)
  {
    if (v4)
    {
      id v9 = objc_retainBlock(v4);
      objc_setAssociatedObject(v9, &unk_1001EB6C0, &__kCFBooleanTrue, (void *)1);
    }
    soundThread = self->_soundThread;
    id v11 = objc_retainBlock(v4);
    -[SCRCThread performSelector:onTarget:count:objects:](soundThread, "performSelector:onTarget:count:objects:", "_sendFinishPlayingNotificationsWithCompletionBlock:delegate:", self, 2, v11, v5);
  }
  if (![(VOTSound *)self shouldUseAVAudioPlayer]) {
    self->_isPlaying = 0;
  }
  os_unfair_lock_unlock(p_completionBlockLock);
}

- (void)_sendFinishPlayingNotificationsWithCompletionBlock:(id)a3 delegate:(id)a4
{
  if (a3) {
    (*((void (**)(id, VOTSound *))a3 + 2))(a3, self);
  }
  else {
    [a4 sound:self didFinishPlaying:1];
  }
}

- (BOOL)isPlaying
{
  if (!self->_isPlaying) {
    return 0;
  }
  if ([(AVAudioPlayer *)self->_player isPlaying]) {
    return self->_isPlaying;
  }
  [(VOTSound *)self _finishedPlaying];
  BOOL result = 0;
  self->_isPlaying = 0;
  return result;
}

- (void)_cancelHelperFired:(unint64_t)a3
{
  objc_super v5 = VOTLogAudio();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t soundPlayGeneration = self->_soundPlayGeneration;
    BOOL isPlaying = self->_isPlaying;
    int v8 = 134218496;
    unint64_t v9 = soundPlayGeneration;
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    __int16 v12 = 1024;
    BOOL v13 = isPlaying;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Cancel helper fired, %llu = %llu, playing: %d", (uint8_t *)&v8, 0x1Cu);
  }

  if (self->_soundPlayGeneration == a3 && self->_isPlaying) {
    [(VOTSound *)self _finishedPlaying];
  }
}

- (void)playAvoidingSSS:(BOOL)a3
{
  BOOL v3 = a3;
  [(SCRCTargetSelectorTimer *)self->_cancelHelperTimer cancel];
  ++self->_soundPlayGeneration;
  self->_BOOL isPlaying = 1;
  if (([(id)VOTSharedWorkspace soundMuted] & 1) != 0
    || [(id)VOTSharedWorkspace voiceOverIsIdle])
  {
    [(VOTSound *)self _finishedPlaying];
    self->_BOOL isPlaying = 0;
  }
  else
  {
    unsigned int v5 = [(VOTSound *)self shouldUseAVAudioPlayer];
    id v6 = VOTLogAudio();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if ((v5 & 1) != 0 || v3)
    {
      if (v7)
      {
        BOOL v12 = v3;
        BOOL v13 = [(VOTSound *)self soundPath];
        *(_DWORD *)buf = 134218498;
        unint64_t v20 = v5;
        __int16 v21 = 2048;
        v22 = (void *)v12;
        __int16 v23 = 2112;
        v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will play sound via AVAudioPlayer. useAVAudioPlayer=%ld avoidSSS=%ld path=%@", buf, 0x20u);
      }
      [(AVAudioPlayer *)self->_player play];
      unint64_t soundPlayGeneration = self->_soundPlayGeneration;
      cancelHelperTimer = self->_cancelHelperTimer;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100013A10;
      v16[3] = &unk_1001B35D0;
      v16[4] = self;
      v16[5] = soundPlayGeneration;
      [(SCRCTargetSelectorTimer *)cancelHelperTimer dispatchAfterDelay:v16 withBlock:0.5];
    }
    else
    {
      if (v7)
      {
        int v8 = +[NSNumber numberWithBool:0];
        unint64_t v9 = [(VOTSound *)self soundPath];
        *(_DWORD *)buf = 138412546;
        unint64_t v20 = (unint64_t)v8;
        __int16 v21 = 2112;
        v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will play sound via AudioServices. avoidSSS=%@ path=%@", buf, 0x16u);
      }
      *(_DWORD *)buf = 1;
      AudioServicesSetProperty(0x61637421u, 4u, &self->_soundID, 4u, buf);
      v18[0] = &off_1001C4FD8;
      v17[0] = kAudioServicesPlaySystemSoundOptionBehaviorKey;
      v17[1] = kAudioServicesPlaySystemSoundOptionVolumeKey;
      __int16 v10 = +[NSNumber numberWithDouble:self->_volume];
      v17[2] = kAudioServicesPlaySystemSoundOptionIgnoreRingerSwitchKey;
      v18[1] = v10;
      v18[2] = &__kCFBooleanTrue;
      unint64_t v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

      AudioServicesPlaySystemSoundWithOptions();
    }
  }
}

- (void)play
{
}

- (void)playAvoidingSSS
{
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = VOTLogAudio();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10011BFC4();
  }

  [(VOTSound *)self _finishedPlaying];
  self->_BOOL isPlaying = 0;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  [(SCRCTargetSelectorTimer *)self->_cancelHelperTimer cancel];
  id v6 = VOTLogAudio();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10011C03C(a4);
  }

  [(VOTSound *)self _finishedPlaying];
  self->_BOOL isPlaying = 0;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_BOOL isPlaying = a3;
}

- (SCRCThread)soundThread
{
  return self->_soundThread;
}

- (void)setSoundThread:(id)a3
{
}

- (BOOL)isVolumeSound
{
  return self->_isVolumeSound;
}

- (void)setIsVolumeSound:(BOOL)a3
{
  self->_isVolumeSound = a3;
}

- (NSString)resolvedSoundPath
{
  return self->_resolvedSoundPath;
}

- (void)setResolvedSoundPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedSoundPath, 0);
  objc_storeStrong((id *)&self->_soundThread, 0);
  objc_storeStrong((id *)&self->_cancelHelperTimer, 0);
  objc_storeStrong((id *)&self->_hearingAidStreamSerialQueue, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_soundPath, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_owner, 0);
  objc_storeStrong(&self->_delegate, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end
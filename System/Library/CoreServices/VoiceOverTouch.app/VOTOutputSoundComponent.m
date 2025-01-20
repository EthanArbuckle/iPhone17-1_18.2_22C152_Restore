@interface VOTOutputSoundComponent
- (VOTOutputSoundComponent)init;
- (double)_soundVolume;
- (double)outputMutedActivityLastToggleTime;
- (id)_findSound:(id)a3;
- (id)outputMutedActivityValue:(id)a3;
- (id)soundThread;
- (void)_handlePerformAction:(id)a3;
- (void)_handleSoundThreadMediaSessionDied;
- (void)_initializeThread;
- (void)_mediaSessionDied:(id)a3;
- (void)_playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5;
- (void)handleEvent:(id)a3;
- (void)playSoundFast:(id)a3 completionBlock:(id)a4;
- (void)playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5;
- (void)sound:(id)a3 didFinishPlaying:(BOOL)a4;
@end

@implementation VOTOutputSoundComponent

- (VOTOutputSoundComponent)init
{
  v11.receiver = self;
  v11.super_class = (Class)VOTOutputSoundComponent;
  v2 = [(VOTOutputComponent *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)[objc_allocWithZone((Class)NSMutableDictionary) init];
    cachedSounds = v2->_cachedSounds;
    v2->_cachedSounds = v3;

    v5 = (SCRCThread *)objc_alloc_init((Class)SCRCThread);
    soundThread = v2->_soundThread;
    v2->_soundThread = v5;

    [(SCRCThread *)v2->_soundThread performSelector:"_initializeThread" onTarget:v2 count:0 objects:0];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_mediaSessionDied:" name:AVAudioSessionMediaServicesWereLostNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_mediaSessionDied:" name:AVAudioSessionMediaServicesWereResetNotification object:0];

    v9 = v2;
  }

  return v2;
}

- (void)_initializeThread
{
  AXSetThreadPriority();
  id v2 = +[NSThread currentThread];
  [v2 setName:@"SoundThread"];
}

- (void)_mediaSessionDied:(id)a3
{
}

- (void)_handleSoundThreadMediaSessionDied
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSMutableDictionary *)self->_cachedSounds allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) resetSoundForLostMediaSession];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)handleEvent:(id)a3
{
  id v6 = a3;
  id v4 = [v6 objectForIndex:1];
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 == 6) {
    [(SCRCThread *)self->_soundThread performSelector:"_handlePerformAction:" onTarget:self count:1 objects:v6];
  }
}

- (id)_findSound:(id)a3
{
  id v4 = [a3 soundPath];
  id v5 = [(NSMutableDictionary *)self->_cachedSounds objectForKey:v4];
  if (!v5)
  {
    id v5 = [objc_allocWithZone((Class)VOTSound) initWithSoundPath:v4 thread:self->_soundThread];
    id v6 = [objc_alloc((Class)VOSDefaultSoundPack) init];
    long long v7 = +[VOSOutputEvent DidChangeVolume];
    long long v8 = [v6 soundAssetURLForOutputEvent:v7];
    long long v9 = [v8 lastPathComponent];

    long long v10 = [v4 lastPathComponent];
    LODWORD(v7) = [v10 isEqualToString:v9];

    if (v7) {
      [v5 setIsVolumeSound:1];
    }
    if (v5) {
      [(NSMutableDictionary *)self->_cachedSounds setObject:v5 forKey:v4];
    }
    else {
      [(VOTOutputSoundComponent *)self sound:0 didFinishPlaying:0];
    }
  }

  return v5;
}

- (id)soundThread
{
  return self->_soundThread;
}

- (double)_soundVolume
{
  id v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 voiceOverAdjustSoundVolumeIndependently];

  id v4 = +[AXSettings sharedInstance];
  id v5 = v4;
  if (v3)
  {
    [v4 voiceOverSoundVolume];
    double v7 = v6;
  }
  else
  {
    [v4 voiceOverEffectiveSpeakingVolume];
    double v7 = v8;
  }

  return v7;
}

- (void)_handlePerformAction:(id)a3
{
  id v4 = a3;
  id v7 = [v4 objectForIndex:14];
  id v5 = [v4 objectForIndex:13];

  double v6 = [(VOTOutputSoundComponent *)self _findSound:v7];
  [v6 setOwner:v5];
  [v6 setDelegate:self];
  [v6 play];
}

- (id)outputMutedActivityValue:(id)a3
{
  return [a3 soundMuted];
}

- (double)outputMutedActivityLastToggleTime
{
  _[(id)VOTSharedWorkspace lastSoundMuteToggleTime];
  return result;
}

- (void)playSoundFast:(id)a3 completionBlock:(id)a4
{
}

- (void)playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5
{
  soundThread = self->_soundThread;
  id v9 = a5;
  id v10 = a3;
  id v12 = [a4 copy];
  id v11 = [v9 copy];

  -[SCRCThread performSelector:onTarget:count:objects:](soundThread, "performSelector:onTarget:count:objects:", "_playSoundFast:startedBlock:completionBlock:", self, 3, v10, v12, v11);
}

- (void)_playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  id v11 = VOTLogAudio();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Sound component play: %@", buf, 0xCu);
  }

  unsigned int v12 = [(id)VOTSharedWorkspace soundEffectsEnabled];
  unsigned int v13 = [(id)VOTSharedWorkspace soundMuted];
  unsigned int v14 = [(id)VOTSharedWorkspace voiceOverIsIdle];
  unsigned int v15 = [(VOTOutputComponent *)self determineOutputMutedForActivity:v8];
  if ((v12 ^ 1 | v13 | v14 | v15) != 1)
  {
    v17 = [(VOTOutputSoundComponent *)self _findSound:v8];
    id v18 = [v8 outputActionID];
    v19 = [v17 soundPath];
    v20 = +[NSString stringWithFormat:@"%llu-%@", v18, v19];

    if ([v17 isPlaying])
    {
LABEL_22:

      goto LABEL_23;
    }
    v21 = VOTLogAudio();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v35 = v17;
      *(_WORD *)&v35[8] = 2112;
      v36 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Sound not playing, start %@, %@", buf, 0x16u);
    }

    v22 = +[VOTOutputManager outputManager];
    unsigned __int8 v23 = [v22 audioSessionActive];

    v24 = +[VOTOutputManager outputManager];
    [v24 enableAudioSession:v20];

    objc_initWeak(&location, v17);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100028010;
    v29[3] = &unk_1001B3A48;
    id v25 = v20;
    id v30 = v25;
    id v31 = v10;
    objc_copyWeak(&v32, &location);
    [v17 setCompletionBlock:v29];
    [(VOTOutputSoundComponent *)self _soundVolume];
    *(float *)&double v26 = v26;
    [v17 setVolume:v26];
    if (v23)
    {
      [v17 play];
      v27 = VOTLogAudio();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v35 = v25;
        v28 = "play with SSS: %@";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
      }
    }
    else
    {
      [v17 playAvoidingSSS];
      v27 = VOTLogAudio();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v35 = v25;
        v28 = "play no SSS: %@";
        goto LABEL_18;
      }
    }

    if (v9) {
      v9[2](v9, v17);
    }
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
    goto LABEL_22;
  }
  v16 = VOTLogAudio();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v35 = v12;
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = v13;
    LOWORD(v36) = 1024;
    *(_DWORD *)((char *)&v36 + 2) = v14;
    HIWORD(v36) = 1024;
    unsigned int v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Sound effects enabled: %d, sound muted: %d, idle: %d, activity: %d", buf, 0x1Au);
  }

  [v8 setObject:&__kCFBooleanTrue forVariant:82];
  if (v9) {
    v9[2](v9, 0);
  }
  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_23:
}

- (void)sound:(id)a3 didFinishPlaying:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  double v6 = [v11 action];
  id v7 = [v6 objectForVariant:12];
  id v8 = v7;
  if (v7) {
    [v7 sound:v11 didFinishPlaying:v4];
  }
  if (([v6 synchronization] & 2) != 0)
  {
    id v9 = [v11 owner];
    id v10 = [objc_allocWithZone((Class)AXIndexMap) init];
    [v10 setObject:v6 forIndex:11];
    [v10 setObject:v9 forIndex:13];
    [(VOTOutputComponent *)self notifyActionComplete:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundThread, 0);

  objc_storeStrong((id *)&self->_cachedSounds, 0);
}

@end
@interface FMDAccessoryAudioController
+ (id)_audioCategory;
- (BOOL)isAccessoryBeingMonitored:(id)a3;
- (BOOL)isSoundPlaying;
- (BOOL)setVolume:(float)a3 forRoute:(id)a4;
- (BOOL)wasSoundPlayed;
- (FMDAVAudioPlayer)audioPlayer;
- (FMDAVRoute)originalRoute;
- (FMDAccessoryAudioController)init;
- (FMDAccessoryAudioControllerDelegate)delegate;
- (FMDAudioAccessory)lastAccessory;
- (FMDAudioAccessory)monitoredAccessories;
- (FMDBluetoothSessionInterface)bluetoothSessionInterface;
- (NSMutableDictionary)monitoredAccessoriesCompletionBlocks;
- (OS_os_transaction)discoveryTransaction;
- (OS_os_transaction)soundTransaction;
- (OriginalSwitchesState)originalState;
- (double)fadeDuration;
- (double)rampDownDuration;
- (double)rampUpDuration;
- (float)panTargetValue;
- (float)setMaxVolumeForRoute:(id)a3;
- (float)volumeTargetValue;
- (id)pickRoute:(id)a3;
- (id)pickedRoute;
- (id)routeForAccessoryIdentifier:(id)a3;
- (id)setupAudioSession;
- (int)bypassAllListeningModesForAccessory:(id)a3;
- (void)fade;
- (void)pickableRoutesChangedNotification:(id)a3;
- (void)playSound:(id)a3 channels:(id)a4;
- (void)restoreListeningMode:(int)a3 forAccessory:(id)a4;
- (void)routeChanged:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setBluetoothSessionInterface:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryTransaction:(id)a3;
- (void)setFadeDuration:(double)a3;
- (void)setIsSoundPlaying:(BOOL)a3;
- (void)setLastAccessory:(id)a3;
- (void)setMonitoredAccessories:(id)a3;
- (void)setMonitoredAccessoriesCompletionBlocks:(id)a3;
- (void)setOriginalRoute:(id)a3;
- (void)setOriginalState:(id)a3;
- (void)setPanForChannels:(id)a3;
- (void)setPanTargetValue:(float)a3;
- (void)setRampDownDuration:(double)a3;
- (void)setRampUpDuration:(double)a3;
- (void)setSoundTransaction:(id)a3;
- (void)setVolumeTargetValue:(float)a3;
- (void)setWasSoundPlayed:(BOOL)a3;
- (void)startMonitoringRoutableAccessory:(id)a3 completion:(id)a4;
- (void)startPlayingSoundForAccessory:(id)a3 channels:(id)a4 completion:(id)a5;
- (void)stopMonitoringRoutableAccessory:(id)a3 completion:(id)a4;
- (void)stopPlayingForAccessory:(id)a3 completion:(id)a4;
- (void)stopSound;
@end

@implementation FMDAccessoryAudioController

- (FMDAccessoryAudioController)init
{
  v15.receiver = self;
  v15.super_class = (Class)FMDAccessoryAudioController;
  v2 = [(FMDAccessoryAudioController *)&v15 init];
  v3 = sub_10000CD44();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: init", v14, 2u);
  }

  if (v2)
  {
    v4 = objc_opt_new();
    [(FMDAccessoryAudioController *)v2 setBluetoothSessionInterface:v4];

    v5 = [(FMDAccessoryAudioController *)v2 bluetoothSessionInterface];
    [v5 startSession];

    id v6 = objc_alloc_init((Class)NSMutableArray);
    [(FMDAccessoryAudioController *)v2 setMonitoredAccessories:v6];

    v7 = objc_opt_new();
    [(FMDAccessoryAudioController *)v2 setMonitoredAccessoriesCompletionBlocks:v7];

    v8 = +[AVSystemController sharedAVSystemController];
    v16[0] = AVSystemController_ActiveAudioRouteDidChangeNotification;
    v16[1] = AVSystemController_PickableRoutesDidChangeNotification;
    v9 = +[NSArray arrayWithObjects:v16 count:2];
    [v8 setAttribute:v9 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"routeChanged:" name:AVSystemController_ActiveAudioRouteDidChangeNotification object:v8];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"pickableRoutesChangedNotification:" name:AVSystemController_PickableRoutesDidChangeNotification object:v8];

    v12 = +[FMDAVRouteControllerFactory routeController];
    [v12 initializeNotifications];
  }
  return v2;
}

- (void)startPlayingSoundForAccessory:(id)a3 channels:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  [@"PlaySoundTransaction" UTF8String];
  v11 = (void *)os_transaction_create();
  [(FMDAccessoryAudioController *)self setSoundTransaction:v11];

  if ([(FMDAccessoryAudioController *)self isSoundPlaying])
  {
    v12 = [v8 audioRoutingIdentifier];
    v13 = [(FMDAccessoryAudioController *)self lastAccessory];
    v14 = [v13 audioRoutingIdentifier];
    unsigned int v15 = [v12 isEqualToString:v14];

    if (v15)
    {
      v16 = sub_10000CD44();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Sound already playing updating pan", buf, 2u);
      }

      [(FMDAccessoryAudioController *)self setPanForChannels:v9];
      if (v10) {
        v10[2](v10, 0);
      }
    }
    else
    {
      id v19 = objc_alloc((Class)NSError);
      uint64_t v20 = kFMDAccessoryPlaySoundErrorDomain;
      NSErrorUserInfoKey v40 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v41 = @"FMDAccessoryAudioController only one sound can play at the time, stop sound before playing";
      v21 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v22 = [v19 initWithDomain:v20 code:1 userInfo:v21];

      if (v10) {
        ((void (**)(id, id))v10)[2](v10, v22);
      }
    }
  }
  else
  {
    [(FMDAccessoryAudioController *)self setLastAccessory:v8];
    uint64_t v17 = [(FMDAccessoryAudioController *)self setupAudioSession];
    if (v17)
    {
      v18 = (void *)v17;
      v10[2](v10, v17);
    }
    else
    {
      v23 = [v8 audioRoutingIdentifier];
      v24 = [(FMDAccessoryAudioController *)self routeForAccessoryIdentifier:v23];

      v18 = [(FMDAccessoryAudioController *)self pickRoute:v24];
      v25 = sub_10000CD44();
      v26 = v25;
      if (v18)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100010DD8();
        }

        ((void (**)(id, void *))v10)[2](v10, v18);
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          double v43 = *(double *)&v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController accessory currently picked route = %@", buf, 0xCu);
        }

        [(FMDAccessoryAudioController *)self setMaxVolumeForRoute:v24];
        int v28 = v27;
        uint64_t v29 = [(FMDAccessoryAudioController *)self bypassAllListeningModesForAccessory:v8];
        [(FMDAccessoryAudioController *)self setOriginalRoute:v24];
        v30 = [(FMDAccessoryAudioController *)self originalState];

        if (!v30)
        {
          v31 = objc_opt_new();
          LODWORD(v32) = v28;
          [v31 setVolume:v32];
          [v31 setListeningMode:v29];
          [(FMDAccessoryAudioController *)self setOriginalState:v31];
        }
        v33 = sub_10000CD44();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [(FMDAccessoryAudioController *)self originalState];
          [v34 volume];
          double v36 = v35;
          v37 = [(FMDAccessoryAudioController *)self originalState];
          unsigned int v38 = [v37 listeningMode];
          *(_DWORD *)buf = 134218240;
          double v43 = v36;
          __int16 v44 = 1024;
          unsigned int v45 = v38;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Original state - volume: %f listeningMode: %u", buf, 0x12u);
        }
        v10[2](v10, 0);
        v39 = [v8 audioURL];
        [(FMDAccessoryAudioController *)self playSound:v39 channels:v9];
      }
    }
  }
}

- (void)stopPlayingForAccessory:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if ([(FMDAccessoryAudioController *)self isSoundPlaying])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A040;
    v6[3] = &unk_10001D1B0;
    v6[4] = self;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
  else if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

- (void)playSound:(id)a3 channels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000CD44();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Play sound for channels %@", buf, 0xCu);
  }

  id v9 = v6;
  id v29 = 0;
  v10 = +[FMDAudioPlayerFactory initWithContentsOfURL:v9 error:&v29];
  id v11 = v29;
  [(FMDAccessoryAudioController *)self setAudioPlayer:v10];

  if (v11)
  {
    v12 = sub_10000CD44();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error reading the sound URL %@ falling back to default %@", buf, 0x16u);
    }

    v13 = +[NSBundle mainBundle];
    v14 = [v13 pathForResource:@"accessory_locateSound" ofType:@"wav"];
    unsigned int v15 = +[NSURL fileURLWithPath:v14];
    id v28 = v11;
    v16 = +[FMDAudioPlayerFactory initWithContentsOfURL:v15 error:&v28];
    id v17 = v28;

    [(FMDAccessoryAudioController *)self setAudioPlayer:v16];
  }
  else
  {
    id v17 = 0;
  }
  v18 = [(FMDAccessoryAudioController *)self audioPlayer];
  [v18 setNumberOfLoops:-1];

  [(FMDAccessoryAudioController *)self setPanForChannels:v7];
  id v19 = [(FMDAccessoryAudioController *)self audioPlayer];
  [v19 prepareToPlay];

  [(FMDAccessoryAudioController *)self setIsSoundPlaying:1];
  [(FMDAccessoryAudioController *)self setWasSoundPlayed:1];
  LODWORD(v20) = 1.0;
  [(FMDAccessoryAudioController *)self setVolumeTargetValue:v20];
  [(FMDAccessoryAudioController *)self rampUpDuration];
  -[FMDAccessoryAudioController setFadeDuration:](self, "setFadeDuration:");
  [(FMDAccessoryAudioController *)self rampUpDuration];
  if (v21 <= 0.0)
  {
    [(FMDAccessoryAudioController *)self volumeTargetValue];
    int v24 = v23;
    v25 = [(FMDAccessoryAudioController *)self audioPlayer];
    LODWORD(v26) = v24;
    [v25 setVolume:v26];
  }
  else
  {
    id v22 = [(FMDAccessoryAudioController *)self audioPlayer];
    [v22 setVolume:0.0];

    [(FMDAccessoryAudioController *)self fade];
  }
  int v27 = [(FMDAccessoryAudioController *)self audioPlayer];
  [v27 play];
}

- (void)stopSound
{
  v3 = sub_10000CD44();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping sound", (uint8_t *)&v26, 2u);
  }

  if ([(FMDAccessoryAudioController *)self wasSoundPlayed])
  {
    v4 = [(FMDAccessoryAudioController *)self originalState];

    if (v4)
    {
      [(FMDAccessoryAudioController *)self setWasSoundPlayed:0];
      id v5 = [(FMDAccessoryAudioController *)self originalState];
      [v5 volume];
      int v7 = v6;
      id v8 = [(FMDAccessoryAudioController *)self originalRoute];
      LODWORD(v9) = v7;
      [(FMDAccessoryAudioController *)self setVolume:v8 forRoute:v9];

      v10 = [(FMDAccessoryAudioController *)self originalState];
      id v11 = [v10 listeningMode];
      v12 = [(FMDAccessoryAudioController *)self lastAccessory];
      [(FMDAccessoryAudioController *)self restoreListeningMode:v11 forAccessory:v12];

      v13 = sub_10000CD44();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(FMDAccessoryAudioController *)self originalState];
        [v14 volume];
        int v26 = 134217984;
        double v27 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AccessoryAudioController volume set back to original %f", (uint8_t *)&v26, 0xCu);
      }
      v16 = [(FMDAccessoryAudioController *)self audioPlayer];
      [v16 stop];

      [(FMDAccessoryAudioController *)self setAudioPlayer:0];
      [(FMDAccessoryAudioController *)self setSoundTransaction:0];
      [(FMDAccessoryAudioController *)self setOriginalState:0];
      [(FMDAccessoryAudioController *)self setOriginalRoute:0];
      id v17 = [(FMDAccessoryAudioController *)self delegate];
      [v17 soundDidStop];

      if (qword_1000276A8)
      {
        v18 = sub_10000CD44();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Stopping fade timer", (uint8_t *)&v26, 2u);
        }

        dispatch_source_cancel((dispatch_source_t)qword_1000276A8);
        id v19 = (void *)qword_1000276A8;
        qword_1000276A8 = 0;
      }
      double v20 = [(FMDAccessoryAudioController *)self lastAccessory];
      [(FMDAccessoryAudioController *)self setLastAccessory:0];
      if ([v20 conformsToProtocol:&OBJC_PROTOCOL___FMDAccessory])
      {
        id v21 = v20;
        id v22 = +[FMDFMIPManager sharedInstance];
        int v23 = [v21 accessoryIdentifier];

        int v24 = [v23 stringValue];
        [v22 soundStoppedForAccessoryIdentifier:v24];
      }
      v25 = +[AVAudioSession sharedInstance];
      [v25 setActive:0 withOptions:1 error:0];
    }
  }
}

- (void)setPanForChannels:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 isEqualToString:@"left"]) {
          unsigned int v11 = -1;
        }
        else {
          unsigned int v11 = [v10 isEqualToString:@"right"];
        }
        v7 += v11;
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }
  v12 = sub_10000CD44();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [(FMDAccessoryAudioController *)self isSoundPlaying];
    *(_DWORD *)buf = 67109634;
    unsigned int v22 = v13;
    __int16 v23 = 1024;
    int v24 = v7;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Audio Player pan %i %i %@", buf, 0x18u);
  }

  *(float *)&double v14 = (float)v7;
  [(FMDAccessoryAudioController *)self setPanTargetValue:v14];
  if ([(FMDAccessoryAudioController *)self isSoundPlaying])
  {
    [(FMDAccessoryAudioController *)self fade];
  }
  else
  {
    float v15 = [(FMDAccessoryAudioController *)self audioPlayer];
    *(float *)&double v16 = (float)v7;
    [v15 setPan:v16];
  }
}

- (id)routeForAccessoryIdentifier:(id)a3
{
  id v21 = a3;
  v3 = +[FMDAVRouteControllerFactory routeController];
  id v4 = +[FMDAccessoryAudioController _audioCategory];
  id v5 = [v3 pickableRoutesForCategory:v4];

  id v6 = sub_10000CD44();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = +[FMDAccessoryAudioController _audioCategory];
    *(_DWORD *)buf = 138412546;
    id v28 = v7;
    __int16 v29 = 2112;
    v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Category %@ Pickables routes %@", buf, 0x16u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    unsigned int v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = [v14 routeID];
        if (v15)
        {
          double v16 = (void *)v15;
          long long v17 = [v14 routeID];
          id v18 = [v17 rangeOfString:v21];

          if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v19 = v14;

            unsigned int v11 = v19;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  else
  {
    unsigned int v11 = 0;
  }

  return v11;
}

- (id)pickedRoute
{
  v2 = +[FMDAVRouteControllerFactory routeController];
  v3 = +[FMDAccessoryAudioController _audioCategory];
  id v4 = [v2 pickableRoutesForCategory:v3];

  id v5 = sub_10000CD44();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Pickables routes %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "currentlyPicked", (void)v15))
        {
          id v13 = v12;

          id v9 = v13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)pickRoute:(id)a3
{
  id v3 = a3;
  id v4 = +[FMDAVRouteControllerFactory routeController];
  unsigned __int8 v5 = [v4 setPickedRoute:v3];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = sub_10000CD44();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100010E44();
    }

    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = kFMDAccessoryPlaySoundErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v13 = @"FMDAccessoryAudioController cannot route audio to accessory. Aborting";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v6 = [v8 initWithDomain:v9 code:0 userInfo:v10];
  }

  return v6;
}

- (id)setupAudioSession
{
  v2 = sub_10000CD44();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: Setting up audio session", buf, 2u);
  }

  id v3 = +[AVAudioSession sharedInstance];
  id v19 = 0;
  [v3 setCategory:AVAudioSessionCategoryFindMyDevice error:&v19];
  id v4 = v19;
  if (v4)
  {
    unsigned __int8 v5 = v4;
    id v6 = sub_10000CD44();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: couldn't set session's audio category %@", buf, 0xCu);
    }

    id v7 = 0;
LABEL_7:

    goto LABEL_8;
  }
  id v18 = 0;
  [v3 setPreferredIOBufferDuration:&v18 error:0.005];
  uint64_t v9 = v18;
  if (v9)
  {
    uint64_t v10 = v9;
    unsigned int v11 = sub_10000CD44();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: couldn't set session's I/O buffer duration %@", buf, 0xCu);
    }
  }
  id v17 = 0;
  [v3 setPreferredSampleRate:&v17 error:44100.0];
  NSErrorUserInfoKey v12 = v17;
  if (v12)
  {
    CFStringRef v13 = v12;
    double v14 = sub_10000CD44();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: couldn't set session's preferred sample rate %@", buf, 0xCu);
    }
  }
  long long v15 = +[AVAudioSession sharedInstance];
  id v16 = 0;
  [v15 setActive:1 error:&v16];
  id v7 = v16;

  if (v7)
  {
    unsigned __int8 v5 = sub_10000CD44();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController: couldn't set session active, %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (BOOL)setVolume:(float)a3 forRoute:(id)a4
{
  id v5 = a4;
  id v6 = +[FMDAVRouteControllerFactory routeController];
  id v7 = +[FMDAccessoryAudioController _audioCategory];
  *(float *)&double v8 = a3;
  unsigned __int8 v9 = [v6 setVolume:v7 forCategory:v5 route:v8];

  return v9;
}

- (float)setMaxVolumeForRoute:(id)a3
{
  id v4 = a3;
  float v18 = 0.0;
  id v5 = +[FMDAVRouteControllerFactory routeController];
  id v6 = +[FMDAccessoryAudioController _audioCategory];
  unsigned __int8 v7 = [v5 getVolume:&v18 forCategory:v6 route:v4];

  double v8 = sub_10000CD44();
  unsigned __int8 v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v4 routeID];
      *(_DWORD *)buf = 138412546;
      long long v20 = v10;
      __int16 v21 = 2048;
      double v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AccessoryAudioController %@ original volume %f", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100010F3C(v4, v9);
  }

  LODWORD(v11) = 1.0;
  unsigned __int8 v12 = [(FMDAccessoryAudioController *)self setVolume:v4 forRoute:v11];
  CFStringRef v13 = sub_10000CD44();
  double v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v4 routeID];
      *(_DWORD *)buf = 138412290;
      long long v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AccessoryAudioController %@ new volume 1.0f", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_100010EB0(v4, v14);
  }

  float v16 = v18;
  return v16;
}

- (void)fade
{
  id v3 = [(FMDAccessoryAudioController *)self audioPlayer];

  if (v3)
  {
    [(FMDAccessoryAudioController *)self fadeDuration];
    double v5 = 1.0 / (v4 * 15.0);
    id v6 = [(FMDAccessoryAudioController *)self audioPlayer];
    [v6 volume];
    float v8 = v7;
    [(FMDAccessoryAudioController *)self volumeTargetValue];
    double v10 = vabds_f32(v8, v9);

    BOOL v11 = v5 < v10;
    if (v5 < v10)
    {
      unsigned __int8 v12 = [(FMDAccessoryAudioController *)self audioPlayer];
      [v12 volume];
      float v14 = v13;
      [(FMDAccessoryAudioController *)self volumeTargetValue];
      float v16 = v15;

      id v17 = [(FMDAccessoryAudioController *)self audioPlayer];
      [v17 volume];
      float v19 = v18;
      float v20 = v5;
      __int16 v21 = [(FMDAccessoryAudioController *)self audioPlayer];
      double v22 = v21;
      *(float *)&double v23 = -v20;
      if (v14 <= v16) {
        *(float *)&double v23 = v5;
      }
      *(float *)&double v23 = v19 + *(float *)&v23;
      [v21 setVolume:v23];

      long long v24 = sub_10000CD44();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_10001115C(self, v24, v5);
      }
    }
    else
    {
      [(FMDAccessoryAudioController *)self volumeTargetValue];
      int v26 = v25;
      double v27 = [(FMDAccessoryAudioController *)self audioPlayer];
      LODWORD(v28) = v26;
      [v27 setVolume:v28];

      __int16 v29 = sub_10000CD44();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_100011234(self);
      }

      id v31 = [(FMDAccessoryAudioController *)self audioPlayer];
      [v31 volume];
      float v33 = v32;

      if (v33 == 0.0) {
        [(FMDAccessoryAudioController *)self stopSound];
      }
    }
    v34 = [(FMDAccessoryAudioController *)self audioPlayer];
    [v34 pan];
    float v36 = v35;
    [(FMDAccessoryAudioController *)self panTargetValue];
    double v38 = vabds_f32(v36, v37);

    if (v38 <= 0.0266666667)
    {
      [(FMDAccessoryAudioController *)self panTargetValue];
      int v51 = v50;
      v52 = [(FMDAccessoryAudioController *)self audioPlayer];
      LODWORD(v53) = v51;
      [v52 setPan:v53];

      v49 = sub_10000CD44();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        sub_1000110B4(self);
      }
    }
    else
    {
      v39 = [(FMDAccessoryAudioController *)self audioPlayer];
      [v39 pan];
      float v41 = v40;
      [(FMDAccessoryAudioController *)self panTargetValue];
      BOOL v43 = v41 > v42;

      __int16 v44 = [(FMDAccessoryAudioController *)self audioPlayer];
      [v44 pan];
      float v46 = v45;
      v47 = [(FMDAccessoryAudioController *)self audioPlayer];
      *(float *)&double v48 = v46 + flt_10001A0B0[v43];
      [v47 setPan:v48];

      v49 = sub_10000CD44();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        sub_10001100C(self);
      }
      BOOL v11 = 1;
    }

    uint64_t v54 = qword_1000276A8;
    if (v11 && qword_1000276A8 == 0)
    {
      v56 = sub_10000CD44();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
        sub_100010FC8(v56);
      }

      objc_initWeak(location, self);
      dispatch_source_t v57 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, (dispatch_queue_t)&_dispatch_main_q);
      v58 = (void *)qword_1000276A8;
      qword_1000276A8 = (uint64_t)v57;

      v59 = qword_1000276A8;
      dispatch_time_t v60 = dispatch_time(0, 0);
      dispatch_source_set_timer(v59, v60, 0x3F940AEuLL, 0);
      v61 = qword_1000276A8;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000B82C;
      handler[3] = &unk_10001CF60;
      objc_copyWeak(&v66, location);
      dispatch_source_set_event_handler(v61, handler);
      dispatch_resume((dispatch_object_t)qword_1000276A8);
      objc_destroyWeak(&v66);
      objc_destroyWeak(location);
      uint64_t v54 = qword_1000276A8;
    }
    if (v54) {
      char v62 = v11;
    }
    else {
      char v62 = 1;
    }
    if ((v62 & 1) == 0)
    {
      v63 = sub_10000CD44();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Stopping fade timer", (uint8_t *)location, 2u);
      }

      dispatch_source_cancel((dispatch_source_t)qword_1000276A8);
      v64 = (void *)qword_1000276A8;
      qword_1000276A8 = 0;
    }
  }
}

- (void)startMonitoringRoutableAccessory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  float v7 = (void (**)(id, id))a4;
  if ([(FMDAccessoryAudioController *)self isAccessoryBeingMonitored:v6])
  {
    if (v7)
    {
      id v8 = objc_alloc((Class)NSError);
      uint64_t v9 = kFMDAccessoryPlaySoundErrorDomain;
      NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v19 = @"FMDAccessoryAudioController is already monitoring that accessory";
      double v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v11 = [v8 initWithDomain:v9 code:2 userInfo:v10];
      v7[2](v7, v11);
    }
  }
  else
  {
    unsigned __int8 v12 = [v6 audioRoutingIdentifier];
    float v13 = [(FMDAccessoryAudioController *)self routeForAccessoryIdentifier:v12];

    if (v13)
    {
      if (v7) {
        v7[2](v7, 0);
      }
    }
    else
    {
      float v14 = [(FMDAccessoryAudioController *)self monitoredAccessoriesCompletionBlocks];
      float v15 = objc_retainBlock(v7);
      float v16 = [v6 audioRoutingIdentifier];
      [v14 setObject:v15 forKey:v16];

      id v17 = [(FMDAccessoryAudioController *)self monitoredAccessories];
      [v17 addObject:v6];
    }
  }
}

- (void)stopMonitoringRoutableAccessory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  float v7 = (void (**)(id, id))a4;
  id v8 = sub_10000CD44();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController stopMonitoringRoutableAccessory %@", buf, 0xCu);
  }

  if ([(FMDAccessoryAudioController *)self isAccessoryBeingMonitored:v6])
  {
    int v26 = v7;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [(FMDAccessoryAudioController *)self monitoredAccessories];
    id v10 = [v9 copy];

    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          float v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          float v16 = [v15 audioRoutingIdentifier];
          id v17 = [v6 audioRoutingIdentifier];
          unsigned int v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            double v23 = [(FMDAccessoryAudioController *)self monitoredAccessories];
            [v23 removeObject:v15];

            long long v24 = [(FMDAccessoryAudioController *)self monitoredAccessoriesCompletionBlocks];
            int v25 = [v15 audioRoutingIdentifier];
            [v24 removeObjectForKey:v25];

            goto LABEL_16;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    float v7 = v26;
    if (v26) {
      v26[2](v26, 0);
    }
  }
  else if (v7)
  {
    id v19 = objc_alloc((Class)NSError);
    uint64_t v20 = kFMDAccessoryPlaySoundErrorDomain;
    NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v33 = @"FMDAccessoryAudioController is not monitoring that accessory";
    __int16 v21 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v22 = [v19 initWithDomain:v20 code:3 userInfo:v21];
    v7[2](v7, v22);
  }
}

- (void)routeChanged:(id)a3
{
  double v4 = [(FMDAccessoryAudioController *)self pickedRoute];
  double v5 = sub_10000CD44();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Route changed notification current route: %@", buf, 0xCu);
  }

  id v6 = [(FMDAccessoryAudioController *)self lastAccessory];
  float v7 = [v6 audioRoutingIdentifier];

  if (v7)
  {
    uint64_t v8 = [v4 routeID];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v10 = [v4 routeID];
      id v11 = [v10 rangeOfString:v7];

      if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([(FMDAccessoryAudioController *)self isSoundPlaying]) {
          goto LABEL_11;
        }
        float v15 = [(FMDAccessoryAudioController *)self monitoredAccessoriesCompletionBlocks];
        float v16 = [v15 objectForKey:v7];

        id v17 = [(FMDAccessoryAudioController *)self lastAccessory];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10000BFAC;
        v18[3] = &unk_10001D1D8;
        id v19 = v16;
        id v14 = v16;
        [(FMDAccessoryAudioController *)self stopMonitoringRoutableAccessory:v17 completion:v18];

        goto LABEL_10;
      }
    }
  }
  if ([(FMDAccessoryAudioController *)self isSoundPlaying])
  {
    id v12 = sub_10000CD44();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(FMDAccessoryAudioController *)self lastAccessory];
      *(_DWORD *)buf = 138412290;
      __int16 v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Stopping sound for accessory %@", buf, 0xCu);
    }
    [(FMDAccessoryAudioController *)self setRampDownDuration:0.0];
    id v14 = [(FMDAccessoryAudioController *)self lastAccessory];
    [(FMDAccessoryAudioController *)self stopPlayingForAccessory:v14 completion:0];
LABEL_10:
  }
LABEL_11:
}

- (void)pickableRoutesChangedNotification:(id)a3
{
  double v4 = sub_10000CD44();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController pickableRoutesChangedNotification", buf, 2u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(FMDAccessoryAudioController *)self monitoredAccessories];
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v10 = [v9 audioRoutingIdentifier];
        id v11 = [(FMDAccessoryAudioController *)self routeForAccessoryIdentifier:v10];

        if (v11)
        {
          id v12 = [(FMDAccessoryAudioController *)self monitoredAccessoriesCompletionBlocks];
          uint64_t v13 = [v9 audioRoutingIdentifier];
          id v14 = [v12 objectForKey:v13];

          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10000C3D0;
          v27[3] = &unk_10001D1D8;
          id v28 = v14;
          id v15 = v14;
          [(FMDAccessoryAudioController *)self stopMonitoringRoutableAccessory:v9 completion:v27];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v6);
  }

  float v16 = [(FMDAccessoryAudioController *)self pickedRoute];
  id v17 = [(FMDAccessoryAudioController *)self lastAccessory];
  unsigned int v18 = [v17 audioRoutingIdentifier];

  if (!v18) {
    goto LABEL_22;
  }
  uint64_t v19 = [v16 routeID];
  if (!v19
    || (uint64_t v20 = (void *)v19,
        [v16 routeID],
        __int16 v21 = objc_claimAutoreleasedReturnValue(),
        id v22 = [v21 rangeOfString:v18],
        v21,
        v20,
        v22 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_22:
    if ([(FMDAccessoryAudioController *)self isSoundPlaying])
    {
      double v23 = sub_10000CD44();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        long long v24 = [(FMDAccessoryAudioController *)self lastAccessory];
        *(_DWORD *)buf = 138412290;
        v34 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Stopping sound for accessory %@", buf, 0xCu);
      }
      [(FMDAccessoryAudioController *)self setRampDownDuration:0.0];
      int v25 = [(FMDAccessoryAudioController *)self lastAccessory];
      [(FMDAccessoryAudioController *)self stopPlayingForAccessory:v25 completion:0];
    }
  }
}

- (BOOL)isAccessoryBeingMonitored:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(FMDAccessoryAudioController *)self monitoredAccessories];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) audioRoutingIdentifier];
        id v10 = [v4 audioRoutingIdentifier];
        unsigned __int8 v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (id)_audioCategory
{
  v2 = sub_10000CD44();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    CFStringRef v5 = @"FindMyAudioDevice";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Audio Category %@", (uint8_t *)&v4, 0xCu);
  }

  return @"FindMyAudioDevice";
}

- (int)bypassAllListeningModesForAccessory:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v4 supportsChangingListeningMode])
  {
    int v6 = 0;
  }
  else
  {
    CFStringRef v5 = [(FMDAccessoryAudioController *)self bluetoothSessionInterface];
    int v6 = [v5 listeningModeForAccessory:v4 timeout:1.0];

    if (v6 != 1)
    {
      uint64_t v7 = [(FMDAccessoryAudioController *)self bluetoothSessionInterface];
      [v7 updateListeningMode:1 accessory:v4];
    }
  }

  return v6;
}

- (void)restoreListeningMode:(int)a3 forAccessory:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v6 supportsChangingListeningMode])
  {
    uint64_t v7 = sub_10000CD44();
    uint64_t v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109378;
        v9[1] = v4;
        __int16 v10 = 2112;
        id v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController restoring listening mode %u for accessory %@", (uint8_t *)v9, 0x12u);
      }

      uint64_t v8 = [(FMDAccessoryAudioController *)self bluetoothSessionInterface];
      [v8 updateListeningMode:v4 accessory:v6];
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_100011320((uint64_t)v6, v8);
    }
  }
}

- (FMDAccessoryAudioControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDAccessoryAudioControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)rampUpDuration
{
  return self->_rampUpDuration;
}

- (void)setRampUpDuration:(double)a3
{
  self->_rampUpDuration = a3;
}

- (double)rampDownDuration
{
  return self->_rampDownDuration;
}

- (void)setRampDownDuration:(double)a3
{
  self->_rampDownDuration = a3;
}

- (BOOL)isSoundPlaying
{
  return self->_isSoundPlaying;
}

- (void)setIsSoundPlaying:(BOOL)a3
{
  self->_isSoundPlaying = a3;
}

- (FMDAVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (OS_os_transaction)soundTransaction
{
  return self->_soundTransaction;
}

- (void)setSoundTransaction:(id)a3
{
}

- (OS_os_transaction)discoveryTransaction
{
  return self->_discoveryTransaction;
}

- (void)setDiscoveryTransaction:(id)a3
{
}

- (OriginalSwitchesState)originalState
{
  return self->_originalState;
}

- (void)setOriginalState:(id)a3
{
}

- (FMDAVRoute)originalRoute
{
  return self->_originalRoute;
}

- (void)setOriginalRoute:(id)a3
{
}

- (FMDAudioAccessory)lastAccessory
{
  return self->_lastAccessory;
}

- (void)setLastAccessory:(id)a3
{
}

- (FMDAudioAccessory)monitoredAccessories
{
  return self->_monitoredAccessories;
}

- (void)setMonitoredAccessories:(id)a3
{
}

- (NSMutableDictionary)monitoredAccessoriesCompletionBlocks
{
  return self->_monitoredAccessoriesCompletionBlocks;
}

- (void)setMonitoredAccessoriesCompletionBlocks:(id)a3
{
}

- (BOOL)wasSoundPlayed
{
  return self->_wasSoundPlayed;
}

- (void)setWasSoundPlayed:(BOOL)a3
{
  self->_wasSoundPlayed = a3;
}

- (float)panTargetValue
{
  return self->_panTargetValue;
}

- (void)setPanTargetValue:(float)a3
{
  self->_panTargetValue = a3;
}

- (float)volumeTargetValue
{
  return self->_volumeTargetValue;
}

- (void)setVolumeTargetValue:(float)a3
{
  self->_volumeTargetValue = a3;
}

- (double)fadeDuration
{
  return self->_fadeDuration;
}

- (void)setFadeDuration:(double)a3
{
  self->_fadeDuration = a3;
}

- (FMDBluetoothSessionInterface)bluetoothSessionInterface
{
  return self->_bluetoothSessionInterface;
}

- (void)setBluetoothSessionInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothSessionInterface, 0);
  objc_storeStrong((id *)&self->_monitoredAccessoriesCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_monitoredAccessories, 0);
  objc_storeStrong((id *)&self->_lastAccessory, 0);
  objc_storeStrong((id *)&self->_originalRoute, 0);
  objc_storeStrong((id *)&self->_originalState, 0);
  objc_storeStrong((id *)&self->_discoveryTransaction, 0);
  objc_storeStrong((id *)&self->_soundTransaction, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
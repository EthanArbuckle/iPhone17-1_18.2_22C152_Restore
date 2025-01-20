@interface ADTTSMutingObserver
+ (id)sharedInstance;
- (ADTTSMutingObserver)init;
- (BOOL)_currentRouteIsHandsFree;
- (void)_cleanupAudioRouteOnMainThread;
- (void)_listenForAudioRouteChanges;
- (void)_listenForMuteStateChanges;
- (void)_muteStateChanged:(id)a3;
- (void)_notifyObservers:(BOOL)a3;
- (void)_stopListeningForAudioRouteChanges;
- (void)_stopListeningForMuteStateChanges;
- (void)_updateAudioRouteOnMainThread;
- (void)_useDeviceSpeakerForTTSPreferenceChanged;
- (void)addHandsFreeStateObserver:(id)a3;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)dealloc;
- (void)removeHandsFreeStateObserver:(id)a3;
@end

@implementation ADTTSMutingObserver

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4
{
  id v5 = a4;
  v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ADTTSMutingObserver audioSessionController:didReceiveAudioSessionOwnerResetNotification:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Audio owner reset %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FA06C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4
{
  id v5 = a4;
  v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ADTTSMutingObserver audioSessionController:didReceiveAudioSessionOwnerLostNotification:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Audio owner lost %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FA2D8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ADTTSMutingObserver audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Audio route changed %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FA444;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removeHandsFreeStateObserver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001FA524;
  v4[3] = &unk_10050E160;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)addHandsFreeStateObserver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001FA640;
  v4[3] = &unk_10050E160;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_useDeviceSpeakerForTTSPreferenceChanged
{
  AFBackedUpPreferencesSynchronize();
  id v3 = +[AFPreferences sharedPreferences];
  id v4 = [v3 useDeviceSpeakerForTTS];

  if (v4 != self->_useDeviceSpeakerForTTSPreference)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      v7 = "-[ADTTSMutingObserver _useDeviceSpeakerForTTSPreferenceChanged]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Use device speaker for TTS preference changed!", (uint8_t *)&v6, 0xCu);
    }
    self->_useDeviceSpeakerForTTSPreference = (int64_t)v4;
    if (v4 == (id)1) {
      [(ADTTSMutingObserver *)self _listenForMuteStateChanges];
    }
    else {
      [(ADTTSMutingObserver *)self _stopListeningForMuteStateChanges];
    }
    [(ADTTSMutingObserver *)self _notifyObservers:sub_1001FA0B4()];
  }
}

- (void)_stopListeningForMuteStateChanges
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADTTSMutingObserver _stopListeningForMuteStateChanges]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Stopping listening for mute state changes", (uint8_t *)&v5, 0xCu);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"ADMuteModeDidChangeNotification" object:0];
}

- (void)_listenForMuteStateChanges
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[ADTTSMutingObserver _listenForMuteStateChanges]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Listening for mute state changes", (uint8_t *)&v6, 0xCu);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  int v5 = +[ADSystemMuteModeObserver sharedInstance];
  [v4 addObserver:self selector:"_muteStateChanged:" name:@"ADMuteModeDidChangeNotification" object:v5];
}

- (void)_stopListeningForAudioRouteChanges
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[ADTTSMutingObserver _stopListeningForAudioRouteChanges]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Stopping listening for audio route changes", (uint8_t *)&v6, 0xCu);
  }
  id v4 = +[ADSpeechManager sharedManager];
  int v5 = [v4 audioSessionController];
  [v5 unregisterObserver:self];
}

- (void)_listenForAudioRouteChanges
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[ADTTSMutingObserver _listenForAudioRouteChanges]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Listening for audio route changes", (uint8_t *)&v6, 0xCu);
  }
  id v4 = +[ADSpeechManager sharedManager];
  int v5 = [v4 audioSessionController];
  [v5 registerObserver:self];
}

- (void)_muteStateChanged:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[ADTTSMutingObserver _muteStateChanged:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Mute state changed %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FAD58;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifyObservers:(BOOL)a3
{
  observers = self->_observers;
  id v4 = (void **)&kCFBooleanTrue;
  if (!a3) {
    id v4 = (void **)&kCFBooleanFalse;
  }
  CFBagApplyFunction(observers, (CFBagApplierFunction)sub_1001FADC8, *v4);
}

- (void)_updateAudioRouteOnMainThread
{
  id v3 = +[ADSpeechManager sharedManager];
  id v4 = [v3 audioSessionController];
  id v5 = [v4 getAudioSessionID];

  int v6 = +[AVAudioSession retrieveSessionWithID:v5];
  v7 = [v6 currentRoute];
  v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = v8;
    id v10 = [v7 outputs];
    id v11 = [v10 lastObject];
    v12 = [v11 portType];
    *(_DWORD *)buf = 136315394;
    v27 = "-[ADTTSMutingObserver _updateAudioRouteOnMainThread]";
    __int16 v28 = 2112;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Checking if route is hands free %@", buf, 0x16u);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = objc_msgSend(v7, "outputs", 0);
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v17) portType];
        unsigned int v19 = [v18 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

        if (!v19)
        {
          BOOL v20 = 1;
          goto LABEL_13;
        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 0;
LABEL_13:

  os_unfair_lock_lock(&self->_handsFreeLock);
  self->_currentRouteIsHandsFree = v20;
  os_unfair_lock_unlock(&self->_handsFreeLock);
}

- (void)_cleanupAudioRouteOnMainThread
{
  p_handsFreeLock = &self->_handsFreeLock;
  os_unfair_lock_lock(&self->_handsFreeLock);
  self->_currentRouteIsHandsFree = 0;
  os_unfair_lock_unlock(p_handsFreeLock);
}

- (BOOL)_currentRouteIsHandsFree
{
  v2 = self;
  p_handsFreeLock = &self->_handsFreeLock;
  os_unfair_lock_lock(&self->_handsFreeLock);
  LOBYTE(v2) = v2->_currentRouteIsHandsFree;
  os_unfair_lock_unlock(p_handsFreeLock);
  return (char)v2;
}

- (void)dealloc
{
  observers = self->_observers;
  if (observers) {
    CFRelease(observers);
  }
  v4.receiver = self;
  v4.super_class = (Class)ADTTSMutingObserver;
  [(ADTTSMutingObserver *)&v4 dealloc];
}

- (ADTTSMutingObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADTTSMutingObserver;
  v2 = [(ADTTSMutingObserver *)&v6 init];
  if (v2)
  {
    v2->_observers = CFBagCreateMutable(0, 0, 0);
    v2->_handsFreeLock._os_unfair_lock_opaque = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001FB1CC;
    block[3] = &unk_10050E138;
    id v5 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100585E30 != -1) {
    dispatch_once(&qword_100585E30, &stru_1005069D0);
  }
  v2 = (void *)qword_100585E28;
  return v2;
}

@end
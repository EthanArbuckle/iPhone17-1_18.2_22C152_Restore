@interface ADMediaPlaybackContextProvider
- (ADMediaPlaybackContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5;
- (BOOL)nowPlayingObserver:(id)a3 isGroupIdentifierFromMediaRemoteActiveDeviceInfoIdenticalToContext:(id)a4;
- (id)_initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5 allowInitialUpdate:(BOOL)a6;
- (void)_donateMediaPlaybackContextWithSnapshot:(id)a3 date:(id)a4;
- (void)_fetchStateForReason:(id)a3;
- (void)_handlePlaybackStateDidChangeToState:(int64_t)a3 fromState:(int64_t)a4 onDate:(id)a5 lastPlayingDate:(id)a6 completion:(id)a7;
- (void)_handleProxyGroupPlayerDidChangeFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_updateExpirationDateForMediaPlaybackSnapshotBasedOnDate:(id)a3;
- (void)_updateProximityObservationsForPlayState:(int64_t)a3 afterDelay:(double)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6;
- (void)nowPlayingObserver:(id)a3 proxyGroupPlayerStateDidChangeFrom:(BOOL)a4 to:(BOOL)a5;
- (void)nowPlayingObserverAirPlayGroupChanged:(id)a3;
- (void)nowPlayingObserverNowPlayingInfoDidChange:(id)a3;
- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
@end

@implementation ADMediaPlaybackContextProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donation, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_lastSnapshotExpirationDateRenewal, 0);
  objc_storeStrong((id *)&self->_clientStateObserver, 0);
  objc_storeStrong((id *)&self->_proximityRescanTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_destroyWeak((id *)&self->_donationService);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v8 = a4;
  v9 = (void (**)(id, id, id))a6;
  if ((AFIsATV() & 1) != 0 || AFIsHorseman()) {
    v9[2](v9, v10, v8);
  }
  else {
    v9[2](v9, 0, 0);
  }
}

- (void)_updateExpirationDateForMediaPlaybackSnapshotBasedOnDate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_lastSnapshotExpirationDateRenewal || (objc_msgSend(v4, "timeIntervalSinceDate:"), v6 > 7200.0))
  {
    v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      lastSnapshotExpirationDateRenewal = self->_lastSnapshotExpirationDateRenewal;
      int v9 = 136315394;
      id v10 = "-[ADMediaPlaybackContextProvider _updateExpirationDateForMediaPlaybackSnapshotBasedOnDate:]";
      __int16 v11 = 2112;
      v12 = lastSnapshotExpirationDateRenewal;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s #hal renewing media playback expiration (last renewed: %@)", (uint8_t *)&v9, 0x16u);
    }
    [(ADMediaPlaybackContextProvider *)self _donateMediaPlaybackContextWithSnapshot:self->_previousState date:v5];
  }
}

- (void)_updateProximityObservationsForPlayState:(int64_t)a3 afterDelay:(double)a4
{
  v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v7;
    __int16 v11 = AFMediaPlaybackStateGetName();
    *(_DWORD *)buf = 136315650;
    v14 = "-[ADMediaPlaybackContextProvider _updateProximityObservationsForPlayState:afterDelay:]";
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2048;
    double v18 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal %@, delay: %f", buf, 0x20u);
  }
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100147D24;
  v12[3] = &unk_10050D8C0;
  v12[4] = self;
  v12[5] = a3;
  dispatch_after(v8, queue, v12);
}

- (void)_handlePlaybackStateDidChangeToState:(int64_t)a3 fromState:(int64_t)a4 onDate:(id)a5 lastPlayingDate:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = mach_absolute_time();
  v16 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    log = v16;
    AFMediaPlaybackStateGetName();
    v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    v36 = AFMediaPlaybackStateGetName();
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ADMediaPlaybackContextProvider _handlePlaybackStateDidChangeToState:fromState:onDate:lastPlay"
                         "ingDate:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v83 = v35;
    *(_WORD *)v84 = 2112;
    *(void *)&v84[2] = v36;
    *(_WORD *)&v84[10] = 2112;
    *(void *)&v84[12] = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s #hal %llu toState = %@, fromState = %@, lastPlayingDate = %@", buf, 0x34u);
  }
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  int64_t v77 = a3;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  BOOL v73 = a3 != a4;
  __int16 v17 = dispatch_group_create();
  double v18 = v17;
  if (*((unsigned char *)v71 + 24) && v75[3] == 4)
  {
    dispatch_group_enter(v17);
    clientStateObserver = self->_clientStateObserver;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1001485B8;
    v64[3] = &unk_1005037F8;
    v64[4] = self;
    v66 = &v70;
    v67 = &v74;
    uint64_t v68 = v15;
    int64_t v69 = a4;
    v65 = v18;
    [(AFNotifyObserver *)clientStateObserver getStateWithCompletion:v64];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v83 = sub_10014870C;
  *(void *)v84 = sub_10014871C;
  *(void *)&v84[8] = 0;
  dispatch_group_enter(v18);
  observer = self->_observer;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100148724;
  v60[3] = &unk_100503820;
  v62 = buf;
  uint64_t v63 = v15;
  v21 = v18;
  v61 = v21;
  [(SOMediaNowPlayingObserver *)observer getNowPlayingInfoForCurrentItemWithCompletion:v60];
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_10014870C;
  v58[4] = sub_10014871C;
  id v59 = 0;
  dispatch_group_enter(v21);
  v22 = +[AFMediaRemoteDeviceInfo currentDevice];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1001488D4;
  v54[3] = &unk_100503848;
  v56 = v58;
  uint64_t v57 = v15;
  v23 = v21;
  v55 = v23;
  [v22 getGroupIdentifierWithCompletion:v54];

  v24 = self->_donation;
  id v25 = objc_alloc((Class)AFSafetyBlock);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001489DC;
  v43[3] = &unk_100503870;
  v26 = v24;
  v44 = v26;
  uint64_t v53 = v15;
  id v27 = v14;
  id v48 = v27;
  v45 = self;
  id v28 = v13;
  id v46 = v28;
  v49 = &v74;
  v50 = &v70;
  v51 = buf;
  v52 = v58;
  id v29 = v12;
  id v47 = v29;
  id v30 = [v25 initWithBlock:v43];
  objc_storeStrong((id *)&self->_donation, v30);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v32 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v78 = 136315394;
    v79 = "-[ADMediaPlaybackContextProvider _handlePlaybackStateDidChangeToState:fromState:onDate:lastPlayingDate:completion:]";
    __int16 v80 = 2048;
    uint64_t v81 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s #hal %llu Waiting for aggregation to finish...", v78, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100148E98;
  block[3] = &unk_10050D3C8;
  uint64_t v41 = v15;
  CFAbsoluteTime v42 = Current;
  id v34 = v30;
  id v39 = v34;
  v40 = self;
  dispatch_group_notify(v23, queue, block);
  if (*((unsigned char *)v71 + 24) && ((AFIsATV() & 1) != 0 || AFIsHorseman())) {
    [(ADMediaPlaybackContextProvider *)self _updateProximityObservationsForPlayState:v75[3] afterDelay:5.0];
  }

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
}

- (void)_handleProxyGroupPlayerDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4 || self->_isProxyGroupPlayer != a4)
  {
    self->_isProxyGroupPlayer = a4;
    previousState = self->_previousState;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001491F0;
    v11[3] = &unk_1005037D0;
    BOOL v12 = a4;
    id v7 = [(AFMediaPlaybackStateSnapshot *)previousState mutatedCopyWithMutator:v11];
    if (!v7)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1001491FC;
      v9[3] = &unk_1005037D0;
      BOOL v10 = a4;
      id v7 = +[AFMediaPlaybackStateSnapshot newWithBuilder:v9];
    }
    dispatch_time_t v8 = +[NSDate date];
    [(ADMediaPlaybackContextProvider *)self _donateMediaPlaybackContextWithSnapshot:v7 date:v8];
  }
}

- (void)_donateMediaPlaybackContextWithSnapshot:(id)a3 date:(id)a4
{
  double v6 = (AFMediaPlaybackStateSnapshot *)a3;
  id v7 = a4;
  dispatch_time_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315394;
    v19 = "-[ADMediaPlaybackContextProvider _donateMediaPlaybackContextWithSnapshot:date:]";
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal snapshot = %@", (uint8_t *)&v18, 0x16u);
  }
  int v9 = (NSDate *)v7;
  BOOL v10 = [(NSDate *)v9 dateByAddingTimeInterval:86400.0];
  id v11 = objc_alloc((Class)AFDeviceContextMetadata);
  id v12 = [v11 initWithType:AFDeviceContextKeyPlaybackState deliveryDate:v9 expirationDate:v10 redactedKeyPaths:0 historyConfiguration:0];
  if (AFIsATV()) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = AFIsHorseman();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  [WeakRetained donateContext:v6 withMetadata:v12 pushToRemote:v13];

  previousState = self->_previousState;
  self->_previousState = v6;
  v16 = v6;

  lastSnapshotExpirationDateRenewal = self->_lastSnapshotExpirationDateRenewal;
  self->_lastSnapshotExpirationDateRenewal = v9;
}

- (BOOL)nowPlayingObserver:(id)a3 isGroupIdentifierFromMediaRemoteActiveDeviceInfoIdenticalToContext:(id)a4
{
  id v5 = a4;
  double v6 = [(AFMediaPlaybackStateSnapshot *)self->_previousState groupIdentifier];
  id v7 = [v6 isEqualToString:v5];
  dispatch_time_t v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    BOOL v10 = v8;
    id v11 = +[NSNumber numberWithBool:v7];
    int v12 = 136315906;
    uint64_t v13 = "-[ADMediaPlaybackContextProvider nowPlayingObserver:isGroupIdentifierFromMediaRemoteActiveDeviceInfoIdenticalToContext:]";
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal groupIdentifier in _previousState: %@, from mediaRemoteActiveDeviceInfoUpdate: %@, same: %@", (uint8_t *)&v12, 0x2Au);
  }
  return (char)v7;
}

- (void)nowPlayingObserver:(id)a3 proxyGroupPlayerStateDidChangeFrom:(BOOL)a4 to:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  dispatch_time_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[ADMediaPlaybackContextProvider nowPlayingObserver:proxyGroupPlayerStateDidChangeFrom:to:]";
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal %d -> %d", buf, 0x18u);
  }
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10014960C;
  v10[3] = &unk_100505AD0;
  v10[4] = self;
  BOOL v11 = v6;
  BOOL v12 = v5;
  dispatch_async(queue, v10);
}

- (void)nowPlayingObserverAirPlayGroupChanged:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_time_t v8 = "-[ADMediaPlaybackContextProvider nowPlayingObserverAirPlayGroupChanged:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }
  observer = self->_observer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100149724;
  v6[3] = &unk_1005037B0;
  v6[4] = self;
  [(SOMediaNowPlayingObserver *)observer getPlaybackStateAndLastPlayingDateWithCompletion:v6];
}

- (void)nowPlayingObserverNowPlayingInfoDidChange:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_time_t v8 = "-[ADMediaPlaybackContextProvider nowPlayingObserverNowPlayingInfoDidChange:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }
  observer = self->_observer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100149954;
  v6[3] = &unk_1005037B0;
  v6[4] = self;
  [(SOMediaNowPlayingObserver *)observer getPlaybackStateAndLastPlayingDateWithCompletion:v6];
}

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  id v9 = a6;
  BOOL v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v18 = "-[ADMediaPlaybackContextProvider nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100149BC0;
  v13[3] = &unk_10050D3C8;
  int64_t v15 = a5;
  int64_t v16 = a4;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  dispatch_async(queue, v13);
}

- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7 = a3;
  dispatch_time_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    id v14 = "-[ADMediaPlaybackContextProvider pineBoardSystemStateObserver:pineBoardStateDidChangeFrom:to:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal", (uint8_t *)&v13, 0xCu);
  }
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      id v14 = "-[ADMediaPlaybackContextProvider pineBoardSystemStateObserver:pineBoardStateDidChangeFrom:to:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #hal setting AppleTV playstate to unspecified while sleeping", (uint8_t *)&v13, 0xCu);
    }
    id v10 = [(AFMediaPlaybackStateSnapshot *)self->_previousState playbackState];
    BOOL v11 = +[NSDate date];
    id v12 = [(AFMediaPlaybackStateSnapshot *)self->_previousState nowPlayingTimestamp];
    [(ADMediaPlaybackContextProvider *)self _handlePlaybackStateDidChangeToState:0 fromState:v10 onDate:v11 lastPlayingDate:v12 completion:0];
  }
  else if (a5 == 8 || a5 == 1)
  {
    [(ADMediaPlaybackContextProvider *)self _fetchStateForReason:@"awaking"];
  }
}

- (void)_fetchStateForReason:(id)a3
{
  id v4 = a3;
  observer = self->_observer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100149ED8;
  v9[3] = &unk_10050C2A0;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  [(SOMediaNowPlayingObserver *)observer getPlaybackStateWithCompletion:v9];
  id v7 = self->_observer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100149F74;
  v8[3] = &unk_10050B918;
  v8[4] = self;
  [(SOMediaNowPlayingObserver *)v7 getProxyGroupPlayerStateWithCompletion:v8];
}

- (id)_initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5 allowInitialUpdate:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)ADMediaPlaybackContextProvider;
  int v13 = [(ADMediaPlaybackContextProvider *)&v27 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_donationService, v10);
    if (v11)
    {
      int64_t v15 = (AFInstanceContext *)v11;
    }
    else
    {
      int64_t v15 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v14->_instanceContext;
    v14->_instanceContext = v15;

    objc_storeStrong((id *)&v14->_queue, a5);
    __int16 v17 = (SOMediaNowPlayingObserver *)[objc_alloc((Class)SOMediaNowPlayingObserver) initWithQueue:v12 instanceContext:v14->_instanceContext];
    observer = v14->_observer;
    v14->_observer = v17;

    [(SOMediaNowPlayingObserver *)v14->_observer addListener:v14];
    id v19 = objc_alloc((Class)AFNotifyObserver);
    id v20 = [objc_alloc((Class)NSString) initWithUTF8String:"com.apple.siri.client-state-changed"];
    v21 = AFNotifyGetEffectiveNotificationName();
    v22 = (AFNotifyObserver *)[v19 initWithName:v21 options:1 queue:v14->_queue delegate:0];
    clientStateObserver = v14->_clientStateObserver;
    v14->_clientStateObserver = v22;

    v24 = +[AFPineBoardSystemStateObserver defaultObserver];
    [v24 addListener:v14];

    id WeakRetained = objc_loadWeakRetained((id *)&v14->_donationService);
    [WeakRetained registerContextTransformer:v14 forType:AFDeviceContextKeyPlaybackState];

    if (v6) {
      [(ADMediaPlaybackContextProvider *)v14 _fetchStateForReason:@"init"];
    }
  }

  return v14;
}

- (ADMediaPlaybackContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5
{
  return (ADMediaPlaybackContextProvider *)[(ADMediaPlaybackContextProvider *)self _initWithDonationService:a3 instanceContext:a4 queue:a5 allowInitialUpdate:1];
}

@end
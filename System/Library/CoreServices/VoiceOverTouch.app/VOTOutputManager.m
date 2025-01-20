@interface VOTOutputManager
+ (NSArray)previousSoundsPlayed;
+ (id)outputManager;
+ (id)outputManagerIfExists;
+ (void)clearPreviousSoundsPlayed;
+ (void)initialize;
+ (void)logSoundPlayed:(id)a3;
- (AXAccessQueue)audioSessionQueue;
- (BOOL)_isHeadphoneRoute:(id)a3;
- (BOOL)_isHeadsetRoute:(id)a3;
- (BOOL)_isRouteExternalHDMIRoute:(id)a3;
- (BOOL)airTunesRouteIsAirPlaying;
- (BOOL)audioSessionActive;
- (BOOL)externalAudioRouteIsHearingAid;
- (BOOL)externalAudioRouteSelected;
- (BOOL)externalAudioRoutesAvailable;
- (BOOL)externalAudioRoutesContainHDMIRoute;
- (BOOL)isCurrentRouteConsideredExternal:(id)a3;
- (BOOL)isPaused;
- (BOOL)isRouteAirplayMirroring;
- (BOOL)isRoutePicked:(id)a3;
- (BOOL)isRouteWireless:(id)a3;
- (BOOL)isSpeaking;
- (BOOL)isSystemMuted;
- (BOOL)isWirelessRoutePicked:(id)a3;
- (BOOL)replacesCharacterAsPunctuation:(unsigned __int16)a3;
- (BOOL)selectedRouteIsHDMI;
- (NSArray)queuedRequests;
- (NSDate)dateToResumeRequests;
- (NSDate)dateToResumeSounds;
- (NSString)currentRouteName;
- (VOTOutputManager)init;
- (double)volume;
- (float)systemVolume;
- (id)airTunesRouteIsAirPlayingTestingBlock;
- (id)componentForType:(int)a3;
- (id)currentLanguageMap;
- (id)speechComponent;
- (void)_activeRouteChanged:(id)a3;
- (void)_dispatchNextQueuedRequest;
- (void)_handleProcessRequest:(id)a3;
- (void)_handleRequestFinished:(id)a3;
- (void)_holdCurrentRequest;
- (void)_notifyObserversOutputManagerDidFinishProcessingQueuedRequests;
- (void)_notifyObserversOutputManagerWillProcessNextRequest:(id)a3;
- (void)_resumeCurrentRequest;
- (void)_silenceRequestsForTimeInterval:(id)a3;
- (void)_systemVolumeDidChange:(id)a3;
- (void)_updateActiveRoutes;
- (void)_updateExternalRoutesAvailable;
- (void)_updateSoundCurtain;
- (void)addOutputManagerObserver:(id)a3;
- (void)addVOSEventFinishedHandler:(id)a3 forIdentifier:(id)a4;
- (void)addVOSEventStartedHandler:(id)a3 forIdentifier:(id)a4;
- (void)callStatusChanged;
- (void)clearAllQueues;
- (void)clearQueue;
- (void)continueSpeaking;
- (void)dealloc;
- (void)disableAudioSession:(id)a3;
- (void)disableAudioSession:(id)a3 userDelay:(double)a4;
- (void)dispatcher:(id)a3 handleEvent:(id)a4 soundPack:(id)a5 hapticPack:(id)a6;
- (void)enableAudioSession:(id)a3;
- (void)finishedOutputRequest:(id)a3;
- (void)handleEvent:(id)a3;
- (void)holdCurrentRequest;
- (void)pauseSpeakingAtBoundary:(int)a3;
- (void)playSoundFast:(id)a3;
- (void)playSoundFast:(id)a3 completionBlock:(id)a4;
- (void)playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5;
- (void)removeAllAudioSessionEnablers;
- (void)removeAllOutputManagerObservers;
- (void)removeOutputManagerObserver:(id)a3;
- (void)removeVOSEventFinishedHandler:(id)a3;
- (void)removeVOSEventStartedHandler:(id)a3;
- (void)resumeCurrentRequest;
- (void)selectAudioRoute:(BOOL)a3;
- (void)selectExternalAudioRoute;
- (void)selectLocalAudioRoute;
- (void)sendEvent:(id)a3;
- (void)setAirTunesRouteIsAirPlayingTestingBlock:(id)a3;
- (void)setCurrentRouteName:(id)a3;
- (void)setDateToResumeRequests:(id)a3;
- (void)setDateToResumeSounds:(id)a3;
- (void)setSoundCurtainEnabled:(BOOL)a3;
- (void)setSystemVolume:(float)a3;
- (void)shutdown;
- (void)silenceOutputForTimeInterval:(double)a3;
- (void)speakSimpleString:(id)a3;
- (void)speakSimpleString:(id)a3 braille:(BOOL)a4 language:(id)a5;
- (void)stopSpeakingAtBoundary:(int)a3;
- (void)stopSpeakingAtBoundary:(int)a3 allRequests:(BOOL)a4 sessionDeactivationDelay:(id)a5;
- (void)synchVolumeWithSystem;
- (void)toggleAudioSessionActive:(BOOL)a3;
- (void)toggleSystemMute;
- (void)updateAudioSessionProperties;
- (void)updateSupportedLanguageMap;
- (void)updateWithCurrentRoute;
@end

@implementation VOTOutputManager

+ (void)initialize
{
  if (qword_1001EB688 != -1) {
    dispatch_once(&qword_1001EB688, &stru_1001B3390);
  }
}

- (VOTOutputManager)init
{
  v64.receiver = self;
  v64.super_class = (Class)VOTOutputManager;
  v2 = [(VOTOutputManager *)&v64 init];
  if (v2)
  {
    v3 = (SCRCThreadKey *)[objc_alloc((Class)SCRCThreadKey) initWithObject:v2];
    threadKey = v2->_threadKey;
    v2->_threadKey = v3;

    v2->_cachedRate = 3.40282347e38;
    uint64_t v5 = objc_opt_new();
    queuedOutputRequests = v2->_queuedOutputRequests;
    v2->_queuedOutputRequests = (NSMutableArray *)v5;

    v7 = (NSMutableArray *)[objc_allocWithZone((Class)NSMutableArray) init];
    requestRunners = v2->_requestRunners;
    v2->_requestRunners = v7;

    id v9 = [objc_allocWithZone((Class)VOTOutputRequestRunner) init];
    [(NSMutableArray *)v2->_requestRunners addObject:v9];
    id v10 = [objc_allocWithZone((Class)VOTOutputRequestRunner) init];
    [(NSMutableArray *)v2->_requestRunners addObject:v10];
    v11 = (AXIndexMap *)[objc_allocWithZone((Class)AXIndexMap) init];
    components = v2->_components;
    v2->_components = v11;

    v13 = (AXAccessQueue *)objc_alloc_init((Class)AXAccessQueue);
    audioSessionQueue = v2->_audioSessionQueue;
    v2->_audioSessionQueue = v13;

    v15 = (AXAccessQueueTimer *)[objc_alloc((Class)AXAccessQueueTimer) initWithTargetAccessQueue:v2->_audioSessionQueue];
    inactivateAudioTimer = v2->_inactivateAudioTimer;
    v2->_inactivateAudioTimer = v15;

    [(AXAccessQueueTimer *)v2->_inactivateAudioTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    audioSessionUsers = v2->_audioSessionUsers;
    v2->_audioSessionUsers = v17;

    uint64_t v19 = +[NSMutableArray array];
    currentlyRunningRequests = v2->_currentlyRunningRequests;
    v2->_currentlyRunningRequests = (NSMutableArray *)v19;

    if ([(VOTOutputManager *)v2 externalAudioRouteSelected])
    {
      if (v2->_currentExternalRoutingInfo.isHeadphoneBT || v2->_currentExternalRoutingInfo.isHeadsetBT)
      {
        v21 = VOTLogAudio();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not auto-selecting external route at init because route is HeadphoneBT or HeadsetBT", buf, 2u);
        }
      }
      else
      {
        [(id)VOTSharedWorkspace setAudioDestinationRequestExternal:1];
      }
    }
    [(VOTOutputManager *)v2 updateSupportedLanguageMap];
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v2 selector:"updateSupportedLanguageMap" name:NSCurrentLocaleDidChangeNotification object:0];

    id v23 = [objc_allocWithZone((Class)VOTOutputSpeechComponent) init];
    if (v23) {
      [(AXIndexMap *)v2->_components setObject:v23 forIndex:0];
    }
    id v24 = [objc_allocWithZone((Class)VOTOutputSoundComponent) init];

    if (v24) {
      [(AXIndexMap *)v2->_components setObject:v24 forIndex:1];
    }

    id v25 = [objc_allocWithZone((Class)VOTOutputBrailleComponent) init];
    if (v25) {
      [(AXIndexMap *)v2->_components setObject:v25 forIndex:3];
    }
    dispatch_queue_t v26 = dispatch_queue_create("voiceover.avaccessqueue.output", 0);
    avAccessQueue = v2->_avAccessQueue;
    v2->_avAccessQueue = (OS_dispatch_queue *)v26;

    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v2 selector:"_voiceOverVolumeChanged:" name:kAXSVoiceOverTouchVolumeChangedNotification object:0];

    v29 = +[AXSettings sharedInstance];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10000C4AC;
    v61[3] = &unk_1001B33B8;
    v30 = v2;
    v62 = v30;
    [v29 registerUpdateBlock:v61 forRetrieveSelector:"voiceOverAdjustSoundVolumeIndependently" withListener:v30];

    v31 = +[AXSettings sharedInstance];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10000C4B8;
    v59[3] = &unk_1001B33B8;
    v32 = v30;
    v60 = v32;
    [v31 registerUpdateBlock:v59 forRetrieveSelector:"voiceOverSoundVolume" withListener:v32];

    v33 = +[AXSettings sharedInstance];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10000C4C4;
    v57[3] = &unk_1001B33B8;
    v34 = v32;
    v58 = v34;
    [v33 registerUpdateBlock:v57 forRetrieveSelector:"voiceOverSoundCurtain" withListener:v34];

    v35 = +[NSNotificationCenter defaultCenter];
    v36 = +[NSOperationQueue mainQueue];
    v52 = _NSConcreteStackBlock;
    uint64_t v53 = 3221225472;
    v54 = sub_10000C4CC;
    v55 = &unk_1001B33E0;
    v37 = v34;
    v56 = v37;
    id v38 = [v35 addObserverForName:@"VOTBrailleDisplayActiveStateChanged" object:0 queue:v36 usingBlock:&v52];

    objc_msgSend(v37, "_updateSoundCurtain", v52, v53, v54, v55);
    v39 = +[AVSystemController sharedAVSystemController];
    v65[0] = AVSystemController_SystemVolumeDidChangeNotification;
    v65[1] = AVSystemController_ActiveAudioRouteDidChangeNotification;
    v40 = +[NSArray arrayWithObjects:v65 count:2];
    [v39 setAttribute:v40 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    v41 = +[NSNotificationCenter defaultCenter];
    [v41 addObserver:v37 selector:"_systemVolumeDidChange:" name:AVSystemController_SystemVolumeDidChangeNotification object:v39];
    [v41 addObserver:v37 selector:"_activeRouteChanged:" name:AVSystemController_ActiveAudioRouteDidChangeNotification object:v39];
    [v41 addObserver:v37 selector:"_activeRouteChanged:" name:TUCallCenterCallStartedConnectingNotification object:v39];
    [v37 callStatusChanged];
    uint64_t v42 = +[NSHashTable weakObjectsHashTable];
    id v43 = v37[18];
    v37[18] = (id)v42;

    id v44 = objc_alloc_init((Class)NSLock);
    id v45 = v37[19];
    v37[19] = v44;

    v46 = objc_opt_new();
    [v46 setComponents:4];
    [v46 setHapticEngineUsesAutoShutdown:1];
    [v46 setHapticEngineAutoShutdownTimeout:15.0];
    [v46 setHapticEngineUsesHapticsOnly:1];
    id v47 = [objc_alloc((Class)AXMOutputManager) initWithConfiguration:v46];
    id v48 = v37[20];
    v37[20] = v47;

    [v37[20] enableWithCompletion:&stru_1001B3400];
    v49 = +[VOSOutputEventDispatcher sharedInstance];
    [v49 addEventHandler:v37];

    v50 = v37;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[VOSOutputEventDispatcher sharedInstance];
  [v3 removeEventHandler:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, AXSpringBoardUserChangedAudioRouteNotification, 0);
  v6.receiver = self;
  v6.super_class = (Class)VOTOutputManager;
  [(VOTOutputManager *)&v6 dealloc];
}

+ (id)outputManagerIfExists
{
  return (id)qword_1001EB670;
}

+ (id)outputManager
{
  if (qword_1001EB690 != -1) {
    dispatch_once(&qword_1001EB690, &stru_1001B3420);
  }
  v2 = (void *)qword_1001EB670;

  return v2;
}

- (NSArray)queuedRequests
{
  id v2 = [(NSMutableArray *)self->_queuedOutputRequests copy];

  return (NSArray *)v2;
}

- (void)handleEvent:(id)a3
{
  id v10 = a3;
  v4 = [v10 objectForIndex:1];
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 == 3)
  {
    [(VOTOutputManager *)self _handleRequestFinished:v10];
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_8;
    }
    objc_super v6 = [(VOTOutputManager *)self dateToResumeRequests];

    if (v6)
    {
      v7 = +[NSDate date];
      v8 = [(VOTOutputManager *)self dateToResumeRequests];
      id v9 = [v7 compare:v8];

      if (v9 == (id)-1) {
        goto LABEL_8;
      }
      [(VOTOutputManager *)self setDateToResumeRequests:0];
    }
    [(VOTOutputManager *)self _handleProcessRequest:v10];
  }
LABEL_8:
}

- (void)updateSupportedLanguageMap
{
  id v6 = [(id)VOTSharedWorkspace systemSpokenLanguage];
  v3 = +[AXLanguageManager sharedInstance];
  v4 = [v3 dialectForLanguageID:v6];
  supportedLanguageMap = self->_supportedLanguageMap;
  self->_supportedLanguageMap = v4;

  if (!self->_supportedLanguageMap) {
    _AXAssert();
  }
}

- (id)currentLanguageMap
{
  return self->_supportedLanguageMap;
}

- (void)clearQueue
{
}

- (void)clearAllQueues
{
}

- (void)_handleRequestFinished:(id)a3
{
  v4 = [a3 objectForIndex:14];
  unsigned int v5 = [v4 completionDelegate];
  [v5 outputRequestFinished:v4];

  id v6 = [v4 completionBlock];

  if (v6)
  {
    v7 = [v4 completionBlock];
    ((void (**)(void, void *))v7)[2](v7, v4);
  }
  id v8 = v4;
  AX_PERFORM_WITH_LOCK();
  id v9 = [(NSMutableArray *)self->_requestRunners firstObject];
  id v10 = [v9 currentRequest];

  if (v8 && (!v10 || v10 == v8)) {
    [(VOTOutputManager *)self _dispatchNextQueuedRequest];
  }
}

- (void)shutdown
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    v3 = VOTLogAudio();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10011B728(v3);
    }
  }
  else
  {
    self->_shutdown = 1;
  }
}

- (void)_handleProcessRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (!self->_shutdown)
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    id v6 = [v4 objectForIndex:14];
    AX_PERFORM_WITH_LOCK();
    if (*((unsigned char *)v8 + 24)) {
      [(VOTOutputManager *)self _dispatchNextQueuedRequest];
    }

    _Block_object_dispose(&v7, 8);
  }
}

- (void)_dispatchNextQueuedRequest
{
  [(NSMutableArray *)self->_requestRunners objectAtIndex:0];
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10000D140;
  uint64_t v9 = sub_10000D150;
  id v10 = 0;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  AX_PERFORM_WITH_LOCK();
  id v4 = (void *)v6[5];
  if (v4)
  {
    if ([v4 cancelRequest])
    {
      [(VOTOutputManager *)self _dispatchNextQueuedRequest];
    }
    else
    {
      AX_PERFORM_WITH_LOCK();
      [(VOTOutputManager *)self _notifyObserversOutputManagerWillProcessNextRequest:v6[5]];
      [v3 runOutputRequest:v6[5]];
    }
  }
  else
  {
    [(VOTOutputManager *)self _notifyObserversOutputManagerDidFinishProcessingQueuedRequests];
  }

  _Block_object_dispose(&v5, 8);
}

- (void)finishedOutputRequest:(id)a3
{
  id v4 = a3;
  id v6 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:3];
  id v5 = [objc_allocWithZone((Class)AXIndexMap) init];
  [v5 setObject:v6 forIndex:1];
  [v5 setObject:v4 forIndex:14];

  [(VOTOutputManager *)self performSelector:"handleEvent:" withThreadKey:self->_threadKey count:1 objects:v5];
}

- (id)componentForType:(int)a3
{
  return [(AXIndexMap *)self->_components objectForIndex:a3];
}

- (void)setSystemVolume:(float)a3
{
  id v6 = +[AVSystemController sharedAVSystemController];
  *(float *)&double v4 = a3;
  [v6 setVolumeTo:@"Audio/Video" forCategory:v4];
  double v5 = a3 * 0.8;
  *(float *)&double v5 = v5;
  [v6 setVolumeTo:AVAudioSessionCategoryVoiceCommand forCategory:v5];
}

- (float)systemVolume
{
  float v5 = 0.0;
  id v2 = +[AVSystemController sharedAVSystemController];
  [v2 getVolume:&v5 forCategory:@"Audio/Video"];
  float v3 = v5;

  return v3;
}

- (void)_systemVolumeDidChange:(id)a3
{
  double v4 = [a3 userInfo];
  float v5 = [v4 objectForKey:AVSystemController_AudioVolumeNotificationParameter];
  [v5 floatValue];
  float v7 = v6;

  float v8 = 1.0;
  if (v7 <= 1.0) {
    float v8 = v7;
  }
  float v9 = fmaxf(v8, 0.0);
  id v10 = +[VOTExternalAccessoryManager accessoryManager];
  [v10 updateVolume:v9];

  [(VOTOutputManager *)self _updateSoundCurtain];
}

- (void)_updateSoundCurtain
{
  float v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 voiceOverSoundCurtain];

  if (!v4) {
    goto LABEL_11;
  }
  if ([(id)VOTSharedWorkspace telephonyIsActive])
  {
    float v5 = VOTLogAudio();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = 0;
      float v6 = "Turning off sound curtain for active telephony";
      float v7 = (uint8_t *)&v12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  float v8 = +[VOTBrailleManager manager];
  unsigned __int8 v9 = [v8 brailleEnabled];

  if ((v9 & 1) == 0)
  {
    float v5 = VOTLogAudio();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      float v6 = "Turning off sound curtain for no braille display";
      float v7 = (uint8_t *)&v11;
      goto LABEL_9;
    }
LABEL_10:

LABEL_11:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = 1;
LABEL_12:
  -[VOTOutputManager setSoundCurtainEnabled:](self, "setSoundCurtainEnabled:", v10, v11);
}

- (void)setSoundCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = +[AVSystemController sharedAVSystemController];
  if (v3 && [(id)VOTSharedWorkspace voiceOverIsConfirmed])
  {
    float v5 = [v4 attributeForKey:AVSystemController_FullMuteAttribute];
    unsigned __int8 v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      id v11 = 0;
      [v4 setAttribute:&__kCFBooleanTrue forKey:AVSystemController_FullMuteAttribute error:&v11];
      id v7 = v11;
      if (!v7)
      {
        char v9 = 1;
        goto LABEL_13;
      }
      float v8 = VOTLogAudio();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10011B7C4();
      }
      char v9 = 1;
LABEL_12:

LABEL_13:
      byte_1001EB698 = v9;
    }
  }
  else if (byte_1001EB698 == 1)
  {
    id v10 = 0;
    [v4 setAttribute:&__kCFBooleanFalse forKey:AVSystemController_FullMuteAttribute error:&v10];
    id v7 = v10;
    float v8 = VOTLogAudio();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10011B82C();
    }
    char v9 = 0;
    goto LABEL_12;
  }
}

- (void)synchVolumeWithSystem
{
}

- (void)toggleSystemMute
{
  unsigned int v2 = [(VOTOutputManager *)self isSystemMuted];
  id v4 = +[AVSystemController sharedAVSystemController];
  BOOL v3 = +[NSNumber numberWithBool:v2 ^ 1];
  [v4 setAttribute:v3 forKey:AVSystemController_FullMuteAttribute error:0];
}

- (BOOL)isSystemMuted
{
  unsigned int v2 = +[AVSystemController sharedAVSystemController];
  BOOL v3 = [v2 attributeForKey:AVSystemController_FullMuteAttribute];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (double)volume
{
  unsigned int v2 = [(VOTOutputManager *)self speechComponent];
  [v2 volume];
  double v4 = v3;

  return v4;
}

- (id)speechComponent
{
  return [(VOTOutputManager *)self componentForType:0];
}

- (BOOL)airTunesRouteIsAirPlaying
{
  float v3 = [(VOTOutputManager *)self airTunesRouteIsAirPlayingTestingBlock];

  if (v3)
  {
    double v4 = [(VOTOutputManager *)self airTunesRouteIsAirPlayingTestingBlock];
    LOBYTE(v5) = v4[2]();
  }
  else
  {
    double v4 = +[AVSystemController sharedAVSystemController];
    unsigned __int8 v6 = [v4 attributeForKey:AVSystemController_CurrentExternalScreenAttribute];
    uint64_t v5 = [v6 isEqualToString:AVSystemController_ExternalScreenType_AirPlay];
  }
  return v5;
}

- (BOOL)_isRouteExternalHDMIRoute:(id)a3
{
  float v3 = [a3 objectForKey:AVController_RouteDescriptionKey_AVAudioRouteName];
  unsigned __int8 v4 = [v3 isEqualToString:@"HDMI"];

  return v4;
}

- (BOOL)isCurrentRouteConsideredExternal:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForKey:AVController_RouteDescriptionKey_AVAudioRouteName];
  if ([v5 isEqualToString:@"AirTunes"])
  {
    unsigned __int8 v6 = [v4 objectForKey:AVController_RouteDescriptionKey_RouteSupportsAirPlayVideo];
    unsigned int v7 = [v6 BOOLValue];

    unsigned __int8 v8 = [(VOTOutputManager *)self airTunesRouteIsAirPlaying];
    if (v7 && (v8 & 1) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    [(VOTOutputManager *)self airTunesRouteIsAirPlaying];
  }
  if (![(VOTOutputManager *)self _isRouteExternalHDMIRoute:v4]
    || (+[AXSettings sharedInstance],
        char v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 voiceOverAudioFollowsHDMIAudio],
        v9,
        (v10 & 1) == 0))
  {
    if (([v5 isEqualToString:@"BluetoothLEOutput"] & 1) == 0)
    {
      BOOL v11 = [(VOTOutputManager *)self isWirelessRoutePicked:v4];
      goto LABEL_11;
    }
  }
LABEL_9:
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)_isHeadphoneRoute:(id)a3
{
  float v3 = [a3 objectForKey:AVController_RouteDescriptionKey_AVAudioRouteName];
  unsigned __int8 v4 = [v3 isEqualToString:@"HeadphonesBT"];

  return v4;
}

- (BOOL)_isHeadsetRoute:(id)a3
{
  float v3 = [a3 objectForKey:AVController_RouteDescriptionKey_AVAudioRouteName];
  unsigned __int8 v4 = [v3 isEqualToString:@"HeadsetBT"];

  return v4;
}

- (BOOL)isRoutePicked:(id)a3
{
  uint64_t v3 = AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked;
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:v3];
  unsigned __int8 v6 = [v5 BOOLValue];

  unsigned int v7 = [v4 objectForKey:AVSystemController_RouteDescriptionKey_IsCurrentlyPickedOnPairedDevice];

  LOBYTE(v4) = [v7 BOOLValue];
  return v6 & (v4 ^ 1);
}

- (BOOL)isRouteWireless:(id)a3
{
  uint64_t v3 = [a3 objectForKey:AVController_RouteDescriptionKey_RouteType];
  unsigned __int8 v4 = [v3 isEqualToString:AVController_PickableRouteType_Wireless];

  return v4;
}

- (BOOL)isWirelessRoutePicked:(id)a3
{
  id v4 = a3;
  if ([(VOTOutputManager *)self isRouteWireless:v4]) {
    BOOL v5 = [(VOTOutputManager *)self isRoutePicked:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)callStatusChanged
{
}

- (void)_activeRouteChanged:(id)a3
{
  id v4 = +[VOTWorkspace sharedWorkspace];
  unsigned int v5 = [v4 currentCallState];

  if (v5 != 2)
  {
    avAccessQueue = self->_avAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DDC4;
    block[3] = &unk_1001B33B8;
    block[4] = self;
    dispatch_async(avAccessQueue, block);
  }
}

- (void)_updateActiveRoutes
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10000D140;
  v16 = sub_10000D150;
  id v17 = 0;
  uint64_t v3 = +[AVSystemController sharedAVSystemController];
  id v4 = [v3 pickableRoutesForCategory:AVAudioSessionCategoryVoiceOver];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000E0EC;
  v11[3] = &unk_1001B34E8;
  v11[4] = self;
  v11[5] = &v12;
  [v4 enumerateObjectsUsingBlock:v11];

  unsigned int v5 = [(id)v13[5] valueForKey:AVController_RouteDescriptionKey_AVAudioRouteName];
  if ([(VOTOutputManager *)self isCurrentRouteConsideredExternal:v13[5]])
  {
    unsigned __int8 v6 = VOTLogAudio();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v19 = (unint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Route considered external %{public}@", buf, 0xCu);
    }

    if ([(VOTOutputManager *)self _isHeadphoneRoute:v13[5]]
      || [(VOTOutputManager *)self _isHeadsetRoute:v13[5]])
    {
      unsigned int v7 = VOTLogAudio();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not auto-selecting external route because route is HeadphoneBT or HeadsetBT", buf, 2u);
      }
    }
    else
    {
      [(id)VOTSharedWorkspace setAudioDestinationRequestExternal:1];
    }
  }
  unsigned __int8 v8 = [(VOTOutputManager *)self currentRouteName];
  char v9 = VOTLogAudio();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_currentExternalRoutingInfo.state;
    *(_DWORD *)buf = 134218498;
    unint64_t v19 = state;
    __int16 v20 = 2114;
    v21 = v5;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Audio route changed %lu %{public}@-%{public}@", buf, 0x20u);
  }

  if (([v5 isEqualToString:v8] & 1) == 0)
  {
    [v5 isEqualToString:@"HDMI"];
    [(VOTOutputManager *)self updateAudioSessionProperties];
  }
  [(VOTOutputManager *)self _updateExternalRoutesAvailable];

  _Block_object_dispose(&v12, 8);
}

- (void)_updateExternalRoutesAvailable
{
  unsigned int v2 = self;
  self->_externalAudioRouteIsHearingAid = 0;
  p_externalAudioRouteIsHearingAid = &self->_externalAudioRouteIsHearingAid;
  *(_WORD *)&self->_externalRoutesAvailable = 0;
  uint64_t v3 = +[AVSystemController sharedAVSystemController];
  id v4 = [v3 pickableRoutesForCategory:@"Audio/Video"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    unsigned int v7 = &AVController_RouteDescriptionKey_AVAudioRouteName;
    CFStringRef v8 = @"AirTunes";
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v11 valueForKey:*v7];
        unsigned int v13 = [(VOTOutputManager *)v2 isCurrentRouteConsideredExternal:v11];
        if ([v12 isEqualToString:v8])
        {
          [v11 objectForKey:AVController_RouteDescriptionKey_RouteCurrentlyPicked];
          dispatch_queue_t v26 = v12;
          uint64_t v14 = v2;
          id v15 = v6;
          uint64_t v16 = v9;
          CFStringRef v17 = v8;
          unint64_t v19 = v18 = v7;
          unsigned int v20 = [v19 BOOLValue];

          unsigned int v7 = v18;
          CFStringRef v8 = v17;
          uint64_t v9 = v16;
          id v6 = v15;
          unsigned int v2 = v14;
          uint64_t v12 = v26;
          v13 &= v20;
        }
        if (![(VOTOutputManager *)v2 _isHeadphoneRoute:v11]
          && ![(VOTOutputManager *)v2 _isHeadsetRoute:v11]
          && ((v13 ^ 1) & 1) == 0)
        {
          v2->_externalRoutesAvailable = 1;
          unsigned __int8 v21 = [(VOTOutputManager *)v2 _isRouteExternalHDMIRoute:v11];
          __int16 v22 = p_externalAudioRouteIsHearingAid - 1;
          if ((v21 & 1) != 0
            || (unsigned int v23 = [v12 isEqualToString:@"BluetoothLEOutput"],
                __int16 v22 = p_externalAudioRouteIsHearingAid,
                v23))
          {
            BOOL *v22 = 1;
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }
}

- (BOOL)externalAudioRoutesAvailable
{
  return self->_externalRoutesAvailable;
}

- (BOOL)externalAudioRoutesContainHDMIRoute
{
  return self->_externalRoutesContainHDMIRoute;
}

- (BOOL)externalAudioRouteIsHearingAid
{
  return self->_externalAudioRouteIsHearingAid;
}

- (BOOL)selectedRouteIsHDMI
{
  return self->_selectedRouteIsHDMI;
}

- (BOOL)isRouteAirplayMirroring
{
  return self->_currentExternalRoutingInfo.state == 2
      && self->_currentExternalRoutingInfo.isMirroring
      && self->_currentExternalRoutingInfo.supportsAudio
      && self->_currentExternalRoutingInfo.isWireless;
}

- (BOOL)externalAudioRouteSelected
{
  unint64_t state = self->_currentExternalRoutingInfo.state;
  BOOL v3 = state == 2;
  if (!state)
  {
    self->_currentExternalRoutingInfo.unint64_t state = 1;
    id v5 = +[AVSystemController sharedAVSystemController];
    id v6 = [v5 pickableRoutesForCategory:@"Audio/Video"];

    unsigned int v7 = VOTLogAudio();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      long long v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Pickable routes for A/V category: %{public}@", buf, 0xCu);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned int v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (-[VOTOutputManager isCurrentRouteConsideredExternal:](self, "isCurrentRouteConsideredExternal:", v13, (void)v22))
          {
            uint64_t v14 = [v13 objectForKey:AVController_RouteDescriptionKey_RouteCurrentlyPicked];
            unsigned int v15 = [v14 BOOLValue];

            if (v15)
            {
              uint64_t v16 = VOTLogAudio();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                long long v28 = v13;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Found external audio routes: %{public}@", buf, 0xCu);
              }

              self->_currentExternalRoutingInfo.unint64_t state = 2;
              self->_selectedRouteIsHDMI = [(VOTOutputManager *)self _isRouteExternalHDMIRoute:v13];
              CFStringRef v17 = [v13 valueForKey:AVController_RouteDescriptionKey_RouteName];
              [(VOTOutputManager *)self setCurrentRouteName:v17];

              v18 = [v13 objectForKey:AVController_RouteDescriptionKey_RouteType];
              self->_currentExternalRoutingInfo.isWireless = [v18 isEqualToString:AVController_PickableRouteType_Wireless];

              unint64_t v19 = [v13 objectForKey:AVController_RouteDescriptionKey_RouteSupportsAirPlayAudio];
              self->_currentExternalRoutingInfo.supportsAudio = [v19 BOOLValue];

              unsigned int v20 = [v13 objectForKey:@"MirroringMode"];
              self->_currentExternalRoutingInfo.isMirroring = [v20 isEqualToString:@"MirroringMode_Default"];

              self->_currentExternalRoutingInfo.isHeadphoneBT = [(VOTOutputManager *)self _isHeadphoneRoute:v13];
              self->_currentExternalRoutingInfo.isHeadsetBT = [(VOTOutputManager *)self _isHeadsetRoute:v13];
              BOOL v3 = 1;
              goto LABEL_17;
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    [(VOTOutputManager *)self _updateExternalRoutesAvailable];
  }
  return v3;
}

- (void)selectExternalAudioRoute
{
}

- (void)selectLocalAudioRoute
{
}

- (void)selectAudioRoute:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AVSystemController sharedAVSystemController];
  id v5 = [v4 pickableRoutesForCategory:@"Audio/Video"];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    long long v30 = 0;
    id v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unsigned int v13 = [v12 valueForKey:AVController_RouteDescriptionKey_RouteType];
        uint64_t v14 = [v12 objectForKey:AVController_RouteDescriptionKey_RouteCurrentlyPicked];
        unsigned __int8 v15 = [v14 BOOLValue];

        unsigned int v16 = [(VOTOutputManager *)self isCurrentRouteConsideredExternal:v12];
        if ([v13 isEqual:AVController_PickableRouteType_Default])
        {
          id v17 = v12;
          v18 = v8;
          id v8 = v17;
        }
        if (v16)
        {
          id v19 = v12;

          long long v30 = v19;
        }
        v9 |= v15 & v16 & v3 | (v15 ^ 1 | v16 | v3) ^ 1;
      }
      id v7 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }
  else
  {
    long long v30 = 0;
    id v8 = 0;
    char v9 = 0;
  }

  unsigned int v20 = VOTLogAudio();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v36[0]) = v9 & 1;
    WORD2(v36[0]) = 2114;
    *(void *)((char *)v36 + 6) = obj;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "routes available [changing category:%d]: %{public}@", buf, 0x12u);
  }

  unsigned __int8 v21 = VOTLogAudio();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v36[0] = v8;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "default route: %{public}@", buf, 0xCu);
  }

  long long v22 = VOTLogAudio();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v36[0] = v30;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "external route: %{public}@", buf, 0xCu);
  }

  if (v9)
  {
    if (v3) {
      long long v23 = v8;
    }
    else {
      long long v23 = v30;
    }
    id v24 = v23;
    if ([(VOTOutputManager *)self isRouteWireless:v24]
      && ![(VOTOutputManager *)self isWirelessRoutePicked:v24])
    {
      long long v27 = VOTLogAudio();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v36[0] = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "skipping wireless route selection: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, AXSpringBoardUserChangedAudioRouteNotification, 0, 0, 1u);
      dispatch_queue_t v26 = VOTLogAudio();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v36[0] = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Changed category: %{public}@", buf, 0xCu);
      }

      long long v27 = [v24 valueForKey:AVController_RouteDescriptionKey_RouteName];
      [(VOTOutputManager *)self setCurrentRouteName:v27];
    }
  }
}

- (void)updateWithCurrentRoute
{
  id v4 = +[AVSystemController sharedAVSystemController];
  BOOL v3 = [v4 routeForCategory:AVAudioSessionCategoryVoiceOver];
  [(VOTOutputManager *)self setCurrentRouteName:v3];
}

- (void)updateAudioSessionProperties
{
  id v2 = [(VOTOutputManager *)self speechComponent];
  [v2 updateAudioSessionProperties:0];
}

- (void)pauseSpeakingAtBoundary:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(VOTOutputManager *)self speechComponent];
  [v4 pauseSpeakingAtBoundary:v3];
}

- (void)continueSpeaking
{
  id v2 = [(VOTOutputManager *)self speechComponent];
  [v2 continueSpeaking];
}

- (void)stopSpeakingAtBoundary:(int)a3
{
}

- (void)stopSpeakingAtBoundary:(int)a3 allRequests:(BOOL)a4 sessionDeactivationDelay:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = [(VOTOutputManager *)self speechComponent];
  [v9 stopSpeakingAtBoundary:v6 allRequests:v5 sessionDeactivationDelay:v8];
}

- (BOOL)isPaused
{
  id v2 = [(VOTOutputManager *)self speechComponent];
  unsigned __int8 v3 = [v2 isPaused];

  return v3;
}

- (BOOL)isSpeaking
{
  id v2 = [(VOTOutputManager *)self speechComponent];
  unsigned __int8 v3 = [v2 isSpeaking];

  return v3;
}

- (void)holdCurrentRequest
{
}

- (void)_holdCurrentRequest
{
  onHoldRunner = self->_onHoldRunner;
  if (onHoldRunner)
  {
    [(NSMutableArray *)self->_requestRunners insertObject:onHoldRunner atIndex:0];
    [(VOTOutputRequestRunner *)self->_onHoldRunner resume];
    id v4 = self->_onHoldRunner;
    self->_onHoldRunner = 0;
  }
  [(VOTOutputManager *)self stopSpeakingAtBoundary:1];
  BOOL v5 = [(NSMutableArray *)self->_requestRunners objectAtIndex:0];
  uint64_t v6 = self->_onHoldRunner;
  self->_onHoldRunner = v5;

  [(VOTOutputRequestRunner *)self->_onHoldRunner setOnHold:1];
  requestRunners = self->_requestRunners;

  [(NSMutableArray *)requestRunners removeObjectAtIndex:0];
}

- (void)resumeCurrentRequest
{
}

- (void)_resumeCurrentRequest
{
  onHoldRunner = self->_onHoldRunner;
  if (onHoldRunner)
  {
    [(NSMutableArray *)self->_requestRunners insertObject:onHoldRunner atIndex:0];
    [(VOTOutputRequestRunner *)self->_onHoldRunner resume];
    id v4 = self->_onHoldRunner;
    self->_onHoldRunner = 0;
  }
}

- (void)_silenceRequestsForTimeInterval:(id)a3
{
  id v4 = a3;
  id v8 = +[NSDate date];
  [v4 doubleValue];
  double v6 = v5;

  id v7 = [v8 dateByAddingTimeInterval:v6];
  [(VOTOutputManager *)self setDateToResumeRequests:v7];
}

- (void)silenceOutputForTimeInterval:(double)a3
{
  double v5 = +[NSDate date];
  double v6 = [v5 dateByAddingTimeInterval:a3];
  [(VOTOutputManager *)self setDateToResumeSounds:v6];

  threadKey = self->_threadKey;
  id v8 = +[NSNumber numberWithDouble:a3];
  [(VOTOutputManager *)self performSelector:"_silenceRequestsForTimeInterval:" withThreadKey:threadKey count:1 objects:v8];
}

- (void)toggleAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = VOTLogAudio();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Toggle audio session: %d", buf, 8u);
  }

  double v6 = +[AVAudioSession sharedInstance];
  id v12 = 0;
  unsigned int v7 = [v6 setActive:v3 withOptions:0 error:&v12];
  id v8 = v12;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    uint64_t v10 = VOTLogAudio();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10011B910();
    }
  }
  self->_audioSessionActive = v3;
  uint64_t v11 = VOTLogAudio();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10011B894();
  }
}

- (void)enableAudioSession:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    audioSessionQueue = self->_audioSessionQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000F2CC;
    v7[3] = &unk_1001B3448;
    v7[4] = self;
    id v8 = v4;
    [(AXAccessQueue *)audioSessionQueue performSynchronousWritingBlock:v7];
  }
}

- (void)removeAllAudioSessionEnablers
{
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unsigned int v16 = sub_10000D140;
  id v17 = sub_10000D150;
  id v18 = 0;
  audioSessionQueue = self->_audioSessionQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F5DC;
  v12[3] = &unk_1001B34C0;
  v12[4] = self;
  v12[5] = &v13;
  [(AXAccessQueue *)audioSessionQueue performSynchronousWritingBlock:v12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      unsigned int v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[VOTOutputManager disableAudioSession:](self, "disableAudioSession:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        unsigned int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

- (void)disableAudioSession:(id)a3
{
}

- (void)disableAudioSession:(id)a3 userDelay:(double)a4
{
  id v6 = a3;
  audioSessionQueue = self->_audioSessionQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F6D8;
  v9[3] = &unk_1001B3510;
  v9[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  [(AXAccessQueue *)audioSessionQueue performSynchronousWritingBlock:v9];
}

- (void)speakSimpleString:(id)a3
{
}

- (void)speakSimpleString:(id)a3 braille:(BOOL)a4 language:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v7 = a5;
  if ([v10 length])
  {
    id v8 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v9 = [v8 addString:v10 withLanguage:v7];
    if (v6) {
      sub_10000AB8C(v8);
    }
    [v8 send];
  }
}

+ (NSArray)previousSoundsPlayed
{
  [(id)qword_1001EB680 lock];
  id v2 = [(id)qword_1001EB678 copy];
  [(id)qword_1001EB680 unlock];

  return (NSArray *)v2;
}

+ (void)clearPreviousSoundsPlayed
{
  [(id)qword_1001EB680 lock];
  [(id)qword_1001EB678 removeAllObjects];
  id v2 = (void *)qword_1001EB680;

  [v2 unlock];
}

- (void)playSoundFast:(id)a3 completionBlock:(id)a4
{
}

- (void)playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 length])
  {
    id v17 = VOTLogAudio();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10011BAC8(v17);
    }
    goto LABEL_17;
  }
  [(id)objc_opt_class() logSoundPlayed:v8];
  if ([v8 isEqualToString:@"Sounds/WrapBoundary.aiff"]
    && _AXSAutomationEnabled())
  {
    double v11 = +[NSDistributedNotificationCenter defaultCenter];
    [v11 postNotificationName:@"VoiceOverEventOccurred" object:@"BoundaryEncountered"];
  }
  id v12 = VOTLogAudio();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10011BB0C((uint64_t)v8, v12);
  }

  if (([(id)VOTSharedWorkspace screenOn] & 1) != 0
    || ([v8 isEqualToString:@"Sounds/ScreenOff.aiff"] & 1) != 0
    || ([v8 isEqualToString:@"Sounds/LockScreenTouchIDAuthenticated.aiff"] & 1) != 0
    || [v8 isEqualToString:@"Sounds/BrailleDisplayDisconnected.aiff"])
  {
    uint64_t v13 = [(VOTOutputManager *)self dateToResumeSounds];

    if (!v13)
    {
LABEL_14:
      id v17 = [objc_allocWithZone((Class)VOTOutputAction) initWithSoundPath:v8];
      id v18 = [(id)VOTSharedWorkspace applicationForCurrentElement];
      id v19 = [v18 bundleIdentifier];
      [v17 setObject:v19 forVariant:43];

      unsigned int v20 = [(VOTOutputManager *)self componentForType:1];
      [v20 playSoundFast:v17 startedBlock:v9 completionBlock:v10];

LABEL_17:
      goto LABEL_18;
    }
    BOOL v14 = +[NSDate date];
    uint64_t v15 = [(VOTOutputManager *)self dateToResumeSounds];
    id v16 = [v14 compare:v15];

    if (v16 != (id)-1)
    {
      [(VOTOutputManager *)self setDateToResumeSounds:0];
      goto LABEL_14;
    }
  }
LABEL_18:
}

+ (void)logSoundPlayed:(id)a3
{
  id v3 = a3;
  [(id)qword_1001EB680 lock];
  if ((unint64_t)[(id)qword_1001EB678 count] >= 0xB) {
    objc_msgSend((id)qword_1001EB678, "removeObjectsInRange:", 0, (char *)objc_msgSend((id)qword_1001EB678, "count") - 10);
  }
  [(id)qword_1001EB678 addObject:v3];
  [(id)qword_1001EB680 unlock];
}

- (void)playSoundFast:(id)a3
{
}

- (BOOL)replacesCharacterAsPunctuation:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(VOTOutputManager *)self speechComponent];
  LOBYTE(v3) = [v4 replacesCharacterAsPunctuation:v3];

  return v3;
}

- (void)sendEvent:(id)a3
{
  id v6 = a3;
  if (([(id)VOTSharedWorkspace outputDisabled] & 1) == 0)
  {
    uint64_t v3 = +[VOSOutputEventDispatcher sharedInstance];
    [v3 sendEvent:v6];

    if ([v6 supportsSoundEffect])
    {
      id v4 = objc_opt_class();
      id v5 = [v6 rawValue];
      [v4 logSoundPlayed:v5];
    }
  }
}

- (void)addVOSEventFinishedHandler:(id)a3 forIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_vosEventHandlers)
  {
    id v7 = +[NSMutableDictionary dictionary];
    vosEventHandlers = self->_vosEventHandlers;
    self->_vosEventHandlers = v7;
  }
  id v9 = objc_retainBlock(v10);
  [(NSMutableDictionary *)self->_vosEventHandlers setObject:v9 forKeyedSubscript:v6];
}

- (void)addVOSEventStartedHandler:(id)a3 forIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_vosEventStartedHandlers)
  {
    id v7 = +[NSMutableDictionary dictionary];
    vosEventStartedHandlers = self->_vosEventStartedHandlers;
    self->_vosEventStartedHandlers = v7;
  }
  id v9 = objc_retainBlock(v10);
  [(NSMutableDictionary *)self->_vosEventStartedHandlers setObject:v9 forKeyedSubscript:v6];
}

- (void)removeVOSEventFinishedHandler:(id)a3
{
}

- (void)removeVOSEventStartedHandler:(id)a3
{
}

- (void)dispatcher:(id)a3 handleEvent:(id)a4 soundPack:(id)a5 hapticPack:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(id)VOTSharedWorkspace pauseSpeechAndHaptics])
  {
    BOOL v14 = VOTLogAudio();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Not dispatching event because speech and haptics is currently paused", buf, 2u);
    }
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v15 = VOTLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10011BC9C();
  }

  if ([v10 shouldPlaySoundForEvent:v11])
  {
    id v16 = [v12 soundAssetURLForOutputEvent:v11];
    id v17 = VOTLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10011BC34();
    }

    if (v16)
    {
      id v18 = [v16 lastPathComponent];
      id v19 = +[NSString stringWithFormat:@"Sounds/%@", v18];

      v24[4] = self;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100010574;
      v25[3] = &unk_1001B3560;
      v25[4] = self;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10001063C;
      v24[3] = &unk_1001B3560;
      [(VOTOutputManager *)self playSoundFast:v19 startedBlock:v25 completionBlock:v24];
    }
  }
  if ([v10 shouldPlayHapticForEvent:v11])
  {
    BOOL v14 = objc_alloc_init((Class)AXMOutputRequest);
    unsigned int v20 = [v13 hapticAssetURLForOutputEvent:v11];
    unsigned __int8 v21 = VOTLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10011BBCC();
    }

    if (v20)
    {
      long long v22 = +[AXSettings sharedInstance];
      [v22 voiceOverHapticIntensity];
      -[NSObject addHapticItemWithURL:intensity:](v14, "addHapticItemWithURL:intensity:", v20);
    }
    id v23 = [(AXMOutputManager *)self->_axmOutputManager dispatchRequest:v14];

    goto LABEL_18;
  }
LABEL_19:
}

- (void)addOutputManagerObserver:(id)a3
{
  if (a3)
  {
    outputManagerObserversLock = self->_outputManagerObserversLock;
    id v5 = a3;
    [(NSLock *)outputManagerObserversLock lock];
    [(NSHashTable *)self->_outputManagerObservers addObject:v5];

    id v6 = self->_outputManagerObserversLock;
    [(NSLock *)v6 unlock];
  }
}

- (void)removeOutputManagerObserver:(id)a3
{
  if (a3)
  {
    outputManagerObserversLock = self->_outputManagerObserversLock;
    id v5 = a3;
    [(NSLock *)outputManagerObserversLock lock];
    [(NSHashTable *)self->_outputManagerObservers removeObject:v5];

    id v6 = self->_outputManagerObserversLock;
    [(NSLock *)v6 unlock];
  }
}

- (void)removeAllOutputManagerObservers
{
  [(NSLock *)self->_outputManagerObserversLock lock];
  [(NSHashTable *)self->_outputManagerObservers removeAllObjects];
  outputManagerObserversLock = self->_outputManagerObserversLock;

  [(NSLock *)outputManagerObserversLock unlock];
}

- (void)_notifyObserversOutputManagerDidFinishProcessingQueuedRequests
{
  [(NSLock *)self->_outputManagerObserversLock lock];
  uint64_t v3 = [(NSHashTable *)self->_outputManagerObservers allObjects];
  [(NSLock *)self->_outputManagerObserversLock unlock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "outputManagerDidFinishProcessingQueuedRequests:", self, (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_notifyObserversOutputManagerWillProcessNextRequest:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_outputManagerObserversLock lock];
  id v5 = [(NSHashTable *)self->_outputManagerObservers allObjects];
  [(NSLock *)self->_outputManagerObserversLock unlock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "outputManager:willProcessNextRequest:", self, v4, (void)v11);
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (AXAccessQueue)audioSessionQueue
{
  return self->_audioSessionQueue;
}

- (id)airTunesRouteIsAirPlayingTestingBlock
{
  return self->_airTunesRouteIsAirPlayingTestingBlock;
}

- (void)setAirTunesRouteIsAirPlayingTestingBlock:(id)a3
{
}

- (NSDate)dateToResumeRequests
{
  return self->_dateToResumeRequests;
}

- (void)setDateToResumeRequests:(id)a3
{
}

- (NSDate)dateToResumeSounds
{
  return self->_dateToResumeSounds;
}

- (void)setDateToResumeSounds:(id)a3
{
}

- (NSString)currentRouteName
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setCurrentRouteName:(id)a3
{
}

- (BOOL)audioSessionActive
{
  return self->_audioSessionActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRouteName, 0);
  objc_storeStrong((id *)&self->_dateToResumeSounds, 0);
  objc_storeStrong((id *)&self->_dateToResumeRequests, 0);
  objc_storeStrong(&self->_airTunesRouteIsAirPlayingTestingBlock, 0);
  objc_storeStrong((id *)&self->_avAccessQueue, 0);
  objc_storeStrong((id *)&self->_vosEventStartedHandlers, 0);
  objc_storeStrong((id *)&self->_vosEventHandlers, 0);
  objc_storeStrong((id *)&self->_axmOutputManager, 0);
  objc_storeStrong((id *)&self->_outputManagerObserversLock, 0);
  objc_storeStrong((id *)&self->_outputManagerObservers, 0);
  objc_storeStrong((id *)&self->_threadKey, 0);
  objc_storeStrong((id *)&self->_audioSessionUsers, 0);
  objc_storeStrong((id *)&self->_audioSessionQueue, 0);
  objc_storeStrong((id *)&self->_inactivateAudioTimer, 0);
  objc_storeStrong((id *)&self->_supportedLanguageMap, 0);
  objc_storeStrong((id *)&self->_onHoldRunner, 0);
  objc_storeStrong((id *)&self->_currentlyRunningRequests, 0);
  objc_storeStrong((id *)&self->_currentlyRunningUninterruptableRequest, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_requestRunners, 0);

  objc_storeStrong((id *)&self->_queuedOutputRequests, 0);
}

@end
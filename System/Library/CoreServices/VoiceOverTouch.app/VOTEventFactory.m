@interface VOTEventFactory
+ (void)_updateZoomFrame:(CGRect)a3;
+ (void)initialize;
- (AXDispatchTimer)_handwritingCaptureTimer;
- (AXEventProcessor)eventProcessor;
- (BOOL)_atvEventFilter:(id)a3;
- (BOOL)_audioAccessoryEventFilter:(id)a3;
- (BOOL)_canScribbleWithElement:(id)a3;
- (BOOL)_gestureEventIsInvalid:(id)a3;
- (BOOL)_handleAccessibilityEvent:(id)a3;
- (BOOL)_handleDirectInteractionEvent:(id)a3;
- (BOOL)_handleOrbEvent:(id)a3;
- (BOOL)_handleVoiceOverGreySupportAccessibilityEvent:(id)a3;
- (BOOL)_iosEventFilter:(id)a3;
- (BOOL)_isEdgePressSupportedAtPosition:(CGPoint)a3;
- (BOOL)_isPreviewElementSelected;
- (BOOL)_isStylusGesture;
- (BOOL)_isTapAndHoldPending;
- (BOOL)_shouldAttemptTracking;
- (BOOL)_shouldDismissPreviewOnLift;
- (BOOL)_shouldUseGesturedTextInputManager;
- (BOOL)_tapAndHoldModeIsForScribble;
- (BOOL)_twoFingersDistant:(id)a3;
- (BOOL)_updateFingersInSystemControlLocation:(CGPoint)a3 fingerCount:(unint64_t)a4 isLift:(BOOL)a5;
- (BOOL)_willStartEdgePanGestureForEvent:(id)a3;
- (BOOL)brailleInputActive;
- (BOOL)brailleInputAllowsElementMovement;
- (BOOL)brailleInputShouldBeDeactivatedByEscape;
- (BOOL)brailleInputWantsToStayActive;
- (BOOL)directInteractionGestureInProgress;
- (BOOL)directTouchElementsPresent;
- (BOOL)handleVOSGesture:(id)a3;
- (BOOL)handwritingInputActive;
- (BOOL)mapsExplorationInputActive;
- (BOOL)processEventAsGesturedTextInput:(id)a3;
- (BOOL)registerForEvents;
- (BOOL)shouldBlockSplitTapGestureWithFactory:(id)a3;
- (BOOL)shouldSnarfEventForTapWakeGesture:(id)a3;
- (BOOL)tapAndHoldMode;
- (CGPoint)_averagePointForLastDownEvent;
- (CGPoint)_convertZoomPointToDevicePoint:(CGPoint)a3;
- (CGPoint)_startPointForScribbleWithElement:(id)a3 originalStartPoint:(CGPoint)a4;
- (CGPoint)_updateTapAndHoldLocationDataForElement:(id)a3;
- (CGPoint)adjustedPointForFactoryPoint:(CGPoint)a3 forOrientation:(int64_t)a4;
- (CGPoint)convertDevicePointToZoomedPoint:(CGPoint)a3;
- (CGPoint)fingerPosition;
- (CGRect)_convertFrame:(CGRect)a3 toPortraitFromOrientation:(int64_t)a4;
- (VOTDirectInteractionKeyboardManager)directInteractionKeyboardManager;
- (VOTDirectTouchManagementProtocol)directTouchManager;
- (VOTElement)currentElement;
- (VOTElement)lastTouchedDirectTouchElement;
- (VOTElementManagementProtocol)elementManager;
- (VOTEvent)lastGestureEvent;
- (VOTEventFactory)init;
- (VOTEventFactoryCallbackProtocol)delegate;
- (VOTHandwritingManager)handwritingManager;
- (VOTRotorManagementProtocol)rotorManager;
- (double)_edgeGestureScaleFactor:(BOOL)a3;
- (double)_edgePanGestureStartThreshold;
- (id)_brailleGestureManager;
- (id)_commandResolver;
- (id)_currentGesturedTextInputManager;
- (id)_currentGesturedTextInputManagerAndCommandResolver:(id)a3 forCommandResolver:(BOOL)a4;
- (id)_denormalizeEventRepresentation:(id)a3;
- (id)_handleGestureKeyboardTappingCallback:(unint64_t)a3 fingerCount:(unint64_t)a4 isDown:(BOOL)a5 originalLocation:(CGPoint)a6 convertedLocation:(CGPoint)a7;
- (id)_mapAXEventToVOTEvent:(id)a3;
- (id)_mapsExplorationGestureManager;
- (id)_notificationsToRegister;
- (id)_preprocessEventForSimulator:(id)a3;
- (id)_touchLocationsForGestureEvent:(id)a3;
- (id)_updateEdgePanGestureForState:(int64_t)a3;
- (id)gestureFactory;
- (id)tapAndHoldContextNumbers;
- (id)votActionForEdgePanGestureState:(unint64_t)a3;
- (int)_registerForAXNotifications:(BOOL)a3;
- (int)_systemControlPosition:(CGPoint)a3 fingerCount:(unint64_t)a4;
- (int64_t)brailleInputTypingMode;
- (int64_t)orientation;
- (unint64_t)fingerCount;
- (void)_audioAccPostEvent:(id)a3 withButton:(unint64_t)a4;
- (void)_audioAccPostEvent:(id)a3 withButton:(unint64_t)a4 timeOffset:(double)a5;
- (void)_beginAudiographScrubbingMode;
- (void)_beginNativeSliding:(id)a3;
- (void)_cancelScribbleTapAndHoldModeTimeout;
- (void)_cancelTapAndHold:(CGPoint)a3;
- (void)_cancelTapAndHold:(CGPoint)a3 forScribble:(BOOL)a4;
- (void)_cancelTapAndHoldWithValue:(id)a3;
- (void)_cancelUpdateScribbleTapAndHoldModeOffset;
- (void)_commitDeferredZoomInfo;
- (void)_commitDeferredZoomInfoIfAppropriate;
- (void)_contextlessTouchWithHandType:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 altitude:(double)a6 azimuth:(double)a7;
- (void)_convertZoomRecordToDeviceRecord:(id)a3;
- (void)_edgePanGestureSpeakHintTimerFired;
- (void)_endAudiographScrubbingMode;
- (void)_endScribbleTapAndHoldMode;
- (void)_feedEventToHandwritingRecognition:(id)a3;
- (void)_gestureTrackingCallbackWithFactory:(id)a3 isHandlingSystemControlEvent:(BOOL)a4;
- (void)_handleAudiographScrubbingPositionChanged;
- (void)_handleBSIStateChangedNotification:(id)a3;
- (void)_handleElementPreviewNotification:(id)a3;
- (void)_handleEventWithData:(id)a3;
- (void)_handleIOHIDEvent:(id)a3;
- (void)_handleKeyboardVisibilityChanged:(id)a3;
- (void)_handleRotorChangedNotification:(id)a3;
- (void)_handleSOSMedicalIDShown;
- (void)_liftFromTapAndHoldAndResetFingers:(BOOL)a3;
- (void)_liftPreviewFinger;
- (void)_markTapAndHoldOffsetAsDirty;
- (void)_outputElementSummaryFired;
- (void)_playFeedbackForGestureState:(unint64_t)a3 gestureComplete:(BOOL)a4;
- (void)_processGestureEvent:(id)a3;
- (void)_processIdle:(CGPoint)a3;
- (void)_processTapAndHoldMode:(id)a3;
- (void)_reducePreviewFingerStartingForce:(double)a3;
- (void)_registerForIOHIDUsage;
- (void)_registerForZoomListener;
- (void)_resetSystemControlStatus;
- (void)_scheduleUpdateScribbleTapAndHoldModeOffset;
- (void)_sendSystemControlEvent:(id)a3;
- (void)_setFingerCount:(unint64_t)a3;
- (void)_setHandwritingCaptureTimer:(id)a3;
- (void)_simulateEdgePress;
- (void)_simulatePeekAndSwitchToTapHoldMode;
- (void)_simulatePop;
- (void)_simulatePreviewActionGesture;
- (void)_startLabelElementSoundPlay;
- (void)_startScribbleTapAndHoldModeTimeout;
- (void)_startTouchDownForTapAndHoldActionWithCenter:(id)a3 force:(id)a4 altitude:(id)a5 azimuth:(id)a6;
- (void)_stopMemorizingSession;
- (void)_switchToTrackingMode;
- (void)_systemControlLocationTimer;
- (void)_tapHoldFired:(id)a3;
- (void)_threeFingerHoldFired;
- (void)_touchDownAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6;
- (void)_touchDragAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6;
- (void)_touchLiftAtPoint:(CGPoint)a3;
- (void)_transitionToGestureState:(unint64_t)a3;
- (void)_transitionToGestureState:(unint64_t)a3 playHaptic:(BOOL)a4;
- (void)_twoFingerHoldFired;
- (void)_updateCurrentElementOrbGestureMode;
- (void)_updateDelayUntilSpeakUnderTouch;
- (void)_updateFirstnessOfTrackingEvent:(id)a3;
- (void)_updateTapSpeedFromPreferences;
- (void)_updateVoiceOverHandGesturesActionCustomizations;
- (void)_volumeChangeTimer;
- (void)_wakeTapFired;
- (void)brailleGestureManager:(id)a3 setForcedOrientation:(int64_t)a4 shouldAnnounce:(BOOL)a5;
- (void)brailleGestureManager:(id)a3 unsetForcedOrientationAndAnnounce:(BOOL)a4;
- (void)cancelTapAndHold:(CGPoint)a3;
- (void)currentElementDidUpdate:(id)a3;
- (void)dealloc;
- (void)directInteractionElementsUpdated:(id)a3;
- (void)directInteractionModeStatus:(BOOL)a3;
- (void)firstResponderDidUpdate:(id)a3;
- (void)gestureFactoryDidBeginSplitGesture:(id)a3;
- (void)gestureSplitTappingCallbackWithFactory:(id)a3;
- (void)gestureTappingCallbackWithFactory:(id)a3;
- (void)gestureTrackingCallbackWithFactory:(id)a3;
- (void)gesturedTextInputManager:(id)a3 accessCurrentGesturedTextInputElement:(id)a4;
- (void)gesturedTextInputManager:(id)a3 moveToElementMatchingRotorType:(int64_t)a4 inDirection:(int64_t)a5;
- (void)nowPlayingChanged:(id)a3;
- (void)processEvent:(id)a3;
- (void)resetEventFactory;
- (void)screenLockOccurred;
- (void)setCurrentElement:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectTouchManager:(id)a3;
- (void)setElementManager:(id)a3;
- (void)setEventProcessor:(id)a3;
- (void)setGestureFactory:(id)a3;
- (void)setLastGestureEvent:(id)a3;
- (void)setLastTouchedDirectTouchElement:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setRotorManager:(id)a3;
- (void)shutdown;
- (void)startTapAndHoldMode:(BOOL)a3;
- (void)unregisterForEvents;
- (void)updateOrientation;
@end

@implementation VOTEventFactory

- (VOTHandwritingManager)handwritingManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0C68;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  if (qword_1001EBA60 != -1) {
    dispatch_once(&qword_1001EBA60, block);
  }
  return (VOTHandwritingManager *)(id)qword_1001EBA58;
}

- (BOOL)handwritingInputActive
{
  v2 = [(VOTEventFactory *)self handwritingManager];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (void)setGestureFactory:(id)a3
{
}

- (id)gestureFactory
{
  return self->_gestureFactory;
}

- (id)_brailleGestureManager
{
  brailleGestureManager = self->_brailleGestureManager;
  if (!brailleGestureManager)
  {
    v4 = objc_alloc_init(VOTBrailleGestureManager);
    v5 = self->_brailleGestureManager;
    self->_brailleGestureManager = v4;

    [(VOTGesturedTextInputManager *)self->_brailleGestureManager setDelegate:self];
    [(VOTBrailleGestureManager *)self->_brailleGestureManager setBrailleGestureManagerDelegate:self];
    brailleGestureManager = self->_brailleGestureManager;
  }

  return brailleGestureManager;
}

- (BOOL)brailleInputActive
{
  v2 = [(VOTEventFactory *)self _brailleGestureManager];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (int64_t)brailleInputTypingMode
{
  v2 = [(VOTEventFactory *)self _brailleGestureManager];
  id v3 = [v2 typingMode];

  return (int64_t)v3;
}

- (BOOL)brailleInputAllowsElementMovement
{
  v2 = [(VOTEventFactory *)self _brailleGestureManager];
  unsigned __int8 v3 = [v2 allowsElementMovement];

  return v3;
}

- (BOOL)brailleInputWantsToStayActive
{
  v2 = [(VOTEventFactory *)self _brailleGestureManager];
  unsigned __int8 v3 = [v2 wantsToStayActive];

  return v3;
}

- (BOOL)brailleInputShouldBeDeactivatedByEscape
{
  v2 = [(VOTEventFactory *)self _brailleGestureManager];
  unsigned __int8 v3 = [v2 shouldBeDeactivatedByEscape];

  return v3;
}

- (id)_mapsExplorationGestureManager
{
  mapsExplorationGestureManager = self->_mapsExplorationGestureManager;
  if (!mapsExplorationGestureManager)
  {
    v4 = (VOTMapsExplorationGestureManager *)objc_opt_new();
    v5 = self->_mapsExplorationGestureManager;
    self->_mapsExplorationGestureManager = v4;

    [(VOTGesturedTextInputManager *)self->_mapsExplorationGestureManager setDelegate:self];
    mapsExplorationGestureManager = self->_mapsExplorationGestureManager;
  }

  return mapsExplorationGestureManager;
}

- (BOOL)mapsExplorationInputActive
{
  mapsExplorationGestureManager = self->_mapsExplorationGestureManager;
  if (mapsExplorationGestureManager) {
    LOBYTE(mapsExplorationGestureManager) = [(VOTGesturedTextInputManager *)mapsExplorationGestureManager isActive];
  }
  return (char)mapsExplorationGestureManager;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[ZoomServices sharedInstance];
    [v2 registerInterestInZoomAttributes];
  }
}

- (VOTEventFactory)init
{
  v82.receiver = self;
  v82.super_class = (Class)VOTEventFactory;
  id v2 = [(VOTEventFactory *)&v82 init];
  if (v2)
  {
    AXDeviceSizeMM();
    double v4 = v3;
    double v6 = v5;
    v7 = (SCRCGestureFactory *)objc_msgSend(objc_allocWithZone((Class)SCRCGestureFactory), "initWithSize:delegate:threadKey:", v2, 0, v3, v5);
    gestureFactory = v2->_gestureFactory;
    v2->_gestureFactory = v7;

    if (v4 >= v6) {
      double v9 = v4;
    }
    else {
      double v9 = v6;
    }
    double v10 = v9 / 74.0;
    double v11 = (0.9 / v10 + -0.9) / 0.6;
    BOOL v12 = v10 <= 0.5;
    double v13 = 1.5;
    if (!v12) {
      double v13 = v11;
    }
    [(SCRCGestureFactory *)v2->_gestureFactory setFlickSpeed:v13];
    [(VOTEventFactory *)v2 _updateTapSpeedFromPreferences];
    v2->_currentElementLock._os_unfair_lock_opaque = 0;
    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tapAndHoldContextIds = v2->_tapAndHoldContextIds;
    v2->_tapAndHoldContextIds = v14;

    v2->_tapAndHoldLock._os_unfair_lock_opaque = 0;
    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    previewFingerContextId = v2->_previewFingerContextId;
    v2->_previewFingerContextId = v16;

    v18 = (SCRCThreadKey *)[objc_alloc((Class)SCRCThreadKey) initWithObject:v2];
    threadKey = v2->_threadKey;
    v2->_threadKey = v18;

    v20 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_tapHoldFired:" threadKey:0];
    tapHoldTimer = v2->_tapHoldTimer;
    v2->_tapHoldTimer = v20;

    v22 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_outputElementSummaryFired" threadKey:0];
    elementSummaryTimer = v2->_elementSummaryTimer;
    v2->_elementSummaryTimer = v22;

    v24 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_twoFingerHoldFired" threadKey:0];
    twoFingerHoldTimer = v2->_twoFingerHoldTimer;
    v2->_twoFingerHoldTimer = v24;

    v26 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_threeFingerHoldFired" threadKey:0];
    threeFingerHoldTimer = v2->_threeFingerHoldTimer;
    v2->_threeFingerHoldTimer = v26;

    v28 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_startLabelElementSoundPlay" threadKey:0];
    memorizeSoundTimer = v2->_memorizeSoundTimer;
    v2->_memorizeSoundTimer = v28;

    v30 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_systemControlLocationTimer" threadKey:0];
    systemControlLocationTimer = v2->_systemControlLocationTimer;
    v2->_systemControlLocationTimer = v30;

    v32 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_volumeChangeTimer" threadKey:0];
    volumeChangeTimer = v2->_volumeChangeTimer;
    v2->_volumeChangeTimer = v32;

    v34 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_wakeTapFired" threadKey:0];
    wakeTapTimer = v2->_wakeTapTimer;
    v2->_wakeTapTimer = v34;

    v36 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_edgePanGestureSpeakHintTimerFired" threadKey:0];
    edgePanGestureSpeakHintTimer = v2->_edgePanGestureSpeakHintTimer;
    v2->_edgePanGestureSpeakHintTimer = v36;

    v38 = +[NSNotificationCenter defaultCenter];
    v39 = off_1001EAB20;
    v40 = +[NSOperationQueue currentQueue];
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1000C1764;
    v80[3] = &unk_1001B33E0;
    v41 = v2;
    v81 = v41;
    id v42 = [v38 addObserverForName:v39 object:0 queue:v40 usingBlock:v80];

    v43 = +[NSNotificationCenter defaultCenter];
    v44 = off_1001EAB28;
    v45 = +[NSOperationQueue currentQueue];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000C17D4;
    v78[3] = &unk_1001B33E0;
    v46 = v41;
    v79 = v46;
    id v47 = [v43 addObserverForName:v44 object:0 queue:v45 usingBlock:v78];

    objc_initWeak(&location, v46);
    v48 = +[NSNotificationCenter defaultCenter];
    v49 = +[NSOperationQueue currentQueue];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1000C18CC;
    v75[3] = &unk_1001B33E0;
    v50 = v46;
    v76 = v50;
    id v51 = [v48 addObserverForName:@"VOTRotorChangedNotification" object:0 queue:v49 usingBlock:v75];

    v52 = +[NSNotificationCenter defaultCenter];
    v53 = +[NSOperationQueue currentQueue];
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1000C18D8;
    v73[3] = &unk_1001B33E0;
    v54 = v50;
    v74 = v54;
    id v55 = [v52 addObserverForName:@"VOTBSIStateChangedNotification" object:0 queue:v53 usingBlock:v73];

    v54[68] = (id)0xC1E6CEAF20000000;
    v54[49] = (id)0xC1E6CEAF20000000;
    v54[27] = (id)0xC1E6CEAF20000000;
    v54[77] = (id)0x3FF199999999999ALL;
    *((CFAbsoluteTime *)v54 + 25) = CFAbsoluteTimeGetCurrent();
    v56 = objc_alloc_init(VOTDirectInteractionKeyboardManager);
    id v57 = v54[112];
    v54[112] = v56;

    [v54[112] setDelegate:v54];
    [v54[112] updateTypingMode];
    [v54 _registerForIOHIDUsage];
    [v54 _updateDelayUntilSpeakUnderTouch];
    v58 = +[AXSettings sharedInstance];
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_1000C18E4;
    v71[3] = &unk_1001B35A8;
    objc_copyWeak(&v72, &location);
    [v58 registerUpdateBlock:v71 forRetrieveSelector:"voiceOverDelayUntilSpeakUnderTouch" withListener:v54];

    objc_destroyWeak(&v72);
    v59 = +[AXSettings sharedInstance];
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000C1924;
    v69[3] = &unk_1001B35A8;
    objc_copyWeak(&v70, &location);
    [v59 registerUpdateBlock:v69 forRetrieveSelector:"voiceOverDoubleTapInterval" withListener:v54];

    objc_destroyWeak(&v70);
    v60 = +[AXHapticFeedbackManager sharedManager];
    [v60 playHapticFeedbackForType:20];

    v61 = +[AXSettings sharedInstance];
    uint64_t v62 = [v61 voiceOverHandGesturesActionCustomizations];
    id v63 = v54[105];
    v54[105] = (id)v62;

    v64 = +[AXSettings sharedInstance];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1000C1964;
    v67[3] = &unk_1001B35A8;
    objc_copyWeak(&v68, &location);
    [v64 registerUpdateBlock:v67 forRetrieveSelector:"voiceOverHandGesturesActionCustomizations" withListener:v54];

    objc_destroyWeak(&v68);
    v65 = v54;

    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)_updateDelayUntilSpeakUnderTouch
{
  id v4 = +[AXSettings sharedInstance];
  [v4 voiceOverDelayUntilSpeakUnderTouch];
  self->_delayUntilSpeakInterval = v3;
}

- (void)_updateTapSpeedFromPreferences
{
  double v3 = +[AXSettings sharedInstance];
  [v3 voiceOverDoubleTapInterval];
  double v5 = (v4 - kAXSVoiceOverDoubleTapIntervalMin)
     / (kAXSVoiceOverDoubleTapIntervalMax - kAXSVoiceOverDoubleTapIntervalMin)
     * -2.0
     + 1.0;

  gestureFactory = self->_gestureFactory;

  [(SCRCGestureFactory *)gestureFactory setTapSpeed:v5];
}

- (BOOL)shouldSnarfEventForTapWakeGesture:(id)a3
{
  return vabdd_f64(sub_1000C1ACC((unint64_t)[a3 HIDTime]), self->_lastWatchWakeUpTime) < 0.699999988;
}

- (void)_wakeTapFired
{
  unint64_t watchWakeTapCount = self->_watchWakeTapCount;
  if (watchWakeTapCount == 2)
  {
    double v10 = &kVOTEventCommandWatchWakeDoubleTap;
    goto LABEL_16;
  }
  if (watchWakeTapCount == 1)
  {
    if ([(NSMutableArray *)self->_snarfedWatchWakeRecords count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      double v4 = self->_snarfedWatchWakeRecords;
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            double v9 = +[VOTGestureEvent gestureEventWithEventRepresentation:](VOTGestureEvent, "gestureEventWithEventRepresentation:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
            [(VOTEventFactory *)self _processGestureEvent:v9];
          }
          id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
      goto LABEL_17;
    }
    double v10 = &kVOTEventCommandWatchWakeTap;
LABEL_16:
    double v4 = +[VOTEvent internalEventWithCommand:*v10 info:0];
    [(VOTEventFactory *)self processEvent:v4];
LABEL_17:

    goto LABEL_18;
  }
  if (watchWakeTapCount >= 3)
  {
    double v10 = &kVOTEventCommandWatchWakeTripleTap;
    goto LABEL_16;
  }
LABEL_18:
  self->_unint64_t watchWakeTapCount = 0;
  [(NSMutableArray *)self->_snarfedWatchWakeRecords removeAllObjects];
}

- (id)_denormalizeEventRepresentation:(id)a3
{
  return [a3 denormalizedEventRepresentation:0 descale:1];
}

- (void)_handleIOHIDEvent:(id)a3
{
  double v4 = [(VOTEventFactory *)self _denormalizeEventRepresentation:a3];
  if ([v4 type] == 3001)
  {
    id v5 = [v4 handInfo];
    if ([v5 eventType] == 1)
    {

LABEL_6:
      [(VOTEventFactory *)self _commitDeferredZoomInfo];
      goto LABEL_8;
    }
    id v6 = [v4 handInfo];
    if ([v6 eventType] != 5)
    {

      goto LABEL_8;
    }
    uint64_t v7 = [v4 handInfo];
    v8 = [v7 paths];
    id v9 = [v8 count];

    if (v9 == (id)1) {
      goto LABEL_6;
    }
  }
LABEL_8:
  if (_AXSZoomTouchEnabled())
  {
    LODWORD(v10) = dword_1001EBA68;
    if (*(float *)&dword_1001EBA68 > 1.0
      && !CGRectIsEmpty(*(CGRect *)ymmword_1001EBA70)
      && (AXInPreboardScenario() & 1) == 0
      && (AXInCheckerBoardScenario() & 1) == 0
      && ([(id)VOTSharedWorkspace brailleInputActive] & 1) == 0)
    {
      [(VOTEventFactory *)self _convertZoomRecordToDeviceRecord:v4];
    }
  }
  int v11 = objc_msgSend(v4, "type", v10);
  if (v11 > 1199)
  {
    if ((v11 - 1200) <= 7)
    {
      if (((1 << (v11 + 80)) & 0xAF) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v13 = WeakRetained;
        long long v14 = v4;
        id v15 = 0;
      }
      else
      {
        v29 = [(VOTEventFactory *)self currentElement];
        id v30 = [v29 isRTL];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v13 = WeakRetained;
        long long v14 = v4;
        id v15 = v30;
      }
      [WeakRetained handleAppleTVRemoteEvent:v14 eventOrigin:7 isRTL:v15];
      goto LABEL_42;
    }
    if ((v11 - 4500) >= 2)
    {
      if (v11 != 3001) {
        goto LABEL_43;
      }
      v19 = [v4 handInfo];
      unsigned int v20 = [v19 eventType];

      if (v20 == 10) {
        goto LABEL_43;
      }
      v21 = [v4 handInfo];
      unsigned int v22 = [v21 eventType];

      if (v22 == 11) {
        goto LABEL_43;
      }
      [v4 neuterUpdates];
      if ([(VOTEventFactory *)self shouldSnarfEventForTapWakeGesture:v4])
      {
        double v23 = sub_1000C1ACC((unint64_t)[v4 HIDTime]);
        v24 = [v4 handInfo];
        unsigned int v25 = [v24 eventType];

        if (v25 == 6)
        {
          wakeTapTimer = self->_wakeTapTimer;
          ++self->_watchWakeTapCount;
          self->_lastWatchWakeUpTime = v23;
          [(SCRCTargetSelectorTimer *)wakeTapTimer cancel];
          [(SCRCTargetSelectorTimer *)self->_wakeTapTimer dispatchAfterDelay:0.699999988];
          v27 = AXLogTapticTime();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            unint64_t watchWakeTapCount = self->_watchWakeTapCount;
            int v41 = 134218240;
            unint64_t v42 = watchWakeTapCount;
            __int16 v43 = 2048;
            double v44 = v23;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "watchWakeTapCount=%lu, timestamp=%f", (uint8_t *)&v41, 0x16u);
          }
        }
        [(NSMutableArray *)self->_snarfedWatchWakeRecords addObject:v4];
        goto LABEL_43;
      }
      v36 = +[VOTGestureEvent gestureEventWithEventRepresentation:v4];
      [(VOTEventFactory *)self _processGestureEvent:v36];
      self->_unint64_t watchWakeTapCount = 0;
      [(NSMutableArray *)self->_snarfedWatchWakeRecords removeAllObjects];
LABEL_60:

      goto LABEL_43;
    }
LABEL_39:
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 handleKeyboardKeyEvent:v4 eventOrigin:4];
LABEL_42:

    goto LABEL_43;
  }
  if (v11 <= 1028)
  {
    if ((v11 - 10) >= 3) {
      goto LABEL_43;
    }
    goto LABEL_39;
  }
  if ((v11 - 1029) <= 4 && v11 != 1031) {
    goto LABEL_39;
  }
  if (v11 == 1100)
  {
    double v31 = sub_1000C1ACC((unint64_t)[v4 HIDTime]);
    if (v31 - self->_lastScrollEventTime >= 0.25)
    {
      BOOL v32 = 0;
      self->_currentAccumulatedScroll = 0;
    }
    else
    {
      BOOL v32 = 1;
    }
    self->_scrollWheelIsActive = v32;
    self->_lastScrollEventTime = v31;
    uint64_t v33 = (uint64_t)[v4 scrollAmount];
    if ([(id)VOTSharedWorkspace deviceOrientation] == (id)2) {
      uint64_t v34 = -v33;
    }
    else {
      uint64_t v34 = v33;
    }
    int64_t v35 = v34 + self->_currentAccumulatedScroll;
    self->_currentAccumulatedScroll = v35;
    if (!self->_scrollWheelIsActive) {
      goto LABEL_43;
    }
    if (v35 < 51)
    {
      if (v35 > -51) {
        goto LABEL_43;
      }
      v36 = +[VOTEvent internalEventWithCommand:kVOTEventCommandNextElement info:0];
      int64_t v37 = self->_currentAccumulatedScroll + 50;
    }
    else
    {
      v36 = +[VOTEvent internalEventWithCommand:kVOTEventCommandPreviousElement info:0];
      int64_t v37 = self->_currentAccumulatedScroll - 50;
    }
    self->_currentAccumulatedScroll = v37;
    [(VOTEventFactory *)self processEvent:v36];
    goto LABEL_60;
  }
  if (v11 == 1102)
  {
    self->_lastWatchWakeUpTime = sub_1000C1ACC((unint64_t)[v4 HIDTime]);
    if (!self->_aotEnabled || ([v4 location], v17 == CGPointZero.x) && v16 == CGPointZero.y)
    {
      snarfedWatchWakeRecords = self->_snarfedWatchWakeRecords;
      self->_snarfedWatchWakeRecords = 0;
    }
    else
    {
      v38 = self->_snarfedWatchWakeRecords;
      if (!v38)
      {
        v39 = (NSMutableArray *)objc_opt_new();
        v40 = self->_snarfedWatchWakeRecords;
        self->_snarfedWatchWakeRecords = v39;

        v38 = self->_snarfedWatchWakeRecords;
      }
      [(NSMutableArray *)v38 removeAllObjects];
    }
  }
LABEL_43:
  [(id)VOTSharedWorkspace userInteractedWithDevice];
}

- (id)_preprocessEventForSimulator:(id)a3
{
  double v3 = [a3 denormalizedEventRepresentation:1 descale:1];
  double v4 = [v3 handInfo];
  id v5 = [v4 paths];
  id v6 = [v5 firstPath];
  [v6 pathLocation];
  double v8 = v7;
  double v10 = v9;

  int v11 = +[AXBackBoardServer server];
  id v12 = objc_msgSend(v11, "contextIdForPosition:", v8, v10);

  [v3 setContextId:v12];
  AXConvertPointToHostedCoordinates();
  _AXUIScreenConvertToCAScreen();
  double v14 = v13;
  double v16 = v15;
  double v17 = [v3 handInfo];
  v18 = [v17 paths];
  v19 = [v18 firstPath];
  objc_msgSend(v19, "setPathLocation:", v14, v16);

  return v3;
}

- (BOOL)_atvEventFilter:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && [v4 type]
    && [v5 senderID] != (id)0x8000000817319373
    && [v5 senderID] != (id)0x8000000817319375)
  {
    if ([v5 type] == 3001)
    {
      double v8 = [(VOTEventFactory *)self elementManager];
      uint64_t v6 = (uint64_t)[v8 inDirectTouchMode];

      double v9 = [(VOTEventFactory *)self elementManager];
      unsigned int v10 = [v9 tvIsInteractingWithRotor];

      unsigned int v11 = [(VOTSimpleClickButtonInterceptor *)self->_selectButtonInterceptor touchEventOccurred:v5 inTVDirectTouch:v6];
      if (!v6 || (v10 & 1) == 0 && (unint64_t)[v5 fingerCount] < 2)
      {
        LOBYTE(v6) = v6 ^ 1;
        if (!(v11 ^ 1 | v10)) {
          goto LABEL_6;
        }
LABEL_17:
        [(VOTEventFactory *)self performSelectorOnMainThread:"_handleIOHIDEvent:" withObject:v5 waitUntilDone:0];
        goto LABEL_7;
      }
LABEL_16:
      LOBYTE(v6) = 1;
      goto LABEL_17;
    }
    if ([v5 type] >= 0x4B0 && objc_msgSend(v5, "type") < 0x4B8) {
      goto LABEL_16;
    }
    if ([v5 type] == 1032)
    {
      playButtonInterceptor = self->_playButtonInterceptor;
LABEL_26:
      [playButtonInterceptor buttonDownOccurred:v5];
      goto LABEL_27;
    }
    if ([v5 type] == 1033)
    {
      menuButtonInterceptor = self->_playButtonInterceptor;
    }
    else
    {
      if ([v5 type] == 1220 || objc_msgSend(v5, "type") == 1218)
      {
        playButtonInterceptor = self->_selectButtonInterceptor;
        goto LABEL_26;
      }
      if ([v5 type] == 1216)
      {
        playButtonInterceptor = self->_menuButtonInterceptor;
        goto LABEL_26;
      }
      if ([v5 type] == 1217)
      {
        menuButtonInterceptor = self->_menuButtonInterceptor;
      }
      else
      {
        if ([v5 type] != 1221 && objc_msgSend(v5, "type") != 1219)
        {
          uint64_t v6 = [v5 keyInfo];

          if (!v6) {
            goto LABEL_6;
          }
          [v5 type];
          if (AXEventTypeIsVolumeButtonPress()) {
            goto LABEL_5;
          }
          goto LABEL_16;
        }
        double v14 = +[NSNotificationCenter defaultCenter];
        [v14 postNotificationName:@"VOTEventFactoryDidReceiveSelectButtonUpEvent" object:0];

        menuButtonInterceptor = self->_selectButtonInterceptor;
      }
    }
    [menuButtonInterceptor buttonUpOccurred:v5];
LABEL_27:
    LOBYTE(v6) = 1;
    goto LABEL_6;
  }
LABEL_5:
  LOBYTE(v6) = 0;
LABEL_6:
  AXPerformBlockOnMainThread();
LABEL_7:

  return v6;
}

- (BOOL)_audioAccessoryEventFilter:(id)a3
{
  return 1;
}

- (void)_audioAccPostEvent:(id)a3 withButton:(unint64_t)a4
{
}

- (void)_audioAccPostEvent:(id)a3 withButton:(unint64_t)a4 timeOffset:(double)a5
{
  id v6 = a3;
  id v9 = v6;
  if (!self->_audioAccIOSystemPostBackClient)
  {
    self->_audioAccIOSystemPostBackClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    id v6 = v9;
  }
  id v7 = [v6 creatorHIDEvent];
  if (self->_audioAccIOSystemPostBackClient) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    IOHIDEventGetType();
    IOHIDEventSetSenderID();
    mach_absolute_time();
    sub_1000C1ACC(0xF4240uLL);
    IOHIDEventSetTimeStamp();
    IOHIDEventSetIntegerValue();
    IOHIDEventSystemClientDispatchEvent();
  }
}

- (void)nowPlayingChanged:(id)a3
{
  double v3 = dispatch_get_global_queue(0, 0);
  MRMediaRemoteGetNowPlayingApplicationIsPlaying();
}

- (BOOL)_iosEventFilter:(id)a3
{
  id v4 = a3;
  if ([v4 senderID] == (id)0x8000000817319373
    || [v4 senderID] == (id)0x8000000817319375
    || [v4 senderID] == (id)0x8000000817319372
    || [v4 type] == 1013
    || [v4 type] == 1012)
  {
    goto LABEL_6;
  }
  id v7 = [v4 keyInfo];
  if ([v7 keyCode] == 10)
  {
    BOOL v8 = [v4 keyInfo];
    BOOL v9 = [v8 usagePage] == 255;
  }
  else
  {
    BOOL v9 = 0;
  }

  BOOL v5 = 0;
  if (v4 && !v9)
  {
    if (![v4 type]) {
      goto LABEL_6;
    }
    [v4 type];
    if (AXEventTypeIsHomeButtonPress()) {
      goto LABEL_6;
    }
    [v4 type];
    if (AXEventTypeIsLockButtonPress()) {
      goto LABEL_6;
    }
    [v4 type];
    if (AXEventTypeIsVolumeButtonPress())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained handleTurnOffSoundAndCurtainEvent:v4];

LABEL_6:
      BOOL v5 = 0;
      goto LABEL_7;
    }
    if ([v4 senderID] == (id)0x8000000817319375) {
      goto LABEL_6;
    }
    if ([v4 type] == 3001)
    {
      unsigned int v11 = [v4 handInfo];
      unsigned int v12 = [v11 eventType];

      if (v12 == 12) {
        goto LABEL_6;
      }
    }
    if ([v4 type] == 1100)
    {
      double v13 = [(VOTEventFactory *)self elementManager];
      unsigned int v14 = [v13 shouldSnarfCrown];

      if (!v14) {
        goto LABEL_6;
      }
    }
    if ([v4 type] == 3200) {
      goto LABEL_6;
    }
    BOOL v15 = [v4 type] != 1102 && objc_msgSend(v4, "type") != 1101;
    if ([v4 type] == 5000)
    {
      double v16 = [v4 accessibilityData];
      id v17 = [v16 page];

      if (v17 == (id)2)
      {
        unsigned __int8 v18 = [(VOTEventFactory *)self _handleVoiceOverGreySupportAccessibilityEvent:v4];
LABEL_33:
        BOOL v5 = v18;
        goto LABEL_7;
      }
    }
    if ([v4 type] == 5000)
    {
      unsigned __int8 v18 = [(VOTEventFactory *)self _handleAccessibilityEvent:v4];
      goto LABEL_33;
    }
    if ([v4 type] == 3001)
    {
      v19 = [v4 handInfo];
      unsigned int v20 = [v19 handEventMask];

      if ((v20 & 0x20000) != 0) {
        goto LABEL_6;
      }
    }
    [(VOTEventFactory *)self performSelectorOnMainThread:"_handleIOHIDEvent:" withObject:v4 waitUntilDone:0];
    v21 = [v4 handInfo];
    unsigned int v22 = [v21 paths];

    if ((self->_flags.allowingSystemGesturePassthrough
       || v22
       && (unint64_t)[v22 count] >= 5
       && AXDeviceIsPad()
       && !self->_flags.sendingToDirectTouch)
      && ([(VOTEventFactory *)self _currentGesturedTextInputManager],
          double v23 = objc_claimAutoreleasedReturnValue(),
          v23,
          !v23))
    {
      if (v22 && [v22 count])
      {
        v24 = [v4 handInfo];
        BOOL v25 = [v24 currentFingerCount] != 0;
      }
      else
      {
        BOOL v25 = 0;
      }
      BOOL v26 = 0;
      self->_flags.allowingSystemGesturePassthrough = v25;
    }
    else
    {
      BOOL v26 = [v4 type] != 1042 && objc_msgSend(v4, "type") != 1043 && v15;
    }

    BOOL v5 = v26;
  }
LABEL_7:

  return v5;
}

- (void)_registerForIOHIDUsage
{
  id v3 = [objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:@"VoiceOverTouch" HIDEventTapPriority:15 systemEventTapIdentifier:0 systemEventTapPriority:15];
  [(VOTEventFactory *)self setEventProcessor:v3];

  if (AXDeviceIsAudioAccessory())
  {
    id v4 = [(VOTEventFactory *)self eventProcessor];
    BOOL v5 = v4;
    uint64_t v6 = 3;
  }
  else
  {
    int IsTV = AXDeviceIsTV();
    id v4 = [(VOTEventFactory *)self eventProcessor];
    BOOL v5 = v4;
    if (IsTV) {
      uint64_t v6 = 256;
    }
    else {
      uint64_t v6 = 171;
    }
  }
  [v4 setHIDEventFilterMask:v6];

  objc_initWeak(&location, self);
  BOOL v8 = [(VOTEventFactory *)self eventProcessor];
  [v8 setFailedToHandleEventInTime:&stru_1001B6490];

  LOBYTE(v8) = AXDeviceIsAudioAccessory();
  char v9 = AXDeviceIsTV();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C2E64;
  v12[3] = &unk_1001B64B8;
  char v14 = (char)v8;
  objc_copyWeak(&v13, &location);
  char v15 = v9;
  unsigned int v10 = [(VOTEventFactory *)self eventProcessor];
  [v10 setHIDEventHandler:v12];

  unsigned int v11 = [(VOTEventFactory *)self eventProcessor];
  [v11 beginHandlingHIDEventsForReason:@"VoiceOver wants them"];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

+ (void)_updateZoomFrame:(CGRect)a3
{
  *(CGRect *)ymmword_1001EBA70 = a3;
}

- (void)_registerForZoomListener
{
  if (!self->_zoomListenerIdentifier)
  {
    id v3 = +[ZoomServices sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C3000;
    v7[3] = &unk_1001B41A8;
    v7[4] = self;
    id v4 = [v3 registerForCoalescedZoomAttributesWithChangedHandler:v7 onDisplay:0];
    zoomListenerIdentifier = self->_zoomListenerIdentifier;
    self->_zoomListenerIdentifier = v4;

    if (!self->_zoomListenerIdentifier)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000C3140, kAXSZoomTouchEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
}

- (void)shutdown
{
  id v3 = [(VOTEventFactory *)self eventProcessor];
  [v3 endHandlingHIDEventsForReason:@"VoiceOver wants them"];

  [(VOTEventFactory *)self setEventProcessor:0];

  [(VOTEventFactory *)self unregisterForEvents];
}

- (void)dealloc
{
  if (self->_axEventObserver)
  {
    [(VOTEventFactory *)self _registerForAXNotifications:0];
    CFRelease(self->_axEventObserver);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSZoomTouchEnabledNotification, 0);
  id v4 = +[ZoomServices sharedInstance];
  [v4 removeCoalescedZoomAttributesChangedHandler:self->_zoomListenerIdentifier];

  BOOL v5 = [(VOTEventFactory *)self eventProcessor];
  [v5 cleanup];

  previewFingerContextId = self->_previewFingerContextId;
  self->_previewFingerContextId = 0;

  [(SCRCTargetSelectorTimer *)self->_systemControlLocationTimer invalidate];
  systemControlLocationTimer = self->_systemControlLocationTimer;
  self->_systemControlLocationTimer = 0;

  [(SCRCTargetSelectorTimer *)self->_tapHoldTimer invalidate];
  tapHoldTimer = self->_tapHoldTimer;
  self->_tapHoldTimer = 0;

  [(SCRCTargetSelectorTimer *)self->_elementSummaryTimer invalidate];
  elementSummaryTimer = self->_elementSummaryTimer;
  self->_elementSummaryTimer = 0;

  [(SCRCTargetSelectorTimer *)self->_twoFingerHoldTimer invalidate];
  twoFingerHoldTimer = self->_twoFingerHoldTimer;
  self->_twoFingerHoldTimer = 0;

  [(SCRCTargetSelectorTimer *)self->_threeFingerHoldTimer invalidate];
  threeFingerHoldTimer = self->_threeFingerHoldTimer;
  self->_threeFingerHoldTimer = 0;

  [(SCRCTargetSelectorTimer *)self->_memorizeSoundTimer invalidate];
  memorizeSoundTimer = self->_memorizeSoundTimer;
  self->_memorizeSoundTimer = 0;

  [(SCRCTargetSelectorTimer *)self->_volumeChangeTimer invalidate];
  volumeChangeTimer = self->_volumeChangeTimer;
  self->_volumeChangeTimer = 0;

  [(SCRCTargetSelectorTimer *)self->_wakeTapTimer invalidate];
  wakeTapTimer = self->_wakeTapTimer;
  self->_wakeTapTimer = 0;

  [(SCRCTargetSelectorTimer *)self->_edgePanGestureSpeakHintTimer invalidate];
  edgePanGestureSpeakHintTimer = self->_edgePanGestureSpeakHintTimer;
  self->_edgePanGestureSpeakHintTimer = 0;

  [(VOTBrailleGestureManager *)self->_brailleGestureManager setBrailleGestureManagerDelegate:0];
  [(VOTGesturedTextInputManager *)self->_brailleGestureManager setDelegate:0];
  [(VOTMapsExplorationGestureManager *)self->_mapsExplorationGestureManager setMapsExplorationGestureManagerDelegate:0];
  playButtonInterceptor = self->_playButtonInterceptor;
  self->_playButtonInterceptor = 0;

  selectButtonInterceptor = self->_selectButtonInterceptor;
  self->_selectButtonInterceptor = 0;

  menuButtonInterceptor = self->_menuButtonInterceptor;
  self->_menuButtonInterceptor = 0;

  v19.receiver = self;
  v19.super_class = (Class)VOTEventFactory;
  [(VOTEventFactory *)&v19 dealloc];
}

- (void)screenLockOccurred
{
  id v3 = [(VOTEventFactory *)self handwritingManager];
  [v3 setActive:0];

  brailleGestureManager = self->_brailleGestureManager;

  [(VOTBrailleGestureManager *)brailleGestureManager setActive:0];
}

- (void)_handleRotorChangedNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"kVOTRotorChangedNotificationOldRotor"];
  uint64_t v7 = (int)[v6 intValue];

  BOOL v8 = [v4 userInfo];

  char v9 = [v8 objectForKey:@"kVOTRotorChangedNotificationNewRotor"];
  signed int v10 = [v9 intValue];
  uint64_t v11 = v10;

  if (v10 == 61)
  {
    unsigned int v12 = [(VOTEventFactory *)self currentElement];
    id v13 = [v12 elementForGesturedTextInput];

    if (!v13) {
      _AXAssert();
    }
    [v13 updateGesturedTextInputAttributes];
    char v14 = [v13 gesturedTextInputAttributes];
    char v15 = [(VOTEventFactory *)self handwritingManager];
    [v15 updateCharacterModesWithHandwritingAttributes:v14];

    double v16 = [(VOTEventFactory *)self handwritingManager];
    [v16 announceActiveCharacterModeWithDelay:1];
  }
  else
  {
    if (v7 != 61) {
      goto LABEL_8;
    }
    id v17 = [(VOTEventFactory *)self handwritingManager];
    [v17 cancelAnnounceActiveCharacterMode];

    id v13 = [(VOTEventFactory *)self handwritingManager];
    [v13 clearCurrentString];
  }

LABEL_8:
  unsigned __int8 v18 = [(VOTEventFactory *)self handwritingManager];
  [v18 setActive:v11 == 61];

  if (v11 == 62)
  {
    objc_super v19 = [(VOTEventFactory *)self _brailleGestureManager];
    unsigned int v20 = v19;
    uint64_t v21 = 1;
LABEL_10:
    [v19 setActive:v21];

    goto LABEL_14;
  }
  if (v7 == 62)
  {
    unsigned int v22 = [(VOTEventFactory *)self _brailleGestureManager];
    unsigned int v23 = [v22 shouldBeDeactivatedByEscape];

    if (v23)
    {
      objc_super v19 = [(VOTEventFactory *)self _brailleGestureManager];
      unsigned int v20 = v19;
      uint64_t v21 = 0;
      goto LABEL_10;
    }
  }
LABEL_14:
  if (sub_1000F2B98(v11) && !sub_1000F2B98(v7))
  {
    v24 = VOTLogHandwriting();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Posting AXVoiceOverDidEnableGesturedTextInputNotification", buf, 2u);
    }
    BOOL v25 = (CFNotificationName *)&AXVoiceOverDidEnableGesturedTextInputNotification;
    goto LABEL_24;
  }
  if (!sub_1000F2B98(v11) && sub_1000F2B98(v7))
  {
    v24 = VOTLogHandwriting();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Posting AXVoiceOverDidDisableGesturedTextInputNotification", v27, 2u);
    }
    BOOL v25 = (CFNotificationName *)&AXVoiceOverDidDisableGesturedTextInputNotification;
LABEL_24:

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, *v25, 0, 0, 1u);
  }
}

- (void)_handleBSIStateChangedNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"VOTBSIStateChangedNotificationActive"];
  id v7 = [v6 BOOLValue];

  BOOL v8 = [v4 userInfo];

  char v9 = [v8 objectForKey:@"VOTBSIStateChangedNotificationUsage"];
  id v10 = [v9 integerValue];

  id v11 = [(VOTEventFactory *)self _brailleGestureManager];
  [v11 setActive:v7 usage:v10];
}

- (void)resetEventFactory
{
}

- (void)unregisterForEvents
{
  if (self->_axEventObserver)
  {
    [(VOTEventFactory *)self _registerForAXNotifications:0];
    CFRelease(self->_axEventObserver);
    self->_axEventObserver = 0;
  }
  id v3 = +[ZoomServices sharedInstance];
  [v3 removeCoalescedZoomAttributesChangedHandler:self->_zoomListenerIdentifier];

  zoomListenerIdentifier = self->_zoomListenerIdentifier;
  self->_zoomListenerIdentifier = 0;
}

- (BOOL)registerForEvents
{
  if (AXDeviceIsAudioAccessory()) {
    return 0;
  }
  id v3 = VOTLogEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Registering for GS Events", buf, 2u);
  }

  AXUIElementRegisterSystemWideServerDeathCallback();
  pid_t pid = 0;
  AXUIElementGetPid((AXUIElementRef)+[AXUIElement systemWideAXUIElement], &pid);
  axEventObserver = self->_axEventObserver;
  if (axEventObserver)
  {
LABEL_5:
    CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(axEventObserver);
    if (RunLoopSource)
    {
      uint64_t v6 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v6, kCFRunLoopDefaultMode);
      unsigned int v8 = [(VOTEventFactory *)self _registerForAXNotifications:1];
      if (!v8)
      {
        [(VOTEventFactory *)self _registerForZoomListener];
        return 1;
      }
      signed int v9 = v8;
      id v10 = VOTLogEvent();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 134217984;
      v24 = (void *)v9;
      id v11 = "Could not register for AX notifications. err %ld";
      unsigned int v12 = v10;
      uint32_t v13 = 12;
    }
    else
    {
      id v10 = VOTLogEvent();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
LABEL_18:

        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      id v11 = "Could not get AX run loop";
      unsigned int v12 = v10;
      uint32_t v13 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
    goto LABEL_18;
  }
  if (AXObserverCreate(pid, (AXObserverCallback)sub_1000C3B38, &self->_axEventObserver) == kAXErrorSuccess)
  {
    axEventObserver = self->_axEventObserver;
    goto LABEL_5;
  }
  char v14 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v15 = [v14 ignoreLogging];

  if ((v15 & 1) == 0)
  {
    double v16 = +[AXSubsystemVoiceOver identifier];
    id v10 = AXLoggerForFacility();

    os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v17))
    {
      unsigned __int8 v18 = AXColorizeFormatLog();
      objc_super v19 = _AXStringForArgs();
      if (os_log_type_enabled(v10, v17))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v10, v17, "%{public}@", buf, 0xCu);
      }
    }
    goto LABEL_18;
  }
LABEL_19:
  [(id)VOTSharedWorkspace handleSystemWideServerDied];
  return 0;
}

- (id)_notificationsToRegister
{
  return &off_1001C7058;
}

- (int)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (const __AXUIElement *)+[AXUIElement systemWideAXUIElement];
  uint64_t v6 = [(VOTEventFactory *)self _notificationsToRegister];
  if ([v6 count])
  {
    uint64_t v8 = 0;
    int v9 = 0;
    if (v3) {
      CFStringRef v10 = @"register";
    }
    else {
      CFStringRef v10 = @"unregister";
    }
    unsigned int v11 = 1;
    *(void *)&long long v7 = 138543874;
    long long v23 = v7;
    do
    {
      axEventObserver = self->_axEventObserver;
      uint32_t v13 = objc_msgSend(v6, "objectAtIndexedSubscript:", v8, v23);
      CFStringRef v14 = (const __CFString *)[v13 intValue];
      if (v3) {
        AXError v15 = AXObserverAddNotification(axEventObserver, v5, v14, self);
      }
      else {
        AXError v15 = AXObserverRemoveNotification(axEventObserver, v5, v14);
      }
      AXError v16 = v15;

      if (v16)
      {
        os_log_type_t v17 = VOTLogNotifications();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_super v19 = [v6 objectAtIndexedSubscript:v8];
          unsigned int v20 = [v19 intValue];
          *(_DWORD *)buf = v23;
          CFStringRef v25 = v10;
          __int16 v26 = 1024;
          unsigned int v27 = v20;
          __int16 v28 = 1024;
          AXError v29 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Unable to %{public}@ for notification %d. Error: %d", buf, 0x18u);
        }
        if (!v9) {
          int v9 = v16;
        }
      }
      uint64_t v8 = v11;
    }
    while ((unint64_t)[v6 count] > v11++);
    if (v9)
    {
      uint64_t v21 = VOTLogNotifications();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100121630();
      }
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (void)_handleSOSMedicalIDShown
{
  id v2 = VOTLogEvent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Will try to reset screen curtain because medical ID is shown", v3, 2u);
  }

  if (_AXSVoiceOverTouchScreenCurtainEnabled())
  {
    _AXSVoiceOverTouchScreenCurtainEnabled();
    _AXSVoiceOverTouchSetScreenCurtainEnabled();
  }
}

- (id)_commandResolver
{
  BOOL v3 = +[VOSCommandResolver resolverForCurrentHost];
  id v4 = [(VOTEventFactory *)self _currentGesturedTextInputManagerAndCommandResolver:v3 forCommandResolver:1];
  BOOL v5 = +[AXSettings sharedInstance];
  id v6 = [v5 voiceOverNavigationDirectionMode];

  if (v6)
  {
    if (v6 == (id)2)
    {
      long long v7 = v3;
      uint64_t v8 = 0;
    }
    else
    {
      if (v6 != (id)1) {
        goto LABEL_8;
      }
      long long v7 = v3;
      uint64_t v8 = 1;
    }
    [v7 setShouldApplyRTL:v8];
  }
  else
  {
    int v9 = [(VOTEventFactory *)self currentElement];
    objc_msgSend(v3, "setShouldApplyRTL:", objc_msgSend(v9, "applicationIsRTL"));
  }
LABEL_8:

  return v3;
}

- (id)_currentGesturedTextInputManagerAndCommandResolver:(id)a3 forCommandResolver:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = +[VOTCommandHelper commandHelper];
  id v8 = [v7 helpEnabled];

  if (v8) {
    BOOL v9 = !v4;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    unsigned int v11 = +[VOTCommandHelper commandHelper];
    [v11 practiceRegion];
    double v13 = v12;
    double v15 = v14;

    BOOL v10 = CGSizeZero.height != v15 || CGSizeZero.width != v13;
  }
  AXError v16 = [(VOTEventFactory *)self rotorManager];
  id v17 = [v16 currentRotorType];

  if (v17 == (id)61)
  {
    id v8 = [(VOTEventFactory *)self currentElement];
    if ([v8 doesHaveTraitsForGesturedTextInput])
    {

LABEL_19:
      unsigned int v20 = [(VOTEventFactory *)self handwritingManager];
      id v8 = +[VOSScreenreaderMode Handwriting];
      [v6 setScreenreaderMode:v8];
LABEL_22:

      goto LABEL_23;
    }
    if (!v10)
    {
      unsigned int v20 = 0;
      goto LABEL_22;
    }
  }
  else if (!v10)
  {
    goto LABEL_20;
  }
  unsigned __int8 v18 = +[AXSettings sharedInstance];
  id v19 = [v18 voiceOverHelpMode];

  if (v17 == (id)61) {
  if (v19 == (id)1)
  }
    goto LABEL_19;
LABEL_20:
  unsigned int v20 = 0;
LABEL_23:
  uint64_t v21 = [(VOTEventFactory *)self _brailleGestureManager];
  unsigned int v22 = [v21 isActive];
  if ((v22 & 1) == 0 && v10)
  {
    long long v23 = +[AXSettings sharedInstance];
    id v24 = [v23 voiceOverHelpMode];

    if (v24 != (id)2) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  if (v22)
  {
LABEL_28:
    CFStringRef v25 = [(VOTEventFactory *)self _brailleGestureManager];

    __int16 v26 = +[VOSScreenreaderMode BrailleScreenInput];
    [v6 setScreenreaderMode:v26];

    objc_msgSend(v6, "setBsiTypingMode:", objc_msgSend(v25, "typingMode") == 0);
    unsigned int v20 = v25;
  }
LABEL_29:
  if (v17 == (id)65)
  {
    unsigned int v27 = [(VOTEventFactory *)self _mapsExplorationGestureManager];
    unsigned int v28 = [v27 isActive];

    if (v28)
    {
      uint64_t v29 = [(VOTEventFactory *)self _mapsExplorationGestureManager];

      unsigned int v20 = (void *)v29;
    }
  }

  return v20;
}

- (id)_currentGesturedTextInputManager
{
  return [(VOTEventFactory *)self _currentGesturedTextInputManagerAndCommandResolver:0 forCommandResolver:0];
}

- (BOOL)processEventAsGesturedTextInput:(id)a3
{
  id v4 = a3;
  if ([v4 isSystemServerEvent])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    id v6 = [(VOTEventFactory *)self _currentGesturedTextInputManager];
    long long v7 = v6;
    if (v6) {
      unsigned __int8 v5 = [v6 processEvent:v4];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (void)processEvent:(id)a3
{
  id v4 = a3;
  if (![(VOTEventFactory *)self processEventAsGesturedTextInput:v4])
  {
    unsigned __int8 v5 = [(VOTEventFactory *)self directInteractionKeyboardManager];
    unsigned int v6 = [v5 inDirectInteractionTypingMode];

    if (!v6
      || ([(VOTEventFactory *)self directInteractionKeyboardManager],
          long long v7 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v8 = [v7 processEvent:v4],
          v7,
          (v8 & 1) == 0))
    {
      BOOL v9 = VOTLogEvent();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)double v15 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessEvent", "", v15, 2u);
      }

      BOOL v10 = [v4 command];
      if (![v10 isEqualToString:kVOTEventCommandIdle])
      {
        unsigned int v11 = [v4 command];
        if (![v11 isEqualToString:kVOTEventCommandWatchWakeDoubleTap])
        {
          double v13 = [v4 command];
          unsigned __int8 v14 = [v13 isEqualToString:kVOTEventCommandWatchWakeTripleTap];

          if ((v14 & 1) == 0) {
            [(id)VOTSharedWorkspace unmuteEligibleEventOccured];
          }
          goto LABEL_10;
        }
      }
LABEL_10:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
      [WeakRetained handleEvent:v4];
    }
  }
}

- (void)gestureTrackingCallbackWithFactory:(id)a3
{
}

- (BOOL)_isTapAndHoldPending
{
  unsigned int v3 = [(SCRCTargetSelectorTimer *)self->_tapHoldTimer isPending];
  if (v3) {
    LOBYTE(v3) = [(SCRCTargetSelectorTimer *)self->_tapHoldTimer isCancelled] ^ 1;
  }
  return v3;
}

- (BOOL)_shouldAttemptTracking
{
  BOOL tapAndHoldMode = self->_flags.tapAndHoldMode;
  if (tapAndHoldMode)
  {
    BOOL v4 = [(VOTEventFactory *)self _tapAndHoldModeIsForScribble];
    if (!v4) {
      return v4;
    }
    BOOL tapAndHoldMode = [(VOTEventFactory *)self _isStylusGesture];
  }
  LOBYTE(v4) = 0;
  if (self->_fingerCount && !tapAndHoldMode)
  {
    if ([(VOTEventFactory *)self _isTapAndHoldPending]) {
      LOBYTE(v4) = self->_travelDistance >= 0.119999997;
    }
    else {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (BOOL)_isEdgePressSupportedAtPosition:(CGPoint)a3
{
  double x = a3.x;
  if (objc_msgSend((id)VOTSharedWorkspace, "supportsHomeGestures", a3.x, a3.y)) {
    return 0;
  }
  unsigned __int8 v5 = +[VOTElement springBoardApplication];
  unsigned int v6 = [v5 applicationIsRTL];

  if (v6) {
    return x > 0.93;
  }
  else {
    return x < 0.07;
  }
}

- (void)_updateFirstnessOfTrackingEvent:(id)a3
{
  if (self->_flags.hasSentFirstTrackingEventForGesture)
  {
    [a3 setObject:&__kCFBooleanFalse forIndex:113];
  }
  else
  {
    [a3 setObject:&__kCFBooleanTrue forIndex:113];
    self->_flags.hasSentFirstTrackingEventForGesture = 1;
  }
}

- (void)_gestureTrackingCallbackWithFactory:(id)a3 isHandlingSystemControlEvent:(BOOL)a4
{
  id v6 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [(VOTGestureEvent *)self->_lastDownEvent time];
  if (Current - v8 >= self->_delayUntilSpeakInterval)
  {
    if ([(VOTEventFactory *)self mapsExplorationInputActive])
    {
      BOOL v9 = +[VOTEvent touchEventWithCommand:kVOTEventCommandTracking info:0];
      BOOL v10 = (void *)VOTSharedWorkspace;
      [v6 rawLocation];
      [v10 convertDevicePointToZoomedPoint:sub_100051E14(v11)];
      objc_msgSend(v9, "setTouchPoint:");
      [(VOTEventFactory *)self _updateFirstnessOfTrackingEvent:v9];
      [(VOTEventFactory *)self processEvent:v9];

      goto LABEL_42;
    }
    double v12 = VOTLogEvent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100121750();
    }

    if (![(VOTEventFactory *)self _shouldUseGesturedTextInputManager]
      && (self->_edgePanGestureState | 8) == 8)
    {
      AXForceTouchThresholdPop();
      if (v13 >= self->_previewFingerStartingForce + 50.0) {
        double v14 = v13;
      }
      else {
        double v14 = self->_previewFingerStartingForce + 50.0;
      }
      double v15 = CFAbsoluteTimeGetCurrent() - self->_previewPopDelayTime;
      if (v15 <= 1.0)
      {
        double currentTouchForce = self->_currentTouchForce;
      }
      else
      {
        [v6 firstFingerPressure];
        double currentTouchForce = v16;
      }
      if (!_AXSForceTouchEnabled())
      {
LABEL_32:
        if (self->_flags.orbMode)
        {
          self->_flags.orbMode = 0;
          self->_flags.BOOL tapAndHoldMode = 0;
        }
        if ([(VOTEventFactory *)self _shouldAttemptTracking])
        {
          if (self->_flags.sendingToNativeSlide
            && ![(VOTGestureEvent *)self->_currentGestureEvent isDownEvent])
          {
            id v24 = [(VOTGestureEvent *)self->_currentGestureEvent eventRepresentation];
            id v25 = [v24 copy];

            __int16 v26 = [v25 handInfo];
            unsigned int v27 = [v26 paths];
            unsigned int v28 = [v27 objectAtIndex:0];
            [v28 pathLocation];
            double v30 = v29;
            double v32 = v31;

            sub_1000C0B3C(v25, self->_nativeSlidingCenter.x + v30 - self->_nativeSlidingOffset.x, self->_nativeSlidingCenter.y + v32 - self->_nativeSlidingOffset.y);
            uint64_t v33 = +[VOTElement systemWideElement];
            [v33 repostEvent:v25];
          }
          if (!a4)
          {
            uint64_t v34 = +[VOTEvent touchEventWithCommand:kVOTEventCommandTracking info:0];
            [v6 firstFingerPressure];
            objc_msgSend(v34, "setTouchForce:");
            [v6 rawLocation];
            objc_msgSend(v34, "setTouchRawLocation:");
            [v6 rawLocation];
            [(VOTEventFactory *)self convertDevicePointToZoomedPoint:sub_100051E14(v35)];
            objc_msgSend(v34, "setTouchPoint:");
            [v34 setObject:self->_currentGestureEvent forIndex:108];
            [(VOTEventFactory *)self _updateFirstnessOfTrackingEvent:v34];
            [(VOTEventFactory *)self processEvent:v34];
          }
          if ([(VOTEventFactory *)self _isTapAndHoldPending]) {
            -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:", CGPointZero.x, CGPointZero.y);
          }
        }
        goto LABEL_42;
      }
      float v18 = v14;
      id v19 = VOTLogEvent();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        BOOL v39 = v15 > 1.0;
        [v6 firstFingerPressure];
        uint64_t v41 = v40;
        AXForceTouchThresholdPeek();
        BOOL isInPreview = self->_isInPreview;
        int64_t currentOrbGestureMode = self->_currentOrbGestureMode;
        double previewFingerStartingForce = self->_previewFingerStartingForce;
        int v46 = 134219776;
        double v47 = currentTouchForce;
        __int16 v48 = 2048;
        uint64_t v49 = v41;
        __int16 v50 = 1024;
        BOOL v51 = v39;
        __int16 v52 = 2048;
        uint64_t v53 = v45;
        __int16 v54 = 2048;
        double v55 = v18;
        __int16 v56 = 1024;
        BOOL v57 = isInPreview;
        __int16 v58 = 2048;
        int64_t v59 = currentOrbGestureMode;
        __int16 v60 = 2048;
        double v61 = previewFingerStartingForce;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Force touch: first value: %f (factory orb: %f) [pop delay: %d] (peek: %f), current pop: %f (inPreview: %d), gesture mode: %ld starting force: %f", (uint8_t *)&v46, 0x4Au);
      }

      AXForceTouchThresholdPeek();
      if (currentTouchForce > v20)
      {
        [v6 rawLocation];
        if (-[VOTEventFactory _isEdgePressSupportedAtPosition:](self, "_isEdgePressSupportedAtPosition:"))
        {
          [(VOTEventFactory *)self _simulateEdgePress];
          goto LABEL_42;
        }
      }
      AXForceTouchThresholdPeek();
      if (currentTouchForce <= v21 || self->_isInPreview)
      {
        if (currentTouchForce > v18 && self->_isInPreview && self->_currentOrbGestureMode == 2)
        {
          unsigned int v22 = VOTLogEvent();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            sub_10012171C();
          }

          [(VOTEventFactory *)self _simulatePop];
        }
        else if (currentTouchForce < self->_previewFingerStartingForce)
        {
          long long v23 = VOTLogEvent();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            sub_1001216E8();
          }

          [(VOTEventFactory *)self _reducePreviewFingerStartingForce:currentTouchForce];
        }
        goto LABEL_32;
      }
      v36 = [(VOTEventFactory *)self currentElement];
      unsigned int v37 = [v36 supportsDirectionOrbManipulation];

      if (v37)
      {
        v38 = VOTLogEvent();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          sub_1001216B4();
        }

        [(VOTEventFactory *)self _simulatePeekAndSwitchToTapHoldMode];
      }
    }
  }
LABEL_42:
}

- (void)_volumeChangeTimer
{
  unsigned int v3 = (id *)&kVOTEventCommandIncreaseVolume;
  float v4 = self->_volumeChangeDistance - self->_oldVolumeChangeDistance;
  if (v4 <= 0.0) {
    unsigned int v3 = (id *)&kVOTEventCommandDecreaseVolume;
  }
  id v5 = *v3;
  id v9 = [objc_allocWithZone((Class)AXIndexMap) init];
  *(float *)&double v6 = fabsf(v4);
  long long v7 = +[NSNumber numberWithFloat:v6];
  [v9 setObject:v7 forIndex:110];

  double v8 = +[VOTEvent internalEventWithCommand:v5 info:v9];
  [(VOTEventFactory *)self processEvent:v8];
  self->_oldVolumeChangeDistance = self->_volumeChangeDistance;
}

- (void)_systemControlLocationTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
  if ([WeakRetained allowsSystemControlEventForPosition:self->_systemControlPosition])
  {
    BOOL tapAndHoldMode = self->_flags.tapAndHoldMode;

    if (!tapAndHoldMode)
    {
      float v4 = +[VOTOutputManager outputManager];
      [v4 playSoundFast:@"Sounds/Edge.aiff"];

      self->_systemControlActivated = 1;
      self->_systemControlStartSwipeTime = -3061152000.0;
    }
  }
  else
  {
  }
}

- (int)_systemControlPosition:(CGPoint)a3 fingerCount:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(id)VOTSharedWorkspace deviceOrientation];
  int IsPad = AXDeviceIsPad();
  double v10 = 60.0;
  if (IsPad) {
    double v10 = 120.0;
  }
  if (x >= 20.0 || fabs(y + *((double *)&xmmword_1001EBE30 + 1) * -0.5) >= v10)
  {
    if (x <= *(double *)&xmmword_1001EBE30 + -20.0 || fabs(y + *((double *)&xmmword_1001EBE30 + 1) * -0.5) >= v10)
    {
      if (y >= 20.0 || fabs(x + *(double *)&xmmword_1001EBE30 * -0.5) >= v10)
      {
        if (y <= *((double *)&xmmword_1001EBE30 + 1) + -20.0 || fabs(x + *(double *)&xmmword_1001EBE30 * -0.5) >= v10) {
          int v11 = 0;
        }
        else {
          int v11 = 2;
        }
      }
      else
      {
        int v11 = 1;
      }
    }
    else
    {
      int v11 = 4;
    }
  }
  else
  {
    int v11 = 3;
  }
  if (v8 == (id)4)
  {
    int v12 = v11 - 1;
    if ((v11 - 1) > 3) {
      goto LABEL_26;
    }
    double v13 = &unk_10016E9A0;
  }
  else if (v8 == (id)3)
  {
    int v12 = v11 - 1;
    if ((v11 - 1) >= 4) {
      goto LABEL_26;
    }
    double v13 = &unk_10016E990;
  }
  else
  {
    if (v8 != (id)2) {
      goto LABEL_26;
    }
    int v12 = v11 - 1;
    if ((v11 - 1) >= 4) {
      goto LABEL_26;
    }
    double v13 = &unk_10016E980;
  }
  int v11 = v13[v12];
LABEL_26:
  if (a4 == 1) {
    unsigned int v14 = v11;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v11 == 1 && a4 == 2) {
    uint64_t v16 = 5;
  }
  else {
    uint64_t v16 = v14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
  unsigned int v18 = [WeakRetained allowsSystemControlEventForPosition:v16];

  if (v18) {
    return v16;
  }
  else {
    return 0;
  }
}

- (void)_sendSystemControlEvent:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  switch(self->_systemControlPosition)
  {
    case 1:
      id v5 = &kVOTEventCommandSystemShowNotificationCenter;
      goto LABEL_8;
    case 2:
      id v5 = &kVOTEventCommandSystemShowControlCenter;
      goto LABEL_8;
    case 3:
      id v5 = &kVOTEventCommandSystemControlLeft;
      goto LABEL_8;
    case 4:
      id v5 = &kVOTEventCommandSystemControlRight;
      goto LABEL_8;
    case 5:
      id v5 = &kVOTEventCommandSystemControlTwoTop;
LABEL_8:
      [v4 setCommand:*v5];
      break;
    default:
      _AXAssert();
      break;
  }
  [(VOTEventFactory *)self processEvent:v6];
  self->_systemControlActivated = 0;
}

- (void)_resetSystemControlStatus
{
  self->_systemControlStartPoint = CGPointZero;
  self->_systemControlActivated = 0;
  *(_OWORD *)&self->_systemControlStartSwipeTime = xmmword_10016E950;
}

- (CGPoint)_averagePointForLastDownEvent
{
  id v2 = [(VOTGestureEvent *)self->_lastDownEvent eventRepresentation];
  unsigned int v3 = [v2 handInfo];
  id v4 = [v3 paths];

  double x = CGPointZero.x;
  double y = CGPointZero.y;
  id v7 = [v4 count];
  if (v7)
  {
    unint64_t v8 = (unint64_t)v7;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned int v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "pathLocation", (void)v19);
          double x = x + v15;
          [v14 pathLocation];
          double y = y + v16;
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    double x = x / (double)v8;
    double y = y / (double)v8;
  }

  double v17 = x;
  double v18 = y;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (BOOL)_updateFingersInSystemControlLocation:(CGPoint)a3 fingerCount:(unint64_t)a4 isLift:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v8 = [(VOTEventFactory *)self _systemControlPosition:a4 fingerCount:a5];
  int v9 = v8;
  if (!self->_systemControlActivated)
  {
    if (!v8)
    {
      double v23 = CGPointZero.y;
      if (CGPointZero.x != self->_systemControlStartPoint.x || v23 != self->_systemControlStartPoint.y) {
        [(VOTEventFactory *)self _resetSystemControlStatus];
      }
      return 0;
    }
LABEL_13:
    if ([(SCRCTargetSelectorTimer *)self->_systemControlLocationTimer isPending]
      && ([(SCRCTargetSelectorTimer *)self->_systemControlLocationTimer isCancelled] & 1) == 0)
    {
      SCRCMathGetDistanceBetweenPoints();
      if (v25 > 20.0)
      {
        self->_systemControlStartPoint = CGPointZero;
        self->_int systemControlPosition = 0;
        [(SCRCTargetSelectorTimer *)self->_systemControlLocationTimer cancel];
      }
    }
    else
    {
      [(VOTEventFactory *)self _averagePointForLastDownEvent];
      SCRCMathGetDistanceBetweenPoints();
      if (v14 <= 30.0)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        [(VOTGestureEvent *)self->_lastDownEvent time];
        if (Current - v16 <= 1.75)
        {
          double v17 = [(VOTEventFactory *)self currentElement];
          unsigned int v18 = [v17 doesHaveTraits:kAXKeyboardKeyTrait];
          [v17 frame];
          if (!v18 || (v33.double x = x, v33.y = y, !CGRectContainsPoint(*(CGRect *)&v19, v33)))
          {
            if (!self->_systemControlActivated)
            {
              self->_systemControlStartPoint.double x = x;
              self->_systemControlStartPoint.double y = y;
              self->_int systemControlPosition = v9;
              [(SCRCTargetSelectorTimer *)self->_systemControlLocationTimer dispatchAfterDelay:self->_systemControlFingerDownFollowupTime];
            }
          }
        }
      }
    }
    return 0;
  }
  if (self->_systemControlStartSwipeTime == -3061152000.0) {
    self->_systemControlStartSwipeTime = CFAbsoluteTimeGetCurrent();
  }
  uint64_t v31 = 0;
  SCRCMathGetVectorAndDistanceForPoints();
  if (0.0 <= 37.5 || CFAbsoluteTimeGetCurrent() - self->_systemControlStartSwipeTime >= 0.65)
  {
    if (CFAbsoluteTimeGetCurrent() - self->_systemControlStartSwipeTime <= 0.65) {
      return 0;
    }
    [(VOTEventFactory *)self _resetSystemControlStatus];
    goto LABEL_13;
  }
  id v10 = (char *)[(id)VOTSharedWorkspace deviceOrientation];
  double v11 = 0.0;
  if ((unint64_t)(v10 - 2) <= 2) {
    double v11 = dbl_10016E9C0[(void)(v10 - 2)];
  }
  double v12 = v11 + 0.0;
  double v32 = v12;
  double v13 = 360.0;
  if (v12 <= 360.0)
  {
    if (v12 >= 0.0) {
      goto LABEL_31;
    }
  }
  else
  {
    double v13 = -360.0;
  }
  double v12 = v12 + v13;
  double v32 = v12;
LABEL_31:
  int systemControlPosition = self->_systemControlPosition;
  switch(systemControlPosition)
  {
    case 1:
    case 5:
      if (fabs(v12 + -270.0) < 20.0) {
        goto LABEL_43;
      }
      if (systemControlPosition != 3)
      {
        if (systemControlPosition != 4) {
          return 0;
        }
LABEL_35:
        if (v12 <= 340.0 && v12 >= 20.0) {
          return 0;
        }
LABEL_43:
        double v30 = +[VOTEvent touchEventWithCommand:info:](VOTEvent, "touchEventWithCommand:info:", kVOTEventCommandTracking, 0, *(void *)&v32);
        objc_msgSend(v30, "setTouchPoint:", x, y);
        [v30 setObject:self->_currentGestureEvent forIndex:108];
        [(VOTEventFactory *)self _sendSystemControlEvent:v30];

        return 1;
      }
LABEL_40:
      double v29 = -180.0;
LABEL_42:
      if (fabs(v12 + v29) < 20.0) {
        goto LABEL_43;
      }
      break;
    case 2:
      double v29 = -90.0;
      goto LABEL_42;
    case 3:
      goto LABEL_40;
    case 4:
      goto LABEL_35;
    default:
      return 0;
  }
  return 0;
}

- (BOOL)shouldBlockSplitTapGestureWithFactory:(id)a3
{
  return 0;
}

- (void)gestureSplitTappingCallbackWithFactory:(id)a3
{
  id v15 = a3;
  id v4 = [(VOTEventFactory *)self _currentGesturedTextInputManager];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    unsigned __int8 v5 = [(VOTEventFactory *)self _shouldUseGesturedTextInputManager];

    id v6 = v15;
    if (v5) {
      goto LABEL_5;
    }
  }
  [v15 rawLocation];
  [(VOTEventFactory *)self convertDevicePointToZoomedPoint:sub_100051E14(v7)];
  double v9 = v8;
  double v11 = v10;
  id v12 = [objc_allocWithZone((Class)AXIndexMap) init];
  double v13 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v9, v11);
  [v12 setObject:v13 forIndex:101];

  double v14 = +[VOTEvent touchEventWithCommand:kVOTEventCommandSplitTapTap info:v12];
  [(VOTEventFactory *)self processEvent:v14];

  id v6 = v15;
LABEL_5:
}

- (void)gestureFactoryDidBeginSplitGesture:(id)a3
{
  if (!self->_flags.splitSlide)
  {
    id v4 = VOTLogEvent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100121784();
    }

    unsigned __int8 v5 = [(VOTEventFactory *)self _currentGesturedTextInputManager];
    [v5 eventFactoryDidBeginSplitGesture:self];
  }
}

- (id)_handleGestureKeyboardTappingCallback:(unint64_t)a3 fingerCount:(unint64_t)a4 isDown:(BOOL)a5 originalLocation:(CGPoint)a6 convertedLocation:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  double v9 = a6.y;
  double v10 = a6.x;
  id v15 = +[VOTWorkspace sharedWorkspace];
  double v16 = [v15 userCommandManager];

  double v17 = [(VOTEventFactory *)self directInteractionKeyboardManager];
  [v17 gestureKeyboardRegion];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  if (a3 == 1 && a4 == 1)
  {
    v32.origin.CGFloat x = v19;
    v32.origin.CGFloat y = v21;
    v32.size.width = v23;
    v32.size.height = v25;
    v31.CGFloat x = x;
    v31.CGFloat y = y;
    if (CGRectContainsPoint(v32, v31))
    {
      __int16 v26 = +[VOTEvent touchEventWithCommand:kVOTEventCommandGestureTypingType info:0];
    }
    else
    {
      __int16 v26 = 0;
    }
  }
  else
  {
    __int16 v26 = 0;
    if (a3 == 2 && a4 == 2 && !a5)
    {
      unsigned int v27 = +[VOSGesture TwoFingerDoubleTap];
      unsigned int v28 = [(VOTEventFactory *)self _commandResolver];
      __int16 v26 = [v16 eventForTouchGesture:v27 resolver:v28];
    }
  }
  objc_msgSend(v26, "setTouchPoint:", v10, v9);

  return v26;
}

- (BOOL)_isStylusGesture
{
  return 1;
}

- (void)gestureTappingCallbackWithFactory:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = VOTLogEvent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001217F8(v4, v5);
  }

  id v6 = +[VOTWorkspace sharedWorkspace];
  double v7 = [v6 userCommandManager];

  [v4 rawLocation];
  [(VOTEventFactory *)self convertDevicePointToZoomedPoint:sub_100051E14(v8)];
  double v10 = v9;
  double v12 = v11;
  [v4 firstFingerPressure];
  double v14 = v13;
  id v15 = (char *)[v4 tapCount] + self->_watchWakeTapCount;
  BOOL v16 = self->_delayUntilSpeakInterval > 0.001 && v15 == (char *)1;
  if (v16 && [v4 fingerCount] == (id)1)
  {
    double v17 = VOTLogEvent();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = +[NSNumber numberWithDouble:self->_delayUntilSpeakInterval];
      *(_DWORD *)v87 = 138412290;
      *(void *)&v87[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ignoring tap because tap to speak is set to %@", v87, 0xCu);
    }
    goto LABEL_153;
  }
  id v19 = [v4 tapIsDown];
  -[VOTEventFactory _setFingerCount:](self, "_setFingerCount:", [v4 fingerCount]);
  if (self->_flags.tapAndHoldMode
    && [(VOTEventFactory *)self _tapAndHoldModeIsForScribble]
    && [(VOTEventFactory *)self _isStylusGesture])
  {
    double v17 = VOTLogEvent();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v87 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Scribble: Ignoring tapping callback for stylus, because scribble was in progress.", v87, 2u);
    }
    goto LABEL_153;
  }
  -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:", CGPointZero.x, CGPointZero.y);
  double v20 = [(VOTEventFactory *)self _currentGesturedTextInputManager];
  double v17 = v20;
  if (v20
    && ([v20 processTapWithFingerCount:self->_fingerCount] & 1) != 0)
  {
    goto LABEL_153;
  }
  unsigned int v21 = [(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager inDirectInteractionTypingMode];
  double v22 = +[VOTElement systemWideElement];
  CGFloat v23 = [(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager keyboardElement];
  objc_msgSend(v22, "convertPoint:toContextId:", objc_msgSend(v23, "windowContextId"), v10, v12);
  double v25 = v24;
  double v27 = v26;

  if (v21)
  {
    [(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager gestureKeyboardRegion];
    v92.CGFloat x = v25;
    v92.CGFloat y = v27;
    if (CGRectContainsPoint(v93, v92)
      && (![(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager isEmojiKeyboard]|| [(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager isEmojiKey]))
    {
      uint64_t v28 = -[VOTEventFactory _handleGestureKeyboardTappingCallback:fingerCount:isDown:originalLocation:convertedLocation:](self, "_handleGestureKeyboardTappingCallback:fingerCount:isDown:originalLocation:convertedLocation:", v15, self->_fingerCount, v19, v10, v12, v25, v27);
      if (v28)
      {
        double v29 = (void *)v28;
        double v30 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v25, v27);
        [v29 setObject:v30 forIndex:115];

        [(VOTEventFactory *)self processEvent:v29];
        goto LABEL_153;
      }
    }
  }
  if (v15 == (char *)1)
  {
    int64_t fingerCount = self->_fingerCount;
    if (fingerCount != 3)
    {
      if (fingerCount != 2)
      {
        if (fingerCount == 1)
        {
          if (self->_flags.sendingToNativeSlide) {
            goto LABEL_153;
          }
          CGRect v32 = +[VOTEvent touchEventWithCommand:kVOTEventCommandTracking info:0];
          -[NSObject setTouchPoint:](v32, "setTouchPoint:", v10, v12);
          [v4 rawLocation];
          -[NSObject setTouchRawLocation:](v32, "setTouchRawLocation:");
          [v32 setTouchForce:v14];
          if (v32) {
            [(VOTEventFactory *)self processEvent:v32];
          }
          [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
          [(VOTEventFactory *)self _processIdle:sub_100051E14(v33)];
          goto LABEL_148;
        }
        if (fingerCount == 4) {
          char v47 = (char)v19;
        }
        else {
          char v47 = 1;
        }
        if (v47) {
          goto LABEL_149;
        }
        __int16 v48 = +[VOSGesture FourFingerSingleTap];
        uint64_t v49 = [(VOTEventFactory *)self _commandResolver];
        CGRect v32 = [v7 eventForTouchGesture:v48 resolver:v49];

        if (v32) {
          goto LABEL_147;
        }
        [v4 tapPoint];
        -[VOTEventFactory adjustedPointForFactoryPoint:forOrientation:](self, "adjustedPointForFactoryPoint:forOrientation:", [v4 orientation], v50, v51);
        double v53 = v52;
        double v55 = v54;
        if (AXDeviceIsPad() && fabs(v55 + -0.5) <= fabs(v53 + -0.5))
        {
          if (v53 >= 0.5) {
            __int16 v56 = &kVOTEventCommandRightElementCommunity;
          }
          else {
            __int16 v56 = &kVOTEventCommandLeftElementCommunity;
          }
        }
        else if (v55 >= 0.5)
        {
          __int16 v56 = &kVOTEventCommandLastElement;
        }
        else
        {
          __int16 v56 = &kVOTEventCommandFirstElement;
        }
        goto LABEL_158;
      }
      if (v19) {
        goto LABEL_149;
      }
      if ([(VOTEventFactory *)self _twoFingersDistant:v4]) {
        +[VOSGesture TwoDistantFingerSingleTap];
      }
      else {
        +[VOSGesture TwoFingerSingleTap];
      }
      goto LABEL_51;
    }
    if (self->_flags.firedElementSummaryTimer)
    {
      if (v19) {
        goto LABEL_149;
      }
      CGRect v32 = 0;
LABEL_121:
      self->_flags.firedElementSummaryTimer = 0;
      if (!v32) {
        goto LABEL_149;
      }
      goto LABEL_147;
    }
    elementSummaryTimer = self->_elementSummaryTimer;
    if ((v19 & 1) == 0)
    {
      [(SCRCTargetSelectorTimer *)elementSummaryTimer cancel];
      v71 = +[VOSGesture ThreeFingerSingleTap];
      id v72 = [(VOTEventFactory *)self _commandResolver];
      CGRect v32 = [v7 eventForTouchGesture:v71 resolver:v72];

      goto LABEL_121;
    }
    if ([(SCRCTargetSelectorTimer *)elementSummaryTimer isPending]
      && ![(SCRCTargetSelectorTimer *)self->_elementSummaryTimer isCancelled])
    {
      goto LABEL_149;
    }
    threeFingerHoldTimer = self->_elementSummaryTimer;
    double v68 = 0.5;
LABEL_110:
    [(SCRCTargetSelectorTimer *)threeFingerHoldTimer dispatchAfterDelay:v68];
    goto LABEL_149;
  }
  if (v15 == (char *)4)
  {
    int64_t v39 = self->_fingerCount;
    if (v39 != 1)
    {
      if (v39 == 3) {
        char v57 = (char)v19;
      }
      else {
        char v57 = 1;
      }
      if (v57)
      {
        if (v39 == 2) {
          char v58 = (char)v19;
        }
        else {
          char v58 = 1;
        }
        if (v58)
        {
          if (v39 == 4) {
            char v59 = (char)v19;
          }
          else {
            char v59 = 1;
          }
          if (v59) {
            goto LABEL_149;
          }
          uint64_t v38 = +[VOSGesture FourFingerQuadrupleTap];
        }
        else
        {
          uint64_t v38 = +[VOSGesture TwoFingerQuadrupleTap];
        }
      }
      else
      {
        uint64_t v38 = +[VOSGesture ThreeFingerQuadrupleTap];
      }
      goto LABEL_145;
    }
    if (v19) {
      goto LABEL_149;
    }
    id v40 = [objc_allocWithZone((Class)AXIndexMap) init];
    uint64_t v41 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v10, v12);
    [v40 setObject:v41 forIndex:101];

    uint64_t v42 = +[VOSGesture OneFingerQuadrupleTap];
    goto LABEL_137;
  }
  if (v15 != (char *)3)
  {
    if (v15 != (char *)2) {
      goto LABEL_149;
    }
    int64_t v34 = self->_fingerCount;
    if (v34 == 3)
    {
      if ((v19 & 1) == 0)
      {
        uint64_t v38 = +[VOSGesture ThreeFingerDoubleTap];
        goto LABEL_145;
      }
      if (!AXDeviceIsPad()) {
        goto LABEL_149;
      }
      [(SCRCTargetSelectorTimer *)self->_elementSummaryTimer cancel];
      [(SCRCTargetSelectorTimer *)self->_threeFingerHoldTimer cancel];
      self->_flags.memorizingData = 1;
      threeFingerHoldTimer = self->_threeFingerHoldTimer;
      double v68 = 0.25;
      goto LABEL_110;
    }
    if (v34 == 2)
    {
      if ([(VOTEventFactory *)self _twoFingersDistant:v4])
      {
        if (v19) {
          goto LABEL_149;
        }
        uint64_t v38 = +[VOSGesture TwoDistantFingerDoubleTap];
      }
      else
      {
        v77 = +[VOTCommandHelper commandHelper];
        unsigned int v78 = [v77 helpEnabled];

        if (v78)
        {
          if (v19)
          {
            __int16 v56 = &kVOTEventCommandLabelElement;
LABEL_158:
            uint64_t v75 = +[VOTEvent touchEventWithCommand:*v56 info:0];
LABEL_159:
            CGRect v32 = v75;
            if (!v75) {
              goto LABEL_149;
            }
            goto LABEL_147;
          }
        }
        else
        {
          if (v19)
          {
            [(SCRCTargetSelectorTimer *)self->_twoFingerHoldTimer cancel];
            self->_flags.memorizingData = 1;
            self->_flags.didPlayStartLabelSound = 0;
            [(VOTEventFactory *)self performSelector:"_startLabelElementSoundPlay" withObject:0 afterDelay:0.25];
            [(SCRCTargetSelectorTimer *)self->_twoFingerHoldTimer dispatchAfterDelay:1.5];
            self->_flags.twoFingerTapAndSlide = 1;
            self->_oldVolumeChangeDistance = 0.0;
            goto LABEL_149;
          }
          [(VOTEventFactory *)self _stopMemorizingSession];
        }
        uint64_t v38 = +[VOSGesture TwoFingerDoubleTap];
      }
      goto LABEL_145;
    }
    if (v34 != 1)
    {
      if (v34 == 4) {
        char v69 = (char)v19;
      }
      else {
        char v69 = 1;
      }
      if (v69)
      {
        if (v34 == 5) {
          char v70 = (char)v19;
        }
        else {
          char v70 = 1;
        }
        if (v70) {
          goto LABEL_149;
        }
        uint64_t v38 = +[VOSGesture FiveFingerDoubleTap];
      }
      else
      {
        uint64_t v38 = +[VOSGesture FourFingerDoubleTap];
      }
      goto LABEL_145;
    }
    if (v19)
    {
      [v4 multiTapFrame];
      if (!v17 && v35 < 0.330000013 && v36 < 0.330000013)
      {
        [v4 tapInterval];
        if (v37 > 0.100000001 && self->_travelDistance < 0.100000001) {
          [(SCRCTargetSelectorTimer *)self->_tapHoldTimer dispatchAfterDelay:&__kCFBooleanTrue withObject:0.5];
        }
      }
      goto LABEL_149;
    }
    v73 = +[VOTWorkspace sharedWorkspace];
    unsigned int v74 = [v73 voiceOverIsIdle];

    if (v74)
    {
      int v46 = &kVOTEventCommandWatchWakeDoubleTap;
      goto LABEL_125;
    }
    id v40 = [objc_allocWithZone((Class)AXIndexMap) init];
    v79 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v10, v12);
    [v40 setObject:v79 forIndex:101];

    *(float *)&double v80 = v14;
    v81 = +[NSNumber numberWithFloat:v80];
    [v40 setObject:v81 forIndex:111];

    uint64_t v42 = +[VOSGesture OneFingerDoubleTap];
    goto LABEL_137;
  }
  int64_t v43 = self->_fingerCount;
  if (v43 == 1)
  {
    if (v19) {
      goto LABEL_149;
    }
    double v44 = +[VOTWorkspace sharedWorkspace];
    unsigned int v45 = [v44 voiceOverIsIdle];

    if (v45)
    {
      int v46 = &kVOTEventCommandWatchWakeTripleTap;
LABEL_125:
      uint64_t v75 = +[VOTEvent internalEventWithCommand:*v46 info:0];
      goto LABEL_159;
    }
    id v40 = [objc_allocWithZone((Class)AXIndexMap) init];
    v76 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v10, v12);
    [v40 setObject:v76 forIndex:101];

    uint64_t v42 = +[VOSGesture OneFingerTripleTap];
LABEL_137:
    objc_super v82 = (void *)v42;
    v83 = [(VOTEventFactory *)self _commandResolver];
    CGRect v32 = [v7 eventForTouchGesture:v82 resolver:v83 info:v40];

    goto LABEL_146;
  }
  if (v43 == 3) {
    char v60 = (char)v19;
  }
  else {
    char v60 = 1;
  }
  if ((v60 & 1) == 0)
  {
    uint64_t v38 = +[VOSGesture ThreeFingerTripleTap];
    goto LABEL_145;
  }
  if (v43 == 2) {
    char v61 = (char)v19;
  }
  else {
    char v61 = 1;
  }
  if (v61)
  {
    if (v43 == 4) {
      char v62 = (char)v19;
    }
    else {
      char v62 = 1;
    }
    if (v62) {
      goto LABEL_149;
    }
    id v63 = +[VOSGesture FourFingerTripleTap];
    v64 = [(VOTEventFactory *)self _commandResolver];
    CGRect v32 = [v7 eventForTouchGesture:v63 resolver:v64];

    if (v32) {
      goto LABEL_147;
    }
    if ([(id)VOTSharedWorkspace isInternalInstall])
    {
      pid_t v65 = AXPidForLaunchLabel();
      if (v65 < 0)
      {
        CGRect v32 = VOTLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_1001217B8();
        }
        goto LABEL_148;
      }
      kill(v65, 15);
    }
    goto LABEL_149;
  }
  if ([(VOTEventFactory *)self _twoFingersDistant:v4]) {
    +[VOSGesture TwoDistantFingerTripleTap];
  }
  else {
    +[VOSGesture TwoFingerTripleTap];
  }
  uint64_t v38 = LABEL_51:;
LABEL_145:
  id v40 = (id)v38;
  objc_super v82 = [(VOTEventFactory *)self _commandResolver];
  CGRect v32 = [v7 eventForTouchGesture:v40 resolver:v82];
LABEL_146:

  if (v32)
  {
LABEL_147:
    [(VOTEventFactory *)self processEvent:v32];
LABEL_148:
  }
LABEL_149:
  v84 = VOTLogEvent();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
  {
    int64_t v85 = self->_fingerCount;
    CFStringRef v86 = @"UP";
    *(_DWORD *)v87 = 134218498;
    if (v19) {
      CFStringRef v86 = @"DOWN";
    }
    *(void *)&v87[4] = v85;
    __int16 v88 = 2048;
    v89 = v15;
    __int16 v90 = 2114;
    CFStringRef v91 = v86;
    _os_log_debug_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "fingerCount: %ld tapCount: %ld %{public}@", v87, 0x20u);
  }

  if ((v19 & 1) == 0) {
    [(VOTEventFactory *)self _setFingerCount:0];
  }
  [(SCRCTargetSelectorTimer *)self->_wakeTapTimer cancel];
  self->_unint64_t watchWakeTapCount = 0;
  [(NSMutableArray *)self->_snarfedWatchWakeRecords removeAllObjects];
LABEL_153:
}

- (BOOL)_twoFingersDistant:(id)a3
{
  id v3 = a3;
  [v3 rawLocation];
  double v5 = v4;
  double v7 = v6;
  [v3 rawAverageLocation];
  double v9 = v8;
  double v11 = v10;

  double v12 = vabdd_f64(v7, v11);
  double v13 = v12 + v12;
  int IsPad = AXDeviceIsPad();
  double v15 = vabdd_f64(v5, v9);
  BOOL v16 = v15 + v15 > 0.5 || v13 > 0.5;
  if (IsPad) {
    return v16;
  }
  else {
    return v13 > 0.5;
  }
}

- (CGPoint)adjustedPointForFactoryPoint:(CGPoint)a3 forOrientation:(int64_t)a4
{
  double v4 = 1.0 - a3.x;
  if (a4 == 1) {
    double y = 1.0 - a3.y;
  }
  else {
    double y = a3.y;
  }
  if (a4 == 1) {
    double x = 1.0 - a3.x;
  }
  else {
    double x = a3.x;
  }
  if (a4 == 2)
  {
    double v7 = 1.0 - a3.y;
  }
  else
  {
    a3.double x = y;
    double v7 = x;
  }
  if (a4 == 3) {
    double v8 = v4;
  }
  else {
    double v8 = a3.x;
  }
  if (a4 == 3) {
    double v9 = a3.y;
  }
  else {
    double v9 = v7;
  }
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_feedEventToHandwritingRecognition:(id)a3
{
  id v4 = a3;
  double v5 = [(VOTEventFactory *)self _currentGesturedTextInputManager];
  double v6 = [(VOTEventFactory *)self handwritingManager];
  if (v5 != v6 || (unint64_t)[v4 fingerCount] > 1)
  {

LABEL_4:
    double v7 = [(VOTEventFactory *)self _handwritingCaptureTimer];
    [v7 cancel];
    goto LABEL_5;
  }
  unsigned __int8 v8 = [v4 isCancelEvent];

  if (v8) {
    goto LABEL_4;
  }
  double v7 = [(VOTEventFactory *)self handwritingManager];
  if (![v4 isLiftEvent])
  {
    double v11 = [(VOTEventFactory *)self _handwritingCaptureTimer];
    [v11 cancel];

    double v12 = [v4 eventRepresentation];
    double v13 = [v12 handInfo];
    double v14 = [v13 paths];
    double v15 = [v14 firstPath];
    [v15 pathLocation];
    double v17 = v16;
    double v19 = v18;

    double v20 = [(VOTEventFactory *)self handwritingManager];
    objc_msgSend(v20, "addPointToSession:", v17, v19);

    if ([v7 state])
    {
      if ([v7 state] != 2)
      {
LABEL_16:

        goto LABEL_5;
      }
      uint64_t v21 = 4;
    }
    else
    {
      uint64_t v21 = 1;
    }
    [v7 setState:v21];
    goto LABEL_16;
  }
  [v7 endCurrentStroke];
  double v9 = [(VOTEventFactory *)self _handwritingCaptureTimer];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C6924;
  v22[3] = &unk_1001B33B8;
  id v10 = v7;
  id v23 = v10;
  [v9 afterDelay:v22 processBlock:0.25];

  if ([v10 state] == 1) {
    [v10 setState:2];
  }

LABEL_5:
}

- (BOOL)_shouldUseGesturedTextInputManager
{
  id v2 = [(VOTEventFactory *)self _currentGesturedTextInputManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_handleDirectInteractionEvent:(id)a3
{
  id v4 = (VOTGestureEvent *)a3;
  if ([(VOTEventFactory *)self _willStartEdgePanGestureForEvent:v4]
    || self->_edgePanGestureState
    || ([(VOTEventFactory *)self directInteractionKeyboardManager],
        double v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 inDirectInteractionTypingMode],
        v5,
        (v6 & 1) != 0)
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_directTouchManager),
        unsigned int v8 = [WeakRetained inDirectTouchMode],
        WeakRetained,
        !v8))
  {
    LOBYTE(v10) = 0;
    goto LABEL_51;
  }
  double v9 = self->_directInteractionElements;
  if (![(NSArray *)v9 count])
  {
    LOBYTE(v10) = 0;
    goto LABEL_61;
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obj = v9;
  id v10 = [(NSArray *)obj countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (!v10) {
    goto LABEL_60;
  }
  char v69 = v9;
  id location = (id *)&self->_directTouchManager;
  char v11 = 0;
  uint64_t v72 = *(void *)v82;
LABEL_8:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v82 != v72) {
      objc_enumerationMutation(obj);
    }
    double v13 = *(void **)(*((void *)&v81 + 1) + 8 * v12);
    [v13 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = +[VOTElement systemWideElement];
    objc_msgSend(v22, "convertRect:fromContextId:", objc_msgSend(v13, "windowContextId"), v15, v17, v19, v21);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    BOOL sendingToDirectTouch = self->_flags.sendingToDirectTouch;
    if (([v13 directTouchOptions] & 2) == 0
      || [v13 activatedDirectTouchThatRequiredActivation])
    {
      if (sendingToDirectTouch)
      {
        int v32 = 1;
      }
      else if ([(VOTGestureEvent *)v4 isDownEvent] {
             || (id v40 = objc_loadWeakRetained(location),
      }
                 unsigned int v41 = [v40 shouldTurnTrackingIntoDirectTouch],
                 v40,
                 v41))
      {
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        uint64_t v42 = [(VOTGestureEvent *)v4 fingers];
        id v43 = [v42 countByEnumeratingWithState:&v77 objects:v86 count:16];
        if (v43)
        {
          id v44 = v43;
          uint64_t v45 = *(void *)v78;
          while (2)
          {
            for (i = 0; i != v44; i = (char *)i + 1)
            {
              if (*(void *)v78 != v45) {
                objc_enumerationMutation(v42);
              }
              [*(id *)(*((void *)&v77 + 1) + 8 * i) location];
              v89.double x = sub_100051E14(v47);
              v89.double y = v48;
              v91.origin.double x = v24;
              v91.origin.double y = v26;
              v91.size.width = v28;
              v91.size.height = v30;
              if (CGRectContainsPoint(v91, v89))
              {
                uint64_t v49 = [(VOTEventFactory *)self currentElement];
                unsigned __int8 v50 = [v49 isEqual:v13];

                if ((v50 & 1) == 0)
                {
                  id v51 = objc_loadWeakRetained(location);
                  [v51 setDirectInteractionElement:v13];
                }
                [(VOTEventFactory *)self setLastTouchedDirectTouchElement:v13];
                int v32 = 1;
                goto LABEL_45;
              }
            }
            id v44 = [v42 countByEnumeratingWithState:&v77 objects:v86 count:16];
            if (v44) {
              continue;
            }
            break;
          }
        }
        int v32 = 0;
LABEL_45:

        id v52 = objc_loadWeakRetained(location);
        unsigned int v53 = [v52 shouldTurnTrackingIntoDirectTouch];

        if (v53)
        {
          double v54 = self->_lastDownEvent;

          id v55 = objc_loadWeakRetained(location);
          [v55 setShouldTurnTrackingIntoDirectTouch:0];

          id v4 = v54;
        }
      }
      else
      {
        int v32 = 0;
      }
      if (v11)
      {
LABEL_38:
        char v11 = 1;
      }
      else
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        double v33 = [(VOTGestureEvent *)v4 fingers];
        id v34 = [v33 countByEnumeratingWithState:&v73 objects:v85 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v74;
          while (2)
          {
            for (j = 0; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v74 != v36) {
                objc_enumerationMutation(v33);
              }
              [*(id *)(*((void *)&v73 + 1) + 8 * (void)j) location];
              v88.double x = sub_100051E14(v38);
              v88.double y = v39;
              v90.origin.double x = v24;
              v90.origin.double y = v26;
              v90.size.width = v28;
              v90.size.height = v30;
              if (CGRectContainsPoint(v90, v88))
              {
                [(VOTEventFactory *)self setLastTouchedDirectTouchElement:v13];

                goto LABEL_38;
              }
            }
            id v35 = [v33 countByEnumeratingWithState:&v73 objects:v85 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }

        char v11 = 0;
        if (!v32) {
          goto LABEL_40;
        }
      }
      if (!self->_flags.allowingSystemGesturePassthrough) {
        break;
      }
    }
LABEL_40:
    if ((id)++v12 == v10)
    {
      id v56 = [(NSArray *)obj countByEnumeratingWithState:&v81 objects:v87 count:16];
      id v10 = v56;
      if (!v56)
      {
        double v9 = v69;
        goto LABEL_60;
      }
      goto LABEL_8;
    }
  }
  id v58 = objc_loadWeakRetained((id *)&self->_elementManager);
  char v59 = [v58 currentElement];

  if ([(NSArray *)self->_directInteractionElements containsObject:v59])
  {
    double v9 = v69;
  }
  else
  {
    directInteractionElements = self->_directInteractionElements;
    char v61 = [(VOTEventFactory *)self lastTouchedDirectTouchElement];
    LODWORD(directInteractionElements) = [(NSArray *)directInteractionElements containsObject:v61];

    double v9 = v69;
    if (directInteractionElements)
    {
      [(VOTEventFactory *)self lastTouchedDirectTouchElement];
    }
    else
    {
      LOBYTE(v68) = 1;
      _AXLogWithFacility();
      [(NSArray *)self->_directInteractionElements firstObject];
    uint64_t v62 = };

    char v59 = (void *)v62;
  }
  id v63 = [v59 windowContextId];
  v64 = [(VOTGestureEvent *)v4 eventRepresentation];
  [v64 setContextId:v63];

  id v10 = [(VOTGestureEvent *)v4 eventRepresentation];
  [v10 setSenderID:0x8000000817319373];

  pid_t v65 = +[AXBackBoardServer server];
  v66 = [(VOTGestureEvent *)v4 eventRepresentation];
  LOBYTE(v10) = 1;
  v67 = [v66 normalizedEventRepresentation:0 scale:1];
  [v65 postEvent:v67 systemEvent:0];

  self->_flags.BOOL sendingToDirectTouch = 1;
LABEL_60:

LABEL_61:
LABEL_51:

  return (char)v10;
}

- (BOOL)directTouchElementsPresent
{
  return [(NSArray *)self->_directInteractionElements count] != 0;
}

- (BOOL)_gestureEventIsInvalid:(id)a3
{
  id v4 = a3;
  if ([v4 isLiftEvent])
  {
    if (!self->_flags.gestureSawDownEvent)
    {
      unsigned __int8 v5 = 1;
      goto LABEL_9;
    }
    self->_flags.gestureSawDownEvent = 0;
  }
  if (([v4 isDownEvent] & 1) != 0 || objc_msgSend(v4, "isMovedEvent")) {
    self->_flags.gestureSawDownEvent = 1;
  }
  unsigned __int8 v5 = [v4 isNonLiftingInRangeEvent];
LABEL_9:

  return v5;
}

- (void)updateOrientation
{
  id v2 = [(VOTEventFactory *)self directInteractionKeyboardManager];
  [v2 updateKeyboardElement];
}

- (id)_touchLocationsForGestureEvent:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableDictionary dictionary];
  if (([v4 isLiftEvent] & 1) == 0
    && ([v4 isCancelEvent] & 1) == 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v4;
    unsigned __int8 v6 = [v4 eventRepresentation];
    double v7 = [v6 handInfo];
    unsigned int v8 = [v7 paths];

    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v13 pathLocation];
          double v16 = +[NSValue valueWithPoint:sub_100051FD4((uint64_t)[(SCRCGestureFactory *)self->_gestureFactory orientation], v14, v15)];
          double v17 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v13 pathIndex]);
          [v5 setObject:v16 forKeyedSubscript:v17];
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v4 = v19;
  }

  return v5;
}

- (BOOL)_handleOrbEvent:(id)a3
{
  return 0;
}

- (BOOL)_willStartEdgePanGestureForEvent:(id)a3
{
  id v4 = a3;
  if (([(id)VOTSharedWorkspace supportsHomeGestures] & 1) != 0
    || [(id)VOTSharedWorkspace inUnitTestMode])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unsigned __int8 v5 = objc_msgSend(v4, "fingers", 0);
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v11 = [(SCRCGestureFactory *)self->_gestureFactory orientation];
          [v10 location];
          -[VOTEventFactory adjustedPointForFactoryPoint:forOrientation:](self, "adjustedPointForFactoryPoint:forOrientation:", v11);
          double v13 = v12;
          [(VOTEventFactory *)self _edgePanGestureStartThreshold];
          double v15 = v14;
          unsigned int v16 = [(id)VOTSharedWorkspace reachabilityActive];
          double v17 = v15;
          if (v16)
          {
            objc_msgSend((id)VOTSharedWorkspace, "reachabilityOffset", v15);
            double v17 = v15 + v18;
          }
          if (!self->_edgePanGestureState)
          {
            double v17 = 1.0 - v17;
            if (1.0 - v13 <= v15 || 1.0 - v13 >= v17)
            {
              BOOL v20 = 1;
              goto LABEL_19;
            }
          }
        }
        id v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v17);
      }
      while (v7);
    }
    BOOL v20 = 0;
LABEL_19:
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (double)_edgeGestureScaleFactor:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 && AXDeviceIsPhone())
  {
    AXDeviceSizeMM();
    double v6 = fmax(v4, v5);
    return 135.0 / v6;
  }
  double v7 = 1.0;
  if (AXDeviceIsPad())
  {
    AXDeviceSizeMM();
    double v10 = fmin(v8, v9);
    double v6 = fmax(v8, v9);
    if (v3) {
      double v6 = v10;
    }
    return 135.0 / v6;
  }
  return v7;
}

- (id)_updateEdgePanGestureForState:(int64_t)a3
{
  if (![(id)VOTSharedWorkspace supportsHomeGestures]) {
    goto LABEL_39;
  }
  unint64_t v5 = (unint64_t)[(SCRCGestureFactory *)self->_gestureFactory orientation];
  double v6 = 0;
  unint64_t v7 = v5;
  switch(a3)
  {
    case 0:
      double v8 = [(VOTEventFactory *)self votActionForEdgePanGestureState:self->_edgePanGestureState];
      if (v8)
      {
        [(VOTEventFactory *)self _playFeedbackForGestureState:self->_edgePanGestureState gestureComplete:1];
        double v6 = +[VOTEvent touchEventWithCommand:v8 info:0];
      }
      else
      {
        double v6 = 0;
      }
      [(VOTEventFactory *)self _transitionToGestureState:0];

      goto LABEL_40;
    case 1:
      [(SCRCGestureFactory *)self->_gestureFactory startLocation];
      -[VOTEventFactory adjustedPointForFactoryPoint:forOrientation:](self, "adjustedPointForFactoryPoint:forOrientation:", v7);
      uint64_t v10 = v9;
      double v12 = v11;
      [(VOTEventFactory *)self _edgePanGestureStartThreshold];
      double v14 = v13;
      unsigned int v15 = [(id)VOTSharedWorkspace reachabilityActive];
      char v16 = v15;
      double v17 = v14;
      if (v15)
      {
        [(id)VOTSharedWorkspace reachabilityOffset];
        double v17 = v14 + v18;
      }
      double v6 = 0;
      BOOL v19 = 1.0 - v12 <= v14;
      if (1.0 - v12 >= 1.0 - v17) {
        BOOL v19 = 1;
      }
      if (self->_edgePanGestureState || !v19) {
        goto LABEL_40;
      }
      v75[1] = 3221225472;
      v75[0] = _NSConcreteStackBlock;
      v75[2] = sub_1000C7AB4;
      v75[3] = &unk_1001B64E0;
      void v75[4] = self;
      v75[5] = v10;
      *(double *)&v75[6] = v12;
      BOOL v76 = 1.0 - v12 <= v14;
      char v77 = v16;
      BOOL v20 = objc_retainBlock(v75);
      ((void (*)(void *, uint64_t, uint64_t, uint64_t))v20[2])(v20, v21, v22, v23);

      goto LABEL_39;
    case 2:
      if ((self->_edgePanGestureState & 0xFFFFFFFFFFFFFFF7) == 0) {
        goto LABEL_39;
      }
      unint64_t v24 = v5 & 0xFFFFFFFFFFFFFFFELL;
      double y = self->_edgePanGestureStartPoint.y;
      unsigned __int8 v26 = y != 1.0;
      [(SCRCGestureFactory *)self->_gestureFactory endLocation];
      -[VOTEventFactory adjustedPointForFactoryPoint:forOrientation:](self, "adjustedPointForFactoryPoint:forOrientation:", v7);
      double v28 = v27;
      double v30 = v29;
      double x = self->_edgePanGestureStartPoint.x;
      double v31 = self->_edgePanGestureStartPoint.y;
      double v33 = v31 - v29;
      double v34 = vabdd_f64(v31, v30);
      if (y != 1.0 && v33 > 0.0) {
        double v35 = 0.0;
      }
      else {
        double v35 = v34;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      unint64_t edgePanGestureState = self->_edgePanGestureState;
      [(SCRCGestureFactory *)self->_gestureFactory startLocation];
      double v39 = v38;
      double v41 = v40;
      [(SCRCGestureFactory *)self->_gestureFactory endLocation];
      BOOL v44 = v41 == v43 && v39 == v42;
      if (v24 == 2)
      {
        int IsPad = AXDeviceIsPad();
        float v46 = 0.3;
        if (!IsPad) {
          float v46 = 0.1;
        }
      }
      else
      {
        float v46 = 0.3;
      }
      double v47 = vabdd_f64(x, v28);
      double v48 = v46;
      if (edgePanGestureState != 1)
      {
        BOOL v50 = 0;
        goto LABEL_33;
      }
      double v49 = Current - self->_edgePanGestureStartTime;
      BOOL v50 = v49 > 1.5;
      if (v49 <= 0.5)
      {
LABEL_33:
        BOOL v51 = 0;
        goto LABEL_34;
      }
      BOOL v51 = v35 < 0.200000003 && v44;
LABEL_34:
      if (v47 > v48 || v50 || v51) {
        [(VOTEventFactory *)self _transitionToGestureState:8];
      }
      if (self->_edgePanGestureState == 8) {
        goto LABEL_39;
      }
      [(VOTEventFactory *)self _edgeGestureScaleFactor:v24 == 2];
      double v54 = v53 * 0.5;
      [(VOTEventFactory *)self _edgeGestureScaleFactor:v24 == 2];
      double v57 = v56 * 0.200000003;
      if (y != 1.0 && [(id)VOTSharedWorkspace reachabilityActive])
      {
        double v54 = v54 / 1.5;
        double v57 = v57 / 1.5;
      }
      if (v35 >= v54)
      {
        char v60 = +[AXSpringBoardServer server];
        unsigned int v61 = [v60 isScreenLockedWithPasscode:0];

        uint64_t v62 = +[AXSpringBoardServer server];
        if ([v62 isNotificationCenterVisible])
        {
          char v63 = 0;
        }
        else
        {
          v64 = +[AXSpringBoardServer server];
          char v63 = [v64 isControlCenterVisible] ^ 1;
        }
        if (y != 1.0 && (v63 & 1) == 0)
        {
          pid_t v65 = +[VOTCommandHelper commandHelper];
          unsigned __int8 v26 = [v65 helpEnabled];
        }
        if (y != 1.0 || ((v61 ^ 1) & 1) != 0)
        {
          char v68 = (y == 1.0) | v26;
          BOOL v69 = y == 1.0;
          uint64_t v70 = 4;
          uint64_t v71 = 7;
        }
        else
        {
          v66 = +[VOTCommandHelper commandHelper];
          unsigned int v67 = [v66 helpEnabled];

          char v68 = v67 | v26;
          BOOL v69 = v67 == 0;
          uint64_t v70 = 7;
          uint64_t v71 = 4;
        }
        if (v69) {
          uint64_t v55 = v70;
        }
        else {
          uint64_t v55 = v71;
        }
        if ((v68 & 1) == 0)
        {
LABEL_72:
          if (!v44) {
            goto LABEL_83;
          }
          goto LABEL_73;
        }
LABEL_71:
        [(VOTEventFactory *)self _transitionToGestureState:v55];
        goto LABEL_72;
      }
      if (v35 >= v57)
      {
        if (y == 1.0) {
          uint64_t v55 = 3;
        }
        else {
          uint64_t v55 = 6;
        }
        goto LABEL_71;
      }
      if (self->_edgePanGestureState == 1) {
        goto LABEL_72;
      }
      int IsPhone = AXDeviceIsPhone();
      if (IsPhone) {
        uint64_t v59 = 5;
      }
      else {
        uint64_t v59 = 9;
      }
      if (!v44)
      {
        if (self->_edgePanGestureState != v59)
        {
          int v72 = IsPhone;
          BOOL v73 = v24 != 2 && SBSIsReachabilityEnabled() != 0;
          if (y != 1.0 || self->_edgePanGestureState == 2 || ((v73 | v72 ^ 1) & 1) == 0) {
            uint64_t v59 = 2;
          }
          [(VOTEventFactory *)self _transitionToGestureState:v59];
        }
        goto LABEL_83;
      }
      [(VOTEventFactory *)self _transitionToGestureState:2];
LABEL_73:
      if (self->_edgePanGesturePausePoint.x == CGPointZero.x && self->_edgePanGesturePausePoint.y == CGPointZero.y)
      {
        self->_edgePanGesturePausePoint.double x = v28;
        self->_edgePanGesturePausePoint.double y = v30;
        [(SCRCTargetSelectorTimer *)self->_edgePanGestureSpeakHintTimer dispatchAfterDelay:0.800000012];
LABEL_39:
        double v6 = 0;
        goto LABEL_40;
      }
LABEL_83:
      p_edgePanGesturePausePoint = &self->_edgePanGesturePausePoint;
      if (vabdd_f64(self->_edgePanGesturePausePoint.y, v30) <= 0.00999999978
        && vabdd_f64(p_edgePanGesturePausePoint->x, v28) <= 0.00999999978)
      {
        goto LABEL_39;
      }
      [(SCRCTargetSelectorTimer *)self->_edgePanGestureSpeakHintTimer cancel];
      double v6 = 0;
      CGPoint *p_edgePanGesturePausePoint = CGPointZero;
LABEL_40:
      return v6;
    case 8:
      [(VOTEventFactory *)self _transitionToGestureState:0];
      goto LABEL_39;
    default:
      goto LABEL_40;
  }
}

- (void)_transitionToGestureState:(unint64_t)a3
{
}

- (void)_transitionToGestureState:(unint64_t)a3 playHaptic:(BOOL)a4
{
  if (self->_edgePanGestureState != a3)
  {
    BOOL v4 = a4;
    unint64_t v7 = VOTLogEvent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (a3 > 9) {
        CFStringRef v8 = &stru_1001B7888;
      }
      else {
        CFStringRef v8 = off_1001B6548[a3];
      }
      uint64_t v9 = NSStringFromBOOL();
      int v10 = 138412546;
      CFStringRef v11 = v8;
      __int16 v12 = 2112;
      double v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_transitionToGestureState=%@, playHaptic=%@", (uint8_t *)&v10, 0x16u);
    }
    self->_unint64_t edgePanGestureState = a3;
    if (v4) {
      [(VOTEventFactory *)self _playFeedbackForGestureState:a3 gestureComplete:0];
    }
  }
}

- (void)_playFeedbackForGestureState:(unint64_t)a3 gestureComplete:(BOOL)a4
{
  switch(a3)
  {
    case 1uLL:
      uint64_t v5 = -1;
      CFStringRef v4 = @"Sounds/VOTOrbSound1-OrbHW.aiff";
      goto LABEL_10;
    case 2uLL:
      CFStringRef v4 = @"Sounds/VOTOrbSound1-OrbHW.aiff";
      goto LABEL_8;
    case 3uLL:
    case 6uLL:
      CFStringRef v4 = @"Sounds/VOTOrbSound2-OrbHW.aiff";
      uint64_t v5 = 6;
      goto LABEL_15;
    case 4uLL:
    case 7uLL:
      CFStringRef v4 = @"Sounds/VOTOrbSound3-OrbHW.aiff";
      uint64_t v5 = 7;
      goto LABEL_15;
    case 5uLL:
    case 9uLL:
      CFStringRef v4 = 0;
LABEL_8:
      uint64_t v5 = 8;
      goto LABEL_15;
    case 8uLL:
      CFStringRef v4 = 0;
      uint64_t v5 = 11;
      goto LABEL_15;
    default:
      CFStringRef v4 = 0;
      uint64_t v5 = -1;
LABEL_10:
      if (!a4)
      {
        if (!v4) {
          return;
        }
        goto LABEL_12;
      }
LABEL_15:
      if (a4)
      {
        CFStringRef v4 = 0;
        uint64_t v6 = 12;
      }
      else
      {
        uint64_t v6 = v5;
      }
      unint64_t v7 = +[AXHapticFeedbackManager sharedManager];
      [v7 playHapticFeedbackForType:v6];

      if (v4)
      {
LABEL_12:
        id v8 = +[VOTOutputManager outputManager];
        [v8 playSoundFast:v4];
      }
      return;
  }
}

- (void)_processGestureEvent:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentGestureEvent, a3);
  uint64_t v6 = [(VOTEventFactory *)self _currentGesturedTextInputManager];
  unint64_t v7 = +[VOTWorkspace sharedWorkspace];
  id v8 = [v7 userCommandManager];

  if (!v6 && [(VOTEventFactory *)self _handleDirectInteractionEvent:v5])
  {
    if (([v5 isCancelEvent] & 1) != 0 || objc_msgSend(v5, "isLiftEvent")) {
      self->_flags.BOOL sendingToDirectTouch = 0;
    }
    if (CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001EAF70 > 4.0)
    {
      uint64_t v9 = +[VOTUserEventManager sharedInstance];
      [v9 userEventOccurred];

      qword_1001EAF70 = CFAbsoluteTimeGetCurrent();
    }
    goto LABEL_243;
  }
  if ([(VOTEventFactory *)self _gestureEventIsInvalid:v5]) {
    goto LABEL_243;
  }
  if ([(VOTEventFactory *)self _handleOrbEvent:v5])
  {
    unsigned int v10 = 1;
  }
  else
  {
    [(VOTEventFactory *)self _feedEventToHandwritingRecognition:v5];
    CFStringRef v11 = [(VOTEventFactory *)self _brailleGestureManager];

    if (v6 == v11)
    {
      __int16 v12 = [(VOTEventFactory *)self _brailleGestureManager];
      double v13 = [(VOTEventFactory *)self _touchLocationsForGestureEvent:v5];
      unsigned int v10 = objc_msgSend(v12, "processTouchLocations:isFirstTouch:isCancelTouch:", v13, objc_msgSend(v5, "isDownEvent"), objc_msgSend(v5, "isCancelEvent"));
    }
    else
    {
      unsigned int v10 = 0;
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(SCRCGestureFactory *)self->_gestureFactory setSplitFlickEnabled:[(VOTEventFactory *)self brailleInputActive]];
  }
  if (objc_opt_respondsToSelector()) {
    [(SCRCGestureFactory *)self->_gestureFactory setUsesAbsoluteDistanceForPinch:[(VOTEventFactory *)self brailleInputActive]];
  }
  [(SCRCGestureFactory *)self->_gestureFactory handleGestureEvent:v5];
  if (v10)
  {
    [(VOTEventFactory *)self resetEventFactory];
    [(VOTEventFactory *)self _setFingerCount:0];
    goto LABEL_243;
  }
  [(SCRCGestureFactory *)self->_gestureFactory distance];
  double v15 = v14;
  if (!self->_flags.tapAndHoldMode
    || [(VOTEventFactory *)self _tapAndHoldModeIsForScribble]
    && ![v5 isStylusEvent])
  {
    id v16 = [(SCRCGestureFactory *)self->_gestureFactory gestureState];
    int64_t v17 = (int64_t)[(SCRCGestureFactory *)self->_gestureFactory direction];
    id v210 = [(SCRCGestureFactory *)self->_gestureFactory fingerCount];
    id v18 = [v5 fingerCount];
    if ([v5 isDownEvent])
    {
      objc_storeStrong((id *)&self->_lastDownEvent, a3);
      BOOL v19 = AXLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        lastDownEvent = self->_lastDownEvent;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = lastDownEvent;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Last down %@", buf, 0xCu);
      }

      self->_flags.hasSentFirstTrackingEventForGesture = 0;
    }
    if (v18)
    {
      [(SCRCGestureFactory *)self->_gestureFactory distance];
      self->_travelDistance = v21 + self->_travelDistance;
    }
    else
    {
      self->_travelDistance = 0.0;
    }
    if (self->_flags.memorizingData && [v5 fingerCount] != (id)2)
    {
      [(VOTEventFactory *)self _stopMemorizingSession];
      double v28 = 0;
LABEL_242:
      self->_state = (int64_t)v16;
      self->_direction = v17;
      [(VOTEventFactory *)self _commitDeferredZoomInfoIfAppropriate];

      goto LABEL_243;
    }
    [(SCRCGestureFactory *)self->_gestureFactory rawAverageLocation];
    [(VOTEventFactory *)self convertDevicePointToZoomedPoint:sub_100051E14(v22)];
    unsigned int v25 = -[VOTEventFactory _updateFingersInSystemControlLocation:fingerCount:isLift:](self, "_updateFingersInSystemControlLocation:fingerCount:isLift:", -[SCRCGestureFactory fingerCount](self->_gestureFactory, "fingerCount"), [v5 isLiftEvent], v23, v24);
    if (self->_systemControlActivated) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v25;
    }
    uint64_t v27 = [(VOTEventFactory *)self _updateEdgePanGestureForState:v16];
    double v28 = (void *)v27;
    id v209 = v18;
    char v29 = 0;
    switch((unint64_t)v16)
    {
      case 0uLL:
        char v29 = 0;
        self->_int64_t rotorSoundZone = 0;
        self->_int64_t continuityZone = 0;
        goto LABEL_204;
      case 1uLL:
      case 3uLL:
        goto LABEL_204;
      case 2uLL:
        [v5 time];
        double v43 = v42;
        if (vabdd_f64(v42, self->_lastEchoTime) <= 0.00100000005) {
          goto LABEL_203;
        }
        [(VOTEventFactory *)self _gestureTrackingCallbackWithFactory:self->_gestureFactory isHandlingSystemControlEvent:v26];
        self->_lastEchoTime = v43;
        char v29 = 1;
        goto LABEL_204;
      case 4uLL:
        int64_t v44 = v17;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_rotorManager);
        unsigned int v46 = [WeakRetained rotorEnabled];

        if (!v46) {
          goto LABEL_106;
        }
        float v47 = v15;
        float v48 = floorf(v47 / 0.03);
        float v49 = ceilf(v47 / 0.03);
        if (v15 > 0.0) {
          float v49 = v48;
        }
        int64_t v50 = (uint64_t)v49;
        int64_t rotorSoundZone = self->_rotorSoundZone;
        if (rotorSoundZone <= (uint64_t)v49)
        {
          if (rotorSoundZone >= (uint64_t)v49)
          {
            v202 = 0;
            goto LABEL_152;
          }
          uint64_t v52 = +[VOSOutputEvent NextRotorProgress];
        }
        else
        {
          uint64_t v52 = +[VOSOutputEvent PreviousRotorProgress];
        }
        v202 = (void *)v52;
LABEL_152:
        self->_int64_t rotorSoundZone = v50;
        [v5 time];
        double rotateStartTime = self->_rotateStartTime;
        if (rotateStartTime == -3061152000.0)
        {
          self->_double rotateStartTime = v106;
          double rotateStartTime = v106;
        }
        float v108 = flt_10016E928[v106 - rotateStartTime > 0.2];
        int64_t v109 = -1;
        if (v15 > 0.0) {
          int64_t v109 = 1;
        }
        self->_rotateDirection = v109;
        float v110 = v47 / v108;
        float v111 = floorf(v110);
        float v112 = ceilf(v110);
        if (v15 > 0.0) {
          float v112 = v111;
        }
        int64_t v113 = (uint64_t)v112;
        int64_t continuityZone = self->_continuityZone;
        if (continuityZone <= (uint64_t)v112)
        {
          if (continuityZone >= (uint64_t)v112)
          {
            int64_t v17 = v44;
            v120 = v202;
            goto LABEL_164;
          }
          v118 = +[VOSGesture TwoFingerRotateClockwise];
          v119 = [(VOTEventFactory *)self _commandResolver];
          uint64_t v198 = [v8 eventForTouchGesture:v118 resolver:v119];

          uint64_t v117 = +[VOSOutputEvent DidSelectNextRotor];
        }
        else
        {
          v115 = +[VOSGesture TwoFingerRotateCounterclockwise];
          v116 = [(VOTEventFactory *)self _commandResolver];
          uint64_t v198 = [v8 eventForTouchGesture:v115 resolver:v116];

          uint64_t v117 = +[VOSOutputEvent DidSelectPreviousRotor];
        }
        v120 = (void *)v117;
        double v28 = (void *)v198;

        int64_t v17 = v44;
LABEL_164:
        v121 = v120;
        if (v120)
        {
          v122 = +[VOTOutputManager outputManager];
          [v122 sendEvent:v121];
        }
        self->_int64_t continuityZone = v113;
        [(VOTEventFactory *)self _stopMemorizingSession];

        goto LABEL_167;
      case 5uLL:
        if ([(VOTEventFactory *)self brailleInputActive]) {
          goto LABEL_203;
        }
        [(SCRCGestureFactory *)self->_gestureFactory distance];
        double v54 = sub_100051E2C(v53);
        double startPinchDistance = self->_startPinchDistance;
        if (startPinchDistance == 0.0)
        {
          self->_double startPinchDistance = v54;
          double startPinchDistance = v54;
        }
        float v56 = (v54 - startPinchDistance) / 20.0;
        float v57 = ceilf(v56);
        float v58 = floorf(v56);
        if (v15 < 0.0) {
          float v58 = v57;
        }
        int64_t v59 = (uint64_t)v58;
        double v60 = (double)(uint64_t)v58;
        double v61 = (double)self->_continuityZone;
        if (v60 == v61) {
          goto LABEL_143;
        }
        if (v60 >= v61)
        {
          if (v60 <= v61) {
            goto LABEL_143;
          }
          uint64_t v62 = &kVOTEventCommandSelectRight;
        }
        else
        {
          uint64_t v62 = &kVOTEventCommandSelectLeft;
        }
        uint64_t v97 = +[VOTEvent touchEventWithCommand:*v62 info:0];

        double v28 = (void *)v97;
LABEL_143:
        self->_int64_t continuityZone = v59;
        [(VOTEventFactory *)self _stopMemorizingSession];
LABEL_167:
        char v29 = 0;
        id v18 = v209;
        goto LABEL_204;
      case 6uLL:
        if (v210 != (id)2) {
          goto LABEL_203;
        }
        if (self->_flags.twoFingerTapAndSlide && v17 == 6)
        {
          CFAbsoluteTimeGetCurrent();
LABEL_203:
          char v29 = 0;
        }
        else
        {
          if (v17)
          {
            double continuityDistance = self->_zigzag.continuityDistance;
            if (fabs(v15) >= fabs(continuityDistance))
            {
              int64_t v88 = 0;
              self->_zigzag.distanceTraveled = 0.0;
            }
            else
            {
              self->_zigzag.distanceTraveled = continuityDistance;
              if (continuityDistance <= 0.1)
              {
                if (continuityDistance >= -0.1) {
                  int64_t v88 = 0;
                }
                else {
                  int64_t v88 = -1;
                }
              }
              else
              {
                int64_t v88 = 1;
              }
            }
            if (v88 != self->_zigzag.direction)
            {
              unint64_t count = self->_zigzag.count;
              if (!count)
              {
                [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
                self->_zigzag.firstCountPoint.double x = v131;
                self->_zigzag.firstCountPoint.double y = v132;
                unint64_t count = self->_zigzag.count;
              }
              self->_zigzag.unint64_t count = count + 1;
            }
            self->_zigzag.direction = v88;
            id v18 = v209;
          }
          else
          {
            self->_zigzag.unint64_t count = 0;
          }
          char v29 = 0;
          self->_zigzag.double continuityDistance = v15;
        }
        goto LABEL_204;
      case 8uLL:
      case 9uLL:
        if ([v5 didFallThruToDevice]) {
          goto LABEL_203;
        }
        int64_t v30 = v17;
        id v31 = [objc_allocWithZone((Class)AXIndexMap) init];
        [(SCRCGestureFactory *)self->_gestureFactory startLocation];
        double v33 = v32;
        [(SCRCGestureFactory *)self->_gestureFactory endLocation];
        double v35 = v34;
        [(SCRCGestureFactory *)self->_gestureFactory directionalSlope];
        double v37 = v36;
        double v38 = +[NSValue valueWithPoint:sub_100051E14((v33 + v35) * 0.5)];
        [v31 setObject:v38 forIndex:101];

        uint64_t v39 = 3;
        if (v30 != 1) {
          uint64_t v39 = 4;
        }
        if (v37 > 0.75 && (unint64_t)(v30 - 1) < 2) {
          int64_t v30 = v39;
        }
        int64_t v205 = v30;
        switch(v30)
        {
          case 1:
            if ([(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager inGestureMode])
            {
              double v41 = &kVOTEventCommandGestureTypingDelete;
              goto LABEL_139;
            }
            uint64_t v95 = +[VOSGesture OneFingerFlickLeft];
            goto LABEL_171;
          case 2:
            if ([(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager inGestureMode])
            {
              goto LABEL_173;
            }
            uint64_t v95 = +[VOSGesture OneFingerFlickRight];
            goto LABEL_171;
          case 3:
            if ([(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager inGestureMode])
            {
              double v41 = &kVOTEventCommandGestureTypingNextSuggestion;
              goto LABEL_139;
            }
            uint64_t v95 = +[VOSGesture OneFingerFlickUp];
            goto LABEL_171;
          case 4:
            if ([(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager inGestureMode])
            {
              double v41 = &kVOTEventCommandGestureTypingPreviousSuggestion;
LABEL_139:
              uint64_t v96 = +[VOTEvent touchEventWithCommand:*v41 info:v31];
            }
            else
            {
              uint64_t v95 = +[VOSGesture OneFingerFlickDown];
LABEL_171:
              v123 = (void *)v95;
              v203 = [(VOTEventFactory *)self _commandResolver];
              uint64_t v96 = [v8 eventForTouchGesture:v123 resolver:v203 info:v31];

              double v28 = v123;
            }

            double v28 = (void *)v96;
LABEL_173:

            char v29 = 0;
            int64_t v17 = v205;
            break;
          default:
            goto LABEL_173;
        }
        goto LABEL_204;
      case 0xAuLL:
        int64_t v44 = v17;
        id v63 = objc_loadWeakRetained((id *)&self->_rotorManager);
        unsigned int v64 = [v63 rotorEnabled];

        if (v64)
        {
          [v5 time];
          if (v65 - self->_rotateStartTime < 0.2 && !self->_continuityZone)
          {
            if (self->_rotateDirection < 0)
            {
              v141 = +[VOSGesture TwoFingerRotateCounterclockwise];
              v142 = [(VOTEventFactory *)self _commandResolver];
              uint64_t v200 = [v8 eventForTouchGesture:v141 resolver:v142];

              +[VOSOutputEvent DidSelectPreviousRotor];
            }
            else
            {
              v66 = +[VOSGesture TwoFingerRotateClockwise];
              unsigned int v67 = [(VOTEventFactory *)self _commandResolver];
              uint64_t v200 = [v8 eventForTouchGesture:v66 resolver:v67];

              +[VOSOutputEvent DidSelectNextRotor];
            v143 = };
            double v28 = (void *)v200;
            if (v143)
            {
              v144 = +[VOTOutputManager outputManager];
              [v144 sendEvent:v143];
            }
          }
          int64_t v17 = v44;
          self->_flags.rotating = 0;
          self->_int64_t rotorSoundZone = 0;
          self->_int64_t continuityZone = 0;
          self->_double rotateStartTime = -3061152000.0;
          self->_rotateDirection = 0;
          [(VOTEventFactory *)self _stopMemorizingSession];
        }
        else
        {
LABEL_106:
          int64_t v17 = v44;
        }
        goto LABEL_203;
      case 0xBuLL:
        self->_int64_t continuityZone = 0;
        self->_double startPinchDistance = 0.0;
        if (![(VOTEventFactory *)self brailleInputActive]) {
          goto LABEL_203;
        }
        char v68 = +[VOSGesture TwoFingerPinch];
        [(VOTEventFactory *)self _commandResolver];
        uint64_t v70 = v69 = v17;
        uint64_t v71 = [v8 eventForTouchGesture:v68 resolver:v70];
        int v72 = v28;
        double v28 = (void *)v71;

        int64_t v17 = v69;
        goto LABEL_167;
      case 0xCuLL:
        if (v210 == (id)2) {
          char v73 = v26;
        }
        else {
          char v73 = 1;
        }
        if (v73)
        {
          if (v210 == (id)3 && !v18)
          {
            if (self->_flags.threeFingerTapAndSlide)
            {
              if (AXDeviceIsPad())
              {
                if (v17 == 5)
                {
                  v182 = v28;
                  uint64_t v75 = 5;
                  [(SCRCGestureFactory *)self->_gestureFactory distance];
                  if (v183 >= 0.0) {
                    +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight];
                  }
                  else {
                  v190 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];
                  }
                  v191 = [(VOTEventFactory *)self _commandResolver];
                  double v28 = [v8 eventForTouchGesture:v190 resolver:v191];

                  v189 = VOTLogEvent();
                  if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG)) {
                    sub_100121B18(v28);
                  }
                }
                else
                {
                  if (v17 != 6)
                  {
LABEL_275:
                    char v29 = 0;
                    self->_flags.threeFingerTapAndSlide = 0;
                    goto LABEL_206;
                  }
                  long long v74 = v28;
                  uint64_t v75 = 6;
                  [(SCRCGestureFactory *)self->_gestureFactory distance];
                  if (v76 >= 0.0) {
                    +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown];
                  }
                  else {
                  v187 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp];
                  }
                  v188 = [(VOTEventFactory *)self _commandResolver];
                  double v28 = [v8 eventForTouchGesture:v187 resolver:v188];

                  v189 = VOTLogEvent();
                  if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG)) {
                    sub_100121A94(v28);
                  }
                }
                int64_t v17 = v75;

                goto LABEL_275;
              }
              goto LABEL_179;
            }
            [(SCRCTargetSelectorTimer *)self->_threeFingerHoldTimer cancel];
            if (v17 != 5)
            {
              if (v17 == 6)
              {
                CGPoint v89 = v28;
                [(SCRCGestureFactory *)self->_gestureFactory distance];
                if (v124 >= 0.0)
                {
                  uint64_t v91 = +[VOSGesture ThreeFingerFlickUp];
                }
                else
                {
                  if ([(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager inGestureMode])
                  {
                    double v28 = +[VOTEvent touchEventWithCommand:kVOTEventCommandGestureTypingNextInternationalKeyboard info:0];

                    char v29 = 0;
LABEL_278:
                    int64_t v17 = 6;
                    goto LABEL_206;
                  }
                  uint64_t v91 = +[VOSGesture ThreeFingerFlickDown];
                }
LABEL_277:
                v192 = (void *)v91;
                v193 = [(VOTEventFactory *)self _commandResolver];
                uint64_t v194 = [v8 eventForTouchGesture:v192 resolver:v193];

                char v29 = 0;
                double v28 = (void *)v194;
                goto LABEL_278;
              }
              goto LABEL_179;
            }
            v138 = v28;
            [(SCRCGestureFactory *)self->_gestureFactory distance];
            if (v179 >= 0.0) {
              +[VOSGesture ThreeFingerFlickRight];
            }
            else {
              +[VOSGesture ThreeFingerFlickLeft];
            }
            goto LABEL_196;
          }
          char v29 = 0;
          if (v210 == (id)4 && !v18)
          {
            if (v17 != 5)
            {
              if (v17 == 6)
              {
                CGPoint v89 = (void *)v27;
                [(SCRCGestureFactory *)self->_gestureFactory distance];
                if (v90 >= 0.0) {
                  +[VOSGesture FourFingerFlickUp];
                }
                else {
                uint64_t v91 = +[VOSGesture FourFingerFlickDown];
                }
                goto LABEL_277;
              }
LABEL_179:
              char v29 = 0;
LABEL_206:
              id v145 = objc_loadWeakRetained((id *)&self->_rotorManager);
              [v145 hideVisualRotor];

              if (!self->_flags.sendingToNativeSlide) {
                goto LABEL_216;
              }
              char v208 = v29;
              int64_t v146 = v17;
              self->_flags.sendingToNativeSlide = 0;
              v147 = +[VOTElement systemWideElement];
              v148 = [(VOTGestureEvent *)self->_currentGestureEvent eventRepresentation];
              [v147 repostEvent:v148];
              goto LABEL_208;
            }
            v138 = (void *)v27;
            [(SCRCGestureFactory *)self->_gestureFactory distance];
            if (v139 >= 0.0) {
              +[VOSGesture FourFingerFlickRight];
            }
            else {
              +[VOSGesture FourFingerFlickLeft];
            }
            uint64_t v140 = LABEL_196:;
            v184 = (void *)v140;
            v185 = [(VOTEventFactory *)self _commandResolver];
            uint64_t v186 = [v8 eventForTouchGesture:v184 resolver:v185];

            char v29 = 0;
            double v28 = (void *)v186;
            int64_t v17 = 5;
            goto LABEL_206;
          }
LABEL_204:
          if (v18 != (id)1)
          {
            if (v18) {
              goto LABEL_216;
            }
            goto LABEL_206;
          }
          if (![v5 isDownEvent]) {
            goto LABEL_216;
          }
          char v208 = v29;
          v199 = v28;
          id v204 = v16;
          int64_t v146 = v17;
          v147 = [(VOTEventFactory *)self currentElement];
          v149 = [v5 eventRepresentation];
          v150 = [v149 handInfo];
          v151 = [v150 paths];
          v152 = [v151 firstPath];
          [v152 pathLocation];
          CGFloat v154 = v153;
          CGFloat v156 = v155;

          if ([v147 doesHaveTraits:kAXAllowsNativeSlidingTrait])
          {
            [v147 frame];
            v212.double x = v154;
            v212.double y = v156;
            double v28 = v199;
            id v16 = v204;
            if (CGRectContainsPoint(v213, v212) && CFAbsoluteTimeGetCurrent() - self->_lastNativeSlideCancel > 1.0)
            {
              self->_flags.sendingToNativeSlide = 1;
              v148 = [(VOTGestureEvent *)self->_currentGestureEvent eventRepresentation];
              v157 = [v148 handInfo];
              v158 = [v157 paths];
              v159 = [v158 firstPath];
              [v159 pathLocation];
              self->_nativeSlidingOffset.double x = v160;
              self->_nativeSlidingOffset.double y = v161;

              double v28 = v199;
              id v16 = v204;

              [v147 centerPoint];
              self->_nativeSlidingCenter.double x = v162;
              self->_nativeSlidingCenter.double y = v163;
              sub_1000C0B3C(v148, v162, v163);
              v164 = +[VOTElement systemWideElement];
              [v164 repostEvent:v148];

LABEL_208:
            }
          }
          else
          {
            double v28 = v199;
            id v16 = v204;
          }

          int64_t v17 = v146;
          char v29 = v208;
LABEL_216:
          if (!v28)
          {
            handwritingOnldouble y = 0;
            goto LABEL_235;
          }
          [(SCRCGestureFactory *)self->_gestureFactory velocity];
          objc_msgSend(v28, "setTouchVelocity:");
          [v28 setFingerCount:v210];
          v165 = VOTLogEvent();
          BOOL v166 = os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG);
          if (!v6)
          {
            if (v166) {
              sub_10012194C();
            }

            [(VOTEventFactory *)self processEvent:v28];
            goto LABEL_234;
          }
          if (v166) {
            sub_1001219B4();
          }

          unsigned __int8 v167 = [v6 processEvent:v28];
          unsigned __int8 v168 = v167;
          if (qword_1001EBAB8 == -1)
          {
            if ((v167 & 1) == 0)
            {
LABEL_222:
              v169 = (void *)qword_1001EBAB0;
              v170 = [v28 command];
              if ([v169 containsObject:v170])
              {
              }
              else
              {
                handwritingOnldouble y = self->_flags.handwritingOnly;

                if (!handwritingOnly) {
                  goto LABEL_235;
                }
              }
              v172 = VOTLogEvent();
              if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG)) {
                sub_100121980();
              }

              [(VOTEventFactory *)self processEvent:v28];
            }
          }
          else
          {
            dispatch_once(&qword_1001EBAB8, &stru_1001B6500);
            if ((v168 & 1) == 0) {
              goto LABEL_222;
            }
          }
          v173 = [(VOTEventFactory *)self _handwritingCaptureTimer];
          [v173 cancel];

          v174 = [(VOTEventFactory *)self handwritingManager];

          if (v6 == v174)
          {
            v175 = [(VOTEventFactory *)self handwritingManager];
            [v175 resetSession];
          }
LABEL_234:
          handwritingOnldouble y = 1;
LABEL_235:
          int64_t v176 = (int64_t)v209;
          if (v16 == (id)2) {
            int64_t v176 = (int64_t)v210;
          }
          self->_int64_t fingerCount = v176;
          if (v176) {
            goto LABEL_240;
          }
          if (self->_flags.tapAndHoldMode) {
            goto LABEL_239;
          }
          if (v16)
          {
            if (self->_state == 2) {
              char v178 = v29;
            }
            else {
              char v178 = 1;
            }
            if (v178)
            {
LABEL_240:
              if (handwritingOnly) {
                [(VOTEventFactory *)self setLastGestureEvent:v28];
              }
              goto LABEL_242;
            }
          }
          else if (v29)
          {
            goto LABEL_240;
          }
LABEL_239:
          [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
          [(VOTEventFactory *)self _processIdle:sub_100051E14(v177)];
          goto LABEL_240;
        }
        if (!v18 && self->_flags.twoFingerTapAndSlide)
        {
          self->_flags.twoFingerTapAndSlide = 0;
          self->_volumeChangeDistance = 0.0;
LABEL_283:
          char v29 = 0;
          self->_zigzag.direction = 0;
          self->_zigzag.unint64_t count = 0;
          self->_zigzag.double continuityDistance = 0.0;
          goto LABEL_204;
        }
        unint64_t v92 = self->_zigzag.count;
        if (v92 > 2 || v92 == 2 && fabs(self->_zigzag.continuityDistance) > 0.05)
        {
          double y = self->_zigzag.firstCountPoint.y;
          [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
          if (vabdd_f64(y, v94) > 0.3)
          {
            char v29 = 0;
            self->_zigzag.unint64_t count = 0;
            self->_zigzag.double continuityDistance = 0.0;
            goto LABEL_204;
          }
          v133 = +[VOSGesture TwoFingerScrub];
          [(VOTEventFactory *)self _commandResolver];
          v135 = v134 = v28;
          [v8 eventForTouchGesture:v133 resolver:v135];
          v137 = int64_t v136 = v17;

          id v18 = v209;
          double v28 = (void *)v137;
          int64_t v17 = v136;
          goto LABEL_283;
        }
        if (v17 == 5)
        {
          v128 = (void *)v27;
          uint64_t v207 = 5;
          [(SCRCGestureFactory *)self->_gestureFactory distance];
          if (v180 >= 0.0) {
            +[VOSGesture TwoFingerFlickRight];
          }
          else {
          uint64_t v181 = +[VOSGesture TwoFingerFlickLeft];
          }
        }
        else
        {
          if (v17 != 6) {
            goto LABEL_283;
          }
          [(SCRCGestureFactory *)self->_gestureFactory distance];
          double v126 = v125;
          unsigned int v127 = [(VOTDirectInteractionKeyboardManager *)self->_directInteractionKeyboardManager inGestureMode];
          uint64_t v207 = 6;
          v128 = v28;
          if (v126 >= 0.0)
          {
            if (v127)
            {
              v129 = &kVOTEventCommandGestureTypingPreviousKeyplane;
              goto LABEL_265;
            }
            uint64_t v181 = +[VOSGesture TwoFingerFlickUp];
          }
          else
          {
            if (v127)
            {
              v129 = &kVOTEventCommandGestureTypingNextKeyplane;
LABEL_265:
              double v28 = +[VOTEvent touchEventWithCommand:*v129 info:0];

LABEL_282:
              int64_t v17 = v207;
              goto LABEL_283;
            }
            uint64_t v181 = +[VOSGesture TwoFingerFlickDown];
          }
        }
        v195 = (void *)v181;
        v196 = [(VOTEventFactory *)self _commandResolver];
        uint64_t v197 = [v8 eventForTouchGesture:v195 resolver:v196];

        double v28 = (void *)v197;
        goto LABEL_282;
      case 0x10uLL:
        if (self->_flags.splitSlide) {
          goto LABEL_203;
        }
        char v29 = 0;
        self->_flags.splitSlide = 1;
        self->_splitSlideFingerCount = (unint64_t)v18;
        goto LABEL_204;
      case 0x13uLL:
        if (self->_flags.splitSlide)
        {
          id v77 = objc_alloc_init((Class)AXIndexMap);
          [(SCRCGestureFactory *)self->_gestureFactory startLocation];
          double v79 = v78;
          [(SCRCGestureFactory *)self->_gestureFactory endLocation];
          long long v81 = +[NSValue valueWithPoint:sub_100051E14((v79 + v80) * 0.5)];
          [v77 setObject:v81 forIndex:101];

          long long v82 = VOTLogEvent();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
            sub_100121C2C((uint64_t)self, v82);
          }

          *(void *)buf = 0;
          SCRCMathGetVectorAndDistanceForPoints();
          if (self->_splitSlideFingerCount == 2 && v17 == 5)
          {
            id v201 = v77;
            [(SCRCGestureFactory *)self->_gestureFactory distance];
            if (v83 >= 0.0) {
              +[VOSGesture TwoFingerSplitFlickRight];
            }
            else {
            uint64_t v98 = +[VOSGesture TwoFingerSplitFlickLeft];
            }
            v99 = [(VOTEventFactory *)self _commandResolver];
            v100 = (void *)v98;
            uint64_t v101 = [v8 eventForTouchGesture:v98 resolver:v99];

            double v28 = (void *)v101;
            id v77 = v201;
            int64_t v17 = 5;
          }
          self->_flags.splitSlide = 0;
          self->_flags.handwritingOnldouble y = 1;
          self->_splitSlideFingerCount = 0;
        }
        goto LABEL_203;
      case 0x14uLL:
        if (self->_flags.splitFlick) {
          goto LABEL_203;
        }
        char v29 = 0;
        self->_flags.splitFlick = 1;
        goto LABEL_204;
      case 0x15uLL:
        if (!self->_flags.splitFlick) {
          goto LABEL_203;
        }
        long long v84 = VOTLogEvent();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
          sub_100121B9C(v17);
        }

        int64_t v206 = v17;
        switch(v17)
        {
          case 1:
            uint64_t v85 = +[VOSGesture OneFingerSplitFlickLeft];
            goto LABEL_150;
          case 2:
            uint64_t v85 = +[VOSGesture OneFingerSplitFlickRight];
            goto LABEL_150;
          case 3:
            uint64_t v85 = +[VOSGesture OneFingerSplitFlickUp];
            goto LABEL_150;
          case 4:
            uint64_t v85 = +[VOSGesture OneFingerSplitFlickDown];
LABEL_150:
            v102 = (void *)v85;
            v103 = [(VOTEventFactory *)self _commandResolver];
            v104 = v102;
            uint64_t v105 = [v8 eventForTouchGesture:v102 resolver:v103];

            double v28 = (void *)v105;
            int64_t v17 = v206;
            break;
          default:
            break;
        }
        char v29 = 0;
        *(_WORD *)&self->_flags.splitFlick = 256;
        goto LABEL_204;
      default:
        CFStringRef v86 = VOTLogEvent();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG)) {
          sub_1001219E8((uint64_t)v16, v17, v86);
        }

        goto LABEL_203;
    }
  }
  if ([v5 fingerCount]) {
    self->_travelDistance = v15 + self->_travelDistance;
  }
  [(VOTEventFactory *)self _processTapAndHoldMode:v5];
LABEL_243:
}

- (void)_commitDeferredZoomInfo
{
  if (!CGRectIsNull(*(CGRect *)ymmword_1001EBA90))
  {
    objc_msgSend((id)objc_opt_class(), "_updateZoomFrame:", *(_OWORD *)ymmword_1001EBA90, *(double *)&ymmword_1001EBA90[16], *(double *)&ymmword_1001EBA90[24]);
    CGSize size = CGRectNull.size;
    *(CGPoint *)ymmword_1001EBA90 = CGRectNull.origin;
    *(CGSize *)&ymmword_1001EBA90[16] = size;
  }
}

- (void)_commitDeferredZoomInfoIfAppropriate
{
  if ((self->_state | 2) != 3) {
    [(VOTEventFactory *)self _commitDeferredZoomInfo];
  }
}

- (void)setCurrentElement:(id)a3
{
  id v4 = a3;
  AX_PERFORM_WITH_LOCK();
  if (objc_msgSend(v4, "doesHaveTraits:", kAXKeyboardKeyTrait, _NSConcreteStackBlock, 3221225472, sub_1000C9954, &unk_1001B3448))
  {
    id v5 = [(VOTEventFactory *)self directInteractionKeyboardManager];
    [v5 updateKeyboardElement];
  }
}

- (VOTElement)currentElement
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unint64_t v7 = sub_1000C9AC0;
  id v8 = sub_1000C9AD0;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (VOTElement *)v2;
}

- (void)startTapAndHoldMode:(BOOL)a3
{
  tapHoldTimer = self->_tapHoldTimer;
  id v4 = +[NSNumber numberWithBool:a3];
  [(SCRCTargetSelectorTimer *)tapHoldTimer dispatchAfterDelay:v4 withObject:0.0];
}

- (void)_beginNativeSliding:(id)a3
{
  if (a3)
  {
    currentGestureEvent = self->_currentGestureEvent;
    if (currentGestureEvent)
    {
      id v5 = a3;
      id v16 = [(VOTGestureEvent *)currentGestureEvent eventRepresentation];
      self->_flags.sendingToNativeSlide = 1;
      uint64_t v6 = [v16 handInfo];
      unint64_t v7 = [v6 paths];
      id v8 = [v7 firstPath];
      [v8 pathLocation];
      self->_nativeSlidingOffset.double x = v9;
      self->_nativeSlidingOffset.double y = v10;

      [v5 centerPoint];
      double v12 = v11;
      double v14 = v13;

      self->_nativeSlidingCenter.double x = v12;
      self->_nativeSlidingCenter.double y = v14;
      sub_1000C0B3C(v16, v12, v14);
      double v15 = +[VOTElement systemWideElement];
      [v15 repostEvent:v16];
    }
  }
}

- (int64_t)orientation
{
  return (int64_t)[(SCRCGestureFactory *)self->_gestureFactory orientation];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)_outputElementSummaryFired
{
  id v3 = +[VOTEvent touchEventWithCommand:kVOTEventCommandOutputElementSummary info:0];
  self->_flags.firedElementSummaryTimer = 1;
  [(VOTEventFactory *)self processEvent:v3];
}

- (void)cancelTapAndHold:(CGPoint)a3
{
  threadKedouble y = self->_threadKey;
  +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", a3.x, a3.y);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VOTEventFactory *)self performSelector:"_cancelTapAndHoldWithValue:" withThreadKey:threadKey count:1 objects:v5];
}

- (void)_cancelTapAndHoldWithValue:(id)a3
{
  [a3 pointValue];

  -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:");
}

- (void)_cancelTapAndHold:(CGPoint)a3
{
}

- (void)_cancelTapAndHold:(CGPoint)a3 forScribble:(BOOL)a4
{
  if (self->_flags.tapAndHoldMode)
  {
    double y = a3.y;
    double x = a3.x;
    if ([(VOTEventFactory *)self _tapAndHoldModeIsForScribble] && !a4)
    {
      id v8 = VOTLogEvent();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Scribble: Not canceling tap and hold, because scribble was in progress.", buf, 2u);
      }
      goto LABEL_6;
    }
    if (self->_flags.tapAndHoldMode)
    {
      CGFloat v9 = VOTLogEvent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100121CA8(x, y);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
      [WeakRetained performSelector:"updateCurrentElementFrame" withObject:0 afterDelay:0.25];

      self->_flags.BOOL tapAndHoldMode = 0;
      double v11 = +[VOTSpringBoardConnection defaultConnection];
      [v11 setInPassthroughMode:0];

      if (CGPointZero.x == x && CGPointZero.y == y)
      {
        -[VOTEventFactory _touchLiftAtPoint:](self, "_touchLiftAtPoint:", x, y);
        goto LABEL_20;
      }
      if (-[VOTEventFactory _systemControlPosition:fingerCount:](self, "_systemControlPosition:fingerCount:", 1, self->_systemControlStartPoint.x, self->_systemControlStartPoint.y) == 1)
      {
        *(void *)buf = 0;
        SCRCMathGetVectorAndDistanceForPoints();
        a3.double x = 0.0;
        a3.double y = 37.5;
        if (0.0 > 37.5)
        {
          a3.double x = 0.0;
          a3.double y = 255.0;
          if (0.0 > 255.0)
          {
            a3.double y = 290.0;
            if (0.0 < 290.0)
            {
              self->_int systemControlPosition = 1;
              id v8 = +[VOTEvent internalEventWithCommand:info:](VOTEvent, "internalEventWithCommand:info:", kVOTEventCommandSystemShowNotificationCenter, 0, 0.0);
              [(VOTEventFactory *)self _sendSystemControlEvent:v8];
LABEL_6:
            }
          }
        }
      }
    }
  }
LABEL_20:
  [(SCRCTargetSelectorTimer *)self->_tapHoldTimer cancel];
}

- (void)setElementManager:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_elementManager, obj);
    [obj setUpdateDelegate:self];
  }
}

- (void)directInteractionElementsUpdated:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  directInteractionElements = self->_directInteractionElements;
  self->_directInteractionElements = v4;

  _objc_release_x1(v4, directInteractionElements);
}

- (BOOL)directInteractionGestureInProgress
{
  return self->_flags.sendingToDirectTouch;
}

- (void)currentElementDidUpdate:(id)a3
{
  id v4 = a3;
  [(VOTEventFactory *)self setCurrentElement:v4];
  [(id)VOTSharedWorkspace currentElementDidUpdate:v4];
}

- (void)firstResponderDidUpdate:(id)a3
{
  id v5 = (VOTElement *)a3;
  if (self->_firstResponder != v5)
  {
    objc_storeStrong((id *)&self->_firstResponder, a3);
    if (self->_flags.tapAndHoldMode)
    {
      if ([(VOTEventFactory *)self _tapAndHoldModeIsForScribble])
      {
        unsigned int v6 = [(VOTEventFactory *)self _canScribbleWithElement:v5];
        unint64_t v7 = VOTLogEvent();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
        if (v6)
        {
          if (v8)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Scribble: Switching to new first responder while scribbling.", buf, 2u);
          }

          objc_storeStrong((id *)&self->_tapAndHoldScribbleElement, a3);
          self->_flags.tapAndHoldOffsetNeedsUpdate = 1;
        }
        else
        {
          if (v8)
          {
            *(_WORD *)CGFloat v9 = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Scribble: Ending because first responder changed.", v9, 2u);
          }

          [(VOTEventFactory *)self _endScribbleTapAndHoldMode];
        }
      }
    }
  }
}

- (void)_startLabelElementSoundPlay
{
  if (self->_flags.memorizingData)
  {
    id v3 = +[VOTOutputManager outputManager];
    id v4 = +[VOSOutputEvent ItemMemorizationInProgress];
    [v3 sendEvent:v4];

    [(SCRCTargetSelectorTimer *)self->_memorizeSoundTimer dispatchAfterDelay:0.5];
    self->_flags.didPlayStartLabelSound = 1;
  }
}

- (void)_stopMemorizingSession
{
  +[NSThread cancelPreviousPerformRequestsWithTarget:self selector:"_startLabelElementSoundPlay" object:0];
  [(SCRCTargetSelectorTimer *)self->_twoFingerHoldTimer cancel];
  [(SCRCTargetSelectorTimer *)self->_threeFingerHoldTimer cancel];
  [(SCRCTargetSelectorTimer *)self->_memorizeSoundTimer cancel];
  if (self->_flags.didPlayStartLabelSound && self->_flags.memorizingData)
  {
    id v3 = +[VOTOutputManager outputManager];
    id v4 = +[VOSOutputEvent ItemMemorizationFailed];
    [v3 sendEvent:v4];
  }
  self->_flags.memorizingData = 0;
  self->_flags.didPlayStartLabelSound = 0;
}

- (void)_edgePanGestureSpeakHintTimerFired
{
  unint64_t v2 = self->_edgePanGestureState - 2;
  if (v2 <= 5 && ((0x37u >> v2) & 1) != 0)
  {
    id v3 = sub_100051804(off_1001EA9E8, off_1001B6598[v2], 0);
    if (v3)
    {
      id v5 = v3;
      id v4 = sub_10000ABF8(v3, 0, 0);
    }
  }
}

- (BOOL)_tapAndHoldModeIsForScribble
{
  return self->_tapAndHoldScribbleElement != 0;
}

- (void)_tapHoldFired:(id)a3
{
  id v4 = a3;
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"TapHoldFired" object:0];
  }
  unsigned int v6 = +[VOTCommandHelper commandHelper];
  unsigned int v7 = [v6 helpEnabled];

  if (v7)
  {
    BOOL v8 = +[VOTEvent touchEventWithCommand:kVOTEventCommandTapAndHoldMode info:0];
    [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
    [(VOTEventFactory *)self convertDevicePointToZoomedPoint:sub_100051E14(v9)];
    objc_msgSend(v8, "setTouchPoint:");
    [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
    objc_msgSend(v8, "setTouchRawLocation:");
    [(VOTEventFactory *)self processEvent:v8];
  }
  else
  {
    if ([(SCRCTargetSelectorTimer *)self->_tapHoldTimer isCancelled]) {
      goto LABEL_7;
    }
    BOOL v8 = [(VOTEventFactory *)self currentElement];
    if (v8)
    {
      if (AXDeviceSupportsSonification()
        && ([v8 supportsAudiographs] & 1) != 0)
      {
        if (AXDeviceSupportsSonification())
        {
          CGFloat v10 = VOTLogEvent();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_100121D2C();
          }

          [(VOTEventFactory *)self _beginAudiographScrubbingMode];
        }
        goto LABEL_5;
      }
      double v11 = VOTLogEvent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100121D60();
      }

      [(SCRCGestureFactory *)self->_gestureFactory firstFingerPressure];
      double v13 = v12;
      [(SCRCGestureFactory *)self->_gestureFactory firstFingerAltitude];
      double v15 = v14;
      [(SCRCGestureFactory *)self->_gestureFactory firstFingerAzimuth];
      double v17 = *(double *)&v16;
      id v18 = v15;
      BOOL v19 = v16;
      self->_tapAndHoldFingerType = [(VOTEventFactory *)self _isStylusGesture];
      if (self->_firstResponder
        && [v8 isEqual:v17]
        && [(VOTEventFactory *)self _canScribbleWithElement:v8]
        && self->_tapAndHoldFingerType == 1)
      {
        BOOL v20 = VOTLogEvent();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Scribble: Starting.", (uint8_t *)buf, 2u);
        }

        objc_storeStrong((id *)&self->_tapAndHoldScribbleElement, v8);
      }
      else
      {
        tapAndHoldScribbleElement = self->_tapAndHoldScribbleElement;
        self->_tapAndHoldScribbleElement = 0;

        [(VOTEventFactory *)self _cancelScribbleTapAndHoldModeTimeout];
        [(VOTEventFactory *)self _cancelUpdateScribbleTapAndHoldModeOffset];
      }
      if ([(VOTEventFactory *)self _tapAndHoldModeIsForScribble]) {
        unsigned __int8 v22 = 0;
      }
      else {
        unsigned __int8 v22 = [v8 prefersContextlessPassthrough];
      }
      [(VOTEventFactory *)self _updateTapAndHoldLocationDataForElement:v8];
      double v24 = v23;
      uint64_t v26 = v25;
      if (![(VOTEventFactory *)self _tapAndHoldModeIsForScribble])
      {
        uint64_t v27 = +[VOTDisplayManager displayManager];
        [v27 clearCursorFrame];
      }
      id v28 = [v8 windowContextId];
      char v29 = +[AXBackBoardServer server];
      unsigned int v30 = [v29 contextIdHostingContextId:v28];

      unsigned int v46 = _NSConcreteStackBlock;
      uint64_t v47 = 3221225472;
      float v48 = sub_1000CA978;
      float v49 = &unk_1001B35D0;
      int64_t v50 = self;
      int v51 = (int)v28;
      unsigned int v52 = v30;
      AX_PERFORM_WITH_LOCK();
      self->_flags.tapAndHoldModeContextless = v22;
      self->_flags.BOOL tapAndHoldMode = 1;
      if ([(VOTEventFactory *)self _tapAndHoldModeIsForScribble])
      {
        id v31 = +[VOTOutputManager outputManager];
        double v32 = +[VOSOutputEvent TVDidBeginInteractionWithRotor];
        [v31 sendEvent:v32];
      }
      else if (v4 && !self->_flags.orbMode && [(id)VOTSharedWorkspace soundEffectsEnabled])
      {
        objc_initWeak(buf, self);
        double v33 = +[VOTOutputManager outputManager];
        double v40 = _NSConcreteStackBlock;
        uint64_t v41 = 3221225472;
        double v42 = sub_1000CAA20;
        double v43 = &unk_1001B6528;
        objc_copyWeak(v44, buf);
        v44[1] = v24;
        v44[2] = v26;
        v44[3] = v13;
        v44[4] = v18;
        v44[5] = v19;
        [v33 addVOSEventFinishedHandler:&v40 forIdentifier:@"PassThroughHandler"];

        double v34 = +[VOTOutputManager outputManager];
        double v35 = +[VOSOutputEvent DidBeginPassthrough];
        [v34 sendEvent:v35];

        objc_destroyWeak(v44);
        objc_destroyWeak(buf);
        goto LABEL_5;
      }
      double v36 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", *(double *)&v24, *(double *)&v26);
      double v37 = +[NSNumber numberWithDouble:*(double *)&v13];
      double v38 = +[NSNumber numberWithDouble:*(double *)&v18];
      uint64_t v39 = +[NSNumber numberWithDouble:*(double *)&v19];
      [(VOTEventFactory *)self _startTouchDownForTapAndHoldActionWithCenter:v36 force:v37 altitude:v38 azimuth:v39];
    }
  }
LABEL_5:

LABEL_7:
}

- (CGPoint)_updateTapAndHoldLocationDataForElement:(id)a3
{
  id v4 = a3;
  self->_flags.tapAndHoldOffsetNeedsUpdate = 0;
  [v4 centerPoint];
  double v6 = -1.0;
  BOOL v8 = v7 == -1.0 && v5 == -1.0;
  double x = -1.0;
  if (!v8)
  {
    [v4 updateVisiblePoint];
    [v4 visiblePoint];
    [v4 windowContextId];
    [v4 displayId];
    AXConvertPointFromHostedCoordinates();
    double x = v10;
    double v6 = v11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
  [WeakRetained currentLineFrame];
  double v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  BOOL v21 = CGPointZero.y == v16 && CGPointZero.x == v14;
  if ((objc_msgSend(v4, "doesHaveTraits:", kAXIsEditingTrait, CGPointZero.x) & 1) != 0
    || ([v4 doesHaveTraits:kAXTextAreaTrait] & 1) == 0)
  {
    unsigned int v22 = [v4 doesHaveTraits:kAXWebContentTrait | kAXStaticTextTrait] ^ 1;
  }
  else
  {
    unsigned int v22 = 0;
  }
  v44.origin.double x = v14;
  v44.origin.double y = v16;
  v44.size.width = v18;
  v44.size.height = v20;
  double MidX = CGRectGetMidX(v44);
  v45.origin.double x = v14;
  v45.origin.double y = v16;
  v45.size.width = v18;
  v45.size.height = v20;
  double MidY = CGRectGetMidY(v45);
  unsigned int v25 = +[VOTElement systemWideElement];
  objc_msgSend(v25, "convertPoint:toContextId:", objc_msgSend(v4, "windowContextId"), MidX, MidY);
  double v27 = v26;
  double v29 = v28;

  if ((v21 | v22) != 1
    || (objc_msgSend(v4, "dataDetectorURL:", v27, v29),
        unsigned int v30 = objc_claimAutoreleasedReturnValue(),
        v30,
        v30))
  {
    double v6 = MidY;
    double x = MidX;
  }
  [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
  self->_tapHoldOffset.double x = sub_100051E14(v31);
  p_tapHoldOffset = &self->_tapHoldOffset;
  self->_tapHoldOffset.double y = v33;
  p_double y = &self->_tapHoldOffset.y;
  -[VOTEventFactory convertDevicePointToZoomedPoint:](self, "convertDevicePointToZoomedPoint:");
  self->_tapHoldOffset.double x = v35;
  self->_tapHoldOffset.double y = v36;
  if ([(VOTEventFactory *)self _tapAndHoldModeIsForScribble])
  {
    if (v8)
    {
      double v37 = VOTLogEvent();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        sub_100121D94();
      }

      goto LABEL_22;
    }
    -[VOTEventFactory _startPointForScribbleWithElement:originalStartPoint:](self, "_startPointForScribbleWithElement:originalStartPoint:", v4, x, v6);
    double x = v38;
    double v6 = v39;
  }
  else if (v8)
  {
LABEL_22:
    double x = p_tapHoldOffset->x;
    double v6 = *p_y;
    CGPoint *p_tapHoldOffset = CGPointZero;
    goto LABEL_25;
  }
  p_tapHoldOffset->double x = x - p_tapHoldOffset->x;
  *p_double y = v6 - *p_y;
LABEL_25:
  self->_systemControlStartPoint.double x = x;
  self->_systemControlStartPoint.double y = v6;
  if ([v4 doesHaveTraits:kAXTableIndexTrait])
  {
    if ((char *)[(id)VOTSharedWorkspace deviceOrientation] - 3 >= (char *)2) {
      double v40 = (CGPoint *)&self->_tapHoldOffset.y;
    }
    else {
      double v40 = &self->_tapHoldOffset;
    }
    v40->double x = 0.0;
  }

  double v41 = x;
  double v42 = v6;
  result.double y = v42;
  result.double x = v41;
  return result;
}

- (CGPoint)_startPointForScribbleWithElement:(id)a3 originalStartPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  switch((unint64_t)[(SCRCGestureFactory *)self->_gestureFactory orientation])
  {
    case 0uLL:
      double v6 = 30.0;
      goto LABEL_4;
    case 1uLL:
      double v6 = -30.0;
LABEL_4:
      double x = x + v6;
      break;
    case 2uLL:
      double v7 = -30.0;
      goto LABEL_7;
    case 3uLL:
      double v7 = 30.0;
LABEL_7:
      double y = y + v7;
      break;
    default:
      break;
  }
  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)_startTouchDownForTapAndHoldActionWithCenter:(id)a3 force:(id)a4 altitude:(id)a5 azimuth:(id)a6
{
  if (self->_flags.tapAndHoldMode)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    [a3 pointValue];
    double v14 = v13;
    double v16 = v15;
    [v12 doubleValue];
    double v18 = v17;

    [v11 doubleValue];
    double v20 = v19;

    [v10 doubleValue];
    double v22 = v21;

    -[VOTEventFactory _touchDownAtPoint:withForce:altitude:azimuth:](self, "_touchDownAtPoint:withForce:altitude:azimuth:", v14, v16, v18, v20, v22);
    id v23 = +[VOTSpringBoardConnection defaultConnection];
    [v23 setInPassthroughMode:1];
  }
}

- (void)_twoFingerHoldFired
{
  self->_flags.memorizingData = 0;
  [(SCRCTargetSelectorTimer *)self->_memorizeSoundTimer cancel];
  id v3 = +[VOTWorkspace sharedWorkspace];
  id v9 = [v3 userCommandManager];

  id v4 = +[VOSGesture TwoFingerSingleTapAndHold];
  double v5 = [(VOTEventFactory *)self _commandResolver];
  double v6 = [v9 eventForTouchGesture:v4 resolver:v5 info:0];

  double v7 = +[VOTOutputManager outputManager];
  double v8 = +[VOSOutputEvent ItemMemorizationSucceeded];
  [v7 sendEvent:v8];

  [(VOTEventFactory *)self processEvent:v6];
}

- (void)_threeFingerHoldFired
{
  self->_flags.threeFingerTapAndSlide = 1;
  self->_flags.memorizingData = 0;
  id v3 = +[VOTEvent touchEventWithCommand:kVOTEventCommandShowEditingHUD info:0];
  [(VOTEventFactory *)self processEvent:v3];
}

- (void)_contextlessTouchWithHandType:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 altitude:(double)a6 azimuth:(double)a7
{
  uint64_t v10 = *(void *)&a3;
  AXNormalizePoint();
  +[AXEventRepresentation touchRepresentationWithHandType:location:](AXEventRepresentation, "touchRepresentationWithHandType:location:", v10);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v33 handInfo];
  double v13 = [v12 paths];
  double v14 = [v13 firstPath];
  [v14 setTransducerType:2];

  double v15 = [v33 handInfo];
  double v16 = [v15 paths];
  double v17 = [v16 firstPath];
  *(float *)&a5 = a5;
  LODWORD(v18) = LODWORD(a5);
  [v17 setOrbValue:v18];

  if (self->_tapAndHoldFingerType == 1)
  {
    double v19 = [v33 handInfo];
    double v20 = [v19 paths];
    double v21 = [v20 firstPath];
    [v21 setTransducerType:0];

    id v23 = [v33 handInfo];
    double v24 = [v23 paths];
    unsigned int v25 = [v24 firstPath];
    float v22 = a6;
    *(float *)&double v26 = v22;
    [v25 setAltitude:v26];

    double v28 = [v33 handInfo];
    double v29 = [v28 paths];
    unsigned int v30 = [v29 firstPath];
    float v27 = a7;
    *(float *)&double v31 = v27;
    [v30 setAzimuth:v31];
  }
  double v32 = +[AXEventTapManager sharedManager];
  [v32 sendHIDSystemEvent:v33 senderID:0x8000000817319373];
}

- (void)_touchDownAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_flags.tapAndHoldModeContextless)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [(VOTEventFactory *)self tapAndHoldContextNumbers];
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v13) {
      goto LABEL_17;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    while (1)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int64_t tapAndHoldFingerType = self->_tapAndHoldFingerType;
        if (tapAndHoldFingerType != 1)
        {
          if (!tapAndHoldFingerType)
          {
            double v19 = +[VOTElement systemWideElement];
            objc_msgSend(v19, "postFingerTouchAtPoint:withForce:withContextId:", objc_msgSend(v17, "unsignedIntValue"), x, y, a4);
            goto LABEL_15;
          }
          int64_t v20 = self->_tapAndHoldFingerType;
          _AXAssert();
        }
        double v19 = +[VOTElement systemWideElement];
        objc_msgSend(v19, "postStylusTouchAtPoint:withForce:altitude:azimuth:withContextId:", objc_msgSend(v17, "unsignedIntValue"), x, y, a4, a5, a6);
LABEL_15:
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v14)
      {
LABEL_17:

        return;
      }
    }
  }

  -[VOTEventFactory _contextlessTouchWithHandType:location:force:altitude:azimuth:](self, "_contextlessTouchWithHandType:location:force:altitude:azimuth:", 1);
}

- (void)_touchDragAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_flags.tapAndHoldModeContextless)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [(VOTEventFactory *)self tapAndHoldContextNumbers];
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v13) {
      goto LABEL_17;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    while (1)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int64_t tapAndHoldFingerType = self->_tapAndHoldFingerType;
        if (tapAndHoldFingerType != 1)
        {
          if (!tapAndHoldFingerType)
          {
            double v19 = +[VOTElement systemWideElement];
            objc_msgSend(v19, "postFingerDragAtPoint:withForce:withContextId:", objc_msgSend(v17, "unsignedIntValue"), x, y, a4);
            goto LABEL_15;
          }
          int64_t v20 = self->_tapAndHoldFingerType;
          _AXAssert();
        }
        double v19 = +[VOTElement systemWideElement];
        objc_msgSend(v19, "postStylusDragAtPoint:withForce:altitude:azimuth:withContextId:", objc_msgSend(v17, "unsignedIntValue"), x, y, a4, a5, a6);
LABEL_15:
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v14)
      {
LABEL_17:

        return;
      }
    }
  }

  -[VOTEventFactory _contextlessTouchWithHandType:location:force:altitude:azimuth:](self, "_contextlessTouchWithHandType:location:force:altitude:azimuth:", 2);
}

- (id)tapAndHoldContextNumbers
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x3032000000;
  double v7 = sub_1000C9AC0;
  double v8 = sub_1000C9AD0;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)_touchLiftAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_flags.tapAndHoldModeContextless)
  {
    -[VOTEventFactory _contextlessTouchWithHandType:location:force:altitude:azimuth:](self, "_contextlessTouchWithHandType:location:force:altitude:azimuth:", 6, a3.x, a3.y, 0.0, 0.0, 0.0);
    goto LABEL_16;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(VOTEventFactory *)self tapAndHoldContextNumbers];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7) {
    goto LABEL_15;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v16;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      int64_t tapAndHoldFingerType = self->_tapAndHoldFingerType;
      if (tapAndHoldFingerType != 1)
      {
        if (!tapAndHoldFingerType)
        {
          id v13 = +[VOTElement systemWideElement];
          objc_msgSend(v13, "postFingerLiftAtPoint:withContextId:", objc_msgSend(v11, "unsignedIntValue"), x, y);
          goto LABEL_13;
        }
        int64_t v14 = self->_tapAndHoldFingerType;
        _AXAssert();
      }
      id v13 = +[VOTElement systemWideElement];
      objc_msgSend(v13, "postStylusLiftAtPoint:withContextId:", objc_msgSend(v11, "unsignedIntValue"), x, y);
LABEL_13:
    }
    id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v8);
LABEL_15:

LABEL_16:
  if (AXDeviceSupportsSonification()) {
    [(VOTEventFactory *)self _endAudiographScrubbingMode];
  }
}

- (void)_processIdle:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  *(_WORD *)&self->_flags.twoFingerTapAndSlide = 0;
  -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:");
  [(VOTEventFactory *)self _stopMemorizingSession];
  self->_flags.splitSlide = 0;
  self->_flags.handwritingOnldouble y = 0;
  [(SCRCTargetSelectorTimer *)self->_systemControlLocationTimer cancel];
  self->_systemControlActivated = 0;
  *(_OWORD *)&self->_systemControlStartSwipeTime = xmmword_10016E960;
  id v6 = +[VOTEvent touchEventWithCommand:kVOTEventCommandIdle info:0];
  objc_msgSend(v6, "setTouchPoint:", x, y);
  [(VOTEventFactory *)self processEvent:v6];
  if ([(VOTEventFactory *)self _shouldDismissPreviewOnLift]
    && ![(VOTEventFactory *)self _isPreviewElementSelected])
  {
    [(VOTEventFactory *)self _liftFromTapAndHoldAndResetFingers:1];
  }
  else
  {
    self->_isPreviewPinned = 1;
  }
}

- (void)_processTapAndHoldMode:(id)a3
{
  id v4 = a3;
  if (self->_flags.orbMode
    && ([(SCRCGestureFactory *)self->_gestureFactory firstFingerPressure],
        double v6 = v5,
        AXForceTouchThresholdPeek(),
        v6 < v7))
  {
    [(VOTEventFactory *)self _switchToTrackingMode];
  }
  else
  {
    id v8 = +[VOTCommandHelper commandHelper];
    unsigned __int8 v9 = [v8 helpEnabled];

    if ((v9 & 1) == 0)
    {
      if ([v4 fingerCount] == (id)1)
      {
        if (self->_flags.audiographScrubbingMode)
        {
          if (AXDeviceSupportsSonification()) {
            [(VOTEventFactory *)self _handleAudiographScrubbingPositionChanged];
          }
        }
        else
        {
          [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
          double v11 = sub_100051E14(v10);
          double v13 = v12;
          [(SCRCGestureFactory *)self->_gestureFactory firstFingerPressure];
          double v15 = v14;
          [(SCRCGestureFactory *)self->_gestureFactory firstFingerAltitude];
          double v17 = v16;
          [(SCRCGestureFactory *)self->_gestureFactory firstFingerAzimuth];
          double v19 = v18;
          if ([(VOTEventFactory *)self _tapAndHoldModeIsForScribble]
            && [v4 isDownEvent])
          {
            if (self->_flags.tapAndHoldOffsetNeedsUpdate) {
              [(VOTEventFactory *)self _updateTapAndHoldLocationDataForElement:self->_firstResponder];
            }
            int v20 = 1;
          }
          else
          {
            int v20 = 0;
          }
          -[VOTEventFactory convertDevicePointToZoomedPoint:](self, "convertDevicePointToZoomedPoint:", v11 + self->_tapHoldOffset.x, v13 + self->_tapHoldOffset.y);
          double v25 = v23;
          double v26 = v24;
          if (v20)
          {
            if (![(VOTEventFactory *)self _isStylusGesture])
            {
              float v27 = VOTLogEvent();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
                sub_100121DD4();
              }
            }
            [(VOTEventFactory *)self _cancelScribbleTapAndHoldModeTimeout];
            [(VOTEventFactory *)self _cancelUpdateScribbleTapAndHoldModeOffset];
            -[VOTEventFactory _touchDownAtPoint:withForce:altitude:azimuth:](self, "_touchDownAtPoint:withForce:altitude:azimuth:", v25, v26, v15, v17, v19);
          }
          else
          {
            -[VOTEventFactory _touchDragAtPoint:withForce:altitude:azimuth:](self, "_touchDragAtPoint:withForce:altitude:azimuth:", v23, v24, v15, v17, v19);
          }
          double v28 = +[VOTEvent touchEventWithCommand:kVOTEventCommandTapAndHoldEventMonitor info:0];
          objc_msgSend(v28, "setTouchPoint:", v25, v26);
          [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
          objc_msgSend(v28, "setTouchRawLocation:");
          [v28 setTouchForce:v15];
          [(VOTEventFactory *)self processEvent:v28];
        }
      }
      else if (self->_flags.audiographScrubbingMode)
      {
        [(VOTEventFactory *)self _endAudiographScrubbingMode];
      }
      else if ([(VOTEventFactory *)self _tapAndHoldModeIsForScribble])
      {
        long long v21 = VOTLogEvent();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Scribble: Lift occurred, but not ending tap and hold because scribble was in progress.", v29, 2u);
        }

        [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
        [(VOTEventFactory *)self _touchLiftAtPoint:sub_100051E14(v22)];
        [(VOTEventFactory *)self _startScribbleTapAndHoldModeTimeout];
        [(VOTEventFactory *)self _scheduleUpdateScribbleTapAndHoldModeOffset];
      }
      else
      {
        [(VOTEventFactory *)self _liftFromTapAndHoldAndResetFingers:1];
      }
    }
  }
}

- (void)_cancelScribbleTapAndHoldModeTimeout
{
  id v3 = VOTLogEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Scribble: Cancel timeout.", v4, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endScribbleTapAndHoldMode" object:0];
}

- (void)_startScribbleTapAndHoldModeTimeout
{
  [(VOTEventFactory *)self _cancelScribbleTapAndHoldModeTimeout];
  id v3 = VOTLogEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Scribble: Will end after delay.", v4, 2u);
  }

  [(VOTEventFactory *)self performSelector:"_endScribbleTapAndHoldMode" withObject:0 afterDelay:5.0];
}

- (void)_endScribbleTapAndHoldMode
{
  if (self->_flags.tapAndHoldMode
    && [(VOTEventFactory *)self _tapAndHoldModeIsForScribble])
  {
    [(VOTEventFactory *)self _cancelScribbleTapAndHoldModeTimeout];
    id v3 = VOTLogEvent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Scribble: Ending.", v6, 2u);
    }

    -[VOTEventFactory _cancelTapAndHold:forScribble:](self, "_cancelTapAndHold:forScribble:", 1, CGPointZero.x, CGPointZero.y);
    id v4 = +[VOTOutputManager outputManager];
    double v5 = +[VOSOutputEvent TVDidEndInteractionWithRotor];
    [v4 sendEvent:v5];
  }
}

- (void)_cancelUpdateScribbleTapAndHoldModeOffset
{
  id v3 = VOTLogEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Scribble: Cancel update for offset.", v4, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_markTapAndHoldOffsetAsDirty" object:0];
}

- (void)_scheduleUpdateScribbleTapAndHoldModeOffset
{
  [(VOTEventFactory *)self _cancelUpdateScribbleTapAndHoldModeOffset];
  id v3 = VOTLogEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Scribble: Will update offset after delay.", v4, 2u);
  }

  [(VOTEventFactory *)self performSelector:"_markTapAndHoldOffsetAsDirty" withObject:0 afterDelay:1.0];
}

- (void)_markTapAndHoldOffsetAsDirty
{
  [(VOTEventFactory *)self _cancelUpdateScribbleTapAndHoldModeOffset];
  id v3 = VOTLogEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Scribble: Set flag that offset needs update.", v4, 2u);
  }

  self->_flags.tapAndHoldOffsetNeedsUpdate = 1;
}

- (void)_liftFromTapAndHoldAndResetFingers:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = VOTLogEvent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100121E14(v3, v5);
  }

  [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
  double v7 = sub_100051E14(v6);
  double v9 = v8;
  -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:");
  -[VOTEventFactory _touchLiftAtPoint:](self, "_touchLiftAtPoint:", v7 + self->_tapHoldOffset.x, v9 + self->_tapHoldOffset.y);
  [(VOTEventFactory *)self _liftPreviewFinger];
  AXPerformBlockOnMainThreadAfterDelay();
  if (v3) {
    [(VOTEventFactory *)self _setFingerCount:0];
  }
}

- (BOOL)_canScribbleWithElement:(id)a3
{
  id v3 = a3;
  if (AXDeviceSupportsPencil()) {
    unsigned __int8 v4 = [v3 doesHaveTraits:kAXTextEntryTrait];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_beginAudiographScrubbingMode
{
  if (AXDeviceSupportsSonification())
  {
    self->_flags.BOOL tapAndHoldMode = 1;
    tapAndHoldScribbleElement = self->_tapAndHoldScribbleElement;
    self->_tapAndHoldScribbleElement = 0;

    if (!self->_flags.orbMode)
    {
      unsigned __int8 v4 = +[VOTOutputManager outputManager];
      double v5 = +[VOSOutputEvent DidBeginPassthrough];
      [v4 sendEvent:v5];
    }
    self->_flags.audiographScrubbingMode = 1;
    [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
    self->_audiographScrubbingPreviousLocation.double x = sub_100051FD4((uint64_t)[(SCRCGestureFactory *)self->_gestureFactory orientation], v6, v7);
    self->_audiographScrubbingPreviousLocation.double y = v8;
    id v9 = +[VOTAudiographManager sharedManager];
    [v9 beginScrubbingSession];
  }
}

- (void)_handleAudiographScrubbingPositionChanged
{
  if (AXDeviceSupportsSonification())
  {
    [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
    double v5 = sub_100051FD4((uint64_t)[(SCRCGestureFactory *)self->_gestureFactory orientation], v3, v4);
    CGFloat v7 = v6;
    double v8 = (v5 - self->_audiographScrubbingPreviousLocation.x) * 1.5;
    if (v8 != 0.0)
    {
      id v9 = +[VOTAudiographManager sharedManager];
      [v9 currentPlaybackPosition];
      double v11 = v10;

      double v12 = v8 + v11;
      BOOL v13 = 1.0 - v11 > 0.00001 && v11 > 0.00001;
      self->_canPlayBoundaryFeedback = v13;
      if (v12 >= 0.0)
      {
        if (v12 > 1.0)
        {
          double v14 = 1.0;
        }
        else
        {
          BOOL v13 = 0;
          double v14 = v8 + v11;
        }
        if (!v13) {
          goto LABEL_15;
        }
        double v18 = +[VOTAudiographManager sharedManager];
        [v18 playHapticWithType:3];

        double v16 = +[VOTOutputManager outputManager];
        double v17 = +[VOSOutputEvent BoundaryEncountered];
        [v16 sendEvent:v17];
        double v14 = 1.0;
      }
      else
      {
        double v14 = 0.0;
        if (!v13)
        {
LABEL_15:
          double v19 = +[VOTAudiographManager sharedManager];
          [v19 scrubToPosition:v14];

          self->_audiographScrubbingPreviousLocation.double x = v5;
          self->_audiographScrubbingPreviousLocation.double y = v7;
          return;
        }
        double v15 = +[VOTAudiographManager sharedManager];
        [v15 playHapticWithType:18];

        double v16 = +[VOTOutputManager outputManager];
        double v17 = +[VOSOutputEvent BoundaryEncountered];
        [v16 sendEvent:v17];
      }

      goto LABEL_15;
    }
  }
}

- (void)_endAudiographScrubbingMode
{
  if (AXDeviceSupportsSonification())
  {
    double v3 = +[VOTAudiographManager sharedManager];
    unsigned int v4 = [v3 isScrubbing];

    if (v4)
    {
      double v5 = +[VOTAudiographManager sharedManager];
      [v5 endScrubbingSession];

      self->_flags.audiographScrubbingMode = 0;
    }
  }
}

- (void)_handleElementPreviewNotification:(id)a3
{
  unsigned int v4 = [a3 isEqualToNumber:&__kCFBooleanTrue];
  self->_BOOL isInPreview = v4;
  if (v4)
  {
    self->_previewStartTime = CFAbsoluteTimeGetCurrent();
    [(VOTEventFactory *)self _updateCurrentElementOrbGestureMode];
    [(VOTEventFactory *)self _switchToTrackingMode];
  }
  else
  {
    self->_isPreviewPinned = 0;
    [(VOTEventFactory *)self _liftPreviewFinger];
  }
}

- (void)_handleKeyboardVisibilityChanged:(id)a3
{
}

- (CGPoint)convertDevicePointToZoomedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (_AXSZoomTouchEnabled()
    && *(float *)&dword_1001EBA68 > 1.0
    && !CGRectIsEmpty(*(CGRect *)ymmword_1001EBA70)
    && (AXInCheckerBoardScenario() & 1) == 0
    && (AXInPreboardScenario() & 1) == 0)
  {
    LODWORD(v6) = dword_1001EBA68;
    if (*(float *)&dword_1001EBA68 == 0.0)
    {
      CGFloat v7 = +[ZoomServices sharedInstance];
      [v7 zoomLevelOnDisplay:0];
      *(float *)&double v8 = v8;
      dword_1001EBA68 = LODWORD(v8);

      id v9 = +[ZoomServices sharedInstance];
      [v9 zoomFrameOnDisplay:0];
      +[VOTEventFactory _updateZoomFrame:](VOTEventFactory, "_updateZoomFrame:");
    }
    -[VOTEventFactory _convertFrame:toPortraitFromOrientation:](self, "_convertFrame:toPortraitFromOrientation:", [(SCRCGestureFactory *)self->_gestureFactory orientation], *(double *)ymmword_1001EBA70, *(double *)&ymmword_1001EBA70[8], *(double *)&ymmword_1001EBA70[16], *(double *)&ymmword_1001EBA70[24]);
    double x = floor(v12 + x / *(double *)&xmmword_1001EBE30 * v10);
    double y = floor(v13 + v11 * (y / *((double *)&xmmword_1001EBE30 + 1)));
  }
  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (CGRect)_convertFrame:(CGRect)a3 toPortraitFromOrientation:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  switch(a4)
  {
    case 3:
      double v11 = *(double *)&xmmword_1001EBE30;
      double v9 = v11 - CGRectGetMaxY(a3);
LABEL_7:
      double v13 = height;
      CGFloat height = width;
      goto LABEL_10;
    case 2:
      double v12 = *((double *)&xmmword_1001EBE30 + 1);
      double x = v12 - CGRectGetMaxX(a3);
      double v9 = y;
      goto LABEL_7;
    case 1:
      double v8 = *(double *)&xmmword_1001EBE30;
      double v9 = v8 - CGRectGetMaxX(a3);
      double v10 = *((double *)&xmmword_1001EBE30 + 1);
      v17.origin.double x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      double x = v10 - CGRectGetMaxY(v17);
      break;
    default:
      double v9 = a3.origin.x;
      double x = a3.origin.y;
      break;
  }
  double v13 = width;
LABEL_10:
  double v14 = v9;
  double v15 = x;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGPoint)_convertZoomPointToDevicePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[VOTEventFactory _convertFrame:toPortraitFromOrientation:](self, "_convertFrame:toPortraitFromOrientation:", [(SCRCGestureFactory *)self->_gestureFactory orientation], *(double *)ymmword_1001EBA70, *(double *)&ymmword_1001EBA70[8], *(double *)&ymmword_1001EBA70[16], *(double *)&ymmword_1001EBA70[24]);
  double v9 = *(double *)&xmmword_1001EBE30 * ((x - v5) / v7);
  double v10 = *((double *)&xmmword_1001EBE30 + 1) * ((y - v6) / v8);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_convertZoomRecordToDeviceRecord:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 3001)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = objc_msgSend(v4, "handInfo", 0);
    double v6 = [v5 paths];

    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          [v11 pathLocation];
          -[VOTEventFactory _convertZoomPointToDevicePoint:](self, "_convertZoomPointToDevicePoint:");
          objc_msgSend(v11, "setPathLocation:");
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_handleEventWithData:(id)a3
{
  uint64_t v4 = +[AXEventRepresentation representationWithData:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    long long v13 = (void *)v4;
    uint64_t v4 = (uint64_t)[(id)v4 additionalFlags];
    uint64_t v5 = (uint64_t)v13;
    if ((v4 & 0x2000000) != 0)
    {
      uint64_t v4 = (uint64_t)[v13 senderID];
      uint64_t v5 = (uint64_t)v13;
      if (v4 != 0x8000000817319373)
      {
        if (_AXSZoomTouchEnabled())
        {
          LODWORD(v6) = dword_1001EBA68;
          if (*(float *)&dword_1001EBA68 > 1.0
            && !CGRectIsEmpty(*(CGRect *)ymmword_1001EBA70)
            && (AXInPreboardScenario() & 1) == 0
            && (AXInCheckerBoardScenario() & 1) == 0)
          {
            [(VOTEventFactory *)self _convertZoomRecordToDeviceRecord:v13];
          }
        }
        unsigned int v7 = objc_msgSend(v13, "originalType", v6);
        switch(v7)
        {
          case 0x3E9u:
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained handleMenuButtonPress:v13];

            goto LABEL_24;
          case 0x3EAu:
          case 0x3EBu:
          case 0x3ECu:
          case 0x3EDu:
          case 0x3EEu:
          case 0x3F0u:
          case 0x3F6u:
          case 0x3F7u:
          case 0x3F8u:
          case 0x3F9u:
          case 0x3FAu:
          case 0x3FBu:
          case 0x3FCu:
          case 0x3FDu:
          case 0x3FEu:
          case 0x3FFu:
          case 0x400u:
            break;
          case 0x3EFu:
          case 0x3F1u:
            id v8 = objc_loadWeakRetained((id *)&self->_delegate);
            [v8 handleVolumeButtonPress:v13];
            goto LABEL_15;
          case 0x3F2u:
LABEL_24:
            [(id)VOTSharedWorkspace unmuteEligibleEventOccured];
            break;
          case 0x3F3u:
            id v8 = objc_loadWeakRetained((id *)&self->_delegate);
            [v8 handleLockButtonPress:v13];
            goto LABEL_15;
          case 0x3F4u:
          case 0x3F5u:
            goto LABEL_14;
          case 0x401u:
          case 0x402u:
          case 0x403u:
          case 0x404u:
          case 0x405u:
          case 0x406u:
            id v8 = objc_loadWeakRetained((id *)&self->_delegate);
            [v8 handleMediaKeyPress:v13];
            goto LABEL_15;
          case 0x407u:
            id v8 = objc_loadWeakRetained((id *)&self->_delegate);
            [v8 handleProximityEvent:v13];
            goto LABEL_15;
          case 0x408u:
          case 0x409u:
            id v9 = objc_loadWeakRetained((id *)&self->_delegate);
            [v9 handlePlayPauseKeyPress:v13];

LABEL_14:
            id v8 = objc_loadWeakRetained((id *)&self->_delegate);
            [v8 handleRingerSwitchSwitched:v13];
LABEL_15:

            break;
          default:
            if (v7 == 3001)
            {
              double v10 = +[AXElement systemWideElement];
              unsigned __int8 v11 = [v10 isPassivelyListeningForEvents];

              if ((v11 & 1) == 0) {
                _AXAssert();
              }
            }
            break;
        }
        uint64_t v4 = (uint64_t)[(id)VOTSharedWorkspace userInteractedWithDevice];
        uint64_t v5 = (uint64_t)v13;
      }
    }
  }

  _objc_release_x1(v4, v5);
}

- (CGPoint)fingerPosition
{
  [(SCRCGestureFactory *)self->_gestureFactory rawLocation];

  double v3 = sub_100051E14(v2);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)_setFingerCount:(unint64_t)a3
{
  self->_int64_t fingerCount = a3;
  if (!a3) {
    [(VOTEventFactory *)self _commitDeferredZoomInfo];
  }
}

- (unint64_t)fingerCount
{
  return self->_fingerCount;
}

- (BOOL)tapAndHoldMode
{
  return self->_flags.tapAndHoldMode;
}

- (void)directInteractionModeStatus:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(VOTEventFactory *)self directInteractionKeyboardManager];
    [v4 gestureKeyboardRegion];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    -[VOTEventFactory _convertFrame:toPortraitFromOrientation:](self, "_convertFrame:toPortraitFromOrientation:", [(SCRCGestureFactory *)self->_gestureFactory orientation], v6, v8, v10, v12);
    double v14 = v13;
    double x = sub_100051DFC(v15);
    double y = v17;
    double width = sub_100051DFC(v14);
    double height = v20;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  gestureFactordouble y = self->_gestureFactory;

  -[SCRCGestureFactory setTapSpeedTimeThreshold:forRegion:fingerCount:](gestureFactory, "setTapSpeedTimeThreshold:forRegion:fingerCount:", 3, 0.0, x, y, width, height);
}

- (BOOL)_isPreviewElementSelected
{
  double v2 = [(VOTEventFactory *)self currentElement];
  double v3 = [v2 identifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"PreviewContainerElement"];

  return v4;
}

- (void)_simulatePreviewActionGesture
{
  int y = (int)self->_previewFingerLocation.y;
  if (y >= 1)
  {
    do
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      unsigned __int8 v4 = self->_previewFingerContextId;
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v14;
        double v8 = fmax((double)y, 0.0);
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            self->_previewFingerLocation.int y = v8;
            double v11 = +[VOTElement systemWideElement];
            objc_msgSend(v11, "postFingerDragAtPoint:withForce:withContextId:", objc_msgSend(v10, "unsignedIntValue"), self->_previewFingerLocation.x, self->_previewFingerLocation.y, 0.0);
          }
          id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }

      usleep(0x3E8u);
      BOOL v12 = __OFSUB__(y, 5);
      y -= 5;
    }
    while (!((y < 0) ^ v12 | (y == 0)));
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_reducePreviewFingerStartingForce:(double)a3
{
  for (double i = self->_previewFingerStartingForce; i > a3; double i = self->_previewFingerStartingForce)
  {
    self->_double previewFingerStartingForce = fmax(a3, i + -2.0);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = self->_previewFingerContextId;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        double v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
          BOOL v12 = +[VOTElement systemWideElement];
          objc_msgSend(v12, "postFingerTouchAtPoint:withForce:withContextId:", objc_msgSend(v11, "unsignedIntValue"), self->_previewFingerLocation.x, self->_previewFingerLocation.y, self->_previewFingerStartingForce);

          double v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    usleep(5u);
  }
}

- (void)_simulatePop
{
  self->_BOOL isInPreview = 0;
  self->_isPreviewPinned = 0;
  AXForceTouchThresholdPeekPopMidpoint();
  -[VOTEventFactory _reducePreviewFingerStartingForce:](self, "_reducePreviewFingerStartingForce:");
  double previewFingerStartingForce = self->_previewFingerStartingForce;
  self->_double currentTouchForce = previewFingerStartingForce;
  AXForceTouchThresholdPop();
  if (previewFingerStartingForce <= v4)
  {
    do
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = self->_previewFingerContextId;
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (double i = 0; i != v7; double i = (char *)i + 1)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            double v11 = +[VOTElement systemWideElement];
            objc_msgSend(v11, "postFingerTouchAtPoint:withForce:withContextId:", objc_msgSend(v10, "unsignedIntValue"), self->_previewFingerLocation.x, self->_previewFingerLocation.y, self->_currentTouchForce);
          }
          id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }

      usleep(5u);
      double v12 = self->_currentTouchForce + 2.0;
      self->_double currentTouchForce = v12;
      AXForceTouchThresholdPop();
    }
    while (v12 <= v13);
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_simulateEdgePress
{
  if (vabdd_f64(CFAbsoluteTimeGetCurrent(), self->_lastEdgePressTime) > 2.0)
  {
    self->_lastEdgePressTime = CFAbsoluteTimeGetCurrent();
    id v6 = objc_alloc_init(VOTEvent);
    [(VOTEvent *)v6 setCommand:kVOTEventCommandHomeButtonPress];
    double v3 = [(VOTEventFactory *)self elementManager];
    [v3 handleEvent:v6];

    double v4 = [(VOTEventFactory *)self elementManager];
    [v4 handleEvent:v6];

    id v5 = +[AXSpringBoardServer server];
    [v5 simulateEdgePressHaptics];
  }
}

- (void)_simulatePeekAndSwitchToTapHoldMode
{
  double v3 = [(VOTEventFactory *)self currentElement];
  double v4 = v3;
  if (v3)
  {
    [v3 centerPoint];
    double v6 = -1.0;
    BOOL v8 = v7 == -1.0 && v5 == -1.0;
    double v9 = -1.0;
    if (!v8)
    {
      [v4 updateVisiblePoint];
      [v4 visiblePoint];
      [v4 windowContextId];
      [v4 displayId];
      AXConvertPointFromHostedCoordinates();
      double v9 = v10;
      double v6 = v11;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
    [WeakRetained currentLineFrame];
    double v14 = v13;
    double v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    BOOL v21 = CGPointZero.y == v16 && CGPointZero.x == v14;
    if ((objc_msgSend(v4, "doesHaveTraits:", kAXIsEditingTrait, CGPointZero.x) & 1) != 0
      || ([v4 doesHaveTraits:kAXTextAreaTrait] & 1) == 0)
    {
      unsigned int v22 = [v4 doesHaveTraits:kAXWebContentTrait | kAXStaticTextTrait] ^ 1;
    }
    else
    {
      unsigned int v22 = 0;
    }
    v56.origin.double x = v14;
    v56.origin.int y = v16;
    v56.size.double width = v18;
    v56.size.double height = v20;
    double MidX = CGRectGetMidX(v56);
    v57.origin.double x = v14;
    v57.origin.int y = v16;
    v57.size.double width = v18;
    v57.size.double height = v20;
    double MidY = CGRectGetMidY(v57);
    double v25 = +[VOTElement systemWideElement];
    objc_msgSend(v25, "convertPoint:toContextId:", objc_msgSend(v4, "windowContextId"), MidX, MidY);
    double v27 = v26;
    double v29 = v28;

    if ((v21 | v22) != 1
      || (objc_msgSend(v4, "dataDetectorURL:", v27, v29),
          unsigned int v30 = objc_claimAutoreleasedReturnValue(),
          v30,
          v30))
    {
      double v6 = MidY;
      double v9 = MidX;
    }
    id v31 = [v4 windowContextId];
    double v32 = +[AXBackBoardServer server];
    unsigned int v33 = [v32 contextIdHostingContextId:v31];

    float v48 = _NSConcreteStackBlock;
    uint64_t v49 = 3221225472;
    int64_t v50 = sub_1000CDBA4;
    int v51 = &unk_1001B35D0;
    unsigned int v52 = self;
    int v53 = (int)v31;
    unsigned int v54 = v33;
    AX_PERFORM_WITH_LOCK();
    self->_double currentTouchForce = 0.0;
    AXForceTouchThresholdPeek();
    if (v34 > 0.0)
    {
      do
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        CGFloat v35 = [(VOTEventFactory *)self tapAndHoldContextNumbers];
        id v36 = [v35 countByEnumeratingWithState:&v44 objects:v55 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v45;
          do
          {
            for (double i = 0; i != v37; double i = (char *)i + 1)
            {
              if (*(void *)v45 != v38) {
                objc_enumerationMutation(v35);
              }
              double v40 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              double v41 = +[VOTElement systemWideElement];
              objc_msgSend(v41, "postFingerTouchAtPoint:withForce:withContextId:", objc_msgSend(v40, "unsignedIntValue"), v9, v6, self->_currentTouchForce);
            }
            id v37 = [v35 countByEnumeratingWithState:&v44 objects:v55 count:16];
          }
          while (v37);
        }

        usleep(0x3E8u);
        double v42 = self->_currentTouchForce + 30.0;
        self->_double currentTouchForce = v42;
        AXForceTouchThresholdPeek();
      }
      while (v42 < v43);
    }
  }
  self->_flags.orbMode = 1;
  [(SCRCTargetSelectorTimer *)self->_tapHoldTimer dispatchAfterDelay:&__kCFBooleanTrue withObject:0.0];
}

- (void)_switchToTrackingMode
{
  self->_flags.BOOL tapAndHoldMode = 0;
  self->_flags.orbMode = 0;
  [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
  double v4 = sub_100051E14(v3);
  double v6 = v5;
  [(SCRCGestureFactory *)self->_gestureFactory firstFingerPressure];
  double v8 = v7;
  -[VOTEventFactory convertDevicePointToZoomedPoint:](self, "convertDevicePointToZoomedPoint:", v4, v6);
  double v11 = v9;
  double v12 = v10;
  if (self->_isInPreview)
  {
    self->_double previewFingerStartingForce = v8;
    self->_previewFingerLocation.double x = v9;
    self->_previewFingerLocation.int y = v10;
    self->_previewPopDelayTime = CFAbsoluteTimeGetCurrent();
    double v13 = [(VOTEventFactory *)self currentElement];
    if (v13)
    {
      [(NSMutableArray *)self->_previewFingerContextId removeAllObjects];
      id v14 = [v13 windowContextId];
      previewFingerContextId = self->_previewFingerContextId;
      double v16 = +[NSNumber numberWithUnsignedInt:v14];
      [(NSMutableArray *)previewFingerContextId addObject:v16];

      double v17 = +[AXBackBoardServer server];
      id v18 = [v17 contextIdHostingContextId:v14];

      double v19 = self->_previewFingerContextId;
      CGFloat v20 = +[NSNumber numberWithUnsignedInt:v18];
      [(NSMutableArray *)v19 addObject:v20];
    }
  }
  else
  {
    [(VOTEventFactory *)self _liftFromTapAndHoldAndResetFingers:0];
  }
  id v22 = objc_alloc_init((Class)AXIndexMap);
  [v22 setObject:&__kCFBooleanTrue forIndex:112];
  BOOL v21 = +[VOTEvent touchEventWithCommand:kVOTEventCommandTracking info:v22];
  [(VOTEventFactory *)self _updateFirstnessOfTrackingEvent:v21];
  objc_msgSend(v21, "setTouchPoint:", v11, v12);
  [(SCRCGestureFactory *)self->_gestureFactory rawLocation];
  objc_msgSend(v21, "setTouchRawLocation:");
  [v21 setTouchForce:v8];
  [(VOTEventFactory *)self processEvent:v21];
}

- (void)_liftPreviewFinger
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = self->_previewFingerContextId;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        CGFloat v9 = +[VOTElement systemWideElement];
        objc_msgSend(v9, "postFingerLiftAtPoint:withContextId:", objc_msgSend(v8, "unsignedIntValue"), self->_previewFingerLocation.x, self->_previewFingerLocation.y);

        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_previewFingerContextId removeAllObjects];
}

- (BOOL)_shouldDismissPreviewOnLift
{
  return CFAbsoluteTimeGetCurrent() - self->_previewStartTime > 1.0 && !self->_isPreviewPinned;
}

- (void)_updateCurrentElementOrbGestureMode
{
  self->_int64_t currentOrbGestureMode = 2;
  double v3 = [(VOTEventFactory *)self currentElement];
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v5 = [(VOTEventFactory *)self currentElement];
    uint64_t v6 = [v5 uiElement];
    double v7 = [v6 arrayWithAXAttribute:2063];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (double i = 0; i != v10; double i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "objectForKeyedSubscript:", @"AXSupportedGestureTypeKey", (void)v17);
          id v15 = [v14 integerValue];

          if (v15 == (id)6)
          {
            double v16 = [v13 objectForKeyedSubscript:@"AXOrbGestureMode"];
            self->_int64_t currentOrbGestureMode = (int)[v16 intValue];

            goto LABEL_12;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (double)_edgePanGestureStartThreshold
{
  double v2 = dbl_10016E970[((unint64_t)[(SCRCGestureFactory *)self->_gestureFactory orientation] & 0xFFFFFFFFFFFFFFFELL) == 2];
  int IsPad = AXDeviceIsPad();
  double result = 0.0199999996;
  if (!IsPad) {
    return v2;
  }
  return result;
}

- (id)votActionForEdgePanGestureState:(unint64_t)a3
{
  unint64_t v4 = a3 - 3;
  if (a3 - 3 <= 6 && ((0x5Fu >> v4) & 1) != 0)
  {
    id v5 = *(id *)*(&off_1001B65C8 + v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)gesturedTextInputManager:(id)a3 moveToElementMatchingRotorType:(int64_t)a4 inDirection:(int64_t)a5
{
  id v7 = [(VOTEventFactory *)self elementManager];
  [v7 moveToElementMatchingRotorType:a4 inDirection:a5];
}

- (void)gesturedTextInputManager:(id)a3 accessCurrentGesturedTextInputElement:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  id v5 = [(VOTEventFactory *)self currentElement];
  uint64_t v6 = [v5 elementForGesturedTextInput];

  if (!v6)
  {
    uint64_t v6 = [(VOTEventFactory *)self currentElement];
  }
  v7[2](v7, v6);
}

- (void)brailleGestureManager:(id)a3 setForcedOrientation:(int64_t)a4 shouldAnnounce:(BOOL)a5
{
  BOOL v5 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained handleSetForcedOrientation:a4 shouldAnnounce:v5];
}

- (void)brailleGestureManager:(id)a3 unsetForcedOrientationAndAnnounce:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained handleUnsetForcedOrientationAndAnnounce:v4];
}

- (BOOL)_handleAccessibilityEvent:(id)a3
{
  BOOL v4 = [a3 accessibilityData];
  if ([v4 page] != (id)1) {
    goto LABEL_8;
  }
  if ([v4 usage] == (id)1) {
    +[VOSGesture BackTapDoubleTap];
  }
  else {
  BOOL v5 = +[VOSGesture BackTapTripleTap];
  }
  uint64_t v6 = +[VOTWorkspace sharedWorkspace];
  id v7 = [v6 userCommandManager];

  id v8 = [(VOTEventFactory *)self _commandResolver];
  id v9 = [v7 eventForTouchGesture:v5 resolver:v8];

  if (!v9)
  {

LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  id v10 = v9;
  AXPerformBlockAsynchronouslyOnMainThread();

  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)handleVOSGesture:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  BOOL v5 = [(id)VOTSharedWorkspace userCommandManager];
  uint64_t v6 = [(VOTEventFactory *)self _commandResolver];
  id v7 = [v5 eventForTouchGesture:v4 resolver:v6];

  if (!v7)
  {

LABEL_5:
    BOOL v9 = 0;
    goto LABEL_6;
  }
  id v8 = v7;
  AXPerformBlockAsynchronouslyOnMainThread();

  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (void)_updateVoiceOverHandGesturesActionCustomizations
{
  id v5 = +[AXSettings sharedInstance];
  uint64_t v3 = [v5 voiceOverHandGesturesActionCustomizations];
  handGestureCommandDict = self->_handGestureCommandDict;
  self->_handGestureCommandDict = v3;
}

- (BOOL)_handleVoiceOverGreySupportAccessibilityEvent:(id)a3
{
  uint64_t v3 = [(VOTEventFactory *)self _mapAXEventToVOTEvent:a3];
  id v4 = v3;
  if (v3)
  {
    id v6 = v3;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
  return v4 != 0;
}

- (id)_mapAXEventToVOTEvent:(id)a3
{
  id v4 = [a3 accessibilityData];
  handGestureCommandDict = self->_handGestureCommandDict;
  id v6 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 usage]);
  id v7 = [(NSDictionary *)handGestureCommandDict objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = +[VOTEvent internalEventWithCommand:v7 info:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (VOTElementManagementProtocol)elementManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);

  return (VOTElementManagementProtocol *)WeakRetained;
}

- (VOTRotorManagementProtocol)rotorManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotorManager);

  return (VOTRotorManagementProtocol *)WeakRetained;
}

- (void)setRotorManager:(id)a3
{
}

- (VOTDirectTouchManagementProtocol)directTouchManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directTouchManager);

  return (VOTDirectTouchManagementProtocol *)WeakRetained;
}

- (void)setDirectTouchManager:(id)a3
{
}

- (VOTEventFactoryCallbackProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTEventFactoryCallbackProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXDispatchTimer)_handwritingCaptureTimer
{
  return self->_handwritingCaptureTimer;
}

- (void)_setHandwritingCaptureTimer:(id)a3
{
}

- (VOTDirectInteractionKeyboardManager)directInteractionKeyboardManager
{
  return self->_directInteractionKeyboardManager;
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (VOTElement)lastTouchedDirectTouchElement
{
  return self->_lastTouchedDirectTouchElement;
}

- (void)setLastTouchedDirectTouchElement:(id)a3
{
}

- (VOTEvent)lastGestureEvent
{
  return self->_lastGestureEvent;
}

- (void)setLastGestureEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_lastTouchedDirectTouchElement, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_directInteractionKeyboardManager, 0);
  objc_storeStrong((id *)&self->_handwritingCaptureTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_directTouchManager);
  objc_destroyWeak((id *)&self->_rotorManager);
  objc_destroyWeak((id *)&self->_elementManager);
  objc_storeStrong((id *)&self->_currentElement, 0);
  objc_storeStrong((id *)&self->_handGestureCommandDict, 0);
  objc_storeStrong((id *)&self->_audioAccTapTimer, 0);
  objc_storeStrong((id *)&self->_menuButtonInterceptor, 0);
  objc_storeStrong((id *)&self->_selectButtonInterceptor, 0);
  objc_storeStrong((id *)&self->_playButtonInterceptor, 0);
  objc_storeStrong((id *)&self->_mapsExplorationGestureManager, 0);
  objc_storeStrong((id *)&self->_brailleGestureManager, 0);
  objc_storeStrong((id *)&self->_tapAndHoldScribbleElement, 0);
  objc_storeStrong((id *)&self->_tapAndHoldContextIds, 0);
  objc_storeStrong((id *)&self->_zoomListenerIdentifier, 0);
  objc_storeStrong((id *)&self->_directInteractionElements, 0);
  objc_storeStrong((id *)&self->_currentGestureEvent, 0);
  objc_storeStrong((id *)&self->_snarfedWatchWakeRecords, 0);
  objc_storeStrong((id *)&self->_wakeTapTimer, 0);
  objc_storeStrong((id *)&self->_volumeChangeTimer, 0);
  objc_storeStrong((id *)&self->_previewFingerContextId, 0);
  objc_storeStrong((id *)&self->_systemControlLocationTimer, 0);
  objc_storeStrong((id *)&self->_memorizeSoundTimer, 0);
  objc_storeStrong((id *)&self->_threeFingerHoldTimer, 0);
  objc_storeStrong((id *)&self->_twoFingerHoldTimer, 0);
  objc_storeStrong((id *)&self->_elementSummaryTimer, 0);
  objc_storeStrong((id *)&self->_tapHoldTimer, 0);
  objc_storeStrong((id *)&self->_firstResponder, 0);
  objc_storeStrong((id *)&self->_threadKey, 0);
  objc_storeStrong((id *)&self->_lastDownEvent, 0);
  objc_storeStrong((id *)&self->_edgePanGestureSpeakHintTimer, 0);

  objc_storeStrong((id *)&self->_gestureFactory, 0);
}

@end
@interface SpeakThisUIServer
+ (BOOL)isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3;
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (AXFocusManager)focusManager;
- (AXSpeakingRange)currentSpeakingRange;
- (AXUIElement)currentSentenceElement;
- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer;
- (BOOL)activeWebContentIsHidden;
- (BOOL)cachedIsHighlightVisible;
- (BOOL)forceRectsToScroll;
- (BOOL)highlightSentences;
- (BOOL)highlightWords;
- (BOOL)isContinuitySessionActive;
- (BOOL)isFetchingContent;
- (BOOL)isInSpeakUnderFingerModeWithEventProcessor:(id)a3;
- (BOOL)isPausingAssistiveTechnology;
- (BOOL)isReadingFromFrontmostApp;
- (BOOL)isSpeaking;
- (BOOL)isWaitingForPageScroll;
- (BOOL)lockButtonPressedSinceReadAllStart;
- (BOOL)messageWithIdentifierShouldBeProcessedAsynchronously:(unint64_t)a3;
- (BOOL)needToRefreshContextIds;
- (BOOL)waitingForNewReadAll;
- (BSInvalidatable)hitTestCategoryAssertion;
- (CGPoint)convertPointToViewControllerSpace:(CGPoint)a3;
- (CGRect)speakThisUIFrameWithEventProcessor:(id)a3;
- (NSArray)speakingRangeAndElements;
- (NSMutableArray)assertionsForFetchingContent;
- (NSMutableArray)assertionsForStayingAlive;
- (NSMutableArray)sentenceRanges;
- (NSString)currentContent;
- (NSString)rootElementAccessibilityIdentifier;
- (NSString)sceneIdentifier;
- (NSString)springBoardActionHandlerId;
- (SpeakThisEventProcessor)eventProcessor;
- (SpeakThisUIServer)init;
- (SpeakThisUIStateManager)stateManager;
- (_NSRange)currentSentenceRange;
- (_NSRange)currentWordRange;
- (__AXObserver)observer;
- (double)speakingRateAsMultiplier;
- (id)_assertionAttributesForFetchingMoreContent;
- (id)_assertionAttributesForStayingAlive;
- (id)_convertAXValueSceneReferenceRects:(id)a3 toView:(id)a4 fromElement:(id)a5;
- (id)_dispatchQueueForFetches;
- (id)_fetchNextElementsAndReturnContentStringUsingAppElement:(id)a3 startingWithPageTurnElement:(BOOL)a4 shouldScrollOpaqueProviderIfNecessary:(BOOL)a5 deviceOrientation:(int64_t)a6;
- (id)_fetchNextElementsFromOpaqueProviderAndScroll:(BOOL)a3;
- (id)_handlePauseSpeaking;
- (id)_handleResumeSpeaking;
- (id)_handleSpeakFaster;
- (id)_handleSpeakSlower;
- (id)_handleToggleSpeaking;
- (id)_handleUnknownMessageIdentifier:(unint64_t)a3;
- (id)_handleUpdateSpeakingRate:(id)a3;
- (id)_speakingRangeForContentItem:(id)a3 withContentItemLength:(unint64_t)a4 andPreviousContentStringLength:(unint64_t)a5;
- (id)_systemApp;
- (id)_windowSceneForActiveDisplay;
- (id)currentVoiceIdentifier;
- (id)mainDisplayWindow;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (id)readNextPageCompletion;
- (id)windowSceneIdentifierForWindowScene:(id)a3;
- (int64_t)_stsErrorCodeForOratorErrorCode:(int64_t)a3;
- (unint64_t)_findIndexOfRange:(_NSRange)a3;
- (unint64_t)doubleSpeakingRateAsInt;
- (unint64_t)halfSpeakingRateAsInt;
- (unint64_t)oneAndAHalfSpeakingRateAsInt;
- (unint64_t)standardSpeakingRateAsInt;
- (void)_addContentViewControllerForWindowScene:(id)a3;
- (void)_addFetchingContentAssertionForPid:(int)a3;
- (void)_addStayingAliveAssertionForPid:(int)a3;
- (void)_appendContentFromElementsAndStrings:(id)a3 toContentString:(id)a4 speakingRanges:(id)a5 startWithPageTurnElement:(BOOL)a6 deviceOrientation:(int64_t)a7;
- (void)_clearAllAssertions;
- (void)_clearAssertions:(id)a3;
- (void)_didToggleHighlightContentSetting;
- (void)_didToggleSpeakScreenSetting;
- (void)_fetchContentStartingWithPageTurnElement:(BOOL)a3 shouldRefreshContent:(BOOL)a4 completion:(id)a5;
- (void)_fetchNextSpeakThisElementsAndScrollOpaqueProviderIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)_fetchTextRectsAndApplyHighlightToContent:(id)a3 withRange:(_NSRange)a4 elementRange:(id)a5 updateSentences:(BOOL)a6 scrollWords:(BOOL)a7 scrollSentences:(BOOL)a8;
- (void)_finishHandlingPageScroll:(BOOL)a3;
- (void)_frontmostAppMayHaveChanged:(BOOL)a3;
- (void)_giveUpWaitingForPageToScroll;
- (void)_handleFastForward:(id)a3;
- (void)_handleFinishShowingUI;
- (void)_handleHideUI;
- (void)_handleIdleTimerReset;
- (void)_handleLoadSpeakUnderfingerUI;
- (void)_handleLoadUIAtAppPoint:(id)a3;
- (void)_handleLockButtonPress;
- (void)_handleNewPage;
- (void)_handleNoSpeakableContent:(id)a3;
- (void)_handleRewind:(id)a3;
- (void)_handleSpeakThisWithOptions:(int64_t)a3 appPoint:(id)a4 completion:(id)a5;
- (void)_handleSpeakingStopped;
- (void)_handleUpdateUIForSpeakUnderFingerSettingsChange;
- (void)_initializeUIIfNeccessary;
- (void)_kbFrameWillUpdate:(id)a3 withCompletion:(id)a4;
- (void)_observeNotifications:(BOOL)a3;
- (void)_pageDidScroll:(id)a3;
- (void)_readNextPageIfApplicableInForwardDirection:(BOOL)a3 completion:(id)a4;
- (void)_reallyHideUI;
- (void)_removeViewControllerForWindowScene:(id)a3;
- (void)_speakFingerStateChanged;
- (void)_updateCurrentAppWithPoint:(id)a3 bundleID:(id)a4 sceneID:(id)a5 rootElementAccessibilityIdentifier:(id)a6;
- (void)_updateForContinuityStateChange;
- (void)_updateGestureRecognizers;
- (void)_updateIsHighlightVisible;
- (void)_updateVCWithLatestHighlightColors;
- (void)_updateViewControllerForWindowScene:(id)a3 completion:(id)a4;
- (void)activeDisplayChangedWithContext:(id)a3;
- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3;
- (void)dealloc;
- (void)exitSpeakFingerModeWithEventProcessor:(id)a3;
- (void)externalDisplaySceneConnected:(id)a3;
- (void)externalDisplaySceneDisconnected:(id)a3;
- (void)fastForwardButtonPressed;
- (void)fetchContentStringStartingWithPageTurnForUnitTest:(id)a3;
- (void)keyboardFocusChangedForSceneIdentifier:(id)a3;
- (void)orator:(id)a3 willSpeakRange:(_NSRange)a4 ofContent:(id)a5;
- (void)oratorDidCancelSpeaking:(id)a3;
- (void)oratorDidChangeSpeakingRate:(id)a3;
- (void)oratorDidFinishSpeaking:(id)a3;
- (void)oratorDidPauseSpeaking:(id)a3;
- (void)oratorDidResumeSpeaking:(id)a3;
- (void)oratorDidStartSpeaking:(id)a3;
- (void)oratorShouldFetchNextElements:(id)a3 shouldScrollOpaqueProviderIfNecessary:(BOOL)a4;
- (void)pauseButtonPressed;
- (void)playButtonPressedForBundleID:(id)a3 sceneID:(id)a4 rootAccessibilityElementIdentifier:(id)a5;
- (void)processMessageAsynchronously:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 completion:(id)a6;
- (void)rewindButtonPressed;
- (void)setActiveWebContentIsHidden:(BOOL)a3;
- (void)setAssertionsForFetchingContent:(id)a3;
- (void)setAssertionsForStayingAlive:(id)a3;
- (void)setCachedIsHighlightVisible:(BOOL)a3;
- (void)setCurrentContent:(id)a3;
- (void)setCurrentSentenceElement:(id)a3;
- (void)setCurrentSentenceRange:(_NSRange)a3;
- (void)setCurrentSpeakingRange:(id)a3;
- (void)setCurrentWordRange:(_NSRange)a3;
- (void)setEventProcessor:(id)a3;
- (void)setFocusManager:(id)a3;
- (void)setForceRectsToScroll:(BOOL)a3;
- (void)setHitTestCategoryAssertion:(id)a3;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setIsContinuitySessionActive:(BOOL)a3;
- (void)setIsFetchingContent:(BOOL)a3;
- (void)setIsPausingAssistiveTechnology:(BOOL)a3;
- (void)setIsReadingFromFrontmostApp:(BOOL)a3;
- (void)setIsWaitingForPageScroll:(BOOL)a3;
- (void)setLockButtonPressedSinceReadAllStart:(BOOL)a3;
- (void)setNeedToRefreshContextIds:(BOOL)a3;
- (void)setObserver:(__AXObserver *)a3;
- (void)setReadNextPageCompletion:(id)a3;
- (void)setRootElementAccessibilityIdentifier:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSentenceRanges:(id)a3;
- (void)setSpeakingRangeAndElements:(id)a3;
- (void)setSpringBoardActionHandlerId:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setUpdateElementVisualsCoalescer:(id)a3;
- (void)setWaitingForNewReadAll:(BOOL)a3;
- (void)speakElementAtPoint:(CGPoint)a3 withEventProcessor:(id)a4;
- (void)speakUnderFingerButtonPressed;
- (void)speedButtonPressed;
- (void)startNewReadAllForBundleID:(id)a3 sceneID:(id)a4 rootAccessibilityElementIdentifier:(id)a5;
- (void)startNewReadAllFromGesture;
- (void)stopButtonPressed;
- (void)stopSpeakFingerButtonPressed;
@end

@implementation SpeakThisUIServer

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4C04;
  block[3] = &unk_28670;
  block[4] = a1;
  if (qword_30218 != -1) {
    dispatch_once(&qword_30218, block);
  }
  v2 = (void *)qword_30210;

  return v2;
}

- (SpeakThisUIServer)init
{
  v63.receiver = self;
  v63.super_class = (Class)SpeakThisUIServer;
  v2 = [(SpeakThisUIServer *)&v63 init];
  if (v2)
  {
    v3 = (AXOrator *)objc_alloc_init((Class)AXOrator);
    orator = v2->_orator;
    v2->_orator = v3;

    [(AXOrator *)v2->_orator setDelegate:v2];
    v5 = objc_alloc_init(SpeakThisEventProcessor);
    [(SpeakThisEventProcessor *)v5 setDelegate:v2];
    [(SpeakThisUIServer *)v2 setEventProcessor:v5];
    uint64_t v6 = +[NSMutableDictionary dictionary];
    speakThisUIViewControllers = v2->_speakThisUIViewControllers;
    v2->_speakThisUIViewControllers = (NSMutableDictionary *)v6;

    uint64_t v8 = +[NSMutableSet set];
    externalScenes = v2->_externalScenes;
    v2->_externalScenes = (NSMutableSet *)v8;

    uint64_t v10 = objc_opt_new();
    focusManager = v2->_focusManager;
    v2->_focusManager = (AXFocusManager *)v10;

    uint64_t v12 = +[SpeakThisUIStateManager sharedInstance];
    stateManager = v2->_stateManager;
    v2->_stateManager = (SpeakThisUIStateManager *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v15 = dispatch_queue_create("speakscreen-fetch-queue", v14);
    fetchDispatchQueue = v2->_fetchDispatchQueue;
    v2->_fetchDispatchQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    assertionsForStayingAlive = v2->_assertionsForStayingAlive;
    v2->_assertionsForStayingAlive = v17;

    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    assertionsForFetchingContent = v2->_assertionsForFetchingContent;
    v2->_assertionsForFetchingContent = v19;

    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sentenceRanges = v2->_sentenceRanges;
    v2->_sentenceRanges = v21;

    v2->_currentSentenceRange = (_NSRange)xmmword_268F0;
    currentSentenceElement = v2->_currentSentenceElement;
    v2->_currentSentenceElement = 0;

    [(SpeakThisUIServer *)v2 _didToggleHighlightContentSetting];
    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v2 selector:"_didToggleSpeakScreenSetting" name:kAXSSpeakThisEnabledNotification object:0];
    [v24 addObserver:v2 selector:"_didToggleHighlightContentSetting" name:kAXSQuickSpeakHighlightTextEnabledNotification object:0];
    objc_initWeak(&location, v2);
    v25 = +[AXSpringBoardServer server];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_53F8;
    v60[3] = &unk_28698;
    v26 = v2;
    v61 = v26;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_540C;
    v58[3] = &unk_286C0;
    objc_copyWeak(&v59, &location);
    [v25 registerSpringBoardActionHandler:v60 withIdentifierCallback:v58];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v26, (CFNotificationCallback)sub_5468, kAXSContinuityDisplayStateChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v28 = +[AXSettings sharedInstance];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_5488;
    v56[3] = &unk_286E8;
    objc_copyWeak(&v57, &location);
    id v29 = objc_loadWeakRetained(&location);
    [v28 registerUpdateBlock:v56 forRetrieveSelector:"quickSpeakWordHighlightColor" withListener:v29];

    objc_destroyWeak(&v57);
    v30 = +[AXSettings sharedInstance];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_54C8;
    v54[3] = &unk_286E8;
    objc_copyWeak(&v55, &location);
    id v31 = objc_loadWeakRetained(&location);
    [v30 registerUpdateBlock:v54 forRetrieveSelector:"quickSpeakSentenceHighlightColor" withListener:v31];

    objc_destroyWeak(&v55);
    v32 = +[AXSettings sharedInstance];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_5508;
    v52[3] = &unk_286E8;
    objc_copyWeak(&v53, &location);
    id v33 = objc_loadWeakRetained(&location);
    [v32 registerUpdateBlock:v52 forRetrieveSelector:"speechControllerLongPressAction" withListener:v33];

    objc_destroyWeak(&v53);
    v34 = +[AXSettings sharedInstance];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_5548;
    v50[3] = &unk_286E8;
    objc_copyWeak(&v51, &location);
    id v35 = objc_loadWeakRetained(&location);
    [v34 registerUpdateBlock:v50 forRetrieveSelector:"speechControllerDoubleTapAction" withListener:v35];

    objc_destroyWeak(&v51);
    +[AXUIElement applyElementAttributeCacheScheme:4];
    v48[1] = _NSConcreteStackBlock;
    v48[2] = (id)3221225472;
    v48[3] = sub_5588;
    v48[4] = &unk_28710;
    v36 = v26;
    v49 = v36;
    AXPerformBlockAsynchronouslyOnMainThread();
    v47[1] = _NSConcreteStackBlock;
    v47[2] = (id)3221225472;
    v47[3] = sub_5594;
    v47[4] = &unk_286E8;
    objc_copyWeak(v48, &location);
    AXPerformBlockAsynchronouslyOnMainThread();
    _AXSSpeakThisEnabled();
    [(SpeakThisUIServer *)v36 _didToggleSpeakScreenSetting];
    id v37 = objc_alloc_init((Class)AXUpdateElementVisualsCoalescer);
    [v37 setThreshold:0.2];
    [v37 setProgressInterval:0.01];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_5728;
    v46[3] = &unk_286E8;
    objc_copyWeak(v47, &location);
    v38 = objc_retainBlock(v46);
    [v37 setUpdateVisualsSequenceDidBeginHandler:v38];
    [v37 setUpdateVisualsSequenceInProgressHandler:v38];
    [v37 setUpdateVisualsSequenceDidFinishHandler:v38];
    [(SpeakThisUIServer *)v36 setUpdateElementVisualsCoalescer:v37];
    dispatch_queue_t v39 = dispatch_queue_create("com.apple.accessibility.speakScreen.update_listeners", 0);
    speakScreenListenersUpdateQueue = v36->_speakScreenListenersUpdateQueue;
    v36->_speakScreenListenersUpdateQueue = (OS_dispatch_queue *)v39;

    uint64_t v41 = +[NSMutableSet set];
    speakScreenListeners = v36->_speakScreenListeners;
    v36->_speakScreenListeners = (NSMutableSet *)v41;

    uint64_t v43 = +[NSMutableSet set];
    suspendedSpeakScreenListeners = v36->_suspendedSpeakScreenListeners;
    v36->_suspendedSpeakScreenListeners = (NSMutableSet *)v43;

    [(SpeakThisUIServer *)v36 _updateForContinuityStateChange];
    objc_destroyWeak(v47);

    objc_destroyWeak(v48);
    objc_destroyWeak(&v59);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(SpeakThisUIServer *)self _observeNotifications:0];
  [(AXOrator *)self->_orator setDelegate:0];
  v3 = +[AXSpringBoardServer server];
  v4 = [(SpeakThisUIServer *)self springBoardActionHandlerId];
  [v3 removeActionHandler:v4];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(SpeakThisUIServer *)self _clearAllAssertions];
  uint64_t v6 = [(SpeakThisUIServer *)self hitTestCategoryAssertion];
  [v6 invalidate];

  v7.receiver = self;
  v7.super_class = (Class)SpeakThisUIServer;
  [(SpeakThisUIServer *)&v7 dealloc];
}

- (void)_observeNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    +[AXElement registerNotifications:&off_29618 withIdentifier:@"SpeakScreen" withHandler:&stru_28750];
  }
  else {
    +[AXElement unregisterNotifications:@"SpeakScreen"];
  }
  id v4 = +[AXElement systemWideElement];
  [v4 setPassivelyListeningForEvents:v3];
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = AXLogSpeakScreen();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412802;
    id v17 = v9;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "message: %@, identifier: %luu, client: %@", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v12 = &off_29648;
  switch(a4)
  {
    case 2uLL:
      uint64_t v13 = [(SpeakThisUIServer *)self _handlePauseSpeaking];
      goto LABEL_16;
    case 3uLL:
      uint64_t v13 = [(SpeakThisUIServer *)self _handleResumeSpeaking];
      goto LABEL_16;
    case 4uLL:
      uint64_t v13 = [(SpeakThisUIServer *)self _handleSpeakFaster];
      goto LABEL_16;
    case 5uLL:
      uint64_t v13 = [(SpeakThisUIServer *)self _handleSpeakSlower];
      goto LABEL_16;
    case 8uLL:
      uint64_t v13 = [(SpeakThisUIServer *)self _handleToggleSpeaking];
      goto LABEL_16;
    case 9uLL:
      [(SpeakThisUIServer *)self _handleHideUI];
      goto LABEL_20;
    case 0xAuLL:
      [(SpeakThisUIServer *)self _handleLoadSpeakUnderfingerUI];
      v14 = [(SpeakThisUIServer *)self eventProcessor];
      [v14 beginHandlingHIDEventsForReason:@"Speech controller was set to always be on by an external client"];
      goto LABEL_19;
    case 0xBuLL:
      if (([(AXOrator *)self->_orator isSpeaking] & 1) != 0
        || ([(AXOrator *)self->_orator isPaused] & 1) != 0)
      {
        [(SpeakThisUIServer *)self _handleUpdateUIForSpeakUnderFingerSettingsChange];
      }
      else
      {
        [(SpeakThisUIServer *)self _handleHideUI];
      }
      v14 = [(SpeakThisUIServer *)self eventProcessor];
      [v14 endHandlingHIDEventsForReason:@"Speech controller was set to always be on by an external client"];
LABEL_19:

LABEL_20:
      uint64_t v12 = 0;
      goto LABEL_21;
    case 0xDuLL:
      uint64_t v13 = [(SpeakThisUIServer *)self _handleUpdateSpeakingRate:v9];
      goto LABEL_16;
    case 0xEuLL:
      goto LABEL_21;
    default:
      uint64_t v13 = [(SpeakThisUIServer *)self _handleUnknownMessageIdentifier:a4];
LABEL_16:
      uint64_t v12 = (_UNKNOWN **)v13;
LABEL_21:

      return v12;
  }
}

- (BOOL)messageWithIdentifierShouldBeProcessedAsynchronously:(unint64_t)a3
{
  return (a3 < 0xD) & (0x10C2u >> a3);
}

- (void)processMessageAsynchronously:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *, void))a6;
  uint64_t v13 = AXLogSpeakScreen();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v60 = v10;
    __int16 v61 = 2048;
    unint64_t v62 = a4;
    __int16 v63 = 2112;
    id v64 = v11;
    _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "message: %@, identifier: %luu, client: %@", buf, 0x20u);
  }

  uint64_t v14 = STSMessageKeyUUID;
  dispatch_queue_t v15 = [v10 objectForKeyedSubscript:STSMessageKeyUUID];
  if ((uint64_t)a4 > 6)
  {
    if (a4 == 7)
    {
      [(SpeakThisUIServer *)self _handleRewind:v12];
    }
    else if (a4 == 12)
    {
      [(SpeakThisUIServer *)self _kbFrameWillUpdate:v10 withCompletion:v12];
    }
  }
  else if (a4 == 1)
  {
    [(SpeakThisUIServer *)self setRootElementAccessibilityIdentifier:0];
    [(SpeakThisUIServer *)self setSceneIdentifier:0];
    uint64_t v16 = STSMessageKeyAppPointX;
    uint64_t v17 = [v10 objectForKeyedSubscript:STSMessageKeyAppPointX];
    if (v17
      && (__int16 v18 = (void *)v17,
          uint64_t v19 = STSMessageKeyAppPointY,
          [v10 objectForKeyedSubscript:STSMessageKeyAppPointY],
          __int16 v20 = objc_claimAutoreleasedReturnValue(),
          v20,
          v18,
          v20))
    {
      id v21 = [v10 objectForKeyedSubscript:v16];
      [v21 doubleValue];
      double v23 = v22;
      v24 = [v10 objectForKeyedSubscript:v19];
      [v24 doubleValue];
      double v26 = v25;

      v27 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v23, v26);
    }
    else
    {
      v27 = 0;
    }
    uint64_t v28 = STSMessageKeyBundleID;
    id v29 = [v10 objectForKeyedSubscript:STSMessageKeyBundleID];

    if (v29)
    {
      uint64_t v30 = [v10 objectForKeyedSubscript:v28];
    }
    else
    {
      uint64_t v30 = 0;
    }
    uint64_t v31 = STSMessageKeySceneID;
    v32 = [v10 objectForKeyedSubscript:STSMessageKeySceneID];

    if (v32)
    {
      id v33 = [v10 objectForKeyedSubscript:v31];
      [(SpeakThisUIServer *)self setSceneIdentifier:v33];
    }
    uint64_t v34 = STSMessageKeyRootElementAccessibilityIdentifier;
    id v35 = [v10 objectForKeyedSubscript:STSMessageKeyRootElementAccessibilityIdentifier];

    if (v35)
    {
      v36 = [v10 objectForKeyedSubscript:v34];
      [(SpeakThisUIServer *)self setRootElementAccessibilityIdentifier:v36];
    }
    id v37 = +[AXSettings sharedInstance];
    unsigned __int8 v38 = [v37 showSpeechController];

    if ((v38 & 1) == 0)
    {
      dispatch_queue_t v39 = [(SpeakThisUIServer *)self stateManager];
      [v39 setInTabMode:0];
    }
    v40 = [(SpeakThisUIServer *)self sceneIdentifier];
    uint64_t v41 = [(SpeakThisUIServer *)self rootElementAccessibilityIdentifier];
    v52 = (void *)v30;
    [(SpeakThisUIServer *)self _updateCurrentAppWithPoint:v27 bundleID:v30 sceneID:v40 rootElementAccessibilityIdentifier:v41];

    uint64_t v42 = STSMessageKeyOptions;
    uint64_t v43 = [v10 objectForKeyedSubscript:STSMessageKeyOptions];
    unsigned __int8 v44 = [v43 integerValue];

    if ((v44 & 0x30) == 0 && !self->_viewController) {
      [(SpeakThisUIServer *)self _handleLoadUIAtAppPoint:v27];
    }
    if (self->_currentApp)
    {
      v45 = [v10 objectForKeyedSubscript:v42];
      id v46 = [v45 integerValue];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_6444;
      v53[3] = &unk_28778;
      id v54 = v11;
      id v55 = v15;
      uint64_t v56 = 1;
      [(SpeakThisUIServer *)self _handleSpeakThisWithOptions:v46 appPoint:v27 completion:v53];

      v47 = v54;
    }
    else
    {
      v48 = AXLogSpeakScreen();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "Could not find app/scene/view, returning without speaking", buf, 2u);
      }

      v57[0] = STSMessageReplyKeyErrorCode;
      v57[1] = v14;
      CFStringRef v49 = &stru_28D00;
      if (v15) {
        CFStringRef v49 = v15;
      }
      v58[0] = &off_29528;
      v58[1] = v49;
      v47 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
      v50 = +[AXUIClientMessenger clientMessengerWithIdentifier:v11];
      id v51 = +[AXAccessQueue mainAccessQueue];
      [v50 sendAsynchronousMessage:v47 withIdentifier:1 targetAccessQueue:v51 completion:0];
    }
    if (v12) {
      v12[2](v12, &__NSDictionary0__struct, 0);
    }
  }
  else if (a4 == 6)
  {
    [(SpeakThisUIServer *)self _handleFastForward:v12];
  }
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  if (((a3 - 10) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return @"com.apple.accessibility.SpeakThisServices";
  }
  else {
    return 0;
  }
}

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3
{
  if (a3 == 10)
  {
    v5 = +[NSSet setWithArray:](NSSet, "setWithArray:", &off_29630, v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3
{
  return a3 == 12;
}

- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = AXLogSpeakScreen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Connection will be interrupted for %@.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)fetchContentStringStartingWithPageTurnForUnitTest:(id)a3
{
  id v4 = a3;
  [(SpeakThisUIServer *)self _updateCurrentAppWithPoint:0 bundleID:0 sceneID:0 rootElementAccessibilityIdentifier:0];
  [(SpeakThisUIServer *)self _fetchContentStartingWithPageTurnElement:1 shouldRefreshContent:1 completion:v4];
}

- (void)_handleLockButtonPress
{
  if (!self->_viewController) {
    [(SpeakThisUIServer *)self stopButtonPressed];
  }
  [(SpeakThisUIServer *)self setIdleTimerDisabled:0];
  self->_lockButtonPressedSinceReadAllStart = 1;
}

- (void)_initializeUIIfNeccessary
{
  [(SpeakThisUIServer *)self _addContentViewControllerForWindowScene:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = self->_externalScenes;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[SpeakThisUIServer _addContentViewControllerForWindowScene:](self, "_addContentViewControllerForWindowScene:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_handleHideUI
{
  id v3 = AXLogSpeakScreen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_192C0((uint64_t)self, v3);
  }

  viewController = self->_viewController;
  self->_viewController = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableDictionary *)self->_speakThisUIViewControllers allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [(NSMutableDictionary *)self->_speakThisUIViewControllers objectForKeyedSubscript:v10];
        if ([v10 isEqualToString:@"MAIN-DISPLAY"])
        {
          [(SpeakThisUIServer *)self _removeViewControllerForWindowScene:0];
        }
        else
        {
          uint64_t v12 = [v11 view];
          uint64_t v13 = [v12 window];
          uint64_t v14 = [v13 windowScene];
          [(SpeakThisUIServer *)self _removeViewControllerForWindowScene:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_handleLoadSpeakUnderfingerUI
{
  [(SpeakThisUIServer *)self _initializeUIIfNeccessary];
  if (self->_viewController)
  {
    [(SpeakThisUIServer *)self _handleUpdateUIForSpeakUnderFingerSettingsChange];
  }
  else
  {
    id v3 = [(SpeakThisUIServer *)self _windowSceneForActiveDisplay];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_6ADC;
    v4[3] = &unk_28710;
    v4[4] = self;
    [(SpeakThisUIServer *)self _updateViewControllerForWindowScene:v3 completion:v4];
  }
}

- (void)_handleLoadUIAtAppPoint:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_reallyHideUI" object:0];
  [(SpeakThisUIServer *)self _initializeUIIfNeccessary];
  id v4 = [(SpeakThisUIServer *)self sentenceRanges];
  [v4 removeAllObjects];

  self->_currentSentenceRange = (_NSRange)xmmword_268F0;
  currentSentenceElement = self->_currentSentenceElement;
  self->_currentSentenceElement = 0;

  id v6 = [(SpeakThisUIServer *)self _windowSceneForActiveDisplay];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6BD8;
  v7[3] = &unk_28710;
  v7[4] = self;
  [(SpeakThisUIServer *)self _updateViewControllerForWindowScene:v6 completion:v7];

  [(SpeakThisUIServer *)self _updateVCWithLatestHighlightColors];
}

- (void)_handleUpdateUIForSpeakUnderFingerSettingsChange
{
}

- (void)_handleFinishShowingUI
{
  viewController = self->_viewController;
  if (viewController) {
    [(AXSpeakOverlayViewController *)viewController finishLoading];
  }
}

- (void)_handleNoSpeakableContent:(id)a3
{
  viewController = self->_viewController;
  if (viewController) {
    [(AXSpeakOverlayViewController *)viewController showErrorMessage:a3];
  }
}

- (void)_reallyHideUI
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_reallyHideUI" object:0];
  [(SpeakThisUIServer *)self _handleHideUI];

  [(SpeakThisUIServer *)self setIdleTimerDisabled:0];
}

- (CGPoint)convertPointToViewControllerSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(AXSpeakOverlayViewController *)self->_viewController view];
  id v7 = [v6 window];

  objc_msgSend(v7, "_convertPointFromSceneReferenceSpace:", x, y);
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(AXSpeakOverlayViewController *)self->_viewController view];
  objc_msgSend(v7, "convertPoint:toView:", v12, v9, v11);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)_updateVCWithLatestHighlightColors
{
  if ([(SpeakThisUIServer *)self highlightWords])
  {
    id v3 = +[AXSettings sharedInstance];
    id v4 = [v3 quickSpeakWordHighlightColor];

    if (v4)
    {
      id v5 = +[UIColor colorWithCGColor:AXSpeakHighlightColor()];
      id v6 = [v5 colorWithAlphaComponent:0.2];
      [(AXSpeakOverlayViewController *)self->_viewController setHighlightColor:v6];
    }
    else
    {
      id v7 = [(AXElement *)self->_currentApp uiElement];
      id v8 = [v7 colorWithAXAttribute:2140];

      if (!v8) {
        goto LABEL_7;
      }
      id v5 = +[UIColor colorWithCGColor:v8];
      [(AXSpeakOverlayViewController *)self->_viewController setHighlightColor:v5];
    }
  }
LABEL_7:
  if (![(SpeakThisUIServer *)self highlightSentences]) {
    return;
  }
  double v9 = +[AXSettings sharedInstance];
  id v10 = [v9 quickSpeakSentenceHighlightColor];

  double v11 = [(AXElement *)self->_currentApp uiElement];
  id v12 = [v11 colorWithAXAttribute:2140];

  if (v12)
  {
    double v13 = +[UIColor colorWithCGColor:v12];
    [(AXSpeakOverlayViewController *)self->_viewController setHighlightColor:v13];
  }
  if (v10)
  {
    uint64_t v14 = AXSpeakHighlightColor();
  }
  else
  {
    double v15 = [(AXElement *)self->_currentApp uiElement];
    id v16 = [v15 colorWithAXAttribute:2141];

    if (!v16) {
      return;
    }
    uint64_t v14 = (uint64_t)v16;
  }
  id v17 = +[UIColor colorWithCGColor:v14];
  [(AXSpeakOverlayViewController *)self->_viewController setUnderlineColor:v17];
}

- (id)_speakingRangeForContentItem:(id)a3 withContentItemLength:(unint64_t)a4 andPreviousContentStringLength:(unint64_t)a5
{
  id v8 = a3;
  double v9 = objc_alloc_init(AXSpeakingRange);
  id v10 = [(AXOrator *)self->_orator content];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [(AXSpeakingRange *)v9 setElement:v8];
  }
  -[AXSpeakingRange setRange:](v9, "setRange:", (char *)[v10 length] + a5, a4);

  return v9;
}

- (void)_appendContentFromElementsAndStrings:(id)a3 toContentString:(id)a4 speakingRanges:(id)a5 startWithPageTurnElement:(BOOL)a6 deviceOrientation:(int64_t)a7
{
  id v10 = a3;
  id v11 = a4;
  id v66 = a5;
  if ([v10 count])
  {
    id v12 = AXLogSpeakScreen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "AppendContent - no content: remove page turn element", buf, 2u);
    }

    currentPageTurnElement = self->_currentPageTurnElement;
    self->_currentPageTurnElement = 0;
  }
  _AXSetAllowsSuspendedAppServer();
  id v14 = objc_alloc_init((Class)NSMutableOrderedSet);
  double v15 = +[AXSpringBoardServer server];
  unsigned int v63 = [v15 isScreenLockedWithPasscode:0];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v77;
    UIAccessibilityTraits v61 = UIAccessibilityTraitCausesPageTurn;
    id location = (id *)&self->_currentPageTurnElement;
    id v58 = v16;
    BOOL v57 = a6;
    uint64_t v62 = *(void *)v77;
    do
    {
      __int16 v20 = 0;
      id v60 = v18;
      do
      {
        if (*(void *)v77 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v20);
        CFTypeID v22 = CFGetTypeID(v21);
        if (v22 == AXUIElementGetTypeID())
        {
          v65 = v20;
          if (v63) {
            AXUIElementSetMessagingTimeout((AXUIElementRef)v21, 10.0);
          }
          double v23 = +[AXUIElement uiElementWithAXElement:v21];
          v24 = +[AXElement elementWithUIElement:v23];
          unint64_t v25 = (unint64_t)[v24 traits];
          BOOL v26 = *location == 0;
          unsigned int v27 = [v24 hasWebContent];
          if ((v61 & v25) != 0)
          {
            BOOL v26 = 1;
            objc_storeStrong(location, v24);
            uint64_t v28 = AXLogSpeakScreen();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              id v29 = *location;
              *(_DWORD *)buf = 138412290;
              id v83 = v29;
              _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Reset page turn element: %@", buf, 0xCu);
            }
          }
          if (v26)
          {
            if (!v27)
            {
              uint64_t v41 = [v23 objectWithAXAttribute:2085];
              objc_msgSend(v11, "_speakThisAppendString:withPause:", v41, objc_msgSend(v11, "length") != 0);
              id v42 = [v41 length];
              uint64_t v43 = v24;
              unsigned __int8 v44 = [v11 length];
              int64_t v45 = v44 - (unsigned char *)[v41 length];
              v24 = v43;
              id v46 = v42;
              id v18 = v60;
              id v32 = [(SpeakThisUIServer *)self _speakingRangeForContentItem:v23 withContentItemLength:v46 andPreviousContentStringLength:v45];
              [v66 addObject:v32];
              goto LABEL_33;
            }
            if (([v14 containsObject:v23] & 1) == 0)
            {
              uint64_t v30 = AXReadAllUtilitiesElementsToCombineForReadAll();
              id v31 = [v11 length];
              [v14 addObject:v23];
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v32 = v30;
              id v33 = [v32 countByEnumeratingWithState:&v72 objects:v81 count:16];
              if (v33)
              {
                id v34 = v33;
                id v59 = v24;
                BOOL v35 = v31 != 0;
                uint64_t v36 = *(void *)v73;
                do
                {
                  for (i = 0; i != v34; i = (char *)i + 1)
                  {
                    if (*(void *)v73 != v36) {
                      objc_enumerationMutation(v32);
                    }
                    unsigned __int8 v38 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                    dispatch_queue_t v39 = [v38 objectWithAXAttribute:2085];
                    [v11 _speakThisAppendString:v39 withPause:v35];
                    v40 = -[SpeakThisUIServer _speakingRangeForContentItem:withContentItemLength:andPreviousContentStringLength:](self, "_speakingRangeForContentItem:withContentItemLength:andPreviousContentStringLength:", v38, [v39 length], (unsigned char *)objc_msgSend(v11, "length") - (unsigned char *)objc_msgSend(v39, "length"));
                    [v66 addObject:v40];
                    [v14 addObject:v38];

                    BOOL v35 = 0;
                  }
                  id v34 = [v32 countByEnumeratingWithState:&v72 objects:v81 count:16];
                  BOOL v35 = 0;
                }
                while (v34);
                uint64_t v41 = v32;
                id v16 = v58;
                a6 = v57;
                id v18 = v60;
                v24 = v59;
              }
              else
              {
                uint64_t v41 = v32;
              }
LABEL_33:
            }
          }

          uint64_t v19 = v62;
          __int16 v20 = v65;
          goto LABEL_35;
        }
        if (a6) {
          goto LABEL_36;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v56 = v21;
          _AXAssert();
        }
        objc_msgSend(v11, "_speakThisAppendString:withPause:", v21, objc_msgSend(v21, "length", v56) != 0);
        double v23 = -[SpeakThisUIServer _speakingRangeForContentItem:withContentItemLength:andPreviousContentStringLength:](self, "_speakingRangeForContentItem:withContentItemLength:andPreviousContentStringLength:", v21, [v21 length], (unsigned char *)objc_msgSend(v11, "length") - (unsigned char *)objc_msgSend(v21, "length"));
        [v66 addObject:v23];
        id v18 = v60;
LABEL_35:

LABEL_36:
        __int16 v20 = (char *)v20 + 1;
      }
      while (v20 != v18);
      id v47 = [v16 countByEnumeratingWithState:&v76 objects:v84 count:16];
      id v18 = v47;
    }
    while (v47);
  }

  id v48 = [v14 firstObject];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v49 = v14;
  id v50 = [v49 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v69;
    do
    {
      id v53 = 0;
      id v54 = v48;
      do
      {
        if (*(void *)v69 != v52) {
          objc_enumerationMutation(v49);
        }
        id v55 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v53);
        if ((objc_msgSend(v16, "containsObject:", objc_msgSend(v55, "axElement")) & 1) == 0) {
          objc_msgSend(v16, "insertObject:atIndex:", objc_msgSend(v55, "axElement"), (char *)objc_msgSend(v16, "indexOfObject:", objc_msgSend(v54, "axElement")) + 1);
        }
        id v48 = v55;

        id v53 = (char *)v53 + 1;
        id v54 = v48;
      }
      while (v51 != v53);
      id v51 = [v49 countByEnumeratingWithState:&v68 objects:v80 count:16];
    }
    while (v51);
  }

  _AXSetAllowsSuspendedAppServer();
}

- (id)_fetchNextElementsFromOpaqueProviderAndScroll:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", 0x7FFFFFFFLL, 0, &off_29540, &off_29558);
  v16[2] = v6;
  v16[3] = @"UIAccessibilitySpeakThisIdentifier";
  id v7 = +[NSNumber numberWithBool:v3];
  v16[4] = v7;
  int v8 = 5;
  double v9 = +[NSArray arrayWithObjects:v16 count:5];

  while (1)
  {
    uint64_t v10 = [(UIElementProtocol *)self->_currentElementForFetching objectWithAXAttribute:95225 parameter:v9];
    if (!v10) {
      break;
    }
    id v11 = v10;
    [v5 addObject:v10];
    id v12 = +[AXUIElement uiElementWithAXElement:v11];
    unsigned int v13 = [v12 pid];
    if (v13 != [(UIElementProtocol *)self->_currentElementForFetching pid])
    {
      objc_storeStrong((id *)&self->_savedOpaqueParentForFetching, self->_currentElementForFetching);
      currentElementForFetching = self->_currentElementForFetching;
      self->_currentElementForFetching = (UIElementProtocol *)v12;

      goto LABEL_9;
    }

    if (!--v8) {
      goto LABEL_10;
    }
  }
  id v11 = AXLogSpeakScreen();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_19378(v5, v11);
  }
LABEL_9:

LABEL_10:

  return v5;
}

- (id)_fetchNextElementsAndReturnContentStringUsingAppElement:(id)a3 startingWithPageTurnElement:(BOOL)a4 shouldScrollOpaqueProviderIfNecessary:(BOOL)a5 deviceOrientation:(int64_t)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  id v10 = a3;
  _AXSetAllowsSuspendedAppServer();
  id v11 = &AXDeviceHasJindo_ptr;
  id v12 = +[NSMutableArray array];
  if (v10)
  {
    unsigned int v13 = [v10 arrayWithAXAttribute:3046];
    id v14 = [v13 mutableCopy];

    unsigned int v15 = 0;
    id v12 = v14;
  }
  else if ([(UIElementProtocol *)self->_currentElementForFetching BOOLWithAXAttribute:2065])
  {
    uint64_t v16 = [(SpeakThisUIServer *)self _fetchNextElementsFromOpaqueProviderAndScroll:v7];

    unsigned int v15 = [(UIElementProtocol *)self->_currentElementForFetching BOOLWithAXAttribute:2065];
    id v12 = (id)v16;
  }
  else
  {
    unsigned int v15 = 0;
  }
  if (![v12 count])
  {
    if (v15 & ~v7)
    {
      unsigned int v15 = 1;
    }
    else
    {
      id v17 = [(UIElementProtocol *)self->_currentElementForFetching arrayWithAXAttribute:2196];
      id v18 = [v17 mutableCopy];

      unsigned int v15 = 0;
      id v12 = v18;
    }
  }
  if (![v12 count] && self->_currentElementForFetchingRemoteParent)
  {
    if (v15 & ~v7)
    {
      unsigned int v15 = 1;
    }
    else
    {
      int64_t v70 = a6;
      long long v71 = AXLogSpeakScreen();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        currentElementForFetching = self->_currentElementForFetching;
        currentElementForFetchingRemoteParent = self->_currentElementForFetchingRemoteParent;
        *(_DWORD *)buf = 138412546;
        v91 = currentElementForFetching;
        __int16 v92 = 2112;
        v93 = currentElementForFetchingRemoteParent;
        _os_log_impl(&dword_0, v71, OS_LOG_TYPE_INFO, "The currently fetched element %@ could not be used for continued fetching, trying to recover using remote parent: %@", buf, 0x16u);
      }

      long long v74 = [(UIElementProtocol *)self->_currentElementForFetchingRemoteParent uiElementsWithAttribute:2197];
      long long v75 = v74;
      currentElementIndedouble x = self->_currentElementIndex;
      if ((currentElementIndex & 0x8000000000000000) == 0
        && currentElementIndex < (unint64_t)[v74 count])
      {
        long long v77 = [v75 objectAtIndex:self->_currentElementIndex];
        long long v78 = self->_currentElementForFetching;
        self->_currentElementForFetching = v77;
      }
      unsigned int v15 = 0;
      a6 = v70;
    }
  }
  uint64_t v19 = [v12 lastObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 lastObject];
    id v20 = v10;
    uint64_t v21 = v8;
    int64_t v22 = a6;
    v24 = uint64_t v23 = v7;
    unsigned int v25 = [v24 isEqualToString:@"SpeakThis-LegacyMethodWasUsed"];

    uint64_t v7 = v23;
    a6 = v22;
    uint64_t v8 = v21;
    id v10 = v20;
    id v11 = &AXDeviceHasJindo_ptr;
  }
  else
  {
    unsigned int v25 = 0;
  }

  if ((unint64_t)[v12 count] >= 6 && (v25 & 1) == 0)
  {
    BOOL v26 = objc_msgSend(v12, "subarrayWithRange:", 0, 5);
    id v27 = [v26 mutableCopy];
    uint64_t v28 = v12;
    unsigned int v29 = v15;
    uint64_t v30 = v11;
    id v31 = v10;
    uint64_t v32 = v8;
    int64_t v33 = a6;
    uint64_t v34 = v7;
    id v35 = v27;

    uint64_t v36 = v35;
    uint64_t v7 = v34;
    a6 = v33;
    uint64_t v8 = v32;
    id v10 = v31;
    id v11 = v30;
    unsigned int v15 = v29;
    id v12 = v36;
  }
  if (v25) {
    [v12 removeLastObject];
  }
  if ([v12 count]) {
    char v37 = v15;
  }
  else {
    char v37 = 1;
  }
  v84 = self;
  if ((v37 & 1) == 0)
  {
    unsigned int v82 = v8;
    unsigned __int8 v38 = [v11[136] array];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = v12;
    id v39 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
    if (v39)
    {
      id v40 = v39;
      unsigned int v79 = v7;
      int64_t v80 = a6;
      id v81 = v10;
      uint64_t v41 = *(void *)v86;
      p_currentElementForFetching = &self->_currentElementForFetching;
      p_currentElementForFetchingRemoteParent = &self->_currentElementForFetchingRemoteParent;
      unsigned __int8 v44 = &AXDeviceHasJindo_ptr;
      while (2)
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v86 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = *(void *)(*((void *)&v85 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v47 = [v44[128] uiElementWithAXElement:v46];
            objc_storeStrong((id *)p_currentElementForFetching, v47);
            uint64_t v48 = [(UIElementProtocol *)*p_currentElementForFetching objectWithAXAttribute:2092];
            id v49 = v44;
            id v50 = (void *)v48;
            if (v48)
            {
              id v51 = [v49[128] uiElementWithAXElement:v48];
              if (([v51 isEqual:*p_currentElementForFetchingRemoteParent] & 1) == 0)
              {
                objc_storeStrong((id *)p_currentElementForFetchingRemoteParent, v51);
                v84->_currentElementIndedouble x = -1;
              }

              self = v84;
              uint64_t v52 = v84->_currentElementIndex;
            }
            else
            {
              id v53 = *p_currentElementForFetchingRemoteParent;
              *p_currentElementForFetchingRemoteParent = 0;

              uint64_t v52 = -1;
            }
            self->_currentElementIndedouble x = v52 + 1;
            if ([(UIElementProtocol *)self->_currentElementForFetching BOOLWithAXAttribute:2065])
            {
              [(UIElementProtocol *)*p_currentElementForFetching performAXAction:2058 withValue:@"UIAccessibilitySpeakThisIdentifier"];

              unsigned int v15 = 1;
              goto LABEL_43;
            }

            unsigned __int8 v44 = &AXDeviceHasJindo_ptr;
          }
          [v38 addObject:v46];
        }
        id v40 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
        if (v40) {
          continue;
        }
        break;
      }
      unsigned int v15 = 0;
LABEL_43:
      a6 = v80;
      id v10 = v81;
      uint64_t v7 = v79;
    }
    else
    {
      unsigned int v15 = 0;
    }

    id v12 = v38;
    [(SpeakThisUIServer *)self _addFetchingContentAssertionForPid:[(UIElementProtocol *)self->_currentElementForFetching pid]];
    [(SpeakThisUIServer *)self _addFetchingContentAssertionForPid:[(AXElement *)self->_currentApp pid]];
    [(SpeakThisUIServer *)self _addStayingAliveAssertionForPid:[(UIElementProtocol *)self->_currentElementForFetching pid]];
    id v54 = [(AXElement *)self->_currentApp pid];

    [(SpeakThisUIServer *)self _addStayingAliveAssertionForPid:v54];
    uint64_t v8 = v82;
    id v11 = &AXDeviceHasJindo_ptr;
  }
  if (![v12 count] && v15) {
    goto LABEL_48;
  }
  if (![v12 count])
  {
    savedOpaqueParentForFetching = self->_savedOpaqueParentForFetching;
    if (savedOpaqueParentForFetching)
    {
      objc_storeStrong((id *)&self->_currentElementForFetching, savedOpaqueParentForFetching);
      long long v69 = self->_savedOpaqueParentForFetching;
      self->_savedOpaqueParentForFetching = 0;

LABEL_48:
      uint64_t v55 = [(SpeakThisUIServer *)self _fetchNextElementsFromOpaqueProviderAndScroll:v7];

      id v12 = (id)v55;
    }
  }
  if (!v15 || [v12 count] || (v7 & 1) != 0)
  {
    uint64_t v56 = +[NSMutableString string];
    BOOL v57 = AXLogSpeakScreen();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v91 = (UIElementProtocol *)v12;
      _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "Received elements and strings: %{public}@", buf, 0xCu);
    }

    id v58 = [v11[136] array];
    id v59 = [v12 count];
    [(SpeakThisUIServer *)v84 _appendContentFromElementsAndStrings:v12 toContentString:v56 speakingRanges:v58 startWithPageTurnElement:v8 deviceOrientation:a6];
    if ((v15 & 1) == 0 && [v12 count] > v59)
    {
      uint64_t v60 = +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", [v12 lastObject]);
      UIAccessibilityTraits v61 = v84->_currentElementForFetching;
      v84->_currentElementForFetching = (UIElementProtocol *)v60;
    }
    uint64_t v62 = AXLogSpeakScreen();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v91 = v56;
      _os_log_impl(&dword_0, v62, OS_LOG_TYPE_INFO, "Content string was %{private}@", buf, 0xCu);
    }

    unsigned int v63 = [(SpeakThisUIServer *)v84 speakingRangeAndElements];

    if (v63)
    {
      id v64 = [(SpeakThisUIServer *)v84 speakingRangeAndElements];
      v65 = [v64 arrayByAddingObjectsFromArray:v58];
      [(SpeakThisUIServer *)v84 setSpeakingRangeAndElements:v65];
    }
    else
    {
      [(SpeakThisUIServer *)v84 setSpeakingRangeAndElements:v58];
    }
    id v66 = AXLogSpeakScreen();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v91 = v58;
      _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "Speaking ranges were %{private}@", buf, 0xCu);
    }

    _AXSetAllowsSuspendedAppServer();
  }
  else
  {
    uint64_t v56 = [(SpeakThisUIServer *)self _fetchNextElementsAndReturnContentStringUsingAppElement:0 startingWithPageTurnElement:0 shouldScrollOpaqueProviderIfNecessary:1 deviceOrientation:a6];
  }

  return v56;
}

- (void)_fetchContentStartingWithPageTurnElement:(BOOL)a3 shouldRefreshContent:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  double v9 = [(AXElement *)self->_currentApp uiElement];
  id v10 = [v9 copy];

  self->_stopType = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_822C;
  v24 = &unk_287A0;
  unsigned int v25 = self;
  BOOL v26 = v27;
  AXPerformBlockSynchronouslyOnMainThread();
  id v11 = [(SpeakThisUIServer *)self _dispatchQueueForFetches];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_829C;
  block[3] = &unk_287F0;
  BOOL v19 = a4;
  id v15 = v10;
  uint64_t v16 = self;
  BOOL v20 = a3;
  id v17 = v8;
  id v18 = v27;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(v11, block);

  _Block_object_dispose(v27, 8);
}

- (void)_fetchNextSpeakThisElementsAndScrollOpaqueProviderIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  BOOL v19 = sub_85D0;
  BOOL v20 = &unk_287A0;
  uint64_t v21 = self;
  uint64_t v22 = v23;
  AXPerformBlockSynchronouslyOnMainThread();
  [(SpeakThisUIServer *)self setIsFetchingContent:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_8640;
  v13[3] = &unk_28868;
  BOOL v16 = a3;
  v13[4] = self;
  id v15 = v23;
  id v7 = v6;
  id v14 = v7;
  id v8 = objc_retainBlock(v13);
  double v9 = [(SpeakThisUIServer *)self _dispatchQueueForFetches];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8840;
  block[3] = &unk_28840;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);

  _Block_object_dispose(v23, 8);
}

- (void)_clearAssertions:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412290;
    long long v14 = v5;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v8);
        id v10 = AXLogSpeakScreen();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [v9 attributes];
          *(_DWORD *)buf = 134218242;
          id v21 = v9;
          __int16 v22 = 2112;
          uint64_t v23 = v11;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Clearing assertion for fetching more content. %p: %@", buf, 0x16u);
        }
        id v15 = 0;
        [v9 invalidateWithError:&v15];
        id v12 = v15;
        if (v12)
        {
          id v13 = AXLogSpeakScreen();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            id v21 = v12;
            _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Invalidation error: %@", buf, 0xCu);
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }
  objc_msgSend(v3, "removeAllObjects", v14);
}

- (id)_assertionAttributesForStayingAlive
{
  v2 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.Accessibility" name:@"SpeakScreenStayAlive"];
  long long v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)_assertionAttributesForFetchingMoreContent
{
  v2 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.Accessibility" name:@"SpeakScreenFetchContent"];
  long long v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)_addStayingAliveAssertionForPid:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = [(SpeakThisUIServer *)self assertionsForStayingAlive];
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) target];
        id v11 = +[RBSTarget targetWithPid:v3];
        unsigned __int8 v12 = [v10 isEqual:v11];

        if (v12) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v22 objects:v34 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      id v13 = objc_alloc((Class)RBSAssertion);
      long long v14 = +[NSString stringWithFormat:@"Speak Screen Assertion-%d", v3];
      id v15 = +[RBSTarget targetWithPid:v3];
      long long v16 = [(SpeakThisUIServer *)self _assertionAttributesForStayingAlive];
      id v5 = [v13 initWithExplanation:v14 target:v15 attributes:v16];

      [v5 acquireWithInvalidationHandler:&stru_288A8];
      long long v17 = AXLogSpeakScreen();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        long long v18 = [v5 attributes];
        long long v19 = [v5 explanation];
        BOOL v20 = +[NSNumber numberWithInt:v3];
        *(_DWORD *)buf = 134218754;
        id v27 = v5;
        __int16 v28 = 2112;
        unsigned int v29 = v18;
        __int16 v30 = 2112;
        id v31 = v19;
        __int16 v32 = 2112;
        int64_t v33 = v20;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Acquire staying alive assertion: %p %@  %@ %@", buf, 0x2Au);
      }
      if (v5)
      {
        id v21 = [(SpeakThisUIServer *)self assertionsForStayingAlive];
        [v21 addObject:v5];
      }
    }
  }
}

- (void)_addFetchingContentAssertionForPid:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = [(SpeakThisUIServer *)self assertionsForFetchingContent];
    id v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v21 + 1) + 8 * v9) target];
        id v11 = +[RBSTarget targetWithPid:v3];
        unsigned __int8 v12 = [v10 isEqual:v11];

        if (v12) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      id v5 = +[RBSTarget targetWithPid:v3];
      if (v5)
      {
        id v13 = objc_alloc((Class)RBSAssertion);
        long long v14 = [(AXElement *)self->_currentApp uiElement];
        id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Speak Screen Assertion-%d", [v14 pid]);
        long long v16 = [(SpeakThisUIServer *)self _assertionAttributesForFetchingMoreContent];
        long long v17 = [v13 initWithExplanation:v15 target:v5 attributes:v16];

        [v17 acquireWithInvalidationHandler:&stru_288C8];
        long long v18 = AXLogSpeakScreen();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = [v17 attributes];
          *(_DWORD *)buf = 138412290;
          BOOL v26 = v19;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Acquire fetching content assertion: %@", buf, 0xCu);
        }
        BOOL v20 = [(SpeakThisUIServer *)self assertionsForFetchingContent];
        [v20 addObject:v17];
      }
      else
      {
        long long v17 = AXLogSpeakScreen();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_193F8(v3, v17);
        }
      }
    }
  }
}

- (id)_dispatchQueueForFetches
{
  return self->_fetchDispatchQueue;
}

- (void)_handleSpeakThisWithOptions:(int64_t)a3 appPoint:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!_AXSSpeakThisEnabled())
  {
    id v10 = AXLogSpeakScreen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "We were asked to speak the screen, but the setting was off.  Bailing.", buf, 2u);
    }

    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
  if (!_AXSApplicationAccessibilityEnabled())
  {
    id v11 = AXLogSpeakScreen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "ERROR: Application accessibility was disabled even though Speak Screen was in use.  Please file a bug with details about what you were doing before you saw this message.", buf, 2u);
    }

    _AXSApplicationAccessibilitySetEnabled();
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_reallyHideUI" object:0];
  *(_WORD *)&self->_lockButtonPressedSinceReadAllStart = 256;
  self->_forceRectsToScroll = 1;
  [(AXOrator *)self->_orator setContent:0];
  [(AXOrator *)self->_orator stopSpeaking:0];
  [(SpeakThisUIServer *)self setIsReadingFromFrontmostApp:1];
  [(SpeakThisUIServer *)self setNeedToRefreshContextIds:0];
  unsigned __int8 v12 = [(AXElement *)self->_currentApp uiElement];
  -[SpeakThisUIServer _addStayingAliveAssertionForPid:](self, "_addStayingAliveAssertionForPid:", [v12 pid]);

  id v13 = AXLogSpeakScreen();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SpeakThis-FetchContent", (const char *)&unk_26FC9, buf, 2u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_9430;
  v16[3] = &unk_288F0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a3;
  id v14 = v9;
  id v15 = v8;
  [(SpeakThisUIServer *)self _fetchContentStartingWithPageTurnElement:0 shouldRefreshContent:0 completion:v16];
}

- (id)_handlePauseSpeaking
{
  orator = self->_orator;
  id v10 = 0;
  unsigned __int8 v4 = [(AXOrator *)orator pauseSpeaking:&v10];
  id v5 = v10;
  id v6 = v5;
  id v7 = 0;
  if ((v4 & 1) == 0)
  {
    uint64_t v11 = STSMessageReplyKeyErrorCode;
    id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SpeakThisUIServer _stsErrorCodeForOratorErrorCode:](self, "_stsErrorCodeForOratorErrorCode:", [v5 code]));
    unsigned __int8 v12 = v8;
    id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }

  return v7;
}

- (id)_handleResumeSpeaking
{
  orator = self->_orator;
  id v10 = 0;
  unsigned __int8 v4 = [(AXOrator *)orator resumeSpeaking:&v10];
  id v5 = v10;
  id v6 = v5;
  id v7 = 0;
  if ((v4 & 1) == 0)
  {
    uint64_t v11 = STSMessageReplyKeyErrorCode;
    id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SpeakThisUIServer _stsErrorCodeForOratorErrorCode:](self, "_stsErrorCodeForOratorErrorCode:", [v5 code]));
    unsigned __int8 v12 = v8;
    id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }

  return v7;
}

- (id)_handleToggleSpeaking
{
  if ([(AXOrator *)self->_orator isSpeaking])
  {
    uint64_t v3 = [(SpeakThisUIServer *)self _handlePauseSpeaking];
  }
  else if ([(AXOrator *)self->_orator isPaused])
  {
    uint64_t v3 = [(SpeakThisUIServer *)self _handleResumeSpeaking];
  }
  else
  {
    uint64_t v5 = STSMessageReplyKeyErrorCode;
    id v6 = &off_29570;
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  }

  return v3;
}

- (id)_handleSpeakFaster
{
  if ([(AXOrator *)self->_orator speakFaster])
  {
    v2 = 0;
  }
  else
  {
    uint64_t v4 = STSMessageReplyKeyErrorCode;
    uint64_t v5 = &off_29588;
    v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  }

  return v2;
}

- (id)_handleSpeakSlower
{
  if ([(AXOrator *)self->_orator speakSlower])
  {
    v2 = 0;
  }
  else
  {
    uint64_t v4 = STSMessageReplyKeyErrorCode;
    uint64_t v5 = &off_295A0;
    v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  }

  return v2;
}

- (id)_handleUpdateSpeakingRate:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:STSMessageKeySpeakingRate];
  int v5 = [v4 intValue];

  [(SpeakThisUIServer *)self standardSpeakingRateAsInt];
  switch(v5)
  {
    case 4:
      unint64_t v6 = [(SpeakThisUIServer *)self doubleSpeakingRateAsInt];
      break;
    case 3:
      unint64_t v6 = [(SpeakThisUIServer *)self oneAndAHalfSpeakingRateAsInt];
      break;
    case 1:
      unint64_t v6 = [(SpeakThisUIServer *)self halfSpeakingRateAsInt];
      break;
    default:
      unint64_t v6 = [(SpeakThisUIServer *)self standardSpeakingRateAsInt];
      break;
  }
  [(AXOrator *)self->_orator setSpeakingRate:(double)v6 / 100000.0];
  [(SpeakThisUIServer *)self _handleRateChangeSpeechIfNeeded:1];
  id v7 = AXLogSpeakScreen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_19500(v5, v7);
  }

  return 0;
}

- (void)_handleFastForward:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9EF4;
  v4[3] = &unk_28918;
  int v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SpeakThisUIServer *)v5 _readNextPageIfApplicableInForwardDirection:1 completion:v4];
}

- (void)_handleRewind:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A0EC;
  v4[3] = &unk_28918;
  int v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SpeakThisUIServer *)v5 _readNextPageIfApplicableInForwardDirection:0 completion:v4];
}

- (void)_updateIsHighlightVisible
{
  id v3 = [(AXSpeakOverlayViewController *)self->_viewController highlightSelectionRects];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    int v5 = [(AXSpeakOverlayViewController *)self->_viewController sentenceHighlightSelectionRects];
    BOOL v4 = [v5 count] != 0;
  }
  if (v4 != [(SpeakThisUIServer *)self cachedIsHighlightVisible])
  {
    id v6 = AXLogSpeakScreen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Update is highlight visible: %i", (uint8_t *)v8, 8u);
    }

    id v7 = +[AXBackBoardServer server];
    [v7 setIsSpeakScreenHighlightVisible:v4];

    [(SpeakThisUIServer *)self setCachedIsHighlightVisible:v4];
  }
}

- (id)_handleUnknownMessageIdentifier:(unint64_t)a3
{
  id v3 = AXLogSpeakScreen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_19578();
  }

  return 0;
}

- (void)_updateCurrentAppWithPoint:(id)a3 bundleID:(id)a4 sceneID:(id)a5 rootElementAccessibilityIdentifier:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (AXElement *)a4;
  unsigned __int8 v12 = (AXElement *)a5;
  id v13 = (AXElement *)a6;
  if ([(SpeakThisUIServer *)self isContinuitySessionActive])
  {
    id v14 = AXLogSpeakScreen();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v54) = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "forcing frontmost app to be SpringBoard due to Oneness", (uint8_t *)&v54, 2u);
    }

    id v15 = +[AXElement systemWideElement];
    long long v16 = [v15 systemApplication];
LABEL_9:
    currentApp = self->_currentApp;
    self->_currentApp = v16;
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  if (v10)
  {
    id v17 = AXLogSpeakScreen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v10 debugDescription];
      int v54 = 138412290;
      uint64_t v55 = v18;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "checking current app based on appPointValue %@", (uint8_t *)&v54, 0xCu);
    }
    id v15 = [(SpeakThisUIServer *)self _systemApp];
    long long v16 = [v15 elementForAttribute:91700 parameter:v10];
    goto LABEL_9;
  }
  if (v11)
  {
    long long v23 = AXLogSpeakScreen();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v54 = 138412290;
      uint64_t v55 = v11;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "checking current app based on bundleid %@", (uint8_t *)&v54, 0xCu);
    }

    long long v24 = [(SpeakThisUIServer *)self _systemApp];
    long long v25 = [v24 elementForAttribute:91510 parameter:v11];
    BOOL v26 = self->_currentApp;
    self->_currentApp = v25;

    id v27 = self->_currentApp;
    if (!v27)
    {
      id v15 = AXLogSpeakScreen();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_195E0();
      }
      goto LABEL_11;
    }
    if (v13)
    {
      id v15 = [(AXElement *)v27 elementForAttribute:95255 parameter:v13];
      __int16 v28 = AXLogSpeakScreen();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        unsigned int v29 = [v15 debugDescription];
        int v54 = 138412290;
        uint64_t v55 = v29;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "AXElement with kAXSpeakThisRootElementParametrizedAttribute: %@", (uint8_t *)&v54, 0xCu);
      }
      __int16 v30 = AXLogSpeakScreen();
      id v31 = v30;
      if (v15)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          int v54 = 138412290;
          uint64_t v55 = v13;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "checking current app for accessibilityIdentifier: %@", (uint8_t *)&v54, 0xCu);
        }

        __int16 v32 = [(AXElement *)self->_currentApp uiElement];
        [v32 setAXAttribute:3060 withString:v13];
      }
      else
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_19648();
        }

        __int16 v32 = self->_currentApp;
        self->_currentApp = 0;
      }
      goto LABEL_48;
    }
    unsigned __int8 v38 = [(AXElement *)v27 uiElement];
    id v15 = v38;
    uint64_t v39 = 3060;
    id v40 = 0;
LABEL_34:
    [v38 setAXAttribute:v39 withString:v40];
    goto LABEL_11;
  }
  if (!v12)
  {
    AXOverrideRequestingClientType();
    uint64_t v41 = [(SpeakThisUIServer *)self focusManager];
    id v15 = [v41 currentApplication];

    AXOverrideRequestingClientType();
    id v42 = +[AXElement systemWideElement];
    uint64_t v43 = [v42 elementForAttribute:1005 shouldFetchAttributes:0];
    unsigned int v44 = [v43 isEqual:v15];

    if (v44)
    {
      currentApp = self->_currentApp;
      self->_currentApp = 0;
      goto LABEL_10;
    }
    AXOverrideRequestingClientType();
    int64_t v45 = [(SpeakThisUIServer *)self focusManager];
    __int16 v32 = [v45 currentApplication];

    AXOverrideRequestingClientType();
    uint64_t v46 = [v32 bundleId];
    unsigned int v47 = [v46 isEqualToString:AX_SiriBundleName];

    uint64_t v48 = AXLogSpeakScreen();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
    if (v47)
    {
      if (v49)
      {
        LOWORD(v54) = 0;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "keyboard focused app was Siri, so defaulting to kAXDefaultSpeakThisApplicationAttribute", (uint8_t *)&v54, 2u);
      }

      id v50 = [(SpeakThisUIServer *)self _systemApp];
      id v51 = [v50 elementForAttribute:1104];
      uint64_t v52 = self->_currentApp;
      self->_currentApp = v51;
    }
    else
    {
      if (v49)
      {
        LOWORD(v54) = 0;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "using keyboard focused app", (uint8_t *)&v54, 2u);
      }

      id v53 = v32;
      id v50 = self->_currentApp;
      self->_currentApp = v53;
    }

LABEL_48:
    goto LABEL_11;
  }
  int64_t v33 = AXLogSpeakScreen();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    int v54 = 138412290;
    uint64_t v55 = v12;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "checking current app based on sceneid %@", (uint8_t *)&v54, 0xCu);
  }

  uint64_t v34 = [(SpeakThisUIServer *)self _systemApp];
  id v35 = [v34 elementForAttribute:91512 parameter:v12];
  uint64_t v36 = self->_currentApp;
  self->_currentApp = v35;

  char v37 = self->_currentApp;
  if (v37)
  {
    unsigned __int8 v38 = [(AXElement *)v37 uiElement];
    id v15 = v38;
    uint64_t v39 = 3061;
    id v40 = v12;
    goto LABEL_34;
  }
LABEL_12:
  BOOL v20 = AXLogSpeakScreen();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    long long v21 = self->_currentApp;
    long long v22 = [(AXElement *)v21 bundleId];
    int v54 = 138412802;
    uint64_t v55 = v21;
    __int16 v56 = 2114;
    id v57 = v10;
    __int16 v58 = 2114;
    id v59 = v22;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Updated current app %@ (app point: %{public}@) to %{public}@", (uint8_t *)&v54, 0x20u);
  }
}

- (int64_t)_stsErrorCodeForOratorErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 7;
  }
  else {
    return qword_26908[a3 - 1];
  }
}

- (void)_finishHandlingPageScroll:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = AXLogSpeakScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Finishing handling page scroll.  Did read next page: %i", (uint8_t *)v8, 8u);
  }

  id v6 = [(SpeakThisUIServer *)self readNextPageCompletion];

  if (v6)
  {
    id v7 = [(SpeakThisUIServer *)self readNextPageCompletion];
    v7[2](v7, v3);
  }
  [(SpeakThisUIServer *)self setIsWaitingForPageScroll:0];
}

- (void)_handleNewPage
{
  BOOL v3 = [(SpeakThisUIServer *)self sentenceRanges];
  [v3 removeAllObjects];

  self->_currentSentenceRange = (_NSRange)xmmword_268F0;
  currentSentenceElement = self->_currentSentenceElement;
  self->_currentSentenceElement = 0;

  int v5 = [(AXOrator *)self->_orator content];
  [(AXOrator *)self->_orator setContent:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_AC0C;
  v7[3] = &unk_28940;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [(SpeakThisUIServer *)self _fetchContentStartingWithPageTurnElement:1 shouldRefreshContent:1 completion:v7];
}

- (void)_giveUpWaitingForPageToScroll
{
  BOOL v3 = AXLogSpeakScreen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint64_t v5 = 0x3FF8000000000000;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Did not get page scroll notification in %f seconds.", (uint8_t *)&v4, 0xCu);
  }

  [(SpeakThisUIServer *)self _finishHandlingPageScroll:0];
}

- (void)_readNextPageIfApplicableInForwardDirection:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = +[AXSpringBoardServer server];
  unsigned int v8 = [v7 isScreenLockedWithPasscode:0];

  id v9 = AXLogSpeakScreen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    currentPageTurnElement = self->_currentPageTurnElement;
    int v31 = 138412290;
    __int16 v32 = currentPageTurnElement;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Read next page if possible: %@", (uint8_t *)&v31, 0xCu);
  }

  if (self->_currentPageTurnElement)
  {
    uint64_t v11 = AXLogSpeakScreen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v12 = [(AXElement *)self->_currentPageTurnElement uiElement];
      int v31 = 138412290;
      __int16 v32 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Allowing suspended app AX while we turn the page. %@", (uint8_t *)&v31, 0xCu);
    }
    _AXSetAllowsSuspendedAppServer();
    id v13 = AXLogSpeakScreen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Updating flags on assertion so that we can fetch more content.", (uint8_t *)&v31, 2u);
    }

    id v14 = [(AXElement *)self->_currentPageTurnElement uiElement];
    -[SpeakThisUIServer _addFetchingContentAssertionForPid:](self, "_addFetchingContentAssertionForPid:", [v14 pid]);

    id v15 = [(AXElement *)self->_currentPageTurnElement uiElement];
    -[SpeakThisUIServer _addStayingAliveAssertionForPid:](self, "_addStayingAliveAssertionForPid:", [v15 pid]);

    [(SpeakThisUIServer *)self _addFetchingContentAssertionForPid:[(AXElement *)self->_currentApp pid]];
    [(SpeakThisUIServer *)self _addStayingAliveAssertionForPid:[(AXElement *)self->_currentApp pid]];
    if (v8)
    {
      long long v16 = AXLogSpeakScreen();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Waiting extra long for page turn.", (uint8_t *)&v31, 2u);
      }

      id v17 = [(AXElement *)self->_currentPageTurnElement uiElement];
      AXUIElementSetMessagingTimeout((AXUIElementRef)[v17 axElement], 5.0);
    }
    id v18 = [(AXElement *)self->_currentPageTurnElement uiElement];
    int64_t v19 = v18;
    if (v4) {
      uint64_t v20 = 2019;
    }
    else {
      uint64_t v20 = 2020;
    }
    id v21 = [v18 performAXAction:v20];

    long long v22 = AXLogSpeakScreen();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = self->_currentPageTurnElement;
      long long v24 = +[NSNumber numberWithBool:v21];
      int v31 = 138412546;
      __int16 v32 = v23;
      __int16 v33 = 2112;
      uint64_t v34 = v24;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Asking for page scroll: %@ %@", (uint8_t *)&v31, 0x16u);
    }
    if ((v21 & 1) != 0
      || (([(AXElement *)self->_currentPageTurnElement uiElement],
           long long v25 = objc_claimAutoreleasedReturnValue(),
           BOOL v26 = v25,
           !v4)
        ? (uint64_t v27 = 2008)
        : (uint64_t v27 = 2009),
          unsigned __int8 v28 = [v25 performAXAction:v27],
          v26,
          (v28 & 1) != 0))
    {
      _AXSetAllowsSuspendedAppServer();
      [(SpeakThisUIServer *)self setReadNextPageCompletion:v6];
      [(SpeakThisUIServer *)self setIsWaitingForPageScroll:1];
      double v29 = 1.5;
      if (v8) {
        double v29 = 9.0;
      }
      [(SpeakThisUIServer *)self performSelector:"_giveUpWaitingForPageToScroll" withObject:0 afterDelay:v29];
      goto LABEL_30;
    }
    __int16 v30 = AXLogSpeakScreen();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Page returned NO for scroll action.", (uint8_t *)&v31, 2u);
    }

    _AXSetAllowsSuspendedAppServer();
  }
  if (v6) {
    v6[2](v6, 0);
  }
LABEL_30:
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  if (!self->_lockButtonPressedSinceReadAllStart)
  {
    BOOL v3 = a3;
    id v4 = +[UIApplication sharedApplication];
    [v4 _setIdleTimerDisabled:v3 forReason:@"SpeakThis"];
  }
}

- (void)_clearAllAssertions
{
  BOOL v3 = AXLogSpeakScreen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Clear all assertions", v6, 2u);
  }

  id v4 = [(SpeakThisUIServer *)self assertionsForFetchingContent];
  [(SpeakThisUIServer *)self _clearAssertions:v4];

  uint64_t v5 = [(SpeakThisUIServer *)self assertionsForStayingAlive];
  [(SpeakThisUIServer *)self _clearAssertions:v5];
}

- (void)_handleSpeakingStopped
{
  currentPageTurnElement = self->_currentPageTurnElement;
  self->_currentPageTurnElement = 0;

  id v4 = AXLogSpeakScreen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "speaking stopped, clearing", buf, 2u);
  }

  [(SpeakThisUIServer *)self setIsWaitingForPageScroll:0];
  [(SpeakThisUIServer *)self setReadNextPageCompletion:0];
  uint64_t v5 = [(SpeakThisUIServer *)self sentenceRanges];
  [v5 removeAllObjects];

  self->_currentSentenceRange = (_NSRange)xmmword_268F0;
  currentSentenceElement = self->_currentSentenceElement;
  self->_currentSentenceElement = 0;

  [(AXSpeakOverlayViewController *)self->_viewController didStop];
  [(SpeakThisUIServer *)self _updateIsHighlightVisible];
  id v7 = +[AXSettings sharedInstance];
  unsigned __int8 v8 = [v7 showSpeechController];

  if (!self->_waitingForNewReadAll) {
    [(SpeakThisUIServer *)self _clearAllAssertions];
  }
  int stopType = self->_stopType;
  if (stopType == 1) {
    char v10 = v8;
  }
  else {
    char v10 = 1;
  }
  if (v10)
  {
    double v11 = 0.0;
    if (stopType != 3)
    {
      self->_int stopType = 2;
      double v11 = 2.0;
    }
  }
  else
  {
    v21[5] = _NSConcreteStackBlock;
    v21[6] = 3221225472;
    v21[7] = sub_B7D0;
    v21[8] = &unk_28710;
    v21[9] = self;
    AXPerformBlockAsynchronouslyOnMainThread();
    double v11 = 0.5;
  }
  int v12 = self->_stopType;
  if (v8)
  {
    if (v12 == 2)
    {
      id v13 = [(SpeakThisUIServer *)self stateManager];
      [v13 setCurrentState:0];

      id v14 = [(SpeakThisUIServer *)self _windowSceneForActiveDisplay];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_B860;
      v21[3] = &unk_28710;
      v21[4] = self;
      [(SpeakThisUIServer *)self _updateViewControllerForWindowScene:v14 completion:v21];
    }
  }
  else if (v12 != 3 && !self->_waitingForNewReadAll)
  {
    [(SpeakThisUIServer *)self performSelector:"_reallyHideUI" withObject:0 afterDelay:v11];
  }
  if ([(SpeakThisUIServer *)self isPausingAssistiveTechnology])
  {
    +[UIAccessibilityNotification postNotification:UIAccessibilityResumeAssistiveTechnologyNotification withData:UIAccessibilityNotificationSwitchControlIdentifier];
    [(SpeakThisUIServer *)self setIsPausingAssistiveTechnology:0];
  }
  id v15 = [(SpeakThisUIServer *)self rootElementAccessibilityIdentifier];

  if (v15)
  {
    long long v16 = AXLogSpeakScreen();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "setting the app's speak this root element accessibility identifier to nil.", buf, 2u);
    }

    id v17 = [(AXElement *)self->_currentApp uiElement];
    [v17 setAXAttribute:3060 withString:0];

    [(SpeakThisUIServer *)self setRootElementAccessibilityIdentifier:0];
  }
  id v18 = [(SpeakThisUIServer *)self sceneIdentifier];

  if (v18)
  {
    int64_t v19 = AXLogSpeakScreen();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "setting the app's speak this scene to nil.", buf, 2u);
    }

    uint64_t v20 = [(AXElement *)self->_currentApp uiElement];
    [v20 setAXAttribute:3061 withString:0];

    [(SpeakThisUIServer *)self setSceneIdentifier:0];
  }
}

- (unint64_t)_findIndexOfRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  unint64_t location = a3.location;
  id v6 = [(SpeakThisUIServer *)self speakingRangeAndElements];
  unint64_t v7 = (unint64_t)[v6 count];

  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned __int8 v8 = [(SpeakThisUIServer *)self speakingRangeAndElements];
  unint64_t v9 = (unint64_t)[v8 count] >> 1;

  char v10 = [(SpeakThisUIServer *)self speakingRangeAndElements];
  double v11 = [v10 objectAtIndexedSubscript:v9];

  unint64_t v12 = 0;
  while (1)
  {
    if ((unint64_t)[v11 range] <= location)
    {
      id v13 = [v11 range];
      if ((unint64_t)v13 + v14 > location) {
        break;
      }
    }
    id v15 = [v11 range];
    if ((unint64_t)v15 + v16 <= location)
    {
      unint64_t v17 = v12 + v7;
      unint64_t v12 = v9 + 1;
      unint64_t v7 = v17 - (v9 + 1);
      if (v17 <= v9 + 1) {
        goto LABEL_15;
      }
    }
    else
    {
      if (location + length > (unint64_t)[v11 range])
      {
        uint64_t v20 = AXLogSpeakScreen();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v28.unint64_t location = location;
          v28.NSUInteger length = length;
          id v21 = NSStringFromRange(v28);
          v29.unint64_t location = (NSUInteger)[v11 range];
          long long v22 = NSStringFromRange(v29);
          int v24 = 138412546;
          long long v25 = v21;
          __int16 v26 = 2112;
          uint64_t v27 = v22;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Somehow spoke a string range %@ that contained an entire element's portion of our content string %@.", (uint8_t *)&v24, 0x16u);
        }
LABEL_15:
        unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
      unint64_t v7 = v9 - v12;
      if (v9 == v12) {
        goto LABEL_15;
      }
    }
    unint64_t v9 = v12 + (v7 >> 1);
    id v18 = [(SpeakThisUIServer *)self speakingRangeAndElements];
    uint64_t v19 = [v18 objectAtIndexedSubscript:v9];

    double v11 = (void *)v19;
  }

  return v9;
}

- (id)_convertAXValueSceneReferenceRects:(id)a3 toView:(id)a4 fromElement:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = +[AXElement elementWithUIElement:a5];
  id v10 = [v9 windowContextId];

  if (v7)
  {
    double v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v38 = v7;
    id v12 = v7;
    id v13 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v44;
      CGSize size = CGRectZero.size;
      CGPoint origin = CGRectZero.origin;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v17 = *(const __AXValue **)(*((void *)&v43 + 1) + 8 * i);
          CGPoint valuePtr = origin;
          CGSize v42 = size;
          AXValueGetValue(v17, kAXValueTypeCGRect, &valuePtr);
          id v18 = +[AXElement systemWideElement];
          objc_msgSend(v18, "convertRect:fromContextId:", v10, valuePtr, v42);
          double v20 = v19;
          double v22 = v21;
          double v24 = v23;
          double v26 = v25;

          uint64_t v27 = [v8 window];
          objc_msgSend(v27, "_convertRectFromSceneReferenceSpace:", v20, v22, v24, v26);
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;

          objc_msgSend(v8, "convertRect:fromView:", 0, v29, v31, v33, v35);
          uint64_t v36 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
          [v11 addObject:v36];
        }
        id v14 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v14);
    }

    id v7 = v38;
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)_systemApp
{
  systemApp = self->_systemApp;
  if (!systemApp)
  {
    id v4 = +[AXElement systemWideElement];
    uint64_t v5 = [v4 uiElement];
    +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", [v5 objectWithAXAttribute:1001]);
    id v6 = (AXElement *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_systemApp;
    self->_systemApp = v6;

    systemApp = self->_systemApp;
  }

  return systemApp;
}

- (void)_handleIdleTimerReset
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)&qword_30220 > 4.0)
  {
    if (!self->_lockButtonPressedSinceReadAllStart)
    {
      BOOL v3 = +[AXElement systemWideElement];
      [v3 sendUserEventOccurred];
    }
    qword_30220 = CFAbsoluteTimeGetCurrent();
  }
}

- (void)_kbFrameWillUpdate:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  [(AXSpeakOverlayViewController *)self->_viewController handleKBFrameWillUpdate:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    id v6 = v7;
  }
}

- (void)oratorDidFinishSpeaking:(id)a3
{
  id v5 = +[AXSpeakFingerManager sharedInstance];
  if ([v5 speakFingerState] == (char *)&dword_0 + 2
    && ![(SpeakThisUIServer *)self isFetchingContent])
  {
    unsigned __int8 v4 = [(SpeakThisUIServer *)self isWaitingForPageScroll];

    if ((v4 & 1) == 0)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_BF44;
      v6[3] = &unk_28968;
      v6[4] = self;
      [(SpeakThisUIServer *)self _readNextPageIfApplicableInForwardDirection:1 completion:v6];
    }
  }
  else
  {
  }
}

- (void)oratorDidPauseSpeaking:(id)a3
{
  [(AXSpeakOverlayViewController *)self->_viewController didPause];

  [(SpeakThisUIServer *)self setIdleTimerDisabled:0];
}

- (void)oratorDidResumeSpeaking:(id)a3
{
  [(AXSpeakOverlayViewController *)self->_viewController didResume];

  [(SpeakThisUIServer *)self setIdleTimerDisabled:1];
}

- (void)oratorDidStartSpeaking:(id)a3
{
  unsigned __int8 v4 = AXLogSpeakScreen();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SpeakThis-StartSpeaking", (const char *)&unk_26FC9, v7, 2u);
  }

  [(SpeakThisUIServer *)self setIdleTimerDisabled:1];
  id v5 = +[AXSpeakFingerManager sharedInstance];
  id v6 = (char *)[v5 speakFingerState];

  if (v6 == (unsigned char *)&dword_0 + 2) {
    [(AXSpeakOverlayViewController *)self->_viewController didResume];
  }
  self->_int stopType = 0;
  self->_waitingForNewReadAll = 0;
}

- (void)oratorDidCancelSpeaking:(id)a3
{
}

- (void)orator:(id)a3 willSpeakRange:(_NSRange)a4 ofContent:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  [(SpeakThisUIServer *)self _handleIdleTimerReset];
  self->_currentWordRange.NSUInteger location = location;
  self->_currentWordRange.NSUInteger length = length;
  objc_storeStrong((id *)&self->_currentContent, a5);
  id v10 = AXLogSpeakScreen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v59.NSUInteger location = location;
    v59.NSUInteger length = length;
    double v22 = NSStringFromRange(v59);
    id v23 = [v9 length];
    double v24 = v9;
    if (location + length <= (unint64_t)v23)
    {
      double v24 = objc_msgSend(v9, "substringWithRange:", location, length);
    }
    *(_DWORD *)buf = 138543618;
    __int16 v56 = v22;
    __int16 v57 = 2114;
    __int16 v58 = v24;
    _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "Will speak range %{public}@ corresponding to \"%{public}@\"", buf, 0x16u);
    if (location + length <= (unint64_t)v23) {
  }
    }
  if (!_AXSQuickSpeakHighlightTextEnabled()) {
    goto LABEL_14;
  }
  double v11 = [(SpeakThisUIServer *)self speakingRangeAndElements];
  id v12 = [v11 count];

  if (!v12) {
    goto LABEL_14;
  }
  if (![(SpeakThisUIServer *)self isReadingFromFrontmostApp])
  {
    uint64_t v16 = AXLogSpeakScreen();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_196B0();
    }
    goto LABEL_13;
  }
  unint64_t v13 = -[SpeakThisUIServer _findIndexOfRange:](self, "_findIndexOfRange:", location, length);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_14:
    [(AXSpeakOverlayViewController *)self->_viewController setHighlightSelectionRects:0];
    [(SpeakThisUIServer *)self _updateIsHighlightVisible];
    goto LABEL_15;
  }
  unint64_t v14 = v13;
  uint64_t v15 = [(SpeakThisUIServer *)self speakingRangeAndElements];
  uint64_t v16 = [v15 objectAtIndexedSubscript:v14];

  objc_storeStrong((id *)&self->_currentSpeakingRange, v16);
  unint64_t v17 = [v16 element];

  if (!v17)
  {
LABEL_13:

    goto LABEL_14;
  }
  NSUInteger v18 = self->_currentSentenceRange.location;
  if (location < v18 || location - v18 >= self->_currentSentenceRange.length)
  {
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v25 = [(SpeakThisUIServer *)self sentenceRanges];
      id v26 = [v25 count];

      if (v26)
      {
        uint64_t v27 = [(SpeakThisUIServer *)self sentenceRanges];
        [v27 removeObjectAtIndex:0];
      }
    }
    double v28 = [(SpeakThisUIServer *)self sentenceRanges];
    double v29 = [v28 firstObject];
    self->_currentSentenceRange.NSUInteger location = (NSUInteger)[v29 rangeValue];
    self->_currentSentenceRange.NSUInteger length = v30;

    goto LABEL_25;
  }
  double v19 = [v16 element];
  unsigned __int8 v20 = [v19 isEqual:self->_currentSentenceElement];

  if ((v20 & 1) == 0)
  {
LABEL_25:
    double v31 = [v16 element];
    currentSentenceElement = self->_currentSentenceElement;
    self->_currentSentenceElement = v31;

    uint64_t v21 = 1;
    goto LABEL_26;
  }
  uint64_t v21 = 0;
LABEL_26:
  if (self->_forceRectsToScroll)
  {
    uint64_t v33 = 1;
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    double v34 = [(AXSpeakOverlayViewController *)self->_viewController highlightSelectionRects];
    uint64_t v33 = (uint64_t)[v34 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v33)
    {
      uint64_t v35 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v51 != v35) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * i) rectValue];
          CGFloat v38 = v37;
          CGFloat v40 = v39;
          CGFloat v42 = v41;
          CGFloat v44 = v43;
          [(AXElement *)self->_currentApp frame];
          v61.origin.double x = v45;
          v61.origin.double y = v46;
          v61.size.width = v47;
          v61.size.height = v48;
          v60.origin.double x = v38;
          v60.origin.double y = v40;
          v60.size.width = v42;
          v60.size.height = v44;
          if (CGRectIntersectsRect(v60, v61))
          {
            uint64_t v33 = 1;
            goto LABEL_38;
          }
        }
        uint64_t v33 = (uint64_t)[v34 countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }
LABEL_38:
  }
  LOBYTE(v49) = v21 & v33;
  -[SpeakThisUIServer _fetchTextRectsAndApplyHighlightToContent:withRange:elementRange:updateSentences:scrollWords:scrollSentences:](self, "_fetchTextRectsAndApplyHighlightToContent:withRange:elementRange:updateSentences:scrollWords:scrollSentences:", v9, location, length, v16, v21, v33, v49);
  self->_forceRectsToScroll = 0;

LABEL_15:
}

- (void)_fetchTextRectsAndApplyHighlightToContent:(id)a3 withRange:(_NSRange)a4 elementRange:(id)a5 updateSentences:(BOOL)a6 scrollWords:(BOOL)a7 scrollSentences:(BOOL)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a3;
  id v15 = a5;
  uint64_t v16 = AXLogSpeakScreen();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SpeakThis-FetchRects", (const char *)&unk_26FC9, buf, 2u);
  }

  NSUInteger v17 = location - (void)[v15 range];
  NSUInteger v18 = (char *)[v15 range];
  unsigned __int8 v20 = &v18[v19];
  if ((unint64_t)&v18[v19] >= location + length) {
    unsigned __int8 v20 = (char *)(location + length);
  }
  NSUInteger v21 = (NSUInteger)&v20[-location];
  double v22 = AXLogSpeakScreen();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v42.NSUInteger location = v17;
    v42.NSUInteger length = v21;
    sub_196E4(v42, v22);
  }

  *(void *)buf = 0;
  double v39 = buf;
  uint64_t v40 = 0x2020000000;
  BOOL v41 = a8;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  BOOL v37 = a7;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  BOOL v35 = a6;
  id v23 = [(SpeakThisUIServer *)self _dispatchQueueForFetches];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_C71C;
  v26[3] = &unk_289B8;
  v26[4] = self;
  id v27 = v15;
  id v28 = v14;
  double v29 = buf;
  NSUInteger v32 = v17;
  NSUInteger v33 = v21;
  NSUInteger v30 = v36;
  double v31 = v34;
  id v24 = v14;
  id v25 = v15;
  dispatch_async(v23, v26);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(buf, 8);
}

- (BOOL)highlightWords
{
  v2 = +[AXSettings sharedInstance];
  unint64_t v3 = (unint64_t)[v2 quickSpeakHighlightOption];

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)highlightSentences
{
  v2 = +[AXSettings sharedInstance];
  unint64_t v3 = (unint64_t)[v2 quickSpeakHighlightOption];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)oratorShouldFetchNextElements:(id)a3 shouldScrollOpaqueProviderIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = AXLogSpeakScreen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    CFStringRef v7 = @"disabled";
    if (v4) {
      CFStringRef v7 = @"enabled";
    }
    int v11 = 138412290;
    CFStringRef v12 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "AXOrator requested more elements with scrolling %@", (uint8_t *)&v11, 0xCu);
  }

  int stopType = self->_stopType;
  id v9 = AXLogSpeakScreen();
  id v10 = v9;
  if (stopType)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1984C();
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Updating flags on assertion so that we can fetch more content.", (uint8_t *)&v11, 2u);
    }

    [(SpeakThisUIServer *)self _addFetchingContentAssertionForPid:[(AXElement *)self->_currentApp pid]];
    [(SpeakThisUIServer *)self _addFetchingContentAssertionForPid:[(UIElementProtocol *)self->_currentElementForFetching pid]];
    AXOverrideRequestingClientType();
    [(SpeakThisUIServer *)self _fetchNextSpeakThisElementsAndScrollOpaqueProviderIfNecessary:v4 withCompletion:&stru_289F8];
  }
}

- (void)oratorDidChangeSpeakingRate:(id)a3
{
}

- (void)fastForwardButtonPressed
{
}

- (void)rewindButtonPressed
{
}

- (void)startNewReadAllFromGesture
{
  unint64_t v3 = +[AXSpeakFingerManager sharedInstance];
  BOOL v4 = (char *)[v3 speakFingerState];

  if (v4 != (unsigned char *)&dword_0 + 2)
  {
    id v5 = +[AXSpeakFingerManager sharedInstance];
    [v5 userManuallyExitedSpeakUnderFingerMode];
  }
  [(SpeakThisUIServer *)self _updateCurrentAppWithPoint:0 bundleID:0 sceneID:0 rootElementAccessibilityIdentifier:0];
  [(SpeakThisUIServer *)self _handleLoadUIAtAppPoint:0];

  [(SpeakThisUIServer *)self _handleSpeakThisWithOptions:12 appPoint:0 completion:0];
}

- (void)startNewReadAllForBundleID:(id)a3 sceneID:(id)a4 rootAccessibilityElementIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [(SpeakThisUIServer *)self setRootElementAccessibilityIdentifier:a5];
  [(SpeakThisUIServer *)self setSceneIdentifier:v8];

  id v10 = [(SpeakThisUIServer *)self sceneIdentifier];
  int v11 = [(SpeakThisUIServer *)self rootElementAccessibilityIdentifier];
  [(SpeakThisUIServer *)self _updateCurrentAppWithPoint:0 bundleID:v9 sceneID:v10 rootElementAccessibilityIdentifier:v11];

  if (self->_currentApp)
  {
    [(SpeakThisUIServer *)self _handleSpeakThisWithOptions:0 appPoint:0 completion:0];
  }
  else
  {
    CFStringRef v12 = AXLogSpeakScreen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Could not find app/scene/view, returning without speaking", v13, 2u);
    }
  }
}

- (void)playButtonPressedForBundleID:(id)a3 sceneID:(id)a4 rootAccessibilityElementIdentifier:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[AXSpeakFingerManager sharedInstance];
  int v11 = (char *)[v10 speakFingerState];

  if (v11 != (unsigned char *)&dword_0 + 2)
  {
    CFStringRef v12 = +[AXSpeakFingerManager sharedInstance];
    [v12 userManuallyExitedSpeakUnderFingerMode];
  }
  orator = self->_orator;
  id v14 = [(AXOrator *)orator content];
  LOBYTE(orator) = [(AXOrator *)orator canResumeWithContent:v14];

  if (orator)
  {
    [(AXOrator *)self->_orator resumeSpeaking:0];
  }
  else
  {
    [(SpeakThisUIServer *)self setSceneIdentifier:v8];
    [(SpeakThisUIServer *)self setRootElementAccessibilityIdentifier:v9];
    [(SpeakThisUIServer *)self _updateCurrentAppWithPoint:0 bundleID:v15 sceneID:v8 rootElementAccessibilityIdentifier:v9];
    [(SpeakThisUIServer *)self _handleSpeakThisWithOptions:12 appPoint:0 completion:0];
  }
}

- (void)pauseButtonPressed
{
}

- (void)stopButtonPressed
{
  self->_int stopType = 1;
  [(AXOrator *)self->_orator stopSpeaking:0];

  [(SpeakThisUIServer *)self _handleSpeakingStopped];
}

- (void)stopSpeakFingerButtonPressed
{
  id v2 = +[AXSpeakFingerManager sharedInstance];
  [v2 userManuallyExitedSpeakUnderFingerMode];
}

- (id)currentVoiceIdentifier
{
  unint64_t v3 = +[AXSettings sharedInstance];
  BOOL v4 = [(AXOrator *)self->_orator lastUtteranceLanguageCode];
  id v5 = [v3 speechVoiceIdentifierForLanguage:v4 sourceKey:AXSpeechSourceKeySpeechFeatures exists:0];

  return v5;
}

- (unint64_t)halfSpeakingRateAsInt
{
  id v2 = [(AXOrator *)self->_orator currentVoiceIdentifier];
  if (([v2 isEqualToString:AVSpeechSynthesisVoiceIdentifierAlex] & 1) != 0
    || ([v2 isEqualToString:AVSpeechSynthesisVoiceIdentifierVictoria] & 1) != 0)
  {
    unint64_t v3 = 3261;
  }
  else if ([v2 isEqualToString:AVSpeechSynthesisVoiceIdentifierFred])
  {
    unint64_t v3 = 3261;
  }
  else
  {
    unint64_t v3 = 25000;
  }

  return v3;
}

- (unint64_t)standardSpeakingRateAsInt
{
  return 50000;
}

- (unint64_t)oneAndAHalfSpeakingRateAsInt
{
  id v2 = [(AXOrator *)self->_orator currentVoiceIdentifier];
  if ([v2 isEqualToString:AVSpeechSynthesisVoiceIdentifierAlex])
  {
    unint64_t v3 = 58460;
  }
  else if ([v2 isEqualToString:AVSpeechSynthesisVoiceIdentifierVictoria])
  {
    unint64_t v3 = 63110;
  }
  else if ([v2 isEqualToString:AVSpeechSynthesisVoiceIdentifierFred])
  {
    unint64_t v3 = 56070;
  }
  else if (+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:v2])
  {
    unint64_t v3 = 75000;
  }
  else
  {
    unint64_t v3 = 58333;
  }

  return v3;
}

- (unint64_t)doubleSpeakingRateAsInt
{
  unint64_t v2 = 66660;
  unint64_t v3 = [(AXOrator *)self->_orator currentVoiceIdentifier];
  if ([v3 isEqualToString:AVSpeechSynthesisVoiceIdentifierAlex])
  {
    unint64_t v2 = 66920;
  }
  else if ([v3 isEqualToString:AVSpeechSynthesisVoiceIdentifierVictoria])
  {
    unint64_t v2 = 76210;
  }
  else if ([v3 isEqualToString:AVSpeechSynthesisVoiceIdentifierFred])
  {
    unint64_t v2 = 62140;
  }
  else if (+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:v3])
  {
    unint64_t v2 = 100000;
  }

  return v2;
}

- (void)speedButtonPressed
{
  [(AXOrator *)self->_orator currentSpeechRateForAdjustment];
  unint64_t v4 = vcvtad_u64_f64(v3 * 100000.0);
  if ([(SpeakThisUIServer *)self halfSpeakingRateAsInt] > v4
    || [(SpeakThisUIServer *)self doubleSpeakingRateAsInt] <= v4)
  {
    unint64_t v5 = [(SpeakThisUIServer *)self halfSpeakingRateAsInt];
    goto LABEL_7;
  }
  if ([(SpeakThisUIServer *)self halfSpeakingRateAsInt] <= v4
    && [(SpeakThisUIServer *)self standardSpeakingRateAsInt] > v4)
  {
    unint64_t v5 = [(SpeakThisUIServer *)self standardSpeakingRateAsInt];
LABEL_7:
    unint64_t v4 = v5;
    goto LABEL_8;
  }
  if ([(SpeakThisUIServer *)self standardSpeakingRateAsInt] <= v4
    && [(SpeakThisUIServer *)self oneAndAHalfSpeakingRateAsInt] > v4)
  {
    unint64_t v5 = [(SpeakThisUIServer *)self oneAndAHalfSpeakingRateAsInt];
    goto LABEL_7;
  }
  if ([(SpeakThisUIServer *)self oneAndAHalfSpeakingRateAsInt] <= v4
    && [(SpeakThisUIServer *)self doubleSpeakingRateAsInt] > v4)
  {
    unint64_t v5 = [(SpeakThisUIServer *)self doubleSpeakingRateAsInt];
    goto LABEL_7;
  }
LABEL_8:
  [(AXOrator *)self->_orator setSpeakingRate:(double)v4 / 100000.0];

  [(SpeakThisUIServer *)self _handleRateChangeSpeechIfNeeded:1];
}

- (void)speakUnderFingerButtonPressed
{
  [(AXOrator *)self->_orator stopSpeaking:0];
  self->_int stopType = 3;
  double v3 = +[AXSpeakFingerManager sharedInstance];
  unint64_t v4 = (char *)[v3 speakFingerState];

  unint64_t v5 = [(SpeakThisUIServer *)self eventProcessor];
  id v6 = v5;
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    [v5 endHandlingHIDEventsForReason:@"Speak under finger mode activated, need to steal all touches."];

    id v7 = +[AXSpeakFingerManager sharedInstance];
    [v7 userManuallyExitedSpeakUnderFingerMode];
  }
  else
  {
    [v5 beginHandlingHIDEventsForReason:@"Speak under finger mode activated, need to steal all touches."];

    id v7 = +[AXSpeakFingerManager sharedInstance];
    [v7 speakUnderFingerModeStarted];
  }
}

- (BOOL)isSpeaking
{
  return [(AXOrator *)self->_orator isSpeaking];
}

- (double)speakingRateAsMultiplier
{
  double v3 = [(AXOrator *)self->_orator currentVoiceIdentifier];
  [(AXOrator *)self->_orator currentSpeechRateForAdjustment];
  double v5 = round(v4 * 100000.0) / 100000.0;
  if ([v3 isEqualToString:AVSpeechSynthesisVoiceIdentifierAlex])
  {
    float v6 = 635.0;
  }
  else if ([v3 isEqualToString:AVSpeechSynthesisVoiceIdentifierVictoria])
  {
    float v6 = 410.0;
  }
  else
  {
    if (![v3 isEqualToString:AVSpeechSynthesisVoiceIdentifierFred])
    {
      if (v5 <= 0.5)
      {
        double v9 = v5 + v5;
      }
      else if (+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:v3])
      {
        double v9 = v5 + v5;
      }
      else
      {
        double v9 = (v5 + -0.5) * 6.0 + 1.0;
      }
      goto LABEL_10;
    }
    float v6 = 885.0;
  }
  float v7 = v5;
  float v8 = (float)((float)((float)(v7 + -0.5) + (float)(v7 + -0.5)) * v6) + 215.0;
  if (v5 <= 0.5) {
    float v8 = (float)((float)(1.0 - (float)((float)(0.5 - v7) + (float)(0.5 - v7))) * 115.0) + 100.0;
  }
  double v9 = (float)(v8 / 215.0);
LABEL_10:

  return v9;
}

- (void)_updateForContinuityStateChange
{
  double v3 = +[AXSpringBoardServer server];
  -[SpeakThisUIServer setIsContinuitySessionActive:](self, "setIsContinuitySessionActive:", [v3 isContinuitySessionActive]);

  double v4 = AXLogSpeakScreen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unsigned int v5 = [(SpeakThisUIServer *)self isContinuitySessionActive];
    CFStringRef v6 = @"NO";
    if (v5) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 136315394;
    float v8 = "-[SpeakThisUIServer _updateForContinuityStateChange]";
    __int16 v9 = 2112;
    CFStringRef v10 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s isContinuitySessionActive: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_didToggleSpeakScreenSetting
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DD1C;
  block[3] = &unk_28710;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_didToggleHighlightContentSetting
{
  if (_AXSQuickSpeakHighlightTextEnabled())
  {
    [(SpeakThisUIServer *)self _frontmostAppMayHaveChanged:0];
  }
  else
  {
    [(AXSpeakOverlayViewController *)self->_viewController setHighlightSelectionRects:0];
    [(AXSpeakOverlayViewController *)self->_viewController setSentenceHighlightSelectionRects:0];
    [(SpeakThisUIServer *)self _updateIsHighlightVisible];
  }
  double v3 = AXLogSpeakScreen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = _AXSQuickSpeakHighlightTextEnabled();
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Setting highlight content: %d", (uint8_t *)v4, 8u);
  }
}

- (void)_frontmostAppMayHaveChanged:(BOOL)a3
{
  if ((([(AXOrator *)self->_orator isSpeaking] & 1) != 0
     || [(AXOrator *)self->_orator isPaused])
    && _AXSQuickSpeakHighlightTextEnabled())
  {
    unsigned int v5 = [(SpeakThisUIServer *)self _systemApp];
    CFStringRef v6 = [v5 uiElement];

    [v6 updateCache:1103];
    [v6 arrayWithAXAttribute:1103];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          int v11 = *(const __AXUIElement **)(*((void *)&v17 + 1) + 8 * i);
          pid[0] = 0;
          AXUIElementGetPid(v11, pid);
          pid_t v12 = pid[0];
          unint64_t v13 = [(AXElement *)self->_currentApp uiElement];
          unsigned int v14 = [v13 pid];

          if (v12 == v14)
          {
            id v8 = &dword_0 + 1;
            goto LABEL_14;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    [(SpeakThisUIServer *)self setIsReadingFromFrontmostApp:v8];
    id v15 = AXLogSpeakScreen();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      unsigned int v16 = [(SpeakThisUIServer *)self isReadingFromFrontmostApp];
      pid[0] = 67109120;
      pid[1] = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Is reading from frontmost app: %i", (uint8_t *)pid, 8u);
    }

    if (a3 || ![(SpeakThisUIServer *)self isReadingFromFrontmostApp])
    {
      -[AXSpeakOverlayViewController setHighlightSelectionRects:](self->_viewController, "setHighlightSelectionRects:", 0, (void)v17);
      [(AXSpeakOverlayViewController *)self->_viewController setSentenceHighlightSelectionRects:0];
      [(SpeakThisUIServer *)self _updateIsHighlightVisible];
      self->_currentSentenceRange = (_NSRange)xmmword_268F0;
    }
    if (![(SpeakThisUIServer *)self isReadingFromFrontmostApp]) {
      [(SpeakThisUIServer *)self setNeedToRefreshContextIds:1];
    }
  }
}

- (void)_pageDidScroll:(id)a3
{
  id v4 = a3;
  if ([(SpeakThisUIServer *)self isWaitingForPageScroll])
  {
    if ([v4 isEqual:kAXPageScrollFailed])
    {
      unsigned int v5 = AXLogSpeakScreen();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Page scroll sent notification of failure.", buf, 2u);
      }

      [(SpeakThisUIServer *)self _finishHandlingPageScroll:0];
    }
    else
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_giveUpWaitingForPageToScroll" object:0];
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

- (void)_speakFingerStateChanged
{
  double v3 = +[AXSpeakFingerManager sharedInstance];
  id v4 = (char *)[v3 speakFingerState];

  [(AXSpeakOverlayViewController *)self->_viewController updateSpeakUnderFingerState:v4];
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    self->_int stopType = 2;
    [(SpeakThisUIServer *)self _handleSpeakingStopped];
  }
}

- (void)_updateGestureRecognizers
{
}

- (void)_addContentViewControllerForWindowScene:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SpeakThisUIServer *)self windowSceneIdentifierForWindowScene:v4];
  CFStringRef v6 = [(NSMutableDictionary *)self->_speakThisUIViewControllers objectForKeyedSubscript:v5];
  id v7 = AXLogSpeakScreen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_198EC();
  }

  if (v6)
  {
    id v8 = AXLogSpeakScreen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_19880();
    }
  }
  else
  {
    uint64_t v9 = objc_alloc_init(AXSpeakOverlayViewController);
    [(AXSpeakOverlayViewController *)v9 setDelegate:self];
    [(NSMutableDictionary *)self->_speakThisUIViewControllers setObject:v9 forKeyedSubscript:v5];
    [(AXSpeakOverlayViewController *)v9 temporarilyHideUI];
    CFStringRef v10 = +[AXUIDisplayManager sharedDisplayManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_E508;
    v11[3] = &unk_28A20;
    CFStringRef v6 = v9;
    p_super = &v6->super.super.super;
    unint64_t v13 = self;
    [v10 addContentViewController:v6 withUserInteractionEnabled:1 forService:self context:0 userInterfaceStyle:1 forWindowScene:v4 completion:v11];

    id v8 = p_super;
  }
}

- (void)_removeViewControllerForWindowScene:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SpeakThisUIServer *)self windowSceneIdentifierForWindowScene:v4];
  CFStringRef v6 = [(NSMutableDictionary *)self->_speakThisUIViewControllers objectForKeyedSubscript:v5];
  id v7 = AXLogSpeakScreen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_199BC();
  }

  if (v6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_E7BC;
    v19[3] = &unk_28A48;
    v19[4] = self;
    id v8 = v6;
    long long v20 = v8;
    id v21 = v5;
    uint64_t v9 = objc_retainBlock(v19);
    CFStringRef v10 = v9;
    if (self->_viewController == v8)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E844;
      v17[3] = &unk_287C8;
      int v11 = (id *)&v18;
      v17[4] = self;
      long long v18 = v9;
      unsigned int v14 = v9;
      [(SpeakThisUIServer *)self _updateViewControllerForWindowScene:0 completion:v17];
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E88C;
      v15[3] = &unk_28840;
      int v11 = (id *)&v16;
      unsigned int v16 = v9;
      pid_t v12 = v9;
      [(AXSpeakOverlayViewController *)v8 hideWithCompletion:v15];
    }
  }
  else
  {
    unint64_t v13 = AXLogSpeakScreen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_19954();
    }
  }
}

- (void)_updateViewControllerForWindowScene:(id)a3 completion:(id)a4
{
  id v6 = a4;
  viewController = self->_viewController;
  id v8 = a3;
  [(AXSpeakOverlayViewController *)viewController unregisterNubbit:0];
  uint64_t v9 = [(SpeakThisUIServer *)self windowSceneIdentifierForWindowScene:v8];

  [(NSMutableDictionary *)self->_speakThisUIViewControllers objectForKeyedSubscript:v9];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_EA84;
  v17[3] = &unk_28A70;
  v17[4] = self;
  CFStringRef v10 = (AXSpeakOverlayViewController *)(id)objc_claimAutoreleasedReturnValue();
  long long v18 = v10;
  int v11 = (void (**)(void))v6;
  id v19 = v11;
  pid_t v12 = objc_retainBlock(v17);
  unint64_t v13 = AXLogSpeakScreen();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_19A24();
  }

  unsigned int v14 = self->_viewController;
  if (v14)
  {
    if (!v10 || v14 == v10)
    {
      if (v11 && v10 && v14 == v10) {
        v11[2](v11);
      }
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_EC5C;
      v15[3] = &unk_28840;
      unsigned int v16 = v12;
      [(AXSpeakOverlayViewController *)v14 hideWithCompletion:v15];
    }
  }
  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
}

- (void)keyboardFocusChangedForSceneIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[AXSpringBoardServer server];
  id v6 = [v5 displayIdentifierForSceneIdentifier:v4];

  id v7 = [v6 unsignedIntegerValue];
  id v8 = [(SpeakThisUIServer *)self eventProcessor];
  id v9 = [v8 activeDisplayId];

  if (v9 != v7)
  {
    CFStringRef v10 = [(SpeakThisUIServer *)self eventProcessor];
    [v10 setActiveDisplayId:v7];

    if (![(SpeakThisUIServer *)self isSpeaking])
    {
      id v12 = [(SpeakThisUIServer *)self eventProcessor];
      int v11 = [v12 contextForDisplayID:v7];
      [(SpeakThisUIServer *)self activeDisplayChangedWithContext:v11];
    }
  }
}

- (void)activeDisplayChangedWithContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = AXLogSpeakScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_19A8C();
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(NSMutableDictionary *)self->_speakThisUIViewControllers allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [(NSMutableDictionary *)self->_speakThisUIViewControllers objectForKeyedSubscript:v11];
        id v13 = [v12 contextID];
        if (v13 == [v4 contextID])
        {
          unsigned __int8 v14 = [v11 isEqualToString:@"MAIN-DISPLAY"];
          if (v14)
          {
            id v15 = 0;
          }
          else
          {
            id v8 = [v12 view];
            id v13 = [v8 window];
            id v15 = [v13 windowScene];
          }
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_EFB0;
          v16[3] = &unk_28710;
          v16[4] = self;
          [(SpeakThisUIServer *)self _updateViewControllerForWindowScene:v15 completion:v16];
          if ((v14 & 1) == 0)
          {
          }
          goto LABEL_18;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (id)_windowSceneForActiveDisplay
{
  double v3 = [(SpeakThisUIServer *)self eventProcessor];
  unsigned int v4 = [v3 contextIdForActiveDisplay];

  if (v4 == -1)
  {
    id v12 = 0;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unsigned int v5 = [(NSMutableDictionary *)self->_speakThisUIViewControllers allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          CFStringRef v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          int v11 = [(NSMutableDictionary *)self->_speakThisUIViewControllers objectForKeyedSubscript:v10];
          if ([v11 contextID] == v4)
          {
            if ([v10 isEqualToString:@"MAIN-DISPLAY"])
            {
              id v12 = 0;
            }
            else
            {
              id v13 = [v11 view];
              unsigned __int8 v14 = [v13 window];
              id v12 = [v14 windowScene];
            }
            goto LABEL_16;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_16:
  }

  return v12;
}

- (id)windowSceneIdentifierForWindowScene:(id)a3
{
  if (a3)
  {
    unsigned int v4 = [a3 _sceneIdentifier];
  }
  else
  {
    unsigned int v4 = @"MAIN-DISPLAY";
  }
  return v4;
}

- (id)mainDisplayWindow
{
  unint64_t v2 = [(NSMutableDictionary *)self->_speakThisUIViewControllers objectForKeyedSubscript:@"MAIN-DISPLAY"];
  uint64_t v3 = [v2 view];
  unsigned int v4 = [v3 window];

  return v4;
}

- (void)externalDisplaySceneConnected:(id)a3
{
  id v4 = a3;
  unsigned int v5 = AXLogSpeakScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_19AC0();
  }

  [(NSMutableSet *)self->_externalScenes addObject:v4];
  id v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 showSpeechController];

  if (v7) {
    [(SpeakThisUIServer *)self _addContentViewControllerForWindowScene:v4];
  }
}

- (void)externalDisplaySceneDisconnected:(id)a3
{
  id v4 = a3;
  unsigned int v5 = AXLogSpeakScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_19AF4();
  }

  [(NSMutableSet *)self->_externalScenes removeObject:v4];
  id v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 showSpeechController];

  if (v7) {
    [(SpeakThisUIServer *)self _removeViewControllerForWindowScene:v4];
  }
}

- (void)speakElementAtPoint:(CGPoint)a3 withEventProcessor:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = +[AXSpeakFingerManager sharedInstance];
  objc_msgSend(v6, "speakElementAtLocation:", x, y);
}

- (void)exitSpeakFingerModeWithEventProcessor:(id)a3
{
  id v4 = +[AXSpeakFingerManager sharedInstance];
  [v4 fingerWasLiftedInSpeakUnderFingerMode];

  id v5 = [(SpeakThisUIServer *)self eventProcessor];
  [v5 endHandlingHIDEventsForReason:@"Speak under finger mode activated, need to steal all touches."];
}

- (BOOL)isInSpeakUnderFingerModeWithEventProcessor:(id)a3
{
  uint64_t v3 = +[AXSpeakFingerManager sharedInstance];
  if ([v3 speakFingerState] == (char *)&dword_0 + 1)
  {
    char v4 = 1;
  }
  else
  {
    id v5 = +[AXSpeakFingerManager sharedInstance];
    char v4 = [v5 speakFingerState] == &dword_4;
  }
  return v4;
}

- (CGRect)speakThisUIFrameWithEventProcessor:(id)a3
{
  [(AXSpeakOverlayViewController *)self->_viewController overlayFrame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (NSArray)speakingRangeAndElements
{
  return self->_speakingRangeAndElements;
}

- (void)setSpeakingRangeAndElements:(id)a3
{
}

- (NSString)springBoardActionHandlerId
{
  return self->_springBoardActionHandlerId;
}

- (void)setSpringBoardActionHandlerId:(id)a3
{
}

- (__AXObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(__AXObserver *)a3
{
}

- (SpeakThisEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (SpeakThisUIStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (BOOL)isReadingFromFrontmostApp
{
  return self->_isReadingFromFrontmostApp;
}

- (void)setIsReadingFromFrontmostApp:(BOOL)a3
{
  self->_isReadingFromFrontmostApp = a3;
}

- (BOOL)needToRefreshContextIds
{
  return self->_needToRefreshContextIds;
}

- (void)setNeedToRefreshContextIds:(BOOL)a3
{
  self->_needToRefreshContextIds = a3;
}

- (BOOL)isPausingAssistiveTechnology
{
  return self->_isPausingAssistiveTechnology;
}

- (void)setIsPausingAssistiveTechnology:(BOOL)a3
{
  self->_isPausingAssistiveTechnologdouble y = a3;
}

- (BOOL)isFetchingContent
{
  return self->_isFetchingContent;
}

- (void)setIsFetchingContent:(BOOL)a3
{
  self->_isFetchingContent = a3;
}

- (BOOL)isWaitingForPageScroll
{
  return self->_isWaitingForPageScroll;
}

- (void)setIsWaitingForPageScroll:(BOOL)a3
{
  self->_isWaitingForPageScroll = a3;
}

- (id)readNextPageCompletion
{
  return self->_readNextPageCompletion;
}

- (void)setReadNextPageCompletion:(id)a3
{
}

- (NSMutableArray)assertionsForStayingAlive
{
  return self->_assertionsForStayingAlive;
}

- (void)setAssertionsForStayingAlive:(id)a3
{
}

- (NSMutableArray)assertionsForFetchingContent
{
  return self->_assertionsForFetchingContent;
}

- (void)setAssertionsForFetchingContent:(id)a3
{
}

- (NSMutableArray)sentenceRanges
{
  return self->_sentenceRanges;
}

- (void)setSentenceRanges:(id)a3
{
}

- (_NSRange)currentSentenceRange
{
  NSUInteger length = self->_currentSentenceRange.length;
  NSUInteger location = self->_currentSentenceRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCurrentSentenceRange:(_NSRange)a3
{
  self->_currentSentenceRange = a3;
}

- (AXUIElement)currentSentenceElement
{
  return self->_currentSentenceElement;
}

- (void)setCurrentSentenceElement:(id)a3
{
}

- (AXSpeakingRange)currentSpeakingRange
{
  return self->_currentSpeakingRange;
}

- (void)setCurrentSpeakingRange:(id)a3
{
}

- (_NSRange)currentWordRange
{
  NSUInteger length = self->_currentWordRange.length;
  NSUInteger location = self->_currentWordRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCurrentWordRange:(_NSRange)a3
{
  self->_currentWordRange = a3;
}

- (NSString)currentContent
{
  return self->_currentContent;
}

- (void)setCurrentContent:(id)a3
{
}

- (BOOL)lockButtonPressedSinceReadAllStart
{
  return self->_lockButtonPressedSinceReadAllStart;
}

- (void)setLockButtonPressedSinceReadAllStart:(BOOL)a3
{
  self->_lockButtonPressedSinceReadAllStart = a3;
}

- (BOOL)waitingForNewReadAll
{
  return self->_waitingForNewReadAll;
}

- (void)setWaitingForNewReadAll:(BOOL)a3
{
  self->_waitingForNewReadAll = a3;
}

- (BOOL)forceRectsToScroll
{
  return self->_forceRectsToScroll;
}

- (void)setForceRectsToScroll:(BOOL)a3
{
  self->_forceRectsToScroll = a3;
}

- (BOOL)activeWebContentIsHidden
{
  return self->_activeWebContentIsHidden;
}

- (void)setActiveWebContentIsHidden:(BOOL)a3
{
  self->_activeWebContentIsHidden = a3;
}

- (AXFocusManager)focusManager
{
  return self->_focusManager;
}

- (void)setFocusManager:(id)a3
{
}

- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer
{
  return self->_updateElementVisualsCoalescer;
}

- (void)setUpdateElementVisualsCoalescer:(id)a3
{
}

- (BOOL)cachedIsHighlightVisible
{
  return self->_cachedIsHighlightVisible;
}

- (void)setCachedIsHighlightVisible:(BOOL)a3
{
  self->_cachedIsHighlightVisible = a3;
}

- (NSString)rootElementAccessibilityIdentifier
{
  return self->_rootElementAccessibilityIdentifier;
}

- (void)setRootElementAccessibilityIdentifier:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (BOOL)isContinuitySessionActive
{
  return self->_isContinuitySessionActive;
}

- (void)setIsContinuitySessionActive:(BOOL)a3
{
  self->_isContinuitySessionActive = a3;
}

- (BSInvalidatable)hitTestCategoryAssertion
{
  return self->_hitTestCategoryAssertion;
}

- (void)setHitTestCategoryAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestCategoryAssertion, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_rootElementAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_updateElementVisualsCoalescer, 0);
  objc_storeStrong((id *)&self->_focusManager, 0);
  objc_storeStrong((id *)&self->_currentContent, 0);
  objc_storeStrong((id *)&self->_currentSpeakingRange, 0);
  objc_storeStrong((id *)&self->_currentSentenceElement, 0);
  objc_storeStrong((id *)&self->_sentenceRanges, 0);
  objc_storeStrong((id *)&self->_assertionsForFetchingContent, 0);
  objc_storeStrong((id *)&self->_assertionsForStayingAlive, 0);
  objc_storeStrong(&self->_readNextPageCompletion, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_springBoardActionHandlerId, 0);
  objc_storeStrong((id *)&self->_speakingRangeAndElements, 0);
  objc_storeStrong((id *)&self->_speakThisUIViewControllers, 0);
  objc_storeStrong((id *)&self->_externalScenes, 0);
  objc_storeStrong((id *)&self->_speakScreenListenersUpdateQueue, 0);
  objc_storeStrong((id *)&self->_suspendedSpeakScreenListeners, 0);
  objc_storeStrong((id *)&self->_speakScreenListeners, 0);
  objc_storeStrong((id *)&self->_fetchDispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentPageTurnElement, 0);
  objc_storeStrong((id *)&self->_currentElementForFetchingRemoteParent, 0);
  objc_storeStrong((id *)&self->_currentElementForFetching, 0);
  objc_storeStrong((id *)&self->_savedOpaqueParentForFetching, 0);
  objc_storeStrong((id *)&self->_currentApp, 0);
  objc_storeStrong((id *)&self->_systemApp, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_orator, 0);
}

@end
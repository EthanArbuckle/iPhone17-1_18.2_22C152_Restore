@interface VOTBrailleGestureManager
- (AXDispatchTimer)brailleTypingPropertiesAnnouncementTimer;
- (AXDispatchTimer)initialOrientationTimer;
- (AXDispatchTimer)lockScreenDimmingTimer;
- (AXDispatchTimer)logBSIUsageTimer;
- (AXDispatchTimer)speakingDelayTimer;
- (AXDispatchTimer)warningTonesTimer;
- (BOOL)_canUseContractedBraille;
- (BOOL)_handleAdjustTextSegmentTypeEvent:(id)a3;
- (BOOL)_handleAllFingersLifted;
- (BOOL)_handleCarriageReturnSwipe;
- (BOOL)_handleWordBreak:(id)a3 includeSpace:(BOOL)a4;
- (BOOL)_hasContractedBraillePreference;
- (BOOL)_isAdjustTextSegmentEvent:(id)a3;
- (BOOL)_isAdjustTextSegmentTypeEvent:(id)a3;
- (BOOL)_isCalibrationEndPattern:(id)a3;
- (BOOL)_isCalibrationStartPattern:(id)a3;
- (BOOL)_isCarriageReturnSwipeEvent:(id)a3;
- (BOOL)_isNextBrailleUsageEvent:(id)a3;
- (BOOL)_isPreviousBrailleUsageEvent:(id)a3;
- (BOOL)_isSelectEvent:(id)a3;
- (BOOL)_isToggleLockedConfigurationEvent:(id)a3;
- (BOOL)_isTranslateImmediatelyEvent:(id)a3;
- (BOOL)_patternIncludesEveryFinger:(id)a3;
- (BOOL)_requiresCandidateSelection;
- (BOOL)_requiresLaTeXInput;
- (BOOL)_shouldReverseDots;
- (BOOL)_shouldUseContractedBraille;
- (BOOL)_shouldUseEightDotBraille;
- (BOOL)allowsElementMovement;
- (BOOL)didAnnounceBrailleTypingProperties;
- (BOOL)didAnnounceExplorationMode;
- (BOOL)didEnterInvalidGesture;
- (BOOL)didMoveFingersTooFarForInput;
- (BOOL)didStartFullGesture;
- (BOOL)gesturesControlRotor;
- (BOOL)isBackspaceEvent:(id)a3;
- (BOOL)isExploring;
- (BOOL)isNextBrailleTableEvent:(id)a3;
- (BOOL)isNextKeyboardLanguageEvent:(id)a3;
- (BOOL)isNextSuggestionEvent:(id)a3;
- (BOOL)isPreviousSuggestionEvent:(id)a3;
- (BOOL)isReturnKeyEvent:(id)a3;
- (BOOL)isSelectItemEvent:(id)a3;
- (BOOL)isSpaceEvent:(id)a3;
- (BOOL)isSplitting;
- (BOOL)isWordBackspaceEvent:(id)a3;
- (BOOL)overridePrintBrailleWithAllSixDots;
- (BOOL)performCustomBackspace;
- (BOOL)performCustomWordBackspace;
- (BOOL)performNextBrailleTableCommand;
- (BOOL)performNextKeyboardLanguage;
- (BOOL)processEvent:(id)a3;
- (BOOL)processTapWithFingerCount:(unint64_t)a3;
- (BOOL)processTouchLocations:(id)a3 isFirstTouch:(BOOL)a4 isCancelTouch:(BOOL)a5;
- (BOOL)shouldAllowRotorEvents;
- (BOOL)shouldBeDeactivatedByEscape;
- (BOOL)shouldUpdateDotPositions;
- (BOOL)usesHapticFeedback;
- (BOOL)usesTypingSoundFeedback;
- (BOOL)wantsToStayActive;
- (BSInvalidatable)disableIdleTimerAssertion;
- (NSArray)calibrationStartTouchPoints;
- (NSDictionary)commands;
- (NSDictionary)lastTouchLocationsByIdentifier;
- (NSString)lastPrintBrailleCharacter;
- (VOTBrailleGestureManager)init;
- (VOTBrailleGestureManagerDelegate)brailleGestureManagerDelegate;
- (VOTTextMovementManager)movementManager;
- (id)_languageCodeForBrailleTable;
- (id)_languageCodeForSpeakingAndBrailleTranslation;
- (id)_languageCodeForSpellChecking;
- (id)_newBrailleInput;
- (id)_outputRequestForText:(id)a3 hint:(id)a4 useKeyboardLanguage:(BOOL)a5 shouldQueue:(BOOL)a6 isInsert:(BOOL)a7 isSuggestion:(BOOL)a8 isDelete:(BOOL)a9 speakLiterally:(BOOL)a10 otherLanguage:(id)a11;
- (id)_printBrailleForTouchPoints:(id)a3;
- (id)_spokenStringForPrintBraille:(id)a3;
- (id)_spokenStringForPrintBraille:(id)a3 useLongForm:(BOOL)a4;
- (id)_stringWithFirstPart:(id)a3 secondPart:(id)a4;
- (id)_touchLocationsByFilteringOutEdges:(id)a3;
- (id)_touchPointsForCalibrationGivenFirstPoints:(id)a3 lastPoints:(id)a4;
- (id)hintForAppLaunch;
- (id)hintForItemChooser;
- (id)nameSearcherEntriesPassingSearchFrom:(id)a3;
- (id)outputForLatestInput;
- (int64_t)keyboardOrientation;
- (int64_t)typingMode;
- (int64_t)usage;
- (int64_t)valueChangeOriginator;
- (unint64_t)_numberOfDots;
- (unint64_t)mode;
- (unint64_t)translationOverride;
- (void)_announceBrailleTypingPropertiesIncludingOrientation:(BOOL)a3 typingMode:(BOOL)a4 forUnlockConfiguration:(BOOL)a5;
- (void)_announceRespectingSoundSettingsRequest:(id)a3 event:(id)a4;
- (void)_announceRespectingSoundSettingsRequest:(id)a3 event:(id)a4 hint:(id)a5;
- (void)_appendOrientationToAnnouncement:(id)a3;
- (void)_applyCandidateInDirection:(int64_t)a3;
- (void)_applyNextCandidate;
- (void)_applyPreviousCandidate;
- (void)_applySuggestionToElement:(id)a3 direction:(int64_t)a4;
- (void)_beginExploringDotPatterns;
- (void)_calibrateWithTouchPoints:(id)a3;
- (void)_cancelWarningTones;
- (void)_cleanUpTouchesIncludingCalibrationStartPoints:(BOOL)a3;
- (void)_commitBufferedBraille;
- (void)_endExploringDotPatterns;
- (void)_enumerateDotNumbersForPrintBraille:(id)a3 usingBlock:(id)a4;
- (void)_flashInsertedTextIfAllowed:(id)a3;
- (void)_handleCalibrationTimeout;
- (void)_handleChangeUsage:(BOOL)a3;
- (void)_handleFingersOnScreen:(id)a3 didAddOrRemoveFingers:(BOOL)a4;
- (void)_handlePrintBraille:(id)a3;
- (void)_handleTouchPoints:(id)a3;
- (void)_handleTranslateImmediately;
- (void)_inputBrailleFromSeriesOfTouchPoints:(id)a3;
- (void)_inputBrailleFromTouchPoints:(id)a3;
- (void)_insertCurrentSelectedCandidate;
- (void)_insertCurrentSelectedSuggestion:(id)a3;
- (void)_issueCommands:(id)a3;
- (void)_issueSingleCommand:(id)a3;
- (void)_outputChosenCandidate:(id)a3;
- (void)_outputChosenSuggestion:(id)a3;
- (void)_playBonk;
- (void)_playWarningTone;
- (void)_playWarningTones:(unint64_t)a3 completion:(id)a4;
- (void)_replaceRotorEventWithTextMovementEvent:(id)a3;
- (void)_scheduleExploringModeIfNeeded;
- (void)_speakPrintBrailleForExploration;
- (void)_speakText:(id)a3 hint:(id)a4;
- (void)_speakText:(id)a3 hint:(id)a4 useKeyboardLanguage:(BOOL)a5 shouldQueue:(BOOL)a6 isInsert:(BOOL)a7 isSuggestion:(BOOL)a8 isDelete:(BOOL)a9 speakLiterally:(BOOL)a10 otherLanguage:(id)a11;
- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4;
- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4 shouldQueue:(BOOL)a5;
- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4 shouldQueue:(BOOL)a5 isInsert:(BOOL)a6 isDelete:(BOOL)a7 speakLiterally:(BOOL)a8;
- (void)_typePrintBraille:(id)a3;
- (void)_updateBrailleTypingPropertiesAndDelayAnnouncement:(BOOL)a3;
- (void)_updateBrailleTypingPropertiesAndDelayAnnouncement:(BOOL)a3 forUnlockConfiguration:(BOOL)a4;
- (void)_updateBrailleUI;
- (void)_updateDotNumberCirclesForPrintBraille:(id)a3;
- (void)_updateDotPositions;
- (void)_updateShouldUseContractedBraille;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)applyNextSuggestionToElement:(id)a3;
- (void)applyPreviousSuggestionToElement:(id)a3;
- (void)clearCurrentString;
- (void)dealloc;
- (void)didInputBackspace;
- (void)didInputWordBackspace;
- (void)didSelectItem;
- (void)eventFactoryDidBeginSplitGesture:(id)a3;
- (void)handleBrailleGestureWithLeftPatternDictionary:(id)a3 rightPatternDictionary:(id)a4;
- (void)inputSpaceForElement:(id)a3;
- (void)pressReturnKeyForElement:(id)a3;
- (void)sendCarriageReturnForElement:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 usage:(int64_t)a4;
- (void)setBrailleGestureManagerDelegate:(id)a3;
- (void)setBrailleTypingPropertiesAnnouncementTimer:(id)a3;
- (void)setCalibrationStartTouchPoints:(id)a3;
- (void)setCommands:(id)a3;
- (void)setDidAnnounceBrailleTypingProperties:(BOOL)a3;
- (void)setDidAnnounceExplorationMode:(BOOL)a3;
- (void)setDidEnterInvalidGesture:(BOOL)a3;
- (void)setDidMoveFingersTooFarForInput:(BOOL)a3;
- (void)setDidStartFullGesture:(BOOL)a3;
- (void)setDisableIdleTimerAssertion:(id)a3;
- (void)setExploring:(BOOL)a3;
- (void)setInitialOrientationTimer:(id)a3;
- (void)setKeyboardOrientation:(int64_t)a3;
- (void)setLastPrintBrailleCharacter:(id)a3;
- (void)setLastTouchLocationsByIdentifier:(id)a3;
- (void)setLockScreenDimmingTimer:(id)a3;
- (void)setLogBSIUsageTimer:(id)a3;
- (void)setMovementManager:(id)a3;
- (void)setOverridePrintBrailleWithAllSixDots:(BOOL)a3;
- (void)setShouldUpdateDotPositions:(BOOL)a3;
- (void)setSpeakingDelayTimer:(id)a3;
- (void)setSplitting:(BOOL)a3;
- (void)setTranslationOverride:(unint64_t)a3;
- (void)setTypingMode:(int64_t)a3;
- (void)setUsage:(int64_t)a3;
- (void)setUsage:(int64_t)a3 userInitiated:(BOOL)a4;
- (void)setUsesHapticFeedback:(BOOL)a3;
- (void)setUsesTypingSoundFeedback:(BOOL)a3;
- (void)setWarningTonesTimer:(id)a3;
- (void)updateWithString:(id)a3;
@end

@implementation VOTBrailleGestureManager

- (VOTBrailleGestureManager)init
{
  v38.receiver = self;
  v38.super_class = (Class)VOTBrailleGestureManager;
  v2 = [(VOTGesturedTextInputManager *)&v38 init];
  if (v2)
  {
    v3 = objc_alloc_init(VOTBrailleGestureTranslator);
    gestureTranslator = v2->_gestureTranslator;
    v2->_gestureTranslator = v3;

    [(VOTBrailleGestureTranslator *)v2->_gestureTranslator setDelegate:v2];
    v5 = objc_alloc_init(VOTBrailleGestureSpellingSuggestionHandler);
    spellingSuggestionHandler = v2->_spellingSuggestionHandler;
    v2->_spellingSuggestionHandler = v5;

    v7 = objc_alloc_init(VOTBrailleGestureCandidateManager);
    candidateManager = v2->_candidateManager;
    v2->_candidateManager = v7;

    v9 = (BKSAccelerometer *)objc_alloc_init((Class)BKSAccelerometer);
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = v9;

    [(BKSAccelerometer *)v2->_accelerometer setDelegate:v2];
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    allTouchLocationsByIdentifier = v2->_allTouchLocationsByIdentifier;
    v2->_allTouchLocationsByIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    firstTouchLocationsByIdentifier = v2->_firstTouchLocationsByIdentifier;
    v2->_firstTouchLocationsByIdentifier = v13;

    v15 = (AXDispatchTimer *)objc_alloc_init((Class)AXDispatchTimer);
    logBSIUsageTimer = v2->_logBSIUsageTimer;
    v2->_logBSIUsageTimer = v15;

    v17 = (AXDispatchTimer *)objc_alloc_init((Class)AXDispatchTimer);
    initialOrientationTimer = v2->_initialOrientationTimer;
    v2->_initialOrientationTimer = v17;

    v19 = [[VOTTextMovementManager alloc] initWithSegments:&off_1001C7088];
    movementManager = v2->_movementManager;
    v2->_movementManager = v19;

    v21 = +[NSBundle mainBundle];
    v22 = [v21 pathForResource:@"VOTBrailleGestureCommands" ofType:@"plist"];

    uint64_t v23 = +[NSDictionary dictionaryWithContentsOfFile:v22];
    commands = v2->_commands;
    v2->_commands = (NSDictionary *)v23;

    v25 = +[AXSettings sharedInstance];
    v2->_usesTypingSoundFeedback = [v25 voiceOverTouchBrailleGesturesUsesTypingSoundFeedback];

    v26 = +[AXSettings sharedInstance];
    v2->_usesHapticFeedback = [v26 voiceOverTouchBrailleGesturesUsesHapticFeedback];

    objc_initWeak(&location, v2);
    v27 = +[AXSettings sharedInstance];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000F5DDC;
    v35[3] = &unk_1001B35A8;
    objc_copyWeak(&v36, &location);
    [v27 registerUpdateBlock:v35 forRetrieveSelector:"voiceOverTouchBrailleShouldReverseDots" withListener:v2];

    objc_destroyWeak(&v36);
    v28 = +[AXSettings sharedInstance];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000F5E1C;
    v33[3] = &unk_1001B35A8;
    objc_copyWeak(&v34, &location);
    [v28 registerUpdateBlock:v33 forRetrieveSelector:"voiceOverTouchBrailleGesturesUsesTypingSoundFeedback" withListener:v2];

    objc_destroyWeak(&v34);
    v29 = +[AXSettings sharedInstance];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000F5E8C;
    v31[3] = &unk_1001B35A8;
    objc_copyWeak(&v32, &location);
    [v29 registerUpdateBlock:v31 forRetrieveSelector:"voiceOverTouchBrailleGesturesUsesHapticFeedback" withListener:v2];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(BKSAccelerometer *)self->_accelerometer setDelegate:0];
  [(BSInvalidatable *)self->_disableIdleTimerAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VOTBrailleGestureManager;
  [(VOTBrailleGestureManager *)&v3 dealloc];
}

- (void)setActive:(BOOL)a3
{
}

- (void)setActive:(BOOL)a3 usage:(int64_t)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(VOTGesturedTextInputManager *)self isActive];
  v37.receiver = self;
  v37.super_class = (Class)VOTBrailleGestureManager;
  [(VOTGesturedTextInputManager *)&v37 setActive:v5];
  [(VOTBrailleGestureTranslator *)self->_gestureTranslator setActive:v5];
  int64_t v8 = [(VOTBrailleGestureManager *)self usage];
  _AXSBrailleScreenInputSetEnabled();
  if (v5 && (v7 & 1) == 0)
  {
    self->_usage = a4;
    [(VOTBrailleGestureManager *)self setDidStartFullGesture:0];
    [(VOTBrailleGestureManager *)self setDidAnnounceBrailleTypingProperties:0];
    [(BKSAccelerometer *)self->_accelerometer setPassiveOrientationEvents:0];
    [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:1];
    [(VOTBrailleGestureManager *)self _updateShouldUseContractedBraille];
    [(VOTBrailleGestureManager *)self _updateBrailleTypingPropertiesAndDelayAnnouncement:1];
    v9 = +[VOTElement systemAppApplication];
    [v9 setRotationCapabilityEnabled:0];

    v10 = +[VOTDisplayManager displayManager];
    int64_t v11 = [(VOTBrailleGestureManager *)self keyboardOrientation];
    v12 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator dotNumberPositions];
    objc_msgSend(v10, "showBrailleUIWithOrientation:dotPositions:typingMode:", v11, v12, -[VOTBrailleGestureManager typingMode](self, "typingMode"));

    v13 = [(VOTBrailleGestureManager *)self disableIdleTimerAssertion];

    if (!v13)
    {
      v14 = +[AXUserEventTimer sharedInstance];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = [v14 acquireAssertionToDisableIdleTimerWithReason:v16];
      [(VOTBrailleGestureManager *)self setDisableIdleTimerAssertion:v17];
    }
    v18 = [(VOTBrailleGestureManager *)self lockScreenDimmingTimer];

    if (!v18)
    {
      id v19 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
      [(VOTBrailleGestureManager *)self setLockScreenDimmingTimer:v19];

      v20 = [(VOTBrailleGestureManager *)self lockScreenDimmingTimer];
      [v20 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    }
    v21 = [(VOTBrailleGestureManager *)self lockScreenDimmingTimer];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000F64FC;
    v36[3] = &unk_1001B33B8;
    v36[4] = self;
    [v21 afterDelay:v36 processBlock:30.0];

    v22 = [(VOTBrailleGestureManager *)self logBSIUsageTimer];
    [v22 afterDelay:&stru_1001B6BE8 processBlock:0 cancelBlock:15.0];

    uint64_t v23 = [(VOTBrailleGestureManager *)self movementManager];
    [v23 setSegment:1];

    v24 = [(VOTBrailleGestureManager *)self initialOrientationTimer];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000F65A0;
    v35[3] = &unk_1001B33B8;
    void v35[4] = self;
    [v24 afterDelay:v35 processBlock:0.1];

    if (a4 == 1)
    {
      v25 = sub_100051804(off_1001EA9E8, @"entering.bsi.in.command.mode", 0);
      uint64_t v26 = +[VOSOutputEvent BSIDidEnableCommand];
    }
    else
    {
      if (a4) {
        return;
      }
      v25 = sub_100051804(off_1001EA9E8, @"entering.bsi", 0);
      uint64_t v26 = +[VOSOutputEvent BSIDidEnableTyping];
    }
    goto LABEL_17;
  }
  if (!v5 && ((v7 ^ 1) & 1) == 0)
  {
    v27 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
    [(VOTBrailleGestureManager *)self updateWithString:v27];

    [(VOTBrailleGestureManager *)self clearCurrentString];
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_handleCalibrationTimeout" object:0];
    [(VOTBrailleGestureManager *)self _cleanUpTouchesIncludingCalibrationStartPoints:1];
    [(BKSAccelerometer *)self->_accelerometer setPassiveOrientationEvents:1];
    [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:0];
    [(VOTBrailleGestureManager *)self _updateBrailleTypingPropertiesAndDelayAnnouncement:0];
    v28 = +[VOTDisplayManager displayManager];
    [v28 hideBrailleUI];

    [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
    [(VOTBrailleGestureCandidateManager *)self->_candidateManager deactivate];
    [(VOTBrailleGestureTranslator *)self->_gestureTranslator savePersistentGestureData];
    v29 = +[VOTElement systemAppApplication];
    [v29 setRotationCapabilityEnabled:1];

    v30 = [(VOTBrailleGestureManager *)self disableIdleTimerAssertion];
    [v30 invalidate];

    [(VOTBrailleGestureManager *)self setDisableIdleTimerAssertion:0];
    v31 = [(VOTBrailleGestureManager *)self lockScreenDimmingTimer];
    [v31 cancel];

    id v32 = [(VOTBrailleGestureManager *)self logBSIUsageTimer];
    [v32 cancel];

    v33 = [(VOTBrailleGestureManager *)self initialOrientationTimer];
    [v33 cancel];

    v25 = sub_100051804(off_1001EA9E8, @"stopping.bsi", 0);
    uint64_t v26 = +[VOSOutputEvent BSIDidDisable];
LABEL_17:
    id v34 = (void *)v26;
    [(VOTBrailleGestureManager *)self _announceRespectingSoundSettingsRequest:v25 event:v26];

    return;
  }
  if (v5 && v8 != a4) {
    [(VOTBrailleGestureManager *)self setUsage:a4];
  }
}

- (BOOL)wantsToStayActive
{
  LODWORD(v3) = [(VOTGesturedTextInputManager *)self isActive];
  if (v3)
  {
    int64_t v3 = [(VOTBrailleGestureManager *)self usage];
    if (v3 != 1)
    {
      v4 = +[AXSettings sharedInstance];
      unsigned __int8 v5 = [v4 voiceOverTouchBrailleGestureControl];

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)allowsElementMovement
{
  int64_t v3 = [(id)VOTSharedWorkspace currentElement];
  [v3 updateGesturedTextInputAttributes];
  if ([(VOTGesturedTextInputManager *)self isActive] && ![(VOTBrailleGestureManager *)self usage])
  {
    unsigned __int8 v5 = [v3 gesturedTextInputAttributes];
    unsigned int v4 = [v5 acceptsRawInput] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)shouldBeDeactivatedByEscape
{
  return ![(VOTGesturedTextInputManager *)self isActive]
      || [(VOTBrailleGestureManager *)self usage] == 0;
}

- (void)setUsage:(int64_t)a3
{
}

- (void)setUsage:(int64_t)a3 userInitiated:(BOOL)a4
{
  if ([(VOTGesturedTextInputManager *)self isActive])
  {
    int64_t usage = self->_usage;
    self->_int64_t usage = a3;
    if (usage != a3)
    {
      if (!usage) {
        [(VOTBrailleGestureManager *)self _commitBufferedBraille];
      }
      if (a3 == 1)
      {
        sub_100051804(off_1001EA9E8, @"bsi.command.mode", 0);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        unsigned int v7 = +[VOSOutputEvent BSIDidEnableCommand];
        int64_t v8 = sub_100051804(off_1001EA9E8, @"bsi.command.mode.hint", 0);
        [(VOTBrailleGestureManager *)self _announceRespectingSoundSettingsRequest:v9 event:v7 hint:v8];
      }
      else
      {
        if (a3) {
          return;
        }
        sub_100051804(off_1001EA9E8, @"bsi.braille.entry", 0);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        unsigned int v7 = +[VOSOutputEvent BSIDidEnableTyping];
        [(VOTBrailleGestureManager *)self _announceRespectingSoundSettingsRequest:v9 event:v7];
      }
    }
  }
}

- (void)clearCurrentString
{
  v3.receiver = self;
  v3.super_class = (Class)VOTBrailleGestureManager;
  [(VOTGesturedTextInputManager *)&v3 clearCurrentString];
  [(VOTBrailleGestureTranslator *)self->_gestureTranslator clearBrailleBuffer];
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self gesturesControlRotor])
  {
    unsigned __int8 v5 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
    unsigned int v6 = [v5 acceptsRawInput];

    if (v6) {
      [(VOTBrailleGestureManager *)self _replaceRotorEventWithTextMovementEvent:v4];
    }
  }
  if ([(VOTBrailleGestureManager *)self _isNextBrailleUsageEvent:v4])
  {
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_1000F6CA0;
    v31 = &unk_1001B33B8;
    id v32 = self;
LABEL_10:
    AXPerformBlockOnMainThread();
LABEL_11:
    BOOL v7 = 1;
    goto LABEL_12;
  }
  if ([(VOTBrailleGestureManager *)self _isPreviousBrailleUsageEvent:v4])
  {
    uint64_t v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_1000F6CAC;
    uint64_t v26 = &unk_1001B33B8;
    v27 = self;
    goto LABEL_10;
  }
  if ([(VOTBrailleGestureManager *)self _isTranslateImmediatelyEvent:v4])
  {
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_1000F6CB8;
    v21 = &unk_1001B33B8;
    v22 = self;
    goto LABEL_10;
  }
  if ([(VOTBrailleGestureManager *)self _isCarriageReturnSwipeEvent:v4])
  {
    if ([(VOTBrailleGestureManager *)self _handleCarriageReturnSwipe]) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
  if ([(VOTBrailleGestureManager *)self _isToggleLockedConfigurationEvent:v4])
  {
    id v9 = +[AXSettings sharedInstance];
    if ([v9 voiceOverTouchBrailleGesturesShouldUseLockedConfiguration])
    {
      [v9 setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:0];
      [(VOTBrailleGestureManager *)self _updateBrailleTypingPropertiesAndDelayAnnouncement:0 forUnlockConfiguration:1];
      [(VOTBrailleGestureManager *)self _updateBrailleUI];
    }
    else
    {
      v15 = sub_100051804(off_1001EA9E8, @"braille.locked.configuration", 0);
      [(VOTBrailleGestureManager *)self _speakText:v15 useKeyboardLanguage:0];

      objc_msgSend(v9, "setVoiceOverTouchBrailleGesturesLockedOrientation:", -[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation"));
      objc_msgSend(v9, "setVoiceOverTouchBrailleGesturesLockedTypingMode:", -[VOTBrailleGestureManager typingMode](self, "typingMode"));
      [v9 setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:1];
    }

    goto LABEL_11;
  }
  if ([(VOTBrailleGestureManager *)self _isAdjustTextSegmentEvent:v4]
    || [(VOTBrailleGestureManager *)self _isSelectEvent:v4])
  {
    v10 = VOTLogEvent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [v4 command];
      v12 = [(VOTBrailleGestureManager *)self movementManager];
      *(_DWORD *)buf = 138412546;
      id v34 = v11;
      __int16 v35 = 1024;
      unsigned int v36 = [v12 segment];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Passing up %@ event with segment:%d.", buf, 0x12u);
    }
    v13 = [(VOTBrailleGestureManager *)self movementManager];
    v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 segment]);
    [v4 setObject:v14 forIndex:118];

    [(VOTBrailleGestureManager *)self setSplitting:1];
    [(VOTBrailleGestureManager *)self _endExploringDotPatterns];
    goto LABEL_24;
  }
  if (![(VOTBrailleGestureManager *)self _isAdjustTextSegmentTypeEvent:v4]
    || (v16 = [(VOTBrailleGestureManager *)self _handleAdjustTextSegmentTypeEvent:v4], BOOL v7 = 1, [(VOTBrailleGestureManager *)self setSplitting:1], [(VOTBrailleGestureManager *)self _endExploringDotPatterns], (v16 & 1) == 0))
  {
LABEL_24:
    v17.receiver = self;
    v17.super_class = (Class)VOTBrailleGestureManager;
    BOOL v7 = [(VOTGesturedTextInputManager *)&v17 processEvent:v4];
  }
LABEL_12:

  return v7;
}

- (void)_replaceRotorEventWithTextMovementEvent:(id)a3
{
  id v6 = a3;
  if (-[VOTBrailleGestureManager isRotorLeftEvent:](self, "isRotorLeftEvent:"))
  {
    id v4 = v6;
    unsigned __int8 v5 = &kVOTEventCommandNextTextSegmentType;
  }
  else if ([(VOTBrailleGestureManager *)self isRotorRightEvent:v6])
  {
    id v4 = v6;
    unsigned __int8 v5 = &kVOTEventCommandPreviousTextSegmentType;
  }
  else if ([(VOTBrailleGestureManager *)self isRotorDownEvent:v6])
  {
    id v4 = v6;
    unsigned __int8 v5 = &kVOTEventCommandNextTextSegment;
  }
  else if ([(VOTBrailleGestureManager *)self isRotorUpEvent:v6])
  {
    id v4 = v6;
    unsigned __int8 v5 = &kVOTEventCommandPreviousTextSegment;
  }
  else if ([(VOTBrailleGestureManager *)self isTextSelectionForwardEvent:v6])
  {
    id v4 = v6;
    unsigned __int8 v5 = &kVOTEventCommandSelectRight;
  }
  else
  {
    if (![(VOTBrailleGestureManager *)self isTextSelectionBackwardEvent:v6]) {
      goto LABEL_14;
    }
    id v4 = v6;
    unsigned __int8 v5 = &kVOTEventCommandSelectLeft;
  }
  [v4 setCommand:*v5];
LABEL_14:
}

- (BOOL)processTapWithFingerCount:(unint64_t)a3
{
  return 1;
}

- (BOOL)processTouchLocations:(id)a3 isFirstTouch:(BOOL)a4 isCancelTouch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (![(VOTBrailleGestureManager *)self typingMode])
  {
    uint64_t v9 = [(VOTBrailleGestureManager *)self _touchLocationsByFilteringOutEdges:v8];

    id v8 = (id)v9;
  }
  [v8 count];
  v10 = [(VOTBrailleGestureManager *)self lastTouchLocationsByIdentifier];
  [v10 count];

  if (![v8 count])
  {
    int64_t v11 = [(VOTBrailleGestureManager *)self lastTouchLocationsByIdentifier];
    id v12 = [v11 count];

    if (!v12) {
      goto LABEL_13;
    }
  }
  if (!v6 && ![(VOTBrailleGestureManager *)self didStartFullGesture]) {
    goto LABEL_13;
  }
  id v13 = [v8 count];
  v14 = [(VOTBrailleGestureManager *)self lastTouchLocationsByIdentifier];
  id v15 = [v14 count];

  [(VOTBrailleGestureManager *)self setLastTouchLocationsByIdentifier:v8];
  if ([v8 count] || v13 == v15)
  {
    if (v6)
    {
      [(VOTBrailleGestureManager *)self setDidStartFullGesture:1];
      [(VOTBrailleGestureManager *)self setShouldUpdateDotPositions:1];
    }
    [(VOTBrailleGestureManager *)self _handleFingersOnScreen:v8 didAddOrRemoveFingers:v13 != v15];
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  [(VOTBrailleGestureManager *)self setOverridePrintBrailleWithAllSixDots:v5 & ~AXDeviceSupportsManyTouches()];
  BOOL v16 = [(VOTBrailleGestureManager *)self _handleAllFingersLifted];
LABEL_14:

  return v16;
}

- (id)_touchLocationsByFilteringOutEdges:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v21);
        objc_msgSend(v12, "ax_CGPointValue");
        double v14 = v13;
        double v16 = v15;

        double v17 = v14 / sub_10005203C([(VOTBrailleGestureManager *)self keyboardOrientation]);
        if (v17 > 0.05 && v17 < 0.95)
        {
          double v17 = v16 / v18;
          if (v16 / v18 > 0.05 && v17 < 0.95)
          {
            uint64_t v19 = [v6 objectForKeyedSubscript:v11];
            [v5 setObject:v19 forKeyedSubscript:v11];
          }
        }
      }
      id v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v17);
    }
    while (v8);
  }

  return v5;
}

- (void)setTypingMode:(int64_t)a3
{
  if (self->_typingMode != a3)
  {
    BOOL v5 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
    [(VOTBrailleGestureManager *)self updateWithString:v5];

    self->_typingMode = a3;
  }
}

- (void)inputSpaceForElement:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self _requiresCandidateSelection])
  {
    id v5 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
    if ([v5 length])
    {
      [(VOTBrailleGestureManager *)self _applyNextCandidate];
LABEL_9:

      goto LABEL_14;
    }
  }
  if ([(VOTBrailleGestureManager *)self _requiresLaTeXInput])
  {
    id v5 = [objc_alloc((Class)BRLTBrailleChar) initWithBits:0];
    gestureTranslator = self->_gestureTranslator;
    id v7 = [v5 unicode];
    [(VOTBrailleGestureTranslator *)gestureTranslator addPrintBrailleToBuffer:v7 language:0];

    [(VOTBrailleGestureTranslator *)self->_gestureTranslator didInputSpace];
    id v8 = +[AXSettings sharedInstance];
    unint64_t v9 = (unint64_t)[v8 voiceOverBrailleGesturesTypingFeedback];

    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      v10 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
      unsigned __int8 v11 = [v10 shouldPlayKeyboardSecureClickSound];

      if ((v11 & 1) == 0)
      {
        id v12 = +[VOTWorkspace sharedWorkspace];
        double v13 = [v12 selectedLanguage];
        double v14 = sub_10005215C(32, @"UnicodeHex.", @"VOTOutputPunctuation", v13);

        [(VOTBrailleGestureManager *)self _speakText:v14 useKeyboardLanguage:0];
      }
    }
    goto LABEL_9;
  }
  if (![(VOTBrailleGestureManager *)self _handleWordBreak:v4 includeSpace:1])
  {
    v17.receiver = self;
    v17.super_class = (Class)VOTBrailleGestureManager;
    [(VOTGesturedTextInputManager *)&v17 inputSpaceForElement:v4];
  }
  [(VOTBrailleGestureManager *)self clearCurrentString];
  [(VOTBrailleGestureTranslator *)self->_gestureTranslator didInputSpace];
  [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
  if ([(VOTBrailleGestureManager *)self usesTypingSoundFeedback])
  {
    double v15 = +[VOTOutputManager outputManager];
    double v16 = +[VOSOutputEvent BSIDidEnterSpace];
    [v15 sendEvent:v16];
  }
LABEL_14:
}

- (void)pressReturnKeyForElement:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self _requiresCandidateSelection])
  {
    id v5 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
    if ([v5 length])
    {
      [(VOTBrailleGestureManager *)self _handleWordBreak:v4 includeSpace:0];
      [(VOTBrailleGestureManager *)self clearCurrentString];
      [(VOTBrailleGestureCandidateManager *)self->_candidateManager deactivate];

      goto LABEL_11;
    }
  }
  if ([(VOTBrailleGestureManager *)self _requiresLaTeXInput])
  {
    [(VOTBrailleGestureTranslator *)self->_gestureTranslator addPrintBrailleToBuffer:@"\n" language:0];
    [(VOTBrailleGestureTranslator *)self->_gestureTranslator didPressReturnKey];
    id v6 = +[AXSettings sharedInstance];
    unint64_t v7 = (unint64_t)[v6 voiceOverBrailleGesturesTypingFeedback];

    if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      id v8 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
      unsigned __int8 v9 = [v8 shouldPlayKeyboardSecureClickSound];

      if ((v9 & 1) == 0)
      {
        v10 = +[VOTWorkspace sharedWorkspace];
        unsigned __int8 v11 = [v10 selectedLanguage];
        id v12 = sub_10005215C(10, @"UnicodeHex.", @"VOTOutputPunctuation", v11);

        [(VOTBrailleGestureManager *)self _speakText:v12 useKeyboardLanguage:0];
      }
    }
  }
  else
  {
    [(VOTBrailleGestureManager *)self _handleWordBreak:v4 includeSpace:0];
    v15.receiver = self;
    v15.super_class = (Class)VOTBrailleGestureManager;
    [(VOTGesturedTextInputManager *)&v15 pressReturnKeyForElement:v4];
    [(VOTBrailleGestureTranslator *)self->_gestureTranslator didPressReturnKey];
    [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
    if ([(VOTBrailleGestureManager *)self usesTypingSoundFeedback])
    {
      double v13 = +[VOTOutputManager outputManager];
      double v14 = +[VOSOutputEvent BSIDidCarriageReturn];
      [v13 sendEvent:v14];
    }
  }
LABEL_11:
}

- (void)sendCarriageReturnForElement:(id)a3
{
  id v4 = a3;
  [(VOTBrailleGestureManager *)self _handleWordBreak:v4 includeSpace:0];
  v5.receiver = self;
  v5.super_class = (Class)VOTBrailleGestureManager;
  [(VOTGesturedTextInputManager *)&v5 sendCarriageReturnForElement:v4];

  [(VOTBrailleGestureTranslator *)self->_gestureTranslator didPressReturnKey];
  [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
  [(VOTBrailleGestureCandidateManager *)self->_candidateManager deactivate];
}

- (BOOL)_handleWordBreak:(id)a3 includeSpace:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(VOTBrailleGestureCandidateManager *)self->_candidateManager isActive])
  {
    [(VOTBrailleGestureManager *)self _insertCurrentSelectedCandidate];
  }
  else
  {
    unint64_t v7 = [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler currentSpellingSuggestion];

    if (v7)
    {
      [(VOTBrailleGestureManager *)self _insertCurrentSelectedSuggestion:v6];
    }
    else
    {
      if (![(VOTBrailleGestureManager *)self _shouldUseContractedBraille]
        && ![(VOTBrailleGestureManager *)self _requiresCandidateSelection])
      {
        BOOL v12 = 0;
        goto LABEL_14;
      }
      id v8 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
      CFStringRef v9 = &stru_1001B7888;
      if (v8) {
        CFStringRef v10 = v8;
      }
      else {
        CFStringRef v10 = &stru_1001B7888;
      }
      if (v4) {
        CFStringRef v9 = @" ";
      }
      unsigned __int8 v11 = +[NSString stringWithFormat:@"%@%@", v10, v9];
      [(VOTBrailleGestureManager *)self updateWithString:v11];
    }
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (void)updateWithString:(id)a3
{
  id v4 = a3;
  objc_super v5 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001240A4();
  }

  v6.receiver = self;
  v6.super_class = (Class)VOTBrailleGestureManager;
  [(VOTGesturedTextInputManager *)&v6 updateWithString:v4];
}

- (BOOL)_shouldReverseDots
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 voiceOverTouchBrailleShouldReverseDots];

  return v3;
}

- (BOOL)_handleAdjustTextSegmentTypeEvent:(id)a3
{
  id v4 = [a3 command];
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandNextTextSegmentType];

  objc_super v6 = [(VOTBrailleGestureManager *)self movementManager];
  unint64_t v7 = v6;
  if (v5) {
    [v6 nextSegment];
  }
  else {
    [v6 previousSegment];
  }

  id v8 = [(id)VOTSharedWorkspace selectedLanguage];
  CFStringRef v9 = [(VOTBrailleGestureManager *)self movementManager];
  CFStringRef v10 = [v9 localizedSegmentName];

  id v11 = sub_10000ABF8(v10, 0, v8);
  return 1;
}

- (unint64_t)mode
{
  if ([(VOTBrailleGestureManager *)self translationOverride])
  {
    return [(VOTBrailleGestureManager *)self translationOverride];
  }
  else
  {
    BOOL v4 = [(VOTBrailleGestureManager *)self _shouldUseEightDotBraille];
    BOOL v5 = [(VOTBrailleGestureManager *)self _shouldUseContractedBraille];
    BOOL v6 = [(VOTBrailleGestureManager *)self _requiresLaTeXInput];
    return _BRLTModeForFlags(v4, v5, v6);
  }
}

- (BOOL)isReturnKeyEvent:(id)a3
{
  unsigned __int8 v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputPerformReturnEquivalent];

  return v4;
}

- (BOOL)isSpaceEvent:(id)a3
{
  unsigned __int8 v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputInsertSpace];

  return v4;
}

- (BOOL)isBackspaceEvent:(id)a3
{
  unsigned __int8 v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputBackspace];

  return v4;
}

- (BOOL)isWordBackspaceEvent:(id)a3
{
  unsigned __int8 v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputDeleteWord];

  return v4;
}

- (BOOL)isNextSuggestionEvent:(id)a3
{
  unsigned __int8 v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputNextSuggestion];

  return v4;
}

- (BOOL)isPreviousSuggestionEvent:(id)a3
{
  unsigned __int8 v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputPreviousSuggestion];

  return v4;
}

- (BOOL)isSelectItemEvent:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self isReturnKeyEvent:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    BOOL v6 = [v4 command];
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandGesturedTextInputLaunchApp];
  }
  return v5;
}

- (BOOL)isNextKeyboardLanguageEvent:(id)a3
{
  unsigned __int8 v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputNextKeyboardLanguage];

  return v4;
}

- (BOOL)performNextKeyboardLanguage
{
  v2 = +[VOTWorkspace sharedWorkspace];
  [v2 performNextLanguageButtonPress];

  return 1;
}

- (BOOL)isNextBrailleTableEvent:(id)a3
{
  unsigned __int8 v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputNextBrailleTable];

  return v4;
}

- (BOOL)performNextBrailleTableCommand
{
  [(VOTBrailleGestureManager *)self _commitBufferedBraille];
  unsigned __int8 v3 = [(id)VOTSharedWorkspace brailleLanguageRotorItems];
  unsigned __int8 v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &stru_1001B6C08);

  if ((unint64_t)[v4 count] > 1)
  {
    unsigned __int8 v5 = [(id)VOTSharedWorkspace selectedBrailleGesturesInputTable];
    BOOL v6 = [v5 identifier];

    if ([v4 count])
    {
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = [v4 objectAtIndexedSubscript:v7];
        CFStringRef v9 = VOSBrailleTableForRotorItem();
        CFStringRef v10 = [v9 identifier];

        LOBYTE(v8) = [v6 isEqual:v10];
        if (v8) {
          break;
        }
        if (++v7 >= (unint64_t)[v4 count]) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      uint64_t v7 = 0;
    }
    id v11 = objc_msgSend(v4, "objectAtIndex:", (v7 + 1) % (unint64_t)objc_msgSend(v4, "count"));
    BOOL v12 = VOSBrailleTableForRotorItem();
    unsigned int v13 = [(VOTBrailleGestureManager *)self _shouldUseEightDotBraille];
    id v14 = objc_alloc((Class)BRLTTable);
    objc_super v15 = [v12 identifier];
    id v16 = [v14 initWithIdentifier:v15];
    [(id)VOTSharedWorkspace setSelectedBrailleGesturesInputTable:v16];

    BOOL v17 = [(VOTBrailleGestureManager *)self _shouldUseEightDotBraille];
    if (v13 != v17)
    {
      BOOL v18 = v17;
      LOBYTE(v28) = 1;
      _AXLogWithFacility();
      gestureTranslator = self->_gestureTranslator;
      int64_t v20 = [(VOTBrailleGestureManager *)self typingMode];
      double v21 = sub_10005203C([(VOTBrailleGestureManager *)self keyboardOrientation]);
      -[VOTBrailleGestureTranslator setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:](gestureTranslator, "setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:", v20, v18, [(VOTBrailleGestureManager *)self _shouldReverseDots], v21, v22);
      [(VOTBrailleGestureManager *)self _updateBrailleUI];
    }
    id v23 = +[VOTOutputRequest createRequest];
    long long v24 = +[VOTBrailleManager manager];
    v25 = [v24 nameForSpokenAnnouncementOfBrailleTable:v12];
    id v26 = [v23 addString:v25];

    [v23 setCannotBeInterrupted:1];
    [v23 send];
  }
  else
  {
    [(VOTBrailleGestureManager *)self _playBonk];
  }

  return 1;
}

- (void)_commitBufferedBraille
{
  unsigned __int8 v3 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
  [(VOTBrailleGestureManager *)self updateWithString:v3];

  [(VOTBrailleGestureManager *)self clearCurrentString];
  [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
  candidateManager = self->_candidateManager;

  [(VOTBrailleGestureCandidateManager *)candidateManager deactivate];
}

- (void)_insertCurrentSelectedSuggestion:(id)a3
{
  spellingSuggestionHandler = self->_spellingSuggestionHandler;
  id v5 = a3;
  BOOL v6 = [(VOTBrailleGestureManager *)self _languageCodeForSpellChecking];
  id v9 = [(VOTBrailleGestureSpellingSuggestionHandler *)spellingSuggestionHandler applySpellingSuggestionForResponder:v5 languageCode:v6];

  uint64_t v7 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
  LODWORD(v5) = [v7 shouldEchoCharacter];

  if (v5)
  {
    LOWORD(v8) = 0;
    -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:](self, "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:", v9, 0, 1, 0, 1, 0, v8, 0);
  }
  [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
}

- (void)_outputChosenSuggestion:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    unsigned __int8 v4 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
    unsigned int v5 = [v4 shouldEchoCharacter];

    if (v5)
    {
      LOWORD(v6) = 0;
      -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:](self, "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:", v7, 0, 1, 0, 0, 1, v6, 0);
    }
  }
  else
  {
    [(VOTBrailleGestureManager *)self _playBonk];
  }
  [(VOTBrailleGestureManager *)self _flashInsertedTextIfAllowed:v7];
}

- (void)_applySuggestionToElement:(id)a3 direction:(int64_t)a4
{
  gestureTranslator = self->_gestureTranslator;
  id v7 = a3;
  uint64_t v8 = [(VOTBrailleGestureTranslator *)gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
  id v9 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    objc_super v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Translate existing input: %@", (uint8_t *)&v14, 0xCu);
  }

  [(VOTBrailleGestureManager *)self updateWithString:v8];
  spellingSuggestionHandler = self->_spellingSuggestionHandler;
  id v11 = [(VOTBrailleGestureManager *)self _languageCodeForSpellChecking];
  [(VOTBrailleGestureSpellingSuggestionHandler *)spellingSuggestionHandler selectNextSpellingSuggestionInDirection:a4 responder:v7 languageCode:v11];

  BOOL v12 = [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler currentSpellingSuggestion];
  [(VOTBrailleGestureManager *)self _outputChosenSuggestion:v12];
  unsigned int v13 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    objc_super v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Spelling suggestion suggested: %@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)applyNextSuggestionToElement:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self _requiresCandidateSelection]) {
    [(VOTBrailleGestureManager *)self _applyNextCandidate];
  }
  else {
    [(VOTBrailleGestureManager *)self _applySuggestionToElement:v4 direction:1];
  }
}

- (void)applyPreviousSuggestionToElement:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self _requiresCandidateSelection]) {
    [(VOTBrailleGestureManager *)self _applyPreviousCandidate];
  }
  else {
    [(VOTBrailleGestureManager *)self _applySuggestionToElement:v4 direction:2];
  }
}

- (BOOL)performCustomBackspace
{
  unsigned __int8 v3 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator popLastBrailleCellFromBuffer];
  if (!v3)
  {
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }
  if ((![(VOTBrailleGestureManager *)self _canUseContractedBraille]
     || ![(VOTBrailleGestureManager *)self _shouldUseContractedBraille])
    && ![(VOTBrailleGestureManager *)self _requiresLaTeXInput])
  {
    uint64_t v6 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
    if (!v6) {
      goto LABEL_12;
    }
    [(VOTBrailleGestureManager *)self updateWithString:v6];
    goto LABEL_10;
  }
  id v4 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
  unsigned int v5 = [v4 shouldEchoCharacter];

  if (v5)
  {
    uint64_t v6 = [(VOTBrailleGestureManager *)self _spokenStringForPrintBraille:v3 useLongForm:1];
    [(VOTBrailleGestureManager *)self _speakText:v6 useKeyboardLanguage:0 shouldQueue:0 isInsert:0 isDelete:1 speakLiterally:0];
LABEL_10:
  }
  [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
  [(VOTBrailleGestureCandidateManager *)self->_candidateManager deactivate];
  [(VOTBrailleGestureManager *)self _updateBrailleUI];
  LOBYTE(v6) = 1;
LABEL_12:
  if ([(VOTBrailleGestureManager *)self usesTypingSoundFeedback])
  {
    id v7 = +[VOTOutputManager outputManager];
    uint64_t v8 = +[VOSOutputEvent BSIDidDelete];
    [v7 sendEvent:v8];
  }
  return (char)v6;
}

- (BOOL)performCustomWordBackspace
{
  unsigned __int8 v3 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translatedTextOfBufferWithMode:[(VOTBrailleGestureManager *)self mode]];
  id v4 = [v3 length];
  if (v4)
  {
    unsigned int v5 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
    unsigned int v6 = [v5 shouldEchoCharacter];

    if (v6) {
      [(VOTBrailleGestureManager *)self _speakText:v3 useKeyboardLanguage:0 shouldQueue:0 isInsert:0 isDelete:1 speakLiterally:0];
    }
    [(VOTBrailleGestureTranslator *)self->_gestureTranslator clearBrailleBuffer];
    id v7 = [(VOTGesturedTextInputManager *)self delegate];
    [v7 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:&stru_1001B6C48];
  }
  return v4 != 0;
}

- (void)didInputBackspace
{
  [(VOTBrailleGestureTranslator *)self->_gestureTranslator didInputBackspace];
  [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
  candidateManager = self->_candidateManager;

  [(VOTBrailleGestureCandidateManager *)candidateManager deactivate];
}

- (void)didInputWordBackspace
{
  [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
  candidateManager = self->_candidateManager;

  [(VOTBrailleGestureCandidateManager *)candidateManager deactivate];
}

- (void)didSelectItem
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 voiceOverTouchBrailleGestureControl];

  if (v4)
  {
    [(VOTBrailleGestureManager *)self setUsage:1];
  }
}

- (BOOL)shouldAllowRotorEvents
{
  return ((unint64_t)[(NSMutableDictionary *)self->_allTouchLocationsByIdentifier count] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)hintForAppLaunch
{
  return sub_100051804(off_1001EA9E8, @"braille.launch.app.hint", 0);
}

- (id)hintForItemChooser
{
  return sub_100051804(off_1001EA9E8, @"braille.choose.item.hint", 0);
}

- (void)eventFactoryDidBeginSplitGesture:(id)a3
{
  unsigned __int8 v3 = VOTLogEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10012410C(v3);
  }

  unsigned int v4 = +[VOTOutputManager outputManager];
  unsigned int v5 = +[VOSOutputEvent AutofillDidAppear];
  [v4 sendEvent:v5];
}

- (id)outputForLatestInput
{
  return [(VOTBrailleGestureTranslator *)self->_gestureTranslator outputForLatestInput];
}

- (BOOL)gesturesControlRotor
{
  return [(VOTBrailleGestureManager *)self usage] != 0;
}

- (BOOL)_shouldUseEightDotBraille
{
  unsigned __int8 v3 = [(id)VOTSharedWorkspace selectedBrailleGesturesInputTable];
  if ([v3 supportsTranslationMode8Dot]) {
    BOOL v4 = [(VOTBrailleGestureManager *)self _deviceSupportsMoreThanFiveTouches];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)_numberOfDots
{
  if ([(VOTBrailleGestureManager *)self _shouldUseEightDotBraille]) {
    return 8;
  }
  else {
    return 6;
  }
}

- (void)_appendOrientationToAnnouncement:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[VOTWorkspace sharedWorkspace];
  unsigned int v6 = [v5 hintsEnabled];

  [(id)VOTSharedWorkspace selectedLanguage];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F8CD4;
  v17[3] = &unk_1001B4C10;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v7;
  uint64_t v8 = objc_retainBlock(v17);
  switch([(VOTBrailleGestureManager *)self keyboardOrientation])
  {
    case 1:
      id v9 = off_1001EA9E8;
      CFStringRef v10 = @"rotate.portrait";
      goto LABEL_13;
    case 2:
      id v9 = off_1001EA9E8;
      CFStringRef v10 = @"rotate.portrait.upsidedown";
LABEL_13:
      uint64_t v15 = sub_100051D04(v9, v10, 0, v7);
      goto LABEL_14;
    case 3:
      id v11 = sub_100051D04(off_1001EA9E8, @"rotate.landscape.left", 0, v7);
      [v4 appendStringWithComma:v11];

      if (!v6) {
        goto LABEL_15;
      }
      BOOL v12 = [(VOTBrailleGestureManager *)self typingMode] == 0;
      break;
    case 4:
      unsigned int v13 = sub_100051D04(off_1001EA9E8, @"rotate.landscape.right", 0, v7);
      [v4 appendStringWithComma:v13];

      if (!v6) {
        goto LABEL_15;
      }
      BOOL v12 = (id)[(VOTBrailleGestureManager *)self typingMode] == (id)1;
      break;
    default:
      _AXLogWithFacility();
      goto LABEL_15;
  }
  uint64_t v14 = v12;
  uint64_t v15 = ((void (*)(void *, uint64_t))v8[2])(v8, v14);
LABEL_14:
  id v16 = (void *)v15;
  [v4 appendStringWithComma:v15];

LABEL_15:
}

- (void)_announceBrailleTypingPropertiesIncludingOrientation:(BOOL)a3 typingMode:(BOOL)a4 forUnlockConfiguration:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v21 = +[NSMutableString string];
  id v9 = [(id)VOTSharedWorkspace selectedLanguage];
  CFStringRef v10 = +[AXSettings sharedInstance];
  unsigned int v11 = [v10 voiceOverTouchBrailleGesturesShouldUseLockedConfiguration];

  if ((v11 & 1) == 0 && !v5)
  {
    if (!v7) {
      goto LABEL_4;
    }
LABEL_16:
    [(VOTBrailleGestureManager *)self _appendOrientationToAnnouncement:v21];
    if (v6) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
  if (v11) {
    id v18 = @"braille.locked.configuration";
  }
  else {
    id v18 = @"braille.unlocked.configuration";
  }
  uint64_t v19 = sub_100051D04(off_1001EA9E8, v18, 0, v9);
  [v21 appendStringWithComma:v19];

  if (v7) {
    goto LABEL_16;
  }
LABEL_4:
  if (v6)
  {
LABEL_5:
    BOOL v12 = off_1001EA9E8;
    if ([(VOTBrailleGestureManager *)self typingMode]) {
      unsigned int v13 = @"braille.table.top";
    }
    else {
      unsigned int v13 = @"braille.screen.away";
    }
    uint64_t v14 = sub_100051D04(v12, v13, 0, v9);
    [v21 appendStringWithComma:v14];
  }
LABEL_9:
  if (-[VOTBrailleGestureTranslator areDotNumberPositionsCalibrated](self->_gestureTranslator, "areDotNumberPositionsCalibrated")|| (+[AXSettings sharedInstance](AXSettings, "sharedInstance"), v15 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v16 = [v15 voiceOverTouchBrailleGesturesDidPlayCalibrationHint], v15, (v16 & 1) != 0))
  {
    BOOL v17 = 0;
  }
  else
  {
    if ([(VOTBrailleGestureManager *)self _deviceSupportsMoreThanFiveTouches]) {
      int64_t v20 = @"braille.calibrate.instructions.ideal";
    }
    else {
      int64_t v20 = @"braille.calibrate.instructions.fallback";
    }
    BOOL v17 = sub_100051804(off_1001EA9E8, v20, 0);
  }
  [(VOTBrailleGestureManager *)self _speakText:v21 hint:v17];
  [(VOTBrailleGestureManager *)self setDidAnnounceBrailleTypingProperties:1];
}

- (void)_updateBrailleTypingPropertiesAndDelayAnnouncement:(BOOL)a3
{
}

- (void)_updateBrailleTypingPropertiesAndDelayAnnouncement:(BOOL)a3 forUnlockConfiguration:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(VOTBrailleGestureManager *)self brailleTypingPropertiesAnnouncementTimer];
  [v7 cancel];

  if ([(VOTGesturedTextInputManager *)self isActive])
  {
    int64_t v8 = [(VOTBrailleGestureManager *)self keyboardOrientation];
    id v9 = +[AXSettings sharedInstance];
    int IsPad = AXDeviceIsPad();
    BOOL v27 = v4;
    if ([v9 voiceOverTouchBrailleGesturesShouldUseLockedConfiguration])
    {
      uint64_t v11 = (uint64_t)[v9 voiceOverTouchBrailleGesturesLockedTypingMode];
      uint64_t v12 = (uint64_t)[v9 voiceOverTouchBrailleGesturesLockedOrientation];
      if ((unint64_t)(v12 - 3) < 0xFFFFFFFFFFFFFFFELL) {
        char v13 = 1;
      }
      else {
        char v13 = IsPad;
      }
      if (v13)
      {
        int64_t v14 = v8;
        char v15 = 1;
LABEL_28:
        int64_t v19 = [(VOTBrailleGestureManager *)self typingMode];
        [(VOTBrailleGestureManager *)self setTypingMode:v11];
        [(VOTBrailleGestureManager *)self setKeyboardOrientation:v12];
        gestureTranslator = self->_gestureTranslator;
        double v21 = sub_10005203C(v12);
        -[VOTBrailleGestureTranslator setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:](gestureTranslator, "setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:", v11, [(VOTBrailleGestureManager *)self _shouldUseEightDotBraille], [(VOTBrailleGestureManager *)self _shouldReverseDots], v21, v22);
        id v23 = [(VOTBrailleGestureManager *)self brailleGestureManagerDelegate];
        [v23 brailleGestureManager:self setForcedOrientation:v12 shouldAnnounce:0];

        if ((v15 & 1) == 0)
        {
          if (v5)
          {
            if ([(VOTBrailleGestureManager *)self didAnnounceBrailleTypingProperties])
            {
              _AXAssert();
            }
            long long v24 = [(VOTBrailleGestureManager *)self brailleTypingPropertiesAnnouncementTimer];

            if (!v24)
            {
              id v25 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
              [(VOTBrailleGestureManager *)self setBrailleTypingPropertiesAnnouncementTimer:v25];
            }
            id v26 = [(VOTBrailleGestureManager *)self brailleTypingPropertiesAnnouncementTimer];
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_1000F9364;
            v29[3] = &unk_1001B4658;
            v29[4] = self;
            BOOL v30 = v27;
            [v26 afterDelay:v29 processBlock:1.0];
          }
          else
          {
            [(VOTBrailleGestureManager *)self _announceBrailleTypingPropertiesIncludingOrientation:v14 != v12 typingMode:v11 != (v19 != 0) forUnlockConfiguration:v27];
          }
        }

        return;
      }
      unsigned __int8 v16 = VOTLogBrailleGestures();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100124150(v16);
      }

      [v9 setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:0];
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 4;
    }
    BOOL v17 = (char *)[(id)VOTSharedWorkspace deviceOrientation];
    uint64_t v18 = sub_100052604((uint64_t)[(BKSAccelerometer *)self->_accelerometer currentDeviceOrientation]);
    if (v18 == 5) {
      uint64_t v11 = 1;
    }
    if ((unint64_t)(v18 - 3) < 2)
    {
LABEL_20:
      int64_t v14 = v8;
      char v15 = 0;
      uint64_t v12 = v18;
      goto LABEL_28;
    }
    if (IsPad)
    {
      if ((unint64_t)(v18 - 1) < 2) {
        goto LABEL_20;
      }
      if ((unint64_t)(v17 - 1) < 4)
      {
LABEL_25:
        int64_t v14 = v8;
        char v15 = 0;
        uint64_t v12 = (uint64_t)v17;
        goto LABEL_28;
      }
      if ((unint64_t)(v8 - 1) >= 4)
      {
LABEL_27:
        int64_t v14 = v8;
        char v15 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      if ((unint64_t)(v17 - 3) < 2) {
        goto LABEL_25;
      }
      if ((unint64_t)(v8 - 3) > 1) {
        goto LABEL_27;
      }
    }
    uint64_t v12 = v8;
    char v15 = 0;
    int64_t v14 = v12;
    goto LABEL_28;
  }
  [(VOTBrailleGestureManager *)self setKeyboardOrientation:0];
  id v28 = [(VOTBrailleGestureManager *)self brailleGestureManagerDelegate];
  objc_msgSend(v28, "brailleGestureManager:unsetForcedOrientationAndAnnounce:", self, -[VOTBrailleGestureManager didAnnounceBrailleTypingProperties](self, "didAnnounceBrailleTypingProperties"));
}

- (void)_updateShouldUseContractedBraille
{
  if ([(VOTBrailleGestureManager *)self _hasContractedBraillePreference]) {
    BOOL v3 = [(VOTBrailleGestureManager *)self _canUseContractedBraille];
  }
  else {
    BOOL v3 = 0;
  }
  gestureTranslator = self->_gestureTranslator;

  [(VOTBrailleGestureTranslator *)gestureTranslator setShouldUseContractedBraille:v3];
}

- (BOOL)_canUseContractedBraille
{
  v2 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
  unsigned __int8 v3 = [v2 acceptsContractedBraille];

  return v3;
}

- (BOOL)_hasContractedBraillePreference
{
  v2 = +[AXSettings sharedInstance];
  BOOL v3 = [v2 voiceOverTouchBrailleGesturesInputMode] == (id)3;

  return v3;
}

- (BOOL)_shouldUseContractedBraille
{
  BOOL v3 = [(id)VOTSharedWorkspace selectedBrailleGesturesInputTable];
  if ([v3 supportsTranslationModeContracted]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(VOTBrailleGestureManager *)self _requiresCandidateSelection];
  }

  return v4;
}

- (BOOL)_requiresLaTeXInput
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(VOTGesturedTextInputManager *)self delegate];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F9588;
  v5[3] = &unk_1001B4890;
  v5[4] = &v6;
  [v3 gesturedTextInputManager:v2 accessCurrentGesturedTextInputElement:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_requiresCandidateSelection
{
  v2 = [(VOTBrailleGestureManager *)self _languageCodeForSpellChecking];
  unsigned __int8 v3 = [v2 hasPrefix:@"ja"];

  return v3;
}

- (BOOL)_patternIncludesEveryFinger:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self _shouldUseEightDotBraille]
    && ([v4 isEqualToString:@"⣿"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else if ([(VOTBrailleGestureManager *)self _shouldUseEightDotBraille])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v5 = [v4 isEqualToString:@"⠿"];
  }

  return v5;
}

- (BOOL)_isCalibrationStartPattern:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self _deviceSupportsMoreThanFiveTouches]) {
    unsigned __int8 v5 = [(VOTBrailleGestureManager *)self _patternIncludesEveryFinger:v4];
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"⠸"];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)_isCalibrationEndPattern:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self _deviceSupportsMoreThanFiveTouches]) {
    unsigned __int8 v5 = [(VOTBrailleGestureManager *)self _patternIncludesEveryFinger:v4];
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"⠇"];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)_touchPointsForCalibrationGivenFirstPoints:(id)a3 lastPoints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(VOTBrailleGestureManager *)self _deviceSupportsMoreThanFiveTouches])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v6 arrayByAddingObjectsFromArray:v7];
  }
  char v9 = v8;

  return v9;
}

- (void)_beginExploringDotPatterns
{
  if (![(VOTBrailleGestureManager *)self isSplitting])
  {
    [(VOTBrailleGestureManager *)self setExploring:1];
    [(VOTBrailleGestureManager *)self _speakPrintBrailleForExploration];
    if (![(VOTBrailleGestureManager *)self shouldUpdateDotPositions])
    {
      [(VOTBrailleGestureManager *)self setShouldUpdateDotPositions:1];
      id v3 = [(VOTBrailleGestureManager *)self lastPrintBrailleCharacter];
      [(VOTBrailleGestureManager *)self _updateDotNumberCirclesForPrintBraille:v3];
    }
  }
}

- (void)_endExploringDotPatterns
{
  [(VOTBrailleGestureManager *)self setExploring:0];
  [(VOTBrailleGestureManager *)self setDidAnnounceExplorationMode:0];

  [(VOTBrailleGestureManager *)self _cancelWarningTones];
}

- (id)_stringWithFirstPart:(id)a3 secondPart:(id)a4
{
  return +[NSString stringWithFormat:@"%@, %@", a3, a4];
}

- (void)_calibrateWithTouchPoints:(id)a3
{
  [(VOTBrailleGestureTranslator *)self->_gestureTranslator calibrateWithTouchPoints:a3];
  id v4 = sub_100051804(off_1001EA9E8, @"braille.calibrate.announcement", 0);
  unsigned __int8 v5 = +[VOSOutputEvent BSIDidCalibrate];
  [(VOTBrailleGestureManager *)self _announceRespectingSoundSettingsRequest:v4 event:v5];

  id v6 = +[VOTUserEventManager sharedInstance];
  [v6 userEventOccurred];
}

- (void)_speakPrintBrailleForExploration
{
  id v3 = [(VOTBrailleGestureManager *)self speakingDelayTimer];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [(VOTBrailleGestureManager *)self setSpeakingDelayTimer:v4];

    unsigned __int8 v5 = [(VOTBrailleGestureManager *)self speakingDelayTimer];
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  id v6 = [(VOTBrailleGestureManager *)self speakingDelayTimer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F9A84;
  v7[3] = &unk_1001B33B8;
  v7[4] = self;
  [v6 afterDelay:v7 processBlock:0.3];
}

- (void)_enumerateDotNumbersForPrintBraille:(id)a3 usingBlock:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, unint64_t, void))a4;
  if ((unint64_t)[v10 length] >= 2) {
    _AXAssert();
  }
  if ([v10 length] == (id)1)
  {
    unsigned int v7 = [v10 characterAtIndex:0];
    if ([(VOTBrailleGestureManager *)self _numberOfDots])
    {
      unint64_t v8 = 1;
      do
      {
        v6[2](v6, v8, (v7 >> (v8 - 1)) & 1);
        ++v8;
      }
      while (v8 <= [(VOTBrailleGestureManager *)self _numberOfDots]);
    }
  }
  else if ([(VOTBrailleGestureManager *)self _numberOfDots])
  {
    unint64_t v9 = 1;
    do
      v6[2](v6, v9++, 0);
    while (v9 <= [(VOTBrailleGestureManager *)self _numberOfDots]);
  }
}

- (id)_spokenStringForPrintBraille:(id)a3
{
  return [(VOTBrailleGestureManager *)self _spokenStringForPrintBraille:a3 useLongForm:0];
}

- (id)_spokenStringForPrintBraille:(id)a3 useLongForm:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((unint64_t)[v6 length] >= 2) {
    _AXAssert();
  }
  +[NSMutableArray arrayWithCapacity:[(VOTBrailleGestureManager *)self _numberOfDots]];
  int64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  unsigned __int8 v16 = sub_1000F9EC0;
  BOOL v17 = &unk_1001B6C70;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v7;
  [(VOTBrailleGestureManager *)self _enumerateDotNumbersForPrintBraille:v6 usingBlock:&v14];

  if ([v7 count])
  {
    unint64_t v8 = sub_100051804(off_1001EA9E8, @"braille.dot.pattern.separator", 0);
    unint64_t v9 = [v7 componentsJoinedByString:v8];

    if (v4)
    {
      if ([v7 count] == (id)1) {
        id v10 = @"braille.dot.pattern.singular";
      }
      else {
        id v10 = @"braille.dot.pattern.plural";
      }
      uint64_t v11 = sub_100051804(off_1001EA9E8, v10, 0);
      uint64_t v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v9, v14, v15, v16, v17);

      unint64_t v9 = (void *)v12;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)_handleCalibrationTimeout
{
  id v3 = [(VOTBrailleGestureManager *)self calibrationStartTouchPoints];

  if (!v3) {
    _AXAssert();
  }
  BOOL v4 = [(VOTBrailleGestureManager *)self calibrationStartTouchPoints];
  [(VOTBrailleGestureManager *)self _inputBrailleFromTouchPoints:v4];

  [(VOTBrailleGestureManager *)self setCalibrationStartTouchPoints:0];
}

- (BOOL)_handleAllFingersLifted
{
  id v3 = [(VOTBrailleGestureManager *)self calibrationStartTouchPoints];

  if (v3) {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_handleCalibrationTimeout" object:0];
  }
  [(VOTBrailleGestureManager *)self setSplitting:0];
  int v4 = 0;
  BOOL v5 = 0;
  if (![(VOTBrailleGestureManager *)self isExploring])
  {
    if ([(VOTBrailleGestureManager *)self didMoveFingersTooFarForInput]
      || [(VOTBrailleGestureManager *)self didEnterInvalidGesture])
    {
      int v4 = 0;
      BOOL v5 = 0;
      goto LABEL_19;
    }
    id v6 = [(NSMutableDictionary *)self->_allTouchLocationsByIdentifier allValues];
    id v7 = [(VOTBrailleGestureManager *)self _printBrailleForTouchPoints:v6];
    if (v3)
    {
      unsigned int v8 = [(VOTBrailleGestureManager *)self _isCalibrationEndPattern:v7];
      uint64_t v9 = [(VOTBrailleGestureManager *)self calibrationStartTouchPoints];
      id v10 = (void *)v9;
      if (v8)
      {
        uint64_t v11 = [(VOTBrailleGestureManager *)self _touchPointsForCalibrationGivenFirstPoints:v9 lastPoints:v6];
        [(VOTBrailleGestureManager *)self _calibrateWithTouchPoints:v11];
      }
      else
      {
        v15[0] = v9;
        v15[1] = v6;
        uint64_t v11 = +[NSArray arrayWithObjects:v15 count:2];
        [(VOTBrailleGestureManager *)self _inputBrailleFromSeriesOfTouchPoints:v11];
      }
    }
    else
    {
      if ([(VOTBrailleGestureManager *)self _isCalibrationStartPattern:v7])
      {
        [(VOTBrailleGestureManager *)self setCalibrationStartTouchPoints:v6];
        unsigned int v12 = [(VOTBrailleGestureManager *)self _deviceSupportsMoreThanFiveTouches];
        double v13 = 0.5;
        if (v12) {
          double v13 = 0.25;
        }
        [(VOTBrailleGestureManager *)self performSelector:"_handleCalibrationTimeout" withObject:0 afterDelay:v13];
        int v4 = 1;
        goto LABEL_18;
      }
      [(VOTBrailleGestureManager *)self _inputBrailleFromTouchPoints:v6];
    }
    int v4 = 0;
LABEL_18:
    [(VOTBrailleGestureManager *)self _updateBrailleUI];

    BOOL v5 = 1;
  }
LABEL_19:
  [(VOTBrailleGestureManager *)self _cleanUpTouchesIncludingCalibrationStartPoints:v4 ^ 1u];
  return v5;
}

- (void)_cleanUpTouchesIncludingCalibrationStartPoints:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSMutableDictionary *)self->_allTouchLocationsByIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_firstTouchLocationsByIdentifier removeAllObjects];
  [(VOTBrailleGestureManager *)self setDidMoveFingersTooFarForInput:0];
  [(VOTBrailleGestureManager *)self setDidEnterInvalidGesture:0];
  [(VOTBrailleGestureManager *)self setLastPrintBrailleCharacter:0];
  [(VOTBrailleGestureManager *)self _updateDotNumberCirclesForPrintBraille:0];
  [(VOTBrailleGestureManager *)self _endExploringDotPatterns];
  BOOL v5 = [(VOTBrailleGestureManager *)self speakingDelayTimer];
  [v5 cancel];

  if (v3)
  {
    [(VOTBrailleGestureManager *)self setCalibrationStartTouchPoints:0];
  }
}

- (void)_handleFingersOnScreen:(id)a3 didAddOrRemoveFingers:(BOOL)a4
{
  BOOL v31 = a4;
  id v5 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        [(NSMutableDictionary *)self->_allTouchLocationsByIdentifier setObject:v11 forKeyedSubscript:v10];

        unsigned int v12 = [(NSMutableDictionary *)self->_firstTouchLocationsByIdentifier objectForKeyedSubscript:v10];

        if (v12)
        {
          if (![(VOTBrailleGestureManager *)self didMoveFingersTooFarForInput])
          {
            double v13 = [(NSMutableDictionary *)self->_allTouchLocationsByIdentifier objectForKeyedSubscript:v10];
            objc_msgSend(v13, "ax_CGPointValue");
            int64_t v14 = [(NSMutableDictionary *)self->_firstTouchLocationsByIdentifier objectForKeyedSubscript:v10];
            objc_msgSend(v14, "ax_CGPointValue");
            SCRCMathGetDistanceBetweenPoints();
            double v16 = v15;

            if (v16 > 45.0) {
              [(VOTBrailleGestureManager *)self setDidMoveFingersTooFarForInput:1];
            }
          }
        }
        else
        {
          BOOL v17 = [v5 objectForKeyedSubscript:v10];
          [(NSMutableDictionary *)self->_firstTouchLocationsByIdentifier setObject:v17 forKeyedSubscript:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v7);
  }
  id v18 = [(VOTBrailleGestureManager *)self _newBrailleInput];
  int64_t v19 = [v5 allValues];
  objc_super v37 = v19;
  int64_t v20 = +[NSArray arrayWithObjects:&v37 count:1];
  [v18 setSeriesOfTouchPoints:v20];

  gestureTranslator = self->_gestureTranslator;
  id v32 = 0;
  double v22 = [(VOTBrailleGestureTranslator *)gestureTranslator printBrailleForInput:v18 error:&v32];
  id v23 = v32;
  long long v24 = [v23 domain];
  if ([v24 isEqualToString:@"VOTBrailleGestureErrorDomain"])
  {
    id v25 = [v23 code];

    if (v25 == (id)1 && ![(VOTBrailleGestureManager *)self didEnterInvalidGesture])
    {
      id v26 = sub_100051804(off_1001EA9E8, @"braille.too.many.touches.format", 0);
      [(VOTBrailleGestureManager *)self _numberOfDots];
      BOOL v27 = AXFormatInteger();
      id v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27);
      [(VOTBrailleGestureManager *)self _speakText:v28 useKeyboardLanguage:0];

      [(VOTBrailleGestureManager *)self setDidEnterInvalidGesture:1];
    }
  }
  else
  {
  }
  uint64_t v29 = [(VOTBrailleGestureManager *)self lastPrintBrailleCharacter];
  unsigned __int8 v30 = [v29 isEqualToString:v22];

  if ((v30 & 1) == 0)
  {
    [(VOTBrailleGestureManager *)self setLastPrintBrailleCharacter:v22];
    if ([(VOTBrailleGestureManager *)self isExploring])
    {
      [(VOTBrailleGestureManager *)self _speakPrintBrailleForExploration];
    }
    else if (!v31)
    {
      [(VOTBrailleGestureManager *)self _updateDotNumberCirclesForPrintBraille:0];
      [(VOTBrailleGestureManager *)self setShouldUpdateDotPositions:0];
    }
    if ([(VOTBrailleGestureManager *)self shouldUpdateDotPositions]) {
      [(VOTBrailleGestureManager *)self _updateDotNumberCirclesForPrintBraille:v22];
    }
  }
  if (v31 && ![(VOTBrailleGestureManager *)self isSplitting]) {
    [(VOTBrailleGestureManager *)self _scheduleExploringModeIfNeeded];
  }
}

- (int64_t)valueChangeOriginator
{
  return 3;
}

- (id)_newBrailleInput
{
  BOOL v3 = objc_alloc_init(VOTBrailleGestureInput);
  int v4 = [(VOTBrailleGestureManager *)self _languageCodeForSpeakingAndBrailleTranslation];
  [(VOTBrailleGestureInput *)v3 setLanguageCode:v4];

  return v3;
}

- (void)_updateDotNumberCirclesForPrintBraille:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FA7C8;
  v7[3] = &unk_1001B6C70;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v8;
  [(VOTBrailleGestureManager *)self _enumerateDotNumbersForPrintBraille:v4 usingBlock:v7];

  id v6 = +[VOTDisplayManager displayManager];
  [v6 highlightBrailleDots:v5];
}

- (void)_scheduleExploringModeIfNeeded
{
  if (![(VOTBrailleGestureManager *)self isExploring])
  {
    BOOL v3 = [(VOTBrailleGestureManager *)self warningTonesTimer];

    if (!v3)
    {
      id v4 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
      [(VOTBrailleGestureManager *)self setWarningTonesTimer:v4];

      id v5 = [(VOTBrailleGestureManager *)self warningTonesTimer];
      [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    }
    id v6 = [(VOTBrailleGestureManager *)self warningTonesTimer];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000FA928;
    v7[3] = &unk_1001B33B8;
    void v7[4] = self;
    [v6 afterDelay:v7 processBlock:1.0];
  }
}

- (BOOL)_isNextBrailleUsageEvent:(id)a3
{
  BOOL v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandBSINextBrailleMode];

  return v4;
}

- (BOOL)_isPreviousBrailleUsageEvent:(id)a3
{
  BOOL v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandBSIPreviousBrailleMode];

  return v4;
}

- (BOOL)_isTranslateImmediatelyEvent:(id)a3
{
  BOOL v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandBSITranslateImmediately];

  return v4;
}

- (BOOL)_isToggleLockedConfigurationEvent:(id)a3
{
  BOOL v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandBSIOrientationLock];

  return v4;
}

- (BOOL)_isCarriageReturnSwipeEvent:(id)a3
{
  BOOL v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandBSIQuickAction];

  return v4;
}

- (BOOL)_isSelectEvent:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 command];
  if ([v4 isEqualToString:kVOTEventCommandSelectLeft])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [v3 command];
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandSelectRight];
  }
  return v5;
}

- (BOOL)_isAdjustTextSegmentEvent:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 command];
  if ([v4 isEqualToString:kVOTEventCommandNextTextSegment])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [v3 command];
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandPreviousTextSegment];
  }
  return v5;
}

- (BOOL)_isAdjustTextSegmentTypeEvent:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 command];
  if ([v4 isEqualToString:kVOTEventCommandNextTextSegmentType])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [v3 command];
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandPreviousTextSegmentType];
  }
  return v5;
}

- (void)_inputBrailleFromTouchPoints:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    unsigned __int8 v5 = +[NSArray arrayWithObjects:&v6 count:1];

    -[VOTBrailleGestureManager _inputBrailleFromSeriesOfTouchPoints:](self, "_inputBrailleFromSeriesOfTouchPoints:", v5, v6);
  }
}

- (void)_inputBrailleFromSeriesOfTouchPoints:(id)a3
{
  id v4 = a3;
  if ([(VOTBrailleGestureManager *)self isExploring]) {
    _AXAssert();
  }
  [(VOTBrailleGestureManager *)self _handleTouchPoints:v4];
}

- (id)_printBrailleForTouchPoints:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTBrailleGestureManager *)self _newBrailleInput];
  id v9 = v4;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];
  [v5 setSeriesOfTouchPoints:v6];

  id v7 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator printBrailleForInput:v5 error:0];

  return v7;
}

- (void)_handleChangeUsage:(BOOL)a3
{
  [(VOTBrailleGestureManager *)self setUsage:[(VOTBrailleGestureManager *)self usage] == 0 userInitiated:1];

  [(VOTBrailleGestureManager *)self clearCurrentString];
}

- (void)_handleTranslateImmediately
{
  if ([(VOTBrailleGestureManager *)self _shouldUseContractedBraille]
    || [(VOTBrailleGestureManager *)self _requiresLaTeXInput])
  {
    id v7 = +[VOTOutputRequest createRequest];
    id v3 = sub_100051804(off_1001EA9E8, @"braille.translate.event", 0);
    id v4 = [v7 addString:v3];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      id v5 = [v7 lastAction];
      [v5 setObject:&off_1001C4EF8 forVariant:32];
    }
    [v7 setCannotBeInterrupted:1];
    [v7 send];
    id v6 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
    [(VOTBrailleGestureManager *)self updateWithString:v6];

    [(VOTBrailleGestureManager *)self clearCurrentString];
  }
  else
  {
    [(VOTBrailleGestureManager *)self _playBonk];
  }
}

- (id)_languageCodeForBrailleTable
{
  v2 = [(id)VOTSharedWorkspace selectedBrailleGesturesInputTable];
  id v3 = [v2 language];

  id v4 = +[NSLocale localeWithLocaleIdentifier:v3];
  id v5 = [v4 languageCode];

  return v5;
}

- (id)_languageCodeForSpellChecking
{
  v2 = [(VOTBrailleGestureManager *)self _languageCodeForBrailleTable];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  return v3;
}

- (id)_languageCodeForSpeakingAndBrailleTranslation
{
  v2 = [(VOTBrailleGestureManager *)self _languageCodeForBrailleTable];
  id v3 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v14 = 138543362;
    double v15 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Language code from keyboard in app is %{public}@", (uint8_t *)&v14, 0xCu);
  }

  id v4 = AXCRemapLanguageCodeToFallbackIfNeccessary();
  AXLanguageConvertToCanonicalForm();
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v6 = AXRetrieveSupportedAccessibilityLanguages();
  id v7 = v6;
  if (!v6 || !v5) {
    goto LABEL_8;
  }
  if ([v6 containsObject:v5]) {
    goto LABEL_17;
  }
  id v8 = [(__CFString *)v5 rangeOfString:@"-"];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL
    || ([(__CFString *)v5 substringToIndex:v8],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v5,
        id v5 = (__CFString *)v9,
        ![v7 containsObject:v9]))
  {
  }
  else
  {
LABEL_8:
    if (v5) {
      goto LABEL_17;
    }
  }
  uint64_t v10 = +[VOTWorkspace sharedWorkspace];
  id v5 = [v10 systemSpokenLanguage];

  uint64_t v11 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    double v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Language code from workspace is %{public}@", (uint8_t *)&v14, 0xCu);
  }

  if (!v5)
  {
    unsigned int v12 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Had to fall back to using English.", (uint8_t *)&v14, 2u);
    }

    id v5 = @"en";
  }
LABEL_17:

  return v5;
}

- (BOOL)_handleCarriageReturnSwipe
{
  id v3 = [(VOTGesturedTextInputManager *)self delegate];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FB3DC;
  v5[3] = &unk_1001B6C98;
  v5[4] = self;
  [v3 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:v5];

  return 1;
}

- (void)handleBrailleGestureWithLeftPatternDictionary:(id)a3 rightPatternDictionary:(id)a4
{
  id v6 = a4;
  id v10 = +[VOTBrailleGestureHalfPattern halfPatternWithDictionaryRepresentation:a3];
  id v7 = +[VOTBrailleGestureHalfPattern halfPatternWithDictionaryRepresentation:v6];

  id v8 = [[VOTBrailleGesturePattern alloc] initWithLeftDots:v10 rightDots:v7];
  uint64_t v9 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator printBrailleForGesturePattern:v8];
  [(VOTBrailleGestureManager *)self _handlePrintBraille:v9];
}

- (void)_handlePrintBraille:(id)a3
{
  id v6 = (__CFString *)a3;
  if ((AXDeviceSupportsManyTouches() & 1) == 0
    && [(VOTBrailleGestureManager *)self overridePrintBrailleWithAllSixDots])
  {

    id v6 = @"⠿";
  }
  id v4 = [(VOTBrailleGestureManager *)self usage];
  if (v4 == (id)1)
  {
    id v4 = [(VOTBrailleGestureManager *)self _issueCommands:v6];
  }
  else
  {
    id v5 = v6;
    if (v4) {
      goto LABEL_9;
    }
    id v4 = [(VOTBrailleGestureManager *)self _typePrintBraille:v6];
  }
  id v5 = v6;
LABEL_9:

  _objc_release_x1(v4, v5);
}

- (void)_issueCommands:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = objc_msgSend(v6, "substringWithRange:", v4, 1);
      [(VOTBrailleGestureManager *)self _issueSingleCommand:v5];

      ++v4;
    }
    while (v4 < (unint64_t)[v6 length]);
  }
}

- (void)_issueSingleCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTBrailleGestureManager *)self commands];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = (void *)VOTSharedWorkspace;
    id v8 = +[VOTEvent touchEventWithCommand:v6 info:0];
    [v7 dispatchCommand:v8 bypassGesturedInput:1];

    uint64_t v9 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Issued %@ for Braille chord %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_typePrintBraille:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VOTBrailleGestureManager *)self mode];
  id v6 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
  unsigned int v7 = [v6 isActiveResponder];

  id v8 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
  unsigned int v9 = [v8 shouldPlayKeyboardSecureClickSound];

  unsigned int v34 = v7;
  if (v5 - 5 >= 0xFFFFFFFFFFFFFFFELL) {
    unsigned int v10 = ([(VOTBrailleGestureManager *)self _canUseContractedBraille] | v7) ^ 1 | v9;
  }
  else {
    unsigned int v10 = 1;
  }
  uint64_t v11 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translatedTextForPrintBraille:v4 mode:v5];
  gestureTranslator = self->_gestureTranslator;
  id v13 = [(VOTBrailleGestureManager *)self _languageCodeForSpeakingAndBrailleTranslation];
  [(VOTBrailleGestureTranslator *)gestureTranslator addPrintBrailleToBuffer:v4 language:v13];

  int v14 = [(VOTGesturedTextInputManager *)self currentString];
  double v15 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:v5];
  double v16 = [v14 commonPrefixWithString:v11 options:0];
  BOOL v17 = objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v16, "length"));

  id v18 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478595;
    long long v36 = v14;
    __int16 v37 = 2113;
    id v38 = v4;
    __int16 v39 = 2113;
    v40 = v11;
    __int16 v41 = 2113;
    v42 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "existingText = \"%{private}@\", printBraille = \"%{private}@\", translatedText = \"%{private}@\", textToBeInserted = \"%{private}@\"", buf, 0x2Au);
  }

  if (v5 == 4) {
    id v19 = v4;
  }
  else {
    id v19 = v11;
  }
  [(VOTBrailleGestureManager *)self _flashInsertedTextIfAllowed:v19];
  if (v10) {
    [(VOTBrailleGestureManager *)self updateWithString:v15];
  }
  if (v14 == v11 || [v14 isEqualToString:v11])
  {
    int64_t v20 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
    if (![v20 shouldEchoCharacter])
    {
LABEL_30:

      goto LABEL_31;
    }
    id v21 = [v4 length];

    if (v21)
    {
      double v22 = +[AXSettings sharedInstance];
      unint64_t v23 = (unint64_t)[v22 voiceOverBrailleGesturesTypingFeedback];

      if ((v23 & 0xFFFFFFFFFFFFFFFDLL) == 0)
      {
        long long v24 = +[NSString stringWithUnichar:](NSString, "stringWithUnichar:", objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "rangeOfComposedCharacterSequenceAtIndex:", (char *)objc_msgSend(v4, "length") - 1)));
        int64_t v20 = [(VOTBrailleGestureManager *)self _spokenStringForPrintBraille:v24 useLongForm:1];

        id v25 = VOTLogBrailleGestures();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
LABEL_27:
        sub_100124194();
LABEL_28:

        id v32 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
        unsigned __int8 v33 = [v32 shouldPlayKeyboardSecureClickSound];

        if ((v33 & 1) == 0) {
          [(VOTBrailleGestureManager *)self _speakText:v20 useKeyboardLanguage:v34 shouldQueue:0 isInsert:1 isDelete:0 speakLiterally:0];
        }
        goto LABEL_30;
      }
    }
  }
  else
  {
    id v26 = +[AXSettings sharedInstance];
    unint64_t v27 = (unint64_t)[v26 voiceOverBrailleGesturesTypingFeedback];

    if ((v27 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      char v28 = 1;
    }
    else {
      char v28 = v10;
    }
    if ((v28 & 1) == 0)
    {
      if (v5 == 4)
      {
        BOOL v31 = +[NSString stringWithUnichar:](NSString, "stringWithUnichar:", objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "rangeOfComposedCharacterSequenceAtIndex:", (char *)objc_msgSend(v4, "length") - 1)));
        int64_t v20 = [(VOTBrailleGestureManager *)self _spokenStringForPrintBraille:v31 useLongForm:1];

        id v25 = VOTLogBrailleGestures();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      if (v5 == 3)
      {
        uint64_t v29 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
        unsigned __int8 v30 = [v29 shouldPlayKeyboardSecureClickSound];

        if ((v30 & 1) == 0) {
          [(VOTBrailleGestureManager *)self _speakText:v11 useKeyboardLanguage:v34 shouldQueue:0 isInsert:1 isDelete:0 speakLiterally:1];
        }
      }
    }
  }
LABEL_31:
  [(VOTBrailleGestureSpellingSuggestionHandler *)self->_spellingSuggestionHandler clearSpellingSuggestions];
  [(VOTBrailleGestureCandidateManager *)self->_candidateManager deactivate];
}

- (void)_handleTouchPoints:(id)a3
{
  id v4 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_handleTouchPoints:" object:v4];
  id v5 = [(VOTBrailleGestureManager *)self _newBrailleInput];
  [v5 setSeriesOfTouchPoints:v4];
  gestureTranslator = self->_gestureTranslator;
  id v13 = 0;
  unsigned int v7 = [(VOTBrailleGestureTranslator *)gestureTranslator printBrailleForAllTouchPointsInInput:v5 shouldLearn:1 error:&v13];
  id v8 = v13;
  if (!v7 || ![v7 length])
  {
    uint64_t v11 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001241FC();
    }
    goto LABEL_10;
  }
  [(VOTBrailleGestureManager *)self _handlePrintBraille:v7];
  if (![(VOTBrailleGestureManager *)self usage]
    && [(VOTBrailleGestureManager *)self usesTypingSoundFeedback])
  {
    unsigned int v9 = +[VOTOutputManager outputManager];
    unsigned int v10 = +[VOSOutputEvent BSIDidType];
    [v9 sendEvent:v10];
  }
  if ([(VOTBrailleGestureManager *)self usesHapticFeedback])
  {
    uint64_t v11 = +[VOTOutputManager outputManager];
    __int16 v12 = +[VOSOutputEvent BSIDidEnterChord];
    [v11 sendEvent:v12];

LABEL_10:
  }
}

- (void)_applyCandidateInDirection:(int64_t)a3
{
  id v5 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
  id v6 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    __int16 v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Translate existing input: %@", (uint8_t *)&v11, 0xCu);
  }

  if (![(VOTBrailleGestureCandidateManager *)self->_candidateManager isActive])
  {
    candidateManager = self->_candidateManager;
    id v8 = [(VOTBrailleGestureManager *)self _languageCodeForSpellChecking];
    [(VOTBrailleGestureCandidateManager *)candidateManager analyzeString:v5 language:v8];

    goto LABEL_9;
  }
  if (a3 == 2)
  {
    if ([(VOTBrailleGestureCandidateManager *)self->_candidateManager hasPreviousCandidate])
    {
      [(VOTBrailleGestureCandidateManager *)self->_candidateManager moveToPreviousCandidate];
      goto LABEL_9;
    }
  }
  else if (a3 == 1 {
         && [(VOTBrailleGestureCandidateManager *)self->_candidateManager hasNextCandidate])
  }
  {
    [(VOTBrailleGestureCandidateManager *)self->_candidateManager moveToNextCandidate];
LABEL_9:
    unsigned int v9 = [(VOTBrailleGestureCandidateManager *)self->_candidateManager currentCandidateSurfaceString];
    goto LABEL_13;
  }
  unsigned int v9 = 0;
LABEL_13:
  [(VOTBrailleGestureManager *)self _outputChosenCandidate:v9];
  unsigned int v10 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    __int16 v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Candidate presented: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_applyNextCandidate
{
}

- (void)_applyPreviousCandidate
{
}

- (void)_insertCurrentSelectedCandidate
{
  if ([(VOTBrailleGestureCandidateManager *)self->_candidateManager isActive])
  {
    id v3 = [(VOTBrailleGestureCandidateManager *)self->_candidateManager currentCandidateSurfaceString];
    [(VOTBrailleGestureManager *)self updateWithString:v3];
    [(VOTBrailleGestureCandidateManager *)self->_candidateManager didSelectCurrentCandidate];
    [(VOTBrailleGestureCandidateManager *)self->_candidateManager deactivate];
  }
}

- (void)_outputChosenCandidate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[AXLanguageManager sharedInstance];
    id v6 = [(VOTBrailleGestureManager *)self _languageCodeForSpellChecking];
    unsigned int v7 = [v5 descriptionOfWord:v4 forLanguage:v6];

    id v8 = [(VOTBrailleGestureManager *)self _languageCodeForSpellChecking];
    LOWORD(v10) = 0;
    -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:](self, "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:", v7, 0, 0, 0, 0, 0, v10, v8);
  }
  else
  {
    id v9 = 0;
    [(VOTBrailleGestureManager *)self _playBonk];
  }
  [(VOTBrailleGestureManager *)self _flashInsertedTextIfAllowed:a3];
}

- (void)_updateBrailleUI
{
  id v3 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator dotNumberPositions];
  id v4 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    unsigned int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "updating BSI UI with dot positions: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[VOTDisplayManager displayManager];
  objc_msgSend(v5, "updateBrailleUIWithOrientation:dotPositions:typingMode:", -[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation"), v3, -[VOTBrailleGestureManager typingMode](self, "typingMode"));
}

- (void)_flashInsertedTextIfAllowed:(id)a3
{
  id v7 = a3;
  id v4 = [(VOTGesturedTextInputManager *)self currentElementAttributes];
  if ([v4 shouldEchoCharacter])
  {
    id v5 = +[AXSettings sharedInstance];
    unsigned int v6 = [v5 voiceOverTouchBrailleGesturesDisplaysEnteredText];

    if (!v6) {
      goto LABEL_5;
    }
    id v4 = +[VOTDisplayManager displayManager];
    [v4 flashBrailleInsertedText:v7];
  }

LABEL_5:
}

- (void)_updateDotPositions
{
  gestureTranslator = self->_gestureTranslator;
  int64_t v4 = [(VOTBrailleGestureManager *)self typingMode];
  double v5 = sub_10005203C([(VOTBrailleGestureManager *)self keyboardOrientation]);
  -[VOTBrailleGestureTranslator setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:](gestureTranslator, "setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:", v4, [(VOTBrailleGestureManager *)self _shouldUseEightDotBraille], [(VOTBrailleGestureManager *)self _shouldReverseDots], v5, v6);

  [(VOTBrailleGestureManager *)self _updateBrailleUI];
}

- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4
{
}

- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4 shouldQueue:(BOOL)a5
{
}

- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4 shouldQueue:(BOOL)a5 isInsert:(BOOL)a6 isDelete:(BOOL)a7 speakLiterally:(BOOL)a8
{
  BYTE1(v8) = a8;
  LOBYTE(v8) = a7;
  -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:](self, "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:", a3, 0, a4, a5, a6, 0, v8, 0);
}

- (void)_speakText:(id)a3 hint:(id)a4
{
  LOWORD(v4) = 0;
  -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:](self, "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:", a3, a4, 0, 0, 0, 0, v4, 0);
}

- (void)_speakText:(id)a3 hint:(id)a4 useKeyboardLanguage:(BOOL)a5 shouldQueue:(BOOL)a6 isInsert:(BOOL)a7 isSuggestion:(BOOL)a8 isDelete:(BOOL)a9 speakLiterally:(BOOL)a10 otherLanguage:(id)a11
{
  LOWORD(v11) = __PAIR16__(a10, a9);
  __int16 v12 = -[VOTBrailleGestureManager _outputRequestForText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:](self, "_outputRequestForText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:", a3, a4, a5, a6, a7, a8, v11, a11);
  [v12 send];
}

- (id)_outputRequestForText:(id)a3 hint:(id)a4 useKeyboardLanguage:(BOOL)a5 shouldQueue:(BOOL)a6 isInsert:(BOOL)a7 isSuggestion:(BOOL)a8 isDelete:(BOOL)a9 speakLiterally:(BOOL)a10 otherLanguage:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v17 = a3;
  id v51 = a4;
  id v18 = a11;
  id v19 = objc_alloc_init(VOTOutputRequest);
  int64_t v20 = v19;
  if (v13) {
    [(VOTOutputRequest *)v19 setDoesNotInterrupt:1];
  }
  if (a5)
  {
    id v21 = [(VOTBrailleGestureManager *)self _languageCodeForSpeakingAndBrailleTranslation];
    id v22 = [(VOTOutputRequest *)v20 addString:v17 withLanguage:v21];
  }
  else
  {
    id v23 = [(VOTOutputRequest *)v20 addString:v17 withLanguage:v18];
  }
  unsigned int v24 = [(id)VOTSharedWorkspace typingPitchChangeEnabled];
  BOOL v25 = a9;
  if ((v12 || a9 || v11) && v24)
  {
    id v49 = v18;
    if (a9)
    {
      id v26 = +[AXSettings sharedInstance];
      id v27 = [v26 voiceOverDeletionFeedback];

      if (v27 == (id)1) {
        double v28 = 0.75;
      }
      else {
        double v28 = 1.0;
      }
    }
    else
    {
      double v29 = 1.5;
      if (!v11) {
        double v29 = 1.0;
      }
      if (v12) {
        double v28 = 1.0;
      }
      else {
        double v28 = v29;
      }
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v50 = v20;
    unsigned __int8 v30 = [(VOTOutputRequest *)v20 outputActions];
    id v31 = [v30 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v53;
      float v34 = v28;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v36 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          __int16 v37 = [v36 string];
          unsigned int v38 = sub_100050EB4(v37);

          if (v38) {
            *(float *)&double v39 = 1.5;
          }
          else {
            *(float *)&double v39 = v34;
          }
          v40 = +[NSNumber numberWithFloat:v39];
          [v36 setObject:v40 forVariant:32];

          if (a10) {
            [v36 setObject:&__kCFBooleanTrue forVariant:28];
          }
        }
        id v32 = [v30 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v32);
    }

    int64_t v20 = v50;
    id v18 = v49;
    BOOL v25 = a9;
  }
  if (v25)
  {
    __int16 v41 = +[AXSettings sharedInstance];
    id v42 = [v41 voiceOverDeletionFeedback];

    if (v42 == (id)2)
    {
      v43 = [(VOTOutputRequest *)v20 outputActions];
      [v43 enumerateObjectsUsingBlock:&stru_1001B6CB8];
    }
  }
  if ([v51 length])
  {
    v44 = +[VOTWorkspace sharedWorkspace];
    unsigned int v45 = [v44 hintsEnabled];

    if (v45)
    {
      LODWORD(v46) = 1061997773;
      [(VOTOutputRequest *)v20 addPause:v46];
      id v47 = [(VOTOutputRequest *)v20 addString:v51];
      [(VOTOutputRequest *)v20 setCompletionBlock:&stru_1001B6CD8];
    }
  }

  return v20;
}

- (void)_playBonk
{
  id v3 = +[VOTOutputManager outputManager];
  v2 = +[VOSOutputEvent BoundaryEncountered];
  [v3 sendEvent:v2];
}

- (void)_playWarningTone
{
  id v3 = +[VOTOutputManager outputManager];
  v2 = +[VOSOutputEvent FolderWillOpen];
  [v3 sendEvent:v2];
}

- (void)_playWarningTones:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [(VOTBrailleGestureManager *)self _playWarningTone];
  id v7 = [(VOTBrailleGestureManager *)self warningTonesTimer];

  if (v7)
  {
    if (![(VOTBrailleGestureManager *)self isSplitting])
    {
      if (a3 < 2)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1000FCB04;
        v10[3] = &unk_1001B6D00;
        v10[4] = self;
        id v11 = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
        uint64_t v8 = v11;
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000FCA40;
        block[3] = &unk_1001B36E8;
        block[4] = self;
        unint64_t v14 = a3;
        id v13 = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        uint64_t v8 = v13;
      }
    }
  }
  else
  {
    id v9 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100124270(v9);
    }
  }
}

- (void)_cancelWarningTones
{
  id v3 = [(VOTBrailleGestureManager *)self warningTonesTimer];
  [v3 cancel];

  [(VOTBrailleGestureManager *)self setWarningTonesTimer:0];
}

- (void)_announceRespectingSoundSettingsRequest:(id)a3 event:(id)a4
{
}

- (void)_announceRespectingSoundSettingsRequest:(id)a3 event:(id)a4 hint:(id)a5
{
  id v20 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = +[AXSettings sharedInstance];
  unint64_t v10 = (unint64_t)[v9 voiceOverTouchBrailleGesturesSoundOption];

  if (v20 && (v10 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (v8
      && (+[AXSettings sharedInstance],
          id v11 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v12 = [v11 voiceOverHintsEnabled],
          v11,
          (v12 & 1) != 0))
    {
      id v13 = objc_alloc_init(VOTOutputRequest);
      unint64_t v14 = [(id)VOTSharedWorkspace selectedLanguage];
      id v15 = [(VOTOutputRequest *)v13 addString:v20 withLanguage:v14];

      LODWORD(v16) = 1061997773;
      [(VOTOutputRequest *)v13 addPause:v16];
      id v17 = [(VOTOutputRequest *)v13 addString:v8];
      [(VOTOutputRequest *)v13 send];
    }
    else
    {
      id v13 = [(id)VOTSharedWorkspace selectedLanguage];
      id v18 = sub_10000ABF8(v20, 1, v13);
    }
  }
  if (v7 && v10 - 1 <= 1)
  {
    id v19 = +[VOTOutputManager outputManager];
    [v19 sendEvent:v7];
  }
}

- (id)nameSearcherEntriesPassingSearchFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VOTBrailleGestureTranslator *)self->_gestureTranslator translateExistingInputWithMode:[(VOTBrailleGestureManager *)self mode]];
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = &stru_1001B7888;
  }
  BOOL v25 = objc_opt_new();
  unsigned int v24 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        char v28 = 0;
        gestureTranslator = self->_gestureTranslator;
        unsigned __int8 v12 = objc_msgSend(v10, "name", v24);
        unsigned __int8 v13 = [(VOTBrailleGestureTranslator *)gestureTranslator isExistingInputContainedIn:v12 withMode:[(VOTBrailleGestureManager *)self mode] isPrefix:&v28];

        unint64_t v14 = [v10 name];
        id v15 = [v14 localizedLowercaseString];
        double v16 = [(__CFString *)v6 localizedLowercaseString];
        unsigned int v17 = [v15 hasPrefix:v16];

        id v18 = [v10 name];
        unsigned int v19 = [v18 localizedCaseInsensitiveContainsString:v6];

        if ((v13 & 1) != 0 || v19)
        {
          if (v28) {
            int v20 = 1;
          }
          else {
            int v20 = v17;
          }
          if (v20) {
            id v21 = v25;
          }
          else {
            id v21 = v24;
          }
          [v21 addObject:v10];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  id v22 = [v25 arrayByAddingObjectsFromArray:v24];

  return v22;
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6 = +[AXSettings sharedInstance];
  if ([v6 voiceOverTouchBrailleGesturesShouldUseLockedConfiguration])
  {
  }
  else
  {
    unsigned int v5 = [(VOTGesturedTextInputManager *)self isActive];

    if (v5)
    {
      [(VOTBrailleGestureManager *)self _updateBrailleTypingPropertiesAndDelayAnnouncement:0];
      [(VOTBrailleGestureManager *)self _updateBrailleUI];
    }
  }
}

- (VOTBrailleGestureManagerDelegate)brailleGestureManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brailleGestureManagerDelegate);

  return (VOTBrailleGestureManagerDelegate *)WeakRetained;
}

- (void)setBrailleGestureManagerDelegate:(id)a3
{
}

- (int64_t)usage
{
  return self->_usage;
}

- (int64_t)typingMode
{
  return self->_typingMode;
}

- (unint64_t)translationOverride
{
  return self->_translationOverride;
}

- (void)setTranslationOverride:(unint64_t)a3
{
  self->_translationOverride = a3;
}

- (NSDictionary)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (BOOL)shouldUpdateDotPositions
{
  return self->_shouldUpdateDotPositions;
}

- (void)setShouldUpdateDotPositions:(BOOL)a3
{
  self->_shouldUpdateDotPositions = a3;
}

- (BOOL)isExploring
{
  return self->_exploring;
}

- (void)setExploring:(BOOL)a3
{
  self->_exploring = a3;
}

- (BOOL)isSplitting
{
  return self->_splitting;
}

- (void)setSplitting:(BOOL)a3
{
  self->_splitting = a3;
}

- (BOOL)didMoveFingersTooFarForInput
{
  return self->_didMoveFingersTooFarForInput;
}

- (void)setDidMoveFingersTooFarForInput:(BOOL)a3
{
  self->_didMoveFingersTooFarForInput = a3;
}

- (BOOL)didAnnounceExplorationMode
{
  return self->_didAnnounceExplorationMode;
}

- (void)setDidAnnounceExplorationMode:(BOOL)a3
{
  self->_didAnnounceExplorationMode = a3;
}

- (BOOL)didAnnounceBrailleTypingProperties
{
  return self->_didAnnounceBrailleTypingProperties;
}

- (void)setDidAnnounceBrailleTypingProperties:(BOOL)a3
{
  self->_didAnnounceBrailleTypingProperties = a3;
}

- (int64_t)keyboardOrientation
{
  return self->_keyboardOrientation;
}

- (void)setKeyboardOrientation:(int64_t)a3
{
  self->_keyboardOrientation = a3;
}

- (NSString)lastPrintBrailleCharacter
{
  return self->_lastPrintBrailleCharacter;
}

- (void)setLastPrintBrailleCharacter:(id)a3
{
}

- (NSDictionary)lastTouchLocationsByIdentifier
{
  return self->_lastTouchLocationsByIdentifier;
}

- (void)setLastTouchLocationsByIdentifier:(id)a3
{
}

- (AXDispatchTimer)speakingDelayTimer
{
  return self->_speakingDelayTimer;
}

- (void)setSpeakingDelayTimer:(id)a3
{
}

- (AXDispatchTimer)brailleTypingPropertiesAnnouncementTimer
{
  return self->_brailleTypingPropertiesAnnouncementTimer;
}

- (void)setBrailleTypingPropertiesAnnouncementTimer:(id)a3
{
}

- (AXDispatchTimer)warningTonesTimer
{
  return self->_warningTonesTimer;
}

- (void)setWarningTonesTimer:(id)a3
{
}

- (BOOL)didStartFullGesture
{
  return self->_didStartFullGesture;
}

- (void)setDidStartFullGesture:(BOOL)a3
{
  self->_didStartFullGesture = a3;
}

- (BOOL)didEnterInvalidGesture
{
  return self->_didEnterInvalidGesture;
}

- (void)setDidEnterInvalidGesture:(BOOL)a3
{
  self->_didEnterInvalidGesture = a3;
}

- (AXDispatchTimer)lockScreenDimmingTimer
{
  return self->_lockScreenDimmingTimer;
}

- (void)setLockScreenDimmingTimer:(id)a3
{
}

- (AXDispatchTimer)logBSIUsageTimer
{
  return self->_logBSIUsageTimer;
}

- (void)setLogBSIUsageTimer:(id)a3
{
}

- (AXDispatchTimer)initialOrientationTimer
{
  return self->_initialOrientationTimer;
}

- (void)setInitialOrientationTimer:(id)a3
{
}

- (BSInvalidatable)disableIdleTimerAssertion
{
  return self->_disableIdleTimerAssertion;
}

- (void)setDisableIdleTimerAssertion:(id)a3
{
}

- (BOOL)overridePrintBrailleWithAllSixDots
{
  return self->_overridePrintBrailleWithAllSixDots;
}

- (void)setOverridePrintBrailleWithAllSixDots:(BOOL)a3
{
  self->_overridePrintBrailleWithAllSixDots = a3;
}

- (VOTTextMovementManager)movementManager
{
  return self->_movementManager;
}

- (void)setMovementManager:(id)a3
{
}

- (BOOL)usesTypingSoundFeedback
{
  return self->_usesTypingSoundFeedback;
}

- (void)setUsesTypingSoundFeedback:(BOOL)a3
{
  self->_usesTypingSoundFeedback = a3;
}

- (BOOL)usesHapticFeedback
{
  return self->_usesHapticFeedback;
}

- (void)setUsesHapticFeedback:(BOOL)a3
{
  self->_usesHapticFeedback = a3;
}

- (NSArray)calibrationStartTouchPoints
{
  return self->_calibrationStartTouchPoints;
}

- (void)setCalibrationStartTouchPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationStartTouchPoints, 0);
  objc_storeStrong((id *)&self->_movementManager, 0);
  objc_storeStrong((id *)&self->_disableIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_initialOrientationTimer, 0);
  objc_storeStrong((id *)&self->_logBSIUsageTimer, 0);
  objc_storeStrong((id *)&self->_lockScreenDimmingTimer, 0);
  objc_storeStrong((id *)&self->_warningTonesTimer, 0);
  objc_storeStrong((id *)&self->_brailleTypingPropertiesAnnouncementTimer, 0);
  objc_storeStrong((id *)&self->_speakingDelayTimer, 0);
  objc_storeStrong((id *)&self->_lastTouchLocationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_lastPrintBrailleCharacter, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_destroyWeak((id *)&self->_brailleGestureManagerDelegate);
  objc_storeStrong((id *)&self->_firstTouchLocationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_allTouchLocationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);
  objc_storeStrong((id *)&self->_candidateManager, 0);
  objc_storeStrong((id *)&self->_spellingSuggestionHandler, 0);

  objc_storeStrong((id *)&self->_gestureTranslator, 0);
}

@end
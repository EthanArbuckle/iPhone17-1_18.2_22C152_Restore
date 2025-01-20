@interface VOTBrailleManager
+ (double)currentDefaultBrailleAlertTimeout;
+ (id)manager;
- (BOOL)_brailleShouldTryToTurnPage:(id)a3 direction:(int64_t)a4;
- (BOOL)_handleKeyboardModifierCommands:(id)a3;
- (BOOL)_isActiveUserDisplayConfig:(id)a3;
- (BOOL)_isTerminalModeOn;
- (BOOL)_languageIsCJK;
- (BOOL)_languageIsNBSC;
- (BOOL)_shouldIncludeServiceNameForSpokenBrailleRotorAnnouncementOfTable:(id)a3 rotorItems:(id)a4 locale:(id)a5;
- (BOOL)_supportsMode:(int64_t)a3;
- (BOOL)autoAdvanceEnabled;
- (BOOL)bluetoothBrailleDisplayConnected;
- (BOOL)brailleEnabled;
- (BOOL)handleCommandIfActiveBrailleRelated:(id)a3;
- (BOOL)handleKeyboardPerkinsInput:(id)a3 chordOnly:(BOOL)a4;
- (BOOL)handleShowOnscreenKeyboardToggle;
- (BOOL)hasActiveBrailleDisplay;
- (BOOL)panEnabled;
- (BOOL)statusCellShowsGeneral;
- (BOOL)statusCellShowsText;
- (BOOL)testingBrailleElementLocked;
- (BOOL)testingHasActiveDisplay;
- (BOOL)testingKeyboardHelpIsOn;
- (BOOL)usesBrailleSubstitutions;
- (BRLTTable)brailleInputTableFromSettings;
- (BRLTTable)brailleTableFromSettings;
- (NSArray)testingTextShortcuts;
- (NSArray)textReplacementEntries;
- (NSAttributedString)testingMainAttributedString;
- (NSString)brailleSubstitutionLanguage;
- (SCROBrailleClient)testingBrailleClient;
- (VOTBrailleManager)init;
- (VOTElement)brailleElement;
- (VOTElement)previousElement;
- (VOTElement)previousTouchContainer;
- (_NSRange)brailleLineRange;
- (_NSRange)rangeOfCellRepresentingCharacterAtIndex:(int64_t)a3;
- (double)lastUserInteractionTime;
- (double)threadWaitTime;
- (id)_defaultLanguageRotorItem;
- (id)_localeIdentifierForCurrentInputTable;
- (id)_localeIdentifierForCurrentTable;
- (id)_localeIdentifierForTableIdentifier:(id)a3;
- (id)_tableIdentifierFromDefaultRotorItem:(id)a3 forLocale:(id)a4;
- (id)adjustBrailleInputLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4;
- (id)adjustBrailleLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4;
- (id)adjustBrailleLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4 input:(BOOL)a5;
- (id)brailleStringSetCallback;
- (id)currentBrailleTableIdentifier;
- (id)elementSetCallback;
- (id)keypressCallback;
- (id)nameForSpokenAnnouncementOfBrailleTable:(id)a3;
- (id)tableSetCallback;
- (id)testingAggregatedStatus;
- (id)testingBrailleElement;
- (int)lastRefreshTrigger;
- (int64_t)_adjustedRotorIndex:(int64_t)a3 inDirection:(int64_t)a4 rotorItems:(id)a5;
- (int64_t)_indexOfBrailleTable:(id)a3 inRotorItems:(id)a4;
- (int64_t)bookCursorPosition;
- (int64_t)inputContractionMode;
- (int64_t)numberOfTextLinesInPlanarBraille;
- (int64_t)outputContractionMode;
- (int64_t)trailingBookCursorPosition;
- (unint64_t)testingBrailleElementIndex;
- (unsigned)persistentKeyModifiers;
- (void)_dispatchBrailleDidPanWithSuccess:(id)a3 elementToken:(id)a4 appToken:(id)a5 direction:(id)a6 lineOffset:(id)a7;
- (void)_dispatchPlanarPanFailedIsLeft:(id)a3;
- (void)_displayBrailleElementHint;
- (void)_exitDisplayMode;
- (void)_filterUnacceptableBrailleStrings:(id)a3;
- (void)_handleBrailleAnnouncementModeOn:(id)a3;
- (void)_handleBrailleConfigurationChanged:(id)a3;
- (void)_handleBrailleKeypress:(id)a3;
- (void)_handleBrailleNextInputTable:(id)a3;
- (void)_handleBrailleNextOutputTable:(id)a3;
- (void)_handleBraillePanBeginning:(id)a3;
- (void)_handleBraillePanEnd:(id)a3;
- (void)_handleBraillePanLeft:(id)a3;
- (void)_handleBraillePanRight:(id)a3;
- (void)_handleBraillePlayBorderHitSound;
- (void)_handleBraillePlayCommandNotSupportedSound;
- (void)_handleBraillePlayDisplayConnectionSound:(id)a3;
- (void)_handleBrailleReplaceTextRange:(id)a3 withString:(id)a4 cursor:(id)a5;
- (void)_handleBrailleRouter:(id)a3;
- (void)_handleBrailleStatusRouter:(id)a3;
- (void)_handleBrailleTable:(id)a3 input:(BOOL)a4;
- (void)_handleDisplayModeChanged:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)_handleStatusRouterForIndex:(int64_t)a3;
- (void)_initializeCommands;
- (void)_initializeExpandedStatusCellDictionaries;
- (void)_initiateScrodConnection;
- (void)_refreshBrailleLine;
- (void)_refreshBrailleLinePreferringPositionOverRotorSelection:(BOOL)a3 knownLineRange:(BOOL)a4 updatedPosition:(id)a5;
- (void)_refreshBrailleLinePreferringPositionOverRotorSelection:(BOOL)a3 knownLineRange:(BOOL)a4 updatedPosition:(id)a5 updateBrailleElement:(BOOL)a6;
- (void)_resetBrailleCursor;
- (void)_setAutomaticBrailleTranslationEnabled:(BOOL)a3;
- (void)_setBrailleElement:(id)a3 resetBrailleCursor:(id)a4 rotorSelection:(id)a5;
- (void)_setBrailleInputTable:(id)a3;
- (void)_setBrailleString:(id)a3 type:(id)a4 timeout:(id)a5 priority:(id)a6 langCode:(id)a7 brailleLineRangeValue:(id)a8;
- (void)_setBrailleSubstitutionLanguage:(id)a3;
- (void)_setBrailleTable:(id)a3;
- (void)_setCurrentDefaultTable:(id)a3;
- (void)_setInputContractionMode:(int)a3;
- (void)_textShortcutsDidChange;
- (void)_thread_initiateScrodConnection;
- (void)_updateBrailleAutoAdvancePrefs;
- (void)_updateBrailleKeyDebouncePrefs;
- (void)_updateHelpEnabled;
- (void)_updateOnscreenKeyboardSettings;
- (void)_updatePrefersNonBlinkingCursorIndicatorPrefs;
- (void)_updateRealtimeElementStatus;
- (void)_updateRealtimeElementStatusFromTimer;
- (void)_updateStatusCellPrefs;
- (void)_updateStatusCells;
- (void)_updateTactileGraphicsDisplays;
- (void)_updateWordWrapPrefs;
- (void)_waitForBrailleClientConnection;
- (void)announceBrailleTable:(id)a3 isDefault:(BOOL)a4;
- (void)applyBrailleSubstitutions:(id)a3;
- (void)configureForUnitTesting;
- (void)dealloc;
- (void)handleBrailleConfigurationChanged:(id)a3;
- (void)handleBrailleDeletedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4;
- (void)handleBrailleDidDisconnect:(id)a3;
- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6;
- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6;
- (void)handleBrailleDidReconnect:(id)a3;
- (void)handleBrailleDidShowNextAnnouncement:(id)a3;
- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3;
- (void)handleBrailleDisplayCopyStringToClipboard:(id)a3;
- (void)handleBrailleInsertedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4;
- (void)handleBrailleKeypress:(id)a3;
- (void)handleBraillePlayBorderHitSound;
- (void)handleBraillePlayCommandNotSupportedSound;
- (void)handleBraillePlayDisplayConnectionSound:(id)a3;
- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5;
- (void)handleBrailleSpeechRequest:(id)a3 language:(id)a4;
- (void)handleBrailleStartEditing;
- (void)handleDisplayModeChanged:(id)a3;
- (void)handleEvent:(id)a3;
- (void)handleKeyboardChanged;
- (void)handlePlanarPanFailedIsLeft:(BOOL)a3;
- (void)handleSettingsChange:(id)a3;
- (void)handleUserEventOccured;
- (void)refreshBrailleForTerminalCommand:(id)a3 cursor:(int64_t)a4;
- (void)refreshBrailleForTerminalOutput:(id)a3;
- (void)refreshBrailleLine;
- (void)resetTestingAggregatedStatus;
- (void)setAutoAdvanceEnabled:(BOOL)a3;
- (void)setBookCursorPosition:(int64_t)a3;
- (void)setBrailleElement:(id)a3;
- (void)setBrailleElement:(id)a3 resetBrailleCursor:(BOOL)a4 rotorSelection:(id)a5;
- (void)setBrailleInputTableFromSettings:(id)a3;
- (void)setBrailleMap:(id)a3;
- (void)setBrailleString:(id)a3 type:(int)a4 timeout:(double)a5 langCode:(id)a6 brailleLineRange:(_NSRange)a7 isBrailleLineRangeKnown:(BOOL)a8;
- (void)setBrailleStringSetCallback:(id)a3;
- (void)setBrailleSubstitutionLanguage:(id)a3;
- (void)setBrailleTableFromSettings:(id)a3;
- (void)setElementSetCallback:(id)a3;
- (void)setKeypressCallback:(id)a3;
- (void)setLastRefreshTrigger:(int)a3;
- (void)setLastUserInteractionTime:(double)a3;
- (void)setPanEnabled:(BOOL)a3;
- (void)setPersistentKeyModifiers:(unsigned int)a3;
- (void)setPlanarData:(id)a3;
- (void)setPreviousElement:(id)a3;
- (void)setPreviousTouchContainer:(id)a3;
- (void)setSingleLetterQuickNavOn:(BOOL)a3;
- (void)setTableSetCallback:(id)a3;
- (void)setTestingBrailleClient:(id)a3;
- (void)setTestingBrailleElementLocked:(BOOL)a3;
- (void)setTestingHasActiveDisplay:(BOOL)a3;
- (void)setTestingTextShortcuts:(id)a3;
- (void)setTextSearchModeOn:(BOOL)a3;
- (void)setThreadWaitTime:(double)a3;
- (void)setTrailingBookCursorPosition:(int64_t)a3;
- (void)setUsesBrailleSubstitutions:(BOOL)a3;
- (void)testingExitDisplayMode;
- (void)textShortcutsDidChange;
- (void)unitTestHandleBrailleKeypress:(id)a3;
- (void)updateBrailleAutoAdvancePrefs;
- (void)updateBrailleInputSettings;
- (void)updateBrailleLanguage;
- (void)updateBrailleOutputSettings;
- (void)updatePrefersNonBlinkingCursorIndicatorPrefs;
- (void)updateRealtimeElements:(id)a3;
- (void)updateStatusCellPrefs;
- (void)updateUsesNemethForMath;
@end

@implementation VOTBrailleManager

+ (id)manager
{
  if (AXDeviceIsAudioAccessory())
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1001EBAD0 != -1) {
      dispatch_once(&qword_1001EBAD0, &stru_1001B6600);
    }
    id v2 = (id)qword_1001EBAC8;
  }

  return v2;
}

+ (double)currentDefaultBrailleAlertTimeout
{
  id v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 voiceOverBrailleAlertShowUntilDismissed];

  if (v3) {
    return 1.79769313e308;
  }
  v5 = +[AXSettings sharedInstance];
  [v5 voiceOverBrailleAlertDisplayDuration];
  double v7 = v6;

  return v7;
}

- (VOTBrailleManager)init
{
  v70.receiver = self;
  v70.super_class = (Class)VOTBrailleManager;
  id v2 = [(VOTBrailleManager *)&v70 init];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    [(VOTBrailleManager *)v2 setThreadWaitTime:kSCRCThreadNoWait];
    v4 = objc_alloc_init(_VOTBrailleManagerStatus);
    status = v3->_status;
    v3->_status = v4;

    double v6 = (SCRCThreadKey *)[objc_allocWithZone((Class)SCRCThreadKey) initWithObject:v3];
    threadKey = v3->_threadKey;
    v3->_threadKey = v6;

    [(VOTBrailleManager *)v3 setUsesBrailleSubstitutions:1];
    v8 = (NSMutableCharacterSet *)[objc_allocWithZone((Class)NSMutableCharacterSet) init];
    delimiters = v3->_delimiters;
    v3->_delimiters = v8;

    v10 = v3->_delimiters;
    v11 = +[NSCharacterSet whitespaceCharacterSet];
    [(NSMutableCharacterSet *)v10 formUnionWithCharacterSet:v11];

    v12 = v3->_delimiters;
    v13 = +[NSCharacterSet punctuationCharacterSet];
    [(NSMutableCharacterSet *)v12 formUnionWithCharacterSet:v13];

    v14 = (AXIndexMap *)[objc_allocWithZone((Class)AXIndexMap) init];
    commands = v3->_commands;
    v3->_commands = v14;

    [(VOTBrailleManager *)v3 _initializeCommands];
    [(VOTBrailleManager *)v3 _updateStatusCellPrefs];
    [(VOTBrailleManager *)v3 performSelector:"updateBrailleLanguage" withObject:0 afterDelay:1.0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_1000D04D8, kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, v3, (CFNotificationCallback)sub_1000D04F0, kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_initWeak(&location, v3);
    v18 = +[AXSettings sharedInstance];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1000D0508;
    v67[3] = &unk_1001B35A8;
    objc_copyWeak(&v68, &location);
    [v18 registerUpdateBlock:v67 forRetrieveSelector:"voiceOverBrailleGradeTwoAutoTranslateEnabled" withListener:v3];

    objc_destroyWeak(&v68);
    v19 = +[AXSettings sharedInstance];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000D0548;
    v65[3] = &unk_1001B35A8;
    objc_copyWeak(&v66, &location);
    [v19 registerUpdateBlock:v65 forRetrieveSelector:"voiceOverTouchBrailleDisplayInputMode" withListener:v3];

    objc_destroyWeak(&v66);
    v20 = +[AXSettings sharedInstance];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000D0588;
    v63[3] = &unk_1001B35A8;
    objc_copyWeak(&v64, &location);
    [v20 registerUpdateBlock:v63 forRetrieveSelector:"voiceOverTouchBrailleDisplayOutputMode" withListener:v3];

    objc_destroyWeak(&v64);
    v21 = +[AXSettings sharedInstance];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000D05C8;
    v61[3] = &unk_1001B35A8;
    objc_copyWeak(&v62, &location);
    id v22 = objc_loadWeakRetained(&location);
    [v21 registerUpdateBlock:v61 forRetrieveSelector:"voiceOverShowSoftwareKeyboardWithBraille" withListener:v22];

    objc_destroyWeak(&v62);
    v23 = +[AXSettings sharedInstance];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_1000D0608;
    v59[3] = &unk_1001B35A8;
    objc_copyWeak(&v60, &location);
    [v23 registerUpdateBlock:v59 forRetrieveSelector:"voiceOverTouchBrailleShowTextStyleStatus" withListener:v3];

    objc_destroyWeak(&v60);
    v24 = +[AXSettings sharedInstance];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000D0648;
    v57[3] = &unk_1001B35A8;
    objc_copyWeak(&v58, &location);
    [v24 registerUpdateBlock:v57 forRetrieveSelector:"voiceOverTouchBrailleShowGeneralStatus" withListener:v3];

    objc_destroyWeak(&v58);
    v25 = +[AXSettings sharedInstance];
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000D0688;
    v55[3] = &unk_1001B35A8;
    objc_copyWeak(&v56, &location);
    [v25 registerUpdateBlock:v55 forRetrieveSelector:"voiceOverBrailleWordWrapEnabled" withListener:v3];

    objc_destroyWeak(&v56);
    v26 = +[AXSettings sharedInstance];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000D06C8;
    v53[3] = &unk_1001B35A8;
    objc_copyWeak(&v54, &location);
    [v26 registerUpdateBlock:v53 forRetrieveSelector:"voiceOverBrailleKeyDebounceTimeout" withListener:v3];

    objc_destroyWeak(&v54);
    v27 = +[AXSettings sharedInstance];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000D0708;
    v51[3] = &unk_1001B35A8;
    objc_copyWeak(&v52, &location);
    [v27 registerUpdateBlock:v51 forRetrieveSelector:"voiceOverTouchUpdateBrailleWithoutConnectedDisplay" withListener:v3];

    objc_destroyWeak(&v52);
    v28 = +[AXSettings sharedInstance];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000D0774;
    v49[3] = &unk_1001B35A8;
    objc_copyWeak(&v50, &location);
    [v28 registerUpdateBlock:v49 forRetrieveSelector:"voiceOverBrailleAutoAdvanceDuration" withListener:v3];

    objc_destroyWeak(&v50);
    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v3 selector:"_updateHelpEnabled" name:@"VOTHelpEnabledChangedNotification" object:0];

    [(VOTBrailleManager *)v3 _updateHelpEnabled];
    v3->_lastBraillePanDirection = -1;
    v3->_lastRefreshTrigger = 0;
    v3->_bookCursorPosition = -1;
    v3->_trailingBookCursorPosition = -1;
    v30 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v3 selector:"_displayBrailleElementHint" threadKey:v3->_threadKey];
    hintTimer = v3->_hintTimer;
    v3->_hintTimer = v30;

    v32 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v3 selector:"_updateRealtimeElementStatusFromTimer" threadKey:v3->_threadKey];
    updateRealtimeStatusTimer = v3->_updateRealtimeStatusTimer;
    v3->_updateRealtimeStatusTimer = v32;

    [(VOTBrailleManager *)v3 _resetBrailleCursor];
    v34 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    brailleClientConnectionCondition = v3->_brailleClientConnectionCondition;
    v3->_brailleClientConnectionCondition = v34;

    v36 = +[VOTPlanarBrailleManager manager];
    [v36 setDelegate:v3];

    v37 = (_KSTextReplacementClientStore *)objc_alloc_init((Class)_KSTextReplacementClientStore);
    textReplacementStore = v3->_textReplacementStore;
    v3->_textReplacementStore = v37;

    uint64_t v39 = [(_KSTextReplacementClientStore *)v3->_textReplacementStore textReplacementEntries];
    textReplacementEntries = v3->_textReplacementEntries;
    v3->_textReplacementEntries = (NSArray *)v39;

    v41 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v41, v3, (CFNotificationCallback)sub_1000D07B4, KSTextReplacementDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
    v42 = +[AXSettings sharedInstance];
    LODWORD(v13) = [v42 voiceOverTouchUpdateBrailleWithoutConnectedDisplay];

    if (v13) {
      v3->_hasActiveDisplay = 1;
    }
    v3->_panEnabled = 1;
    v3->_lastPanTime = 0.0;
    uint64_t v43 = objc_opt_new();
    keyboardVirtualDisplayLock = v3->_keyboardVirtualDisplayLock;
    v3->_keyboardVirtualDisplayLock = (NSLock *)v43;

    uint64_t v45 = objc_opt_new();
    keyboardVirtualDisplayDownKeys = v3->_keyboardVirtualDisplayDownKeys;
    v3->_keyboardVirtualDisplayDownKeys = (NSMutableSet *)v45;

    [(VOTBrailleManager *)v3 _initiateScrodConnection];
    v47 = v3;
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  [(SCRCTargetSelectorTimer *)self->_updateRealtimeStatusTimer invalidate];
  [(SCRCTargetSelectorTimer *)self->_hintTimer invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)VOTBrailleManager;
  [(VOTBrailleManager *)&v4 dealloc];
}

- (void)_initiateScrodConnection
{
}

- (void)_thread_initiateScrodConnection
{
  unsigned __int8 v3 = VOTLogBraille();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initiate scrod connection; create _brailleClient",
      buf,
      2u);
  }

  objc_super v4 = (SCROBrailleClient *)[objc_allocWithZone((Class)SCROBrailleClient) initWithDelegate:self];
  brailleClient = self->_brailleClient;
  self->_brailleClient = v4;

  [(SCROBrailleClient *)self->_brailleClient setKeepConnectionAlive:1];
  [(VOTBrailleManager *)self _waitForBrailleClientConnection];
  [(SCROBrailleClient *)self->_brailleClient setDisplayDescriptorCallbackEnabled:0];
  [(VOTBrailleManager *)self updateBrailleInputSettings];
  [(VOTBrailleManager *)self updateBrailleOutputSettings];
  [(VOTBrailleManager *)self _updateWordWrapPrefs];
  [(VOTBrailleManager *)self _updateBrailleKeyDebouncePrefs];
  [(VOTBrailleManager *)self _updateBrailleAutoAdvancePrefs];
  [(VOTBrailleManager *)self _updatePrefersNonBlinkingCursorIndicatorPrefs];
  [(VOTBrailleManager *)self _setBrailleTable:self->_currentDefaultTable];
  [(VOTBrailleManager *)self _setBrailleInputTable:self->_currentDefaultTable];
  [(VOTBrailleManager *)self updateUsesNemethForMath];
  [(VOTBrailleManager *)self bluetoothBrailleDisplayConnected];
  _AXSBrailleInputDeviceSetConnected();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000D0A54, kSCRODisplayConfigurationChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  [(VOTBrailleManager *)self _handleBrailleConfigurationChanged:&__kCFBooleanTrue];
  double v7 = VOTLogBraille();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Posting kAXSVoiceOverTouchBrailleReconnectionTriggeredNotification", v9, 2u);
  }

  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v8, kAXSVoiceOverTouchBrailleReconnectionTriggeredNotification, 0, 0, 1u);
  VOSCrystalMigrateBrailleTableReplacements();
  VOSRepairBrailleTableSettings();
}

- (void)textShortcutsDidChange
{
}

- (void)_textShortcutsDidChange
{
  unsigned __int8 v3 = [(_KSTextReplacementClientStore *)self->_textReplacementStore textReplacementEntries];
  textReplacementEntries = self->_textReplacementEntries;
  self->_textReplacementEntries = v3;

  _objc_release_x1(v3, textReplacementEntries);
}

- (void)updateBrailleOutputSettings
{
  id v2 = [(id)VOTSharedWorkspace activeBrailleOutputPreference];
  unsigned __int8 v3 = AXLogBrailleHW();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Braille output updated: %d", (uint8_t *)v4, 8u);
  }

  if (v2 == (id)3)
  {
    if (!_AXSVoiceOverTouchBrailleContractionMode()) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v2 != (id)2)
  {
    if (v2 != (id)1) {
      return;
    }
    if (_AXSVoiceOverTouchBrailleContractionMode() == 1)
    {
LABEL_10:
      if (!_AXSVoiceOverTouchBrailleEightDotMode()) {
        return;
      }
      goto LABEL_15;
    }
LABEL_9:
    _AXSVoiceOverTouchSetBrailleContractionMode();
    goto LABEL_10;
  }
  if (_AXSVoiceOverTouchBrailleContractionMode() != 1) {
    _AXSVoiceOverTouchSetBrailleContractionMode();
  }
  if (_AXSVoiceOverTouchBrailleEightDotMode() != 1) {
LABEL_15:
  }
    _AXSVoiceOverTouchSetBrailleEightDotMode();
}

- (void)updateBrailleInputSettings
{
  id v3 = [(id)VOTSharedWorkspace activeBrailleInputPreference];
  objc_super v4 = AXLogBrailleHW();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Braille input updated: %d", (uint8_t *)v6, 8u);
  }

  [(VOTBrailleManager *)self _setInputContractionMode:v3 != (id)3];
  v5 = +[AXSettings sharedInstance];
  -[VOTBrailleManager _setAutomaticBrailleTranslationEnabled:](self, "_setAutomaticBrailleTranslationEnabled:", [v5 voiceOverBrailleGradeTwoAutoTranslateEnabled]);
}

- (void)_setInputContractionMode:(int)a3
{
  if (self->_cachedContractionMode != a3)
  {
    self->_cachedContractionMode = a3;
    -[SCROBrailleClient setInputContractionMode:](self->_brailleClient, "setInputContractionMode:");
  }
}

- (void)_setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  if (self->_cachedAutoBrailleTranslationEnabled != a3)
  {
    self->_cachedAutoBrailleTranslationEnabled = a3;
    -[SCROBrailleClient setAutomaticBrailleTranslationEnabled:](self->_brailleClient, "setAutomaticBrailleTranslationEnabled:");
  }
}

- (void)_waitForBrailleClientConnection
{
  [(NSCondition *)self->_brailleClientConnectionCondition lock];
  if (([(SCROBrailleClient *)self->_brailleClient isConnected] & 1) == 0)
  {
    brailleClientConnectionCondition = self->_brailleClientConnectionCondition;
    objc_super v4 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
    [(NSCondition *)brailleClientConnectionCondition waitUntilDate:v4];
  }
  v5 = self->_brailleClientConnectionCondition;

  [(NSCondition *)v5 unlock];
}

- (void)updateRealtimeElements:(id)a3
{
  self->_lastRealtimeUpdate = CFAbsoluteTimeGetCurrent();
}

- (void)_updateRealtimeElementStatusFromTimer
{
  [(VOTBrailleManager *)self _updateRealtimeElementStatus];
  status = self->_status;
  objc_super v4 = (char *)[(_VOTBrailleManagerStatus *)status realtimeSpinnerCount] + 1;

  [(_VOTBrailleManagerStatus *)status setRealtimeSpinnerCount:v4];
}

- (void)_updateRealtimeElementStatus
{
  id v3 = [(VOTElement *)self->_brailleElement application];
  objc_super v4 = [v3 realtimeElements];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v6)
  {
    unsigned __int8 v8 = 0;
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  id v7 = v6;
  unsigned __int8 v8 = 0;
  unsigned __int8 v9 = 0;
  uint64_t v10 = *(void *)v22;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (!-[VOTElement isEqual:](self->_brailleElement, "isEqual:", v12, (void)v21))
      {
        if (v9)
        {
          unsigned __int8 v9 = 1;
          if ((v8 & 1) == 0) {
            goto LABEL_9;
          }
        }
        else
        {
          unsigned __int8 v9 = [v12 realtimeElementUnread];
          if ((v8 & 1) == 0)
          {
LABEL_9:
            unsigned __int8 v8 = [v12 realtimeElementCompleted];
            continue;
          }
        }
        unsigned __int8 v8 = 1;
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v7);
LABEL_16:

  -[_VOTBrailleManagerStatus setShowRealtime:](self->_status, "setShowRealtime:", [v5 count] != 0);
  if ((v9 & 1) == 0)
  {
    [(_VOTBrailleManagerStatus *)self->_status setRealtimeBlinking:0];
    LOBYTE(v17) = 0;
    goto LABEL_34;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  status = self->_status;
  if ((Current - self->_lastRealtimeUpdate > 3.0) | v8 & 1)
  {
    unsigned int v15 = [(_VOTBrailleManagerStatus *)status realtimeBlinking];
    v16 = self->_status;
    if (v15)
    {
      [(_VOTBrailleManagerStatus *)self->_status setRealtimeBlinkIsUp:[(_VOTBrailleManagerStatus *)v16 realtimeBlinkIsUp] ^ 1];
    }
    else
    {
      [(_VOTBrailleManagerStatus *)v16 setRealtimeBlinking:1];
      [(_VOTBrailleManagerStatus *)self->_status setRealtimeBlinkIsUp:1];
      [(_VOTBrailleManagerStatus *)self->_status setRealtimeSpinnerCount:0];
    }
  }
  else
  {
    [(_VOTBrailleManagerStatus *)status setRealtimeBlinking:0];
  }
  if (([(SCRCTargetSelectorTimer *)self->_updateRealtimeStatusTimer isPending] & 1) == 0) {
    [(SCRCTargetSelectorTimer *)self->_updateRealtimeStatusTimer dispatchAfterDelay:0.5];
  }
  [(_VOTBrailleManagerStatus *)self->_status setRealtime:0];
  unsigned int v18 = [(_VOTBrailleManagerStatus *)self->_status realtimeBlinking];
  v19 = self->_status;
  if (v18)
  {
    if ([(_VOTBrailleManagerStatus *)v19 realtimeBlinkIsUp])
    {
      [(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 2];
      [(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 4];
      [(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 0x10];
      [(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 0x20];
      if (v8)
      {
        [(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 1];
        [(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 8];
        [(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 0x40];
        unsigned int v17 = [(_VOTBrailleManagerStatus *)self->_status realtime] | 0xFFFFFF80;
        goto LABEL_34;
      }
    }
  }
  else
  {
    unint64_t v20 = [(_VOTBrailleManagerStatus *)v19 realtimeSpinnerCount] & 3;
    if ((!v20
       || ([(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 2], v20 != 1))&& ([(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 0x10], v20 == 2)|| ([(_VOTBrailleManagerStatus *)self->_status setRealtime:[(_VOTBrailleManagerStatus *)self->_status realtime] | 0x20], v20 != 3))
    {
      unsigned int v17 = [(_VOTBrailleManagerStatus *)self->_status realtime] | 4;
LABEL_34:
      -[_VOTBrailleManagerStatus setRealtime:](self->_status, "setRealtime:", v17, (void)v21);
    }
  }
  [(VOTBrailleManager *)self _updateStatusCells];
}

- (BOOL)hasActiveBrailleDisplay
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(SCROBrailleClient *)self->_brailleClient driverConfiguration];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([(VOTBrailleManager *)self _isActiveUserDisplayConfig:v8])
        {
          unsigned __int8 v9 = [v8 objectForKey:kSCROBrailleDisplayPostsKeyboardEvents];
          unsigned __int8 v10 = [v9 BOOLValue];

          if (v10)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (id)adjustBrailleLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4
{
  return [(VOTBrailleManager *)self adjustBrailleLanguageRotorInDirection:a3 isDefault:a4 input:0];
}

- (id)adjustBrailleInputLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4
{
  return [(VOTBrailleManager *)self adjustBrailleLanguageRotorInDirection:a3 isDefault:a4 input:1];
}

- (id)adjustBrailleLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4 input:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned __int8 v9 = [(id)VOTSharedWorkspace brailleLanguageRotorItems];
  unsigned __int8 v10 = objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &stru_1001B6640);

  if (v5) {
    [(id)VOTSharedWorkspace selectedBrailleInputTable];
  }
  else {
  BOOL v11 = [(id)VOTSharedWorkspace selectedBrailleTable];
  }
  id v12 = [v10 count];
  long long v13 = VOTLogBraille();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      long long v15 = [v10 debugDescription];
      int v31 = 134218498;
      int64_t v32 = a3;
      __int16 v33 = 2112;
      v34 = v11;
      __int16 v35 = 2112;
      v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Handling braille language rotor movement. dir:%ld selected:%@, items:%@", (uint8_t *)&v31, 0x20u);
    }
    long long v16 = objc_msgSend(v10, "objectAtIndexedSubscript:", -[VOTBrailleManager _adjustedRotorIndex:inDirection:rotorItems:](self, "_adjustedRotorIndex:inDirection:rotorItems:", -[VOTBrailleManager _indexOfBrailleTable:inRotorItems:](self, "_indexOfBrailleTable:inRotorItems:", v11, v10), a3, v10));
    unsigned int v17 = [v16 objectForKeyedSubscript:@"RotorItem"];
    unsigned int v18 = VOSBrailleTableForRotorItem();
    v19 = [v18 tableIdentifier];

    if (v5) {
      [(id)VOTSharedWorkspace setSelectedBrailleInputTable:v18];
    }
    else {
      [(id)VOTSharedWorkspace setSelectedBrailleTable:v18];
    }
    long long v21 = [(id)VOTSharedWorkspace applicationForCurrentElement];
    long long v22 = +[AXSettings sharedInstance];
    unsigned int v23 = [v22 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    long long v24 = [v21 activeKeyboard];

    if (v24 && v23 | v5)
    {
      v25 = [v21 currentSoftwareKeyboardLanguage];
      v26 = [v21 currentSoftwareKeyboardLayout];
      v27 = +[AXSettings sharedInstance];
      [v27 setPreferredBrailleTableIdentifier:v19 forKeyboardLanguage:v25 keyboardLayout:v26];
    }
    v28 = +[VOTBrailleManager manager];
    v29 = v28;
    if (v5) {
      [v28 brailleInputTableFromSettings];
    }
    else {
    unint64_t v20 = [v28 brailleTableFromSettings];
    }
  }
  else
  {
    if (v14)
    {
      int v31 = 134218242;
      int64_t v32 = a3;
      __int16 v33 = 2112;
      v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Handling braille language rotor movement with empty braille language list. dir:%ld selected:%@", (uint8_t *)&v31, 0x16u);
    }

    unint64_t v20 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v20;
}

- (void)announceBrailleTable:(id)a3 isDefault:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)VOTSharedWorkspace;
  id v7 = a3;
  id v14 = [v6 brailleLanguageRotorItems];
  unsigned __int8 v8 = +[AXLanguageManager sharedInstance];
  unsigned __int8 v9 = [v8 userLocale];
  LOBYTE(self) = [(VOTBrailleManager *)self _shouldIncludeServiceNameForSpokenBrailleRotorAnnouncementOfTable:v7 rotorItems:v14 locale:v9];

  if (self) {
    [v7 localizedNameWithService];
  }
  else {
  unsigned __int8 v10 = [v7 localizedName];
  }

  if (v4)
  {
    BOOL v11 = sub_100051804(off_1001EA9E8, @"default.language.format", 0);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v10;
  }
  long long v13 = +[VOTOutputManager outputManager];
  [v13 speakSimpleString:v12];
}

- (int64_t)_indexOfBrailleTable:(id)a3 inRotorItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    int64_t v7 = 0;
    while (1)
    {
      unsigned __int8 v8 = [v6 objectAtIndexedSubscript:v7];
      unsigned __int8 v9 = v8;
      if (!v5)
      {
        unsigned __int8 v10 = [v8 objectForKeyedSubscript:@"Default"];
        unsigned int v11 = [v10 BOOLValue];

        if (v11) {
          break;
        }
      }
      id v12 = [v9 objectForKeyedSubscript:@"RotorItem"];
      long long v13 = [v5 identifier];
      unsigned int v14 = [v12 isEqualToString:v13];

      if (v14) {
        goto LABEL_8;
      }
      if ((unint64_t)[v6 count] <= ++v7) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    int64_t v7 = 0;
  }
LABEL_8:

  return v7;
}

- (BOOL)_shouldIncludeServiceNameForSpokenBrailleRotorAnnouncementOfTable:(id)a3 rotorItems:(id)a4 locale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v29 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0;
    id v28 = v10;
    while (1)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(obj);
      }
      long long v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
      unsigned int v14 = objc_msgSend(v13, "objectForKeyedSubscript:", @"Default", v28);
      unsigned int v15 = [v14 BOOLValue];

      if (v15)
      {
        long long v16 = [v13 objectForKeyedSubscript:@"LanguageDefaults"];
        unsigned int v17 = [v29 localeIdentifier];
        unsigned int v18 = [v16 objectForKeyedSubscript:v17];

        if (!v18)
        {
          id v19 = 0;
          goto LABEL_15;
        }
        id v19 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v18];
      }
      else
      {
        id v20 = objc_alloc((Class)BRLTTable);
        long long v16 = [v13 objectForKeyedSubscript:@"RotorItem"];
        id v19 = [v20 initWithIdentifier:v16];
      }

      long long v16 = [v19 serviceIdentifier];
      long long v21 = [v7 serviceIdentifier];
      if (![v16 isEqualToString:v21])
      {
        long long v22 = v19;
        unsigned int v23 = [v19 localizedName];
        id v24 = v7;
        v25 = [v7 localizedName];
        unsigned int v31 = [v23 isEqualToString:v25];

        if (v31)
        {

          BOOL v26 = 1;
          id v7 = v24;
          goto LABEL_20;
        }
        id v7 = v24;
        id v10 = v28;
        id v19 = v22;
        goto LABEL_16;
      }

LABEL_15:
LABEL_16:

      if (v10 == (id)++v12)
      {
        id v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL v26 = 0;
LABEL_20:

  return v26;
}

- (id)nameForSpokenAnnouncementOfBrailleTable:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)VOTSharedWorkspace brailleLanguageRotorItems];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = (char *)[v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v23 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = VOSBrailleTableForRotorItem();
        uint64_t v11 = [v3 identifier];
        uint64_t v12 = [v10 identifier];
        unsigned __int8 v13 = [v11 isEqualToString:v12];

        if ((v13 & 1) == 0)
        {
          unsigned int v14 = [v10 localizedLanguage];
          unsigned int v15 = [v3 localizedLanguage];
          unsigned int v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            unsigned int v17 = [v10 localizedName];
            unsigned int v18 = [v3 localizedName];
            unsigned __int8 v19 = [v17 isEqualToString:v18];

            v7 |= v19;
            LOBYTE(v23) = 1;
          }
          else
          {
            BYTE4(v23) = 1;
          }
        }
      }
      id v6 = (char *)[v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
    if (v7)
    {
      uint64_t v20 = [v3 localizedNameWithService];
      goto LABEL_19;
    }
    if ((v23 & 0x100000000) != 0)
    {
      if (v23) {
        [v3 localizedName];
      }
      else {
      uint64_t v20 = [v3 localizedLanguage];
      }
      goto LABEL_19;
    }
  }
  uint64_t v20 = [v3 localizedVariant];
LABEL_19:
  long long v21 = (void *)v20;

  return v21;
}

- (int64_t)_adjustedRotorIndex:(int64_t)a3 inDirection:(int64_t)a4 rotorItems:(id)a5
{
  if (a4 == 2) {
    int64_t v5 = a3 - 1;
  }
  else {
    int64_t v5 = a3 + 1;
  }
  id v6 = [a5 count];
  if (v5 >= (unint64_t)v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = v5;
  }
  if (v5 >= 0) {
    return v7;
  }
  else {
    return (int64_t)v6 - 1;
  }
}

- (void)handleKeyboardChanged
{
  if ([(VOTElement *)self->_brailleElement doesHaveAllTraits:kAXTextEntryTrait | kAXIsEditingTrait])
  {
    id v13 = [(id)VOTSharedWorkspace applicationForCurrentElement];
    id v3 = [v13 currentSoftwareKeyboardLanguage];
    BOOL v4 = [v13 currentSoftwareKeyboardLayout];
    int64_t v5 = +[AXSettings sharedInstance];
    id v6 = [v5 preferredBrailleTableIdentifierForKeyboardLanguage:v3 keyboardLayout:v4];

    if (v6)
    {
      int64_t v7 = [(BRLTTable *)self->_currentSetTable tableIdentifier];
      unsigned __int8 v8 = [v6 isEqualToString:v7];

      if ((v8 & 1) == 0)
      {
        id v9 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v6];
        if (v9) {
          [(VOTBrailleManager *)self _setBrailleTable:v9];
        }
      }
      id v10 = [(BRLTTable *)self->_currentSetInputTable tableIdentifier];
      unsigned __int8 v11 = [v6 isEqualToString:v10];

      if ((v11 & 1) == 0)
      {
        id v12 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v6];
        if (v12) {
          [(VOTBrailleManager *)self _setBrailleInputTable:v12];
        }
      }
    }
  }
}

- (void)updateBrailleLanguage
{
  if (([(id)VOTSharedWorkspace inUnitTestMode] & 1) == 0)
  {
    VOSCrystalMigrateBrailleTableReplacements();
    id v3 = +[AXSettings sharedInstance];
    BOOL v4 = [v3 voiceOverTouchBrailleDisplayOutputTableIdentifier];

    if (v4)
    {
      id v5 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v4];
      [(id)VOTSharedWorkspace setSelectedBrailleTable:v5];
    }
    id v6 = +[AXSettings sharedInstance];
    int64_t v7 = [v6 voiceOverTouchBrailleDisplayInputTableIdentifier];

    if (v7)
    {
      id v8 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v7];
      [(id)VOTSharedWorkspace setSelectedBrailleInputTable:v8];
    }
  }
  id v9 = [(id)VOTSharedWorkspace systemSpokenLanguage];
  id v10 = +[VOTBrailleManager manager];
  unsigned __int8 v11 = [v10 brailleTableFromSettings];

  id v12 = +[VOTBrailleManager manager];
  id v13 = [v12 brailleInputTableFromSettings];

  unsigned int v14 = BRLLogTranslation();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    uint64_t v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Current table updated: %@", (uint8_t *)&v19, 0xCu);
  }

  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_setCurrentDefaultTable:", threadKey, 0, 1, v11);
  unsigned int v16 = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_setBrailleTable:", v16, 0, 1, v11);
  unsigned int v17 = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_setBrailleInputTable:", v17, 0, 1, v13);
  unsigned int v18 = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_setBrailleSubstitutionLanguage:", v18, 0, 1, v9);
}

- (void)_setCurrentDefaultTable:(id)a3
{
}

- (void)_setBrailleTable:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = BRLLogTranslation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting braille table %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)&self->_currentSetTable, a3);
    brailleClient = self->_brailleClient;
    id v8 = [v5 identifier];
    [(SCROBrailleClient *)brailleClient setTableIdentifier:v8];

    id v9 = [(VOTBrailleManager *)self tableSetCallback];

    if (v9)
    {
      id v10 = [(VOTBrailleManager *)self tableSetCallback];
      ((void (**)(void, id))v10)[2](v10, v5);
    }
  }
}

- (void)_setBrailleInputTable:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = BRLLogTranslation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting braille input table %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)&self->_currentSetInputTable, a3);
    brailleClient = self->_brailleClient;
    id v8 = [v5 identifier];
    [(SCROBrailleClient *)brailleClient setInputTableIdentifier:v8];
  }
}

- (void)_setBrailleSubstitutionLanguage:(id)a3
{
}

- (void)updateUsesNemethForMath
{
  brailleClient = self->_brailleClient;
  id v3 = +[AXSettings sharedInstance];
  -[SCROBrailleClient setAlwaysUsesNemethCodeForTechnicalText:](brailleClient, "setAlwaysUsesNemethCodeForTechnicalText:", [v3 voiceOverAlwaysUseNemethCodeForMathEnabled]);
}

- (void)setTextSearchModeOn:(BOOL)a3
{
}

- (BOOL)_languageIsCJK
{
  id v3 = [(BRLTTable *)self->_currentSetTable language];
  if ([v3 hasPrefix:@"yue"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(BRLTTable *)self->_currentSetTable language];
    if ([v5 hasPrefix:@"cmn"])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      id v6 = [(BRLTTable *)self->_currentSetTable language];
      if ([v6 hasPrefix:@"kor"])
      {
        unsigned __int8 v4 = 1;
      }
      else
      {
        int64_t v7 = [(BRLTTable *)self->_currentSetTable language];
        unsigned __int8 v4 = [v7 hasPrefix:@"jpn"];
      }
    }
  }
  return v4;
}

- (BOOL)_languageIsNBSC
{
  id v2 = [(BRLTTable *)self->_currentSetTable identifier];
  unsigned __int8 v3 = [v2 hasPrefix:@"com.apple.scrod.braille.table.nbsc"];

  return v3;
}

- (void)handleSettingsChange:(id)a3
{
  if ([a3 isEqualToString:kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification])
  {
    [(VOTBrailleManager *)self updateStatusCellPrefs];
  }
}

- (void)updateStatusCellPrefs
{
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];

  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_updateStatusCellPrefs", threadKey, 0, 0, 0);
}

- (void)updatePrefersNonBlinkingCursorIndicatorPrefs
{
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];

  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_updatePrefersNonBlinkingCursorIndicatorPrefs", threadKey, 0, 0, 0);
}

- (void)_updatePrefersNonBlinkingCursorIndicatorPrefs
{
  int v3 = _AXSPrefersNonBlinkingCursorIndicator();
  if (objc_opt_respondsToSelector())
  {
    brailleClient = self->_brailleClient;
    [(SCROBrailleClient *)brailleClient setBlinkEnabled:v3 == 0];
  }
}

- (void)handleEvent:(id)a3
{
  threadKey = self->_threadKey;
  id v5 = a3;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_handleEvent:", threadKey, 0, 1, v5);
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[VOTUserEventManager sharedInstance];
  [v5 userEventOccurred];

  commands = self->_commands;
  int64_t v7 = [v4 command];
  -[AXIndexMap objectForIndex:](commands, "objectForIndex:", [v7 hash]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [v9 target];
  objc_msgSend(v8, "performSelector:withObject:", objc_msgSend(v9, "selector"), v4);
}

- (void)_initializeCommands
{
  commands = self->_commands;
  id v4 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBraillePanLeft:"];
  -[AXIndexMap setObject:forIndex:](commands, "setObject:forIndex:", v4, [kVOTEventCommandBraillePanLeft hash]);

  id v5 = self->_commands;
  id v6 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBraillePanRight:"];
  -[AXIndexMap setObject:forIndex:](v5, "setObject:forIndex:", v6, [kVOTEventCommandBraillePanRight hash]);

  int64_t v7 = self->_commands;
  id v8 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBraillePanBeginning:"];
  -[AXIndexMap setObject:forIndex:](v7, "setObject:forIndex:", v8, [kVOTEventCommandBraillePanBeginning hash]);

  id v9 = self->_commands;
  id v10 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBraillePanEnd:"];
  -[AXIndexMap setObject:forIndex:](v9, "setObject:forIndex:", v10, [kVOTEventCommandBraillePanEnd hash]);

  int v11 = self->_commands;
  id v12 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBrailleNextInputTable:"];
  -[AXIndexMap setObject:forIndex:](v11, "setObject:forIndex:", v12, [kVOTEventCommandBrailleNextInputTable hash]);

  id v13 = self->_commands;
  unsigned int v14 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBrailleNextOutputTable:"];
  -[AXIndexMap setObject:forIndex:](v13, "setObject:forIndex:", v14, [kVOTEventCommandBrailleNextOutputTable hash]);

  unsigned int v15 = self->_commands;
  unsigned int v16 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBrailleAnnouncementModeOn:"];
  -[AXIndexMap setObject:forIndex:](v15, "setObject:forIndex:", v16, [kVOTEventCommandBrailleAnnouncementModeOn hash]);

  unsigned int v17 = self->_commands;
  unsigned int v18 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBrailleRouter:"];
  -[AXIndexMap setObject:forIndex:](v17, "setObject:forIndex:", v18, [kVOTEventCommandBrailleRouter hash]);

  int v19 = self->_commands;
  uint64_t v20 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBrailleStatusRouter:"];
  -[AXIndexMap setObject:forIndex:](v19, "setObject:forIndex:", v20, [kVOTEventCommandBrailleStatusRouter hash]);

  long long v21 = self->_commands;
  id v22 = +[SCRCTargetSelector targetSelectorWithTarget:self selector:"_handleBrailleTranslate:"];
  -[AXIndexMap setObject:forIndex:](v21, "setObject:forIndex:", v22, [kVOTEventCommandBrailleTranslate hash]);
}

- (void)_handleBraillePanLeft:(id)a3
{
  id v7 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastPanTime > 2.0) {
    [(VOTBrailleManager *)self setPanEnabled:1];
  }
  if ([(VOTBrailleManager *)self panEnabled])
  {
    self->_lastPanTime = Current;
    id v5 = [v7 objectForIndex:104];
    if (!v5)
    {
      id v5 = objc_alloc_init((Class)SCROBrailleKey);
      [v5 setDisplayToken:self->_primaryDisplayToken];
    }
    -[SCROBrailleClient panDisplayLeft:](self->_brailleClient, "panDisplayLeft:", [v5 displayToken]);
  }
  else
  {
    id v5 = +[VOTOutputManager outputManager];
    id v6 = +[VOSOutputEvent UnknownCommand];
    [v5 sendEvent:v6];
  }
}

- (void)_handleBraillePanBeginning:(id)a3
{
  id v8 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastPanTime > 2.0) {
    [(VOTBrailleManager *)self setPanEnabled:1];
  }
  if ([(VOTBrailleManager *)self panEnabled])
  {
    self->_lastPanTime = Current;
    id v5 = [v8 objectForIndex:104];
    id v6 = v5;
    if (v5) {
      -[SCROBrailleClient panDisplayBeginning:](self->_brailleClient, "panDisplayBeginning:", [v5 displayToken]);
    }
  }
  else
  {
    id v6 = +[VOTOutputManager outputManager];
    id v7 = +[VOSOutputEvent UnknownCommand];
    [v6 sendEvent:v7];
  }
}

- (void)_handleBraillePanEnd:(id)a3
{
  id v8 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastPanTime > 2.0) {
    [(VOTBrailleManager *)self setPanEnabled:1];
  }
  if ([(VOTBrailleManager *)self panEnabled])
  {
    self->_lastPanTime = Current;
    id v5 = [v8 objectForIndex:104];
    id v6 = v5;
    if (v5) {
      -[SCROBrailleClient panDisplayEnd:](self->_brailleClient, "panDisplayEnd:", [v5 displayToken]);
    }
  }
  else
  {
    id v6 = +[VOTOutputManager outputManager];
    id v7 = +[VOSOutputEvent UnknownCommand];
    [v6 sendEvent:v7];
  }
}

- (void)_handleBraillePanRight:(id)a3
{
  id v7 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastPanTime > 2.0) {
    [(VOTBrailleManager *)self setPanEnabled:1];
  }
  if ([(VOTBrailleManager *)self panEnabled])
  {
    self->_lastPanTime = Current;
    id v5 = [v7 objectForIndex:104];
    if (!v5)
    {
      id v5 = objc_alloc_init((Class)SCROBrailleKey);
      [v5 setDisplayToken:self->_primaryDisplayToken];
    }
    -[SCROBrailleClient panDisplayRight:](self->_brailleClient, "panDisplayRight:", [v5 displayToken]);
  }
  else
  {
    id v5 = +[VOTOutputManager outputManager];
    id v6 = +[VOSOutputEvent UnknownCommand];
    [v5 sendEvent:v6];
  }
}

- (BOOL)_supportsMode:(int64_t)a3
{
  id v4 = (void *)_AXSVoiceOverTouchCopyBrailleTableIdentifier();
  id v5 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v4];
  id v6 = v5;
  if (a3 == 2)
  {
    if (v4)
    {
      unsigned __int8 v7 = [v5 supportsTranslationMode8Dot];
      goto LABEL_7;
    }
LABEL_8:
    BOOL v8 = 1;
    goto LABEL_9;
  }
  if (a3 != 3 || !v4) {
    goto LABEL_8;
  }
  unsigned __int8 v7 = [v5 supportsTranslationModeContracted];
LABEL_7:
  BOOL v8 = v7;
LABEL_9:

  return v8;
}

- (int64_t)outputContractionMode
{
  unsigned int v3 = [(SCROBrailleClient *)self->_brailleClient contractionMode];
  unsigned int v4 = [(SCROBrailleClient *)self->_brailleClient showEightDotBraille];
  uint64_t v5 = 3;
  if (v3) {
    uint64_t v5 = 1;
  }
  if (v3 == 1 && v4 == 1) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = v5;
  }
  if (v3 == 1 && v4 == 0) {
    return 1;
  }
  else {
    return v7;
  }
}

- (int64_t)inputContractionMode
{
  unsigned int v3 = [(SCROBrailleClient *)self->_brailleClient inputContractionMode];
  unsigned int v4 = [(SCROBrailleClient *)self->_brailleClient inputEightDotBraille];
  uint64_t v5 = 3;
  if (v3) {
    uint64_t v5 = 1;
  }
  if (v3 == 1 && v4 == 1) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = v5;
  }
  if (v3 == 1 && v4 == 0) {
    return 1;
  }
  else {
    return v7;
  }
}

- (void)_handleBrailleTable:(id)a3 input:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_msgSend((id)VOTSharedWorkspace, "brailleLanguageRotorItems", a3);
  objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &stru_1001B6660);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  if (v4) {
    [(id)VOTSharedWorkspace selectedBrailleInputTable];
  }
  else {
  int64_t v7 = [(id)VOTSharedWorkspace selectedBrailleTable];
  }
  BOOL v8 = [v7 identifier];

  if ([v28 count])
  {
    unint64_t v9 = 1;
    while (1)
    {
      id v10 = [v28 objectAtIndexedSubscript:v9 - 1];
      int v11 = VOSBrailleTableForRotorItem();
      id v12 = [v11 identifier];

      if ([v8 isEqual:v12]) {
        break;
      }

      if (v9++ >= (unint64_t)[v28 count]) {
        goto LABEL_9;
      }
    }
    if ([v28 count] == (id)v9) {
      unint64_t v14 = 0;
    }
    else {
      unint64_t v14 = v9;
    }
  }
  else
  {
LABEL_9:
    unint64_t v14 = 0;
  }
  unsigned int v15 = [v28 objectAtIndex:v14];
  unsigned int v16 = VOSBrailleTableForRotorItem();
  if (v4)
  {
    [(id)VOTSharedWorkspace setSelectedBrailleInputTable:v16];
    unsigned int v17 = +[AXSettings sharedInstance];
    unsigned int v18 = [v17 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    int v19 = off_1001EA9E8;
    if (!v18)
    {
      uint64_t v20 = @"braille.input.format.change";
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  [(id)VOTSharedWorkspace setSelectedBrailleTable:v16];
  long long v21 = +[AXSettings sharedInstance];
  unsigned int v22 = [v21 voiceOverTouchBrailleDisplaySyncInputOutputTables];

  int v19 = off_1001EA9E8;
  if (v22)
  {
LABEL_18:
    uint64_t v20 = @"braille.table.format.change";
    goto LABEL_20;
  }
  uint64_t v20 = @"braille.output.format.change";
LABEL_20:
  uint64_t v23 = sub_100051804(v19, v20, 0);
  long long v24 = [(VOTBrailleManager *)self nameForSpokenAnnouncementOfBrailleTable:v16];
  long long v25 = AXCFormattedString();
  id v26 = +[VOTOutputRequest createRequest];
  id v27 = [v26 addString:v25];
  [v26 setGeneratesBraille:1];
  [v26 setBrailleType:2];
  [v26 send];
  [(VOTBrailleManager *)self updateBrailleLanguage];
}

- (void)_handleBrailleNextInputTable:(id)a3
{
}

- (void)_handleBrailleNextOutputTable:(id)a3
{
}

- (void)_exitDisplayMode
{
}

- (void)testingExitDisplayMode
{
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];

  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_exitDisplayMode", threadKey, 0, 0, 0);
}

- (void)_handleBrailleAnnouncementModeOn:(id)a3
{
  unsigned int v4 = [(SCROBrailleClient *)self->_brailleClient displayMode];
  brailleClient = self->_brailleClient;
  if (v4 == 2)
  {
    [(SCROBrailleClient *)brailleClient exitCurrentDisplayMode];
  }
  else
  {
    [(SCROBrailleClient *)brailleClient setAnnouncementsDisplayMode];
  }
}

- (void)_handleBrailleRouter:(id)a3
{
  self->_lastBraillePanDirection = -1;
  unsigned int v4 = [a3 objectForIndex:104];
  uint64_t v5 = v4;
  if (v4 && self->_brailleElement)
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    unint64_t v32 = 0;
    if ([v4 getRouterIndex:&v34 token:&v33 location:&v32 appToken:0]
      && v33 == self->_brailleElementIndex)
    {
      unsigned int v6 = [(VOTElement *)self->_brailleElement brailleTextEntrySupported];
      brailleElement = self->_brailleElement;
      if (v6)
      {
        BOOL v8 = [(VOTElement *)brailleElement textInputElement];
        if (!v8) {
          BOOL v8 = self->_brailleElement;
        }
        if (self->_brailleLineRange.location == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_21;
        }
        unint64_t v9 = [(VOTElement *)v8 value];
        id v10 = objc_msgSend(v9, "substringWithRange:", self->_brailleLineRange.location, self->_brailleLineRange.length);

        id v31 = 0;
        id v11 = sub_100053D00(v10, &v31);
        id v12 = v31;
        id v13 = (char *)sub_100054190(v32, v12);
        NSUInteger length = self->_brailleLineRange.length;

        if ((unint64_t)v13 > length) {
          goto LABEL_21;
        }
        if (([(SCROBrailleClient *)self->_brailleClient inputEightDotBraille] & 1) == 0
          && ![(VOTBrailleManager *)self _languageIsCJK])
        {
          unsigned int v15 = (char *)[(id)VOTSharedWorkspace suppressSelectionChangeNotificationCount];
          [(id)VOTSharedWorkspace setSuppressSelectionChangeNotificationCount:v15 + 1];
        }
        -[VOTElement setSelectedTextRange:refreshBraille:](v8, "setSelectedTextRange:refreshBraille:", &v13[self->_brailleLineRange.location], 0, 0);
        [(VOTBrailleManager *)self _refreshBrailleLinePreferringPositionOverRotorSelection:1 knownLineRange:0 updatedPosition:0];
        unsigned int v16 = +[VOTOutputManager outputManager];
        id v17 = +[VOSOutputEvent InsertionPointDidMove];
        [v16 sendEvent:v17];
        goto LABEL_14;
      }
      if ([(VOTElement *)brailleElement isReadingContent])
      {
        if (self->_brailleLineRange.location != 0x7FFFFFFFFFFFFFFFLL && v32 <= self->_brailleLineRange.length)
        {
          BOOL v8 = [(VOTElement *)self->_brailleElement pageContent];
          long long v24 = (char *)[(VOTElement *)v8 ax_wordFromPosition:v32 + self->_brailleLineRange.location inDirection:0];
          uint64_t v26 = v25;
          if (&v24[v25] > [(VOTElement *)v8 length]) {
            goto LABEL_21;
          }
          unsigned int v16 = -[VOTElement substringWithRange:](v8, "substringWithRange:", v24, v26);
          if (![v16 length])
          {
LABEL_15:

LABEL_21:
            goto LABEL_22;
          }
          id v17 = +[VOTOutputRequest createRequest];
          [v17 setGeneratesBraille:0];
          id v27 = [v17 addString:v16];
          [v17 send];
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        if (![(VOTElement *)self->_brailleElement doesHaveTraits:kAXMathEquationTrait])
        {
          BOOL v8 = +[VOTEvent brailleEventWithCommand:kVOTEventCommandSimpleTap info:0];
          [(id)VOTSharedWorkspace dispatchCommand:v8];
          goto LABEL_21;
        }
        if (self->_brailleLineRange.location != 0x7FFFFFFFFFFFFFFFLL && v32 <= self->_brailleLineRange.length)
        {
          BOOL v8 = [(VOTElement *)self->_brailleElement mathBrailleDescription];
          id v28 = [(VOTElement *)v8 attributesAtIndex:v32 + self->_brailleLineRange.location effectiveRange:0];
          id v29 = [v28 objectForKey:UIAccessibilityTokenMathTreePosition];
          if (v29)
          {
            v30 = +[VOTEvent brailleEventWithCommand:kVOTEventCommandSearchRotorSetMathPosition info:0];
            [v30 setObject:v29 forIndex:109];
            [(id)VOTSharedWorkspace dispatchCommand:v30];
          }
          else
          {
            v30 = NSStringFromRange(self->_brailleLineRange);
            _AXLogWithFacility();
          }

          goto LABEL_21;
        }
      }
    }
    else
    {
      unsigned int v18 = +[AXSubsystemVoiceOver sharedInstance];
      unsigned __int8 v19 = [v18 ignoreLogging];

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = +[AXSubsystemVoiceOver identifier];
        AXLoggerForFacility();
        BOOL v8 = (VOTElement *)objc_claimAutoreleasedReturnValue();

        os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(&v8->super, v21))
        {
          unsigned int v22 = AXColorizeFormatLog();
          uint64_t v23 = _AXStringForArgs();
          if (os_log_type_enabled(&v8->super, v21))
          {
            *(_DWORD *)buf = 138543362;
            v36 = v23;
            _os_log_impl((void *)&_mh_execute_header, &v8->super, v21, "%{public}@", buf, 0xCu);
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
}

- (void)_handleBrailleStatusRouter:(id)a3
{
  unsigned int v4 = [a3 objectForIndex:104];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v6 = 0;
    if ([v4 getRouterIndex:&v8 token:&v7 location:&v6 appToken:0]) {
      [(VOTBrailleManager *)self _handleStatusRouterForIndex:v8];
    }
  }
}

- (void)_initializeExpandedStatusCellDictionaries
{
  unsigned int v3 = [(_VOTBrailleManagerStatus *)self->_status generalDict];

  if (!v3)
  {
    v36 = +[SCROBrailleClient statusAttributeDotText];
    id v34 = objc_allocWithZone((Class)NSMutableDictionary);
    unint64_t v32 = sub_100051804(off_1001EA9E8, @"braille.status.general.title", 0);
    uint64_t v4 = kSCROStatusAttributeCellTitle;
    uint64_t v5 = sub_100051804(off_1001EA9E8, @"braille.status.general.dot.3", 0);
    uint64_t v6 = [v36 objectAtIndexedSubscript:2];
    uint64_t v7 = sub_100051804(off_1001EA9E8, @"braille.status.general.dot.4", 0);
    uint64_t v8 = [v36 objectAtIndexedSubscript:3];
    unint64_t v9 = sub_100051804(off_1001EA9E8, @"braille.status.general.dot.5", 0);
    id v10 = [v36 objectAtIndexedSubscript:4];
    id v11 = sub_100051804(off_1001EA9E8, @"braille.status.general.dot.6", 0);
    id v12 = [v36 objectAtIndexedSubscript:5];
    id v13 = objc_msgSend(v34, "initWithObjectsAndKeys:", v32, v4, v5, v6, v7, v8, v9, v10, v11, v12, 0);
    [(_VOTBrailleManagerStatus *)self->_status setGeneralDict:v13];

    id v29 = objc_allocWithZone((Class)NSMutableDictionary);
    id v28 = sub_100051804(off_1001EA9E8, @"braille.status.text.title", 0);
    uint64_t v27 = kSCROStatusAttributeCellTitle;
    uint64_t v26 = sub_100051804(off_1001EA9E8, @"braille.status.text.dot.1", 0);
    long long v35 = [v36 objectAtIndexedSubscript:0];
    uint64_t v33 = sub_100051804(off_1001EA9E8, @"braille.status.text.dot.2", 0);
    uint64_t v25 = [v36 objectAtIndexedSubscript:1];
    id v31 = sub_100051804(off_1001EA9E8, @"braille.status.text.dot.3", 0);
    long long v24 = [v36 objectAtIndexedSubscript:2];
    v30 = sub_100051804(off_1001EA9E8, @"braille.status.text.dot.4", 0);
    uint64_t v23 = [v36 objectAtIndexedSubscript:3];
    unsigned int v22 = sub_100051804(off_1001EA9E8, @"braille.status.text.dot.5", 0);
    os_log_type_t v21 = [v36 objectAtIndexedSubscript:4];
    unint64_t v14 = sub_100051804(off_1001EA9E8, @"braille.status.text.dot.6", 0);
    uint64_t v20 = [v36 objectAtIndexedSubscript:5];
    unsigned int v15 = sub_100051804(off_1001EA9E8, @"braille.status.text.dot.7", 0);
    unsigned int v16 = [v36 objectAtIndexedSubscript:6];
    id v17 = sub_100051804(off_1001EA9E8, @"braille.status.text.dot.8", 0);
    unsigned int v18 = [v36 objectAtIndexedSubscript:7];
    id v19 = objc_msgSend(v29, "initWithObjectsAndKeys:", v28, v27, v26, v35, v33, v25, v31, v24, v30, v23, v22, v21, v14, v20, v15, v16, v17,
            v18,
            0);
    [(_VOTBrailleManagerStatus *)self->_status setTextDict:v19];
  }
}

- (void)_updateWordWrapPrefs
{
  unsigned int v3 = +[AXSettings sharedInstance];
  id v4 = [v3 voiceOverBrailleWordWrapEnabled];

  uint64_t v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Word wrap updated: %d", (uint8_t *)v6, 8u);
  }

  [(SCROBrailleClient *)self->_brailleClient setWordWrapEnabled:v4];
}

- (void)_updateBrailleKeyDebouncePrefs
{
  brailleClient = self->_brailleClient;
  id v3 = +[AXSettings sharedInstance];
  [v3 voiceOverBrailleKeyDebounceTimeout];
  [(SCROBrailleClient *)brailleClient setBrailleChordDebounceTimeout:"setBrailleChordDebounceTimeout:"];
}

- (void)updateBrailleAutoAdvancePrefs
{
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];

  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_updateBrailleAutoAdvancePrefs", threadKey, 0, 0, 0);
}

- (void)_updateBrailleAutoAdvancePrefs
{
  [(SCROBrailleClient *)self->_brailleClient setAutoAdvanceEnabled:self->_autoAdvanceEnabled];
  [(id)VOTSharedWorkspace activeBrailleAutoAdvanceDuration];
  brailleClient = self->_brailleClient;

  -[SCROBrailleClient setAutoAdvanceDuration:](brailleClient, "setAutoAdvanceDuration:");
}

- (void)setAutoAdvanceEnabled:(BOOL)a3
{
  self->_autoAdvanceEnabled = a3;
  [(VOTBrailleManager *)self _updateBrailleAutoAdvancePrefs];
}

- (BOOL)autoAdvanceEnabled
{
  return self->_autoAdvanceEnabled;
}

- (void)_updateHelpEnabled
{
  brailleClient = self->_brailleClient;
  id v4 = +[VOTCommandHelper commandHelper];
  -[SCROBrailleClient setSingleLetterInputIsOn:](brailleClient, "setSingleLetterInputIsOn:", [v4 helpEnabled]);

  id v5 = +[VOTCommandHelper commandHelper];
  self->_testingKeyboardHelpOn = [v5 helpEnabled];
}

- (void)setSingleLetterQuickNavOn:(BOOL)a3
{
}

- (BOOL)bluetoothBrailleDisplayConnected
{
  return self->_primaryDisplayIsBluetooth && self->_primaryDisplayToken != 0;
}

- (void)_updateStatusCellPrefs
{
  unsigned int v3 = [(_VOTBrailleManagerStatus *)self->_status showGeneral];
  unsigned int v4 = [(_VOTBrailleManagerStatus *)self->_status showText];
  -[_VOTBrailleManagerStatus setShowGeneral:](self->_status, "setShowGeneral:", [(id)VOTSharedWorkspace activeBrailleGeneralStatusCellPreference]);
  -[_VOTBrailleManagerStatus setShowText:](self->_status, "setShowText:", [(id)VOTSharedWorkspace activeBrailleTextStatusCellPreference]);
  if ([(_VOTBrailleManagerStatus *)self->_status showGeneral]
    || [(_VOTBrailleManagerStatus *)self->_status showText])
  {
    [(VOTBrailleManager *)self _initializeExpandedStatusCellDictionaries];
  }
  else
  {
    [(_VOTBrailleManagerStatus *)self->_status setGeneralDict:0];
    [(_VOTBrailleManagerStatus *)self->_status setTextDict:0];
  }
  if (v3 != [(_VOTBrailleManagerStatus *)self->_status showGeneral]
    || v4 != [(_VOTBrailleManagerStatus *)self->_status showText])
  {
    [(VOTBrailleManager *)self _updateStatusCells];
  }
}

- (BOOL)statusCellShowsGeneral
{
  return [(_VOTBrailleManagerStatus *)self->_status showGeneral];
}

- (BOOL)statusCellShowsText
{
  return [(_VOTBrailleManagerStatus *)self->_status showText];
}

- (void)_updateStatusCells
{
  char v56 = 0;
  __int16 v55 = 0;
  if ([(_VOTBrailleManagerStatus *)self->_status showGeneral])
  {
    [(_VOTBrailleManagerStatus *)self->_status setGeneral:0];
    unsigned int v3 = [(_VOTBrailleManagerStatus *)self->_status general] & 0xFFFFFFFB;
    if ([(id)VOTSharedWorkspace speechMuted]) {
      int v4 = 4;
    }
    else {
      int v4 = 0;
    }
    [(_VOTBrailleManagerStatus *)self->_status setGeneral:v4 | v3];
    unsigned int v5 = [(_VOTBrailleManagerStatus *)self->_status general] & 0xFFFFFFF7;
    if ([(id)VOTSharedWorkspace isSystemBatteryLow]) {
      int v6 = 8;
    }
    else {
      int v6 = 0;
    }
    [(_VOTBrailleManagerStatus *)self->_status setGeneral:v6 | v5];
    -[_VOTBrailleManagerStatus setGeneral:](self->_status, "setGeneral:", -[_VOTBrailleManagerStatus general](self->_status, "general") & 0xFFFFFFEF | (16* ((char *)[(id)VOTSharedWorkspace deviceOrientation]- 3 < (char *)2)));
    unsigned int v7 = [(_VOTBrailleManagerStatus *)self->_status general] & 0xFFFFFFDF;
    if ([(id)VOTSharedWorkspace screenCurtainEnabled]) {
      int v8 = 32;
    }
    else {
      int v8 = 0;
    }
    [(_VOTBrailleManagerStatus *)self->_status setGeneral:v8 | v7];
    uint64_t v9 = 0;
    LOBYTE(v55) = [(_VOTBrailleManagerStatus *)self->_status general];
    unsigned int v10 = 1;
  }
  else
  {
    unsigned int v10 = 0;
    uint64_t v9 = -1;
  }
  if ([(_VOTBrailleManagerStatus *)self->_status showText])
  {
    id v11 = self->_brailleElement;
    if ([(VOTElement *)self->_brailleElement brailleTextEntrySupported])
    {
      id v12 = [(VOTElement *)self->_brailleElement textInputElement];
      id v13 = v12;
      if (v12)
      {
        unint64_t v14 = v12;

        id v11 = v14;
      }
    }
    id v15 = [(VOTElement *)v11 selectedTextRange];
    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v17 = v15;
      unint64_t v18 = v16;
      id v19 = [(VOTElement *)v11 value];
      id v20 = [v19 length];

      if (v17 >= v20)
      {
        unsigned int v22 = 0;
      }
      else
      {
        if (v18 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v18;
        }
        unsigned int v22 = -[VOTElement attributedValueForRange:](v11, "attributedValueForRange:", v17, v21);
        [(id)VOTSharedWorkspace addMisspellingsForString:v22];
      }
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000D48F4;
      v53[3] = &unk_1001B66B0;
      id v23 = v22;
      id v54 = v23;
      long long v24 = objc_retainBlock(v53);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1000D4A2C;
      v51[3] = &unk_1001B66B0;
      id v25 = v23;
      id v52 = v25;
      uint64_t v26 = objc_retainBlock(v51);
      v46 = _NSConcreteStackBlock;
      uint64_t v47 = 3221225472;
      v48 = sub_1000D4B3C;
      v49 = &unk_1001B66B0;
      id v50 = v25;
      id v44 = v25;
      uint64_t v27 = objc_retainBlock(&v46);
      [(_VOTBrailleManagerStatus *)self->_status setText:0];
      [(_VOTBrailleManagerStatus *)self->_status setText:[(_VOTBrailleManagerStatus *)self->_status text] & 0xFE | (BKSHIDServicesIsCapsLockLightOn() != 0)];
      unsigned int v28 = [(_VOTBrailleManagerStatus *)self->_status text] & 0xFFFFFFFD;
      id v29 = (unsigned int (**)(char *, void))(v24 + 16);
      if ((*((unsigned int (**)(char *, void))v24 + 2))(v24, UIAccessibilityTokenBold)) {
        int v30 = 2;
      }
      else {
        int v30 = 0;
      }
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", v30 | v28, v44, v46, v47, v48, v49);
      unsigned int v31 = [(_VOTBrailleManagerStatus *)self->_status text] & 0xFFFFFFFB;
      if ((*v29)(v24, UIAccessibilityTokenItalic)) {
        int v32 = 4;
      }
      else {
        int v32 = 0;
      }
      [(_VOTBrailleManagerStatus *)self->_status setText:v32 | v31];
      unsigned int v33 = [(_VOTBrailleManagerStatus *)self->_status text] & 0xFFFFFFF7;
      if ((*v29)(v24, UIAccessibilityTokenMisspelled)) {
        int v34 = 8;
      }
      else {
        int v34 = 0;
      }
      [(_VOTBrailleManagerStatus *)self->_status setText:v34 | v33];
      unsigned int v35 = [(_VOTBrailleManagerStatus *)self->_status text] & 0xFFFFFFEF;
      if ((*v29)(v24, UIAccessibilityTokenUnderline)) {
        int v36 = 16;
      }
      else {
        int v36 = 0;
      }
      [(_VOTBrailleManagerStatus *)self->_status setText:v36 | v35];
      unsigned int v37 = [(_VOTBrailleManagerStatus *)self->_status text] & 0xFFFFFFDF;
      if (((unsigned int (*)(void *, void))v26[2])(v26, UIAccessibilityTokenForegroundColor)) {
        int v38 = 32;
      }
      else {
        int v38 = 0;
      }
      [(_VOTBrailleManagerStatus *)self->_status setText:v38 | v37];
      unsigned int v39 = [(_VOTBrailleManagerStatus *)self->_status text] & 0xFFFFFFBF;
      if (((unsigned int (*)(void ***, void))v27[2])(v27, AXUIAccessibilityTextAttributeHeadingLevel)) {
        int v40 = 64;
      }
      else {
        int v40 = 0;
      }
      [(_VOTBrailleManagerStatus *)self->_status setText:v40 | v39];
      unsigned __int8 v41 = [(_VOTBrailleManagerStatus *)self->_status text];
      if (((unsigned int (*)(void ***, void))v27[2])(v27, UIAccessibilityTokenBlockquoteLevel)) {
        char v42 = 0x80;
      }
      else {
        char v42 = 0;
      }
      [(_VOTBrailleManagerStatus *)self->_status setText:v42 & 0x80 | v41 & 0x7Fu];
    }
    *(unsigned char *)((unint64_t)&v55 | v10++) = [(_VOTBrailleManagerStatus *)self->_status text];
  }
  if ([(_VOTBrailleManagerStatus *)self->_status showRealtime]) {
    *((unsigned char *)&v55 + v10++) = [(_VOTBrailleManagerStatus *)self->_status realtime];
  }
  id v43 = [objc_allocWithZone((Class)NSMutableData) initWithBytes:&v55 length:v10];
  if ([(id)VOTSharedWorkspace inUnitTestMode]) {
    objc_storeStrong((id *)&self->_testingAggregatedStatus, v43);
  }
  [(SCROBrailleClient *)self->_brailleClient setMasterStatusCellIndex:v9];
  [(SCROBrailleClient *)self->_brailleClient setAggregatedStatus:v43];
  [(SCROBrailleClient *)self->_brailleClient displayIfNeeded];
}

- (void)_handleStatusRouterForIndex:(int64_t)a3
{
  if ([(_VOTBrailleManagerStatus *)self->_status showGeneral])
  {
    if (a3)
    {
      id v12 = 0;
    }
    else
    {
      id v12 = [(_VOTBrailleManagerStatus *)self->_status generalDict];
      int v6 = +[NSNumber numberWithInteger:0];
      [v12 setObject:v6 forKey:kSCROStatusAttributeCellIndex];
    }
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
    id v12 = 0;
  }
  if ([(_VOTBrailleManagerStatus *)self->_status showText])
  {
    if (v5 == a3)
    {
      unsigned int v7 = [(_VOTBrailleManagerStatus *)self->_status textDict];

      int v8 = +[NSNumber numberWithInteger:a3];
      [v7 setObject:v8 forKey:kSCROStatusAttributeCellIndex];

      id v12 = v7;
    }
    ++v5;
  }
  if ([(_VOTBrailleManagerStatus *)self->_status showRealtime] && v5 == a3)
  {
    id v9 = kVOTEventCommandNextRealtimeElement;
    unsigned int v10 = +[VOTEvent brailleEventWithCommand:v9 info:0];
    [(id)VOTSharedWorkspace dispatchCommand:v10];
  }
  id v11 = v12;
  if (v12)
  {
    [(SCROBrailleClient *)self->_brailleClient setExpandedStatusDisplayModeWithStatus:v12];
    [(SCROBrailleClient *)self->_brailleClient displayIfNeeded];
    id v11 = v12;
  }
}

- (void)applyBrailleSubstitutions:(id)a3
{
  if (self->_usesBrailleSubstitutions)
  {
    id v4 = a3;
    id v7 = +[SCROBrailleSubstitutionManager sharedInstance];
    int v5 = [(VOTBrailleManager *)self brailleSubstitutionLanguage];
    int v6 = [v7 stringWithBrailleSubstitutions:v4 withLanguage:v5];
    [v4 setString:v6];
  }
}

- (void)_filterUnacceptableBrailleStrings:(id)a3
{
  id v6 = a3;
  unsigned int v3 = +[NSMutableCharacterSet controlCharacterSet];
  objc_msgSend(v3, "removeCharactersInRange:", 28, 1);
  objc_msgSend(v3, "removeCharactersInRange:", 31, 1);
  if ([v6 length])
  {
    do
    {
      id v4 = [v6 string];
      int v5 = (char *)[v4 rangeOfCharacterFromSet:v3];

      if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v5, 1, &stru_1001B7888);
    }
    while (v5 + 1 < [v6 length]);
  }
}

- (void)setBrailleString:(id)a3 type:(int)a4 timeout:(double)a5 langCode:(id)a6 brailleLineRange:(_NSRange)a7 isBrailleLineRangeKnown:(BOOL)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  uint64_t v13 = *(void *)&a4;
  id v15 = a3;
  id v16 = a6;
  if (![v15 length])
  {
    id v17 = VOTLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100121E90(v17);
    }
  }
  if ([(VOTBrailleManager *)self brailleEnabled])
  {
    threadKey = self->_threadKey;
    [(VOTBrailleManager *)self threadWaitTime];
    double v20 = v19;
    uint64_t v21 = +[NSNumber numberWithUnsignedInt:v13];
    uint64_t v22 = +[NSNumber numberWithDouble:a5];
    id v23 = (void *)v22;
    if (a8)
    {
      long long v24 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", location, length);
      -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_setBrailleString:type:timeout:priority:langCode:brailleLineRangeValue:", threadKey, 0, 6, v15, v20, v21, v23, &off_1001C5E48, v16, v24);
    }
    else
    {
      -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_setBrailleString:type:timeout:priority:langCode:brailleLineRangeValue:", threadKey, 0, 6, v15, v20, v21, v22, &off_1001C5E48, v16, 0);
    }
  }
}

- (void)_setBrailleString:(id)a3 type:(id)a4 timeout:(id)a5 priority:(id)a6 langCode:(id)a7 brailleLineRangeValue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v56 = a6;
  id v17 = a7;
  id v57 = a8;
  [(VOTBrailleManager *)self _filterUnacceptableBrailleStrings:v14];
  currentSetTable = self->_currentSetTable;
  if (!currentSetTable)
  {
    objc_storeStrong((id *)&self->_currentSetTable, self->_currentDefaultTable);
    currentSetTable = self->_currentSetTable;
  }
  id v58 = [(BRLTTable *)currentSetTable copy];
  if (v17 && [v14 length])
  {
    id v55 = v16;
    objc_msgSend(v14, "addAttribute:value:range:", kSCROLanguageAttribute, v17, 0, objc_msgSend(v14, "length"));
    double v19 = +[AXSettings sharedInstance];
    double v20 = [v19 preferredBrailleTableIdentifierForKeyboardLanguage:v17 keyboardLayout:0];

    if (v20)
    {
      uint64_t v21 = (BRLTTable *)[objc_alloc((Class)BRLTTable) initWithIdentifier:v20];
      if (!v21) {
        goto LABEL_15;
      }
    }
    else
    {
      id v23 = +[NSLocale localeWithLocaleIdentifier:v17];
      long long v24 = +[BRLTTableEnumerator defaultTableForLocale:v23];

      id v25 = [(BRLTTable *)self->_currentDefaultTable language];
      uint64_t v26 = [v24 language];
      unsigned int v27 = [v25 isEqualToString:v26];

      currentDefaultTable = (BRLTTable *)v24;
      if (v27) {
        currentDefaultTable = self->_currentDefaultTable;
      }
      uint64_t v21 = currentDefaultTable;

      if (!v21) {
        goto LABEL_15;
      }
    }
    id v29 = [(BRLTTable *)v21 tableIdentifier];
    int v30 = [(BRLTTable *)self->_currentSetTable tableIdentifier];
    unsigned __int8 v31 = [v29 isEqualToString:v30];

    if ((v31 & 1) == 0)
    {
      [(VOTBrailleManager *)self _setBrailleTable:v21];
      int v22 = 1;
      goto LABEL_17;
    }
LABEL_15:
    int v22 = 0;
LABEL_17:

    id v16 = v55;
    goto LABEL_18;
  }
  if (([(BRLTTable *)self->_currentDefaultTable isEqual:self->_currentSetTable] & 1) == 0) {
    [(VOTBrailleManager *)self _setBrailleTable:self->_currentDefaultTable];
  }
  int v22 = 0;
LABEL_18:
  int v32 = AXLogBrailleHW();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v60 = v14;
    __int16 v61 = 1024;
    unsigned int v62 = [v15 intValue];
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "set braille string: %{private}@ type: %d", buf, 0x12u);
  }

  switch([v15 intValue])
  {
    case 1u:
      if ([v14 length])
      {
        unsigned int v33 = [v14 attributesAtIndex:0 effectiveRange:0];
        int v34 = [v33 allKeys];
        unsigned __int8 v35 = [v34 containsObject:kSCROTokenAttribute];

        if ((v35 & 1) == 0)
        {
          uint64_t v36 = kSCROTokenAttribute;
          unsigned int v37 = +[NSNumber numberWithUnsignedInteger:self->_brailleElementIndex];
          objc_msgSend(v14, "addAttribute:value:range:", v36, v37, 0, objc_msgSend(v14, "length"));
        }
      }
      if (![(VOTBrailleManager *)self _isTerminalModeOn]) {
        [(SCROBrailleClient *)self->_brailleClient setMainAttributedString:v14];
      }
      goto LABEL_32;
    case 2u:
      if (![(id)VOTSharedWorkspace brailleAlertsEnabled] || !objc_msgSend(v14, "length")) {
        goto LABEL_37;
      }
      brailleClient = self->_brailleClient;
      unsigned int v39 = [v14 string];
      [v16 doubleValue];
      -[SCROBrailleClient setAlertString:timeout:priority:](brailleClient, "setAlertString:timeout:priority:", v39, [v56 intValue], v40);
      goto LABEL_31;
    case 3u:
      if (![v14 length]) {
        goto LABEL_37;
      }
      unsigned __int8 v41 = self->_brailleClient;
      unsigned int v39 = [v14 string];
      [(SCROBrailleClient *)v41 setAnnouncementString:v39];
LABEL_31:

LABEL_32:
      uint64_t v42 = 1;
      break;
    case 4u:
      if (v57)
      {
        self->_brailleLineRange.NSUInteger location = (NSUInteger)[v57 rangeValue];
        self->_brailleLineRange.NSUInteger length = v43;
        id v44 = self;
        uint64_t v45 = 1;
      }
      else
      {
        id v44 = self;
        uint64_t v45 = 0;
      }
      [(VOTBrailleManager *)v44 _refreshBrailleLinePreferringPositionOverRotorSelection:0 knownLineRange:v45 updatedPosition:0];
      goto LABEL_37;
    default:
LABEL_37:
      uint64_t v42 = 0;
      break;
  }
  [(VOTBrailleManager *)self _updateStatusCells];
  [(SCROBrailleClient *)self->_brailleClient displayIfNeeded];
  v46 = [(VOTBrailleManager *)self brailleStringSetCallback];

  if (v46)
  {
    uint64_t v47 = [(VOTBrailleManager *)self brailleStringSetCallback];
    ((void (**)(void, id, id, uint64_t))v47)[2](v47, v14, [v15 intValue], v42);
  }
  if (v22) {
    [(VOTBrailleManager *)self _setBrailleTable:v58];
  }
  v48 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v49 = [v48 ignoreLogging];

  if ((v49 & 1) == 0)
  {
    id v50 = +[AXSubsystemVoiceOver identifier];
    v51 = AXLoggerForFacility();

    os_log_type_t v52 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = AXColorizeFormatLog();
      id v54 = _AXStringForArgs();
      if (os_log_type_enabled(v51, v52))
      {
        *(_DWORD *)buf = 138543362;
        id v60 = v54;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "%{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)setBrailleElement:(id)a3
{
}

- (void)setBrailleElement:(id)a3 resetBrailleCursor:(BOOL)a4 rotorSelection:(id)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  id v8 = a5;
  if ([(VOTBrailleManager *)self brailleEnabled])
  {
    threadKey = self->_threadKey;
    [(VOTBrailleManager *)self threadWaitTime];
    double v11 = v10;
    id v12 = [v14 copyWithCache];
    uint64_t v13 = +[NSNumber numberWithBool:v6];
    -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_setBrailleElement:resetBrailleCursor:rotorSelection:", threadKey, 0, 3, v12, v11, v13, v8);
  }
}

- (void)_setBrailleElement:(id)a3 resetBrailleCursor:(id)a4 rotorSelection:(id)a5
{
  id v24 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(VOTBrailleManager *)self testingBrailleElementLocked]) {
    goto LABEL_35;
  }
  double v11 = +[VOTBrailleTerminalManager sharedManager];
  [v11 turnOff];

  p_brailleElement = (id *)&self->_brailleElement;
  unsigned __int8 v13 = [v24 isEqual:self->_brailleElement];
  objc_storeStrong((id *)&self->_brailleElement, a3);
  if (self->_rotorSelection != v10) {
    objc_storeStrong(&self->_rotorSelection, a5);
  }
  if ((v13 & 1) == 0)
  {
    [(SCROBrailleClient *)self->_brailleClient cancelCandidateSelection];
    brailleElement = self->_brailleElement;
    if (!brailleElement)
    {
      [(SCRCTargetSelectorTimer *)self->_hintTimer cancel];
      id v15 = 0;
LABEL_28:
      [(VOTBrailleManager *)self _resetBrailleCursor];
      goto LABEL_29;
    }
    unint64_t brailleElementIndex = self->_brailleElementIndex;
    if (brailleElementIndex + 1 > 1) {
      unint64_t v18 = brailleElementIndex + 1;
    }
    else {
      unint64_t v18 = 1;
    }
    self->_unint64_t brailleElementIndex = v18;
    if (self->_lastBraillePanDirection == 1)
    {
      if ([(VOTElement *)brailleElement isLiveCaptionsParagraphView])
      {
        id v15 = &off_1001C5E60;
LABEL_27:
        [(SCRCTargetSelectorTimer *)self->_hintTimer dispatchAfterDelay:2.0];
        goto LABEL_28;
      }
      brailleElement = (VOTElement *)*p_brailleElement;
    }
    if ([(VOTElement *)brailleElement isLiveCaptionsTextView])
    {
      double v20 = [*p_brailleElement label];
      +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 length]);
      id v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
    goto LABEL_27;
  }
  if (![v9 BOOLValue]
    || ![*p_brailleElement brailleTextEntrySupported])
  {
    if (([v9 BOOLValue] & 1) != 0
      || ([*p_brailleElement isReadingContent] & 1) != 0
      || (int64_t brailleLineOffset = self->_brailleLineOffset, brailleLineOffset == -1))
    {
      if (![*p_brailleElement isLiveCaptionsTextView])
      {
        id v15 = 0;
        goto LABEL_29;
      }
      int64_t brailleLineOffset = self->_brailleLineOffset;
    }
    id v15 = +[NSNumber numberWithInteger:brailleLineOffset];
LABEL_29:
    uint64_t v14 = 1;
    goto LABEL_30;
  }
  [(VOTElement *)self->_brailleElement updateCache];
  [(VOTBrailleManager *)self _resetBrailleCursor];
  uint64_t v14 = 0;
  id v15 = 0;
LABEL_30:
  [(VOTBrailleManager *)self _refreshBrailleLinePreferringPositionOverRotorSelection:0 knownLineRange:0 updatedPosition:v15 updateBrailleElement:v14];
  if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay])
  {
    uint64_t v21 = +[VOTPlanarBrailleManager manager];
    [v21 setPlanarBrailleElement:v24];
  }
  [(VOTBrailleManager *)self _updateRealtimeElementStatus];
  int v22 = [(VOTBrailleManager *)self elementSetCallback];

  if (v22)
  {
    id v23 = [(VOTBrailleManager *)self elementSetCallback];
    ((void (**)(void, VOTElement *))v23)[2](v23, self->_brailleElement);
  }
LABEL_35:
}

- (void)_resetBrailleCursor
{
  self->_brailleLineRange = (_NSRange)xmmword_10016E5C0;
  self->_brailleDescriptionRange = self->_brailleLineRange;
  self->_int64_t brailleLineOffset = -1;
}

- (void)refreshBrailleLine
{
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];

  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_refreshBrailleLine", threadKey, 0, 0, 0);
}

- (void)_refreshBrailleLine
{
}

- (void)_refreshBrailleLinePreferringPositionOverRotorSelection:(BOOL)a3 knownLineRange:(BOOL)a4 updatedPosition:(id)a5
{
}

- (void)_refreshBrailleLinePreferringPositionOverRotorSelection:(BOOL)a3 knownLineRange:(BOOL)a4 updatedPosition:(id)a5 updateBrailleElement:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v67 = a5;
  brailleElement = self->_brailleElement;
  if (!brailleElement)
  {
    id v21 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithString:@" "];
    uint64_t v22 = kSCROTokenAttribute;
    id v23 = +[NSNumber numberWithUnsignedInteger:0];
    objc_msgSend(v21, "addAttribute:value:range:", v22, v23, 0, objc_msgSend(v21, "length"));
    goto LABEL_81;
  }
  BOOL v63 = a4;
  if (v6) {
    [(VOTElement *)brailleElement updateCache];
  }
  id v64 = [objc_allocWithZone((Class)NSMutableAttributedString) init];
  double v11 = self->_brailleElement;
  unsigned int v12 = [(VOTElement *)self->_brailleElement brailleTextEntrySupported];
  unsigned __int8 v13 = [(VOTElement *)self->_brailleElement textInputElement];
  uint64_t v14 = (char *)[(VOTElement *)self->_brailleElement textInputElementRange];
  id v15 = v14;
  uint64_t v17 = v16;
  if (v13) {
    unsigned int v18 = v12;
  }
  else {
    unsigned int v18 = 0;
  }
  if (v14 == (char *)0x7FFFFFFF) {
    unsigned int v19 = 0;
  }
  else {
    unsigned int v19 = v18;
  }
  if (![(VOTElement *)self->_brailleElement isReadingContent])
  {
    unsigned int v20 = [(VOTElement *)self->_brailleElement includeDuringContentReading];
    if (!v19) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  unsigned int v20 = 1;
  if (v19)
  {
LABEL_15:
    [v13 updateCache];
    id v24 = v13;
    id v25 = v11;
    double v11 = v24;
  }
LABEL_16:
  p_brailleLineRange = &self->_brailleLineRange;
  if (self->_brailleLineRange.location != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_48;
  }
  if (!self->_lastBraillePanSucceeded)
  {
    unsigned int v27 = self->_lastBraillePanDirection ? 0 : v12;
    if (v27 == 1)
    {
      if (v19)
      {
        unsigned int v28 = [v13 value];
        if (&v15[v17])
        {
          id v29 = &v15[v17 - 1];
LABEL_44:
          uint64_t v35 = 1;
LABEL_47:
          self->_brailleLineRange.id location = (NSUInteger)objc_msgSend(v28, "lineRangeForRange:", v29, v35);
          self->_brailleLineRange.NSUInteger length = v38;

          goto LABEL_48;
        }
      }
      else
      {
        unsigned int v28 = [(VOTElement *)self->_brailleElement value];
        if ([v28 length])
        {
          id v29 = (char *)[v28 length] - 1;
          goto LABEL_44;
        }
      }
      id v29 = 0;
      uint64_t v35 = 0;
      goto LABEL_47;
    }
  }
  if (v12)
  {
    if (v19)
    {
      int v30 = (char *)[v13 selectedTextRange];
      if (v30 == (char *)0x7FFFFFFF) {
        goto LABEL_41;
      }
      int v32 = &v30[v31];
      if (&v30[v31] < v15 || v32 > &v15[v17]) {
        goto LABEL_41;
      }
    }
    else
    {
      if (self->_lastBraillePanDirection == 1)
      {
        unsigned int v33 = 0;
        uint64_t v34 = 0;
      }
      else
      {
        unsigned int v33 = (char *)[(VOTElement *)self->_brailleElement selectedTextRange];
      }
      if (v33 == (char *)0x7FFFFFFF)
      {
        id v15 = 0;
LABEL_41:
        p_brailleLineRange->id location = (NSUInteger)v15;
        goto LABEL_48;
      }
      int v32 = &v33[v34];
    }
    id v15 = v32;
    goto LABEL_41;
  }
  if (v20 && !self->_lastBraillePanDirection)
  {
    uint64_t v36 = [(VOTElement *)self->_brailleElement pageContent];
    self->_brailleLineRange.id location = (NSUInteger)objc_msgSend(v36, "lineRangeForRange:", (char *)objc_msgSend(v36, "length") - 1, 1);
    self->_brailleLineRange.NSUInteger length = v37;
  }
  else
  {
    p_brailleLineRange->id location = 0;
  }
LABEL_48:
  id v66 = [(VOTElement *)self->_brailleElement touchContainer];
  if (v67) {
    id location = [v67 integerValue];
  }
  else {
    id location = self->_brailleLineRange.location;
  }
  v65 = v13;
  char v62 = v12;
  if (!v20)
  {
    id v44 = v11;
    goto LABEL_64;
  }
  NSUInteger v40 = self->_brailleLineRange.location;
  if (!self->_lastBraillePanDirection)
  {
    NSUInteger length = self->_brailleLineRange.length;
LABEL_61:
    id location = (id)(length + v40);
    goto LABEL_62;
  }
  unint64_t bookCursorPosition = self->_bookCursorPosition;
  NSUInteger length = self->_brailleLineRange.length;
  BOOL v43 = bookCursorPosition - v40 < length && bookCursorPosition > v40;
  if (v43 || bookCursorPosition == length + v40) {
    goto LABEL_61;
  }
LABEL_62:
  id v44 = v11;
  if (self->_lastRefreshTrigger == 1) {
    id location = self->_bookCursorPosition;
  }
LABEL_64:
  id rotorSelection = self->_rotorSelection;
  v46 = [(VOTBrailleManager *)self previousTouchContainer];
  char v47 = [v66 isEqual:v46] ^ 1;
  v48 = [(VOTBrailleManager *)self previousElement];
  LOWORD(v61) = 256;
  BYTE1(v60) = v47;
  LOBYTE(v60) = v63;
  id v23 = v44;
  unsigned __int8 v49 = v44;
  id v21 = v64;
  -[VOTElement addTextualInformationToBrailleLine:forPosition:rotorSelection:shouldPreferRotorSelection:lineRange:descriptionRange:lineRangeKnown:isNewTouchContainer:previousElement:updateValue:singleLine:](v49, "addTextualInformationToBrailleLine:forPosition:rotorSelection:shouldPreferRotorSelection:lineRange:descriptionRange:lineRangeKnown:isNewTouchContainer:previousElement:updateValue:singleLine:", v64, location, rotorSelection, !v8, &self->_brailleLineRange, &self->_brailleDescriptionRange, v60, v48, v61);

  if (self->_lastRefreshTrigger == 1)
  {
    uint64_t v50 = +[NSNumber numberWithInteger:self->_trailingBookCursorPosition - self->_brailleLineRange.location];

    id v67 = (id)v50;
  }
  [(VOTBrailleManager *)self setPreviousTouchContainer:v66];
  [(VOTBrailleManager *)self setPreviousElement:v23];
  if (v67) {
    char v51 = v62;
  }
  else {
    char v51 = 1;
  }
  if (v51)
  {
    if (v67 || self->_lastBraillePanSucceeded) {
      goto LABEL_78;
    }
    int lastBraillePanDirection = self->_lastBraillePanDirection;
    if (!lastBraillePanDirection)
    {
      v53 = &off_1001C5E78;
      goto LABEL_85;
    }
    if (lastBraillePanDirection == 1)
    {
      v53 = &off_1001C5E90;
LABEL_85:
      id v55 = &kSCROLineFocusAttribute;
      goto LABEL_77;
    }
  }
  else
  {
    id v54 = [v67 integerValue];
    if (v54 < [v64 length])
    {
      id v55 = &kSCROBrailleOffsetAttribute;
      v53 = (_UNKNOWN **)v67;
LABEL_77:
      objc_msgSend(v64, "addAttribute:value:range:", *v55, v53, 0, objc_msgSend(v64, "length"));
    }
  }
LABEL_78:
  id v56 = [v64 length];
  if (v56)
  {
    id v57 = v56;
    uint64_t v58 = kSCROTokenAttribute;
    v59 = +[NSNumber numberWithUnsignedInteger:self->_brailleElementIndex];
    objc_msgSend(v64, "addAttribute:value:range:", v58, v59, 0, v57);
  }
LABEL_81:

  [(VOTBrailleManager *)self _setBrailleString:v21 type:&off_1001C5E90 timeout:0 priority:0 langCode:0 brailleLineRangeValue:0];
  self->_int lastBraillePanDirection = -1;
  self->_lastRefreshTrigger = 0;
}

- (VOTElement)brailleElement
{
  return (VOTElement *)[(VOTBrailleManager *)self valueForKeyPath:@"_brailleElement" forThreadKey:self->_threadKey];
}

- (void)_displayBrailleElementHint
{
  if (self->_brailleElement && [(id)VOTSharedWorkspace hintsEnabled])
  {
    id v10 = [objc_allocWithZone((Class)NSMutableString) init];
    unsigned int v3 = [(VOTElement *)self->_brailleElement hint];
    if ([v3 length])
    {
      if ([v3 isAXAttributedString])
      {
        id v4 = [v3 string];
        [v10 appendString:v4];
      }
      else
      {
        [v10 appendString:v3];
      }
    }
    int v5 = [(VOTElement *)self->_brailleElement instructions];

    if ([v5 length])
    {
      if ([v10 length]) {
        [v10 appendString:@", "];
      }
      [v10 appendString:v5];
    }
    if ([v10 length])
    {
      id v6 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithString:v10];
      id v7 = +[NSNumber numberWithInt:2];
      +[VOTBrailleManager currentDefaultBrailleAlertTimeout];
      BOOL v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v9 = +[NSNumber numberWithInt:10];
      [(VOTBrailleManager *)self _setBrailleString:v6 type:v7 timeout:v8 priority:v9 langCode:0 brailleLineRangeValue:0];
    }
  }
}

- (void)handleBrailleConfigurationChanged:(id)a3
{
  id v4 = a3;
  int v5 = VOTLogBraille();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Braille config change handler called: isConfigured = %@", (uint8_t *)&v7, 0xCu);
  }

  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_handleBrailleConfigurationChanged:", threadKey, 0, 1, v4);
  [(NSCondition *)self->_brailleClientConnectionCondition lock];
  if ([(SCROBrailleClient *)self->_brailleClient isConnected]) {
    [(NSCondition *)self->_brailleClientConnectionCondition broadcast];
  }
  [(NSCondition *)self->_brailleClientConnectionCondition unlock];
}

- (void)handleBrailleDidDisconnect:(id)a3
{
  id v4 = +[NSNumber numberWithBool:0];
  [(VOTBrailleManager *)self handleBrailleConfigurationChanged:v4];
}

- (void)handleBrailleDidReconnect:(id)a3
{
  id v4 = +[NSNumber numberWithBool:1];
  [(VOTBrailleManager *)self handleBrailleConfigurationChanged:v4];
}

- (void)_handleBrailleConfigurationChanged:(id)a3
{
  id v4 = [(SCROBrailleClient *)self->_brailleClient driverConfiguration];
  self->_primaryDisplayToken = 0;
  self->_BOOL hasActiveDisplay = [(VOTBrailleManager *)self testingHasActiveDisplay];
  int v5 = VOTLogBraille();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasActiveDisplay = self->_hasActiveDisplay;
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v4;
    __int16 v35 = 1024;
    BOOL v36 = hasActiveDisplay;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Driver config = %@, testingHasActiveDisplay = %d", buf, 0x12u);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unsigned __int8 v13 = objc_msgSend(v12, "objectForKey:", kSCROBrailleDisplayState, (void)v28);
        id v14 = [v13 unsignedIntegerValue];

        if (v14 == (id)1)
        {
          id v15 = [v12 objectForKey:kSCROBrailleDisplayIsPrimary];
          unsigned int v16 = [v15 BOOLValue];

          if (v16)
          {
            uint64_t v17 = [v12 objectForKey:kSCROBrailleDisplayToken];
            self->_primaryDisplayToken = [v17 integerValue];

            unsigned int v18 = [v12 objectForKey:kSCROBrailleDisplayTransport];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = [v18 unsignedIntegerValue];
              BOOL v20 = 1;
              if (v19 != (id)8 && v19 != (id)2)
              {
LABEL_16:

                goto LABEL_17;
              }
            }
            else
            {
              BOOL v20 = 0;
            }
            self->_primaryDisplayIsBluetooth = v20;
            goto LABEL_16;
          }
LABEL_17:
          id v21 = [v12 objectForKey:kSCROBrailleDisplayTransport];
          id v22 = [v21 unsignedIntegerValue];

          if (v22 == (id)4)
          {
            [(id)VOTSharedWorkspace handleUSBMFiBrailleDisplayConnected];
          }
          else
          {
            id v23 = [v12 objectForKey:kSCROBrailleDisplayTransport];
            id v24 = [v23 unsignedIntegerValue];

            if (v24 == (id)2) {
              [(id)VOTSharedWorkspace handleBluetoothBrailleDisplayConnected];
            }
          }
          if ([(VOTBrailleManager *)self _isActiveUserDisplayConfig:v12]) {
            self->_BOOL hasActiveDisplay = 1;
          }
          continue;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  [(VOTBrailleManager *)self _updateOnscreenKeyboardSettings];
  id v25 = +[SCROMobileBrailleDisplayInputManager sharedManager];
  [v25 configureWithDriverConfiguration:v7];

  [(SCROBrailleClient *)self->_brailleClient setKeepConnectionAlive:1];
  if (self->_hasActiveDisplay)
  {
    if (([(id)VOTSharedWorkspace inUnitTestMode] & 1) == 0) {
      [(id)VOTSharedWorkspace refreshBraille:0 rotorSelection:self->_rotorSelection];
    }
    -[VOTBrailleManager _setBrailleTable:](self, "_setBrailleTable:", self->_currentSetTable, (void)v28);
    [(VOTBrailleManager *)self _setBrailleInputTable:self->_currentSetInputTable];
  }
  else
  {
    uint64_t v26 = [(id)VOTSharedWorkspace softwareKeyboardManager];
    [v26 removeReasonToDisableSoftwareKeyboard:@"BrailleManager"];

    brailleElement = self->_brailleElement;
    self->_brailleElement = 0;

    [(VOTBrailleManager *)self _resetBrailleCursor];
  }
  [(VOTBrailleManager *)self bluetoothBrailleDisplayConnected];
  _AXSBrailleInputDeviceSetConnected();
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (BOOL)_isActiveUserDisplayConfig:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:kSCROBrailleDisplayState];
  if ([v4 unsignedIntegerValue] == (id)1)
  {
    int v5 = [v3 objectForKey:kSCROBrailleDisplayMainSize];
    BOOL v6 = (unint64_t)[v5 unsignedIntegerValue] > 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)handleShowOnscreenKeyboardToggle
{
  BOOL v2 = [(VOTBrailleManager *)self hasActiveBrailleDisplay];
  if (v2)
  {
    id v3 = +[AXSettings sharedInstance];
    unsigned int v4 = [v3 voiceOverShowSoftwareKeyboardWithBraille];

    uint64_t v5 = v4 ^ 1;
    BOOL v6 = +[AXSettings sharedInstance];
    [v6 setVoiceOverShowSoftwareKeyboardWithBraille:v5];
  }
  return v2;
}

- (void)_updateOnscreenKeyboardSettings
{
  if (AXUIKeyboardIsOOP())
  {
    id v3 = +[VOTElement inputUIApplication];
    unsigned int v4 = [v3 uiElement];
  }
  else
  {
    id v3 = [(id)VOTSharedWorkspace currentElement];
    uint64_t v5 = [v3 application];
    unsigned int v4 = [v5 uiElement];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v6 = [(SCROBrailleClient *)self->_brailleClient driverConfiguration];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {

LABEL_17:
    unsigned int v18 = +[NSNull null];
    [v4 setAXAttribute:2603 withObject:v18];

    goto LABEL_18;
  }
  id v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v6);
      }
      unsigned int v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if ([(VOTBrailleManager *)self _isActiveUserDisplayConfig:v12])
      {
        unsigned __int8 v13 = [v12 objectForKey:kSCROBrailleDisplayPostsKeyboardEvents];
        unsigned int v14 = [v13 BOOLValue];

        if (v14)
        {
          id v15 = [(id)VOTSharedWorkspace softwareKeyboardManager];
          char v9 = 1;
          [v15 setIsHardwareKeyboardAttached:1];

          unsigned int v16 = +[AXSettings sharedInstance];
          id v17 = [v16 voiceOverShowSoftwareKeyboardWithBraille];

          [v4 setAXAttribute:2603 withBOOL:v17];
        }
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v8);

  if ((v9 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
}

- (void)handleBrailleKeypress:(id)a3
{
  threadKey = self->_threadKey;
  id v5 = a3;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_handleBrailleKeypress:", threadKey, 0, 1, v5);

  id v6 = +[VOTUserEventManager sharedInstance];
  [v6 userEventOccurred];
}

- (void)handleUserEventOccured
{
  id v2 = +[VOTUserEventManager sharedInstance];
  [v2 userEventOccurred];
}

- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  threadKey = self->_threadKey;
  id v10 = a4;
  +[NSValue valueWithRange:](NSValue, "valueWithRange:", location, length);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v11 = +[NSNumber numberWithUnsignedInteger:a5];
  -[VOTBrailleManager performSelector:withThreadKey:count:objects:](self, "performSelector:withThreadKey:count:objects:", "_handleBrailleReplaceTextRange:withString:cursor:", threadKey, 3, v12, v10, v11);
}

- (void)_handleBrailleKeypress:(id)a3
{
  id v4 = a3;
  if ([(SCRCTargetSelectorTimer *)self->_hintTimer isPending]
    && ([(SCRCTargetSelectorTimer *)self->_hintTimer isCancelled] & 1) == 0)
  {
    [(SCRCTargetSelectorTimer *)self->_hintTimer dispatchAfterDelay:2.0];
  }
  NSUInteger v37 = +[SCROMobileBrailleDisplayInputManager sharedManager];
  self;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v5)
  {
    uint64_t v39 = *(void *)v43;
    __int16 v35 = v41;
    int v36 = kBRLTBrailleKeyboardKeyModifierNull;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v43 != v39) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v6);
        if (objc_opt_isKindOfClass())
        {
          sub_1000D6DE8(v7);
          [(SCROBrailleClient *)self->_brailleClient setPersistentKeyModifiers:self->_toggledModifiers];
          goto LABEL_45;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 command];
        }
        else {
        id v8 = objc_msgSend(v37, "commandForBrailleKey:", v7, v35);
        }
        char v9 = AXLogBrailleHW();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Dispatch braille command: %@ %@", buf, 0x16u);
        }

        if (v8)
        {
          unsigned int v10 = [(VOTBrailleManager *)self _handleKeyboardModifierCommands:v8];
          v48[0] = kVOTEventCommandTab;
          v48[1] = kVOTEventCommandReturn;
          v49[0] = &off_1001C5EA8;
          v49[1] = &off_1001C5EC0;
          v48[2] = kVOTEventCommandLeftArrow;
          v48[3] = kVOTEventCommandRightArrow;
          v49[2] = &off_1001C5ED8;
          v49[3] = &off_1001C5EF0;
          v48[4] = kVOTEventCommandUpArrow;
          v48[5] = kVOTEventCommandDownArrow;
          void v49[4] = &off_1001C5F08;
          v49[5] = &off_1001C5F20;
          double v11 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:6];
          id v12 = [v11 objectForKey:v8];
          if (v12)
          {
            BOOL v13 = [(SCROBrailleClient *)self->_brailleClient persistentKeyModifiers] == v36;

            if (!v13)
            {
              id v29 = objc_alloc_init((Class)SCROBrailleKeyboardKey);
              long long v30 = [v11 objectForKey:v8];
              objc_msgSend(v29, "setKeyCode:", objc_msgSend(v30, "unsignedIntegerValue"));

              objc_msgSend(v29, "setModifiers:", -[SCROBrailleClient persistentKeyModifiers](self->_brailleClient, "persistentKeyModifiers"));
              sub_1000D6DE8(v29);
              [(SCROBrailleClient *)self->_brailleClient setPersistentKeyModifiers:self->_toggledModifiers];

LABEL_66:
              goto LABEL_67;
            }
          }
          if (objc_msgSend(v8, "isEqualToString:", kVOTEventCommandBrailleRouter, v35))
          {
            if ([(VOTBrailleManager *)self _isTerminalModeOn])
            {
              long long v31 = +[VOTBrailleTerminalManager sharedManager];
              [v31 handleReturn];

              goto LABEL_66;
            }
            if ([(SCROBrailleClient *)self->_brailleClient displayMode] - 1 <= 2)
            {
              [(SCROBrailleClient *)self->_brailleClient exitCurrentDisplayMode];
              goto LABEL_41;
            }
LABEL_40:
            if (v10) {
              goto LABEL_41;
            }
LABEL_48:
            if ([(SCROBrailleClient *)self->_brailleClient displayMode] - 4 <= 0xFFFFFFFD)
            {
              id v19 = [objc_allocWithZone((Class)AXIndexMap) init];
              [v19 setObject:v7 forIndex:104];
              long long v20 = +[VOTEvent brailleEventWithCommand:v8 info:v19];
              long long v21 = +[VOTCommandHelper commandHelper];
              unsigned int v22 = [v21 helpEnabled];

              if (v22)
              {
                if (([v8 isEqualToString:kVOTEventCommandBraillePanRight] & 1) != 0
                  || ([v8 isEqualToString:kVOTEventCommandBraillePanLeft] & 1) != 0
                  || ([v8 isEqualToString:kVOTEventCommandBraillePanBeginning] & 1) != 0
                  || [v8 isEqualToString:kVOTEventCommandBraillePanEnd]
                  || [v8 isEqualToString:kVOTEventCommandEscape]
                  && (+[VOTCommandHelper commandHelper],
                      id v23 = objc_claimAutoreleasedReturnValue(),
                      [v23 practiceElement],
                      id v24 = objc_claimAutoreleasedReturnValue(),
                      BOOL v25 = v24 == 0,
                      v24,
                      v23,
                      v25))
                {
                  [v20 setBypassHelp:1];
                }
                else
                {
                  uint64_t v26 = [v7 identifier];
                  unsigned int v27 = objc_msgSend(v37, "buttonNamesForInputIdentifier:forDisplayWithToken:", v26, objc_msgSend(v7, "displayToken"));
                  [v20 setObject:v27 forIndex:105];
                }
              }
              [(id)VOTSharedWorkspace dispatchCommand:v20];

              goto LABEL_42;
            }
          }
          else
          {
            if ([v8 isEqualToString:kVOTEventCommandBraillePanLeft])
            {
              if (([(SCROBrailleClient *)self->_brailleClient displayMode] & 0xFFFFFFFE) != 2) {
                goto LABEL_40;
              }
              -[SCROBrailleClient panDisplayLeft:](self->_brailleClient, "panDisplayLeft:", [v7 displayToken]);
              goto LABEL_41;
            }
            if ([v8 isEqualToString:kVOTEventCommandBraillePanRight])
            {
              if (([(SCROBrailleClient *)self->_brailleClient displayMode] & 0xFFFFFFFE) != 2) {
                goto LABEL_40;
              }
              -[SCROBrailleClient panDisplayRight:](self->_brailleClient, "panDisplayRight:", [v7 displayToken]);
              goto LABEL_41;
            }
            if ([v8 isEqualToString:kVOTEventCommandBraillePlanarPanLeft])
            {
              if (objc_opt_respondsToSelector()) {
                -[SCROBrailleClient planarPanDisplayLeft:](self->_brailleClient, "planarPanDisplayLeft:", [v7 displayToken]);
              }
              goto LABEL_66;
            }
            if ([v8 isEqualToString:kVOTEventCommandBraillePlanarPanRight])
            {
              if (objc_opt_respondsToSelector()) {
                -[SCROBrailleClient planarPanDisplayRight:](self->_brailleClient, "planarPanDisplayRight:", [v7 displayToken]);
              }
              goto LABEL_66;
            }
            if ([v8 isEqualToString:kVOTEventCommandDelete])
            {
              if ([(SCROBrailleClient *)self->_brailleClient contractionMode]) {
                goto LABEL_40;
              }
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&uint8_t buf[16] = 0x2020000000;
              uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
              unsigned int v14 = [(SCROBrailleClient *)self->_brailleClient mainAttributedString];
              id v15 = [v14 length];
              v40[0] = _NSConcreteStackBlock;
              v40[1] = 3221225472;
              v41[0] = sub_1000D7A94;
              v41[1] = &unk_1001B6688;
              v41[2] = buf;
              objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", kSCROCursorAttribute, 0, v15, 0, v40);
              uint64_t v16 = *(void *)(*(void *)&buf[8] + 24);
              if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (v16 >= 1) {
                  *(void *)(*(void *)&buf[8] + 24) = --v16;
                }
                [(SCROBrailleClient *)self->_brailleClient rangeOfCellRepresentingCharacterAtIndex:v16];
                if (v17)
                {
                  [(VOTElement *)self->_brailleElement replaceCharactersAtCursor:v17 withString:&stru_1001B7888 source:2];

                  _Block_object_dispose(buf, 8);
                  goto LABEL_41;
                }
              }

              _Block_object_dispose(buf, 8);
              if ((v10 & 1) == 0) {
                goto LABEL_48;
              }
            }
            else
            {
              if ([v8 isEqualToString:kVOTEventCommandBrailleTranslateBrailleToClipboard])
              {
                [(SCROBrailleClient *)self->_brailleClient translateBrailleToClipboard];
                goto LABEL_40;
              }
              if ((([(VOTBrailleManager *)self handleCommandIfActiveBrailleRelated:v8] | v10) & 1) == 0)goto LABEL_48; {
            }
              }
LABEL_41:
            unsigned int v18 = (void *)VOTSharedWorkspace;
            id v19 = +[VOTEvent brailleEventWithCommand:kVOTEventCommandStopReadAll info:0];
            [v18 dispatchCommand:v19];
LABEL_42:
          }
        }

LABEL_45:
        id v6 = (char *)v6 + 1;
      }
      while (v5 != v6);
      id v28 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      id v5 = v28;
    }
    while (v28);
  }
LABEL_67:

  int v32 = [(VOTBrailleManager *)self keypressCallback];
  BOOL v33 = v32 == 0;

  if (!v33)
  {
    uint64_t v34 = [(VOTBrailleManager *)self keypressCallback];
    ((void (**)(void, id))v34)[2](v34, obj);
  }
}

- (BOOL)handleCommandIfActiveBrailleRelated:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kVOTEventCommandEscape])
  {
    id v5 = +[VOTBrailleTerminalManager sharedManager];
    unsigned __int8 v6 = [v5 handleEscape];

    if ((v6 & 1) == 0 && [(SCROBrailleClient *)self->_brailleClient displayMode] - 1 <= 2)
    {
      brailleClient = self->_brailleClient;
LABEL_7:
      [(SCROBrailleClient *)brailleClient exitCurrentDisplayMode];
LABEL_42:
      unsigned __int8 v21 = 1;
      goto LABEL_44;
    }
LABEL_43:
    unsigned __int8 v21 = 0;
    goto LABEL_44;
  }
  if ([v4 isEqualToString:kVOTEventCommandBrailleAnnouncementModeOn])
  {
    unsigned int v8 = [(SCROBrailleClient *)self->_brailleClient displayMode];
    brailleClient = self->_brailleClient;
    if (v8 != 2)
    {
      [(SCROBrailleClient *)brailleClient setAnnouncementsDisplayMode];
      goto LABEL_42;
    }
    goto LABEL_7;
  }
  if ([v4 isEqualToString:kVOTEventCommandPreviousElement])
  {
    unsigned int v9 = [(SCROBrailleClient *)self->_brailleClient displayMode];
    if (v9 == 3) {
      goto LABEL_42;
    }
    if (v9 == 2)
    {
      [(SCROBrailleClient *)self->_brailleClient showPreviousAnnouncement];
      goto LABEL_42;
    }
    unsigned int v12 = [(SCROBrailleClient *)self->_brailleClient isCandidateSelectionOn];
    BOOL v13 = self->_brailleClient;
    if (v12)
    {
      [(SCROBrailleClient *)v13 showPreviousCandidate];
      goto LABEL_42;
    }
    if ([(SCROBrailleClient *)v13 isWordDescriptionOn])
    {
      [(SCROBrailleClient *)self->_brailleClient showPreviousWordDescription];
      goto LABEL_42;
    }
    uint64_t v16 = +[VOTBrailleTerminalManager sharedManager];
    id v17 = [v16 state];

    if (v17 != (id)2) {
      goto LABEL_43;
    }
    unsigned int v18 = +[VOTBrailleTerminalManager sharedManager];
    [v18 handleLeftArrow];
LABEL_41:

    goto LABEL_42;
  }
  if ([v4 isEqualToString:kVOTEventCommandNextElement])
  {
    unsigned int v10 = [(SCROBrailleClient *)self->_brailleClient displayMode];
    if (v10 == 3) {
      goto LABEL_42;
    }
    if (v10 == 2)
    {
      [(SCROBrailleClient *)self->_brailleClient showNextAnnouncement];
      goto LABEL_42;
    }
    unsigned int v14 = [(SCROBrailleClient *)self->_brailleClient isCandidateSelectionOn];
    id v15 = self->_brailleClient;
    if (v14)
    {
      [(SCROBrailleClient *)v15 showNextCandidate];
      goto LABEL_42;
    }
    if ([(SCROBrailleClient *)v15 isWordDescriptionOn])
    {
      [(SCROBrailleClient *)self->_brailleClient showNextWordDescription];
      goto LABEL_42;
    }
    unsigned int v22 = +[VOTBrailleTerminalManager sharedManager];
    id v23 = [v22 state];

    if (v23 != (id)2) {
      goto LABEL_43;
    }
    unsigned int v18 = +[VOTBrailleTerminalManager sharedManager];
    [v18 handleRightArrow];
    goto LABEL_41;
  }
  if (![v4 isEqualToString:kVOTEventCommandReturn]
    || [(VOTElement *)self->_brailleElement doesHaveAllTraits:kAXTextEntryTrait])
  {
LABEL_33:
    if ([v4 isEqualToString:kVOTEventCommandFirstElement]
      && [(VOTBrailleManager *)self _isTerminalModeOn])
    {
      unsigned int v18 = +[VOTBrailleTerminalManager sharedManager];
      [v18 handleFirstElement];
    }
    else
    {
      if (![v4 isEqualToString:kVOTEventCommandLastElement]
        || ![(VOTBrailleManager *)self _isTerminalModeOn])
      {
        goto LABEL_43;
      }
      unsigned int v18 = +[VOTBrailleTerminalManager sharedManager];
      [v18 handleLastElement];
    }
    goto LABEL_41;
  }
  double v11 = +[VOTTextSearchManager sharedManager];
  if ([v11 textSearchModeIsOn])
  {

    goto LABEL_33;
  }
  unsigned int v19 = [(VOTBrailleManager *)self hasActiveBrailleDisplay];

  if (!v19) {
    goto LABEL_33;
  }
  long long v20 = +[VOTBrailleTerminalManager sharedManager];
  unsigned __int8 v21 = [v20 handleReturn];

LABEL_44:
  return v21;
}

- (BOOL)_handleKeyboardModifierCommands:(id)a3
{
  id v29 = a3;
  uint64_t v43 = 0;
  long long v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v3 = kBRLTBrailleKeyboardKeyModifierCommand;
  id v4 = +[NSNumber numberWithUnsignedInt:kBRLTBrailleKeyboardKeyModifierCommand];
  v51[0] = v4;
  v52[0] = @"command";
  unsigned int v32 = kBRLTBrailleKeyboardKeyModifierShift;
  id v5 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  v51[1] = v5;
  v52[1] = @"shift";
  uint64_t v6 = kBRLTBrailleKeyboardKeyModifierOption;
  id v7 = +[NSNumber numberWithUnsignedInt:kBRLTBrailleKeyboardKeyModifierOption];
  v51[2] = v7;
  v52[2] = @"option";
  uint64_t v8 = kBRLTBrailleKeyboardKeyModifierControl;
  unsigned int v9 = +[NSNumber numberWithUnsignedInt:kBRLTBrailleKeyboardKeyModifierControl];
  v51[3] = v9;
  v52[3] = @"control";
  uint64_t v10 = kBRLTBrailleKeyboardKeyModifierSecondaryFn;
  double v11 = +[NSNumber numberWithUnsignedInt:kBRLTBrailleKeyboardKeyModifierSecondaryFn];
  void v51[4] = v11;
  v52[4] = @"fn";
  id v28 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:5];

  v49[0] = kVOTEventCommandModifierCommand;
  unsigned int v12 = +[NSNumber numberWithUnsignedInt:v3];
  v50[0] = v12;
  v49[1] = kVOTEventCommandModifierShift;
  BOOL v13 = +[NSNumber numberWithUnsignedInt:v32];
  v50[1] = v13;
  v49[2] = kVOTEventCommandModifierOption;
  unsigned int v14 = +[NSNumber numberWithUnsignedInt:v6];
  v50[2] = v14;
  v49[3] = kVOTEventCommandModifierControl;
  id v15 = +[NSNumber numberWithUnsignedInt:v8];
  v50[3] = v15;
  void v49[4] = kVOTEventCommandModifierFn;
  uint64_t v16 = +[NSNumber numberWithUnsignedInt:v10];
  v50[4] = v16;
  long long v30 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000D8334;
  v38[3] = &unk_1001B66F8;
  id v17 = v29;
  id v39 = v17;
  NSUInteger v40 = self;
  id v18 = v28;
  id v41 = v18;
  long long v42 = &v43;
  [v30 enumerateKeysAndObjectsUsingBlock:v38];
  v47[0] = kVOTEventCommandModifierCommandToggle;
  unsigned int v19 = +[NSNumber numberWithUnsignedInt:v3];
  v48[0] = v19;
  v47[1] = kVOTEventCommandModifierShiftToggle;
  long long v20 = +[NSNumber numberWithUnsignedInt:v32];
  v48[1] = v20;
  v47[2] = kVOTEventCommandModifierOptionToggle;
  unsigned __int8 v21 = +[NSNumber numberWithUnsignedInt:v6];
  v48[2] = v21;
  v47[3] = kVOTEventCommandModifierControlToggle;
  unsigned int v22 = +[NSNumber numberWithUnsignedInt:v8];
  v48[3] = v22;
  v47[4] = kVOTEventCommandModifierFnToggle;
  id v23 = +[NSNumber numberWithUnsignedInt:v10];
  v48[4] = v23;
  id v24 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:5];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000D8464;
  v33[3] = &unk_1001B66F8;
  id v25 = v17;
  id v34 = v25;
  __int16 v35 = self;
  id v26 = v18;
  id v36 = v26;
  NSUInteger v37 = &v43;
  [v24 enumerateKeysAndObjectsUsingBlock:v33];
  LOBYTE(v19) = *((unsigned char *)v44 + 24) != 0;

  _Block_object_dispose(&v43, 8);
  return (char)v19;
}

- (void)_handleBrailleReplaceTextRange:(id)a3 withString:(id)a4 cursor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(VOTBrailleManager *)self _isTerminalModeOn])
  {
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x3032000000;
    v86 = sub_1000D8DDC;
    v87 = sub_1000D8DEC;
    id v16 = v9;
    id v88 = v16;
    id v17 = self->_brailleElement;
    id v18 = [(VOTElement *)self->_brailleElement textInputElement];
    if (v18 && [(VOTElement *)self->_brailleElement textInputElementRange] != (id)0x7FFFFFFF)
    {
      unsigned int v19 = v18;

      id v17 = v19;
    }
    v73 = +[VOTTextSearchManager sharedManager];
    if ([v73 textSearchModeIsOn])
    {
      id v20 = [v8 rangeValue];
      uint64_t v22 = v21;
      id v23 = [v10 unsignedIntegerValue];
      objc_msgSend(v73, "handleReplaceRange:withString:cursor:", v20, v22, v84[5], v23);
LABEL_56:

      _Block_object_dispose(&v83, 8);
      goto LABEL_57;
    }
    if (![(VOTElement *)v17 brailleTextEntrySupported])
    {
      id v30 = objc_alloc_init((Class)SCROBrailleKeyboardKey);
      [v30 setKeyString:v84[5]];
      sub_1000D6DE8(v30);
      [(VOTBrailleManager *)self _refreshBrailleLine];
LABEL_55:

      goto LABEL_56;
    }
    id v24 = (char *)[v8 rangeValue];
    uint64_t v26 = v25;
    unsigned int v27 = [(VOTElement *)v17 value];
    NSUInteger location = self->_brailleLineRange.location;
    v71 = v27;
    if (location <= (unint64_t)[v27 length])
    {
      id v29 = [v71 substringFromIndex:self->_brailleLineRange.location];
    }
    else
    {
      id v29 = &stru_1001B7888;
    }
    id v82 = 0;
    id v67 = v29;
    id v31 = sub_100053D00(v29, &v82);
    id v72 = v82;
    v69 = sub_100054218((unint64_t)v24, v26, v72);
    NSUInteger range2 = v32;
    BOOL v33 = (char *)[v10 unsignedIntegerValue];
    id v34 = v33;
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    uint64_t v81 = 0;
    if (v33 <= v24)
    {
      id v36 = (char *)sub_100054190((unint64_t)v33, v72);
    }
    else if (v33 <= &v24[(void)[v16 length]])
    {
      id v36 = &v34[v69 - v24];
    }
    else
    {
      __int16 v35 = (char *)sub_100054190(&v34[v26] - (unsigned char *)[v16 length], v72);
      id v36 = &v35[(void)[v16 length] - range2];
    }
    NSUInteger v37 = v79;
    v79[3] = (uint64_t)v36;
    NSUInteger v38 = self->_brailleLineRange.location;
    if (v36 != (char *)0x7FFFFFFFFFFFFFFFLL) {
      v37[3] = (uint64_t)&v36[v38];
    }
    if ((AXDeviceIsAudioAccessory() & 1) == 0)
    {
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_1000D8DF4;
      v74[3] = &unk_1001B6720;
      v76 = &v83;
      v74[4] = self;
      v77 = &v78;
      v75 = v17;
      id v39 = objc_retainBlock(v74);
      NSUInteger v40 = +[NSCharacterSet whitespaceCharacterSet];
      char v41 = ((uint64_t (*)(void *, void *))v39[2])(v39, v40);

      if ((v41 & 1) == 0) {
        ((void (*)(void *, NSMutableCharacterSet *))v39[2])(v39, self->_delimiters);
      }
    }
    long long v42 = +[AXSettings sharedInstance];
    uint64_t v43 = (char *)[v42 voiceOverHardwareTypingFeedback];

    id v68 = [(VOTElement *)v17 value];
    v89.NSUInteger length = (NSUInteger)[v68 length];
    long long v44 = &v69[v38];
    v89.NSUInteger location = 0;
    v90.NSUInteger location = (NSUInteger)v44;
    v90.NSUInteger length = range2;
    NSRange v45 = NSIntersectionRange(v89, v90);
    if (!range2 || v45.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v44 != [(VOTElement *)v17 selectedTextRange] || range2 != v53) {
        -[VOTElement setSelectedTextRange:refreshBraille:](v17, "setSelectedTextRange:refreshBraille:", v44, range2, 0);
      }
      if ([(VOTBrailleManager *)self _languageIsCJK]
        && ![(VOTBrailleManager *)self _languageIsNBSC])
      {
        id v48 = objc_alloc_init((Class)SCROBrailleKeyboardKey);
        [v48 setKeyString:v84[5]];
        sub_1000D6DE8(v48);
      }
      else
      {
        [(VOTElement *)v17 insertText:v84[5] source:2];
        unsigned __int8 v54 = [(VOTElement *)v17 doesHaveTraits:kAXSecureTextFieldTrait];
        if ((unint64_t)(v43 - 3) < 0xFFFFFFFFFFFFFFFELL) {
          char v55 = 1;
        }
        else {
          char v55 = v54;
        }
        if (v55)
        {
LABEL_50:
          unint64_t v61 = v79[3];
          char v62 = [(VOTElement *)v17 value];
          id v63 = [v62 length];

          if (v61 <= (unint64_t)v63)
          {
            id v64 = (id)v79[3];
            if (v64 != [(VOTElement *)v17 selectedTextRange] || v65) {
              -[VOTElement setSelectedTextRange:refreshBraille:](v17, "setSelectedTextRange:refreshBraille:", v64, 0, 1);
            }
          }

          _Block_object_dispose(&v78, 8);
          id v18 = v66;
          id v30 = v71;
          goto LABEL_55;
        }
        id v48 = [objc_allocWithZone((Class)VOTOutputRequest) init];
        uint64_t v56 = v84[5];
        id v57 = [(VOTBrailleManager *)self _localeIdentifierForCurrentTable];
        id v58 = [v48 addString:v56 withLanguage:v57];

        [v48 setGeneratesBraille:0];
        [v48 setDoesNotInterrupt:1];
        [v48 send];
      }
    }
    else
    {
      unsigned __int8 v46 = [(VOTElement *)v17 doesHaveTraits:kAXSecureTextFieldTrait];
      if ((unint64_t)(v43 - 3) < 0xFFFFFFFFFFFFFFFELL) {
        char v47 = 1;
      }
      else {
        char v47 = v46;
      }
      if ((v47 & 1) != 0 || [(id)v84[5] length])
      {
        id v48 = 0;
      }
      else
      {
        objc_msgSend(v68, "substringWithRange:", v45.location, v45.length);
        id v48 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[VOTElement setSelectedTextRange:refreshBraille:](v17, "setSelectedTextRange:refreshBraille:", &v44[range2], 0, 0);
      [(VOTElement *)v17 replaceCharactersAtCursor:range2 withString:v84[5] source:2];
      if ((v47 & 1) == 0)
      {
        id v49 = [objc_allocWithZone((Class)VOTOutputRequest) init];
        if (v48)
        {
          id v50 = [objc_alloc((Class)AXAttributedString) initWithString:v48];
          [v50 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenLowPitch];
          char v51 = [(VOTBrailleManager *)self _localeIdentifierForCurrentTable];
          id v52 = [v49 addAttributedString:v50 withLanguage:v51];
        }
        else
        {
          uint64_t v59 = v84[5];
          id v50 = [(VOTBrailleManager *)self _localeIdentifierForCurrentTable];
          id v60 = [v49 addString:v59 withLanguage:v50];
        }

        [v49 setGeneratesBraille:0];
        [v49 send];
      }
    }

    goto LABEL_50;
  }
  id v11 = [v8 rangeValue];
  uint64_t v13 = v12;
  id v14 = [v10 unsignedIntegerValue];
  id v15 = +[VOTBrailleTerminalManager sharedManager];
  objc_msgSend(v15, "replaceCommandRange:withString:cursor:", v11, v13, v9, v14);

LABEL_57:
}

- (void)handleBrailleInsertedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  uint64_t v6 = self->_brailleElement;
  id v7 = [(VOTElement *)self->_brailleElement textInputElement];
  if (v7 && [(VOTElement *)self->_brailleElement textInputElementRange] != (id)0x7FFFFFFF)
  {
    id v8 = v7;

    uint64_t v6 = v8;
  }
  uint64_t v9 = kAXSecureTextFieldTrait;
  if ([(VOTElement *)v6 doesHaveTraits:kAXSecureTextFieldTrait])
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    id v11 = [(VOTElement *)v6 application];
    uint64_t v12 = [v11 firstResponderElement];
    unsigned __int8 v10 = [v12 doesHaveTraits:v9];
  }
  uint64_t v13 = +[AXFirstResponderValueChangeManager sharedInstance];
  id v14 = [v13 wordBreakSet];

  id v15 = +[AXSettings sharedInstance];
  unint64_t v16 = (unint64_t)[v15 voiceOverHardwareTypingFeedback];

  if ((v10 & 1) == 0 && (v16 | 2) == 2)
  {
    id v17 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v18 = [v27 length];
    if (v16 == 2
      && v18
      && objc_msgSend(v14, "characterIsMember:", objc_msgSend(v27, "characterAtIndex:", 0)))
    {
      unsigned int v19 = sub_10005376C(v6, 0);
      if (v19) {
        id v20 = [objc_alloc((Class)AXAttributedString) initWithString:v19];
      }
      else {
        id v20 = 0;
      }
    }
    else
    {
      id v20 = [objc_alloc((Class)AXAttributedString) initWithString:v27];
      unsigned int v19 = +[NSNumber numberWithBool:v4];
      [v20 setAttribute:v19 forKey:UIAccessibilityTokenLiteralText];
    }

    uint64_t v21 = [(VOTBrailleManager *)self _localeIdentifierForCurrentInputTable];
    id v22 = [v17 addAttributedString:v20 withLanguage:v21];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      id v23 = [v17 outputActions];
      id v24 = [v23 lastObject];
      LODWORD(v25) = 1.5;
      uint64_t v26 = +[NSNumber numberWithFloat:v25];
      [v24 setObject:v26 forVariant:32];
    }
    [v17 setGeneratesBraille:0];
    [v17 send];
  }
}

- (void)handleBrailleDeletedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4
{
  BOOL v4 = a4;
  id v37 = a3;
  uint64_t v6 = self->_brailleElement;
  id v7 = [(VOTElement *)self->_brailleElement textInputElement];
  if (v7 && [(VOTElement *)self->_brailleElement textInputElementRange] != (id)0x7FFFFFFF)
  {
    id v8 = v7;

    uint64_t v6 = v8;
  }
  uint64_t v9 = kAXSecureTextFieldTrait;
  if ([(VOTElement *)v6 doesHaveTraits:kAXSecureTextFieldTrait])
  {
    int v10 = 0;
  }
  else
  {
    id v11 = [(VOTElement *)v6 application];
    uint64_t v12 = [v11 firstResponderElement];
    unsigned int v13 = [v12 doesHaveTraits:v9];

    int v10 = v13 ^ 1;
  }
  id v14 = +[AXSettings sharedInstance];
  unint64_t v15 = (unint64_t)[v14 voiceOverHardwareTypingFeedback];

  if (v10 && (v15 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    id v16 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v17 = +[AXSettings sharedInstance];
    id v18 = [v17 voiceOverDeletionFeedback];

    if (v18)
    {
      unsigned int v19 = +[AXSettings sharedInstance];
      id v20 = [v19 voiceOverDeletionFeedback];

      if (v20 == (id)3)
      {
        id v21 = 0;
        uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        id v23 = &stru_1001B7888;
      }
      else
      {
        id v23 = (__CFString *)v37;
        id v21 = 0;
        uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      id v24 = sub_100051804(off_1001EA9E8, @"delete.text.prefix", 0);
      uint64_t v22 = (uint64_t)[v24 rangeOfString:@"%@"];
      id v21 = [v37 length];
      id v36 = v37;
      AXCFormattedString();
      id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    double v25 = [(VOTBrailleManager *)self _localeIdentifierForCurrentTable];
    id v26 = [v16 addString:v23 withLanguage:v25];

    if (v4 && v22 != 0x7FFFFFFFFFFFFFFFLL && v21 == (id)1)
    {
      id v27 = +[NSMutableIndexSet indexSet];
      objc_msgSend(v27, "addIndexesInRange:", v22, 1);
      id v28 = [v16 outputActions];
      id v29 = [v28 lastObject];
      [v29 setObject:v27 forVariant:29];
    }
    [v16 setGeneratesBraille:0];
    id v30 = +[AXSettings sharedInstance];
    id v31 = [v30 voiceOverDeletionFeedback];

    if (v31 == (id)1)
    {
      NSUInteger v32 = [v16 outputActions];
      [v32 enumerateObjectsUsingBlock:&stru_1001B6740];
    }
    BOOL v33 = +[AXSettings sharedInstance];
    id v34 = [v33 voiceOverDeletionFeedback];

    if (v34 == (id)2)
    {
      __int16 v35 = [v16 outputActions];
      [v35 enumerateObjectsUsingBlock:&stru_1001B6760];
    }
    [v16 send];
  }
}

- (void)handleBrailleSpeechRequest:(id)a3 language:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  id v6 = [objc_allocWithZone((Class)VOTOutputRequest) init];
  id v7 = [objc_alloc((Class)AXAttributedString) initWithString:v5];

  id v8 = [v6 addAttributedString:v7 withLanguage:v9];
  [v6 setGeneratesBraille:0];
  [v6 send];
}

- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6
{
  threadKey = self->_threadKey;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [(VOTBrailleManager *)self threadWaitTime];
  double v16 = v15;
  id v17 = +[NSNumber numberWithInt:0];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_dispatchBrailleDidPanWithSuccess:elementToken:appToken:direction:lineOffset:", threadKey, 0, 5, v14, v16, v13, v12, v17, v11);

  id v18 = +[VOTUserEventManager sharedInstance];
  [v18 userEventOccurred];
}

- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6
{
  threadKey = self->_threadKey;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [(VOTBrailleManager *)self threadWaitTime];
  double v16 = v15;
  id v17 = +[NSNumber numberWithInt:1];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_dispatchBrailleDidPanWithSuccess:elementToken:appToken:direction:lineOffset:", threadKey, 0, 5, v14, v16, v13, v12, v17, v11);

  id v18 = +[VOTUserEventManager sharedInstance];
  [v18 userEventOccurred];
}

- (void)handleBrailleDisplayCopyStringToClipboard:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSpringBoardServer server];
  [v4 copyStringToPasteboard:v3];
}

- (BOOL)_brailleShouldTryToTurnPage:(id)a3 direction:(int64_t)a4
{
  id v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 voiceOverTouchBraillePanningAutoTurnsReadingContent];

  if (!v7) {
    return 0;
  }
  brailleElement = self->_brailleElement;
  if (a4 == 2)
  {
    if ([(VOTElement *)brailleElement isReadingContent]) {
      unsigned __int8 v9 = 1;
    }
    else {
      unsigned __int8 v9 = [(VOTElement *)self->_brailleElement includeDuringContentReading];
    }
    id v11 = [(VOTElement *)self->_brailleElement previousElement];
    if ([v11 isReadingContent])
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      id v13 = [(VOTElement *)self->_brailleElement previousElement];
      unsigned int v12 = [v13 includeDuringContentReading] ^ 1;
    }
    return v9 & v12;
  }
  else
  {
    return [(VOTElement *)brailleElement readingContentCausesPageTurn];
  }
}

- (void)_dispatchBrailleDidPanWithSuccess:(id)a3 elementToken:(id)a4 appToken:(id)a5 direction:(id)a6 lineOffset:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  double v15 = VOTLogBraille();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v45 = v13;
    __int16 v46 = 2112;
    id v47 = v11;
    __int16 v48 = 2112;
    id v49 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "braille pan direction: %@, success: %@, lineoffset: %@", buf, 0x20u);
  }

  self->_int lastBraillePanDirection = [v13 intValue];
  self->_lastBraillePanSucceeded = [v11 BOOLValue];
  self->_int64_t brailleLineOffset = (int64_t)[v14 integerValue];
  if (([v11 BOOLValue] & 1) == 0)
  {
    double v16 = +[VOTCommandHelper commandHelper];
    unsigned int v17 = [v16 helpEnabled];

    if (v17)
    {
      unsigned int v18 = [v13 intValue];
      unsigned int v19 = (id *)&kVOTEventCommandBraillePanLeft;
      if (v18) {
        unsigned int v19 = (id *)&kVOTEventCommandBraillePanRight;
      }
      id v20 = *v19;
      id v21 = +[VOTEvent brailleEventWithCommand:v20 info:0];
      [(id)VOTSharedWorkspace dispatchCommand:v21];
LABEL_10:

LABEL_11:
      goto LABEL_12;
    }
    switch([(SCROBrailleClient *)self->_brailleClient displayMode])
    {
      case 0u:
        if ([(SCROBrailleClient *)self->_brailleClient isCandidateSelectionOn]) {
          break;
        }
        if ([(SCROBrailleClient *)self->_brailleClient isWordDescriptionOn])
        {
          if ([v13 intValue])
          {
            if ([v13 intValue] == 1) {
              [(SCROBrailleClient *)self->_brailleClient showNextWordDescription];
            }
          }
          else
          {
            [(SCROBrailleClient *)self->_brailleClient showPreviousWordDescription];
          }
          break;
        }
        if ([(VOTBrailleManager *)self _isTerminalModeOn])
        {
          id v24 = +[VOTBrailleTerminalManager sharedManager];
          id v25 = [v24 state];

          if (v25 != (id)2) {
            break;
          }
          if ([v13 intValue])
          {
            if ([v13 intValue] != 1) {
              break;
            }
            id v21 = +[VOTBrailleTerminalManager sharedManager];
            [v21 handleRightArrow];
          }
          else
          {
            id v21 = +[VOTBrailleTerminalManager sharedManager];
            [v21 handleLeftArrow];
          }
          goto LABEL_11;
        }
        if ([v12 unsignedIntegerValue] != self->_brailleElementIndex) {
          break;
        }
        unsigned int v26 = [v13 intValue];
        NSUInteger location = self->_brailleLineRange.location;
        if (v26)
        {
          if (location != 0x7FFFFFFFFFFFFFFFLL)
          {
            NSUInteger v28 = self->_brailleLineRange.length + location;
            if (v28 < self->_brailleDescriptionRange.length + self->_brailleDescriptionRange.location)
            {
              self->_brailleLineRange.NSUInteger location = v28 + 1;
              self->_brailleLineRange.NSUInteger length = 0;
              if ([(VOTElement *)self->_brailleElement brailleTextEntrySupported])
              {
                id v29 = [(VOTElement *)self->_brailleElement textInputElement];
                if (v29)
                {
                  id v30 = [(VOTElement *)self->_brailleElement textInputElementRange];
                  if (v30 != (id)0x7FFFFFFF && self->_brailleLineRange.location > (unint64_t)v30 + v31)
                  {
                    NSUInteger v32 = (id *)&kVOTEventCommandNextElement;
                    goto LABEL_46;
                  }
                }
LABEL_56:

                goto LABEL_57;
              }
              goto LABEL_57;
            }
          }
          if ([(VOTBrailleManager *)self _brailleShouldTryToTurnPage:self->_brailleElement direction:1])
          {
            BOOL v33 = (void *)kVOTEventCommandScrollRightPage;
LABEL_52:
            id v37 = v33;
            self->_brailleLineRange = (_NSRange)xmmword_10016E5C0;
            goto LABEL_61;
          }
          if ([(VOTElement *)self->_brailleElement isLiveCaptionsTextView])
          {
            NSUInteger v40 = [(VOTElement *)self->_brailleElement nextElement];
            unsigned int v41 = [v40 isLiveCaptionsTextView];

            if (!v41) {
              goto LABEL_58;
            }
          }
          long long v42 = (id *)&kVOTEventCommandNextElement;
        }
        else
        {
          if (location != 0x7FFFFFFFFFFFFFFFLL && location > self->_brailleDescriptionRange.location)
          {
            self->_brailleLineRange.NSUInteger location = location - 1;
            self->_brailleLineRange.NSUInteger length = 0;
            if ([(VOTElement *)self->_brailleElement brailleTextEntrySupported])
            {
              id v29 = [(VOTElement *)self->_brailleElement textInputElement];
              if (v29)
              {
                id v34 = [(VOTElement *)self->_brailleElement textInputElementRange];
                if (v34 != (id)0x7FFFFFFF && self->_brailleLineRange.location < (unint64_t)v34)
                {
                  NSUInteger v32 = (id *)&kVOTEventCommandPreviousElement;
LABEL_46:
                  id v35 = *v32;
                  id v36 = v29;
                  id v37 = v35;

                  if (v37) {
                    goto LABEL_61;
                  }
                  goto LABEL_57;
                }
              }
              goto LABEL_56;
            }
LABEL_57:
            [(VOTBrailleManager *)self _refreshBrailleLinePreferringPositionOverRotorSelection:1 knownLineRange:0 updatedPosition:0];
LABEL_58:
            id v37 = 0;
            goto LABEL_61;
          }
          if ([(VOTElement *)self->_brailleElement isLiveCaptionsTextView])
          {
            NSUInteger v38 = [(VOTElement *)self->_brailleElement previousElement];
            unsigned int v39 = [v38 isLiveCaptionsTextView];

            if (!v39) {
              goto LABEL_58;
            }
          }
          if ([(VOTBrailleManager *)self _brailleShouldTryToTurnPage:self->_brailleElement direction:2])
          {
            BOOL v33 = (void *)kVOTEventCommandScrollLeftPage;
            goto LABEL_52;
          }
          long long v42 = (id *)&kVOTEventCommandPreviousElement;
        }
        id v37 = *v42;
LABEL_61:
        if (v37 == (id)kVOTEventCommandScrollLeftPage || v37 == (id)kVOTEventCommandScrollRightPage)
        {
          [(VOTBrailleManager *)self setPanEnabled:0];
          AXPerformBlockOnMainThreadAfterDelay();
        }
        if (v37)
        {
          uint64_t v43 = +[VOTEvent brailleEventWithCommand:v37 info:0];
          [v43 setObject:&__kCFBooleanTrue forIndex:119];
          [(id)VOTSharedWorkspace dispatchCommand:v43];
        }
        break;
      case 1u:
      case 3u:
        id v21 = +[VOTOutputManager outputManager];
        id v20 = +[VOSOutputEvent BoundaryEncountered];
        [v21 sendEvent:v20];
        goto LABEL_10;
      case 2u:
        unsigned int v22 = [v13 intValue];
        brailleClient = self->_brailleClient;
        if (v22) {
          [(SCROBrailleClient *)brailleClient showNextAnnouncement];
        }
        else {
          [(SCROBrailleClient *)brailleClient showPreviousAnnouncement];
        }
        break;
      default:
        break;
    }
  }
LABEL_12:
}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  BOOL v3 = a3;
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  double v7 = v6;
  id v8 = +[NSNumber numberWithBool:v3];
  [(VOTBrailleManager *)self performSelector:"_dispatchPlanarPanFailedIsLeft:" withThreadKey:threadKey waitTime:0 cancelMask:1 count:v8 objects:v7];

  id v9 = +[VOTUserEventManager sharedInstance];
  [v9 userEventOccurred];
}

- (void)_dispatchPlanarPanFailedIsLeft:(id)a3
{
  id v3 = a3;
  id v5 = +[VOTPlanarBrailleManager manager];
  id v4 = [v3 BOOLValue];

  [v5 handlePlanarPanFailedIsLeft:v4];
}

- (void)setPersistentKeyModifiers:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DA2C4;
  v3[3] = &unk_1001B5CC8;
  v3[4] = self;
  unsigned int v4 = a3;
  [(VOTBrailleManager *)self performAsyncBlock:v3 forThreadKey:self->_threadKey];
}

- (void)setLastUserInteractionTime:(double)a3
{
  if (a3 - self->_lastUserInteractionTime >= 2.0)
  {
    self->_lastUserInteractionTime = a3;
    id v5 = AXLogBrailleHW();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting last user interaction time: %f", buf, 0xCu);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_1000DA3F8;
    v6[3] = &unk_1001B35D0;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    [(VOTBrailleManager *)self performAsyncBlock:v6 forThreadKey:self->_threadKey];
  }
}

- (void)setBrailleMap:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DA4AC;
  v5[3] = &unk_1001B3448;
  double v6 = self;
  id v7 = a3;
  threadKey = v6->_threadKey;
  id v4 = v7;
  [(VOTBrailleManager *)v6 performAsyncBlock:v5 forThreadKey:threadKey];
}

- (unsigned)persistentKeyModifiers
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000DA558;
  v6[3] = &unk_1001B6788;
  v6[4] = self;
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  id v4 = -[VOTBrailleManager valueForBlock:forThreadKey:waitTime:](self, "valueForBlock:forThreadKey:waitTime:", v6, threadKey);
  LODWORD(threadKey) = [v4 unsignedIntValue];

  return threadKey;
}

- (void)handleBraillePlayDisplayConnectionSound:(id)a3
{
  threadKey = self->_threadKey;
  id v5 = a3;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_handleBraillePlayDisplayConnectionSound:", threadKey, 0, 1, v5);
}

- (void)_handleBraillePlayDisplayConnectionSound:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  id v5 = +[VOTOutputManager outputManager];
  if (v4) {
    +[VOSOutputEvent BrailleDisplayConnected];
  }
  else {
  double v6 = +[VOSOutputEvent BrailleDisplayDisconnected];
  }
  [v5 sendEvent:v6];

  [(VOTBrailleManager *)self _updateTactileGraphicsDisplays];
}

- (void)_updateTactileGraphicsDisplays
{
  id v3 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unsigned int v4 = [(SCROBrailleClient *)self->_brailleClient driverConfiguration];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) objectForKeyedSubscript:kSCROBrailleDisplayCanvasDescriptor];
        int v10 = v9;
        if (v9 && [v9 width] && objc_msgSend(v10, "height"))
        {
          CGFloat v11 = (double)(unint64_t)[v10 width];
          v22.height = (double)(unint64_t)[v10 height];
          v22.width = v11;
          id v12 = NSStringFromCGSize(v22);
          [v3 addObject:v12];
        }
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  id v13 = AXLogBrailleHW();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating tactile graphics: %@", buf, 0xCu);
  }

  id v14 = [v3 copy];
  _AXSVoiceOverTouchSetActive2DBrailleDisplays();
}

- (void)handleBraillePlayBorderHitSound
{
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];

  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_handleBraillePlayBorderHitSound", threadKey, 0, 0, 0);
}

- (void)_handleBraillePlayBorderHitSound
{
  id v3 = +[VOTOutputManager outputManager];
  id v2 = +[VOSOutputEvent BoundaryEncountered];
  [v3 sendEvent:v2];
}

- (void)handleBraillePlayCommandNotSupportedSound
{
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];

  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_handleBraillePlayCommandNotSupportedSound", threadKey, 0, 0, 0);
}

- (void)_handleBraillePlayCommandNotSupportedSound
{
  id v3 = +[VOTOutputManager outputManager];
  id v2 = +[VOSOutputEvent BoundaryEncountered];
  [v3 sendEvent:v2];
}

- (void)handleDisplayModeChanged:(id)a3
{
  threadKey = self->_threadKey;
  id v5 = a3;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "_handleDisplayModeChanged:", threadKey, 0, 1, v5);
}

- (void)_handleDisplayModeChanged:(id)a3
{
  id v6 = a3;
  if ([(SCRCTargetSelectorTimer *)self->_hintTimer isPending]
    && ([(SCRCTargetSelectorTimer *)self->_hintTimer isCancelled] & 1) == 0)
  {
    unsigned int v4 = [v6 intValue];
    double v5 = kCFAbsoluteTimeIntervalSince1904;
    if (!v4) {
      double v5 = 2.0;
    }
    [(SCRCTargetSelectorTimer *)self->_hintTimer dispatchAfterDelay:v5];
  }
}

- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3
{
  unsigned int v3 = [a3 BOOLValue];
  id v5 = +[VOTOutputManager outputManager];
  if (v3) {
    +[VOSOutputEvent DidWrapBackwards];
  }
  else {
  unsigned int v4 = +[VOSOutputEvent BoundaryEncountered];
  }
  [v5 sendEvent:v4];
}

- (void)handleBrailleDidShowNextAnnouncement:(id)a3
{
  unsigned int v3 = [a3 BOOLValue];
  id v5 = +[VOTOutputManager outputManager];
  if (v3) {
    +[VOSOutputEvent DidWrapForwards];
  }
  else {
  unsigned int v4 = +[VOSOutputEvent BoundaryEncountered];
  }
  [v5 sendEvent:v4];
}

- (void)handleBrailleStartEditing
{
  if (![(VOTElement *)self->_brailleElement brailleTextEntrySupported])
  {
    id v3 = objc_alloc((Class)NSAttributedString);
    v7[0] = kSCROEditableTextAttribute;
    v7[1] = kSCROEditableTextPaddingAttribute;
    v8[0] = &__kCFBooleanTrue;
    v8[1] = &__kCFBooleanTrue;
    v7[2] = kSCROTokenAttribute;
    unsigned int v4 = +[NSNumber numberWithUnsignedInteger:self->_brailleElementIndex];
    v7[3] = kSCROCursorAttribute;
    v8[2] = v4;
    v8[3] = &__kCFBooleanTrue;
    id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
    id v6 = [v3 initWithString:@" " attributes:v5];

    [(SCROBrailleClient *)self->_brailleClient setMainAttributedString:v6];
    [(SCROBrailleClient *)self->_brailleClient displayIfNeeded];
  }
}

- (id)currentBrailleTableIdentifier
{
  return [(BRLTTable *)self->_currentSetTable identifier];
}

- (BRLTTable)brailleTableFromSettings
{
  id v3 = [(id)VOTSharedWorkspace selectedBrailleTable];
  if (!v3)
  {
    unsigned int v4 = +[AXLanguageManager sharedInstance];
    id v5 = [v4 userLocale];

    id v6 = [(VOTBrailleManager *)self _defaultLanguageRotorItem];
    uint64_t v7 = [(VOTBrailleManager *)self _tableIdentifierFromDefaultRotorItem:v6 forLocale:v5];
    if (v7)
    {
      id v8 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v7];
    }
    else
    {
      id v8 = +[BRLTTableEnumerator defaultTableForLocale:v5];
    }
    id v3 = v8;
  }

  return (BRLTTable *)v3;
}

- (BRLTTable)brailleInputTableFromSettings
{
  id v3 = [(id)VOTSharedWorkspace selectedBrailleInputTable];
  if (!v3)
  {
    unsigned int v4 = +[AXLanguageManager sharedInstance];
    id v5 = [v4 userLocale];

    id v6 = [(VOTBrailleManager *)self _defaultLanguageRotorItem];
    uint64_t v7 = [(VOTBrailleManager *)self _tableIdentifierFromDefaultRotorItem:v6 forLocale:v5];
    if (v7)
    {
      id v8 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v7];
    }
    else
    {
      id v8 = +[BRLTTableEnumerator defaultTableForLocale:v5];
    }
    id v3 = v8;
  }

  return (BRLTTable *)v3;
}

- (id)_defaultLanguageRotorItem
{
  [(id)VOTSharedWorkspace brailleLanguageRotorItems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "objectForKeyedSubscript:", @"Default", (void)v12);
        unsigned int v9 = [v8 BOOLValue];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)_tableIdentifierFromDefaultRotorItem:(id)a3 forLocale:(id)a4
{
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:@"LanguageDefaults"];
  uint64_t v7 = [v5 localeIdentifier];

  id v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)_localeIdentifierForCurrentTable
{
  return [(BRLTTable *)self->_currentSetTable localeIdentifier];
}

- (id)_localeIdentifierForCurrentInputTable
{
  return [(BRLTTable *)self->_currentSetInputTable localeIdentifier];
}

- (id)_localeIdentifierForTableIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v3];

  id v5 = [v4 localeIdentifier];

  return v5;
}

- (void)setTestingHasActiveDisplay:(BOOL)a3
{
  self->_testingHasActiveDisplay = a3;
  self->_BOOL hasActiveDisplay = a3;
}

- (BOOL)testingHasActiveDisplay
{
  if (self->_testingHasActiveDisplay) {
    return 1;
  }
  id v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 voiceOverTouchUpdateBrailleWithoutConnectedDisplay];

  return v4;
}

- (unint64_t)testingBrailleElementIndex
{
  id v2 = [(VOTBrailleManager *)self valueForKeyPath:@"_brailleElementIndex" forThreadKey:self->_threadKey waitTime:kSCRCThreadWaitForever];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)testingBrailleElement
{
  return self->_brailleElement;
}

- (NSAttributedString)testingMainAttributedString
{
  return (NSAttributedString *)[(SCROBrailleClient *)self->_brailleClient mainAttributedString];
}

- (_NSRange)rangeOfCellRepresentingCharacterAtIndex:(int64_t)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DB334;
  v9[3] = &unk_1001B67B0;
  v9[4] = self;
  v9[5] = a3;
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager valueForBlock:forThreadKey:waitTime:](self, "valueForBlock:forThreadKey:waitTime:", v9, threadKey);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSRange v6 = NSRangeFromString(v5);

  NSUInteger location = v6.location;
  NSUInteger length = v6.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (SCROBrailleClient)testingBrailleClient
{
  threadKey = self->_threadKey;
  [(VOTBrailleManager *)self threadWaitTime];
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:](self, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", "testingBrailleElement", threadKey, 0, 0, 0);
  brailleClient = self->_brailleClient;

  return brailleClient;
}

- (void)unitTestHandleBrailleKeypress:(id)a3
{
}

- (void)configureForUnitTesting
{
  [(VOTBrailleManager *)self setThreadWaitTime:kSCRCThreadWaitMedium];

  [(VOTBrailleManager *)self setTestingHasActiveDisplay:1];
}

- (BOOL)brailleEnabled
{
  if (AXDeviceIsAudioAccessory()) {
    return 0;
  }
  if (self->_hasActiveDisplay) {
    return 1;
  }

  return [(VOTBrailleManager *)self testingHasActiveDisplay];
}

- (BOOL)testingKeyboardHelpIsOn
{
  return self->_testingKeyboardHelpOn;
}

- (id)testingAggregatedStatus
{
  return [(VOTBrailleManager *)self valueForKeyPath:@"_testingAggregatedStatus" forThreadKey:self->_threadKey waitTime:kSCRCThreadWaitForever];
}

- (void)resetTestingAggregatedStatus
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000DB508;
  v2[3] = &unk_1001B33B8;
  v2[4] = self;
  [(VOTBrailleManager *)self performAsyncBlock:v2 forThreadKey:self->_threadKey];
}

- (BOOL)_isTerminalModeOn
{
  id v2 = +[VOTBrailleTerminalManager sharedManager];
  BOOL v3 = [v2 state] != 0;

  return v3;
}

- (void)refreshBrailleForTerminalOutput:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSAttributedString);
  v9[0] = kSCROTokenAttribute;
  NSRange v6 = +[NSNumber numberWithUnsignedInteger:self->_brailleElementIndex];
  v9[1] = kSCROTerminalOutputAttribute;
  v10[0] = v6;
  v10[1] = &__kCFBooleanTrue;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = [v5 initWithString:v4 attributes:v7];

  [(SCROBrailleClient *)self->_brailleClient setMainAttributedString:v8];
  [(SCROBrailleClient *)self->_brailleClient displayIfNeeded];
}

- (void)refreshBrailleForTerminalCommand:(id)a3 cursor:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)NSMutableAttributedString);
  uint64_t v17 = kSCROEditableTextAttribute;
  long long v18 = &__kCFBooleanTrue;
  id v8 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v9 = [v7 initWithString:v6 attributes:v8];

  id v10 = objc_alloc((Class)NSMutableAttributedString);
  uint64_t v15 = kSCROEditableTextPaddingAttribute;
  long long v16 = &__kCFBooleanTrue;
  CGFloat v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v12 = [v10 initWithString:@" " attributes:v11];

  [v9 appendAttributedString:v12];
  objc_msgSend(v9, "addAttribute:value:range:", kSCROCursorAttribute, &__kCFBooleanTrue, a4, 1);
  uint64_t v13 = kSCROTokenAttribute;
  long long v14 = +[NSNumber numberWithUnsignedInteger:self->_brailleElementIndex];
  objc_msgSend(v9, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v9, "length"));

  [(SCROBrailleClient *)self->_brailleClient setMainAttributedString:v9];
  [(SCROBrailleClient *)self->_brailleClient displayIfNeeded];
}

- (int64_t)numberOfTextLinesInPlanarBraille
{
  return (int64_t)[(SCROBrailleClient *)self->_brailleClient numberOfTextLinesInPlanarBraille];
}

- (void)setPlanarData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DB8F0;
  v5[3] = &unk_1001B3448;
  id v6 = self;
  id v7 = a3;
  threadKey = v6->_threadKey;
  id v4 = v7;
  [(VOTBrailleManager *)v6 performAsyncBlock:v5 forThreadKey:threadKey];
}

- (BOOL)handleKeyboardPerkinsInput:(id)a3 chordOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NSLock *)self->_keyboardVirtualDisplayLock lock];
  if (qword_1001EBAE0 != -1) {
    dispatch_once(&qword_1001EBAE0, &stru_1001B67D0);
  }
  id v7 = (void *)qword_1001EBAD8;
  id v8 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v6 keyCode]);
  id v9 = [v7 objectForKeyedSubscript:v8];

  id v10 = [v9 unsignedIntegerValue];
  if (v4 && v9)
  {
    if ((self->_keyboardVirtualDisplayRegisteredKeys & 0x200) == 0 && v10 != (id)512)
    {
      LOBYTE(v11) = 0;
      goto LABEL_28;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
    if (v4 || !v9) {
      goto LABEL_28;
    }
  }
  unsigned int v12 = [v6 keyDown];
  keyboardVirtualDisplayDownKeys = self->_keyboardVirtualDisplayDownKeys;
  if (v12)
  {
    [(NSMutableSet *)keyboardVirtualDisplayDownKeys addObject:v9];
    unint64_t v14 = self->_keyboardVirtualDisplayRegisteredKeys | (unint64_t)[v9 unsignedIntegerValue];
    self->_unint64_t keyboardVirtualDisplayRegisteredKeys = v14;
    LOBYTE(v11) = 1;
    if (v14 != 512 && (v14 & 0x200) != 0) {
      self->_keyboardVirtualDisplayIsEnteringChord = 1;
    }
    goto LABEL_28;
  }
  [(NSMutableSet *)keyboardVirtualDisplayDownKeys removeObject:v9];
  id v15 = [(NSMutableSet *)self->_keyboardVirtualDisplayDownKeys count];
  if ([(NSMutableSet *)self->_keyboardVirtualDisplayDownKeys count] != (id)1)
  {
    BOOL v17 = 0;
    goto LABEL_19;
  }
  unsigned int v16 = [(NSMutableSet *)self->_keyboardVirtualDisplayDownKeys containsObject:&off_1001C60D0];
  BOOL v17 = v16;
  if (!v4 || !v16)
  {
LABEL_19:
    BOOL v11 = 1;
    if (v15 && !v17) {
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  BOOL v11 = self->_keyboardVirtualDisplayRegisteredKeys != 512;
  BOOL v17 = 1;
LABEL_21:
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  unint64_t keyboardVirtualDisplayRegisteredKeys = self->_keyboardVirtualDisplayRegisteredKeys;
  v22[3] = keyboardVirtualDisplayRegisteredKeys;
  if (v11 && (keyboardVirtualDisplayRegisteredKeys != 512 || !self->_keyboardVirtualDisplayIsEnteringChord))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000DBC9C;
    v21[3] = &unk_1001B67F8;
    v21[4] = self;
    v21[5] = v22;
    [(VOTBrailleManager *)self performAsyncBlock:v21 forThreadKey:self->_threadKey];
  }
  unint64_t v19 = 512;
  if (!v17) {
    unint64_t v19 = 0;
  }
  self->_unint64_t keyboardVirtualDisplayRegisteredKeys = v19;
  self->_keyboardVirtualDisplayIsEnteringChord = v17;
  _Block_object_dispose(v22, 8);
LABEL_28:
  [(NSLock *)self->_keyboardVirtualDisplayLock unlock];

  return v11;
}

- (BOOL)usesBrailleSubstitutions
{
  return self->_usesBrailleSubstitutions;
}

- (void)setUsesBrailleSubstitutions:(BOOL)a3
{
  self->_usesBrailleSubstitutions = a3;
}

- (void)setBrailleTableFromSettings:(id)a3
{
}

- (void)setBrailleInputTableFromSettings:(id)a3
{
}

- (VOTElement)previousTouchContainer
{
  return self->_previousTouchContainer;
}

- (void)setPreviousTouchContainer:(id)a3
{
}

- (VOTElement)previousElement
{
  return self->_previousElement;
}

- (void)setPreviousElement:(id)a3
{
}

- (BOOL)panEnabled
{
  return self->_panEnabled;
}

- (void)setPanEnabled:(BOOL)a3
{
  self->_panEnabled = a3;
}

- (NSString)brailleSubstitutionLanguage
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setBrailleSubstitutionLanguage:(id)a3
{
}

- (NSArray)textReplacementEntries
{
  return self->_textReplacementEntries;
}

- (double)lastUserInteractionTime
{
  return self->_lastUserInteractionTime;
}

- (_NSRange)brailleLineRange
{
  NSUInteger length = self->_brailleLineRange.length;
  NSUInteger location = self->_brailleLineRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)bookCursorPosition
{
  return self->_bookCursorPosition;
}

- (void)setBookCursorPosition:(int64_t)a3
{
  self->_unint64_t bookCursorPosition = a3;
}

- (int64_t)trailingBookCursorPosition
{
  return self->_trailingBookCursorPosition;
}

- (void)setTrailingBookCursorPosition:(int64_t)a3
{
  self->_trailingBookCursorPosition = a3;
}

- (int)lastRefreshTrigger
{
  return self->_lastRefreshTrigger;
}

- (void)setLastRefreshTrigger:(int)a3
{
  self->_lastRefreshTrigger = a3;
}

- (void)setTestingBrailleClient:(id)a3
{
}

- (NSArray)testingTextShortcuts
{
  return self->_testingTextShortcuts;
}

- (void)setTestingTextShortcuts:(id)a3
{
}

- (BOOL)testingBrailleElementLocked
{
  return self->_testingBrailleElementLocked;
}

- (void)setTestingBrailleElementLocked:(BOOL)a3
{
  self->_testingBrailleElementLocked = a3;
}

- (double)threadWaitTime
{
  return self->_threadWaitTime;
}

- (void)setThreadWaitTime:(double)a3
{
  self->_threadWaitTime = a3;
}

- (id)tableSetCallback
{
  return self->_tableSetCallback;
}

- (void)setTableSetCallback:(id)a3
{
}

- (id)elementSetCallback
{
  return self->_elementSetCallback;
}

- (void)setElementSetCallback:(id)a3
{
}

- (id)keypressCallback
{
  return self->_keypressCallback;
}

- (void)setKeypressCallback:(id)a3
{
}

- (id)brailleStringSetCallback
{
  return self->_brailleStringSetCallback;
}

- (void)setBrailleStringSetCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_brailleStringSetCallback, 0);
  objc_storeStrong(&self->_keypressCallback, 0);
  objc_storeStrong(&self->_elementSetCallback, 0);
  objc_storeStrong(&self->_tableSetCallback, 0);
  objc_storeStrong((id *)&self->_testingTextShortcuts, 0);
  objc_storeStrong((id *)&self->_testingBrailleClient, 0);
  objc_storeStrong((id *)&self->_brailleSubstitutionLanguage, 0);
  objc_storeStrong((id *)&self->_previousElement, 0);
  objc_storeStrong((id *)&self->_previousTouchContainer, 0);
  objc_storeStrong((id *)&self->_brailleInputTableFromSettings, 0);
  objc_storeStrong((id *)&self->_brailleTableFromSettings, 0);
  objc_storeStrong((id *)&self->_keyboardVirtualDisplayDownKeys, 0);
  objc_storeStrong((id *)&self->_keyboardVirtualDisplayLock, 0);
  objc_storeStrong((id *)&self->_updateRealtimeStatusTimer, 0);
  objc_storeStrong((id *)&self->_testingAggregatedStatus, 0);
  objc_storeStrong((id *)&self->_textReplacementEntries, 0);
  objc_storeStrong((id *)&self->_textReplacementStore, 0);
  objc_storeStrong((id *)&self->_threadKey, 0);
  objc_storeStrong((id *)&self->_brailleClientConnectionCondition, 0);
  objc_storeStrong((id *)&self->_brailleClient, 0);
  objc_storeStrong(&self->_rotorSelection, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_currentSetInputTable, 0);
  objc_storeStrong((id *)&self->_currentSetTable, 0);
  objc_storeStrong((id *)&self->_currentDefaultTable, 0);
  objc_storeStrong((id *)&self->_delimiters, 0);
  objc_storeStrong((id *)&self->_brailleSubstitutions, 0);
  objc_storeStrong((id *)&self->_hintTimer, 0);

  objc_storeStrong((id *)&self->_brailleElement, 0);
}

@end
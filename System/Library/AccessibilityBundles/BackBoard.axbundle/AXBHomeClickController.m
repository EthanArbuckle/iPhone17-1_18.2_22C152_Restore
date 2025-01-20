@interface AXBHomeClickController
+ (id)controller;
+ (void)initializeMonitor;
- (BOOL)_accessibilityIsFactoryDiskImagePresent;
- (BOOL)_captureKeyboardCommands:(id *)a3;
- (BOOL)_checkIfZoomWasActivated:(id)a3 stealEvent:(BOOL *)a4;
- (BOOL)_sideButtonEnabled;
- (BOOL)_voiceOverWasToggledSinceBoot;
- (BOOL)captureHomeClick:(id)a3;
- (BOOL)didShowHoldDurationTripleClickHelp;
- (BOOL)isHearingAidControlVisible;
- (id)_eventTapIdentifier;
- (id)_votExistsBreadCrumbFile;
- (id)_writeLoginNoteTimer;
- (id)displayFilterUIClient;
- (void)_appTransition;
- (void)_didHideAlert;
- (void)_fireHomeButtons:(BOOL)a3;
- (void)_handleZoomActivationDuringBuddy;
- (void)_handleZoomInBuddyAlertResult:(int64_t)a3;
- (void)_promptToDisableBrightnessFilters:(id)a3 data:(id)a4;
- (void)_setHearingAidControlVisible:(BOOL)a3;
- (void)_setVoiceOverWasToggledSinceBoot:(BOOL)a3;
- (void)_showLookingGlassMenu;
- (void)_springBoardDied:(id)a3;
- (void)_startVoiceOverSequence;
- (void)_toggleDetectionMode;
- (void)_toggleDisplayAskSheet;
- (void)_toggleGuidedAccessBlock:(id)a3;
- (void)_toggleMagnifier;
- (void)_toggleOnDeviceEyeTracking;
- (void)_toggleVoiceOver;
- (void)_triggerAppTransition;
- (void)_updateBuddyVoiceOverStatus;
- (void)_updateEventTapSettings;
- (void)_updateHomeClickEnabled;
- (void)_updateHomeClickSpeed;
- (void)_updateTripleHomeSettings:(BOOL)a3;
- (void)_willShowAlert;
- (void)_writeNoteToNewUserSession;
- (void)clearNoteToUserSession;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)initialize;
- (void)setDidShowHoldDurationTripleClickHelp:(BOOL)a3;
- (void)setIsHearingAidControlVisible:(BOOL)a3;
@end

@implementation AXBHomeClickController

- (void)_updateHomeClickEnabled
{
  _HomeClickEnabled = _AXSHomeClickEnabled() != 0;

  [(AXBHomeClickController *)self _updateEventTapSettings];
}

- (void)_updateHomeClickSpeed
{
  _AXSHomeClickSpeed();
  _HomeClickTimeout = v2;
}

- (id)_writeLoginNoteTimer
{
  writeLoginNoteTimer = self->_writeLoginNoteTimer;
  if (!writeLoginNoteTimer)
  {
    v4 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x263F21398]);
    v5 = self->_writeLoginNoteTimer;
    self->_writeLoginNoteTimer = v4;

    [(AXDispatchTimer *)self->_writeLoginNoteTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    writeLoginNoteTimer = self->_writeLoginNoteTimer;
  }

  return writeLoginNoteTimer;
}

- (void)_writeNoteToNewUserSession
{
  id v2 = [(AXBHomeClickController *)self _writeLoginNoteTimer];
  [v2 afterDelay:&__block_literal_global_13 processBlock:0.5];
}

void __52__AXBHomeClickController__writeNoteToNewUserSession__block_invoke()
{
  v6[2] = *MEMORY[0x263EF8340];
  if (AXSessionIsLoginSession())
  {
    v5[0] = *MEMORY[0x263F22688];
    v0 = [NSNumber numberWithUnsignedChar:_AXSVoiceOverTouchEnabled()];
    v6[0] = v0;
    v5[1] = *MEMORY[0x263F22690];
    v1 = [NSNumber numberWithUnsignedChar:_AXSZoomTouchEnabled()];
    v6[1] = v1;
    id v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

    v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:200 options:0 error:0];
    v4 = [MEMORY[0x263F21198] sharedManager];
    [v4 writeData:v3 toFileAtAccessibilityContainerPath:*MEMORY[0x263F22680] completion:&__block_literal_global_272_1];
  }
}

uint64_t __52__AXBHomeClickController__writeNoteToNewUserSession__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)clearNoteToUserSession
{
  id v2 = [MEMORY[0x263F21198] sharedManager];
  [v2 deleteFileAtAccessibilityContainerPath:*MEMORY[0x263F22680] completion:&__block_literal_global_277_0];
}

uint64_t __48__AXBHomeClickController_clearNoteToUserSession__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)_promptToDisableBrightnessFilters:(id)a3 data:(id)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x263F22968];
  id v7 = a4;
  v8 = [v6 server];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__AXBHomeClickController__promptToDisableBrightnessFilters_data___block_invoke;
  v10[3] = &unk_26510B938;
  id v11 = v5;
  id v9 = v5;
  [v8 showAlert:7 withHandler:v10 withData:v7];
}

uint64_t __65__AXBHomeClickController__promptToDisableBrightnessFilters_data___block_invoke(uint64_t result, int a2)
{
  if (a2 == 1)
  {
    (*(void (**)(void))(*(void *)(result + 32) + 16))(*(void *)(result + 32));
    return MEMORY[0x270F909B8](0);
  }
  return result;
}

- (id)_votExistsBreadCrumbFile
{
  uint64_t v2 = NSURL;
  v3 = NSTemporaryDirectory();
  v4 = [v2 fileURLWithPath:v3];
  id v5 = [v4 URLByAppendingPathComponent:@"VoiceOverToggled"];

  return v5;
}

- (BOOL)_voiceOverWasToggledSinceBoot
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(AXBHomeClickController *)self _votExistsBreadCrumbFile];
  id v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (void)_setVoiceOverWasToggledSinceBoot:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [(AXBHomeClickController *)self _votExistsBreadCrumbFile];
  char v6 = v5;
  if (v3)
  {
    id v7 = [v5 path];
    [v8 createFileAtPath:v7 contents:0 attributes:0];
  }
  else
  {
    [v8 removeItemAtURL:v5 error:0];
  }
}

- (void)_toggleVoiceOver
{
  if (!_AXSVoiceOverTouchUsageConfirmed()) {
    _AXSVoiceOverTouchSetUsageConfirmed();
  }
  int v3 = _AXSVoiceOverTouchEnabled();
  id v4 = (id)_AXSTripleClickCopyOptions();
  if (v3)
  {
    if (_AXSTripleClickContainsOption()) {
      goto LABEL_13;
    }
  }
  else
  {
    if (_AXSCanDisableApplicationAccessibility()) {
      _AXSApplicationAccessibilitySetEnabled();
    }
    if (_AXSTripleClickContainsOption())
    {
      _AXSApplicationAccessibilitySetEnabled();
LABEL_13:
      _AXSSetTripleClickOptions();
      _AXSAccessibilitySetiTunesPreference();
      goto LABEL_14;
    }
  }
  if ((_IsBuddyRunning || AXSessionIsLoginSession()) && v3) {
    goto LABEL_13;
  }
LABEL_14:
  _AXSVoiceOverTouchSetEnabled();
  _AXSVoiceOverTouchSetUIEnabled();
  if (_AXSVoiceOverTouchEnabled()) {
    [(AXBHomeClickController *)self _setVoiceOverWasToggledSinceBoot:1];
  }
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v4 = (AXUIClient *)a3;
  if (self->_displayFilterUIClient == v4)
  {
    self->_displayFilterUIClient = 0;
    id v5 = v4;

    id v4 = v5;
  }
}

- (id)displayFilterUIClient
{
  displayFilterUIClient = self->_displayFilterUIClient;
  if (!displayFilterUIClient)
  {
    id v4 = objc_alloc(MEMORY[0x263F22198]);
    id v5 = (AXUIClient *)[v4 initWithIdentifier:@"HomeClickController" serviceBundleName:*MEMORY[0x263F225E0]];
    char v6 = self->_displayFilterUIClient;
    self->_displayFilterUIClient = v5;

    [(AXUIClient *)self->_displayFilterUIClient setDelegate:self];
    displayFilterUIClient = self->_displayFilterUIClient;
  }

  return displayFilterUIClient;
}

- (void)_toggleMagnifier
{
  id v2 = [MEMORY[0x263F88140] sharedInstance];
  [v2 startMagnifier];
}

- (void)_toggleDetectionMode
{
  if (_AXSVoiceOverTouchEnabled())
  {
    id v2 = [MEMORY[0x263F22938] sharedInstance];
    int v3 = [v2 liveRecognitionActive];

    id v4 = [MEMORY[0x263F229E8] server];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 51;
    }
    else {
      uint64_t v5 = 50;
    }
    [v4 triggerCommand:v5];
  }
  else
  {
    id v6 = [MEMORY[0x263F22968] server];
    [v6 toggleDetectionMode];
  }
}

- (void)_showLookingGlassMenu
{
}

- (void)_toggleGuidedAccessBlock:(id)a3
{
  id v3 = a3;
  id v4 = (id)_AXSTripleClickCopyOptions();
  [v4 count];
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_toggleOnDeviceEyeTracking
{
  BOOL v2 = _AXSOnDeviceEyeTrackingEnabled() == 0;
  id v3 = [MEMORY[0x263F22938] sharedInstance];
  [v3 setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:v2];
}

- (void)_setHearingAidControlVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F22968] server];
  [v4 setHearingAidControlVisible:v3];
}

- (void)_didHideAlert
{
  if ([(AXBHomeClickController *)self didShowHoldDurationTripleClickHelp])
  {
    +[AXBTouchAccommodationsController hideHoldDurationTripleClickHelp];
    [(AXBHomeClickController *)self setDidShowHoldDurationTripleClickHelp:0];
  }
}

- (void)_willShowAlert
{
  if ([(AXBHomeClickController *)self didShowHoldDurationTripleClickHelp]) {
    _AXAssert();
  }
  id v3 = [MEMORY[0x263F22938] sharedInstance];
  if ([v3 touchAccommodationsEnabled]
    && [v3 touchAccommodationsHoldDurationEnabled])
  {
    +[AXBTouchAccommodationsController showHoldDurationTripleClickHelp];
    [(AXBHomeClickController *)self setDidShowHoldDurationTripleClickHelp:1];
  }
}

- (void)_toggleDisplayAskSheet
{
  BOOL isAlertVisible = self->_isAlertVisible;
  id v4 = [MEMORY[0x263F22968] server];
  id v10 = v4;
  if (isAlertVisible)
  {
    [v4 hideAlert];
  }
  else
  {
    int v5 = [v4 isShowingAXAlert];

    if ((v5 & 1) == 0)
    {
      if (_AXSTwiceRemoteScreenEnabled())
      {
        id v9 = @"[TWICE] Dismiss AppleWatchMirroring card before showing the AX Shortcut sheet";
        LOBYTE(v8) = 1;
        _AXLogWithFacility();
        _AXSTwiceRemoteScreenSetEnabled();
      }
      self->_BOOL isAlertVisible = 1;
      [(AXBHomeClickController *)self _willShowAlert];
      id v6 = AXLogBackboardServer();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_DEFAULT, "Triple click: presenting from backboardd.", buf, 2u);
      }

      id v7 = [MEMORY[0x263F22968] server];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __48__AXBHomeClickController__toggleDisplayAskSheet__block_invoke;
      v11[3] = &unk_26510B960;
      v11[4] = self;
      [v7 showAlert:0 withHandler:v11];
    }
  }
}

uint64_t __48__AXBHomeClickController__toggleDisplayAskSheet__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = AXLogBackboardServer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_241F5C000, v4, OS_LOG_TYPE_DEFAULT, "Triple click: handling from backboardd with %ld.", (uint8_t *)&v6, 0xCu);
  }

  [MEMORY[0x263F229B8] registerObserverForTripleClickOption:a2];
  if ((int)a2 > 15)
  {
    if (a2 == 16)
    {
      [*(id *)(a1 + 32) _showLookingGlassMenu];
      goto LABEL_13;
    }
    if (a2 == 22)
    {
      [*(id *)(a1 + 32) _toggleDetectionMode];
      goto LABEL_13;
    }
LABEL_12:
    [MEMORY[0x263F229B8] toggleTripleClickOption:a2];
    goto LABEL_13;
  }
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) _startVoiceOverSequence];
    goto LABEL_13;
  }
  if (a2 != 12) {
    goto LABEL_12;
  }
  [*(id *)(a1 + 32) _toggleMagnifier];
LABEL_13:
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return [*(id *)(a1 + 32) _didHideAlert];
}

- (void)_startVoiceOverSequence
{
  if (_AXSVoiceOverTouchEnabled())
  {
LABEL_2:
    id v3 = (void *)_Controller;
    [v3 _toggleVoiceOver];
    return;
  }
  if (_isBuddyRunning()
    && [(AXBHomeClickController *)self _accessibilityIsFactoryDiskImagePresent])
  {
    id v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_241F5C000, v4, OS_LOG_TYPE_DEFAULT, "User activated VoiceOver gesture during setup, but FDI present so VoiceOver gesture will be suppressed", v10, 2u);
    }
  }
  else
  {
    int v5 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v6 = [v5 voiceOverActivationWorkaround];

    switch(v6)
    {
      case 1:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        uint64_t v8 = (const __CFString **)MEMORY[0x263F22718];
        break;
      case 3:
        return;
      case 2:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        uint64_t v8 = (const __CFString **)MEMORY[0x263F22710];
        break;
      default:
        goto LABEL_2;
    }
    CFStringRef v9 = *v8;
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v9, 0, 0, 1u);
  }
}

- (void)_updateTripleHomeSettings:(BOOL)a3
{
  id v5 = (id)_AXSTripleClickCopyOptions();
  if ([v5 count])
  {
    _TripleHomeEnabled = 1;
  }
  else
  {
    _TripleHomeEnabled = 0;
    if (!a3
      && _AXSApplicationAccessibilityEnabled()
      && _AXSCanDisableApplicationAccessibility())
    {
      _AXSApplicationAccessibilitySetEnabled();
    }
  }
  [(AXBHomeClickController *)self _updateEventTapSettings];
}

- (BOOL)captureHomeClick:(id)a3
{
  id v4 = a3;
  if (captureHomeClick__onceToken != -1) {
    dispatch_once(&captureHomeClick__onceToken, &__block_literal_global_315);
  }
  if (_HomeClickEnabled)
  {
    if (!v4) {
      goto LABEL_70;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
    if (!v4 || (_TripleHomeEnabled & 1) == 0) {
      goto LABEL_71;
    }
  }
  if (AXDeviceHasHomeButton()) {
    int v6 = 1000;
  }
  else {
    int v6 = 1010;
  }
  if (captureHomeClick__RequiresReachability
    && [v4 type] == 1000
    && (AXInPreboardScenario() & 1) == 0
    && (AXInCheckerBoardScenario() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F22968] server];
    [v7 cancelReachabilityDetection];
  }
  if (_TripleHomeEnabled != 1 || !self->_isAlertVisible) {
    goto LABEL_34;
  }
  if ([v4 type] == 50)
  {
    int v5 = AXDeviceIsPad() ^ 1;
    goto LABEL_71;
  }
  if ([v4 type] != 1001
    && [v4 type] != 1011
    && [v4 type] != 1104)
  {
    if ([v4 type] == 1010 || objc_msgSend(v4, "type") == 1103)
    {
      _LockButtonDown = 1;
    }
    else if ([v4 type] == v6)
    {
      [(NSLock *)self->_menuButtonLock lock];
      [(NSMutableArray *)self->_menuButtonClientIds addObject:v4];
      [(NSLock *)self->_menuButtonLock unlock];
      ++qword_268D53810;
      if (_LockButtonDown != 1) {
        goto LABEL_91;
      }
      goto LABEL_90;
    }
LABEL_34:
    if ([v4 type] == 1011 || objc_msgSend(v4, "type") == 1104)
    {
      char v8 = 0;
    }
    else
    {
      if ([v4 type] != 1010 && objc_msgSend(v4, "type") != 1103)
      {
LABEL_41:
        if ((objc_msgSend(v4, "type", CFAbsoluteTimeGetCurrent()) == 1001
           || [v4 type] == 1000)
          && (+[AXBackBoardGlue isDisplayBacklightOff]
           || CFAbsoluteTimeGetCurrent() - *(double *)&_LastHomeButtonPressWithBacklightOff < 0.25)
          && (AXInPreboardScenario() & 1) == 0
          && (AXInCheckerBoardScenario() & 1) == 0)
        {
          CFAbsoluteTimeGetCurrent();
          LOBYTE(v5) = 0;
          _LastHomeButtonPressWithBacklightOff = CFAbsoluteTimeGetCurrent();
          goto LABEL_71;
        }
        if (AXDeviceHasHomeButton()
          && ([v4 type] == 1000 && (_LockButtonDown & 1) != 0
           || ([v4 type] == 1010 || objc_msgSend(v4, "type") == 1103)
           && qword_268D53810 == 1))
        {
          [(AXBHomeClickController *)self _fireHomeButtons:0];
          LOBYTE(v5) = 0;
          _LastScreenshotTake = CFAbsoluteTimeGetCurrent();
          goto LABEL_71;
        }
        if ([(AXBHomeClickController *)self isHearingAidControlVisible]
          && [v4 type] == 1001
          && CFAbsoluteTimeGetCurrent() - *(double *)&_LastScreenshotTake > 0.5)
        {
          [(NSMutableArray *)self->_menuButtonClientIds removeAllObjects];
          qword_268D53810 = 0;
          [(AXBHomeClickController *)self _setHearingAidControlVisible:0];
          [(id)_HomeClickTimer cancel];
          CFStringRef v9 = (void *)_HomeClickTimer;
          _HomeClickTimer = 0;

LABEL_70:
          LOBYTE(v5) = 0;
          goto LABEL_71;
        }
        if ((_IsBuddyRunning || AXSessionIsLoginSession())
          && [v4 type] == 3001)
        {
          LOBYTE(location[0]) = 0;
          [(AXBHomeClickController *)self _checkIfZoomWasActivated:v4 stealEvent:location];
          LOBYTE(v5) = LOBYTE(location[0]) != 0;
          goto LABEL_71;
        }
        int HasHomeButton = AXDeviceHasHomeButton();
        int v11 = [v4 type];
        if (HasHomeButton) {
          int v12 = 1000;
        }
        else {
          int v12 = 1010;
        }
        if (AXDeviceHasHomeButton()) {
          int v13 = 1000;
        }
        else {
          int v13 = 1011;
        }
        int v14 = [v4 type];
        int v15 = v14;
        if (v11 != v12 && v14 != v13) {
          goto LABEL_70;
        }
        if (v11 == v12)
        {
          [(id)_HomeClickTimer cancel];
          v17 = (void *)_HomeClickTimer;
          _HomeClickTimer = 0;
        }
        v18 = &qword_268D53810;
        uint64_t v19 = qword_268D53810;
        if (v15 == v13)
        {
          if (!qword_268D53810) {
            goto LABEL_70;
          }
          v18 = &_MergedGlobals;
          uint64_t v19 = _MergedGlobals;
        }
        uint64_t *v18 = v19 + 1;
        [(NSLock *)self->_menuButtonLock lock];
        [(NSMutableArray *)self->_menuButtonClientIds addObject:v4];
        [(NSLock *)self->_menuButtonLock unlock];
        uint64_t v20 = _MergedGlobals;
        if (_MergedGlobals != 2) {
          goto LABEL_82;
        }
        if ((_TripleHomeEnabled & 1) != 0 || _IsBuddyRunning)
        {
LABEL_85:
          LOBYTE(v5) = 1;
          if (_HomeClickTimer || v11 != v12) {
            goto LABEL_71;
          }
          id v22 = objc_alloc_init(MEMORY[0x263F21398]);
          v23 = (void *)_HomeClickTimer;
          _HomeClickTimer = (uint64_t)v22;

          objc_initWeak(location, self);
          v24 = (void *)_HomeClickTimer;
          double v25 = *(float *)&_HomeClickTimeout;
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __43__AXBHomeClickController_captureHomeClick___block_invoke_3;
          v26[3] = &unk_26510B570;
          objc_copyWeak(&v27, location);
          [v24 afterDelay:v26 processBlock:v25];
          objc_destroyWeak(&v27);
          objc_destroyWeak(location);
LABEL_91:
          LOBYTE(v5) = 1;
          goto LABEL_71;
        }
        if (AXSessionIsLoginSession())
        {
          uint64_t v20 = _MergedGlobals;
LABEL_82:
          if (v20 == 3)
          {
            _MergedGlobals = 0;
            qword_268D53810 = 0;
            [(NSLock *)self->_menuButtonLock lock];
            [(NSMutableArray *)self->_menuButtonClientIds removeAllObjects];
            [(NSLock *)self->_menuButtonLock unlock];
            LocalCenter = CFNotificationCenterGetLocalCenter();
            LOBYTE(v5) = 1;
            CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)*MEMORY[0x263F8B3C0], 0, 0, 1u);
            goto LABEL_71;
          }
          goto LABEL_85;
        }
LABEL_90:
        [(AXBHomeClickController *)self _fireHomeButtons:0];
        goto LABEL_91;
      }
      char v8 = 1;
    }
    _LockButtonDown = v8;
    goto LABEL_41;
  }
  [(id)_HomeClickTimer cancel];
  if ([v4 type] == 1001 && (_LockButtonDown & 1) == 0)
  {
    _MergedGlobals = 0;
    qword_268D53810 = 0;
    [(NSLock *)self->_menuButtonLock lock];
    [(NSMutableArray *)self->_menuButtonClientIds removeAllObjects];
    [(NSLock *)self->_menuButtonLock unlock];
    LOBYTE(v5) = 1;
  }
  else
  {
    [(AXBHomeClickController *)self _fireHomeButtons:0];
    LOBYTE(v5) = 0;
  }
  if ([v4 type] == 1011 || objc_msgSend(v4, "type") == 1104) {
    _LockButtonDown = 0;
  }
  [(AXBHomeClickController *)self _toggleDisplayAskSheet];
  location[1] = (id)MEMORY[0x263EF8330];
  location[2] = (id)3221225472;
  location[3] = __43__AXBHomeClickController_captureHomeClick___block_invoke_2;
  location[4] = &unk_26510B378;
  location[5] = self;
  AXPerformBlockOnMainThreadAfterDelay();
LABEL_71:

  return v5;
}

uint64_t __43__AXBHomeClickController_captureHomeClick___block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  captureHomeClick__RequiresReachability = result;
  return result;
}

uint64_t __43__AXBHomeClickController_captureHomeClick___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    LOBYTE(v2) = 1;
    _AXLogWithFacility();
    uint64_t result = objc_msgSend(*(id *)(v1 + 32), "_didHideAlert", v2, @"ARGH! We didn't get a message back from SB that the alert should be dismissed");
    *(unsigned char *)(*(void *)(v1 + 32) + 8) = 0;
  }
  return result;
}

void __43__AXBHomeClickController_captureHomeClick___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fireHomeButtons:1];
}

- (void)_updateBuddyVoiceOverStatus
{
  if (_IsBuddyRunning || (AXSessionIsLoginSession() & 1) != 0) {
    return;
  }
  id v2 = (id)_AXSTripleClickCopyOptions();
  if (_AXSTripleClickContainsOption())
  {
    _AXSTripleClickRemoveOption();
    if (_AXSVoiceOverTouchEnabled())
    {
      _AXSTripleClickAddOption();
      goto LABEL_10;
    }
LABEL_9:
    _AXSApplicationAccessibilitySetEnabled();
    goto LABEL_10;
  }
  if (_AXSCanDisableApplicationAccessibility() && _AXSApplicationAccessibilityEnabled()) {
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_appTransition
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread]) {
    _AXAssert();
  }
  int v3 = _IsBuddyRunning;
  int v4 = _IsLoginUIRunning;
  int isBuddyRunning = _isBuddyRunning();
  int IsLoginSession = AXSessionIsLoginSession();
  if ((isBuddyRunning & 1) == 0
    && ![(AXBHomeClickController *)self _purpleBuddySetupComplete]
    && (IsLoginSession & 1) == 0)
  {
    AXPerformBlockOnMainThreadAfterDelay();
    return;
  }
  uint64_t v7 = VOTLogLifeCycle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)double v25 = isBuddyRunning;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = IsLoginSession;
    __int16 v26 = 1024;
    int v27 = 0;
    _os_log_impl(&dword_241F5C000, v7, OS_LOG_TYPE_DEFAULT, "Home click controller transition %d %d %d", buf, 0x14u);
  }

  _IsBuddyRunning = isBuddyRunning;
  _IsLoginUIRunning = IsLoginSession;
  [(AXBHomeClickController *)self _updateBuddyVoiceOverStatus];
  if ((!v3 || !_IsBuddyRunning) && (!v4 || !_IsLoginUIRunning))
  {
    if (_IsBuddyRunning || AXSessionIsLoginSession())
    {
      _PreBuddyOptions = _AXSTripleClickCopyOptions();
      char v8 = VOTLogLifeCycle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)double v25 = _PreBuddyOptions;
        _os_log_impl(&dword_241F5C000, v8, OS_LOG_TYPE_DEFAULT, "Prebuddy options: %@", buf, 0xCu);
      }

      int IsMultiUser = AXDeviceIsMultiUser();
      if (_PreBuddyOptions
        && [(id)_PreBuddyOptions containsObject:&unk_26F637740]
        && (([(id)_PreBuddyOptions containsObject:&unk_26F637758] ^ 1 | IsMultiUser) & 1) == 0
        && ![(AXBHomeClickController *)self _voiceOverWasToggledSinceBoot])
      {
        _AXSVoiceOverTouchSetEnabled();
        if (_AXSCanDisableApplicationAccessibility()) {
          _AXSApplicationAccessibilitySetEnabled();
        }
        id v10 = [MEMORY[0x263F213F0] sharedInstance];
        char v11 = [v10 ignoreLogging];

        if ((v11 & 1) == 0)
        {
          int v12 = [MEMORY[0x263F213F0] identifier];
          int v13 = AXLoggerForFacility();

          os_log_type_t v14 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v13, v14))
          {
            int v15 = AXColorizeFormatLog();
            v16 = _AXStringForArgs();
            if (os_log_type_enabled(v13, v14))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)double v25 = v16;
              _os_log_impl(&dword_241F5C000, v13, v14, "%{public}@", buf, 0xCu);
            }
          }
        }
      }
      v17 = (void *)MEMORY[0x263EFF8C0];
      v18 = [NSNumber numberWithInt:5];
      uint64_t v19 = [v17 arrayWithObject:v18];

      _AXSSetTripleClickOptions();
      goto LABEL_30;
    }
    if ((!v3 || _IsBuddyRunning) && (!v4 || _IsLoginUIRunning))
    {
      if (_IsBuddyRunning || (AXSessionIsLoginSession() & 1) != 0) {
        goto LABEL_30;
      }
    }
    else if (_AXSVoiceOverTouchEnabled())
    {
      _AXSTripleClickRemoveOption();
      _AXSTripleClickAddOption();
    }
    else
    {
      if (_AXSCanDisableApplicationAccessibility()) {
        _AXSApplicationAccessibilitySetEnabled();
      }
      _AXSSetTripleClickOptions();
      if (_PreBuddyOptions)
      {
        CFRelease((CFTypeRef)_PreBuddyOptions);
        _PreBuddyOptions = 0;
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.SubstantialTransition", 0);
LABEL_30:
    if (!_IsBuddyRunning && (AXSessionIsLoginSession() & 1) == 0)
    {
      _AXSTripleClickRemoveOption();
      if (_AXSCanDisableApplicationAccessibility() || _AXSVoiceOverTouchEnabled()) {
        _AXSApplicationAccessibilitySetEnabled();
      }
    }
    if (!v4 && _IsLoginUIRunning)
    {
      _AXSZoomTouchSetEnabled();
      _AXSVoiceOverTouchSetEnabled();
      uint64_t v20 = (void *)MEMORY[0x263EFF8C0];
      v21 = [NSNumber numberWithInt:5];
      id v22 = [v20 arrayWithObject:v21];

      _AXSSetTripleClickOptions();
      if (_AXSCanDisableApplicationAccessibility()) {
        _AXSApplicationAccessibilitySetEnabled();
      }
      [(AXBHomeClickController *)self clearNoteToUserSession];
    }
  }
}

uint64_t __40__AXBHomeClickController__appTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerAppTransition];
}

- (void)_triggerAppTransition
{
  if (_triggerAppTransition_onceToken != -1) {
    dispatch_once(&_triggerAppTransition_onceToken, &__block_literal_global_342);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AXBHomeClickController__triggerAppTransition__block_invoke_2;
  block[3] = &unk_26510B378;
  block[4] = self;
  dispatch_async((dispatch_queue_t)_triggerAppTransition_AppTransitionQueue, block);
}

uint64_t __47__AXBHomeClickController__triggerAppTransition__block_invoke()
{
  _triggerAppTransition_AppTransitionQueue = (uint64_t)dispatch_queue_create("AXAppAccessQueue", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __47__AXBHomeClickController__triggerAppTransition__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appTransition];
}

- (BOOL)_captureKeyboardCommands:(id *)a3
{
  return 0;
}

- (BOOL)_checkIfZoomWasActivated:(id)a3 stealEvent:(BOOL *)a4
{
  id v6 = a3;
  if (!_AXSZoomTouchEnabled() && !_AXSVoiceOverTouchEnabled())
  {
    double Current = CFAbsoluteTimeGetCurrent();
    char v8 = [v6 handInfo];
    unsigned int v9 = [v8 eventType];
    if (v9 <= 0xA && ((1 << v9) & 0x640) != 0)
    {
      if ((v9 & 0xFFFFFFFB) != 1)
      {
        if ([v8 currentFingerCount]
          || _checkIfZoomWasActivated_stealEvent__FingerCount < 1)
        {
          goto LABEL_33;
        }
        if (*(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo == 0.0
          || Current - *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo >= 0.2)
        {
          if (*(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne == 0.0
            || Current - *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne >= 0.2)
          {
            _checkIfZoomWasActivated_stealEvent__TapCount = 0;
            _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = 0;
            _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = 0;
            goto LABEL_32;
          }
          if (_checkIfZoomWasActivated_stealEvent__TapCount)
          {
LABEL_32:
            _checkIfZoomWasActivated_stealEvent__FingerCount = 0;
LABEL_33:

            goto LABEL_34;
          }
          _checkIfZoomWasActivated_stealEvent__TapCount = 1;
        }
        else
        {
          if (_checkIfZoomWasActivated_stealEvent__TapCount == 1
            && *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo
             - *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne < 0.65)
          {
            [(AXBHomeClickController *)self _handleZoomActivationDuringBuddy];
          }
          _checkIfZoomWasActivated_stealEvent__TapCount = 0;
          _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = 0;
          _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = 0;
        }
        *a4 = 1;
        BKSHIDServicesCancelTouchesOnMainDisplay();
        goto LABEL_32;
      }
    }
    else if ((v9 & 0xFFFFFFFB) != 1)
    {
      if ([v8 eventType] == 8 && _checkIfZoomWasActivated_stealEvent__FingerCount >= 1)
      {
        _checkIfZoomWasActivated_stealEvent__TapCount = 0;
        _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = 0;
        _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = 0;
      }
      goto LABEL_33;
    }
    if ([v8 currentFingerCount] == 3)
    {
      if (_checkIfZoomWasActivated_stealEvent__TapCount == 1
        && Current - *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne <= 0.5)
      {
        _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = *(void *)&Current;
      }
      else
      {
        _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = *(void *)&Current;
      }
    }
    else if ([v8 currentFingerCount] >= 4)
    {
      _checkIfZoomWasActivated_stealEvent__TapCount = 0;
      _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = 0;
      _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = 0;
    }
    _checkIfZoomWasActivated_stealEvent__FingerCount = [v8 currentFingerCount];
    goto LABEL_33;
  }
LABEL_34:

  return 0;
}

- (BOOL)_accessibilityIsFactoryDiskImagePresent
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)MobileStorageCopyDevices();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *MEMORY[0x263F55C20];
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        char v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", v5, (void)v12);
        char v9 = [v8 hasPrefix:@"/private/var/personalized_factory"];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)_handleZoomActivationDuringBuddy
{
}

void __58__AXBHomeClickController__handleZoomActivationDuringBuddy__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _accessibilityIsFactoryDiskImagePresent])
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "User activated Zoom gesture during setup, but FDI present so Zoom gesture will be suppressed", buf, 2u);
    }
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F22968] server];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __58__AXBHomeClickController__handleZoomActivationDuringBuddy__block_invoke_347;
    v4[3] = &unk_26510B960;
    v4[4] = *(void *)(a1 + 32);
    [v3 showAlert:1 withHandler:v4];
  }
}

uint64_t __58__AXBHomeClickController__handleZoomActivationDuringBuddy__block_invoke_347(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleZoomInBuddyAlertResult:a2];
}

- (id)_eventTapIdentifier
{
  return self->_eventTapIdentifier;
}

- (void)_fireHomeButtons:(BOOL)a3
{
  BOOL v4 = _MergedGlobals == 1 && a3;
  [(NSLock *)self->_menuButtonLock lock];
  p_menuButtonClientIds = &self->_menuButtonClientIds;
  uint64_t v6 = [(NSMutableArray *)self->_menuButtonClientIds count];
  uint64_t v7 = _MergedGlobals;
  uint64_t v8 = qword_268D53810;
  if (v6 == qword_268D53810 + _MergedGlobals)
  {
    if (_MergedGlobals >= 1)
    {
      unint64_t v9 = 0;
      do
      {
        if ([(NSMutableArray *)*p_menuButtonClientIds count] <= v9)
        {
          BOOL v10 = 0;
        }
        else
        {
          BOOL v10 = [(NSMutableArray *)*p_menuButtonClientIds objectAtIndex:v9];
        }
        if ([(NSMutableArray *)*p_menuButtonClientIds count] <= ++v9)
        {
          char v11 = 0;
        }
        else
        {
          char v11 = [(NSMutableArray *)*p_menuButtonClientIds objectAtIndex:v9];
        }
        _postHomeButtonPress(0, v4, v10);
        _postHomeButtonPress(1, v4, v11);

        uint64_t v7 = _MergedGlobals;
      }
      while (_MergedGlobals > (uint64_t)v9);
      uint64_t v8 = qword_268D53810;
    }
    if (v7 < v8)
    {
      if (v8 - 1 >= (unint64_t)[(NSMutableArray *)*p_menuButtonClientIds count])
      {
        long long v12 = 0;
      }
      else
      {
        long long v12 = [(NSMutableArray *)*p_menuButtonClientIds objectAtIndex:qword_268D53810 - 1];
      }
      _postHomeButtonPress(0, v4, v12);
    }
    [(NSMutableArray *)self->_menuButtonClientIds removeAllObjects];
    [(NSLock *)self->_menuButtonLock unlock];
    _MergedGlobals = 0;
    qword_268D53810 = 0;
  }
  else
  {
    long long v13 = AXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AXBHomeClickController _fireHomeButtons:]((uint64_t *)&self->_menuButtonClientIds, v13);
    }

    [(NSLock *)self->_menuButtonLock unlock];
  }
}

- (void)_handleZoomInBuddyAlertResult:(int64_t)a3
{
  if (!a3)
  {
    _AXSZoomTouchSetEnabled();
    _AXSAccessibilitySetiTunesPreference();
  }
}

- (void)_springBoardDied:(id)a3
{
  [(AXBHomeClickController *)self _didHideAlert];
  self->_BOOL isAlertVisible = 0;
  id v4 = [MEMORY[0x263F22968] server];
  [v4 cleanupAlertHandler];
}

- (BOOL)_sideButtonEnabled
{
  return 0;
}

- (void)_updateEventTapSettings
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [NSNumber numberWithBool:_HomeClickEnabled];
    uint64_t v5 = [NSNumber numberWithBool:_TripleHomeEnabled];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[AXBHomeClickController _sideButtonEnabled](self, "_sideButtonEnabled"));
    int v14 = 138412802;
    long long v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_241F5C000, v3, OS_LOG_TYPE_DEFAULT, "Home click controller enabling tap: Home click: %@, triple click %@, side button: %@", (uint8_t *)&v14, 0x20u);
  }
  if (_HomeClickEnabled
    || (_TripleHomeEnabled & 1) != 0
    || [(AXBHomeClickController *)self _sideButtonEnabled])
  {
    if (self->_eventTapIdentifier) {
      return;
    }
    uint64_t v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_241F5C000, v7, OS_LOG_TYPE_DEFAULT, "Installing home click event tap", (uint8_t *)&v14, 2u);
    }

    uint64_t v8 = [MEMORY[0x263F228B0] sharedManager];
    unint64_t v9 = [v8 installEventTap:&__block_literal_global_354 identifier:@"HomeClick" type:0];
    eventTapIdentifier = self->_eventTapIdentifier;
    self->_eventTapIdentifier = v9;

    char v11 = [MEMORY[0x263F228B0] sharedManager];
    [v11 setEventTapPriority:self->_eventTapIdentifier priority:70];
    goto LABEL_10;
  }
  if (self->_eventTapIdentifier)
  {
    long long v12 = AXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_241F5C000, v12, OS_LOG_TYPE_DEFAULT, "Removing home click event tap", (uint8_t *)&v14, 2u);
    }

    long long v13 = [MEMORY[0x263F228B0] sharedManager];
    [v13 removeEventTap:self->_eventTapIdentifier];

    char v11 = self->_eventTapIdentifier;
    self->_eventTapIdentifier = 0;
LABEL_10:
  }
}

uint64_t __49__AXBHomeClickController__updateEventTapSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 3001 || AXInCheckerBoardScenario()) {
    uint64_t v3 = [(id)_Controller captureHomeClick:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)controller
{
  id v2 = (void *)_Controller;
  if (!_Controller)
  {
    uint64_t v3 = [objc_allocWithZone((Class)AXBHomeClickController) init];
    id v4 = (void *)_Controller;
    _Controller = v3;

    [(id)_Controller _updateTripleHomeSettings:1];
    [(id)_Controller _updateHomeClickEnabled];
    [(id)_Controller _updateHomeClickSpeed];
    [(id)_Controller initialize];
    id v2 = (void *)_Controller;
  }

  return v2;
}

- (void)initialize
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_accessibilityTripleHomeStatusChange, (CFStringRef)*MEMORY[0x263F8B3B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)_accessibilityTripleHomeStatusChange, (CFStringRef)*MEMORY[0x263F8B3F0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)_accessibilityTripleHomeStatusChange, (CFStringRef)*MEMORY[0x263F8B458], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v7 = [NSString stringWithUTF8String:*MEMORY[0x263F41D48]];
  CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)_accessibilityTripleHomeStatusChange, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_accessibilityTripleHomeFired, (CFStringRef)*MEMORY[0x263F8B3C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  unint64_t v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, 0, (CFNotificationCallback)_accessibilityHomeClickEnabled, (CFStringRef)*MEMORY[0x263F8B210], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  BOOL v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, 0, (CFNotificationCallback)_accessibilityHomeClickSpeedChanged, (CFStringRef)*MEMORY[0x263F8B218], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (![(AXBHomeClickController *)self _purpleBuddySetupComplete])
  {
    [(AXBHomeClickController *)self _triggerAppTransition];
    char v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, self, (CFNotificationCallback)_appTransitionOccurred, @"com.apple.mobile.SubstantialTransition", 0, (CFNotificationSuspensionBehavior)1028);
  }
  long long v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel__springBoardDied_ name:*MEMORY[0x263F22738] object:0];

  long long v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  menuButtonClientIds = self->_menuButtonClientIds;
  self->_menuButtonClientIds = v13;

  long long v15 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  menuButtonLock = self->_menuButtonLock;
  self->_menuButtonLock = v15;

  _handleInPreBoardModeUpdate();
  uint64_t v17 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v17, 0, (CFNotificationCallback)_handleInPreBoardModeUpdate, (CFStringRef)*MEMORY[0x263F22658], 0, CFNotificationSuspensionBehaviorCoalesce);
  _handleInCheckerBoardModeUpdate();
  __int16 v18 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v18, 0, (CFNotificationCallback)_handleInCheckerBoardModeUpdate, (CFStringRef)*MEMORY[0x263F22650], 0, CFNotificationSuspensionBehaviorCoalesce);
  if (AXSessionIsLoginSession())
  {
    [(AXBHomeClickController *)self clearNoteToUserSession];
    [(AXBHomeClickController *)self _triggerAppTransition];
  }
  uint64_t v19 = CFNotificationCenterGetLocalCenter();
  CFStringRef v20 = (const __CFString *)*MEMORY[0x263F226B8];

  CFNotificationCenterAddObserver(v19, 0, (CFNotificationCallback)_handleSessionIsLoginSessionUpdate, v20, 0, CFNotificationSuspensionBehaviorCoalesce);
}

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_7 != -1) {
    dispatch_once(&initializeMonitor_onceToken_7, &__block_literal_global_364);
  }
}

uint64_t __43__AXBHomeClickController_initializeMonitor__block_invoke()
{
  initializeMonitor__SharedHomeClickController = +[AXBHomeClickController controller];

  return MEMORY[0x270F9A758]();
}

- (BOOL)isHearingAidControlVisible
{
  return self->isHearingAidControlVisible;
}

- (void)setIsHearingAidControlVisible:(BOOL)a3
{
  self->isHearingAidControlVisible = a3;
}

- (BOOL)didShowHoldDurationTripleClickHelp
{
  return self->_didShowHoldDurationTripleClickHelp;
}

- (void)setDidShowHoldDurationTripleClickHelp:(BOOL)a3
{
  self->_didShowHoldDurationTripleClickHelp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayFilterUIClient, 0);
  objc_storeStrong((id *)&self->_writeLoginNoteTimer, 0);
  objc_storeStrong((id *)&self->_menuButtonLock, 0);
  objc_storeStrong((id *)&self->_menuButtonClientIds, 0);

  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);
}

- (void)_fireHomeButtons:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412802;
  uint64_t v4 = v2;
  __int16 v5 = 1024;
  int v6 = _MergedGlobals;
  __int16 v7 = 1024;
  int v8 = qword_268D53810;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "Our menu button ids are messed up: %@ != %d + %d", (uint8_t *)&v3, 0x18u);
}

@end
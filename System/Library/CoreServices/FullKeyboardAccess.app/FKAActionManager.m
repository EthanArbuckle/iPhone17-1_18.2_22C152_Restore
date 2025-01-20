@interface FKAActionManager
+ (void)_accessibilityPerformValidations:(id)a3;
- (AXElement)currentApplication;
- (AXElement)currentElement;
- (AXFocusManager)focusManager;
- (BKSAccelerometer)accelerometer;
- (BOOL)_element:(id)a3 handlesArrowKeyChord:(id)a4;
- (BOOL)_isInTextEditingModeForCurrentElement:(id)a3;
- (BOOL)_isTextEditingElement:(id)a3;
- (BOOL)handleEscapeKey;
- (BOOL)isInTextEditingMode;
- (BOOL)isPerformingGesture;
- (BOOL)shouldAvoidRepostingTextInput;
- (BOOL)shouldRepostForKeyChord:(id)a3;
- (CGPoint)_pointForGestures;
- (CGPoint)_pointForGesturesForElement:(id)a3;
- (CGRect)_referenceBoundsForDisplayId:(unsigned int)a3;
- (FKAActionManager)init;
- (FKAActionManagerDelegate)delegate;
- (id)gestureViewController;
- (int)pidForSuccessfulTypeaheadMovement;
- (void)_moveFocusInsideForward:(BOOL)a3;
- (void)_moveFocusWithHeading:(unint64_t)a3;
- (void)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4;
- (void)activateAccessibilityShortcut;
- (void)activateSOS;
- (void)activateSiri;
- (void)activateTypeahead;
- (void)armApplePay;
- (void)begin3DTouch;
- (void)beginPinchIn;
- (void)beginPinchOut;
- (void)beginRotateLeft;
- (void)beginRotateRight;
- (void)beginSwipeDown;
- (void)beginSwipeLeft;
- (void)beginSwipeRight;
- (void)beginSwipeUp;
- (void)beginTwoFingerSwipeDown;
- (void)beginTwoFingerSwipeLeft;
- (void)beginTwoFingerSwipeRight;
- (void)beginTwoFingerSwipeUp;
- (void)didObserveScreenChange;
- (void)didPerformTextInput;
- (void)didSuppressCommand:(id)a3;
- (void)end3DTouch;
- (void)endPinch;
- (void)endRotate;
- (void)endSwipe;
- (void)endTwoFingerSwipe;
- (void)focusOnSceneForTypeahead;
- (void)goHome;
- (void)goToFirstElement;
- (void)goToLastElement;
- (void)goToNextElementOfType:(unint64_t)a3;
- (void)goToPreviousElementOfType:(unint64_t)a3;
- (void)handleCommand:(id)a3;
- (void)lift;
- (void)lockScreen;
- (void)moveDown;
- (void)moveFocusWithHeading:(unint64_t)a3 queryString:(id)a4;
- (void)moveInsideNext;
- (void)moveInsidePrevious;
- (void)moveLeft;
- (void)moveRight;
- (void)moveToNextElement;
- (void)moveToPreviousElement;
- (void)moveUp;
- (void)openContextualMenu;
- (void)performDefaultAction;
- (void)performEscape;
- (void)performSysdiagnose;
- (void)press;
- (void)rebootDevice;
- (void)rotateDevice;
- (void)setAccelerometer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusManager:(id)a3;
- (void)setIsPerformingGesture:(BOOL)a3;
- (void)setPidForSuccessfulTypeaheadMovement:(int)a3;
- (void)setShouldAvoidRepostingTextInput:(BOOL)a3;
- (void)showAccessibilityActions;
- (void)toggleAppLibrary;
- (void)toggleAppSwitcher;
- (void)toggleControlCenter;
- (void)toggleDock;
- (void)toggleGesturesMode;
- (void)toggleHelp;
- (void)toggleNotificationCenter;
- (void)togglePassthroughMode;
- (void)toggleQuickNote;
- (void)twoFingerPress;
- (void)willPerformStandardCommandWithIdentifier:(id)a3;
@end

@implementation FKAActionManager

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_enumerateScreensWithBlock:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindowSceneAccessibility", @"_accessibilitySceneDidBecomeFocused", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindowSceneAccessibility", @"_accessibilitySetFocusEnabledInApplication:", "B", "B", 0);
}

- (FKAActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKAActionManager;
  v2 = [(FKAActionManager *)&v6 init];
  if (v2)
  {
    id v3 = +[AXPISystemActionHelper sharedInstance];
    [v3 warm];

    v4 = objc_opt_new();
    [(FKAActionManager *)v2 setFocusManager:v4];
  }
  return v2;
}

- (void)setShouldAvoidRepostingTextInput:(BOOL)a3
{
  if (self->_shouldAvoidRepostingTextInput != a3)
  {
    if (a3
      && ([(FKAActionManager *)self delegate],
          v4 = objc_claimAutoreleasedReturnValue(),
          unsigned int v5 = [v4 actionManagerCanAvoidRepostingTextInput:self],
          v4,
          v5))
    {
      objc_super v6 = [(FKAActionManager *)self delegate];
      [v6 didExitTextEditingModeForActionManager:self];

      BOOL v7 = 1;
    }
    else
    {
      BOOL v7 = 0;
    }
    self->_shouldAvoidRepostingTextInput = v7;
  }
}

- (void)moveToPreviousElement
{
}

- (void)moveToNextElement
{
}

- (void)handleCommand:(id)a3
{
  id v5 = a3;
  id v3 = [v5 type];
  unsigned int v4 = [v3 isEqualToString:FKAKeyboardCommandTypeSiriShortcut];

  if (v4) {
    [v5 perform];
  }
}

- (void)willPerformStandardCommandWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FKAActionManager *)self delegate];
  [v5 showDebugDisplay:v4];

  if (([v4 isEqualToString:AXSSKeyboardCommandIdentifierLockScreen] & 1) == 0)
  {
    objc_super v6 = [(FKAActionManager *)self delegate];
    [v6 wakeDeviceIfNeededForActionManager:self];
  }
  v7.receiver = self;
  v7.super_class = (Class)FKAActionManager;
  [(FKAActionManager *)&v7 willPerformStandardCommandWithIdentifier:v4];
}

- (void)didSuppressCommand:(id)a3
{
  id v4 = a3;
  id v5 = FKALogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Did suppress command: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_super v6 = [(FKAActionManager *)self delegate];
  [v6 didSuppressCommandForActionManager:self];
}

- (void)goToNextElementOfType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = FKALogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = [(FKAActionManager *)self currentApplication];
        objc_super v6 = [v5 bundleId];
        *(_DWORD *)v9 = 138412290;
        *(void *)&v9[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: Move to next element in %@", v9, 0xCu);
      }
      [(FKAActionManager *)self _moveFocusWithHeading:16 byGroup:1];
      goto LABEL_15;
    case 1uLL:
      int v7 = FKALogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v9 = 0;
      id v8 = "Command: Move to next interactive element";
      break;
    case 2uLL:
      int v7 = FKALogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v9 = 0;
      id v8 = "Command: Move to next keyboard focusable element";
      break;
    case 3uLL:
      int v7 = FKALogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v9 = 0;
      id v8 = "Command: Move to next section";
      break;
    case 4uLL:
      int v7 = FKALogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v9 = 0;
      id v8 = "Command: Move to next container";
      break;
    default:
      goto LABEL_15;
  }
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
LABEL_14:

LABEL_15:
  -[FKAActionManager setShouldAvoidRepostingTextInput:](self, "setShouldAvoidRepostingTextInput:", 1, *(void *)v9);
}

- (void)goToPreviousElementOfType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = FKALogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = [(FKAActionManager *)self currentApplication];
        objc_super v6 = [v5 bundleId];
        *(_DWORD *)v9 = 138412290;
        *(void *)&v9[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: Move to previous element in %@", v9, 0xCu);
      }
      [(FKAActionManager *)self _moveFocusWithHeading:32 byGroup:1];
      goto LABEL_15;
    case 1uLL:
      int v7 = FKALogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v9 = 0;
      id v8 = "Command: Move to previous interactive element";
      break;
    case 2uLL:
      int v7 = FKALogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v9 = 0;
      id v8 = "Command: Move to previous keyboard focusable element";
      break;
    case 3uLL:
      int v7 = FKALogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v9 = 0;
      id v8 = "Command: Move to previous section";
      break;
    case 4uLL:
      int v7 = FKALogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v9 = 0;
      id v8 = "Command: Move to previous container";
      break;
    default:
      goto LABEL_15;
  }
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
LABEL_14:

LABEL_15:
  -[FKAActionManager setShouldAvoidRepostingTextInput:](self, "setShouldAvoidRepostingTextInput:", 1, *(void *)v9);
}

- (void)goToFirstElement
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: goToFirstElement", v4, 2u);
  }

  [(FKAActionManager *)self _moveFocusWithHeading:256];
}

- (void)goToLastElement
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: goToLastElement", v4, 2u);
  }

  [(FKAActionManager *)self _moveFocusWithHeading:512];
}

- (void)moveLeft
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: moveLeft", v4, 2u);
  }

  [(FKAActionManager *)self _moveFocusWithHeading:4];
}

- (void)moveRight
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: moveRight", v4, 2u);
  }

  [(FKAActionManager *)self _moveFocusWithHeading:8];
}

- (void)moveUp
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: moveUp", v4, 2u);
  }

  [(FKAActionManager *)self _moveFocusWithHeading:1];
}

- (void)moveDown
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: moveDown", v4, 2u);
  }

  [(FKAActionManager *)self _moveFocusWithHeading:2];
}

- (void)moveInsideNext
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: moveInsideNext", v4, 2u);
  }

  [(FKAActionManager *)self _moveFocusInsideForward:1];
}

- (void)moveInsidePrevious
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: moveInsidePrevious", v4, 2u);
  }

  [(FKAActionManager *)self _moveFocusInsideForward:0];
}

- (void)activateSiri
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: activateSiri", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 activateSiri];
}

- (void)toggleAppSwitcher
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: toggleAppSwitcher", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleAppSwitcher];
}

- (void)toggleAppLibrary
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: toggleAppLibrary", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleAppLibrary];
}

- (void)toggleQuickNote
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: toggleQuickNote", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleQuickNote];
}

- (void)lockScreen
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: lockScreen", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 activateLockButton];
}

- (void)activateAccessibilityShortcut
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: activateAccessibilityShortcut", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 activateTripleClick];
}

- (void)armApplePay
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: armApplePay", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 armApplePay];
}

- (void)rebootDevice
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: rebootDevice", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 rebootDevice];
}

- (void)activateSOS
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: activateSOS", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 activateSOSMode];
}

- (void)toggleControlCenter
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: toggleControlCenter", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleControlCenter];
}

- (void)activateTypeahead
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: activateTypeahead", v5, 2u);
  }

  id v4 = [(FKAActionManager *)self delegate];
  [v4 toggleTypeaheadForActionManager:self];
}

- (void)togglePassthroughMode
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: togglePassthroughMode", v5, 2u);
  }

  id v4 = [(FKAActionManager *)self delegate];
  [v4 togglePassthroughModeForActionManager:self];
}

- (void)toggleGesturesMode
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: toggleGesturesMode", v5, 2u);
  }

  id v4 = [(FKAActionManager *)self delegate];
  [v4 toggleGesturesModeForActionManager:self];
}

- (void)toggleDock
{
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Command: toggleDock", v4, 2u);
  }

  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleDock];
}

- (void)toggleNotificationCenter
{
  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleNotificationCenter];

  id v4 = [(FKAActionManager *)self delegate];
  [v4 didToggleNotificationCenterForActionManager:self];
}

- (void)showAccessibilityActions
{
  id v3 = [(FKAActionManager *)self delegate];
  [v3 hideTypeaheadSynchronouslyForActionManager:self];

  id v5 = [(FKAActionManager *)self delegate];
  id v4 = [(FKAActionManager *)self currentElement];
  [v5 actionManager:self showActionsForElement:v4];
}

- (void)goHome
{
  v2 = +[AXSpringBoardServer server];
  unsigned __int8 v3 = [v2 dismissBuddyIfNecessary];

  if ((v3 & 1) == 0)
  {
    id v4 = +[AXPISystemActionHelper sharedInstance];
    [v4 activateHomeButton];
  }
}

- (void)performEscape
{
}

- (BOOL)handleEscapeKey
{
  unsigned __int8 v3 = [(FKAActionManager *)self delegate];
  unsigned __int8 v4 = [v3 dismissHelpForActionManager:self];

  if (v4) {
    return 1;
  }
  objc_super v6 = [(FKAActionManager *)self currentElement];
  unsigned __int8 v7 = [v6 performAction:2013];

  return v7;
}

- (void)performSysdiagnose
{
  unsigned __int8 v3 = +[AXPISystemActionHelper sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008590;
  v4[3] = &unk_1000247C0;
  v4[4] = self;
  [v3 performSysdiagnoseWithStatusUpdateHandler:v4];
}

- (void)rotateDevice
{
  unsigned __int8 v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: rotateDevice", (uint8_t *)&v13, 2u);
  }

  unsigned __int8 v4 = [(FKAActionManager *)self accelerometer];

  if (!v4)
  {
    id v5 = objc_opt_new();
    [(FKAActionManager *)self setAccelerometer:v5];
  }
  objc_super v6 = [(FKAActionManager *)self accelerometer];
  unsigned int v7 = [v6 currentDeviceOrientation];

  if (v7 > 6 || ((1 << v7) & 0x61) == 0)
  {
    v11 = FKALogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 67109120;
      unsigned int v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Device orientation: %i", (uint8_t *)&v13, 8u);
    }
    unsigned int v9 = v7;
    goto LABEL_16;
  }
  id v8 = +[AXSpringBoardServer server];
  unsigned int v9 = [v8 activeApplicationOrientation];

  v10 = FKALogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 67109376;
    unsigned int v14 = v7;
    __int16 v15 = 1024;
    unsigned int v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Device orientation: %i, application orientation: %i", (uint8_t *)&v13, 0xEu);
  }

  if (v9 <= 6 && ((1 << v9) & 0x61) != 0)
  {
    v11 = FKALogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1000147B8(v9, v11);
    }
LABEL_16:
  }
  switch(v9)
  {
    case 1u:
      v12 = +[AXPISystemActionHelper sharedInstance];
      [v12 rotateLeft];
      break;
    case 2u:
      v12 = +[AXPISystemActionHelper sharedInstance];
      [v12 rotateRight];
      break;
    case 3u:
      v12 = +[AXPISystemActionHelper sharedInstance];
      [v12 rotateUpsideDown];
      break;
    case 4u:
      v12 = +[AXPISystemActionHelper sharedInstance];
      [v12 rotatePortrait];
      break;
    default:
      v12 = FKALogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100014740(v9, v12);
      }
      break;
  }
}

- (void)performDefaultAction
{
  id v3 = [(FKAActionManager *)self currentElement];
  [v3 press];
  [(FKAActionManager *)self setShouldAvoidRepostingTextInput:0];
}

- (void)toggleHelp
{
  id v3 = [(FKAActionManager *)self delegate];
  unsigned __int8 v4 = [v3 dismissHelpForActionManager:self];

  if ((v4 & 1) == 0)
  {
    id v5 = [(FKAActionManager *)self delegate];
    [v5 showHelpForActionManager:self];
  }
}

- (void)openContextualMenu
{
  id v2 = [(FKAActionManager *)self currentElement];
  [v2 showContextMenu];
}

- (void)press
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "pressAtPoint:numberOfFingers:", 1);
}

- (void)lift
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  unsigned int v4 = [v3 isPerformingGesture];

  if (v4)
  {
    id v5 = [(FKAActionManager *)self gestureViewController];
    [v5 lift];
  }
}

- (void)twoFingerPress
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "pressAtPoint:numberOfFingers:", 2);
}

- (void)beginSwipeLeft
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 0, 1);
}

- (void)beginSwipeRight
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 1, 1);
}

- (void)beginSwipeUp
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 2, 1);
}

- (void)beginSwipeDown
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 3, 1);
}

- (void)endSwipe
{
  id v2 = [(FKAActionManager *)self gestureViewController];
  [v2 endIncrementalGesture];
}

- (void)beginTwoFingerSwipeLeft
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 0, 2);
}

- (void)beginTwoFingerSwipeRight
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 1, 2);
}

- (void)beginTwoFingerSwipeUp
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 2, 2);
}

- (void)beginTwoFingerSwipeDown
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 3, 2);
}

- (void)endTwoFingerSwipe
{
  id v2 = [(FKAActionManager *)self gestureViewController];
  [v2 endIncrementalGesture];
}

- (void)beginPinchOut
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginPinchOutFromPoint:");
}

- (void)beginPinchIn
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginPinchInFromPoint:");
}

- (void)endPinch
{
  id v2 = [(FKAActionManager *)self gestureViewController];
  [v2 endIncrementalGesture];
}

- (void)beginRotateLeft
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginRotateLeftFromPoint:");
}

- (void)beginRotateRight
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "beginRotateRightFromPoint:");
}

- (void)endRotate
{
  id v2 = [(FKAActionManager *)self gestureViewController];
  [v2 endIncrementalGesture];
}

- (void)begin3DTouch
{
  id v3 = [(FKAActionManager *)self gestureViewController];
  [(FKAActionManager *)self _pointForGestures];
  objc_msgSend(v3, "begin3DTouchAtPoint:");
}

- (void)end3DTouch
{
  id v2 = [(FKAActionManager *)self gestureViewController];
  [v2 endIncrementalGesture];
}

- (id)gestureViewController
{
  id v2 = [(FKAActionManager *)self delegate];
  id v3 = [v2 gestureViewController];

  return v3;
}

- (AXElement)currentApplication
{
  id v2 = [(FKAActionManager *)self focusManager];
  id v3 = [v2 currentApplication];

  return (AXElement *)v3;
}

- (AXElement)currentElement
{
  id v2 = [(FKAActionManager *)self currentApplication];
  id v3 = [v2 currentFocusElement];

  if ([v3 hasRemoteFocusSystem])
  {
    do
    {
      unsigned int v4 = [v3 elementForRemoteFocusSystem];
      id v5 = [v4 currentFocusElement];

      id v3 = v5;
    }
    while (([v5 hasRemoteFocusSystem] & 1) != 0);
  }
  else
  {
    id v5 = v3;
  }

  return (AXElement *)v5;
}

- (void)_moveFocusWithHeading:(unint64_t)a3
{
}

- (void)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [(FKAActionManager *)self focusManager];
  [v7 moveFocusWithHeading:a3 byGroup:v4];

  [(FKAActionManager *)self setShouldAvoidRepostingTextInput:1];
}

- (void)_moveFocusInsideForward:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FKAActionManager *)self focusManager];
  [v5 moveFocusInsideForward:v3];

  objc_super v6 = [(FKAActionManager *)self delegate];
  [v6 didMoveToInnerElementForActionManager:self];

  [(FKAActionManager *)self setShouldAvoidRepostingTextInput:1];
}

- (void)moveFocusWithHeading:(unint64_t)a3 queryString:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(FKAActionManager *)self focusManager];
  [v7 moveFocusWithHeading:a3 queryString:v6];

  [(FKAActionManager *)self setShouldAvoidRepostingTextInput:1];
}

- (void)focusOnSceneForTypeahead
{
  id v2 = [(FKAActionManager *)self focusManager];
  [v2 focusOnSceneForTypeahead];
}

- (void)didPerformTextInput
{
}

- (void)didObserveScreenChange
{
}

- (BOOL)_isInTextEditingModeForCurrentElement:(id)a3
{
  BOOL v4 = [(FKAActionManager *)self _isTextEditingElement:a3];
  if (v4) {
    LOBYTE(v4) = ![(FKAActionManager *)self shouldAvoidRepostingTextInput];
  }
  return v4;
}

- (BOOL)isInTextEditingMode
{
  id v2 = self;
  BOOL v3 = [(FKAActionManager *)self currentElement];
  LOBYTE(v2) = [(FKAActionManager *)v2 _isInTextEditingModeForCurrentElement:v3];

  return (char)v2;
}

- (BOOL)shouldRepostForKeyChord:(id)a3
{
  id v4 = a3;
  if ([v4 isTextInputChord])
  {
    id v5 = [(FKAActionManager *)self currentElement];
    if ([(FKAActionManager *)self _isInTextEditingModeForCurrentElement:v5]
      && (![v4 isTextInputTabChord]
       || ([v5 uiElement],
           id v6 = objc_claimAutoreleasedReturnValue(),
           unsigned __int8 v7 = [v6 BOOLWithAXAttribute:12007],
           v6,
           (v7 & 1) != 0)))
    {
      BOOL v8 = 1;
    }
    else if ([v4 isArrowKeyChord])
    {
      BOOL v8 = [(FKAActionManager *)self _element:v5 handlesArrowKeyChord:v4];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_element:(id)a3 handlesArrowKeyChord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 pid];
  unsigned int v9 = [(FKAActionManager *)self currentApplication];
  if (v8 != [v9 pid])
  {
    unsigned __int8 v11 = 0;
LABEL_6:

    goto LABEL_7;
  }
  unsigned __int8 v10 = [v7 containsModifier];

  if ((v10 & 1) == 0)
  {
    v12 = [v6 uiElement];
    unsigned int v9 = [v12 arrayWithAXAttribute:12011];

    int v13 = +[NSSet setWithArray:v9];
    unsigned int v14 = [v7 keys];
    __int16 v15 = +[NSSet setWithArray:v14];
    unsigned __int8 v11 = [v13 intersectsSet:v15];

    goto LABEL_6;
  }
  unsigned __int8 v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)_isTextEditingElement:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 traits];
  if (((kAXIsEditingTrait | kAXTextEntryTrait) & ~v4) != 0) {
    unsigned __int8 v5 = [v3 isComboBox];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (CGPoint)_pointForGestures
{
  id v3 = [(FKAActionManager *)self currentElement];
  [(FKAActionManager *)self _pointForGesturesForElement:v3];
  double v6 = v5;
  double v7 = v4;
  double y = CGPointZero.y;
  if (v5 == CGPointZero.x && v4 == y)
  {
    unsigned __int8 v10 = [v3 elementForAttribute:3049];
    if (v10)
    {
      unsigned __int8 v11 = FKALogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Trying to perform a gesture using a focus ring ancestor.", (uint8_t *)&v21, 2u);
      }

      [(FKAActionManager *)self _pointForGesturesForElement:v10];
      double v6 = v12;
      double v7 = v13;
    }
  }
  if (v6 == CGPointZero.x && v7 == y)
  {
    -[FKAActionManager _referenceBoundsForDisplayId:](self, "_referenceBoundsForDisplayId:", [v3 windowDisplayId]);
    AX_CGRectGetCenter();
    double v6 = v15;
    double v7 = v16;
    v17 = FKALogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v23.x = v6;
      v23.double y = v7;
      v18 = NSStringFromCGPoint(v23);
      int v21 = 138412290;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Falling back to gesture at center point of screen: %@", (uint8_t *)&v21, 0xCu);
    }
  }

  double v19 = v6;
  double v20 = v7;
  result.double y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)_pointForGesturesForElement:(id)a3
{
  id v4 = a3;
  double y = CGPointZero.y;
  [v4 visiblePoint];
  double v7 = v6;
  double v9 = v8;
  id v10 = [v4 windowContextId];
  id v11 = [v4 windowDisplayId];
  [(FKAActionManager *)self _referenceBoundsForDisplayId:v11];
  CGFloat v57 = v13;
  CGFloat v59 = v12;
  CGFloat v55 = v15;
  CGFloat v56 = v14;
  BOOL v16 = v7 == -1.0 && v9 == -1.0;
  double v17 = y;
  double x = CGPointZero.x;
  if (!v16)
  {
    BOOL v19 = v7 == CGPointZero.x && v9 == y;
    double v17 = y;
    double x = CGPointZero.x;
    if (!v19)
    {
      double v20 = +[AXElement systemWideElement];
      objc_msgSend(v20, "convertPoint:fromContextId:displayId:", v10, v11, v7, v9);
      CGFloat v22 = v21;
      CGFloat v24 = v23;

      v79.origin.double y = v57;
      v79.origin.double x = v59;
      v79.size.CGFloat height = v55;
      v79.size.CGFloat width = v56;
      v76.double x = v22;
      v76.double y = v24;
      double v17 = y;
      double x = CGPointZero.x;
      if (CGRectContainsPoint(v79, v76))
      {
        v25 = FKALogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v71.double x = v22;
          v71.double y = v24;
          v26 = NSStringFromCGPoint(v71);
          v72.double x = v7;
          v72.double y = v9;
          v27 = NSStringFromCGPoint(v72);
          *(_DWORD *)buf = 138413314;
          v62 = v26;
          __int16 v63 = 2112;
          id v64 = v27;
          __int16 v65 = 1024;
          int v66 = (int)v10;
          __int16 v67 = 1024;
          int v68 = (int)v11;
          __int16 v69 = 2112;
          id v70 = v4;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Gesture at visible point: %@, raw visible point: %@, context ID: %u, display ID: %u, element: %@", buf, 0x2Cu);
        }
        double v17 = v24;
        double x = v22;
      }
    }
  }
  if (x == CGPointZero.x && v17 == y)
  {
    [v4 centerPoint];
    double v31 = v29;
    double v32 = v30;
    if ((v29 != -1.0 || v30 != -1.0) && (v29 != CGPointZero.x || v30 != y))
    {
      v34 = +[AXElement systemWideElement];
      objc_msgSend(v34, "convertPoint:fromContextId:displayId:", v10, v11, v31, v32);
      CGFloat v36 = v35;
      CGFloat v38 = v37;

      v80.origin.double y = v57;
      v80.origin.double x = v59;
      v80.size.CGFloat height = v55;
      v80.size.CGFloat width = v56;
      v77.double x = v36;
      v77.double y = v38;
      if (CGRectContainsPoint(v80, v77))
      {
        v39 = FKALogCommon();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v73.double x = v36;
          v73.double y = v38;
          v40 = NSStringFromCGPoint(v73);
          v74.double x = v31;
          v74.double y = v32;
          v41 = NSStringFromCGPoint(v74);
          *(_DWORD *)buf = 138413314;
          v62 = v40;
          __int16 v63 = 2112;
          id v64 = v41;
          __int16 v65 = 1024;
          int v66 = (int)v10;
          __int16 v67 = 1024;
          int v68 = (int)v11;
          __int16 v69 = 2112;
          id v70 = v4;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Gesture at center point: %@, raw center point: %@, context ID: %u, display ID: %u, element: %@", buf, 0x2Cu);
        }
        double v17 = v38;
        double x = v36;
      }
    }
  }
  if (x == CGPointZero.x && v17 == y)
  {
    [v4 frame];
    CGFloat v43 = v81.origin.x;
    CGFloat v44 = v81.origin.y;
    CGFloat width = v81.size.width;
    CGFloat height = v81.size.height;
    if (!CGRectIsEmpty(v81))
    {
      AX_CGRectGetCenter();
      v78.double x = v47;
      v78.double y = v48;
      v82.origin.double y = v57;
      v82.origin.double x = v59;
      v82.size.CGFloat height = v55;
      v82.size.CGFloat width = v56;
      CGFloat v58 = v78.y;
      CGFloat v60 = v78.x;
      if (CGRectContainsPoint(v82, v78))
      {
        v49 = FKALogCommon();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v83.origin.double x = v43;
          v83.origin.double y = v44;
          v83.size.CGFloat width = width;
          v83.size.CGFloat height = height;
          v50 = NSStringFromCGRect(v83);
          *(_DWORD *)buf = 138412546;
          v62 = v50;
          __int16 v63 = 2112;
          id v64 = v4;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Gesture at midpoint of frame: %@, element: %@", buf, 0x16u);
        }
        double v17 = v58;
        double x = v60;
      }
    }
  }
  if (x == CGPointZero.x && v17 == y)
  {
    v52 = FKALogCommon();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_100014830((uint64_t)v4, v52);
    }
  }
  double v53 = x;
  double v54 = v17;
  result.double y = v54;
  result.double x = v53;
  return result;
}

- (CGRect)_referenceBoundsForDisplayId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_10002DBB0 != -1) {
    dispatch_once(&qword_10002DBB0, &stru_100024800);
  }
  id v4 = (void *)qword_10002DBA8;
  double v5 = +[NSNumber numberWithUnsignedInt:v3];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    double v7 = (void *)qword_10002DBA8;
    double v8 = +[NSNumber numberWithUnsignedInt:v3];
    double v9 = [v7 objectForKeyedSubscript:v8];
    CGRect v29 = CGRectFromString(v9);
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
  }
  else
  {
    uint64_t v23 = 0;
    CGFloat v24 = (CGRect *)&v23;
    uint64_t v25 = 0x4010000000;
    v26 = &unk_10001B4F1;
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v28 = size;
    LODWORD(v22) = v3;
    AXPerformSafeBlock();
    double v15 = NSStringFromCGRect(v24[1]);
    BOOL v16 = (void *)qword_10002DBA8;
    double v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3, _NSConcreteStackBlock, 3221225472, sub_100009F64, &unk_100024850, &v23, v22);
    [v16 setObject:v15 forKeyedSubscript:v17];

    CGFloat x = v24[1].origin.x;
    CGFloat y = v24[1].origin.y;
    CGFloat width = v24[1].size.width;
    CGFloat height = v24[1].size.height;
    _Block_object_dispose(&v23, 8);
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (FKAActionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FKAActionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
}

- (BOOL)isPerformingGesture
{
  return self->_isPerformingGesture;
}

- (void)setIsPerformingGesture:(BOOL)a3
{
  self->_isPerformingGesture = a3;
}

- (BOOL)shouldAvoidRepostingTextInput
{
  return self->_shouldAvoidRepostingTextInput;
}

- (AXFocusManager)focusManager
{
  return self->_focusManager;
}

- (void)setFocusManager:(id)a3
{
}

- (int)pidForSuccessfulTypeaheadMovement
{
  return self->_pidForSuccessfulTypeaheadMovement;
}

- (void)setPidForSuccessfulTypeaheadMovement:(int)a3
{
  self->_pidForSuccessfulTypeaheadMovement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusManager, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
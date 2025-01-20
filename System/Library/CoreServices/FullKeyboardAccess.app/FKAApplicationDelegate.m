@interface FKAApplicationDelegate
+ (BOOL)isFeatureEnabled;
+ (id)debugFeatureName;
+ (id)featureEnabledStatusDidChangeNotification;
- (AXElementActionManager)elementActionManager;
- (AXNotificationObserver)axNotificationObserver;
- (AXSSEventManager)eventManager;
- (AXUIBannerPresenter)bannerPresenter;
- (AXUIBannerPresenter)debugBannerPresenter;
- (BOOL)_areActionsValidForElement:(id)a3;
- (BOOL)_canEnableFocusRingCheckingSystemSleepingState:(BOOL)a3;
- (BOOL)_canPerform3DTouchCommand;
- (BOOL)_dismissActionsControllerByForce:(BOOL)a3;
- (BOOL)_sceneVendedByOneness:(id)a3;
- (BOOL)actionManagerCanAvoidRepostingTextInput:(id)a3;
- (BOOL)canMoveApplicationFocusForActionManager:(id)a3;
- (BOOL)dismissHelpForActionManager:(id)a3;
- (BOOL)eventManager:(id)a3 shouldRepostEvent:(id)a4;
- (BOOL)isGesturesModeEnabled;
- (BOOL)isPassthroughModeEnabled;
- (BOOL)isShowingTextEditingModeInstructions;
- (BOOL)shouldIgnoreNextScreenChange;
- (FKAActionManager)actionManager;
- (FKAApplicationDelegate)init;
- (FKACommandsViewController)commandsViewController;
- (FKAEventTap)eventTap;
- (FKARootViewController)nonInteractiveRootViewController;
- (FKARootViewController)rootViewController;
- (FKATypeaheadViewController)typeaheadController;
- (NSDate)lastWakeDeviceDate;
- (NSString)gesturesModeKeyChordsIdentifier;
- (NSTimer)debugDisplayTimer;
- (NSTimer)typeaheadStartTimer;
- (UIWindow)nonInteractiveWindow;
- (id)_fkaDelegateScenes;
- (id)_keyChordForExitingTextMode;
- (id)_notificationsToRegister;
- (id)_sceneDelegateForFocusedElement;
- (id)_sceneDelegates;
- (id)availableCommandsUpdateToken;
- (id)gestureViewController;
- (int)nativeFocusElementDisplayID;
- (void)_addTransientCommandsForGesturesMode;
- (void)_announceCommandList:(id)a3;
- (void)_cancelFocusRingTimeout;
- (void)_didUpdateAvailableCommandsWithUpdatedMap:(id)a3;
- (void)_didUpdateFocusRingTimeout;
- (void)_didUpdateHardwareKeyboardAttachedStatus;
- (void)_disableFocusRing;
- (void)_disableFocusRingForTimeout;
- (void)_dismissTextEditingModeInstructionsIfNeeded;
- (void)_enableFocusRingIfNecessary;
- (void)_enableFocusRingIfNecessaryCheckingSystemSleepingState:(BOOL)a3;
- (void)_enableFocusRingWithTimeout;
- (void)_handleNativeFocusItemChange:(id)a3;
- (void)_handleScreenChange;
- (void)_handleUpdatedElementsForScreenChange:(BOOL)a3;
- (void)_hideTypeaheadNames;
- (void)_hideTypeaheadSynchronously;
- (void)_resetFocusRingTimeout;
- (void)_setupUI;
- (void)_showActionsForElement:(id)a3;
- (void)_showBannerWithCustomView:(id)a3 isSticky:(BOOL)a4;
- (void)_showBannerWithText:(id)a3;
- (void)_showBannerWithText:(id)a3 andSecondaryText:(id)a4 orCustomView:(id)a5 isSticky:(BOOL)a6 fromUserAction:(BOOL)a7;
- (void)_showBannerWithText:(id)a3 secondaryText:(id)a4 isSticky:(BOOL)a5 fromUserAction:(BOOL)a6;
- (void)_showDebugBannerText:(id)a3;
- (void)_showTypeaheadNames;
- (void)_updateTypeaheadNamesViewControllerItems;
- (void)_updateTypeaheadNamesViewControllerItemsForQueryString:(id)a3;
- (void)_wakeDeviceIfNeeded;
- (void)actionManager:(id)a3 displaySysdiagnoseStatus:(id)a4;
- (void)actionManager:(id)a3 showActionsForElement:(id)a4;
- (void)dealloc;
- (void)didExitTextEditingModeForActionManager:(id)a3;
- (void)didFinishLaunching;
- (void)didMoveToInnerElementForActionManager:(id)a3;
- (void)didReleaseNativeFocus;
- (void)didSuppressCommandForActionManager:(id)a3;
- (void)didToggleNotificationCenterForActionManager:(id)a3;
- (void)enumerateSceneDelegatesWithBlock:(id)a3;
- (void)eventManager:(id)a3 repostEvent:(id)a4;
- (void)eventTap:(id)a3 handleKeyboardEvent:(id)a4;
- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5;
- (void)setAvailableCommandsUpdateToken:(id)a3;
- (void)setAxNotificationObserver:(id)a3;
- (void)setCommandsViewController:(id)a3;
- (void)setDebugBannerPresenter:(id)a3;
- (void)setDebugDisplayTimer:(id)a3;
- (void)setEventTap:(id)a3;
- (void)setGesturesModeEnabled:(BOOL)a3;
- (void)setGesturesModeKeyChordsIdentifier:(id)a3;
- (void)setIsShowingTextEditingModeInstructions:(BOOL)a3;
- (void)setLastWakeDeviceDate:(id)a3;
- (void)setNativeFocusElementDisplayID:(int)a3;
- (void)setPassthroughModeEnabled:(BOOL)a3;
- (void)setShouldIgnoreNextScreenChange:(BOOL)a3;
- (void)setTypeaheadController:(id)a3;
- (void)setTypeaheadStartTimer:(id)a3;
- (void)showDebugDisplay:(id)a3;
- (void)showDebugDisplayWithKeyChord:(id)a3;
- (void)showHelpForActionManager:(id)a3;
- (void)toggleGesturesModeForActionManager:(id)a3;
- (void)togglePassthroughModeForActionManager:(id)a3;
- (void)toggleTypeaheadForActionManager:(id)a3;
- (void)typeaheadViewController:(id)a3 didChangeQueryString:(id)a4;
- (void)typeaheadViewControllerDidTypeReturn:(id)a3;
- (void)typeaheadViewControllerWillAppear:(id)a3;
- (void)typeaheadViewControllerWillDismiss:(id)a3;
- (void)willAquireNativeFocus;
- (void)willDismissFloatingViewForPresenter:(id)a3;
- (void)willTerminate;
@end

@implementation FKAApplicationDelegate

- (FKAApplicationDelegate)init
{
  v31.receiver = self;
  v31.super_class = (Class)FKAApplicationDelegate;
  v2 = [(FKAApplicationDelegate *)&v31 init];
  if (v2)
  {
    +[AXUIElement applyElementAttributeCacheScheme:5];
    v3 = objc_opt_new();
    [v3 setDelegate:v2];
    v4 = +[FKAAvailableCommands sharedInstance];
    v5 = [v4 commandMap];

    v6 = (AXSSEventManager *)[objc_alloc((Class)AXSSEventManager) initWithActionManager:v3 commandMap:v5];
    eventManager = v2->_eventManager;
    v2->_eventManager = v6;

    [(AXSSEventManager *)v2->_eventManager setFilterDelegate:v2];
    [(AXSSEventManager *)v2->_eventManager setShouldSuppressCommands:_AXSFullKeyboardAccessFocusRingEnabled() == 0];
    [(FKAApplicationDelegate *)v2 setNativeFocusElementDisplayID:0xFFFFFFFFLL];
    id v8 = objc_alloc((Class)AXNotificationObserver);
    v9 = [(FKAApplicationDelegate *)v2 _notificationsToRegister];
    id v10 = [v8 initWithNotifications:v9];

    [v10 setDelegate:v2];
    [(FKAApplicationDelegate *)v2 setAxNotificationObserver:v10];
    objc_initWeak(&location, v2);
    v11 = +[FKAAvailableCommands sharedInstance];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000FBAC;
    v28[3] = &unk_100024958;
    objc_copyWeak(&v29, &location);
    uint64_t v12 = [v11 registerUpdateBlock:v28];
    id availableCommandsUpdateToken = v2->_availableCommandsUpdateToken;
    v2->_id availableCommandsUpdateToken = (id)v12;

    v14 = +[AXSettings sharedInstance];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000FC20;
    v26[3] = &unk_100024980;
    objc_copyWeak(&v27, &location);
    [v14 registerUpdateBlock:v26 forRetrieveSelector:"fullKeyboardAccessFocusRingTimeoutEnabled" withListener:v2];

    objc_destroyWeak(&v27);
    v15 = +[AXSettings sharedInstance];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000FC60;
    v24[3] = &unk_100024980;
    objc_copyWeak(&v25, &location);
    [v15 registerUpdateBlock:v24 forRetrieveSelector:"fullKeyboardAccessFocusRingTimeout" withListener:v2];

    objc_destroyWeak(&v25);
    v16 = +[AXBackBoardServer server];
    [v16 registerFullKeyboardAccessDaemonPID:getpid()];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10000FCA0, (CFStringRef)+[NSString stringWithUTF8String:kGSEventHardwareKeyboardAvailabilityChangedNotification], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v18 = objc_opt_new();
    [(FKAApplicationDelegate *)v2 setEventTap:v18];

    v19 = [(FKAApplicationDelegate *)v2 eventTap];
    [v19 setDelegate:v2];

    v20 = FKALogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Enabling focus ring at launch.", v23, 2u);
    }

    [(FKAApplicationDelegate *)v2 _enableFocusRingIfNecessary];
    v21 = FKALogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Disabling passthrough mode at launch.", v23, 2u);
    }

    _AXSFullKeyboardAccessSetPassthroughModeEnabled();
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)_notificationsToRegister
{
  return &off_100025628;
}

- (void)dealloc
{
  v3 = +[FKAAvailableCommands sharedInstance];
  [v3 unregisterUpdateBlockWithToken:self->_availableCommandsUpdateToken];

  v4.receiver = self;
  v4.super_class = (Class)FKAApplicationDelegate;
  [(FKAApplicationDelegate *)&v4 dealloc];
}

- (FKAActionManager)actionManager
{
  v2 = [(FKAApplicationDelegate *)self eventManager];
  v3 = [v2 actionManager];

  return (FKAActionManager *)v3;
}

- (AXElementActionManager)elementActionManager
{
  elementActionManager = self->_elementActionManager;
  if (!elementActionManager)
  {
    id v4 = objc_alloc((Class)AXElementActionManager);
    v5 = (AXElementActionManager *)[v4 initWithDragServiceName:AXDragServiceNameFullKeyboardAccess];
    v6 = self->_elementActionManager;
    self->_elementActionManager = v5;

    [(AXElementActionManager *)self->_elementActionManager setShouldIncludeMedusaActions:1];
    elementActionManager = self->_elementActionManager;
  }

  return elementActionManager;
}

- (AXUIBannerPresenter)bannerPresenter
{
  v3 = [(FKAApplicationDelegate *)self rootViewController];
  id v4 = [v3 bannerPresenter];

  if (!v4)
  {
    v5 = [FKABannerPresenter alloc];
    v6 = [(FKAApplicationDelegate *)self nonInteractiveWindow];
    v7 = [(FKABannerPresenter *)v5 initWithContainingView:v6];
    id v8 = [(FKAApplicationDelegate *)self rootViewController];
    [v8 setBannerPresenter:v7];

    v9 = [(FKAApplicationDelegate *)self rootViewController];
    id v10 = [v9 bannerPresenter];
    [v10 setDelegate:self];
  }
  v11 = [(FKAApplicationDelegate *)self rootViewController];
  uint64_t v12 = [v11 bannerPresenter];

  return (AXUIBannerPresenter *)v12;
}

- (void)setShouldIgnoreNextScreenChange:(BOOL)a3
{
  if (self->_shouldIgnoreNextScreenChange != a3)
  {
    BOOL v3 = a3;
    self->_shouldIgnoreNextScreenChange = a3;
    id v4 = FKALogCommon();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        __int16 v9 = 0;
        v6 = "Ignoring next screen change.";
        v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v6, v7, 2u);
      }
    }
    else if (v5)
    {
      __int16 v8 = 0;
      v6 = "Stopped ignoring screen changes.";
      v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }
  }
}

+ (id)debugFeatureName
{
  return @"Full Keyboard Access";
}

+ (BOOL)isFeatureEnabled
{
  return _AXSFullKeyboardAccessEnabled() != 0;
}

+ (id)featureEnabledStatusDidChangeNotification
{
  return kAXSFullKeyboardAccessEnabledNotification;
}

- (void)didFinishLaunching
{
  BOOL v3 = +[AXValidationManager sharedInstance];
  +[FKAActionManager _accessibilityPerformValidations:v3];

  if ((+[FKAApplication usesScenes] & 1) == 0)
  {
    [(FKAApplicationDelegate *)self _setupUI];
  }
}

- (void)_setupUI
{
  BOOL v3 = objc_opt_new();
  [(FKAApplicationDelegate *)self setWindow:v3];

  id v4 = [[FKARootViewController alloc] initWithDelegate:self displayUUID:0];
  BOOL v5 = [(FKAApplicationDelegate *)self window];
  [v5 setRootViewController:v4];

  v6 = [(FKAApplicationDelegate *)self window];
  [v6 makeKeyAndVisible];

  v7 = (UIWindow *)objc_opt_new();
  nonInteractiveWindow = self->_nonInteractiveWindow;
  self->_nonInteractiveWindow = v7;

  __int16 v9 = [(FKARootViewController *)[FKARootNonInteractiveViewController alloc] initWithDelegate:self displayUUID:0];
  id v10 = [(FKAApplicationDelegate *)self nonInteractiveWindow];
  [v10 setRootViewController:v9];

  v11 = [(FKAApplicationDelegate *)self nonInteractiveWindow];
  [v11 setWindowLevel:UIWindowLevelNormal + 1.0];

  id v12 = [(FKAApplicationDelegate *)self nonInteractiveWindow];
  [v12 setHidden:0];
}

- (void)willTerminate
{
  BOOL v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Disabling focus ring on termination.", v4, 2u);
  }

  [(FKAApplicationDelegate *)self _disableFocusRing];
}

- (void)eventTap:(id)a3 handleKeyboardEvent:(id)a4
{
  id v14 = a4;
  if ([v14 isDownEvent]
    && ![(FKAApplicationDelegate *)self isShowingTextEditingModeInstructions])
  {
    BOOL v5 = [(FKAApplicationDelegate *)self bannerPresenter];
    [v5 dismissFloatingView];
  }
  v6 = [(FKAApplicationDelegate *)self eventManager];
  unsigned int v7 = [v6 processKeyboardEvent:v14];

  if (v7)
  {
    id v8 = (id)_AXSFullKeyboardAccessFocusRingEnabled();
    id v9 = v14;
    if (!v8) {
      goto LABEL_17;
    }
    if ([v14 isDownEvent]) {
      id v8 = [(FKAApplicationDelegate *)self _cancelFocusRingTimeout];
    }
    else {
      id v8 = [(FKAApplicationDelegate *)self _resetFocusRingTimeout];
    }
LABEL_16:
    id v9 = v14;
    goto LABEL_17;
  }
  if ([v14 isDownEvent])
  {
    id v10 = [(FKAApplicationDelegate *)self eventTap];
    [v10 repostDownAndUpForKeyboardEvent:v14];
  }
  id v8 = [v14 isDownEvent];
  id v9 = v14;
  if (v8)
  {
    v11 = [v14 unicodeCharacter];
    if ([v11 length])
    {
      unint64_t v12 = (unint64_t)[v14 modifierMask] & 0xFFFFFFFFFFFFFFF7;

      id v9 = v14;
      if (v12) {
        goto LABEL_17;
      }
      v13 = [(FKAApplicationDelegate *)self actionManager];
      [v13 didPerformTextInput];
    }
    else
    {
    }
    goto LABEL_16;
  }
LABEL_17:

  _objc_release_x1(v8, v9);
}

- (id)gestureViewController
{
  v2 = [(FKAApplicationDelegate *)self rootViewController];
  BOOL v3 = [v2 gestureViewController];

  return v3;
}

- (void)actionManager:(id)a3 showActionsForElement:(id)a4
{
  id v5 = a4;
  if ([(FKAApplicationDelegate *)self _dismissActionsControllerByForce:1])
  {
    v6 = FKALogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      unsigned int v7 = "Asked to show actions, but they were already showing. Dismissing instead.";
      id v8 = v6;
      uint32_t v9 = 2;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v10 = [(FKAApplicationDelegate *)self elementActionManager];
  unsigned int v11 = [v10 canShowActionsForElement:v5];

  if (v11)
  {
    if (![(FKAApplicationDelegate *)self _areActionsValidForElement:v5])
    {
      v6 = FKALogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v5;
        unsigned int v7 = "Tried to show actions for element that was not focusable: %@";
        id v8 = v6;
        uint32_t v9 = 12;
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
    [(FKAApplicationDelegate *)self _showActionsForElement:v5];
  }
  else
  {
    unint64_t v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"NO_ACTIONS" value:&stru_100024CA0 table:0];
    [(FKAApplicationDelegate *)self _showBannerWithText:v13];
  }
LABEL_12:
}

- (void)toggleTypeaheadForActionManager:(id)a3
{
  id v4 = [(FKAApplicationDelegate *)self typeaheadController];

  if (!v4)
  {
    id v5 = objc_opt_new();
    [(FKAApplicationDelegate *)self setTypeaheadController:v5];

    v6 = [(FKAApplicationDelegate *)self typeaheadController];
    [v6 setDelegate:self];

    unsigned int v7 = [(FKAApplicationDelegate *)self rootViewController];
    id v8 = [(FKAApplicationDelegate *)self typeaheadController];
    [v7 showChildViewController:v8 animated:0];
  }
  uint32_t v9 = [(FKAApplicationDelegate *)self typeaheadController];
  if ([v9 state])
  {
  }
  else
  {
    id v10 = [(FKAApplicationDelegate *)self rootViewController];
    unsigned int v11 = [v10 presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(FKAApplicationDelegate *)self setShouldIgnoreNextScreenChange:1];
      [(FKAApplicationDelegate *)self _dismissActionsControllerByForce:1];
    }
  }
  id v13 = [(FKAApplicationDelegate *)self typeaheadController];
  [v13 toggleTypeaheadState];
}

- (void)_hideTypeaheadSynchronously
{
  BOOL v3 = [(FKAApplicationDelegate *)self typeaheadController];
  id v4 = [v3 state];

  if (v4)
  {
    id v5 = [(FKAApplicationDelegate *)self typeaheadController];
    [v5 setState:0];

    for (double i = 0.0; ; double i = i + 0.05)
    {
      unsigned int v7 = [(FKAApplicationDelegate *)self actionManager];
      id v8 = [v7 currentApplication];
      uint32_t v9 = [v8 bundleId];
      id v10 = +[NSBundle mainBundle];
      unsigned int v11 = [v10 bundleIdentifier];
      unsigned int v12 = [v9 isEqualToString:v11];

      if (!v12 || i >= 1.0) {
        break;
      }
      int v14 = +[NSRunLoop currentRunLoop];
      id v15 = +[NSDate dateWithTimeIntervalSinceNow:0.05];
      [v14 runUntilDate:v15];
    }
  }
}

- (void)toggleGesturesModeForActionManager:(id)a3
{
  uint64_t v4 = [(FKAApplicationDelegate *)self isGesturesModeEnabled] ^ 1;

  [(FKAApplicationDelegate *)self setGesturesModeEnabled:v4];
}

- (void)togglePassthroughModeForActionManager:(id)a3
{
  uint64_t v4 = [(FKAApplicationDelegate *)self isPassthroughModeEnabled] ^ 1;

  [(FKAApplicationDelegate *)self setPassthroughModeEnabled:v4];
}

- (void)actionManager:(id)a3 displaySysdiagnoseStatus:(id)a4
{
}

- (void)showHelpForActionManager:(id)a3
{
  id v8 = (id)objc_opt_new();
  uint64_t v4 = [(FKAApplicationDelegate *)self actionManager];
  unsigned int v5 = [v4 isInTextEditingMode];

  if (v5)
  {
    v6 = [(FKAApplicationDelegate *)self _keyChordForExitingTextMode];
    [v8 setTextEditingModeExitKeyChord:v6];
  }
  [v8 setModalPresentationStyle:5];
  [(FKAApplicationDelegate *)self setShouldIgnoreNextScreenChange:1];
  unsigned int v7 = [(FKAApplicationDelegate *)self rootViewController];
  [v7 presentViewController:v8 withTransition:6 completion:0];

  [(FKAApplicationDelegate *)self setCommandsViewController:v8];
}

- (void)showDebugDisplay:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FKAApplicationDelegate *)self eventManager];
  id v8 = [v5 commandMap];

  v6 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:v4];

  unsigned int v7 = [v8 keyChordForCommand:v6];
  [(FKAApplicationDelegate *)self showDebugDisplayWithKeyChord:v7];
}

- (void)showDebugDisplayWithKeyChord:(id)a3
{
  id v7 = a3;
  if (AXIsInternalInstall())
  {
    id v4 = +[AXSettings sharedInstance];
    unsigned int v5 = [v4 fullKeyboardAccessShouldShowDebugKeyCommandsView];

    if (v5)
    {
      v6 = [v7 fkaSpeakableDisplayValue];
      [(FKAApplicationDelegate *)self _showDebugBannerText:v6];
    }
  }
}

- (BOOL)dismissHelpForActionManager:(id)a3
{
  id v4 = [(FKAApplicationDelegate *)self commandsViewController];

  if (v4)
  {
    [(FKAApplicationDelegate *)self setShouldIgnoreNextScreenChange:1];
    unsigned int v5 = [(FKAApplicationDelegate *)self rootViewController];
    [v5 dismissViewControllerWithTransition:6 completion:0];

    [(FKAApplicationDelegate *)self setCommandsViewController:0];
  }
  return v4 != 0;
}

- (void)_wakeDeviceIfNeeded
{
  id v9 = +[NSDate date];
  uint64_t v3 = [(FKAApplicationDelegate *)self lastWakeDeviceDate];
  if (!v3
    || (id v4 = (void *)v3,
        [(FKAApplicationDelegate *)self lastWakeDeviceDate],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        [v9 timeIntervalSinceDate:v5],
        double v7 = v6,
        v5,
        v4,
        v7 > 0.3))
  {
    id v8 = +[AXSystemAppServer server];
    [v8 wakeUpDeviceIfNecessary];

    [(FKAApplicationDelegate *)self setLastWakeDeviceDate:v9];
  }
}

- (BOOL)actionManagerCanAvoidRepostingTextInput:(id)a3
{
  uint64_t v3 = [(FKAApplicationDelegate *)self typeaheadController];
  BOOL v4 = [v3 state] == 0;

  return v4;
}

- (void)didSuppressCommandForActionManager:(id)a3
{
  [(FKAApplicationDelegate *)self _wakeDeviceIfNeeded];

  [(FKAApplicationDelegate *)self _enableFocusRingIfNecessaryCheckingSystemSleepingState:0];
}

- (BOOL)canMoveApplicationFocusForActionManager:(id)a3
{
  uint64_t v3 = [(FKAApplicationDelegate *)self rootViewController];
  char v4 = [v3 isOverridingNativeFocus] ^ 1;

  return v4;
}

- (void)didToggleNotificationCenterForActionManager:(id)a3
{
  char v4 = FKALogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Notification center toggled. Hiding UI as needed.", v5, 2u);
  }

  [(FKAApplicationDelegate *)self _handleUpdatedElementsForScreenChange:1];
}

- (void)didExitTextEditingModeForActionManager:(id)a3
{
}

- (void)didMoveToInnerElementForActionManager:(id)a3
{
  if ([(FKAApplicationDelegate *)self isShowingTextEditingModeInstructions])
  {
    uint64_t v3 = FKALogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User no longer requires text editing mode instructions.", v5, 2u);
    }

    char v4 = +[AXSettings sharedInstance];
    [v4 setFullKeyboardAccessShouldShowTextEditingModeInstructions:0];
  }
}

- (void)typeaheadViewController:(id)a3 didChangeQueryString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FKAApplicationDelegate *)self typeaheadStartTimer];

  if (v8)
  {
    id v9 = [(FKAApplicationDelegate *)self typeaheadStartTimer];
    [v9 invalidate];

    [(FKAApplicationDelegate *)self setTypeaheadStartTimer:0];
  }
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010F44;
  v12[3] = &unk_1000249A8;
  objc_copyWeak(&v14, &location);
  id v10 = v7;
  id v13 = v10;
  unsigned int v11 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v12 block:0.15];
  [(FKAApplicationDelegate *)self setTypeaheadStartTimer:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)typeaheadViewControllerWillAppear:(id)a3
{
  [(FKAApplicationDelegate *)self _showTypeaheadNames];
  id v4 = [(FKAApplicationDelegate *)self rootViewController];
  [v4 updateRequiresNativeFocus];
}

- (void)typeaheadViewControllerWillDismiss:(id)a3
{
  [(FKAApplicationDelegate *)self _hideTypeaheadNames];
  id v4 = [(FKAApplicationDelegate *)self actionManager];
  [v4 focusOnSceneForTypeahead];

  id v5 = [(FKAApplicationDelegate *)self rootViewController];
  [v5 updateRequiresNativeFocus];
}

- (void)typeaheadViewControllerDidTypeReturn:(id)a3
{
  [(FKAApplicationDelegate *)self _hideTypeaheadSynchronously];
  id v4 = [(FKAApplicationDelegate *)self actionManager];
  [v4 performDefaultAction];
}

- (void)_showTypeaheadNames
{
  [(FKAApplicationDelegate *)self enumerateSceneDelegatesWithBlock:&stru_1000249E8];

  [(FKAApplicationDelegate *)self _updateTypeaheadNamesViewControllerItems];
}

- (void)_hideTypeaheadNames
{
}

- (void)_updateTypeaheadNamesViewControllerItems
{
  id v4 = [(FKAApplicationDelegate *)self typeaheadController];
  uint64_t v3 = [v4 queryString];
  [(FKAApplicationDelegate *)self _updateTypeaheadNamesViewControllerItemsForQueryString:v3];
}

- (void)_updateTypeaheadNamesViewControllerItemsForQueryString:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011364;
  v5[3] = &unk_100024A30;
  id v6 = a3;
  id v4 = v6;
  [(FKAApplicationDelegate *)self enumerateSceneDelegatesWithBlock:v5];
}

- (void)willDismissFloatingViewForPresenter:(id)a3
{
  id v4 = a3;
  id v5 = [(FKAApplicationDelegate *)self bannerPresenter];
  if (v5 == v4)
  {
    unsigned int v6 = [(FKAApplicationDelegate *)self isShowingTextEditingModeInstructions];

    if (v6)
    {
      id v7 = FKALogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Another banner caused text editing mode instructions to dismiss.", v8, 2u);
      }

      [(FKAApplicationDelegate *)self setIsShowingTextEditingModeInstructions:0];
    }
  }
  else
  {
  }
}

- (BOOL)eventManager:(id)a3 shouldRepostEvent:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(FKAApplicationDelegate *)self actionManager];
  id v7 = [v5 keyChord];
  unsigned int v8 = [v6 shouldRepostForKeyChord:v7];

  if ([(FKAApplicationDelegate *)self isGesturesModeEnabled])
  {
    if (v8)
    {
      id v9 = [v5 keyChord];
      if (([v9 isArrowKeyChord] & 1) == 0)
      {

        goto LABEL_9;
      }
      id v10 = [v5 keyChord];
      unsigned __int8 v11 = [v10 containsModifier];

      if (v11)
      {
LABEL_9:
        v16 = [v5 keyChord];
        if ([v16 isTextInputTabChord])
        {
          v17 = +[AXSettings sharedInstance];
          if (([v17 fullKeyboardAccessShouldShowTextEditingModeInstructions] & 1) == 0)
          {
LABEL_17:

            goto LABEL_18;
          }
          unsigned int v18 = [(FKAApplicationDelegate *)self _canEnableFocusRingCheckingSystemSleepingState:1];

          if (!v18
            || [(FKAApplicationDelegate *)self isShowingTextEditingModeInstructions])
          {
LABEL_19:
            v23 = [v5 keyChord];
            if ([v23 isArrowKeyChord])
            {
              v24 = [v5 keyChord];
              unsigned __int8 v25 = [v24 containsModifier];

              if (v25)
              {
LABEL_23:
                BOOL v15 = 1;
                goto LABEL_24;
              }
              v23 = [v5 keyChord];
              [(FKAApplicationDelegate *)self showDebugDisplayWithKeyChord:v23];
            }

            goto LABEL_23;
          }
          v16 = [(FKAApplicationDelegate *)self _keyChordForExitingTextMode];
          if (v16)
          {
            v19 = FKALogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Showing instructions for text editing mode.", buf, 2u);
            }

            v17 = [v16 fkaSpeakableDisplayValue];
            v20 = +[NSBundle mainBundle];
            v21 = [v20 localizedStringForKey:@"TEXT_EDITING_MODE_INSTRUCTIONS_MESSAGE" value:&stru_100024CA0 table:0];
            v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v17);

            [(FKAApplicationDelegate *)self _showBannerWithText:v22 secondaryText:0 isSticky:1 fromUserAction:0];
            [(FKAApplicationDelegate *)self setIsShowingTextEditingModeInstructions:1];
            [(FKAApplicationDelegate *)self _enableFocusRingWithTimeout];

            goto LABEL_17;
          }
        }
LABEL_18:

        goto LABEL_19;
      }
    }
  }
  else if (v8)
  {
    goto LABEL_9;
  }
  unsigned int v12 = [v5 unicodeCharacter];
  id v13 = [v5 unicodeCharacter];
  id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 modifierMask]);
  AXUIAutomationHandleKeyComplete();

  BOOL v15 = 0;
LABEL_24:

  return v15;
}

- (void)eventManager:(id)a3 repostEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(FKAApplicationDelegate *)self eventTap];
  [v6 repostDownAndUpForKeyboardEvent:v5];
}

- (void)_didUpdateHardwareKeyboardAttachedStatus
{
  uint64_t v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Hardware availability changed.", v4, 2u);
  }

  [(FKAApplicationDelegate *)self _enableFocusRingIfNecessary];
}

- (UIWindow)nonInteractiveWindow
{
  if (+[FKAApplication usesScenes])
  {
    uint64_t v3 = [(FKAApplicationDelegate *)self _sceneDelegateForFocusedElement];
    id v4 = [v3 nonInteractiveWindow];
  }
  else
  {
    id v4 = self->_nonInteractiveWindow;
  }

  return v4;
}

- (id)_fkaDelegateScenes
{
  id v13 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = +[UIApplication sharedApplication];
  id v4 = [v3 connectedScenes];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (double i = 0; i != v6; double i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v9 delegate];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned __int8 v11 = [(FKAApplicationDelegate *)self _sceneVendedByOneness:v9];

            if ((v11 & 1) == 0) {
              [v13 addObject:v9];
            }
          }
          else
          {
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v13;
}

- (id)_sceneDelegateForFocusedElement
{
  uint64_t v3 = [(FKAApplicationDelegate *)self _fkaDelegateScenes];
  if ([v3 count] == (id)1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id v5 = (id)[(FKAApplicationDelegate *)self nativeFocusElementDisplayID];
    if (v5 == -1)
    {
      id v6 = [(FKAApplicationDelegate *)self actionManager];
      uint64_t v7 = [v6 currentElement];
      id v5 = [v7 windowDisplayId];
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v3;
    id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      id v27 = v3;
      uint64_t v10 = *(void *)v31;
      UISceneSessionRole v11 = UIWindowSceneSessionRoleApplication;
      while (2)
      {
        unsigned int v12 = 0;
        id v28 = v9;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v12);
          long long v14 = [v13 session];
          long long v15 = [v14 role];
          if ([v15 isEqualToString:v11])
          {
            [v13 screen];
            long long v16 = v11;
            uint64_t v17 = v10;
            v19 = id v18 = v5;
            v20 = +[UIScreen mainScreen];
            unsigned __int8 v21 = [v19 isEqual:v20];

            id v5 = v18;
            uint64_t v10 = v17;
            UISceneSessionRole v11 = v16;
            id v9 = v28;

            if (v21) {
              goto LABEL_18;
            }
          }
          else
          {
          }
          v22 = [v13 screen];
          v23 = [v22 displayIdentity];
          unsigned int v24 = [v23 displayID];

          if (v24 == v5)
          {
LABEL_18:
            id v4 = v13;
            goto LABEL_19;
          }
          unsigned int v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      id v4 = 0;
LABEL_19:
      uint64_t v3 = v27;
    }
    else
    {
      id v4 = 0;
    }
  }
  unsigned __int8 v25 = [v4 delegate];

  return v25;
}

- (id)_sceneDelegates
{
  uint64_t v3 = +[UIApplication sharedApplication];
  id v4 = [v3 connectedScenes];
  id v5 = [v4 allObjects];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011DF0;
  v8[3] = &unk_100024A58;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "ax_flatMappedArrayUsingBlock:", v8);

  return v6;
}

- (void)enumerateSceneDelegatesWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FKAApplicationDelegate *)self _sceneDelegates];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011F60;
  v7[3] = &unk_100024A80;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (BOOL)_sceneVendedByOneness:(id)a3
{
  uint64_t v3 = [a3 screen];
  id v4 = [v3 displayIdentity];
  BOOL v5 = [v4 type] == (id)8;

  return v5;
}

- (FKARootViewController)rootViewController
{
  if (+[FKAApplication usesScenes])
  {
    uint64_t v3 = [(FKAApplicationDelegate *)self _sceneDelegateForFocusedElement];
    id v4 = [v3 interactiveWindow];
    BOOL v5 = [v4 rootViewController];
  }
  else
  {
    uint64_t v3 = [(FKAApplicationDelegate *)self window];
    BOOL v5 = [v3 rootViewController];
  }

  return (FKARootViewController *)v5;
}

- (FKARootViewController)nonInteractiveRootViewController
{
  v2 = [(FKAApplicationDelegate *)self nonInteractiveWindow];
  uint64_t v3 = [v2 rootViewController];

  return (FKARootViewController *)v3;
}

- (void)_showBannerWithText:(id)a3
{
}

- (void)_showBannerWithText:(id)a3 secondaryText:(id)a4 isSticky:(BOOL)a5 fromUserAction:(BOOL)a6
{
}

- (void)_showBannerWithCustomView:(id)a3 isSticky:(BOOL)a4
{
}

- (void)_showBannerWithText:(id)a3 andSecondaryText:(id)a4 orCustomView:(id)a5 isSticky:(BOOL)a6 fromUserAction:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v14 = v13;
  if (v8) {
    double v15 = 0.0;
  }
  else {
    double v15 = 2.0;
  }
  if (v13)
  {
    long long v16 = [(FKAApplicationDelegate *)self bannerPresenter];
    [v16 presentCustomView:v14 duration:v15];
  }
  else
  {
    UIAccessibilityNotifications v17 = UIAccessibilityAnnouncementNotification;
    id v18 = __UIAXStringForVariables();
    UIAccessibilityPostNotification(v17, v18);

    long long v16 = [(FKAApplicationDelegate *)self bannerPresenter];
    [v16 presentBannerViewWithText:v19 secondaryText:v12 duration:v7 fromUserAction:v15];
  }
}

- (void)_showDebugBannerText:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FKAApplicationDelegate *)self debugBannerPresenter];

  if (!v5)
  {
    id v6 = objc_alloc((Class)AXUIBannerPresenter);
    BOOL v7 = [(FKAApplicationDelegate *)self nonInteractiveWindow];
    id v8 = [v6 initWithContainingView:v7];
    [(FKAApplicationDelegate *)self setDebugBannerPresenter:v8];
  }
  id v9 = [(FKAApplicationDelegate *)self debugBannerPresenter];
  [v9 presentBannerViewWithText:v4 secondaryText:0 duration:1 fromUserAction:2.0];
}

- (BOOL)_canPerform3DTouchCommand
{
  return _AXForceTouchAvailableAndEnabled(self, a2);
}

- (void)_addTransientCommandsForGesturesMode
{
  v37 = +[AXSSKeyChord keyChordWithKeys:&off_100025640];
  v38[0] = v37;
  v36 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierPressAndLift];
  v39[0] = v36;
  v35 = +[AXSSKeyChord keyChordWithKeys:&off_100025658];
  v38[1] = v35;
  v34 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierTwoFingerPressAndLift];
  v39[1] = v34;
  long long v33 = +[AXSSKeyChord keyChordWithKeys:&off_100025670];
  v38[2] = v33;
  long long v31 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierSwipeLeft];
  v39[2] = v31;
  long long v30 = +[AXSSKeyChord keyChordWithKeys:&off_100025688];
  v38[3] = v30;
  id v29 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierSwipeRight];
  v39[3] = v29;
  id v28 = +[AXSSKeyChord keyChordWithKeys:&off_1000256A0];
  v38[4] = v28;
  id v27 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierSwipeUp];
  v39[4] = v27;
  v26 = +[AXSSKeyChord keyChordWithKeys:&off_1000256B8];
  v38[5] = v26;
  unsigned __int8 v25 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierSwipeDown];
  v39[5] = v25;
  unsigned int v24 = +[AXSSKeyChord keyChordWithKeys:&off_1000256D0];
  v38[6] = v24;
  v23 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierTwoFingerSwipeLeft];
  v39[6] = v23;
  v22 = +[AXSSKeyChord keyChordWithKeys:&off_1000256E8];
  v38[7] = v22;
  unsigned __int8 v21 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierTwoFingerSwipeRight];
  v39[7] = v21;
  v20 = +[AXSSKeyChord keyChordWithKeys:&off_100025700];
  v38[8] = v20;
  id v19 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierTwoFingerSwipeUp];
  v39[8] = v19;
  id v18 = +[AXSSKeyChord keyChordWithKeys:&off_100025718];
  v38[9] = v18;
  v2 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierTwoFingerSwipeDown];
  v39[9] = v2;
  uint64_t v3 = +[AXSSKeyChord keyChordWithKeys:&off_100025730];
  v38[10] = v3;
  id v4 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierRotateLeft];
  v39[10] = v4;
  BOOL v5 = +[AXSSKeyChord keyChordWithKeys:&off_100025748];
  v38[11] = v5;
  id v6 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierRotateRight];
  v39[11] = v6;
  BOOL v7 = +[AXSSKeyChord keyChordWithKeys:&off_100025760];
  v38[12] = v7;
  id v8 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierPinchOut];
  v39[12] = v8;
  id v9 = +[AXSSKeyChord keyChordWithKeys:&off_100025778];
  v38[13] = v9;
  uint64_t v10 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierPinchIn];
  v39[13] = v10;
  UISceneSessionRole v11 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:14];

  if ([(FKAApplicationDelegate *)self _canPerform3DTouchCommand])
  {
    id v12 = [v11 mutableCopy];
    id v13 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifier3DTouch];
    long long v14 = +[AXSSKeyChord keyChordWithKeys:&off_100025790];
    [v12 setObject:v13 forKeyedSubscript:v14];

    UISceneSessionRole v11 = v12;
  }
  double v15 = [(FKAApplicationDelegate *)self eventManager];
  long long v16 = [v15 commandMap];
  UIAccessibilityNotifications v17 = [v16 addCommandsForTransientKeyChords:v11];
  [(FKAApplicationDelegate *)self setGesturesModeKeyChordsIdentifier:v17];
}

- (void)setGesturesModeEnabled:(BOOL)a3
{
  if (self->_gesturesModeEnabled != a3)
  {
    self->_gesturesModeEnabled = a3;
    if (a3)
    {
      v46 = +[NSBundle mainBundle];
      v44 = [v46 localizedStringForKey:@"GESTURES_TAP" value:&stru_100024CA0 table:0];
      v45 = +[NSBundle mainBundle];
      v43 = [v45 localizedStringForKey:@"GESTURES_TAP_COMMAND" value:&stru_100024CA0 table:0];
      v42 = +[FKACommandListItem itemWithName:v44 keyDescription:v43];
      v48[0] = v42;
      v41 = +[NSBundle mainBundle];
      v39 = [v41 localizedStringForKey:@"GESTURES_SWIPE" value:&stru_100024CA0 table:0];
      v40 = +[NSBundle mainBundle];
      v38 = [v40 localizedStringForKey:@"GESTURES_SWIPE_COMMAND" value:&stru_100024CA0 table:0];
      v37 = +[FKACommandListItem itemWithName:v39 keyDescription:v38];
      v48[1] = v37;
      v36 = +[NSBundle mainBundle];
      id v4 = [v36 localizedStringForKey:@"GESTURES_ZOOM" value:&stru_100024CA0 table:0];
      BOOL v5 = +[NSBundle mainBundle];
      id v6 = [v5 localizedStringForKey:@"GESTURES_ZOOM_COMMAND" value:&stru_100024CA0 table:0];
      BOOL v7 = +[FKACommandListItem itemWithName:v4 keyDescription:v6];
      v48[2] = v7;
      id v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"GESTURES_ROTATE" value:&stru_100024CA0 table:0];
      uint64_t v10 = +[NSBundle mainBundle];
      UISceneSessionRole v11 = [v10 localizedStringForKey:@"GESTURES_ROTATE_COMMAND" value:&stru_100024CA0 table:0];
      id v12 = +[FKACommandListItem itemWithName:v9 keyDescription:v11];
      v48[3] = v12;
      v35 = +[NSArray arrayWithObjects:v48 count:4];

      if ([(FKAApplicationDelegate *)self _canPerform3DTouchCommand])
      {
        id v13 = +[NSBundle mainBundle];
        long long v14 = [v13 localizedStringForKey:@"GESTURES_3DTOUCH" value:&stru_100024CA0 table:0];
        double v15 = +[NSBundle mainBundle];
        long long v16 = [v15 localizedStringForKey:@"GESTURES_3DTOUCH_COMMAND" value:&stru_100024CA0 table:0];
        UIAccessibilityNotifications v17 = +[FKACommandListItem itemWithName:v14 keyDescription:v16];
        uint64_t v18 = [v35 arrayByAddingObject:v17];

        id v19 = (void *)v18;
      }
      else
      {
        id v19 = v35;
      }
      v26 = +[NSBundle mainBundle];
      id v27 = [v26 localizedStringForKey:@"GESTURES_HEADER" value:&stru_100024CA0 table:0];
      id v28 = +[NSBundle mainBundle];
      id v29 = [v28 localizedStringForKey:@"GESTURES_TWO_FINGERS" value:&stru_100024CA0 table:0];
      long long v30 = +[FKACommandList listWithTitle:v27 items:v19 footerText:v29];

      long long v31 = [FKACommandsView alloc];
      v47 = v30;
      long long v32 = +[NSArray arrayWithObjects:&v47 count:1];
      long long v33 = [(FKACommandsView *)v31 initWithCommandLists:v32];

      [(FKAApplicationDelegate *)self _announceCommandList:v30];
      [(FKAApplicationDelegate *)self _showBannerWithCustomView:v33 isSticky:1];

      [(FKAApplicationDelegate *)self _addTransientCommandsForGesturesMode];
    }
    else
    {
      v20 = +[NSBundle mainBundle];
      unsigned __int8 v21 = [v20 localizedStringForKey:@"GESTURES_DISABLED" value:&stru_100024CA0 table:0];
      [(FKAApplicationDelegate *)self _showBannerWithText:v21];

      v22 = [(FKAApplicationDelegate *)self gesturesModeKeyChordsIdentifier];

      if (v22)
      {
        v23 = [(FKAApplicationDelegate *)self eventManager];
        unsigned int v24 = [v23 commandMap];
        unsigned __int8 v25 = [(FKAApplicationDelegate *)self gesturesModeKeyChordsIdentifier];
        [v24 removeTransientKeyChordsForIdentifier:v25];

        [(FKAApplicationDelegate *)self setGesturesModeKeyChordsIdentifier:0];
      }
      else
      {
        v34 = FKALogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          sub_100014964(v34);
        }
      }
    }
  }
}

- (void)setPassthroughModeEnabled:(BOOL)a3
{
  if (self->_passthroughModeEnabled != a3)
  {
    BOOL v3 = a3;
    self->_passthroughModeEnabled = a3;
    BOOL v5 = FKALogCommon();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Enabled passthrough mode", buf, 2u);
      }

      BOOL v7 = [(FKAApplicationDelegate *)self eventManager];
      [v7 setPassthroughModeEnabled:1];

      _AXSFullKeyboardAccessSetPassthroughModeEnabled();
      _AXSFullKeyboardAccessSetFocusRingEnabled();
      id v8 = [(FKAApplicationDelegate *)self eventManager];
      id v9 = [v8 commandMap];

      uint64_t v10 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierTogglePassthroughMode];
      UISceneSessionRole v11 = [v9 keyChordForCommand:v10];
      id v12 = [v11 fkaSpeakableDisplayValue];
      id v13 = +[NSBundle mainBundle];
      long long v14 = [v13 localizedStringForKey:@"PASSTHROUGH_MODE" value:&stru_100024CA0 table:0];
      double v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12);
      [(FKAApplicationDelegate *)self _showBannerWithText:v15];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)UIAccessibilityNotifications v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Disabled passthrough mode", v17, 2u);
      }

      long long v16 = [(FKAApplicationDelegate *)self eventManager];
      [v16 setPassthroughModeEnabled:0];

      _AXSFullKeyboardAccessSetPassthroughModeEnabled();
      [(FKAApplicationDelegate *)self _enableFocusRingWithTimeout];
      id v9 = +[NSBundle mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"PASSTHROUGH_MODE_DISABLED" value:&stru_100024CA0 table:0];
      [(FKAApplicationDelegate *)self _showBannerWithText:v10];
    }
  }
}

- (void)_showActionsForElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  BOOL v6 = [(FKAApplicationDelegate *)self elementActionManager];
  BOOL v7 = [v6 actionsForElement:v4];

  id v8 = +[FKAActionsController alertControllerWithTitle:0 message:0 preferredStyle:0];
  [v8 setElement:v4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (double i = 0; i != v10; double i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v14 = [v13 name];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000133B8;
        v23[3] = &unk_100024AA8;
        v23[4] = v5;
        v23[5] = v13;
        double v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v23];

        [v8 addAction:v15];
      }
      id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  long long v16 = +[NSBundle mainBundle];
  UIAccessibilityNotifications v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_100024CA0 table:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000134AC;
  v22[3] = &unk_100024AD0;
  v22[4] = v5;
  uint64_t v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:v22];
  [v8 addAction:v18];

  [(FKAApplicationDelegate *)v5 setShouldIgnoreNextScreenChange:1];
  LODWORD(v18) = AXDeviceIsPad();
  id v19 = [(FKAApplicationDelegate *)v5 rootViewController];
  v20 = v19;
  if (v18)
  {
    [v4 frame];
    objc_msgSend(v20, "presentViewController:inPopoverFromRect:", v8);
  }
  else
  {
    [v19 presentViewController:v8 animated:1 completion:0];
  }
}

- (BOOL)_areActionsValidForElement:(id)a3
{
  BOOL v3 = [a3 uiElement];
  [v3 updateCache:2204];
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2204];

  return v4;
}

- (BOOL)_dismissActionsControllerByForce:(BOOL)a3
{
  BOOL v5 = [(FKAApplicationDelegate *)self rootViewController];
  BOOL v6 = [v5 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  id v8 = [(FKAApplicationDelegate *)self rootViewController];
  id v9 = [v8 presentedViewController];

  if (a3
    || ([v9 element],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [(FKAApplicationDelegate *)self _areActionsValidForElement:v10],
        v10,
        (v11 & 1) == 0))
  {
    BOOL v12 = 1;
    [(FKAApplicationDelegate *)self setShouldIgnoreNextScreenChange:1];
    id v13 = [(FKAApplicationDelegate *)self rootViewController];
    [v13 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_handleUpdatedElementsForScreenChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(FKAApplicationDelegate *)self _hideTypeaheadSynchronously];
    BOOL v5 = [(FKAApplicationDelegate *)self actionManager];
    [v5 didObserveScreenChange];
  }
  else
  {
    [(FKAApplicationDelegate *)self _updateTypeaheadNamesViewControllerItems];
  }

  [(FKAApplicationDelegate *)self _dismissActionsControllerByForce:v3];
}

- (void)_handleScreenChange
{
  if ([(FKAApplicationDelegate *)self shouldIgnoreNextScreenChange])
  {
    [(FKAApplicationDelegate *)self setShouldIgnoreNextScreenChange:0];
  }
  else
  {
    [(FKAApplicationDelegate *)self _handleUpdatedElementsForScreenChange:1];
  }
}

- (void)_handleNativeFocusItemChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 objectForKey:@"element"];
      if (v5)
      {
        id v6 = v5;
        BOOL v7 = [(FKAApplicationDelegate *)self _fkaDelegateScenes];
        if ((unint64_t)[v7 count] >= 2)
        {
          id v8 = +[AXElement elementWithAXUIElement:v6];
          -[FKAApplicationDelegate setNativeFocusElementDisplayID:](self, "setNativeFocusElementDisplayID:", [v8 windowDisplayId]);
          id v9 = FKALogCommon();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            id v10 = +[NSNumber numberWithInt:[(FKAApplicationDelegate *)self nativeFocusElementDisplayID]];
            int v11 = 138412290;
            BOOL v12 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Caching display id for native element: %@", (uint8_t *)&v11, 0xCu);
          }
        }
      }
    }
  }
}

- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5
{
  id v8 = a3;
  if (a4 > 1017)
  {
    if (a4 <= 1052)
    {
      if (a4 != 1018)
      {
        if (a4 == 1039)
        {
          id v9 = +[AXSettings sharedInstance];
          unsigned __int8 v10 = [v9 fullKeyboardAccessFocusRingTimeoutEnabled];

          if (v10) {
            goto LABEL_22;
          }
LABEL_15:
          [(FKAApplicationDelegate *)self _enableFocusRingIfNecessary];
          goto LABEL_22;
        }
        goto LABEL_19;
      }
LABEL_16:
      [(FKAApplicationDelegate *)self _handleUpdatedElementsForScreenChange:0];
      goto LABEL_22;
    }
    if (a4 == 1053)
    {
      [(FKAApplicationDelegate *)self _handleNativeFocusItemChange:a5];
      goto LABEL_22;
    }
    if (a4 == 1067) {
      goto LABEL_15;
    }
LABEL_19:
    BOOL v12 = FKALogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_1000149A8((uint64_t)a5, a4, v12);
    }

    goto LABEL_22;
  }
  if (a4 == 1000)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_handleScreenChange" object:0];
    [(FKAApplicationDelegate *)self performSelector:"_handleScreenChange" withObject:0 afterDelay:0.3];
    goto LABEL_22;
  }
  if (a4 == 1001) {
    goto LABEL_16;
  }
  if (a4 != 1004) {
    goto LABEL_19;
  }
  [(FKAApplicationDelegate *)self _handleUpdatedElementsForScreenChange:1];
  int v11 = FKALogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Disabling focus ring on screen lock.", v13, 2u);
  }

  [(FKAApplicationDelegate *)self _disableFocusRing];
LABEL_22:
}

- (void)_enableFocusRingIfNecessaryCheckingSystemSleepingState:(BOOL)a3
{
  if ([(FKAApplicationDelegate *)self _canEnableFocusRingCheckingSystemSleepingState:a3])
  {
    [(FKAApplicationDelegate *)self _enableFocusRingWithTimeout];
  }
  else
  {
    [(FKAApplicationDelegate *)self _disableFocusRing];
  }
}

- (void)_enableFocusRingIfNecessary
{
}

- (void)_enableFocusRingWithTimeout
{
  if (!_AXSFullKeyboardAccessFocusRingEnabled())
  {
    _AXSFullKeyboardAccessSetFocusRingEnabled();
    BOOL v3 = [(FKAApplicationDelegate *)self eventManager];
    [v3 setShouldSuppressCommands:0];
  }

  [(FKAApplicationDelegate *)self _resetFocusRingTimeout];
}

- (void)_disableFocusRing
{
  [(FKAApplicationDelegate *)self _cancelFocusRingTimeout];
  _AXSFullKeyboardAccessSetFocusRingEnabled();
  id v3 = [(FKAApplicationDelegate *)self eventManager];
  [v3 setShouldSuppressCommands:1];
}

- (void)_disableFocusRingForTimeout
{
  id v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Disabling focus ring for timeout.", v4, 2u);
  }

  [(FKAApplicationDelegate *)self _disableFocusRing];
}

- (void)_resetFocusRingTimeout
{
  [(FKAApplicationDelegate *)self _cancelFocusRingTimeout];
  id v3 = +[AXSettings sharedInstance];
  if ([v3 fullKeyboardAccessFocusRingTimeoutEnabled]
    && ![(FKAApplicationDelegate *)self isShowingTextEditingModeInstructions])
  {
    [v3 fullKeyboardAccessFocusRingTimeout];
    -[FKAApplicationDelegate performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_disableFocusRingForTimeout", 0);
  }
}

- (void)_cancelFocusRingTimeout
{
}

- (BOOL)_canEnableFocusRingCheckingSystemSleepingState:(BOOL)a3
{
  BOOL v3 = a3;
  if (!GSEventIsHardwareKeyboardAttached()
    && !_AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation())
  {
    id v6 = FKALogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)UIAccessibilityNotifications v17 = 0;
      id v8 = "Cannot enable focus ring: hardware keyboard not attached, and not using simulated keyboard.";
      id v9 = v17;
      goto LABEL_14;
    }
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  if (v3)
  {
    id v4 = +[AXSystemAppServer server];
    unsigned __int8 v5 = [v4 isSystemSleeping];

    id v6 = FKALogCommon();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        __int16 v15 = 0;
        id v8 = "Cannot enable focus ring: system sleeping.";
        id v9 = (uint8_t *)&v15;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, v9, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (!v7)
    {
      BOOL v10 = 1;
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    int v11 = "Can enable focus ring.";
    BOOL v10 = 1;
    BOOL v12 = buf;
    goto LABEL_11;
  }
  id v6 = FKALogCommon();
  BOOL v10 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = 0;
    int v11 = "Can enable focus ring. Ignored system sleeping state.";
    BOOL v12 = (uint8_t *)&v14;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v11, v12, 2u);
  }
LABEL_17:

  return v10;
}

- (void)_didUpdateAvailableCommandsWithUpdatedMap:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = FKALogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Did update available commands.", v7, 2u);
  }

  id v6 = [(FKAApplicationDelegate *)self eventManager];
  [v6 setCommandMap:v4];

  if ([(FKAApplicationDelegate *)self isGesturesModeEnabled]) {
    [(FKAApplicationDelegate *)self _addTransientCommandsForGesturesMode];
  }
}

- (void)_didUpdateFocusRingTimeout
{
  BOOL v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Did update focus ring timeout.", v4, 2u);
  }

  [(FKAApplicationDelegate *)self _enableFocusRingIfNecessary];
  [(FKAApplicationDelegate *)self _resetFocusRingTimeout];
}

- (id)_keyChordForExitingTextMode
{
  v2 = [(FKAApplicationDelegate *)self eventManager];
  BOOL v3 = [v2 commandMap];

  id v4 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:AXSSKeyboardCommandIdentifierMoveInsideNext];
  unsigned __int8 v5 = [v3 keyChordForCommand:v4];
  id v6 = v5;
  if (v5 && ([v5 isTextInputTabChord] & 1) == 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)_dismissTextEditingModeInstructionsIfNeeded
{
  if ([(FKAApplicationDelegate *)self isShowingTextEditingModeInstructions])
  {
    BOOL v3 = FKALogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing text editing mode instructions.", v5, 2u);
    }

    [(FKAApplicationDelegate *)self setIsShowingTextEditingModeInstructions:0];
    id v4 = [(FKAApplicationDelegate *)self bannerPresenter];
    [v4 dismissFloatingView];
  }
}

- (void)_announceCommandList:(id)a3
{
  id v3 = a3;
  if (_AXFeatureSupportsNonSightedUsage())
  {
    id v4 = [v3 title];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unsigned __int8 v5 = [v3 items];
    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        id v9 = 0;
        BOOL v10 = v4;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          int v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v9);
          BOOL v12 = objc_msgSend(v11, "name", v14, v16, v17);
          long long v16 = [v11 keyDescription];
          CFStringRef v17 = @"__AXStringForVariablesSentinel";
          __int16 v14 = v12;
          id v4 = __UIAXStringForVariables();

          id v9 = (char *)v9 + 1;
          BOOL v10 = v4;
        }
        while (v7 != v9);
        id v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v12, v16, @"__AXStringForVariablesSentinel");
      }
      while (v7);
    }

    __int16 v15 = [v3 footerText];
    id v13 = __UIAXStringForVariables();

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v13);
  }
}

- (void)willAquireNativeFocus
{
  id v3 = [(FKAApplicationDelegate *)self actionManager];
  v2 = [v3 currentElement];
  [v2 performAction:5501 withValue:0];
}

- (void)didReleaseNativeFocus
{
  id v3 = [(FKAApplicationDelegate *)self actionManager];
  v2 = [v3 currentElement];
  [v2 performAction:5500 withValue:0];
}

- (FKAEventTap)eventTap
{
  return self->_eventTap;
}

- (void)setEventTap:(id)a3
{
}

- (AXSSEventManager)eventManager
{
  return self->_eventManager;
}

- (FKATypeaheadViewController)typeaheadController
{
  return self->_typeaheadController;
}

- (void)setTypeaheadController:(id)a3
{
}

- (FKACommandsViewController)commandsViewController
{
  return self->_commandsViewController;
}

- (void)setCommandsViewController:(id)a3
{
}

- (AXUIBannerPresenter)debugBannerPresenter
{
  return self->_debugBannerPresenter;
}

- (void)setDebugBannerPresenter:(id)a3
{
}

- (BOOL)isGesturesModeEnabled
{
  return self->_gesturesModeEnabled;
}

- (BOOL)isPassthroughModeEnabled
{
  return self->_passthroughModeEnabled;
}

- (NSString)gesturesModeKeyChordsIdentifier
{
  return self->_gesturesModeKeyChordsIdentifier;
}

- (void)setGesturesModeKeyChordsIdentifier:(id)a3
{
}

- (AXNotificationObserver)axNotificationObserver
{
  return self->_axNotificationObserver;
}

- (void)setAxNotificationObserver:(id)a3
{
}

- (id)availableCommandsUpdateToken
{
  return self->_availableCommandsUpdateToken;
}

- (void)setAvailableCommandsUpdateToken:(id)a3
{
}

- (NSDate)lastWakeDeviceDate
{
  return self->_lastWakeDeviceDate;
}

- (void)setLastWakeDeviceDate:(id)a3
{
}

- (BOOL)shouldIgnoreNextScreenChange
{
  return self->_shouldIgnoreNextScreenChange;
}

- (BOOL)isShowingTextEditingModeInstructions
{
  return self->_isShowingTextEditingModeInstructions;
}

- (void)setIsShowingTextEditingModeInstructions:(BOOL)a3
{
  self->_isShowingTextEditingModeInstructions = a3;
}

- (int)nativeFocusElementDisplayID
{
  return self->_nativeFocusElementDisplayID;
}

- (void)setNativeFocusElementDisplayID:(int)a3
{
  self->_nativeFocusElementDisplayID = a3;
}

- (NSTimer)typeaheadStartTimer
{
  return self->_typeaheadStartTimer;
}

- (void)setTypeaheadStartTimer:(id)a3
{
}

- (NSTimer)debugDisplayTimer
{
  return self->_debugDisplayTimer;
}

- (void)setDebugDisplayTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugDisplayTimer, 0);
  objc_storeStrong((id *)&self->_typeaheadStartTimer, 0);
  objc_storeStrong((id *)&self->_lastWakeDeviceDate, 0);
  objc_storeStrong(&self->_availableCommandsUpdateToken, 0);
  objc_storeStrong((id *)&self->_axNotificationObserver, 0);
  objc_storeStrong((id *)&self->_gesturesModeKeyChordsIdentifier, 0);
  objc_storeStrong((id *)&self->_debugBannerPresenter, 0);
  objc_storeStrong((id *)&self->_commandsViewController, 0);
  objc_storeStrong((id *)&self->_typeaheadController, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_eventTap, 0);
  objc_storeStrong((id *)&self->_nonInteractiveWindow, 0);

  objc_storeStrong((id *)&self->_elementActionManager, 0);
}

@end
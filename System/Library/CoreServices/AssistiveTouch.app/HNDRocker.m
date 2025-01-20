@interface HNDRocker
+ (CGSize)initialRockerSize;
+ (CGSize)nubbitSize;
- ($01BB1521EC52D44A8E7628F5261DCEC8)rockerButtonGuttersForRockerButton:(id)a3;
- (AXAssertion)disableDashBoardGesturesAssertion;
- (BOOL)_angleIndicatesReturnToCenter:(double)a3;
- (BOOL)_backButtonShouldBeHidden;
- (BOOL)_includeRingerButtonInHardware;
- (BOOL)_replaceRingerWithOrientationLock;
- (BOOL)_shouldShowSideAppMenu;
- (BOOL)accessibilityPerformEscape;
- (BOOL)activateMenuItemDown:(id)a3 fromButtonPress:(BOOL)a4;
- (BOOL)activateMenuItemUp:(id)a3 fromButtonPress:(BOOL)a4;
- (BOOL)customizationMapAllowInstanceActivation:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isAnimatingNubbit;
- (BOOL)isFullMenuVisible;
- (BOOL)shouldForciblyHideBackButtonForAnimation;
- (BOOL)shouldIgnoreNextHome;
- (BSInvalidatable)hitTestCategoryAssertion;
- (CGPoint)_initialPointForGesture;
- (CGPoint)onScreenLocation;
- (CGRect)onScreenFrameForRockerButton:(id)a3;
- (HNDDisplayManager)displayManager;
- (HNDRocker)initWithFrame:(CGRect)a3;
- (HNDRockerButton)appSwitcherButton;
- (HNDRockerButton)applePayButton;
- (HNDRockerButton)confirmApplePayButton;
- (HNDRockerButton)gesturesButton;
- (HNDRockerButton)moreButton;
- (HNDRockerButton)reachabilityButton;
- (HNDRockerButton)sideAppButton;
- (HNDRockerButton)speakScreenButton;
- (HNDRockerButton)toggleDockButton;
- (HNDRockerButton)tripleClickHomeButton;
- (NSArray)backButtonConstraints;
- (NSArray)dockSpecificButtons;
- (NSArray)sideAppMoreRockerItems;
- (NSMutableArray)dwellItems;
- (NSMutableArray)hardwareItems;
- (NSMutableArray)initialItems;
- (NSMutableArray)moreItems;
- (NSMutableArray)rotateItems;
- (NSMutableArray)scrollItems;
- (NSMutableArray)siriShortcutsItems;
- (NSMutableArray)touchItems;
- (NSMutableDictionary)buttonsByMedusaGesture;
- (NSString)foregroundImageAction;
- (NSString)hardwareIdentifier;
- (NSString)lastMenuItemActivated;
- (NSString)shortcutsUpdateToken;
- (id)_dockSpecificMenuItems;
- (id)_filteredItems:(id)a3;
- (id)_rockerButtonForLocation:(id)a3 buttonType:(id)a4;
- (id)_rockerItemsByLocation;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)animationEndButtonForButtonTag:(int)a3;
- (id)currentlyVisibleRockerItems;
- (id)rockerHitTest:(CGPoint)a3;
- (int)style;
- (int64_t)_indexForAngle:(double)a3;
- (int64_t)state;
- (uint64_t)_usesCircularNubbit;
- (void)_actionButtonPressed;
- (void)_activateLockButton;
- (void)_addFavoriteBoxPressed;
- (void)_addNewButtonsToView;
- (void)_applePayButtonPressed:(id)a3;
- (void)_armApplePay;
- (void)_assignLocationsToRockerItems;
- (void)_autoHideForEyeTrackingToggled;
- (void)_backgroundSoundsPressed;
- (void)_bubbleModeToggled;
- (void)_calibrateEyeTrackingPressed;
- (void)_cameraButtonDoubleLightPressed;
- (void)_cameraButtonLightPressed;
- (void)_cameraButtonPressed;
- (void)_cameraPressed;
- (void)_centerBackButtonToView:(id)a3;
- (void)_commandAndControlPressed;
- (void)_confirmApplePay;
- (void)_continuousScrollPressed:(id)a3 fromButtonPress:(BOOL)a4 inDirection:(unint64_t)a5 iconType:(id)a6;
- (void)_controlCenterPressed;
- (void)_customGesturePressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_customsPressed:(id)a3;
- (void)_decreaseDwellTimePressed;
- (void)_detectionModePresssed;
- (void)_dimFlashingLightsPressed;
- (void)_disableUserInterfaceClient;
- (void)_dockPressed;
- (void)_doubleTapPressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_dragAndDropPressed:(id)a3 fromButtonPress:(BOOL)a4 dragMenu:(BOOL)a5;
- (void)_dwellPressed:(id)a3;
- (void)_enableDockIconActivationMode:(unint64_t)a3;
- (void)_frontFacingCameraPressed;
- (void)_gesturesPressed:(id)a3;
- (void)_goBackInMenuState:(int)a3;
- (void)_handleTouch:(int64_t)a3;
- (void)_hapticMusicPressed;
- (void)_hardwareButtonPressed:(id)a3;
- (void)_highlightRockerButtonAtAngle:(double)a3;
- (void)_homeButton:(BOOL)a3;
- (void)_increaseDwellTimePressed;
- (void)_initializeNubbit;
- (void)_layoutButtonsWithViewForCenteringAtStart:(id)a3 includingBackButton:(BOOL)a4;
- (void)_layoutForegroundImageView;
- (void)_layoutMenuItems:(BOOL)a3 oldRockers:(id)a4 viewForCenteringAtStart:(id)a5 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a6;
- (void)_layoutMenuItemsInReverse:(BOOL)a3 oldRockers:(id)a4 animateToIcon:(id)a5 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a6;
- (void)_liveCaptionsPressed;
- (void)_liveSpeechPressed;
- (void)_loadDwellMenuItems;
- (void)_loadFavoritesMenuItems;
- (void)_loadGesturesMenuItems;
- (void)_loadHardwareMenuItems;
- (void)_loadInitialMenuItems;
- (void)_loadMenuItems:(BOOL)a3 viewForCenteringAtStart:(id)a4 goBackwards:(BOOL)a5 originalState:(int64_t)a6;
- (void)_loadMenuItems:(BOOL)a3 viewForCenteringAtStart:(id)a4 goBackwards:(BOOL)a5 originalState:(int64_t)a6 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a7;
- (void)_loadMoreMenuItems;
- (void)_loadRotateMenuItems;
- (void)_loadScrollMenuItems;
- (void)_loadSecureIntentMenuItems;
- (void)_loadSideAppMenuItems;
- (void)_loadSideAppMoreMenuItems;
- (void)_loadSiriShortcutsMenuItems;
- (void)_lockButton:(BOOL)a3;
- (void)_lockDwellControlAction:(BOOL)a3;
- (void)_longPressPressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_menuExited;
- (void)_morePressed:(id)a3;
- (void)_motionCuesPressed;
- (void)_mutePressed;
- (void)_nearbyDeviceControlPressed;
- (void)_notificationCenterPressed;
- (void)_openVisualIntelligence;
- (void)_orbPressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_orientationPressed:(id)a3;
- (void)_pinchPressed:(id)a3 mode:(unint64_t)a4;
- (void)_preloadDwellMenuItems;
- (void)_preloadInitialMenuItems;
- (void)_pushMenuItemsFromSender:(id)a3;
- (void)_reachabilityPressed;
- (void)_rebootDevicePressed;
- (void)_resetForegroundImage;
- (void)_resetHoverCircleLocation;
- (void)_resetVisibility:(BOOL)a3;
- (void)_ringerPressed:(BOOL)a3;
- (void)_ringerSwitchPressed:(BOOL)a3;
- (void)_rotationLockPressed;
- (void)_screenshotPressed;
- (void)_scrollPressed:(id)a3;
- (void)_scrollPressed:(id)a3 fromButtonPress:(BOOL)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7;
- (void)_setBackgroundWithType:(int)a3;
- (void)_setRingerSwitchIcon:(id)a3;
- (void)_setRotationLockIcon:(id)a3;
- (void)_shakePressed;
- (void)_shortcutsDidUpdate;
- (void)_sideAppMorePressed:(id)a3;
- (void)_sideAppPressed:(id)a3;
- (void)_siriButtonPressed;
- (void)_siriPrefsChanged:(id)a3;
- (void)_siriShortcutsMenuPressed:(id)a3;
- (void)_sosPressed;
- (void)_speakScreenPressed;
- (void)_spotlightPressed:(id)a3;
- (void)_sysdiagnosePressed;
- (void)_tapPressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_toggleAppSwitcher;
- (void)_toggleAssistiveAccess;
- (void)_toggleDwellControlPause:(BOOL)a3;
- (void)_toggleHoverTextTyping;
- (void)_toggleNeedsToShowZoomWindow;
- (void)_trackpadPressed;
- (void)_tripleClickHomePressed;
- (void)_typeToSiriButtonPressed;
- (void)_updateBackButtonVisibility;
- (void)_updateKeyboardFocusIfNeeded;
- (void)_updateNubbitFadedProperties;
- (void)_updateProgress:(id)a3;
- (void)_updateRockerItemIfNeededForItem:(id)a3;
- (void)_updateSelectedButton;
- (void)_updateSelectedButton:(id)a3;
- (void)_updateVolumeDisplay;
- (void)_voiceControlPressed;
- (void)_volumeDown:(BOOL)a3;
- (void)_volumeUp:(BOOL)a3;
- (void)_watchRemoteScreenPressed;
- (void)dealloc;
- (void)didFailToFloatApp;
- (void)didFailToPinApp;
- (void)didMoveToWindow;
- (void)fadeNubbit;
- (void)forceReloadScrollMenuItems;
- (void)handleRealDownEvent:(CGPoint)a3;
- (void)handleRealMoveEvent:(CGPoint)a3 maxOrb:(double)a4 currentForce:(double)a5;
- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4;
- (void)highlightNubbit;
- (void)hoveredTo:(CGPoint)a3;
- (void)hoveredToRockerButton:(id)a3;
- (void)performPress:(int)a3 type:(int)a4 source:(int)a5;
- (void)reloadDwellMenu;
- (void)resetOrbAction;
- (void)setAppSwitcherButton:(id)a3;
- (void)setApplePayButton:(id)a3;
- (void)setBackButtonConstraints:(id)a3;
- (void)setButtonsByMedusaGesture:(id)a3;
- (void)setConfirmApplePayButton:(id)a3;
- (void)setDisableDashBoardGesturesAssertion:(id)a3;
- (void)setDisplayManager:(id)a3;
- (void)setDockSpecificButtons:(id)a3;
- (void)setDwellItems:(id)a3;
- (void)setForegroundImageAction:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFullMenuVisible:(BOOL)a3 atPoint:(CGPoint)a4;
- (void)setGesturesButton:(id)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setHardwareItems:(id)a3;
- (void)setHitTestCategoryAssertion:(id)a3;
- (void)setInitialItems:(id)a3;
- (void)setLastMenuItemActivated:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setMoreItems:(id)a3;
- (void)setNubbitVisible:(BOOL)a3;
- (void)setReachabilityButton:(id)a3;
- (void)setRotateItems:(id)a3;
- (void)setScrollItems:(id)a3;
- (void)setShortcutsUpdateToken:(id)a3;
- (void)setShouldForciblyHideBackButtonForAnimation:(BOOL)a3;
- (void)setShouldIgnoreNextHome:(BOOL)a3;
- (void)setSideAppButton:(id)a3;
- (void)setSideAppMoreRockerItems:(id)a3;
- (void)setSiriShortcutsItems:(id)a3;
- (void)setSpeakScreenButton:(id)a3;
- (void)setStyle:(int)a3;
- (void)setToggleDockButton:(id)a3;
- (void)setTouchItems:(id)a3;
- (void)setTripleClickHomeButton:(id)a3;
- (void)setUseCircleMode:(BOOL)a3;
- (void)showBannerWithText:(id)a3;
- (void)showMiddleCircle:(BOOL)a3;
- (void)showNubbitPressedState:(BOOL)a3;
- (void)showVolumeBar:(BOOL)a3 withProgress:(double)a4;
- (void)showVolumeDisplayImmediately;
- (void)transitionMenuToNubbit:(CGPoint)a3 changeAlpha:(BOOL)a4 animate:(BOOL)a5;
- (void)transitionNubbitToMenu:(CGPoint)a3 concurrentAnimation:(id)a4 animationCompleted:(id)a5;
- (void)updateForegroundImageForAction:(id)a3;
- (void)updateRingerSwitch;
- (void)updateRockersForSubstantialTransition;
- (void)updateRotationLockSwitch;
- (void)volumeChanged;
@end

@implementation HNDRocker

- (uint64_t)_usesCircularNubbit
{
  return AXDeviceHasHomeButton() ^ 1;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
  if (a3)
  {
    v4 = [(HNDRocker *)self disableDashBoardGesturesAssertion];

    if (!v4)
    {
      id v5 = +[AXAssertion assertionWithType:AXAssertionTypeDisableDashboardSystemGestures identifier:@"AST menu active"];
      [(HNDRocker *)self setDisableDashBoardGesturesAssertion:v5];
    }
  }
  else
  {
    [(HNDRocker *)self setDisableDashBoardGesturesAssertion:0];
  }
}

- (HNDRocker)initWithFrame:(CGRect)a3
{
  v99.receiver = self;
  v99.super_class = (Class)HNDRocker;
  v3 = -[HNDView initWithFrame:](&v99, "initWithFrame:");
  [(HNDRocker *)v3 setAlpha:0.0];
  v4 = +[UIColor clearColor];
  [(HNDRocker *)v3 setBackgroundColor:v4];

  id v5 = [(HNDRocker *)v3 layer];
  [v5 setMasksToBounds:0];

  [(HNDRocker *)v3 setClipsToBounds:0];
  [(HNDRocker *)v3 setAutoresizesSubviews:1];
  v6 = [(HNDRocker *)v3 layer];
  [v6 setDisableUpdateMask:32];

  v7 = +[UIImage imageNamed:@"NubbitCenter"];
  uint64_t v8 = [v7 imageWithRenderingMode:2];
  nubbitImage = v3->_nubbitImage;
  v3->_nubbitImage = (UIImage *)v8;

  v82 = +[UIBlurEffect effectWithStyle:1203];
  v10 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v82];
  backdropView = v3->_backdropView;
  v3->_backdropView = v10;

  [(HNDRocker *)v3 _setOverrideUserInterfaceStyle:2];
  if ([(HNDRocker *)v3 _usesCircularNubbit])
  {
    id v12 = objc_alloc((Class)UIView);
    [(UIVisualEffectView *)v3->_backdropView bounds];
    v13 = (UIView *)objc_msgSend(v12, "initWithFrame:");
    maskImageView = v3->_maskImageView;
    v3->_maskImageView = v13;

    v15 = +[UIColor blackColor];
    [(UIView *)v3->_maskImageView setBackgroundColor:v15];

    v16 = [(UIView *)v3->_maskImageView layer];
    [v16 setCornerCurve:kCACornerCurveContinuous];

    LODWORD(v16) = AXDeviceIsPad();
    +[HNDRocker nubbitSize];
    double v18 = v17;
    [(UIView *)v3->_maskImageView layer];
    if (v16) {
      v19 = {;
    }
      [v19 setCornerRadius:v18 * 13.0 / 60.0];
    }
    else {
      v19 = {;
    }
      [v19 setCornerRadius:v18 * 0.5];
    }
  }
  else
  {
    v20 = +[UIImage imageNamed:@"MenuMask"];
    v19 = objc_msgSend(v20, "resizableImageWithCapInsets:resizingMode:", 1, 29.0, 29.0, 29.0, 29.0);

    v21 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v19];
    v22 = v3->_maskImageView;
    v3->_maskImageView = v21;
  }
  [(UIView *)v3->_maskImageView setAutoresizingMask:18];
  v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  stackState = v3->_stackState;
  v3->_stackState = v23;

  [(UIVisualEffectView *)v3->_backdropView setMaskView:v3->_maskImageView];
  [(HNDRocker *)v3 addSubview:v3->_backdropView];
  v25 = (AXAssistiveTouchLayoutView *)objc_alloc_init((Class)AXAssistiveTouchLayoutView);
  layoutView = v3->_layoutView;
  v3->_layoutView = v25;

  [(AXAssistiveTouchLayoutView *)v3->_layoutView setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = [(UIVisualEffectView *)v3->_backdropView contentView];
  [v27 addSubview:v3->_layoutView];

  objc_initWeak(&location, v3);
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_100048020;
  v96[3] = &unk_1001AC0C0;
  objc_copyWeak(&v97, &location);
  LOBYTE(v72) = 1;
  uint64_t v28 = +[HNDRockerButton buttonWithTitle:0 imageName:@"BackArrow" downBlock:0 upBlock:v96 dataSource:v3 showWithGuidedAccess:1 showWithAssistiveAccess:v72];
  backButton = v3->_backButton;
  v3->_backButton = (HNDRockerButton *)v28;

  [(HNDRockerButton *)v3->_backButton setIsBackButton:1];
  [(HNDRockerButton *)v3->_backButton setAlpha:0.0];
  v30 = [(UIVisualEffectView *)v3->_backdropView contentView];
  [v30 addSubview:v3->_backButton];

  v31 = (NSMutableArray *)[objc_allocWithZone((Class)NSMutableArray) init];
  rockerItems = v3->_rockerItems;
  v3->_rockerItems = v31;

  v3->_state = 1;
  v33 = +[AXSettings sharedInstance];
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_100048064;
  v94[3] = &unk_1001AAA68;
  objc_copyWeak(&v95, &location);
  id v34 = objc_loadWeakRetained(&location);
  [v33 registerUpdateBlock:v94 forRetrieveSelector:"assistiveTouchIdleOpacity" withListener:v34];

  objc_destroyWeak(&v95);
  v35 = +[NSNotificationCenter defaultCenter];
  [v35 addObserver:v3 selector:"_siriPrefsChanged:" name:AFPreferencesDidChangeNotification object:0];

  v36 = +[NSNotificationCenter defaultCenter];
  [v36 addObserver:v3 selector:"_siriPrefsChanged:" name:kAXSHomeButtonAssistantChangedNotification object:0];

  [(HNDRocker *)v3 setAutoresizesSubviews:1];
  v81 = AXPIDefaultAppearanceForDevice();
  [v81 fingerWidth];
  double v38 = v37;
  AX_CGRectGetCenter();
  v41 = (AXPIFingerView *)objc_msgSend(objc_alloc((Class)AXPIFingerView), "initWithFrame:appearanceDelegate:", v81, v39 - v38 * 0.5, v40 - v38 * 0.5, v38, v38);
  middleCircle = v3->_middleCircle;
  v3->_middleCircle = v41;

  [(AXPIFingerView *)v3->_middleCircle setHidden:1];
  v43 = [(UIVisualEffectView *)v3->_backdropView contentView];
  [v43 addSubview:v3->_middleCircle];

  id v44 = objc_allocWithZone((Class)AXDispatchTimer);
  id v45 = &_dispatch_main_q;
  v46 = (AXDispatchTimer *)[v44 initWithTargetSerialQueue:&_dispatch_main_q];
  volumeUpdateTimer = v3->_volumeUpdateTimer;
  v3->_volumeUpdateTimer = v46;

  v48 = +[HNDHandManager sharedManager];
  v3->_isNubbitVisible = [v48 alwaysShowMenu];

  v49 = (AXDispatchTimer *)[objc_allocWithZone((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  homeButtonDismissTimer = v3->_homeButtonDismissTimer;
  v3->_homeButtonDismissTimer = v49;

  v92[1] = _NSConcreteStackBlock;
  v92[2] = (id)3221225472;
  v92[3] = sub_1000480D4;
  v92[4] = &unk_1001AAA90;
  v51 = v3;
  v93 = v51;
  AXPerformBlockAsynchronouslyOnMainThread();
  v52 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  nubbitFadeTimer = v51->_nubbitFadeTimer;
  v51->_nubbitFadeTimer = v52;

  v54 = +[AXSettings sharedInstance];
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100048110;
  v91[3] = &unk_1001AAA68;
  objc_copyWeak(v92, &location);
  [v54 registerUpdateBlock:v91 forRetrieveSelector:"assistiveTouchMainScreenCustomization" withListener:v51];

  objc_destroyWeak(v92);
  v55 = +[AXSettings sharedInstance];
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_100048154;
  v89[3] = &unk_1001AAA68;
  objc_copyWeak(&v90, &location);
  [v55 registerUpdateBlock:v89 forRetrieveSelector:"assistiveTouchMouseDwellControlEnabled" withListener:v51];

  objc_destroyWeak(&v90);
  v56 = +[AXSettings sharedInstance];
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_100048194;
  v87[3] = &unk_1001AAA68;
  objc_copyWeak(&v88, &location);
  [v56 registerUpdateBlock:v87 forRetrieveSelector:"assistiveTouchMouseDwellControlAutorevertEnabled" withListener:v51];

  objc_destroyWeak(&v88);
  v57 = +[AXSettings sharedInstance];
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1000481D4;
  v85[3] = &unk_1001AAA68;
  objc_copyWeak(&v86, &location);
  [v57 registerUpdateBlock:v85 forRetrieveSelector:"assistiveTouchAlwaysShowMenuEnabled" withListener:v51];

  objc_destroyWeak(&v86);
  v58 = +[AXSiriShortcutsManager sharedManager];
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100048214;
  v83[3] = &unk_1001AC0E8;
  objc_copyWeak(&v84, &location);
  uint64_t v59 = [v58 registerShortcutsDidChangeBlock:v83];
  shortcutsUpdateToken = v51->_shortcutsUpdateToken;
  v51->_shortcutsUpdateToken = (NSString *)v59;

  v79 = [(AXAssistiveTouchLayoutView *)v3->_layoutView topAnchor];
  v80 = [(UIVisualEffectView *)v3->_backdropView contentView];
  v78 = [v80 topAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v100[0] = v77;
  v75 = [(AXAssistiveTouchLayoutView *)v3->_layoutView bottomAnchor];
  v76 = [(UIVisualEffectView *)v3->_backdropView contentView];
  v74 = [v76 bottomAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v100[1] = v73;
  v61 = [(AXAssistiveTouchLayoutView *)v3->_layoutView leadingAnchor];
  v62 = [(UIVisualEffectView *)v3->_backdropView contentView];
  v63 = [v62 leadingAnchor];
  v64 = [v61 constraintEqualToAnchor:v63];
  v100[2] = v64;
  v65 = [(AXAssistiveTouchLayoutView *)v3->_layoutView trailingAnchor];
  v66 = [(UIVisualEffectView *)v3->_backdropView contentView];
  v67 = [v66 trailingAnchor];
  v68 = [v65 constraintEqualToAnchor:v67];
  v100[3] = v68;
  v69 = +[NSArray arrayWithObjects:v100 count:4];
  +[NSLayoutConstraint activateConstraints:v69];

  v70 = v51;
  objc_destroyWeak(&v84);

  objc_destroyWeak(&v97);
  objc_destroyWeak(&location);

  return v70;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSTripleHomeEnabledNotification, 0);
  v4 = +[AXSiriShortcutsManager sharedManager];
  [v4 unregisterShortcutsDidChangeBlock:self->_shortcutsUpdateToken];

  id v5 = [(HNDRocker *)self hitTestCategoryAssertion];
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)HNDRocker;
  [(HNDRocker *)&v6 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  CGFloat rect = a3.size.height;
  double r2_24 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v48.receiver = self;
  v48.super_class = (Class)HNDRocker;
  -[HNDRocker setFrame:](&v48, "setFrame:");
  objc_super v6 = [(HNDRocker *)self displayManager];
  [v6 screenBounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  +[HNDRocker nubbitSize];
  CGFloat v16 = v15 / -3.0;
  CGFloat v18 = v17 / -3.0;
  v49.origin.CGFloat x = v8;
  v49.origin.CGFloat y = v10;
  v49.size.CGFloat width = v12;
  v49.size.CGFloat height = v14;
  CGRect v50 = CGRectInset(v49, v16, v18);
  CGFloat v19 = v50.origin.x;
  CGFloat v20 = v50.origin.y;
  CGFloat width = v50.size.width;
  CGFloat height = v50.size.height;
  [v6 orientation];
  [v6 foreheadRect];
  objc_msgSend(v6, "convertFrameToInterfaceOrientation:");
  CGFloat v43 = v24;
  CGFloat v44 = v23;
  CGFloat v41 = v26;
  CGFloat v42 = v25;
  double r2 = x;
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = r2_24;
  v51.size.CGFloat height = rect;
  double MaxX = CGRectGetMaxX(v51);
  CGFloat v28 = v19;
  v52.origin.CGFloat x = v19;
  v52.origin.CGFloat y = v20;
  v52.size.CGFloat width = width;
  CGFloat v29 = height;
  v52.size.CGFloat height = height;
  CGFloat v40 = v20;
  if (MaxX > CGRectGetMaxX(v52))
  {
    double v30 = y;
    double v31 = rect;
    CGFloat v32 = v28;
LABEL_6:
    BOOL v36 = 0;
    goto LABEL_7;
  }
  v53.origin.CGFloat x = r2;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = r2_24;
  v53.size.CGFloat height = rect;
  double MaxY = CGRectGetMaxY(v53);
  CGFloat v34 = v28;
  v54.origin.CGFloat x = v28;
  v54.origin.CGFloat y = v20;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = v29;
  if (MaxY > CGRectGetMaxY(v54)) {
    goto LABEL_5;
  }
  v55.origin.CGFloat x = r2;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = r2_24;
  v55.size.CGFloat height = rect;
  double MinX = CGRectGetMinX(v55);
  v56.origin.CGFloat x = v28;
  v56.origin.CGFloat y = v20;
  v56.size.CGFloat width = width;
  v56.size.CGFloat height = v29;
  if (MinX < CGRectGetMinX(v56))
  {
LABEL_5:
    double v30 = y;
    double v31 = rect;
    CGFloat v32 = v28;
    goto LABEL_6;
  }
  CGFloat v38 = v20;
  v59.origin.CGFloat x = r2;
  v59.origin.CGFloat y = y;
  double v30 = y;
  v59.size.CGFloat width = r2_24;
  double v31 = rect;
  v59.size.CGFloat height = rect;
  double MinY = CGRectGetMinY(v59);
  CGFloat v32 = v34;
  v60.origin.CGFloat x = v34;
  v60.origin.CGFloat y = v38;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = v29;
  BOOL v36 = MinY >= CGRectGetMinX(v60);
LABEL_7:
  if (AXDeviceHasJindo())
  {
    v57.origin.CGFloat y = v43;
    v57.origin.CGFloat x = v44;
    v57.size.CGFloat height = v41;
    v57.size.CGFloat width = v42;
    v61.origin.CGFloat x = r2;
    v61.origin.CGFloat y = v30;
    v61.size.CGFloat width = r2_24;
    v61.size.CGFloat height = v31;
    CGRect v58 = CGRectIntersection(v57, v61);
    if (v36 & CGRectIsNull(v58)) {
      goto LABEL_14;
    }
  }
  else if (v36)
  {
    goto LABEL_14;
  }
  double v37 = ASTLogCommon();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
    sub_10011491C(v37, r2, v30, r2_24, v31, v32, v40, width, v29);
  }

LABEL_14:
}

- (void)_siriPrefsChanged:(id)a3
{
}

- (void)showMiddleCircle:(BOOL)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)_backButtonShouldBeHidden
{
  if (self->_state == 1 || self->_volumeBar || !self->_backgroundType) {
    return 1;
  }
  else {
    return [(HNDRocker *)self shouldForciblyHideBackButtonForAnimation];
  }
}

- (void)_updateBackButtonVisibility
{
  unsigned int v3 = [(HNDRocker *)self _backButtonShouldBeHidden];
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  [(HNDRockerButton *)self->_backButton setAlpha:v4];
  backButton = self->_backButton;

  [(HNDRockerButton *)backButton setUserInteractionEnabled:v3 ^ 1];
}

- (void)_updateProgress:(id)a3
{
  id v4 = a3;
  if (self->_startInterval == 0.0)
  {
    self->_startInterval = CFAbsoluteTimeGetCurrent();
    [(HNDRocker *)self _loadMenuItems:1 viewForCenteringAtStart:0 goBackwards:0 originalState:self->_state];
  }
  self->_double progress = (CFAbsoluteTimeGetCurrent() - self->_startInterval) / 0.2;
  [(HNDRocker *)self setNeedsDisplay];
  double progress = self->_progress;
  if ((progress >= 0.5 || !self->_useCircle) && !self->_sentRockers)
  {
    self->_sentRockers = 1;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100048810;
    v7[3] = &unk_1001AAA90;
    v7[4] = self;
    +[UIView animateWithDuration:v7 animations:0.2];
    double progress = self->_progress;
  }
  if (progress >= 1.0)
  {
    self->_double progress = 1.0;
    [(HNDRocker *)self setNeedsDisplay];
    self->_linkRunning = 0;
    objc_super v6 = +[NSRunLoop currentRunLoop];
    [v4 removeFromRunLoop:v6 forMode:NSDefaultRunLoopMode];
  }
}

- (BOOL)_replaceRingerWithOrientationLock
{
  if (AXDeviceIsPad() && !j__AXDeviceIsRingerSwitchAvailable())
  {
    return AXAssistiveAccessEnabled() ^ 1;
  }
  else
  {
    v2 = +[HNDEventManager sharedManager];
    if ([v2 sideSwitchUsedForOrientation]) {
      int v3 = AXAssistiveAccessEnabled() ^ 1;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)_includeRingerButtonInHardware
{
  if (AXDeviceIsPad()) {
    return 1;
  }

  return j__AXDeviceIsRingerSwitchAvailable();
}

- (int64_t)_indexForAngle:(double)a3
{
  id v4 = [(NSMutableArray *)self->_rockerItems count];
  if (v4 == (id)6)
  {
    int64_t result = 0;
    if (a3 < 315.0 && a3 >= 0.0)
    {
      if (a3 >= 45.0)
      {
        if (a3 >= 135.0)
        {
          if (a3 < 180.0) {
            return 3;
          }
          if (a3 < 225.0) {
            return 4;
          }
          BOOL v6 = a3 >= 315.0 || a3 < 225.0;
          int64_t v7 = 5;
          goto LABEL_27;
        }
        return 2;
      }
      return 1;
    }
  }
  else
  {
    if (v4 != (id)4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    int64_t result = 0;
    if (a3 < 315.0 && a3 >= 45.0)
    {
      if (a3 >= 135.0)
      {
        if (a3 >= 225.0)
        {
          BOOL v6 = a3 >= 315.0 || a3 < 225.0;
          int64_t v7 = 3;
LABEL_27:
          if (v6) {
            return 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            return v7;
          }
        }
        return 2;
      }
      return 1;
    }
  }
  return result;
}

- (void)_highlightRockerButtonAtAngle:(double)a3
{
  int64_t v4 = [(HNDRocker *)self _indexForAngle:a3];
  self->_selectedButtonIndeCGFloat x = v4;
  [(HNDRockerButton *)self->_selectedButton setSelected:0];
  id v5 = [(NSMutableArray *)self->_rockerItems objectAtIndex:v4];
  selectedButton = self->_selectedButton;
  self->_selectedButton = v5;

  [(HNDRockerButton *)self->_selectedButton setSelected:1];
  middleCircle = self->_middleCircle;

  [(AXPIFingerView *)middleCircle setSelected:0];
}

- (BOOL)_angleIndicatesReturnToCenter:(double)a3
{
  id v5 = [(NSMutableArray *)self->_rockerItems count];
  if (v5 == (id)6)
  {
    selectedButtonIndeCGFloat x = self->_selectedButtonIndex;
    if (a3 >= 225.0 || (a3 >= 135.0 ? (BOOL v13 = selectedButtonIndex == 0) : (BOOL v13 = 0), !v13))
    {
      if (a3 >= 225.0 || (a3 >= 135.0 ? (BOOL v14 = selectedButtonIndex == 1) : (BOOL v14 = 0), !v14))
      {
        if (a3 >= 315.0 || (a3 >= 225.0 ? (BOOL v15 = selectedButtonIndex == 2) : (BOOL v15 = 0), !v15))
        {
          BOOL v17 = a3 >= 315.0 && (unint64_t)(selectedButtonIndex - 3) < 2;
          BOOL result = 1;
          if (a3 >= 45.0 && !v17 && (a3 >= 135.0 || a3 < 45.0 || selectedButtonIndex != 5)) {
            return 0;
          }
          return result;
        }
      }
    }
    return 1;
  }
  if (v5 != (id)4) {
    return 0;
  }
  int64_t v6 = self->_selectedButtonIndex;
  if (a3 < 225.0 && a3 >= 135.0 && v6 == 0) {
    return 1;
  }
  if (a3 < 315.0 && a3 >= 225.0 && v6 == 1) {
    return 1;
  }
  BOOL v10 = a3 >= 315.0 && v6 == 2;
  BOOL result = 1;
  if (a3 >= 45.0 && !v10 && (a3 >= 135.0 || a3 < 45.0 || v6 != 3)) {
    return 0;
  }
  return result;
}

- (id)rockerHitTest:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = sub_100048E30;
  CGFloat v16 = sub_100048E40;
  id v17 = 0;
  int64_t v6 = self->_rockerItems;
  [(HNDRockerButton *)self->_backButton alpha];
  if (v7 == 1.0)
  {
    uint64_t v8 = [(NSMutableArray *)v6 arrayByAddingObject:self->_backButton];

    int64_t v6 = (NSMutableArray *)v8;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100048E48;
  v11[3] = &unk_1001AC110;
  *(CGFloat *)&v11[6] = x;
  *(CGFloat *)&v11[7] = y;
  v11[4] = self;
  v11[5] = &v12;
  [(NSMutableArray *)v6 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)_updateSelectedButton
{
  if (([(AXPIFingerView *)self->_middleCircle isHidden] & 1) == 0)
  {
    [(AXPIFingerView *)self->_middleCircle bounds];
    AX_CGRectGetCenter();
    -[AXPIFingerView convertPoint:toView:](self->_middleCircle, "convertPoint:toView:", self);
    -[HNDRocker hoveredTo:](self, "hoveredTo:");
  }
}

- (void)_updateSelectedButton:(id)a3
{
  id v5 = (HNDRockerButton *)a3;
  p_selectedButton = &self->_selectedButton;
  selectedButton = self->_selectedButton;
  if (selectedButton != v5)
  {
    uint64_t v8 = v5;
    [(HNDRockerButton *)selectedButton setSelected:0];
    [(HNDRockerButton *)*p_selectedButton setHighlighted:0];
    objc_storeStrong((id *)&self->_selectedButton, a3);
    [(HNDRockerButton *)*p_selectedButton setSelected:1];
    selectedButton = (HNDRockerButton *)[(NSMutableArray *)self->_rockerItems indexOfObject:*p_selectedButton];
    id v5 = v8;
    self->_selectedButtonIndeCGFloat x = (int64_t)selectedButton;
  }

  _objc_release_x1(selectedButton, v5);
}

- (void)hoveredTo:(CGPoint)a3
{
  -[HNDRocker rockerHitTest:](self, "rockerHitTest:", a3.x, a3.y);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HNDRocker *)self hoveredToRockerButton:v4];
}

- (void)hoveredToRockerButton:(id)a3
{
}

- (CGRect)onScreenFrameForRockerButton:(id)a3
{
  id v4 = a3;
  id v5 = [v4 imageView];
  [v5 frame];
  double x = v6;
  double y = v8;
  double width = v10;
  double height = v12;

  uint64_t v14 = [v4 label];

  if (v14)
  {
    BOOL v15 = [v4 imageView];
    [v15 frame];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    double v24 = [v4 label];
    [v24 frame];
    v44.origin.double x = v25;
    v44.origin.double y = v26;
    v44.size.double width = v27;
    v44.size.double height = v28;
    v41.origin.double x = v17;
    v41.origin.double y = v19;
    v41.size.double width = v21;
    v41.size.double height = v23;
    CGRect v42 = CGRectUnion(v41, v44);
    double x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
  }
  -[HNDRocker convertRect:fromView:](self, "convertRect:fromView:", v4, x, y, width, height);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  double v37 = v30;
  double v38 = v32;
  double v39 = v34;
  double v40 = v36;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

- (id)currentlyVisibleRockerItems
{
  id v3 = [(NSMutableArray *)self->_rockerItems copy];
  [(HNDRockerButton *)self->_backButton alpha];
  if (v4 == 1.0)
  {
    uint64_t v5 = [v3 arrayByAddingObject:self->_backButton];

    id v3 = (id)v5;
  }

  return v3;
}

- (void)volumeChanged
{
  if ([(HNDRocker *)self isFullMenuVisible])
  {
    id v3 = +[HNDHandManager sharedManager];
    [v3 volumeLevel];
    -[HNDRocker showVolumeBar:withProgress:](self, "showVolumeBar:withProgress:", 1);
  }
}

- (void)showVolumeBar:(BOOL)a3 withProgress:(double)a4
{
  if (a3)
  {
    double v6 = +[AXSettings sharedInstance];
    double v7 = [v6 assistiveTouchMainScreenCustomization];
    double v8 = [v7 allValues];

    if ([v8 containsObject:AXAssistiveTouchIconTypeVolumeUp]) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = [v8 containsObject:AXAssistiveTouchIconTypeVolumeDown];
    }
    int64_t state = self->_state;
    if (state == 1) {
      unsigned int v13 = v9;
    }
    else {
      unsigned int v13 = 0;
    }
    BOOL v14 = state != 2 && v13 == 0;
    if (!v14 && self->_style == 1)
    {
      [(HNDRocker *)self _updateBackButtonVisibility];
      volumeBar = self->_volumeBar;
      if (!volumeBar)
      {
        double v16 = (HNDVolumeBar *)objc_opt_new();
        CGFloat v17 = self->_volumeBar;
        self->_volumeBar = v16;

        [(HNDVolumeBar *)self->_volumeBar setTranslatesAutoresizingMaskIntoConstraints:0];
        double v18 = [(UIVisualEffectView *)self->_backdropView contentView];
        [v18 addSubview:self->_volumeBar];
        double v29 = [(HNDVolumeBar *)self->_volumeBar centerXAnchor];
        CGFloat v28 = [v18 centerXAnchor];
        CGFloat v19 = [v29 constraintEqualToAnchor:v28];
        v35[0] = v19;
        double v20 = [(HNDVolumeBar *)self->_volumeBar centerYAnchor];
        CGFloat v21 = [v18 centerYAnchor];
        double v22 = [v20 constraintEqualToAnchor:v21];
        v35[1] = v22;
        CGFloat v23 = +[NSArray arrayWithObjects:v35 count:2];
        +[NSLayoutConstraint activateConstraints:v23];

        volumeBar = self->_volumeBar;
      }
      [(HNDVolumeBar *)volumeBar setProgress:a4];
      [(HNDVolumeBar *)self->_volumeBar setNeedsDisplay];
      volumeHideTimer = self->_volumeHideTimer;
      if (!volumeHideTimer)
      {
        CGFloat v25 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
        CGFloat v26 = self->_volumeHideTimer;
        self->_volumeHideTimer = v25;

        volumeHideTimer = self->_volumeHideTimer;
      }
      [(AXDispatchTimer *)volumeHideTimer cancel];
      CGFloat v27 = self->_volumeHideTimer;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000497F4;
      v30[3] = &unk_1001AAA90;
      v30[4] = self;
      [(AXDispatchTimer *)v27 afterDelay:v30 processBlock:1.5];
    }
  }
  else
  {
    [(AXDispatchTimer *)self->_volumeHideTimer cancel];
    double v10 = self->_volumeHideTimer;
    self->_volumeHideTimer = 0;

    if ([(HNDRocker *)self style]) {
      double v11 = 0.5;
    }
    else {
      double v11 = 0.0;
    }
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = sub_100048E30;
    v33[4] = sub_100048E40;
    double v34 = self->_volumeBar;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000496E0;
    v32[3] = &unk_1001AAA90;
    v32[4] = self;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100049734;
    v31[3] = &unk_1001AC138;
    v31[4] = self;
    v31[5] = v33;
    +[UIView animateWithDuration:v32 animations:v31 completion:v11];
    _Block_object_dispose(v33, 8);
  }
}

- (void)_goBackInMenuState:(int)a3
{
  int64_t state = self->_state;
  switch(state)
  {
    case 1:
      if (a3 == 3)
      {
        [(HNDRocker *)self _menuExited];
      }
      break;
    case 2:
    case 3:
    case 7:
    case 9:
    case 10:
    case 12:
      if (a3 == 3)
      {
        int64_t v5 = 1;
        goto LABEL_19;
      }
      break;
    case 4:
    case 6:
    case 11:
      if (a3 == 3)
      {
        int64_t v5 = 2;
        goto LABEL_19;
      }
      break;
    case 5:
      if (a3 == 3)
      {
        if (j__AXDeviceIsSiriAvailable())
        {
          int64_t v5 = 6;
        }
        else if (j__AXDeviceIsVoiceControlAvailable())
        {
          int64_t v5 = 6;
        }
        else
        {
          int64_t v5 = 1;
        }
        goto LABEL_19;
      }
      break;
    case 8:
      if (a3 == 3)
      {
        int64_t v5 = 7;
LABEL_19:
        if ([(NSMutableArray *)self->_stackState count])
        {
          double v6 = [(NSMutableArray *)self->_stackState lastObject];
          unsigned int v7 = [v6 intValue];
          int64_t v8 = self->_state;

          if (v8 != v7) {
            _AXAssert();
          }
          [(NSMutableArray *)self->_stackState removeLastObject];
          unsigned int v9 = [(NSMutableArray *)self->_stackState lastObject];
          int64_t v5 = (int)[v9 intValue];
        }
        self->_int64_t state = v5;
        [(HNDRocker *)self _loadMenuItems:1 viewForCenteringAtStart:0 goBackwards:1 originalState:state];
      }
      break;
    default:
      return;
  }
}

- (void)performPress:(int)a3 type:(int)a4 source:(int)a5
{
  uint64_t v7 = *(void *)&a3;
  [(AXPIFingerView *)self->_middleCircle setPressed:a3 == 2 animated:1];
  if (a4 == 2)
  {
LABEL_2:
    [(HNDRocker *)self _goBackInMenuState:v7];
    return;
  }
  selectedButton = self->_selectedButton;
  if (!selectedButton)
  {
    if (a5 == 2 && a4 == 1) {
      return;
    }
    goto LABEL_2;
  }

  [(HNDRockerButton *)selectedButton performPress:v7 == 2];
}

- (void)handleRealDownEvent:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_farthestTrackingDistance = 0.0;
  p_windowDownStartPoint = &self->_windowDownStartPoint;
  uint64_t v7 = [(HNDRocker *)self window];
  objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
  p_windowDownStartPoint->double x = v8;
  p_windowDownStartPoint->double y = v9;

  if (!self->_style)
  {
    [(AXDispatchTimer *)self->_nubbitFadeTimer cancel];
    id v10 = [(HNDView *)self controlDelegate];
    [v10 viewPressedDown:self];
  }
}

- (BOOL)isAnimatingNubbit
{
  return self->_animatingNubbit;
}

- (void)handleRealMoveEvent:(CGPoint)a3 maxOrb:(double)a4 currentForce:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  if (-[HNDRocker pointInside:withEvent:](self, "pointInside:withEvent:", 0, a3.x, a3.y, a4, a5)
    && AXForceTouchAvailableAndEnabled())
  {
    CGFloat v9 = [(HNDRocker *)self window];
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    SCRCMathGetDistanceBetweenPoints();
    double v11 = v10;

    double farthestTrackingDistance = self->_farthestTrackingDistance;
    if (v11 >= farthestTrackingDistance) {
      double farthestTrackingDistance = v11;
    }
    self->_double farthestTrackingDistance = farthestTrackingDistance;
    if (!self->_activatedOrbAction)
    {
      AXForceTouchThresholdPeek();
      if (v13 < a4 && self->_farthestTrackingDistance < 15.0)
      {
        BOOL v14 = ASTLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Reached orb threshold, triggered orb action", v16, 2u);
        }

        self->_orbActionThresholdReached = 1;
        BOOL v15 = [(HNDView *)self controlDelegate];
        [v15 viewOrbActionTriggered:self];

        [(HNDRocker *)self fadeNubbit];
        self->_activatedOrbAction = 1;
      }
    }
  }
}

- (void)resetOrbAction
{
  self->_orbActionThresholdReached = 0;
  self->_activatedOrbAction = 0;
}

- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4
{
  int style = self->_style;
  unsigned int v7 = -[HNDRocker pointInside:withEvent:](self, "pointInside:withEvent:", 0, a3.x, a3.y);
  if (style)
  {
    if (v7 && !self->_selectedButton) {
      [(HNDRocker *)self performPress:3 type:1 source:1];
    }
  }
  else
  {
    if (v7)
    {
      CGFloat v8 = [(HNDRocker *)self displayManager];
      if ([v8 playedHapticForCurrentEvent])
      {
        BOOL orbActionThresholdReached = self->_orbActionThresholdReached;

        if (orbActionThresholdReached)
        {
          sub_100042060(2);
          self->_BOOL orbActionThresholdReached = 0;
        }
      }
      else
      {
      }
      if (!AXForceTouchAvailableAndEnabled() || (AXForceTouchThresholdPeek(), v10 >= a4))
      {
        double v11 = [(HNDView *)self controlDelegate];
        [v11 viewPressedUp:self];
      }
    }
    [(HNDRocker *)self fadeNubbit];
  }

  [(HNDRocker *)self resetOrbAction];
}

- (void)updateRockersForSubstantialTransition
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [(HNDRocker *)self initialItems];
  double v4 = [(HNDRocker *)self touchItems];
  int64_t v5 = [(HNDRocker *)self hardwareItems];
  double v6 = [(HNDRocker *)self rotateItems];
  unsigned int v7 = [(HNDRocker *)self moreItems];
  CGFloat v8 = [(HNDRocker *)self scrollItems];
  CGFloat v9 = [(HNDRocker *)self dwellItems];
  double v10 = +[NSArray axArrayWithPossiblyNilArrays:](NSArray, "axArrayWithPossiblyNilArrays:", 8, v3, v4, v5, v6, v7, v8, v9, self->_rockerItems);

  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        BOOL v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v16 = [v15 substantialTransitionOccurredBlock];

        if (v16)
        {
          double v18 = [v15 substantialTransitionOccurredBlock];
          v18[2]();
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)_rockerButtonForLocation:(id)a3 buttonType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1001F0A70 != -1) {
    dispatch_once(&qword_1001F0A70, &stru_1001AC158);
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwellPauseToggle])
  {
    CGFloat v8 = +[HNDHandManager sharedManager];
    unsigned int v9 = [v8 dwellControlPaused];
    double v10 = (id *)&AXAssistiveTouchIconTypeDwellResume;
    id v11 = (id *)&AXAssistiveTouchIconTypeDwellPause;
  }
  else
  {
    if (![v7 isEqualToString:AXAssistiveTouchIconTypeDwellLockToggle]) {
      goto LABEL_11;
    }
    CGFloat v8 = +[HNDHandManager sharedManager];
    unsigned int v9 = [v8 dwellControlAutorevertEnabled];
    double v10 = (id *)&AXAssistiveTouchIconTypeDwellLock;
    id v11 = (id *)&AXAssistiveTouchIconTypeDwellUnlock;
  }

  if (v9) {
    id v12 = v10;
  }
  else {
    id v12 = v11;
  }
  id v13 = *v12;

  id v7 = v13;
LABEL_11:
  unsigned int v14 = [(id)qword_1001F0A60 containsObject:v7];
  unsigned __int8 v15 = [(id)qword_1001F0A68 containsObject:v7];
  double v16 = AXUIAssistiveTouchImageNameForName();
  CGFloat v17 = AXUIAssistiveTouchStringForName();
  LOBYTE(v55) = v15 ^ 1;
  id v18 = +[HNDRockerButton buttonWithTitle:v17 imageName:v16 downBlock:0 upBlock:0 dataSource:self showWithGuidedAccess:v14 ^ 1 showWithAssistiveAccess:v55];

  [v18 setType:v7];
  uint64_t v19 = AXAssistiveTouchIconTypeTripleClick;
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeTripleClick])
  {
    BOOL v20 = self->_tripleClickButton == 0;
    objc_storeStrong((id *)&self->_tripleClickButton, v18);
    if (v20)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10004DDE0, kAXSTripleHomeEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    long long v22 = +[AXSpringBoardServer server];
    CGFloat v23 = [v22 visibleTripleClickItems];

    if ([v23 count] == (id)1)
    {
      double v24 = [v23 firstObject];
      CGFloat v25 = +[AXTripleClickHelpers titleForTripleClickOption:](AXTripleClickHelpers, "titleForTripleClickOption:", [v24 intValue]);

      if (v25)
      {
        [v18 setTitle:v25];
      }
      else
      {
        CGFloat v26 = [v18 title];
        [v18 setTitle:v26];
      }
    }
  }
  objc_initWeak(&location, self);
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeNotificationCenter])
  {
    v239[0] = _NSConcreteStackBlock;
    v239[1] = 3221225472;
    v239[2] = sub_10004DE74;
    v239[3] = &unk_1001AC0C0;
    objc_copyWeak(&v240, &location);
    [v18 setUpBlock:v239];
    objc_destroyWeak(&v240);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypePinch])
  {
    v237[0] = _NSConcreteStackBlock;
    v237[1] = 3221225472;
    v237[2] = sub_10004DEC8;
    v237[3] = &unk_1001AC0C0;
    objc_copyWeak(&v238, &location);
    [v18 setUpBlock:v237];
    objc_destroyWeak(&v238);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeRotate])
  {
    v235[0] = _NSConcreteStackBlock;
    v235[1] = 3221225472;
    v235[2] = sub_10004DF28;
    v235[3] = &unk_1001AC0C0;
    objc_copyWeak(&v236, &location);
    [v18 setUpBlock:v235];
    objc_destroyWeak(&v236);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypePinchAndRotate])
  {
    v233[0] = _NSConcreteStackBlock;
    v233[1] = 3221225472;
    v233[2] = sub_10004DF88;
    v233[3] = &unk_1001AC0C0;
    objc_copyWeak(&v234, &location);
    [v18 setUpBlock:v233];
    objc_destroyWeak(&v234);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeDoubleTap])
  {
    v231[0] = _NSConcreteStackBlock;
    v231[1] = 3221225472;
    v231[2] = sub_10004DFE8;
    v231[3] = &unk_1001AC0C0;
    objc_copyWeak(&v232, &location);
    [v18 setUpBlock:v231];
    objc_destroyWeak(&v232);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeLongPress])
  {
    v229[0] = _NSConcreteStackBlock;
    v229[1] = 3221225472;
    v229[2] = sub_10004E048;
    v229[3] = &unk_1001AC0C0;
    objc_copyWeak(&v230, &location);
    [v18 setUpBlock:v229];
    objc_destroyWeak(&v230);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeDragAndDrop])
  {
    v227[0] = _NSConcreteStackBlock;
    v227[1] = 3221225472;
    v227[2] = sub_10004E0A8;
    v227[3] = &unk_1001AC0C0;
    objc_copyWeak(&v228, &location);
    [v18 setUpBlock:v227];
    objc_destroyWeak(&v228);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeMoveMenu])
  {
    v225[0] = _NSConcreteStackBlock;
    v225[1] = 3221225472;
    v225[2] = sub_10004E10C;
    v225[3] = &unk_1001AC0C0;
    objc_copyWeak(&v226, &location);
    [v18 setUpBlock:v225];
    objc_destroyWeak(&v226);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeSpotlight])
  {
    v223[0] = _NSConcreteStackBlock;
    v223[1] = 3221225472;
    v223[2] = sub_10004E170;
    v223[3] = &unk_1001AC0C0;
    objc_copyWeak(&v224, &location);
    [v18 setUpBlock:v223];
    objc_destroyWeak(&v224);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeForceTap])
  {
    v221[0] = _NSConcreteStackBlock;
    v221[1] = 3221225472;
    v221[2] = sub_10004E1CC;
    v221[3] = &unk_1001AC0C0;
    objc_copyWeak(&v222, &location);
    [v18 setUpBlock:v221];
    objc_destroyWeak(&v222);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeLockScreen])
  {
    [v18 setDownBlock:0];
    v219[0] = _NSConcreteStackBlock;
    v219[1] = 3221225472;
    v219[2] = sub_10004E22C;
    v219[3] = &unk_1001AC0C0;
    objc_copyWeak(&v220, &location);
    [v18 setUpBlock:v219];
    [v18 setIsModalDown:1];
    objc_destroyWeak(&v220);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeVolumeDown])
  {
    v217[0] = _NSConcreteStackBlock;
    v217[1] = 3221225472;
    v217[2] = sub_10004E26C;
    v217[3] = &unk_1001AC0C0;
    objc_copyWeak(&v218, &location);
    [v18 setDownBlock:v217];
    v215[0] = _NSConcreteStackBlock;
    v215[1] = 3221225472;
    v215[2] = sub_10004E2B0;
    v215[3] = &unk_1001AC0C0;
    objc_copyWeak(&v216, &location);
    [v18 setUpBlock:v215];
    [v18 setIsModalDown:1];
    objc_destroyWeak(&v216);
    objc_destroyWeak(&v218);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeVolumeUp])
  {
    v213[0] = _NSConcreteStackBlock;
    v213[1] = 3221225472;
    v213[2] = sub_10004E2F4;
    v213[3] = &unk_1001AC0C0;
    objc_copyWeak(&v214, &location);
    [v18 setDownBlock:v213];
    v211[0] = _NSConcreteStackBlock;
    v211[1] = 3221225472;
    v211[2] = sub_10004E338;
    v211[3] = &unk_1001AC0C0;
    objc_copyWeak(&v212, &location);
    [v18 setUpBlock:v211];
    [v18 setIsModalDown:1];
    objc_destroyWeak(&v212);
    objc_destroyWeak(&v214);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:v19])
  {
    v209[0] = _NSConcreteStackBlock;
    v209[1] = 3221225472;
    v209[2] = sub_10004E37C;
    v209[3] = &unk_1001AC0C0;
    objc_copyWeak(&v210, &location);
    [v18 setUpBlock:v209];
    [v18 setTag:111];
    objc_destroyWeak(&v210);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeRotateScreen])
  {
    v207[0] = _NSConcreteStackBlock;
    v207[1] = 3221225472;
    v207[2] = sub_10004E3BC;
    v207[3] = &unk_1001AC0C0;
    objc_copyWeak(&v208, &location);
    [v18 setUpBlock:v207];
    [v18 setTag:108];
    objc_destroyWeak(&v208);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeMute])
  {
    v205[0] = _NSConcreteStackBlock;
    v205[1] = 3221225472;
    v205[2] = sub_10004E418;
    v205[3] = &unk_1001AC0C0;
    objc_copyWeak(&v206, &location);
    [v18 setUpBlock:v205];
    [v18 setTag:100];
    [(HNDRocker *)self _setRingerSwitchIcon:v18];
    objc_destroyWeak(&v206);
    goto LABEL_52;
  }
  if (AXDeviceHasStaccato()
    && [v7 isEqualToString:AXAssistiveTouchIconTypeActionButton])
  {
    v203[0] = _NSConcreteStackBlock;
    v203[1] = 3221225472;
    v203[2] = sub_10004E45C;
    v203[3] = &unk_1001AC0C0;
    objc_copyWeak(&v204, &location);
    [v18 setUpBlock:v203];
    [v18 setTag:100];
    [(HNDRocker *)self _setRingerSwitchIcon:v18];
    objc_destroyWeak(&v204);
    goto LABEL_52;
  }
  if (AXDeviceSupportsCameraButton()
    && [v7 isEqualToString:AXAssistiveTouchIconTypeCameraButton])
  {
    v201[0] = _NSConcreteStackBlock;
    v201[1] = 3221225472;
    v201[2] = sub_10004E49C;
    v201[3] = &unk_1001AC0C0;
    objc_copyWeak(&v202, &location);
    [v18 setUpBlock:v201];
    objc_destroyWeak(&v202);
    goto LABEL_52;
  }
  if (AXDeviceSupportsCameraButton()
    && [v7 isEqualToString:AXAssistiveTouchIconTypeCameraButtonLightPress])
  {
    v199[0] = _NSConcreteStackBlock;
    v199[1] = 3221225472;
    v199[2] = sub_10004E4DC;
    v199[3] = &unk_1001AC0C0;
    objc_copyWeak(&v200, &location);
    [v18 setUpBlock:v199];
    objc_destroyWeak(&v200);
    goto LABEL_52;
  }
  if (AXDeviceSupportsCameraButton()
    && [v7 isEqualToString:AXAssistiveTouchIconTypeCameraButtonDoubleLightPress])
  {
    v197[0] = _NSConcreteStackBlock;
    v197[1] = 3221225472;
    v197[2] = sub_10004E51C;
    v197[3] = &unk_1001AC0C0;
    objc_copyWeak(&v198, &location);
    [v18 setUpBlock:v197];
    objc_destroyWeak(&v198);
    goto LABEL_52;
  }
  if (AXDeviceSupportsCameraButton()
    && [v7 isEqualToString:AXAssistiveTouchIconTypeVisualIntelligence])
  {
    v195[0] = _NSConcreteStackBlock;
    v195[1] = 3221225472;
    v195[2] = sub_10004E55C;
    v195[3] = &unk_1001AC0C0;
    objc_copyWeak(&v196, &location);
    [v18 setUpBlock:v195];
    objc_destroyWeak(&v196);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeOrientation])
  {
    v193[0] = _NSConcreteStackBlock;
    v193[1] = 3221225472;
    v193[2] = sub_10004E59C;
    v193[3] = &unk_1001AC0C0;
    objc_copyWeak(&v194, &location);
    [v18 setUpBlock:v193];
    [v18 setTag:112];
    [(HNDRocker *)self _setRotationLockIcon:v18];
    objc_destroyWeak(&v194);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeScreenshot])
  {
    v191[0] = _NSConcreteStackBlock;
    v191[1] = 3221225472;
    v191[2] = sub_10004E5DC;
    v191[3] = &unk_1001AC0C0;
    objc_copyWeak(&v192, &location);
    [v18 setUpBlock:v191];
    objc_destroyWeak(&v192);
    goto LABEL_52;
  }
  if (AXDeviceSupportsVirtualTrackpad()
    && [v7 isEqualToString:AXAssistiveTouchIconTypeTrackpad])
  {
    v189[0] = _NSConcreteStackBlock;
    v189[1] = 3221225472;
    v189[2] = sub_10004E61C;
    v189[3] = &unk_1001AC0C0;
    objc_copyWeak(&v190, &location);
    [v18 setUpBlock:v189];
    objc_destroyWeak(&v190);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeShake])
  {
    v187[0] = _NSConcreteStackBlock;
    v187[1] = 3221225472;
    v187[2] = sub_10004E65C;
    v187[3] = &unk_1001AC0C0;
    objc_copyWeak(&v188, &location);
    [v18 setUpBlock:v187];
    objc_destroyWeak(&v188);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeAppSwitcher])
  {
    v185[0] = _NSConcreteStackBlock;
    v185[1] = 3221225472;
    v185[2] = sub_10004E69C;
    v185[3] = &unk_1001AC0C0;
    objc_copyWeak(&v186, &location);
    [v18 setUpBlock:v185];
    objc_destroyWeak(&v186);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeDevice])
  {
    v183[0] = _NSConcreteStackBlock;
    v183[1] = 3221225472;
    v183[2] = sub_10004E6DC;
    v183[3] = &unk_1001AC0C0;
    objc_copyWeak(&v184, &location);
    [v18 setUpBlock:v183];
    [v18 setTag:104];
    objc_destroyWeak(&v184);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeControlCenter])
  {
    v181[0] = _NSConcreteStackBlock;
    v181[1] = 3221225472;
    v181[2] = sub_10004E74C;
    v181[3] = &unk_1001AC0C0;
    objc_copyWeak(&v182, &location);
    [v18 setUpBlock:v181];
    [v18 setTag:106];
    objc_destroyWeak(&v182);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeHome])
  {
    v179[0] = _NSConcreteStackBlock;
    v179[1] = 3221225472;
    v179[2] = sub_10004E7A0;
    v179[3] = &unk_1001AC0C0;
    objc_copyWeak(&v180, &location);
    [v18 setDownBlock:v179];
    v177[0] = _NSConcreteStackBlock;
    v177[1] = 3221225472;
    v177[2] = sub_10004E7E4;
    v177[3] = &unk_1001AC0C0;
    objc_copyWeak(&v178, &location);
    [v18 setUpBlock:v177];
    [v18 setIsModalDown:1];
    [v18 setTag:103];
    objc_destroyWeak(&v178);
    objc_destroyWeak(&v180);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeCustom])
  {
    v175[0] = _NSConcreteStackBlock;
    v175[1] = 3221225472;
    v175[2] = sub_10004E828;
    v175[3] = &unk_1001AC0C0;
    objc_copyWeak(&v176, &location);
    [v18 setUpBlock:v175];
    [v18 setTag:107];
    objc_destroyWeak(&v176);
    goto LABEL_52;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeSiri])
  {
    if (j__AXDeviceIsSiriAvailable())
    {
      v173[0] = _NSConcreteStackBlock;
      v173[1] = 3221225472;
      v173[2] = sub_10004E8B8;
      v173[3] = &unk_1001AC0C0;
      objc_copyWeak(&v174, &location);
      [v18 setUpBlock:v173];
      [v18 setTag:101];
      uint64_t v167 = 0;
      v168 = &v167;
      uint64_t v169 = 0x3032000000;
      v170 = sub_100048E30;
      v171 = sub_100048E40;
      id v18 = v18;
      id v172 = v18;
      v166[0] = _NSConcreteStackBlock;
      v166[1] = 3221225472;
      v166[2] = sub_10004E90C;
      v166[3] = &unk_1001AC038;
      v166[4] = &v167;
      [v18 setSubstantialTransitionOccurredBlock:v166];
      double v30 = [v18 substantialTransitionOccurredBlock];
      v30[2]();

      _Block_object_dispose(&v167, 8);
      objc_destroyWeak(&v174);
      goto LABEL_52;
    }
    uint64_t v32 = AXAssistiveTouchIconTypeVoiceControl;
    double v33 = [(HNDRocker *)self _rockerButtonForLocation:v6 buttonType:AXAssistiveTouchIconTypeVoiceControl];

    double v34 = [v33 type];
    LODWORD(v32) = [v34 isEqualToString:v32];

    if (v32) {
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  if ([v7 isEqualToString:AXAssistiveTouchIconTypeTypeToSiri])
  {
    if (j__AXDeviceIsSiriAvailable())
    {
      v164[0] = _NSConcreteStackBlock;
      v164[1] = 3221225472;
      v164[2] = sub_10004E964;
      v164[3] = &unk_1001AC0C0;
      objc_copyWeak(&v165, &location);
      [v18 setUpBlock:v164];
      [v18 setTag:102];
      uint64_t v167 = 0;
      v168 = &v167;
      uint64_t v169 = 0x3032000000;
      v170 = sub_100048E30;
      v171 = sub_100048E40;
      id v18 = v18;
      id v172 = v18;
      v163[0] = _NSConcreteStackBlock;
      v163[1] = 3221225472;
      v163[2] = sub_10004E9B8;
      v163[3] = &unk_1001AC038;
      v163[4] = &v167;
      [v18 setSubstantialTransitionOccurredBlock:v163];
      double v31 = [v18 substantialTransitionOccurredBlock];
      v31[2]();

      _Block_object_dispose(&v167, 8);
      objc_destroyWeak(&v165);
      goto LABEL_52;
    }
    uint64_t v35 = AXAssistiveTouchIconTypeVoiceControl;
    double v33 = [(HNDRocker *)self _rockerButtonForLocation:v6 buttonType:AXAssistiveTouchIconTypeVoiceControl];

    double v36 = [v33 type];
    LODWORD(v35) = [v36 isEqualToString:v35];

    if (v35) {
LABEL_103:
    }
      [v33 setDisabled:_AXSHomeButtonAssistant() != 1];
LABEL_104:
    id v27 = v33;
    goto LABEL_53;
  }
  if (![v7 isEqualToString:AXAssistiveTouchIconTypeVoiceControl])
  {
    if ([v7 isEqualToString:AXAssistiveTouchIconTypeCommandAndControl])
    {
      v159[0] = _NSConcreteStackBlock;
      v159[1] = 3221225472;
      v159[2] = sub_10004EA64;
      v159[3] = &unk_1001AC0C0;
      objc_copyWeak(&v160, &location);
      [v18 setUpBlock:v159];
      objc_destroyWeak(&v160);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeGestures])
    {
      v157[0] = _NSConcreteStackBlock;
      v157[1] = 3221225472;
      v157[2] = sub_10004EAA4;
      v157[3] = &unk_1001AC0C0;
      objc_copyWeak(&v158, &location);
      [v18 setUpBlock:v157];
      [v18 setTag:110];
      objc_destroyWeak(&v158);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeSOS])
    {
      v155[0] = _NSConcreteStackBlock;
      v155[1] = 3221225472;
      v155[2] = sub_10004EB14;
      v155[3] = &unk_1001AC0C0;
      objc_copyWeak(&v156, &location);
      [v18 setUpBlock:v155];
      objc_destroyWeak(&v156);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDetectionMode])
    {
      v153[0] = _NSConcreteStackBlock;
      v153[1] = 3221225472;
      v153[2] = sub_10004EB54;
      v153[3] = &unk_1001AC0C0;
      objc_copyWeak(&v154, &location);
      [v18 setUpBlock:v153];
      objc_destroyWeak(&v154);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeWatchRemoteScreen])
    {
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472;
      v151[2] = sub_10004EB94;
      v151[3] = &unk_1001AC0C0;
      objc_copyWeak(&v152, &location);
      [v18 setUpBlock:v151];
      objc_destroyWeak(&v152);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeBackgroundSounds])
    {
      v149[0] = _NSConcreteStackBlock;
      v149[1] = 3221225472;
      v149[2] = sub_10004EBD4;
      v149[3] = &unk_1001AC0C0;
      objc_copyWeak(&v150, &location);
      [v18 setUpBlock:v149];
      objc_destroyWeak(&v150);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeLiveCaptions])
    {
      v147[0] = _NSConcreteStackBlock;
      v147[1] = 3221225472;
      v147[2] = sub_10004EC14;
      v147[3] = &unk_1001AC0C0;
      objc_copyWeak(&v148, &location);
      [v18 setUpBlock:v147];
      objc_destroyWeak(&v148);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeLiveSpeech])
    {
      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472;
      v145[2] = sub_10004EC54;
      v145[3] = &unk_1001AC0C0;
      objc_copyWeak(&v146, &location);
      [v18 setUpBlock:v145];
      objc_destroyWeak(&v146);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDimFlashingLights])
    {
      v143[0] = _NSConcreteStackBlock;
      v143[1] = 3221225472;
      v143[2] = sub_10004EC94;
      v143[3] = &unk_1001AC0C0;
      objc_copyWeak(&v144, &location);
      [v18 setUpBlock:v143];
      objc_destroyWeak(&v144);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeHapticMusic])
    {
      v141[0] = _NSConcreteStackBlock;
      v141[1] = 3221225472;
      v141[2] = sub_10004ECD4;
      v141[3] = &unk_1001AC0C0;
      objc_copyWeak(&v142, &location);
      [v18 setUpBlock:v141];
      objc_destroyWeak(&v142);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeMotionCues])
    {
      v139[0] = _NSConcreteStackBlock;
      v139[1] = 3221225472;
      v139[2] = sub_10004ED14;
      v139[3] = &unk_1001AC0C0;
      objc_copyWeak(&v140, &location);
      [v18 setUpBlock:v139];
      objc_destroyWeak(&v140);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeNearbyDeviceControl])
    {
      v137[0] = _NSConcreteStackBlock;
      v137[1] = 3221225472;
      v137[2] = sub_10004ED54;
      v137[3] = &unk_1001AC0C0;
      objc_copyWeak(&v138, &location);
      [v18 setUpBlock:v137];
      objc_destroyWeak(&v138);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeRebootDevice])
    {
      v135[0] = _NSConcreteStackBlock;
      v135[1] = 3221225472;
      v135[2] = sub_10004ED94;
      v135[3] = &unk_1001AC0C0;
      objc_copyWeak(&v136, &location);
      [v18 setUpBlock:v135];
      objc_destroyWeak(&v136);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeReachability])
    {
      v133[0] = _NSConcreteStackBlock;
      v133[1] = 3221225472;
      v133[2] = sub_10004EDD4;
      v133[3] = &unk_1001AC0C0;
      objc_copyWeak(&v134, &location);
      [v18 setUpBlock:v133];
      objc_destroyWeak(&v134);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeSpeakScreen])
    {
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472;
      v131[2] = sub_10004EE14;
      v131[3] = &unk_1001AC0C0;
      objc_copyWeak(&v132, &location);
      [v18 setUpBlock:v131];
      objc_destroyWeak(&v132);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeSysdiagnose])
    {
      v129[0] = _NSConcreteStackBlock;
      v129[1] = 3221225472;
      v129[2] = sub_10004EE54;
      v129[3] = &unk_1001AC0C0;
      objc_copyWeak(&v130, &location);
      [v18 setUpBlock:v129];
      objc_destroyWeak(&v130);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeToggleDock])
    {
      v127[0] = _NSConcreteStackBlock;
      v127[1] = 3221225472;
      v127[2] = sub_10004EE94;
      v127[3] = &unk_1001AC0C0;
      objc_copyWeak(&v128, &location);
      [v18 setUpBlock:v127];
      objc_destroyWeak(&v128);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeArmApplePay])
    {
      v125[0] = _NSConcreteStackBlock;
      v125[1] = 3221225472;
      v125[2] = sub_10004EED4;
      v125[3] = &unk_1001AC0C0;
      objc_copyWeak(&v126, &location);
      [v18 setUpBlock:v125];
      [v18 setTag:117];
      objc_destroyWeak(&v126);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeSideApp])
    {
      v123[0] = _NSConcreteStackBlock;
      v123[1] = 3221225472;
      v123[2] = sub_10004EF30;
      v123[3] = &unk_1001AC0C0;
      objc_copyWeak(&v124, &location);
      [v18 setUpBlock:v123];
      [v18 setTag:113];
      objc_destroyWeak(&v124);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwell])
    {
      v121[0] = _NSConcreteStackBlock;
      v121[1] = 3221225472;
      v121[2] = sub_10004EF8C;
      v121[3] = &unk_1001AC0C0;
      objc_copyWeak(&v122, &location);
      [v18 setUpBlock:v121];
      [v18 setTag:116];
      objc_destroyWeak(&v122);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwellResume])
    {
      v119[0] = _NSConcreteStackBlock;
      v119[1] = 3221225472;
      v119[2] = sub_10004EFFC;
      v119[3] = &unk_1001AC0C0;
      objc_copyWeak(&v120, &location);
      [v18 setUpBlock:v119];
      objc_destroyWeak(&v120);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwellPause])
    {
      v117[0] = _NSConcreteStackBlock;
      v117[1] = 3221225472;
      v117[2] = sub_10004F040;
      v117[3] = &unk_1001AC0C0;
      objc_copyWeak(&v118, &location);
      [v18 setUpBlock:v117];
      objc_destroyWeak(&v118);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwellLock])
    {
      v115[0] = _NSConcreteStackBlock;
      v115[1] = 3221225472;
      v115[2] = sub_10004F084;
      v115[3] = &unk_1001AC0C0;
      objc_copyWeak(&v116, &location);
      [v18 setUpBlock:v115];
      objc_destroyWeak(&v116);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwellUnlock])
    {
      v113[0] = _NSConcreteStackBlock;
      v113[1] = 3221225472;
      v113[2] = sub_10004F0C8;
      v113[3] = &unk_1001AC0C0;
      objc_copyWeak(&v114, &location);
      [v18 setUpBlock:v113];
      objc_destroyWeak(&v114);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwellClick])
    {
      v111[0] = _NSConcreteStackBlock;
      v111[1] = 3221225472;
      v111[2] = sub_10004F10C;
      v111[3] = &unk_1001AC0C0;
      objc_copyWeak(&v112, &location);
      [v18 setUpBlock:v111];
      objc_destroyWeak(&v112);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwellIncreaseTime])
    {
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472;
      v109[2] = sub_10004F16C;
      v109[3] = &unk_1001AC0C0;
      objc_copyWeak(&v110, &location);
      [v18 setUpBlock:v109];
      objc_destroyWeak(&v110);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDwellDecreaseTime])
    {
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472;
      v107[2] = sub_10004F1AC;
      v107[3] = &unk_1001AC0C0;
      objc_copyWeak(&v108, &location);
      [v18 setUpBlock:v107];
      objc_destroyWeak(&v108);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScroll])
    {
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_10004F1EC;
      v105[3] = &unk_1001AC0C0;
      objc_copyWeak(&v106, &location);
      [v18 setUpBlock:v105];
      [v18 setTag:115];
      objc_destroyWeak(&v106);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollUp])
    {
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472;
      v103[2] = sub_10004F25C;
      v103[3] = &unk_1001AC0C0;
      objc_copyWeak(&v104, &location);
      [v18 setUpBlock:v103];
      objc_destroyWeak(&v104);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollDown])
    {
      v101[0] = _NSConcreteStackBlock;
      v101[1] = 3221225472;
      v101[2] = sub_10004F2C8;
      v101[3] = &unk_1001AC0C0;
      objc_copyWeak(&v102, &location);
      [v18 setUpBlock:v101];
      objc_destroyWeak(&v102);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollLeft])
    {
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472;
      v99[2] = sub_10004F334;
      v99[3] = &unk_1001AC0C0;
      objc_copyWeak(&v100, &location);
      [v18 setUpBlock:v99];
      objc_destroyWeak(&v100);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollRight])
    {
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_10004F3A0;
      v97[3] = &unk_1001AC0C0;
      objc_copyWeak(&v98, &location);
      [v18 setUpBlock:v97];
      objc_destroyWeak(&v98);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollToTop])
    {
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_10004F40C;
      v95[3] = &unk_1001AC0C0;
      objc_copyWeak(&v96, &location);
      [v18 setUpBlock:v95];
      objc_destroyWeak(&v96);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollToBottom])
    {
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = sub_10004F478;
      v93[3] = &unk_1001AC0C0;
      objc_copyWeak(&v94, &location);
      [v18 setUpBlock:v93];
      objc_destroyWeak(&v94);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeContinuousScrollHorizontal])
    {
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10004F4E4;
      v90[3] = &unk_1001AC180;
      objc_copyWeak(&v92, &location);
      id v91 = v7;
      [v18 setUpBlock:v90];

      objc_destroyWeak(&v92);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeContinuousScrollVertical])
    {
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472;
      v87[2] = sub_10004F558;
      v87[3] = &unk_1001AC180;
      objc_copyWeak(&v89, &location);
      id v88 = v7;
      [v18 setUpBlock:v87];

      objc_destroyWeak(&v89);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeEyeTrackingBubbleMode])
    {
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_10004F5CC;
      v85[3] = &unk_1001AC0C0;
      objc_copyWeak(&v86, &location);
      [v18 setUpBlock:v85];
      objc_destroyWeak(&v86);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeEyeTrackingAutoHide])
    {
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_10004F60C;
      v83[3] = &unk_1001AC0C0;
      objc_copyWeak(&v84, &location);
      [v18 setUpBlock:v83];
      objc_destroyWeak(&v84);
    }
    else if (AXDeviceSupportsOnDeviceEyeTracking() {
           && [v7 isEqualToString:AXAssistiveTouchIconTypeCalibrateOnDeviceEyeTracking])
    }
    {
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_10004F64C;
      v81[3] = &unk_1001AC0C0;
      objc_copyWeak(&v82, &location);
      [v18 setUpBlock:v81];
      objc_destroyWeak(&v82);
    }
    else if (AXDeviceSupportsOnDeviceEyeTracking() {
           && [v7 isEqualToString:AXAssistiveTouchIconTypeOnDeviceEyeTrackingZoomScreen])
    }
    {
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = sub_10004F68C;
      v79[3] = &unk_1001AC0C0;
      objc_copyWeak(&v80, &location);
      [v18 setUpBlock:v79];
      objc_destroyWeak(&v80);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeAssistiveAccess])
    {
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_10004F6CC;
      v77[3] = &unk_1001AC0C0;
      objc_copyWeak(&v78, &location);
      [v18 setUpBlock:v77];
      objc_destroyWeak(&v78);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeCamera])
    {
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10004F70C;
      v75[3] = &unk_1001AC0C0;
      objc_copyWeak(&v76, &location);
      [v18 setUpBlock:v75];
      objc_destroyWeak(&v76);
    }
    else if ([v7 isEqualToString:AXAssistiveTouchIconTypeFrontFacingCamera])
    {
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_10004F74C;
      v73[3] = &unk_1001AC0C0;
      objc_copyWeak(&v74, &location);
      [v18 setUpBlock:v73];
      objc_destroyWeak(&v74);
    }
    else
    {
      if ([v7 hasPrefix:@"CustomGesture-"])
      {
        CGRect v60 = [v7 stringByReplacingOccurrencesOfString:@"CustomGesture-" withString:&stru_1001B1E10];
        double v37 = +[HNDHandManager sharedManager];
        double v38 = [v37 customGestures];

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id obj = v38;
        id v61 = [obj countByEnumeratingWithState:&v69 objects:v242 count:16];
        if (v61)
        {
          uint64_t v59 = *(void *)v70;
          while (2)
          {
            for (i = 0; i != v61; i = (char *)i + 1)
            {
              if (*(void *)v70 != v59) {
                objc_enumerationMutation(obj);
              }
              double v40 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              CGRect v41 = [v40 name];
              unsigned int v42 = [v41 isEqualToString:v60];

              if (v42)
              {
                CGRect v54 = [v40 name];
                v67[0] = _NSConcreteStackBlock;
                v67[1] = 3221225472;
                v67[2] = sub_10004F78C;
                v67[3] = &unk_1001AC180;
                objc_copyWeak(&v68, &location);
                v67[4] = v40;
                LOBYTE(v56) = 1;
                CGFloat v43 = +[HNDRockerButton buttonWithTitle:v54 imageName:@"IconFavorites" downBlock:0 upBlock:v67 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v56];

                [v43 setCustomTitle:1];
                objc_destroyWeak(&v68);
                goto LABEL_207;
              }
            }
            id v61 = [obj countByEnumeratingWithState:&v69 objects:v242 count:16];
            if (v61) {
              continue;
            }
            break;
          }
        }
        CGFloat v43 = v18;
LABEL_207:
      }
      else
      {
        uint64_t v44 = AXASTSiriShortcutPrefixName;
        if (![v7 hasPrefix:AXASTSiriShortcutPrefixName])
        {
          if ([v7 isEqualToString:AXAssistiveTouchIconTypeSiriShortcutsMenu])
          {
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_10004F834;
            v62[3] = &unk_1001AC0C0;
            objc_copyWeak(&v63, &location);
            [v18 setUpBlock:v62];
            [v18 setTag:118];
            objc_destroyWeak(&v63);
          }
          goto LABEL_52;
        }
        id v45 = +[NSString stringWithFormat:@"%@-", v44];
        v46 = (char *)[v7 rangeOfString:v45];
        objc_super v48 = [v7 substringFromIndex:&v46[v47]];

        CGRect v49 = +[AXSiriShortcutsManager sharedManager];
        CGRect v50 = [v49 shortcutForIdentifier:v48];

        CGRect v51 = [v50 shortcutName];
        CGRect v52 = AXUIAssistiveTouchImageNameForName();
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_10004F7E0;
        v64[3] = &unk_1001AC1A8;
        id v53 = v50;
        id v65 = v53;
        v66 = self;
        LOBYTE(v57) = 0;
        CGFloat v43 = +[HNDRockerButton buttonWithTitle:v51 imageName:v52 downBlock:0 upBlock:v64 dataSource:self showWithGuidedAccess:0 showWithAssistiveAccess:v57];

        [v43 setCustomTitle:1];
      }
      id v18 = v43;
    }
LABEL_52:
    [v18 setLocation:v6];
    id v27 = v18;
LABEL_53:
    id v18 = v27;
    goto LABEL_54;
  }
  if (j__AXDeviceIsVoiceControlAvailable())
  {
    v161[0] = _NSConcreteStackBlock;
    v161[1] = 3221225472;
    v161[2] = sub_10004EA10;
    v161[3] = &unk_1001AC0C0;
    objc_copyWeak(&v162, &location);
    [v18 setUpBlock:v161];
    [v18 setDisabled:_AXSHomeButtonAssistant() != 1];
    objc_destroyWeak(&v162);
    goto LABEL_52;
  }
  id v27 = [(HNDRocker *)self _rockerButtonForLocation:v6 buttonType:AXAssistiveTouchIconTypeGestures];
LABEL_54:
  CGFloat v28 = v27;
  objc_destroyWeak(&location);

  return v28;
}

- (void)_preloadInitialMenuItems
{
  id v3 = [objc_allocWithZone((Class)NSMutableArray) init];
  [(HNDRocker *)self setInitialItems:v3];

  double v4 = +[AXSettings sharedInstance];
  int64_t v5 = [v4 assistiveTouchMainScreenCustomization];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v17);
        id v13 = [(HNDRocker *)self _rockerButtonForLocation:v11 buttonType:v12];

        unsigned int v14 = [(HNDRocker *)self initialItems];
        [v14 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  unsigned __int8 v15 = [(HNDRocker *)self initialItems];
  double v16 = [(HNDRocker *)self _filteredItems:v15];
  [(HNDRocker *)self setInitialItems:v16];
}

- (void)_loadInitialMenuItems
{
  id v3 = [(HNDRocker *)self initialItems];

  if (!v3) {
    [(HNDRocker *)self _preloadInitialMenuItems];
  }
  rockerItems = self->_rockerItems;
  int64_t v5 = [(HNDRocker *)self initialItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v5];

  [(HNDRocker *)self updateRotationLockSwitch];

  [(HNDRocker *)self updateRingerSwitch];
}

- (void)_loadMoreMenuItems
{
  int IsSOSAvailable = AXDeviceIsSOSAvailable();
  if (MGGetBoolAnswer()) {
    BOOL v4 = SBSIsReachabilityEnabled() != 0;
  }
  else {
    BOOL v4 = 0;
  }
  int64_t v5 = [(HNDRocker *)self moreItems];

  if (!v5)
  {
    id v6 = [objc_allocWithZone((Class)NSMutableArray) init];
    [(HNDRocker *)self setMoreItems:v6];

    id v7 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeAppSwitcher];
    id v8 = [(HNDRocker *)self moreItems];
    [v8 addObject:v7];

    uint64_t v9 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeScreenshot];

    double v10 = [(HNDRocker *)self moreItems];
    [v10 addObject:v9];

    if (IsSOSAvailable)
    {
      uint64_t v11 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeSOS];

      id v12 = [(HNDRocker *)self moreItems];
      [v12 addObject:v11];

      uint64_t v9 = (void *)v11;
    }
    id v13 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeShake];

    unsigned int v14 = [(HNDRocker *)self moreItems];
    [v14 addObject:v13];

    unsigned __int8 v15 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeRebootDevice];

    double v16 = [(HNDRocker *)self moreItems];
    [v16 addObject:v15];

    if (AXDeviceSupportsSideApp())
    {
      uint64_t v17 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeToggleDock];

      long long v18 = [(HNDRocker *)self moreItems];
      [v18 addObject:v17];

      unsigned __int8 v15 = (void *)v17;
    }
    long long v19 = [(HNDRocker *)self moreItems];
    long long v20 = [(HNDRocker *)self _filteredItems:v19];
    [(HNDRocker *)self setMoreItems:v20];
  }
  rockerItems = self->_rockerItems;
  long long v22 = [(HNDRocker *)self moreItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v22];

  if (AXDeviceCanArmApplePay()) {
    goto LABEL_11;
  }
  id v27 = +[HNDSecureIntentManager sharedInstance];
  if (![v27 waitingForSecureIntent])
  {
LABEL_19:

    goto LABEL_20;
  }
  unsigned int v28 = sub_1000408D0();

  if (v28)
  {
LABEL_11:
    CGFloat v23 = [(HNDRocker *)self applePayButton];

    if (!v23)
    {
      double v24 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeArmApplePay];
      [(HNDRocker *)self setApplePayButton:v24];
    }
    id v25 = [(NSMutableArray *)self->_rockerItems indexOfObjectPassingTest:&stru_1001AC1E8];
    CGFloat v26 = self->_rockerItems;
    id v27 = [(HNDRocker *)self applePayButton];
    if (v25 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)v26 addObject:v27];
    }
    else {
      [(NSMutableArray *)v26 replaceObjectAtIndex:v25 withObject:v27];
    }
    goto LABEL_19;
  }
LABEL_20:
  if ([(HNDRocker *)self _shouldShowSideAppMenu])
  {
    double v29 = [(HNDRocker *)self sideAppButton];

    if (!v29)
    {
      double v30 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeSideApp];
      [(HNDRocker *)self setSideAppButton:v30];
    }
    double v31 = self->_rockerItems;
    uint64_t v32 = [(HNDRocker *)self sideAppButton];
    [(NSMutableArray *)v31 addObject:v32];
  }
  if ((j__AXDeviceIsSiriAvailable() & 1) != 0 || j__AXDeviceIsVoiceControlAvailable())
  {
    double v33 = [(HNDRocker *)self gesturesButton];

    if (!v33)
    {
      double v34 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeGestures];
      [(HNDRocker *)self setGesturesButton:v34];
    }
    uint64_t v35 = self->_rockerItems;
    uint64_t v36 = [(HNDRocker *)self gesturesButton];
  }
  else
  {
    double v37 = [(HNDRocker *)self tripleClickHomeButton];

    if (!v37)
    {
      double v38 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeTripleClick];
      [(HNDRocker *)self setTripleClickHomeButton:v38];
    }
    uint64_t v35 = self->_rockerItems;
    uint64_t v36 = [(HNDRocker *)self tripleClickHomeButton];
  }
  double v39 = (void *)v36;
  [(NSMutableArray *)v35 addObject:v36];

  if (v4)
  {
    double v40 = [(HNDRocker *)self reachabilityButton];

    if (!v40)
    {
      CGRect v41 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeReachability];
      [(HNDRocker *)self setReachabilityButton:v41];
    }
    unsigned int v42 = self->_rockerItems;
    CGFloat v43 = [(HNDRocker *)self reachabilityButton];
    [(NSMutableArray *)v42 addObject:v43];
  }
  if (_AXSSpeakThisEnabled())
  {
    uint64_t v44 = [(HNDRocker *)self speakScreenButton];

    if (!v44)
    {
      id v45 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeSpeakScreen];
      [(HNDRocker *)self setSpeakScreenButton:v45];
    }
    v46 = self->_rockerItems;
    uint64_t v47 = [(HNDRocker *)self speakScreenButton];
    [(NSMutableArray *)v46 addObject:v47];
  }

  [(HNDRocker *)self _assignLocationsToRockerItems];
}

- (void)_assignLocationsToRockerItems
{
  [(NSMutableArray *)self->_rockerItems count];
  if (!AXAssistiveTouchNamedLayout() && (unint64_t)[(NSMutableArray *)self->_rockerItems count] >= 9)
  {
    -[NSMutableArray removeObjectsInRange:](self->_rockerItems, "removeObjectsInRange:", 8, (char *)[(NSMutableArray *)self->_rockerItems count] - 8);
    [(NSMutableArray *)self->_rockerItems count];
    AXAssistiveTouchNamedLayout();
  }
  id v3 = AXAssistiveTouchLocationsForLayout();
  rockerItems = self->_rockerItems;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000501E8;
  v6[3] = &unk_1001AC210;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableArray *)rockerItems enumerateObjectsUsingBlock:v6];
}

- (void)_loadGesturesMenuItems
{
  id v3 = [(HNDRocker *)self touchItems];

  if (!v3)
  {
    id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
    [(HNDRocker *)self setTouchItems:v4];

    objc_initWeak(location, self);
    id v5 = sub_100040EC8(@"NUMBER_OF_FINGERS");
    id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, 4);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10005078C;
    v32[3] = &unk_1001AC0C0;
    objc_copyWeak(&v33, location);
    LOBYTE(v22) = 1;
    id v7 = +[HNDRockerButton buttonWithTitle:v6 imageName:@"IconFingers4" downBlock:0 upBlock:v32 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v22];

    [v7 setLocation:AXAssistiveTouchIconLocationBottomMiddle];
    id v8 = [(HNDRocker *)self touchItems];
    [v8 addObject:v7];

    uint64_t v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, 3);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000507D0;
    v30[3] = &unk_1001AC0C0;
    objc_copyWeak(&v31, location);
    LOBYTE(v23) = 1;
    double v10 = +[HNDRockerButton buttonWithTitle:v9 imageName:@"IconFingers3" downBlock:0 upBlock:v30 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v23];

    [v10 setLocation:AXAssistiveTouchIconLocationMidRight];
    uint64_t v11 = [(HNDRocker *)self touchItems];
    [v11 addObject:v10];

    id v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, 2);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100050814;
    v28[3] = &unk_1001AC0C0;
    objc_copyWeak(&v29, location);
    LOBYTE(v24) = 1;
    id v13 = +[HNDRockerButton buttonWithTitle:v12 imageName:@"IconFingers2" downBlock:0 upBlock:v28 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v24];

    [v13 setLocation:AXAssistiveTouchIconLocationTopMiddle];
    unsigned int v14 = [(HNDRocker *)self touchItems];
    [v14 addObject:v13];

    unsigned __int8 v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, 5);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100050858;
    v26[3] = &unk_1001AC0C0;
    objc_copyWeak(&v27, location);
    LOBYTE(v25) = 1;
    double v16 = +[HNDRockerButton buttonWithTitle:v15 imageName:@"IconFingers5" downBlock:0 upBlock:v26 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v25];

    [v16 setLocation:AXAssistiveTouchIconLocationMidLeft];
    uint64_t v17 = [(HNDRocker *)self touchItems];
    [v17 addObject:v16];

    long long v18 = [(HNDRocker *)self touchItems];
    long long v19 = [(HNDRocker *)self _filteredItems:v18];
    [(HNDRocker *)self setTouchItems:v19];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);

    objc_destroyWeak(location);
  }
  rockerItems = self->_rockerItems;
  long long v21 = [(HNDRocker *)self touchItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v21];
}

- (void)_loadRotateMenuItems
{
  id v3 = [(HNDRocker *)self rotateItems];

  if (!v3)
  {
    id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
    [(HNDRocker *)self setRotateItems:v4];

    id v5 = sub_100040EC8(@"ORIENTATION-UPSIDE-DOWN");
    id v6 = +[NSString at_deviceIconNameForIdentifier:@"IconUpsideDown"];
    LOBYTE(v24) = 1;
    id v7 = +[HNDRockerButton buttonWithTitle:v5 imageName:v6 downBlock:0 upBlock:&stru_1001AC250 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v24];

    [v7 setLocation:AXAssistiveTouchIconLocationBottomMiddle];
    id v8 = [(HNDRocker *)self rotateItems];
    [v8 addObject:v7];

    uint64_t v9 = sub_100040EC8(@"ORIENTATION-LANDSCAPE-RIGHT");
    double v10 = +[NSString at_deviceIconNameForIdentifier:@"IconRight"];
    LOBYTE(v25) = 1;
    uint64_t v11 = +[HNDRockerButton buttonWithTitle:v9 imageName:v10 downBlock:0 upBlock:&stru_1001AC270 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v25];

    [v11 setLocation:AXAssistiveTouchIconLocationMidRight];
    id v12 = [(HNDRocker *)self rotateItems];
    [v12 addObject:v11];

    id v13 = sub_100040EC8(@"ORIENTATION-PORTRAIT");
    unsigned int v14 = +[NSString at_deviceIconNameForIdentifier:@"IconDevice"];
    LOBYTE(v26) = 1;
    unsigned __int8 v15 = +[HNDRockerButton buttonWithTitle:v13 imageName:v14 downBlock:0 upBlock:&stru_1001AC290 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v26];

    [v15 setLocation:AXAssistiveTouchIconLocationTopMiddle];
    double v16 = [(HNDRocker *)self rotateItems];
    [v16 addObject:v15];

    uint64_t v17 = sub_100040EC8(@"ORIENTATION-LANDSCAPE-LEFT");
    long long v18 = +[NSString at_deviceIconNameForIdentifier:@"IconLeft"];
    LOBYTE(v27) = 1;
    long long v19 = +[HNDRockerButton buttonWithTitle:v17 imageName:v18 downBlock:0 upBlock:&stru_1001AC2B0 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v27];

    [v19 setLocation:AXAssistiveTouchIconLocationMidLeft];
    long long v20 = [(HNDRocker *)self rotateItems];
    [v20 addObject:v19];

    long long v21 = [(HNDRocker *)self rotateItems];
    uint64_t v22 = [(HNDRocker *)self _filteredItems:v21];
    [(HNDRocker *)self setRotateItems:v22];
  }
  rockerItems = self->_rockerItems;
  id v28 = [(HNDRocker *)self rotateItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v28];
}

- (void)_loadScrollMenuItems
{
  id v3 = [(HNDRocker *)self scrollItems];

  if (!v3)
  {
    id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
    [(HNDRocker *)self setScrollItems:v4];

    uint64_t v5 = AXAssistiveTouchIconLocationTopLeft;
    uint64_t v6 = AXAssistiveTouchIconLocationTopMiddle;
    v29[0] = AXAssistiveTouchIconLocationTopLeft;
    v29[1] = AXAssistiveTouchIconLocationTopMiddle;
    uint64_t v7 = AXAssistiveTouchIconLocationTopRight;
    uint64_t v8 = AXAssistiveTouchIconLocationMidLeft;
    v29[2] = AXAssistiveTouchIconLocationTopRight;
    v29[3] = AXAssistiveTouchIconLocationMidLeft;
    uint64_t v9 = AXAssistiveTouchIconLocationMidRight;
    uint64_t v10 = AXAssistiveTouchIconLocationBottomMiddle;
    v29[4] = AXAssistiveTouchIconLocationMidRight;
    v29[5] = AXAssistiveTouchIconLocationBottomMiddle;
    uint64_t v11 = +[NSArray arrayWithObjects:v29 count:6];
    id v12 = +[HNDDeviceManager sharedManager];
    unsigned int v13 = [v12 mainDeviceIsMotionTracker];

    if (v13)
    {
      v28[0] = v5;
      v28[1] = v6;
      v28[2] = v7;
      v28[3] = v8;
      void v28[4] = v9;
      v28[5] = AXAssistiveTouchIconLocationBottomLeft;
      v28[6] = v10;
      v28[7] = AXAssistiveTouchIconLocationBottomRight;
      unsigned int v14 = +[NSArray arrayWithObjects:v28 count:8];

      if (!_AXSApplicationAccessibilityEnabled())
      {
        _AXSSetAccessibilityEnabled();
        _AXSApplicationAccessibilitySetEnabled();
      }
    }
    else
    {
      unsigned int v14 = v11;
    }
    unsigned __int8 v15 = AXAssistiveTouchScrollIcons();
    double v16 = +[NSMutableArray arrayWithArray:v15];

    if ((v13 & 1) == 0)
    {
      [v16 removeObject:AXAssistiveTouchIconTypeContinuousScrollHorizontal];
      [v16 removeObject:AXAssistiveTouchIconTypeContinuousScrollVertical];
      [v16 removeObject:AXAssistiveTouchIconTypeEyeTrackingBubbleMode];
      [v16 removeObject:AXAssistiveTouchIconTypeEyeTrackingAutoHide];
    }
    uint64_t v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_100051020;
    uint64_t v25 = &unk_1001AC2D8;
    uint64_t v26 = self;
    id v27 = v14;
    id v17 = v14;
    [v16 enumerateObjectsUsingBlock:&v22];
    long long v18 = [(HNDRocker *)self scrollItems];
    long long v19 = [(HNDRocker *)self _filteredItems:v18];
    [(HNDRocker *)self setScrollItems:v19];
  }
  rockerItems = self->_rockerItems;
  long long v21 = [(HNDRocker *)self scrollItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v21];
}

- (void)forceReloadScrollMenuItems
{
  [(HNDRocker *)self setScrollItems:0];

  [(HNDRocker *)self _loadScrollMenuItems];
}

- (void)_shortcutsDidUpdate
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchMainScreenCustomization];
  uint64_t v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = AXASTSiriShortcutPrefixName;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) hasPrefix:v9])
        {
          int v11 = 1;
          goto LABEL_11;
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int v11 = 0;
LABEL_11:

  id v12 = ASTLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412290;
    long long v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Shortcuts did update. Menu needs reload: %@", buf, 0xCu);
  }
  if (v11) {
    [(HNDRocker *)self _preloadInitialMenuItems];
  }
}

- (void)reloadDwellMenu
{
  [(HNDRocker *)self _preloadDwellMenuItems];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchMainScreenCustomization];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000513BC;
  v5[3] = &unk_1001AC300;
  v5[4] = &v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
  if (*((unsigned char *)v7 + 24)) {
    [(HNDRocker *)self _preloadInitialMenuItems];
  }

  _Block_object_dispose(&v6, 8);
}

- (void)_preloadDwellMenuItems
{
  id v3 = [objc_allocWithZone((Class)NSMutableArray) init];
  [(HNDRocker *)self setDwellItems:v3];

  if ([UIApp userInterfaceLayoutDirection] == (id)1)
  {
    uint64_t v15 = AXAssistiveTouchIconLocationMidRight;
    id v4 = (uint64_t *)&AXAssistiveTouchIconLocationMidLeft;
    uint64_t v5 = &v15;
  }
  else
  {
    uint64_t v14 = AXAssistiveTouchIconLocationMidLeft;
    id v4 = (uint64_t *)&AXAssistiveTouchIconLocationMidRight;
    uint64_t v5 = &v14;
  }
  uint64_t v6 = *v4;
  v5[1] = AXAssistiveTouchIconLocationTopMiddle;
  v5[2] = v6;
  v5[3] = AXAssistiveTouchIconLocationBottomMiddle;
  id v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
  uint64_t v8 = AXAssistiveTouchDwellIcons();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005160C;
  v12[3] = &unk_1001AC2D8;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v12];
  uint64_t v10 = [(HNDRocker *)self dwellItems];
  int v11 = [(HNDRocker *)self _filteredItems:v10];
  [(HNDRocker *)self setDwellItems:v11];
}

- (void)_loadDwellMenuItems
{
  id v3 = [(HNDRocker *)self dwellItems];

  if (!v3) {
    [(HNDRocker *)self _preloadDwellMenuItems];
  }
  rockerItems = self->_rockerItems;
  id v5 = [(HNDRocker *)self dwellItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v5];
}

- (void)_loadSecureIntentMenuItems
{
  confirmApplePayButton = self->_confirmApplePayButton;
  if (!confirmApplePayButton)
  {
    objc_initWeak(&location, self);
    id v4 = sub_100040EC8(@"APPLE_PAY_CONFIRM");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000518B8;
    v8[3] = &unk_1001AC0C0;
    objc_copyWeak(&v9, &location);
    LOBYTE(v7) = 0;
    id v5 = +[HNDRockerButton buttonWithTitle:v4 imageName:@"SCATIcon_device_faceID" downBlock:0 upBlock:v8 dataSource:self showWithGuidedAccess:0 showWithAssistiveAccess:v7];
    uint64_t v6 = self->_confirmApplePayButton;
    self->_confirmApplePayButton = v5;

    [(HNDRockerButton *)self->_confirmApplePayButton setLocation:AXAssistiveTouchIconLocationBottomMiddle];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    confirmApplePayButton = self->_confirmApplePayButton;
  }
  [(NSMutableArray *)self->_rockerItems addObject:confirmApplePayButton];
}

- (void)_loadSiriShortcutsMenuItems
{
  id v3 = +[AXSiriShortcutsManager sharedManager];
  id v4 = [v3 shortcuts];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_1000519FC;
  int v11 = &unk_1001AC350;
  id v12 = v3;
  id v13 = self;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "ax_mappedArrayUsingBlock:", &v8);
  id v7 = objc_msgSend(v6, "mutableCopy", v8, v9, v10, v11);

  [(HNDRocker *)self setSiriShortcutsItems:v7];
  [(NSMutableArray *)self->_rockerItems addObjectsFromArray:v7];
  [(HNDRocker *)self _assignLocationsToRockerItems];
}

- (void)_setRingerSwitchIcon:(id)a3
{
  id v7 = a3;
  if (sub_100040830()) {
    id v3 = @"MUTE";
  }
  else {
    id v3 = @"UNMUTE";
  }
  id v4 = sub_100040EC8(v3);
  if (AXDeviceHasStaccato())
  {
    id v5 = sub_100041058(@"ACTION_BUTTON");
    [v7 setTitle:v5];

    CFStringRef v6 = (const __CFString *)AXAssistiveTouchIconTypeActionButton;
  }
  else
  {
    [v7 setTitle:v4];
    if (sub_100040830()) {
      CFStringRef v6 = @"IconMuted";
    }
    else {
      CFStringRef v6 = @"IconUnmuted";
    }
  }
  [v7 setImageName:v6];
}

- (void)updateRingerSwitch
{
  id v3 = [(NSMutableArray *)self->_rockerItems indexOfObjectPassingTest:&stru_1001AC390];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [(NSMutableArray *)self->_rockerItems objectAtIndex:v3];
    if ([(HNDRocker *)self _replaceRingerWithOrientationLock]) {
      [(HNDRocker *)self _setRotationLockIcon:v4];
    }
    else {
      [(HNDRocker *)self _setRingerSwitchIcon:v4];
    }
  }
}

- (void)updateRotationLockSwitch
{
  id v3 = [(NSMutableArray *)self->_rockerItems axFilterObjectsUsingBlock:&stru_1001AC3D0];
  id v5 = [v3 firstObject];

  id v4 = v5;
  if (v5)
  {
    [(HNDRocker *)self _setRotationLockIcon:v5];
    id v4 = v5;
  }
}

- (void)_setRotationLockIcon:(id)a3
{
  id v8 = a3;
  id v3 = +[HNDEventManager sharedManager];
  unsigned int v4 = [v3 orientationLocked];

  if (v4) {
    CFStringRef v5 = @"IconRotationUnlock";
  }
  else {
    CFStringRef v5 = @"IconRotationLock";
  }
  if (v4) {
    CFStringRef v6 = @"ORIENTATION_UNLOCKED";
  }
  else {
    CFStringRef v6 = @"ORIENTATION_LOCKED";
  }
  [v8 setImageName:v5];
  id v7 = sub_100040EC8(v6);
  [v8 setTitle:v7];
}

- (void)_loadHardwareMenuItems
{
  id v3 = [(HNDRocker *)self hardwareItems];

  if (v3) {
    goto LABEL_13;
  }
  id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
  [(HNDRocker *)self setHardwareItems:v4];

  if ([(HNDRocker *)self _includeRingerButtonInHardware])
  {
    id v35 = AXAssistiveTouchIconLocationTopLeft;
    CFStringRef v5 = (void *)AXAssistiveTouchIconLocationTopRight;
    CFStringRef v6 = (void *)AXAssistiveTouchIconLocationMidLeft;
  }
  else
  {
    if (!AXDeviceHasStaccato())
    {
      id v35 = AXAssistiveTouchIconLocationTopMiddle;
      id v7 = AXAssistiveTouchIconLocationMidLeft;
      id v36 = AXAssistiveTouchIconLocationBottomLeft;
      id v9 = AXAssistiveTouchIconLocationBottomRight;
      uint64_t v10 = (void *)AXAssistiveTouchIconLocationMidRight;
      id v8 = (void *)AXAssistiveTouchIconLocationMidRight;
      goto LABEL_8;
    }
    id v35 = AXAssistiveTouchIconLocationTopLeft;
    CFStringRef v6 = (void *)AXAssistiveTouchIconLocationMidLeft;
    CFStringRef v5 = (void *)AXAssistiveTouchIconLocationTopRight;
  }
  id v7 = v5;
  id v36 = AXAssistiveTouchIconLocationBottomLeft;
  id v8 = (void *)AXAssistiveTouchIconLocationBottomRight;
  id v9 = v6;
  uint64_t v10 = (void *)AXAssistiveTouchIconLocationMidRight;
LABEL_8:
  id v11 = v8;
  id v12 = v10;
  id v13 = [(HNDRocker *)self hardwareItems];
  uint64_t v14 = [(HNDRocker *)self _rockerButtonForLocation:v7 buttonType:AXAssistiveTouchIconTypeRotateScreen];
  [v13 addObject:v14];

  objc_initWeak(location, self);
  double v34 = v7;
  if ([(HNDRocker *)self _includeRingerButtonInHardware])
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000524A4;
    v40[3] = &unk_1001AC0C0;
    objc_copyWeak(&v41, location);
    LOBYTE(v33) = 1;
    uint64_t v15 = +[HNDRockerButton buttonWithTitle:0 imageName:0 downBlock:0 upBlock:v40 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v33];
    [v15 setTag:100];
    [v15 setLocation:v12];
    long long v16 = [(HNDRocker *)self hardwareItems];
    [v16 addObject:v15];

    objc_destroyWeak(&v41);
  }
  else if (AXDeviceHasStaccato())
  {
    long long v17 = sub_100041058(@"ACTION_BUTTON");
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000524E8;
    v39[3] = &unk_1001AC328;
    v39[4] = self;
    LOBYTE(v33) = 1;
    long long v18 = +[HNDRockerButton buttonWithTitle:v17 imageName:AXAssistiveTouchIconTypeActionButton downBlock:0 upBlock:v39 dataSource:self showWithGuidedAccess:0 showWithAssistiveAccess:v33];

    [v18 setLocation:v12];
    long long v19 = [(HNDRocker *)self hardwareItems];
    [v19 addObject:v18];
  }
  long long v20 = sub_100040EC8(@"MORE");
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000524F0;
  v37[3] = &unk_1001AC0C0;
  objc_copyWeak(&v38, location);
  LOBYTE(v33) = 1;
  long long v21 = +[HNDRockerButton buttonWithTitle:v20 imageName:@"IconMore" downBlock:0 upBlock:v37 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v33];

  [v21 setTag:109];
  [v21 setLocation:v11];
  uint64_t v22 = [(HNDRocker *)self hardwareItems];
  [v22 addObject:v21];

  uint64_t v23 = [(HNDRocker *)self hardwareItems];
  uint64_t v24 = [(HNDRocker *)self _rockerButtonForLocation:v36 buttonType:AXAssistiveTouchIconTypeVolumeDown];
  [v23 addObject:v24];

  uint64_t v25 = [(HNDRocker *)self hardwareItems];
  uint64_t v26 = [(HNDRocker *)self _rockerButtonForLocation:v9 buttonType:AXAssistiveTouchIconTypeVolumeUp];
  [v25 addObject:v26];

  id v27 = [(HNDRocker *)self hardwareItems];
  id v28 = [(HNDRocker *)self _rockerButtonForLocation:v35 buttonType:AXAssistiveTouchIconTypeLockScreen];
  [v27 addObject:v28];

  id v29 = [(HNDRocker *)self hardwareItems];
  double v30 = [(HNDRocker *)self _filteredItems:v29];
  [(HNDRocker *)self setHardwareItems:v30];

  objc_destroyWeak(&v38);
  objc_destroyWeak(location);

LABEL_13:
  rockerItems = self->_rockerItems;
  uint64_t v32 = [(HNDRocker *)self hardwareItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v32];

  [(HNDRocker *)self updateRingerSwitch];
}

- (void)_customGesturePressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = AXAssistiveTouchIconTypeCustom;
  id v7 = a3;
  [(HNDRocker *)self updateForegroundImageForAction:v6];
  id v8 = +[HNDHandManager sharedManager];
  id v9 = [(HNDRocker *)self hardwareIdentifier];
  [v8 prepareGesture:v7 onDisplay:v9];

  if (v4)
  {
    id v11 = +[HNDHandManager sharedManager];
    uint64_t v10 = [(HNDRocker *)self hardwareIdentifier];
    [v11 performPreparedGestureOnDisplay:v10];
  }
}

- (void)_addFavoriteBoxPressed
{
  if (![(AXDispatchTimer *)self->_homeButtonDismissTimer isPending]
    || [(AXDispatchTimer *)self->_homeButtonDismissTimer isCancelled])
  {
    id v3 = +[AXSpringBoardServer server];
    unsigned int v4 = [v3 isControlCenterVisible];

    if (v4)
    {
      CFStringRef v5 = +[AXPISystemActionHelper sharedInstance];
      [v5 toggleControlCenter];
    }
    uint64_t v6 = +[AXSpringBoardServer server];
    unsigned int v7 = [v6 isNotificationCenterVisible];

    if (v7)
    {
      id v8 = +[AXSpringBoardServer server];
      [v8 toggleNotificationCenter];
    }
    id v9 = +[HNDEventManager sharedManager];
    [v9 openCreateCustomGestureForAST];

    homeButtonDismissTimer = self->_homeButtonDismissTimer;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005278C;
    v11[3] = &unk_1001AAA90;
    v11[4] = self;
    [(AXDispatchTimer *)homeButtonDismissTimer afterDelay:v11 processBlock:1.5];
  }
}

- (void)_loadFavoritesMenuItems
{
  [(NSMutableArray *)self->_rockerItems removeAllObjects];
  id v2 = [objc_allocWithZone((Class)NSMutableArray) init];
  if ([UIApp userInterfaceLayoutDirection] == (id)1)
  {
    id v3 = (uint64_t *)&AXAssistiveTouchIconLocationBottomLeft;
    unsigned int v4 = (uint64_t *)&AXAssistiveTouchIconLocationBottomRight;
    CFStringRef v5 = (uint64_t *)&AXAssistiveTouchIconLocationMidLeft;
    uint64_t v52 = AXAssistiveTouchIconLocationTopRight;
    uint64_t v6 = (uint64_t *)&AXAssistiveTouchIconLocationMidRight;
    unsigned int v7 = (uint64_t *)&AXAssistiveTouchIconLocationTopLeft;
    id v8 = &v52;
  }
  else
  {
    id v3 = (uint64_t *)&AXAssistiveTouchIconLocationBottomRight;
    unsigned int v4 = (uint64_t *)&AXAssistiveTouchIconLocationBottomLeft;
    CFStringRef v5 = (uint64_t *)&AXAssistiveTouchIconLocationMidRight;
    uint64_t v51 = AXAssistiveTouchIconLocationTopLeft;
    uint64_t v6 = (uint64_t *)&AXAssistiveTouchIconLocationMidLeft;
    unsigned int v7 = (uint64_t *)&AXAssistiveTouchIconLocationTopRight;
    id v8 = &v51;
  }
  uint64_t v9 = *v7;
  v8[1] = AXAssistiveTouchIconLocationTopMiddle;
  v8[2] = v9;
  uint64_t v10 = *v5;
  v8[3] = *v6;
  void v8[4] = v10;
  uint64_t v11 = AXAssistiveTouchIconLocationBottomMiddle;
  v8[5] = *v4;
  v8[6] = v11;
  v8[7] = *v3;
  id v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
  id v13 = +[HNDDeviceManager sharedManager];
  unsigned int v14 = [v13 mainDeviceIsMotionTracker];

  uint64_t v15 = [v12 firstObject];
  if (v14)
  {
    long long v16 = [(HNDRocker *)self _rockerButtonForLocation:v15 buttonType:AXAssistiveTouchIconTypePinch];
    [v2 addObject:v16];

    uint64_t v15 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v2, "count"));
    long long v17 = &AXAssistiveTouchIconTypeRotate;
  }
  else
  {
    long long v17 = &AXAssistiveTouchIconTypePinchAndRotate;
  }
  long long v18 = [(HNDRocker *)self _rockerButtonForLocation:v15 buttonType:*v17];
  [v2 addObject:v18];

  long long v19 = +[HNDHandManager sharedManager];
  id v41 = [v19 customGestures];

  long long v20 = (char *)[v2 count];
  if (&v20[(void)[v41 count]] <= (char *)7)
  {
    int v21 = AXForceTouchAvailableAndEnabled();
    uint64_t v22 = (id *)&AXAssistiveTouchIconTypeForceTap;
    if (!v21) {
      uint64_t v22 = (id *)&AXAssistiveTouchIconTypeLongPress;
    }
    id v23 = *v22;
    uint64_t v24 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v2, "count"));
    uint64_t v25 = [(HNDRocker *)self _rockerButtonForLocation:v24 buttonType:v23];
    [v2 addObject:v25];
  }
  uint64_t v26 = (char *)[v2 count];
  if (&v26[(void)[v41 count]] <= (char *)7)
  {
    id v27 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v2, "count"));
    id v28 = [(HNDRocker *)self _rockerButtonForLocation:v27 buttonType:AXAssistiveTouchIconTypeDoubleTap];
    [v2 addObject:v28];
  }
  id v29 = (char *)[v2 count];
  if (&v29[(void)[v41 count]] <= (char *)7)
  {
    double v30 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v2, "count"));
    id v31 = [(HNDRocker *)self _rockerButtonForLocation:v30 buttonType:AXAssistiveTouchIconTypeDragAndDrop];
    [v2 addObject:v31];
  }
  objc_initWeak(&location, self);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100052DF0;
  v45[3] = &unk_1001AC3F8;
  id v32 = v2;
  id v46 = v32;
  objc_copyWeak(&v49, &location);
  uint64_t v47 = self;
  id v33 = v12;
  id v48 = v33;
  [v41 enumerateObjectsUsingBlock:v45];
  double v34 = (char *)[v32 count];
  if ((unint64_t)v34 <= 7)
  {
    id v35 = v34 - 8;
    do
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100052FC8;
      v43[3] = &unk_1001AC0C0;
      objc_copyWeak(&v44, &location);
      LOBYTE(v40) = 0;
      id v36 = +[HNDRockerButton buttonWithTitle:&stru_1001B1E10 imageName:@"AddFavoritesBox" downBlock:0 upBlock:v43 dataSource:self showWithGuidedAccess:0 showWithAssistiveAccess:v40];
      [v36 setContinueHighlightAfterTouch:1];
      [v36 setIsEmptyFavorite:1];
      double v37 = objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v32, "count"));
      [v36 setLocation:v37];

      [v32 addObject:v36];
      objc_destroyWeak(&v44);
    }
    while (!__CFADD__(v35++, 1));
  }
  double v39 = [(HNDRocker *)self _filteredItems:v32];

  [(NSMutableArray *)self->_rockerItems addObjectsFromArray:v39];
  objc_destroyWeak(&v49);

  objc_destroyWeak(&location);
}

- (id)_filteredItems:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (CGSize)initialRockerSize
{
  +[AXAssistiveTouchLayoutView defaultSideLength];
  +[AXAssistiveTouchLayoutView layoutViewSideLengthScaledFromDefaultLength:"layoutViewSideLengthScaledFromDefaultLength:"];
  double v3 = v2;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (CGSize)nubbitSize
{
  int IsPad = AXDeviceIsPad();
  double v3 = 60.0;
  if (IsPad) {
    double v3 = 76.0;
  }
  double v4 = v3;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_setBackgroundWithType:(int)a3
{
  double y = CGPointZero.y;
  if (a3 == 1) {
    +[HNDRocker initialRockerSize];
  }
  else {
    +[HNDRocker nubbitSize];
  }
  -[UIVisualEffectView setFrame:](self->_backdropView, "setFrame:", CGPointZero.x, y, v6, v7);
  [(UIVisualEffectView *)self->_backdropView bounds];
  -[UIView setFrame:](self->_maskImageView, "setFrame:");
  [(UIVisualEffectView *)self->_backdropView setMaskView:self->_maskImageView];
  self->_backgroundType = a3;
}

- (void)_addNewButtonsToView
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = self->_rockerItems;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "setSelected:", 0, (void)v11);
        uint64_t v9 = [(UIVisualEffectView *)self->_backdropView contentView];
        [v9 addSubview:v8];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [(UIVisualEffectView *)self->_backdropView contentView];
  [v10 bringSubviewToFront:self->_middleCircle];
}

- (void)_centerBackButtonToView:(id)a3
{
  id v4 = a3;
  id v5 = [(HNDRocker *)self backButtonConstraints];

  if (v5)
  {
    uint64_t v6 = [(HNDRocker *)self backButtonConstraints];
    +[NSLayoutConstraint deactivateConstraints:v6];
  }
  if (v4)
  {
    long long v16 = [(HNDRockerButton *)self->_backButton imageView];
    double v7 = [v16 centerXAnchor];
    id v8 = [v4 centerXAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    v17[0] = v9;
    uint64_t v10 = [(HNDRockerButton *)self->_backButton imageView];
    long long v11 = [v10 centerYAnchor];
    long long v12 = [v4 centerYAnchor];
    long long v13 = [v11 constraintEqualToAnchor:v12];
    v17[1] = v13;
    long long v14 = +[NSArray arrayWithObjects:v17 count:2];
    [(HNDRocker *)self setBackButtonConstraints:v14];

    uint64_t v15 = [(HNDRocker *)self backButtonConstraints];
    +[NSLayoutConstraint activateConstraints:v15];
  }
  else
  {
    uint64_t v15 = ASTLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100114A08(v15);
    }
  }
}

- (void)_layoutMenuItemsInReverse:(BOOL)a3 oldRockers:(id)a4 animateToIcon:(id)a5 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  [v10 enumerateObjectsUsingBlock:&stru_1001AC438];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  void v35[2] = sub_100053758;
  v35[3] = &unk_1001AB1A8;
  id v12 = v10;
  id v36 = v12;
  double v37 = self;
  id v13 = v11;
  id v38 = v13;
  long long v14 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000537DC;
  v31[3] = &unk_1001AC4A0;
  id v15 = v12;
  id v32 = v15;
  id v33 = self;
  BOOL v34 = a6;
  long long v16 = objc_retainBlock(v31);
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = sub_100053858;
  id v28 = &unk_1001AAC78;
  id v29 = self;
  id v17 = v15;
  id v30 = v17;
  long long v18 = objc_retainBlock(&v25);
  if (v8)
  {
    LODWORD(v19) = 1048233745;
    LODWORD(v21) = 1061244476;
    LODWORD(v22) = 1065096357;
    LODWORD(v20) = 1048233745;
    id v23 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v19, v20, v21, v22, v25, v26, v27, v28, v29);
    uint64_t v24 = +[HNDSpringAnimationFactory factoryWithMass:0.5 stiffness:300.0 damping:400.0];
    [v24 setTimingFunction:v23];
    +[UIView _animateWithDuration:0 delay:v24 options:v14 factory:v16 animations:0.61 completion:0.0];
    +[UIView animateWithDuration:2 delay:v18 options:0 animations:0.2 completion:0.25];
  }
  else
  {
    ((void (*)(void *))v14[2])(v14);
    ((void (*)(void ***))v18[2])(v18);
    ((void (*)(void *, uint64_t))v16[2])(v16, 1);
  }
}

- (void)_layoutMenuItems:(BOOL)a3 oldRockers:(id)a4 viewForCenteringAtStart:(id)a5 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  [(HNDRocker *)self _addNewButtonsToView];
  if (self->_state != 1) {
    [(HNDRockerButton *)self->_backButton setSelected:0];
  }
  id v12 = [(UIVisualEffectView *)self->_backdropView contentView];
  [v12 bringSubviewToFront:self->_middleCircle];

  [v10 enumerateObjectsUsingBlock:&stru_1001AC4C0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100053CCC;
  v31[3] = &unk_1001AB1A8;
  id v13 = v10;
  id v32 = v13;
  id v33 = self;
  id v14 = v11;
  id v34 = v14;
  id v15 = objc_retainBlock(v31);
  uint64_t v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_100053DE8;
  id v27 = &unk_1001AC4A0;
  id v16 = v13;
  BOOL v30 = a6;
  id v28 = v16;
  id v29 = self;
  id v17 = objc_retainBlock(&v24);
  if (v8)
  {
    LODWORD(v18) = 1048233745;
    LODWORD(v20) = 1061244476;
    LODWORD(v21) = 1065096357;
    LODWORD(v19) = 1048233745;
    double v22 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v18, v19, v20, v21, v24, v25, v26, v27);
    id v23 = +[HNDSpringAnimationFactory factoryWithMass:0.5 stiffness:300.0 damping:400.0];
    [v23 setTimingFunction:v22];
    +[UIView _animateWithDuration:2 delay:v23 options:v15 factory:v17 animations:0.61 completion:0.0];
  }
  else
  {
    ((void (*)(void *))v15[2])(v15);
    ((void (*)(void ***, uint64_t))v17[2])(v17, 1);
  }
}

- (BOOL)activateMenuItemDown:(id)a3 fromButtonPress:(BOOL)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:AXAssistiveTouchIconTypeHome])
  {
    [(HNDRocker *)self _homeButton:1];
  }
  else if ([v5 isEqualToString:AXAssistiveTouchIconTypeLockScreen])
  {
    [(HNDRocker *)self _lockButton:1];
  }
  else if ([v5 isEqualToString:AXAssistiveTouchIconTypeVolumeUp])
  {
    [(HNDRocker *)self _volumeUp:1];
  }
  else
  {
    if (![v5 isEqualToString:AXAssistiveTouchIconTypeVolumeDown])
    {
      BOOL v7 = 0;
      goto LABEL_12;
    }
    [(HNDRocker *)self _volumeDown:1];
  }
  uint64_t v6 = ASTLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Activate menu item down: %@", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = 1;
LABEL_12:

  return v7;
}

- (BOOL)activateMenuItemUp:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeOrientation])
  {
    [(HNDRocker *)self _rotationLockPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeOpenMenu])
  {
    BOOL v7 = [(HNDRocker *)self displayManager];
    [v7 showMenu:1];
LABEL_5:

    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeNotificationCenter])
  {
    [(HNDRocker *)self _notificationCenterPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeControlCenter])
  {
    [(HNDRocker *)self _controlCenterPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeHome])
  {
    [(HNDRocker *)self _homeButton:0];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSiri])
  {
    if (j__AXDeviceIsSiriAvailable()) {
      [(HNDRocker *)self _siriButtonPressed];
    }
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeTypeToSiri])
  {
    if (j__AXDeviceIsSiriAvailable()) {
      [(HNDRocker *)self _typeToSiriButtonPressed];
    }
    goto LABEL_12;
  }
  uint64_t v11 = AXAssistiveTouchIconTypeVoiceControl;
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeVoiceControl])
  {
    if (!j__AXDeviceIsVoiceControlAvailable()) {
      goto LABEL_12;
    }
LABEL_24:
    [(HNDRocker *)self _voiceControlPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeCommandAndControl])
  {
    [(HNDRocker *)self _commandAndControlPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeLockScreen])
  {
    [(HNDRocker *)self _lockButton:0];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeVolumeUp])
  {
    [(HNDRocker *)self _volumeUp:0];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeVolumeDown])
  {
    [(HNDRocker *)self _volumeDown:0];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeMute])
  {
    [(HNDRocker *)self _ringerPressed:1];
    goto LABEL_12;
  }
  if (AXDeviceHasStaccato()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeActionButton])
  {
    [(HNDRocker *)self _actionButtonPressed];
    goto LABEL_12;
  }
  if (AXDeviceSupportsCameraButton()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeCameraButton])
  {
    [(HNDRocker *)self _cameraButtonPressed];
    goto LABEL_12;
  }
  if (AXDeviceSupportsCameraButton()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeCameraButtonLightPress])
  {
    [(HNDRocker *)self _cameraButtonLightPressed];
    goto LABEL_12;
  }
  if (AXDeviceSupportsCameraButton()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeCameraButtonDoubleLightPress])
  {
    [(HNDRocker *)self _cameraButtonDoubleLightPressed];
    goto LABEL_12;
  }
  if (AXDeviceSupportsCameraButton()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeVisualIntelligence])
  {
    [(HNDRocker *)self _openVisualIntelligence];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeShake])
  {
    [(HNDRocker *)self _shakePressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeAppSwitcher])
  {
    [(HNDRocker *)self _toggleAppSwitcher];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScreenshot])
  {
    [(HNDRocker *)self _screenshotPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeHoverTextTyping])
  {
    [(HNDRocker *)self _toggleHoverTextTyping];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeTrackpad])
  {
    [(HNDRocker *)self _trackpadPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:v11]) {
    goto LABEL_24;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypePinch])
  {
    id v12 = self;
    uint64_t v13 = 1;
LABEL_67:
    [(HNDRocker *)v12 _pinchPressed:0 mode:v13];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeRotate])
  {
    id v12 = self;
    uint64_t v13 = 0;
    goto LABEL_67;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypePinchAndRotate])
  {
    id v12 = self;
    uint64_t v13 = 2;
    goto LABEL_67;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeTap])
  {
LABEL_69:
    [(HNDRocker *)self _tapPressed:0 fromButtonPress:v4];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDoubleTap])
  {
    [(HNDRocker *)self _doubleTapPressed:0 fromButtonPress:v4];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeLongPress])
  {
    [(HNDRocker *)self _longPressPressed:0 fromButtonPress:v4];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDragAndDrop])
  {
    id v14 = self;
    BOOL v15 = v4;
    uint64_t v16 = 0;
LABEL_78:
    [(HNDRocker *)v14 _dragAndDropPressed:0 fromButtonPress:v15 dragMenu:v16];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeMoveMenu])
  {
    id v14 = self;
    BOOL v15 = v4;
    uint64_t v16 = 1;
    goto LABEL_78;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSpotlight])
  {
    [(HNDRocker *)self _spotlightPressed:0];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeTripleClick])
  {
    [(HNDRocker *)self _tripleClickHomePressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeForceTap])
  {
    [(HNDRocker *)self _orbPressed:0 fromButtonPress:v4];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSOS])
  {
    [(HNDRocker *)self _sosPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDetectionMode])
  {
    [(HNDRocker *)self _detectionModePresssed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeWatchRemoteScreen])
  {
    [(HNDRocker *)self _watchRemoteScreenPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeBackgroundSounds])
  {
    [(HNDRocker *)self _backgroundSoundsPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeLiveCaptions])
  {
    [(HNDRocker *)self _liveCaptionsPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDimFlashingLights])
  {
    [(HNDRocker *)self _dimFlashingLightsPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeHapticMusic])
  {
    [(HNDRocker *)self _hapticMusicPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeMotionCues])
  {
    [(HNDRocker *)self _motionCuesPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeLiveSpeech])
  {
    [(HNDRocker *)self _liveSpeechPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeNearbyDeviceControl])
  {
    [(HNDRocker *)self _nearbyDeviceControlPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSysdiagnose])
  {
    [(HNDRocker *)self _sysdiagnosePressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeRebootDevice])
  {
    [(HNDRocker *)self _rebootDevicePressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeReachability])
  {
    [(HNDRocker *)self _reachabilityPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSpeakScreen])
  {
    [(HNDRocker *)self _speakScreenPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeToggleDock])
  {
    [(HNDRocker *)self _dockPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeArmApplePay])
  {
    [(HNDRocker *)self _applePayButtonPressed:0];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDwellResume])
  {
    id v17 = self;
    uint64_t v18 = 0;
LABEL_121:
    [(HNDRocker *)v17 _toggleDwellControlPause:v18];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDwellPause])
  {
    id v17 = self;
    uint64_t v18 = 1;
    goto LABEL_121;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDwellPauseToggle])
  {
    BOOL v7 = +[HNDHandManager sharedManager];
    -[HNDRocker _toggleDwellControlPause:](self, "_toggleDwellControlPause:", [v7 dwellControlPaused] ^ 1);
    goto LABEL_5;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDwellLock])
  {
    double v19 = self;
    uint64_t v20 = 1;
LABEL_130:
    [(HNDRocker *)v19 _lockDwellControlAction:v20];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDwellUnlock])
  {
    double v19 = self;
    uint64_t v20 = 0;
    goto LABEL_130;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDwellLockToggle])
  {
    double v21 = +[HNDHandManager sharedManager];
    id v22 = [v21 dwellControlAutorevertEnabled];

    double v19 = self;
    uint64_t v20 = (uint64_t)v22;
    goto LABEL_130;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDwellClick]) {
    goto LABEL_69;
  }
  uint64_t v23 = AXAssistiveTouchIconTypeDwellIncreaseTime;
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDwellIncreaseTime])
  {
    [(HNDRocker *)self _increaseDwellTimePressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:v23])
  {
    [(HNDRocker *)self _decreaseDwellTimePressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollUp])
  {
    uint64_t v24 = self;
    BOOL v25 = v4;
    uint64_t v26 = 1;
LABEL_142:
    uint64_t v27 = 0;
LABEL_146:
    uint64_t v28 = 0;
LABEL_147:
    [(HNDRocker *)v24 _scrollPressed:0 fromButtonPress:v25 vertical:v26 forward:v27 max:v28];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollDown])
  {
    uint64_t v24 = self;
    BOOL v25 = v4;
    uint64_t v26 = 1;
LABEL_145:
    uint64_t v27 = 1;
    goto LABEL_146;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollLeft])
  {
    uint64_t v24 = self;
    BOOL v25 = v4;
    uint64_t v26 = 0;
    goto LABEL_142;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollRight])
  {
    uint64_t v24 = self;
    BOOL v25 = v4;
    uint64_t v26 = 0;
    goto LABEL_145;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollToTop])
  {
    uint64_t v24 = self;
    BOOL v25 = v4;
    uint64_t v26 = 1;
    uint64_t v27 = 0;
LABEL_152:
    uint64_t v28 = 1;
    goto LABEL_147;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollToBottom])
  {
    uint64_t v24 = self;
    BOOL v25 = v4;
    uint64_t v26 = 1;
    uint64_t v27 = 1;
    goto LABEL_152;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeContinuousScrollHorizontal])
  {
    id v29 = self;
    BOOL v30 = v4;
    uint64_t v31 = 1;
LABEL_157:
    [(HNDRocker *)v29 _continuousScrollPressed:0 fromButtonPress:v30 inDirection:v31 iconType:v6];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeContinuousScrollVertical])
  {
    id v29 = self;
    BOOL v30 = v4;
    uint64_t v31 = 0;
    goto LABEL_157;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeEyeTrackingBubbleMode])
  {
    [(HNDRocker *)self _bubbleModeToggled];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeEyeTrackingAutoHide])
  {
    [(HNDRocker *)self _autoHideForEyeTrackingToggled];
    goto LABEL_12;
  }
  if (AXDeviceSupportsOnDeviceEyeTracking()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeCalibrateOnDeviceEyeTracking])
  {
    [(HNDRocker *)self _calibrateEyeTrackingPressed];
    goto LABEL_12;
  }
  if (AXDeviceSupportsOnDeviceEyeTracking()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeOnDeviceEyeTrackingZoomScreen])
  {
    [(HNDRocker *)self _toggleNeedsToShowZoomWindow];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeAssistiveAccess])
  {
    [(HNDRocker *)self _toggleAssistiveAccess];
    goto LABEL_12;
  }
  uint64_t v32 = AXAssistiveTouchIconTypeCamera;
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeCamera])
  {
    [(HNDRocker *)self _cameraPressed];
    goto LABEL_12;
  }
  if ([v6 isEqualToString:v32])
  {
    [(HNDRocker *)self _frontFacingCameraPressed];
    goto LABEL_12;
  }
  if ([v6 hasPrefix:@"CustomGesture-"])
  {
    id v33 = [v6 stringByReplacingOccurrencesOfString:@"CustomGesture-" withString:&stru_1001B1E10];
    id v34 = +[HNDHandManager sharedManager];
    id v35 = [v34 customGestures];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v35;
    id v36 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v54;
      while (2)
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v41 = [v40 name];
          unsigned int v42 = [v41 isEqualToString:v33];

          if (v42)
          {
            [(HNDRocker *)self _customGesturePressed:v40 fromButtonPress:v4];
            goto LABEL_187;
          }
        }
        id v37 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }
LABEL_187:

    goto LABEL_188;
  }
  uint64_t v43 = AXASTSiriShortcutPrefixName;
  if ([v6 hasPrefix:AXASTSiriShortcutPrefixName])
  {
    id v44 = +[NSString stringWithFormat:@"%@-", v43];
    id v45 = (char *)[v6 rangeOfString:v44];
    id v33 = [v6 substringFromIndex:&v45[v46]];

    uint64_t v47 = +[AXSiriShortcutsManager sharedManager];
    id v48 = [v47 shortcutForIdentifier:v33];

    id v49 = +[AXSiriShortcutsManager sharedManager];
    [v49 performShortcut:v48];

    [(HNDRocker *)self _menuExited];
LABEL_188:

    goto LABEL_12;
  }
  if (![v6 isEqualToString:AXAssistiveTouchIconTypePassThroughToApp])
  {
    BOOL v9 = 0;
    goto LABEL_15;
  }
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100054F34;
  v52[3] = &unk_1001AAA90;
  v52[4] = self;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100054F7C;
  v51[3] = &unk_1001AACE0;
  v51[4] = self;
  +[UIView animateWithDuration:v52 animations:v51 completion:0.15];
LABEL_12:
  [(HNDRocker *)self setLastMenuItemActivated:v6];
  BOOL v8 = ASTLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v58 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Activate menu item up: %@", buf, 0xCu);
  }

  BOOL v9 = 1;
LABEL_15:

  return v9;
}

- (void)showNubbitPressedState:(BOOL)a3
{
  double v3 = 0.65;
  if (!a3) {
    double v3 = 1.0;
  }
  [(HNDRocker *)self setAlpha:v3];
}

- (BOOL)customizationMapAllowInstanceActivation:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)1)
  {
    BOOL v4 = AXAssistiveTouchLocationsForLayout();
    id v5 = [v4 firstObject];
    id v6 = [v3 objectForKeyedSubscript:v5];

    if (!v6
      || ([v6 isEqualToString:AXAssistiveTouchIconTypeCustom] & 1) != 0
      || ([v6 isEqualToString:AXAssistiveTouchIconTypeDevice] & 1) != 0
      || ([v6 isEqualToString:AXAssistiveTouchIconTypeGestures] & 1) != 0
      || ([v6 isEqualToString:AXAssistiveTouchIconTypeOrientation] & 1) != 0
      || ([v6 isEqualToString:AXAssistiveTouchIconTypeSideApp] & 1) != 0)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      unsigned int v7 = [v6 isEqualToString:AXAssistiveTouchIconTypeRotateScreen] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_rockerItemsByLocation
{
  id v3 = +[NSMutableDictionary dictionaryWithCapacity:[(NSMutableArray *)self->_rockerItems count]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = self->_rockerItems;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "location", (void)v12);
        [v3 setObject:v9 forKeyedSubscript:v10];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_layoutButtonsWithViewForCenteringAtStart:(id)a3 includingBackButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(HNDRocker *)self _setBackgroundWithType:1];
  uint64_t v7 = [(HNDRocker *)self _rockerItemsByLocation];
  BOOL v8 = v7;
  BOOL v9 = "de";
  if (v6)
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100055BE8;
    v59[3] = &unk_1001AC528;
    v59[4] = self;
    id v60 = v7;
    id v61 = v6;
    BOOL v62 = v4;
    +[UIView performWithoutAnimation:v59];
  }
  id v10 = &selRef_didDisconnectAsForwarderFromDeviceWithName_;
  if (self->_state != 2) {
    goto LABEL_11;
  }
  if ([(NSMutableArray *)self->_rockerItems count] == (id)6)
  {
    layoutView = self->_layoutView;
    v77[0] = AXAssistiveTouchIconLocationTopLeft;
    uint64_t v11 = AXAssistiveTouchIconLocationTopLeft;
    uint64_t v52 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.331, 0.127);
    v78[0] = v52;
    uint64_t v12 = AXAssistiveTouchIconLocationTopRight;
    v77[1] = AXAssistiveTouchIconLocationTopRight;
    uint64_t v51 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.669, 0.127);
    v78[1] = v51;
    BOOL v53 = v4;
    v77[2] = AXAssistiveTouchIconLocationMidLeft;
    uint64_t v13 = AXAssistiveTouchIconLocationMidLeft;
    uint64_t v36 = AXAssistiveTouchIconLocationMidLeft;
    uint64_t v49 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.161, 0.475);
    v78[2] = v49;
    long long v56 = v8;
    uint64_t v14 = AXAssistiveTouchIconLocationMidRight;
    v77[3] = AXAssistiveTouchIconLocationMidRight;
    id v45 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.854, 0.475);
    v78[3] = v45;
    uint64_t v15 = AXAssistiveTouchIconLocationBottomLeft;
    void v77[4] = AXAssistiveTouchIconLocationBottomLeft;
    uint64_t v43 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.331, 0.753);
    v78[4] = v43;
    uint64_t v16 = AXAssistiveTouchIconLocationBottomRight;
    v77[5] = AXAssistiveTouchIconLocationBottomRight;
    id v41 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.669, 0.753);
    v78[5] = v41;
    uint64_t v38 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:6];
    v75[0] = v11;
    v75[1] = v12;
    uint64_t v40 = +[NSArray arrayWithObjects:v75 count:2];
    v76[0] = v40;
    v74[0] = v13;
    v74[1] = v14;
    double v39 = +[NSArray arrayWithObjects:v74 count:2];
    v76[1] = v39;
    v73[0] = v15;
    v73[1] = v16;
    id v37 = +[NSArray arrayWithObjects:v73 count:2];
    v76[2] = v37;
    id v35 = +[NSArray arrayWithObjects:v76 count:3];
    v71[0] = v11;
    v71[1] = v15;
    uint64_t v17 = v11;
    uint64_t v18 = +[NSArray arrayWithObjects:v71 count:2];
    v72[0] = v18;
    v70[0] = v12;
    v70[1] = v16;
    double v19 = +[NSArray arrayWithObjects:v70 count:2];
    v72[1] = v19;
    uint64_t v20 = +[NSArray arrayWithObjects:v72 count:2];
    v69[0] = v17;
    v69[1] = v12;
    v69[2] = v14;
    v69[3] = v14;
    v69[4] = v16;
    v69[5] = v15;
    v69[6] = v36;
    v69[7] = v36;
    BOOL v4 = v53;
    BOOL v8 = v56;
    double v21 = +[NSArray arrayWithObjects:v69 count:8];
    [(AXAssistiveTouchLayoutView *)layoutView layoutItemsByLocation:v56 positions:v38 rows:v35 columns:v20 clockwiseOctagonalLocations:v21 horizontallyCenteredLocation:0];

    id v10 = &selRef_didDisconnectAsForwarderFromDeviceWithName_;
    id v22 = (void *)v49;
    goto LABEL_8;
  }
  if ([(NSMutableArray *)self->_rockerItems count] == (id)5)
  {
    CGRect v50 = self->_layoutView;
    uint64_t v57 = v8;
    uint64_t v23 = AXAssistiveTouchIconLocationTopMiddle;
    v67[0] = AXAssistiveTouchIconLocationTopMiddle;
    uint64_t v52 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.5, 0.127);
    v68[0] = v52;
    id v55 = v6;
    uint64_t v24 = AXAssistiveTouchIconLocationMidLeft;
    v67[1] = AXAssistiveTouchIconLocationMidLeft;
    uint64_t v51 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.161, 0.475);
    v68[1] = v51;
    BOOL v54 = v4;
    uint64_t v25 = AXAssistiveTouchIconLocationMidRight;
    v67[2] = AXAssistiveTouchIconLocationMidRight;
    uint64_t v48 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.854, 0.475);
    v68[2] = v48;
    uint64_t v26 = AXAssistiveTouchIconLocationBottomLeft;
    v67[3] = AXAssistiveTouchIconLocationBottomLeft;
    uint64_t v46 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.331, 0.753);
    v68[3] = v46;
    uint64_t v27 = AXAssistiveTouchIconLocationBottomRight;
    v67[4] = AXAssistiveTouchIconLocationBottomRight;
    id v44 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.669, 0.753);
    v68[4] = v44;
    unsigned int v42 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:5];
    v65[0] = v24;
    v65[1] = v25;
    uint64_t v28 = +[NSArray arrayWithObjects:v65 count:2];
    v66[0] = v28;
    v64[0] = v26;
    v64[1] = v27;
    id v29 = +[NSArray arrayWithObjects:v64 count:2];
    v66[1] = v29;
    BOOL v30 = +[NSArray arrayWithObjects:v66 count:2];
    v63[0] = v23;
    v63[1] = v23;
    v63[2] = v25;
    v63[3] = v25;
    BOOL v4 = v54;
    v63[4] = v27;
    v63[5] = v26;
    v63[6] = v24;
    v63[7] = v24;
    id v6 = v55;
    id v10 = &selRef_didDisconnectAsForwarderFromDeviceWithName_;
    uint64_t v31 = +[NSArray arrayWithObjects:v63 count:8];
    uint64_t v32 = v23;
    BOOL v8 = v57;
    [(AXAssistiveTouchLayoutView *)v50 layoutItemsByLocation:v57 positions:v42 rows:v30 columns:&__NSArray0__struct clockwiseOctagonalLocations:v31 horizontallyCenteredLocation:v32];

    id v22 = (void *)v48;
LABEL_8:

    BOOL v9 = "wasSnappedInBubbleMode" + 20;
    if (!v4) {
      goto LABEL_13;
    }
LABEL_12:
    id v33 = [(UIVisualEffectView *)self->_backdropView contentView];
    [(HNDRocker *)self _centerBackButtonToView:v33];

    goto LABEL_13;
  }
  if (_AXSMossdeepEnabled())
  {
LABEL_11:
    [(AXAssistiveTouchLayoutView *)self->_layoutView layoutItemsByLocation:v8 hasBackButton:[(HNDRocker *)self _backButtonShouldBeHidden] ^ 1];
    if (!v4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  _AXAssert();
  if (v4) {
    goto LABEL_12;
  }
LABEL_13:
  [(HNDRocker *)self layoutIfNeeded];
  id v34 = *(Class *)((char *)&self->super.super.super.super.isa + *((int *)v10 + 770));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = *((void *)v9 + 136);
  v58[2] = sub_100055C68;
  v58[3] = &unk_1001AC550;
  v58[4] = self;
  [v34 enumerateObjectsUsingBlock:v58];
  if (v4) {
    [(HNDRocker *)self _updateBackButtonVisibility];
  }
}

- (void)setUseCircleMode:(BOOL)a3
{
  self->_useCircle = a3;
}

- (void)_resetHoverCircleLocation
{
  [(HNDRocker *)self bounds];
  AX_CGRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  [(AXPIFingerView *)self->_middleCircle frame];
  double v9 = sub_1000407A8(v4 - v7 * 0.5, v6 - v8 * 0.5);
  middleCircle = self->_middleCircle;

  [(AXPIFingerView *)middleCircle setFrame:v9];
}

- (void)_updateKeyboardFocusIfNeeded
{
  if (_AXSFullKeyboardAccessEnabled())
  {
    [(HNDRocker *)self setNeedsFocusUpdate];
    [(HNDRocker *)self updateFocusIfNeeded];
  }
}

- (void)_loadMenuItems:(BOOL)a3 viewForCenteringAtStart:(id)a4 goBackwards:(BOOL)a5 originalState:(int64_t)a6
{
}

- (void)_loadMenuItems:(BOOL)a3 viewForCenteringAtStart:(id)a4 goBackwards:(BOOL)a5 originalState:(int64_t)a6 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a3;
  id v12 = a4;
  [(AXPIFingerView *)self->_middleCircle setSelected:1];
  [(HNDRockerButton *)self->_selectedButton setSelected:0];
  selectedButton = self->_selectedButton;
  self->_selectedButton = 0;

  if (!v9)
  {
    id v14 = [(NSMutableArray *)self->_stackState count];
    if (a6 != 1 || v14 != (id)1)
    {
      uint64_t v15 = [(NSMutableArray *)self->_stackState lastObject];
      uint64_t v16 = (int)[v15 intValue];

      if (v16 != a6)
      {
        stackState = self->_stackState;
        uint64_t v18 = +[NSNumber numberWithInteger:a6];
        [(NSMutableArray *)stackState addObject:v18];
      }
    }
  }
  [(HNDRocker *)self showVolumeBar:0 withProgress:0.0];
  id v19 = [(NSMutableArray *)self->_rockerItems copy];
  [(NSMutableArray *)self->_rockerItems removeAllObjects];
  switch(self->_state)
  {
    case 1:
      [(HNDRocker *)self _loadInitialMenuItems];
      break;
    case 2:
      [(HNDRocker *)self _loadHardwareMenuItems];
      break;
    case 3:
      [(HNDRocker *)self _loadFavoritesMenuItems];
      break;
    case 4:
      [(HNDRocker *)self _loadRotateMenuItems];
      break;
    case 5:
      [(HNDRocker *)self _loadGesturesMenuItems];
      break;
    case 6:
      [(HNDRocker *)self _loadMoreMenuItems];
      break;
    case 7:
      [(HNDRocker *)self _loadSideAppMenuItems];
      break;
    case 8:
      [(HNDRocker *)self _loadSideAppMoreMenuItems];
      break;
    case 9:
      [(HNDRocker *)self _loadScrollMenuItems];
      break;
    case 0xALL:
      [(HNDRocker *)self _loadDwellMenuItems];
      break;
    case 0xBLL:
      [(HNDRocker *)self _loadSecureIntentMenuItems];
      break;
    case 0xCLL:
      [(HNDRocker *)self _loadSiriShortcutsMenuItems];
      break;
    default:
      break;
  }
  uint64_t v20 = +[AXBackBoardServer server];
  unsigned __int8 v21 = [v20 isGuidedAccessActive];

  char v22 = AXAssistiveAccessEnabled();
  rockerItems = self->_rockerItems;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100056234;
  v31[3] = &unk_1001AC570;
  unsigned __int8 v32 = v21;
  char v33 = v22;
  [(NSMutableArray *)rockerItems enumerateObjectsUsingBlock:v31];
  if (qword_1001F0A80 != -1) {
    dispatch_once(&qword_1001F0A80, &stru_1001AC590);
  }
  uint64_t v24 = +[AXSpringBoardServer server];
  unsigned __int8 v25 = [v24 isPurpleBuddyAppFrontmost];

  uint64_t v26 = self->_rockerItems;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000563F8;
  v29[3] = &unk_1001AC5B0;
  unsigned __int8 v30 = v25;
  [(NSMutableArray *)v26 enumerateObjectsUsingBlock:v29];
  if (v9)
  {
    [(HNDRocker *)self _addNewButtonsToView];
    if ((unint64_t)(a6 - 2) >= 0xB)
    {
      _AXAssert();
    }
    else
    {
      uint64_t v27 = [(HNDRocker *)self animationEndButtonForButtonTag:dword_1001977B0[a6 - 2]];
      if (v27)
      {
LABEL_28:
        -[HNDRocker _removeAllAnimations:](self, "_removeAllAnimations:", 1, v28);
        [(HNDRocker *)self _layoutMenuItemsInReverse:v10 oldRockers:v19 animateToIcon:v27 shouldUpdateKeyboardFocusIfNeeded:v7];

        goto LABEL_29;
      }
    }
    uint64_t v28 = +[NSNumber numberWithInteger:a6];
    _AXAssert();

    uint64_t v27 = 0;
    goto LABEL_28;
  }
  [(HNDRocker *)self _removeAllAnimations:1];
  [(HNDRocker *)self _layoutMenuItems:v10 oldRockers:v19 viewForCenteringAtStart:v12 shouldUpdateKeyboardFocusIfNeeded:v7];
LABEL_29:
  [(HNDRocker *)self _resetHoverCircleLocation];
  [(NSMutableArray *)self->_rockerItems enumerateObjectsUsingBlock:&stru_1001AC5F0];
  [(HNDRocker *)self _updateSelectedButton];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (id)animationEndButtonForButtonTag:(int)a3
{
  rockerItems = self->_rockerItems;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100056568;
  v8[3] = &unk_1001AC610;
  int v9 = a3;
  id v5 = [(NSMutableArray *)rockerItems indexOfObjectPassingTest:v8];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    _AXAssert();
    id v5 = 0;
  }
  double v6 = [(NSMutableArray *)self->_rockerItems objectAtIndex:v5];

  return v6;
}

- (void)_customsPressed:(id)a3
{
  self->_int64_t state = 3;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_gesturesPressed:(id)a3
{
  self->_int64_t state = 5;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_scrollPressed:(id)a3
{
  self->_int64_t state = 9;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_dwellPressed:(id)a3
{
  self->_int64_t state = 10;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_siriShortcutsMenuPressed:(id)a3
{
  self->_int64_t state = 12;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_pushMenuItemsFromSender:(id)a3
{
}

- (void)_applePayButtonPressed:(id)a3
{
  id v6 = a3;
  if (v6
    && sub_1000408D0()
    && (+[HNDSecureIntentManager sharedInstance],
        double v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 waitingForSecureIntent],
        v4,
        v5))
  {
    self->_int64_t state = 11;
    [(HNDRocker *)self _pushMenuItemsFromSender:v6];
  }
  else
  {
    [(HNDRocker *)self _armApplePay];
  }
}

- (CGPoint)_initialPointForGesture
{
  double v3 = +[HNDDeviceManager sharedManager];
  unsigned int v4 = [v3 mainDeviceIsPointer];

  if (!v4
    || ((+[HNDHandManager sharedManager],
         unsigned int v5 = objc_claimAutoreleasedReturnValue(),
         [v5 currentPointForPointer],
         double v7 = v6,
         double v9 = v8,
         v5,
         v7 == CGPointZero.x)
      ? (BOOL v10 = v9 == CGPointZero.y)
      : (BOOL v10 = 0),
        v10))
  {
    if (self->_style)
    {
      [(AXPIFingerView *)self->_middleCircle frame];
      AX_CGRectGetCenter();
      double v12 = v11;
      double v14 = v13;
      uint64_t v15 = [(HNDRocker *)self superview];
      -[HNDRocker convertPoint:toView:](self, "convertPoint:toView:", v15, v12, v14);
      double v7 = v16;
      double v9 = v17;
    }
    else
    {
      uint64_t v18 = [(HNDRocker *)self window];
      [v18 bounds];
      double MidX = CGRectGetMidX(v28);
      uint64_t v20 = [(HNDRocker *)self window];
      [v20 bounds];
      double MidY = CGRectGetMidY(v29);

      uint64_t v15 = [(HNDRocker *)self window];
      char v22 = [(HNDRocker *)self superview];
      objc_msgSend(v15, "convertPoint:toView:", v22, MidX, MidY);
      double v7 = v23;
      double v9 = v24;
    }
  }
  double v25 = v7;
  double v26 = v9;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (void)_orbPressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  [(HNDRocker *)self updateForegroundImageForAction:AXAssistiveTouchIconTypeForceTap];
  [(HNDRocker *)self _initialPointForGesture];
  +[AXNamedReplayableGesture forceTouchGestureAtPoint:](AXNamedReplayableGesture, "forceTouchGestureAtPoint:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  double v6 = +[HNDHandManager sharedManager];
  double v7 = [(HNDRocker *)self hardwareIdentifier];
  [v6 prepareGesture:v10 onDisplay:v7];

  if (v4)
  {
    double v8 = +[HNDHandManager sharedManager];
    double v9 = [(HNDRocker *)self hardwareIdentifier];
    [v8 performPreparedGestureOnDisplay:v9];
  }
}

- (void)_longPressPressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  [(HNDRocker *)self updateForegroundImageForAction:AXAssistiveTouchIconTypeLongPress];
  [(HNDRocker *)self _initialPointForGesture];
  +[AXNamedReplayableGesture longPressGestureAtPoint:](AXNamedReplayableGesture, "longPressGestureAtPoint:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  double v6 = +[HNDHandManager sharedManager];
  double v7 = [(HNDRocker *)self hardwareIdentifier];
  [v6 prepareGesture:v10 onDisplay:v7];

  if (v4)
  {
    double v8 = +[HNDHandManager sharedManager];
    double v9 = [(HNDRocker *)self hardwareIdentifier];
    [v8 performPreparedGestureOnDisplay:v9];
  }
}

- (void)_tapPressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  [(HNDRocker *)self updateForegroundImageForAction:AXAssistiveTouchIconTypeDwellClick];
  [(HNDRocker *)self _initialPointForGesture];
  +[AXNamedReplayableGesture tapGestureAtPoint:isDoubleTap:numberOfFingers:](AXNamedReplayableGesture, "tapGestureAtPoint:isDoubleTap:numberOfFingers:", 0, 1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  double v6 = +[HNDHandManager sharedManager];
  double v7 = [(HNDRocker *)self hardwareIdentifier];
  [v6 prepareGesture:v10 onDisplay:v7];

  if (v4)
  {
    double v8 = +[HNDHandManager sharedManager];
    double v9 = [(HNDRocker *)self hardwareIdentifier];
    [v8 performPreparedGestureOnDisplay:v9];
  }
}

- (void)_doubleTapPressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  [(HNDRocker *)self updateForegroundImageForAction:AXAssistiveTouchIconTypeDoubleTap];
  [(HNDRocker *)self _initialPointForGesture];
  +[AXNamedReplayableGesture tapGestureAtPoint:isDoubleTap:numberOfFingers:](AXNamedReplayableGesture, "tapGestureAtPoint:isDoubleTap:numberOfFingers:", 1, 1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  double v6 = +[HNDHandManager sharedManager];
  double v7 = [(HNDRocker *)self hardwareIdentifier];
  [v6 prepareGesture:v10 onDisplay:v7];

  if (v4)
  {
    double v8 = +[HNDHandManager sharedManager];
    double v9 = [(HNDRocker *)self hardwareIdentifier];
    [v8 performPreparedGestureOnDisplay:v9];
  }
}

- (void)_dragAndDropPressed:(id)a3 fromButtonPress:(BOOL)a4 dragMenu:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v5 && !self->_isNubbitVisible)
  {
    uint64_t v20 = ASTLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned __int8 v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Skipping _dragAndDropPressed w/ dragMenu because nubbit is not visible", v21, 2u);
    }
  }
  else
  {
    if (v5) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = AXAssistiveTouchIconTypeDragAndDrop;
    }
    [(HNDRocker *)self updateForegroundImageForAction:v9];
    [(HNDRocker *)self _initialPointForGesture];
    double v11 = v10;
    double v13 = v12;
    double v14 = +[HNDHandManager sharedManager];
    unsigned int v15 = [v14 inDragMode];

    double v16 = +[HNDHandManager sharedManager];
    double v17 = [(HNDRocker *)self hardwareIdentifier];
    if (!v15)
    {
      [v16 startDragModeOnDisplay:v17];

      if (!v6 || v5)
      {
        if (!v5) {
          goto LABEL_17;
        }
        uint64_t v18 = +[HNDHandManager sharedManager];
        id v19 = [(HNDRocker *)self hardwareIdentifier];
        objc_msgSend(v18, "beginDragMenuAtPoint:onDisplay:", v19, v11, v13);
      }
      else
      {
        uint64_t v18 = +[HNDHandManager sharedManager];
        id v19 = [(HNDRocker *)self hardwareIdentifier];
        objc_msgSend(v18, "beginDragAtPoint:onDisplay:", v19, v11, v13);
      }

      goto LABEL_17;
    }
    objc_msgSend(v16, "endDragModeAtPoint:onDisplay:completed:", v17, 1, v11, v13);
  }
LABEL_17:
}

- (void)_pinchPressed:(id)a3 mode:(unint64_t)a4
{
  id v17 = a3;
  if (a4 <= 2) {
    [(HNDRocker *)self updateForegroundImageForAction:*(void *)*(&off_1001AC928 + a4)];
  }
  BOOL v6 = +[HNDHandManager sharedManager];
  [(AXPIFingerView *)self->_middleCircle frame];
  AX_CGRectGetCenter();
  double v8 = v7;
  double v10 = v9;
  double v11 = [(HNDRocker *)self superview];
  -[HNDRocker convertPoint:toView:](self, "convertPoint:toView:", v11, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v16 = [(HNDRocker *)self hardwareIdentifier];
  objc_msgSend(v6, "startPinchModeWithPoint:onDisplay:mode:", v16, a4, v13, v15);
}

- (void)_scrollPressed:(id)a3 fromButtonPress:(BOOL)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  double v12 = &AXAssistiveTouchIconTypeScrollDown;
  if (!a5) {
    double v12 = &AXAssistiveTouchIconTypeScrollRight;
  }
  double v13 = &AXAssistiveTouchIconTypeScrollUp;
  if (!a5) {
    double v13 = &AXAssistiveTouchIconTypeScrollLeft;
  }
  if (!a6) {
    double v12 = v13;
  }
  [(HNDRocker *)self updateForegroundImageForAction:*v12];
  [(HNDRocker *)self _initialPointForGesture];
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = +[HNDHandManager sharedManager];
  id v19 = [(HNDRocker *)self hardwareIdentifier];
  objc_msgSend(v18, "prepareScrollAtPoint:onDisplay:vertical:forward:max:", v19, v9, v8, v7, v15, v17);

  if (v10)
  {
    id v21 = +[HNDHandManager sharedManager];
    uint64_t v20 = [(HNDRocker *)self hardwareIdentifier];
    [v21 performPreparedGestureOnDisplay:v20];
  }
}

- (void)_continuousScrollPressed:(id)a3 fromButtonPress:(BOOL)a4 inDirection:(unint64_t)a5 iconType:(id)a6
{
  -[HNDRocker updateForegroundImageForAction:](self, "updateForegroundImageForAction:", a6, a4);
  BOOL v8 = +[HNDHandManager sharedManager];
  unsigned int v9 = [v8 inContinuousScrollMode];

  id v11 = +[HNDHandManager sharedManager];
  BOOL v10 = [(HNDRocker *)self hardwareIdentifier];
  if (v9) {
    [v11 endContinuousScrollingOnDisplay:v10 withCompletion:0];
  }
  else {
    [v11 beginContinuousScrollingInDirection:a5 onDisplay:v10];
  }
}

- (void)_bubbleModeToggled
{
  double v2 = +[HNDHandManager sharedManager];
  unsigned int v3 = [v2 bubbleModeAllowed];

  if (v3)
  {
    id v6 = +[AXSettings sharedInstance];
    uint64_t v4 = [v6 assistiveTouchBubbleModeEnabled] ^ 1;
    BOOL v5 = +[AXSettings sharedInstance];
    [v5 setAssistiveTouchBubbleModeEnabled:v4];
  }
}

- (void)_autoHideForEyeTrackingToggled
{
  double v2 = +[HNDHandManager sharedManager];
  unsigned int v3 = [v2 eyeTrackingAutoHideAllowed];

  if (v3)
  {
    id v6 = +[AXSettings sharedInstance];
    uint64_t v4 = [v6 assistiveTouchEyeTrackingAutoHideEnabled] ^ 1;
    BOOL v5 = +[AXSettings sharedInstance];
    [v5 setAssistiveTouchEyeTrackingAutoHideEnabled:v4];
  }
}

- (void)_toggleDwellControlPause:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = &AXAssistiveTouchIconTypeDwellPause;
  if (!a3) {
    BOOL v5 = &AXAssistiveTouchIconTypeDwellClick;
  }
  [(HNDRocker *)self updateForegroundImageForAction:*v5];
  [(HNDRocker *)self _menuExited];
  id v6 = +[HNDHandManager sharedManager];
  [v6 setDwellControlPaused:v3];
}

- (void)_lockDwellControlAction:(BOOL)a3
{
  BOOL v3 = a3;
  [(HNDRocker *)self _menuExited];
  id v4 = +[HNDHandManager sharedManager];
  [v4 setDwellControlAutorevertEnabled:!v3];
}

- (void)_increaseDwellTimePressed
{
  [(HNDRocker *)self _menuExited];
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchMouseDwellControlActivationTimeout];
  [v3 setAssistiveTouchMouseDwellControlActivationTimeout:v2 + 0.25];
}

- (void)_decreaseDwellTimePressed
{
  [(HNDRocker *)self _menuExited];
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchMouseDwellControlActivationTimeout];
  [v3 setAssistiveTouchMouseDwellControlActivationTimeout:v2 + -0.25];
}

- (void)_resetForegroundImage
{
  [(UIImageView *)self->_nubbitForeground setImage:self->_nubbitImage];
  [(HNDRocker *)self setAccessibilityValue:0];
  [(HNDRocker *)self setForegroundImageAction:0];

  [(HNDRocker *)self _layoutForegroundImageView];
}

- (void)_layoutForegroundImageView
{
  [(UIVisualEffectView *)self->_backdropView frame];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(UIImageView *)self->_nubbitForeground image];
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  v14.origin.double x = (v4 - v9) * 0.5;
  v14.origin.double y = (v6 - v11) * 0.5;
  v14.size.double width = v9;
  v14.size.double height = v11;
  CGRect v15 = CGRectIntegral(v14);
  nubbitForeground = self->_nubbitForeground;

  -[UIImageView setFrame:](nubbitForeground, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
}

- (void)updateForegroundImageForAction:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  double v5 = +[HNDHandManager sharedManager];
  if (([v5 dwellControlEnabled] & 1) == 0)
  {

    goto LABEL_8;
  }
  double v6 = +[HNDDeviceManager sharedManager];
  unsigned __int8 v7 = [v6 mainDeviceIsPointer];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(HNDRocker *)self _resetForegroundImage];
    goto LABEL_9;
  }
  double v8 = [(HNDRocker *)self foregroundImageAction];
  unsigned __int8 v9 = [v8 isEqualToString:v4];

  if ((v9 & 1) == 0)
  {
    [(HNDRocker *)self setForegroundImageAction:v4];
    [(HNDRocker *)self setAccessibilityValue:v4];
    unsigned int v10 = [(HNDRocker *)self isFullMenuVisible];
    if (self->_nubbitForeground)
    {
      int v11 = v10 ^ 1;
    }
    else
    {
      [(HNDRocker *)self _initializeNubbit];
      int v11 = 0;
    }
    double v12 = AXUIAssistiveTouchImageForName();
    double v13 = +[UIColor whiteColor];
    CGRect v14 = [v12 imageWithTintColor:v13];

    if (v11)
    {
      nubbitForeground = self->_nubbitForeground;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000577CC;
      v21[3] = &unk_1001AAC78;
      v21[4] = self;
      id v22 = v14;
      +[UIView transitionWithView:nubbitForeground duration:5242880 options:v21 animations:0 completion:0.3];
      double v16 = self->_nubbitForeground;
      long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v20[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v20[1] = v17;
      v20[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [(UIImageView *)v16 setTransform:v20];
      v18[4] = self;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000577E0;
      v19[3] = &unk_1001AAA90;
      v19[4] = self;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100057844;
      v18[3] = &unk_1001AACE0;
      +[UIView animateWithDuration:0x10000 delay:v19 options:v18 animations:0.15 completion:0.0];
    }
    else
    {
      [(UIImageView *)self->_nubbitForeground setImage:v14];
      [(HNDRocker *)self _layoutForegroundImageView];
    }
  }
LABEL_9:
}

- (void)_voiceControlPressed
{
  [(HNDRocker *)self _menuExited];

  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_siriButtonPressed
{
  [(HNDRocker *)self _menuExited];

  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_typeToSiriButtonPressed
{
  [(HNDRocker *)self _menuExited];

  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_tripleClickHomePressed
{
  [(HNDRocker *)self _menuExited];
  double v2 = +[AXSpringBoardServer server];
  id v6 = [v2 visibleTripleClickItems];

  if ([v6 count] == (id)1
    && ([v6 firstObject],
        double v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 intValue],
        v3,
        v4 == 6))
  {
    double v5 = +[AXSpringBoardServer server];
    [v5 showAlert:10 withHandler:&stru_1001AC690];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)_notificationCenterPressed
{
  [(HNDRocker *)self _menuExited];
  +[AXAssertion ensureAssertionsHaveBeenProcessedWithCompletion:&stru_1001AC6D0];
  double v2 = (void *)AXAssistiveTouchIconTypeNotificationCenter;

  sub_100040C44(v2);
}

- (void)_controlCenterPressed
{
  [(HNDRocker *)self _menuExited];
  +[AXAssertion ensureAssertionsHaveBeenProcessedWithCompletion:&stru_1001AC710];
  double v2 = (void *)AXAssistiveTouchIconTypeControlCenter;

  sub_100040C44(v2);
}

- (void)_screenshotPressed
{
  [(HNDRocker *)self _menuExited];

  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_trackpadPressed
{
  id v3 = [(HNDRocker *)self displayManager];
  [(HNDRocker *)self _menuExited];
  objc_msgSend(v3, "toggleShowTrackpad:", objc_msgSend(v3, "isShowingVirtualTrackpad") ^ 1);
}

- (void)_calibrateEyeTrackingPressed
{
  id v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

  if (v4)
  {
    id v5 = [(HNDRocker *)self displayManager];
    [(HNDRocker *)self _menuExited];
    [v5 setNeedsRecalibration:1];
  }
}

- (void)_toggleNeedsToShowZoomWindow
{
  id v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

  if (v4)
  {
    id v5 = [(HNDRocker *)self displayManager];
    unsigned int v6 = [v5 needsToShowZoomWindow];

    unsigned __int8 v7 = [(HNDRocker *)self displayManager];
    [v7 setNeedsToShowZoomWindow:v6 ^ 1];

    [(HNDRocker *)self _menuExited];
  }
}

- (void)showBannerWithText:(id)a3
{
  id v4 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_disableUserInterfaceClient" object:0];
  id v5 = [(HNDRocker *)self displayManager];
  [v5 addUserInterfaceClientEnabler:@"AssistiveTouchRocker"];

  unsigned int v6 = [(HNDRocker *)self displayManager];
  unsigned __int8 v7 = sub_100040EC8(@"ASSISTIVE_TOUCH");
  [v6 showSimpleBannerWithTitle:v7 text:v4];

  [(HNDRocker *)self performSelector:"_disableUserInterfaceClient" withObject:0 afterDelay:15.0];
}

- (void)_disableUserInterfaceClient
{
  id v2 = [(HNDRocker *)self displayManager];
  [v2 removeUserInterfaceClientEnabler:@"AssistiveTouchRocker"];
}

- (void)_spotlightPressed:(id)a3
{
  id v4 = +[AXBackBoardServer server];
  unsigned int v5 = [v4 isGuidedAccessActive];

  if (v5)
  {
    unsigned int v6 = ASTLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      unsigned __int8 v7 = "Not triggering spotlight because GAX is active";
      double v8 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (AXAssistiveAccessEnabled())
  {
    unsigned int v6 = ASTLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      unsigned __int8 v7 = "Not triggering spotlight because Assistive Access is active";
      double v8 = (uint8_t *)&v10;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  unsigned __int8 v9 = +[AXPISystemActionHelper sharedInstance];
  [v9 toggleSpotlight];

  [(HNDRocker *)self _menuExited];
}

- (void)_watchRemoteScreenPressed
{
  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleWatchRemoteScreen];

  [(HNDRocker *)self _menuExited];
}

- (void)_detectionModePresssed
{
  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 activateDetectionMode];

  [(HNDRocker *)self _menuExited];
}

- (void)_backgroundSoundsPressed
{
  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleBackgroundSounds];

  [(HNDRocker *)self _menuExited];
}

- (void)_liveCaptionsPressed
{
  if (AXHasCapability())
  {
    id v3 = +[AXPISystemActionHelper sharedInstance];
    [v3 toggleLiveCaptions];

    [(HNDRocker *)self _menuExited];
  }
}

- (void)_dimFlashingLightsPressed
{
}

- (void)_hapticMusicPressed
{
}

- (void)_motionCuesPressed
{
}

- (void)_liveSpeechPressed
{
  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleLiveSpeech];

  [(HNDRocker *)self _menuExited];
}

- (void)_nearbyDeviceControlPressed
{
  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 toggleNearbyDeviceControlPicker];

  [(HNDRocker *)self _menuExited];
}

- (void)_sosPressed
{
  id v3 = +[AXBackBoardServer server];
  unsigned int v4 = [v3 isGuidedAccessActive];

  if (v4)
  {
    unsigned int v5 = ASTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      unsigned int v6 = "Not triggering SOS because GAX is active";
      unsigned __int8 v7 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (AXAssistiveAccessEnabled())
  {
    unsigned int v5 = ASTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      unsigned int v6 = "Not triggering SOS because Assistive Access is active";
      unsigned __int8 v7 = (uint8_t *)&v9;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  double v8 = +[AXPISystemActionHelper sharedInstance];
  [v8 activateSOSMode];

  [(HNDRocker *)self _menuExited];
}

- (void)_commandAndControlPressed
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleCommandAndControl];

  id v3 = (void *)AXAssistiveTouchIconTypeCommandAndControl;

  sub_100040C44(v3);
}

- (void)_sysdiagnosePressed
{
  [(HNDRocker *)self _menuExited];
  id v3 = +[AXPISystemActionHelper sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000586B0;
  v4[3] = &unk_1001AAFB0;
  v4[4] = self;
  [v3 performSysdiagnoseWithStatusUpdateHandler:v4];
}

- (void)_speakScreenPressed
{
  [(HNDRocker *)self _menuExited];
  if (!_AXSSpeakThisEnabled())
  {
    _AXSSetSpeakThisEnabled();
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
  }
  id v3 = +[SpeakThisServices sharedInstance];
  [(HNDRocker *)self frame];
  AX_CGRectGetCenter();
  objc_msgSend(v3, "speakThisWithOptions:useAppAtPoint:errorHandler:", 12, &stru_1001AC790);

  unsigned int v4 = (void *)AXAssistiveTouchIconTypeSpeakScreen;

  sub_100040C44(v4);
}

- (void)_reachabilityPressed
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleReachability];

  id v3 = (void *)AXAssistiveTouchIconTypeReachability;

  sub_100040C44(v3);
}

- (void)_rebootDevicePressed
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 rebootDevice];

  id v3 = (void *)AXAssistiveTouchIconTypeRebootDevice;

  sub_100040C44(v3);
}

- (void)_dockPressed
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleDock];
}

- (void)_armApplePay
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 armApplePay];
}

- (void)_confirmApplePay
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 confirmApplePay];
}

- (void)_toggleHoverTextTyping
{
}

- (void)_toggleAppSwitcher
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 pressHomeButtonDown];
  [v2 liftHomeButtonUp];
  [v2 pressHomeButtonDown];
  [v2 liftHomeButtonUp];
}

- (void)_handleTouch:(int64_t)a3
{
  middleCircle = self->_middleCircle;
  if (middleCircle && ([(AXPIFingerView *)middleCircle isHidden] & 1) == 0)
  {
    [(AXPIFingerView *)self->_middleCircle frame];
    AX_CGRectGetCenter();
    double v9 = v8;
    double v11 = v10;
    double v12 = [(HNDRocker *)self superview];
    -[HNDRocker convertPoint:toView:](self, "convertPoint:toView:", v12, v9, v11);
    double x = v13;
    double y = v14;
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  id v16 = +[HNDHandManager sharedManager];
  CGRect v15 = [(HNDRocker *)self hardwareIdentifier];
  objc_msgSend(v16, "handleMultiTouchStandard:onDisplay:withExistingFingerMidPoint:", a3, v15, x, y);
}

- (void)_hardwareButtonPressed:(id)a3
{
  self->_int64_t state = 2;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_morePressed:(id)a3
{
  self->_int64_t state = 6;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_sideAppPressed:(id)a3
{
  self->_int64_t state = 7;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_sideAppMorePressed:(id)a3
{
  self->_int64_t state = 8;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_activateLockButton
{
  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 activateLockButton];

  [(HNDRocker *)self _menuExited];
  unsigned int v4 = (void *)AXAssistiveTouchIconTypeLockScreen;

  sub_100040C44(v4);
}

- (void)_lockButton:(BOOL)a3
{
  unsigned int v5 = +[AXPISystemActionHelper sharedInstance];
  unsigned int v6 = v5;
  if (a3)
  {
    [v5 pressLockButtonDown];

    unsigned __int8 v7 = (void *)AXAssistiveTouchIconTypeLockScreen;
    sub_100040C44(v7);
  }
  else
  {
    [v5 liftLockButtonUp];

    [(HNDRocker *)self _menuExited];
  }
}

- (void)_updateVolumeDisplay
{
  volumeUpdateTimer = self->_volumeUpdateTimer;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100058C84;
  v3[3] = &unk_1001AAA90;
  v3[4] = self;
  [(AXDispatchTimer *)volumeUpdateTimer afterDelay:v3 processBlock:0.05];
}

- (void)showVolumeDisplayImmediately
{
  [(AXDispatchTimer *)self->_volumeUpdateTimer cancel];
  id v3 = +[HNDHandManager sharedManager];
  [v3 volumeLevel];
  -[HNDRocker showVolumeBar:withProgress:](self, "showVolumeBar:withProgress:", 1);
}

- (void)_volumeUp:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[AXPISystemActionHelper sharedInstance];
  unsigned int v6 = v5;
  if (v3)
  {
    [v5 pressVolumeUpButtonDown];

    [(HNDRocker *)self _updateVolumeDisplay];
    unsigned __int8 v7 = (void *)AXAssistiveTouchIconTypeVolumeUp;
    sub_100040C44(v7);
  }
  else
  {
    [v5 liftVolumeUpButtonUp];

    [(HNDRocker *)self showVolumeDisplayImmediately];
  }
}

- (void)_volumeDown:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[AXPISystemActionHelper sharedInstance];
  unsigned int v6 = v5;
  if (v3)
  {
    [v5 pressVolumeDownButtonDown];

    [(HNDRocker *)self _updateVolumeDisplay];
    unsigned __int8 v7 = (void *)AXAssistiveTouchIconTypeVolumeDown;
    sub_100040C44(v7);
  }
  else
  {
    [v5 liftVolumeDownButtonUp];

    [(HNDRocker *)self showVolumeDisplayImmediately];
  }
}

- (void)_mutePressed
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleMute];
}

- (void)_rotationLockPressed
{
  id v2 = +[HNDEventManager sharedManager];
  unsigned int v3 = [v2 orientationLocked];

  unsigned int v4 = +[HNDEventManager sharedManager];
  [v4 setOrientationLocked:v3 ^ 1];

  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_ringerSwitchPressed:(BOOL)a3
{
  if (![(HNDRocker *)self _replaceRingerWithOrientationLock] || a3)
  {
    unint64_t v5 = !sub_100040830();
  }
  else
  {
    unsigned int v4 = +[HNDEventManager sharedManager];
    unint64_t v5 = (unint64_t)[v4 orientationLocked];
  }
  if (j__AXDeviceIsRingerSwitchAvailable())
  {
    unsigned int v6 = +[AXPISystemActionHelper sharedInstance];
    [v6 toggleRingerSwitch:v5];

    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    unsigned __int8 v7 = +[HNDEventManager sharedManager];
    unsigned int v8 = [v7 orientationLocked];

    id v9 = +[HNDEventManager sharedManager];
    [v9 setOrientationLocked:v8 ^ 1];
  }
}

- (void)_ringerPressed:(BOOL)a3
{
}

- (void)_actionButtonPressed
{
  if (AXDeviceHasStaccato())
  {
    [(HNDRocker *)self _menuExited];
    id v3 = +[AXPISystemActionHelper sharedInstance];
    [v3 pressStaccato];
  }
}

- (void)_cameraButtonPressed
{
  if (AXDeviceSupportsCameraButton())
  {
    id v3 = +[AXPISystemActionHelper sharedInstance];
    [v3 pressCameraButton];
  }

  [(HNDRocker *)self _menuExited];
}

- (void)_cameraButtonLightPressed
{
  if (AXDeviceSupportsCameraButton())
  {
    id v3 = +[AXPISystemActionHelper sharedInstance];
    [v3 lightPressCameraButton];
  }

  [(HNDRocker *)self _menuExited];
}

- (void)_cameraButtonDoubleLightPressed
{
  if (AXDeviceSupportsCameraButton())
  {
    id v3 = +[AXPISystemActionHelper sharedInstance];
    [v3 doubleLightPressCameraButton];
  }

  [(HNDRocker *)self _menuExited];
}

- (void)_openVisualIntelligence
{
  if (AXDeviceSupportsCameraButton())
  {
    id v3 = +[AXPISystemActionHelper sharedInstance];
    [v3 openVisualIntelligence];
  }

  [(HNDRocker *)self _menuExited];
}

- (void)_shakePressed
{
  id v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 shake];

  homeButtonDismissTimer = self->_homeButtonDismissTimer;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059394;
  v5[3] = &unk_1001AAA90;
  v5[4] = self;
  [(AXDispatchTimer *)homeButtonDismissTimer afterDelay:v5 processBlock:0.5];
}

- (void)_orientationPressed:(id)a3
{
  self->_int64_t state = 4;
  [(HNDRocker *)self _pushMenuItemsFromSender:a3];
}

- (void)_homeButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HNDRocker *)self shouldIgnoreNextHome] || (sub_100040850() & 1) != 0)
  {
    if ([(HNDRocker *)self shouldIgnoreNextHome])
    {
      unint64_t v5 = self;
      uint64_t v6 = 0;
    }
    else
    {
      unint64_t v5 = self;
      uint64_t v6 = 1;
    }
    [(HNDRocker *)v5 setShouldIgnoreNextHome:v6];
  }
  else
  {
    unsigned __int8 v7 = +[AXPISystemActionHelper sharedInstance];
    unsigned int v8 = v7;
    if (v3)
    {
      [v7 pressHomeButtonDown];

      [(AXDispatchTimer *)self->_homeButtonDismissTimer cancel];
      id v9 = +[AXSpringBoardServer server];
      [v9 setCancelGestureActivation:8 cancelEnabled:1];

      double v10 = (void *)AXAssistiveTouchIconTypeHome;
      sub_100040C44(v10);
    }
    else
    {
      [v7 liftHomeButtonUp];

      [(AXDispatchTimer *)self->_homeButtonDismissTimer cancel];
      double v11 = +[AXSpringBoardServer server];
      [v11 setCancelGestureActivation:8 cancelEnabled:0];

      homeButtonDismissTimer = self->_homeButtonDismissTimer;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100059550;
      v13[3] = &unk_1001AAA90;
      v13[4] = self;
      [(AXDispatchTimer *)homeButtonDismissTimer afterDelay:v13 processBlock:0.5];
    }
  }
}

- (void)_toggleAssistiveAccess
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 performActionForSystemAction:AXAssistiveTouchIconTypeAssistiveAccess];
}

- (void)_cameraPressed
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 performActionForSystemAction:AXAssistiveTouchIconTypeCamera];
}

- (void)_frontFacingCameraPressed
{
  [(HNDRocker *)self _menuExited];
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 performActionForSystemAction:AXAssistiveTouchIconTypeFrontFacingCamera];
}

- (CGPoint)onScreenLocation
{
  [(AXPIFingerView *)self->_middleCircle frame];
  AX_CGRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  unsigned __int8 v7 = [(HNDRocker *)self window];
  unsigned int v8 = [v7 subviews];
  id v9 = [v8 firstObject];
  -[HNDRocker convertPoint:toView:](self, "convertPoint:toView:", v9, v4, v6);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (BOOL)isFullMenuVisible
{
  return self->_isFullMenuVisible;
}

- (void)setFullMenuVisible:(BOOL)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = a3;
  unsigned int v8 = ASTLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v23.double x = x;
    v23.double y = y;
    id v9 = NSStringFromCGPoint(v23);
    *(_DWORD *)buf = 67109378;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setFullMenuVisible: %d, atPoint: %@", buf, 0x12u);
  }
  if (self->_isFullMenuVisible == v6)
  {
    double v10 = ASTLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Skipping setFullMenuVisible due to no change in visibility state", buf, 2u);
    }
  }
  else
  {
    self->_isFullMenuVisible = v6;
    self->_double progress = 0.1;
    [(HNDRocker *)self frame];
    if (v6)
    {
      double v13 = v11;
      double v14 = v12;
      +[CATransaction begin];
      float v15 = x - v13 * 0.5;
      float v16 = y - v14 * 0.5;
      -[HNDRocker setFrame:](self, "setFrame:", roundf(v15), roundf(v16), v13, v14);
      [(HNDRocker *)self _resetHoverCircleLocation];
      [(HNDRocker *)self setAlpha:1.0];
      +[CATransaction commit];
      self->_startInterval = 0.0;
      long long v17 = +[HNDEventManager sharedManager];
      [v17 manipulateDimTimer:0];

      self->_int64_t state = 1;
      [(HNDRocker *)self _loadMenuItems:0 viewForCenteringAtStart:self goBackwards:0 originalState:1];
      [(HNDRocker *)self _setBackgroundWithType:0];
      self->_sentRockers = 0;
      self->_linkRunning = 1;
      [(NSMutableArray *)self->_rockerItems enumerateObjectsUsingBlock:&stru_1001AC7B0];
      [(HNDRocker *)self _updateBackButtonVisibility];
      [(HNDRocker *)self setAlpha:0.0];
      [(HNDRocker *)self _updateProgress:0];
    }
    else
    {
      self->_startInterval = 0.0;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100059A24;
      v18[3] = &unk_1001AAA90;
      v18[4] = self;
      +[UIView animateWithDuration:v18 animations:&stru_1001AC7F0 completion:0.2];
    }
  }
}

- (BOOL)_shouldShowSideAppMenu
{
  if (!AXDeviceSupportsSideApp()) {
    return 0;
  }
  double v3 = +[AXSpringBoardServer server];
  double v4 = [v3 allowedMedusaGestures];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v6 = [(HNDRocker *)self _dockSpecificMenuItems];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

- (void)_enableDockIconActivationMode:(unint64_t)a3
{
  [(HNDRocker *)self _dockPressed];
  BOOL v5 = sub_100040EC8(@"DOCK_INSTRUCTIONS");
  [(HNDRocker *)self showBannerWithText:v5];

  id v6 = +[AXSpringBoardServer server];
  [v6 setDockIconActivationMode:a3];
}

- (id)_dockSpecificMenuItems
{
  double v3 = +[AXSpringBoardServer server];
  unsigned int v4 = [v3 canSetDockIconActivationMode];

  if (v4)
  {
    id v5 = [UIApp userInterfaceLayoutDirection];
    id v6 = [(HNDRocker *)self dockSpecificButtons];

    if (!v6)
    {
      objc_initWeak(&location, self);
      if (v5 == (id)1)
      {
        BOOL v20 = sub_100040EC8(@"PIN_APP_RIGHT");
        CFStringRef v7 = @"AT_LaunchPinFromDockRight";
      }
      else
      {
        BOOL v20 = sub_100040EC8(@"PIN_APP_LEFT");
        CFStringRef v7 = @"AT_LaunchPinFromDockLeft";
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100059F38;
      v25[3] = &unk_1001AC0C0;
      objc_copyWeak(&v26, &location);
      LOBYTE(v17) = 0;
      id v9 = +[HNDRockerButton buttonWithTitle:v20 imageName:v7 downBlock:0 upBlock:v25 dataSource:self showWithGuidedAccess:0 showWithAssistiveAccess:v17];
      v28[0] = v9;
      if (v5 == (id)1)
      {
        double v10 = sub_100040EC8(@"PIN_APP_LEFT");
        CFStringRef v11 = @"AT_LaunchPinFromDockLeft";
      }
      else
      {
        double v10 = sub_100040EC8(@"PIN_APP_RIGHT");
        CFStringRef v11 = @"AT_LaunchPinFromDockRight";
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100059F7C;
      v23[3] = &unk_1001AC0C0;
      objc_copyWeak(&v24, &location);
      LOBYTE(v18) = 0;
      double v12 = +[HNDRockerButton buttonWithTitle:v10 imageName:v11 downBlock:0 upBlock:v23 dataSource:self showWithGuidedAccess:0 showWithAssistiveAccess:v18];
      v28[1] = v12;
      double v13 = sub_100040EC8(@"FLOAT_APP");
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100059FC0;
      v21[3] = &unk_1001AC0C0;
      objc_copyWeak(&v22, &location);
      LOBYTE(v19) = 0;
      double v14 = +[HNDRockerButton buttonWithTitle:v13 imageName:@"AT_LaunchFloatFromDock" downBlock:0 upBlock:v21 dataSource:self showWithGuidedAccess:0 showWithAssistiveAccess:v19];
      v28[2] = v14;
      float v15 = +[NSArray arrayWithObjects:v28 count:3];
      [(HNDRocker *)self setDockSpecificButtons:v15];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    unsigned int v8 = [(HNDRocker *)self dockSpecificButtons];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)_loadSideAppMenuItems
{
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  double v3 = +[AXSpringBoardServer server];
  unsigned int v4 = [v3 allowedMedusaGestures];

  id v5 = [v4 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v46;
    double v39 = v44;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v46 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v9 = [(HNDRocker *)self buttonsByMedusaGesture];
        BOOL v10 = v9 == 0;

        if (v10)
        {
          CFStringRef v11 = +[NSMutableDictionary dictionary];
          [(HNDRocker *)self setButtonsByMedusaGesture:v11];
        }
        double v12 = [(HNDRocker *)self buttonsByMedusaGesture];
        double v13 = [v12 objectForKeyedSubscript:v8];

        if (!v13)
        {
          unint64_t v14 = (unint64_t)[v8 unsignedIntegerValue];
          float v15 = sub_100040D84(v14);
          if (v14 > 0x10) {
            float v16 = 0;
          }
          else {
            float v16 = off_1001AC940[v14];
          }
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v44[0] = sub_10005A588;
          v44[1] = &unk_1001AC818;
          v44[2] = self;
          v44[3] = v14;
          LOBYTE(v38) = 0;
          double v13 = +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:](HNDRockerButton, "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:", v15, v16, 0, v43, self, 0, v38, v39);

          uint64_t v17 = [(HNDRocker *)self buttonsByMedusaGesture];
          [v17 setObject:v13 forKeyedSubscript:v8];
        }
        [(NSMutableArray *)self->_rockerItems addObject:v13];
      }
      id v5 = [v4 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v5);
  }

  rockerItems = self->_rockerItems;
  uint64_t v19 = [(HNDRocker *)self _dockSpecificMenuItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v19];

  if ((unint64_t)[(NSMutableArray *)self->_rockerItems count] <= 1)
  {
    BOOL v20 = [(HNDRocker *)self toggleDockButton];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      id v22 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeToggleDock];
      [(HNDRocker *)self setToggleDockButton:v22];
    }
    CGPoint v23 = self->_rockerItems;
    id v24 = [(HNDRocker *)self toggleDockButton];
    [(NSMutableArray *)v23 addObject:v24];
  }
  if ((unint64_t)[(NSMutableArray *)self->_rockerItems count] <= 1)
  {
    double v25 = [(HNDRocker *)self appSwitcherButton];
    BOOL v26 = v25 == 0;

    if (v26)
    {
      uint64_t v27 = [(HNDRocker *)self _rockerButtonForLocation:0 buttonType:AXAssistiveTouchIconTypeAppSwitcher];
      [(HNDRocker *)self setAppSwitcherButton:v27];
    }
    CGRect v28 = self->_rockerItems;
    CGRect v29 = [(HNDRocker *)self appSwitcherButton];
    [(NSMutableArray *)v28 addObject:v29];
  }
  if ((unint64_t)[(NSMutableArray *)self->_rockerItems count] < 9)
  {
    [(HNDRocker *)self setSideAppMoreRockerItems:0];
  }
  else
  {
    unsigned __int8 v30 = (char *)[(NSMutableArray *)self->_rockerItems count] - 7;
    uint64_t v31 = -[NSMutableArray subarrayWithRange:](self->_rockerItems, "subarrayWithRange:", 7, v30);
    [(HNDRocker *)self setSideAppMoreRockerItems:v31];

    -[NSMutableArray removeObjectsInRange:](self->_rockerItems, "removeObjectsInRange:", 7, v30);
    unsigned __int8 v32 = [(HNDRocker *)self moreButton];
    LODWORD(v30) = v32 == 0;

    if (v30)
    {
      objc_initWeak(&location, self);
      char v33 = sub_100040EC8(@"MORE");
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10005A5E8;
      v40[3] = &unk_1001AC0C0;
      objc_copyWeak(&v41, &location);
      LOBYTE(v38) = 1;
      id v34 = +[HNDRockerButton buttonWithTitle:v33 imageName:@"IconMore" downBlock:0 upBlock:v40 dataSource:self showWithGuidedAccess:1 showWithAssistiveAccess:v38];
      [(HNDRocker *)self setMoreButton:v34];

      id v35 = [(HNDRocker *)self moreButton];
      [v35 setTag:114];

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
    uint64_t v36 = self->_rockerItems;
    id v37 = [(HNDRocker *)self moreButton];
    [(NSMutableArray *)v36 addObject:v37];
  }
  [(HNDRocker *)self _assignLocationsToRockerItems];
}

- (void)_loadSideAppMoreMenuItems
{
  rockerItems = self->_rockerItems;
  unsigned int v4 = [(HNDRocker *)self sideAppMoreRockerItems];
  [(NSMutableArray *)rockerItems addObjectsFromArray:v4];

  [(HNDRocker *)self _assignLocationsToRockerItems];
}

- (void)didFailToPinApp
{
  sub_100040EC8(@"PIN_ERROR");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(HNDRocker *)self showBannerWithText:v3];
}

- (void)didFailToFloatApp
{
  sub_100040EC8(@"FLOAT_ERROR");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(HNDRocker *)self showBannerWithText:v3];
}

- (void)_initializeNubbit
{
  [(HNDRocker *)self bounds];
  double v4 = v3;
  double v6 = v5;
  if (!self->_isFullMenuVisible) {
    [(NSMutableArray *)self->_rockerItems enumerateObjectsUsingBlock:&stru_1001AC838];
  }
  +[HNDRocker nubbitSize];
  -[HNDRocker setBounds:](self, "setBounds:", v4, v6, v7, v8);
  [(HNDRocker *)self _setBackgroundWithType:0];
  nubbitForeground = self->_nubbitForeground;
  if (!nubbitForeground)
  {
    BOOL v10 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_nubbitImage];
    CFStringRef v11 = self->_nubbitForeground;
    self->_nubbitForeground = v10;

    double v12 = +[UIColor whiteColor];
    [(UIImageView *)self->_nubbitForeground setTintColor:v12];

    [(UIImageView *)self->_nubbitForeground setAutoresizingMask:0];
    [(HNDRocker *)self addSubview:self->_nubbitForeground];
    nubbitForeground = self->_nubbitForeground;
  }
  [(UIImageView *)nubbitForeground setAlpha:1.0];
  [(HNDRocker *)self _layoutForegroundImageView];

  [(HNDRocker *)self _updateBackButtonVisibility];
}

- (void)_updateNubbitFadedProperties
{
  double v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchIdleOpacity];
  -[UIImageView setAlpha:](self->_nubbitForeground, "setAlpha:");

  id v5 = +[AXSettings sharedInstance];
  [v5 assistiveTouchIdleOpacity];
  [(UIVisualEffectView *)self->_backdropView setAlpha:v4 + -0.1];
}

- (void)_resetVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(HNDRocker *)self style])
  {
    if (v3)
    {
      [(UIVisualEffectView *)self->_backdropView setAlpha:1.0];
      nubbitForeground = self->_nubbitForeground;
      [(UIImageView *)nubbitForeground setAlpha:1.0];
    }
    else
    {
      [(HNDRocker *)self _updateNubbitFadedProperties];
    }
  }
}

- (void)fadeNubbit
{
  BOOL v3 = +[HNDHandManager sharedManager];
  unsigned int v4 = [v3 alwaysShowMenu];

  if (v4)
  {
    if (!self->_nubbitDimmed)
    {
      [(AXDispatchTimer *)self->_nubbitFadeTimer cancel];
      nubbitFadeTimer = self->_nubbitFadeTimer;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10005AA94;
      v6[3] = &unk_1001AAA90;
      void v6[4] = self;
      [(AXDispatchTimer *)nubbitFadeTimer afterDelay:v6 processBlock:4.0];
    }
  }
}

- (void)highlightNubbit
{
  if (self->_nubbitDimmed)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10005AC14;
    v3[3] = &unk_1001AAA90;
    v3[4] = self;
    +[UIView animateWithDuration:v3 animations:0.15];
    self->_nubbitDimmed = 0;
    [(HNDRocker *)self fadeNubbit];
  }
  else
  {
    [(AXDispatchTimer *)self->_nubbitFadeTimer cancel];
    [(HNDRocker *)self fadeNubbit];
  }
}

- (void)transitionMenuToNubbit:(CGPoint)a3 changeAlpha:(BOOL)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  BOOL v10 = [(HNDRocker *)self displayManager];
  unsigned int v11 = [v10 userInteractionEnabledOnRockerDismissView];

  if (v11)
  {
    double v12 = ASTLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100114A4C(v12);
    }
  }
  double v13 = ASTLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v40.double x = x;
    v40.double y = y;
    unint64_t v14 = NSStringFromCGPoint(v40);
    *(_DWORD *)buf = 138412802;
    id v37 = v14;
    __int16 v38 = 1024;
    *(_DWORD *)double v39 = v6;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "transitionMenuToNubbit point: %@, changeAlpha: %i, animate: %i", buf, 0x18u);
  }
  if (!self->_isNubbitVisible)
  {
    float v15 = ASTLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      float v16 = "Skipping transitionMenuToNubbit because nubbit is not visible";
      goto LABEL_13;
    }
LABEL_14:

    return;
  }
  if (self->_animatingNubbit)
  {
    float v15 = ASTLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      float v16 = "Skipping transitionMenuToNubbit because nubbit is still animating";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v16, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  [(HNDRocker *)self frame];
  if (v18 == x
    && v17 == y
    && ([(HNDRocker *)self bounds],
        double v20 = v19,
        double v22 = v21,
        +[HNDRocker nubbitSize],
        v20 == v24)
    && v22 == v23)
  {
    double v25 = ASTLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v41.double x = x;
      v41.double y = y;
      BOOL v26 = NSStringFromCGPoint(v41);
      +[HNDRocker nubbitSize];
      uint64_t v27 = NSStringFromCGSize(v42);
      *(_DWORD *)buf = 138412546;
      id v37 = v26;
      __int16 v38 = 2112;
      *(void *)double v39 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Skipping transitionMenuToNubbit because current origin == %@ and size == %@", buf, 0x16u);
    }
    [(HNDRocker *)self highlightNubbit];
  }
  else
  {
    [(NSMutableArray *)self->_rockerItems enumerateObjectsUsingBlock:&stru_1001AC858];
    nubbitForeground = self->_nubbitForeground;
    if (!nubbitForeground) {
      [(HNDRocker *)self _initializeNubbit];
    }
    self->_isFullMenuVisible = 0;
    [(HNDRocker *)self setStyle:0];
    [(AXDispatchTimer *)self->_homeButtonDismissTimer cancel];
    [(HNDRocker *)self showVolumeBar:0 withProgress:0.0];
    [(HNDRocker *)self alpha];
    if (v29 == 0.0)
    {
      if (v6) {
        [(HNDRocker *)self setAlpha:1.0];
      }
      +[CATransaction begin];
      [(HNDRocker *)self _setBackgroundWithType:0];
      [(HNDRocker *)self frame];
      -[HNDRocker setFrame:](self, "setFrame:", x, y);
      +[CATransaction commit];
    }
    if (v6) {
      [(AXPIFingerView *)self->_middleCircle setAlpha:0.0];
    }
    double v30 = 0.0;
    if (nubbitForeground)
    {
      if (v5)
      {
        int v31 = sub_100041150();
        double v30 = 0.349999994;
        if (v31) {
          double v30 = 0.25;
        }
      }
    }
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10005B090;
    v34[3] = &unk_1001AB020;
    v34[4] = self;
    *(double *)&v34[5] = x;
    *(double *)&v34[6] = y;
    BOOL v35 = v6;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10005B1A8;
    v32[3] = &unk_1001AC8C0;
    void v32[4] = self;
    BOOL v33 = v6;
    +[UIView animateWithDuration:2 delay:v34 options:v32 animations:v30 completion:0.0];
  }
}

- (void)transitionNubbitToMenu:(CGPoint)a3 concurrentAnimation:(id)a4 animationCompleted:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = ASTLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v39.CGFloat x = x;
    v39.CGFloat y = y;
    double v12 = NSStringFromCGPoint(v39);
    *(_DWORD *)buf = 138412290;
    __int16 v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "transitionNubbitToMenu: %@", buf, 0xCu);
  }
  if (self->_animatingNubbit)
  {
    double v13 = ASTLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Skipping transitionNubbitToMenu due to animating nubbit", buf, 2u);
    }
  }
  else
  {
    unint64_t v14 = +[HNDEventManager sharedManager];
    [v14 manipulateDimTimer:1];

    self->_int64_t state = 1;
    [(HNDRocker *)self _loadMenuItems:0 viewForCenteringAtStart:self goBackwards:0 originalState:1 shouldUpdateKeyboardFocusIfNeeded:0];
    [(HNDRocker *)self _setBackgroundWithType:0];
    [(HNDRocker *)self frame];
    double v16 = v15;
    double v18 = v17;
    [(UIVisualEffectView *)self->_backdropView bounds];
    -[HNDRocker setFrame:](self, "setFrame:", v16, v18);
    [(HNDRocker *)self setAlpha:1.0];
    [(HNDRocker *)self setStyle:1];
    [(NSMutableArray *)self->_rockerItems enumerateObjectsUsingBlock:&stru_1001AC8E0];
    [(HNDRocker *)self _updateBackButtonVisibility];
    [(AXAssistiveTouchLayoutView *)self->_layoutView centerItems:self->_rockerItems];
    [(HNDRocker *)self layoutIfNeeded];
    self->_isFullMenuVisible = 1;
    [(AXPIFingerView *)self->_middleCircle setAlpha:0.0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10005B650;
    v33[3] = &unk_1001AC908;
    v33[4] = self;
    CGFloat v35 = x;
    CGFloat v36 = y;
    id v34 = v9;
    double v19 = objc_retainBlock(v33);
    uint64_t v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    double v29 = sub_10005B9E8;
    double v30 = &unk_1001AB070;
    int v31 = self;
    id v32 = v10;
    double v20 = objc_retainBlock(&v27);
    LODWORD(v21) = 1048233745;
    LODWORD(v22) = 1024060595;
    LODWORD(v23) = 1061244476;
    LODWORD(v24) = 1065096357;
    double v25 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v21, v22, v23, v24, v27, v28, v29, v30, v31);
    BOOL v26 = +[HNDSpringAnimationFactory factoryWithMass:0.5 stiffness:300.0 damping:400.0];
    [v26 setTimingFunction:v25];
    +[UIView _animateWithDuration:2 delay:v26 options:v19 factory:v20 animations:0.61 completion:0.0];
  }
}

- (void)setNubbitVisible:(BOOL)a3
{
  self->_isNubbitVisible = a3;
  nubbitForeground = self->_nubbitForeground;
  if (a3)
  {
    double v5 = 1.0;
    if (!nubbitForeground) {
      [(HNDRocker *)self _initializeNubbit];
    }
  }
  else
  {
    [(UIImageView *)nubbitForeground removeFromSuperview];
    BOOL v6 = self->_nubbitForeground;
    self->_nubbitForeground = 0;

    double v5 = 0.0;
  }

  [(HNDRocker *)self setAlpha:v5];
}

- (void)_menuExited
{
  id v4 = +[HNDHandManager sharedManager];
  BOOL v3 = [(HNDRocker *)self hardwareIdentifier];
  [v4 menuExitedOnDisplay:v3];
}

- (BOOL)accessibilityPerformEscape
{
  unsigned __int8 v3 = [(HNDRocker *)self isAccessibilityElement];
  if ((v3 & 1) == 0) {
    [(HNDRocker *)self _menuExited];
  }
  return v3 ^ 1;
}

- (BOOL)isAccessibilityElement
{
  [(HNDRocker *)self alpha];
  return v3 > 0.0 && [(HNDRocker *)self style] == 0;
}

- (id)accessibilityPath
{
  if ([(HNDRocker *)self _usesCircularNubbit])
  {
    [(UIView *)self->_maskImageView bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    unsigned int v11 = [(UIView *)self->_maskImageView layer];
    [v11 cornerRadius];
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v12);
    double v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    unint64_t v14 = UIAccessibilityConvertPathToScreenCoordinates(v13, self->_maskImageView);
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

- (id)accessibilityLabel
{
  return sub_100040EC8(@"nubbit.label");
}

- (id)accessibilityHint
{
  return sub_100040EC8(@"nubbit.hint");
}

- (id)accessibilityIdentifier
{
  return @"AssistiveTouchNubbit";
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)rockerButtonGuttersForRockerButton:(id)a3
{
  id v4 = a3;
  rockerItems = self->_rockerItems;
  if (rockerItems)
  {
    rockerItems = (NSMutableArray *)[(NSMutableArray *)rockerItems count];
    if (rockerItems) {
      rockerItems = (NSMutableArray *)[(NSMutableArray *)self->_rockerItems indexOfObject:v4];
    }
  }
  int64_t state = self->_state;
  if (state != 1)
  {
    if (state != 6)
    {
LABEL_10:
      double v7 = 30.0;
      goto LABEL_11;
    }
    if ((rockerItems & 1) == 0)
    {
      double v7 = 60.0;
      goto LABEL_11;
    }
  }
  if (rockerItems != (NSMutableArray *)2) {
    goto LABEL_10;
  }
  double v8 = [v4 title];
  unsigned __int8 v9 = [v8 isEqualToString:@"Control Center"];

  double v7 = 18.0;
  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:

  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v7;
  double v13 = v7;
  result.var3 = v13;
  result.vadouble r2 = v11;
  result.var1 = v12;
  result.var0 = v10;
  return result;
}

- (void)didMoveToWindow
{
  v11.receiver = self;
  v11.super_class = (Class)HNDRocker;
  [(HNDRocker *)&v11 didMoveToWindow];
  double v3 = +[AXPerformanceTestReportingServer server];
  [v3 assistiveTouchDidLaunch];

  id v4 = [(HNDRocker *)self window];
  id v5 = [v4 _contextId];

  double v6 = [(HNDRocker *)self hitTestCategoryAssertion];
  [v6 invalidate];

  if (v5)
  {
    double v7 = +[BKSTouchEventService sharedInstance];
    double v8 = +[NSNumber numberWithUnsignedInt:v5];
    double v12 = v8;
    unsigned __int8 v9 = +[NSArray arrayWithObjects:&v12 count:1];
    double v10 = [v7 setContextIDs:v9 forHitTestContextCategory:1];
    [(HNDRocker *)self setHitTestCategoryAssertion:v10];
  }
}

- (void)_updateRockerItemIfNeededForItem:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_rockerItems count])
  {
    objc_opt_class();
    id v5 = __UIAccessibilityCastAsClass();
    double v6 = [v5 type];
    unsigned int v7 = [v6 isEqualToString:AXAssistiveTouchIconTypeSpotlight];

    if (v7)
    {
      objc_opt_class();
      double v8 = __UIAccessibilityCastAsClass();
      unsigned __int8 v9 = +[HNDHandManager sharedManager];
      double v10 = [v9 currentDisplayManager];
      unsigned int v11 = [v10 isCurrentOrientationLandscape];

      [v8 setDisabled:AXDeviceIsPhone() & v11];
    }
    if (!AXDeviceSupportsOnDeviceEyeTracking()) {
      goto LABEL_9;
    }
    double v12 = [v5 type];
    if ([v12 isEqualToString:AXAssistiveTouchIconTypeCalibrateOnDeviceEyeTracking])
    {
    }
    else
    {
      double v13 = [v5 type];
      unsigned int v14 = [v13 isEqualToString:AXAssistiveTouchIconTypeOnDeviceEyeTrackingZoomScreen];

      if (!v14)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    double v15 = +[AXSettings sharedInstance];
    objc_msgSend(v5, "setDisabled:", objc_msgSend(v15, "assistiveTouchMouseOnDeviceEyeTrackingEnabled") ^ 1);

    goto LABEL_9;
  }
LABEL_10:
}

- (int)style
{
  return self->_style;
}

- (HNDDisplayManager)displayManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayManager);

  return (HNDDisplayManager *)WeakRetained;
}

- (void)setDisplayManager:(id)a3
{
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (NSString)lastMenuItemActivated
{
  return self->_lastMenuItemActivated;
}

- (void)setLastMenuItemActivated:(id)a3
{
}

- (AXAssertion)disableDashBoardGesturesAssertion
{
  return self->_disableDashBoardGesturesAssertion;
}

- (void)setDisableDashBoardGesturesAssertion:(id)a3
{
}

- (BOOL)shouldIgnoreNextHome
{
  return self->_shouldIgnoreNextHome;
}

- (void)setShouldIgnoreNextHome:(BOOL)a3
{
  self->_shouldIgnoreNextHome = a3;
}

- (NSArray)backButtonConstraints
{
  return self->_backButtonConstraints;
}

- (void)setBackButtonConstraints:(id)a3
{
}

- (BOOL)shouldForciblyHideBackButtonForAnimation
{
  return self->_shouldForciblyHideBackButtonForAnimation;
}

- (void)setShouldForciblyHideBackButtonForAnimation:(BOOL)a3
{
  self->_shouldForciblyHideBackButtonForAnimation = a3;
}

- (NSArray)sideAppMoreRockerItems
{
  return self->_sideAppMoreRockerItems;
}

- (void)setSideAppMoreRockerItems:(id)a3
{
}

- (NSMutableArray)initialItems
{
  return self->_initialItems;
}

- (void)setInitialItems:(id)a3
{
}

- (NSMutableArray)touchItems
{
  return self->_touchItems;
}

- (void)setTouchItems:(id)a3
{
}

- (NSMutableArray)hardwareItems
{
  return self->_hardwareItems;
}

- (void)setHardwareItems:(id)a3
{
}

- (NSMutableArray)rotateItems
{
  return self->_rotateItems;
}

- (void)setRotateItems:(id)a3
{
}

- (NSMutableArray)moreItems
{
  return self->_moreItems;
}

- (void)setMoreItems:(id)a3
{
}

- (NSMutableArray)scrollItems
{
  return self->_scrollItems;
}

- (void)setScrollItems:(id)a3
{
}

- (NSMutableArray)dwellItems
{
  return self->_dwellItems;
}

- (void)setDwellItems:(id)a3
{
}

- (NSMutableArray)siriShortcutsItems
{
  return self->_siriShortcutsItems;
}

- (void)setSiriShortcutsItems:(id)a3
{
}

- (HNDRockerButton)sideAppButton
{
  return self->_sideAppButton;
}

- (void)setSideAppButton:(id)a3
{
}

- (HNDRockerButton)gesturesButton
{
  return self->_gesturesButton;
}

- (void)setGesturesButton:(id)a3
{
}

- (HNDRockerButton)tripleClickHomeButton
{
  return self->_tripleClickHomeButton;
}

- (void)setTripleClickHomeButton:(id)a3
{
}

- (HNDRockerButton)reachabilityButton
{
  return self->_reachabilityButton;
}

- (void)setReachabilityButton:(id)a3
{
}

- (HNDRockerButton)speakScreenButton
{
  return self->_speakScreenButton;
}

- (void)setSpeakScreenButton:(id)a3
{
}

- (HNDRockerButton)toggleDockButton
{
  return self->_toggleDockButton;
}

- (void)setToggleDockButton:(id)a3
{
}

- (HNDRockerButton)appSwitcherButton
{
  return self->_appSwitcherButton;
}

- (void)setAppSwitcherButton:(id)a3
{
}

- (HNDRockerButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (HNDRockerButton)applePayButton
{
  return self->_applePayButton;
}

- (void)setApplePayButton:(id)a3
{
}

- (HNDRockerButton)confirmApplePayButton
{
  return self->_confirmApplePayButton;
}

- (void)setConfirmApplePayButton:(id)a3
{
}

- (NSArray)dockSpecificButtons
{
  return self->_dockSpecificButtons;
}

- (void)setDockSpecificButtons:(id)a3
{
}

- (NSMutableDictionary)buttonsByMedusaGesture
{
  return self->_buttonsByMedusaGesture;
}

- (void)setButtonsByMedusaGesture:(id)a3
{
}

- (NSString)foregroundImageAction
{
  return self->_foregroundImageAction;
}

- (void)setForegroundImageAction:(id)a3
{
}

- (NSString)shortcutsUpdateToken
{
  return self->_shortcutsUpdateToken;
}

- (void)setShortcutsUpdateToken:(id)a3
{
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
  objc_storeStrong((id *)&self->_shortcutsUpdateToken, 0);
  objc_storeStrong((id *)&self->_foregroundImageAction, 0);
  objc_storeStrong((id *)&self->_buttonsByMedusaGesture, 0);
  objc_storeStrong((id *)&self->_dockSpecificButtons, 0);
  objc_storeStrong((id *)&self->_confirmApplePayButton, 0);
  objc_storeStrong((id *)&self->_applePayButton, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_appSwitcherButton, 0);
  objc_storeStrong((id *)&self->_toggleDockButton, 0);
  objc_storeStrong((id *)&self->_speakScreenButton, 0);
  objc_storeStrong((id *)&self->_reachabilityButton, 0);
  objc_storeStrong((id *)&self->_tripleClickHomeButton, 0);
  objc_storeStrong((id *)&self->_gesturesButton, 0);
  objc_storeStrong((id *)&self->_sideAppButton, 0);
  objc_storeStrong((id *)&self->_siriShortcutsItems, 0);
  objc_storeStrong((id *)&self->_dwellItems, 0);
  objc_storeStrong((id *)&self->_scrollItems, 0);
  objc_storeStrong((id *)&self->_moreItems, 0);
  objc_storeStrong((id *)&self->_rotateItems, 0);
  objc_storeStrong((id *)&self->_hardwareItems, 0);
  objc_storeStrong((id *)&self->_touchItems, 0);
  objc_storeStrong((id *)&self->_initialItems, 0);
  objc_storeStrong((id *)&self->_sideAppMoreRockerItems, 0);
  objc_storeStrong((id *)&self->_backButtonConstraints, 0);
  objc_storeStrong((id *)&self->_disableDashBoardGesturesAssertion, 0);
  objc_storeStrong((id *)&self->_lastMenuItemActivated, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_destroyWeak((id *)&self->_displayManager);
  objc_storeStrong((id *)&self->_nubbitImage, 0);
  objc_storeStrong((id *)&self->_tripleClickButton, 0);
  objc_storeStrong((id *)&self->_layoutView, 0);
  objc_storeStrong((id *)&self->_maskImageView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_volumeBar, 0);
  objc_storeStrong((id *)&self->_volumeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_volumeHideTimer, 0);
  objc_storeStrong((id *)&self->_nubbitForeground, 0);
  objc_storeStrong((id *)&self->_nubbitFadeTimer, 0);
  objc_storeStrong((id *)&self->_homeButtonDismissTimer, 0);
  objc_storeStrong((id *)&self->_rockerLink, 0);
  objc_storeStrong((id *)&self->_middleCircle, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_selectedButton, 0);
  objc_storeStrong((id *)&self->_rockerItems, 0);

  objc_storeStrong((id *)&self->_stackState, 0);
}

@end
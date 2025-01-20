@interface CAMSystemOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_debounceHalfPress;
- (BOOL)_debugLoggingEnabled;
- (BOOL)_doubleHalfPressOpensMenu;
- (BOOL)_ignoreScrollUnderPressure;
- (BOOL)_overlayEnabled;
- (BOOL)_selectCurrentMenuItemIfMenuVisible;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isControlEnabledAtIndex:(unint64_t)a3;
- (BOOL)swipeForOverlaySupported;
- (CAMAbstractOverlayServiceControl)activeControl;
- (CAMHalfPressContactRecognizer)_halfPressRecognizer;
- (CAMMotionController)_motionController;
- (CAMSystemOverlayStateMachine)_stateMachine;
- (CAMSystemOverlayTipManager)_tipManager;
- (CAMSystemOverlayViewController)initWithMotionController:(id)a3;
- (CAMSystemOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CAMSystemOverlayViewControllerDelegate)delegate;
- (CEKContactRecognizer)_currentPositionDeltaApplicator;
- (NSArray)controls;
- (NSDate)_touchStartTime;
- (NSDictionary)controlsByID;
- (NSMutableDictionary)_updatesByID;
- (NSMutableSet)_contactRecognizers;
- (NSNumberFormatter)_numberFormatter;
- (NSString)_selectedControlIdentifier;
- (OS_dispatch_source)_handleBarTimer;
- (_UIPhysicalButtonInteraction)_buttonInteraction;
- (double)_doubleHalfPressTimestamp;
- (double)_touchTimeInterval;
- (id)_controlImageNames;
- (id)_disabledControlsIndices;
- (id)_displayNumberForControl:(id)a3 update:(id)a4;
- (id)_displayValueRangeForControl:(id)a3;
- (id)_numberForUpdate:(id)a3;
- (id)_primaryValuesForControl:(id)a3;
- (id)_protectedValuesForControl:(id)a3;
- (id)_selectedControl;
- (id)_updateForControl:(id)a3 displayValue:(id)a4;
- (id)_valueRangeForControl:(id)a3;
- (id)_valueTextForControl:(id)a3 update:(id)a4 useLeadingZero:(BOOL)a5;
- (id)menuTitleForControlAtIndex:(unint64_t)a3;
- (id)overlayView:(id)a3 cellConfigurationForNumber:(id)a4;
- (id)valueTextForCurrentControl;
- (int64_t)_rangeScaleForControl:(id)a3;
- (unint64_t)_numberFullPress;
- (unint64_t)_numberHalfPress;
- (unint64_t)_numberTouches;
- (unint64_t)_selectedControlIndex;
- (unint64_t)_styleForControl:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelHandleBarTimerIfNeeded;
- (void)_commonInitWithMotionController:(id)a3;
- (void)_currentPositionApplicatorApplyAction:(id)a3;
- (void)_forceUpdateSliderData;
- (void)_handleApplicationDidEnterBackground:(id)a3;
- (void)_handleBarTimerFired:(id)a3;
- (void)_handleButton:(unint64_t)a3 stage:(unint64_t)a4 phase:(unint64_t)a5 position:(double)a6 delta:(double)a7;
- (void)_handleContact:(id)a3 action:(id)a4 stage:(unint64_t)a5 phase:(unint64_t)a6 position:(double)a7 delta:(double)a8;
- (void)_handleTouchingGesture:(id)a3;
- (void)_motionControllerDidChangeOrientation:(id)a3;
- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5;
- (void)_promoteMenuSelectionIndexIfAvailableNotifyingDelegate:(BOOL)a3;
- (void)_selectCurrentMenuItemIfMenuVisible;
- (void)_setActiveControl:(id)a3;
- (void)_setControls:(id)a3;
- (void)_setControlsByID:(id)a3;
- (void)_setCurrentPositionDeltaApplicator:(id)a3;
- (void)_setDebounceHalfPress:(BOOL)a3;
- (void)_setDoubleHalfPressTimestamp:(double)a3;
- (void)_setHandleBarTimer:(id)a3;
- (void)_setOverlayEnabled:(BOOL)a3;
- (void)_setPhysicalButtonInteraction:(id)a3;
- (void)_setSelectedControlIndex:(unint64_t)a3;
- (void)_setUpdatesByID:(id)a3;
- (void)_startHandleBarTimerIfNeeded;
- (void)_updateCurrentPositionDeltaApplicatorForDelta:(double)a3;
- (void)_updateMetricsForButton:(unint64_t)a3 stage:(unint64_t)a4 phase:(unint64_t)a5;
- (void)_updateNumberFormatterRounding;
- (void)_updateSliderDataIfNeeded;
- (void)_updateSliderStateAnimated:(BOOL)a3;
- (void)_updateSliderStateWithOffset:(double)a3 animated:(BOOL)a4;
- (void)addContactRecognizer:(id)a3;
- (void)applyControlUpdate:(id)a3;
- (void)dismissOverlayForced:(BOOL)a3;
- (void)halfPressContactRecognizerDoubleHalfPressDidEnd:(id)a3 timestamp:(double)a4;
- (void)halfPressContactRecognizerSingleHalfPressDidBegin:(id)a3 timestamp:(double)a4;
- (void)halfPressContactRecognizerSingleHalfPressDidCancel:(id)a3 timestamp:(double)a4;
- (void)halfPressContactRecognizerSingleHalfPressDidEnd:(id)a3 timestamp:(double)a4;
- (void)loadView;
- (void)overlayView:(id)a3 menuDidChangePresented:(BOOL)a4;
- (void)overlayView:(id)a3 menuDidSelectControlAtIndex:(unint64_t)a4;
- (void)overlayView:(id)a3 menuWillChangePresented:(BOOL)a4;
- (void)overlayView:(id)a3 performedDismissGesture:(id)a4;
- (void)overlayViewSliderDidChangeCurrentValue:(id)a3;
- (void)overlayViewSliderDidEndScrolling:(id)a3;
- (void)overlayViewSliderWillBeginScrolling:(id)a3;
- (void)removeContactRecognizer:(id)a3;
- (void)restartControlMetrics;
- (void)setControls:(id)a3 updatesByID:(id)a4 activeControl:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setSwipeForOverlaySupported:(BOOL)a3;
- (void)set_numberFullPress:(unint64_t)a3;
- (void)set_numberHalfPress:(unint64_t)a3;
- (void)set_numberTouches:(unint64_t)a3;
- (void)set_touchStartTime:(id)a3;
- (void)set_touchTimeInterval:(double)a3;
- (void)submitMetrics;
- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4;
- (void)systemOverlayVisibilityBeganHidingTimer:(id)a3;
- (void)systemOverlayVisibilityCancelledHidingTimer:(id)a3;
- (void)updateUIForCapturingMovieRecording:(BOOL)a3;
- (void)valueTextForCurrentControl;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CAMSystemOverlayViewController

- (CAMSystemOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CAMSystemOverlayViewController;
  v4 = [(CAMSystemOverlayViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(CAMSystemOverlayViewController *)v4 _commonInitWithMotionController:0];
  }
  return v5;
}

- (CAMSystemOverlayViewController)initWithMotionController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMSystemOverlayViewController;
  v5 = [(CAMSystemOverlayViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CAMSystemOverlayViewController *)v5 _commonInitWithMotionController:v4];
  }

  return v6;
}

- (void)_commonInitWithMotionController:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (CAMMotionController *)a3;
  v5 = v4;
  if (!v4) {
    v5 = objc_alloc_init(CAMMotionController);
  }
  objc_storeStrong((id *)&self->__motionController, v5);
  if (!v4) {

  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__motionControllerDidChangeOrientation_ name:@"CAMMotionControllerCaptureOrientationChangedNotification" object:0];

  objc_super v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__handleApplicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];

  objc_super v8 = objc_alloc_init(CAMSystemOverlayStateMachine);
  stateMachine = self->__stateMachine;
  self->__stateMachine = v8;

  [(CAMSystemOverlayStateMachine *)self->__stateMachine setDelegate:self];
  self->__debugLoggingEnabled = CFPreferencesGetAppIntegerValue(@"systemOverlay.debugLoggingEnabled", @"com.apple.camera", 0) != 0;
  self->__ignoreScrollUnderPressure = CFPreferencesGetAppIntegerValue(@"systemOverlay.ignoreScrollUnderPressure", @"com.apple.camera", 0) != 0;
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"systemOverlay.doubleHalfPressOpensMenu", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v11 = AppIntegerValue == 0;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v12 = !v11;
  self->__doubleHalfPressOpensMenu = v12;
  v13 = +[CAMCaptureCapabilities capabilities];
  v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  contactRecognizers = self->__contactRecognizers;
  self->__contactRecognizers = v14;

  if ([v13 isHalfPressSupported])
  {
    v16 = objc_alloc_init(CAMHalfPressContactRecognizer);
    halfPressRecognizer = self->__halfPressRecognizer;
    self->__halfPressRecognizer = v16;

    [(CAMHalfPressContactRecognizer *)self->__halfPressRecognizer setDelegate:self];
    [(NSMutableSet *)self->__contactRecognizers addObject:self->__halfPressRecognizer];
  }
  if (CFPreferencesGetAppBooleanValue(@"systemOverlay.resetTipDataStoreOnOverlayLaunch", @"com.apple.camera", 0))
  {
    +[CAMSystemOverlayTipManager resetDataStore];
  }
  +[CAMSystemOverlayTipManager configure];
  if (+[CAMSystemOverlayTipManager anyTipPendingOrAvailable])
  {
    v18 = objc_alloc_init(CAMSystemOverlayTipManager);
    tipManager = self->__tipManager;
    self->__tipManager = v18;
  }
  uint64_t v20 = [v13 bypassWelcomeScreens];
  v21 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v24 = v20;
    _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "Overlay tip skipTips %d", buf, 8u);
  }

  [(CAMSystemOverlayTipManager *)self->__tipManager setSkipTipParameter:v20];
}

- (void)loadView
{
  id v4 = objc_alloc_init(CAMSystemOverlayView);
  v3 = [(CAMSystemOverlayViewController *)self _motionController];
  -[CAMSystemOverlayView setOrientation:](v4, "setOrientation:", [v3 captureOrientation]);

  [(CAMSystemOverlayView *)v4 setDelegate:self];
  [(CAMSystemOverlayViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSystemOverlayViewController;
  [(CAMSystemOverlayViewController *)&v5 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__handleTouchingGesture_];
  [v3 setMinimumPressDuration:0.0];
  [v3 setDelegate:self];
  [v3 _wantsGESEvents:1];
  id v4 = [(CAMSystemOverlayViewController *)self view];
  [v4 addGestureRecognizer:v3];

  [(CAMSystemOverlayViewController *)self restartControlMetrics];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CAMSystemOverlayViewController;
  [(CAMSystemOverlayViewController *)&v13 viewDidAppear:a3];
  id v4 = [(CAMSystemOverlayViewController *)self _buttonInteraction];

  if (!v4)
  {
    objc_super v5 = [MEMORY[0x263F83068] _cameraShutterConfigurationsWithOptionsProvider:&__block_literal_global_44];
    v6 = (void *)[objc_alloc(MEMORY[0x263F83070]) initWithConfigurations:v5 delegate:self];
    [(CAMSystemOverlayViewController *)self _setPhysicalButtonInteraction:v6];
    objc_super v7 = [(CAMSystemOverlayViewController *)self view];
    [v7 addInteraction:v6];
  }
  objc_super v8 = [(CAMSystemOverlayViewController *)self _tipManager];
  v9 = [(CAMSystemOverlayViewController *)self _motionController];
  objc_msgSend(v8, "setIsPortraitOrientation:", objc_msgSend(v9, "captureOrientation") == 1);

  v10 = [(CAMSystemOverlayViewController *)self _tipManager];
  BOOL v11 = [(CAMSystemOverlayViewController *)self overlayView];
  BOOL v12 = [v11 tipAnchor];
  [v10 startTipObservationForViewController:self sourceItem:v12];
}

uint64_t __48__CAMSystemOverlayViewController_viewDidAppear___block_invoke()
{
  return [MEMORY[0x263F83060] behaviorOptions];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSystemOverlayViewController;
  [(CAMSystemOverlayViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(CAMSystemOverlayViewController *)self _tipManager];
  [v4 stopTipObservation];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v3 = [(CAMSystemOverlayViewController *)self overlayView];
  if ([v3 isSliderVisible]) {
    BOOL v4 = [v3 sliderContent] != 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_handleTouchingGesture:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1) {
      return;
    }
    id v5 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v5 addReason:1];
  }
  else
  {
    id v5 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v5 removeReason:1];
  }
}

- (void)overlayViewSliderDidChangeCurrentValue:(id)a3
{
  if (![a3 sliderContent] && -[CAMSystemOverlayViewController _overlayEnabled](self, "_overlayEnabled"))
  {
    uint64_t v4 = [(CAMSystemOverlayViewController *)self overlayView];
    [v4 setHandleBarVisible:0 animated:1];

    id v13 = [(CAMSystemOverlayViewController *)self _selectedControlIdentifier];
    id v5 = [(CAMSystemOverlayViewController *)self overlayView];
    v6 = [v5 slider];
    objc_super v7 = [v6 currentNumber];

    objc_super v8 = [(CAMSystemOverlayViewController *)self controlsByID];
    v9 = [v8 objectForKeyedSubscript:v13];

    v10 = [(CAMSystemOverlayViewController *)self _updateForControl:v9 displayValue:v7];
    BOOL v11 = [(CAMSystemOverlayViewController *)self _updatesByID];
    [v11 setObject:v10 forKeyedSubscript:v13];

    BOOL v12 = [(CAMSystemOverlayViewController *)self delegate];
    [v12 systemOverlayViewController:self didUpdateControl:v10];
  }
}

- (void)overlayViewSliderWillBeginScrolling:(id)a3
{
  id v3 = [(CAMSystemOverlayViewController *)self _stateMachine];
  [v3 addReason:2];
}

- (void)overlayViewSliderDidEndScrolling:(id)a3
{
  id v3 = [(CAMSystemOverlayViewController *)self _stateMachine];
  [v3 removeReason:2];
}

- (void)overlayView:(id)a3 menuWillChangePresented:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [a3 menu];
  if (v4)
  {
    v6 = [(CAMSystemOverlayViewController *)self _controlImageNames];
    [v8 setImageNames:v6];

    objc_msgSend(v8, "setSelectedControlIndex:", -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex"));
    objc_super v7 = [(CAMSystemOverlayViewController *)self _disabledControlsIndices];
    [v8 setDisabledMenuItemsIndices:v7];
  }
  else
  {
    [(CAMSystemOverlayViewController *)self _promoteMenuSelectionIndexIfAvailableNotifyingDelegate:1];
  }
}

- (void)_promoteMenuSelectionIndexIfAvailableNotifyingDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMSystemOverlayViewController *)self overlayView];
  v6 = [v5 menu];
  if ([v5 isSliderVisible] && v6)
  {
    unint64_t v7 = [v6 selectedControlIndex];
    id v8 = [(CAMSystemOverlayViewController *)self controls];
    if (v7 >= [v8 count])
    {
      BOOL v11 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CAMSystemOverlayViewController _promoteMenuSelectionIndexIfAvailableNotifyingDelegate:](v8);
      }
    }
    else
    {
      v9 = [v8 objectAtIndexedSubscript:v7];
      if ([v9 isEnabled])
      {
        if (v7 != [(CAMSystemOverlayViewController *)self _selectedControlIndex])
        {
          [(CAMSystemOverlayViewController *)self _setSelectedControlIndex:v7];
          [(CAMSystemOverlayViewController *)self _updateNumberFormatterRounding];
          [(CAMSystemOverlayViewController *)self _updateSliderDataIfNeeded];
          [(CAMSystemOverlayViewController *)self _setActiveControl:v9];
          if (v3)
          {
            v10 = [(CAMSystemOverlayViewController *)self delegate];
            [v10 systemOverlayViewController:self didChangeActiveControl:v9];
          }
        }
      }
    }
  }
}

- (void)overlayView:(id)a3 menuDidChangePresented:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (v4)
  {
    v6 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v6 addReason:3];

    unint64_t v7 = [v12 slider];
    id v8 = [v7 contactRecognizer];
    [v8 contactEndedWithAction:0];

    [(CAMSystemOverlayViewController *)self _cancelHandleBarTimerIfNeeded];
    v9 = [(CAMSystemOverlayViewController *)self _tipManager];
    [v9 recordMenuVisibleEvent];
LABEL_5:

    goto LABEL_7;
  }
  if ([(CAMSystemOverlayViewController *)self isControlEnabledAtIndex:[(CAMSystemOverlayViewController *)self _selectedControlIndex]])
  {
    v10 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v10 removeReason:3];

    v9 = [v12 menu];
    BOOL v11 = [v9 contactRecognizer];
    [v11 contactEndedWithAction:0];

    goto LABEL_5;
  }
  [(CAMSystemOverlayViewController *)self dismissOverlayForced:1];
LABEL_7:
}

- (void)overlayView:(id)a3 menuDidSelectControlAtIndex:(unint64_t)a4
{
  id v6 = [(CAMSystemOverlayViewController *)self delegate];
  [v6 systemOverlayViewController:self menuDidScrollToControlAtIndex:a4];
}

- (id)overlayView:(id)a3 cellConfigurationForNumber:(id)a4
{
  id v5 = a4;
  id v6 = [(CAMSystemOverlayViewController *)self _selectedControl];
  if (![v6 controlType]
    && [v6 sliderType] == 7
    && ([v5 floatValue], v7 == *MEMORY[0x263F30720]))
  {
    id v8 = [MEMORY[0x263F82818] configurationWithPointSize:12.0];
    v9 = [MEMORY[0x263F827E8] systemImageNamed:@"person.fill" withConfiguration:v8];
    v10 = (void *)[objc_alloc(MEMORY[0x263F30708]) initWithImage:v9];
  }
  else
  {
    id v8 = [(CAMSystemOverlayViewController *)self _updateForControl:v6 displayValue:v5];
    v9 = [(CAMSystemOverlayViewController *)self _valueTextForControl:v6 update:v8 useLeadingZero:0];
    id v11 = objc_alloc(MEMORY[0x263F30708]);
    id v12 = +[CAMFont cameraMonospacedFontOfSize:14.0 weight:*MEMORY[0x263F81840]];
    v10 = (void *)[v11 initWithText:v9 font:v12];
  }
  return v10;
}

- (id)valueTextForCurrentControl
{
  unint64_t v3 = [(CAMSystemOverlayViewController *)self _selectedControlIndex];
  BOOL v4 = [(CAMSystemOverlayViewController *)self controls];
  unint64_t v5 = [v4 count];

  if (v3 >= v5)
  {
    id v11 = [(CAMSystemOverlayViewController *)self controls];
    uint64_t v12 = [v11 count];

    id v13 = os_log_create("com.apple.camera.overlay", "Angel");
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CAMSystemOverlayViewController valueTextForCurrentControl](self);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, "OverlayVC: Attempt to request text for control when there are no controls", v16, 2u);
    }

    v10 = &stru_26BD78BA0;
  }
  else
  {
    id v6 = [(CAMSystemOverlayViewController *)self _selectedControl];
    float v7 = [(CAMSystemOverlayViewController *)self _updatesByID];
    id v8 = [v6 identifier];
    v9 = [v7 objectForKeyedSubscript:v8];

    v10 = [(CAMSystemOverlayViewController *)self _valueTextForControl:v6 update:v9 useLeadingZero:1];
  }
  return v10;
}

- (id)_valueTextForControl:(id)a3 update:(id)a4 useLeadingZero:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(CAMSystemOverlayViewController *)self _displayValueRangeForControl:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v8 valueFormat];
  }
  else
  {
    id v11 = 0;
  }
  if ([v10 isFloatingPoint])
  {
    id v12 = [(CAMSystemOverlayViewController *)self _displayNumberForControl:v8 update:v9];
    id v13 = [(CAMSystemOverlayViewController *)self _numberFormatter];
    [v13 setMinimumIntegerDigits:v5];
    if (v12)
    {
      v14 = [v13 stringFromNumber:v12];
    }
    else
    {
      v14 = &stru_26BD78BA0;
    }
    v16 = [v13 stringFromNumber:&unk_26BDE05B0];
    if ([(__CFString *)v14 isEqualToString:v16])
    {
      uint64_t v17 = [v13 stringFromNumber:&unk_26BDDF588];

      v14 = (__CFString *)v17;
    }
    if (v11)
    {
      v18 = [NSString stringWithValidatedFormat:v11, @"%@", 0, v14 validFormatSpecifiers error];
      v19 = v18;
      if (v18)
      {
        uint64_t v20 = v18;

        v14 = v20;
      }
    }
  }
  else
  {
    if ([v10 valueType] == 1)
    {
      id v12 = [v8 valueTitles];
      uint64_t v15 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v9, "indexValue"));
    }
    else
    {
      if ([v10 valueType] != 3)
      {
        v14 = &stru_26BD78BA0;
        goto LABEL_25;
      }
      id v12 = v8;
      if ([v9 BOOLeanValue]) {
        [v12 onTitle];
      }
      else {
      uint64_t v15 = [v12 offTitle];
      }
    }
    v14 = (__CFString *)v15;
  }

LABEL_25:
  return v14;
}

- (id)menuTitleForControlAtIndex:(unint64_t)a3
{
  BOOL v4 = [(CAMSystemOverlayViewController *)self controls];
  BOOL v5 = [v4 objectAtIndexedSubscript:a3];
  id v6 = [v5 title];

  return v6;
}

- (BOOL)isControlEnabledAtIndex:(unint64_t)a3
{
  BOOL v5 = [(CAMSystemOverlayViewController *)self controls];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 0;
  }
  float v7 = [(CAMSystemOverlayViewController *)self controls];
  id v8 = [v7 objectAtIndexedSubscript:a3];
  char v9 = [v8 isEnabled];

  return v9;
}

- (void)overlayView:(id)a3 performedDismissGesture:(id)a4
{
}

- (void)dismissOverlayForced:(BOOL)a3
{
  if (a3
    || ([(CAMSystemOverlayViewController *)self _stateMachine],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 currentStage],
        v4,
        !v5))
  {
    [(CAMSystemOverlayViewController *)self _promoteMenuSelectionIndexIfAvailableNotifyingDelegate:0];
    unint64_t v6 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v6 endAllStages];

    [(CAMSystemOverlayViewController *)self _cancelHandleBarTimerIfNeeded];
    float v7 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v7 hideImmediately];

    [(CAMSystemOverlayViewController *)self _updateSliderStateAnimated:1];
    id v8 = [(CAMSystemOverlayViewController *)self _tipManager];
    [v8 setSliderVisibleParameter:0];

    id v9 = [(CAMSystemOverlayViewController *)self _halfPressRecognizer];
    [v9 reset];
  }
}

- (void)updateUIForCapturingMovieRecording:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CAMSystemOverlayViewController *)self overlayView];
  [v5 setSliderFeedbackDisabled:v3];

  unint64_t v6 = [(CAMSystemOverlayViewController *)self _tipManager];
  [v6 setRecordingParameter:v3];

  if (v3)
  {
    float v7 = [(CAMSystemOverlayViewController *)self _stateMachine];
    uint64_t v8 = [v7 currentStage];

    if (v8 == 4)
    {
      [(CAMSystemOverlayViewController *)self dismissOverlayForced:1];
    }
  }
}

- (void)_motionControllerDidChangeOrientation:(id)a3
{
  id v8 = [(CAMSystemOverlayViewController *)self _motionController];
  BOOL v4 = [(CAMSystemOverlayViewController *)self overlayView];
  uint64_t v5 = [v4 isSliderVisible];

  unint64_t v6 = [(CAMSystemOverlayViewController *)self overlayView];
  objc_msgSend(v6, "setOrientation:animated:", objc_msgSend(v8, "captureOrientation"), v5);

  float v7 = [(CAMSystemOverlayViewController *)self _tipManager];
  objc_msgSend(v7, "setIsPortraitOrientation:", objc_msgSend(v8, "captureOrientation") == 1);
}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
  BOOL v4 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "_handleApplicationDidEnterBackground UIApplicationDidEnterBackgroundNotification invoked", v5, 2u);
  }

  [(CAMSystemOverlayViewController *)self submitMetrics];
  [(CAMSystemOverlayViewController *)self restartControlMetrics];
}

- (void)setControls:(id)a3 updatesByID:(id)a4 activeControl:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAMSystemOverlayViewController *)self controls];
  if ([v8 isEqualToArray:v11])
  {
    id v12 = [(CAMSystemOverlayViewController *)self _updatesByID];
    char v13 = [v9 isEqualToDictionary:v12];

    if (v13) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  id v58 = v10;
  v14 = [(CAMSystemOverlayViewController *)self activeControl];
  uint64_t v15 = [(CAMSystemOverlayViewController *)self _updatesByID];
  v56 = v14;
  v16 = [v14 identifier];
  uint64_t v17 = [v15 objectForKeyedSubscript:v16];
  v18 = [(CAMSystemOverlayViewController *)self _numberForUpdate:v17];

  v19 = (void *)[v9 mutableCopy];
  [(CAMSystemOverlayViewController *)self _setUpdatesByID:v19];

  uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v57 = v8;
  id v21 = v8;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v61 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v27 = [v26 identifier];
        [v20 setObject:v26 forKeyedSubscript:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v23);
  }

  [(CAMSystemOverlayViewController *)self _setControlsByID:v20];
  [(CAMSystemOverlayViewController *)self _setControls:v21];
  [(CAMSystemOverlayViewController *)self _setSelectedControlIndex:0];
  if (v58)
  {
    uint64_t v28 = [v21 indexOfObject:v58];
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(CAMSystemOverlayViewController *)self _setSelectedControlIndex:v28];
      [(CAMSystemOverlayViewController *)self _setActiveControl:v58];
    }
  }
  v29 = [(CAMSystemOverlayViewController *)self activeControl];

  if (!v29)
  {
    v30 = [v21 firstObject];
    [(CAMSystemOverlayViewController *)self _setActiveControl:v30];
  }
  uint64_t v31 = [v21 count];
  if ((v31 != 0) != [(CAMSystemOverlayViewController *)self _overlayEnabled])
  {
    v32 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = @"disabled";
      if (v31) {
        v33 = @"enabled";
      }
      *(_DWORD *)buf = 138543362;
      v65 = v33;
      _os_log_impl(&dword_2099F8000, v32, OS_LOG_TYPE_DEFAULT, "OverlayVC: %{public}@", buf, 0xCu);
    }

    [(CAMSystemOverlayViewController *)self _setOverlayEnabled:v31 != 0];
    v34 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v34 endAllStages];
  }
  v35 = [(CAMSystemOverlayViewController *)self _tipManager];
  v36 = [(CAMSystemOverlayViewController *)self controls];
  objc_msgSend(v35, "setControlsCountParameter:", objc_msgSend(v36, "count"));

  v37 = [(CAMSystemOverlayViewController *)self activeControl];
  v38 = [v37 identifier];
  v39 = [v9 objectForKeyedSubscript:v38];
  v40 = [(CAMSystemOverlayViewController *)self _numberForUpdate:v39];

  v41 = [(CAMSystemOverlayViewController *)self activeControl];
  if (![v56 isContentEqual:v41])
  {

    id v10 = v58;
    goto LABEL_27;
  }
  char v42 = [v18 isEqualToNumber:v40];

  id v10 = v58;
  if ((v42 & 1) == 0)
  {
LABEL_27:
    v43 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v43 hideImmediately];

    [(CAMSystemOverlayViewController *)self _updateSliderStateAnimated:1];
  }
  [(CAMSystemOverlayViewController *)self _updateNumberFormatterRounding];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"systemOverlay.halfPressGestureEnabled", @"com.apple.camera", &keyExistsAndHasValidFormat);
  v45 = +[CAMCaptureCapabilities capabilities];
  int v46 = [v45 isHalfPressSupported];

  if (!v46)
  {
    v52 = [(CAMSystemOverlayViewController *)self _halfPressRecognizer];
    [v52 setEnabled:0];

    v53 = [(CAMSystemOverlayViewController *)self overlayView];
    [v53 setHalfPressEnabled:0];

    v54 = [(CAMSystemOverlayViewController *)self _stateMachine];
    [v54 setHalfPressEnabled:0];

    id v8 = v57;
    goto LABEL_38;
  }
  if (keyExistsAndHasValidFormat) {
    BOOL v47 = AppBooleanValue == 0;
  }
  else {
    BOOL v47 = 0;
  }
  uint64_t v48 = !v47;
  v49 = [(CAMSystemOverlayViewController *)self _halfPressRecognizer];
  [v49 setEnabled:v48];

  v50 = [(CAMSystemOverlayViewController *)self overlayView];
  [v50 setHalfPressEnabled:v48];

  v51 = [(CAMSystemOverlayViewController *)self _stateMachine];
  [v51 setHalfPressEnabled:v48];

  id v8 = v57;
  if ((v48 & 1) == 0)
  {
LABEL_38:
    v55 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v55, OS_LOG_TYPE_DEFAULT, "OverlayVC: Half press disabled via defaults write.", buf, 2u);
    }
  }
LABEL_42:
}

- (void)applyControlUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 controlIdentifier];
  unint64_t v6 = [(CAMSystemOverlayViewController *)self controlsByID];
  float v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    if ([v4 isValueUpdate])
    {
      id v8 = [(CAMSystemOverlayViewController *)self _updatesByID];
      [v8 setObject:v4 forKeyedSubscript:v5];
    }
    else
    {
      if ([v4 valueType] != 5) {
        goto LABEL_13;
      }
      uint64_t v12 = [v4 isEnabled];
      [v7 setEnabled:v12];
      id v8 = [(CAMSystemOverlayViewController *)self overlayView];
      if ([v8 isSliderVisible])
      {
        if ([v8 sliderContent] == 1)
        {
          char v13 = [(CAMSystemOverlayViewController *)self _disabledControlsIndices];
          v14 = [v8 menu];
          [v14 setDisabledMenuItemsIndices:v13];

          [v8 reloadValueLabel];
        }
        else if (![v8 sliderContent])
        {
          uint64_t v15 = [(CAMSystemOverlayViewController *)self _selectedControl];

          if (v7 == v15)
          {
            v16 = [v8 slider];
            [v16 setEnabled:v12];
          }
        }
      }
    }

    id v9 = [(CAMSystemOverlayViewController *)self _selectedControlIdentifier];
    int v10 = [v5 isEqualToString:v9];

    if (v10) {
      [(CAMSystemOverlayViewController *)self _updateSliderDataIfNeeded];
    }
  }
  else
  {
    id v11 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAMSystemOverlayViewController applyControlUpdate:]((uint64_t)v5, v11);
    }
  }
LABEL_13:
}

- (id)_selectedControl
{
  BOOL v3 = [(CAMSystemOverlayViewController *)self controls];
  unint64_t v4 = [(CAMSystemOverlayViewController *)self _selectedControlIndex];
  if (v4 >= [v3 count])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v3 objectAtIndexedSubscript:v4];
  }

  return v5;
}

- (NSString)_selectedControlIdentifier
{
  v2 = [(CAMSystemOverlayViewController *)self _selectedControl];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

- (id)_controlImageNames
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(CAMSystemOverlayViewController *)self controls];
  BOOL v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "imageName", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_disabledControlsIndices
{
  v2 = [(CAMSystemOverlayViewController *)self controls];
  BOOL v3 = [MEMORY[0x263F089C8] indexSet];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CAMSystemOverlayViewController__disabledControlsIndices__block_invoke;
  v6[3] = &unk_263FA5438;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

uint64_t __58__CAMSystemOverlayViewController__disabledControlsIndices__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 isEnabled];
  if ((result & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 addIndex:a3];
  }
  return result;
}

- (NSNumberFormatter)_numberFormatter
{
  numberFormatter = self->__numberFormatter;
  if (!numberFormatter)
  {
    id v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    uint64_t v5 = self->__numberFormatter;
    self->__numberFormatter = v4;

    [(NSNumberFormatter *)self->__numberFormatter setNumberStyle:1];
    [(NSNumberFormatter *)self->__numberFormatter setMinimumFractionDigits:0];
    [(NSNumberFormatter *)self->__numberFormatter setMaximumFractionDigits:1];
    [(NSNumberFormatter *)self->__numberFormatter setRoundingIncrement:&unk_26BDDF598];
    [(CAMSystemOverlayViewController *)self _updateNumberFormatterRounding];
    numberFormatter = self->__numberFormatter;
  }
  uint64_t v6 = numberFormatter;
  return v6;
}

- (void)_updateNumberFormatterRounding
{
  BOOL v3 = [(CAMSystemOverlayViewController *)self _selectedControl];
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    BOOL v3 = (void *)[v3 controlType];
    id v4 = v8;
    if (!v3)
    {
      uint64_t v5 = [(CAMSystemOverlayViewController *)self _numberFormatter];
      if ([(CAMSystemOverlayViewController *)self _styleForControl:v8] == 3)
      {
        [v5 setMaximumFractionDigits:0];
        [v5 setRoundingIncrement:&unk_26BDDF5A8];
        [v5 setRoundingMode:5];
      }
      else
      {
        [v5 setMaximumFractionDigits:1];
        [v5 setRoundingIncrement:&unk_26BDDF598];
        uint64_t v6 = [(CAMSystemOverlayViewController *)self _valueRangeForControl:v8];
        if ([v6 isDiscrete]) {
          uint64_t v7 = 5;
        }
        else {
          uint64_t v7 = 1;
        }
        [v5 setRoundingMode:v7];
      }
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v43 = a5;
  uint64_t v44 = [v9 _button];
  unint64_t v10 = [v9 _stage];
  unint64_t v11 = [v9 _numberOfStages];
  long long v12 = [v9 _contact];
  uint64_t v13 = [v9 _stagePhase];
  uint64_t v14 = 3;
  if (!v13) {
    uint64_t v14 = 0;
  }
  BOOL v15 = v13 == 1;
  if (v13 == 1) {
    uint64_t v14 = 1;
  }
  if (v13 == 2) {
    BOOL v15 = 0;
  }
  BOOL v42 = v15;
  if (v13 == 2) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = v14;
  }
  char v17 = [v12 touchPositionHints];
  char v18 = v17;
  BOOL v19 = (v17 & 0xC) != 0;
  if (v17) {
    BOOL v19 = 0;
  }
  double v20 = 0.0;
  double v21 = 0.0;
  if ((v17 & 0x10) == 0 && !v19)
  {
    uint64_t v22 = [v9 _contact];
    [v22 positionDelta];
    double v20 = v23;

    [v12 position];
    double v21 = v24;
  }
  unsigned int v25 = [v12 isTouching];
  uint64_t v26 = 4;
  uint64_t v27 = 3;
  uint64_t v28 = 2;
  if (v10 == 1) {
    uint64_t v29 = 1;
  }
  else {
    uint64_t v29 = v25;
  }
  if (v10 <= 1) {
    uint64_t v28 = v29;
  }
  if (v10 != 3) {
    uint64_t v27 = v28;
  }
  if (v10 <= 3) {
    uint64_t v26 = v27;
  }
  if (v11 <= 1) {
    uint64_t v30 = 4 * (v10 != 0);
  }
  else {
    uint64_t v30 = v26;
  }
  if ([(CAMSystemOverlayViewController *)self _debugLoggingEnabled])
  {
    uint64_t v31 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringFromUIPhysicalButton();
      int v40 = v11;
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      [v9 _state];
      _NSStringFromUIPhysicalButtonState();
      id v41 = v8;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      v38 = off_263FA5458[v16];
      v39 = _NSStringFromUITouchSenstiveButtonPositionHint();
      *(_DWORD *)buf = 138544898;
      id v46 = v32;
      __int16 v47 = 2114;
      id v48 = v33;
      __int16 v49 = 1024;
      int v50 = v10;
      __int16 v51 = 1024;
      int v52 = v40;
      __int16 v53 = 2114;
      v54 = v38;
      __int16 v55 = 2114;
      v56 = v12;
      __int16 v57 = 2114;
      id v58 = v39;
      _os_log_impl(&dword_2099F8000, v31, OS_LOG_TYPE_DEFAULT, "Observed physical button: %{public}@; state: %{public}@; stage: %d/%d; stagePhase: %{public}@; contact: %{public"
        "}@; hints: %{public}@",
        buf,
        0x40u);

      id v8 = v41;
    }
  }
  if ([(CAMSystemOverlayViewController *)self swipeForOverlaySupported])
  {
    v34 = [(CAMSystemOverlayViewController *)self _stateMachine];
    if (([v34 isVisible] & 1) == 0)
    {

      if ((v18 & 2) == 0) {
        goto LABEL_36;
      }
      v34 = [(CAMSystemOverlayViewController *)self _stateMachine];
      [v34 addReason:0];
    }
  }
LABEL_36:
  [(CAMSystemOverlayViewController *)self _handleButton:v44 stage:v30 phase:v16 position:v21 delta:v20];
  v35 = [(CAMSystemOverlayViewController *)self _stateMachine];
  uint64_t v36 = [v35 currentStage];

  if (v36)
  {
    if (v42) {
      [(CAMSystemOverlayViewController *)self _currentPositionApplicatorApplyAction:v9];
    }
  }
  else
  {
    v37 = [(CAMSystemOverlayViewController *)self _currentPositionDeltaApplicator];
    [v37 contactEndedWithAction:v9];
  }
  [(CAMSystemOverlayViewController *)self _handleContact:v12 action:v9 stage:v30 phase:v16 position:v21 delta:v20];
  [(CAMSystemOverlayViewController *)self _updateMetricsForButton:v44 stage:v10 phase:v16];
}

- (void)_handleButton:(unint64_t)a3 stage:(unint64_t)a4 phase:(unint64_t)a5 position:(double)a6 delta:(double)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([(CAMSystemOverlayViewController *)self _overlayEnabled])
  {
    long long v12 = +[CAMCaptureCapabilities capabilities];
    uint64_t v13 = [(CAMSystemOverlayViewController *)self overlayView];
    [(CAMSystemOverlayViewController *)self _updateCurrentPositionDeltaApplicatorForDelta:a7];
    if (![v12 allowHalfPressSimulation]) {
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      a4 = 4;
      goto LABEL_9;
    }
    if (a3 == 2)
    {
      a4 = 3;
    }
    else
    {
LABEL_6:
      if (!a4)
      {
LABEL_31:

        return;
      }
    }
LABEL_9:
    uint64_t v14 = [(CAMSystemOverlayViewController *)self _stateMachine];
    int v15 = [v14 wantsOverlayVisible];
    [v14 handleStage:a4 phase:a5];
    int v16 = [v14 wantsOverlayVisible];
    unint64_t v17 = [v14 currentStage];
    if (v15 != v16)
    {
      char v18 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (v17 > 4) {
          BOOL v19 = 0;
        }
        else {
          BOOL v19 = off_263FA5478[v17];
        }
        double v20 = @"hidden";
        if (v16) {
          double v20 = @"visible";
        }
        int v25 = 138543618;
        uint64_t v26 = v19;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, "OverlayVC: Button stage %{public}@ wants overlay %{public}@", (uint8_t *)&v25, 0x16u);
      }
    }
    if (v16)
    {
      [v14 addReason:0];
    }
    else
    {
      [v14 removeReason:0];
      [v13 performMenuPresentation:0];
    }
    double v21 = [(CAMSystemOverlayViewController *)self _stateMachine];
    int v22 = [v21 isVisible];

    uint64_t v23 = [v13 sliderContent];
    if (a7 != 0.0 || v17 == 4 || v23 || !v22)
    {
      [(CAMSystemOverlayViewController *)self _cancelHandleBarTimerIfNeeded];
      double v24 = [(CAMSystemOverlayViewController *)self overlayView];
      [v24 setHandleBarVisible:0 animated:1];

      if (!a5 && v17 == 4) {
        [(CAMSystemOverlayViewController *)self _selectCurrentMenuItemIfMenuVisible];
      }
    }
    else if (v17)
    {
      [(CAMSystemOverlayViewController *)self _startHandleBarTimerIfNeeded];
    }
    [v13 updateUIForButtonStage:a4];

    goto LABEL_31;
  }
}

- (void)_handleContact:(id)a3 action:(id)a4 stage:(unint64_t)a5 phase:(unint64_t)a6 position:(double)a7 delta:(double)a8
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v11 = a4;
  if ([(CAMSystemOverlayViewController *)self _overlayEnabled])
  {
    if (a5 == 1 && !a6)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v12 = [(CAMSystemOverlayViewController *)self _contactRecognizers];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v34 + 1) + 8 * i) contactBeganWithAction:v11];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v14);
      }
    }
    if (a5 == 1 && a6 == 2)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      unint64_t v17 = [(CAMSystemOverlayViewController *)self _contactRecognizers];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v30 + 1) + 8 * j) contactEndedWithAction:v11];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v19);
      }
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      unint64_t v17 = [(CAMSystemOverlayViewController *)self _contactRecognizers];
      uint64_t v22 = [v17 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v27;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v27 != v24) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * k) contactUpdatedWithAction:v11];
          }
          uint64_t v23 = [v17 countByEnumeratingWithState:&v26 objects:v38 count:16];
        }
        while (v23);
      }
    }
  }
}

- (void)addContactRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMSystemOverlayViewController *)self _contactRecognizers];
  [v5 addObject:v4];
}

- (void)removeContactRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMSystemOverlayViewController *)self _contactRecognizers];
  [v5 removeObject:v4];
}

- (void)_updateSliderStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMSystemOverlayViewController *)self _stateMachine];
  if ([v5 isVisible])
  {
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v6 = [(CAMSystemOverlayViewController *)self _stateMachine];
  int v7 = [v6 wantsOverlayHint];

  if (v7)
  {
    id v5 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CAMSystemOverlayViewController _updateSliderStateAnimated:](v5);
    }
    goto LABEL_5;
  }
LABEL_6:
  [(CAMSystemOverlayViewController *)self _updateSliderStateWithOffset:v3 animated:0.0];
}

- (void)_updateSliderStateWithOffset:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(CAMSystemOverlayViewController *)self _overlayEnabled];
  id v8 = [(CAMSystemOverlayViewController *)self _stateMachine];
  uint64_t v9 = [v8 isVisible] & v7;

  id v16 = [(CAMSystemOverlayViewController *)self overlayView];
  if (!v7) {
    goto LABEL_6;
  }
  if (v9)
  {
    uint64_t v10 = +[CAMOverlaySliderState presentedState];
    goto LABEL_7;
  }
  id v11 = [(CAMSystemOverlayViewController *)self _stateMachine];
  int v12 = [v11 wantsOverlayHint];

  if (v12)
  {
    uint64_t v10 = +[CAMOverlaySliderState hintWithNormalizedButtonOffset:](CAMOverlaySliderState, "hintWithNormalizedButtonOffset:", a3 + 0.5, a3 + 0.5);
  }
  else
  {
LABEL_6:
    uint64_t v10 = +[CAMOverlaySliderState hiddenState];
  }
LABEL_7:
  uint64_t v13 = (void *)v10;
  int v14 = [v16 isSliderVisible];
  [v16 setSliderState:v13 animated:v4];
  if (v9 != v14)
  {
    uint64_t v15 = [(CAMSystemOverlayViewController *)self delegate];
    [v15 systemOverlayViewController:self didChangeSliderVisible:v9];
  }
}

- (void)_currentPositionApplicatorApplyAction:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMSystemOverlayViewController *)self _currentPositionDeltaApplicator];
  [v5 contactBeganWithAction:v4];
  [v5 contactUpdatedWithAction:v4];
}

- (void)_updateCurrentPositionDeltaApplicatorForDelta:(double)a3
{
  id v4 = [(CAMSystemOverlayViewController *)self overlayView];
  id v5 = [(CAMSystemOverlayViewController *)self _stateMachine];
  uint64_t v6 = [v5 currentStage];

  if (![v4 isSliderPresented]
    || v6 != 1 && [(CAMSystemOverlayViewController *)self _ignoreScrollUnderPressure])
  {
    goto LABEL_7;
  }
  uint64_t v7 = [v4 sliderContent];
  if (!v7)
  {
    id v8 = [v4 slider];
    goto LABEL_9;
  }
  if (v7 != 1)
  {
LABEL_7:
    id v9 = 0;
    goto LABEL_10;
  }
  id v8 = [v4 menu];
LABEL_9:
  uint64_t v10 = v8;
  id v11 = [v8 contactRecognizer];

  id v9 = v11;
LABEL_10:
  id v12 = v9;
  [(CAMSystemOverlayViewController *)self _setCurrentPositionDeltaApplicator:v9];
}

- (void)_setCurrentPositionDeltaApplicator:(id)a3
{
  id v5 = a3;
  p_currentPositionDeltaApplicator = (id *)&self->__currentPositionDeltaApplicator;
  id v7 = *p_currentPositionDeltaApplicator;
  if (*p_currentPositionDeltaApplicator != v5)
  {
    id v8 = v5;
    [v7 contactEndedWithAction:0];
    objc_storeStrong(p_currentPositionDeltaApplicator, a3);
    id v5 = v8;
  }
  MEMORY[0x270F9A758](v7, v5);
}

- (void)_updateSliderDataIfNeeded
{
  BOOL v3 = [(CAMSystemOverlayViewController *)self overlayView];
  int v4 = [v3 isSliderVisible];

  if (v4)
  {
    [(CAMSystemOverlayViewController *)self _forceUpdateSliderData];
  }
}

- (void)_forceUpdateSliderData
{
  id v14 = [(CAMSystemOverlayViewController *)self overlayView];
  BOOL v3 = [v14 slider];
  int v4 = [(CAMSystemOverlayViewController *)self controls];
  id v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex"));

  uint64_t v6 = [(CAMSystemOverlayViewController *)self _displayValueRangeForControl:v5];
  id v7 = [(CAMSystemOverlayViewController *)self _updatesByID];
  id v8 = [v5 identifier];
  id v9 = [v7 objectForKeyedSubscript:v8];

  unint64_t v10 = [(CAMSystemOverlayViewController *)self _styleForControl:v5];
  id v11 = [(CAMSystemOverlayViewController *)self _protectedValuesForControl:v5];
  if (v11)
  {
    objc_msgSend(v3, "configureWithRange:protectedRange:style:enabled:", v6, v11, v10, objc_msgSend(v5, "isEnabled"));
  }
  else
  {
    id v12 = [(CAMSystemOverlayViewController *)self _primaryValuesForControl:v5];
    objc_msgSend(v3, "configureWithRange:magneticRange:style:enabled:", v6, v12, v10, objc_msgSend(v5, "isEnabled"));
  }
  uint64_t v13 = [(CAMSystemOverlayViewController *)self _displayNumberForControl:v5 update:v9];
  [v3 setCurrentNumber:v13];

  [v14 reloadValueLabel];
}

- (id)_valueRangeForControl:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 controlType];
  switch(v4)
  {
    case 2:
      id v5 = objc_alloc_init(MEMORY[0x263F30728]);
      goto LABEL_6;
    case 1:
      id v7 = objc_alloc(MEMORY[0x263F30740]);
      id v8 = [v3 valueTitles];
      uint64_t v6 = objc_msgSend(v7, "initWithCount:", objc_msgSend(v8, "count"));

      break;
    case 0:
      id v5 = [v3 valueRange];
LABEL_6:
      uint64_t v6 = v5;
      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return v6;
}

- (id)_displayValueRangeForControl:(id)a3
{
  id v4 = a3;
  if ([v4 controlType])
  {
    id v5 = [(CAMSystemOverlayViewController *)self _valueRangeForControl:v4];
  }
  else
  {
    uint64_t v6 = [v4 displayValueRange];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v4 valueRange];
    }
    id v5 = v8;
  }
  return v5;
}

- (int64_t)_rangeScaleForControl:(id)a3
{
  id v3 = a3;
  if ([v3 controlType]) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = [v3 rangeScale];
  }

  return v4;
}

- (id)_primaryValuesForControl:(id)a3
{
  id v3 = a3;
  if ([v3 controlType])
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = [v3 primaryValues];
  }

  return v4;
}

- (id)_protectedValuesForControl:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 controlType] || objc_msgSend(v3, "sliderType") != 7)
  {
    id v8 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F30738]);
    LODWORD(v5) = *MEMORY[0x263F30720];
    uint64_t v6 = [NSNumber numberWithFloat:v5];
    v10[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    id v8 = (void *)[v4 initWithValues:v7];
  }
  return v8;
}

- (id)_numberForUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueType];
  if (v5 == 3)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "BOOLeanValue"));
LABEL_9:
    id v12 = (void *)v13;
    goto LABEL_13;
  }
  if (v5 == 1)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "indexValue"));
    goto LABEL_9;
  }
  if (v5)
  {
    id v12 = &unk_26BDDED00;
  }
  else
  {
    uint64_t v6 = [(CAMSystemOverlayViewController *)self controlsByID];
    id v7 = [v4 controlIdentifier];
    id v8 = [v6 objectForKeyedSubscript:v7];

    id v9 = [(CAMSystemOverlayViewController *)self _valueRangeForControl:v8];
    if ([v9 isDiscrete] && !objc_msgSend(v9, "count"))
    {
      id v12 = 0;
    }
    else
    {
      unint64_t v10 = NSNumber;
      [v4 floatValue];
      [v9 valueClosestToValue:v11];
      id v12 = objc_msgSend(v10, "numberWithDouble:");
    }
  }
LABEL_13:

  return v12;
}

- (id)_displayNumberForControl:(id)a3 update:(id)a4
{
  id v6 = a4;
  if (![a3 controlType])
  {
    id v7 = [(CAMSystemOverlayViewController *)self controlsByID];
    id v8 = [v6 controlIdentifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    unint64_t v10 = [v9 values];
    float v11 = [v9 displayValues];
    if ([v10 count] && objc_msgSend(v11, "count"))
    {
      id v12 = NSNumber;
      [v6 floatValue];
      +[CAMZoomControlUtilities piecewiseLinearMappingForX:v10 fromXValues:v11 toYValues:v13];
      id v14 = objc_msgSend(v12, "numberWithDouble:");

      goto LABEL_7;
    }
  }
  id v14 = [(CAMSystemOverlayViewController *)self _numberForUpdate:v6];
LABEL_7:

  return v14;
}

- (id)_updateForControl:(id)a3 displayValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 controlType];
  if (v7 == 2)
  {
    uint64_t v15 = objc_msgSend(v5, "updateWithBooleanValue:", objc_msgSend(v6, "BOOLValue"));
LABEL_10:
    id v14 = (void *)v15;
    goto LABEL_12;
  }
  if (v7 == 1)
  {
    uint64_t v15 = objc_msgSend(v5, "updateWithIndexValue:", objc_msgSend(v6, "integerValue"));
    goto LABEL_10;
  }
  if (v7)
  {
    id v14 = 0;
  }
  else
  {
    [v6 doubleValue];
    double v9 = v8;
    id v10 = v5;
    float v11 = [v10 values];
    id v12 = [v10 displayValues];
    if ([v11 count] && objc_msgSend(v12, "count"))
    {
      +[CAMZoomControlUtilities piecewiseLinearMappingForX:v12 fromXValues:v11 toYValues:v9];
      double v9 = v13;
    }
    *(float *)&double v13 = v9;
    id v14 = [v10 updateWithFloatValue:v13];
  }
LABEL_12:

  return v14;
}

- (unint64_t)_styleForControl:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 controlType];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4)
    {
      unint64_t v5 = 0;
    }
    else
    {
      id v6 = v3;
      unint64_t v5 = 6;
      switch([v6 sliderType])
      {
        case 0:
          unint64_t v5 = 0;
          break;
        case 1:
          unint64_t v5 = 2;
          break;
        case 2:
        case 3:
        case 4:
          unint64_t v5 = 3;
          break;
        case 5:
        case 6:
          uint64_t v7 = [v6 displayValueRange];
          [v7 maximum];
          double v9 = v8;
          [v7 minimum];
          if (v9 - v10 < 5.0) {
            unint64_t v5 = 1;
          }
          else {
            unint64_t v5 = 4;
          }

          break;
        case 7:
          break;
        default:

          goto LABEL_2;
      }
    }
  }
  else
  {
LABEL_2:
    unint64_t v5 = 5;
  }

  return v5;
}

- (void)_cancelHandleBarTimerIfNeeded
{
  id v3 = [(CAMSystemOverlayViewController *)self _handleBarTimer];
  if (v3)
  {
    uint64_t v4 = v3;
    dispatch_source_cancel(v3);
    [(CAMSystemOverlayViewController *)self _setHandleBarTimer:0];
    id v3 = v4;
  }
}

- (void)_startHandleBarTimerIfNeeded
{
  id v3 = [(CAMSystemOverlayViewController *)self _handleBarTimer];

  if (!v3)
  {
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"systemOverlay.sliderHandleAppearAfterMilliseconds", @"com.apple.camera", 0);
    if (AppIntegerValue <= 0) {
      int64_t v5 = 2000000000;
    }
    else {
      int64_t v5 = (uint64_t)((double)AppIntegerValue * 1000000.0);
    }
    id v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    dispatch_time_t v7 = dispatch_time(0, v5);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)v5 * 0.1));
    [(CAMSystemOverlayViewController *)self _setHandleBarTimer:v6];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__CAMSystemOverlayViewController__startHandleBarTimerIfNeeded__block_invoke;
    v8[3] = &unk_263FA2AC0;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    dispatch_source_set_event_handler(v6, v8);
    dispatch_resume(v6);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __62__CAMSystemOverlayViewController__startHandleBarTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleBarTimerFired:v2];
}

- (void)_handleBarTimerFired:(id)a3
{
  id v4 = a3;
  id v8 = [(CAMSystemOverlayViewController *)self _handleBarTimer];
  int64_t v5 = [(CAMSystemOverlayViewController *)self _stateMachine];
  uint64_t v6 = [v5 currentStage];

  if (v8 && v8 == v4 && v6)
  {
    dispatch_time_t v7 = [(CAMSystemOverlayViewController *)self overlayView];
    [v7 setHandleBarVisible:1 animated:1];
  }
  [(CAMSystemOverlayViewController *)self _cancelHandleBarTimerIfNeeded];
}

- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(CAMSystemOverlayViewController *)self _forceUpdateSliderData];
  [(CAMSystemOverlayViewController *)self _updateSliderStateAnimated:1];
  if ([v5 isVisible])
  {
    uint64_t v6 = [(CAMSystemOverlayViewController *)self activeControl];

    if (!v6)
    {
      dispatch_time_t v7 = [(CAMSystemOverlayViewController *)self _selectedControl];
      [(CAMSystemOverlayViewController *)self _setActiveControl:v7];
      id v8 = [(CAMSystemOverlayViewController *)self delegate];
      [v8 systemOverlayViewController:self didChangeActiveControl:v7];
    }
    id v9 = [(CAMSystemOverlayViewController *)self _tipManager];
    [v9 recordSliderVisibleEvent];
  }
  else
  {
    id v10 = [(CAMSystemOverlayViewController *)self _halfPressRecognizer];
    [v10 reset];

    [(CAMSystemOverlayViewController *)self _cancelHandleBarTimerIfNeeded];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = [(CAMSystemOverlayViewController *)self _contactRecognizers];
    uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v14++) contactEndedWithAction:0];
        }
        while (v12 != v14);
        uint64_t v12 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }

  uint64_t v15 = [(CAMSystemOverlayViewController *)self _tipManager];
  objc_msgSend(v15, "setSliderVisibleParameter:", objc_msgSend(v5, "isVisible"));
}

- (void)systemOverlayVisibilityBeganHidingTimer:(id)a3
{
  id v4 = [(CAMSystemOverlayViewController *)self delegate];
  [v4 systemOverlayViewControllerWillHideSlider:self];
}

- (void)systemOverlayVisibilityCancelledHidingTimer:(id)a3
{
  id v4 = [(CAMSystemOverlayViewController *)self delegate];
  [v4 systemOverlayViewControllerCancelledHidingSlider:self];
}

- (void)halfPressContactRecognizerSingleHalfPressDidBegin:(id)a3 timestamp:(double)a4
{
  uint64_t v6 = [(CAMSystemOverlayViewController *)self overlayView];
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"systemOverlay.debounceIntervalAfterDoubleHalfPressInMS", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (AppIntegerValue <= 0) {
    double v8 = 200.0;
  }
  else {
    double v8 = (double)AppIntegerValue;
  }
  [(CAMSystemOverlayViewController *)self _doubleHalfPressTimestamp];
  if (v9 * -1000.0 + a4 * 1000.0 >= v8)
  {
    [(CAMSystemOverlayViewController *)self _setDebounceHalfPress:0];
    if ([v6 isSliderVisible] && objc_msgSend(v6, "sliderContent") == 1)
    {
      uint64_t v11 = [v6 menu];
      [v11 setHighlightCurrentSelectedIndex:1 animated:1];
    }
    [(CAMSystemOverlayViewController *)self set_numberHalfPress:[(CAMSystemOverlayViewController *)self _numberHalfPress] + 1];
  }
  else
  {
    id v10 = [v6 menu];
    [v10 setHighlightCurrentSelectedIndex:0 animated:1];

    [(CAMSystemOverlayViewController *)self _setDebounceHalfPress:1];
  }
}

- (void)halfPressContactRecognizerSingleHalfPressDidCancel:(id)a3 timestamp:(double)a4
{
  id v6 = [(CAMSystemOverlayViewController *)self overlayView];
  if ([v6 isSliderVisible]) {
    BOOL v4 = [v6 sliderContent] == 1;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = [v6 menu];
  [v5 setHighlightCurrentSelectedIndex:0 animated:v4];
}

- (void)halfPressContactRecognizerSingleHalfPressDidEnd:(id)a3 timestamp:(double)a4
{
  id v8 = a3;
  id v5 = [(CAMSystemOverlayViewController *)self overlayView];
  if ([v5 isSliderVisible]) {
    BOOL v6 = [v5 sliderContent] == 1;
  }
  else {
    BOOL v6 = 0;
  }
  if ([(CAMSystemOverlayViewController *)self _debounceHalfPress])
  {
    dispatch_time_t v7 = [v5 menu];
    [v7 setHighlightCurrentSelectedIndex:0 animated:v6];
  }
  else if ([(CAMSystemOverlayViewController *)self _selectCurrentMenuItemIfMenuVisible])
  {
    [v8 reset];
  }
}

- (BOOL)_selectCurrentMenuItemIfMenuVisible
{
  id v3 = [(CAMSystemOverlayViewController *)self overlayView];
  if ([v3 isSliderVisible] && objc_msgSend(v3, "sliderContent") == 1)
  {
    BOOL v4 = [v3 menu];
    unint64_t v5 = [v4 selectedControlIndex];

    BOOL v6 = [(CAMSystemOverlayViewController *)self controls];
    if (v5 >= [v6 count])
    {
      id v10 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CAMSystemOverlayViewController _selectCurrentMenuItemIfMenuVisible](v6);
      }
    }
    else
    {
      dispatch_time_t v7 = [v6 objectAtIndexedSubscript:v5];
      int v8 = [v7 isEnabled];

      if (v8)
      {
        [v3 performMenuPresentation:2];
        BOOL v9 = 1;
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v11 = [v3 menu];
      [v11 setHighlightCurrentSelectedIndex:0 animated:1];
    }
    BOOL v9 = 0;
    goto LABEL_12;
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (void)halfPressContactRecognizerDoubleHalfPressDidEnd:(id)a3 timestamp:(double)a4
{
  if (![(CAMSystemOverlayViewController *)self _debounceHalfPress])
  {
    if ([(CAMSystemOverlayViewController *)self _doubleHalfPressOpensMenu])
    {
      BOOL v6 = [(CAMSystemOverlayViewController *)self overlayView];
      int v7 = [v6 isSliderVisible];

      if (v7)
      {
        id v11 = [(CAMSystemOverlayViewController *)self overlayView];
        if ([v11 isSliderVisible]) {
          BOOL v8 = [v11 sliderContent] == 1;
        }
        else {
          BOOL v8 = 0;
        }
        BOOL v9 = [v11 menu];
        [v9 setHighlightCurrentSelectedIndex:0 animated:v8];

        [(CAMSystemOverlayViewController *)self _setDoubleHalfPressTimestamp:a4];
        id v10 = [(CAMSystemOverlayViewController *)self overlayView];
        [v10 performMenuPresentation:1];
      }
    }
  }
}

- (void)restartControlMetrics
{
  id v3 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "restartControlMetrics physical button counts", v5, 2u);
  }

  BOOL v4 = [MEMORY[0x263EFF910] distantFuture];
  [(CAMSystemOverlayViewController *)self set_touchStartTime:v4];

  [(CAMSystemOverlayViewController *)self set_touchTimeInterval:0.0];
  [(CAMSystemOverlayViewController *)self set_numberTouches:0];
  [(CAMSystemOverlayViewController *)self set_numberFullPress:0];
  [(CAMSystemOverlayViewController *)self set_numberHalfPress:0];
}

- (void)_updateMetricsForButton:(unint64_t)a3 stage:(unint64_t)a4 phase:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v9 = [(CAMSystemOverlayViewController *)self _stateMachine];
  uint64_t v10 = [v9 currentStage];

  id v11 = [(CAMSystemOverlayViewController *)self _touchStartTime];
  [v11 timeIntervalSinceNow];
  double v13 = v12;

  if (!v10)
  {
    if (v13 < 0.0)
    {
      [(CAMSystemOverlayViewController *)self _touchTimeInterval];
      double v16 = v15;
      long long v17 = [(CAMSystemOverlayViewController *)self _touchStartTime];
      [v17 timeIntervalSinceNow];
      [(CAMSystemOverlayViewController *)self set_touchTimeInterval:v16 - v18];

      long long v19 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [(CAMSystemOverlayViewController *)self _touchTimeInterval];
        int v23 = 134217984;
        uint64_t v24 = v20;
        _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "Observed physical button: _touchTimeInterval: %f", (uint8_t *)&v23, 0xCu);
      }

      [(CAMSystemOverlayViewController *)self set_numberTouches:[(CAMSystemOverlayViewController *)self _numberTouches] + 1];
    }
    uint64_t v14 = [MEMORY[0x263EFF910] distantFuture];
    goto LABEL_9;
  }
  if (v13 > 0.0)
  {
    uint64_t v14 = [MEMORY[0x263EFF910] now];
LABEL_9:
    uint64_t v21 = (void *)v14;
    [(CAMSystemOverlayViewController *)self set_touchStartTime:v14];
  }
  if (a3 == 6 && a4 == 4 && !a5)
  {
    uint64_t v22 = [(CAMSystemOverlayViewController *)self _tipManager];
    [v22 recordCaptureEvent];

    [(CAMSystemOverlayViewController *)self set_numberFullPress:[(CAMSystemOverlayViewController *)self _numberFullPress] + 1];
  }
}

- (void)submitMetrics
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [(CAMSystemOverlayViewController *)self _touchTimeInterval];
    *(_DWORD *)buf = 134349824;
    uint64_t v14 = v4;
    __int16 v15 = 2050;
    unint64_t v16 = [(CAMSystemOverlayViewController *)self _numberTouches];
    __int16 v17 = 2050;
    unint64_t v18 = [(CAMSystemOverlayViewController *)self _numberFullPress];
    __int16 v19 = 2050;
    unint64_t v20 = [(CAMSystemOverlayViewController *)self _numberHalfPress];
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Power metrics _touchTimeInterval: %{public}f; _numberTouches: %{public}lu; _numberFullPress: %{public}lu; _numberH"
      "alfPress: %{public}lu",
      buf,
      0x2Au);
  }

  if (submitMetrics_onceToken != -1) {
    dispatch_once(&submitMetrics_onceToken, &__block_literal_global_311);
  }
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CAMSystemOverlayViewController _numberFullPress](self, "_numberFullPress", &unk_26BDDED18));
  v12[0] = v5;
  v11[1] = &unk_26BDDED30;
  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CAMSystemOverlayViewController _numberHalfPress](self, "_numberHalfPress"));
  v12[1] = v6;
  v11[2] = &unk_26BDDED48;
  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CAMSystemOverlayViewController _numberTouches](self, "_numberTouches"));
  v12[2] = v7;
  v11[3] = @"TouchTimeInterval";
  BOOL v8 = NSNumber;
  [(CAMSystemOverlayViewController *)self _touchTimeInterval];
  BOOL v9 = objc_msgSend(v8, "numberWithDouble:");
  v12[3] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  PPSSendTelemetry();
}

void __47__CAMSystemOverlayViewController_submitMetrics__block_invoke()
{
  id v1 = (id)[@"Button" copy];
  v0 = (void *)[@"CaptureButtonAction" copy];
  submitMetrics_myStreamId = PPSCreateTelemetryIdentifier();
}

- (CAMSystemOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSystemOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)swipeForOverlaySupported
{
  return self->_swipeForOverlaySupported;
}

- (void)setSwipeForOverlaySupported:(BOOL)a3
{
  self->_swipeForOverlaySupported = a3;
}

- (CAMAbstractOverlayServiceControl)activeControl
{
  return self->_activeControl;
}

- (void)_setActiveControl:(id)a3
{
}

- (NSArray)controls
{
  return self->_controls;
}

- (void)_setControls:(id)a3
{
}

- (NSDictionary)controlsByID
{
  return self->_controlsByID;
}

- (void)_setControlsByID:(id)a3
{
}

- (NSMutableDictionary)_updatesByID
{
  return self->__updatesByID;
}

- (void)_setUpdatesByID:(id)a3
{
}

- (unint64_t)_selectedControlIndex
{
  return self->__selectedControlIndex;
}

- (void)_setSelectedControlIndex:(unint64_t)a3
{
  self->__selectedControlIndex = a3;
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (CAMSystemOverlayStateMachine)_stateMachine
{
  return self->__stateMachine;
}

- (BOOL)_overlayEnabled
{
  return self->__overlayEnabled;
}

- (void)_setOverlayEnabled:(BOOL)a3
{
  self->__overlayEnabled = a3;
}

- (BOOL)_debugLoggingEnabled
{
  return self->__debugLoggingEnabled;
}

- (BOOL)_doubleHalfPressOpensMenu
{
  return self->__doubleHalfPressOpensMenu;
}

- (_UIPhysicalButtonInteraction)_buttonInteraction
{
  return self->__buttonInteraction;
}

- (void)_setPhysicalButtonInteraction:(id)a3
{
}

- (CEKContactRecognizer)_currentPositionDeltaApplicator
{
  return self->__currentPositionDeltaApplicator;
}

- (CAMHalfPressContactRecognizer)_halfPressRecognizer
{
  return self->__halfPressRecognizer;
}

- (NSMutableSet)_contactRecognizers
{
  return self->__contactRecognizers;
}

- (OS_dispatch_source)_handleBarTimer
{
  return self->__handleBarTimer;
}

- (void)_setHandleBarTimer:(id)a3
{
}

- (double)_doubleHalfPressTimestamp
{
  return self->__doubleHalfPressTimestamp;
}

- (void)_setDoubleHalfPressTimestamp:(double)a3
{
  self->__doubleHalfPressTimestamp = a3;
}

- (BOOL)_debounceHalfPress
{
  return self->__debounceHalfPress;
}

- (void)_setDebounceHalfPress:(BOOL)a3
{
  self->__debounceHalfPress = a3;
}

- (BOOL)_ignoreScrollUnderPressure
{
  return self->__ignoreScrollUnderPressure;
}

- (CAMSystemOverlayTipManager)_tipManager
{
  return self->__tipManager;
}

- (NSDate)_touchStartTime
{
  return self->__touchStartTime;
}

- (void)set_touchStartTime:(id)a3
{
}

- (double)_touchTimeInterval
{
  return self->__touchTimeInterval;
}

- (void)set_touchTimeInterval:(double)a3
{
  self->__touchTimeInterval = a3;
}

- (unint64_t)_numberTouches
{
  return self->__numberTouches;
}

- (void)set_numberTouches:(unint64_t)a3
{
  self->__numberTouches = a3;
}

- (unint64_t)_numberFullPress
{
  return self->__numberFullPress;
}

- (void)set_numberFullPress:(unint64_t)a3
{
  self->__numberFullPress = a3;
}

- (unint64_t)_numberHalfPress
{
  return self->__numberHalfPress;
}

- (void)set_numberHalfPress:(unint64_t)a3
{
  self->__numberHalfPress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__touchStartTime, 0);
  objc_storeStrong((id *)&self->__tipManager, 0);
  objc_storeStrong((id *)&self->__handleBarTimer, 0);
  objc_storeStrong((id *)&self->__contactRecognizers, 0);
  objc_storeStrong((id *)&self->__halfPressRecognizer, 0);
  objc_storeStrong((id *)&self->__currentPositionDeltaApplicator, 0);
  objc_storeStrong((id *)&self->__buttonInteraction, 0);
  objc_storeStrong((id *)&self->__stateMachine, 0);
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->__updatesByID, 0);
  objc_storeStrong((id *)&self->_controlsByID, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_activeControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__numberFormatter, 0);
}

- (void)_promoteMenuSelectionIndexIfAvailableNotifyingDelegate:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v1, v2, "Menu hiding on item index %lu; %lu available", v3, v4, v5, v6, v7);
}

- (void)valueTextForCurrentControl
{
  uint64_t v2 = [a1 controls];
  [v2 count];
  [a1 _selectedControlIndex];
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v3, v4, "OverlayVC: Attempt to request text for control out of bounds. There are %lu controls, current index is %lu", v5, v6, v7, v8, 0);
}

- (void)applyControlUpdate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "OverlayVC: Attempt to set value for nil control %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateSliderStateAnimated:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Using default position for hint while updating slider with missing position", v1, 2u);
}

- (void)_selectCurrentMenuItemIfMenuVisible
{
  [a1 count];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v1, v2, "Half press attempted selecting control at index %lu; %lu available",
    v3,
    v4,
    v5,
    v6,
    v7);
}

@end
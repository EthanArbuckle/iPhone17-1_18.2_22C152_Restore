@interface CAMZoomControl
- (BOOL)_createButtonForMaxZoomFactor;
- (BOOL)_isButtonPlatterSupportedForConfiguration;
- (BOOL)_isEligibleForSwipeDownToDismiss;
- (BOOL)_isEligibleForZoomFactorLabelTaps;
- (BOOL)_isPointWithinButtonPlatter:(CGPoint)a3;
- (BOOL)_isPointWithinZoomButtonAccessory:(CGPoint)a3;
- (BOOL)_isTouchWithinButtonPlatter:(id)a3;
- (BOOL)_isTouchWithinZoomButtonAccessory:(id)a3;
- (BOOL)_isWithinZoomButtonBoundsWithTouch:(id)a3;
- (BOOL)_isZoomDialEnabled;
- (BOOL)_shouldHideZoomButtonBackground;
- (BOOL)_shouldInterceptTouchesForHidingZoomDial;
- (BOOL)_shouldShowButtonPlatter;
- (BOOL)_shouldShowZoomDial;
- (BOOL)_shouldSnapDialToSwitchOverZoomFactors;
- (BOOL)_shouldUseZoomDialMask;
- (BOOL)allowsContinuousZoom;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)configureForContinuousZoomWithZoomFactor:(double)a3 zoomPoints:(id)a4 createButtonForMaxZoomFactor:(BOOL)a5 compactPlatterLayout:(BOOL)a6 animated:(BOOL)a7;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hideFocalLengthLabels;
- (BOOL)isPlatterExpanded;
- (BOOL)isPlatterLayoutCompact;
- (CAMFeedbackController)_feedbackController;
- (CAMZoomButton)_highlightedZoomButton;
- (CAMZoomButton)_zoomButton;
- (CAMZoomButtonPlatter)_buttonPlatter;
- (CAMZoomControl)initWithLayoutStyle:(int64_t)a3;
- (CAMZoomControlButtonMaskView)_buttonMaskView;
- (CAMZoomControlDelegate)delegate;
- (CAMZoomDial)_zoomDial;
- (CGPoint)_previousTouchLocation;
- (CGPoint)_startTouchLocation;
- (NSArray)_displayZoomFactors;
- (NSArray)_significantHapticDisplayValueEpsilons;
- (NSArray)_significantHapticDisplayValues;
- (NSArray)_switchOverZoomFactors;
- (NSArray)_zoomFactors;
- (NSArray)_zoomPoints;
- (NSDate)_startTimeForHideAnimationInProgress;
- (NSSet)_significantHapticDisplayValueSwitchOverIndexes;
- (NSTimer)_zoomDialVisibilityTimer;
- (UIEdgeInsets)contentInsets;
- (UIView)_dialClippingView;
- (double)_accelerationForMovementFromPointFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 elapsedTime:(double)a5;
- (double)_additionalAccelerationForMovementFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 deltaX:(double)a5;
- (double)_dampingFactorForDistanceFromDialForPoint:(CGPoint)a3;
- (double)_dampingFactorForMovementFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (double)_dampingFactorForPerpendicularityFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (double)_displayMaximumZoomFactor;
- (double)_displayMinimumZoomFactor;
- (double)_displayZoomValueForZoomFactor:(double)a3;
- (double)_distanceFromDialClippingViewToPoint:(CGPoint)a3;
- (double)_hideAnimationInProgressDuration;
- (double)_normalizeValue:(double)a3 betweenMinimumValue:(double)a4 maximumValue:(double)a5;
- (double)_previousTouchTime;
- (double)_snappedZoomFactor;
- (double)_unsnappingProgress;
- (double)_zoomFactorForDisplayZoomValue:(double)a3;
- (double)displayZoomValue;
- (double)edgeMargin;
- (double)maxAvailableZoomFactor;
- (double)maximumZoomFactor;
- (double)minAvailableZoomFactor;
- (double)minimumZoomFactor;
- (double)zoomButtonMaxYWhenContracted;
- (double)zoomDialBorderWidth;
- (double)zoomDialContentMaskingHeight;
- (double)zoomDialRadius;
- (double)zoomFactor;
- (id)_accessorizedZoomButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_hapticZoneForDisplayValue:(double)a3;
- (int64_t)_lastHapticZone;
- (int64_t)_zoomControlMode;
- (int64_t)layoutStyle;
- (int64_t)orientation;
- (int64_t)preferredCustomLens;
- (int64_t)zoomButtonAccessoryState;
- (int64_t)zoomButtonContentType;
- (int64_t)zoomButtonSymbol;
- (unint64_t)_numberOfZoomPlatterButtonsForZoomFactorCount:(unint64_t)a3;
- (void)_cancelDelayedZoomDialVisibilityChange;
- (void)_cleanupForCancelTracking;
- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomFactors:(id)a5 displayZoomFactors:(id)a6 zoomButtonContentType:(int64_t)a7 animated:(BOOL)a8;
- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomPoints:(id)a5 zoomButtonContentType:(int64_t)a6 animated:(BOOL)a7;
- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomPoints:(id)a5 zoomFactors:(id)a6 displayZoomFactors:(id)a7 createButtonForMaxZoomFactor:(BOOL)a8 zoomButtonContentType:(int64_t)a9 compactPlatterLayout:(BOOL)a10 animated:(BOOL)a11;
- (void)_handleAccessoryTappedForButton:(id)a3;
- (void)_handleButtonTapped:(id)a3 forAccessoryTap:(BOOL)a4;
- (void)_handleButtonTappedForContinuousModeWithPlatter:(id)a3;
- (void)_handleButtonTappedForDualCameraMode;
- (void)_handleButtonTappedForSelection:(id)a3;
- (void)_handleButtonTappedForSingleCameraToggleOnly;
- (void)_handleButtonTappedForSingleCameraZoomPlusToggle;
- (void)_handleZoomDialVisibilityTimerFiredWithUserInfo:(id)a3;
- (void)_resetSnapping;
- (void)_setButtonPlatterCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)_setCreateButtonForMaxZoomFactor:(BOOL)a3;
- (void)_setDisplayZoomFactors:(id)a3;
- (void)_setEligibleForSwipeDownToDismiss:(BOOL)a3;
- (void)_setEligibleForZoomFactorLabelTaps:(BOOL)a3;
- (void)_setHideAnimationInProgressDuration:(double)a3;
- (void)_setHighlightedZoomButton:(id)a3;
- (void)_setPreviousTouchLocation:(CGPoint)a3;
- (void)_setPreviousTouchTime:(double)a3;
- (void)_setShouldShowZoomDial:(BOOL)a3;
- (void)_setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4;
- (void)_setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4 afterDelay:(double)a5;
- (void)_setSignificantHapticDisplayValueEpsilons:(id)a3;
- (void)_setSignificantHapticDisplayValueSwitchOverIndexes:(id)a3;
- (void)_setSignificantHapticDisplayValues:(id)a3;
- (void)_setSnappedZoomFactor:(double)a3;
- (void)_setStartTimeForHideAnimationInProgress:(id)a3;
- (void)_setStartTouchLocation:(CGPoint)a3;
- (void)_setUnsnappingProgress:(double)a3;
- (void)_setZoomControlMode:(int64_t)a3;
- (void)_setZoomDialEnabled:(BOOL)a3;
- (void)_setZoomDialEnabled:(BOOL)a3 animationDuration:(int64_t)a4;
- (void)_setZoomDialVisibilityTimer:(id)a3;
- (void)_setZoomFactor:(double)a3 interactionType:(int64_t)a4 shouldNotifyDelegate:(BOOL)a5;
- (void)_setZoomFactors:(id)a3;
- (void)_setZoomPoints:(id)a3;
- (void)_updateButtonAccessoryAnimated:(BOOL)a3;
- (void)_updateDisplayZoomFactorsAnimated:(BOOL)a3;
- (void)_updateDisplayedValuesAllowingFlashingSubstate:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateHapticEpsilons;
- (void)_updateHaptics:(BOOL)a3;
- (void)_updateMaskViewForZoomButtonHighlightingTransform;
- (void)_updateSignificantValuesForHaptics;
- (void)_updateSubviewsAlphasWithDuration:(double)a3 forConfigurationChange:(BOOL)a4;
- (void)_updateZoomButtonTappableEdgeInsets;
- (void)_updateZoomDialEnablement;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)configureForDualDeviceWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7 dualCameraSwitchOverZoomFactor:(double)a8 displayDualCameraSwitchOverZoomFactor:(double)a9;
- (void)configureForSelectionOnlyWithDisplayZoomFactors:(id)a3 selectedIndex:(unint64_t)a4 compactPlatterLayout:(BOOL)a5 animated:(BOOL)a6;
- (void)configureForSingleCameraPlusToggleWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7;
- (void)configureForSingleCameraToggleOnlyWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7;
- (void)configureForToggleOnlyWithZoomFactor:(double)a3 displayZoomFactor:(double)a4;
- (void)configureForTripleDeviceWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7 switchOverZoomFactor1:(double)a8 displaySwitchOverZoomFactor1:(double)a9 switchOverZoomFactor2:(double)a10 displaySwitchOverZoomFactor2:(double)a11;
- (void)configureForZoomSymbolToggle;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)removeAnimationFromView:(id)a3 forKeys:(id)a4;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeMargin:(double)a3;
- (void)setEdgeMargin:(double)a3 animated:(BOOL)a4;
- (void)setHideFocalLengthLabels:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setMaxAvailableZoomFactor:(double)a3;
- (void)setMinAvailableZoomFactor:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setPlatterLayoutCompact:(BOOL)a3;
- (void)setPlatterLayoutCompact:(BOOL)a3 animated:(BOOL)a4;
- (void)setPreferredCustomLens:(int64_t)a3;
- (void)setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4;
- (void)setZoomButtonAccessoryState:(int64_t)a3;
- (void)setZoomButtonAccessoryState:(int64_t)a3 animated:(BOOL)a4;
- (void)setZoomButtonMaxYWhenContracted:(double)a3;
- (void)setZoomButtonSymbol:(int64_t)a3 animated:(BOOL)a4;
- (void)setZoomDialContentMaskingHeight:(double)a3;
- (void)setZoomDialRadius:(double)a3;
- (void)setZoomFactor:(double)a3;
- (void)set_lastHapticZone:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMZoomControl

- (CAMZoomControl)initWithLayoutStyle:(int64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CAMZoomControl;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[CAMZoomControl initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x263F001A8], v5, v6, v7);
  if (v8)
  {
    v9 = +[CAMCaptureCapabilities capabilities];
    v8->_layoutStyle = a3;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v4, v5, v6, v7);
    dialClippingView = v8->__dialClippingView;
    v8->__dialClippingView = (UIView *)v10;

    [(UIView *)v8->__dialClippingView setClipsToBounds:1];
    [(UIView *)v8->__dialClippingView setUserInteractionEnabled:0];
    [(CAMZoomControl *)v8 addSubview:v8->__dialClippingView];
    if ([v9 isZoomPlatterSupported])
    {
      v12 = objc_alloc_init(CAMZoomButtonPlatter);
      buttonPlatter = v8->__buttonPlatter;
      v8->__buttonPlatter = v12;

      [(CAMZoomButtonPlatter *)v8->__buttonPlatter setUserInteractionEnabled:0];
      [(CAMZoomControl *)v8 addSubview:v8->__buttonPlatter];
    }
    uint64_t v14 = [v9 zoomDialStyle];
    v15 = [[CAMZoomDial alloc] initWithStyle:v14];
    zoomDial = v8->__zoomDial;
    v8->__zoomDial = v15;

    [(UIView *)v8->__dialClippingView addSubview:v8->__zoomDial];
    v17 = -[CAMZoomButton initWithFrame:]([CAMZoomButton alloc], "initWithFrame:", v4, v5, v6, v7);
    zoomButton = v8->__zoomButton;
    v8->__zoomButton = v17;

    [(CAMZoomButton *)v8->__zoomButton setDelegate:v8];
    [(CAMZoomControl *)v8 _updateZoomButtonTappableEdgeInsets];
    [(CAMZoomButton *)v8->__zoomButton setUserInteractionEnabled:0];
    [(CAMZoomControl *)v8 addSubview:v8->__zoomButton];
    v8->__shouldShowZoomDial = 0;
    [(CAMZoomDial *)v8->__zoomDial setExpanded:0];
    [(CAMZoomControl *)v8 _updateSubviewsAlphasWithDuration:0 forConfigurationChange:0.0];
    if ([(CAMZoomControl *)v8 _shouldUseZoomDialMask])
    {
      v19 = -[CAMZoomControlButtonMaskView initWithFrame:]([CAMZoomControlButtonMaskView alloc], "initWithFrame:", v4, v5, v6, v7);
      buttonMaskView = v8->__buttonMaskView;
      v8->__buttonMaskView = v19;

      [(CAMZoomDial *)v8->__zoomDial setMaskView:v8->__buttonMaskView];
    }
    [(CAMZoomControl *)v8 configureForToggleOnlyWithZoomFactor:1.0 displayZoomFactor:1.0];
    if (v14 == 1)
    {
      v21 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v8->__feedbackController;
      v8->__feedbackController = v21;
    }
    v23 = v8;
  }
  return v8;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToDidChangeZoomFactor = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanToggleBetweenZoomFactors = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToToggleBetweenZoomFactors = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanPlayHaptics = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeShowingZoomDial = objc_opt_respondsToSelector() & 1;
  }
}

- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomFactors:(id)a5 displayZoomFactors:(id)a6 zoomButtonContentType:(int64_t)a7 animated:(BOOL)a8
{
  id v14 = a6;
  id v15 = a5;
  id v17 = +[CAMZoomPoint zoomPointsWithFactors:v15 displayZoomFactors:v14 customLensGroup:0];
  BYTE1(v16) = a8;
  LOBYTE(v16) = 0;
  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:](self, "_configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:", a3, v17, v15, v14, 0, a7, a4, v16);
}

- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomPoints:(id)a5 zoomButtonContentType:(int64_t)a6 animated:(BOOL)a7
{
  id v12 = a5;
  id v15 = +[CAMZoomPoint zoomFactorsFromZoomPoints:v12];
  v13 = +[CAMZoomPoint displayZoomFactorsFromZoomPoints:v12];
  BYTE1(v14) = a7;
  LOBYTE(v14) = 0;
  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:](self, "_configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:", a3, v12, v15, v13, 0, a6, a4, v14);
}

- (void)_configureForControlMode:(int64_t)a3 zoomFactor:(double)a4 zoomPoints:(id)a5 zoomFactors:(id)a6 displayZoomFactors:(id)a7 createButtonForMaxZoomFactor:(BOOL)a8 zoomButtonContentType:(int64_t)a9 compactPlatterLayout:(BOOL)a10 animated:(BOOL)a11
{
  BOOL v12 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  [(CAMZoomControl *)self zoomFactor];
  -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:");
  double v22 = v21;
  BOOL v23 = [(CAMZoomControl *)self _shouldShowButtonPlatter];
  [(CAMZoomControl *)self _setZoomControlMode:a3];
  [(CAMZoomControl *)self _setZoomPoints:v20];

  [(CAMZoomControl *)self _setZoomFactors:v19];
  [(CAMZoomControl *)self _setDisplayZoomFactors:v18];

  [(CAMZoomControl *)self _setCreateButtonForMaxZoomFactor:v12];
  [(CAMZoomControl *)self _updateDisplayZoomFactorsAnimated:a11];
  v24 = [v19 firstObject];
  [v24 doubleValue];
  -[CAMZoomControl setMinAvailableZoomFactor:](self, "setMinAvailableZoomFactor:");

  objc_super v25 = [v19 lastObject];

  [v25 doubleValue];
  -[CAMZoomControl setMaxAvailableZoomFactor:](self, "setMaxAvailableZoomFactor:");

  [(CAMZoomControl *)self setZoomFactor:a4];
  [(CAMZoomControl *)self _displayZoomValueForZoomFactor:a4];
  double v27 = v26;
  [(CAMZoomControl *)self setPlatterLayoutCompact:a10 animated:a11];
  [(CAMZoomControl *)self _updateZoomDialEnablement];
  [(CAMZoomControl *)self _snappedZoomFactor];
  if (v28 > 0.0)
  {
    if (v27 == v22) {
      [(CAMZoomControl *)self _setSnappedZoomFactor:a4];
    }
    else {
      [(CAMZoomControl *)self _resetSnapping];
    }
  }
  BOOL v29 = [(CAMZoomControl *)self _shouldShowButtonPlatter];
  double v30 = 0.25;
  if (!(a11 | v23 ^ v29)) {
    double v30 = 0.0;
  }
  [(CAMZoomControl *)self _updateSubviewsAlphasWithDuration:1 forConfigurationChange:v30];
  v31 = [(CAMZoomControl *)self _zoomButton];
  [v31 setContentType:a9 animated:a11];

  [(CAMZoomControl *)self _updateDisplayedValuesAllowingFlashingSubstate:0 animated:0];
}

- (BOOL)configureForContinuousZoomWithZoomFactor:(double)a3 zoomPoints:(id)a4 createButtonForMaxZoomFactor:(BOOL)a5 compactPlatterLayout:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  v13 = +[CAMZoomPoint zoomFactorsFromZoomPoints:v12];
  uint64_t v14 = +[CAMZoomPoint displayZoomFactorsFromZoomPoints:v12];
  unint64_t v15 = [v12 count];
  if (v15 < 2)
  {
    id v19 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CAMZoomControl configureForContinuousZoomWithZoomFactor:zoomPoints:createButtonForMaxZoomFactor:compactPlatterLayout:animated:](v12, v19);
    }
  }
  else
  {
    uint64_t v16 = +[CAMZoomPoint significantIndexesInZoomPoints:v12];
    if ((unint64_t)[v16 count] > 2 || v9) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = 2;
    }
    BYTE1(v21) = a7;
    LOBYTE(v21) = a6;
    -[CAMZoomControl _configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:](self, "_configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:", v18, v12, v13, v14, v9, 0, a3, v21);
  }
  return v15 > 1;
}

- (void)configureForTripleDeviceWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7 switchOverZoomFactor1:(double)a8 displaySwitchOverZoomFactor1:(double)a9 switchOverZoomFactor2:(double)a10 displaySwitchOverZoomFactor2:(double)a11
{
  v30[4] = *MEMORY[0x263EF8340];
  id v19 = [NSNumber numberWithDouble:a4];
  v30[0] = v19;
  id v20 = [NSNumber numberWithDouble:a8];
  v30[1] = v20;
  uint64_t v21 = [NSNumber numberWithDouble:a10];
  v30[2] = v21;
  double v22 = [NSNumber numberWithDouble:a6];
  v30[3] = v22;
  BOOL v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];

  v24 = [NSNumber numberWithDouble:a5];
  v29[0] = v24;
  objc_super v25 = [NSNumber numberWithDouble:a9];
  v29[1] = v25;
  double v26 = [NSNumber numberWithDouble:a11];
  v29[2] = v26;
  double v27 = [NSNumber numberWithDouble:a7];
  v29[3] = v27;
  double v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];

  [(CAMZoomControl *)self _configureForControlMode:0 zoomFactor:v23 zoomFactors:v28 displayZoomFactors:0 zoomButtonContentType:0 animated:a3];
}

- (void)configureForDualDeviceWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7 dualCameraSwitchOverZoomFactor:(double)a8 displayDualCameraSwitchOverZoomFactor:(double)a9
{
  v25[3] = *MEMORY[0x263EF8340];
  uint64_t v16 = [NSNumber numberWithDouble:a4];
  v25[0] = v16;
  id v17 = [NSNumber numberWithDouble:a8];
  v25[1] = v17;
  uint64_t v18 = [NSNumber numberWithDouble:a6];
  v25[2] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];

  id v20 = [NSNumber numberWithDouble:a5];
  v24[0] = v20;
  uint64_t v21 = [NSNumber numberWithDouble:a9];
  v24[1] = v21;
  double v22 = [NSNumber numberWithDouble:a7];
  v24[2] = v22;
  BOOL v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];

  [(CAMZoomControl *)self _configureForControlMode:0 zoomFactor:v19 zoomFactors:v23 displayZoomFactors:0 zoomButtonContentType:0 animated:a3];
}

- (void)configureForSingleCameraPlusToggleWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7
{
  v19[2] = *MEMORY[0x263EF8340];
  id v12 = [NSNumber numberWithDouble:a4];
  v19[0] = v12;
  v13 = [NSNumber numberWithDouble:a6];
  v19[1] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

  unint64_t v15 = [NSNumber numberWithDouble:a5];
  v18[0] = v15;
  uint64_t v16 = [NSNumber numberWithDouble:a7];
  v18[1] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

  [(CAMZoomControl *)self _configureForControlMode:2 zoomFactor:v14 zoomFactors:v17 displayZoomFactors:0 zoomButtonContentType:0 animated:a3];
}

- (void)configureForSingleCameraToggleOnlyWithZoomFactor:(double)a3 minimumZoomFactor:(double)a4 displayMinimumZoomFactor:(double)a5 maximumZoomFactor:(double)a6 displayMaximumZoomFactor:(double)a7
{
  v19[2] = *MEMORY[0x263EF8340];
  id v12 = [NSNumber numberWithDouble:a4];
  v19[0] = v12;
  v13 = [NSNumber numberWithDouble:a6];
  v19[1] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

  unint64_t v15 = [NSNumber numberWithDouble:a5];
  v18[0] = v15;
  uint64_t v16 = [NSNumber numberWithDouble:a7];
  v18[1] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

  [(CAMZoomControl *)self _configureForControlMode:5 zoomFactor:v14 zoomFactors:v17 displayZoomFactors:0 zoomButtonContentType:0 animated:a3];
}

- (void)configureForToggleOnlyWithZoomFactor:(double)a3 displayZoomFactor:(double)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  double v7 = objc_msgSend(NSNumber, "numberWithDouble:");
  v12[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  BOOL v9 = [NSNumber numberWithDouble:a4];
  v11 = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];

  [(CAMZoomControl *)self _configureForControlMode:3 zoomFactor:v8 zoomFactors:v10 displayZoomFactors:0 zoomButtonContentType:0 animated:a3];
}

- (void)configureForSelectionOnlyWithDisplayZoomFactors:(id)a3 selectedIndex:(unint64_t)a4 compactPlatterLayout:(BOOL)a5 animated:(BOOL)a6
{
  id v10 = a3;
  v11 = [v10 objectAtIndexedSubscript:a4];
  [v11 doubleValue];
  double v13 = v12;

  id v15 = +[CAMZoomPoint zoomPointsWithFactors:v10 displayZoomFactors:v10 customLensGroup:0];
  BYTE1(v14) = a6;
  LOBYTE(v14) = a5;
  -[CAMZoomControl _configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:](self, "_configureForControlMode:zoomFactor:zoomPoints:zoomFactors:displayZoomFactors:createButtonForMaxZoomFactor:zoomButtonContentType:compactPlatterLayout:animated:", 1, v15, v10, v10, 0, 0, v13, v14);
}

- (void)configureForZoomSymbolToggle
{
}

- (BOOL)allowsContinuousZoom
{
  return ([(CAMZoomControl *)self _zoomControlMode] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (double)minimumZoomFactor
{
  v2 = [(CAMZoomControl *)self _zoomFactors];
  v3 = [v2 firstObject];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)maximumZoomFactor
{
  v2 = [(CAMZoomControl *)self _zoomFactors];
  v3 = [v2 lastObject];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)_displayMinimumZoomFactor
{
  v2 = [(CAMZoomControl *)self _displayZoomFactors];
  v3 = [v2 firstObject];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)_displayMaximumZoomFactor
{
  v2 = [(CAMZoomControl *)self _displayZoomFactors];
  v3 = [v2 lastObject];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (NSArray)_switchOverZoomFactors
{
  v3 = [(CAMZoomControl *)self _zoomFactors];
  unint64_t v4 = [v3 count];

  if (v4 < 3)
  {
    double v7 = 0;
  }
  else
  {
    double v5 = [(CAMZoomControl *)self _zoomFactors];
    double v6 = [(CAMZoomControl *)self _zoomFactors];
    double v7 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 2);
  }
  return (NSArray *)v7;
}

- (BOOL)_shouldSnapDialToSwitchOverZoomFactors
{
  v3 = [(CAMZoomControl *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  double v5 = [(CAMZoomControl *)self delegate];
  char v6 = [v5 zoomControlShouldSnapDialToSwitchOverZoomFactors:self];

  return v6;
}

- (void)_updateDisplayZoomFactorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CAMZoomControl *)self _zoomPoints];
  char v6 = [(CAMZoomControl *)self _zoomDial];
  [v6 setZoomPoints:v5];

  [(CAMZoomControl *)self _updateSignificantValuesForHaptics];
  double v7 = +[CAMZoomPoint significantIndexesInZoomPoints:v5];
  uint64_t v8 = -[CAMZoomControl _numberOfZoomPlatterButtonsForZoomFactorCount:](self, "_numberOfZoomPlatterButtonsForZoomFactorCount:", [v7 count]);
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    if (v3) {
      [(CAMZoomControl *)self layoutIfNeeded];
    }
    id v10 = [v5 objectsAtIndexes:v7];
    v11 = objc_msgSend(v10, "subarrayWithRange:", 0, v9);

    double v12 = [(CAMZoomControl *)self _buttonPlatter];
    [v12 setZoomPoints:v11 animated:v3];

    if (v3)
    {
      [(CAMZoomControl *)self setNeedsLayout];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __52__CAMZoomControl__updateDisplayZoomFactorsAnimated___block_invoke;
      v13[3] = &unk_263FA0208;
      v13[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v13 animations:0.3];
    }
  }
}

uint64_t __52__CAMZoomControl__updateDisplayZoomFactorsAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateDisplayedValuesAllowingFlashingSubstate:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(CAMZoomControl *)self displayZoomValue];
  double v8 = v7;
  uint64_t v9 = [(CAMZoomControl *)self _zoomDial];
  [v9 setZoomFactor:v8];

  id v10 = [(CAMZoomControl *)self _zoomButton];
  [v10 setZoomFactor:v8];

  if ([(CAMZoomControl *)self _isButtonPlatterSupportedForConfiguration])
  {
    id v11 = [(CAMZoomControl *)self _buttonPlatter];
    [v11 setZoomFactor:v5 allowFlashingSubstate:v4 animated:v8];
  }
}

- (double)displayZoomValue
{
  [(CAMZoomControl *)self zoomFactor];
  -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:");
  return result;
}

- (double)_displayZoomValueForZoomFactor:(double)a3
{
  BOOL v5 = [(CAMZoomControl *)self _zoomFactors];
  char v6 = [(CAMZoomControl *)self _displayZoomFactors];
  +[CAMZoomControlUtilities piecewiseLinearMappingForX:v5 fromXValues:v6 toYValues:a3];
  double v8 = v7;

  return v8;
}

- (double)_zoomFactorForDisplayZoomValue:(double)a3
{
  BOOL v5 = [(CAMZoomControl *)self _displayZoomFactors];
  char v6 = [(CAMZoomControl *)self _zoomFactors];
  +[CAMZoomControlUtilities piecewiseLinearMappingForX:v5 fromXValues:v6 toYValues:a3];
  double v8 = v7;

  return v8;
}

- (void)setZoomFactor:(double)a3
{
}

- (void)_setZoomFactor:(double)a3 interactionType:(int64_t)a4 shouldNotifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  [(CAMZoomControl *)self minimumZoomFactor];
  double v10 = v9;
  [(CAMZoomControl *)self minAvailableZoomFactor];
  double v12 = fmax(v10, v11);
  [(CAMZoomControl *)self maximumZoomFactor];
  double v14 = v13;
  [(CAMZoomControl *)self maxAvailableZoomFactor];
  double v16 = fmin(v14, v15);
  if (v16 >= a3) {
    double v16 = a3;
  }
  if (v12 <= a3) {
    double v17 = v16;
  }
  else {
    double v17 = v12;
  }
  if (self->_zoomFactor != v17)
  {
    self->_zoomFactor = v17;
    [(CAMZoomControl *)self _updateDisplayedValuesAllowingFlashingSubstate:a4 == 1 animated:1];
    uint64_t v18 = 0;
    if (!a4 && v5)
    {
      if (self->_delegateFlags.respondsToCanPlayHaptics)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v18 = [WeakRetained zoomControlCanPlayHaptics:self];
      }
      else
      {
        uint64_t v18 = 0;
      }
    }
    [(CAMZoomControl *)self _updateHaptics:v18];
    [(CAMZoomControl *)self setNeedsLayout];
    if (v5 && self->_delegateFlags.respondsToDidChangeZoomFactor)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      [v20 zoomControl:self didChangeZoomFactor:a4 interactionType:v17];
    }
  }
}

- (void)setMinAvailableZoomFactor:(double)a3
{
  [(CAMZoomControl *)self minimumZoomFactor];
  double v6 = fmax(a3, v5);
  self->_minAvailableZoomFactor = v6;
  [(CAMZoomControl *)self _displayZoomValueForZoomFactor:v6];
  double v8 = v7;
  double v9 = [(CAMZoomControl *)self _zoomDial];
  [v9 setMinAvailableZoomFactor:v8];

  [(CAMZoomControl *)self minimumZoomFactor];
  if (v6 != v10)
  {
    [(CAMZoomControl *)self zoomFactor];
    -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 0, 1);
  }
}

- (void)setMaxAvailableZoomFactor:(double)a3
{
  [(CAMZoomControl *)self maximumZoomFactor];
  double v6 = fmin(a3, v5);
  self->_maxAvailableZoomFactor = v6;
  [(CAMZoomControl *)self _displayZoomValueForZoomFactor:v6];
  double v8 = v7;
  double v9 = [(CAMZoomControl *)self _zoomDial];
  [v9 setMaxAvailableZoomFactor:v8];

  [(CAMZoomControl *)self maximumZoomFactor];
  if (v6 != v10)
  {
    [(CAMZoomControl *)self zoomFactor];
    -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 0, 1);
  }
}

- (int64_t)zoomButtonContentType
{
  v2 = [(CAMZoomControl *)self _zoomButton];
  int64_t v3 = [v2 contentType];

  return v3;
}

- (int64_t)zoomButtonSymbol
{
  v2 = [(CAMZoomControl *)self _zoomButton];
  int64_t v3 = [v2 zoomSymbol];

  return v3;
}

- (void)setZoomButtonSymbol:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CAMZoomControl *)self _zoomButton];
  [v6 setZoomSymbol:a3 animated:v4];
}

- (void)setZoomButtonAccessoryState:(int64_t)a3
{
}

- (void)setZoomButtonAccessoryState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_zoomButtonAccessoryState != a3)
  {
    self->_zoomButtonAccessoryState = a3;
    [(CAMZoomControl *)self _updateButtonAccessoryAnimated:a4];
  }
}

- (void)_updateButtonAccessoryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMZoomControl *)self zoomButtonAccessoryState];
  BOOL v6 = [(CAMZoomControl *)self _isButtonPlatterSupportedForConfiguration];
  if (v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = v5;
  }
  if (!v6) {
    int64_t v5 = 0;
  }
  [(CAMZoomControl *)self edgeMargin];
  BOOL v9 = v8 < 0.0;
  double v10 = [(CAMZoomControl *)self _zoomButton];
  [v10 setAccessoryState:v7 animated:v3];

  double v11 = [(CAMZoomControl *)self _buttonPlatter];
  [v11 setButtonAccessoryState:v5 animated:v3];

  double v12 = [(CAMZoomControl *)self _zoomButton];
  [v12 setAccessoryPosition:v9 animated:v3];

  id v13 = [(CAMZoomControl *)self _buttonPlatter];
  [v13 setButtonAccessoryPosition:v9 animated:v3];
}

- (id)_accessorizedZoomButton
{
  if ([(CAMZoomControl *)self _isButtonPlatterSupportedForConfiguration])
  {
    if ([(CAMZoomControl *)self isPlatterExpanded])
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v4 = [(CAMZoomControl *)self _buttonPlatter];
      BOOL v3 = [v4 zoomFactorButton];
    }
  }
  else
  {
    BOOL v3 = [(CAMZoomControl *)self _zoomButton];
  }
  return v3;
}

- (BOOL)_isTouchWithinZoomButtonAccessory:(id)a3
{
  [a3 locationInView:self];
  return -[CAMZoomControl _isPointWithinZoomButtonAccessory:](self, "_isPointWithinZoomButtonAccessory:");
}

- (BOOL)_isPointWithinZoomButtonAccessory:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int64_t v6 = [(CAMZoomControl *)self zoomButtonAccessoryState];
  if (v6)
  {
    int64_t v7 = [(CAMZoomControl *)self _accessorizedZoomButton];
    [v7 tappableEdgeInsets];
    [v7 accessoryFrame];
    CGFloat v8 = v21.origin.x;
    CGFloat v9 = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
    if (!CGRectIsEmpty(v21))
    {
      UIRectInset();
      CGFloat v8 = v12;
      CGFloat v9 = v13;
      CGFloat width = v14;
      CGFloat height = v15;
    }
    -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
    v20.double x = v16;
    v20.double y = v17;
    v22.origin.double x = v8;
    v22.origin.double y = v9;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    BOOL v18 = CGRectContainsPoint(v22, v20);

    LOBYTE(v6) = v18;
  }
  return v6;
}

- (void)setEdgeMargin:(double)a3
{
}

- (void)setEdgeMargin:(double)a3 animated:(BOOL)a4
{
  if (self->_edgeMargin != a3)
  {
    if (a4)
    {
      [(CAMZoomControl *)self layoutIfNeeded];
      self->_edgeMargin = a3;
      [(CAMZoomControl *)self _updateZoomButtonTappableEdgeInsets];
      [(CAMZoomControl *)self _updateButtonAccessoryAnimated:1];
      [(CAMZoomControl *)self setNeedsLayout];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __41__CAMZoomControl_setEdgeMargin_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      self->_edgeMargin = a3;
      [(CAMZoomControl *)self _updateZoomButtonTappableEdgeInsets];
      [(CAMZoomControl *)self _updateButtonAccessoryAnimated:0];
      [(CAMZoomControl *)self setNeedsLayout];
    }
  }
}

uint64_t __41__CAMZoomControl_setEdgeMargin_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(CAMZoomControl *)self setNeedsLayout];
  }
}

- (void)setZoomDialRadius:(double)a3
{
  if (self->_zoomDialRadius != a3)
  {
    self->_zoomDialRadius = a3;
    [(CAMZoomControl *)self _updateHapticEpsilons];
    [(CAMZoomControl *)self setNeedsLayout];
  }
}

- (double)zoomDialContentMaskingHeight
{
  v2 = [(CAMZoomControl *)self _zoomDial];
  [v2 contentMaskingHeight];
  double v4 = v3;

  return v4;
}

- (void)setZoomDialContentMaskingHeight:(double)a3
{
  id v4 = [(CAMZoomControl *)self _zoomDial];
  [v4 setContentMaskingHeight:a3];
}

- (double)zoomDialBorderWidth
{
  v2 = [(CAMZoomControl *)self _zoomDial];
  [v2 dialBorderWidth];
  double v4 = v3;

  return v4;
}

- (void)setZoomButtonMaxYWhenContracted:(double)a3
{
  if (self->_zoomButtonMaxYWhenContracted != a3)
  {
    self->_zoomButtonMaxYWhenContracted = a3;
    [(CAMZoomControl *)self setNeedsLayout];
  }
}

- (void)_updateZoomButtonTappableEdgeInsets
{
  [(CAMZoomControl *)self edgeMargin];
  if (v3 <= 0.0)
  {
    [(CAMZoomControl *)self edgeMargin];
    if (v6 >= 0.0) {
      double v5 = 11.0;
    }
    else {
      double v5 = 24.0;
    }
    if (v6 >= 0.0) {
      double v4 = 11.0;
    }
    else {
      double v4 = 16.0;
    }
  }
  else
  {
    double v4 = 24.0;
    double v5 = 16.0;
  }
  id v7 = [(CAMZoomControl *)self _zoomButton];
  objc_msgSend(v7, "setTappableEdgeInsets:", 11.0, v5, 4.0, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMZoomControl *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0) {
    [(CAMZoomControl *)self setNeedsLayout];
  }
}

- (BOOL)_shouldUseZoomDialMask
{
  v2 = [(CAMZoomControl *)self _zoomDial];
  uint64_t v3 = [v2 style];

  return v3 != 1;
}

- (void)setHideFocalLengthLabels:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMZoomControl *)self _zoomDial];

  if (v5)
  {
    id v6 = [(CAMZoomControl *)self _zoomDial];
    [v6 setHideFocalLengthLabels:v3];
  }
}

- (BOOL)hideFocalLengthLabels
{
  BOOL v3 = [(CAMZoomControl *)self _zoomDial];

  if (!v3) {
    return 0;
  }
  double v4 = [(CAMZoomControl *)self _zoomDial];
  char v5 = [v4 hideFocalLengthLabels];

  return v5;
}

- (void)_setZoomDialEnabled:(BOOL)a3
{
}

- (void)_setZoomDialEnabled:(BOOL)a3 animationDuration:(int64_t)a4
{
  if (self->__zoomDialEnabled != a3)
  {
    self->__zoomDialEnabled = a3;
    if (!a3) {
      [(CAMZoomControl *)self _setShouldShowZoomDial:0 animationDuration:a4];
    }
  }
}

- (void)_setShouldShowZoomDial:(BOOL)a3
{
}

- (void)_setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  [(CAMZoomControl *)self _cancelDelayedZoomDialVisibilityChange];
  if (self->__shouldShowZoomDial != v5)
  {
    [(CAMZoomControl *)self _setStartTimeForHideAnimationInProgress:0];
    double v7 = 0.0;
    if ((unint64_t)(a4 - 1) <= 2) {
      double v7 = dbl_209C79158[a4 - 1];
    }
    CGFloat v8 = [(CAMZoomControl *)self _zoomDial];
    if (v7 > 0.0)
    {
      [(CAMZoomControl *)self layoutIfNeeded];
      [v8 layoutIfNeeded];
    }
    self->__shouldShowZoomDial = v5;
    [v8 setExpanded:v5];
    if (v5)
    {
      double v9 = 0.23;
      double v10 = 0.4;
    }
    else
    {
      [(CAMZoomControl *)self _setEligibleForZoomFactorLabelTaps:0];
      double v9 = 0.18;
      double v10 = 0.7;
    }
    if (v7 > 0.0)
    {
      double v11 = v10;
    }
    else
    {
      double v9 = 0.0;
      double v11 = 0.0;
    }
    double v12 = 1.0;
    if (v7 != 0.0) {
      double v12 = v7;
    }
    double v13 = v9 / v12;
    if ([v8 style] == 1)
    {
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke;
      v35[3] = &unk_263FA02A8;
      v35[4] = self;
      BOOL v36 = v5;
      +[CAMView animateIfNeededWithDuration:v35 animations:v13];
    }
    [(CAMZoomControl *)self setNeedsLayout];
    [(CAMZoomControl *)self _updateSubviewsAlphasWithDuration:0 forConfigurationChange:v13];
    if (v7 > 0.0)
    {
      double v14 = [(CAMZoomControl *)self _zoomDial];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      double v15 = [v14 subviews];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v15);
            }
            [(CAMZoomControl *)self removeAnimationFromView:*(void *)(*((void *)&v31 + 1) + 8 * i) forKeys:&unk_26BDDF998];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v37 count:16];
        }
        while (v17);
      }

      [(CAMZoomControl *)self removeAnimationFromView:v14 forKeys:&unk_26BDDF9B0];
      CGPoint v20 = [(CAMZoomControl *)self _zoomButton];
      [(CAMZoomControl *)self removeAnimationFromView:v20 forKeys:&unk_26BDDF9C8];

      CGRect v21 = [(CAMZoomControl *)self _buttonMaskView];
      [(CAMZoomControl *)self removeAnimationFromView:v21 forKeys:&unk_26BDDF9E0];

      if (!v5)
      {
        CGRect v22 = [MEMORY[0x263EFF910] date];
        [(CAMZoomControl *)self _setStartTimeForHideAnimationInProgress:v22];

        [(CAMZoomControl *)self _setHideAnimationInProgressDuration:v11];
      }
      BOOL v23 = (void *)MEMORY[0x263F82E00];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke_2;
      v28[3] = &unk_263FA0408;
      id v29 = v14;
      double v30 = self;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke_3;
      v26[3] = &unk_263FA1328;
      BOOL v27 = v5;
      v26[4] = self;
      id v24 = v14;
      [v23 animateWithDuration:6 delay:v28 usingSpringWithDamping:v26 initialSpringVelocity:v11 options:0.0 animations:0.758 completion:0.0];
    }
    if (v5) {
      [(CAMZoomControl *)self _setHighlightedZoomButton:0];
    }
    else {
      [(CAMZoomControl *)self _setEligibleForSwipeDownToDismiss:0];
    }
    if (self->_delegateFlags.respondsToDidChangeShowingZoomDial)
    {
      objc_super v25 = [(CAMZoomControl *)self delegate];
      [v25 zoomControlDidChangeShowingZoomDial:self];
    }
  }
}

void __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [MEMORY[0x263F825C8] systemYellowColor];
  }
  else {
  id v3 = [MEMORY[0x263F825C8] whiteColor];
  }
  v2 = [*(id *)(a1 + 32) _zoomButton];
  [v2 setTintColor:v3];
}

uint64_t __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(a1 + 40);
  return [v2 layoutIfNeeded];
}

uint64_t __59__CAMZoomControl__setShouldShowZoomDial_animationDuration___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _setStartTimeForHideAnimationInProgress:0];
  }
  return result;
}

- (void)_updateSubviewsAlphasWithDuration:(double)a3 forConfigurationChange:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(CAMZoomControl *)self _shouldShowZoomDial];
  BOOL v8 = [(CAMZoomControl *)self _shouldShowButtonPlatter];
  double v9 = [(CAMZoomControl *)self _zoomButton];
  [v9 alpha];
  double v11 = v10;

  if (v8) {
    double v12 = 0.0;
  }
  else {
    double v12 = 1.0;
  }
  if (v4)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke;
    v21[3] = &unk_263FA1350;
    v21[4] = self;
    BOOL v22 = v7;
    BOOL v23 = v8;
    *(double *)&v21[5] = v12;
    +[CAMView animateIfNeededWithDuration:v21 animations:a3];
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke_2;
    v18[3] = &unk_263FA1350;
    v18[4] = self;
    BOOL v19 = v7;
    BOOL v20 = v8;
    *(double *)&v18[5] = v12;
    +[CAMView animateIfNeededWithDuration:v18 animations:a3];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke_3;
    v15[3] = &unk_263FA1350;
    if (v7) {
      double v13 = 0.0;
    }
    else {
      double v13 = 2.0;
    }
    BOOL v16 = v8;
    v15[4] = self;
    *(double *)&v15[5] = v12;
    BOOL v17 = !v7;
    +[CAMView animateIfNeededWithDuration:4 usingSpringWithDamping:v15 initialSpringVelocity:0 options:a3 animations:1.0 completion:v13];
  }
  if (v12 != 0.0)
  {
    if (v12 != v11) {
      a3 = 0.0;
    }
    double v14 = [(CAMZoomControl *)self _zoomButton];
    objc_msgSend(v14, "setShouldHideBackground:animationDuration:", -[CAMZoomControl _shouldHideZoomButtonBackground](self, "_shouldHideZoomButtonBackground"), a3);
  }
}

void __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  id v3 = [*(id *)(a1 + 32) _zoomDial];
  [v3 setAlpha:v2];

  BOOL v4 = [*(id *)(a1 + 32) _buttonPlatter];

  if (v4)
  {
    if (*(unsigned char *)(a1 + 49)) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.0;
    }
    id v6 = [*(id *)(a1 + 32) _buttonPlatter];
    [v6 setAlpha:v5];

    double v7 = *(double *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) _zoomButton];
    [v8 setAlpha:v7];
  }
}

void __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  id v3 = [*(id *)(a1 + 32) _zoomDial];
  [v3 setAlpha:v2];

  BOOL v4 = [*(id *)(a1 + 32) _buttonPlatter];

  if (v4)
  {
    double v5 = *(unsigned char *)(a1 + 49) ? 1.0 : 0.0;
    id v6 = [*(id *)(a1 + 32) _buttonPlatter];
    [v6 setAlpha:v5];

    if (!*(unsigned char *)(a1 + 49))
    {
      double v7 = *(double *)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) _zoomButton];
      [v8 setAlpha:v7];
    }
  }
}

void __75__CAMZoomControl__updateSubviewsAlphasWithDuration_forConfigurationChange___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    double v2 = *(double *)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) _zoomButton];
    [v3 setAlpha:v2];
  }
  uint64_t v4 = *(unsigned __int8 *)(a1 + 49);
  id v5 = [*(id *)(a1 + 32) _zoomDial];
  [v5 setHideLabels:v4];
}

- (BOOL)_shouldHideZoomButtonBackground
{
  id v3 = [(CAMZoomControl *)self _zoomDial];
  uint64_t v4 = [v3 style];

  BOOL v5 = v4 == 1 && [(CAMZoomControl *)self _shouldShowZoomDial];
  return [(CAMZoomControl *)self _isButtonPlatterSupportedForConfiguration]
      || v5;
}

- (void)setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4
{
  BOOL v5 = a3;
  if ([(CAMZoomControl *)self _isZoomDialEnabled])
  {
    [(CAMZoomControl *)self _setShouldShowZoomDial:v5 animationDuration:a4 afterDelay:0.0];
  }
}

- (void)_setShouldShowZoomDial:(BOOL)a3 animationDuration:(int64_t)a4 afterDelay:(double)a5
{
  BOOL v7 = a3;
  v16[2] = *MEMORY[0x263EF8340];
  [(CAMZoomControl *)self _cancelDelayedZoomDialVisibilityChange];
  if (a5 <= 0.0)
  {
    [(CAMZoomControl *)self _setShouldShowZoomDial:v7 animationDuration:a4];
  }
  else
  {
    v15[0] = CAMZoomControlShouldShowZoomDialKey;
    double v9 = [NSNumber numberWithBool:v7];
    v15[1] = CAMZoomControlAnimationDurationKey;
    v16[0] = v9;
    double v10 = [NSNumber numberWithInteger:a4];
    v16[1] = v10;
    double v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    double v12 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel__handleZoomDialVisibilityTimerFiredWithUserInfo_ selector:v11 userInfo:0 repeats:a5];
    zoomDialVisibilityTimer = self->__zoomDialVisibilityTimer;
    self->__zoomDialVisibilityTimer = v12;

    double v14 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v14 addTimer:self->__zoomDialVisibilityTimer forMode:*MEMORY[0x263EFF588]];
  }
}

- (void)_handleZoomDialVisibilityTimerFiredWithUserInfo:(id)a3
{
  id v9 = [a3 userInfo];
  uint64_t v4 = [v9 objectForKeyedSubscript:CAMZoomControlShouldShowZoomDialKey];
  uint64_t v5 = [v4 BOOLValue];

  id v6 = [v9 objectForKeyedSubscript:CAMZoomControlAnimationDurationKey];
  uint64_t v7 = [v6 integerValue];

  [(CAMZoomControl *)self _setShouldShowZoomDial:v5 animationDuration:v7];
  zoomDialVisibilityTimer = self->__zoomDialVisibilityTimer;
  self->__zoomDialVisibilityTimer = 0;
}

- (void)_cancelDelayedZoomDialVisibilityChange
{
  zoomDialVisibilityTimer = self->__zoomDialVisibilityTimer;
  if (zoomDialVisibilityTimer)
  {
    [(NSTimer *)zoomDialVisibilityTimer invalidate];
    uint64_t v4 = self->__zoomDialVisibilityTimer;
    self->__zoomDialVisibilityTimer = 0;
  }
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)CAMZoomControl;
  [(CAMZoomControl *)&v41 layoutSubviews];
  [(CAMZoomControl *)self bounds];
  -[CAMZoomControl alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMZoomControl *)self _zoomButton];
  double v12 = [(CAMZoomControl *)self _zoomDial];
  double v13 = [(CAMZoomControl *)self _dialClippingView];
  [v11 intrinsicContentSize];
  double v15 = v14;
  double v17 = v16;
  [(CAMZoomControl *)self zoomButtonMaxYWhenContracted];
  [(CAMZoomControl *)self zoomDialRadius];
  double v19 = v18;
  objc_msgSend(v13, "setFrame:", v4, v6 + -40.0, v8, v10 + 40.0);
  double v20 = v19 + v19;
  objc_msgSend(v12, "setCenter:", v8 * 0.5, v19 + 40.0);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v19 + v19, v19 + v19);
  [v12 zoomFactor];
  double v22 = v21;
  objc_msgSend(v12, "textCenterForZoomFactor:assumeExpanded:", 1);
  double v38 = v23;
  double v25 = v24;
  double v39 = v17 * 0.5;
  double v40 = v17;
  UIRoundToViewScale();
  objc_msgSend(v12, "setContractionDistance:");
  [(CAMZoomControl *)self edgeMargin];
  [v12 textCenterForZoomFactor:0 assumeExpanded:v22];
  double v36 = v26;
  double v37 = v27;
  objc_msgSend(v12, "convertPoint:toView:", self);
  UIRoundToViewScale();
  double v29 = v28;
  UIRoundToViewScale();
  objc_msgSend(v11, "frameForAlignmentRect:", v29 - v15 * 0.5, v30 - v39, v15, v40);
  UIRectIntegralWithScale();
  objc_msgSend(v11, "setFrame:");
  long long v31 = [(CAMZoomControl *)self _buttonPlatter];
  long long v32 = v31;
  long long v33 = (double *)MEMORY[0x263F001A8];
  if (v31)
  {
    [v31 intrinsicContentSize];
    objc_msgSend(v12, "convertPoint:toView:", self, v38, v25);
    long long v34 = +[CAMCaptureCapabilities capabilities];
    [v34 isQuadraWideSupported];

    UIRectCenteredAboutPointScale();
    objc_msgSend(v32, "setFrame:");
  }
  if ([(CAMZoomControl *)self _shouldUseZoomDialMask])
  {
    v35 = [(CAMZoomControl *)self _buttonMaskView];
    objc_msgSend(v35, "setBounds:", *v33, v33[1], v20, v20 + 40.0);
    objc_msgSend(v35, "setCenter:", v20 * 0.5 + v36 - v38, (v20 + -40.0) * 0.5 + v37 - v25);
    objc_msgSend(v35, "setMaskOvalFrame:", v38 - v15 * 0.5, v25 - v39 + 40.0, v15, v40);
    [(CAMZoomControl *)self _updateMaskViewForZoomButtonHighlightingTransform];
  }
}

- (void)_updateMaskViewForZoomButtonHighlightingTransform
{
  if ([(CAMZoomControl *)self _shouldUseZoomDialMask])
  {
    double v3 = [(CAMZoomControl *)self _buttonMaskView];
    double v4 = [(CAMZoomControl *)self _zoomButton];
    [v3 maskOvalFrame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v3 bounds];
    UIRectGetCenter();
    double v14 = v13;
    double v16 = v15;
    memset(&v24, 0, sizeof(v24));
    if (v4) {
      [v4 highlightingTransform];
    }
    v25.origin.double x = v6;
    v25.origin.double y = v8;
    v25.size.CGFloat width = v10;
    v25.size.CGFloat height = v12;
    CGFloat v17 = CGRectGetMidX(v25) - v14;
    v26.origin.double x = v6;
    v26.origin.double y = v8;
    v26.size.CGFloat width = v10;
    v26.size.CGFloat height = v12;
    CGFloat v18 = CGRectGetMidY(v26) - v16;
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeTranslation(&t1, -v17, -v18);
    CGAffineTransformMakeTranslation(&t2, v17, v18);
    CGAffineTransform v19 = v24;
    CGAffineTransformConcat(&v21, &v19, &t2);
    CGAffineTransformConcat(&v23, &t1, &v21);
    CGAffineTransform v19 = v23;
    [v3 setTransform:&v19];
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    id v9 = [(CAMZoomControl *)self _zoomDial];
    double v7 = [(CAMZoomControl *)self _zoomButton];
    [v9 setOrientation:a3 animated:v4];
    [v7 setOrientation:a3 animated:v4];
    CGFloat v8 = [(CAMZoomControl *)self _buttonPlatter];
    [v8 setOrientation:a3 animated:v4];
  }
}

- (double)_distanceFromDialClippingViewToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(CAMZoomControl *)self _dialClippingView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  double v16 = v15;
  double v18 = v17;
  v24.origin.double x = v8;
  v24.origin.double y = v10;
  v24.size.CGFloat width = v12;
  v24.size.CGFloat height = v14;
  if (v16 >= CGRectGetMinX(v24))
  {
    v26.origin.double x = v8;
    v26.origin.double y = v10;
    v26.size.CGFloat width = v12;
    v26.size.CGFloat height = v14;
    double v19 = 0.0;
    if (v16 > CGRectGetMaxX(v26))
    {
      v27.origin.double x = v8;
      v27.origin.double y = v10;
      v27.size.CGFloat width = v12;
      v27.size.CGFloat height = v14;
      double v19 = v16 - CGRectGetMaxX(v27);
    }
  }
  else
  {
    v25.origin.double x = v8;
    v25.origin.double y = v10;
    v25.size.CGFloat width = v12;
    v25.size.CGFloat height = v14;
    double v19 = CGRectGetMinX(v25) - v16;
  }
  v28.origin.double x = v8;
  v28.origin.double y = v10;
  v28.size.CGFloat width = v12;
  v28.size.CGFloat height = v14;
  if (v18 >= CGRectGetMinY(v28))
  {
    v30.origin.double x = v8;
    v30.origin.double y = v10;
    v30.size.CGFloat width = v12;
    v30.size.CGFloat height = v14;
    CGFloat MaxY = CGRectGetMaxY(v30);
    double v20 = 0.0;
    if (v18 > MaxY)
    {
      v31.origin.double x = v8;
      v31.origin.double y = v10;
      v31.size.CGFloat width = v12;
      v31.size.CGFloat height = v14;
      double v20 = v18 - CGRectGetMaxY(v31);
    }
  }
  else
  {
    v29.origin.double x = v8;
    v29.origin.double y = v10;
    v29.size.CGFloat width = v12;
    v29.size.CGFloat height = v14;
    double v20 = CGRectGetMinY(v29) - v18;
  }
  double v22 = sqrt(v20 * v20 + v19 * v19);

  return v22;
}

- (double)_dampingFactorForDistanceFromDialForPoint:(CGPoint)a3
{
  -[CAMZoomControl _distanceFromDialClippingViewToPoint:](self, "_distanceFromDialClippingViewToPoint:", a3.x, a3.y);
  double v4 = 1.0;
  if (v3 > 0.0)
  {
    double v5 = v3 / -80.0 + 1.0;
    double v4 = 0.0;
    if (v5 >= 0.0) {
      return v5;
    }
  }
  return v4;
}

- (double)_dampingFactorForPerpendicularityFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  double v9 = [(CAMZoomControl *)self _zoomDial];
  [v9 dialCenter];
  double v11 = v10;
  double v13 = v12;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v9, v7, v6);
  double v15 = v14;
  double v17 = v16;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  double v20 = v18 - v15;
  double v21 = v19 - v17;
  double v22 = sqrt(v21 * v21 + v20 * v20);
  double v23 = 1.0;
  if (v22 > 0.0)
  {
    double v24 = v18 - v11;
    double v25 = v19 - v13;
    double v26 = sqrt(v25 * v25 + v24 * v24);
    if (v26 > 0.0)
    {
      double v27 = fabs(v21 / v22 * (v25 / v26) + v20 / v22 * (v24 / v26));
      if (v27 > 0.707)
      {
        double v28 = (0.92 - v27) / 0.213;
        if (v28 >= 0.0) {
          double v23 = v28;
        }
        else {
          double v23 = 0.0;
        }
        if (v23 > 1.0) {
          double v23 = 1.0;
        }
      }
    }
  }

  return v23;
}

- (double)_dampingFactorForMovementFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  -[CAMZoomControl _dampingFactorForDistanceFromDialForPoint:](self, "_dampingFactorForDistanceFromDialForPoint:", a4.x, a4.y);
  double v10 = v9;
  -[CAMZoomControl _dampingFactorForPerpendicularityFromPoint:toPoint:](self, "_dampingFactorForPerpendicularityFromPoint:toPoint:", v7, v6, x, y);
  return v10 * v11;
}

- (double)_accelerationForMovementFromPointFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 elapsedTime:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  int64_t v11 = [(CAMZoomControl *)self layoutStyle];
  double result = 1.0;
  if (v11 != 1)
  {
    double v13 = x - v9;
    double v14 = 0.0166666667 / a5;
    if (a5 < 0.00833333333) {
      double v14 = 2.0;
    }
    double v15 = v13 * v14;
    [(CAMZoomControl *)self _normalizeValue:fabs(v13 * v14) betweenMinimumValue:12.0 maximumValue:30.0];
    double v17 = v16 * v16 + v16 * v16;
    -[CAMZoomControl _additionalAccelerationForMovementFromPoint:toPoint:deltaX:](self, "_additionalAccelerationForMovementFromPoint:toPoint:deltaX:", v9, v8, x, y, v15);
    return v18 + v17 + 1.0;
  }
  return result;
}

- (double)_additionalAccelerationForMovementFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 deltaX:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  double v10 = [(CAMZoomControl *)self _dialClippingView];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v10, v8, v7);
  double v20 = v19;
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
  double v22 = v21;
  v31.origin.double x = v12;
  v31.origin.double y = v14;
  v31.size.CGFloat width = v16;
  v31.size.CGFloat height = v18;
  double Width = CGRectGetWidth(v31);
  if (v22 <= v20)
  {
    [(CAMZoomControl *)self _normalizeValue:v22 betweenMinimumValue:0.0 maximumValue:Width * 0.4];
    double v24 = 1.0 - v25;
  }
  else
  {
    -[CAMZoomControl _normalizeValue:betweenMinimumValue:maximumValue:](self, "_normalizeValue:betweenMinimumValue:maximumValue:", v22, Width * 0.6);
  }
  double v26 = v24 * v24;
  [(CAMZoomControl *)self _normalizeValue:fabs(a5) betweenMinimumValue:2.0 maximumValue:4.0];
  double v28 = v27 * (v26 * 5.0);

  return v28;
}

- (double)_normalizeValue:(double)a3 betweenMinimumValue:(double)a4 maximumValue:(double)a5
{
  double result = (a3 - a4) / (a5 - a4);
  if (result < 0.0) {
    double result = 0.0;
  }
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (void)removeAnimationFromView:(id)a3 forKeys:(id)a4
{
  id v5 = a4;
  double v6 = [a3 layer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__CAMZoomControl_removeAnimationFromView_forKeys___block_invoke;
  v8[3] = &unk_263FA1378;
  id v9 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __50__CAMZoomControl_removeAnimationFromView_forKeys___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = objc_msgSend(*(id *)(a1 + 32), "animationForKey:");
  if (v3)
  {
    double v4 = [*(id *)(a1 + 32) presentationLayer];
    id v5 = [v4 valueForKey:v6];
    [*(id *)(a1 + 32) setValue:v5 forKey:v6];
    [*(id *)(a1 + 32) removeAnimationForKey:v6];
  }
}

- (BOOL)_shouldInterceptTouchesForHidingZoomDial
{
  double v3 = [(CAMZoomControl *)self _startTimeForHideAnimationInProgress];
  double v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    double v6 = -v5;
    [(CAMZoomControl *)self _hideAnimationInProgressDuration];
    double v8 = v7;
    id v9 = [(CAMZoomControl *)self _zoomDial];
    uint64_t v10 = [v9 style];

    if (v10 == 1)
    {
      [(CAMZoomControl *)self _hideAnimationInProgressDuration];
      double v12 = v11 * 0.7;
    }
    else
    {
      double v12 = v8 * 0.9;
    }
    BOOL v13 = v12 > v6;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v22.receiver = self;
  v22.super_class = (Class)CAMZoomControl;
  -[CAMZoomControl hitTest:withEvent:](&v22, sel_hitTest_withEvent_, a4);
  double v7 = (CAMZoomControl *)objc_claimAutoreleasedReturnValue();
  double v8 = [(CAMZoomControl *)self _zoomButton];
  -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  BOOL v13 = -[CAMZoomControl _isPointWithinZoomButtonAccessory:](self, "_isPointWithinZoomButtonAccessory:", x, y);
  if (v7 == self || v13)
  {
    BOOL v15 = v13;
    [v8 bounds];
    v24.double x = v10;
    v24.double y = v12;
    BOOL v16 = CGRectContainsPoint(v25, v24);
    BOOL v17 = -[CAMZoomControl _isPointWithinButtonPlatter:](self, "_isPointWithinButtonPlatter:", x, y);
    BOOL v18 = [(CAMZoomControl *)self _shouldShowZoomDial];
    BOOL v19 = [(CAMZoomControl *)self _shouldInterceptTouchesForHidingZoomDial];
    if (v16 || v17 || v15 || v18 || v19)
    {
      if (!v15) {
        goto LABEL_12;
      }
      double v20 = self;
    }
    else
    {
      double v20 = 0;
    }

    double v7 = v20;
  }
LABEL_12:

  return v7;
}

- (BOOL)_isWithinZoomButtonBoundsWithTouch:(id)a3
{
  id v4 = a3;
  double v5 = [(CAMZoomControl *)self _zoomButton];
  [v4 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  [v5 bounds];
  v11.double x = v7;
  v11.double y = v9;
  LOBYTE(v4) = CGRectContainsPoint(v12, v11);

  return (char)v4;
}

- (void)_setHighlightedZoomButton:(id)a3
{
  id v4 = (CAMZoomButton *)a3;
  highlightedZoomButton = self->__highlightedZoomButton;
  if (highlightedZoomButton != v4) {
    [(CAMZoomButton *)highlightedZoomButton setHighlighted:0];
  }
  double v6 = self->__highlightedZoomButton;
  self->__highlightedZoomButton = v4;
  CGFloat v7 = v4;

  [(CAMZoomButton *)self->__highlightedZoomButton setHighlighted:1];
}

- (void)_resetSnapping
{
  [(CAMZoomControl *)self _setSnappedZoomFactor:0.0];
  [(CAMZoomControl *)self _setUnsnappingProgress:0.0];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CAMZoomControl;
  BOOL v8 = [(CAMZoomControl *)&v32 beginTrackingWithTouch:v6 withEvent:v7];
  if (v8)
  {
    CGFloat v9 = [(CAMZoomControl *)self _zoomButton];
    [v6 locationInView:self];
    double v11 = v10;
    double v13 = v12;
    [v7 timestamp];
    double v15 = v14;
    BOOL v16 = [(CAMZoomControl *)self _isZoomDialEnabled];
    uint64_t v17 = [(CAMZoomControl *)self _shouldShowZoomDial];
    -[CAMZoomControl _setStartTouchLocation:](self, "_setStartTouchLocation:", v11, v13);
    -[CAMZoomControl _setPreviousTouchLocation:](self, "_setPreviousTouchLocation:", v11, v13);
    [(CAMZoomControl *)self _setPreviousTouchTime:v15];
    [(CAMZoomControl *)self _resetSnapping];
    [(CAMZoomControl *)self _cancelDelayedZoomDialVisibilityChange];
    BOOL v18 = [(CAMZoomControl *)self _isWithinZoomButtonBoundsWithTouch:v6];
    BOOL v19 = [(CAMZoomControl *)self _isTouchWithinButtonPlatter:v6];
    BOOL v20 = [(CAMZoomControl *)self _isTouchWithinZoomButtonAccessory:v6];
    if (v19)
    {
      [(CAMZoomControl *)self _buttonPlatter];
      unsigned int v31 = v17;
      BOOL v21 = v18;
      BOOL v22 = v16;
      v24 = double v23 = v9;
      CGRect v25 = [v24 nearestZoomButtonForTouch:v6];
      [(CAMZoomControl *)self _setHighlightedZoomButton:v25];

      CGFloat v9 = v23;
      BOOL v16 = v22;
      BOOL v18 = v21;
      uint64_t v17 = v31;
    }
    else if (v18)
    {
      [(CAMZoomControl *)self _setHighlightedZoomButton:v9];
    }
    else if (v20)
    {
      double v26 = [(CAMZoomControl *)self _accessorizedZoomButton];
      [(CAMZoomControl *)self _setHighlightedZoomButton:v26];
    }
    if (v16)
    {
      int v27 = [(CAMZoomControl *)self _shouldInterceptTouchesForHidingZoomDial]
         && !v19;
      if ((v27 & 1) != 0 || v17 != 1)
      {
        double v28 = 0.23;
        if (v27) {
          double v28 = 0.0;
        }
        [(CAMZoomControl *)self _setShouldShowZoomDial:1 animationDuration:1 afterDelay:v28];
      }
    }
    [(CAMZoomControl *)self _setEligibleForSwipeDownToDismiss:v17 & v18];
    [(CAMZoomControl *)self _setEligibleForZoomFactorLabelTaps:v17];
    CGRect v29 = [(CAMZoomControl *)self _feedbackController];
    [v29 prepareDiscreteFeedback:0];
  }
  return v8;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  int v5 = [(CAMZoomControl *)self isTracking];
  id v6 = [v4 name];
  char v7 = [v6 isEqualToString:@"_UISheetInteractionBackgroundDismissRecognizer"];

  if (v5 && (v7 & 1) != 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CAMZoomControl;
    BOOL v8 = [(CAMZoomControl *)&v10 gestureRecognizerShouldBegin:v4];
  }

  return v8;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v83.receiver = self;
  v83.super_class = (Class)CAMZoomControl;
  if (![(CAMZoomControl *)&v83 continueTrackingWithTouch:v6 withEvent:v7]) {
    goto LABEL_75;
  }
  [v6 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  [(CAMZoomControl *)self _startTouchLocation];
  double v13 = v12;
  double v15 = v14;
  [(CAMZoomControl *)self _previousTouchLocation];
  double v17 = v16;
  double v19 = v18;
  [(CAMZoomControl *)self _previousTouchTime];
  double v21 = v20;
  [v7 timestamp];
  double v23 = v22;
  if ([(CAMZoomControl *)self _isZoomDialEnabled])
  {
    double v24 = v11 - v15;
    double v25 = vabdd_f64(v9, v13);
    if ([(CAMZoomControl *)self _isEligibleForSwipeDownToDismiss])
    {
      if (v24 > 13.0)
      {
        [(CAMZoomControl *)self _setShouldShowZoomDial:0 animationDuration:1];
        char v26 = 0;
        if (![(CAMZoomControl *)self _shouldShowZoomDial]) {
          goto LABEL_65;
        }
LABEL_19:
        double v77 = v23;
        double v75 = v23 - v21;
        double v76 = v25;
        double v28 = [(CAMZoomControl *)self _zoomDial];
        -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v28, v17, v19);
        double v29 = v11;
        double v31 = v30;
        double v33 = v32;
        double v78 = v29;
        -[CAMZoomControl convertPoint:toView:](self, "convertPoint:toView:", v28, v9, v29);
        double v35 = v34;
        double v37 = v36;
        objc_msgSend(v28, "offsetAngleForPoint:", v31, v33);
        double v39 = v38;
        objc_msgSend(v28, "offsetAngleForPoint:", v35, v37);
        double v41 = v40 - v39;
        if (v40 - v39 >= -3.14159265)
        {
          if (v41 <= 3.14159265) {
            goto LABEL_24;
          }
          double v42 = -6.28318531;
        }
        else
        {
          double v42 = 6.28318531;
        }
        double v41 = v41 + v42;
LABEL_24:
        -[CAMZoomControl _dampingFactorForMovementFromPoint:toPoint:](self, "_dampingFactorForMovementFromPoint:toPoint:", v17, v19, v9, v78);
        double v44 = v43;
        -[CAMZoomControl _accelerationForMovementFromPointFromPoint:toPoint:elapsedTime:](self, "_accelerationForMovementFromPointFromPoint:toPoint:elapsedTime:", v17, v19, v9, v78, v75);
        double v46 = -(v41 * v44) * v45;
        [v28 zoomFactor];
        objc_msgSend(v28, "offsetAngleForZoomFactor:");
        double v48 = v47;
        double v49 = v46 + v47;
        if ([(CAMZoomControl *)self _shouldSnapDialToSwitchOverZoomFactors])
        {
          [v28 dialCenter];
          double v52 = sqrt((v37 - v51) * (v37 - v51) + (v35 - v50) * (v35 - v50));
          if (v52 <= 0.0) {
            double v53 = 0.0;
          }
          else {
            double v53 = 14.0 / v52;
          }
          [(CAMZoomControl *)self _snappedZoomFactor];
          if (v54 > 0.0)
          {
            [(CAMZoomControl *)self _snappedZoomFactor];
            -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:");
            objc_msgSend(v28, "offsetAngleForZoomFactor:");
            double v49 = v55;
            [(CAMZoomControl *)self _unsnappingProgress];
            double v25 = v76;
            if (v46 > 0.0 && v56 < 0.0 || v46 < 0.0 && v56 > 0.0) {
              double v56 = 0.0;
            }
            double v57 = v46 + v56;
            if (v46 + v56 <= v53)
            {
              double v11 = v78;
              if (v57 >= -v53)
              {
                [(CAMZoomControl *)self _setUnsnappingProgress:v57];
              }
              else
              {
                [(CAMZoomControl *)self _resetSnapping];
                double v49 = v48 + v53 + v57;
              }
            }
            else
            {
              [(CAMZoomControl *)self _resetSnapping];
              double v49 = v48 + v57 - v53;
              double v11 = v78;
            }
            goto LABEL_61;
          }
          [(CAMZoomControl *)self _switchOverZoomFactors];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v58 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v59 = [v58 countByEnumeratingWithState:&v79 objects:v84 count:16];
          if (v59)
          {
            uint64_t v60 = v59;
            uint64_t v61 = *(void *)v80;
            do
            {
              for (uint64_t i = 0; i != v60; ++i)
              {
                if (*(void *)v80 != v61) {
                  objc_enumerationMutation(v58);
                }
                [*(id *)(*((void *)&v79 + 1) + 8 * i) doubleValue];
                double v64 = v63;
                -[CAMZoomControl _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:");
                objc_msgSend(v28, "offsetAngleForZoomFactor:");
                double v66 = v49 - v65;
                BOOL v67 = v48 > v65;
                if (v49 - v65 > 0.0) {
                  BOOL v67 = 0;
                }
                if (v66 <= -v53) {
                  BOOL v67 = 0;
                }
                if (v66 < v53 && v66 >= 0.0 && v48 < v65 || v67)
                {
                  [(CAMZoomControl *)self _setSnappedZoomFactor:v64];
                  [(CAMZoomControl *)self _setUnsnappingProgress:v66];
                  goto LABEL_59;
                }
              }
              uint64_t v60 = [v58 countByEnumeratingWithState:&v79 objects:v84 count:16];
            }
            while (v60);
          }
LABEL_59:

          double v11 = v78;
        }
        else
        {
          [(CAMZoomControl *)self _resetSnapping];
          double v11 = v78;
        }
        double v25 = v76;
LABEL_61:
        [(CAMZoomControl *)self _snappedZoomFactor];
        double v23 = v77;
        if (v71 <= 0.0)
        {
          [v28 zoomFactorForOffsetAngle:v49];
          -[CAMZoomControl _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:");
        }
        else
        {
          [(CAMZoomControl *)self _snappedZoomFactor];
        }
        -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 0, 1);

LABEL_65:
        if ([(CAMZoomControl *)self _shouldShowZoomDial])
        {
          v72 = [(CAMZoomControl *)self _highlightedZoomButton];
          if (v72)
          {

LABEL_69:
            if (v25 > 4.0 || fabs(v24) > 4.0)
            {
              [(CAMZoomControl *)self _setHighlightedZoomButton:0];
              [(CAMZoomControl *)self _setEligibleForZoomFactorLabelTaps:0];
            }
            goto LABEL_72;
          }
          if ([(CAMZoomControl *)self _isEligibleForZoomFactorLabelTaps]) {
            goto LABEL_69;
          }
        }
LABEL_72:
        -[CAMZoomControl _setPreviousTouchLocation:](self, "_setPreviousTouchLocation:", v9, v11);
        [(CAMZoomControl *)self _setPreviousTouchTime:v23];
        if (v26) {
          goto LABEL_73;
        }
        [(CAMZoomControl *)self _cleanupForCancelTracking];
LABEL_75:
        BOOL v73 = 0;
        goto LABEL_76;
      }
      if (v24 < -13.0 || v25 > 15.0) {
        [(CAMZoomControl *)self _setEligibleForSwipeDownToDismiss:0];
      }
    }
    if ([(CAMZoomControl *)self _shouldShowZoomDial])
    {
      char v26 = 1;
    }
    else
    {
      if (v25 <= 15.0 && v24 >= -13.0)
      {
        char v26 = 1;
        goto LABEL_65;
      }
      char v26 = 1;
      [(CAMZoomControl *)self _setShouldShowZoomDial:1 animationDuration:1];
    }
    goto LABEL_19;
  }
  -[CAMZoomControl _setPreviousTouchLocation:](self, "_setPreviousTouchLocation:", v9, v11);
  [(CAMZoomControl *)self _setPreviousTouchTime:v23];
LABEL_73:
  BOOL v73 = 1;
LABEL_76:

  return v73;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CAMZoomControl *)self _zoomButton];
  double v9 = [(CAMZoomControl *)self _accessorizedZoomButton];
  double v10 = [(CAMZoomControl *)self _highlightedZoomButton];
  [(CAMZoomControl *)self _setHighlightedZoomButton:0];
  if (!v6) {
    goto LABEL_32;
  }
  if (v10 != v8 && (!v9 || v10 != v9))
  {
    if (!v10)
    {
      if (![(CAMZoomControl *)self _isEligibleForZoomFactorLabelTaps]) {
        goto LABEL_31;
      }
      double v22 = [(CAMZoomControl *)self _zoomDial];
      [v22 activeZoomFactorLabels];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v23 = (id)[obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v23)
      {
        double v29 = v22;
        double v30 = v9;
        uint64_t v24 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v23; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v34 != v24) {
              objc_enumerationMutation(obj);
            }
            char v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            int v27 = [v26 superview];
            [v6 locationInView:v27];

            [v26 center];
            UIDistanceBetweenPoints();
            if (v28 <= 30.0)
            {
              id v23 = v26;
              goto LABEL_28;
            }
          }
          id v23 = (id)[obj countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v23) {
            continue;
          }
          break;
        }
LABEL_28:
        double v22 = v29;
        double v9 = v30;
      }

      if (!v23) {
        goto LABEL_31;
      }
      [v23 zoomFactor];
      -[CAMZoomControl _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:");
      -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1);
      [(CAMZoomControl *)self _setShouldShowZoomDial:0 animationDuration:1 afterDelay:0.0];

      goto LABEL_32;
    }
    if (![(CAMZoomControl *)self _isTouchWithinButtonPlatter:v6]) {
      goto LABEL_31;
    }
    double v20 = [(CAMZoomControl *)self _buttonPlatter];
    double v21 = [v20 nearestZoomButtonForTouch:v6];

    if (v10 != v21) {
      goto LABEL_31;
    }
    goto LABEL_16;
  }
  [v6 locationInView:v8];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v8 bounds];
  v39.double x = v12;
  v39.double y = v14;
  BOOL v15 = CGRectContainsPoint(v40, v39);
  BOOL v16 = [(CAMZoomControl *)self _isTouchWithinZoomButtonAccessory:v6];
  BOOL v17 = v16;
  if (v15 && !v16)
  {
    double v18 = [(CAMZoomControl *)self _zoomDial];
    uint64_t v19 = [v18 style];

    if (v19)
    {
      if (v19 == 1)
      {
        if ([(CAMZoomControl *)self _shouldShowZoomDial]) {
          goto LABEL_31;
        }
        goto LABEL_16;
      }
      goto LABEL_11;
    }
LABEL_16:
    [(CAMZoomControl *)self _handleButtonTapped:v10 forAccessoryTap:0];
    goto LABEL_32;
  }
LABEL_11:
  if (!v17)
  {
LABEL_31:
    [(CAMZoomControl *)self _setShouldShowZoomDial:0 animationDuration:1 afterDelay:1.5];
    goto LABEL_32;
  }
  [(CAMZoomControl *)self _handleAccessoryTappedForButton:v10];
LABEL_32:
  [(CAMZoomControl *)self _resetSnapping];
  v32.receiver = self;
  v32.super_class = (Class)CAMZoomControl;
  [(CAMZoomControl *)&v32 endTrackingWithTouch:v6 withEvent:v7];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  [(CAMZoomControl *)self _cleanupForCancelTracking];
  v5.receiver = self;
  v5.super_class = (Class)CAMZoomControl;
  [(CAMZoomControl *)&v5 cancelTrackingWithEvent:v4];
}

- (void)_cleanupForCancelTracking
{
  double v3 = [(CAMZoomControl *)self _highlightedZoomButton];
  if (v3)
  {
    id v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring touches to zoom button because cancelTrackingWithEvent received before endTrackingWithTouch is received", v5, 2u);
    }

    [(CAMZoomControl *)self _setHighlightedZoomButton:0];
  }
  [(CAMZoomControl *)self _setShouldShowZoomDial:0 animationDuration:1 afterDelay:0.0];
  [(CAMZoomControl *)self _resetSnapping];
}

- (BOOL)_isButtonPlatterSupportedForConfiguration
{
  double v3 = [(CAMZoomControl *)self _buttonPlatter];

  if (!v3 || (unint64_t)[(CAMZoomControl *)self _zoomControlMode] > 1) {
    return 0;
  }
  id v4 = [(CAMZoomControl *)self _displayZoomFactors];
  unint64_t v5 = [v4 count];
  id v6 = [(CAMZoomControl *)self _buttonPlatter];
  BOOL v7 = v5 >= [v6 buttonCount];

  return v7;
}

- (unint64_t)_numberOfZoomPlatterButtonsForZoomFactorCount:(unint64_t)a3
{
  int64_t v5 = [(CAMZoomControl *)self _zoomControlMode];
  if (!v5) {
    return a3
  }
         - ([(CAMZoomControl *)self _createButtonForMaxZoomFactor] ^ 1);
  if (v5 == 1) {
    return a3;
  }
  return 0;
}

- (BOOL)_shouldShowButtonPlatter
{
  BOOL v3 = [(CAMZoomControl *)self _isButtonPlatterSupportedForConfiguration];
  if (v3) {
    LOBYTE(v3) = ![(CAMZoomControl *)self _shouldShowZoomDial];
  }
  return v3;
}

- (BOOL)_isTouchWithinButtonPlatter:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMZoomControl *)self _buttonPlatter];
  id v6 = [v5 superview];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  LOBYTE(self) = -[CAMZoomControl _isPointWithinButtonPlatter:](self, "_isPointWithinButtonPlatter:", v8, v10);
  return (char)self;
}

- (BOOL)_isPointWithinButtonPlatter:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  BOOL v6 = [(CAMZoomControl *)self _shouldShowButtonPlatter];
  if (v6)
  {
    double v7 = [(CAMZoomControl *)self _buttonPlatter];
    [v7 frame];
    double v9 = v8 + -11.0;
    double v11 = v10 + -11.0;
    double v13 = v12 + 22.0;
    double v15 = v14 + 15.0;

    double v16 = v9;
    double v17 = v11;
    double v18 = v13;
    double v19 = v15;
    CGFloat v20 = x;
    CGFloat v21 = y;
    LOBYTE(v6) = CGRectContainsPoint(*(CGRect *)&v16, *(CGPoint *)&v20);
  }
  return v6;
}

- (void)setPlatterLayoutCompact:(BOOL)a3
{
}

- (void)setPlatterLayoutCompact:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_platterLayoutCompact != a3)
  {
    self->_platterLayoutCompact = a3;
    -[CAMZoomControl _setButtonPlatterCollapsed:animated:](self, "_setButtonPlatterCollapsed:animated:");
    [(CAMZoomControl *)self _updateZoomDialEnablement];
  }
}

- (void)_updateZoomDialEnablement
{
  unint64_t v3 = [(CAMZoomControl *)self _zoomControlMode];
  if (v3 > 5)
  {
    [(CAMZoomControl *)self _setZoomDialEnabled:1];
  }
  else
  {
    if (((1 << v3) & 0x3A) != 0)
    {
      [(CAMZoomControl *)self _setZoomDialEnabled:0];
      return;
    }
    BOOL v4 = [(CAMZoomControl *)self isPlatterLayoutCompact];
    BOOL v5 = v4;
    [(CAMZoomControl *)self _setZoomDialEnabled:!v4];
    if (v5) {
      return;
    }
  }
  BOOL v6 = [(CAMZoomControl *)self _displayZoomFactors];
  double v7 = [v6 firstObject];
  [v7 doubleValue];
  double v9 = v8;

  double v10 = [(CAMZoomControl *)self _displayZoomFactors];
  double v11 = [v10 lastObject];
  [v11 doubleValue];
  double v13 = v12;

  BOOL v14 = v9 != 0.0 && v13 / v9 <= 2.0;
  if ([(CAMZoomControl *)self layoutStyle] == 1 || v14) {
    double v16 = 1.04719755;
  }
  else {
    double v16 = 1.57079633;
  }
  id v17 = [(CAMZoomControl *)self _zoomDial];
  [v17 setAngleDeltaForZoomRange:v16];
}

- (void)_setButtonPlatterCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    [(CAMZoomControl *)self layoutIfNeeded];
    [(CAMZoomControl *)self setNeedsLayout];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__CAMZoomControl__setButtonPlatterCollapsed_animated___block_invoke;
    v7[3] = &unk_263FA02A8;
    v7[4] = self;
    BOOL v8 = v4;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v7 usingSpringWithDamping:0 initialSpringVelocity:0.3 options:0.0 animations:1.0 completion:1.0];
  }
  else
  {
    [(CAMZoomControl *)self setNeedsLayout];
    id v6 = [(CAMZoomControl *)self _buttonPlatter];
    [v6 setCollapsed:v4];
  }
}

uint64_t __54__CAMZoomControl__setButtonPlatterCollapsed_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  unint64_t v3 = [*(id *)(a1 + 32) _buttonPlatter];
  [v3 setCollapsed:v2];

  BOOL v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

- (BOOL)isPlatterExpanded
{
  uint64_t v2 = self;
  unint64_t v3 = [(CAMZoomControl *)self _buttonPlatter];
  LODWORD(v2) = [(CAMZoomControl *)v2 _isButtonPlatterSupportedForConfiguration];
  int v4 = v2 & ([v3 isCollapsed] ^ 1);
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setPreferredCustomLens:(int64_t)a3
{
  if (self->_preferredCustomLens != a3)
  {
    self->_preferredCustomLens = a3;
    id v4 = [(CAMZoomControl *)self _buttonPlatter];
    [v4 setPreferredCustomLens:a3];
  }
}

- (void)_handleButtonTapped:(id)a3 forAccessoryTap:(BOOL)a4
{
  id v16 = a3;
  if ([(CAMZoomControl *)self isPlatterLayoutCompact]) {
    BOOL v6 = [(CAMZoomControl *)self _isButtonPlatterSupportedForConfiguration];
  }
  else {
    BOOL v6 = 0;
  }
  double v7 = [(CAMZoomControl *)self _buttonPlatter];
  int v8 = [v7 isCollapsed];

  double v9 = [(CAMZoomControl *)self _buttonPlatter];
  BOOL v10 = [v9 buttonCount] == 2 && v6;
  char v11 = v10 & v8;

  if (!v6 || !v8 || a4 || (v11 & 1) != 0)
  {
    switch([(CAMZoomControl *)self _zoomControlMode])
    {
      case 0:
        BOOL v14 = [(CAMZoomControl *)self _buttonPlatter];
        if (v14) {
          char v15 = v11;
        }
        else {
          char v15 = 1;
        }

        if (v15) {
          [(CAMZoomControl *)self _handleButtonTappedForDualCameraMode];
        }
        else {
          [(CAMZoomControl *)self _handleButtonTappedForContinuousModeWithPlatter:v16];
        }
        break;
      case 1:
        [(CAMZoomControl *)self _handleButtonTappedForSelection:v16];
        break;
      case 2:
        [(CAMZoomControl *)self _handleButtonTappedForSingleCameraZoomPlusToggle];
        break;
      case 3:
      case 4:
        if (self->_delegateFlags.respondsToToggleBetweenZoomFactors)
        {
          double v12 = [(CAMZoomControl *)self delegate];
          [v12 toggleBetweenZoomFactorsForZoomControl:self];
          goto LABEL_12;
        }
        break;
      case 5:
        [(CAMZoomControl *)self _handleButtonTappedForSingleCameraToggleOnly];
        break;
      default:
        break;
    }
  }
  else
  {
    [(CAMZoomControl *)self _setButtonPlatterCollapsed:0 animated:1];
    double v12 = [(CAMZoomControl *)self delegate];
    [v12 zoomControlDidChangePlatterExpanded:self];
LABEL_12:
  }
  if (((!v6 | v8) & 1) == 0)
  {
    [(CAMZoomControl *)self _setButtonPlatterCollapsed:1 animated:1];
    double v13 = [(CAMZoomControl *)self delegate];
    [v13 zoomControlDidChangePlatterExpanded:self];
  }
}

- (void)_handleButtonTappedForDualCameraMode
{
  unint64_t v3 = [(CAMZoomControl *)self _zoomFactors];
  id v4 = [v3 objectAtIndexedSubscript:1];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = [(CAMZoomControl *)self _displayZoomFactors];
  int v8 = [v7 objectAtIndexedSubscript:1];
  [v8 doubleValue];
  double v10 = v9;

  [(CAMZoomControl *)self displayZoomValue];
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [(CAMZoomControl *)self _displayMinimumZoomFactor];
  char v11 = +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  double v12 = +[CAMZoomButton textForZoomFactor:0 showZoomFactorSymbol:v10];
  char v13 = [v22 isEqualToString:v11];
  int v14 = [v22 isEqualToString:v12];
  [(CAMZoomControl *)self zoomFactor];
  double v16 = v15;
  if ((v13 & 1) == 0)
  {
    if (!v14
      && (([(CAMZoomControl *)self _displayMinimumZoomFactor], v17 == 1.0) || v10 == 1.0))
    {
      [(CAMZoomControl *)self _zoomFactorForDisplayZoomValue:1.0];
    }
    else
    {
      [(CAMZoomControl *)self minimumZoomFactor];
    }
    double v6 = v18;
  }
  [(CAMZoomControl *)self minAvailableZoomFactor];
  if (v6 < v19 || ([(CAMZoomControl *)self maxAvailableZoomFactor], v6 > v20)) {
    double v6 = v16;
  }
  if (v6 == v16)
  {
    [(CAMZoomControl *)self _setShouldShowZoomDial:1 animationDuration:1 afterDelay:0.0];
    double v21 = 1.5;
  }
  else
  {
    [(CAMZoomControl *)self _setZoomFactor:1 interactionType:1 shouldNotifyDelegate:v6];
    double v21 = 0.0;
  }
  [(CAMZoomControl *)self _setShouldShowZoomDial:0 animationDuration:1 afterDelay:v21];
}

- (void)_handleButtonTappedForContinuousModeWithPlatter:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMZoomControl *)self _zoomButton];

  if (v5 == v4)
  {
    double v13 = 1.5;
  }
  else
  {
    double v6 = [(CAMZoomControl *)self _buttonPlatter];
    double v7 = [v6 baseZoomPointForButton:v4];
    [(CAMZoomControl *)self zoomFactor];
    double v9 = v8;
    if (v7)
    {
      id v10 = [v6 zoomFactorButton];

      if (v10 == v4)
      {
        int v14 = [v7 allZoomPoints];
        uint64_t v25 = 0;
        char v26 = &v25;
        uint64_t v27 = 0x2020000000;
        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v21 = 0;
        id v22 = (double *)&v21;
        uint64_t v23 = 0x2020000000;
        uint64_t v24 = 0x7FEFFFFFFFFFFFFFLL;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __66__CAMZoomControl__handleButtonTappedForContinuousModeWithPlatter___block_invoke;
        v20[3] = &unk_263FA13A0;
        *(double *)&v20[6] = v9;
        v20[4] = &v21;
        v20[5] = &v25;
        [v14 enumerateObjectsUsingBlock:v20];
        double v12 = v22[3];
        if (vabdd_f64(v12, v9) < 0.001)
        {
          unint64_t v15 = [v14 count];
          double v16 = [v14 objectAtIndexedSubscript:(v15 + v26[3] - 1) % v15];
          [v16 zoomFactor];
          double v12 = v17;
        }
        _Block_object_dispose(&v21, 8);
        _Block_object_dispose(&v25, 8);
      }
      else
      {
        [v6 defaultZoomFactorForButton:v4];
        -[CAMZoomControl _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:");
        double v12 = v11;
      }
    }
    else
    {
      double v12 = 1.0;
    }
    [(CAMZoomControl *)self minAvailableZoomFactor];
    if (v12 >= v18 && ([(CAMZoomControl *)self maxAvailableZoomFactor], v12 <= v19))
    {
      if (v12 != v9) {
        [(CAMZoomControl *)self _setZoomFactor:1 interactionType:1 shouldNotifyDelegate:v12];
      }
      double v13 = 0.0;
    }
    else
    {
      double v13 = 0.0;
      if ([(CAMZoomControl *)self _isZoomDialEnabled])
      {
        [(CAMZoomControl *)self _setShouldShowZoomDial:1 animationDuration:1 afterDelay:0.0];
        double v13 = 1.5;
      }
    }
  }
  [(CAMZoomControl *)self _setShouldShowZoomDial:0 animationDuration:1 afterDelay:v13];
}

uint64_t __66__CAMZoomControl__handleButtonTappedForContinuousModeWithPlatter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 zoomFactor];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (vabdd_f64(v6, *(double *)(a1 + 48)) < vabdd_f64(*(double *)(v7 + 24), *(double *)(a1 + 48)))
  {
    *(double *)(v7 + 24) = v6;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (void)_handleButtonTappedForSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMZoomControl *)self _buttonPlatter];
  id v15 = [v5 baseZoomPointForButton:v4];

  [v15 displayZoomFactor];
  if (v15)
  {
    double v7 = v6;
    [(CAMZoomControl *)self displayZoomValue];
    if (v7 != v8)
    {
      double v9 = [(CAMZoomControl *)self _buttonPlatter];
      uint64_t v10 = [v9 zoomFactors];
      double v11 = [NSNumber numberWithDouble:v7];
      uint64_t v12 = [(id)v10 indexOfObject:v11];

      double v13 = [(CAMZoomControl *)self delegate];
      LOBYTE(v10) = objc_opt_respondsToSelector();

      if (v10)
      {
        int v14 = [(CAMZoomControl *)self delegate];
        [v14 zoomControl:self didChangeSelectedButtonIndex:v12 displayZoomFactor:v7];
      }
    }
  }
}

- (void)_handleAccessoryTappedForButton:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = [(CAMZoomControl *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if ([(CAMZoomControl *)self _isButtonPlatterSupportedForConfiguration])
    {
      double v6 = [(CAMZoomControl *)self _buttonPlatter];
      double v7 = [v6 zoomFactors];

      double v8 = [(CAMZoomControl *)self _buttonPlatter];
      uint64_t v9 = [v8 buttons];
    }
    else
    {
      uint64_t v10 = NSNumber;
      double v11 = [(CAMZoomControl *)self _zoomButton];
      [v11 zoomFactor];
      uint64_t v12 = objc_msgSend(v10, "numberWithDouble:");
      v25[0] = v12;
      double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];

      double v8 = [(CAMZoomControl *)self _zoomButton];
      uint64_t v24 = v8;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    }
    double v13 = (void *)v9;

    int v14 = [(CAMZoomControl *)self delegate];
    unint64_t v15 = [v14 zoomControl:self accessoryButtonTapIndexInDisplayZoomFactors:v7];

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 >= [v13 count])
      {
        double v16 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 134218240;
          unint64_t v21 = v15;
          __int16 v22 = 2048;
          uint64_t v23 = [v13 count];
          _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "accessoryButtonTapIndexInDisplayZoomFactors %ld outside available count: %ld", (uint8_t *)&v20, 0x16u);
        }
      }
      else
      {
        double v16 = [v13 objectAtIndexedSubscript:v15];
        [(CAMZoomControl *)self _handleButtonTapped:v16 forAccessoryTap:1];
      }
    }
  }
  double v17 = [(CAMZoomControl *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    double v19 = [(CAMZoomControl *)self delegate];
    [v19 zoomControlDidTapZoomButtonAccessory:self];
  }
}

- (void)_handleButtonTappedForSingleCameraZoomPlusToggle
{
  [(CAMZoomControl *)self displayZoomValue];
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(CAMZoomControl *)self _displayMinimumZoomFactor];
  unint64_t v3 = +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  if (![v8 isEqualToString:v3])
  {
    [(CAMZoomControl *)self minimumZoomFactor];
    -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1);
LABEL_7:
    double v7 = 0.0;
    goto LABEL_9;
  }
  if (self->_delegateFlags.respondsToCanToggleBetweenZoomFactors)
  {
    id v4 = [(CAMZoomControl *)self delegate];
    int v5 = [v4 canToggleBetweenZoomFactorsForZoomControl:self];

    if (v5)
    {
      if (self->_delegateFlags.respondsToToggleBetweenZoomFactors)
      {
        double v6 = [(CAMZoomControl *)self delegate];
        [v6 toggleBetweenZoomFactorsForZoomControl:self];
      }
      goto LABEL_7;
    }
  }
  [(CAMZoomControl *)self _setShouldShowZoomDial:1 animationDuration:1 afterDelay:0.0];
  double v7 = 1.5;
LABEL_9:
  [(CAMZoomControl *)self _setShouldShowZoomDial:0 animationDuration:1 afterDelay:v7];
}

- (void)_handleButtonTappedForSingleCameraToggleOnly
{
  [(CAMZoomControl *)self displayZoomValue];
  +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CAMZoomControl *)self _displayMinimumZoomFactor];
  unint64_t v3 = +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  if ([v4 isEqualToString:v3]) {
    [(CAMZoomControl *)self maximumZoomFactor];
  }
  else {
    [(CAMZoomControl *)self minimumZoomFactor];
  }
  -[CAMZoomControl _setZoomFactor:interactionType:shouldNotifyDelegate:](self, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1);
}

- (void)_updateSignificantValuesForHaptics
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  int v5 = [(CAMZoomControl *)self _displayZoomFactors];
  uint64_t v6 = [v5 count];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __52__CAMZoomControl__updateSignificantValuesForHaptics__block_invoke;
  double v13 = &unk_263FA13C8;
  id v14 = v5;
  id v15 = v3;
  id v16 = v4;
  uint64_t v17 = v6 - 1;
  id v7 = v4;
  id v8 = v3;
  id v9 = v5;
  [v9 enumerateObjectsUsingBlock:&v10];
  -[CAMZoomControl _setSignificantHapticDisplayValues:](self, "_setSignificantHapticDisplayValues:", v8, v10, v11, v12, v13);
  [(CAMZoomControl *)self _setSignificantHapticDisplayValueSwitchOverIndexes:v7];
  [(CAMZoomControl *)self displayZoomValue];
  -[CAMZoomControl set_lastHapticZone:](self, "set_lastHapticZone:", -[CAMZoomControl _hapticZoneForDisplayValue:](self, "_hapticZoneForDisplayValue:"));
}

void __52__CAMZoomControl__updateSignificantValuesForHaptics__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v15 = a2;
  if (a3)
  {
    if (*(void *)(a1 + 56) == a3)
    {
      int v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1];
      [v5 doubleValue];
      double v7 = v6;

      [v15 doubleValue];
      double v9 = v8;
      double v10 = floor(v7) + 1.0;
      if (v10 < v8)
      {
        do
        {
          uint64_t v11 = *(void **)(a1 + 40);
          uint64_t v12 = [NSNumber numberWithDouble:v10];
          [v11 addObject:v12];

          double v10 = v10 + 1.0;
        }
        while (v10 < v9);
      }
    }
    if (*(void *)(a1 + 56) > a3)
    {
      double v13 = *(void **)(a1 + 48);
      id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
      [v13 addObject:v14];
    }
  }
  [*(id *)(a1 + 40) addObject:v15];
}

- (void)_setSignificantHapticDisplayValues:(id)a3
{
  id v5 = a3;
  uint64_t significantHapticDisplayValues = (uint64_t)self->__significantHapticDisplayValues;
  if ((id)significantHapticDisplayValues != v5)
  {
    id v7 = v5;
    uint64_t significantHapticDisplayValues = [(id)significantHapticDisplayValues isEqualToArray:v5];
    id v5 = v7;
    if ((significantHapticDisplayValues & 1) == 0)
    {
      objc_storeStrong((id *)&self->__significantHapticDisplayValues, a3);
      uint64_t significantHapticDisplayValues = [(CAMZoomControl *)self _updateHapticEpsilons];
      id v5 = v7;
    }
  }
  MEMORY[0x270F9A758](significantHapticDisplayValues, v5);
}

- (void)_updateHapticEpsilons
{
  [(CAMZoomControl *)self zoomDialRadius];
  if (v3 > 0.0)
  {
    double v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    double v6 = [(CAMZoomControl *)self _zoomDial];
    id v7 = [(CAMZoomControl *)self _zoomDial];
    [v7 angleDeltaForZoomRange];
    double v9 = v8;

    if (v4 * v9 <= 0.0) {
      double v10 = 0.0;
    }
    else {
      double v10 = 2.0 / (v4 * v9);
    }
    uint64_t v11 = [(CAMZoomControl *)self _significantHapticDisplayValues];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __39__CAMZoomControl__updateHapticEpsilons__block_invoke;
    char v18 = &unk_263FA13C8;
    id v19 = v6;
    id v20 = v11;
    double v22 = v10;
    id v21 = v5;
    id v12 = v5;
    id v13 = v11;
    id v14 = v6;
    [v13 enumerateObjectsUsingBlock:&v15];
    -[CAMZoomControl _setSignificantHapticDisplayValueEpsilons:](self, "_setSignificantHapticDisplayValueEpsilons:", v12, v15, v16, v17, v18);
  }
}

void __39__CAMZoomControl__updateHapticEpsilons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 doubleValue];
  double v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "normalizedValueForZoomFactor:");
  double v8 = v7;
  uint64_t v9 = [*(id *)(a1 + 40) count] - 1;
  double v10 = *(double *)(a1 + 56);
  uint64_t v11 = *(void **)(a1 + 32);
  if (v9 == a3)
  {
    [v11 zoomFactorForNormalizedValue:v8 - v10];
  }
  else
  {
    [v11 zoomFactorForNormalizedValue:v8 + v10];
    double v14 = v13;
    double v12 = v6;
    double v6 = v14;
  }
  uint64_t v15 = *(void **)(a1 + 48);
  id v16 = [NSNumber numberWithDouble:v6 - v12];
  [v15 addObject:v16];
}

- (int64_t)_hapticZoneForDisplayValue:(double)a3
{
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = -1;
  BOOL v5 = [(CAMZoomControl *)self _shouldSnapDialToSwitchOverZoomFactors];
  double v6 = [(CAMZoomControl *)self _significantHapticDisplayValues];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__CAMZoomControl__hapticZoneForDisplayValue___block_invoke;
  v9[3] = &unk_263FA13F0;
  BOOL v10 = v5;
  *(double *)&v9[6] = a3;
  v9[4] = self;
  v9[5] = &v11;
  [v6 enumerateObjectsUsingBlock:v9];

  int64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __45__CAMZoomControl__hapticZoneForDisplayValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 doubleValue];
  double v8 = v7;
  uint64_t v9 = [*(id *)(a1 + 32) _significantHapticDisplayValueEpsilons];
  BOOL v10 = [v9 objectAtIndexedSubscript:a3];
  [v10 doubleValue];
  double v12 = v11;

  uint64_t v13 = [*(id *)(a1 + 32) _significantHapticDisplayValueSwitchOverIndexes];
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:a3];
  int v15 = [v13 containsObject:v14];

  double v16 = *(double *)(a1 + 48);
  if (v16 < v8) {
    goto LABEL_8;
  }
  double v17 = 0.0;
  if (!v15) {
    double v17 = v12;
  }
  if (!*(unsigned char *)(a1 + 56)) {
    double v17 = v12;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v16 <= v8 + v17) {
LABEL_8:
  }
    *a4 = 1;
  else {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (void)_updateHaptics:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CAMZoomControl *)self _feedbackController];

  if (v5)
  {
    [(CAMZoomControl *)self displayZoomValue];
    int64_t v6 = -[CAMZoomControl _hapticZoneForDisplayValue:](self, "_hapticZoneForDisplayValue:");
    int64_t v7 = [(CAMZoomControl *)self _lastHapticZone];
    double v8 = [(CAMZoomControl *)self _zoomDial];
    int v9 = [v8 isExpanded];

    if (v9)
    {
      if (v3)
      {
        uint64_t v10 = v6 - v7;
        if (v6 != v7)
        {
          if ((v6 & 1) == 0) {
            goto LABEL_9;
          }
          if (v10 < 0) {
            uint64_t v10 = v7 - v6;
          }
          if ((unint64_t)v10 >= 2)
          {
LABEL_9:
            double v11 = [(CAMZoomControl *)self _feedbackController];
            [v11 performDiscreteFeedback:0];

            double v12 = [(CAMZoomControl *)self _feedbackController];
            [v12 prepareDiscreteFeedback:0];
          }
        }
      }
    }
    [(CAMZoomControl *)self set_lastHapticZone:v6];
  }
}

- (CAMZoomControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMZoomControlDelegate *)WeakRetained;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (double)minAvailableZoomFactor
{
  return self->_minAvailableZoomFactor;
}

- (double)maxAvailableZoomFactor
{
  return self->_maxAvailableZoomFactor;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)zoomButtonAccessoryState
{
  return self->_zoomButtonAccessoryState;
}

- (CAMZoomButton)_zoomButton
{
  return self->__zoomButton;
}

- (CAMZoomDial)_zoomDial
{
  return self->__zoomDial;
}

- (UIView)_dialClippingView
{
  return self->__dialClippingView;
}

- (CAMZoomControlButtonMaskView)_buttonMaskView
{
  return self->__buttonMaskView;
}

- (CAMZoomButtonPlatter)_buttonPlatter
{
  return self->__buttonPlatter;
}

- (int64_t)_zoomControlMode
{
  return self->__zoomControlMode;
}

- (void)_setZoomControlMode:(int64_t)a3
{
  self->__zoomControlMode = a3;
}

- (NSArray)_zoomFactors
{
  return self->__zoomFactors;
}

- (void)_setZoomFactors:(id)a3
{
}

- (NSArray)_displayZoomFactors
{
  return self->__displayZoomFactors;
}

- (void)_setDisplayZoomFactors:(id)a3
{
}

- (NSArray)_zoomPoints
{
  return self->__zoomPoints;
}

- (void)_setZoomPoints:(id)a3
{
}

- (BOOL)_createButtonForMaxZoomFactor
{
  return self->__createButtonForMaxZoomFactor;
}

- (void)_setCreateButtonForMaxZoomFactor:(BOOL)a3
{
  self->__createButtonForMaxZoomFactor = a3;
}

- (BOOL)_isZoomDialEnabled
{
  return self->__zoomDialEnabled;
}

- (BOOL)_shouldShowZoomDial
{
  return self->__shouldShowZoomDial;
}

- (CGPoint)_startTouchLocation
{
  double x = self->__startTouchLocation.x;
  double y = self->__startTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setStartTouchLocation:(CGPoint)a3
{
  self->__startTouchLocation = a3;
}

- (CGPoint)_previousTouchLocation
{
  double x = self->__previousTouchLocation.x;
  double y = self->__previousTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setPreviousTouchLocation:(CGPoint)a3
{
  self->__previousTouchLocation = a3;
}

- (double)_previousTouchTime
{
  return self->__previousTouchTime;
}

- (void)_setPreviousTouchTime:(double)a3
{
  self->__previousTouchTime = a3;
}

- (BOOL)_isEligibleForSwipeDownToDismiss
{
  return self->__eligibleForSwipeDownToDismiss;
}

- (void)_setEligibleForSwipeDownToDismiss:(BOOL)a3
{
  self->__eligibleForSwipeDownToDismiss = a3;
}

- (BOOL)_isEligibleForZoomFactorLabelTaps
{
  return self->__eligibleForZoomFactorLabelTaps;
}

- (void)_setEligibleForZoomFactorLabelTaps:(BOOL)a3
{
  self->__eligibleForZoomFactorLabelTaps = a3;
}

- (NSTimer)_zoomDialVisibilityTimer
{
  return self->__zoomDialVisibilityTimer;
}

- (void)_setZoomDialVisibilityTimer:(id)a3
{
}

- (NSDate)_startTimeForHideAnimationInProgress
{
  return self->__startTimeForHideAnimationInProgress;
}

- (void)_setStartTimeForHideAnimationInProgress:(id)a3
{
}

- (double)_hideAnimationInProgressDuration
{
  return self->__hideAnimationInProgressDuration;
}

- (void)_setHideAnimationInProgressDuration:(double)a3
{
  self->__hideAnimationInProgressDuration = a3;
}

- (CAMZoomButton)_highlightedZoomButton
{
  return self->__highlightedZoomButton;
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (NSArray)_significantHapticDisplayValues
{
  return self->__significantHapticDisplayValues;
}

- (NSArray)_significantHapticDisplayValueEpsilons
{
  return self->__significantHapticDisplayValueEpsilons;
}

- (void)_setSignificantHapticDisplayValueEpsilons:(id)a3
{
}

- (NSSet)_significantHapticDisplayValueSwitchOverIndexes
{
  return self->__significantHapticDisplayValueSwitchOverIndexes;
}

- (void)_setSignificantHapticDisplayValueSwitchOverIndexes:(id)a3
{
}

- (int64_t)_lastHapticZone
{
  return self->__lastHapticZone;
}

- (void)set_lastHapticZone:(int64_t)a3
{
  self->__lastHapticZone = a3;
}

- (double)_snappedZoomFactor
{
  return self->__snappedZoomFactor;
}

- (void)_setSnappedZoomFactor:(double)a3
{
  self->__snappedZoomFactor = a3;
}

- (double)_unsnappingProgress
{
  return self->__unsnappingProgress;
}

- (void)_setUnsnappingProgress:(double)a3
{
  self->__unsnappingProgress = a3;
}

- (int64_t)preferredCustomLens
{
  return self->_preferredCustomLens;
}

- (double)edgeMargin
{
  return self->_edgeMargin;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)zoomButtonMaxYWhenContracted
{
  return self->_zoomButtonMaxYWhenContracted;
}

- (BOOL)isPlatterLayoutCompact
{
  return self->_platterLayoutCompact;
}

- (double)zoomDialRadius
{
  return self->_zoomDialRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__significantHapticDisplayValueSwitchOverIndexes, 0);
  objc_storeStrong((id *)&self->__significantHapticDisplayValueEpsilons, 0);
  objc_storeStrong((id *)&self->__significantHapticDisplayValues, 0);
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__highlightedZoomButton, 0);
  objc_storeStrong((id *)&self->__startTimeForHideAnimationInProgress, 0);
  objc_storeStrong((id *)&self->__zoomDialVisibilityTimer, 0);
  objc_storeStrong((id *)&self->__zoomPoints, 0);
  objc_storeStrong((id *)&self->__displayZoomFactors, 0);
  objc_storeStrong((id *)&self->__zoomFactors, 0);
  objc_storeStrong((id *)&self->__buttonPlatter, 0);
  objc_storeStrong((id *)&self->__buttonMaskView, 0);
  objc_storeStrong((id *)&self->__dialClippingView, 0);
  objc_storeStrong((id *)&self->__zoomDial, 0);
  objc_storeStrong((id *)&self->__zoomButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)configureForContinuousZoomWithZoomFactor:(void *)a1 zoomPoints:(NSObject *)a2 createButtonForMaxZoomFactor:compactPlatterLayout:animated:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Unexpected count for zoomPoints: %lu", (uint8_t *)&v3, 0xCu);
}

@end
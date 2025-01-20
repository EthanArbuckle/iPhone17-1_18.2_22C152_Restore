@interface CAMDynamicShutterControl
+ (CAMShutterButtonSpec)shutterButtonSpecForLayoutStyle:(SEL)a3;
- ($01BB1521EC52D44A8E7628F5261DCEC8)_dragHandleColor;
- ($01BB1521EC52D44A8E7628F5261DCEC8)_innerShapeColor;
- ($76EADD4ED24426C67044446678BAA581)settings;
- ($E50CC26D34D0158E20D4445E4757B7F2)_firstTouch;
- ($E50CC26D34D0158E20D4445E4757B7F2)_mostRecentTouch;
- ($E50CC26D34D0158E20D4445E4757B7F2)_touchForPoint:(SEL)a3;
- ($E5C720D6BB068A42F0C2CD001350366C)privateSettings;
- (BOOL)_canDragCounter;
- (BOOL)_canDragStartStop;
- (BOOL)_didCancelZoomForCurrentGesture;
- (BOOL)_ignoreNextCancelledGesture;
- (BOOL)_isActiveTouchSequencePhase:(int64_t)a3;
- (BOOL)_isDraggingEnabled;
- (BOOL)_isExternalLockButtonPressed;
- (BOOL)_isExternalShutterPressed;
- (BOOL)_isHandleWithinLockRing;
- (BOOL)_isPastCounterDragThreshold;
- (BOOL)_isPastStartStopDragThreshold;
- (BOOL)_isPointWithinLockRingTouchArea:(CGPoint)a3;
- (BOOL)_isPointWithinPauseResumeRingTouchArea:(CGPoint)a3;
- (BOOL)_isPointWithinShutterButtonTouchArea:(CGPoint)a3;
- (BOOL)_isStartStopShutterState:(int64_t)a3;
- (BOOL)_isTrackingHandleState:(int64_t)a3;
- (BOOL)_isValidChangeFromState:(int64_t)a3 toState:(int64_t)a4;
- (BOOL)_shouldCheckTouchUpEvents;
- (BOOL)_shouldReceiveTouch:(id *)a3;
- (BOOL)_shouldShortPressOnTouchDown;
- (BOOL)_shouldShortPressOnTouchUp;
- (BOOL)_shouldStartStopOnTouchDown;
- (BOOL)_shouldStartTrackingHandle;
- (BOOL)externalButtonPressedWithBehavior:(int64_t)a3;
- (BOOL)externalButtonReleased;
- (BOOL)externalLockButtonPressed;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPausedDuringVideo;
- (BOOL)isShutterStateDefault;
- (BOOL)isSpinning;
- (BOOL)isZooming;
- (BOOL)showContrastBorder;
- (BOOL)showDisabled;
- (CADisplayLink)_displayLink;
- (CAMDynamicShutterControl)initWithMetalDevice:(id)a3 commandQueue:(id)a4;
- (CAMDynamicShutterControl)initWithMetalDevice:(id)a3 commandQueue:(id)a4 layoutStyle:(int64_t)a5;
- (CAMDynamicShutterControlDelegate)delegate;
- (CAMDynamicShutterGestureRecognizer)_gestureRecognizer;
- (CAMFeedbackController)_feedbackController;
- (CAMLiquidShutterRenderer)_liquidShutterRenderer;
- (CAMMetalView)_metalView;
- (CAMShutterButtonSpec)_lockButtonActiveSpec;
- (CAMShutterButtonSpec)_lockButtonInactiveSpec;
- (CAMShutterButtonSpec)_pauseResumeButtonSpec;
- (CAMShutterButtonSpec)_shutterButtonSpec;
- (CAMSpring)_dragHandleAlphaSpring;
- (CAMSpring)_dragHandleColorIsWhiteSpring;
- (CAMSpring)_dragHandleWidthSpring;
- (CAMSpring)_drawLockUISpring;
- (CAMSpring)_drawPauseResumeUISpring;
- (CAMSpring)_expandLockRingSpring;
- (CAMSpring)_innerShapeAlphaSpring;
- (CAMSpring)_innerShapeColorIsRedSpring;
- (CAMSpring)_innerShapePowerSpring;
- (CAMSpring)_innerShapeWidthSpring;
- (CAMSpring)_pausedDuringVideoSpring;
- (CAMTimelapseShutterRingView)_centerTimelapseOuterView;
- (CAMTrackingSpring)_dragHandleOffsetSpring;
- (CEKDisplayLinkTarget)_displayLinkTarget;
- (CGPoint)_lockButtonCenter;
- (CGPoint)_pauseResumeButtonCenter;
- (CGPoint)_shutterButtonCenter;
- (CGRect)_lockButtonFrame;
- (CGRect)_pauseResumeButtonFrame;
- (CGRect)_shutterButtonFrame;
- (CGRect)frameForAlignmentRect:(CGRect)a3 availableWidth:(double)a4;
- (CGSize)intrinsicContentSize;
- (NSArray)_springs;
- (UIImageView)_centerOuterImageView;
- (UIImageView)_pauseImageView;
- (UIImageView)_videoLockImageView;
- (UILabel)_counterLabel;
- (UIView)_centerOuterLegibilityView;
- (UIView)_centerOuterView;
- (UIView)_leftLineLegibilityView;
- (UIView)_leftLineView;
- (UIView)_lockButtonOuterLegibilityView;
- (UIView)_lockButtonOuterView;
- (UIView)_pauseResumeButtonLegibilityView;
- (UIView)_pauseResumeButtonOuterView;
- (UIView)_resumeCircleView;
- (UIView)_rightLineLegibilityView;
- (UIView)_rightLineView;
- (UIView)_spinnerView;
- (double)_absoluteShutterToBottomDistance;
- (double)_dragHandleXPosition;
- (double)_externalLongPressVideoDuration;
- (double)_initalZoomGestureOffsetY;
- (double)_longPressVideoDuration;
- (double)_touchBeganTime;
- (double)lockButtonCenterRightInset;
- (double)pauseResumeButtonCenterLeftInset;
- (id)_outerImage;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_consumeAndUpdateTouchSequencePhase;
- (int64_t)_counterValue;
- (int64_t)_dragHandleState;
- (int64_t)_externalShutterLongPressBehavior;
- (int64_t)_innerShapeState;
- (int64_t)_shutterState;
- (int64_t)_startGestureForShutterState:(int64_t)a3;
- (int64_t)_touchSequencePhase;
- (int64_t)incrementCounter;
- (int64_t)orientation;
- (void)_cancelTouchSequenceForReset:(BOOL)a3;
- (void)_handlePress:(id)a3;
- (void)_handleTapToStartStop;
- (void)_resetShutterState;
- (void)_setCounterValue:(int64_t)a3;
- (void)_setDragHandleState:(int64_t)a3;
- (void)_setDragHandleState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setExternalLockButtonPressed:(BOOL)a3;
- (void)_setExternalShutterPressed:(BOOL)a3;
- (void)_setFirstTouch:(id *)a3;
- (void)_setIgnoreNextCancelledGesture:(BOOL)a3;
- (void)_setInnerShapeState:(int64_t)a3;
- (void)_setInnerShapeState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setMostRecentTouch:(id *)a3;
- (void)_setShutterState:(int64_t)a3;
- (void)_setTouchBeganTime:(double)a3;
- (void)_setTouchSequencePhase:(int64_t)a3;
- (void)_touchSequenceBegan:(id *)a3;
- (void)_touchSequenceCancelledForReset:(BOOL)a3;
- (void)_touchSequenceChanged:(id *)a3;
- (void)_touchSequenceEnded:(id *)a3 forReset:(BOOL)a4;
- (void)_updateCenterButton;
- (void)_updateCenterLegibilityView;
- (void)_updateCounterAlpha;
- (void)_updateCounterLabelText;
- (void)_updateDragHandleAlphaTarget;
- (void)_updateDragHandleColorIsWhiteTarget;
- (void)_updateDragHandleWidthTarget;
- (void)_updateDrawLockUITarget;
- (void)_updateExpandLockRingTarget;
- (void)_updateForTargetTimestamp:(double)a3;
- (void)_updateInnerShapeAlphaTarget;
- (void)_updateInnerShapeColorIsRedTarget;
- (void)_updateInnerShapePowerTarget;
- (void)_updateInnerShapeWidthTarget;
- (void)_updateLeftLine;
- (void)_updateLockGlyphTransformAndAlpha;
- (void)_updateLockUI;
- (void)_updateMetalViewAlpha;
- (void)_updateOuterAndInnerLayersAnimated:(BOOL)a3;
- (void)_updatePauseResumeDrawTarget;
- (void)_updatePauseResumeUI;
- (void)_updatePausedDuringVideoTarget;
- (void)_updateRendererShapes;
- (void)_updateRightLine;
- (void)_updateSpinningAnimations;
- (void)_updateSpringTargetsAnimated:(BOOL)a3;
- (void)_updateStateForTouchPoint:(CGPoint)a3;
- (void)_updateStateToLongPressIfNeededWithPhase:(int64_t)a3;
- (void)_updateStaticDragHandleOffsetTargetAnimated:(BOOL)a3;
- (void)_updateTrackingDragHandleOffsetTargetWithPoint:(CGPoint)a3;
- (void)_updateTrackingSpringTargets;
- (void)_updateViewsFromCurrentState;
- (void)cancelZoom;
- (void)dealloc;
- (void)externalButtonCancelled;
- (void)externalLockButtonReleased;
- (void)layoutSubviews;
- (void)metalViewDidChangeDrawableSize:(id)a3;
- (void)resetAnimated:(BOOL)a3;
- (void)resetCounter;
- (void)setDelegate:(id)a3;
- (void)setLockButtonCenterRightInset:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setPauseResumeButtonCenterLeftInset:(double)a3;
- (void)setPausedDuringVideo:(BOOL)a3;
- (void)setPausedDuringVideo:(BOOL)a3 animated:(BOOL)a4;
- (void)setSettings:(id *)a3;
- (void)setSettings:(id *)a3 animated:(BOOL)a4;
- (void)setSettings:(id *)a3 privateSettings:(id)a4 animated:(BOOL)a5;
- (void)setShowContrastBorder:(BOOL)a3;
- (void)setShowDisabled:(BOOL)a3;
- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setSpinning:(BOOL)a3;
- (void)setZooming:(BOOL)a3;
- (void)set_centerOuterImageView:(id)a3;
- (void)set_centerTimelapseOuterView:(id)a3;
- (void)set_didCancelZoomForCurrentGesture:(BOOL)a3;
- (void)set_externalLongPressVideoDuration:(double)a3;
- (void)set_externalShutterLongPressBehavior:(int64_t)a3;
- (void)set_initalZoomGestureOffsetY:(double)a3;
- (void)set_longPressVideoDuration:(double)a3;
- (void)set_shouldCheckTouchUpEvents:(BOOL)a3;
- (void)set_spinnerView:(id)a3;
@end

@implementation CAMDynamicShutterControl

- (CAMDynamicShutterControl)initWithMetalDevice:(id)a3 commandQueue:(id)a4
{
  v6 = (void *)MEMORY[0x263F82670];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 currentDevice];
  uint64_t v10 = objc_msgSend(v9, "cam_initialLayoutStyle");

  v11 = [(CAMDynamicShutterControl *)self initWithMetalDevice:v8 commandQueue:v7 layoutStyle:v10];
  return v11;
}

- (CAMDynamicShutterControl)initWithMetalDevice:(id)a3 commandQueue:(id)a4 layoutStyle:(int64_t)a5
{
  v145[12] = *MEMORY[0x263EF8340];
  id v136 = a3;
  id v135 = a4;
  v144.receiver = self;
  v144.super_class = (Class)CAMDynamicShutterControl;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[CAMDynamicShutterControl initWithFrame:](&v144, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    *(_OWORD *)(v12 + 1112) = 0u;
    *(_OWORD *)(v12 + 1128) = 0u;
    *(_OWORD *)(v12 + 1144) = 0u;
    *(_OWORD *)(v12 + 1160) = 0u;
    *((void *)v12 + 147) = 0;
    v12[483] = 0;
    objc_initWeak(&location, v12);
    id v14 = objc_alloc(MEMORY[0x263F306A8]);
    v141[0] = MEMORY[0x263EF8330];
    v141[1] = 3221225472;
    v141[2] = __73__CAMDynamicShutterControl_initWithMetalDevice_commandQueue_layoutStyle___block_invoke;
    v141[3] = &unk_263FA6300;
    objc_copyWeak(&v142, &location);
    uint64_t v15 = [v14 initWithHandler:v141];
    v16 = (void *)*((void *)v13 + 66);
    *((void *)v13 + 66) = v15;

    uint64_t v17 = [MEMORY[0x263F15780] displayLinkWithTarget:*((void *)v13 + 66) selector:sel_displayLinkDidFire_];
    v18 = (void *)*((void *)v13 + 65);
    *((void *)v13 + 65) = v17;

    v19 = (void *)*((void *)v13 + 65);
    v20 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v19 addToRunLoop:v20 forMode:*MEMORY[0x263EFF588]];

    v21 = [[CAMLiquidShutterRenderer alloc] initWithDevice:v136 commandQueue:v135 pixelFormat:80];
    v22 = (void *)*((void *)v13 + 67);
    *((void *)v13 + 67) = v21;

    v23 = -[CAMMetalView initWithFrame:]([CAMMetalView alloc], "initWithFrame:", v8, v9, v10, v11);
    v24 = (void *)*((void *)v13 + 68);
    *((void *)v13 + 68) = v23;

    [*((id *)v13 + 68) setMetalViewDelegate:v13];
    v25 = [*((id *)v13 + 68) metalLayer];
    [v25 setDevice:v136];

    v26 = [*((id *)v13 + 68) metalLayer];
    [v26 setPixelFormat:80];

    v27 = [*((id *)v13 + 68) metalLayer];
    [*((id *)v13 + 67) setMetalLayer:v27];

    v28 = [*((id *)v13 + 68) layer];
    [v28 setOpaque:0];

    [*((id *)v13 + 68) setUserInteractionEnabled:0];
    [v13 addSubview:*((void *)v13 + 68)];
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    v30 = (void *)*((void *)v13 + 80);
    *((void *)v13 + 80) = v29;

    v31 = [MEMORY[0x263F825C8] whiteColor];
    [*((id *)v13 + 80) setBackgroundColor:v31];

    [*((id *)v13 + 80) setUserInteractionEnabled:0];
    [v13 addSubview:*((void *)v13 + 80)];
    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    v33 = (void *)*((void *)v13 + 82);
    *((void *)v13 + 82) = v32;

    v34 = [MEMORY[0x263F825C8] whiteColor];
    [*((id *)v13 + 82) setBackgroundColor:v34];

    [*((id *)v13 + 82) setAlpha:0.5];
    [*((id *)v13 + 82) setUserInteractionEnabled:0];
    [v13 addSubview:*((void *)v13 + 82)];
    v35 = objc_opt_class();
    if (v35)
    {
      [v35 shutterButtonSpecForLayoutStyle:a5];
    }
    else
    {
      uint64_t v140 = 0;
      long long v138 = 0u;
      long long v139 = 0u;
    }
    long long v36 = v138;
    long long v37 = v139;
    *((void *)v13 + 123) = v140;
    *(_OWORD *)(v13 + 952) = v36;
    *(_OWORD *)(v13 + 968) = v37;
    double v38 = CAMPixelWidthForView(v13);
    CAMShutterButtonSpecMake((double *)&v138, 55.0, 3.0 - v38, 0.0, 0.0, 2.0);
    long long v39 = v138;
    long long v40 = v139;
    *((void *)v13 + 128) = v140;
    *((_OWORD *)v13 + 62) = v39;
    *((_OWORD *)v13 + 63) = v40;
    double v41 = CAMPixelWidthForView(v13);
    CAMShutterButtonSpecMake((double *)&v138, 40.0, v41 + 1.0, 0.0, 0.0, 2.0);
    long long v42 = v138;
    long long v43 = v139;
    *((void *)v13 + 138) = v140;
    *((_OWORD *)v13 + 67) = v42;
    *((_OWORD *)v13 + 68) = v43;
    double v44 = CAMPixelWidthForView(v13);
    CAMShutterButtonSpecMake((double *)&v138, 55.0, 3.0 - v44, 0.0, 0.0, 2.0);
    long long v45 = v138;
    long long v46 = v139;
    *((void *)v13 + 133) = v140;
    *(_OWORD *)(v13 + 1032) = v45;
    *(_OWORD *)(v13 + 1048) = v46;
    uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    v48 = (void *)*((void *)v13 + 69);
    *((void *)v13 + 69) = v47;

    [*((id *)v13 + 69) setUserInteractionEnabled:0];
    id v49 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v50 = [v49 CGColor];
    v51 = [*((id *)v13 + 69) layer];
    [v51 setBorderColor:v50];

    [v13 addSubview:*((void *)v13 + 69)];
    uint64_t v52 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    v53 = (void *)*((void *)v13 + 73);
    *((void *)v13 + 73) = v52;

    v54 = [MEMORY[0x263F825C8] clearColor];
    [*((id *)v13 + 73) setBackgroundColor:v54];

    id v55 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v56 = [v55 CGColor];
    v57 = [*((id *)v13 + 73) layer];
    [v57 setBorderColor:v56];

    [*((id *)v13 + 73) setUserInteractionEnabled:0];
    [*((id *)v13 + 73) setAlpha:0.0];
    [v13 addSubview:*((void *)v13 + 73)];
    uint64_t v58 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    v59 = (void *)*((void *)v13 + 76);
    *((void *)v13 + 76) = v58;

    v60 = [MEMORY[0x263F825C8] clearColor];
    [*((id *)v13 + 76) setBackgroundColor:v60];

    id v61 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v62 = [v61 CGColor];
    v63 = [*((id *)v13 + 76) layer];
    [v63 setBorderColor:v62];

    [*((id *)v13 + 76) setUserInteractionEnabled:0];
    [*((id *)v13 + 76) setAlpha:0.0];
    [v13 addSubview:*((void *)v13 + 76)];
    v64 = (void *)MEMORY[0x263F827E8];
    v65 = [MEMORY[0x263F82818] configurationWithScale:2];
    v134 = [v64 systemImageNamed:@"lock.fill" withConfiguration:v65];

    uint64_t v66 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v134];
    v67 = (void *)*((void *)v13 + 75);
    *((void *)v13 + 75) = v66;

    v68 = [MEMORY[0x263F825C8] whiteColor];
    [*((id *)v13 + 75) setTintColor:v68];

    [*((id *)v13 + 75) setAlpha:0.0];
    [v13 addSubview:*((void *)v13 + 75)];
    v69 = (void *)MEMORY[0x263F827E8];
    v70 = [MEMORY[0x263F82818] configurationWithScale:3];
    v133 = [v69 systemImageNamed:@"pause.fill" withConfiguration:v70];

    uint64_t v71 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v133];
    v72 = (void *)*((void *)v13 + 78);
    *((void *)v13 + 78) = v71;

    v73 = [MEMORY[0x263F825C8] whiteColor];
    [*((id *)v13 + 78) setTintColor:v73];

    [*((id *)v13 + 78) setAlpha:0.0];
    [v13 addSubview:*((void *)v13 + 78)];
    uint64_t v74 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    v75 = (void *)*((void *)v13 + 79);
    *((void *)v13 + 79) = v74;

    v76 = CAMRedColor();
    [*((id *)v13 + 79) setBackgroundColor:v76];

    [*((id *)v13 + 79) setUserInteractionEnabled:0];
    [v13 addSubview:*((void *)v13 + 79)];
    uint64_t v77 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
    v78 = (void *)*((void *)v13 + 84);
    *((void *)v13 + 84) = v77;

    [*((id *)v13 + 84) setUserInteractionEnabled:0];
    v79 = [MEMORY[0x263F825C8] whiteColor];
    [*((id *)v13 + 84) setTextColor:v79];

    [*((id *)v13 + 84) setTextAlignment:1];
    v80 = [MEMORY[0x263F825C8] clearColor];
    [*((id *)v13 + 84) setBackgroundColor:v80];

    v81 = +[CAMFont cameraMonospacedFontOfSize:20.0];
    [*((id *)v13 + 84) setFont:v81];

    [*((id *)v13 + 84) setAlpha:0.0];
    [v13 _updateCounterLabelText];
    [v13 addSubview:*((void *)v13 + 84)];
    [v13 bringSubviewToFront:*((void *)v13 + 68)];
    v82 = [[CAMDynamicShutterGestureRecognizer alloc] initWithTarget:v13 action:sel__handlePress_];
    v83 = (void *)*((void *)v13 + 88);
    *((void *)v13 + 88) = v82;

    [*((id *)v13 + 88) setMinimumPressDuration:0.0];
    [*((id *)v13 + 88) setCancelsTouchesInView:0];
    [*((id *)v13 + 88) setDelaysTouchesEnded:0];
    [*((id *)v13 + 88) setDelegate:v13];
    [v13 addGestureRecognizer:*((void *)v13 + 88)];
    v84 = +[CAMCaptureCapabilities capabilities];
    LODWORD(v69) = [v84 allowHaptics];

    if (v69)
    {
      v85 = objc_alloc_init(CAMFeedbackController);
      v86 = (void *)*((void *)v13 + 90);
      *((void *)v13 + 90) = v85;
    }
    *((void *)v13 + 87) = 0;
    v87 = [[CAMTrackingSpring alloc] initWithTension:240.0 friction:30.0 epsilon:CAMPixelWidthForView(v13)];
    v88 = (void *)*((void *)v13 + 97);
    *((void *)v13 + 97) = v87;

    v89 = [[CAMSpring alloc] initWithTension:240.0 friction:30.0 epsilon:CAMPixelWidthForView(v13)];
    v90 = (void *)*((void *)v13 + 98);
    *((void *)v13 + 98) = v89;

    v91 = [[CAMSpring alloc] initWithTension:240.0 friction:30.0 epsilon:0.001 boundedBetween:0.0 and:1.0];
    v92 = (void *)*((void *)v13 + 99);
    *((void *)v13 + 99) = v91;

    v93 = [[CAMSpring alloc] initWithTension:400.0 friction:40.0 epsilon:0.001 boundedBetween:0.0 and:1.0];
    v94 = (void *)*((void *)v13 + 100);
    *((void *)v13 + 100) = v93;

    v95 = [[CAMSpring alloc] initWithTension:240.0 friction:30.0 epsilon:CAMPixelWidthForView(v13)];
    v96 = (void *)*((void *)v13 + 101);
    *((void *)v13 + 101) = v95;

    v97 = [[CAMSpring alloc] initWithTension:240.0 friction:30.0 epsilon:0.001 boundedBetween:2.0 and:6.0];
    v98 = (void *)*((void *)v13 + 102);
    *((void *)v13 + 102) = v97;

    v99 = [[CAMSpring alloc] initWithTension:400.0 friction:40.0 epsilon:0.001 boundedBetween:0.0 and:1.0];
    v100 = (void *)*((void *)v13 + 103);
    *((void *)v13 + 103) = v99;

    v101 = [[CAMSpring alloc] initWithTension:400.0 friction:40.0 epsilon:0.001 boundedBetween:0.0 and:1.0];
    v102 = (void *)*((void *)v13 + 104);
    *((void *)v13 + 104) = v101;

    v103 = [[CAMSpring alloc] initWithTension:400.0 friction:40.0 epsilon:0.001 boundedBetween:0.0 and:1.0];
    v104 = (void *)*((void *)v13 + 105);
    *((void *)v13 + 105) = v103;

    v105 = [[CAMSpring alloc] initWithTension:400.0 friction:40.0 epsilon:0.001 boundedBetween:0.0 and:1.0];
    v106 = (void *)*((void *)v13 + 106);
    *((void *)v13 + 106) = v105;

    v107 = [[CAMSpring alloc] initWithTension:400.0 friction:40.0 epsilon:0.001 boundedBetween:0.0 and:1.0];
    v108 = (void *)*((void *)v13 + 107);
    *((void *)v13 + 107) = v107;

    v109 = [[CAMSpring alloc] initWithTension:400.0 friction:40.0 epsilon:0.001 boundedBetween:0.0 and:1.0];
    v110 = (void *)*((void *)v13 + 108);
    *((void *)v13 + 108) = v109;

    v132 = [v13 _dragHandleOffsetSpring];
    v145[0] = v132;
    v131 = [v13 _dragHandleWidthSpring];
    v145[1] = v131;
    v130 = [v13 _dragHandleColorIsWhiteSpring];
    v145[2] = v130;
    v111 = [v13 _dragHandleAlphaSpring];
    v145[3] = v111;
    v112 = [v13 _innerShapeWidthSpring];
    v145[4] = v112;
    v113 = [v13 _innerShapePowerSpring];
    v145[5] = v113;
    v114 = [v13 _innerShapeAlphaSpring];
    v145[6] = v114;
    v115 = [v13 _innerShapeColorIsRedSpring];
    v145[7] = v115;
    v116 = [v13 _drawLockUISpring];
    v145[8] = v116;
    v117 = [v13 _expandLockRingSpring];
    v145[9] = v117;
    v118 = [v13 _drawPauseResumeUISpring];
    v145[10] = v118;
    v119 = [v13 _pausedDuringVideoSpring];
    v145[11] = v119;
    uint64_t v120 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:12];
    v121 = (void *)*((void *)v13 + 96);
    *((void *)v13 + 96) = v120;

    [*((id *)v13 + 98) resetToValue:45.0];
    [*((id *)v13 + 100) resetToValue:1.0];
    v122 = (void *)*((void *)v13 + 101);
    [v13 _shutterButtonSpec];
    [v122 resetToValue:CAMShutterButtonSpecGetInnerCircleDiameter(v137)];
    [*((id *)v13 + 102) resetToValue:2.0];
    [*((id *)v13 + 104) resetToValue:1.0];
    *((void *)v13 + 109) = 0x3FE199999999999ALL;
    *((void *)v13 + 110) = 0x3FE199999999999ALL;
    v123 = +[CAMCaptureCapabilities capabilities];
    LODWORD(v113) = [v123 isTrueVideoSupported];

    if (v113)
    {
      CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMLongPressVideoDurationMS", @"com.apple.camera", 0);
      double v125 = (double)AppIntegerValue / 1000.0;
      if (AppIntegerValue <= 0) {
        double v125 = 0.416;
      }
      *((double *)v13 + 109) = v125;
      CFIndex v126 = CFPreferencesGetAppIntegerValue(@"CAMExternalLongPressVideoDurationMS", @"com.apple.camera", 0);
      double v127 = (double)v126 / 1000.0;
      if (v126 <= 0) {
        double v127 = 0.416;
      }
      *((double *)v13 + 110) = v127;
    }
    v128 = v13;

    objc_destroyWeak(&v142);
    objc_destroyWeak(&location);
  }

  return (CAMDynamicShutterControl *)v13;
}

void __73__CAMDynamicShutterControl_initWithMetalDevice_commandQueue_layoutStyle___block_invoke(uint64_t a1, void *a2)
{
  [a2 targetTimestamp];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateForTargetTimestamp:v4];
}

- (void)dealloc
{
  [(CADisplayLink *)self->__displayLink invalidate];
  displayLink = self->__displayLink;
  self->__displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMDynamicShutterControl;
  [(CAMDynamicShutterControl *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToTopLevelSuperview = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidShortPress = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanStartOnTouchDown = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldBeginGesture = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToGesturesDidBegin = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToGesturesDidEnd = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToGesturesDidCancel = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidStart = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidStartWithGesture = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidStartZoomGesture = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeRelativeZoomProgress = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidStop = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPressLockButton = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPressPauseResumeButton = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPresentCounter = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidDismissCounter = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToTouchAttemptedWhileDisabled = objc_opt_respondsToSelector() & 1;
  }
}

- (BOOL)_canDragCounter
{
  [(CAMDynamicShutterControl *)self settings];
  if (v4 == 1) {
    return ![(CAMDynamicShutterControl *)self _isStartStopShutterState:[(CAMDynamicShutterControl *)self _shutterState]];
  }
  else {
    return 0;
  }
}

- (BOOL)_canDragStartStop
{
  [(CAMDynamicShutterControl *)self settings];
  return v4 == 1 && [(CAMDynamicShutterControl *)self _shutterState] != 1;
}

- (BOOL)_isStartStopShutterState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 4;
}

- (BOOL)_isTrackingHandleState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 4;
}

- (BOOL)_isValidChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  BOOL result = 0;
  switch(a3)
  {
    case 0:
      return 1;
    case 2:
    case 4:
      BOOL v5 = a4 == 3;
      goto LABEL_8;
    case 5:
      BOOL v5 = a4 == 4 || (a4 & 0xFFFFFFFFFFFFFFFELL) == 2;
LABEL_8:
      BOOL result = v5;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_shouldStartTrackingHandle
{
  char v3 = [(CAMDynamicShutterControl *)self _isTrackingHandleState:[(CAMDynamicShutterControl *)self _dragHandleState]];
  return ([(CAMDynamicShutterControl *)self _shutterState] != 2) & ~v3;
}

- (void)_resetShutterState
{
  if (self->__shutterState)
  {
    self->__shutterState = 0;
    if (self->_delegateFlags.respondsToGesturesDidCancel)
    {
      char v3 = [(CAMDynamicShutterControl *)self delegate];
      [v3 dynamicShutterControlGesturesDidCancel:self];
    }
    [(CAMDynamicShutterControl *)self _updateSpringTargetsAnimated:0];
    [(CAMDynamicShutterControl *)self _updateOuterAndInnerLayersAnimated:0];
  }
}

- (void)_setShutterState:(int64_t)a3
{
  int64_t shutterState = self->__shutterState;
  if (shutterState != a3)
  {
    if ([(CAMDynamicShutterControl *)self _isValidChangeFromState:shutterState toState:a3])
    {
      int64_t v6 = self->__shutterState;
      self->__int64_t shutterState = a3;
      switch(a3)
      {
        case 0:
          if ([(CAMDynamicShutterControl *)self _isStartStopShutterState:v6])
          {
            if (self->_delegateFlags.respondsToDidStop)
            {
              id v7 = [(CAMDynamicShutterControl *)self delegate];
              [v7 dynamicShutterControlDidStop:self];
              goto LABEL_21;
            }
          }
          else if (v6 == 1 && self->_delegateFlags.respondsToDidDismissCounter)
          {
            id v7 = [(CAMDynamicShutterControl *)self delegate];
            [v7 dynamicShutterControlDidDismissCounter:self];
            goto LABEL_21;
          }
          goto LABEL_22;
        case 1:
          if (v6)
          {
            if ([(CAMDynamicShutterControl *)self _isStartStopShutterState:v6])
            {
              id v7 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
                -[CAMDynamicShutterControl _setShutterState:](v7);
              }
              goto LABEL_21;
            }
          }
          else if (self->_delegateFlags.respondsToDidPresentCounter)
          {
            id v7 = [(CAMDynamicShutterControl *)self delegate];
            [v7 dynamicShutterControlDidPresentCounter:self];
            goto LABEL_21;
          }
          goto LABEL_22;
        case 2:
        case 3:
        case 5:
          goto LABEL_15;
        case 4:
          double v9 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
          [v9 setTension:100.0];

          double v10 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
          [v10 setFriction:10.0];

          double v11 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
          [v11 setVelocity:500.0];

          v12 = [(CAMDynamicShutterControl *)self _feedbackController];
          [v12 performDiscreteFeedback:0];

LABEL_15:
          if (v6 == 1)
          {
            id v7 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
              -[CAMDynamicShutterControl _setShutterState:](v7);
            }
            goto LABEL_21;
          }
          if (v6) {
            goto LABEL_22;
          }
          if (self->_delegateFlags.respondsToDidStartWithGesture)
          {
            int64_t v13 = [(CAMDynamicShutterControl *)self _startGestureForShutterState:a3];
            id v14 = [(CAMDynamicShutterControl *)self delegate];
            [v14 dynamicShutterControlDidStart:self withGesture:v13];

            goto LABEL_22;
          }
          if (self->_delegateFlags.respondsToDidStart)
          {
            id v7 = [(CAMDynamicShutterControl *)self delegate];
            [v7 dynamicShutterControlDidStart:self];
LABEL_21:
          }
LABEL_22:
          [(CAMDynamicShutterControl *)self _updateSpringTargetsAnimated:0];
          [(CAMDynamicShutterControl *)self _updateOuterAndInnerLayersAnimated:0];
          break;
        default:
          goto LABEL_22;
      }
    }
    else
    {
      double v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: Invalid state change", v15, 2u);
      }
    }
  }
}

- (int64_t)_startGestureForShutterState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2) {
    return 0;
  }
  else {
    return qword_209C7BBA8[a3 - 2];
  }
}

- (void)_setDragHandleState:(int64_t)a3
{
}

- (void)_setDragHandleState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->__dragHandleState != a3)
  {
    self->__dragHandleState = a3;
    [(CAMDynamicShutterControl *)self _updateSpringTargetsAnimated:a4];
    if (!a4)
    {
      int64_t v6 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
      [v6 converge];

      id v7 = [(CAMDynamicShutterControl *)self _dragHandleWidthSpring];
      [v7 converge];

      double v8 = [(CAMDynamicShutterControl *)self _dragHandleColorIsWhiteSpring];
      [v8 converge];

      id v9 = [(CAMDynamicShutterControl *)self _dragHandleAlphaSpring];
      [v9 converge];
    }
  }
}

- (void)_setInnerShapeState:(int64_t)a3
{
}

- (void)_setInnerShapeState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->__innerShapeState != a3)
  {
    self->__innerShapeState = a3;
    [(CAMDynamicShutterControl *)self _updateSpringTargetsAnimated:a4];
    if (!a4)
    {
      int64_t v6 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
      [v6 converge];

      id v7 = [(CAMDynamicShutterControl *)self _innerShapePowerSpring];
      [v7 converge];

      double v8 = [(CAMDynamicShutterControl *)self _innerShapeColorIsRedSpring];
      [v8 converge];

      id v9 = [(CAMDynamicShutterControl *)self _innerShapeAlphaSpring];
      [v9 converge];
    }
  }
}

- (void)_setExternalShutterPressed:(BOOL)a3
{
  if (self->__externalShutterPressed != a3)
  {
    self->__externalShutterPressed = a3;
    [(CAMDynamicShutterControl *)self _updateSpringTargetsAnimated:0];
  }
}

- (void)cancelZoom
{
  [(CAMDynamicShutterControl *)self setZooming:0];
  [(CAMDynamicShutterControl *)self set_didCancelZoomForCurrentGesture:1];
}

- (void)resetAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = @"NO";
    if (v3) {
      int64_t v6 = @"YES";
    }
    id v7 = v6;
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: ResetAnimated: %{public}@", buf, 0xCu);
  }
  if ([(CAMDynamicShutterControl *)self _isActiveTouchSequencePhase:[(CAMDynamicShutterControl *)self _touchSequencePhase]])
  {
    [(CAMDynamicShutterControl *)self _cancelTouchSequenceForReset:1];
  }
  [(CAMDynamicShutterControl *)self _setExternalShutterPressed:0];
  [(CAMDynamicShutterControl *)self _setExternalLockButtonPressed:0];
  [(CAMDynamicShutterControl *)self _setDragHandleState:0 animated:v3];
  [(CAMDynamicShutterControl *)self _setInnerShapeState:0 animated:v3];
  [(CAMDynamicShutterControl *)self _resetShutterState];
  double v8 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
  [v8 removeSecondaryTargetAnimated:v3];

  if (!v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = [(CAMDynamicShutterControl *)self _springs];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v13++) converge];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  id v14 = [(CAMDynamicShutterControl *)self _displayLink];
  [v14 setPaused:0];
}

- (BOOL)isShutterStateDefault
{
  return [(CAMDynamicShutterControl *)self _shutterState] == 0;
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
    [(CAMDynamicShutterControl *)self setNeedsLayout];
    if (v4)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __52__CAMDynamicShutterControl_setOrientation_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __52__CAMDynamicShutterControl_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (CGRect)frameForAlignmentRect:(CGRect)a3 availableWidth:(double)a4
{
  double v5 = a3.origin.y + -16.0;
  double v6 = a3.size.height + 16.0 + 16.0;
  double v7 = 0.0;
  result.size.height = v6;
  result.size.width = a4;
  result.origin.y = v5;
  result.origin.x = v7;
  return result;
}

- (void)setLockButtonCenterRightInset:(double)a3
{
  if (self->_lockButtonCenterRightInset != a3)
  {
    self->_lockButtonCenterRightInset = a3;
    [(CAMDynamicShutterControl *)self _updateSpringTargetsAnimated:0];
  }
}

- (CGSize)intrinsicContentSize
{
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  double v3 = v5;
  double v4 = v6;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)_updateCenterButton
{
  double v3 = [(CAMDynamicShutterControl *)self _pausedDuringVideoSpring];
  [v3 value];

  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  [(CAMDynamicShutterControl *)self _pauseResumeButtonSpec];
  CEKInterpolateClamped();
  double v5 = v4;
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  [(CAMDynamicShutterControl *)self _pauseResumeButtonSpec];
  CEKInterpolateClamped();
  double v7 = v6;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(CAMDynamicShutterControl *)self _centerOuterView];
  objc_msgSend(v12, "setCenter:", v9, v11);

  uint64_t v13 = [(CAMDynamicShutterControl *)self _centerOuterView];
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, v5, v5);

  double v14 = v5 * 0.5;
  long long v15 = [(CAMDynamicShutterControl *)self _centerOuterView];
  long long v16 = [v15 layer];
  [v16 setCornerRadius:v5 * 0.5];

  long long v17 = [(CAMDynamicShutterControl *)self _centerOuterView];
  long long v18 = [v17 layer];
  [v18 setBorderWidth:v7];

  v19 = [(CAMDynamicShutterControl *)self _centerOuterImageView];
  objc_msgSend(v19, "setCenter:", v9, v11);

  v20 = [(CAMDynamicShutterControl *)self _centerOuterImageView];
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, v5, v5);

  v21 = [(CAMDynamicShutterControl *)self _centerTimelapseOuterView];
  objc_msgSend(v21, "setCenter:", v9, v11);

  uint64_t v22 = [(CAMDynamicShutterControl *)self _centerTimelapseOuterView];
  objc_msgSend(v22, "setBounds:", 0.0, 0.0, v5, v5);

  v23 = [(CAMDynamicShutterControl *)self _centerOuterLegibilityView];
  objc_msgSend(v23, "setCenter:", v9, v11);

  UIRectInset();
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  uint64_t v32 = [(CAMDynamicShutterControl *)self _centerOuterLegibilityView];
  objc_msgSend(v32, "setBounds:", v25, v27, v29, v31);

  v33 = [(CAMDynamicShutterControl *)self _centerOuterLegibilityView];
  v34 = [v33 layer];
  [v34 setCornerRadius:v14 + 1.0];
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)CAMDynamicShutterControl;
  [(CAMDynamicShutterControl *)&v30 layoutSubviews];
  [(CAMDynamicShutterControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMDynamicShutterControl *)self _metalView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(CAMDynamicShutterControl *)self _lockButtonCenter];
  double v13 = v12;
  double v15 = v14;
  long long v16 = [(CAMDynamicShutterControl *)self _lockButtonOuterView];
  objc_msgSend(v16, "setCenter:", v13, v15);

  long long v17 = [(CAMDynamicShutterControl *)self _lockButtonOuterLegibilityView];
  objc_msgSend(v17, "setCenter:", v13, v15);

  long long v18 = [(CAMDynamicShutterControl *)self _videoLockImageView];
  objc_msgSend(v18, "setCenter:", v13, v15);

  [(CAMDynamicShutterControl *)self _updateLockGlyphTransformAndAlpha];
  [(CAMDynamicShutterControl *)self _updateViewsFromCurrentState];
  v19 = [(CAMDynamicShutterControl *)self _centerOuterView];
  [v19 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v28 = [(CAMDynamicShutterControl *)self _counterLabel];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  double v29 = [(CAMDynamicShutterControl *)self _counterLabel];
  +[CAMView rotateView:v29 toInterfaceOrientation:[(CAMDynamicShutterControl *)self orientation] animated:0];
}

- (BOOL)_isPastStartStopDragThreshold
{
  v2 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
  [v2 value];
  BOOL v4 = v3 >= 60.0;

  return v4;
}

- (BOOL)_isPastCounterDragThreshold
{
  v2 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
  [v2 value];
  BOOL v4 = v3 <= -60.0;

  return v4;
}

- (double)_dragHandleXPosition
{
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v4 = v3;
  double v5 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
  [v5 value];
  double v7 = v4 + v6;

  return v7;
}

+ (CAMShutterButtonSpec)shutterButtonSpecForLayoutStyle:(SEL)a3
{
  double v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = v7;

  retstr->interRingSpacing = 0.0;
  *(_OWORD *)&retstr->outerRingDiameter = 0u;
  *(_OWORD *)&retstr->stopSquareSideLength = 0u;
  if ((unint64_t)(a4 - 1) >= 3)
  {
    double v10 = 1.0 / v8;
    if (a4)
    {
      if (a4 != 4) {
        return result;
      }
      double v11 = 4.0 - v10;
      double v12 = v10 + 2.0;
      double v13 = 72.0;
      double v14 = 25.0;
      double v15 = 5.0;
    }
    else
    {
      double v11 = 4.0 - v10;
      double v13 = 66.0;
      double v14 = 28.0;
      double v15 = 5.0;
      double v12 = 2.0;
    }
    CAMShutterButtonSpecMake((double *)v17, v13, v11, v14, v15, v12);
  }
  else
  {
    CAMShutterButtonSpecForLayoutStyle(a4, (uint64_t)v17);
  }
  long long v16 = v17[1];
  *(_OWORD *)&retstr->outerRingDiameter = v17[0];
  *(_OWORD *)&retstr->stopSquareSideLength = v16;
  retstr->interRingSpacing = v18;
  return result;
}

- (CGPoint)_shutterButtonCenter
{
  [(CAMDynamicShutterControl *)self bounds];
  UIRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)_shutterButtonFrame
{
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_isPointWithinShutterButtonTouchArea:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CAMDynamicShutterControl *)self _shutterButtonFrame];
  UIRectInset();
  CGFloat v9 = x;
  CGFloat v10 = y;
  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (double)_absoluteShutterToBottomDistance
{
  double v3 = [(CAMDynamicShutterControl *)self superview];
  if (self->_delegateFlags.respondsToTopLevelSuperview)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v5 = [WeakRetained dynamicShutterControlTopLevelSuperview:self];

    double v3 = (void *)v5;
  }
  [v3 safeAreaInsets];
  double v7 = v6;
  [v3 bounds];
  double v9 = v8;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  -[CAMDynamicShutterControl convertPoint:toView:](self, "convertPoint:toView:", v3);
  double v11 = v9 - v10 - v7;

  return v11;
}

- (CGPoint)_lockButtonCenter
{
  [(CAMDynamicShutterControl *)self bounds];
  double v4 = v3;
  [(CAMDynamicShutterControl *)self lockButtonCenterRightInset];
  double v6 = v4 - v5;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v8 = v6;
  result.CGFloat y = v7;
  result.CGFloat x = v8;
  return result;
}

- (CGRect)_lockButtonFrame
{
  [(CAMDynamicShutterControl *)self _lockButtonActiveSpec];
  [(CAMDynamicShutterControl *)self _lockButtonActiveSpec];
  [(CAMDynamicShutterControl *)self _lockButtonCenter];
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)_isPointWithinLockRingTouchArea:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CAMDynamicShutterControl *)self _lockButtonFrame];
  UIRectInset();
  CGFloat v9 = x;
  CGFloat v10 = y;
  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (BOOL)_isHandleWithinLockRing
{
  [(CAMDynamicShutterControl *)self _dragHandleXPosition];
  double v4 = v3;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  return [(CAMDynamicShutterControl *)self _isPointWithinLockRingTouchArea:v4];
}

- (CGPoint)_pauseResumeButtonCenter
{
  [(CAMDynamicShutterControl *)self pauseResumeButtonCenterLeftInset];
  double v4 = v3;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v6 = v4;
  result.CGFloat y = v5;
  result.CGFloat x = v6;
  return result;
}

- (CGRect)_pauseResumeButtonFrame
{
  [(CAMDynamicShutterControl *)self _pauseResumeButtonSpec];
  [(CAMDynamicShutterControl *)self _pauseResumeButtonSpec];
  [(CAMDynamicShutterControl *)self _pauseResumeButtonCenter];
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)_isPointWithinPauseResumeRingTouchArea:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (([(CAMDynamicShutterControl *)self privateSettings] & 1) == 0) {
    return 0;
  }
  [(CAMDynamicShutterControl *)self _pauseResumeButtonFrame];
  UIRectInset();
  CGFloat v11 = x;
  CGFloat v12 = y;
  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v11);
}

- ($E50CC26D34D0158E20D4445E4757B7F2)_touchForPoint:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  BOOL v8 = [(CAMDynamicShutterControl *)self _isHandleWithinLockRing];
  retstr->var1 = 0.0;
  *(void *)&retstr->var2 = 0;
  retstr->var0.double x = x;
  retstr->var0.double y = y;
  retstr->var1 = CFAbsoluteTimeGetCurrent();
  retstr->var2 = -[CAMDynamicShutterControl _isPointWithinShutterButtonTouchArea:](self, "_isPointWithinShutterButtonTouchArea:", x, y);
  retstr->var3 = -[CAMDynamicShutterControl _isPointWithinLockRingTouchArea:](self, "_isPointWithinLockRingTouchArea:", x, y)&& v8;
  CGRect result = ($E50CC26D34D0158E20D4445E4757B7F2 *)-[CAMDynamicShutterControl _isPointWithinPauseResumeRingTouchArea:](self, "_isPointWithinPauseResumeRingTouchArea:", x, y);
  retstr->var4 = (char)result;
  return result;
}

- (BOOL)_shouldReceiveTouch:(id *)a3
{
  int64_t v4 = [(CAMDynamicShutterControl *)self _shutterState];
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4) {
      return 0;
    }
    return a3->var2;
  }
  else
  {
    if (a3->var2 || a3->var3) {
      return 1;
    }
    return a3->var4;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)CAMDynamicShutterControl;
  uint64_t v7 = -[CAMDynamicShutterControl hitTest:withEvent:](&v14, sel_hitTest_withEvent_, a4);
  [(CAMDynamicShutterControl *)self bounds];
  v16.double x = x;
  v16.double y = y;
  if (CGRectContainsPoint(v17, v16) && ([(CAMDynamicShutterControl *)self isEnabled] & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:", x, y);
    v11[0] = v12;
    v11[1] = v13;
    if ([(CAMDynamicShutterControl *)self _shouldReceiveTouch:v11]
      && self->_delegateFlags.respondsToTouchAttemptedWhileDisabled)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained shutterControlTouchAttemptedWhileDisabled:self];
    }
    CGFloat v9 = self;

    uint64_t v7 = v9;
  }
  return v7;
}

- (void)_setFirstTouch:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3->var2) {
    double v5 = @"WithinShutter";
  }
  else {
    double v5 = &stru_26BD78BA0;
  }
  double v6 = v5;
  if (a3->var3) {
    uint64_t v7 = @"WithinLockButton";
  }
  else {
    uint64_t v7 = &stru_26BD78BA0;
  }
  BOOL v8 = v7;
  if (a3->var4) {
    CGFloat v9 = @"WithinPauseResumeButton";
  }
  else {
    CGFloat v9 = &stru_26BD78BA0;
  }
  CGFloat v10 = v9;
  CGFloat v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat x = a3->var0.x;
    CGFloat y = a3->var0.y;
    int v15 = 134219010;
    CGFloat v16 = x;
    __int16 v17 = 2048;
    CGFloat v18 = y;
    __int16 v19 = 2114;
    double v20 = v6;
    __int16 v21 = 2114;
    double v22 = v8;
    __int16 v23 = 2114;
    double v24 = v10;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: Updating first touch [(%.02f,%.02f) %{public}@ %{public}@ %{public}@]", (uint8_t *)&v15, 0x34u);
  }

  long long v14 = *(_OWORD *)&a3->var1;
  self->$2BE7AFF22295DED6A45A0E44EF7D16DF::point = a3->var0;
  *(_OWORD *)&self->$2BE7AFF22295DED6A45A0E44EF7D16DF::time = v14;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  [a3 locationInView:self];
  long long v8 = 0u;
  long long v9 = 0u;
  -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
  v7[0] = v8;
  v7[1] = v9;
  if (![(CAMDynamicShutterControl *)self _shouldReceiveTouch:v7]
    || ![(CAMDynamicShutterControl *)self isEnabled])
  {
    return 0;
  }
  if (!self->_delegateFlags.respondsToShouldBeginGesture) {
    return 1;
  }
  int64_t v4 = [(CAMDynamicShutterControl *)self delegate];
  char v5 = [v4 dynamicShutterControlShouldBeginGesture:self];

  return v5;
}

- (void)_handlePress:(id)a3
{
  id v4 = a3;
  if ([(CAMDynamicShutterControl *)self _isExternalShutterPressed]
    || [(CAMDynamicShutterControl *)self _isExternalLockButtonPressed])
  {
    char v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: Ignoring screen touch, handling external press", buf, 2u);
    }
  }
  else
  {
    [v4 locationInView:self];
    *(_OWORD *)buf = 0u;
    long long v13 = 0u;
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    switch([v4 state])
    {
      case 1:
        v11[0] = *(_OWORD *)buf;
        v11[1] = v13;
        [(CAMDynamicShutterControl *)self _setFirstTouch:v11];
        uint64_t v7 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v9 = 0;
          _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganScreen", v9, 2u);
        }

        *(_OWORD *)long long v9 = *(_OWORD *)buf;
        long long v10 = v13;
        [(CAMDynamicShutterControl *)self _touchSequenceBegan:v9];
        break;
      case 2:
        *(_OWORD *)long long v9 = *(_OWORD *)buf;
        long long v10 = v13;
        [(CAMDynamicShutterControl *)self _touchSequenceChanged:v9];
        break;
      case 3:
      case 5:
        *(_OWORD *)long long v9 = *(_OWORD *)buf;
        long long v10 = v13;
        [(CAMDynamicShutterControl *)self _touchSequenceEnded:v9 forReset:0];
        double v6 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v9 = 0;
          _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedScreen", v9, 2u);
        }

        break;
      case 4:
        if ([(CAMDynamicShutterControl *)self _ignoreNextCancelledGesture]) {
          [(CAMDynamicShutterControl *)self _setIgnoreNextCancelledGesture:0];
        }
        else {
          [(CAMDynamicShutterControl *)self _touchSequenceCancelledForReset:0];
        }
        break;
      default:
        break;
    }
    v8[0] = *(_OWORD *)buf;
    v8[1] = v13;
    [(CAMDynamicShutterControl *)self _setMostRecentTouch:v8];
  }
}

- (BOOL)_shouldStartStopOnTouchDown
{
  [(CAMDynamicShutterControl *)self settings];
  int64_t v3 = [(CAMDynamicShutterControl *)self _shutterState];
  [(CAMDynamicShutterControl *)self settings];
  if (self->_delegateFlags.respondsToCanStartOnTouchDown)
  {
    id v4 = [(CAMDynamicShutterControl *)self delegate];
    char v5 = [v4 dynamicShutterControlCanStartOnTouchDown:self];
  }
  else
  {
    char v5 = 1;
  }
  if (v10 == 1 && v3 == 0 && v9 == 0) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldShortPressOnTouchDown
{
  [(CAMDynamicShutterControl *)self settings];
  int64_t v3 = v7 | [(CAMDynamicShutterControl *)self _shutterState];
  [(CAMDynamicShutterControl *)self settings];
  BOOL v4 = ![(CAMDynamicShutterControl *)self _isDraggingEnabled];
  if (v6) {
    LOBYTE(v4) = 0;
  }
  return !v3 && v4;
}

- (BOOL)_shouldShortPressOnTouchUp
{
  [(CAMDynamicShutterControl *)self settings];
  int64_t v3 = v8 | [(CAMDynamicShutterControl *)self _shutterState];
  [(CAMDynamicShutterControl *)self settings];
  BOOL v4 = [(CAMDynamicShutterControl *)self _isDraggingEnabled];
  if (v7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4;
  }
  return !v3 && v5;
}

- (void)_updateStateForTouchPoint:(CGPoint)a3
{
  double x = a3.x;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v6 = v5;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v8 = v7;
  [(CAMDynamicShutterControl *)self _lockButtonCenter];
  double v10 = v9;
  int64_t v11 = [(CAMDynamicShutterControl *)self _dragHandleState];
  double v12 = vabdd_f64(x, v8);
  double v13 = v10 + -30.0;
  switch(v11)
  {
    case 2:
      double v13 = 60.0;
      if (v12 < 60.0) {
        goto LABEL_7;
      }
      break;
    case 3:
      double v14 = x - v6;
      if (v14 < 0.0) {
        LOBYTE(v15) = 0;
      }
      else {
        int v15 = ![(CAMDynamicShutterControl *)self _canDragStartStop];
      }
      if (v14 >= 0.0) {
        LOBYTE(v18) = 0;
      }
      else {
        int v18 = ![(CAMDynamicShutterControl *)self _canDragCounter];
      }
      double v13 = 60.0;
      if (v12 < 60.0) {
        char v19 = 1;
      }
      else {
        char v19 = v15;
      }
      if ((v19 & 1) == 0 && (v18 & 1) == 0)
      {
        if (v14 < 0.0) {
          uint64_t v20 = 2;
        }
        else {
          uint64_t v20 = 4;
        }
        if (v14 >= 0.0) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = 2;
        }
        if (v14 < 0.0) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = 3;
        }
        [(CAMDynamicShutterControl *)self _setDragHandleState:v20 animated:1];
        [(CAMDynamicShutterControl *)self _setInnerShapeState:v21 animated:1];
        [(CAMDynamicShutterControl *)self _setShutterState:v22];
        goto LABEL_32;
      }
      break;
    case 4:
      if (v12 >= 60.0)
      {
        if (x > v13)
        {
          CGFloat v16 = self;
          uint64_t v17 = 5;
          goto LABEL_15;
        }
      }
      else
      {
LABEL_7:
        [(CAMDynamicShutterControl *)self _setDragHandleState:3 animated:1];
        [(CAMDynamicShutterControl *)self _setInnerShapeState:0 animated:1];
LABEL_32:
        __int16 v23 = [(CAMDynamicShutterControl *)self _feedbackController];
        [v23 performDiscreteFeedback:0];
      }
      break;
    case 5:
      if (x <= v13)
      {
        CGFloat v16 = self;
        uint64_t v17 = 4;
LABEL_15:
        [(CAMDynamicShutterControl *)v16 _setDragHandleState:v17 animated:1];
        [(CAMDynamicShutterControl *)self _setInnerShapeState:1 animated:1];
      }
      break;
    default:
      break;
  }
  id v24 = [(CAMDynamicShutterControl *)self _displayLink];
  [v24 setPaused:0];
}

- (void)_touchSequenceBegan:(id *)a3
{
  [(CAMDynamicShutterControl *)self _setTouchSequencePhase:1];
  double v5 = [(CAMDynamicShutterControl *)self _feedbackController];
  [v5 prepareDiscreteFeedback:0];

  [(CAMDynamicShutterControl *)self set_shouldCheckTouchUpEvents:1];
  [(CAMDynamicShutterControl *)self set_didCancelZoomForCurrentGesture:0];
  if (self->_delegateFlags.respondsToGesturesDidBegin)
  {
    double v6 = [(CAMDynamicShutterControl *)self delegate];
    [v6 dynamicShutterControlGesturesDidBegin:self];
  }
  if ([(CAMDynamicShutterControl *)self _isActiveTouchSequencePhase:[(CAMDynamicShutterControl *)self _touchSequencePhase]])
  {
    if (a3->var2)
    {
      BOOL v7 = [(CAMDynamicShutterControl *)self _shouldStartStopOnTouchDown];
      BOOL v8 = [(CAMDynamicShutterControl *)self _isStartStopShutterState:[(CAMDynamicShutterControl *)self _shutterState]];
      if (v7 && !v8)
      {
        [(CAMDynamicShutterControl *)self settings];
        if (v18 || ([(CAMDynamicShutterControl *)self settings], v17))
        {
          double v9 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganUnresolvedStart", buf, 2u);
          }

          [(CAMDynamicShutterControl *)self _setShutterState:5];
        }
        else
        {
          CGFloat v16 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganTapStart", buf, 2u);
          }

          [(CAMDynamicShutterControl *)self _handleTapToStartStop];
          [(CAMDynamicShutterControl *)self set_shouldCheckTouchUpEvents:0];
        }
      }
      if ([(CAMDynamicShutterControl *)self _shouldShortPressOnTouchDown])
      {
        double v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganShortPress", buf, 2u);
        }

        if (self->_delegateFlags.respondsToDidShortPress)
        {
          int64_t v11 = [(CAMDynamicShutterControl *)self delegate];
          [v11 dynamicShutterControlDidShortPress:self];
        }
        [(CAMDynamicShutterControl *)self set_shouldCheckTouchUpEvents:0];
      }
      if (![(CAMDynamicShutterControl *)self _isDraggingEnabled]
        || ![(CAMDynamicShutterControl *)self _shouldStartTrackingHandle]
        || [(CAMDynamicShutterControl *)self _ignoreNextCancelledGesture])
      {
        goto LABEL_37;
      }
      goto LABEL_30;
    }
    if (!a3->var3 || ![(CAMDynamicShutterControl *)self _isDraggingEnabled]) {
      goto LABEL_37;
    }
    if ([(CAMDynamicShutterControl *)self _dragHandleState] == 7)
    {
      if (![(CAMDynamicShutterControl *)self _shouldStartTrackingHandle])
      {
LABEL_35:
        [(CAMDynamicShutterControl *)self _setDragHandleState:5 animated:1];
        double v14 = self;
        uint64_t v15 = 1;
        goto LABEL_36;
      }
    }
    else
    {
      int64_t v13 = [(CAMDynamicShutterControl *)self _dragHandleState];
      if (![(CAMDynamicShutterControl *)self _shouldStartTrackingHandle])
      {
        if (v13 != 6)
        {
LABEL_37:
          if ([(CAMDynamicShutterControl *)self _isTrackingHandleState:[(CAMDynamicShutterControl *)self _dragHandleState]])
          {
            -[CAMDynamicShutterControl _updateStateForTouchPoint:](self, "_updateStateForTouchPoint:", a3->var0.x, a3->var0.y);
            -[CAMDynamicShutterControl _updateTrackingDragHandleOffsetTargetWithPoint:](self, "_updateTrackingDragHandleOffsetTargetWithPoint:", a3->var0.x, a3->var0.y);
          }
          double v12 = [(CAMDynamicShutterControl *)self _displayLink];
          [v12 setPaused:0];
          goto LABEL_40;
        }
        goto LABEL_35;
      }
    }
LABEL_30:
    [(CAMDynamicShutterControl *)self _setDragHandleState:3 animated:1];
    double v14 = self;
    uint64_t v15 = 0;
LABEL_36:
    [(CAMDynamicShutterControl *)v14 _setInnerShapeState:v15 animated:1];
    goto LABEL_37;
  }
  double v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganReset", buf, 2u);
  }
LABEL_40:
}

- (void)_touchSequenceChanged:(id *)a3
{
  double v5 = [(CAMDynamicShutterControl *)self _feedbackController];
  [v5 prepareDiscreteFeedback:0];

  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v7 = v6;
  double y = a3->var0.y;
  if ([(CAMDynamicShutterControl *)self _isTrackingHandleState:[(CAMDynamicShutterControl *)self _dragHandleState]])
  {
    -[CAMDynamicShutterControl _updateStateForTouchPoint:](self, "_updateStateForTouchPoint:", a3->var0.x, a3->var0.y);
    -[CAMDynamicShutterControl _updateTrackingDragHandleOffsetTargetWithPoint:](self, "_updateTrackingDragHandleOffsetTargetWithPoint:", a3->var0.x, a3->var0.y);
  }
  double v9 = v7 - y;
  [(CAMDynamicShutterControl *)self settings];
  if (v18)
  {
    if (![(CAMDynamicShutterControl *)self _didCancelZoomForCurrentGesture]
      && fabs(v9) > 55.0
      && ![(CAMDynamicShutterControl *)self isZooming])
    {
      [(CAMDynamicShutterControl *)self setZooming:1];
      [(CAMDynamicShutterControl *)self set_initalZoomGestureOffsetY:v9];
      if (self->_delegateFlags.respondsToDidStartZoomGesture)
      {
        double v10 = [(CAMDynamicShutterControl *)self delegate];
        [v10 dynamicShutterControlDidStartZoomGesture:self];
      }
    }
  }
  if ([(CAMDynamicShutterControl *)self _isStartStopShutterState:[(CAMDynamicShutterControl *)self _shutterState]]&& [(CAMDynamicShutterControl *)self isZooming]&& self->_delegateFlags.respondsToDidChangeRelativeZoomProgress)
  {
    [(CAMDynamicShutterControl *)self _initalZoomGestureOffsetY];
    double v12 = v9 - v11;
    [(CAMDynamicShutterControl *)self _absoluteShutterToBottomDistance];
    [(CAMDynamicShutterControl *)self _initalZoomGestureOffsetY];
    if (v12 >= 0.0)
    {
      CEKProgress();
      double v14 = v15;
    }
    else
    {
      CEKProgressClamped();
      double v14 = -v13;
    }
    CGFloat v16 = [(CAMDynamicShutterControl *)self delegate];
    [v16 dynamicShutterControl:self didChangeRelativeZoomProgress:v14];
  }
  uint64_t v17 = [(CAMDynamicShutterControl *)self _displayLink];
  [v17 setPaused:0];
}

- (void)_touchSequenceEnded:(id *)a3 forReset:(BOOL)a4
{
  if ((unint64_t)([(CAMDynamicShutterControl *)self _touchSequencePhase] - 1) <= 1) {
    [(CAMDynamicShutterControl *)self _setTouchSequencePhase:3];
  }
  [(CAMDynamicShutterControl *)self _firstTouch];
  if (v38) {
    BOOL v7 = [(CAMDynamicShutterControl *)self _isHandleWithinLockRing];
  }
  else {
    BOOL v7 = 0;
  }
  [(CAMDynamicShutterControl *)self _firstTouch];
  if (v37) {
    BOOL var2 = a3->var2;
  }
  else {
    BOOL var2 = 0;
  }
  [(CAMDynamicShutterControl *)self _firstTouch];
  int v9 = v36;
  if (v36) {
    BOOL var4 = a3->var4;
  }
  else {
    BOOL var4 = 0;
  }
  [(CAMDynamicShutterControl *)self settings];
  if (v7)
  {
    BOOL v11 = self->_delegateFlags.respondsToDidPressLockButton && v35 == 2;
    if (v11 && !a4)
    {
      double v12 = [(CAMDynamicShutterControl *)self delegate];
      [v12 dynamicShutterControlDidPressLockButton:self];
    }
  }
  if (var4 && !a4 && self->_delegateFlags.respondsToDidPressPauseResumeButton)
  {
    double v13 = [(CAMDynamicShutterControl *)self delegate];
    [v13 dynamicShutterControlDidPressPauseResumeButton:self];
  }
  if (var2 && [(CAMDynamicShutterControl *)self _shouldCheckTouchUpEvents] && !a4)
  {
    BOOL v14 = [(CAMDynamicShutterControl *)self _shouldShortPressOnTouchUp];
    if ([(CAMDynamicShutterControl *)self _isExternalShutterPressed]) {
      [(CAMDynamicShutterControl *)self _externalLongPressVideoDuration];
    }
    else {
      [(CAMDynamicShutterControl *)self _longPressVideoDuration];
    }
    double v16 = v15;
    double var1 = a3->var1;
    [(CAMDynamicShutterControl *)self _firstTouch];
    double v18 = var1 - v34;
    if (var1 - v34 < v16 && v14)
    {
      [(CAMDynamicShutterControl *)self settings];
      if (!v33 || !self->_delegateFlags.respondsToDidShortPress)
      {
LABEL_43:
        unint64_t v22 = [(CAMDynamicShutterControl *)self _shutterState];
        if (v22 > 5) {
          goto LABEL_52;
        }
        if (((1 << v22) & 0x1A) == 0)
        {
          if (((1 << v22) & 0x21) != 0)
          {
            [(CAMDynamicShutterControl *)self settings];
            if (v31 == 1)
            {
              __int16 v23 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedTapStart", buf, 2u);
              }

              [(CAMDynamicShutterControl *)self _handleTapToStartStop];
            }
            goto LABEL_52;
          }
          [(CAMDynamicShutterControl *)self _setDragHandleState:1 animated:0];
          [(CAMDynamicShutterControl *)self _setDragHandleState:0 animated:1];
          [(CAMDynamicShutterControl *)self _setInnerShapeState:0 animated:1];
        }
        [(CAMDynamicShutterControl *)self _setShutterState:0];
        goto LABEL_52;
      }
      uint64_t v20 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedShortPress", buf, 2u);
      }

      uint64_t v21 = [(CAMDynamicShutterControl *)self delegate];
      [v21 dynamicShutterControlDidShortPress:self];
    }
    else
    {
      if (v18 < v16) {
        goto LABEL_43;
      }
      uint64_t v21 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedIgnoredShortPressTimeout", buf, 2u);
      }
    }

    goto LABEL_43;
  }
LABEL_52:
  unint64_t v24 = [(CAMDynamicShutterControl *)self _dragHandleState];
  if (v24 > 8) {
    goto LABEL_66;
  }
  if (((1 << v24) & 0x1C3) != 0)
  {
    if (v9) {
      goto LABEL_66;
    }
    unint64_t v25 = [(CAMDynamicShutterControl *)self _shutterState];
    if (v25 > 5 || ((1 << v25) & 0x3A) == 0) {
      goto LABEL_66;
    }
LABEL_60:
    [(CAMDynamicShutterControl *)self _setShutterState:0];
    goto LABEL_66;
  }
  if (((1 << v24) & 0xC) != 0)
  {
    [(CAMDynamicShutterControl *)self _setDragHandleState:0 animated:1];
    [(CAMDynamicShutterControl *)self _setInnerShapeState:0 animated:1];
    goto LABEL_60;
  }
  [(CAMDynamicShutterControl *)self settings];
  if (v30 == 2)
  {
    double v26 = self;
    uint64_t v27 = 7;
  }
  else
  {
    if (v30 != 1) {
      goto LABEL_66;
    }
    double v26 = self;
    uint64_t v27 = 6;
  }
  [(CAMDynamicShutterControl *)v26 _setDragHandleState:v27 animated:1];
  [(CAMDynamicShutterControl *)self _setInnerShapeState:1 animated:1];
LABEL_66:
  if (self->_delegateFlags.respondsToGesturesDidEnd)
  {
    double v28 = [(CAMDynamicShutterControl *)self delegate];
    [v28 dynamicShutterControlGesturesDidEnd:self];
  }
  [(CAMDynamicShutterControl *)self set_shouldCheckTouchUpEvents:0];
  [(CAMDynamicShutterControl *)self setZooming:0];
  double v29 = [(CAMDynamicShutterControl *)self _displayLink];
  [v29 setPaused:0];
}

- (void)_touchSequenceCancelledForReset:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMDynamicShutterControl *)self _mostRecentTouch];
  [(CAMDynamicShutterControl *)self _touchSequenceEnded:v8 forReset:v3];
  if (self->_delegateFlags.respondsToGesturesDidCancel)
  {
    double v5 = [(CAMDynamicShutterControl *)self delegate];
    [v5 dynamicShutterControlGesturesDidCancel:self];
  }
  double v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedCancelled", v7, 2u);
  }
}

- (void)_cancelTouchSequenceForReset:(BOOL)a3
{
  [(CAMDynamicShutterControl *)self _touchSequenceCancelledForReset:a3];
  BOOL v4 = [(CAMDynamicShutterControl *)self _gestureRecognizer];
  uint64_t v5 = [v4 state];

  if ((unint64_t)(v5 - 1) <= 1)
  {
    [(CAMDynamicShutterControl *)self _setIgnoreNextCancelledGesture:1];
    id v6 = [(CAMDynamicShutterControl *)self _gestureRecognizer];
    [v6 cancelGesture];
  }
}

- (void)_handleTapToStartStop
{
  [(CAMDynamicShutterControl *)self settings];
  if (v6 < 2)
  {
    BOOL v3 = self;
    uint64_t v4 = 1;
    uint64_t v5 = 0;
LABEL_5:
    [(CAMDynamicShutterControl *)v3 _setDragHandleState:v4 animated:v5];
    goto LABEL_6;
  }
  if (v6 == 2)
  {
    [(CAMDynamicShutterControl *)self _setDragHandleState:8 animated:0];
    BOOL v3 = self;
    uint64_t v4 = 7;
    uint64_t v5 = 1;
    goto LABEL_5;
  }
LABEL_6:
  [(CAMDynamicShutterControl *)self _setInnerShapeState:1 animated:1];
  [(CAMDynamicShutterControl *)self _setShutterState:2];
}

- (BOOL)externalButtonPressedWithBehavior:(int64_t)a3
{
  int v5 = [(CAMDynamicShutterControl *)self _isExternalShutterPressed];
  int v6 = [(CAMDynamicShutterControl *)self isTracking];
  int v7 = [(CAMDynamicShutterControl *)self isEnabled];
  int v8 = v7 & (v6 ^ 1) & ~v5;
  if ((v7 & 1) == 0 && self->_delegateFlags.respondsToTouchAttemptedWhileDisabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shutterControlTouchAttemptedWhileDisabled:self];
  }
  if (v8)
  {
    [(CAMDynamicShutterControl *)self _setExternalShutterPressed:1];
    [(CAMDynamicShutterControl *)self _shutterButtonCenter];
    *(_OWORD *)uint64_t v17 = 0u;
    long long v18 = 0u;
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    v16[0] = *(_OWORD *)v17;
    v16[1] = v18;
    [(CAMDynamicShutterControl *)self _setFirstTouch:v16];
    double v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganExternal", buf, 2u);
    }

    *(_OWORD *)buf = *(_OWORD *)v17;
    long long v15 = v18;
    [(CAMDynamicShutterControl *)self _touchSequenceBegan:buf];
    v13[0] = *(_OWORD *)v17;
    v13[1] = v18;
    [(CAMDynamicShutterControl *)self _setMostRecentTouch:v13];
    [(CAMDynamicShutterControl *)self set_externalShutterLongPressBehavior:a3];
  }
  else
  {
    BOOL v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: External shutter button press ignored", v17, 2u);
    }
  }
  return v8;
}

- (BOOL)externalButtonReleased
{
  BOOL v3 = [(CAMDynamicShutterControl *)self _isExternalShutterPressed];
  if (v3)
  {
    int64_t v4 = [(CAMDynamicShutterControl *)self _shutterState];
    *(_OWORD *)buf = 0u;
    long long v12 = 0u;
    [(CAMDynamicShutterControl *)self _shutterButtonCenter];
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    v10[0] = *(_OWORD *)buf;
    v10[1] = v12;
    [(CAMDynamicShutterControl *)self _touchSequenceEnded:v10 forReset:0];
    v9[0] = *(_OWORD *)buf;
    v9[1] = v12;
    [(CAMDynamicShutterControl *)self _setMostRecentTouch:v9];
    if ([(CAMDynamicShutterControl *)self _externalShutterLongPressBehavior] == 2
      && v4 == 1)
    {
      [(CAMDynamicShutterControl *)self _setShutterState:0];
      [(CAMDynamicShutterControl *)self _setInnerShapeState:0 animated:1];
      [(CAMDynamicShutterControl *)self _setDragHandleState:0];
    }
    int v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      int v6 = "Dynamic Shutter: TouchEndedExternal";
      int v7 = (uint8_t *)v10;
LABEL_9:
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    int v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Dynamic Shutter: External shutter button release ignored, external shutter not pressed";
      int v7 = buf;
      goto LABEL_9;
    }
  }

  [(CAMDynamicShutterControl *)self _setExternalShutterPressed:0];
  [(CAMDynamicShutterControl *)self set_externalShutterLongPressBehavior:0];
  return v3;
}

- (void)externalButtonCancelled
{
  [(CAMDynamicShutterControl *)self externalButtonReleased];
  [(CAMDynamicShutterControl *)self set_externalShutterLongPressBehavior:0];
  if (self->_delegateFlags.respondsToGesturesDidCancel)
  {
    id v3 = [(CAMDynamicShutterControl *)self delegate];
    [v3 dynamicShutterControlGesturesDidCancel:self];
  }
}

- (BOOL)externalLockButtonPressed
{
  [(CAMDynamicShutterControl *)self _dragHandleXPosition];
  double v4 = v3;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  BOOL v5 = [(CAMDynamicShutterControl *)self _isPointWithinLockRingTouchArea:v4];
  int v6 = [(CAMDynamicShutterControl *)self _isExternalLockButtonPressed];
  int v7 = [(CAMDynamicShutterControl *)self isTracking];
  int v8 = [(CAMDynamicShutterControl *)self isEnabled];
  int v9 = v5 & ~v6 & v8 & (v7 ^ 1);
  if ((v8 & 1) == 0 && self->_delegateFlags.respondsToTouchAttemptedWhileDisabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shutterControlTouchAttemptedWhileDisabled:self];
  }
  if (v9)
  {
    [(CAMDynamicShutterControl *)self _setExternalLockButtonPressed:1];
    *(_OWORD *)buf = 0u;
    long long v17 = 0u;
    [(CAMDynamicShutterControl *)self _lockButtonCenter];
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    v15[0] = *(_OWORD *)buf;
    v15[1] = v17;
    [(CAMDynamicShutterControl *)self _setFirstTouch:v15];
    v14[0] = *(_OWORD *)buf;
    v14[1] = v17;
    [(CAMDynamicShutterControl *)self _touchSequenceBegan:v14];
    v13[0] = *(_OWORD *)buf;
    v13[1] = v17;
    [(CAMDynamicShutterControl *)self _setMostRecentTouch:v13];
  }
  else
  {
    BOOL v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: External lock button press ignored", buf, 2u);
    }
  }
  return v9;
}

- (void)externalLockButtonReleased
{
  BOOL v3 = [(CAMDynamicShutterControl *)self _isExternalLockButtonPressed];
  [(CAMDynamicShutterControl *)self _setExternalLockButtonPressed:0];
  if (v3)
  {
    *(_OWORD *)buf = 0u;
    long long v8 = 0u;
    [(CAMDynamicShutterControl *)self _lockButtonCenter];
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    v6[0] = *(_OWORD *)buf;
    v6[1] = v8;
    [(CAMDynamicShutterControl *)self _touchSequenceEnded:v6 forReset:0];
    v5[0] = *(_OWORD *)buf;
    v5[1] = v8;
    [(CAMDynamicShutterControl *)self _setMostRecentTouch:v5];
  }
  else
  {
    double v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: External lock button button release ignored, external lock button not pressed", buf, 2u);
    }
  }
}

- (void)_setCounterValue:(int64_t)a3
{
  if (self->__counterValue != a3)
  {
    self->__counterValue = a3;
    [(CAMDynamicShutterControl *)self _updateCounterLabelText];
  }
}

- (void)_updateCounterLabelText
{
  objc_msgSend(NSString, "stringWithFormat:", @"%02ld", -[CAMDynamicShutterControl _counterValue](self, "_counterValue"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [(CAMDynamicShutterControl *)self _counterLabel];
  [v3 setText:v4];
}

- (int64_t)incrementCounter
{
  double v3 = (double)([(CAMDynamicShutterControl *)self _counterValue] + 1);
  if (v3 > 999.0) {
    double v3 = 999.0;
  }
  [(CAMDynamicShutterControl *)self _setCounterValue:(uint64_t)v3];
  return [(CAMDynamicShutterControl *)self _counterValue];
}

- (void)resetCounter
{
}

- (void)setSettings:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var6;
  _OWORD v5[2] = *(_OWORD *)&a3->var4;
  v5[3] = v3;
  int64_t var8 = a3->var8;
  long long v4 = *(_OWORD *)&a3->var2;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  [(CAMDynamicShutterControl *)self setSettings:v5 animated:0];
}

- (void)setSettings:(id *)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.var0 = (BOOL)[(CAMDynamicShutterControl *)self privateSettings];
  long long v8 = *(_OWORD *)&a3->var6;
  _OWORD v10[2] = *(_OWORD *)&a3->var4;
  v10[3] = v8;
  int64_t var8 = a3->var8;
  long long v9 = *(_OWORD *)&a3->var2;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v9;
  [(CAMDynamicShutterControl *)self setSettings:v10 privateSettings:v7.var0 animated:v4];
}

- (void)setSettings:(id *)a3 privateSettings:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3->var0 != self->_settings.tapBehavior
    || a3->var1 != self->_settings.longPressBehavior
    || a3->var2 != self->_settings.dragRightBehavior
    || a3->var3 != self->_settings.dragLeftBehavior
    || a3->var5 != self->_settings.lockBehavior
    || a3->var6 != self->_settings.ringStyle
    || a3->var7 != self->_settings.stopColor
    || a3->var8 != self->_settings.idleColor
    || a3->var4 != self->_settings.allowsZoom
    || a4.var0 != self->_privateSettings.allowPauseResume)
  {
    *(_OWORD *)&self->_settings.tapBehavior = *(_OWORD *)&a3->var0;
    long long v7 = *(_OWORD *)&a3->var2;
    long long v8 = *(_OWORD *)&a3->var4;
    long long v9 = *(_OWORD *)&a3->var6;
    self->_settings.idleColor = a3->var8;
    *(_OWORD *)&self->_settings.allowsZoom = v8;
    *(_OWORD *)&self->_settings.ringStyle = v9;
    *(_OWORD *)&self->_settings.dragRightBehavior = v7;
    self->_privateSettings.allowPauseResume = a4.var0;
    [(CAMDynamicShutterControl *)self _updateSpringTargetsAnimated:a5];
    [(CAMDynamicShutterControl *)self _updateOuterAndInnerLayersAnimated:v5];
    [(CAMDynamicShutterControl *)self _updateCenterLegibilityView];
  }
}

- (BOOL)_isDraggingEnabled
{
  [(CAMDynamicShutterControl *)self settings];
  if (v5) {
    return 1;
  }
  [(CAMDynamicShutterControl *)self settings];
  return v4 != 0;
}

- (id)_outerImage
{
  [(CAMDynamicShutterControl *)self settings];
  if (v13 == 1)
  {
    [(CAMDynamicShutterControl *)self _shutterButtonSpec];
    long long v3 = objc_opt_class();
    if (v3)
    {
      [v3 shutterButtonSpecForLayoutStyle:0];
      double v4 = v11;
    }
    else
    {
      double v4 = 0.0;
    }
    if (v12 <= v4) {
      int v6 = @"CAMDynamicShutterButtonSlomoLegacyPhone";
    }
    else {
      int v6 = @"CAMShutterButtonThinSlomo";
    }
    long long v7 = (void *)MEMORY[0x263F827E8];
    long long v8 = CAMCameraUIFrameworkBundle();
    long long v9 = [v7 imageNamed:v6 inBundle:v8];
    uint64_t v5 = [v9 imageWithRenderingMode:2];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)_updateOuterAndInnerLayersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMDynamicShutterControl *)self settings];
  uint64_t v5 = v37;
  [(CAMDynamicShutterControl *)self settings];
  uint64_t v6 = v36;
  if (v37 == 1)
  {
    long long v7 = [(CAMDynamicShutterControl *)self _centerOuterImageView];

    if (!v7)
    {
      id v8 = objc_alloc(MEMORY[0x263F82828]);
      long long v9 = [(CAMDynamicShutterControl *)self _centerOuterView];
      [v9 frame];
      double v10 = objc_msgSend(v8, "initWithFrame:");
      [(CAMDynamicShutterControl *)self set_centerOuterImageView:v10];

      double v11 = [MEMORY[0x263F825C8] whiteColor];
      double v12 = [(CAMDynamicShutterControl *)self _centerOuterImageView];
      [v12 setTintColor:v11];

      uint64_t v13 = [(CAMDynamicShutterControl *)self _centerOuterImageView];
      BOOL v14 = [(CAMDynamicShutterControl *)self _centerOuterView];
      [(CAMDynamicShutterControl *)self insertSubview:v13 belowSubview:v14];
    }
    long long v15 = [(CAMDynamicShutterControl *)self _outerImage];
    double v16 = [(CAMDynamicShutterControl *)self _centerOuterImageView];
    [v16 setImage:v15];
  }
  if (v36 == 2)
  {
    long long v17 = [(CAMDynamicShutterControl *)self _centerTimelapseOuterView];

    if (!v17)
    {
      long long v18 = [CAMTimelapseShutterRingView alloc];
      char v19 = [(CAMDynamicShutterControl *)self _centerOuterView];
      [v19 frame];
      v35[0] = xmmword_209C7BB88;
      v35[1] = unk_209C7BB98;
      uint64_t v20 = -[CAMTimelapseShutterRingView initWithFrame:spec:](v18, "initWithFrame:spec:", v35);
      [(CAMDynamicShutterControl *)self set_centerTimelapseOuterView:v20];

      uint64_t v21 = [(CAMDynamicShutterControl *)self _centerTimelapseOuterView];
      unint64_t v22 = [(CAMDynamicShutterControl *)self _centerOuterView];
      [(CAMDynamicShutterControl *)self insertSubview:v21 belowSubview:v22];
    }
    BOOL v23 = [(CAMDynamicShutterControl *)self _isStartStopShutterState:[(CAMDynamicShutterControl *)self _shutterState]];
    unint64_t v24 = [(CAMDynamicShutterControl *)self _centerTimelapseOuterView];
    [v24 setAnimating:v23];
  }
  BOOL v25 = v5 == 1;
  BOOL v26 = v6 == 2 || v5 == 1;
  BOOL v27 = !v26;
  BOOL v28 = [(CAMDynamicShutterControl *)self showDisabled];
  double v29 = 1.0;
  if (v28) {
    double v29 = 0.4;
  }
  double v30 = 0.3;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __63__CAMDynamicShutterControl__updateOuterAndInnerLayersAnimated___block_invoke;
  v31[3] = &unk_263FA6328;
  v31[4] = self;
  if (!v3) {
    double v30 = 0.0;
  }
  BOOL v32 = v27;
  *(double *)&v31[5] = v29;
  BOOL v33 = v25;
  BOOL v34 = v6 == 2;
  +[CAMView animateIfNeededWithDuration:v31 animations:v30];
}

void __63__CAMDynamicShutterControl__updateOuterAndInnerLayersAnimated___block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 48)) {
    double v3 = *(double *)(a1 + 40);
  }
  double v4 = [*(id *)(a1 + 32) _centerOuterView];
  [v4 setAlpha:v3];

  if (*(unsigned char *)(a1 + 49)) {
    double v2 = *(double *)(a1 + 40);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _centerOuterImageView];
  [v5 setAlpha:v2];

  if (*(unsigned char *)(a1 + 50)) {
    double v6 = *(double *)(a1 + 40);
  }
  else {
    double v6 = 0.0;
  }
  id v7 = [*(id *)(a1 + 32) _centerTimelapseOuterView];
  [v7 setAlpha:v6];
}

- (void)setSpinning:(BOOL)a3
{
  if (self->_spinning != a3)
  {
    self->_spinning = a3;
    [(CAMDynamicShutterControl *)self _updateSpinningAnimations];
  }
}

- (void)_updateSpinningAnimations
{
  BOOL v3 = [(CAMDynamicShutterControl *)self isSpinning];
  double v4 = [(CAMDynamicShutterControl *)self _spinnerView];
  if (!v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F827E8];
    double v6 = CAMCameraUIFrameworkBundle();
    id v7 = [v5 imageNamed:@"CAMDynamicShutterButtonSpinner" inBundle:v6];
    id v8 = [v7 imageWithRenderingMode:2];

    double v4 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
    [(CAMDynamicShutterControl *)self set_spinnerView:v4];
  }
  long long v9 = [v4 layer];
  if (v3)
  {
    [(CAMDynamicShutterControl *)self addSubview:v4];
    [(CAMDynamicShutterControl *)self _shutterButtonCenter];
    objc_msgSend(v4, "setCenter:");
    [(CAMDynamicShutterControl *)self _shutterButtonSpec];
    double InnerCircleDiameter = CAMShutterButtonSpecGetInnerCircleDiameter(v22);
    objc_msgSend(v4, "setBounds:", 0.0, 0.0, InnerCircleDiameter, InnerCircleDiameter);
    [(CAMDynamicShutterControl *)self settings];
    double v11 = 0.8;
    if (v21 != 1) {
      double v11 = 0.0;
    }
    if (!v21) {
      double v11 = 0.501960784;
    }
    double v12 = [MEMORY[0x263F825C8] colorWithRed:v11 green:v11 blue:v11 alpha:1.0];
    [v4 setTintColor:v12];

    [(CAMDynamicShutterControl *)self _updateMetalViewAlpha];
    [v4 setAlpha:1.0];
    uint64_t v13 = +[CAMShutterUtilities spinnerAnimation];
    [v9 addAnimation:v13 forKey:@"spinnerRotation"];
  }
  else
  {
    BOOL v14 = (void *)MEMORY[0x263F82E00];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__CAMDynamicShutterControl__updateSpinningAnimations__block_invoke;
    v19[3] = &unk_263FA0408;
    v19[4] = self;
    id v20 = v4;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    _OWORD v15[2] = __53__CAMDynamicShutterControl__updateSpinningAnimations__block_invoke_2;
    v15[3] = &unk_263FA3638;
    v15[4] = self;
    id v16 = v20;
    id v17 = v9;
    long long v18 = @"spinnerRotation";
    [v14 animateWithDuration:327680 delay:v19 options:v15 animations:0.3 completion:0.0];
  }
}

uint64_t __53__CAMDynamicShutterControl__updateSpinningAnimations__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMetalViewAlpha];
  double v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __53__CAMDynamicShutterControl__updateSpinningAnimations__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSpinning];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 40) removeFromSuperview];
    BOOL v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    return [v3 removeAnimationForKey:v4];
  }
  return result;
}

- (void)setPausedDuringVideo:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_pausedDuringVideo != a3)
  {
    self->_pausedDuringVideo = a3;
    [(CAMDynamicShutterControl *)self _updateSpringTargetsAnimated:a4];
  }
}

- (void)setShowContrastBorder:(BOOL)a3
{
  if (self->_showContrastBorder != a3)
  {
    self->_showContrastBorder = a3;
    if (a3)
    {
      if (!self->__leftLineLegibilityView)
      {
        id v4 = objc_alloc(MEMORY[0x263F82E00]);
        uint64_t v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        leftLineLegibilityView = self->__leftLineLegibilityView;
        self->__leftLineLegibilityView = v5;

        id v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.1];
        uint64_t v8 = [v7 CGColor];
        long long v9 = [(UIView *)self->__leftLineLegibilityView layer];
        [v9 setBorderColor:v8];

        double v10 = [(UIView *)self->__leftLineLegibilityView layer];
        [v10 setBorderWidth:1.0];

        [(UIView *)self->__leftLineLegibilityView setUserInteractionEnabled:0];
        double v11 = self->__leftLineLegibilityView;
        double v12 = [(CAMDynamicShutterControl *)self _leftLineView];
        [(CAMDynamicShutterControl *)self insertSubview:v11 belowSubview:v12];
      }
      if (!self->__rightLineLegibilityView)
      {
        id v13 = objc_alloc(MEMORY[0x263F82E00]);
        BOOL v14 = (UIView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        rightLineLegibilityView = self->__rightLineLegibilityView;
        self->__rightLineLegibilityView = v14;

        id v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.1];
        uint64_t v17 = [v16 CGColor];
        long long v18 = [(UIView *)self->__rightLineLegibilityView layer];
        [v18 setBorderColor:v17];

        char v19 = [(UIView *)self->__rightLineLegibilityView layer];
        [v19 setBorderWidth:1.0];

        [(UIView *)self->__rightLineLegibilityView setUserInteractionEnabled:0];
        id v20 = self->__rightLineLegibilityView;
        uint64_t v21 = [(CAMDynamicShutterControl *)self _rightLineView];
        [(CAMDynamicShutterControl *)self insertSubview:v20 belowSubview:v21];
      }
      if (!self->__centerOuterLegibilityView)
      {
        id v22 = objc_alloc(MEMORY[0x263F82E00]);
        BOOL v23 = (UIView *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        centerOuterLegibilityView = self->__centerOuterLegibilityView;
        self->__centerOuterLegibilityView = v23;

        BOOL v25 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.1];
        [(UIView *)self->__centerOuterLegibilityView setBackgroundColor:v25];

        [(UIView *)self->__centerOuterLegibilityView setUserInteractionEnabled:0];
        BOOL v26 = self->__centerOuterLegibilityView;
        BOOL v27 = [(CAMDynamicShutterControl *)self _centerOuterView];
        [(CAMDynamicShutterControl *)self insertSubview:v26 belowSubview:v27];
      }
      if (!self->__lockButtonOuterLegibilityView)
      {
        id v28 = objc_alloc(MEMORY[0x263F82E00]);
        double v29 = (UIView *)objc_msgSend(v28, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        lockButtonOuterLegibilityView = self->__lockButtonOuterLegibilityView;
        self->__lockButtonOuterLegibilityView = v29;

        uint64_t v31 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.1];
        [(UIView *)self->__lockButtonOuterLegibilityView setBackgroundColor:v31];

        [(UIView *)self->__lockButtonOuterLegibilityView setUserInteractionEnabled:0];
        BOOL v32 = self->__lockButtonOuterLegibilityView;
        BOOL v33 = [(CAMDynamicShutterControl *)self _lockButtonOuterView];
        [(CAMDynamicShutterControl *)self insertSubview:v32 belowSubview:v33];
      }
      if (!self->__pauseResumeButtonLegibilityView)
      {
        id v34 = objc_alloc(MEMORY[0x263F82E00]);
        uint64_t v35 = (UIView *)objc_msgSend(v34, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        pauseResumeButtonLegibilityView = self->__pauseResumeButtonLegibilityView;
        self->__pauseResumeButtonLegibilityView = v35;

        uint64_t v37 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.1];
        [(UIView *)self->__pauseResumeButtonLegibilityView setBackgroundColor:v37];

        [(UIView *)self->__pauseResumeButtonLegibilityView setUserInteractionEnabled:0];
        char v38 = self->__pauseResumeButtonLegibilityView;
        long long v39 = [(CAMDynamicShutterControl *)self _pauseResumeButtonOuterView];
        [(CAMDynamicShutterControl *)self insertSubview:v38 belowSubview:v39];
      }
    }
    [(CAMDynamicShutterControl *)self _updateCenterLegibilityView];
    [(CAMDynamicShutterControl *)self setNeedsLayout];
    id v40 = [(CAMDynamicShutterControl *)self _displayLink];
    [v40 setPaused:0];
  }
}

- (void)_updateCenterLegibilityView
{
  [(CAMDynamicShutterControl *)self settings];
  if (v5) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [(CAMDynamicShutterControl *)self showContrastBorder] ^ 1;
  }
  id v4 = [(CAMDynamicShutterControl *)self _centerOuterLegibilityView];
  [v4 setHidden:v3];
}

- (void)setShowDisabled:(BOOL)a3
{
}

- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showDisabled != a3)
  {
    self->_showDisabled = a3;
    double v4 = 0.3;
    if (!a4) {
      double v4 = 0.0;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    _OWORD v5[2] = __53__CAMDynamicShutterControl_setShowDisabled_animated___block_invoke;
    v5[3] = &unk_263FA0208;
    _OWORD v5[4] = self;
    +[CAMView animateIfNeededWithDuration:2 options:v5 animations:0 completion:v4];
  }
}

uint64_t __53__CAMDynamicShutterControl_setShowDisabled_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMetalViewAlpha];
  double v2 = *(void **)(a1 + 32);
  return [v2 _updateOuterAndInnerLayersAnimated:0];
}

- (void)_updateMetalViewAlpha
{
  if ([(CAMDynamicShutterControl *)self isSpinning])
  {
    double v3 = 0.2;
  }
  else if ([(CAMDynamicShutterControl *)self showDisabled])
  {
    double v3 = 0.4;
  }
  else
  {
    double v3 = 1.0;
  }
  id v4 = [(CAMDynamicShutterControl *)self _metalView];
  [v4 setAlpha:v3];
}

- (int64_t)_consumeAndUpdateTouchSequencePhase
{
  int64_t v3 = [(CAMDynamicShutterControl *)self _touchSequencePhase];
  int64_t v4 = v3;
  if (v3 == 1)
  {
    uint64_t v5 = 2;
    goto LABEL_5;
  }
  if (v3 == 3)
  {
    uint64_t v5 = 0;
LABEL_5:
    [(CAMDynamicShutterControl *)self _setTouchSequencePhase:v5];
  }
  return v4;
}

- (BOOL)_isActiveTouchSequencePhase:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (void)_updateForTargetTimestamp:(double)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int64_t v5 = [(CAMDynamicShutterControl *)self _consumeAndUpdateTouchSequencePhase];
  BOOL v6 = [(CAMDynamicShutterControl *)self _isActiveTouchSequencePhase:v5];
  [(CAMDynamicShutterControl *)self _updateTrackingSpringTargets];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [(CAMDynamicShutterControl *)self _springs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v11++) updateForTimestamp:a3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  double v12 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
  int v13 = [v12 isConverged];

  if (v13)
  {
    BOOL v14 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
    [v14 setTension:240.0];

    long long v15 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
    [v15 setFriction:30.0];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = [(CAMDynamicShutterControl *)self _springs];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
LABEL_12:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v23 != v19) {
        objc_enumerationMutation(v16);
      }
      if (![*(id *)(*((void *)&v22 + 1) + 8 * v20) isConverged]) {
        goto LABEL_20;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v18) {
          goto LABEL_12;
        }
        break;
      }
    }
  }

  if (!v6)
  {
    id v16 = [(CAMDynamicShutterControl *)self _displayLink];
    [v16 setPaused:1];
LABEL_20:
  }
  [(CAMDynamicShutterControl *)self _updateStateToLongPressIfNeededWithPhase:v5];
  [(CAMDynamicShutterControl *)self _updateViewsFromCurrentState];
  [(CAMDynamicShutterControl *)self _updateRendererShapes];
  uint64_t v21 = [(CAMDynamicShutterControl *)self _liquidShutterRenderer];
  [v21 renderIfNecessary];
}

- (void)_updateStateToLongPressIfNeededWithPhase:(int64_t)a3
{
  BOOL v4 = [(CAMDynamicShutterControl *)self _isActiveTouchSequencePhase:a3];
  int64_t v5 = [(CAMDynamicShutterControl *)self _shutterState];
  if ((v5 == 5 || !v5) && v4)
  {
    BOOL v6 = [(CAMDynamicShutterControl *)self _isExternalShutterPressed];
    [(CAMDynamicShutterControl *)self settings];
    int64_t v7 = [(CAMDynamicShutterControl *)self _externalShutterLongPressBehavior];
    [(CAMDynamicShutterControl *)self settings];
    BOOL v8 = 0;
    BOOL v9 = v7 == 1 && v6;
    int v10 = v9 || !v6;
    if (v17 == 1) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    if (v6 && v7 == 2) {
      BOOL v8 = v16 == 1;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    [(CAMDynamicShutterControl *)self _firstTouch];
    double v13 = Current - v15;
    if (v6) {
      [(CAMDynamicShutterControl *)self _externalLongPressVideoDuration];
    }
    else {
      [(CAMDynamicShutterControl *)self _longPressVideoDuration];
    }
    if (v13 >= v14)
    {
      if (v11)
      {
        [(CAMDynamicShutterControl *)self _setShutterState:4];
      }
      else if (v8)
      {
        [(CAMDynamicShutterControl *)self _setShutterState:1];
        [(CAMDynamicShutterControl *)self _setInnerShapeState:2 animated:1];
        [(CAMDynamicShutterControl *)self _setDragHandleState:1];
      }
    }
  }
}

- (void)_updateTrackingSpringTargets
{
  [(CAMDynamicShutterControl *)self _updateDragHandleWidthTarget];
  [(CAMDynamicShutterControl *)self _updateInnerShapeWidthTarget];
}

- (void)_updateSpringTargetsAnimated:(BOOL)a3
{
  [(CAMDynamicShutterControl *)self _updateStaticDragHandleOffsetTargetAnimated:a3];
  [(CAMDynamicShutterControl *)self _updateDragHandleWidthTarget];
  [(CAMDynamicShutterControl *)self _updateDragHandleColorIsWhiteTarget];
  [(CAMDynamicShutterControl *)self _updateDragHandleAlphaTarget];
  [(CAMDynamicShutterControl *)self _updateInnerShapeWidthTarget];
  [(CAMDynamicShutterControl *)self _updateInnerShapePowerTarget];
  [(CAMDynamicShutterControl *)self _updateInnerShapeColorIsRedTarget];
  [(CAMDynamicShutterControl *)self _updateInnerShapeAlphaTarget];
  [(CAMDynamicShutterControl *)self _updateDrawLockUITarget];
  [(CAMDynamicShutterControl *)self _updateExpandLockRingTarget];
  [(CAMDynamicShutterControl *)self _updatePauseResumeDrawTarget];
  [(CAMDynamicShutterControl *)self _updatePausedDuringVideoTarget];
  id v4 = [(CAMDynamicShutterControl *)self _displayLink];
  [v4 setPaused:0];
}

- (void)_updateStaticDragHandleOffsetTargetAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMDynamicShutterControl *)self _lockButtonCenter];
  double v6 = v5;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v8 = v7;
  unint64_t v9 = [(CAMDynamicShutterControl *)self _dragHandleState];
  if (v9 - 6 >= 3)
  {
    if (v9 > 1) {
      return;
    }
    int v10 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
    id v12 = v10;
    double v11 = 0.0;
  }
  else
  {
    int v10 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
    id v12 = v10;
    double v11 = v6 - v8;
  }
  [v10 setTarget:v3 animated:v11];
}

- (void)_updateTrackingDragHandleOffsetTargetWithPoint:(CGPoint)a3
{
  double x = a3.x;
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v6 = x - v5;
  if ([(CAMDynamicShutterControl *)self _isTrackingHandleState:[(CAMDynamicShutterControl *)self _dragHandleState]])
  {
    double v7 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
    [v7 setTarget:v6];
  }
  unint64_t v8 = [(CAMDynamicShutterControl *)self _dragHandleState];
  if (v8 <= 8)
  {
    if (((1 << v8) & 0x1D7) != 0)
    {
      unint64_t v9 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
      int v10 = [v9 hasSecondaryTarget];

      if (!v10) {
        return;
      }
      id v21 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
      [v21 removeSecondaryTargetAnimated:1];
    }
    else
    {
      if (v8 == 3)
      {
        if (v6 >= 0.0) {
          int v11 = ![(CAMDynamicShutterControl *)self _canDragStartStop];
        }
        else {
          int v11 = 0;
        }
        if (v6 >= 0.0) {
          int v19 = 0;
        }
        else {
          int v19 = ![(CAMDynamicShutterControl *)self _canDragCounter];
        }
        if (v11 | v19) {
          double v20 = 0.85;
        }
        else {
          double v20 = 0.6;
        }
        uint64_t v16 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
        id v21 = v16;
        double v18 = 0.0;
        double v17 = v20;
      }
      else
      {
        [(CAMDynamicShutterControl *)self _lockButtonCenter];
        double v13 = v12;
        [(CAMDynamicShutterControl *)self _shutterButtonCenter];
        double v15 = v13 - v14;
        uint64_t v16 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
        id v21 = v16;
        double v17 = 0.9;
        double v18 = v15;
      }
      [v16 setSecondaryTarget:1 withStrength:v18 animated:v17];
    }
  }
}

- (void)_updateDragHandleWidthTarget
{
  CAMPixelWidthForView(self);
  switch([(CAMDynamicShutterControl *)self _dragHandleState])
  {
    case 0:
      BOOL v3 = [(CAMDynamicShutterControl *)self _dragHandleWidthSpring];
      double v4 = 35.0;
      goto LABEL_7;
    case 1:
    case 6:
    case 8:
      BOOL v3 = [(CAMDynamicShutterControl *)self _dragHandleWidthSpring];
      double v4 = 0.0;
      goto LABEL_7;
    case 2:
    case 4:
    case 5:
      BOOL v3 = [(CAMDynamicShutterControl *)self _dragHandleWidthSpring];
      double v4 = 40.5;
      goto LABEL_7;
    case 3:
      double v5 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
      [v5 value];

      CEKProgressClamped();
      CEKInterpolate();
      double v7 = v6 * 0.9;
      BOOL v3 = [(CAMDynamicShutterControl *)self _dragHandleWidthSpring];
      id v8 = v3;
      double v4 = v7;
      goto LABEL_8;
    case 7:
      BOOL v3 = [(CAMDynamicShutterControl *)self _dragHandleWidthSpring];
      double v4 = 45.0;
LABEL_7:
      id v8 = v3;
LABEL_8:
      [v3 setTarget:v4];

      break;
    default:
      return;
  }
}

- (void)_updateDragHandleColorIsWhiteTarget
{
  unint64_t v3 = [(CAMDynamicShutterControl *)self _dragHandleState];
  if (v3 <= 8)
  {
    if (((1 << v3) & 0x1F4) != 0)
    {
      double v4 = [(CAMDynamicShutterControl *)self _dragHandleColorIsWhiteSpring];
      double v5 = 1.0;
    }
    else
    {
      double v4 = [(CAMDynamicShutterControl *)self _dragHandleColorIsWhiteSpring];
      double v5 = 0.0;
    }
    id v6 = v4;
    [v4 setTarget:v5];
  }
}

- (void)_updateDragHandleAlphaTarget
{
  if (![(CAMDynamicShutterControl *)self _isDraggingEnabled]) {
    goto LABEL_5;
  }
  unint64_t v3 = [(CAMDynamicShutterControl *)self _dragHandleState];
  if (v3 > 8) {
    return;
  }
  if (((1 << v3) & 0xBC) != 0)
  {
    double v4 = [(CAMDynamicShutterControl *)self _dragHandleAlphaSpring];
    double v5 = 1.0;
  }
  else
  {
LABEL_5:
    double v4 = [(CAMDynamicShutterControl *)self _dragHandleAlphaSpring];
    double v5 = 0.0;
  }
  id v6 = v4;
  [v4 setTarget:v5];
}

- (void)_updateInnerShapeWidthTarget
{
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  CAMShutterButtonSpecGetInnerCircleDiameter(v15);
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  if ([(CAMDynamicShutterControl *)self _dragHandleState] == 3)
  {
    unint64_t v3 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
    [v3 value];

    double v4 = [(CAMDynamicShutterControl *)self _dragHandleOffsetSpring];
    [v4 value];
    CEKProgressClamped();

    CEKInterpolate();
    double InnerCircleDiameter = v6;
    BOOL v8 = 1;
  }
  else
  {
    int64_t v5 = [(CAMDynamicShutterControl *)self _innerShapeState];
    if (v5 == 1)
    {
      [(CAMDynamicShutterControl *)self _shutterButtonSpec];
      double InnerCircleDiameter = v13;
    }
    else
    {
      double InnerCircleDiameter = 0.0;
      if (!v5)
      {
        [(CAMDynamicShutterControl *)self _shutterButtonSpec];
        double InnerCircleDiameter = CAMShutterButtonSpecGetInnerCircleDiameter(v14);
      }
    }
    BOOL v8 = [(CAMDynamicShutterControl *)self _isActiveTouchSequencePhase:[(CAMDynamicShutterControl *)self _touchSequencePhase]];
    [(CAMDynamicShutterControl *)self _mostRecentTouch];
    if (!v12) {
      BOOL v8 = 0;
    }
  }
  if ([(CAMDynamicShutterControl *)self isPausedDuringVideo])
  {
    [(CAMDynamicShutterControl *)self _pauseResumeButtonSpec];
    [(CAMDynamicShutterControl *)self _shutterButtonSpec];
    double InnerCircleDiameter = InnerCircleDiameter * (v11 / v10);
  }
  if (v8) {
    double InnerCircleDiameter = InnerCircleDiameter * 0.9;
  }
  unint64_t v9 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
  [v9 setTarget:InnerCircleDiameter];
}

- (void)_updateInnerShapePowerTarget
{
  int64_t v3 = [(CAMDynamicShutterControl *)self _innerShapeState];
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      double v4 = &CAMLiquidShutterPowerSquare;
      goto LABEL_6;
    }
    if (v3) {
      return;
    }
  }
  double v4 = &CAMLiquidShutterPowerCircle;
LABEL_6:
  double v5 = *(double *)v4;
  id v6 = [(CAMDynamicShutterControl *)self _innerShapePowerSpring];
  [v6 setTarget:v5];
}

- (void)_updateInnerShapeColorIsRedTarget
{
  int v3 = [(CAMDynamicShutterControl *)self _isStartStopShutterState:[(CAMDynamicShutterControl *)self _shutterState]];
  [(CAMDynamicShutterControl *)self settings];
  [(CAMDynamicShutterControl *)self settings];
  if ((v3 & (v7 == 1)) != 0) {
    double v4 = 1.0;
  }
  else {
    double v4 = (double)((v6 == 1) & ~v3);
  }
  double v5 = [(CAMDynamicShutterControl *)self _innerShapeColorIsRedSpring];
  [v5 setTarget:v4];
}

- (void)_updateInnerShapeAlphaTarget
{
  unint64_t v3 = [(CAMDynamicShutterControl *)self _innerShapeState];
  if (v3 >= 2)
  {
    if (v3 != 2) {
      return;
    }
    double v4 = [(CAMDynamicShutterControl *)self _innerShapeAlphaSpring];
    double v5 = 0.0;
  }
  else
  {
    double v4 = [(CAMDynamicShutterControl *)self _innerShapeAlphaSpring];
    double v5 = 1.0;
  }
  id v6 = v4;
  [v4 setTarget:v5];
}

- (void)_updateDrawLockUITarget
{
  BOOL v3 = [(CAMDynamicShutterControl *)self _isStartStopShutterState:[(CAMDynamicShutterControl *)self _shutterState]];
  int64_t v4 = [(CAMDynamicShutterControl *)self _shutterState];
  BOOL v5 = [(CAMDynamicShutterControl *)self _isExternalShutterPressed];
  BOOL v6 = [(CAMDynamicShutterControl *)self _isDraggingEnabled];
  if (!v3 || v4 == 5 || v5 || !v6) {
    goto LABEL_8;
  }
  unint64_t v7 = [(CAMDynamicShutterControl *)self _dragHandleState];
  if (v7 > 8) {
    return;
  }
  if (((1 << v7) & 0xF8) != 0)
  {
    BOOL v8 = [(CAMDynamicShutterControl *)self _drawLockUISpring];
    double v9 = 1.0;
  }
  else
  {
LABEL_8:
    BOOL v8 = [(CAMDynamicShutterControl *)self _drawLockUISpring];
    double v9 = 0.0;
  }
  id v10 = v8;
  [v8 setTarget:v9];
}

- (void)_updateExpandLockRingTarget
{
  unint64_t v3 = [(CAMDynamicShutterControl *)self _dragHandleState];
  if (v3 - 4 >= 5)
  {
    if (v3 > 3) {
      return;
    }
    int64_t v4 = [(CAMDynamicShutterControl *)self _expandLockRingSpring];
    double v5 = 0.0;
  }
  else
  {
    int64_t v4 = [(CAMDynamicShutterControl *)self _expandLockRingSpring];
    double v5 = 1.0;
  }
  id v6 = v4;
  [v4 setTarget:v5];
}

- (void)_updatePauseResumeDrawTarget
{
  double v3 = 0.0;
  if ([(CAMDynamicShutterControl *)self privateSettings])
  {
    if (([(CAMDynamicShutterControl *)self _shutterState] & 0xFFFFFFFFFFFFFFFELL) == 2) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  id v4 = [(CAMDynamicShutterControl *)self _drawPauseResumeUISpring];
  [v4 setTarget:v3];
}

- (void)_updatePausedDuringVideoTarget
{
  double v3 = 0.0;
  if ([(CAMDynamicShutterControl *)self privateSettings])
  {
    if ([(CAMDynamicShutterControl *)self isPausedDuringVideo]) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  id v4 = [(CAMDynamicShutterControl *)self _pausedDuringVideoSpring];
  [v4 setTarget:v3];
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_dragHandleColor
{
  [(CAMDynamicShutterControl *)self _innerShapeColor];
  CAMLiquidShutterColorForShutterColor(0);
  double v3 = [(CAMDynamicShutterControl *)self _dragHandleColorIsWhiteSpring];
  [v3 value];

  CEKInterpolate();
  double v5 = v4;
  CEKInterpolate();
  double v7 = v6;
  CEKInterpolate();
  double v9 = v8;
  id v10 = [(CAMDynamicShutterControl *)self _dragHandleAlphaSpring];
  [v10 value];
  double v12 = v11;

  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v12;
  result.var3 = v16;
  result.BOOL var2 = v15;
  result.double var1 = v14;
  result.var0 = v13;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_innerShapeColor
{
  CAMLiquidShutterColorForShutterColor(0);
  CAMLiquidShutterColorForShutterColor(1);
  double v3 = [(CAMDynamicShutterControl *)self _innerShapeColorIsRedSpring];
  [v3 value];

  CEKInterpolate();
  double v5 = v4;
  CEKInterpolate();
  double v7 = v6;
  CEKInterpolate();
  double v9 = v8;
  id v10 = [(CAMDynamicShutterControl *)self _innerShapeAlphaSpring];
  [v10 value];
  double v12 = v11;

  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v12;
  result.var3 = v16;
  result.BOOL var2 = v15;
  result.double var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)_updateRendererShapes
{
  [(CAMDynamicShutterControl *)self _shutterButtonCenter];
  double v4 = v3;
  double v6 = v5;
  [(CAMDynamicShutterControl *)self _dragHandleXPosition];
  double v8 = v7;
  [(CAMDynamicShutterControl *)self _innerShapeColor];
  uint64_t v50 = v10;
  uint64_t v51 = v9;
  uint64_t v48 = v12;
  uint64_t v49 = v11;
  double v13 = [(CAMDynamicShutterControl *)self _metalView];
  -[CAMDynamicShutterControl convertPoint:toView:](self, "convertPoint:toView:", v13, v4, v6);
  uint64_t v46 = v15;
  uint64_t v47 = v14;

  double v16 = [(CAMDynamicShutterControl *)self _innerShapePowerSpring];
  [v16 value];
  uint64_t v45 = v17;

  double v18 = [(CAMDynamicShutterControl *)self _innerShapeWidthSpring];
  [v18 value];
  uint64_t v20 = v19;

  [(CAMDynamicShutterControl *)self _dragHandleColor];
  uint64_t v44 = v21;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  long long v28 = [(CAMDynamicShutterControl *)self _metalView];
  -[CAMDynamicShutterControl convertPoint:toView:](self, "convertPoint:toView:", v28, v8, v6);
  uint64_t v30 = v29;
  uint64_t v32 = v31;

  BOOL v33 = [(CAMDynamicShutterControl *)self _dragHandleWidthSpring];
  [v33 value];
  uint64_t v35 = v34;

  uint64_t v36 = [(CAMDynamicShutterControl *)self _liquidShutterRenderer];
  v53[0] = v47;
  v53[1] = v46;
  v53[2] = v20;
  v53[3] = v51;
  v53[4] = v50;
  v53[5] = v49;
  v53[6] = v48;
  v53[7] = v45;
  [v36 setCenterShape:v53];

  uint64_t v37 = [(CAMDynamicShutterControl *)self _liquidShutterRenderer];
  v52[0] = v30;
  v52[1] = v32;
  v52[2] = v35;
  v52[3] = v44;
  v52[4] = v23;
  v52[5] = v25;
  v52[6] = v27;
  v52[7] = 0x4000000000000000;
  [v37 setDragHandleShape:v52];

  BOOL v38 = [(CAMDynamicShutterControl *)self _isDraggingEnabled];
  long long v39 = [(CAMDynamicShutterControl *)self _liquidShutterRenderer];
  [v39 setShowDragHandle:v38];

  BOOL v40 = [(CAMDynamicShutterControl *)self showContrastBorder];
  if (v40)
  {
    long long v39 = [(CAMDynamicShutterControl *)self traitCollection];
    [v39 displayScale];
    double v42 = v41;
  }
  else
  {
    double v42 = 0.0;
  }
  long long v43 = [(CAMDynamicShutterControl *)self _liquidShutterRenderer];
  [v43 setShadowSize:v42];

  if (v40) {
}
  }

- (void)_updateViewsFromCurrentState
{
  [(CAMDynamicShutterControl *)self _updateCenterButton];
  [(CAMDynamicShutterControl *)self _updateLeftLine];
  [(CAMDynamicShutterControl *)self _updateRightLine];
  [(CAMDynamicShutterControl *)self _updateLockUI];
  [(CAMDynamicShutterControl *)self _updatePauseResumeUI];
  [(CAMDynamicShutterControl *)self _updateCounterAlpha];
}

- (void)_updateLeftLine
{
  unint64_t v3 = [(CAMDynamicShutterControl *)self _shutterState];
  if (v3 - 2 >= 4)
  {
    if (v3 <= 1)
    {
      double v5 = [(CAMDynamicShutterControl *)self _leftLineView];
      double v6 = 1.0;
      [v5 setAlpha:1.0];

      if (![(CAMDynamicShutterControl *)self showContrastBorder]) {
        double v6 = 0.0;
      }
      double v7 = [(CAMDynamicShutterControl *)self _leftLineLegibilityView];
      [v7 setAlpha:v6];

      [(CAMDynamicShutterControl *)self _shutterButtonCenter];
      double v9 = v8;
      [(CAMDynamicShutterControl *)self _shutterButtonSpec];
      [(CAMDynamicShutterControl *)self _dragHandleXPosition];
      double v11 = fmax(v9 + v27 * -0.5 - v10, 0.0);
      [(CAMDynamicShutterControl *)self _dragHandleXPosition];
      double v13 = v12;
      [(CAMDynamicShutterControl *)self _shutterButtonCenter];
      double v15 = v14 + -0.5;
      double v16 = [(CAMDynamicShutterControl *)self _leftLineView];
      objc_msgSend(v16, "setFrame:", v13, v15, v11, 1.0);

      UIRectInset();
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      uint64_t v25 = [(CAMDynamicShutterControl *)self _leftLineLegibilityView];
      objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);
    }
  }
  else
  {
    double v4 = [(CAMDynamicShutterControl *)self _leftLineView];
    [v4 setAlpha:0.0];

    id v26 = [(CAMDynamicShutterControl *)self _leftLineLegibilityView];
    [v26 setAlpha:0.0];
  }
}

- (void)_updateRightLine
{
  if ([(CAMDynamicShutterControl *)self _dragHandleState] == 1
    || ![(CAMDynamicShutterControl *)self _isStartStopShutterState:[(CAMDynamicShutterControl *)self _shutterState]])
  {
    uint64_t v31 = [(CAMDynamicShutterControl *)self _rightLineView];
    [v31 setAlpha:0.0];

    id v32 = [(CAMDynamicShutterControl *)self _rightLineLegibilityView];
    [v32 setAlpha:0.0];
  }
  else
  {
    double v3 = 4.0 - CAMPixelWidthForView(self);
    [(CAMDynamicShutterControl *)self _shutterButtonCenter];
    double v5 = v4;
    [(CAMDynamicShutterControl *)self _shutterButtonSpec];
    double v6 = v3 + v5 + v33 * 0.5;
    [(CAMDynamicShutterControl *)self _dragHandleXPosition];
    if (v6 < v7) {
      double v6 = v7;
    }
    [(CAMDynamicShutterControl *)self _shutterButtonCenter];
    double v9 = v8 + -0.5;
    [(CAMDynamicShutterControl *)self _lockButtonInactiveSpec];
    [(CAMDynamicShutterControl *)self _lockButtonActiveSpec];
    double v10 = [(CAMDynamicShutterControl *)self _expandLockRingSpring];
    [v10 value];
    CEKInterpolate();
    double v12 = v11;

    [(CAMDynamicShutterControl *)self _lockButtonCenter];
    double v14 = v13 + v12 * -0.5 - v3 - v6;
    double v15 = [(CAMDynamicShutterControl *)self _drawLockUISpring];
    [v15 value];
    double v17 = v16 * v14;

    double v18 = [(CAMDynamicShutterControl *)self _rightLineView];
    objc_msgSend(v18, "setFrame:", v6, v9, fmax(v17, 0.0), 1.0);

    UIRectInset();
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v27 = [(CAMDynamicShutterControl *)self _rightLineLegibilityView];
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    long long v28 = [(CAMDynamicShutterControl *)self _rightLineView];
    [v28 setAlpha:0.5];

    if ([(CAMDynamicShutterControl *)self showContrastBorder]) {
      double v29 = 0.5;
    }
    else {
      double v29 = 0.0;
    }
    uint64_t v30 = [(CAMDynamicShutterControl *)self _rightLineLegibilityView];
    [v30 setAlpha:v29];
  }
}

- (void)_updateLockUI
{
  double v3 = [(CAMDynamicShutterControl *)self _drawLockUISpring];
  [v3 value];

  double v4 = [(CAMDynamicShutterControl *)self _expandLockRingSpring];
  [v4 value];

  CEKInterpolate();
  CEKInterpolate();
  double v6 = v5;
  double v7 = [(CAMDynamicShutterControl *)self _lockButtonOuterView];
  [v7 setAlpha:v6];

  if (![(CAMDynamicShutterControl *)self showContrastBorder]) {
    double v6 = 0.0;
  }
  double v8 = [(CAMDynamicShutterControl *)self _lockButtonOuterLegibilityView];
  [v8 setAlpha:v6];

  [(CAMDynamicShutterControl *)self _lockButtonInactiveSpec];
  [(CAMDynamicShutterControl *)self _lockButtonActiveSpec];
  CEKInterpolate();
  CEKInterpolate();
  double v10 = v9;
  double v11 = v9 * 0.5;
  double v12 = [(CAMDynamicShutterControl *)self _lockButtonOuterView];
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v10, v10);

  double v13 = [(CAMDynamicShutterControl *)self _lockButtonOuterView];
  double v14 = [v13 layer];
  [v14 setCornerRadius:v11];

  UIRectInset();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = [(CAMDynamicShutterControl *)self _lockButtonOuterLegibilityView];
  objc_msgSend(v23, "setBounds:", v16, v18, v20, v22);

  double v24 = [(CAMDynamicShutterControl *)self _lockButtonOuterLegibilityView];
  double v25 = [v24 layer];
  [v25 setCornerRadius:v11 + 1.0];

  [(CAMDynamicShutterControl *)self _lockButtonInactiveSpec];
  [(CAMDynamicShutterControl *)self _lockButtonActiveSpec];
  CEKInterpolate();
  double v27 = v26;
  long long v28 = [(CAMDynamicShutterControl *)self _lockButtonOuterView];
  double v29 = [v28 layer];
  [v29 setBorderWidth:v27];

  [(CAMDynamicShutterControl *)self _updateLockGlyphTransformAndAlpha];
}

- (void)_updatePauseResumeUI
{
  double v3 = [(CAMDynamicShutterControl *)self _drawPauseResumeUISpring];
  [v3 value];
  double v5 = v4;

  double v6 = [(CAMDynamicShutterControl *)self _pausedDuringVideoSpring];
  [v6 value];

  CEKInterpolateClamped();
  CGFloat v8 = v7;
  CEKInterpolateClamped();
  CGFloat v45 = v9;
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  double InnerCircleDiameter = CAMShutterButtonSpecGetInnerCircleDiameter(v56);
  [(CAMDynamicShutterControl *)self _pauseResumeButtonSpec];
  CAMShutterButtonSpecGetInnerCircleDiameter(v55);
  CEKInterpolateClamped();
  CEKProgressClamped();
  [(CAMDynamicShutterControl *)self _pauseResumeButtonSpec];
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  CEKInterpolateClamped();
  CEKInterpolateClamped();
  double v12 = v11;
  [(CAMDynamicShutterControl *)self _pauseResumeButtonSpec];
  [(CAMDynamicShutterControl *)self _shutterButtonSpec];
  CEKInterpolateClamped();
  double v14 = v13;
  [(CAMDynamicShutterControl *)self _pauseResumeButtonCenter];
  double v16 = v15;
  double v18 = v17;
  double v19 = [(CAMDynamicShutterControl *)self _pauseResumeButtonOuterView];
  objc_msgSend(v19, "setCenter:", v16, v18);

  double v20 = [(CAMDynamicShutterControl *)self _pauseResumeButtonOuterView];
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, v12, v12);

  double v21 = [(CAMDynamicShutterControl *)self _pauseResumeButtonOuterView];
  double v22 = [v21 layer];
  [v22 setCornerRadius:v12 * 0.5];

  double v23 = [(CAMDynamicShutterControl *)self _pauseResumeButtonOuterView];
  double v24 = [v23 layer];
  [v24 setBorderWidth:v14];

  double v25 = [(CAMDynamicShutterControl *)self _pauseResumeButtonOuterView];
  [v25 setAlpha:v5 * v5];

  double v26 = [(CAMDynamicShutterControl *)self _pauseResumeButtonLegibilityView];
  objc_msgSend(v26, "setCenter:", v16, v18);

  double v27 = [(CAMDynamicShutterControl *)self _pauseResumeButtonLegibilityView];
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v12 + 2.0, v12 + 2.0);

  long long v28 = [(CAMDynamicShutterControl *)self _pauseResumeButtonLegibilityView];
  double v29 = [v28 layer];
  [v29 setCornerRadius:(v12 + 2.0) * 0.5];

  if ([(CAMDynamicShutterControl *)self showContrastBorder]) {
    double v30 = v5 * v5;
  }
  else {
    double v30 = 0.0;
  }
  uint64_t v31 = [(CAMDynamicShutterControl *)self _pauseResumeButtonLegibilityView];
  [v31 setAlpha:v30];

  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeScale(&v54, v8, v8);
  memset(&v53, 0, sizeof(v53));
  CGAffineTransformMakeScale(&v53, v45, v45);
  memset(&v52, 0, sizeof(v52));
  CAMOrientationTransform([(CAMDynamicShutterControl *)self orientation], (uint64_t)&v52);
  id v32 = [(CAMDynamicShutterControl *)self _pauseImageView];
  objc_msgSend(v32, "setCenter:", v16, v18);

  CEKInterpolateClamped();
  double v34 = v33;
  uint64_t v35 = [(CAMDynamicShutterControl *)self _pauseImageView];
  [v35 setAlpha:v34];

  CGAffineTransform t1 = v52;
  CGAffineTransform t2 = v54;
  CGAffineTransformConcat(&v51, &t1, &t2);
  uint64_t v36 = [(CAMDynamicShutterControl *)self _pauseImageView];
  CGAffineTransform v48 = v51;
  [v36 setTransform:&v48];

  uint64_t v37 = [(CAMDynamicShutterControl *)self _resumeCircleView];
  objc_msgSend(v37, "setCenter:", v16, v18);

  BOOL v38 = [(CAMDynamicShutterControl *)self _resumeCircleView];
  objc_msgSend(v38, "setBounds:", 0.0, 0.0, InnerCircleDiameter, InnerCircleDiameter);

  long long v39 = [(CAMDynamicShutterControl *)self _resumeCircleView];
  BOOL v40 = [v39 layer];
  [v40 setCornerRadius:InnerCircleDiameter * 0.5];

  CEKInterpolateClamped();
  double v42 = v41;
  long long v43 = [(CAMDynamicShutterControl *)self _resumeCircleView];
  [v43 setAlpha:v42];

  CGAffineTransform v47 = v53;
  uint64_t v44 = [(CAMDynamicShutterControl *)self _resumeCircleView];
  CGAffineTransform v46 = v47;
  [v44 setTransform:&v46];
}

- (void)_updateLockGlyphTransformAndAlpha
{
  double v3 = [(CAMDynamicShutterControl *)self _drawLockUISpring];
  [v3 value];
  double v5 = v4;

  double v6 = [(CAMDynamicShutterControl *)self _expandLockRingSpring];
  [v6 value];
  double v8 = v7;

  int64_t v9 = [(CAMDynamicShutterControl *)self _dragHandleState];
  if (v9 == 6) {
    double v10 = v8;
  }
  else {
    double v10 = 0.0;
  }
  if (v9 == 3) {
    double v11 = v5 * (1.0 - v8);
  }
  else {
    double v11 = v10;
  }
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeScale(&v21, v11, v11);
  memset(&v20, 0, sizeof(v20));
  CAMOrientationTransform([(CAMDynamicShutterControl *)self orientation], (uint64_t)&v20);
  CEKInterpolateClamped();
  double v13 = v12;
  double v14 = [(CAMDynamicShutterControl *)self _videoLockImageView];
  [v14 setAlpha:v13];

  CGAffineTransform t1 = v20;
  CGAffineTransform t2 = v21;
  CGAffineTransformConcat(&v19, &t1, &t2);
  double v15 = [(CAMDynamicShutterControl *)self _videoLockImageView];
  CGAffineTransform v16 = v19;
  [v15 setTransform:&v16];
}

- (void)_updateCounterAlpha
{
  double v3 = 0.0;
  if (![(CAMDynamicShutterControl *)self _isStartStopShutterState:[(CAMDynamicShutterControl *)self _shutterState]])
  {
    double v4 = [(CAMDynamicShutterControl *)self _innerShapeAlphaSpring];
    [v4 value];
    double v3 = 1.0 - v5;
  }
  id v6 = [(CAMDynamicShutterControl *)self _counterLabel];
  [v6 setAlpha:v3];
}

- (void)metalViewDidChangeDrawableSize:(id)a3
{
  double v4 = [(CAMDynamicShutterControl *)self _liquidShutterRenderer];
  [v4 markNeedsRender];

  id v5 = [(CAMDynamicShutterControl *)self _displayLink];
  [v5 setPaused:0];
}

- (CAMDynamicShutterControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMDynamicShutterControlDelegate *)WeakRetained;
}

- ($76EADD4ED24426C67044446678BAA581)settings
{
  long long v3 = *(_OWORD *)&self[16].var1;
  *(_OWORD *)&retstr->BOOL var4 = *(_OWORD *)&self[15].var8;
  *(_OWORD *)&retstr->var6 = v3;
  retstr->int64_t var8 = self[16].var3;
  long long v4 = *(_OWORD *)&self[15].var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[15].var4;
  *(_OWORD *)&retstr->BOOL var2 = v4;
  return self;
}

- (BOOL)isSpinning
{
  return self->_spinning;
}

- (BOOL)isZooming
{
  return self->_zooming;
}

- (void)setZooming:(BOOL)a3
{
  self->_zooming = a3;
}

- (BOOL)showContrastBorder
{
  return self->_showContrastBorder;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (BOOL)isPausedDuringVideo
{
  return self->_pausedDuringVideo;
}

- (void)setPausedDuringVideo:(BOOL)a3
{
  self->_pausedDuringVideo = a3;
}

- (double)lockButtonCenterRightInset
{
  return self->_lockButtonCenterRightInset;
}

- (double)pauseResumeButtonCenterLeftInset
{
  return self->_pauseResumeButtonCenterLeftInset;
}

- (void)setPauseResumeButtonCenterLeftInset:(double)a3
{
  self->_pauseResumeButtonCenterLeftInset = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CADisplayLink)_displayLink
{
  return self->__displayLink;
}

- (CEKDisplayLinkTarget)_displayLinkTarget
{
  return self->__displayLinkTarget;
}

- (CAMLiquidShutterRenderer)_liquidShutterRenderer
{
  return self->__liquidShutterRenderer;
}

- (CAMMetalView)_metalView
{
  return self->__metalView;
}

- (UIView)_centerOuterView
{
  return self->__centerOuterView;
}

- (UIImageView)_centerOuterImageView
{
  return self->__centerOuterImageView;
}

- (void)set_centerOuterImageView:(id)a3
{
}

- (UIView)_centerOuterLegibilityView
{
  return self->__centerOuterLegibilityView;
}

- (CAMTimelapseShutterRingView)_centerTimelapseOuterView
{
  return self->__centerTimelapseOuterView;
}

- (void)set_centerTimelapseOuterView:(id)a3
{
}

- (UIView)_lockButtonOuterView
{
  return self->__lockButtonOuterView;
}

- (UIView)_lockButtonOuterLegibilityView
{
  return self->__lockButtonOuterLegibilityView;
}

- (UIImageView)_videoLockImageView
{
  return self->__videoLockImageView;
}

- (UIView)_pauseResumeButtonOuterView
{
  return self->__pauseResumeButtonOuterView;
}

- (UIView)_pauseResumeButtonLegibilityView
{
  return self->__pauseResumeButtonLegibilityView;
}

- (UIImageView)_pauseImageView
{
  return self->__pauseImageView;
}

- (UIView)_resumeCircleView
{
  return self->__resumeCircleView;
}

- (UIView)_leftLineView
{
  return self->__leftLineView;
}

- (UIView)_leftLineLegibilityView
{
  return self->__leftLineLegibilityView;
}

- (UIView)_rightLineView
{
  return self->__rightLineView;
}

- (UIView)_rightLineLegibilityView
{
  return self->__rightLineLegibilityView;
}

- (UILabel)_counterLabel
{
  return self->__counterLabel;
}

- (UIView)_spinnerView
{
  return self->__spinnerView;
}

- (void)set_spinnerView:(id)a3
{
}

- (CAMShutterButtonSpec)_shutterButtonSpec
{
  long long v3 = *(_OWORD *)&self[24].outerRingStrokeWidth;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[23].interRingSpacing;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[24].stopSquareCornerRadius;
  return self;
}

- (CAMShutterButtonSpec)_lockButtonActiveSpec
{
  long long v3 = *(_OWORD *)&self[25].outerRingStrokeWidth;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[24].interRingSpacing;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[25].stopSquareCornerRadius;
  return self;
}

- (CAMShutterButtonSpec)_pauseResumeButtonSpec
{
  long long v3 = *(_OWORD *)&self[26].outerRingStrokeWidth;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[25].interRingSpacing;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[26].stopSquareCornerRadius;
  return self;
}

- (CAMShutterButtonSpec)_lockButtonInactiveSpec
{
  long long v3 = *(_OWORD *)&self[27].outerRingStrokeWidth;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[26].interRingSpacing;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[27].stopSquareCornerRadius;
  return self;
}

- (double)_touchBeganTime
{
  return self->__touchBeganTime;
}

- (void)_setTouchBeganTime:(double)a3
{
  self->__touchBeganTime = a3;
}

- (int64_t)_touchSequencePhase
{
  return self->__touchSequencePhase;
}

- (void)_setTouchSequencePhase:(int64_t)a3
{
  self->__touchSequencePhase = a3;
}

- ($E50CC26D34D0158E20D4445E4757B7F2)_firstTouch
{
  long long v3 = *(_OWORD *)&self[28].var0.y;
  retstr->var0 = *(CGPoint *)&self[27].var2;
  *(_OWORD *)&retstr->double var1 = v3;
  return self;
}

- ($E50CC26D34D0158E20D4445E4757B7F2)_mostRecentTouch
{
  long long v3 = *(_OWORD *)&self[29].var0.y;
  retstr->var0 = *(CGPoint *)&self[28].var2;
  *(_OWORD *)&retstr->double var1 = v3;
  return self;
}

- (void)_setMostRecentTouch:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var1;
  self->$2BE7AFF22295DED6A45A0E44EF7D16DF::point = a3->var0;
  *(_OWORD *)&self->$2BE7AFF22295DED6A45A0E44EF7D16DF::time = v3;
}

- (CAMDynamicShutterGestureRecognizer)_gestureRecognizer
{
  return self->__gestureRecognizer;
}

- (BOOL)_didCancelZoomForCurrentGesture
{
  return self->__didCancelZoomForCurrentGesture;
}

- (void)set_didCancelZoomForCurrentGesture:(BOOL)a3
{
  self->__didCancelZoomForCurrentGesture = a3;
}

- (double)_initalZoomGestureOffsetY
{
  return self->__initalZoomGestureOffsetY;
}

- (void)set_initalZoomGestureOffsetY:(double)a3
{
  self->__initalZoomGestureOffsetY = a3;
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (int64_t)_shutterState
{
  return self->__shutterState;
}

- (int64_t)_dragHandleState
{
  return self->__dragHandleState;
}

- (int64_t)_innerShapeState
{
  return self->__innerShapeState;
}

- (BOOL)_isExternalShutterPressed
{
  return self->__externalShutterPressed;
}

- (int64_t)_externalShutterLongPressBehavior
{
  return self->__externalShutterLongPressBehavior;
}

- (void)set_externalShutterLongPressBehavior:(int64_t)a3
{
  self->__externalShutterLongPressBehavior = a3;
}

- (BOOL)_isExternalLockButtonPressed
{
  return self->__externalLockButtonPressed;
}

- (void)_setExternalLockButtonPressed:(BOOL)a3
{
  self->__externalLockButtonPressed = a3;
}

- (int64_t)_counterValue
{
  return self->__counterValue;
}

- (BOOL)_shouldCheckTouchUpEvents
{
  return self->__shouldCheckTouchUpEvents;
}

- (void)set_shouldCheckTouchUpEvents:(BOOL)a3
{
  self->__shouldCheckTouchUpEvents = a3;
}

- (BOOL)_ignoreNextCancelledGesture
{
  return self->__ignoreNextCancelledGesture;
}

- (void)_setIgnoreNextCancelledGesture:(BOOL)a3
{
  self->__ignoreNextCancelledGesture = a3;
}

- (NSArray)_springs
{
  return self->__springs;
}

- (CAMTrackingSpring)_dragHandleOffsetSpring
{
  return self->__dragHandleOffsetSpring;
}

- (CAMSpring)_dragHandleWidthSpring
{
  return self->__dragHandleWidthSpring;
}

- (CAMSpring)_dragHandleColorIsWhiteSpring
{
  return self->__dragHandleColorIsWhiteSpring;
}

- (CAMSpring)_dragHandleAlphaSpring
{
  return self->__dragHandleAlphaSpring;
}

- (CAMSpring)_innerShapeWidthSpring
{
  return self->__innerShapeWidthSpring;
}

- (CAMSpring)_innerShapePowerSpring
{
  return self->__innerShapePowerSpring;
}

- (CAMSpring)_innerShapeColorIsRedSpring
{
  return self->__innerShapeColorIsRedSpring;
}

- (CAMSpring)_innerShapeAlphaSpring
{
  return self->__innerShapeAlphaSpring;
}

- (CAMSpring)_drawLockUISpring
{
  return self->__drawLockUISpring;
}

- (CAMSpring)_expandLockRingSpring
{
  return self->__expandLockRingSpring;
}

- (CAMSpring)_drawPauseResumeUISpring
{
  return self->__drawPauseResumeUISpring;
}

- (CAMSpring)_pausedDuringVideoSpring
{
  return self->__pausedDuringVideoSpring;
}

- (double)_longPressVideoDuration
{
  return self->__longPressVideoDuration;
}

- (void)set_longPressVideoDuration:(double)a3
{
  self->__longPressVideoDuration = a3;
}

- (double)_externalLongPressVideoDuration
{
  return self->__externalLongPressVideoDuration;
}

- (void)set_externalLongPressVideoDuration:(double)a3
{
  self->__externalLongPressVideoDuration = a3;
}

- ($E5C720D6BB068A42F0C2CD001350366C)privateSettings
{
  return ($E5C720D6BB068A42F0C2CD001350366C)self->_privateSettings.allowPauseResume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pausedDuringVideoSpring, 0);
  objc_storeStrong((id *)&self->__drawPauseResumeUISpring, 0);
  objc_storeStrong((id *)&self->__expandLockRingSpring, 0);
  objc_storeStrong((id *)&self->__drawLockUISpring, 0);
  objc_storeStrong((id *)&self->__innerShapeAlphaSpring, 0);
  objc_storeStrong((id *)&self->__innerShapeColorIsRedSpring, 0);
  objc_storeStrong((id *)&self->__innerShapePowerSpring, 0);
  objc_storeStrong((id *)&self->__innerShapeWidthSpring, 0);
  objc_storeStrong((id *)&self->__dragHandleAlphaSpring, 0);
  objc_storeStrong((id *)&self->__dragHandleColorIsWhiteSpring, 0);
  objc_storeStrong((id *)&self->__dragHandleWidthSpring, 0);
  objc_storeStrong((id *)&self->__dragHandleOffsetSpring, 0);
  objc_storeStrong((id *)&self->__springs, 0);
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__gestureRecognizer, 0);
  objc_storeStrong((id *)&self->__spinnerView, 0);
  objc_storeStrong((id *)&self->__counterLabel, 0);
  objc_storeStrong((id *)&self->__rightLineLegibilityView, 0);
  objc_storeStrong((id *)&self->__rightLineView, 0);
  objc_storeStrong((id *)&self->__leftLineLegibilityView, 0);
  objc_storeStrong((id *)&self->__leftLineView, 0);
  objc_storeStrong((id *)&self->__resumeCircleView, 0);
  objc_storeStrong((id *)&self->__pauseImageView, 0);
  objc_storeStrong((id *)&self->__pauseResumeButtonLegibilityView, 0);
  objc_storeStrong((id *)&self->__pauseResumeButtonOuterView, 0);
  objc_storeStrong((id *)&self->__videoLockImageView, 0);
  objc_storeStrong((id *)&self->__lockButtonOuterLegibilityView, 0);
  objc_storeStrong((id *)&self->__lockButtonOuterView, 0);
  objc_storeStrong((id *)&self->__centerTimelapseOuterView, 0);
  objc_storeStrong((id *)&self->__centerOuterLegibilityView, 0);
  objc_storeStrong((id *)&self->__centerOuterImageView, 0);
  objc_storeStrong((id *)&self->__centerOuterView, 0);
  objc_storeStrong((id *)&self->__metalView, 0);
  objc_storeStrong((id *)&self->__liquidShutterRenderer, 0);
  objc_storeStrong((id *)&self->__displayLinkTarget, 0);
  objc_storeStrong((id *)&self->__displayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setShutterState:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Dynamic Shutter: Attempted to enter counter mode directly from a start/stop mode", v1, 2u);
}

- (void)_setShutterState:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Dynamic Shutter: Attempted to enter a start/stop mode directly from the counter mode", v1, 2u);
}

@end
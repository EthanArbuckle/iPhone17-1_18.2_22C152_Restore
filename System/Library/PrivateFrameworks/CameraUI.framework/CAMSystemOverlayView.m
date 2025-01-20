@interface CAMSystemOverlayView
+ (void)_applyGainModulationToElement:(id)a3 withInputAmount:(id)a4;
- (BOOL)_backgroundHintNeedsReset;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)halfPressEnabled;
- (BOOL)isHandleBarVisible;
- (BOOL)isSliderFeedbackDisabled;
- (BOOL)isSliderPresented;
- (BOOL)isSliderVisible;
- (CAFilter)_progressiveEdgeBlurFilter;
- (CAMOverlaySliderState)sliderState;
- (CAMScreenLuminanceObserverLayer)_screenLuminanceObserverLayer;
- (CAMSystemOverlaySlider)slider;
- (CAMSystemOverlaySlider)sliderIfLoaded;
- (CAMSystemOverlayView)initWithFrame:(CGRect)a3;
- (CAMSystemOverlayViewDelegate)delegate;
- (CAMSystemOverlayVisibility)_menuVisibility;
- (CAMutableMeshTransform)_dialEffectMesh;
- (CEKFluidBehaviorSettings)_backgroundAnimationSettings;
- (CEKFluidBehaviorSettings)_scaleSettings;
- (CGRect)_frameForButton;
- (CGRect)_frameForSliderVisible:(BOOL)a3 content:(int64_t)a4 scale:(double)a5;
- (CGSize)_valueTextSize;
- (DRPDropletAnimationCoordinator)_backgroundAnimator;
- (DRPDropletContainerView)_backgroundDroplet;
- (DRPDropletContextView)_backgroundContext;
- (UIGestureRecognizer)_touchingSliderGestureRecognizer;
- (UILabel)_valueLabel;
- (UIPanGestureRecognizer)_panGestureRecognizer;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (UIView)_handleBarView;
- (UIView)_hitTestingBackground;
- (UIView)_valueLabelContainer;
- (UIView)tipAnchor;
- (UIViewFloatAnimatableProperty)_sliderPresentationProgress;
- (UIViewFloatAnimatableProperty)_valueLabelPresentationProgress;
- (_TtC8CameraUI17OverlayMenuSlider)menu;
- (double)_dropletCenterYFromState:(id)a3 toState:(id)a4;
- (double)_dropletScale;
- (id)_blurFilter;
- (id)_createValueLabelProgressProperty;
- (id)_springAnimationWithKeyPath:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)overlaySlider:(id)a3 cellConfigurationForValue:(id)a4;
- (int64_t)orientation;
- (int64_t)sliderContent;
- (unint64_t)_buttonStage;
- (unint64_t)_sliderHideAnimationCount;
- (unint64_t)alignment;
- (void)_createHandleBarViewIfNeeded;
- (void)_createMenuIfNeeded;
- (void)_createSliderIfNeeded;
- (void)_createValueLabelIfNeeded;
- (void)_handlePan:(id)a3;
- (void)_handleSliderTap:(id)a3;
- (void)_handleTouchingMenu:(id)a3;
- (void)_handleTouchingSlider:(id)a3;
- (void)_resetDropletBackgroundIfNeededFromState:(id)a3 toState:(id)a4;
- (void)_setBackgroundAnimator:(id)a3;
- (void)_setBackgroundContainer:(id)a3;
- (void)_setBackgroundContext:(id)a3;
- (void)_setBackgroundHintNeedsReset:(BOOL)a3;
- (void)_setButtonStage:(unint64_t)a3;
- (void)_setDropletScale:(double)a3;
- (void)_setDropletScale:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5;
- (void)_setHandleBarView:(id)a3;
- (void)_setHitTestingBackground:(id)a3;
- (void)_setMenu:(id)a3;
- (void)_setPanGestureRecognizer:(id)a3;
- (void)_setSlider:(id)a3;
- (void)_setSliderContent:(int64_t)a3;
- (void)_setSliderContent:(int64_t)a3 animated:(BOOL)a4;
- (void)_setSliderHideAnimationCount:(unint64_t)a3;
- (void)_setSliderPresentationProgress:(id)a3;
- (void)_setSliderPresented:(BOOL)a3;
- (void)_setTapGestureRecognizer:(id)a3;
- (void)_setTouchingSliderGestureRecognizer:(id)a3;
- (void)_setValueLabel:(id)a3;
- (void)_setValueLabelContainer:(id)a3;
- (void)_setValueLabelPresentationProgress:(id)a3;
- (void)_setValueTextSize:(CGSize)a3;
- (void)_sliderContent:(int64_t)a3 blurred:(BOOL)a4;
- (void)_updateDropletBackgroundFromState:(id)a3 toState:(id)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (void)_updateScaleForSliderContent:(int64_t)a3 withMode:(int64_t)a4 sliderContentDidChange:(BOOL)a5 updateDropletScale:(BOOL)a6;
- (void)_updateValueLabelFont;
- (void)_updateValueLabelLayoutMetrics;
- (void)_updateValueLabelText;
- (void)_updateValueLabelTextWithForcedMeasurement:(BOOL)a3;
- (void)_updateValueLabelVisibility;
- (void)layoutSubviews;
- (void)overlayMenuSlider:(id)a3 didSelectControlAt:(int64_t)a4;
- (void)overlayMenuSliderDidEndScrolling:(id)a3;
- (void)overlayMenuSliderWillBeginScrolling:(id)a3;
- (void)overlaySliderDidChangeCurrentValue:(id)a3;
- (void)overlaySliderDidEndScrolling:(id)a3;
- (void)overlaySliderWillBeginScrolling:(id)a3;
- (void)performMenuPresentation:(unint64_t)a3;
- (void)reloadValueLabel;
- (void)setAlignment:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHalfPressEnabled:(BOOL)a3;
- (void)setHandleBarVisible:(BOOL)a3;
- (void)setHandleBarVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setSliderFeedbackDisabled:(BOOL)a3;
- (void)setSliderState:(id)a3;
- (void)setSliderState:(id)a3 animated:(BOOL)a4;
- (void)set_dropletScale:(double)a3;
- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4;
- (void)updateUIForButtonStage:(unint64_t)a3;
@end

@implementation CAMSystemOverlayView

- (CAMSystemOverlayView)initWithFrame:(CGRect)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)CAMSystemOverlayView;
  v3 = -[CAMSystemOverlayView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CAMSystemOverlayView *)v3 traitOverrides];
    [v5 setUserInterfaceStyle:2];

    v4->_orientation = 1;
    v4->_sliderContent = 0;
    v4->_alignment = 1;
    v6 = objc_alloc_init(CAMSystemOverlayVisibility);
    p_menuVisibility = (id *)&v4->__menuVisibility;
    menuVisibility = v4->__menuVisibility;
    v4->__menuVisibility = v6;

    [(CAMSystemOverlayVisibility *)v4->__menuVisibility setDelegate:v4];
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"systemOverlay.menuHidingDelayMilliseconds", @"com.apple.camera", 0);
    double v10 = (double)AppIntegerValue / 1000.0;
    if (AppIntegerValue <= 0) {
      double v10 = 2.0;
    }
    [*p_menuVisibility setDelayedHideDuration:v10];
    [*p_menuVisibility setName:@"MenuVisibility"];
    uint64_t v11 = +[CAMOverlaySliderState hiddenState];
    sliderState = v4->_sliderState;
    v4->_sliderState = (CAMOverlaySliderState *)v11;

    v26[0] = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    id v14 = (id)[(CAMSystemOverlayView *)v4 registerForTraitChanges:v13 withAction:sel__updateValueLabelFont];

    v15 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:v4 action:sel__handlePan_];
    [v15 _wantsGESEvents:1];
    [(CAMSystemOverlayView *)v4 addGestureRecognizer:v15];
    [(CAMSystemOverlayView *)v4 _setPanGestureRecognizer:v15];
    v4->__dropletScale = 1.0;
    v4->_halfPressEnabled = 1;
    v16 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    tipAnchor = v4->_tipAnchor;
    v4->_tipAnchor = v16;

    [(CAMSystemOverlayView *)v4 addSubview:v4->_tipAnchor];
    v18 = objc_alloc_init(CAMScreenLuminanceObserverLayer);
    screenLuminanceObserverLayer = v4->__screenLuminanceObserverLayer;
    v4->__screenLuminanceObserverLayer = v18;

    v20 = [(CAMSystemOverlayView *)v4 layer];
    [v20 addSublayer:v4->__screenLuminanceObserverLayer];

    objc_initWeak(&location, v4);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __38__CAMSystemOverlayView_initWithFrame___block_invoke;
    v22[3] = &unk_263FA0938;
    objc_copyWeak(&v23, &location);
    [(CAMScreenLuminanceObserverLayer *)v4->__screenLuminanceObserverLayer setGainModulationCallback:v22];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __38__CAMSystemOverlayView_initWithFrame___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = [NSNumber numberWithDouble:a2];
    v4 = [WeakRetained sliderIfLoaded];
    +[CAMSystemOverlayView _applyGainModulationToElement:v4 withInputAmount:v3];

    v5 = [WeakRetained menu];
    +[CAMSystemOverlayView _applyGainModulationToElement:v5 withInputAmount:v3];

    v6 = [WeakRetained _handleBarView];
    +[CAMSystemOverlayView _applyGainModulationToElement:v6 withInputAmount:v3];

    v7 = [WeakRetained _valueLabelContainer];
    +[CAMSystemOverlayView _applyGainModulationToElement:v7 withInputAmount:v3];
  }
}

- (void)layoutSubviews
{
  [(CAMSystemOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CAMSystemOverlayView *)self _backgroundContext];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(CAMSystemOverlayView *)self traitCollection];
  [v12 displayScale];

  uint64_t v13 = [(CAMSystemOverlayView *)self orientation];
  BOOL v14 = [(CAMSystemOverlayView *)self isSliderVisible];
  v15 = [(CAMSystemOverlayView *)self sliderIfLoaded];
  v16 = [(CAMSystemOverlayView *)self menu];
  v17 = [(CAMSystemOverlayView *)self _handleBarView];
  int64_t v18 = [(CAMSystemOverlayView *)self sliderContent];
  [(CAMSystemOverlayView *)self _frameForSliderVisible:v14 content:0 scale:1.0];
  double v19 = 0.0;
  CGRect v96 = CGRectInset(v95, 0.0, -16.0);
  CGFloat x = v96.origin.x;
  CGFloat y = v96.origin.y;
  CGFloat width = v96.size.width;
  CGFloat height = v96.size.height;
  if (v18) {
    double v19 = 20.0;
  }
  double v24 = v19 + CGRectGetMaxX(v96);
  v97.origin.CGFloat x = x;
  CGFloat v75 = y;
  v97.origin.CGFloat y = y;
  v97.size.CGFloat width = width;
  v97.size.CGFloat height = height;
  objc_msgSend(v15, "setCenter:", v24, CGRectGetMidY(v97));
  double v73 = width;
  CGFloat v74 = height;
  CEKRectWithSize();
  objc_msgSend(v15, "setBounds:");
  [(CAMSystemOverlayView *)self _frameForSliderVisible:v14 content:1 scale:1.0];
  CGRect v99 = CGRectInset(v98, 0.0, -16.0);
  CGFloat v25 = v99.origin.x;
  CGFloat v26 = v99.origin.y;
  CGFloat v27 = v99.size.width;
  CGFloat v28 = v99.size.height;
  double MaxX = CGRectGetMaxX(v99);
  v100.origin.CGFloat x = v25;
  v100.origin.CGFloat y = v26;
  v100.size.CGFloat width = v27;
  v100.size.CGFloat height = v28;
  objc_msgSend(v16, "setCenter:", MaxX, CGRectGetMidY(v100));
  CEKRectWithSize();
  objc_msgSend(v16, "setBounds:");
  v77 = [(CAMSystemOverlayView *)self _valueLabel];
  [(CAMSystemOverlayView *)self _valueTextSize];
  CEKRectWithSize();
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  memset(&v94, 0, sizeof(v94));
  CAMOrientationTransform(v13, (uint64_t)&v94);
  CGAffineTransform v93 = v94;
  v101.origin.CGFloat x = v31;
  CGFloat v79 = v35;
  CGFloat v80 = v33;
  v101.origin.CGFloat y = v33;
  v101.size.CGFloat width = v35;
  CGFloat v78 = v37;
  v101.size.CGFloat height = v37;
  CGRectApplyAffineTransform(v101, &v93);
  int64_t v38 = [(CAMSystemOverlayView *)self sliderContent];
  [(CAMSystemOverlayView *)self _dropletScale];
  -[CAMSystemOverlayView _frameForSliderVisible:content:scale:](self, "_frameForSliderVisible:content:scale:", v14, v38);
  CGFloat v39 = v102.origin.x;
  CGFloat v40 = v102.origin.y;
  CGFloat v41 = v102.size.width;
  CGFloat v42 = v102.size.height;
  CGRectGetMidY(v102);
  v103.origin.CGFloat x = v39;
  v103.origin.CGFloat y = v40;
  v103.size.CGFloat width = v41;
  v103.size.CGFloat height = v42;
  CGFloat v81 = v31;
  CGRectGetMidY(v103);
  if (v14 && [(CAMSystemOverlayView *)self isHandleBarVisible]) {
    double v43 = 0.5;
  }
  else {
    double v43 = 0.0;
  }
  double v76 = v43;
  unint64_t v44 = [(CAMSystemOverlayView *)self alignment];
  if (v44 == 1)
  {
    if (v14)
    {
      v106.origin.CGFloat x = v39;
      v106.origin.CGFloat y = v40;
      v106.size.CGFloat width = v41;
      v106.size.CGFloat height = v42;
      CGRectGetMinX(v106);
    }
    v107.origin.CGFloat x = v39;
    v107.origin.CGFloat y = v40;
    v107.size.CGFloat width = v41;
    v107.size.CGFloat height = v42;
    CGRectGetMinX(v107);
  }
  else if (!v44)
  {
    if (v14)
    {
      v104.origin.CGFloat x = v39;
      v104.origin.CGFloat y = v40;
      v104.size.CGFloat width = v41;
      v104.size.CGFloat height = v42;
      CGRectGetMaxX(v104);
    }
    v105.origin.CGFloat x = v39;
    v105.origin.CGFloat y = v40;
    v105.size.CGFloat width = v41;
    v105.size.CGFloat height = v42;
    CGRectGetMaxX(v105);
  }
  v45 = [(CAMSystemOverlayView *)self _valueLabelContainer];
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v45, "setCenter:");
  CGAffineTransform v92 = v94;
  [v45 setTransform:&v92];
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v17, "setCenter:");
  objc_msgSend(v17, "setBounds:", 0.0, 0.0, 3.0, 53.0);
  v46 = [v17 layer];
  [v46 setCornerRadius:1.5];

  [(CAMSystemOverlayView *)self _frameForSliderVisible:1 content:[(CAMSystemOverlayView *)self sliderContent] scale:1.0];
  UIRectInsetEdges();
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  v55 = [(CAMSystemOverlayView *)self _hitTestingBackground];
  objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

  uint64_t v56 = v13;
  BOOL v57 = v13 == 1;
  v82 = v16;
  if (v14)
  {
    [v45 frame];
    double v58 = CGRectGetMinX(v108) + -20.0;
    double v59 = v75;
    double v60 = v74;
    double v61 = v8 - v73;
  }
  else
  {
    double v58 = *MEMORY[0x263F001A8];
    double v59 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v61 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v60 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v62 = [(CAMSystemOverlayView *)self _screenLuminanceObserverLayer];
  objc_msgSend(v62, "setFrame:", v58, v59, v61, v60);

  [MEMORY[0x263F158F8] commit];
  v63 = (void *)MEMORY[0x263F82E00];
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __38__CAMSystemOverlayView_layoutSubviews__block_invoke;
  v84[3] = &unk_263FA29F8;
  CGFloat v87 = v81;
  CGFloat v88 = v80;
  CGFloat v89 = v79;
  CGFloat v90 = v78;
  id v85 = v45;
  id v64 = v77;
  id v86 = v64;
  BOOL v91 = v57;
  id v65 = v45;
  [v63 performWithoutAnimation:v84];
  if (v56 == 1)
  {
    UIRectGetCenter();
    objc_msgSend(v64, "setCenter:");
  }
  v66 = [(CAMSystemOverlayView *)self tipAnchor];
  [(CAMSystemOverlayView *)self _frameForSliderVisible:0 content:0 scale:1.0];
  CGFloat v67 = v109.origin.x;
  CGFloat v68 = v109.origin.y;
  CGFloat v69 = v109.size.width;
  CGFloat v70 = v109.size.height;
  CGFloat v71 = CGRectGetMaxX(v109) + -10.0;
  v110.origin.CGFloat x = v67;
  v110.origin.CGFloat y = v68;
  v110.size.CGFloat width = v69;
  v110.size.CGFloat height = v70;
  objc_msgSend(v66, "setCenter:", v71, CGRectGetMidY(v110));
  CEKRectWithSize();
  objc_msgSend(v66, "setBounds:");
  if (v18) {
    unsigned int v72 = 0;
  }
  else {
    unsigned int v72 = v14;
  }
  if (!v18) {
    LODWORD(v14) = 0;
  }
  [v15 setAlpha:(double)v72];
  [v82 setAlpha:(double)v14];
  [v17 setAlpha:v76];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __38__CAMSystemOverlayView_layoutSubviews__block_invoke_2;
  v83[3] = &unk_263FA0208;
  v83[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v83];
}

uint64_t __38__CAMSystemOverlayView_layoutSubviews__block_invoke(uint64_t a1)
{
  CGRect v9 = CGRectInset(*(CGRect *)(a1 + 48), -5.0, 0.0);
  double x = v9.origin.x;
  double y = v9.origin.y;
  double width = v9.size.width;
  double height = v9.size.height;
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "setBounds:", x, y, width, height);
  if (!*(unsigned char *)(a1 + 80))
  {
    UIRectGetCenter();
    double v7 = *(void **)(a1 + 40);
    return objc_msgSend(v7, "setCenter:");
  }
  return result;
}

uint64_t __38__CAMSystemOverlayView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateValueLabelVisibility];
}

- (void)_updateValueLabelVisibility
{
  double v3 = [(CAMSystemOverlayView *)self _valueLabel];
  double v4 = [(CAMSystemOverlayView *)self sliderIfLoaded];
  uint64_t v5 = [v4 style];

  BOOL v6 = v5 == 6 && [(CAMSystemOverlayView *)self sliderContent] == 0;
  unsigned int v7 = [(CAMSystemOverlayView *)self isSliderVisible];
  double v8 = [(CAMSystemOverlayView *)self _valueLabelPresentationProgress];
  if ([(CAMSystemOverlayView *)self sliderContent] == 1)
  {
    CGRect v9 = [(CAMSystemOverlayView *)self delegate];
    double v10 = [(CAMSystemOverlayView *)self menu];
    int v11 = objc_msgSend(v9, "isControlEnabledAtIndex:", objc_msgSend(v10, "selectedControlIndex"));
  }
  else
  {
    CGRect v9 = [(CAMSystemOverlayView *)self sliderIfLoaded];
    int v11 = [v9 enabled];
  }

  if (v8)
  {
    [v8 presentationValue];
    double v13 = fmax(v12, 0.0);
  }
  else
  {
    double v13 = (double)v7;
  }
  if (v11)
  {
    BOOL v14 = [MEMORY[0x263F825C8] systemYellowColor];
    double v15 = 1.0;
  }
  else
  {
    BOOL v14 = [MEMORY[0x263F825C8] labelColor];
    double v15 = 0.4;
  }
  [v3 setTextColor:v14];

  if (v6) {
    double v15 = 0.0;
  }
  CGAffineTransformMakeScale(&v17, v13, v13);
  CGAffineTransform v16 = v17;
  [v3 setTransform:&v16];
  [v3 setAlpha:v13 * v15];
}

- (CGRect)_frameForSliderVisible:(BOOL)a3 content:(int64_t)a4 scale:(double)a5
{
  BOOL v6 = a3;
  if (a4 == 1)
  {
    double v9 = 31.0;
    double v8 = 220.0;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    if (!a4)
    {
      double v10 = [(CAMSystemOverlayView *)self sliderIfLoaded];
      uint64_t v11 = [v10 style];

      double v9 = 18.0;
      double v8 = 180.0;
      if (v11 == 6)
      {
        if ((unint64_t)([(CAMSystemOverlayView *)self orientation] - 1) >= 2) {
          double v9 = 22.0;
        }
        else {
          double v9 = 29.0;
        }
      }
    }
  }
  CGAffineTransformMakeScale(&v31, a5, a5);
  double v30 = v8 * v31.c + v31.a * v9;
  CEKRectWithSize();
  [(CAMSystemOverlayView *)self _frameForButton];
  double v12 = [(CAMSystemOverlayView *)self traitCollection];
  [v12 displayScale];
  uint64_t v29 = v13;
  UIRectCenteredYInRectScale();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  unint64_t v22 = [(CAMSystemOverlayView *)self alignment];
  if (v22 == 1)
  {
    [(CAMSystemOverlayView *)self bounds];
    double v25 = 0.0;
    if (v6) {
      double v25 = v30;
    }
    double v23 = v24 - v25;
  }
  else
  {
    double v23 = -v30;
    if (v6) {
      double v23 = 0.0;
    }
    if (v22) {
      double v23 = v15;
    }
  }
  double v26 = v17;
  double v27 = v19;
  double v28 = v21;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v23;
  return result;
}

- (CGRect)_frameForButton
{
  double v3 = +[CAMCaptureCapabilities capabilities];
  unint64_t v4 = [(CAMSystemOverlayView *)self alignment];
  if (v4 == 1)
  {
    [v3 frameForPhysicalButton:6];
    goto LABEL_5;
  }
  CGFloat height = 0.0;
  CGFloat width = 0.0;
  CGFloat y = 0.0;
  CGFloat x = 0.0;
  if (!v4)
  {
    [v3 frameForPhysicalButton:1];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [v3 frameForPhysicalButton:2];
    v28.origin.CGFloat x = v17;
    v28.origin.CGFloat y = v18;
    v28.size.CGFloat width = v19;
    v28.size.CGFloat height = v20;
    v25.origin.CGFloat x = v10;
    v25.origin.CGFloat y = v12;
    v25.size.CGFloat width = v14;
    v25.size.CGFloat height = v16;
    CGRect v26 = CGRectUnion(v25, v28);
LABEL_5:
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
  }

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CAMSystemOverlayView;
  -[CAMSystemOverlayView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (CAMSystemOverlayView *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5;
  if (v5 == self) {
    uint64_t v5 = 0;
  }
  unsigned int v7 = v5;

  return v7;
}

- (void)setAlignment:(unint64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    uint64_t v5 = [(CAMSystemOverlayView *)self sliderIfLoaded];
    [v5 setAlignment:a3];

    BOOL v6 = [(CAMSystemOverlayView *)self menu];
    [v6 setAlignment:a3];

    [(CAMSystemOverlayView *)self setNeedsLayout];
  }
}

- (BOOL)isSliderVisible
{
  v2 = [(CAMSystemOverlayView *)self sliderState];
  char v3 = [v2 _presented];

  return v3;
}

- (BOOL)isSliderPresented
{
  return self->_sliderPresented && [(CAMSystemOverlayView *)self isSliderVisible];
}

- (void)setSliderState:(id)a3
{
}

- (void)setSliderState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  if ([v16 isEqualToState:self->_sliderState]) {
    goto LABEL_12;
  }
  [(CAMSystemOverlayView *)self _createSliderIfNeeded];
  if (![v16 _presented]
    || [(CAMOverlaySliderState *)self->_sliderState _presented])
  {
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [(CAMSystemOverlayView *)self _createValueLabelIfNeeded];
  [(CAMSystemOverlayView *)self _updateValueLabelText];
  [(CAMSystemOverlayView *)self _createHandleBarViewIfNeeded];
  BOOL v6 = [(CAMSystemOverlayView *)self _menuVisibility];
  [v6 hideImmediately];

  [(CAMSystemOverlayView *)self _setSliderContent:0];
  if (v4)
  {
    [(CAMSystemOverlayView *)self layoutIfNeeded];
    unsigned int v7 = [(CAMSystemOverlayView *)self slider];
    [v7 performWaveAnimation];

LABEL_8:
    [(CAMSystemOverlayView *)self layoutIfNeeded];
    [(CAMSystemOverlayView *)self _resetDropletBackgroundIfNeededFromState:self->_sliderState toState:v16];
  }
LABEL_9:
  sliderState = self->_sliderState;
  objc_super v9 = (CAMOverlaySliderState *)v16;
  CGFloat v10 = self->_sliderState;
  self->_sliderState = v9;
  double v11 = sliderState;

  [(CAMSystemOverlayView *)self setNeedsLayout];
  [(CAMSystemOverlayView *)self _setSliderPresented:[(CAMOverlaySliderState *)v9 _presented] & !v4];
  CGFloat v12 = [(CAMSystemOverlayView *)self _sliderPresentationProgress];
  [v12 invalidate];

  [(CAMSystemOverlayView *)self _setSliderPresentationProgress:0];
  BOOL v13 = [(CAMSystemOverlayView *)self isSliderVisible];
  CGFloat v14 = [(CAMSystemOverlayView *)self _hitTestingBackground];
  double v15 = [v14 layer];
  [v15 setHitTestsAsOpaque:v13];

  [(CAMSystemOverlayView *)self _updateDropletBackgroundFromState:v11 toState:v9 animated:v4 interactive:0];
  LOBYTE(v9) = [(CAMOverlaySliderState *)v9 _presented];

  if ((v9 & 1) == 0) {
    [(CAMSystemOverlayView *)self setHandleBarVisible:0 animated:v4];
  }
  [(CAMSystemOverlayView *)self _updateScaleForSliderContent:0 withMode:3 sliderContentDidChange:0 updateDropletScale:0];
LABEL_12:
}

- (void)performMenuPresentation:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v4 = [(CAMSystemOverlayView *)self _menuVisibility];
    [v4 hideImmediately];

    [(CAMSystemOverlayView *)self _setSliderContent:0 animated:1];
  }
  else
  {
    if (a3 == 1)
    {
      id v5 = [(CAMSystemOverlayView *)self _menuVisibility];
      [v5 addReason:0];
    }
    else
    {
      if (a3) {
        return;
      }
      id v5 = [(CAMSystemOverlayView *)self _menuVisibility];
      [v5 removeReason:0];
    }
  }
}

- (void)_setSliderContent:(int64_t)a3
{
}

- (void)_setSliderContent:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_sliderContent == a3) {
    return;
  }
  BOOL v4 = a4;
  if (a3 == 1)
  {
    [(CAMSystemOverlayView *)self _createMenuIfNeeded];
    unsigned int v7 = [(CAMSystemOverlayView *)self menu];
    [v7 setHighlightCurrentSelectedIndex:0 animated:0];
  }
  double v8 = [(CAMSystemOverlayView *)self delegate];
  [v8 overlayView:self menuWillChangePresented:a3 == 1];

  if (a3) {
    [(CAMSystemOverlayView *)self setHandleBarVisible:0 animated:v4];
  }
  if (v4) {
    [(CAMSystemOverlayView *)self layoutIfNeeded];
  }
  self->_sliderContent = a3;
  [(CAMSystemOverlayView *)self setNeedsLayout];
  uint64_t v9 = 1;
  [(CAMSystemOverlayView *)self _updateValueLabelTextWithForcedMeasurement:1];
  [(CAMSystemOverlayView *)self _updateValueLabelVisibility];
  CGFloat v10 = [(CAMSystemOverlayView *)self _touchingSliderGestureRecognizer];
  [v10 setEnabled:0];

  double v11 = [(CAMSystemOverlayView *)self _touchingSliderGestureRecognizer];
  [v11 setEnabled:1];

  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    uint64_t v9 = 0;
    uint64_t v12 = 1;
LABEL_12:
    [(CAMSystemOverlayView *)self _updateScaleForSliderContent:0 withMode:3 sliderContentDidChange:1 updateDropletScale:0];
    [(CAMSystemOverlayView *)self _updateScaleForSliderContent:1 withMode:3 sliderContentDidChange:1 updateDropletScale:0];
    [(CAMSystemOverlayView *)self _sliderContent:0 blurred:v12];
    [(CAMSystemOverlayView *)self _sliderContent:1 blurred:v9];
  }
  [(CAMSystemOverlayView *)self _setSliderPresented:[(CAMSystemOverlayView *)self isSliderVisible] & !v4];
  BOOL v13 = [(CAMSystemOverlayView *)self _sliderPresentationProgress];
  [v13 invalidate];

  [(CAMSystemOverlayView *)self _setSliderPresentationProgress:0];
  CGFloat v14 = [(CAMSystemOverlayView *)self sliderState];
  double v15 = [(CAMSystemOverlayView *)self sliderState];
  [(CAMSystemOverlayView *)self _updateDropletBackgroundFromState:v14 toState:v15 animated:v4 interactive:0];

  id v16 = [(CAMSystemOverlayView *)self delegate];
  [v16 overlayView:self menuDidChangePresented:a3 == 1];
}

- (void)_createMenuIfNeeded
{
  v17[2] = *MEMORY[0x263EF8340];
  if (!self->_menu)
  {
    char v3 = objc_alloc_init(_TtC8CameraUI17OverlayMenuSlider);
    menu = self->_menu;
    self->_menu = v3;

    [(OverlayMenuSlider *)self->_menu setOrientation:[(CAMSystemOverlayView *)self orientation]];
    [(OverlayMenuSlider *)self->_menu setDelegate:self];
    [(OverlayMenuSlider *)self->_menu setAlignment:[(CAMSystemOverlayView *)self alignment]];
    id v5 = [(CAMSystemOverlayView *)self _blurFilter];
    v17[0] = v5;
    BOOL v6 = [(CAMSystemOverlayView *)self _progressiveEdgeBlurFilter];
    v17[1] = v6;
    unsigned int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    double v8 = [(OverlayMenuSlider *)self->_menu layer];
    [v8 setFilters:v7];

    -[OverlayMenuSlider setAnchorPoint:](self->_menu, "setAnchorPoint:", 1.0, 0.5);
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__handleTouchingMenu_];
    [v9 _wantsGESEvents:1];
    [v9 setMinimumPressDuration:0.0];
    [v9 setDelegate:self];
    [(OverlayMenuSlider *)self->_menu addGestureRecognizer:v9];
    CGFloat v10 = [(CAMSystemOverlayView *)self _dialEffectMesh];
    double v11 = [(OverlayMenuSlider *)self->_menu layer];
    [v11 setMeshTransform:v10];

    uint64_t v12 = [(CAMSystemOverlayView *)self traitCollection];
    [v12 displayScale];
    double v14 = v13;
    double v15 = [(OverlayMenuSlider *)self->_menu layer];
    [v15 setRasterizationScale:v14];

    id v16 = [(OverlayMenuSlider *)self->_menu layer];
    [v16 setAllowsGroupBlending:1];

    [(CAMSystemOverlayView *)self addSubview:self->_menu];
  }
}

- (void)_createSliderIfNeeded
{
  v27[2] = *MEMORY[0x263EF8340];
  if (!self->_slider)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(CAMSystemOverlayView *)self addSubview:v3];
    [(CAMSystemOverlayView *)self _setHitTestingBackground:v3];
    BOOL v4 = objc_alloc_init(CAMSystemOverlaySlider);
    slider = self->_slider;
    self->_slider = v4;

    [(CAMSystemOverlaySlider *)self->_slider setAlignment:[(CAMSystemOverlayView *)self alignment]];
    [(CAMSystemOverlaySlider *)self->_slider setDelegate:self];
    [(CAMSystemOverlaySlider *)self->_slider setFeedbackDisabled:self->_sliderFeedbackDisabled];
    BOOL v6 = [(CAMSystemOverlayView *)self _blurFilter];
    v27[0] = v6;
    unsigned int v7 = [(CAMSystemOverlayView *)self _progressiveEdgeBlurFilter];
    v27[1] = v7;
    double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    uint64_t v9 = [(CAMSystemOverlaySlider *)self->_slider layer];
    [v9 setFilters:v8];

    -[CAMSystemOverlaySlider setAnchorPoint:](self->_slider, "setAnchorPoint:", 1.0, 0.5);
    CGFloat v10 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__handleTouchingSlider_];
    [v10 _wantsGESEvents:1];
    [v10 setMinimumPressDuration:0.0];
    [v10 setDelegate:self];
    [(CAMSystemOverlaySlider *)self->_slider addGestureRecognizer:v10];
    [(CAMSystemOverlayView *)self _setTouchingSliderGestureRecognizer:v10];
    id v11 = objc_alloc(MEMORY[0x263F3AFB8]);
    [(CAMSystemOverlayView *)self bounds];
    uint64_t v12 = (DRPDropletContextView *)objc_msgSend(v11, "initWithFrame:");
    backgroundContext = self->__backgroundContext;
    self->__backgroundContext = v12;

    [(DRPDropletContextView *)self->__backgroundContext setClipsToBounds:1];
    double v14 = [(DRPDropletContextView *)self->__backgroundContext layer];
    [v14 setAllowsHitTesting:0];

    [(CAMSystemOverlayView *)self addSubview:self->__backgroundContext];
    double v15 = [(DRPDropletContextView *)self->__backgroundContext addContainerWithContentView:0];
    backgroundDroplet = self->__backgroundDroplet;
    self->__backgroundDroplet = v15;

    CGFloat v17 = (DRPDropletAnimationCoordinator *)objc_alloc_init(MEMORY[0x263F3AFB0]);
    backgroundAnimator = self->__backgroundAnimator;
    self->__backgroundAnimator = v17;

    self->__backgroundHintNeedsReset = 1;
    [(CAMSystemOverlayView *)self addSubview:self->_slider];
    CGFloat v19 = [(CAMSystemOverlayView *)self _dialEffectMesh];
    CGFloat v20 = [(CAMSystemOverlaySlider *)self->_slider layer];
    [v20 setMeshTransform:v19];

    double v21 = [(CAMSystemOverlayView *)self traitCollection];
    [v21 displayScale];
    double v23 = v22;
    double v24 = [(CAMSystemOverlaySlider *)self->_slider layer];
    [v24 setRasterizationScale:v23];

    CGRect v25 = [(CAMSystemOverlaySlider *)self->_slider layer];
    [v25 setAllowsGroupBlending:1];

    CGRect v26 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleSliderTap_];
    [v26 setDelegate:self];
    [v26 _wantsGESEvents:1];
    [(CAMSystemOverlayView *)self _setTapGestureRecognizer:v26];
    [(CAMSystemOverlayView *)self addGestureRecognizer:v26];
  }
}

- (CAMSystemOverlaySlider)slider
{
  [(CAMSystemOverlayView *)self _createSliderIfNeeded];
  slider = self->_slider;
  return slider;
}

- (CAMSystemOverlaySlider)sliderIfLoaded
{
  return self->_slider;
}

- (void)setSliderFeedbackDisabled:(BOOL)a3
{
  if (self->_sliderFeedbackDisabled != a3)
  {
    BOOL v3 = a3;
    self->_sliderFeedbackDisabled = a3;
    id v4 = [(CAMSystemOverlayView *)self sliderIfLoaded];
    [v4 setFeedbackDisabled:v3];
  }
}

- (void)setHandleBarVisible:(BOOL)a3
{
}

- (void)setHandleBarVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_handleBarVisible != a3)
  {
    self->_handleBarVisible = a3;
    if (a4)
    {
      [(CAMSystemOverlayView *)self layoutIfNeeded];
      [(CAMSystemOverlayView *)self setNeedsLayout];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __53__CAMSystemOverlayView_setHandleBarVisible_animated___block_invoke;
      v5[3] = &unk_263FA0208;
      v5[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:0 delay:v5 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      [(CAMSystemOverlayView *)self setNeedsLayout];
    }
  }
}

uint64_t __53__CAMSystemOverlayView_setHandleBarVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)updateUIForButtonStage:(unint64_t)a3
{
  [(CAMSystemOverlayView *)self _setButtonStage:a3];
  id v4 = [(CAMSystemOverlayView *)self sliderState];
  int v5 = [v4 _presented];

  if (v5)
  {
    int64_t v6 = [(CAMSystemOverlayView *)self sliderContent];
    [(CAMSystemOverlayView *)self _updateScaleForSliderContent:v6 withMode:3 sliderContentDidChange:0 updateDropletScale:1];
  }
}

- (void)_handleSliderTap:(id)a3
{
  id v12 = a3;
  int64_t v4 = [(CAMSystemOverlayView *)self sliderContent];
  if (v4 == 1)
  {
    int64_t v6 = [(CAMSystemOverlayView *)self menu];
    [v12 locationInView:self];
    uint64_t v7 = objc_msgSend(v6, "indexOfImageClosestToPoint:in:", self);
    if (v7 == [v6 selectedControlIndex])
    {
      double v8 = [(CAMSystemOverlayView *)self delegate];
      uint64_t v9 = [(CAMSystemOverlayView *)self menu];
      int v10 = objc_msgSend(v8, "isControlEnabledAtIndex:", objc_msgSend(v9, "selectedControlIndex"));

      if (v10)
      {
        id v11 = [(CAMSystemOverlayView *)self _menuVisibility];
        [v11 hideImmediately];

        [(CAMSystemOverlayView *)self _setSliderContent:0 animated:1];
      }
    }
    else
    {
      [v6 setSelectedControlIndex:v7 animated:1];
    }
  }
  else if (!v4 && [(CAMSystemOverlayView *)self isSliderVisible])
  {
    int v5 = [(CAMSystemOverlayView *)self _menuVisibility];
    [v5 showTransiently];

    [(CAMSystemOverlayView *)self _setSliderContent:1 animated:1];
  }
}

- (void)_handleTouchingMenu:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1) {
      return;
    }
    id v5 = [(CAMSystemOverlayView *)self _menuVisibility];
    [v5 addReason:1];
  }
  else
  {
    id v5 = [(CAMSystemOverlayView *)self _menuVisibility];
    [v5 removeReason:1];
  }
}

- (void)_handleTouchingSlider:(id)a3
{
  if ((unint64_t)([a3 state] - 3) <= 1)
  {
    [(CAMSystemOverlayView *)self _updateScaleForSliderContent:0 withMode:3 sliderContentDidChange:0 updateDropletScale:1];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAMSystemOverlayView *)self _tapGestureRecognizer];

  if (v8 == v7)
  {
    [v6 locationInView:self];
    double v11 = v10;
    [(CAMSystemOverlayView *)self bounds];
    BOOL v9 = vabdd_f64(v11, CGRectGetMaxX(v13)) < 40.0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_handlePan:(id)a3
{
  id v19 = a3;
  [v19 translationInView:self];
  double v5 = v4;
  int64_t v6 = [(CAMSystemOverlayView *)self sliderContent];
  int64_t v7 = v6;
  if (v6 == 1)
  {
    id v8 = [(CAMSystemOverlayView *)self menu];
  }
  else
  {
    if (v6) {
      goto LABEL_6;
    }
    id v8 = [(CAMSystemOverlayView *)self slider];
  }

LABEL_6:
  if ([v19 state] == 3)
  {
    [(CAMSystemOverlayView *)self _updateScaleForSliderContent:[(CAMSystemOverlayView *)self sliderContent] withMode:3 sliderContentDidChange:0 updateDropletScale:1];
    if (v5 < 0.0) {
      double v9 = 10.0;
    }
    else {
      double v9 = 3.0;
    }
    double v10 = [(CAMSystemOverlayView *)self delegate];
    double v11 = [(CAMSystemOverlayView *)self menu];
    int v12 = objc_msgSend(v10, "isControlEnabledAtIndex:", objc_msgSend(v11, "selectedControlIndex"));

    if (fabs(v5) <= v9) {
      goto LABEL_24;
    }
    if (v7 == 1)
    {
      if (v5 >= 0.0) {
        int v14 = v12;
      }
      else {
        int v14 = 0;
      }
      if (v14 != 1) {
        goto LABEL_24;
      }
      double v15 = [(CAMSystemOverlayView *)self _menuVisibility];
      [v15 hideImmediately];

      id v16 = self;
      uint64_t v17 = 0;
    }
    else
    {
      if (v7) {
        goto LABEL_24;
      }
      if (v5 >= 0.0)
      {
        CGRect v13 = [(CAMSystemOverlayView *)self delegate];
        [v13 overlayView:self performedDismissGesture:v19];

        goto LABEL_24;
      }
      CGFloat v18 = [(CAMSystemOverlayView *)self _menuVisibility];
      [v18 showTransiently];

      id v16 = self;
      uint64_t v17 = 1;
    }
    [(CAMSystemOverlayView *)v16 _setSliderContent:v17 animated:1];
  }
  else if ([v19 state] == 2)
  {
    [(CAMSystemOverlayView *)self _updateScaleForSliderContent:[(CAMSystemOverlayView *)self sliderContent] withMode:5 sliderContentDidChange:0 updateDropletScale:1];
  }
LABEL_24:
}

- (CEKFluidBehaviorSettings)_scaleSettings
{
  scaleSettings = self->__scaleSettings;
  if (!scaleSettings)
  {
    double v4 = (CEKFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x263F306C0]);
    double v5 = self->__scaleSettings;
    self->__scaleSettings = v4;

    [(CEKFluidBehaviorSettings *)self->__scaleSettings setDefaultValues];
    [(CEKFluidBehaviorSettings *)self->__scaleSettings setDampingRatio:1.0];
    [(CEKFluidBehaviorSettings *)self->__scaleSettings setResponse:0.4];
    scaleSettings = self->__scaleSettings;
  }
  return scaleSettings;
}

- (void)_sliderContent:(int64_t)a3 blurred:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    int64_t v6 = [(CAMSystemOverlayView *)self menu];
  }
  else if (a3)
  {
    int64_t v6 = 0;
  }
  else
  {
    int64_t v6 = [(CAMSystemOverlayView *)self slider];
  }
  id v13 = v6;
  int64_t v7 = [v6 layer];
  BOOL v8 = !v4;
  if (v4) {
    double v9 = &unk_26BDDF288;
  }
  else {
    double v9 = &unk_26BDDF298;
  }
  if (v8) {
    double v10 = &unk_26BDDF288;
  }
  else {
    double v10 = &unk_26BDDF298;
  }
  double v11 = [(CAMSystemOverlayView *)self _springAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v11 setFromValue:v10];
  [v11 setToValue:v9];
  [v11 setDuration:0.3];
  [v7 addAnimation:v11 forKey:@"blurRadiusAnimation"];
  int v12 = [v13 layer];
  [v12 setValue:v9 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (id)_springAnimationWithKeyPath:(id)a3
{
  BOOL v3 = [MEMORY[0x263F15890] animationWithKeyPath:a3];
  [v3 setMass:2.0];
  [v3 setStiffness:300.0];
  [v3 setDamping:50.0];
  return v3;
}

- (void)_updateScaleForSliderContent:(int64_t)a3 withMode:(int64_t)a4 sliderContentDidChange:(BOOL)a5 updateDropletScale:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double v11 = [(CAMSystemOverlayView *)self sliderState];
  int v12 = [v11 _presented];

  if (v12)
  {
    unint64_t v13 = [(CAMSystemOverlayView *)self _buttonStage];
    if (v13 == 4)
    {
      double v14 = 1.2;
    }
    else
    {
      double v14 = 1.0;
      if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if ([(CAMSystemOverlayView *)self halfPressEnabled]) {
          double v14 = 1.1;
        }
        else {
          double v14 = 1.0;
        }
      }
    }
    double v15 = [(CAMSystemOverlayView *)self _touchingSliderGestureRecognizer];
    uint64_t v16 = [v15 state];

    if ((unint64_t)(v16 - 1) < 2) {
      double v14 = 1.25;
    }
    uint64_t v17 = [(CAMSystemOverlayView *)self _panGestureRecognizer];
    if ([v17 state] == 2)
    {
      [v17 translationInView:self];
      double v19 = v18;
      long double v20 = log(fabs(v18) / 100.0 + 1.0);
      double v21 = v20 / (v20 + 1.0);
      double v22 = 0.2;
      if (v19 >= 0.0) {
        double v22 = -0.5;
      }
      double v14 = v22 * v21 + 1.0;
    }
    if (v7 && [(CAMSystemOverlayView *)self sliderContent] != a3)
    {
      if (a3 == 1)
      {
        double v14 = 0.4;
      }
      else if (!a3)
      {
        double v14 = 1.5;
      }
    }
  }
  else
  {
    double v14 = 0.2;
  }
  unint64_t v23 = a4 - 3;
  if (v6) {
    [(CAMSystemOverlayView *)self _setDropletScale:v23 < 3 animated:a4 == 5 interactive:v14];
  }
  if (a3 == 1)
  {
    uint64_t v24 = [(CAMSystemOverlayView *)self menu];
    goto LABEL_28;
  }
  if (!a3)
  {
    uint64_t v24 = [(CAMSystemOverlayView *)self slider];
LABEL_28:
    CGRect v25 = (void *)v24;
    goto LABEL_30;
  }
  CGRect v25 = 0;
LABEL_30:
  if (v23 > 2)
  {
    CGAffineTransformMakeScale(&v29, v14, v14);
    CGAffineTransform v28 = v29;
    [v25 setTransform:&v28];
  }
  else
  {
    CGRect v26 = (void *)MEMORY[0x263F82E00];
    double v27 = [(CAMSystemOverlayView *)self _scaleSettings];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __104__CAMSystemOverlayView__updateScaleForSliderContent_withMode_sliderContentDidChange_updateDropletScale___block_invoke;
    v30[3] = &unk_263FA04E0;
    id v31 = v25;
    double v32 = v14;
    objc_msgSend(v26, "cek_animateWithSettings:mode:animations:completion:", v27, a4, v30, 0);
  }
}

uint64_t __104__CAMSystemOverlayView__updateScaleForSliderContent_withMode_sliderContentDidChange_updateDropletScale___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

- (void)_setDropletScale:(double)a3
{
}

- (void)_setDropletScale:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  if (self->__dropletScale != a3)
  {
    BOOL v6 = a5;
    if (a4)
    {
      [(CAMSystemOverlayView *)self layoutIfNeeded];
      self->__dropletScale = a3;
      BOOL v8 = [(CAMSystemOverlayView *)self sliderState];
      double v9 = [(CAMSystemOverlayView *)self sliderState];
      [(CAMSystemOverlayView *)self _updateDropletBackgroundFromState:v8 toState:v9 animated:1 interactive:v6];

      [(CAMSystemOverlayView *)self setNeedsLayout];
      if (v6) {
        uint64_t v10 = 5;
      }
      else {
        uint64_t v10 = 3;
      }
      double v11 = (void *)MEMORY[0x263F82E00];
      int v12 = [(CAMSystemOverlayView *)self _scaleSettings];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __62__CAMSystemOverlayView__setDropletScale_animated_interactive___block_invoke;
      v15[3] = &unk_263FA0208;
      v15[4] = self;
      objc_msgSend(v11, "cek_animateWithSettings:mode:animations:completion:", v12, v10, v15, 0);
    }
    else
    {
      self->__dropletScale = a3;
      unint64_t v13 = [(CAMSystemOverlayView *)self sliderState];
      double v14 = [(CAMSystemOverlayView *)self sliderState];
      [(CAMSystemOverlayView *)self _updateDropletBackgroundFromState:v13 toState:v14 animated:0 interactive:v6];

      [(CAMSystemOverlayView *)self setNeedsLayout];
    }
  }
}

uint64_t __62__CAMSystemOverlayView__setDropletScale_animated_interactive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)reloadValueLabel
{
  [(CAMSystemOverlayView *)self _updateValueLabelText];
  [(CAMSystemOverlayView *)self _updateValueLabelVisibility];
}

- (void)_createValueLabelIfNeeded
{
  BOOL v3 = [(CAMSystemOverlayView *)self _valueLabel];

  if (!v3)
  {
    id v13 = objc_alloc_init(MEMORY[0x263F828E0]);
    CGAffineTransform v4 = [MEMORY[0x263F825C8] systemYellowColor];
    [v13 setTextColor:v4];

    [v13 setTextAlignment:1];
    CGAffineTransform v5 = [v13 layer];
    LODWORD(v6) = 1045220557;
    [v5 setShadowOpacity:v6];

    BOOL v7 = [v13 layer];
    [v7 setShadowRadius:15.0];

    double v8 = *MEMORY[0x263F001B0];
    double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
    uint64_t v10 = [v13 layer];
    objc_msgSend(v10, "setShadowOffset:", v8, v9);

    double v11 = [v13 layer];
    [v11 setShadowPathIsBounds:1];

    [v13 setAccessibilityIgnoresInvertColors:1];
    id v12 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v12 addSubview:v13];
    [(CAMSystemOverlayView *)self addSubview:v12];
    [(CAMSystemOverlayView *)self _setValueLabelContainer:v12];
    [(CAMSystemOverlayView *)self _setValueLabel:v13];
    [(CAMSystemOverlayView *)self _updateValueLabelFont];
  }
}

- (void)_updateValueLabelLayoutMetrics
{
  id v11 = [(CAMSystemOverlayView *)self _valueLabel];
  [v11 intrinsicContentSize];
  BOOL v3 = [(CAMSystemOverlayView *)self traitCollection];
  [v3 displayScale];
  UISizeCeilToScale();
  double v5 = v4;
  double v7 = v6;

  [(CAMSystemOverlayView *)self _valueTextSize];
  if (v5 != v9 || v7 != v8)
  {
    -[CAMSystemOverlayView _setValueTextSize:](self, "_setValueTextSize:", v5, v7);
    [(CAMSystemOverlayView *)self setNeedsLayout];
  }
}

- (void)_updateValueLabelFont
{
  id v11 = [(CAMSystemOverlayView *)self _valueLabel];
  BOOL v3 = [(CAMSystemOverlayView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  +[CAMZoomButton fontSizeForContentSize:v4];
  double v6 = v5;
  double v7 = [v11 font];
  [v7 pointSize];
  double v9 = v8;

  if (v6 != v9)
  {
    uint64_t v10 = +[CAMFont cameraMonospacedFontOfSize:v6 weight:*MEMORY[0x263F81840]];
    [v11 setFont:v10];

    [(CAMSystemOverlayView *)self _updateValueLabelLayoutMetrics];
  }
}

- (void)_updateValueLabelText
{
}

- (void)_updateValueLabelTextWithForcedMeasurement:(BOOL)a3
{
  int64_t v5 = [(CAMSystemOverlayView *)self sliderContent];
  if (v5)
  {
    if (v5 != 1)
    {
      id v17 = 0;
      goto LABEL_7;
    }
    double v6 = [(CAMSystemOverlayView *)self delegate];
    double v7 = [(CAMSystemOverlayView *)self menu];
    objc_msgSend(v6, "menuTitleForControlAtIndex:", objc_msgSend(v7, "selectedControlIndex"));
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v6 = [(CAMSystemOverlayView *)self delegate];
    id v17 = [v6 valueTextForCurrentControl];
  }

LABEL_7:
  double v8 = [(CAMSystemOverlayView *)self _valueLabel];
  double v9 = [v8 text];
  [v8 setText:v17];
  uint64_t v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v11 = [v17 componentsSeparatedByCharactersInSet:v10];
  uint64_t v12 = [v11 count];

  id v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  double v14 = [v9 componentsSeparatedByCharactersInSet:v13];
  uint64_t v15 = [v14 count];

  if (a3 || (uint64_t v16 = [v17 length], v16 != objc_msgSend(v9, "length")) || v12 != v15) {
    [(CAMSystemOverlayView *)self _updateValueLabelLayoutMetrics];
  }
}

- (void)_createHandleBarViewIfNeeded
{
  BOOL v3 = [(CAMSystemOverlayView *)self _handleBarView];

  if (!v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
    double v4 = [MEMORY[0x263F825C8] whiteColor];
    [v5 setBackgroundColor:v4];

    [(CAMSystemOverlayView *)self addSubview:v5];
    [(CAMSystemOverlayView *)self _setHandleBarView:v5];
  }
}

- (double)_dropletCenterYFromState:(id)a3 toState:(id)a4
{
  [a4 _effectiveNormalizedButtonOffsetFromState:a3];
  [(CAMSystemOverlayView *)self _frameForButton];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGRectGetMinY(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRectGetMaxY(v12);
  CEKInterpolateClamped();
  return v9 + (double)arc4random_uniform(0x5F5E100u) / 100000000.0;
}

- (void)_resetDropletBackgroundIfNeededFromState:(id)a3 toState:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ([(CAMSystemOverlayView *)self _backgroundHintNeedsReset])
  {
    double v7 = [(CAMSystemOverlayView *)self _backgroundAnimator];
    double v8 = [(CAMSystemOverlayView *)self _backgroundDroplet];
    double v9 = [(CAMSystemOverlayView *)self _backgroundContext];
    [(CAMSystemOverlayView *)self bounds];
    double v11 = v10;
    double v13 = v12;
    [(CAMSystemOverlayView *)self _dropletCenterYFromState:v18 toState:v6];
    double v15 = v14;
    if ([(CAMSystemOverlayView *)self alignment]) {
      uint64_t v16 = 8;
    }
    else {
      uint64_t v16 = 2;
    }
    id v17 = objc_msgSend(MEMORY[0x263F3AFC0], "edgeHintWithCanvasSize:hintSize:edge:centerAlongEdge:progress:dropletRadius:", v16, v11, v13, 53.0, v15, 0.0, 25.0);
    [v7 applyViewConfiguration:v17 animated:0 tracking:0 containerView:v8 contextView:v9];
    [(CAMSystemOverlayView *)self _setBackgroundHintNeedsReset:0];
  }
}

- (void)_updateDropletBackgroundFromState:(id)a3 toState:(id)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  BOOL v47 = a6;
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  double v11 = [(CAMSystemOverlayView *)self _backgroundDroplet];
  double v12 = [(CAMSystemOverlayView *)self _backgroundContext];
  int64_t v13 = [(CAMSystemOverlayView *)self sliderContent];
  [(CAMSystemOverlayView *)self _dropletScale];
  -[CAMSystemOverlayView _frameForSliderVisible:content:scale:](self, "_frameForSliderVisible:content:scale:", 1, v13);
  double v15 = v14;
  double v17 = v16;
  [(CAMSystemOverlayView *)self _dropletCenterYFromState:v9 toState:v10];
  double v19 = v18;
  [(CAMSystemOverlayView *)self bounds];
  double v21 = v20;
  double v23 = v22;
  if ([(CAMSystemOverlayView *)self alignment]) {
    uint64_t v24 = 8;
  }
  else {
    uint64_t v24 = 2;
  }
  objc_initWeak(location, self);
  uint64_t v25 = [v10 _sliderMode];
  if (v25)
  {
    if (v25 == 1)
    {
      double v27 = objc_msgSend(MEMORY[0x263F3AFC0], "edgeHintWithCanvasSize:hintSize:edge:centerAlongEdge:progress:dropletRadius:", v24, v21, v23, 53.0, v19, 100.0, 25.0);
      [v11 setHidden:0];
      goto LABEL_34;
    }
    if (v25 != 2)
    {
      double v27 = 0;
      goto LABEL_34;
    }
    [v11 setHidden:0];
    if (v47)
    {
      v46 = 0;
      CGRect v26 = 0;
    }
    else
    {
      id v31 = (void *)MEMORY[0x263F306C8];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_4;
      v52[3] = &unk_263FA0E00;
      objc_copyWeak(&v53, location);
      v46 = [v31 animatablePropertyWithFunctionalCompletion:v52];
      -[CAMSystemOverlayView _setSliderPresentationProgress:](self, "_setSliderPresentationProgress:");
      if ([v9 _presented])
      {
        CGRect v26 = 0;
      }
      else
      {
        CGRect v26 = [(CAMSystemOverlayView *)self _valueLabelPresentationProgress];
        if (!v26)
        {
          CGRect v26 = [(CAMSystemOverlayView *)self _createValueLabelProgressProperty];
          [v26 setValue:-1.0];
          [(CAMSystemOverlayView *)self _setValueLabelPresentationProgress:v26];
        }
      }
      objc_destroyWeak(&v53);
    }
    double v27 = objc_msgSend(MEMORY[0x263F3AFC0], "edgeContentPresentedWithCanvasSize:edge:lengthAlongEdge:protrusionFromEdge:centerAlongEdge:inflationProgress:dropletRadius:", v24, v21, v23, v17, v15, v19, 0.0, 12.0, v26);
    int64_t v32 = [(CAMSystemOverlayView *)self sliderContent];
    if (v32 != 1)
    {
      if (v32)
      {
LABEL_33:
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_5;
        v48[3] = &unk_263FA2A98;
        id v36 = v46;
        id v49 = v36;
        id v37 = v45;
        id v50 = v37;
        objc_copyWeak(&v51, location);
        [v27 addAlongsideAnimationBlockForKeyPath:@"centerX" animationBlock:v48];
        objc_destroyWeak(&v51);

        goto LABEL_34;
      }
      CGFloat v33 = [(CAMSystemOverlayView *)self sliderIfLoaded];
      if ([v33 style] == 6)
      {
        unint64_t v34 = [(CAMSystemOverlayView *)self orientation] - 1;

        if (v34 <= 1)
        {
          double v35 = 12.0;
          [v27 setContainerCornerRadius:12.0];
LABEL_32:
          [v27 setDropletRadius:v35];
          goto LABEL_33;
        }
      }
      else
      {
      }
      double v35 = 10.0;
      [v27 setContainerCornerRadius:10.0];
      goto LABEL_32;
    }
    double v35 = 13.0;
    [v27 setContainerCornerRadius:16.0];
    goto LABEL_32;
  }
  if ([v9 _sliderMode] == 1)
  {
    double v27 = objc_msgSend(MEMORY[0x263F3AFC0], "edgeHintWithCanvasSize:hintSize:edge:centerAlongEdge:progress:dropletRadius:", v24, v21, v23, 53.0, v19, 0.0, 25.0);
  }
  else
  {
    double v27 = objc_msgSend(MEMORY[0x263F3AFC0], "edgeContentPresentedWithCanvasSize:edge:lengthAlongEdge:protrusionFromEdge:centerAlongEdge:inflationProgress:dropletRadius:", v24, v21, v23, 53.0, 0.0, v19, 0.0, 12.0);
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke;
    v59[3] = &unk_263FA2A20;
    objc_copyWeak(&v60, location);
    [v27 addAlongsideAnimationBlockForKeyPath:@"centerX" animationBlock:v59];
    objc_destroyWeak(&v60);
  }
  if ([v9 _presented])
  {
    CGAffineTransform v28 = [(CAMSystemOverlayView *)self _valueLabelPresentationProgress];
    if (!v28)
    {
      CGAffineTransform v28 = [(CAMSystemOverlayView *)self _createValueLabelProgressProperty];
      [v28 setValue:1.0];
      [(CAMSystemOverlayView *)self _setValueLabelPresentationProgress:v28];
    }
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_2;
    v57[3] = &unk_263FA2A48;
    id v29 = v28;
    id v58 = v29;
    [v27 addAlongsideAnimationBlockForKeyPath:@"centerX" animationBlock:v57];
  }
  objc_initWeak(&from, self);
  double v30 = (void *)([(CAMSystemOverlayView *)self _sliderHideAnimationCount] + 1);
  [(CAMSystemOverlayView *)self _setSliderHideAnimationCount:v30];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_3;
  v54[3] = &unk_263FA2A70;
  objc_copyWeak(v55, &from);
  v55[1] = v30;
  [v27 addAnimationCompletionBlockForKeyPath:@"centerX" animationCompletionBlock:v54];
  objc_destroyWeak(v55);
  objc_destroyWeak(&from);
LABEL_34:
  uint64_t v38 = [v9 _sliderMode];
  uint64_t v39 = [v10 _sliderMode];
  if (v6)
  {
    CGFloat v40 = [(CAMSystemOverlayView *)self _backgroundAnimationSettings];
    [v27 setBehaviorSettingsForKeyPath:@"centerX" behaviorSettings:v40];
    [v27 setBehaviorSettingsForKeyPath:@"centerY" behaviorSettings:v40];
    [v27 setBehaviorSettingsForKeyPath:@"containerWidth" behaviorSettings:v40];
    [v27 setBehaviorSettingsForKeyPath:@"containerHeight" behaviorSettings:v40];
  }
  CGFloat v41 = [(CAMSystemOverlayView *)self _backgroundAnimator];
  CGFloat v42 = v41;
  uint64_t v44 = v38 == 1 && v39 == 1 || v47;
  [v41 applyViewConfiguration:v27 animated:v6 tracking:v44 containerView:v11 contextView:v12];

  objc_destroyWeak(location);
}

void __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained layoutIfNeeded];
}

uint64_t __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:-1.0];
}

void __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained isSliderVisible] & 1) == 0
    && [WeakRetained _sliderHideAnimationCount] == *(void *)(a1 + 40))
  {
    v2 = [WeakRetained _backgroundDroplet];
    [v2 setHidden:1];
  }
}

void __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setSliderPresented:1];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _setSliderPresentationProgress:0];
}

void __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_5(id *a1)
{
  [a1[4] setValue:1.0];
  [a1[5] setValue:1.0];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained layoutIfNeeded];
}

- (CEKFluidBehaviorSettings)_backgroundAnimationSettings
{
  backgroundAnimationSettings = self->__backgroundAnimationSettings;
  if (!backgroundAnimationSettings)
  {
    double v4 = (CEKFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x263F306C0]);
    id v5 = self->__backgroundAnimationSettings;
    self->__backgroundAnimationSettings = v4;

    [(CEKFluidBehaviorSettings *)self->__backgroundAnimationSettings setDampingRatio:0.7];
    [(CEKFluidBehaviorSettings *)self->__backgroundAnimationSettings setResponse:0.5];
    BOOL v6 = self->__backgroundAnimationSettings;
    CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[CEKFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v6, "setFrameRateRange:highFrameRateReason:", 1441796, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
    backgroundAnimationSettings = self->__backgroundAnimationSettings;
  }
  return backgroundAnimationSettings;
}

- (id)_createValueLabelProgressProperty
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82E28]);
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  double v4 = (void *)MEMORY[0x263F82E00];
  v12[0] = v3;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__CAMSystemOverlayView__createValueLabelProgressProperty__block_invoke;
  v7[3] = &unk_263FA2AC0;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  [v4 _createTransformerWithInputAnimatableProperties:v5 presentationValueChangedCallback:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

void __57__CAMSystemOverlayView__createValueLabelProgressProperty__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2 && WeakRetained)
  {
    char v3 = [WeakRetained isInvalidated];

    if ((v3 & 1) == 0)
    {
      [v2 _updateValueLabelVisibility];
      [WeakRetained presentationValue];
      [WeakRetained value];
      if (BSFloatEqualToFloat())
      {
        [WeakRetained invalidate];
        id v4 = [v2 _valueLabelPresentationProgress];

        if (WeakRetained == v4) {
          [v2 _setValueLabelPresentationProgress:0];
        }
      }
    }
  }
  else
  {
  }
}

+ (void)_applyGainModulationToElement:(id)a3 withInputAmount:(id)a4
{
  id v19 = a3;
  if (v19)
  {
    id v5 = NSString;
    uint64_t v6 = *MEMORY[0x263F15BB8];
    id v7 = a4;
    id v8 = [v5 stringWithFormat:@"filters.%@", v6];
    id v9 = [NSString stringWithFormat:@"%@.%@", v8, *MEMORY[0x263F15BF8]];
    id v10 = [v19 layer];
    double v11 = [v10 valueForKeyPath:v8];

    if (!v11)
    {
      double v12 = [MEMORY[0x263F157C8] filterWithType:v6];
      [v12 setValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F15BE8]];
      int64_t v13 = (void *)MEMORY[0x263EFF980];
      double v14 = [v19 layer];
      double v15 = [v14 filters];
      double v16 = [v13 arrayWithArray:v15];

      [v16 addObject:v12];
      double v17 = [v19 layer];
      [v17 setFilters:v16];
    }
    double v18 = [v19 layer];
    [v18 setValue:v7 forKeyPath:v9];
  }
}

- (id)_blurFilter
{
  id v2 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  [v2 setValue:&unk_26BDDF298 forKey:@"inputRadius"];
  [v2 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdgesTransparent"];
  [v2 setValue:@"low" forKey:@"inputQuality"];
  [v2 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
  return v2;
}

- (CAFilter)_progressiveEdgeBlurFilter
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_progressiveEdgeBlurFilter = &self->__progressiveEdgeBlurFilter;
  progressiveEdgeBlurFilter = self->__progressiveEdgeBlurFilter;
  if (progressiveEdgeBlurFilter)
  {
    id v4 = progressiveEdgeBlurFilter;
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t v6 = CGBitmapContextCreate(0, 1uLL, 0x14uLL, 8uLL, 0, DeviceRGB, 1u);
    id v7 = CGColorSpaceCreateDeviceRGB();
    CGFloat locations = 0.0;
    long long v26 = xmmword_209C796A0;
    long long v27 = xmmword_209C796B0;
    uint64_t v20 = 0;
    long long v22 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v15 = 0;
    long long v17 = 0u;
    uint64_t v12 = 0;
    long long v14 = 0u;
    long long v11 = 0u;
    uint64_t v13 = 0x3FF0000000000000;
    uint64_t v16 = 0x3FB999999999999ALL;
    uint64_t v21 = 0x3FB999999999999ALL;
    uint64_t v23 = 0;
    uint64_t v24 = 0x3FF0000000000000;
    id v8 = CGGradientCreateWithColorComponents(v7, (const CGFloat *)&v11, &locations, 5uLL);
    v30.CGFloat x = 0.0;
    v30.CGFloat y = 0.0;
    v31.CGFloat x = 0.0;
    v31.CGFloat y = 20.0;
    CGContextDrawLinearGradient(v6, v8, v30, v31, 0);
    CGImageRef Image = CGBitmapContextCreateImage(v6);
    CGColorSpaceRelease(v7);
    CGGradientRelease(v8);
    CGContextRelease(v6);
    id v4 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DB0]];
    [(CAFilter *)v4 setValue:Image forKey:@"inputMaskImage"];
    [(CAFilter *)v4 setValue:&unk_26BDDF2A8 forKey:*MEMORY[0x263F15C80]];
    [(CAFilter *)v4 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdgesTransparent"];
    [(CAFilter *)v4 setValue:@"low" forKey:@"inputQuality"];
    [(CAFilter *)v4 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
    objc_storeStrong((id *)p_progressiveEdgeBlurFilter, v4);
  }
  return v4;
}

- (CAMutableMeshTransform)_dialEffectMesh
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  dialEffectMesh = self->__dialEffectMesh;
  if (dialEffectMesh)
  {
    char v3 = dialEffectMesh;
  }
  else
  {
    MEMORY[0x270FA5388]();
    uint64_t v5 = 0;
    uint64_t v6 = (double *)&v18;
    long long v19 = xmmword_209C796C0;
    do
    {
      double v7 = (double)v5 / 19.0;
      long double v8 = pow(v7 + -0.5 + v7 + -0.5, 3.0);
      *(v6 - 6) = 0.0;
      long double v9 = v7 + v8 * -0.11;
      *(v6 - 5) = v7;
      *(v6 - 4) = 0.0;
      *(v6 - 3) = v9;
      *((_OWORD *)v6 - 1) = v19;
      double *v6 = v7;
      v6[1] = 1.0;
      v6[2] = v9;
      v6[3] = 0.0;
      ++v5;
      v6 += 10;
    }
    while (v5 != 20);
    MEMORY[0x270FA5388]();
    id v10 = &v16;
    uint64_t v11 = -38;
    do
    {
      *((_DWORD *)v10 - 2) = v11 + 38;
      *((_DWORD *)v10 - 1) = v11 + 39;
      *(_DWORD *)id v10 = v11 + 41;
      *((_DWORD *)v10 + 1) = v11 + 40;
      v10[1] = 0;
      v10[2] = 0;
      v10 += 4;
      v11 += 2;
    }
    while (v11);
    uint64_t v12 = objc_msgSend(MEMORY[0x263F15830], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 40, &v17, 19);
    [v12 setSubdivisionSteps:2];
    uint64_t v13 = self->__dialEffectMesh;
    self->__dialEffectMesh = (CAMutableMeshTransform *)v12;
    id v14 = v12;

    char v3 = self->__dialEffectMesh;
  }
  return v3;
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    if (a4)
    {
      [(CAMSystemOverlayView *)self layoutIfNeeded];
      self->_orientation = a3;
      [(CAMSystemOverlayView *)self setNeedsLayout];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __48__CAMSystemOverlayView_setOrientation_animated___block_invoke;
      v11[3] = &unk_263FA0208;
      v11[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:0 delay:v11 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      self->_orientation = a3;
      [(CAMSystemOverlayView *)self setNeedsLayout];
    }
    double v7 = [(CAMSystemOverlayView *)self menu];
    [v7 setOrientation:a3 animated:v4];

    long double v8 = [(CAMSystemOverlayView *)self slider];
    [v8 setOrientation:a3 animated:v4];

    long double v9 = [(CAMSystemOverlayView *)self sliderState];
    id v10 = [(CAMSystemOverlayView *)self sliderState];
    [(CAMSystemOverlayView *)self _updateDropletBackgroundFromState:v9 toState:v10 animated:v4 interactive:0];
  }
}

uint64_t __48__CAMSystemOverlayView_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)overlaySliderWillBeginScrolling:(id)a3
{
  BOOL v4 = [(CAMSystemOverlayView *)self delegate];
  [v4 overlayViewSliderWillBeginScrolling:self];

  [(CAMSystemOverlayView *)self _updateScaleForSliderContent:0 withMode:3 sliderContentDidChange:0 updateDropletScale:1];
}

- (void)overlaySliderDidEndScrolling:(id)a3
{
  id v4 = [(CAMSystemOverlayView *)self delegate];
  [v4 overlayViewSliderDidEndScrolling:self];
}

- (void)overlaySliderDidChangeCurrentValue:(id)a3
{
  id v4 = [(CAMSystemOverlayView *)self delegate];
  [v4 overlayViewSliderDidChangeCurrentValue:self];

  [(CAMSystemOverlayView *)self _updateValueLabelText];
}

- (id)overlaySlider:(id)a3 cellConfigurationForValue:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(CAMSystemOverlayView *)self delegate];
  double v7 = [v6 overlayView:self cellConfigurationForNumber:v5];

  return v7;
}

- (void)overlayMenuSliderWillBeginScrolling:(id)a3
{
  id v3 = [(CAMSystemOverlayView *)self _menuVisibility];
  [v3 addReason:2];
}

- (void)overlayMenuSliderDidEndScrolling:(id)a3
{
  id v3 = [(CAMSystemOverlayView *)self _menuVisibility];
  [v3 removeReason:2];
}

- (void)overlayMenuSlider:(id)a3 didSelectControlAt:(int64_t)a4
{
  id v5 = [(CAMSystemOverlayView *)self delegate];
  uint64_t v6 = [(CAMSystemOverlayView *)self menu];
  objc_msgSend(v5, "overlayView:menuDidSelectControlAtIndex:", self, objc_msgSend(v6, "selectedControlIndex"));

  [(CAMSystemOverlayView *)self _updateValueLabelText];
  [(CAMSystemOverlayView *)self _updateValueLabelVisibility];
}

- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4
{
  uint64_t v5 = [a3 isVisible];
  [(CAMSystemOverlayView *)self _setSliderContent:v5 animated:1];
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)_setSliderPresented:(BOOL)a3
{
  self->_sliderPresented = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)_setSlider:(id)a3
{
}

- (_TtC8CameraUI17OverlayMenuSlider)menu
{
  return self->_menu;
}

- (void)_setMenu:(id)a3
{
}

- (int64_t)sliderContent
{
  return self->_sliderContent;
}

- (UIView)tipAnchor
{
  return self->_tipAnchor;
}

- (CAMSystemOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSystemOverlayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSliderFeedbackDisabled
{
  return self->_sliderFeedbackDisabled;
}

- (BOOL)halfPressEnabled
{
  return self->_halfPressEnabled;
}

- (void)setHalfPressEnabled:(BOOL)a3
{
  self->_halfPressEnabled = a3;
}

- (BOOL)isHandleBarVisible
{
  return self->_handleBarVisible;
}

- (CAMOverlaySliderState)sliderState
{
  return self->_sliderState;
}

- (DRPDropletContextView)_backgroundContext
{
  return self->__backgroundContext;
}

- (void)_setBackgroundContext:(id)a3
{
}

- (DRPDropletContainerView)_backgroundDroplet
{
  return self->__backgroundDroplet;
}

- (void)_setBackgroundContainer:(id)a3
{
}

- (DRPDropletAnimationCoordinator)_backgroundAnimator
{
  return self->__backgroundAnimator;
}

- (void)_setBackgroundAnimator:(id)a3
{
}

- (BOOL)_backgroundHintNeedsReset
{
  return self->__backgroundHintNeedsReset;
}

- (void)_setBackgroundHintNeedsReset:(BOOL)a3
{
  self->__backgroundHintNeedsReset = a3;
}

- (CAMScreenLuminanceObserverLayer)_screenLuminanceObserverLayer
{
  return self->__screenLuminanceObserverLayer;
}

- (CAMSystemOverlayVisibility)_menuVisibility
{
  return self->__menuVisibility;
}

- (UIView)_hitTestingBackground
{
  return self->__hitTestingBackground;
}

- (void)_setHitTestingBackground:(id)a3
{
}

- (UIView)_valueLabelContainer
{
  return self->__valueLabelContainer;
}

- (void)_setValueLabelContainer:(id)a3
{
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (void)_setValueLabel:(id)a3
{
}

- (CGSize)_valueTextSize
{
  double width = self->__valueTextSize.width;
  double height = self->__valueTextSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setValueTextSize:(CGSize)a3
{
  self->__valueTextSize = a3;
}

- (UIView)_handleBarView
{
  return self->__handleBarView;
}

- (void)_setHandleBarView:(id)a3
{
}

- (UIGestureRecognizer)_touchingSliderGestureRecognizer
{
  return self->__touchingSliderGestureRecognizer;
}

- (void)_setTouchingSliderGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  return self->__panGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (void)_setTapGestureRecognizer:(id)a3
{
}

- (double)_dropletScale
{
  return self->__dropletScale;
}

- (void)set_dropletScale:(double)a3
{
  self->__dropletScale = a3;
}

- (unint64_t)_buttonStage
{
  return self->__buttonStage;
}

- (void)_setButtonStage:(unint64_t)a3
{
  self->__buttonStage = a3;
}

- (UIViewFloatAnimatableProperty)_sliderPresentationProgress
{
  return self->__sliderPresentationProgress;
}

- (void)_setSliderPresentationProgress:(id)a3
{
}

- (unint64_t)_sliderHideAnimationCount
{
  return self->__sliderHideAnimationCount;
}

- (void)_setSliderHideAnimationCount:(unint64_t)a3
{
  self->__sliderHideAnimationCount = a3;
}

- (UIViewFloatAnimatableProperty)_valueLabelPresentationProgress
{
  return self->__valueLabelPresentationProgress;
}

- (void)_setValueLabelPresentationProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__valueLabelPresentationProgress, 0);
  objc_storeStrong((id *)&self->__sliderPresentationProgress, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__touchingSliderGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__handleBarView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__valueLabelContainer, 0);
  objc_storeStrong((id *)&self->__hitTestingBackground, 0);
  objc_storeStrong((id *)&self->__menuVisibility, 0);
  objc_storeStrong((id *)&self->__screenLuminanceObserverLayer, 0);
  objc_storeStrong((id *)&self->__backgroundAnimator, 0);
  objc_storeStrong((id *)&self->__backgroundDroplet, 0);
  objc_storeStrong((id *)&self->__backgroundContext, 0);
  objc_storeStrong((id *)&self->_sliderState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tipAnchor, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->__progressiveEdgeBlurFilter, 0);
  objc_storeStrong((id *)&self->__dialEffectMesh, 0);
  objc_storeStrong((id *)&self->__scaleSettings, 0);
  objc_storeStrong((id *)&self->__backgroundAnimationSettings, 0);
}

@end
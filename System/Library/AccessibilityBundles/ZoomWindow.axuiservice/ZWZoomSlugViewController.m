@interface ZWZoomSlugViewController
+ (double)longPressDurationForStandByMode:(BOOL)a3;
+ (double)standByLongPressDuration;
+ (double)zoomedInLongPressDuration;
- (AXAssertion)disableDashBoardGesturesForLongPressAssertion;
- (AXAssertion)disableDashBoardGesturesForPanAssertion;
- (AXDispatchTimer)dimTimer;
- (BOOL)_panGestureIsRecognizing;
- (BOOL)allGesturesEnabled;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)inSpeakUnderFingerMode;
- (BOOL)isInPanZoomingMode;
- (BOOL)isInUserRepositioningMode;
- (BOOL)isOrbPanning;
- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3;
- (BOOL)shouldHideWhileOrbing;
- (BOOL)tapGesturesEnabled;
- (BOOL)userIsInteractingWithSlug;
- (CGPoint)deltaFromInitialTouch;
- (CGPoint)deltaFromLastPanEvent;
- (CGPoint)offsetForAutopanner:(id)a3;
- (CGRect)foreheadRect;
- (CGRect)slugRingViewBoundsInScreenCoordinates;
- (NSLayoutConstraint)bottomTriangleRadiusDistanceConstraint;
- (NSLayoutConstraint)circlePivotHeightConstraint;
- (NSLayoutConstraint)circlePivotOffsetXConstraint;
- (NSLayoutConstraint)circlePivotOffsetYConstraint;
- (NSLayoutConstraint)circlePivotWidthConstraint;
- (NSLayoutConstraint)collapsingRingHeightConstraint;
- (NSLayoutConstraint)collapsingRingWidthConstraint;
- (NSLayoutConstraint)leftTriangleRadiusDistanceConstraint;
- (NSLayoutConstraint)rightTriangleRadiusDistanceConstraint;
- (NSLayoutConstraint)topTriangleRadiusDistanceConstraint;
- (UILongPressGestureRecognizer)longPress;
- (UILongPressGestureRecognizer)longPressGesture;
- (UIPanGestureRecognizer)panGesture;
- (UITapGestureRecognizer)doubleTapGesture;
- (UITapGestureRecognizer)singleTapGesture;
- (UITapGestureRecognizer)tripleTapGesture;
- (ZWSlugCirclePivotingView)circlePivotingView;
- (ZWSlugCollapsingRingView)slugRingView;
- (ZWSlugTriangleView)bottomTriangleView;
- (ZWSlugTriangleView)leftTriangleView;
- (ZWSlugTriangleView)rightTriangleView;
- (ZWSlugTriangleView)topTriangleView;
- (ZWZoomSlugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ZWZoomSlugViewControllerDelegate)delegate;
- (double)currentOffsetAngle;
- (double)idleSlugOpacity;
- (unint64_t)slugAppearanceState;
- (void)_didBeginInteractingWithSlug;
- (void)_didFinishInteractingWithSlug;
- (void)_dimAfterDelay;
- (void)_handleDoubleTap:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_handlePan:(id)a3;
- (void)_handleSingleTap:(id)a3;
- (void)_handleTripleTap:(id)a3;
- (void)_updateAccessibilityHint;
- (void)_updateControllerColor;
- (void)_updateControllerThickness;
- (void)_updateGestures;
- (void)_updateRingAndTriangleVisiblity:(BOOL)a3;
- (void)_updateSlugAppearanceForMode:(unint64_t)a3;
- (void)_updateSlugDimStatus:(BOOL)a3 Animated:(BOOL)a4;
- (void)dealloc;
- (void)loadView;
- (void)setAllGesturesEnabled:(BOOL)a3;
- (void)setBottomTriangleRadiusDistanceConstraint:(id)a3;
- (void)setBottomTriangleView:(id)a3;
- (void)setCirclePivotHeightConstraint:(id)a3;
- (void)setCirclePivotOffsetXConstraint:(id)a3;
- (void)setCirclePivotOffsetYConstraint:(id)a3;
- (void)setCirclePivotWidthConstraint:(id)a3;
- (void)setCirclePivotingView:(id)a3;
- (void)setCollapsingRingHeightConstraint:(id)a3;
- (void)setCollapsingRingWidthConstraint:(id)a3;
- (void)setCurrentOffsetAngle:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDeltaFromInitialTouch:(CGPoint)a3;
- (void)setDeltaFromLastPanEvent:(CGPoint)a3;
- (void)setDimTimer:(id)a3;
- (void)setDisableDashBoardGesturesForLongPressAssertion:(id)a3;
- (void)setDisableDashBoardGesturesForPanAssertion:(id)a3;
- (void)setDoubleTapGesture:(id)a3;
- (void)setIdleSlugOpacity:(double)a3;
- (void)setInPanZoomingMode:(BOOL)a3;
- (void)setInSpeakUnderFingerMode:(BOOL)a3;
- (void)setInUserRepositioningMode:(BOOL)a3;
- (void)setIsOrbPanning:(BOOL)a3;
- (void)setLeftTriangleRadiusDistanceConstraint:(id)a3;
- (void)setLeftTriangleView:(id)a3;
- (void)setLongPress:(id)a3;
- (void)setLongPressGesture:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setRightTriangleRadiusDistanceConstraint:(id)a3;
- (void)setRightTriangleView:(id)a3;
- (void)setShouldHideWhileOrbing:(BOOL)a3;
- (void)setSingleTapGesture:(id)a3;
- (void)setSlugAppearanceState:(unint64_t)a3;
- (void)setSlugRingView:(id)a3;
- (void)setTapGesturesEnabled:(BOOL)a3;
- (void)setTopTriangleRadiusDistanceConstraint:(id)a3;
- (void)setTopTriangleView:(id)a3;
- (void)setTripleTapGesture:(id)a3;
- (void)setUserIsInteractingWithSlug:(BOOL)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)updateIdleSlugOpacityAndPreviewImmediately:(double)a3;
- (void)updateLongPressDuration:(double)a3;
- (void)updateUIForSpeakFingerStateChange;
- (void)userInteractionHasBecomeActiveWithFirstTouchAtLocation:(CGPoint)a3;
- (void)userInteractionHasBecomeIdle;
- (void)wakeSlug;
@end

@implementation ZWZoomSlugViewController

- (ZWZoomSlugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)ZWZoomSlugViewController;
  v8 = [(ZWZoomSlugViewController *)&v34 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = +[AXSettings sharedInstance];
    [v9 zoomIdleSlugOpacity];
    objc_msgSend(v8, "setIdleSlugOpacity:");

    id v10 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [v8 setDimTimer:v10];

    v8[92] = 1;
    v8[91] = 1;
    id v11 = objc_alloc_init((Class)SBSSystemApertureLayoutMonitor);
    v12 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v11;

    [*((id *)v8 + 6) addObserver:v8];
    *(_OWORD *)(v8 + 56) = 0u;
    *(_OWORD *)(v8 + 72) = 0u;
    objc_initWeak(&location, v8);
    v13 = +[AXSettings sharedInstance];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke;
    v31[3] = &unk_78C80;
    objc_copyWeak(&v32, &location);
    [v13 registerUpdateBlock:v31 forRetrieveSelector:"zoomSlugSingleTapAction" withListener:v8];

    objc_destroyWeak(&v32);
    v14 = +[AXSettings sharedInstance];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_2;
    v29[3] = &unk_78C80;
    objc_copyWeak(&v30, &location);
    [v14 registerUpdateBlock:v29 forRetrieveSelector:"zoomSlugDoubleTapAction" withListener:v8];

    objc_destroyWeak(&v30);
    v15 = +[AXSettings sharedInstance];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_3;
    v27[3] = &unk_78C80;
    objc_copyWeak(&v28, &location);
    [v15 registerUpdateBlock:v27 forRetrieveSelector:"zoomSlugTripleTapAction" withListener:v8];

    objc_destroyWeak(&v28);
    v16 = +[AXSettings sharedInstance];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_4;
    v25[3] = &unk_78C80;
    objc_copyWeak(&v26, &location);
    [v16 registerUpdateBlock:v25 forRetrieveSelector:"zoomSlugTapAndSlideToAdjustZoomLevelEnabled" withListener:v8];

    objc_destroyWeak(&v26);
    v17 = +[AXSettings sharedInstance];
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_5;
    v23 = &unk_78C80;
    objc_copyWeak(&v24, &location);
    [v17 registerUpdateBlock:&v20 forRetrieveSelector:"zoomControllerColor" withListener:v8];

    objc_destroyWeak(&v24);
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v8 selector:"_updateControllerThickness" name:kAXSEnhanceTextLegibilityChangedNotification object:0];

    objc_destroyWeak(&location);
  }

  return (ZWZoomSlugViewController *)v8;
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestures];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateAccessibilityHint];
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestures];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateAccessibilityHint];
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestures];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateAccessibilityHint];
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestures];
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateControllerColor];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ZWZoomSlugViewController;
  [(ZWZoomSlugViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = [ZWSlugBackgroundView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = -[ZWSlugBackgroundView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ZWSlugBackgroundView *)v7 setSemanticContentAttribute:2];
  [(ZWSlugBackgroundView *)v7 setAccessibilityIgnoresInvertColors:1];
  [(ZWSlugBackgroundView *)v7 setDelegate:self];
  [(ZWZoomSlugViewController *)self setView:v7];
  v8 = [(ZWZoomSlugViewController *)self view];
  [v8 setHidden:1];

  v9 = -[ZWSlugCollapsingRingView initWithFrame:]([ZWSlugCollapsingRingView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ZWSlugBackgroundView *)v7 addSubview:v9];
  [(ZWZoomSlugViewController *)self setSlugRingView:v9];
  id v10 = -[ZWSlugCirclePivotingView initWithFrame:]([ZWSlugCirclePivotingView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ZWSlugBackgroundView *)v7 addSubview:v10];
  [(ZWZoomSlugViewController *)self setCirclePivotingView:v10];
  v81 = [[ZWSlugTriangleView alloc] initWithTriangle:3];
  [(ZWSlugBackgroundView *)v7 addSubview:v81];
  [(ZWZoomSlugViewController *)self setLeftTriangleView:v81];
  v82 = [[ZWSlugTriangleView alloc] initWithTriangle:1];
  [(ZWSlugBackgroundView *)v7 addSubview:v82];
  [(ZWZoomSlugViewController *)self setRightTriangleView:v82];
  v79 = [[ZWSlugTriangleView alloc] initWithTriangle:2];
  [(ZWSlugBackgroundView *)v7 addSubview:v79];
  [(ZWZoomSlugViewController *)self setBottomTriangleView:v79];
  v80 = [[ZWSlugTriangleView alloc] initWithTriangle:0];
  [(ZWSlugBackgroundView *)v7 addSubview:v80];
  [(ZWZoomSlugViewController *)self setTopTriangleView:v80];
  [(ZWSlugBackgroundView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = +[NSLayoutConstraint constraintWithItem:v7 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:150.0];
  [(ZWSlugBackgroundView *)v7 addConstraint:v11];

  v12 = +[NSLayoutConstraint constraintWithItem:v7 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:150.0];
  [(ZWSlugBackgroundView *)v7 addConstraint:v12];

  LODWORD(v13) = 1148846080;
  [(ZWSlugBackgroundView *)v7 setContentCompressionResistancePriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(ZWSlugBackgroundView *)v7 setContentCompressionResistancePriority:1 forAxis:v14];
  LODWORD(v15) = 1148846080;
  [(ZWSlugBackgroundView *)v7 setContentHuggingPriority:0 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [(ZWSlugBackgroundView *)v7 setContentHuggingPriority:1 forAxis:v16];
  [(ZWSlugCollapsingRingView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v17) = 1148846080;
  [(ZWSlugCollapsingRingView *)v9 setContentCompressionResistancePriority:0 forAxis:v17];
  LODWORD(v18) = 1148846080;
  [(ZWSlugCollapsingRingView *)v9 setContentCompressionResistancePriority:1 forAxis:v18];
  LODWORD(v19) = 1148846080;
  [(ZWSlugCollapsingRingView *)v9 setContentHuggingPriority:0 forAxis:v19];
  LODWORD(v20) = 1148846080;
  [(ZWSlugCollapsingRingView *)v9 setContentHuggingPriority:1 forAxis:v20];
  uint64_t v21 = +[NSLayoutConstraint constraintWithItem:v9 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:60.0];
  [(ZWZoomSlugViewController *)self setCollapsingRingWidthConstraint:v21];

  v22 = +[NSLayoutConstraint constraintWithItem:v9 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:60.0];
  [(ZWZoomSlugViewController *)self setCollapsingRingHeightConstraint:v22];

  v23 = [(ZWZoomSlugViewController *)self collapsingRingWidthConstraint];
  v84[0] = v23;
  id v24 = [(ZWZoomSlugViewController *)self collapsingRingHeightConstraint];
  v84[1] = v24;
  v25 = +[NSLayoutConstraint constraintWithItem:v9 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  v84[2] = v25;
  id v26 = +[NSLayoutConstraint constraintWithItem:v9 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:0.0];
  v84[3] = v26;
  v27 = +[NSArray arrayWithObjects:v84 count:4];
  [(ZWSlugBackgroundView *)v7 addConstraints:v27];

  [(ZWSlugCirclePivotingView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v28) = 1148846080;
  [(ZWSlugCirclePivotingView *)v10 setContentCompressionResistancePriority:0 forAxis:v28];
  LODWORD(v29) = 1148846080;
  [(ZWSlugCirclePivotingView *)v10 setContentCompressionResistancePriority:1 forAxis:v29];
  LODWORD(v30) = 1148846080;
  [(ZWSlugCirclePivotingView *)v10 setContentHuggingPriority:0 forAxis:v30];
  LODWORD(v31) = 1148846080;
  [(ZWSlugCirclePivotingView *)v10 setContentHuggingPriority:1 forAxis:v31];
  id v32 = +[NSLayoutConstraint constraintWithItem:v10 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:16.0];
  [(ZWZoomSlugViewController *)self setCirclePivotWidthConstraint:v32];

  v33 = +[NSLayoutConstraint constraintWithItem:v10 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:16.0];
  [(ZWZoomSlugViewController *)self setCirclePivotHeightConstraint:v33];

  objc_super v34 = +[NSLayoutConstraint constraintWithItem:v10 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [(ZWZoomSlugViewController *)self setCirclePivotOffsetXConstraint:v34];

  v35 = +[NSLayoutConstraint constraintWithItem:v10 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:0.0];
  [(ZWZoomSlugViewController *)self setCirclePivotOffsetYConstraint:v35];

  v36 = [(ZWZoomSlugViewController *)self circlePivotWidthConstraint];
  v83[0] = v36;
  v37 = [(ZWZoomSlugViewController *)self circlePivotHeightConstraint];
  v83[1] = v37;
  v38 = [(ZWZoomSlugViewController *)self circlePivotOffsetXConstraint];
  v83[2] = v38;
  v39 = [(ZWZoomSlugViewController *)self circlePivotOffsetYConstraint];
  v83[3] = v39;
  v40 = +[NSArray arrayWithObjects:v83 count:4];
  [(ZWSlugBackgroundView *)v7 addConstraints:v40];

  [(ZWSlugTriangleView *)v80 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v41) = 1148846080;
  [(ZWSlugTriangleView *)v80 setContentCompressionResistancePriority:0 forAxis:v41];
  LODWORD(v42) = 1148846080;
  [(ZWSlugTriangleView *)v80 setContentCompressionResistancePriority:1 forAxis:v42];
  LODWORD(v43) = 1148846080;
  [(ZWSlugTriangleView *)v80 setContentHuggingPriority:0 forAxis:v43];
  LODWORD(v44) = 1148846080;
  [(ZWSlugTriangleView *)v80 setContentHuggingPriority:1 forAxis:v44];
  v45 = +[NSLayoutConstraint constraintWithItem:v80 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [(ZWSlugBackgroundView *)v7 addConstraint:v45];

  v46 = +[NSLayoutConstraint constraintWithItem:v80 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:-20.0];
  [(ZWZoomSlugViewController *)self setTopTriangleRadiusDistanceConstraint:v46];

  v47 = [(ZWZoomSlugViewController *)self topTriangleRadiusDistanceConstraint];
  [(ZWSlugBackgroundView *)v7 addConstraint:v47];

  [(ZWSlugTriangleView *)v79 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v48) = 1148846080;
  [(ZWSlugTriangleView *)v79 setContentCompressionResistancePriority:0 forAxis:v48];
  LODWORD(v49) = 1148846080;
  [(ZWSlugTriangleView *)v79 setContentCompressionResistancePriority:1 forAxis:v49];
  LODWORD(v50) = 1148846080;
  [(ZWSlugTriangleView *)v79 setContentHuggingPriority:0 forAxis:v50];
  LODWORD(v51) = 1148846080;
  [(ZWSlugTriangleView *)v79 setContentHuggingPriority:1 forAxis:v51];
  v52 = +[NSLayoutConstraint constraintWithItem:v79 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [(ZWSlugBackgroundView *)v7 addConstraint:v52];

  v53 = +[NSLayoutConstraint constraintWithItem:v79 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:20.0];
  [(ZWZoomSlugViewController *)self setBottomTriangleRadiusDistanceConstraint:v53];

  v54 = [(ZWZoomSlugViewController *)self bottomTriangleRadiusDistanceConstraint];
  [(ZWSlugBackgroundView *)v7 addConstraint:v54];

  [(ZWSlugTriangleView *)v81 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v55) = 1148846080;
  [(ZWSlugTriangleView *)v81 setContentCompressionResistancePriority:0 forAxis:v55];
  LODWORD(v56) = 1148846080;
  [(ZWSlugTriangleView *)v81 setContentCompressionResistancePriority:1 forAxis:v56];
  LODWORD(v57) = 1148846080;
  [(ZWSlugTriangleView *)v81 setContentHuggingPriority:0 forAxis:v57];
  LODWORD(v58) = 1148846080;
  [(ZWSlugTriangleView *)v81 setContentHuggingPriority:1 forAxis:v58];
  v59 = +[NSLayoutConstraint constraintWithItem:v81 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:0.0];
  [(ZWSlugBackgroundView *)v7 addConstraint:v59];

  v60 = +[NSLayoutConstraint constraintWithItem:v81 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:-20.0];
  [(ZWZoomSlugViewController *)self setLeftTriangleRadiusDistanceConstraint:v60];

  v61 = [(ZWZoomSlugViewController *)self leftTriangleRadiusDistanceConstraint];
  [(ZWSlugBackgroundView *)v7 addConstraint:v61];

  [(ZWSlugTriangleView *)v82 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v62) = 1148846080;
  [(ZWSlugTriangleView *)v82 setContentCompressionResistancePriority:0 forAxis:v62];
  LODWORD(v63) = 1148846080;
  [(ZWSlugTriangleView *)v82 setContentCompressionResistancePriority:1 forAxis:v63];
  LODWORD(v64) = 1148846080;
  [(ZWSlugTriangleView *)v82 setContentHuggingPriority:0 forAxis:v64];
  LODWORD(v65) = 1148846080;
  [(ZWSlugTriangleView *)v82 setContentHuggingPriority:1 forAxis:v65];
  v66 = +[NSLayoutConstraint constraintWithItem:v82 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:0.0];
  [(ZWSlugBackgroundView *)v7 addConstraint:v66];

  v67 = +[NSLayoutConstraint constraintWithItem:v82 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:20.0];
  [(ZWZoomSlugViewController *)self setRightTriangleRadiusDistanceConstraint:v67];

  v68 = [(ZWZoomSlugViewController *)self rightTriangleRadiusDistanceConstraint];
  [(ZWSlugBackgroundView *)v7 addConstraint:v68];

  id v69 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleLongPress:"];
  v70 = [(ZWZoomSlugViewController *)self view];
  [v70 addGestureRecognizer:v69];

  [(ZWZoomSlugViewController *)self setLongPressGesture:v69];
  [v69 setDelegate:self];
  +[ZWZoomSlugViewController standByLongPressDuration];
  objc_msgSend(v69, "setMinimumPressDuration:");
  [(ZWZoomSlugViewController *)self setLongPress:v69];
  id v71 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTripleTap:"];
  [v71 setNumberOfTapsRequired:3];
  v72 = [(ZWZoomSlugViewController *)self view];
  [v72 addGestureRecognizer:v71];

  [(ZWZoomSlugViewController *)self setTripleTapGesture:v71];
  [v71 setDelegate:self];
  id v73 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleDoubleTap:"];
  [v73 setNumberOfTapsRequired:2];
  v74 = [(ZWZoomSlugViewController *)self view];
  [v74 addGestureRecognizer:v73];

  [(ZWZoomSlugViewController *)self setDoubleTapGesture:v73];
  [v73 setDelegate:self];
  [v73 requireGestureRecognizerToFail:v71];
  id v75 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleSingleTap:"];
  v76 = [(ZWZoomSlugViewController *)self view];
  [v76 addGestureRecognizer:v75];

  [(ZWZoomSlugViewController *)self setSingleTapGesture:v75];
  [v75 setDelegate:self];
  [v75 requireGestureRecognizerToFail:v73];
  [v75 requireGestureRecognizerToFail:v71];
  id v77 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"_handlePan:"];
  v78 = [(ZWZoomSlugViewController *)self view];
  [v78 addGestureRecognizer:v77];

  [(ZWZoomSlugViewController *)self setPanGesture:v77];
  [v77 setDelegate:self];
  [(ZWZoomSlugViewController *)self _updateGestures];
  [(ZWZoomSlugViewController *)self _dimAfterDelay];
  [(ZWZoomSlugViewController *)self _updateControllerColor];
  [(ZWZoomSlugViewController *)self _updateControllerThickness];
  [(ZWZoomSlugViewController *)self _updateAccessibilityHint];
}

- (CGRect)slugRingViewBoundsInScreenCoordinates
{
  v2 = [(ZWZoomSlugViewController *)self slugRingView];
  objc_msgSend(v2, "zw_convertBoundsToScreenCoordinates");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateLongPressDuration:(double)a3
{
  id v4 = [(ZWZoomSlugViewController *)self longPress];
  [v4 setMinimumPressDuration:a3];
}

+ (double)standByLongPressDuration
{
  return 0.2;
}

+ (double)zoomedInLongPressDuration
{
  return 0.5;
}

+ (double)longPressDurationForStandByMode:(BOOL)a3
{
  if (a3) {
    [a1 standByLongPressDuration];
  }
  else {
    [a1 zoomedInLongPressDuration];
  }
  return result;
}

- (void)setShouldHideWhileOrbing:(BOOL)a3
{
  if (self->_shouldHideWhileOrbing != a3)
  {
    BOOL v3 = a3;
    self->_shouldHideWhileOrbing = a3;
    -[ZWZoomSlugViewController _updateSlugDimStatus:Animated:](self, "_updateSlugDimStatus:Animated:");
    if (v3)
    {
      if (![(ZWZoomSlugViewController *)self isOrbPanning]) {
        [(ZWZoomSlugViewController *)self setAllGesturesEnabled:0];
      }
      [(ZWZoomSlugViewController *)self _updateSlugAppearanceForMode:0];
    }
    else
    {
      [(ZWZoomSlugViewController *)self setAllGesturesEnabled:1];
      [(ZWZoomSlugViewController *)self _dimAfterDelay];
    }
  }
}

- (CGRect)foreheadRect
{
  double x = self->_foreheadRect.origin.x;
  double y = self->_foreheadRect.origin.y;
  double width = self->_foreheadRect.size.width;
  double height = self->_foreheadRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_updateSlugAppearanceForMode:(unint64_t)a3
{
  if ([(ZWZoomSlugViewController *)self slugAppearanceState] != a3)
  {
    if (a3 == 2)
    {
      v36 = +[AXSettings sharedInstance];
      unsigned int v37 = [v36 zoomAutopannerShouldPanWithAcceleration];

      if (v37)
      {
        v38 = [(ZWZoomSlugViewController *)self collapsingRingWidthConstraint];
        [v38 setConstant:150.0];

        v39 = [(ZWZoomSlugViewController *)self collapsingRingHeightConstraint];
        [v39 setConstant:150.0];
      }
      else
      {
        v40 = [(ZWZoomSlugViewController *)self view];
        double v41 = [v40 superview];
        [v41 bounds];
        double v43 = v42 / 5.0;
        double v44 = [(ZWZoomSlugViewController *)self collapsingRingWidthConstraint];
        [v44 setConstant:v43];

        v45 = [(ZWZoomSlugViewController *)self view];
        v46 = [v45 superview];
        [v46 bounds];
        double v48 = v47 / 5.0;
        double v49 = [(ZWZoomSlugViewController *)self collapsingRingHeightConstraint];
        [v49 setConstant:v48];

        double v50 = [(ZWZoomSlugViewController *)self slugRingView];
        [v50 setShouldUseContinuousCornerRadius:0];

        v39 = [(ZWZoomSlugViewController *)self circlePivotingView];
        [v39 setShouldUseRoundedRect:1];
      }

      double v51 = [(ZWZoomSlugViewController *)self circlePivotWidthConstraint];
      [v51 setConstant:38.0];

      v52 = [(ZWZoomSlugViewController *)self circlePivotHeightConstraint];
      [v52 setConstant:38.0];

      v53 = +[AXSettings sharedInstance];
      unsigned int v54 = [v53 zoomAutopannerShouldPanWithAcceleration];

      if (v54)
      {
        double v55 = [(ZWZoomSlugViewController *)self leftTriangleRadiusDistanceConstraint];
        [v55 setConstant:-55.0];

        double v56 = [(ZWZoomSlugViewController *)self topTriangleRadiusDistanceConstraint];
        [v56 setConstant:-55.0];

        double v57 = [(ZWZoomSlugViewController *)self rightTriangleRadiusDistanceConstraint];
        [v57 setConstant:55.0];

        objc_super v34 = [(ZWZoomSlugViewController *)self bottomTriangleRadiusDistanceConstraint];
        [v34 setConstant:55.0];
LABEL_16:

        goto LABEL_17;
      }
      double v58 = [(ZWZoomSlugViewController *)self leftTriangleView];
      [v58 setHidden:1];

      v59 = [(ZWZoomSlugViewController *)self rightTriangleView];
      [v59 setHidden:1];

      v60 = [(ZWZoomSlugViewController *)self topTriangleView];
      [v60 setHidden:1];

      v33 = [(ZWZoomSlugViewController *)self bottomTriangleView];
      objc_super v34 = v33;
      uint64_t v35 = 1;
LABEL_15:
      [v33 setHidden:v35];
      goto LABEL_16;
    }
    if (a3 == 1)
    {
      double v19 = [(ZWZoomSlugViewController *)self collapsingRingWidthConstraint];
      [v19 setConstant:78.0];

      double v20 = [(ZWZoomSlugViewController *)self collapsingRingHeightConstraint];
      [v20 setConstant:78.0];

      uint64_t v21 = [(ZWZoomSlugViewController *)self slugRingView];
      [v21 setShouldUseContinuousCornerRadius:1];

      v22 = [(ZWZoomSlugViewController *)self circlePivotingView];
      [v22 setShouldUseRoundedRect:0];

      v23 = [(ZWZoomSlugViewController *)self circlePivotWidthConstraint];
      [v23 setConstant:38.0];

      id v24 = [(ZWZoomSlugViewController *)self circlePivotHeightConstraint];
      [v24 setConstant:38.0];

      v25 = [(ZWZoomSlugViewController *)self circlePivotOffsetXConstraint];
      [v25 setConstant:0.0];

      id v26 = [(ZWZoomSlugViewController *)self circlePivotOffsetYConstraint];
      [v26 setConstant:0.0];

      v27 = [(ZWZoomSlugViewController *)self leftTriangleRadiusDistanceConstraint];
      [v27 setConstant:-30.0];

      double v28 = [(ZWZoomSlugViewController *)self topTriangleRadiusDistanceConstraint];
      [v28 setConstant:-30.0];

      double v29 = [(ZWZoomSlugViewController *)self rightTriangleRadiusDistanceConstraint];
      [v29 setConstant:30.0];

      double v16 = [(ZWZoomSlugViewController *)self bottomTriangleRadiusDistanceConstraint];
      double v17 = v16;
      double v18 = 30.0;
    }
    else
    {
      if (a3) {
        goto LABEL_17;
      }
      double v5 = [(ZWZoomSlugViewController *)self collapsingRingWidthConstraint];
      [v5 setConstant:60.0];

      double v6 = [(ZWZoomSlugViewController *)self collapsingRingHeightConstraint];
      [v6 setConstant:60.0];

      double v7 = [(ZWZoomSlugViewController *)self slugRingView];
      [v7 setShouldUseContinuousCornerRadius:1];

      double v8 = [(ZWZoomSlugViewController *)self circlePivotingView];
      [v8 setShouldUseRoundedRect:0];

      double v9 = [(ZWZoomSlugViewController *)self circlePivotWidthConstraint];
      [v9 setConstant:16.0];

      double v10 = [(ZWZoomSlugViewController *)self circlePivotHeightConstraint];
      [v10 setConstant:16.0];

      double v11 = [(ZWZoomSlugViewController *)self circlePivotOffsetXConstraint];
      [v11 setConstant:0.0];

      double v12 = [(ZWZoomSlugViewController *)self circlePivotOffsetYConstraint];
      [v12 setConstant:0.0];

      double v13 = [(ZWZoomSlugViewController *)self leftTriangleRadiusDistanceConstraint];
      [v13 setConstant:-20.0];

      double v14 = [(ZWZoomSlugViewController *)self topTriangleRadiusDistanceConstraint];
      [v14 setConstant:-20.0];

      double v15 = [(ZWZoomSlugViewController *)self rightTriangleRadiusDistanceConstraint];
      [v15 setConstant:20.0];

      double v16 = [(ZWZoomSlugViewController *)self bottomTriangleRadiusDistanceConstraint];
      double v17 = v16;
      double v18 = 20.0;
    }
    [v16 setConstant:v18];

    if (![(ZWZoomSlugViewController *)self inSpeakUnderFingerMode])
    {
      double v30 = [(ZWZoomSlugViewController *)self leftTriangleView];
      [v30 setHidden:0];

      double v31 = [(ZWZoomSlugViewController *)self rightTriangleView];
      [v31 setHidden:0];

      id v32 = [(ZWZoomSlugViewController *)self topTriangleView];
      [v32 setHidden:0];

      v33 = [(ZWZoomSlugViewController *)self bottomTriangleView];
      objc_super v34 = v33;
      uint64_t v35 = 0;
      goto LABEL_15;
    }
LABEL_17:
    v61 = [(ZWZoomSlugViewController *)self view];
    [v61 setNeedsLayout];

    double v62 = [(ZWZoomSlugViewController *)self circlePivotingView];
    [v62 setNeedsLayout];

    double v63 = [(ZWZoomSlugViewController *)self slugRingView];
    [v63 setNeedsLayout];

    double v64 = [(ZWZoomSlugViewController *)self topTriangleView];
    [v64 setNeedsLayout];

    double v65 = [(ZWZoomSlugViewController *)self rightTriangleView];
    [v65 setNeedsLayout];

    v66 = [(ZWZoomSlugViewController *)self bottomTriangleView];
    [v66 setNeedsLayout];

    v67 = [(ZWZoomSlugViewController *)self leftTriangleView];
    [v67 setNeedsLayout];

    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = __57__ZWZoomSlugViewController__updateSlugAppearanceForMode___block_invoke;
    v68[3] = &unk_78CA8;
    v68[4] = self;
    +[UIView animateWithDuration:0 delay:v68 options:0 animations:ZWDefaultZoomAnimationDuration() completion:0.0];
    [(ZWZoomSlugViewController *)self setSlugAppearanceState:a3];
  }
}

void __57__ZWZoomSlugViewController__updateSlugAppearanceForMode___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)_didBeginInteractingWithSlug
{
  [(ZWZoomSlugViewController *)self setUserIsInteractingWithSlug:1];
  if (![(ZWZoomSlugViewController *)self isOrbPanning])
  {
    [(ZWZoomSlugViewController *)self _updateSlugDimStatus:0 Animated:1];
  }
}

- (void)_didFinishInteractingWithSlug
{
  if (![(ZWZoomSlugViewController *)self userIsInteractingWithSlug]) {
    _AXAssert();
  }
  [(ZWZoomSlugViewController *)self setUserIsInteractingWithSlug:0];
  [(ZWZoomSlugViewController *)self _updateSlugAppearanceForMode:0];

  [(ZWZoomSlugViewController *)self _dimAfterDelay];
}

- (void)updateIdleSlugOpacityAndPreviewImmediately:(double)a3
{
  [(ZWZoomSlugViewController *)self setIdleSlugOpacity:a3];

  [(ZWZoomSlugViewController *)self _updateSlugDimStatus:1 Animated:0];
}

- (void)wakeSlug
{
  [(ZWZoomSlugViewController *)self _updateSlugDimStatus:0 Animated:1];

  [(ZWZoomSlugViewController *)self _dimAfterDelay];
}

- (void)_dimAfterDelay
{
  BOOL v3 = [(ZWZoomSlugViewController *)self dimTimer];
  [v3 cancel];

  id v4 = [(ZWZoomSlugViewController *)self dimTimer];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __42__ZWZoomSlugViewController__dimAfterDelay__block_invoke;
  v5[3] = &unk_78CA8;
  v5[4] = self;
  [v4 afterDelay:v5 processBlock:2.0];
}

id __42__ZWZoomSlugViewController__dimAfterDelay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSlugDimStatus:1 Animated:1];
}

- (void)_updateSlugDimStatus:(BOOL)a3 Animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(ZWZoomSlugViewController *)self dimTimer];
  [v7 cancel];

  double v8 = 1.0;
  if (v5)
  {
    double v8 = 0.0;
    if (!self->_shouldHideWhileOrbing)
    {
      [(ZWZoomSlugViewController *)self idleSlugOpacity];
      double v8 = v9;
    }
  }
  double v10 = 0.0;
  if (v4) {
    double v10 = ZWDefaultFadeAnimationDuration();
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __58__ZWZoomSlugViewController__updateSlugDimStatus_Animated___block_invoke;
  v11[3] = &unk_78E40;
  v11[4] = self;
  *(double *)&v11[5] = v8;
  +[UIView animateWithDuration:6 delay:v11 options:0 animations:v10 completion:0.0];
}

void __58__ZWZoomSlugViewController__updateSlugDimStatus_Animated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:v1];
}

- (void)_updateControllerColor
{
  BOOL v3 = +[AXSettings sharedInstance];
  [v3 zoomControllerColor];
  uint64_t v4 = AXUIZoomControllerColor();

  BOOL v5 = [(ZWZoomSlugViewController *)self circlePivotingView];
  double v6 = [v5 circleLayer];
  [v6 setFillColor:v4];

  double v7 = [(ZWZoomSlugViewController *)self topTriangleView];
  double v8 = [v7 triangleLayer];
  [v8 setFillColor:v4];

  double v9 = [(ZWZoomSlugViewController *)self rightTriangleView];
  double v10 = [v9 triangleLayer];
  [v10 setFillColor:v4];

  double v11 = [(ZWZoomSlugViewController *)self bottomTriangleView];
  double v12 = [v11 triangleLayer];
  [v12 setFillColor:v4];

  double v13 = [(ZWZoomSlugViewController *)self leftTriangleView];
  double v14 = [v13 triangleLayer];
  [v14 setFillColor:v4];

  double v15 = [(ZWZoomSlugViewController *)self slugRingView];
  double v16 = [v15 layer];
  [v16 setBorderColor:v4];

  [(ZWZoomSlugViewController *)self wakeSlug];
}

- (void)_updateControllerThickness
{
  if (UIAccessibilityIsBoldTextEnabled()) {
    double v3 = 4.0;
  }
  else {
    double v3 = 2.0;
  }
  id v5 = [(ZWZoomSlugViewController *)self slugRingView];
  uint64_t v4 = [v5 layer];
  [v4 setBorderWidth:v3];
}

- (void)_updateGestures
{
  BOOL allGesturesEnabled = self->_allGesturesEnabled;
  uint64_t v4 = [(ZWZoomSlugViewController *)self longPressGesture];
  [v4 setEnabled:allGesturesEnabled];

  BOOL v5 = self->_allGesturesEnabled;
  double v6 = [(ZWZoomSlugViewController *)self panGesture];
  [v6 setEnabled:v5];

  id v20 = +[AXSettings sharedInstance];
  id v7 = [v20 zoomSlugSingleTapAction];
  id v8 = [v20 zoomSlugDoubleTapAction];
  id v9 = [v20 zoomSlugTripleTapAction];
  unsigned int v10 = [v20 zoomSlugTapAndSlideToAdjustZoomLevelEnabled];
  if (v7) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = v10;
  }
  if (self->_tapGesturesEnabled) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  double v13 = [(ZWZoomSlugViewController *)self singleTapGesture];
  [v13 setEnabled:v12];

  BOOL v15 = self->_tapGesturesEnabled && v8 != 0;
  double v16 = [(ZWZoomSlugViewController *)self doubleTapGesture];
  [v16 setEnabled:v15];

  BOOL v18 = self->_tapGesturesEnabled && v9 != 0;
  double v19 = [(ZWZoomSlugViewController *)self tripleTapGesture];
  [v19 setEnabled:v18];
}

- (void)setAllGesturesEnabled:(BOOL)a3
{
  self->_BOOL allGesturesEnabled = a3;
  -[ZWZoomSlugViewController setTapGesturesEnabled:](self, "setTapGesturesEnabled:");
}

- (void)setTapGesturesEnabled:(BOOL)a3
{
  self->_tapGesturesEnabled = a3;
  [(ZWZoomSlugViewController *)self _updateGestures];
}

- (BOOL)_panGestureIsRecognizing
{
  id v2 = [(ZWZoomSlugViewController *)self panGesture];
  double v3 = (char *)[v2 state];

  return (unint64_t)(v3 - 1) < 2;
}

- (void)_handleSingleTap:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3
    && ![(ZWZoomSlugViewController *)self _panGestureIsRecognizing])
  {
    uint64_t v4 = +[AXSettings sharedInstance];
    id v5 = [v4 zoomSlugSingleTapAction];

    if (v5)
    {
      [(ZWZoomSlugViewController *)self _didBeginInteractingWithSlug];
      double v6 = [(ZWZoomSlugViewController *)self delegate];
      [v6 slugWasSingleTappedWithSlugViewController:self];

      [(ZWZoomSlugViewController *)self setInUserRepositioningMode:0];
      [(ZWZoomSlugViewController *)self _didFinishInteractingWithSlug];
    }
  }
}

- (void)_handleDoubleTap:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    uint64_t v4 = +[AXSettings sharedInstance];
    id v5 = [v4 zoomSlugDoubleTapAction];

    if (v5)
    {
      [(ZWZoomSlugViewController *)self _didBeginInteractingWithSlug];
      double v6 = [(ZWZoomSlugViewController *)self delegate];
      [v6 slugWasDoubleTappedWithSlugViewController:self];

      [(ZWZoomSlugViewController *)self setInUserRepositioningMode:0];
      [(ZWZoomSlugViewController *)self _didFinishInteractingWithSlug];
    }
  }
}

- (void)_handleTripleTap:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    uint64_t v4 = +[AXSettings sharedInstance];
    id v5 = [v4 zoomSlugTripleTapAction];

    if (v5)
    {
      [(ZWZoomSlugViewController *)self _didBeginInteractingWithSlug];
      double v6 = [(ZWZoomSlugViewController *)self delegate];
      [v6 slugWasTripleTappedWithSlugViewController:self];

      [(ZWZoomSlugViewController *)self setInUserRepositioningMode:0];
      [(ZWZoomSlugViewController *)self _didFinishInteractingWithSlug];
    }
  }
}

- (void)_handleLongPress:(id)a3
{
  uint64_t v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    if ([(ZWZoomSlugViewController *)self isOrbPanning])
    {
      id v5 = [(ZWZoomSlugViewController *)self delegate];
      [v5 endOrbZoomWithSlugViewController:self];

      [(ZWZoomSlugViewController *)self setIsOrbPanning:0];
    }
    else
    {
      [(ZWZoomSlugViewController *)self _updateSlugAppearanceForMode:0];
      [(ZWZoomSlugViewController *)self setInUserRepositioningMode:0];
    }
LABEL_9:
    [(ZWZoomSlugViewController *)self setDisableDashBoardGesturesForLongPressAssertion:0];
    return;
  }
  if (v4 == (unsigned char *)&dword_0 + 2) {
    return;
  }
  if (v4 != (unsigned char *)&dword_0 + 1) {
    goto LABEL_9;
  }
  [(ZWZoomSlugViewController *)self setIsOrbPanning:1];
  double v6 = [(ZWZoomSlugViewController *)self delegate];
  unsigned __int8 v7 = [v6 attemptOrbZoomIfAppropriateWithSlugViewController:self];

  if ((v7 & 1) == 0)
  {
    [(ZWZoomSlugViewController *)self setIsOrbPanning:0];
    [(ZWZoomSlugViewController *)self _updateSlugAppearanceForMode:1];
    [(ZWZoomSlugViewController *)self setInUserRepositioningMode:1];
    id v8 = +[AXAssertion assertionWithType:AXAssertionTypeDisableDashboardSystemGestures identifier:@"Zoom: slug longPress"];
    [(ZWZoomSlugViewController *)self setDisableDashBoardGesturesForLongPressAssertion:v8];
  }
}

- (void)_handlePan:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 state];
  if ((unint64_t)(v5 - 3) < 3)
  {
    [(ZWZoomSlugViewController *)self setDisableDashBoardGesturesForPanAssertion:0];
    [(ZWZoomSlugViewController *)self setTapGesturesEnabled:1];
    double v6 = [(ZWZoomSlugViewController *)self delegate];
    [v6 wantsToStopAutopannerWithSlugViewController:self];

    [(ZWZoomSlugViewController *)self _didFinishInteractingWithSlug];
    [(ZWZoomSlugViewController *)self setInUserRepositioningMode:0];
    double y = CGPointZero.y;
    -[ZWZoomSlugViewController setDeltaFromInitialTouch:](self, "setDeltaFromInitialTouch:", CGPointZero.x, y);
    -[ZWZoomSlugViewController setDeltaFromLastPanEvent:](self, "setDeltaFromLastPanEvent:", CGPointZero.x, y);
    [(ZWZoomSlugViewController *)self setCurrentOffsetAngle:0.0];
    [(ZWZoomSlugViewController *)self setInPanZoomingMode:0];
    self->_shouldHideWhileOrbing = 0;
    [(ZWZoomSlugViewController *)self wakeSlug];
    goto LABEL_25;
  }
  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    uint64_t v12 = [(ZWZoomSlugViewController *)self view];
    [v4 translationInView:v12];
    double v14 = v13;
    double v16 = v15;

    long double v17 = v14 - self->_firstTouchLocation.x;
    long double v18 = v16 - self->_firstTouchLocation.y;
    p_lastPanLocation = &self->_lastPanLocation;
    -[ZWZoomSlugViewController setDeltaFromLastPanEvent:](self, "setDeltaFromLastPanEvent:", v14 - self->_lastPanLocation.x, v16 - self->_lastPanLocation.y);
    [(ZWZoomSlugViewController *)self setCurrentOffsetAngle:(double)atan2(v18, v17)];
    -[ZWZoomSlugViewController setDeltaFromInitialTouch:](self, "setDeltaFromInitialTouch:", (double)v17, (double)v18);
    if ([(ZWZoomSlugViewController *)self isInPanZoomingMode])
    {
      id v20 = [(ZWZoomSlugViewController *)self delegate];
      [(ZWZoomSlugViewController *)self deltaFromInitialTouch];
      objc_msgSend(v20, "zoomSlugViewController:wantsToAdjustZoomLevelWithDelta:", self);
LABEL_23:

LABEL_24:
      p_lastPanLocation->double x = v14;
      p_lastPanLocation->double y = v16;
      goto LABEL_25;
    }
    if ([(ZWZoomSlugViewController *)self isOrbPanning])
    {
      double v30 = [(ZWZoomSlugViewController *)self view];
      [v30 center];
      double v32 = v14 + v31;
      v33 = [(ZWZoomSlugViewController *)self view];
      [v33 center];
      double v35 = v16 + v34;

      id v20 = [(ZWZoomSlugViewController *)self delegate];
      objc_msgSend(v20, "updateOrbZoomAtPoint:withSlugViewController:", self, v32, v35);
      goto LABEL_23;
    }
    if (![(ZWZoomSlugViewController *)self isInUserRepositioningMode])
    {
      double v56 = +[AXSettings sharedInstance];
      unsigned __int8 v57 = [v56 zoomAutopannerShouldPanWithAcceleration];

      if (v57)
      {
        [(ZWZoomSlugViewController *)self deltaFromInitialTouch];
        double v60 = v58;
        if (v58 <= 0.0)
        {
          if (v58 < 0.0 && v58 < -30.0) {
            double v60 = -30.0;
          }
        }
        else
        {
          double v60 = fmin(v58, 30.0);
        }
        if (v59 <= 0.0)
        {
          double v88 = -30.0;
          if (v59 >= -30.0) {
            double v88 = v59;
          }
          if (v59 < 0.0) {
            double v71 = v88;
          }
          else {
            double v71 = v59;
          }
        }
        else
        {
          double v71 = fmin(v59, 30.0);
        }
      }
      else
      {
        double v62 = [(ZWZoomSlugViewController *)self circlePivotOffsetXConstraint];
        [v62 constant];
        double v64 = v63;
        [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
        double v66 = v64 + v65;
        v67 = [(ZWZoomSlugViewController *)self circlePivotOffsetYConstraint];
        [v67 constant];
        double v69 = v68;
        [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
        double v71 = v69 + v70;

        v72 = [(ZWZoomSlugViewController *)self view];
        id v73 = [v72 superview];
        [v73 bounds];
        double v74 = 5.0 + 5.0;
        double v60 = v75 / (5.0 + 5.0) + -19.0 - 3.0;

        if (v66 < v60) {
          double v60 = v66;
        }
        v76 = [(ZWZoomSlugViewController *)self view];
        id v77 = [v76 superview];
        [v77 bounds];
        double v79 = -(v78 / v74 + -19.0 - 3.0);

        if (v60 < v79) {
          double v60 = v79;
        }
        v80 = [(ZWZoomSlugViewController *)self view];
        v81 = [v80 superview];
        [v81 bounds];
        double v83 = v82 / v74 + -19.0 - 3.0;

        if (v71 >= v83) {
          double v71 = v83;
        }
        v84 = [(ZWZoomSlugViewController *)self view];
        v85 = [v84 superview];
        [v85 bounds];
        double v87 = -(v86 / v74 + -19.0 - 3.0);

        if (v71 < v87) {
          double v71 = v87;
        }
      }
      v89 = [(ZWZoomSlugViewController *)self circlePivotOffsetXConstraint];
      [v89 setConstant:v60];

      v90 = [(ZWZoomSlugViewController *)self circlePivotOffsetYConstraint];
      [v90 setConstant:v71];

      goto LABEL_24;
    }
    if (!AXDeviceHasJindo())
    {
      id v20 = [(ZWZoomSlugViewController *)self delegate];
      v61 = [(ZWZoomSlugViewController *)self view];
      [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
      objc_msgSend(v20, "zoomSlugViewController:didDragSlug:withDelta:", self, v61);

      goto LABEL_23;
    }
    uint64_t v130 = 0;
    v131 = &v130;
    uint64_t v132 = 0x2020000000;
    int v133 = 0;
    AXPerformBlockSynchronouslyOnMainThread();
    int v36 = *((_DWORD *)v131 + 6);
    if (v36 == 4)
    {
      v129 = [(ZWZoomSlugViewController *)self view];
      [v129 frame];
      double v127 = v91;
      [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
      double v93 = v92;
      v128 = [(ZWZoomSlugViewController *)self view];
      v94 = [v128 superview];
      [v94 bounds];
      double v96 = v95;
      v97 = [(ZWZoomSlugViewController *)self view];
      [v97 frame];
      double v99 = v98;
      v100 = [(ZWZoomSlugViewController *)self view];
      [v100 frame];
      double v102 = v101;
      [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
      double v104 = v103;
      v105 = [(ZWZoomSlugViewController *)self view];
      [v105 frame];
      CGFloat v107 = v106;
      v108 = [(ZWZoomSlugViewController *)self view];
      [v108 frame];
      v137.size.double height = v109;
      v137.origin.double x = v127 + v93;
      v137.origin.double y = v96 - (v99 + v102 + 5.0 + v104);
      v137.size.double width = v107;
      CGRect v135 = CGRectIntersection(self->_foreheadRect, v137);
      BOOL IsNull = CGRectIsNull(v135);

      if (IsNull)
      {
LABEL_31:
        v53 = [(ZWZoomSlugViewController *)self delegate];
        unsigned int v54 = [(ZWZoomSlugViewController *)self view];
        [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
        objc_msgSend(v53, "zoomSlugViewController:didDragSlug:withDelta:", self, v54);
LABEL_63:

        _Block_object_dispose(&v130, 8);
        goto LABEL_24;
      }
      v53 = [(ZWZoomSlugViewController *)self delegate];
      unsigned int v54 = [(ZWZoomSlugViewController *)self view];
      v113 = [(ZWZoomSlugViewController *)self view];
      v116 = [v113 superview];
      [v116 bounds];
      double v118 = v117;
      double v119 = self->_foreheadRect.origin.y;
      double height = self->_foreheadRect.size.height;
      v121 = [(ZWZoomSlugViewController *)self view];
      [v121 frame];
      double v123 = v122;
      v124 = [(ZWZoomSlugViewController *)self view];
      [v124 frame];
      double v126 = v125;
      [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
      [v53 zoomSlugViewController:self didDragSlug:v54 withDelta:v118 - v119 - height - (v123 + v126)];
    }
    else
    {
      if (v36 != 3) {
        goto LABEL_31;
      }
      unsigned int v37 = [(ZWZoomSlugViewController *)self view];
      [v37 frame];
      double v39 = v38;
      [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
      double v41 = v40;
      double v42 = [(ZWZoomSlugViewController *)self view];
      [v42 frame];
      double v44 = v43;
      [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
      double v46 = v45;
      double v47 = [(ZWZoomSlugViewController *)self view];
      [v47 frame];
      CGFloat v49 = v48;
      double v50 = [(ZWZoomSlugViewController *)self view];
      [v50 frame];
      v136.size.double height = v51;
      v136.origin.double x = v39 + v41;
      v136.origin.double y = v44 + v46;
      v136.size.double width = v49;
      CGRect v134 = CGRectIntersection(self->_foreheadRect, v136);
      BOOL v52 = CGRectIsNull(v134);

      if (v52) {
        goto LABEL_31;
      }
      v53 = [(ZWZoomSlugViewController *)self delegate];
      unsigned int v54 = [(ZWZoomSlugViewController *)self view];
      double v111 = self->_foreheadRect.origin.y;
      double v112 = self->_foreheadRect.size.height;
      v113 = [(ZWZoomSlugViewController *)self view];
      [v113 frame];
      double v115 = v114;
      [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
      [v53 zoomSlugViewController:self didDragSlug:v54 withDelta:v111 + v112 - v115];
    }

    goto LABEL_63;
  }
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    id v8 = +[AXAssertion assertionWithType:AXAssertionTypeDisableDashboardSystemGestures identifier:@"Zoom: slug panning"];
    [(ZWZoomSlugViewController *)self setDisableDashBoardGesturesForPanAssertion:v8];

    unsigned __int8 v9 = [(ZWZoomSlugViewController *)self isInPanZoomingMode];
    unsigned int v10 = [(ZWZoomSlugViewController *)self singleTapGesture];
    if ([v10 state] == (char *)&dword_0 + 3)
    {
      unsigned int v11 = +[AXSettings sharedInstance];
      -[ZWZoomSlugViewController setInPanZoomingMode:](self, "setInPanZoomingMode:", [v11 zoomSlugTapAndSlideToAdjustZoomLevelEnabled]);
    }
    else
    {
      [(ZWZoomSlugViewController *)self setInPanZoomingMode:0];
    }

    if ((v9 & 1) == 0 && [(ZWZoomSlugViewController *)self isInPanZoomingMode])
    {
      uint64_t v21 = [(ZWZoomSlugViewController *)self delegate];
      [v21 prepareForSlugZoomPanningWithSlugViewController:self];
    }
    [(ZWZoomSlugViewController *)self setTapGesturesEnabled:0];
    v22 = [(ZWZoomSlugViewController *)self view];
    [v4 translationInView:v22];
    self->_lastPanLocation.double x = v23;
    self->_lastPanLocation.double y = v24;

    v25 = [(ZWZoomSlugViewController *)self view];
    [v4 translationInView:v25];
    self->_firstTouchLocation.double x = v26;
    self->_firstTouchLocation.double y = v27;

    [(ZWZoomSlugViewController *)self setCurrentOffsetAngle:0.0];
    [(ZWZoomSlugViewController *)self _didBeginInteractingWithSlug];
    if (![(ZWZoomSlugViewController *)self isInPanZoomingMode]
      && ![(ZWZoomSlugViewController *)self isOrbPanning])
    {
      if ([(ZWZoomSlugViewController *)self inSpeakUnderFingerMode]
        || ([(ZWZoomSlugViewController *)self delegate],
            double v28 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v29 = [v28 shouldBeginAutopanningLensWithSlugViewController:self],
            v28,
            (v29 & 1) == 0))
      {
        [(ZWZoomSlugViewController *)self setInUserRepositioningMode:1];
      }
      if ([(ZWZoomSlugViewController *)self isInUserRepositioningMode])
      {
        [(ZWZoomSlugViewController *)self _updateSlugAppearanceForMode:1];
      }
      else
      {
        [(ZWZoomSlugViewController *)self _updateSlugAppearanceForMode:2];
        double v55 = [(ZWZoomSlugViewController *)self delegate];
        [v55 wantsToStartAutopannerWithSlugViewController:self];

        self->_shouldHideWhileOrbing = 1;
        [(ZWZoomSlugViewController *)self _dimAfterDelay];
      }
    }
  }
  else
  {
    [(ZWZoomSlugViewController *)self setDisableDashBoardGesturesForPanAssertion:0];
  }
LABEL_25:
}

id __39__ZWZoomSlugViewController__handlePan___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) interfaceOrientation];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateAccessibilityHint
{
  double v3 = +[AXSettings sharedInstance];
  id v4 = (char *)[v3 zoomSlugSingleTapAction];

  id v5 = +[AXSettings sharedInstance];
  double v6 = (char *)[v5 zoomSlugDoubleTapAction];

  unsigned __int8 v7 = +[AXSettings sharedInstance];
  id v8 = (char *)[v7 zoomSlugTripleTapAction];

  id v16 = objc_alloc_init((Class)NSMutableString);
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    unsigned __int8 v9 = @"ZW_SLUG_HINT_SINGLE_TAP_ZOOM_MENU";
  }
  else
  {
    if (v4 != (unsigned char *)&dword_0 + 2) {
      goto LABEL_6;
    }
    unsigned __int8 v9 = @"ZW_SLUG_HINT_SINGLE_TAP_TOGGLE_ZOOM";
  }
  unsigned int v10 = ZWLocString(v9);
  [v16 appendString:v10];

  [v16 appendString:@" "];
LABEL_6:
  if (v6 == (unsigned char *)&dword_0 + 1)
  {
    unsigned int v11 = @"ZW_SLUG_HINT_DOUBLE_TAP_ZOOM_MENU";
  }
  else
  {
    if (v6 != (unsigned char *)&dword_0 + 2) {
      goto LABEL_11;
    }
    unsigned int v11 = @"ZW_SLUG_HINT_DOUBLE_TAP_TOGGLE_ZOOM";
  }
  uint64_t v12 = ZWLocString(v11);
  [v16 appendString:v12];

  [v16 appendString:@" "];
LABEL_11:
  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    double v13 = @"ZW_SLUG_HINT_TRIPLE_TAP_ZOOM_MENU";
  }
  else
  {
    if (v8 != (unsigned char *)&dword_0 + 2) {
      goto LABEL_16;
    }
    double v13 = @"ZW_SLUG_HINT_TRIPLE_TAP_TOGGLE_ZOOM";
  }
  double v14 = ZWLocString(v13);
  [v16 appendString:v14];

LABEL_16:
  double v15 = [(ZWZoomSlugViewController *)self view];
  [v15 setAccessibilityHint:v16];
}

- (void)_updateRingAndTriangleVisiblity:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ZWZoomSlugViewController *)self leftTriangleView];
  [v5 setHidden:v3];

  double v6 = [(ZWZoomSlugViewController *)self rightTriangleView];
  [v6 setHidden:v3];

  unsigned __int8 v7 = [(ZWZoomSlugViewController *)self topTriangleView];
  [v7 setHidden:v3];

  id v8 = [(ZWZoomSlugViewController *)self bottomTriangleView];
  [v8 setHidden:v3];

  unsigned __int8 v9 = [(ZWZoomSlugViewController *)self circlePivotingView];
  [v9 setHidden:v3];

  id v10 = [(ZWSlugCollapsingRingView *)self->_slugRingView speakFingerImageView];
  [v10 setHidden:v3 ^ 1];
}

- (void)updateUIForSpeakFingerStateChange
{
  BOOL v3 = +[AXSpeakFingerManager sharedInstance];
  id v4 = [v3 speakFingerState];

  switch((unint64_t)v4)
  {
    case 1uLL:
    case 4uLL:
      id v5 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v6 = @"Touch";
      goto LABEL_7;
    case 2uLL:
      [(ZWZoomSlugViewController *)self setInSpeakUnderFingerMode:0];
      [(ZWZoomSlugViewController *)self _updateRingAndTriangleVisiblity:0];
      break;
    case 3uLL:
      id v5 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v6 = @"Stop";
LABEL_7:
      unsigned __int8 v7 = +[UIImage imageNamed:v6 inBundle:v5];
      id v8 = +[AXSettings sharedInstance];
      [v8 zoomControllerColor];
      unsigned __int8 v9 = +[UIColor colorWithCGColor:AXUIZoomControllerColor()];
      id v10 = [v7 _flatImageWithColor:v9];
      unsigned int v11 = [(ZWSlugCollapsingRingView *)self->_slugRingView speakFingerImageView];
      [v11 setImage:v10];

      [(ZWZoomSlugViewController *)self _updateRingAndTriangleVisiblity:1];
      [(ZWZoomSlugViewController *)self setInSpeakUnderFingerMode:1];
      break;
    default:
      return;
  }
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 count] == (char *)&dword_0 + 1)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    self->_foreheadRect.origin.double x = v6;
    self->_foreheadRect.origin.double y = v7;
    self->_foreheadRect.size.double width = v8;
    self->_foreheadRect.size.double height = v9;
  }
  else
  {
    if ([v4 count] != (char *)&dword_0 + 2) {
      goto LABEL_6;
    }
    id v5 = [v4 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    long double v18 = [v4 objectAtIndexedSubscript:1];
    [v18 CGRectValue];
    v87.origin.double x = v19;
    v87.origin.double y = v20;
    v87.size.double width = v21;
    v87.size.double height = v22;
    v83.origin.double x = v11;
    v83.origin.double y = v13;
    v83.size.double width = v15;
    v83.size.double height = v17;
    self->_foreheadRect = CGRectUnion(v83, v87);
  }
LABEL_6:
  if (AXDeviceHasJindo())
  {
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x2020000000;
    int v82 = 0;
    AXPerformBlockSynchronouslyOnMainThread();
    int v23 = *((_DWORD *)v80 + 6);
    if (v23 == 4)
    {
      double v78 = [(ZWZoomSlugViewController *)self view];
      [v78 frame];
      CGFloat v42 = v41;
      double v43 = [(ZWZoomSlugViewController *)self view];
      double v44 = [v43 superview];
      [v44 bounds];
      double v46 = v45;
      double v47 = [(ZWZoomSlugViewController *)self view];
      [v47 frame];
      double v49 = v48;
      double v50 = [(ZWZoomSlugViewController *)self view];
      [v50 frame];
      double v52 = v51;
      v53 = [(ZWZoomSlugViewController *)self view];
      [v53 frame];
      CGFloat v55 = v54;
      double v56 = [(ZWZoomSlugViewController *)self view];
      [v56 frame];
      v89.size.double height = v57;
      v89.origin.double y = v46 - (v49 + v52);
      v89.origin.double x = v42;
      v89.size.double width = v55;
      CGRect v85 = CGRectIntersection(self->_foreheadRect, v89);
      BOOL IsNull = CGRectIsNull(v85);

      if (!IsNull)
      {
        int v36 = [(ZWZoomSlugViewController *)self delegate];
        double height = self->_foreheadRect.size.height;
        double y = self->_foreheadRect.origin.y;
        double v39 = [(ZWZoomSlugViewController *)self view];
        v61 = [v39 superview];
        [v61 bounds];
        double v63 = v62;
        double v64 = [(ZWZoomSlugViewController *)self view];
        [v64 frame];
        double v66 = v65;
        v67 = [(ZWZoomSlugViewController *)self view];
        [v67 frame];
        objc_msgSend(v36, "_moveZoomItemWithControllerToDodgeJindo:byDelta:", self, -(height + y + 5.0 + v66 + v68 - v63), 0.0);

        goto LABEL_15;
      }
    }
    else if (v23 == 3)
    {
      CGFloat v24 = [(ZWZoomSlugViewController *)self view];
      [v24 frame];
      CGFloat v26 = v25;
      CGFloat v27 = [(ZWZoomSlugViewController *)self view];
      [v27 frame];
      CGFloat v29 = v28;
      double v30 = [(ZWZoomSlugViewController *)self view];
      [v30 frame];
      CGFloat v32 = v31;
      v33 = [(ZWZoomSlugViewController *)self view];
      [v33 frame];
      v88.size.double height = v34;
      v88.origin.double x = v26;
      v88.origin.double y = v29;
      v88.size.double width = v32;
      CGRect v84 = CGRectIntersection(self->_foreheadRect, v88);
      BOOL v35 = CGRectIsNull(v84);

      if (!v35)
      {
        int v36 = [(ZWZoomSlugViewController *)self delegate];
        double v37 = self->_foreheadRect.size.height;
        double v38 = self->_foreheadRect.origin.y;
        double v39 = [(ZWZoomSlugViewController *)self view];
        [v39 frame];
        objc_msgSend(v36, "_moveZoomItemWithControllerToDodgeJindo:byDelta:", self, v37 + v38 + 5.0 - v40, 0.0);
LABEL_15:
      }
    }
    else
    {
      double v69 = [(ZWZoomSlugViewController *)self view];
      [v69 frame];
      v90.origin.double x = v70;
      v90.origin.double y = v71;
      v90.size.double width = v72;
      v90.size.double height = v73;
      CGRect v86 = CGRectIntersection(self->_foreheadRect, v90);
      BOOL v74 = CGRectIsNull(v86);

      if (!v74)
      {
        int v36 = [(ZWZoomSlugViewController *)self delegate];
        double v75 = self->_foreheadRect.size.height;
        double v76 = self->_foreheadRect.origin.y;
        double v39 = [(ZWZoomSlugViewController *)self view];
        [v39 frame];
        objc_msgSend(v36, "_moveZoomItemWithControllerToDodgeJindo:byDelta:", self, 0.0, v75 + v76 - v77);
        goto LABEL_15;
      }
    }
    _Block_object_dispose(&v79, 8);
  }
}

id __58__ZWZoomSlugViewController_systemApertureLayoutDidChange___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) interfaceOrientation];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)userInteractionHasBecomeIdle
{
  v3.receiver = self;
  v3.super_class = (Class)ZWZoomSlugViewController;
  [(ZWZoomViewController *)&v3 userInteractionHasBecomeIdle];
  [(ZWZoomSlugViewController *)self setInUserRepositioningMode:0];
}

- (void)userInteractionHasBecomeActiveWithFirstTouchAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v7.receiver = self;
  v7.super_class = (Class)ZWZoomSlugViewController;
  -[ZWZoomViewController userInteractionHasBecomeActiveWithFirstTouchAtLocation:](&v7, "userInteractionHasBecomeActiveWithFirstTouchAtLocation:");
  CGFloat v6 = [(ZWZoomSlugViewController *)self view];
  [v6 bounds];
  v8.CGFloat x = x;
  v8.CGFloat y = y;
  CGRectContainsPoint(v9, v8);
}

- (CGPoint)offsetForAutopanner:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 zoomAutopannerShouldPanWithAcceleration];

  if (v5)
  {
    [(ZWZoomSlugViewController *)self deltaFromInitialTouch];
  }
  else
  {
    [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
    double v9 = v8 * 5.0;
    [(ZWZoomSlugViewController *)self deltaFromLastPanEvent];
    double v11 = v10 * 5.0;
    -[ZWZoomSlugViewController setDeltaFromLastPanEvent:](self, "setDeltaFromLastPanEvent:", CGPointZero.x, CGPointZero.y);
    double v6 = v9;
    double v7 = v11;
  }
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ZWZoomSlugViewController *)self longPressGesture];

  id v9 = [(ZWZoomSlugViewController *)self panGesture];

  if (v8 == v6)
  {
    char v10 = v9 == v7;
  }
  else if (v9 == v6)
  {
    id v11 = [(ZWZoomSlugViewController *)self longPressGesture];
    if (v11 == v7)
    {
      char v10 = 1;
    }
    else
    {
      id v12 = [(ZWZoomSlugViewController *)self doubleTapGesture];
      if (v12 == v7)
      {
        char v10 = 1;
      }
      else
      {
        id v13 = [(ZWZoomSlugViewController *)self tripleTapGesture];
        if (v13 == v7)
        {
          char v10 = 1;
        }
        else
        {
          id v14 = [(ZWZoomSlugViewController *)self singleTapGesture];
          char v10 = v14 == v7;
        }
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (ZWZoomSlugViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ZWZoomSlugViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)userIsInteractingWithSlug
{
  return self->_userIsInteractingWithSlug;
}

- (void)setUserIsInteractingWithSlug:(BOOL)a3
{
  self->_userIsInteractingWithSlug = a3;
}

- (BOOL)inSpeakUnderFingerMode
{
  return self->_inSpeakUnderFingerMode;
}

- (void)setInSpeakUnderFingerMode:(BOOL)a3
{
  self->_inSpeakUnderFingerMode = a3;
}

- (BOOL)shouldHideWhileOrbing
{
  return self->_shouldHideWhileOrbing;
}

- (ZWSlugCollapsingRingView)slugRingView
{
  return self->_slugRingView;
}

- (void)setSlugRingView:(id)a3
{
}

- (NSLayoutConstraint)collapsingRingWidthConstraint
{
  return self->_collapsingRingWidthConstraint;
}

- (void)setCollapsingRingWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)collapsingRingHeightConstraint
{
  return self->_collapsingRingHeightConstraint;
}

- (void)setCollapsingRingHeightConstraint:(id)a3
{
}

- (ZWSlugCirclePivotingView)circlePivotingView
{
  return self->_circlePivotingView;
}

- (void)setCirclePivotingView:(id)a3
{
}

- (NSLayoutConstraint)circlePivotWidthConstraint
{
  return self->_circlePivotWidthConstraint;
}

- (void)setCirclePivotWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)circlePivotHeightConstraint
{
  return self->_circlePivotHeightConstraint;
}

- (void)setCirclePivotHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)circlePivotOffsetXConstraint
{
  return self->_circlePivotOffsetXConstraint;
}

- (void)setCirclePivotOffsetXConstraint:(id)a3
{
}

- (NSLayoutConstraint)circlePivotOffsetYConstraint
{
  return self->_circlePivotOffsetYConstraint;
}

- (void)setCirclePivotOffsetYConstraint:(id)a3
{
}

- (ZWSlugTriangleView)leftTriangleView
{
  return self->_leftTriangleView;
}

- (void)setLeftTriangleView:(id)a3
{
}

- (NSLayoutConstraint)leftTriangleRadiusDistanceConstraint
{
  return self->_leftTriangleRadiusDistanceConstraint;
}

- (void)setLeftTriangleRadiusDistanceConstraint:(id)a3
{
}

- (ZWSlugTriangleView)rightTriangleView
{
  return self->_rightTriangleView;
}

- (void)setRightTriangleView:(id)a3
{
}

- (NSLayoutConstraint)rightTriangleRadiusDistanceConstraint
{
  return self->_rightTriangleRadiusDistanceConstraint;
}

- (void)setRightTriangleRadiusDistanceConstraint:(id)a3
{
}

- (ZWSlugTriangleView)topTriangleView
{
  return self->_topTriangleView;
}

- (void)setTopTriangleView:(id)a3
{
}

- (NSLayoutConstraint)topTriangleRadiusDistanceConstraint
{
  return self->_topTriangleRadiusDistanceConstraint;
}

- (void)setTopTriangleRadiusDistanceConstraint:(id)a3
{
}

- (ZWSlugTriangleView)bottomTriangleView
{
  return self->_bottomTriangleView;
}

- (void)setBottomTriangleView:(id)a3
{
}

- (NSLayoutConstraint)bottomTriangleRadiusDistanceConstraint
{
  return self->_bottomTriangleRadiusDistanceConstraint;
}

- (void)setBottomTriangleRadiusDistanceConstraint:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (UITapGestureRecognizer)singleTapGesture
{
  return self->_singleTapGesture;
}

- (void)setSingleTapGesture:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGesture
{
  return self->_doubleTapGesture;
}

- (void)setDoubleTapGesture:(id)a3
{
}

- (UITapGestureRecognizer)tripleTapGesture
{
  return self->_tripleTapGesture;
}

- (void)setTripleTapGesture:(id)a3
{
}

- (BOOL)tapGesturesEnabled
{
  return self->_tapGesturesEnabled;
}

- (BOOL)allGesturesEnabled
{
  return self->_allGesturesEnabled;
}

- (BOOL)isInUserRepositioningMode
{
  return self->_inUserRepositioningMode;
}

- (void)setInUserRepositioningMode:(BOOL)a3
{
  self->_inUserRepositioningMode = a3;
}

- (BOOL)isInPanZoomingMode
{
  return self->_inPanZoomingMode;
}

- (void)setInPanZoomingMode:(BOOL)a3
{
  self->_inPanZoomingMode = a3;
}

- (BOOL)isOrbPanning
{
  return self->_isOrbPanning;
}

- (void)setIsOrbPanning:(BOOL)a3
{
  self->_isOrbPanning = a3;
}

- (AXAssertion)disableDashBoardGesturesForPanAssertion
{
  return self->_disableDashBoardGesturesForPanAssertion;
}

- (void)setDisableDashBoardGesturesForPanAssertion:(id)a3
{
}

- (AXAssertion)disableDashBoardGesturesForLongPressAssertion
{
  return self->_disableDashBoardGesturesForLongPressAssertion;
}

- (void)setDisableDashBoardGesturesForLongPressAssertion:(id)a3
{
}

- (double)currentOffsetAngle
{
  return self->_currentOffsetAngle;
}

- (void)setCurrentOffsetAngle:(double)a3
{
  self->_currentOffsetAngle = a3;
}

- (CGPoint)deltaFromInitialTouch
{
  double x = self->_deltaFromInitialTouch.x;
  double y = self->_deltaFromInitialTouch.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDeltaFromInitialTouch:(CGPoint)a3
{
  self->_deltaFromInitialTouch = a3;
}

- (CGPoint)deltaFromLastPanEvent
{
  double x = self->_deltaFromLastPanEvent.x;
  double y = self->_deltaFromLastPanEvent.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDeltaFromLastPanEvent:(CGPoint)a3
{
  self->_deltaFromLastPanEvent = a3;
}

- (double)idleSlugOpacity
{
  return self->_idleSlugOpacity;
}

- (void)setIdleSlugOpacity:(double)a3
{
  self->_idleSlugOpacitdouble y = a3;
}

- (AXDispatchTimer)dimTimer
{
  return self->_dimTimer;
}

- (void)setDimTimer:(id)a3
{
}

- (unint64_t)slugAppearanceState
{
  return self->_slugAppearanceState;
}

- (void)setSlugAppearanceState:(unint64_t)a3
{
  self->_slugAppearanceState = a3;
}

- (UILongPressGestureRecognizer)longPress
{
  return self->_longPress;
}

- (void)setLongPress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_dimTimer, 0);
  objc_storeStrong((id *)&self->_disableDashBoardGesturesForLongPressAssertion, 0);
  objc_storeStrong((id *)&self->_disableDashBoardGesturesForPanAssertion, 0);
  objc_storeStrong((id *)&self->_tripleTapGesture, 0);
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_storeStrong((id *)&self->_singleTapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_bottomTriangleRadiusDistanceConstraint, 0);
  objc_storeStrong((id *)&self->_bottomTriangleView, 0);
  objc_storeStrong((id *)&self->_topTriangleRadiusDistanceConstraint, 0);
  objc_storeStrong((id *)&self->_topTriangleView, 0);
  objc_storeStrong((id *)&self->_rightTriangleRadiusDistanceConstraint, 0);
  objc_storeStrong((id *)&self->_rightTriangleView, 0);
  objc_storeStrong((id *)&self->_leftTriangleRadiusDistanceConstraint, 0);
  objc_storeStrong((id *)&self->_leftTriangleView, 0);
  objc_storeStrong((id *)&self->_circlePivotOffsetYConstraint, 0);
  objc_storeStrong((id *)&self->_circlePivotOffsetXConstraint, 0);
  objc_storeStrong((id *)&self->_circlePivotHeightConstraint, 0);
  objc_storeStrong((id *)&self->_circlePivotWidthConstraint, 0);
  objc_storeStrong((id *)&self->_circlePivotingView, 0);
  objc_storeStrong((id *)&self->_collapsingRingHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collapsingRingWidthConstraint, 0);
  objc_storeStrong((id *)&self->_slugRingView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end
@interface ZWZoomDockedLensViewController
- (BOOL)_shouldDisableLensEffectsForStandbyMode;
- (BOOL)_zoomRegionOnDockReplicatorEdge;
- (BOOL)dockPositionIsTransitioning;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isInDockResizingMode;
- (BOOL)transitioningForStandby;
- (BOOL)zoomRegionOnScreenReplicatorEdge;
- (BOOL)zoomRegionVisible;
- (CABackdropLayer)dockBackdropLayer;
- (CABackdropLayer)screenBackdropLayer;
- (CAReplicatorLayer)dockReplicatorLayer;
- (CAReplicatorLayer)screenReplicatorLayer;
- (CAShapeLayer)maskLayer;
- (CAShapeLayer)touchStealLayer;
- (CGPoint)_lensDragMultiplier;
- (CGPoint)deltaForDockedZoomMovementToRect:(CGRect)a3;
- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3;
- (CGRect)frameForResizeDrag;
- (CGRect)zoomRegionFrame;
- (NSLayoutConstraint)dockedViewBottomConstraint;
- (NSLayoutConstraint)dockedViewLeftConstraint;
- (NSLayoutConstraint)dockedViewRightConstraint;
- (NSLayoutConstraint)dockedViewTopConstraint;
- (NSLayoutConstraint)zoomViewBottomConstraint;
- (NSLayoutConstraint)zoomViewLeftConstraint;
- (NSLayoutConstraint)zoomViewRightConstraint;
- (NSLayoutConstraint)zoomViewTopConstraint;
- (UIView)dockReplicatorView;
- (UIView)dockedLensView;
- (UIView)screenReplicatorView;
- (ZWDockedLensChromeBorderView)dockedBorderView;
- (ZWShowHideZoomRegionButton)toggleZoomRegionButton;
- (ZWZoomDockedLensViewControllerDelegate)dockedDelegate;
- (double)_maxDockHeight;
- (double)_maxDockWidth;
- (double)dockShift;
- (double)dockSize;
- (double)screenShift;
- (id)identifier;
- (id)stringForCurrentDockPosition;
- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4;
- (int64_t)_dockPositionForString:(id)a3;
- (int64_t)dockPosition;
- (void)_applyInitialLayoutConstraints;
- (void)_layoutDockUIWithFrames:(CGRect)a3 restOfScreeFrame:(CGRect)a4 positionOrientationChanged:(BOOL)a5;
- (void)_moveZoomRegionToPoint:(CGPoint)a3;
- (void)_moveZoomRegionToPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)_shiftReplicatorsWithOverflowPan:(CGPoint)a3 useFullDelta:(BOOL)a4;
- (void)_toggleVisibilityButtonWasLongPressed;
- (void)_updateConstraintsAndShiftsForDockPosition:(int64_t)a3;
- (void)_updateZoomRegionFrameForDockResizeWithScreenShiftDelta:(double)a3;
- (void)_updateZoomRegionPositionAndSize;
- (void)handleAdditionalPanOffsetFromOriginalOffset:(CGPoint)a3 validOffset:(CGPoint)a4 useFullDelta:(BOOL)a5;
- (void)interceptFingerDownAtLocation:(CGPoint)a3;
- (void)loadView;
- (void)moveDockedZoomToPhysicalScreenPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)resizeDock:(CGSize)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDockBackdropLayer:(id)a3;
- (void)setDockPosition:(int64_t)a3;
- (void)setDockPositionIsTransitioning:(BOOL)a3;
- (void)setDockReplicatorLayer:(id)a3;
- (void)setDockReplicatorView:(id)a3;
- (void)setDockShift:(double)a3;
- (void)setDockSize:(double)a3;
- (void)setDockedBorderView:(id)a3;
- (void)setDockedDelegate:(id)a3;
- (void)setDockedLensView:(id)a3;
- (void)setDockedViewBottomConstraint:(id)a3;
- (void)setDockedViewLeftConstraint:(id)a3;
- (void)setDockedViewRightConstraint:(id)a3;
- (void)setDockedViewTopConstraint:(id)a3;
- (void)setInDockResizingMode:(BOOL)a3;
- (void)setMaskLayer:(id)a3;
- (void)setScreenBackdropLayer:(id)a3;
- (void)setScreenReplicatorLayer:(id)a3;
- (void)setScreenReplicatorView:(id)a3;
- (void)setScreenShift:(double)a3;
- (void)setToggleZoomRegionButton:(id)a3;
- (void)setTouchStealLayer:(id)a3;
- (void)setTransitioningForStandby:(BOOL)a3;
- (void)setZoomRegionFrame:(CGRect)a3;
- (void)setZoomRegionVisible:(BOOL)a3;
- (void)setZoomViewBottomConstraint:(id)a3;
- (void)setZoomViewLeftConstraint:(id)a3;
- (void)setZoomViewRightConstraint:(id)a3;
- (void)setZoomViewTopConstraint:(id)a3;
- (void)shiftDock:(double)a3;
- (void)shiftScreen:(double)a3;
- (void)shiftScreen:(double)a3 animated:(BOOL)a4;
- (void)shiftScreen:(double)a3 animated:(BOOL)a4 discardNewValue:(BOOL)a5;
- (void)showOrHideUIForStandbyModeWithCompletion:(id)a3;
- (void)toggleZoomRegionVisibility;
- (void)transitionToDockPosition:(id)a3 completion:(id)a4;
- (void)updateZoomFactor:(double)a3 panOffset:(CGPoint)a4 animated:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7;
- (void)viewDidLayoutSubviews;
- (void)zoomMovementDidEnd;
@end

@implementation ZWZoomDockedLensViewController

- (void)loadView
{
  v53.receiver = self;
  v53.super_class = (Class)ZWZoomDockedLensViewController;
  [(ZWZoomLensViewController *)&v53 loadView];
  v3 = [(ZWZoomDockedLensViewController *)self view];
  v4 = [(ZWZoomLensViewController *)self screen];
  [v4 bounds];
  double v6 = v5;

  v7 = [(ZWZoomLensViewController *)self screen];
  [v7 bounds];
  double v9 = v8;

  v10 = +[ZWCoalescedSettings sharedInstance];
  [v10 dockSize];
  -[ZWZoomDockedLensViewController setDockSize:](self, "setDockSize:");

  [(ZWZoomDockedLensViewController *)self setDockPosition:0];
  [(ZWZoomDockedLensViewController *)self dockSize];
  double v12 = v11;
  CGFloat v13 = v6 * v11;
  id v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v9, v6 * v11);
  [(ZWZoomDockedLensViewController *)self setDockedLensView:v14];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [ZWDockedLensChromeBorderView alloc];
  [v14 frame];
  v48 = -[ZWDockedLensChromeBorderView initWithFrame:](v15, "initWithFrame:");
  [(ZWZoomDockedLensViewController *)self setDockedBorderView:v48];
  [v14 addSubview:v48];
  v45 = v14;
  [v3 addSubview:v14];
  -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", 0.0, v13, v9, v13);
  v16 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, v13, v9, v13);
  v47 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, v13, v9, v13, 5.0);
  [v16 appendPath:v47];
  id v17 = objc_alloc_init((Class)CAShapeLayer);
  id v46 = v16;
  objc_msgSend(v17, "setPath:", objc_msgSend(v46, "CGPath"));
  v18 = +[UIColor blackColor];
  id v19 = [v18 colorWithAlphaComponent:0.25];
  objc_msgSend(v17, "setFillColor:", objc_msgSend(v19, "CGColor"));

  id v20 = +[UIColor whiteColor];
  objc_msgSend(v17, "setStrokeColor:", objc_msgSend(v20, "CGColor"));

  [v17 setStrokeStart:0.5];
  [v17 setLineWidth:3.0];
  [v17 setFillRule:kCAFillRuleEvenOdd];
  v44 = v17;
  [(ZWZoomDockedLensViewController *)self setMaskLayer:v17];
  [(ZWZoomDockedLensViewController *)self setZoomRegionVisible:1];
  v21 = [v3 layer];
  v22 = [v14 layer];
  [v21 insertSublayer:v17 below:v22];

  v43 = +[CAShapeLayer layer];
  v23 = +[UIColor whiteColor];
  id v24 = [v23 colorWithAlphaComponent:0.01];
  objc_msgSend(v43, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v43, "setFrame:", 0.0, v13, v9, v13);
  [(ZWZoomDockedLensViewController *)self setTouchStealLayer:v43];
  v25 = [v3 layer];
  [v25 addSublayer:v43];

  id v26 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v9, v6);
  objc_msgSend(v26, "setCenter:", v9 * 0.5, v6 * 0.5);
  [(ZWZoomDockedLensViewController *)self setScreenReplicatorView:v26];
  [v3 addSubview:v26];
  id v27 = objc_alloc_init((Class)CAReplicatorLayer);
  [v27 setAllowsHitTesting:0];
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v9, v6);
  [v26 center];
  objc_msgSend(v27, "setPosition:");
  [v27 setInstanceCount:2];
  CATransform3DMakeTranslation(&v52, 0.0, v13, 0.0);
  CATransform3D v51 = v52;
  [v27 setInstanceTransform:&v51];
  [(ZWZoomDockedLensViewController *)self setScreenShift:v13];
  [(ZWZoomDockedLensViewController *)self setScreenReplicatorLayer:v27];
  v28 = [v26 layer];
  [v28 addSublayer:v27];

  id v29 = objc_alloc_init((Class)CABackdropLayer);
  [v29 setAllowsHitTesting:0];
  [v29 setEnabled:1];
  objc_msgSend(v29, "setBackdropRect:", 0.0, 0.0, v9, v6);
  [(ZWZoomDockedLensViewController *)self setScreenBackdropLayer:v29];
  [v27 addSublayer:v29];
  id v30 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v9, v6);
  objc_msgSend(v30, "setCenter:", v9 * 0.5, v6 * 0.5);
  [(ZWZoomDockedLensViewController *)self setDockReplicatorView:v30];
  [v3 addSubview:v30];
  id v31 = objc_alloc_init((Class)CAReplicatorLayer);
  [v31 setAllowsHitTesting:0];
  objc_msgSend(v31, "setBounds:", 0.0, 0.0, v9, v13);
  objc_msgSend(v31, "setPosition:", v9 * 0.5, v13 * 1.5);
  [v31 setInstanceCount:2];
  CATransform3DMakeTranslation(&v50, 0.0, -(v6 * v12), 0.0);
  CATransform3D v49 = v50;
  [v31 setInstanceTransform:&v49];
  [(ZWZoomDockedLensViewController *)self setDockShift:v13];
  [(ZWZoomDockedLensViewController *)self setDockReplicatorLayer:v31];
  v32 = [v30 layer];
  [v32 addSublayer:v31];

  id v33 = objc_alloc_init((Class)CABackdropLayer);
  [v33 setAllowsHitTesting:0];
  [v33 setEnabled:1];
  objc_msgSend(v33, "setBackdropRect:", 0.0, 0.0, v9, v13);
  [(ZWZoomDockedLensViewController *)self setDockBackdropLayer:v33];
  [v31 addSublayer:v33];
  v34 = v3;
  [v3 sendSubviewToBack:v30];
  v42 = v3;
  [v3 sendSubviewToBack:v26];
  v35 = objc_alloc_init(ZWShowHideZoomRegionButton);
  [(ZWShowHideZoomRegionButton *)v35 addTarget:self action:"_toggleVisibilityButtonWasPressed" forControlEvents:64];
  [(ZWZoomDockedLensViewController *)self setToggleZoomRegionButton:v35];
  v36 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
  [v36 makeHorizontal];

  v37 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
  objc_msgSend(v37, "setCenter:", v9 * 0.5, v13);

  [v34 addSubview:v35];
  id v38 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_toggleVisibilityButtonWasLongPressed"];
  v39 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
  [v39 addGestureRecognizer:v38];

  v40 = [(ZWZoomLensViewController *)self lensZoomView];
  v41 = [v40 zoomReplicatorLayer];
  objc_msgSend(v41, "setPosition:", v9 * 0.5, v13 * 0.5);
}

- (int64_t)_dockPositionForString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:AXZoomDockPositionTop] & 1) == 0)
  {
    if ([v3 isEqualToString:AXZoomDockPositionLeft])
    {
      int64_t v4 = 1;
      goto LABEL_9;
    }
    if ([v3 isEqualToString:AXZoomDockPositionRight])
    {
      int64_t v4 = 2;
      goto LABEL_9;
    }
    if ([v3 isEqualToString:AXZoomDockPositionBottom])
    {
      int64_t v4 = 3;
      goto LABEL_9;
    }
    _AXAssert();
  }
  int64_t v4 = 0;
LABEL_9:

  return v4;
}

- (void)_applyInitialLayoutConstraints
{
  v29.receiver = self;
  v29.super_class = (Class)ZWZoomDockedLensViewController;
  [(ZWZoomLensViewController *)&v29 _applyInitialLayoutConstraints];
  id v3 = [(ZWZoomDockedLensViewController *)self view];
  int64_t v4 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  double v5 = [(ZWZoomLensViewController *)self lensZoomView];
  [v4 bounds];
  double v7 = v6;
  double v8 = [(ZWZoomLensViewController *)self screen];
  [v8 bounds];
  double v10 = v9;

  double v11 = +[NSLayoutConstraint constraintWithItem:v5 attribute:1 relatedBy:0 toItem:v4 attribute:1 multiplier:1.0 constant:0.0];
  [(ZWZoomDockedLensViewController *)self setZoomViewLeftConstraint:v11];

  double v12 = +[NSLayoutConstraint constraintWithItem:v5 attribute:2 relatedBy:0 toItem:v4 attribute:2 multiplier:1.0 constant:0.0];
  [(ZWZoomDockedLensViewController *)self setZoomViewRightConstraint:v12];

  CGFloat v13 = +[NSLayoutConstraint constraintWithItem:v5 attribute:3 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:0.0];
  [(ZWZoomDockedLensViewController *)self setZoomViewTopConstraint:v13];

  id v14 = +[NSLayoutConstraint constraintWithItem:v5 attribute:4 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
  [(ZWZoomDockedLensViewController *)self setZoomViewBottomConstraint:v14];

  v15 = [(ZWZoomDockedLensViewController *)self zoomViewTopConstraint];
  v31[0] = v15;
  v16 = [(ZWZoomDockedLensViewController *)self zoomViewRightConstraint];
  v31[1] = v16;
  id v17 = [(ZWZoomDockedLensViewController *)self zoomViewLeftConstraint];
  v31[2] = v17;
  v18 = [(ZWZoomDockedLensViewController *)self zoomViewBottomConstraint];
  v31[3] = v18;
  id v19 = +[NSArray arrayWithObjects:v31 count:4];
  [v3 addConstraints:v19];

  id v20 = +[NSLayoutConstraint constraintWithItem:v4 attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
  [(ZWZoomDockedLensViewController *)self setDockedViewLeftConstraint:v20];

  v21 = +[NSLayoutConstraint constraintWithItem:v4 attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
  [(ZWZoomDockedLensViewController *)self setDockedViewRightConstraint:v21];

  v22 = +[NSLayoutConstraint constraintWithItem:v4 attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
  [(ZWZoomDockedLensViewController *)self setDockedViewTopConstraint:v22];

  v23 = +[NSLayoutConstraint constraintWithItem:v4 attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:-(v10 - v7)];
  [(ZWZoomDockedLensViewController *)self setDockedViewBottomConstraint:v23];

  id v24 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
  v30[0] = v24;
  v25 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
  v30[1] = v25;
  id v26 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
  v30[2] = v26;
  id v27 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
  v30[3] = v27;
  v28 = +[NSArray arrayWithObjects:v30 count:4];
  [v3 addConstraints:v28];
}

- (id)identifier
{
  return AXZoomLensModeWindowAnchored;
}

- (void)viewDidLayoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)ZWZoomDockedLensViewController;
  [(ZWZoomDockedLensViewController *)&v54 viewDidLayoutSubviews];
  id v3 = [(ZWZoomDockedLensViewController *)self screenReplicatorView];
  CATransform3D v52 = [(ZWZoomDockedLensViewController *)self dockReplicatorView];
  uint64_t v4 = [(ZWZoomDockedLensViewController *)self screenReplicatorLayer];
  uint64_t v5 = [(ZWZoomDockedLensViewController *)self screenBackdropLayer];
  uint64_t v6 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
  double v7 = [(ZWZoomDockedLensViewController *)self view];
  [v7 bounds];
  double v9 = v8;

  double v10 = [(ZWZoomDockedLensViewController *)self view];
  [v10 bounds];
  double v12 = v11;

  [(ZWZoomDockedLensViewController *)self dockSize];
  double v14 = v9 * v13;
  if ([(ZWZoomDockedLensViewController *)self dockPosition])
  {
    double v15 = v12;
    if ((char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
    {
      [(ZWZoomDockedLensViewController *)self dockSize];
      double v15 = v12 * v16;
      double v14 = v9;
    }
  }
  else
  {
    double v15 = v12;
  }
  id v17 = v3;
  [v3 bounds];
  double v19 = v18;
  id v20 = +[AXSettings sharedInstance];
  v21 = [v20 zoomPreferredCurrentDockPosition];
  v22 = [(ZWZoomDockedLensViewController *)self stringForCurrentDockPosition];
  if ([v21 isEqualToString:v22])
  {
  }
  else
  {
    unsigned __int8 v23 = [(ZWZoomDockedLensViewController *)self dockPositionIsTransitioning];

    if ((v23 & 1) == 0)
    {
      v40 = +[AXSettings sharedInstance];
      v41 = [v40 zoomPreferredCurrentDockPosition];
      [(ZWZoomDockedLensViewController *)self transitionToDockPosition:v41 completion:0];

      id v24 = (void *)v5;
      v25 = (void *)v6;
      id v26 = (void *)v4;
      id v27 = v52;
      goto LABEL_11;
    }
  }
  id v24 = (void *)v5;
  v25 = (void *)v6;
  id v26 = (void *)v4;
  id v27 = v52;
  if (vabdd_f64(v19, v12) < 2.22044605e-16)
  {
    v28 = [(ZWZoomDockedLensViewController *)self view];
    [v28 bounds];
    objc_msgSend(v17, "setBounds:");

    [v17 center];
    double v30 = v29;
    [v17 center];
    objc_msgSend(v17, "setCenter:", v30, v31);
    v32 = [(ZWZoomDockedLensViewController *)self view];
    [v32 bounds];
    objc_msgSend(v52, "setBounds:");

    [v52 center];
    double v34 = v33;
    [v52 center];
    objc_msgSend(v52, "setCenter:", v34, v35);
    v36 = [(ZWZoomDockedLensViewController *)self view];
    [v36 bounds];
    objc_msgSend(v26, "setBounds:");

    v37 = [(ZWZoomDockedLensViewController *)self screenReplicatorView];
    [v37 center];
    objc_msgSend(v26, "setPosition:");

    [(ZWZoomDockedLensViewController *)self screenShift];
    [(ZWZoomDockedLensViewController *)self setScreenShift:v9 * (v38 / v12)];
    objc_msgSend(v24, "setBackdropRect:", 0.0, 0.0, v12, v9);
    objc_msgSend(v25, "setBounds:", 0.0, 0.0, v15, v14);
    [(ZWZoomDockedLensViewController *)self dockShift];
    [(ZWZoomDockedLensViewController *)self setDockShift:v9 * (v39 / v12)];
    +[CATransaction begin];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = __55__ZWZoomDockedLensViewController_viewDidLayoutSubviews__block_invoke;
    v53[3] = &unk_78CA8;
    v53[4] = self;
    +[CATransaction setCompletionBlock:v53];
    [(ZWZoomDockedLensViewController *)self _updateConstraintsAndShiftsForDockPosition:[(ZWZoomDockedLensViewController *)self dockPosition]];
    +[CATransaction commit];
  }
LABEL_11:
  v42 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v42 frame];
  double v44 = v43;
  double v46 = v45;

  double y = CGPointZero.y;
  v48 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
  objc_msgSend(v48, "setFrame:", CGPointZero.x, y, v44, v46);

  int64_t v49 = [(ZWZoomDockedLensViewController *)self dockPosition];
  CATransform3D v50 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
  [v50 setDockPosition:v49];

  CATransform3D v51 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
  [v51 setNeedsLayout];
}

id __55__ZWZoomDockedLensViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lensZoomView];
  [v2 layoutSubviews];

  id v3 = *(void **)(a1 + 32);

  return [v3 _updateZoomRegionPositionAndSize];
}

- (void)updateZoomFactor:(double)a3 panOffset:(CGPoint)a4 animated:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)ZWZoomDockedLensViewController;
  -[ZWZoomLensViewController updateZoomFactor:panOffset:animated:animationDuration:completion:](&v8, "updateZoomFactor:panOffset:animated:animationDuration:completion:", a5, a7, a3, a4.x, a4.y, a6);
  [(ZWZoomDockedLensViewController *)self _updateZoomRegionPositionAndSize];
}

- (void)toggleZoomRegionVisibility
{
  unsigned int v3 = [(ZWZoomDockedLensViewController *)self zoomRegionVisible];
  if (v3)
  {
    uint64_t v4 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    uint64_t v5 = +[NSNumber numberWithFloat:0.0];
    [v4 setToValue:v5];

    uint64_t v6 = [(ZWZoomDockedLensViewController *)self maskLayer];
    [v6 addAnimation:v4 forKey:0];

    double v7 = [(ZWZoomDockedLensViewController *)self maskLayer];
    [v7 setOpacity:0.0];

    objc_super v8 = [(ZWZoomDockedLensViewController *)self touchStealLayer];
    double v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    [(ZWZoomDockedLensViewController *)self _updateZoomRegionPositionAndSize];
    uint64_t v4 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    LODWORD(v11) = 1.0;
    double v12 = +[NSNumber numberWithFloat:v11];
    [v4 setToValue:v12];

    double v13 = [(ZWZoomDockedLensViewController *)self maskLayer];
    [v13 addAnimation:v4 forKey:0];

    double v14 = [(ZWZoomDockedLensViewController *)self maskLayer];
    LODWORD(v15) = 1.0;
    [v14 setOpacity:v15];

    objc_super v8 = [(ZWZoomDockedLensViewController *)self touchStealLayer];
    double v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setHidden:v10];

  [(ZWZoomDockedLensViewController *)self setZoomRegionVisible:v3 ^ 1];
  id v16 = [(ZWZoomDockedLensViewController *)self dockedDelegate];
  objc_msgSend(v16, "dockedLensViewController:zoomRegionVisibilityWasChanged:", self, -[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible"));
}

- (void)moveDockedZoomToPhysicalScreenPoint:(CGPoint)a3 animated:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  -[ZWZoomDockedLensViewController _moveZoomRegionToPoint:animated:](self, "_moveZoomRegionToPoint:animated:", a4);
  double v7 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
  [v7 position];
  double v9 = x - v8;
  uint64_t v10 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
  [v10 position];
  double v12 = y - v11;

  [(ZWZoomLensViewController *)self zoomPanOffset];
  double v14 = v9 - v13;
  [(ZWZoomLensViewController *)self zoomPanOffset];
  double v16 = v12 - v15;
  id v18 = [(ZWZoomLensViewController *)self delegate];
  id v17 = [(ZWZoomLensViewController *)self lensZoomView];
  objc_msgSend(v18, "zoomLensViewController:didMoveLens:withDelta:", self, v17, v14, v16);
}

- (void)interceptFingerDownAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
  [v7 frame];
  v9.CGFloat x = x;
  v9.CGFloat y = y;
  if (CGRectContainsPoint(v11, v9)
    || ([(ZWZoomDockedLensViewController *)self zoomRegionFrame],
        v10.CGFloat x = x,
        v10.CGFloat y = y,
        CGRectContainsPoint(v12, v10)))
  {
  }
  else
  {
    unsigned int v6 = [(ZWZoomDockedLensViewController *)self zoomRegionVisible];

    if (v6)
    {
      [(ZWZoomDockedLensViewController *)self toggleZoomRegionVisibility];
    }
  }
}

- (void)showOrHideUIForStandbyModeWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ZWZoomDockedLensViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(ZWZoomDockedLensViewController *)self view];
  [v8 bounds];
  double v10 = v9;

  unsigned int v11 = [(ZWZoomLensViewController *)self inStandbyMode];
  +[CATransaction begin];
  if (v11)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = __75__ZWZoomDockedLensViewController_showOrHideUIForStandbyModeWithCompletion___block_invoke;
    v43[3] = &unk_78FC0;
    v43[4] = self;
    id v44 = v4;
    +[CATransaction setCompletionBlock:v43];
    CGRect v12 = [(ZWZoomDockedLensViewController *)self maskLayer];
    [v12 setHidden:1];

    double v13 = [(ZWZoomDockedLensViewController *)self view];
    [v13 frame];
    v47.origin.CGFloat x = CGRectZero.origin.x;
    v47.origin.CGFloat y = CGRectZero.origin.y;
    v47.size.width = CGRectZero.size.width;
    v47.size.height = CGRectZero.size.height;
    BOOL v14 = CGRectEqualToRect(v45, v47);

    if (!v14)
    {
      [(ZWZoomDockedLensViewController *)self dockSize];
      double v16 = v15;
      [(ZWZoomDockedLensViewController *)self screenShift];
      double v18 = v17;
      [(ZWZoomDockedLensViewController *)self dockShift];
      double v20 = v19;
      if (![(ZWZoomDockedLensViewController *)self dockPosition]
        || (int64_t v21 = [(ZWZoomDockedLensViewController *)self dockPosition], v22 = 0.0, v21 == 3))
      {
        double v7 = 0.0;
        double v22 = v10;
      }
      -[ZWZoomDockedLensViewController resizeDock:animated:](self, "resizeDock:animated:", 1, v22, v7);
      [(ZWZoomDockedLensViewController *)self setDockSize:v16];
      [(ZWZoomDockedLensViewController *)self setScreenShift:v18];
      [(ZWZoomDockedLensViewController *)self setDockShift:v20];
    }
    +[CATransaction commit];
    unsigned __int8 v23 = v44;
  }
  else
  {
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    double v39 = __75__ZWZoomDockedLensViewController_showOrHideUIForStandbyModeWithCompletion___block_invoke_2;
    v40 = &unk_78FE8;
    v41 = self;
    id v42 = v4;
    +[CATransaction setCompletionBlock:&v37];
    id v24 = [(ZWZoomDockedLensViewController *)self dockedLensView];
    [v24 setHidden:0];

    v25 = [(ZWZoomDockedLensViewController *)self screenReplicatorView];
    [v25 setHidden:0];

    id v26 = [(ZWZoomDockedLensViewController *)self dockReplicatorView];
    [v26 setHidden:0];

    id v27 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
    [v27 setHidden:0];

    if ([(ZWZoomDockedLensViewController *)self zoomRegionVisible])
    {
      v28 = [(ZWZoomDockedLensViewController *)self touchStealLayer];
      [v28 setHidden:0];
    }
    double v29 = [(ZWZoomDockedLensViewController *)self view];
    [v29 frame];
    v48.origin.CGFloat x = CGRectZero.origin.x;
    v48.origin.CGFloat y = CGRectZero.origin.y;
    v48.size.width = CGRectZero.size.width;
    v48.size.height = CGRectZero.size.height;
    BOOL v30 = CGRectEqualToRect(v46, v48);

    if (!v30)
    {
      [(ZWZoomDockedLensViewController *)self screenShift];
      double v32 = v31;
      [(ZWZoomDockedLensViewController *)self dockShift];
      double v34 = v33;
      if ([(ZWZoomDockedLensViewController *)self dockPosition]
        && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
      {
        [(ZWZoomDockedLensViewController *)self dockSize];
        double v10 = v10 * v36;
      }
      else
      {
        [(ZWZoomDockedLensViewController *)self dockSize];
        double v7 = v7 * v35;
      }
      -[ZWZoomDockedLensViewController resizeDock:animated:](self, "resizeDock:animated:", 1, v10, v7);
      +[CATransaction setAnimationDuration:0.35];
      [(ZWZoomDockedLensViewController *)self shiftDock:v34];
      [(ZWZoomDockedLensViewController *)self shiftScreen:v32];
    }
    +[CATransaction commit];
    unsigned __int8 v23 = v42;
  }
}

uint64_t __75__ZWZoomDockedLensViewController_showOrHideUIForStandbyModeWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) toggleZoomRegionButton];
  [v2 setHidden:1];

  unsigned int v3 = [*(id *)(a1 + 32) dockedLensView];
  [v3 setHidden:1];

  id v4 = [*(id *)(a1 + 32) dockReplicatorView];
  [v4 setHidden:1];

  uint64_t v5 = [*(id *)(a1 + 32) screenReplicatorView];
  [v5 setHidden:1];

  double v6 = [*(id *)(a1 + 32) touchStealLayer];
  [v6 setHidden:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __75__ZWZoomDockedLensViewController_showOrHideUIForStandbyModeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) _updateZoomRegionPositionAndSize];
  id v3 = [*(id *)(a1 + 32) maskLayer];
  [v3 setHidden:0];
}

- (void)transitionToDockPosition:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[CATransaction begin];
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  CGRect v12 = __70__ZWZoomDockedLensViewController_transitionToDockPosition_completion___block_invoke;
  double v13 = &unk_78FC0;
  BOOL v14 = self;
  id v8 = v7;
  id v15 = v8;
  +[CATransaction setCompletionBlock:&v10];
  if (objc_msgSend(v6, "isEqualToString:", AXZoomDockPositionTop, v10, v11, v12, v13, v14))
  {
    uint64_t v9 = 0;
LABEL_9:
    [(ZWZoomDockedLensViewController *)self _updateConstraintsAndShiftsForDockPosition:v9];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:AXZoomDockPositionLeft])
  {
    uint64_t v9 = 1;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:AXZoomDockPositionRight])
  {
    uint64_t v9 = 2;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:AXZoomDockPositionBottom])
  {
    uint64_t v9 = 3;
    goto LABEL_9;
  }
LABEL_10:
  +[CATransaction commit];
}

uint64_t __70__ZWZoomDockedLensViewController_transitionToDockPosition_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) zoomRegionFrame];
  double v3 = v2;
  [*(id *)(a1 + 32) zoomRegionFrame];
  double v5 = v3 + v4 * 0.5;
  [*(id *)(a1 + 32) zoomRegionFrame];
  double v7 = v6;
  [*(id *)(a1 + 32) zoomRegionFrame];
  double v9 = v7 + v8 * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "_moveZoomRegionToPoint:", v5, v9);
  double v10 = [*(id *)(a1 + 32) dockReplicatorLayer];
  [v10 position];
  double v12 = v5 - v11;
  double v13 = [*(id *)(a1 + 32) dockReplicatorLayer];
  [v13 position];
  double v15 = v9 - v14;

  [*(id *)(a1 + 32) zoomPanOffset];
  double v17 = v12 - v16;
  [*(id *)(a1 + 32) zoomPanOffset];
  double v19 = v15 - v18;
  double v20 = [*(id *)(a1 + 32) delegate];
  int64_t v21 = *(void **)(a1 + 32);
  double v22 = [v21 lensZoomView];
  objc_msgSend(v20, "zoomLensViewController:didMoveLens:withDelta:", v21, v22, v17, v19);

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v24 = *(uint64_t (**)(void))(result + 16);
    return v24();
  }
  return result;
}

- (void)_moveZoomRegionToPoint:(CGPoint)a3
{
}

- (void)_moveZoomRegionToPoint:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = [(ZWZoomDockedLensViewController *)self view];
  [v8 bounds];
  double v50 = v9;

  double v10 = [(ZWZoomDockedLensViewController *)self view];
  [v10 bounds];
  double v48 = v11;

  double v12 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v12 bounds];
  double v14 = v13;

  double v15 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v15 bounds];
  double v17 = v16;

  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  id v52 = v18;
  double v46 = v20;
  double v47 = v19;
  double v21 = v19 * 0.5;
  double v22 = v20 * 0.5;
  double v24 = v23 + v20 * 0.5;
  double v25 = 0.0;
  switch([(ZWZoomDockedLensViewController *)self dockPosition])
  {
    case 0:
      double v17 = 0.0;
      double v25 = v14;
      goto LABEL_3;
    case 1:
LABEL_3:
      double v26 = v50;
      goto LABEL_7;
    case 2:
      double v26 = v50;
      double v27 = v48 - v17;
      double v17 = 0.0;
      break;
    case 3:
      double v26 = v50 - v14;
      double v17 = 0.0;
LABEL_7:
      double v27 = v48;
      break;
    default:
      double v27 = 0.0;
      double v17 = 0.0;
      double v26 = 0.0;
      break;
  }
  double v49 = v27;
  double v51 = v26;
  double v28 = v26 - v22;
  if (y < v28) {
    double v28 = y;
  }
  if (v28 >= v22 + v25) {
    double v29 = v28;
  }
  else {
    double v29 = v22 + v25;
  }
  double v30 = v27 - v21;
  if (x < v27 - v21) {
    double v30 = x;
  }
  if (v30 >= v21 + v17) {
    double v31 = v30;
  }
  else {
    double v31 = v21 + v17;
  }
  double v32 = v29 - v24;
  if ([(ZWZoomDockedLensViewController *)self dockPosition]
    && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
  {
    double v32 = v31 - (*(double *)&v52 + v21);
  }
  [(ZWZoomDockedLensViewController *)self dockShift];
  [(ZWZoomDockedLensViewController *)self shiftDock:v32 + v33];
  id v53 = +[CABasicAnimation animationWithKeyPath:@"path"];
  double v34 = [(ZWZoomDockedLensViewController *)self maskLayer];
  double v35 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v34 path]);
  [v53 setFromValue:v35];

  double v36 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v17, v25, v49 - v17, v51 - v25);
  double v37 = v45 - v22;
  uint64_t v38 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v31 - v21, v37, v47, v46, 5.0);
  [v36 appendPath:v38];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  double v39 = [(ZWZoomDockedLensViewController *)self maskLayer];
  [v39 setStrokeStart:(v51 - v25 + v51 - v25 + (v49 - v17) * 2.0)/ (v47 + v47 + v46 * 2.0 + -8.58407346 + v51 - v25 + v51 - v25 + (v49 - v17) * 2.0)];

  +[CATransaction commit];
  [v53 setToValue:v36];
  [v53 setDuration:0.15];
  if (v4)
  {
    v40 = [(ZWZoomDockedLensViewController *)self maskLayer];
    v41 = [v53 keyPath];
    [v40 addAnimation:v53 forKey:v41];
  }
  id v42 = v36;
  id v43 = [v42 CGPath];
  id v44 = [(ZWZoomDockedLensViewController *)self maskLayer];
  [v44 setPath:v43];

  -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v31 - v21, v37, v47, v46);
  self->_lastScrollPoint.double x = v31;
  self->_lastScrollPoint.double y = v45;
}

- (void)_updateZoomRegionPositionAndSize
{
  double v3 = [(ZWZoomDockedLensViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  double v6 = [(ZWZoomDockedLensViewController *)self view];
  [v6 bounds];
  double v8 = v7;

  double v9 = [(ZWZoomLensViewController *)self lensZoomView];
  double v10 = [v9 zoomReplicatorLayer];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v19 bounds];
  double v21 = v20;

  double v22 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v22 bounds];
  double v24 = v23;

  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v63 = v25;
  double v61 = v26;
  if ([(ZWZoomDockedLensViewController *)self dockPosition]
    && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
  {
    int64_t v37 = [(ZWZoomDockedLensViewController *)self dockPosition];
    double v38 = v5;
    double v27 = v8 - v24;
    double v39 = 0.0;
    if (v37 == 1) {
      double v39 = v24;
    }
    double v40 = v8 - v24;
    double v8 = v38;
    double v29 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v39, 0.0, v40);
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    double v42 = v41;
    [(ZWZoomDockedLensViewController *)self dockShift];
    -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12 + v43, v14, v16, v18);
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    double v45 = v44 - v42;
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    double v36 = v24 * (v45 / (v27 - v46));
  }
  else
  {
    double v27 = v5 - v21;
    if ([(ZWZoomDockedLensViewController *)self dockPosition]) {
      double v28 = 0.0;
    }
    else {
      double v28 = v21;
    }
    double v29 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, v28, v8, v27);
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    double v31 = v30;
    [(ZWZoomDockedLensViewController *)self dockShift];
    -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v14 + v32, v16, v18);
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    double v34 = v33 - v31;
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    double v36 = v21 * (v34 / (v27 - v35));
  }
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v47 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  [v29 appendPath:v47];
  double v48 = v27 + v27 + v8 * 2.0;
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v50 = v49;
  double v52 = v51;
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v54 = v53;
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v56 = v55 + v55 + v54 * 2.0 + -8.58407346;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v57 = [(ZWZoomDockedLensViewController *)self maskLayer];
  [v57 setStrokeStart:v48 / (v48 + v56)];

  id v62 = v29;
  id v58 = [v62 CGPath];
  v59 = [(ZWZoomDockedLensViewController *)self maskLayer];
  [v59 setPath:v58];

  +[CATransaction commit];
  if (v63 == v50 && v61 == v52)
  {
    [(ZWZoomDockedLensViewController *)self screenShift];
    [(ZWZoomDockedLensViewController *)self shiftScreen:v60 - v36];
  }
}

- (BOOL)_zoomRegionOnDockReplicatorEdge
{
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  if (![(ZWZoomDockedLensViewController *)self dockPosition]
    || (char *)[(ZWZoomDockedLensViewController *)self dockPosition] == (char *)&dword_0 + 3)
  {
    double v20 = 1.0;
    if (vabdd_f64(v6, v15) >= 1.0)
    {
      double v21 = v6 + v10;
      double v22 = v15 + v19;
      return vabdd_f64(v21, v22) < v20;
    }
    return 1;
  }
  double v20 = 1.0;
  if (vabdd_f64(v4, v13) < 1.0) {
    return 1;
  }
  double v21 = v4 + v8;
  double v22 = v13 + v17;
  return vabdd_f64(v21, v22) < v20;
}

- (BOOL)zoomRegionOnScreenReplicatorEdge
{
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(ZWZoomDockedLensViewController *)self screenReplicatorLayer];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  if (![(ZWZoomDockedLensViewController *)self dockPosition]
    || (char *)[(ZWZoomDockedLensViewController *)self dockPosition] == (char *)&dword_0 + 3)
  {
    double v20 = 1.0;
    if (vabdd_f64(v6, v15) >= 1.0)
    {
      double v21 = v6 + v10;
      double v22 = v15 + v19;
      return vabdd_f64(v21, v22) < v20;
    }
    return 1;
  }
  double v20 = 1.0;
  if (vabdd_f64(v4, v13) < 1.0) {
    return 1;
  }
  double v21 = v4 + v8;
  double v22 = v13 + v17;
  return vabdd_f64(v21, v22) < v20;
}

- (void)shiftScreen:(double)a3
{
}

- (void)shiftScreen:(double)a3 animated:(BOOL)a4
{
}

- (void)shiftScreen:(double)a3 animated:(BOOL)a4 discardNewValue:(BOOL)a5
{
  BOOL v6 = a4;
  long long v9 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v51.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v51.m33 = v9;
  long long v10 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v51.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v51.m43 = v10;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v51.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v51.m13 = v11;
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v51.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v51.m23 = v12;
  [(ZWZoomDockedLensViewController *)self screenShift];
  double v14 = v13;
  +[CATransaction setDisableActions:1];
  +[CATransaction begin];
  switch([(ZWZoomDockedLensViewController *)self dockPosition])
  {
    case 0:
      double v15 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v15 bounds];
      double v17 = v16;

      if (v17 <= a3) {
        double v18 = v17;
      }
      else {
        double v18 = a3;
      }
      if (v18 >= 0.0) {
        double v14 = v18;
      }
      else {
        double v14 = 0.0;
      }
      double v19 = 0.0;
      double v20 = v14;
      goto LABEL_30;
    case 1:
      double v21 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v21 bounds];
      double v23 = v22;

      if (v23 <= a3) {
        double v24 = v23;
      }
      else {
        double v24 = a3;
      }
      double v20 = 0.0;
      if (v24 >= 0.0) {
        double v14 = v24;
      }
      else {
        double v14 = 0.0;
      }
      double v19 = v14;
      goto LABEL_30;
    case 2:
      double v25 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v25 bounds];
      double v27 = v26;

      if (v27 <= a3) {
        double v28 = v27;
      }
      else {
        double v28 = a3;
      }
      if (v28 >= 0.0) {
        double v14 = v28;
      }
      else {
        double v14 = 0.0;
      }
      double v29 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v29 bounds];
      double v31 = v30;

      double v19 = -(v31 - v14);
      double v20 = 0.0;
      goto LABEL_30;
    case 3:
      double v32 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v32 bounds];
      double v34 = v33;

      if (v34 <= a3) {
        double v35 = v34;
      }
      else {
        double v35 = a3;
      }
      if (v35 >= 0.0) {
        double v14 = v35;
      }
      else {
        double v14 = 0.0;
      }
      double v36 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v36 bounds];
      double v38 = v37;

      double v20 = -(v38 - v14);
      double v19 = 0.0;
LABEL_30:
      CATransform3DMakeTranslation(&v51, v19, v20, 0.0);
      break;
    default:
      break;
  }
  if (v6)
  {
    double v39 = +[CABasicAnimation animationWithKeyPath:@"instanceTransform"];
    double v40 = [(ZWZoomDockedLensViewController *)self screenReplicatorLayer];
    double v41 = v40;
    if (v40) {
      [v40 instanceTransform];
    }
    else {
      memset(v50, 0, sizeof(v50));
    }
    double v42 = +[NSValue valueWithCATransform3D:v50];
    [v39 setFromValue:v42];

    CATransform3D v49 = v51;
    double v43 = +[NSValue valueWithCATransform3D:&v49];
    [v39 setToValue:v43];

    [v39 setDuration:0.35];
    double v44 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [v39 setTimingFunction:v44];

    [v39 setCumulative:1];
    double v45 = [(ZWZoomDockedLensViewController *)self screenReplicatorLayer];
    [v45 addAnimation:v39 forKey:@"RepInstanceTransform"];
  }
  if (!a5) {
    [(ZWZoomDockedLensViewController *)self setScreenShift:v14];
  }
  CATransform3D v48 = v51;
  double v46 = [(ZWZoomDockedLensViewController *)self screenReplicatorLayer];
  CATransform3D v47 = v48;
  [v46 setInstanceTransform:&v47];

  +[CATransaction commit];
}

- (void)shiftDock:(double)a3
{
  double v5 = [(ZWZoomDockedLensViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(ZWZoomDockedLensViewController *)self view];
  [v8 bounds];
  double v10 = v9;

  long long v11 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v11 bounds];
  double v13 = v12;

  double v14 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v14 bounds];
  double v16 = v15;

  +[CATransaction setDisableActions:1];
  +[CATransaction begin];
  switch([(ZWZoomDockedLensViewController *)self dockPosition])
  {
    case 0:
      double v17 = v10 - v13;
      if (v10 - v13 >= a3) {
        double v17 = a3;
      }
      [(ZWZoomDockedLensViewController *)self setDockShift:v17];
      [(ZWZoomDockedLensViewController *)self dockShift];
      if (v13 >= v18) {
        double v18 = v13;
      }
      [(ZWZoomDockedLensViewController *)self setDockShift:v18];
      [(ZWZoomDockedLensViewController *)self dockShift];
      double v20 = v13 * 0.5 + v19;
      double v21 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
      objc_msgSend(v21, "setPosition:", v16 * 0.5, v20);

      [(ZWZoomDockedLensViewController *)self dockShift];
      CATransform3DMakeTranslation(&v54, 0.0, -v22, 0.0);
      double v23 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
      double v24 = v23;
      CATransform3D v53 = v54;
      double v25 = &v53;
      goto LABEL_18;
    case 1:
      double v26 = v7 - v16;
      if (v7 - v16 >= a3) {
        double v26 = a3;
      }
      [(ZWZoomDockedLensViewController *)self setDockShift:v26];
      [(ZWZoomDockedLensViewController *)self dockShift];
      if (v16 >= v27) {
        double v27 = v16;
      }
      [(ZWZoomDockedLensViewController *)self setDockShift:v27];
      [(ZWZoomDockedLensViewController *)self dockShift];
      double v29 = v16 * 0.5 + v28;
      double v30 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
      objc_msgSend(v30, "setPosition:", v29, v13 * 0.5);

      [(ZWZoomDockedLensViewController *)self dockShift];
      CATransform3DMakeTranslation(&v52, -v31, 0.0, 0.0);
      double v23 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
      double v24 = v23;
      CATransform3D v51 = v52;
      double v25 = &v51;
      goto LABEL_18;
    case 2:
      double v32 = v7 + v16 * -2.0;
      if (v32 >= a3) {
        double v32 = a3;
      }
      [(ZWZoomDockedLensViewController *)self setDockShift:v32];
      [(ZWZoomDockedLensViewController *)self dockShift];
      [(ZWZoomDockedLensViewController *)self setDockShift:fmax(v33, 0.0)];
      [(ZWZoomDockedLensViewController *)self dockShift];
      double v35 = v16 * 0.5 + v34;
      double v36 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
      objc_msgSend(v36, "setPosition:", v35, v13 * 0.5);

      [(ZWZoomDockedLensViewController *)self dockShift];
      CATransform3DMakeTranslation(&v50, v7 - v16 - v37, 0.0, 0.0);
      double v23 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
      double v24 = v23;
      CATransform3D v49 = v50;
      double v25 = &v49;
      goto LABEL_18;
    case 3:
      double v38 = v10 + v13 * -2.0;
      if (v38 >= a3) {
        double v38 = a3;
      }
      [(ZWZoomDockedLensViewController *)self setDockShift:v38];
      [(ZWZoomDockedLensViewController *)self dockShift];
      [(ZWZoomDockedLensViewController *)self setDockShift:fmax(v39, 0.0)];
      [(ZWZoomDockedLensViewController *)self dockShift];
      double v41 = v13 * 0.5 + v40;
      double v42 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
      objc_msgSend(v42, "setPosition:", v16 * 0.5, v41);

      [(ZWZoomDockedLensViewController *)self dockShift];
      CATransform3DMakeTranslation(&v48, 0.0, v10 - v13 - v43, 0.0);
      double v23 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
      double v24 = v23;
      CATransform3D v47 = v48;
      double v25 = &v47;
LABEL_18:
      objc_msgSend(v23, "setInstanceTransform:", v25, *(_OWORD *)&v47.m11, *(_OWORD *)&v47.m13, *(_OWORD *)&v47.m21, *(_OWORD *)&v47.m23, *(_OWORD *)&v47.m31, *(_OWORD *)&v47.m33, *(_OWORD *)&v47.m41, *(_OWORD *)&v47.m43);

      break;
    default:
      break;
  }
  +[CATransaction commit];
  [(ZWZoomDockedLensViewController *)self dockShift];
  double v45 = a3 - v44;
  [(ZWZoomDockedLensViewController *)self screenShift];
  [(ZWZoomDockedLensViewController *)self shiftScreen:v46 - v45];
}

- (void)_shiftReplicatorsWithOverflowPan:(CGPoint)a3 useFullDelta:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [(ZWZoomDockedLensViewController *)self dockedDelegate];
  if ([v8 userIsInteractingWithSlugWithDockedLensViewController:self])
  {
  }
  else
  {
    double v9 = [(ZWZoomDockedLensViewController *)self dockedDelegate];
    unsigned __int8 v10 = [v9 isZoomMovingWithVelocityWithDockedLensViewController:self];

    if ((v10 & 1) == 0 && !a4)
    {
      double v11 = self->_lastPanPoint.y;
      double v12 = x - self->_lastPanPoint.x;
      self->_lastPanPoint.double x = x;
      self->_lastPanPoint.double y = y;
      double y = y - v11;
      double x = v12;
    }
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if ([(ZWZoomDockedLensViewController *)self dockPosition]
    && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
  {
    double y = x;
  }
  [(ZWZoomDockedLensViewController *)self dockShift];
  [(ZWZoomDockedLensViewController *)self shiftDock:y + v13];

  +[CATransaction commit];
}

- (void)_layoutDockUIWithFrames:(CGRect)a3 restOfScreeFrame:(CGRect)a4 positionOrientationChanged:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v13 = [(ZWZoomDockedLensViewController *)self view];
  [v13 bounds];
  double v50 = v14;

  double v15 = [(ZWZoomDockedLensViewController *)self view];
  [v15 bounds];
  double v49 = v16;

  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v18 = v17;
  double v47 = v19;
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v21 = v20;
  double v48 = v22;
  double v23 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v23 bounds];
  double v46 = v24;

  double v25 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v25 bounds];
  double v45 = v26;

  if (v5)
  {
    [(ZWZoomDockedLensViewController *)self screenShift];
    [(ZWZoomDockedLensViewController *)self setScreenShift:v49 * (v27 / v50)];
    [(ZWZoomDockedLensViewController *)self dockShift];
    [(ZWZoomDockedLensViewController *)self setDockShift:v49 * (v28 / v50)];
    -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v21, v48, v11 * (v18 / v45), v10 * (v47 / v46));
  }
  double v29 = [(ZWZoomDockedLensViewController *)self touchStealLayer];
  objc_msgSend(v29, "setFrame:", x, y, width, height);

  double v30 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v30 bounds];
  double v32 = v31;
  double v34 = v33;

  double v35 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  objc_msgSend(v35, "setBounds:", v32, v34, v11, v10);

  [(ZWZoomDockedLensViewController *)self screenShift];
  -[ZWZoomDockedLensViewController shiftScreen:](self, "shiftScreen:");
  double v36 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
  objc_msgSend(v36, "setBounds:", 0.0, 0.0, v11, v10);

  [(ZWZoomDockedLensViewController *)self dockShift];
  -[ZWZoomDockedLensViewController shiftDock:](self, "shiftDock:");
  double v37 = [(ZWZoomDockedLensViewController *)self dockBackdropLayer];
  objc_msgSend(v37, "setBackdropRect:", 0.0, 0.0, v11, v10);

  if ([(ZWZoomLensViewController *)self inStandbyMode])
  {
    [(ZWZoomDockedLensViewController *)self dockSize];
    double v39 = v38;
    [(ZWZoomDockedLensViewController *)self screenShift];
    double v41 = v40;
    [(ZWZoomDockedLensViewController *)self dockShift];
    double v43 = v42;
    if ([(ZWZoomDockedLensViewController *)self dockPosition]
      && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
    {
      double v50 = 0.0;
      double v44 = v49;
    }
    else
    {
      double v44 = 0.0;
    }
    -[ZWZoomDockedLensViewController resizeDock:animated:](self, "resizeDock:animated:", 0, v50, v44);
    [(ZWZoomDockedLensViewController *)self setDockSize:v39];
    [(ZWZoomDockedLensViewController *)self setScreenShift:v41];
    [(ZWZoomDockedLensViewController *)self setDockShift:v43];
  }
}

- (void)_updateConstraintsAndShiftsForDockPosition:(int64_t)a3
{
  BOOL v5 = [(ZWZoomDockedLensViewController *)self view];
  [v5 bounds];
  double width = v6;

  double v8 = [(ZWZoomDockedLensViewController *)self view];
  [v8 bounds];
  double height = v9;

  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v12 = v11;
  double v14 = v13;
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v16 = v15;
  double v18 = v17;
  double v19 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v19 bounds];
  double v21 = v20;

  double v22 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v22 bounds];
  double v24 = v23;

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  double v25 = [(ZWZoomDockedLensViewController *)self dockPosition];
  [(ZWZoomDockedLensViewController *)self setDockPosition:a3];
  double v26 = [(ZWZoomDockedLensViewController *)self dockBackdropLayer];
  objc_msgSend(v26, "setFrame:", 0.0, 0.0, v21, v24);

  switch(a3)
  {
    case 0:
      double v82 = v16;
      [(ZWZoomDockedLensViewController *)self dockSize];
      double y = height * v27;
      if (v25 == (char *)[(ZWZoomDockedLensViewController *)self dockPosition])
      {
        uint64_t v29 = 0;
LABEL_40:
        double height = height - y;
        v67 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
        [v67 setConstant:-height];

        v68 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
        double x = 0.0;
        [v68 setConstant:0.0];

        v69 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
        [v69 setConstant:0.0];

        v70 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
        [v70 setConstant:0.0];

        v71 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
        [v71 makeHorizontal];

        CATransform3D v53 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
        objc_msgSend(v53, "setCenter:", width * 0.5, y);
        double v40 = y;
        double v35 = width;
        goto LABEL_41;
      }
      if (v25 == (unsigned char *)&dword_0 + 3)
      {
        double v14 = v14 + v24;
        [(ZWZoomDockedLensViewController *)self dockShift];
        [(ZWZoomDockedLensViewController *)self setDockShift:v24 + v63];
      }
      else
      {
        if (v25 == (unsigned char *)&dword_0 + 2)
        {
          [(ZWZoomDockedLensViewController *)self screenShift];
          double v12 = v12 + v21 - v64;
          [(ZWZoomDockedLensViewController *)self dockShift];
          [(ZWZoomDockedLensViewController *)self setDockShift:v21 + v65];
          goto LABEL_38;
        }
        if (v25 == (unsigned char *)&dword_0 + 1)
        {
          [(ZWZoomDockedLensViewController *)self screenShift];
          double v12 = v12 - v43;
LABEL_38:
          uint64_t v29 = 1;
          goto LABEL_39;
        }
      }
      uint64_t v29 = 0;
LABEL_39:
      [(ZWZoomDockedLensViewController *)self screenShift];
      -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v14 + v66, v82, v18);
      goto LABEL_40;
    case 1:
      [(ZWZoomDockedLensViewController *)self dockSize];
      double x = width * v30;
      if (v25 == (unsigned char *)&dword_0 + 3)
      {
        [(ZWZoomDockedLensViewController *)self screenShift];
        double v14 = v14 + v45;
        goto LABEL_24;
      }
      if (v25 == (unsigned char *)&dword_0 + 2)
      {
        double v12 = v12 + v21;
        [(ZWZoomDockedLensViewController *)self dockShift];
        [(ZWZoomDockedLensViewController *)self setDockShift:v21 + v47];
      }
      else if (!v25)
      {
        [(ZWZoomDockedLensViewController *)self screenShift];
        double v14 = v14 - v32;
LABEL_24:
        [(ZWZoomDockedLensViewController *)self screenShift];
        double v12 = v12 + v46;
        uint64_t v29 = 1;
        goto LABEL_27;
      }
      uint64_t v29 = 0;
LABEL_27:
      -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v14, v16, v18);
      double width = width - x;
      double v48 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
      double y = 0.0;
      [v48 setConstant:0.0];

      double v49 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
      [v49 setConstant:0.0];

      double v50 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
      [v50 setConstant:-width];

      CATransform3D v51 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
      [v51 setConstant:0.0];

      CATransform3D v52 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
      [v52 makeVertical];

      CATransform3D v53 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
      objc_msgSend(v53, "setCenter:", x, height * 0.5);
      double v40 = height;
      double v35 = x;
LABEL_41:
      double v41 = 0.0;
      goto LABEL_49;
    case 2:
      double v83 = v18;
      double v33 = v14;
      [(ZWZoomDockedLensViewController *)self dockSize];
      double v35 = width * v34;
      if (v25 == (unsigned char *)&dword_0 + 3)
      {
        [(ZWZoomDockedLensViewController *)self screenShift];
        double v33 = v33 + v54;
        [(ZWZoomDockedLensViewController *)self screenShift];
        double v12 = v12 - (v35 - v55);
        goto LABEL_29;
      }
      if (v25 == (unsigned char *)&dword_0 + 1)
      {
        double v12 = v12 - v35;
        [(ZWZoomDockedLensViewController *)self dockShift];
        [(ZWZoomDockedLensViewController *)self setDockShift:v56 - v21];
      }
      else if (!v25)
      {
        [(ZWZoomDockedLensViewController *)self screenShift];
        double v33 = v33 - v36;
        [(ZWZoomDockedLensViewController *)self screenShift];
        double v12 = v12 - (v35 - v37);
        [(ZWZoomDockedLensViewController *)self dockShift];
        [(ZWZoomDockedLensViewController *)self setDockShift:v38 - v24];
LABEL_29:
        uint64_t v29 = 1;
        goto LABEL_32;
      }
      uint64_t v29 = 0;
LABEL_32:
      -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v33, v16, v83);
      double width = width - v35;
      v57 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
      double y = 0.0;
      [v57 setConstant:0.0];

      id v58 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
      [v58 setConstant:width];

      v59 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
      [v59 setConstant:0.0];

      double v60 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
      [v60 setConstant:0.0];

      double v61 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
      [v61 makeVertical];

      id v62 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
      objc_msgSend(v62, "setCenter:", width, height * 0.5);

      if ([(ZWZoomLensViewController *)self inStandbyMode])
      {
        CATransform3D v53 = [(ZWZoomDockedLensViewController *)self dockBackdropLayer];
        objc_msgSend(v53, "setFrame:", v35, 0.0, v35, height);
        double x = 0.0;
        double v40 = height;
        double v41 = 0.0;
        double v42 = width;
        goto LABEL_50;
      }
      double x = 0.0;
      double v40 = height;
      double v41 = 0.0;
      double v42 = width;
      goto LABEL_51;
    case 3:
      double v84 = v18;
      [(ZWZoomDockedLensViewController *)self dockSize];
      double v40 = height * v39;
      if (v25 == (char *)[(ZWZoomDockedLensViewController *)self dockPosition])
      {
        uint64_t v29 = 0;
        goto LABEL_47;
      }
      if (!v25)
      {
        double v14 = v14 - v24;
        [(ZWZoomDockedLensViewController *)self dockShift];
        [(ZWZoomDockedLensViewController *)self setDockShift:v24 + v72];
        goto LABEL_43;
      }
      if (v25 == (unsigned char *)&dword_0 + 2)
      {
        [(ZWZoomDockedLensViewController *)self screenShift];
        double v12 = v12 + v21 - v73;
        [(ZWZoomDockedLensViewController *)self dockShift];
        [(ZWZoomDockedLensViewController *)self setDockShift:v21 + v74];
        goto LABEL_45;
      }
      if (v25 != (unsigned char *)&dword_0 + 1)
      {
LABEL_43:
        uint64_t v29 = 0;
        goto LABEL_46;
      }
      [(ZWZoomDockedLensViewController *)self screenShift];
      double v12 = v12 - v44;
LABEL_45:
      uint64_t v29 = 1;
LABEL_46:
      [(ZWZoomDockedLensViewController *)self screenShift];
      -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v14 - v75, v16, v84);
LABEL_47:
      double height = height - v40;
      v76 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
      double y = 0.0;
      [v76 setConstant:0.0];

      v77 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
      [v77 setConstant:0.0];

      v78 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
      [v78 setConstant:0.0];

      v79 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
      [v79 setConstant:height];

      v80 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
      [v80 makeHorizontal];

      v81 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
      objc_msgSend(v81, "setCenter:", width * 0.5, height);

      if ([(ZWZoomLensViewController *)self inStandbyMode])
      {
        CATransform3D v53 = [(ZWZoomDockedLensViewController *)self dockBackdropLayer];
        objc_msgSend(v53, "setFrame:", 0.0, v40, width, v40);
        double x = 0.0;
        double v35 = width;
        double v41 = height;
LABEL_49:
        double v42 = 0.0;
LABEL_50:
      }
      else
      {
        double x = 0.0;
        double v35 = width;
        double v41 = height;
        double v42 = 0.0;
      }
LABEL_51:
      -[ZWZoomDockedLensViewController _layoutDockUIWithFrames:restOfScreeFrame:positionOrientationChanged:](self, "_layoutDockUIWithFrames:restOfScreeFrame:positionOrientationChanged:", v29, v42, v41, v35, v40, x, y, width, height);
      +[CATransaction commit];
      return;
    default:
      uint64_t v29 = 0;
      double x = CGRectNull.origin.x;
      double y = CGRectNull.origin.y;
      double width = CGRectNull.size.width;
      double height = CGRectNull.size.height;
      double v40 = height;
      double v35 = width;
      double v41 = y;
      double v42 = CGRectNull.origin.x;
      goto LABEL_51;
  }
}

- (void)setInDockResizingMode:(BOOL)a3
{
  if (self->_inDockResizingMode != a3)
  {
    self->_inDockResizingMode = a3;
    id v3 = [(ZWZoomLensViewController *)self lensZoomView];
    [v3 setNeedsLayout];
  }
}

- (void)_updateZoomRegionFrameForDockResizeWithScreenShiftDelta:(double)a3
{
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v6 = v5;
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v8 = v7;
  double v9 = [(ZWZoomLensViewController *)self lensZoomView];
  double v10 = [v9 zoomReplicatorLayer];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;

  switch([(ZWZoomDockedLensViewController *)self dockPosition])
  {
    case 0:
      double v15 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v15 bounds];
      double v17 = v16;

      if (v17 >= v8 + a3) {
        double v8 = v17;
      }
      else {
        double v8 = v8 + a3;
      }
      double v18 = [(ZWZoomDockedLensViewController *)self view];
      [v18 bounds];
      double v20 = v19 - v14;

      if (v20 < v8) {
        double v8 = v20;
      }
      break;
    case 1:
      double v21 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v21 bounds];
      double v23 = v22;

      if (v23 >= v6 + a3) {
        double v6 = v23;
      }
      else {
        double v6 = v6 + a3;
      }
      double v24 = [(ZWZoomDockedLensViewController *)self view];
      [v24 bounds];
      double v26 = v25 - v12;

      if (v26 < v6) {
        double v6 = v26;
      }
      break;
    case 2:
      double v27 = fmax(v6 + a3, 0.0);
      double v28 = [(ZWZoomDockedLensViewController *)self view];
      [v28 bounds];
      double v30 = v29;
      double v31 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v31 bounds];
      double v6 = v30 - v32 - v12;

      if (v6 >= v27) {
        double v6 = v27;
      }
      break;
    case 3:
      double v33 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v33 bounds];
      double v35 = v34;

      if (v35 >= v8 + a3) {
        double v36 = v35;
      }
      else {
        double v36 = v8 + a3;
      }
      double v37 = [(ZWZoomDockedLensViewController *)self view];
      [v37 bounds];
      double v39 = v38;
      double v40 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v40 bounds];
      double v8 = v39 - v41 - v14;

      if (v8 >= v36) {
        double v8 = v36;
      }
      break;
    default:
      break;
  }

  -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v6, v8, v12, v14);
}

- (void)resizeDock:(CGSize)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  double v8 = [(ZWZoomDockedLensViewController *)self dockReplicatorLayer];
  double v9 = [(ZWZoomDockedLensViewController *)self dockBackdropLayer];
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  double v11 = v10;
  double v13 = v12;
  double v14 = [(ZWZoomDockedLensViewController *)self view];
  [v14 bounds];
  double v16 = v15;

  double v17 = [(ZWZoomDockedLensViewController *)self view];
  [v17 bounds];
  double v19 = v18;

  double v20 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v20 bounds];
  double v22 = v21;

  double v23 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v23 bounds];
  double v25 = v24;

  [(ZWZoomDockedLensViewController *)self _maxDockWidth];
  if (width > v26)
  {
    [(ZWZoomDockedLensViewController *)self _maxDockWidth];
    double width = v27;
  }
  [(ZWZoomDockedLensViewController *)self _maxDockHeight];
  if (height > v28)
  {
    [(ZWZoomDockedLensViewController *)self _maxDockHeight];
    double height = v29;
  }
  if ((vabdd_f64(height, v22) >= 2.22044605e-16
     || [(ZWZoomDockedLensViewController *)self dockPosition]
     && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
    && (vabdd_f64(width, v25) >= 2.22044605e-16
     || (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 1
     && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 2))
  {
    double v172 = v13;
    double v30 = &AXColorizeFormatLog_ptr;
    +[CATransaction begin];
    +[CATransaction setDisableActions:v4 ^ 1];
    +[CATransaction setAnimationDuration:0.35];
    double v31 = +[CABasicAnimation animationWithKeyPath:@"position"];
    double v32 = &AXColorizeFormatLog_ptr;
    double v33 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:");
    [v31 setTimingFunction:v33];

    [v31 setDuration:0.35];
    double v171 = v25;
    double v166 = v19;
    double v167 = v16;
    double v173 = height;
    double v169 = v11;
    double v170 = v22;
    double v168 = width;
    switch([(ZWZoomDockedLensViewController *)self dockPosition])
    {
      case 0:
        [(ZWZoomDockedLensViewController *)self setDockSize:height / v16];
        [(ZWZoomDockedLensViewController *)self dockSize];
        double v35 = v16 * v34;
        double v36 = v16 * v34 - v22;
        double v165 = v16 - v16 * v34;
        double v37 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
        [v37 setConstant:-v165];

        double v38 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
        [v38 setConstant:0.0];

        double v39 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
        [v39 setConstant:0.0];

        double v40 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
        [v40 setConstant:0.0];

        if (v4)
        {
          v178[0] = _NSConcreteStackBlock;
          v178[1] = 3221225472;
          v178[2] = __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke;
          v178[3] = &unk_79010;
          v178[4] = self;
          *(double *)&v178[5] = v25;
          *(double *)&v178[6] = v22;
          *(double *)&v178[7] = v19;
          *(double *)&v178[8] = v35;
          +[UIView animateWithDuration:327680 delay:v178 options:0 animations:0.35 completion:0.0];
          double v41 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v41 center];
          double v43 = v42;
          double v44 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v44 center];
          double v46 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v43, v45 - v36 * 0.5);
          [v31 setFromValue:v46];

          double v30 = &AXColorizeFormatLog_ptr;
          double v47 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v47 center];
          double v49 = v48;
          double v50 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v50 center];
          CATransform3D v52 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v49, v36 * 0.5 + v51);
          [v31 setToValue:v52];

          double v32 = &AXColorizeFormatLog_ptr;
          CATransform3D v53 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          objc_msgSend(v53, "setFrame:", 0.0, 0.0, v19, v35);
        }
        else
        {
          CATransform3D v53 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
          objc_msgSend(v53, "setCenter:", v19 * 0.5, v35);
        }

        double v174 = v36;
        v116 = [(ZWZoomDockedLensViewController *)self touchStealLayer];
        double v81 = 0.0;
        double v71 = v165;
        objc_msgSend(v116, "setFrame:", 0.0, v35, v19, v165);
        double v95 = v35;
        double v76 = v35;
        goto LABEL_27;
      case 1:
        [(ZWZoomDockedLensViewController *)self setDockSize:width / v19];
        [(ZWZoomDockedLensViewController *)self dockSize];
        double v98 = v19;
        double v19 = v19 * v99;
        v100 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
        [v100 setConstant:0.0];

        v101 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
        [v101 setConstant:0.0];

        double v102 = v98 - v19;
        v103 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
        [v103 setConstant:-(v98 - v19)];

        v104 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
        [v104 setConstant:0.0];

        double v174 = v19 - v25;
        if (v4)
        {
          v177[0] = _NSConcreteStackBlock;
          v177[1] = 3221225472;
          v177[2] = __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_2;
          v177[3] = &unk_79010;
          v177[4] = self;
          *(double *)&v177[5] = v25;
          *(double *)&v177[6] = v170;
          *(double *)&v177[7] = v19;
          *(double *)&v177[8] = v16;
          +[UIView animateWithDuration:327680 delay:v177 options:0 animations:0.35 completion:0.0];
          v105 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v105 center];
          double v107 = v106 - (v19 - v25) * 0.5;
          v108 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v108 center];
          v109 = +[NSValue valueWithCGPoint:v107];
          [v31 setFromValue:v109];

          double v30 = &AXColorizeFormatLog_ptr;
          v110 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v110 center];
          double v112 = (v19 - v25) * 0.5 + v111;
          v113 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v113 center];
          v114 = +[NSValue valueWithCGPoint:v112];
          [v31 setToValue:v114];

          double v32 = &AXColorizeFormatLog_ptr;
          v115 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          objc_msgSend(v115, "setFrame:", 0.0, 0.0, v19, v16);
        }
        else
        {
          v115 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
          objc_msgSend(v115, "setCenter:", v19, v16 * 0.5);
        }

        v116 = [(ZWZoomDockedLensViewController *)self touchStealLayer];
        double v76 = 0.0;
        double v71 = v102;
        objc_msgSend(v116, "setFrame:", v19, 0.0, v102, v16);
        double v81 = v19;
        goto LABEL_30;
      case 2:
        [(ZWZoomDockedLensViewController *)self setDockSize:width / v19];
        [(ZWZoomDockedLensViewController *)self dockSize];
        double v55 = v19 * v54;
        double v174 = v19 * v54 - v25;
        double v56 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
        [v56 setConstant:0.0];

        v57 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
        [v57 setConstant:v19 - v55];

        id v58 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
        [v58 setConstant:0.0];

        v59 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
        [v59 setConstant:0.0];

        if (v4)
        {
          v176[0] = _NSConcreteStackBlock;
          v176[1] = 3221225472;
          v176[2] = __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_3;
          v176[3] = &unk_79038;
          v176[4] = self;
          *(double *)&v176[5] = v25;
          *(double *)&v176[6] = v22;
          *(double *)&v176[7] = v19;
          *(double *)&v176[8] = v55;
          *(double *)&v176[9] = v16;
          +[UIView animateWithDuration:327680 delay:v176 options:0 animations:0.35 completion:0.0];
          double v60 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v60 center];
          double v62 = v174 * 0.5 + v61;
          double v63 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v63 center];
          double v64 = +[NSValue valueWithCGPoint:v62];
          [v31 setFromValue:v64];

          double v30 = &AXColorizeFormatLog_ptr;
          double v65 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v65 center];
          double v67 = v174 * 0.5 + v66;
          v68 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v68 center];
          v69 = +[NSValue valueWithCGPoint:v67];
          [v31 setToValue:v69];

          double v32 = &AXColorizeFormatLog_ptr;
          v70 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          objc_msgSend(v70, "setFrame:", 0.0, 0.0, v55, v16);

          double v71 = v19 - v55;
        }
        else
        {
          v117 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
          double v71 = v19 - v55;
          objc_msgSend(v117, "setCenter:", v19 - v55, v16 * 0.5);
        }
        double v19 = v55;
        v116 = [(ZWZoomDockedLensViewController *)self touchStealLayer];
        double v81 = 0.0;
        objc_msgSend(v116, "setFrame:", 0.0, 0.0, v71, v16);
        double v76 = 0.0;
LABEL_30:
        double v95 = v16;
        double v119 = v71;
        double v120 = v95;
        double v121 = v95;
        goto LABEL_31;
      case 3:
        [(ZWZoomDockedLensViewController *)self setDockSize:height / v16];
        [(ZWZoomDockedLensViewController *)self dockSize];
        double v73 = v16 * v72;
        double v74 = v16 * v72 - v22;
        double v75 = [(ZWZoomDockedLensViewController *)self dockedViewBottomConstraint];
        double v76 = 0.0;
        [v75 setConstant:0.0];

        v77 = [(ZWZoomDockedLensViewController *)self dockedViewLeftConstraint];
        [v77 setConstant:0.0];

        v78 = [(ZWZoomDockedLensViewController *)self dockedViewRightConstraint];
        [v78 setConstant:0.0];

        v79 = [(ZWZoomDockedLensViewController *)self dockedViewTopConstraint];
        [v79 setConstant:v16 - v73];

        double v174 = v74;
        if (v4)
        {
          v175[0] = _NSConcreteStackBlock;
          v175[1] = 3221225472;
          v175[2] = __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_4;
          v175[3] = &unk_79038;
          v175[4] = self;
          *(double *)&v175[5] = v171;
          *(double *)&v175[6] = v22;
          *(double *)&v175[7] = v19;
          *(double *)&v175[8] = v16;
          *(double *)&v175[9] = v73;
          double v80 = v16 - v73;
          double v81 = 0.0;
          +[UIView animateWithDuration:327680 delay:v175 options:0 animations:0.35 completion:0.0];
          double v82 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v82 center];
          double v84 = v83;
          v85 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v85 center];
          v87 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v84, v74 * 0.5 + v86);
          [v31 setFromValue:v87];

          double v30 = &AXColorizeFormatLog_ptr;
          v88 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v88 center];
          double v90 = v89;
          v91 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          [v91 center];
          v93 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v90, v74 * 0.5 + v92);
          [v31 setToValue:v93];

          double v32 = &AXColorizeFormatLog_ptr;
          v94 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
          double v95 = v73;
          objc_msgSend(v94, "setFrame:", 0.0, 0.0, v19, v73);

          double v71 = v80;
        }
        else
        {
          double v95 = v73;
          v118 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
          objc_msgSend(v118, "setCenter:", v19 * 0.5, v16 - v73);

          double v71 = v16 - v73;
          double v81 = 0.0;
        }
        v116 = [(ZWZoomDockedLensViewController *)self touchStealLayer];
        objc_msgSend(v116, "setFrame:", 0.0, 0.0, v19, v71);
LABEL_27:
        double v119 = v19;
        double v120 = v71;
        double v121 = v19;
LABEL_31:

        v96 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v81, v76, v119, v120);
        double v97 = v71 + v71 + v121 * 2.0;
        double v11 = v169;
        double v22 = v170;
        double width = v168;
        break;
      default:
        v96 = 0;
        double v97 = 0.0;
        double v174 = 0.0;
        double v19 = 0.0;
        double v95 = 0.0;
        break;
    }
    v122 = [(ZWZoomDockedLensViewController *)self dockedLensView];
    [v122 bounds];
    double v124 = v123;
    double v126 = v125;

    v127 = [(ZWZoomDockedLensViewController *)self dockedLensView];
    objc_msgSend(v127, "setBounds:", v124, v126, v19, v95);

    double v128 = v173;
    if (v173 == 0.0 || width == 0.0 || (double v128 = v171, v171 == 0.0) || v22 == 0.0)
    {
      [(ZWZoomDockedLensViewController *)self screenShift];
      -[ZWZoomDockedLensViewController shiftScreen:animated:discardNewValue:](self, "shiftScreen:animated:discardNewValue:", v4, 1);
      double v131 = v174;
    }
    else
    {
      [(ZWZoomDockedLensViewController *)self screenShift];
      double v130 = v129;
      [(ZWZoomDockedLensViewController *)self screenShift];
      double v131 = v174;
      [(ZWZoomDockedLensViewController *)self shiftScreen:v4 animated:v174 + v132];
      [(ZWZoomDockedLensViewController *)self screenShift];
      [(ZWZoomDockedLensViewController *)self _updateZoomRegionFrameForDockResizeWithScreenShiftDelta:v133 - v130];
    }
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    v134 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
    [v8 frame];
    double v136 = v135;
    [v8 frame];
    [v8 setFrame:v136];
    if (v4)
    {
      v137 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
      [v137 addAnimation:v31 forKey:@"position"];

      if ((char *)[(ZWZoomDockedLensViewController *)self dockPosition] == (char *)&dword_0 + 2
        || (char *)[(ZWZoomDockedLensViewController *)self dockPosition] == (char *)&dword_0 + 3)
      {
        v138 = +[CABasicAnimation animationWithKeyPath:@"position"];
        [v138 setDuration:0.35];
        v139 = [v32[269] functionWithName:kCAMediaTimingFunctionDefault];
        [v138 setTimingFunction:v139];

        v140 = [(ZWZoomDockedLensViewController *)self dockBackdropLayer];
        [v140 position];

        if ((char *)[(ZWZoomDockedLensViewController *)self dockPosition] == (char *)&dword_0 + 3)
        {
          double v141 = v166 * 0.5;
          v142 = [(ZWZoomDockedLensViewController *)self dockBackdropLayer];
          [v142 position];
          double v144 = v143;
        }
        else
        {
          v142 = [(ZWZoomDockedLensViewController *)self dockBackdropLayer];
          [v142 position];
          double v141 = v146;
          double v144 = v167 * 0.5;
        }

        v147 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v141, v144);
        [v138 setFromValue:v147];

        double v148 = v171 + v141 - v19;
        double v149 = v22 + v144 - v95;
        v150 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v148, v149);
        [v138 setToValue:v150];

        objc_msgSend(v9, "setPosition:", v148, v149);
        CFStringRef v151 = @"position";
        v152 = v9;
        v153 = v138;
      }
      else
      {
        v138 = +[CABasicAnimation animationWithKeyPath:@"backdropRect"];
        [v138 setDuration:0.35];
        v154 = [v32[269] functionWithName:kCAMediaTimingFunctionDefault];
        [v138 setTimingFunction:v154];

        [v9 backdropRect];
        v155 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
        [v138 setFromValue:v155];

        v156 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, 0.0, v19, v95);
        [v138 setToValue:v156];

        objc_msgSend(v9, "setBackdropRect:", 0.0, 0.0, v19, v95);
        [v9 backdropRect];
        objc_msgSend(v9, "setFrame:");
        v152 = v9;
        v153 = v138;
        CFStringRef v151 = @"backdropRect";
      }
      [v152 addAnimation:v153 forKey:v151];
    }
    else
    {
      [(ZWZoomDockedLensViewController *)self dockShift];
      [(ZWZoomDockedLensViewController *)self shiftDock:v131 + v145];
      objc_msgSend(v9, "setBackdropRect:", 0.0, 0.0, v19, v95);
    }
    [v96 appendPath:v134];
    [v30[273] setDisableActions:1];
    v157 = [(ZWZoomDockedLensViewController *)self maskLayer];
    [v157 setStrokeStart:v97 / (v172 + v172 + v11 * 2.0 + -8.58407346 + v97)];

    id v158 = v96;
    id v159 = [v158 CGPath];
    v160 = [(ZWZoomDockedLensViewController *)self maskLayer];
    [v160 setPath:v159];

    [(ZWZoomDockedLensViewController *)self dockSize];
    if (v161 > 0.0)
    {
      [(ZWZoomDockedLensViewController *)self dockSize];
      double v163 = v162;
      v164 = +[ZWCoalescedSettings sharedInstance];
      [v164 setDockSize:v163];
    }
    [v30[273] commit];
  }
}

void __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = [*(id *)(a1 + 32) dockedBorderView];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v3, v4);

  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 56) * 0.5;
  id v8 = [*(id *)(a1 + 32) toggleZoomRegionButton];
  objc_msgSend(v8, "setCenter:", v7, v6);
}

void __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = [*(id *)(a1 + 32) dockedBorderView];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v3, v4);

  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64) * 0.5;
  id v8 = [*(id *)(a1 + 32) toggleZoomRegionButton];
  objc_msgSend(v8, "setCenter:", v6, v7);
}

void __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = [*(id *)(a1 + 32) dockedBorderView];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v3, v4);

  double v6 = *(double *)(a1 + 56) - *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72) * 0.5;
  id v8 = [*(id *)(a1 + 32) toggleZoomRegionButton];
  objc_msgSend(v8, "setCenter:", v6, v7);
}

void __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = [*(id *)(a1 + 32) dockedBorderView];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v3, v4);

  double v6 = *(double *)(a1 + 56) * 0.5;
  double v7 = *(double *)(a1 + 64) - *(double *)(a1 + 72);
  id v8 = [*(id *)(a1 + 32) toggleZoomRegionButton];
  objc_msgSend(v8, "setCenter:", v6, v7);
}

- (double)_maxDockWidth
{
  if ([(ZWZoomDockedLensViewController *)self dockPosition]
    && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
  {
    double v3 = [(ZWZoomDockedLensViewController *)self view];
    [v3 bounds];
    double v5 = v6 * 0.5;
  }
  else
  {
    double v3 = [(ZWZoomDockedLensViewController *)self view];
    [v3 bounds];
    double v5 = v4;
  }

  return v5;
}

- (double)_maxDockHeight
{
  if ([(ZWZoomDockedLensViewController *)self dockPosition]
    && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
  {
    double v3 = [(ZWZoomDockedLensViewController *)self view];
    [v3 bounds];
    double v5 = v6;
  }
  else
  {
    double v3 = [(ZWZoomDockedLensViewController *)self view];
    [v3 bounds];
    double v5 = v4 * 0.5;
  }

  return v5;
}

- (id)stringForCurrentDockPosition
{
  unint64_t v2 = [(ZWZoomDockedLensViewController *)self dockPosition];
  if (v2 <= 3) {
    id v3 = *(id *)*(&off_79058 + v2);
  }

  return v3;
}

- (void)_toggleVisibilityButtonWasLongPressed
{
  id v4 = [(ZWZoomDockedLensViewController *)self dockedDelegate];
  id v3 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
  [v4 dockedLensViewController:self toggleButtonDidReceiveLongPress:v3];
}

- (BOOL)_shouldDisableLensEffectsForStandbyMode
{
  return 1;
}

- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3
{
  double v5 = [(ZWZoomLensViewController *)self lensZoomView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(ZWZoomLensViewController *)self lensZoomView];
  [v10 sampledContentSizeWithZoomFactor:a3];
  double v12 = v11;
  double v14 = v13;

  double v15 = (v7 - v12) * 0.5;
  double v16 = (v9 - v14) * 0.5;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)deltaForDockedZoomMovementToRect:(CGRect)a3
{
  switch([(ZWZoomDockedLensViewController *)self dockPosition])
  {
    case 0:
    case 1:
      [(ZWZoomDockedLensViewController *)self screenShift];
      break;
    case 2:
    case 3:
      id v4 = [(ZWZoomDockedLensViewController *)self dockedLensView];
      [v4 bounds];
      [(ZWZoomDockedLensViewController *)self screenShift];

      break;
    default:
      break;
  }
  AX_CGRectGetCenter();
  double v6 = v5;
  double v8 = v7;
  [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
  AX_CGRectGetCenter();
  double v10 = v6 - v9;
  double v12 = v8 - v11;
  if ([(ZWZoomDockedLensViewController *)self dockPosition]
    && (char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3)
  {
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    double v22 = v21;
    double v23 = [(ZWZoomDockedLensViewController *)self view];
    [v23 bounds];
    double v25 = v24;

    double v26 = [(ZWZoomDockedLensViewController *)self dockedLensView];
    [v26 bounds];
    double v28 = v27;

    double v10 = v10 / (v28 / (v25 - v28 - v22) + 1.0);
  }
  else
  {
    [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
    double v14 = v13;
    double v15 = [(ZWZoomDockedLensViewController *)self view];
    [v15 bounds];
    double v17 = v16;

    double v18 = [(ZWZoomDockedLensViewController *)self dockedLensView];
    [v18 bounds];
    double v20 = v19;

    double v12 = v12 / (v20 / (v17 - v20 - v14) + 1.0);
  }
  double v29 = v10;
  double v30 = v12;
  result.double y = v30;
  result.double x = v29;
  return result;
}

- (void)handleAdditionalPanOffsetFromOriginalOffset:(CGPoint)a3 validOffset:(CGPoint)a4 useFullDelta:(BOOL)a5
{
}

- (void)zoomMovementDidEnd
{
  self->_lastPanPoint = CGPointZero;
}

- (CGPoint)_lensDragMultiplier
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGRect)frameForResizeDrag
{
  double v3 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = ZWZoomLensBorderThicknessForTouches();
  switch([(ZWZoomDockedLensViewController *)self dockPosition])
  {
    case 0:
      v19.origin.double x = v5;
      v19.origin.double y = v7;
      v19.size.double width = v9;
      v19.size.double height = v11;
      double MaxY = CGRectGetMaxY(v19);
      goto LABEL_7;
    case 1:
      v20.origin.double x = v5;
      v20.origin.double y = v7;
      v20.size.double width = v9;
      v20.size.double height = v11;
      double MaxX = CGRectGetMaxX(v20);
      goto LABEL_5;
    case 2:
      v21.origin.double x = v5;
      v21.origin.double y = v7;
      v21.size.double width = v9;
      v21.size.double height = v11;
      double MaxX = CGRectGetMinX(v21);
LABEL_5:
      double v5 = MaxX - v12;
      double v9 = v12 + v12;
      break;
    case 3:
      v22.origin.double x = v5;
      v22.origin.double y = v7;
      v22.size.double width = v9;
      v22.size.double height = v11;
      double MaxY = CGRectGetMinY(v22);
LABEL_7:
      double v7 = MaxY - v12;
      double v11 = v12 + v12;
      break;
    default:
      break;
  }
  double v15 = v5;
  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  double v5 = [v4 panGestureRecognizer];
  double v6 = [(ZWZoomDockedLensViewController *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(ZWZoomDockedLensViewController *)self view];
  double v12 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  objc_msgSend(v11, "convertPoint:toView:", v12, v8, v10);
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    double v17 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
    [v17 frame];
    v22.double x = v8;
    v22.double y = v10;
    if (CGRectContainsPoint(v25, v22))
    {
    }
    else
    {
      [(ZWZoomDockedLensViewController *)self frameForResizeDrag];
      v23.double x = v8;
      v23.double y = v10;
      BOOL v18 = CGRectContainsPoint(v26, v23);

      if (v18)
      {
        CGRect v19 = [(ZWZoomDockedLensViewController *)self dockedDelegate];
        [v19 handleWasDraggedWithDockedLensViewController:self];

        v21.receiver = self;
        v21.super_class = (Class)ZWZoomDockedLensViewController;
        [(ZWZoomLensViewController *)&v21 scrollViewWillBeginDragging:v4];
        goto LABEL_10;
      }
    }
  }
  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    if ([(ZWZoomDockedLensViewController *)self zoomRegionVisible])
    {
      [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
      v24.double x = v14;
      v24.double y = v16;
      if (CGRectContainsPoint(v27, v24))
      {
        v20.receiver = self;
        v20.super_class = (Class)ZWZoomDockedLensViewController;
        [(ZWZoomLensViewController *)&v20 scrollViewWillBeginDragging:v4];
        self->_lastScrollPoint.double x = v8;
        self->_lastScrollPoint.double y = v10;
      }
    }
  }
LABEL_10:
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = [v4 panGestureRecognizer];
  double v6 = [(ZWZoomDockedLensViewController *)self view];
  [v5 locationInView:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  if ([(ZWZoomLensViewController *)self inStandbyMode]
    || ![(ZWZoomDockedLensViewController *)self isInDockResizingMode])
  {
    if (![(ZWZoomLensViewController *)self inStandbyMode])
    {
      if ([(ZWZoomDockedLensViewController *)self zoomRegionVisible])
      {
        [(ZWZoomDockedLensViewController *)self zoomRegionFrame];
        v24.double x = v8;
        v24.double y = v10;
        if (CGRectContainsPoint(v25, v24))
        {
          v22.receiver = self;
          v22.super_class = (Class)ZWZoomDockedLensViewController;
          [(ZWZoomLensViewController *)&v22 scrollViewDidScroll:v4];
          double v11 = [v4 panGestureRecognizer];
          double v12 = [(ZWZoomDockedLensViewController *)self view];
          [v11 locationInView:v12];
          double v14 = v13;
          double v16 = v15;

          double x = self->_lastScrollPoint.x;
          double y = self->_lastScrollPoint.y;
          +[CATransaction begin];
          +[CATransaction setDisableActions:1];
          if ([(ZWZoomDockedLensViewController *)self _zoomRegionOnDockReplicatorEdge])
          {
            double v19 = v16 - y;
            if ([(ZWZoomDockedLensViewController *)self dockPosition])
            {
              double v20 = v14 - x;
              if ((char *)[(ZWZoomDockedLensViewController *)self dockPosition] != (char *)&dword_0 + 3) {
                double v19 = v20;
              }
            }
            [(ZWZoomDockedLensViewController *)self dockShift];
            [(ZWZoomDockedLensViewController *)self shiftDock:v19 + v21];
          }
          +[CATransaction commit];
          self->_lastScrollPoint.double x = v14;
          self->_lastScrollPoint.double y = v16;
        }
      }
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)ZWZoomDockedLensViewController;
    [(ZWZoomLensViewController *)&v23 scrollViewDidScroll:v4];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(ZWZoomLensViewController *)self inStandbyMode]
    && ([(ZWZoomDockedLensViewController *)self isInDockResizingMode]
     || [(ZWZoomDockedLensViewController *)self zoomRegionVisible]))
  {
    v8.receiver = self;
    v8.super_class = (Class)ZWZoomDockedLensViewController;
    [(ZWZoomLensViewController *)&v8 scrollViewDidEndDragging:v6 willDecelerate:v4];
    double v7 = [(ZWZoomDockedLensViewController *)self dockedDelegate];
    [v7 doneResizingDockWithDockedLensViewController:self];

    [(ZWZoomDockedLensViewController *)self zoomMovementDidEnd];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  if (![(ZWZoomLensViewController *)self inStandbyMode]
    && ([(ZWZoomDockedLensViewController *)self zoomRegionVisible]
     || [(ZWZoomDockedLensViewController *)self isInDockResizingMode]))
  {
    v5.receiver = self;
    v5.super_class = (Class)ZWZoomDockedLensViewController;
    [(ZWZoomLensViewController *)&v5 scrollViewDidEndDecelerating:v4];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(ZWZoomDockedLensViewController *)self view];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [(ZWZoomDockedLensViewController *)self view];
  double v14 = [(ZWZoomDockedLensViewController *)self dockedLensView];
  objc_msgSend(v13, "convertPoint:toView:", v14, v10, v12);
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  [(ZWZoomDockedLensViewController *)self frameForResizeDrag];
  v23.double x = v16;
  v23.double y = v18;
  if (CGRectContainsPoint(v24, v23))
  {
    char v19 = 0;
  }
  else
  {
    double v20 = [v6 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v19 = isKindOfClass ^ 1;
  }

  return v19 & 1;
}

- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  objc_super v8 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
  double v9 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
  objc_msgSend(v7, "convertPoint:toView:", v9, x, y);
  double v10 = objc_msgSend(v8, "hitTest:withEvent:", 0);

  if (v10)
  {
    uint64_t v11 = [(ZWZoomDockedLensViewController *)self toggleZoomRegionButton];
  }
  else
  {
    double v12 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
    double v13 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
    objc_msgSend(v7, "convertPoint:toView:", v13, x, y);
    double v14 = objc_msgSend(v12, "hitTest:withEvent:", 0);

    if (v14)
    {
      uint64_t v11 = [(ZWZoomDockedLensViewController *)self dockedBorderView];
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)ZWZoomDockedLensViewController;
      uint64_t v11 = -[ZWZoomLensViewController zoomRootview:viewForHitTestAtPoint:](&v17, "zoomRootview:viewForHitTestAtPoint:", v7, x, y);
    }
  }
  double v15 = (void *)v11;

  return v15;
}

- (ZWZoomDockedLensViewControllerDelegate)dockedDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dockedDelegate);

  return (ZWZoomDockedLensViewControllerDelegate *)WeakRetained;
}

- (void)setDockedDelegate:(id)a3
{
}

- (UIView)dockedLensView
{
  return self->_dockedLensView;
}

- (void)setDockedLensView:(id)a3
{
}

- (ZWShowHideZoomRegionButton)toggleZoomRegionButton
{
  return self->_toggleZoomRegionButton;
}

- (void)setToggleZoomRegionButton:(id)a3
{
}

- (UIView)screenReplicatorView
{
  return self->_screenReplicatorView;
}

- (void)setScreenReplicatorView:(id)a3
{
}

- (CAReplicatorLayer)screenReplicatorLayer
{
  return self->_screenReplicatorLayer;
}

- (void)setScreenReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)screenBackdropLayer
{
  return self->_screenBackdropLayer;
}

- (void)setScreenBackdropLayer:(id)a3
{
}

- (CAShapeLayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (CGRect)zoomRegionFrame
{
  double x = self->_zoomRegionFrame.origin.x;
  double y = self->_zoomRegionFrame.origin.y;
  double width = self->_zoomRegionFrame.size.width;
  double height = self->_zoomRegionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomRegionFrame:(CGRect)a3
{
  self->_zoomRegionFrame = a3;
}

- (double)screenShift
{
  return self->_screenShift;
}

- (void)setScreenShift:(double)a3
{
  self->_screenShift = a3;
}

- (BOOL)isInDockResizingMode
{
  return self->_inDockResizingMode;
}

- (BOOL)zoomRegionVisible
{
  return self->_zoomRegionVisible;
}

- (void)setZoomRegionVisible:(BOOL)a3
{
  self->_zoomRegionVisible = a3;
}

- (int64_t)dockPosition
{
  return self->_dockPosition;
}

- (void)setDockPosition:(int64_t)a3
{
  self->_dockPosition = a3;
}

- (BOOL)dockPositionIsTransitioning
{
  return self->_dockPositionIsTransitioning;
}

- (void)setDockPositionIsTransitioning:(BOOL)a3
{
  self->_dockPositionIsTransitioning = a3;
}

- (UIView)dockReplicatorView
{
  return self->_dockReplicatorView;
}

- (void)setDockReplicatorView:(id)a3
{
}

- (CAReplicatorLayer)dockReplicatorLayer
{
  return self->_dockReplicatorLayer;
}

- (void)setDockReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)dockBackdropLayer
{
  return self->_dockBackdropLayer;
}

- (void)setDockBackdropLayer:(id)a3
{
}

- (CAShapeLayer)touchStealLayer
{
  return self->_touchStealLayer;
}

- (void)setTouchStealLayer:(id)a3
{
}

- (double)dockShift
{
  return self->_dockShift;
}

- (void)setDockShift:(double)a3
{
  self->_dockShift = a3;
}

- (ZWDockedLensChromeBorderView)dockedBorderView
{
  return self->_dockedBorderView;
}

- (void)setDockedBorderView:(id)a3
{
}

- (double)dockSize
{
  return self->_dockSize;
}

- (void)setDockSize:(double)a3
{
  self->_dockSize = a3;
}

- (NSLayoutConstraint)dockedViewTopConstraint
{
  return self->_dockedViewTopConstraint;
}

- (void)setDockedViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockedViewBottomConstraint
{
  return self->_dockedViewBottomConstraint;
}

- (void)setDockedViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockedViewLeftConstraint
{
  return self->_dockedViewLeftConstraint;
}

- (void)setDockedViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockedViewRightConstraint
{
  return self->_dockedViewRightConstraint;
}

- (void)setDockedViewRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)zoomViewTopConstraint
{
  return self->_zoomViewTopConstraint;
}

- (void)setZoomViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)zoomViewBottomConstraint
{
  return self->_zoomViewBottomConstraint;
}

- (void)setZoomViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)zoomViewLeftConstraint
{
  return self->_zoomViewLeftConstraint;
}

- (void)setZoomViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)zoomViewRightConstraint
{
  return self->_zoomViewRightConstraint;
}

- (void)setZoomViewRightConstraint:(id)a3
{
}

- (BOOL)transitioningForStandby
{
  return self->_transitioningForStandby;
}

- (void)setTransitioningForStandby:(BOOL)a3
{
  self->_transitioningForStandbdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_zoomViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_zoomViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_zoomViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_dockedViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_dockedViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_dockedViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_dockedViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_dockedBorderView, 0);
  objc_storeStrong((id *)&self->_touchStealLayer, 0);
  objc_storeStrong((id *)&self->_dockBackdropLayer, 0);
  objc_storeStrong((id *)&self->_dockReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_dockReplicatorView, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_screenBackdropLayer, 0);
  objc_storeStrong((id *)&self->_screenReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_screenReplicatorView, 0);
  objc_storeStrong((id *)&self->_toggleZoomRegionButton, 0);
  objc_storeStrong((id *)&self->_dockedLensView, 0);

  objc_destroyWeak((id *)&self->_dockedDelegate);
}

@end
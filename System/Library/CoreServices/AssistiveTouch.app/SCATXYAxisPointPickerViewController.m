@interface SCATXYAxisPointPickerViewController
- (AXDispatchTimer)elementFinderTimer;
- (BOOL)_canShowWhileLocked;
- (CGPoint)_currentFocusedPointInScreenCoordinates:(BOOL)a3;
- (SCATXYAxisPointPickerViewController)initWithElementManager:(id)a3 menu:(id)a4;
- (SCATXYAxisRangeLayer)xAxis;
- (SCATXYAxisRangeLayer)yAxis;
- (UIView)axisContainerView;
- (double)_rangeAnimationVelocityWithSlowdownMultiplier:(unint64_t)a3;
- (id)_sweepAnimationForLayer:(id)a3 parentBounds:(CGRect)a4 slowdownMultiplier:(unint64_t)a5 direction:(BOOL)a6 animationKey:(id)a7;
- (id)_sweepAnimationStartingInPlaceForLayer:(id)a3 parentBounds:(CGRect)a4 slowdownMultiplier:(unint64_t)a5 direction:(BOOL)a6 animationKey:(id)a7;
- (int64_t)sweepCount;
- (unint64_t)numberOfCycles;
- (unint64_t)pickerPhase;
- (void)_beginHighlightingTargetedElements;
- (void)_endHighlightingTargedElements;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)loadView;
- (void)orientationDidChange:(id)a3;
- (void)setAxisContainerView:(id)a3;
- (void)setElementFinderTimer:(id)a3;
- (void)setPickerPhase:(unint64_t)a3;
- (void)setSweepCount:(int64_t)a3;
- (void)setXAxis:(id)a3;
- (void)setYAxis:(id)a3;
- (void)updateWithPhase:(unint64_t)a3 withPicker:(id)a4;
@end

@implementation SCATXYAxisPointPickerViewController

- (SCATXYAxisPointPickerViewController)initWithElementManager:(id)a3 menu:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SCATXYAxisPointPickerViewController;
  v4 = [(SCATPointPickerViewController *)&v11 initWithElementManager:a3 menu:a4];
  if (v4)
  {
    id v5 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [(SCATXYAxisPointPickerViewController *)v4 setElementFinderTimer:v5];
    v6 = +[AXSettings sharedInstance];
    uint64_t v7 = 2 * ([v6 switchControlPointPickerSelectionStyle] == (id)1);

    v8 = [[SCATXYAxisRangeLayer alloc] initWithAxis:0];
    [(SCATXYAxisPointPickerViewController *)v4 setXAxis:v8];
    [(SCATXYAxisRangeLayer *)v8 updateTheme:v7 animated:0];
    v9 = [[SCATXYAxisRangeLayer alloc] initWithAxis:1];
    [(SCATXYAxisPointPickerViewController *)v4 setYAxis:v9];
    [(SCATXYAxisRangeLayer *)v9 updateTheme:v7 animated:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SCATXYAxisPointPickerViewController;
  [(SCATPointPickerViewController *)&v4 dealloc];
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)SCATXYAxisPointPickerViewController;
  [(SCATPointPickerViewController *)&v12 loadView];
  id v3 = objc_alloc((Class)UIView);
  objc_super v4 = [(SCATXYAxisPointPickerViewController *)self view];
  [v4 bounds];
  id v5 = objc_msgSend(v3, "initWithFrame:");

  [v5 setAutoresizingMask:18];
  v6 = [(SCATXYAxisPointPickerViewController *)self view];
  [v6 addSubview:v5];

  uint64_t v7 = +[AXSettings sharedInstance];
  unsigned int v8 = [v7 assistiveTouchScannerCursorHighVisibilityEnabled];

  v9 = [v5 layer];
  v10 = v9;
  LODWORD(v11) = 0.75;
  if (v8) {
    *(float *)&double v11 = 1.0;
  }
  [v9 setOpacity:v11];

  [(SCATXYAxisPointPickerViewController *)self setAxisContainerView:v5];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)numberOfCycles
{
  return (unint64_t)[(SCATXYAxisPointPickerViewController *)self sweepCount] >> 1;
}

- (void)updateWithPhase:(unint64_t)a3 withPicker:(id)a4
{
  id v6 = a4;
  if (self->_pickerPhase != a3)
  {
    uint64_t v7 = [(SCATXYAxisPointPickerViewController *)self axisContainerView];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(SCATXYAxisPointPickerViewController *)self xAxis];
    v17 = [(SCATXYAxisPointPickerViewController *)self yAxis];
    [(SCATXYAxisPointPickerViewController *)self setSweepCount:0];
    switch(a3)
    {
      case 0uLL:
        goto LABEL_15;
      case 1uLL:
        v18 = [v16 superlayer];
        if (v18)
        {
        }
        else
        {
          v51 = [v17 superlayer];

          if (!v51) {
            goto LABEL_18;
          }
        }
        _AXAssert();
LABEL_18:
        v52 = [v16 animationKeys];
        if ([v52 count])
        {
        }
        else
        {
          v57 = [v17 animationKeys];
          id v58 = [v57 count];

          if (!v58) {
            goto LABEL_26;
          }
        }
        _AXAssert();
LABEL_26:
        v59 = [v7 layer];
        [v59 addSublayer:v16];

        v60 = [(SCATPointPickerViewController *)self pointPicker];
        id v61 = [v60 refinementCount];

        if (!v61)
        {
          objc_msgSend(v16, "updateFrameForParentBounds:refinementPoint:", 0, v9, v11, v13, v15);
          if ([v6 usesTwoLevelRefinement]) {
            uint64_t v68 = 0;
          }
          else {
            uint64_t v68 = 2;
          }
          [v16 updateTheme:v68 animated:1];
          v19 = [(SCATXYAxisPointPickerViewController *)self _sweepAnimationForLayer:v16, 1, 1, @"SCATRangeAnimationID", v9, v11, v13, v15 parentBounds slowdownMultiplier direction animationKey];
          v69 = [v19 toValue];
          [v69 CGPointValue];
          objc_msgSend(v16, "updateLayerTreePosition:");

          v55 = [v19 animationKey];
          v56 = v16;
          goto LABEL_38;
        }
        v62 = [(SCATPointPickerViewController *)self pointPicker];
        [v62 pickedPointInDeviceCoordinates];
        uint64_t v70 = v63;
        uint64_t v71 = v64;

        objc_msgSend(v16, "updateFrameForParentBounds:refinementPoint:", &v70, v9, v11, v13, v15);
        objc_msgSend(v16, "updateToFitWithinParentBounds:", v9, v11, v13, v15);
        [v16 updateTheme:1 animated:1];
        v21 = [v16 lineLayer];
        [v16 bounds];
        v22 = self;
        v23 = v21;
        uint64_t v24 = 1;
LABEL_28:
        v19 = -[SCATXYAxisPointPickerViewController _sweepAnimationForLayer:parentBounds:slowdownMultiplier:direction:animationKey:](v22, "_sweepAnimationForLayer:parentBounds:slowdownMultiplier:direction:animationKey:", v23, 8, v24, @"SCATLineAnimationID");

        v65 = [v16 lineLayer];
        v66 = [v19 toValue];
        [v66 CGPointValue];
        objc_msgSend(v65, "updateLayerTreePosition:");

        v42 = v16;
        goto LABEL_29;
      case 2uLL:
        id v20 = [v16 isAnimatingForwards];
        [v16 removeAllAnimations];
        objc_msgSend(v16, "updateToFitWithinParentBounds:", v9, v11, v13, v15);
        [v16 updateTheme:1 animated:1];
        v21 = [v16 lineLayer];
        [v16 bounds];
        v22 = self;
        v23 = v21;
        uint64_t v24 = (uint64_t)v20;
        goto LABEL_28;
      case 3uLL:
        v25 = [v16 lineLayer];
        [v25 convertTime:0 fromLayer:CACurrentMediaTime()];
        double v27 = v26;
        v28 = [v16 lineLayer];
        [v28 setTimeOffset:v27];

        double v29 = CACurrentMediaTime();
        v30 = [v16 lineLayer];
        [v30 setBeginTime:v29];

        v31 = v16;
        goto LABEL_13;
      case 4uLL:
        [v16 removeAllAnimations];
        [v16 updateTheme:3 animated:1];
        v32 = [v7 layer];
        [v32 addSublayer:v17];

        if ([v6 refinementCount])
        {
          [v6 pickedPointInDeviceCoordinates];
          uint64_t v70 = v33;
          uint64_t v71 = v34;
          objc_msgSend(v17, "updateFrameForParentBounds:refinementPoint:", &v70, v9, v11, v13, v15);
          objc_msgSend(v17, "updateToFitWithinParentBounds:", v9, v11, v13, v15);
          [v17 updateTheme:1 animated:1];
          v35 = [v17 lineLayer];
          [v17 bounds];
          v36 = self;
          v37 = v35;
          uint64_t v38 = 1;
LABEL_11:
          v19 = -[SCATXYAxisPointPickerViewController _sweepAnimationForLayer:parentBounds:slowdownMultiplier:direction:animationKey:](v36, "_sweepAnimationForLayer:parentBounds:slowdownMultiplier:direction:animationKey:", v37, 8, v38, @"SCATLineAnimationID");

          v40 = [v17 lineLayer];
          v41 = [v19 toValue];
          [v41 CGPointValue];
          objc_msgSend(v40, "updateLayerTreePosition:");

          v42 = v17;
LABEL_29:
          v55 = [v42 lineLayer];
          v67 = [v19 animationKey];
          [v55 addAnimation:v19 forKey:v67];
        }
        else
        {
          objc_msgSend(v17, "updateFrameForParentBounds:refinementPoint:", 0, v9, v11, v13, v15);
          if ([v6 usesTwoLevelRefinement]) {
            uint64_t v53 = 0;
          }
          else {
            uint64_t v53 = 2;
          }
          [v17 updateTheme:v53 animated:1];
          v19 = [(SCATXYAxisPointPickerViewController *)self _sweepAnimationForLayer:v17, 1, 1, @"SCATRangeAnimationID", v9, v11, v13, v15 parentBounds slowdownMultiplier direction animationKey];
          v54 = [v19 toValue];
          [v54 CGPointValue];
          objc_msgSend(v17, "updateLayerTreePosition:");

          v55 = [v19 animationKey];
          v56 = v17;
LABEL_38:
          [v56 addAnimation:v19 forKey:v55];
        }

LABEL_31:
LABEL_32:
        self->_pickerPhase = a3;

        break;
      case 5uLL:
        id v39 = [v17 isAnimatingForwards];
        [v17 removeAllAnimations];
        objc_msgSend(v17, "updateToFitWithinParentBounds:", v9, v11, v13, v15);
        [v17 updateTheme:1 animated:1];
        v35 = [v17 lineLayer];
        [v17 bounds];
        v36 = self;
        v37 = v35;
        uint64_t v38 = (uint64_t)v39;
        goto LABEL_11;
      case 6uLL:
        v43 = [v17 lineLayer];
        [v43 convertTime:0 fromLayer:CACurrentMediaTime()];
        double v45 = v44;
        v46 = [v17 lineLayer];
        [v46 setTimeOffset:v45];

        double v47 = CACurrentMediaTime();
        v48 = [v17 lineLayer];
        [v48 setBeginTime:v47];

        v31 = v17;
LABEL_13:
        v19 = [v31 lineLayer];
        LODWORD(v49) = 0.25;
        [v19 setSpeed:v49];
        goto LABEL_31;
      case 7uLL:
        [v17 updateTheme:3 animated:1];
        v50 = [(SCATPointPickerViewController *)self pointPicker];
        [(SCATXYAxisPointPickerViewController *)self _currentFocusedPointInScreenCoordinates:0];
        objc_msgSend(v50, "_savePoint:andNotifyDelegate:", 1);

        [v16 resetLineLayer];
        [v17 resetLineLayer];
LABEL_15:
        [(SCATXYAxisPointPickerViewController *)self _endHighlightingTargedElements];
        [v16 removeAllAnimations];
        [v16 removeFromSuperlayer];
        [v17 removeAllAnimations];
        [v17 removeFromSuperlayer];
        goto LABEL_32;
      default:
        v19 = +[NSNumber numberWithUnsignedInteger:a3];
        _AXAssert();
        goto LABEL_31;
    }
  }
}

- (CGPoint)_currentFocusedPointInScreenCoordinates:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCATXYAxisPointPickerViewController *)self yAxis];
  id v6 = [v5 lineLayer];
  unsigned int v7 = [v6 isActive];

  double v8 = [(SCATXYAxisPointPickerViewController *)self yAxis];
  double v9 = v8;
  if (v7)
  {
    double v10 = [v8 lineLayer];
    double v11 = [v10 presentationLayer];
    [v11 position];
    double v13 = v12;
    double v15 = v14;

    double v9 = [(SCATXYAxisPointPickerViewController *)self yAxis];
    v16 = [v9 presentationLayer];
    v17 = [(SCATXYAxisPointPickerViewController *)self axisContainerView];
    v18 = [v17 layer];
    objc_msgSend(v16, "convertPoint:toLayer:", v18, v13, v15);
    double v20 = v19;
  }
  else
  {
    v16 = [v8 presentationLayer];
    [v16 position];
    double v20 = v21;
  }

  v22 = [(SCATXYAxisPointPickerViewController *)self xAxis];
  v23 = [v22 lineLayer];
  unsigned int v24 = [v23 isActive];

  if (v24)
  {
    v25 = [(SCATXYAxisPointPickerViewController *)self xAxis];
    double v26 = [v25 lineLayer];
    double v27 = [v26 presentationLayer];
    [v27 position];
    double v29 = v28;
    double v31 = v30;

    v32 = [(SCATXYAxisPointPickerViewController *)self xAxis];
    uint64_t v33 = [v32 presentationLayer];
    uint64_t v34 = [(SCATXYAxisPointPickerViewController *)self axisContainerView];
    v35 = [v34 layer];
    objc_msgSend(v33, "convertPoint:toLayer:", v35, v29, v31);
    double v37 = v36;
  }
  else
  {
    v32 = [(SCATXYAxisPointPickerViewController *)self yAxis];
    uint64_t v33 = [v32 presentationLayer];
    [v33 position];
    double v37 = v38;
  }

  if (v3)
  {
    id v39 = [(SCATXYAxisPointPickerViewController *)self axisContainerView];
    +[HNDScreen convertPoint:fromView:](HNDScreen, "convertPoint:fromView:", v39, v37, v20);
    double v41 = v40;
    double v43 = v42;

    double v44 = v41;
    double v45 = v43;
  }
  else
  {
    double v44 = v37;
    double v45 = v20;
  }
  result.y = v45;
  result.x = v44;
  return result;
}

- (void)orientationDidChange:(id)a3
{
  objc_super v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(SCATXYAxisPointPickerViewController *)self yAxis];
  [v9 frame];
  double Width = CGRectGetWidth(v20);
  +[SCATXYAxisRangeLayer rangeLayerFrameInset];
  double v12 = Width - v11;
  double v13 = [(SCATXYAxisPointPickerViewController *)self xAxis];
  [v13 frame];
  double Height = CGRectGetHeight(v21);
  +[SCATXYAxisRangeLayer rangeLayerFrameInset];
  double v16 = Height - v15;

  if (v6 != v12 || v8 != v16)
  {
    id v18 = [(SCATPointPickerViewController *)self pointPicker];
    [v18 redisplayIfNeeded:0];
  }
}

- (void)_beginHighlightingTargetedElements
{
  [(SCATXYAxisPointPickerViewController *)self _currentFocusedPointInScreenCoordinates:1];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(SCATXYAxisPointPickerViewController *)self axisPointPicker];
  objc_msgSend(v7, "didSweepOverPoint:", v4, v6);

  double v8 = [(SCATXYAxisPointPickerViewController *)self elementFinderTimer];
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FA38;
  v10[3] = &unk_1001AAA90;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000FA40;
  v9[3] = &unk_1001AAA90;
  [v8 afterDelay:v10 processBlock:v9 cancelBlock:0.1];
}

- (void)_endHighlightingTargedElements
{
  id v2 = [(SCATXYAxisPointPickerViewController *)self elementFinderTimer];
  [v2 cancel];
}

- (double)_rangeAnimationVelocityWithSlowdownMultiplier:(unint64_t)a3
{
  if (!a3) {
    _AXAssert();
  }
  double v4 = +[AXSettings sharedInstance];
  [v4 assistiveTouchAxisSweepSpeed];
  double v6 = v5;

  return v6 / (double)a3;
}

- (id)_sweepAnimationForLayer:(id)a3 parentBounds:(CGRect)a4 slowdownMultiplier:(unint64_t)a5 direction:(BOOL)a6 animationKey:(id)a7
{
  BOOL v7 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a7;
  id v16 = a3;
  unsigned int v17 = [v16 axis];
  id v18 = +[SCATSweepAnimation sweepAnimationWithDirection:v7 scatLayer:v16 animationKey:v15];

  [v18 setDelegate:self];
  [v18 setRemovedOnCompletion:1];
  if (v17)
  {
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.double width = width;
    v32.size.double height = height;
    double x = CGRectGetMidX(v32);
    double width = height;
    double v19 = x;
  }
  else
  {
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    double height = CGRectGetMidY(v33);
    CGRect v20 = +[HNDAccessibilityManager sharedManager];
    if ([v20 applicationIsRTL]) {
      double v19 = width;
    }
    else {
      double v19 = x;
    }

    CGRect v21 = +[HNDAccessibilityManager sharedManager];
    if (![v21 applicationIsRTL]) {
      double x = width;
    }

    double y = height;
  }
  [(SCATXYAxisPointPickerViewController *)self _rangeAnimationVelocityWithSlowdownMultiplier:a5];
  double v23 = width / v22;
  unsigned int v24 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v19, y);
  if (v7)
  {
    [v18 setFromValue:v24];

    v25 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, height);
    [v18 setToValue:v25];
  }
  else
  {
    [v18 setToValue:v24];

    v25 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, height);
    [v18 setFromValue:v25];
  }

  [v18 setDuration:v23];
  double v26 = +[AXSettings sharedInstance];
  unsigned int v27 = [v26 assistiveTouchDelayAfterInputEnabled];
  if (a5 == 1 && v27)
  {
    [v26 assistiveTouchDelayAfterInput];
    double v29 = v28;
    [v18 setFillMode:kCAFillModeBackwards];
    [v18 setBeginTime:v29 + CACurrentMediaTime()];
  }

  return v18;
}

- (id)_sweepAnimationStartingInPlaceForLayer:(id)a3 parentBounds:(CGRect)a4 slowdownMultiplier:(unint64_t)a5 direction:(BOOL)a6 animationKey:(id)a7
{
  BOOL v8 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  id v16 = a7;
  unsigned int v17 = [v15 axis];
  id v18 = +[SCATSweepAnimation sweepAnimationWithDirection:v8 scatLayer:v15 animationKey:v16];

  [v18 setDelegate:self];
  [v18 setRemovedOnCompletion:1];
  if (v17)
  {
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.double width = width;
    v32.size.double height = height;
    double width = CGRectGetMidX(v32);
    [v15 position];
    double v20 = v19;
    if (!v8) {
      double height = y;
    }
    [v15 position];
    double v22 = vabdd_f64(height, v21);
    [(SCATXYAxisPointPickerViewController *)self _rangeAnimationVelocityWithSlowdownMultiplier:a5];
    double v24 = width;
  }
  else
  {
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    double height = CGRectGetMidY(v33);
    [v15 position];
    double v24 = v25;
    if (!v8) {
      double width = x;
    }
    [v15 position];
    double v22 = vabdd_f64(width, v26);
    [(SCATXYAxisPointPickerViewController *)self _rangeAnimationVelocityWithSlowdownMultiplier:a5];
    double v20 = height;
  }
  double v27 = v22 / v23;
  double v28 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v20);
  [v18 setFromValue:v28];

  double v29 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", width, height);
  [v18 setToValue:v29];

  [v18 setDuration:v27];

  return v18;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if ((id)[(SCATXYAxisPointPickerViewController *)self pickerPhase] != (id)7)
  {
    if ([(SCATXYAxisPointPickerViewController *)self pickerPhase])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v4)
      {
        [(SCATXYAxisPointPickerViewController *)self setSweepCount:(char *)[(SCATXYAxisPointPickerViewController *)self sweepCount] + 1];
        if (([(SCATXYAxisPointPickerViewController *)self sweepCount] & 1) != 0
          || ([(SCATXYAxisPointPickerViewController *)self axisPointPicker],
              double v6 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v7 = objc_msgSend(v6, "pauseForNumberOfCycles:", -[SCATXYAxisPointPickerViewController numberOfCycles](self, "numberOfCycles")), v6, (v7 & 1) == 0))
        {
          id v8 = v13;
          double v9 = [v8 scatLayer];
          double v10 = [v8 reversedAnimation];
          double v11 = [v10 toValue];
          [v11 CGPointValue];
          objc_msgSend(v9, "updateLayerTreePosition:");

          double v12 = [v8 animationKey];

          [v9 addAnimation:v10 forKey:v12];
        }
      }
    }
  }
}

- (unint64_t)pickerPhase
{
  return self->_pickerPhase;
}

- (void)setPickerPhase:(unint64_t)a3
{
  self->_pickerPhase = a3;
}

- (AXDispatchTimer)elementFinderTimer
{
  return self->_elementFinderTimer;
}

- (void)setElementFinderTimer:(id)a3
{
}

- (UIView)axisContainerView
{
  return self->_axisContainerView;
}

- (void)setAxisContainerView:(id)a3
{
}

- (SCATXYAxisRangeLayer)xAxis
{
  return self->_xAxis;
}

- (void)setXAxis:(id)a3
{
}

- (SCATXYAxisRangeLayer)yAxis
{
  return self->_yAxis;
}

- (void)setYAxis:(id)a3
{
}

- (int64_t)sweepCount
{
  return self->_sweepCount;
}

- (void)setSweepCount:(int64_t)a3
{
  self->_sweepCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yAxis, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_storeStrong((id *)&self->_axisContainerView, 0);

  objc_storeStrong((id *)&self->_elementFinderTimer, 0);
}

@end
@interface WFBannerGesture
- (CGPoint)effectiveScaleForTranslation:(double)a3;
- (UIScrollView)embeddedScrollView;
- (UIView)dimmingView;
- (UIView)view;
- (WFBannerGesture)initWithView:(id)a3;
- (WFBannerGestureDelegate)delegate;
- (double)excessTranslationForBoundedScrollViewWithInputTranslation:(double)a3;
- (double)initialScrollOffset;
- (double)rubberBandedTranslationForTranslation:(double)a3;
- (double)topEdgeClampedTranslationForTranslation:(double)a3 scale:(double)a4 height:(double)a5;
- (id)gestureSettings;
- (unint64_t)scrollViewGestureState;
- (void)beginTrackingWithGestureRecognizer:(id)a3;
- (void)continueTrackingWithGestureRecognizer:(id)a3;
- (void)endTrackingWithGestureRecognizer:(id)a3;
- (void)handlePanGesture:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingLayerAlpha:(double)a3 response:(double)a4;
- (void)setDimmingView:(id)a3;
- (void)setEmbeddedScrollView:(id)a3;
- (void)setInitialScrollOffset:(double)a3;
- (void)setScrollViewGestureState:(unint64_t)a3;
- (void)setView:(id)a3;
@end

@implementation WFBannerGesture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_dimmingView);
  objc_destroyWeak((id *)&self->_embeddedScrollView);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setScrollViewGestureState:(unint64_t)a3
{
  self->_scrollViewGestureState = a3;
}

- (unint64_t)scrollViewGestureState
{
  return self->_scrollViewGestureState;
}

- (void)setInitialScrollOffset:(double)a3
{
  self->_initialScrollOffset = a3;
}

- (double)initialScrollOffset
{
  return self->_initialScrollOffset;
}

- (void)setView:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)setDimmingView:(id)a3
{
}

- (UIView)dimmingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dimmingView);

  return (UIView *)WeakRetained;
}

- (UIScrollView)embeddedScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_embeddedScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFBannerGestureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WFBannerGestureDelegate *)WeakRetained;
}

- (CGPoint)effectiveScaleForTranslation:(double)a3
{
  v5 = [(WFBannerGesture *)self gestureSettings];
  unsigned int v6 = [v5 squeezeEnabled];
  if (a3 <= 0.0 || v6 == 0)
  {
    [v5 trackingScale];
    double v9 = v8;
    v10 = [(WFBannerGesture *)self view];
    [v10 frame];
    double v12 = v11;

    if (v12 > 300.0) {
      double v9 = v9 + (v12 + -300.0) * v9 * -0.003;
    }
    BSUIConstrainValueWithRubberBand();
    double v14 = v13 * -0.005 * v9;
    BSUIConstrainValueWithRubberBand();
    double v16 = v15 * -0.01;
    [v5 squeeze_up];
    double v18 = v16 * v17;
    double v21 = v14 + 1.0;
    double v23 = v14 + 1.0 + v18;
  }
  else
  {
    BSUIConstrainValueWithRubberBand();
    double v20 = v19;
    double v21 = v19 / 7500.0 + 1.0;
    [v5 trackingSqueezeFactor];
    double v23 = v20 / -1000.0 * v22 + 1.0;
  }

  double v24 = v21;
  double v25 = v23;
  result.y = v25;
  result.x = v24;
  return result;
}

- (double)topEdgeClampedTranslationForTranslation:(double)a3 scale:(double)a4 height:(double)a5
{
  return a3 + (1.0 - a4) * a5 * -0.5;
}

- (double)rubberBandedTranslationForTranslation:(double)a3
{
  v4 = [(WFBannerGesture *)self gestureSettings];
  if ([v4 rubberBandingEnabled])
  {
    [v4 bottomLimit];
    if (v5 >= a3)
    {
      [v4 topLimit];
      if (v9 > a3)
      {
        [v4 topLimit];
        double v11 = v10;
        [v4 topLimit];
        [v4 topRubberBandRange];
        BSUIConstrainValueWithRubberBand();
        a3 = v11 - v12;
      }
    }
    else
    {
      [v4 bottomLimit];
      double v7 = v6;
      [v4 bottomLimit];
      [v4 bottomRubberBandRange];
      BSUIConstrainValueWithRubberBand();
      a3 = v7 + v8;
    }
  }

  return a3;
}

- (double)excessTranslationForBoundedScrollViewWithInputTranslation:(double)a3
{
  double v5 = [(WFBannerGesture *)self gestureSettings];
  double v6 = [(WFBannerGesture *)self embeddedScrollView];
  BOOL v7 = sub_1000050C8(v6);

  if (!v7) {
    goto LABEL_18;
  }
  [(WFBannerGesture *)self initialScrollOffset];
  double v9 = v8;
  double v10 = [(WFBannerGesture *)self embeddedScrollView];
  [v10 contentSize];
  double v11 = [(WFBannerGesture *)self embeddedScrollView];
  [v11 frame];

  double v12 = [(WFBannerGesture *)self view];
  UIRoundToViewScale();
  double v14 = v13;

  if ([(WFBannerGesture *)self scrollViewGestureState]) {
    goto LABEL_10;
  }
  [v5 scrollDismissalActivationLeniency];
  double v16 = v15;
  [(WFBannerGesture *)self initialScrollOffset];
  if (v17 <= 0.0)
  {
    [(WFBannerGesture *)self initialScrollOffset];
    if (a3 > 0.0 && v25 >= -v16)
    {
      [(WFBannerGesture *)self setScrollViewGestureState:3];
      [(WFBannerGesture *)self initialScrollOffset];
      if (v26 != 0.0) {
        goto LABEL_22;
      }
LABEL_10:
      char v21 = 0;
      goto LABEL_11;
    }
  }
  [(WFBannerGesture *)self initialScrollOffset];
  if (v18 < v14 || ([(WFBannerGesture *)self initialScrollOffset], a3 >= 0.0) || v19 > v14 + v16)
  {
    [(WFBannerGesture *)self setScrollViewGestureState:1];
    goto LABEL_10;
  }
  [(WFBannerGesture *)self setScrollViewGestureState:2];
  [(WFBannerGesture *)self initialScrollOffset];
  if (v20 == v14) {
    goto LABEL_10;
  }
LABEL_22:
  char v21 = 1;
LABEL_11:
  v27[1] = 3221225472;
  v27[0] = _NSConcreteStackBlock;
  v27[2] = sub_10000512C;
  v27[3] = &unk_1000388C8;
  double v22 = v9 - a3;
  char v28 = v21;
  v27[4] = self;
  double v23 = objc_retainBlock(v27);
  if ((id)[(WFBannerGesture *)self scrollViewGestureState] == (id)3 && v22 < 0.0)
  {
    ((void (*)(void *, CGFloat, CGFloat))v23[2])(v23, CGPointZero.x, CGPointZero.y);
    a3 = -v22;
  }
  else
  {
    a3 = 0.0;
    if ((id)[(WFBannerGesture *)self scrollViewGestureState] == (id)2 && v22 > v14)
    {
      ((void (*)(void *, double, double))v23[2])(v23, 0.0, v14);
      a3 = v14 - v22;
    }
  }

LABEL_18:
  return a3;
}

- (void)setDimmingLayerAlpha:(double)a3 response:(double)a4
{
  BOOL v7 = [(WFBannerGesture *)self dimmingView];

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005338;
    v8[3] = &unk_100038AA0;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v8 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:a4 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  }
}

- (void)endTrackingWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = [(WFBannerGesture *)self gestureSettings];
  double v6 = [(WFBannerGesture *)self view];
  BOOL v7 = [v6 superview];
  [v4 translationInView:v7];
  double v9 = v8;

  double v10 = [(WFBannerGesture *)self view];
  double v11 = [v10 superview];
  [v4 velocityInView:v11];
  uint64_t v13 = v12;
  double v15 = v14;

  [(WFBannerGesture *)self excessTranslationForBoundedScrollViewWithInputTranslation:v9];
  double v17 = v16;
  -[WFBannerGesture rubberBandedTranslationForTranslation:](self, "rubberBandedTranslationForTranslation:");
  double v19 = v18;
  _UIUpdateRequestDeactivate();
  if (([v5 testUnregisteredVelocityEdgeCase] & 1) != 0
    || v15 > 0.0 && v9 < 100.0
    || (int v20 = 0, v15 < 0.0) && v9 > -100.0)
  {
    int v20 = 1;
  }
  double v21 = fabs(v15);
  if (v21 < 80.0) {
    goto LABEL_8;
  }
  double v23 = v19 + v15 / 1000.0 * UIScrollViewDecelerationRateNormal / (1.0 - UIScrollViewDecelerationRateNormal);
  if (([v5 squeezeEnabled] || v19 <= 0.0 || v23 <= 150.0) && (v19 >= 0.0 || v23 >= -150.0))
  {
    double v24 = +[WFBannerPrototypeSettings sharedSettings];
    if (![v24 blurFilterEnabled]
      || (([v5 squeezeEnabled] & 1) != 0 || (objc_msgSend(v5, "blurTopLimit"), v17 >= v42))
      && ([v5 blurBottomLimit], v17 <= v43))
    {
      uint64_t v22 = 0;
      goto LABEL_15;
    }

    if (v21 >= 20.0)
    {
LABEL_8:
      uint64_t v22 = 0;
      goto LABEL_16;
    }
  }
  double v24 = [(WFBannerGesture *)self embeddedScrollView];
  [v24 setBounces:0];
  uint64_t v22 = 1;
LABEL_15:

LABEL_16:
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000059C0;
  v53[3] = &unk_100038850;
  id v25 = v5;
  double v56 = v19;
  uint64_t v57 = v13;
  double v58 = v15;
  id v54 = v25;
  v55 = self;
  double v26 = objc_retainBlock(v53);
  if (v22)
  {
    if (v20) {
      [v25 phase1_impulse_unregisteredVelocity];
    }
    else {
      [v25 phase1_impulse];
    }
    double v29 = v27;
    [v25 phase1_response];
    double v31 = v30;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100005BDC;
    v48[3] = &unk_100038878;
    uint64_t v51 = v13;
    double v52 = v15;
    id v32 = v25;
    id v49 = v32;
    v50 = self;
    double v28 = 0.0;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v48 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v31 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:v29];
    [v32 phase1_phaseDuration];
    dispatch_time_t v34 = dispatch_time(0, (uint64_t)(v33 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005CC4;
    block[3] = &unk_100038F60;
    v47 = v26;
    dispatch_after(v34, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100005CD4;
    v45[3] = &unk_100038C80;
    v45[4] = self;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v45 tracking:0 dampingRatioSmoothing:0.86 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
    double v28 = 1.0;
  }
  [(WFBannerGesture *)self setDimmingLayerAlpha:v28 response:0.55];
  v35 = [(WFBannerGesture *)self gestureSettings];
  unsigned int v36 = [v35 squeezeEnabled];

  if (v17 > 0.0 && v36)
  {
    v37 = [(WFBannerGesture *)self embeddedScrollView];
    [v37 setBounces:0];

    dispatch_time_t v38 = dispatch_time(0, 100000000);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100005D7C;
    v44[3] = &unk_100038C80;
    v44[4] = self;
    dispatch_after(v38, (dispatch_queue_t)&_dispatch_main_q, v44);
  }
  v39 = [(WFBannerGesture *)self delegate];
  char v40 = objc_opt_respondsToSelector();

  if (v40)
  {
    v41 = [(WFBannerGesture *)self delegate];
    [v41 bannerGestureDidEndWithDismissal:v22];
  }
}

- (void)continueTrackingWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = [(WFBannerGesture *)self gestureSettings];
  double v6 = [(WFBannerGesture *)self view];
  BOOL v7 = [v6 superview];
  [v4 translationInView:v7];
  double v9 = v8;
  double v11 = v10;

  [(WFBannerGesture *)self excessTranslationForBoundedScrollViewWithInputTranslation:v11];
  double v13 = v12;
  -[WFBannerGesture effectiveScaleForTranslation:](self, "effectiveScaleForTranslation:");
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  [(WFBannerGesture *)self rubberBandedTranslationForTranslation:v13];
  uint64_t v19 = v18;
  if ([v5 testUnregisteredVelocityEdgeCase]) {
    goto LABEL_22;
  }
  _UIUpdateRequestActivate();
  double v20 = 0.0;
  if ([v5 horizontalTrackingEnabled])
  {
    if (v13 < 0.0
      || v13 > 0.0
      || ([(WFBannerGesture *)self embeddedScrollView],
          double v21 = objc_claimAutoreleasedReturnValue(),
          BOOL v22 = sub_1000050C8(v21),
          v21,
          !v22))
    {
      [v5 horizontalTrackingFriction];
      double v20 = v9 * (1.0 - v23);
    }
  }
  [v5 trackingDampingRatio];
  double v25 = v24;
  [v5 trackingResponse];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100006938;
  v49[3] = &unk_1000389D8;
  v49[4] = self;
  v49[5] = v19;
  v49[6] = v15;
  v49[7] = v17;
  *(double *)&v49[8] = v20;
  double v26 = 0.0;
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v49 tracking:0 dampingRatioSmoothing:v25 responseSmoothing:v27 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  [v5 blurTopLimit];
  if (v13 >= v28)
  {
    if ([v5 squeezeEnabled]) {
      goto LABEL_13;
    }
    [v5 blurBottomLimit];
    if (v13 <= v34) {
      goto LABEL_13;
    }
    [v5 poofBlurRadius];
    double v36 = v35;
    [v5 blurBottomLimit];
    double v32 = v36 * (v13 - v37);
    double v33 = 1000.0;
  }
  else
  {
    [v5 poofBlurRadius];
    double v30 = v29;
    [v5 blurTopLimit];
    double v32 = v30 * (fabs(v13) - fabs(v31));
    double v33 = 2400.0;
  }
  double v26 = v32 / v33;
LABEL_13:
  dispatch_time_t v38 = +[WFBannerPrototypeSettings sharedSettings];
  if ([v38 blurFilterEnabled]
    && ([v5 trackingBlurEnabled] & 1) != 0)
  {
    v39 = [(WFBannerGesture *)self view];
    char v40 = [v39 layer];
    v41 = [v40 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
    double v42 = +[NSNumber numberWithDouble:v26];
    unsigned __int8 v43 = [v41 isEqual:v42];

    if ((v43 & 1) == 0)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000069F8;
      v48[3] = &unk_100038AA0;
      void v48[4] = self;
      *(double *)&v48[5] = v26;
      +[UIView _animateUsingSpringWithDampingRatio:1 response:v48 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
    }
  }
  else
  {
  }
  double v44 = fmax(v13 * 0.005 + 1.0, 0.0);
  if (v13 >= 0.0) {
    double v44 = 1.0;
  }
  [(WFBannerGesture *)self setDimmingLayerAlpha:v44 response:0.4];
  v45 = [(WFBannerGesture *)self delegate];
  char v46 = objc_opt_respondsToSelector();

  if (v46)
  {
    v47 = [(WFBannerGesture *)self delegate];
    [v47 bannerGestureDidContinue];
  }
LABEL_22:
}

- (void)beginTrackingWithGestureRecognizer:(id)a3
{
  _UIUpdateRequestActivate();
  id v4 = [(WFBannerGesture *)self embeddedScrollView];
  [v4 contentOffset];
  [(WFBannerGesture *)self setInitialScrollOffset:v5];

  [(WFBannerGesture *)self setScrollViewGestureState:0];
  double v6 = [(WFBannerGesture *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WFBannerGesture *)self delegate];
    [v8 bannerGestureDidBegin];
  }
}

- (void)handlePanGesture:(id)a3
{
  id v7 = a3;
  id v4 = (char *)[v7 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(WFBannerGesture *)self endTrackingWithGestureRecognizer:v7];
LABEL_8:
    double v6 = v7;
    goto LABEL_9;
  }
  if (v4 == (char *)2)
  {
    [(WFBannerGesture *)self continueTrackingWithGestureRecognizer:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == (char *)1;
  double v6 = v7;
  if (v5)
  {
    [(WFBannerGesture *)self beginTrackingWithGestureRecognizer:v7];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setEmbeddedScrollView:(id)a3
{
  p_embeddedScrollView = &self->_embeddedScrollView;
  id v5 = a3;
  objc_storeWeak((id *)p_embeddedScrollView, v5);
  id v6 = [v5 panGestureRecognizer];

  [v6 addTarget:self action:"handlePanGesture:"];
}

- (WFBannerGesture)initWithView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFBannerGesture;
  id v6 = [(WFBannerGesture *)&v10 init];
  if (v6)
  {
    id v7 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:v6 action:"handlePanGesture:"];
    [v5 addGestureRecognizer:v7];
    objc_storeStrong((id *)&v6->_view, a3);
    id v8 = v6;
  }
  return v6;
}

- (id)gestureSettings
{
  v2 = +[WFBannerPrototypeSettings sharedSettings];
  v3 = [v2 gestureSettings];

  return v3;
}

@end
@interface PHVideoCallVideoGroupView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGPoint)centerPointForCurrentVideoGroupCorner;
- (CGPoint)transformedCenter;
- (CGRect)cornerLocationsRect;
- (PHVideoCallVideoGroupView)initWithFrame:(CGRect)a3;
- (PHVideoCallVideoGroupViewDelegate)delegate;
- (double)_gridViewRubberBandValueForValue:(double)result target:(double)a4 timeInterval:(double)a5 velocity:(double *)a6;
- (int64_t)corner;
- (void)addPanningGestureRecognizer;
- (void)cancelThrowAnimation;
- (void)dealloc;
- (void)finishedThrowAnimation;
- (void)handlePanDetected:(id)a3;
- (void)handlePanGestureFinished:(id)a3;
- (void)refreshPositionInCorner;
- (void)setCorner:(int64_t)a3;
- (void)setCornerLocationsRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setTransformForNewCenter:(CGPoint)a3;
- (void)startThrowAnimation;
- (void)updateThrowAnimation:(id)a3;
@end

@implementation PHVideoCallVideoGroupView

- (PHVideoCallVideoGroupView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PHVideoCallVideoGroupView;
  v3 = -[PHVideoCallVideoGroupView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (PHVideoCallVideoGroupView *)v3;
  if (v3)
  {
    CGPoint v5 = CGPointZero;
    *((CGPoint *)v3 + 1) = CGPointZero;
    *((CGPoint *)v3 + 2) = v5;
    v6 = v3 + 48;
    v7 = +[UIScreen mainScreen];
    [v7 _referenceBounds];
    void *v6 = v8;
    v4->_cornerLocationsRect.origin.y = v9;
    v4->_cornerLocationsRect.size.width = v10;
    v4->_cornerLocationsRect.size.height = v11;

    v4->_corner = CNFGetAppIntegerForKey();
  }
  return v4;
}

- (void)dealloc
{
  CNFSetAppIntegerForKey();
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHVideoCallVideoGroupView;
  [(PHVideoCallVideoGroupView *)&v3 dealloc];
}

- (CGPoint)transformedCenter
{
  [(PHVideoCallVideoGroupView *)self center];
  double v4 = v3;
  [(PHVideoCallVideoGroupView *)self transform];
  [(PHVideoCallVideoGroupView *)self center];
  double v6 = v5;
  [(PHVideoCallVideoGroupView *)self transform];
  double v7 = v6 + v9;
  double v8 = v4 + v10;
  result.y = v7;
  result.x = v8;
  return result;
}

- (void)setTransformForNewCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PHVideoCallVideoGroupView *)self transform];
  uint64_t v6 = v13[24];
  [(PHVideoCallVideoGroupView *)self transform];
  uint64_t v7 = v13[19];
  [(PHVideoCallVideoGroupView *)self transform];
  uint64_t v8 = v13[14];
  [(PHVideoCallVideoGroupView *)self transform];
  uint64_t v9 = v13[9];
  [(PHVideoCallVideoGroupView *)self center];
  double v11 = x - v10;
  [(PHVideoCallVideoGroupView *)self center];
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v8;
  v13[3] = v9;
  *(double *)&v13[4] = v11;
  *(double *)&v13[5] = y - v12;
  [(PHVideoCallVideoGroupView *)self setTransform:v13];
}

- (void)setCornerLocationsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_cornerLocationsRect = &self->_cornerLocationsRect;
  if (!CGRectEqualToRect(a3, self->_cornerLocationsRect))
  {
    p_cornerLocationsRect->origin.CGFloat x = x;
    p_cornerLocationsRect->origin.CGFloat y = y;
    p_cornerLocationsRect->size.CGFloat width = width;
    p_cornerLocationsRect->size.CGFloat height = height;
    [(PHVideoCallVideoGroupView *)self centerPointForCurrentVideoGroupCorner];
    self->_target.CGFloat x = v9;
    self->_target.CGFloat y = v10;
  }
}

- (void)setCorner:(int64_t)a3
{
  self->_corner = a3;
  p_target = &self->_target;
  [(PHVideoCallVideoGroupView *)self centerPointForCurrentVideoGroupCorner];
  p_target->CGFloat x = v6;
  p_target->CGFloat y = v7;
  id v8 = [(PHVideoCallVideoGroupView *)self delegate];
  [v8 videoGroupView:self didUpdateCorner:a3];
}

- (CGPoint)centerPointForCurrentVideoGroupCorner
{
  [(PHVideoCallVideoGroupView *)self cornerLocationsRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PHVideoCallVideoGroupView *)self frame];
  double v12 = v11 * 0.5;
  [(PHVideoCallVideoGroupView *)self frame];
  double v14 = v13 * 0.5;
  int64_t corner = self->_corner;
  CGFloat v16 = v4;
  CGFloat v17 = v6;
  CGFloat v18 = v8;
  CGFloat v19 = v10;
  if (corner == 3)
  {
    double v20 = v12 + CGRectGetMinX(*(CGRect *)&v16);
LABEL_7:
    v24.origin.CGFloat x = v4;
    v24.origin.CGFloat y = v6;
    v24.size.CGFloat width = v8;
    v24.size.CGFloat height = v10;
    double v21 = CGRectGetMaxY(v24) - v14;
    goto LABEL_10;
  }
  if (corner == 2)
  {
    double v20 = CGRectGetMaxX(*(CGRect *)&v16) - v12;
    goto LABEL_7;
  }
  if (corner) {
    double v20 = CGRectGetMaxX(*(CGRect *)&v16) - v12;
  }
  else {
    double v20 = v12 + CGRectGetMinX(*(CGRect *)&v16);
  }
  v25.origin.CGFloat x = v4;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  double v21 = v14 + CGRectGetMinY(v25);
LABEL_10:
  double v22 = v20;
  result.CGFloat y = v21;
  result.CGFloat x = v22;
  return result;
}

- (void)refreshPositionInCorner
{
  if (!self->_displayLink)
  {
    [(PHVideoCallVideoGroupView *)self centerPointForCurrentVideoGroupCorner];
    -[PHVideoCallVideoGroupView setCenter:](self, "setCenter:");
  }
}

- (void)addPanningGestureRecognizer
{
  double v3 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"handlePanDetected:"];
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v3;

  [(PHVideoCallVideoGroupView *)self addGestureRecognizer:self->_panGestureRecognizer];
  double v5 = self->_panGestureRecognizer;

  [(UIPanGestureRecognizer *)v5 setDelegate:self];
}

- (void)handlePanGestureFinished:(id)a3
{
  id v4 = a3;
  double v5 = [(PHVideoCallVideoGroupView *)self superview];
  [v4 velocityInView:v5];
  double v7 = v6;
  double v9 = v8;

  [(PHVideoCallVideoGroupView *)self center];
  double v11 = v10;
  [(PHVideoCallVideoGroupView *)self transform];
  double v12 = v11 + v24 + v7 * 0.300000012;
  [(PHVideoCallVideoGroupView *)self center];
  double v14 = v13;
  [(PHVideoCallVideoGroupView *)self transform];
  double v15 = v14 + v23 + v9 * 0.300000012;
  self->_velocity.CGFloat x = v7 / 1000.0;
  self->_velocity.CGFloat y = v9 / 1000.0;
  CGFloat v16 = +[UIScreen mainScreen];
  [v16 _referenceBounds];
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = 3;
  if (v12 >= v18 * 0.5) {
    uint64_t v21 = 2;
  }
  if (v15 >= v20 * 0.5) {
    BOOL v22 = v21;
  }
  else {
    BOOL v22 = v12 >= v18 * 0.5;
  }
  [(PHVideoCallVideoGroupView *)self setCorner:v22];
  [(PHVideoCallVideoGroupView *)self startThrowAnimation];
}

- (void)handlePanDetected:(id)a3
{
  id v4 = a3;
  double v5 = (char *)[v4 state];
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == (char *)1)
    {
      [(PHVideoCallVideoGroupView *)self finishedThrowAnimation];
      double v9 = [(PHVideoCallVideoGroupView *)self superview];
      [v4 setTranslation:v9 inView:CGPointZero];

      double v10 = [(PHVideoCallVideoGroupView *)self delegate];
      [v10 videoGroupViewDidStartDrag:self];
    }
    else
    {
      double v11 = [(PHVideoCallVideoGroupView *)self superview];
      [v4 translationInView:v11];
      uint64_t v13 = v12;
      uint64_t v15 = v14;

      [(PHVideoCallVideoGroupView *)self transform];
      uint64_t v16 = v19[24];
      [(PHVideoCallVideoGroupView *)self transform];
      uint64_t v17 = v19[19];
      [(PHVideoCallVideoGroupView *)self transform];
      uint64_t v18 = v19[14];
      [(PHVideoCallVideoGroupView *)self transform];
      v19[0] = v16;
      v19[1] = v17;
      v19[2] = v18;
      v19[3] = v19[9];
      v19[4] = v13;
      v19[5] = v15;
      [(PHVideoCallVideoGroupView *)self setTransform:v19];
    }
  }
  else
  {
    [(PHVideoCallVideoGroupView *)self transformedCenter];
    -[PHVideoCallVideoGroupView setCenter:](self, "setCenter:");
    [(PHVideoCallVideoGroupView *)self transform];
    uint64_t v6 = v20[24];
    [(PHVideoCallVideoGroupView *)self transform];
    uint64_t v7 = v20[19];
    [(PHVideoCallVideoGroupView *)self transform];
    uint64_t v8 = v20[14];
    [(PHVideoCallVideoGroupView *)self transform];
    v20[0] = v6;
    v20[1] = v7;
    v20[2] = v8;
    v20[3] = v20[9];
    v20[4] = 0;
    v20[5] = 0;
    [(PHVideoCallVideoGroupView *)self setTransform:v20];
    [(PHVideoCallVideoGroupView *)self handlePanGestureFinished:v4];
  }
}

- (double)_gridViewRubberBandValueForValue:(double)result target:(double)a4 timeInterval:(double)a5 velocity:(double *)a6
{
  uint64_t v6 = (uint64_t)a5;
  double v7 = *a6;
  if (v6 >= 1)
  {
    do
    {
      double v7 = (v7 + (a4 - result) * 0.000140000004) * 0.980000019;
      CGPoint result = result + v7;
      --v6;
    }
    while (v6);
  }
  *a6 = v7;
  return result;
}

- (void)startThrowAnimation
{
  displayLink = self->_displayLink;
  if (displayLink) {
    [(CADisplayLink *)displayLink invalidate];
  }
  id v4 = +[CADisplayLink displayLinkWithTarget:self selector:"updateThrowAnimation:"];
  double v5 = self->_displayLink;
  self->_displayLink = v4;

  uint64_t v6 = self->_displayLink;
  id v7 = +[NSRunLoop mainRunLoop];
  [(CADisplayLink *)v6 addToRunLoop:v7 forMode:NSRunLoopCommonModes];
}

- (void)updateThrowAnimation:(id)a3
{
  id v18 = a3;
  if (!self->_startedThrowAnimation)
  {
    [v18 timestamp];
    qword_100325DF8 = v4;
    self->_startedThrowAnimation = 1;
  }
  [(PHVideoCallVideoGroupView *)self transformedCenter];
  double v6 = v5;
  double v8 = v7;
  p_target = &self->_target;
  UIDistanceBetweenPoints();
  if (v10 > 1.0 || fabs(self->_velocity.y) >= 0.00999999978 || fabs(self->_velocity.x) >= 0.00999999978)
  {
    [v18 timestamp];
    uint64_t v13 = *(void *)&v12;
    double v14 = (v12 - *(double *)&qword_100325DF8) * 1000.0;
    [(PHVideoCallVideoGroupView *)self _gridViewRubberBandValueForValue:&self->_velocity target:v6 timeInterval:p_target->x velocity:v14];
    double v16 = v15;
    [(PHVideoCallVideoGroupView *)self _gridViewRubberBandValueForValue:&self->_velocity.y target:v8 timeInterval:self->_target.y velocity:v14];
    -[PHVideoCallVideoGroupView setTransformForNewCenter:](self, "setTransformForNewCenter:", v16, v17);
    double v11 = v18;
    qword_100325DF8 = v13;
  }
  else
  {
    -[PHVideoCallVideoGroupView setTransformForNewCenter:](self, "setTransformForNewCenter:", p_target->x, self->_target.y);
    [(PHVideoCallVideoGroupView *)self finishedThrowAnimation];
    double v11 = v18;
  }
}

- (void)finishedThrowAnimation
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    uint64_t v4 = self->_displayLink;
    self->_displayLink = 0;
  }
  self->_startedThrowAnimation = 0;
  [(PHVideoCallVideoGroupView *)self transformedCenter];
  -[PHVideoCallVideoGroupView setCenter:](self, "setCenter:");
  [(PHVideoCallVideoGroupView *)self transform];
  uint64_t v5 = v8[24];
  [(PHVideoCallVideoGroupView *)self transform];
  uint64_t v6 = v8[19];
  [(PHVideoCallVideoGroupView *)self transform];
  uint64_t v7 = v8[14];
  [(PHVideoCallVideoGroupView *)self transform];
  v8[0] = v5;
  v8[1] = v6;
  v8[2] = v7;
  v8[3] = v8[9];
  v8[4] = 0;
  v8[5] = 0;
  [(PHVideoCallVideoGroupView *)self setTransform:v8];
  CNFSetAppIntegerForKey();
}

- (void)cancelThrowAnimation
{
  [(PHVideoCallVideoGroupView *)self removeGestureRecognizer:self->_panGestureRecognizer];
  if (self->_displayLink)
  {
    -[PHVideoCallVideoGroupView setTransformForNewCenter:](self, "setTransformForNewCenter:", self->_target.x, self->_target.y);
    [(PHVideoCallVideoGroupView *)self finishedThrowAnimation];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (CGRect)cornerLocationsRect
{
  double x = self->_cornerLocationsRect.origin.x;
  double y = self->_cornerLocationsRect.origin.y;
  double width = self->_cornerLocationsRect.size.width;
  double height = self->_cornerLocationsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PHVideoCallVideoGroupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHVideoCallVideoGroupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)corner
{
  return self->_corner;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
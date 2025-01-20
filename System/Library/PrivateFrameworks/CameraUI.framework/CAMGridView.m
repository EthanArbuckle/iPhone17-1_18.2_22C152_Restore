@interface CAMGridView
- (CAMGridView)initWithFrame:(CGRect)a3;
- (CAMLevelViewModel)levelViewModel;
- (CEKAdditiveAnimator)_animator;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_drawLinesWithInset:(float)a3;
- (void)_getDeltasBetweenLines:(double *)a3 widthDelta:(double *)a4;
- (void)_setAnimatorGridOffsetForViewModel:(id)a3 animated:(BOOL)a4;
- (void)drawRect:(CGRect)a3;
- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5;
- (void)setLevelViewModel:(id)a3;
- (void)set_animator:(id)a3;
@end

@implementation CAMGridView

- (CAMGridView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMGridView;
  v3 = -[CAMGridView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMGridView *)v3 setOpaque:0];
    [(CAMGridView *)v4 setContentMode:3];
    v5 = (CEKAdditiveAnimator *)objc_alloc_init(MEMORY[0x263F30668]);
    animator = v4->__animator;
    v4->__animator = v5;

    [(CEKAdditiveAnimator *)v4->__animator setDelegate:v4];
    [(CEKAdditiveAnimator *)v4->__animator setValue:@"CAMAnimatorGridHorizontalGapKey" forKey:0.0];
    [(CEKAdditiveAnimator *)v4->__animator setValue:@"CAMAnimatorGridVerticalGapKey" forKey:0.0];
  }
  return v4;
}

- (void)setLevelViewModel:(id)a3
{
  v5 = (CAMLevelViewModel *)a3;
  levelViewModel = self->_levelViewModel;
  v7 = v5;
  if (levelViewModel != v5)
  {
    [(CAMObservable *)levelViewModel unregisterChangeObserver:self context:0];
    objc_storeStrong((id *)&self->_levelViewModel, a3);
    [(CAMObservable *)self->_levelViewModel registerChangeObserver:self context:0];
    [(CAMGridView *)self _setAnimatorGridOffsetForViewModel:v7 animated:0];
  }
}

- (void)_getDeltasBetweenLines:(double *)a3 widthDelta:(double *)a4
{
  [(CAMGridView *)self bounds];
  UIRoundToViewScale();
  uint64_t v7 = v6;
  UIRoundToViewScale();
  *(void *)a3 = v7;
  *(void *)a4 = v8;
}

- (void)_setAnimatorGridOffsetForViewModel:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v22 = [(CAMGridView *)self _animator];
  HIDWORD(v10) = 1069757235;
  if (v4) {
    double v11 = 0.15;
  }
  else {
    double v11 = 0.0;
  }
  if (v4)
  {
    LODWORD(v10) = 1045220557;
    LODWORD(v8) = 1053609165;
    LODWORD(v9) = 1.0;
    LODWORD(v7) = 1045220557;
    v12 = [MEMORY[0x263F15808] functionWithControlPoints:v10 :v7 :v8 :v9];
  }
  else
  {
    v12 = 0;
  }
  [v6 currentIndicatorRotationAngle];
  double v14 = v13;
  [v6 currentIndicatorAlpha];
  if (v15 > 0.0 && v14 == 0.0) {
    double v17 = 5.0;
  }
  else {
    double v17 = 0.0;
  }
  uint64_t v18 = [v6 currentIndicatorMode];

  if (v18 == 2) {
    double v19 = v17;
  }
  else {
    double v19 = 0.0;
  }
  if (v18 == 3) {
    double v20 = v17;
  }
  else {
    double v20 = 0.0;
  }
  if (v18 == 3) {
    double v21 = 0.0;
  }
  else {
    double v21 = v19;
  }
  [v22 setValue:@"CAMAnimatorGridHorizontalGapKey" forKey:v12 duration:v20 timingCurve:v11];
  [v22 setValue:@"CAMAnimatorGridVerticalGapKey" forKey:v12 duration:v21 timingCurve:v11];
  if (!v4) {
    [(CAMGridView *)self setNeedsDisplay];
  }
}

- (void)_drawLinesWithInset:(float)a3
{
  [(CAMGridView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  [(CAMGridView *)self _getDeltasBetweenLines:&v42 widthDelta:&v41];
  double v38 = v12;
  double v39 = v10;
  double v36 = v8;
  double v40 = v8 + 0.0;
  double v13 = a3;
  double v37 = v6;
  double v14 = v6 + 0.0;
  char v15 = 1;
  do
  {
    char v16 = v15;
    UIRoundToViewScale();
    double v18 = v17;
    UIRoundToViewScale();
    double v20 = v19;
    double v21 = [(CAMGridView *)self _animator];
    [v21 valueForKey:@"CAMAnimatorGridVerticalGapKey"];
    double v23 = v22;

    v24 = [(CAMGridView *)self _animator];
    [v24 valueForKey:@"CAMAnimatorGridHorizontalGapKey"];
    double v26 = v25;

    CGFloat v27 = v40;
    double v28 = v40;
    double v29 = 0.0;
    if (v23 != 0.0)
    {
      UIRoundToViewScale();
      CGFloat v27 = v40;
      double v28 = v36 + v29;
    }
    double v30 = 0.0;
    CGFloat v31 = v20 + 0.0;
    CGFloat v32 = v38 - (v29 + 0.0);
    v43.size.width = 1.0;
    v43.origin.x = v31;
    v43.origin.y = v27;
    v43.size.height = v32;
    CGRect v44 = CGRectInset(v43, v13, 0.0);
    UIRectFill(v44);
    v45.size.width = 1.0;
    v45.origin.x = v31;
    v45.origin.y = v28;
    v45.size.height = v32;
    CGRect v46 = CGRectInset(v45, v13, 0.0);
    UIRectFill(v46);
    double v33 = v14;
    if (v26 != 0.0)
    {
      UIRoundToViewScale();
      double v30 = v34;
      double v33 = v37 + v34;
    }
    CGFloat v35 = v39 - (v30 + 0.0);
    v47.size.height = 1.0;
    v47.origin.x = v14;
    v47.origin.y = v18 + 0.0;
    v47.size.width = v35;
    CGRect v48 = CGRectInset(v47, 0.0, v13);
    UIRectFill(v48);
    v49.size.height = 1.0;
    v49.origin.x = v33;
    v49.origin.y = v18 + 0.0;
    v49.size.width = v35;
    CGRect v50 = CGRectInset(v49, 0.0, v13);
    UIRectFill(v50);
    char v15 = 0;
  }
  while ((v16 & 1) != 0);
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextBeginTransparencyLayer(CurrentContext, 0);
  double v5 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.150000006];
  [v5 set];

  double v6 = CAMPixelWidthForView(self);
  *(float *)&double v6 = v6;
  *(float *)&double v6 = -*(float *)&v6;
  [(CAMGridView *)self _drawLinesWithInset:v6];
  double v7 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.400000006];
  [v7 set];

  [(CAMGridView *)self _drawLinesWithInset:0.0];
  CGContextEndTransparencyLayer(CurrentContext);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CAMGridView;
  -[CAMGridView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (CAMGridView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    double v5 = 0;
  }
  return v5;
}

- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5
{
  if (!a5 && (a4 & 0x15) != 0) {
    [(CAMGridView *)self _setAnimatorGridOffsetForViewModel:a3 animated:1];
  }
}

- (CAMLevelViewModel)levelViewModel
{
  return self->_levelViewModel;
}

- (CEKAdditiveAnimator)_animator
{
  return self->__animator;
}

- (void)set_animator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->_levelViewModel, 0);
}

@end
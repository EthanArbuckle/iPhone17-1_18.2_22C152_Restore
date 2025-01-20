@interface BKUIPearlPositioningGuideView
- (BKUIPearlPositioningGuideView)initWithFrame:(CGRect)a3;
- (BOOL)inSheet;
- (BOOL)needsMaskedNeedsPositionStyleEnrollment;
- (CAShapeLayer)roundedRectMaskLayer;
- (CGPoint)portalCenter;
- (CGPoint)startPortalCenter;
- (CGPoint)targetPortalCenter;
- (NSDate)animationStart;
- (double)_maxDistance;
- (double)_minDistance;
- (double)_updatedFloatWithTarget:(double)a3 current:(double)a4 start:(double)a5 progress:(double)a6;
- (double)animationDuration;
- (double)cornerRadius;
- (double)edgeDistance;
- (double)lastAnimationTickProgres;
- (double)lineAlpha;
- (double)lineWidth;
- (double)maximumMaskLayerDistanceFromCenter;
- (double)minimumMaskLayerDistanceFromCenter;
- (double)postCornerLength;
- (double)ringRadius;
- (double)startCornerRadius;
- (double)startEdgeDistance;
- (double)startLineAlpha;
- (double)startLineWidth;
- (double)startPostCornerLength;
- (double)targetCornerRadius;
- (double)targetEdgeDistance;
- (double)targetLineAlpha;
- (double)targetLineWidth;
- (double)targetPostCornerLength;
- (id)_roundedRectMaskForMaskDistance:(double)a3 portalCenter:(CGPoint)a4 cornerRadius:(double)a5;
- (id)animationCompletion;
- (int64_t)animationCurve;
- (void)_displayTick;
- (void)_startAnimationWithDuration:(double)a3 completion:(id)a4;
- (void)_startDisplay;
- (void)_stopDisplay;
- (void)_updateTargetValuesForAnimation:(int64_t)a3 animationCurve:(int64_t)a4;
- (void)animateToBreatheOutValuesOverDuration:(double)a3 completion:(id)a4;
- (void)animateToFinishedValuesOverDuration:(double)a3 center:(CGPoint)a4 completion:(id)a5;
- (void)animateToOpenValuesOverDuration:(double)a3 curve:(int64_t)a4 completion:(id)a5;
- (void)animateToPopOutValuesOverDuration:(double)a3 completion:(id)a4;
- (void)breathe;
- (void)drawRect:(CGRect)a3;
- (void)prepareMaskLayerForReducedMotionOpenTransition;
- (void)prepareMaskLayerForStartToOpenTransition;
- (void)resetValuesToStart;
- (void)setAnimationCompletion:(id)a3;
- (void)setAnimationCurve:(int64_t)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationStart:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEdgeDistance:(double)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInSheet:(BOOL)a3;
- (void)setLastAnimationTickProgres:(double)a3;
- (void)setLineAlpha:(double)a3;
- (void)setLineWidth:(double)a3;
- (void)setPortalCenter:(CGPoint)a3;
- (void)setPostCornerLength:(double)a3;
- (void)setRingRadius:(double)a3;
- (void)setRoundedRectMaskLayer:(id)a3;
- (void)setStartCornerRadius:(double)a3;
- (void)setStartEdgeDistance:(double)a3;
- (void)setStartLineAlpha:(double)a3;
- (void)setStartLineWidth:(double)a3;
- (void)setStartPortalCenter:(CGPoint)a3;
- (void)setStartPostCornerLength:(double)a3;
- (void)setTargetCornerRadius:(double)a3;
- (void)setTargetEdgeDistance:(double)a3;
- (void)setTargetLineAlpha:(double)a3;
- (void)setTargetLineWidth:(double)a3;
- (void)setTargetPortalCenter:(CGPoint)a3;
- (void)setTargetPostCornerLength:(double)a3;
@end

@implementation BKUIPearlPositioningGuideView

- (BKUIPearlPositioningGuideView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlPositioningGuideView;
  v3 = -[BKUIPearlPositioningGuideView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKUIPearlPositioningGuideView *)v3 setOpaque:0];
    [(BKUIPearlPositioningGuideView *)v4 setHidden:1];
    [(BKUIPearlPositioningGuideView *)v4 center];
    -[BKUIPearlPositioningGuideView setPortalCenter:](v4, "setPortalCenter:");
    v4->_startMaskFromCenter = 0;
  }
  return v4;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKUIPearlPositioningGuideView *)self isHidden] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKUIPearlPositioningGuideView;
    [(BKUIPearlPositioningGuideView *)&v5 setHidden:v3];
    if (v3) {
      [(BKUIPearlPositioningGuideView *)self _stopDisplay];
    }
    else {
      [(BKUIPearlPositioningGuideView *)self _startDisplay];
    }
  }
}

- (void)_startDisplay
{
}

- (void)_stopDisplay
{
  [(BKUIPearlPositioningGuideView *)self setAnimationCompletion:0];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)resetValuesToStart
{
  [(BKUIPearlPositioningGuideView *)self setLineWidth:4.33333333];
  [(BKUIPearlPositioningGuideView *)self bounds];
  double v4 = v3 * 0.5;
  [(BKUIPearlPositioningGuideView *)self lineWidth];
  [(BKUIPearlPositioningGuideView *)self setEdgeDistance:v4 - v5];
  [(BKUIPearlPositioningGuideView *)self setCornerRadius:17.6666667];
  [(BKUIPearlPositioningGuideView *)self setPostCornerLength:19.0];
  [(BKUIPearlPositioningGuideView *)self setLineAlpha:0.0];
  [(BKUIPearlPositioningGuideView *)self center];
  -[BKUIPearlPositioningGuideView setPortalCenter:](self, "setPortalCenter:");

  [(BKUIPearlPositioningGuideView *)self setNeedsDisplay];
}

- (void)_startAnimationWithDuration:(double)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(id, void))a4;
  if ([(BKUIPearlPositioningGuideView *)self isHidden])
  {
    if (v6) {
      v6[2](v6, 0);
    }
  }
  else if (UIAccessibilityIsReduceMotionEnabled())
  {
    [(BKUIPearlPositioningGuideView *)self alpha];
    uint64_t v7 = MEMORY[0x1E4F42FF0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke;
    v17[3] = &unk_1E6EA20C0;
    v17[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_2;
    v14[3] = &unk_1E6EA2A78;
    v14[4] = self;
    uint64_t v16 = v8;
    v15 = v6;
    +[UIView bkui_animateWithDuration:animations:completion:](0.2, v7, v17, v14);
  }
  else
  {
    self->_animationDuration = a3;
    self->_lastAnimationTickProgres = 0.0;
    v9 = [MEMORY[0x1E4F1C9C8] date];
    animationStart = self->_animationStart;
    self->_animationStart = v9;

    self->_startLineWidth = self->_lineWidth;
    self->_startEdgeDistance = self->_edgeDistance;
    self->_startCornerRadius = self->_cornerRadius;
    self->_startPostCornerLength = self->_postCornerLength;
    self->_startLineAlpha = self->_lineAlpha;
    self->_startPortalCenter = self->_portalCenter;
    v11 = [(BKUIPearlPositioningGuideView *)self animationCompletion];

    if (v11)
    {
      v12 = [(BKUIPearlPositioningGuideView *)self animationCompletion];
      v12[2](v12, 0);
    }
    v13 = (void *)[v6 copy];
    [(BKUIPearlPositioningGuideView *)self setAnimationCompletion:v13];
  }
}

uint64_t __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_2(id *a1)
{
  *((void *)a1[4] + 61) = 0;
  *((void *)a1[4] + 74) = 0;
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  double v3 = a1[4];
  double v4 = (void *)v3[60];
  v3[60] = v2;

  objc_initWeak(&location, a1[4]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_3;
  v5[3] = &unk_1E6EA2A50;
  objc_copyWeak(v7, &location);
  v7[1] = a1[6];
  id v6 = a1[5];
  [a1[4] setAnimationCompletion:v5];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_3(id *a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = MEMORY[0x1E4F42FF0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_4;
    v7[3] = &unk_1E6EA2A00;
    objc_copyWeak(v8, a1 + 5);
    v8[1] = a1[6];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_5;
    v4[3] = &unk_1E6EA2A28;
    id v5 = a1[4];
    char v6 = 1;
    +[UIView bkui_animateWithDuration:animations:completion:](0.2, v3, v7, v4);

    objc_destroyWeak(v8);
  }
}

void __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlpha:*(double *)(a1 + 40)];
}

uint64_t __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)_updateTargetValuesForAnimation:(int64_t)a3 animationCurve:(int64_t)a4
{
  uint64_t v37 = v6;
  uint64_t v38 = v5;
  uint64_t v39 = v4;
  switch(a3)
  {
    case 0:
      self->_targetLineWidth = 4.33333333;
      self->_targetEdgeDistance = 128.0;
      self->_targetCornerRadius = 14.0;
      self->_targetPostCornerLength = 24.0;
      self->_targetLineAlpha = 1.0;
      p_targetPortalCenter = &self->_targetPortalCenter;
      [(BKUIPearlPositioningGuideView *)self center];
      p_targetPortalCenter->x = v17;
      self->_targetPortalCenter.y = v18;
      self->_animationCurve = a4;
      v19 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v20 = [v19 userInterfaceIdiom];

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        self->_targetLineWidth = 6.0;
        [(BKUIPearlPositioningGuideView *)self _minDistance];
        goto LABEL_11;
      }
      break;
    case 1:
      self->_targetLineWidth = 4.33333333;
      self->_targetEdgeDistance = 132.0;
      self->_targetCornerRadius = 14.0;
      self->_targetPostCornerLength = 24.0;
      self->_targetLineAlpha = 1.0;
      v32 = &self->_targetPortalCenter;
      [(BKUIPearlPositioningGuideView *)self center];
      v32->x = v33;
      self->_targetPortalCenter.y = v34;
      self->_animationCurve = a4;
      v35 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v36 = [v35 userInterfaceIdiom];

      if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        self->_targetLineWidth = 6.0;
        [(BKUIPearlPositioningGuideView *)self _maxDistance];
LABEL_11:
        self->_targetEdgeDistance = v21 - self->_targetLineWidth * 0.5;
        self->_targetCornerRadius = 30.0 - self->_targetLineWidth * 0.5;
        goto LABEL_12;
      }
      break;
    case 2:
      self->_targetLineWidth = 4.33333333;
      self->_targetEdgeDistance = 142.0;
      self->_targetCornerRadius = 14.0;
      self->_targetPostCornerLength = 24.0;
      self->_targetLineAlpha = 1.0;
      v22 = &self->_targetPortalCenter;
      [(BKUIPearlPositioningGuideView *)self center];
      v22->x = v23;
      self->_targetPortalCenter.y = v24;
      self->_animationCurve = a4;
      v25 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v26 = [v25 userInterfaceIdiom];

      if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        self->_targetLineWidth = 6.0;
        [(BKUIPearlPositioningGuideView *)self _maxDistance];
        self->_targetEdgeDistance = v27 + self->_targetLineWidth * -0.5;
        self->_targetCornerRadius = 28.0;
LABEL_12:
        self->_targetPostCornerLength = 26.0;
      }
      break;
    case 3:
      self->_targetLineWidth = 3.5;
      v28 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v29 = [v28 userInterfaceIdiom];

      if ((v29 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        self->_targetLineWidth = 6.0;
      }
      [(BKUIPearlPositioningGuideView *)self ringRadius];
      double v31 = v30 + self->_targetLineWidth * 0.5;
      self->_targetEdgeDistance = v31;
      self->_targetCornerRadius = v31;
      self->_targetPostCornerLength = 0.0;
      self->_targetLineAlpha = 0.85;
      break;
    default:
      return;
  }
}

- (void)animateToOpenValuesOverDuration:(double)a3 curve:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  [(BKUIPearlPositioningGuideView *)self _updateTargetValuesForAnimation:0 animationCurve:a4];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__BKUIPearlPositioningGuideView_animateToOpenValuesOverDuration_curve_completion___block_invoke;
  v10[3] = &unk_1E6EA2AA0;
  objc_copyWeak(&v12, &location);
  id v9 = v8;
  id v11 = v9;
  [(BKUIPearlPositioningGuideView *)self _startAnimationWithDuration:v10 completion:a3];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

uint64_t __82__BKUIPearlPositioningGuideView_animateToOpenValuesOverDuration_curve_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  *((unsigned char *)objc_loadWeakRetained((id *)(a1 + 40)) + 416) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }

  return MEMORY[0x1F41817F8]();
}

- (void)animateToBreatheOutValuesOverDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(BKUIPearlPositioningGuideView *)self _updateTargetValuesForAnimation:1 animationCurve:0];
  [(BKUIPearlPositioningGuideView *)self _startAnimationWithDuration:v6 completion:a3];
}

- (void)animateToPopOutValuesOverDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(BKUIPearlPositioningGuideView *)self _updateTargetValuesForAnimation:2 animationCurve:1];
  [(BKUIPearlPositioningGuideView *)self _startAnimationWithDuration:v6 completion:a3];
}

- (double)minimumMaskLayerDistanceFromCenter
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0.0;
  }

  [(BKUIPearlPositioningGuideView *)self _minDistance];
  return result;
}

- (double)maximumMaskLayerDistanceFromCenter
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0.0;
  }

  [(BKUIPearlPositioningGuideView *)self _maxDistance];
  return result;
}

- (void)breathe
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__BKUIPearlPositioningGuideView_breathe__block_invoke;
  v2[3] = &unk_1E6EA2108;
  v2[4] = self;
  [(BKUIPearlPositioningGuideView *)self animateToBreatheOutValuesOverDuration:v2 completion:1.5];
}

uint64_t __40__BKUIPearlPositioningGuideView_breathe__block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(result + 32);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __40__BKUIPearlPositioningGuideView_breathe__block_invoke_2;
    v3[3] = &unk_1E6EA2108;
    v3[4] = v2;
    return [v2 animateToOpenValuesOverDuration:0 curve:v3 completion:1.5];
  }
  return result;
}

uint64_t __40__BKUIPearlPositioningGuideView_breathe__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) breathe];
  }
  return result;
}

- (void)animateToFinishedValuesOverDuration:(double)a3 center:(CGPoint)a4 completion:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a5;
  [(BKUIPearlPositioningGuideView *)self _updateTargetValuesForAnimation:3 animationCurve:[(BKUIPearlPositioningGuideView *)self animationCurve]];
  self->_targetPortalCenter.CGFloat x = x;
  self->_targetPortalCenter.CGFloat y = y;
  [(BKUIPearlPositioningGuideView *)self _startAnimationWithDuration:v9 completion:a3];
}

- (id)_roundedRectMaskForMaskDistance:(double)a3 portalCenter:(CGPoint)a4 cornerRadius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = (void *)MEMORY[0x1E4F427D0];
  [(BKUIPearlPositioningGuideView *)self bounds];
  uint64_t v10 = objc_msgSend(v9, "bezierPathWithRect:");
  id v11 = objc_msgSend(MEMORY[0x1E4F427D0], "_bezierPathWithArcRoundedRect:cornerRadius:", x - a3, y - a3, a3 + a3, a3 + a3, a5);
  [v10 appendPath:v11];

  return v10;
}

- (void)prepareMaskLayerForStartToOpenTransition
{
  if ([(BKUIPearlPositioningGuideView *)self needsMaskedNeedsPositionStyleEnrollment])
  {
    uint64_t v3 = [(BKUIPearlPositioningGuideView *)self roundedRectMaskLayer];

    if (v3)
    {
      [(BKUIPearlPositioningGuideView *)self portalCenter];
      id v6 = -[BKUIPearlPositioningGuideView _roundedRectMaskForMaskDistance:portalCenter:cornerRadius:](self, "_roundedRectMaskForMaskDistance:portalCenter:cornerRadius:", 0.0, v4, v5, 0.0);
      uint64_t v7 = [(BKUIPearlPositioningGuideView *)self roundedRectMaskLayer];
      id v8 = v6;
      objc_msgSend(v7, "setPath:", objc_msgSend(v8, "CGPath"));

      self->_startMaskFromCenter = 1;
    }
  }
}

- (void)prepareMaskLayerForReducedMotionOpenTransition
{
  if ([(BKUIPearlPositioningGuideView *)self needsMaskedNeedsPositionStyleEnrollment])
  {
    uint64_t v3 = [(BKUIPearlPositioningGuideView *)self roundedRectMaskLayer];

    if (v3)
    {
      [(BKUIPearlPositioningGuideView *)self _minDistance];
      double v5 = v4;
      [(BKUIPearlPositioningGuideView *)self portalCenter];
      id v8 = -[BKUIPearlPositioningGuideView _roundedRectMaskForMaskDistance:portalCenter:cornerRadius:](self, "_roundedRectMaskForMaskDistance:portalCenter:cornerRadius:", v5, v6, v7, 30.0);
      id v9 = [(BKUIPearlPositioningGuideView *)self roundedRectMaskLayer];
      id v10 = v8;
      objc_msgSend(v9, "setPath:", objc_msgSend(v10, "CGPath"));
    }
  }
}

- (double)_updatedFloatWithTarget:(double)a3 current:(double)a4 start:(double)a5 progress:(double)a6
{
  int64_t animationCurve = self->_animationCurve;
  switch(animationCurve)
  {
    case 0:
      double v9 = timingEaseInOut_block_invoke(a6);
      goto LABEL_7;
    case 2:
      double v9 = timingEaseOut_block_invoke_2(a6);
      goto LABEL_7;
    case 1:
      double v9 = timingEaseIn_block_invoke_3(a6);
LABEL_7:
      a6 = v9;
      break;
  }
  return a5 + (a3 - a5) * a6;
}

- (void)_displayTick
{
  if (self->_animationStart)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:self->_animationStart];
    double v5 = v4;

    [(BKUIPearlPositioningGuideView *)self animationDuration];
    if (v6 <= 0.0
      || ([(BKUIPearlPositioningGuideView *)self animationDuration], double v8 = v5 / v7, v8 >= 1.0))
    {
      animationStart = self->_animationStart;
      self->_animationStart = 0;

      double v8 = 1.0;
    }
    double targetLineWidth = self->_targetLineWidth;
    [(BKUIPearlPositioningGuideView *)self lineWidth];
    [(BKUIPearlPositioningGuideView *)self _updatedFloatWithTarget:targetLineWidth current:v11 start:self->_startLineWidth progress:v8];
    -[BKUIPearlPositioningGuideView setLineWidth:](self, "setLineWidth:");
    double targetEdgeDistance = self->_targetEdgeDistance;
    [(BKUIPearlPositioningGuideView *)self edgeDistance];
    [(BKUIPearlPositioningGuideView *)self _updatedFloatWithTarget:targetEdgeDistance current:v13 start:self->_startEdgeDistance progress:v8];
    -[BKUIPearlPositioningGuideView setEdgeDistance:](self, "setEdgeDistance:");
    double targetCornerRadius = self->_targetCornerRadius;
    [(BKUIPearlPositioningGuideView *)self cornerRadius];
    [(BKUIPearlPositioningGuideView *)self _updatedFloatWithTarget:targetCornerRadius current:v15 start:self->_startCornerRadius progress:v8];
    -[BKUIPearlPositioningGuideView setCornerRadius:](self, "setCornerRadius:");
    double targetPostCornerLength = self->_targetPostCornerLength;
    [(BKUIPearlPositioningGuideView *)self postCornerLength];
    [(BKUIPearlPositioningGuideView *)self _updatedFloatWithTarget:targetPostCornerLength current:v17 start:self->_startPostCornerLength progress:v8];
    -[BKUIPearlPositioningGuideView setPostCornerLength:](self, "setPostCornerLength:");
    double targetLineAlpha = self->_targetLineAlpha;
    [(BKUIPearlPositioningGuideView *)self lineAlpha];
    [(BKUIPearlPositioningGuideView *)self _updatedFloatWithTarget:targetLineAlpha current:v19 start:self->_startLineAlpha progress:v8];
    -[BKUIPearlPositioningGuideView setLineAlpha:](self, "setLineAlpha:");
    double x = self->_targetPortalCenter.x;
    [(BKUIPearlPositioningGuideView *)self portalCenter];
    [(BKUIPearlPositioningGuideView *)self _updatedFloatWithTarget:x current:v21 start:self->_startPortalCenter.x progress:v8];
    double v23 = v22;
    double y = self->_targetPortalCenter.y;
    [(BKUIPearlPositioningGuideView *)self portalCenter];
    -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", y);
    -[BKUIPearlPositioningGuideView setPortalCenter:](self, "setPortalCenter:", v23, v25);
    if ([(BKUIPearlPositioningGuideView *)self needsMaskedNeedsPositionStyleEnrollment])
    {
      uint64_t v26 = [(BKUIPearlPositioningGuideView *)self roundedRectMaskLayer];

      if (v26)
      {
        if (self->_startMaskFromCenter) {
          [(BKUIPearlPositioningGuideView *)self _updatedFloatWithTarget:self->_targetEdgeDistance current:0.0 start:0.0 progress:v8];
        }
        else {
          [(BKUIPearlPositioningGuideView *)self edgeDistance];
        }
        double v28 = v27;
        [(BKUIPearlPositioningGuideView *)self lineWidth];
        double v30 = v28 + v29 * 0.5;
        [(BKUIPearlPositioningGuideView *)self cornerRadius];
        double v32 = v31;
        [(BKUIPearlPositioningGuideView *)self lineWidth];
        double v34 = v32 + v33 * 0.5;
        [(BKUIPearlPositioningGuideView *)self portalCenter];
        uint64_t v37 = -[BKUIPearlPositioningGuideView _roundedRectMaskForMaskDistance:portalCenter:cornerRadius:](self, "_roundedRectMaskForMaskDistance:portalCenter:cornerRadius:", v30, v35, v36, v34);
        uint64_t v38 = [(BKUIPearlPositioningGuideView *)self roundedRectMaskLayer];
        id v39 = v37;
        objc_msgSend(v38, "setPath:", objc_msgSend(v39, "CGPath"));
      }
    }
    self->_lastAnimationTickProgres = v8;
    [(BKUIPearlPositioningGuideView *)self _updateChildrenValuesForDisplayTickProgress:v8];
    [(BKUIPearlPositioningGuideView *)self setNeedsDisplay];
    if (v8 >= 1.0)
    {
      v40 = [(BKUIPearlPositioningGuideView *)self animationCompletion];

      if (v40)
      {
        v41 = [(BKUIPearlPositioningGuideView *)self animationCompletion];
        [(BKUIPearlPositioningGuideView *)self setAnimationCompletion:0];
        v41[2](v41, 1);
      }
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  [(BKUIPearlPositioningGuideView *)self portalCenter];
  double v5 = v4;
  double v7 = v6;
  id v30 = [MEMORY[0x1E4F427D0] bezierPath];
  [(BKUIPearlPositioningGuideView *)self edgeDistance];
  double v9 = v8;
  [(BKUIPearlPositioningGuideView *)self cornerRadius];
  double v11 = v10;
  [(BKUIPearlPositioningGuideView *)self postCornerLength];
  double v13 = v12;
  [(BKUIPearlPositioningGuideView *)self lineWidth];
  double v28 = v5 + v9;
  double v29 = v14;
  double v15 = v7 + v9 - v11 - v13;
  objc_msgSend(v30, "moveToPoint:", v5 + v9, v15);
  objc_msgSend(v30, "addLineToPoint:", v5 + v9, v13 + v15);
  double v27 = v5 + v9 - v11;
  [v30 addArcWithCenter:1 radius:v27 startAngle:v13 + v15 endAngle:v11 clockwise:0.0];
  double v26 = v27 - v13;
  objc_msgSend(v30, "addLineToPoint:");
  double v16 = v5 - v9;
  double v25 = v16 + v11 + v13;
  objc_msgSend(v30, "moveToPoint:");
  objc_msgSend(v30, "addLineToPoint:", v16 + v11, v7 + v9);
  objc_msgSend(v30, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16 + v11, v7 + v9 - v11, v11, 1.57079633, 3.14159265);
  objc_msgSend(v30, "addLineToPoint:", v16, v7 + v9 - v11 - v13);
  double v17 = v7 - v9;
  double v18 = v17 + v11 + v13;
  objc_msgSend(v30, "moveToPoint:", v16, v18);
  objc_msgSend(v30, "addLineToPoint:", v16, v17 + v11);
  objc_msgSend(v30, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16 + v11, v17 + v11, v11, 3.14159265, 4.71238898);
  objc_msgSend(v30, "addLineToPoint:", v25, v17);
  objc_msgSend(v30, "moveToPoint:", v26, v17);
  objc_msgSend(v30, "addLineToPoint:", v27, v17);
  objc_msgSend(v30, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, v17 + v11, v11, 4.71238898, 0.0);
  objc_msgSend(v30, "addLineToPoint:", v28, v18);
  [v30 setLineCapStyle:1];
  [v30 setLineWidth:v29 + 1.0];
  double v19 = (void *)MEMORY[0x1E4F428B8];
  [(BKUIPearlPositioningGuideView *)self lineAlpha];
  double v21 = [v19 colorWithWhite:0.0 alpha:v20 * 0.25];
  [v21 setStroke];

  [v30 stroke];
  [v30 setLineWidth:v29];
  double v22 = (void *)MEMORY[0x1E4F428B8];
  [(BKUIPearlPositioningGuideView *)self lineAlpha];
  CGFloat v24 = [v22 colorWithWhite:1.0 alpha:v23];
  [v24 setStroke];

  [v30 stroke];
}

- (BOOL)needsMaskedNeedsPositionStyleEnrollment
{
  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (double)_maxDistance
{
  BOOL v2 = [(BKUIPearlPositioningGuideView *)self inSheet];
  double result = 246.0;
  if (v2) {
    return 209.1;
  }
  return result;
}

- (double)_minDistance
{
  BOOL v2 = [(BKUIPearlPositioningGuideView *)self inSheet];
  double result = 198.0;
  if (v2) {
    return 168.3;
  }
  return result;
}

- (CAShapeLayer)roundedRectMaskLayer
{
  return self->_roundedRectMaskLayer;
}

- (void)setRoundedRectMaskLayer:(id)a3
{
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (double)edgeDistance
{
  return self->_edgeDistance;
}

- (void)setEdgeDistance:(double)a3
{
  self->_edgeDistance = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)postCornerLength
{
  return self->_postCornerLength;
}

- (void)setPostCornerLength:(double)a3
{
  self->_postCornerLength = a3;
}

- (double)lineAlpha
{
  return self->_lineAlpha;
}

- (void)setLineAlpha:(double)a3
{
  self->_lineAlpha = a3;
}

- (double)ringRadius
{
  return self->_ringRadius;
}

- (void)setRingRadius:(double)a3
{
  self->_ringRadius = a3;
}

- (CGPoint)portalCenter
{
  double x = self->_portalCenter.x;
  double y = self->_portalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPortalCenter:(CGPoint)a3
{
  self->_portalCenter = a3;
}

- (NSDate)animationStart
{
  return self->_animationStart;
}

- (void)setAnimationStart:(id)a3
{
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (int64_t)animationCurve
{
  return self->_animationCurve;
}

- (void)setAnimationCurve:(int64_t)a3
{
  self->_int64_t animationCurve = a3;
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (double)startLineWidth
{
  return self->_startLineWidth;
}

- (void)setStartLineWidth:(double)a3
{
  self->_startLineWidth = a3;
}

- (double)startEdgeDistance
{
  return self->_startEdgeDistance;
}

- (void)setStartEdgeDistance:(double)a3
{
  self->_startEdgeDistance = a3;
}

- (double)startCornerRadius
{
  return self->_startCornerRadius;
}

- (void)setStartCornerRadius:(double)a3
{
  self->_startCornerRadius = a3;
}

- (double)startPostCornerLength
{
  return self->_startPostCornerLength;
}

- (void)setStartPostCornerLength:(double)a3
{
  self->_startPostCornerLength = a3;
}

- (double)startLineAlpha
{
  return self->_startLineAlpha;
}

- (void)setStartLineAlpha:(double)a3
{
  self->_startLineAlpha = a3;
}

- (CGPoint)startPortalCenter
{
  double x = self->_startPortalCenter.x;
  double y = self->_startPortalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPortalCenter:(CGPoint)a3
{
  self->_startPortalCenter = a3;
}

- (double)targetLineWidth
{
  return self->_targetLineWidth;
}

- (void)setTargetLineWidth:(double)a3
{
  self->_double targetLineWidth = a3;
}

- (double)targetEdgeDistance
{
  return self->_targetEdgeDistance;
}

- (void)setTargetEdgeDistance:(double)a3
{
  self->_double targetEdgeDistance = a3;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (void)setTargetCornerRadius:(double)a3
{
  self->_double targetCornerRadius = a3;
}

- (double)targetPostCornerLength
{
  return self->_targetPostCornerLength;
}

- (void)setTargetPostCornerLength:(double)a3
{
  self->_double targetPostCornerLength = a3;
}

- (double)targetLineAlpha
{
  return self->_targetLineAlpha;
}

- (void)setTargetLineAlpha:(double)a3
{
  self->_double targetLineAlpha = a3;
}

- (CGPoint)targetPortalCenter
{
  double x = self->_targetPortalCenter.x;
  double y = self->_targetPortalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTargetPortalCenter:(CGPoint)a3
{
  self->_targetPortalCenter = a3;
}

- (double)lastAnimationTickProgres
{
  return self->_lastAnimationTickProgres;
}

- (void)setLastAnimationTickProgres:(double)a3
{
  self->_lastAnimationTickProgres = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_animationStart, 0);
  objc_storeStrong((id *)&self->_roundedRectMaskLayer, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
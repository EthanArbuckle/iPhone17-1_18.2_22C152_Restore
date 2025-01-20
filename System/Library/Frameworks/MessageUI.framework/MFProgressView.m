@interface MFProgressView
+ (id)progressViewWithDefaultStyleStrokeAndRect;
- (BOOL)_isValidCenter:(CGPoint)a3 radius:(double)a4 rect:(CGRect)a5;
- (CGSize)intrinsicContentSize;
- (MFProgressView)initWithProgressViewStyle:(int64_t)a3 stroke:(double)a4 frame:(CGRect)a5;
- (MFProgressViewDelegate)delegate;
- (UIColor)tintColor;
- (void)_adjustProgress;
- (void)_drawCircleWithCenter:(CGPoint)a3 radius:(double)a4;
- (void)_drawProgressInRect:(CGRect)a3;
- (void)_drawWedgeWithCenter:(CGPoint)a3 radius:(double)a4;
- (void)_invalidateDisplayLink;
- (void)_invalidateSimulationTimer;
- (void)_onDisplayLink:(id)a3;
- (void)_stopSimulationIfCompleted;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)progressDidFinish;
- (void)setDelegate:(id)a3;
- (void)setProgress:(double)a3;
- (void)setTintColor:(id)a3;
- (void)simulateActivity;
@end

@implementation MFProgressView

+ (id)progressViewWithDefaultStyleStrokeAndRect
{
  v2 = [MFProgressView alloc];
  UIRoundToViewScale();
  double v4 = v3;
  UIRoundToViewScale();
  v6 = -[MFProgressView initWithProgressViewStyle:stroke:frame:](v2, "initWithProgressViewStyle:stroke:frame:", 0, 3.0, 0.0, 0.0, v4, v5);

  return v6;
}

- (MFProgressView)initWithProgressViewStyle:(int64_t)a3 stroke:(double)a4 frame:(CGRect)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MFProgressView;
  v6 = -[MFProgressView initWithFrame:](&v12, sel_initWithFrame_, a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_stroke = a4;
    v8 = [MEMORY[0x1E4FB1618] colorWithRed:0.870000005 green:0.870000005 blue:0.870000005 alpha:1.0];
    [(MFProgressView *)v7 setTintColor:v8];

    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(MFProgressView *)v7 setBackgroundColor:v9];

    [(MFProgressView *)v7 bounds];
    -[MFProgressView setBounds:](v7, "setBounds:");
    [(MFProgressView *)v7 bounds];
    v7->_diameter = CGRectGetWidth(v13);
    v10 = v7;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double diameter = self->_diameter;
  double v3 = diameter;
  result.height = v3;
  result.width = diameter;
  return result;
}

- (void)dealloc
{
  [(MFProgressView *)self _invalidateDisplayLink];
  [(MFProgressView *)self _invalidateSimulationTimer];
  v3.receiver = self;
  v3.super_class = (Class)MFProgressView;
  [(MFProgressView *)&v3 dealloc];
}

- (void)_invalidateDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)setProgress:(double)a3
{
  double v4 = self->_targetProgress - a3;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  if (v4 >= 0.00000011920929)
  {
    if (!self->_displayLink)
    {
      v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__onDisplayLink_];
      displayLink = self->_displayLink;
      self->_displayLink = v6;

      v8 = self->_displayLink;
      CAFrameRateRange v11 = CAFrameRateRangeMake(30.0, 120.0, 0.0);
      -[CADisplayLink setPreferredFrameRateRange:](v8, "setPreferredFrameRateRange:", *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);

      v9 = self->_displayLink;
      v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v9 addToRunLoop:v10 forMode:*MEMORY[0x1E4F1C4B0]];
    }
    self->_targetProgress = a3;
  }
}

- (void)progressDidFinish
{
  self->_targetProgress = 0.0;
  self->_displayedProgress = 0.0;
  [(MFProgressView *)self _invalidateDisplayLink];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained progressViewCanBeRemoved:self];
}

- (void)simulateActivity
{
  if (self->_simulateActivityTimer)
  {
    double v3 = self->_targetProgress + 0.1;
    [(MFProgressView *)self setProgress:v3];
  }
  else
  {
    double v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_simulateActivity selector:0 userInfo:1 repeats:1.0];
    simulateActivityTimer = self->_simulateActivityTimer;
    self->_simulateActivityTimer = v4;
  }
}

- (void)_invalidateSimulationTimer
{
  [(NSTimer *)self->_simulateActivityTimer invalidate];
  simulateActivityTimer = self->_simulateActivityTimer;
  self->_simulateActivityTimer = 0;
}

- (void)_onDisplayLink:(id)a3
{
  [(MFProgressView *)self bounds];

  -[MFProgressView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFProgressView *)self _adjustProgress];

  -[MFProgressView _drawProgressInRect:](self, "_drawProgressInRect:", x, y, width, height);
}

- (void)_adjustProgress
{
  double targetProgress = self->_targetProgress;
  if (targetProgress >= 0.999999881)
  {
    self->_double displayedProgress = 1.0;
  }
  else
  {
    double displayedProgress = self->_displayedProgress;
    double v5 = self->_displayLink;
    if (displayedProgress <= targetProgress)
    {
      CAFrameRateRange v8 = CAFrameRateRangeMake(30.0, 120.0, 0.0);
      -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);

      self->_double displayedProgress = self->_displayedProgress + 0.02;
    }
    else
    {
      CAFrameRateRange v7 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
      -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
    }
  }
}

- (void)_drawProgressInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  UIRectGetCenter();
  double v9 = v8;
  double v11 = v10;
  double v12 = v8 - x + self->_stroke * -0.5;
  if (-[MFProgressView _isValidCenter:radius:rect:](self, "_isValidCenter:radius:rect:", v8, v10, v12, x, y, width, height))
  {
    -[MFProgressView _drawCircleWithCenter:radius:](self, "_drawCircleWithCenter:radius:", v9, v11, v12);
    -[MFProgressView _drawWedgeWithCenter:radius:](self, "_drawWedgeWithCenter:radius:", v9, v11, v12);
  }
}

- (BOOL)_isValidCenter:(CGPoint)a3 radius:(double)a4 rect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if CGFloatIsValid() && CGFloatIsValid() && (CGFloatIsValid()) {
    return 1;
  }
  v14 = MFLogGeneral();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v30.CGFloat x = v11;
    v30.CGFloat y = v10;
    v15 = NSStringFromCGPoint(v30);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    v16 = NSStringFromCGRect(v31);
    double displayedProgress = self->_displayedProgress;
    double targetProgress = self->_targetProgress;
    int v19 = 138413314;
    v20 = v15;
    __int16 v21 = 2048;
    double v22 = a4;
    __int16 v23 = 2112;
    v24 = v16;
    __int16 v25 = 2048;
    double v26 = displayedProgress;
    __int16 v27 = 2048;
    double v28 = targetProgress;
    _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "#Warning Invalid progress metrics (see 15710132): center: %@, radius: %f, rect:%@, progress: %f, target: %f", (uint8_t *)&v19, 0x34u);
  }
  return 0;
}

- (void)_drawCircleWithCenter:(CGPoint)a3 radius:(double)a4
{
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3.x, a3.y, a4, 0.0, 6.28318531);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIColor *)self->_tintColor setStroke];
  [(UIColor *)self->_tintColor setFill];
  [v5 setLineWidth:self->_stroke];
  [v5 strokeWithBlendMode:17 alpha:1.0];
}

- (void)_drawWedgeWithCenter:(CGPoint)a3 radius:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double displayedProgress = self->_displayedProgress;
  if (fabs(displayedProgress) >= 2.22044605e-16)
  {
    id v8 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v8, "moveToPoint:", x, y);
    objc_msgSend(v8, "addLineToPoint:", x, y - a4);
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, a4, -1.57079633, displayedProgress * 6.28318531 + -1.57079633);
    objc_msgSend(v8, "addLineToPoint:", x, y);
    [v8 fillWithBlendMode:17 alpha:1.0];
  }
}

- (void)_stopSimulationIfCompleted
{
  if (self->_simulateActivityTimer)
  {
    if (self->_targetProgress >= 0.999999881) {
      [(MFProgressView *)self _invalidateSimulationTimer];
    }
  }
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (MFProgressViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFProgressViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_simulateActivityTimer, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
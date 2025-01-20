@interface MFRoundProgressView
- (MFRoundProgressView)initWithFrame:(CGRect)a3;
- (double)progress;
- (double)toRadian:(double)a3;
- (void)_displayLinkDidFire:(id)a3;
- (void)_startDisplayLink;
- (void)_stopDisplayLink;
- (void)_updateSubviews;
- (void)_updateUIProgress;
- (void)dealloc;
- (void)layoutSubviews;
- (void)recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4;
- (void)resetProgress;
- (void)setPieRadius:(double)a3;
- (void)setProgress:(double)a3;
@end

@implementation MFRoundProgressView

- (MFRoundProgressView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFRoundProgressView;
  v3 = -[MFRoundProgressView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MFRoundProgressView *)v3 _updateSubviews];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MFRoundProgressView;
  [(MFRoundProgressView *)&v3 layoutSubviews];
  [(MFRoundProgressView *)self _updateSubviews];
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MFRoundProgressView;
  [(MFRoundProgressView *)&v3 dealloc];
}

- (void)_updateSubviews
{
  if (!self->_contentView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    contentView = self->_contentView;
    self->_contentView = v4;

    [(UIView *)self->_contentView setAutoresizingMask:18];
    [(MFRoundProgressView *)self addSubview:self->_contentView];
  }
  [(MFRoundProgressView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  double v10 = v7 * 0.5;
  if (v7 * 0.5 >= v9 * 0.5) {
    double v10 = v9 * 0.5;
  }
  double v11 = ceil(v10 / 5.5);
  [(MFRoundProgressView *)self setPieRadius:v10 - v11 * 0.5];
  [(MFRoundProgressView *)self resetProgress];
  id v26 = [(UIView *)self->_contentView layer];
  sliceLayer = self->_sliceLayer;
  if (!sliceLayer)
  {
    v13 = [MEMORY[0x1E4F39C88] layer];
    v14 = self->_sliceLayer;
    self->_sliceLayer = v13;

    [v26 addSublayer:self->_sliceLayer];
    sliceLayer = self->_sliceLayer;
  }
  [(CAShapeLayer *)sliceLayer setZPosition:0.0];
  [(CAShapeLayer *)self->_sliceLayer setStrokeColor:0];
  id v15 = [MEMORY[0x1E4FB1618] whiteColor];
  -[CAShapeLayer setFillColor:](self->_sliceLayer, "setFillColor:", [v15 CGColor]);
  circleLayer = self->_circleLayer;
  if (!circleLayer)
  {
    v17 = [MEMORY[0x1E4F39C88] layer];
    v18 = self->_circleLayer;
    self->_circleLayer = v17;

    [v26 addSublayer:self->_circleLayer];
    circleLayer = self->_circleLayer;
  }
  [(CAShapeLayer *)circleLayer setZPosition:0.0];
  id v19 = v15;
  -[CAShapeLayer setStrokeColor:](self->_circleLayer, "setStrokeColor:", [v19 CGColor]);
  [(CAShapeLayer *)self->_circleLayer setFillColor:0];
  [(CAShapeLayer *)self->_circleLayer setLineWidth:v11];
  double pieRadius = self->_pieRadius;
  CGFloat x = self->_pieCenter.x;
  CGFloat y = self->_pieCenter.y;
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, x, y, pieRadius + -1.0, 0.0, 6.28318531, 0);
  CGPathCloseSubpath(Mutable);
  [(CAShapeLayer *)self->_circleLayer setPath:Mutable];
  CGPathRelease(Mutable);
  id v24 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.75];
  objc_msgSend(v26, "setShadowColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v26, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  LODWORD(v25) = 1.0;
  [v26 setShadowOpacity:v25];
  [v26 setShadowRadius:0.5];
  [(MFRoundProgressView *)self _updateUIProgress];
}

- (void)setPieRadius:(double)a3
{
  self->_double pieRadius = a3;
  [(MFRoundProgressView *)self bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGFloat MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v14);
  self->_pieCenter.CGFloat x = MidX;
  self->_pieCenter.CGFloat y = MidY;
  double pieRadius = self->_pieRadius;
  id v11 = [(MFRoundProgressView *)self layer];
  [v11 setCornerRadius:pieRadius];
}

- (void)_stopDisplayLink
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v4 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_startDisplayLink
{
  if (self->_uiProgress < 1.0 && !self->_displayLink)
  {
    id v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkDidFire_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:");
  }
}

- (void)_displayLinkDidFire:(id)a3
{
  id v11 = a3;
  double realProgress = self->_realProgress;
  if (realProgress != 0.0)
  {
    double uiProgress = self->_uiProgress;
    if (uiProgress >= realProgress)
    {
LABEL_14:
      if (uiProgress < 1.0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  double v6 = self->_uiProgress;
  double increaseRate = self->_increaseRate;
  double v8 = 1.0;
  if (realProgress >= 1.0)
  {
    double v10 = v6 + increaseRate;
    if (v6 + increaseRate <= 1.0)
    {
LABEL_13:
      self->_double uiProgress = v10;
      [(MFRoundProgressView *)self _updateUIProgress];
      double uiProgress = self->_uiProgress;
      goto LABEL_14;
    }
LABEL_12:
    double v10 = v8;
    goto LABEL_13;
  }
  if (v6 + increaseRate * 1.1 < 1.0 && (realProgress != 0.0 || v6 < 0.25))
  {
    double v8 = v6 + increaseRate;
    goto LABEL_12;
  }
LABEL_15:
  [(MFRoundProgressView *)self _stopDisplayLink];
LABEL_16:
}

- (double)toRadian:(double)a3
{
  return (a3 + a3) * 3.14159265;
}

- (void)_updateUIProgress
{
  [(MFRoundProgressView *)self toRadian:self->_uiProgress];
  if (self->_sliceLayer)
  {
    CGFloat v4 = v3 + 4.71238898;
    double pieRadius = self->_pieRadius;
    CGFloat x = self->_pieCenter.x;
    CGFloat y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, x, y);
    CGPathAddArc(Mutable, 0, x, y, pieRadius, 4.71238898, v4, 0);
    CGPathCloseSubpath(Mutable);
    [(CAShapeLayer *)self->_sliceLayer setPath:Mutable];
    CFRelease(Mutable);
  }
}

- (void)recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4
{
  double v5 = a3 / a4;
  [(CADisplayLink *)self->_displayLink duration];
  double v7 = v5 * v6;
  if (v7 < 0.000166666667) {
    double v7 = 0.000166666667;
  }
  self->_double increaseRate = v7;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  if (!self->_displayLink && self->_realProgress <= 1.0) {
    [(MFRoundProgressView *)self _startDisplayLink];
  }
  if (a3 > 0.0)
  {
    double realProgress = self->_realProgress;
    if (realProgress < 1.0 && realProgress < a3)
    {
      if (a3 >= 1.0)
      {
        double v10 = 1.0 - self->_uiProgress;
        double v11 = 0.1;
      }
      else
      {
        double v7 = CACurrentMediaTime();
        double prevUpdateTimeInterval = self->_prevUpdateTimeInterval;
        self->_double prevUpdateTimeInterval = v7;
        double v9 = v7 - prevUpdateTimeInterval;
        double v10 = 1.0 - self->_uiProgress;
        double v11 = v9 * (v10 / (a3 - self->_realProgress));
      }
      [(MFRoundProgressView *)self recalculateIncreaseProgress:v10 withTimeDiff:v11];
      self->_double realProgress = a3;
    }
  }
}

- (void)resetProgress
{
  self->_double uiProgress = 0.0;
  self->_double increaseRate = 0.00166666667;
  self->_double realProgress = 0.0;
  self->_double prevUpdateTimeInterval = CACurrentMediaTime();
  [(MFRoundProgressView *)self _stopDisplayLink];

  [(MFRoundProgressView *)self _updateUIProgress];
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_sliceLayer, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
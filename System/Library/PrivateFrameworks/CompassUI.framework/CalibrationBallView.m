@interface CalibrationBallView
- (CalibrationBallView)initWithFrame:(CGRect)a3 ballRadius:(double)a4;
- (double)ballRadius;
- (double)currentAngle;
- (double)trackRadius;
- (id)ballView;
- (void)layoutSubviews;
- (void)setAngle:(double)a3;
- (void)setBallRadius:(double)a3;
- (void)setTrackRadius:(double)a3;
@end

@implementation CalibrationBallView

- (CalibrationBallView)initWithFrame:(CGRect)a3 ballRadius:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CalibrationBallView;
  result = -[CalibrationBallView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_currentAngle = 0.0;
    result->_ballRadius = a4;
  }
  return result;
}

- (id)ballView
{
  ballView = self->_ballView;
  if (!ballView)
  {
    if (self->_ballRadius <= 0.0)
    {
      ballView = 0;
    }
    else
    {
      v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, self->_ballRadius, self->_ballRadius);
      v5 = self->_ballView;
      self->_ballView = v4;

      id v6 = [MEMORY[0x263F1C550] redColor];
      uint64_t v7 = [v6 CGColor];
      v8 = [(UIView *)self->_ballView layer];
      [v8 setBackgroundColor:v7];

      v9 = [(UIView *)self->_ballView layer];
      [v9 setMasksToBounds:1];

      double v10 = self->_ballRadius * 0.5;
      v11 = [(UIView *)self->_ballView layer];
      [v11 setCornerRadius:v10];

      [(CalibrationBallView *)self addSubview:self->_ballView];
      ballView = self->_ballView;
    }
  }

  return ballView;
}

- (void)setBallRadius:(double)a3
{
  self->_ballRadius = a3;
  [(CalibrationBallView *)self setNeedsLayout];
}

- (void)setTrackRadius:(double)a3
{
  self->_trackRadius = a3;
  [(CalibrationBallView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CalibrationBallView;
  [(CalibrationBallView *)&v8 layoutSubviews];
  [(CalibrationBallView *)self bounds];
  double MidX = CGRectGetMidX(v9);
  [(CalibrationBallView *)self bounds];
  double MidY = CGRectGetMidY(v10);
  v5 = [(CalibrationBallView *)self ballView];
  double trackRadius = self->_trackRadius;
  __double2 v7 = __sincos_stret(self->_currentAngle);
  objc_msgSend(v5, "setCenter:", MidX + trackRadius * v7.__cosval, MidY + trackRadius * v7.__sinval);
}

- (void)setAngle:(double)a3
{
  self->_currentAngle = a3;
  [(CalibrationBallView *)self setNeedsLayout];
}

- (double)ballRadius
{
  return self->_ballRadius;
}

- (double)trackRadius
{
  return self->_trackRadius;
}

- (double)currentAngle
{
  return self->_currentAngle;
}

- (void).cxx_destruct
{
}

@end
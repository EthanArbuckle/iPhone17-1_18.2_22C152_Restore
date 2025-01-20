@interface ETVideoRecordButton
+ (id)_dimColor:(id)a3;
+ (id)_redColor;
+ (id)recordingRedColorDimmed:(BOOL)a3;
- (BOOL)isRecording;
- (ETVideoRecordButton)init;
- (UIColor)innerColor;
- (id)_innerColor;
- (unint64_t)videoState;
- (void)_updateStartStopShape;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setInnerColor:(id)a3;
- (void)setRecording:(BOOL)a3;
- (void)setVideoState:(unint64_t)a3;
@end

@implementation ETVideoRecordButton

- (ETVideoRecordButton)init
{
  v18.receiver = self;
  v18.super_class = (Class)ETVideoRecordButton;
  v2 = [(ETVideoRecordButton *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(ETVideoRecordButton *)v2 layer];
    v5 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    outerRingShape = v3->_outerRingShape;
    v3->_outerRingShape = v5;

    v7 = v3->_outerRingShape;
    id v8 = +[UIColor whiteColor];
    -[CAShapeLayer setStrokeColor:](v7, "setStrokeColor:", [v8 CGColor]);

    [(CAShapeLayer *)v3->_outerRingShape setLineWidth:5.0];
    [v4 addSublayer:v3->_outerRingShape];
    v9 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    startStopShape = v3->_startStopShape;
    v3->_startStopShape = v9;

    innerColor = v3->_innerColor;
    v12 = objc_opt_class();
    if (innerColor) {
      [v12 _dimColor:v3->_innerColor];
    }
    else {
    v13 = [v12 recordingRedColorDimmed:0];
    }
    v14 = v3->_startStopShape;
    id v15 = v13;
    -[CAShapeLayer setFillColor:](v14, "setFillColor:", [v15 CGColor]);
    [v4 addSublayer:v3->_startStopShape];
    v16 = v3;
  }
  return v3;
}

+ (id)_dimColor:(id)a3
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  uint64_t v5 = 0;
  [a3 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  v3 = +[UIColor colorWithRed:v8 * 0.3 green:v7 * 0.3 blue:v6 * 0.3 alpha:1.0];

  return v3;
}

+ (id)_redColor
{
  if (qword_2F108 != -1) {
    dispatch_once(&qword_2F108, &stru_24AB8);
  }
  v2 = (void *)qword_2F100;

  return v2;
}

+ (id)recordingRedColorDimmed:(BOOL)a3
{
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_F5F0;
    block[3] = &unk_24AD8;
    block[4] = a1;
    if (qword_2F118 != -1) {
      dispatch_once(&qword_2F118, block);
    }
    id v3 = (id)qword_2F110;
  }
  else
  {
    id v3 = [a1 _redColor];
  }

  return v3;
}

- (id)_innerColor
{
  innerColor = self->_innerColor;
  if (innerColor)
  {
    id v3 = innerColor;
  }
  else
  {
    id v3 = +[ETVideoRecordButton _redColor];
  }

  return v3;
}

- (void)setInnerColor:(id)a3
{
  p_innerColor = &self->_innerColor;
  objc_storeStrong((id *)&self->_innerColor, a3);
  id v6 = a3;
  [(CAShapeLayer *)self->_startStopShape setFillColor:[(UIColor *)*p_innerColor CGColor]];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ETVideoRecordButton *)self isHighlighted] != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)ETVideoRecordButton;
    [(ETVideoRecordButton *)&v9 setHighlighted:v3];
    uint64_t v5 = [(ETVideoRecordButton *)self _innerColor];
    id v6 = v5;
    startStopShape = self->_startStopShape;
    if (v3)
    {
      id v8 = [(id)objc_opt_class() _dimColor:v5];
      -[CAShapeLayer setFillColor:](startStopShape, "setFillColor:", [v8 CGColor]);
    }
    else
    {
      -[CAShapeLayer setFillColor:](startStopShape, "setFillColor:", [v5 CGColor]);
    }
  }
}

- (void)setRecording:(BOOL)a3
{
  if (self->_recording != a3)
  {
    self->_recording = a3;
    [(ETVideoRecordButton *)self _updateStartStopShape];
  }
}

- (void)_updateStartStopShape
{
  [(ETVideoRecordButton *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  if (self->_recording) {
    double v9 = 5.0;
  }
  else {
    double v9 = v4 * 0.5 + -7.0;
  }
  if (self->_startStopRadius != v9)
  {
    CGFloat v10 = v3;
    CGFloat v11 = v4;
    if (self->_recording) {
      double v12 = 16.0;
    }
    else {
      double v12 = 7.0;
    }
    self->_startStopRadius = v9;
    v13 = [(CAShapeLayer *)self->_startStopShape path];
    v18.origin.x = v6;
    v18.origin.y = v8;
    v18.size.width = v10;
    v18.size.height = v11;
    CGRect v19 = CGRectInset(v18, v12, v12);
    v14 = CGPathCreateWithRoundedRect(v19, v9, v9, 0);
    [(CAShapeLayer *)self->_startStopShape setPath:v14];
    if (v13)
    {
      id v15 = +[CABasicAnimation animationWithKeyPath:@"path"];
      +[CATransaction animationDuration];
      objc_msgSend(v15, "setDuration:");
      [v15 setFromValue:v13];
      [v15 setToValue:v14];
      v16 = +[CATransaction animationTimingFunction];
      [v15 setTimingFunction:v16];

      [v15 setFillMode:kCAFillModeForwards];
      [(CAShapeLayer *)self->_startStopShape addAnimation:v15 forKey:@"startStopAnimation"];
    }
    CGPathRelease(v14);
  }
}

- (void)layoutSubviews
{
  [(ETVideoRecordButton *)self bounds];
  CGRect v6 = CGRectInset(v5, 2.5, 2.5);
  double v3 = CGPathCreateWithEllipseInRect(v6, 0);
  [(CAShapeLayer *)self->_outerRingShape setPath:v3];
  CGPathRelease(v3);

  [(ETVideoRecordButton *)self _updateStartStopShape];
}

- (void)setVideoState:(unint64_t)a3
{
  if (self->_videoState != a3)
  {
    self->_videoState = a3;
    if (a3 <= 6 && ((0x4Fu >> a3) & 1) != 0) {
      [(ETVideoRecordButton *)self setRecording:(a3 & 0x7F) == 2];
    }
  }
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (unint64_t)videoState
{
  return self->_videoState;
}

- (UIColor)innerColor
{
  return self->_innerColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerColor, 0);
  objc_storeStrong((id *)&self->_startStopShape, 0);

  objc_storeStrong((id *)&self->_outerRingShape, 0);
}

@end
@interface CircularProgressView
- (CAShapeLayer)animatedStrokeLayer;
- (CAShapeLayer)backgroundStrokeLayer;
- (CATextLayer)backgroundPercentageLayer;
- (CGSize)size;
- (CircularProgressView)initWithSize:(CGSize)a3;
- (double)progress;
- (void)layoutSubviews;
- (void)setAnimatedStrokeLayer:(id)a3;
- (void)setBackgroundPercentageLayer:(id)a3;
- (void)setBackgroundStrokeLayer:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)setSize:(CGSize)a3;
@end

@implementation CircularProgressView

- (CircularProgressView)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)CircularProgressView;
  v5 = -[CircularProgressView initWithFrame:](&v20, "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
  v6 = v5;
  if (v5)
  {
    v5->_size.CGFloat width = width;
    v5->_size.CGFloat height = height;
    uint64_t v7 = +[CATextLayer layer];
    backgroundPercentageLayer = v6->_backgroundPercentageLayer;
    v6->_backgroundPercentageLayer = (CATextLayer *)v7;

    uint64_t v9 = +[CAShapeLayer layer];
    backgroundStrokeLayer = v6->_backgroundStrokeLayer;
    v6->_backgroundStrokeLayer = (CAShapeLayer *)v9;

    uint64_t v11 = +[CAShapeLayer layer];
    animatedStrokeLayer = v6->_animatedStrokeLayer;
    v6->_animatedStrokeLayer = (CAShapeLayer *)v11;

    [(CATextLayer *)v6->_backgroundPercentageLayer setString:&stru_10001C720];
    id v13 = +[UIColor grayColor];
    -[CATextLayer setForegroundColor:](v6->_backgroundPercentageLayer, "setForegroundColor:", [v13 CGColor]);

    [(CATextLayer *)v6->_backgroundPercentageLayer setAlignmentMode:kCAAlignmentCenter];
    [(CATextLayer *)v6->_backgroundPercentageLayer setFontSize:31.0];
    v14 = +[UIScreen mainScreen];
    [v14 scale];
    -[CATextLayer setContentsScale:](v6->_backgroundPercentageLayer, "setContentsScale:");

    [(CAShapeLayer *)v6->_backgroundStrokeLayer setFillColor:0];
    id v15 = +[UIColor colorWithWhite:0.5 alpha:0.5];
    -[CAShapeLayer setStrokeColor:](v6->_backgroundStrokeLayer, "setStrokeColor:", [v15 CGColor]);

    [(CAShapeLayer *)v6->_backgroundStrokeLayer setStrokeStart:0.0];
    [(CAShapeLayer *)v6->_backgroundStrokeLayer setStrokeEnd:1.0];
    [(CAShapeLayer *)v6->_backgroundStrokeLayer setLineWidth:5.0];
    [(CAShapeLayer *)v6->_animatedStrokeLayer setFillColor:0];
    id v16 = +[UIColor blueColor];
    -[CAShapeLayer setStrokeColor:](v6->_animatedStrokeLayer, "setStrokeColor:", [v16 CGColor]);

    [(CAShapeLayer *)v6->_animatedStrokeLayer setStrokeStart:0.0];
    [(CAShapeLayer *)v6->_animatedStrokeLayer setStrokeEnd:0.0];
    [(CAShapeLayer *)v6->_animatedStrokeLayer setLineWidth:5.0];
    [(CAShapeLayer *)v6->_animatedStrokeLayer setLineCap:kCALineCapRound];
    v17 = [(CircularProgressView *)v6 layer];
    [v17 addSublayer:v6->_backgroundStrokeLayer];

    v18 = [(CircularProgressView *)v6 layer];
    [v18 addSublayer:v6->_animatedStrokeLayer];
  }
  return v6;
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)CircularProgressView;
  [(CircularProgressView *)&v44 layoutSubviews];
  [(CircularProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CircularProgressView *)self backgroundPercentageLayer];
  [v11 setFrame:v4, v6, v8, v10];

  [(CircularProgressView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  objc_super v20 = [(CircularProgressView *)self backgroundStrokeLayer];
  [v20 setFrame:v13, v15, v17, v19];

  [(CircularProgressView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(CircularProgressView *)self animatedStrokeLayer];
  [v29 setFrame:v22, v24, v26, v28];

  [(CircularProgressView *)self bounds];
  CGFloat x = v45.origin.x;
  CGFloat y = v45.origin.y;
  CGFloat width = v45.size.width;
  CGFloat height = v45.size.height;
  double MidX = CGRectGetMidX(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v46);
  [(CircularProgressView *)self bounds];
  double v36 = CGRectGetWidth(v47);
  [(CircularProgressView *)self bounds];
  double v37 = CGRectGetHeight(v48);
  if (v36 < v37) {
    double v37 = v36;
  }
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v37 * 0.5, -1.57079633, 4.71238898);
  id v38 = objc_claimAutoreleasedReturnValue();
  id v39 = [v38 CGPath];
  v40 = [(CircularProgressView *)self backgroundStrokeLayer];
  [v40 setPath:v39];

  id v41 = v38;
  id v42 = [v41 CGPath];
  v43 = [(CircularProgressView *)self animatedStrokeLayer];
  [v43 setPath:v42];
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  double v4 = fmin(a3, 1.0);
  if (v4 != self->_progress)
  {
    self->_double progress = v4;
    double progress = v4;
    if (a4)
    {
      double v7 = +[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
      double v8 = [(CircularProgressView *)self animatedStrokeLayer];
      [v8 strokeEnd];
      double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v7 setFromValue:v9];

      double v10 = +[NSNumber numberWithDouble:self->_progress];
      [v7 setToValue:v10];

      [v7 setDuration:2.0];
      uint64_t v11 = [(CircularProgressView *)self animatedStrokeLayer];
      [v11 addAnimation:v7 forKey:@"strokeEnd"];

      double progress = self->_progress;
    }
    double v12 = [(CircularProgressView *)self animatedStrokeLayer];
    [v12 setStrokeEnd:progress];

    id v14 = +[NSString stringWithFormat:@"\n%d", (int)(v4 * 100.0)];
    double v13 = [(CircularProgressView *)self backgroundPercentageLayer];
    [v13 setString:v14];
  }
}

- (void)setProgress:(double)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)progress
{
  return self->_progress;
}

- (CATextLayer)backgroundPercentageLayer
{
  return self->_backgroundPercentageLayer;
}

- (void)setBackgroundPercentageLayer:(id)a3
{
}

- (CAShapeLayer)backgroundStrokeLayer
{
  return self->_backgroundStrokeLayer;
}

- (void)setBackgroundStrokeLayer:(id)a3
{
}

- (CAShapeLayer)animatedStrokeLayer
{
  return self->_animatedStrokeLayer;
}

- (void)setAnimatedStrokeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStrokeLayer, 0);
  objc_storeStrong((id *)&self->_backgroundStrokeLayer, 0);

  objc_storeStrong((id *)&self->_backgroundPercentageLayer, 0);
}

@end
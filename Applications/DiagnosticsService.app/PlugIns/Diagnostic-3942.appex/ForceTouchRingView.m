@interface ForceTouchRingView
+ (Class)layerClass;
- (BOOL)ringShouldGrow;
- (BOOL)timedOut;
- (CABasicAnimation)circlePathAnimation;
- (CAShapeLayer)circle;
- (CGPoint)ringCenter;
- (ForceTouchRingView)initWithFrame:(CGRect)a3 ringCenter:(CGPoint)a4 startingCircleRadius:(float)a5 startingCircleRatio:(float)a6 endingCircleRatio:(float)a7 ringStartingColor:(id)a8 ringSuccessColor:(id)a9 ringFailedColor:(id)a10;
- (UIBezierPath)circlePath;
- (UIColor)ringFailedColor;
- (UIColor)ringStartingColor;
- (UIColor)ringSuccessColor;
- (double)pressureRatio;
- (float)maximumCircleRatio;
- (float)minimumCircleRatio;
- (float)startingCircleRadius;
- (id)animationCompletion;
- (id)colorInterpolationFromColor:(id)a3 toColor:(id)a4 atRatio:(double)a5;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)playCircleAnimationWithCompletion:(id)a3;
- (void)setAnimationCompletion:(id)a3;
- (void)setCircle:(id)a3;
- (void)setCirclePath:(id)a3;
- (void)setCirclePathAnimation:(id)a3;
- (void)setMaximumCircleRatio:(float)a3;
- (void)setMinimumCircleRatio:(float)a3;
- (void)setPressureRatio:(double)a3;
- (void)setRingCenter:(CGPoint)a3;
- (void)setRingFailedColor:(id)a3;
- (void)setRingShouldGrow:(BOOL)a3;
- (void)setRingStartingColor:(id)a3;
- (void)setRingSuccessColor:(id)a3;
- (void)setStartingCircleRadius:(float)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)updateCircleWithPressureRatio:(double)a3;
@end

@implementation ForceTouchRingView

- (ForceTouchRingView)initWithFrame:(CGRect)a3 ringCenter:(CGPoint)a4 startingCircleRadius:(float)a5 startingCircleRatio:(float)a6 endingCircleRatio:(float)a7 ringStartingColor:(id)a8 ringSuccessColor:(id)a9 ringFailedColor:(id)a10
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v19 = a3.origin.y;
  double v20 = a3.origin.x;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v35.receiver = self;
  v35.super_class = (Class)ForceTouchRingView;
  v25 = -[ForceTouchRingView initWithFrame:](&v35, "initWithFrame:", v20, v19, width, height);
  if (v25)
  {
    v26 = +[UIColor clearColor];
    [(ForceTouchRingView *)v25 setBackgroundColor:v26];

    v25->_ringCenter.CGFloat x = x;
    v25->_ringCenter.CGFloat y = y;
    v25->_startingCircleRadius = a5;
    objc_storeStrong((id *)&v25->_ringStartingColor, a8);
    objc_storeStrong((id *)&v25->_ringSuccessColor, a9);
    objc_storeStrong((id *)&v25->_ringFailedColor, a10);
    if (a6 >= a7) {
      float v27 = a7;
    }
    else {
      float v27 = a6;
    }
    v25->_minimumCircleRatio = v27;
    if (a6 >= a7) {
      float v28 = a6;
    }
    else {
      float v28 = a7;
    }
    v25->_maximumCircleRatio = v28;
    v25->_ringShouldGrow = a6 <= a7;
    v29 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v25->_ringCenter.x, v25->_ringCenter.y, (float)(v25->_startingCircleRadius * v25->_minimumCircleRatio), 0.0, 6.28318531);
    [(ForceTouchRingView *)v25 setCirclePath:v29];

    uint64_t v30 = [(ForceTouchRingView *)v25 layer];
    circle = v25->_circle;
    v25->_circle = (CAShapeLayer *)v30;

    id v32 = [(ForceTouchRingView *)v25 circlePath];
    -[CAShapeLayer setPath:](v25->_circle, "setPath:", [v32 CGPath]);

    id v33 = v22;
    -[CAShapeLayer setStrokeColor:](v25->_circle, "setStrokeColor:", [v33 CGColor]);
    -[CAShapeLayer setFillColor:](v25->_circle, "setFillColor:", [v33 CGColor]);
  }

  return v25;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)playCircleAnimationWithCompletion:(id)a3
{
  [(ForceTouchRingView *)self setAnimationCompletion:a3];
  [(ForceTouchRingView *)self ringCenter];
  double v5 = v4;
  double v7 = v6;
  [(ForceTouchRingView *)self startingCircleRadius];
  float v9 = v8;
  [(ForceTouchRingView *)self minimumCircleRatio];
  v11 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v5, v7, (float)(v9 * v10), 0.0, 6.28318531);
  [(ForceTouchRingView *)self setCirclePath:v11];

  id v12 = [(ForceTouchRingView *)self circlePath];
  id v13 = [v12 CGPath];
  v14 = [(ForceTouchRingView *)self circle];
  [v14 setPath:v13];

  v15 = +[CABasicAnimation animationWithKeyPath:@"path"];
  [(ForceTouchRingView *)self setCirclePathAnimation:v15];

  v16 = [(ForceTouchRingView *)self circlePathAnimation];
  [v16 setDuration:0.5];

  v17 = [(ForceTouchRingView *)self circlePathAnimation];
  [v17 setDelegate:self];

  id v19 = [(ForceTouchRingView *)self circle];
  v18 = [(ForceTouchRingView *)self circlePathAnimation];
  [v19 addAnimation:v18 forKey:0];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    double v5 = [(ForceTouchRingView *)self animationCompletion];

    if (v5)
    {
      double v6 = [(ForceTouchRingView *)self animationCompletion];
      v6[2]();
    }
  }
}

- (id)colorInterpolationFromColor:(id)a3 toColor:(id)a4 atRatio:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  Components = CGColorGetComponents((CGColorRef)[v7 CGColor]);
  id v10 = v8;
  v11 = (CGColor *)[v10 CGColor];

  id v12 = CGColorGetComponents(v11);
  double v13 = *v12 * a5 + (1.0 - a5) * *Components;
  double v14 = v12[1] * a5 + (1.0 - a5) * Components[1];
  double v15 = v12[2] * a5 + (1.0 - a5) * Components[2];

  return +[UIColor colorWithRed:v13 green:v14 blue:v15 alpha:1.0];
}

- (void)updateCircleWithPressureRatio:(double)a3
{
  if ([(ForceTouchRingView *)self timedOut])
  {
    double v5 = [(ForceTouchRingView *)self ringStartingColor];
    double v6 = [(ForceTouchRingView *)self ringFailedColor];
    id v7 = [(ForceTouchRingView *)self colorInterpolationFromColor:v5 toColor:v6 atRatio:1.0];
    id v8 = [v7 CGColor];
    float v9 = [(ForceTouchRingView *)self circle];
    [v9 setStrokeColor:v8];

    id v10 = [(ForceTouchRingView *)self ringStartingColor];
    v11 = [(ForceTouchRingView *)self ringFailedColor];
    id v12 = [(ForceTouchRingView *)self colorInterpolationFromColor:v10 toColor:v11 atRatio:1.0];
    id v13 = [v12 CGColor];
    double v14 = [(ForceTouchRingView *)self circle];
    [v14 setFillColor:v13];
  }
  else
  {
    double v15 = fmin(fmax(a3, 0.0), 1.0);
    v16 = [(ForceTouchRingView *)self ringStartingColor];
    v17 = [(ForceTouchRingView *)self ringSuccessColor];
    id v18 = [(ForceTouchRingView *)self colorInterpolationFromColor:v16 toColor:v17 atRatio:v15];
    id v19 = [v18 CGColor];
    double v20 = [(ForceTouchRingView *)self circle];
    [v20 setStrokeColor:v19];

    v21 = [(ForceTouchRingView *)self ringStartingColor];
    id v22 = [(ForceTouchRingView *)self ringSuccessColor];
    id v23 = [(ForceTouchRingView *)self colorInterpolationFromColor:v21 toColor:v22 atRatio:v15];
    id v24 = [v23 CGColor];
    v25 = [(ForceTouchRingView *)self circle];
    [v25 setFillColor:v24];

    [(ForceTouchRingView *)self maximumCircleRatio];
    double v27 = v26;
    if (v15 < v27) {
      double v27 = v15;
    }
    [(ForceTouchRingView *)self setPressureRatio:v27];
  }
  [(ForceTouchRingView *)self ringCenter];
  double v29 = v28;
  double v31 = v30;
  [(ForceTouchRingView *)self startingCircleRadius];
  float v33 = v32;
  if ([(ForceTouchRingView *)self ringShouldGrow])
  {
    [(ForceTouchRingView *)self pressureRatio];
    double v35 = v34;
  }
  else
  {
    [(ForceTouchRingView *)self maximumCircleRatio];
    double v37 = v36;
    [(ForceTouchRingView *)self pressureRatio];
    double v35 = v37 - v38;
  }
  double v39 = v33;
  [(ForceTouchRingView *)self minimumCircleRatio];
  double v41 = v40;
  if (v35 >= v41) {
    double v41 = v35;
  }
  v42 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v31, v41 * v39, 0.0, 6.28318531);
  [(ForceTouchRingView *)self setCirclePath:v42];

  id v45 = [(ForceTouchRingView *)self circlePath];
  id v43 = [v45 CGPath];
  v44 = [(ForceTouchRingView *)self circle];
  [v44 setPath:v43];
}

- (CGPoint)ringCenter
{
  double x = self->_ringCenter.x;
  double y = self->_ringCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRingCenter:(CGPoint)a3
{
  self->_ringCenter = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (UIColor)ringStartingColor
{
  return self->_ringStartingColor;
}

- (void)setRingStartingColor:(id)a3
{
}

- (UIColor)ringSuccessColor
{
  return self->_ringSuccessColor;
}

- (void)setRingSuccessColor:(id)a3
{
}

- (UIColor)ringFailedColor
{
  return self->_ringFailedColor;
}

- (void)setRingFailedColor:(id)a3
{
}

- (CAShapeLayer)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
}

- (CABasicAnimation)circlePathAnimation
{
  return self->_circlePathAnimation;
}

- (void)setCirclePathAnimation:(id)a3
{
}

- (UIBezierPath)circlePath
{
  return self->_circlePath;
}

- (void)setCirclePath:(id)a3
{
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
}

- (double)pressureRatio
{
  return self->_pressureRatio;
}

- (void)setPressureRatio:(double)a3
{
  self->_pressureRatio = a3;
}

- (float)startingCircleRadius
{
  return self->_startingCircleRadius;
}

- (void)setStartingCircleRadius:(float)a3
{
  self->_startingCircleRadius = a3;
}

- (float)minimumCircleRatio
{
  return self->_minimumCircleRatio;
}

- (void)setMinimumCircleRatio:(float)a3
{
  self->_minimumCircleRatio = a3;
}

- (float)maximumCircleRatio
{
  return self->_maximumCircleRatio;
}

- (void)setMaximumCircleRatio:(float)a3
{
  self->_maximumCircleRatio = a3;
}

- (BOOL)ringShouldGrow
{
  return self->_ringShouldGrow;
}

- (void)setRingShouldGrow:(BOOL)a3
{
  self->_ringShouldGrow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_circlePath, 0);
  objc_storeStrong((id *)&self->_circlePathAnimation, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_ringFailedColor, 0);
  objc_storeStrong((id *)&self->_ringSuccessColor, 0);

  objc_storeStrong((id *)&self->_ringStartingColor, 0);
}

@end
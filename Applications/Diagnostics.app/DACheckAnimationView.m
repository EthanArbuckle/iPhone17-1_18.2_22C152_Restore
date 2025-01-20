@interface DACheckAnimationView
+ (Class)layerClass;
- (CAShapeLayer)check;
- (DACheckAnimationView)initWithColor:(id)a3 lineWidth:(double)a4 scale:(double)a5;
- (DACheckAnimationView)initWithFrame:(CGRect)a3 color:(id)a4 scale:(double)a5;
- (UIColor)strokeColor;
- (id)animationCompletion;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)hideCheck;
- (void)layoutSubviews;
- (void)playCheckAnimationWithCompletion:(id)a3;
- (void)setAnimationCompletion:(id)a3;
- (void)setCheck:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)showCheck;
@end

@implementation DACheckAnimationView

- (DACheckAnimationView)initWithFrame:(CGRect)a3 color:(id)a4 scale:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v31.receiver = self;
  v31.super_class = (Class)DACheckAnimationView;
  v12 = -[DACheckAnimationView initWithFrame:](&v31, "initWithFrame:", x, y, width, height);
  if (v12)
  {
    v13 = +[UIBezierPath bezierPath];
    [v13 moveToPoint:0.0, 10.0];
    [v13 addLineToPoint:10.0, 18.0];
    [v13 addLineToPoint:24.0, 0.0];
    CGAffineTransformMakeScale(&v30, a5, a5);
    [v13 applyTransform:&v30];
    [(DACheckAnimationView *)v12 setStrokeColor:v11];
    v14 = [(DACheckAnimationView *)v12 layer];
    [(DACheckAnimationView *)v12 setCheck:v14];

    id v15 = v13;
    id v16 = [v15 CGPath];
    v17 = [(DACheckAnimationView *)v12 check];
    [v17 setPath:v16];

    id v18 = [(DACheckAnimationView *)v12 strokeColor];
    id v19 = [v18 CGColor];
    v20 = [(DACheckAnimationView *)v12 check];
    [v20 setStrokeColor:v19];

    id v21 = +[UIColor clearColor];
    id v22 = [v21 CGColor];
    v23 = [(DACheckAnimationView *)v12 check];
    [v23 setFillColor:v22];

    v24 = [(DACheckAnimationView *)v12 check];
    [v24 setLineWidth:5.0];

    v25 = [(DACheckAnimationView *)v12 check];
    [v25 setStrokeStart:0.0];

    v26 = [(DACheckAnimationView *)v12 check];
    [v26 setStrokeEnd:0.0];

    v27 = [(DACheckAnimationView *)v12 check];
    [v27 setLineCap:kCALineCapRound];

    v28 = [(DACheckAnimationView *)v12 check];
    [v28 setLineJoin:kCALineJoinRound];
  }
  return v12;
}

- (DACheckAnimationView)initWithColor:(id)a3 lineWidth:(double)a4 scale:(double)a5
{
  v6 = -[DACheckAnimationView initWithFrame:color:scale:](self, "initWithFrame:color:scale:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a5);
  v7 = v6;
  if (v6)
  {
    v8 = [(DACheckAnimationView *)v6 check];
    [v8 setLineWidth:a4];
  }
  return v7;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)hideCheck
{
  id v2 = [(DACheckAnimationView *)self check];
  [v2 setStrokeEnd:0.0];
}

- (void)showCheck
{
  id v2 = [(DACheckAnimationView *)self check];
  [v2 setStrokeEnd:1.0];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v5 = [(DACheckAnimationView *)self strokeColor];
  id v3 = [v5 CGColor];
  v4 = [(DACheckAnimationView *)self check];
  [v4 setStrokeColor:v3];
}

- (void)layoutSubviews
{
  id v3 = [(DACheckAnimationView *)self check];
  id v4 = [v3 strokeColor];
  id v5 = [(DACheckAnimationView *)self strokeColor];
  id v6 = [v5 CGColor];

  if (v4 != v6)
  {
    id v7 = [(DACheckAnimationView *)self strokeColor];
    id v8 = [v7 CGColor];
    v9 = [(DACheckAnimationView *)self check];
    [v9 setStrokeColor:v8];
  }
  v10.receiver = self;
  v10.super_class = (Class)DACheckAnimationView;
  [(DACheckAnimationView *)&v10 layoutSubviews];
}

- (void)playCheckAnimationWithCompletion:(id)a3
{
  [(DACheckAnimationView *)self setAnimationCompletion:a3];
  id v4 = [(DACheckAnimationView *)self check];
  [v4 setStrokeEnd:1.0];

  id v8 = +[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  [v8 setDuration:0.375];
  [v8 setFillMode:kCAFillModeBoth];
  [v8 setBeginTime:CACurrentMediaTime() + 0.150000006];
  [v8 setFromValue:&off_100157560];
  [v8 setToValue:&off_100157570];
  [v8 setDelegate:self];
  id v5 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v8 setTimingFunction:v5];

  LODWORD(v6) = 1.0;
  [v8 setRepeatCount:v6];
  id v7 = [(DACheckAnimationView *)self check];
  [v7 addAnimation:v8 forKey:@"strokeEndAnimation"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [(DACheckAnimationView *)self animationCompletion];

  if (v6)
  {
    id v7 = [(DACheckAnimationView *)self animationCompletion];
    v7[2](v7, v4);
  }
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (CAShapeLayer)check
{
  return self->_check;
}

- (void)setCheck:(id)a3
{
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_check, 0);

  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
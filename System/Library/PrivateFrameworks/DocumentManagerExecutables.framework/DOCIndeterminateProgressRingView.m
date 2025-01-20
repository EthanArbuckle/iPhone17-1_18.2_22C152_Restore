@interface DOCIndeterminateProgressRingView
+ (Class)layerClass;
- (DOCIndeterminateProgressRingView)initWithFrame:(CGRect)a3;
- (void)_removeAllAnimations:(BOOL)a3;
- (void)_updateShapePath;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation DOCIndeterminateProgressRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (DOCIndeterminateProgressRingView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)DOCIndeterminateProgressRingView;
  v3 = -[DOCIndeterminateProgressRingView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(DOCIndeterminateProgressRingView *)v3 layer];
    [v5 setLineCap:*MEMORY[0x263F15E70]];
    id v6 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    [(DOCIndeterminateProgressRingView *)v4 _updateShapePath];
    uint64_t v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.z"];
    spinnerAnimation = v4->_spinnerAnimation;
    v4->_spinnerAnimation = (CABasicAnimation *)v7;

    v9 = [(CABasicAnimation *)v4->_spinnerAnimation keyPath];
    v10 = [v5 valueForKeyPath:v9];

    [(CABasicAnimation *)v4->_spinnerAnimation setFromValue:v10];
    v11 = v4->_spinnerAnimation;
    v12 = NSNumber;
    [v10 floatValue];
    v14 = objc_msgSend(v12, "numberWithDouble:", (double)(fmod(v13, 6.28318531) + 6.28318531));
    [(CABasicAnimation *)v11 setToValue:v14];

    [(CABasicAnimation *)v4->_spinnerAnimation setRemovedOnCompletion:0];
    LODWORD(v15) = 2139095040;
    [(CABasicAnimation *)v4->_spinnerAnimation setRepeatCount:v15];
    [(CABasicAnimation *)v4->_spinnerAnimation setFillMode:*MEMORY[0x263F15AA8]];
    [(CABasicAnimation *)v4->_spinnerAnimation setDuration:1.0];
    [(CABasicAnimation *)v4->_spinnerAnimation setBeginTimeMode:*MEMORY[0x263F15950]];
    CFTimeInterval v16 = CACurrentMediaTime();
    v17 = v4->_spinnerAnimation;
    [(CABasicAnimation *)v17 duration];
    [(CABasicAnimation *)v17 setBeginTime:(double)(v16 - fmod(v16, v18))];
    [v5 addAnimation:v4->_spinnerAnimation forKey:@"DOCIndeterminateProgressRingViewSpinnerAnimationKey"];
  }
  return v4;
}

- (void)_removeAllAnimations:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DOCIndeterminateProgressRingView;
  [(DOCIndeterminateProgressRingView *)&v5 _removeAllAnimations:a3];
  v4 = [(DOCIndeterminateProgressRingView *)self layer];
  [v4 addAnimation:self->_spinnerAnimation forKey:@"DOCIndeterminateProgressRingViewSpinnerAnimationKey"];
}

- (void)setTintColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DOCIndeterminateProgressRingView;
  id v4 = a3;
  [(DOCIndeterminateProgressRingView *)&v8 setTintColor:v4];
  objc_super v5 = [(DOCIndeterminateProgressRingView *)self layer];
  id v6 = v4;
  uint64_t v7 = [v6 CGColor];

  [v5 setStrokeColor:v7];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DOCIndeterminateProgressRingView;
  [(DOCIndeterminateProgressRingView *)&v3 layoutSubviews];
  [(DOCIndeterminateProgressRingView *)self _updateShapePath];
}

- (void)_updateShapePath
{
  id v13 = [(DOCIndeterminateProgressRingView *)self layer];
  [(DOCIndeterminateProgressRingView *)self bounds];
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  CGFloat v7 = v15.size.width * 0.5;
  double MidX = CGRectGetMidX(v15);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  double MidY = CGRectGetMidY(v16);
  v10 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v7, 0.0, 5.8293997);
  id v11 = v10;
  objc_msgSend(v13, "setPath:", objc_msgSend(v11, "CGPath"));
  if (width >= height) {
    double v12 = height;
  }
  else {
    double v12 = width;
  }
  [v13 setLineWidth:v12 / 36.0 * 3.0];
  objc_msgSend(v13, "setBounds:", x, y, width, height);
}

- (void).cxx_destruct
{
}

@end
@interface DOCDeterminateProgressRingView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)canShowStopButton;
- (DOCDeterminateProgressRingView)initWithFrame:(CGRect)a3;
- (double)progress;
- (void)_updateShapePath;
- (void)layoutSubviews;
- (void)setCanShowStopButton:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setTintColor:(id)a3;
@end

@implementation DOCDeterminateProgressRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (DOCDeterminateProgressRingView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DOCDeterminateProgressRingView;
  v3 = -[DOCDeterminateProgressRingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(DOCDeterminateProgressRingView *)v3 layer];
    [v5 setLineCap:*MEMORY[0x263F15E70]];
    id v6 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    uint64_t v7 = [MEMORY[0x263F157E8] layer];
    squareLayer = v4->_squareLayer;
    v4->_squareLayer = (CALayer *)v7;

    [(CALayer *)v4->_squareLayer setHidden:1];
    [v5 addSublayer:v4->_squareLayer];
    [(DOCDeterminateProgressRingView *)v4 _updateShapePath];
    [v5 setStrokeEnd:0.0];
  }
  return v4;
}

- (void)setCanShowStopButton:(BOOL)a3
{
  self->_canShowStopButton = a3;
  [(CALayer *)self->_squareLayer setHidden:!a3];
}

- (void)setTintColor:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DOCDeterminateProgressRingView;
  id v4 = a3;
  [(DOCDeterminateProgressRingView *)&v9 setTintColor:v4];
  v5 = [(DOCDeterminateProgressRingView *)self layer];
  id v6 = v4;
  objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
  id v7 = v6;
  uint64_t v8 = [v7 CGColor];

  [(CALayer *)self->_squareLayer setBackgroundColor:v8];
}

- (void)_updateShapePath
{
  id v13 = [(DOCDeterminateProgressRingView *)self layer];
  v3 = [MEMORY[0x263F824C0] bezierPath];
  [(DOCDeterminateProgressRingView *)self bounds];
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  CGFloat v8 = v15.size.width * 0.5;
  double MidX = CGRectGetMidX(v15);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  objc_msgSend(v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v16), v8, -1.57079633, 4.71238898);
  id v10 = v3;
  objc_msgSend(v13, "setPath:", objc_msgSend(v10, "CGPath"));
  if (width >= height) {
    double v11 = height;
  }
  else {
    double v11 = width;
  }
  double v12 = v11 / 36.0;
  DOCCenterSizeInRect();
  -[CALayer setFrame:](self->_squareLayer, "setFrame:");
  [v13 setLineWidth:v12 * 3.0];
  objc_msgSend(v13, "setBounds:", x, y, width, height);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DOCDeterminateProgressRingView;
  [(DOCDeterminateProgressRingView *)&v3 layoutSubviews];
  [(DOCDeterminateProgressRingView *)self _updateShapePath];
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  id v4 = [(DOCDeterminateProgressRingView *)self layer];
  [v4 setStrokeEnd:self->_progress];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DOCDeterminateProgressRingView;
  if ([(DOCDeterminateProgressRingView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"strokeEnd"];
  }

  return v5;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)canShowStopButton
{
  return self->_canShowStopButton;
}

- (void).cxx_destruct
{
}

@end
@interface _MPDownloadProgressRingView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_MPDownloadProgressRingView)initWithFrame:(CGRect)a3;
- (double)progress;
- (void)_updateShapePath;
- (void)layoutSubviews;
- (void)setProgress:(double)a3;
- (void)tintColorDidChange;
@end

@implementation _MPDownloadProgressRingView

- (double)progress
{
  return self->_progress;
}

- (void)_updateShapePath
{
  [(_MPDownloadProgressRingView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(_MPDownloadProgressRingView *)self traitCollection];
  [v11 displayScale];
  double SafeScaleForValue = MPFloatGetSafeScaleForValue(v12);

  id v27 = [(_MPDownloadProgressRingView *)self layer];
  [v27 lineWidth];
  CGFloat v15 = v14 * 0.5;
  v29.origin.CGFloat x = v4;
  v29.origin.CGFloat y = v6;
  v29.size.CGFloat width = v8;
  v29.size.CGFloat height = v10;
  CGRect v30 = CGRectInset(v29, v15, v15);
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  v20 = [MEMORY[0x1E4FB14C0] bezierPath];
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  objc_msgSend(v20, "moveToPoint:", MidX, CGRectGetMinY(v32));
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v22 = CGRectGetWidth(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v23 = CGRectGetHeight(v34);
  if (v22 < v23) {
    double v23 = v22;
  }
  double v24 = v23 * 0.5;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v25 = CGRectGetMidX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  objc_msgSend(v20, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v25, CGRectGetMidY(v36), v24, -1.57079633, 4.71238898);
  id v26 = v20;
  objc_msgSend(v27, "setPath:", objc_msgSend(v26, "CGPath"));
  [v27 setLineWidth:1.0 / SafeScaleForValue + 2.0];
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  id v4 = [(_MPDownloadProgressRingView *)self layer];
  [v4 setStrokeEnd:self->_progress];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_MPDownloadProgressRingView;
  if ([(_MPDownloadProgressRingView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"strokeEnd"];
  }

  return v5;
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)_MPDownloadProgressRingView;
  [(_MPDownloadProgressRingView *)&v6 tintColorDidChange];
  double v3 = [(_MPDownloadProgressRingView *)self tintColor];
  id v4 = [(_MPDownloadProgressRingView *)self layer];
  id v5 = v3;
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_MPDownloadProgressRingView;
  [(_MPDownloadProgressRingView *)&v3 layoutSubviews];
  [(_MPDownloadProgressRingView *)self _updateShapePath];
}

- (_MPDownloadProgressRingView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_MPDownloadProgressRingView;
  objc_super v3 = -[_MPDownloadProgressRingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(_MPDownloadProgressRingView *)v3 setClipsToBounds:1];
    id v5 = [(_MPDownloadProgressRingView *)v4 layer];
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    [v5 setStrokeStart:0.0];
    id v7 = [(_MPDownloadProgressRingView *)v4 tintColor];
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    [v5 setLineCap:@"round"];
    [(_MPDownloadProgressRingView *)v4 _updateShapePath];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
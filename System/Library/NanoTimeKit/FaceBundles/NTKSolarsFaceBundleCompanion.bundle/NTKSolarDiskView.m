@interface NTKSolarDiskView
- (CLKDevice)device;
- (NTKSolarDiskView)initWithSize:(double)a3 forDevice:(id)a4;
- (UIView)sunDownView;
- (UIView)sunUpView;
- (double)horizonLine;
- (void)layoutSubviews;
- (void)setCenter:(CGPoint)a3;
- (void)setDevice:(id)a3;
- (void)setHorizonLine:(double)a3;
- (void)setSunDownView:(id)a3;
- (void)setSunUpView:(id)a3;
@end

@implementation NTKSolarDiskView

- (NTKSolarDiskView)initWithSize:(double)a3 forDevice:(id)a4
{
  id v6 = a4;
  v42.receiver = self;
  v42.super_class = (Class)NTKSolarDiskView;
  v7 = -[NTKSolarDiskView initWithFrame:](&v42, "initWithFrame:", 0.0, 0.0, a3, a3);
  v8 = v7;
  if (v7)
  {
    v9 = [(NTKSolarDiskView *)v7 layer];
    [v9 setAllowsGroupBlending:0];

    v10 = [(NTKSolarDiskView *)v8 layer];
    [v10 setAllowsGroupOpacity:0];

    [(NTKSolarDiskView *)v8 setDevice:v6];
    [(NTKSolarDiskView *)v8 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v6 screenScale];
    CGFloat v16 = v15;
    v43.CGFloat width = v12;
    v43.CGFloat height = v14;
    UIGraphicsBeginImageContextWithOptions(v43, 0, v16);
    CurrentContext = UIGraphicsGetCurrentContext();
    v18 = +[UIColor whiteColor];
    [v18 setFill];

    CGFloat v19 = a3 * 0.243243243;
    id v20 = +[UIColor whiteColor];
    v21 = (CGColor *)[v20 CGColor];
    v44.CGFloat width = CGSizeZero.width;
    v44.CGFloat height = CGSizeZero.height;
    CGContextSetShadowWithColor(CurrentContext, v44, v19, v21);

    [(NTKSolarDiskView *)v8 bounds];
    CGRect v47 = CGRectInset(v46, v19, v19);
    CGContextFillEllipseInRect(CurrentContext, v47);
    v22 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v23 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v22];
    sunUpView = v8->_sunUpView;
    v8->_sunUpView = v23;

    [(UIView *)v8->_sunUpView setContentMode:5];
    [(UIView *)v8->_sunUpView setClipsToBounds:1];
    [(NTKSolarDiskView *)v8 addSubview:v8->_sunUpView];
    [(NTKSolarDiskView *)v8 frame];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [v6 screenScale];
    CGFloat v30 = v29;
    v45.CGFloat width = v26;
    v45.CGFloat height = v28;
    UIGraphicsBeginImageContextWithOptions(v45, 0, v30);
    v31 = UIGraphicsGetCurrentContext();
    [(NTKSolarDiskView *)v8 bounds];
    CGRect v49 = CGRectInset(v48, v19, v19);
    CGFloat x = v49.origin.x;
    CGFloat y = v49.origin.y;
    CGFloat width = v49.size.width;
    CGFloat height = v49.size.height;
    v36 = +[UIColor whiteColor];
    [v36 setFill];

    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    CGContextFillEllipseInRect(v31, v50);
    v37 = +[UIColor blackColor];
    [v37 setFill];

    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    CGRect v52 = CGRectInset(v51, 1.5, 1.5);
    CGContextFillEllipseInRect(v31, v52);
    v38 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v39 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v38];
    sunDownView = v8->_sunDownView;
    v8->_sunDownView = v39;

    [(UIView *)v8->_sunDownView setContentMode:6];
    [(UIView *)v8->_sunDownView setClipsToBounds:1];
    [(NTKSolarDiskView *)v8 addSubview:v8->_sunDownView];
  }
  return v8;
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSolarDiskView;
  -[NTKSolarDiskView setCenter:](&v4, "setCenter:", a3.x, a3.y);
  [(NTKSolarDiskView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)NTKSolarDiskView;
  [(NTKSolarDiskView *)&v30 layoutSubviews];
  [(NTKSolarDiskView *)self horizonLine];
  double v4 = v3;
  [(NTKSolarDiskView *)self frame];
  double v29 = v4 - v5;
  [(NTKSolarDiskView *)self bounds];
  id v6 = [(NTKSolarDiskView *)self sunUpView];
  double height = CGSizeZero.height;
  objc_msgSend(v6, "sizeThatFits:", CGSizeZero.width, height);
  v8 = [(NTKSolarDiskView *)self device];
  CLKSizeCenteredInRectForDevice();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (v29 - v12 >= 0.0) {
    double v15 = v29 - v12;
  }
  else {
    double v15 = 0.0;
  }
  CGFloat v16 = [(NTKSolarDiskView *)self sunUpView];
  objc_msgSend(v16, "setFrame:", v10, v12, v14, v15);

  v17 = [(NTKSolarDiskView *)self sunDownView];
  objc_msgSend(v17, "sizeThatFits:", CGSizeZero.width, height);
  v18 = [(NTKSolarDiskView *)self device];
  CLKSizeCenteredInRectForDevice();
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  if (v26 - (v29 - v22) >= 0.0) {
    double v27 = v26 - (v29 - v22);
  }
  else {
    double v27 = 0.0;
  }
  CGFloat v28 = [(NTKSolarDiskView *)self sunDownView];
  objc_msgSend(v28, "setFrame:", v20, v29, v24, v27);
}

- (double)horizonLine
{
  return self->_horizonLine;
}

- (void)setHorizonLine:(double)a3
{
  self->_horizonLine = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (UIView)sunUpView
{
  return self->_sunUpView;
}

- (void)setSunUpView:(id)a3
{
}

- (UIView)sunDownView
{
  return self->_sunDownView;
}

- (void)setSunDownView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sunDownView, 0);
  objc_storeStrong((id *)&self->_sunUpView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
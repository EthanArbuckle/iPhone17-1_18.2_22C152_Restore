@interface NTKAlaskanButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NTKAlaskanButton)init;
- (id)_backgroundImage;
- (id)_foregroundImage;
- (void)_updateAssets;
- (void)layoutSubviews;
@end

@implementation NTKAlaskanButton

- (NTKAlaskanButton)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAlaskanButton;
  v2 = [(NTKAlaskanButton *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_assetGenerationSize = CGSizeZero;
    -[NTKAlaskanButton setBounds:](v2, "setBounds:", 0.0, 0.0, 29.0, 29.0);
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAlaskanButton;
  [(NTKAlaskanButton *)&v3 layoutSubviews];
  [(NTKAlaskanButton *)self _updateAssets];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(NTKAlaskanButton *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(NTKAlaskanButton *)self bounds];
  CGFloat v16 = v15 * -0.4;
  [(NTKAlaskanButton *)self bounds];
  CGFloat v18 = v17 * -0.4;
  v23.origin.CGFloat x = v8;
  v23.origin.CGFloat y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  CGRect v24 = CGRectInset(v23, v16, v18);
  CGFloat v19 = x;
  CGFloat v20 = y;

  return CGRectContainsPoint(v24, *(CGPoint *)&v19);
}

- (void)_updateAssets
{
  [(NTKAlaskanButton *)self bounds];
  if (v4 != self->_assetGenerationSize.width || v3 != self->_assetGenerationSize.height)
  {
    id v9 = [(NTKAlaskanButton *)self _foregroundImage];
    v6 = [(NTKAlaskanButton *)self _backgroundImage];
    [(NTKAlaskanButton *)self setImage:v9 forState:0];
    [(NTKAlaskanButton *)self setBackgroundImage:v6 forState:0];
    [(NTKAlaskanButton *)self bounds];
    self->_assetGenerationSize.width = v7;
    self->_assetGenerationSize.height = v8;
  }
}

- (id)_foregroundImage
{
  [(NTKAlaskanButton *)self bounds];
  double v4 = v3;
  [(NTKAlaskanButton *)self bounds];
  double v6 = v5;
  if (v4 >= v5) {
    double v7 = v5;
  }
  else {
    double v7 = v4;
  }
  double v8 = v7 * 2.5 / 29.0;
  double v9 = v7 * 0.5 - v8;
  CGFloat v10 = +[CAShapeLayer layer];
  double v11 = +[CAShapeLayer layer];
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v6, v4);
  objc_msgSend(v11, "setFrame:", v8, v8, v9 + v9, v9 + v9);
  [v11 setCornerRadius:v9];
  id v12 = +[UIColor whiteColor];
  objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

  [v10 addSublayer:v11];
  [v10 frame];
  v19.width = v13;
  v19.height = v14;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  [v10 renderInContext:UIGraphicsGetCurrentContext()];
  double v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGFloat v16 = [v15 imageWithRenderingMode:2];

  return v16;
}

- (id)_backgroundImage
{
  [(NTKAlaskanButton *)self bounds];
  double v4 = v3;
  [(NTKAlaskanButton *)self bounds];
  double v6 = v5;
  if (v4 >= v5) {
    double v7 = v5;
  }
  else {
    double v7 = v4;
  }
  double v8 = v7 * 0.0344827586;
  double v9 = v7 * 0.5 - v7 * 0.0344827586 * 0.5;
  CGFloat v10 = +[CAShapeLayer layer];
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v6, v4);
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6 * 0.5, v4 * 0.5, v9, 0.0, 6.28318531);
  id v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
  [v10 setLineWidth:v8];
  id v12 = +[UIColor whiteColor];
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

  id v13 = +[UIColor clearColor];
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v13, "CGColor"));

  [v10 frame];
  v20.width = v14;
  v20.height = v15;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  [v10 renderInContext:UIGraphicsGetCurrentContext()];
  CGFloat v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  double v17 = [v16 imageWithRenderingMode:2];

  return v17;
}

@end
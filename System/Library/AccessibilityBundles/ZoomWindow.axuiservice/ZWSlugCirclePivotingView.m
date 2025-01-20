@interface ZWSlugCirclePivotingView
- (BOOL)shouldUseRoundedRect;
- (CAShapeLayer)circleLayer;
- (ZWSlugCirclePivotingView)initWithFrame:(CGRect)a3;
- (double)_cornerRadiusForExpandedRing;
- (void)layoutSubviews;
- (void)setCircleLayer:(id)a3;
- (void)setShouldUseRoundedRect:(BOOL)a3;
@end

@implementation ZWSlugCirclePivotingView

- (ZWSlugCirclePivotingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ZWSlugCirclePivotingView;
  v3 = -[ZWSlugCirclePivotingView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CAShapeLayer layer];
    v5 = [(ZWSlugCirclePivotingView *)v3 layer];
    [v5 addSublayer:v4];

    [(ZWSlugCirclePivotingView *)v3 setCircleLayer:v4];
    id v6 = +[UIColor whiteColor];
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v6, "CGColor"));
  }
  return v3;
}

- (double)_cornerRadiusForExpandedRing
{
  v3 = [(ZWSlugCirclePivotingView *)self traitCollection];
  [v3 displayCornerRadius];
  if (v4 <= 0.0)
  {
    double v7 = 7.8;
  }
  else
  {
    v5 = [(ZWSlugCirclePivotingView *)self traitCollection];
    [v5 displayCornerRadius];
    double v7 = v6 / 5.0;
  }
  return v7 + -3.0;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)ZWSlugCirclePivotingView;
  [(ZWSlugCirclePivotingView *)&v27 layoutSubviews];
  [(ZWSlugCirclePivotingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = +[CABasicAnimation animationWithKeyPath:@"path"];
  v12 = [(ZWSlugCirclePivotingView *)self circleLayer];
  objc_msgSend(v11, "setFromValue:", objc_msgSend(v12, "path"));

  if ([(ZWSlugCirclePivotingView *)self shouldUseRoundedRect])
  {
    [(ZWSlugCirclePivotingView *)self _cornerRadiusForExpandedRing];
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToValue:", objc_msgSend(v14, "CGPath"));

    [(ZWSlugCirclePivotingView *)self _cornerRadiusForExpandedRing];
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v15);
  }
  else
  {
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v4, v6, v8, v10);
    id v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToValue:", objc_msgSend(v16, "CGPath"));

    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v4, v6, v8, v10);
  }
  id v17 = objc_claimAutoreleasedReturnValue();
  v18 = (const CGPath *)[v17 CGPath];

  [v11 setDuration:ZWDefaultZoomAnimationDuration()];
  v19 = [(ZWSlugCirclePivotingView *)self circleLayer];
  BOOL v20 = CGPathEqualToPath((CGPathRef)[v19 path], v18);

  if (!v20)
  {
    v21 = [(ZWSlugCirclePivotingView *)self circleLayer];
    [v21 addAnimation:v11 forKey:@"ZWCirclePath"];

    v22 = [(ZWSlugCirclePivotingView *)self circleLayer];
    [v22 setPath:v18];

    v23 = [(ZWSlugCirclePivotingView *)self circleLayer];
    objc_msgSend(v23, "setBounds:", v4, v6, v8, v10);

    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    double MidX = CGRectGetMidX(v28);
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    double MidY = CGRectGetMidY(v29);
    v26 = [(ZWSlugCirclePivotingView *)self circleLayer];
    objc_msgSend(v26, "setPosition:", MidX, MidY);
  }
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
}

- (BOOL)shouldUseRoundedRect
{
  return self->_shouldUseRoundedRect;
}

- (void)setShouldUseRoundedRect:(BOOL)a3
{
  self->_shouldUseRoundedRect = a3;
}

- (void).cxx_destruct
{
}

@end
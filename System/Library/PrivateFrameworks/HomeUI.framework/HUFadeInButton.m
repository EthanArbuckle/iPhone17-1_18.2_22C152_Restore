@interface HUFadeInButton
+ (id)button;
- (BOOL)shouldFadeRightToLeft;
- (CAGradientLayer)fadeLayer;
- (void)layoutSubviews;
- (void)setFadeLayer:(id)a3;
- (void)setShouldFadeRightToLeft:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HUFadeInButton

+ (id)button
{
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___HUFadeInButton;
  v2 = objc_msgSendSuper2(&v14, sel_buttonWithType_, 1);
  v3 = v2;
  if (v2)
  {
    v4 = [v2 traitCollection];
    v5 = _backgroundColorWithTraitCollection(v4);

    [v3 setBackgroundColor:v5];
    v6 = (objc_class *)MEMORY[0x1E4F39BD0];
    id v7 = v5;
    id v8 = objc_alloc_init(v6);
    v9 = _fadeInGradientWithColor(v7);

    [v8 setColors:v9];
    [v8 setLocations:&unk_1F19B58D0];
    objc_msgSend(v8, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v8, "setEndPoint:", 1.0, 0.5);
    [v3 setFadeLayer:v8];

    v10 = [v3 layer];
    v11 = [v3 fadeLayer];
    [v10 addSublayer:v11];

    v12 = [v3 layer];
    [v12 setMasksToBounds:0];
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUFadeInButton;
  [(HUFadeInButton *)&v8 traitCollectionDidChange:a3];
  v4 = [(HUFadeInButton *)self traitCollection];
  v5 = _backgroundColorWithTraitCollection(v4);

  [(HUFadeInButton *)self setBackgroundColor:v5];
  v6 = _fadeInGradientWithColor(v5);
  id v7 = [(HUFadeInButton *)self fadeLayer];
  [v7 setColors:v6];
}

- (void)setShouldFadeRightToLeft:(BOOL)a3
{
  if (self->_shouldFadeRightToLeft != a3)
  {
    self->_shouldFadeRightToLeft = a3;
    v4 = [(HUFadeInButton *)self fadeLayer];
    [v4 startPoint];
    double v6 = v5;
    double v8 = v7;

    v9 = [(HUFadeInButton *)self fadeLayer];
    [v9 endPoint];
    double v11 = v10;
    double v13 = v12;
    objc_super v14 = [(HUFadeInButton *)self fadeLayer];
    objc_msgSend(v14, "setStartPoint:", v11, v13);

    v15 = [(HUFadeInButton *)self fadeLayer];
    objc_msgSend(v15, "setEndPoint:", v6, v8);

    [(HUFadeInButton *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)HUFadeInButton;
  [(HUFadeInButton *)&v20 layoutSubviews];
  v3 = [(HUFadeInButton *)self titleLabel];
  v4 = [v3 font];
  [v4 lineHeight];
  double v6 = v5;

  double width = fmin(v6 + v6, 100.0);
  double v8 = [(HUFadeInButton *)self titleLabel];
  [v8 frame];
  double x = CGRectGetMinX(v21) - width;
  double v10 = [(HUFadeInButton *)self titleLabel];
  [v10 frame];
  double MinY = CGRectGetMinY(v22);
  double v12 = [(HUFadeInButton *)self titleLabel];
  [v12 frame];
  double Height = CGRectGetHeight(v23);

  if ([(HUFadeInButton *)self shouldFadeRightToLeft])
  {
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, -1.0, 1.0);
    [(HUFadeInButton *)self bounds];
    double MinX = CGRectGetMinX(v24);
    [(HUFadeInButton *)self bounds];
    CGFloat MaxX = CGRectGetMaxX(v25);
    CGAffineTransform v17 = v19;
    CGAffineTransformTranslate(&v18, &v17, -(MinX + MaxX), 0.0);
    CGAffineTransform v19 = v18;
    v26.origin.double x = x;
    v26.origin.y = MinY;
    v26.size.double width = width;
    v26.size.height = Height;
    CGRect v27 = CGRectApplyAffineTransform(v26, &v18);
    double x = v27.origin.x;
    double MinY = v27.origin.y;
    double width = v27.size.width;
    double Height = v27.size.height;
  }
  v16 = [(HUFadeInButton *)self fadeLayer];
  objc_msgSend(v16, "setFrame:", x, MinY, width, Height);
}

- (BOOL)shouldFadeRightToLeft
{
  return self->_shouldFadeRightToLeft;
}

- (CAGradientLayer)fadeLayer
{
  return (CAGradientLayer *)objc_getProperty(self, a2, 752, 1);
}

- (void)setFadeLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
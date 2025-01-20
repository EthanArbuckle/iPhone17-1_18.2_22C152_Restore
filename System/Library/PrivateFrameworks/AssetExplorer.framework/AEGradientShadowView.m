@interface AEGradientShadowView
+ (Class)layerClass;
- (AEGradientShadowView)initWithFrame:(CGRect)a3;
- (CAGradientLayer)gradientLayer;
- (void)_configureGradientLayer;
- (void)setGradientLayer:(id)a3;
@end

@implementation AEGradientShadowView

- (void).cxx_destruct
{
}

- (void)setGradientLayer:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)_configureGradientLayer
{
  v26[2] = *MEMORY[0x263EF8340];
  v3 = [(AEGradientShadowView *)self layer];
  gradientLayer = self->_gradientLayer;
  self->_gradientLayer = v3;

  [(AEGradientShadowView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(AEGradientShadowView *)self gradientLayer];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  uint64_t v14 = *MEMORY[0x263F15A20];
  v15 = [(AEGradientShadowView *)self gradientLayer];
  [v15 setCornerCurve:v14];

  v16 = [(AEGradientShadowView *)self gradientLayer];
  [v16 setMaskedCorners:15];

  v17 = [(AEGradientShadowView *)self gradientLayer];
  [v17 setAllowsGroupOpacity:0];

  v18 = [MEMORY[0x263F825C8] blackColor];
  v19 = [v18 colorWithAlphaComponent:0.2];

  id v20 = v19;
  v26[0] = [v20 CGColor];
  id v21 = [MEMORY[0x263F825C8] clearColor];
  v26[1] = [v21 CGColor];
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v23 = [(AEGradientShadowView *)self gradientLayer];
  [v23 setColors:v22];

  v24 = [(AEGradientShadowView *)self gradientLayer];
  objc_msgSend(v24, "setStartPoint:", 0.0, 0.0);

  v25 = [(AEGradientShadowView *)self gradientLayer];
  objc_msgSend(v25, "setEndPoint:", 1.0, 1.0);
}

- (AEGradientShadowView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AEGradientShadowView;
  v3 = -[AEGradientShadowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AEGradientShadowView *)v3 _configureGradientLayer];
    double v5 = [MEMORY[0x263F825C8] clearColor];
    [(AEGradientShadowView *)v4 setBackgroundColor:v5];

    [(AEGradientShadowView *)v4 setClipsToBounds:1];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
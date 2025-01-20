@interface CSPasscodeBackgroundView
- (CSPasscodeBackgroundView)initWithFrame:(CGRect)a3;
- (MTMaterialView)materialView;
- (UIColor)reduceTransparencyBackingColor;
- (UIView)lightenSourceOverView;
- (UIView)plusDView;
- (UIView)reduceTransparencyBackingView;
- (UIView)reduceTransparencyTintingView;
- (void)_setPlusDBackgroundColorWithWeighting:(double)a3;
- (void)layoutSubviews;
- (void)setLightenSourceOverView:(id)a3;
- (void)setMaterialView:(id)a3;
- (void)setPlusDView:(id)a3;
- (void)setReduceTransparencyBackingColor:(id)a3;
- (void)setReduceTransparencyBackingView:(id)a3;
- (void)setReduceTransparencyTintingView:(id)a3;
- (void)setWeighting:(double)a3;
@end

@implementation CSPasscodeBackgroundView

- (CSPasscodeBackgroundView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)CSPasscodeBackgroundView;
  v3 = -[CSPasscodeBackgroundView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      reduceTransparencyBackingView = v3->_reduceTransparencyBackingView;
      v3->_reduceTransparencyBackingView = v4;

      v6 = [MEMORY[0x1E4F428B8] whiteColor];
      [(CSPasscodeBackgroundView *)v3 setReduceTransparencyBackingColor:v6];

      [(CSPasscodeBackgroundView *)v3 addSubview:v3->_reduceTransparencyBackingView];
      v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      p_reduceTransparencyTintingView = &v3->_reduceTransparencyTintingView;
      reduceTransparencyTintingView = v3->_reduceTransparencyTintingView;
      v3->_reduceTransparencyTintingView = v7;

      v10 = v3->_reduceTransparencyTintingView;
      v11 = [MEMORY[0x1E4F428B8] blackColor];
      v12 = [v11 colorWithAlphaComponent:0.35];
      [(UIView *)v10 setBackgroundColor:v12];
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F743C8];
      v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v15 = [v13 materialViewWithRecipeNamed:@"dashBoardPasscodeBackground" inBundle:v14 options:0 initialWeighting:&__block_literal_global_17 scaleAdjustment:0.0];
      materialView = v3->_materialView;
      v3->_materialView = (MTMaterialView *)v15;

      [(MTMaterialView *)v3->_materialView setShouldCrossfade:1];
      [(CSPasscodeBackgroundView *)v3 addSubview:v3->_materialView];
      v17 = [(CSPasscodeBackgroundView *)v3 layer];
      [v17 setAllowsGroupBlending:0];

      v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      lightenSourceOverView = v3->_lightenSourceOverView;
      v3->_lightenSourceOverView = v18;

      v20 = v3->_lightenSourceOverView;
      v21 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.25];
      [(UIView *)v20 setBackgroundColor:v21];

      v22 = [(UIView *)v3->_lightenSourceOverView layer];
      v23 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A228]];
      [v22 setCompositingFilter:v23];

      [(CSPasscodeBackgroundView *)v3 addSubview:v3->_lightenSourceOverView];
      v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      p_reduceTransparencyTintingView = &v3->_plusDView;
      plusDView = v3->_plusDView;
      v3->_plusDView = v24;

      [(CSPasscodeBackgroundView *)v3 _setPlusDBackgroundColorWithWeighting:1.0];
      v11 = [(UIView *)v3->_plusDView layer];
      v12 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
      [v11 setCompositingFilter:v12];
    }

    [(CSPasscodeBackgroundView *)v3 addSubview:*p_reduceTransparencyTintingView];
  }
  return v3;
}

double __42__CSPasscodeBackgroundView_initWithFrame___block_invoke()
{
  return 0.5;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CSPasscodeBackgroundView;
  [(CSPasscodeBackgroundView *)&v11 layoutSubviews];
  [(CSPasscodeBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_reduceTransparencyBackingView, "setFrame:");
  -[UIView setFrame:](self->_reduceTransparencyTintingView, "setFrame:", v4, v6, v8, v10);
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_lightenSourceOverView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_plusDView, "setFrame:", v4, v6, v8, v10);
}

- (void)setReduceTransparencyBackingColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_reduceTransparencyBackingColor = &self->_reduceTransparencyBackingColor;
  if (self->_reduceTransparencyBackingColor != v5)
  {
    objc_super v11 = v5;
    objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, a3);
    if (*p_reduceTransparencyBackingColor)
    {
      double v7 = *p_reduceTransparencyBackingColor;
    }
    else
    {
      double v7 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    double v8 = v7;
    reduceTransparencyBackingView = self->_reduceTransparencyBackingView;
    double v10 = [(UIColor *)v7 colorWithAlphaComponent:1.0];
    [(UIView *)reduceTransparencyBackingView setBackgroundColor:v10];

    double v5 = v11;
  }
}

- (void)setWeighting:(double)a3
{
  -[UIView setAlpha:](self->_reduceTransparencyBackingView, "setAlpha:");
  [(UIView *)self->_reduceTransparencyTintingView setAlpha:a3];
  [(MTMaterialView *)self->_materialView setWeighting:a3];
  [(UIView *)self->_lightenSourceOverView setAlpha:a3];

  [(CSPasscodeBackgroundView *)self _setPlusDBackgroundColorWithWeighting:a3];
}

- (void)_setPlusDBackgroundColorWithWeighting:(double)a3
{
  plusDView = self->_plusDView;
  id v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:a3 * 0.2];
  [(UIView *)plusDView setBackgroundColor:v4];
}

- (UIColor)reduceTransparencyBackingColor
{
  return self->_reduceTransparencyBackingColor;
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (UIView)lightenSourceOverView
{
  return self->_lightenSourceOverView;
}

- (void)setLightenSourceOverView:(id)a3
{
}

- (UIView)plusDView
{
  return self->_plusDView;
}

- (void)setPlusDView:(id)a3
{
}

- (UIView)reduceTransparencyTintingView
{
  return self->_reduceTransparencyTintingView;
}

- (void)setReduceTransparencyTintingView:(id)a3
{
}

- (UIView)reduceTransparencyBackingView
{
  return self->_reduceTransparencyBackingView;
}

- (void)setReduceTransparencyBackingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceTransparencyBackingView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyTintingView, 0);
  objc_storeStrong((id *)&self->_plusDView, 0);
  objc_storeStrong((id *)&self->_lightenSourceOverView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);

  objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, 0);
}

@end
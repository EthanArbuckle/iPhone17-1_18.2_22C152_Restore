@interface AFUIPasscodeBlurView
- (AFUIPasscodeBlurView)initWithFrame:(CGRect)a3;
- (MTMaterialView)materialView;
- (UIView)lightenSourceOverView;
- (UIView)plusDView;
- (void)_setPlusDBackgroundColorWithWeighting:(double)a3;
- (void)layoutSubviews;
- (void)setLightenSourceOverView:(id)a3;
- (void)setMaterialView:(id)a3;
- (void)setPlusDView:(id)a3;
@end

@implementation AFUIPasscodeBlurView

- (AFUIPasscodeBlurView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)AFUIPasscodeBlurView;
  v3 = -[AFUIPasscodeBlurView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F53FE0];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v4 materialViewWithRecipeNamed:@"dashBoardPasscodeBackground" inBundle:v5 configuration:1 initialWeighting:&__block_literal_global_8 scaleAdjustment:1.0];
    materialView = v3->_materialView;
    v3->_materialView = (MTMaterialView *)v6;

    [(MTMaterialView *)v3->_materialView setShouldCrossfade:1];
    [(AFUIPasscodeBlurView *)v3 addSubview:v3->_materialView];
    v8 = [(AFUIPasscodeBlurView *)v3 layer];
    [v8 setAllowsGroupBlending:0];

    v9 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    lightenSourceOverView = v3->_lightenSourceOverView;
    v3->_lightenSourceOverView = v9;

    v11 = v3->_lightenSourceOverView;
    v12 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.25];
    [(UIView *)v11 setBackgroundColor:v12];

    v13 = [(UIView *)v3->_lightenSourceOverView layer];
    v14 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15CC0]];
    [v13 setCompositingFilter:v14];

    [(AFUIPasscodeBlurView *)v3 addSubview:v3->_lightenSourceOverView];
    v15 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    plusDView = v3->_plusDView;
    v3->_plusDView = v15;

    [(AFUIPasscodeBlurView *)v3 _setPlusDBackgroundColorWithWeighting:1.0];
    v17 = [(UIView *)v3->_plusDView layer];
    v18 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D50]];
    [v17 setCompositingFilter:v18];

    [(AFUIPasscodeBlurView *)v3 addSubview:v3->_plusDView];
  }
  return v3;
}

double __38__AFUIPasscodeBlurView_initWithFrame___block_invoke()
{
  return 0.5;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)AFUIPasscodeBlurView;
  [(AFUIPasscodeBlurView *)&v11 layoutSubviews];
  [(AFUIPasscodeBlurView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:");
  -[UIView setFrame:](self->_lightenSourceOverView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_plusDView, "setFrame:", v4, v6, v8, v10);
}

- (void)_setPlusDBackgroundColorWithWeighting:(double)a3
{
  plusDView = self->_plusDView;
  id v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:a3 * 0.2];
  [(UIView *)plusDView setBackgroundColor:v4];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusDView, 0);
  objc_storeStrong((id *)&self->_lightenSourceOverView, 0);

  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
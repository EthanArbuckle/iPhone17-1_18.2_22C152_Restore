@interface AFUISiriCompactDimmingView
- (AFUISiriCompactDimmingView)initWithFrame:(CGRect)a3;
- (BOOL)_isInAmbient;
- (id)ambientFadeToBlackView;
- (id)ambientMaterialView;
- (void)layoutSubviews;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation AFUISiriCompactDimmingView

- (AFUISiriCompactDimmingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriCompactDimmingView;
  v3 = -[AFUISiriCompactDimmingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AFUISiriCompactDimmingView *)v3 setAlpha:1.0];
    [(AFUISiriCompactDimmingView *)v4 setOpaque:0];
    [(AFUISiriCompactDimmingView *)v4 setUserInteractionEnabled:0];
    v5 = [MEMORY[0x263F825C8] clearColor];
    [(AFUISiriCompactDimmingView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_isVisible = a3;
  if ([(AFUISiriCompactDimmingView *)self _isInAmbient]) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  objc_super v7 = [MEMORY[0x263F825C8] _dimmingViewColor];
  }
  v8 = v7;
  if (v5)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F825C8] clearColor];
  }
  v10 = v9;
  BOOL v11 = [(AFUISiriCompactDimmingView *)self _isInAmbient];
  if (!v4)
  {
    [(AFUISiriCompactDimmingView *)self _isInAmbient];
    double v13 = 0.0;
LABEL_14:
    id v21 = [MEMORY[0x263F15890] animation];
    [v21 setKeyPath:@"backgroundColor"];
    v23 = [(AFUISiriCompactDimmingView *)self backgroundColor];
    [v21 setFromValue:v23];

    [v21 setToValue:v10];
    [v21 setMass:*MEMORY[0x263F744D0]];
    [v21 setStiffness:*MEMORY[0x263F744D8]];
    [v21 setDamping:*MEMORY[0x263F744C8]];
    v24 = [MEMORY[0x263F74478] defaultTimingFunction];
    [v21 setTimingFunction:v24];

    [v21 setDuration:v13];
    [(AFUISiriCompactDimmingView *)self addAnimation:v21 forKey:0];
    [(AFUISiriCompactDimmingView *)self setBackgroundColor:v10];
    goto LABEL_15;
  }
  [MEMORY[0x263F74478] animationDurationForStyle:0 presentationType:v11];
  double v13 = v12;
  if (![(AFUISiriCompactDimmingView *)self _isInAmbient]
    || !v5
    || !v4
    || [(AFUISiriCompactDimmingView *)self accessibilityReduceMotionEnabled])
  {
    goto LABEL_14;
  }
  v14 = [(AFUISiriCompactDimmingView *)self ambientMaterialView];
  [(AFUISiriCompactDimmingView *)self insertSubview:v14 atIndex:0];
  v15 = [(AFUISiriCompactDimmingView *)self ambientFadeToBlackView];
  [(AFUISiriCompactDimmingView *)self insertSubview:v15 atIndex:0];
  self->_isAnimatingBlur = 1;
  objc_initWeak(&location, self);
  double v16 = *MEMORY[0x263F744B8];
  double v17 = *MEMORY[0x263F744C0];
  double v18 = *MEMORY[0x263F744B0];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __50__AFUISiriCompactDimmingView_setVisible_animated___block_invoke;
  v30[3] = &unk_264692738;
  id v19 = v14;
  id v31 = v19;
  id v20 = v15;
  id v32 = v20;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __50__AFUISiriCompactDimmingView_setVisible_animated___block_invoke_2;
  v25[3] = &unk_264692D58;
  objc_copyWeak(&v29, &location);
  id v26 = v10;
  id v21 = v19;
  id v27 = v21;
  id v22 = v20;
  id v28 = v22;
  +[AFUIUtilities animateUsingSpringWithMass:v30 stiffness:v25 damping:v16 animations:v17 completion:v18];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

LABEL_15:
}

uint64_t __50__AFUISiriCompactDimmingView_setVisible_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWeighting:1.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:1.0];
}

void __50__AFUISiriCompactDimmingView_setVisible_animated___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    WeakRetained[409] = 0;
    [WeakRetained setBackgroundColor:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
}

- (id)ambientFadeToBlackView
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  [(AFUISiriCompactDimmingView *)self bounds];
  BOOL v4 = objc_msgSend(v3, "initWithFrame:");
  BOOL v5 = [MEMORY[0x263F825C8] blackColor];
  [v4 setBackgroundColor:v5];

  [v4 setAlpha:0.0];

  return v4;
}

- (id)ambientMaterialView
{
  id v3 = (void *)MEMORY[0x263F53FE0];
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v5 = [v3 materialViewWithRecipeNamed:@"fullScreenBannerBackground" inBundle:v4 options:0 initialWeighting:0 scaleAdjustment:0.0];

  [(AFUISiriCompactDimmingView *)self bounds];
  objc_msgSend(v5, "setFrame:");
  [v5 setAutoresizingMask:18];

  return v5;
}

- (BOOL)_isInAmbient
{
  v2 = [(AFUISiriCompactDimmingView *)self traitCollection];
  char v3 = [v2 isAmbientPresented];

  return v3;
}

- (void)layoutSubviews
{
  if ([(AFUISiriCompactDimmingView *)self _isInAmbient]) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  char v3 = [MEMORY[0x263F825C8] _dimmingViewColor];
  }
  id v6 = v3;
  if (self->_isVisible)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263F825C8] clearColor];
  }
  BOOL v5 = v4;
  if (!self->_isAnimatingBlur) {
    [(AFUISiriCompactDimmingView *)self setBackgroundColor:v4];
  }
}

@end
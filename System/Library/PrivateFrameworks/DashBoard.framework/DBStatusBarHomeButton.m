@interface DBStatusBarHomeButton
- (BOOL)isAccessibilityElement;
- (BOOL)isCompositingFilterEnabled;
- (BOOL)needsImageUpdates;
- (DBStatusBarHomeButton)initWithFrame:(CGRect)a3;
- (UIColor)focusHighlightColor;
- (UIImage)dashboardFocusedImage;
- (UIImage)dashboardImage;
- (UIImage)iconsFocusedImage;
- (UIImage)iconsImage;
- (UIImageView)focusedImageView;
- (UIImageView)imageView;
- (_DBStatusBarCloseView)closePunchthroughView;
- (unint64_t)displayState;
- (void)_setupImagesIfNecessary;
- (void)_traitEnvironmentDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateCompositingFilter;
- (void)_updateDisplayStateAnimated:(BOOL)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setClosePunchthroughView:(id)a3;
- (void)setCompositingFilterEnabled:(BOOL)a3;
- (void)setDashboardFocusedImage:(id)a3;
- (void)setDashboardImage:(id)a3;
- (void)setDisplayState:(unint64_t)a3;
- (void)setFocusHighlightColor:(id)a3;
- (void)setFocusedImageView:(id)a3;
- (void)setIconsFocusedImage:(id)a3;
- (void)setIconsImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setNeedsImageUpdates:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation DBStatusBarHomeButton

- (DBStatusBarHomeButton)initWithFrame:(CGRect)a3
{
  v63[14] = *MEMORY[0x263EF8340];
  v61.receiver = self;
  v61.super_class = (Class)DBStatusBarHomeButton;
  v3 = -[DBStatusBarHomeButton initWithFrame:](&v61, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(DBStatusBarHomeButton *)v3 setAccessibilityIdentifier:@"CARStatusBarHomeButton"];
    v5 = [(DBStatusBarHomeButton *)v4 layer];
    [v5 setAllowsGroupBlending:0];

    id v6 = objc_alloc(MEMORY[0x263F82828]);
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setContentMode:4];
    [(DBStatusBarHomeButton *)v4 addSubview:v11];
    objc_storeStrong((id *)&v4->_imageView, v11);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v7, v8, v9, v10);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 setContentMode:4];
    [v12 setHidden:1];
    [(DBStatusBarHomeButton *)v4 addSubview:v12];
    objc_storeStrong((id *)&v4->_focusedImageView, v12);
    v13 = objc_alloc_init(_DBStatusBarCloseView);
    [(_DBStatusBarCloseView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_DBStatusBarCloseView *)v13 setHidden:1];
    [(DBStatusBarHomeButton *)v4 addSubview:v13];
    objc_storeStrong((id *)&v4->_closePunchthroughView, v13);
    v41 = (void *)MEMORY[0x263F08938];
    v60 = [(DBStatusBarHomeButton *)v4 widthAnchor];
    v58 = [v60 constraintEqualToConstant:45.0];
    v63[0] = v58;
    v57 = [(DBStatusBarHomeButton *)v4 heightAnchor];
    v56 = [v57 constraintEqualToConstant:45.0];
    v63[1] = v56;
    v55 = [v11 widthAnchor];
    v54 = [(DBStatusBarHomeButton *)v4 widthAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v63[2] = v53;
    v52 = [v11 heightAnchor];
    v50 = [(DBStatusBarHomeButton *)v4 heightAnchor];
    v49 = [v52 constraintEqualToAnchor:v50];
    v63[3] = v49;
    v59 = v11;
    v48 = [v11 centerXAnchor];
    v47 = [(DBStatusBarHomeButton *)v4 centerXAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v63[4] = v46;
    v45 = [v11 centerYAnchor];
    v44 = [(DBStatusBarHomeButton *)v4 centerYAnchor];
    v42 = [v45 constraintEqualToAnchor:v44];
    v63[5] = v42;
    v40 = [v12 widthAnchor];
    v39 = [(DBStatusBarHomeButton *)v4 widthAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v63[6] = v38;
    v37 = [v12 heightAnchor];
    v36 = [(DBStatusBarHomeButton *)v4 heightAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v63[7] = v35;
    v51 = v12;
    v34 = [v12 centerXAnchor];
    v33 = [(DBStatusBarHomeButton *)v4 centerXAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v63[8] = v32;
    v31 = [v12 centerYAnchor];
    v30 = [(DBStatusBarHomeButton *)v4 centerYAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v63[9] = v29;
    v14 = v13;
    v28 = [(_DBStatusBarCloseView *)v13 widthAnchor];
    v27 = [v28 constraintEqualToConstant:22.0];
    v63[10] = v27;
    v15 = [(_DBStatusBarCloseView *)v13 heightAnchor];
    v16 = [v15 constraintEqualToConstant:22.0];
    v63[11] = v16;
    v43 = v13;
    v17 = [(_DBStatusBarCloseView *)v13 centerXAnchor];
    v18 = [(DBStatusBarHomeButton *)v4 centerXAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v63[12] = v19;
    v20 = [(_DBStatusBarCloseView *)v14 centerYAnchor];
    v21 = [(DBStatusBarHomeButton *)v4 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v63[13] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:14];
    [v41 activateConstraints:v23];

    [(DBStatusBarHomeButton *)v4 _setupImagesIfNecessary];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    v62[2] = objc_opt_class();
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:3];
    id v25 = (id)[(DBStatusBarHomeButton *)v4 registerForTraitChanges:v24 withTarget:v4 action:sel__traitEnvironmentDidChange_previousTraitCollection_];
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setFocusHighlightColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_focusHighlightColor = &self->_focusHighlightColor;
  if (self->_focusHighlightColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_focusHighlightColor, a3);
    p_focusHighlightColor = (UIColor **)[(DBStatusBarHomeButton *)self _updateDisplayStateAnimated:0];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_focusHighlightColor, v5);
}

- (void)setCompositingFilterEnabled:(BOOL)a3
{
  if (self->_compositingFilterEnabled != a3)
  {
    self->_compositingFilterEnabled = a3;
    [(DBStatusBarHomeButton *)self _updateDisplayStateAnimated:0];
  }
}

- (void)_traitEnvironmentDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v12 = a4;
  v5 = [(DBStatusBarHomeButton *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];
  if (v6 != [v12 userInterfaceIdiom])
  {

    goto LABEL_5;
  }
  double v7 = [(DBStatusBarHomeButton *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;
  [v12 displayScale];
  double v11 = v10;

  if (v9 != v11) {
LABEL_5:
  }
    [(DBStatusBarHomeButton *)self setNeedsImageUpdates:1];
  [(DBStatusBarHomeButton *)self _setupImagesIfNecessary];
  [(DBStatusBarHomeButton *)self _updateDisplayStateAnimated:0];
}

- (void)_setupImagesIfNecessary
{
  id v21 = [(DBStatusBarHomeButton *)self traitCollection];
  if ([v21 userInterfaceIdiom] == 3)
  {
    uint64_t v3 = [(DBStatusBarHomeButton *)self iconsImage];
    if (v3)
    {
      v4 = (void *)v3;
      BOOL v5 = [(DBStatusBarHomeButton *)self needsImageUpdates];

      if (!v5) {
        return;
      }
    }
    else
    {
    }
    uint64_t v6 = (void *)MEMORY[0x263F827E8];
    double v7 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    double v8 = [(DBStatusBarHomeButton *)self traitCollection];
    double v9 = [v6 imageNamed:@"CarStatusBarIconsHomeButton" inBundle:v7 compatibleWithTraitCollection:v8];
    [(DBStatusBarHomeButton *)self setIconsImage:v9];

    double v10 = (void *)MEMORY[0x263F827E8];
    double v11 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    id v12 = [(DBStatusBarHomeButton *)self traitCollection];
    v13 = [v10 imageNamed:@"CarStatusBarDashboardHomeButton" inBundle:v11 compatibleWithTraitCollection:v12];
    [(DBStatusBarHomeButton *)self setDashboardImage:v13];

    v14 = (void *)MEMORY[0x263F827E8];
    v15 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    v16 = [(DBStatusBarHomeButton *)self traitCollection];
    v17 = [v14 imageNamed:@"CarStatusBarIconsHomeButtonFocused" inBundle:v15 compatibleWithTraitCollection:v16];
    [(DBStatusBarHomeButton *)self setIconsFocusedImage:v17];

    v18 = (void *)MEMORY[0x263F827E8];
    id v21 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    v19 = [(DBStatusBarHomeButton *)self traitCollection];
    v20 = [v18 imageNamed:@"CarStatusBarDashboardHomeButtonFocused" inBundle:v21 compatibleWithTraitCollection:v19];
    [(DBStatusBarHomeButton *)self setDashboardFocusedImage:v20];
  }
}

- (void)_updateDisplayStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v38[1] = *MEMORY[0x263EF8340];
  BOOL v5 = [(DBStatusBarHomeButton *)self iconsImage];
  uint64_t v6 = [(DBStatusBarHomeButton *)self iconsFocusedImage];
  if ([(DBStatusBarHomeButton *)self displayState] == 1)
  {
    uint64_t v7 = [(DBStatusBarHomeButton *)self dashboardImage];

    uint64_t v8 = [(DBStatusBarHomeButton *)self dashboardFocusedImage];

    [(DBStatusBarHomeButton *)self setAccessibilityLabel:@"CarStatusBarDashboardHomeButton"];
    double v9 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    double v10 = [v9 localizedStringForKey:@"DASHBOARD" value:&stru_26E13A820 table:@"CarPlayApp"];
    v38[0] = v10;
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
    [(DBStatusBarHomeButton *)self setAccessibilityUserInputLabels:v11];

    BOOL v5 = (void *)v7;
    uint64_t v6 = (void *)v8;
  }
  else if ([(DBStatusBarHomeButton *)self displayState])
  {
    if ([(DBStatusBarHomeButton *)self displayState] == 2)
    {

      id v12 = [(DBStatusBarHomeButton *)self closePunchthroughView];
      [v12 setAlpha:0.0];

      v13 = [(DBStatusBarHomeButton *)self closePunchthroughView];
      [v13 setHidden:0];

      BOOL v5 = 0;
      uint64_t v6 = 0;
    }
  }
  else
  {
    [(DBStatusBarHomeButton *)self setAccessibilityLabel:@"CarStatusBarIconsHomeButton"];
    v14 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    v15 = [v14 localizedStringForKey:@"APPS" value:&stru_26E13A820 table:@"CarPlayApp"];
    v37 = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
    [(DBStatusBarHomeButton *)self setAccessibilityUserInputLabels:v16];
  }
  v17 = [MEMORY[0x263F825C8] labelColor];
  v18 = [v5 imageWithTintColor:v17];

  v19 = [(DBStatusBarHomeButton *)self focusHighlightColor];
  v20 = [v6 imageWithTintColor:v19];

  if (v3)
  {
    id v21 = (void *)MEMORY[0x263F82E00];
    v22 = [(DBStatusBarHomeButton *)self imageView];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __53__DBStatusBarHomeButton__updateDisplayStateAnimated___block_invoke;
    v35[3] = &unk_2649B3D30;
    v35[4] = self;
    id v36 = v18;
    [v21 transitionWithView:v22 duration:5242880 options:v35 animations:0 completion:0.4];

    v23 = (void *)MEMORY[0x263F82E00];
    v24 = [(DBStatusBarHomeButton *)self focusedImageView];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __53__DBStatusBarHomeButton__updateDisplayStateAnimated___block_invoke_2;
    v33[3] = &unk_2649B3D30;
    v33[4] = self;
    id v34 = v20;
    [v23 transitionWithView:v24 duration:5242880 options:v33 animations:0 completion:0.4];

    v31[4] = self;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __53__DBStatusBarHomeButton__updateDisplayStateAnimated___block_invoke_3;
    v32[3] = &unk_2649B3E90;
    v32[4] = self;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __53__DBStatusBarHomeButton__updateDisplayStateAnimated___block_invoke_4;
    v31[3] = &unk_2649B3FA8;
    [MEMORY[0x263F82E00] animateWithDuration:v32 animations:v31 completion:0.4];
  }
  else
  {
    id v25 = [(DBStatusBarHomeButton *)self imageView];
    [v25 setImage:v18];

    v26 = [(DBStatusBarHomeButton *)self focusedImageView];
    [v26 setImage:v20];

    v27 = [(DBStatusBarHomeButton *)self closePunchthroughView];
    unint64_t v28 = [(DBStatusBarHomeButton *)self displayState];
    double v29 = 0.0;
    if (v28 == 2) {
      double v29 = 1.0;
    }
    [v27 setAlpha:v29];

    v30 = [(DBStatusBarHomeButton *)self closePunchthroughView];
    objc_msgSend(v30, "setHidden:", -[DBStatusBarHomeButton displayState](self, "displayState") != 2);

    [(DBStatusBarHomeButton *)self _updateCompositingFilter];
  }
}

void __53__DBStatusBarHomeButton__updateDisplayStateAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:*(void *)(a1 + 40)];
}

uint64_t __53__DBStatusBarHomeButton__updateDisplayStateAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) focusedImageView];
  [v2 setImage:*(void *)(a1 + 40)];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 _updateCompositingFilter];
}

void __53__DBStatusBarHomeButton__updateDisplayStateAnimated___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) closePunchthroughView];
  uint64_t v2 = [*(id *)(a1 + 32) displayState];
  double v3 = 0.0;
  if (v2 == 2) {
    double v3 = 1.0;
  }
  [v4 setAlpha:v3];
}

void __53__DBStatusBarHomeButton__updateDisplayStateAnimated___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) closePunchthroughView];
  objc_msgSend(v2, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "displayState") != 2);
}

- (void)_updateCompositingFilter
{
  if ([(DBStatusBarHomeButton *)self isCompositingFilterEnabled])
  {
    double v3 = [(DBStatusBarHomeButton *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    if (v4 == 1) {
      BOOL v5 = (void *)MEMORY[0x263F15D50];
    }
    else {
      BOOL v5 = (void *)MEMORY[0x263F15D58];
    }
    id v8 = [MEMORY[0x263F157C8] filterWithType:*v5];
    uint64_t v6 = [(DBStatusBarHomeButton *)self focusedImageView];
    uint64_t v7 = [v6 layer];
    [v7 setCompositingFilter:v8];
  }
  else
  {
    id v8 = [(DBStatusBarHomeButton *)self focusedImageView];
    uint64_t v6 = [v8 layer];
    [v6 setCompositingFilter:0];
  }
}

- (void)setDisplayState:(unint64_t)a3
{
  if (self->_displayState != a3)
  {
    self->_displayState = a3;
    BOOL v4 = !UIAccessibilityIsReduceMotionEnabled();
    [(DBStatusBarHomeButton *)self _updateDisplayStateAnimated:v4];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DBStatusBarHomeButton;
  [(DBStatusBarHomeButton *)&v9 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  [(DBStatusBarHomeButton *)self _updateDisplayStateAnimated:0];
  uint64_t v5 = [(DBStatusBarHomeButton *)self isFocused];
  uint64_t v6 = [(DBStatusBarHomeButton *)self imageView];
  [v6 setHidden:v5];

  uint64_t v7 = [(DBStatusBarHomeButton *)self isFocused] ^ 1;
  id v8 = [(DBStatusBarHomeButton *)self focusedImageView];
  [v8 setHidden:v7];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DBStatusBarHomeButton;
  id v6 = a3;
  [(DBStatusBarHomeButton *)&v9 touchesBegan:v6 withEvent:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = ___DBTouchesContainsTouchType_block_invoke;
  v10[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v10[4] = 0;
  uint64_t v7 = [v6 objectsPassingTest:v10];

  uint64_t v8 = [v7 count];
  if (v8) {
    [(DBStatusBarHomeButton *)self setAlpha:0.3];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DBStatusBarHomeButton;
  [(DBStatusBarHomeButton *)&v5 touchesEnded:a3 withEvent:a4];
  [(DBStatusBarHomeButton *)self setAlpha:1.0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DBStatusBarHomeButton;
  [(DBStatusBarHomeButton *)&v5 touchesCancelled:a3 withEvent:a4];
  [(DBStatusBarHomeButton *)self setAlpha:1.0];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DBStatusBarHomeButton;
  id v6 = a3;
  [(DBStatusBarHomeButton *)&v9 pressesBegan:v6 withEvent:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = ___DBPressesContainsPressType_block_invoke_0;
  v10[3] = &__block_descriptor_40_e21_B24__0__UIPress_8_B16l;
  v10[4] = 4;
  uint64_t v7 = [v6 objectsPassingTest:v10];

  uint64_t v8 = [v7 count];
  if (v8)
  {
    [(DBStatusBarHomeButton *)self sendActionsForControlEvents:0x1000000];
    [(DBStatusBarHomeButton *)self setAlpha:0.3];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DBStatusBarHomeButton;
  id v6 = a3;
  [(DBStatusBarHomeButton *)&v9 pressesEnded:v6 withEvent:a4];
  [(DBStatusBarHomeButton *)self setAlpha:1.0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = ___DBPressesContainsPressType_block_invoke_0;
  v10[3] = &__block_descriptor_40_e21_B24__0__UIPress_8_B16l;
  v10[4] = 4;
  uint64_t v7 = [v6 objectsPassingTest:v10];

  uint64_t v8 = [v7 count];
  if (v8) {
    [(DBStatusBarHomeButton *)self sendActionsForControlEvents:0x2000000];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DBStatusBarHomeButton;
  [(DBStatusBarHomeButton *)&v5 pressesCancelled:a3 withEvent:a4];
  [(DBStatusBarHomeButton *)self setAlpha:1.0];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIColor)focusHighlightColor
{
  return self->_focusHighlightColor;
}

- (BOOL)isCompositingFilterEnabled
{
  return self->_compositingFilterEnabled;
}

- (unint64_t)displayState
{
  return self->_displayState;
}

- (BOOL)needsImageUpdates
{
  return self->_needsImageUpdates;
}

- (void)setNeedsImageUpdates:(BOOL)a3
{
  self->_needsImageUpdates = a3;
}

- (UIImage)iconsImage
{
  return self->_iconsImage;
}

- (void)setIconsImage:(id)a3
{
}

- (UIImage)dashboardImage
{
  return self->_dashboardImage;
}

- (void)setDashboardImage:(id)a3
{
}

- (UIImage)iconsFocusedImage
{
  return self->_iconsFocusedImage;
}

- (void)setIconsFocusedImage:(id)a3
{
}

- (UIImage)dashboardFocusedImage
{
  return self->_dashboardFocusedImage;
}

- (void)setDashboardFocusedImage:(id)a3
{
}

- (UIImageView)focusedImageView
{
  return self->_focusedImageView;
}

- (void)setFocusedImageView:(id)a3
{
}

- (_DBStatusBarCloseView)closePunchthroughView
{
  return self->_closePunchthroughView;
}

- (void)setClosePunchthroughView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closePunchthroughView, 0);
  objc_storeStrong((id *)&self->_focusedImageView, 0);
  objc_storeStrong((id *)&self->_dashboardFocusedImage, 0);
  objc_storeStrong((id *)&self->_iconsFocusedImage, 0);
  objc_storeStrong((id *)&self->_dashboardImage, 0);
  objc_storeStrong((id *)&self->_iconsImage, 0);
  objc_storeStrong((id *)&self->_focusHighlightColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
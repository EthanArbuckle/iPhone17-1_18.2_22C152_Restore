@interface _SFToolbar
+ (BOOL)_deviceSupportsMinibars;
- (BOOL)isMinibar;
- (BOOL)usesLegacyDarkBackdrop;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)backdropGroupName;
- (UIView)superviewOwningLayout;
- (_SFBarRegistrationToken)barRegistration;
- (_SFBarTheme)theme;
- (_SFToolbar)initWithPlacement:(int64_t)a3;
- (_SFToolbar)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4;
- (double)_contentMargin;
- (double)baselineOffsetAdjustment;
- (id)popoverSourceInfoForBarItem:(int64_t)a3;
- (int64_t)placement;
- (void)_cancelLinkAnimations;
- (void)_updateBackgroundViewEffects;
- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8;
- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4;
- (void)dealloc;
- (void)didChangeArrangedBarItems:(id)a3;
- (void)didCompleteBarRegistrationWithToken:(id)a3;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setBarRegistration:(id)a3;
- (void)setItems:(id)a3 animated:(BOOL)a4;
- (void)setSuperviewOwningLayout:(id)a3;
- (void)setTheme:(id)a3;
- (void)setUsesLegacyDarkBackdrop:(BOOL)a3;
@end

@implementation _SFToolbar

- (BOOL)isMinibar
{
  return 0;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_SFToolbar;
  [(_SFToolbar *)&v6 layoutSubviews];
  _SFOnePixel();
  separator = self->_separator;
  double v5 = -v4;
  [(_SFToolbar *)self bounds];
  -[UIView setFrame:](separator, "setFrame:", 0.0, v5);
}

- (void)didChangeArrangedBarItems:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superviewOwningLayout);
  [WeakRetained setNeedsLayout];
}

- (double)_contentMargin
{
  if (![(_SFToolbar *)self placement]) {
    return 0.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SFToolbar;
  [(_SFToolbar *)&v4 _contentMargin];
  return result;
}

- (int64_t)placement
{
  return self->_placement;
}

- (void)didCompleteBarRegistrationWithToken:(id)a3
{
}

- (void)setUsesLegacyDarkBackdrop:(BOOL)a3
{
  if (self->_usesLegacyDarkBackdrop != a3)
  {
    self->_usesLegacyDarkBackdrop = a3;
    [(_SFToolbar *)self _updateBackgroundViewEffects];
  }
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_SFToolbar;
  [(_SFToolbar *)&v5 setItems:a3 animated:a4];
  [(_SFToolbar *)self _cancelLinkAnimations];
}

- (void)_cancelLinkAnimations
{
  id v2 = [(_SFToolbar *)self window];
  objc_msgSend(MEMORY[0x1E4FB1EB0], "_sf_cancelLinkAnimationsOnSourceWindow:destinationWindow:", v2, v2);
}

- (_SFToolbar)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4
{
  BOOL v4 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_SFToolbar;
  objc_super v6 = -[_SFToolbar initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_placement = a3;
    if (a3) {
      v8 = @"BottomBrowserToolbar";
    }
    else {
      v8 = @"TopBrowserToolbar";
    }
    [(_SFToolbar *)v6 setAccessibilityIdentifier:v8];
    v9 = [(_SFToolbar *)v7 layer];
    [v9 setAllowsGroupOpacity:0];

    if (v4)
    {
      [(_SFToolbar *)v7 setBackgroundColor:0];
      [(_SFToolbar *)v7 setTranslucent:1];
      id v10 = objc_alloc_init(MEMORY[0x1E4FB1818]);
      [(_SFToolbar *)v7 setBackgroundImage:v10 forToolbarPosition:0 barMetrics:0];

      [(_SFToolbar *)v7 _setHidesShadow:1];
    }
    else
    {
      v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      separator = v7->_separator;
      v7->_separator = v11;

      v13 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineShadowColor");
      [(UIView *)v7->_separator setBackgroundColor:v13];

      [(_SFToolbar *)v7 addSubview:v7->_separator];
      id v14 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      id v15 = objc_alloc(MEMORY[0x1E4FB1F00]);
      v16 = [MEMORY[0x1E4FB14C8] effectWithStyle:1100];
      uint64_t v17 = [v15 initWithEffect:v16];
      backgroundView = v7->_backgroundView;
      v7->_backgroundView = (UIVisualEffectView *)v17;

      [(UIVisualEffectView *)v7->_backgroundView setAutoresizingMask:18];
      [v14 addSubview:v7->_backgroundView];
      [(_SFToolbar *)v7 _setBackgroundView:v14];
    }
    v19 = v7;
  }

  return v7;
}

- (_SFToolbar)initWithPlacement:(int64_t)a3
{
  return [(_SFToolbar *)self initWithPlacement:a3 hideBackground:a3 == 0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SFToolbar;
  -[_SFToolbar sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  double v6 = fmax(v5, 44.0);
  if (self->_placement == 1) {
    double v5 = v6;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)dealloc
{
  [(_SFToolbar *)self _cancelLinkAnimations];
  v3.receiver = self;
  v3.super_class = (Class)_SFToolbar;
  [(_SFToolbar *)&v3 dealloc];
}

- (void)_updateBackgroundViewEffects
{
  if (self->_usesLegacyDarkBackdrop)
  {
    objc_super v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:2];
    [(UIVisualEffectView *)self->_backgroundView setEffect:v3];

    id v6 = [(UIVisualEffectView *)self->_backgroundView contentView];
    [v6 setBackgroundColor:0];
  }
  else
  {
    theme = self->_theme;
    backgroundView = self->_backgroundView;
    [(_SFBarTheme *)theme applyBackdropEffectsToView:backgroundView];
  }
}

- (double)baselineOffsetAdjustment
{
  double v3 = 0.0;
  if ([(id)objc_opt_class() _deviceSupportsMinibars])
  {
    double v4 = [(_SFToolbar *)self window];
    double v5 = [v4 windowScene];
    if ((unint64_t)([v5 interfaceOrientation] - 3) >= 2) {
      double v3 = 0.0;
    }
    else {
      double v3 = 1.0;
    }
  }
  return v3;
}

+ (BOOL)_deviceSupportsMinibars
{
  if (_deviceSupportsMinibars_onceToken != -1) {
    dispatch_once(&_deviceSupportsMinibars_onceToken, &__block_literal_global_18);
  }
  return _deviceSupportsMinibars_deviceSupportsMinibars;
}

- (void)setBackdropGroupName:(id)a3
{
}

- (NSString)backdropGroupName
{
  return (NSString *)[(UIVisualEffectView *)self->_backgroundView _groupName];
}

- (void)setTheme:(id)a3
{
  double v5 = (_SFBarTheme *)a3;
  p_theme = &self->_theme;
  theme = self->_theme;
  if (theme != v5)
  {
    v12 = v5;
    BOOL v8 = [(_SFBarTheme *)theme isEqual:v5];
    double v5 = v12;
    if (!v8)
    {
      objc_storeStrong((id *)&self->_theme, a3);
      [(_SFToolbar *)self _setOverrideUserInterfaceStyle:[(_SFBarTheme *)*p_theme overrideUserInterfaceStyle]];
      BOOL v9 = [(_SFBarTheme *)*p_theme backdropIsDark];
      [(_SFToolbar *)self _updateBackgroundViewEffects];
      if ([(_SFToolbar *)self placement] == 1) {
        [(UIView *)self->_separator setAlpha:(double)!v9];
      }
      id v10 = [(_SFBarTheme *)v12 controlsTintColor];
      [(_SFToolbar *)self setTintColor:v10];

      if ([(_SFBarTheme *)v12 backdropIsDark]) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 1;
      }
      [(_SFToolbar *)self _accessibilitySetInterfaceStyleIntent:v11];
      double v5 = v12;
    }
  }
}

- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  BOOL v8 = [(_SFToolbar *)self placement] == 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistration);
  id v10 = [WeakRetained UIBarButtonItemForItem:3];
  id v17 = [v10 view];

  uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
  v12 = _SFSafariIconLinkImage();
  [v17 bounds];
  objc_msgSend(v11, "_sf_animateLinkImage:withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v12, v8, v7, v17, 0, 0, x, y, v13, v14, v15, v16);
}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  int64_t v20 = [(_SFToolbar *)self placement];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistration);
  v22 = [WeakRetained UIBarButtonItemForItem:a6];
  v23 = [v22 view];

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E4FB1EB0];
    [v23 bounds];
    objc_msgSend(v24, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a3, v20 == 0, v17, v23, v18, v19, x, y, width, height, v25, v26, v27, v28);
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __117___SFToolbar_animateLinkImage_fromRect_inView_toBarItem_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke;
    v29[3] = &unk_1E5C73668;
    id v30 = v18;
    id v31 = v19;
    dispatch_async(MEMORY[0x1E4F14428], v29);
  }
}

- (id)popoverSourceInfoForBarItem:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistration);
  double v5 = [WeakRetained popoverSourceInfoForItem:a3];

  return v5;
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (BOOL)usesLegacyDarkBackdrop
{
  return self->_usesLegacyDarkBackdrop;
}

- (_SFBarRegistrationToken)barRegistration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistration);

  return (_SFBarRegistrationToken *)WeakRetained;
}

- (void)setBarRegistration:(id)a3
{
}

- (UIView)superviewOwningLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superviewOwningLayout);

  return (UIView *)WeakRetained;
}

- (void)setSuperviewOwningLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_superviewOwningLayout);
  objc_destroyWeak((id *)&self->_barRegistration);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_customBackdropEffect, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
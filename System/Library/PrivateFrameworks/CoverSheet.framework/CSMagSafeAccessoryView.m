@interface CSMagSafeAccessoryView
- (CSMagSafeAccessoryConfiguration)configuration;
- (CSMagSafeAccessoryView)initWithFrame:(CGRect)a3;
- (_UILegibilitySettings)legibilitySettings;
- (double)animationDurationBeforeDismissal;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
- (void)setLegibilitySettings:(id)a3;
@end

@implementation CSMagSafeAccessoryView

- (CSMagSafeAccessoryView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessoryView;
  v3 = -[CSMagSafeAccessoryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CSMagSafeAccessoryConfiguration defaultConfiguration];
    [(CSMagSafeAccessoryView *)v3 setConfiguration:v4];
  }
  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CSMagSafeAccessoryView;
  [(CSMagSafeAccessoryView *)&v12 layoutSubviews];
  v3 = [(CSMagSafeAccessoryView *)self superview];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CSMagSafeAccessoryView setFrame:](self, "setFrame:", v5, v7, v9, v11);
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)objc_storeStrong((id *)p_legibilitySettings, a3); {
}
  }

- (CSMagSafeAccessoryConfiguration)configuration
{
  return self->_configuration;
}

- (double)animationDurationBeforeDismissal
{
  return 0.0;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
@interface CSMainPageView
- (BOOL)fakeWallpaperVisible;
- (CSVibrantWallpaperButton)logoutButtonView;
- (SBWallpaperEffectView)wallpaperEffectView;
- (UIEdgeInsets)_logoutButtonInsets;
- (id)presentationRegions;
- (void)_layoutLogoutButtonView;
- (void)_layoutWallpaperEffectView;
- (void)_updateLogoutButtonForLegibilitySettings;
- (void)layoutSubviews;
- (void)setFakeWallpaperVisible:(BOOL)a3;
- (void)setLogoutButtonView:(id)a3;
- (void)setWallpaperEffectView:(id)a3;
- (void)updateForLegibilitySettings:(id)a3;
- (void)updateForPresentation:(id)a3;
@end

@implementation CSMainPageView

- (void)setLogoutButtonView:(id)a3
{
  v5 = (CSVibrantWallpaperButton *)a3;
  p_logoutButtonView = &self->_logoutButtonView;
  logoutButtonView = self->_logoutButtonView;
  if (logoutButtonView != v5)
  {
    v8 = v5;
    [(CSVibrantWallpaperButton *)logoutButtonView removeFromSuperview];
    objc_storeStrong((id *)&self->_logoutButtonView, a3);
    if (*p_logoutButtonView)
    {
      -[CSMainPageView addSubview:](self, "addSubview:");
      [(CSVibrantWallpaperButton *)*p_logoutButtonView sizeToFit];
      [(CSMainPageView *)self _updateLogoutButtonForLegibilitySettings];
    }
    logoutButtonView = (CSVibrantWallpaperButton *)[(CSMainPageView *)self setNeedsLayout];
    v5 = v8;
  }

  MEMORY[0x1F41817F8](logoutButtonView, v5);
}

- (void)setWallpaperEffectView:(id)a3
{
  v5 = (SBWallpaperEffectView *)a3;
  p_wallpaperEffectView = &self->_wallpaperEffectView;
  if (self->_wallpaperEffectView != v5)
  {
    v7 = v5;
    [(SBWallpaperEffectView *)v5 removeFromSuperview];
    objc_storeStrong((id *)&self->_wallpaperEffectView, a3);
    if (*p_wallpaperEffectView)
    {
      [(SBWallpaperEffectView *)*p_wallpaperEffectView bs_setHitTestingDisabled:1];
      [(CSMainPageView *)self addSubview:*p_wallpaperEffectView];
    }
    [(CSMainPageView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)setFakeWallpaperVisible:(BOOL)a3
{
  if (self->_fakeWallpaperVisible != a3)
  {
    BOOL v3 = a3;
    self->_fakeWallpaperVisible = a3;
    id v4 = [(CSVibrantWallpaperButton *)self->_logoutButtonView effectView];
    [v4 setFullscreen:v3];
  }
}

- (void)updateForLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(CSMainPageView *)self _updateLogoutButtonForLegibilitySettings];
  }
}

- (void)updateForPresentation:(id)a3
{
  id v5 = [a3 regionsIntersectingCoordinateSpace:self->_logoutButtonView];
  BOOL v4 = [v5 count] != 0;
  if (self->_logoutHugCorner != v4)
  {
    self->_logoutHugCorner = v4;
    [(CSMainPageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(CSMainPageView *)self _layoutLogoutButtonView];
  [(CSMainPageView *)self _layoutWallpaperEffectView];
  [(CSMainPageView *)self sendSubviewToBack:self->_wallpaperEffectView];
  logoutButtonView = self->_logoutButtonView;

  [(CSMainPageView *)self bringSubviewToFront:logoutButtonView];
}

- (id)presentationRegions
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if (self->_logoutButtonView)
  {
    BOOL v4 = +[CSRegion regionForCoordinateSpace:](CSRegion, "regionForCoordinateSpace:");
    id v5 = [v4 role:1];
    [v3 addObject:v5];
  }

  return v3;
}

- (void)_layoutWallpaperEffectView
{
  wallpaperEffectView = self->_wallpaperEffectView;
  if (wallpaperEffectView)
  {
    [(CSMainPageView *)self bounds];
    -[SBWallpaperEffectView setFrame:](wallpaperEffectView, "setFrame:");
  }
}

- (void)_layoutLogoutButtonView
{
  if (self->_logoutButtonView)
  {
    [(CSMainPageView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(CSVibrantWallpaperButton *)self->_logoutButtonView frame];
    double v8 = v7;
    double v10 = v9;
    [(CSMainPageView *)self _logoutButtonInsets];
    double v12 = v11;
    double v14 = v13;
    double v15 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1 ? v14 : v4 - v8 - v14;
    double v16 = v6 - v10 - v12;
    [(CSVibrantWallpaperButton *)self->_logoutButtonView frame];
    v24.origin.x = v17;
    v24.origin.y = v18;
    v24.size.width = v19;
    v24.size.height = v20;
    v23.origin.x = v15;
    v23.origin.y = v16;
    v23.size.width = v8;
    v23.size.height = v10;
    if (!CGRectEqualToRect(v23, v24))
    {
      logoutButtonView = self->_logoutButtonView;
      -[CSVibrantWallpaperButton setFrame:](logoutButtonView, "setFrame:", v15, v16, v8, v10);
    }
  }
}

- (void)_updateLogoutButtonForLegibilitySettings
{
  uint64_t v3 = [(_UILegibilitySettings *)self->_legibilitySettings style];
  double v4 = [MEMORY[0x1E4FA5F38] rootSettings];
  [v4 logoutButtonTextStrengthForStyle:v3];
  double v6 = v5;

  if (![(SBUIVibrantButton *)self->_logoutButtonView isVibrancyAllowed])
  {
    double v7 = [MEMORY[0x1E4FA5F38] rootSettings];
    [v7 logoutButtonGlyphStrengthForStyle:v3];
    double v6 = v8;
  }
  [(SBUIVibrantButton *)self->_logoutButtonView setStrength:v6];
  logoutButtonView = self->_logoutButtonView;
  legibilitySettings = self->_legibilitySettings;

  [(CSVibrantWallpaperButton *)logoutButtonView setLegibilitySettings:legibilitySettings];
}

- (UIEdgeInsets)_logoutButtonInsets
{
  if (self->_logoutHugCorner) {
    double v2 = 21.0;
  }
  else {
    double v2 = 42.0;
  }
  if (self->_logoutHugCorner) {
    double v3 = 24.0;
  }
  else {
    double v3 = 48.0;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v2;
  result.left = v5;
  result.top = v4;
  return result;
}

- (CSVibrantWallpaperButton)logoutButtonView
{
  return self->_logoutButtonView;
}

- (SBWallpaperEffectView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (BOOL)fakeWallpaperVisible
{
  return self->_fakeWallpaperVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_logoutButtonView, 0);

  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
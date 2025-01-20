@interface CSVibrantWallpaperButton
- (CSVibrantWallpaperButton)initWithFrame:(CGRect)a3;
- (CSWallpaperColorProvider)wallpaperColorProvider;
- (CSWallpaperProviding)wallpaperProvider;
- (CSWallpaperView)effectView;
- (void)_updateVibrancy;
- (void)setLegibilitySettings:(id)a3;
- (void)setWallpaperColorProvider:(id)a3;
- (void)setWallpaperProvider:(id)a3;
@end

@implementation CSVibrantWallpaperButton

- (CSVibrantWallpaperButton)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSVibrantWallpaperButton;
  v3 = -[SBUIVibrantButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3) {
    [(SBUIVibrantButton *)v3 setVibrancyAllowed:+[CSVibrancyUtility supportsVibrancy]];
  }
  return v3;
}

- (void)setWallpaperProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperProvider);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperProvider, obj);
    objc_super v5 = [obj createCoverSheetWallpaperViewWithTransformOptions:0];
    effectView = self->_effectView;
    self->_effectView = v5;

    [(CSWallpaperView *)self->_effectView setCoverSheetWallpaperStyle:1];
    [(CSWallpaperView *)self->_effectView setFullscreen:0];
    [(CSVibrantWallpaperButton *)self _updateVibrancy];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSVibrantWallpaperButton;
  [(SBUIVibrantButton *)&v4 setLegibilitySettings:a3];
  [(CSVibrantWallpaperButton *)self _updateVibrancy];
}

- (void)_updateVibrancy
{
  if (+[CSVibrancyUtility supportsVibrancy])
  {
    effectView = self->_effectView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
    +[CSVibrancyUtility updateVibrantView:self backgroundView:effectView colorProvider:WeakRetained];
  }
}

- (CSWallpaperView)effectView
{
  return self->_effectView;
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  return (CSWallpaperColorProvider *)WeakRetained;
}

- (void)setWallpaperColorProvider:(id)a3
{
}

- (CSWallpaperProviding)wallpaperProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperProvider);

  return (CSWallpaperProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperProvider);
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);

  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
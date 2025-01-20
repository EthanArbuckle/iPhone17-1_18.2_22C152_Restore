@interface CSLogoutButtonViewController
- (CSUserSessionControlling)userSessionController;
- (CSWallpaperColorProvider)wallpaperColorProvider;
- (CSWallpaperProviding)wallpaperProvider;
- (void)_buttonPressed:(id)a3;
- (void)loadView;
- (void)setUserSessionController:(id)a3;
- (void)setWallpaperColorProvider:(id)a3;
- (void)setWallpaperProvider:(id)a3;
- (void)setWallpaperViewProvider:(id)a3;
@end

@implementation CSLogoutButtonViewController

- (void)setWallpaperViewProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperProvider, obj);
    v5 = [(CSLogoutButtonViewController *)self viewIfLoaded];
    [v5 setWallpaperProvider:obj];
  }
}

- (void)setWallpaperColorProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperColorProvider, obj);
    v5 = [(CSLogoutButtonViewController *)self viewIfLoaded];
    [v5 setWallpaperColorProvider:obj];
  }
}

- (void)loadView
{
  v3 = [CSVibrantWallpaperButton alloc];
  v9 = -[CSVibrantWallpaperButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
  [(CSVibrantWallpaperButton *)v9 setWallpaperColorProvider:WeakRetained];

  id v5 = objc_loadWeakRetained((id *)&self->_wallpaperProvider);
  [(CSVibrantWallpaperButton *)v9 setWallpaperProvider:v5];

  [(CSLogoutButtonViewController *)self setView:v9];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"LOGOUT_BUTTON_TITLE" value:&stru_1F3020248 table:@"SpringBoard"];
  [(SBUIVibrantButton *)v9 setTitle:v7];

  v8 = [MEMORY[0x1E4F42A80] imageNamed:@"SignOut"];
  [(SBUIVibrantButton *)v9 setGlyphImage:v8];

  [(CSVibrantWallpaperButton *)v9 addTarget:self action:sel__buttonPressed_ forControlEvents:64];
}

- (void)_buttonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userSessionController);
  [WeakRetained logout];
}

- (CSUserSessionControlling)userSessionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userSessionController);

  return (CSUserSessionControlling *)WeakRetained;
}

- (void)setUserSessionController:(id)a3
{
}

- (CSWallpaperProviding)wallpaperProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperProvider);

  return (CSWallpaperProviding *)WeakRetained;
}

- (void)setWallpaperProvider:(id)a3
{
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  return (CSWallpaperColorProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);
  objc_destroyWeak((id *)&self->_wallpaperProvider);

  objc_destroyWeak((id *)&self->_userSessionController);
}

@end
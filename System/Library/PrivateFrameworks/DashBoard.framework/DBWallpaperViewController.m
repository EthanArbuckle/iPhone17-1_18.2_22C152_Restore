@interface DBWallpaperViewController
- (BOOL)isPersistent;
- (CRSUIWallpaper)wallpaper;
- (DBWallpaperViewController)initWithEnvironment:(id)a3 wallpaper:(id)a4 instanceID:(id)a5;
- (NSString)instanceID;
- (NSString)sceneID;
- (id)sceneSpecification;
- (void)_launchScene;
- (void)setInstanceID:(id)a3;
- (void)setSceneID:(id)a3;
- (void)setWallpaper:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DBWallpaperViewController

- (DBWallpaperViewController)initWithEnvironment:(id)a3 wallpaper:(id)a4 instanceID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[DBApplicationController sharedInstance];
  v12 = [v11 wallpaperApplication];

  v21.receiver = self;
  v21.super_class = (Class)DBWallpaperViewController;
  v13 = [(DBSceneHostViewController *)&v21 initWithApplication:v12 environment:v8];
  if (v13)
  {
    v14 = NSString;
    v15 = [v8 sceneIdentifierForApplication:v12];
    uint64_t v16 = [v14 stringWithFormat:@"%@:%@", v15, v10];
    sceneID = v13->_sceneID;
    v13->_sceneID = (NSString *)v16;

    objc_storeStrong((id *)&v13->_wallpaper, a4);
    uint64_t v18 = [v10 copy];
    instanceID = v13->_instanceID;
    v13->_instanceID = (NSString *)v18;
  }
  return v13;
}

- (id)sceneSpecification
{
  id v2 = objc_alloc_init(MEMORY[0x263F315D8]);
  return v2;
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DBWallpaperViewController;
  [(DBWallpaperViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] clearColor];
  v4 = [(DBWallpaperViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(DBWallpaperViewController *)self _launchScene];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)DBWallpaperViewController;
  [(DBWallpaperViewController *)&v4 viewDidLayoutSubviews];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__DBWallpaperViewController_viewDidLayoutSubviews__block_invoke;
  v3[3] = &unk_2649B4570;
  v3[4] = self;
  [(DBSceneHostViewController *)self updateSceneSettingsWithBlock:v3];
}

void __50__DBWallpaperViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)setWallpaper:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(DBWallpaperViewController *)self wallpaper];
  char v7 = [v6 isEqual:v5];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_wallpaper, a3);
    id v8 = [v5 identifier];
    id v9 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(DBWallpaperViewController *)self instanceID];
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "[DBWallpaperViewController] sending wallpaper %{public}@ to CarPlayWallpaper(%@)", buf, 0x16u);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__DBWallpaperViewController_setWallpaper___block_invoke;
    v11[3] = &unk_2649B4570;
    id v12 = v5;
    [(DBSceneHostViewController *)self updateSceneSettingsWithBlock:v11];
  }
}

void __42__DBWallpaperViewController_setWallpaper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v6 = v3;
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v6;
  }
  else {
    id v4 = 0;
  }

  id v5 = [*(id *)(a1 + 32) data];
  [v4 setWallpaper:v5];
}

- (void)_launchScene
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(DBWallpaperViewController *)self wallpaper];
  id v4 = [v3 identifier];

  id v5 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DBWallpaperViewController *)self instanceID];
    *(_DWORD *)buf = 138543618;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[DBWallpaperViewController] sending wallpaper %{public}@ to CarPlayWallpaper(%@)", buf, 0x16u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__DBWallpaperViewController__launchScene__block_invoke;
  v7[3] = &unk_2649B4598;
  v7[4] = self;
  [(DBSceneHostViewController *)self performSceneUpdateWithBlock:v7 completion:0];
}

uint64_t __41__DBWallpaperViewController__launchScene__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDeactivationReasons:128];
  objc_opt_class();
  id v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = [*(id *)(a1 + 32) wallpaper];
  char v7 = [v6 data];
  [v5 setWallpaper:v7];

  return 1;
}

- (CRSUIWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
}

- (NSString)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end
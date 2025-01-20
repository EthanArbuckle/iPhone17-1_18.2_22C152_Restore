@interface GKSignInVisibilityManager
- (GKLimitedPresentationManager)bannerManager;
- (GKLimitedPresentationManager)fullscreenManager;
- (GKSignInVisibilityManager)initWithFullscreenDefaultsKey:(id)a3 bannerDefaultsKey:(id)a4;
- (GKSignInVisibilityManager)initWithPersistence;
- (GKSignInVisibilityManager)initWithoutPersistence;
- (void)bannerDisabledWithConfig:(id)a3 handler:(id)a4;
- (void)bannerDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5;
- (void)didShowBanner;
- (void)didShowFullscreen;
- (void)loginDisabledWithConfig:(id)a3 handler:(id)a4;
- (void)loginDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5;
- (void)promptsDisabledWithConfig:(id)a3 handler:(id)a4;
- (void)promptsDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5;
- (void)reset;
- (void)setBannerManager:(id)a3;
- (void)setFullscreenManager:(id)a3;
@end

@implementation GKSignInVisibilityManager

- (GKSignInVisibilityManager)initWithPersistence
{
  return [(GKSignInVisibilityManager *)self initWithFullscreenDefaultsKey:@"GKFullscreenSignInPresentationDataKey" bannerDefaultsKey:@"GKSignInBannerPresentationDataKey"];
}

- (GKSignInVisibilityManager)initWithoutPersistence
{
  return [(GKSignInVisibilityManager *)self initWithFullscreenDefaultsKey:0 bannerDefaultsKey:0];
}

- (GKSignInVisibilityManager)initWithFullscreenDefaultsKey:(id)a3 bannerDefaultsKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKSignInVisibilityManager;
  v8 = [(GKSignInVisibilityManager *)&v14 init];
  if (v8)
  {
    v9 = [[GKLimitedPresentationManager alloc] initWithDefaultsKey:v6];
    fullscreenManager = v8->_fullscreenManager;
    v8->_fullscreenManager = v9;

    v11 = [[GKLimitedPresentationManager alloc] initWithDefaultsKey:v7];
    bannerManager = v8->_bannerManager;
    v8->_bannerManager = v11;
  }
  return v8;
}

- (void)promptsDisabledWithConfig:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__GKSignInVisibilityManager_promptsDisabledWithConfig_handler___block_invoke;
  v8[3] = &unk_1E646D838;
  id v9 = v6;
  id v7 = v6;
  [(GKSignInVisibilityManager *)self promptsDisabledWithConfig:a3 scope:0 handler:v8];
}

uint64_t __63__GKSignInVisibilityManager_promptsDisabledWithConfig_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promptsDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__GKSignInVisibilityManager_promptsDisabledWithConfig_scope_handler___block_invoke;
  v12[3] = &unk_1E646D888;
  objc_copyWeak(v15, &location);
  id v10 = v8;
  id v13 = v10;
  v15[1] = (id)a4;
  id v11 = v9;
  id v14 = v11;
  [(GKSignInVisibilityManager *)self loginDisabledWithConfig:v10 scope:a4 handler:v12];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __69__GKSignInVisibilityManager_promptsDisabledWithConfig_scope_handler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__GKSignInVisibilityManager_promptsDisabledWithConfig_scope_handler___block_invoke_2;
  v7[3] = &unk_1E646D860;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v9 = a2;
  [WeakRetained bannerDisabledWithConfig:v6 scope:v5 handler:v7];
}

uint64_t __69__GKSignInVisibilityManager_promptsDisabledWithConfig_scope_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)bannerDisabledWithConfig:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__GKSignInVisibilityManager_bannerDisabledWithConfig_handler___block_invoke;
  v8[3] = &unk_1E646D8B0;
  id v9 = v6;
  id v7 = v6;
  [(GKSignInVisibilityManager *)self bannerDisabledWithConfig:a3 scope:0 handler:v8];
}

uint64_t __62__GKSignInVisibilityManager_bannerDisabledWithConfig_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)bannerDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[GKLimitedPresentationContext alloc] initWithScope:a4 elementType:1];
  id v11 = [(GKSignInVisibilityManager *)self bannerManager];
  v12 = [v9 bannerConfig];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__GKSignInVisibilityManager_bannerDisabledWithConfig_scope_handler___block_invoke;
  v14[3] = &unk_1E646D8B0;
  id v15 = v8;
  id v13 = v8;
  [v11 presentationDisabledWithConfig:v12 context:v10 completionHandler:v14];
}

uint64_t __68__GKSignInVisibilityManager_bannerDisabledWithConfig_scope_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loginDisabledWithConfig:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__GKSignInVisibilityManager_loginDisabledWithConfig_handler___block_invoke;
  v8[3] = &unk_1E646D8B0;
  id v9 = v6;
  id v7 = v6;
  [(GKSignInVisibilityManager *)self loginDisabledWithConfig:a3 scope:0 handler:v8];
}

uint64_t __61__GKSignInVisibilityManager_loginDisabledWithConfig_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loginDisabledWithConfig:(id)a3 scope:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[GKLimitedPresentationContext alloc] initWithScope:a4 elementType:2];
  id v11 = [(GKSignInVisibilityManager *)self fullscreenManager];
  v12 = [v9 sheetConfig];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__GKSignInVisibilityManager_loginDisabledWithConfig_scope_handler___block_invoke;
  v14[3] = &unk_1E646D8B0;
  id v15 = v8;
  id v13 = v8;
  [v11 presentationDisabledWithConfig:v12 context:v10 completionHandler:v14];
}

uint64_t __67__GKSignInVisibilityManager_loginDisabledWithConfig_scope_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reset
{
  v3 = [(GKSignInVisibilityManager *)self bannerManager];
  [v3 resetWithCompletionHandler:&__block_literal_global_3];

  id v4 = [(GKSignInVisibilityManager *)self fullscreenManager];
  [v4 resetWithCompletionHandler:&__block_literal_global_26];
}

- (void)didShowBanner
{
  id v2 = [(GKSignInVisibilityManager *)self bannerManager];
  [v2 didPresentWithCompletionHandler:&__block_literal_global_28];
}

- (void)didShowFullscreen
{
  id v2 = [(GKSignInVisibilityManager *)self fullscreenManager];
  [v2 didPresentWithCompletionHandler:&__block_literal_global_30_0];
}

- (GKLimitedPresentationManager)fullscreenManager
{
  return (GKLimitedPresentationManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFullscreenManager:(id)a3
{
}

- (GKLimitedPresentationManager)bannerManager
{
  return (GKLimitedPresentationManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBannerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerManager, 0);

  objc_storeStrong((id *)&self->_fullscreenManager, 0);
}

@end
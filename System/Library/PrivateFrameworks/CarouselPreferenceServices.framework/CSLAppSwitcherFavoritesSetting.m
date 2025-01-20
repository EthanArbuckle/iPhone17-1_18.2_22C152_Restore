@interface CSLAppSwitcherFavoritesSetting
- (CSLAppSwitcherFavoritesSetting)init;
- (CSLAppSwitcherFavoritesSettingDelegate)delegate;
- (NSArray)favorites;
- (unint64_t)maximumFavorites;
- (void)_withLock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFavorites:(id)a3;
- (void)setMaximumFavorites:(unint64_t)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation CSLAppSwitcherFavoritesSetting

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumFavoritesSetting, 0);
  objc_storeStrong((id *)&self->_favoritesSetting, 0);
}

- (CSLAppSwitcherFavoritesSettingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLAppSwitcherFavoritesSettingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  id v6 = [(CSLAppSwitcherFavoritesSetting *)self favorites];
  [v5 appSwitcherFavoritesDidUpdate:v6];
}

- (void)setMaximumFavorites:(unint64_t)a3
{
  maximumFavoritesSetting = self->_maximumFavoritesSetting;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(CSLPRFTwoWaySyncSetting *)maximumFavoritesSetting setValue:v4];
}

- (unint64_t)maximumFavorites
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__CSLAppSwitcherFavoritesSetting_maximumFavorites__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLAppSwitcherFavoritesSetting *)self _withLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__CSLAppSwitcherFavoritesSetting_maximumFavorites__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) value];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];
}

- (void)setFavorites:(id)a3
{
}

- (NSArray)favorites
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__2983;
  v9 = __Block_byref_object_dispose__2984;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__CSLAppSwitcherFavoritesSetting_favorites__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLAppSwitcherFavoritesSetting *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __43__CSLAppSwitcherFavoritesSetting_favorites__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) value];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = v7;
    id v4 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v3;
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) defaultValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [(CSLAppSwitcherFavoritesSetting *)self favorites];
  [WeakRetained appSwitcherFavoritesDidUpdate:v4];
}

- (CSLAppSwitcherFavoritesSetting)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSLAppSwitcherFavoritesSetting;
  uint64_t v2 = [(CSLAppSwitcherFavoritesSetting *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = +[CSLPRFAppSwitcherDefaultApplications defaultApplicationList];
    uint64_t v5 = [[CSLPRFTwoWaySyncSetting alloc] initWithKey:@"FavoriteApplications" defaultValue:v4 notification:"CSLDockSettingsChangedNotification"];
    favoritesSetting = v3->_favoritesSetting;
    v3->_favoritesSetting = v5;

    id v7 = [[CSLPRFTwoWaySyncSetting alloc] initWithKey:@"MaximumFavoriteApplications" defaultValue:&unk_26E2C9870 notification:"CSLDockSettingsChangedNotification"];
    maximumFavoritesSetting = v3->_maximumFavoritesSetting;
    v3->_maximumFavoritesSetting = v7;

    [(CSLPRFTwoWaySyncSetting *)v3->_favoritesSetting setDelegate:v3];
    [(CSLPRFTwoWaySyncSetting *)v3->_maximumFavoritesSetting setDelegate:v3];
  }
  return v3;
}

@end
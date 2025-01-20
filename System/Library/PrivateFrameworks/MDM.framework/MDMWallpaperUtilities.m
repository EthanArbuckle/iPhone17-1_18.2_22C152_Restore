@interface MDMWallpaperUtilities
- (PRSExternalSystemService)externalPosterService;
- (PRSService)posterService;
- (id)_storeImageToTempDirectory:(id)a3;
- (void)_createNewConfigurationIfNeeedWithCompletionHandler:(id)a3;
- (void)_createNewConfigurationWithCompletionHandler:(id)a3;
- (void)_removeImageFromURL:(id)a3;
- (void)_setWallpaper:(id)a3 forConfigurationWithUUID:(id)a4 setLockScreen:(BOOL)a5 setHomeScreen:(BOOL)a6 completionHandler:(id)a7;
- (void)_updateWallpaperConfiguraitonWithUUID:(id)a3 updates:(id)a4 completionHandler:(id)a5;
- (void)_updateWallpaperConfiguraitonWithUUID:(id)a3 updates:(id)a4 retryCount:(unint64_t)a5 completionHandler:(id)a6;
- (void)_verifyWallpaperConfigExistsWithUUID:(id)a3 completionHandler:(id)a4;
- (void)setExternalPosterService:(id)a3;
- (void)setPosterService:(id)a3;
- (void)setWallpaper:(id)a3 forLockScreen:(BOOL)a4 homeScreen:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation MDMWallpaperUtilities

- (void)setWallpaper:(id)a3 forLockScreen:(BOOL)a4 homeScreen:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(MDMWallpaperUtilities *)self _storeImageToTempDirectory:v10];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__MDMWallpaperUtilities_setWallpaper_forLockScreen_homeScreen_completionHandler___block_invoke;
  v15[3] = &unk_264B9E888;
  objc_copyWeak(&v18, &location);
  id v13 = v11;
  id v17 = v13;
  id v14 = v12;
  id v16 = v14;
  BOOL v19 = a4;
  BOOL v20 = a5;
  [(MDMWallpaperUtilities *)self _createNewConfigurationIfNeeedWithCompletionHandler:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __81__MDMWallpaperUtilities_setWallpaper_forLockScreen_homeScreen_completionHandler___block_invoke(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      if (v10) {
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
      }
    }
    else
    {
      objc_initWeak(&location, WeakRetained);
      uint64_t v11 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = a2;
      }
      if (*(unsigned char *)(a1 + 57)) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = a2;
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __81__MDMWallpaperUtilities_setWallpaper_forLockScreen_homeScreen_completionHandler___block_invoke_2;
      v14[3] = &unk_264B9E860;
      objc_copyWeak(&v17, &location);
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      [WeakRetained _setWallpaper:v11 forConfigurationWithUUID:v7 setLockScreen:v12 setHomeScreen:v13 completionHandler:v14];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __81__MDMWallpaperUtilities_setWallpaper_forLockScreen_homeScreen_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _removeImageFromURL:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    }
  }
}

- (void)_createNewConfigurationIfNeeedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F52810] sharedConfiguration];
  id v6 = [v5 wallpaperConfigurationUUID];

  if (v6)
  {
    id v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "Existing wallpaper config UUID is not nil.", buf, 2u);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __77__MDMWallpaperUtilities__createNewConfigurationIfNeeedWithCompletionHandler___block_invoke;
    v8[3] = &unk_264B9E8B0;
    id v11 = v4;
    id v9 = v6;
    uint64_t v10 = self;
    [(MDMWallpaperUtilities *)self _verifyWallpaperConfigExistsWithUUID:v9 completionHandler:v8];
  }
  else
  {
    [(MDMWallpaperUtilities *)self _createNewConfigurationWithCompletionHandler:v4];
  }
}

uint64_t __77__MDMWallpaperUtilities__createNewConfigurationIfNeeedWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "Found existing wallpaper configuration.", v7, 2u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _createNewConfigurationWithCompletionHandler:v6];
  }
}

- (void)_createNewConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Will create new wallpaper configuration...", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  uint64_t v6 = [(MDMWallpaperUtilities *)self posterService];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__MDMWallpaperUtilities__createNewConfigurationWithCompletionHandler___block_invoke;
  v8[3] = &unk_264B9E8D8;
  objc_copyWeak(&v10, buf);
  id v7 = v4;
  id v9 = v7;
  [v6 createPosterConfigurationForProviderIdentifier:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" posterDescriptorIdentifier:0 role:0 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __70__MDMWallpaperUtilities__createNewConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543362;
        id v15 = v6;
        _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_ERROR, "Failed to create poster configuration with error: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        (*(void (**)(uint64_t, void, void, id))(v9 + 16))(v9, 0, 0, v6);
      }
    }
    else
    {
      id v10 = [v5 serverUUID];
      id v11 = [MEMORY[0x263F52810] sharedConfiguration];
      [v11 setWallpaperConfigurationUUID:v10];

      uint64_t v12 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v10;
        _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEFAULT, "Poster configuration created with UUID: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        (*(void (**)(uint64_t, uint64_t, void *, void))(v13 + 16))(v13, 1, v10, 0);
      }
    }
  }
}

- (void)_verifyWallpaperConfigExistsWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MDMWallpaperUtilities *)self externalPosterService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__MDMWallpaperUtilities__verifyWallpaperConfigExistsWithUUID_completionHandler___block_invoke;
  v11[3] = &unk_264B9E900;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 fetchEligibleConfigurationsWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __80__MDMWallpaperUtilities__verifyWallpaperConfigExistsWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch eligible configuration with error: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    id v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 32);
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "Wallpaper configuration with UUID (%{public}@) exists.", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v5 containsObject:*(void *)(a1 + 32)]);
  }
}

- (void)_setWallpaper:(id)a3 forConfigurationWithUUID:(id)a4 setLockScreen:(BOOL)a5 setHomeScreen:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = objc_opt_new();
  uint64_t v16 = objc_opt_new();
  if (v9)
  {
    id v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v17, OS_LOG_TYPE_DEFAULT, "Will update lock screen", buf, 2u);
    }
    id v18 = [MEMORY[0x263F5F378] posterUpdateLockScreenPosterWithImageAtURL:v12];
    [v15 addObject:v18];
  }
  if (v8)
  {
    BOOL v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_DEFAULT, "Will update home screen", buf, 2u);
    }
    BOOL v20 = [MEMORY[0x263F5F378] posterUpdateHomeScreenPosterWithImageAtURL:v12];
    v21 = [MEMORY[0x263F5F378] posterUpdateHomeScreenAppearance:4];
    [v16 addObject:v20];
    [v16 addObject:v21];
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __110__MDMWallpaperUtilities__setWallpaper_forConfigurationWithUUID_setLockScreen_setHomeScreen_completionHandler___block_invoke;
  v25[3] = &unk_264B9E928;
  v25[4] = self;
  id v26 = v13;
  id v27 = v16;
  id v28 = v14;
  id v22 = v16;
  id v23 = v13;
  id v24 = v14;
  [(MDMWallpaperUtilities *)self _updateWallpaperConfiguraitonWithUUID:v23 updates:v15 retryCount:2 completionHandler:v25];
}

void __110__MDMWallpaperUtilities__setWallpaper_forConfigurationWithUUID_setLockScreen_setHomeScreen_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __110__MDMWallpaperUtilities__setWallpaper_forConfigurationWithUUID_setLockScreen_setHomeScreen_completionHandler___block_invoke_2;
    v6[3] = &unk_264B9D4A8;
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    [v3 _updateWallpaperConfiguraitonWithUUID:v4 updates:v5 retryCount:2 completionHandler:v6];
  }
}

uint64_t __110__MDMWallpaperUtilities__setWallpaper_forConfigurationWithUUID_setLockScreen_setHomeScreen_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateWallpaperConfiguraitonWithUUID:(id)a3 updates:(id)a4 retryCount:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __100__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_retryCount_completionHandler___block_invoke;
  v16[3] = &unk_264B9E978;
  id v19 = v12;
  unint64_t v20 = a5;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(MDMWallpaperUtilities *)self _updateWallpaperConfiguraitonWithUUID:v15 updates:v14 completionHandler:v16];
}

void __100__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_retryCount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v5;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_ERROR, "Failed to update wallpaper. Retry count %ld", buf, 0xCu);
  }
  if (*(void *)(a1 + 64))
  {
    dispatch_time_t v6 = dispatch_time(0, 500000000);
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __100__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_retryCount_completionHandler___block_invoke_8;
    block[3] = &unk_264B9E950;
    BOOL v8 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v13 = v8;
    id v9 = *(id *)(a1 + 48);
    id v11 = *(void **)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    id v14 = v9;
    uint64_t v16 = v10;
    id v15 = v11;
    dispatch_after(v6, v7, block);
  }
  else
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __100__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_retryCount_completionHandler___block_invoke_8(uint64_t a1)
{
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_230A49000, v2, OS_LOG_TYPE_DEFAULT, "Retry setting wallpaper...", v4, 2u);
  }
  return [*(id *)(a1 + 32) _updateWallpaperConfiguraitonWithUUID:*(void *)(a1 + 40) updates:*(void *)(a1 + 48) retryCount:*(void *)(a1 + 64) - 1 completionHandler:*(void *)(a1 + 56)];
}

- (void)_updateWallpaperConfiguraitonWithUUID:(id)a3 updates:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v9 count])
  {
    objc_initWeak(&location, self);
    id v11 = [(MDMWallpaperUtilities *)self posterService];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke;
    v12[3] = &unk_264B9E9C8;
    objc_copyWeak(&v14, &location);
    id v13 = v10;
    [v11 updatePosterConfigurationMatchingUUID:v8 updates:v9 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = *(NSObject **)DMCLogObjects();
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v7;
        _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_ERROR, "Failed to update poster configuration UUID with error: %{public}@", buf, 0xCu);
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v7);
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "Poster configuration updated.", buf, 2u);
      }
      id v11 = [WeakRetained posterService];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke_13;
      v12[3] = &unk_264B9E9A0;
      id v14 = *(id *)(a1 + 32);
      void v12[4] = WeakRetained;
      id v13 = v6;
      [v11 updateSelectedForRoleIdentifier:@"PRPosterRoleLockScreen" newlySelectedConfiguration:v13 completion:v12];
    }
  }
}

void __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(NSObject **)DMCLogObjects();
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_ERROR, "Failed to selected configuration with error: %{public}@", buf, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Poster configuration selected.", buf, 2u);
    }
    id v6 = [*(id *)(a1 + 32) posterService];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke_14;
    v8[3] = &unk_264B9D4A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v6 refreshSnapshotForPosterConfiguration:v7 completion:v8];
  }
}

void __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(NSObject **)DMCLogObjects();
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v3;
      uint64_t v5 = "Failed to refresh snapshot for poster configuration with error: %{public}@";
      id v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_230A49000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    uint64_t v5 = "Poster configuration snapshot refreshed.";
    id v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
}

- (PRSService)posterService
{
  posterService = self->_posterService;
  if (!posterService)
  {
    uint64_t v4 = (PRSService *)objc_alloc_init(MEMORY[0x263F5F388]);
    uint64_t v5 = self->_posterService;
    self->_posterService = v4;

    posterService = self->_posterService;
  }
  return posterService;
}

- (PRSExternalSystemService)externalPosterService
{
  externalPosterService = self->_externalPosterService;
  if (!externalPosterService)
  {
    uint64_t v4 = (PRSExternalSystemService *)objc_alloc_init(MEMORY[0x263F5F328]);
    uint64_t v5 = self->_externalPosterService;
    self->_externalPosterService = v4;

    externalPosterService = self->_externalPosterService;
  }
  return externalPosterService;
}

- (id)_storeImageToTempDirectory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (UIImage *)a3;
  uint64_t v4 = NSTemporaryDirectory();
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"MDMWallpaper.png"];

  id v6 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v5];
  os_log_type_t v7 = UIImagePNGRepresentation(v3);

  id v16 = 0;
  char v8 = [v7 writeToURL:v6 options:1 error:&v16];
  id v9 = v16;

  id v10 = *(NSObject **)DMCLogObjects();
  if (v8)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v6;
    uint64_t v11 = "Image stored to url: %{public}@";
    uint64_t v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    uint32_t v14 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    id v20 = v9;
    uint64_t v11 = "Failed to write image to url: %{public}@, error: %{public}@";
    uint64_t v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 22;
  }
  _os_log_impl(&dword_230A49000, v12, v13, v11, buf, v14);
LABEL_7:

  return v6;
}

- (void)_removeImageFromURL:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  id v7 = 0;
  [v4 removeItemAtURL:v3 error:&v7];
  id v5 = v7;

  if (v5)
  {
    id v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "Failed to remove image from URL with error: %{public}@", buf, 0xCu);
    }
  }
}

- (void)setPosterService:(id)a3
{
}

- (void)setExternalPosterService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPosterService, 0);
  objc_storeStrong((id *)&self->_posterService, 0);
}

@end
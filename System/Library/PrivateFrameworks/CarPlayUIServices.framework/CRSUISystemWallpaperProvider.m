@interface CRSUISystemWallpaperProvider
- (BOOL)isReady;
- (CRSUIWallpaperDataProvidingDelegate)dataProviderDelegate;
- (id)defaultWallpapers;
- (id)displayID;
- (id)dynamicAppearanceWallpapersForVehicle:(id)a3;
- (id)loadWallpaperFromData:(id)a3;
- (id)resolveWallpaper:(id)a3;
- (id)wallpapers;
- (unint64_t)version;
- (void)setDataProviderDelegate:(id)a3;
@end

@implementation CRSUISystemWallpaperProvider

- (BOOL)isReady
{
  return 1;
}

- (unint64_t)version
{
  return 11;
}

- (id)displayID
{
  return 0;
}

- (id)wallpapers
{
  return +[CRSUISystemWallpaper wallpapers];
}

- (id)defaultWallpapers
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[CRSUISystemWallpaper defaultWallpaper];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)dynamicAppearanceWallpapersForVehicle:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v4 = [a3 previousSystemWallpaperData];
  if (v4)
  {
    v5 = [(CRSUISystemWallpaperProvider *)self loadWallpaperFromData:v4];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 traits];
      char v8 = [v7 supportsDynamicAppearance];

      if (v8)
      {
        v16[0] = v6;
        v9 = (void *)MEMORY[0x263EFF8C0];
        v10 = (void **)v16;
LABEL_8:
        v12 = [v9 arrayWithObjects:v10 count:1];
        goto LABEL_12;
      }
    }
  }
  v11 = [(CRSUISystemWallpaperProvider *)self wallpapers];
  v6 = objc_msgSend(v11, "bs_firstObjectPassingTest:", &__block_literal_global_242);

  if (v6)
  {
    v15 = v6;
    v9 = (void *)MEMORY[0x263EFF8C0];
    v10 = &v15;
    goto LABEL_8;
  }
  v13 = CRSUILogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[CRSUISystemWallpaperProvider dynamicAppearanceWallpapersForVehicle:](v13);
  }

  v12 = (void *)MEMORY[0x263EFFA68];
LABEL_12:

  return v12;
}

uint64_t __70__CRSUISystemWallpaperProvider_dynamicAppearanceWallpapersForVehicle___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 traits];
  uint64_t v3 = [v2 supportsDynamicAppearance];

  return v3;
}

- (id)loadWallpaperFromData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [CRSUISystemWallpaper alloc];
    v5 = [v3 identifier];
    v6 = [(CRSUISystemWallpaper *)v4 initWithIdentifier:v5];
  }
  else
  {
    v7 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CRSUISystemWallpaperProvider loadWallpaperFromData:]();
    }

    v6 = 0;
  }

  return v6;
}

- (id)resolveWallpaper:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 resolveWallpaper];
  }
  else
  {
    v5 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[CRSUISystemWallpaperProvider loadWallpaperFromData:]();
    }

    v4 = 0;
  }

  return v4;
}

- (CRSUIWallpaperDataProvidingDelegate)dataProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->dataProviderDelegate);
  return (CRSUIWallpaperDataProvidingDelegate *)WeakRetained;
}

- (void)setDataProviderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)dynamicAppearanceWallpapersForVehicle:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21817A000, log, OS_LOG_TYPE_FAULT, "Missing dynamic appearance wallpapers", v1, 2u);
}

- (void)loadWallpaperFromData:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_21817A000, v2, v3, "Unsupported wallpaper type: %{public}@", v4, v5, v6, v7, 2u);
}

@end
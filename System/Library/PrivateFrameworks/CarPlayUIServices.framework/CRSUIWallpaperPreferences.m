@interface CRSUIWallpaperPreferences
- (BOOL)_hasGaugeClusterScreen;
- (BOOL)updateWallpaperToSupportDynamicAppearance;
- (CRPairedVehicleManager)vehicleManager;
- (CRSUIWallpaper)currentWallpaper;
- (CRSUIWallpaper)stagedWallpaper;
- (CRSUIWallpaperDataProviding)dataProvider;
- (CRSUIWallpaperPreferences)initWithDataProvider:(id)a3;
- (CRVehicle)vehicle;
- (id)wallpaperForLayoutIdentifier:(id)a3;
- (id)wallpaperFromThemeData:(id)a3;
- (void)setCurrentWallpaper:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setStagedWallpaper:(id)a3;
- (void)setVehicle:(id)a3;
- (void)setVehicleManager:(id)a3;
- (void)updateHasGaugeClusterScreen:(BOOL)a3;
- (void)updateThemeData:(id)a3;
- (void)updateWallpaperToSupportDynamicAppearance;
@end

@implementation CRSUIWallpaperPreferences

- (CRSUIWallpaperPreferences)initWithDataProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRSUIWallpaperPreferences;
  v6 = [(CRSUIWallpaperPreferences *)&v10 init];
  if (v6)
  {
    v7 = (CRPairedVehicleManager *)objc_alloc_init(MEMORY[0x263F30EA0]);
    vehicleManager = v6->_vehicleManager;
    v6->_vehicleManager = v7;

    objc_storeStrong((id *)&v6->_dataProvider, a3);
  }

  return v6;
}

- (void)setVehicle:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(CRSUIWallpaperPreferences *)self vehicle];
  v7 = [(CRSUIWallpaperPreferences *)self dataProvider];
  v8 = [v7 displayID];
  v9 = [v6 wallpaperForDisplayWithID:v8];

  objc_super v10 = [(CRSUIWallpaperPreferences *)self dataProvider];
  v11 = [v10 displayID];
  v12 = [v5 wallpaperForDisplayWithID:v11];

  if (v9 == v12)
  {
    objc_storeStrong((id *)&self->_vehicle, a3);
  }
  else
  {
    v13 = [v9 identifier];
    v14 = [v12 identifier];
    char v15 = [v13 isEqualToString:v14];

    objc_storeStrong((id *)&self->_vehicle, a3);
    if ((v15 & 1) == 0)
    {
      v16 = CRSUILogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v5 wallpaperIdentifier];
        int v19 = 138543362;
        v20 = v17;
        _os_log_impl(&dword_21817A000, v16, OS_LOG_TYPE_DEFAULT, "[CRSUIWallpaperPreferences] Vehicle #wallpaper preference changed: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      v18 = [MEMORY[0x263F08A00] defaultCenter];
      [v18 postNotificationName:@"CRSUIWallpaperChangedNotification" object:0];
    }
  }
}

- (void)setStagedWallpaper:(id)a3
{
  id v9 = a3;
  id v5 = [v9 identifier];
  v6 = [(CRSUIWallpaperPreferences *)self currentWallpaper];
  v7 = [v6 identifier];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    objc_storeStrong((id *)&self->_stagedWallpaper, a3);
  }
}

- (id)wallpaperFromThemeData:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIWallpaperPreferences *)self dataProvider];
  v6 = [v5 displayID];

  if (v6
    && ([v4 objectForKeyedSubscript:v6],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 currentWallpaper],
        char v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    id v9 = [(CRSUIWallpaperPreferences *)self dataProvider];
    objc_super v10 = [v9 loadWallpaperFromData:v8];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (void)updateThemeData:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CRSUIWallpaperPreferences *)self vehicle];
  v6 = [v5 displayThemeData];
  int v7 = [v6 isEqualToDictionary:v4];

  if (v7)
  {
    char v8 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21817A000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring duplicated update to theme data", buf, 2u);
    }
    goto LABEL_26;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v37 = v4;
  id v9 = v4;
  uint64_t v39 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(v9);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        v12 = [v9 objectForKeyedSubscript:v11];
        v13 = self;
        v14 = [(CRSUIWallpaperPreferences *)self vehicle];
        char v15 = [v14 displayThemeData];
        v16 = [v15 objectForKeyedSubscript:v11];

        v17 = [v12 currentWallpaper];
        v18 = [v17 identifier];
        int v19 = [v16 currentWallpaper];
        v20 = [v19 identifier];
        int v21 = [v18 isEqualToString:v20];

        if (!v21)
        {
          int v22 = 1;
          self = v13;
          goto LABEL_14;
        }
        self = v13;
      }
      uint64_t v39 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v39) {
        continue;
      }
      break;
    }
  }
  int v22 = 0;
LABEL_14:

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    while (2)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [v23 objectForKeyedSubscript:*(void *)(*((void *)&v40 + 1) + 8 * j)];
        v29 = [(CRSUIWallpaperPreferences *)self dataProvider];
        v30 = [v28 currentWallpaper];
        v31 = [v29 loadWallpaperFromData:v30];

        v32 = [v31 traits];
        LODWORD(v30) = [v32 supportsDynamicAppearance];

        if (!v30)
        {

          v34 = [(CRSUIWallpaperPreferences *)self vehicle];
          [v34 setDisplayThemeData:v23];

          v33 = [(CRSUIWallpaperPreferences *)self vehicle];
          [v33 setAppearanceModePreference:2];
          goto LABEL_24;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  v33 = [(CRSUIWallpaperPreferences *)self vehicle];
  [v33 setDisplayThemeData:v23];
LABEL_24:

  v35 = [(CRSUIWallpaperPreferences *)self vehicleManager];
  v36 = [(CRSUIWallpaperPreferences *)self vehicle];
  [v35 saveVehicle:v36 completion:&__block_literal_global_3];

  id v4 = v37;
  if (v22)
  {
    char v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"CRSUIWallpaperChangedNotification" object:0];
LABEL_26:
  }
}

void __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke_cold_1();
    }
  }
}

- (void)updateHasGaugeClusterScreen:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(CRSUIWallpaperPreferences *)self vehicle];
  v6 = [v5 hasGaugeClusterScreen];
  int v7 = (void *)[objc_alloc(NSNumber) initWithBool:v3];
  int v8 = [v6 isEqualToNumber:v7];

  if (v8)
  {
    id v9 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v15 = v3;
      _os_log_impl(&dword_21817A000, v9, OS_LOG_TYPE_DEFAULT, "Has gauge cluster screen already set with value: %d", buf, 8u);
    }
  }
  else
  {
    objc_super v10 = (void *)[objc_alloc(NSNumber) initWithBool:v3];
    uint64_t v11 = [(CRSUIWallpaperPreferences *)self vehicle];
    [v11 setHasGaugeClusterScreen:v10];

    id v13 = [(CRSUIWallpaperPreferences *)self vehicleManager];
    v12 = [(CRSUIWallpaperPreferences *)self vehicle];
    [v13 saveVehicle:v12 completion:&__block_literal_global_32];
  }
}

void __57__CRSUIWallpaperPreferences_updateHasGaugeClusterScreen___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke_cold_1();
    }
  }
}

- (id)wallpaperForLayoutIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIWallpaperPreferences *)self vehicle];
  v6 = [v5 displayThemeData];

  if (v6)
  {
    int v7 = [(CRSUIWallpaperPreferences *)self vehicle];
    int v8 = [v7 displayThemeData];
    id v9 = [(CRSUIWallpaperPreferences *)self dataProvider];
    objc_super v10 = [v9 displayID];
    uint64_t v11 = [v8 objectForKeyedSubscript:v10];

    v12 = [(CRSUIWallpaperPreferences *)self dataProvider];
    id v13 = [v11 wallpaperForLayout];
    v14 = [v13 objectForKey:v4];
    BOOL v15 = [v12 loadWallpaperFromData:v14];
  }
  else
  {
    uint64_t v16 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[CRSUIWallpaperPreferences wallpaperForLayoutIdentifier:](self, v16);
    }

    BOOL v15 = [(CRSUIWallpaperPreferences *)self currentWallpaper];
  }

  return v15;
}

- (CRSUIWallpaper)currentWallpaper
{
  stagedWallpaper = self->_stagedWallpaper;
  if (stagedWallpaper)
  {
    BOOL v3 = stagedWallpaper;
  }
  else
  {
    id v5 = [(CRSUIWallpaperPreferences *)self vehicle];
    v6 = [(CRSUIWallpaperPreferences *)self dataProvider];
    int v7 = [v6 displayID];
    int v8 = [v5 wallpaperForDisplayWithID:v7];

    if (!v8
      || ([(CRSUIWallpaperPreferences *)self dataProvider],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v9 loadWallpaperFromData:v8],
          BOOL v3 = (CRSUIWallpaper *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v3))
    {
      objc_super v10 = [(CRSUIWallpaperPreferences *)self dataProvider];
      uint64_t v11 = [v10 defaultWallpapers];
      BOOL v3 = [v11 firstObject];
    }
  }
  return v3;
}

- (void)setCurrentWallpaper:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CRSUIWallpaperPreferences *)self vehicle];
  v6 = [(CRSUIWallpaperPreferences *)self dataProvider];
  int v7 = [v6 displayID];
  int v8 = [v5 wallpaperForDisplayWithID:v7];

  id v9 = [v8 identifier];
  objc_super v10 = [v4 data];
  uint64_t v11 = [v10 identifier];
  int v12 = [v9 isEqualToString:v11];

  [(CRSUIWallpaperPreferences *)self setStagedWallpaper:0];
  id v13 = CRSUILogForCategory(0);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      BOOL v15 = [v4 identifier];
      int v24 = 138543362;
      uint64_t v25 = v15;
      _os_log_impl(&dword_21817A000, v13, OS_LOG_TYPE_DEFAULT, "[CRSUIWallpaperPreferences] Ignoring #wallpaper update to %{public}@ for vehicle", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    if (v14)
    {
      uint64_t v16 = [v4 identifier];
      int v24 = 138543362;
      uint64_t v25 = v16;
      _os_log_impl(&dword_21817A000, v13, OS_LOG_TYPE_DEFAULT, "[CRSUIWallpaperPreferences] Setting #wallpaper %{public}@ for vehicle", (uint8_t *)&v24, 0xCu);
    }
    v17 = [(CRSUIWallpaperPreferences *)self vehicle];
    v18 = [v4 data];
    int v19 = [(CRSUIWallpaperPreferences *)self dataProvider];
    v20 = [v19 displayID];
    int v21 = [v4 traits];
    objc_msgSend(v17, "setWallpaper:forDisplayWithID:requiresDarkAppearance:", v18, v20, objc_msgSend(v21, "supportsDynamicAppearance") ^ 1);

    int v22 = [(CRSUIWallpaperPreferences *)self vehicleManager];
    id v23 = [(CRSUIWallpaperPreferences *)self vehicle];
    [v22 saveVehicle:v23 completion:&__block_literal_global_34];

    id v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"CRSUIWallpaperChangedNotification" object:0];
  }
}

void __49__CRSUIWallpaperPreferences_setCurrentWallpaper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke_cold_1();
    }
  }
}

- (BOOL)updateWallpaperToSupportDynamicAppearance
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CRSUIWallpaperPreferences *)self dataProvider];
  id v4 = [(CRSUIWallpaperPreferences *)self vehicle];
  id v5 = [v3 dynamicAppearanceWallpapersForVehicle:v4];

  if ([v5 count])
  {
    v6 = [(CRSUIWallpaperPreferences *)self vehicle];
    uint64_t v7 = [v6 displayThemeData];
    if (v7)
    {
      int v8 = (void *)v7;
      id v9 = [(CRSUIWallpaperPreferences *)self dataProvider];
      objc_super v10 = [v9 displayID];

      if (!v10)
      {
        v31 = self;
        uint64_t v11 = [(CRSUIWallpaperPreferences *)self vehicle];
        int v12 = [v11 displayThemeData];
        id v13 = (void *)[v12 mutableCopy];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v32 = v5;
        id v14 = v5;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          BOOL v17 = 0;
          uint64_t v18 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v14);
              }
              v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              id v21 = v20;
              if (v21 && (objc_opt_isKindOfClass() & 1) != 0) {
                id v22 = v21;
              }
              else {
                id v22 = 0;
              }

              if (v22)
              {
                id v23 = [v21 displayID];
                int v24 = [v13 objectForKey:v23];

                if (v24)
                {
                  uint64_t v25 = [v21 data];
                  uint64_t v26 = [v24 themeDataWithCurrentWallpaper:v25];
                  v27 = [v21 displayID];
                  [v13 setObject:v26 forKey:v27];

                  BOOL v17 = 1;
                }
              }
              else
              {
                int v24 = CRSUILogForCategory(6uLL);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
                  [(CRSUIWallpaperPreferences *)v37 updateWallpaperToSupportDynamicAppearance];
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
          }
          while (v16);
        }
        else
        {
          BOOL v17 = 0;
        }

        [(CRSUIWallpaperPreferences *)v31 updateThemeData:v13];
        id v5 = v32;
        goto LABEL_31;
      }
    }
    else
    {
    }
    if ([v5 count] != 1) {
      -[CRSUIWallpaperPreferences updateWallpaperToSupportDynamicAppearance]();
    }
    v29 = [v5 firstObject];
    BOOL v17 = v29 != 0;
    if (v29) {
      [(CRSUIWallpaperPreferences *)self setCurrentWallpaper:v29];
    }
  }
  else
  {
    v28 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CRSUIWallpaperPreferences updateWallpaperToSupportDynamicAppearance](v28);
    }

    BOOL v17 = 0;
  }
LABEL_31:

  return v17;
}

- (BOOL)_hasGaugeClusterScreen
{
  v2 = [(CRSUIWallpaperPreferences *)self vehicle];
  BOOL v3 = [v2 hasGaugeClusterScreen];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (CRVehicle)vehicle
{
  return self->_vehicle;
}

- (CRSUIWallpaperDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (CRSUIWallpaper)stagedWallpaper
{
  return self->_stagedWallpaper;
}

- (CRPairedVehicleManager)vehicleManager
{
  return self->_vehicleManager;
}

- (void)setVehicleManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleManager, 0);
  objc_storeStrong((id *)&self->_stagedWallpaper, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

void __45__CRSUIWallpaperPreferences_updateThemeData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21817A000, v0, v1, "Error saving vehicle: %@ error: %@");
}

- (void)wallpaperForLayoutIdentifier:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v4 = [a1 vehicle];
  id v5 = [v4 assetDescription];
  v6 = [a1 vehicle];
  uint64_t v7 = [v6 wallpaperDescription];
  int v8 = 138412546;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_fault_impl(&dword_21817A000, a2, OS_LOG_TYPE_FAULT, "Vehicle missing theme data. Asset: %@ Wallpaper: %@", (uint8_t *)&v8, 0x16u);
}

- (void)updateWallpaperToSupportDynamicAppearance
{
  uint64_t v7 = (objc_class *)objc_opt_class();
  int v8 = NSStringFromClass(v7);
  *(_DWORD *)a1 = 138543362;
  *a3 = v8;
  _os_log_fault_impl(&dword_21817A000, a4, OS_LOG_TYPE_FAULT, "Unsupported wallpaper type: %{public}@", a1, 0xCu);
}

@end
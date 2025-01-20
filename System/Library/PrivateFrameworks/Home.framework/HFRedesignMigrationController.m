@interface HFRedesignMigrationController
+ (BOOL)homeNeedsMigration:(id)a3;
- (BOOL)_accessoryLikeItemIsHighValue:(id)a3;
- (BOOL)_accessoryLikeObjectMustUseLargerSize:(id)a3;
- (HFRedesignMigrationController)initWithHome:(id)a3;
- (HMHome)home;
- (NAFuture)migrationFuture;
- (NSArray)legacyFavoriteTiles;
- (double)_computeUsageThreshold:(id)a3;
- (id)_clearHomeDashboardSectionOrder;
- (id)_migrateFavorites;
- (id)_migrateRoomOrder;
- (id)_migrateServiceItemsOrderInRooms;
- (id)_migrateShowOnHomeDashboard;
- (id)_migrateTileSize;
- (id)_sortAccessoriesInRoom:(id)a3 fromScoreMap:(id)a4;
- (void)_reduceScoreForRepeatingPattern:(id)a3 accessoryScores:(id)a4;
- (void)_updateScoreForAccessoriesInGroup:(id)a3 accessoryScores:(id)a4 incrementBy:(int64_t)a5 singleAccessoryIncrement:(int64_t)a6;
- (void)performMigrationIfNeeded;
- (void)performMigrationSuccessTasks;
- (void)setMigrationFuture:(id)a3;
@end

@implementation HFRedesignMigrationController

- (HFRedesignMigrationController)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFRedesignMigrationController;
  v6 = [(HFRedesignMigrationController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = +[HFItemProviderUtilities _legacyFavoriteServicesForHome:v5 withLimit:-1];
    legacyFavoriteTiles = v7->_legacyFavoriteTiles;
    v7->_legacyFavoriteTiles = (NSArray *)v8;
  }
  return v7;
}

- (void)performMigrationSuccessTasks
{
  objc_initWeak(&location, self);
  v3 = [(HFRedesignMigrationController *)self migrationFuture];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __61__HFRedesignMigrationController_performMigrationSuccessTasks__block_invoke;
  uint64_t v8 = &unk_264098F70;
  objc_copyWeak(&v9, &location);
  id v4 = (id)[v3 addSuccessBlock:&v5];

  -[HFRedesignMigrationController setMigrationFuture:](self, "setMigrationFuture:", 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setMigrationFuture:(id)a3
{
}

- (NAFuture)migrationFuture
{
  return self->_migrationFuture;
}

- (void)performMigrationIfNeeded
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_class();
  id v4 = [(HFRedesignMigrationController *)self home];
  LOBYTE(v3) = [(id)v3 homeNeedsMigration:v4];

  if ((v3 & 1) == 0)
  {
    v10 = HFLogForCategory(9uLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v24 = [(HFRedesignMigrationController *)self home];
    *(_DWORD *)buf = 138412290;
    v29 = v24;
    v25 = "HFRedesignMigrationController: Migration not needed for home: %@";
LABEL_12:
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);

    goto LABEL_13;
  }
  uint64_t v5 = [(HFRedesignMigrationController *)self home];
  uint64_t v6 = [(HFRedesignMigrationController *)self home];
  v7 = [v6 currentUser];
  uint64_t v8 = [v5 homeAccessControlForUser:v7];
  char v9 = [v8 isAdministrator];

  v10 = HFLogForCategory(9uLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (!v11) {
      goto LABEL_13;
    }
    v24 = [(HFRedesignMigrationController *)self home];
    *(_DWORD *)buf = 138412290;
    v29 = v24;
    v25 = "HFRedesignMigrationController: User is not admin; skipping migration for home %@";
    goto LABEL_12;
  }
  if (v11)
  {
    v12 = [(HFRedesignMigrationController *)self home];
    *(_DWORD *)buf = 138412290;
    v29 = v12;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Performing migration for home %@", buf, 0xCu);
  }
  v13 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Legacy favorites:", buf, 2u);
  }

  v14 = [(HFRedesignMigrationController *)self legacyFavoriteTiles];
  objc_msgSend(v14, "na_each:", &__block_literal_global_233);

  v15 = (void *)MEMORY[0x263F58190];
  v10 = [(HFRedesignMigrationController *)self _migrateFavorites];
  v27[0] = v10;
  v16 = [(HFRedesignMigrationController *)self _migrateRoomOrder];
  v27[1] = v16;
  v17 = [(HFRedesignMigrationController *)self _migrateServiceItemsOrderInRooms];
  v27[2] = v17;
  v18 = [(HFRedesignMigrationController *)self _clearHomeDashboardSectionOrder];
  v27[3] = v18;
  v19 = [(HFRedesignMigrationController *)self _migrateShowOnHomeDashboard];
  v27[4] = v19;
  v20 = [(HFRedesignMigrationController *)self _migrateTileSize];
  v27[5] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:6];
  v22 = [v15 chainFutures:v21];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__HFRedesignMigrationController_performMigrationIfNeeded__block_invoke_4;
  v26[3] = &unk_26408FAA0;
  v26[4] = self;
  v23 = [v22 flatMap:v26];
  [(HFRedesignMigrationController *)self setMigrationFuture:v23];

LABEL_13:
}

- (HMHome)home
{
  return self->_home;
}

+ (BOOL)homeNeedsMigration:(id)a3
{
  return objc_msgSend(a3, "hf_homeHasMigratedForRedesign") ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationFuture, 0);
  objc_storeStrong((id *)&self->_legacyFavoriteTiles, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

void __57__HFRedesignMigrationController_performMigrationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v4, 0xCu);
  }
}

id __57__HFRedesignMigrationController_performMigrationIfNeeded__block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) home];
    int v8 = 138412290;
    char v9 = v3;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Completed migration for home %@", (uint8_t *)&v8, 0xCu);
  }
  int v4 = [*(id *)(a1 + 32) home];
  id v5 = (id)objc_msgSend(v4, "hf_setHomeHasMigratedForRedesign:", 1);

  uint64_t v6 = [MEMORY[0x263F58190] futureWithNoResult];
  return v6;
}

void __61__HFRedesignMigrationController_performMigrationSuccessTasks__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"HFRedesignMigrationTileSizeHasUpdatedNotification" object:WeakRetained];
}

- (id)_migrateFavorites
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(HFRedesignMigrationController *)self legacyFavoriteTiles];
  unint64_t v4 = [v3 count];

  id v5 = [(HFRedesignMigrationController *)self home];
  uint64_t v6 = objc_msgSend(v5, "hf_accessoryLikeObjects");
  unint64_t v7 = [v6 count];

  if (v7)
  {
    float v8 = (double)v4 / (double)v7;
    if (v8 >= 0.33 || fabsf(v8 + -0.33) < 0.00000011921)
    {
      uint64_t v10 = 6;
      if (v4 < 6) {
        uint64_t v10 = v4;
      }
      if (v7 <= 0x11) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v10;
      }
    }
    else if (v4 >= 0xC)
    {
      uint64_t v9 = 12;
    }
    else
    {
      uint64_t v9 = v4;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  BOOL v11 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v28 = v9;
    __int16 v29 = 2048;
    unint64_t v30 = v4;
    __int16 v31 = 2048;
    unint64_t v32 = v7;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Migrating %lu favorites (%lu previous favorites, %lu accessories total)", buf, 0x20u);
  }

  v12 = [MEMORY[0x263EFF980] array];
  if (v9)
  {
    unint64_t v14 = 0;
    *(void *)&long long v13 = 138412290;
    long long v26 = v13;
    do
    {
      v15 = [(HFRedesignMigrationController *)self legacyFavoriteTiles];
      unint64_t v16 = [v15 count];

      if (v14 >= v16) {
        break;
      }
      v17 = [(HFRedesignMigrationController *)self legacyFavoriteTiles];
      v18 = [v17 objectAtIndexedSubscript:v14];
      v19 = &unk_26C0FB658;
      if ([v18 conformsToProtocol:v19]) {
        v20 = v18;
      }
      else {
        v20 = 0;
      }
      id v21 = v20;

      v22 = HFLogForCategory(9uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v26;
        uint64_t v28 = (uint64_t)v21;
        _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Migrating favorite: %@", buf, 0xCu);
      }

      v23 = objc_msgSend(v21, "hf_updateIsFavorite:", 1);
      [v12 addObject:v23];

      ++v14;
    }
    while (v9 != v14);
  }
  if ([v12 count]) {
    [MEMORY[0x263F58190] combineAllFutures:v12];
  }
  else {
  v24 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v24;
}

- (id)_migrateShowOnHomeDashboard
{
  return (id)[MEMORY[0x263F58190] futureWithNoResult];
}

- (id)_migrateRoomOrder
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [(HFRedesignMigrationController *)self home];
  unint64_t v4 = objc_msgSend(v3, "hf_reorderableRoomsList");
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [HFReorderableHomeKitItemList alloc];
  unint64_t v7 = [(HFRedesignMigrationController *)self home];
  float v8 = [(HFReorderableHomeKitItemList *)v6 initWithApplicationDataContainer:v7 category:@"homeRooms_legacy"];
  uint64_t v9 = (void *)[(HFReorderableHomeKitItemList *)v8 mutableCopy];

  uint64_t v10 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [v9 sortedHomeKitObjectIdentifiers];
    *(_DWORD *)buf = 138412290;
    unint64_t v39 = (unint64_t)v11;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Legacy room order: %@", buf, 0xCu);
  }
  if ([v9 isEmpty])
  {
    v12 = [v5 sortedHomeKitObjectIdentifiers];
    [v9 setSortedHomeKitIdentifiers:v12];

    id v13 = (id)[v9 saveWithSender:self];
  }
  __int16 v31 = v5;
  unint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
  v15 = [(HFRedesignMigrationController *)self legacyFavoriteTiles];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __50__HFRedesignMigrationController__migrateRoomOrder__block_invoke;
  v36[3] = &unk_26409CBA0;
  id v16 = v14;
  id v37 = v16;
  [v15 enumerateObjectsUsingBlock:v36];

  v17 = [(HFRedesignMigrationController *)self home];
  v18 = objc_msgSend(v17, "hf_allRooms");
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __50__HFRedesignMigrationController__migrateRoomOrder__block_invoke_2;
  v32[3] = &unk_26409CBC8;
  id v30 = v16;
  id v33 = v30;
  v34 = self;
  id v29 = v9;
  id v35 = v29;
  v19 = [v18 sortedArrayUsingComparator:v32];

  v20 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Migrating to room order:", buf, 2u);
  }

  if ([v19 count])
  {
    unint64_t v21 = 0;
    do
    {
      v22 = HFLogForCategory(9uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v19 objectAtIndexedSubscript:v21];
        v24 = [v23 name];
        v25 = [v19 objectAtIndexedSubscript:v21];
        long long v26 = [v25 uniqueIdentifier];
        *(_DWORD *)buf = 134218498;
        unint64_t v39 = v21;
        __int16 v40 = 2112;
        v41 = v24;
        __int16 v42 = 2112;
        v43 = v26;
        _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: %lu: %@ (%@)", buf, 0x20u);
      }
      ++v21;
    }
    while (v21 < [v19 count]);
  }
  [v31 setSortedHomeKitObjects:v19];
  v27 = [v31 saveWithSender:self];

  return v27;
}

void __50__HFRedesignMigrationController__migrateRoomOrder__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  if ([v17 conformsToProtocol:&unk_26C0FB658]) {
    id v5 = v17;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  unint64_t v7 = objc_msgSend(v6, "hf_safeRoom");

  if (v7)
  {
    float v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v7 uniqueIdentifier];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    BOOL v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x263EFF980] array];
    }
    id v13 = v12;

    unint64_t v14 = [NSNumber numberWithUnsignedInteger:a3];
    [v13 addObject:v14];

    v15 = *(void **)(a1 + 32);
    id v16 = [v7 uniqueIdentifier];
    [v15 setObject:v13 forKeyedSubscript:v16];
  }
}

uint64_t __50__HFRedesignMigrationController__migrateRoomOrder__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = *(void **)(a1 + 32);
  float v8 = [v5 uniqueIdentifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 valueForKeyPath:@"@avg.self"];
  BOOL v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = NSNumber;
    unint64_t v14 = [*(id *)(a1 + 40) legacyFavoriteTiles];
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = *(void **)(a1 + 32);
  id v16 = [v6 uniqueIdentifier];
  id v17 = [v15 objectForKeyedSubscript:v16];
  v18 = [v17 valueForKeyPath:@"@avg.self"];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    unint64_t v21 = NSNumber;
    v22 = [*(id *)(a1 + 40) legacyFavoriteTiles];
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v23 = [v12 compare:v20];

  if (!v23)
  {
    v24 = *(void **)(a1 + 32);
    v25 = [v5 uniqueIdentifier];
    long long v26 = [v24 objectForKeyedSubscript:v25];
    v27 = [v26 objectAtIndex:0];
    uint64_t v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v30 = NSNumber;
      __int16 v31 = [*(id *)(a1 + 40) legacyFavoriteTiles];
      objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
      id v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v32 = *(void **)(a1 + 32);
    id v33 = [v6 uniqueIdentifier];
    v34 = [v32 objectForKeyedSubscript:v33];
    id v35 = [v34 objectAtIndex:0];
    v36 = v35;
    if (v35)
    {
      id v37 = v35;
    }
    else
    {
      v38 = NSNumber;
      unint64_t v39 = [*(id *)(a1 + 40) legacyFavoriteTiles];
      objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "count"));
      id v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v23 = [v29 compare:v37];

    if (!v23)
    {
      __int16 v40 = NSNumber;
      v41 = objc_msgSend(v5, "hf_accessoryLikeObjects");
      __int16 v42 = objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v41, "count"));

      v43 = NSNumber;
      uint64_t v44 = objc_msgSend(v6, "hf_accessoryLikeObjects");
      v45 = objc_msgSend(v43, "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));

      uint64_t v23 = [v45 compare:v42];
      if (!v23)
      {
        v46 = [*(id *)(a1 + 48) sortedHomeKitObjectComparator];
        uint64_t v23 = ((uint64_t (**)(void, id, id))v46)[2](v46, v5, v6);
      }
    }
  }

  return v23;
}

- (id)_clearHomeDashboardSectionOrder
{
  id v3 = [(HFRedesignMigrationController *)self home];
  unint64_t v4 = objc_msgSend(v3, "hf_reorderableDashboardSectionList");

  [v4 setSortedItems:MEMORY[0x263EFFA68]];
  id v5 = [v4 saveWithSender:self];

  return v5;
}

- (id)_migrateServiceItemsOrderInRooms
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  v50 = +[HFAccessoryListUtilities sortedAccessoryTypeGroups];
  id v49 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v51 = self;
  id v3 = [(HFRedesignMigrationController *)self home];
  unint64_t v4 = objc_msgSend(v3, "hf_allRooms");

  obuint64_t j = v4;
  uint64_t v45 = [v4 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v65;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v64 + 1) + 8 * v5);
        unint64_t v7 = [[HFReorderableHomeKitItemList alloc] initWithApplicationDataContainer:v6 category:@"roomServices_legacy"];
        float v8 = (void *)[(HFReorderableHomeKitItemList *)v7 mutableCopy];

        uint64_t v9 = HFLogForCategory(9uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 sortedHomeKitObjectIdentifiers];
          *(_DWORD *)buf = 138412546;
          id v71 = v10;
          __int16 v72 = 2112;
          v73 = v6;
          _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Legacy service item order: %@ for room %@", buf, 0x16u);
        }
        uint64_t v47 = v5;

        if ([v8 isEmpty])
        {
          BOOL v11 = objc_msgSend(v6, "hf_reorderableServicesList");
          id v12 = [v11 sortedHomeKitObjectIdentifiers];
          [v8 setSortedHomeKitIdentifiers:v12];

          id v13 = (id)[v8 saveWithSender:v51];
        }
        unint64_t v14 = objc_msgSend(v6, "hf_accessoryLikeObjects");
        v15 = [v14 allObjects];
        id v16 = objc_msgSend(v15, "na_filter:", &__block_literal_global_147_2);
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_2;
        v62[3] = &unk_26409CBF0;
        id v46 = v8;
        id v63 = v46;
        id v17 = [v16 sortedArrayUsingComparator:v62];

        id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v48 = v17;
        uint64_t v19 = [v48 countByEnumeratingWithState:&v58 objects:v69 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v59 != v21) {
                objc_enumerationMutation(v48);
              }
              uint64_t v23 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              v24 = [v23 accessoryType];
              v56[0] = MEMORY[0x263EF8330];
              v56[1] = 3221225472;
              v56[2] = __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_3;
              v56[3] = &unk_26408EDD8;
              id v25 = v24;
              id v57 = v25;
              long long v26 = objc_msgSend(v50, "na_firstObjectPassingTest:", v56);
              if (!v26)
              {
                long long v26 = +[HFAccessoryTypeGroup otherAccessoryTypeGroup];
              }
              v27 = [v26 uniqueIdentifier];
              uint64_t v28 = [v27 UUIDString];

              if (v28)
              {
                id v29 = [v18 objectForKeyedSubscript:v28];
                if (!v29)
                {
                  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
                  [v18 setValue:v29 forKey:v28];
                }
                [v29 addObject:v23];
              }
              else
              {
                id v29 = HFLogForCategory(9uLL);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v71 = v25;
                  __int16 v72 = 2112;
                  v73 = v23;
                  _os_log_impl(&dword_20B986000, v29, OS_LOG_TYPE_DEFAULT, "HFRedesignMigrationController: Couldn't find an accessory type group for this accessory, skipping. %@ %@", buf, 0x16u);
                }
              }
            }
            uint64_t v20 = [v48 countByEnumeratingWithState:&v58 objects:v69 count:16];
          }
          while (v20);
        }

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v30 = v18;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v52 objects:v68 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v53 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v52 + 1) + 8 * j);
              v36 = [v30 objectForKeyedSubscript:v35];
              id v37 = objc_msgSend(v36, "na_map:", &__block_literal_global_170_2);
              v38 = [@"roomServicesGroupedByType-" stringByAppendingString:v35];
              unint64_t v39 = [(HFReorderableHomeKitItemList *)[HFMutableReorderableHomeKitItemList alloc] initWithApplicationDataContainer:v6 category:v38];
              [(HFMutableReorderableHomeKitItemList *)v39 setSortedHomeKitObjects:v37];
              __int16 v40 = [(HFMutableReorderableHomeKitItemList *)v39 saveWithSender:v51];
              [v49 addObject:v40];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v52 objects:v68 count:16];
          }
          while (v32);
        }

        uint64_t v5 = v47 + 1;
      }
      while (v47 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v45);
  }

  v41 = [MEMORY[0x263F58190] combineAllFutures:v49];

  return v41;
}

uint64_t __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 homeKitObject];
  uint64_t v3 = [v2 conformsToProtocol:&unk_26C1345C0];

  return v3;
}

uint64_t __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  unint64_t v7 = [v4 sortedHomeKitObjectComparator];
  float v8 = [v6 homeKitObject];

  uint64_t v9 = [v5 homeKitObject];

  uint64_t v10 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v8, v9);
  return v10;
}

uint64_t __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsType:*(void *)(a1 + 32)];
}

uint64_t __65__HFRedesignMigrationController__migrateServiceItemsOrderInRooms__block_invoke_167(uint64_t a1, void *a2)
{
  return [a2 homeKitObject];
}

- (void)_updateScoreForAccessoriesInGroup:(id)a3 accessoryScores:(id)a4 incrementBy:(int64_t)a5 singleAccessoryIncrement:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v16 = [v10 objectForKey:v15];
        uint64_t v17 = [v16 integerValue];
        if ([v9 count] == 1) {
          int64_t v18 = a6;
        }
        else {
          int64_t v18 = 0;
        }
        uint64_t v19 = [NSNumber numberWithInteger:v17 + a5 + v18];

        [v10 setObject:v19 forKey:v15];
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (BOOL)_accessoryLikeItemIsHighValue:(id)a3
{
  v13[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F0D6F8];
  id v4 = a3;
  id v5 = +[HFAccessoryType serviceType:v3];
  id v6 = +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x263F0D798], v5);
  v13[1] = v6;
  unint64_t v7 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D708]];
  v13[2] = v7;
  float v8 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7D8]];
  v13[3] = v8;
  id v9 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D870]];
  v13[4] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:5];

  uint64_t v11 = [v4 accessoryType];

  LOBYTE(v4) = [v10 containsObject:v11];
  return (char)v4;
}

- (BOOL)_accessoryLikeObjectMustUseLargerSize:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F0D708];
  id v4 = a3;
  id v5 = +[HFAccessoryType serviceType:v3];
  v10[0] = v5;
  id v6 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D870]];
  v10[1] = v6;
  unint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  float v8 = [v4 accessoryType];

  LOBYTE(v5) = [v7 containsObject:v8];
  return (char)v5;
}

- (id)_sortAccessoriesInRoom:(id)a3 fromScoreMap:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(a3, "hf_reorderableServicesList");
  unint64_t v7 = [v6 sortedHomeKitObjectComparator];

  float v8 = [v5 keyEnumerator];

  id v9 = [v8 allObjects];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__HFRedesignMigrationController__sortAccessoriesInRoom_fromScoreMap___block_invoke;
  v13[3] = &unk_26409CC38;
  id v14 = v7;
  id v10 = v7;
  uint64_t v11 = [v9 sortedArrayUsingComparator:v13];

  return v11;
}

uint64_t __69__HFRedesignMigrationController__sortAccessoriesInRoom_fromScoreMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 homeKitObject];
  unint64_t v7 = [v5 homeKitObject];

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

- (double)_computeUsageThreshold:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          id v10 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          [v10 doubleValue];
          double v12 = v11;

          double v8 = v8 + v12;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v13 = v8 / (double)(unint64_t)[v4 count] * 1.2;
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (void)_reduceScoreForRepeatingPattern:(id)a3 accessoryScores:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 objectForKey:v10];
  uint64_t v7 = [v6 integerValue];

  if (v7 >= 1)
  {
    uint64_t v8 = 5;
    if (v7 > 5) {
      uint64_t v8 = v7;
    }
    id v9 = [NSNumber numberWithInteger:v8 - 5];
    [v5 setObject:v9 forKey:v10];
  }
}

- (id)_migrateTileSize
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__HFRedesignMigrationController__migrateTileSize__block_invoke;
  aBlock[3] = &unk_26409CC60;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  id v4 = [(HFRedesignMigrationController *)self home];
  id v5 = objc_msgSend(v4, "hf_accessoryRepresentableUsageCountsByRoomWithFilter:", &__block_literal_global_179_0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__HFRedesignMigrationController__migrateTileSize__block_invoke_3;
  v9[3] = &unk_26409CCD0;
  v9[4] = self;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = [v5 flatMap:v9];

  return v7;
}

BOOL __49__HFRedesignMigrationController__migrateTileSize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _accessoryLikeObjectMustUseLargerSize:v5])
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) legacyFavoriteTiles];
    id v9 = [v5 homeKitObject];
    if ([v8 containsObject:v9])
    {
    }
    else
    {
      char v10 = [*(id *)(a1 + 32) _accessoryLikeItemIsHighValue:v5];

      if ((v10 & 1) == 0)
      {
        BOOL v7 = 0;
        goto LABEL_8;
      }
    }
    double v11 = [v6 objectForKey:v5];
    uint64_t v12 = [v11 integerValue];

    BOOL v7 = v12 > 1;
  }
LABEL_8:

  return v7;
}

uint64_t __49__HFRedesignMigrationController__migrateTileSize__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveShowInHomeDashboard");
}

id __49__HFRedesignMigrationController__migrateTileSize__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v92 = a2;
  unint64_t v3 = 0x263F08000uLL;
  v95 = [MEMORY[0x263F08968] mapTableWithStrongToStrongObjects];
  id v4 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Starting Tile Size Migration", buf, 2u);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v5 = [*(id *)(a1 + 32) home];
  id v6 = objc_msgSend(v5, "hf_allRooms");

  obuint64_t j = v6;
  uint64_t v93 = [v6 countByEnumeratingWithState:&v122 objects:v133 count:16];
  if (v93)
  {
    uint64_t v91 = *(void *)v123;
    *(void *)&long long v7 = 138412546;
    long long v88 = v7;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v123 != v91) {
          objc_enumerationMutation(obj);
        }
        uint64_t v94 = v8;
        id v9 = *(void **)(*((void *)&v122 + 1) + 8 * v8);
        v103 = objc_msgSend(v92, "objectForKey:", v9, v88);
        objc_msgSend(*(id *)(a1 + 32), "_computeUsageThreshold:");
        double v11 = v10;
        uint64_t v12 = [*(id *)(v3 + 2408) mapTableWithStrongToStrongObjects];
        id v97 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v101 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v99 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        v96 = v9;
        double v13 = objc_msgSend(v9, "hf_accessoryLikeObjects");
        id v14 = objc_msgSend(v13, "na_filter:", &__block_literal_global_184_0);

        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v118 objects:v132 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v119;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v119 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v118 + 1) + 8 * i);
              if (objc_msgSend(v20, "hf_effectiveShowInHomeDashboard"))
              {
                long long v21 = [*(id *)(a1 + 32) legacyFavoriteTiles];
                long long v22 = [v20 homeKitObject];
                int v23 = [v21 containsObject:v22];

                if (v23) {
                  [v97 addObject:v20];
                }
                if ([*(id *)(a1 + 32) _accessoryLikeItemIsHighValue:v20]) {
                  [v101 addObject:v20];
                }
                v24 = [v103 objectForKey:v20];
                [v24 doubleValue];
                double v26 = v25;

                if (v26 > v11) {
                  [v99 addObject:v20];
                }
                v27 = [v20 accessoryType];
                uint64_t v28 = [v12 objectForKey:v27];
                id v29 = v28;
                if (v28) {
                  id v30 = v28;
                }
                else {
                  id v30 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                }
                uint64_t v31 = v30;

                [v31 addObject:v20];
                uint64_t v32 = [v20 accessoryType];
                [v12 setObject:v31 forKey:v32];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v118 objects:v132 count:16];
          }
          while (v17);
        }

        unint64_t v3 = 0x263F08000uLL;
        uint64_t v33 = [MEMORY[0x263F08968] mapTableWithStrongToStrongObjects];
        if ((unint64_t)[v15 count] >= 2) {
          [*(id *)(a1 + 32) _updateScoreForAccessoriesInGroup:v97 accessoryScores:v33 incrementBy:1 singleAccessoryIncrement:3];
        }
        [*(id *)(a1 + 32) _updateScoreForAccessoriesInGroup:v101 accessoryScores:v33 incrementBy:2 singleAccessoryIncrement:2];
        [*(id *)(a1 + 32) _updateScoreForAccessoriesInGroup:v99 accessoryScores:v33 incrementBy:1 singleAccessoryIncrement:1];
        v34 = HFLogForCategory(9uLL);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = [v96 name];
          *(_DWORD *)buf = v88;
          id v129 = v96;
          __int16 v130 = 2112;
          v131 = v35;
          _os_log_impl(&dword_20B986000, v34, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: Room: %@ %@", buf, 0x16u);
        }
        v36 = HFLogForCategory(9uLL);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v129 = v97;
          _os_log_impl(&dword_20B986000, v36, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: favoriteAccessories: %@", buf, 0xCu);
        }

        id v37 = HFLogForCategory(9uLL);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v129 = v101;
          _os_log_impl(&dword_20B986000, v37, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: highValueAccessories: %@", buf, 0xCu);
        }

        v38 = HFLogForCategory(9uLL);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v129 = v99;
          _os_log_impl(&dword_20B986000, v38, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: mostUsedAccessories: %@", buf, 0xCu);
        }

        unint64_t v39 = HFLogForCategory(9uLL);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v129 = v12;
          _os_log_impl(&dword_20B986000, v39, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: accessoriesByType: %@", buf, 0xCu);
        }

        if ((unint64_t)[v12 count] >= 2)
        {
          long long v116 = 0u;
          long long v117 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          id v40 = v12;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v114 objects:v127 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            v90 = v33;
            uint64_t v43 = 0;
            uint64_t v44 = 0;
            uint64_t v45 = *(void *)v115;
            while (2)
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v115 != v45) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v47 = [v40 objectForKey:*(void *)(*((void *)&v114 + 1) + 8 * j)];
                if ([v47 count] == 1)
                {
                  if (v44)
                  {

                    uint64_t v44 = 0;
                    uint64_t v33 = v90;
                    unint64_t v3 = 0x263F08000;
                    goto LABEL_56;
                  }
                  uint64_t v44 = [v47 anyObject];
                }
                else if ((unint64_t)[v47 count] > 1)
                {
                  ++v43;
                }
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v114 objects:v127 count:16];
              if (v42) {
                continue;
              }
              break;
            }

            id v48 = v44;
            if (v44)
            {
              uint64_t v33 = v90;
              unint64_t v3 = 0x263F08000;
              if (v43 < 1) {
                goto LABEL_57;
              }
              id v49 = [v90 objectForKey:v44];
              objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v49, "integerValue") + 1);
              id v40 = (id)objc_claimAutoreleasedReturnValue();

              [v90 setObject:v40 forKey:v44];
LABEL_56:

              id v48 = v44;
            }
            else
            {
              uint64_t v33 = v90;
              unint64_t v3 = 0x263F08000;
            }
LABEL_57:

            goto LABEL_58;
          }
          uint64_t v44 = 0;
          goto LABEL_56;
        }
LABEL_58:
        v110[0] = MEMORY[0x263EF8330];
        v110[1] = 3221225472;
        v110[2] = __49__HFRedesignMigrationController__migrateTileSize__block_invoke_185;
        v110[3] = &unk_26409CCA8;
        uint64_t v50 = *(void *)(a1 + 32);
        id v111 = v33;
        uint64_t v112 = v50;
        id v113 = v12;
        id v51 = v12;
        id v52 = v33;
        objc_msgSend(v15, "na_each:", v110);
        [v95 setObject:v52 forKey:v96];

        uint64_t v8 = v94 + 1;
      }
      while (v94 + 1 != v93);
      uint64_t v53 = [obj countByEnumeratingWithState:&v122 objects:v133 count:16];
      uint64_t v93 = v53;
    }
    while (v53);
  }

  long long v54 = [*(id *)(a1 + 32) home];
  long long v55 = objc_msgSend(v54, "hf_orderedRooms");

  unint64_t v56 = 0;
  while (1)
  {
    unint64_t v57 = [v55 count] ? objc_msgSend(v55, "count") - 1 : 0;
    if (v56 >= v57) {
      break;
    }
    long long v58 = [v55 objectAtIndexedSubscript:v56];
    long long v59 = [v55 objectAtIndexedSubscript:++v56];
    long long v60 = [v95 objectForKey:v58];
    long long v61 = [v95 objectForKey:v59];
    if ([v60 count] && objc_msgSend(v61, "count"))
    {
      v62 = [*(id *)(a1 + 32) _sortAccessoriesInRoom:v58 fromScoreMap:v60];
      id v63 = [*(id *)(a1 + 32) _sortAccessoriesInRoom:v59 fromScoreMap:v61];
      v104 = v62;
      long long v64 = [v62 firstObject];
      long long v65 = [v63 firstObject];
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()
        && (*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()
        && ([*(id *)(a1 + 32) _accessoryLikeObjectMustUseLargerSize:v65] & 1) == 0)
      {
        [*(id *)(a1 + 32) _reduceScoreForRepeatingPattern:v65 accessoryScores:v61];
      }
    }
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v66 = v55;
  uint64_t v102 = [v66 countByEnumeratingWithState:&v106 objects:v126 count:16];
  if (!v102)
  {

    v68 = 0;
LABEL_105:
    v83 = [v68 firstObject];
    id v84 = (id)objc_msgSend(v83, "hf_setTileSize:", @"HFTileResizableSizeMedium");

    goto LABEL_106;
  }
  char v67 = 0;
  v68 = 0;
  uint64_t v100 = *(void *)v107;
  id v98 = v66;
  do
  {
    for (uint64_t k = 0; k != v102; ++k)
    {
      v105 = v68;
      if (*(void *)v107 != v100) {
        objc_enumerationMutation(v98);
      }
      uint64_t v70 = *(void *)(*((void *)&v106 + 1) + 8 * k);
      id v71 = [v95 objectForKey:v70];
      __int16 v72 = [*(id *)(a1 + 32) _sortAccessoriesInRoom:v70 fromScoreMap:v71];
      if ([v72 count])
      {
        unint64_t v73 = 0;
        do
        {
          v74 = [v72 objectAtIndexedSubscript:v73];
          if (v73 == [v72 count] - 2 && (unint64_t)objc_msgSend(v72, "count") >= 4) {
            [*(id *)(a1 + 32) _reduceScoreForRepeatingPattern:v74 accessoryScores:v71];
          }
          if (v73 == [v72 count] - 1 && (unint64_t)objc_msgSend(v72, "count") >= 2)
          {
            uint64_t v75 = *(void *)(a1 + 40);
            v76 = [v72 objectAtIndexedSubscript:v73 - 1];
            LOBYTE(v75) = (*(uint64_t (**)(uint64_t, void *, void *))(v75 + 16))(v75, v76, v71);

            if ((v75 & 1) == 0) {
              [v71 setObject:&unk_26C0F7ED8 forKey:v74];
            }
          }
          if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))())
          {
            id v77 = (id)objc_msgSend(v74, "hf_setTileSize:", @"HFTileResizableSizeMedium");
            unint64_t v78 = v73 + 1;
            if ([v72 count] > v73 + 1)
            {
              v79 = [v72 objectAtIndexedSubscript:v73 + 1];
              [*(id *)(a1 + 32) _reduceScoreForRepeatingPattern:v79 accessoryScores:v71];
            }
            if ([v72 count] > v73 + 2)
            {
              v80 = objc_msgSend(v72, "objectAtIndexedSubscript:");
              [*(id *)(a1 + 32) _reduceScoreForRepeatingPattern:v80 accessoryScores:v71];
            }
            char v67 = 1;
          }
          else
          {
            unint64_t v78 = v73 + 1;
          }

          unint64_t v73 = v78;
        }
        while (v78 < [v72 count]);
      }
      v68 = v105;
      if (!v105 || (unint64_t v81 = [v72 count], v81 > objc_msgSend(v105, "count")))
      {
        id v82 = v72;

        v68 = v82;
      }
    }
    id v66 = v98;
    uint64_t v102 = [v98 countByEnumeratingWithState:&v106 objects:v126 count:16];
  }
  while (v102);

  if ((v67 & 1) == 0) {
    goto LABEL_105;
  }
LABEL_106:
  v85 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v129 = v95;
    _os_log_impl(&dword_20B986000, v85, OS_LOG_TYPE_DEFAULT, "Tile Size Migration: Room Scores: %@", buf, 0xCu);
  }

  v86 = [MEMORY[0x263F58190] futureWithNoResult];

  return v86;
}

uint64_t __49__HFRedesignMigrationController__migrateTileSize__block_invoke_182(uint64_t a1, void *a2)
{
  id v2 = [a2 homeKitObject];
  uint64_t v3 = [v2 conformsToProtocol:&unk_26C1345C0];

  return v3;
}

void __49__HFRedesignMigrationController__migrateTileSize__block_invoke_185(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 accessoryType];
  id v4 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D780]];
  char v5 = [v3 isEqual:v4];

  if (v5) {
    goto LABEL_2;
  }
  if ([*(id *)(a1 + 40) _accessoryLikeObjectMustUseLargerSize:v12])
  {
    id v6 = v12;
    long long v7 = &unk_26C0F7EF0;
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 40) _accessoryLikeItemIsHighValue:v12])
  {
    uint64_t v8 = *(void **)(a1 + 48);
    id v9 = [v12 accessoryType];
    double v10 = [v8 objectForKey:v9];
    unint64_t v11 = [v10 count];

    if (v11 >= 2)
    {
LABEL_2:
      id v6 = v12;
      long long v7 = &unk_26C0F7ED8;
LABEL_5:
      [*(id *)(a1 + 32) setObject:v7 forKey:v6];
    }
  }
}

- (NSArray)legacyFavoriteTiles
{
  return self->_legacyFavoriteTiles;
}

@end
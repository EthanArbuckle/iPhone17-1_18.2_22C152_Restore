@interface ATXDefaultHomeScreenItemUpdater
+ (NSDictionary)assets;
- (ATXDefaultHomeScreenItemUpdater)initWithSpotlightAppLaunchHistogram:(id)a3;
- (BOOL)_isDayZeroExperience;
- (id)_retrieveLastUpdateDate;
- (void)_updateAllDefaultsOnQueueWithReason:(id)a3;
- (void)_updateAmbientDefaultsOnQueueWithReason:(id)a3 appLaunchCounts:(id)a4;
- (void)_updateHomeScreenDefaultsOnQueueWithReason:(id)a3 appLaunchCounts:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateDefaultsDueToAmbientConfigUpdate;
- (void)updateDefaultsDueToRelevantHomeScreenConfigUpdate;
- (void)updateDefaultsIfNeededWithSystemDescriptors:(id)a3 installDatesCache:(id)a4 reason:(id)a5;
- (void)updateDefaultsWithSystemDescriptors:(id)a3 installDatesCache:(id)a4 reason:(id)a5;
- (void)waitForPendingAsynchronousOperations;
@end

@implementation ATXDefaultHomeScreenItemUpdater

- (ATXDefaultHomeScreenItemUpdater)initWithSpotlightAppLaunchHistogram:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXDefaultHomeScreenItemUpdater;
  v6 = [(ATXDefaultHomeScreenItemUpdater *)&v14 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("ATXDefaultHomeScreenItemUpdater", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_spotlightAppLaunchHistogram, a3);
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
      uint64_t v11 = [v10 initWithSuiteName:*MEMORY[0x1E4F4B688]];
      userDefaults = v6->_userDefaults;
      v6->_userDefaults = (NSUserDefaults *)v11;

      [(NSUserDefaults *)v6->_userDefaults addObserver:v6 forKeyPath:@"ATXWidgetsForceDayZeroAddSheet" options:0 context:0];
    }
  }

  return v6;
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F93B08] isInternalBuild]) {
    [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"ATXWidgetsForceDayZeroAddSheet"];
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXDefaultHomeScreenItemUpdater;
  [(ATXDefaultHomeScreenItemUpdater *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"ATXWidgetsForceDayZeroAddSheet"])
  {
    v13 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: force day zero add sheet toggled, refreshing suggestions", buf, 2u);
    }

    [(ATXDefaultHomeScreenItemUpdater *)self updateDefaultsDueToRelevantHomeScreenConfigUpdate];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ATXDefaultHomeScreenItemUpdater;
    [(ATXDefaultHomeScreenItemUpdater *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

+ (NSDictionary)assets
{
  uint64_t v2 = objc_opt_class();

  return (NSDictionary *)+[ATXAssets2 dictionaryForClass:v2];
}

- (void)updateDefaultsIfNeededWithSystemDescriptors:(id)a3 installDatesCache:(id)a4 reason:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [(ATXDefaultHomeScreenItemUpdater *)self _retrieveLastUpdateDate];
    id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v13 = [MEMORY[0x1E4F1C9C8] now];
    objc_super v14 = [v12 dateByAddingUnit:16 value:-1 toDate:v13 options:0];

    if (!v11
      || ([v14 earlierDate:v11],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v15 == v11))
    {
      [(ATXDefaultHomeScreenItemUpdater *)self updateDefaultsWithSystemDescriptors:v8 installDatesCache:v9 reason:v10];
    }
    else
    {
      v16 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1A790D000, v16, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: Not updating stack and widget suggestions because last update was recent (%@)", (uint8_t *)&v17, 0xCu);
      }
    }
  }
}

- (void)updateDefaultsWithSystemDescriptors:(id)a3 installDatesCache:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: Updating default stack and widget suggestions", buf, 2u);
    }

    internalQueue = self->_internalQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __96__ATXDefaultHomeScreenItemUpdater_updateDefaultsWithSystemDescriptors_installDatesCache_reason___block_invoke;
    v13[3] = &unk_1E5D07ED0;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(internalQueue, v13);
  }
}

uint64_t __96__ATXDefaultHomeScreenItemUpdater_updateDefaultsWithSystemDescriptors_installDatesCache_reason___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 _updateAllDefaultsOnQueueWithReason:v3];
}

- (void)updateDefaultsDueToRelevantHomeScreenConfigUpdate
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ATXDefaultHomeScreenItemUpdater_updateDefaultsDueToRelevantHomeScreenConfigUpdate__block_invoke;
  block[3] = &unk_1E5D05300;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __84__ATXDefaultHomeScreenItemUpdater_updateDefaultsDueToRelevantHomeScreenConfigUpdate__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: updating defaults due to relevant home screen config update", v5, 2u);
    }

    uint64_t v3 = objc_opt_new();
    v4 = [v3 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

    [*(id *)(a1 + 32) _updateHomeScreenDefaultsOnQueueWithReason:@"Home Screen config update" appLaunchCounts:v4];
  }
}

- (void)updateDefaultsDueToAmbientConfigUpdate
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ATXDefaultHomeScreenItemUpdater_updateDefaultsDueToAmbientConfigUpdate__block_invoke;
  block[3] = &unk_1E5D05300;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __73__ATXDefaultHomeScreenItemUpdater_updateDefaultsDueToAmbientConfigUpdate__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: updating defaults due to ambient config update", v5, 2u);
    }

    uint64_t v3 = objc_opt_new();
    v4 = [v3 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

    [*(id *)(a1 + 32) _updateAmbientDefaultsOnQueueWithReason:@"Ambient config update" appLaunchCounts:v4];
  }
}

- (void)waitForPendingAsynchronousOperations
{
}

- (void)_updateAllDefaultsOnQueueWithReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: updating defaults with reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ([(NSSet *)self->_descriptors count])
  {
    v6 = objc_opt_new();
    v7 = [v6 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

    [(ATXDefaultHomeScreenItemUpdater *)self _updateHomeScreenDefaultsOnQueueWithReason:v4 appLaunchCounts:v7];
    [(ATXDefaultHomeScreenItemUpdater *)self _updateAmbientDefaultsOnQueueWithReason:v4 appLaunchCounts:v7];
  }
}

- (void)_updateHomeScreenDefaultsOnQueueWithReason:(id)a3 appLaunchCounts:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)os_transaction_create();
  v7 = objc_alloc_init(ATXHomeScreenConfigCache);
  id v23 = 0;
  int v8 = [(ATXHomeScreenConfigCache *)v7 loadHomeScreenPageConfigurationsWithError:&v23];
  id v9 = v23;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  id v11 = v10;

  if (v9)
  {
    id v12 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[ATXDefaultHomeScreenItemUpdater _updateHomeScreenDefaultsOnQueueWithReason:appLaunchCounts:]";
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: %s error fetching home screen config: %@", buf, 0x16u);
    }
  }
  v13 = [ATXDefaultHomeScreenItemProducer alloc];
  descriptors = self->_descriptors;
  descriptorInstallDates = self->_descriptorInstallDates;
  BOOL v16 = [(ATXDefaultHomeScreenItemUpdater *)self _isDayZeroExperience];
  int v17 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:](v13, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:", descriptors, descriptorInstallDates, v11, v16, [MEMORY[0x1E4F93B08] isiPad], self->_spotlightAppLaunchHistogram, v5);

  v18 = [(ATXDefaultHomeScreenItemProducer *)v17 update];
  uint64_t v19 = +[ATXDefaultHomeScreenItemManager sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__ATXDefaultHomeScreenItemUpdater__updateHomeScreenDefaultsOnQueueWithReason_appLaunchCounts___block_invoke;
  v21[3] = &unk_1E5D06F40;
  id v22 = v6;
  id v20 = v6;
  [v19 writeHomeScreenUpdate:v18 completionHandler:v21];
}

void __94__ATXDefaultHomeScreenItemUpdater__updateHomeScreenDefaultsOnQueueWithReason_appLaunchCounts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __94__ATXDefaultHomeScreenItemUpdater__updateHomeScreenDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v3 = [v10 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    [v3 setObject:v11 forKey:@"AddWidgetSuggestionsLastUpdateDate"];
  }
  id v12 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: Finished updating home screen default stack and widget suggestions", v13, 2u);
  }
}

- (void)_updateAmbientDefaultsOnQueueWithReason:(id)a3 appLaunchCounts:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)os_transaction_create();
  uint64_t v7 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke;
  v10[3] = &unk_1E5D08588;
  v10[4] = self;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 readStacksWithCompletion:v10];
}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2;
  block[3] = &unk_1E5D08560;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  id v10 = objc_opt_new();
  id v11 = objc_msgSend(*(id *)(a1 + 40), "_pas_mappedArrayWithTransform:", &__block_literal_global_45_0);
  [v10 setStacks:v11];

  v19[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v13 = [ATXDefaultHomeScreenItemProducer alloc];
  uint64_t v14 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:](v13, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:appLaunchCounts:", *(void *)(*(void *)(a1 + 48) + 16), *(void *)(*(void *)(a1 + 48) + 24), v12, 0, [MEMORY[0x1E4F93B08] isiPad], *(void *)(*(void *)(a1 + 48) + 40), *(void *)(a1 + 56));
  id v15 = [(ATXDefaultHomeScreenItemProducer *)v14 update];
  id v16 = +[ATXDefaultHomeScreenItemManager sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_46;
  v17[3] = &unk_1E5D06F40;
  id v18 = *(id *)(a1 + 64);
  [v16 writeAmbientUpdate:v15 completionHandler:v17];
}

id __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_42(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [v2 widgets];

  uint64_t v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_84);
  [v3 setWidgets:v5];

  return v3;
}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_46(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_46_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  id v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: Finished updating ambient default stack and widget suggestions", v11, 2u);
  }
}

- (BOOL)_isDayZeroExperience
{
  if ([MEMORY[0x1E4F93B08] isInternalBuild]
    && [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"ATXWidgetsForceDayZeroAddSheet"])
  {
    uint64_t v3 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemUpdater: on day zero path because of user default to force day zero preference", v8, 2u);
    }

    return 1;
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    [v5 uniqueAppsLaunchedOverLast28Days];
    BOOL v4 = v6 < 15.0;
  }
  return v4;
}

- (id)_retrieveLastUpdateDate
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  BOOL v4 = [v3 objectForKey:@"AddWidgetSuggestionsLastUpdateDate"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightAppLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_descriptorInstallDates, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __94__ATXDefaultHomeScreenItemUpdater__updateHomeScreenDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__ATXDefaultHomeScreenItemUpdater__updateAmbientDefaultsOnQueueWithReason_appLaunchCounts___block_invoke_2_46_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
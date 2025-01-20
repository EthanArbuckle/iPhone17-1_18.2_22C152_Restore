@interface ATXDefaultHomeScreenItemManager
+ (BOOL)isCHSWidgetDescriptorAllowedForAmbientOnboardingStacks:(id)a3;
+ (BOOL)isDescriptorSpecial:(id)a3;
+ (BOOL)shouldFilterOutWidgetDescriptorDueToAppProtection:(id)a3 fromDisabledApps:(id)a4;
+ (id)_descriptorsByFilteringDescriptors:(id)a3 variant:(unint64_t)a4 fromAppsDisabledOnHomeScreen:(id)a5;
+ (id)_onboardingStacksByFilteringDescriptorsInOnboardingStacks:(id)a3 variant:(unint64_t)a4;
+ (id)_widgetStackByFilteringDescriptorsInWidgetStack:(id)a3 variant:(unint64_t)a4;
+ (id)sharedInstance;
- (ATXDefaultHomeScreenItemManager)init;
- (ATXDefaultHomeScreenItemManager)initWithHomeScreenPath:(id)a3 ambientPath:(id)a4;
- (id)_JSONCompatible:(id)a3;
- (id)_generateOnboardingStacksForVariant:(unint64_t)a3;
- (id)fetchWidgetDiscoverabilityStacks;
- (void)_fetchSmartStackOfVariant:(unint64_t)a3 localObserver:(int)a4 completionHandler:(id)a5;
- (void)_logFetchedOnboardingStack:(id)a3;
- (void)_readAmbientUpdateFromFileWithCompletionHandler:(id)a3;
- (void)_readHomeScreenUpdateFromFileWithCompletionHandler:(id)a3;
- (void)_readUpdateFromFileAtPath:(id)a3 completionHandler:(id)a4;
- (void)_writeUpdate:(id)a3 atPath:(id)a4 completionHandler:(id)a5;
- (void)fetchDefaultStacksJSONWithCompletionHandler:(id)a3;
- (void)fetchGalleryItemsForVariant:(unint64_t)a3 gridSize:(unint64_t)a4 supportedFamilies:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchSmartStackOfVariant:(unint64_t)a3 completionHandler:(id)a4;
- (void)fetchSuggestedGalleryItemsOfGridSize:(unint64_t)a3 widgetFamilyMask:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)fetchWidgetDiscoverabilityStacks;
- (void)writeAmbientUpdate:(id)a3 completionHandler:(id)a4;
- (void)writeHomeScreenUpdate:(id)a3 completionHandler:(id)a4;
@end

@implementation ATXDefaultHomeScreenItemManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_78);
  }
  v2 = (void *)sharedInstance_manager;

  return v2;
}

uint64_t __49__ATXDefaultHomeScreenItemManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_manager;
  sharedInstance_manager = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXDefaultHomeScreenItemManager)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXDefaultWidgetStacks"];
  v4 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXAmbientDefaultWidgetStacks"];
  v5 = [(ATXDefaultHomeScreenItemManager *)self initWithHomeScreenPath:v3 ambientPath:v4];

  return v5;
}

- (ATXDefaultHomeScreenItemManager)initWithHomeScreenPath:(id)a3 ambientPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXDefaultHomeScreenItemManager;
  v8 = [(ATXDefaultHomeScreenItemManager *)&v17 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("ATXDefaultWidgetManager", v9);
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v6 copy];
    homeScreenPath = v8->_homeScreenPath;
    v8->_homeScreenPath = (NSString *)v12;

    uint64_t v14 = [v7 copy];
    ambientPath = v8->_ambientPath;
    v8->_ambientPath = (NSString *)v14;
  }
  return v8;
}

- (void)writeHomeScreenUpdate:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  homeScreenPath = self->_homeScreenPath;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__ATXDefaultHomeScreenItemManager_writeHomeScreenUpdate_completionHandler___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v6;
  id v8 = v6;
  [(ATXDefaultHomeScreenItemManager *)self _writeUpdate:a3 atPath:homeScreenPath completionHandler:v9];
}

void __75__ATXDefaultHomeScreenItemManager_writeHomeScreenUpdate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    notify_post((const char *)[@"com.apple.duetexpertd.widgetOnboardingUpdate" UTF8String]);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeAmbientUpdate:(id)a3 completionHandler:(id)a4
{
}

- (void)_writeUpdate:(id)a3 atPath:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke;
  v14[3] = &unk_1E5D099B8;
  id v16 = v9;
  id v17 = v10;
  id v15 = v8;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [(ATXDefaultHomeScreenItemManager *)self _readUpdateFromFileAtPath:v11 completionHandler:v14];
}

void __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_3();
    }
  }
  if ([v5 isEqual:a1[4]])
  {
    id v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[ATXDefaultHomeScreenItemManager _writeUpdate:atPath:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Defaults are the same as cached, not updating", buf, 0xCu);
    }

    id v9 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_19;
    block[3] = &unk_1E5D07A78;
    id v49 = a1[6];
    dispatch_async(v9, block);

    id v10 = v49;
  }
  else
  {
    id v10 = [a1[4] dictionaryRepresentation];
    id v11 = (void *)MEMORY[0x1AD0D3C30]();
    id v47 = 0;
    id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v47];
    id v13 = v47;
    if (v12)
    {
      int v14 = open((const char *)[a1[5] fileSystemRepresentation], 514, 384);
      if (v14 == -1)
      {
        v26 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_2();
        }

        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v62 = *MEMORY[0x1E4F28228];
        v63[0] = @"Unable to create file";
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
        v29 = [v27 errorWithDomain:@"ATXDefaultWidgetManager" code:0 userInfo:v28];

        v30 = dispatch_get_global_queue(25, 0);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_28;
        v41[3] = &unk_1E5D064C8;
        v23 = &v43;
        id v43 = a1[6];
        id v13 = v29;
        v42 = v13;
        dispatch_async(v30, v41);

        v22 = v42;
      }
      else
      {
        int v15 = v14;
        char v16 = ATXCacheFileWrite();
        if ((v15 & 0x80000000) == 0) {
          close(v15);
        }
        if (v16)
        {
          id v17 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [a1[4] stack];
            v18 = [a1[4] smallWidgets];
            v19 = [a1[4] mediumWidgets];
            uint64_t v20 = [a1[4] largeWidgets];
            *(_DWORD *)buf = 136316162;
            v51 = "-[ATXDefaultHomeScreenItemManager _writeUpdate:atPath:completionHandler:]_block_invoke_3";
            __int16 v52 = 2112;
            v53 = v35;
            __int16 v54 = 2112;
            v55 = v18;
            __int16 v56 = 2112;
            v57 = v19;
            __int16 v58 = 2112;
            uint64_t v59 = v20;
            v21 = (void *)v20;
            _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "%s: New add widget defaults sucessfully written to cache: default stack: %@, default widgets small: %@, default widgets medium: %@ default widgets large: %@", buf, 0x34u);
          }
          v22 = dispatch_get_global_queue(25, 0);
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_33;
          v36[3] = &unk_1E5D07A78;
          v23 = &v37;
          id v37 = a1[6];
          dispatch_async(v22, v36);
        }
        else
        {
          v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v60 = *MEMORY[0x1E4F28228];
          v61 = @"Unable to write data to file";
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          v33 = [v31 errorWithDomain:@"ATXDefaultWidgetManager" code:1 userInfo:v32];

          v34 = dispatch_get_global_queue(25, 0);
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_2;
          v38[3] = &unk_1E5D064C8;
          v23 = &v40;
          id v40 = a1[6];
          id v13 = v33;
          v39 = v13;
          dispatch_async(v34, v38);

          v22 = v39;
        }
      }
    }
    else
    {
      v24 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_1();
      }

      v25 = dispatch_get_global_queue(25, 0);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_22;
      v44[3] = &unk_1E5D064C8;
      v23 = &v46;
      id v46 = a1[6];
      id v13 = v13;
      v45 = v13;
      dispatch_async(v25, v44);

      v22 = v45;
    }
  }
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchGalleryItemsForVariant:(unint64_t)a3 gridSize:(unint64_t)a4 supportedFamilies:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  BOOL v11 = +[ATXDemoStackAndWidgetProvider isDemoModeEnabled];
  if (!v10 || !v11)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke;
    v21[3] = &unk_1E5D099E0;
    id v22 = v10;
    unint64_t v23 = a3;
    unint64_t v24 = a5;
    unint64_t v25 = a4;
    int v14 = (void *)MEMORY[0x1AD0D3E40](v21);
    int v15 = v14;
    if (a3)
    {
      if (a3 != 1)
      {
LABEL_11:

        id v12 = v22;
        goto LABEL_12;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_2;
      v19[3] = &unk_1E5D09A08;
      char v16 = &v20;
      id v20 = v14;
      [(ATXDefaultHomeScreenItemManager *)self _readAmbientUpdateFromFileWithCompletionHandler:v19];
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_3;
      v17[3] = &unk_1E5D09A08;
      char v16 = &v18;
      id v18 = v14;
      [(ATXDefaultHomeScreenItemManager *)self _readHomeScreenUpdateFromFileWithCompletionHandler:v17];
    }

    goto LABEL_11;
  }
  id v12 = +[ATXDemoStackAndWidgetProvider demoStackAndWidgets];
  id v13 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[ATXDefaultHomeScreenItemManager fetchGalleryItemsForVariant:gridSize:supportedFamilies:completionHandler:]";
    __int16 v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "%s: Returning DEMO widget defaults: %@", buf, 0x16u);
  }

  (*((void (**)(id, void *, void))v10 + 2))(v10, v12, 0);
LABEL_12:
}

void __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_cold_2();
    }

    id v9 = +[ATXWidgetDescriptorCache sharedInstance];
    id v51 = 0;
    id v10 = [v9 fetchHomeScreenWidgetDescriptorMetadataWithError:&v51];
    id v11 = v51;
    if (v11)
    {
      id v12 = v11;
      id v13 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_cold_1();
      }

      int v14 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_37;
      block[3] = &unk_1E5D064C8;
      id v15 = *(id *)(a1 + 32);
      id v49 = v12;
      id v50 = v15;
      id v16 = v12;
      dispatch_async(v14, block);

      id v17 = v50;
      goto LABEL_19;
    }
    id v18 = objc_opt_new();
    v19 = [v18 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

    id v20 = [ATXDefaultHomeScreenItemProducer alloc];
    v21 = [v9 homeScreenDescriptors];
    uint64_t v22 = [MEMORY[0x1E4F93B08] isiPad];
    unint64_t v23 = [(ATXDefaultHomeScreenItemProducer *)v20 initWithDescriptors:v21 descriptorInstallDates:v10 homeScreenConfig:MEMORY[0x1E4F1CBF0] isDayZeroExperience:1 isiPad:v22 spotlightAppLaunchHistogram:0 appLaunchCounts:v19];

    uint64_t v24 = [(ATXDefaultHomeScreenItemProducer *)v23 update];

    id v5 = (id)v24;
  }
  id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v26 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
  v27 = v26;
  if (v26) {
    id v28 = v26;
  }
  else {
    id v28 = (id)objc_opt_new();
  }
  v29 = v28;

  id v9 = (void *)[v25 initWithArray:v29];
  v44 = v7;
  if ([v5 shouldSuggestStackInGallery])
  {
    uint64_t v30 = [v5 stack];
  }
  else
  {
    uint64_t v30 = 0;
  }
  v31 = [v5 smallWidgets];
  id v16 = +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:v31 variant:*(void *)(a1 + 40) fromAppsDisabledOnHomeScreen:v9];

  v32 = [v5 mediumWidgets];
  id v17 = +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:v32 variant:*(void *)(a1 + 40) fromAppsDisabledOnHomeScreen:v9];

  v33 = [v5 largeWidgets];
  v34 = +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:v33 variant:*(void *)(a1 + 40) fromAppsDisabledOnHomeScreen:v9];

  v35 = [v5 extraLargeWidgets];
  v36 = +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:v35 variant:*(void *)(a1 + 40) fromAppsDisabledOnHomeScreen:v9];

  id v43 = (void *)v30;
  id v37 = [[ATXDefaultHomeScreenItemTilerWrapper alloc] initWithDefaultStack:v30 defaultWidgetsSmall:v16 defaultWidgetsMedium:v17 defaultWidgetsLarge:v34 defaultWidgetsExtraLarge:v36 widgetFamilyMask:*(void *)(a1 + 48) gridSize:*(void *)(a1 + 56)];
  v38 = [(ATXDefaultHomeScreenItemTilerWrapper *)v37 tiledHomeScreenItems];
  v39 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[ATXDefaultHomeScreenItemManager fetchGalleryItemsForVariant:gridSize:supportedFamilies:completionHandler:]_block_invoke_2";
    __int16 v54 = 2112;
    v55 = v38;
    _os_log_impl(&dword_1A790D000, v39, OS_LOG_TYPE_DEFAULT, "%s: Fetched add widget defaults: %@", buf, 0x16u);
  }

  id v40 = dispatch_get_global_queue(25, 0);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_44;
  v45[3] = &unk_1E5D064C8;
  id v41 = *(id *)(a1 + 32);
  id v46 = v38;
  id v47 = v41;
  id v42 = v38;
  dispatch_async(v40, v45);

  id v10 = v43;
  id v7 = v44;
LABEL_19:
}

uint64_t __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSuggestedGalleryItemsOfGridSize:(unint64_t)a3 widgetFamilyMask:(unint64_t)a4 withCompletionHandler:(id)a5
{
}

- (void)fetchSmartStackOfVariant:(unint64_t)a3 completionHandler:(id)a4
{
}

- (void)_fetchSmartStackOfVariant:(unint64_t)a3 localObserver:(int)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandler:]";
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "%s: fetching smart stack of variant %lu", buf, 0x16u);
  }

  if (a4) {
    notify_cancel(a4);
  }
  if (a3 == 3)
  {
    internalQueue = self->_internalQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5D08878;
    v16[4] = self;
    uint64_t v18 = 3;
    id v17 = v8;
    dispatch_async(internalQueue, v16);
    id v11 = v17;
  }
  else if (a3 == 2)
  {
    id v10 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke;
    block[3] = &unk_1E5D064C8;
    void block[4] = self;
    id v20 = v8;
    dispatch_async(v10, block);

    id v11 = v20;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47;
    v13[3] = &unk_1E5D09A58;
    unint64_t v15 = a3;
    v13[4] = self;
    id v14 = v8;
    [(ATXDefaultHomeScreenItemManager *)self _readHomeScreenUpdateFromFileWithCompletionHandler:v13];
    id v11 = v14;
  }
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) fetchWidgetDiscoverabilityStacks];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _generateOnboardingStacksForVariant:*(void *)(a1 + 48)];
  id v3 = __atxlog_handle_home_screen();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v2 stack1];
      id v6 = [v5 smallDefaultStack];
      uint64_t v7 = [v6 count];
      id v8 = [v2 stack2];
      id v9 = [v8 smallDefaultStack];
      *(_DWORD *)buf = 136315650;
      __int16 v23 = "-[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandler:]_block_invoke_2";
      __int16 v24 = 2048;
      uint64_t v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = [v9 count];
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: generated ambient onboarding stacks, stack 1: %tu widgets, stack 2: %tu widgets", buf, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [v2 stack1];
    id v12 = objc_msgSend(v2, "stack2", v11);
    v21[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v13, 0);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2_cold_1(v4, v14, v15, v16, v17, v18, v19, v20);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 code] == 2)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LODWORD(v76) = 0;
      id v8 = (const char *)[@"com.apple.duetexpertd.widgetOnboardingUpdate" UTF8String];
      id v9 = (int *)(*(void *)&buf[8] + 24);
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(NSObject **)(v10 + 8);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2_59;
      handler[3] = &unk_1E5D09A30;
      id v13 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      __int16 v54 = buf;
      uint64_t v55 = v12;
      handler[4] = v10;
      id v53 = v13;
      notify_register_dispatch(v8, v9, v11, handler);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      __int16 v24 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47_cold_4();
      }

      uint64_t v25 = dispatch_get_global_queue(25, 0);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_61;
      v49[3] = &unk_1E5D064C8;
      id v51 = *(id *)(a1 + 40);
      id v50 = v7;
      dispatch_async(v25, v49);
    }
  }
  else
  {
    uint64_t v15 = (uint64_t *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14 == 1)
    {
      __int16 v26 = [v5 todayStack];

      BOOL v27 = v26 == 0;
      uint64_t v28 = __atxlog_handle_home_screen();
      v29 = v28;
      if (v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
          __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47_cold_3(v29);
        }

        id v43 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v71 = *MEMORY[0x1E4F28228];
        v72 = @"Missing today stack";
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        v45 = [v43 errorWithDomain:@"ATXDefaultWidgetManager" code:0 userInfo:v44];

        id v46 = dispatch_get_global_queue(25, 0);
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_57;
        v59[3] = &unk_1E5D064C8;
        id v47 = *(id *)(a1 + 40);
        id v60 = v45;
        id v61 = v47;
        id v48 = v45;
        dispatch_async(v46, v59);
      }
      else
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = *v15;
          v31 = [v5 todayStack];
          v32 = [v31 compactDescription];
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandl"
                               "er:]_block_invoke_2";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2112;
          v76 = v32;
          _os_log_impl(&dword_1A790D000, v29, OS_LOG_TYPE_DEFAULT, "%s: fetched smart stack of variant %lu: %@", buf, 0x20u);
        }
        v33 = dispatch_get_global_queue(25, 0);
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_53;
        v62[3] = &unk_1E5D064C8;
        id v64 = *(id *)(a1 + 40);
        id v63 = v5;
        dispatch_async(v33, v62);
      }
    }
    else if (v14)
    {
      v34 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47_cold_1();
      }

      v35 = dispatch_get_global_queue(25, 0);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_58;
      v56[3] = &unk_1E5D064C8;
      id v36 = *(id *)(a1 + 40);
      id v57 = 0;
      id v58 = v36;
      dispatch_async(v35, v56);
    }
    else
    {
      uint64_t v16 = [v5 stack];

      BOOL v17 = v16 == 0;
      uint64_t v18 = __atxlog_handle_home_screen();
      uint64_t v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47_cold_2(v19);
        }

        id v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v73 = *MEMORY[0x1E4F28228];
        v74 = @"Missing stack";
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        v39 = [v37 errorWithDomain:@"ATXDefaultWidgetManager" code:0 userInfo:v38];

        id v40 = dispatch_get_global_queue(25, 0);
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_52;
        v65[3] = &unk_1E5D064C8;
        id v41 = *(id *)(a1 + 40);
        id v66 = v39;
        id v67 = v41;
        id v42 = v39;
        dispatch_async(v40, v65);
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *v15;
          v21 = [v5 stack];
          uint64_t v22 = [v21 compactDescription];
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[ATXDefaultHomeScreenItemManager _fetchSmartStackOfVariant:localObserver:completionHandl"
                               "er:]_block_invoke";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2112;
          v76 = v22;
          _os_log_impl(&dword_1A790D000, v19, OS_LOG_TYPE_DEFAULT, "%s: fetched smart stack of variant %lu: %@", buf, 0x20u);
        }
        __int16 v23 = dispatch_get_global_queue(25, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_48;
        block[3] = &unk_1E5D064C8;
        id v70 = *(id *)(a1 + 40);
        id v69 = v5;
        dispatch_async(v23, block);
      }
    }
  }
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_48(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) stack];
  v4[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v3, 0);
}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_53(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) todayStack];
  v4[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v3, 0);
}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSmartStackOfVariant:*(void *)(a1 + 56) localObserver:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) completionHandler:*(void *)(a1 + 40)];
}

uint64_t __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)fetchWidgetDiscoverabilityStacks
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    id v3 = [(ATXDefaultHomeScreenItemManager *)self _generateOnboardingStacksForVariant:2];
    v4 = v3;
    if (v3)
    {
      id v5 = [v3 stack1];
      v20[0] = v5;
      id v6 = [v4 stack2];
      v20[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      [(ATXDefaultHomeScreenItemManager *)self _logFetchedOnboardingStack:v7];

      id v8 = [v4 stack1];
      id v9 = [v4 stack2];
      v19[1] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    }
    else
    {
      id v8 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(ATXDefaultHomeScreenItemManager *)v8 fetchWidgetDiscoverabilityStacks];
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[ATXDefaultHomeScreenItemManager fetchWidgetDiscoverabilityStacks]";
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: returning nil for non-pad devices", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_logFetchedOnboardingStack:(id)a3
{
}

void __62__ATXDefaultHomeScreenItemManager__logFetchedOnboardingStack___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a3 + 1;
    uint64_t v7 = [v4 compactDescription];
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "_fetchSmartStackOfVariant: fetched onboarding smart stack %lu: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_generateOnboardingStacksForVariant:(unint64_t)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F5ACB8] log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v71 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
    __int16 v72 = 2050;
    unint64_t v73 = a3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %{public}lu", buf, 0x16u);
  }

  id v5 = objc_opt_new();
  uint64_t v6 = [v5 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

  if (a3 - 3 <= 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F5ACB8] log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v71 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: generating ambient onboarding stacks", buf, 0xCu);
    }

    if (+[ATXDayZeroDeterminer isDayZeroByFirstAppLaunchDateWithThresholdDateFromDaysAgo:20])
    {
      int v8 = [MEMORY[0x1E4F5ACB8] log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v71 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
        _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s: device is day zero, returning nil", buf, 0xCu);
      }
      id v9 = 0;
      goto LABEL_61;
    }
    int v8 = +[ATXWidgetDescriptorCache sharedInstance];
    uint64_t v25 = [v8 homeScreenDescriptors];
    __int16 v26 = objc_msgSend(v25, "_pas_filteredSetWithTest:", &__block_literal_global_69);

    id v69 = 0;
    BOOL v27 = [v8 fetchHomeScreenWidgetDescriptorMetadataWithError:&v69];
    id v28 = v69;
    if (v28 || ![v27 count] || !objc_msgSend(v26, "count"))
    {
      v29 = [MEMORY[0x1E4F5ACB8] log];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]();
      }
      id v9 = 0;
      goto LABEL_29;
    }
    id v37 = [ATXDefaultHomeScreenItemProducer alloc];
    uint64_t v38 = [MEMORY[0x1E4F93B08] isiPad];
    v29 = [(ATXDefaultHomeScreenItemProducer *)v37 initWithDescriptors:v26 descriptorInstallDates:v27 homeScreenConfig:MEMORY[0x1E4F1CBF0] isDayZeroExperience:0 isiPad:v38 spotlightAppLaunchHistogram:0 adblDrainClassification:1 appLaunchCounts:v6];
    id v66 = [v29 ambientOnboardingStacks];
    v39 = [v66 stack1];
    id v40 = [v39 smallDefaultStack];
    unint64_t v41 = [v40 count];

    if (v41 > 3)
    {
      id v51 = [v66 stack2];
      __int16 v52 = [v51 smallDefaultStack];
      unint64_t v53 = [v52 count];

      if (v53 > 3)
      {
        id v43 = v66;
        id v9 = v66;
        goto LABEL_66;
      }
      id v42 = [MEMORY[0x1E4F5ACB8] log];
      id v43 = v66;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:](v66);
      }
    }
    else
    {
      id v42 = [MEMORY[0x1E4F5ACB8] log];
      id v43 = v66;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:](v66);
      }
    }

    id v9 = 0;
LABEL_66:

LABEL_29:
    goto LABEL_61;
  }
  if (a3 != 2)
  {
    id v9 = 0;
    goto LABEL_62;
  }
  __int16 v10 = +[ATXBatteryDrainBehavior sharedInstance];
  uint64_t v11 = [v10 fetchADBLDrainClassification];

  int v8 = objc_opt_new();
  id v68 = 0;
  uint64_t v12 = [v8 fetchOnboardingStackWidgetCacheWithError:&v68];
  id v13 = v68;
  if (v13)
  {
    uint64_t v14 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:].cold.5();
    }
  }
  if (v12)
  {
    uint64_t v15 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v71 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
      _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "%s: fetching onboarding stacks with cached widget data", buf, 0xCu);
    }

    uint64_t v16 = __atxlog_handle_home_screen();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    uint64_t v18 = __atxlog_handle_home_screen();
    uint64_t v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A790D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "widgetDiscoverabilityUsingCachedData", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v20 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
    v21 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:](v20, "initWithOnboardingStackWidgetCache:adblDrainClassification:isiPad:shouldIncludeContactsWidget:appLaunchCounts:", v12, v11, [MEMORY[0x1E4F93B08] isiPad], 1, v6);
    uint64_t v22 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v21 onboardingStacks];
    uint64_t v23 = __atxlog_handle_home_screen();
    __int16 v24 = v23;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A790D000, v24, OS_SIGNPOST_INTERVAL_END, v17, "widgetDiscoverabilityUsingCachedData", "", buf, 2u);
    }

    id v9 = +[ATXDefaultHomeScreenItemManager _onboardingStacksByFilteringDescriptorsInOnboardingStacks:v22 variant:0];
  }
  else
  {
    v21 = (ATXDefaultHomeScreenItemOnboardingStacksProducer *)objc_opt_new();
    uint64_t v22 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v21 fetchOnboardingStackResultCache];
    uint64_t v30 = __atxlog_handle_home_screen();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    id v65 = v13;
    if (v22)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v71 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
        _os_log_impl(&dword_1A790D000, v30, OS_LOG_TYPE_DEFAULT, "%s: using result cache", buf, 0xCu);
      }

      v32 = [v22 resultForClassification:v11];
      v33 = [ATXDefaultHomeScreenItemOnboardingStacks alloc];
      v34 = [v32 stack1];
      v35 = [v32 stack2];
      id v36 = [(ATXDefaultHomeScreenItemOnboardingStacks *)v33 initWithOnboardingStack1:v34 stack2:v35 sortedThirdPartyWidgets:MEMORY[0x1E4F1CBF0]];

      id v9 = +[ATXDefaultHomeScreenItemManager _onboardingStacksByFilteringDescriptorsInOnboardingStacks:v36 variant:0];
    }
    else
    {
      if (v31)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v71 = "-[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]";
        _os_log_impl(&dword_1A790D000, v30, OS_LOG_TYPE_DEFAULT, "%s: no cached widget data, fetching onboarding stacks with descriptors and reading through biome stream", buf, 0xCu);
      }

      v44 = __atxlog_handle_home_screen();
      os_signpost_id_t v45 = os_signpost_id_generate(v44);

      id v46 = __atxlog_handle_home_screen();
      id v47 = v46;
      unint64_t v63 = v45 - 1;
      if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A790D000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "widgetDiscoverabilityWithoutCachedData", " enableTelemetry=YES ", buf, 2u);
      }

      v32 = +[ATXWidgetDescriptorCache sharedInstance];
      id v67 = 0;
      id v64 = [v32 fetchHomeScreenWidgetDescriptorMetadataWithError:&v67];
      id v36 = (ATXDefaultHomeScreenItemOnboardingStacks *)v67;
      id v48 = [v32 homeScreenDescriptors];
      id v49 = v48;
      if (v36 || ![v48 count])
      {
        id v50 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[ATXDefaultHomeScreenItemManager _generateOnboardingStacksForVariant:]();
        }
        id v9 = 0;
      }
      else
      {
        os_signpost_id_t spid = v45;
        BOOL v61 = +[ATXDayZeroDeterminer isDayZeroByFirstAppLaunchDateWithThresholdDateFromDaysAgo:20];
        __int16 v54 = [ATXDefaultHomeScreenItemProducer alloc];
        uint64_t v55 = [MEMORY[0x1E4F93B08] isiPad];
        uint64_t v62 = v49;
        id v50 = [(ATXDefaultHomeScreenItemProducer *)v54 initWithDescriptors:v49 descriptorInstallDates:v64 homeScreenConfig:MEMORY[0x1E4F1CBF0] isDayZeroExperience:v61 isiPad:v55 spotlightAppLaunchHistogram:0 adblDrainClassification:v11 appLaunchCounts:v6];
        uint64_t v56 = [v50 onboardingStacks];
        id v57 = __atxlog_handle_home_screen();
        id v58 = v57;
        if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A790D000, v58, OS_SIGNPOST_INTERVAL_END, spid, "widgetDiscoverabilityWithoutCachedData", "", buf, 2u);
        }

        id v9 = +[ATXDefaultHomeScreenItemManager _onboardingStacksByFilteringDescriptorsInOnboardingStacks:v56 variant:0];

        id v49 = v62;
      }
    }
    id v13 = v65;
  }

LABEL_61:
LABEL_62:

  return v9;
}

BOOL __71__ATXDefaultHomeScreenItemManager__generateOnboardingStacksForVariant___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXDefaultHomeScreenItemManager isCHSWidgetDescriptorAllowedForAmbientOnboardingStacks:a2];
}

- (id)_JSONCompatible:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)fetchDefaultStacksJSONWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__ATXDefaultHomeScreenItemManager_fetchDefaultStacksJSONWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5D09AC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ATXDefaultHomeScreenItemManager *)self _readHomeScreenUpdateFromFileWithCompletionHandler:v6];
}

void __79__ATXDefaultHomeScreenItemManager_fetchDefaultStacksJSONWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = objc_opt_new();
    id v7 = [v30 stack];
    uint64_t v8 = [v7 dictionaryRepresentation];
    [v6 setObject:v8 forKeyedSubscript:@"smartStack"];

    id v9 = [v30 todayStack];
    __int16 v10 = [v9 dictionaryRepresentation];
    [v6 setObject:v10 forKeyedSubscript:@"todayPageSmartStack"];

    if ([v30 shouldSuggestStackInGallery])
    {
      v29 = [v30 stack];
    }
    else
    {
      v29 = 0;
    }
    uint64_t v11 = 0;
    unint64_t v12 = 0x1E4F29000uLL;
    do
    {
      long long v13 = (void *)MEMORY[0x1AD0D3C30]();
      long long v14 = [ATXDefaultHomeScreenItemTilerWrapper alloc];
      long long v15 = [v30 smallWidgets];
      uint64_t v16 = [v30 mediumWidgets];
      [v30 largeWidgets];
      uint64_t v17 = a1;
      uint64_t v18 = v6;
      uint64_t v20 = v19 = v12;
      v21 = [v30 extraLargeWidgets];
      uint64_t v22 = [(ATXDefaultHomeScreenItemTilerWrapper *)v14 initWithDefaultStack:v29 defaultWidgetsSmall:v15 defaultWidgetsMedium:v16 defaultWidgetsLarge:v20 defaultWidgetsExtraLarge:v21 widgetFamilyMask:7294 gridSize:v11];

      unint64_t v12 = v19;
      uint64_t v6 = v18;
      a1 = v17;

      uint64_t v23 = *(void **)(v17 + 32);
      __int16 v24 = [(ATXDefaultHomeScreenItemTilerWrapper *)v22 tiledHomeScreenItems];
      uint64_t v25 = [v23 _JSONCompatible:v24];
      __int16 v26 = objc_msgSend(objc_alloc(*(Class *)(v12 + 24)), "initWithFormat:", @"AddSheetGridSizeEnum_%lu", v11);
      [v6 setObject:v25 forKeyedSubscript:v26];

      ++v11;
    }
    while (v11 != 4);
    BOOL v27 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:1 error:0];
    if (v27) {
      id v28 = (__CFString *)[objc_alloc(*(Class *)(v12 + 24)) initWithData:v27 encoding:4];
    }
    else {
      id v28 = @"{ \"error\": \"Error formatting json\" }";
    }
    id v5 = 0;
    (*(void (**)(void))(*(void *)(v17 + 40) + 16))();
  }
}

- (void)_readHomeScreenUpdateFromFileWithCompletionHandler:(id)a3
{
}

- (void)_readAmbientUpdateFromFileWithCompletionHandler:(id)a3
{
}

- (void)_readUpdateFromFileAtPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke;
  v11[3] = &unk_1E5D053E8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, v11);
}

void __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  int v2 = open((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], 0);
  if (v2 == -1)
  {
    int v4 = *__error();
    id v5 = __atxlog_handle_home_screen();
    id v6 = v5;
    if (v4 == 2)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 136315138;
        *(id *)((char *)buf + 4) = "-[ATXDefaultHomeScreenItemManager _readUpdateFromFileAtPath:completionHandler:]_block_invoke";
        _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "%s: No suggestions file found.", (uint8_t *)buf, 0xCu);
      }

      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28228];
      BOOL v27 = @"No suggestions file found";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v9 = v7;
      uint64_t v10 = 2;
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_1();
      }

      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28228];
      v30[0] = @"Unable to open file";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      id v9 = v22;
      uint64_t v10 = 0;
    }
    uint64_t v23 = [v9 errorWithDomain:@"ATXDefaultWidgetManager" code:v10 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int v3 = v2;
    buf[0] = 0;
    ATXCacheFileRead();
    if ((v3 & 0x80000000) == 0) {
      close(v3);
    }
    uint64_t v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    unint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    uint64_t v25 = @"No data in file";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v21 = [v19 errorWithDomain:@"ATXDefaultWidgetManager" code:1 userInfo:v20];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)_onboardingStacksByFilteringDescriptorsInOnboardingStacks:(id)a3 variant:(unint64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  uint64_t v12 = v11;

  uint64_t v13 = (void *)[v8 initWithArray:v12];
  uint64_t v14 = [v7 stack1];
  uint64_t v15 = [a1 _widgetStackByFilteringDescriptorsInWidgetStack:v14 variant:a4];

  uint64_t v16 = [v7 stack2];
  uint64_t v17 = [a1 _widgetStackByFilteringDescriptorsInWidgetStack:v16 variant:a4];

  uint64_t v18 = [v7 sortedThirdPartyWidgets];

  unint64_t v19 = [a1 _descriptorsByFilteringDescriptors:v18 variant:a4 fromAppsDisabledOnHomeScreen:v13];

  uint64_t v20 = [[ATXDefaultHomeScreenItemOnboardingStacks alloc] initWithOnboardingStack1:v15 stack2:v17 sortedThirdPartyWidgets:v19];

  return v20;
}

+ (id)_widgetStackByFilteringDescriptorsInWidgetStack:(id)a3 variant:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v8 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  id v11 = v10;

  uint64_t v12 = (void *)[v7 initWithArray:v11];
  uint64_t v13 = [v5 smallDefaultStack];
  uint64_t v14 = +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:v13 variant:a4 fromAppsDisabledOnHomeScreen:v12];
  [v6 setSmallDefaultStack:v14];

  uint64_t v15 = [v5 mediumDefaultStack];
  uint64_t v16 = +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:v15 variant:a4 fromAppsDisabledOnHomeScreen:v12];
  [v6 setMediumDefaultStack:v16];

  uint64_t v17 = [v5 largeDefaultStack];
  uint64_t v18 = +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:v17 variant:a4 fromAppsDisabledOnHomeScreen:v12];
  [v6 setLargeDefaultStack:v18];

  unint64_t v19 = [v5 extraLargeDefaultStack];
  uint64_t v20 = +[ATXDefaultHomeScreenItemManager _descriptorsByFilteringDescriptors:v19 variant:a4 fromAppsDisabledOnHomeScreen:v12];
  [v6 setExtraLargeDefaultStack:v20];

  uint64_t v21 = [v5 suggestedSize];
  [v6 setSuggestedSize:v21];

  return v6;
}

+ (id)_descriptorsByFilteringDescriptors:(id)a3 variant:(unint64_t)a4 fromAppsDisabledOnHomeScreen:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__ATXDefaultHomeScreenItemManager__descriptorsByFilteringDescriptors_variant_fromAppsDisabledOnHomeScreen___block_invoke;
  v12[3] = &unk_1E5D09AE8;
  unint64_t v14 = a4;
  id v15 = a1;
  id v13 = v8;
  id v9 = v8;
  id v10 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v12);

  return v10;
}

uint64_t __107__ATXDefaultHomeScreenItemManager__descriptorsByFilteringDescriptors_variant_fromAppsDisabledOnHomeScreen___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5 == 1)
  {
    if (([*(id *)(a1 + 48) shouldFilterOutWidgetDescriptorDueToAppProtection:v4 fromDisabledApps:*(void *)(a1 + 32)] & 1) == 0&& (objc_msgSend(*(id *)(a1 + 48), "isDescriptorSpecial:", v4) & 1) == 0)
    {
      id v8 = [v4 avocadoDescriptor];
      [v8 disfavoredFamiliesForLocation:2];
      CHSWidgetFamilyFromATXStackLayoutSize([v4 suggestedSize]);
      char v9 = CHSWidgetFamilyMaskContainsFamily();

      if ((v9 & 1) == 0)
      {
        id v11 = [v4 avocadoDescriptor];
        char v2 = [v11 isLinkedOnOrAfter:0];

        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  if (!v5)
  {
    if (([*(id *)(a1 + 48) shouldFilterOutWidgetDescriptorDueToAppProtection:v4 fromDisabledApps:*(void *)(a1 + 32)] & 1) == 0)
    {
      id v6 = [v4 avocadoDescriptor];
      [v6 disfavoredFamiliesForLocation:0];
      CHSWidgetFamilyFromATXStackLayoutSize([v4 suggestedSize]);
      char v7 = CHSWidgetFamilyMaskContainsFamily();

      char v2 = v7 ^ 1;
      goto LABEL_9;
    }
LABEL_8:
    char v2 = 0;
  }
LABEL_9:

  return v2 & 1;
}

+ (BOOL)isCHSWidgetDescriptorAllowedForAmbientOnboardingStacks:(id)a3
{
  id v3 = a3;
  [v3 disfavoredFamiliesForLocation:2];
  if (CHSWidgetFamilyMaskContainsFamily()) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 isLinkedOnOrAfter:0];
  }

  return v4;
}

+ (BOOL)isDescriptorSpecial:(id)a3
{
  id v3 = a3;
  char v4 = [v3 widgetKind];
  uint64_t v5 = ATXSpecialWidgetKindFiles();
  char v6 = [v4 isEqualToString:v5];

  if (v6) {
    goto LABEL_5;
  }
  char v7 = [v3 widgetKind];
  id v8 = ATXSpecialWidgetKindShortcutsSingle();
  char v9 = [v7 isEqualToString:v8];

  if (v9) {
    goto LABEL_5;
  }
  id v10 = [v3 widgetKind];
  id v11 = ATXSpecialWidgetKindShortcutsFolder();
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) != 0
    || ([v3 widgetKind],
        id v13 = objc_claimAutoreleasedReturnValue(),
        ATXSpecialWidgetKindAppPredictions(),
        unint64_t v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v13 isEqualToString:v14],
        v14,
        v13,
        (v15 & 1) != 0))
  {
LABEL_5:
    char v16 = 1;
  }
  else
  {
    uint64_t v18 = [v3 widgetKind];
    unint64_t v19 = ATXSpecialWidgetKindSiriSuggestions();
    char v16 = [v18 isEqualToString:v19];
  }
  return v16;
}

+ (BOOL)shouldFilterOutWidgetDescriptorDueToAppProtection:(id)a3 fromDisabledApps:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 appBundleId];
  BOOL v8 = v7 != 0;

  if (!v7)
  {
    id v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      unint64_t v19 = "+[ATXDefaultHomeScreenItemManager shouldFilterOutWidgetDescriptorDueToAppProtection:fromDisabledApps:]";
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "%s: No parent bundleId for Widget descriptor: %@", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_11;
  }
  char v9 = [v5 appBundleId];
  int v10 = [v6 containsObject:v9];

  if (v10)
  {
    id v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = [v5 appBundleId];
      int v18 = 136315650;
      unint64_t v19 = "+[ATXDefaultHomeScreenItemManager shouldFilterOutWidgetDescriptorDueToAppProtection:fromDisabledApps:]";
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      id v13 = "%s: filtering out widget descriptor: %@. Reason: Show on Homescreen is disabled for parent bundleId %@";
LABEL_10:
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    unint64_t v14 = objc_opt_new();
    char v15 = [v5 appBundleId];
    int v16 = [v14 bundleIdIsLockedOrHiddenByUserPreference:v15];

    if (!v16)
    {
      BOOL v8 = 0;
      goto LABEL_12;
    }
    id v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = [v5 appBundleId];
      int v18 = 136315650;
      unint64_t v19 = "+[ATXDefaultHomeScreenItemManager shouldFilterOutWidgetDescriptorDueToAppProtection:fromDisabledApps:]";
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      id v13 = "%s: filtering out widget descriptor: %@. Reason: the parent bundleId %@ is locked or hidden by user preference";
      goto LABEL_10;
    }
  }
LABEL_11:

LABEL_12:
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientPath, 0);
  objc_storeStrong((id *)&self->_homeScreenPath, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: Error archiving default widget stacks: %@", v2, v3, v4, v5, 2u);
}

void __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_2()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_34(&dword_1A790D000, v1, v2, "%s: Couldn't create file: [%i] %s", v3, v4, v5, v6, 2u);
}

void __73__ATXDefaultHomeScreenItemManager__writeUpdate_atPath_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: Error reading from cache: %@", v2, v3, v4, v5, 2u);
}

void __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: Error when attempting to fetch widget descriptors with additional data - %{public}@", v2, v3, v4, v5, 2u);
}

void __108__ATXDefaultHomeScreenItemManager_fetchGalleryItemsForVariant_gridSize_supportedFamilies_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: Error fetching add widget defaults: %@, fetching results on the fly", v2, v3, v4, v5, 2u);
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: Error fetching smart stack due to unknown variant: %lu", v2, v3, v4, v5, 2u);
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Nullability violation: handled the variant ATXSmartStackVariantAppList but there was no stack", v1, 2u);
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Nullability violation: handled the variant ATXSmartStackVariantTodayPage but there was no today stack", v1, 2u);
}

void __93__ATXDefaultHomeScreenItemManager__fetchSmartStackOfVariant_localObserver_completionHandler___block_invoke_47_cold_4()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_7_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A790D000, v1, OS_LOG_TYPE_ERROR, "%s: Error fetching smart stack of variant %lu: %@", (uint8_t *)v2, 0x20u);
}

- (void)fetchWidgetDiscoverabilityStacks
{
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, a1, a3, "%s: _generateOnboardingStacks returned nil onboarding stacks", a5, a6, a7, a8, 2u);
}

- (void)_generateOnboardingStacksForVariant:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: Error when attempting to fetch widget descriptors with additional data, or list of descriptors were empty - %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_generateOnboardingStacksForVariant:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 stack1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "%s: stack 1 contains less than 4 widgets, returning nil. stack 1: %@", v4, v5, v6, v7, 2u);
}

- (void)_generateOnboardingStacksForVariant:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 stack2];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "%s: stack 2 contains less than 4 widgets, returning nil. stack 2: %@", v4, v5, v6, v7, 2u);
}

- (void)_generateOnboardingStacksForVariant:.cold.5()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: Error when attempting to fetch onboarding stack cached data - %{public}@", v2, v3, v4, v5, 2u);
}

void __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_1()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_34(&dword_1A790D000, v1, v2, "%s: Couldn't open file: [%i] %s", v3, v4, v5, v6, 2u);
}

void __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__ATXDefaultHomeScreenItemManager__readUpdateFromFileAtPath_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: Error unarchiving object: %@", v2, v3, v4, v5, 2u);
}

@end
@interface ATXFaceSuggestionGenerator
- (ATXFaceGalleryConfiguration)faceGalleryConfiguration;
- (ATXFaceSuggestionGenerator)initWithDescriptorCache:(id)a3 configurationCache:(id)a4 complicationProvider:(id)a5 complicationDescriptorProvider:(id)a6 parameters:(id)a7;
- (ATXFaceSuggestionGeneratorDelegate)delegate;
- (BOOL)shouldUseDayZeroCuration;
- (id)_createLayoutGeneratorWithDayZero:(BOOL)a3 locale:(id)a4;
- (void)_generateFaceGalleryConfigurationNotifyingWithGuardedData:(id)a3;
- (void)configurationCacheDidUpdateWithNewConfigurations:(id)a3 oldConfigurations:(id)a4;
- (void)descriptorCacheDidUpdateWithDescriptors:(id)a3;
- (void)regenerateFaceGalleryConfigurationCoalescedWithReason:(id)a3;
- (void)regenerateFaceGalleryConfigurationImmediatelyWithReason:(id)a3;
- (void)regenerateFaceSuggestionsForFocusModesWithReason:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATXFaceSuggestionGenerator

- (ATXFaceSuggestionGenerator)initWithDescriptorCache:(id)a3 configurationCache:(id)a4 complicationProvider:(id)a5 complicationDescriptorProvider:(id)a6 parameters:(id)a7
{
  id v32 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v36.receiver = self;
  v36.super_class = (Class)ATXFaceSuggestionGenerator;
  v17 = [(ATXFaceSuggestionGenerator *)&v36 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_descriptorCache, a3);
    [(ATXPosterDescriptorCache *)v18->_descriptorCache registerObserver:v18];
    objc_storeStrong((id *)&v18->_configurationCache, a4);
    [(ATXPosterConfigurationCache *)v18->_configurationCache registerObserver:v18];
    objc_storeStrong((id *)&v18->_complicationProvider, a5);
    objc_storeStrong((id *)&v18->_complicationDescriptorProvider, a6);
    objc_storeStrong((id *)&v18->_parameters, a7);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.proactive.ATXFaceSuggestionGenerator", v19);

    id v21 = objc_alloc(MEMORY[0x1E4F93B80]);
    v22 = objc_opt_new();
    uint64_t v23 = [v21 initWithGuardedData:v22 serialQueue:v20];
    lock = v18->_lock;
    v18->_lock = (_PASQueueLock *)v23;

    objc_initWeak(&location, v18);
    id v25 = objc_alloc(MEMORY[0x1E4F93B98]);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __136__ATXFaceSuggestionGenerator_initWithDescriptorCache_configurationCache_complicationProvider_complicationDescriptorProvider_parameters___block_invoke;
    v33[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v34, &location);
    uint64_t v26 = [v25 initWithQueue:v20 operation:v33];
    regenerationCoalescingTimer = v18->_regenerationCoalescingTimer;
    v18->_regenerationCoalescingTimer = (_PASSimpleCoalescingTimer *)v26;

    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.proactive.ATXFaceSuggestionGenerator.Output", v28);
    outputQueue = v18->_outputQueue;
    v18->_outputQueue = (OS_dispatch_queue *)v29;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v18;
}

void __136__ATXFaceSuggestionGenerator_initWithDescriptorCache_configurationCache_complicationProvider_complicationDescriptorProvider_parameters___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "running coalesced regeneration operation", v4, 2u);
    }

    v3 = [WeakRetained[6] guardedDataAssertingLockContext];
    [WeakRetained _generateFaceGalleryConfigurationNotifyingWithGuardedData:v3];
  }
}

- (ATXFaceGalleryConfiguration)faceGalleryConfiguration
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__54;
  v10 = __Block_byref_object_dispose__54;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXFaceSuggestionGenerator_faceGalleryConfiguration__block_invoke;
  v5[3] = &unk_1E68B1CB8;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ATXFaceGalleryConfiguration *)v3;
}

void __54__ATXFaceSuggestionGenerator_faceGalleryConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[1];
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    v5 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v12 = 136315394;
      id v13 = "-[ATXFaceSuggestionGenerator faceGalleryConfiguration]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: returning in-memory configuration: %@", (uint8_t *)&v12, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  v7 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[ATXFaceSuggestionGenerator faceGalleryConfiguration]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: no in-memory configuration, generating new configuration", (uint8_t *)&v12, 0xCu);
  }

  [*(id *)(a1 + 32) _generateFaceGalleryConfigurationNotifyingWithGuardedData:v3];
  if (v3[1])
  {
    uint64_t v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v3[1];
      int v12 = 136315394;
      id v13 = "-[ATXFaceSuggestionGenerator faceGalleryConfiguration]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: generated new configuration: %@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = v3[1];
    v5 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)regenerateFaceGalleryConfigurationCoalescedWithReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[ATXFaceSuggestionGenerator regenerateFaceGalleryConfigurationCoalescedWithReason:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: requesting coalesced face gallery regeneration for reason: %@", (uint8_t *)&v6, 0x16u);
  }

  [(_PASSimpleCoalescingTimer *)self->_regenerationCoalescingTimer runAfterDelaySeconds:0 coalescingBehavior:2.0];
}

- (void)regenerateFaceGalleryConfigurationImmediatelyWithReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[ATXFaceSuggestionGenerator regenerateFaceGalleryConfigurationImmediatelyWithReason:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: requesting immediate face gallery regeneration for reason: %@", buf, 0x16u);
  }

  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__ATXFaceSuggestionGenerator_regenerateFaceGalleryConfigurationImmediatelyWithReason___block_invoke;
  v7[3] = &unk_1E68B1CE0;
  v7[4] = self;
  [(_PASQueueLock *)lock runWithLockAcquired:v7];
}

uint64_t __86__ATXFaceSuggestionGenerator_regenerateFaceGalleryConfigurationImmediatelyWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _generateFaceGalleryConfigurationNotifyingWithGuardedData:a2];
}

- (void)regenerateFaceSuggestionsForFocusModesWithReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[ATXFaceSuggestionGenerator regenerateFaceSuggestionsForFocusModesWithReason:]";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: requesting immediate face suggestions regeneration for Focus Modes with reason: %@", (uint8_t *)&v8, 0x16u);
  }

  v5 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
  int v6 = +[ATXPosterDescriptorCache sharedInstance];
  v7 = [v6 allDescriptors];
  [(ATXModeFaceSuggestionGenerator *)v5 generateAndCacheFacesFromDescriptors:v7];
}

- (void)_generateFaceGalleryConfigurationNotifyingWithGuardedData:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v5 = (id *)a3;
  sel_getName(a2);
  v44 = (void *)os_transaction_create();
  int v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: using locale: %@", buf, 0x16u);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v43 = (void *)[v8 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v9 = [v43 integerForKey:*MEMORY[0x1E4F4B748]];
  __int16 v10 = [MEMORY[0x1E4F4B430] sharedInstance];
  id v48 = 0;
  id v11 = [v10 fetchAccessoryWidgetDescriptorMetadataWithError:&v48];
  id v12 = v48;

  if (!v11)
  {
    id v13 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]((uint64_t)v12, v13);
    }

    id v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  v42 = v12;
  id v14 = objc_alloc_init(MEMORY[0x1E4F4AED0]);
  id v15 = [v14 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

  uint64_t v16 = [v15 allKeys];
  v17 = +[ATXCompanionBundleIdMapper generateMappingForAppBundleIds:v16];

  if (!v9)
  {
    BOOL v23 = [(ATXFaceSuggestionGenerator *)self shouldUseDayZeroCuration];
    v24 = __atxlog_handle_lock_screen();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
        uint64_t v26 = "%s: day zero criteria met, using day zero curation";
LABEL_21:
        _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
      }
    }
    else if (v25)
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
      uint64_t v26 = "%s: day zero criteria not met, generating personalized layout";
      goto LABEL_21;
    }

    v27 = self;
    uint64_t v28 = v23;
    goto LABEL_25;
  }
  v18 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
    __int16 v51 = 2048;
    uint64_t v52 = v9;
    _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "%s: using face gallery source override: %zd", buf, 0x16u);
  }

  switch(v9)
  {
    case 1:
      v27 = self;
      uint64_t v28 = 0;
      break;
    case 2:
      v27 = self;
      uint64_t v28 = 1;
      break;
    case 3:
      BOOL v19 = [(ATXFaceSuggestionGenerator *)self shouldUseDayZeroCuration];
      dispatch_queue_t v20 = __atxlog_handle_lock_screen();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
          v22 = "%s: day zero criteria met, using day zero curation for demo mode";
LABEL_34:
          _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
        }
      }
      else if (v21)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
        v22 = "%s: day zero criteria not met, generating personalized layout for demo mode";
        goto LABEL_34;
      }

      dispatch_queue_t v29 = [(ATXFaceSuggestionGenerator *)self _createLayoutGeneratorWithDayZero:v19 locale:v6];
      v31 = [[ATXFaceGalleryFileReader alloc] initWithSource:0];
      v38 = [v29 generatedConfigurationWithWidgetDescriptorsAdditionalData:v11 aggregatedAppLaunchData:v15 bundleIdToCompanionBundleId:v17];
      v39 = [(ATXFaceGalleryFileReader *)v31 configuration];
      uint64_t v40 = [v38 configurationByApplyingConfiguration:v39];
      id v41 = v5[1];
      v5[1] = (id)v40;

      goto LABEL_26;
    default:
      goto LABEL_27;
  }
LABEL_25:
  dispatch_queue_t v29 = [(ATXFaceSuggestionGenerator *)v27 _createLayoutGeneratorWithDayZero:v28 locale:v6];
  uint64_t v30 = [v29 generatedConfigurationWithWidgetDescriptorsAdditionalData:v11 aggregatedAppLaunchData:v15 bundleIdToCompanionBundleId:v17];
  v31 = (ATXFaceGalleryFileReader *)v5[1];
  v5[1] = (id)v30;
LABEL_26:

LABEL_27:
  id v32 = (void *)[v5[1] copy];
  if (!v32)
  {
    v33 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
      _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, "%s: no configuration generated, creating blank configuration", buf, 0xCu);
    }

    id v34 = objc_alloc(MEMORY[0x1E4F4B028]);
    id v32 = (void *)[v34 initWithSections:MEMORY[0x1E4F1CBF0] source:1 locale:v6 dayZero:0];
  }
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ATXFaceSuggestionGenerator__generateFaceGalleryConfigurationNotifyingWithGuardedData___block_invoke;
  block[3] = &unk_1E68AC320;
  block[4] = self;
  id v46 = v32;
  id v47 = v44;
  id v36 = v44;
  id v37 = v32;
  dispatch_async(outputQueue, block);
}

id __88__ATXFaceSuggestionGenerator__generateFaceGalleryConfigurationNotifyingWithGuardedData___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 generatorDidUpdateFaceGalleryConfiguration:*(void *)(a1 + 40)];

  return self;
}

- (BOOL)shouldUseDayZeroCuration
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(ATXPosterConfigurationCache *)self->_configurationCache configurations];
  if ([v2 count] == 1)
  {
    char v3 = [MEMORY[0x1E4F4AF80] isDayZeroByFirstAppLaunchDateWithThresholdDateFromDaysAgo:7];
  }
  else
  {
    id v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[ATXFaceSuggestionGenerator shouldUseDayZeroCuration]";
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: day zero criteria not met- multiple poster configurations exist", (uint8_t *)&v6, 0xCu);
    }

    char v3 = 0;
  }

  return v3;
}

- (id)_createLayoutGeneratorWithDayZero:(BOOL)a3 locale:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [ATXFaceGalleryLayoutGenerator alloc];
  uint64_t v8 = [(ATXPosterDescriptorCache *)self->_descriptorCache descriptors];
  uint64_t v9 = [(ATXFaceGalleryLayoutGenerator *)v7 initWithDescriptors:v8 complicationProvider:self->_complicationProvider complicationDescriptorProvider:self->_complicationDescriptorProvider parameters:self->_parameters dayZero:v4 locale:v6];

  return v9;
}

- (void)descriptorCacheDidUpdateWithDescriptors:(id)a3
{
}

- (void)configurationCacheDidUpdateWithNewConfigurations:(id)a3 oldConfigurations:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_25;
  }
  id v37 = self;
  v39 = v6;
  uint64_t v8 = objc_opt_new();
  id v41 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  uint64_t v40 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v38 = v7;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v16 = [v15 extensionBundleIdentifier];
        [v41 addObject:v16];

        v17 = [v15 complications];
        v18 = objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_114);
        [v8 addObjectsFromArray:v18];

        BOOL v19 = [v15 inlineComplication];

        if (v19)
        {
          dispatch_queue_t v20 = [v15 inlineComplication];
          BOOL v21 = personalityStringFromComplication(v20);
          [v8 addObject:v21];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v12);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v39;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        uint64_t v28 = [v27 extensionBundleIdentifier];
        [v40 addObject:v28];

        dispatch_queue_t v29 = [v27 complications];
        uint64_t v30 = objc_msgSend(v29, "_pas_mappedArrayWithTransform:", &__block_literal_global_41_0);
        [v9 addObjectsFromArray:v30];

        v31 = [v27 inlineComplication];

        if (v31)
        {
          id v32 = [v27 inlineComplication];
          v33 = personalityStringFromComplication(v32);
          [v9 addObject:v33];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v24);
  }

  char v34 = [v8 isEqualToSet:v9];
  int v35 = [v41 isEqualToSet:v40];

  id v7 = v38;
  id v6 = v39;
  self = v37;
  if (!v35) {
    goto LABEL_25;
  }
  if (v34)
  {
    id v36 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v51 = "-[ATXFaceSuggestionGenerator configurationCacheDidUpdateWithNewConfigurations:oldConfigurations:]";
      _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "%s: not regenerating, no significant changes to poster configurations", buf, 0xCu);
    }
  }
  else
  {
LABEL_25:
    [(ATXFaceSuggestionGenerator *)self regenerateFaceGalleryConfigurationCoalescedWithReason:@"poster configurations had significant changes"];
  }
}

id __97__ATXFaceSuggestionGenerator_configurationCacheDidUpdateWithNewConfigurations_oldConfigurations___block_invoke(uint64_t a1, void *a2)
{
  return personalityStringFromComplication(a2);
}

id __97__ATXFaceSuggestionGenerator_configurationCacheDidUpdateWithNewConfigurations_oldConfigurations___block_invoke_2(uint64_t a1, void *a2)
{
  return personalityStringFromComplication(a2);
}

- (ATXFaceSuggestionGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATXFaceSuggestionGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_regenerationCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_complicationDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_complicationProvider, 0);
  objc_storeStrong((id *)&self->_configurationCache, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
}

- (void)_generateFaceGalleryConfigurationNotifyingWithGuardedData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  char v3 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: unable to fetch accessory widget descriptors: %@; using empty dictionary",
    (uint8_t *)&v2,
    0x16u);
}

@end
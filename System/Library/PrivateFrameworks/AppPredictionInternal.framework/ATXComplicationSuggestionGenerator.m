@interface ATXComplicationSuggestionGenerator
- (ATXComplicationSet)inlineSet;
- (ATXComplicationSuggestionGenerator)init;
- (BOOL)_complicationIsAlreadyAdded:(id)a3 alreadyAddedComplications:(id)a4;
- (BOOL)_layoutIsValidGivenComplications:(id)a3 allowedComplicationPersonalities:(id)a4;
- (BOOL)_shouldAddComplication:(id)a3 andFilterFromAppsDisabledByAppProtection:(id)a4;
- (id)_circularComplicationFromComplications:(id)a3;
- (id)_complicationsFromFallbackSet:(id)a3 complicationDescriptors:(id)a4 alreadyAddedDescriptors:(id)a5 andFilterFromAppsDisabledByAppProtection:(id)a6;
- (id)_getComplicationsOfFamily:(int64_t)a3 descriptors:(id)a4 alreadyAddedDescriptors:(id)a5 presetComplications:(id)a6 limit:(unint64_t)a7;
- (id)_inlineSetDescriptors_ShouldRefresh:(BOOL)a3;
- (id)_landscapeModularFallbackSets;
- (id)_landscapeModularSetDescriptors_ShouldRefresh:(BOOL)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6;
- (id)_modularDescriptors_ShouldRefresh:(BOOL)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6;
- (id)_modularFallbackSets;
- (id)_modularLayoutTypesGivenRecentsLayoutType:(int64_t)a3;
- (id)_presetLandscapeComplicationsFromPortraitSet:(id)a3;
- (id)_recentInlineComplications;
- (id)_recentLandscapeComplicationsWithPresetDictionary:(id)a3;
- (id)_recentsComplications_unusedComplications:(id)a3;
- (id)_recentsSet_unusedComplications:(id)a3;
- (id)_rectangularComplicationFromComplications:(id)a3;
- (id)_scoredInlineComplicationDescriptors;
- (id)_scoredModularComplicationDescriptorsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5;
- (id)_setWithDesiredLayout:(int64_t)a3 complicationDescriptors:(id)a4 unusedRecentsComplications:(id)a5 alreadyAddedComplications:(id)a6;
- (id)descriptionForScoredSet:(id)a3;
- (id)inputDescriptionForComplicationSuggestionSignal:(id)a3;
- (id)landscapeModularSetsDictsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 portraitSets:(id)a6;
- (id)landscapeModularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5;
- (id)landscapeModularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 presetPortraitComplications:(id)a6;
- (id)modelDescription;
- (id)modularSetsWithDesiredLayouts:(id)a3 unusedRecentComplications:(id)a4 alreadyAddedComplications:(id)a5 widgetDescriptorsAdditionalData:(id)a6 aggregatedAppLaunchData:(id)a7 bundleIdToCompanionBundleId:(id)a8;
- (id)modularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5;
- (id)scoredComplicationsDescription;
- (int64_t)_layoutTypeForSet:(id)a3;
- (void)refreshComplicationCache;
- (void)scoredComplicationsDescription;
@end

@implementation ATXComplicationSuggestionGenerator

- (ATXComplicationSuggestionGenerator)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATXComplicationSuggestionGenerator;
  v2 = [(ATXComplicationSuggestionGenerator *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4B430] sharedInstance];
    descriptorCache = v2->_descriptorCache;
    v2->_descriptorCache = (ATXWidgetDescriptorCache *)v3;

    uint64_t v5 = objc_opt_new();
    complicationSuggestionCache = v2->_complicationSuggestionCache;
    v2->_complicationSuggestionCache = (ATXComplicationSuggestionCache *)v5;

    uint64_t v7 = objc_opt_new();
    complicationScorer = v2->_complicationScorer;
    v2->_complicationScorer = (ATXComplicationSuggestionScorer *)v7;

    uint64_t v9 = +[ATXComplicationSuggestionParameters sharedInstance];
    parameters = v2->_parameters;
    v2->_parameters = (ATXComplicationSuggestionParameters *)v9;

    uint64_t v11 = +[ATXPosterConfigurationCache sharedInstance];
    posterConfigurationCache = v2->_posterConfigurationCache;
    v2->_posterConfigurationCache = (ATXPosterConfigurationCache *)v11;
  }
  return v2;
}

- (void)refreshComplicationCache
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not load accessory widget descriptors for complication refresh: %@", (uint8_t *)&v2, 0xCu);
}

- (id)_recentsSet_unusedComplications:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ATXComplicationSuggestionGenerator *)self _recentsComplications_unusedComplications:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setSource:1];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_recentsComplications_unusedComplications:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  uint64_t v4 = [(ATXWidgetDescriptorCache *)self->_descriptorCache modularComplicationWidgetDescriptors];
  v46 = objc_msgSend(v4, "_pas_mappedSetWithTransform:", &__block_literal_global_105);
  uint64_t v5 = [(ATXPosterConfigurationCache *)self->_posterConfigurationCache configurations];
  uint64_t v6 = +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v70 count:16];
  v40 = v4;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v64;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v64 != v10) {
        objc_enumerationMutation(v7);
      }
      long long v12 = *(void **)(*((void *)&v63 + 1) + 8 * v11);
      if ([v12 isSelected])
      {
        long long v13 = [v12 complications];
        if ([(ATXComplicationSuggestionGenerator *)self _layoutIsValidGivenComplications:v13 allowedComplicationPersonalities:v46])
        {
          v61[0] = MEMORY[0x1E4F143A8];
          v61[1] = 3221225472;
          v61[2] = __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke_2;
          v61[3] = &unk_1E68B1740;
          v61[4] = self;
          id v62 = v6;
          uint64_t v14 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", v61);

          if (v14) {
            goto LABEL_26;
          }
          goto LABEL_13;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v63 objects:v70 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

LABEL_13:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (([v20 isSelected] & 1) == 0)
        {
          v21 = [v20 complications];
          if ([(ATXComplicationSuggestionGenerator *)self _layoutIsValidGivenComplications:v21 allowedComplicationPersonalities:v46])
          {
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke_3;
            v55[3] = &unk_1E68B1740;
            v55[4] = self;
            id v56 = v6;
            uint64_t v14 = objc_msgSend(v21, "_pas_mappedArrayWithTransform:", v55);

            goto LABEL_25;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_25:

LABEL_26:
  v39 = v6;
  id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v38 = (id)v14;
  if (v14) {
    uint64_t v23 = v14;
  }
  else {
    uint64_t v23 = MEMORY[0x1E4F1CBF0];
  }
  v24 = (void *)[v22 initWithArray:v23];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v7;
  uint64_t v43 = [obj countByEnumeratingWithState:&v51 objects:v68 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v52;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v52 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v25;
        v26 = *(void **)(*((void *)&v51 + 1) + 8 * v25);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v27 = [v26 complications];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v67 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v48 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v47 + 1) + 8 * j);
              id v33 = objc_alloc(MEMORY[0x1E4F4B440]);
              v34 = [v32 extensionBundleIdentifier];
              v35 = [v32 kind];
              v36 = (void *)[v33 initWithExtensionBundleId:v34 kind:v35];

              if (([v24 containsObject:v32] & 1) == 0
                && [v46 containsObject:v36])
              {
                [v45 addObject:v32];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v47 objects:v67 count:16];
          }
          while (v29);
        }

        uint64_t v25 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v51 objects:v68 count:16];
    }
    while (v43);
  }

  return v38;
}

id __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x1E4F4B440];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 extensionBundleIdentifier];
  uint64_t v6 = [v3 kind];

  id v7 = (void *)[v4 initWithExtensionBundleId:v5 kind:v6];
  return v7;
}

id __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldAddComplication:v3 andFilterFromAppsDisabledByAppProtection:*(void *)(a1 + 40)])id v4 = objc_msgSend(v3, "copy"); {
  else
  }
    id v4 = 0;

  return v4;
}

id __80__ATXComplicationSuggestionGenerator__recentsComplications_unusedComplications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldAddComplication:v3 andFilterFromAppsDisabledByAppProtection:*(void *)(a1 + 40)])id v4 = objc_msgSend(v3, "copy"); {
  else
  }
    id v4 = 0;

  return v4;
}

- (id)_recentInlineComplications
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v18 = (id)objc_opt_new();
  id v22 = objc_opt_new();
  uint64_t v17 = [(ATXWidgetDescriptorCache *)self->_descriptorCache inlineComplicationWidgetDescriptors];
  v21 = objc_msgSend(v17, "_pas_mappedSetWithTransform:", &__block_literal_global_25_0);
  v19 = self;
  id v3 = [(ATXPosterConfigurationCache *)self->_posterConfigurationCache configurations];
  v20 = +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [v9 inlineComplication];
        uint64_t v11 = (void *)[v10 copy];

        id v12 = objc_alloc(MEMORY[0x1E4F4B440]);
        long long v13 = [v11 extensionBundleIdentifier];
        uint64_t v14 = [v11 kind];
        id v15 = (void *)[v12 initWithExtensionBundleId:v13 kind:v14];

        if (v11
          && ([v22 containsObject:v11] & 1) == 0
          && [v21 containsObject:v15]
          && [(ATXComplicationSuggestionGenerator *)v19 _shouldAddComplication:v11 andFilterFromAppsDisabledByAppProtection:v20])
        {
          if ([v9 isSelected]) {
            [v18 insertObject:v11 atIndex:0];
          }
          else {
            [v18 addObject:v11];
          }
          [v11 setSource:1];
          [v22 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  return v18;
}

id __64__ATXComplicationSuggestionGenerator__recentInlineComplications__block_invoke(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x1E4F4B440];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 extensionBundleIdentifier];
  uint64_t v6 = [v3 kind];

  uint64_t v7 = (void *)[v4 initWithExtensionBundleId:v5 kind:v6];
  return v7;
}

- (id)_recentLandscapeComplicationsWithPresetDictionary:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v45 = *MEMORY[0x1E4F4AD68];
  id v4 = objc_msgSend(v3, "objectForKeyedSubscript:");
  uint64_t v5 = [v4 complications];
  uint64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  long long v52 = v8;

  uint64_t v44 = *MEMORY[0x1E4F4AD70];
  uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:");
  uint64_t v10 = [v9 complications];
  uint64_t v11 = (void *)[v10 mutableCopy];
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  long long v51 = v13;

  uint64_t v43 = *MEMORY[0x1E4F4AD78];
  uint64_t v14 = objc_msgSend(v3, "objectForKeyedSubscript:");
  id v15 = [v14 complications];
  uint64_t v16 = (void *)[v15 mutableCopy];
  uint64_t v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_opt_new();
  }
  long long v50 = v18;

  v19 = objc_opt_new();
  uint64_t v42 = [(ATXWidgetDescriptorCache *)self->_descriptorCache landscapeModularComplicationWidgetDescriptors];
  id v56 = objc_msgSend(v42, "_pas_mappedSetWithTransform:", &__block_literal_global_27_0);
  v20 = [(ATXPosterConfigurationCache *)self->_posterConfigurationCache configurations];
  long long v54 = +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v20;
  uint64_t v48 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v62;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v21;
        id v22 = *(void **)(*((void *)&v61 + 1) + 8 * v21);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v53 = v22;
        long long v23 = [v22 landscapeComplications];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v58 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              [v28 setSource:1];
              id v29 = objc_alloc(MEMORY[0x1E4F4B440]);
              uint64_t v30 = [v28 extensionBundleIdentifier];
              v31 = [v28 kind];
              v32 = (void *)[v29 initWithExtensionBundleId:v30 kind:v31];

              if (v28
                && ([v19 containsObject:v28] & 1) == 0
                && [v56 containsObject:v32]
                && [(ATXComplicationSuggestionGenerator *)self _shouldAddComplication:v28 andFilterFromAppsDisabledByAppProtection:v54])
              {
                uint64_t v33 = [v28 widgetFamily];
                if (v33 == 1)
                {
                  if (![v53 isSelected])
                  {
                    v37 = v50;
                    goto LABEL_40;
                  }
                  v35 = v50;
                }
                else
                {
                  uint64_t v34 = v33;
                  if (v33 != 11)
                  {
                    if (v33 == 10)
                    {
                      if ([v53 isSelected])
                      {
                        v35 = v52;
                        goto LABEL_33;
                      }
                      v37 = v52;
LABEL_40:
                      [v37 addObject:v28];
                    }
                    else
                    {
                      v36 = __atxlog_handle_lock_screen();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                        -[ATXComplicationSuggestionGenerator _recentLandscapeComplicationsWithPresetDictionary:]((uint64_t)v65, v34);
                      }
                    }
LABEL_41:
                    [v19 addObject:v28];
                    goto LABEL_42;
                  }
                  if (![v53 isSelected])
                  {
                    v37 = v51;
                    goto LABEL_40;
                  }
                  v35 = v51;
                }
LABEL_33:
                [v35 insertObject:v28 atIndex:0];
                goto LABEL_41;
              }
LABEL_42:
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
          }
          while (v25);
        }

        uint64_t v21 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v48);
  }

  id v38 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v50];
  [v3 setObject:v38 forKeyedSubscript:v43];

  v39 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v51];
  [v3 setObject:v39 forKeyedSubscript:v44];

  v40 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v52];
  [v3 setObject:v40 forKeyedSubscript:v45];

  return v3;
}

id __88__ATXComplicationSuggestionGenerator__recentLandscapeComplicationsWithPresetDictionary___block_invoke(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x1E4F4B440];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 extensionBundleIdentifier];
  uint64_t v6 = [v3 kind];

  uint64_t v7 = (void *)[v4 initWithExtensionBundleId:v5 kind:v6];
  return v7;
}

- (id)modularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(ATXComplicationSuggestionParameters *)self->_parameters alwaysUseFallbackSets])
  {
    id v11 = [(ATXComplicationSuggestionGenerator *)self _modularFallbackSets];
  }
  else
  {
    v27 = objc_opt_new();
    id v12 = objc_opt_new();
    id v13 = objc_opt_new();
    uint64_t v14 = [(ATXComplicationSuggestionGenerator *)self _recentsSet_unusedComplications:v13];
    id v29 = v8;
    if (v14)
    {
      [v27 addObject:v14];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = [v14 complications];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(v12, "addObject:", *(void *)(*((void *)&v30 + 1) + 8 * i), v27);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v17);
      }

      id v8 = v29;
    }
    v20 = -[ATXComplicationSuggestionGenerator _modularLayoutTypesGivenRecentsLayoutType:](self, "_modularLayoutTypesGivenRecentsLayoutType:", -[ATXComplicationSuggestionGenerator _layoutTypeForSet:](self, "_layoutTypeForSet:", v14, v27));
    uint64_t v21 = [(ATXComplicationSuggestionGenerator *)self modularSetsWithDesiredLayouts:v20 unusedRecentComplications:v13 alreadyAddedComplications:v12 widgetDescriptorsAdditionalData:v8 aggregatedAppLaunchData:v9 bundleIdToCompanionBundleId:v10];
    uint64_t v22 = [v21 count];
    long long v23 = __atxlog_handle_lock_screen();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138412290;
        v35 = v21;
        _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Received modular sets: %@. Returning.", buf, 0xCu);
      }

      uint64_t v25 = v28;
      [v28 addObjectsFromArray:v21];
      id v11 = v28;
    }
    else
    {
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "No modular sets receiving. Returning fallback sets.", buf, 2u);
      }

      id v11 = [(ATXComplicationSuggestionGenerator *)self _modularFallbackSets];
      uint64_t v25 = v28;
    }

    id v8 = v29;
  }

  return v11;
}

- (id)modularSetsWithDesiredLayouts:(id)a3 unusedRecentComplications:(id)a4 alreadyAddedComplications:(id)a5 widgetDescriptorsAdditionalData:(id)a6 aggregatedAppLaunchData:(id)a7 bundleIdToCompanionBundleId:(id)a8
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = [(ATXComplicationSuggestionGenerator *)self _modularDescriptors_ShouldRefresh:0 widgetDescriptorsAdditionalData:a6 aggregatedAppLaunchData:a7 bundleIdToCompanionBundleId:a8];
  uint64_t v18 = objc_opt_new();
  if ([v14 count])
  {
    v19 = [v14 objectAtIndexedSubscript:0];
    v20 = -[ATXComplicationSuggestionGenerator _setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:](self, "_setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:", [v19 longValue], v17, v15, v16);

    uint64_t v21 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v20;
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "Set 1 complications: %@", buf, 0xCu);
    }

    if ([v20 count])
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v20];
      [v18 addObject:v22];
      if ((unint64_t)[v14 count] > 1)
      {
        BOOL v24 = [v14 objectAtIndexedSubscript:1];
        uint64_t v25 = -[ATXComplicationSuggestionGenerator _setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:](self, "_setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:", [v24 longValue], v17, v15, v16);

        uint64_t v26 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v25;
          _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "Set 2 complications: %@", buf, 0xCu);
        }

        if ([v25 count])
        {
          v27 = [objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v25];
          [v18 addObject:v27];
          if ((unint64_t)[v14 count] > 2)
          {
            uint64_t v34 = v27;
            uint64_t v28 = [v14 objectAtIndexedSubscript:2];
            v35 = -[ATXComplicationSuggestionGenerator _setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:](self, "_setWithDesiredLayout:complicationDescriptors:unusedRecentsComplications:alreadyAddedComplications:", [v28 longValue], v17, v15, v16);

            id v29 = __atxlog_handle_lock_screen();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v37 = v25;
              _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "Set 3 complications: %@", buf, 0xCu);
            }

            if ([v35 count])
            {
              long long v33 = [objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v35];
              objc_msgSend(v18, "addObject:");
              v27 = v34;
              if ((unint64_t)[v14 count] >= 4)
              {
                long long v30 = __atxlog_handle_lock_screen();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                  -[ATXComplicationSuggestionGenerator modularSetsWithDesiredLayouts:unusedRecentComplications:alreadyAddedComplications:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](v30);
                }
              }
              id v23 = v18;
            }
            else
            {
              long long v31 = __atxlog_handle_lock_screen();
              v27 = v34;
              long long v33 = v31;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "Showing fallback sets since we couldn't fill Set 3", buf, 2u);
              }
              id v23 = 0;
            }
          }
          else
          {
            id v23 = v18;
          }
        }
        else
        {
          v27 = __atxlog_handle_lock_screen();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "Showing fallback sets since we couldn't fill Set 2", buf, 2u);
          }
          id v23 = 0;
        }
      }
      else
      {
        id v23 = v18;
      }
    }
    else
    {
      uint64_t v22 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Showing fallback sets since we couldn't fill Set 1", buf, 2u);
      }
      id v23 = 0;
    }
  }
  else
  {
    id v23 = v18;
  }

  return v23;
}

- (id)_modularDescriptors_ShouldRefresh:(BOOL)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(ATXComplicationSuggestionCache *)self->_complicationSuggestionCache fetchModularSetComplicationDescriptors];
  id v14 = v13;
  if (a3 || ![v13 count])
  {
    id v16 = [(ATXWidgetDescriptorCache *)self->_descriptorCache modularComplicationWidgetDescriptors];
    id v15 = [(ATXComplicationSuggestionScorer *)self->_complicationScorer complicationDescriptorsForModularSetGivenComplicationDescriptors:v16 widgetDescriptorsAdditionalData:v10 aggregatedAppLaunchData:v11 bundleIdToCompanionBundleId:v12];
    if (![(ATXComplicationSuggestionCache *)self->_complicationSuggestionCache writeComplicationsModularSetCache:v15])
    {
      uint64_t v17 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Error while writing complication cache for set 2", v19, 2u);
      }
    }
  }
  else
  {
    id v15 = v14;
  }

  return v15;
}

- (id)_scoredModularComplicationDescriptorsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  descriptorCache = self->_descriptorCache;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ATXWidgetDescriptorCache *)descriptorCache modularComplicationWidgetDescriptors];
  id v13 = [(ATXComplicationSuggestionScorer *)self->_complicationScorer scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:v12 widgetDescriptorsAdditionalData:v11 aggregatedAppLaunchData:v10 bundleIdToCompanionBundleId:v9 checkEligibility:0];

  return v13;
}

- (id)landscapeModularSetsDictsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 portraitSets:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [(ATXComplicationSuggestionGenerator *)self _presetLandscapeComplicationsFromPortraitSet:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        v19 = (void *)[v18 mutableCopy];
        v20 = [(ATXComplicationSuggestionGenerator *)self landscapeModularSetsWithWidgetDescriptorsAdditionalData:v23 aggregatedAppLaunchData:v10 bundleIdToCompanionBundleId:v11 presetPortraitComplications:v19];

        [v13 addObject:v20];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  return v13;
}

- (id)landscapeModularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  return [(ATXComplicationSuggestionGenerator *)self landscapeModularSetsWithWidgetDescriptorsAdditionalData:a3 aggregatedAppLaunchData:a4 bundleIdToCompanionBundleId:a5 presetPortraitComplications:0];
}

- (id)landscapeModularSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 presetPortraitComplications:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x1D25F6CC0]();
  if ([(ATXComplicationSuggestionParameters *)self->_parameters alwaysUseFallbackSets])
  {
    uint64_t v15 = [(ATXComplicationSuggestionGenerator *)self _landscapeModularFallbackSets];
    goto LABEL_14;
  }
  uint64_t v16 = objc_opt_new();
  long long v53 = [(ATXComplicationSuggestionGenerator *)self _landscapeModularSetDescriptors_ShouldRefresh:0 widgetDescriptorsAdditionalData:v10 aggregatedAppLaunchData:v11 bundleIdToCompanionBundleId:v12];
  long long v52 = objc_opt_new();
  id v49 = v11;
  id v50 = v10;
  id v47 = v13;
  id v48 = v12;
  v46 = v14;
  if (v13)
  {
    uint64_t v17 = [(ATXComplicationSuggestionGenerator *)self _recentLandscapeComplicationsWithPresetDictionary:v13];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
    uint64_t v17 = [(ATXComplicationSuggestionGenerator *)self _recentLandscapeComplicationsWithPresetDictionary:v18];
  }
  id v19 = objc_alloc(MEMORY[0x1E4F4AF58]);
  uint64_t v20 = *MEMORY[0x1E4F4AD78];
  uint64_t v51 = *MEMORY[0x1E4F4AD78];
  uint64_t v21 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F4AD78]];
  uint64_t v22 = [v21 complications];
  id v23 = [(ATXComplicationSuggestionGenerator *)self _getComplicationsOfFamily:1 descriptors:v53 alreadyAddedDescriptors:v52 presetComplications:v22 limit:2];
  long long v24 = (void *)[v19 initWithComplications:v23];
  [v16 setObject:v24 forKeyedSubscript:v20];

  id v25 = objc_alloc(MEMORY[0x1E4F4AF58]);
  uint64_t v26 = *MEMORY[0x1E4F4AD70];
  long long v27 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F4AD70]];
  uint64_t v28 = [v27 complications];
  uint64_t v29 = [(ATXComplicationSuggestionGenerator *)self _getComplicationsOfFamily:11 descriptors:v53 alreadyAddedDescriptors:v52 presetComplications:v28 limit:2];
  long long v30 = (void *)[v25 initWithComplications:v29];
  [v16 setObject:v30 forKeyedSubscript:v26];

  id v31 = objc_alloc(MEMORY[0x1E4F4AF58]);
  uint64_t v32 = *MEMORY[0x1E4F4AD68];
  long long v33 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F4AD68]];
  uint64_t v34 = [v33 complications];
  v35 = [(ATXComplicationSuggestionGenerator *)self _getComplicationsOfFamily:10 descriptors:v53 alreadyAddedDescriptors:v52 presetComplications:v34 limit:4];
  v36 = (void *)[v31 initWithComplications:v35];
  [v16 setObject:v36 forKeyedSubscript:v32];

  uint64_t v37 = [v16 objectForKeyedSubscript:v51];
  uint64_t v38 = [v37 complications];
  if ([v38 count] != 2) {
    goto LABEL_11;
  }
  v39 = [v16 objectForKeyedSubscript:v26];
  v40 = [v39 complications];
  if ([v40 count] != 2)
  {

LABEL_11:
    id v11 = v49;
    id v10 = v50;
    id v13 = v47;
    id v12 = v48;
    uint64_t v14 = v46;
    goto LABEL_12;
  }
  v41 = [v16 objectForKeyedSubscript:v32];
  uint64_t v42 = [v41 complications];
  uint64_t v43 = [v42 count];

  id v11 = v49;
  id v10 = v50;
  id v13 = v47;
  id v12 = v48;
  uint64_t v14 = v46;
  if (v43 != 4)
  {
LABEL_12:
    uint64_t v44 = [(ATXComplicationSuggestionGenerator *)self _landscapeModularFallbackSets];
    goto LABEL_13;
  }
  uint64_t v44 = [v16 copy];
LABEL_13:
  uint64_t v15 = (void *)v44;

LABEL_14:

  return v15;
}

- (id)_landscapeModularSetDescriptors_ShouldRefresh:(BOOL)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(ATXComplicationSuggestionCache *)self->_complicationSuggestionCache fetchLandscapeModularSetComplicationDescriptors];
  uint64_t v14 = v13;
  if (a3 || ![v13 count])
  {
    uint64_t v16 = [(ATXWidgetDescriptorCache *)self->_descriptorCache landscapeModularComplicationWidgetDescriptors];
    id v15 = [(ATXComplicationSuggestionScorer *)self->_complicationScorer complicationDescriptorsForModularSetGivenComplicationDescriptors:v16 widgetDescriptorsAdditionalData:v10 aggregatedAppLaunchData:v11 bundleIdToCompanionBundleId:v12];
    if (![(ATXComplicationSuggestionCache *)self->_complicationSuggestionCache writeComplicationsInlineSetCache:v15])
    {
      uint64_t v17 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Error while writing complication cache for inline set", v19, 2u);
      }
    }
  }
  else
  {
    id v15 = v14;
  }

  return v15;
}

- (id)_getComplicationsOfFamily:(int64_t)a3 descriptors:(id)a4 alreadyAddedDescriptors:(id)a5 presetComplications:(id)a6 limit:(unint64_t)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  id v11 = a5;
  id v12 = a6;
  v36 = objc_opt_new();
  v40 = objc_opt_new();
  uint64_t v38 = +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v47;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v47 != v15) {
        objc_enumerationMutation(obj);
      }
      if (!a7) {
        goto LABEL_20;
      }
      uint64_t v17 = *(void **)(*((void *)&v46 + 1) + 8 * v16);
      uint64_t v18 = objc_msgSend(v17, "widgetDescriptor", v34);
      if (([v11 containsObject:v18] & 1) == 0) {
        break;
      }
LABEL_18:

      if (v14 == ++v16)
      {
        uint64_t v14 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v14) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }
    id v19 = [v17 containerBundleIdentifier];
    if (v19
      || ([v17 extensionBundleIdentifier], (id v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ([v40 containsObject:v19])
      {
LABEL_17:

        goto LABEL_18;
      }
      char v20 = 0;
    }
    else
    {
      char v20 = 1;
    }
    if ([(ATXComplicationSuggestionGenerator *)self _shouldAddComplication:v17 andFilterFromAppsDisabledByAppProtection:v38])
    {
      [v36 addObject:v17];
      [v11 addObject:v18];
      if ((v20 & 1) == 0) {
        [v40 addObject:v19];
      }
      --a7;
    }
    goto LABEL_17;
  }
LABEL_20:

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v21 = v34;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v43;
    id v35 = v21;
LABEL_22:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v43 != v24) {
        objc_enumerationMutation(v21);
      }
      if (!a7) {
        goto LABEL_44;
      }
      uint64_t v26 = *(void **)(*((void *)&v42 + 1) + 8 * v25);
      if (([v11 containsObject:v26] & 1) == 0) {
        break;
      }
LABEL_42:
      if (v23 == ++v25)
      {
        uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v23) {
          goto LABEL_22;
        }
        goto LABEL_44;
      }
    }
    long long v27 = [v26 extensionIdentity];
    uint64_t v28 = [v27 containerBundleIdentifier];
    if (v28)
    {
      uint64_t v29 = (void *)v28;
    }
    else
    {
      uint64_t v29 = [v26 extensionBundleIdentifier];

      if (!v29)
      {
        char v30 = 1;
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v40, "containsObject:", v29, v35))
    {
LABEL_41:

      goto LABEL_42;
    }
    char v30 = 0;
LABEL_33:
    objc_msgSend(v26, "disfavoredFamiliesForLocation:", 1, v35);
    [v26 supportedFamilies];
    if (CHSWidgetFamilyMaskContainsFamily() && (CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
    {
      id v31 = [objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:v26 widgetFamily:a3 intent:0 source:2];
      [v36 addObject:v31];
      [v11 addObject:v26];
      if ((v30 & 1) == 0) {
        [v40 addObject:v29];
      }
      --a7;
      id v21 = v35;
    }
    else
    {
      id v31 = __atxlog_handle_lock_screen();
      id v21 = v35;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "Incorrect complication descriptor received", buf, 2u);
      }
    }

    goto LABEL_41;
  }
LABEL_44:

  uint64_t v32 = (void *)[v36 copy];
  return v32;
}

- (id)_presetLandscapeComplicationsFromPortraitSet:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v22 = objc_opt_new();
  id v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v21 = v3;
  uint64_t v7 = [v3 complications];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = [v12 widgetFamily];
        if (v13 == 1)
        {
          uint64_t v15 = v6;
          goto LABEL_12;
        }
        uint64_t v14 = v13;
        if (v13 == 11)
        {
          uint64_t v15 = v5;
          goto LABEL_12;
        }
        if (v13 == 10)
        {
          uint64_t v15 = v4;
LABEL_12:
          [v15 addObject:v12];
          continue;
        }
        uint64_t v16 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[ATXComplicationSuggestionGenerator _recentLandscapeComplicationsWithPresetDictionary:]((uint64_t)v27, v14);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v6];
  [v22 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F4AD78]];

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v5];
  [v22 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F4AD70]];

  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v4];
  [v22 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F4AD68]];

  return v22;
}

- (ATXComplicationSet)inlineSet
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection];
  id v3 = objc_opt_new();
  v36 = self;
  id v4 = [(ATXComplicationSuggestionGenerator *)self _recentInlineComplications];
  uint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 count];
    if (v6 >= 3) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t v8 = objc_msgSend(v5, "subarrayWithRange:", 0, v7);
    uint64_t v9 = [v8 mutableCopy];

    id v3 = (void *)v9;
  }
  uint64_t v10 = [v3 count];
  if (v10 != 3)
  {
    uint64_t v11 = v10;
    id v34 = v5;
    id v12 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v35 = v3;
    id v13 = v3;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v19 = [v18 containerBundleIdentifier];
          if (v19)
          {
            char v20 = [v18 containerBundleIdentifier];
            [v12 addObject:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v15);
    }

    [(ATXComplicationSuggestionGenerator *)v36 _inlineSetDescriptors_ShouldRefresh:0];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = 3 - v11;
      uint64_t v24 = *(void *)v41;
LABEL_18:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(obj);
        }
        if (!v23) {
          break;
        }
        long long v26 = *(void **)(*((void *)&v40 + 1) + 8 * v25);
        long long v27 = [v26 extensionIdentity];
        uint64_t v28 = [v27 containerBundleIdentifier];
        if (v28)
        {
          uint64_t v29 = (void *)v28;
        }
        else
        {
          uint64_t v29 = [v26 extensionBundleIdentifier];

          if (!v29)
          {
            char v30 = 1;
LABEL_28:
            [v26 disfavoredFamiliesForLocation:1];
            [v26 supportedFamilies];
            if (CHSWidgetFamilyMaskContainsFamily() && (CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
            {
              id v31 = [objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:v26 widgetFamily:12 intent:0 source:2];
              if ([(ATXComplicationSuggestionGenerator *)v36 _shouldAddComplication:v31 andFilterFromAppsDisabledByAppProtection:v37])
              {
                [v13 addObject:v31];
                if ((v30 & 1) == 0) {
                  [v12 addObject:v29];
                }
                --v23;
              }
            }
            else
            {
              id v31 = __atxlog_handle_lock_screen();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "Non inline complication descriptor received", buf, 2u);
              }
            }

            goto LABEL_37;
          }
        }
        if (([v12 containsObject:v29] & 1) == 0)
        {
          char v30 = 0;
          goto LABEL_28;
        }
LABEL_37:

        if (v22 == ++v25)
        {
          uint64_t v22 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v22) {
            goto LABEL_18;
          }
          break;
        }
      }
    }

    uint64_t v5 = v34;
    id v3 = v35;
  }
  if (v3) {
    uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v3];
  }
  else {
    uint64_t v32 = 0;
  }

  return (ATXComplicationSet *)v32;
}

- (id)_inlineSetDescriptors_ShouldRefresh:(BOOL)a3
{
  uint64_t v5 = [(ATXComplicationSuggestionCache *)self->_complicationSuggestionCache fetchInlineSetComplicationDescriptors];
  unint64_t v6 = v5;
  if (a3 || ![v5 count])
  {
    uint64_t v8 = [(ATXWidgetDescriptorCache *)self->_descriptorCache inlineComplicationWidgetDescriptors];
    id v7 = [(ATXComplicationSuggestionScorer *)self->_complicationScorer complicationDescriptorsForInlineSetGivenComplicationDescriptors:v8];
    if (![(ATXComplicationSuggestionCache *)self->_complicationSuggestionCache writeComplicationsInlineSetCache:v7])
    {
      uint64_t v9 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Error while writing complication cache for inline set", v11, 2u);
      }
    }
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

- (id)_scoredInlineComplicationDescriptors
{
  id v3 = [(ATXWidgetDescriptorCache *)self->_descriptorCache inlineComplicationWidgetDescriptors];
  id v4 = [(ATXComplicationSuggestionScorer *)self->_complicationScorer scoredComplicationDescriptorsForInlineSetGivenComplicationDescriptors:v3];

  return v4;
}

- (id)scoredComplicationsDescription
{
  id v3 = objc_opt_new();
  [v3 appendString:@"Modular Set Scores:\n"];
  descriptorCache = self->_descriptorCache;
  id v18 = 0;
  uint64_t v5 = [(ATXWidgetDescriptorCache *)descriptorCache fetchAccessoryWidgetDescriptorMetadataWithError:&v18];
  id v6 = v18;
  id v7 = v5;
  if (!v5)
  {
    uint64_t v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ATXComplicationSuggestionGenerator *)(uint64_t)v6 scoredComplicationsDescription];
    }

    id v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F4AED0]);
  uint64_t v10 = [v9 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

  uint64_t v11 = [v10 allKeys];
  id v12 = +[ATXCompanionBundleIdMapper generateMappingForAppBundleIds:v11];
  id v13 = [(ATXComplicationSuggestionGenerator *)self _scoredModularComplicationDescriptorsWithWidgetDescriptorsAdditionalData:v7 aggregatedAppLaunchData:v10 bundleIdToCompanionBundleId:v12];
  uint64_t v14 = [(ATXComplicationSuggestionGenerator *)self descriptionForScoredSet:v13];

  [v3 appendString:v14];
  [v3 appendString:@"\nInline Set Scores:\n"];
  uint64_t v15 = [(ATXComplicationSuggestionGenerator *)self _scoredInlineComplicationDescriptors];
  uint64_t v16 = [(ATXComplicationSuggestionGenerator *)self descriptionForScoredSet:v15];

  [v3 appendString:v16];
  return v3;
}

- (id)inputDescriptionForComplicationSuggestionSignal:(id)a3
{
  descriptorCache = self->_descriptorCache;
  id v5 = a3;
  id v6 = [(ATXWidgetDescriptorCache *)descriptorCache complicationWidgetDescriptors];
  id v7 = [(ATXComplicationSuggestionScorer *)self->_complicationScorer inputDescriptionForSignal:v5 complicationDescriptors:v6];

  return v7;
}

- (id)modelDescription
{
  return [(ATXComplicationSuggestionScorer *)self->_complicationScorer modelDescription];
}

- (id)descriptionForScoredSet:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v27 = v3;
  [v3 keysSortedByValueUsingComparator:&__block_literal_global_39];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v8 = &unk_1F27F0E58;
    uint64_t v24 = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v27 objectForKeyedSubscript:v10];
        char v12 = [v11 isEqual:v8];

        if ((v12 & 1) == 0)
        {
          id v13 = NSString;
          long long v26 = [v10 extensionIdentity];
          uint64_t v14 = [v26 containerBundleIdentifier];
          uint64_t v15 = [v10 extensionBundleIdentifier];
          uint64_t v16 = [v10 kind];
          [v10 supportedFamilies];
          CHSWidgetFamilyMaskDescription();
          uint64_t v17 = v6;
          id v18 = v8;
          v20 = uint64_t v19 = v7;
          uint64_t v21 = [v27 objectForKeyedSubscript:v10];
          uint64_t v22 = [v13 stringWithFormat:@"\nContainer: %@\nExtension: %@\nKind: %@\nFamilies:%@\nScore: %@\n", v14, v15, v16, v20, v21];

          uint64_t v7 = v19;
          uint64_t v8 = v18;
          uint64_t v6 = v17;

          id v4 = v24;
          [v24 appendString:v22];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
  [v4 appendString:@"--------------------------------------------"];

  return v4;
}

uint64_t __62__ATXComplicationSuggestionGenerator_descriptionForScoredSet___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (int64_t)_layoutTypeForSet:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    int64_t v17 = 0;
    goto LABEL_22;
  }
  uint64_t v5 = [v3 complications];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [v4 complications];
  uint64_t v8 = v7;
  if (v6 != 4)
  {
    uint64_t v18 = [v7 count];

    uint64_t v19 = [v4 complications];
    uint64_t v8 = v19;
    if (v18 == 3)
    {
      id v9 = [v19 objectAtIndexedSubscript:0];
      if ([v9 widgetFamily] == 11)
      {
        uint64_t v10 = [v4 complications];
        uint64_t v11 = [v10 objectAtIndexedSubscript:1];
        if ([v11 widgetFamily] == 10)
        {
          char v20 = [v4 complications];
          uint64_t v21 = [v20 objectAtIndexedSubscript:2];
          uint64_t v22 = [v21 widgetFamily];

          if (v22 == 10)
          {
            int64_t v17 = 3;
            goto LABEL_22;
          }
LABEL_21:
          int64_t v17 = 4;
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v23 = [v19 count];

      if (v23 != 2) {
        goto LABEL_21;
      }
      uint64_t v8 = [v4 complications];
      id v9 = [v8 objectAtIndexedSubscript:0];
      if ([v9 widgetFamily] == 11)
      {
        uint64_t v24 = [v4 complications];
        int64_t v17 = 1;
        uint64_t v25 = [v24 objectAtIndexedSubscript:1];
        uint64_t v26 = [v25 widgetFamily];

        if (v26 == 11) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  id v9 = [v7 objectAtIndexedSubscript:0];
  if ([v9 widgetFamily] != 10) {
    goto LABEL_20;
  }
  uint64_t v10 = [v4 complications];
  uint64_t v11 = [v10 objectAtIndexedSubscript:1];
  if ([v11 widgetFamily] != 10)
  {
LABEL_19:

    goto LABEL_20;
  }
  char v12 = [v4 complications];
  id v13 = [v12 objectAtIndexedSubscript:2];
  if ([v13 widgetFamily] != 10)
  {

    goto LABEL_19;
  }
  uint64_t v14 = [v4 complications];
  uint64_t v15 = [v14 objectAtIndexedSubscript:3];
  uint64_t v16 = [v15 widgetFamily];

  if (v16 != 10) {
    goto LABEL_21;
  }
  int64_t v17 = 2;
LABEL_22:

  return v17;
}

- (id)_modularLayoutTypesGivenRecentsLayoutType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return &unk_1F27F2DC0;
  }
  else {
    return (id)qword_1E68B1760[a3];
  }
}

- (id)_modularFallbackSets
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = [(ATXWidgetDescriptorCache *)self->_descriptorCache landscapeModularComplicationWidgetDescriptors];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection];
  uint64_t v7 = [(ATXComplicationSuggestionParameters *)self->_parameters fallbackSetsForSet1];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));
    uint64_t v10 = [(ATXComplicationSuggestionGenerator *)self _complicationsFromFallbackSet:v9 complicationDescriptors:v4 alreadyAddedDescriptors:v5 andFilterFromAppsDisabledByAppProtection:v6];

    if (v10)
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v10];
      [v3 addObject:v11];
    }
  }

  char v12 = [(ATXComplicationSuggestionParameters *)self->_parameters fallbackSetsForSet2];
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v12, "count")));
    uint64_t v15 = [(ATXComplicationSuggestionGenerator *)self _complicationsFromFallbackSet:v14 complicationDescriptors:v4 alreadyAddedDescriptors:v5 andFilterFromAppsDisabledByAppProtection:v6];

    if (v15)
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v15];
      [v3 addObject:v16];
    }
  }

  int64_t v17 = [(ATXComplicationSuggestionParameters *)self->_parameters fallbackSetsForSet3];
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t v19 = objc_msgSend(v17, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v17, "count")));
    char v20 = [(ATXComplicationSuggestionGenerator *)self _complicationsFromFallbackSet:v19 complicationDescriptors:v4 alreadyAddedDescriptors:v5 andFilterFromAppsDisabledByAppProtection:v6];

    if (v20)
    {
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v20];
      [v3 addObject:v21];
    }
  }

  uint64_t v22 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = v3;
    _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Fallback Sets: %@", (uint8_t *)&v25, 0xCu);
  }

  uint64_t v23 = (void *)[v3 copy];
  return v23;
}

- (id)_landscapeModularFallbackSets
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection];
  uint64_t v5 = [(ATXWidgetDescriptorCache *)self->_descriptorCache landscapeModularComplicationWidgetDescriptors];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [(ATXComplicationSuggestionParameters *)self->_parameters fallbackSetForLandscape];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));
    long long v29 = v6;
    long long v30 = v5;
    long long v31 = v4;
    uint64_t v10 = [(ATXComplicationSuggestionGenerator *)self _complicationsFromFallbackSet:v9 complicationDescriptors:v5 alreadyAddedDescriptors:v6 andFilterFromAppsDisabledByAppProtection:v4];

    uint64_t v11 = objc_opt_new();
    char v12 = objc_opt_new();
    id v13 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v20 = [v19 widgetFamily];
          uint64_t v21 = v11;
          if (v20 != 10)
          {
            uint64_t v22 = [v19 widgetFamily];
            uint64_t v21 = v12;
            if (v22 != 11)
            {
              uint64_t v23 = [v19 widgetFamily];
              uint64_t v21 = v13;
              if (v23 != 1) {
                continue;
              }
            }
          }
          [v21 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }

    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v11];
    [v3 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F4AD68]];

    int v25 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v12];
    [v3 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F4AD70]];

    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v13];
    [v3 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F4AD78]];

    uint64_t v5 = v30;
    id v4 = v31;
    uint64_t v6 = v29;
  }
  uint64_t v27 = (void *)[v3 copy];

  return v27;
}

- (id)_setWithDesiredLayout:(int64_t)a3 complicationDescriptors:(id)a4 unusedRecentsComplications:(id)a5 alreadyAddedComplications:(id)a6
{
  id v9 = a4;
  id v32 = a5;
  id v10 = a6;
  long long v29 = +[ATXLockscreenBlacklist appsLockedOrHiddenByAppProtection];
  uint64_t v11 = objc_opt_new();
  id v12 = 0;
  switch(a3)
  {
    case 0:
    case 4:
      goto LABEL_43;
    case 1:
      id v13 = &unk_1F27F2E38;
      goto LABEL_6;
    case 2:
      id v13 = &unk_1F27F2E08;
      goto LABEL_6;
    case 3:
      id v13 = &unk_1F27F2E20;
      goto LABEL_6;
    default:
      id v13 = &unk_1F27F2DF0;
LABEL_6:
      if (![v9 count]) {
        goto LABEL_38;
      }
      long long v28 = v11;
      long long v30 = v10;
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      uint64_t v16 = 4;
      break;
  }
  do
  {
    uint64_t v17 = [v9 objectAtIndexedSubscript:v15];
    uint64_t v18 = v17;
    if (!v16)
    {

      id v10 = v30;
      uint64_t v11 = v28;
      goto LABEL_42;
    }
    [v17 supportedFamilies];
    [v18 disfavoredFamiliesForLocation:1];
    uint64_t v19 = [v13 objectAtIndexedSubscript:v14];
    int v20 = [v19 unsignedIntValue];

    if (v20 == 1)
    {
      uint64_t v21 = [(ATXComplicationSuggestionGenerator *)self _rectangularComplicationFromComplications:v32];
      [v21 setSource:1];
      if (v21)
      {
        if (([v30 containsObject:v21] & 1) != 0
          || ![(ATXComplicationSuggestionGenerator *)self _shouldAddComplication:v21 andFilterFromAppsDisabledByAppProtection:v29])
        {
          goto LABEL_20;
        }
        [v28 addObject:v21];
        [v30 addObject:v21];
        v16 -= 2;
LABEL_19:
        ++v14;
LABEL_20:
        [v32 removeObject:v21];

        goto LABEL_36;
      }
      if (CHSWidgetFamilyMaskContainsFamily() && (CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
      {
        uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:v18 widgetFamily:11 intent:0 source:2];
        int v25 = (void *)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:v18 widgetFamily:10 intent:0 source:2];
        if (([v30 containsObject:v24] & 1) == 0
          && ([v30 containsObject:v25] & 1) == 0
          && [(ATXComplicationSuggestionGenerator *)self _shouldAddComplication:v24 andFilterFromAppsDisabledByAppProtection:v29])
        {
          [v28 addObject:v24];
          [v30 addObject:v24];
          v16 -= 2;
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v22 = [v13 objectAtIndexedSubscript:v14];
      int v23 = [v22 unsignedIntValue];

      if (v23) {
        goto LABEL_36;
      }
      uint64_t v21 = [(ATXComplicationSuggestionGenerator *)self _circularComplicationFromComplications:v32];
      [v21 setSource:1];
      if (v21)
      {
        if (([v30 containsObject:v21] & 1) != 0
          || ![(ATXComplicationSuggestionGenerator *)self _shouldAddComplication:v21 andFilterFromAppsDisabledByAppProtection:v29])
        {
          goto LABEL_20;
        }
        [v28 addObject:v21];
        [v30 addObject:v21];
        --v16;
        goto LABEL_19;
      }
      if (CHSWidgetFamilyMaskContainsFamily() && (CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
      {
        uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:v18 widgetFamily:10 intent:0 source:2];
        int v25 = (void *)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:v18 widgetFamily:11 intent:0 source:2];
        if (([v30 containsObject:v24] & 1) == 0
          && ([v30 containsObject:v25] & 1) == 0
          && [(ATXComplicationSuggestionGenerator *)self _shouldAddComplication:v24 andFilterFromAppsDisabledByAppProtection:v29])
        {
          [v28 addObject:v24];
          [v30 addObject:v24];
          --v16;
LABEL_33:
          ++v14;
        }
LABEL_34:
      }
    }
    ++v15;
LABEL_36:
  }
  while (v15 < [v9 count]);
  id v10 = v30;
  uint64_t v11 = v28;
  if (!v16)
  {
LABEL_42:
    id v12 = v11;
    goto LABEL_43;
  }
LABEL_38:
  uint64_t v26 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "Not enough complications available on device to fill layout", buf, 2u);
  }

  id v12 = 0;
LABEL_43:

  return v12;
}

- (id)_rectangularComplicationFromComplications:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "widgetFamily", (void)v9) == 11)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_circularComplicationFromComplications:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "widgetFamily", (void)v9) == 10)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_complicationsFromFallbackSet:(id)a3 complicationDescriptors:(id)a4 alreadyAddedDescriptors:(id)a5 andFilterFromAppsDisabledByAppProtection:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v63 = a6;
  if (!v9)
  {
    id v43 = 0;
    goto LABEL_64;
  }
  long long v12 = (void *)MEMORY[0x1E4F1CA48];
  id v13 = [v10 allObjects];
  uint64_t v14 = [v12 arrayWithArray:v13];

  uint64_t v51 = v14;
  [v14 shuffle];
  unint64_t v15 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v9;
  uint64_t v56 = [obj countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (!v56) {
    goto LABEL_55;
  }
  uint64_t v55 = *(void *)v74;
  uint64_t v54 = *MEMORY[0x1E4F4AD68];
  uint64_t v49 = *MEMORY[0x1E4F4AD70];
  uint64_t v48 = *MEMORY[0x1E4F4AD78];
  id v52 = v10;
  id v53 = v9;
  long long v60 = v15;
  long long v61 = v11;
LABEL_4:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v74 != v55) {
      objc_enumerationMutation(obj);
    }
    uint64_t v17 = [*(id *)(*((void *)&v73 + 1) + 8 * v16) componentsSeparatedByString:@":"];
    if ([v17 count] != 3)
    {
      uint64_t v18 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = [v17 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v80 = v44;
        _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "Complication set is invalid. Components count: %lu", buf, 0xCu);
      }
      goto LABEL_62;
    }
    uint64_t v18 = [v17 objectAtIndexedSubscript:0];
    long long v64 = [v17 objectAtIndexedSubscript:1];
    if ([MEMORY[0x1E4F93B08] isiPad]
      && [v18 isEqualToString:@"com.apple.Fitness.FitnessWidget"])
    {

      long long v64 = @"MentalHealthLauncherComplication";
      uint64_t v18 = @"com.apple.Health.HealthMentalHealthWidgetExtension";
    }
    uint64_t v19 = [v17 objectAtIndexedSubscript:2];
    char v20 = [v19 isEqualToString:v54];

    uint64_t v57 = v16;
    long long v58 = v17;
    if ((v20 & 1) == 0) {
      break;
    }
    uint64_t v21 = 10;
LABEL_17:
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v26 = v10;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      char v59 = 0;
      uint64_t v29 = *(void *)v70;
      while (1)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v70 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          [v31 disfavoredFamiliesForLocation:1];
          id v32 = [v31 extensionBundleIdentifier];
          if ([v32 isEqualToString:v18])
          {
            long long v33 = [v31 kind];
            if ([v33 isEqualToString:v64]
              && ([v31 supportedFamilies], (CHSWidgetFamilyMaskContainsFamily() & 1) != 0))
            {
              char v34 = CHSWidgetFamilyMaskContainsFamily();

              if (v34) {
                continue;
              }
              if ([v61 containsObject:v31]) {
                goto LABEL_33;
              }
              id v32 = (void *)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:v31 widgetFamily:v21 intent:0 source:3];
              if ([(ATXComplicationSuggestionGenerator *)self _shouldAddComplication:v32 andFilterFromAppsDisabledByAppProtection:v63])
              {
                [v60 addObject:v32];
                [v61 addObject:v31];
                char v59 = 1;
              }
            }
            else
            {
            }
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v69 objects:v78 count:16];
        if (!v28)
        {
LABEL_33:

          id v11 = v61;
          if (v59) {
            goto LABEL_53;
          }
          goto LABEL_36;
        }
      }
    }

LABEL_36:
    long long v35 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v35, OS_LOG_TYPE_DEFAULT, "Fallback complication not found while searching descriptors. Filling in a random one.", buf, 2u);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v36 = v51;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v65 objects:v77 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v66;
      while (2)
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v66 != v39) {
            objc_enumerationMutation(v36);
          }
          long long v41 = *(void **)(*((void *)&v65 + 1) + 8 * j);
          if (([v11 containsObject:v41] & 1) == 0)
          {
            [v41 disfavoredFamiliesForLocation:1];
            [v41 supportedFamilies];
            if (CHSWidgetFamilyMaskContainsFamily())
            {
              if ((CHSWidgetFamilyMaskContainsFamily() & 1) == 0)
              {
                long long v42 = (void *)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:v41 widgetFamily:v21 intent:0 source:3];
                if ([(ATXComplicationSuggestionGenerator *)self _shouldAddComplication:v42 andFilterFromAppsDisabledByAppProtection:v63])
                {
                  [v60 addObject:v42];
                  [v11 addObject:v41];

                  goto LABEL_52;
                }
              }
            }
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v65 objects:v77 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }
LABEL_52:

LABEL_53:
    uint64_t v16 = v57 + 1;
    id v10 = v52;
    id v9 = v53;
    unint64_t v15 = v60;
    if (v57 + 1 == v56)
    {
      uint64_t v56 = [obj countByEnumeratingWithState:&v73 objects:v81 count:16];
      if (!v56)
      {
LABEL_55:

        id v43 = v15;
        goto LABEL_63;
      }
      goto LABEL_4;
    }
  }
  uint64_t v22 = [v17 objectAtIndexedSubscript:2];
  char v23 = [v22 isEqualToString:v49];

  if (v23)
  {
    uint64_t v21 = 11;
    goto LABEL_17;
  }
  uint64_t v24 = [v17 objectAtIndexedSubscript:2];
  char v25 = [v24 isEqualToString:v48];

  if (v25)
  {
    uint64_t v21 = 1;
    goto LABEL_17;
  }
  long long v45 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    long long v46 = [v17 objectAtIndexedSubscript:2];
    *(_DWORD *)buf = 138412290;
    uint64_t v80 = (uint64_t)v46;
    _os_log_impl(&dword_1D0FA3000, v45, OS_LOG_TYPE_DEFAULT, "Unknown complication family: %@", buf, 0xCu);
  }
LABEL_62:

  id v43 = 0;
LABEL_63:

LABEL_64:
  return v43;
}

- (BOOL)_layoutIsValidGivenComplications:(id)a3 allowedComplicationPersonalities:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    uint64_t v11 = 4;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F4B440]);
        unint64_t v15 = [v13 extensionBundleIdentifier];
        uint64_t v16 = [v13 kind];
        uint64_t v17 = (void *)[v14 initWithExtensionBundleId:v15 kind:v16];

        if (![v6 containsObject:v17]
          || [(ATXComplicationSuggestionGenerator *)self _complicationIsAlreadyAdded:v13 alreadyAddedComplications:v7])
        {
LABEL_15:

          BOOL v19 = 0;
          goto LABEL_17;
        }
        if ([v13 widgetFamily] == 10)
        {
          uint64_t v18 = -1;
        }
        else
        {
          if ([v13 widgetFamily] != 11) {
            goto LABEL_15;
          }
          uint64_t v18 = -2;
        }
        v11 += v18;
        [v7 addObject:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      BOOL v19 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v19 = 1;
    uint64_t v11 = 4;
  }
LABEL_17:

  if (v11) {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_complicationIsAlreadyAdded:(id)a3 alreadyAddedComplications:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v5, "isEqual:", v10, (void)v17))
        {
          uint64_t v11 = [v5 intent];
          if (v11)
          {
          }
          else
          {
            long long v12 = [v10 intent];

            if (!v12) {
              goto LABEL_14;
            }
          }
          id v13 = [v5 intent];
          id v14 = [v10 intent];
          char v15 = objc_msgSend(v13, "atx_isEqualToIntent:", v14);

          if (v15)
          {
LABEL_14:
            LOBYTE(v7) = 1;
            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v7;
}

- (BOOL)_shouldAddComplication:(id)a3 andFilterFromAppsDisabledByAppProtection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 containerBundleIdentifier];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [v5 containerBundleIdentifier],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v6 containsObject:v9],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [v5 containerBundleIdentifier];
      int v15 = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      long long v18 = v12;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXComplicationSuggestionGenerator: Complication: %@ is not eligible for suggestion. Reason: %@ is locked or hidden by user preference.", (uint8_t *)&v15, 0x16u);
    }
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterConfigurationCache, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_complicationScorer, 0);
  objc_storeStrong((id *)&self->_complicationSuggestionCache, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
}

- (void)_recentLandscapeComplicationsWithPresetDictionary:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  id v4 = NSStringFromWidgetFamily();
  *id v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_6_0(&dword_1D0FA3000, v5, v6, "Unexpected complication type, %@");
}

- (void)modularSetsWithDesiredLayouts:(os_log_t)log unusedRecentComplications:alreadyAddedComplications:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Only up to 3 sets are supported. Returning 3.", v1, 2u);
}

- (void)scoredComplicationsDescription
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not load accessory widget descriptors for scored complications description: %@", (uint8_t *)&v2, 0xCu);
}

@end
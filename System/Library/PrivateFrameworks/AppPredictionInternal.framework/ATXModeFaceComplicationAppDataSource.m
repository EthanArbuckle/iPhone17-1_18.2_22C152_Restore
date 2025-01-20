@interface ATXModeFaceComplicationAppDataSource
- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4;
- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXModeFaceComplicationAppDataSource

- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v28 = objc_alloc_init(ATXSuggestedPagesAppAggregator);
  uint64_t v6 = [(ATXSuggestedPagesAppAggregator *)v28 provideAppsForSuggestedPageType:ATXSuggestedPageTypeFromSuggestedFaceType(a3) candidateApps:0 environment:v5];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v27 = v9;
  v11 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_126);
  v12 = (void *)[v10 initWithArray:v11];

  v13 = [MEMORY[0x1E4F4B430] sharedInstance];
  v14 = [v13 complicationWidgetDescriptors];

  id v26 = objc_alloc_init(MEMORY[0x1E4F4B078]);
  v15 = [v26 homeScreenWidgetPersonalities];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __93__ATXModeFaceComplicationAppDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_2;
  v36[3] = &unk_1E68B2770;
  id v25 = v12;
  id v37 = v25;
  id v16 = v5;
  id v38 = v16;
  id v24 = v15;
  id v39 = v24;
  v17 = objc_msgSend(v14, "_pas_filteredSetWithTest:", v36);
  v18 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v17;
  uint64_t v19 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * i) supportedFamilies];
        id v30 = v16;
        id v31 = v18;
        CHSWidgetFamilyMaskEnumerateFamilies();
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v20);
  }

  return v18;
}

uint64_t __93__ATXModeFaceComplicationAppDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleId];
}

uint64_t __93__ATXModeFaceComplicationAppDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 extensionIdentity];
  id v5 = [v4 containerBundleIdentifier];

  if ([v5 length]
    && [a1[4] containsObject:v5]
    && ([a1[5] appLaunchCounts],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKeyedSubscript:v5],
        v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 uniqueDaysLaunched],
        v7,
        v6,
        v8 >= 0xA))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F4B440]);
    v12 = [v3 extensionBundleIdentifier];
    v13 = [v3 kind];
    v14 = (void *)[v11 initWithExtensionBundleId:v12 kind:v13];

    uint64_t v9 = [a1[6] containsObject:v14];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __93__ATXModeFaceComplicationAppDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (CHSWidgetFamilyIsAccessory())
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:*(void *)(a1 + 32) widgetFamily:a2 intent:0 source:4];
    [v6 setPredictionSource:@"App"];
    v4 = [v6 containerBundleIdentifier];
    +[ATXModeFaceComplicationUtilities complicationScoreForAppLaunch:v4 environment:*(void *)(a1 + 40)];
    [v6 setScore:v5 * 0.2];

    [*(id *)(a1 + 48) addObject:v6];
  }
}

- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end
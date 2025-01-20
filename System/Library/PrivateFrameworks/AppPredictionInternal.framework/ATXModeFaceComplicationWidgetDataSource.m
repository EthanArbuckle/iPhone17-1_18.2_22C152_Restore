@interface ATXModeFaceComplicationWidgetDataSource
- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4;
- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXModeFaceComplicationWidgetDataSource

- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v29 = objc_alloc_init(ATXSuggestedPagesWidgetAggregator);
  v30 = v5;
  uint64_t v6 = [(ATXSuggestedPagesWidgetAggregator *)v29 provideWidgetsForPageType:ATXSuggestedPageTypeFromSuggestedFaceType(a3) environment:v5];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v28 = v9;
  v11 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_233);
  v12 = (void *)[v10 initWithArray:v11];

  v13 = [MEMORY[0x1E4F4B430] sharedInstance];
  v14 = [v13 complicationWidgetDescriptors];

  id v26 = objc_alloc_init(MEMORY[0x1E4F4B078]);
  v15 = [v26 homeScreenWidgetPersonalities];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __96__ATXModeFaceComplicationWidgetDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_2;
  v37[3] = &unk_1E68B5D98;
  id v25 = v12;
  id v38 = v25;
  id v24 = v15;
  id v39 = v24;
  v27 = v14;
  v16 = objc_msgSend(v14, "_pas_filteredSetWithTest:", v37);
  v17 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * i) supportedFamilies];
        id v31 = v30;
        id v32 = v17;
        CHSWidgetFamilyMaskEnumerateFamilies();
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v20);
  }

  return v17;
}

uint64_t __96__ATXModeFaceComplicationWidgetDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appBundleId];
}

uint64_t __96__ATXModeFaceComplicationWidgetDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 extensionIdentity];
  id v5 = [v4 containerBundleIdentifier];

  if ([v5 length] && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4B440]);
    v7 = [v3 extensionBundleIdentifier];
    v8 = [v3 kind];
    id v9 = (void *)[v6 initWithExtensionBundleId:v7 kind:v8];

    uint64_t v10 = [*(id *)(a1 + 40) containsObject:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __96__ATXModeFaceComplicationWidgetDataSource_provideComplicationsForSuggestedFaceType_environment___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (CHSWidgetFamilyIsAccessory())
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithWidgetDescriptor:*(void *)(a1 + 32) widgetFamily:a2 intent:0 source:4];
    [v6 setPredictionSource:@"Widget"];
    v4 = [v6 containerBundleIdentifier];
    +[ATXModeFaceComplicationUtilities complicationScoreForAppLaunch:v4 environment:*(void *)(a1 + 40)];
    [v6 setScore:v5 * 0.3];

    [*(id *)(a1 + 48) addObject:v6];
  }
}

- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end
@interface ATXDemoStackAndWidgetProvider
+ (BOOL)_shouldShowStackInGallery;
+ (BOOL)isDemoModeEnabled;
+ (id)_widgetArrayForPrefixKey:(id)a3 countKey:(id)a4 defaults:(id)a5 descriptors:(id)a6;
+ (id)_widgetFromDictionary:(id)a3 descriptors:(id)a4;
+ (id)demoStackAndWidgets;
+ (void)startYourEngines;
@end

@implementation ATXDemoStackAndWidgetProvider

+ (BOOL)isDemoModeEnabled
{
  int v2 = [MEMORY[0x1E4F93B08] isInternalBuild];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
    char v4 = [v3 BOOLForKey:@"ATXWidgetsDemoModeEnabled"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (void)startYourEngines
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F58E00]);
  uint64_t v3 = sDescriptorProvider;
  sDescriptorProvider = (uint64_t)v2;

  MEMORY[0x1F41817F8](v2, v3);
}

+ (id)demoStackAndWidgets
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    id v30 = a1;
    id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
    char v4 = [(id)sDescriptorProvider descriptors];
    v31 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v5 = [(id)sDescriptorProvider descriptors];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v11 = NSString;
          v12 = [v10 extensionBundleIdentifier];
          v13 = [v10 kind];
          v14 = [v11 stringWithFormat:@"%@-%@", v12, v13];

          [v31 setObject:v10 forKeyedSubscript:v14];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v7);
    }

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
    v41[0] = @"ATXWidgetsDemoNumberOfWidgetsInStack";
    v41[1] = @"ATXWidgetsDemoStackWidget1";
    v42[0] = &unk_1EFDF4128;
    v42[1] = &unk_1EFDF4FA0;
    v41[2] = @"ATXWidgetsDemoStackWidget2";
    v41[3] = @"ATXWidgetsDemoStackWidget3";
    v42[2] = &unk_1EFDF4FC8;
    v42[3] = &unk_1EFDF4FF0;
    v41[4] = @"ATXWidgetsDemoStackWidget4";
    v41[5] = @"ATXWidgetsDemoNumberOfWidgetsInGallery";
    v42[4] = &unk_1EFDF5018;
    v42[5] = &unk_1EFDF4128;
    v41[6] = @"ATXWidgetsDemoGalleryWidget1";
    v41[7] = @"ATXWidgetsDemoGalleryWidget2";
    v42[6] = &unk_1EFDF4FC8;
    v42[7] = &unk_1EFDF5018;
    v41[8] = @"ATXWidgetsDemoGalleryWidget3";
    v41[9] = @"ATXWidgetsDemoGalleryWidget4";
    v42[8] = &unk_1EFDF4FF0;
    v42[9] = &unk_1EFDF4FA0;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:10];
    [v15 registerDefaults:v16];

    v17 = [v30 _widgetArrayForPrefixKey:@"ATXWidgetsDemoStackWidget" countKey:@"ATXWidgetsDemoNumberOfWidgetsInStack" defaults:v15 descriptors:v31];
    v18 = [v30 _widgetArrayForPrefixKey:@"ATXWidgetsDemoGalleryWidget" countKey:@"ATXWidgetsDemoNumberOfWidgetsInGallery" defaults:v15 descriptors:v31];
    v19 = objc_opt_new();
    if (+[ATXDemoStackAndWidgetProvider _shouldShowStackInGallery])
    {
      v20 = objc_opt_new();
      v21 = (void *)[v17 copy];
      [v20 setSmallDefaultStack:v21];

      v22 = (void *)[v17 copy];
      [v20 setMediumDefaultStack:v22];

      [v20 setSuggestedSize:1];
      [v19 addObject:v20];
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v18;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          [v19 addObject:*(void *)(*((void *)&v32 + 1) + 8 * j)];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v25);
    }

    v28 = (void *)[v19 copy];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)_widgetArrayForPrefixKey:(id)a3 countKey:(id)a4 defaults:(id)a5 descriptors:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 integerForKey:a4];
  id v18 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
  if (v12 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      v14 = [NSString stringWithFormat:@"%@%ld", v9, ++v13];
      v15 = [v10 dictionaryForKey:v14];
      if (v15)
      {
        v16 = [a1 _widgetFromDictionary:v15 descriptors:v11];
        if (v16) {
          [v18 addObject:v16];
        }
      }
    }
    while (v12 != v13);
  }

  return v18;
}

+ (id)_widgetFromDictionary:(id)a3 descriptors:(id)a4
{
  id v5 = a3;
  uint64_t v6 = NSString;
  id v7 = a4;
  uint64_t v8 = [v5 objectForKey:@"extensionBundleId"];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1EFD9B408;
  }
  uint64_t v11 = [v5 objectForKey:@"kind"];
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_1EFD9B408;
  }
  v14 = [v6 stringWithFormat:@"%@-%@", v10, v13];

  v15 = [v7 objectForKeyedSubscript:v14];

  if (v15)
  {
    v16 = objc_opt_new();
    [v16 setAvocadoDescriptor:v15];
    uint64_t v17 = [v5 objectForKey:@"appBundleId"];
    id v18 = (void *)v17;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = &stru_1EFD9B408;
    }
    [v16 setAppBundleId:v19];

    uint64_t v20 = 1;
    [v16 setRankType:1];
    uint64_t v21 = [v5 objectForKey:@"size"];
    v22 = (void *)v21;
    if (v21) {
      id v23 = (__CFString *)v21;
    }
    else {
      id v23 = &stru_1EFD9B408;
    }
    uint64_t v24 = v23;

    if (([(__CFString *)v24 isEqualToString:@"medium"] & 1) == 0)
    {
      if ([(__CFString *)v24 isEqualToString:@"large"])
      {
        uint64_t v20 = 2;
      }
      else if ([(__CFString *)v24 isEqualToString:@"extraLarge"])
      {
        uint64_t v20 = 4;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    [v16 setSuggestedSize:v20];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)_shouldShowStackInGallery
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
  char v3 = [v2 BOOLForKey:@"ATXWidgetsDemoShouldShowStackInGallery"];

  return v3;
}

@end
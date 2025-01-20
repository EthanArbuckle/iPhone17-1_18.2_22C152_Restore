@interface ATXDefaultHomeScreenItemProducerUtilities
+ (BOOL)_isSpecialAvocadoDescriptor:(id)a3;
+ (id)_defaultWidgetStackFromSmallStack:(id)a3 mediumStack:(id)a4 largeStack:(id)a5 extraLargeStack:(id)a6 suggestedSize:(unint64_t)a7 maxWidgetsPerStack:(unint64_t)a8 isiPad:(BOOL)a9;
+ (id)_specialAvocadoKindsConvertingFromAssetsString:(id)a3;
+ (id)defaultWidgetStackFromSmallStack:(id)a3 mediumStack:(id)a4 largeStack:(id)a5 extraLargeStack:(id)a6 suggestedSize:(unint64_t)a7 maxWidgetsPerStack:(unint64_t)a8 isiPad:(BOOL)a9;
+ (id)personalitiesFromAssetsWithKey:(id)a3;
+ (id)specialWidgetDescriptorForPersonality:(id)a3 size:(unint64_t)a4;
+ (id)splitDescriptorsIntoFirstPartyAndThirdParty:(id)a3;
+ (id)stackFromDefaultStackPersonalities:(id)a3 suggestedSize:(unint64_t)a4 maxWidgetsPerStack:(unint64_t)a5 personalityToDescriptorDictionary:(id)a6 isiPad:(BOOL)a7;
+ (id)widget:(id)a3 filteredForSize:(unint64_t)a4;
+ (id)widgetDescriptorFromChronoDescriptor:(id)a3 appBundleId:(id)a4 rankType:(int64_t)a5;
+ (id)widgetFromPersonality:(id)a3 size:(unint64_t)a4 personalityToDescriptorDictionary:(id)a5;
+ (id)widgets:(id)a3 filteredForSize:(unint64_t)a4;
+ (id)widgetsFromPersonalities:(id)a3 size:(unint64_t)a4 personalityToDescriptorDictionary:(id)a5;
+ (unint64_t)_supportedSizeClassesForSpecialAvocadoKind:(id)a3;
+ (unint64_t)_widgetFamilyMaskForStackLayoutSize:(unint64_t)a3;
@end

@implementation ATXDefaultHomeScreenItemProducerUtilities

+ (id)stackFromDefaultStackPersonalities:(id)a3 suggestedSize:(unint64_t)a4 maxWidgetsPerStack:(unint64_t)a5 personalityToDescriptorDictionary:(id)a6 isiPad:(BOOL)a7
{
  id v12 = a3;
  id v13 = a6;
  v14 = [a1 widgetsFromPersonalities:v12 size:0 personalityToDescriptorDictionary:v13];
  v15 = [a1 widgetsFromPersonalities:v12 size:1 personalityToDescriptorDictionary:v13];
  v16 = [a1 widgetsFromPersonalities:v12 size:2 personalityToDescriptorDictionary:v13];
  if (a7)
  {
    v17 = [a1 widgetsFromPersonalities:v12 size:4 personalityToDescriptorDictionary:v13];
    LOBYTE(v20) = 1;
    v18 = [a1 _defaultWidgetStackFromSmallStack:v14 mediumStack:v15 largeStack:v16 extraLargeStack:v17 suggestedSize:a4 maxWidgetsPerStack:a5 isiPad:v20];
  }
  else
  {
    LOBYTE(v20) = 0;
    v18 = [a1 _defaultWidgetStackFromSmallStack:v14 mediumStack:v15 largeStack:v16 extraLargeStack:0 suggestedSize:a4 maxWidgetsPerStack:a5 isiPad:v20];
  }

  return v18;
}

+ (id)widgetFromPersonality:(id)a3 size:(unint64_t)a4 personalityToDescriptorDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = +[ATXDefaultHomeScreenItemProducerUtilities specialWidgetDescriptorForPersonality:v7 size:a4];
  if (v9
    || ([v8 objectForKeyedSubscript:v7],
        v10 = objc_claimAutoreleasedReturnValue(),
        v9 = (void *)[v10 copy],
        v10,
        v9))
  {
    v11 = [(id)objc_opt_class() widget:v9 filteredForSize:a4];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)widgetsFromPersonalities:(id)a3 size:(unint64_t)a4 personalityToDescriptorDictionary:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__ATXDefaultHomeScreenItemProducerUtilities_widgetsFromPersonalities_size_personalityToDescriptorDictionary___block_invoke;
  v12[3] = &unk_1E5D0AAF0;
  id v14 = a1;
  unint64_t v15 = a4;
  id v13 = v8;
  id v9 = v8;
  v10 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v12);

  return v10;
}

uint64_t __109__ATXDefaultHomeScreenItemProducerUtilities_widgetsFromPersonalities_size_personalityToDescriptorDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) widgetFromPersonality:a2 size:*(void *)(a1 + 48) personalityToDescriptorDictionary:*(void *)(a1 + 32)];
}

+ (id)personalitiesFromAssetsWithKey:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1AD0D3C30]();
  v5 = objc_opt_new();
  v6 = +[ATXAssets2 dictionaryForClassName:@"ATXDefaultHomeScreenItemUpdater"];
  id v7 = [v6 objectForKeyedSubscript:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v3;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v22 = v7;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [a1 _specialAvocadoKindsConvertingFromAssetsString:v12];
            id v14 = v13;
            if (v13)
            {
              long long v29 = 0u;
              long long v30 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v28;
                do
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v28 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    v19 = [[ATXWidgetPersonality alloc] initWithExtensionBundleId:&stru_1EFD9B408 kind:*(void *)(*((void *)&v27 + 1) + 8 * j)];
                    [v5 addObject:v19];
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
                }
                while (v16);
              }
            }
            else
            {
              uint64_t v20 = [[ATXWidgetPersonality alloc] initWithStringRepresentation:v12];
              if (v20) {
                [v5 addObject:v20];
              }
            }
            uint64_t v10 = v24;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    id v3 = v23;
    id v7 = v22;
  }

  return v5;
}

+ (id)widget:(id)a3 filteredForSize:(unint64_t)a4
{
  id v5 = a3;
  v6 = [v5 avocadoDescriptor];
  id v7 = v6;
  if (v6
    && (uint64_t v8 = [v6 supportedFamilies],
        ([(id)objc_opt_class() _widgetFamilyMaskForStackLayoutSize:a4] & v8) != 0))
  {
    uint64_t v9 = (void *)[v5 copy];
    [v9 setSuggestedSize:a4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)widgets:(id)a3 filteredForSize:(unint64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ATXDefaultHomeScreenItemProducerUtilities_widgets_filteredForSize___block_invoke;
  v6[3] = &__block_descriptor_48_e39__16__0__ATXHomeScreenWidgetDescriptor_8l;
  v6[4] = a1;
  v6[5] = a4;
  v4 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v6);

  return v4;
}

uint64_t __69__ATXDefaultHomeScreenItemProducerUtilities_widgets_filteredForSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) widget:a2 filteredForSize:*(void *)(a1 + 40)];
}

+ (unint64_t)_widgetFamilyMaskForStackLayoutSize:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 2;
  }
  else {
    return qword_1A7A9DB98[a3 - 1];
  }
}

+ (id)_specialAvocadoKindsConvertingFromAssetsString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"suggestions"])
  {
    v4 = &unk_1EFDF4F20;
  }
  else if ([v3 isEqualToString:@"shortcuts"])
  {
    v4 = &unk_1EFDF4F38;
  }
  else if ([v3 isEqualToString:@"files"])
  {
    v4 = &unk_1EFDF4F50;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)specialWidgetDescriptorForPersonality:(id)a3 size:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = [a3 kind];
  uint64_t v7 = [a1 _supportedSizeClassesForSpecialAvocadoKind:v6];
  if (([a1 _widgetFamilyMaskForStackLayoutSize:a4] & v7) == 0)
  {
    id v13 = 0;
    goto LABEL_18;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F58DF8]);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:&stru_1EFD9B408 containerBundleIdentifier:0 deviceIdentifier:0];
  uint64_t v10 = (void *)[v8 initWithExtensionIdentity:v9 kind:v6 supportedFamilies:v7 intentType:0];

  if (!v10)
  {
    uint64_t v12 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ATXDefaultHomeScreenItemProducerUtilities specialWidgetDescriptorForPersonality:size:]((uint64_t)v6, v12);
    }
    goto LABEL_12;
  }
  if (([v6 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsSingle"] & 1) != 0
    || ([v6 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsFolder"] & 1) != 0)
  {
    v11 = @"com.apple.shortcuts";
  }
  else
  {
    if (![v6 isEqualToString:@"SBHSpecialAvocadoDescriptorKindFiles"])
    {
      v11 = 0;
      goto LABEL_16;
    }
    v11 = @"com.apple.DocumentsApp";
  }
  if (+[ATXApplicationRecord isInstalledForBundle:v11])
  {
LABEL_16:
    id v13 = [a1 widgetDescriptorFromChronoDescriptor:v10 appBundleId:v11 rankType:1];
    [v13 setSuggestedSize:a4];
    goto LABEL_17;
  }
  uint64_t v12 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: could not add %@ widget to default stack because app is not installed on device", (uint8_t *)&v15, 0xCu);
  }
LABEL_12:

  id v13 = 0;
LABEL_17:

LABEL_18:

  return v13;
}

+ (unint64_t)_supportedSizeClassesForSpecialAvocadoKind:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindSiri"])
  {
    unint64_t v4 = 14;
  }
  else if (([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindFiles"] & 1) != 0 {
         || ([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsFolder"] & 1) != 0)
  }
  {
    unint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsSingle"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)_defaultWidgetStackFromSmallStack:(id)a3 mediumStack:(id)a4 largeStack:(id)a5 extraLargeStack:(id)a6 suggestedSize:(unint64_t)a7 maxWidgetsPerStack:(unint64_t)a8 isiPad:(BOOL)a9
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ((unint64_t)[v14 count] < 2
    || (unint64_t)[v15 count] < 2
    || (unint64_t)[v16 count] <= 1)
  {
    v18 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v34 = 136315906;
      v35 = "+[ATXDefaultHomeScreenItemProducerUtilities _defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLa"
            "rgeStack:suggestedSize:maxWidgetsPerStack:isiPad:]";
      __int16 v36 = 2048;
      uint64_t v37 = [v14 count];
      __int16 v38 = 2048;
      uint64_t v39 = [v15 count];
      __int16 v40 = 2048;
      uint64_t v41 = [v16 count];
      _os_log_error_impl(&dword_1A790D000, v18, OS_LOG_TYPE_ERROR, "%s: default stack does not have enough widgets (small: %lu, med: %lu, large: %lu)", (uint8_t *)&v34, 0x2Au);
    }
  }
  if (a9 && (unint64_t)[v17 count] <= 1)
  {
    v19 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[ATXDefaultHomeScreenItemProducerUtilities _defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](v17);
    }
  }
  unint64_t v20 = [v14 count];
  if (v20 >= a8) {
    unint64_t v21 = a8;
  }
  else {
    unint64_t v21 = v20;
  }
  v22 = objc_msgSend(v14, "subarrayWithRange:", 0, v21);

  unint64_t v23 = [v15 count];
  if (v23 >= a8) {
    unint64_t v24 = a8;
  }
  else {
    unint64_t v24 = v23;
  }
  v25 = objc_msgSend(v15, "subarrayWithRange:", 0, v24);

  unint64_t v26 = [v16 count];
  if (v26 >= a8) {
    unint64_t v27 = a8;
  }
  else {
    unint64_t v27 = v26;
  }
  long long v28 = objc_msgSend(v16, "subarrayWithRange:", 0, v27);

  unint64_t v29 = [v17 count];
  if (v29 >= a8) {
    unint64_t v30 = a8;
  }
  else {
    unint64_t v30 = v29;
  }
  long long v31 = objc_msgSend(v17, "subarrayWithRange:", 0, v30);

  long long v32 = objc_opt_new();
  [v32 setSmallDefaultStack:v22];
  [v32 setMediumDefaultStack:v25];
  [v32 setLargeDefaultStack:v28];
  [v32 setExtraLargeDefaultStack:v31];
  [v32 setSuggestedSize:a7];

  return v32;
}

+ (id)widgetDescriptorFromChronoDescriptor:(id)a3 appBundleId:(id)a4 rankType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  [v9 setAvocadoDescriptor:v8];

  [v9 setAppBundleId:v7];
  [v9 setRankType:a5];

  return v9;
}

+ (id)defaultWidgetStackFromSmallStack:(id)a3 mediumStack:(id)a4 largeStack:(id)a5 extraLargeStack:(id)a6 suggestedSize:(unint64_t)a7 maxWidgetsPerStack:(unint64_t)a8 isiPad:(BOOL)a9
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ((unint64_t)[v14 count] < 2
    || (unint64_t)[v15 count] < 2
    || (unint64_t)[v16 count] <= 1)
  {
    v18 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v34 = 136315906;
      v35 = "+[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLar"
            "geStack:suggestedSize:maxWidgetsPerStack:isiPad:]";
      __int16 v36 = 2048;
      uint64_t v37 = [v14 count];
      __int16 v38 = 2048;
      uint64_t v39 = [v15 count];
      __int16 v40 = 2048;
      uint64_t v41 = [v16 count];
      _os_log_error_impl(&dword_1A790D000, v18, OS_LOG_TYPE_ERROR, "%s: default stack does not have enough widgets (small: %lu, med: %lu, large: %lu)", (uint8_t *)&v34, 0x2Au);
    }
  }
  if (a9 && (unint64_t)[v17 count] <= 1)
  {
    v19 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](v17);
    }
  }
  unint64_t v20 = [v14 count];
  if (v20 >= a8) {
    unint64_t v21 = a8;
  }
  else {
    unint64_t v21 = v20;
  }
  v22 = objc_msgSend(v14, "subarrayWithRange:", 0, v21);

  unint64_t v23 = [v15 count];
  if (v23 >= a8) {
    unint64_t v24 = a8;
  }
  else {
    unint64_t v24 = v23;
  }
  v25 = objc_msgSend(v15, "subarrayWithRange:", 0, v24);

  unint64_t v26 = [v16 count];
  if (v26 >= a8) {
    unint64_t v27 = a8;
  }
  else {
    unint64_t v27 = v26;
  }
  long long v28 = objc_msgSend(v16, "subarrayWithRange:", 0, v27);

  unint64_t v29 = [v17 count];
  if (v29 >= a8) {
    unint64_t v30 = a8;
  }
  else {
    unint64_t v30 = v29;
  }
  long long v31 = objc_msgSend(v17, "subarrayWithRange:", 0, v30);

  long long v32 = objc_opt_new();
  [v32 setSmallDefaultStack:v22];
  [v32 setMediumDefaultStack:v25];
  [v32 setLargeDefaultStack:v28];
  [v32 setExtraLargeDefaultStack:v31];
  [v32 setSuggestedSize:a7];

  return v32;
}

+ (id)splitDescriptorsIntoFirstPartyAndThirdParty:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(a1, "_isSpecialAvocadoDescriptor:", v12, (void)v19))
        {
          [v5 addObject:v12];
        }
        else
        {
          id v13 = [v12 avocadoDescriptor];
          id v14 = [v13 extensionBundleIdentifier];

          if (!v14 || (char v15 = [v14 hasPrefix:@"com.apple."], v16 = v5, (v15 & 1) == 0)) {
            id v16 = v6;
          }
          [v16 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v5 second:v6];

  return v17;
}

+ (BOOL)_isSpecialAvocadoDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 avocadoDescriptor];
  id v5 = [v4 extensionBundleIdentifier];
  int v6 = [v5 isEqualToString:&stru_1EFD9B408];

  if (v6)
  {
    id v7 = [v3 avocadoDescriptor];
    uint64_t v8 = [v7 kind];

    if (([v8 isEqualToString:@"SBHSpecialAvocadoDescriptorKindSiri"] & 1) != 0
      || ([v8 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsSingle"] & 1) != 0
      || ([v8 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsFolder"] & 1) != 0
      || ([v8 isEqualToString:@"SBHSpecialAvocadoDescriptorKindFiles"] & 1) != 0)
    {
      char v9 = 1;
    }
    else
    {
      char v9 = [v8 isEqualToString:@"SBHSpecialAvocadoDescriptorKindAppPredictions"];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (void)specialWidgetDescriptorForPersonality:(uint64_t)a1 size:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemProducer: could not add the %@ widget to default stack due to issue initializing the special CHSWidgetDescriptor", (uint8_t *)&v2, 0xCu);
}

+ (void)_defaultWidgetStackFromSmallStack:(void *)a1 mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v1, v2, "%s: extra large default stack does not have enough widgets: %lu", v3, v4, v5, v6, 2u);
}

+ (void)defaultWidgetStackFromSmallStack:(void *)a1 mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v1, v2, "%s: extra large default stack does not have enough widgets: %lu", v3, v4, v5, v6, 2u);
}

@end
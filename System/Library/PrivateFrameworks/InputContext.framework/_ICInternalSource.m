@interface _ICInternalSource
- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3;
- (_ICInternalSource)init;
- (id)localizedStringForKey:(id)a3 withLocale:(id)a4;
- (id)name;
- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7;
- (void)searchForMeCardEmailAddressesWithTimeout:(unint64_t)a3 handler:(id)a4;
- (void)searchForMeCardRegionsWithTimeout:(unint64_t)a3 handler:(id)a4;
@end

@implementation _ICInternalSource

- (_ICInternalSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ICInternalSource;
  v2 = [(_ICInternalSource *)&v6 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)@"_ICInternalSource";
  }
  return v3;
}

- (id)name
{
  return self->_name;
}

- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7
{
  v51[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void *, void *))a7;
  uint64_t v13 = mach_absolute_time();
  v14 = [v10 attributedString];
  v15 = [v14 valueForKey:*MEMORY[0x263F51238]];

  v16 = [v10 attributedString];
  v17 = [v16 valueForKey:*MEMORY[0x263F51220]];

  v18 = [v10 attributedString];
  v48 = [v18 valueForKey:*MEMORY[0x263F51200]];

  v19 = [MEMORY[0x263EFF980] array];
  v49 = [MEMORY[0x263EFF910] date];
  v47 = [v11 applicationBundleIdentifier];
  if ([v15 isEqualToString:*MEMORY[0x263F511E8]]
    && [v17 isEqualToString:*MEMORY[0x263F511B0]])
  {
    v20 = [v10 availableApps];
    int v21 = [v20 containsObject:@"com.apple.messages.currentLocation"];

    if (v21)
    {
      v46 = v17;
      v22 = [MEMORY[0x263EFF9A0] dictionary];
      [v22 setObject:@"com.apple.messages.currentLocation" forKey:@"bundleID"];
      v23 = NSString;
      v24 = [(_ICInternalSource *)self localizedStringForKey:@"SEND_CURRENT_LOCATION_BUTTON_CAPTION" withLocale:v11];
      v25 = [v23 stringWithValidatedFormat:v24, @"%@", 0, @"" validFormatSpecifiers error];

      LOWORD(v45) = 0;
      v26 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:]([_ICPredictedItem alloc], "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", @"currentLocation", 1, v25, 0, 0, v49, 1.0, v47, 0, 30, v45, @"com.apple.messages.currentLocation", v22, v10);
      [v19 addObject:v26];
      goto LABEL_12;
    }
  }
  else if ([v15 isEqualToString:@"money"])
  {
    v27 = [v10 availableApps];
    int v28 = [v27 containsObject:@"com.apple.messages.surf"];

    if (v28)
    {
      v22 = [MEMORY[0x263EFF9A0] dictionary];
      [v22 setObject:@"com.apple.messages.surf" forKey:@"bundleID"];
      v25 = [v48 objectForKey:@"Currency"];
      if (!v25)
      {
LABEL_13:

        goto LABEL_14;
      }
      [v22 setObject:v25 forKey:@"Currency"];
      v46 = v17;
      LOWORD(v45) = 0;
      v26 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:]([_ICPredictedItem alloc], "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", @"surf", 1, @"Pay", 0, 0, v49, 1.0, 0, 0, 30, v45, 0, v22, v10);
      [(_ICPredictedItem *)v26 setLayoutHint:1];
      [v19 addObject:v26];
LABEL_12:

      v17 = v46;
      goto LABEL_13;
    }
  }
  else
  {
    if (![v15 isEqualToString:@"photosharing"])
    {
LABEL_14:
      char v35 = 1;
      goto LABEL_16;
    }
    v29 = [v10 availableApps];
    int v30 = [v29 containsObject:@"com.apple.messages.photos"];

    if (v30)
    {
      v46 = v17;
      v31 = (void *)MEMORY[0x263EFF9A0];
      v32 = [v10 attributedString];
      v22 = [v31 dictionaryWithDictionary:v32];

      [v22 setObject:@"com.apple.messages.photos" forKey:@"bundleID"];
      v33 = NSString;
      v34 = [(_ICInternalSource *)self localizedStringForKey:@"CHOOSE_PHOTOS_CAPTION" withLocale:v11];
      v25 = [v33 stringWithValidatedFormat:v34, @"%@", 0, @"" validFormatSpecifiers error];

      LOWORD(v45) = 0;
      v26 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:]([_ICPredictedItem alloc], "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", @"choosePhotos", 1, v25, 0, 0, v49, 1.0, 0, 0, 30, v45, 0, v22, v10);
      [(_ICPredictedItem *)v26 setLayoutHint:0];
      [v19 addObject:v26];
      goto LABEL_12;
    }
  }
  char v35 = 0;
LABEL_16:
  if ([v19 count]) {
    char v36 = 1;
  }
  else {
    char v36 = v35;
  }
  if (v36)
  {
    v37 = 0;
  }
  else
  {
    v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F08320];
    v51[0] = @"NotSupByAp";
    v39 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
    v37 = [v38 errorWithDomain:@"com.apple.inputcontext.errors" code:5 userInfo:v39];
  }
  v12[2](v12, v19, v37);
  uint64_t v40 = mach_absolute_time();
  unint64_t v41 = _ICMachTimeToNanoseconds(v40 - v13);
  v42 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    -[_ICInternalSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:]();
  }

  if (!v41)
  {
    uint64_t v43 = mach_absolute_time();
    _ICMachTimeToNanoseconds(v43 - v13);
    v44 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      -[_ICInternalSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:]();
    }
  }
}

- (id)localizedStringForKey:(id)a3 withLocale:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 locale];
  if (localizedStringForKey_withLocale__onceToken != -1) {
    dispatch_once(&localizedStringForKey_withLocale__onceToken, &__block_literal_global_3);
  }
  v8 = (void *)localizedStringForKey_withLocale__localizationsCache;
  v9 = [v6 locale];
  id v10 = [v8 objectForKey:v9];

  if (!v10
    || ([v10 objectForKeyedSubscript:v5], (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (!v10)
    {
      id v26 = v6;
      id v27 = v5;
      v33[0] = v7;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
      v14 = (void *)MEMORY[0x263F086E0];
      v15 = [v12 localizations];
      v16 = [v14 preferredLocalizationsFromArray:v15 forPreferences:v13];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v29;
LABEL_8:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [v12 pathForResource:@"Predictions" ofType:@"strings" inDirectory:0 forLocalization:*(void *)(*((void *)&v28 + 1) + 8 * v21)];
          uint64_t v23 = [NSDictionary dictionaryWithContentsOfFile:v22];
          if (v23) {
            break;
          }

          if (v19 == ++v21)
          {
            uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v19) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }
        v24 = (void *)v23;
        [(id)localizedStringForKey_withLocale__localizationsCache setObject:v23 forKey:v7];
        id v5 = v27;
        id v11 = [v24 objectForKeyedSubscript:v27];

        if (!v11) {
          goto LABEL_17;
        }

        id v6 = v26;
        id v10 = 0;
        goto LABEL_19;
      }
LABEL_14:

      id v5 = v27;
LABEL_17:

      id v6 = v26;
      id v10 = 0;
    }
    id v11 = [v12 localizedStringForKey:v5 value:&stru_26E89F4A0 table:@"Predictions"];
LABEL_19:
  }
  return v11;
}

- (void)searchForMeCardRegionsWithTimeout:(unint64_t)a3 handler:(id)a4
{
}

- (void)searchForMeCardEmailAddressesWithTimeout:(unint64_t)a3 handler:(id)a4
{
}

- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3
{
  return a3 == 1;
}

- (void).cxx_destruct
{
}

- (void)predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_235496000, v0, OS_LOG_TYPE_DEBUG, "_ICScales: %@ took %f seconds", (uint8_t *)v1, 0x16u);
}

@end
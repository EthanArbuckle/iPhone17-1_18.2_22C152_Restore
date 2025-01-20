@interface ATXHomeScreenLogUploaderUtilities
+ (BOOL)_isDwellLongEnoughForPseudoTap:(id)a3 endingEventTime:(double)a4;
+ (BOOL)isFirstPartyApp:(id)a3;
+ (BOOL)isRotationSessionDueToProactive:(id)a3;
+ (BOOL)isRotationSessionDueToUserScroll:(id)a3;
+ (BOOL)isValidAppLaunch:(id)a3;
+ (id)_keyByConcatenatingAccumulatorKey:(id)a3 withString:(id)a4;
+ (id)abGroup;
+ (id)countsForRotationEngagementStatusHistory:(id)a3;
+ (id)keyByConcatenatingAccumulatorKey:(id)a3 withLocation:(unint64_t)a4;
+ (id)keyByConcatenatingAccumulatorKey:(id)a3 withSize:(unint64_t)a4;
+ (id)stackShownEventsForPseudoTapIfPossible:(id)a3 currentEvent:(id)a4;
+ (int)suggestionReasonForSuggestionLayout:(id)a3;
+ (void)add:(unint64_t)a3 toDictionary:(id)a4 forKey:(id)a5;
+ (void)add:(unint64_t)a3 toTwoLevelDictionary:(id)a4 forKey1:(id)a5 key2:(id)a6;
+ (void)incrementDictionary:(id)a3 forKey:(id)a4;
+ (void)incrementTwoLevelDictionary:(id)a3 forKey1:(id)a4 key2:(id)a5;
@end

@implementation ATXHomeScreenLogUploaderUtilities

+ (BOOL)isFirstPartyApp:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Shortcuts"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasPrefix:@"com.apple."];
  }

  return v4;
}

+ (BOOL)isValidAppLaunch:(id)a3
{
  id v3 = a3;
  char v4 = [v3 bundleID];
  if ([v4 hasPrefix:@"com.apple.springboard."]) {
    char v5 = 0;
  }
  else {
    char v5 = [v3 starting];
  }

  return v5;
}

+ (BOOL)isRotationSessionDueToProactive:(id)a3
{
  id v3 = [a3 startingStackChangeEvent];
  char v4 = [v3 reason];

  char v5 = NSStringForATXHomeScreenStackChangeReason();
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

+ (BOOL)isRotationSessionDueToUserScroll:(id)a3
{
  id v3 = [a3 startingStackChangeEvent];
  char v4 = [v3 reason];

  char v5 = NSStringForATXHomeScreenStackChangeReason();
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

+ (id)keyByConcatenatingAccumulatorKey:(id)a3 withLocation:(unint64_t)a4
{
  id v5 = a3;
  char v6 = ATXCAStringForStackLocation();
  v7 = [a1 _keyByConcatenatingAccumulatorKey:v5 withString:v6];

  return v7;
}

+ (id)keyByConcatenatingAccumulatorKey:(id)a3 withSize:(unint64_t)a4
{
  id v5 = a3;
  char v6 = ATXCAStringForStackLayoutSize();
  v7 = [a1 _keyByConcatenatingAccumulatorKey:v5 withString:v6];

  return v7;
}

+ (id)_keyByConcatenatingAccumulatorKey:(id)a3 withString:(id)a4
{
  char v4 = 0;
  if (a3 && a4)
  {
    char v6 = (objc_class *)NSString;
    id v7 = a4;
    id v8 = a3;
    char v4 = (void *)[[v6 alloc] initWithFormat:@"%@%@", v8, v7];
  }
  return v4;
}

+ (void)add:(unint64_t)a3 toDictionary:(id)a4 forKey:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  if (v7)
  {
    id v8 = [v12 objectForKeyedSubscript:v7];

    v9 = NSNumber;
    if (v8)
    {
      v10 = [v12 objectForKeyedSubscript:v7];
      v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", a3 + (int)objc_msgSend(v10, "intValue"));
      [v12 setObject:v11 forKeyedSubscript:v7];
    }
    else
    {
      v10 = [NSNumber numberWithUnsignedInteger:a3];
      [v12 setObject:v10 forKeyedSubscript:v7];
    }
  }
}

+ (void)incrementDictionary:(id)a3 forKey:(id)a4
{
}

+ (void)add:(unint64_t)a3 toTwoLevelDictionary:(id)a4 forKey1:(id)a5 key2:(id)a6
{
  id v15 = a4;
  id v10 = a5;
  if (v10 && a6)
  {
    id v11 = a6;
    id v12 = [v15 objectForKeyedSubscript:v10];

    if (!v12)
    {
      v13 = objc_opt_new();
      [v15 setObject:v13 forKeyedSubscript:v10];
    }
    v14 = [v15 objectForKeyedSubscript:v10];
    [a1 add:a3 toDictionary:v14 forKey:v11];
  }
}

+ (void)incrementTwoLevelDictionary:(id)a3 forKey1:(id)a4 key2:(id)a5
{
}

+ (BOOL)_isDwellLongEnoughForPseudoTap:(id)a3 endingEventTime:(double)a4
{
  if (!a3) {
    return 0;
  }
  [a3 timestamp];
  return a4 - v5 >= 3.0;
}

+ (id)stackShownEventsForPseudoTapIfPossible:(id)a3 currentEvent:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 eventBody];
  v9 = [v8 homeScreenEvent];

  id v10 = [v9 eventTypeString];
  if ([v10 isEqualToString:@"Unknown"])
  {
    int v11 = 0;
LABEL_59:

    goto LABEL_60;
  }
  if ([v10 isEqualToString:@"HomeScreenPageShown"])
  {
    int v11 = 1;
    goto LABEL_59;
  }
  if ([v10 isEqualToString:@"HomeScreenDisappeared"])
  {
    int v11 = 2;
    goto LABEL_59;
  }
  if ([v10 isEqualToString:@"StackChanged"])
  {
    int v11 = 3;
    goto LABEL_59;
  }
  if ([v10 isEqualToString:@"WidgetTapped"])
  {
    int v11 = 4;
    goto LABEL_59;
  }
  if ([v10 isEqualToString:@"WidgetLongLook"])
  {
    int v11 = 5;
    goto LABEL_59;
  }
  if ([v10 isEqualToString:@"WidgetUserFeedback"])
  {
    int v11 = 6;
    goto LABEL_59;
  }
  if ([v10 isEqualToString:@"UserStackConfigChanged"])
  {
    int v11 = 7;
    goto LABEL_59;
  }
  if (([v10 isEqualToString:@"DeviceLocked"] & 1) == 0)
  {
    if ([v10 isEqualToString:@"DeviceUnlocked"])
    {
      int v11 = 9;
    }
    else if ([v10 isEqualToString:@"PinnedWidgetAdded"])
    {
      int v11 = 10;
    }
    else if ([v10 isEqualToString:@"PinnedWidgetDeleted"])
    {
      int v11 = 11;
    }
    else if ([v10 isEqualToString:@"SpecialPageAppeared"])
    {
      int v11 = 12;
    }
    else if ([v10 isEqualToString:@"SpecialPageDisappeared"])
    {
      int v11 = 13;
    }
    else if ([v10 isEqualToString:@"StackShown"])
    {
      int v11 = 14;
    }
    else if ([v10 isEqualToString:@"StackDisappeared"])
    {
      int v11 = 15;
    }
    else if ([v10 isEqualToString:@"StackCreated"])
    {
      int v11 = 16;
    }
    else if ([v10 isEqualToString:@"StackDeleted"])
    {
      int v11 = 17;
    }
    else if ([v10 isEqualToString:@"WidgetAddedToStack"])
    {
      int v11 = 18;
    }
    else if ([v10 isEqualToString:@"WidgetRemovedFromStack"])
    {
      int v11 = 19;
    }
    else if ([v10 isEqualToString:@"StackVisibilityChanged"])
    {
      int v11 = 20;
    }
    else if ([v10 isEqualToString:@"AppAdded"])
    {
      int v11 = 21;
    }
    else if ([v10 isEqualToString:@"AppRemoved"])
    {
      int v11 = 22;
    }
    else
    {
      int v11 = 0;
    }
    goto LABEL_59;
  }
  v30 = v9;

  id v12 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v31 = v6;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        [v7 timestamp];
        if (objc_msgSend(a1, "_isDwellLongEnoughForPseudoTap:endingEventTime:", v18))
        {
          v19 = [v18 eventBody];
          [v19 homeScreenEvent];
          v21 = id v20 = a1;
          [v12 addObject:v21];

          a1 = v20;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  [v13 removeAllObjects];
  if ([v12 count])
  {
    v9 = v30;
    id v6 = v31;
    goto LABEL_75;
  }

  int v11 = 8;
  v9 = v30;
  id v6 = v31;
LABEL_60:
  v22 = [v9 stackId];
  if (v22)
  {
    v23 = [v6 objectForKeyedSubscript:v22];
    v24 = v23;
    if (v11 == 15)
    {
      v25 = [v6 objectForKeyedSubscript:v22];
      v26 = [v25 eventBody];
      v27 = [v26 homeScreenEvent];

      [v6 removeObjectForKey:v22];
    }
    else
    {
      if (v11 == 14)
      {
        [v6 setObject:v7 forKeyedSubscript:v22];
        goto LABEL_72;
      }
      id v12 = 0;
      if (v11 != 3 || !v23) {
        goto LABEL_73;
      }
      v28 = [v23 eventBody];
      v27 = [v28 homeScreenEvent];

      [v6 setObject:v7 forKeyedSubscript:v22];
    }
    [v7 timestamp];
    if (objc_msgSend(a1, "_isDwellLongEnoughForPseudoTap:endingEventTime:", v24))
    {
      id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v27, 0);

LABEL_73:
      goto LABEL_74;
    }

LABEL_72:
    id v12 = 0;
    goto LABEL_73;
  }
  id v12 = 0;
LABEL_74:

LABEL_75:
  return v12;
}

+ (int)suggestionReasonForSuggestionLayout:(id)a3
{
  id v3 = a3;
  char v4 = [v3 allSuggestionsInLayout];
  if (![v4 count])
  {
    id v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:](v6);
    }
    goto LABEL_6;
  }
  if (([v3 isValidForSuggestionsWidget] & 1) == 0)
  {
    if ((unint64_t)[v4 count] >= 2)
    {
      id v7 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:v7];
      }
    }
    id v6 = [v4 firstObject];
    id v8 = (void *)MEMORY[0x1E4F93940];
    v9 = [v6 clientModelSpecification];
    id v10 = [v9 clientModelId];
    uint64_t v11 = [v8 clientModelTypeFromClientModelId:v10];

    if ([v3 isLowConfidenceStackRotationForStaleStack])
    {
      if (v11 == 19) {
        int v5 = 3;
      }
      else {
        int v5 = 8 * (v11 == 20);
      }
      goto LABEL_17;
    }
    if ([v3 isShortcutConversion])
    {
      int v5 = 1;
      goto LABEL_17;
    }
    id v13 = [v6 executableSpecification];
    uint64_t v14 = [v13 executableType];

    if (v14 == 3)
    {
      switch(v11)
      {
        case 18:
          int v5 = 4;
          goto LABEL_17;
        case 20:
          int v5 = 7;
          goto LABEL_17;
        case 19:
          int v5 = 2;
          goto LABEL_17;
      }
    }
    else
    {
      uint64_t v15 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:]((uint64_t)v6, v15);
      }
    }
LABEL_6:
    int v5 = 6;
LABEL_17:

    goto LABEL_18;
  }
  int v5 = 5;
LABEL_18:

  return v5;
}

+ (id)countsForRotationEngagementStatusHistory:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v4, "engagementStatusHistory", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v11 unsignedIntValue];
        if ([v11 unsignedIntValue] <= 4) {
          [a1 incrementDictionary:v5 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)abGroup
{
  if (abGroup_onceToken != -1) {
    dispatch_once(&abGroup_onceToken, &__block_literal_global_202);
  }
  v2 = (void *)abGroup_abGroup;
  return v2;
}

void __44__ATXHomeScreenLogUploaderUtilities_abGroup__block_invoke()
{
  id v5 = (id)objc_opt_new();
  v0 = [v5 abGroupIdentifierForConsumerSubType:36];
  v1 = [v5 abGroupIdentifierForConsumerSubType:37];
  v2 = [v5 abGroupIdentifierForConsumerSubType:38];
  uint64_t v3 = [NSString stringWithFormat:@"%lu:%@:%@:%@", 0, v0, v1, v2];
  id v4 = (void *)abGroup_abGroup;
  abGroup_abGroup = v3;
}

+ (void)suggestionReasonForSuggestionLayout:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: Found no suggestions in suggestionLayout", v1, 2u);
}

+ (void)suggestionReasonForSuggestionLayout:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "ATXHomeScreenLogUploader: Suggestion is not of type widget: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)suggestionReasonForSuggestionLayout:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218242;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "ATXHomeScreenLogUploader: Unexpected behavior - %lu suggestions exist in a stackLayout that is not valid for a suggestions widget. Continuing to use first suggestion. Layout: %@", (uint8_t *)&v5, 0x16u);
}

@end
@interface ATXHomeScreenLogWidgetRotationDictionaries
+ (id)_sourceKeyForWidgetRotationForRotationSession:(id)a3;
+ (id)_sourceKeyOfNonProactiveWidgetRotationForReason:(id)a3;
+ (id)_suggestionReasonToWidgetRotationDictionariesSourceKey:(int)a3;
+ (id)widgetRotationDictionaryAccumulatorKeys;
- (ATXHomeScreenLogWidgetRotationDictionaries)init;
- (id)_createNewWidgetRotationDictionaryForBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9;
- (id)_widgetRotationDictionaryForWidgetBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9;
- (id)_widgetRotationDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9;
- (id)dryRunResult;
- (void)sendToCoreAnalytics;
- (void)updateWithRotationSession:(id)a3;
@end

@implementation ATXHomeScreenLogWidgetRotationDictionaries

- (ATXHomeScreenLogWidgetRotationDictionaries)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenLogWidgetRotationDictionaries;
  v2 = [(ATXHomeScreenLogWidgetRotationDictionaries *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    widgetRotationDictionaries = v2->_widgetRotationDictionaries;
    v2->_widgetRotationDictionaries = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)widgetRotationDictionaryAccumulatorKeys
{
  if (widgetRotationDictionaryAccumulatorKeys_onceToken != -1) {
    dispatch_once(&widgetRotationDictionaryAccumulatorKeys_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)widgetRotationDictionaryAccumulatorKeys_array;
  return v2;
}

void __85__ATXHomeScreenLogWidgetRotationDictionaries_widgetRotationDictionaryAccumulatorKeys__block_invoke()
{
  v2[16] = *MEMORY[0x1E4F143B8];
  v2[0] = @"taps";
  v2[1] = @"pseudotaps";
  v2[2] = @"rotations";
  v2[3] = @"views";
  v2[4] = @"pseudoDismisses";
  v2[5] = @"timesAddedToStack";
  v2[6] = @"dismissOnces";
  v2[7] = @"neverShows";
  v2[8] = @"viewedRotations";
  v2[9] = @"pseudoTappedRotations";
  v2[10] = @"tappedRotations";
  v2[11] = @"numFinalOutcomeNotSeen";
  v2[12] = @"numFinalOutcomePseudoDismiss";
  v2[13] = @"numFinalOutcomePseudoTap";
  v2[14] = @"numFinalOutcomeSeen";
  v2[15] = @"numFinalOutcomeTap";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:16];
  v1 = (void *)widgetRotationDictionaryAccumulatorKeys_array;
  widgetRotationDictionaryAccumulatorKeys_array = v0;
}

- (void)updateWithRotationSession:(id)a3
{
  id v4 = a3;
  v5 = [v4 startingStackChangeEvent];
  objc_super v6 = [(id)objc_opt_class() _sourceKeyForWidgetRotationForRotationSession:v4];
  v7 = [v5 widgetBundleId];
  v8 = [v5 widgetKind];
  uint64_t v9 = [v5 widgetSize];
  [v5 stackLocation];
  v10 = ATXCAStringForStackLocation();
  uint64_t v11 = [v4 isNPlusOneRotation];
  LOBYTE(v17) = [v4 isFirstNPlusOneRotation];
  v12 = [(ATXHomeScreenLogWidgetRotationDictionaries *)self _widgetRotationDictionaryForWidgetBundleId:v7 kind:v8 size:v9 source:v6 location:v10 isNPlusOne:v11 isFirstRotationToNPlusOne:v17];

  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v12 forKey:@"rotations"];
  v13 = +[ATXHomeScreenLogEngagementKeyTracker keyTrackerForStackEngagementStatus:](ATXHomeScreenLogEngagementKeyTracker, "keyTrackerForStackEngagementStatus:", [v4 engagementStatus]);
  v14 = [v13 rotationFinalOutcomeKey];
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v12 forKey:v14];

  v15 = +[ATXHomeScreenLogUploaderUtilities countsForRotationEngagementStatusHistory:v4];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__ATXHomeScreenLogWidgetRotationDictionaries_updateWithRotationSession___block_invoke;
  v18[3] = &unk_1E68AB498;
  id v19 = v12;
  id v16 = v12;
  [v15 enumerateKeysAndObjectsUsingBlock:v18];
}

void __72__ATXHomeScreenLogWidgetRotationDictionaries_updateWithRotationSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntValue];
  unsigned int v7 = [v5 unsignedIntValue];

  v8 = +[ATXHomeScreenLogEngagementKeyTracker keyTrackerForStackEngagementStatus:v6];
  if (v7)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v8;
    v10 = [v8 rotationBooleanKey];
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v9 forKey:v10];

    uint64_t v11 = *(void *)(a1 + 32);
    v12 = [v13 rotationAggregationKey];
    +[ATXHomeScreenLogUploaderUtilities add:v7 toDictionary:v11 forKey:v12];

    v8 = v13;
  }
}

- (id)_widgetRotationDictionaryForWidgetBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  if ([v15 length] && objc_msgSend(v16, "length"))
  {
    LOBYTE(v25) = a9;
    id v19 = [(ATXHomeScreenLogWidgetRotationDictionaries *)self _widgetRotationDictionaryKeyWithWidgetId:v15 widgetKind:v16 widgetSize:a5 source:v17 location:v18 isNPlusOne:v9 isFirstRotationToNPlusOne:v25];
    v20 = [(NSMutableDictionary *)self->_widgetRotationDictionaries objectForKeyedSubscript:v19];

    if (!v20)
    {
      LOBYTE(v26) = a9;
      v21 = [(ATXHomeScreenLogWidgetRotationDictionaries *)self _createNewWidgetRotationDictionaryForBundleId:v15 kind:v16 size:a5 source:v17 location:v18 isNPlusOne:v9 isFirstRotationToNPlusOne:v26];
      [(NSMutableDictionary *)self->_widgetRotationDictionaries setObject:v21 forKeyedSubscript:v19];
    }
    v22 = [(NSMutableDictionary *)self->_widgetRotationDictionaries objectForKeyedSubscript:v19];
  }
  else
  {
    v23 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenLogWidgetRotationDictionaries _widgetRotationDictionaryForWidgetBundleId:kind:size:source:location:isNPlusOne:isFirstRotationToNPlusOne:]((uint64_t)v15, (uint64_t)v16, v23);
    }

    v22 = 0;
  }

  return v22;
}

- (id)_widgetRotationDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9
{
  BOOL v9 = a8;
  v14 = (objc_class *)NSString;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)[[v14 alloc] initWithFormat:@"%@:%@:%lu:%@:%@:%d:%d", v18, v17, a5, v16, v15, v9, a9];

  return v19;
}

- (id)_createNewWidgetRotationDictionaryForBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9
{
  BOOL v9 = a8;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_opt_new();
  id v18 = [MEMORY[0x1E4F4B440] stringRepresentationForExtensionBundleId:v13 kind:v14];
  [v17 setObject:v18 forKeyedSubscript:@"WidgetBundleIdAndKind"];

  id v19 = ATXStringForStackLayoutSize();
  [v17 setObject:v19 forKeyedSubscript:@"widgetSize"];

  [v17 setObject:v15 forKeyedSubscript:@"source"];
  [v17 setObject:v16 forKeyedSubscript:@"location"];
  v20 = [NSNumber numberWithBool:v9];
  [v17 setObject:v20 forKeyedSubscript:@"isNPlusOne"];

  v21 = [NSNumber numberWithBool:a9];
  [v17 setObject:v21 forKeyedSubscript:@"IsFirstRotationToNPlusOne"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v22 = objc_msgSend((id)objc_opt_class(), "widgetRotationDictionaryAccumulatorKeys", 0);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        [v17 setObject:&unk_1F27EF730 forKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v24);
  }

  return v17;
}

+ (id)_sourceKeyForWidgetRotationForRotationSession:(id)a3
{
  id v3 = a3;
  if (+[ATXHomeScreenLogUploaderUtilities isRotationSessionDueToProactive:v3])
  {
    id v4 = objc_opt_class();
    id v5 = [v3 systemSuggestSuggestionLayout];
    objc_msgSend(v4, "_suggestionReasonToWidgetRotationDictionariesSourceKey:", +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:](ATXHomeScreenLogUploaderUtilities, "suggestionReasonForSuggestionLayout:", v5));
  }
  else
  {
    uint64_t v6 = [v3 startingStackChangeEvent];
    id v5 = [v6 reason];

    [(id)objc_opt_class() _sourceKeyOfNonProactiveWidgetRotationForReason:v5];
  unsigned int v7 = };

  return v7;
}

+ (id)_sourceKeyOfNonProactiveWidgetRotationForReason:(id)a3
{
  id v3 = a3;
  id v4 = NSStringForATXHomeScreenStackChangeReason();
  char v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    unsigned int v7 = NSStringForATXHomeScreenStackChangeReason();
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      uint64_t v6 = @"NonProactiveSystemFallback";
      goto LABEL_12;
    }
    BOOL v9 = NSStringForATXHomeScreenStackChangeReason();
    if (([v3 isEqualToString:v9] & 1) == 0)
    {
      v10 = NSStringForATXHomeScreenStackChangeReason();
      if (([v3 isEqualToString:v10] & 1) == 0)
      {
        uint64_t v11 = NSStringForATXHomeScreenStackChangeReason();
        if (![v3 isEqualToString:v11])
        {
          id v13 = NSStringForATXHomeScreenStackChangeReason();
          char v14 = [v3 isEqualToString:v13];

          if ((v14 & 1) == 0)
          {
            uint64_t v6 = @"NonProactiveOther";
            goto LABEL_12;
          }
          goto LABEL_11;
        }
      }
    }

LABEL_11:
    uint64_t v6 = @"NonProactiveNonProactiveStackEdited";
    goto LABEL_12;
  }
  uint64_t v6 = @"NonProactiveUserScroll";
LABEL_12:

  return v6;
}

+ (id)_suggestionReasonToWidgetRotationDictionariesSourceKey:(int)a3
{
  if ((a3 - 1) > 7) {
    return @"ProactiveStalenessRotation";
  }
  else {
    return off_1E68AB4B8[a3 - 1];
  }
}

- (void)sendToCoreAnalytics
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = self->_widgetRotationDictionaries;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&long long v5 = 138412546;
    long long v12 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetRotationDictionaries, "objectForKeyedSubscript:", v9, v12, (void)v13);
        uint64_t v11 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          uint64_t v18 = v9;
          __int16 v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: Widget rotation dictionary for %@: %@", buf, 0x16u);
        }

        AnalyticsSendEvent();
      }
      uint64_t v6 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }
}

- (id)dryRunResult
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_widgetRotationDictionaries;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_widgetRotationDictionaries objectForKeyedSubscript:v9];
        uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"Widget Rotation Dictionary For %@", v9];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (void)_widgetRotationDictionaryForWidgetBundleId:(os_log_t)log kind:size:source:location:isNPlusOne:isFirstRotationToNPlusOne:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: unable to get widget rotation dictionary because missing widgetId (%@) or kind (%@)", (uint8_t *)&v3, 0x16u);
}

@end
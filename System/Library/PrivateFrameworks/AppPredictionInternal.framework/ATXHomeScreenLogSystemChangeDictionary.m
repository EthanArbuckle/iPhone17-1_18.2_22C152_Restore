@interface ATXHomeScreenLogSystemChangeDictionary
+ (id)systemChangeDictionaryAccumulatorKeys;
- (ATXHomeScreenLogSystemChangeDictionary)init;
- (BOOL)_fetchHasHadWidgetsOnHomeScreenUserDefault;
- (BOOL)_suggestedWidgetWasExplicitlyDismissedWithEvent:(id)a3;
- (id)_createNewSystemChangeDictionary;
- (id)dryRunResult;
- (void)_logSuggestedWidgetDismissalWithEvent:(id)a3;
- (void)_logSuggestedWidgetExplicitDismissalWithEvent:(id)a3;
- (void)sendToCoreAnalytics;
- (void)updateSystemChangeSummaryForHomeScreenEvent:(id)a3;
- (void)updateSystemChangeSummaryForHomeScreenPages:(id)a3;
@end

@implementation ATXHomeScreenLogSystemChangeDictionary

- (ATXHomeScreenLogSystemChangeDictionary)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXHomeScreenLogSystemChangeDictionary;
  v2 = [(ATXHomeScreenLogSystemChangeDictionary *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(ATXHomeScreenLogSystemChangeDictionary *)v2 _createNewSystemChangeDictionary];
    systemChangeDictionary = v3->_systemChangeDictionary;
    v3->_systemChangeDictionary = (NSMutableDictionary *)v4;
  }
  return v3;
}

+ (id)systemChangeDictionaryAccumulatorKeys
{
  if (systemChangeDictionaryAccumulatorKeys_onceToken != -1) {
    dispatch_once(&systemChangeDictionaryAccumulatorKeys_onceToken, &__block_literal_global_91);
  }
  v2 = (void *)systemChangeDictionaryAccumulatorKeys_array;
  return v2;
}

void __79__ATXHomeScreenLogSystemChangeDictionary_systemChangeDictionaryAccumulatorKeys__block_invoke()
{
  v2[15] = *MEMORY[0x1E4F143B8];
  v2[0] = @"DefaultStacksCreated";
  v2[1] = @"ManualStacksCreated";
  v2[2] = @"StacksRemoved";
  v2[3] = @"WidgetsAddedViaAppList";
  v2[4] = @"WidgetsAddedViaGallery";
  v2[5] = @"WidgetsRemoved";
  v2[6] = @"WidgetsAddedToStackInGallerySuggestions";
  v2[7] = @"WidgetsAddedToStackNotInGallerySuggestions";
  v2[8] = @"WidgetsRemovedFromStack";
  v2[9] = @"WidgetsRemovedFromHomeScreen";
  v2[10] = @"WidgetsOnHomeScreen";
  v2[11] = @"SuggestedWidgetsRemovedFromStack";
  v2[12] = @"SuggestedWidgetsFrom3PAppsRemovedFromStack";
  v2[13] = @"SuggestedWidgetsDismissed";
  v2[14] = @"SuggestedWidgetsFrom3PAppsDismissed";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:15];
  v1 = (void *)systemChangeDictionaryAccumulatorKeys_array;
  systemChangeDictionaryAccumulatorKeys_array = v0;
}

- (id)_createNewSystemChangeDictionary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXHomeScreenLogSystemChangeDictionary _fetchHasHadWidgetsOnHomeScreenUserDefault](self, "_fetchHasHadWidgetsOnHomeScreenUserDefault"));
  [v3 setObject:v4 forKeyedSubscript:@"HasHadWidgetsOnHomeScreen"];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "systemChangeDictionaryAccumulatorKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 setObject:&unk_1F27F0DB0 forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)updateSystemChangeSummaryForHomeScreenPages:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    uint64_t v7 = *MEMORY[0x1E4F4B540];
    uint64_t v18 = *MEMORY[0x1E4F4B540];
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      uint64_t v20 = v5;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        if (objc_msgSend(v9, "pageIndex", v18, v19) != v7)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          v10 = [v9 stacks];
          long long v11 = [v9 panels];
          long long v12 = [v10 arrayByAddingObjectsFromArray:v11];

          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v23 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) widgets];
                +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", [v17 count], self->_systemChangeDictionary, @"WidgetsOnHomeScreen");
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v14);
          }

          uint64_t v7 = v18;
          uint64_t v6 = v19;
          uint64_t v5 = v20;
        }
        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }
}

- (BOOL)_fetchHasHadWidgetsOnHomeScreenUserDefault
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  char v4 = [v3 BOOLForKey:*MEMORY[0x1E4F4B6A8]];

  return v4;
}

- (void)updateSystemChangeSummaryForHomeScreenEvent:(id)a3
{
  id v20 = a3;
  id v4 = [v20 eventTypeString];
  if (([v4 isEqualToString:@"Unknown"] & 1) != 0
    || ([v4 isEqualToString:@"HomeScreenPageShown"] & 1) != 0
    || ([v4 isEqualToString:@"HomeScreenDisappeared"] & 1) != 0
    || ([v4 isEqualToString:@"StackChanged"] & 1) != 0
    || ([v4 isEqualToString:@"WidgetTapped"] & 1) != 0
    || ([v4 isEqualToString:@"WidgetLongLook"] & 1) != 0)
  {
    goto LABEL_13;
  }
  if (([v4 isEqualToString:@"WidgetUserFeedback"] & 1) == 0)
  {
    if (([v4 isEqualToString:@"UserStackConfigChanged"] & 1) != 0
      || ([v4 isEqualToString:@"DeviceLocked"] & 1) != 0
      || ([v4 isEqualToString:@"DeviceUnlocked"] & 1) != 0)
    {
      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"PinnedWidgetAdded"])
    {

      uint64_t v5 = [v20 metadata];
      uint64_t v6 = [v5 isSuggestionInAddWidgetSheet];
      int v7 = [v6 BOOLValue];

      systemChangeDictionary = self->_systemChangeDictionary;
      if (v7) {
        v9 = @"WidgetsAddedViaGallery";
      }
      else {
        v9 = @"WidgetsAddedViaAppList";
      }
LABEL_25:
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:systemChangeDictionary forKey:v9];
      goto LABEL_14;
    }
    if ([v4 isEqualToString:@"PinnedWidgetDeleted"])
    {

      uint64_t v5 = [v20 metadata];
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:self->_systemChangeDictionary forKey:@"WidgetsRemoved"];
      goto LABEL_22;
    }
    if (([v4 isEqualToString:@"SpecialPageAppeared"] & 1) != 0
      || ([v4 isEqualToString:@"SpecialPageDisappeared"] & 1) != 0
      || ([v4 isEqualToString:@"StackShown"] & 1) != 0
      || ([v4 isEqualToString:@"StackDisappeared"] & 1) != 0)
    {
LABEL_13:

      uint64_t v5 = [v20 metadata];
      goto LABEL_14;
    }
    if ([v4 isEqualToString:@"StackCreated"])
    {

      uint64_t v5 = [v20 metadata];
      v10 = [v5 isSuggestionInAddWidgetSheet];
      int v11 = [v10 BOOLValue];

      long long v12 = self->_systemChangeDictionary;
      if (v11)
      {
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v12 forKey:@"DefaultStacksCreated"];
        uint64_t v13 = [v5 widgetsInStack];
        uint64_t v14 = [v13 count];
        uint64_t v15 = self->_systemChangeDictionary;
        uint64_t v16 = @"WidgetsAddedToStackInGallerySuggestions";
      }
      else
      {
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v12 forKey:@"ManualStacksCreated"];
        uint64_t v13 = [v5 widgetsInStack];
        uint64_t v14 = [v13 count];
        uint64_t v15 = self->_systemChangeDictionary;
        uint64_t v16 = @"WidgetsAddedToStackNotInGallerySuggestions";
      }
    }
    else
    {
      if (([v4 isEqualToString:@"StackDeleted"] & 1) == 0)
      {
        if ([v4 isEqualToString:@"WidgetAddedToStack"])
        {

          uint64_t v5 = [v20 metadata];
          uint64_t v18 = [v5 isSuggestionInAddWidgetSheet];
          int v19 = [v18 BOOLValue];

          systemChangeDictionary = self->_systemChangeDictionary;
          if (v19) {
            v9 = @"WidgetsAddedToStackInGallerySuggestions";
          }
          else {
            v9 = @"WidgetsAddedToStackNotInGallerySuggestions";
          }
          goto LABEL_25;
        }
        if (([v4 isEqualToString:@"WidgetRemovedFromStack"] & 1) == 0)
        {
          if (([v4 isEqualToString:@"StackVisibilityChanged"] & 1) == 0
            && ([v4 isEqualToString:@"AppAdded"] & 1) == 0)
          {
            [v4 isEqualToString:@"AppRemoved"];
          }
          goto LABEL_13;
        }

        uint64_t v5 = [v20 metadata];
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:self->_systemChangeDictionary forKey:@"WidgetsRemovedFromStack"];
        [(ATXHomeScreenLogSystemChangeDictionary *)self _logSuggestedWidgetDismissalWithEvent:v20];
LABEL_22:
        [v20 stackLocation];
        if (!ATXStackLocationIsHomeScreen()) {
          goto LABEL_14;
        }
        systemChangeDictionary = self->_systemChangeDictionary;
        v9 = @"WidgetsRemovedFromHomeScreen";
        goto LABEL_25;
      }

      uint64_t v5 = [v20 metadata];
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:self->_systemChangeDictionary forKey:@"StacksRemoved"];
      v17 = [v5 widgetsInStack];
      +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", [v17 count], self->_systemChangeDictionary, @"WidgetsRemovedFromStack");

      [v20 stackLocation];
      if (!ATXStackLocationIsHomeScreen()) {
        goto LABEL_14;
      }
      uint64_t v13 = [v5 widgetsInStack];
      uint64_t v14 = [v13 count];
      uint64_t v15 = self->_systemChangeDictionary;
      uint64_t v16 = @"WidgetsRemovedFromHomeScreen";
    }
    +[ATXHomeScreenLogUploaderUtilities add:v14 toDictionary:v15 forKey:v16];

    goto LABEL_14;
  }

  uint64_t v5 = [v20 metadata];
  if ([(ATXHomeScreenLogSystemChangeDictionary *)self _suggestedWidgetWasExplicitlyDismissedWithEvent:v20])
  {
    [(ATXHomeScreenLogSystemChangeDictionary *)self _logSuggestedWidgetExplicitDismissalWithEvent:v20];
    [(ATXHomeScreenLogSystemChangeDictionary *)self _logSuggestedWidgetDismissalWithEvent:v20];
  }
LABEL_14:
}

- (BOOL)_suggestedWidgetWasExplicitlyDismissedWithEvent:(id)a3
{
  v3 = [a3 reason];
  id v4 = NSStringForATXHomeScreenWidgetExplicitFeedback();
  BOOL v5 = v3 == v4;

  return v5;
}

- (void)_logSuggestedWidgetExplicitDismissalWithEvent:(id)a3
{
  id v6 = a3;
  if ([v6 isSuggestedWidget])
  {
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:self->_systemChangeDictionary forKey:@"SuggestedWidgetsDismissed"];
    id v4 = [v6 appBundleId];
    BOOL v5 = +[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:v4];

    if (!v5) {
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:self->_systemChangeDictionary forKey:@"SuggestedWidgetsFrom3PAppsDismissed"];
    }
  }
}

- (void)_logSuggestedWidgetDismissalWithEvent:(id)a3
{
  id v8 = a3;
  if ([v8 isSuggestedWidget])
  {
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:self->_systemChangeDictionary forKey:@"SuggestedWidgetsRemovedFromStack"];
    uint64_t v4 = [v8 appBundleId];
    if (v4)
    {
      BOOL v5 = (void *)v4;
      id v6 = [v8 appBundleId];
      BOOL v7 = +[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:v6];

      if (!v7) {
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:self->_systemChangeDictionary forKey:@"SuggestedWidgetsFrom3PAppsRemovedFromStack"];
      }
    }
  }
}

- (void)sendToCoreAnalytics
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    systemChangeDictionary = self->_systemChangeDictionary;
    int v5 = 138412290;
    id v6 = systemChangeDictionary;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: System change dictionary: %@", (uint8_t *)&v5, 0xCu);
  }

  AnalyticsSendEvent();
}

- (id)dryRunResult
{
  v6[1] = *MEMORY[0x1E4F143B8];
  systemChangeDictionary = self->_systemChangeDictionary;
  int v5 = @"System Change Dictionary";
  v6[0] = systemChangeDictionary;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void).cxx_destruct
{
}

@end
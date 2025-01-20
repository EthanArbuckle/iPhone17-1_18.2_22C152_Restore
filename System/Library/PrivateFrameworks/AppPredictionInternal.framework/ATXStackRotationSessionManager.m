@interface ATXStackRotationSessionManager
+ (BOOL)supportsSecureCoding;
- (ATXStackRotationSessionManager)init;
- (ATXStackRotationSessionManager)initWithCoder:(id)a3;
- (ATXStackRotationSessionManager)initWithStackIdToStackRotationSessions:(id)a3 completedSessions:(id)a4 recentHomeScreenCachedSuggestions:(id)a5 nPlusOneSuggestionUUIDsWithFirstRotation:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXStackRotationSessionManager:(id)a3;
- (NSMutableArray)completedSessions;
- (NSMutableArray)recentHomeScreenCachedSuggestions;
- (NSMutableDictionary)stackIdToStackRotationSessions;
- (NSMutableSet)nPlusOneSuggestionUUIDsWithFirstRotation;
- (id)removeAllAndReturnCompletedSystemSuggestSessions;
- (id)removeAndReturnCompletedSessions;
- (id)uuidsOfNPlusOneSuggestionsFromCachedSuggestions:(id)a3;
- (unint64_t)hash;
- (void)_tryEndStackRotationSessionWithStackId:(id)a3 homeScreenEvent:(id)a4;
- (void)_tryPruneSessionsOverMaxLimit;
- (void)_tryStartStackRotationSessionWithStackId:(id)a3 homeScreenEvent:(id)a4;
- (void)_tryUpdateNPlusOneStatusForSession:(id)a3 stackId:(id)a4;
- (void)_tryUpdateStackRotationSessionWithSystemSuggestLayout:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithBlendingUICacheUpdate:(id)a3;
- (void)updateWithUIEvent:(id)a3;
@end

@implementation ATXStackRotationSessionManager

- (ATXStackRotationSessionManager)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(ATXStackRotationSessionManager *)self initWithStackIdToStackRotationSessions:v3 completedSessions:v4 recentHomeScreenCachedSuggestions:v5 nPlusOneSuggestionUUIDsWithFirstRotation:v6];

  return v7;
}

- (ATXStackRotationSessionManager)initWithStackIdToStackRotationSessions:(id)a3 completedSessions:(id)a4 recentHomeScreenCachedSuggestions:(id)a5 nPlusOneSuggestionUUIDsWithFirstRotation:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXStackRotationSessionManager;
  v15 = [(ATXStackRotationSessionManager *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_stackIdToStackRotationSessions, a3);
    objc_storeStrong((id *)&v16->_completedSessions, a4);
    objc_storeStrong((id *)&v16->_recentHomeScreenCachedSuggestions, a5);
    objc_storeStrong((id *)&v16->_nPlusOneSuggestionUUIDsWithFirstRotation, a6);
  }

  return v16;
}

- (void)_tryPruneSessionsOverMaxLimit
{
  unint64_t v3 = [(NSMutableDictionary *)self->_stackIdToStackRotationSessions count];
  if (v3 > kATXStackRotationSessionManagerMaxConcurrentSessions) {
    [(NSMutableDictionary *)self->_stackIdToStackRotationSessions removeAllObjects];
  }
  unint64_t v4 = [(NSMutableSet *)self->_nPlusOneSuggestionUUIDsWithFirstRotation count];
  if (v4 > kATXStackRotationSessionManagerMaxConcurrentNPlusOneSuggestions)
  {
    nPlusOneSuggestionUUIDsWithFirstRotation = self->_nPlusOneSuggestionUUIDsWithFirstRotation;
    [(NSMutableSet *)nPlusOneSuggestionUUIDsWithFirstRotation removeAllObjects];
  }
}

- (void)_tryEndStackRotationSessionWithStackId:(id)a3 homeScreenEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = [(NSMutableDictionary *)self->_stackIdToStackRotationSessions objectForKey:v6];
    v10 = v9;
    if (v9)
    {
      [v9 finalizeWithEndingStackChangeEvent:v8];
      [(NSMutableDictionary *)self->_stackIdToStackRotationSessions removeObjectForKey:v6];
      [(NSMutableArray *)self->_completedSessions addObject:v10];
      id v11 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ATXStackRotationSessionManager _tryEndStackRotationSessionWithStackId:homeScreenEvent:]();
      }
    }
  }
  else
  {
    v10 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      int v14 = 138412802;
      v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_error_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_ERROR, "%@ - could not end session because of missing fields, stackId: %@, homeScreenEvent: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)_tryStartStackRotationSessionWithStackId:(id)a3 homeScreenEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7 && ([v7 reason], v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    [(ATXStackRotationSessionManager *)self _tryPruneSessionsOverMaxLimit];
    v10 = [[ATXStackRotationSession alloc] initWithStartingStackChangeEvent:v8];
    [(ATXStackRotationSessionManager *)self _tryUpdateStackRotationSessionWithSystemSuggestLayout:v10];
    [(ATXStackRotationSessionManager *)self _tryUpdateNPlusOneStatusForSession:v10 stackId:v6];
    [(NSMutableDictionary *)self->_stackIdToStackRotationSessions setValue:v10 forKey:v6];
    id v11 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ATXStackRotationSessionManager _tryStartStackRotationSessionWithStackId:homeScreenEvent:]();
    }
  }
  else
  {
    __atxlog_handle_metrics();
    v10 = (ATXStackRotationSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      int v14 = [v8 reason];
      int v15 = 138413058;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_error_impl(&dword_1D0FA3000, &v10->super, OS_LOG_TYPE_ERROR, "%@ - could not start session because of missing fields, stackId: %@, reason: %@, homeScreenEvent: %@", (uint8_t *)&v15, 0x2Au);
    }
  }
}

- (void)updateWithUIEvent:(id)a3
{
  unint64_t v4 = [a3 homeScreenEvent];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 eventTypeString];
    if ([v6 isEqualToString:@"Unknown"])
    {
      int v7 = 0;
    }
    else if ([v6 isEqualToString:@"HomeScreenPageShown"])
    {
      int v7 = 1;
    }
    else if ([v6 isEqualToString:@"HomeScreenDisappeared"])
    {
      int v7 = 2;
    }
    else if ([v6 isEqualToString:@"StackChanged"])
    {
      int v7 = 3;
    }
    else if ([v6 isEqualToString:@"WidgetTapped"])
    {
      int v7 = 4;
    }
    else if ([v6 isEqualToString:@"WidgetLongLook"])
    {
      int v7 = 5;
    }
    else if ([v6 isEqualToString:@"WidgetUserFeedback"])
    {
      int v7 = 6;
    }
    else if ([v6 isEqualToString:@"UserStackConfigChanged"])
    {
      int v7 = 7;
    }
    else if ([v6 isEqualToString:@"DeviceLocked"])
    {
      int v7 = 8;
    }
    else if ([v6 isEqualToString:@"DeviceUnlocked"])
    {
      int v7 = 9;
    }
    else if ([v6 isEqualToString:@"PinnedWidgetAdded"])
    {
      int v7 = 10;
    }
    else if ([v6 isEqualToString:@"PinnedWidgetDeleted"])
    {
      int v7 = 11;
    }
    else if ([v6 isEqualToString:@"SpecialPageAppeared"])
    {
      int v7 = 12;
    }
    else if ([v6 isEqualToString:@"SpecialPageDisappeared"])
    {
      int v7 = 13;
    }
    else if ([v6 isEqualToString:@"StackShown"])
    {
      int v7 = 14;
    }
    else if ([v6 isEqualToString:@"StackDisappeared"])
    {
      int v7 = 15;
    }
    else if ([v6 isEqualToString:@"StackCreated"])
    {
      int v7 = 16;
    }
    else if ([v6 isEqualToString:@"StackDeleted"])
    {
      int v7 = 17;
    }
    else if ([v6 isEqualToString:@"WidgetAddedToStack"])
    {
      int v7 = 18;
    }
    else if ([v6 isEqualToString:@"WidgetRemovedFromStack"])
    {
      int v7 = 19;
    }
    else if ([v6 isEqualToString:@"StackVisibilityChanged"])
    {
      int v7 = 20;
    }
    else if ([v6 isEqualToString:@"AppAdded"])
    {
      int v7 = 21;
    }
    else if ([v6 isEqualToString:@"AppRemoved"])
    {
      int v7 = 22;
    }
    else
    {
      int v7 = 0;
    }

    v8 = [v5 stackId];
    if (v8)
    {
      switch(v7)
      {
        case 3:
          [(ATXStackRotationSessionManager *)self _tryEndStackRotationSessionWithStackId:v8 homeScreenEvent:v5];
          [(ATXStackRotationSessionManager *)self _tryStartStackRotationSessionWithStackId:v8 homeScreenEvent:v5];
          break;
        case 4:
          v9 = [(NSMutableDictionary *)self->_stackIdToStackRotationSessions objectForKey:v8];
          if (!v9) {
            goto LABEL_80;
          }
          v10 = [v5 widgetUniqueId];
          id v11 = [v9 widgetUniqueId];
          int v12 = [v10 isEqualToString:v11];

          if (!v12) {
            goto LABEL_80;
          }
          [v9 markStackTapped];
          id v13 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[ATXStackRotationSessionManager updateWithUIEvent:]();
          }
          goto LABEL_79;
        case 6:
          v9 = [v5 reason];
          uint64_t v14 = [(NSMutableDictionary *)self->_stackIdToStackRotationSessions objectForKey:v8];
          id v13 = v14;
          if (!v9 || !v14) {
            goto LABEL_79;
          }
          int v15 = NSStringForATXHomeScreenWidgetExplicitFeedback();
          int v16 = [v9 isEqualToString:v15];

          if (v16)
          {
            [v13 markAddedToStack];
            __int16 v17 = __atxlog_handle_metrics();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              -[ATXStackRotationSessionManager updateWithUIEvent:].cold.4();
            }
          }
          else
          {
            v26 = NSStringForATXHomeScreenWidgetExplicitFeedback();
            int v27 = [v9 isEqualToString:v26];

            if (v27)
            {
              [v13 markRejectedRotationDismissOnce];
              __int16 v17 = __atxlog_handle_metrics();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
                -[ATXStackRotationSessionManager updateWithUIEvent:].cold.5();
              }
            }
            else
            {
              v28 = NSStringForATXHomeScreenWidgetExplicitFeedback();
              int v29 = [v9 isEqualToString:v28];

              if (!v29) {
                goto LABEL_79;
              }
              [v13 markRejectedRotationNeverShowAgain];
              __int16 v17 = __atxlog_handle_metrics();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
                -[ATXStackRotationSessionManager updateWithUIEvent:].cold.6();
              }
            }
          }

LABEL_79:
LABEL_80:

          break;
        case 14:
          v9 = [(NSMutableDictionary *)self->_stackIdToStackRotationSessions objectForKey:v8];
          if (!v9) {
            goto LABEL_80;
          }
          id v18 = [v5 widgetUniqueId];
          __int16 v19 = [v9 widgetUniqueId];
          int v20 = [v18 isEqualToString:v19];

          if (!v20) {
            goto LABEL_80;
          }
          __int16 v21 = [v5 date];
          [v9 markStackShownAtDate:v21];

          id v13 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[ATXStackRotationSessionManager updateWithUIEvent:]();
          }
          goto LABEL_79;
        case 15:
          v9 = [(NSMutableDictionary *)self->_stackIdToStackRotationSessions objectForKey:v8];
          if (!v9) {
            goto LABEL_80;
          }
          v22 = [v5 widgetUniqueId];
          uint64_t v23 = [v9 widgetUniqueId];
          int v24 = [v22 isEqualToString:v23];

          if (!v24) {
            goto LABEL_80;
          }
          v25 = [v5 date];
          [v9 markStackHiddenAtDate:v25];

          id v13 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[ATXStackRotationSessionManager updateWithUIEvent:]();
          }
          goto LABEL_79;
        case 17:
          v9 = [(NSMutableDictionary *)self->_stackIdToStackRotationSessions objectForKey:v8];
          if (!v9) {
            goto LABEL_80;
          }
          [(ATXStackRotationSessionManager *)self _tryEndStackRotationSessionWithStackId:v8 homeScreenEvent:v5];
          id v13 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[ATXStackRotationSessionManager updateWithUIEvent:].cold.7();
          }
          goto LABEL_79;
        default:
          break;
      }
    }
  }
}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 uiCache];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_20;
  }
  int v7 = [v4 uiCache];
  v8 = [v7 cachedTopOfStackLayouts];
  if ([v8 count])
  {

LABEL_5:
    [(NSMutableArray *)self->_recentHomeScreenCachedSuggestions addObject:v7];
    goto LABEL_6;
  }
  v9 = [v7 cachedSuggestedWidgetsLayouts];
  uint64_t v10 = [v9 count];

  if (v10) {
    goto LABEL_5;
  }
LABEL_6:
  if ((unint64_t)[(NSMutableArray *)self->_recentHomeScreenCachedSuggestions count] >= 3)
  {
    do
      [(NSMutableArray *)self->_recentHomeScreenCachedSuggestions removeObjectAtIndex:0];
    while ((unint64_t)[(NSMutableArray *)self->_recentHomeScreenCachedSuggestions count] > 2);
  }
  id v11 = [(ATXStackRotationSessionManager *)self uuidsOfNPlusOneSuggestionsFromCachedSuggestions:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v12 = (void *)[(NSMutableSet *)self->_nPlusOneSuggestionUUIDsWithFirstRotation copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (([v11 containsObject:v17] & 1) == 0) {
          [(NSMutableSet *)self->_nPlusOneSuggestionUUIDsWithFirstRotation removeObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  id v18 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ATXStackRotationSessionManager updateWithBlendingUICacheUpdate:]();
  }

LABEL_20:
}

- (id)removeAndReturnCompletedSessions
{
  if ([(NSMutableArray *)self->_completedSessions count])
  {
    unint64_t v3 = (void *)[(NSMutableArray *)self->_completedSessions copy];
    [(NSMutableArray *)self->_completedSessions removeAllObjects];
  }
  else
  {
    unint64_t v3 = objc_opt_new();
  }
  return v3;
}

- (id)removeAllAndReturnCompletedSystemSuggestSessions
{
  v2 = [(ATXStackRotationSessionManager *)self removeAndReturnCompletedSessions];
  unint64_t v3 = objc_msgSend(v2, "_pas_filteredArrayWithTest:", &__block_literal_global_164);

  return v3;
}

uint64_t __82__ATXStackRotationSessionManager_removeAllAndReturnCompletedSystemSuggestSessions__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 rotationReason];
  unint64_t v3 = NSStringForATXHomeScreenStackChangeReason();
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)_tryUpdateNPlusOneStatusForSession:(id)a3 stackId:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v7 = [(NSMutableArray *)self->_recentHomeScreenCachedSuggestions reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * v10) cachedSuggestedWidgetsLayouts];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __77__ATXStackRotationSessionManager__tryUpdateNPlusOneStatusForSession_stackId___block_invoke;
        v13[3] = &unk_1E68B3BE0;
        id v14 = v6;
        uint64_t v15 = self;
        int v16 = &v29;
        uint64_t v17 = &v25;
        id v18 = v23;
        [v11 enumerateKeysAndObjectsUsingBlock:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v33 count:16];
    }
    while (v8);
  }

  [v6 updateIsNPlusOneRotation:*((unsigned __int8 *)v30 + 24) isFirstNPlusOneRotation:*((unsigned __int8 *)v26 + 24)];
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

void __77__ATXStackRotationSessionManager__tryUpdateNPlusOneStatusForSession_stackId___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      id v12 = objc_msgSend(v11, "widgetUniqueId", (void)v21);
      uint64_t v13 = [*(id *)(a1 + 32) widgetUniqueId];
      int v14 = [v12 isEqualToString:v13];

      if (v14)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        uint64_t v15 = [v11 allSuggestionsInLayout];
        int v16 = [v15 firstObject];

        if (v16)
        {
          uint64_t v17 = *(void **)(*(void *)(a1 + 40) + 32);
          id v18 = [v16 uuid];
          LOBYTE(v17) = [v17 containsObject:v18];

          if (v17)
          {
LABEL_16:
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;

            goto LABEL_17;
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          long long v19 = *(void **)(*(void *)(a1 + 40) + 32);
          long long v20 = [v16 uuid];
          [v19 addObject:v20];
        }
        else
        {
          long long v20 = __atxlog_handle_metrics();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            __77__ATXStackRotationSessionManager__tryUpdateNPlusOneStatusForSession_stackId___block_invoke_cold_1();
          }
        }

        goto LABEL_16;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_17:

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *a4 = 1;
  }
}

- (void)_tryUpdateStackRotationSessionWithSystemSuggestLayout:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 rotationReason];
  id v6 = NSStringForATXHomeScreenStackChangeReason();
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [(NSMutableArray *)self->_recentHomeScreenCachedSuggestions reverseObjectEnumerator];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) cachedTopOfStackLayouts];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __88__ATXStackRotationSessionManager__tryUpdateStackRotationSessionWithSystemSuggestLayout___block_invoke;
          v14[3] = &unk_1E68B3390;
          id v15 = v4;
          [v13 enumerateKeysAndObjectsUsingBlock:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

void __88__ATXStackRotationSessionManager__tryUpdateStackRotationSessionWithSystemSuggestLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 widgetUniqueId];
  v5 = [*(id *)(a1 + 32) widgetUniqueId];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    [*(id *)(a1 + 32) updateWithSystemSuggestSuggestionLayout:v7];
  }
}

- (id)uuidsOfNPlusOneSuggestionsFromCachedSuggestions:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 cachedSuggestedWidgetsLayouts];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__ATXStackRotationSessionManager_uuidsOfNPlusOneSuggestionsFromCachedSuggestions___block_invoke;
  v9[3] = &unk_1E68AE3F8;
  id v10 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];
  return v7;
}

void __82__ATXStackRotationSessionManager_uuidsOfNPlusOneSuggestionsFromCachedSuggestions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) allSuggestionsInLayout];
        id v10 = [v9 firstObject];

        if (v10)
        {
          uint64_t v11 = *(void **)(a1 + 32);
          uint64_t v12 = [v10 uuid];
          [v11 addObject:v12];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableDictionary *)self->_stackIdToStackRotationSessions hash];
  return [(NSMutableArray *)self->_completedSessions hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXStackRotationSessionManager *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXStackRotationSessionManager *)self isEqualToATXStackRotationSessionManager:v5];

  return v6;
}

- (BOOL)isEqualToATXStackRotationSessionManager:(id)a3
{
  id v4 = (id *)a3;
  stackIdToStackRotationSessions = self->_stackIdToStackRotationSessions;
  BOOL v6 = (NSMutableDictionary *)v4[1];
  if (stackIdToStackRotationSessions == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = stackIdToStackRotationSessions;
    char v9 = [(NSMutableDictionary *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v11 = self->_completedSessions;
  uint64_t v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSMutableArray isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  stackIdToStackRotationSessions = self->_stackIdToStackRotationSessions;
  id v5 = a3;
  [v5 encodeObject:stackIdToStackRotationSessions forKey:@"mapping"];
  [v5 encodeObject:self->_completedSessions forKey:@"completedSessions"];
  [v5 encodeObject:self->_recentHomeScreenCachedSuggestions forKey:@"recentHomeScreenCachedSuggestions"];
  [v5 encodeObject:self->_nPlusOneSuggestionUUIDsWithFirstRotation forKey:@"nPlusOneRotationStatus"];
}

- (ATXStackRotationSessionManager)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  char v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  char v10 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v11 = __atxlog_handle_metrics();
  uint64_t v12 = [v10 robustDecodeObjectOfClasses:v9 forKey:@"mapping" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXStackRotationSessionManager" errorCode:-1 logHandle:v11];

  if (v12 && ([v4 error], long long v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    long long v15 = (void *)MEMORY[0x1E4F93B90];
    long long v16 = (void *)MEMORY[0x1D25F6CC0]();
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v18 = objc_opt_class();
    long long v19 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    long long v20 = __atxlog_handle_metrics();
    uint64_t v21 = [v15 robustDecodeObjectOfClasses:v19 forKey:@"completedSessions" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXStackRotationSessionManager" errorCode:-1 logHandle:v20];

    if (v21 && ([v4 error], long long v22 = objc_claimAutoreleasedReturnValue(), v22, !v22))
    {
      long long v23 = (void *)MEMORY[0x1D25F6CC0]();
      id v41 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_msgSend(v41, "initWithObjects:", v24, v25, v26, objc_opt_class(), 0);

      char v28 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v29 = __atxlog_handle_metrics();
      v30 = [v28 robustDecodeObjectOfClasses:v27 forKey:@"recentHomeScreenCachedSuggestions" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXStackRotationSessionManager" errorCode:-1 logHandle:v29];

      if (v30
        && ([v4 error], uint64_t v31 = objc_claimAutoreleasedReturnValue(), v31, !v31))
      {
        char v32 = (void *)MEMORY[0x1D25F6CC0]();
        id v33 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v34 = objc_opt_class();
        uint64_t v35 = objc_msgSend(v33, "initWithObjects:", v34, objc_opt_class(), 0);

        v36 = (void *)MEMORY[0x1E4F93B90];
        v37 = __atxlog_handle_metrics();
        v38 = [v36 robustDecodeObjectOfClasses:v35 forKey:@"nPlusOneRotationStatus" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXStackRotationSessionManager" errorCode:-1 logHandle:v37];

        if (v38
          && ([v4 error], v39 = objc_claimAutoreleasedReturnValue(), v39, !v39))
        {
          self = [(ATXStackRotationSessionManager *)self initWithStackIdToStackRotationSessions:v12 completedSessions:v21 recentHomeScreenCachedSuggestions:v30 nPlusOneSuggestionUUIDsWithFirstRotation:v38];
          long long v14 = self;
        }
        else
        {
          long long v14 = 0;
        }

        uint64_t v27 = (void *)v35;
      }
      else
      {
        long long v14 = 0;
      }

      char v9 = v27;
    }
    else
    {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (NSMutableDictionary)stackIdToStackRotationSessions
{
  return self->_stackIdToStackRotationSessions;
}

- (NSMutableArray)completedSessions
{
  return self->_completedSessions;
}

- (NSMutableArray)recentHomeScreenCachedSuggestions
{
  return self->_recentHomeScreenCachedSuggestions;
}

- (NSMutableSet)nPlusOneSuggestionUUIDsWithFirstRotation
{
  return self->_nPlusOneSuggestionUUIDsWithFirstRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nPlusOneSuggestionUUIDsWithFirstRotation, 0);
  objc_storeStrong((id *)&self->_recentHomeScreenCachedSuggestions, 0);
  objc_storeStrong((id *)&self->_completedSessions, 0);
  objc_storeStrong((id *)&self->_stackIdToStackRotationSessions, 0);
}

- (void)_tryEndStackRotationSessionWithStackId:homeScreenEvent:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - marked stack rotation status as completed: %@", v4, v5, v6, v7, v8);
}

- (void)_tryStartStackRotationSessionWithStackId:homeScreenEvent:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - starting stack rotation session: %@", v4, v5, v6, v7, v8);
}

- (void)updateWithUIEvent:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - updated dwell start date for session %@", v4, v5, v6, v7, v8);
}

- (void)updateWithUIEvent:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - updated dwell end date for session %@", v4, v5, v6, v7, v8);
}

- (void)updateWithUIEvent:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - handled tap for session %@", v4, v5, v6, v7, v8);
}

- (void)updateWithUIEvent:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - handled N+1 added to stack for session %@", v4, v5, v6, v7, v8);
}

- (void)updateWithUIEvent:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - handled N+1 rotation dismissed once for session %@", v4, v5, v6, v7, v8);
}

- (void)updateWithUIEvent:.cold.6()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - handled N+1 rotation never show again for session %@", v4, v5, v6, v7, v8);
}

- (void)updateWithUIEvent:.cold.7()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - handled stack delete for session %@", v4, v5, v6, v7, v8);
}

- (void)updateWithBlendingUICacheUpdate:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ N+1: _nPlusOneSuggestionUUIDsWithFirstRotation: %@", v4, v5, v6, v7, 2u);
}

void __77__ATXStackRotationSessionManager__tryUpdateNPlusOneStatusForSession_stackId___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "%@ N+1 - could not find suggestion in stack rotation layout: %@", v3, 0x16u);
}

@end
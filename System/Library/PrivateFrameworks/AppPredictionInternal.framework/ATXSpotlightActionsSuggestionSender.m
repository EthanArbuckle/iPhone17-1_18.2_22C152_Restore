@interface ATXSpotlightActionsSuggestionSender
+ (id)identifierForNowPlayingSuggestionFromLayout:(id)a3;
+ (id)identifierForOngoingCallSuggestionFromLayout:(id)a3;
+ (id)identifiersForDirectionsSuggestionFromLayout:(id)a3;
+ (id)identifiersForSuggestionsFromLayout:(id)a3;
- (ATXSpotlightActionsSuggestionSender)init;
- (void)_logCAEvents:(id)a3 eventType:(int64_t)a4 toStream:(id)a5;
- (void)_processChanges:(id)a3;
- (void)_sendSpotlightSuggestionUpdateNotification:(id)a3;
- (void)blendingLayerDidUpdateSpotlightUICache:(id)a3;
@end

@implementation ATXSpotlightActionsSuggestionSender

+ (id)identifiersForSuggestionsFromLayout:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v17 = v3;
    id obj = [v3 collections];
    uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v20)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = v5;
          v6 = *(void **)(*((void *)&v27 + 1) + 8 * v5);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v7 = [v6 suggestions];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v35 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v24;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v24 != v10) {
                  objc_enumerationMutation(v7);
                }
                v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
                v13 = (void *)[objc_alloc(MEMORY[0x1E4F938D8]) initWithProactiveSuggestion:v12];
                if (v13)
                {
                  [v4 addObject:v13];
                }
                else
                {
                  v14 = __atxlog_handle_blending();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                  {
                    v22 = [v12 executableSpecification];
                    v15 = [v22 executableIdentifier];
                    *(_DWORD *)buf = 138412546;
                    v32 = v15;
                    __int16 v33 = 2112;
                    v34 = v12;
                    _os_log_error_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: nil: %@, %@", buf, 0x16u);
                  }
                }

                ++v11;
              }
              while (v9 != v11);
              uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v35 count:16];
            }
            while (v9);
          }

          uint64_t v5 = v21 + 1;
        }
        while (v21 + 1 != v20);
        uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v20);
    }

    id v3 = v17;
  }
  else
  {
    v4 = objc_opt_new();
  }

  return v4;
}

+ (id)identifiersForDirectionsSuggestionFromLayout:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v3;
    id obj = [v3 collections];
    uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = v5;
          v6 = *(void **)(*((void *)&v31 + 1) + 8 * v5);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          v7 = [v6 suggestions];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v28 != v10) {
                  objc_enumerationMutation(v7);
                }
                v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                v13 = [v12 atxShortcutsActionExecutableObject];
                v14 = [v13 contextualAction];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v16 = [v13 contextualAction];
                  id v17 = [v16 uniqueIdentifier];

                  v18 = [v12 uiSpecification];
                  uint64_t v19 = [v18 title];

                  [v4 setObject:v19 forKeyedSubscript:v17];
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v9);
          }

          uint64_t v5 = v26 + 1;
        }
        while (v26 + 1 != v25);
        uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v25);
    }

    uint64_t v20 = (void *)[v4 copy];
    id v3 = v22;
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }

  return v20;
}

+ (id)identifierForNowPlayingSuggestionFromLayout:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v5 = [v3 collections];
    uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v21)
    {
      uint64_t v6 = *(void *)v27;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v9 = objc_msgSend(v8, "suggestions", v20);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                v15 = [v14 uiSpecification];
                int v16 = [v15 predictionReasons];

                if ((v16 & 0x40000) != 0)
                {
                  v18 = [v14 executableSpecification];
                  id v17 = [v18 executableIdentifier];

                  goto LABEL_21;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

          uint64_t v6 = v20;
        }
        id v17 = 0;
        uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v21);
    }
    else
    {
      id v17 = 0;
    }
LABEL_21:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)identifierForOngoingCallSuggestionFromLayout:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v5 = [v3 collections];
    uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v21)
    {
      uint64_t v6 = *(void *)v27;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v9 = objc_msgSend(v8, "suggestions", v20);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                v15 = [v14 uiSpecification];
                int v16 = [v15 predictionReasons];

                if ((v16 & 0x80000) != 0)
                {
                  v18 = [v14 executableSpecification];
                  id v17 = [v18 executableIdentifier];

                  goto LABEL_21;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

          uint64_t v6 = v20;
        }
        id v17 = 0;
        uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v21);
    }
    else
    {
      id v17 = 0;
    }
LABEL_21:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (ATXSpotlightActionsSuggestionSender)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXSpotlightActionsSuggestionSender;
  v2 = [(ATXSpotlightActionsSuggestionSender *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionary];
    previousDirectionsIdentifiers = v2->_previousDirectionsIdentifiers;
    v2->_previousDirectionsIdentifiers = (NSDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    previousIdentifiers = v2->_previousIdentifiers;
    v2->_previousIdentifiers = (NSSet *)v5;
  }
  return v2;
}

- (void)blendingLayerDidUpdateSpotlightUICache:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - received new ui cache", (uint8_t *)&v8, 0xCu);
  }
  [(ATXSpotlightActionsSuggestionSender *)self _processChanges:v4];
  [(ATXSpotlightActionsSuggestionSender *)self _sendSpotlightSuggestionUpdateNotification:v4];
}

- (void)_processChanges:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(id)objc_opt_class() identifiersForSuggestionsFromLayout:v4];

    uint64_t v6 = (void *)[(NSSet *)v5 mutableCopy];
    [v6 minusSet:self->_previousIdentifiers];
    v7 = (void *)[(NSSet *)self->_previousIdentifiers mutableCopy];
    [v7 minusSet:v5];
    id v8 = objc_alloc_init(MEMORY[0x1E4F939A8]);
    previousIdentifiers = self->_previousIdentifiers;
    self->_previousIdentifiers = v5;

    uint64_t v10 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXSpotlightActionsSuggestionSender _processChanges:](v7);
    }

    [(ATXSpotlightActionsSuggestionSender *)self _logCAEvents:v7 eventType:2 toStream:v8];
    uint64_t v11 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ATXSpotlightActionsSuggestionSender _processChanges:](v6);
    }

    [(ATXSpotlightActionsSuggestionSender *)self _logCAEvents:v6 eventType:1 toStream:v8];
  }
}

- (void)_logCAEvents:(id)a3 eventType:(int64_t)a4 toStream:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        id v14 = objc_alloc(MEMORY[0x1E4F939B0]);
        v15 = [v13 uniqueIdentifier];
        int v16 = [v13 subtype];
        id v17 = [v13 context];
        v18 = (void *)[v14 initWithType:a4 suggestionUniqueId:v15 suggestionType:@"action" suggestionSubtype:v16 suggestionContext:v17];

        [v8 sendEvent:v18];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)_sendSpotlightSuggestionUpdateNotification:(id)a3
{
  id v4 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"zkwTriggerUIRefresh", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat)&& [MEMORY[0x1E4F93B08] isInternalBuild])
  {
    uint64_t v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Internal: trigger for all changes", (uint8_t *)v17, 2u);
    }

    notify_post((const char *)[(id)*MEMORY[0x1E4F4AE08] UTF8String]);
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() identifierForNowPlayingSuggestionFromLayout:v4];
    id v7 = v6;
    if (v6 == self->_previousNowPlayingIdentifier) {
      int v8 = 0;
    }
    else {
      int v8 = !-[NSString isEqualToString:](v6, "isEqualToString:");
    }
    objc_storeStrong((id *)&self->_previousNowPlayingIdentifier, v7);
    uint64_t v9 = [(id)objc_opt_class() identifierForOngoingCallSuggestionFromLayout:v4];
    uint64_t v10 = v9;
    if (v9 == self->_previousOngoingCallIdentifier) {
      int v11 = 0;
    }
    else {
      int v11 = !-[NSString isEqualToString:](v9, "isEqualToString:");
    }
    previousOngoingCallIdentifier = self->_previousOngoingCallIdentifier;
    self->_previousOngoingCallIdentifier = v10;
    v13 = v10;

    id v14 = [(id)objc_opt_class() identifiersForDirectionsSuggestionFromLayout:v4];
    BOOL v15 = [(NSDictionary *)v14 isEqualToDictionary:self->_previousDirectionsIdentifiers];
    previousDirectionsIdentifiers = self->_previousDirectionsIdentifiers;
    self->_previousDirectionsIdentifiers = v14;

    if (((v8 | v11) & 1) != 0 || !v15) {
      notify_post((const char *)[(id)*MEMORY[0x1E4F4AE08] UTF8String]);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousIdentifiers, 0);
  objc_storeStrong((id *)&self->_previousDirectionsIdentifiers, 0);
  objc_storeStrong((id *)&self->_previousNowPlayingIdentifier, 0);
  objc_storeStrong((id *)&self->_previousOngoingCallIdentifier, 0);
}

- (void)_processChanges:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Added %lu events - ATXSpotlightUIEvent", v3, v4, v5, v6, 0);
}

- (void)_processChanges:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Removed %lu events - ATXSpotlightUIEvent", v3, v4, v5, v6, 0);
}

@end
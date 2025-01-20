@interface ATXSingleSuggestionSessionTrackingContext
+ (BOOL)supportsSecureCoding;
- (ATXSingleSuggestionSessionTrackingContext)init;
- (ATXSingleSuggestionSessionTrackingContext)initWithCoder:(id)a3;
- (ATXSingleSuggestionSessionTrackingContext)initWithMostRecentlySeenHomescreenBlendingCacheUUID:(id)a3 mostRecentAppSpotlightBlendingCacheUUID:(id)a4 mostRecentActionSpotlightBlendingCacheUUID:(id)a5 suggestionsWidgetIds:(id)a6 appPredictionPanelIds:(id)a7 mostRecentClientCacheUpdateUUIDByClientModelId:(id)a8 currentlyTrackedSessions:(id)a9 completedSessions:(id)a10;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSingleSuggestionSessionTrackingContext:(id)a3;
- (NSMutableArray)completedSessions;
- (NSMutableDictionary)currentlyTrackedSessions;
- (NSMutableDictionary)mostRecentClientCacheUpdateUUIDByClientModelId;
- (NSMutableSet)appPredictionPanelIds;
- (NSMutableSet)suggestionsWidgetIds;
- (NSUUID)mostRecentActionSpotlightBlendingCacheUUID;
- (NSUUID)mostRecentAppSpotlightBlendingCacheUUID;
- (NSUUID)mostRecentHomescreenBlendingCacheUUID;
- (id)_persistentIdentifierForSuggestion:(id)a3;
- (id)clientModelIdsToConsider;
- (id)description;
- (id)removeStoredCompletedSessionsAndReturnCompletedSessionsCopy;
- (unint64_t)hash;
- (void)_tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:(id)a3;
- (void)_tryPruneSingleSuggestionSessionsIfOverMaxNum;
- (void)_updateCurrentlyTrackedSessionsWithSessionStatus:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 suggestionUUIDs:(id)a5 blendingCacheUUID:(id)a6;
- (void)_updateSingleSuggestionSessionsWithHomeScreenUIEvent:(id)a3;
- (void)_updateSingleSuggestionSessionsWithSpotlightUIEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppPredictionPanelIds:(id)a3;
- (void)setCompletedSessions:(id)a3;
- (void)setCurrentlyTrackedSessions:(id)a3;
- (void)setMostRecentActionSpotlightBlendingCacheUUID:(id)a3;
- (void)setMostRecentAppSpotlightBlendingCacheUUID:(id)a3;
- (void)setMostRecentClientCacheUpdateUUIDByClientModelId:(id)a3;
- (void)setMostRecentHomescreenBlendingCacheUUID:(id)a3;
- (void)setSuggestionsWidgetIds:(id)a3;
- (void)updateWithBlendingUICacheUpdate:(id)a3;
- (void)updateWithClientModelCacheUpdate:(id)a3;
- (void)updateWithUIEvent:(id)a3;
@end

@implementation ATXSingleSuggestionSessionTrackingContext

- (ATXSingleSuggestionSessionTrackingContext)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = [(ATXSingleSuggestionSessionTrackingContext *)self initWithMostRecentlySeenHomescreenBlendingCacheUUID:0 mostRecentAppSpotlightBlendingCacheUUID:0 mostRecentActionSpotlightBlendingCacheUUID:0 suggestionsWidgetIds:v3 appPredictionPanelIds:v4 mostRecentClientCacheUpdateUUIDByClientModelId:v5 currentlyTrackedSessions:v6 completedSessions:v7];

  return v8;
}

- (ATXSingleSuggestionSessionTrackingContext)initWithMostRecentlySeenHomescreenBlendingCacheUUID:(id)a3 mostRecentAppSpotlightBlendingCacheUUID:(id)a4 mostRecentActionSpotlightBlendingCacheUUID:(id)a5 suggestionsWidgetIds:(id)a6 appPredictionPanelIds:(id)a7 mostRecentClientCacheUpdateUUIDByClientModelId:(id)a8 currentlyTrackedSessions:(id)a9 completedSessions:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ATXSingleSuggestionSessionTrackingContext;
  v18 = [(ATXSingleSuggestionSessionTrackingContext *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mostRecentHomescreenBlendingCacheUUID, a3);
    objc_storeStrong((id *)&v19->_mostRecentAppSpotlightBlendingCacheUUID, a4);
    objc_storeStrong((id *)&v19->_mostRecentActionSpotlightBlendingCacheUUID, a5);
    objc_storeStrong((id *)&v19->_suggestionsWidgetIds, a6);
    objc_storeStrong((id *)&v19->_appPredictionPanelIds, a7);
    objc_storeStrong((id *)&v19->_mostRecentClientCacheUpdateUUIDByClientModelId, a8);
    objc_storeStrong((id *)&v19->_currentlyTrackedSessions, a9);
    objc_storeStrong((id *)&v19->_completedSessions, a10);
  }

  return v19;
}

- (id)removeStoredCompletedSessionsAndReturnCompletedSessionsCopy
{
  v3 = (void *)[(NSMutableArray *)self->_completedSessions copy];
  [(NSMutableArray *)self->_completedSessions removeAllObjects];
  return v3;
}

- (id)clientModelIdsToConsider
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v3 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:1];
  v4 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:23];
  v5 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:13];
  v6 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:44];
  v7 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

- (id)_persistentIdentifierForSuggestion:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 clientModelSpecification];
  v7 = [v6 clientModelId];
  v8 = [v4 executableSpecification];

  v9 = [v8 executableIdentifier];
  v10 = (void *)[v5 initWithFormat:@"%@-%@", v7, v9];

  return v10;
}

- (void)updateWithClientModelCacheUpdate:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ATXSingleSuggestionSessionTrackingContext *)self _tryPruneSingleSuggestionSessionsIfOverMaxNum];
  id v5 = [v4 clientModelId];
  if (v5)
  {
    v6 = [(ATXSingleSuggestionSessionTrackingContext *)self clientModelIdsToConsider];
    int v7 = [v6 containsObject:v5];

    if (v7)
    {
      v33 = v5;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obj = [v4 suggestions];
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v8)
      {
        uint64_t v10 = v8;
        uint64_t v11 = *(void *)v37;
        *(void *)&long long v9 = 138412802;
        long long v32 = v9;
        do
        {
          uint64_t v12 = 0;
          uint64_t v34 = v10;
          do
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
            v14 = -[ATXSingleSuggestionSessionTrackingContext _persistentIdentifierForSuggestion:](self, "_persistentIdentifierForSuggestion:", v13, v32);
            v15 = [(NSMutableDictionary *)self->_currentlyTrackedSessions objectForKey:v14];
            v16 = v15;
            if (v15)
            {
              id v17 = [v15 associatedClientModelCacheUUIDs];
              v18 = [v4 uuid];
              [v17 addObject:v18];

              v19 = __atxlog_handle_metrics();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                v20 = (objc_class *)objc_opt_class();
                id v21 = NSStringFromClass(v20);
                *(_DWORD *)buf = v32;
                v41 = v21;
                __int16 v42 = 2112;
                v43 = v33;
                __int16 v44 = 2112;
                v45 = v16;
                _os_log_debug_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEBUG, "%@ - updated existing suggestion session with new clientModelId: %@, %@", buf, 0x20u);
              }
            }
            else
            {
              uint64_t v22 = v11;
              id v23 = [ATXSingleSuggestionSession alloc];
              id v24 = [v4 uuid];
              id v25 = [v4 feedbackMetadata];
              v19 = [(ATXSingleSuggestionSession *)v23 initWithTrackedProactiveSuggestion:v13 clientModelCacheUUID:v24 feedbackMetadata:v25];

              [(NSMutableDictionary *)self->_currentlyTrackedSessions setObject:v19 forKey:v14];
              id v26 = __atxlog_handle_metrics();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                id v27 = (objc_class *)objc_opt_class();
                objc_super v28 = NSStringFromClass(v27);
                *(_DWORD *)buf = v32;
                v41 = v28;
                __int16 v42 = 2112;
                v43 = v33;
                __int16 v44 = 2112;
                v45 = v19;
                _os_log_debug_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEBUG, "%@ - starting suggestion session for clientModelId: %@, %@", buf, 0x20u);
              }
              uint64_t v11 = v22;
              uint64_t v10 = v34;
            }

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
        }
        while (v10);
      }

      mostRecentClientCacheUpdateUUIDByClientModelId = self->_mostRecentClientCacheUpdateUUIDByClientModelId;
      v30 = [v4 uuid];
      v31 = mostRecentClientCacheUpdateUUIDByClientModelId;
      id v5 = v33;
      [(NSMutableDictionary *)v31 setObject:v30 forKey:v33];
    }
  }
}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  int v4 = [v68 consumerSubType];
  switch(v4)
  {
    case 34:
      int v7 = [v68 uuid];
      mostRecentHomescreenBlendingCacheUUID = self->_mostRecentHomescreenBlendingCacheUUID;
      self->_mostRecentHomescreenBlendingCacheUUID = v7;
      break;
    case 21:
      uint64_t v8 = [v68 uuid];
      mostRecentHomescreenBlendingCacheUUID = self->_mostRecentActionSpotlightBlendingCacheUUID;
      self->_mostRecentActionSpotlightBlendingCacheUUID = v8;
      break;
    case 9:
      id v5 = [v68 uuid];
      mostRecentHomescreenBlendingCacheUUID = self->_mostRecentAppSpotlightBlendingCacheUUID;
      self->_mostRecentAppSpotlightBlendingCacheUUID = v5;
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = [v68 clientModelCacheUpdateUUIDs];
  uint64_t v11 = [v10 allValues];
  v70 = (void *)[v9 initWithArray:v11];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v63 = self;
  uint64_t v12 = [(NSMutableDictionary *)self->_currentlyTrackedSessions allValues];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v79 objects:v91 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v80 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v18 = [v17 associatedClientModelCacheUUIDs];
        int v19 = [v18 intersectsSet:v70];

        if (v19)
        {
          v20 = [v17 associatedBlendingCacheUUIDs];
          id v21 = [v68 uuid];
          char v22 = [v20 containsObject:v21];

          if ((v22 & 1) == 0)
          {
            id v23 = [v17 associatedBlendingCacheUUIDs];
            id v24 = [v68 uuid];
            [v23 addObject:v24];

            id v25 = __atxlog_handle_metrics();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              id v26 = (objc_class *)objc_opt_class();
              id v27 = NSStringFromClass(v26);
              objc_super v28 = [v68 uuid];
              *(_DWORD *)buf = 138412802;
              v86 = v27;
              __int16 v87 = 2112;
              v88 = v28;
              __int16 v89 = 2112;
              v90 = v17;
              _os_log_debug_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEBUG, "%@ - updated blending uuids with %@ for session: %@", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v79 objects:v91 count:16];
    }
    while (v14);
  }

  v29 = [v68 uiCache];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v31 = [v68 uiCache];
  long long v32 = v31;
  if (isKindOfClass)
  {
    v33 = [v31 allSuggestionsInLayout];
    p_isa = (id *)&v63->super.isa;
  }
  else
  {
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass();

    p_isa = (id *)&v63->super.isa;
    if ((v35 & 1) == 0) {
      goto LABEL_49;
    }
    long long v32 = [v68 uiCache];
    v33 = [v32 allSuggestionsInCachedSuggestions];
    long long v36 = [v32 cachedSuggestionWidgetLayouts];
    long long v37 = [v36 allKeys];

    if ([v37 count])
    {
      [(NSMutableSet *)v63->_suggestionsWidgetIds removeAllObjects];
      [(NSMutableSet *)v63->_suggestionsWidgetIds addObjectsFromArray:v37];
    }
    long long v38 = [v32 cachedAppPredictionPanelLayouts];
    long long v39 = [v38 allKeys];

    if ([v39 count])
    {
      [(NSMutableSet *)v63->_appPredictionPanelIds removeAllObjects];
      [(NSMutableSet *)v63->_appPredictionPanelIds addObjectsFromArray:v39];
    }
  }
  if (v33)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = [p_isa[7] allValues];
    uint64_t v67 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v67)
    {
      uint64_t v65 = *(void *)v76;
      v66 = v33;
      do
      {
        uint64_t v40 = 0;
        do
        {
          if (*(void *)v76 != v65) {
            objc_enumerationMutation(obj);
          }
          uint64_t v69 = v40;
          v41 = *(void **)(*((void *)&v75 + 1) + 8 * v40);
          __int16 v42 = [v41 suggestion];
          v43 = [v42 executableSpecification];
          uint64_t v44 = [v43 executableObjectHash];

          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v45 = v33;
          uint64_t v46 = [v45 countByEnumeratingWithState:&v71 objects:v83 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v72;
            do
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v72 != v48) {
                  objc_enumerationMutation(v45);
                }
                v50 = *(void **)(*((void *)&v71 + 1) + 8 * j);
                v51 = [v50 executableSpecification];
                uint64_t v52 = [v51 executableObjectHash];

                if (v44 == v52)
                {
                  v53 = [v41 matchingSuggestionUUIDs];
                  v54 = [v50 uuid];
                  char v55 = [v53 containsObject:v54];

                  if ((v55 & 1) == 0)
                  {
                    v56 = [v41 matchingSuggestionUUIDs];
                    v57 = [v50 uuid];
                    [v56 addObject:v57];

                    v58 = __atxlog_handle_metrics();
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                    {
                      v59 = (objc_class *)objc_opt_class();
                      v60 = NSStringFromClass(v59);
                      v61 = [v50 uuid];
                      *(_DWORD *)buf = 138412802;
                      v86 = v60;
                      __int16 v87 = 2112;
                      v88 = v61;
                      __int16 v89 = 2112;
                      v90 = v41;
                      _os_log_debug_impl(&dword_1D0FA3000, v58, OS_LOG_TYPE_DEBUG, "%@ - updated matching suggestion with %@ for session: %@", buf, 0x20u);
                    }
                  }
                }
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v71 objects:v83 count:16];
            }
            while (v47);
          }

          uint64_t v40 = v69 + 1;
          v33 = v66;
        }
        while (v69 + 1 != v67);
        uint64_t v67 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v67);
    }

    p_isa = (id *)&v63->super.isa;
  }
LABEL_49:
  v62 = [v68 cacheCreationDate];
  [p_isa _tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:v62];
}

- (void)updateWithUIEvent:(id)a3
{
  id v10 = a3;
  int v4 = [v10 spotlightEvent];
  if (v4)
  {
    [(ATXSingleSuggestionSessionTrackingContext *)self _updateSingleSuggestionSessionsWithSpotlightUIEvent:v4];
    if ([v4 eventType] == 2)
    {
      id v5 = [v4 date];
      [(ATXSingleSuggestionSessionTrackingContext *)self _tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:v5];
    }
  }
  v6 = [v10 homeScreenEvent];
  if (v6)
  {
    [(ATXSingleSuggestionSessionTrackingContext *)self _updateSingleSuggestionSessionsWithHomeScreenUIEvent:v6];
    int v7 = [v6 eventTypeString];
    int v8 = [v7 isEqualToString:@"DeviceLocked"];

    if (v8)
    {
      id v9 = [v6 date];
      [(ATXSingleSuggestionSessionTrackingContext *)self _tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:v9];
    }
  }
}

- (void)_tryPruneSingleSuggestionSessionsIfOverMaxNum
{
  v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  [*a2 count];
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v5, v6, "%@ - currentlyTrackedSessions has length of: %lu", v7, v8, v9, v10, v11);
}

- (void)_updateSingleSuggestionSessionsWithSpotlightUIEvent:(id)a3
{
  id v10 = a3;
  unsigned int v4 = [v10 eventType] - 3;
  if (v4 <= 4)
  {
    uint64_t v5 = qword_1D142BAD0[v4];
    uint64_t v6 = [v10 appSuggestionIds];
    uint64_t v7 = [v10 appBlendingCacheId];
    [(ATXSingleSuggestionSessionTrackingContext *)self _updateCurrentlyTrackedSessionsWithSessionStatus:v5 consumerSubType:9 suggestionUUIDs:v6 blendingCacheUUID:v7];

    uint64_t v8 = [v10 actionSuggestionIds];
    uint64_t v9 = [v10 actionBlendingCacheId];
    [(ATXSingleSuggestionSessionTrackingContext *)self _updateCurrentlyTrackedSessionsWithSessionStatus:v5 consumerSubType:21 suggestionUUIDs:v8 blendingCacheUUID:v9];
  }
}

- (void)_updateSingleSuggestionSessionsWithHomeScreenUIEvent:(id)a3
{
  id v15 = a3;
  unsigned int v4 = [v15 blendingCacheId];
  uint64_t v5 = [v15 widgetUniqueId];
  uint64_t v6 = [v15 widgetBundleId];
  [v15 stackLocation];
  if (v4 && v5 && v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    if (v7)
    {
      id v8 = [v15 eventTypeString];
      if ([v8 isEqualToString:@"Unknown"])
      {
LABEL_6:
        uint64_t v9 = v8;
LABEL_20:

        goto LABEL_21;
      }
      if ([v8 isEqualToString:@"Tapped"])
      {
        uint64_t v10 = 2;
      }
      else if (([v8 isEqualToString:@"ContextMenuDismissOnce"] & 1) != 0 {
             || ([v8 isEqualToString:@"ContextMenuNeverShowAgain"] & 1) != 0)
      }
      {
        uint64_t v10 = 3;
      }
      else
      {
        if (([v8 isEqualToString:@"WidgetAppeared"] & 1) != 0
          || ([v8 isEqualToString:@"WidgetDisappeared"] & 1) != 0)
        {
          goto LABEL_6;
        }
        if (([v8 isEqualToString:@"SuggestionsAppeared"] & 1) == 0)
        {
          if (([v8 isEqualToString:@"SuggestionsDisappeared"] & 1) == 0
            && ([v8 isEqualToString:@"WidgetOccluded"] & 1) == 0)
          {
            [v8 isEqualToString:@"WidgetUnoccluded"];
          }
          goto LABEL_6;
        }
        uint64_t v10 = 1;
      }

      if ([v6 isEqualToString:*MEMORY[0x1E4F4AD48]])
      {
        BOOL v11 = ATXStackLocationIsTodayPage() == 0;
        unsigned int v12 = 37;
        unsigned int v13 = 40;
LABEL_16:
        if (v11) {
          uint64_t v14 = v12;
        }
        else {
          uint64_t v14 = v13;
        }
        uint64_t v9 = [v15 suggestionIds];
        id v8 = [v15 blendingCacheId];
        [(ATXSingleSuggestionSessionTrackingContext *)self _updateCurrentlyTrackedSessionsWithSessionStatus:v10 consumerSubType:v14 suggestionUUIDs:v9 blendingCacheUUID:v8];
        goto LABEL_20;
      }
      if ([v6 isEqualToString:*MEMORY[0x1E4F4B5F8]])
      {
        BOOL v11 = ATXStackLocationIsTodayPage() == 0;
        unsigned int v12 = 36;
        unsigned int v13 = 39;
        goto LABEL_16;
      }
    }
LABEL_21:
  }
}

- (void)_updateCurrentlyTrackedSessionsWithSessionStatus:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 suggestionUUIDs:(id)a5 blendingCacheUUID:(id)a6
{
  unsigned int v38 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a6;
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    id v30 = v7;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    if (v10)
    {
      v29 = v9;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v7;
      uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
      if (v34)
      {
        uint64_t v33 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v44 != v33) {
              objc_enumerationMutation(obj);
            }
            unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v43 + 1) + 8 * i)];
            if (v12)
            {
              uint64_t v35 = i;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              unsigned int v13 = [(NSMutableDictionary *)self->_currentlyTrackedSessions allValues];
              uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v55 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v40;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v40 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                    int v19 = [v18 matchingSuggestionUUIDs];
                    int v20 = [v19 containsObject:v12];

                    id v21 = [v18 associatedBlendingCacheUUIDs];
                    int v22 = [v21 containsObject:v10];

                    if (v20) {
                      BOOL v23 = v22 == 0;
                    }
                    else {
                      BOOL v23 = 1;
                    }
                    if (!v23 && [v18 tryUpdateSessionStatus:a3 consumerSubType:v38])
                    {
                      id v24 = __atxlog_handle_metrics();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                      {
                        id v25 = (objc_class *)objc_opt_class();
                        long long v36 = NSStringFromClass(v25);
                        id v26 = +[ATXSingleSuggestionSession stringForSuggestionSessionStatus:a3];
                        uint64_t v27 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v38];
                        *(_DWORD *)buf = 138413058;
                        uint64_t v48 = v36;
                        __int16 v49 = 2112;
                        v50 = v26;
                        __int16 v51 = 2112;
                        uint64_t v52 = v27;
                        objc_super v28 = (void *)v27;
                        __int16 v53 = 2112;
                        v54 = v18;
                        _os_log_debug_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEBUG, "%@ - updated status with %@ for consumerSubType: %@, session: %@", buf, 0x2Au);
                      }
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v55 count:16];
                }
                while (v15);
              }

              uint64_t i = v35;
            }
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
        }
        while (v34);
      }

      uint64_t v9 = v29;
    }

    id v7 = v30;
  }
}

- (void)_tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  currentlyTrackedSessions = self->_currentlyTrackedSessions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__ATXSingleSuggestionSessionTrackingContext__tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate___block_invoke;
  v9[3] = &unk_1E68B4988;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSMutableDictionary *)currentlyTrackedSessions enumerateKeysAndObjectsUsingBlock:v9];
  [(NSMutableDictionary *)self->_currentlyTrackedSessions removeObjectsForKeys:v7];
}

void __101__ATXSingleSuggestionSessionTrackingContext__tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 suggestion];
  id v8 = [v7 clientModelSpecification];
  uint64_t v9 = [v8 clientModelId];

  id v10 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v9];
  if (v10)
  {
    id v11 = [v6 associatedClientModelCacheUUIDs];
    int v12 = [v11 containsObject:v10];
  }
  else
  {
    int v12 = 0;
  }
  unsigned int v13 = *(void **)(a1 + 32);
  if (v13[1])
  {
    uint64_t v14 = [v6 associatedBlendingCacheUUIDs];
    int v15 = [v14 containsObject:*(void *)(*(void *)(a1 + 32) + 8)];

    unsigned int v13 = *(void **)(a1 + 32);
  }
  else
  {
    int v15 = 0;
  }
  if (v13[3])
  {
    uint64_t v16 = [v6 associatedBlendingCacheUUIDs];
    int v32 = [v16 containsObject:*(void *)(*(void *)(a1 + 32) + 24)];

    unsigned int v13 = *(void **)(a1 + 32);
  }
  else
  {
    int v32 = 0;
  }
  if (v13[2])
  {
    id v17 = [v6 associatedBlendingCacheUUIDs];
    int v18 = [v17 containsObject:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else
  {
    int v18 = 0;
  }
  int v19 = [v6 sessionExpirationDate];
  int v20 = v19;
  if (v19)
  {
    id v21 = *(void **)(a1 + 40);
    if (!v21)
    {

      goto LABEL_23;
    }
    [v6 sessionExpirationDate];
    int v31 = v15;
    int v22 = v10;
    int v23 = v12;
    id v24 = v9;
    v26 = id v25 = v5;
    [v21 timeIntervalSinceDate:v26];
    BOOL v28 = v27 <= 0.0;

    id v5 = v25;
    uint64_t v9 = v24;
    int v12 = v23;
    id v10 = v22;
    int v15 = v31;
  }
  else
  {
    BOOL v28 = 0;
  }

  if (((v12 | v15 | v32 | v18) & 1) == 0 && !v28)
  {
    id v29 = v5;
    [v6 setCompleted:1];
    id v30 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      __101__ATXSingleSuggestionSessionTrackingContext__tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate___block_invoke_cold_1((uint64_t)v6, v30);
    }

    id v5 = v29;
    [*(id *)(a1 + 48) addObject:v29];
    [*(id *)(*(void *)(a1 + 32) + 64) addObject:v6];
  }
LABEL_23:
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"%@ - currentlyTrackedSessions: %@", v5, self->_currentlyTrackedSessions];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    int v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      id v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  mostRecentHomescreenBlendingCacheUUID = self->_mostRecentHomescreenBlendingCacheUUID;
  id v5 = a3;
  [v5 encodeObject:mostRecentHomescreenBlendingCacheUUID forKey:@"codingKeyForRecentHomeScreenBlendingCacheUUID"];
  [v5 encodeObject:self->_mostRecentAppSpotlightBlendingCacheUUID forKey:@"codingKeyForRecentAppSpotlightBlendingCacheUUID"];
  [v5 encodeObject:self->_mostRecentActionSpotlightBlendingCacheUUID forKey:@"codingKeyForRecentActionSpotlightBlendingCacheUUID"];
  [v5 encodeObject:self->_suggestionsWidgetIds forKey:@"codingKeyForSuggestionsWidgetIds"];
  [v5 encodeObject:self->_appPredictionPanelIds forKey:@"codingKeyForAppPredictionPanelIds"];
  [v5 encodeObject:self->_mostRecentClientCacheUpdateUUIDByClientModelId forKey:@"codingKeyForRecentClientCacheUpdatesByClientModelId"];
  [v5 encodeObject:self->_currentlyTrackedSessions forKey:@"codingKeyForCurrentlyTrackedSessions"];
  [v5 encodeObject:self->_completedSessions forKey:@"codingKeyForCompletedSessions"];
}

- (ATXSingleSuggestionSessionTrackingContext)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v5 = objc_opt_class();
  id v6 = __atxlog_handle_metrics();
  uint64_t v59 = [v4 robustDecodeObjectOfClass:v5 forKey:@"codingKeyForRecentHomeScreenBlendingCacheUUID" withCoder:v3 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext" errorCode:-1 logHandle:v6];

  id v7 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = __atxlog_handle_metrics();
  uint64_t v58 = [v7 robustDecodeObjectOfClass:v8 forKey:@"codingKeyForRecentActionSpotlightBlendingCacheUUID" withCoder:v3 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext" errorCode:-1 logHandle:v9];

  id v10 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v11 = objc_opt_class();
  id v12 = __atxlog_handle_metrics();
  v61 = [v10 robustDecodeObjectOfClass:v11 forKey:@"codingKeyForRecentAppSpotlightBlendingCacheUUID" withCoder:v3 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext" errorCode:-1 logHandle:v12];

  id v13 = (void *)MEMORY[0x1E4F93B90];
  BOOL v14 = (void *)MEMORY[0x1D25F6CC0]();
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  id v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  int v18 = __atxlog_handle_metrics();
  int v19 = [v13 robustDecodeObjectOfClasses:v17 forKey:@"codingKeyForSuggestionsWidgetIds" withCoder:v3 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext" errorCode:-1 logHandle:v18];

  if (v19)
  {
    int v20 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v21 = (void *)MEMORY[0x1D25F6CC0]();
    id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v23 = objc_opt_class();
    id v24 = objc_msgSend(v22, "initWithObjects:", v23, objc_opt_class(), 0);
    id v25 = __atxlog_handle_metrics();
    id v26 = [v20 robustDecodeObjectOfClasses:v24 forKey:@"codingKeyForAppPredictionPanelIds" withCoder:v3 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext" errorCode:-1 logHandle:v25];

    if (v26)
    {
      double v27 = (void *)MEMORY[0x1D25F6CC0]();
      id v28 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = objc_opt_class();
      int v31 = objc_msgSend(v28, "initWithObjects:", v29, v30, objc_opt_class(), 0);
      int v32 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v33 = __atxlog_handle_metrics();
      uint64_t v34 = [v32 robustDecodeObjectOfClasses:v31 forKey:@"codingKeyForRecentClientCacheUpdatesByClientModelId" withCoder:v3 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext" errorCode:-1 logHandle:v33];

      if (v34)
      {
        uint64_t v57 = v34;
        char v55 = v31;
        uint64_t v35 = (void *)MEMORY[0x1D25F6CC0]();
        id v36 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v37 = objc_opt_class();
        uint64_t v38 = objc_opt_class();
        uint64_t v39 = objc_msgSend(v36, "initWithObjects:", v37, v38, objc_opt_class(), 0);
        long long v40 = (void *)MEMORY[0x1E4F93B90];
        long long v41 = __atxlog_handle_metrics();
        long long v42 = [v40 robustDecodeObjectOfClasses:v39 forKey:@"codingKeyForCurrentlyTrackedSessions" withCoder:v3 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext" errorCode:-1 logHandle:v41];

        v56 = (void *)v39;
        if (v42)
        {
          long long v43 = (void *)MEMORY[0x1D25F6CC0]();
          id v44 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v45 = objc_opt_class();
          long long v46 = objc_msgSend(v44, "initWithObjects:", v45, objc_opt_class(), 0);
          uint64_t v47 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v48 = __atxlog_handle_metrics();
          __int16 v49 = [v47 robustDecodeObjectOfClasses:v46 forKey:@"codingKeyForCompletedSessions" withCoder:v3 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext" errorCode:-1 logHandle:v48];

          if (v49)
          {
            v50 = (void *)v59;
            __int16 v51 = (void *)v58;
            uint64_t v52 = [(ATXSingleSuggestionSessionTrackingContext *)self initWithMostRecentlySeenHomescreenBlendingCacheUUID:v59 mostRecentAppSpotlightBlendingCacheUUID:v61 mostRecentActionSpotlightBlendingCacheUUID:v58 suggestionsWidgetIds:v19 appPredictionPanelIds:v26 mostRecentClientCacheUpdateUUIDByClientModelId:v57 currentlyTrackedSessions:v42 completedSessions:v49];
            __int16 v53 = v52;
          }
          else
          {
            __int16 v53 = 0;
            v50 = (void *)v59;
            uint64_t v52 = self;
            __int16 v51 = (void *)v58;
          }
        }
        else
        {
          __int16 v53 = 0;
          v50 = (void *)v59;
          uint64_t v52 = self;
          __int16 v51 = (void *)v58;
        }
        int v31 = v55;
        uint64_t v34 = v57;
      }
      else
      {
        __int16 v53 = 0;
        v50 = (void *)v59;
        uint64_t v52 = self;
        __int16 v51 = (void *)v58;
      }
    }
    else
    {
      __int16 v53 = 0;
      v50 = (void *)v59;
      uint64_t v52 = self;
      __int16 v51 = (void *)v58;
    }
  }
  else
  {
    __int16 v53 = 0;
    v50 = (void *)v59;
    uint64_t v52 = self;
    __int16 v51 = (void *)v58;
  }

  return v53;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXSingleSuggestionSessionTrackingContext *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSingleSuggestionSessionTrackingContext *)self isEqualToATXSingleSuggestionSessionTrackingContext:v5];

  return v6;
}

- (BOOL)isEqualToATXSingleSuggestionSessionTrackingContext:(id)a3
{
  id v4 = (id *)a3;
  mostRecentHomescreenBlendingCacheUUID = self->_mostRecentHomescreenBlendingCacheUUID;
  BOOL v6 = (NSUUID *)v4[1];
  if (mostRecentHomescreenBlendingCacheUUID == v6)
  {
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = mostRecentHomescreenBlendingCacheUUID;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_27;
    }
  }
  mostRecentAppSpotlightBlendingCacheUUID = self->_mostRecentAppSpotlightBlendingCacheUUID;
  uint64_t v11 = (NSUUID *)v4[2];
  if (mostRecentAppSpotlightBlendingCacheUUID == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = mostRecentAppSpotlightBlendingCacheUUID;
    char v14 = [(NSUUID *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_27;
    }
  }
  mostRecentActionSpotlightBlendingCacheUUID = self->_mostRecentActionSpotlightBlendingCacheUUID;
  uint64_t v16 = (NSUUID *)v4[3];
  if (mostRecentActionSpotlightBlendingCacheUUID == v16)
  {
  }
  else
  {
    id v17 = v16;
    int v18 = mostRecentActionSpotlightBlendingCacheUUID;
    char v19 = [(NSUUID *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_27;
    }
  }
  suggestionsWidgetIds = self->_suggestionsWidgetIds;
  uint64_t v21 = (NSMutableSet *)v4[4];
  if (suggestionsWidgetIds == v21)
  {
  }
  else
  {
    id v22 = v21;
    uint64_t v23 = suggestionsWidgetIds;
    char v24 = [(NSMutableSet *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_27;
    }
  }
  appPredictionPanelIds = self->_appPredictionPanelIds;
  id v26 = (NSMutableSet *)v4[5];
  if (appPredictionPanelIds == v26)
  {
  }
  else
  {
    double v27 = v26;
    id v28 = appPredictionPanelIds;
    char v29 = [(NSMutableSet *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_27;
    }
  }
  mostRecentClientCacheUpdateUUIDByClientModelId = self->_mostRecentClientCacheUpdateUUIDByClientModelId;
  int v31 = (NSMutableDictionary *)v4[6];
  if (mostRecentClientCacheUpdateUUIDByClientModelId == v31)
  {
  }
  else
  {
    int v32 = v31;
    uint64_t v33 = mostRecentClientCacheUpdateUUIDByClientModelId;
    char v34 = [(NSMutableDictionary *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_27;
    }
  }
  currentlyTrackedSessions = self->_currentlyTrackedSessions;
  id v36 = (NSMutableDictionary *)v4[7];
  if (currentlyTrackedSessions == v36)
  {
  }
  else
  {
    uint64_t v37 = v36;
    uint64_t v38 = currentlyTrackedSessions;
    char v39 = [(NSMutableDictionary *)v38 isEqual:v37];

    if ((v39 & 1) == 0)
    {
LABEL_27:
      char v40 = 0;
      goto LABEL_28;
    }
  }
  long long v42 = self->_completedSessions;
  long long v43 = v42;
  if (v42 == v4[8]) {
    char v40 = 1;
  }
  else {
    char v40 = -[NSMutableArray isEqual:](v42, "isEqual:");
  }

LABEL_28:
  return v40;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_mostRecentHomescreenBlendingCacheUUID hash];
  uint64_t v4 = [(NSUUID *)self->_mostRecentAppSpotlightBlendingCacheUUID hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSUUID *)self->_mostRecentActionSpotlightBlendingCacheUUID hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSMutableSet *)self->_suggestionsWidgetIds hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSMutableSet *)self->_appPredictionPanelIds hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSMutableDictionary *)self->_mostRecentClientCacheUpdateUUIDByClientModelId hash] - v7 + 32 * v7;
  uint64_t v9 = [(NSMutableDictionary *)self->_currentlyTrackedSessions hash] - v8 + 32 * v8;
  return [(NSMutableArray *)self->_completedSessions hash] - v9 + 32 * v9;
}

- (NSUUID)mostRecentHomescreenBlendingCacheUUID
{
  return self->_mostRecentHomescreenBlendingCacheUUID;
}

- (void)setMostRecentHomescreenBlendingCacheUUID:(id)a3
{
}

- (NSUUID)mostRecentAppSpotlightBlendingCacheUUID
{
  return self->_mostRecentAppSpotlightBlendingCacheUUID;
}

- (void)setMostRecentAppSpotlightBlendingCacheUUID:(id)a3
{
}

- (NSUUID)mostRecentActionSpotlightBlendingCacheUUID
{
  return self->_mostRecentActionSpotlightBlendingCacheUUID;
}

- (void)setMostRecentActionSpotlightBlendingCacheUUID:(id)a3
{
}

- (NSMutableSet)suggestionsWidgetIds
{
  return self->_suggestionsWidgetIds;
}

- (void)setSuggestionsWidgetIds:(id)a3
{
}

- (NSMutableSet)appPredictionPanelIds
{
  return self->_appPredictionPanelIds;
}

- (void)setAppPredictionPanelIds:(id)a3
{
}

- (NSMutableDictionary)mostRecentClientCacheUpdateUUIDByClientModelId
{
  return self->_mostRecentClientCacheUpdateUUIDByClientModelId;
}

- (void)setMostRecentClientCacheUpdateUUIDByClientModelId:(id)a3
{
}

- (NSMutableDictionary)currentlyTrackedSessions
{
  return self->_currentlyTrackedSessions;
}

- (void)setCurrentlyTrackedSessions:(id)a3
{
}

- (NSMutableArray)completedSessions
{
  return self->_completedSessions;
}

- (void)setCompletedSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedSessions, 0);
  objc_storeStrong((id *)&self->_currentlyTrackedSessions, 0);
  objc_storeStrong((id *)&self->_mostRecentClientCacheUpdateUUIDByClientModelId, 0);
  objc_storeStrong((id *)&self->_appPredictionPanelIds, 0);
  objc_storeStrong((id *)&self->_suggestionsWidgetIds, 0);
  objc_storeStrong((id *)&self->_mostRecentActionSpotlightBlendingCacheUUID, 0);
  objc_storeStrong((id *)&self->_mostRecentAppSpotlightBlendingCacheUUID, 0);
  objc_storeStrong((id *)&self->_mostRecentHomescreenBlendingCacheUUID, 0);
}

void __101__ATXSingleSuggestionSessionTrackingContext__tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "%@ - marked session as completed: %@", (uint8_t *)&v6, 0x16u);
}

@end
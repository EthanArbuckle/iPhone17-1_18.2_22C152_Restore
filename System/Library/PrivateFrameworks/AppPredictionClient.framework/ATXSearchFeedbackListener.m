@interface ATXSearchFeedbackListener
- (ATXSearchFeedbackListener)init;
- (ATXSearchFeedbackListener)initWithTarget:(id)a3 spotlightUIBiomeStream:(id)a4 engagementRecordManager:(id)a5 actionClient:(id)a6 tracker:(id)a7;
- (BOOL)_isDuplicateEventWithState:(id *)a3 timestamp:(unint64_t)a4 method:(SEL)a5;
- (BOOL)shouldDebounce;
- (id)_suggestionSubTypeStringWithResultType:(int)a3;
- (id)bundleIdentifierFromResult:(id)a3;
- (void)_logAppPredictionsShown;
- (void)_logCAActionWithIdentifier:(id)a3 suggestion:(id)a4 eventType:(int64_t)a5;
- (void)_logCAActionWithIdentifiers:(id)a3 eventType:(int64_t)a4;
- (void)_resetState;
- (void)_sendSpotlightUIEvent:(id)a3;
- (void)_sendSpotlightUIStreamAppEngageWithFeedback:(id)a3;
- (void)_sendSpotlightUIStreamEventType:(int64_t)a3 searchResult:(id)a4;
- (void)_tryRemoveLockscreenActionPredictionMatchingSuggestion:(id)a3;
- (void)cardViewDidDisappear:(id)a3;
- (void)didEngageCardSection:(id)a3;
- (void)didEngageResult:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)didStartSearch:(id)a3;
- (void)logEngagedSpotlightActionSuggestion:(id)a3 contextActionIdentifier:(id)a4;
- (void)resultsDidBecomeVisible:(id)a3;
- (void)searchViewDidAppear:(id)a3;
- (void)searchViewDidDisappear:(id)a3;
- (void)sendUpdateNotification;
- (void)setShouldDebounce:(BOOL)a3;
- (void)writeSpotlightEvent:(id)a3 isViewAppearEvent:(BOOL)a4;
@end

@implementation ATXSearchFeedbackListener

- (ATXSearchFeedbackListener)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = +[ATXEngagementRecordManager sharedInstance];
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = [(ATXSearchFeedbackListener *)self initWithTarget:v3 spotlightUIBiomeStream:v4 engagementRecordManager:v5 actionClient:v6 tracker:v7];

  return v8;
}

- (ATXSearchFeedbackListener)initWithTarget:(id)a3 spotlightUIBiomeStream:(id)a4 engagementRecordManager:(id)a5 actionClient:(id)a6 tracker:(id)a7
{
  id v34 = a3;
  id v33 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v36.receiver = self;
  v36.super_class = (Class)ATXSearchFeedbackListener;
  v16 = [(ATXSearchFeedbackListener *)&v36 init];
  if (v16)
  {
    v17 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "ATXSFL SF: initializing ATXSearchFeedbackListener -- process likely just (re)started", buf, 2u);
    }

    objc_storeStrong((id *)&v16->_target, a3);
    objc_storeStrong((id *)&v16->_spotlightUIBiomeStream, a4);
    objc_storeStrong((id *)&v16->_engagementRecordManager, a5);
    objc_storeStrong((id *)&v16->_actionPredictionClient, a6);
    objc_storeStrong((id *)&v16->_tracker, a7);
    currentQuery = v16->_currentQuery;
    v16->_currentQuery = 0;

    v16->_didSearchDuringSession = 0;
    uint64_t v19 = objc_opt_new();
    visibleAppUUIDs = v16->_visibleAppUUIDs;
    v16->_visibleAppUUIDs = (NSMutableSet *)v19;

    uint64_t v21 = objc_opt_new();
    visibleActionUUIDs = v16->_visibleActionUUIDs;
    v16->_visibleActionUUIDs = (NSMutableSet *)v21;

    uint64_t v23 = objc_opt_new();
    visibleAppBundleIds = v16->_visibleAppBundleIds;
    v16->_visibleAppBundleIds = (NSMutableSet *)v23;

    uint64_t v25 = objc_opt_new();
    visibleActionContextIdentifiers = v16->_visibleActionContextIdentifiers;
    v16->_visibleActionContextIdentifiers = (NSMutableSet *)v25;

    currentResultCard = v16->_currentResultCard;
    v16->_currentResultCard = 0;

    v16->_hasSeenSearchViewDidAppear = 0;
    v16->_viewAppearEvent = 0;
    uint64_t v28 = objc_opt_new();
    queuedEvents = v16->_queuedEvents;
    v16->_queuedEvents = (NSMutableArray *)v28;

    *(_WORD *)&v16->_currentSessionHasEngagement = 0;
    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93730]), "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", @"AppPredictions", @"spotlightZkwStart", @"appPredictionsShown", 0, v33, v34);
    apAppPredictionsShownTracker = v16->_apAppPredictionsShownTracker;
    v16->_apAppPredictionsShownTracker = (PETGoalConversionEventTracker *)v30;
  }
  return v16;
}

- (void)_resetState
{
  currentQuery = self->_currentQuery;
  self->_currentQuery = 0;

  self->_didSearchDuringSession = 0;
  [(NSMutableSet *)self->_visibleAppUUIDs removeAllObjects];
  [(NSMutableSet *)self->_visibleActionUUIDs removeAllObjects];
  [(NSMutableSet *)self->_visibleAppBundleIds removeAllObjects];
  [(NSMutableSet *)self->_visibleActionContextIdentifiers removeAllObjects];
  currentResultCard = self->_currentResultCard;
  self->_currentResultCard = 0;

  appBlendingCacheId = self->_appBlendingCacheId;
  self->_appBlendingCacheId = 0;

  actionBlendingCacheId = self->_actionBlendingCacheId;
  self->_actionBlendingCacheId = 0;

  self->_hasSeenSearchViewDidAppear = 0;
  self->_viewAppearEvent = 0;
  queuedEvents = self->_queuedEvents;

  [(NSMutableArray *)queuedEvents removeAllObjects];
}

- (BOOL)_isDuplicateEventWithState:(id *)a3 timestamp:(unint64_t)a4 method:(SEL)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t var0 = a3->var0;
  a3->unint64_t var0 = a4;
  if (!self->_shouldDebounce) {
    return 0;
  }
  unint64_t v7 = a4 - var0;
  *(void *)v12 = 0;
  mach_timebase_info((mach_timebase_info_t)v12);
  unint64_t v8 = v7 * *(unsigned int *)v12 / *(unsigned int *)&v12[4];
  if (v8 >= 0x2FAF080) {
    return 0;
  }
  v9 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = NSStringFromSelector(a5);
    *(_DWORD *)v12 = 138412802;
    *(void *)&v12[4] = v10;
    __int16 v13 = 2048;
    unint64_t v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = 50000000;
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_INFO, "ATXSFL SF: %@ timestamp separation (in nanosec) of %llu < %llu -- ignoring duplicate event", v12, 0x20u);
  }
  return 1;
}

- (void)_logAppPredictionsShown
{
  BOOL v3 = [(NSMutableSet *)self->_visibleAppUUIDs count] != 0;
  apAppPredictionsShownTracker = self->_apAppPredictionsShownTracker;

  [(PETGoalConversionEventTracker *)apAppPredictionsShownTracker trackGoalOpportunityEventWithConversion:v3 propertyValues:0];
}

- (void)_tryRemoveLockscreenActionPredictionMatchingSuggestion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSFL: attempting to remove engaged action suggestion from lockscreen %@", (uint8_t *)&v6, 0xCu);
  }

  [(ATXActionPredictionClient *)self->_actionPredictionClient removeActionPredictionNotificationsMatchingSuggestion:v4 reply:0];
}

- (void)_logCAActionWithIdentifier:(id)a3 suggestion:(id)a4 eventType:(int64_t)a5
{
  uint64_t v8 = a3;
  id v9 = a4;
  if (v8 || (uint64_t v8 = [objc_alloc(MEMORY[0x1E4F938D8]) initWithProactiveSuggestion:v9]) != 0)
  {
    [(ATXSearchFeedbackListener *)self _logCAActionWithIdentifiers:v8 eventType:a5];
  }
  else
  {
    uint64_t v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXSearchFeedbackListener _logCAActionWithIdentifier:suggestion:eventType:](v9, v8);
    }
  }
}

- (void)_logCAActionWithIdentifiers:(id)a3 eventType:(int64_t)a4
{
  int v6 = (objc_class *)MEMORY[0x1E4F939B0];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = [v7 uniqueIdentifier];
  v10 = [v7 subtype];
  v11 = [v7 context];

  id v12 = (id)[v8 initWithType:a4 suggestionUniqueId:v9 suggestionType:@"action" suggestionSubtype:v10 suggestionContext:v11];
  [(ATXSearchFeedbackListener *)self _sendSpotlightUIEvent:v12];
}

- (void)writeSpotlightEvent:(id)a3 isViewAppearEvent:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    [(ATXSearchFeedbackListenerTarget *)self->_target writeSpotlightEvent:v6];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_queuedEvents;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[ATXSearchFeedbackListenerTarget writeSpotlightEvent:](self->_target, "writeSpotlightEvent:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(NSMutableArray *)self->_queuedEvents removeAllObjects];
    self->_hasSeenSearchViewDidAppear = 1;
  }
  else if (self->_hasSeenSearchViewDidAppear)
  {
    [(ATXSearchFeedbackListenerTarget *)self->_target writeSpotlightEvent:v6];
  }
  else
  {
    [(NSMutableArray *)self->_queuedEvents addObject:v6];
  }
}

- (void)sendUpdateNotification
{
}

- (void)searchViewDidAppear:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.searchViewDidAppear, [v5 timestamp], a2))
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [v5 viewAppearEvent];
      int v12 = [v5 isOnLockScreen];
      int v13 = [v5 isOverApp];
      long long v14 = "NO";
      int v16 = 134218754;
      uint64_t v17 = v11;
      if (v12) {
        long long v15 = "YES";
      }
      else {
        long long v15 = "NO";
      }
      __int16 v18 = 2112;
      id v19 = v5;
      if (v13) {
        long long v14 = "YES";
      }
      __int16 v20 = 2080;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      uint64_t v23 = v14;
      _os_log_debug_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: searchViewDidAppear, event:%lu, feedback:%@, isOnLockscreen:%s, isOverApp:%s", (uint8_t *)&v16, 0x2Au);
    }

    v6->_viewAppearEvent = [v5 viewAppearEvent];
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = +[ATXSpotlightEvent viewAppearedEventWithSFFeedback:v5 date:v8];

    [(ATXSearchFeedbackListener *)v6 writeSpotlightEvent:v9 isViewAppearEvent:1];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F939B0]) initWithType:6 suggestionUniqueId:0 suggestionType:0 suggestionSubtype:0 suggestionContext:0];
    [(ATXSearchFeedbackListener *)v6 _sendSpotlightUIEvent:v10];

    objc_sync_exit(v6);
  }
}

- (void)searchViewDidDisappear:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.searchViewDidDisappear, [v5 timestamp], a2))
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ATXSearchFeedbackListener searchViewDidDisappear:]((uint64_t)v5, (uint64_t)v11, [v5 viewDisappearEvent]);
    }

    BOOL didSearchDuringSession = v6->_didSearchDuringSession;
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = +[ATXSpotlightEvent viewDisappearedEventWithDidSearch:didSearchDuringSession date:v9];

    [(ATXSearchFeedbackListener *)v6 writeSpotlightEvent:v10 isViewAppearEvent:0];
    [(ATXSearchFeedbackListener *)v6 sendUpdateNotification];
    [(ATXSearchFeedbackListener *)v6 _logAppPredictionsShown];
    [(ATXSearchFeedbackListener *)v6 _resetState];
    v6->_previousSessionHadEngagement = v6->_currentSessionHasEngagement;
    v6->_currentSessionHasEngagement = 0;

    objc_sync_exit(v6);
  }
}

- (void)didStartSearch:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.didStartSearch, [v5 timestamp], a2))
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v5 triggerEvent];
      uint64_t v11 = [v5 input];
      int v12 = [v5 uuid];
      int v13 = 134218755;
      uint64_t v14 = v10;
      __int16 v15 = 2117;
      id v16 = v5;
      __int16 v17 = 2117;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      __int16 v20 = v12;
      _os_log_debug_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: didStartSearch, event:%lu, feedback:%{sensitive}@, input:%{sensitive}@, uuid:%@", (uint8_t *)&v13, 0x2Au);
    }
    uint64_t v8 = [v5 input];
    currentQuery = v6->_currentQuery;
    v6->_currentQuery = (NSString *)v8;

    if ([(NSString *)v6->_currentQuery length]) {
      v6->_BOOL didSearchDuringSession = 1;
    }
    objc_sync_exit(v6);
  }
}

- (void)resultsDidBecomeVisible:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(ATXSearchFeedbackListener *)self _isDuplicateEventWithState:&self->_debounce timestamp:[v5 timestamp] method:a2])
  {
    v45 = v5;
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v42 = [v5 triggerEvent];
      v43 = [v45 results];
      *(_DWORD *)info = 134218499;
      *(void *)&info[4] = v42;
      __int16 v60 = 2117;
      v61 = v45;
      __int16 v62 = 2117;
      v63 = v43;
      _os_log_debug_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: resultsDidBecomeVisible, event:%lu, feedback:%{sensitive}@, results:%{sensitive}@", info, 0x20u);
    }
    if (v6->_previousSessionHadEngagement
      && (uint64_t v8 = [v45 timestamp],
          unint64_t lastEventTimestamp = v6->_debounce.searchViewDidDisappear.lastEventTimestamp,
          *(void *)info = 0,
          mach_timebase_info((mach_timebase_info_t)info),
          (v8 - lastEventTimestamp) * *(unsigned int *)info / *(unsigned int *)&info[4] <= 0x2FAF07F))
    {
      v49 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        -[ATXSearchFeedbackListener resultsDidBecomeVisible:]();
      }
    }
    else
    {
      v49 = objc_opt_new();
      v46 = objc_opt_new();
      v48 = objc_opt_new();
      v47 = objc_opt_new();
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v10 = [v45 results];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v11)
      {
        uint64_t v51 = *(void *)v53;
        *(void *)&long long v12 = 138412546;
        long long v44 = v12;
        id obj = v10;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v53 != v51) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            -[ATXSearchFeedbackListener _sendSpotlightUIStreamEventType:searchResult:](v6, "_sendSpotlightUIStreamEventType:searchResult:", 3, v14, v44);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              id v16 = [v15 proactiveSuggestion];
              __int16 v17 = [v16 uuid];
              __int16 v18 = [v17 UUIDString];

              __int16 v19 = [v15 proactiveSuggestion];
              __int16 v20 = [v19 bundleIdExecutableObject];

              if (!v6->_appBlendingCacheId)
              {
                uint64_t v21 = [v15 response];
                __int16 v22 = [v21 blendingModelUICacheUpdateUUID];
                uint64_t v23 = [v22 UUIDString];
                appBlendingCacheId = v6->_appBlendingCacheId;
                v6->_appBlendingCacheId = (NSString *)v23;
              }
              if (([(NSMutableSet *)v6->_visibleAppUUIDs containsObject:v18] & 1) == 0) {
                [v49 addObject:v18];
              }
              if (([(NSMutableSet *)v6->_visibleAppBundleIds containsObject:v20] & 1) == 0) {
                [v48 addObject:v20];
              }

LABEL_39:
              goto LABEL_40;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              __int16 v18 = [v15 proactiveSuggestion];
              uint64_t v25 = [v18 uuid];
              v26 = [v25 UUIDString];

              v27 = [v15 contextActionIdentifier];
              if (!v27) {
                v27 = (void *)[objc_alloc(MEMORY[0x1E4F938D8]) initWithProactiveSuggestion:v18];
              }
              if (!v6->_actionBlendingCacheId)
              {
                uint64_t v28 = [v15 blendingModelUICacheUpdateUUID];
                uint64_t v29 = [v28 UUIDString];
                actionBlendingCacheId = v6->_actionBlendingCacheId;
                v6->_actionBlendingCacheId = (NSString *)v29;
              }
              if (v26 && ([(NSMutableSet *)v6->_visibleActionUUIDs containsObject:v26] & 1) == 0) {
                [v46 addObject:v26];
              }
              if (v27)
              {
                if (([(NSMutableSet *)v6->_visibleActionContextIdentifiers containsObject:v27] & 1) == 0)
                {
                  [v47 addObject:v27];
                  [(ATXSearchFeedbackListener *)v6 _logCAActionWithIdentifiers:v27 eventType:3];
                }
              }
              else
              {
                v35 = __atxlog_handle_blending();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  objc_super v36 = [v18 executableSpecification];
                  v37 = [v36 executableIdentifier];
                  *(_DWORD *)info = v44;
                  *(void *)&info[4] = v37;
                  __int16 v60 = 2112;
                  v61 = v18;
                  _os_log_error_impl(&dword_1A790D000, v35, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: nil: %@, %@", info, 0x16u);
                }
              }

              goto LABEL_39;
            }
            id v31 = objc_alloc(MEMORY[0x1E4F938D8]);
            v32 = [v14 requestedTopic];
            id v33 = [v14 sectionBundleIdentifier];
            id v15 = (id)[v31 initWithTopic:v32 sectionBundleIdentifier:v33];

            if (!v15)
            {
              __int16 v18 = __atxlog_handle_blending();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                id v34 = [v14 requestedTopic];
                -[ATXSearchFeedbackListener resultsDidBecomeVisible:](v34, buf, &v57, v18);
              }
              goto LABEL_39;
            }
            if (([(NSMutableSet *)v6->_visibleActionContextIdentifiers containsObject:v15] & 1) == 0)
            {
              [v47 addObject:v15];
              [(ATXSearchFeedbackListener *)v6 _logCAActionWithIdentifiers:v15 eventType:3];
            }
LABEL_40:
          }
          uint64_t v10 = obj;
          uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v11);
      }

      if ((v6->_appBlendingCacheId || v6->_actionBlendingCacheId)
        && (-[NSObject count](v49, "count") || [v46 count]))
      {
        v38 = v6->_appBlendingCacheId;
        v39 = v6->_actionBlendingCacheId;
        v40 = objc_opt_new();
        v41 = +[ATXSpotlightEvent suggestionsAppearedEventWithAppSuggestionIds:v49 actionSuggestionIds:v46 appBlendingCacheId:v38 actionBlendingCacheId:v39 date:v40];

        [(ATXSearchFeedbackListener *)v6 writeSpotlightEvent:v41 isViewAppearEvent:0];
        [(NSMutableSet *)v6->_visibleAppUUIDs addObjectsFromArray:v49];
        [(NSMutableSet *)v6->_visibleActionUUIDs addObjectsFromArray:v46];
        [(NSMutableSet *)v6->_visibleAppBundleIds addObjectsFromArray:v48];
      }
    }

    objc_sync_exit(v6);
    id v5 = v45;
  }
}

- (void)logEngagedSpotlightActionSuggestion:(id)a3 contextActionIdentifier:(id)a4
{
  actionBlendingCacheId = self->_actionBlendingCacheId;
  currentQuery = self->_currentQuery;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  id v11 = +[ATXSpotlightEvent actionSuggestionTappedEventWithSuggestion:v9 actionBlendingCacheId:actionBlendingCacheId currentQuery:currentQuery date:v10];

  [(ATXSearchFeedbackListener *)self writeSpotlightEvent:v11 isViewAppearEvent:0];
  [(ATXEngagementRecordManager *)self->_engagementRecordManager addEngagedSuggestion:v9 engagementRecordType:1];
  [(ATXSearchFeedbackListener *)self _tryRemoveLockscreenActionPredictionMatchingSuggestion:v9];
  +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:0 consumerSubType:21 tracker:self->_tracker];
  +[ATXBlendingCaptureRateTracker logSpotlightActionCaptureWithTracker:self->_tracker];
  +[ATXBlendingCaptureRateTracker logSpotlightAppDiversionWithCaptureType:2000 tracker:self->_tracker];
  [(ATXSearchFeedbackListener *)self _logCAActionWithIdentifier:v8 suggestion:v9 eventType:4];
}

- (void)didEngageResult:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.didEngageResult, [v5 timestamp], a2))
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v45 = [v5 triggerEvent];
      uint64_t v46 = [v5 destination];
      uint64_t v47 = [v5 actionTarget];
      int v48 = [v5 actionEngaged];
      int v49 = [v5 matchesUnengagedSuggestion];
      v50 = [v5 result];
      int v62 = 134219522;
      uint64_t v63 = v45;
      __int16 v64 = 2048;
      uint64_t v65 = v46;
      __int16 v66 = 2048;
      uint64_t v67 = v47;
      __int16 v68 = 1024;
      int v69 = v48;
      __int16 v70 = 1024;
      int v71 = v49;
      __int16 v72 = 2112;
      id v73 = v5;
      __int16 v74 = 2112;
      v75 = v50;
      _os_log_debug_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: didEngageResult, event:%lu, destination:%lu, actionTarget:%lu, actionEngaged:%{BOOL}d, matchedUnengagedSuggestion:%{BOOL}d, feedback:%@, result:%@", (uint8_t *)&v62, 0x40u);
    }
    if ([v5 triggerEvent] == 2
      && [v5 destination] == 2
      && ![v5 actionTarget])
    {
      id v8 = [v5 result];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v10 = [v5 result];
        id v11 = [v10 proactiveSuggestion];

        long long v12 = [v11 uuid];
        int v13 = [v12 UUIDString];

        uint64_t v14 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v11 bundleIdExecutableObject];
          int v62 = 138412290;
          uint64_t v63 = (uint64_t)v15;
          _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "ATXSFL: didEngageResult app bundle id: %@", (uint8_t *)&v62, 0xCu);
        }
        appBlendingCacheId = v6->_appBlendingCacheId;
        if (appBlendingCacheId)
        {
          currentQuery = v6->_currentQuery;
          __int16 v18 = objc_opt_new();
          __int16 v19 = +[ATXSpotlightEvent appSuggestionTappedEventWithSuggestion:v11 appBlendingCacheId:appBlendingCacheId currentQuery:currentQuery date:v18];

          [(ATXSearchFeedbackListener *)v6 writeSpotlightEvent:v19 isViewAppearEvent:0];
          [(ATXEngagementRecordManager *)v6->_engagementRecordManager addEngagedSuggestion:v11 engagementRecordType:1];
        }
        +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:0 consumerSubType:9 tracker:v6->_tracker];
        +[ATXBlendingCaptureRateTracker logSpotlightAppCaptureWithTracker:v6->_tracker];
        __int16 v20 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[ATXSearchFeedbackListener didEngageResult:]();
        }

LABEL_68:
LABEL_69:
        v6->_currentSessionHasEngagement = 1;
        objc_sync_exit(v6);

        goto LABEL_70;
      }
    }
    if ([v5 triggerEvent] == 2
      && [v5 destination] == 3
      && ![v5 actionTarget])
    {
      uint64_t v21 = [v5 result];
      objc_opt_class();
      char v22 = objc_opt_isKindOfClass();

      if (v22)
      {
        id v11 = [v5 result];
        uint64_t v23 = [v11 proactiveSuggestion];
        uint64_t v24 = [v23 uuid];
        uint64_t v25 = [v24 UUIDString];

        v26 = [v11 contextActionIdentifier];
        [(ATXSearchFeedbackListener *)v6 logEngagedSpotlightActionSuggestion:v23 contextActionIdentifier:v26];

        v27 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[ATXSearchFeedbackListener didEngageResult:]();
        }

        goto LABEL_68;
      }
    }
    if ([v5 triggerEvent] == 2
      && [v5 destination] == 2
      && ![v5 actionTarget])
    {
      uint64_t v28 = [v5 result];
      objc_opt_class();
      char v29 = objc_opt_isKindOfClass();

      if (v29)
      {
        uint64_t v30 = [v5 result];
        currentResultCard = v6->_currentResultCard;
        v6->_currentResultCard = (ATXSuggestionSearchResult *)v30;

        id v11 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[ATXSearchFeedbackListener didEngageResult:]();
        }
        goto LABEL_68;
      }
    }
    if ([v5 triggerEvent] == 5
      && [v5 destination] == 1
      && ![v5 actionTarget])
    {
      v32 = [v5 result];
      objc_opt_class();
      char v33 = objc_opt_isKindOfClass();

      if (v33)
      {
        uint64_t v34 = [v5 result];
        v35 = v6->_currentResultCard;
        v6->_currentResultCard = (ATXSuggestionSearchResult *)v34;

        id v11 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[ATXSearchFeedbackListener didEngageResult:].cold.4();
        }
        goto LABEL_68;
      }
    }
    if ([v5 triggerEvent] == 2
      && [v5 destination] == 1
      && ![v5 actionTarget])
    {
      objc_super v36 = [v5 result];
      objc_opt_class();
      char v37 = objc_opt_isKindOfClass();

      if (v37)
      {
        uint64_t v38 = [v5 result];
        v39 = v6->_currentResultCard;
        v6->_currentResultCard = (ATXSuggestionSearchResult *)v38;

        id v11 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[ATXSearchFeedbackListener didEngageResult:].cold.5();
        }
        goto LABEL_68;
      }
    }
    if ([v5 triggerEvent] != 2) {
      goto LABEL_69;
    }
    if ([v5 actionTarget]) {
      goto LABEL_69;
    }
    v40 = [v5 result];
    getSFSearchResult_SpotlightExtrasClass();
    char v41 = objc_opt_isKindOfClass();

    if ((v41 & 1) == 0) {
      goto LABEL_69;
    }
    id v11 = [v5 result];
    uint64_t v42 = [v11 applicationBundleIdentifier];
    if ([v11 predictionsFeedbackActionType] == 3)
    {
      id v43 = v42;
      if ([(NSMutableSet *)v6->_visibleActionUUIDs count]) {
        +[ATXBlendingCaptureRateTracker logSpotlightActionDiversionWithCaptureType:3001 tracker:v6->_tracker];
      }
      uint64_t v44 = 3;
      if (!v42)
      {
LABEL_63:
        long long v54 = 0;
        goto LABEL_65;
      }
    }
    else if ([v11 predictionsFeedbackActionType] == 1)
    {
      id v51 = v42;
      if ([(NSMutableSet *)v6->_visibleActionUUIDs count]) {
        +[ATXBlendingCaptureRateTracker logSpotlightActionDiversionWithCaptureType:3001 tracker:v6->_tracker];
      }
      uint64_t v44 = 1;
      if (!v42) {
        goto LABEL_63;
      }
    }
    else
    {
      if (![v42 length]
        || ([v42 hasPrefix:@"com.apple.other"] & 1) != 0
        || [v5 destination] != 2
        || ([v5 result],
            long long v55 = objc_claimAutoreleasedReturnValue(),
            [v55 sectionBundleIdentifier],
            v56 = objc_claimAutoreleasedReturnValue(),
            int v57 = [v56 isEqualToString:@"com.apple.application"],
            v56,
            v55,
            !v57))
      {
        long long v54 = 0;
        uint64_t v44 = 4;
        goto LABEL_65;
      }
      id v58 = v42;
      if ([(NSMutableSet *)v6->_visibleAppBundleIds count])
      {
        if ([(NSMutableSet *)v6->_visibleAppBundleIds containsObject:v58]) {
          uint64_t v59 = 2002;
        }
        else {
          uint64_t v59 = 2001;
        }
        +[ATXBlendingCaptureRateTracker logSpotlightAppDiversionWithCaptureType:v59 tracker:v6->_tracker];
      }
      uint64_t v44 = 4;
      if (!v42) {
        goto LABEL_63;
      }
    }
    long long v52 = objc_opt_new();
    long long v53 = +[ATXSpotlightEvent searchResultTappedWithEngagedBundleId:v42 searchedActionType:v44 date:v52];

    [(ATXSearchFeedbackListener *)v6 writeSpotlightEvent:v53 isViewAppearEvent:0];
    long long v54 = v42;
LABEL_65:
    __int16 v60 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      v61 = +[ATXActionPredictionTypes actionTypeToString:v44];
      -[ATXSearchFeedbackListener didEngageResult:].cold.6((uint64_t)v54, v61, (uint64_t)&v62, v60);
    }

    goto LABEL_68;
  }
LABEL_70:
}

- (void)cardViewDidDisappear:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXSearchFeedbackListener cardViewDidDisappear:]((uint64_t)v4, (uint64_t)v15, [v4 cardDisappearEvent]);
  }

  if (v5->_currentResultCard && v5->_appBlendingCacheId && v5->_actionBlendingCacheId)
  {
    if ([v4 cardDisappearEvent] == 7)
    {
      id v7 = [(ATXSuggestionSearchResult *)v5->_currentResultCard proactiveSuggestion];
      id v8 = [v7 uuid];
      id v9 = [v8 UUIDString];

      actionBlendingCacheId = v5->_actionBlendingCacheId;
      id v11 = objc_opt_new();
      long long v12 = +[ATXSpotlightEvent actionSuggestionDismissedEventWithSuggestionId:v9 actionBlendingCacheId:actionBlendingCacheId date:v11];

      [(ATXSearchFeedbackListener *)v5 writeSpotlightEvent:v12 isViewAppearEvent:0];
      [(ATXEngagementRecordManager *)v5->_engagementRecordManager addEngagedSuggestion:v7 engagementRecordType:1];
      [(ATXSearchFeedbackListener *)v5 _tryRemoveLockscreenActionPredictionMatchingSuggestion:v7];
      +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:1 consumerSubType:21 tracker:v5->_tracker];
      int v13 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ATXSearchFeedbackListener cardViewDidDisappear:]();
      }
    }
    else
    {
      id v7 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[ATXSearchFeedbackListener cardViewDidDisappear:]();
      }
    }

    currentResultCard = v5->_currentResultCard;
    v5->_currentResultCard = 0;
  }
  objc_sync_exit(v5);
}

- (void)didEngageCardSection:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.didEngageCardSection, [v5 timestamp], a2))
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = [v5 triggerEvent];
      v26 = [v5 destination];
      int v28 = 134219010;
      uint64_t v29 = v25;
      __int16 v30 = 2112;
      id v31 = v5;
      __int16 v32 = 2112;
      char v33 = v26;
      __int16 v34 = 2048;
      uint64_t v35 = [v5 actionCardType];
      __int16 v36 = 2048;
      uint64_t v37 = [v5 actionTarget];
      _os_log_debug_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: didEngageCardSection, event:%lu, feedback:%@, destination:%@, actionCardType:%lu, actionTarget:%lu", (uint8_t *)&v28, 0x34u);
    }
    if ([v5 triggerEvent] == 2
      && ![v5 actionCardType]
      && ([v5 destination], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0)
      && (BOOL v15 = [v5 actionTarget] == 0, v14, v15))
    {
      id v8 = [(ATXSuggestionSearchResult *)v6->_currentResultCard proactiveSuggestion];
      id v16 = [v8 uuid];
      __int16 v17 = [v16 UUIDString];

      currentResultCard = v6->_currentResultCard;
      if (!currentResultCard) {
        goto LABEL_22;
      }
      if (!v6->_appBlendingCacheId) {
        goto LABEL_21;
      }
      actionBlendingCacheId = v6->_actionBlendingCacheId;
      if (!actionBlendingCacheId) {
        goto LABEL_21;
      }
      currentQuery = v6->_currentQuery;
      uint64_t v21 = objc_opt_new();
      char v22 = +[ATXSpotlightEvent actionSuggestionTappedEventWithSuggestion:v8 actionBlendingCacheId:actionBlendingCacheId currentQuery:currentQuery date:v21];

      [(ATXSearchFeedbackListener *)v6 writeSpotlightEvent:v22 isViewAppearEvent:0];
      [(ATXEngagementRecordManager *)v6->_engagementRecordManager addEngagedSuggestion:v8 engagementRecordType:1];
      [(ATXSearchFeedbackListener *)v6 _tryRemoveLockscreenActionPredictionMatchingSuggestion:v8];
      +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:0 consumerSubType:21 tracker:v6->_tracker];
      +[ATXBlendingCaptureRateTracker logSpotlightActionCaptureWithTracker:v6->_tracker];
      +[ATXBlendingCaptureRateTracker logSpotlightAppDiversionWithCaptureType:2000 tracker:v6->_tracker];

      currentResultCard = v6->_currentResultCard;
      if (!currentResultCard)
      {
LABEL_22:
        uint64_t v24 = 0;
      }
      else
      {
LABEL_21:
        uint64_t v23 = [(ATXSuggestionSearchResult *)currentResultCard contextActionIdentifier];
        [(ATXSearchFeedbackListener *)v6 _logCAActionWithIdentifier:v23 suggestion:v8 eventType:4];

        uint64_t v24 = v6->_currentResultCard;
      }
      v6->_currentResultCard = 0;

      v27 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[ATXSearchFeedbackListener didEngageCardSection:]();
      }
    }
    else
    {
      if ([v5 triggerEvent] != 2 || objc_msgSend(v5, "actionCardType") != 1) {
        goto LABEL_27;
      }
      id v8 = [v5 destination];
      if (!v8)
      {
        if ([v5 actionTarget])
        {
LABEL_27:
          objc_sync_exit(v6);

          goto LABEL_28;
        }
        id v9 = v6->_currentResultCard;
        if (v9)
        {
          uint64_t v10 = [(ATXSuggestionSearchResult *)v9 contextActionIdentifier];
          [(ATXSearchFeedbackListener *)v6 _logCAActionWithIdentifier:v10 suggestion:0 eventType:4];
        }
        id v11 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          long long v12 = [(ATXSuggestionSearchResult *)v6->_currentResultCard contextActionIdentifier];
          int v13 = [v12 uniqueIdentifier];
          -[ATXSearchFeedbackListener didEngageCardSection:](v13, (uint8_t *)&v28, v11, v12);
        }

        id v8 = v6->_currentResultCard;
        v6->_currentResultCard = 0;
      }
    }

    goto LABEL_27;
  }
LABEL_28:
}

- (void)didPerformCommand:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = (ATXSpotlightFeedbackManager *)a3;
  id v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ATXSpotlightFeedbackManager *)v4 command];
    int v40 = 138412290;
    char v41 = v6;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSFL: didPerformCommand ---> %@", (uint8_t *)&v40, 0xCu);
  }
  [(ATXSearchFeedbackListener *)self _sendSpotlightUIStreamAppEngageWithFeedback:v4];
  id v7 = [(ATXSpotlightFeedbackManager *)v4 result];
  [(ATXSearchFeedbackListener *)self _sendSpotlightUIStreamEventType:4 searchResult:v7];
  id v8 = [(ATXSpotlightFeedbackManager *)v4 command];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(ATXSpotlightFeedbackManager *)v4 command];
    id v11 = [(ATXSearchFeedbackListener *)self bundleIdentifierFromResult:v7];
    long long v12 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 138412290;
      char v41 = v11;
      _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "ATXSFL: bundleId ---> %@", (uint8_t *)&v40, 0xCu);
    }

    int v13 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v7 identifier];
      int v40 = 138412290;
      char v41 = v14;
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "ATXSFL: searchResultIdentifier ---> %@", (uint8_t *)&v40, 0xCu);
    }
    BOOL v15 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v10 category];
      int v40 = 67109120;
      LODWORD(v41) = v16;
      _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "ATXSFL: category ---> %d", (uint8_t *)&v40, 8u);
    }

    __int16 v17 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v10 proactiveIdentifier];
      int v40 = 138412290;
      char v41 = v18;
      _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "ATXSFL: proactiveIdentifier ---> %@", (uint8_t *)&v40, 0xCu);
    }
    __int16 v19 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = [v10 shouldClearWholeSection];
      int v40 = 67109120;
      LODWORD(v41) = v20;
      _os_log_impl(&dword_1A790D000, v19, OS_LOG_TYPE_DEFAULT, "ATXSFL: shouldClearWholeSection ---> %{BOOL}d", (uint8_t *)&v40, 8u);
    }

    uint64_t v21 = objc_alloc_init(ATXSpotlightFeedbackManager);
    switch([v10 category])
    {
      case 0u:
        uint64_t v25 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = [v10 category];
          int v40 = 67109120;
          LODWORD(v41) = v26;
          _os_log_impl(&dword_1A790D000, v25, OS_LOG_TYPE_DEFAULT, "ATXSFL: no hiding action for category %d", (uint8_t *)&v40, 8u);
        }
        goto LABEL_31;
      case 1u:
      case 2u:
        int v22 = [v10 shouldClearWholeSection];
        uint64_t v23 = __atxlog_handle_zkw_hide();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            int v40 = 138412290;
            char v41 = v11;
            _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "ATXSFL: User disabled all shortcut suggestions from bundleId: %@", (uint8_t *)&v40, 0xCu);
          }

          [(ATXSpotlightFeedbackManager *)v21 addHiddenAutoShortcutIdentifier:v11];
        }
        else
        {
          if (v24)
          {
            uint64_t v29 = [v7 identifier];
            int v40 = 138412290;
            char v41 = v29;
            _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "ATXSFL: User has hidden auto shortcut with signature: %@. Will not show this specific shortcut suggestion", (uint8_t *)&v40, 0xCu);
          }
          uint64_t v25 = [v7 identifier];
          __int16 v30 = [(ATXSpotlightFeedbackManager *)v11 stringByAppendingString:v25];
          [(ATXSpotlightFeedbackManager *)v21 addHiddenAutoShortcutIdentifier:v30];

LABEL_31:
        }
LABEL_32:
        id v31 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v32 = [v10 proactiveIdentifier];
          int v40 = 138412546;
          char v41 = v21;
          __int16 v42 = 2112;
          id v43 = v32;
          _os_log_impl(&dword_1A790D000, v31, OS_LOG_TYPE_DEFAULT, "ATXSFL: feedbackManager %@ addHiddenActionExecutableIdentifier %@", (uint8_t *)&v40, 0x16u);
        }
        break;
      case 3u:
        uint64_t v25 = [v10 proactiveIdentifier];
        [(ATXSpotlightFeedbackManager *)v21 addHiddenContextIdentifier:v25];
        goto LABEL_31;
      case 6u:
        v27 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = [v10 category];
          int v40 = 67109120;
          LODWORD(v41) = v28;
          _os_log_impl(&dword_1A790D000, v27, OS_LOG_TYPE_DEFAULT, "ATXSFL: hiding app suggestion for category %d", (uint8_t *)&v40, 8u);
        }

        if (![v7 isLocalApplicationResult]) {
          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_32;
        }
        uint64_t v25 = [v7 proactiveSuggestion];
        [(ATXSpotlightFeedbackManager *)v21 addHiddenAppSuggestionBundleIdentifier:v25];
        goto LABEL_31;
      default:
        uint64_t v25 = [v10 proactiveIdentifier];
        [(ATXSpotlightFeedbackManager *)v21 addHiddenActionExecutableIdentifier:v25];
        goto LABEL_31;
    }
  }
  char v33 = [(ATXSpotlightFeedbackManager *)v4 result];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v34 = v33;
    uint64_t v35 = [v34 proactiveSuggestion];
    __int16 v36 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [v35 uiSpecification];
      uint64_t v38 = [v37 title];
      int v40 = 138413058;
      char v41 = v4;
      __int16 v42 = 2112;
      id v43 = v34;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v38;
      __int16 v46 = 2112;
      uint64_t v47 = v35;
      _os_log_impl(&dword_1A790D000, v36, OS_LOG_TYPE_DEFAULT, "didPerformCommand ---> %@ result = %@ suggestion (%@) = %@", (uint8_t *)&v40, 0x2Au);
    }
  }
  else
  {
    __int16 v34 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = objc_opt_class();
      int v40 = 138412802;
      char v41 = v4;
      __int16 v42 = 2112;
      id v43 = v33;
      __int16 v44 = 2112;
      uint64_t v45 = v39;
      _os_log_impl(&dword_1A790D000, v34, OS_LOG_TYPE_DEFAULT, "didPerformCommand ---> %@ result = %@ class = %@", (uint8_t *)&v40, 0x20u);
    }
  }
}

- (void)_sendSpotlightUIStreamAppEngageWithFeedback:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 command];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 result];
      id v9 = [v8 sectionBundleIdentifier];
      int v22 = 138412290;
      uint64_t v23 = (uint64_t)v9;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXSFL: sendSpotlightUIStreamAppEngageWithFeedback commandEngagementFeedback.result.sectionBundleIdentifier ='%@'", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v10 = [v4 result];
    id v11 = [v10 sectionBundleIdentifier];
    int v12 = [v11 isEqualToString:@"com.apple.searchd.zkw.apps"];

    int v13 = [v4 command];
    uint64_t v14 = [v13 applicationBundleIdentifier];
    if ([v14 length])
    {
      if (v12) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = 5;
      }
      int v16 = (void *)[objc_alloc(MEMORY[0x1E4F939B0]) initWithType:v15 suggestionUniqueId:v14 suggestionType:@"app" suggestionSubtype:0 suggestionContext:0];
      __int16 v17 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v16 eventType];
        __int16 v19 = [v16 suggestionType];
        int v20 = [v16 suggestionSubtype];
        uint64_t v21 = [v16 suggestionUniqueId];
        int v22 = 134218754;
        uint64_t v23 = v18;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        v27 = v20;
        __int16 v28 = 2112;
        uint64_t v29 = v21;
        _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "ATXSFL: uiEvent type%ld: %@ %@ %@", (uint8_t *)&v22, 0x2Au);
      }
      [(ATXSearchFeedbackListener *)self _sendSpotlightUIEvent:v16];
    }
  }
}

- (void)_sendSpotlightUIEvent:(id)a3
{
  id v4 = a3;
  p_viewAppearEvent = (uint64_t *)&self->_viewAppearEvent;
  if ((self->_viewAppearEvent | 8) == 0x1E)
  {
    [(ATXSpotlightUIBiomeStream *)self->_spotlightUIBiomeStream sendEvent:v4];
  }
  else
  {
    id v6 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(ATXSearchFeedbackListener *)p_viewAppearEvent _sendSpotlightUIEvent:v6];
    }
  }
}

- (void)_sendSpotlightUIStreamEventType:(int64_t)a3 searchResult:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 sectionBundleIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.spotlight.dec.zkw.recents"];

  if (v8)
  {
    id v9 = NSString;
    uint64_t v10 = [v6 identifier];
    id v11 = objc_msgSend(v9, "stringWithFormat:", @"%lu", objc_msgSend(v10, "hash"));

    int v12 = -[ATXSearchFeedbackListener _suggestionSubTypeStringWithResultType:](self, "_suggestionSubTypeStringWithResultType:", [v6 type]);
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F939B0]) initWithType:a3 suggestionUniqueId:v11 suggestionType:@"recent" suggestionSubtype:v12 suggestionContext:0];
    uint64_t v14 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 eventType];
      int v16 = [v13 suggestionType];
      __int16 v17 = [v13 suggestionSubtype];
      uint64_t v18 = [v13 suggestionUniqueId];
      *(_DWORD *)buf = 134218754;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      int v22 = v16;
      __int16 v23 = 2112;
      __int16 v24 = v17;
      __int16 v25 = 2112;
      __int16 v26 = v18;
      _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "ATXSFL: uiEvent type%ld: %@ %@ %@", buf, 0x2Au);
    }
    [(ATXSearchFeedbackListener *)self _sendSpotlightUIEvent:v13];
  }
}

- (id)_suggestionSubTypeStringWithResultType:(int)a3
{
  if (a3 > 0x27) {
    return 0;
  }
  else {
    return off_1E5D0A178[a3];
  }
}

- (id)bundleIdentifierFromResult:(id)a3
{
  id v3 = a3;
  getSFSearchResult_SpotlightExtrasClass();
  if (objc_opt_isKindOfClass()) {
    [v3 relatedAppIdentifier];
  }
  else {
  id v4 = [v3 applicationBundleIdentifier];
  }

  return v4;
}

- (BOOL)shouldDebounce
{
  return self->_shouldDebounce;
}

- (void)setShouldDebounce:(BOOL)a3
{
  self->_shouldDebounce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedEvents, 0);
  objc_storeStrong((id *)&self->_actionBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_appBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_currentResultCard, 0);
  objc_storeStrong((id *)&self->_visibleActionContextIdentifiers, 0);
  objc_storeStrong((id *)&self->_visibleAppBundleIds, 0);
  objc_storeStrong((id *)&self->_visibleAppUUIDs, 0);
  objc_storeStrong((id *)&self->_visibleActionUUIDs, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_actionPredictionClient, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_apAppPredictionsShownTracker, 0);
  objc_storeStrong((id *)&self->_spotlightUIBiomeStream, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

- (void)_logCAActionWithIdentifier:(void *)a1 suggestion:(NSObject *)a2 eventType:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 executableSpecification];
  id v5 = [v4 executableIdentifier];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2112;
  int v8 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: nil: %@, %@", v6, 0x16u);
}

- (void)searchViewDidDisappear:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_6(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_4_5(&dword_1A790D000, "ATXSFL SF: searchViewDidDisappear, event:%lu, feedback:%@", v3, v4);
}

- (void)resultsDidBecomeVisible:(void *)a3 .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: nil topic: %@", buf, 0xCu);
}

- (void)resultsDidBecomeVisible:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v2 = 2048;
  uint64_t v3 = 50000000;
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "ATXSFL SF: resultsDidBecomeVisible handling was SKIPPED because previous session had engagement and within time interval of previous searchViewDidDisappear - separationNanosec: %llu, separationMax: %llu", v1, 0x16u);
}

- (void)didEngageResult:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXSFL: handled app prediction tap of uuid: %@", v2, v3, v4, v5, v6);
}

- (void)didEngageResult:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXSFL: handled action prediction engagement via JR running UI with uuid: %@", v2, v3, v4, v5, v6);
}

- (void)didEngageResult:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "ATXSFL: handled action prediction NSUA or non-bg intent engagement", v2, v3, v4, v5, v6);
}

- (void)didEngageResult:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "ATXSFL: handled user orb on action prediction card", v2, v3, v4, v5, v6);
}

- (void)didEngageResult:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "ATXSFL: handled action prediction tap on bg-exec intent, bringing up the platter", v2, v3, v4, v5, v6);
}

- (void)didEngageResult:(uint64_t)a3 .cold.6(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_5(&dword_1A790D000, "ATXSFL: handled engagement via search with engagedBundleId: %@ searchedActionType: %@", (uint8_t *)a3, a4);
}

- (void)cardViewDidDisappear:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXSFL: handled action prediction explicit dismissal with uuid: %@", v2, v3, v4, v5, v6);
}

- (void)cardViewDidDisappear:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "ATXSFL: handled action card close", v2, v3, v4, v5, v6);
}

- (void)cardViewDidDisappear:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_6(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_4_5(&dword_1A790D000, "ATXSFL SF: cardViewDidDisappear, event:%lu, feedback:%@", v3, v4);
}

- (void)didEngageCardSection:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEBUG, "ATXSFL: handled action prediction engagement on card with identifier: %@", buf, 0xCu);
}

- (void)didEngageCardSection:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXSFL: handled action prediction engagement on card with uuid: %@", v2, v3, v4, v5, v6);
}

- (void)_sendSpotlightUIEvent:(NSObject *)a3 .cold.1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *a1;
  uint8_t v6 = objc_msgSend(MEMORY[0x1E4F939B0], "stringForATXSpotlightUIEventType:", objc_msgSend(a2, "eventType"));
  uint64_t v7 = [a2 eventType];
  int v8 = [a2 suggestionType];
  uint64_t v9 = [a2 suggestionUniqueId];
  uint64_t v10 = [a2 suggestionSubtype];
  id v11 = [a2 suggestionContext];
  int v12 = 134219522;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = v6;
  __int16 v16 = 2048;
  uint64_t v17 = v7;
  __int16 v18 = 2112;
  __int16 v19 = v8;
  __int16 v20 = 2112;
  __int16 v21 = v9;
  __int16 v22 = 2112;
  __int16 v23 = v10;
  __int16 v24 = 2112;
  __int16 v25 = v11;
  _os_log_debug_impl(&dword_1A790D000, a3, OS_LOG_TYPE_DEBUG, "SKIP type %lu: %@ - ATXSpotlightUIEvent\n\teventType: %lu\n\tsuggestionType: %@\n\tsuggestionUniqueId: %@\n\tsuggestionSubtype: %@\n\tsuggestionContext: %@", (uint8_t *)&v12, 0x48u);
}

@end
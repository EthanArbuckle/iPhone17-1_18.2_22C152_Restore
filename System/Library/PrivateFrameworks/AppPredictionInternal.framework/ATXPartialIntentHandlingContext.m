@interface ATXPartialIntentHandlingContext
+ (BOOL)supportsSecureCoding;
- (ATXAction)matchingAppSessionDonatedAction;
- (ATXAction)partiallyExecutedAction;
- (ATXAction)shortcutsRuntimeDonatedAction;
- (ATXPartialIntentHandlingContext)init;
- (ATXPartialIntentHandlingContext)initWithCoder:(id)a3;
- (ATXPartialIntentHandlingContext)initWithFeedbackResults:(id)a3 partiallyExecutedAction:(id)a4 partiallyExecutedActionStartDate:(id)a5 currentApp:(id)a6 currentAppSessionStartDate:(id)a7 shortcutsRuntimeDonatedAction:(id)a8 shortcutsRuntimeDonationDate:(id)a9 matchingAppSessionDonatedAction:(id)a10 matchingAppSessionDonationDate:(id)a11;
- (BOOL)_isCompleteEngagementForATXAction:(id)a3 withMatchingDonatedAction:(id)a4;
- (BOOL)_isPartialEngagementForATXAction:(id)a3 withMatchingDonatedAction:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPartialIntentHandlingContext:(id)a3;
- (NSArray)feedbackResults;
- (NSDate)currentAppSessionStartDate;
- (NSDate)matchingAppSessionDonationDate;
- (NSDate)partiallyExecutedActionStartDate;
- (NSDate)shortcutsRuntimeDonationDate;
- (NSString)currentApp;
- (id)_partiallyExecutedSuggestionFromFeedbackResult:(id)a3;
- (id)atxActionFromIntentEvent:(id)a3;
- (id)handleAppLaunchAndReturnCompletedResults:(id)a3;
- (id)handleNewFeedbackResultAndReturnCompletedResults:(id)a3;
- (id)handleNewIntentEventAndReturnCompletedResults:(id)a3;
- (unint64_t)hash;
- (void)_resetInternalState;
- (void)_tryUpdateMatchingAppSessionDonatedAction:(id)a3 eventDate:(id)a4;
- (void)_tryUpdatePartialIntentSessionState;
- (void)_tryUpdateShortcutsRuntimeDonatedAction:(id)a3 eventDate:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXPartialIntentHandlingContext

- (ATXPartialIntentHandlingContext)init
{
  v3 = objc_opt_new();
  v4 = [(ATXPartialIntentHandlingContext *)self initWithFeedbackResults:v3 partiallyExecutedAction:0 partiallyExecutedActionStartDate:0 currentApp:0 currentAppSessionStartDate:0 shortcutsRuntimeDonatedAction:0 shortcutsRuntimeDonationDate:0 matchingAppSessionDonatedAction:0 matchingAppSessionDonationDate:0];

  return v4;
}

- (ATXPartialIntentHandlingContext)initWithFeedbackResults:(id)a3 partiallyExecutedAction:(id)a4 partiallyExecutedActionStartDate:(id)a5 currentApp:(id)a6 currentAppSessionStartDate:(id)a7 shortcutsRuntimeDonatedAction:(id)a8 shortcutsRuntimeDonationDate:(id)a9 matchingAppSessionDonatedAction:(id)a10 matchingAppSessionDonationDate:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)ATXPartialIntentHandlingContext;
  v19 = [(ATXPartialIntentHandlingContext *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_feedbackResults, a3);
    objc_storeStrong((id *)&v20->_partiallyExecutedAction, a4);
    objc_storeStrong((id *)&v20->_partiallyExecutedActionStartDate, a5);
    objc_storeStrong((id *)&v20->_currentApp, a6);
    objc_storeStrong((id *)&v20->_currentAppSessionStartDate, a7);
    objc_storeStrong((id *)&v20->_shortcutsRuntimeDonatedAction, a8);
    objc_storeStrong((id *)&v20->_shortcutsRuntimeDonationDate, a9);
    objc_storeStrong((id *)&v20->_matchingAppSessionDonatedAction, a10);
    objc_storeStrong((id *)&v20->_matchingAppSessionDonationDate, a11);
  }

  return v20;
}

- (id)handleNewFeedbackResultAndReturnCompletedResults:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXPartialIntentHandlingContext handleNewFeedbackResultAndReturnCompletedResults:].cold.4();
  }

  v6 = [(ATXPartialIntentHandlingContext *)self _partiallyExecutedSuggestionFromFeedbackResult:v4];
  uint64_t v7 = [v6 atxActionExecutableObject];
  v8 = (void *)v7;
  if (v6)
  {
    id obj = (id)v7;
    id v28 = v6;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v9 = self->_feedbackResults;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v12 = 0;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = [*(id *)(*((void *)&v29 + 1) + 8 * i) session];
          v16 = [v4 session];
          char v17 = [v15 isEqual:v16];

          if ((v17 & 1) == 0)
          {
            [(ATXPartialIntentHandlingContext *)self _tryUpdatePartialIntentSessionState];
            uint64_t v18 = [(NSMutableArray *)self->_feedbackResults copy];

            [(ATXPartialIntentHandlingContext *)self _resetInternalState];
            v19 = __atxlog_handle_blending_ecosystem();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
              -[ATXPartialIntentHandlingContext handleNewFeedbackResultAndReturnCompletedResults:](v33, (uint64_t)self, &v34, v19);
            }

            v12 = (void *)v18;
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v20 = [[ATXProactiveSuggestionPartialIntentResultWrapper alloc] initWithUIFeedbackResult:v4];
    v6 = v28;
    [(ATXProactiveSuggestionPartialIntentResultWrapper *)v20 updatePartiallyExecutedActionWithProactiveSuggestion:v28];
    [(NSMutableArray *)self->_feedbackResults addObject:v20];
    v8 = obj;
    objc_storeStrong((id *)&self->_partiallyExecutedAction, obj);
    id v22 = [v4 session];
    id v23 = [v22 sessionEndDate];
    partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
    self->_partiallyExecutedActionStartDate = v23;

    id v25 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[ATXPartialIntentHandlingContext handleNewFeedbackResultAndReturnCompletedResults:]();
    }
  }
  else
  {
    [(ATXPartialIntentHandlingContext *)self _tryUpdatePartialIntentSessionState];
    v20 = (ATXProactiveSuggestionPartialIntentResultWrapper *)[(NSMutableArray *)self->_feedbackResults mutableCopy];
    [(ATXPartialIntentHandlingContext *)self _resetInternalState];
    [(ATXProactiveSuggestionPartialIntentResultWrapper *)v20 addObject:v4];
    v21 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[ATXPartialIntentHandlingContext handleNewFeedbackResultAndReturnCompletedResults:]();
    }

    v12 = (void *)[(ATXProactiveSuggestionPartialIntentResultWrapper *)v20 copy];
  }

  return v12;
}

- (id)handleAppLaunchAndReturnCompletedResults:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(ATXPartialIntentHandlingContext *)(uint64_t)self handleAppLaunchAndReturnCompletedResults:v5];
  }

  v6 = [v4 absoluteTimestamp];
  uint64_t v7 = [v4 bundleID];
  char v8 = [v7 isEqualToString:@"com.apple.springboard.today-view"];

  if (![v4 starting] || (v8 & 1) != 0)
  {
    currentApp = self->_currentApp;
    double v14 = 0.0;
    if (currentApp && self->_currentAppSessionStartDate)
    {
      v12 = [v4 bundleID];
      [v6 timeIntervalSinceDate:self->_currentAppSessionStartDate];
      double v14 = v16;
      currentApp = self->_currentApp;
    }
    else
    {
      v12 = 0;
    }
    self->_currentApp = 0;

    currentAppSessionStartDate = self->_currentAppSessionStartDate;
    self->_currentAppSessionStartDate = 0;
  }
  else
  {
    v9 = [v4 bundleID];
    uint64_t v10 = self->_currentApp;
    self->_currentApp = v9;

    uint64_t v11 = v6;
    v12 = 0;
    currentAppSessionStartDate = self->_currentAppSessionStartDate;
    self->_currentAppSessionStartDate = v11;
    double v14 = 0.0;
  }

  char v17 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:]();
  }

  if (!self->_partiallyExecutedAction) {
    goto LABEL_26;
  }
  if (v12 && ([v12 isEqualToString:@"com.apple.shortcuts.runtime"] & 1) == 0 && v14 < 1.0)
  {
    matchingAppSessionDonatedAction = self->_matchingAppSessionDonatedAction;
    self->_matchingAppSessionDonatedAction = 0;

    matchingAppSessionDonationDate = self->_matchingAppSessionDonationDate;
    self->_matchingAppSessionDonationDate = 0;

    v20 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v28 = (objc_class *)objc_opt_class();
      long long v29 = NSStringFromClass(v28);
      int v30 = 138412802;
      long long v31 = v29;
      __int16 v32 = 2112;
      v33 = v12;
      __int16 v34 = 2048;
      double v35 = v14;
      _os_log_debug_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEBUG, "%@ - clearing any existing matching donations for short app session with bundleId %@, length: %f", (uint8_t *)&v30, 0x20u);
    }
  }
  [v6 timeIntervalSinceDate:self->_partiallyExecutedActionStartDate];
  if (v21 > 300.0)
  {
    [(ATXPartialIntentHandlingContext *)self _tryUpdatePartialIntentSessionState];
    id v22 = (void *)[(NSMutableArray *)self->_feedbackResults copy];
    [(ATXPartialIntentHandlingContext *)self _resetInternalState];
    id v23 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:]();
    }
    goto LABEL_29;
  }
  id v23 = [v4 bundleID];
  if (([v23 isEqualToString:@"com.apple.shortcuts.runtime"] & 1) == 0)
  {
    id v24 = [(ATXAction *)self->_partiallyExecutedAction bundleId];
    id v25 = [v4 bundleID];
    char v26 = [v24 isEqualToString:v25];

    if ((v26 & 1) == 0)
    {
      [(ATXPartialIntentHandlingContext *)self _tryUpdatePartialIntentSessionState];
      id v22 = (void *)[(NSMutableArray *)self->_feedbackResults copy];
      [(ATXPartialIntentHandlingContext *)self _resetInternalState];
      id v23 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:]();
      }
      goto LABEL_29;
    }
LABEL_26:
    id v22 = 0;
    goto LABEL_30;
  }
  id v22 = 0;
LABEL_29:

LABEL_30:
  return v22;
}

- (id)handleNewIntentEventAndReturnCompletedResults:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    char v8 = [v4 bundleID];
    v9 = [v4 intentClass];
    uint64_t v10 = [v4 absoluteTimestamp];
    int v25 = 138413058;
    char v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    int v30 = v9;
    __int16 v31 = 2112;
    __int16 v32 = v10;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - got intent event with bundleId: %@ class: %@ date: %@", (uint8_t *)&v25, 0x2Au);
  }
  uint64_t v11 = [v4 absoluteTimestamp];
  v12 = v11;
  if (self->_partiallyExecutedAction)
  {
    [v11 timeIntervalSinceDate:self->_partiallyExecutedActionStartDate];
    if (v13 <= 18000.0)
    {
      double v16 = [(ATXAction *)self->_partiallyExecutedAction bundleId];
      char v17 = [v4 bundleID];
      char v18 = [v16 isEqualToString:v17];

      if (v18)
      {
        currentApp = self->_currentApp;
        BOOL v20 = [(NSString *)currentApp isEqualToString:@"com.apple.shortcuts.runtime"];
        double v21 = self->_currentApp;
        id v22 = [(ATXAction *)self->_partiallyExecutedAction bundleId];
        BOOL v23 = [(NSString *)v21 isEqualToString:v22];

        v15 = [(ATXPartialIntentHandlingContext *)self atxActionFromIntentEvent:v4];
        if (currentApp)
        {
          if (v20)
          {
            [(ATXPartialIntentHandlingContext *)self _tryUpdateShortcutsRuntimeDonatedAction:v15 eventDate:v12];
          }
          else if (v23)
          {
            [(ATXPartialIntentHandlingContext *)self _tryUpdateMatchingAppSessionDonatedAction:v15 eventDate:v12];
          }
        }
        double v14 = 0;
      }
      else
      {
        [(ATXPartialIntentHandlingContext *)self _tryUpdatePartialIntentSessionState];
        double v14 = (void *)[(NSMutableArray *)self->_feedbackResults copy];
        [(ATXPartialIntentHandlingContext *)self _resetInternalState];
        v15 = __atxlog_handle_blending_ecosystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[ATXPartialIntentHandlingContext handleNewIntentEventAndReturnCompletedResults:]();
        }
      }
    }
    else
    {
      [(ATXPartialIntentHandlingContext *)self _tryUpdatePartialIntentSessionState];
      double v14 = (void *)[(NSMutableArray *)self->_feedbackResults copy];
      [(ATXPartialIntentHandlingContext *)self _resetInternalState];
      v15 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:]();
      }
    }
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (void)_resetInternalState
{
  [(NSMutableArray *)self->_feedbackResults removeAllObjects];
  partiallyExecutedAction = self->_partiallyExecutedAction;
  self->_partiallyExecutedAction = 0;

  partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
  self->_partiallyExecutedActionStartDate = 0;

  shortcutsRuntimeDonatedAction = self->_shortcutsRuntimeDonatedAction;
  self->_shortcutsRuntimeDonatedAction = 0;

  shortcutsRuntimeDonationDate = self->_shortcutsRuntimeDonationDate;
  self->_shortcutsRuntimeDonationDate = 0;

  matchingAppSessionDonatedAction = self->_matchingAppSessionDonatedAction;
  self->_matchingAppSessionDonatedAction = 0;

  matchingAppSessionDonationDate = self->_matchingAppSessionDonationDate;
  self->_matchingAppSessionDonationDate = 0;
}

- (void)_tryUpdatePartialIntentSessionState
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "%@ - partial intent was abandoned, no match with app intent", v4, v5, v6, v7, v8);
}

- (void)_tryUpdateShortcutsRuntimeDonatedAction:(id)a3 eventDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7 && !self->_shortcutsRuntimeDonatedAction)
  {
    objc_storeStrong((id *)&self->_shortcutsRuntimeDonatedAction, a3);
    objc_storeStrong((id *)&self->_shortcutsRuntimeDonationDate, a4);
    v9 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      shortcutsRuntimeDonatedAction = self->_shortcutsRuntimeDonatedAction;
      shortcutsRuntimeDonationDate = self->_shortcutsRuntimeDonationDate;
      int v14 = 138412802;
      v15 = v11;
      __int16 v16 = 2112;
      char v17 = shortcutsRuntimeDonationDate;
      __int16 v18 = 2112;
      v19 = shortcutsRuntimeDonatedAction;
      _os_log_debug_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEBUG, "%@ - updated shortcuts runtime donation with date: %@, action: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)_tryUpdateMatchingAppSessionDonatedAction:(id)a3 eventDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7 && !self->_matchingAppSessionDonatedAction)
  {
    objc_storeStrong((id *)&self->_matchingAppSessionDonatedAction, a3);
    objc_storeStrong((id *)&self->_matchingAppSessionDonationDate, a4);
    v9 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      matchingAppSessionDonatedAction = self->_matchingAppSessionDonatedAction;
      matchingAppSessionDonationDate = self->_matchingAppSessionDonationDate;
      int v14 = 138412802;
      v15 = v11;
      __int16 v16 = 2112;
      char v17 = matchingAppSessionDonationDate;
      __int16 v18 = 2112;
      v19 = matchingAppSessionDonatedAction;
      _os_log_debug_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEBUG, "%@ - updated app session donation with date: %@, action: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (BOOL)_isPartialEngagementForATXAction:(id)a3 withMatchingDonatedAction:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 actionKey];
  id v7 = [v5 actionKey];

  LOBYTE(v5) = [v6 isEqualToString:v7];
  return (char)v5;
}

- (BOOL)_isCompleteEngagementForATXAction:(id)a3 withMatchingDonatedAction:(id)a4
{
  return +[_ATXActionUtils isContainmentBetweenAction:a3 other:a4];
}

- (id)_partiallyExecutedSuggestionFromFeedbackResult:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = objc_msgSend(a3, "engagedSuggestions", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = [v7 atxActionExecutableObject];
        v9 = v8;
        if (v8)
        {
          uint64_t v10 = [v8 intent];
          if (v10)
          {
            uint64_t v11 = (void *)v10;
            v12 = [v9 intent];
            int v13 = objc_msgSend(v12, "atx_supportsBackgroundExecution");

            if (!v13)
            {
              id v4 = v7;

              goto LABEL_13;
            }
          }
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)atxActionFromIntentEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v7 = objc_opt_class();
  id v8 = [v4 interaction];
  id v18 = 0;
  v9 = [v6 unarchivedObjectOfClass:v7 fromData:v8 error:&v18];
  id v10 = v18;

  if (v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F4AE38]);
    v12 = [v9 intent];
    int v13 = objc_opt_new();
    int v14 = [v4 bundleID];
    LOBYTE(v17) = 0;
    long long v15 = (void *)[v11 initWithIntent:v12 actionUUID:v13 bundleId:v14 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v17 title:0 subtitle:0];
  }
  else
  {
    v12 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(ATXPartialIntentHandlingContext *)(uint64_t)self atxActionFromIntentEvent:v12];
    }
    long long v15 = 0;
  }

  return v15;
}

- (NSArray)feedbackResults
{
  uint64_t v2 = (void *)[(NSMutableArray *)self->_feedbackResults copy];
  return (NSArray *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  feedbackResults = self->_feedbackResults;
  id v5 = a3;
  [v5 encodeObject:feedbackResults forKey:@"feedbackResults"];
  [v5 encodeObject:self->_partiallyExecutedAction forKey:@"partialAction"];
  [v5 encodeObject:self->_partiallyExecutedActionStartDate forKey:@"partialActionStartDate"];
  [v5 encodeObject:self->_currentApp forKey:@"currentApp"];
  [v5 encodeObject:self->_currentAppSessionStartDate forKey:@"currentAppStartDate"];
  [v5 encodeObject:self->_shortcutsRuntimeDonatedAction forKey:@"shortcutsRuntimeDonatedAction"];
  [v5 encodeObject:self->_shortcutsRuntimeDonationDate forKey:@"shortcutsRuntimeDonationDate"];
  [v5 encodeObject:self->_matchingAppSessionDonatedAction forKey:@"matchingAppSessionAction"];
  [v5 encodeObject:self->_matchingAppSessionDonationDate forKey:@"matchingAppSessionDonationDate"];
}

- (ATXPartialIntentHandlingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = (void *)MEMORY[0x1D25F6CC0]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  id v10 = __atxlog_handle_blending_ecosystem();
  id v11 = [v5 robustDecodeObjectOfClasses:v9 forKey:@"feedbackResults" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v10];

  if (v11 && ([v4 error], v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    int v14 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v15 = objc_opt_class();
    long long v16 = __atxlog_handle_blending_ecosystem();
    uint64_t v17 = [v14 robustDecodeObjectOfClass:v15 forKey:@"partialAction" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v16];

    id v18 = [v4 error];

    if (v18)
    {
      int v13 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v20 = objc_opt_class();
      double v21 = __atxlog_handle_blending_ecosystem();
      id v22 = [v19 robustDecodeObjectOfClass:v20 forKey:@"partialActionStartDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v21];

      BOOL v23 = [v4 error];

      if (v23)
      {
        int v13 = 0;
      }
      else
      {
        id v24 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v25 = objc_opt_class();
        char v26 = __atxlog_handle_blending_ecosystem();
        __int16 v27 = [v24 robustDecodeObjectOfClass:v25 forKey:@"currentApp" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v26];

        id v28 = [v4 error];

        if (v28)
        {
          int v13 = 0;
        }
        else
        {
          __int16 v29 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v30 = objc_opt_class();
          __int16 v31 = __atxlog_handle_blending_ecosystem();
          __int16 v32 = [v29 robustDecodeObjectOfClass:v30 forKey:@"currentAppStartDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v31];

          uint64_t v33 = [v4 error];

          if (v33)
          {
            int v13 = 0;
          }
          else
          {
            v59 = v32;
            __int16 v34 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v35 = objc_opt_class();
            uint64_t v36 = __atxlog_handle_blending_ecosystem();
            v37 = [v34 robustDecodeObjectOfClass:v35 forKey:@"shortcutsRuntimeDonatedAction" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v36];

            v38 = [v4 error];

            if (v38)
            {
              int v13 = 0;
              __int16 v32 = v59;
            }
            else
            {
              v58 = v37;
              v39 = (void *)MEMORY[0x1E4F93B90];
              uint64_t v40 = objc_opt_class();
              v41 = __atxlog_handle_blending_ecosystem();
              uint64_t v57 = [v39 robustDecodeObjectOfClass:v40 forKey:@"shortcutsRuntimeDonationDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v41];

              v42 = [v4 error];

              if (v42)
              {
                int v13 = 0;
                v37 = v58;
                __int16 v32 = v59;
                v43 = (void *)v57;
              }
              else
              {
                v44 = (void *)MEMORY[0x1E4F93B90];
                uint64_t v45 = objc_opt_class();
                v46 = __atxlog_handle_blending_ecosystem();
                v56 = [v44 robustDecodeObjectOfClass:v45 forKey:@"matchingAppSessionAction" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v46];

                v47 = [v4 error];

                if (v47)
                {
                  int v13 = 0;
                  v37 = v58;
                  __int16 v32 = v59;
                  v43 = (void *)v57;
                }
                else
                {
                  v48 = (void *)MEMORY[0x1E4F93B90];
                  uint64_t v49 = objc_opt_class();
                  v50 = __atxlog_handle_blending_ecosystem();
                  uint64_t v51 = [v48 robustDecodeObjectOfClass:v49 forKey:@"matchingAppSessionDonationDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXPartialIntentHandlingContext" errorCode:-1 logHandle:v50];

                  v52 = [v4 error];

                  v55 = (void *)v51;
                  if (v52)
                  {
                    int v13 = 0;
                    v37 = v58;
                    __int16 v32 = v59;
                    v43 = (void *)v57;
                  }
                  else
                  {
                    v43 = (void *)v57;
                    uint64_t v54 = v51;
                    v37 = v58;
                    __int16 v32 = v59;
                    self = -[ATXPartialIntentHandlingContext initWithFeedbackResults:partiallyExecutedAction:partiallyExecutedActionStartDate:currentApp:currentAppSessionStartDate:shortcutsRuntimeDonatedAction:shortcutsRuntimeDonationDate:matchingAppSessionDonatedAction:matchingAppSessionDonationDate:](self, "initWithFeedbackResults:partiallyExecutedAction:partiallyExecutedActionStartDate:currentApp:currentAppSessionStartDate:shortcutsRuntimeDonatedAction:shortcutsRuntimeDonationDate:matchingAppSessionDonatedAction:matchingAppSessionDonationDate:", v11, v17, v22, v27, v59, v58, v57, v56, v54, v55);
                    int v13 = self;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPartialIntentHandlingContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPartialIntentHandlingContext *)self isEqualToATXPartialIntentHandlingContext:v5];

  return v6;
}

- (BOOL)isEqualToATXPartialIntentHandlingContext:(id)a3
{
  id v4 = (id *)a3;
  feedbackResults = self->_feedbackResults;
  BOOL v6 = (NSMutableArray *)v4[1];
  if (feedbackResults == v6)
  {
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = feedbackResults;
    char v9 = [(NSMutableArray *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_31;
    }
  }
  partiallyExecutedAction = self->_partiallyExecutedAction;
  id v11 = (ATXAction *)v4[2];
  if (partiallyExecutedAction == v11)
  {
  }
  else
  {
    v12 = v11;
    int v13 = partiallyExecutedAction;
    char v14 = [(ATXAction *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_31;
    }
  }
  partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
  long long v16 = (NSDate *)v4[3];
  if (partiallyExecutedActionStartDate == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    id v18 = partiallyExecutedActionStartDate;
    char v19 = [(NSDate *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_31;
    }
  }
  currentApp = self->_currentApp;
  double v21 = (NSString *)v4[4];
  if (currentApp == v21)
  {
  }
  else
  {
    id v22 = v21;
    BOOL v23 = currentApp;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_31;
    }
  }
  currentAppSessionStartDate = self->_currentAppSessionStartDate;
  char v26 = (NSDate *)v4[5];
  if (currentAppSessionStartDate == v26)
  {
  }
  else
  {
    __int16 v27 = v26;
    id v28 = currentAppSessionStartDate;
    char v29 = [(NSDate *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_31;
    }
  }
  shortcutsRuntimeDonatedAction = self->_shortcutsRuntimeDonatedAction;
  __int16 v31 = (ATXAction *)v4[6];
  if (shortcutsRuntimeDonatedAction == v31)
  {
  }
  else
  {
    __int16 v32 = v31;
    uint64_t v33 = shortcutsRuntimeDonatedAction;
    char v34 = [(ATXAction *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_31;
    }
  }
  shortcutsRuntimeDonationDate = self->_shortcutsRuntimeDonationDate;
  uint64_t v36 = (NSDate *)v4[7];
  if (shortcutsRuntimeDonationDate == v36)
  {
  }
  else
  {
    v37 = v36;
    v38 = shortcutsRuntimeDonationDate;
    char v39 = [(NSDate *)v38 isEqual:v37];

    if ((v39 & 1) == 0) {
      goto LABEL_31;
    }
  }
  matchingAppSessionDonatedAction = self->_matchingAppSessionDonatedAction;
  v41 = (ATXAction *)v4[8];
  if (matchingAppSessionDonatedAction == v41)
  {
  }
  else
  {
    v42 = v41;
    v43 = matchingAppSessionDonatedAction;
    char v44 = [(ATXAction *)v43 isEqual:v42];

    if ((v44 & 1) == 0)
    {
LABEL_31:
      char v45 = 0;
      goto LABEL_32;
    }
  }
  v47 = self->_matchingAppSessionDonationDate;
  v48 = v47;
  if (v47 == v4[9]) {
    char v45 = 1;
  }
  else {
    char v45 = -[NSDate isEqual:](v47, "isEqual:");
  }

LABEL_32:
  return v45;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_feedbackResults hash];
  uint64_t v4 = [(ATXAction *)self->_partiallyExecutedAction hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSDate *)self->_partiallyExecutedActionStartDate hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_currentApp hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSDate *)self->_currentAppSessionStartDate hash] - v6 + 32 * v6;
  uint64_t v8 = [(ATXAction *)self->_shortcutsRuntimeDonatedAction hash] - v7 + 32 * v7;
  uint64_t v9 = [(NSDate *)self->_shortcutsRuntimeDonationDate hash] - v8 + 32 * v8;
  uint64_t v10 = [(ATXAction *)self->_matchingAppSessionDonatedAction hash] - v9 + 32 * v9;
  return [(NSDate *)self->_matchingAppSessionDonationDate hash] - v10 + 32 * v10;
}

- (ATXAction)partiallyExecutedAction
{
  return self->_partiallyExecutedAction;
}

- (NSDate)partiallyExecutedActionStartDate
{
  return self->_partiallyExecutedActionStartDate;
}

- (NSString)currentApp
{
  return self->_currentApp;
}

- (NSDate)currentAppSessionStartDate
{
  return self->_currentAppSessionStartDate;
}

- (ATXAction)shortcutsRuntimeDonatedAction
{
  return self->_shortcutsRuntimeDonatedAction;
}

- (NSDate)shortcutsRuntimeDonationDate
{
  return self->_shortcutsRuntimeDonationDate;
}

- (ATXAction)matchingAppSessionDonatedAction
{
  return self->_matchingAppSessionDonatedAction;
}

- (NSDate)matchingAppSessionDonationDate
{
  return self->_matchingAppSessionDonationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingAppSessionDonationDate, 0);
  objc_storeStrong((id *)&self->_matchingAppSessionDonatedAction, 0);
  objc_storeStrong((id *)&self->_shortcutsRuntimeDonationDate, 0);
  objc_storeStrong((id *)&self->_shortcutsRuntimeDonatedAction, 0);
  objc_storeStrong((id *)&self->_currentAppSessionStartDate, 0);
  objc_storeStrong((id *)&self->_currentApp, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedActionStartDate, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedAction, 0);
  objc_storeStrong((id *)&self->_feedbackResults, 0);
}

- (void)handleNewFeedbackResultAndReturnCompletedResults:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "%@ - new session didn't have partial intent engagement - ending all currently tracked partial sessions", v4, v5, v6, v7, v8);
}

- (void)handleNewFeedbackResultAndReturnCompletedResults:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "%@ - adding new partial intent engagement session to currently tracked partial sessions", v4, v5, v6, v7, v8);
}

- (void)handleNewFeedbackResultAndReturnCompletedResults:(void *)a3 .cold.3(uint8_t *a1, uint64_t a2, void *a3, NSObject *a4)
{
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint8_t v8 = NSStringFromClass(v7);
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl(&dword_1D0FA3000, a4, OS_LOG_TYPE_DEBUG, "%@ - new partial intent engagement session does not match currently tracked partial intent session - ending all currently tracked partial sessions", a1, 0xCu);
}

- (void)handleNewFeedbackResultAndReturnCompletedResults:.cold.4()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - new feedback result event of: %@", v4, v5, v6, v7, v8);
}

- (void)handleAppLaunchAndReturnCompletedResults:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "%@ - ending currently tracked partial sessions due to > 5 minute expiration", v4, v5, v6, v7, v8);
}

- (void)handleAppLaunchAndReturnCompletedResults:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "%@ - ending currently tracked partial sessions due to different app launch", v4, v5, v6, v7, v8);
}

- (void)handleAppLaunchAndReturnCompletedResults:.cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - set new _currentApp to: %@", v4, v5, v6, v7, v8);
}

- (void)handleAppLaunchAndReturnCompletedResults:(NSObject *)a3 .cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 bundleID];
  uint8_t v8 = [a2 absoluteTimestamp];
  int v9 = 138413314;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  v12 = v7;
  __int16 v13 = 2112;
  char v14 = v8;
  __int16 v15 = 1024;
  int v16 = [a2 starting];
  __int16 v17 = 1024;
  int v18 = [a2 type];
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "%@ - got app launch event of: %@ at %@, starting: %{BOOL}d type: %d", (uint8_t *)&v9, 0x2Cu);
}

- (void)handleNewIntentEventAndReturnCompletedResults:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "%@ - ending currently tracked partial sessions due to intent donation from different bundleId", v4, v5, v6, v7, v8);
}

- (void)atxActionFromIntentEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - IntentEventIsCompleteEngagement - Error unarchiving intent: %@", v6, 0x16u);
}

@end
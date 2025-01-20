@interface ATXInferredModeSessionTagger
- (id)biomeSessionFromScoredSession:(id)a3;
- (void)inferModesForLastDay;
- (void)inferModesForLastDayWithXPCActivity:(id)a3;
@end

@implementation ATXInferredModeSessionTagger

- (void)inferModesForLastDay
{
}

- (void)inferModesForLastDayWithXPCActivity:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Started app-based mode inference", buf, 2u);
  }

  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  v7 = [MEMORY[0x1E4F1C9C8] now];
  v8 = objc_alloc_init(ATXAppLaunchInferredModeSessionBiomeStream);
  v9 = [ATXModeScoringSessionRange alloc];
  v10 = objc_opt_new();
  v11 = [(ATXModeScoringSessionRange *)v9 initWithStartDate:v6 endDate:v7 modeEntityStore:v10];

  [(ATXModeScoringSessionRange *)v11 populateInitialSessionsFromScreenTransitions];
  v12 = __atxlog_handle_modes();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Populated initial sessions from CoreDuet for app-based mode inference", buf, 2u);
  }

  if (([v4 didDefer] & 1) == 0)
  {
    [(ATXModeScoringSessionRange *)v11 attachAppLaunches];
    v13 = __atxlog_handle_modes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Attached app launches to sessions for app-based mode inference", buf, 2u);
    }

    if (([v4 didDefer] & 1) == 0)
    {
      [(ATXModeScoringSessionRange *)v11 coalesceSessions];
      v14 = __atxlog_handle_modes();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Coalesced sessions for app-based mode inference", buf, 2u);
      }

      if (([v4 didDefer] & 1) == 0)
      {
        [(ATXModeScoringSessionRange *)v11 filterSessions];
        v15 = __atxlog_handle_modes();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Filtered out ineligible sessions for app-based mode inference", buf, 2u);
        }

        if (([v4 didDefer] & 1) == 0)
        {
          v24 = v6;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v16 = [(ATXModeScoringSessionRange *)v11 sessions];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v26 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                if ([v21 isLabeled])
                {
                  v22 = [(ATXInferredModeSessionTagger *)self biomeSessionFromScoredSession:v21];
                  [(ATXAppLaunchInferredModeSessionBiomeStream *)v8 sendEvent:v22];
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
            }
            while (v18);
          }

          v23 = __atxlog_handle_modes();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Finished app-based mode inference", buf, 2u);
          }

          v6 = v24;
        }
      }
    }
  }
}

- (id)biomeSessionFromScoredSession:(id)a3
{
  id v3 = a3;
  [v3 topMode];
  id v4 = [ATXUnifiedInferredActivitySession alloc];
  [v3 startTimestamp];
  double v6 = v5;
  [v3 endTimestamp];
  double v8 = v7;

  id v9 = [(ATXUnifiedInferredActivitySession *)v4 initFromStartTime:@"appLaunchInferredMode" endTime:ATXActivityTypeFromMode() source:v6 activityType:v8 confidence:1.0];
  return v9;
}

@end
@interface ATXModeScoringSessionRange
- (ATXModeEntityStore)modeEntityStore;
- (ATXModeScoringSessionRange)initWithStartDate:(id)a3 endDate:(id)a4 modeEntityStore:(id)a5;
- (BOOL)_areTimesClose:(id)a3 secondTime:(id)a4;
- (BOOL)_shouldCoaleseNextSession:(id)a3 currentBuffer:(id)a4;
- (NSArray)sessions;
- (NSDate)endDate;
- (NSDate)startDate;
- (void)attachAppLaunches;
- (void)coalesceSessions;
- (void)filterSessions;
- (void)populateInitialSessionsFromScreenTransitions;
@end

@implementation ATXModeScoringSessionRange

- (ATXModeScoringSessionRange)initWithStartDate:(id)a3 endDate:(id)a4 modeEntityStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXModeScoringSessionRange;
  v11 = [(ATXModeScoringSessionRange *)&v17 init];
  if (v11)
  {
    if (v8)
    {
      v12 = (NSDate *)v8;
    }
    else
    {
      v12 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    startDate = v11->_startDate;
    v11->_startDate = v12;

    if (v9)
    {
      v14 = (NSDate *)v9;
    }
    else
    {
      v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    endDate = v11->_endDate;
    v11->_endDate = v14;

    objc_storeStrong((id *)&v11->_modeEntityStore, a5);
  }

  return v11;
}

- (void)filterSessions
{
  self->_sessions = [(NSArray *)self->_sessions _pas_filteredArrayWithTest:&__block_literal_global_51];
  MEMORY[0x1F41817F8]();
}

BOOL __44__ATXModeScoringSessionRange_filterSessions__block_invoke(uint64_t a1, void *a2)
{
  [a2 duration];
  return v2 > 300.0;
}

- (BOOL)_areTimesClose:(id)a3 secondTime:(id)a4
{
  [a4 timeIntervalSinceDate:a3];
  return v4 < 60.0;
}

- (void)attachAppLaunches
{
  v3 = BiomeLibrary();
  double v4 = [v3 App];
  v5 = [v4 InFocus];
  v6 = objc_msgSend(v5, "atx_publisherFromStartDate:", self->_startDate);

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  v7 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__ATXModeScoringSessionRange_attachAppLaunches__block_invoke_9;
  v10[3] = &unk_1E68AE1D8;
  v12 = v13;
  v10[4] = self;
  id v8 = v7;
  id v11 = v8;
  id v9 = (id)[v6 sinkWithCompletion:&__block_literal_global_8 receiveInput:v10];

  _Block_object_dispose(v13, 8);
}

void __47__ATXModeScoringSessionRange_attachAppLaunches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v4 = [v2 error];
      int v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __47__ATXModeScoringSessionRange_attachAppLaunches__block_invoke_9(uint64_t a1, void *a2)
{
  id v18 = a2;
  while (1)
  {
    unint64_t v3 = *(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if ([*(id *)(*(void *)(a1 + 32) + 24) count] <= v3) {
      break;
    }
    double v4 = [v18 eventBody];
    int v5 = [v4 absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;
    id v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    [v8 endTimestamp];
    double v10 = v9;

    if (v7 <= v10) {
      break;
    }
    if ([*(id *)(a1 + 40) count])
    {
      id v11 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      [v11 populateAppLaunches:*(void *)(a1 + 40)];

      [*(id *)(a1 + 40) removeAllObjects];
    }
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  uint64_t v12 = *(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  BOOL v13 = [*(id *)(*(void *)(a1 + 32) + 24) count] == v12;
  int v14 = v18;
  if (!v13)
  {
    v15 = [v18 eventBody];

    int v14 = v18;
    if (v15)
    {
      v16 = *(void **)(a1 + 40);
      objc_super v17 = [v18 eventBody];
      [v16 addObject:v17];

      int v14 = v18;
    }
  }
}

- (void)populateInitialSessionsFromScreenTransitions
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v38 = (NSArray *)objc_opt_new();
  +[ATXDeviceBacklightHelper getScreenOnIntervalsBetweenStartDate:self->_startDate endDate:self->_endDate];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v41;
    while (1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (v5)
        {
          double v9 = [v5 endDate];
          double v10 = [v8 startDate];
          if ([(ATXModeScoringSessionRange *)self _areTimesClose:v9 secondTime:v10])
          {
            id v11 = [v8 endDate];
            [v11 timeIntervalSinceReferenceDate];
            double v13 = v12;
            int v14 = [v5 startDate];
            [v14 timeIntervalSinceReferenceDate];
            double v16 = v15;

            if (v13 > v16)
            {
              id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
              id v18 = [v5 startDate];
              v19 = [v8 endDate];
              uint64_t v20 = [v17 initWithStartDate:v18 endDate:v19];

              id v5 = (id)v20;
              continue;
            }
          }
          else
          {
          }
          v21 = [ATXModeScoringSession alloc];
          v22 = [v5 startDate];
          [v22 timeIntervalSinceReferenceDate];
          double v24 = v23;
          v25 = [v5 endDate];
          [v25 timeIntervalSinceReferenceDate];
          id v27 = [(ATXModeScoringSession *)v21 initFromStartTime:self->_modeEntityStore endTime:v24 modeEntityStore:v26];

          [(NSArray *)v38 addObject:v27];
          id v28 = v8;

          id v5 = v28;
        }
        else
        {
          id v5 = v8;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (!v4) {
        goto LABEL_17;
      }
    }
  }
  id v5 = 0;
LABEL_17:
  v29 = [ATXModeScoringSession alloc];
  v30 = [v5 startDate];
  [v30 timeIntervalSinceReferenceDate];
  double v32 = v31;
  v33 = [v5 endDate];
  [v33 timeIntervalSinceReferenceDate];
  id v35 = [(ATXModeScoringSession *)v29 initFromStartTime:self->_modeEntityStore endTime:v32 modeEntityStore:v34];

  [(NSArray *)v38 addObject:v35];
  sessions = self->_sessions;
  self->_sessions = v38;
  v37 = v38;
}

- (void)coalesceSessions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSArray *)objc_opt_new();
  uint64_t v4 = objc_opt_new();
  id v5 = [(NSArray *)self->_sessions _pas_filteredArrayWithTest:&__block_literal_global_15_0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (![(ATXModeScoringSessionRange *)self _shouldCoaleseNextSession:v10 currentBuffer:v4])
        {
          id v11 = +[ATXModeScoringSession coalesceSessions:v4 modeEntityStore:self->_modeEntityStore];
          [(NSArray *)v3 addObject:v11];

          [v4 removeAllObjects];
        }
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  if ([v4 count])
  {
    double v12 = +[ATXModeScoringSession coalesceSessions:v4 modeEntityStore:self->_modeEntityStore];
    [(NSArray *)v3 addObject:v12];
  }
  sessions = self->_sessions;
  self->_sessions = v3;
}

uint64_t __46__ATXModeScoringSessionRange_coalesceSessions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLabeled];
}

- (BOOL)_shouldCoaleseNextSession:(id)a3 currentBuffer:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v8 = +[ATXModeScoringSession coalesceSessions:v7 modeEntityStore:self->_modeEntityStore];
    uint64_t v9 = [v8 topMode];
    if ([v8 isStronglyCorrelatedWithTopMode]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    if (([v6 hasModeWithinRank:v9 rank:v10] & 1) != 0 || (objc_msgSend(v6, "duration"), v11 < 30.0))
    {
      v17[0] = v8;
      v17[1] = v6;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      double v13 = +[ATXModeScoringSession coalesceSessions:v12 modeEntityStore:self->_modeEntityStore];

      if ([v13 hasModeWithinRank:v9 rank:1])
      {
        [v8 secondsUntilOtherSession:v6];
        BOOL v15 = v14 < 3600.0;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)sessions
{
  return self->_sessions;
}

- (ATXModeEntityStore)modeEntityStore
{
  return self->_modeEntityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
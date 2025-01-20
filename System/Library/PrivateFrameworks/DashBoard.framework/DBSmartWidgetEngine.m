@interface DBSmartWidgetEngine
- (BOOL)_useRangeEnd:(id)a3 refreshDate:(id)a4;
- (BOOL)_useRangeStart:(id)a3 now:(id)a4 refreshDate:(id)a5;
- (BOOL)active;
- (BOOL)hasHighPriorityPrediction;
- (BOOL)predictionsFresh;
- (BOOL)updatesPending;
- (CARObserverHashTable)observers;
- (DBEnvironment)environment;
- (DBHomeManager)homeManager;
- (DBSmartWidgetEngine)initWithEnvironment:(id)a3;
- (NSArray)currentPredictions;
- (NSArray)sources;
- (NSDate)lastRefreshRequest;
- (NSDate)nextRefresh;
- (NSString)description;
- (NSTimer)refreshTimer;
- (NSTimer)stoppingTimer;
- (id)_sourceForPrediction:(id)a3;
- (void)_handleAppLibraryRefresh;
- (void)_postUpdatedCurrentPredictionsIfNeeded;
- (void)_resetCurrentPredictions;
- (void)_start;
- (void)_stop;
- (void)_updatePredictionsFresh;
- (void)_updateWithDashboardStateProvider:(id)a3;
- (void)addObserver:(id)a3;
- (void)currentPredictions;
- (void)dashboardStateProvider:(id)a3 didChangeActiveBundleIdentifier:(id)a4;
- (void)dashboardStateProvider:(id)a3 didChangeConnectionReady:(BOOL)a4;
- (void)dashboardStateProvider:(id)a3 didChangeHomeScreenPageType:(unint64_t)a4;
- (void)dashboardStateProvider:(id)a3 didChangeLockoutState:(unint64_t)a4;
- (void)dealloc;
- (void)handleEvent:(id)a3;
- (void)refreshDisabled;
- (void)refreshGarageDoors;
- (void)refreshPredictions;
- (void)removeObserver:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setLastRefreshRequest:(id)a3;
- (void)setNextRefresh:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPredictionsFresh:(BOOL)a3;
- (void)setRefreshTimer:(id)a3;
- (void)setSources:(id)a3;
- (void)setStoppingTimer:(id)a3;
- (void)setUpdatesPending:(BOOL)a3;
- (void)sourceDidRefresh:(id)a3 predictionsUpdated:(BOOL)a4;
- (void)startIfNeeded;
- (void)stopIfNeeded;
@end

@implementation DBSmartWidgetEngine

- (DBSmartWidgetEngine)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DBSmartWidgetEngine;
  v5 = [(DBSmartWidgetEngine *)&v20 init];
  if (v5)
  {
    v6 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[DBSmartWidgetEngine initWithEnvironment:]();
    }

    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = objc_alloc_init(DBHomeManager);
    homeManager = v5->_homeManager;
    v5->_homeManager = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1C7A38];
    observers = v5->_observers;
    v5->_observers = (CARObserverHashTable *)v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)DebugRefreshPredictions, @"com.apple.CarPlay.SmartWidget.refreshPredictions", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v5, (CFNotificationCallback)DebugRefreshDisabled, @"com.apple.CarPlay.SmartWidget.refreshDisabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v5, (CFNotificationCallback)DebugRefreshGarageDoors, @"com.apple.CarPlay.SmartWidget.refreshGarageDoors", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v14, v5, (CFNotificationCallback)_appLibraryRefreshCallback, @"com.apple.CarPlay.internal.refreshApps", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_opt_class();
    id v15 = objc_loadWeakRetained((id *)&v5->_environment);
    if (v15 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    if (v16)
    {
      v17 = [v16 dashboardStateProvider];
      [(DBSmartWidgetEngine *)v5 _updateWithDashboardStateProvider:v17];

      v18 = [v16 dashboardStateProvider];
      [v18 addObserver:v5];
    }
  }

  return v5;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "dealloc smartWidgetEngine %{public}p", v2, v3, v4, v5, v6);
}

- (BOOL)active
{
  uint64_t v2 = [(DBSmartWidgetEngine *)self sources];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)startIfNeeded
{
  uint64_t v1 = [a1 stoppingTimer];
  OUTLINED_FUNCTION_2_3(&dword_22D6F0000, v2, v3, "startIfNeeded stoppingTimer=%{public}@", v4, v5, v6, v7, 2u);
}

uint64_t __36__DBSmartWidgetEngine_startIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)stopIfNeeded
{
  uint64_t v1 = [a1 stoppingTimer];
  OUTLINED_FUNCTION_2_3(&dword_22D6F0000, v2, v3, "stopIfNeeded stoppingTimer=%{public}@", v4, v5, v6, v7, 2u);
}

uint64_t __35__DBSmartWidgetEngine_stopIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)refreshPredictions
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "refreshPredictions requested", v2, v3, v4, v5, v6);
}

- (void)refreshDisabled
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "refreshDisabled requested", v2, v3, v4, v5, v6);
}

- (void)refreshGarageDoors
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "refreshGarageDoors requested", v2, v3, v4, v5, v6);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSmartWidgetEngine *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSmartWidgetEngine *)self observers];
  [v5 removeObserver:v4];
}

- (void)_resetCurrentPredictions
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "reset currentPredictions", v2, v3, v4, v5, v6);
}

- (void)_updatePredictionsFresh
{
  uint64_t v2 = [a2 lastRefreshRequest];
  uint64_t v9 = +[DBDateFormatter formattedDateTimeStamp:v2];
  OUTLINED_FUNCTION_0_3(&dword_22D6F0000, v3, v4, "Predictions Fresh %{public}@ lastRefreshRequest=%{public}@", v5, v6, v7, v8, 2u);
}

- (void)_start
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Engine starting", v2, v3, v4, v5, v6);
}

- (void)_stop
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Engine stopping", v2, v3, v4, v5, v6);
}

- (BOOL)_useRangeEnd:(id)a3 refreshDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [v6 hasEnd];
  uint64_t v8 = [v6 end];

  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [v5 timeIntervalSinceReferenceDate];
  double v12 = v11;

  if (v10 <= v12) {
    return v7;
  }
  else {
    return 0;
  }
}

- (BOOL)_useRangeStart:(id)a3 now:(id)a4 refreshDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  char v10 = [v9 hasStart];
  double v11 = [v9 start];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;
  [v7 timeIntervalSinceReferenceDate];
  double v15 = v14;

  if (v13 > v15) {
    char v10 = 0;
  }
  id v16 = [v9 start];

  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;
  [v8 timeIntervalSinceReferenceDate];
  double v20 = v19;

  if (v18 < v20) {
    return 0;
  }
  return v10;
}

- (NSArray)currentPredictions
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  currentPredictions = self->_currentPredictions;
  if (!currentPredictions)
  {
    uint64_t v4 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[DBSmartWidgetEngine currentPredictions]();
    }

    id v5 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v6 = [(DBSmartWidgetEngine *)self sources];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v48 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = [*(id *)(*((void *)&v47 + 1) + 8 * i) predictions];
          [v5 addObjectsFromArray:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v8);
    }

    v33 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.predictionScore >= %@", &unk_26E17EC48];
    objc_msgSend(v5, "filterUsingPredicate:");
    double v12 = [MEMORY[0x263EFF910] now];
    double v13 = [MEMORY[0x263EFF910] distantFuture];
    v34 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = v5;
    uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v44;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(obj);
          }
          double v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
          id v16 = [v15 validRanges];
          char v17 = [v16 count] == 0;

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v38 = v15;
          double v18 = [v15 validRanges];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v55 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v40 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                if (![v23 containsDate:v12])
                {
                  if (![(DBSmartWidgetEngine *)self _useRangeStart:v23 now:v12 refreshDate:v13])continue; {
                  uint64_t v24 = [v23 start];
                  }
                  goto LABEL_26;
                }
                if ([(DBSmartWidgetEngine *)self _useRangeEnd:v23 refreshDate:v13])
                {
                  uint64_t v24 = [v23 end];
                  char v17 = 1;
LABEL_26:

                  double v13 = (void *)v24;
                  continue;
                }
                char v17 = 1;
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v55 count:16];
            }
            while (v20);
          }

          v25 = [(DBSmartWidgetEngine *)self _sourceForPrediction:v38];
          v26 = v25;
          if (v25) {
            v17 |= [v25 shouldKeepPrediction:v38];
          }
          v27 = DBLogForCategory(7uLL);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v28 = @"NO";
            if (v17) {
              v28 = @"YES";
            }
            v52 = v28;
            __int16 v53 = 2114;
            v54 = v38;
            _os_log_debug_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEBUG, "keep=%{public}@ prediction=%{public}@", buf, 0x16u);
          }

          if (v17) {
            [v34 addObject:v38];
          }

          ++v14;
        }
        while (v14 != v37);
        uint64_t v29 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
        uint64_t v37 = v29;
      }
      while (v29);
    }

    v30 = v34;
    [(DBSmartWidgetEngine *)self setNextRefresh:v13];
    [(NSArray *)v30 sortUsingComparator:&__block_literal_global_30];
    v31 = self->_currentPredictions;
    self->_currentPredictions = v30;

    currentPredictions = self->_currentPredictions;
  }
  return currentPredictions;
}

uint64_t __41__DBSmartWidgetEngine_currentPredictions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setPredictionsFresh:(BOOL)a3
{
  if (self->_predictionsFresh != a3)
  {
    self->_predictionsFresh = a3;
    id v4 = [(DBSmartWidgetEngine *)self observers];
    [v4 smartWidgetEngineDidUpdatePredictionsFresh:self];
  }
}

- (BOOL)hasHighPriorityPrediction
{
  uint64_t v2 = [(DBSmartWidgetEngine *)self currentPredictions];
  uint64_t v3 = [v2 firstObject];
  BOOL v4 = [v3 score] > 19;

  return v4;
}

- (void)setNextRefresh:(id)a3
{
  id v5 = a3;
  id v6 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetEngine setNextRefresh:].cold.4((uint64_t)v5);
  }

  if (!+[DBComparison isValue:self->_nextRefresh equalTo:v5])
  {
    objc_storeStrong((id *)&self->_nextRefresh, a3);
    uint64_t v7 = [(DBSmartWidgetEngine *)self refreshTimer];
    [v7 invalidate];

    [(DBSmartWidgetEngine *)self setRefreshTimer:0];
    if (v5
      && ([MEMORY[0x263EFF910] distantFuture],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v5 isEqualToDate:v8],
          v8,
          (v9 & 1) == 0))
    {
      [v5 timeIntervalSinceReferenceDate];
      double v12 = v11;
      double v13 = [MEMORY[0x263EFF910] now];
      [v13 timeIntervalSinceReferenceDate];
      double v15 = v12 - v14;

      if (v15 < 0.0)
      {
        id v16 = DBLogForCategory(7uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[DBSmartWidgetEngine setNextRefresh:](v16, v17, v18, v19, v20, v21, v22, v23);
        }

        double v15 = 60.0;
      }
      double v24 = v15 + 1.0;
      v25 = DBLogForCategory(7uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[DBSmartWidgetEngine setNextRefresh:](v25, v26, v27, v28, v29, v30, v31, v32);
      }

      objc_initWeak(&location, self);
      v33 = (void *)MEMORY[0x263EFFA20];
      uint64_t v35 = MEMORY[0x263EF8330];
      uint64_t v36 = 3221225472;
      uint64_t v37 = __38__DBSmartWidgetEngine_setNextRefresh___block_invoke;
      v38 = &unk_2649B5350;
      objc_copyWeak(&v39, &location);
      v34 = [v33 scheduledTimerWithTimeInterval:0 repeats:&v35 block:v24];
      -[DBSmartWidgetEngine setRefreshTimer:](self, "setRefreshTimer:", v34, v35, v36, v37, v38);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      char v10 = DBLogForCategory(7uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[DBSmartWidgetEngine setNextRefresh:]();
      }
    }
  }
}

void __38__DBSmartWidgetEngine_setNextRefresh___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __38__DBSmartWidgetEngine_setNextRefresh___block_invoke_cold_1();
  }

  if ([WeakRetained active])
  {
    [WeakRetained setUpdatesPending:1];
    [WeakRetained _postUpdatedCurrentPredictionsIfNeeded];
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if ([(DBSmartWidgetEngine *)self updatesPending]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  if ([(DBSmartWidgetEngine *)self predictionsFresh]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  uint64_t v8 = [(DBSmartWidgetEngine *)self lastRefreshRequest];
  char v9 = +[DBDateFormatter formattedDateTimeStamp:v8];
  char v10 = [(DBSmartWidgetEngine *)self sources];
  double v11 = [v3 stringWithFormat:@"<%@: %p updatesPending=%@ predictionsFresh=%@ lastRefreshRequest=%@ sources=%@>", v5, self, v6, v7, v9, v10];

  return (NSString *)v11;
}

- (id)_sourceForPrediction:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(DBSmartWidgetEngine *)self sources];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [(id)objc_opt_class() predictionClasses];
        char v11 = [v10 containsObject:objc_opt_class()];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_handleAppLibraryRefresh
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Refreshing predictions Application Library Refresh", v2, v3, v4, v5, v6);
}

- (void)sourceDidRefresh:(id)a3 predictionsUpdated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v7 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetEngine sourceDidRefresh:predictionsUpdated:]();
  }

  if (v4) {
    [(DBSmartWidgetEngine *)self setUpdatesPending:1];
  }
  [(DBSmartWidgetEngine *)self _updatePredictionsFresh];
  [(DBSmartWidgetEngine *)self _postUpdatedCurrentPredictionsIfNeeded];
}

- (void)_postUpdatedCurrentPredictionsIfNeeded
{
  [a1 predictionsFresh];
  [a1 updatesPending];
  OUTLINED_FUNCTION_0_3(&dword_22D6F0000, v2, v3, "fresh=%{public}@ pending=%{public}@", v4, v5, v6, v7, 2u);
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSmartWidgetEngine *)self environment];
  [v5 handleEvent:v4];
}

- (void)dashboardStateProvider:(id)a3 didChangeConnectionReady:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetEngine dashboardStateProvider:didChangeConnectionReady:](v4, v7, v8, v9, v10, v11, v12, v13);
  }

  [(DBSmartWidgetEngine *)self _updateWithDashboardStateProvider:v6];
}

- (void)dashboardStateProvider:(id)a3 didChangeLockoutState:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetEngine dashboardStateProvider:didChangeLockoutState:](a4);
  }

  [(DBSmartWidgetEngine *)self _updateWithDashboardStateProvider:v6];
}

- (void)dashboardStateProvider:(id)a3 didChangeHomeScreenPageType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetEngine dashboardStateProvider:didChangeHomeScreenPageType:](a4);
  }

  [(DBSmartWidgetEngine *)self _updateWithDashboardStateProvider:v6];
}

- (void)dashboardStateProvider:(id)a3 didChangeActiveBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetEngine dashboardStateProvider:didChangeActiveBundleIdentifier:]();
  }

  [(DBSmartWidgetEngine *)self _updateWithDashboardStateProvider:v7];
}

- (void)_updateWithDashboardStateProvider:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetEngine _updateWithDashboardStateProvider:](v4, v5);
  }

  if (![v4 connectionReady] || objc_msgSend(v4, "lockoutState") != 2) {
    goto LABEL_9;
  }
  id v6 = [v4 activeBundleIdentifier];
  if (![v6 isEqualToString:@"com.apple.CarPlay.dashboard"])
  {

    goto LABEL_9;
  }
  uint64_t v7 = [v4 pageType];

  if (v7 != 1)
  {
LABEL_9:
    [(DBSmartWidgetEngine *)self stopIfNeeded];
    goto LABEL_10;
  }
  [(DBSmartWidgetEngine *)self startIfNeeded];
LABEL_10:
}

- (BOOL)predictionsFresh
{
  return self->_predictionsFresh;
}

- (NSDate)nextRefresh
{
  return self->_nextRefresh;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (DBHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSDate)lastRefreshRequest
{
  return self->_lastRefreshRequest;
}

- (void)setLastRefreshRequest:(id)a3
{
}

- (BOOL)updatesPending
{
  return self->_updatesPending;
}

- (void)setUpdatesPending:(BOOL)a3
{
  self->_updatesPending = a3;
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
}

- (NSTimer)stoppingTimer
{
  return self->_stoppingTimer;
}

- (void)setStoppingTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stoppingTimer, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_lastRefreshRequest, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_nextRefresh, 0);
  objc_storeStrong((id *)&self->_currentPredictions, 0);
}

- (void)initWithEnvironment:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "init smartWidgetEngine %{public}p", v2, v3, v4, v5, v6);
}

- (void)currentPredictions
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Generating currentPredictions", v2, v3, v4, v5, v6);
}

- (void)setNextRefresh:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "No Scheduled refresh (distantFuture)", v2, v3, v4, v5, v6);
}

- (void)setNextRefresh:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setNextRefresh:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setNextRefresh:(uint64_t)a1 .cold.4(uint64_t a1)
{
  uint64_t v1 = +[DBDateFormatter formattedTimeStamp:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_22D6F0000, v2, v3, "nextRefresh=%@", v4, v5, v6, v7, v8);
}

void __38__DBSmartWidgetEngine_setNextRefresh___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Triggering refresh", v2, v3, v4, v5, v6);
}

- (void)sourceDidRefresh:predictionsUpdated:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_22D6F0000, v1, OS_LOG_TYPE_DEBUG, "source=%{public}@ updated=%{public}@", v2, 0x16u);
}

- (void)dashboardStateProvider:(uint64_t)a3 didChangeConnectionReady:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, a2, a3, "connectionReady=%@", a5, a6, a7, a8, 2u);
}

- (void)dashboardStateProvider:(uint64_t)a1 didChangeLockoutState:.cold.1(uint64_t a1)
{
  os_log_t v1 = NSStringFromLockoutState(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_22D6F0000, v2, v3, "lockoutState=%@", v4, v5, v6, v7, v8);
}

- (void)dashboardStateProvider:(uint64_t)a1 didChangeHomeScreenPageType:.cold.1(uint64_t a1)
{
  os_log_t v1 = NSStringFromHomeScreenPageType(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_22D6F0000, v2, v3, "pageType=%@", v4, v5, v6, v7, v8);
}

- (void)dashboardStateProvider:didChangeActiveBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_22D6F0000, v0, v1, "activeBundleIdentifier=%@", v2, v3, v4, v5, v6);
}

- (void)_updateWithDashboardStateProvider:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([a1 connectionReady]) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  uint64_t v5 = NSStringFromLockoutState([a1 lockoutState]);
  uint8_t v6 = [a1 activeBundleIdentifier];
  uint64_t v7 = NSStringFromHomeScreenPageType([a1 pageType]);
  int v8 = 138413058;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  long long v15 = v7;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "connectionReady=%@ lockoutState=%@ activeBundleIdentifier=%@ pageType=%@", (uint8_t *)&v8, 0x2Au);
}

@end
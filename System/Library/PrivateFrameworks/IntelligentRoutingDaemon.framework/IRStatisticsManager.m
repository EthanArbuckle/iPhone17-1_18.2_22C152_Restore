@interface IRStatisticsManager
- (BOOL)_initStatistics;
- (BOOL)_isAllowedToCollectStatisticsForDate:(id)a3;
- (IRServiceStore)store;
- (IRStatisticsDO)statistics;
- (IRStatisticsManager)initWithStore:(id)a3;
- (NSDate)appLaunchDate;
- (NSDate)modeDate;
- (NSNumber)timeToBannerInMilliSeconds;
- (int64_t)mode;
- (void)_updateMiLoStatisticsIfNeededWithReason:(id)a3 mode:(int64_t)a4 miloPrediction:(id)a5;
- (void)_updateModeStatisticsIfNeededWithReason:(id)a3 mode:(int64_t)a4 date:(id)a5;
- (void)bannerContextWithDate:(id)a3;
- (void)clearStatistics:(id)a3;
- (void)contextChangedWithReason:(id)a3 mode:(int64_t)a4 miloPrediction:(id)a5 date:(id)a6;
- (void)event:(id)a3 forCandidate:(id)a4 inspections:(id)a5 date:(id)a6;
- (void)setAppLaunchDate:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setModeDate:(id)a3;
- (void)setStatistics:(id)a3;
- (void)setStore:(id)a3;
- (void)setTimeToBannerInMilliSeconds:(id)a3;
@end

@implementation IRStatisticsManager

- (void)contextChangedWithReason:(id)a3 mode:(int64_t)a4 miloPrediction:(id)a5 date:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 isEqual:@"App in focus"])
  {
    [(IRStatisticsManager *)self setAppLaunchDate:v12];
    [(IRStatisticsManager *)self setTimeToBannerInMilliSeconds:0];
  }
  if ([(IRStatisticsManager *)self _isAllowedToCollectStatisticsForDate:v12])
  {
    [(IRStatisticsManager *)self _updateMiLoStatisticsIfNeededWithReason:v10 mode:a4 miloPrediction:v11];
    [(IRStatisticsManager *)self _updateModeStatisticsIfNeededWithReason:v10 mode:a4 date:v12];
    v13 = [(IRStatisticsManager *)self store];
    v14 = [(IRStatisticsManager *)self statistics];
    char v15 = [v13 updateStatistics:v14];

    if ((v15 & 1) == 0)
    {
      v16 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      v17 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
      {
        int v18 = 136315394;
        v19 = "#statistics-manager, ";
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_25418E000, v17, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Statistics update error context] Couldnt update statistics upon context change", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (IRServiceStore)store
{
  return self->_store;
}

- (void)_updateModeStatisticsIfNeededWithReason:(id)a3 mode:(int64_t)a4 date:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    if (([v19 isEqual:@"Request current context"] & 1) == 0)
    {
      v9 = [(IRStatisticsManager *)self statistics];
      id v10 = [(IRStatisticsManager *)self statistics];
      id v11 = objc_msgSend(v9, "copyWithReplacementNumberOfContextChanges:", objc_msgSend(v10, "numberOfContextChanges") + 1);
      [(IRStatisticsManager *)self setStatistics:v11];
    }
    if (![(IRStatisticsManager *)self mode])
    {
      [(IRStatisticsManager *)self setMode:1];
      [(IRStatisticsManager *)self setModeDate:v8];
    }
  }
  else
  {
    [(IRStatisticsManager *)self mode];
  }
  int64_t v12 = [(IRStatisticsManager *)self mode];
  if (!a4 && v12 == 1)
  {
    [(IRStatisticsManager *)self setMode:0];
    v13 = [(IRStatisticsManager *)self statistics];
    v14 = [(IRStatisticsManager *)self statistics];
    uint64_t v15 = [v14 timeInUpdatesModeInSeconds];
    v16 = [(IRStatisticsManager *)self modeDate];
    [v8 timeIntervalSinceDate:v16];
    int v18 = (void *)[v13 copyWithReplacementTimeInUpdatesModeInSeconds:v15 + (uint64_t)v17];
    [(IRStatisticsManager *)self setStatistics:v18];
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)_updateMiLoStatisticsIfNeededWithReason:(id)a3 mode:(int64_t)a4 miloPrediction:(id)a5
{
  id v23 = a5;
  if ([a3 isEqual:@"MiLo prediction"]
    && [v23 canLabel])
  {
    id v8 = [(IRStatisticsManager *)self statistics];
    v9 = [(IRStatisticsManager *)self statistics];
    id v10 = objc_msgSend(v8, "copyWithReplacementNumberOfMiLoPredictions:", objc_msgSend(v9, "numberOfMiLoPredictions") + 1);
    [(IRStatisticsManager *)self setStatistics:v10];

    if (a4 == 1)
    {
      id v11 = [(IRStatisticsManager *)self statistics];
      int64_t v12 = [(IRStatisticsManager *)self statistics];
      v13 = objc_msgSend(v11, "copyWithReplacementNumberOfMiLoPredictionsInUpdatesMode:", objc_msgSend(v12, "numberOfMiLoPredictionsInUpdatesMode") + 1);
      [(IRStatisticsManager *)self setStatistics:v13];
    }
    v14 = [(IRStatisticsManager *)self statistics];
    uint64_t v15 = (void *)[v14 copyWithReplacementLastMiLoModels:0];
    [(IRStatisticsManager *)self setStatistics:v15];

    v16 = [(IRStatisticsManager *)self statistics];
    double v17 = objc_msgSend(v16, "copyWithReplacementLastMiLoQuality:", objc_msgSend(v23, "miLoServiceQuality"));
    [(IRStatisticsManager *)self setStatistics:v17];

    int v18 = [(IRStatisticsManager *)self statistics];
    id v19 = objc_msgSend(v18, "copyWithReplacementLastMiLoQualityReasonBitmap:", objc_msgSend(v23, "miLoServiceQualityReasonBitmap"));
    [(IRStatisticsManager *)self setStatistics:v19];

    __int16 v20 = [(IRStatisticsManager *)self statistics];
    v21 = [v23 scores];
    uint64_t v22 = objc_msgSend(v20, "copyWithReplacementLastMiLoLSLItems:", objc_msgSend(v21, "count"));
    [(IRStatisticsManager *)self setStatistics:v22];
  }
}

- (BOOL)_isAllowedToCollectStatisticsForDate:(id)a3
{
  id v4 = a3;
  v5 = [(IRStatisticsManager *)self statistics];
  v6 = [v5 lastClearDate];
  v7 = +[IRPreferences shared];
  id v8 = [v7 coreAnalyticsStatisticsCollectionPeriodInSeconds];
  [v8 doubleValue];
  v9 = objc_msgSend(v6, "dateByAddingTimeInterval:");
  char v10 = [v4 isEarlierThan:v9];

  return v10;
}

- (IRStatisticsDO)statistics
{
  return self->_statistics;
}

- (void)setTimeToBannerInMilliSeconds:(id)a3
{
}

- (void)setAppLaunchDate:(id)a3
{
}

- (void)setStatistics:(id)a3
{
}

- (void)setModeDate:(id)a3
{
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (IRStatisticsManager)initWithStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRStatisticsManager;
  v5 = [(IRStatisticsManager *)&v11 init];
  v6 = v5;
  if (v5
    && ([(IRStatisticsManager *)v5 setStore:v4],
        [(IRStatisticsManager *)v6 setMode:0],
        ![(IRStatisticsManager *)v6 _initStatistics]))
  {
    id v8 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v9 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "#statistics-manager, ";
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Statistics init error] Couldnt fetch statistics", buf, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (void)event:(id)a3 forCandidate:(id)a4 inspections:(id)a5 date:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(IRStatisticsManager *)self _isAllowedToCollectStatisticsForDate:a6])
  {
    v13 = +[IREventDO eventDOWithMediaType:0];
    int v14 = [v10 isEqual:v13];

    if (v14)
    {
      if ([v11 containsAirplayTarget])
      {
        uint64_t v15 = [(IRStatisticsManager *)self statistics];
        uint64_t v16 = [(IRStatisticsManager *)self statistics];
        double v17 = objc_msgSend(v15, "copyWithReplacementNumberOfPickerChoiceEvents:", objc_msgSend(v16, "numberOfPickerChoiceEvents") + 1);
        [(IRStatisticsManager *)self setStatistics:v17];

        int v18 = [v12 objectForKeyedSubscript:*MEMORY[0x263F50080]];
        id v19 = [v18 candidates];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __59__IRStatisticsManager_event_forCandidate_inspections_date___block_invoke;
        v29[3] = &unk_2653A09E8;
        id v30 = v11;
        __int16 v20 = [v19 firstWhere:v29];

        if (v20)
        {
          v21 = [(IRStatisticsManager *)self statistics];
          uint64_t v22 = [(IRStatisticsManager *)self statistics];
          id v23 = objc_msgSend(v21, "copyWithReplacementNumberOfCorrectPickerChoiceEvents:", objc_msgSend(v22, "numberOfCorrectPickerChoiceEvents") + 1);
          [(IRStatisticsManager *)self setStatistics:v23];
        }
        v24 = [(IRStatisticsManager *)self store];
        v25 = [(IRStatisticsManager *)self statistics];
        char v26 = [v24 updateStatistics:v25];

        if ((v26 & 1) == 0)
        {
          v27 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
          v28 = *MEMORY[0x263F50090];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v32 = "#statistics-manager, ";
            __int16 v33 = 2112;
            v34 = v27;
            _os_log_impl(&dword_25418E000, v28, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Statistics update error event] Couldnt update statistics upon adding event", buf, 0x16u);
          }
        }
      }
    }
  }
}

BOOL __59__IRStatisticsManager_event_forCandidate_inspections_date___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 inspectionGenerator];
  v5 = [v4 candidate];
  v6 = [v5 candidateIdentifier];
  v7 = [*(id *)(a1 + 32) candidateIdentifier];
  if ([v6 isEqual:v7])
  {
    id v8 = [v3 inspectionGenerator];
    BOOL v9 = [v8 classification] > 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)clearStatistics:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = +[IRStatisticsDO statisticsDOWithNumberOfContextChanges:0 numberOfMiLoPredictions:0 numberOfMiLoPredictionsInUpdatesMode:0 lastMiLoLSLItems:0 lastMiLoQualityReasonBitmap:0 lastMiLoQuality:0 lastMiLoModels:0 timeInUpdatesModeInSeconds:0 numberOfPickerChoiceEvents:0 numberOfCorrectPickerChoiceEvents:0 lastClearDate:a3];
  [(IRStatisticsManager *)self setStatistics:v4];

  v5 = [(IRStatisticsManager *)self store];
  v6 = [(IRStatisticsManager *)self statistics];
  char v7 = [v5 updateStatistics:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    BOOL v9 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "#statistics-manager, ";
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Statistics clear error] Couldnt clear statistics", buf, 0x16u);
    }
  }
}

- (void)bannerContextWithDate:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = [(IRStatisticsManager *)self appLaunchDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  BOOL v9 = [v4 numberWithDouble:v8 * 1000.0];
  [(IRStatisticsManager *)self setTimeToBannerInMilliSeconds:v9];

  [(IRStatisticsManager *)self setAppLaunchDate:0];
}

- (BOOL)_initStatistics
{
  id v3 = [(IRStatisticsManager *)self store];
  id v4 = [v3 fetchStatistics];
  [(IRStatisticsManager *)self setStatistics:v4];

  id v5 = [(IRStatisticsManager *)self statistics];

  if (v5)
  {
    v6 = [(IRStatisticsManager *)self statistics];
    double v7 = [v6 lastClearDate];

    if (!v7)
    {
      double v8 = [(IRStatisticsManager *)self statistics];
      BOOL v9 = [MEMORY[0x263EFF910] date];
      id v10 = (void *)[v8 copyWithReplacementLastClearDate:v9];
      [(IRStatisticsManager *)self setStatistics:v10];
    }
  }
  return v5 != 0;
}

- (void)setStore:(id)a3
{
}

- (NSNumber)timeToBannerInMilliSeconds
{
  return self->_timeToBannerInMilliSeconds;
}

- (NSDate)modeDate
{
  return self->_modeDate;
}

- (NSDate)appLaunchDate
{
  return self->_appLaunchDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchDate, 0);
  objc_storeStrong((id *)&self->_modeDate, 0);
  objc_storeStrong((id *)&self->_timeToBannerInMilliSeconds, 0);
  objc_storeStrong((id *)&self->_statistics, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end
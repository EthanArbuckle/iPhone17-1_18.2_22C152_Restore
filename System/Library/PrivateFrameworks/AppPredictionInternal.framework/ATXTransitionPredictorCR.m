@interface ATXTransitionPredictorCR
- (ATXTransitionPredictorCR)initWithLocationManager:(id)a3 locationPredictionsManager:(id)a4;
- (BOOL)isCacheValidForDate:(id)a3 location:(id)a4;
- (BOOL)updateCacheOnActivity:(id)a3;
- (NSDate)now;
- (id)getNextTransitionOnActivity:(id)a3;
- (id)getNextTransitionOnActivity:(id)a3 date:(id)a4 location:(id)a5;
- (id)nextExitDate;
- (id)nextLoi;
- (void)invalidateCache;
- (void)setNow:(id)a3;
@end

@implementation ATXTransitionPredictorCR

- (NSDate)now
{
  now = self->_now;
  if (now) {
    v3 = now;
  }
  else {
    v3 = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (void)setNow:(id)a3
{
}

- (ATXTransitionPredictorCR)initWithLocationManager:(id)a3 locationPredictionsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXTransitionPredictorCR;
  v9 = [(ATXTransitionPredictorCR *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationManager, a3);
    objc_storeStrong((id *)&v10->_predictionsManager, a4);
    [(ATXTransitionPredictorCR *)v10 invalidateCache];
  }

  return v10;
}

- (id)getNextTransitionOnActivity:(id)a3
{
  id v4 = a3;
  if ([v4 shouldDefer])
  {
    v5 = 0;
  }
  else
  {
    v6 = [(ATXTransitionPredictorCR *)self now];
    id v7 = [(ATXLocationManagerProtocol *)self->_locationManager getCurrentLocation];
    v5 = [(ATXTransitionPredictorCR *)self getNextTransitionOnActivity:v4 date:v6 location:v7];
  }
  return v5;
}

- (id)getNextTransitionOnActivity:(id)a3 date:(id)a4 location:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    if (![(ATXTransitionPredictorCR *)self isCacheValidForDate:a4 location:a5])
    {
      BOOL v9 = [(ATXTransitionPredictorCR *)self updateCacheOnActivity:v8];
      v10 = __atxlog_handle_dailyroutines();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = @"failure";
        if (v9) {
          v11 = @"success";
        }
        int v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Cache update %@", (uint8_t *)&v14, 0xCu);
      }
    }
    objc_super v12 = self->_upcomingTransition;
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (BOOL)isCacheValidForDate:(id)a3 location:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_locationAtLastPrediction && self->_upcomingTransition)
  {
    [v6 timeIntervalSinceReferenceDate];
    double v9 = v8;
    v10 = [(ATXPredictedTransition *)self->_upcomingTransition date];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11 + 60.0;

    [v7 distanceFromLocation:self->_locationAtLastPrediction];
    double v14 = v13;
    v15 = @"No";
    if (v13 < 200.0) {
      v15 = @"Yes";
    }
    uint64_t v16 = v15;
    v17 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(ATXPredictedTransition *)self->_upcomingTransition date];
      int v21 = 138412802;
      id v22 = v6;
      __int16 v23 = 2112;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Cache status -- time: %@ <? %@ + grace period, location valid: %@", (uint8_t *)&v21, 0x20u);
    }
    BOOL v19 = v14 < 200.0 && v9 < v12;
  }
  else
  {
    uint64_t v16 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Cache not set", (uint8_t *)&v21, 2u);
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (void)invalidateCache
{
  locationAtLastPrediction = self->_locationAtLastPrediction;
  self->_locationAtLastPrediction = 0;

  upcomingTransition = self->_upcomingTransition;
  self->_upcomingTransition = 0;
}

- (BOOL)updateCacheOnActivity:(id)a3
{
  id v4 = a3;
  v5 = [(ATXLocationManagerProtocol *)self->_locationManager getCurrentLocation];
  if (v5 && ![v4 shouldDefer])
  {
    id v7 = [(ATXTransitionPredictorCR *)self nextExitDate];
    if ([v4 shouldDefer])
    {
      [(ATXTransitionPredictorCR *)self invalidateCache];
      BOOL v6 = 0;
    }
    else
    {
      double v8 = [(ATXTransitionPredictorCR *)self nextLoi];
      objc_storeStrong((id *)&self->_locationAtLastPrediction, v5);
      double v9 = [[ATXPredictedTransition alloc] initWithDate:v7 loi:v8];
      upcomingTransition = self->_upcomingTransition;
      self->_upcomingTransition = v9;

      BOOL v6 = self->_upcomingTransition != 0;
    }
  }
  else
  {
    [(ATXTransitionPredictorCR *)self invalidateCache];
    BOOL v6 = 0;
  }

  return v6;
}

- (id)nextExitDate
{
  v3 = [(ATXPredictedLocationsManagerProtocol *)self->_predictionsManager predictedExitTimes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__ATXTransitionPredictorCR_nextExitDate__block_invoke;
  v8[3] = &unk_1E68ACA90;
  v8[4] = self;
  id v4 = objc_msgSend(v3, "_pas_filteredArrayWithTest:", v8);
  v5 = [v4 sortedArrayUsingSelector:sel_compare_];
  BOOL v6 = [v5 firstObject];

  return v6;
}

BOOL __40__ATXTransitionPredictorCR_nextExitDate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) now];
  [v3 timeIntervalSinceDate:v4];
  if (v5 <= 0.0)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v6 = [*(id *)(a1 + 32) now];
    [v3 timeIntervalSinceDate:v6];
    BOOL v8 = v7 < 7200.0;
  }
  return v8;
}

- (id)nextLoi
{
  v2 = [(ATXPredictedLocationsManagerProtocol *)self->_predictionsManager predictedLocationsOfInterest];
  id v3 = objc_msgSend(v2, "_pas_filteredArrayWithTest:", &__block_literal_global_130);
  if ((unint64_t)[v3 count] > 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 firstObject];
  }

  return v4;
}

BOOL __35__ATXTransitionPredictorCR_nextLoi__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 1 || objc_msgSend(v2, "type") == 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_upcomingTransition, 0);
  objc_storeStrong((id *)&self->_locationAtLastPrediction, 0);
  objc_storeStrong((id *)&self->_predictionsManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
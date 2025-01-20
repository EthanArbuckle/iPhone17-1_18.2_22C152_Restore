@interface ATXSlotResolutionParametersStatistics
+ (double)_smoothedBudgetForTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4;
+ (double)_smoothedCountForCoarseTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4;
+ (double)_smoothedCountForEightHourWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4;
+ (double)_smoothedCountForHourWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4;
+ (double)_smoothedCountForThirtyMinuteWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4;
+ (double)_smoothedCountForTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4;
+ (double)smoothedRatio:(double)a3 over:(double)a4;
- (ATXSlotResolutionParametersStatistics)initWithNumParameters:(int)a3;
- (double)_confirmRatio;
- (double)_timeOfDayBudgetStandardDeviation;
- (double)_totalFeedbackEvents;
- (id)description;
- (void)_updateTimeOfDayBudgetStatisticsForNewTimeOfDayBudget:(double)a3;
@end

@implementation ATXSlotResolutionParametersStatistics

- (ATXSlotResolutionParametersStatistics)initWithNumParameters:(int)a3
{
  v21.receiver = self;
  v21.super_class = (Class)ATXSlotResolutionParametersStatistics;
  v4 = [(ATXSlotResolutionParametersStatistics *)&v21 init];
  v5 = v4;
  if (v4)
  {
    *((_DWORD *)v4 + 6) = a3;
    *((_DWORD *)v4 + 2) = 0;
    *((void *)v4 + 2) = 0;
    *((void *)v4 + 74) = 0;
    *(_OWORD *)(v4 + 248) = 0u;
    *((void *)v4 + 45) = 0;
    *(_OWORD *)(v4 + 232) = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    *(_OWORD *)(v4 + 280) = 0u;
    *(_OWORD *)(v4 + 296) = 0u;
    *(_OWORD *)(v4 + 312) = 0u;
    *(_OWORD *)(v4 + 328) = 0u;
    *(_OWORD *)(v4 + 344) = 0u;
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    v7 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v6;

    int64x2_t v8 = vdupq_n_s64(0x41086A0000000000uLL);
    *(int64x2_t *)(v5 + 88) = v8;
    *(int64x2_t *)(v5 + 104) = v8;
    *(int64x2_t *)(v5 + 120) = v8;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_OWORD *)(v5 + 152) = 0u;
    *(_OWORD *)(v5 + 168) = 0u;
    *(_OWORD *)(v5 + 184) = 0u;
    *(_OWORD *)(v5 + 200) = 0u;
    *(_OWORD *)(v5 + 216) = 0u;
    uint64_t v9 = objc_opt_new();
    v10 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v9;

    *((void *)v5 + 8) = 0;
    *((void *)v5 + 9) = 0;
    *((void *)v5 + 10) = 0;
    *((_OWORD *)v5 + 23) = 0u;
    *((_OWORD *)v5 + 24) = 0u;
    *((_OWORD *)v5 + 25) = 0u;
    *((_OWORD *)v5 + 26) = 0u;
    *((_OWORD *)v5 + 27) = 0u;
    *((_OWORD *)v5 + 28) = 0u;
    *((_OWORD *)v5 + 29) = 0u;
    *((_OWORD *)v5 + 30) = 0u;
    *((_OWORD *)v5 + 31) = 0u;
    *((_OWORD *)v5 + 32) = 0u;
    *((_OWORD *)v5 + 33) = 0u;
    *((_OWORD *)v5 + 34) = 0u;
    *((_OWORD *)v5 + 35) = 0u;
    *((_OWORD *)v5 + 36) = 0u;
    bzero(v5 + 600, 0x218uLL);
    uint64_t v11 = objc_opt_new();
    v12 = (void *)*((void *)v5 + 142);
    *((void *)v5 + 142) = v11;

    uint64_t v13 = objc_opt_new();
    v14 = (void *)*((void *)v5 + 143);
    *((void *)v5 + 143) = v13;

    uint64_t v15 = objc_opt_new();
    v16 = (void *)*((void *)v5 + 144);
    *((void *)v5 + 144) = v15;

    uint64_t v17 = objc_opt_new();
    v18 = (void *)*((void *)v5 + 145);
    *((void *)v5 + 145) = v17;

    v19 = v5;
  }

  return (ATXSlotResolutionParametersStatistics *)v5;
}

- (void)_updateTimeOfDayBudgetStatisticsForNewTimeOfDayBudget:(double)a3
{
  double v3 = self->_timeOfDayBudgetCount + 1.0;
  self->_timeOfDayBudgetCount = v3;
  double timeOfDayBudgetMean = self->_timeOfDayBudgetMean;
  double v5 = timeOfDayBudgetMean + (a3 - timeOfDayBudgetMean) / v3;
  self->_double timeOfDayBudgetMean = v5;
  self->_timeOfDayBudgetSumOfSquaresOfDifferencesFromMean = self->_timeOfDayBudgetSumOfSquaresOfDifferencesFromMean
                                                          + (a3 - timeOfDayBudgetMean) * (a3 - v5);
}

- (double)_timeOfDayBudgetStandardDeviation
{
  double timeOfDayBudgetCount = self->_timeOfDayBudgetCount;
  if (timeOfDayBudgetCount >= 2.0) {
    return sqrt(self->_timeOfDayBudgetSumOfSquaresOfDifferencesFromMean / (timeOfDayBudgetCount + -1.0));
  }
  else {
    return 0.0;
  }
}

+ (double)smoothedRatio:(double)a3 over:(double)a4
{
  uint64_t v6 = +[_ATXGlobals sharedInstance];
  [v6 slotResolutionRatioSmoothingThreshold];
  double v8 = v7;

  return a3 * a4 / ((v8 + a4) * (v8 + a4));
}

- (double)_totalFeedbackEvents
{
  return self->_totalRejects + self->_totalConfirms;
}

- (double)_confirmRatio
{
  [(ATXSlotResolutionParametersStatistics *)self _totalFeedbackEvents];
  if (v4 < self->_totalConfirms)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ATXActionStatistics.m", 433, @"Invalid parameter not satisfying: %@", @"[self _totalFeedbackEvents] >= _totalConfirms" object file lineNumber description];
  }
  [(ATXSlotResolutionParametersStatistics *)self _totalFeedbackEvents];
  double v5 = 0.0;
  if (v6 > 0.0)
  {
    double totalConfirms = self->_totalConfirms;
    [(ATXSlotResolutionParametersStatistics *)self _totalFeedbackEvents];
    +[ATXSlotResolutionParametersStatistics smoothedRatio:totalConfirms over:v8];
    double v5 = v9;
    if (v9 < 0.0 || v9 > 1.0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ATXActionStatistics.m", 436, @"Invalid probablity found: %f", *(void *)&v5);
    }
  }
  return v5;
}

+ (double)_smoothedCountForTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  double v6 = +[_ATXGlobals sharedInstance];
  [v6 smoothedCountForTimeOfDayStd];
  double v8 = v7;

  return ATXGaussianDistributionWithZeroMean(v8, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedCountForCoarseTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  double v6 = +[_ATXGlobals sharedInstance];
  [v6 smoothedCountForCoarseTimeOfDayStd];
  double v8 = v7;

  return ATXGaussianDistributionWithZeroMean(v8, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedCountForThirtyMinuteWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  return ATXGaussianDistributionWithZeroMean(7.5, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedCountForHourWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  return ATXGaussianDistributionWithZeroMean(15.0, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedCountForEightHourWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  return ATXGaussianDistributionWithZeroMean(120.0, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedBudgetForTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  double v6 = +[_ATXGlobals sharedInstance];
  [v6 smoothedBudgetForTimeOfDayStd];
  double v8 = v7;

  return ATXGaussianDistributionWithZeroMean(v8, (double)(a3 - a4) * 0.0166666667);
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"Statistics for %d parameters", self->_numParameters);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificGeoHashDistributionOfLaunches, 0);
  objc_storeStrong((id *)&self->_coarseGeoHashDistributionOfLaunches, 0);
  objc_storeStrong((id *)&self->_timeOfDayDistributionOfLaunches, 0);
  objc_storeStrong((id *)&self->_dayOfWeekDistributionOfLaunches, 0);
  objc_storeStrong((id *)&self->_latestOccurrenceTime, 0);
  objc_storeStrong((id *)&self->_earliestOccurrenceTime, 0);
  objc_storeStrong((id *)&self->_uniqueDaysLaunched, 0);
  objc_storeStrong((id *)&self->_latestAppSessionStartDate, 0);
}

@end
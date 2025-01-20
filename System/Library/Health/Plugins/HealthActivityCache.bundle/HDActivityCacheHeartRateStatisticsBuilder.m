@interface HDActivityCacheHeartRateStatisticsBuilder
- (HDActivityCacheHeartRateStatisticsBuilder)initWithDateInterval:(id)a3 activityCacheIndex:(int64_t)a4;
- (HKDateIntervalTree)asleepTimeIntervals;
- (HKHeartRateSummary)heartRateSummary;
- (id).cxx_construct;
- (void)addAsleepTimeIntervals:(id)a3;
- (void)addBreatheSessions:(const void *)a3;
- (void)addHeartRateSamples:(const void *)a3;
- (void)addWorkouts:(const void *)a3;
- (void)reportDailyAnalyticsWithProfile:(id)a3;
- (void)setDateOfBirthComponents:(id)a3;
@end

@implementation HDActivityCacheHeartRateStatisticsBuilder

- (HDActivityCacheHeartRateStatisticsBuilder)initWithDateInterval:(id)a3 activityCacheIndex:(int64_t)a4
{
  id v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HDActivityCacheHeartRateStatisticsBuilder;
  v8 = [(HDActivityCacheHeartRateStatisticsBuilder *)&v30 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateInterval, a3);
    v9->_activityCacheIndex = a4;
    id v10 = objc_alloc((Class)HKHeartRateSummaryStatistics);
    v11 = (HKHeartRateSummaryStatistics *)[v10 initWithDateInterval:v7 numberOfBuckets:HDActivityCacheHeartRateStatisticsBuilderNumberOfHeartRateBuckets sessionUUID:0];
    allDayStatistics = v9->_allDayStatistics;
    v9->_allDayStatistics = v11;

    uint64_t v13 = +[NSMutableArray array];
    workoutStatistics = v9->_workoutStatistics;
    v9->_workoutStatistics = (NSMutableArray *)v13;

    uint64_t v15 = +[NSMutableArray array];
    workoutRecoveryStatistics = v9->_workoutRecoveryStatistics;
    v9->_workoutRecoveryStatistics = (NSMutableArray *)v15;

    uint64_t v17 = +[NSMutableArray array];
    breatheStatistics = v9->_breatheStatistics;
    v9->_breatheStatistics = (NSMutableArray *)v17;

    uint64_t v19 = +[NSMutableDictionary dictionary];
    averageCalculatorsByWorkoutUUID = v9->_averageCalculatorsByWorkoutUUID;
    v9->_averageCalculatorsByWorkoutUUID = (NSMutableDictionary *)v19;

    uint64_t v21 = +[NSMutableDictionary dictionary];
    recoveryReadingsByWorkoutUUID = v9->_recoveryReadingsByWorkoutUUID;
    v9->_recoveryReadingsByWorkoutUUID = (NSMutableDictionary *)v21;

    uint64_t v23 = +[NSMutableDictionary dictionary];
    breatheSessionReadingsBySessionUUID = v9->_breatheSessionReadingsBySessionUUID;
    v9->_breatheSessionReadingsBySessionUUID = (NSMutableDictionary *)v23;

    uint64_t v25 = +[NSMutableDictionary dictionary];
    breatheSessionDateIntervalBySessionUUID = v9->_breatheSessionDateIntervalBySessionUUID;
    v9->_breatheSessionDateIntervalBySessionUUID = (NSMutableDictionary *)v25;

    v27 = (HKDateIntervalTree *)objc_alloc_init((Class)HKDateIntervalTree);
    asleepTimeIntervals = v9->_asleepTimeIntervals;
    v9->_asleepTimeIntervals = v27;
  }
  return v9;
}

- (HKHeartRateSummary)heartRateSummary
{
  v3 = sub_179B0(self, 10, 0, 0);
  id v4 = objc_alloc((Class)HKHeartRateSummary);
  int64_t activityCacheIndex = self->_activityCacheIndex;
  v6 = sub_17DF0((uint64_t)self);
  id v7 = sub_17EB4(self);
  id v8 = [v4 initWithActivityCacheIndex:activityCacheIndex heartRateDateInterval:v6 restingHeartRate:v3 walkingAverageHeartRate:v7 allDayStatistics:self->_allDayStatistics workoutStatistics:self->_workoutStatistics workoutRecoveryStatistics:self->_workoutRecoveryStatistics breatheStatistics:self->_breatheStatistics];

  return (HKHeartRateSummary *)v8;
}

- (void)addHeartRateSamples:(const void *)a3
{
  v5 = *(char **)a3;
  v6 = (char *)*((void *)a3 + 1);
  if (v6 != v5)
  {
    begin = self->_heartRateSamples.__begin_;
    uint64_t v9 = self->_heartRateSamples.__end_ - begin;
    if (v9)
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v9 >> 3);
      sub_16404((void **)&self->_heartRateSamples.__begin_, v10 - 0x5555555555555555 * ((v6 - v5) >> 3));
      sub_164DC((uint64_t)&self->_heartRateSamples, (uint64_t)self->_heartRateSamples.__end_, *(char **)a3, *((char **)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
      sub_16864((long long *)self->_heartRateSamples.__begin_, (double *)self->_heartRateSamples.__begin_ + 3 * v10, (long long *)self->_heartRateSamples.__end_, (uint64_t)&v20);
    }
    else
    {
      sub_164DC((uint64_t)&self->_heartRateSamples, (uint64_t)begin, v5, v6, 0xAAAAAAAAAAAAAAABLL * ((v6 - v5) >> 3));
    }
  }
  sub_18538((uint64_t)self, (double **)a3);
  v11 = *(char **)a3;
  v12 = (char *)*((void *)a3 + 1);
  if (*(char **)a3 != v12)
  {
    char v13 = 0;
    int v14 = 0;
    while (1)
    {
      int v15 = *((_DWORD *)v11 + 4);
      int v16 = v15 == 4 ? 1 : v14;
      if (v15 == 3) {
        char v13 = 1;
      }
      else {
        int v14 = v16;
      }
      if (v13 & 1) != 0 && (v14) {
        break;
      }
      v11 += 24;
      if (v11 == v12)
      {
        if (v13)
        {
          restingHeartRate = self->_restingHeartRate;
          self->_restingHeartRate = 0;
        }
        if ((v14 & 1) == 0) {
          return;
        }
LABEL_21:
        walkingAverageHeartRate = self->_walkingAverageHeartRate;
        self->_walkingAverageHeartRate = 0;

        return;
      }
    }
    v18 = self->_restingHeartRate;
    self->_restingHeartRate = 0;

    goto LABEL_21;
  }
}

- (void)addAsleepTimeIntervals:(id)a3
{
  id v4 = a3;
  restingHeartRate = self->_restingHeartRate;
  self->_restingHeartRate = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v6 = objc_msgSend(v4, "mergedIntervals", 0);
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [(HKDateIntervalTree *)self->_asleepTimeIntervals insertInterval:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addWorkouts:(const void *)a3
{
  v5 = *(char **)a3;
  v6 = (char *)*((void *)a3 + 1);
  if (v6 != v5)
  {
    uint64_t v8 = (v6 - v5) >> 6;
    begin = self->_workouts.__begin_;
    end = self->_workouts.__end_;
    uint64_t v11 = end - begin;
    if (end == begin)
    {
      sub_1A5D4((uint64_t)&self->_workouts, (uint64_t)begin, v5, v6, v8);
    }
    else
    {
      sub_1A51C((void **)&self->_workouts.__begin_, v8 + (v11 >> 6));
      sub_1A5D4((uint64_t)&self->_workouts, (uint64_t)self->_workouts.__end_, *(char **)a3, *((char **)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 6);
      sub_1A8DC((double *)self->_workouts.__begin_, (double *)self->_workouts.__begin_ + 8 * (v11 >> 6), (long long *)self->_workouts.__end_, (uint64_t)&v14);
    }
  }
  sub_198D0((uint64_t)self, (uint64_t *)a3);
  for (i = *(char **)a3; i != *((char **)a3 + 1); i += 64)
  {
    if (*((void *)i + 2) == 52)
    {
      walkingAverageHeartRate = self->_walkingAverageHeartRate;
      self->_walkingAverageHeartRate = 0;

      return;
    }
  }
}

- (void)addBreatheSessions:(const void *)a3
{
  id v16 = +[NSMutableArray array];
  v5 = *(double **)a3;
  v6 = (double *)*((void *)a3 + 1);
  if (*(double **)a3 != v6)
  {
    do
    {
      id v7 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v5 + 2];
      id v8 = objc_alloc((Class)NSDateInterval);
      uint64_t v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*v5];
      long long v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v5[1]];
      id v11 = [v8 initWithStartDate:v9 endDate:v10];

      [(NSMutableDictionary *)self->_breatheSessionDateIntervalBySessionUUID setObject:v11 forKeyedSubscript:v7];
      long long v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*v5 + (*v5 - v5[1] + 900.0) * -0.5];
      id v13 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v12 duration:900.0];
      id v14 = objc_alloc((Class)HKHeartRateSummaryBreatheStatistics);
      id v15 = [v14 initWithDateInterval:v13 numberOfBuckets:HDActivityCacheHeartRateStatisticsBuilderNumberOfHeartRateBuckets sessionUUID:v7];
      [(NSMutableArray *)self->_breatheStatistics addObject:v15];
      [v16 addObject:v15];

      v5 += 4;
    }
    while (v5 != v6);
  }
  sub_185E8((id *)&self->super.isa, (double **)&self->_heartRateSamples, v16);
}

- (void)setDateOfBirthComponents:(id)a3
{
}

- (void)reportDailyAnalyticsWithProfile:(id)a3
{
  id v4 = a3;
  restingHeartRate = self->_restingHeartRate;
  self->_restingHeartRate = 0;

  uint64_t v12 = 0;
  v6 = sub_179B0(self, 2, (_DWORD *)&v12 + 1, &v12);
  id v7 = +[HKUnit _countPerMinuteUnit];
  [v6 doubleValueForUnit:v7];
  double v9 = v8;

  long long v10 = [v4 daemon];
  id v11 = [v10 analyticsSubmissionCoordinator];
  objc_msgSend(v11, "heartRate_reportDailyRestingHeartRate:sedentaryHeartRateCount:filteredSedentaryHeartRateCount:profileType:", HIDWORD(v12), v12, objc_msgSend(v4, "profileType"), v9);
}

- (HKDateIntervalTree)asleepTimeIntervals
{
  return self->_asleepTimeIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asleepTimeIntervals, 0);
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
  objc_storeStrong((id *)&self->_breatheSessionDateIntervalBySessionUUID, 0);
  objc_storeStrong((id *)&self->_breatheSessionReadingsBySessionUUID, 0);
  objc_storeStrong((id *)&self->_recoveryReadingsByWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_averageCalculatorsByWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_breatheStatistics, 0);
  objc_storeStrong((id *)&self->_workoutRecoveryStatistics, 0);
  objc_storeStrong((id *)&self->_workoutStatistics, 0);
  objc_storeStrong((id *)&self->_allDayStatistics, 0);
  objc_storeStrong((id *)&self->_walkingAverageHeartRate, 0);
  objc_storeStrong((id *)&self->_restingHeartRate, 0);
  begin = self->_workouts.__begin_;
  if (begin)
  {
    self->_workouts.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_heartRateSamples.__begin_;
  if (v4)
  {
    self->_heartRateSamples.__end_ = v4;
    operator delete(v4);
  }

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end
@interface HDActivityCacheStatisticsBuilder
- (HDActivityCacheStatisticsBuilder)init;
- (HDActivityCacheStatisticsBuilder)initWithDateInterval:(id)a3 loggingName:(id)a4;
- (HDActivityCacheStatisticsBuilderSourceDelegate)sourceDelegate;
- (double)deepBreathingDurationValue;
- (double)intervalDuration;
- (id).cxx_construct;
- (id)activeEnergyValue;
- (id)createExerciseStatisticsWithIntervalComponents:(id)a3 calendar:(id)a4;
- (id)createMoveMinuteStatisticsWithIntervalComponents:(id)a3 calendar:(id)a4;
- (id)createMoveStatisticsWithIntervalComponents:(id)a3 calendar:(id)a4;
- (id)createStandStatisticsWithCalendar:(id)a3;
- (id)createStatisticsCollectionWithType:(id)a3 intervalComponents:(id)a4 calendar:(id)a5;
- (id)distanceWalkingValue;
- (id)workoutSamplesWithSourceManager:(id)a3;
- (int64_t)exerciseMinuteValue;
- (int64_t)flightsClimbedValue;
- (int64_t)moveMinuteValue;
- (int64_t)pushCountValue;
- (int64_t)standHourValue;
- (int64_t)stepCountValue;
- (void)addActivationLogSamples:(const void *)a3;
- (void)addDeepBreathingSessionDuration:(double)a3;
- (void)addDeviceSample:(HDActivityCacheStatisticsBuilderSample *)a3 typeCode:(int64_t)a4;
- (void)addDeviceSamples:(const void *)a3 typeCode:(int64_t)a4;
- (void)addStandHourSamples:(const void *)a3;
- (void)addWorkoutSample:(HDActivityCacheStatisticsBuilderSample *)a3 typeCode:(int64_t)a4;
- (void)addWorkouts:(const void *)a3;
- (void)setIntervalDuration:(double)a3;
- (void)setSourceDelegate:(id)a3;
@end

@implementation HDActivityCacheStatisticsBuilder

- (HDActivityCacheStatisticsBuilder)initWithDateInterval:(id)a3 loggingName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDActivityCacheStatisticsBuilder;
  v8 = [(HDActivityCacheStatisticsBuilder *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_loggingName, a4);
    *(void *)&v9->_intervalDuration = HDActivityCacheStatisticsBuilderDefaultIntervalDuration;
    v10 = [v6 startDate];
    [v10 timeIntervalSinceReferenceDate];
    v9->_builderStartTime = v11;

    v12 = [v6 endDate];
    [v12 timeIntervalSinceReferenceDate];
    v9->_builderEndTime = v13;

    v9->_deepBreathingDurationValue = 0.0;
  }

  return v9;
}

- (HDActivityCacheStatisticsBuilder)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (id)activeEnergyValue
{
  lastActiveEnergyValue = self->_lastActiveEnergyValue;
  if (!lastActiveEnergyValue)
  {
    sub_1B5C4((uint64_t)self, 10, (char **)&v14);
    uint64_t v13 = 10;
    v16 = &v13;
    v4 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v13, (uint64_t)&std::piecewise_construct, &v16);
    double v11 = 0;
    uint64_t v12 = 0;
    __p = 0;
    sub_E25C(&__p, v14, (uint64_t)v15, (v15 - (unsigned char *)v14) >> 3);
    double v5 = sub_1BA1C((uint64_t)self, v4 + 5, (uint64_t)&__p);
    if (__p)
    {
      double v11 = __p;
      operator delete(__p);
    }
    id v6 = +[HKUnit kilocalorieUnit];
    id v7 = +[HKQuantity quantityWithUnit:v6 doubleValue:v5];
    v8 = self->_lastActiveEnergyValue;
    self->_lastActiveEnergyValue = v7;

    if (v14)
    {
      objc_super v15 = v14;
      operator delete(v14);
    }
    lastActiveEnergyValue = self->_lastActiveEnergyValue;
  }

  return lastActiveEnergyValue;
}

- (int64_t)moveMinuteValue
{
  lastMoveMinuteValue = self->_lastMoveMinuteValue;
  if (!lastMoveMinuteValue)
  {
    sub_1B5C4((uint64_t)self, 179, (char **)&v13);
    uint64_t v12 = 179;
    objc_super v15 = &v12;
    v4 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v12, (uint64_t)&std::piecewise_construct, &v15);
    v10 = 0;
    uint64_t v11 = 0;
    __p = 0;
    sub_E25C(&__p, v13, (uint64_t)v14, (v14 - (unsigned char *)v13) >> 3);
    double v5 = sub_1BA1C((uint64_t)self, v4 + 5, (uint64_t)&__p);
    if (__p)
    {
      v10 = __p;
      operator delete(__p);
    }
    id v6 = +[NSNumber numberWithDouble:round(v5)];
    id v7 = self->_lastMoveMinuteValue;
    self->_lastMoveMinuteValue = v6;

    if (v13)
    {
      v14 = v13;
      operator delete(v13);
    }
    lastMoveMinuteValue = self->_lastMoveMinuteValue;
  }
  return [(NSNumber *)lastMoveMinuteValue integerValue];
}

- (id)distanceWalkingValue
{
  lastDistanceWalkingValue = self->_lastDistanceWalkingValue;
  if (!lastDistanceWalkingValue)
  {
    sub_1B5C4((uint64_t)self, 8, (char **)&v14);
    uint64_t v13 = 8;
    v16 = &v13;
    v4 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v13, (uint64_t)&std::piecewise_construct, &v16);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    __p = 0;
    sub_E25C(&__p, v14, (uint64_t)v15, (v15 - (unsigned char *)v14) >> 3);
    double v5 = sub_1BA1C((uint64_t)self, v4 + 5, (uint64_t)&__p);
    if (__p)
    {
      uint64_t v11 = __p;
      operator delete(__p);
    }
    id v6 = +[HKUnit meterUnit];
    id v7 = +[HKQuantity quantityWithUnit:v6 doubleValue:v5];
    v8 = self->_lastDistanceWalkingValue;
    self->_lastDistanceWalkingValue = v7;

    if (v14)
    {
      objc_super v15 = v14;
      operator delete(v14);
    }
    lastDistanceWalkingValue = self->_lastDistanceWalkingValue;
  }

  return lastDistanceWalkingValue;
}

- (int64_t)flightsClimbedValue
{
  lastFlightsClimbedValue = self->_lastFlightsClimbedValue;
  if (!lastFlightsClimbedValue)
  {
    sub_1B5C4((uint64_t)self, 12, (char **)&v13);
    uint64_t v12 = 12;
    objc_super v15 = &v12;
    v4 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v12, (uint64_t)&std::piecewise_construct, &v15);
    v10 = 0;
    uint64_t v11 = 0;
    __p = 0;
    sub_E25C(&__p, v13, (uint64_t)v14, (v14 - (unsigned char *)v13) >> 3);
    double v5 = sub_1BA1C((uint64_t)self, v4 + 5, (uint64_t)&__p);
    if (__p)
    {
      v10 = __p;
      operator delete(__p);
    }
    id v6 = +[NSNumber numberWithDouble:round(v5)];
    id v7 = self->_lastFlightsClimbedValue;
    self->_lastFlightsClimbedValue = v6;

    if (v13)
    {
      v14 = v13;
      operator delete(v13);
    }
    lastFlightsClimbedValue = self->_lastFlightsClimbedValue;
  }
  return [(NSNumber *)lastFlightsClimbedValue integerValue];
}

- (int64_t)stepCountValue
{
  lastStepCountValue = self->_lastStepCountValue;
  if (!lastStepCountValue)
  {
    sub_1B5C4((uint64_t)self, 7, (char **)&v13);
    uint64_t v12 = 7;
    objc_super v15 = &v12;
    v4 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v12, (uint64_t)&std::piecewise_construct, &v15);
    v10 = 0;
    uint64_t v11 = 0;
    __p = 0;
    sub_E25C(&__p, v13, (uint64_t)v14, (v14 - (unsigned char *)v13) >> 3);
    double v5 = sub_1BA1C((uint64_t)self, v4 + 5, (uint64_t)&__p);
    if (__p)
    {
      v10 = __p;
      operator delete(__p);
    }
    id v6 = +[NSNumber numberWithDouble:round(v5)];
    id v7 = self->_lastStepCountValue;
    self->_lastStepCountValue = v6;

    if (v13)
    {
      v14 = v13;
      operator delete(v13);
    }
    lastStepCountValue = self->_lastStepCountValue;
  }
  return [(NSNumber *)lastStepCountValue integerValue];
}

- (int64_t)pushCountValue
{
  lastPushCountValue = self->_lastPushCountValue;
  if (!lastPushCountValue)
  {
    sub_1B5C4((uint64_t)self, 101, (char **)&v13);
    uint64_t v12 = 101;
    objc_super v15 = &v12;
    v4 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v12, (uint64_t)&std::piecewise_construct, &v15);
    v10 = 0;
    uint64_t v11 = 0;
    __p = 0;
    sub_E25C(&__p, v13, (uint64_t)v14, (v14 - (unsigned char *)v13) >> 3);
    double v5 = sub_1BA1C((uint64_t)self, v4 + 5, (uint64_t)&__p);
    if (__p)
    {
      v10 = __p;
      operator delete(__p);
    }
    id v6 = +[NSNumber numberWithDouble:round(v5)];
    id v7 = self->_lastPushCountValue;
    self->_lastPushCountValue = v6;

    if (v13)
    {
      v14 = v13;
      operator delete(v13);
    }
    lastPushCountValue = self->_lastPushCountValue;
  }
  return [(NSNumber *)lastPushCountValue integerValue];
}

- (int64_t)standHourValue
{
  lastStandHourValue = self->_lastStandHourValue;
  if (!lastStandHourValue)
  {
    v4 = +[NSNumber numberWithInteger:HDActivityCacheStatisticsBuilderStandHoursStatisticsForSamples((uint64_t *)&self->_standHourSamples)];
    double v5 = self->_lastStandHourValue;
    self->_lastStandHourValue = v4;

    lastStandHourValue = self->_lastStandHourValue;
  }

  return [(NSNumber *)lastStandHourValue integerValue];
}

- (int64_t)exerciseMinuteValue
{
  lastExerciseMinuteValue = self->_lastExerciseMinuteValue;
  if (!lastExerciseMinuteValue)
  {
    sub_1B5C4((uint64_t)self, 75, (char **)&v13);
    uint64_t v12 = 75;
    objc_super v15 = &v12;
    v4 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v12, (uint64_t)&std::piecewise_construct, &v15);
    v10 = 0;
    uint64_t v11 = 0;
    __p = 0;
    sub_E25C(&__p, v13, (uint64_t)v14, (v14 - (unsigned char *)v13) >> 3);
    double v5 = sub_1BA1C((uint64_t)self, v4 + 5, (uint64_t)&__p);
    if (__p)
    {
      v10 = __p;
      operator delete(__p);
    }
    id v6 = +[NSNumber numberWithDouble:round(v5)];
    id v7 = self->_lastExerciseMinuteValue;
    self->_lastExerciseMinuteValue = v6;

    if (v13)
    {
      v14 = v13;
      operator delete(v13);
    }
    lastExerciseMinuteValue = self->_lastExerciseMinuteValue;
  }
  return [(NSNumber *)lastExerciseMinuteValue integerValue];
}

- (double)deepBreathingDurationValue
{
  return self->_deepBreathingDurationValue;
}

- (void)addWorkouts:(const void *)a3
{
  double v5 = *(char **)a3;
  id v6 = (char *)*((void *)a3 + 1);
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
      sub_1A8DC((double *)self->_workouts.__begin_, (double *)self->_workouts.__begin_ + 8 * (v11 >> 6), (long long *)self->_workouts.__end_, (uint64_t)&v12);
    }
    sub_1C7F8(self);
    goto LABEL_8;
  }
  sub_1C7F8(self);
  if (self) {
LABEL_8:
  }
    sub_E3D0((uint64_t *)&self->_activeSourcesList);
}

- (void)addStandHourSamples:(const void *)a3
{
  sub_1EBC4((uint64_t)&self->_standHourSamples, (uint64_t)self->_standHourSamples.__end_, *(char **)a3, *((char **)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
  lastStandHourValue = self->_lastStandHourValue;
  self->_lastStandHourValue = 0;
}

- (void)addActivationLogSamples:(const void *)a3
{
  sub_1CBD4((uint64_t)self, (double **)a3, &v7);
  if (v8 == v7)
  {
    sub_1C7F8(self);
    if (!self) {
      goto LABEL_9;
    }
  }
  else
  {
    begin = self->_activationLogSamples.__begin_;
    uint64_t v5 = (char *)self->_activationLogSamples.__end_ - (char *)begin;
    if (v5)
    {
      unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * (v5 >> 3);
      sub_205C4((uint64_t *)&self->_activationLogSamples, v6 - 0x3333333333333333 * ((v8 - v7) >> 3));
      sub_20678((uint64_t *)&self->_activationLogSamples, (uint64_t)self->_activationLogSamples.__end_, v7, v8, 0xCCCCCCCCCCCCCCCDLL * ((v8 - v7) >> 3));
      sub_20C18((__n128 *)self->_activationLogSamples.__begin_, (__n128 *)(self->_activationLogSamples.__begin_ + v6), (__n128 *)self->_activationLogSamples.__end_, (uint64_t)&v9);
    }
    else
    {
      sub_20678((uint64_t *)&self->_activationLogSamples, (uint64_t)begin, v7, v8, 0xCCCCCCCCCCCCCCCDLL * ((v8 - v7) >> 3));
    }
    sub_1C7F8(self);
  }
  sub_E3D0((uint64_t *)&self->_activeSourcesList);
LABEL_9:
  v10 = (void **)&v7;
  sub_F994(&v10);
}

- (void)addDeviceSample:(HDActivityCacheStatisticsBuilderSample *)a3 typeCode:(int64_t)a4
{
  long long v6 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v6;
  uint64_t v8 = a4;
  v10 = &v8;
  uint64_t v7 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v8, (uint64_t)&std::piecewise_construct, &v10);
  sub_1CEC4((double *)self, (uint64_t)v9, v7 + 5, 0);
  sub_1C6B8(self, a4);
}

- (void)addDeviceSamples:(const void *)a3 typeCode:(int64_t)a4
{
  uint64_t v8 = a4;
  char v9 = &v8;
  uint64_t v7 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v8, (uint64_t)&std::piecewise_construct, &v9);
  sub_1D0E4((double *)self, (long long **)a3, v7 + 5, 0);
  sub_1C6B8(self, a4);
}

- (void)addWorkoutSample:(HDActivityCacheStatisticsBuilderSample *)a3 typeCode:(int64_t)a4
{
  long long v6 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v6;
  uint64_t v8 = a4;
  v10 = &v8;
  uint64_t v7 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, &v8, (uint64_t)&std::piecewise_construct, &v10);
  sub_1CEC4((double *)self, (uint64_t)v9, v7 + 5, 1);
  sub_1C6B8(self, a4);
}

- (void)addDeepBreathingSessionDuration:(double)a3
{
  self->_deepBreathingDurationValue = self->_deepBreathingDurationValue + a3;
}

- (id)createStatisticsCollectionWithType:(id)a3 intervalComponents:(id)a4 calendar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35 = v8;
  id v42 = [v8 code];
  v34 = [v8 canonicalUnit];
  uint64_t v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_builderStartTime];
  char v12 = [v10 dateByAddingComponents:v9 toDate:v11 options:0];
  uint64_t v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_builderEndTime];
  id v36 = [objc_alloc((Class)HKStatisticsCollection) initWithAnchorDate:v11 statisticsInterval:v9];
  sub_1B5C4((uint64_t)self, (uint64_t)v42, (char **)&v40);
  v43 = &v42;
  v14 = sub_20488((uint64_t **)&self->_sourceTotalsByIntervalIndexByTypeCode, (uint64_t *)&v42, (uint64_t)&std::piecewise_construct, (uint64_t **)&v43);
  uint64_t v33 = v14[7];
  if (v33)
  {
    objc_super v15 = v14 + 5;
    double v16 = self->_builderStartTime + (double)*(uint64_t *)(v14[5] + 32) * self->_intervalDuration;
    double v17 = sub_1D628((uint64_t)self, (uint64_t)(v14 + 5));
    while (1)
    {
      [v11 timeIntervalSinceReferenceDate];
      double v19 = v18;
      [v13 timeIntervalSinceReferenceDate];
      if (v19 >= v20) {
        break;
      }
      [v11 timeIntervalSinceReferenceDate];
      double v22 = v21;
      [v12 timeIntervalSinceReferenceDate];
      if (v22 >= v17) {
        break;
      }
      double v24 = v23;
      if (v23 > v16)
      {
        __p = 0;
        v38 = 0;
        uint64_t v39 = 0;
        sub_E25C(&__p, v40, (uint64_t)v41, (v41 - (unsigned char *)v40) >> 3);
        double v25 = sub_1D67C((uint64_t)self, v15, (uint64_t)&__p, v22, v24);
        if (__p)
        {
          v38 = __p;
          operator delete(__p);
        }
        if (v25 > 0.00000011920929)
        {
          id v26 = [objc_alloc((Class)HKStatistics) initWithDataType:v35 startDate:v11 endDate:v12];
          v27 = +[HKQuantity quantityWithUnit:v34 doubleValue:v25];
          [v26 setSumQuantity:v27];

          [v26 setDataCount:1];
          [v36 _insertStatistics:v26];
        }
      }
      id v28 = v12;

      uint64_t v29 = [v10 dateByAddingComponents:v9 toDate:v28 options:0];

      char v12 = (void *)v29;
      uint64_t v11 = v28;
    }
  }
  else
  {
    id v30 = v36;
  }
  if (v40)
  {
    v41 = v40;
    operator delete(v40);
  }
  if (v33) {
    id v31 = v36;
  }

  return v36;
}

- (id)createMoveStatisticsWithIntervalComponents:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
  id v9 = sub_1DAF8((uint64_t)self, v8, v6, v7);

  return v9;
}

- (id)createMoveMinuteStatisticsWithIntervalComponents:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleMoveTime];
  id v9 = sub_1DAF8((uint64_t)self, v8, v6, v7);

  return v9;
}

- (id)createExerciseStatisticsWithIntervalComponents:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HKQuantityType briskMinuteDataType];
  id v9 = sub_1DAF8((uint64_t)self, v8, v6, v7);

  return v9;
}

- (id)createStandStatisticsWithCalendar:(id)a3
{
  id v4 = a3;
  begin = self->_standHourSamples.__begin_;
  end = (long long *)self->_standHourSamples.__end_;
  if (end == (long long *)begin)
  {
    v32 = &__NSArray0__struct;
    goto LABEL_54;
  }
  sub_1EF40((uint64_t)begin, end, (uint64_t)&__p, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3)), 1);
  __p = 0;
  v52 = 0;
  v53 = 0;
  id v8 = self->_standHourSamples.__begin_;
  id v7 = self->_standHourSamples.__end_;
  int v10 = *(_DWORD *)v8;
  int v9 = *((_DWORD *)v8 + 1);
  int v11 = *((_DWORD *)v8 + 2);
  int v12 = *((_DWORD *)v8 + 3);
  uint64_t v13 = *((void *)v8 + 2);
  if (v8 == v7)
  {
    v14 = 0;
    id v30 = 0;
LABEL_34:
    unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((v14 - (unsigned char *)__p) >> 3);
    if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_DCEC();
    }
    unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((v30 - (unsigned char *)__p) >> 3);
    uint64_t v35 = 2 * v34;
    if (2 * v34 <= v33 + 1) {
      uint64_t v35 = v33 + 1;
    }
    if (v34 >= 0x555555555555555) {
      unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v36 = v35;
    }
    if (v36) {
      v37 = (char *)sub_E468((uint64_t)&v53, v36);
    }
    else {
      v37 = 0;
    }
    v38 = &v37[24 * v33];
    uint64_t v39 = &v37[24 * v36];
    *(_DWORD *)v38 = v10;
    *((_DWORD *)v38 + 1) = v9;
    *((_DWORD *)v38 + 2) = v11;
    *((_DWORD *)v38 + 3) = v12;
    *((void *)v38 + 2) = v13;
    id v31 = v38 + 24;
    v41 = (char *)__p;
    v40 = v52;
    if (v52 != __p)
    {
      do
      {
        long long v42 = *(_OWORD *)(v40 - 24);
        *((void *)v38 - 1) = *((void *)v40 - 1);
        *(_OWORD *)(v38 - 24) = v42;
        v38 -= 24;
        v40 -= 24;
      }
      while (v40 != v41);
      v40 = (char *)__p;
    }
    __p = v38;
    v52 = v31;
    v53 = v39;
    if (v40) {
      operator delete(v40);
    }
    goto LABEL_48;
  }
  id v49 = v4;
  v14 = 0;
  do
  {
    int v16 = *(_DWORD *)v8;
    int v15 = *((_DWORD *)v8 + 1);
    int v17 = *((_DWORD *)v8 + 2);
    uint64_t v18 = *((void *)v8 + 2);
    if (*(_DWORD *)v8 == v10 && v15 == v9)
    {
      if (v11 >= v17) {
        int v11 = *((_DWORD *)v8 + 2);
      }
    }
    else
    {
      int v20 = *((_DWORD *)v8 + 3);
      if (v14 >= v53)
      {
        int v50 = *((_DWORD *)v8 + 3);
        unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((v14 - (unsigned char *)__p) >> 3);
        unint64_t v22 = v21 + 1;
        if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_DCEC();
        }
        if (0x5555555555555556 * ((v53 - (unsigned char *)__p) >> 3) > v22) {
          unint64_t v22 = 0x5555555555555556 * ((v53 - (unsigned char *)__p) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v53 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
          unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v23) {
          double v24 = (char *)sub_E468((uint64_t)&v53, v23);
        }
        else {
          double v24 = 0;
        }
        double v25 = &v24[24 * v21];
        *(_DWORD *)double v25 = v10;
        *((_DWORD *)v25 + 1) = v9;
        *((_DWORD *)v25 + 2) = v11;
        *((_DWORD *)v25 + 3) = v12;
        *((void *)v25 + 2) = v13;
        v27 = (char *)__p;
        id v26 = v52;
        id v28 = v25;
        if (v52 != __p)
        {
          do
          {
            long long v29 = *(_OWORD *)(v26 - 24);
            *((void *)v28 - 1) = *((void *)v26 - 1);
            *(_OWORD *)(v28 - 24) = v29;
            v28 -= 24;
            v26 -= 24;
          }
          while (v26 != v27);
          id v26 = (char *)__p;
        }
        v14 = v25 + 24;
        __p = v28;
        v52 = v25 + 24;
        v53 = &v24[24 * v23];
        if (v26) {
          operator delete(v26);
        }
        int v20 = v50;
      }
      else
      {
        *(_DWORD *)v14 = v10;
        *((_DWORD *)v14 + 1) = v9;
        *((_DWORD *)v14 + 2) = v11;
        *((_DWORD *)v14 + 3) = v12;
        *((void *)v14 + 2) = v13;
        v14 += 24;
      }
      v52 = v14;
      int v11 = v17;
      int v9 = v15;
      int v10 = v16;
      int v12 = v20;
    }
    id v8 = (HDActivityCacheStatisticsBuilderStandHourSample *)((char *)v8 + 24);
    uint64_t v13 = v18;
  }
  while (v8 != v7);
  id v30 = v53;
  if (v14 >= v53)
  {
    uint64_t v13 = v18;
    id v4 = v49;
    goto LABEL_34;
  }
  *(_DWORD *)v14 = v10;
  *((_DWORD *)v14 + 1) = v9;
  *((_DWORD *)v14 + 2) = v11;
  *((_DWORD *)v14 + 3) = v12;
  id v31 = v14 + 24;
  *((void *)v14 + 2) = v18;
  id v4 = v49;
LABEL_48:
  v52 = v31;
  id v43 = objc_alloc((Class)NSMutableArray);
  id v44 = [v43 initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v52 - (unsigned char *)__p) >> 3)];
  v46 = (double *)__p;
  v45 = (double *)v52;
  if (__p != v52)
  {
    do
    {
      id v47 = [objc_alloc((Class)_HKActivityStatisticsStandHourInfo) initWithTimeStamp:*((_DWORD *)v46 + 2) != 0 state:v46[2]];
      [v44 addObject:v47];

      v46 += 3;
    }
    while (v46 != v45);
    v46 = (double *)__p;
  }
  if (v46)
  {
    v52 = (char *)v46;
    operator delete(v46);
  }
  v32 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v44, v49);

LABEL_54:

  return v32;
}

- (id)workoutSamplesWithSourceManager:(id)a3
{
  id v4 = a3;
  id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:(self->_workouts.__end_ - self->_workouts.__begin_) >> 6];
  begin = self->_workouts.__begin_;
  end = self->_workouts.__end_;
  if (begin != end)
  {
    *(void *)&long long v5 = 138412290;
    long long v17 = v5;
    do
    {
      id v8 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *((void *)begin + 4), v17);
      id v19 = 0;
      int v9 = [v4 clientSourceForPersistentID:v8 error:&v19];
      id v10 = v19;

      if (v9)
      {
        id v11 = objc_alloc((Class)_HKActivityStatisticsWorkoutInfo);
        int v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)begin];
        uint64_t v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*((double *)begin + 1)];
        v14 = [v11 initWithStartDate:v12 endDate:v13 source:v9];

        [v18 addObject:v14];
      }
      else
      {
        _HKInitializeLogging();
        v14 = HKLogActivityCache;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = +[NSNumber numberWithLongLong:*((void *)begin + 4)];
          *(_DWORD *)buf = v17;
          unint64_t v21 = v15;
          _os_log_impl(&def_E6CC, v14, OS_LOG_TYPE_DEFAULT, "Did not find a source for workout sample with source identifier %@", buf, 0xCu);
        }
      }

      begin = (HDActivityCacheStatisticsBuilderWorkoutSample *)((char *)begin + 64);
    }
    while (begin != end);
  }

  return v18;
}

- (double)intervalDuration
{
  return self->_intervalDuration;
}

- (void)setIntervalDuration:(double)a3
{
  self->_intervalDuration = a3;
}

- (HDActivityCacheStatisticsBuilderSourceDelegate)sourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceDelegate);

  return (HDActivityCacheStatisticsBuilderSourceDelegate *)WeakRetained;
}

- (void)setSourceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceDelegate);
  objc_storeStrong((id *)&self->_loggingName, 0);
  sub_215B8((uint64_t)&self->_sourceTotalsByIntervalIndexByTypeCode, (void *)self->_sourceTotalsByIntervalIndexByTypeCode.__tree_.__pair1_.__value_.__left_);
  p_activeSourcesList = &self->_activeSourcesList;
  sub_F994((void ***)&p_activeSourcesList);
  objc_storeStrong((id *)&self->_lastExerciseMinuteValue, 0);
  objc_storeStrong((id *)&self->_lastStandHourValue, 0);
  objc_storeStrong((id *)&self->_lastPushCountValue, 0);
  objc_storeStrong((id *)&self->_lastStepCountValue, 0);
  objc_storeStrong((id *)&self->_lastFlightsClimbedValue, 0);
  objc_storeStrong((id *)&self->_lastDistanceWalkingValue, 0);
  objc_storeStrong((id *)&self->_lastMoveMinuteValue, 0);
  objc_storeStrong((id *)&self->_lastActiveEnergyValue, 0);
  p_activeSourcesList = &self->_activationLogSamples;
  sub_F994((void ***)&p_activeSourcesList);
  begin = self->_standHourSamples.__begin_;
  if (begin)
  {
    self->_standHourSamples.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_workouts.__begin_;
  if (v4)
  {
    self->_workouts.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 23) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 9) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = (char *)self + 184;
  return self;
}

@end
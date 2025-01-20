@interface HDDemoDataActivitySampleGenerator
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDemoPersonCoolingDown:(id)a3 atTime:(double)a4;
- (BOOL)_isDemoPersonInWorkoutRecovery:(id)a3 atTime:(double)a4;
- (BOOL)_isDemoPersonSedentary:(id)a3 atTime:(double)a4;
- (BOOL)_isDemoPersonWalking:(id)a3 atTime:(double)a4 samplePeriod:(double)a5;
- (HDDemoDataActivitySampleGenerator)init;
- (HDDemoDataActivitySampleGenerator)initWithCoder:(id)a3;
- (double)_computeExerciseTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5;
- (double)_computePercentCooledForDemoPerson:(id)a3 atTime:(double)a4;
- (double)_generateWorkoutDataSamplesForDemoPerson:(void *)a3 atTime:(void *)a4 sampleDate:(void *)a5 addFromWatch:(void *)a6 objectCollection:(double)a7 nextSampleTime:(double)a8 typeIdentifier:(double)a9 unit:(double)a10 sampleMean:(double)a11 sampleMeanStdDev:sampleFrequency:workoutState:;
- (double)flightsClimbedForDemoPerson:(double)a3 atTime:;
- (id)_computeDistanceWithDistanceRate:(double)a3 DemoPerson:;
- (id)_computeFlightsClimbedForDemoPerson:(id)a3 atTime:(double)a4;
- (id)_computeWalkingRunningDistanceWithStepCount:(void *)a3 demoPerson:;
- (id)_sumQuantity:(void *)a3 withQuantity:;
- (void)_generateEllipticalWorkoutDataWithObjectCollection:(void *)a3 demoPerson:;
- (void)_generateHIITWorkoutDataWithObjectCollection:(void *)a3 demoPerson:;
- (void)_generateRunningWorkoutDataWithObjectCollection:(void *)a1 demoPerson:(void *)a2 workoutState:(void *)a3;
- (void)_generateSwimmingSegmentDataWithStartDate:(uint64_t)a3 segmentTime:(uint64_t)a4 segmentDistance:(void *)a5 numLaps:(void *)a6 strokeStyle:(double)a7 objectCollection:(double)a8 demoPerson:;
- (void)_generateSwimmingWorkoutDataWithObjectCollection:(void *)a3 demoPerson:;
- (void)_generateUnderwaterDivingWorkoutDataWithObjectCollection:(void *)a3 demoPerson:;
- (void)_generateWorkoutDataWithHeartRates:(void *)a3 recoveryHeartRates:(void *)a4 objectCollection:demoPerson:workoutState:;
- (void)_generateWorkoutEffortWithObjectCollection:(void *)a3 forWorkout:(void *)a4 dataType:;
- (void)_updateWorkoutStateWithActiveEnergyBurned:(void *)a1 distanceWalking:(void *)a2 distanceCycling:(void *)a3 distanceCrossCountrySkiing:(void *)a4 distanceRowing:(void *)a5 distanceSkatingSports:(void *)a6 distancePaddleSports:(void *)a7 distanceDownhillSnowSports:(void *)a8 currentTime:(void *)a9 date:(void *)a10 objectCollection:(void *)a11 demoPerson:(void *)a12;
- (void)encodeWithCoder:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setProfile:(id)a3 provenance:(id)a4;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataActivitySampleGenerator

- (HDDemoDataActivitySampleGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDDemoDataActivitySampleGenerator;
  v2 = [(HDDemoDataBaseSampleGenerator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_nextActiveCaloriesSampleTime = 0.0;
    v2->_nextPhysicalEffortSampleTime = 0.0;
    v2->_nextAppleStandHourSampleTime = 0.0;
    v2->_nextRestingCaloriesSampleTime = 0.0;
    v2->_nextFallSampleTime = 0.0;
    v2->_nextFlightsClimbedSampleTime = 0.0;
    v2->_nextStepsSampleTime = 0.0;
    v2->_nextExerciseMinuteTime = 0.0;
    v2->_nextHeartRateRecoveryStartTime = 0.0;
    v2->_nextHeartRateRecoveryStopTime = 0.0;
    v2->_nextRunningPowerSampleTime = 0.0;
    v2->_nextRunningStrideLengthSampleTime = 0.0;
    v2->_nextRunningVerticalOscillationSampleTime = 0.0;
    v2->_nextRunningGroundContactTimeSampleTime = 0.0;
    v2->_nextCyclingPowerSampleTime = 0.0;
    v2->_nextCyclingFTPSampleTime = 0.0;
    v2->_nextCyclingCadenceSampleTime = 0.0;
    v2->_nextCyclingSpeedSampleTime = 0.0;
    v2->_nextWaterTemperatureSampleTime = 0.0;
    v2->_nextCrossCountrySkiingSpeedSampleTime = 0.0;
    v2->_nextRowingSpeedSampleTime = 0.0;
    v2->_nextPaddleSportsSpeedSampleTime = 0.0;
    v2->_nextUVIndexSampleTime = 0.0;
    v2->_lastUVIndexPeakTime = 0.0;
    v2->_lastUVExposure = 0.0;
    v2->_lastUVIndexPeak = 0.0;
    currentWorkoutConfiguration = v2->_currentWorkoutConfiguration;
    v2->_currentWorkoutConfiguration = 0;

    workoutState = v3->_workoutState;
    v3->_workoutState = 0;
  }
  return v3;
}

- (HDDemoDataActivitySampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)HDDemoDataActivitySampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v41 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextActiveCaloriesSampleTimeKey"];
    v5->_nextActiveCaloriesSampleTime = v6;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextPhysicalEffortSampleTimeKey"];
    v5->_nextPhysicalEffortSampleTime = v7;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextAppleStandHourSampleTimeKey"];
    v5->_nextAppleStandHourSampleTime = v8;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextRestingCaloriesSampleTimeKey"];
    v5->_nextRestingCaloriesSampleTime = v9;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextFallSampleTimeKey"];
    v5->_nextFallSampleTime = v10;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextFlightSampleTimeKey"];
    v5->_nextFlightsClimbedSampleTime = v11;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextStepsSampleTimeKey"];
    v5->_nextStepsSampleTime = v12;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextExerciseMinuteSampleTimeKey"];
    v5->_nextExerciseMinuteTime = v13;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextRunningPowerSampleTimeKey"];
    v5->_nextRunningPowerSampleTime = v14;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextRunningStrideLengthSampleTimeKey"];
    v5->_nextRunningStrideLengthSampleTime = v15;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextRunningVerticalOscillationSampleTimeKey"];
    v5->_nextRunningVerticalOscillationSampleTime = v16;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextRunningGroundContactTimeSampleTimeKey"];
    v5->_nextRunningGroundContactTimeSampleTime = v17;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextCyclingPowerSampleTimeKey"];
    v5->_nextCyclingPowerSampleTime = v18;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextCyclingFTPSampleTimeKey"];
    v5->_nextCyclingFTPSampleTime = v19;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextCyclingCadenceSampleTimeKey"];
    v5->_nextCyclingCadenceSampleTime = v20;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextCyclingSpeedSampleTimeKey"];
    v5->_nextCyclingSpeedSampleTime = v21;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextWaterTemperatureSampleTimeKey"];
    v5->_nextWaterTemperatureSampleTime = v22;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextCrossCountrySkiingSpeedSampleTimeKey"];
    v5->_nextCrossCountrySkiingSpeedSampleTime = v23;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextRowingSpeedSampleTimeKey"];
    v5->_nextRowingSpeedSampleTime = v24;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextPaddleSportsSpeedSampleTimeKey"];
    v5->_nextPaddleSportsSpeedSampleTime = v25;
    int v26 = [v4 containsValueForKey:@"HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStartTimeKey"];
    double v27 = 0.0;
    double v28 = 0.0;
    if (v26) {
      objc_msgSend(v4, "decodeDoubleForKey:", @"HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStartTimeKey", 0.0);
    }
    v5->_nextHeartRateRecoveryStartTime = v28;
    if ([v4 containsValueForKey:@"HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStopTimeKey"])
    {
      [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStopTimeKey"];
      double v27 = v29;
    }
    v5->_nextHeartRateRecoveryStopTime = v27;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorNextUVIndexSampleTimeKey"];
    v5->_nextUVIndexSampleTime = v30;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorLastUVIndexPeakTimeKey"];
    v5->_lastUVIndexPeakTime = v31;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorLastUVExposureKey"];
    v5->_lastUVExposure = v32;
    [v4 decodeDoubleForKey:@"HDDemoDataActivitySampleGeneratorLastUVIndexPeakKey"];
    v5->_lastUVIndexPeak = v33;
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDemoDataActivitySampleGeneratorLastActivityCache"];
    lastActivityCache = v5->_lastActivityCache;
    v5->_lastActivityCache = (HKActivityCache *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDemoDataActivitySampleGeneratorCurrentWorkoutConfiguration"];
    currentWorkoutConfiguration = v5->_currentWorkoutConfiguration;
    v5->_currentWorkoutConfiguration = (HDDemoDataGeneratorWorkoutConfiguration *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDemoDataActivitySampleGeneratorWorkoutState"];
    workoutState = v5->_workoutState;
    v5->_workoutState = (_HDDemoDataActivityWorkoutState *)v38;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataActivitySampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HDDemoDataActivitySampleGeneratorNextActiveCaloriesSampleTimeKey", self->_nextActiveCaloriesSampleTime, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextPhysicalEffortSampleTimeKey" forKey:self->_nextPhysicalEffortSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextAppleStandHourSampleTimeKey" forKey:self->_nextAppleStandHourSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextRestingCaloriesSampleTimeKey" forKey:self->_nextRestingCaloriesSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextFallSampleTimeKey" forKey:self->_nextFallSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextFlightSampleTimeKey" forKey:self->_nextFlightsClimbedSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextStepsSampleTimeKey" forKey:self->_nextStepsSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextExerciseMinuteSampleTimeKey" forKey:self->_nextExerciseMinuteTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStartTimeKey" forKey:self->_nextHeartRateRecoveryStartTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextHeartRateRecoveryStopTimeKey" forKey:self->_nextHeartRateRecoveryStopTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextRunningPowerSampleTimeKey" forKey:self->_nextRunningPowerSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextRunningStrideLengthSampleTimeKey" forKey:self->_nextRunningStrideLengthSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextRunningVerticalOscillationSampleTimeKey" forKey:self->_nextRunningVerticalOscillationSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextRunningGroundContactTimeSampleTimeKey" forKey:self->_nextRunningGroundContactTimeSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextCyclingCadenceSampleTimeKey" forKey:self->_nextCyclingCadenceSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextCyclingSpeedSampleTimeKey" forKey:self->_nextCyclingSpeedSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextCyclingPowerSampleTimeKey" forKey:self->_nextCyclingPowerSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextCyclingFTPSampleTimeKey" forKey:self->_nextCyclingFTPSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextWaterTemperatureSampleTimeKey" forKey:self->_nextWaterTemperatureSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextCrossCountrySkiingSpeedSampleTimeKey" forKey:self->_nextCrossCountrySkiingSpeedSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextRowingSpeedSampleTimeKey" forKey:self->_nextRowingSpeedSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextPaddleSportsSpeedSampleTimeKey" forKey:self->_nextPaddleSportsSpeedSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorNextUVIndexSampleTimeKey" forKey:self->_nextUVIndexSampleTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorLastUVIndexPeakTimeKey" forKey:self->_lastUVIndexPeakTime];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorLastUVExposureKey" forKey:self->_lastUVExposure];
  [v4 encodeDouble:@"HDDemoDataActivitySampleGeneratorLastUVIndexPeakKey" forKey:self->_lastUVIndexPeak];
  [v4 encodeObject:self->_lastActivityCache forKey:@"HDDemoDataActivitySampleGeneratorLastActivityCache"];
  [v4 encodeObject:self->_currentWorkoutConfiguration forKey:@"HDDemoDataActivitySampleGeneratorCurrentWorkoutConfiguration"];
  [v4 encodeObject:self->_workoutState forKey:@"HDDemoDataActivitySampleGeneratorWorkoutState"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setProfile:(id)a3 provenance:(id)a4
{
  double v6 = (HDDataOriginProvenance *)a4;
  v8.receiver = self;
  v8.super_class = (Class)HDDemoDataActivitySampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v8 setProfile:a3];
  provenance = self->_provenance;
  self->_provenance = v6;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDDemoDataActivitySampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v21 setupWithDemoDataGenerator:v4];
  if (![(HDDemoDataBaseSampleGenerator *)self createdFromNSKeyedUnarchiver])
  {
    objc_super v5 = [v4 demoPerson];
    [v5 activeCaloriesSampleFrequency];
    self->_nextActiveCaloriesSampleTime = v6;

    double v7 = [v4 demoPerson];
    [v7 sedentarySampleFrequency];
    self->_nextAppleStandHourSampleTime = v8;

    double v9 = [v4 demoPerson];
    [v9 restingCaloriesSampleFrequency];
    self->_nextRestingCaloriesSampleTime = v10;

    double v11 = [v4 demoPerson];
    [v11 timeIncrementDuringExercise];
    self->_nextPhysicalEffortSampleTime = v12;

    double v13 = [v4 demoPerson];
    [v13 fallSampleFrequency];
    self->_nextFallSampleTime = v14;

    double v15 = [v4 demoPerson];
    [v15 flightsClimbedSampleTime];
    self->_nextFlightsClimbedSampleTime = v16;

    double v17 = [v4 demoPerson];
    [v17 uvIndexSampleFrequency];
    self->_nextUVIndexSampleTime = v18;

    double v19 = [v4 demoPerson];
    [v19 exerciseTimeSampleFrequency];
    self->_nextExerciseMinuteTime = v20;
  }
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataActivitySampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v5 generateFirstRunObjectsForDemoPerson:a3 firstDate:a4 objectCollection:a5];
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v653.receiver = self;
  v653.super_class = (Class)HDDemoDataActivitySampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v653 generateObjectsForDemoPerson:v11 fromTime:v12 toTime:v13 currentDate:a5 objectCollection:a5];
  v640 = [MEMORY[0x1E4F2B618] countUnit];
  v641 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
  id v14 = v11;
  double v15 = v14;
  v651 = v12;
  v652 = v13;
  if (!self)
  {

    id v207 = v15;
    double v30 = 0;
    goto LABEL_20;
  }
  if (self->_nextActiveCaloriesSampleTime <= a5)
  {
    [v14 activeCaloriesSampleFrequency];
    self->_nextActiveCaloriesSampleTime = v16 + self->_nextActiveCaloriesSampleTime;
    double v17 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    double v18 = [v17 generatorState];
    int v19 = [v18 isExercising];

    double v20 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    objc_super v21 = v20;
    if (v19)
    {
      double v22 = [v20 generatorState];
      double v23 = [v22 workoutConfiguration];
      [v23 kcalRate];
      double v25 = v24;

      int v26 = NSNumber;
      [v15 activeCaloriesSampleFrequency];
      double v28 = v25 * v27;
      double v29 = v26;
LABEL_5:
      double v30 = [v29 numberWithDouble:v28];
      goto LABEL_17;
    }
    double v31 = [v20 statisticsSampleGenerator];
    [v31 randomDoubleFromGenerator];
    double v33 = v32;

    if (v33 >= 0.12)
    {
      uint64_t v34 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v35 = [v34 sleepSampleGenerator];
      int v36 = [v35 isDemoPersonAwake:v15 atTime:a5];

      if (v36)
      {
        [v15 activeCaloriesSampleFrequency];
        if ([(HDDemoDataActivitySampleGenerator *)self _isDemoPersonWalking:v15 atTime:a5 samplePeriod:v37])
        {
          uint64_t v38 = -[HDDemoDataActivitySampleGenerator flightsClimbedForDemoPerson:atTime:]((double *)self, v15, a5);
          [v38 doubleValue];
          double v40 = v39;
          [v15 activeCaloriesSampleFrequency];
          double v42 = v41 / 0.000694444444;
          v43 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
          v44 = [v43 statisticsSampleGenerator];
          [v15 activeCaloriesSampleFrequency];
          double v46 = v45 / 0.000694444444;
          if (v40 == 0.0)
          {
            [v44 computeNoiseFromTime:a5 stdDev:v46 * 100.0];
            double v48 = v47 + v42 * 864.0;
          }
          else
          {
            [v44 computeNoiseFromTime:a5 stdDev:v46 * 120.0];
            double v54 = v53 + v42 * 1152.0;
            [v38 doubleValue];
            double v48 = v54 + v55;
          }
        }
        else
        {
          [v15 activeCaloriesSampleFrequency];
          double v50 = v49 / 0.000694444444;
          uint64_t v38 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
          v43 = [v38 statisticsSampleGenerator];
          [v15 activeCaloriesSampleFrequency];
          [v43 computeNoiseFromTime:a5 stdDev:v51 / 0.000694444444 * 45.0];
          double v48 = v52 + v50 * 244.8;
        }

        if (v48 > 0.00000011920929)
        {
          double v56 = (double)(arc4random_uniform(9u) + 1);
          double v29 = NSNumber;
          double v28 = v48 / (v56 + 6.0);
          goto LABEL_5;
        }
      }
    }
  }
  double v30 = 0;
LABEL_17:

  id v57 = v15;
  if (self->_nextExerciseMinuteTime > a5)
  {
LABEL_20:

    v63 = 0;
    int v64 = 1;
    goto LABEL_21;
  }
  v58 = v57;
  v646 = v30;
  v648 = v15;
  [v57 exerciseTimeSampleFrequency];
  self->_nextExerciseMinuteTime = v59 + a5;
  v60 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v61 = [v60 sleepSampleGenerator];
  char v62 = [v61 isDemoPersonSleeping:v58 atTime:a5];

  if (v62)
  {
LABEL_19:
    double v30 = v646;
    double v15 = v648;
    goto LABEL_20;
  }
  v83 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v84 = [v83 generatorState];
  int v85 = [v84 isExercising];

  if (v85)
  {
    [v58 timeIncrementDuringExercise];
    v644 = &unk_1F17ECA98;
LABEL_55:

    goto LABEL_56;
  }
  [v58 timeIncrement];
  double v145 = v144;
  [v58 activeCaloriesSampleFrequency];
  if ([(HDDemoDataActivitySampleGenerator *)self _isDemoPersonWalking:v58 atTime:a5 samplePeriod:v146])
  {
    v644 = [NSNumber numberWithUnsignedInt:arc4random_uniform((uint64_t)(v145 * 86400.0 / 60.0) / 8) + 1];
    if (v644) {
      goto LABEL_55;
    }
  }
  if ((double)arc4random_uniform(0x64u) / 100.0 >= 0.1) {
    goto LABEL_19;
  }
  uint64_t v195 = [NSNumber numberWithUnsignedInt:arc4random_uniform(3u) + 1];

  v644 = (void *)v195;
  if (!v195)
  {
    v63 = 0;
    int v64 = 1;
    double v30 = v646;
    double v15 = v648;
    goto LABEL_21;
  }
LABEL_56:
  uint64_t v147 = [v644 integerValue];
  if (v147 >= 1)
  {
    uint64_t v148 = v147;
    uint64_t v149 = *MEMORY[0x1E4F2A5C8];
    int v150 = 60;
    do
    {
      v151 = [v12 dateByAddingTimeInterval:(double)(v150 - 60)];
      v152 = [v12 dateByAddingTimeInterval:(double)v150];
      v153 = (void *)MEMORY[0x1E4F2B388];
      v154 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:v149];
      v155 = (void *)MEMORY[0x1E4F2B370];
      v156 = [MEMORY[0x1E4F2B618] minuteUnit];
      v157 = [v155 quantityWithUnit:v156 doubleValue:1.0];
      v158 = [v153 quantitySampleWithType:v154 quantity:v157 startDate:v151 endDate:v152];

      id v13 = v652;
      [v652 addObjectFromWatch:v158];

      id v12 = v651;
      v150 += 60;
      --v148;
    }
    while (v148);
  }
  v63 = v644;
  double v30 = v646;
  if (v646)
  {
    int v64 = 0;
    double v15 = v648;
    goto LABEL_22;
  }
  double v30 = [NSNumber numberWithDouble:(double)arc4random_uniform(0xAu) / 100.0 + 0.5];
  int v64 = 0;
  double v15 = v648;
LABEL_21:
  if (!v30)
  {
    uint64_t v69 = 0;
    goto LABEL_24;
  }
LABEL_22:
  v65 = (void *)MEMORY[0x1E4F2B370];
  [v30 doubleValue];
  v66 = objc_msgSend(v65, "quantityWithUnit:doubleValue:", v641);
  v67 = (void *)MEMORY[0x1E4F2B388];
  v68 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
  uint64_t v69 = [v67 quantitySampleWithType:v68 quantity:v66 startDate:v12 endDate:v12];

  [v13 addObjectFromWatch:v69];
LABEL_24:
  id v70 = v15;
  id v71 = v30;
  id v72 = v63;
  v638 = (void *)v69;
  int v636 = v64;
  if (self && self->_nextAppleStandHourSampleTime <= a5)
  {
    [v70 sedentarySampleFrequency];
    self->_nextAppleStandHourSampleTime = v74 + self->_nextAppleStandHourSampleTime;
    if (v64)
    {
      v75 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v76 = [v75 sleepSampleGenerator];
      int v77 = [v76 isDemoPersonAwake:v70 atTime:a5];

      if (v77)
      {
        [v70 sedentarySampleFrequency];
        v73 = &unk_1F17ECAB0;
        if (![(HDDemoDataActivitySampleGenerator *)self _isDemoPersonWalking:v70 atTime:a5 samplePeriod:v78])
        {
          v79 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
          v80 = [v79 statisticsSampleGenerator];
          [v80 pseudoRandomDoubleFromTime:a5];
          double v82 = v81;

          if (v82 >= 0.75) {
            v73 = &unk_1F17ECAC8;
          }
        }
      }
      else if (v71)
      {
        v73 = &unk_1F17ECAC8;
      }
      else
      {
        v73 = 0;
      }
    }
    else
    {
      v73 = &unk_1F17ECAB0;
    }
  }
  else
  {
    v73 = 0;
  }
  v639 = v72;

  v637 = v71;
  id v86 = v73;
  if (v86)
  {
    v87 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v88 = [v87 gregorianCalendar];

    v89 = [v88 components:62 fromDate:v12];
    v90 = [v88 dateFromComponents:v89];
    v91 = [v88 dateByAddingUnit:32 value:1 toDate:v90 options:0];
    v92 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F29770]];
    v93 = objc_msgSend(MEMORY[0x1E4F2ACB0], "categorySampleWithType:value:startDate:endDate:", v92, objc_msgSend(v86, "integerValue"), v90, v91);
    [v652 addObjectFromWatch:v93];
  }
  v647 = v86;
  id v94 = v70;
  v95 = v94;
  if (!self)
  {

    id v208 = v95;
    id v209 = v208;
    v634 = 0;
    unint64_t v96 = 0x1E4F2B000uLL;
    v97 = 0;
    goto LABEL_83;
  }
  unint64_t v96 = 0x1E4F2B000uLL;
  if (self->_nextRestingCaloriesSampleTime <= a5)
  {
    [v94 restingCaloriesSampleFrequency];
    self->_nextRestingCaloriesSampleTime = v99 + self->_nextRestingCaloriesSampleTime;
    v100 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v101 = [v100 bodySampleGenerator];
    [v101 lastWeightInKg];
    double v103 = v102;

    v104 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v105 = [v104 bodySampleGenerator];
    [v105 lastHeightInCm];
    double v107 = v106;

    v108 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v109 = [v108 currentDateFromCurrentTime:a5];

    v110 = [v95 birthDateComponents];
    double v111 = (double)HDDemoData_ageBetweenNSDateComponentsAndDate(v110, v109);

    +[HDDemoDataFormula computeBasalMetabolicRateFromWeight:height:age:sex:](HDDemoDataFormula, "computeBasalMetabolicRateFromWeight:height:age:sex:", [v95 biologicalSex], v103, v107, v111);
    double v113 = v112;
    [v95 restingCaloriesSampleFrequency];
    double v115 = v113 * v114;
    v116 = NSNumber;
    v117 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v118 = [v117 statisticsSampleGenerator];
    [v95 restingCaloriesSampleFrequency];
    [v118 computeNoiseFromTime:a5 stdDev:v115 * v119];
    v97 = [v116 numberWithDouble:v115 + v120];

    if (!v97) {
      goto LABEL_47;
    }
    v121 = (void *)MEMORY[0x1E4F2B370];
    [v97 doubleValue];
    v98 = objc_msgSend(v121, "quantityWithUnit:doubleValue:", v641);
    v122 = (void *)MEMORY[0x1E4F2B388];
    v123 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A600]];
    v124 = [v122 quantitySampleWithType:v123 quantity:v98 startDate:v12 endDate:v12];

    [v652 addObjectFromWatch:v124];
  }
  else
  {
    v97 = 0;
    v98 = v94;
  }

LABEL_47:
  id v125 = v95;
  v126 = v125;
  if (self->_nextPhysicalEffortSampleTime > a5)
  {
    v127 = 0;
    v128 = v125;
LABEL_64:
    v634 = v127;

    goto LABEL_65;
  }
  [v125 timeIncrementDuringExercise];
  double v130 = v129;
  v131 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v132 = [v131 statisticsSampleGenerator];
  [v126 genericSampleTimeNoiseStdDev];
  [v132 computeNoiseFromTime:a5 stdDev:v133];
  self->_nextPhysicalEffortSampleTime = v130 + v134 + self->_nextPhysicalEffortSampleTime;

  v135 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v136 = [v135 sleepSampleGenerator];
  int v137 = [v136 isDemoPersonSleeping:v126 atTime:a5];

  if (v137)
  {
    v138 = NSNumber;
    double v139 = (double)arc4random_uniform(0x14u) / 100.0;
  }
  else
  {
    v140 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v141 = [v140 generatorState];
    int v142 = [v141 isExercising];

    v138 = NSNumber;
    if (v142)
    {
      double v143 = (double)arc4random_uniform(0x32u) / 100.0 + 3.0;
      double v139 = v143 + (double)arc4random_uniform(0x12u);
    }
    else
    {
      double v139 = (double)arc4random_uniform(0x1F4u) / 100.0 + 0.5;
    }
  }
  v159 = [v138 numberWithDouble:v139];

  if (v159)
  {
    v160 = (void *)MEMORY[0x1E4F2B370];
    v161 = [MEMORY[0x1E4F2B618] unitFromString:@"kcal/(kg*hr)"];
    [v159 doubleValue];
    v128 = objc_msgSend(v160, "quantityWithUnit:doubleValue:", v161);

    v162 = (void *)MEMORY[0x1E4F2B388];
    [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A888]];
    v164 = v163 = v159;
    v165 = [v162 quantitySampleWithType:v164 quantity:v128 startDate:v12 endDate:v12];

    v127 = v163;
    [v652 addObjectFromWatch:v165];

    goto LABEL_64;
  }
  v634 = 0;
LABEL_65:
  id v166 = v126;
  if (self->_nextFallSampleTime <= a5)
  {
    v167 = v166;
    [v166 fallSampleFrequency];
    double v169 = v168;
    v170 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v171 = [v170 statisticsSampleGenerator];
    [v167 genericSampleTimeNoiseStdDev];
    [v171 computeNoiseFromTime:a5 stdDev:v172];
    self->_nextFallSampleTime = v169 + v173 + self->_nextFallSampleTime;

    v174 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v175 = [v174 sleepSampleGenerator];
    char v176 = [v175 isDemoPersonSleeping:v167 atTime:a5];

    if ((v176 & 1) == 0)
    {
      [v167 fallsDailyMean];
      double v178 = v177;
      v179 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v180 = [v179 statisticsSampleGenerator];
      [v167 fallsDailyStdDev];
      [v180 computeNoiseFromTime:a5 stdDev:v181];
      double v183 = v178 + v182;

      v184 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v185 = [v184 sleepSampleGenerator];
      [v185 computeAwakeTimeForDemoPerson:v167 atTime:a5];
      double v187 = v186;

      [v167 fallSampleFrequency];
      double v189 = v183 / (v187 / v188);
      v190 = [v167 birthDateComponents];
      v191 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v192 = [v191 currentDateFromCurrentTime:a5];
      uint64_t v193 = HDDemoData_ageBetweenNSDateComponentsAndDate(v190, v192);

      if (v193 >= 5)
      {
        if ((unint64_t)(v193 - 11) >= 0xB) {
          double v194 = (unint64_t)v193 < 0x33 ? 0.4 : (double)((130 - v193) / 130);
        }
        else {
          double v194 = 0.8;
        }
      }
      else
      {
        double v194 = 1.3;
      }
      double v196 = v189 * v194;
      v197 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v198 = [v197 statisticsSampleGenerator];
      [v198 pseudoRandomDoubleFromTime:a5];
      double v200 = v199;

      if (v200 < v196)
      {

        id v201 = &unk_1F17ECA98;
        v202 = (void *)MEMORY[0x1E4F2B370];
        v633 = &unk_1F17ECA98;
        [&unk_1F17ECA98 doubleValue];
        v203 = objc_msgSend(v202, "quantityWithUnit:doubleValue:", v640);
        v204 = (void *)MEMORY[0x1E4F2B388];
        v205 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A860]];
        v206 = [v204 quantitySampleWithType:v205 quantity:v203 startDate:v12 endDate:v12];

        [v652 addObjectFromPhone:v206];
        goto LABEL_84;
      }
    }
  }
LABEL_83:

  v633 = 0;
LABEL_84:
  if ([MEMORY[0x1E4F22258] isFloorCountingAvailable])
  {
    v210 = -[HDDemoDataActivitySampleGenerator flightsClimbedForDemoPerson:atTime:]((double *)self, v95, a5);
    v211 = v210;
    if (v210)
    {
      v212 = (void *)MEMORY[0x1E4F2B370];
      [v210 doubleValue];
      uint64_t v213 = objc_msgSend(v212, "quantityWithUnit:doubleValue:", v640);
      v214 = (void *)MEMORY[0x1E4F2B388];
      v215 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A808]];
      v216 = [v214 quantitySampleWithType:v215 quantity:v213 startDate:v12 endDate:v12];

      [v652 addObjectFromWatch:v216];
    }
    else
    {
      uint64_t v213 = 0;
    }
  }
  else
  {
    uint64_t v213 = 0;
  }
  id v217 = v95;
  v635 = v97;
  if (!self || self->_nextStepsSampleTime > a5) {
    goto LABEL_96;
  }
  v218 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v219 = [v218 generatorState];
  int v220 = [v219 isExercising];

  if (v220) {
    [v217 stepsSampleFrequencyDuringExercise];
  }
  else {
    [v217 stepsSampleFrequency];
  }
  double v222 = v221;
  self->_nextStepsSampleTime = v221 + a5;
  v223 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v224 = [v223 sleepSampleGenerator];
  char v225 = [v224 isDemoPersonSleeping:v217 atTime:a5];

  if (v225)
  {
LABEL_96:
    v226 = 0;
    v227 = 0;
    v228 = 0;
    v229 = v217;
LABEL_97:
    v632 = v226;

    goto LABEL_98;
  }
  if ([(HDDemoDataActivitySampleGenerator *)self _isDemoPersonWalking:v217 atTime:a5 samplePeriod:v222])
  {
    v491 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v492 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    char v493 = [v491 isDemoDataTimeInWeekend:v492 calendar:a5];

    if (v493) {
      [v217 weekendSleepParameters];
    }
    else {
    v500 = [v217 weekdaySleepParameters];
    }
    v504 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v505 = [v504 sleepSampleGenerator];
    [v500 bedtime];
    double v507 = v506;
    [v217 bedtimeNoiseStdDev];
    [v505 computeSleepTimeFromCurrentTime:a5 mean:v507 stdDev:v508];
    double v510 = v509;

    v511 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v512 = [v511 sleepSampleGenerator];
    [v500 wakeUpTime];
    double v514 = v513;
    [v217 wakeUpTimeNoiseStdDev];
    [v512 computeSleepTimeFromCurrentTime:a5 mean:v514 stdDev:v515];
    double v517 = v516;

    v518 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v519 = [v518 generatorState];
    int v520 = [v519 isRunning];

    if (v520)
    {
      double v521 = v222 / 0.000694444444 * 100.0;
      v522 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v523 = [v522 statisticsSampleGenerator];
      v524 = v523;
      double v525 = 20.0;
    }
    else
    {
      double v521 = (double)(arc4random_uniform(0x3E8u) + 9000) / ((v510 - v517) * 0.6 / v222);
      v522 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v523 = [v522 statisticsSampleGenerator];
      v524 = v523;
      double v525 = 1.3;
    }
    [v523 computeNoiseFromTime:a5 stdDev:v521 / v525];
    double v527 = v521 + v526;

    uint64_t v503 = [NSNumber numberWithInteger:(uint64_t)fabs(v521 + v527)];
  }
  else
  {
    v499 = NSNumber;
    v500 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v501 = [v500 statisticsSampleGenerator];
    [v501 computeNoiseFromTime:a5 stdDev:10.0];
    uint64_t v503 = [v499 numberWithInteger:(uint64_t)v502];
  }
  if (v503)
  {
    v528 = (void *)v503;
    v529 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v530 = [v529 generatorState];
    char v531 = [v530 isExercising];

    v229 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F0]];
    if (v531)
    {
      v532 = v640;
      v226 = v528;
      v228 = 0;
      v533 = v652;
    }
    else
    {
      v226 = v528;
      [v528 doubleValue];
      v532 = v640;
      v228 = [MEMORY[0x1E4F2B370] quantityWithUnit:v640 doubleValue:fabs(v534)];
      v535 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v229 quantity:v228 startDate:v12 endDate:v12];
      v533 = v652;
      [v652 addObjectFromPhone:v535];
    }
    [v226 doubleValue];
    v227 = [MEMORY[0x1E4F2B370] quantityWithUnit:v532 doubleValue:fabs(v536 + (double)arc4random_uniform(5u))];
    v537 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v229 quantity:v227 startDate:v12 endDate:v12];
    [v533 addObjectFromWatch:v537];

    unint64_t v96 = 0x1E4F2B000;
    goto LABEL_97;
  }
  v632 = 0;
  v227 = 0;
  v228 = 0;
LABEL_98:
  uint64_t v230 = -[HDDemoDataActivitySampleGenerator _computeWalkingRunningDistanceWithStepCount:demoPerson:](self, v228, v217);
  v231 = (void *)MEMORY[0x1E4F2A7E0];
  v649 = (void *)v230;
  if (v230)
  {
    uint64_t v232 = v230;
    v233 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
    v234 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v233 quantity:v232 startDate:v12 endDate:v12];
    [v652 addObjectFromPhone:v234];
  }
  uint64_t v235 = -[HDDemoDataActivitySampleGenerator _computeWalkingRunningDistanceWithStepCount:demoPerson:](self, v227, v217);
  if (v235)
  {
    v236 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*v231];
    v645 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v236 quantity:v235 startDate:v12 endDate:v12];
    objc_msgSend(v652, "addObjectFromWatch:");
  }
  else
  {
    v645 = 0;
  }
  v623 = (void *)v235;
  id v237 = v227;
  id v238 = v217;
  if (!self) {
    goto LABEL_107;
  }
  v239 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v240 = [v239 generatorState];
  int v241 = [v240 isExercising];

  if (!v241) {
    goto LABEL_107;
  }
  v242 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v243 = [v242 generatorState];
  v244 = [v243 workoutConfiguration];
  [v244 distanceCyclingRateInMiles];
  double v246 = v245;

  [v238 stepsSampleFrequencyDuringExercise];
  double v248 = v246 * v247;
  if (v248 > 0.00000011920929)
  {
    v249 = (void *)MEMORY[0x1E4F2B370];
    v250 = [*(id *)(v96 + 1560) mileUnit];
    v251 = [v249 quantityWithUnit:v250 doubleValue:v248];
  }
  else
  {
LABEL_107:
    v251 = 0;
  }

  v643 = (void *)v213;
  if (v251)
  {
    v252 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B0]];
    v630 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v252 quantity:v251 startDate:v12 endDate:v12];
    objc_msgSend(v652, "addObjectFromWatch:");
  }
  else
  {
    v630 = 0;
  }
  v253 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v254 = [v253 generatorState];
  v255 = [v254 workoutConfiguration];
  [v255 distanceCrossCountrySkiingRateInMeters];
  double v257 = v256;

  v258 = -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v257);
  v631 = v228;
  if (v258)
  {
    v259 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7A8]];
    v629 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v259 quantity:v258 startDate:v12 endDate:v12];
    objc_msgSend(v652, "addObjectFromWatch:");
  }
  else
  {
    v629 = 0;
  }
  v260 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v261 = [v260 generatorState];
  v262 = [v261 workoutConfiguration];
  [v262 distanceRowingRateInMeters];
  double v264 = v263;

  v265 = -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v264);
  if (v265)
  {
    v266 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C8]];
    v628 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v266 quantity:v265 startDate:v12 endDate:v12];
    objc_msgSend(v652, "addObjectFromWatch:");
  }
  else
  {
    v628 = 0;
  }
  v267 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v268 = [v267 generatorState];
  v269 = [v268 workoutConfiguration];
  [v269 distanceSkatingSportsRateInMeters];
  double v271 = v270;

  v272 = -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v271);
  v642 = v237;
  if (v272)
  {
    v273 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D0]];
    v627 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v273 quantity:v272 startDate:v12 endDate:v12];
    objc_msgSend(v652, "addObjectFromWatch:");
  }
  else
  {
    v627 = 0;
  }
  v274 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v275 = [v274 generatorState];
  v276 = [v275 workoutConfiguration];
  [v276 distancePaddleSportsRateInMeters];
  double v278 = v277;

  v279 = -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v278);
  if (v279)
  {
    v280 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C0]];
    v626 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v280 quantity:v279 startDate:v12 endDate:v12];
    objc_msgSend(v652, "addObjectFromWatch:");
  }
  else
  {
    v626 = 0;
  }
  v281 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v282 = [v281 generatorState];
  v283 = [v282 workoutConfiguration];
  [v283 distanceDownhillSnowSportsRateInMeters];
  double v285 = v284;

  v286 = -[HDDemoDataActivitySampleGenerator _computeDistanceWithDistanceRate:DemoPerson:](self, v238, v285);
  if (v286)
  {
    v287 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
    v625 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v287 quantity:v286 startDate:v651 endDate:v651];
    objc_msgSend(v652, "addObjectFromWatch:");
  }
  else
  {
    v625 = 0;
  }

  v288 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v289 = [v288 generatorState];
  int v290 = [v289 isRunning];

  v291 = v652;
  v650 = v238;
  if (self && v290)
  {
    id v292 = v652;
    id v293 = v651;
    id v294 = v238;
    [v294 runningPowerMean];
    double v296 = v295;
    [v294 runningPowerMeanStdDev];
    double v298 = v297;
    [v294 timeIncrementDuringExercise];
    double v300 = v299;
    double nextRunningPowerSampleTime = self->_nextRunningPowerSampleTime;
    v302 = (void *)*MEMORY[0x1E4F2A8B8];
    v303 = [MEMORY[0x1E4F2B618] wattUnit];
    double v304 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v293, v292, v302, v303, self->_workoutState, a5, nextRunningPowerSampleTime, v296, v298, v300);

    self->_double nextRunningPowerSampleTime = v304;
    id v305 = v292;
    id v306 = v293;
    id v307 = v294;
    [v307 runningStrideLengthMean];
    double v309 = v308;
    [v307 runningStrideLengthMeanStdDev];
    double v311 = v310;
    [v307 timeIncrementDuringExercise];
    double v313 = v312;
    double nextRunningStrideLengthSampleTime = self->_nextRunningStrideLengthSampleTime;
    v315 = (void *)*MEMORY[0x1E4F2A8C8];
    v316 = [MEMORY[0x1E4F2B618] meterUnit];
    double v317 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v306, v305, v315, v316, self->_workoutState, a5, nextRunningStrideLengthSampleTime, v309, v311, v313);

    self->_double nextRunningStrideLengthSampleTime = v317;
    id v318 = v305;
    id v319 = v306;
    id v320 = v307;
    [v320 runningVerticalOscillationMean];
    double v322 = v321;
    [v320 runningVerticalOscillationMeanStdDev];
    double v324 = v323;
    [v320 timeIncrementDuringExercise];
    double v326 = v325;
    double nextRunningVerticalOscillationSampleTime = self->_nextRunningVerticalOscillationSampleTime;
    v328 = (void *)*MEMORY[0x1E4F2A8D0];
    v329 = [MEMORY[0x1E4F2B618] meterUnit];
    double v330 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v319, v318, v328, v329, self->_workoutState, a5, nextRunningVerticalOscillationSampleTime, v322, v324, v326);

    self->_double nextRunningVerticalOscillationSampleTime = v330;
    id v331 = v318;
    id v332 = v319;
    id v333 = v320;
    [v333 runningGroundContactTimeMean];
    double v335 = v334;
    [v333 runningGroundContactTimeMeanStdDev];
    double v337 = v336;
    [v333 timeIncrementDuringExercise];
    double v339 = v338;
    double nextRunningGroundContactTimeSampleTime = self->_nextRunningGroundContactTimeSampleTime;
    v341 = (void *)*MEMORY[0x1E4F2A8B0];
    v342 = [MEMORY[0x1E4F2B618] unitFromString:@"ms"];
    double v343 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v332, v331, v341, v342, self->_workoutState, a5, nextRunningGroundContactTimeSampleTime, v335, v337, v339);

    self->_double nextRunningGroundContactTimeSampleTime = v343;
  }
  v344 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v345 = [v344 generatorState];
  int v346 = [v345 isCycling];

  v347 = v645;
  v348 = v651;
  if (self && v346)
  {
    id v349 = v652;
    id v350 = v651;
    id v351 = v238;
    [v351 cyclingPowerMean];
    double v353 = v352;
    [v351 cyclingPowerMeanStdDev];
    double v355 = v354;
    [v351 timeIncrementDuringExercise];
    double v357 = v356;
    double nextCyclingPowerSampleTime = self->_nextCyclingPowerSampleTime;
    v359 = (void *)*MEMORY[0x1E4F2A660];
    v360 = [MEMORY[0x1E4F2B618] wattUnit];
    double v361 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v350, v349, v359, v360, self->_workoutState, a5, nextCyclingPowerSampleTime, v353, v355, v357);

    self->_double nextCyclingPowerSampleTime = v361;
    id v362 = v349;
    id v363 = v350;
    id v364 = v351;
    [v364 cyclingFTPMean];
    double v366 = v365;
    [v364 cyclingFTPMeanStdDev];
    double v368 = v367;
    [v364 timeIncrementDuringExercise];
    double v370 = v369;
    double nextCyclingFTPSampleTime = self->_nextCyclingFTPSampleTime;
    v372 = (void *)*MEMORY[0x1E4F2A658];
    v373 = [MEMORY[0x1E4F2B618] wattUnit];
    double v374 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v363, v362, v372, v373, self->_workoutState, a5, nextCyclingFTPSampleTime, v366, v368, v370);

    self->_double nextCyclingFTPSampleTime = v374;
    id v375 = v362;
    id v376 = v363;
    id v377 = v364;
    [v377 cyclingCadenceMean];
    double v379 = v378;
    [v377 cyclingCadenceMeanStdDev];
    double v381 = v380;
    [v377 timeIncrementDuringExercise];
    double v383 = v382;
    double nextCyclingCadenceSampleTime = self->_nextCyclingCadenceSampleTime;
    v385 = (void *)*MEMORY[0x1E4F2A650];
    v386 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
    double v387 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v376, v375, v385, v386, self->_workoutState, a5, nextCyclingCadenceSampleTime, v379, v381, v383);

    self->_double nextCyclingCadenceSampleTime = v387;
    id v388 = v375;
    id v389 = v376;
    id v390 = v377;
    [v390 cyclingSpeedMean];
    double v392 = v391;
    [v390 speedMeanStdDev];
    double v394 = v393;
    [v390 timeIncrementDuringExercise];
    double v396 = v395;
    double nextCyclingSpeedSampleTime = self->_nextCyclingSpeedSampleTime;
    v398 = (void *)*MEMORY[0x1E4F2A668];
    v399 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
    double v400 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v389, v388, v398, v399, self->_workoutState, a5, nextCyclingSpeedSampleTime, v392, v394, v396);

    self->_double nextCyclingSpeedSampleTime = v400;
    v348 = v651;
  }
  v401 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v402 = [v401 generatorState];
  int v403 = [v402 isUnderwaterDiving];

  if (self && v403)
  {
    id v404 = v652;
    id v405 = v348;
    id v406 = v238;
    [v406 underwaterDivingWaterTemperatureMean];
    double v408 = v407;
    [v406 underwaterDivingWaterTemperatureStdDev];
    double v410 = v409;
    [v406 timeIncrementDuringExercise];
    double v412 = v411;
    double nextWaterTemperatureSampleTime = self->_nextWaterTemperatureSampleTime;
    v414 = (void *)*MEMORY[0x1E4F2A948];
    v415 = [MEMORY[0x1E4F2B618] degreeCelsiusUnit];
    double v416 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v405, v404, v414, v415, self->_workoutState, a5, nextWaterTemperatureSampleTime, v408, v410, v412);

    self->_double nextWaterTemperatureSampleTime = v416;
    v348 = v651;
  }
  v417 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v418 = [v417 generatorState];
  int v419 = [v418 isCrossCountrySkiing];

  if (self && v419)
  {
    id v420 = v652;
    id v421 = v348;
    id v422 = v238;
    [v422 crossCountrySkiingSpeedMean];
    double v424 = v423;
    [v422 speedMeanStdDev];
    double v426 = v425;
    [v422 timeIncrementDuringExercise];
    double v428 = v427;
    double nextCrossCountrySkiingSpeedSampleTime = self->_nextCrossCountrySkiingSpeedSampleTime;
    v430 = (void *)*MEMORY[0x1E4F2A648];
    v431 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
    double v432 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v421, v420, v430, v431, self->_workoutState, a5, nextCrossCountrySkiingSpeedSampleTime, v424, v426, v428);

    self->_double nextCrossCountrySkiingSpeedSampleTime = v432;
    v348 = v651;
  }
  v433 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v434 = [v433 generatorState];
  int v435 = [v434 isRowing];

  if (self && v435)
  {
    id v436 = v652;
    id v437 = v348;
    id v438 = v238;
    [v438 rowingSpeedMean];
    double v440 = v439;
    [v438 speedMeanStdDev];
    double v442 = v441;
    [v438 timeIncrementDuringExercise];
    double v444 = v443;
    double nextRowingSpeedSampleTime = self->_nextRowingSpeedSampleTime;
    v446 = (void *)*MEMORY[0x1E4F2A8A8];
    v447 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
    double v448 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v437, v436, v446, v447, self->_workoutState, a5, nextRowingSpeedSampleTime, v440, v442, v444);

    self->_double nextRowingSpeedSampleTime = v448;
    v348 = v651;
  }
  v449 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v450 = [v449 generatorState];
  int v451 = [v450 isPaddleSports];

  if (v451)
  {
    if (!self)
    {
      id v554 = v238;
      goto LABEL_187;
    }
    id v452 = v652;
    id v453 = v348;
    id v454 = v238;
    [v454 paddleSportsSpeedMean];
    double v456 = v455;
    [v454 speedMeanStdDev];
    double v458 = v457;
    [v454 timeIncrementDuringExercise];
    double v460 = v459;
    double nextPaddleSportsSpeedSampleTime = self->_nextPaddleSportsSpeedSampleTime;
    v462 = (void *)*MEMORY[0x1E4F2A870];
    v463 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
    double v464 = -[HDDemoDataActivitySampleGenerator _generateWorkoutDataSamplesForDemoPerson:atTime:sampleDate:addFromWatch:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:workoutState:](self, v453, v452, v462, v463, self->_workoutState, a5, nextPaddleSportsSpeedSampleTime, v456, v458, v460);

    self->_double nextPaddleSportsSpeedSampleTime = v464;
    v348 = v651;
    id v465 = v454;
  }
  else
  {
    id v466 = v238;
    if (!self)
    {
LABEL_187:
      v624 = 0;
      goto LABEL_188;
    }
  }
  v467 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v468 = [v467 sleepSampleGenerator];
  int v469 = [v468 isDemoPersonAwake:v238 atTime:a5];

  if (!v469) {
    goto LABEL_187;
  }
  if (self->_nextUVIndexSampleTime > a5)
  {
    v624 = 0;
LABEL_188:
    v550 = v238;
    goto LABEL_189;
  }
  v470 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  uint64_t v471 = [v470 firstSampleDayOfYear];

  if ((uint64_t)a5 > (uint64_t)self->_lastUVIndexPeakTime)
  {
    double v472 = (double)((uint64_t)((double)((uint64_t)((double)v471 + a5) % 365) / 91.0) + 5);
    v473 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v474 = [v473 statisticsSampleGenerator];
    [v474 pseudoRandomDoubleFromTime:a5];
    double v476 = v472 + v475 * 2.0;
    v477 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v478 = [v477 statisticsSampleGenerator];
    [v478 computeNoiseFromTime:a5 + 1.0 stdDev:2.5];
    double v480 = v476 + v479 + self->_lastUVIndexPeak / 7.0;

    double v481 = 0.0;
    if (v480 >= 0.0) {
      double v481 = v480;
    }
    self->_lastUVIndexPeak = fmin(v481, 11.0);
    self->_lastUVIndexPeakTime = a5;
  }
  [v238 uvIndexSampleFrequency];
  double v483 = v482;
  v484 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v485 = [v484 statisticsSampleGenerator];
  [v485 computeNoiseFromTime:a5 stdDev:0.00833333333];
  self->_nextUVIndexSampleTime = v483 + v486 + self->_nextUVIndexSampleTime;

  id v487 = v238;
  double v488 = a5 - (double)(uint64_t)a5;
  [v487 dawnTime];
  double v489 = 0.0001;
  if (v488 >= v490)
  {
    [v487 sunsetTime];
    v348 = v651;
    if (v488 <= v494)
    {
      if (v488 >= 0.541666667)
      {
        [v487 sunsetTime];
        double v498 = 1.0 - (v488 + -0.541666667) / (v538 + -0.541666667);
      }
      else
      {
        [v487 dawnTime];
        double v496 = v488 - v495;
        [v487 dawnTime];
        double v498 = v496 / (0.541666667 - v497);
      }
      double v489 = v498 * self->_lastUVIndexPeak;
    }
  }
  else
  {
    v348 = v651;
  }

  double lastUVExposure = self->_lastUVExposure;
  v540 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v541 = [v540 generatorState];
  char v542 = [v541 isExercising];

  if ((v542 & 1) == 0)
  {
    [v487 uvIndexSampleFrequency];
    if ([(HDDemoDataActivitySampleGenerator *)self _isDemoPersonWalking:v487 atTime:a5 samplePeriod:v543])
    {
      v544 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v545 = [v544 statisticsSampleGenerator];
      [v545 pseudoRandomDoubleFromTime:a5];
      double v547 = v546;

      if (lastUVExposure <= 1.0)
      {
        if (v547 < 0.35) {
          goto LABEL_181;
        }
      }
      else if (v547 >= 0.55)
      {
        goto LABEL_181;
      }
      goto LABEL_180;
    }
    if (lastUVExposure <= 1.0) {
LABEL_180:
    }
      double v489 = (double)arc4random_uniform(2u);
  }
LABEL_181:
  self->_double lastUVExposure = v489;
  v548 = [NSNumber numberWithInteger:(uint64_t)v489];

  if (!v548)
  {
    v624 = 0;
    id v238 = v650;
    goto LABEL_190;
  }
  v549 = (void *)MEMORY[0x1E4F2B370];
  v624 = v548;
  [v548 doubleValue];
  v550 = objc_msgSend(v549, "quantityWithUnit:doubleValue:", v640);
  v551 = (void *)MEMORY[0x1E4F2B388];
  v552 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A908]];
  v553 = [v551 quantitySampleWithType:v552 quantity:v550 startDate:v348 endDate:v348];

  [v652 addObjectFromPhone:v553];
  id v238 = v650;
LABEL_189:

LABEL_190:
  lastActivityCache = self->_lastActivityCache;
  if (lastActivityCache)
  {
    v556 = [(HKActivityCache *)lastActivityCache endDate];
    if (objc_msgSend(v348, "hk_isAfterDate:", v556))
    {
      int v557 = 1;
    }
    else
    {
      v558 = [(HKActivityCache *)self->_lastActivityCache startDate];
      int v557 = objc_msgSend(v348, "hk_isBeforeDate:", v558);
    }
  }
  else
  {
    int v557 = 1;
  }
  v559 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v560 = [v559 isStandalonePhoneFitnessMode];

  v561 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v562 = [v561 BOOLForKey:@"HealthDemoDataLegacyActivityDataGenerationKey"];

  int v563 = v560 & (v562 ^ 1);
  if (v557)
  {
    v564 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v622 = _HKActivityCacheDateComponentsFromDate();
    v565 = [v564 startOfDayForDate:v348];
    v566 = [v564 dateByAddingUnit:16 value:1 toDate:v565 options:0];
    v619 = v564;
    v621 = [v564 startOfDayForDate:v566];

    v567 = (void *)MEMORY[0x1E4F2B370];
    int v620 = v563;
    v568 = v238;
    v569 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
    [v238 moveGoal];
    v570 = objc_msgSend(v567, "quantityWithUnit:doubleValue:", v569);

    v571 = (void *)MEMORY[0x1E4F2B388];
    v572 = [MEMORY[0x1E4F2B3B8] dataTypeWithCode:67];
    uint64_t v573 = [v571 quantitySampleWithType:v572 quantity:v570 startDate:v565 endDate:v565];

    v618 = (void *)v573;
    [v652 addObjectFromWatch:v573];
    v574 = (void *)MEMORY[0x1E4F2B370];
    v575 = [MEMORY[0x1E4F2B618] minuteUnit];
    [v238 exerciseGoal];
    uint64_t v576 = objc_msgSend(v574, "quantityWithUnit:doubleValue:", v575);

    v577 = (void *)MEMORY[0x1E4F2B388];
    v578 = [MEMORY[0x1E4F2B3B8] dataTypeWithCode:105];
    v617 = (void *)v576;
    uint64_t v579 = [v577 quantitySampleWithType:v578 quantity:v576 startDate:v565 endDate:v565];

    v616 = (void *)v579;
    [v652 addObjectFromWatch:v579];
    v580 = (void *)MEMORY[0x1E4F2B370];
    v581 = [MEMORY[0x1E4F2B618] countUnit];
    [v568 standGoal];
    v582 = objc_msgSend(v580, "quantityWithUnit:doubleValue:", v581);

    v583 = (void *)MEMORY[0x1E4F2B388];
    v584 = [MEMORY[0x1E4F2B3B8] dataTypeWithCode:104];
    v585 = [v583 quantitySampleWithType:v584 quantity:v582 startDate:v565 endDate:v565];

    [v652 addObjectFromWatch:v585];
    v586 = (void *)MEMORY[0x1E4F2AB98];
    v587 = [MEMORY[0x1E4F29128] UUID];
    v588 = [v586 _activityCacheWithUUID:v587 startDate:v565 endDate:v621 dateComponents:v622 sequence:1];
    v589 = self->_lastActivityCache;
    self->_lastActivityCache = v588;

    int v563 = v620;
    [(HKActivityCache *)self->_lastActivityCache _setEnergyBurnedGoal:v570];
    if ((v620 & 1) == 0)
    {
      v590 = self->_lastActivityCache;
      v591 = (void *)MEMORY[0x1E4F2B370];
      v592 = [MEMORY[0x1E4F2B618] minuteUnit];
      v593 = [v591 quantityWithUnit:v592 doubleValue:30.0];
      [(HKActivityCache *)v590 _setBriskMinutesGoal:v593];

      v594 = self->_lastActivityCache;
      v595 = (void *)MEMORY[0x1E4F2B370];
      v596 = [MEMORY[0x1E4F2B618] countUnit];
      v597 = [v595 quantityWithUnit:v596 doubleValue:12.0];
      [(HKActivityCache *)v594 _setActiveHoursGoal:v597];

      int v563 = v620;
    }

    v348 = v651;
    v291 = v652;
    v347 = v645;
  }
  else
  {
    [(HKActivityCache *)self->_lastActivityCache _setSequence:[(HKActivityCache *)self->_lastActivityCache sequence] + 1];
  }
  if (v642)
  {
    uint64_t v598 = [(HKActivityCache *)self->_lastActivityCache stepCount];
    v599 = [MEMORY[0x1E4F2B618] countUnit];
    [v642 doubleValueForUnit:v599];
    unint64_t v601 = v598 + llround(v600);

    [(HKActivityCache *)self->_lastActivityCache _setStepCount:v601];
  }
  if ([MEMORY[0x1E4F22258] isFloorCountingAvailable] && v643)
  {
    uint64_t v602 = [(HKActivityCache *)self->_lastActivityCache flightsClimbed];
    v603 = [MEMORY[0x1E4F2B618] countUnit];
    [v643 doubleValueForUnit:v603];
    unint64_t v605 = v602 + llround(v604);

    [(HKActivityCache *)self->_lastActivityCache _setFlightsClimbed:v605];
  }
  if (v347)
  {
    v606 = [(HKActivityCache *)self->_lastActivityCache walkingAndRunningDistance];
    v607 = [v347 quantity];
    v608 = -[HDDemoDataActivitySampleGenerator _sumQuantity:withQuantity:](self, v606, v607);

    [(HKActivityCache *)self->_lastActivityCache _setWalkingAndRunningDistance:v608];
  }
  if (v638)
  {
    v609 = [(HKActivityCache *)self->_lastActivityCache energyBurned];
    v610 = [v638 quantity];
    v611 = -[HDDemoDataActivitySampleGenerator _sumQuantity:withQuantity:](self, v609, v610);

    [(HKActivityCache *)self->_lastActivityCache _setEnergyBurned:v611];
  }
  if (v647)
  {
    char v612 = [v647 integerValue] ? 1 : v563;
    if ((v612 & 1) == 0)
    {
      [(HKActivityCache *)self->_lastActivityCache activeHours];
      [(HKActivityCache *)self->_lastActivityCache _setActiveHours:v613 + 1.0];
    }
  }
  if (((v636 | v563) & 1) == 0)
  {
    [(HKActivityCache *)self->_lastActivityCache briskMinutes];
    -[HKActivityCache _setBriskMinutes:](self->_lastActivityCache, "_setBriskMinutes:", v614 + (double)[v639 integerValue]);
  }
  v615 = self->_lastActivityCache;
  if (v563) {
    [v291 addObjectFromPhone:v615];
  }
  else {
    [v291 addObjectFromWatch:v615];
  }
  -[HDDemoDataActivitySampleGenerator _updateWorkoutStateWithActiveEnergyBurned:distanceWalking:distanceCycling:distanceCrossCountrySkiing:distanceRowing:distanceSkatingSports:distancePaddleSports:distanceDownhillSnowSports:currentTime:date:objectCollection:demoPerson:](self, v638, v645, v630, v629, v628, v627, v626, v625, v348, v291, v650);
}

- (double)flightsClimbedForDemoPerson:(double)a3 atTime:
{
  id v5 = a2;
  double v6 = v5;
  if (a1)
  {
    if (a1[10] <= a3)
    {
      [v5 flightsClimbedSampleFrequency];
      double v8 = v7;
      double v9 = [a1 demoDataGenerator];
      double v10 = [v9 statisticsSampleGenerator];
      [v6 flightsClimbedSampleFrequencyStdDev];
      [v10 computeNoiseFromTime:a3 stdDev:v11];
      a1[10] = v8 + v12 + a1[10];

      a1 = [a1 _computeFlightsClimbedForDemoPerson:v6 atTime:a3];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_computeWalkingRunningDistanceWithStepCount:(void *)a3 demoPerson:
{
  id v5 = a2;
  id v6 = a3;
  double v7 = 0;
  if (a1 && v5)
  {
    double v8 = [a1 demoDataGenerator];
    double v9 = [v8 generatorState];
    int v10 = [v9 isExercising];

    if (v10)
    {
      double v11 = [a1 demoDataGenerator];
      double v12 = [v11 generatorState];
      id v13 = [v12 workoutConfiguration];
      [v13 distanceWalkingRateInMiles];
      double v15 = v14;

      [v6 stepsSampleFrequencyDuringExercise];
      double v17 = v15 * v16;
      if (v17 > 0.00000011920929)
      {
        double v18 = (void *)MEMORY[0x1E4F2B370];
        uint64_t v19 = [MEMORY[0x1E4F2B618] mileUnit];
LABEL_8:
        double v22 = (void *)v19;
        double v7 = [v18 quantityWithUnit:v19 doubleValue:v17];

        goto LABEL_10;
      }
    }
    else
    {
      double v20 = [MEMORY[0x1E4F2B618] countUnit];
      [v5 doubleValueForUnit:v20];
      double v17 = v21 * 2.5;

      if (v17 > 0.00000011920929)
      {
        double v18 = (void *)MEMORY[0x1E4F2B370];
        uint64_t v19 = [MEMORY[0x1E4F2B618] footUnit];
        goto LABEL_8;
      }
    }
    double v7 = 0;
  }
LABEL_10:

  return v7;
}

- (id)_computeDistanceWithDistanceRate:(double)a3 DemoPerson:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 demoDataGenerator];
    double v7 = [v6 generatorState];
    int v8 = [v7 isExercising];

    if (v8 && ([v5 exerciseTimeSampleFrequency], double v10 = v9 * a3, v10 > 0.00000011920929))
    {
      double v11 = (void *)MEMORY[0x1E4F2B370];
      double v12 = [MEMORY[0x1E4F2B618] meterUnit];
      a1 = [v11 quantityWithUnit:v12 doubleValue:v10];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_sumQuantity:(void *)a3 withQuantity:
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6)
      {
        id v8 = [v5 _quantityByAddingQuantity:v6];
      }
      else
      {
        id v8 = v5;
      }
    }
    else
    {
      id v8 = v6;
    }
    a1 = v8;
  }

  return a1;
}

- (void)_updateWorkoutStateWithActiveEnergyBurned:(void *)a1 distanceWalking:(void *)a2 distanceCycling:(void *)a3 distanceCrossCountrySkiing:(void *)a4 distanceRowing:(void *)a5 distanceSkatingSports:(void *)a6 distancePaddleSports:(void *)a7 distanceDownhillSnowSports:(void *)a8 currentTime:(void *)a9 date:(void *)a10 objectCollection:(void *)a11 demoPerson:(void *)a12
{
  uint64_t v225 = *MEMORY[0x1E4F143B8];
  id v212 = a2;
  id v211 = a3;
  id v19 = a4;
  id v20 = a5;
  id v210 = a6;
  id v209 = a7;
  id v208 = a8;
  id v207 = a9;
  id v205 = a10;
  double v21 = v20;
  id v206 = a11;
  id v204 = a12;
  if (!a1) {
    goto LABEL_152;
  }
  uint64_t v22 = a1[33];
  uint64_t v23 = (uint64_t)a1;
  double v24 = [a1 demoDataGenerator];
  double v25 = [v24 generatorState];
  int v26 = [v25 isExercising];

  uint64_t v27 = v23;
  if (((v22 == 0) & v26) == 1)
  {
    double v28 = [(id)v23 demoDataGenerator];
    double v29 = [v28 generatorState];
    uint64_t v30 = [v29 workoutConfiguration];
    double v31 = *(void **)(v23 + 256);
    *(void *)(v23 + 256) = v30;

    double v32 = objc_alloc_init(_HDDemoDataActivityWorkoutState);
    double v33 = *(void **)(v23 + 264);
    *(void *)(v23 + 264) = v32;

    uint64_t v34 = *(void *)(v23 + 264);
    if (v34)
    {
      objc_storeStrong((id *)(v34 + 56), a10);
      uint64_t v35 = v23;
      uint64_t v36 = *(void *)(v23 + 264);
    }
    else
    {
      uint64_t v36 = 0;
      uint64_t v35 = v23;
    }
    uint64_t v37 = [*(id *)(v35 + 256) activityType];
    if (v36) {
      *(void *)(v36 + 32) = v37;
    }
    uint64_t v38 = v35;
    uint64_t v39 = *(void *)(v35 + 264);
    double v40 = [*(id *)(v38 + 256) goal];
    if (v39) {
      objc_storeStrong((id *)(v39 + 48), v40);
    }

    uint64_t v27 = v23;
    uint64_t v41 = *(void *)(v23 + 264);
    uint64_t v42 = [*(id *)(v23 + 256) goalType];
    if (v41) {
      *(void *)(v41 + 40) = v42;
    }
    [*(id *)(v23 + 256) endTime];
    *(double *)(v23 + 104) = v43;
    *(double *)(v23 + 112) = v43 + *MEMORY[0x1E4F2BFC0] * 0.0000115740741;
  }
  if (!v26)
  {
    if (!v22) {
      goto LABEL_152;
    }
    if (!_HKWorkoutActivityTypeIsValid()) {
      goto LABEL_150;
    }
    v92 = *(void **)(v27 + 264);
    if (v92)
    {
      uint64_t v93 = v92[4];
      if (v93 <= 51)
      {
        if ((unint64_t)v93 <= 0x33)
        {
          switch(v93)
          {
            case '#':
            case '%':
              -[HDDemoDataActivitySampleGenerator _generateRunningWorkoutDataWithObjectCollection:demoPerson:workoutState:](v206, v204, *(void **)(v27 + 264));
              goto LABEL_83;
            case '$':
            case '&':
            case '(':
            case '*':
            case '+':
            case ',':
            case '-':
              goto LABEL_83;
            case '\'':
            case ')':
              goto LABEL_72;
            case '.':
              -[HDDemoDataActivitySampleGenerator _generateSwimmingWorkoutDataWithObjectCollection:demoPerson:](v27, v206, v204);
              goto LABEL_83;
            default:
              JUMPOUT(0);
          }
        }
        switch(v93)
        {
          case 16:
            goto LABEL_69;
          case 20:
            goto LABEL_72;
          case 21:
            goto LABEL_77;
          case 24:
            id v94 = &unk_1F17E9630;
            v95 = &unk_1F17E9648;
            goto LABEL_82;
          default:
            goto LABEL_83;
        }
        goto LABEL_83;
      }
      if (v93 <= 76)
      {
        switch(v93)
        {
          case '4':
            id v94 = &unk_1F17E9600;
            v95 = &unk_1F17E9618;
            goto LABEL_82;
          case '9':
LABEL_77:
            id v94 = &unk_1F17E9660;
            v95 = &unk_1F17E9678;
            goto LABEL_82;
          case ';':
          case '<':
LABEL_69:
            -[HDDemoDataActivitySampleGenerator _generateEllipticalWorkoutDataWithObjectCollection:demoPerson:](v27, v206, v204);
            break;
          case '=':
          case '?':
          case 'C':
LABEL_72:
            -[HDDemoDataActivitySampleGenerator _generateHIITWorkoutDataWithObjectCollection:demoPerson:](v27, v206, v204);
            break;
          default:
            goto LABEL_83;
        }
        goto LABEL_83;
      }
      if (v93 == 77)
      {
        id v94 = &unk_1F17E96C0;
        v95 = &unk_1F17E96D8;
      }
      else
      {
        if (v93 != 80)
        {
          if (v93 == 84) {
            -[HDDemoDataActivitySampleGenerator _generateUnderwaterDivingWorkoutDataWithObjectCollection:demoPerson:](v27, v206, v204);
          }
          goto LABEL_83;
        }
        id v94 = &unk_1F17E9690;
        v95 = &unk_1F17E96A8;
      }
LABEL_82:
      -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](v94, v95, v206, v92);
    }
LABEL_83:
    uint64_t v96 = *(void *)(v27 + 264);
    v97 = [(id)v27 profile];
    v98 = *(void **)(v23 + 32);
    id v202 = v205;
    id v201 = v97;
    id v198 = v98;
    if (!v96)
    {
      v167 = 0;
      goto LABEL_139;
    }
    double v99 = (void *)MEMORY[0x1E4F2B370];
    v100 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
    double v199 = [v99 quantityWithUnit:v100 doubleValue:*(double *)(v96 + 64)];

    uint64_t v101 = *(void *)(v96 + 32);
    if (v101 > 45)
    {
      if (v101 > 60)
      {
        if (v101 == 61 || v101 == 67)
        {
          double v106 = (void *)MEMORY[0x1E4F2B370];
          double v103 = [MEMORY[0x1E4F2B618] meterUnit];
          double v200 = [v106 quantityWithUnit:v103 doubleValue:*(double *)(v96 + 128)];
          goto LABEL_103;
        }
      }
      else
      {
        if (v101 == 46)
        {
          v108 = (void *)MEMORY[0x1E4F2B370];
          double v103 = [MEMORY[0x1E4F2B618] yardUnit];
          double v200 = [v108 quantityWithUnit:v103 doubleValue:*(double *)(v96 + 88)];
          goto LABEL_103;
        }
        if (v101 == 60)
        {
          v104 = (void *)MEMORY[0x1E4F2B370];
          double v103 = [MEMORY[0x1E4F2B618] meterUnit];
          double v200 = [v104 quantityWithUnit:v103 doubleValue:*(double *)(v96 + 96)];
          goto LABEL_103;
        }
      }
    }
    else if (v101 > 34)
    {
      if (v101 == 35)
      {
        v109 = (void *)MEMORY[0x1E4F2B370];
        double v103 = [MEMORY[0x1E4F2B618] meterUnit];
        double v200 = [v109 quantityWithUnit:v103 doubleValue:*(double *)(v96 + 104)];
        goto LABEL_103;
      }
      if (v101 == 39)
      {
        v105 = (void *)MEMORY[0x1E4F2B370];
        double v103 = [MEMORY[0x1E4F2B618] meterUnit];
        double v200 = [v105 quantityWithUnit:v103 doubleValue:*(double *)(v96 + 112)];
        goto LABEL_103;
      }
    }
    else
    {
      if (v101 == 13)
      {
        double v107 = (void *)MEMORY[0x1E4F2B370];
        double v103 = [MEMORY[0x1E4F2B618] meterUnit];
        double v200 = [v107 quantityWithUnit:v103 doubleValue:*(double *)(v96 + 80)];
        goto LABEL_103;
      }
      if (v101 == 31)
      {
        double v102 = (void *)MEMORY[0x1E4F2B370];
        double v103 = [MEMORY[0x1E4F2B618] meterUnit];
        double v200 = [v102 quantityWithUnit:v103 doubleValue:*(double *)(v96 + 120)];
        goto LABEL_103;
      }
    }
    v110 = (void *)MEMORY[0x1E4F2B370];
    double v103 = [MEMORY[0x1E4F2B618] meterUnit];
    double v200 = [v110 quantityWithUnit:v103 doubleValue:*(double *)(v96 + 72)];
LABEL_103:

    id v197 = v19;
    id v203 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint32_t v111 = arc4random_uniform(0xAu);
    uint32_t v112 = arc4random_uniform(0x1Eu);
    uint32_t v113 = arc4random_uniform(5u);
    double v114 = (void *)MEMORY[0x1E4F2B370];
    double v115 = [MEMORY[0x1E4F2B618] degreeFahrenheitUnit];
    v116 = [v114 quantityWithUnit:v115 doubleValue:(double)(v111 + 55)];
    [v203 setObject:v116 forKeyedSubscript:*MEMORY[0x1E4F2A248]];

    v117 = (void *)MEMORY[0x1E4F2B370];
    v118 = [MEMORY[0x1E4F2B618] percentUnit];
    double v119 = [v117 quantityWithUnit:v118 doubleValue:(double)(v112 + 20)];
    [v203 setObject:v119 forKeyedSubscript:*MEMORY[0x1E4F2A240]];

    double v120 = [NSNumber numberWithInteger:v113 + 1];
    [v203 setObject:v120 forKeyedSubscript:*MEMORY[0x1E4F2A238]];

    uint64_t v121 = *(void *)(v96 + 32);
    switch(v121)
    {
      case '%':
        double v134 = (void *)MEMORY[0x1E4F2B370];
        v135 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
        v136 = [v134 quantityWithUnit:v135 doubleValue:173.0];
        [v203 setObject:v136 forKeyedSubscript:*MEMORY[0x1E4F2BC18]];

        int v137 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v138 = [MEMORY[0x1E4F1C9C8] date];
        double v139 = [v137 dateByAddingUnit:8 value:-1 toDate:v138 options:0];

        id v140 = *(id *)(v96 + 56);
        int v141 = objc_msgSend(v140, "hk_isAfterDate:", v139);

        if (v141)
        {
          int v142 = (void *)MEMORY[0x1E4F2B370];
          double v143 = [MEMORY[0x1E4F2B618] inchUnit];
          double v144 = [v142 quantityWithUnit:v143 doubleValue:1236.0];

          [v203 setObject:v144 forKeyedSubscript:*MEMORY[0x1E4F2A118]];
        }

        uint64_t v121 = *(void *)(v96 + 32);
        break;
      case '.':
        v122 = *(void **)(v96 + 24);
        long long v213 = 0u;
        long long v214 = 0u;
        long long v215 = 0u;
        long long v216 = 0u;
        id v123 = v122;
        uint64_t v124 = [v123 countByEnumeratingWithState:&v213 objects:&buf count:16];
        if (v124)
        {
          uint64_t v195 = v21;
          uint64_t v125 = 0;
          uint64_t v126 = *(void *)v214;
          do
          {
            for (uint64_t i = 0; i != v124; ++i)
            {
              if (*(void *)v214 != v126) {
                objc_enumerationMutation(v123);
              }
              if ([*(id *)(*((void *)&v213 + 1) + 8 * i) type] == 3) {
                ++v125;
              }
            }
            uint64_t v124 = [v123 countByEnumeratingWithState:&v213 objects:&buf count:16];
          }
          while (v124);

          double v21 = v195;
          if (v125 >= 1)
          {
            v128 = [MEMORY[0x1E4F2B618] yardUnit];
            [v200 doubleValueForUnit:v128];
            double v130 = v129;

            v131 = (void *)MEMORY[0x1E4F2B370];
            v132 = [MEMORY[0x1E4F2B618] yardUnit];
            double v133 = [v131 quantityWithUnit:v132 doubleValue:(double)(int)(v130 / (double)v125)];

            [v203 setObject:v133 forKeyedSubscript:*MEMORY[0x1E4F2A188]];
          }
        }
        else
        {
        }
        [v203 setObject:&unk_1F17ECAC8 forKeyedSubscript:*MEMORY[0x1E4F2A1E0]];
        char v176 = [NSNumber numberWithInteger:*(void *)(v96 + 144)];
        [v203 setObject:v176 forKeyedSubscript:*MEMORY[0x1E4F2A1E8]];

        [v203 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2A178]];
        double v177 = (void *)MEMORY[0x1E4F2B370];
        double v178 = [MEMORY[0x1E4F2B618] countUnit];
        id v170 = [v177 quantityWithUnit:v178 doubleValue:(double)(int)*(double *)(v96 + 136)];

        v179 = (void *)MEMORY[0x1E4F2B718];
        uint64_t v180 = *(void *)(v96 + 32);
        id v181 = *(id *)(v96 + 56);
        id v173 = [v179 _workoutWithActivityType:v180 startDate:v181 endDate:v202 workoutEvents:*(void *)(v96 + 24) workoutActivities:0 duration:v199 totalActiveEnergyBurned:0.0 totalBasalEnergyBurned:0 totalDistance:v200 totalSwimmingStrokeCount:v170 totalFlightsClimbed:0 goalType:0 goal:0 device:0 metadata:v203];

LABEL_137:
        v167 = v173;
LABEL_138:
        id v184 = *(id *)(v96 + 48);
        [v167 _setGoal:v184];

        [v167 _setGoalType:*(void *)(v96 + 40)];
        id v19 = v197;

LABEL_139:
        if (v167)
        {
          [v206 addObjectFromWatch:v167];
          v185 = *(void **)(v23 + 264);
          if (v185) {
            v185 = (void *)v185[1];
          }
          double v186 = v185;
          double v187 = [v167 UUID];
          [v206 setAssociatedObjectUUIDs:v186 forObjectUUID:v187];

          [v167 workoutActivityType];
          if (HKCoreMotionSupportsEstimatedWorkoutEffortForActivityType()) {
            -[HDDemoDataActivitySampleGenerator _generateWorkoutEffortWithObjectCollection:forWorkout:dataType:](v23, v206, v167, (void *)*MEMORY[0x1E4F2A800]);
          }
          double v188 = *(void **)(v23 + 264);
          if (v188 && v188[4] == 84
            || (-[HDDemoDataActivitySampleGenerator _generateWorkoutEffortWithObjectCollection:forWorkout:dataType:](v23, v206, v167, (void *)*MEMORY[0x1E4F2A950]), (double v188 = *(void **)(v23 + 264)) != 0))
          {
            double v188 = (void *)v188[2];
          }
          double v189 = v188;
          v190 = [v167 UUID];
          [v206 setLooseAssociatedObjectUUIDs:v189 forObjectUUID:v190];
        }
        uint64_t v27 = v23;
LABEL_150:
        v191 = *(void **)(v27 + 256);
        *(void *)(v27 + 256) = 0;

        v91 = *(void **)(v27 + 264);
        *(void *)(v27 + 264) = 0;
LABEL_151:

        goto LABEL_152;
      case 'C':
      case '=':
        id v145 = objc_alloc(MEMORY[0x1E4F28C18]);
        id v146 = *(id *)(v96 + 56);
        uint64_t v147 = (void *)[v145 initWithStartDate:v146 endDate:v202];

        id v148 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v149 = (void *)MEMORY[0x1E4F2B370];
        int v150 = [MEMORY[0x1E4F2B618] unitFromString:@"mi/hr"];
        v151 = [v149 quantityWithUnit:v150 doubleValue:7.7];
        [v148 setObject:v151 forKeyedSubscript:*MEMORY[0x1E4F2A0D8]];

        v152 = (void *)MEMORY[0x1E4F2B370];
        v153 = [MEMORY[0x1E4F2B618] unitFromString:@"mi/hr"];
        v154 = [v152 quantityWithUnit:v153 doubleValue:12.0];
        [v148 setObject:v154 forKeyedSubscript:*MEMORY[0x1E4F2A1A0]];

        v155 = (void *)MEMORY[0x1E4F2B370];
        v156 = [MEMORY[0x1E4F2B618] percentUnit];
        v157 = [v155 quantityWithUnit:v156 doubleValue:15.0];
        [v148 setObject:v157 forKeyedSubscript:*MEMORY[0x1E4F2A098]];

        v158 = (void *)MEMORY[0x1E4F2B370];
        v159 = [MEMORY[0x1E4F2B618] meterUnit];
        v160 = [v158 quantityWithUnit:v159 doubleValue:472.1];
        [v148 setObject:v160 forKeyedSubscript:*MEMORY[0x1E4F2A120]];

        v161 = (void *)MEMORY[0x1E4F2B370];
        v162 = [MEMORY[0x1E4F2B618] meterUnit];
        v163 = [v161 quantityWithUnit:v162 doubleValue:5.0];
        [v148 setObject:v163 forKeyedSubscript:*MEMORY[0x1E4F2A118]];

        v164 = [MEMORY[0x1E4F2B798] workoutEventWithType:7 dateInterval:v147 metadata:v148];
        [*(id *)(v96 + 24) addObject:v164];

        uint64_t v121 = *(void *)(v96 + 32);
        break;
      default:
        int v141 = 0;
        break;
    }
    v165 = (void *)MEMORY[0x1E4F2B718];
    id v166 = *(id *)(v96 + 56);
    v167 = [v165 _workoutWithActivityType:v121 startDate:v166 endDate:v202 workoutEvents:*(void *)(v96 + 24) totalEnergyBurned:v199 totalDistance:v200 device:0 metadata:v203];

    if (!v141) {
      goto LABEL_138;
    }
    double v168 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v169 = [v168 pathForResource:@"GoldenGateLocationSeriesTrimmed" ofType:@"json"];

    id v170 = v169;
    id v171 = v201;
    id v172 = v198;
    id v173 = v167;
    double v196 = v172;
    if (v171)
    {
      if (v172)
      {
LABEL_126:
        v174 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v170];
        if (v174)
        {
          v217[0] = 0;
          v175 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v174 options:4 error:v217];
          id v194 = v217[0];
          if (v175)
          {
            *(void *)&long long v213 = 0;
            *((void *)&v213 + 1) = &v213;
            *(void *)&long long v214 = 0x3032000000;
            *((void *)&v214 + 1) = __Block_byref_object_copy__82;
            *(void *)&long long v215 = __Block_byref_object_dispose__82;
            *((void *)&v215 + 1) = [v173 startDate];
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v219 = __90___HDDemoDataActivityWorkoutState_addWorkoutRouteFromFilePath_profile_provenance_workout___block_invoke;
            int v220 = &unk_1E62FEAD8;
            v224 = &v213;
            id v221 = v171;
            id v222 = v196;
            uint64_t v223 = v96;
            [v175 enumerateObjectsUsingBlock:&buf];

            _Block_object_dispose(&v213, 8);
          }
          else
          {
            _HKInitializeLogging();
            double v183 = *MEMORY[0x1E4F29F30];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v170;
              _os_log_impl(&dword_1BCB7D000, v183, OS_LOG_TYPE_DEFAULT, "Could not serialize from JSON data at file path: %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          double v182 = *MEMORY[0x1E4F29F30];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v170;
            _os_log_impl(&dword_1BCB7D000, v182, OS_LOG_TYPE_DEFAULT, "Could not get data from file path: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }

        goto LABEL_137;
      }
    }
    else
    {
      v192 = [MEMORY[0x1E4F28B00] currentHandler];
      [v192 handleFailureInMethod:sel_addWorkoutRouteFromFilePath_profile_provenance_workout_, v96, @"HDDemoDataActivitySampleGenerator.m", 2709, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];

      if (v196) {
        goto LABEL_126;
      }
    }
    uint64_t v193 = [MEMORY[0x1E4F28B00] currentHandler];
    [v193 handleFailureInMethod:sel_addWorkoutRouteFromFilePath_profile_provenance_workout_, v96, @"HDDemoDataActivitySampleGenerator.m", 2710, @"Invalid parameter not satisfying: %@", @"provenance != nil" object file lineNumber description];

    goto LABEL_126;
  }
  if (v212)
  {
    uint64_t v44 = *(void *)(v27 + 264);
    double v45 = [v212 quantity];
    double v46 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
    [v45 doubleValueForUnit:v46];
    if (v44) {
      *(double *)(v44 + 64) = v47 + *(double *)(v44 + 64);
    }

    uint64_t v48 = *(void *)(v23 + 264);
    double v49 = [v212 UUID];
    if (v48) {
      objc_msgSend(*(id *)(v48 + 8), "hk_appendBytesWithUUID:", v49);
    }

    uint64_t v27 = v23;
  }
  if (v211)
  {
    uint64_t v50 = *(void *)(v27 + 264);
    double v51 = [v211 quantity];
    double v52 = [MEMORY[0x1E4F2B618] meterUnit];
    [v51 doubleValueForUnit:v52];
    if (v50) {
      *(double *)(v50 + 72) = v53 + *(double *)(v50 + 72);
    }

    uint64_t v54 = *(void *)(v23 + 264);
    double v55 = [v211 UUID];
    if (v54) {
      objc_msgSend(*(id *)(v54 + 8), "hk_appendBytesWithUUID:", v55);
    }

    uint64_t v27 = v23;
  }
  if (v19)
  {
    uint64_t v56 = *(void *)(v27 + 264);
    id v57 = [v19 quantity];
    v58 = [MEMORY[0x1E4F2B618] meterUnit];
    [v57 doubleValueForUnit:v58];
    if (v56) {
      *(double *)(v56 + 80) = v59 + *(double *)(v56 + 80);
    }

    uint64_t v60 = *(void *)(v23 + 264);
    v61 = [v19 UUID];
    if (v60) {
      objc_msgSend(*(id *)(v60 + 8), "hk_appendBytesWithUUID:", v61);
    }

    uint64_t v27 = v23;
  }
  if (v20)
  {
    uint64_t v62 = *(void *)(v27 + 264);
    v63 = [v20 quantity];
    int v64 = [MEMORY[0x1E4F2B618] meterUnit];
    [v63 doubleValueForUnit:v64];
    if (v62) {
      *(double *)(v62 + 96) = v65 + *(double *)(v62 + 96);
    }

    uint64_t v66 = *(void *)(v23 + 264);
    v67 = [v20 UUID];
    if (v66) {
      objc_msgSend(*(id *)(v66 + 8), "hk_appendBytesWithUUID:", v67);
    }

    uint64_t v27 = v23;
  }
  if (v210)
  {
    uint64_t v68 = *(void *)(v27 + 264);
    uint64_t v69 = [v210 quantity];
    id v70 = [MEMORY[0x1E4F2B618] meterUnit];
    [v69 doubleValueForUnit:v70];
    if (v68) {
      *(double *)(v68 + 104) = v71 + *(double *)(v68 + 104);
    }

    uint64_t v72 = *(void *)(v23 + 264);
    v73 = [v210 UUID];
    if (v72) {
      objc_msgSend(*(id *)(v72 + 8), "hk_appendBytesWithUUID:", v73);
    }

    uint64_t v27 = v23;
  }
  if (v209)
  {
    uint64_t v74 = *(void *)(v27 + 264);
    v75 = [v209 quantity];
    v76 = [MEMORY[0x1E4F2B618] meterUnit];
    [v75 doubleValueForUnit:v76];
    if (v74) {
      *(double *)(v74 + 112) = v77 + *(double *)(v74 + 112);
    }

    uint64_t v78 = *(void *)(v23 + 264);
    v79 = [v209 UUID];
    if (v78) {
      objc_msgSend(*(id *)(v78 + 8), "hk_appendBytesWithUUID:", v79);
    }

    uint64_t v27 = v23;
  }
  if (v208)
  {
    uint64_t v80 = *(void *)(v27 + 264);
    double v81 = [v208 quantity];
    double v82 = [MEMORY[0x1E4F2B618] meterUnit];
    [v81 doubleValueForUnit:v82];
    if (v80) {
      *(double *)(v80 + 120) = v83 + *(double *)(v80 + 120);
    }

    uint64_t v84 = *(void *)(v23 + 264);
    int v85 = [v208 UUID];
    if (v84) {
      objc_msgSend(*(id *)(v84 + 8), "hk_appendBytesWithUUID:", v85);
    }

    uint64_t v27 = v23;
  }
  if (v207)
  {
    uint64_t v86 = *(void *)(v27 + 264);
    v87 = [v207 quantity];
    v88 = [MEMORY[0x1E4F2B618] meterUnit];
    [v87 doubleValueForUnit:v88];
    if (v86) {
      *(double *)(v86 + 128) = v89 + *(double *)(v86 + 128);
    }

    uint64_t v90 = *(void *)(v23 + 264);
    v91 = [v207 UUID];
    if (v90) {
      objc_msgSend(*(id *)(v90 + 8), "hk_appendBytesWithUUID:", v91);
    }
    goto LABEL_151;
  }
LABEL_152:
}

- (void)_generateHIITWorkoutDataWithObjectCollection:(void *)a3 demoPerson:
{
  v9[300] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v6 = a2;
  v9[0] = &unk_1F17EB9D0;
  v9[1] = &unk_1F17EB9E8;
  v9[2] = &unk_1F17EBA00;
  v9[3] = &unk_1F17EBA18;
  v9[4] = &unk_1F17EBA30;
  v9[5] = &unk_1F17EBA48;
  v9[6] = &unk_1F17EBA60;
  v9[7] = &unk_1F17EBA30;
  v9[8] = &unk_1F17EBA48;
  v9[9] = &unk_1F17EBA78;
  v9[10] = &unk_1F17EBA90;
  v9[11] = &unk_1F17EBA90;
  v9[12] = &unk_1F17EBAA8;
  v9[13] = &unk_1F17EBAC0;
  v9[14] = &unk_1F17EBAD8;
  v9[15] = &unk_1F17EBAF0;
  v9[16] = &unk_1F17EBAD8;
  v9[17] = &unk_1F17EBB08;
  v9[18] = &unk_1F17EBB20;
  v9[19] = &unk_1F17EBB38;
  v9[20] = &unk_1F17EBB50;
  v9[21] = &unk_1F17EBB68;
  v9[22] = &unk_1F17EBB80;
  v9[23] = &unk_1F17EBB80;
  v9[24] = &unk_1F17EBB98;
  v9[25] = &unk_1F17EBBB0;
  v9[26] = &unk_1F17EBBC8;
  v9[27] = &unk_1F17EBBE0;
  v9[28] = &unk_1F17EBBF8;
  v9[29] = &unk_1F17EBC10;
  v9[30] = &unk_1F17EBC28;
  v9[31] = &unk_1F17EBC40;
  v9[32] = &unk_1F17EBC58;
  v9[33] = &unk_1F17EBC70;
  v9[34] = &unk_1F17EBBC8;
  v9[35] = &unk_1F17EBBF8;
  v9[36] = &unk_1F17EBC88;
  v9[37] = &unk_1F17EBB98;
  v9[38] = &unk_1F17EBC10;
  v9[39] = &unk_1F17EBCA0;
  v9[40] = &unk_1F17EBCB8;
  v9[41] = &unk_1F17EBCD0;
  v9[42] = &unk_1F17EBC10;
  v9[43] = &unk_1F17EBCE8;
  v9[44] = &unk_1F17EBD00;
  v9[45] = &unk_1F17EBCB8;
  v9[46] = &unk_1F17EBCA0;
  v9[47] = &unk_1F17EBD18;
  v9[48] = &unk_1F17EBD30;
  v9[49] = &unk_1F17EBD48;
  v9[50] = &unk_1F17EBB68;
  v9[51] = &unk_1F17EBB80;
  v9[52] = &unk_1F17EBAA8;
  v9[53] = &unk_1F17EBD60;
  v9[54] = &unk_1F17EBD78;
  v9[55] = &unk_1F17EBD90;
  v9[56] = &unk_1F17EBDA8;
  v9[57] = &unk_1F17EBD78;
  v9[58] = &unk_1F17EBDC0;
  v9[59] = &unk_1F17EBDD8;
  v9[60] = &unk_1F17EBD78;
  v9[61] = &unk_1F17EBD90;
  v9[62] = &unk_1F17EBDC0;
  v9[63] = &unk_1F17EBDF0;
  v9[64] = &unk_1F17EBA90;
  v9[65] = &unk_1F17EBE08;
  v9[66] = &unk_1F17EBE20;
  v9[67] = &unk_1F17EBE38;
  v9[68] = &unk_1F17EBE50;
  v9[69] = &unk_1F17EBDC0;
  v9[70] = &unk_1F17EBE68;
  v9[71] = &unk_1F17EBC28;
  v9[72] = &unk_1F17EBCE8;
  v9[73] = &unk_1F17EBD18;
  v9[74] = &unk_1F17EBE80;
  v9[75] = &unk_1F17EBD48;
  v9[76] = &unk_1F17EBD30;
  v9[77] = &unk_1F17EBD18;
  v9[78] = &unk_1F17EBCA0;
  v9[79] = &unk_1F17EBE98;
  v9[80] = &unk_1F17EBD48;
  v9[81] = &unk_1F17EBD18;
  v9[82] = &unk_1F17EBE80;
  v9[83] = &unk_1F17EBEB0;
  v9[84] = &unk_1F17EBEC8;
  v9[85] = &unk_1F17EBCA0;
  v9[134] = &unk_1F17EBD78;
  v9[86] = &unk_1F17EBEE0;
  v9[87] = &unk_1F17EBEC8;
  v9[88] = &unk_1F17EBD48;
  v9[142] = &unk_1F17EBDF0;
  v9[89] = &unk_1F17EBEF8;
  v9[90] = &unk_1F17EBC28;
  v9[171] = &unk_1F17EBC70;
  v9[173] = &unk_1F17EC090;
  v9[175] = &unk_1F17EC0C0;
  v9[176] = &unk_1F17EC0D8;
  v9[91] = &unk_1F17EBDA8;
  v9[92] = &unk_1F17EBF10;
  v9[135] = &unk_1F17EBAC0;
  v9[177] = &unk_1F17EBAC0;
  v9[178] = &unk_1F17EBD60;
  v9[179] = &unk_1F17EC0F0;
  v9[93] = &unk_1F17EBF28;
  v9[94] = &unk_1F17EBF40;
  v9[193] = &unk_1F17EBCD0;
  v9[95] = &unk_1F17EBF58;
  v9[96] = &unk_1F17EBF70;
  v9[97] = &unk_1F17EBE68;
  v9[98] = &unk_1F17EBF88;
  v9[99] = &unk_1F17EBDD8;
  v9[100] = &unk_1F17EBE68;
  v9[101] = &unk_1F17EBFA0;
  v9[102] = &unk_1F17EBFB8;
  v9[103] = &unk_1F17EBFD0;
  v9[104] = &unk_1F17EBCE8;
  v9[105] = &unk_1F17EBD00;
  v9[106] = &unk_1F17EBEE0;
  v9[107] = &unk_1F17EBFE8;
  v9[108] = &unk_1F17EBE80;
  v9[109] = &unk_1F17EBEE0;
  v9[110] = &unk_1F17EBEC8;
  v9[111] = &unk_1F17EBE98;
  v9[112] = &unk_1F17EBD18;
  v9[113] = &unk_1F17EBC28;
  v9[114] = &unk_1F17EBEC8;
  v9[115] = &unk_1F17EBEE0;
  v9[116] = &unk_1F17EBD48;
  v9[117] = &unk_1F17EBEB0;
  v9[118] = &unk_1F17EC000;
  v9[119] = &unk_1F17EC018;
  v9[120] = &unk_1F17EC030;
  v9[121] = &unk_1F17EBEF8;
  v9[122] = &unk_1F17EBEC8;
  v9[123] = &unk_1F17EBEE0;
  v9[124] = &unk_1F17EBFE8;
  v9[125] = &unk_1F17EBD30;
  v9[126] = &unk_1F17EBE98;
  v9[127] = &unk_1F17EBEE0;
  v9[128] = &unk_1F17EBE80;
  v9[129] = &unk_1F17EBD18;
  v9[130] = &unk_1F17EBC28;
  v9[131] = &unk_1F17EBC88;
  v9[132] = &unk_1F17EBB50;
  v9[133] = &unk_1F17EC048;
  v9[136] = &unk_1F17EBF70;
  v9[137] = &unk_1F17EC060;
  v9[138] = &unk_1F17EBE68;
  v9[139] = &unk_1F17EBDD8;
  v9[140] = &unk_1F17EBF40;
  v9[141] = &unk_1F17EBE68;
  v9[143] = &unk_1F17EBF40;
  v9[144] = &unk_1F17EBF70;
  v9[145] = &unk_1F17EBF70;
  v9[146] = &unk_1F17EBFA0;
  v9[147] = &unk_1F17EC078;
  v9[148] = &unk_1F17EBE68;
  v9[149] = &unk_1F17EBDD8;
  v9[150] = &unk_1F17EBE68;
  v9[151] = &unk_1F17EBC28;
  v9[152] = &unk_1F17EBCE8;
  v9[153] = &unk_1F17EBD18;
  v9[154] = &unk_1F17EBE80;
  v9[155] = &unk_1F17EBD48;
  v9[156] = &unk_1F17EBD30;
  v9[157] = &unk_1F17EBD18;
  v9[158] = &unk_1F17EBCA0;
  v9[159] = &unk_1F17EBE98;
  v9[160] = &unk_1F17EBD48;
  v9[161] = &unk_1F17EBD18;
  v9[162] = &unk_1F17EBE80;
  v9[163] = &unk_1F17EBEB0;
  v9[164] = &unk_1F17EBEC8;
  v9[165] = &unk_1F17EBCA0;
  v9[166] = &unk_1F17EBEE0;
  v9[167] = &unk_1F17EBEC8;
  v9[168] = &unk_1F17EBD48;
  v9[169] = &unk_1F17EBEF8;
  v9[170] = &unk_1F17EBC28;
  v9[172] = &unk_1F17EBBE0;
  v9[174] = &unk_1F17EC0A8;
  v9[180] = &unk_1F17EBE68;
  v9[181] = &unk_1F17EBFA0;
  v9[182] = &unk_1F17EBFB8;
  v9[183] = &unk_1F17EBFD0;
  v9[184] = &unk_1F17EBCE8;
  v9[185] = &unk_1F17EBD00;
  v9[186] = &unk_1F17EBEE0;
  v9[187] = &unk_1F17EBFE8;
  v9[188] = &unk_1F17EBE80;
  v9[189] = &unk_1F17EBEE0;
  v9[190] = &unk_1F17EBD30;
  v9[191] = &unk_1F17EBD48;
  v9[192] = &unk_1F17EBEC8;
  v9[194] = &unk_1F17EBE98;
  v9[195] = &unk_1F17EBD48;
  v9[196] = &unk_1F17EBEC8;
  v9[197] = &unk_1F17EC000;
  v9[198] = &unk_1F17EC030;
  id v4 = [NSNumber numberWithInteger:arc4random_uniform(0x14u) + 187];
  v9[211] = &unk_1F17EBC88;
  v9[213] = &unk_1F17EBFB8;
  v9[215] = &unk_1F17EBAA8;
  v9[216] = &unk_1F17EBFA0;
  v9[219] = &unk_1F17EBDA8;
  v9[222] = &unk_1F17EBF88;
  v9[226] = &unk_1F17EC078;
  v9[252] = &unk_1F17EBFD0;
  v9[258] = &unk_1F17EBD90;
  v9[263] = &unk_1F17EBAF0;
  v9[264] = &unk_1F17EBBB0;
  v9[277] = &unk_1F17EBEB0;
  v9[278] = &unk_1F17EC000;
  v9[199] = v4;
  v9[200] = &unk_1F17EC030;
  v9[201] = &unk_1F17EBEF8;
  v9[202] = &unk_1F17EBEC8;
  v9[203] = &unk_1F17EBEE0;
  v9[204] = &unk_1F17EBE80;
  v9[205] = &unk_1F17EBEC8;
  v9[206] = &unk_1F17EBD18;
  v9[207] = &unk_1F17EBEE0;
  v9[208] = &unk_1F17EBEE0;
  v9[209] = &unk_1F17EBCA0;
  v9[210] = &unk_1F17EBCE8;
  v9[212] = &unk_1F17EBB80;
  v9[214] = &unk_1F17EBDD8;
  v9[217] = &unk_1F17EBF58;
  v9[218] = &unk_1F17EBE68;
  v9[220] = &unk_1F17EBF58;
  v9[221] = &unk_1F17EBF40;
  v9[223] = &unk_1F17EBF58;
  v9[224] = &unk_1F17EBF70;
  v9[225] = &unk_1F17EBE68;
  v9[227] = &unk_1F17EBF70;
  v9[228] = &unk_1F17EBE68;
  v9[229] = &unk_1F17EBDD8;
  v9[230] = &unk_1F17EBE68;
  v9[231] = &unk_1F17EBC28;
  v9[232] = &unk_1F17EBCE8;
  v9[233] = &unk_1F17EBD18;
  v9[234] = &unk_1F17EBE80;
  v9[235] = &unk_1F17EBD48;
  v9[236] = &unk_1F17EBD30;
  v9[237] = &unk_1F17EBD18;
  v9[238] = &unk_1F17EBCA0;
  v9[239] = &unk_1F17EBE98;
  v9[240] = &unk_1F17EBEC8;
  v9[241] = &unk_1F17EBE98;
  v9[242] = &unk_1F17EBFE8;
  v9[243] = &unk_1F17EBEF8;
  v9[244] = &unk_1F17EBD30;
  v9[245] = &unk_1F17EBD18;
  v9[246] = &unk_1F17EBEC8;
  v9[247] = &unk_1F17EBEC8;
  v9[248] = &unk_1F17EBD18;
  v9[249] = &unk_1F17EBEF8;
  v9[250] = &unk_1F17EBCE8;
  v9[251] = &unk_1F17EC108;
  v9[253] = &unk_1F17EC048;
  v9[254] = &unk_1F17EBF70;
  v9[255] = &unk_1F17EC120;
  v9[256] = &unk_1F17EBF58;
  v9[257] = &unk_1F17EBF40;
  v9[259] = &unk_1F17EBDD8;
  v9[260] = &unk_1F17EBF40;
  v9[261] = &unk_1F17EC060;
  v9[262] = &unk_1F17EC048;
  v9[265] = &unk_1F17EBD00;
  v9[266] = &unk_1F17EBEE0;
  v9[267] = &unk_1F17EBFE8;
  v9[268] = &unk_1F17EBE80;
  v9[269] = &unk_1F17EBEE0;
  v9[270] = &unk_1F17EBEC8;
  v9[271] = &unk_1F17EBE98;
  v9[272] = &unk_1F17EBD18;
  v9[273] = &unk_1F17EBC28;
  v9[274] = &unk_1F17EBEC8;
  v9[275] = &unk_1F17EBEE0;
  v9[276] = &unk_1F17EBD48;
  v9[279] = &unk_1F17EC018;
  v9[280] = &unk_1F17EC030;
  v9[281] = &unk_1F17EBEF8;
  v9[282] = &unk_1F17EBEC8;
  v9[283] = &unk_1F17EBD18;
  v9[284] = &unk_1F17EBD00;
  v9[285] = &unk_1F17EBC28;
  v9[286] = &unk_1F17EBB80;
  v9[287] = &unk_1F17EBB98;
  v9[288] = &unk_1F17EBBF8;
  v9[289] = &unk_1F17EBBE0;
  v9[290] = &unk_1F17EBC28;
  v9[291] = &unk_1F17EBB50;
  v9[292] = &unk_1F17EC0A8;
  v9[293] = &unk_1F17EBF10;
  v9[294] = &unk_1F17EBF28;
  v9[295] = &unk_1F17EBE68;
  v9[296] = &unk_1F17EBF70;
  v9[297] = &unk_1F17EC060;
  v9[298] = &unk_1F17EBE68;
  v9[299] = &unk_1F17EBDD8;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:300];

  -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](v5, &unk_1F17E9588, v6, *(void **)(a1 + 264));
}

- (void)_generateSwimmingWorkoutDataWithObjectCollection:(void *)a3 demoPerson:
{
  id v25 = a2;
  id v5 = a3;
  [*(id *)(a1 + 256) swimmingSwimSegmentTime];
  double v7 = v6;
  [*(id *)(a1 + 256) swimmingRestSegmentTime];
  double v9 = v8;
  [*(id *)(a1 + 256) swimmingSwimSegmentTime];
  double v11 = v10;
  if ([*(id *)(a1 + 256) numSwimmingSegments] >= 2)
  {
    uint64_t v12 = 0;
    id v13 = 0;
    double v14 = v7 + v9;
    do
    {
      uint64_t v15 = *(void *)(a1 + 264);
      if (v15) {
        double v16 = *(void **)(v15 + 56);
      }
      else {
        double v16 = 0;
      }
      double v17 = [v16 dateByAddingTimeInterval:v14 * (double)(int)v12];

      [*(id *)(a1 + 256) distanceSwimmingSegmentInYards];
      -[HDDemoDataActivitySampleGenerator _generateSwimmingSegmentDataWithStartDate:segmentTime:segmentDistance:numLaps:strokeStyle:objectCollection:demoPerson:](a1, v17, [*(id *)(a1 + 256) swimmingNumLapsPerSegment], objc_msgSend(*(id *)(a1 + 256), "swimmingStrokeStyle"), v25, v5, v11, v18);
      ++v12;
      id v13 = v17;
    }
    while ([*(id *)(a1 + 256) numSwimmingSegments] - 1 > v12);
    if (v17)
    {
      id v19 = [v17 dateByAddingTimeInterval:v14];

      double v20 = v11 * 0.5;
      [*(id *)(a1 + 256) distanceSwimmingSegmentInYards];
      double v22 = v21 * 0.5;
      uint64_t v23 = [*(id *)(a1 + 256) swimmingNumLapsPerSegment];
      if (v23 >= 0) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = v23 + 1;
      }
      -[HDDemoDataActivitySampleGenerator _generateSwimmingSegmentDataWithStartDate:segmentTime:segmentDistance:numLaps:strokeStyle:objectCollection:demoPerson:](a1, v19, v24 >> 1, [*(id *)(a1 + 256) swimmingStrokeStyle], v25, v5, v20, v22);
      -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](&unk_1F17E95A0, &unk_1F17E95B8, v25, *(void **)(a1 + 264));
    }
  }
}

- (void)_generateEllipticalWorkoutDataWithObjectCollection:(void *)a3 demoPerson:
{
  v9[300] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v6 = a2;
  v9[0] = &unk_1F17EC288;
  v9[1] = &unk_1F17EC2A0;
  v9[2] = &unk_1F17EBA48;
  v9[3] = &unk_1F17EBA60;
  v9[4] = &unk_1F17EC288;
  v9[5] = &unk_1F17EC180;
  v9[6] = &unk_1F17EBA48;
  v9[7] = &unk_1F17EC288;
  v9[8] = &unk_1F17EC330;
  v9[9] = &unk_1F17EC288;
  v9[10] = &unk_1F17EBA78;
  v9[11] = &unk_1F17EC330;
  v9[12] = &unk_1F17EC168;
  v9[13] = &unk_1F17EC2A0;
  v9[14] = &unk_1F17EC288;
  v9[15] = &unk_1F17EC168;
  v9[16] = &unk_1F17EC180;
  v9[17] = &unk_1F17EC330;
  v9[18] = &unk_1F17EC288;
  v9[19] = &unk_1F17EC330;
  v9[20] = &unk_1F17EC198;
  v9[21] = &unk_1F17EBA78;
  v9[22] = &unk_1F17EBE20;
  v9[23] = &unk_1F17EC300;
  v9[24] = &unk_1F17EC180;
  v9[25] = &unk_1F17EC318;
  v9[26] = &unk_1F17EBE20;
  v9[27] = &unk_1F17EC150;
  v9[28] = &unk_1F17EBA90;
  v9[29] = &unk_1F17EBA90;
  v9[30] = &unk_1F17EC168;
  v9[31] = &unk_1F17EC138;
  v9[32] = &unk_1F17EBDF0;
  v9[33] = &unk_1F17EBE50;
  v9[34] = &unk_1F17EBDF0;
  v9[35] = &unk_1F17EBF58;
  v9[36] = &unk_1F17EBF88;
  v9[37] = &unk_1F17EBF70;
  v9[38] = &unk_1F17EBFA0;
  v9[39] = &unk_1F17EC120;
  v9[40] = &unk_1F17EBF70;
  v9[41] = &unk_1F17EBF70;
  v9[42] = &unk_1F17EBFA0;
  v9[43] = &unk_1F17EC048;
  v9[44] = &unk_1F17EBAC0;
  v9[45] = &unk_1F17EBAA8;
  v9[46] = &unk_1F17EBAC0;
  v9[47] = &unk_1F17EBF10;
  v9[48] = &unk_1F17EBFD0;
  v9[49] = &unk_1F17EC0C0;
  v9[50] = &unk_1F17EBAD8;
  v9[51] = &unk_1F17EBFD0;
  v9[52] = &unk_1F17EBAD8;
  v9[53] = &unk_1F17EBAF0;
  v9[54] = &unk_1F17EBFD0;
  v9[55] = &unk_1F17EBB80;
  v9[56] = &unk_1F17EBB08;
  v9[57] = &unk_1F17EC2E8;
  v9[58] = &unk_1F17EBBE0;
  v9[59] = &unk_1F17EBB68;
  v9[60] = &unk_1F17EC2E8;
  v9[61] = &unk_1F17EC2E8;
  v9[62] = &unk_1F17EBB68;
  v9[63] = &unk_1F17EBB20;
  v9[64] = &unk_1F17EBBB0;
  v9[65] = &unk_1F17EBB08;
  v9[66] = &unk_1F17EBB68;
  v9[67] = &unk_1F17EBB68;
  v9[68] = &unk_1F17EBBE0;
  v9[69] = &unk_1F17EBB38;
  v9[70] = &unk_1F17EBB98;
  v9[71] = &unk_1F17EBB80;
  v9[72] = &unk_1F17EBB98;
  v9[73] = &unk_1F17EBB80;
  v9[74] = &unk_1F17EBBE0;
  v9[75] = &unk_1F17EBBC8;
  v9[76] = &unk_1F17EBBE0;
  v9[77] = &unk_1F17EBB68;
  v9[78] = &unk_1F17EBBC8;
  v9[79] = &unk_1F17EBBC8;
  v9[80] = &unk_1F17EBC70;
  v9[81] = &unk_1F17EBB68;
  v9[82] = &unk_1F17EBB68;
  v9[83] = &unk_1F17EBBC8;
  v9[84] = &unk_1F17EBBC8;
  v9[85] = &unk_1F17EBB98;
  v9[86] = &unk_1F17EBCD0;
  v9[87] = &unk_1F17EBBC8;
  v9[88] = &unk_1F17EBC40;
  v9[89] = &unk_1F17EBCD0;
  v9[90] = &unk_1F17EBB98;
  v9[91] = &unk_1F17EBB98;
  v9[92] = &unk_1F17EBCD0;
  v9[93] = &unk_1F17EBBC8;
  v9[94] = &unk_1F17EBC40;
  v9[95] = &unk_1F17EBC88;
  v9[96] = &unk_1F17EBBF8;
  v9[97] = &unk_1F17EBB98;
  v9[98] = &unk_1F17EBC70;
  v9[99] = &unk_1F17EBBC8;
  v9[100] = &unk_1F17EBC40;
  v9[101] = &unk_1F17EBC88;
  v9[102] = &unk_1F17EBC88;
  v9[103] = &unk_1F17EBC88;
  v9[104] = &unk_1F17EBBC8;
  v9[105] = &unk_1F17EBBF8;
  v9[106] = &unk_1F17EBC28;
  v9[107] = &unk_1F17EBC10;
  v9[108] = &unk_1F17EBCE8;
  v9[109] = &unk_1F17EBBF8;
  v9[110] = &unk_1F17EBC40;
  v9[111] = &unk_1F17EBC28;
  v9[112] = &unk_1F17EBC88;
  v9[113] = &unk_1F17EBCD0;
  v9[114] = &unk_1F17EBCE8;
  v9[115] = &unk_1F17EBC40;
  v9[116] = &unk_1F17EBC40;
  v9[117] = &unk_1F17EBC58;
  v9[118] = &unk_1F17EBC70;
  v9[119] = &unk_1F17EBC58;
  v9[120] = &unk_1F17EBCD0;
  v9[121] = &unk_1F17EBD00;
  v9[122] = &unk_1F17EBC28;
  v9[123] = &unk_1F17EBCE8;
  v9[124] = &unk_1F17EBD00;
  v9[125] = &unk_1F17EBCA0;
  v9[126] = &unk_1F17EBC58;
  v9[127] = &unk_1F17EC2B8;
  v9[128] = &unk_1F17EBCE8;
  v9[129] = &unk_1F17EBCB8;
  v9[130] = &unk_1F17EC2B8;
  v9[131] = &unk_1F17EBCE8;
  v9[132] = &unk_1F17EBD00;
  v9[133] = &unk_1F17EBC40;
  v9[134] = &unk_1F17EBCA0;
  v9[135] = &unk_1F17EBCE8;
  v9[136] = &unk_1F17EC2B8;
  v9[137] = &unk_1F17EC2B8;
  v9[138] = &unk_1F17EBC88;
  v9[139] = &unk_1F17EBCB8;
  v9[140] = &unk_1F17EBCB8;
  v9[141] = &unk_1F17EBC88;
  v9[142] = &unk_1F17EBD00;
  v9[143] = &unk_1F17EBCE8;
  v9[144] = &unk_1F17EC2B8;
  v9[145] = &unk_1F17EBC28;
  v9[146] = &unk_1F17EBCB8;
  v9[147] = &unk_1F17EBCA0;
  v9[148] = &unk_1F17EBCE8;
  v9[149] = &unk_1F17EBC88;
  v9[150] = &unk_1F17EBD18;
  v9[151] = &unk_1F17EBC58;
  v9[152] = &unk_1F17EBC28;
  v9[153] = &unk_1F17EBCB8;
  v9[154] = &unk_1F17EBD18;
  v9[155] = &unk_1F17EBCB8;
  v9[156] = &unk_1F17EBCE8;
  v9[157] = &unk_1F17EBD00;
  v9[158] = &unk_1F17EBCA0;
  v9[159] = &unk_1F17EBCA0;
  v9[160] = &unk_1F17EC2B8;
  v9[161] = &unk_1F17EBD30;
  v9[162] = &unk_1F17EBD18;
  v9[163] = &unk_1F17EBD30;
  v9[164] = &unk_1F17EBCB8;
  v9[165] = &unk_1F17EC2B8;
  v9[166] = &unk_1F17EC2B8;
  v9[167] = &unk_1F17EBD18;
  v9[168] = &unk_1F17EBE98;
  v9[169] = &unk_1F17EBCB8;
  v9[170] = &unk_1F17EBE98;
  v9[171] = &unk_1F17EBD48;
  v9[172] = &unk_1F17EBCB8;
  v9[173] = &unk_1F17EBD00;
  v9[174] = &unk_1F17EBD48;
  v9[175] = &unk_1F17EBCA0;
  v9[176] = &unk_1F17EBD00;
  v9[177] = &unk_1F17EBCB8;
  v9[178] = &unk_1F17EBD30;
  v9[179] = &unk_1F17EC2B8;
  v9[180] = &unk_1F17EC2B8;
  v9[181] = &unk_1F17EBCB8;
  v9[182] = &unk_1F17EBD00;
  v9[183] = &unk_1F17EC2B8;
  v9[184] = &unk_1F17EC2B8;
  v9[185] = &unk_1F17EBE98;
  v9[186] = &unk_1F17EBE98;
  v9[187] = &unk_1F17EBE98;
  v9[188] = &unk_1F17EC2B8;
  v9[189] = &unk_1F17EBCB8;
  v9[190] = &unk_1F17EBD00;
  v9[191] = &unk_1F17EBD18;
  v9[192] = &unk_1F17EBD30;
  v9[193] = &unk_1F17EBCB8;
  v9[194] = &unk_1F17EBD30;
  v9[195] = &unk_1F17EBCB8;
  v9[196] = &unk_1F17EBFE8;
  v9[197] = &unk_1F17EBEE0;
  v9[198] = &unk_1F17EBCA0;
  v9[199] = &unk_1F17EBFE8;
  v9[200] = &unk_1F17EBD30;
  v9[201] = &unk_1F17EBFE8;
  v9[202] = &unk_1F17EBEC8;
  v9[203] = &unk_1F17EBEE0;
  v9[204] = &unk_1F17EBE80;
  v9[205] = &unk_1F17EBD18;
  v9[206] = &unk_1F17EBD30;
  v9[207] = &unk_1F17EBD30;
  v9[208] = &unk_1F17EBE80;
  v9[209] = &unk_1F17EBEB0;
  v9[210] = &unk_1F17EBFE8;
  v9[211] = &unk_1F17EBEC8;
  v9[212] = &unk_1F17EBE80;
  v9[213] = &unk_1F17EBD48;
  v9[214] = &unk_1F17EBEC8;
  v9[215] = &unk_1F17EBD18;
  v9[216] = &unk_1F17EBE80;
  v9[217] = &unk_1F17EBD18;
  v9[218] = &unk_1F17EBEE0;
  v9[219] = &unk_1F17EBE98;
  v9[220] = &unk_1F17EBD30;
  v9[221] = &unk_1F17EBD18;
  v9[222] = &unk_1F17EBE80;
  v9[223] = &unk_1F17EBE80;
  v9[224] = &unk_1F17EBD48;
  v9[225] = &unk_1F17EBE80;
  v9[226] = &unk_1F17EBEB0;
  v9[227] = &unk_1F17EBEC8;
  v9[228] = &unk_1F17EBD48;
  v9[229] = &unk_1F17EBEE0;
  v9[230] = &unk_1F17EBD30;
  v9[231] = &unk_1F17EBE98;
  v9[232] = &unk_1F17EBEB0;
  v9[233] = &unk_1F17EBD48;
  v9[234] = &unk_1F17EBD18;
  v9[235] = &unk_1F17EBFE8;
  v9[236] = &unk_1F17EBFE8;
  v9[237] = &unk_1F17EBE80;
  v9[238] = &unk_1F17EBD18;
  v9[239] = &unk_1F17EBEE0;
  v9[240] = &unk_1F17EBD30;
  v9[241] = &unk_1F17EBEB0;
  v9[242] = &unk_1F17EBFE8;
  v9[243] = &unk_1F17EBEC8;
  v9[244] = &unk_1F17EBFE8;
  v9[245] = &unk_1F17EBEC8;
  v9[246] = &unk_1F17EBEC8;
  v9[247] = &unk_1F17EBEE0;
  v9[248] = &unk_1F17EBEC8;
  v9[249] = &unk_1F17EBEB0;
  v9[250] = &unk_1F17EBD18;
  v9[251] = &unk_1F17EBEE0;
  v9[252] = &unk_1F17EBEC8;
  v9[253] = &unk_1F17EBD18;
  v9[254] = &unk_1F17EBEE0;
  v9[255] = &unk_1F17EBE80;
  v9[256] = &unk_1F17EBD30;
  v9[257] = &unk_1F17EBD30;
  v9[258] = &unk_1F17EBD18;
  v9[259] = &unk_1F17EBD48;
  v9[260] = &unk_1F17EBD48;
  v9[261] = &unk_1F17EBE98;
  v9[262] = &unk_1F17EBD30;
  v9[263] = &unk_1F17EBD48;
  v9[264] = &unk_1F17EBEC8;
  v9[265] = &unk_1F17EBEE0;
  v9[266] = &unk_1F17EBD30;
  v9[267] = &unk_1F17EBE80;
  v9[268] = &unk_1F17EBD48;
  v9[269] = &unk_1F17EBE98;
  v9[270] = &unk_1F17EBD30;
  v9[271] = &unk_1F17EBFE8;
  v9[272] = &unk_1F17EBEB0;
  v9[273] = &unk_1F17EBD48;
  v9[274] = &unk_1F17EBEC8;
  v9[275] = &unk_1F17EBEE0;
  v9[276] = &unk_1F17EBE80;
  v9[277] = &unk_1F17EBD48;
  v9[278] = &unk_1F17EBD30;
  id v4 = [NSNumber numberWithInteger:arc4random_uniform(0xAu) + 177];
  v9[279] = v4;
  v9[280] = &unk_1F17EBEB0;
  v9[281] = &unk_1F17EBEE0;
  v9[282] = &unk_1F17EBEB0;
  v9[283] = &unk_1F17EBD18;
  v9[284] = &unk_1F17EBD48;
  v9[285] = &unk_1F17EBEB0;
  v9[286] = &unk_1F17EBEE0;
  v9[287] = &unk_1F17EBFE8;
  v9[288] = &unk_1F17EBD48;
  v9[289] = &unk_1F17EBEC8;
  v9[290] = &unk_1F17EBEE0;
  v9[291] = &unk_1F17EBD30;
  v9[292] = &unk_1F17EBD18;
  v9[293] = &unk_1F17EBD48;
  v9[294] = &unk_1F17EBC58;
  v9[295] = &unk_1F17EBC58;
  v9[296] = &unk_1F17EBCB8;
  v9[297] = &unk_1F17EBC58;
  v9[298] = &unk_1F17EBC88;
  v9[299] = &unk_1F17EBC88;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:300];

  -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](v5, &unk_1F17E95D0, v6, *(void **)(a1 + 264));
}

- (void)_generateRunningWorkoutDataWithObjectCollection:(void *)a1 demoPerson:(void *)a2 workoutState:(void *)a3
{
  v10[540] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a2;
  id v7 = a1;
  v10[0] = &unk_1F17EC168;
  v10[1] = &unk_1F17EBA78;
  v10[2] = &unk_1F17EC288;
  v10[3] = &unk_1F17EC168;
  v10[4] = &unk_1F17EC300;
  v10[5] = &unk_1F17EC318;
  v10[6] = &unk_1F17EBE50;
  v10[7] = &unk_1F17EC138;
  v10[8] = &unk_1F17EBDF0;
  v10[9] = &unk_1F17EBE20;
  v10[10] = &unk_1F17EBDC0;
  v10[11] = &unk_1F17EBDD8;
  v10[12] = &unk_1F17EBDC0;
  v10[13] = &unk_1F17EBF58;
  v10[14] = &unk_1F17EBDD8;
  v10[15] = &unk_1F17EC078;
  v10[16] = &unk_1F17EBDA8;
  v10[17] = &unk_1F17EC078;
  v10[18] = &unk_1F17EBFB8;
  v10[19] = &unk_1F17EC048;
  v10[20] = &unk_1F17EBFB8;
  v10[21] = &unk_1F17EBDA8;
  v10[22] = &unk_1F17EC0D8;
  v10[23] = &unk_1F17EBFB8;
  v10[24] = &unk_1F17EBAC0;
  v10[25] = &unk_1F17EC078;
  v10[26] = &unk_1F17EBD60;
  v10[27] = &unk_1F17EBDA8;
  v10[28] = &unk_1F17EBD60;
  v10[29] = &unk_1F17EC0F0;
  v10[30] = &unk_1F17EBDA8;
  v10[31] = &unk_1F17EBFB8;
  v10[32] = &unk_1F17EC048;
  v10[33] = &unk_1F17EBFB8;
  v10[34] = &unk_1F17EC090;
  v10[35] = &unk_1F17EBAC0;
  v10[36] = &unk_1F17EC090;
  v10[37] = &unk_1F17EBAA8;
  v10[38] = &unk_1F17EBAA8;
  v10[39] = &unk_1F17EBFD0;
  v10[40] = &unk_1F17EBB20;
  v10[41] = &unk_1F17EC0C0;
  v10[42] = &unk_1F17EBAF0;
  v10[43] = &unk_1F17EBB38;
  v10[44] = &unk_1F17EBAD8;
  v10[45] = &unk_1F17EBB08;
  v10[46] = &unk_1F17EBB20;
  v10[47] = &unk_1F17EC0C0;
  v10[48] = &unk_1F17EBB20;
  v10[49] = &unk_1F17EBAD8;
  v10[50] = &unk_1F17EBB68;
  v10[51] = &unk_1F17EBBE0;
  v10[52] = &unk_1F17EBB20;
  v10[53] = &unk_1F17EBAD8;
  v10[54] = &unk_1F17EBBB0;
  v10[55] = &unk_1F17EBB80;
  v10[56] = &unk_1F17EBBB0;
  v10[57] = &unk_1F17EBB98;
  v10[58] = &unk_1F17EBC88;
  v10[59] = &unk_1F17EBBC8;
  v10[60] = &unk_1F17EBCE8;
  v10[61] = &unk_1F17EBC40;
  v10[62] = &unk_1F17EBBF8;
  v10[63] = &unk_1F17EBC88;
  v10[64] = &unk_1F17EBCD0;
  v10[65] = &unk_1F17EBCD0;
  v10[66] = &unk_1F17EBC88;
  v10[67] = &unk_1F17EBCD0;
  v10[68] = &unk_1F17EBBB0;
  v10[69] = &unk_1F17EBCE8;
  v10[70] = &unk_1F17EBBF8;
  v10[71] = &unk_1F17EBB50;
  v10[72] = &unk_1F17EBC40;
  v10[73] = &unk_1F17EBBB0;
  v10[74] = &unk_1F17EBBF8;
  v10[75] = &unk_1F17EBC58;
  v10[76] = &unk_1F17EBB68;
  v10[77] = &unk_1F17EBCE8;
  v10[78] = &unk_1F17EBD00;
  v10[79] = &unk_1F17EBC28;
  v10[80] = &unk_1F17EBC88;
  v10[81] = &unk_1F17EBC58;
  v10[82] = &unk_1F17EBCD0;
  v10[83] = &unk_1F17EBCE8;
  v10[84] = &unk_1F17EBCD0;
  v10[85] = &unk_1F17EBBF8;
  v10[86] = &unk_1F17EBC88;
  v10[87] = &unk_1F17EBD00;
  v10[88] = &unk_1F17EBCE8;
  v10[89] = &unk_1F17EBC58;
  v10[90] = &unk_1F17EBCB8;
  v10[91] = &unk_1F17EBC10;
  v10[92] = &unk_1F17EBC28;
  v10[93] = &unk_1F17EBD00;
  v10[94] = &unk_1F17EC2B8;
  v10[95] = &unk_1F17EBCA0;
  v10[96] = &unk_1F17EBCD0;
  v10[97] = &unk_1F17EBC58;
  v10[98] = &unk_1F17EBC28;
  v10[99] = &unk_1F17EBC58;
  v10[100] = &unk_1F17EBE98;
  v10[101] = &unk_1F17EBD00;
  v10[102] = &unk_1F17EBCA0;
  v10[103] = &unk_1F17EBE98;
  v10[104] = &unk_1F17EBE98;
  v10[105] = &unk_1F17EC2B8;
  v10[106] = &unk_1F17EBCE8;
  v10[107] = &unk_1F17EBD48;
  v10[108] = &unk_1F17EC2B8;
  v10[109] = &unk_1F17EBCE8;
  v10[110] = &unk_1F17EBE98;
  v10[111] = &unk_1F17EBE98;
  v10[112] = &unk_1F17EBEC8;
  v10[113] = &unk_1F17EBD48;
  v10[114] = &unk_1F17EBFE8;
  v10[115] = &unk_1F17EBE98;
  v10[116] = &unk_1F17EBCA0;
  v10[117] = &unk_1F17EBD00;
  v10[118] = &unk_1F17EBFE8;
  v10[119] = &unk_1F17EC2B8;
  v10[120] = &unk_1F17EC2B8;
  v10[121] = &unk_1F17EBFE8;
  v10[122] = &unk_1F17EBE98;
  v10[123] = &unk_1F17EBFE8;
  v10[124] = &unk_1F17EC2B8;
  v10[125] = &unk_1F17EBD00;
  v10[126] = &unk_1F17EBFE8;
  v10[127] = &unk_1F17EBE98;
  v10[128] = &unk_1F17EBD30;
  v10[129] = &unk_1F17EBEC8;
  v10[130] = &unk_1F17EBE98;
  v10[131] = &unk_1F17EBD00;
  v10[132] = &unk_1F17EBCA0;
  v10[133] = &unk_1F17EBE98;
  v10[134] = &unk_1F17EBE98;
  v10[135] = &unk_1F17EC2B8;
  v10[136] = &unk_1F17EBCE8;
  v10[137] = &unk_1F17EBD48;
  v10[138] = &unk_1F17EC2B8;
  v10[139] = &unk_1F17EBCE8;
  v10[140] = &unk_1F17EBE98;
  v10[141] = &unk_1F17EBE98;
  v10[142] = &unk_1F17EBEC8;
  v10[143] = &unk_1F17EBD48;
  v10[144] = &unk_1F17EBFE8;
  v10[145] = &unk_1F17EBE98;
  v10[146] = &unk_1F17EBCA0;
  v10[147] = &unk_1F17EBD00;
  v10[148] = &unk_1F17EBFE8;
  v10[149] = &unk_1F17EC2B8;
  v10[150] = &unk_1F17EC2B8;
  v10[151] = &unk_1F17EBFE8;
  v10[152] = &unk_1F17EBE98;
  v10[153] = &unk_1F17EBFE8;
  v10[154] = &unk_1F17EC2B8;
  v10[155] = &unk_1F17EBD00;
  v10[156] = &unk_1F17EBFE8;
  v10[157] = &unk_1F17EBE98;
  v10[158] = &unk_1F17EBD30;
  v10[159] = &unk_1F17EBEC8;
  v10[160] = &unk_1F17EBD48;
  v10[161] = &unk_1F17EBEC8;
  v10[162] = &unk_1F17EBD18;
  v10[163] = &unk_1F17EBE98;
  v10[164] = &unk_1F17EBD00;
  v10[165] = &unk_1F17EBD48;
  v10[166] = &unk_1F17EC2B8;
  v10[167] = &unk_1F17EBC58;
  v10[168] = &unk_1F17EBC28;
  v10[169] = &unk_1F17EBC40;
  v10[170] = &unk_1F17EC2B8;
  v10[171] = &unk_1F17EBFE8;
  v10[172] = &unk_1F17EBE98;
  v10[173] = &unk_1F17EBFE8;
  v10[174] = &unk_1F17EC2B8;
  v10[175] = &unk_1F17EBD00;
  v10[176] = &unk_1F17EBFE8;
  v10[177] = &unk_1F17EBE98;
  v10[178] = &unk_1F17EBD30;
  v10[179] = &unk_1F17EBEC8;
  v10[180] = &unk_1F17EBD18;
  v10[181] = &unk_1F17EBC58;
  v10[182] = &unk_1F17EBCD0;
  v10[183] = &unk_1F17EBC88;
  v10[184] = &unk_1F17EBD18;
  v10[185] = &unk_1F17EBC28;
  v10[186] = &unk_1F17EBCD0;
  v10[187] = &unk_1F17EBC40;
  v10[188] = &unk_1F17EBCA0;
  v10[189] = &unk_1F17EBC58;
  v10[190] = &unk_1F17EBC40;
  v10[191] = &unk_1F17EBE98;
  v10[192] = &unk_1F17EC2B8;
  v10[193] = &unk_1F17EC2B8;
  v10[194] = &unk_1F17EBCB8;
  v10[195] = &unk_1F17EBEE0;
  v10[196] = &unk_1F17EBEC8;
  v10[197] = &unk_1F17EBE98;
  v10[198] = &unk_1F17EBD18;
  v10[199] = &unk_1F17EBCA0;
  v10[200] = &unk_1F17EBD30;
  v10[201] = &unk_1F17EBEB0;
  v10[202] = &unk_1F17EC2B8;
  v10[203] = &unk_1F17EBFE8;
  v10[204] = &unk_1F17EBCB8;
  v10[205] = &unk_1F17EBEC8;
  v10[206] = &unk_1F17EBFE8;
  v10[207] = &unk_1F17EBD30;
  v10[208] = &unk_1F17EBD48;
  v10[209] = &unk_1F17EBD48;
  v10[210] = &unk_1F17EBEC8;
  v10[211] = &unk_1F17EBEB0;
  v10[212] = &unk_1F17EBD18;
  v10[213] = &unk_1F17EBFE8;
  v10[214] = &unk_1F17EBD48;
  v10[215] = &unk_1F17EBEB0;
  v10[216] = &unk_1F17EBD48;
  v10[217] = &unk_1F17EBD30;
  v10[218] = &unk_1F17EC2B8;
  v10[219] = &unk_1F17EBEE0;
  v10[220] = &unk_1F17EBD00;
  v10[221] = &unk_1F17EBE80;
  v10[222] = &unk_1F17EBD00;
  v10[223] = &unk_1F17EBE80;
  v10[224] = &unk_1F17EBEC8;
  v10[225] = &unk_1F17EBD00;
  v10[226] = &unk_1F17EBE98;
  v10[227] = &unk_1F17EBEE0;
  v10[228] = &unk_1F17EBEB0;
  v10[229] = &unk_1F17EBEE0;
  v10[230] = &unk_1F17EC2B8;
  v10[231] = &unk_1F17EBE98;
  v10[232] = &unk_1F17EBD18;
  v10[233] = &unk_1F17EBD00;
  v10[234] = &unk_1F17EBEE0;
  v10[235] = &unk_1F17EBCA0;
  v10[236] = &unk_1F17EBEC8;
  v10[237] = &unk_1F17EBCA0;
  v10[238] = &unk_1F17EBEE0;
  v10[239] = &unk_1F17EBEB0;
  v10[240] = &unk_1F17EBC40;
  v10[241] = &unk_1F17EBE98;
  v10[242] = &unk_1F17EC2B8;
  v10[243] = &unk_1F17EC2B8;
  v10[244] = &unk_1F17EBCB8;
  v10[245] = &unk_1F17EBEE0;
  v10[246] = &unk_1F17EBEC8;
  v10[247] = &unk_1F17EBE98;
  v10[248] = &unk_1F17EBD18;
  v10[249] = &unk_1F17EBCA0;
  v10[250] = &unk_1F17EBD48;
  v10[251] = &unk_1F17EBEC8;
  v10[252] = &unk_1F17EBD18;
  v10[253] = &unk_1F17EBE98;
  v10[254] = &unk_1F17EBD00;
  v10[255] = &unk_1F17EBD48;
  v10[256] = &unk_1F17EC2B8;
  v10[257] = &unk_1F17EBC58;
  v10[258] = &unk_1F17EBC28;
  v10[259] = &unk_1F17EBC40;
  v10[260] = &unk_1F17EBD30;
  v10[261] = &unk_1F17EBEB0;
  v10[262] = &unk_1F17EC2B8;
  v10[263] = &unk_1F17EBFE8;
  v10[264] = &unk_1F17EBCB8;
  v10[265] = &unk_1F17EBEC8;
  v10[266] = &unk_1F17EBFE8;
  v10[267] = &unk_1F17EBD30;
  v10[268] = &unk_1F17EBD48;
  v10[269] = &unk_1F17EBD48;
  v10[270] = &unk_1F17EBEC8;
  v10[271] = &unk_1F17EBEB0;
  v10[272] = &unk_1F17EBD18;
  v10[273] = &unk_1F17EBFE8;
  v10[274] = &unk_1F17EBD48;
  v10[275] = &unk_1F17EBEB0;
  v10[276] = &unk_1F17EBD48;
  v10[277] = &unk_1F17EBD30;
  v10[278] = &unk_1F17EC2B8;
  v10[279] = &unk_1F17EBEE0;
  v10[280] = &unk_1F17EBD48;
  v10[281] = &unk_1F17EBEC8;
  v10[282] = &unk_1F17EBD18;
  v10[283] = &unk_1F17EBE98;
  v10[284] = &unk_1F17EBD00;
  v10[285] = &unk_1F17EBD48;
  v10[286] = &unk_1F17EC2B8;
  v10[287] = &unk_1F17EBC58;
  v10[288] = &unk_1F17EBC28;
  v10[289] = &unk_1F17EBC40;
  v10[290] = &unk_1F17EBD18;
  v10[291] = &unk_1F17EBC58;
  v10[292] = &unk_1F17EBCD0;
  v10[293] = &unk_1F17EBC88;
  v10[294] = &unk_1F17EBD18;
  v10[295] = &unk_1F17EBC28;
  v10[296] = &unk_1F17EBCD0;
  v10[297] = &unk_1F17EBC40;
  v10[298] = &unk_1F17EBCA0;
  v10[299] = &unk_1F17EBC58;
  v10[300] = &unk_1F17EBC40;
  v10[301] = &unk_1F17EBE98;
  v10[302] = &unk_1F17EC2B8;
  v10[303] = &unk_1F17EC2B8;
  v10[304] = &unk_1F17EBCB8;
  v10[305] = &unk_1F17EBEE0;
  v10[306] = &unk_1F17EBEC8;
  v10[307] = &unk_1F17EBE98;
  v10[308] = &unk_1F17EBD18;
  v10[309] = &unk_1F17EBCA0;
  v10[310] = &unk_1F17EBD18;
  v10[311] = &unk_1F17EBC58;
  v10[312] = &unk_1F17EBCD0;
  v10[313] = &unk_1F17EBC88;
  v10[314] = &unk_1F17EBD18;
  v10[315] = &unk_1F17EBC28;
  v10[316] = &unk_1F17EBCD0;
  v10[317] = &unk_1F17EBC40;
  v10[318] = &unk_1F17EBCA0;
  v10[319] = &unk_1F17EBC58;
  v10[320] = &unk_1F17EBC40;
  v10[321] = &unk_1F17EBE98;
  v10[322] = &unk_1F17EC2B8;
  v10[323] = &unk_1F17EC2B8;
  v10[324] = &unk_1F17EBCB8;
  v10[325] = &unk_1F17EBEE0;
  v10[326] = &unk_1F17EBEC8;
  v10[327] = &unk_1F17EBE98;
  v10[328] = &unk_1F17EBD18;
  v10[329] = &unk_1F17EBCA0;
  v10[330] = &unk_1F17EBD30;
  v10[331] = &unk_1F17EBEB0;
  v10[332] = &unk_1F17EC2B8;
  v10[333] = &unk_1F17EBFE8;
  v10[334] = &unk_1F17EBCB8;
  v10[335] = &unk_1F17EBEC8;
  v10[336] = &unk_1F17EBFE8;
  v10[337] = &unk_1F17EBD30;
  v10[338] = &unk_1F17EBD48;
  v10[339] = &unk_1F17EBD48;
  v10[340] = &unk_1F17EBEC8;
  v10[341] = &unk_1F17EBEB0;
  v10[342] = &unk_1F17EBD18;
  v10[343] = &unk_1F17EBFE8;
  v10[344] = &unk_1F17EBD48;
  v10[345] = &unk_1F17EBEB0;
  v10[346] = &unk_1F17EBD48;
  v10[347] = &unk_1F17EBD30;
  v10[348] = &unk_1F17EC2B8;
  v10[349] = &unk_1F17EBEE0;
  v10[350] = &unk_1F17EBD30;
  v10[351] = &unk_1F17EBEB0;
  v10[352] = &unk_1F17EC2B8;
  v10[353] = &unk_1F17EBFE8;
  v10[354] = &unk_1F17EBCB8;
  v10[355] = &unk_1F17EBEC8;
  v10[356] = &unk_1F17EBFE8;
  v10[357] = &unk_1F17EBD30;
  v10[358] = &unk_1F17EBD48;
  v10[359] = &unk_1F17EBD48;
  v10[360] = &unk_1F17EBEC8;
  v10[361] = &unk_1F17EBEB0;
  v10[362] = &unk_1F17EBD18;
  v10[363] = &unk_1F17EBFE8;
  v10[364] = &unk_1F17EBD48;
  v10[365] = &unk_1F17EBEB0;
  v10[366] = &unk_1F17EBD48;
  v10[367] = &unk_1F17EBD30;
  v10[368] = &unk_1F17EC2B8;
  v10[369] = &unk_1F17EBEE0;
  v10[370] = &unk_1F17EBD48;
  v10[371] = &unk_1F17EBEC8;
  v10[372] = &unk_1F17EBD18;
  v10[373] = &unk_1F17EBE98;
  v10[374] = &unk_1F17EBD00;
  v10[375] = &unk_1F17EBD48;
  v10[376] = &unk_1F17EC2B8;
  v10[377] = &unk_1F17EBC58;
  v10[378] = &unk_1F17EBC28;
  v10[379] = &unk_1F17EBC40;
  v10[380] = &unk_1F17EBD18;
  v10[381] = &unk_1F17EBC58;
  v10[382] = &unk_1F17EBCD0;
  v10[383] = &unk_1F17EBC88;
  v10[384] = &unk_1F17EBD18;
  v10[385] = &unk_1F17EBC28;
  v10[386] = &unk_1F17EBCD0;
  v10[387] = &unk_1F17EBC40;
  v10[388] = &unk_1F17EBCA0;
  v10[389] = &unk_1F17EBC58;
  v10[390] = &unk_1F17EBC40;
  v10[391] = &unk_1F17EBE98;
  v10[392] = &unk_1F17EC2B8;
  v10[393] = &unk_1F17EC2B8;
  v10[394] = &unk_1F17EBCB8;
  v10[395] = &unk_1F17EBEE0;
  v10[396] = &unk_1F17EBEC8;
  v10[397] = &unk_1F17EBE98;
  v10[398] = &unk_1F17EBD18;
  v10[399] = &unk_1F17EBCA0;
  v10[400] = &unk_1F17EBD30;
  v10[401] = &unk_1F17EBEB0;
  v10[402] = &unk_1F17EC2B8;
  v10[403] = &unk_1F17EBFE8;
  v10[404] = &unk_1F17EBCB8;
  v10[405] = &unk_1F17EBEC8;
  v10[406] = &unk_1F17EBFE8;
  v10[407] = &unk_1F17EBD30;
  v10[408] = &unk_1F17EBD48;
  v10[409] = &unk_1F17EBD48;
  v10[410] = &unk_1F17EBEC8;
  v10[411] = &unk_1F17EBEB0;
  v10[412] = &unk_1F17EBD18;
  v10[413] = &unk_1F17EBFE8;
  v10[414] = &unk_1F17EBD48;
  v10[415] = &unk_1F17EBEB0;
  v10[416] = &unk_1F17EBD48;
  v10[417] = &unk_1F17EBD30;
  v10[418] = &unk_1F17EC2B8;
  v10[419] = &unk_1F17EBEE0;
  v10[420] = &unk_1F17EBD00;
  v10[421] = &unk_1F17EBE80;
  v10[422] = &unk_1F17EBD00;
  v10[423] = &unk_1F17EBE80;
  v10[424] = &unk_1F17EBEC8;
  v10[425] = &unk_1F17EBD00;
  v10[426] = &unk_1F17EBE98;
  v10[427] = &unk_1F17EBEE0;
  v10[428] = &unk_1F17EBEB0;
  v10[429] = &unk_1F17EBEE0;
  v10[430] = &unk_1F17EC2B8;
  v10[431] = &unk_1F17EBE98;
  v10[432] = &unk_1F17EBD18;
  v10[433] = &unk_1F17EBD00;
  v10[434] = &unk_1F17EBEE0;
  v10[435] = &unk_1F17EBCA0;
  v10[436] = &unk_1F17EBEC8;
  v10[437] = &unk_1F17EBCA0;
  v10[438] = &unk_1F17EBEE0;
  v10[439] = &unk_1F17EBEB0;
  v10[440] = &unk_1F17EBE98;
  v10[441] = &unk_1F17EBD00;
  v10[442] = &unk_1F17EBE98;
  v10[443] = &unk_1F17EBD18;
  v10[444] = &unk_1F17EBCA0;
  v10[445] = &unk_1F17EC2B8;
  v10[446] = &unk_1F17EBEE0;
  v10[447] = &unk_1F17EBE80;
  v10[448] = &unk_1F17EBE98;
  v10[449] = &unk_1F17EBE98;
  v10[450] = &unk_1F17EBE98;
  v10[451] = &unk_1F17EBEE0;
  v10[452] = &unk_1F17EBFE8;
  v10[453] = &unk_1F17EBD18;
  v10[454] = &unk_1F17EBD18;
  v10[455] = &unk_1F17EBEE0;
  v10[456] = &unk_1F17EBE80;
  v10[457] = &unk_1F17EBD18;
  v10[458] = &unk_1F17EBD30;
  v10[459] = &unk_1F17EBEE0;
  v10[460] = &unk_1F17EBEC8;
  v10[461] = &unk_1F17EBEC8;
  v10[462] = &unk_1F17EBD30;
  v10[463] = &unk_1F17EC000;
  v10[464] = &unk_1F17EBCB8;
  v10[465] = &unk_1F17EBE80;
  v10[466] = &unk_1F17EBE98;
  v10[467] = &unk_1F17EBEE0;
  v10[468] = &unk_1F17EBEE0;
  v10[469] = &unk_1F17EBEC8;
  v10[470] = &unk_1F17EC3C0;
  v10[471] = &unk_1F17EC000;
  v10[472] = &unk_1F17EBFE8;
  v10[473] = &unk_1F17EBEC8;
  v10[474] = &unk_1F17EC018;
  v10[475] = &unk_1F17EC3D8;
  v10[476] = &unk_1F17EBFE8;
  v10[477] = &unk_1F17EBEE0;
  v10[478] = &unk_1F17EBEB0;
  v10[479] = &unk_1F17EC030;
  v10[480] = &unk_1F17EBEB0;
  v10[481] = &unk_1F17EBEE0;
  v10[482] = &unk_1F17EBEF8;
  v10[483] = &unk_1F17EC030;
  v10[484] = &unk_1F17EC000;
  v10[485] = &unk_1F17EBE80;
  v10[486] = &unk_1F17EBD30;
  v10[487] = &unk_1F17EBD30;
  v10[488] = &unk_1F17EBEB0;
  v10[489] = &unk_1F17EBEC8;
  v10[490] = &unk_1F17EC018;
  v10[491] = &unk_1F17EBEE0;
  v10[492] = &unk_1F17EC3C0;
  v10[493] = &unk_1F17EBEE0;
  v10[494] = &unk_1F17EC3D8;
  v10[495] = &unk_1F17EBEC8;
  v10[496] = &unk_1F17EC018;
  v10[497] = &unk_1F17EC018;
  v10[498] = &unk_1F17EBD48;
  v10[499] = &unk_1F17EC030;
  v10[500] = &unk_1F17EBD30;
  v10[501] = &unk_1F17EBD48;
  v10[502] = &unk_1F17EBEE0;
  v10[503] = &unk_1F17EBD30;
  v10[504] = &unk_1F17EBE80;
  v10[505] = &unk_1F17EC030;
  v10[506] = &unk_1F17EBD30;
  v10[507] = &unk_1F17EBEF8;
  v10[508] = &unk_1F17EBD30;
  id v5 = [NSNumber numberWithInteger:arc4random_uniform(0xAu) + 187];
  v10[509] = v5;
  v10[510] = &unk_1F17EC000;
  v10[511] = &unk_1F17EBD48;
  v10[512] = &unk_1F17EC030;
  v10[513] = &unk_1F17EBEB0;
  v10[514] = &unk_1F17EBD30;
  v10[515] = &unk_1F17EBD30;
  v10[516] = &unk_1F17EBEC8;
  v10[517] = &unk_1F17EBD30;
  v10[518] = &unk_1F17EBD30;
  v10[519] = &unk_1F17EC2B8;
  v10[520] = &unk_1F17EBCA0;
  v10[521] = &unk_1F17EC2B8;
  v10[522] = &unk_1F17EBCA0;
  v10[523] = &unk_1F17EBEC8;
  v10[524] = &unk_1F17EBC88;
  v10[525] = &unk_1F17EBD00;
  v10[526] = &unk_1F17EBC58;
  v10[527] = &unk_1F17EBD18;
  v10[528] = &unk_1F17EC2B8;
  v10[529] = &unk_1F17EBCE8;
  v10[530] = &unk_1F17EBCB8;
  v10[531] = &unk_1F17EBCE8;
  v10[532] = &unk_1F17EBCE8;
  v10[533] = &unk_1F17EBD00;
  v10[534] = &unk_1F17EBD18;
  v10[535] = &unk_1F17EBCE8;
  v10[536] = &unk_1F17EBC70;
  v10[537] = &unk_1F17EBC58;
  v10[538] = &unk_1F17EBC70;
  v10[539] = &unk_1F17EBBF8;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:540];

  -[HDDemoDataActivitySampleGenerator _generateWorkoutDataWithHeartRates:recoveryHeartRates:objectCollection:demoPerson:workoutState:](v6, &unk_1F17E95E8, v7, v8);
}

- (void)_generateUnderwaterDivingWorkoutDataWithObjectCollection:(void *)a3 demoPerson:
{
  v28[120] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v19 = a2;
  v28[0] = &unk_1F17EC690;
  v28[1] = &unk_1F17EC6A8;
  v28[2] = &unk_1F17EC6C0;
  v28[3] = &unk_1F17EC6D8;
  v28[4] = &unk_1F17EC6F0;
  v28[5] = &unk_1F17EC708;
  v28[6] = &unk_1F17EC720;
  v28[7] = &unk_1F17EC738;
  v28[8] = &unk_1F17EC738;
  v28[9] = &unk_1F17EC750;
  v28[10] = &unk_1F17EC768;
  v28[11] = &unk_1F17EC780;
  v28[12] = &unk_1F17EC780;
  v28[13] = &unk_1F17EC798;
  v28[14] = &unk_1F17EC7B0;
  v28[15] = &unk_1F17EC7C8;
  v28[16] = &unk_1F17EC7E0;
  v28[17] = &unk_1F17EC7F8;
  v28[18] = &unk_1F17EC600;
  v28[19] = &unk_1F17EC5B8;
  v28[20] = &unk_1F17EC5A0;
  v28[21] = &unk_1F17EC4F8;
  v28[22] = &unk_1F17EC540;
  v28[23] = &unk_1F17EC438;
  v28[24] = &unk_1F17EC618;
  v28[25] = &unk_1F17EC510;
  v28[26] = &unk_1F17EC420;
  v28[27] = &unk_1F17EC468;
  v28[28] = &unk_1F17EC360;
  v28[29] = &unk_1F17EC258;
  v28[32] = &unk_1F17EC1C8;
  v28[33] = &unk_1F17EC1F8;
  v28[34] = &unk_1F17EC1E0;
  v28[35] = &unk_1F17EC3A8;
  v28[30] = &unk_1F17EC210;
  v28[31] = &unk_1F17EC1E0;
  v28[36] = &unk_1F17EC378;
  v28[37] = &unk_1F17EC1E0;
  v28[38] = &unk_1F17EC1E0;
  id v4 = [NSNumber numberWithInteger:arc4random_uniform(0xAu) + 90];
  v28[39] = v4;
  v28[40] = &unk_1F17EC1E0;
  v28[41] = &unk_1F17EC348;
  v28[42] = &unk_1F17EB9D0;
  v28[43] = &unk_1F17EC258;
  v28[44] = &unk_1F17EC498;
  v28[45] = &unk_1F17EC258;
  v28[46] = &unk_1F17EC3F0;
  v28[47] = &unk_1F17EC420;
  v28[48] = &unk_1F17EC510;
  v28[49] = &unk_1F17EC810;
  v28[50] = &unk_1F17EC540;
  v28[51] = &unk_1F17EC5A0;
  v28[52] = &unk_1F17EC5B8;
  v28[53] = &unk_1F17EC600;
  v28[54] = &unk_1F17EC5E8;
  v28[55] = &unk_1F17EC7F8;
  v28[56] = &unk_1F17EC5B8;
  v28[57] = &unk_1F17EC5E8;
  v28[58] = &unk_1F17EC828;
  v28[59] = &unk_1F17EC600;
  v28[60] = &unk_1F17EC7E0;
  v28[61] = &unk_1F17EC840;
  v28[62] = &unk_1F17EC858;
  v28[63] = &unk_1F17EC870;
  v28[64] = &unk_1F17EC888;
  v28[65] = &unk_1F17EC8A0;
  v28[66] = &unk_1F17EC7B0;
  v28[67] = &unk_1F17EC8B8;
  v28[68] = &unk_1F17EC798;
  v28[69] = &unk_1F17EC8D0;
  v28[70] = &unk_1F17EC8E8;
  v28[71] = &unk_1F17EC8B8;
  v28[72] = &unk_1F17EC900;
  v28[73] = &unk_1F17EC7B0;
  v28[74] = &unk_1F17EC7B0;
  v28[75] = &unk_1F17EC918;
  v28[76] = &unk_1F17EC918;
  v28[77] = &unk_1F17EC7C8;
  v28[78] = &unk_1F17EC930;
  v28[79] = &unk_1F17EC8A0;
  v28[80] = &unk_1F17EC7C8;
  v28[81] = &unk_1F17EC7C8;
  v28[82] = &unk_1F17EC7C8;
  v28[83] = &unk_1F17EC948;
  v28[84] = &unk_1F17EC888;
  v28[85] = &unk_1F17EC888;
  v28[86] = &unk_1F17EC960;
  v28[87] = &unk_1F17EC870;
  v28[88] = &unk_1F17EC870;
  v28[89] = &unk_1F17EC7C8;
  v28[90] = &unk_1F17EC8A0;
  v28[91] = &unk_1F17EC900;
  v28[92] = &unk_1F17EC918;
  v28[93] = &unk_1F17EC7B0;
  v28[94] = &unk_1F17EC7B0;
  v28[95] = &unk_1F17EC8B8;
  v28[96] = &unk_1F17EC8D0;
  v28[97] = &unk_1F17EC978;
  v28[98] = &unk_1F17EC798;
  v28[99] = &unk_1F17EC990;
  v28[100] = &unk_1F17EC9A8;
  v28[101] = &unk_1F17EC780;
  v28[102] = &unk_1F17EC780;
  v28[103] = &unk_1F17EC9C0;
  v28[104] = &unk_1F17EC9D8;
  v28[105] = &unk_1F17EC9F0;
  v28[106] = &unk_1F17EC738;
  v28[107] = &unk_1F17ECA08;
  v28[108] = &unk_1F17ECA08;
  v28[109] = &unk_1F17ECA08;
  v28[110] = &unk_1F17ECA08;
  v28[111] = &unk_1F17ECA08;
  v28[112] = &unk_1F17ECA08;
  v28[113] = &unk_1F17ECA08;
  v28[114] = &unk_1F17EC6D8;
  v28[115] = &unk_1F17ECA20;
  v28[116] = &unk_1F17ECA38;
  v28[117] = &unk_1F17ECA50;
  v28[118] = &unk_1F17ECA50;
  v28[119] = &unk_1F17EC690;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:120];

  uint64_t v6 = *MEMORY[0x1E4F2A910];
  id v7 = [MEMORY[0x1E4F2B618] footUnit];
  id v8 = *(void **)(a1 + 264);
  id v9 = v7;
  id v10 = v19;
  id v11 = v8;
  uint64_t v12 = (void *)MEMORY[0x1E4F2B3B8];
  id v13 = v5;
  double v14 = [v12 quantityTypeForIdentifier:v6];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __145__HDDemoDataActivitySampleGenerator__generateWorkoutDataForTypeIdentifier_unit_samples_objectCollection_demoPerson_sampleFrequency_workoutState___block_invoke;
  v22[3] = &unk_1E62FEA88;
  id v15 = v11;
  id v23 = v15;
  uint64_t v27 = 0x403E000000000000;
  id v16 = v9;
  id v24 = v16;
  id v25 = v14;
  id v17 = v10;
  id v26 = v17;
  id v18 = v14;
  [v13 enumerateObjectsUsingBlock:v22];
}

- (void)_generateWorkoutEffortWithObjectCollection:(void *)a3 forWorkout:(void *)a4 dataType:
{
  id v7 = NSNumber;
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v21 = [v7 numberWithUnsignedInt:arc4random_uniform(7u) + 3];
  id v11 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v12 = [MEMORY[0x1E4F2B618] appleEffortScoreUnit];
  [v21 doubleValue];
  id v13 = objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12);

  double v14 = (void *)MEMORY[0x1E4F2B388];
  id v15 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:v8];

  id v16 = [v9 startDate];
  id v17 = [v9 endDate];

  id v18 = [v14 quantitySampleWithType:v15 quantity:v13 startDate:v16 endDate:v17];

  [v10 addObjectFromWatch:v18];
  uint64_t v19 = *(void *)(a1 + 264);
  double v20 = [v18 UUID];
  if (v19) {
    objc_msgSend(*(id *)(v19 + 16), "hk_appendBytesWithUUID:", v20);
  }
}

- (void)_generateWorkoutDataWithHeartRates:(void *)a3 recoveryHeartRates:(void *)a4 objectCollection:demoPerson:workoutState:
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F2B618];
  id v10 = a2;
  id v11 = a1;
  uint64_t v12 = [v9 _countPerMinuteUnit];
  id v13 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  uint64_t v37 = *MEMORY[0x1E4F2BB28];
  v38[0] = &unk_1F17ECA68;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __132__HDDemoDataActivitySampleGenerator__generateWorkoutDataWithHeartRates_recoveryHeartRates_objectCollection_demoPerson_workoutState___block_invoke;
  v31[3] = &unk_1E62FEA60;
  id v15 = v8;
  id v32 = v15;
  id v16 = v12;
  id v33 = v16;
  id v17 = v13;
  id v34 = v17;
  id v35 = v14;
  id v18 = v7;
  id v36 = v18;
  id v19 = v14;
  [v11 enumerateObjectsUsingBlock:v31];
  unint64_t v20 = [v11 count];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __132__HDDemoDataActivitySampleGenerator__generateWorkoutDataWithHeartRates_recoveryHeartRates_objectCollection_demoPerson_workoutState___block_invoke_2;
  v25[3] = &unk_1E62FEA88;
  id v21 = v15;
  id v26 = v21;
  id v27 = v16;
  unint64_t v30 = v20 / 0xA;
  id v28 = v17;
  id v22 = v18;
  id v29 = v22;
  id v23 = v17;
  id v24 = v16;
  [v10 enumerateObjectsUsingBlock:v25];
}

- (void)_generateSwimmingSegmentDataWithStartDate:(uint64_t)a3 segmentTime:(uint64_t)a4 segmentDistance:(void *)a5 numLaps:(void *)a6 strokeStyle:(double)a7 objectCollection:(double)a8 demoPerson:
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v68 = a5;
  id v14 = a6;
  id v15 = [v13 dateByAddingTimeInterval:a7];
  v63 = v13;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v15];
  id v17 = [MEMORY[0x1E4F2B798] workoutEventWithType:7 dateInterval:v16 metadata:0];
  uint64_t v18 = *(void *)(a1 + 264);
  if (v18) {
    [*(id *)(v18 + 24) addObject:v17];
  }
  double v19 = a8 / (double)a3;
  unint64_t v20 = (void *)MEMORY[0x1E4F2B370];
  id v21 = [MEMORY[0x1E4F2B618] yardUnit];
  id v22 = [v20 quantityWithUnit:v21 doubleValue:v19];

  id v23 = v22;
  id v24 = v14;
  id v25 = [MEMORY[0x1E4F2B618] yardUnit];
  int v64 = v23;
  [v23 doubleValueForUnit:v25];
  double v27 = v26;

  [v24 swimmingStrokesPerYard];
  double v29 = v27 * v28;
  uint32_t v30 = arc4random_uniform(0x64u);
  double v31 = v29 * ((double)v30 / 1000.0 + (double)v30 / 1000.0 * -0.5 + 1.0);
  if (v31 <= 0.00000011920929)
  {
    id v34 = 0;
  }
  else
  {
    id v32 = (void *)MEMORY[0x1E4F2B370];
    id v33 = [MEMORY[0x1E4F2B618] countUnit];
    id v34 = [v32 quantityWithUnit:v33 doubleValue:(double)(int)v31];
  }
  uint64_t v62 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D8]];
  v61 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F8]];
  uint64_t v69 = *MEMORY[0x1E4F2A1E8];
  id v35 = [NSNumber numberWithInteger:a4];
  v70[0] = v35;
  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];

  if (a3 >= 1)
  {
    id v57 = v24;
    v58 = v17;
    double v59 = v16;
    uint64_t v60 = v15;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    double v39 = a7 / (double)a3;
    unint64_t v40 = 0x1EBA09000uLL;
    do
    {
      uint64_t v41 = v38;
      uint64_t v42 = v37;
      uint64_t v37 = objc_msgSend(v63, "dateByAddingTimeInterval:", v39 * (double)(int)v36, v57, v58, v59, v60);

      uint64_t v38 = [v63 dateByAddingTimeInterval:v39 * (double)(int)++v36];

      double v43 = (void *)MEMORY[0x1E4F2B798];
      uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v38 duration:0.0];
      double v45 = [v43 workoutEventWithType:3 dateInterval:v44 metadata:v67];

      uint64_t v46 = *(void *)(a1 + *(int *)(v40 + 3024));
      if (v46) {
        [*(id *)(v46 + 24) addObject:v45];
      }
      double v47 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v62 quantity:v64 startDate:v37 endDate:v38];
      uint64_t v48 = *(void *)(a1 + *(int *)(v40 + 3024));
      if (v48) {
        *(double *)(v48 + 88) = v19 + *(double *)(v48 + 88);
      }
      [v68 addObjectFromWatch:v47];
      uint64_t v49 = *(void *)(a1 + *(int *)(v40 + 3024));
      uint64_t v50 = [v47 UUID];
      if (v49) {
        objc_msgSend(*(id *)(v49 + 8), "hk_appendBytesWithUUID:", v50);
      }

      if (v34)
      {
        double v51 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v61 quantity:v34 startDate:v37 endDate:v38 metadata:v67];
        uint64_t v52 = *(void *)(a1 + *(int *)(v40 + 3024));
        double v53 = [MEMORY[0x1E4F2B618] countUnit];
        [v34 doubleValueForUnit:v53];
        if (v52) {
          *(double *)(v52 + 136) = v54 + *(double *)(v52 + 136);
        }

        [v68 addObjectFromWatch:v51];
        uint64_t v55 = *(void *)(a1 + 264);
        uint64_t v56 = [v51 UUID];
        if (v55) {
          objc_msgSend(*(id *)(v55 + 8), "hk_appendBytesWithUUID:", v56);
        }

        unint64_t v40 = 0x1EBA09000;
      }
    }
    while (a3 != v36);

    id v16 = v59;
    id v15 = v60;
    id v24 = v57;
    id v17 = v58;
  }
}

void __132__HDDemoDataActivitySampleGenerator__generateWorkoutDataWithHeartRates_recoveryHeartRates_objectCollection_demoPerson_workoutState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 56);
  }
  else {
    id v5 = 0;
  }
  double v6 = (double)(unint64_t)(6 * a3);
  id v7 = a2;
  id v16 = [v5 dateByAddingTimeInterval:v6];
  id v8 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v9 = *(void *)(a1 + 40);
  [v7 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v8 quantityWithUnit:v9 doubleValue:v11];
  id v13 = [MEMORY[0x1E4F2B388] quantitySampleWithType:*(void *)(a1 + 48) quantity:v12 startDate:v16 endDate:v16 metadata:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) addObjectFromWatch:v13];
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = [v13 UUID];
  if (v14) {
    objc_msgSend(*(id *)(v14 + 8), "hk_appendBytesWithUUID:", v15);
  }
}

void __132__HDDemoDataActivitySampleGenerator__generateWorkoutDataWithHeartRates_recoveryHeartRates_objectCollection_demoPerson_workoutState___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 56);
  }
  else {
    id v5 = 0;
  }
  double v6 = (double)(unint64_t)(5 * a3 + 60 * *(void *)(a1 + 64));
  id v7 = a2;
  id v8 = [v5 dateByAddingTimeInterval:v6];
  uint64_t v9 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v10 = *(void *)(a1 + 40);
  [v7 doubleValue];
  double v12 = v11;

  id v13 = [v9 quantityWithUnit:v10 doubleValue:v12];
  uint64_t v14 = (void *)MEMORY[0x1E4F2B388];
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v18 = *MEMORY[0x1E4F2BB28];
  v19[0] = &unk_1F17ECA80;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v17 = [v14 quantitySampleWithType:v15 quantity:v13 startDate:v8 endDate:v8 metadata:v16];

  [*(id *)(a1 + 56) addObjectFromWatch:v17];
}

void __145__HDDemoDataActivitySampleGenerator__generateWorkoutDataForTypeIdentifier_unit_samples_objectCollection_demoPerson_sampleFrequency_workoutState___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 56);
  }
  else {
    id v5 = 0;
  }
  double v6 = *(double *)(a1 + 64) * (double)a3;
  id v7 = a2;
  id v16 = [v5 dateByAddingTimeInterval:v6];
  id v8 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v9 = *(void *)(a1 + 40);
  [v7 doubleValue];
  double v11 = v10;

  double v12 = [v8 quantityWithUnit:v9 doubleValue:v11];
  id v13 = [MEMORY[0x1E4F2B388] quantitySampleWithType:*(void *)(a1 + 48) quantity:v12 startDate:v16 endDate:v16];
  [*(id *)(a1 + 56) addObjectFromWatch:v13];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = [v13 UUID];
  if (v14) {
    objc_msgSend(*(id *)(v14 + 8), "hk_appendBytesWithUUID:", v15);
  }
}

- (double)_generateWorkoutDataSamplesForDemoPerson:(void *)a3 atTime:(void *)a4 sampleDate:(void *)a5 addFromWatch:(void *)a6 objectCollection:(double)a7 nextSampleTime:(double)a8 typeIdentifier:(double)a9 unit:(double)a10 sampleMean:(double)a11 sampleMeanStdDev:sampleFrequency:workoutState:
{
  id v21 = a2;
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  if (a7 >= a8)
  {
    a8 = a8 + a11;
    double v26 = [a1 demoDataGenerator];
    double v27 = [v26 firstSampleDate];
    uint64_t v28 = [v21 compare:v27];

    if (v28 != -1)
    {
      double v29 = [a1 demoDataGenerator];
      uint32_t v30 = [v29 statisticsSampleGenerator];
      [v30 computeNoiseFromTime:a7 stdDev:a10];
      double v32 = v31 + a9;

      uint64_t v33 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v23];
      id v34 = [MEMORY[0x1E4F2B370] quantityWithUnit:v24 doubleValue:v32];
      unint64_t v40 = (void *)v33;
      id v35 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v33 quantity:v34 startDate:v21 endDate:v21];
      [v22 addObjectFromWatch:v35];
      uint64_t v36 = [a1 demoDataGenerator];
      uint64_t v37 = [v36 generatorState];
      LODWORD(v33) = [v37 isExercising];

      if (v33)
      {
        uint64_t v38 = [v35 UUID];
        if (v25) {
          objc_msgSend(v25[1], "hk_appendBytesWithUUID:", v38);
        }
      }
    }
  }

  return a8;
}

- (double)_computeExerciseTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5
{
  uint64_t v7 = (uint64_t)a3;
  id v8 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  uint64_t v9 = [v8 statisticsSampleGenerator];
  [v9 computeStatisticalTimeFromCurrentTime:(double)(v7 + 10) mean:a4 stdDev:a5];
  double v11 = v10;

  return v11;
}

- (id)_computeFlightsClimbedForDemoPerson:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  id v8 = [v7 sleepSampleGenerator];
  int v9 = [v8 isDemoPersonAwake:v6 atTime:a4];

  if (v9
    && ([v6 flightsClimbedSampleFrequency],
        [(HDDemoDataActivitySampleGenerator *)self _isDemoPersonWalking:v6 atTime:a4 samplePeriod:v10]))
  {
    double v11 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    double v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    char v13 = [v11 isDemoDataTimeInWeekend:v12 calendar:a4];

    if (v13) {
      [v6 weekendSleepParameters];
    }
    else {
    uint64_t v15 = [v6 weekdaySleepParameters];
    }
    id v16 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    id v17 = [v16 sleepSampleGenerator];
    [v15 bedtime];
    double v19 = v18;
    [v6 bedtimeNoiseStdDev];
    [v17 computeSleepTimeFromCurrentTime:a4 mean:v19 stdDev:v20];
    double v22 = v21;

    id v23 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    id v24 = [v23 sleepSampleGenerator];
    [v15 wakeUpTime];
    double v26 = v25;
    [v6 wakeUpTimeNoiseStdDev];
    [v24 computeSleepTimeFromCurrentTime:a4 mean:v26 stdDev:v27];
    double v29 = v28;

    [v6 flightsClimbedSampleFrequency];
    double v31 = (v22 - v29) / v30 * 0.6;
    [v6 flightsClimbedDailyMean];
    double v33 = v32;
    id v34 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    id v35 = [v34 statisticsSampleGenerator];
    [v6 flightsClimbedStdDev];
    [v35 computeNoiseFromTime:a4 + 1.0 stdDev:v36];
    double v38 = (v33 + v37) / 2.5;

    double v39 = v38 / v31;
    unint64_t v40 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    uint64_t v41 = [v40 statisticsSampleGenerator];
    [v41 pseudoRandomDoubleFromTime:a4];
    double v43 = v42;

    if (v43 < v39)
    {
      uint64_t v44 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      double v45 = [v44 statisticsSampleGenerator];
      [v45 computeNoiseFromTime:a4 stdDev:1.0];
      double v47 = fabs(v46 + 2.5);

      uint64_t v14 = [NSNumber numberWithInteger:(uint64_t)v47];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (double)_computePercentCooledForDemoPerson:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  [v6 exerciseStopTime];
  double v8 = v7;
  [v6 exerciseStopTimeStdDev];
  [(HDDemoDataActivitySampleGenerator *)self _computeExerciseTimeFromCurrentTime:a4 mean:v8 stdDev:v9];
  double v11 = v10;
  [v6 exerciseCooldownTime];
  double v12 = a4 - (double)(uint64_t)a4;
  double v14 = v11 + v13;
  if (v12 <= v11 || v12 > v14)
  {
    id v16 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    id v17 = [v16 generatorState];
    int v18 = [v17 isExercising];

    if (v18) {
      double v21 = 0.0;
    }
    else {
      double v21 = 1.0;
    }
  }
  else
  {
    double v19 = v12 - v11;
    [v6 exerciseCooldownTime];
    double v21 = v19 / v20;
  }

  return v21;
}

- (BOOL)_isDemoPersonCoolingDown:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  double v7 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  double v8 = [v7 generatorState];
  int v9 = [v8 isExercising];

  if (v9)
  {
    [v6 exerciseStopTime];
    double v11 = v10;
    [v6 exerciseStopTimeStdDev];
    [(HDDemoDataActivitySampleGenerator *)self _computeExerciseTimeFromCurrentTime:a4 mean:v11 stdDev:v12];
    double v14 = v13;
    [v6 exerciseCooldownTime];
    double v15 = a4 - (double)(uint64_t)a4;
    BOOL v17 = v15 <= v14 + v16 && v15 > v14;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_isDemoPersonSedentary:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  double v7 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  double v8 = [v7 sleepSampleGenerator];
  int v9 = [v8 isDemoPersonAwake:v6 atTime:a4];

  if (!v9) {
    return 0;
  }
  double v10 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  double v11 = [v10 generatorState];
  char v12 = [v11 isExercising];

  if (v12) {
    return 0;
  }
  double v14 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  double v15 = [v14 statisticsSampleGenerator];
  [v15 computeNoiseFromTime:a4 stdDev:1.0];
  BOOL v13 = fabs(v16) >= 1.0;

  return v13;
}

- (BOOL)_isDemoPersonWalking:(id)a3 atTime:(double)a4 samplePeriod:(double)a5
{
  id v7 = a3;
  double v8 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  int v9 = [v8 sleepSampleGenerator];
  int v10 = [v9 isDemoPersonAwake:v7 atTime:a4];

  if (!v10) {
    return 0;
  }
  double v11 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  char v12 = [v11 generatorState];
  char v13 = [v12 isRunning];

  if (v13) {
    return 1;
  }
  double v15 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  double v16 = [v15 statisticsSampleGenerator];
  [v16 pseudoRandomDoubleFromTime:a4];
  double v18 = v17;

  return v18 < 0.6;
}

- (BOOL)_isDemoPersonInWorkoutRecovery:(id)a3 atTime:(double)a4
{
  return self->_nextHeartRateRecoveryStartTime <= a4 && self->_nextHeartRateRecoveryStopTime > a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutState, 0);
  objc_storeStrong((id *)&self->_currentWorkoutConfiguration, 0);
  objc_storeStrong((id *)&self->_lastActivityCache, 0);

  objc_storeStrong((id *)&self->_provenance, 0);
}

@end
@interface HDDemoDataGeneratorWorkoutConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)indoor;
- (HDDemoDataGeneratorWorkoutConfiguration)initWithCoder:(id)a3;
- (HDDemoDataGeneratorWorkoutConfiguration)initWithPrototype:(id)a3 currentDemoDataTime:(double)a4;
- (HKQuantity)goal;
- (double)distanceCrossCountrySkiingRateInMeters;
- (double)distanceCyclingRateInMiles;
- (double)distanceDownhillSnowSportsRateInMeters;
- (double)distancePaddleSportsRateInMeters;
- (double)distanceRowingRateInMeters;
- (double)distanceSkatingSportsRateInMeters;
- (double)distanceSwimmingRateInYards;
- (double)distanceSwimmingSegmentInYards;
- (double)distanceWalkingRateInMiles;
- (double)endTime;
- (double)kcalRate;
- (double)startTime;
- (double)swimmingRestSegmentTime;
- (double)swimmingSwimSegmentTime;
- (int64_t)numSwimmingSegments;
- (int64_t)swimmingNumLapsPerSegment;
- (int64_t)swimmingStrokeStyle;
- (unint64_t)activityType;
- (unint64_t)goalType;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityType:(unint64_t)a3;
- (void)setDistanceCrossCountrySkiingRateInMeters:(double)a3;
- (void)setDistanceCyclingRateInMiles:(double)a3;
- (void)setDistanceDownhillSnowSportsRateInMeters:(double)a3;
- (void)setDistancePaddleSportsRateInMeters:(double)a3;
- (void)setDistanceRowingRateInMeters:(double)a3;
- (void)setDistanceSkatingSportsRateInMeters:(double)a3;
- (void)setDistanceSwimmingRateInYards:(double)a3;
- (void)setDistanceSwimmingSegmentInYards:(double)a3;
- (void)setDistanceWalkingRateInMiles:(double)a3;
- (void)setEndTime:(double)a3;
- (void)setGoal:(id)a3;
- (void)setGoalType:(unint64_t)a3;
- (void)setIndoor:(BOOL)a3;
- (void)setKcalRate:(double)a3;
- (void)setNumSwimmingSegments:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setSwimmingNumLapsPerSegment:(int64_t)a3;
- (void)setSwimmingRestSegmentTime:(double)a3;
- (void)setSwimmingStrokeStyle:(int64_t)a3;
- (void)setSwimmingSwimSegmentTime:(double)a3;
@end

@implementation HDDemoDataGeneratorWorkoutConfiguration

- (HDDemoDataGeneratorWorkoutConfiguration)initWithPrototype:(id)a3 currentDemoDataTime:(double)a4
{
  id v6 = a3;
  v7 = [(HDDemoDataGeneratorWorkoutConfiguration *)self init];
  if (v7)
  {
    v7->_activityType = [v6 workoutActivityType];
    v7->_indoor = 0;
    v7->_goalType = [v6 goalType];
    uint64_t v8 = [v6 goal];
    goal = v7->_goal;
    v7->_goal = (HKQuantity *)v8;

    v7->_startTime = a4;
    [v6 duration];
    double v11 = v10 * 0.0000115740741;
    v7->_endTime = v10 * 0.0000115740741 + a4;
    [v6 totalEnergyBurnedInKcal];
    v7->_kcalRate = v12 / v11;
    [v6 totalDistanceCyclingInMiles];
    v7->_distanceCyclingRateInMiles = v13 / v11;
    [v6 totalDistanceWalkingInMiles];
    v7->_distanceWalkingRateInMiles = v14 / v11;
    [v6 totalDistanceCrossCountrySkiingInMeters];
    v7->_distanceCrossCountrySkiingRateInMeters = v15 / v11;
    [v6 totalDistanceRowingInMeters];
    v7->_distanceRowingRateInMeters = v16 / v11;
    [v6 totalDistanceRowingInMeters];
    v7->_distanceSkatingSportsRateInMeters = v17 / v11;
    [v6 totalDistancePaddleSportsInMeters];
    v7->_distancePaddleSportsRateInMeters = v18 / v11;
    [v6 totalDistanceDownhillSnowSportsInMeters];
    v7->_distanceDownhillSnowSportsRateInMeters = v19 / v11;
    [v6 swimmingSegmentDistanceInYards];
    v7->_distanceSwimmingSegmentInYards = v20;
    v7->_numSwimmingSegments = [v6 totalSwimmingSegments];
    v7->_swimmingNumLapsPerSegment = [v6 numLapsPerSegment];
    [v6 swimTimePerSegment];
    v7->_swimmingSwimSegmentTime = v21;
    [v6 restTimePerSegment];
    v7->_swimmingRestSegmentTime = v22;
    v7->_swimmingStrokeStyle = [v6 swimmingStrokeStyle];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDemoDataGeneratorWorkoutConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HDDemoDataGeneratorWorkoutConfiguration;
  v5 = [(HDDemoDataGeneratorWorkoutConfiguration *)&v28 init];
  id v6 = v5;
  if (v5)
  {
    v5->_createdFromNSKeyedUnarchiver = 1;
    v5->_activityType = [v4 decodeIntegerForKey:@"_WorkoutConfigurationActivityTypeKey"];
    v6->_indoor = [v4 decodeBoolForKey:@"_WorkoutConfigurationIndoorKey"];
    v6->_goalType = [v4 decodeIntegerForKey:@"_WorkoutConfigurationGoalTypeKey"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_WorkoutConfigurationGoalKey"];
    goal = v6->_goal;
    v6->_goal = (HKQuantity *)v7;

    [v4 decodeDoubleForKey:@"_WorkoutConfigurationStartTimeKey"];
    v6->_startTime = v9;
    [v4 decodeDoubleForKey:@"_WorkoutConfigurationEndTimeKey"];
    v6->_endTime = v10;
    [v4 decodeDoubleForKey:@"_WorkoutConfigurationKCalRateKey"];
    v6->_kcalRate = v11;
    [v4 decodeDoubleForKey:@"_WorkoutConfigurationDistanceWalkingRateMilesKey"];
    v6->_distanceWalkingRateInMiles = v12;
    [v4 decodeDoubleForKey:@"_WorkoutConfigurationDistanceCyclingRateMilesKey"];
    v6->_distanceCyclingRateInMiles = v13;
    [v4 decodeDoubleForKey:@"_WorkoutConfigurationDistanceSwimmingRateYardsKey"];
    v6->_distanceSwimmingRateInYards = v14;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationNumSwimmingSegmentsKey"]) {
      uint64_t v15 = [v4 decodeIntegerForKey:@"_WorkoutConfigurationNumSwimmingSegmentsKey"];
    }
    else {
      uint64_t v15 = 8;
    }
    v6->_numSwimmingSegments = v15;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationSwimmingSwimSegmentTimeKey"])objc_msgSend(v4, "decodeDoubleForKey:", @"_WorkoutConfigurationSwimmingSwimSegmentTimeKey"); {
    else
    }
      uint64_t v16 = 0x4066800000000000;
    *(void *)&v6->_swimmingSwimSegmentTime = v16;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationSwimmingRestSegmentTimeKey"])objc_msgSend(v4, "decodeDoubleForKey:", @"_WorkoutConfigurationSwimmingRestSegmentTimeKey"); {
    else
    }
      uint64_t v17 = 0x404E000000000000;
    *(void *)&v6->_swimmingRestSegmentTime = v17;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationSwimmingNumLapsPerSegmentKey"])uint64_t v18 = objc_msgSend(v4, "decodeIntegerForKey:", @"_WorkoutConfigurationSwimmingNumLapsPerSegmentKey"); {
    else
    }
      uint64_t v18 = 2;
    v6->_swimmingNumLapsPerSegment = v18;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationSwimmingStrokeStyleKey"]) {
      uint64_t v19 = [v4 decodeIntegerForKey:@"_WorkoutConfigurationSwimmingStrokeStyleKey"];
    }
    else {
      uint64_t v19 = 2;
    }
    v6->_swimmingStrokeStyle = v19;
    int v20 = [v4 containsValueForKey:@"_WorkoutConfigurationDistanceCrossCountrySkiingRateMetersKey"];
    uint64_t v21 = 0x40B8380000000000;
    uint64_t v22 = 0x40B8380000000000;
    if (v20) {
      objc_msgSend(v4, "decodeDoubleForKey:", @"_WorkoutConfigurationDistanceCrossCountrySkiingRateMetersKey", 6200.0);
    }
    *(void *)&v6->_distanceCrossCountrySkiingRateInMeters = v22;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationDistanceRowingRateMetersKey"])
    {
      [v4 decodeDoubleForKey:@"_WorkoutConfigurationDistanceRowingRateMetersKey"];
      uint64_t v21 = v23;
    }
    *(void *)&v6->_distanceRowingRateInMeters = v21;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationDistanceSkatingSportsRateMetersKey"])objc_msgSend(v4, "decodeDoubleForKey:", @"_WorkoutConfigurationDistanceSkatingSportsRateMetersKey"); {
    else
    }
      uint64_t v24 = 0x409C200000000000;
    *(void *)&v6->_distanceSkatingSportsRateInMeters = v24;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationDistancePaddleSportsRateMetersKey"])objc_msgSend(v4, "decodeDoubleForKey:", @"_WorkoutConfigurationDistancePaddleSportsRateMetersKey"); {
    else
    }
      uint64_t v25 = 0x4085E00000000000;
    *(void *)&v6->_distancePaddleSportsRateInMeters = v25;
    if ([v4 containsValueForKey:@"_WorkoutConfigurationDistanceDownhillSnowSportsRateMetersKey"])objc_msgSend(v4, "decodeDoubleForKey:", @"_WorkoutConfigurationDistanceDownhillSnowSportsRateMetersKey"); {
    else
    }
      uint64_t v26 = 0x40B8380000000000;
    *(void *)&v6->_distanceDownhillSnowSportsRateInMeters = v26;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activityType = self->_activityType;
  id v5 = a3;
  [v5 encodeInteger:activityType forKey:@"_WorkoutConfigurationActivityTypeKey"];
  [v5 encodeBool:self->_indoor forKey:@"_WorkoutConfigurationIndoorKey"];
  [v5 encodeInteger:self->_goalType forKey:@"_WorkoutConfigurationGoalTypeKey"];
  [v5 encodeObject:self->_goal forKey:@"_WorkoutConfigurationGoalKey"];
  [v5 encodeDouble:@"_WorkoutConfigurationStartTimeKey" forKey:self->_startTime];
  [v5 encodeDouble:@"_WorkoutConfigurationEndTimeKey" forKey:self->_endTime];
  [v5 encodeDouble:@"_WorkoutConfigurationKCalRateKey" forKey:self->_kcalRate];
  [v5 encodeDouble:@"_WorkoutConfigurationDistanceWalkingRateMilesKey" forKey:self->_distanceWalkingRateInMiles];
  [v5 encodeDouble:@"_WorkoutConfigurationDistanceCyclingRateMilesKey" forKey:self->_distanceCyclingRateInMiles];
  [v5 encodeDouble:@"_WorkoutConfigurationDistanceCrossCountrySkiingRateMetersKey" forKey:self->_distanceCrossCountrySkiingRateInMeters];
  [v5 encodeDouble:@"_WorkoutConfigurationDistanceRowingRateMetersKey" forKey:self->_distanceRowingRateInMeters];
  [v5 encodeDouble:@"_WorkoutConfigurationDistanceSkatingSportsRateMetersKey" forKey:self->_distanceSkatingSportsRateInMeters];
  [v5 encodeDouble:@"_WorkoutConfigurationDistancePaddleSportsRateMetersKey" forKey:self->_distancePaddleSportsRateInMeters];
  [v5 encodeDouble:@"_WorkoutConfigurationDistanceDownhillSnowSportsRateMetersKey" forKey:self->_distanceDownhillSnowSportsRateInMeters];
  [v5 encodeDouble:@"_WorkoutConfigurationDistanceSwimmingRateYardsKey" forKey:self->_distanceSwimmingRateInYards];
  [v5 encodeInteger:self->_numSwimmingSegments forKey:@"_WorkoutConfigurationNumSwimmingSegmentsKey"];
  [v5 encodeDouble:@"_WorkoutConfigurationSwimmingSwimSegmentTimeKey" forKey:self->_swimmingSwimSegmentTime];
  [v5 encodeDouble:@"_WorkoutConfigurationSwimmingRestSegmentTimeKey" forKey:self->_swimmingRestSegmentTime];
  [v5 encodeInteger:self->_swimmingNumLapsPerSegment forKey:@"_WorkoutConfigurationSwimmingNumLapsPerSegmentKey"];
  [v5 encodeInteger:self->_swimmingStrokeStyle forKey:@"_WorkoutConfigurationSwimmingStrokeStyleKey"];
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(unint64_t)a3
{
  self->_unint64_t activityType = a3;
}

- (BOOL)indoor
{
  return self->_indoor;
}

- (void)setIndoor:(BOOL)a3
{
  self->_indoor = a3;
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (void)setGoalType:(unint64_t)a3
{
  self->_goalType = a3;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (void)setGoal:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)kcalRate
{
  return self->_kcalRate;
}

- (void)setKcalRate:(double)a3
{
  self->_kcalRate = a3;
}

- (double)distanceWalkingRateInMiles
{
  return self->_distanceWalkingRateInMiles;
}

- (void)setDistanceWalkingRateInMiles:(double)a3
{
  self->_distanceWalkingRateInMiles = a3;
}

- (double)distanceCyclingRateInMiles
{
  return self->_distanceCyclingRateInMiles;
}

- (void)setDistanceCyclingRateInMiles:(double)a3
{
  self->_distanceCyclingRateInMiles = a3;
}

- (double)distanceCrossCountrySkiingRateInMeters
{
  return self->_distanceCrossCountrySkiingRateInMeters;
}

- (void)setDistanceCrossCountrySkiingRateInMeters:(double)a3
{
  self->_distanceCrossCountrySkiingRateInMeters = a3;
}

- (double)distanceRowingRateInMeters
{
  return self->_distanceRowingRateInMeters;
}

- (void)setDistanceRowingRateInMeters:(double)a3
{
  self->_distanceRowingRateInMeters = a3;
}

- (double)distanceSkatingSportsRateInMeters
{
  return self->_distanceSkatingSportsRateInMeters;
}

- (void)setDistanceSkatingSportsRateInMeters:(double)a3
{
  self->_distanceSkatingSportsRateInMeters = a3;
}

- (double)distancePaddleSportsRateInMeters
{
  return self->_distancePaddleSportsRateInMeters;
}

- (void)setDistancePaddleSportsRateInMeters:(double)a3
{
  self->_distancePaddleSportsRateInMeters = a3;
}

- (double)distanceDownhillSnowSportsRateInMeters
{
  return self->_distanceDownhillSnowSportsRateInMeters;
}

- (void)setDistanceDownhillSnowSportsRateInMeters:(double)a3
{
  self->_distanceDownhillSnowSportsRateInMeters = a3;
}

- (double)distanceSwimmingRateInYards
{
  return self->_distanceSwimmingRateInYards;
}

- (void)setDistanceSwimmingRateInYards:(double)a3
{
  self->_distanceSwimmingRateInYards = a3;
}

- (double)distanceSwimmingSegmentInYards
{
  return self->_distanceSwimmingSegmentInYards;
}

- (void)setDistanceSwimmingSegmentInYards:(double)a3
{
  self->_distanceSwimmingSegmentInYards = a3;
}

- (int64_t)numSwimmingSegments
{
  return self->_numSwimmingSegments;
}

- (void)setNumSwimmingSegments:(int64_t)a3
{
  self->_numSwimmingSegments = a3;
}

- (int64_t)swimmingNumLapsPerSegment
{
  return self->_swimmingNumLapsPerSegment;
}

- (void)setSwimmingNumLapsPerSegment:(int64_t)a3
{
  self->_swimmingNumLapsPerSegment = a3;
}

- (double)swimmingSwimSegmentTime
{
  return self->_swimmingSwimSegmentTime;
}

- (void)setSwimmingSwimSegmentTime:(double)a3
{
  self->_swimmingSwimSegmentTime = a3;
}

- (double)swimmingRestSegmentTime
{
  return self->_swimmingRestSegmentTime;
}

- (void)setSwimmingRestSegmentTime:(double)a3
{
  self->_swimmingRestSegmentTime = a3;
}

- (int64_t)swimmingStrokeStyle
{
  return self->_swimmingStrokeStyle;
}

- (void)setSwimmingStrokeStyle:(int64_t)a3
{
  self->_swimmingStrokeStyle = a3;
}

- (void).cxx_destruct
{
}

@end
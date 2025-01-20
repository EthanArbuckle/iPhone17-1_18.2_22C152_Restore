@interface HKWorkout
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)_validateObjects:(id)a3 forClass:(Class)a4 error:(id *)a5;
+ (BOOL)_workoutWithActivityType:(unint64_t)a3 acceptsSubActivityType:(unint64_t)a4;
+ (BOOL)supportsSecureCoding;
+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate duration:(NSTimeInterval)duration totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance device:(HKDevice *)device metadata:(NSDictionary *)metadata;
+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate duration:(NSTimeInterval)duration totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance metadata:(NSDictionary *)metadata;
+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance device:(HKDevice *)device metadata:(NSDictionary *)metadata;
+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance metadata:(NSDictionary *)metadata;
+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance totalFlightsClimbed:(HKQuantity *)totalFlightsClimbed device:(HKDevice *)device metadata:(NSDictionary *)metadata;
+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance totalSwimmingStrokeCount:(HKQuantity *)totalSwimmingStrokeCount device:(HKDevice *)device metadata:(NSDictionary *)metadata;
+ (id)_activityTypeMappings;
+ (id)_allWorkoutActivityTypes;
+ (id)_allWorkoutTypeNames;
+ (id)_statisticsFromTotalActiveEnergyBurned:(id)a3 totalBasalEnergyBurned:(id)a4 totalDistance:(id)a5 totalSwimmingStrokeCount:(id)a6 totalFlightsClimbed:(id)a7 workoutActivityType:(unint64_t)a8 startDate:(id)a9 endDate:(id)a10;
+ (id)_stringFromWorkoutActivityType:(unint64_t)a3;
+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5;
+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 duration:(double)a7 totalActiveEnergyBurned:(id)a8 totalBasalEnergyBurned:(id)a9 totalDistance:(id)a10 goalType:(unint64_t)a11 goal:(id)a12 device:(id)a13 metadata:(id)a14;
+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 totalEnergyBurned:(id)a7 totalDistance:(id)a8 device:(id)a9 metadata:(id)a10;
+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 workoutActivities:(id)a7 duration:(double)a8 statistics:(id)a9 goalType:(unint64_t)a10 goal:(id)a11 device:(id)a12 metadata:(id)a13;
+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 workoutActivities:(id)a7 duration:(double)a8 totalActiveEnergyBurned:(id)a9 totalBasalEnergyBurned:(id)a10 totalDistance:(id)a11 totalSwimmingStrokeCount:(id)a12 totalFlightsClimbed:(id)a13 goalType:(unint64_t)a14 goal:(id)a15 device:(id)a16 metadata:(id)a17;
+ (unint64_t)_workoutActivityTypeFromString:(id)a3;
- (BOOL)_isWatchWorkout;
- (BOOL)acceptsAssociationWithObject:(id)a3;
- (HKQuantity)_goal;
- (HKQuantity)_totalBasalEnergyBurned;
- (HKQuantity)totalDistance;
- (HKQuantity)totalEnergyBurned;
- (HKQuantity)totalFlightsClimbed;
- (HKQuantity)totalSwimmingStrokeCount;
- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType;
- (HKWorkout)initWithCoder:(id)a3;
- (HKWorkoutActivity)_primaryActivity;
- (HKWorkoutActivityType)workoutActivityType;
- (NSArray)_subActivities;
- (NSArray)workoutActivities;
- (NSArray)workoutEvents;
- (NSDictionary)_zonesByType;
- (NSDictionary)allStatistics;
- (NSString)description;
- (NSTimeInterval)duration;
- (double)_goalInCanonicalUnit;
- (double)_totalBasalEnergyBurnedInCanonicalUnit;
- (double)_totalDistanceInCanonicalUnit;
- (double)_totalDistanceIncludingAllTypesForUnit:(id)a3;
- (double)_totalEnergyBurnedInCanonicalUnit;
- (double)_totalFlightsClimbedInCanonicalUnit;
- (double)_totalSwimmingStrokeCountInCanonicalUnit;
- (id)_deepCopy;
- (id)_detailedDescriptionComponents;
- (id)_detailedDescriptionString;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)_validateWorkoutActivities:(id)a3 withConfiguration:(HKObjectValidationConfiguration)a4;
- (id)_validateWorkoutEvents:(id)a3 withConfiguration:(HKObjectValidationConfiguration)a4;
- (id)subObjectFromUUID:(id)a3;
- (id)zonesForType:(id)a3;
- (int64_t)_activityMoveMode;
- (unint64_t)_goalType;
- (void)_enumerateActiveTimePeriods:(id)a3;
- (void)_enumerateTimePeriodsWithBlock:(id)a3;
- (void)_setDuration:(double)a3;
- (void)_setGoal:(id)a3;
- (void)_setGoalType:(unint64_t)a3;
- (void)_setIsWatchWorkout:(BOOL)a3;
- (void)_setPrimaryActivity:(id)a3;
- (void)_setSubActivities:(id)a3;
- (void)_setTotalBasalEnergyBurned:(id)a3;
- (void)_setTotalDistance:(id)a3;
- (void)_setTotalEnergyBurned:(id)a3;
- (void)_setTotalFlightsClimbed:(id)a3;
- (void)_setTotalSwimmingStrokeCount:(id)a3;
- (void)_setUUID:(id)a3;
- (void)_setWorkoutActivityType:(unint64_t)a3;
- (void)_setWorkoutEvents:(id)a3;
- (void)_setZonesByType:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkout

- (void)_setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)_setTotalEnergyBurned:(id)a3
{
  id v4 = a3;
  id v8 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierActiveEnergyBurned"];
  v5 = [(HKSample *)self startDate];
  v6 = [(HKSample *)self endDate];
  v7 = _HKStatisticsForTotal(v8, v4, v5, v6);

  [(HKWorkoutActivity *)self->_primaryActivity _setStatistics:v7 forType:v8];
}

- (void)_setTotalBasalEnergyBurned:(id)a3
{
  id v4 = a3;
  id v8 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierBasalEnergyBurned"];
  v5 = [(HKSample *)self startDate];
  v6 = [(HKSample *)self endDate];
  v7 = _HKStatisticsForTotal(v8, v4, v5, v6);

  [(HKWorkoutActivity *)self->_primaryActivity _setStatistics:v7 forType:v8];
}

- (void)_setTotalDistance:(id)a3
{
  id v8 = a3;
  id v4 = _HKWorkoutDistanceTypeForActivityType([(HKWorkout *)self workoutActivityType]);
  if (v4)
  {
    v5 = [(HKSample *)self startDate];
    v6 = [(HKSample *)self endDate];
    v7 = _HKStatisticsForTotal(v4, v8, v5, v6);

    [(HKWorkoutActivity *)self->_primaryActivity _setStatistics:v7 forType:v4];
  }
}

- (void)_setWorkoutActivityType:(unint64_t)a3
{
  self->_workoutActivityType = a3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkout;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_workoutActivityType, @"workoutActivityType", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"duration" forKey:self->_duration];
  [v4 encodeInteger:self->_goalType forKey:@"goalType"];
  [v4 encodeObject:self->_goal forKey:@"goal"];
  [v4 encodeObject:self->_workoutEvents forKey:@"workoutEvents"];
  [v4 encodeObject:self->_subActivities forKey:@"subActivities"];
  [v4 encodeObject:self->_primaryActivity forKey:@"primaryActivity"];
  [v4 encodeObject:self->_zonesByType forKey:@"zonesByType"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonesByType, 0);
  objc_storeStrong((id *)&self->_subActivities, 0);
  objc_storeStrong((id *)&self->_primaryActivity, 0);
  objc_storeStrong((id *)&self->_goal, 0);

  objc_storeStrong((id *)&self->_workoutEvents, 0);
}

- (HKWorkoutActivityType)workoutActivityType
{
  if (HKProgramSDKAtLeast()) {
    return self->_workoutActivityType;
  }
  if (HKProgramSDKAtLeast())
  {
    HKWorkoutActivityType workoutActivityType = self->_workoutActivityType;
    BOOL v5 = workoutActivityType == HKWorkoutActivityTypeUnderwaterDiving;
LABEL_7:
    HKWorkoutActivityType v6 = HKWorkoutActivityTypeOther;
LABEL_8:
    if (v5) {
      return v6;
    }
    else {
      return workoutActivityType;
    }
  }
  if (HKProgramSDKAtLeast())
  {
    HKWorkoutActivityType workoutActivityType = self->_workoutActivityType;
    BOOL v5 = (workoutActivityType & 0xFFFFFFFFFFFFFFFELL) == 82;
    goto LABEL_7;
  }
  if (HKProgramSDKAtLeast())
  {
    HKWorkoutActivityType v7 = self->_workoutActivityType;
    BOOL v8 = v7 - 77 >= 4;
  }
  else
  {
    if (!HKProgramSDKAtLeast())
    {
      int v9 = HKProgramSDKAtLeast();
      HKWorkoutActivityType workoutActivityType = self->_workoutActivityType;
      HKWorkoutActivityType v6 = HKWorkoutActivityTypeOther;
      if (workoutActivityType - 58 >= 0xE) {
        HKWorkoutActivityType v6 = self->_workoutActivityType;
      }
      if (workoutActivityType - 72 < 3) {
        HKWorkoutActivityType workoutActivityType = HKWorkoutActivityTypeOther;
      }
      BOOL v5 = v9 == 0;
      goto LABEL_8;
    }
    HKWorkoutActivityType v7 = self->_workoutActivityType;
    BOOL v8 = v7 - 75 >= 2;
  }
  if (v8) {
    return v7;
  }
  else {
    return 3000;
  }
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (HKQuantity)totalEnergyBurned
{
  v3 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierActiveEnergyBurned"];
  id v4 = [(HKWorkoutActivity *)self->_primaryActivity statisticsForType:v3];
  BOOL v5 = [v4 sumQuantity];

  return (HKQuantity *)v5;
}

- (HKQuantity)_totalBasalEnergyBurned
{
  v3 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierBasalEnergyBurned"];
  id v4 = [(HKWorkoutActivity *)self->_primaryActivity statisticsForType:v3];
  BOOL v5 = [v4 sumQuantity];

  return (HKQuantity *)v5;
}

- (HKQuantity)totalDistance
{
  v3 = _HKWorkoutDistanceTypeForActivityType([(HKWorkout *)self workoutActivityType]);
  if (v3)
  {
    id v4 = [(HKWorkoutActivity *)self->_primaryActivity statisticsForType:v3];
    BOOL v5 = [v4 sumQuantity];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (HKQuantity *)v5;
}

- (unint64_t)_goalType
{
  return self->_goalType;
}

- (HKQuantity)_goal
{
  return self->_goal;
}

- (BOOL)_isWatchWorkout
{
  return self->_isWatchWorkout;
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 duration:(double)a7 totalActiveEnergyBurned:(id)a8 totalBasalEnergyBurned:(id)a9 totalDistance:(id)a10 goalType:(unint64_t)a11 goal:(id)a12 device:(id)a13 metadata:(id)a14
{
  return (id)[a1 _workoutWithActivityType:a3 startDate:a4 endDate:a5 workoutEvents:a6 workoutActivities:0 duration:a8 totalActiveEnergyBurned:a7 totalBasalEnergyBurned:a9 totalDistance:a10 totalSwimmingStrokeCount:0 totalFlightsClimbed:0 goalType:a11 goal:a12 device:a13 metadata:a14];
}

- (void)_setIsWatchWorkout:(BOOL)a3
{
  self->_isWatchWorkout = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkout)initWithCoder:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)HKWorkout;
  BOOL v5 = [(HKSample *)&v50 initWithCoder:v4];
  if (v5)
  {
    v5->_uint64_t workoutActivityType = [v4 decodeIntegerForKey:@"workoutActivityType"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_double duration = v6;
    v5->_goalType = [v4 decodeIntegerForKey:@"goalType"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"goal"];
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v7;

    int v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"workoutEvents"];
    workoutEvents = v5->_workoutEvents;
    v5->_workoutEvents = (NSArray *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"subActivities"];
    subActivities = v5->_subActivities;
    v5->_subActivities = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryActivity"];
    primaryActivity = v5->_primaryActivity;
    v5->_primaryActivity = (HKWorkoutActivity *)v19;

    if (!v5->_primaryActivity)
    {
      uint64_t workoutActivityType = v5->_workoutActivityType;
      v22 = [(HKObject *)v5 metadata];
      v47 = _HKWorkoutConfigurationWithActivityTypeAndMetadata(workoutActivityType, v22);

      v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalEnergyBurned"];
      v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalBasalEnergyBurned"];
      v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDistance"];
      v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalSwimmingStrokeCount"];
      v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalFlightsClimbed"];
      v23 = objc_opt_class();
      unint64_t v24 = v5->_workoutActivityType;
      v25 = [(HKSample *)v5 startDate];
      v26 = [(HKSample *)v5 endDate];
      v27 = [v23 _statisticsFromTotalActiveEnergyBurned:v49 totalBasalEnergyBurned:v48 totalDistance:v46 totalSwimmingStrokeCount:v45 totalFlightsClimbed:v44 workoutActivityType:v24 startDate:v25 endDate:v26];

      v28 = [HKWorkoutActivity alloc];
      v29 = [(HKObject *)v5 UUID];
      v30 = [(HKSample *)v5 startDate];
      v31 = [(HKSample *)v5 endDate];
      v32 = v5->_workoutEvents;
      double duration = v5->_duration;
      v34 = [(HKObject *)v5 metadata];
      uint64_t v35 = [(HKWorkoutActivity *)v28 _initWithUUID:v29 workoutConfiguration:v47 startDate:v30 endDate:v31 workoutEvents:v32 startsPaused:0 duration:duration metadata:v34 statisticsPerType:v27];
      v36 = v5->_primaryActivity;
      v5->_primaryActivity = (HKWorkoutActivity *)v35;
    }
    v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    v40 = objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"zonesByType"];
    zonesByType = v5->_zonesByType;
    v5->_zonesByType = (NSDictionary *)v41;
  }
  return v5;
}

- (HKQuantity)totalSwimmingStrokeCount
{
  v3 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierSwimmingStrokeCount"];
  id v4 = [(HKWorkoutActivity *)self->_primaryActivity statisticsForType:v3];
  BOOL v5 = [v4 sumQuantity];

  return (HKQuantity *)v5;
}

- (HKQuantity)totalFlightsClimbed
{
  v3 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierFlightsClimbed"];
  id v4 = [(HKWorkoutActivity *)self->_primaryActivity statisticsForType:v3];
  BOOL v5 = [v4 sumQuantity];

  return (HKQuantity *)v5;
}

- (NSArray)workoutEvents
{
  int v3 = HKProgramSDKAtLeast();
  workoutEvents = self->_workoutEvents;
  if (v3)
  {
    BOOL v5 = workoutEvents;
  }
  else
  {
    double v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_612];
    BOOL v5 = [(NSArray *)workoutEvents filteredArrayUsingPredicate:v6];
  }

  return v5;
}

- (void)_enumerateTimePeriodsWithBlock:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = 0;
  v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  double v6 = [(HKWorkout *)self workoutEvents];
  BOOL v7 = [v6 count] == 0;

  if (v7)
  {
    BOOL v8 = [(HKSample *)self startDate];
    int v9 = [(HKSample *)self endDate];
    [(HKWorkout *)self duration];
    double v11 = v10;
    [v9 timeIntervalSinceDate:v8];
    double v13 = v12;
    if (v11 <= 0.00000011920929 || v12 - v11 <= 0.00000011920929)
    {
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
      [v5 addObject:v16];
      double v11 = v13;
      uint64_t v15 = v9;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F1C9C8];
      [(HKWorkout *)self duration];
      uint64_t v15 = objc_msgSend(v14, "dateWithTimeInterval:sinceDate:", v8);

      v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v15];
      [v5 addObject:v16];
    }

    v33[3] = v11;
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __74__HKWorkout_HKWorkoutDataSourceUtilities___enumerateTimePeriodsWithBlock___block_invoke;
    v29[3] = &unk_1E58C4028;
    id v30 = v5;
    v31 = &v32;
    [(HKWorkout *)self _enumerateActiveTimePeriods:v29];
    BOOL v8 = v30;
  }

  [(HKWorkout *)self duration];
  if (v17 - v33[3] <= 0.1)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v5;
    uint64_t v22 = [v18 countByEnumeratingWithState:&v25 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v18);
          }
          v4[2](v4, *(void *)(*((void *)&v25 + 1) + 8 * i));
        }
        uint64_t v22 = [v18 countByEnumeratingWithState:&v25 objects:v36 count:16];
      }
      while (v22);
    }
  }
  else
  {
    id v18 = [(HKSample *)self endDate];
    [(HKWorkout *)self duration];
    v20 = [v18 dateByAddingTimeInterval:-v19];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v20 endDate:v18];
    ((void (**)(id, void *))v4)[2](v4, v21);
  }
  _Block_object_dispose(&v32, 8);
}

double __74__HKWorkout_HKWorkoutDataSourceUtilities___enumerateTimePeriodsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  double v6 = (objc_class *)MEMORY[0x1E4F28C18];
  id v7 = a3;
  id v8 = a2;
  int v9 = (void *)[[v6 alloc] initWithStartDate:v8 endDate:v7];
  [v5 addObject:v9];

  [v7 timeIntervalSinceDate:v8];
  double v11 = v10;

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v11 + *(double *)(v12 + 24);
  *(double *)(v12 + 24) = result;
  return result;
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return (HKWorkout *)[a1 workoutWithActivityType:workoutActivityType startDate:startDate endDate:endDate workoutEvents:0 totalEnergyBurned:0 totalDistance:0 device:0 metadata:0];
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)[a1 workoutWithActivityType:workoutActivityType startDate:startDate endDate:endDate workoutEvents:workoutEvents totalEnergyBurned:totalEnergyBurned totalDistance:totalDistance device:0 metadata:metadata];
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate duration:(NSTimeInterval)duration totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)[a1 workoutWithActivityType:workoutActivityType startDate:startDate endDate:endDate duration:totalEnergyBurned totalEnergyBurned:totalDistance totalDistance:0 device:duration metadata:metadata];
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate duration:(NSTimeInterval)duration totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)[a1 _workoutWithActivityType:workoutActivityType startDate:startDate endDate:endDate workoutEvents:0 workoutActivities:0 duration:totalEnergyBurned totalActiveEnergyBurned:duration totalBasalEnergyBurned:0 totalDistance:totalDistance totalSwimmingStrokeCount:0 totalFlightsClimbed:0 goalType:0 goal:0 device:device metadata:metadata];
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)[a1 _workoutWithActivityType:workoutActivityType startDate:startDate endDate:endDate workoutEvents:workoutEvents workoutActivities:0 duration:totalEnergyBurned totalActiveEnergyBurned:0.0 totalBasalEnergyBurned:0 totalDistance:totalDistance totalSwimmingStrokeCount:0 totalFlightsClimbed:0 goalType:0 goal:0 device:device metadata:metadata];
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance totalSwimmingStrokeCount:(HKQuantity *)totalSwimmingStrokeCount device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)[a1 _workoutWithActivityType:workoutActivityType startDate:startDate endDate:endDate workoutEvents:workoutEvents workoutActivities:0 duration:totalEnergyBurned totalActiveEnergyBurned:0.0 totalBasalEnergyBurned:0 totalDistance:totalDistance totalSwimmingStrokeCount:totalSwimmingStrokeCount totalFlightsClimbed:0 goalType:0 goal:0 device:device metadata:metadata];
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance totalFlightsClimbed:(HKQuantity *)totalFlightsClimbed device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)[a1 _workoutWithActivityType:workoutActivityType startDate:startDate endDate:endDate workoutEvents:workoutEvents workoutActivities:0 duration:totalEnergyBurned totalActiveEnergyBurned:0.0 totalBasalEnergyBurned:0 totalDistance:totalDistance totalSwimmingStrokeCount:0 totalFlightsClimbed:totalFlightsClimbed goalType:0 goal:0 device:device metadata:metadata];
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5
{
  return (id)[a1 _workoutWithActivityType:a3 startDate:a4 endDate:a5 workoutEvents:0 totalEnergyBurned:0 totalDistance:0 device:0 metadata:0];
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 totalEnergyBurned:(id)a7 totalDistance:(id)a8 device:(id)a9 metadata:(id)a10
{
  return (id)[a1 _workoutWithActivityType:a3 startDate:a4 endDate:a5 workoutEvents:a6 duration:a7 totalActiveEnergyBurned:0 totalBasalEnergyBurned:0.0 totalDistance:a8 goalType:0 goal:0 device:a9 metadata:a10];
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 workoutActivities:(id)a7 duration:(double)a8 totalActiveEnergyBurned:(id)a9 totalBasalEnergyBurned:(id)a10 totalDistance:(id)a11 totalSwimmingStrokeCount:(id)a12 totalFlightsClimbed:(id)a13 goalType:(unint64_t)a14 goal:(id)a15 device:(id)a16 metadata:(id)a17
{
  id v24 = a17;
  id v25 = a16;
  id v26 = a15;
  id v27 = a7;
  id v28 = a6;
  id v29 = a5;
  id v30 = a4;
  v31 = [a1 _statisticsFromTotalActiveEnergyBurned:a9 totalBasalEnergyBurned:a10 totalDistance:a11 totalSwimmingStrokeCount:a12 totalFlightsClimbed:a13 workoutActivityType:a3 startDate:v30 endDate:v29];
  uint64_t v32 = [a1 _workoutWithActivityType:a3 startDate:v30 endDate:v29 workoutEvents:v28 workoutActivities:v27 duration:v31 statistics:a8 goalType:a14 goal:v26 device:v25 metadata:v24];

  return v32;
}

+ (id)_statisticsFromTotalActiveEnergyBurned:(id)a3 totalBasalEnergyBurned:(id)a4 totalDistance:(id)a5 totalSwimmingStrokeCount:(id)a6 totalFlightsClimbed:(id)a7 workoutActivityType:(unint64_t)a8 startDate:(id)a9 endDate:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v22 = &off_1E58BA000;
  if (v14)
  {
    uint64_t v23 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierActiveEnergyBurned"];
    id v24 = _HKStatisticsForTotal(v23, v14, v19, v20);
    [v21 setObject:v24 forKeyedSubscript:v23];

    uint64_t v22 = &off_1E58BA000;
  }
  if (v15)
  {
    id v25 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierBasalEnergyBurned"];
    id v26 = _HKStatisticsForTotal(v25, v15, v19, v20);
    [v21 setObject:v26 forKeyedSubscript:v25];

    uint64_t v22 = &off_1E58BA000;
  }
  if (v16)
  {
    id v27 = _HKWorkoutDistanceTypeForActivityType(a8);
    id v28 = v27;
    if (v27)
    {
      id v29 = _HKStatisticsForTotal(v27, v16, v19, v20);
      [v21 setObject:v29 forKeyedSubscript:v28];

      uint64_t v22 = &off_1E58BA000;
    }
  }
  if (v17)
  {
    id v30 = [v22[459] quantityTypeForIdentifier:@"HKQuantityTypeIdentifierSwimmingStrokeCount"];
    v31 = _HKStatisticsForTotal(v30, v17, v19, v20);
    [v21 setObject:v31 forKeyedSubscript:v30];

    uint64_t v22 = &off_1E58BA000;
  }
  if (v18)
  {
    uint64_t v32 = [v22[459] quantityTypeForIdentifier:@"HKQuantityTypeIdentifierFlightsClimbed"];
    v33 = _HKStatisticsForTotal(v32, v18, v19, v20);
    [v21 setObject:v33 forKeyedSubscript:v32];
  }

  return v21;
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 workoutActivities:(id)a7 duration:(double)a8 statistics:(id)a9 goalType:(unint64_t)a10 goal:(id)a11 device:(id)a12 metadata:(id)a13
{
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a11;
  id v41 = a12;
  id v24 = a13;
  id v25 = +[HKObjectType workoutType];
  if (v18)
  {
    [v18 timeIntervalSinceReferenceDate];
    double v27 = v26;
    if (v19)
    {
LABEL_3:
      [v19 timeIntervalSinceReferenceDate];
      double v29 = v28;
      goto LABEL_6;
    }
  }
  else
  {
    double v27 = 2.22507386e-308;
    if (v19) {
      goto LABEL_3;
    }
  }
  double v29 = 2.22507386e-308;
LABEL_6:
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __138__HKWorkout__workoutWithActivityType_startDate_endDate_workoutEvents_workoutActivities_duration_statistics_goalType_goal_device_metadata___block_invoke;
  v42[3] = &unk_1E58C8798;
  double v51 = a8;
  id v43 = v20;
  id v44 = v18;
  id v45 = v19;
  id v46 = v21;
  id v47 = v24;
  id v48 = v22;
  unint64_t v52 = a10;
  id v49 = v23;
  unint64_t v50 = a3;
  id v30 = v23;
  id v31 = v22;
  id v32 = v24;
  id v33 = v21;
  id v34 = v19;
  id v35 = v18;
  id v36 = v20;
  uint64_t v37 = (void *)[a1 _newSampleWithType:v25 startDate:v41 endDate:v32 device:v42 metadata:v27 config:v29];

  return v37;
}

void __138__HKWorkout__workoutWithActivityType_startDate_endDate_workoutEvents_workoutActivities_duration_statistics_goalType_goal_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  v3[12] = *(id *)(a1 + 88);
  id v4 = &OBJC_IVAR___HKWristDetectionSettingManager__observers;
  if ([*(id *)(a1 + 32) count])
  {
    id v5 = [*(id *)(a1 + 32) sortedArrayUsingComparator:&__block_literal_global_123];
    double v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      uint64_t v11 = 2;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          double v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v14 = [v13 type];
          if ((unint64_t)(v11 - 1) > 1 || v11 != v14)
          {
            uint64_t v11 = [v13 type];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v9);
    }

    id v4 = &OBJC_IVAR___HKWristDetectionSettingManager__observers;
    objc_storeStrong(v3 + 14, v6);
  }
  else
  {
    double v6 = 0;
  }
  double v15 = *(double *)(a1 + 96);
  if (v15 <= 0.0) {
    double v15 = _HKCalculateWorkoutDuration(*(void **)(a1 + 40), *(void **)(a1 + 48), v3[14]);
  }
  *((double *)v3 + 13) = v15;
  if ([v6 count] && objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = *(id *)(a1 + 56);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copy];
          [v22 _filterAndSetWorkoutEvents:v6];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v19);
    }

    id v23 = v3[19];
    v3[19] = v16;
    id v4 = &OBJC_IVAR___HKWristDetectionSettingManager__observers;
  }
  else
  {
    uint64_t v24 = [*(id *)(a1 + 56) copy];
    id v23 = v3[19];
    v3[19] = (id)v24;
  }

  id v25 = _HKWorkoutConfigurationWithActivityTypeAndMetadata(*(void *)(a1 + 88), *(void **)(a1 + 64));
  double v26 = [HKWorkoutActivity alloc];
  double v27 = [v3 UUID];
  uint64_t v28 = [(HKWorkoutActivity *)v26 _initWithUUID:v27 workoutConfiguration:v25 startDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) workoutEvents:*(id *)((char *)v3 + v4[629]) startsPaused:0 duration:*((double *)v3 + 13) metadata:0 statisticsPerType:*(void *)(a1 + 72)];
  id v29 = v3[18];
  v3[18] = (id)v28;

  v3[15] = *(id *)(a1 + 104);
  objc_storeStrong(v3 + 16, *(id *)(a1 + 80));
}

uint64_t __138__HKWorkout__workoutWithActivityType_startDate_endDate_workoutEvents_workoutActivities_duration_statistics_goalType_goal_device_metadata___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateInterval];
  double v6 = [v5 startDate];
  id v7 = [v4 dateInterval];

  uint64_t v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)_deepCopy
{
  id v25 = [(NSArray *)self->_subActivities hk_map:&__block_literal_global_101_0];
  int v3 = objc_opt_class();
  unint64_t workoutActivityType = self->_workoutActivityType;
  uint64_t v24 = [(HKSample *)self startDate];
  id v5 = (void *)[v24 copy];
  id v23 = [(HKSample *)self endDate];
  id v22 = (void *)[v23 copy];
  uint64_t v20 = (void *)[(NSArray *)self->_workoutEvents copy];
  double duration = self->_duration;
  uint64_t v19 = [(HKWorkoutActivity *)self->_primaryActivity allStatistics];
  unint64_t v7 = [(HKWorkout *)self _goalType];
  uint64_t v8 = (void *)[(HKQuantity *)self->_goal copy];
  uint64_t v9 = [(HKObject *)self device];
  uint64_t v10 = (void *)[v9 copy];
  uint64_t v11 = [(HKObject *)self metadata];
  uint64_t v12 = (void *)[v11 copy];
  id v21 = [v3 _workoutWithActivityType:workoutActivityType startDate:v5 endDate:v22 workoutEvents:v20 workoutActivities:v25 duration:v19 statistics:duration goalType:v7 goal:v8 device:v10 metadata:v12];

  double v13 = [(HKObject *)self sourceRevision];
  uint64_t v14 = (void *)[v13 copy];
  [v21 _setSourceRevision:v14];

  double v15 = [(HKWorkout *)self _primaryActivity];
  id v16 = [v15 _deepCopy];
  [v21 _setPrimaryActivity:v16];

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_zonesByType copyItems:1];
  [v21 _setZonesByType:v17];

  return v21;
}

uint64_t __22__HKWorkout__deepCopy__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _deepCopy];
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

+ (id)_activityTypeMappings
{
  return &unk_1EECE65B8;
}

+ (id)_stringFromWorkoutActivityType:(unint64_t)a3
{
  id v4 = [a1 _activityTypeMappings];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__HKWorkout__stringFromWorkoutActivityType___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B32__0__NSString_8__NSNumber_16_B24l;
  v8[4] = a3;
  id v5 = [v4 keysOfEntriesPassingTest:v8];

  double v6 = [v5 anyObject];

  return v6;
}

BOOL __44__HKWorkout__stringFromWorkoutActivityType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 unsignedIntegerValue] == *(void *)(a1 + 32);
}

+ (unint64_t)_workoutActivityTypeFromString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _activityTypeMappings];
  double v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (id)_allWorkoutTypeNames
{
  v2 = [a1 _activityTypeMappings];
  int v3 = [v2 allKeys];

  return v3;
}

+ (id)_allWorkoutActivityTypes
{
  v2 = [a1 _activityTypeMappings];
  int v3 = [v2 allValues];

  return v3;
}

- (NSString)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t workoutActivityType = self->_workoutActivityType;
  v9.receiver = self;
  v9.super_class = (Class)HKWorkout;
  double v6 = [(HKSample *)&v9 description];
  unint64_t v7 = [v3 stringWithFormat:@"<%@> (%ld) %@", v4, workoutActivityType, v6];

  return (NSString *)v7;
}

- (id)_detailedDescriptionComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = NSString;
  id v5 = _HKWorkoutActivityNameForActivityType(self->_workoutActivityType);
  double v6 = [v4 stringWithFormat:@"activity=%@", v5];
  [v3 addObject:v6];

  unint64_t v7 = NSString;
  uint64_t v8 = [(HKSample *)self startDate];
  objc_super v9 = [v7 stringWithFormat:@"startDate=%@", v8];
  [v3 addObject:v9];

  uint64_t v10 = NSString;
  uint64_t v11 = [(HKSample *)self endDate];
  uint64_t v12 = [v10 stringWithFormat:@"endDate=%@", v11];
  [v3 addObject:v12];

  double v13 = NSString;
  [(HKWorkout *)self duration];
  double v15 = objc_msgSend(v13, "stringWithFormat:", @"duration=%f", v14);
  [v3 addObject:v15];

  id v16 = [(HKWorkout *)self allStatistics];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __43__HKWorkout__detailedDescriptionComponents__block_invoke;
  id v25 = &unk_1E58C8800;
  id v17 = v3;
  id v26 = v17;
  [v16 enumerateKeysAndObjectsUsingBlock:&v22];

  uint64_t v18 = NSString;
  uint64_t v19 = [(HKObject *)self metadata];
  uint64_t v20 = [v18 stringWithFormat:@"metadata=%@", v19, v22, v23, v24, v25];
  [v17 addObject:v20];

  return v17;
}

void __43__HKWorkout__detailedDescriptionComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  uint64_t v6 = [v18 aggregationStyle];
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (v6)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v14 = NSString;
      uint64_t v10 = [v18 identifier];
      [v14 stringWithFormat:@"%@=<Statistic output not set>", v10];
      goto LABEL_8;
    }
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = NSString;
    uint64_t v10 = [v18 identifier];
    uint64_t v13 = [v5 sumQuantity];
    goto LABEL_11;
  }
  uint64_t v7 = [v18 code];
  if (v7 != 277)
  {
    if (v7 == 269)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      objc_super v9 = NSString;
      uint64_t v10 = [v5 maximumQuantity];
      [v9 stringWithFormat:@"max_underwaterDepth=%@", v10];
      double v15 = LABEL_8:;
      [v8 addObject:v15];
      goto LABEL_13;
    }
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = NSString;
    uint64_t v10 = [v18 identifier];
    uint64_t v13 = [v5 averageQuantity];
LABEL_11:
    double v15 = (void *)v13;
    [v12 stringWithFormat:@"%@=%@", v10, v13];
    goto LABEL_12;
  }
  uint64_t v11 = *(void **)(a1 + 32);
  id v16 = NSString;
  uint64_t v10 = [v5 minimumQuantity];
  double v15 = [v5 maximumQuantity];
  [v16 stringWithFormat:@"waterTemperature=%@-%@", v10, v15];
  id v17 = LABEL_12:;
  [v11 addObject:v17];

LABEL_13:
}

- (id)_detailedDescriptionString
{
  v2 = [(HKWorkout *)self _detailedDescriptionComponents];
  id v3 = [v2 componentsJoinedByString:@", "];

  return v3;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v52[1] = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)HKWorkout;
  uint64_t v7 = -[HKSample _validateWithConfiguration:](&v50, sel__validateWithConfiguration_);
  if (!v7)
  {
    uint64_t v8 = [(HKSample *)self sampleType];
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = [(HKSample *)self sampleType];
      uint64_t v7 = objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v13, a2, @"Invalid workout type %@"", v14);

      goto LABEL_9;
    }
    uint64_t v7 = -[HKWorkout _validateWorkoutEvents:withConfiguration:](self, "_validateWorkoutEvents:withConfiguration:", self->_workoutEvents, var0, var1);
    if (!v7)
    {
      uint64_t v7 = -[HKWorkout _validateWorkoutActivities:withConfiguration:](self, "_validateWorkoutActivities:withConfiguration:", self->_subActivities, var0, var1);
      if (!v7)
      {
        if (self->_primaryActivity)
        {
          v52[0] = self->_primaryActivity;
          uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
          uint64_t v7 = -[HKWorkout _validateWorkoutActivities:withConfiguration:](self, "_validateWorkoutActivities:withConfiguration:", v10, var0, var1);

          if (v7) {
            goto LABEL_9;
          }
          primaryActivity = self->_primaryActivity;
        }
        else
        {
          primaryActivity = 0;
        }
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        obuint64_t j = [(HKWorkoutActivity *)primaryActivity allStatistics];
        uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (!v16) {
          goto LABEL_28;
        }
        uint64_t v17 = v16;
        uint64_t v45 = *(void *)v47;
LABEL_15:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v47 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
          uint64_t v20 = [(HKWorkoutActivity *)self->_primaryActivity statisticsForType:v19];
          id v21 = [v19 canonicalUnit];
          uint64_t v22 = [v20 sumQuantity];
          if (v22)
          {
            uint64_t v23 = (void *)v22;
            uint64_t v24 = [v20 sumQuantity];
            char v25 = [v24 isCompatibleWithUnit:v21];

            if ((v25 & 1) == 0) {
              break;
            }
          }
          uint64_t v26 = [v20 averageQuantity];
          if (v26)
          {
            double v27 = (void *)v26;
            uint64_t v28 = [v20 averageQuantity];
            char v29 = [v28 isCompatibleWithUnit:v21];

            if ((v29 & 1) == 0)
            {
              uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v39 = objc_opt_class();
              uint64_t v40 = [v19 identifier];
              uint64_t v41 = [v20 averageQuantity];
              v42 = (void *)v41;
              id v43 = @"Incompatible unit for %@ average quantity, received %@";
              goto LABEL_35;
            }
          }
          uint64_t v30 = [v20 minimumQuantity];
          if (v30)
          {
            long long v31 = (void *)v30;
            long long v32 = [v20 minimumQuantity];
            char v33 = [v32 isCompatibleWithUnit:v21];

            if ((v33 & 1) == 0)
            {
              uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v39 = objc_opt_class();
              uint64_t v40 = [v19 identifier];
              uint64_t v41 = [v20 minimumQuantity];
              v42 = (void *)v41;
              id v43 = @"Incompatible unit for %@ minimum quantity, received %@";
              goto LABEL_35;
            }
          }
          uint64_t v34 = [v20 maximumQuantity];
          if (v34)
          {
            long long v35 = (void *)v34;
            long long v36 = [v20 maximumQuantity];
            char v37 = [v36 isCompatibleWithUnit:v21];

            if ((v37 & 1) == 0)
            {
              uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v39 = objc_opt_class();
              uint64_t v40 = [v19 identifier];
              uint64_t v41 = [v20 maximumQuantity];
              v42 = (void *)v41;
              id v43 = @"Incompatible unit for %@ maximum quantity, received %@";
              goto LABEL_35;
            }
          }

          if (v17 == ++v18)
          {
            uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
            if (v17) {
              goto LABEL_15;
            }
LABEL_28:

            if (_HKWorkoutGoalTypeAcceptsQuantity(self->_goalType, self->_goal))
            {
              uint64_t v7 = 0;
            }
            else
            {
              uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Incompatible goal (%@) for goal type %ld"", self->_goal, self->_goalType);
            }
            goto LABEL_9;
          }
        }
        uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v39 = objc_opt_class();
        uint64_t v40 = [v19 identifier];
        uint64_t v41 = [v20 sumQuantity];
        v42 = (void *)v41;
        id v43 = @"Incompatible unit for %@ sum quantity, received %@";
LABEL_35:
        uint64_t v7 = objc_msgSend(v38, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v39, a2, v43, v40, v41);
      }
    }
  }
LABEL_9:

  return v7;
}

- (id)_validateWorkoutEvents:(id)a3 withConfiguration:(HKObjectValidationConfiguration)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v8 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__55;
  id v21 = __Block_byref_object_dispose__55;
  id v22 = 0;
  objc_super v9 = [v8 firstObject];
  uint64_t v10 = v9;
  if (v9 && [v9 type] == 2)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"First event cannot be resume, workouts begin in the running state"");
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;
  }
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HKWorkout__validateWorkoutEvents_withConfiguration___block_invoke;
  v15[3] = &unk_1E58C8828;
  v15[6] = v16;
  v15[7] = var0;
  v15[4] = self;
  v15[5] = &v17;
  v15[8] = var1;
  v15[9] = a2;
  [v8 enumerateObjectsUsingBlock:v15];
  id v13 = (id)v18[5];
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v17, 8);

  return v13;
}

void __54__HKWorkout__validateWorkoutEvents_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v28 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_msgSend(v21, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v22, *(void *)(a1 + 72), @"Workout events must be of class %@, received (%@)"", objc_opt_class(), v28);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    double v15 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
    goto LABEL_11;
  }
  uint64_t v3 = objc_msgSend(v28, "_validateWithConfiguration:", *(void *)(a1 + 56), *(void *)(a1 + 64));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [v28 type];
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if ((unint64_t)(v6 - 1) <= 1 && v6 == *(void *)(v8 + 24))
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 72), @"Two pause/resume workout events with the same type occurred in a row: (%ld) and (%ld)"", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v6);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(void *)(v8 + 24) = v7;
  id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v13 = [*(id *)(a1 + 32) startDate];
  uint64_t v14 = [*(id *)(a1 + 32) endDate];
  double v15 = (void *)[v12 initWithStartDate:v13 endDate:v14];

  uint64_t v16 = [v28 dateInterval];
  uint64_t v17 = [v16 startDate];
  if (([v15 containsDate:v17] & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v18 = [v28 dateInterval];
  uint64_t v19 = [v18 endDate];
  char v20 = [v15 containsDate:v19];

  if ((v20 & 1) == 0)
  {
LABEL_10:
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 72), @"Workout event (%@) did not occur during this workout"", v28);
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
    double v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
LABEL_11:
}

- (id)_validateWorkoutActivities:(id)a3 withConfiguration:(HKObjectValidationConfiguration)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v8 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__55;
  uint64_t v16 = __Block_byref_object_dispose__55;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HKWorkout__validateWorkoutActivities_withConfiguration___block_invoke;
  v11[3] = &unk_1E58C8850;
  v11[6] = var0;
  v11[7] = var1;
  v11[4] = self;
  v11[5] = &v12;
  v11[8] = a2;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __58__HKWorkout__validateWorkoutActivities_withConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v21 = a2;
  uint64_t v6 = objc_msgSend(v21, "_validateWithConfiguration:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v11 = [*(id *)(a1 + 32) startDate];
    uint64_t v12 = [*(id *)(a1 + 32) endDate];
    id v13 = (void *)[v10 initWithStartDate:v11 endDate:v12];

    uint64_t v14 = [v21 startDate];
    if ([v13 containsDate:v14])
    {
      uint64_t v15 = [v21 endDate];
      if (!v15)
      {
LABEL_8:

LABEL_9:
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        goto LABEL_10;
      }
      uint64_t v16 = (void *)v15;
      id v17 = [v21 endDate];
      char v18 = [v13 containsDate:v17];

      if (v18) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 64), @"Workout activity (%@) did not occur during this workout"", v21);
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
    goto LABEL_8;
  }
LABEL_10:
  *a4 = v9 != 0;
}

- (void)_setUUID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkout;
  id v4 = a3;
  [(HKObject *)&v5 _setUUID:v4];
  -[HKWorkoutActivity _setUUID:](self->_primaryActivity, "_setUUID:", v4, v5.receiver, v5.super_class);
}

- (BOOL)acceptsAssociationWithObject:(id)a3
{
  id v3 = a3;
  id v4 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierWorkoutEffortScore"];
  objc_super v5 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"];
  uint64_t v6 = [v3 sampleType];
  if ([v6 isEqual:v4])
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [v3 sampleType];
    char v7 = [v8 isEqual:v5];
  }
  return v7;
}

- (id)subObjectFromUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v5 = [(HKWorkout *)self _subActivities];
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 UUID];
        uint64_t v11 = [v10 UUIDString];
        uint64_t v12 = [v4 UUIDString];
        char v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)_validateObjects:(id)a3 forClass:(Class)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![v7 count])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"%@: %@ data cannot be nil or empty.", objc_opt_class(), a4);
    char v23 = 0;
    goto LABEL_26;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v8)
  {
    char v22 = 1;
    goto LABEL_25;
  }
  uint64_t v9 = v8;
  long long v31 = a5;
  uint64_t v10 = *(void *)v36;
  id v32 = v7;
  uint64_t v11 = &off_1E58BA000;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(obj);
      }
      char v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = objc_opt_class();
        objc_msgSend(v24, "hk_assignError:code:format:", v31, 3, @"%@: Invalid object of type %@. Expecting %@.", v25, objc_opt_class(), a4);
        char v22 = 0;
        LOBYTE(a5) = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        continue;
      }
      uint64_t v14 = v10;
      long long v15 = a4;
      long long v16 = v11;
      id v17 = v13;
      uint64_t v18 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierWorkoutEffortScore"];
      uint64_t v19 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"];
      uint64_t v20 = [v17 sampleType];
      uint64_t v34 = (void *)v18;
      if ([v20 isEqual:v18])
      {

LABEL_19:
        a5 = (id *)MEMORY[0x1E4F28C58];
        uint64_t v26 = objc_opt_class();
        double v27 = [v17 sampleType];
        objc_msgSend(a5, "hk_error:format:", 3, @"%@: Sample of type %@ must be related to a workout", v26, v27);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        char v29 = v28;
        LOBYTE(a5) = v28 == 0;
        if (v28)
        {
          if (v31) {
            id *v31 = v28;
          }
          else {
            _HKLogDroppedError(v28);
          }
        }

        char v22 = 0;
LABEL_24:
        id v7 = v32;
        goto LABEL_25;
      }
      a5 = [v17 sampleType];
      int v21 = [a5 isEqual:v19];

      if (v21) {
        goto LABEL_19;
      }

      uint64_t v11 = v16;
      a4 = v15;
      uint64_t v10 = v14;
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    char v22 = 1;
    id v7 = v32;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_25:

  char v23 = v22 | a5;
LABEL_26:

  return v23 & 1;
}

BOOL __26__HKWorkout_workoutEvents__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 type] - 1) < 2;
}

- (void)_setWorkoutEvents:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_614];
  workoutEvents = self->_workoutEvents;
  self->_workoutEvents = v4;

  MEMORY[0x1F41817F8](v4, workoutEvents);
}

uint64_t __31__HKWorkout__setWorkoutEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = [a2 dateInterval];
  id v6 = [v4 dateInterval];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_setTotalSwimmingStrokeCount:(id)a3
{
  id v4 = a3;
  id v8 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierSwimmingStrokeCount"];
  objc_super v5 = [(HKSample *)self startDate];
  id v6 = [(HKSample *)self endDate];
  uint64_t v7 = _HKStatisticsForTotal(v8, v4, v5, v6);

  [(HKWorkoutActivity *)self->_primaryActivity _setStatistics:v7 forType:v8];
}

- (void)_setTotalFlightsClimbed:(id)a3
{
  id v4 = a3;
  id v8 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierFlightsClimbed"];
  objc_super v5 = [(HKSample *)self startDate];
  id v6 = [(HKSample *)self endDate];
  uint64_t v7 = _HKStatisticsForTotal(v8, v4, v5, v6);

  [(HKWorkoutActivity *)self->_primaryActivity _setStatistics:v7 forType:v8];
}

- (double)_totalEnergyBurnedInCanonicalUnit
{
  v2 = [(HKWorkout *)self totalEnergyBurned];
  id v3 = +[HKUnit kilocalorieUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_totalBasalEnergyBurnedInCanonicalUnit
{
  v2 = [(HKWorkout *)self _totalBasalEnergyBurned];
  id v3 = +[HKUnit kilocalorieUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_totalDistanceInCanonicalUnit
{
  v2 = [(HKWorkout *)self totalDistance];
  id v3 = +[HKUnit meterUnitWithMetricPrefix:9];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_totalDistanceIncludingAllTypesForUnit:(id)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22[0] = @"HKQuantityTypeIdentifierDistanceCycling";
  v22[1] = @"HKQuantityTypeIdentifierDistanceWalkingRunning";
  v22[2] = @"HKQuantityTypeIdentifierDistanceSwimming";
  v22[3] = @"HKQuantityTypeIdentifierDistanceDownhillSnowSports";
  v22[4] = @"HKQuantityTypeIdentifierDistanceWheelchair";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        uint64_t v12 = [(HKWorkout *)self statisticsForType:v11];
        char v13 = [v12 sumQuantity];
        [v13 doubleValueForUnit:v4];
        double v15 = v14;

        double v9 = v9 + v15;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)_totalSwimmingStrokeCountInCanonicalUnit
{
  v2 = [(HKWorkout *)self totalSwimmingStrokeCount];
  id v3 = +[HKUnit countUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_totalFlightsClimbedInCanonicalUnit
{
  v2 = [(HKWorkout *)self totalFlightsClimbed];
  id v3 = +[HKUnit countUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_goalInCanonicalUnit
{
  goal = self->_goal;
  id v3 = _HKWorkoutCanonicalUnitForGoalType(self->_goalType);
  [(HKQuantity *)goal doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (int64_t)_activityMoveMode
{
  v2 = [(HKObject *)self metadata];
  id v3 = [v2 objectForKeyedSubscript:@"_HKPrivateWorkoutActivityMoveMode"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (NSArray)workoutActivities
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_subActivities count])
  {
    id v3 = self->_subActivities;
  }
  else
  {
    v5[0] = self->_primaryActivity;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }

  return v3;
}

- (NSDictionary)allStatistics
{
  return [(HKWorkoutActivity *)self->_primaryActivity allStatistics];
}

- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType
{
  return [(HKWorkoutActivity *)self->_primaryActivity statisticsForType:quantityType];
}

- (id)zonesForType:(id)a3
{
  return [(NSDictionary *)self->_zonesByType objectForKeyedSubscript:a3];
}

- (void)_enumerateActiveTimePeriods:(id)a3
{
  id v4 = a3;
  id v6 = [(HKSample *)self startDate];
  double v5 = [(HKSample *)self endDate];
  _HKEnumerateActiveWorkoutIntervalsStartingPaused(v6, v5, self->_workoutEvents, 0, v4);
}

+ (BOOL)_workoutWithActivityType:(unint64_t)a3 acceptsSubActivityType:(unint64_t)a4
{
  if (a3 != 82) {
    return a3 == a4;
  }
  BOOL result = 1;
  if (a4 - 37 > 0x2E || ((1 << (a4 - 37)) & 0x400000000201) == 0) {
    return a4 == 13;
  }
  return result;
}

- (HKWorkoutActivity)_primaryActivity
{
  return self->_primaryActivity;
}

- (void)_setPrimaryActivity:(id)a3
{
}

- (NSArray)_subActivities
{
  return self->_subActivities;
}

- (void)_setSubActivities:(id)a3
{
}

- (NSDictionary)_zonesByType
{
  return self->_zonesByType;
}

- (void)_setZonesByType:(id)a3
{
}

- (void)_setGoalType:(unint64_t)a3
{
  self->_goalType = a3;
}

- (void)_setGoal:(id)a3
{
}

@end
@interface HKActivitySummary
+ (BOOL)_validateActivitySummaryDateComponents:(id)a3 errorMessage:(id *)a4;
+ (BOOL)_validateActivitySummaryDateComponentsRange:(id)a3 endDateComponents:(id)a4 errorMessage:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)_mostRecentlyCreatedCacheAmongCaches:(id)a3;
+ (id)_mostSignificantCacheAmongCaches:(id)a3;
- (BOOL)_allFieldsAreEqual:(id)a3;
- (BOOL)_hasAppleMoveTimeGoal;
- (BOOL)_hasEnergyBurnedGoal;
- (BOOL)_hasExerciseGoal;
- (BOOL)_hasStandHoursGoal;
- (BOOL)_isDataLoading;
- (BOOL)_isStandalonePhoneSummary;
- (BOOL)_useHourlyGoalComparison;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaused;
- (BOOL)paused;
- (HKActivityMoveMode)activityMoveMode;
- (HKActivitySummary)init;
- (HKActivitySummary)initWithCoder:(id)a3;
- (HKQuantity)_deepBreathingDuration;
- (HKQuantity)_flightsClimbed;
- (HKQuantity)_pushCount;
- (HKQuantity)activeEnergyBurned;
- (HKQuantity)activeEnergyBurnedGoal;
- (HKQuantity)appleExerciseTime;
- (HKQuantity)appleExerciseTimeGoal;
- (HKQuantity)appleMoveTime;
- (HKQuantity)appleMoveTimeGoal;
- (HKQuantity)appleStandHours;
- (HKQuantity)appleStandHoursGoal;
- (HKQuantity)distanceWalkingRunning;
- (HKQuantity)exerciseTimeGoal;
- (HKQuantity)standHoursGoal;
- (HKQuantity)stepCount;
- (NSArray)_dailyBriskMinutesStatistics;
- (NSArray)_dailyEnergyBurnedStatistics;
- (NSArray)_dailyMoveTimeStatistics;
- (NSDate)_activeHoursGoalDate;
- (NSDate)_briskMinutesGoalDate;
- (NSDate)_creationDate;
- (NSDate)_endDate;
- (NSDate)_energyBurnedGoalDate;
- (NSDate)_moveTimeGoalDate;
- (NSDate)_startDate;
- (NSDateComponents)_gregorianDateComponents;
- (NSDateComponents)dateComponentsForCalendar:(NSCalendar *)calendar;
- (double)_activeEnergyCompletionPercentage;
- (double)_exerciseTimeCompletionPercentage;
- (double)_moveMinutesCompletionPercentage;
- (double)_percentageCompleteWithQuantity:(id)a3 goalQuantity:(id)a4 unit:(id)a5;
- (double)_standHoursCompletionPercentage;
- (id)_decodeQuantityFromCoder:(id)a3 forKey:(id)a4 unit:(id)a5;
- (id)_initWithActivityCache:(id)a3 shouldIncludePrivateProperties:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_activitySummaryIndex;
- (int64_t)_wheelchairUse;
- (unint64_t)hash;
- (void)_encodeQuantity:(id)a3 withCoder:(id)a4 key:(id)a5 unit:(id)a6;
- (void)_setActiveHoursGoalDate:(id)a3;
- (void)_setActivitySummaryIndex:(int64_t)a3;
- (void)_setBriskMinutesGoalDate:(id)a3;
- (void)_setCreationDate:(id)a3;
- (void)_setDailyBriskMinutesStatistics:(id)a3;
- (void)_setDailyEnergyBurnedStatistics:(id)a3;
- (void)_setDailyMoveMinutesStatistics:(id)a3;
- (void)_setDailyMoveTimeStatistics:(id)a3;
- (void)_setDataLoading:(BOOL)a3;
- (void)_setDeepBreathingDuration:(id)a3;
- (void)_setEndDate:(id)a3;
- (void)_setEnergyBurnedGoalDate:(id)a3;
- (void)_setFlightsClimbed:(id)a3;
- (void)_setGregorianDateComponents:(id)a3;
- (void)_setMoveTimeGoalDate:(id)a3;
- (void)_setPushCount:(id)a3;
- (void)_setStartDate:(id)a3;
- (void)_setWheelchairUse:(int64_t)a3;
- (void)_validateQuantityAssignment:(id)a3 expectedUnit:(id)a4 propertyName:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveEnergyBurned:(HKQuantity *)activeEnergyBurned;
- (void)setActiveEnergyBurnedGoal:(HKQuantity *)activeEnergyBurnedGoal;
- (void)setActivityMoveMode:(HKActivityMoveMode)activityMoveMode;
- (void)setAppleExerciseTime:(HKQuantity *)appleExerciseTime;
- (void)setAppleExerciseTimeGoal:(HKQuantity *)appleExerciseTimeGoal;
- (void)setAppleMoveTime:(HKQuantity *)appleMoveTime;
- (void)setAppleMoveTimeGoal:(HKQuantity *)appleMoveTimeGoal;
- (void)setAppleStandHours:(HKQuantity *)appleStandHours;
- (void)setAppleStandHoursGoal:(HKQuantity *)appleStandHoursGoal;
- (void)setDeprecatedPauseForInternalSwiftClient:(BOOL)a3;
- (void)setDistanceWalkingRunning:(id)a3;
- (void)setExerciseTimeGoal:(HKQuantity *)exerciseTimeGoal;
- (void)setPaused:(BOOL)a3;
- (void)setStandHoursGoal:(HKQuantity *)standHoursGoal;
- (void)setStepCount:(id)a3;
@end

@implementation HKActivitySummary

- (void)encodeWithCoder:(id)a3
{
  int64_t activitySummaryIndex = self->_activitySummaryIndex;
  id v31 = a3;
  [v31 encodeInt64:activitySummaryIndex forKey:@"index"];
  activeEnergyBurned = self->_activeEnergyBurned;
  v6 = +[HKUnit kilocalorieUnit];
  [(HKActivitySummary *)self _encodeQuantity:activeEnergyBurned withCoder:v31 key:@"activeEnergy" unit:v6];

  appleMoveTime = self->_appleMoveTime;
  v8 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _encodeQuantity:appleMoveTime withCoder:v31 key:@"moveTime" unit:v8];

  appleExerciseTime = self->_appleExerciseTime;
  v10 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _encodeQuantity:appleExerciseTime withCoder:v31 key:@"exerciseTime" unit:v10];

  appleStandHours = self->_appleStandHours;
  v12 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _encodeQuantity:appleStandHours withCoder:v31 key:@"standHours" unit:v12];

  distanceWalkingRunning = self->_distanceWalkingRunning;
  v14 = +[HKUnit meterUnit];
  [(HKActivitySummary *)self _encodeQuantity:distanceWalkingRunning withCoder:v31 key:@"distanceWalking" unit:v14];

  stepCount = self->_stepCount;
  v16 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _encodeQuantity:stepCount withCoder:v31 key:@"stepCount" unit:v16];

  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  v18 = +[HKUnit kilocalorieUnit];
  [(HKActivitySummary *)self _encodeQuantity:activeEnergyBurnedGoal withCoder:v31 key:@"energyBurnedGoal" unit:v18];

  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  v20 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _encodeQuantity:appleMoveTimeGoal withCoder:v31 key:@"moveMinutesGoal" unit:v20];

  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  v22 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _encodeQuantity:appleExerciseTimeGoal withCoder:v31 key:@"briskMinutesGoal" unit:v22];

  appleStandHoursGoal = self->_appleStandHoursGoal;
  v24 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _encodeQuantity:appleStandHoursGoal withCoder:v31 key:@"activeHoursGoal" unit:v24];

  deepBreathingDuration = self->_deepBreathingDuration;
  v26 = +[HKUnit secondUnit];
  [(HKActivitySummary *)self _encodeQuantity:deepBreathingDuration withCoder:v31 key:@"deepBreathingDuration" unit:v26];

  pushCount = self->_pushCount;
  v28 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _encodeQuantity:pushCount withCoder:v31 key:@"pushCount" unit:v28];

  flightsClimbed = self->_flightsClimbed;
  v30 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _encodeQuantity:flightsClimbed withCoder:v31 key:@"flightsClimbed" unit:v30];

  [v31 encodeInteger:self->_wheelchairUse forKey:@"wheelchairUse"];
  [v31 encodeObject:self->_dailyEnergyBurnedStatistics forKey:@"dailyEnergyBurnedStatistics"];
  [v31 encodeObject:self->_dailyMoveTimeStatistics forKey:@"dailyMoveMinutesStatistics"];
  [v31 encodeObject:self->_dailyBriskMinutesStatistics forKey:@"dailyBriskMinutesStatistics"];
  [v31 encodeBool:self->_dataLoading forKey:@"dataLoading"];
  [v31 encodeObject:self->_energyBurnedGoalDate forKey:@"energyBurnedGoalDate"];
  [v31 encodeObject:self->_moveTimeGoalDate forKey:@"moveTimeGoalDate"];
  [v31 encodeObject:self->_briskMinutesGoalDate forKey:@"briskMinutesGoalDate"];
  [v31 encodeObject:self->_activeHoursGoalDate forKey:@"activeHoursGoalDate"];
  [v31 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v31 encodeObject:self->_startDate forKey:@"startDate"];
  [v31 encodeObject:self->_endDate forKey:@"endDate"];
  [v31 encodeInteger:self->_activityMoveMode forKey:@"activityMoveMode"];
  [v31 encodeBool:self->_paused forKey:@"paused"];
}

- (void)_encodeQuantity:(id)a3 withCoder:(id)a4 key:(id)a5 unit:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a4;
    [a3 doubleValueForUnit:a6];
    objc_msgSend(v10, "encodeDouble:forKey:", v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HKActivitySummary);
  [(HKActivitySummary *)v4 _setActivitySummaryIndex:self->_activitySummaryIndex];
  objc_storeStrong((id *)&v4->_activeEnergyBurned, self->_activeEnergyBurned);
  objc_storeStrong((id *)&v4->_appleMoveTime, self->_appleMoveTime);
  objc_storeStrong((id *)&v4->_appleExerciseTime, self->_appleExerciseTime);
  objc_storeStrong((id *)&v4->_appleStandHours, self->_appleStandHours);
  objc_storeStrong((id *)&v4->_distanceWalkingRunning, self->_distanceWalkingRunning);
  objc_storeStrong((id *)&v4->_stepCount, self->_stepCount);
  objc_storeStrong((id *)&v4->_activeEnergyBurnedGoal, self->_activeEnergyBurnedGoal);
  objc_storeStrong((id *)&v4->_appleMoveTimeGoal, self->_appleMoveTimeGoal);
  objc_storeStrong((id *)&v4->_appleExerciseTimeGoal, self->_appleExerciseTimeGoal);
  objc_storeStrong((id *)&v4->_appleStandHoursGoal, self->_appleStandHoursGoal);
  objc_storeStrong((id *)&v4->_deepBreathingDuration, self->_deepBreathingDuration);
  objc_storeStrong((id *)&v4->_pushCount, self->_pushCount);
  v4->_wheelchairUse = self->_wheelchairUse;
  objc_storeStrong((id *)&v4->_creationDate, self->_creationDate);
  objc_storeStrong((id *)&v4->_startDate, self->_startDate);
  objc_storeStrong((id *)&v4->_endDate, self->_endDate);
  objc_storeStrong((id *)&v4->_energyBurnedGoalDate, self->_energyBurnedGoalDate);
  objc_storeStrong((id *)&v4->_moveTimeGoalDate, self->_moveTimeGoalDate);
  objc_storeStrong((id *)&v4->_flightsClimbed, self->_flightsClimbed);
  uint64_t v5 = [(NSArray *)self->_dailyEnergyBurnedStatistics copy];
  dailyEnergyBurnedStatistics = v4->_dailyEnergyBurnedStatistics;
  v4->_dailyEnergyBurnedStatistics = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_dailyMoveTimeStatistics copy];
  dailyMoveTimeStatistics = v4->_dailyMoveTimeStatistics;
  v4->_dailyMoveTimeStatistics = (NSArray *)v7;

  uint64_t v9 = [(NSArray *)self->_dailyBriskMinutesStatistics copy];
  dailyBriskMinutesStatistics = v4->_dailyBriskMinutesStatistics;
  v4->_dailyBriskMinutesStatistics = (NSArray *)v9;

  v4->_activityMoveMode = self->_activityMoveMode;
  v4->_paused = self->_paused;
  v4->_dataLoading = self->_dataLoading;
  return v4;
}

- (void)_setActivitySummaryIndex:(int64_t)a3
{
  self->_int64_t activitySummaryIndex = a3;
  _HKActivityCacheDateComponentsFromCacheIndex(a3);
  self->_dateComponents = (NSDateComponents *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (BOOL)_allFieldsAreEqual:(id)a3
{
  id v4 = a3;
  BOOL v170 = [(HKActivitySummary *)self isEqual:v4];
  if (!v170)
  {
    int v17 = 0;
    uint64_t v164 = 0;
    uint64_t v165 = 0;
    uint64_t v162 = 0;
    uint64_t v163 = 0;
    uint64_t v161 = 0;
    int v9 = 0;
    int v10 = 0;
    memset(v169, 0, sizeof(v169));
    unint64_t v159 = 0;
    int v11 = 0;
    memset(v171, 0, sizeof(v171));
    int v160 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v18 = 0;
    int v19 = 0;
    LOBYTE(v166) = 0;
    goto LABEL_7;
  }
  uint64_t v6 = [(HKActivitySummary *)self distanceWalkingRunning];
  v155 = [v4 distanceWalkingRunning];
  v156 = (void *)v6;
  HIDWORD(v171[3]) = v6 != (void)v155;
  if ((void *)v6 != v155)
  {
    uint64_t v7 = [v4 distanceWalkingRunning];
    if (!v7)
    {
      v152 = 0;
      uint64_t v164 = 0;
      uint64_t v165 = 0;
      uint64_t v162 = 0;
      uint64_t v163 = 0;
      uint64_t v161 = 0;
      int v9 = 0;
      int v10 = 0;
      memset(v169, 0, sizeof(v169));
      unint64_t v159 = 0;
      int v11 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v171, 0, 28);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      HIDWORD(v171[3]) = 1;
      goto LABEL_7;
    }
    v152 = (void *)v7;
    v8 = [(HKActivitySummary *)self distanceWalkingRunning];
    v148 = [v4 distanceWalkingRunning];
    v149 = v8;
    if (!objc_msgSend(v8, "isEqual:"))
    {
      uint64_t v163 = 0;
      uint64_t v164 = 0;
      uint64_t v161 = 0;
      uint64_t v162 = 0;
      int v9 = 0;
      int v10 = 0;
      memset(v169, 0, sizeof(v169));
      unint64_t v159 = 0;
      int v11 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v171, 0, 28);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      HIDWORD(v171[3]) = 1;
      uint64_t v165 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v32 = [(HKActivitySummary *)self stepCount];
  v150 = [v4 stepCount];
  BOOL v33 = v32 != (void)v150;
  v151 = (void *)v32;
  if ((void *)v32 != v150)
  {
    uint64_t v34 = [v4 stepCount];
    if (!v34)
    {
      v147 = 0;
      uint64_t v163 = 0;
      uint64_t v164 = 0;
      uint64_t v161 = 0;
      uint64_t v162 = 0;
      int v9 = 0;
      int v10 = 0;
      memset(v169, 0, sizeof(v169));
      unint64_t v159 = 0;
      int v11 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v171, 0, 20);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      *(void *)((char *)&v171[2] + 4) = 1;
      goto LABEL_7;
    }
    v147 = (void *)v34;
    v35 = [(HKActivitySummary *)self stepCount];
    v143 = [v4 stepCount];
    v144 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      uint64_t v162 = 0;
      uint64_t v163 = 0;
      uint64_t v161 = 0;
      int v9 = 0;
      int v10 = 0;
      memset(v169, 0, sizeof(v169));
      unint64_t v159 = 0;
      int v11 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v171, 0, 20);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      *(void *)((char *)&v171[2] + 4) = 1;
      uint64_t v164 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v36 = [(HKActivitySummary *)self _deepBreathingDuration];
  uint64_t v37 = [v4 _deepBreathingDuration];
  HIDWORD(v171[2]) = v33;
  LODWORD(v171[3]) = v36 != v37;
  v145 = (void *)v37;
  v146 = (void *)v36;
  if (v36 != v37)
  {
    uint64_t v38 = [v4 _deepBreathingDuration];
    if (!v38)
    {
      v142 = 0;
      uint64_t v162 = 0;
      uint64_t v163 = 0;
      uint64_t v161 = 0;
      BOOL v47 = v33;
      int v9 = 0;
      int v10 = 0;
      memset(v169, 0, sizeof(v169));
      unint64_t v159 = 0;
      int v11 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v171, 0, 20);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v5 = HIDWORD(v171[3]);
      uint64_t v164 = v47 | 0x100000000;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      LODWORD(v171[3]) = 1;
      goto LABEL_7;
    }
    v142 = (void *)v38;
    v39 = [(HKActivitySummary *)self _deepBreathingDuration];
    v138 = [v4 _deepBreathingDuration];
    v139 = v39;
    if (!objc_msgSend(v39, "isEqual:"))
    {
      uint64_t v161 = 0;
      uint64_t v162 = 0;
      BOOL v40 = v33;
      int v9 = 0;
      int v10 = 0;
      memset(v169, 0, sizeof(v169));
      unint64_t v159 = 0;
      int v11 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v171, 0, 20);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v5 = HIDWORD(v171[3]);
      uint64_t v164 = v40 | 0x100000000;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      LODWORD(v171[3]) = 1;
      uint64_t v163 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v41 = [(HKActivitySummary *)self _startDate];
  uint64_t v42 = [v4 _startDate];
  BOOL v43 = v41 != v42;
  v140 = (void *)v42;
  v141 = (void *)v41;
  if (v41 != v42)
  {
    uint64_t v44 = [v4 _startDate];
    if (!v44)
    {
      v158 = 0;
      uint64_t v161 = 0;
      uint64_t v162 = 0;
      BOOL v54 = v33;
      int v9 = 0;
      int v10 = 0;
      memset(v169, 0, sizeof(v169));
      unint64_t v159 = 0;
      int v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v164 = v54 | 0x100000000;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v5 = LODWORD(v171[3]);
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      LODWORD(v171[2]) = 1;
      goto LABEL_7;
    }
    v158 = (void *)v44;
    v45 = [(HKActivitySummary *)self _startDate];
    v134 = [v4 _startDate];
    v135 = v45;
    if (!objc_msgSend(v45, "isEqual:"))
    {
      uint64_t v161 = 0;
      BOOL v46 = v33;
      int v9 = 0;
      int v10 = 0;
      memset(v169, 0, sizeof(v169));
      unint64_t v159 = 0;
      int v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v164 = v46 | 0x100000000;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v5 = LODWORD(v171[3]);
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      LODWORD(v171[2]) = 1;
      uint64_t v162 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v48 = [(HKActivitySummary *)self _endDate];
  uint64_t v49 = [v4 _endDate];
  BOOL v50 = v48 != v49;
  LODWORD(v171[2]) = v43;
  v136 = (void *)v49;
  v137 = (void *)v48;
  if (v48 != v49)
  {
    uint64_t v51 = [v4 _endDate];
    if (!v51)
    {
      v157 = 0;
      uint64_t v161 = 0;
      *(void *)v169 = 0;
      BOOL v63 = v33;
      int v9 = 0;
      int v10 = 0;
      unint64_t v159 = 0;
      uint64_t v5 = v43;
      int v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v164 = v63 | 0x100000000;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v162 = v5 | 0x100000000;
      *(_DWORD *)&v169[8] = 1;
      goto LABEL_7;
    }
    v157 = (void *)v51;
    v52 = [(HKActivitySummary *)self _endDate];
    v130 = [v4 _endDate];
    v131 = v52;
    if (!objc_msgSend(v52, "isEqual:"))
    {
      *(void *)v169 = 0;
      BOOL v53 = v33;
      int v9 = 0;
      int v10 = 0;
      unint64_t v159 = 0;
      uint64_t v5 = v43;
      int v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v164 = v53 | 0x100000000;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v162 = v5 | 0x100000000;
      *(_DWORD *)&v169[8] = 1;
      uint64_t v161 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v55 = [(HKActivitySummary *)self _creationDate];
  uint64_t v56 = [v4 _creationDate];
  v57 = (void *)v55;
  BOOL v58 = v55 == v56;
  BOOL v59 = v55 != v56;
  *(_DWORD *)&v169[8] = v50;
  v132 = (void *)v56;
  v133 = v57;
  if (!v58)
  {
    uint64_t v60 = [v4 _creationDate];
    if (!v60)
    {
      v129 = 0;
      BOOL v69 = v33;
      int v9 = 0;
      *(void *)v169 = 0x100000000;
      unint64_t v159 = 0;
      uint64_t v5 = v43;
      int v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      BOOL v70 = v50;
      int v10 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v164 = v69 | 0x100000000;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v162 = v5 | 0x100000000;
      uint64_t v161 = v70 | 0x100000000;
      goto LABEL_7;
    }
    v129 = (void *)v60;
    v61 = [(HKActivitySummary *)self _creationDate];
    v125 = [v4 _creationDate];
    v126 = v61;
    if (!objc_msgSend(v61, "isEqual:"))
    {
      *(void *)v169 = 0x100000000;
      unint64_t v159 = 0;
      BOOL v62 = v43;
      int v11 = 0;
      v171[0] = 0;
      v171[1] = 0;
      uint64_t v5 = v50;
      int v10 = 0;
      int v160 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v162 = v62 | 0x100000000;
      uint64_t v161 = v5 | 0x100000000;
      int v9 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v64 = [(HKActivitySummary *)self _energyBurnedGoalDate];
  v127 = [v4 _energyBurnedGoalDate];
  v128 = (void *)v64;
  BOOL v58 = v64 == (void)v127;
  BOOL v65 = v64 != (void)v127;
  *(_DWORD *)&v169[4] = v59;
  if (!v58)
  {
    uint64_t v66 = [v4 _energyBurnedGoalDate];
    if (!v66)
    {
      v124 = 0;
      unint64_t v159 = 0;
      BOOL v77 = v43;
      v171[0] = 0;
      v171[1] = 0;
      uint64_t v5 = v50;
      int v160 = 0;
      BOOL v78 = v59;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v162 = v77 | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      int v9 = v78;
      int v10 = 1;
      *(_DWORD *)v169 = 1;
      goto LABEL_7;
    }
    v124 = (void *)v66;
    v67 = [(HKActivitySummary *)self _energyBurnedGoalDate];
    v120 = [v4 _energyBurnedGoalDate];
    v121 = v67;
    if (!objc_msgSend(v67, "isEqual:"))
    {
      v171[0] = 0;
      v171[1] = 0;
      unint64_t v159 = 0x100000000;
      uint64_t v5 = v50;
      int v160 = 0;
      BOOL v68 = v59;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      int v9 = v68;
      int v10 = 1;
      *(_DWORD *)v169 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v71 = [(HKActivitySummary *)self _moveTimeGoalDate];
  uint64_t v72 = [v4 _moveTimeGoalDate];
  v73 = (void *)v71;
  BOOL v58 = v71 == v72;
  BOOL v74 = v71 != v72;
  v122 = (void *)v72;
  v123 = v73;
  *(_DWORD *)v169 = v65;
  if (v58)
  {
    HIDWORD(v171[1]) = v74;
  }
  else
  {
    uint64_t v75 = [v4 _moveTimeGoalDate];
    if (!v75)
    {
      v119 = 0;
      LODWORD(v159) = 0;
      int v160 = 0;
      *(void *)((char *)v171 + 4) = 0;
      uint64_t v5 = v59;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      LODWORD(v171[0]) = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      int v10 = 1;
      HIDWORD(v159) = v65;
      int v9 = v59;
      int v11 = 1;
      HIDWORD(v171[1]) = 1;
      goto LABEL_7;
    }
    HIDWORD(v171[1]) = v74;
    v119 = (void *)v75;
    v76 = [(HKActivitySummary *)self _moveTimeGoalDate];
    v115 = [v4 _moveTimeGoalDate];
    v116 = v76;
    if (!objc_msgSend(v76, "isEqual:"))
    {
      int v160 = 0;
      *(void *)((char *)v171 + 4) = 0;
      uint64_t v5 = v59;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      LODWORD(v171[0]) = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      int v10 = 1;
      HIDWORD(v159) = v65;
      int v9 = v59;
      int v11 = 1;
      HIDWORD(v171[1]) = 1;
      LODWORD(v159) = 1;
      goto LABEL_7;
    }
  }
  uint64_t v79 = [(HKActivitySummary *)self _briskMinutesGoalDate];
  v117 = [v4 _briskMinutesGoalDate];
  LODWORD(v171[1]) = v79 != (void)v117;
  v118 = (void *)v79;
  if ((void *)v79 != v117)
  {
    uint64_t v80 = [v4 _briskMinutesGoalDate];
    if (!v80)
    {
      v114 = 0;
      int v12 = 0;
      v171[0] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      uint64_t v5 = 1;
      uint64_t v161 = v50 | 0x100000000;
      int v10 = 1;
      unint64_t v159 = __PAIR64__(v65, HIDWORD(v171[1]));
      int v9 = v59;
      int v11 = 1;
      int v13 = 0;
      int v160 = 1;
      LODWORD(v171[1]) = 1;
      goto LABEL_7;
    }
    v114 = (void *)v80;
    v81 = [(HKActivitySummary *)self _briskMinutesGoalDate];
    v110 = [v4 _briskMinutesGoalDate];
    v111 = v81;
    if (!objc_msgSend(v81, "isEqual:"))
    {
      uint64_t v5 = 0;
      v171[0] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      int v10 = 1;
      HIDWORD(v159) = v65;
      int v9 = v59;
      int v11 = 1;
      LODWORD(v159) = HIDWORD(v171[1]);
      int v13 = 0;
      int v160 = 1;
      LODWORD(v171[1]) = 1;
      int v12 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v82 = [(HKActivitySummary *)self _activeHoursGoalDate];
  uint64_t v83 = [v4 _activeHoursGoalDate];
  HIDWORD(v171[0]) = v82 != v83;
  v112 = (void *)v83;
  v113 = (void *)v82;
  if (v82 != v83)
  {
    uint64_t v84 = [v4 _activeHoursGoalDate];
    if (!v84)
    {
      v109 = 0;
      int v14 = 0;
      int v15 = 0;
      v171[0] = 0x100000000;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v5 = LODWORD(v171[3]);
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      int v10 = 1;
      HIDWORD(v159) = v65;
      int v9 = v59;
      int v11 = 1;
      int v12 = v171[1];
      LODWORD(v159) = HIDWORD(v171[1]);
      int v160 = 1;
      int v13 = 1;
      goto LABEL_7;
    }
    v109 = (void *)v84;
    v85 = [(HKActivitySummary *)self _activeHoursGoalDate];
    v105 = [v4 _activeHoursGoalDate];
    v106 = v85;
    if (!objc_msgSend(v85, "isEqual:"))
    {
      int v15 = 0;
      v171[0] = 0x100000000;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v5 = LODWORD(v171[3]);
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      int v10 = 1;
      HIDWORD(v159) = v65;
      int v9 = v59;
      int v11 = 1;
      int v12 = v171[1];
      LODWORD(v159) = HIDWORD(v171[1]);
      int v160 = 1;
      int v13 = 1;
      int v14 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v86 = [(HKActivitySummary *)self _pushCount];
  uint64_t v87 = [v4 _pushCount];
  LODWORD(v171[0]) = v86 != v87;
  v107 = (void *)v87;
  v108 = (void *)v86;
  if (v86 != v87)
  {
    uint64_t v88 = [v4 _pushCount];
    if (!v88)
    {
      v104 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v5 = LODWORD(v171[3]);
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      int v10 = 1;
      HIDWORD(v159) = v65;
      int v9 = v59;
      int v11 = 1;
      int v12 = v171[1];
      LODWORD(v159) = HIDWORD(v171[1]);
      int v160 = 1;
      int v13 = 1;
      int v14 = HIDWORD(v171[0]);
      int v15 = 1;
      LODWORD(v171[0]) = 1;
      goto LABEL_7;
    }
    v104 = (void *)v88;
    v89 = [(HKActivitySummary *)self _pushCount];
    v100 = [v4 _pushCount];
    v101 = v89;
    if (!objc_msgSend(v89, "isEqual:"))
    {
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v5 = LODWORD(v171[3]);
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      uint64_t v161 = v50 | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      int v10 = 1;
      HIDWORD(v159) = v65;
      int v9 = v59;
      int v11 = 1;
      int v12 = v171[1];
      LODWORD(v159) = HIDWORD(v171[1]);
      int v160 = 1;
      int v13 = 1;
      int v14 = HIDWORD(v171[0]);
      int v15 = 1;
      LODWORD(v171[0]) = 1;
      int v16 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v90 = [(HKActivitySummary *)self _flightsClimbed];
  v102 = [v4 _flightsClimbed];
  BOOL v154 = v90 != (void)v102;
  v103 = (void *)v90;
  if ((void *)v90 == v102)
  {
    unsigned int v94 = HIDWORD(v171[1]);
    goto LABEL_140;
  }
  uint64_t v91 = [v4 _flightsClimbed];
  if (v91)
  {
    v99 = (void *)v91;
    v92 = [(HKActivitySummary *)self _flightsClimbed];
    uint64_t v97 = [v4 _flightsClimbed];
    v98 = v92;
    int v93 = objc_msgSend(v92, "isEqual:");
    unsigned int v94 = HIDWORD(v171[1]);
    if (!v93)
    {
      LOBYTE(v166) = 0;
      uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
      uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
      int v19 = 1;
      uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
      int v160 = 1;
      uint64_t v161 = v50 | 0x100000000;
      uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
      int v10 = 1;
      unint64_t v159 = __PAIR64__(v65, HIDWORD(v171[1]));
      int v9 = v59;
      int v11 = 1;
      int v14 = HIDWORD(v171[0]);
      int v12 = v171[1];
      int v13 = 1;
      int v15 = 1;
      int v16 = v171[0];
      int v17 = 1;
      int v18 = 1;
LABEL_145:
      uint64_t v5 = v97;
      goto LABEL_7;
    }
LABEL_140:
    int64_t v167 = [(HKActivitySummary *)self _wheelchairUse];
    HIDWORD(v171[1]) = v94;
    if (v167 == [v4 _wheelchairUse]
      && (HKActivityMoveMode v168 = [(HKActivitySummary *)self activityMoveMode],
          v168 == [v4 activityMoveMode])
      && (int v95 = -[HKActivitySummary isPaused](self, "isPaused"), v95 == [v4 isPaused]))
    {
      BOOL v96 = [(HKActivitySummary *)self _isDataLoading];
      int v166 = v96 ^ [v4 _isDataLoading] ^ 1;
    }
    else
    {
      LOBYTE(v166) = 0;
    }
    uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
    uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
    uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
    uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
    uint64_t v161 = v50 | 0x100000000;
    int v10 = 1;
    unint64_t v159 = __PAIR64__(v65, v94);
    int v9 = v59;
    int v11 = 1;
    int v160 = 1;
    int v14 = HIDWORD(v171[0]);
    int v12 = v171[1];
    int v13 = 1;
    int v15 = 1;
    int v16 = v171[0];
    int v17 = 1;
    int v18 = v154;
    int v19 = v154;
    goto LABEL_145;
  }
  v99 = 0;
  int v19 = 0;
  LOBYTE(v166) = 0;
  uint64_t v165 = HIDWORD(v171[3]) | 0x100000000;
  uint64_t v5 = LODWORD(v171[3]);
  uint64_t v164 = HIDWORD(v171[2]) | 0x100000000;
  uint64_t v163 = LODWORD(v171[3]) | 0x100000000;
  uint64_t v161 = v50 | 0x100000000;
  uint64_t v162 = LODWORD(v171[2]) | 0x100000000;
  int v10 = 1;
  HIDWORD(v159) = v65;
  int v9 = v59;
  int v11 = 1;
  int v12 = v171[1];
  LODWORD(v159) = HIDWORD(v171[1]);
  int v160 = 1;
  int v13 = 1;
  int v16 = v171[0];
  int v14 = HIDWORD(v171[0]);
  int v15 = 1;
  int v17 = 1;
  int v18 = 1;
LABEL_7:
  if (v19)
  {
    int v153 = v12;
    int v21 = v14;
    id v22 = v4;
    int v23 = v13;
    int v24 = v16;
    int v25 = v11;
    int v26 = v9;
    int v27 = v15;
    int v28 = v10;
    int v29 = v17;
    int v30 = v18;

    int v31 = v30;
    int v17 = v29;
    int v10 = v28;
    int v15 = v27;
    int v9 = v26;
    int v11 = v25;
    int v16 = v24;
    int v13 = v23;
    id v4 = v22;
    int v14 = v21;
    int v12 = v153;
    if (!v31)
    {
LABEL_9:
      if (!v17) {
        goto LABEL_10;
      }
      goto LABEL_74;
    }
  }
  else if (!v18)
  {
    goto LABEL_9;
  }

  if (!v17)
  {
LABEL_10:
    if (!v16) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_74:

  if (v16)
  {
LABEL_11:
  }
LABEL_12:
  if (LODWORD(v171[0])) {

  }
  if (v15)
  {
  }
  if (v14)
  {
  }
  if (HIDWORD(v171[0]))
  {

    if (!v13)
    {
LABEL_20:
      if (!v12) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if (!v13)
  {
    goto LABEL_20;
  }

  if (v12)
  {
LABEL_21:
  }
LABEL_22:
  if (LODWORD(v171[1])) {

  }
  if (v160)
  {
  }
  if (v159)
  {
  }
  if (HIDWORD(v171[1])) {

  }
  if (v11)
  {
  }
  if (HIDWORD(v159))
  {
  }
  if (*(_DWORD *)v169)
  {

    if (!v10)
    {
LABEL_36:
      if (!v9) {
        goto LABEL_37;
      }
      goto LABEL_81;
    }
  }
  else if (!v10)
  {
    goto LABEL_36;
  }

  if (!v9)
  {
LABEL_37:
    if (!*(_DWORD *)&v169[4]) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_81:

  if (*(_DWORD *)&v169[4]) {
LABEL_38:
  }

LABEL_39:
  if (HIDWORD(v161))
  {
  }
  if (v161)
  {
  }
  if (*(_DWORD *)&v169[8]) {

  }
  if (HIDWORD(v162))
  {
  }
  if (v162)
  {
  }
  if (LODWORD(v171[2])) {

  }
  if (HIDWORD(v163))
  {
  }
  if (v163)
  {
  }
  if (LODWORD(v171[3])) {

  }
  if (HIDWORD(v164))
  {
  }
  if (v164)
  {
  }
  if (HIDWORD(v171[2])) {

  }
  if (HIDWORD(v165))
  {
  }
  if (v165)
  {
  }
  if (HIDWORD(v171[3])) {

  }
  if (v170)
  {
  }
  return v166;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (HKActivitySummary *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && self->_activitySummaryIndex == v6->_activitySummaryIndex)
      {
        uint64_t v7 = [(HKActivitySummary *)self activeEnergyBurned];
        uint64_t v8 = [(HKActivitySummary *)v6 activeEnergyBurned];
        BOOL v88 = v7 != (void *)v8;
        if (v7 != (void *)v8)
        {
          uint64_t v90 = [(HKActivitySummary *)v6 activeEnergyBurned];
          if (!v90)
          {
            char v11 = 0;

            goto LABEL_96;
          }
          int v9 = [(HKActivitySummary *)self activeEnergyBurned];
          int v10 = [(HKActivitySummary *)v6 activeEnergyBurned];
          if (![v9 isEqual:v10])
          {
            char v11 = 0;
LABEL_56:

LABEL_95:
            goto LABEL_96;
          }
          uint64_t v84 = v10;
          v85 = v9;
        }
        int v12 = [(HKActivitySummary *)self appleMoveTime];
        int v13 = [(HKActivitySummary *)v6 appleMoveTime];
        if (v12 != v13)
        {
          uint64_t v14 = [(HKActivitySummary *)v6 appleMoveTime];
          if (!v14)
          {

            char v11 = 0;
            if (v7 == (void *)v8)
            {
              BOOL v88 = 0;
              goto LABEL_94;
            }
            BOOL v88 = 1;
LABEL_93:

LABEL_94:
            if (v88) {
              goto LABEL_95;
            }
            goto LABEL_96;
          }
          v3 = (void *)v14;
          int v15 = [(HKActivitySummary *)self appleMoveTime];
          uint64_t v82 = [(HKActivitySummary *)v6 appleMoveTime];
          uint64_t v83 = v15;
          if (!objc_msgSend(v15, "isEqual:"))
          {
            char v11 = 0;
            goto LABEL_55;
          }
        }
        uint64_t v16 = [(HKActivitySummary *)self appleExerciseTime];
        [(HKActivitySummary *)v6 appleExerciseTime];
        v87 = uint64_t v86 = (void *)v16;
        BOOL v52 = v16 == (void)v87;
        BOOL v17 = v16 != (void)v87;
        if (v52)
        {
          BOOL v79 = v17;
        }
        else
        {
          uint64_t v18 = [(HKActivitySummary *)v6 appleExerciseTime];
          if (!v18)
          {

            char v11 = 0;
            if (v12 != v13)
            {
              LOBYTE(v24) = 1;
              goto LABEL_90;
            }
            BOOL v24 = 0;
LABEL_99:
            if (!v24) {
              goto LABEL_92;
            }
LABEL_91:

            goto LABEL_92;
          }
          BOOL v79 = v17;
          v76 = (void *)v18;
          int v19 = [(HKActivitySummary *)self appleExerciseTime];
          BOOL v77 = [(HKActivitySummary *)v6 appleExerciseTime];
          BOOL v78 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            char v11 = 0;
            v20 = v86;
            goto LABEL_54;
          }
        }
        int v21 = [(HKActivitySummary *)self appleStandHours];
        v81 = [(HKActivitySummary *)v6 appleStandHours];
        BOOL v75 = v21 != v81;
        if (v21 == v81)
        {
          BOOL v74 = v3;
        }
        else
        {
          uint64_t v22 = [(HKActivitySummary *)v6 appleStandHours];
          if (!v22)
          {

            char v11 = 0;
            v20 = v86;
            if (v86 != v87)
            {
              LOBYTE(v30) = 1;
              goto LABEL_87;
            }
            BOOL v30 = 0;
            goto LABEL_101;
          }
          BOOL v69 = (void *)v22;
          int v23 = [(HKActivitySummary *)self appleStandHours];
          BOOL v70 = [(HKActivitySummary *)v6 appleStandHours];
          uint64_t v71 = v23;
          if (!objc_msgSend(v23, "isEqual:"))
          {
            uint64_t v80 = v21;
            char v11 = 0;
            v20 = v86;
            goto LABEL_53;
          }
          BOOL v74 = v3;
        }
        int v25 = [(HKActivitySummary *)self activeEnergyBurnedGoal];
        uint64_t v72 = [(HKActivitySummary *)v6 activeEnergyBurnedGoal];
        v73 = v25;
        BOOL v26 = v25 != v72;
        uint64_t v80 = v21;
        if (v25 != v72)
        {
          uint64_t v27 = [(HKActivitySummary *)v6 activeEnergyBurnedGoal];
          if (!v27)
          {

            v39 = v21;
            char v11 = 0;
            v3 = v74;
            v20 = v86;
            if (v39 != v81)
            {
              LOBYTE(v75) = 1;
              goto LABEL_84;
            }
            BOOL v75 = 0;
LABEL_103:
            if (!v75)
            {
LABEL_86:

              BOOL v30 = v79;
              if (v20 != v87)
              {
LABEL_87:

                if (!v30) {
                  goto LABEL_89;
                }
                goto LABEL_88;
              }
LABEL_101:
              if (v30) {
LABEL_88:
              }

LABEL_89:
              BOOL v24 = v12 != v13;
              if (v12 != v13)
              {
LABEL_90:

                if (!v24) {
                  goto LABEL_92;
                }
                goto LABEL_91;
              }
              goto LABEL_99;
            }
LABEL_85:

            goto LABEL_86;
          }
          uint64_t v66 = (void *)v27;
          int v28 = [(HKActivitySummary *)self activeEnergyBurnedGoal];
          [(HKActivitySummary *)v6 activeEnergyBurnedGoal];
          int v29 = v67 = v28;
          if (!objc_msgSend(v28, "isEqual:"))
          {
            char v11 = 0;
            v20 = v86;
LABEL_52:

            v3 = v74;
            if (v80 == v81) {
              goto LABEL_86;
            }
LABEL_53:

            if (v20 != v87)
            {
LABEL_54:

              if (v12 != v13)
              {
LABEL_55:

                int v10 = v84;
                int v9 = v85;
                if (v7 != (void *)v8) {
                  goto LABEL_56;
                }
LABEL_96:
                BOOL v53 = (void *)v8;
LABEL_97:

                goto LABEL_98;
              }
LABEL_92:

              if (v7 == (void *)v8) {
                goto LABEL_94;
              }
              goto LABEL_93;
            }
            goto LABEL_89;
          }
          BOOL v63 = v29;
        }
        int v31 = [(HKActivitySummary *)self appleMoveTimeGoal];
        uint64_t v32 = [(HKActivitySummary *)v6 appleMoveTimeGoal];
        BOOL v33 = (void *)v32;
        BOOL v68 = v31;
        if (v31 == (void *)v32)
        {
          uint64_t v64 = (void *)v32;
        }
        else
        {
          uint64_t v34 = [(HKActivitySummary *)v6 appleMoveTimeGoal];
          if (!v34)
          {

            char v11 = 0;
            v20 = v86;
            if (v73 != v72) {
              goto LABEL_78;
            }
            goto LABEL_81;
          }
          BOOL v62 = (void *)v34;
          uint64_t v35 = [(HKActivitySummary *)self appleMoveTimeGoal];
          uint64_t v36 = [(HKActivitySummary *)v6 appleMoveTimeGoal];
          v61 = (void *)v35;
          uint64_t v37 = (void *)v35;
          uint64_t v38 = (void *)v36;
          if (![v37 isEqual:v36])
          {
            char v11 = 0;
            v20 = v86;
LABEL_76:

            if (v73 != v72)
            {
              LOBYTE(v26) = 1;
LABEL_78:

              if (!v26) {
                goto LABEL_83;
              }
LABEL_82:

              goto LABEL_83;
            }
            BOOL v26 = 0;
LABEL_81:
            if (!v26) {
              goto LABEL_83;
            }
            goto LABEL_82;
          }
          uint64_t v60 = v38;
          uint64_t v64 = v33;
        }
        uint64_t v40 = [(HKActivitySummary *)self exerciseTimeGoal];
        uint64_t v41 = [(HKActivitySummary *)v6 exerciseTimeGoal];
        BOOL v65 = (void *)v40;
        BOOL v52 = v40 == v41;
        uint64_t v42 = (void *)v41;
        if (v52)
        {
          [(HKActivitySummary *)self standHoursGoal];
        }
        else
        {
          uint64_t v43 = [(HKActivitySummary *)v6 exerciseTimeGoal];
          if (!v43)
          {
            char v11 = 0;
            goto LABEL_73;
          }
          BOOL v59 = (void *)v43;
          uint64_t v44 = [(HKActivitySummary *)self exerciseTimeGoal];
          v45 = [(HKActivitySummary *)v6 exerciseTimeGoal];
          if (([v44 isEqual:v45] & 1) == 0)
          {

            char v11 = 0;
            goto LABEL_109;
          }
          v57 = v44;
          [(HKActivitySummary *)self standHoursGoal];
        BOOL v46 = };
        uint64_t v47 = [(HKActivitySummary *)v6 standHoursGoal];
        char v11 = v46 == (void *)v47;
        if (v46 == (void *)v47)
        {
        }
        else
        {
          BOOL v58 = (void *)v47;
          uint64_t v48 = [(HKActivitySummary *)v6 standHoursGoal];
          if (v48)
          {
            v89 = v42;
            uint64_t v49 = (void *)v48;
            BOOL v50 = [(HKActivitySummary *)self standHoursGoal];
            uint64_t v51 = [(HKActivitySummary *)v6 standHoursGoal];
            char v11 = [v50 isEqual:v51];

            if (v65 == v89)
            {
            }
            else
            {
            }
LABEL_109:
            if (v68 != v64)
            {
            }
            if (v73 != v72)
            {
            }
            if (v80 != v81)
            {
            }
            if (v86 != v87)
            {
            }
            if (v12 != v13)
            {
            }
            BOOL v53 = v7;
            int v10 = v84;
            int v9 = v85;
            if (v7 == (void *)v8) {
              goto LABEL_97;
            }
            goto LABEL_56;
          }
        }
        if (v65 == v42)
        {

          int v31 = v68;
          BOOL v33 = v64;
          BOOL v52 = v68 == v64;
          v20 = v86;
          goto LABEL_75;
        }

LABEL_73:
        v20 = v86;

        int v31 = v68;
        BOOL v33 = v64;
        BOOL v52 = v68 == v64;
LABEL_75:
        uint64_t v38 = v60;
        if (!v52) {
          goto LABEL_76;
        }

        int v29 = v63;
        if (v73 == v72)
        {
LABEL_83:

          v3 = v74;
          if (v80 != v81)
          {
LABEL_84:

            if (!v75) {
              goto LABEL_86;
            }
            goto LABEL_85;
          }
          goto LABEL_103;
        }
        goto LABEL_52;
      }
    }
    char v11 = 0;
  }
LABEL_98:

  return v11;
}

- (HKQuantity)activeEnergyBurned
{
  activeEnergyBurned = self->_activeEnergyBurned;
  if (activeEnergyBurned)
  {
    v3 = activeEnergyBurned;
  }
  else
  {
    id v4 = +[HKUnit kilocalorieUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)appleExerciseTime
{
  appleExerciseTime = self->_appleExerciseTime;
  if (appleExerciseTime)
  {
    v3 = appleExerciseTime;
  }
  else
  {
    id v4 = +[HKUnit minuteUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)appleStandHours
{
  appleStandHours = self->_appleStandHours;
  if (appleStandHours)
  {
    v3 = appleStandHours;
  }
  else
  {
    id v4 = +[HKUnit countUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)activeEnergyBurnedGoal
{
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if (activeEnergyBurnedGoal)
  {
    v3 = activeEnergyBurnedGoal;
  }
  else
  {
    id v4 = +[HKUnit kilocalorieUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)appleExerciseTimeGoal
{
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if (appleExerciseTimeGoal)
  {
    v3 = appleExerciseTimeGoal;
  }
  else
  {
    id v4 = +[HKUnit minuteUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)appleStandHoursGoal
{
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if (appleStandHoursGoal)
  {
    v3 = appleStandHoursGoal;
  }
  else
  {
    id v4 = +[HKUnit countUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)distanceWalkingRunning
{
  distanceWalkingRunning = self->_distanceWalkingRunning;
  if (distanceWalkingRunning)
  {
    v3 = distanceWalkingRunning;
  }
  else
  {
    id v4 = +[HKUnit meterUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)stepCount
{
  stepCount = self->_stepCount;
  if (stepCount)
  {
    v3 = stepCount;
  }
  else
  {
    id v4 = +[HKUnit countUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)_deepBreathingDuration
{
  deepBreathingDuration = self->_deepBreathingDuration;
  if (deepBreathingDuration)
  {
    v3 = deepBreathingDuration;
  }
  else
  {
    id v4 = +[HKUnit secondUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (NSDate)_startDate
{
  return self->_startDate;
}

- (NSDate)_endDate
{
  return self->_endDate;
}

- (NSDate)_creationDate
{
  return self->_creationDate;
}

- (NSDate)_energyBurnedGoalDate
{
  return self->_energyBurnedGoalDate;
}

- (HKQuantity)_pushCount
{
  pushCount = self->_pushCount;
  if (pushCount)
  {
    v3 = pushCount;
  }
  else
  {
    id v4 = +[HKUnit countUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)_flightsClimbed
{
  flightsClimbed = self->_flightsClimbed;
  if (flightsClimbed)
  {
    v3 = flightsClimbed;
  }
  else
  {
    id v4 = +[HKUnit countUnit];
    v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (int64_t)_wheelchairUse
{
  return self->_wheelchairUse;
}

- (id)description
{
  unint64_t v3 = 0x1E4F29000uLL;
  unint64_t v4 = 0x1E4F28000uLL;
  uint64_t v5 = off_1E58BB000;
  if (+[_HKBehavior isAppleInternalInstall])
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @" Summary Index=(%lli)", -[HKActivitySummary _activitySummaryIndex](self, "_activitySummaryIndex"));
    BOOL v70 = NSString;
    uint64_t v72 = (__CFString *)v6;
    uint64_t v7 = NSNumber;
    BOOL v68 = [(HKActivitySummary *)self stepCount];
    uint64_t v66 = +[HKUnit countUnit];
    [v68 doubleValueForUnit:v66];
    BOOL v58 = objc_msgSend(v7, "numberWithDouble:");
    uint64_t v8 = NSNumber;
    uint64_t v64 = [(HKActivitySummary *)self distanceWalkingRunning];
    BOOL v62 = +[HKUnit meterUnit];
    [v64 doubleValueForUnit:v62];
    BOOL v53 = objc_msgSend(v8, "numberWithDouble:");
    int v9 = NSNumber;
    uint64_t v60 = [(HKActivitySummary *)self _pushCount];
    uint64_t v55 = +[HKUnit countUnit];
    [v60 doubleValueForUnit:v55];
    int v10 = objc_msgSend(v9, "numberWithDouble:");
    char v11 = NSNumber;
    int v12 = [(HKActivitySummary *)self _flightsClimbed];
    int v13 = +[HKUnit countUnit];
    [v12 doubleValueForUnit:v13];
    uint64_t v14 = objc_msgSend(v11, "numberWithDouble:");
    int v15 = NSNumber;
    uint64_t v16 = [(HKActivitySummary *)self _deepBreathingDuration];
    BOOL v17 = +[HKUnit secondUnit];
    [v16 doubleValueForUnit:v17];
    uint64_t v18 = objc_msgSend(v15, "numberWithDouble:");
    [v70 stringWithFormat:@" Step Count=(%@) Meters=(%@) Pushes=(%@) Flights=(%@) Breathe=(%@)", v58, v53, v10, v14, v18, 0];
    uint64_t v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

    unint64_t v3 = 0x1E4F29000;
    unint64_t v4 = 0x1E4F28000;

    uint64_t v5 = off_1E58BB000;
  }
  else
  {
    uint64_t v71 = &stru_1EEC60288;
    uint64_t v72 = &stru_1EEC60288;
  }
  v73.receiver = self;
  v73.super_class = (Class)HKActivitySummary;
  v67 = [(HKActivitySummary *)&v73 description];
  uint64_t v56 = *(void **)(v3 + 24);
  NSInteger v54 = [(NSDateComponents *)self->_dateComponents year];
  NSInteger v52 = [(NSDateComponents *)self->_dateComponents month];
  NSInteger v51 = [(NSDateComponents *)self->_dateComponents day];
  BOOL v69 = objc_msgSend(*(id *)(v4 + 3792), "numberWithInteger:", -[HKActivitySummary activityMoveMode](self, "activityMoveMode"));
  BOOL v19 = [(HKActivitySummary *)self isPaused];
  v20 = @"NO";
  if (v19) {
    v20 = @"YES";
  }
  uint64_t v48 = v20;
  int v21 = *(void **)(v4 + 3792);
  BOOL v65 = [(HKActivitySummary *)self activeEnergyBurned];
  BOOL v63 = [(__objc2_class *)v5[17] kilocalorieUnit];
  [v65 doubleValueForUnit:v63];
  v45 = objc_msgSend(v21, "numberWithDouble:");
  uint64_t v22 = *(void **)(v4 + 3792);
  v61 = [(HKActivitySummary *)self activeEnergyBurnedGoal];
  BOOL v59 = [(__objc2_class *)v5[17] kilocalorieUnit];
  [v61 doubleValueForUnit:v59];
  v39 = objc_msgSend(v22, "numberWithDouble:");
  int v23 = *(void **)(v4 + 3792);
  BOOL v50 = [(HKActivitySummary *)self appleMoveTime];
  uint64_t v49 = [(__objc2_class *)v5[17] minuteUnit];
  [v50 doubleValueForUnit:v49];
  uint64_t v42 = objc_msgSend(v23, "numberWithDouble:");
  BOOL v24 = *(void **)(v4 + 3792);
  uint64_t v47 = [(HKActivitySummary *)self appleMoveTimeGoal];
  BOOL v46 = [(__objc2_class *)v5[17] minuteUnit];
  [v47 doubleValueForUnit:v46];
  uint64_t v38 = objc_msgSend(v24, "numberWithDouble:");
  int v25 = *(void **)(v4 + 3792);
  uint64_t v44 = [(HKActivitySummary *)self appleExerciseTime];
  uint64_t v43 = [(__objc2_class *)v5[17] minuteUnit];
  [v44 doubleValueForUnit:v43];
  BOOL v26 = objc_msgSend(v25, "numberWithDouble:");
  uint64_t v27 = *(void **)(v4 + 3792);
  uint64_t v41 = [(HKActivitySummary *)self exerciseTimeGoal];
  uint64_t v40 = [(__objc2_class *)v5[17] minuteUnit];
  [v41 doubleValueForUnit:v40];
  int v28 = objc_msgSend(v27, "numberWithDouble:");
  int v29 = *(void **)(v4 + 3792);
  BOOL v30 = [(HKActivitySummary *)self appleStandHours];
  int v31 = [(__objc2_class *)v5[17] countUnit];
  [v30 doubleValueForUnit:v31];
  uint64_t v32 = objc_msgSend(v29, "numberWithDouble:");
  BOOL v33 = *(void **)(v4 + 3792);
  uint64_t v34 = [(HKActivitySummary *)self standHoursGoal];
  uint64_t v35 = [(__objc2_class *)v5[17] countUnit];
  [v34 doubleValueForUnit:v35];
  uint64_t v36 = objc_msgSend(v33, "numberWithDouble:");
  v57 = [v56 stringWithFormat:@"<%@: Date=(Year: %zd, Month: %zd, Day: %zd)%@ Move Mode=(%@) Paused=(%@) Active Energy Burned=(%@/%@) Apple Move Minutes=(%@/%@) Apple Exercise Minutes=(%@/%@) Apple Stand Hours=(%@/%@)%@>", v67, v54, v52, v51, v72, v69, v48, v45, v39, v42, v38, v26, v28, v32, v36, v71];

  return v57;
}

- (int64_t)_activitySummaryIndex
{
  return self->_activitySummaryIndex;
}

- (BOOL)_isDataLoading
{
  return self->_dataLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyMoveMinuteStatistics, 0);
  objc_storeStrong((id *)&self->_activeHoursGoalDate, 0);
  objc_storeStrong((id *)&self->_briskMinutesGoalDate, 0);
  objc_storeStrong((id *)&self->_moveTimeGoalDate, 0);
  objc_storeStrong((id *)&self->_energyBurnedGoalDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dailyBriskMinutesStatistics, 0);
  objc_storeStrong((id *)&self->_dailyMoveTimeStatistics, 0);
  objc_storeStrong((id *)&self->_dailyEnergyBurnedStatistics, 0);
  objc_storeStrong((id *)&self->_flightsClimbed, 0);
  objc_storeStrong((id *)&self->_pushCount, 0);
  objc_storeStrong((id *)&self->_deepBreathingDuration, 0);
  objc_storeStrong((id *)&self->_appleStandHoursGoal, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeGoal, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeGoal, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurnedGoal, 0);
  objc_storeStrong((id *)&self->_stepCount, 0);
  objc_storeStrong((id *)&self->_distanceWalkingRunning, 0);
  objc_storeStrong((id *)&self->_appleStandHours, 0);
  objc_storeStrong((id *)&self->_appleExerciseTime, 0);
  objc_storeStrong((id *)&self->_appleMoveTime, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurned, 0);

  objc_storeStrong((id *)&self->_dateComponents, 0);
}

+ (id)_mostSignificantCacheAmongCaches:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hk_filter:", &__block_literal_global_100);
  uint64_t v82 = v5;
  uint64_t v83 = v4;
  if ([v5 count]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;
  uint64_t v8 = [a1 _mostRecentlyCreatedCacheAmongCaches:v7];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v84 objects:v88 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v85 != v13) {
          objc_enumerationMutation(v9);
        }
        int v15 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "energyBurnedGoalDate", v82, v83, (void)v84);
        [v16 timeIntervalSinceReferenceDate];
        double v18 = v17;
        BOOL v19 = [v8 energyBurnedGoalDate];
        [v19 timeIntervalSinceReferenceDate];
        double v21 = v20;

        if (v18 > v21)
        {
          uint64_t v22 = [v15 energyBurnedGoal];
          [v8 _setEnergyBurnedGoalOnly:v22];

          int v23 = [v15 energyBurnedGoalDate];
          [v8 _setEnergyBurnedGoalDateOnly:v23];
        }
        BOOL v24 = [v15 moveMinutesGoalDate];
        [v24 timeIntervalSinceReferenceDate];
        double v26 = v25;
        uint64_t v27 = [v8 moveMinutesGoalDate];
        [v27 timeIntervalSinceReferenceDate];
        double v29 = v28;

        if (v26 > v29)
        {
          BOOL v30 = [v15 moveMinutesGoal];
          [v8 _setMoveMinutesGoalOnly:v30];

          int v31 = [v15 moveMinutesGoalDate];
          [v8 _setMoveMinutesGoalDateOnly:v31];
        }
        uint64_t v32 = [v15 briskMinutesGoalDate];
        [v32 timeIntervalSinceReferenceDate];
        double v34 = v33;
        uint64_t v35 = [v8 briskMinutesGoalDate];
        [v35 timeIntervalSinceReferenceDate];
        double v37 = v36;

        if (v34 > v37)
        {
          uint64_t v38 = [v15 briskMinutesGoal];
          [v8 _setBriskMinutesGoalOnly:v38];

          v39 = [v15 briskMinutesGoalDate];
          [v8 _setBriskMinutesGoalDateOnly:v39];
        }
        uint64_t v40 = [v15 activeHoursGoalDate];
        [v40 timeIntervalSinceReferenceDate];
        double v42 = v41;
        uint64_t v43 = [v8 activeHoursGoalDate];
        [v43 timeIntervalSinceReferenceDate];
        double v45 = v44;

        if (v42 > v45)
        {
          BOOL v46 = [v15 activeHoursGoal];
          [v8 _setActiveHoursGoalOnly:v46];

          uint64_t v47 = [v15 activeHoursGoalDate];
          [v8 _setActiveHoursGoalDateOnly:v47];
        }
        uint64_t v48 = [v15 energyBurned];
        uint64_t v49 = +[HKUnit kilocalorieUnit];
        [v48 doubleValueForUnit:v49];
        double v51 = v50;

        NSInteger v52 = [v8 energyBurned];
        BOOL v53 = +[HKUnit kilocalorieUnit];
        [v52 doubleValueForUnit:v53];
        double v55 = v54;

        if (v51 > v55)
        {
          uint64_t v56 = [v15 energyBurned];
          [v8 _setEnergyBurned:v56];
        }
        [v15 moveMinutes];
        double v58 = v57;
        [v8 moveMinutes];
        if (v58 > v59)
        {
          [v15 moveMinutes];
          objc_msgSend(v8, "_setMoveMinutes:");
        }
        [v15 briskMinutes];
        double v61 = v60;
        [v8 briskMinutes];
        if (v61 > v62)
        {
          [v15 briskMinutes];
          objc_msgSend(v8, "_setBriskMinutes:");
        }
        [v15 activeHours];
        double v64 = v63;
        [v8 activeHours];
        if (v64 > v65)
        {
          [v15 activeHours];
          objc_msgSend(v8, "_setActiveHours:");
        }
        uint64_t v66 = [v15 stepCount];
        if (v66 > [v8 stepCount]) {
          objc_msgSend(v8, "_setStepCount:", objc_msgSend(v15, "stepCount"));
        }
        v67 = [v15 walkingAndRunningDistance];
        BOOL v68 = +[HKUnit meterUnit];
        [v67 doubleValueForUnit:v68];
        double v70 = v69;

        uint64_t v71 = [v8 walkingAndRunningDistance];
        uint64_t v72 = +[HKUnit meterUnit];
        [v71 doubleValueForUnit:v72];
        double v74 = v73;

        if (v70 > v74)
        {
          BOOL v75 = [v15 walkingAndRunningDistance];
          [v8 _setWalkingAndRunningDistance:v75];
        }
        uint64_t v76 = [v15 pushCount];
        if (v76 > [v8 pushCount]) {
          objc_msgSend(v8, "_setPushCount:", objc_msgSend(v15, "pushCount"));
        }
        [v15 deepBreathingDuration];
        double v78 = v77;
        [v8 deepBreathingDuration];
        if (v78 > v79)
        {
          [v15 deepBreathingDuration];
          objc_msgSend(v8, "_setDeepBreathingDuration:");
        }
        uint64_t v80 = [v15 flightsClimbed];
        if (v80 > [v8 flightsClimbed]) {
          objc_msgSend(v8, "_setFlightsClimbed:", objc_msgSend(v15, "flightsClimbed"));
        }
        v12 |= [v15 isPaused];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v84 objects:v88 count:16];
    }
    while (v11);
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  [v8 _setPaused:v12 & 1];

  return v8;
}

- (id)_initWithActivityCache:(id)a3 shouldIncludePrivateProperties:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HKActivitySummary *)self init];
  if (v7)
  {
    uint64_t v8 = +[HKUnit minuteUnit];
    id v9 = +[HKUnit countUnit];
    [v6 moveMinutes];
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
    uint64_t v10 = v36 = v4;
    uint64_t v40 = [v6 moveMinutesGoal];
    [v6 briskMinutes];
    v39 = (void *)v8;
    uint64_t v11 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
    uint64_t v35 = [v6 briskMinutesGoal];
    [v6 activeHours];
    int v12 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9);
    uint64_t v13 = [v6 activeHoursGoal];
    uint64_t v14 = [v6 activityMoveMode];
    uint64_t v15 = [v6 isPaused];
    -[HKActivitySummary _setActivitySummaryIndex:](v7, "_setActivitySummaryIndex:", [v6 cacheIndex]);
    uint64_t v16 = [v6 energyBurned];
    [(HKActivitySummary *)v7 setActiveEnergyBurned:v16];

    [(HKActivitySummary *)v7 setAppleMoveTime:v10];
    uint64_t v38 = (void *)v11;
    [(HKActivitySummary *)v7 setAppleExerciseTime:v11];
    [(HKActivitySummary *)v7 setAppleStandHours:v12];
    double v17 = [v6 energyBurnedGoal];
    [(HKActivitySummary *)v7 setActiveEnergyBurnedGoal:v17];

    [(HKActivitySummary *)v7 setAppleMoveTimeGoal:v40];
    [(HKActivitySummary *)v7 setExerciseTimeGoal:v35];
    [(HKActivitySummary *)v7 setStandHoursGoal:v13];
    [(HKActivitySummary *)v7 setActivityMoveMode:v14];
    [(HKActivitySummary *)v7 setPaused:v15];
    if (v36)
    {
      double v37 = +[HKUnit secondUnit];
      uint64_t v18 = [v6 wheelchairUse];
      BOOL v19 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, (double)[v6 stepCount]);
      [v6 deepBreathingDuration];
      double v34 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v37);
      double v33 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, (double)[v6 pushCount]);
      uint64_t v32 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, (double)[v6 flightsClimbed]);
      double v20 = [v6 walkingAndRunningDistance];
      [(HKActivitySummary *)v7 setDistanceWalkingRunning:v20];

      [(HKActivitySummary *)v7 setStepCount:v19];
      double v21 = [v6 energyBurnedGoalDate];
      [(HKActivitySummary *)v7 _setEnergyBurnedGoalDate:v21];

      uint64_t v22 = [v6 moveMinutesGoalDate];
      [(HKActivitySummary *)v7 _setMoveTimeGoalDate:v22];

      int v23 = [v6 briskMinutesGoalDate];
      [(HKActivitySummary *)v7 _setBriskMinutesGoalDate:v23];

      BOOL v24 = [v6 activeHoursGoalDate];
      [(HKActivitySummary *)v7 _setActiveHoursGoalDate:v24];

      double v25 = [v6 startDate];
      [(HKActivitySummary *)v7 _setStartDate:v25];

      double v26 = [v6 endDate];
      [(HKActivitySummary *)v7 _setEndDate:v26];

      [(HKActivitySummary *)v7 _setDeepBreathingDuration:v34];
      [(HKActivitySummary *)v7 _setPushCount:v33];
      [(HKActivitySummary *)v7 _setWheelchairUse:v18];
      [(HKActivitySummary *)v7 _setFlightsClimbed:v32];
      uint64_t v27 = [v6 _creationDate];
      [(HKActivitySummary *)v7 _setCreationDate:v27];

      double v28 = [v6 dailyEnergyBurnedStatistics];
      [(HKActivitySummary *)v7 _setDailyEnergyBurnedStatistics:v28];

      double v29 = [v6 dailyMoveMinutesStatistics];
      [(HKActivitySummary *)v7 _setDailyMoveTimeStatistics:v29];

      BOOL v30 = [v6 dailyBriskMinutesStatistics];
      [(HKActivitySummary *)v7 _setDailyBriskMinutesStatistics:v30];
    }
  }

  return v7;
}

- (void)setActiveEnergyBurned:(HKQuantity *)activeEnergyBurned
{
  BOOL v4 = activeEnergyBurned;
  uint64_t v5 = +[HKUnit kilocalorieUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"activeEnergyBurned"];

  id v6 = self->_activeEnergyBurned;
  self->_activeEnergyBurned = v4;
}

- (void)_validateQuantityAssignment:(id)a3 expectedUnit:(id)a4 propertyName:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v14 && ([v14 isCompatibleWithUnit:v7] & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = [v7 unitString];
    int v12 = [v14 _unit];
    uint64_t v13 = [v12 unitString];
    [v9 raise:v10, @"%@ expects units compatible with %@, received %@", v8, v11, v13 format];
  }
}

- (void)setAppleExerciseTime:(HKQuantity *)appleExerciseTime
{
  BOOL v4 = appleExerciseTime;
  uint64_t v5 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"appleExerciseTime"];

  id v6 = self->_appleExerciseTime;
  self->_appleExerciseTime = v4;
}

- (void)setAppleStandHours:(HKQuantity *)appleStandHours
{
  BOOL v4 = appleStandHours;
  uint64_t v5 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"appleStandHours"];

  id v6 = self->_appleStandHours;
  self->_appleStandHours = v4;
}

- (void)setActiveEnergyBurnedGoal:(HKQuantity *)activeEnergyBurnedGoal
{
  BOOL v4 = activeEnergyBurnedGoal;
  uint64_t v5 = +[HKUnit kilocalorieUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"activeEnergyBurnedGoal"];

  id v6 = self->_activeEnergyBurnedGoal;
  self->_activeEnergyBurnedGoal = v4;
}

- (void)setAppleExerciseTimeGoal:(HKQuantity *)appleExerciseTimeGoal
{
  BOOL v4 = appleExerciseTimeGoal;
  uint64_t v5 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"briskMinutesGoal"];

  id v6 = self->_appleExerciseTimeGoal;
  self->_appleExerciseTimeGoal = v4;
}

- (void)setAppleStandHoursGoal:(HKQuantity *)appleStandHoursGoal
{
  BOOL v4 = appleStandHoursGoal;
  uint64_t v5 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"activeHoursGoal"];

  id v6 = self->_appleStandHoursGoal;
  self->_appleStandHoursGoal = v4;
}

- (void)setDistanceWalkingRunning:(id)a3
{
  BOOL v4 = (HKQuantity *)a3;
  uint64_t v5 = +[HKUnit meterUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"distanceWalkingRunning"];

  distanceWalkingRunning = self->_distanceWalkingRunning;
  self->_distanceWalkingRunning = v4;
}

- (void)setStepCount:(id)a3
{
  BOOL v4 = (HKQuantity *)a3;
  uint64_t v5 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"stepCount"];

  stepCount = self->_stepCount;
  self->_stepCount = v4;
}

- (void)_setEnergyBurnedGoalDate:(id)a3
{
}

- (void)_setStartDate:(id)a3
{
}

- (void)_setEndDate:(id)a3
{
}

- (void)_setDeepBreathingDuration:(id)a3
{
  BOOL v4 = (HKQuantity *)a3;
  uint64_t v5 = +[HKUnit secondUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"deepBreathingDuration"];

  deepBreathingDuration = self->_deepBreathingDuration;
  self->_deepBreathingDuration = v4;
}

- (void)_setPushCount:(id)a3
{
  BOOL v4 = (HKQuantity *)a3;
  uint64_t v5 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"pushCount"];

  pushCount = self->_pushCount;
  self->_pushCount = v4;
}

- (void)_setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
}

- (void)_setFlightsClimbed:(id)a3
{
  BOOL v4 = (HKQuantity *)a3;
  uint64_t v5 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"flightsClimbed"];

  flightsClimbed = self->_flightsClimbed;
  self->_flightsClimbed = v4;
}

- (void)_setCreationDate:(id)a3
{
}

- (void)_setDailyEnergyBurnedStatistics:(id)a3
{
}

- (void)_setDailyBriskMinutesStatistics:(id)a3
{
}

- (NSDateComponents)_gregorianDateComponents
{
  unint64_t v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  BOOL v4 = [(HKActivitySummary *)self dateComponentsForCalendar:v3];

  return (NSDateComponents *)v4;
}

- (NSDateComponents)dateComponentsForCalendar:(NSCalendar *)calendar
{
  BOOL v4 = calendar;
  uint64_t v5 = v4;
  if (self->_dateComponents)
  {
    id v6 = [(NSCalendar *)v4 calendarIdentifier];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F1C318]];

    dateComponents = self->_dateComponents;
    if (v7)
    {
      id v9 = dateComponents;
    }
    else
    {
      id v9 = [(NSDateComponents *)dateComponents hk_translateDateComponentsToCalendar:v5 calendarUnits:30];
    }
  }
  else
  {
    id v9 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  }
  uint64_t v10 = v9;

  return v10;
}

- (double)_activeEnergyCompletionPercentage
{
  activeEnergyBurned = self->_activeEnergyBurned;
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  uint64_t v5 = +[HKUnit kilocalorieUnit];
  [(HKActivitySummary *)self _percentageCompleteWithQuantity:activeEnergyBurned goalQuantity:activeEnergyBurnedGoal unit:v5];
  double v7 = v6;

  return v7;
}

- (double)_percentageCompleteWithQuantity:(id)a3 goalQuantity:(id)a4 unit:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [a4 doubleValueForUnit:v8];
  double v10 = v9;
  double v11 = 0.0;
  if (v9 >= 0.00000011920929)
  {
    [v7 doubleValueForUnit:v8];
    double v11 = v12 / v10;
  }

  return v11;
}

- (double)_exerciseTimeCompletionPercentage
{
  appleExerciseTime = self->_appleExerciseTime;
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  uint64_t v5 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _percentageCompleteWithQuantity:appleExerciseTime goalQuantity:appleExerciseTimeGoal unit:v5];
  double v7 = v6;

  return v7;
}

- (double)_standHoursCompletionPercentage
{
  appleStandHours = self->_appleStandHours;
  appleStandHoursGoal = self->_appleStandHoursGoal;
  uint64_t v5 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _percentageCompleteWithQuantity:appleStandHours goalQuantity:appleStandHoursGoal unit:v5];
  double v7 = v6;

  return v7;
}

- (NSArray)_dailyEnergyBurnedStatistics
{
  if (self->_dailyEnergyBurnedStatistics) {
    return self->_dailyEnergyBurnedStatistics;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)_dailyBriskMinutesStatistics
{
  if (self->_dailyBriskMinutesStatistics) {
    return self->_dailyBriskMinutesStatistics;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)_setGregorianDateComponents:(id)a3
{
  id v4 = a3;
  id v7 = 0;
  char v5 = [(id)objc_opt_class() _validateActivitySummaryDateComponents:v4 errorMessage:&v7];
  id v6 = v7;
  if (v5) {
    [(HKActivitySummary *)self _setActivitySummaryIndex:_HKCacheIndexFromDateComponents(v4)];
  }
  else {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@", v6 format];
  }
}

+ (BOOL)_validateActivitySummaryDateComponents:(id)a3 errorMessage:(id *)a4
{
  id v5 = a3;
  if ([v5 year] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v5 month] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        id v6 = NSString;
        uint64_t v15 = "";
        id v7 = "month";
        goto LABEL_10;
      }
LABEL_46:
      BOOL v9 = 0;
      goto LABEL_47;
    }
    if ([v5 day] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        id v6 = NSString;
        uint64_t v15 = "";
        id v7 = "day";
        goto LABEL_10;
      }
      goto LABEL_46;
    }
    if ([v5 hour] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v5 minute] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v5 second] == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v5 nanosecond] == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v5 weekday] == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ([v5 weekdayOrdinal] == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ([v5 quarter] == 0x7FFFFFFFFFFFFFFFLL)
                {
                  if ([v5 weekOfMonth] == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if ([v5 weekOfYear] == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      if ([v5 yearForWeekOfYear] == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        uint64_t v10 = [v5 calendar];
                        double v11 = [v5 calendar];

                        if (v11)
                        {
                          double v12 = (void *)v10;
                          if ([v5 isValidDateInCalendar:v10])
                          {
                            BOOL v9 = 1;
LABEL_54:

                            goto LABEL_47;
                          }
                          if (a4)
                          {
                            id v14 = @"Date components must represent a valid date.";
                            goto LABEL_52;
                          }
                        }
                        else
                        {
                          double v12 = (void *)v10;
                          if (a4)
                          {
                            id v14 = @"Date components require a calendar.";
LABEL_52:
                            BOOL v9 = 0;
                            *a4 = v14;
                            goto LABEL_54;
                          }
                        }
                        BOOL v9 = 0;
                        goto LABEL_54;
                      }
                      if (!a4) {
                        goto LABEL_46;
                      }
                      id v6 = NSString;
                      uint64_t v15 = "not ";
                      id v7 = "yearForWeekOfYear";
                    }
                    else
                    {
                      if (!a4) {
                        goto LABEL_46;
                      }
                      id v6 = NSString;
                      uint64_t v15 = "not ";
                      id v7 = "weekOfYear";
                    }
                  }
                  else
                  {
                    if (!a4) {
                      goto LABEL_46;
                    }
                    id v6 = NSString;
                    uint64_t v15 = "not ";
                    id v7 = "weekOfMonth";
                  }
                }
                else
                {
                  if (!a4) {
                    goto LABEL_46;
                  }
                  id v6 = NSString;
                  uint64_t v15 = "not ";
                  id v7 = "quarter";
                }
              }
              else
              {
                if (!a4) {
                  goto LABEL_46;
                }
                id v6 = NSString;
                uint64_t v15 = "not ";
                id v7 = "weekdayOrdinal";
              }
            }
            else
            {
              if (!a4) {
                goto LABEL_46;
              }
              id v6 = NSString;
              uint64_t v15 = "not ";
              id v7 = "weekday";
            }
          }
          else
          {
            if (!a4) {
              goto LABEL_46;
            }
            id v6 = NSString;
            uint64_t v15 = "not ";
            id v7 = "nanosecond";
          }
        }
        else
        {
          if (!a4) {
            goto LABEL_46;
          }
          id v6 = NSString;
          uint64_t v15 = "not ";
          id v7 = "second";
        }
      }
      else
      {
        if (!a4) {
          goto LABEL_46;
        }
        id v6 = NSString;
        uint64_t v15 = "not ";
        id v7 = "minute";
      }
    }
    else
    {
      if (!a4) {
        goto LABEL_46;
      }
      id v6 = NSString;
      uint64_t v15 = "not ";
      id v7 = "hour";
    }
    id v8 = "";
    goto LABEL_11;
  }
  if (!a4) {
    goto LABEL_46;
  }
  id v6 = NSString;
  uint64_t v15 = "";
  id v7 = "year";
LABEL_10:
  id v8 = "a valid ";
LABEL_11:
  objc_msgSend(v6, "stringWithFormat:", @"Activity summary date components require %s%s to %sbe set.", v8, v7, v15);
  BOOL v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

  return v9;
}

- (HKActivitySummary)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKActivitySummary;
  result = [(HKActivitySummary *)&v3 init];
  if (result)
  {
    result->_activityMoveMode = 1;
    result->_paused = 0;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_activitySummaryIndex;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKActivitySummary)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKActivitySummary *)self init];
  if (v5)
  {
    -[HKActivitySummary _setActivitySummaryIndex:](v5, "_setActivitySummaryIndex:", [v4 decodeInt64ForKey:@"index"]);
    uint64_t v6 = objc_opt_class();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    BOOL v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = +[HKUnit kilocalorieUnit];
    uint64_t v11 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"activeEnergy" unit:v10];
    activeEnergyBurned = v5->_activeEnergyBurned;
    v5->_activeEnergyBurned = (HKQuantity *)v11;

    uint64_t v13 = +[HKUnit minuteUnit];
    uint64_t v14 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"moveTime" unit:v13];
    appleMoveTime = v5->_appleMoveTime;
    v5->_appleMoveTime = (HKQuantity *)v14;

    uint64_t v16 = +[HKUnit minuteUnit];
    uint64_t v17 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"exerciseTime" unit:v16];
    appleExerciseTime = v5->_appleExerciseTime;
    v5->_appleExerciseTime = (HKQuantity *)v17;

    BOOL v19 = +[HKUnit countUnit];
    uint64_t v20 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"standHours" unit:v19];
    appleStandHours = v5->_appleStandHours;
    v5->_appleStandHours = (HKQuantity *)v20;

    uint64_t v22 = +[HKUnit meterUnit];
    uint64_t v23 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"distanceWalking" unit:v22];
    distanceWalkingRunning = v5->_distanceWalkingRunning;
    v5->_distanceWalkingRunning = (HKQuantity *)v23;

    double v25 = +[HKUnit countUnit];
    uint64_t v26 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"stepCount" unit:v25];
    stepCount = v5->_stepCount;
    v5->_stepCount = (HKQuantity *)v26;

    double v28 = +[HKUnit kilocalorieUnit];
    uint64_t v29 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"energyBurnedGoal" unit:v28];
    activeEnergyBurnedGoal = v5->_activeEnergyBurnedGoal;
    v5->_activeEnergyBurnedGoal = (HKQuantity *)v29;

    int v31 = +[HKUnit minuteUnit];
    uint64_t v32 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"moveMinutesGoal" unit:v31];
    appleMoveTimeGoal = v5->_appleMoveTimeGoal;
    v5->_appleMoveTimeGoal = (HKQuantity *)v32;

    double v34 = +[HKUnit countUnit];
    uint64_t v35 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"activeHoursGoal" unit:v34];
    appleStandHoursGoal = v5->_appleStandHoursGoal;
    v5->_appleStandHoursGoal = (HKQuantity *)v35;

    double v37 = +[HKUnit minuteUnit];
    uint64_t v38 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"briskMinutesGoal" unit:v37];
    appleExerciseTimeGoal = v5->_appleExerciseTimeGoal;
    v5->_appleExerciseTimeGoal = (HKQuantity *)v38;

    uint64_t v40 = +[HKUnit secondUnit];
    uint64_t v41 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"deepBreathingDuration" unit:v40];
    deepBreathingDuration = v5->_deepBreathingDuration;
    v5->_deepBreathingDuration = (HKQuantity *)v41;

    uint64_t v43 = +[HKUnit countUnit];
    uint64_t v44 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"pushCount" unit:v43];
    pushCount = v5->_pushCount;
    v5->_pushCount = (HKQuantity *)v44;

    BOOL v46 = +[HKUnit countUnit];
    uint64_t v47 = [(HKActivitySummary *)v5 _decodeQuantityFromCoder:v4 forKey:@"flightsClimbed" unit:v46];
    flightsClimbed = v5->_flightsClimbed;
    v5->_flightsClimbed = (HKQuantity *)v47;

    v5->_wheelchairUse = [v4 decodeIntegerForKey:@"wheelchairUse"];
    uint64_t v49 = [v4 decodeObjectOfClasses:v9 forKey:@"dailyEnergyBurnedStatistics"];
    dailyEnergyBurnedStatistics = v5->_dailyEnergyBurnedStatistics;
    v5->_dailyEnergyBurnedStatistics = (NSArray *)v49;

    uint64_t v51 = [v4 decodeObjectOfClasses:v9 forKey:@"dailyMoveMinutesStatistics"];
    dailyMoveTimeStatistics = v5->_dailyMoveTimeStatistics;
    v5->_dailyMoveTimeStatistics = (NSArray *)v51;

    uint64_t v53 = [v4 decodeObjectOfClasses:v9 forKey:@"dailyBriskMinutesStatistics"];
    dailyBriskMinutesStatistics = v5->_dailyBriskMinutesStatistics;
    v5->_dailyBriskMinutesStatistics = (NSArray *)v53;

    v5->_dataLoading = [v4 decodeBoolForKey:@"dataLoading"];
    uint64_t v55 = [v4 decodeObjectOfClass:v6 forKey:@"energyBurnedGoalDate"];
    energyBurnedGoalDate = v5->_energyBurnedGoalDate;
    v5->_energyBurnedGoalDate = (NSDate *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:v6 forKey:@"moveTimeGoalDate"];
    moveTimeGoalDate = v5->_moveTimeGoalDate;
    v5->_moveTimeGoalDate = (NSDate *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:v6 forKey:@"briskMinutesGoalDate"];
    briskMinutesGoalDate = v5->_briskMinutesGoalDate;
    v5->_briskMinutesGoalDate = (NSDate *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:v6 forKey:@"activeHoursGoalDate"];
    activeHoursGoalDate = v5->_activeHoursGoalDate;
    v5->_activeHoursGoalDate = (NSDate *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:v6 forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:v6 forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:v6 forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v67;

    v5->_activityMoveMode = [v4 decodeIntegerForKey:@"activityMoveMode"];
    v5->_paused = [v4 decodeBoolForKey:@"paused"];
  }
  return v5;
}

- (id)_decodeQuantityFromCoder:(id)a3 forKey:(id)a4 unit:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 containsValueForKey:v8])
  {
    [v7 decodeDoubleForKey:v8];
    uint64_t v10 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (HKQuantity)appleMoveTime
{
  appleMoveTime = self->_appleMoveTime;
  if (appleMoveTime)
  {
    objc_super v3 = appleMoveTime;
  }
  else
  {
    id v4 = +[HKUnit minuteUnit];
    objc_super v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)appleMoveTimeGoal
{
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if (appleMoveTimeGoal)
  {
    objc_super v3 = appleMoveTimeGoal;
  }
  else
  {
    id v4 = +[HKUnit minuteUnit];
    objc_super v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
  }

  return v3;
}

- (HKQuantity)exerciseTimeGoal
{
  return self->_appleExerciseTimeGoal;
}

- (HKQuantity)standHoursGoal
{
  return self->_appleStandHoursGoal;
}

- (NSArray)_dailyMoveTimeStatistics
{
  if (self->_dailyMoveTimeStatistics) {
    return self->_dailyMoveTimeStatistics;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)_hasEnergyBurnedGoal
{
  v2 = [(HKActivitySummary *)self activeEnergyBurnedGoal];
  objc_super v3 = +[HKUnit kilocalorieUnit];
  id v4 = +[HKQuantity quantityWithUnit:v3 doubleValue:0.0];
  BOOL v5 = [v2 compare:v4] == 1;

  return v5;
}

- (BOOL)_hasAppleMoveTimeGoal
{
  v2 = [(HKActivitySummary *)self appleMoveTimeGoal];
  objc_super v3 = +[HKUnit minuteUnit];
  id v4 = +[HKQuantity quantityWithUnit:v3 doubleValue:0.0];
  BOOL v5 = [v2 compare:v4] == 1;

  return v5;
}

- (BOOL)_hasExerciseGoal
{
  v2 = [(HKActivitySummary *)self exerciseTimeGoal];
  objc_super v3 = +[HKUnit minuteUnit];
  id v4 = +[HKQuantity quantityWithUnit:v3 doubleValue:0.0];
  BOOL v5 = [v2 compare:v4] == 1;

  return v5;
}

- (BOOL)_hasStandHoursGoal
{
  v2 = [(HKActivitySummary *)self standHoursGoal];
  objc_super v3 = +[HKUnit countUnit];
  id v4 = +[HKQuantity quantityWithUnit:v3 doubleValue:0.0];
  BOOL v5 = [v2 compare:v4] == 1;

  return v5;
}

- (HKActivityMoveMode)activityMoveMode
{
  return self->_activityMoveMode;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)paused
{
  return self->_paused;
}

- (BOOL)_useHourlyGoalComparison
{
  return 0;
}

- (BOOL)_isStandalonePhoneSummary
{
  objc_super v3 = [(HKActivitySummary *)self exerciseTimeGoal];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v5 = [(HKActivitySummary *)self standHoursGoal];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)setAppleMoveTime:(HKQuantity *)appleMoveTime
{
  BOOL v4 = appleMoveTime;
  BOOL v5 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"appleMoveTime"];

  uint64_t v6 = self->_appleMoveTime;
  self->_appleMoveTime = v4;
}

- (void)setAppleMoveTimeGoal:(HKQuantity *)appleMoveTimeGoal
{
  BOOL v4 = appleMoveTimeGoal;
  BOOL v5 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"appleMoveTimeGoal"];

  uint64_t v6 = self->_appleMoveTimeGoal;
  self->_appleMoveTimeGoal = v4;
}

- (void)setExerciseTimeGoal:(HKQuantity *)exerciseTimeGoal
{
  BOOL v4 = exerciseTimeGoal;
  BOOL v5 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"exerciseTimeGoal"];

  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  self->_appleExerciseTimeGoal = v4;
}

- (void)setStandHoursGoal:(HKQuantity *)standHoursGoal
{
  BOOL v4 = standHoursGoal;
  BOOL v5 = +[HKUnit countUnit];
  [(HKActivitySummary *)self _validateQuantityAssignment:v4 expectedUnit:v5 propertyName:@"standHoursGoal"];

  appleStandHoursGoal = self->_appleStandHoursGoal;
  self->_appleStandHoursGoal = v4;
}

- (void)setActivityMoveMode:(HKActivityMoveMode)activityMoveMode
{
  self->_activityMoveMode = activityMoveMode;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void)setDeprecatedPauseForInternalSwiftClient:(BOOL)a3
{
  self->_paused = a3;
}

+ (BOOL)_validateActivitySummaryDateComponentsRange:(id)a3 endDateComponents:(id)a4 errorMessage:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v22 = 0;
  BOOL v9 = +[HKActivitySummary _validateActivitySummaryDateComponents:v7 errorMessage:&v22];
  id v10 = v22;
  if (v9)
  {
    id v21 = v10;
    BOOL v11 = +[HKActivitySummary _validateActivitySummaryDateComponents:v8 errorMessage:&v21];
    id v12 = v21;

    if (v11)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      uint64_t v14 = (void *)[v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      uint64_t v15 = objc_msgSend(v7, "hk_translateDateComponentsToCalendar:calendarUnits:", v14, 30);

      uint64_t v16 = objc_msgSend(v8, "hk_translateDateComponentsToCalendar:calendarUnits:", v14, 30);

      uint64_t v17 = [v14 dateFromComponents:v16];
      uint64_t v18 = [v14 dateFromComponents:v15];
      if (v17 && objc_msgSend(v17, "hk_isBeforeDate:", v18))
      {
        BOOL v19 = 0;
        if (a5) {
          *a5 = @"Start date must be earlier than end date.";
        }
      }
      else
      {
        BOOL v19 = 1;
      }

      id v8 = (id)v16;
      id v7 = (id)v15;
    }
    else if (a5)
    {
      [NSString stringWithFormat:@"endDateComponents: %@", v12];
      BOOL v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    if (a5)
    {
      [NSString stringWithFormat:@"startDateComponents: %@", v10];
      BOOL v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v19 = 0;
    }
    id v12 = v10;
  }

  return v19;
}

- (double)_moveMinutesCompletionPercentage
{
  appleMoveTime = self->_appleMoveTime;
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  BOOL v5 = +[HKUnit minuteUnit];
  [(HKActivitySummary *)self _percentageCompleteWithQuantity:appleMoveTime goalQuantity:appleMoveTimeGoal unit:v5];
  double v7 = v6;

  return v7;
}

BOOL __54__HKActivitySummary__mostSignificantCacheAmongCaches___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 briskMinutesGoal];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [v2 activeHoursGoal];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

+ (id)_mostRecentlyCreatedCacheAmongCaches:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v6)
        {
          id v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) _creationDate];
          [v10 timeIntervalSinceReferenceDate];
          double v12 = v11;
          id v13 = [v6 _creationDate];
          [v13 timeIntervalSinceReferenceDate];
          double v15 = v14;

          if (v12 > v15)
          {
            id v16 = v9;

            id v6 = v16;
          }
        }
        else
        {
          id v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSDate)_moveTimeGoalDate
{
  return self->_moveTimeGoalDate;
}

- (void)_setMoveTimeGoalDate:(id)a3
{
}

- (NSDate)_briskMinutesGoalDate
{
  return self->_briskMinutesGoalDate;
}

- (void)_setBriskMinutesGoalDate:(id)a3
{
}

- (NSDate)_activeHoursGoalDate
{
  return self->_activeHoursGoalDate;
}

- (void)_setActiveHoursGoalDate:(id)a3
{
}

- (void)_setDailyMoveMinutesStatistics:(id)a3
{
}

- (void)_setDailyMoveTimeStatistics:(id)a3
{
}

- (void)_setDataLoading:(BOOL)a3
{
  self->_dataLoading = a3;
}

@end
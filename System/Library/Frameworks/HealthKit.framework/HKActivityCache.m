@interface HKActivityCache
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (id)_activityCacheWithStartDate:(id)a3 endDate:(id)a4 dateComponents:(id)a5 sequence:(int64_t)a6 energyBurned:(id)a7 energyBurnedGoal:(id)a8 walkingAndRunningDistance:(id)a9 metadata:(id)a10;
+ (id)_activityCacheWithStartDate:(id)a3 endDate:(id)a4 dateComponents:(id)a5 sequence:(int64_t)a6 metadata:(id)a7;
+ (id)_activityCacheWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 dateComponents:(id)a6 sequence:(int64_t)a7;
- (BOOL)_isEqualToActivityCache:(id)a3;
- (BOOL)hasActiveHours;
- (BOOL)hasActiveHoursGoal;
- (BOOL)hasActiveHoursGoalDate;
- (BOOL)hasBriskMinutes;
- (BOOL)hasBriskMinutesGoal;
- (BOOL)hasBriskMinutesGoalDate;
- (BOOL)hasDailyBriskMinutesStatistics;
- (BOOL)hasDailyEnergyBurnedStatistics;
- (BOOL)hasDailyMoveMinutesStatistics;
- (BOOL)hasDateComponents;
- (BOOL)hasDeepBreathingDuration;
- (BOOL)hasEnergyBurned;
- (BOOL)hasEnergyBurnedGoal;
- (BOOL)hasFlightsClimbed;
- (BOOL)hasMoveMinutes;
- (BOOL)hasMoveMinutesGoal;
- (BOOL)hasPushCount;
- (BOOL)hasStepCount;
- (BOOL)hasWalkingAndRunningDistance;
- (BOOL)hasWheelchairUse;
- (BOOL)isPaused;
- (HKActivityCache)initWithCoder:(id)a3;
- (HKQuantity)activeHoursGoal;
- (HKQuantity)briskMinutesGoal;
- (HKQuantity)energyBurned;
- (HKQuantity)energyBurnedGoal;
- (HKQuantity)moveMinutesGoal;
- (HKQuantity)walkingAndRunningDistance;
- (NSArray)dailyBriskMinutesStatistics;
- (NSArray)dailyEnergyBurnedStatistics;
- (NSArray)dailyMoveMinutesStatistics;
- (NSDate)activeHoursGoalDate;
- (NSDate)briskMinutesGoalDate;
- (NSDate)energyBurnedGoalDate;
- (NSDate)moveMinutesGoalDate;
- (NSDateComponents)dateComponents;
- (double)_activeHoursGoalCount;
- (double)_briskMinutesGoalInMinutes;
- (double)_energyBurnedGoalInKilocalories;
- (double)_energyBurnedInKilocalories;
- (double)_moveMinutesGoalInMinutes;
- (double)_walkingAndRunningDistanceInMeters;
- (double)activeHours;
- (double)activeHoursGoalPercentage;
- (double)briskMinutes;
- (double)briskMinutesGoalPercentage;
- (double)deepBreathingDuration;
- (double)energyBurnedGoalPercentage;
- (double)moveMinutes;
- (double)moveMinutesGoalPercentage;
- (id)_fallbackActiveHoursGoal;
- (id)_fallbackBriskMinutesGoal;
- (id)_valueDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)activityMoveMode;
- (int64_t)cacheIndex;
- (int64_t)flightsClimbed;
- (int64_t)pushCount;
- (int64_t)sequence;
- (int64_t)stepCount;
- (int64_t)version;
- (int64_t)wheelchairUse;
- (unint64_t)knownFields;
- (void)_setActiveHours:(double)a3;
- (void)_setActiveHoursGoal:(id)a3;
- (void)_setActiveHoursGoal:(id)a3 date:(id)a4;
- (void)_setActiveHoursGoalDateOnly:(id)a3;
- (void)_setActiveHoursGoalOnly:(id)a3;
- (void)_setActivityMoveMode:(int64_t)a3;
- (void)_setBriskMinutes:(double)a3;
- (void)_setBriskMinutesGoal:(id)a3;
- (void)_setBriskMinutesGoal:(id)a3 date:(id)a4;
- (void)_setBriskMinutesGoalDateOnly:(id)a3;
- (void)_setBriskMinutesGoalOnly:(id)a3;
- (void)_setCacheIndex:(int64_t)a3;
- (void)_setDailyBriskMinutesStatistics:(id)a3;
- (void)_setDailyEnergyBurnedStatistics:(id)a3;
- (void)_setDailyMoveMinutesStatistics:(id)a3;
- (void)_setDeepBreathingDuration:(double)a3;
- (void)_setEnergyBurned:(id)a3;
- (void)_setEnergyBurnedGoal:(id)a3;
- (void)_setEnergyBurnedGoal:(id)a3 date:(id)a4;
- (void)_setEnergyBurnedGoalDateOnly:(id)a3;
- (void)_setEnergyBurnedGoalOnly:(id)a3;
- (void)_setFlightsClimbed:(int64_t)a3;
- (void)_setMoveMinutes:(double)a3;
- (void)_setMoveMinutesGoal:(id)a3;
- (void)_setMoveMinutesGoal:(id)a3 date:(id)a4;
- (void)_setMoveMinutesGoalDateOnly:(id)a3;
- (void)_setMoveMinutesGoalOnly:(id)a3;
- (void)_setPaused:(BOOL)a3;
- (void)_setPushCount:(int64_t)a3;
- (void)_setSequence:(int64_t)a3;
- (void)_setStepCount:(int64_t)a3;
- (void)_setVersion:(int64_t)a3;
- (void)_setWalkingAndRunningDistance:(id)a3;
- (void)_setWheelchairUse:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
@end

@implementation HKActivityCache

- (int64_t)cacheIndex
{
  return self->_cacheIndex;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKActivityCache;
  [(HKSample *)&v5 encodeWithCoder:v4];
  [v4 encodeInt64:self->_cacheIndex forKey:@"cacheIndex"];
  [v4 encodeInt64:self->_sequence forKey:@"sequence"];
  [v4 encodeObject:self->_energyBurned forKey:@"energyBurned"];
  [v4 encodeObject:self->_energyBurnedGoal forKey:@"energyBurnedGoal"];
  [v4 encodeObject:self->_energyBurnedGoalDate forKey:@"energyBurnedGoalDate"];
  [v4 encodeDouble:@"moveMinutes" forKey:self->_moveMinutes];
  [v4 encodeObject:self->_moveMinutesGoal forKey:@"moveMinutesGoalQuantity"];
  [v4 encodeObject:self->_moveMinutesGoalDate forKey:@"moveMinutesGoalDate"];
  if ([(HKActivityCache *)self hasBriskMinutes]) {
    [v4 encodeDouble:@"briskMinutes" forKey:self->_briskMinutes];
  }
  if ([(HKActivityCache *)self hasBriskMinutesGoal]) {
    [v4 encodeObject:self->_briskMinutesGoal forKey:@"briskMinutesGoalQuantity"];
  }
  if ([(HKActivityCache *)self hasBriskMinutesGoalDate]) {
    [v4 encodeObject:self->_briskMinutesGoalDate forKey:@"briskMinutesGoalDate"];
  }
  if ([(HKActivityCache *)self hasActiveHours]) {
    [v4 encodeDouble:@"activeHours" forKey:self->_activeHours];
  }
  if ([(HKActivityCache *)self hasActiveHoursGoal]) {
    [v4 encodeObject:self->_activeHoursGoal forKey:@"activeHoursGoalQuantity"];
  }
  if ([(HKActivityCache *)self hasActiveHoursGoalDate]) {
    [v4 encodeObject:self->_activeHoursGoalDate forKey:@"activeHoursGoalDate"];
  }
  if ([(HKActivityCache *)self hasStepCount]) {
    [v4 encodeInteger:self->_stepCount forKey:@"stepCount"];
  }
  if ([(HKActivityCache *)self hasPushCount]) {
    [v4 encodeInteger:self->_pushCount forKey:@"pushCount"];
  }
  if ([(HKActivityCache *)self hasWheelchairUse]) {
    [v4 encodeInteger:self->_wheelchairUse forKey:@"wheelchairUse"];
  }
  if ([(HKActivityCache *)self hasDeepBreathingDuration]) {
    [v4 encodeDouble:@"deepBreathingDuration" forKey:self->_deepBreathingDuration];
  }
  if ([(HKActivityCache *)self hasFlightsClimbed]) {
    [v4 encodeInteger:self->_flightsClimbed forKey:@"flightsClimbed"];
  }
  [v4 encodeObject:self->_walkingAndRunningDistance forKey:@"walkRunDistance"];
  [v4 encodeObject:self->_dailyEnergyBurnedStatistics forKey:@"dailyEnergyBurnedStatistics"];
  [v4 encodeObject:self->_dailyBriskMinutesStatistics forKey:@"dailyBriskMinutesStatistics"];
  [v4 encodeInteger:self->_activityMoveMode forKey:@"activityMoveMode"];
  [v4 encodeBool:self->_paused forKey:@"paused"];
  [v4 encodeInteger:self->_version forKey:@"version"];
}

- (BOOL)hasBriskMinutes
{
  return (LOBYTE(self->_knownFields) >> 2) & 1;
}

- (BOOL)hasActiveHours
{
  return (LOBYTE(self->_knownFields) >> 3) & 1;
}

- (BOOL)hasStepCount
{
  return LOBYTE(self->_knownFields) >> 7;
}

- (BOOL)hasPushCount
{
  return (BYTE1(self->_knownFields) >> 3) & 1;
}

- (BOOL)hasWheelchairUse
{
  return (BYTE1(self->_knownFields) >> 5) & 1;
}

- (BOOL)hasDeepBreathingDuration
{
  return (BYTE1(self->_knownFields) >> 2) & 1;
}

- (BOOL)hasFlightsClimbed
{
  return (BYTE1(self->_knownFields) >> 4) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(HKSample *)self startDate];
  objc_super v5 = [(HKSample *)self endDate];
  v6 = [(HKActivityCache *)self dateComponents];
  int64_t v7 = [(HKActivityCache *)self sequence];
  v8 = [(HKObject *)self metadata];
  v9 = +[HKActivityCache _activityCacheWithStartDate:v4 endDate:v5 dateComponents:v6 sequence:v7 metadata:v8];

  v10 = [(HKObject *)self UUID];
  [v9 _setUUID:v10];

  if ([(HKActivityCache *)self hasEnergyBurned])
  {
    v11 = [(HKActivityCache *)self energyBurned];
    [v9 _setEnergyBurned:v11];
  }
  if ([(HKActivityCache *)self hasMoveMinutes])
  {
    [(HKActivityCache *)self moveMinutes];
    objc_msgSend(v9, "_setMoveMinutes:");
  }
  if ([(HKActivityCache *)self hasBriskMinutes])
  {
    [(HKActivityCache *)self briskMinutes];
    objc_msgSend(v9, "_setBriskMinutes:");
  }
  if ([(HKActivityCache *)self hasActiveHours])
  {
    [(HKActivityCache *)self activeHours];
    objc_msgSend(v9, "_setActiveHours:");
  }
  if ([(HKActivityCache *)self hasStepCount]) {
    objc_msgSend(v9, "_setStepCount:", -[HKActivityCache stepCount](self, "stepCount"));
  }
  if ([(HKActivityCache *)self hasPushCount]) {
    objc_msgSend(v9, "_setPushCount:", -[HKActivityCache pushCount](self, "pushCount"));
  }
  if ([(HKActivityCache *)self hasWheelchairUse]) {
    objc_msgSend(v9, "_setWheelchairUse:", -[HKActivityCache wheelchairUse](self, "wheelchairUse"));
  }
  if ([(HKActivityCache *)self hasWalkingAndRunningDistance])
  {
    v12 = [(HKActivityCache *)self walkingAndRunningDistance];
    [v9 _setWalkingAndRunningDistance:v12];
  }
  if ([(HKActivityCache *)self hasDeepBreathingDuration])
  {
    [(HKActivityCache *)self deepBreathingDuration];
    objc_msgSend(v9, "_setDeepBreathingDuration:");
  }
  if ([(HKActivityCache *)self hasEnergyBurnedGoal])
  {
    v13 = [(HKActivityCache *)self energyBurnedGoal];
    v14 = [(HKActivityCache *)self energyBurnedGoalDate];
    [v9 _setEnergyBurnedGoal:v13 date:v14];
  }
  if ([(HKActivityCache *)self hasMoveMinutesGoal])
  {
    v15 = [(HKActivityCache *)self moveMinutesGoal];
    v16 = [(HKActivityCache *)self moveMinutesGoalDate];
    [v9 _setMoveMinutesGoal:v15 date:v16];
  }
  if ([(HKActivityCache *)self hasBriskMinutesGoal])
  {
    v17 = [(HKActivityCache *)self briskMinutesGoal];
    [v9 _setBriskMinutesGoal:v17];
  }
  if ([(HKActivityCache *)self hasActiveHoursGoal])
  {
    v18 = [(HKActivityCache *)self activeHoursGoal];
    [v9 _setActiveHoursGoal:v18];
  }
  if ([(HKActivityCache *)self hasFlightsClimbed]) {
    objc_msgSend(v9, "_setFlightsClimbed:", -[HKActivityCache flightsClimbed](self, "flightsClimbed"));
  }
  v19 = [(HKActivityCache *)self dailyEnergyBurnedStatistics];
  [v9 _setDailyEnergyBurnedStatistics:v19];

  v20 = [(HKActivityCache *)self dailyMoveMinutesStatistics];
  [v9 _setDailyMoveMinutesStatistics:v20];

  v21 = [(HKActivityCache *)self dailyBriskMinutesStatistics];
  [v9 _setDailyBriskMinutesStatistics:v21];

  objc_msgSend(v9, "_setActivityMoveMode:", -[HKActivityCache activityMoveMode](self, "activityMoveMode"));
  objc_msgSend(v9, "_setPaused:", -[HKActivityCache isPaused](self, "isPaused"));
  objc_msgSend(v9, "_setVersion:", -[HKActivityCache version](self, "version"));
  return v9;
}

- (NSDateComponents)dateComponents
{
  v2 = (void *)[(NSDateComponents *)self->_dateComponents copy];

  return (NSDateComponents *)v2;
}

- (HKQuantity)energyBurned
{
  return self->_energyBurned;
}

- (HKQuantity)walkingAndRunningDistance
{
  return self->_walkingAndRunningDistance;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (void)_setBriskMinutes:(double)a3
{
  self->_briskMinutes = a3;
  self->_knownFields |= 4uLL;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (void)_setActiveHours:(double)a3
{
  self->_activeHours = a3;
  self->_knownFields |= 8uLL;
}

- (int64_t)stepCount
{
  return self->_stepCount;
}

- (void)_setStepCount:(int64_t)a3
{
  self->_stepCount = a3;
  self->_knownFields |= 0x80uLL;
}

- (int64_t)pushCount
{
  return self->_pushCount;
}

- (void)_setPushCount:(int64_t)a3
{
  self->_pushCount = a3;
  self->_knownFields |= 0x800uLL;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (void)_setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
  self->_knownFields |= 0x2000uLL;
}

- (double)deepBreathingDuration
{
  return self->_deepBreathingDuration;
}

- (void)_setDeepBreathingDuration:(double)a3
{
  self->_deepBreathingDuration = a3;
  self->_knownFields |= 0x400uLL;
}

- (BOOL)hasEnergyBurnedGoal
{
  return self->_energyBurnedGoal != 0;
}

- (HKQuantity)energyBurnedGoal
{
  return self->_energyBurnedGoal;
}

- (NSDate)energyBurnedGoalDate
{
  return self->_energyBurnedGoalDate;
}

- (void)_setEnergyBurnedGoal:(id)a3 date:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v7
    || (energyBurnedGoalDate = self->_energyBurnedGoalDate) == 0
    || [(NSDate *)energyBurnedGoalDate compare:v7] == NSOrderedAscending
    && ([(HKSample *)self endDate],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v7 compare:v9],
        v9,
        v10 == -1))
  {
    objc_storeStrong((id *)&self->_energyBurnedGoal, a3);
    objc_storeStrong((id *)&self->_energyBurnedGoalDate, a4);
  }
}

- (int64_t)flightsClimbed
{
  return self->_flightsClimbed;
}

- (void)_setFlightsClimbed:(int64_t)a3
{
  self->_flightsClimbed = a3;
  self->_knownFields |= 0x1000uLL;
}

- (NSArray)dailyEnergyBurnedStatistics
{
  return self->_dailyEnergyBurnedStatistics;
}

- (void)_setDailyEnergyBurnedStatistics:(id)a3
{
  self->_dailyEnergyBurnedStatistics = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSArray)dailyBriskMinutesStatistics
{
  return self->_dailyBriskMinutesStatistics;
}

- (void)_setDailyBriskMinutesStatistics:(id)a3
{
  self->_dailyBriskMinutesStatistics = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)_isEqualToActivityCache:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_55;
  }
  objc_super v5 = [(HKActivityCache *)self energyBurned];
  uint64_t v6 = [v4 energyBurned];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    uint64_t v8 = [v4 energyBurned];
    if (!v8) {
      goto LABEL_54;
    }
    v9 = (void *)v8;
    uint64_t v10 = [(HKActivityCache *)self energyBurned];
    id v11 = [v4 energyBurned];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_55;
    }
  }
  objc_super v5 = [(HKActivityCache *)self energyBurnedGoal];
  uint64_t v13 = [v4 energyBurnedGoal];
  if (v5 == (void *)v13)
  {
  }
  else
  {
    id v7 = (void *)v13;
    uint64_t v14 = [v4 energyBurnedGoal];
    if (!v14) {
      goto LABEL_54;
    }
    v15 = (void *)v14;
    v16 = [(HKActivityCache *)self energyBurnedGoal];
    v17 = [v4 energyBurnedGoal];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_55;
    }
  }
  [(HKActivityCache *)self moveMinutes];
  double v20 = v19;
  [v4 moveMinutes];
  if (v20 != v21) {
    goto LABEL_55;
  }
  objc_super v5 = [(HKActivityCache *)self moveMinutesGoal];
  uint64_t v22 = [v4 moveMinutesGoal];
  if (v5 == (void *)v22)
  {
  }
  else
  {
    id v7 = (void *)v22;
    uint64_t v23 = [v4 moveMinutesGoal];
    if (!v23) {
      goto LABEL_54;
    }
    v24 = (void *)v23;
    v25 = [(HKActivityCache *)self moveMinutesGoal];
    v26 = [v4 moveMinutesGoal];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_55;
    }
  }
  [(HKActivityCache *)self briskMinutes];
  double v29 = v28;
  [v4 briskMinutes];
  if (v29 != v30) {
    goto LABEL_55;
  }
  objc_super v5 = [(HKActivityCache *)self briskMinutesGoal];
  uint64_t v31 = [v4 briskMinutesGoal];
  if (v5 == (void *)v31)
  {
  }
  else
  {
    id v7 = (void *)v31;
    uint64_t v32 = [v4 briskMinutesGoal];
    if (!v32) {
      goto LABEL_54;
    }
    v33 = (void *)v32;
    v34 = [(HKActivityCache *)self briskMinutesGoal];
    v35 = [v4 briskMinutesGoal];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_55;
    }
  }
  [(HKActivityCache *)self activeHours];
  double v38 = v37;
  [v4 activeHours];
  if (v38 != v39) {
    goto LABEL_55;
  }
  objc_super v5 = [(HKActivityCache *)self activeHoursGoal];
  uint64_t v40 = [v4 activeHoursGoal];
  if (v5 == (void *)v40)
  {
  }
  else
  {
    id v7 = (void *)v40;
    uint64_t v41 = [v4 activeHoursGoal];
    if (!v41) {
      goto LABEL_54;
    }
    v42 = (void *)v41;
    v43 = [(HKActivityCache *)self activeHoursGoal];
    v44 = [v4 activeHoursGoal];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_55;
    }
  }
  int64_t v46 = [(HKActivityCache *)self stepCount];
  if (v46 != [v4 stepCount]) {
    goto LABEL_55;
  }
  int64_t v47 = [(HKActivityCache *)self pushCount];
  if (v47 != [v4 pushCount]) {
    goto LABEL_55;
  }
  int64_t v48 = [(HKActivityCache *)self wheelchairUse];
  if (v48 != [v4 wheelchairUse]) {
    goto LABEL_55;
  }
  [(HKActivityCache *)self deepBreathingDuration];
  double v50 = v49;
  [v4 deepBreathingDuration];
  if (v50 != v51) {
    goto LABEL_55;
  }
  int64_t v52 = [(HKActivityCache *)self flightsClimbed];
  if (v52 != [v4 flightsClimbed]) {
    goto LABEL_55;
  }
  objc_super v5 = [(HKActivityCache *)self walkingAndRunningDistance];
  uint64_t v53 = [v4 walkingAndRunningDistance];
  if (v5 == (void *)v53)
  {
  }
  else
  {
    id v7 = (void *)v53;
    uint64_t v54 = [v4 walkingAndRunningDistance];
    if (!v54) {
      goto LABEL_54;
    }
    v55 = (void *)v54;
    v56 = [(HKActivityCache *)self walkingAndRunningDistance];
    v57 = [v4 walkingAndRunningDistance];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_55;
    }
  }
  objc_super v5 = [(HKSample *)self startDate];
  uint64_t v59 = [v4 startDate];
  if (v5 == (void *)v59)
  {
  }
  else
  {
    id v7 = (void *)v59;
    uint64_t v60 = [v4 startDate];
    if (!v60) {
      goto LABEL_54;
    }
    v61 = (void *)v60;
    v62 = [(HKSample *)self startDate];
    v63 = [v4 startDate];
    int v64 = [v62 isEqual:v63];

    if (!v64) {
      goto LABEL_55;
    }
  }
  objc_super v5 = [(HKSample *)self endDate];
  uint64_t v65 = [v4 endDate];
  if (v5 == (void *)v65)
  {
  }
  else
  {
    id v7 = (void *)v65;
    uint64_t v66 = [v4 endDate];
    if (!v66) {
      goto LABEL_54;
    }
    v67 = (void *)v66;
    v68 = [(HKSample *)self endDate];
    v69 = [v4 endDate];
    int v70 = [v68 isEqual:v69];

    if (!v70) {
      goto LABEL_55;
    }
  }
  objc_super v5 = [(HKActivityCache *)self dateComponents];
  uint64_t v71 = [v4 dateComponents];
  if (v5 != (void *)v71)
  {
    id v7 = (void *)v71;
    uint64_t v72 = [v4 dateComponents];
    if (v72)
    {
      v73 = (void *)v72;
      v74 = [(HKActivityCache *)self dateComponents];
      v75 = [v4 dateComponents];
      int v76 = [v74 isEqual:v75];

      if (!v76) {
        goto LABEL_55;
      }
      goto LABEL_58;
    }
LABEL_54:

    goto LABEL_55;
  }

LABEL_58:
  int64_t v79 = [(HKActivityCache *)self activityMoveMode];
  if (v79 == [v4 activityMoveMode])
  {
    int v80 = [(HKActivityCache *)self isPaused];
    if (v80 == [v4 isPaused])
    {
      int64_t v81 = [(HKActivityCache *)self version];
      BOOL v77 = v81 == [v4 version];
      goto LABEL_56;
    }
  }
LABEL_55:
  BOOL v77 = 0;
LABEL_56:

  return v77;
}

- (void)_setEnergyBurned:(id)a3
{
}

- (void)_setEnergyBurnedGoal:(id)a3
{
}

- (void)_setEnergyBurnedGoalDateOnly:(id)a3
{
}

- (void)_setWalkingAndRunningDistance:(id)a3
{
}

- (BOOL)hasActiveHoursGoal
{
  return self->_activeHoursGoal != 0;
}

- (HKQuantity)activeHoursGoal
{
  activeHoursGoal = self->_activeHoursGoal;
  if (activeHoursGoal)
  {
    v3 = activeHoursGoal;
  }
  else
  {
    v3 = [(HKActivityCache *)self _fallbackActiveHoursGoal];
  }

  return v3;
}

- (BOOL)hasEnergyBurned
{
  return self->_energyBurned != 0;
}

- (BOOL)hasBriskMinutesGoal
{
  return self->_briskMinutesGoal != 0;
}

- (HKQuantity)briskMinutesGoal
{
  briskMinutesGoal = self->_briskMinutesGoal;
  if (briskMinutesGoal)
  {
    v3 = briskMinutesGoal;
  }
  else
  {
    v3 = [(HKActivityCache *)self _fallbackBriskMinutesGoal];
  }

  return v3;
}

- (BOOL)hasWalkingAndRunningDistance
{
  return self->_walkingAndRunningDistance != 0;
}

- (BOOL)hasDailyEnergyBurnedStatistics
{
  return self->_dailyEnergyBurnedStatistics != 0;
}

- (BOOL)hasDailyBriskMinutesStatistics
{
  return self->_dailyBriskMinutesStatistics != 0;
}

- (id)_valueDescription
{
  double v28 = NSString;
  uint64_t v3 = [NSNumber numberWithLongLong:self->_sequence];
  BOOL v31 = [(HKActivityCache *)self hasEnergyBurned];
  if (v31)
  {
    id v4 = NSNumber;
    [(HKActivityCache *)self _energyBurnedInKilocalories];
    v42 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v42 = 0;
  }
  BOOL v30 = [(HKActivityCache *)self hasEnergyBurnedGoal];
  if (v30)
  {
    objc_super v5 = NSNumber;
    [(HKActivityCache *)self _energyBurnedGoalInKilocalories];
    uint64_t v41 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v41 = 0;
  }
  BOOL v29 = [(HKActivityCache *)self hasMoveMinutes];
  if (v29)
  {
    uint64_t v40 = [NSNumber numberWithDouble:self->_moveMinutes];
  }
  else
  {
    uint64_t v40 = 0;
  }
  BOOL v27 = [(HKActivityCache *)self hasMoveMinutesGoal];
  if (v27)
  {
    uint64_t v6 = NSNumber;
    [(HKActivityCache *)self _moveMinutesGoalInMinutes];
    double v39 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    double v39 = 0;
  }
  BOOL v26 = [(HKActivityCache *)self hasBriskMinutes];
  if (v26)
  {
    double v38 = [NSNumber numberWithDouble:self->_briskMinutes];
  }
  else
  {
    double v38 = 0;
  }
  BOOL v25 = [(HKActivityCache *)self hasBriskMinutesGoal];
  if (v25)
  {
    id v7 = NSNumber;
    [(HKActivityCache *)self _briskMinutesGoalInMinutes];
    double v37 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    double v37 = 0;
  }
  BOOL v24 = [(HKActivityCache *)self hasActiveHours];
  if (v24)
  {
    int v36 = [NSNumber numberWithDouble:self->_activeHours];
  }
  else
  {
    int v36 = 0;
  }
  BOOL v23 = [(HKActivityCache *)self hasActiveHoursGoal];
  if (v23)
  {
    uint64_t v8 = NSNumber;
    [(HKActivityCache *)self _activeHoursGoalCount];
    v35 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v35 = 0;
  }
  BOOL v22 = [(HKActivityCache *)self hasStepCount];
  if (v22)
  {
    v34 = [NSNumber numberWithInteger:self->_stepCount];
  }
  else
  {
    v34 = 0;
  }
  BOOL v21 = [(HKActivityCache *)self hasPushCount];
  if (v21)
  {
    v33 = [NSNumber numberWithInteger:self->_pushCount];
  }
  else
  {
    v33 = 0;
  }
  BOOL v9 = [(HKActivityCache *)self hasWalkingAndRunningDistance];
  if (v9)
  {
    uint64_t v10 = NSNumber;
    [(HKActivityCache *)self _walkingAndRunningDistanceInMeters];
    uint64_t v32 = objc_msgSend(v10, "numberWithDouble:");
  }
  else
  {
    uint64_t v32 = 0;
  }
  BOOL v11 = [(HKActivityCache *)self hasDeepBreathingDuration];
  if (v11)
  {
    int v12 = [NSNumber numberWithDouble:self->_deepBreathingDuration];
  }
  else
  {
    int v12 = 0;
  }
  BOOL v13 = [(HKActivityCache *)self hasFlightsClimbed];
  uint64_t v14 = (void *)v3;
  if (v13)
  {
    v15 = [NSNumber numberWithInteger:self->_flightsClimbed];
  }
  else
  {
    v15 = 0;
  }
  v16 = [NSNumber numberWithInteger:self->_activityMoveMode];
  if (self->_paused) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  int v18 = [NSNumber numberWithInteger:self->_version];
  objc_msgSend(v28, "stringWithFormat:", @"{HKActivityCache: Sequence=%@ EnergyBurned=(%@/%@) MoveMinutes=(%@/%@) BriskMinutes=(%@/%@) ActiveHours=(%@/%@) StepCount=(%@) PushCount=(%@) Meters=(%@) BreatheDuration=(%@) Flights=(%@) ActivityModeMode=(%@) Paused=(%@) Version=(%@)}", v14, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v12, v15, v16, v17,
  double v19 = v18);

  if (v13)
  {

    if (!v11)
    {
LABEL_45:
      if (!v9) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if (!v11)
  {
    goto LABEL_45;
  }

  if (v9) {
LABEL_46:
  }

LABEL_47:
  if (v21) {

  }
  if (v22) {
  if (v23)
  }

  if (v24) {
  if (v25)
  }

  if (v26) {
  if (v27)
  }

  if (v29) {
  if (v30)
  }

  if (v31) {

  }
  return v19;
}

- (double)_energyBurnedInKilocalories
{
  energyBurned = self->_energyBurned;
  uint64_t v3 = +[HKUnit kilocalorieUnit];
  [(HKQuantity *)energyBurned doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_energyBurnedGoalInKilocalories
{
  energyBurnedGoal = self->_energyBurnedGoal;
  uint64_t v3 = +[HKUnit kilocalorieUnit];
  [(HKQuantity *)energyBurnedGoal doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_walkingAndRunningDistanceInMeters
{
  walkingAndRunningDistance = self->_walkingAndRunningDistance;
  uint64_t v3 = +[HKUnit meterUnit];
  [(HKQuantity *)walkingAndRunningDistance doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyBriskMinutesStatistics, 0);
  objc_storeStrong((id *)&self->_dailyMoveMinutesStatistics, 0);
  objc_storeStrong((id *)&self->_dailyEnergyBurnedStatistics, 0);
  objc_storeStrong((id *)&self->_walkingAndRunningDistance, 0);
  objc_storeStrong((id *)&self->_activeHoursGoalDate, 0);
  objc_storeStrong((id *)&self->_activeHoursGoal, 0);
  objc_storeStrong((id *)&self->_briskMinutesGoalDate, 0);
  objc_storeStrong((id *)&self->_briskMinutesGoal, 0);
  objc_storeStrong((id *)&self->_moveMinutesGoalDate, 0);
  objc_storeStrong((id *)&self->_moveMinutesGoal, 0);
  objc_storeStrong((id *)&self->_energyBurnedGoalDate, 0);
  objc_storeStrong((id *)&self->_energyBurnedGoal, 0);
  objc_storeStrong((id *)&self->_energyBurned, 0);

  objc_storeStrong((id *)&self->_dateComponents, 0);
}

- (void)_setCacheIndex:(int64_t)a3
{
  self->_cacheIndex = a3;
  _HKActivityCacheDateComponentsFromCacheIndex(a3);
  self->_dateComponents = (NSDateComponents *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)_setEnergyBurnedGoalOnly:(id)a3
{
}

+ (id)_activityCacheWithStartDate:(id)a3 endDate:(id)a4 dateComponents:(id)a5 sequence:(int64_t)a6 energyBurned:(id)a7 energyBurnedGoal:(id)a8 walkingAndRunningDistance:(id)a9 metadata:(id)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  double v20 = [a1 _activityCacheWithStartDate:a3 endDate:a4 dateComponents:a5 sequence:a6 metadata:a10];
  [v20 _setEnergyBurned:v19];

  [v20 _setEnergyBurnedGoal:v18];
  [v20 _setWalkingAndRunningDistance:v17];

  return v20;
}

+ (id)_activityCacheWithStartDate:(id)a3 endDate:(id)a4 dateComponents:(id)a5 sequence:(int64_t)a6 metadata:(id)a7
{
  id v7 = 0;
  if (a4 && a3 && a5)
  {
    id v13 = a7;
    id v14 = a5;
    id v15 = a4;
    id v16 = a3;
    id v17 = _HKCachedImmutableGregorianCalendarWithUTCTimeZone();
    id v32 = 0;
    uint64_t v18 = _HKDerivedCacheIndexAndDateComponents(v17, v14, &v32);

    id v19 = v32;
    double v20 = +[HKObjectType activityCacheType];
    [v16 timeIntervalSinceReferenceDate];
    double v22 = v21;

    [v15 timeIntervalSinceReferenceDate];
    double v24 = v23;

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __88__HKActivityCache__activityCacheWithStartDate_endDate_dateComponents_sequence_metadata___block_invoke;
    v28[3] = &unk_1E58C5D48;
    id v29 = v19;
    uint64_t v30 = v18;
    int64_t v31 = a6;
    v27.receiver = a1;
    v27.super_class = (Class)&OBJC_METACLASS___HKActivityCache;
    id v25 = v19;
    id v7 = objc_msgSendSuper2(&v27, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v20, 0, v13, v28, v22, v24);
  }

  return v7;
}

void __88__HKActivityCache__activityCacheWithStartDate_endDate_dateComponents_sequence_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 96) = *(void *)(a1 + 40);
  objc_storeStrong((id *)(a2 + 104), *(id *)(a1 + 32));
  double v4 = (id)a2;
  v4[39] = *(void *)(a1 + 48);
  v4[35] = 1;
  *((unsigned char *)v4 + 288) = 0;
  v4[37] = 2;
}

+ (id)_activityCacheWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 dateComponents:(id)a6 sequence:(int64_t)a7
{
  id v12 = a3;
  id v13 = v12;
  id v14 = 0;
  if (a5 && a4 && v12 && a6)
  {
    id v15 = a6;
    id v16 = a5;
    id v17 = a4;
    uint64_t v18 = _HKCachedImmutableGregorianCalendarWithUTCTimeZone();
    id v34 = 0;
    uint64_t v19 = _HKDerivedCacheIndexAndDateComponents(v18, v15, &v34);

    id v20 = v34;
    double v21 = +[HKObjectType activityCacheType];
    [v17 timeIntervalSinceReferenceDate];
    double v23 = v22;

    [v16 timeIntervalSinceReferenceDate];
    double v25 = v24;

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __84__HKActivityCache__activityCacheWithUUID_startDate_endDate_dateComponents_sequence___block_invoke;
    v29[3] = &unk_1E58C5D70;
    uint64_t v32 = v19;
    int64_t v33 = a7;
    id v30 = v20;
    id v31 = v13;
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_METACLASS___HKActivityCache;
    id v26 = v20;
    id v14 = objc_msgSendSuper2(&v28, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v21, 0, 0, v29, v23, v25);
  }

  return v14;
}

void __84__HKActivityCache__activityCacheWithUUID_startDate_endDate_dateComponents_sequence___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 96) = *(void *)(a1 + 48);
  objc_storeStrong((id *)(a2 + 104), *(id *)(a1 + 32));
  double v4 = (id)a2;
  v4[39] = *(void *)(a1 + 56);
  v4[35] = 1;
  *((unsigned char *)v4 + 288) = 0;
  v4[37] = 2;
  [v4 _setUUID:*(void *)(a1 + 40)];
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (double)moveMinutes
{
  return self->_moveMinutes;
}

- (void)_setMoveMinutes:(double)a3
{
  self->_moveMinutes = a3;
  self->_knownFields |= 0x4000uLL;
}

- (BOOL)hasMoveMinutes
{
  return (BYTE1(self->_knownFields) >> 6) & 1;
}

- (HKQuantity)moveMinutesGoal
{
  return self->_moveMinutesGoal;
}

- (NSDate)moveMinutesGoalDate
{
  return self->_moveMinutesGoalDate;
}

- (void)_setMoveMinutesGoal:(id)a3
{
}

- (void)_setMoveMinutesGoal:(id)a3 date:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v7
    || (moveMinutesGoalDate = self->_moveMinutesGoalDate) == 0
    || [(NSDate *)moveMinutesGoalDate compare:v7] == NSOrderedAscending
    && ([(HKSample *)self endDate],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v7 compare:v9],
        v9,
        v10 == -1))
  {
    objc_storeStrong((id *)&self->_moveMinutesGoal, a3);
    objc_storeStrong((id *)&self->_moveMinutesGoalDate, a4);
  }
}

- (void)_setMoveMinutesGoalOnly:(id)a3
{
}

- (void)_setMoveMinutesGoalDateOnly:(id)a3
{
}

- (BOOL)hasMoveMinutesGoal
{
  return self->_moveMinutesGoal != 0;
}

- (id)_fallbackBriskMinutesGoal
{
  if (self->_version <= 1)
  {
    uint64_t v3 = +[HKUnit minuteUnit];
    v2 = +[HKQuantity quantityWithUnit:v3 doubleValue:30.0];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_setBriskMinutesGoal:(id)a3
{
}

- (void)_setBriskMinutesGoal:(id)a3 date:(id)a4
{
  id v13 = a3;
  id v8 = a4;
  if (v13 && [v13 _isZero])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKActivityCache.m", 351, @"Invalid parameter not satisfying: %@", @"(briskMinutesGoal == nil) || ![briskMinutesGoal _isZero]" object file lineNumber description];
  }
  if (!v8
    || (briskMinutesGoalDate = self->_briskMinutesGoalDate) == 0
    || [(NSDate *)briskMinutesGoalDate compare:v8] == NSOrderedAscending
    && ([(HKSample *)self endDate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v8 compare:v10],
        v10,
        v11 == -1))
  {
    objc_storeStrong((id *)&self->_briskMinutesGoal, a3);
    objc_storeStrong((id *)&self->_briskMinutesGoalDate, a4);
  }
}

- (void)_setBriskMinutesGoalOnly:(id)a3
{
}

- (void)_setBriskMinutesGoalDateOnly:(id)a3
{
}

- (BOOL)hasBriskMinutesGoalDate
{
  return self->_briskMinutesGoalDate != 0;
}

- (id)_fallbackActiveHoursGoal
{
  if (self->_version <= 1)
  {
    uint64_t v3 = 12;
    if (self->_activityMoveMode == 2) {
      uint64_t v3 = 10;
    }
    double v4 = (double)v3;
    double v5 = +[HKUnit countUnit];
    v2 = +[HKQuantity quantityWithUnit:v5 doubleValue:v4];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_setActiveHoursGoal:(id)a3
{
}

- (void)_setActiveHoursGoal:(id)a3 date:(id)a4
{
  id v13 = a3;
  id v8 = a4;
  if (v13 && [v13 _isZero])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKActivityCache.m", 400, @"Invalid parameter not satisfying: %@", @"(activeHoursGoal == nil) || ![activeHoursGoal _isZero]" object file lineNumber description];
  }
  if (!v8
    || (activeHoursGoalDate = self->_activeHoursGoalDate) == 0
    || [(NSDate *)activeHoursGoalDate compare:v8] == NSOrderedAscending
    && ([(HKSample *)self endDate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v8 compare:v10],
        v10,
        v11 == -1))
  {
    objc_storeStrong((id *)&self->_activeHoursGoal, a3);
    objc_storeStrong((id *)&self->_activeHoursGoalDate, a4);
  }
}

- (void)_setActiveHoursGoalOnly:(id)a3
{
}

- (void)_setActiveHoursGoalDateOnly:(id)a3
{
}

- (BOOL)hasActiveHoursGoalDate
{
  return self->_activeHoursGoalDate != 0;
}

- (double)energyBurnedGoalPercentage
{
  [(HKActivityCache *)self _energyBurnedGoalInKilocalories];
  double v4 = v3;
  double result = 0.0;
  if (v4 > 0.0)
  {
    [(HKActivityCache *)self _energyBurnedInKilocalories];
    return v6 / v4;
  }
  return result;
}

- (double)moveMinutesGoalPercentage
{
  [(HKActivityCache *)self _moveMinutesGoalInMinutes];
  double v4 = 0.0;
  if (v3 > 0.0) {
    return self->_moveMinutes / v3;
  }
  return v4;
}

- (double)briskMinutesGoalPercentage
{
  BOOL v3 = [(HKActivityCache *)self hasBriskMinutesGoal];
  double result = 0.0;
  if (v3)
  {
    double briskMinutes = self->_briskMinutes;
    [(HKActivityCache *)self _briskMinutesGoalInMinutes];
    return briskMinutes / v6;
  }
  return result;
}

- (double)activeHoursGoalPercentage
{
  BOOL v3 = [(HKActivityCache *)self hasActiveHoursGoal];
  double result = 0.0;
  if (v3)
  {
    double activeHours = self->_activeHours;
    [(HKActivityCache *)self _activeHoursGoalCount];
    return activeHours / v6;
  }
  return result;
}

- (BOOL)hasDateComponents
{
  return self->_dateComponents != 0;
}

- (BOOL)hasDailyMoveMinutesStatistics
{
  return self->_dailyMoveMinutesStatistics != 0;
}

- (NSArray)dailyMoveMinutesStatistics
{
  return self->_dailyMoveMinutesStatistics;
}

- (void)_setDailyMoveMinutesStatistics:(id)a3
{
  double v4 = (NSArray *)[a3 copy];
  dailyMoveMinutesStatistics = self->_dailyMoveMinutesStatistics;
  self->_dailyMoveMinutesStatistics = v4;

  MEMORY[0x1F41817F8](v4, dailyMoveMinutesStatistics);
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (void)_setActivityMoveMode:(int64_t)a3
{
  if (!a3)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKActivityCache.m", 587, @"Invalid parameter not satisfying: %@", @"activityMoveMode != 0" object file lineNumber description];
  }
  self->_activityMoveMode = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)_setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)_setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (unint64_t)knownFields
{
  if ([(HKActivityCache *)self hasEnergyBurned]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL v4 = [(HKActivityCache *)self hasBriskMinutes];
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  if ([(HKActivityCache *)self hasActiveHours]) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(HKActivityCache *)self hasEnergyBurnedGoal];
  uint64_t v9 = 16;
  if (!v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v6 | v7 | v9;
  if ([(HKActivityCache *)self hasBriskMinutesGoal]) {
    uint64_t v11 = 32;
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v12 = [(HKActivityCache *)self hasActiveHoursGoal];
  uint64_t v13 = 64;
  if (!v12) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v11 | v13;
  BOOL v15 = [(HKActivityCache *)self hasStepCount];
  uint64_t v16 = 128;
  if (!v15) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = v10 | v14 | v16;
  if ([(HKActivityCache *)self hasDeepBreathingDuration]) {
    uint64_t v18 = 1024;
  }
  else {
    uint64_t v18 = 0;
  }
  BOOL v19 = [(HKActivityCache *)self hasWalkingAndRunningDistance];
  uint64_t v20 = 256;
  if (!v19) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = v18 | v20;
  BOOL v22 = [(HKActivityCache *)self hasPushCount];
  uint64_t v23 = 2048;
  if (!v22) {
    uint64_t v23 = 0;
  }
  uint64_t v24 = v21 | v23;
  BOOL v25 = [(HKActivityCache *)self hasWheelchairUse];
  uint64_t v26 = 0x2000;
  if (!v25) {
    uint64_t v26 = 0;
  }
  uint64_t v27 = v17 | v24 | v26;
  BOOL v28 = [(HKActivityCache *)self hasFlightsClimbed];
  uint64_t v29 = 4096;
  if (!v28) {
    uint64_t v29 = 0;
  }
  return v27 | v29;
}

- (void)reset
{
  energyBurned = self->_energyBurned;
  self->_energyBurned = 0;

  energyBurnedGoal = self->_energyBurnedGoal;
  self->_energyBurnedGoal = 0;

  energyBurnedGoalDate = self->_energyBurnedGoalDate;
  self->_energyBurnedGoalDate = 0;

  self->_moveMinutes = 0.0;
  moveMinutesGoal = self->_moveMinutesGoal;
  self->_moveMinutesGoal = 0;

  moveMinutesGoalDate = self->_moveMinutesGoalDate;
  self->_moveMinutesGoalDate = 0;

  self->_double briskMinutes = 0.0;
  briskMinutesGoal = self->_briskMinutesGoal;
  self->_briskMinutesGoal = 0;

  briskMinutesGoalDate = self->_briskMinutesGoalDate;
  self->_briskMinutesGoalDate = 0;

  self->_double activeHours = 0.0;
  activeHoursGoal = self->_activeHoursGoal;
  self->_activeHoursGoal = 0;

  activeHoursGoalDate = self->_activeHoursGoalDate;
  self->_activeHoursGoalDate = 0;

  self->_stepCount = 0;
  walkingAndRunningDistance = self->_walkingAndRunningDistance;
  self->_walkingAndRunningDistance = 0;

  self->_deepBreathingDuration = 0.0;
  self->_pushCount = 0;
  self->_wheelchairUse = 0;
  self->_flightsClimbed = 0;
  dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  self->_dailyEnergyBurnedStatistics = 0;

  dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  self->_dailyBriskMinutesStatistics = 0;

  self->_activityMoveMode = 2;
  self->_paused = 0;
  self->_knownFields = 0;
}

- (double)_moveMinutesGoalInMinutes
{
  moveMinutesGoal = self->_moveMinutesGoal;
  uint64_t v3 = +[HKUnit minuteUnit];
  [(HKQuantity *)moveMinutesGoal doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_briskMinutesGoalInMinutes
{
  briskMinutesGoal = self->_briskMinutesGoal;
  uint64_t v3 = +[HKUnit minuteUnit];
  [(HKQuantity *)briskMinutesGoal doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)_activeHoursGoalCount
{
  activeHoursGoal = self->_activeHoursGoal;
  uint64_t v3 = +[HKUnit countUnit];
  [(HKQuantity *)activeHoursGoal doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKActivityCache)initWithCoder:(id)a3
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HKActivityCache;
  double v5 = [(HKSample *)&v52 initWithCoder:v4];
  if (!v5) {
    goto LABEL_49;
  }
  -[HKActivityCache _setCacheIndex:](v5, "_setCacheIndex:", [v4 decodeInt64ForKey:@"cacheIndex"]);
  -[HKActivityCache _setSequence:](v5, "_setSequence:", [v4 decodeInt64ForKey:@"sequence"]);
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"energyBurned"];
  energyBurned = v5->_energyBurned;
  v5->_energyBurned = (HKQuantity *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"energyBurnedGoal"];
  energyBurnedGoal = v5->_energyBurnedGoal;
  v5->_energyBurnedGoal = (HKQuantity *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"energyBurnedGoalDate"];
  energyBurnedGoalDate = v5->_energyBurnedGoalDate;
  v5->_energyBurnedGoalDate = (NSDate *)v10;

  if ([v4 containsValueForKey:@"moveMinutes"])
  {
    [v4 decodeDoubleForKey:@"moveMinutes"];
    -[HKActivityCache _setMoveMinutes:](v5, "_setMoveMinutes:");
  }
  if ([v4 containsValueForKey:@"moveMinutesGoalQuantity"])
  {
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"moveMinutesGoalQuantity"];
    moveMinutesGoal = v5->_moveMinutesGoal;
    v5->_moveMinutesGoal = (HKQuantity *)v12;
  }
  else
  {
    if (![v4 containsValueForKey:@"moveMinutesGoal"]) {
      goto LABEL_9;
    }
    [v4 decodeDoubleForKey:@"moveMinutesGoal"];
    double v15 = v14;
    moveMinutesGoal = +[HKUnit minuteUnit];
    uint64_t v16 = +[HKQuantity quantityWithUnit:moveMinutesGoal doubleValue:v15];
    uint64_t v17 = v5->_moveMinutesGoal;
    v5->_moveMinutesGoal = (HKQuantity *)v16;
  }
LABEL_9:
  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"moveMinutesGoalDate"];
  moveMinutesGoalDate = v5->_moveMinutesGoalDate;
  v5->_moveMinutesGoalDate = (NSDate *)v18;

  if ([v4 containsValueForKey:@"activeHours"])
  {
    [v4 decodeDoubleForKey:@"activeHours"];
    -[HKActivityCache _setActiveHours:](v5, "_setActiveHours:");
  }
  if ([v4 containsValueForKey:@"activeHoursGoalQuantity"])
  {
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeHoursGoalQuantity"];
    [(HKActivityCache *)v5 _setActiveHoursGoal:v20];
  }
  else
  {
    if (![v4 containsValueForKey:@"activeHoursGoal"]) {
      goto LABEL_16;
    }
    [v4 decodeDoubleForKey:@"activeHoursGoal"];
    double v22 = v21;
    uint64_t v20 = +[HKUnit countUnit];
    uint64_t v23 = +[HKQuantity quantityWithUnit:v20 doubleValue:v22];
    [(HKActivityCache *)v5 _setActiveHoursGoal:v23];
  }
LABEL_16:
  if ([v4 containsValueForKey:@"activeHoursGoalDate"])
  {
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeHoursGoalDate"];
    [(HKActivityCache *)v5 _setActiveHoursGoalDateOnly:v24];
  }
  if ([v4 containsValueForKey:@"briskMinutes"])
  {
    [v4 decodeDoubleForKey:@"briskMinutes"];
    -[HKActivityCache _setBriskMinutes:](v5, "_setBriskMinutes:");
  }
  if ([v4 containsValueForKey:@"briskMinutesGoalQuantity"])
  {
    BOOL v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"briskMinutesGoalQuantity"];
    [(HKActivityCache *)v5 _setBriskMinutesGoal:v25];
LABEL_24:

    goto LABEL_25;
  }
  if ([v4 containsValueForKey:@"briskMinutesGoal"])
  {
    [v4 decodeDoubleForKey:@"briskMinutesGoal"];
    double v27 = v26;
    BOOL v25 = +[HKUnit minuteUnit];
    BOOL v28 = +[HKQuantity quantityWithUnit:v25 doubleValue:v27];
    [(HKActivityCache *)v5 _setBriskMinutesGoal:v28];

    goto LABEL_24;
  }
LABEL_25:
  if ([v4 containsValueForKey:@"briskMinutesGoalDate"])
  {
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"briskMinutesGoalDate"];
    [(HKActivityCache *)v5 _setBriskMinutesGoalDateOnly:v29];
  }
  if ([v4 containsValueForKey:@"stepCount"]) {
    -[HKActivityCache _setStepCount:](v5, "_setStepCount:", [v4 decodeIntegerForKey:@"stepCount"]);
  }
  if ([v4 containsValueForKey:@"pushCount"]) {
    -[HKActivityCache _setPushCount:](v5, "_setPushCount:", [v4 decodeIntegerForKey:@"pushCount"]);
  }
  if ([v4 containsValueForKey:@"wheelchairUse"]) {
    -[HKActivityCache _setWheelchairUse:](v5, "_setWheelchairUse:", [v4 decodeIntegerForKey:@"wheelchairUse"]);
  }
  if ([v4 containsValueForKey:@"deepBreathingDuration"])
  {
    [v4 decodeDoubleForKey:@"deepBreathingDuration"];
    -[HKActivityCache _setDeepBreathingDuration:](v5, "_setDeepBreathingDuration:");
  }
  uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"walkRunDistance"];
  walkingAndRunningDistance = v5->_walkingAndRunningDistance;
  v5->_walkingAndRunningDistance = (HKQuantity *)v30;

  if ([v4 containsValueForKey:@"flightsClimbed"]) {
    -[HKActivityCache _setFlightsClimbed:](v5, "_setFlightsClimbed:", [v4 decodeIntegerForKey:@"flightsClimbed"]);
  }
  uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  int64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  id v34 = [v32 setWithArray:v33];
  uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"dailyEnergyBurnedStatistics"];
  dailyEnergyBurnedStatistics = v5->_dailyEnergyBurnedStatistics;
  v5->_dailyEnergyBurnedStatistics = (NSArray *)v35;

  double v37 = (void *)MEMORY[0x1E4F1CAD0];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  double v39 = [v37 setWithArray:v38];
  uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"dailyMoveMinutesStatistics"];
  dailyMoveMinutesStatistics = v5->_dailyMoveMinutesStatistics;
  v5->_dailyMoveMinutesStatistics = (NSArray *)v40;

  v42 = (void *)MEMORY[0x1E4F1CAD0];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  v44 = [v42 setWithArray:v43];
  uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"dailyBriskMinutesStatistics"];
  dailyBriskMinutesStatistics = v5->_dailyBriskMinutesStatistics;
  v5->_dailyBriskMinutesStatistics = (NSArray *)v45;

  if ([v4 containsValueForKey:@"activityMoveMode"])
  {
    unint64_t v47 = [v4 decodeIntegerForKey:@"activityMoveMode"];
    if (v47 <= 1) {
      uint64_t v48 = 1;
    }
    else {
      uint64_t v48 = v47;
    }
  }
  else
  {
    uint64_t v48 = 1;
  }
  [(HKActivityCache *)v5 _setActivityMoveMode:v48];
  if ([v4 containsValueForKey:@"paused"]) {
    uint64_t v49 = [v4 decodeBoolForKey:@"paused"];
  }
  else {
    uint64_t v49 = 0;
  }
  [(HKActivityCache *)v5 _setPaused:v49];
  if ([v4 containsValueForKey:@"version"]) {
    uint64_t v50 = [v4 decodeIntegerForKey:@"version"];
  }
  else {
    uint64_t v50 = 1;
  }
  [(HKActivityCache *)v5 _setVersion:v50];
LABEL_49:

  return v5;
}

- (int64_t)sequence
{
  return self->_sequence;
}

- (void)_setSequence:(int64_t)a3
{
  self->_sequence = a3;
}

- (NSDate)briskMinutesGoalDate
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (NSDate)activeHoursGoalDate
{
  return (NSDate *)objc_getProperty(self, a2, 232, 1);
}

@end
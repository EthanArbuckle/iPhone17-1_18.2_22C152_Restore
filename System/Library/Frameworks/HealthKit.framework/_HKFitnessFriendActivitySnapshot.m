@interface _HKFitnessFriendActivitySnapshot
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (id)_fitnessFriendActivitySnapshotWithFriendUUID:(id)a3 sourceUUID:(id)a4 startDate:(id)a5 endDate:(id)a6 snapshotIndex:(int64_t)a7 snapshotUploadedDate:(id)a8;
+ (id)_fitnessFriendActivitySnapshotWithSnapshotIndex:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 sourceUUID:(id)a6;
+ (id)_mostSignificantSnapshotAmongSnapshots:(id)a3;
+ (id)snapshotWithActivitySummary:(id)a3;
- (BOOL)hasCarriedForwardGoals;
- (NSDate)snapshotUploadedDate;
- (NSNumber)timeZoneOffsetFromUTCForNoon;
- (NSTimeZone)timeZone;
- (NSUUID)friendUUID;
- (NSUUID)sourceUUID;
- (_HKFitnessFriendActivitySnapshot)initWithCoder:(id)a3;
- (double)activeHours;
- (double)activeHoursGoal;
- (double)activeHoursGoalPercentage;
- (double)briskMinutes;
- (double)briskMinutesGoal;
- (double)briskMinutesGoalPercentage;
- (double)energyBurned;
- (double)energyBurnedGoal;
- (double)energyBurnedGoalPercentage;
- (double)mmg;
- (double)mmgp;
- (double)mmv;
- (double)pushCount;
- (double)stepCount;
- (double)walkingAndRunningDistance;
- (id)_mostSignificantSnapshot:(id)a3;
- (id)activitySummary;
- (id)description;
- (int64_t)amm;
- (int64_t)snapshotIndex;
- (int64_t)wheelchairUse;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveHours:(double)a3;
- (void)setActiveHoursGoal:(double)a3;
- (void)setAmm:(int64_t)a3;
- (void)setBriskMinutes:(double)a3;
- (void)setBriskMinutesGoal:(double)a3;
- (void)setEnergyBurned:(double)a3;
- (void)setEnergyBurnedGoal:(double)a3;
- (void)setFriendUUID:(id)a3;
- (void)setHasCarriedForwardGoals:(BOOL)a3;
- (void)setMmg:(double)a3;
- (void)setMmv:(double)a3;
- (void)setPushCount:(double)a3;
- (void)setSnapshotIndex:(int64_t)a3;
- (void)setSnapshotUploadedDate:(id)a3;
- (void)setSourceUUID:(id)a3;
- (void)setStepCount:(double)a3;
- (void)setTimeZoneOffsetFromUTCForNoon:(id)a3;
- (void)setWalkingAndRunningDistance:(double)a3;
- (void)setWheelchairUse:(int64_t)a3;
@end

@implementation _HKFitnessFriendActivitySnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKFitnessFriendActivitySnapshot;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_friendUUID, @"FriendUUID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sourceUUID forKey:@"SourceUUID"];
  [v4 encodeInt64:self->_snapshotIndex forKey:@"SnapshotIndex"];
  [v4 encodeObject:self->_snapshotUploadedDate forKey:@"SnapshotUploadedDate"];
  [v4 encodeObject:self->_timeZoneOffsetFromUTCForNoon forKey:@"TimeZoneOffsetForNoonFromUTC"];
  [v4 encodeDouble:@"ActiveHours" forKey:self->_activeHours];
  [v4 encodeDouble:@"ActiveHoursGoal" forKey:self->_activeHoursGoal];
  [v4 encodeDouble:@"BriskMinutes" forKey:self->_briskMinutes];
  [v4 encodeDouble:@"BriskMinutesGoal" forKey:self->_briskMinutesGoal];
  [v4 encodeDouble:@"EnergyBurned" forKey:self->_energyBurned];
  [v4 encodeDouble:@"EnergyBurnedGoal" forKey:self->_energyBurnedGoal];
  [v4 encodeDouble:@"MoveMinutes" forKey:self->_mmv];
  [v4 encodeDouble:@"MoveMinutesGoal" forKey:self->_mmg];
  [v4 encodeInteger:self->_amm forKey:@"ActivityMoveMode"];
  [v4 encodeDouble:@"StepCount" forKey:self->_stepCount];
  [v4 encodeDouble:@"PushCount" forKey:self->_pushCount];
  [v4 encodeInteger:self->_wheelchairUse forKey:@"WheelchairUse"];
  [v4 encodeDouble:@"WalkingAndRunningDistance" forKey:self->_walkingAndRunningDistance];
}

+ (id)snapshotWithActivitySummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _activitySummaryIndex];
  objc_super v5 = [v3 _startDate];
  v6 = [v3 _endDate];
  v7 = +[_HKFitnessFriendActivitySnapshot _fitnessFriendActivitySnapshotWithSnapshotIndex:v4 startDate:v5 endDate:v6 sourceUUID:0];

  objc_msgSend(v7, "setAmm:", objc_msgSend(v3, "activityMoveMode"));
  v8 = [v3 appleMoveTime];
  v9 = +[HKUnit minuteUnit];
  [v8 doubleValueForUnit:v9];
  objc_msgSend(v7, "setMmv:");

  v10 = [v3 appleMoveTimeGoal];
  v11 = +[HKUnit minuteUnit];
  [v10 doubleValueForUnit:v11];
  objc_msgSend(v7, "setMmg:");

  v12 = [v3 activeEnergyBurned];
  v13 = +[HKUnit kilocalorieUnit];
  [v12 doubleValueForUnit:v13];
  objc_msgSend(v7, "setEnergyBurned:");

  v14 = [v3 activeEnergyBurnedGoal];
  v15 = +[HKUnit kilocalorieUnit];
  [v14 doubleValueForUnit:v15];
  objc_msgSend(v7, "setEnergyBurnedGoal:");

  v16 = [v3 appleExerciseTime];
  v17 = +[HKUnit minuteUnit];
  [v16 doubleValueForUnit:v17];
  objc_msgSend(v7, "setBriskMinutes:");

  v18 = [v3 exerciseTimeGoal];
  v19 = +[HKUnit minuteUnit];
  [v18 doubleValueForUnit:v19];
  objc_msgSend(v7, "setBriskMinutesGoal:");

  v20 = [v3 appleStandHours];
  v21 = +[HKUnit countUnit];
  [v20 doubleValueForUnit:v21];
  objc_msgSend(v7, "setActiveHours:");

  v22 = [v3 standHoursGoal];
  v23 = +[HKUnit countUnit];
  [v22 doubleValueForUnit:v23];
  objc_msgSend(v7, "setActiveHoursGoal:");

  v24 = [v3 stepCount];
  v25 = +[HKUnit countUnit];
  [v24 doubleValueForUnit:v25];
  [v7 setStepCount:(double)(uint64_t)v26];

  v27 = [v3 distanceWalkingRunning];
  v28 = +[HKUnit meterUnit];
  [v27 doubleValueForUnit:v28];
  objc_msgSend(v7, "setWalkingAndRunningDistance:");

  v29 = [v3 _pushCount];
  v30 = +[HKUnit countUnit];
  [v29 doubleValueForUnit:v30];
  [v7 setPushCount:(double)(uint64_t)v31];

  uint64_t v32 = [v3 _wheelchairUse];
  [v7 setWheelchairUse:v32];
  v33 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  v34 = [MEMORY[0x1E4F1C9C8] date];
  v35 = [v33 components:30 fromDate:v34];

  [v35 setHour:12];
  v36 = [v33 dateFromComponents:v35];
  v37 = [v33 timeZone];
  uint64_t v38 = [v37 secondsFromGMTForDate:v36];

  v39 = [NSNumber numberWithInteger:v38];
  [v7 setTimeZoneOffsetFromUTCForNoon:v39];

  return v7;
}

+ (id)_fitnessFriendActivitySnapshotWithSnapshotIndex:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 sourceUUID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = +[HKObjectType fitnessFriendActivitySnapshotType];
  [v12 timeIntervalSinceReferenceDate];
  double v15 = v14;

  [v11 timeIntervalSinceReferenceDate];
  double v17 = v16;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __113___HKFitnessFriendActivitySnapshot__fitnessFriendActivitySnapshotWithSnapshotIndex_startDate_endDate_sourceUUID___block_invoke;
  v22[3] = &unk_1E58C1000;
  id v23 = v10;
  int64_t v24 = a3;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS____HKFitnessFriendActivitySnapshot;
  id v18 = v10;
  id v19 = objc_msgSendSuper2(&v21, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v13, 0, 0, v22, v15, v17);

  return v19;
}

- (void)setEnergyBurned:(double)a3
{
  self->_energyBurned = a3;
}

- (void)setEnergyBurnedGoal:(double)a3
{
  self->_energyBurnedGoal = a3;
}

- (void)setBriskMinutes:(double)a3
{
  self->_briskMinutes = a3;
}

- (void)setBriskMinutesGoal:(double)a3
{
  self->_briskMinutesGoal = a3;
}

- (void)setActiveHours:(double)a3
{
  self->_activeHours = a3;
}

- (void)setActiveHoursGoal:(double)a3
{
  self->_activeHoursGoal = a3;
}

- (void)setStepCount:(double)a3
{
  self->_stepCount = a3;
}

- (void)setWalkingAndRunningDistance:(double)a3
{
  self->_walkingAndRunningDistance = a3;
}

- (void)setPushCount:(double)a3
{
  self->_pushCount = a3;
}

- (void)setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
}

- (void)setTimeZoneOffsetFromUTCForNoon:(id)a3
{
}

- (void)setSourceUUID:(id)a3
{
}

- (int64_t)snapshotIndex
{
  return self->_snapshotIndex;
}

- (NSUUID)sourceUUID
{
  return self->_sourceUUID;
}

- (NSNumber)timeZoneOffsetFromUTCForNoon
{
  return self->_timeZoneOffsetFromUTCForNoon;
}

- (double)energyBurned
{
  return self->_energyBurned;
}

- (double)energyBurnedGoal
{
  return self->_energyBurnedGoal;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (double)briskMinutesGoal
{
  return self->_briskMinutesGoal;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (double)activeHoursGoal
{
  return self->_activeHoursGoal;
}

- (double)walkingAndRunningDistance
{
  return self->_walkingAndRunningDistance;
}

- (double)stepCount
{
  return self->_stepCount;
}

- (double)pushCount
{
  return self->_pushCount;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneOffsetFromUTCForNoon, 0);
  objc_storeStrong((id *)&self->_snapshotUploadedDate, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);

  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (void)setFriendUUID:(id)a3
{
}

- (void)setSnapshotUploadedDate:(id)a3
{
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

- (NSTimeZone)timeZone
{
  id v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  timeZoneOffsetFromUTCForNoon = self->_timeZoneOffsetFromUTCForNoon;
  if (timeZoneOffsetFromUTCForNoon)
  {
    uint64_t v5 = [(NSNumber *)timeZoneOffsetFromUTCForNoon integerValue];
    uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:v5];

    id v3 = (void *)v6;
  }

  return (NSTimeZone *)v3;
}

- (NSDate)snapshotUploadedDate
{
  return self->_snapshotUploadedDate;
}

- (void)setSnapshotIndex:(int64_t)a3
{
  self->_snapshotIndex = a3;
}

+ (id)_mostSignificantSnapshotAmongSnapshots:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 firstObject];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      id v10 = v4;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v4 = objc_msgSend(v10, "_mostSignificantSnapshot:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);

        ++v9;
        id v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_fitnessFriendActivitySnapshotWithFriendUUID:(id)a3 sourceUUID:(id)a4 startDate:(id)a5 endDate:(id)a6 snapshotIndex:(int64_t)a7 snapshotUploadedDate:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  if (v15)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"_HKFitnessFriendActivitySnapshot.m", 85, @"Invalid parameter not satisfying: %@", @"friendUUID != nil" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
LABEL_10:
      uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, a1, @"_HKFitnessFriendActivitySnapshot.m", 87, @"Invalid parameter not satisfying: %@", @"endDate != nil" object file lineNumber description];

      if (v19) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  double v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, a1, @"_HKFitnessFriendActivitySnapshot.m", 86, @"Invalid parameter not satisfying: %@", @"startDate != nil" object file lineNumber description];

  if (!v18) {
    goto LABEL_10;
  }
LABEL_4:
  if (v19) {
    goto LABEL_5;
  }
LABEL_11:
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, a1, @"_HKFitnessFriendActivitySnapshot.m", 88, @"Invalid parameter not satisfying: %@", @"snapshotUploadedDate != nil" object file lineNumber description];

LABEL_5:
  v20 = +[HKObjectType fitnessFriendActivitySnapshotType];
  [v17 timeIntervalSinceReferenceDate];
  double v22 = v21;
  [v18 timeIntervalSinceReferenceDate];
  double v24 = v23;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __145___HKFitnessFriendActivitySnapshot__fitnessFriendActivitySnapshotWithFriendUUID_sourceUUID_startDate_endDate_snapshotIndex_snapshotUploadedDate___block_invoke;
  v35[3] = &unk_1E58C0FD8;
  id v36 = v15;
  id v37 = v19;
  id v38 = v16;
  int64_t v39 = a7;
  v34.receiver = a1;
  v34.super_class = (Class)&OBJC_METACLASS____HKFitnessFriendActivitySnapshot;
  id v25 = v16;
  id v26 = v19;
  id v27 = v15;
  id v28 = objc_msgSendSuper2(&v34, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v20, 0, 0, v35, v22, v24);

  return v28;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"FFActivitySnapshot(%f/%f, %f/%f, %f/%f, %f/%f, %lu, %f)", *(void *)&self->_energyBurned, *(void *)&self->_energyBurnedGoal, *(void *)&self->_mmv, *(void *)&self->_mmg, *(void *)&self->_briskMinutes, *(void *)&self->_briskMinutesGoal, *(void *)&self->_activeHours, *(void *)&self->_activeHoursGoal, (unint64_t)self->_stepCount, *(void *)&self->_walkingAndRunningDistance];
}

- (id)activitySummary
{
  id v3 = objc_alloc_init(HKActivitySummary);
  [(HKActivitySummary *)v3 _setActivitySummaryIndex:[(_HKFitnessFriendActivitySnapshot *)self snapshotIndex]];
  uint64_t v4 = [(HKSample *)self startDate];
  [(HKActivitySummary *)v3 _setStartDate:v4];

  id v5 = [(HKSample *)self endDate];
  [(HKActivitySummary *)v3 _setEndDate:v5];

  uint64_t v6 = +[HKUnit kilocalorieUnit];
  [(_HKFitnessFriendActivitySnapshot *)self energyBurned];
  uint64_t v7 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6);
  [(HKActivitySummary *)v3 setActiveEnergyBurned:v7];

  uint64_t v8 = +[HKUnit kilocalorieUnit];
  [(_HKFitnessFriendActivitySnapshot *)self energyBurnedGoal];
  uint64_t v9 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
  [(HKActivitySummary *)v3 setActiveEnergyBurnedGoal:v9];

  id v10 = +[HKUnit minuteUnit];
  [(_HKFitnessFriendActivitySnapshot *)self mmv];
  id v11 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v10);
  [(HKActivitySummary *)v3 setAppleMoveTime:v11];

  long long v12 = +[HKUnit minuteUnit];
  [(_HKFitnessFriendActivitySnapshot *)self mmg];
  long long v13 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v12);
  [(HKActivitySummary *)v3 setAppleMoveTimeGoal:v13];

  [(HKActivitySummary *)v3 setActivityMoveMode:[(_HKFitnessFriendActivitySnapshot *)self amm]];
  long long v14 = +[HKUnit minuteUnit];
  [(_HKFitnessFriendActivitySnapshot *)self briskMinutes];
  id v15 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v14);
  [(HKActivitySummary *)v3 setAppleExerciseTime:v15];

  [(_HKFitnessFriendActivitySnapshot *)self briskMinutesGoal];
  if (v16 > 0.0)
  {
    id v17 = +[HKUnit minuteUnit];
    [(_HKFitnessFriendActivitySnapshot *)self briskMinutesGoal];
    id v18 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v17);
    [(HKActivitySummary *)v3 setExerciseTimeGoal:v18];
  }
  id v19 = +[HKUnit countUnit];
  [(_HKFitnessFriendActivitySnapshot *)self activeHours];
  v20 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v19);
  [(HKActivitySummary *)v3 setAppleStandHours:v20];

  [(_HKFitnessFriendActivitySnapshot *)self activeHoursGoal];
  if (v21 > 0.0)
  {
    double v22 = +[HKUnit countUnit];
    [(_HKFitnessFriendActivitySnapshot *)self activeHoursGoal];
    double v23 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v22);
    [(HKActivitySummary *)v3 setStandHoursGoal:v23];
  }
  double v24 = +[HKUnit meterUnit];
  [(_HKFitnessFriendActivitySnapshot *)self walkingAndRunningDistance];
  id v25 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v24);
  [(HKActivitySummary *)v3 setDistanceWalkingRunning:v25];

  id v26 = +[HKUnit countUnit];
  [(_HKFitnessFriendActivitySnapshot *)self stepCount];
  id v27 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v26);
  [(HKActivitySummary *)v3 setStepCount:v27];

  id v28 = +[HKUnit countUnit];
  [(_HKFitnessFriendActivitySnapshot *)self pushCount];
  v29 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v28);
  [(HKActivitySummary *)v3 _setPushCount:v29];

  [(HKActivitySummary *)v3 _setWheelchairUse:[(_HKFitnessFriendActivitySnapshot *)self wheelchairUse]];

  return v3;
}

- (id)_mostSignificantSnapshot:(id)a3
{
  uint64_t v4 = (_HKFitnessFriendActivitySnapshot *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  [(_HKFitnessFriendActivitySnapshot *)v4 mmv];
  double v7 = v6;
  [(_HKFitnessFriendActivitySnapshot *)self mmv];
  uint64_t v8 = v5;
  if (v7 <= v9)
  {
    [(_HKFitnessFriendActivitySnapshot *)v5 energyBurned];
    double v11 = v10;
    [(_HKFitnessFriendActivitySnapshot *)self energyBurned];
    uint64_t v8 = v5;
    if (v11 <= v12) {
LABEL_4:
    }
      uint64_t v8 = self;
  }
  long long v13 = v8;

  return v13;
}

- (double)energyBurnedGoalPercentage
{
  double energyBurnedGoal = self->_energyBurnedGoal;
  double result = 0.0;
  if (energyBurnedGoal > 0.0) {
    return self->_energyBurned / energyBurnedGoal;
  }
  return result;
}

- (double)mmgp
{
  double mmg = self->_mmg;
  double result = 0.0;
  if (mmg > 0.0) {
    return self->_mmv / mmg;
  }
  return result;
}

- (double)briskMinutesGoalPercentage
{
  double briskMinutesGoal = self->_briskMinutesGoal;
  double result = 0.0;
  if (briskMinutesGoal > 0.0) {
    return self->_briskMinutes / briskMinutesGoal;
  }
  return result;
}

- (double)activeHoursGoalPercentage
{
  double activeHoursGoal = self->_activeHoursGoal;
  double result = 0.0;
  if (activeHoursGoal > 0.0) {
    return self->_activeHours / activeHoursGoal;
  }
  return result;
}

- (_HKFitnessFriendActivitySnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_HKFitnessFriendActivitySnapshot;
  id v5 = [(HKSample *)&v26 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FriendUUID"];
    friendUUID = v5->_friendUUID;
    v5->_friendUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceUUID"];
    sourceUUID = v5->_sourceUUID;
    v5->_sourceUUID = (NSUUID *)v8;

    v5->_snapshotIndex = [v4 decodeInt64ForKey:@"SnapshotIndex"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SnapshotUploadedDate"];
    snapshotUploadedDate = v5->_snapshotUploadedDate;
    v5->_snapshotUploadedDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TimeZoneOffsetForNoonFromUTC"];
    timeZoneOffsetFromUTCForNoon = v5->_timeZoneOffsetFromUTCForNoon;
    v5->_timeZoneOffsetFromUTCForNoon = (NSNumber *)v12;

    [v4 decodeDoubleForKey:@"ActiveHours"];
    v5->_activeHours = v14;
    [v4 decodeDoubleForKey:@"ActiveHoursGoal"];
    v5->_double activeHoursGoal = v15;
    [v4 decodeDoubleForKey:@"BriskMinutes"];
    v5->_briskMinutes = v16;
    [v4 decodeDoubleForKey:@"BriskMinutesGoal"];
    v5->_double briskMinutesGoal = v17;
    [v4 decodeDoubleForKey:@"EnergyBurned"];
    v5->_energyBurned = v18;
    [v4 decodeDoubleForKey:@"EnergyBurnedGoal"];
    v5->_double energyBurnedGoal = v19;
    [v4 decodeDoubleForKey:@"MoveMinutes"];
    v5->_mmv = v20;
    [v4 decodeDoubleForKey:@"MoveMinutesGoal"];
    v5->_double mmg = v21;
    v5->_amm = [v4 decodeIntegerForKey:@"ActivityMoveMode"];
    [v4 decodeDoubleForKey:@"StepCount"];
    v5->_stepCount = v22;
    [v4 decodeDoubleForKey:@"PushCount"];
    v5->_pushCount = v23;
    v5->_wheelchairUse = [v4 decodeIntegerForKey:@"WheelchairUse"];
    [v4 decodeDoubleForKey:@"WalkingAndRunningDistance"];
    v5->_walkingAndRunningDistance = v24;
  }

  return v5;
}

- (double)mmv
{
  return self->_mmv;
}

- (void)setMmv:(double)a3
{
  self->_mmv = a3;
}

- (double)mmg
{
  return self->_mmg;
}

- (void)setMmg:(double)a3
{
  self->_double mmg = a3;
}

- (int64_t)amm
{
  return self->_amm;
}

- (void)setAmm:(int64_t)a3
{
  self->_amm = a3;
}

- (BOOL)hasCarriedForwardGoals
{
  return self->_hasCarriedForwardGoals;
}

- (void)setHasCarriedForwardGoals:(BOOL)a3
{
  self->_hasCarriedForwardGoals = a3;
}

@end
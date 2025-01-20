@interface HKMedicationSchedule
+ (BOOL)supportsSecureCoding;
+ (HKMedicationSchedule)_activeXDaysPauseYDaysWithUUID:(void *)a3 medicationIdentifier:(void *)a4 createdUTCOffset:(void *)a5 startDateTime:(void *)a6 endDateTime:(void *)a7 timeIntervals:(void *)a8 cycleStartDateComponents:(void *)a9 note:(unint64_t)a10 scheduleType:;
+ (HKMedicationSchedule)_deletedScheduleWithUUID:(void *)a3 medicationUUID:(void *)a4 creationTimestamp:;
+ (HKMedicationSchedule)_invalidScheduleWithUUID:(void *)a3 medicationUUID:(void *)a4 medicationIdentifier:(void *)a5 creationTimestamp:;
+ (HKMedicationSchedule)_unavailableScheduleWithUUID:(void *)a3 medicationUUID:(void *)a4 medicationIdentifier:(void *)a5 creationTimestamp:(uint64_t)a6 compatibilityRange:;
+ (id)activeXDaysPauseYDaysWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10;
+ (id)activeXWeeksPauseYWeeksWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10;
+ (id)dailyScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9;
+ (id)daysOfWeekScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9;
+ (id)differentDosesDaysOfWeekScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9;
+ (id)everyXDaysScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10;
+ (void)_assertCycleIndexIsNilForInterval:(unint64_t)a3 scheduleType:;
+ (void)_assertCycleIntervalDaysIsNilForInterval:(unint64_t)a3 scheduleType:;
+ (void)_assertDaysOfTheWeekNoneForInterval:(unint64_t)a3 scheduleType:;
+ (void)_assertDoseGreaterThanZeroForInterval:(unint64_t)a3 scheduleType:;
+ (void)_validateActiveXPauseYScheduleTimeIntervals:(unint64_t)a3 scheduleType:;
+ (void)_validateActiveXWeeksPauseYWeeksTimeIntervals:(unint64_t)a3 scheduleType:;
+ (void)_validateDailyScheduleTimeIntervals:(uint64_t)a1;
+ (void)_validateDaysOfWeekScheduleTimeIntervals:(unint64_t)a3 scheduleType:;
+ (void)_validateEveryXDaysScheduleTimeIntervals:(uint64_t)a1;
- ($0AC6E346AE4835514AAA8AC86D8F4844)compatibilityRange;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdenticalToMedicationSchedule:(id)a3;
- (BOOL)isInvalid;
- (BOOL)isUnavailable;
- (BOOL)needsToBeMadeUnavailable;
- (HKMedicationSchedule)init;
- (HKMedicationSchedule)initWithCoder:(id)a3;
- (HKMedicationSchedule)initWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 scheduleType:(int64_t)a9 cycleStartDateComponents:(id)a10 note:(id)a11;
- (HKMedicationSchedule)initWithUUID:(id)a3 medicationUUID:(id)a4 medicationIdentifier:(id)a5 createdUTCOffset:(id)a6 startDateTime:(id)a7 endDateTime:(id)a8 timeIntervals:(id)a9 scheduleType:(int64_t)a10 displayOptions:(unint64_t)a11 cycleStartDateComponents:(id)a12 deleted:(BOOL)a13 creationTimestamp:(double)a14 note:(id)a15 compatibilityVersionRange:(id)a16;
- (NSArray)timeIntervals;
- (NSDate)endDateTime;
- (NSDate)startDateTime;
- (NSDateComponents)cycleStartDate;
- (NSString)medicationIdentifier;
- (NSString)note;
- (NSTimeZone)createdUTCOffset;
- (NSUUID)UUID;
- (NSUUID)medicationUUID;
- (double)creationTimestamp;
- (id)_copyByReplacingCompatibilityVersionRange:(id)a3;
- (id)_getIntervalLengths;
- (id)_timeIntervalsString;
- (id)copyByRemovingEndDateAndSetStartDateToToday;
- (id)copyScheduleForMedication:(id)a3;
- (id)dayInCycleFor:(id)a3 calendar:(id)a4;
- (id)deletedSchedule;
- (id)description;
- (id)unavailableSchedule;
- (int64_t)frequencyType;
- (int64_t)scheduleType;
- (uint64_t)_daysFromCycleStartForCalendar:(void *)a3 toDate:;
- (unint64_t)displayOptions;
- (unint64_t)hash;
- (void)_setMedicationUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updateDisplayOptions:(unint64_t)a3;
@end

@implementation HKMedicationSchedule

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (int64_t)scheduleType
{
  return self->_scheduleType;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)compatibilityRange
{
  int64_t origin = self->_compatibilityRange.origin;
  int64_t minimum = self->_compatibilityRange.minimum;
  result.var1 = origin;
  result.var0 = minimum;
  return result;
}

- (NSArray)timeIntervals
{
  return self->_timeIntervals;
}

- (NSDate)startDateTime
{
  return self->_startDateTime;
}

- (NSString)note
{
  return self->_note;
}

- (NSUUID)medicationUUID
{
  return self->_medicationUUID;
}

- (int64_t)frequencyType
{
  return self->_frequencyType;
}

- (NSDate)endDateTime
{
  return self->_endDateTime;
}

- (NSDateComponents)cycleStartDate
{
  return self->_cycleStartDate;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (NSTimeZone)createdUTCOffset
{
  return self->_createdUTCOffset;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"uuid"];
  [v5 encodeObject:self->_medicationUUID forKey:@"medicationUUID"];
  [v5 encodeObject:self->_medicationIdentifier forKey:@"medicationIdentifier"];
  [v5 encodeObject:self->_createdUTCOffset forKey:@"createdUTCOffset"];
  [v5 encodeObject:self->_startDateTime forKey:@"startDateTime"];
  [v5 encodeObject:self->_endDateTime forKey:@"endDateTime"];
  [v5 encodeObject:self->_timeIntervals forKey:@"timeIntervals"];
  [v5 encodeInteger:self->_frequencyType forKey:@"frequencyType"];
  [v5 encodeObject:self->_cycleStartDate forKey:@"cycleStartDate"];
  [v5 encodeObject:self->_note forKey:@"note"];
  [v5 encodeDouble:@"creationTimestamp" forKey:self->_creationTimestamp];
  [v5 encodeBool:self->_deleted forKey:@"deleted"];
  [v5 encodeInteger:self->_compatibilityRange.minimum forKey:@"compatibilityVersionMinimum"];
  [v5 encodeInteger:self->_compatibilityRange.origin forKey:@"compatibilityVersionOrigin"];
  [v5 encodeInteger:self->_scheduleType forKey:@"scheduleType"];
  [v5 encodeInteger:self->_displayOptions forKey:@"displayOptions"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_cycleStartDate, 0);
  objc_storeStrong((id *)&self->_timeIntervals, 0);
  objc_storeStrong((id *)&self->_endDateTime, 0);
  objc_storeStrong((id *)&self->_startDateTime, 0);
  objc_storeStrong((id *)&self->_createdUTCOffset, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_medicationUUID, 0);
}

- (HKMedicationSchedule)initWithUUID:(id)a3 medicationUUID:(id)a4 medicationIdentifier:(id)a5 createdUTCOffset:(id)a6 startDateTime:(id)a7 endDateTime:(id)a8 timeIntervals:(id)a9 scheduleType:(int64_t)a10 displayOptions:(unint64_t)a11 cycleStartDateComponents:(id)a12 deleted:(BOOL)a13 creationTimestamp:(double)a14 note:(id)a15 compatibilityVersionRange:(id)a16
{
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  id v27 = a7;
  id v28 = a8;
  id v29 = a9;
  id v30 = a12;
  id v31 = a15;
  v53.receiver = self;
  v53.super_class = (Class)HKMedicationSchedule;
  v32 = [(HKMedicationSchedule *)&v53 init];
  if (v32)
  {
    uint64_t v33 = [v23 copy];
    v34 = (void *)*((void *)v32 + 3);
    *((void *)v32 + 3) = v33;

    uint64_t v35 = [v24 copy];
    v36 = (void *)*((void *)v32 + 1);
    *((void *)v32 + 1) = v35;

    uint64_t v37 = [v25 copy];
    v38 = (void *)*((void *)v32 + 4);
    *((void *)v32 + 4) = v37;

    uint64_t v39 = [v26 copy];
    v40 = (void *)*((void *)v32 + 5);
    *((void *)v32 + 5) = v39;

    uint64_t v41 = [v27 copy];
    v42 = (void *)*((void *)v32 + 6);
    *((void *)v32 + 6) = v41;

    uint64_t v43 = [v28 copy];
    v44 = (void *)*((void *)v32 + 7);
    *((void *)v32 + 7) = v43;

    uint64_t v45 = [v29 copy];
    v46 = (void *)*((void *)v32 + 8);
    *((void *)v32 + 8) = v45;

    if ((unint64_t)a10 > 8) {
      uint64_t v47 = 4;
    }
    else {
      uint64_t v47 = qword_1BCB6BF70[a10];
    }
    *((void *)v32 + 9) = v47;
    *((void *)v32 + 11) = a11;
    uint64_t v48 = [v30 copy];
    v49 = (void *)*((void *)v32 + 12);
    *((void *)v32 + 12) = v48;

    uint64_t v50 = [v31 copy];
    v51 = (void *)*((void *)v32 + 13);
    *((void *)v32 + 13) = v50;

    *((double *)v32 + 14) = a14;
    v32[16] = a13;
    *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v32 + 120) = a16;
    *((void *)v32 + 10) = a10;
  }

  return (HKMedicationSchedule *)v32;
}

- (HKMedicationSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HKMedicationSchedule;
  id v5 = [(HKMedicationSchedule *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"medicationUUID"];
    medicationUUID = v5->_medicationUUID;
    v5->_medicationUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"medicationIdentifier"];
    medicationIdentifier = v5->_medicationIdentifier;
    v5->_medicationIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdUTCOffset"];
    createdUTCOffset = v5->_createdUTCOffset;
    v5->_createdUTCOffset = (NSTimeZone *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDateTime"];
    startDateTime = v5->_startDateTime;
    v5->_startDateTime = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDateTime"];
    endDateTime = v5->_endDateTime;
    v5->_endDateTime = (NSDate *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"timeIntervals"];
    timeIntervals = v5->_timeIntervals;
    v5->_timeIntervals = (NSArray *)v19;

    v5->_uint64_t frequencyType = [v4 decodeIntegerForKey:@"frequencyType"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cycleStartDate"];
    cycleStartDate = v5->_cycleStartDate;
    v5->_cycleStartDate = (NSDateComponents *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"note"];
    note = v5->_note;
    v5->_note = (NSString *)v23;

    [v4 decodeDoubleForKey:@"creationTimestamp"];
    v5->_creationTimestamp = v25;
    v5->_deleted = [v4 decodeBoolForKey:@"deleted"];
    if ([v4 containsValueForKey:@"scheduleType"]) {
      uint64_t frequencyType = [v4 decodeIntegerForKey:@"scheduleType"];
    }
    else {
      uint64_t frequencyType = v5->_frequencyType;
    }
    v5->_scheduleType = frequencyType;
    if ([v4 containsValueForKey:@"displayOptions"]) {
      uint64_t v27 = [v4 decodeIntegerForKey:@"displayOptions"];
    }
    else {
      uint64_t v27 = 0;
    }
    v5->_displayOptions = v27;
    uint64_t v28 = [v4 decodeIntegerForKey:@"compatibilityVersionMinimum"];
    uint64_t v29 = [v4 decodeIntegerForKey:@"compatibilityVersionOrigin"];
    v5->_compatibilityRange.int64_t minimum = v28;
    v5->_compatibilityRange.int64_t origin = v29;
  }

  return v5;
}

- (BOOL)isUnavailable
{
  return self->_compatibilityRange.minimum > self->_compatibilityRange.origin;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationSchedule)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationSchedule)initWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 scheduleType:(int64_t)a9 cycleStartDateComponents:(id)a10 note:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  uint64_t v25 = HKMedicationScheduleCompatibilityVersionForMedicationScheduleType(a9, (uint64_t)v20);
  LOBYTE(v28) = 0;
  id v26 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](self, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v24, 0, v23, v22, v21, v20, CFAbsoluteTimeGetCurrent(), v19, a9, 0, v18, v28, v17, v25, 1);

  return v26;
}

- (id)copyByRemovingEndDateAndSetStartDateToToday
{
  v3 = [HKMedicationSchedule alloc];
  id v23 = [MEMORY[0x1E4F29128] UUID];
  id v22 = [(HKMedicationSchedule *)self medicationUUID];
  id v20 = [(HKMedicationSchedule *)self medicationIdentifier];
  id v19 = [(HKMedicationSchedule *)self createdUTCOffset];
  id v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = [v21 startOfDayForDate:v4];
  uint64_t v6 = [(HKMedicationSchedule *)self timeIntervals];
  int64_t v7 = [(HKMedicationSchedule *)self scheduleType];
  unint64_t v8 = [(HKMedicationSchedule *)self displayOptions];
  v9 = [(HKMedicationSchedule *)self cycleStartDate];
  BOOL v10 = [(HKMedicationSchedule *)self isDeleted];
  [(HKMedicationSchedule *)self creationTimestamp];
  double v12 = v11;
  v13 = [(HKMedicationSchedule *)self note];
  uint64_t v18 = [(HKMedicationSchedule *)self compatibilityRange];
  LOBYTE(v17) = v10;
  v15 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v3, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v23, v22, v20, v19, v5, 0, v12, v6, v7, v8, v9, v17, v13, v18, v14);

  return v15;
}

- (id)copyScheduleForMedication:(id)a3
{
  id v4 = a3;
  uint64_t v17 = [HKMedicationSchedule alloc];
  id v5 = [(HKMedicationSchedule *)self UUID];
  uint64_t v6 = [v4 semanticIdentifier];

  int64_t v7 = [v6 stringValue];
  unint64_t v8 = [(HKMedicationSchedule *)self createdUTCOffset];
  v9 = [(HKMedicationSchedule *)self startDateTime];
  BOOL v10 = [(HKMedicationSchedule *)self endDateTime];
  double v11 = [(HKMedicationSchedule *)self timeIntervals];
  int64_t v12 = [(HKMedicationSchedule *)self scheduleType];
  v13 = [(HKMedicationSchedule *)self cycleStartDate];
  uint64_t v14 = [(HKMedicationSchedule *)self note];
  v15 = [(HKMedicationSchedule *)v17 initWithUUID:v5 medicationIdentifier:v7 createdUTCOffset:v8 startDateTime:v9 endDateTime:v10 timeIntervals:v11 scheduleType:v12 cycleStartDateComponents:v13 note:v14];

  return v15;
}

- (id)_copyByReplacingCompatibilityVersionRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v23 = [HKMedicationSchedule alloc];
  id v22 = [(HKMedicationSchedule *)self UUID];
  id v19 = [(HKMedicationSchedule *)self medicationUUID];
  id v4 = [(HKMedicationSchedule *)self medicationIdentifier];
  id v5 = [(HKMedicationSchedule *)self createdUTCOffset];
  uint64_t v6 = [(HKMedicationSchedule *)self startDateTime];
  int64_t v7 = [(HKMedicationSchedule *)self endDateTime];
  unint64_t v8 = [(HKMedicationSchedule *)self timeIntervals];
  int64_t v9 = [(HKMedicationSchedule *)self scheduleType];
  unint64_t v10 = [(HKMedicationSchedule *)self displayOptions];
  double v11 = [(HKMedicationSchedule *)self cycleStartDate];
  BOOL v12 = [(HKMedicationSchedule *)self isDeleted];
  [(HKMedicationSchedule *)self creationTimestamp];
  double v14 = v13;
  v15 = [(HKMedicationSchedule *)self note];
  LOBYTE(v18) = v12;
  uint64_t v16 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v23, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v22, v19, v4, v5, v6, v7, v14, v8, v9, v10, v11, v18, v15, var0, var1);

  return v16;
}

- (void)updateDisplayOptions:(unint64_t)a3
{
  self->_displayOptions = a3;
}

- (void)_setMedicationUUID:(id)a3
{
  self->_medicationUUID = (NSUUID *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)deletedSchedule
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  UUID = self->_UUID;
  medicationUUID = self->_medicationUUID;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v6 = +[HKMedicationSchedule _deletedScheduleWithUUID:medicationUUID:creationTimestamp:](Current, (uint64_t)HKMedicationSchedule, UUID, medicationUUID);
  _HKInitializeLogging();
  int64_t v7 = HKLogMedication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    uint64_t v10 = objc_opt_class();
    __int16 v11 = 2114;
    BOOL v12 = self;
    __int16 v13 = 2114;
    double v14 = v6;
    _os_log_impl(&dword_1BCB4A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] deleting: %{public}@ -> %{public}@", (uint8_t *)&v9, 0x20u);
  }

  return v6;
}

+ (HKMedicationSchedule)_deletedScheduleWithUUID:(void *)a3 medicationUUID:(void *)a4 creationTimestamp:
{
  id v6 = a4;
  id v7 = a3;
  self;
  unint64_t v8 = [HKMedicationSchedule alloc];
  int v9 = v6;
  if (!v6) {
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  }
  uint64_t v10 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  __int16 v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  LOBYTE(v14) = 1;
  BOOL v12 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v8, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v7, v9, 0, v10, v11, 0, a1, MEMORY[0x1E4F1CBF0], 0, 0, 0, v14, 0, 0, 1);

  if (!v6) {

  }
  return v12;
}

- (BOOL)needsToBeMadeUnavailable
{
  if ([(HKMedicationSchedule *)self isUnavailable]) {
    return 0;
  }
  if (self->_compatibilityRange.minimum > 1) {
    return 1;
  }

  return [(HKMedicationSchedule *)self isInvalid];
}

- (id)unavailableSchedule
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HKMedicationSchedule *)self isInvalid];
  medicationUUID = self->_medicationUUID;
  UUID = self->_UUID;
  medicationIdentifier = self->_medicationIdentifier;
  double creationTimestamp = self->_creationTimestamp;
  if (v3)
  {
    unint64_t v8 = +[HKMedicationSchedule _invalidScheduleWithUUID:medicationUUID:medicationIdentifier:creationTimestamp:](creationTimestamp, (uint64_t)HKMedicationSchedule, UUID, medicationUUID, medicationIdentifier);
  }
  else
  {
    unint64_t v8 = +[HKMedicationSchedule _unavailableScheduleWithUUID:medicationUUID:medicationIdentifier:creationTimestamp:compatibilityRange:](creationTimestamp, (uint64_t)HKMedicationSchedule, UUID, medicationUUID, medicationIdentifier, self->_compatibilityRange.minimum);
    _HKInitializeLogging();
    int v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543874;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2114;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1BCB4A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] unavailable-ing: %{public}@ -> %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }

  return v8;
}

+ (HKMedicationSchedule)_invalidScheduleWithUUID:(void *)a3 medicationUUID:(void *)a4 medicationIdentifier:(void *)a5 creationTimestamp:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  self;
  int v11 = [HKMedicationSchedule alloc];
  uint64_t v12 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  __int16 v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  LOBYTE(v16) = 0;
  uint64_t v14 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v11, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v10, v9, v8, v12, v13, 0, a1, MEMORY[0x1E4F1CBF0], 0, 0, 0, v16, 0, 0x7FFFFFFFLL, 1);

  return v14;
}

+ (HKMedicationSchedule)_unavailableScheduleWithUUID:(void *)a3 medicationUUID:(void *)a4 medicationIdentifier:(void *)a5 creationTimestamp:(uint64_t)a6 compatibilityRange:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = self;
  if (a6 <= 1)
  {
    uint64_t v19 = v13;
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:sel__unavailableScheduleWithUUID_medicationUUID_medicationIdentifier_creationTimestamp_compatibilityRange_, v19, @"HKMedicationSchedule.m", 266, @"Invalid parameter not satisfying: %@", @"compatibilityRange.minimum > HKMedicationScheduleCompatibilityVersionCurrent" object file lineNumber description];
  }
  uint64_t v14 = [HKMedicationSchedule alloc];
  __int16 v15 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  LOBYTE(v21) = 0;
  uint64_t v17 = -[HKMedicationSchedule initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:](v14, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v12, v11, v10, v15, v16, 0, a1, MEMORY[0x1E4F1CBF0], 0, 0, 0, v21, 0, a6, 1);

  return v17;
}

- (BOOL)isInvalid
{
  return !self->_frequencyType
      && !self->_scheduleType
      && ![(HKMedicationSchedule *)self isUnavailable]
      && !self->_deleted;
}

- (id)dayInCycleFor:(id)a3 calendar:(id)a4
{
  uint64_t v5 = -[HKMedicationSchedule _daysFromCycleStartForCalendar:toDate:](self, a4, a3);
  if (v5 < 0 || (uint64_t v6 = v5, [(HKMedicationSchedule *)self frequencyType] != 1))
  {
    _HKInitializeLogging();
    uint64_t v14 = HKLogMedication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HKMedicationSchedule dayInCycleFor:calendar:]();
    }

    uint64_t v13 = 0;
  }
  else
  {
    id v7 = -[HKMedicationSchedule _getIntervalLengths](self);
    uint64_t v8 = 0;
    unint64_t v9 = -1;
    do
    {
      unint64_t v9 = (v9 + 1) % [v7 count];
      id v10 = [v7 objectAtIndexedSubscript:v9];
      v8 += [v10 integerValue];
    }
    while (v8 <= v6);
    id v11 = [v7 objectAtIndexedSubscript:v9];
    uint64_t v12 = v6 - v8 + [v11 integerValue] + 1;

    uint64_t v13 = -[HKMedicationDayInCycleResult initWithDaysIntoCycle:isInPauseInterval:]([HKMedicationDayInCycleResult alloc], "initWithDaysIntoCycle:isInPauseInterval:", v12, v9 == [v7 count] - 1);
  }

  return v13;
}

- (uint64_t)_daysFromCycleStartForCalendar:(void *)a3 toDate:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = a3;
    id v7 = [a1 startDateTime];
    uint64_t v8 = [v5 components:124 fromDate:v7];

    unint64_t v9 = [a1 cycleStartDate];
    if (v9)
    {
      id v10 = [a1 cycleStartDate];
    }
    else
    {
      id v10 = v8;
    }
    id v11 = v10;

    uint64_t v12 = [v5 dateFromComponents:v11];
    uint64_t v13 = [v5 components:16 fromDate:v12 toDate:v6 options:2];

    uint64_t v14 = [v13 day];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_getIntervalLengths
{
  id v1 = a1;
  if (a1)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0x8000000000000000;
    v2 = [a1 timeIntervals];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__HKMedicationSchedule__getIntervalLengths__block_invoke;
    v13[3] = &unk_1E62EB3B8;
    v13[4] = v14;
    BOOL v3 = objc_msgSend(v2, "hk_map:", v13);

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [v1 scheduleType];
    id v6 = v3;
    if (v5 == 8)
    {
      int v7 = [v3 count];
      id v8 = objc_alloc(NSNumber);
      int v9 = v7 - 1;
      if (v7 - 1 < 0) {
        int v9 = v7;
      }
      id v10 = (void *)[v8 initWithInt:(7 * (v9 >> 1))];
      [v4 addObject:v10];

      id v11 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 1);
      [v4 addObject:v11];

      id v6 = v4;
    }
    id v1 = v6;

    _Block_object_dispose(v14, 8);
  }

  return v1;
}

id __43__HKMedicationSchedule__getIntervalLengths__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 cycleIndex];
  uint64_t v5 = v4;
  if (v4 && [v4 integerValue] == *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v6 = 0;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 integerValue];
    id v6 = [v3 cycleIntervalDays];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMedicationSchedule *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSUUID *)v4->_UUID isEqual:self->_UUID];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (BOOL)isIdenticalToMedicationSchedule:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_30;
  }
  if (![(HKMedicationSchedule *)self isEqual:v4]) {
    goto LABEL_30;
  }
  UUID = self->_UUID;
  id v6 = (NSUUID *)v4[3];
  if (UUID != v6 && (!v6 || !-[NSUUID isEqual:](UUID, "isEqual:"))) {
    goto LABEL_30;
  }
  medicationIdentifier = self->_medicationIdentifier;
  id v8 = (NSString *)v4[4];
  if (medicationIdentifier != v8 && (!v8 || !-[NSString isEqual:](medicationIdentifier, "isEqual:"))) {
    goto LABEL_30;
  }
  createdUTCOffset = self->_createdUTCOffset;
  id v10 = (NSTimeZone *)v4[5];
  if (createdUTCOffset != v10 && (!v10 || !-[NSTimeZone isEqual:](createdUTCOffset, "isEqual:"))) {
    goto LABEL_30;
  }
  startDateTime = self->_startDateTime;
  uint64_t v12 = (NSDate *)v4[6];
  if (startDateTime != v12 && (!v12 || !-[NSDate isEqual:](startDateTime, "isEqual:"))) {
    goto LABEL_30;
  }
  endDateTime = self->_endDateTime;
  uint64_t v14 = (NSDate *)v4[7];
  if (endDateTime != v14 && (!v14 || !-[NSDate isEqual:](endDateTime, "isEqual:"))) {
    goto LABEL_30;
  }
  timeIntervals = self->_timeIntervals;
  uint64_t v16 = (NSArray *)v4[8];
  if (timeIntervals != v16 && (!v16 || !-[NSArray isEqualToArray:](timeIntervals, "isEqualToArray:"))) {
    goto LABEL_30;
  }
  if (self->_frequencyType != v4[9]) {
    goto LABEL_30;
  }
  if (self->_scheduleType != v4[10]) {
    goto LABEL_30;
  }
  if (self->_displayOptions != v4[11]) {
    goto LABEL_30;
  }
  cycleStartDate = self->_cycleStartDate;
  uint64_t v18 = (NSDateComponents *)v4[12];
  if (cycleStartDate != v18 && (!v18 || !-[NSDateComponents isEqual:](cycleStartDate, "isEqual:"))) {
    goto LABEL_30;
  }
  note = self->_note;
  id v20 = (NSString *)v4[13];
  if (note == v20)
  {
    char v21 = 1;
    goto LABEL_31;
  }
  if (v20) {
    char v21 = -[NSString isEqual:](note, "isEqual:");
  }
  else {
LABEL_30:
  }
    char v21 = 0;
LABEL_31:

  return v21;
}

- (id)description
{
  uint64_t v18 = NSString;
  uint64_t v17 = objc_opt_class();
  id v3 = [(NSUUID *)self->_UUID UUIDString];
  id v4 = [(NSUUID *)self->_medicationUUID UUIDString];
  char v5 = HKSensitiveLogItem();
  NSInteger v6 = [(NSTimeZone *)self->_createdUTCOffset secondsFromGMT] / 3600;
  long long v16 = *(_OWORD *)&self->_startDateTime;
  long long v15 = *(_OWORD *)&self->_frequencyType;
  unint64_t displayOptions = self->_displayOptions;
  cycleStartDate = self->_cycleStartDate;
  double creationTimestamp = self->_creationTimestamp;
  if (self->_deleted) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  id v11 = HKMedicationScheduleCompatibilityRangeToString(self->_compatibilityRange.minimum, self->_compatibilityRange.origin);
  uint64_t v12 = -[HKMedicationSchedule _timeIntervalsString]((id *)&self->super.isa);
  uint64_t v13 = [v18 stringWithFormat:@"<%@: %p>: UUID: %@, medUUID: %@, medID: %@, timezoneOffset: %ld, startDateTime: %@, endDateTime: %@, frequencyType: %i, scheduleType: %i, displayOptions: %i, cycleStartDate: %@ creationTimestamp: %f, deleted: %@, compatibilityVersionRange: %@, timeIntervals:\n%@", v17, self, v3, v4, v5, v6, v16, v15, displayOptions, cycleStartDate, *(void *)&creationTimestamp, v10, v11, v12];

  return v13;
}

- (id)_timeIntervalsString
{
  id v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4F28E78] string];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = v1[8];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = NSString;
          int v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
          id v10 = [v8 stringWithFormat:@"%@\n", v9];
          [v2 appendString:v10];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    id v1 = [NSString stringWithString:v2];
  }

  return v1;
}

- (unint64_t)displayOptions
{
  return self->_displayOptions;
}

+ (id)dailyScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  +[HKMedicationSchedule _validateDailyScheduleTimeIntervals:]((uint64_t)a1, v17);
  id v23 = [[HKMedicationSchedule alloc] initWithUUID:v22 medicationIdentifier:v21 createdUTCOffset:v20 startDateTime:v19 endDateTime:v18 timeIntervals:v17 scheduleType:2 cycleStartDateComponents:0 note:v16];

  return v23;
}

+ (void)_validateDailyScheduleTimeIntervals:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        +[HKMedicationSchedule _assertDaysOfTheWeekNoneForInterval:scheduleType:](v3, v9, 2uLL);
        +[HKMedicationSchedule _assertCycleIndexIsNilForInterval:scheduleType:](v3, v9, 2uLL);
        +[HKMedicationSchedule _assertCycleIntervalDaysIsNilForInterval:scheduleType:](v3, v9, 2uLL);
        +[HKMedicationSchedule _assertDoseGreaterThanZeroForInterval:scheduleType:](v3, v9, 2uLL);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

+ (id)everyXDaysScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  +[HKMedicationSchedule _validateEveryXDaysScheduleTimeIntervals:]((uint64_t)a1, v19);
  uint64_t v25 = [[HKMedicationSchedule alloc] initWithUUID:v24 medicationIdentifier:v23 createdUTCOffset:v22 startDateTime:v21 endDateTime:v20 timeIntervals:v19 scheduleType:1 cycleStartDateComponents:v18 note:v17];

  return v25;
}

+ (void)_validateEveryXDaysScheduleTimeIntervals:(uint64_t)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v50;
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v6) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        +[HKMedicationSchedule _assertDaysOfTheWeekNoneForInterval:scheduleType:](v3, v9, 1uLL);
        long long v10 = [v9 cycleIndex];
        if ([v10 integerValue])
        {
          long long v11 = [v9 cycleIndex];
          uint64_t v12 = [v11 integerValue];

          if (v12 == 1) {
            goto LABEL_10;
          }
          long long v13 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v14 = objc_opt_class();
          long long v10 = HKStringFromMedicationScheduleType(1uLL);
          uint64_t v15 = [v9 cycleIndex];
          [v13 raise:v7, @"%@ with type %@ cannot have an interval with cycle index %ld", v14, v10, objc_msgSend(v15, "longValue") format];
        }
LABEL_10:
        id v16 = [v9 cycleIndex];
        uint64_t v17 = [v16 integerValue];

        if (!v17)
        {
          id v18 = [v9 dose];
          [v18 doubleValue];
          double v20 = v19;

          if (v20 <= 0.0)
          {
            id v21 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v22 = objc_opt_class();
            id v23 = HKStringFromMedicationScheduleType(1uLL);
            id v24 = [v9 dose];
            [v24 doubleValue];
            [v21 raise:v7, @"%@ with type %@ cannot have an interval for the on phase with dose %f <= 0", v22, v23, v25 format];
          }
          id v26 = [v9 cycleIntervalDays];
          uint64_t v27 = [v26 integerValue];

          if (v27 != 1)
          {
            uint64_t v28 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v29 = objc_opt_class();
            id v30 = HKStringFromMedicationScheduleType(1uLL);
            objc_super v31 = [v9 cycleIntervalDays];
            [v28 raise:v7, @"%@ with type %@ cannot have an interval for the on phase with cycleIntervalDays %ld != 1", v29, v30, objc_msgSend(v31, "longValue") format];
          }
        }
        v32 = [v9 cycleIndex];
        uint64_t v33 = [v32 integerValue];

        if (v33 == 1)
        {
          v34 = [v9 dose];
          [v34 doubleValue];
          double v36 = v35;

          if (v36 != 0.0)
          {
            uint64_t v37 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v38 = objc_opt_class();
            uint64_t v39 = HKStringFromMedicationScheduleType(1uLL);
            v40 = [v9 dose];
            [v40 doubleValue];
            [v37 raise:v7, @"%@ with type %@ cannot have an interval for the off phase with dose %f != 0", v38, v39, v41 format];
          }
          v42 = [v9 cycleIntervalDays];
          uint64_t v43 = [v42 integerValue];

          if (v43 <= 0)
          {
            v44 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v45 = objc_opt_class();
            v46 = HKStringFromMedicationScheduleType(1uLL);
            uint64_t v47 = [v9 cycleIntervalDays];
            [v44 raise:v7, @"%@ with type %@ cannot have an interval for the off phase with cycleIntervalDays %ld < 1", v45, v46, objc_msgSend(v47, "longValue") format];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v5);
  }
}

+ (id)daysOfWeekScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  +[HKMedicationSchedule _validateDaysOfWeekScheduleTimeIntervals:scheduleType:]((uint64_t)a1, v17, 3uLL);
  id v23 = [[HKMedicationSchedule alloc] initWithUUID:v22 medicationIdentifier:v21 createdUTCOffset:v20 startDateTime:v19 endDateTime:v18 timeIntervals:v17 scheduleType:3 cycleStartDateComponents:0 note:v16];

  return v23;
}

+ (void)_validateDaysOfWeekScheduleTimeIntervals:(unint64_t)a3 scheduleType:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = self;
  if (a3 != 3 && a3 != 5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:sel__validateDaysOfWeekScheduleTimeIntervals_scheduleType_, v5, @"HKMedicationSchedule+Convenience.m", 227, @"Invalid parameter not satisfying: %@", @"scheduleType == HKMedicationScheduleTypeDaysOfWeek || scheduleType == HKMedicationScheduleTypeDifferentDosesDaysOfWeek" object file lineNumber description];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v23 = *(void *)v25;
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (![v11 daysOfWeek])
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = HKStringFromMedicationScheduleType(a3);
          uint64_t v15 = HKStringFromReminderWeekdayOptions([v11 daysOfWeek]);
          [v12 raise:v21, @"%@ with type %@ cannot have an interval with daysOfWeek %@", v13, v14, v15 format];
        }
        +[HKMedicationSchedule _assertCycleIndexIsNilForInterval:scheduleType:](v5, v11, a3);
        +[HKMedicationSchedule _assertCycleIntervalDaysIsNilForInterval:scheduleType:](v5, v11, a3);
        +[HKMedicationSchedule _assertDoseGreaterThanZeroForInterval:scheduleType:](v5, v11, a3);
        if (v9)
        {
          if (a3 == 3 && [v11 daysOfWeek] != v9)
          {
            id v16 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v17 = objc_opt_class();
            id v18 = HKStringFromMedicationScheduleType(3uLL);
            id v19 = HKStringFromReminderWeekdayOptions([v11 daysOfWeek]);
            id v20 = HKStringFromReminderWeekdayOptions(v9);
            [v16 raise:v21, @"%@ with type %@ cannot have an interval for days %@. All intervals must be for days %@", v17, v18, v19, v20 format];
          }
        }
        else
        {
          uint64_t v9 = [v11 daysOfWeek];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
}

+ (id)differentDosesDaysOfWeekScheduleWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 note:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  +[HKMedicationSchedule _validateDaysOfWeekScheduleTimeIntervals:scheduleType:]((uint64_t)a1, v17, 5uLL);
  uint64_t v23 = [[HKMedicationSchedule alloc] initWithUUID:v22 medicationIdentifier:v21 createdUTCOffset:v20 startDateTime:v19 endDateTime:v18 timeIntervals:v17 scheduleType:5 cycleStartDateComponents:0 note:v16];

  return v23;
}

+ (id)activeXDaysPauseYDaysWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10
{
  return +[HKMedicationSchedule _activeXDaysPauseYDaysWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:cycleStartDateComponents:note:scheduleType:]((uint64_t)a1, a3, a4, a5, a6, a7, a8, a9, a10, 7uLL);
}

+ (HKMedicationSchedule)_activeXDaysPauseYDaysWithUUID:(void *)a3 medicationIdentifier:(void *)a4 createdUTCOffset:(void *)a5 startDateTime:(void *)a6 endDateTime:(void *)a7 timeIntervals:(void *)a8 cycleStartDateComponents:(void *)a9 note:(unint64_t)a10 scheduleType:
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = a2;
  uint64_t v25 = self;
  +[HKMedicationSchedule _validateActiveXPauseYScheduleTimeIntervals:scheduleType:](v25, v19, a10);
  long long v26 = [[HKMedicationSchedule alloc] initWithUUID:v24 medicationIdentifier:v23 createdUTCOffset:v22 startDateTime:v21 endDateTime:v20 timeIntervals:v19 scheduleType:a10 cycleStartDateComponents:v18 note:v17];

  return v26;
}

+ (id)activeXWeeksPauseYWeeksWithUUID:(id)a3 medicationIdentifier:(id)a4 createdUTCOffset:(id)a5 startDateTime:(id)a6 endDateTime:(id)a7 timeIntervals:(id)a8 cycleStartDateComponents:(id)a9 note:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  +[HKMedicationSchedule _validateActiveXWeeksPauseYWeeksTimeIntervals:scheduleType:]((uint64_t)a1, v19, 8uLL);
  uint64_t v25 = +[HKMedicationSchedule _activeXDaysPauseYDaysWithUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:cycleStartDateComponents:note:scheduleType:]((uint64_t)a1, v24, v23, v22, v21, v20, v19, v18, v17, 8uLL);

  return v25;
}

+ (void)_validateActiveXWeeksPauseYWeeksTimeIntervals:(unint64_t)a3 scheduleType:
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  self;
  unint64_t v4 = [v3 count];
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (v4 <= 2)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = HKStringFromMedicationScheduleType(a3);
    [v6 raise:v7, @"%@ with type %@ must have at least 3 timeInterval objects for 1 day active, 6 days paused, and the week pause object.", v8, v9 format];
  }
  long long v10 = [v3 objectAtIndexedSubscript:0];
  long long v11 = [v10 cycleIndex];
  uint64_t v12 = [v11 integerValue];

  if ([v3 count])
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [v3 objectAtIndexedSubscript:v13];
      uint64_t v15 = [v14 cycleIndex];
      uint64_t v16 = [v15 integerValue];

      if (v16 > v12)
      {
        id v17 = [v3 objectAtIndexedSubscript:v13];
        id v18 = [v17 cycleIndex];
        uint64_t v12 = [v18 integerValue];
      }
      ++v13;
    }
    while ([v3 count] > v13);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v60 = *(void *)v63;
    uint64_t v21 = *v5;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v63 != v60) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v24 = [v23 cycleIndex];
        if (([v24 integerValue] & 0x8000000000000001) == 1)
        {
          uint64_t v25 = [v23 dose];
          [v25 doubleValue];
          double v27 = v26;

          if (v27 == 0.0) {
            goto LABEL_17;
          }
          uint64_t v28 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v29 = objc_opt_class();
          id v24 = HKStringFromMedicationScheduleType(a3);
          id v30 = [v23 cycleIndex];
          [v28 raise:v21, @"%@ with type %@ cannot have a zero value dose in an odd numbered interval. It must be a pause %ld", v29, v24, objc_msgSend(v30, "integerValue") format];
        }
LABEL_17:
        objc_super v31 = [v23 cycleIndex];
        if (([v31 integerValue] & 0x8000000000000001) == 1)
        {
          v32 = [v23 cycleIntervalDays];
          uint64_t v33 = [v32 integerValue];

          if (v33 == 6) {
            goto LABEL_21;
          }
          v34 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v35 = objc_opt_class();
          objc_super v31 = HKStringFromMedicationScheduleType(a3);
          double v36 = [v23 cycleIndex];
          [v34 raise:v21, @"%@ with type %@ must have odd numbered intervals of length 6 days. %ld", v35, v31, objc_msgSend(v36, "integerValue") format];
        }
LABEL_21:
        uint64_t v37 = [v23 cycleIndex];
        if (([v37 integerValue] & 1) == 0)
        {
          uint64_t v38 = [v23 cycleIndex];
          if ([v38 integerValue] != v12)
          {
            uint64_t v39 = [v23 dose];
            [v39 doubleValue];
            double v41 = v40;

            if (v41 > 0.0) {
              goto LABEL_27;
            }
            v42 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v43 = objc_opt_class();
            uint64_t v37 = HKStringFromMedicationScheduleType(a3);
            uint64_t v38 = [v23 dose];
            [v38 doubleValue];
            uint64_t v45 = v44;
            v46 = [v23 cycleIndex];
            [v42 raise:v21, @"%@ with type %@ and dose value %f must have a non-zero value dose in an even numbered interval. It must be active %ld", v43, v37, v45, objc_msgSend(v46, "integerValue") format];
          }
        }

LABEL_27:
        uint64_t v47 = [v23 cycleIndex];
        if (([v47 integerValue] & 1) == 0)
        {
          uint64_t v48 = [v23 cycleIndex];
          if ([v48 integerValue] != v12)
          {
            long long v49 = [v23 cycleIntervalDays];
            uint64_t v50 = [v49 integerValue];

            if (v50 == 1) {
              goto LABEL_33;
            }
            long long v51 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v52 = objc_opt_class();
            uint64_t v47 = HKStringFromMedicationScheduleType(a3);
            uint64_t v48 = [v23 cycleIndex];
            [v51 raise:v21, @"%@ with type %@ must have even numbered intervals of length 1 day. %ld", v52, v47, objc_msgSend(v48, "integerValue") format];
          }
        }
LABEL_33:
        objc_super v53 = [v23 cycleIndex];
        if ([v53 integerValue] == v12)
        {
          uint64_t v54 = [v23 cycleIntervalDays];
          uint64_t v55 = [v54 integerValue];

          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * v55 + 0x1249249249249249) < 0x2492492492492493) {
            continue;
          }
          v56 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v57 = objc_opt_class();
          objc_super v53 = HKStringFromMedicationScheduleType(a3);
          v58 = [v23 cycleIndex];
          [v56 raise:v21, @"%@ with type %@ cannot have a weeks pause interval that is not divisible by 7 days. %ld", v57, v53, objc_msgSend(v58, "integerValue") format];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v20);
  }
}

+ (void)_validateActiveXPauseYScheduleTimeIntervals:(unint64_t)a3 scheduleType:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = self;
  if (a3 - 9 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:sel__validateActiveXPauseYScheduleTimeIntervals_scheduleType_, v5, @"HKMedicationSchedule+Convenience.m", 255, @"Invalid parameter not satisfying: %@", @"scheduleType == HKMedicationScheduleTypeActiveXDaysPauseYDays || scheduleType == HKMedicationScheduleTypeActiveXWeeksPauseYWeeks" object file lineNumber description];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    uint64_t v35 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        +[HKMedicationSchedule _assertDaysOfTheWeekNoneForInterval:scheduleType:](v5, v10, a3);
        long long v11 = [v10 cycleIndex];
        if (![v11 integerValue]) {
          goto LABEL_12;
        }
        uint64_t v12 = [v10 cycleIndex];
        uint64_t v13 = [v12 integerValue];

        if (a3 == 7 && v13 != 1)
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v15 = objc_opt_class();
          long long v11 = HKStringFromMedicationScheduleType(7uLL);
          uint64_t v16 = [v10 cycleIndex];
          [v14 raise:v35, @"%@ with type %@ cannot have an interval with cycleIndex %ld", v15, v11, objc_msgSend(v16, "integerValue") format];

LABEL_12:
        }
        id v17 = [v10 cycleIndex];
        if (![v17 integerValue])
        {
          id v18 = [v10 dose];
          [v18 doubleValue];
          double v20 = v19;

          if (v20 > 0.0) {
            goto LABEL_17;
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v22 = objc_opt_class();
          id v17 = HKStringFromMedicationScheduleType(a3);
          id v23 = [v10 dose];
          [v23 doubleValue];
          [v21 raise:v35, @"%@ with type %@ cannot have a %f value dose in cycle 0", v22, v17, v24 format];
        }
LABEL_17:
        uint64_t v25 = [v10 cycleIndex];
        if ([v25 integerValue] == 1)
        {
          double v26 = [v10 dose];
          [v26 doubleValue];
          double v28 = v27;

          if (v28 == 0.0) {
            continue;
          }
          uint64_t v29 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v30 = objc_opt_class();
          uint64_t v25 = HKStringFromMedicationScheduleType(a3);
          objc_super v31 = [v10 dose];
          [v31 doubleValue];
          [v29 raise:v35, @"%@ with type %@ cannot have a non-zero value dose %f in cycle 1", v30, v25, v32 format];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v7);
  }
}

+ (void)_assertDaysOfTheWeekNoneForInterval:(unint64_t)a3 scheduleType:
{
  id v9 = a2;
  self;
  if ([v9 daysOfWeek])
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = HKStringFromMedicationScheduleType(a3);
    uint64_t v8 = HKStringFromReminderWeekdayOptions([v9 daysOfWeek]);
    [v4 raise:v5, @"%@ with type %@ cannot have an interval with daysOfWeek %@", v6, v7, v8 format];
  }
}

+ (void)_assertCycleIndexIsNilForInterval:(unint64_t)a3 scheduleType:
{
  id v10 = a2;
  self;
  id v4 = [v10 cycleIndex];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = HKStringFromMedicationScheduleType(a3);
    id v9 = [v10 cycleIndex];
    [v5 raise:v6, @"%@ with type %@ cannot have an interval with non-nil cycle index %ld", v7, v8, objc_msgSend(v9, "longValue") format];
  }
}

+ (void)_assertCycleIntervalDaysIsNilForInterval:(unint64_t)a3 scheduleType:
{
  id v10 = a2;
  self;
  id v4 = [v10 cycleIntervalDays];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = HKStringFromMedicationScheduleType(a3);
    id v9 = [v10 cycleIntervalDays];
    [v5 raise:v6, @"%@ with type %@ cannot have an interval with non-nil cycleIntervalDays %ld", v7, v8, objc_msgSend(v9, "longValue") format];
  }
}

+ (void)_assertDoseGreaterThanZeroForInterval:(unint64_t)a3 scheduleType:
{
  id v13 = a2;
  self;
  id v4 = [v13 dose];
  [v4 doubleValue];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = objc_opt_class();
    id v10 = HKStringFromMedicationScheduleType(a3);
    long long v11 = [v13 dose];
    [v11 doubleValue];
    [v7 raise:v8, @"%@ with type %@ cannot have an interval with dose %f <= 0", v9, v10, v12 format];
  }
}

- (void)dayInCycleFor:calendar:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_0(&dword_1BCB4A000, v1, v2, "[%{public}@] dayInCycle() called for a schedule that has not yet started or a non cyclic schedule type.", v3, v4, v5, v6, 2u);
}

@end
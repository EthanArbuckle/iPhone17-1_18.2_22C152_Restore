@interface HKSleepSchedule
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (HKSleepSchedule)sleepScheduleWithDate:(id)a3 weekdays:(unint64_t)a4 wakeTimeComponents:(id)a5 bedTimeComponents:(id)a6 overrideDayIndex:(id)a7 device:(id)a8 metadata:(id)a9;
+ (id)_sleepScheduleWithDate:(id)a3 weekdays:(unint64_t)a4 wakeTimeComponents:(id)a5 bedTimeComponents:(id)a6 overrideDayIndex:(id)a7 device:(id)a8 metadata:(id)a9 config:(id)a10;
- (BOOL)hasEquivalentOverrideDayToSleepSchedule:(id)a3;
- (BOOL)hasEquivalentTimesToSleepSchedule:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (HKSleepSchedule)init;
- (HKSleepSchedule)initWithCoder:(id)a3;
- (NSDateComponents)bedTimeComponents;
- (NSDateComponents)wakeTimeComponents;
- (NSNumber)overrideDayIndex;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)bedtimeDateIntervalForMorningIndex:(int64_t)a3 calendar:(id)a4;
- (id)bedtimeDateIntervalForWakeTime:(id)a3 calendar:(id)a4;
- (id)description;
- (id)wakeDateComponentsForMorningIndex:(int64_t)a3 calendar:(id)a4;
- (unint64_t)weekdays;
- (void)_setBedTimeComponents:(id)a3;
- (void)_setOverrideDayIndex:(id)a3;
- (void)_setWakeTimeComponents:(id)a3;
- (void)_setWeekdays:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSleepSchedule

+ (HKSleepSchedule)sleepScheduleWithDate:(id)a3 weekdays:(unint64_t)a4 wakeTimeComponents:(id)a5 bedTimeComponents:(id)a6 overrideDayIndex:(id)a7 device:(id)a8 metadata:(id)a9
{
  return (HKSleepSchedule *)[a1 _sleepScheduleWithDate:a3 weekdays:a4 wakeTimeComponents:a5 bedTimeComponents:a6 overrideDayIndex:a7 device:a8 metadata:a9 config:0];
}

+ (id)_sleepScheduleWithDate:(id)a3 weekdays:(unint64_t)a4 wakeTimeComponents:(id)a5 bedTimeComponents:(id)a6 overrideDayIndex:(id)a7 device:(id)a8 metadata:(id)a9 config:(id)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__HKSleepSchedule__sleepScheduleWithDate_weekdays_wakeTimeComponents_bedTimeComponents_overrideDayIndex_device_metadata_config___block_invoke;
  aBlock[3] = &unk_1E58C9C88;
  id v36 = v19;
  unint64_t v37 = a4;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v20 = v19;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = a9;
  id v25 = a8;
  id v26 = a3;
  v27 = _Block_copy(aBlock);
  v28 = +[HKObjectType sleepScheduleType];
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___HKSleepSchedule;
  id v29 = objc_msgSendSuper2(&v31, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v28, v26, v26, v25, v24, v27);

  return v29;
}

void __128__HKSleepSchedule__sleepScheduleWithDate_weekdays_wakeTimeComponents_bedTimeComponents_overrideDayIndex_device_metadata_config___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  *((void *)v4 + 12) = *(void *)(a1 + 64);
  objc_storeStrong((id *)v4 + 13, *(id *)(a1 + 32));
  objc_storeStrong((id *)v4 + 14, *(id *)(a1 + 40));
  objc_storeStrong((id *)v4 + 15, *(id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (HKSleepSchedule)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKSample *)self startDate];
  v6 = NSStringFromHKSleepScheduleWeekdays([(HKSleepSchedule *)self weekdays]);
  v7 = [(HKSleepSchedule *)self wakeTimeComponents];
  v8 = objc_msgSend(v7, "hk_dateOptionalDescription");
  v9 = [(HKSleepSchedule *)self bedTimeComponents];
  v10 = objc_msgSend(v9, "hk_dateOptionalDescription");
  v11 = [(HKSleepSchedule *)self overrideDayIndex];
  v12 = [v3 stringWithFormat:@"<%@:%p date: %@, days: %@, waketime: %@, bedtime: %@, day index: %@>", v4, self, v5, v6, v8, v10, v11, 0];

  return v12;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HKSleepSchedule;
  v5 = -[HKSample _validateWithConfiguration:](&v14, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v6 = v5;
  if (!v5)
  {
    overrideDayIndex = self->_overrideDayIndex;
    if (self->_weekdays)
    {
      if (overrideDayIndex)
      {
        v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        v11 = @"Only sleep schedules without weekdays can specify an override day index.";
LABEL_9:
        objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v10, a2, v11);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else if (!overrideDayIndex)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      v11 = @"Sleep schedules without weekdays must specify an override day index.";
      goto LABEL_9;
    }
    v12 = 0;
    goto LABEL_11;
  }
  id v7 = v5;
LABEL_10:
  v12 = v7;
LABEL_11:

  return v12;
}

- (id)wakeDateComponentsForMorningIndex:(int64_t)a3 calendar:(id)a4
{
  id v6 = a4;
  id v7 = [(HKSleepSchedule *)self wakeTimeComponents];

  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithDayIndex:calendar:", a3, v6);
    v9 = [(HKSleepSchedule *)self wakeTimeComponents];
    objc_msgSend(v8, "setHour:", objc_msgSend(v9, "hour"));

    uint64_t v10 = [(HKSleepSchedule *)self wakeTimeComponents];
    objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "minute"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bedtimeDateIntervalForWakeTime:(id)a3 calendar:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKSleepSchedule *)self bedTimeComponents];
  v9 = [v7 nextDateAfterDate:v6 matchingComponents:v8 options:516];

  if (v9 && objc_msgSend(v6, "hk_isAfterOrEqualToDate:", v9))
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v6];
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)HKLogSleep;
    if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      int v15 = 138544130;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = self;
      id v14 = v16;
      _os_log_error_impl(&dword_19C023000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Found invalid bedtime interval (%@ - %@) for schedule: %@", (uint8_t *)&v15, 0x2Au);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)bedtimeDateIntervalForMorningIndex:(int64_t)a3 calendar:(id)a4
{
  id v6 = a4;
  id v7 = [(HKSleepSchedule *)self wakeDateComponentsForMorningIndex:a3 calendar:v6];
  v8 = [v7 date];

  if (v8)
  {
    v9 = [(HKSleepSchedule *)self bedtimeDateIntervalForWakeTime:v8 calendar:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasEquivalentTimesToSleepSchedule:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepSchedule *)self wakeTimeComponents];
  uint64_t v6 = [v4 wakeTimeComponents];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    uint64_t v8 = [v4 wakeTimeComponents];
    if (!v8)
    {
LABEL_10:

      goto LABEL_11;
    }
    v9 = (void *)v8;
    uint64_t v10 = [(HKSleepSchedule *)self wakeTimeComponents];
    v11 = [v4 wakeTimeComponents];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_11;
    }
  }
  v5 = [(HKSleepSchedule *)self bedTimeComponents];
  uint64_t v13 = [v4 bedTimeComponents];
  if (v5 == (void *)v13)
  {

LABEL_13:
    BOOL v19 = 1;
    goto LABEL_14;
  }
  id v7 = (void *)v13;
  uint64_t v14 = [v4 bedTimeComponents];
  if (!v14) {
    goto LABEL_10;
  }
  int v15 = (void *)v14;
  id v16 = [(HKSleepSchedule *)self bedTimeComponents];
  __int16 v17 = [v4 bedTimeComponents];
  char v18 = [v16 isEqual:v17];

  if (v18) {
    goto LABEL_13;
  }
LABEL_11:
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

- (BOOL)hasEquivalentOverrideDayToSleepSchedule:(id)a3
{
  id v4 = a3;
  if (-[HKSleepSchedule weekdays](self, "weekdays") || [v4 weekdays]) {
    goto LABEL_3;
  }
  id v7 = [(HKSleepSchedule *)self overrideDayIndex];
  uint64_t v8 = [v4 overrideDayIndex];
  if (v7 == (void *)v8)
  {

LABEL_10:
    BOOL v5 = 1;
    goto LABEL_4;
  }
  v9 = (void *)v8;
  uint64_t v10 = [v4 overrideDayIndex];
  if (v10)
  {
    v11 = (void *)v10;
    int v12 = [(HKSleepSchedule *)self overrideDayIndex];
    uint64_t v13 = [v4 overrideDayIndex];
    char v14 = [v12 isEqual:v13];

    if (v14) {
      goto LABEL_10;
    }
  }
  else
  {
  }
LABEL_3:
  BOOL v5 = 0;
LABEL_4:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSleepSchedule;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_weekdays, @"Weekdays", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_wakeTimeComponents forKey:@"WakeTimeComponents"];
  [v4 encodeObject:self->_bedTimeComponents forKey:@"BedTimeComponents"];
  [v4 encodeObject:self->_overrideDayIndex forKey:@"OverrideDayIndex"];
}

- (HKSleepSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSleepSchedule;
  objc_super v5 = [(HKSample *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_weekdays = [v4 decodeIntegerForKey:@"Weekdays"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WakeTimeComponents"];
    wakeTimeComponents = v5->_wakeTimeComponents;
    v5->_wakeTimeComponents = (NSDateComponents *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BedTimeComponents"];
    bedTimeComponents = v5->_bedTimeComponents;
    v5->_bedTimeComponents = (NSDateComponents *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OverrideDayIndex"];
    overrideDayIndex = v5->_overrideDayIndex;
    v5->_overrideDayIndex = (NSNumber *)v10;
  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v29.receiver = self;
    v29.super_class = (Class)HKSleepSchedule;
    if (![(HKSample *)&v29 isEquivalent:v5]) {
      goto LABEL_20;
    }
    unint64_t v6 = [(HKSleepSchedule *)self weekdays];
    if (v6 != [v5 weekdays]) {
      goto LABEL_20;
    }
    id v7 = [(HKSleepSchedule *)self wakeTimeComponents];
    uint64_t v8 = [v5 wakeTimeComponents];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      uint64_t v10 = [v5 wakeTimeComponents];
      if (!v10) {
        goto LABEL_19;
      }
      v11 = (void *)v10;
      int v12 = [(HKSleepSchedule *)self wakeTimeComponents];
      objc_super v13 = [v5 wakeTimeComponents];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_20;
      }
    }
    id v7 = [(HKSleepSchedule *)self bedTimeComponents];
    uint64_t v16 = [v5 bedTimeComponents];
    if (v7 == (void *)v16)
    {
    }
    else
    {
      v9 = (void *)v16;
      uint64_t v17 = [v5 bedTimeComponents];
      if (!v17) {
        goto LABEL_19;
      }
      char v18 = (void *)v17;
      BOOL v19 = [(HKSleepSchedule *)self bedTimeComponents];
      id v20 = [v5 bedTimeComponents];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_20;
      }
    }
    id v7 = [(HKSleepSchedule *)self overrideDayIndex];
    uint64_t v22 = [v5 overrideDayIndex];
    if (v7 == (void *)v22)
    {

LABEL_24:
      BOOL v15 = 1;
      goto LABEL_21;
    }
    v9 = (void *)v22;
    uint64_t v23 = [v5 overrideDayIndex];
    if (v23)
    {
      id v24 = (void *)v23;
      id v25 = [(HKSleepSchedule *)self overrideDayIndex];
      id v26 = [v5 overrideDayIndex];
      char v27 = [v25 isEqual:v26];

      if (v27) {
        goto LABEL_24;
      }
LABEL_20:
      BOOL v15 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_19:

    goto LABEL_20;
  }
  BOOL v15 = 0;
LABEL_22:

  return v15;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (unint64_t)weekdays
{
  return self->_weekdays;
}

- (void)_setWeekdays:(unint64_t)a3
{
  self->_weekdays = a3;
}

- (NSDateComponents)wakeTimeComponents
{
  return self->_wakeTimeComponents;
}

- (void)_setWakeTimeComponents:(id)a3
{
}

- (NSDateComponents)bedTimeComponents
{
  return self->_bedTimeComponents;
}

- (void)_setBedTimeComponents:(id)a3
{
}

- (NSNumber)overrideDayIndex
{
  return self->_overrideDayIndex;
}

- (void)_setOverrideDayIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDayIndex, 0);
  objc_storeStrong((id *)&self->_bedTimeComponents, 0);

  objc_storeStrong((id *)&self->_wakeTimeComponents, 0);
}

@end
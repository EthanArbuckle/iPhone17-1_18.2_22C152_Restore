@interface HKSample
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_enumerateValidIntervalsWithStartDate:(id)a3 endDate:(id)a4 sampleType:(id)a5 block:(id)a6;
+ (id)_newSampleFromDatesWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 config:(id)a8;
+ (id)_newSampleWithType:(id)a3 startDate:(double)a4 endDate:(double)a5 device:(id)a6 metadata:(id)a7 config:(id)a8;
- ($0AC6E346AE4835514AAA8AC86D8F4844)hk_dayIndexRangeWithCalendar:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)hk_morningIndexRangeWithCalendarWithCalendar:(id)a3;
- (BOOL)_requiresPrivateEntitlementForQueries;
- (BOOL)hasUndeterminedDuration;
- (BOOL)isEquivalent:(id)a3;
- (HKSample)initWithCoder:(id)a3;
- (HKSampleType)sampleType;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (double)_endTimestamp;
- (double)_startTimestamp;
- (id)_init;
- (id)_timeZone;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)asJSONObject;
- (id)sanitizedSample:(id)a3 forEntitlements:(id)a4;
- (id)valueForKey:(id)a3;
- (int64_t)_externalSyncObjectCode;
- (void)_enumerateTimePeriodsWithBlock:(id)a3;
- (void)_setEndDate:(id)a3;
- (void)_setEndTimestamp:(double)a3;
- (void)_setSampleType:(id)a3;
- (void)_setStartDate:(id)a3;
- (void)_setStartTimestamp:(double)a3;
- (void)_setType:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSample

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSample;
  id v4 = a3;
  [(HKObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"StartTS", self->_startTimestamp, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"EndTS" forKey:self->_endTimestamp];
  [v4 encodeObject:self->_sampleType forKey:@"DataType"];
}

- (NSDate)startDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_startTimestamp];
}

- (NSDate)endDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_endTimestamp];
}

+ (id)_newSampleWithType:(id)a3 startDate:(double)a4 endDate:(double)a5 device:(id)a6 metadata:(id)a7 config:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__HKSample__newSampleWithType_startDate_endDate_device_metadata_config___block_invoke;
  v20[3] = &unk_1E58C9110;
  double v23 = a4;
  double v24 = a5;
  id v21 = v14;
  id v22 = v15;
  id v16 = v15;
  id v17 = v14;
  v18 = (void *)[a1 _newDataObjectWithMetadata:a7 device:a6 config:v20];

  return v18;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKSample;
  id result = [(HKObject *)&v3 _init];
  if (result)
  {
    *((void *)result + 10) = 0x10000000000000;
    *((void *)result + 11) = 0x10000000000000;
  }
  return result;
}

uint64_t __72__HKSample__newSampleWithType_startDate_endDate_device_metadata_config___block_invoke(uint64_t a1, void *a2)
{
  v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)v7[9];
  v7[9] = v3;

  v7[10] = *(void *)(a1 + 48);
  v7[11] = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
  }

  return MEMORY[0x1F41817F8]();
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (double)_startTimestamp
{
  return self->_startTimestamp;
}

- (double)_endTimestamp
{
  return self->_endTimestamp;
}

- (void).cxx_destruct
{
}

- (void)_setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (void)_setEndTimestamp:(double)a3
{
  self->_endTimestamp = a3;
}

- (void)_setSampleType:(id)a3
{
  self->_sampleType = (HKSampleType *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int64_t)_externalSyncObjectCode
{
  v2 = [(HKSample *)self sampleType];
  int64_t v3 = [v2 code];

  return v3;
}

- (NSString)description
{
  if (description_onceToken_1 != -1) {
    dispatch_once(&description_onceToken_1, &__block_literal_global_127);
  }
  int64_t v3 = (void *)description_formatter_0;
  id v4 = [(HKSample *)self startDate];
  uint64_t v5 = [v3 stringFromDate:v4];

  v6 = (void *)description_formatter_0;
  v7 = [(HKSample *)self endDate];
  v8 = [v6 stringFromDate:v7];

  v12.receiver = self;
  v12.super_class = (Class)HKSample;
  v9 = [(HKObject *)&v12 description];
  v10 = [NSString stringWithFormat:@"%@ (%@ - %@)", v9, v5, v8];

  return (NSString *)v10;
}

uint64_t __23__HKSample_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)description_formatter_0;
  description_formatter_0 = (uint64_t)v0;

  v2 = (void *)description_formatter_0;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
}

- (HKSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKSample;
  uint64_t v5 = [(HKObject *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataType"];
    sampleType = v5->_sampleType;
    v5->_sampleType = (HKSampleType *)v6;

    if ([v4 containsValueForKey:@"StartTS"])
    {
      [v4 decodeDoubleForKey:@"StartTS"];
      v5->_startTimestamp = v8;
      [v4 decodeDoubleForKey:@"EndTS"];
      v5->_endTimestamp = v9;
    }
    else
    {
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartDate"];
      [v10 timeIntervalSinceReferenceDate];
      v5->_startTimestamp = v11;

      objc_super v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EndDate"];
      [v12 timeIntervalSinceReferenceDate];
      v5->_endTimestamp = v13;
    }
  }

  return v5;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)hk_morningIndexRangeWithCalendarWithCalendar:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v5 = self;
  uint64_t v6 = [(HKSample *)v5 overrideDayIndex];

  if (!v6)
  {

LABEL_5:
    v10 = [(HKSample *)self startDate];
    uint64_t v8 = objc_msgSend(v10, "hk_morningIndexWithCalendar:", v4);

    double v11 = [(HKSample *)self endDate];
    uint64_t v12 = objc_msgSend(v11, "hk_morningIndexWithCalendar:", v4);

    uint64_t v9 = v12 - v8 + 1;
    goto LABEL_6;
  }
  v7 = [(HKSample *)v5 overrideDayIndex];
  uint64_t v8 = [v7 integerValue] - 1;

  uint64_t v9 = 3;
LABEL_6:

  int64_t v13 = v8;
  int64_t v14 = v9;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)sanitizedSample:(id)a3 forEntitlements:(id)a4
{
  id v4 = a3;

  return v4;
}

- (void)_enumerateTimePeriodsWithBlock:(id)a3
{
}

- (id)asJSONObject
{
  v13.receiver = self;
  v13.super_class = (Class)HKSample;
  int64_t v3 = [(HKObject *)&v13 asJSONObject];
  if (asJSONObject_onceToken != -1) {
    dispatch_once(&asJSONObject_onceToken, &__block_literal_global_80);
  }
  id v4 = (void *)asJSONObject_formatter;
  uint64_t v5 = [(HKSample *)self startDate];
  uint64_t v6 = [v4 stringFromDate:v5];
  [v3 setObject:v6 forKeyedSubscript:@"startDate"];

  v7 = (void *)asJSONObject_formatter;
  uint64_t v8 = [(HKSample *)self endDate];
  uint64_t v9 = [v7 stringFromDate:v8];
  [v3 setObject:v9 forKeyedSubscript:@"endDate"];

  v10 = [(HKSample *)self sampleType];
  double v11 = [v10 description];
  [v3 setObject:v11 forKeyedSubscript:@"sampleType"];

  return v3;
}

uint64_t __33__HKSample_HK_JSON__asJSONObject__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)asJSONObject_formatter;
  asJSONObject_formatter = (uint64_t)v0;

  v2 = (void *)asJSONObject_formatter;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
}

+ (id)_newSampleFromDatesWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 config:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if ([a1 _isConcreteObjectClass])
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_6:
    double v22 = 2.22507386e-308;
    if (v17) {
      goto LABEL_4;
    }
LABEL_7:
    double v24 = 2.22507386e-308;
    goto LABEL_8;
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  v25 = NSStringFromSelector(a2);
  v26 = NSStringFromClass((Class)a1);
  [v29 handleFailureInMethod:a2, a1, @"HKSample.m", 58, @"%@ should not be used for abstract class %@", v25, v26 object file lineNumber description];

  if (!v16) {
    goto LABEL_6;
  }
LABEL_3:
  [v16 timeIntervalSinceReferenceDate];
  double v22 = v21;
  if (!v17) {
    goto LABEL_7;
  }
LABEL_4:
  [v17 timeIntervalSinceReferenceDate];
  double v24 = v23;
LABEL_8:
  v27 = (void *)[a1 _newSampleWithType:v15 startDate:v18 endDate:v19 device:v20 metadata:v22 config:v24];

  return v27;
}

- (BOOL)_requiresPrivateEntitlementForQueries
{
  return 0;
}

+ (id)_enumerateValidIntervalsWithStartDate:(id)a3 endDate:(id)a4 sampleType:(id)a5 block:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  double v11 = (void (**)(id, void *, void *))a6;
  [a5 maximumAllowedDuration];
  double v13 = v12;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = v9;
  id v16 = v15;
  if (objc_msgSend(v15, "hk_isBeforeDate:", v10))
  {
    id v17 = v15;
    do
    {
      id v16 = [v17 dateByAddingTimeInterval:v13];
      if (objc_msgSend(v16, "hk_isAfterDate:", v10))
      {
        id v18 = v10;

        id v16 = v18;
      }
      id v19 = v11[2](v11, v17, v16);
      [v14 addObject:v19];

      id v17 = v16;
    }
    while ((objc_msgSend(v16, "hk_isBeforeDate:", v10) & 1) != 0);
  }

  return v14;
}

- (id)_timeZone
{
  v2 = [(HKObject *)self _timeZoneName];
  if (!v2
    || ([MEMORY[0x1E4F1CAF0] timeZoneWithName:v2],
        (int64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int64_t v3 = [v4 timeZone];
  }

  return v3;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  char var0 = a3.var0;
  v43.receiver = self;
  v43.super_class = (Class)HKSample;
  uint64_t v6 = -[HKObject _validateWithConfiguration:](&v43, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_14:
    id v25 = v8;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Invalid data type %@"", self->_sampleType);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  id v9 = [(HKSample *)self sampleType];
  double startTimestamp = self->_startTimestamp;
  double endTimestamp = self->_endTimestamp;
  id v42 = 0;
  char v12 = [v9 _validateStartDate:&v42 endDate:startTimestamp error:endTimestamp];
  id v13 = v42;

  if (v12)
  {
    if ((var0 & 2) == 0 && HKProgramSDKAtLeast()) {
      double v14 = self->_endTimestamp;
    }
    if ((var0 & 1) == 0 && HKProgramSDKAtLeast())
    {
      id v15 = [(HKSample *)self sampleType];
      if ([v15 isMaximumDurationRestricted])
      {
        double v16 = self->_endTimestamp - self->_startTimestamp;
        id v17 = [(HKSample *)self sampleType];
        [v17 maximumAllowedDuration];
        double v19 = v18;

        if (v16 > v19)
        {
          v39 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = objc_opt_class();
          double v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_startTimestamp];
          double v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_endTimestamp];
          sampleType = self->_sampleType;
          [(HKSampleType *)sampleType maximumAllowedDuration];
          objc_msgSend(v39, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v20, a2, @"startDate (%@) and endDate (%@) exceed the maximum allowed duration for this sample type. Maximum duration for type %@ is %f"", v21, v22, sampleType, v24);
LABEL_23:
          id v25 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        }
      }
      else
      {
      }
      v27 = [(HKSample *)self sampleType];
      if ([v27 isMinimumDurationRestricted])
      {
        double v28 = self->_endTimestamp - self->_startTimestamp;
        v29 = [(HKSample *)self sampleType];
        [v29 minimumAllowedDuration];
        double v31 = v30;

        if (v28 < v31)
        {
          v40 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v32 = objc_opt_class();
          double v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_startTimestamp];
          double v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_endTimestamp];
          v33 = self->_sampleType;
          [(HKSampleType *)v33 minimumAllowedDuration];
          objc_msgSend(v40, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v32, a2, @"Duration between startDate (%@) and endDate (%@) is below the minimum allowed duration for this sample type. Minimum duration for type %@ is %f"", v21, v22, v33, v34);
          goto LABEL_23;
        }
      }
      else
      {
      }
    }
    v35 = [(HKSample *)self sampleType];
    v36 = [(HKObject *)self metadata];
    id v41 = 0;
    char v37 = objc_msgSend(v35, "hk_validateMetadata:sample:error:", v36, self, &v41);
    id v38 = v41;

    id v25 = 0;
    if ((v37 & 1) == 0) {
      id v25 = v38;
    }

    goto LABEL_28;
  }
  id v25 = v13;
LABEL_28:

LABEL_15:

  return v25;
}

- (void)_setType:(id)a3
{
  id v4 = (HKSampleType *)[a3 copy];
  sampleType = self->_sampleType;
  self->_sampleType = v4;

  MEMORY[0x1F41817F8](v4, sampleType);
}

- (void)_setStartDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = 2.22507386e-308;
  }

  [(HKSample *)self _setStartTimestamp:v4];
}

- (void)_setEndDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = 2.22507386e-308;
  }

  [(HKSample *)self _setEndTimestamp:v4];
}

- (BOOL)hasUndeterminedDuration
{
  double endTimestamp = self->_endTimestamp;
  int64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v3 timeIntervalSinceReferenceDate];
  BOOL v5 = endTimestamp >= v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsEquivalence
{
  return 0;
}

- (BOOL)isEquivalent:(id)a3
{
  double v4 = (HKSample *)a3;
  if ([(id)objc_opt_class() supportsEquivalence])
  {
    if (self == v4)
    {
      BOOL v14 = 1;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      uint64_t v6 = [(HKSample *)self startDate];
      uint64_t v7 = [(HKSample *)v5 startDate];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(HKSample *)v5 startDate];
        if (!v9) {
          goto LABEL_15;
        }
        id v10 = (void *)v9;
        double v11 = [(HKSample *)self startDate];
        char v12 = [(HKSample *)v5 startDate];
        int v13 = [v11 isEqualToDate:v12];

        if (!v13) {
          goto LABEL_16;
        }
      }
      uint64_t v6 = [(HKSample *)self endDate];
      uint64_t v15 = [(HKSample *)v5 endDate];
      if (v6 == (void *)v15)
      {

LABEL_18:
        BOOL v14 = 1;
        goto LABEL_19;
      }
      id v8 = (void *)v15;
      uint64_t v16 = [(HKSample *)v5 endDate];
      if (v16)
      {
        id v17 = (void *)v16;
        double v18 = [(HKSample *)self endDate];
        double v19 = [(HKSample *)v5 endDate];
        char v20 = [v18 isEqualToDate:v19];

        if (v20) {
          goto LABEL_18;
        }
LABEL_16:
        BOOL v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  BOOL v14 = 0;
LABEL_20:

  return v14;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"offsetFromStartDate"])
  {
    if ([(HKSampleType *)self->_sampleType isMaximumDurationRestricted])
    {
      BOOL v5 = [(HKSample *)self startDate];
      [(HKSampleType *)self->_sampleType maximumAllowedDuration];
      uint64_t v6 = objc_msgSend(v5, "dateByAddingTimeInterval:");

      goto LABEL_7;
    }
    uint64_t v7 = [(HKSample *)self endDate];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HKSample;
    uint64_t v7 = [(HKSample *)&v9 valueForKey:v4];
  }
  uint64_t v6 = (void *)v7;
LABEL_7:

  return v6;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)hk_dayIndexRangeWithCalendar:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HKSample *)self startDate];
  uint64_t v6 = objc_msgSend(v5, "hk_dayIndexWithCalendar:", v4);

  uint64_t v7 = [(HKSample *)self endDate];
  uint64_t v8 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", v4);

  int64_t v9 = v8 - v6 + 1;
  int64_t v10 = v6;
  result.var1 = v9;
  result.char var0 = v10;
  return result;
}

@end
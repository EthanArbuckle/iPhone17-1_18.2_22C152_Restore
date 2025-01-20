@interface HKHeartbeatSeriesSample
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (id)_heartbeatSeriesSampleFromCSV:(id)a3 startDate:(id)a4 metadata:(id)a5 error:(id *)a6;
+ (id)_heartbeatSeriesSampleWithData:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7;
+ (id)heartbeatSequenceSampleWithData:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6;
- (BOOL)_shouldNotifyOnInsert;
- (HKHeartbeatSeriesSample)init;
- (HKHeartbeatSeriesSample)initWithCoder:(id)a3;
- (NSData)heartbeatData;
- (NSNumber)_maximumBeatsPerMinute;
- (NSNumber)_minimumBeatsPerMinute;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)payload;
- (int64_t)numberOfDataPoints;
- (unint64_t)count;
- (void)_computeMinimumAndMaximumBeatsPerMinute;
- (void)_enumerateHeartbeatDataWithBlock:(id)a3;
- (void)_setPayload:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateHeartbeatDataWithBlock:(id)a3;
@end

@implementation HKHeartbeatSeriesSample

- (HKHeartbeatSeriesSample)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

+ (id)_heartbeatSeriesSampleWithData:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  v17 = +[HKSeriesType heartbeatSeriesType];
  [v16 timeIntervalSinceReferenceDate];
  double v19 = v18;

  [v15 timeIntervalSinceReferenceDate];
  double v21 = v20;

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92__HKHeartbeatSeriesSample__heartbeatSeriesSampleWithData_startDate_endDate_device_metadata___block_invoke;
  v25[3] = &unk_1E58C7B58;
  id v26 = v12;
  id v22 = v12;
  v23 = (void *)[a1 _newSampleWithType:v17 startDate:v14 endDate:v13 device:v25 metadata:v19 config:v21];

  return v23;
}

uint64_t __92__HKHeartbeatSeriesSample__heartbeatSeriesSampleWithData_startDate_endDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setPayload:*(void *)(a1 + 32)];
}

+ (id)heartbeatSequenceSampleWithData:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6
{
  return (id)[a1 _heartbeatSeriesSampleWithData:a3 startDate:a4 endDate:a5 device:0 metadata:a6];
}

- (void)enumerateHeartbeatDataWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HKHeartbeatSeriesSample_enumerateHeartbeatDataWithBlock___block_invoke;
  v6[3] = &unk_1E58C7B80;
  id v7 = v4;
  id v5 = v4;
  [(HKHeartbeatSeriesSample *)self _enumerateHeartbeatDataWithBlock:v6];
}

uint64_t __59__HKHeartbeatSeriesSample_enumerateHeartbeatDataWithBlock___block_invoke(uint64_t a1)
{
  return 1;
}

- (BOOL)_shouldNotifyOnInsert
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v37.receiver = self;
  v37.super_class = (Class)HKHeartbeatSeriesSample;
  id v5 = -[HKSeriesSample _validateWithConfiguration:](&v37, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(HKSample *)self sampleType];
    v9 = +[HKSeriesType heartbeatSeriesType];
    char v10 = [v8 isEqual:v9];

    if (v10)
    {
      if (([(NSData *)self->_heartbeatData length] & 0xF) == 0)
      {
        uint64_t v31 = 0;
        v32 = &v31;
        uint64_t v33 = 0x3032000000;
        v34 = __Block_byref_object_copy__48;
        v35 = __Block_byref_object_dispose__48;
        id v36 = 0;
        uint64_t v27 = 0;
        v28 = (double *)&v27;
        uint64_t v29 = 0x2020000000;
        uint64_t v30 = 0;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54__HKHeartbeatSeriesSample__validateWithConfiguration___block_invoke;
        v26[3] = &unk_1E58C7BA8;
        v26[4] = self;
        v26[5] = &v31;
        v26[6] = &v27;
        v26[7] = a2;
        [(HKHeartbeatSeriesSample *)self _enumerateHeartbeatDataWithBlock:v26];
        double v20 = [(HKSample *)self startDate];
        double v21 = [v20 dateByAddingTimeInterval:v28[3]];

        id v22 = [(HKSample *)self endDate];
        char v23 = objc_msgSend(v21, "hk_isBeforeOrEqualToDate:", v22);

        if (v23)
        {
          id v24 = (id)v32[5];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Heartbeat sequence end date is incorrect"");
          id v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        double v18 = v24;

        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v31, 8);

        goto LABEL_9;
      }
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = objc_opt_class();
      id v13 = @"Heartbeat sequence data is incorrectly formatted";
      id v14 = v11;
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      id v13 = @"Invalid data type %@";
      uint64_t v25 = v17;
      id v14 = v15;
      uint64_t v12 = v16;
    }
    objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v12, a2, v13, v25);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v18 = v7;
LABEL_9:

  return v18;
}

uint64_t __54__HKHeartbeatSeriesSample__validateWithConfiguration___block_invoke(void *a1, double a2)
{
  if (a2 < 0.0)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = a1[7];
    id v7 = @"Heartbeat datum time since sequence start (%f) must be nonnegative";
LABEL_7:
    objc_msgSend(v4, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v5, v6, v7, *(void *)&a2, v12);
    goto LABEL_8;
  }
  if (*(double *)(*(void *)(a1[6] + 8) + 24) > a2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[7], @"Heartbeat datum time since sequence start (%f) must not be less than previous datum (%f)"", *(void *)&a2, *(void *)(*(void *)(a1[6] + 8) + 24));
    uint64_t v8 = LABEL_8:;
    uint64_t v9 = *(void *)(a1[5] + 8);
    char v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    goto LABEL_9;
  }
  if (a2 > 10000.0)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = a1[7];
    id v7 = @"Heartbeat datum time since sequence start (%f) greater than expected maxiumum 10000";
    goto LABEL_7;
  }
LABEL_9:
  *(double *)(*(void *)(a1[6] + 8) + 24) = a2;
  return 1;
}

- (unint64_t)count
{
  return self->_numberOfDataPoints & ~(self->_numberOfDataPoints >> 63);
}

- (NSNumber)_minimumBeatsPerMinute
{
  cachedMinBeatsPerMinute = self->_cachedMinBeatsPerMinute;
  if (!cachedMinBeatsPerMinute || !self->_cachedMaxBeatsPerMinute)
  {
    [(HKHeartbeatSeriesSample *)self _computeMinimumAndMaximumBeatsPerMinute];
    cachedMinBeatsPerMinute = self->_cachedMinBeatsPerMinute;
  }

  return cachedMinBeatsPerMinute;
}

- (NSNumber)_maximumBeatsPerMinute
{
  if (!self->_cachedMinBeatsPerMinute || (cachedMaxBeatsPerMinute = self->_cachedMaxBeatsPerMinute) == 0)
  {
    [(HKHeartbeatSeriesSample *)self _computeMinimumAndMaximumBeatsPerMinute];
    cachedMaxBeatsPerMinute = self->_cachedMaxBeatsPerMinute;
  }

  return cachedMaxBeatsPerMinute;
}

- (void)_computeMinimumAndMaximumBeatsPerMinute
{
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HKHeartbeatSeriesSample__computeMinimumAndMaximumBeatsPerMinute__block_invoke;
  v7[3] = &unk_1E58C7BD0;
  v7[4] = v8;
  v7[5] = v10;
  v7[6] = &v11;
  v7[7] = &v15;
  [(HKHeartbeatSeriesSample *)self _enumerateHeartbeatDataWithBlock:v7];
  double v3 = v16[3];
  if (v3 == 1.79769313e308)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [NSNumber numberWithDouble:v16[3]];
  }
  objc_storeStrong((id *)&self->_cachedMinBeatsPerMinute, v4);
  if (v3 != 1.79769313e308) {

  }
  double v5 = v12[3];
  if (v5 == 0.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithDouble:v12[3]];
  }
  objc_storeStrong((id *)&self->_cachedMaxBeatsPerMinute, v6);
  if (v5 != 0.0) {

  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t __66__HKHeartbeatSeriesSample__computeMinimumAndMaximumBeatsPerMinute__block_invoke(void *a1, char a2, double a3)
{
  if ((a2 & 1) == 0 && !*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    double v3 = 1.0 / ((a3 - *(double *)(*(void *)(a1[5] + 8) + 24)) / 60.0);
    uint64_t v4 = *(void *)(a1[6] + 8);
    double v5 = *(double *)(v4 + 24);
    if (v5 < v3) {
      double v5 = 1.0 / ((a3 - *(double *)(*(void *)(a1[5] + 8) + 24)) / 60.0);
    }
    *(double *)(v4 + 24) = v5;
    uint64_t v6 = *(void *)(a1[7] + 8);
    if (*(double *)(v6 + 24) < v3) {
      double v3 = *(double *)(v6 + 24);
    }
    *(double *)(v6 + 24) = v3;
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
  *(double *)(*(void *)(a1[5] + 8) + 24) = a3;
  return 1;
}

- (void)_enumerateHeartbeatDataWithBlock:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (uint64_t (**)(id, BOOL, double))a3;
  if (self->_numberOfDataPoints >= 1)
  {
    uint64_t v5 = 0;
    int64_t v6 = 0;
    do
    {
      -[NSData getBytes:range:](self->_heartbeatData, "getBytes:range:", &v7, v5, 16);
      if ((v4[2](v4, v8 != 0, v7) & 1) == 0) {
        break;
      }
      ++v6;
      v5 += 16;
    }
    while (v6 < self->_numberOfDataPoints);
  }
}

- (id)payload
{
  return self->_heartbeatData;
}

- (void)_setPayload:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithData:v6];
  heartbeatData = self->_heartbeatData;
  self->_heartbeatData = v4;

  self->_numberOfDataPoints = (unint64_t)[v6 length] >> 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKHeartbeatSeriesSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKHeartbeatSeriesSample;
  uint64_t v5 = [(HKSeriesSample *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"heartbeatData"];
    [(HKHeartbeatSeriesSample *)v5 _setPayload:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKHeartbeatSeriesSample;
  id v4 = a3;
  [(HKSeriesSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_heartbeatData, @"heartbeatData", v5.receiver, v5.super_class);
}

+ (id)_heartbeatSeriesSampleFromCSV:(id)a3 startDate:(id)a4 metadata:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [NSString stringWithContentsOfFile:a3 encoding:4 error:a6];
  if ([v11 length])
  {
    id v31 = v10;
    uint64_t v30 = v11;
    uint64_t v12 = [v11 componentsSeparatedByString:@"\n"];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", 16 * objc_msgSend(v12, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      double v18 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          double v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v21 = [v20 rangeOfString:@","];
          if (v21 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v22 = v21;
            char v23 = [v20 substringToIndex:v21];
            id v24 = [v20 substringFromIndex:v22 + 1];
            [v23 doubleValue];
            double v18 = v25;
            char v26 = [v24 BOOLValue];
            uint64_t v38 = 0;
            double v37 = v18;
            if ((v26 & 1) == 0) {
              LOBYTE(v38) = 1;
            }
            [v13 appendBytes:&v37 length:16];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 0.0;
    }

    v28 = [v9 dateByAddingTimeInterval:v18];
    id v10 = v31;
    uint64_t v27 = +[HKHeartbeatSeriesSample _heartbeatSeriesSampleWithData:v13 startDate:v9 endDate:v28 device:0 metadata:v31];

    uint64_t v11 = v30;
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

- (NSData)heartbeatData
{
  return self->_heartbeatData;
}

- (int64_t)numberOfDataPoints
{
  return self->_numberOfDataPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMaxBeatsPerMinute, 0);
  objc_storeStrong((id *)&self->_cachedMinBeatsPerMinute, 0);

  objc_storeStrong((id *)&self->_heartbeatData, 0);
}

@end
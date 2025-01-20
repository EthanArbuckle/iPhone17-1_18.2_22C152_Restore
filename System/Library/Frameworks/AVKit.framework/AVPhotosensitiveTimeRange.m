@interface AVPhotosensitiveTimeRange
+ (BOOL)supportsSecureCoding;
+ (id)timeRangesFromMetadata:(id)a3 initialDate:(id)a4;
- ($B1B40AE7B40192423BFE885F22139C9A)timeRange;
- (AVPhotosensitiveTimeRange)init;
- (AVPhotosensitiveTimeRange)initWithCoder:(id)a3;
- (AVPhotosensitiveTimeRange)initWithTimeRange:(id *)a3 risk:(double)a4;
- (NSArray)colors;
- (double)risk;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRisk:(double)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation AVPhotosensitiveTimeRange

- (void)setRisk:(double)a3
{
  self->_risk = a3;
}

- (double)risk
{
  return self->_risk;
}

- (void)setTimeRange:(id *)a3
{
}

- ($B1B40AE7B40192423BFE885F22139C9A)timeRange
{
  objc_copyStruct(retstr, &self->_timeRange, 48, 1, 0);
  return result;
}

- (id)description
{
  long long v3 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  v4 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)AVPhotosensitiveTimeRange;
  v6 = [(AVPhotosensitiveTimeRange *)&v10 description];
  v7 = [NSNumber numberWithDouble:self->_risk];
  v8 = [v5 stringWithFormat:@"%@ timeRange: %@, risk: %@", v6, v4, v7];

  return v8;
}

- (NSArray)colors
{
  return (NSArray *)&unk_1F094A328;
}

- (AVPhotosensitiveTimeRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeRange"];
  v6 = v5;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  if (v5) {
    [v5 CMTimeRangeValue];
  }
  [v4 decodeDoubleForKey:@"risk"];
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  v7 = -[AVPhotosensitiveTimeRange initWithTimeRange:risk:](self, "initWithTimeRange:risk:", v9);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  double risk = self->_risk;
  id v5 = a3;
  [v5 encodeDouble:@"risk" forKey:risk];
  long long v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v8[0] = *(_OWORD *)&self->_timeRange.start.value;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  v7 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:v8];
  [v5 encodeObject:v7 forKey:@"timeRange"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[AVPhotosensitiveTimeRange allocWithZone:a3] init];
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  long long v6 = *(_OWORD *)&self->_timeRange.duration.timescale;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)((char *)result + 40) = v6;
  *(_OWORD *)((char *)result + 24) = v5;
  *((void *)result + 7) = *(void *)&self->_risk;
  return result;
}

- (AVPhotosensitiveTimeRange)initWithTimeRange:(id *)a3 risk:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVPhotosensitiveTimeRange;
  id result = [(AVPhotosensitiveTimeRange *)&v9 init];
  long long v8 = *(_OWORD *)&a3->var0.var3;
  long long v7 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&result->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&result->_timeRange.start.epoch = v8;
  *(_OWORD *)&result->_timeRange.duration.timescale = v7;
  result->_double risk = a4;
  return result;
}

- (AVPhotosensitiveTimeRange)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  v4[0] = *MEMORY[0x1E4F1FA30];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  return [(AVPhotosensitiveTimeRange *)self initWithTimeRange:v4 risk:0.0];
}

+ (id)timeRangesFromMetadata:(id)a3 initialDate:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v35 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v54;
      uint64_t v36 = *(void *)v54;
      id v37 = v6;
      do
      {
        uint64_t v10 = 0;
        uint64_t v38 = v8;
        do
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v53 + 1) + 8 * v10);
          long long v12 = objc_msgSend(v11, "startDate", v35);
          v13 = [v11 endDate];
          [v12 timeIntervalSinceDate:v6];
          if (v14 < 0.0)
          {
            id v15 = v6;

            long long v12 = v15;
          }
          [v13 timeIntervalSinceDate:v6];
          if (v16 < 0.0)
          {
            id v17 = v6;

            v13 = v17;
          }
          if (([v12 isEqualToDate:v13] & 1) == 0)
          {
            memset(&v52, 0, sizeof(v52));
            [v12 timeIntervalSinceDate:v6];
            CMTimeMakeWithSeconds(&v52, v18, 1000);
            memset(&v51, 0, sizeof(v51));
            v42 = v13;
            [v13 timeIntervalSinceDate:v6];
            CMTimeMakeWithSeconds(&v51, v19, 1000);
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            v20 = [v11 items];
            uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v57 count:16];
            double v22 = 0.0;
            if (v21)
            {
              uint64_t v23 = v21;
              v41 = v12;
              uint64_t v24 = *(void *)v48;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v48 != v24) {
                    objc_enumerationMutation(v20);
                  }
                  v26 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                  v27 = [v26 key];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v28 = [v26 key];
                    int v29 = [v28 isEqualToString:@"X-RISK-LEVEL"];

                    if (v29)
                    {
                      v30 = [v26 numberValue];
                      [v30 doubleValue];
                      double v22 = v31;

                      goto LABEL_23;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v23 = [v20 countByEnumeratingWithState:&v47 objects:v57 count:16];
              }
              while (v23);
LABEL_23:
              uint64_t v9 = v36;
              id v6 = v37;
              uint64_t v8 = v38;
              long long v12 = v41;
            }

            v32 = [AVPhotosensitiveTimeRange alloc];
            CMTime lhs = v51;
            CMTime rhs = v52;
            CMTimeSubtract(&duration, &lhs, &rhs);
            CMTime lhs = v52;
            CMTimeRangeMake(&v46, &lhs, &duration);
            v33 = [(AVPhotosensitiveTimeRange *)v32 initWithTimeRange:&v46 risk:v22 / 100.0];
            [v39 addObject:v33];

            v13 = v42;
          }

          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v8);
    }

    id v5 = v35;
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
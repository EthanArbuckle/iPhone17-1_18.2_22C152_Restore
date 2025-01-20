@interface HKSleepPeriod
+ (BOOL)supportsSecureCoding;
+ (id)sleepPeriodWithDateInterval:(id)a3 segments:(id)a4;
- (BOOL)containsSegmentsWithAppleSleepTrackingData;
- (BOOL)isEqual:(id)a3;
- (HKSleepPeriod)initWithCoder:(id)a3;
- (NSArray)segments;
- (NSDateInterval)dateInterval;
- (NSString)hk_redactedDescription;
- (double)durationForCategory:(int64_t)a3 overlappingDateInterval:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSleepPeriod

+ (id)sleepPeriodWithDateInterval:(id)a3 segments:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HKSleepPeriod);
  uint64_t v8 = [v6 copy];

  dateInterval = v7->_dateInterval;
  v7->_dateInterval = (NSDateInterval *)v8;

  uint64_t v10 = [v5 copy];
  segments = v7->_segments;
  v7->_segments = (NSArray *)v10;

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(NSDateInterval *)self->_dateInterval startDate];
  v7 = [(NSDateInterval *)self->_dateInterval endDate];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p (%@ - %@), segments = %@>", v5, self, v6, v7, self->_segments];

  return v8;
}

- (NSString)hk_redactedDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p>", v5, self];

  return (NSString *)v6;
}

- (double)durationForCategory:(int64_t)a3 overlappingDateInterval:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = self->_segments;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v12 category] == a3)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          v13 = [v12 sampleIntervals];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [*(id *)(*((void *)&v22 + 1) + 8 * j) intersectionWithDateInterval:v6];
                [v18 duration];
                double v10 = v10 + v19;
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v15);
          }
        }
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (BOOL)containsSegmentsWithAppleSleepTrackingData
{
  return [(NSArray *)self->_segments hk_containsObjectPassingTest:&__block_literal_global_34];
}

uint64_t __59__HKSleepPeriod_containsSegmentsWithAppleSleepTrackingData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsAppleSleepTrackingData];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"DateInterval"];
  [v5 encodeObject:self->_segments forKey:@"Segments"];
}

- (HKSleepPeriod)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSleepPeriod;
  id v5 = [(HKSleepPeriod *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    double v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Segments"];
    segments = v5->_segments;
    v5->_segments = (NSArray *)v11;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HKSleepPeriod *)self dateInterval];
  uint64_t v7 = [v5 dateInterval];
  if (v6 != v7)
  {
    uint64_t v8 = [v5 dateInterval];
    if (!v8)
    {
      char v18 = 0;
      goto LABEL_14;
    }
    v3 = (void *)v8;
    uint64_t v9 = [(HKSleepPeriod *)self dateInterval];
    double v10 = [v5 dateInterval];
    if (![v9 isEqual:v10])
    {
      char v18 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v20 = v10;
    long long v22 = v9;
  }
  uint64_t v11 = [(HKSleepPeriod *)self segments];
  uint64_t v12 = [v5 segments];
  if (v11 == (void *)v12)
  {

    char v18 = 1;
  }
  else
  {
    v13 = (void *)v12;
    uint64_t v14 = [v5 segments];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = [(HKSleepPeriod *)self segments];
      v17 = [v5 segments];
      char v18 = [v16 isEqual:v17];
    }
    else
    {

      char v18 = 0;
    }
  }
  double v10 = v21;
  uint64_t v9 = v23;
  if (v6 != v7) {
    goto LABEL_13;
  }
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  v3 = [(HKSleepPeriod *)self dateInterval];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKSleepPeriod *)self segments];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
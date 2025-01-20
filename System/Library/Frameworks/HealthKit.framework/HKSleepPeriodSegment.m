@interface HKSleepPeriodSegment
+ (BOOL)supportsSecureCoding;
+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 category:(int64_t)a4;
+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 sampleIntervals:(id)a4 category:(int64_t)a5;
+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 sampleIntervals:(id)a4 category:(int64_t)a5 containsAppleSleepTrackingData:(BOOL)a6;
- (BOOL)containsAppleSleepTrackingData;
- (BOOL)isEqual:(id)a3;
- (HKSleepPeriodSegment)initWithCoder:(id)a3;
- (NSArray)sampleIntervals;
- (NSDateInterval)dateInterval;
- (NSString)hk_redactedDescription;
- (id)description;
- (id)mergingSleepPeriodSegment:(id)a3;
- (int64_t)category;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSleepPeriodSegment

+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 category:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:&v11 count:1];
  v9 = objc_msgSend(a1, "sleepPeriodSegmentWithDateInterval:sampleIntervals:category:containsAppleSleepTrackingData:", v7, v8, a4, 0, v11, v12);

  return v9;
}

+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 sampleIntervals:(id)a4 category:(int64_t)a5
{
  return (id)[a1 sleepPeriodSegmentWithDateInterval:a3 sampleIntervals:a4 category:a5 containsAppleSleepTrackingData:0];
}

+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 sampleIntervals:(id)a4 category:(int64_t)a5 containsAppleSleepTrackingData:(BOOL)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HKSleepPeriodSegment);
  uint64_t v12 = [v10 copy];

  dateInterval = v11->_dateInterval;
  v11->_dateInterval = (NSDateInterval *)v12;

  uint64_t v14 = [v9 copy];
  sampleIntervals = v11->_sampleIntervals;
  v11->_sampleIntervals = (NSArray *)v14;

  v11->_category = a5;
  v11->_containsAppleSleepTrackingData = a6;

  return v11;
}

- (id)mergingSleepPeriodSegment:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t v6 = [(HKSleepPeriodSegment *)self category];
  if (v6 != [v5 category])
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"HKSleepPeriod.m" lineNumber:72 description:@"Cannot merge segments with different category values."];
  }
  id v7 = objc_alloc_init(HKDateIntervalTree);
  [(HKDateIntervalTree *)v7 setMergeIntervals:1];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v8 = [(HKSleepPeriodSegment *)self sampleIntervals];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        [(HKDateIntervalTree *)v7 insertInterval:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v10);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v13 = objc_msgSend(v5, "sampleIntervals", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        [(HKDateIntervalTree *)v7 insertInterval:*(void *)(*((void *)&v34 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v15);
  }

  v18 = [(HKDateIntervalTree *)v7 mergedIntervals];
  v19 = [(HKSleepPeriodSegment *)self dateInterval];
  v20 = [v19 startDate];
  v21 = [v5 dateInterval];
  v22 = [v21 startDate];
  v23 = [v20 earlierDate:v22];

  v24 = [(HKSleepPeriodSegment *)self dateInterval];
  v25 = [v24 endDate];
  v26 = [v5 dateInterval];
  v27 = [v26 endDate];
  v28 = [v25 laterDate:v27];

  v29 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v23 endDate:v28];
  if ([(HKSleepPeriodSegment *)self containsAppleSleepTrackingData]) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = [v5 containsAppleSleepTrackingData];
  }
  v31 = +[HKSleepPeriodSegment sleepPeriodSegmentWithDateInterval:v29 sampleIntervals:v18 category:[(HKSleepPeriodSegment *)self category] containsAppleSleepTrackingData:v30];

  return v31;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(NSDateInterval *)self->_dateInterval startDate];
  id v7 = [(NSDateInterval *)self->_dateInterval endDate];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_sampleIntervals, "count"));
  unint64_t category = self->_category;
  if (category > 5) {
    uint64_t v10 = &stru_1EEC60288;
  }
  else {
    uint64_t v10 = off_1E58C0C70[category];
  }
  uint64_t v11 = HKStringFromBool(self->_containsAppleSleepTrackingData);
  uint64_t v12 = [v3 stringWithFormat:@"<%@:%p (%@ - %@), %@ samples, category = %@, containsAppleSleepTrackingData = %@>", v5, self, v6, v7, v8, v10, v11];

  return v12;
}

- (NSString)hk_redactedDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [v3 stringWithFormat:@"<%@:%p>", v5, self];

  return (NSString *)v6;
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
  [v5 encodeObject:self->_sampleIntervals forKey:@"SampleIntervals"];
  [v5 encodeInteger:self->_category forKey:@"Category"];
  [v5 encodeBool:self->_containsAppleSleepTrackingData forKey:@"ContainsAppleSleepTrackingData"];
}

- (HKSleepPeriodSegment)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSleepPeriodSegment;
  id v5 = [(HKSleepPeriodSegment *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"SampleIntervals"];
    sampleIntervals = v5->_sampleIntervals;
    v5->_sampleIntervals = (NSArray *)v11;

    v5->_unint64_t category = [v4 decodeIntegerForKey:@"Category"];
    v5->_containsAppleSleepTrackingData = [v4 decodeBoolForKey:@"ContainsAppleSleepTrackingData"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  v8 = [(HKSleepPeriodSegment *)self dateInterval];
  uint64_t v9 = [v7 dateInterval];
  if (v8 != v9)
  {
    uint64_t v10 = [v7 dateInterval];
    if (!v10)
    {
      LOBYTE(v16) = 0;
      goto LABEL_23;
    }
    v3 = (void *)v10;
    uint64_t v11 = [(HKSleepPeriodSegment *)self dateInterval];
    id v4 = [v7 dateInterval];
    if (![v11 isEqual:v4])
    {
      LOBYTE(v16) = 0;
LABEL_22:

      goto LABEL_23;
    }
    v21 = v4;
    v22 = v11;
  }
  uint64_t v12 = [(HKSleepPeriodSegment *)self sampleIntervals];
  v13 = [v7 sampleIntervals];
  if (v12 == v13) {
    goto LABEL_10;
  }
  uint64_t v14 = [v7 sampleIntervals];
  if (!v14) {
    goto LABEL_16;
  }
  id v5 = (void *)v14;
  uint64_t v15 = [(HKSleepPeriodSegment *)self sampleIntervals];
  id v4 = [v7 sampleIntervals];
  if ([v15 isEqual:v4])
  {
    v20 = v15;
LABEL_10:
    int64_t v17 = [(HKSleepPeriodSegment *)self category];
    if (v17 == [v7 category])
    {
      BOOL v18 = [(HKSleepPeriodSegment *)self containsAppleSleepTrackingData];
      int v16 = v18 ^ [v7 containsAppleSleepTrackingData] ^ 1;
      uint64_t v15 = v20;
      if (v12 == v13) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }
    if (v12 == v13)
    {
      LOBYTE(v16) = 0;
      goto LABEL_20;
    }

LABEL_16:
    LOBYTE(v16) = 0;
    goto LABEL_21;
  }
  LOBYTE(v16) = 0;
LABEL_18:

LABEL_20:
LABEL_21:
  id v4 = v21;
  uint64_t v11 = v22;
  if (v8 != v9) {
    goto LABEL_22;
  }
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  v3 = [(HKSleepPeriodSegment *)self dateInterval];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKSleepPeriodSegment *)self sampleIntervals];
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = v6 ^ [(HKSleepPeriodSegment *)self category];
  unint64_t v8 = v7 ^ [(HKSleepPeriodSegment *)self containsAppleSleepTrackingData];

  return v8;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)sampleIntervals
{
  return self->_sampleIntervals;
}

- (int64_t)category
{
  return self->_category;
}

- (BOOL)containsAppleSleepTrackingData
{
  return self->_containsAppleSleepTrackingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleIntervals, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
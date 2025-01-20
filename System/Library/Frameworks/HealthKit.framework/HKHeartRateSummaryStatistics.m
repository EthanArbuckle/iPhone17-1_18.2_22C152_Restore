@interface HKHeartRateSummaryStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHeartRateSummaryStatistics)initWithCoder:(id)a3;
- (HKHeartRateSummaryStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 sessionUUID:(id)a5;
- (NSArray)highlightedReadings;
- (NSDateInterval)dateInterval;
- (NSUUID)sessionUUID;
- (id)_bucketAtIndex:(int64_t)a3 createdIfNeeded:(BOOL)a4;
- (id)_bucketsDescription;
- (id)_dictionaryRepresentation;
- (id)bucketAtIndex:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromStatistics:(id)a3;
- (int64_t)numberOfBuckets;
- (int64_t)numberOfReadings;
- (unint64_t)hash;
- (void)_setHighlightedReadings:(id)a3;
- (void)addHeartRateInBeatsPerMinute:(double)a3 forTime:(double)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateBucketsWithBlock:(id)a3;
@end

@implementation HKHeartRateSummaryStatistics

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (id)_bucketAtIndex:(int64_t)a3 createdIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(NSMutableArray *)self->_sortedBuckets count] - 1;
  if (v7 < 0)
  {
    uint64_t v10 = 0;
LABEL_12:
    v12 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = v7 + v8;
    if (v7 + v8 < 0 != __OFADD__(v7, v8)) {
      ++v9;
    }
    uint64_t v10 = v9 >> 1;
    v11 = [(NSMutableArray *)self->_sortedBuckets objectAtIndexedSubscript:v9 >> 1];
    if ([v11 bucketIndex] == a3) {
      break;
    }
    if ([v11 bucketIndex] >= a3) {
      uint64_t v7 = v10 - 1;
    }
    else {
      uint64_t v8 = v10 + 1;
    }

    if (v8 > v7) {
      goto LABEL_12;
    }
  }
  v12 = [(NSMutableArray *)self->_sortedBuckets objectAtIndexedSubscript:v10];

  if (!v12)
  {
LABEL_14:
    if (v4)
    {
      v12 = [[HKHeartRateSummaryStatisticsBucket alloc] initWithBucketIndex:a3];
      [(NSMutableArray *)self->_sortedBuckets insertObject:v12 atIndex:v10];
    }
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7 = (HKHeartRateSummaryStatistics *)a3;
  if (self == v7)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [(HKHeartRateSummaryStatistics *)self dateInterval];
      uint64_t v9 = [(HKHeartRateSummaryStatistics *)v7 dateInterval];
      if (v8 != v9)
      {
        uint64_t v10 = [(HKHeartRateSummaryStatistics *)v7 dateInterval];
        if (!v10)
        {
          LOBYTE(v11) = 0;
          goto LABEL_21;
        }
        v3 = (void *)v10;
        BOOL v4 = [(HKHeartRateSummaryStatistics *)self dateInterval];
        v5 = [(HKHeartRateSummaryStatistics *)v7 dateInterval];
        if (![v4 isEqual:v5])
        {
          LOBYTE(v11) = 0;
          goto LABEL_19;
        }
      }
      sortedBuckets = self->_sortedBuckets;
      v13 = v7->_sortedBuckets;
      if (sortedBuckets != v13 && (!v13 || !-[NSMutableArray isEqual:](sortedBuckets, "isEqual:"))
        || (int64_t v14 = [(HKHeartRateSummaryStatistics *)self numberOfReadings],
            v14 != [(HKHeartRateSummaryStatistics *)v7 numberOfReadings]))
      {
        LOBYTE(v11) = 0;
        goto LABEL_18;
      }
      v15 = [(HKHeartRateSummaryStatistics *)self sessionUUID];
      uint64_t v16 = [(HKHeartRateSummaryStatistics *)v7 sessionUUID];
      v17 = (void *)v16;
      if (v15 == (void *)v16)
      {
        v33 = v5;
        v34 = v4;
        v31 = (void *)v16;
        v32 = v15;
      }
      else
      {
        v11 = [(HKHeartRateSummaryStatistics *)v7 sessionUUID];
        if (!v11)
        {
LABEL_33:

LABEL_18:
          if (v8 == v9)
          {
LABEL_21:

            goto LABEL_22;
          }
LABEL_19:

          goto LABEL_21;
        }
        v33 = v5;
        v34 = v4;
        v18 = [(HKHeartRateSummaryStatistics *)self sessionUUID];
        v19 = [(HKHeartRateSummaryStatistics *)v7 sessionUUID];
        if (([v18 isEqual:v19] & 1) == 0)
        {

          LOBYTE(v11) = 0;
          goto LABEL_37;
        }
        v28 = v19;
        v29 = v18;
        v30 = v11;
        v31 = v17;
        v32 = v15;
      }
      v21 = [(HKHeartRateSummaryStatistics *)self highlightedReadings];
      uint64_t v22 = [(HKHeartRateSummaryStatistics *)v7 highlightedReadings];
      LOBYTE(v11) = v21 == (void *)v22;
      if (v21 == (void *)v22)
      {
      }
      else
      {
        v23 = (void *)v22;
        uint64_t v24 = [(HKHeartRateSummaryStatistics *)v7 highlightedReadings];
        if (v24)
        {
          v25 = (void *)v24;
          v26 = [(HKHeartRateSummaryStatistics *)self highlightedReadings];
          v27 = [(HKHeartRateSummaryStatistics *)v7 highlightedReadings];
          LOBYTE(v11) = [v26 isEqual:v27];

          v15 = v32;
          if (v32 == v31)
          {
          }
          else
          {
          }
          goto LABEL_36;
        }
      }
      v17 = v31;
      v15 = v32;
      if (v32 == v31)
      {

LABEL_36:
LABEL_37:
        v5 = v33;
        BOOL v4 = v34;
        if (v8 == v9) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }

      v5 = v33;
      BOOL v4 = v34;
      goto LABEL_33;
    }
    LOBYTE(v11) = 0;
  }
LABEL_22:

  return (char)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedReadings, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_sortedBuckets, 0);
}

- (HKHeartRateSummaryStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 sessionUUID:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKHeartRateSummaryStatistics;
  v11 = [(HKHeartRateSummaryStatistics *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dateInterval, a3);
    v12->_numberOfBuckets = a4;
    objc_storeStrong((id *)&v12->_sessionUUID, a5);
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    sortedBuckets = v12->_sortedBuckets;
    v12->_sortedBuckets = (NSMutableArray *)v13;
  }
  return v12;
}

- (id)initFromStatistics:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (id *)a3;
  v21.receiver = self;
  v21.super_class = (Class)HKHeartRateSummaryStatistics;
  v5 = [(HKHeartRateSummaryStatistics *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dateInterval, v4[2]);
    v6->_numberOfBuckets = (int64_t)v4[3];
    v6->_numberOfReadings = (int64_t)v4[4];
    objc_storeStrong((id *)&v6->_sessionUUID, v4[5]);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    sortedBuckets = v6->_sortedBuckets;
    v6->_sortedBuckets = (NSMutableArray *)v7;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v4[1];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          int64_t v14 = v6->_sortedBuckets;
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "copy", (void)v17);
          [(NSMutableArray *)v14 addObject:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }

    objc_storeStrong((id *)&v6->_highlightedReadings, v4[6]);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initFromStatistics:self];
}

- (void)_setHighlightedReadings:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  highlightedReadings = self->_highlightedReadings;
  self->_highlightedReadings = v4;

  MEMORY[0x1F41817F8](v4, highlightedReadings);
}

- (void)addHeartRateInBeatsPerMinute:(double)a3 forTime:(double)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(NSDateInterval *)self->_dateInterval hk_containsTime:a4])
  {
    uint64_t v7 = [(NSDateInterval *)self->_dateInterval startDate];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = a4 - v8;

    double v10 = v9 * (double)self->_numberOfBuckets;
    [(NSDateInterval *)self->_dateInterval duration];
    int64_t v12 = vcvtmd_s64_f64(v10 / v11);
    int64_t numberOfBuckets = self->_numberOfBuckets;
    if (numberOfBuckets <= v12) {
      int64_t v14 = numberOfBuckets - 1;
    }
    else {
      int64_t v14 = v12;
    }
    id v22 = [(HKHeartRateSummaryStatistics *)self _bucketAtIndex:v14 createdIfNeeded:1];
    [v22 addHeartRateInBeatsPerMinute:llround(a3)];
    ++self->_numberOfReadings;
  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)HKLogHeartRate;
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR))
    {
      objc_super v16 = v15;
      long long v17 = objc_opt_class();
      long long v18 = (void *)MEMORY[0x1E4F1C9C8];
      id v19 = v17;
      long long v20 = [v18 dateWithTimeIntervalSinceReferenceDate:a4];
      dateInterval = self->_dateInterval;
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v17;
      __int16 v25 = 2114;
      v26 = v20;
      __int16 v27 = 2114;
      v28 = dateInterval;
      _os_log_error_impl(&dword_19C023000, v16, OS_LOG_TYPE_ERROR, "%{public}@: attempting to add heart rate for date %{public}@ outside of date interval %{public}@", buf, 0x20u);
    }
  }
}

- (id)bucketAtIndex:(int64_t)a3
{
  return [(HKHeartRateSummaryStatistics *)self _bucketAtIndex:a3 createdIfNeeded:0];
}

- (void)enumerateBucketsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void))a3;
  if (!v5)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKHeartRateSummaryStatistics.m", 89, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_sortedBuckets;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v5[2](v5, *(void *)(*((void *)&v12 + 1) + 8 * i));
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
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
  [v5 encodeInteger:self->_numberOfBuckets forKey:@"NumberOfBuckets"];
  [v5 encodeObject:self->_sortedBuckets forKey:@"SortedBuckets"];
  [v5 encodeInteger:self->_numberOfReadings forKey:@"NumberOfReadings"];
  [v5 encodeObject:self->_sessionUUID forKey:@"SessionUUIDKey"];
  [v5 encodeObject:self->_highlightedReadings forKey:@"HighlightedReadings"];
}

- (HKHeartRateSummaryStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKHeartRateSummaryStatistics;
  id v5 = [(HKHeartRateSummaryStatistics *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    v5->_int64_t numberOfBuckets = [v4 decodeIntegerForKey:@"NumberOfBuckets"];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    double v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    double v11 = [v4 decodeObjectOfClasses:v10 forKey:@"SortedBuckets"];
    uint64_t v12 = [v11 mutableCopy];
    sortedBuckets = v5->_sortedBuckets;
    v5->_sortedBuckets = (NSMutableArray *)v12;

    v5->_numberOfReadings = [v4 decodeIntegerForKey:@"NumberOfReadings"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SessionUUIDKey"];
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v14;

    objc_super v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    long long v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"HighlightedReadings"];
    highlightedReadings = v5->_highlightedReadings;
    v5->_highlightedReadings = (NSArray *)v19;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"));
  uint64_t v6 = [(NSDateInterval *)self->_dateInterval startDate];
  uint64_t v7 = [(NSDateInterval *)self->_dateInterval endDate];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p count:%@ %@ - %@>", v4, self, v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(HKHeartRateSummaryStatistics *)self dateInterval];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSMutableArray *)self->_sortedBuckets hash];
  int64_t v6 = v5 ^ v4 ^ [(HKHeartRateSummaryStatistics *)self numberOfReadings];
  uint64_t v7 = [(NSMutableArray *)self->_sortedBuckets hash];
  uint64_t v8 = [(HKHeartRateSummaryStatistics *)self sessionUUID];
  uint64_t v9 = v6 ^ v7 ^ [v8 hash];
  double v10 = [(HKHeartRateSummaryStatistics *)self highlightedReadings];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (int64_t)numberOfBuckets
{
  return self->_numberOfBuckets;
}

- (int64_t)numberOfReadings
{
  return self->_numberOfReadings;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSArray)highlightedReadings
{
  return self->_highlightedReadings;
}

- (id)_dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__HKHeartRateSummaryStatistics_Testing___dictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E58C9728;
  id v4 = v3;
  id v7 = v4;
  [(HKHeartRateSummaryStatistics *)self enumerateBucketsWithBlock:v6];

  return v4;
}

void __66__HKHeartRateSummaryStatistics_Testing___dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 heartRatesInBeatsPerMinute];
  uint64_t v5 = (char *)v11 - ((8 * [v4 count] + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v4, "getIndexes:maxCount:inIndexRange:", v5, objc_msgSend(v4, "count"), 0);
  int64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  if ([v4 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:*(void *)&v5[8 * v7]];
      [v6 addObject:v8];

      ++v7;
    }
    while (v7 < [v4 count]);
  }
  if ([v6 count])
  {
    uint64_t v9 = *(void **)(a1 + 32);
    double v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "bucketIndex"));
    [v9 setObject:v6 forKey:v10];
  }
}

- (id)_bucketsDescription
{
  if ([(NSMutableArray *)self->_sortedBuckets count])
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(\n");
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__HKHeartRateSummaryStatistics_Testing___bucketsDescription__block_invoke;
    v6[3] = &unk_1E58C9728;
    id v4 = v3;
    id v7 = v4;
    [(HKHeartRateSummaryStatistics *)self enumerateBucketsWithBlock:v6];
    [v4 appendFormat:@""]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __60__HKHeartRateSummaryStatistics_Testing___bucketsDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "bucketIndex"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 heartRatesInBeatsPerMinute];

  [v2 appendFormat:@"    %@ => %@\n", v6, v5];
}

@end
@interface HKValueHistogram
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKValueHistogram)initWithCoder:(id)a3;
- (HKValueHistogram)initWithSegments:(id)a3 dateInterval:(id)a4;
- (NSArray)segments;
- (NSDateInterval)dateInterval;
- (double)fractionOfValuesInSegmentAtIndex:(int64_t)a3;
- (id)description;
- (int64_t)totalSampleCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKValueHistogram

- (HKValueHistogram)initWithSegments:(id)a3 dateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKValueHistogram;
  v8 = [(HKValueHistogram *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    segments = v8->_segments;
    v8->_segments = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dateInterval, a4);
  }

  return v8;
}

- (int64_t)totalSampleCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_segments;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "count", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (double)fractionOfValuesInSegmentAtIndex:(int64_t)a3
{
  int64_t v5 = [(NSArray *)self->_segments objectAtIndexedSubscript:a3];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(HKValueHistogram *)self totalSampleCount];
  if (v7 <= 0)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKValueHistogramCollection.m" lineNumber:95 description:@"Cannot compute fraction of values in segment of histogram with zero total samples"];
  }
  return (double)v6 / (double)v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKValueHistogram *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if ([(HKValueHistogram *)v4 isMemberOfClass:objc_opt_class()])
  {
    int64_t v5 = v4;
    segments = self->_segments;
    uint64_t v7 = [(HKValueHistogram *)v5 segments];
    if ([(NSArray *)segments isEqual:v7])
    {
      dateInterval = self->_dateInterval;
      long long v9 = [(HKValueHistogram *)v5 dateInterval];
      char v10 = [(NSDateInterval *)dateInterval isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p segments=%@ dateInterval=%@>", objc_opt_class(), self, self->_segments, self->_dateInterval];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKValueHistogram)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  uint64_t v7 = [v5 decodeObjectOfClasses:v6 forKey:@"segments"];

  v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];

  long long v9 = [(HKValueHistogram *)self initWithSegments:v7 dateInterval:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  segments = self->_segments;
  id v5 = a3;
  [v5 encodeObject:segments forKey:@"segments"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
}

- (NSArray)segments
{
  return self->_segments;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_segments, 0);
}

@end
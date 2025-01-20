@interface FPSQLDatabaseQueryStatistics
+ (BOOL)supportsSecureCoding;
- (FPSQLDatabaseQueryStatistics)initWithCoder:(id)a3;
- (FPSQLDatabaseQueryStatistics)initWithMinTime:(double)a3 maxTime:(double)a4 cumulatedTime:(double)a5 cumulatedSquareDiffFromMean:(double)a6 count:(int64_t)a7 queryPlan:(id)a8;
- (NSString)queryPlan;
- (double)cumulatedSquareDiffFromMean;
- (double)cumulatedTime;
- (double)maxTime;
- (double)minTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setCumulatedSquareDiffFromMean:(double)a3;
- (void)setCumulatedTime:(double)a3;
- (void)setMaxTime:(double)a3;
- (void)setMinTime:(double)a3;
- (void)setQueryPlan:(id)a3;
@end

@implementation FPSQLDatabaseQueryStatistics

- (FPSQLDatabaseQueryStatistics)initWithMinTime:(double)a3 maxTime:(double)a4 cumulatedTime:(double)a5 cumulatedSquareDiffFromMean:(double)a6 count:(int64_t)a7 queryPlan:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)FPSQLDatabaseQueryStatistics;
  v16 = [(FPSQLDatabaseQueryStatistics *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_minTime = a3;
    v16->_maxTime = a4;
    v16->_cumulatedTime = a5;
    v16->_cumulatedSquareDiffFromMean = a6;
    v16->_count = a7;
    objc_storeStrong((id *)&v16->_queryPlan, a8);
  }

  return v17;
}

- (id)description
{
  queryPlan = (__CFString *)self->_queryPlan;
  if (!queryPlan) {
    queryPlan = &stru_1EF68D1F8;
  }
  return (id)[NSString stringWithFormat:@" minTime %fs, maxTime %fs, totalTime %fs, mean %fs, stdDev %fs, count %llu, _queryPlan %@", *(void *)&self->_minTime, *(void *)&self->_maxTime, *(void *)&self->_cumulatedTime, self->_cumulatedTime / (double)self->_count, sqrt(self->_cumulatedSquareDiffFromMean / (double)self->_count), self->_count, queryPlan];
}

- (FPSQLDatabaseQueryStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPSQLDatabaseQueryStatistics;
  v5 = [(FPSQLDatabaseQueryStatistics *)&v14 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"minTime"];
    v5->_minTime = v6;
    [v4 decodeDoubleForKey:@"maxTime"];
    v5->_maxTime = v7;
    [v4 decodeDoubleForKey:@"cumulatedTime"];
    v5->_cumulatedTime = v8;
    [v4 decodeDoubleForKey:@"cumulatedSquareDiffFromMean"];
    v5->_cumulatedSquareDiffFromMean = v9;
    [v4 decodeDoubleForKey:@"count"];
    v5->_count = (uint64_t)v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryPlan"];
    queryPlan = v5->_queryPlan;
    v5->_queryPlan = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeDouble:@"minTime" forKey:self->_minTime];
  [v5 encodeDouble:@"maxTime" forKey:self->_maxTime];
  [v5 encodeDouble:@"cumulatedTime" forKey:self->_cumulatedTime];
  [v5 encodeDouble:@"cumulatedSquareDiffFromMean" forKey:self->_cumulatedSquareDiffFromMean];
  [v5 encodeDouble:@"count" forKey:(double)self->_count];
  queryPlan = self->_queryPlan;
  if (queryPlan) {
    [v5 encodeObject:queryPlan forKey:@"queryPlan"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double minTime = self->_minTime;
  double maxTime = self->_maxTime;
  double cumulatedTime = self->_cumulatedTime;
  double cumulatedSquareDiffFromMean = self->_cumulatedSquareDiffFromMean;
  int64_t count = self->_count;
  queryPlan = self->_queryPlan;

  return (id)[v4 initWithMinTime:count maxTime:queryPlan cumulatedTime:minTime cumulatedSquareDiffFromMean:maxTime count:cumulatedTime queryPlan:cumulatedSquareDiffFromMean];
}

- (double)minTime
{
  return self->_minTime;
}

- (void)setMinTime:(double)a3
{
  self->_double minTime = a3;
}

- (double)maxTime
{
  return self->_maxTime;
}

- (void)setMaxTime:(double)a3
{
  self->_double maxTime = a3;
}

- (double)cumulatedTime
{
  return self->_cumulatedTime;
}

- (void)setCumulatedTime:(double)a3
{
  self->_double cumulatedTime = a3;
}

- (double)cumulatedSquareDiffFromMean
{
  return self->_cumulatedSquareDiffFromMean;
}

- (void)setCumulatedSquareDiffFromMean:(double)a3
{
  self->_double cumulatedSquareDiffFromMean = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_int64_t count = a3;
}

- (NSString)queryPlan
{
  return self->_queryPlan;
}

- (void)setQueryPlan:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
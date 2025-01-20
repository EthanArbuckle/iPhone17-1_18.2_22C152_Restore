@interface HKHeartRateDisplayTypeContextResult
- (HKHeartRateDisplayTypeContextResult)initWithContext:(int64_t)a3 statistics:(id)a4;
- (HKStatistics)statistics;
- (id)debugDescription;
- (int64_t)context;
- (void)setContext:(int64_t)a3;
- (void)setStatistics:(id)a3;
@end

@implementation HKHeartRateDisplayTypeContextResult

- (HKHeartRateDisplayTypeContextResult)initWithContext:(int64_t)a3 statistics:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKHeartRateDisplayTypeContextResult;
  v7 = [(HKHeartRateDisplayTypeContextResult *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(HKHeartRateDisplayTypeContextResult *)v7 setContext:a3];
    [(HKHeartRateDisplayTypeContextResult *)v8 setStatistics:v6];
  }

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  int64_t v4 = [(HKHeartRateDisplayTypeContextResult *)self context];
  uint64_t v5 = [(HKHeartRateDisplayTypeContextResult *)self statistics];
  id v6 = (void *)v5;
  v7 = @"None";
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = [v3 stringWithFormat:@"Context Display Type: %ld, Statistics: %@", v4, v7];

  return v8;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (HKStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
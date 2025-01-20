@interface HKHRCardioFitnessAnalyticsResult
- (HKHRCardioFitnessAnalyticsResult)initWithStatus:(int64_t)a3 error:(id)a4;
- (NSError)error;
- (int64_t)status;
@end

@implementation HKHRCardioFitnessAnalyticsResult

- (HKHRCardioFitnessAnalyticsResult)initWithStatus:(int64_t)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKHRCardioFitnessAnalyticsResult;
  v8 = [(HKHRCardioFitnessAnalyticsResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (int64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end
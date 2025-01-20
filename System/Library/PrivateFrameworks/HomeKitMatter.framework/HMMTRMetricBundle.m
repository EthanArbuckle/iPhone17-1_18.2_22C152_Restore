@interface HMMTRMetricBundle
- (HMMTRMetricBundle)initWithTime:(id)a3 name:(id)a4;
- (NSDate)time;
- (NSString)name;
- (double)durationWithDate:(id)a3;
@end

@implementation HMMTRMetricBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_time, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)time
{
  return self->_time;
}

- (double)durationWithDate:(id)a3
{
  [a3 timeIntervalSinceDate:self->_time];
  return result;
}

- (HMMTRMetricBundle)initWithTime:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRMetricBundle;
  v9 = [(HMMTRMetricBundle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_time, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

@end
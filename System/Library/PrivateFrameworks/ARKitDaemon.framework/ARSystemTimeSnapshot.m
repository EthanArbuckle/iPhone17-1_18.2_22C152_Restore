@interface ARSystemTimeSnapshot
+ (id)timeSinceSnapshot:(id)a3;
- (ARSystemTimeSnapshot)init;
- (ARSystemTimeSnapshot)initWithUpTime:(double)a3 upTimeIncludingSleep:(double)a4 upTimeIncludingSleepAndDriftCorrection:(double)a5;
- (double)upTime;
- (double)upTimeIncludingSleep;
- (double)upTimeIncludingSleepAndDriftCorrection;
- (id)description;
- (id)timeSinceSnapshot:(id)a3;
@end

@implementation ARSystemTimeSnapshot

+ (id)timeSinceSnapshot:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v4 timeSinceSnapshot:v3];

  return v5;
}

- (ARSystemTimeSnapshot)init
{
  ARGetSystemUpTime();
  double v4 = v3;
  ARGetSystemUpTimeIncludingSleep();
  double v6 = v5;
  ARGetSystemUpTimeIncludingSleepAndDriftCorrection();
  return [(ARSystemTimeSnapshot *)self initWithUpTime:v4 upTimeIncludingSleep:v6 upTimeIncludingSleepAndDriftCorrection:v7];
}

- (ARSystemTimeSnapshot)initWithUpTime:(double)a3 upTimeIncludingSleep:(double)a4 upTimeIncludingSleepAndDriftCorrection:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ARSystemTimeSnapshot;
  result = [(ARSystemTimeSnapshot *)&v9 init];
  if (result)
  {
    result->_upTime = a3;
    result->_upTimeIncludingSleep = a4;
    result->_upTimeIncludingSleepAndDriftCorrection = a5;
  }
  return result;
}

- (id)timeSinceSnapshot:(id)a3
{
  id v4 = a3;
  double v5 = [ARSystemTimeSnapshot alloc];
  double upTime = self->_upTime;
  [v4 upTime];
  double v8 = upTime - v7;
  double upTimeIncludingSleep = self->_upTimeIncludingSleep;
  [v4 upTimeIncludingSleep];
  double v11 = upTimeIncludingSleep - v10;
  double upTimeIncludingSleepAndDriftCorrection = self->_upTimeIncludingSleepAndDriftCorrection;
  [v4 upTimeIncludingSleepAndDriftCorrection];
  double v14 = v13;

  v15 = [(ARSystemTimeSnapshot *)v5 initWithUpTime:v8 upTimeIncludingSleep:v11 upTimeIncludingSleepAndDriftCorrection:upTimeIncludingSleepAndDriftCorrection - v14];
  return v15;
}

- (id)description
{
  double v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"<%@: %p upTime=%f upTimeIncludingSleep=%f upTimeIncludingSleepAndDriftCorrection=%f>", v5, self, *(void *)&self->_upTime, *(void *)&self->_upTimeIncludingSleep, *(void *)&self->_upTimeIncludingSleepAndDriftCorrection];

  return v6;
}

- (double)upTime
{
  return self->_upTime;
}

- (double)upTimeIncludingSleep
{
  return self->_upTimeIncludingSleep;
}

- (double)upTimeIncludingSleepAndDriftCorrection
{
  return self->_upTimeIncludingSleepAndDriftCorrection;
}

@end
@interface LACDTOGracePeriodState
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (LACDTOGracePeriodState)initWithCoder:(id)a3;
- (LACDTOGracePeriodState)initWithTime:(double)a3 maxThreshold:(double)a4;
- (double)duration;
- (double)maxThreshold;
- (double)time;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTOGracePeriodState

- (LACDTOGracePeriodState)initWithTime:(double)a3 maxThreshold:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LACDTOGracePeriodState;
  result = [(LACDTOGracePeriodState *)&v7 init];
  if (result)
  {
    result->_time = a3;
    result->_maxThreshold = a4;
  }
  return result;
}

- (BOOL)isActive
{
  [(LACDTOGracePeriodState *)self maxThreshold];
  if (v3 <= 0.0) {
    return 0;
  }
  [(LACDTOGracePeriodState *)self time];
  if (v4 <= 0.0) {
    return 0;
  }
  [(LACDTOGracePeriodState *)self time];
  double v6 = v5;
  [(LACDTOGracePeriodState *)self maxThreshold];
  return v6 <= v7;
}

- (double)duration
{
  BOOL v3 = [(LACDTOGracePeriodState *)self isActive];
  double result = 0.0;
  if (v3)
  {
    [(LACDTOGracePeriodState *)self maxThreshold];
    double v6 = v5;
    [(LACDTOGracePeriodState *)self time];
    return fmax(v6 - v7, 0.0);
  }
  return result;
}

+ (id)nullInstance
{
  v2 = [[LACDTOGracePeriodState alloc] initWithTime:0.0 maxThreshold:0.0];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(LACDTOGracePeriodState *)self time];
  double v6 = v5;
  double v7 = NSStringFromSelector(sel_time);
  [v4 encodeDouble:v7 forKey:v6];

  [(LACDTOGracePeriodState *)self maxThreshold];
  double v9 = v8;
  NSStringFromSelector(sel_maxThreshold);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v10 forKey:v9];
}

- (LACDTOGracePeriodState)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = NSStringFromSelector(sel_time);
  [v4 decodeDoubleForKey:v5];
  double v7 = v6;

  double v8 = NSStringFromSelector(sel_maxThreshold);
  [v4 decodeDoubleForKey:v8];
  double v10 = v9;

  return [(LACDTOGracePeriodState *)self initWithTime:v7 maxThreshold:v10];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(LACDTOGracePeriodState *)self time];
    double v7 = v6;
    [v5 time];
    if (v7 == v8)
    {
      [(LACDTOGracePeriodState *)self maxThreshold];
      double v11 = v10;
      [v5 maxThreshold];
      BOOL v9 = v11 == v12;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v25[4] = *MEMORY[0x263EF8340];
  v24 = NSString;
  uint64_t v23 = objc_opt_class();
  BOOL v3 = NSString;
  id v4 = NSNumber;
  [(LACDTOGracePeriodState *)self time];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  double v6 = [v3 stringWithFormat:@"time: %@", v5];
  v25[0] = v6;
  double v7 = NSString;
  double v8 = NSNumber;
  [(LACDTOGracePeriodState *)self maxThreshold];
  BOOL v9 = objc_msgSend(v8, "numberWithDouble:");
  double v10 = [v7 stringWithFormat:@"maxThreshold: %@", v9];
  v25[1] = v10;
  double v11 = NSString;
  BOOL v12 = [(LACDTOGracePeriodState *)self isActive];
  v13 = @"NO";
  if (v12) {
    v13 = @"YES";
  }
  v14 = [v11 stringWithFormat:@"isActive: %@", v13];
  v25[2] = v14;
  v15 = NSString;
  v16 = NSNumber;
  [(LACDTOGracePeriodState *)self duration];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v18 = [v15 stringWithFormat:@"duration: %@", v17];
  v25[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  v20 = [v19 componentsJoinedByString:@"; "];
  v21 = [v24 stringWithFormat:@"<%@ %p; %@>", v23, self, v20];

  return v21;
}

- (double)time
{
  return self->_time;
}

- (double)maxThreshold
{
  return self->_maxThreshold;
}

@end
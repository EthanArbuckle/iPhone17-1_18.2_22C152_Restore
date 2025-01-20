@interface LACDTOBiometryWatchdog
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isBarking;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunning;
- (LACDTOBiometryWatchdog)initWithCoder:(id)a3;
- (LACDTOBiometryWatchdog)initWithIsRunning:(BOOL)a3 time:(double)a4 minThreshold:(double)a5 maxThreshold:(double)a6;
- (double)maxThreshold;
- (double)minThreshold;
- (double)time;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTOBiometryWatchdog

- (LACDTOBiometryWatchdog)initWithIsRunning:(BOOL)a3 time:(double)a4 minThreshold:(double)a5 maxThreshold:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)LACDTOBiometryWatchdog;
  result = [(LACDTOBiometryWatchdog *)&v11 init];
  if (result)
  {
    result->_isRunning = a3;
    result->_time = a4;
    result->_minThreshold = a5;
    result->_maxThreshold = a6;
  }
  return result;
}

+ (id)nullInstance
{
  v2 = [[LACDTOBiometryWatchdog alloc] initWithIsRunning:0 time:0.0 minThreshold:0.0 maxThreshold:0.0];
  return v2;
}

- (BOOL)isBarking
{
  BOOL v3 = [(LACDTOBiometryWatchdog *)self isRunning];
  if (v3)
  {
    [(LACDTOBiometryWatchdog *)self time];
    double v5 = v4;
    [(LACDTOBiometryWatchdog *)self minThreshold];
    if (v5 >= v6)
    {
      [(LACDTOBiometryWatchdog *)self time];
      double v8 = v7;
      [(LACDTOBiometryWatchdog *)self maxThreshold];
      LOBYTE(v3) = v8 <= v9;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(LACDTOBiometryWatchdog *)self isRunning];
  double v6 = NSStringFromSelector(sel_isRunning);
  [v4 encodeBool:v5 forKey:v6];

  [(LACDTOBiometryWatchdog *)self time];
  double v8 = v7;
  double v9 = NSStringFromSelector(sel_time);
  [v4 encodeDouble:v9 forKey:v8];

  [(LACDTOBiometryWatchdog *)self minThreshold];
  double v11 = v10;
  v12 = NSStringFromSelector(sel_minThreshold);
  [v4 encodeDouble:v12 forKey:v11];

  [(LACDTOBiometryWatchdog *)self maxThreshold];
  double v14 = v13;
  NSStringFromSelector(sel_maxThreshold);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v15 forKey:v14];
}

- (LACDTOBiometryWatchdog)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = NSStringFromSelector(sel_isRunning);
  uint64_t v6 = [v4 decodeBoolForKey:v5];

  double v7 = NSStringFromSelector(sel_time);
  [v4 decodeDoubleForKey:v7];
  double v9 = v8;

  double v10 = NSStringFromSelector(sel_minThreshold);
  [v4 decodeDoubleForKey:v10];
  double v12 = v11;

  double v13 = NSStringFromSelector(sel_maxThreshold);
  [v4 decodeDoubleForKey:v13];
  double v15 = v14;

  return [(LACDTOBiometryWatchdog *)self initWithIsRunning:v6 time:v9 minThreshold:v12 maxThreshold:v15];
}

- (id)description
{
  v22[4] = *MEMORY[0x263EF8340];
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = NSString;
  BOOL v6 = [(LACDTOBiometryWatchdog *)self isRunning];
  double v7 = @"NO";
  if (v6) {
    double v7 = @"YES";
  }
  double v8 = [v5 stringWithFormat:@"isRunning: %@", v7];
  v22[0] = v8;
  double v9 = NSString;
  [(LACDTOBiometryWatchdog *)self time];
  double v11 = [v9 stringWithFormat:@"time: %.2f", v10];
  v22[1] = v11;
  double v12 = NSString;
  [(LACDTOBiometryWatchdog *)self minThreshold];
  double v14 = [v12 stringWithFormat:@"minThreshold: %.2f", v13];
  v22[2] = v14;
  double v15 = NSString;
  [(LACDTOBiometryWatchdog *)self maxThreshold];
  v17 = [v15 stringWithFormat:@"maxThreshold: %.2f", v16];
  v22[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v19 = [v18 componentsJoinedByString:@"; "];
  v20 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v19];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(LACDTOBiometryWatchdog *)self isRunning];
    if (v6 == [v5 isRunning]
      && (-[LACDTOBiometryWatchdog time](self, "time"), double v8 = v7, [v5 time], v8 == v9)
      && ([(LACDTOBiometryWatchdog *)self minThreshold],
          double v11 = v10,
          [v5 minThreshold],
          v11 == v12))
    {
      [(LACDTOBiometryWatchdog *)self maxThreshold];
      double v16 = v15;
      [v5 maxThreshold];
      BOOL v13 = v16 == v17;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (double)time
{
  return self->_time;
}

- (double)minThreshold
{
  return self->_minThreshold;
}

- (double)maxThreshold
{
  return self->_maxThreshold;
}

@end
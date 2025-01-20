@interface DADeviceStateRecord
- (BOOL)isEqual:(id)a3;
- (DADeviceStateRecord)initWithState:(int64_t)a3 andTime:(id)a4;
- (NSNumber)discoveryTime;
- (NSNumber)time;
- (id)discoveryTimeIntervelBetweenState:(id)a3;
- (id)stateTransitionAsString:(id)a3;
- (id)timeIntervelBetweenState:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (void)setDiscoveryTime:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTime:(id)a3;
@end

@implementation DADeviceStateRecord

- (DADeviceStateRecord)initWithState:(int64_t)a3 andTime:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DADeviceStateRecord;
  v8 = [(DADeviceStateRecord *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    objc_storeStrong((id *)&v8->_time, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_state;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DADeviceStateRecord *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if ([(DADeviceStateRecord *)v4 isMemberOfClass:objc_opt_class()])
  {
    int64_t state = self->_state;
    BOOL v6 = state == [(DADeviceStateRecord *)v4 state];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)discoveryTimeIntervelBetweenState:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"DADeviceAccessAnalytics.m" lineNumber:60 description:@"Other object to compare is nil"];
  }
  BOOL v6 = [(DADeviceStateRecord *)self discoveryTime];
  [v6 doubleValue];
  double v8 = v7;
  v9 = [v5 discoveryTime];
  [v9 doubleValue];
  double v11 = vabdd_f64(v8, v10);

  v12 = [NSNumber numberWithDouble:v11];

  return v12;
}

- (id)timeIntervelBetweenState:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"DADeviceAccessAnalytics.m" lineNumber:68 description:@"Other object to compare is nil"];
  }
  BOOL v6 = [(DADeviceStateRecord *)self time];
  [v6 doubleValue];
  double v8 = v7;
  v9 = [v5 time];
  [v9 doubleValue];
  double v11 = vabdd_f64(v8, v10);

  v12 = [NSNumber numberWithDouble:v11];

  return v12;
}

- (id)stateTransitionAsString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"DADeviceAccessAnalytics.m" lineNumber:76 description:@"Other state object is nil"];
  }
  BOOL v6 = NSString;
  double v7 = DADeviceStateToString([(DADeviceStateRecord *)self state]);
  double v8 = DADeviceStateToString([v5 state]);
  v9 = [v6 stringWithFormat:@"%@->%@", v7, v8];

  return v9;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSNumber)discoveryTime
{
  return self->_discoveryTime;
}

- (void)setDiscoveryTime:(id)a3
{
}

- (NSNumber)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);

  objc_storeStrong((id *)&self->_discoveryTime, 0);
}

@end
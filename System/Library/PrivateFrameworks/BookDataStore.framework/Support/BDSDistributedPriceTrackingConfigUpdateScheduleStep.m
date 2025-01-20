@interface BDSDistributedPriceTrackingConfigUpdateScheduleStep
+ (BOOL)supportsSecureCoding;
- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithCoder:(id)a3;
- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithDuration:(int64_t)a3 minUpdateInterval:(int64_t)a4 schedulerConfigIdealInterval:(int64_t)a5 schedulerConfigMinInterval:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStep:(id)a3;
- (int64_t)duration;
- (int64_t)minUpdateInterval;
- (int64_t)schedulerConfigIdealInterval;
- (int64_t)schedulerConfigMinInterval;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSDistributedPriceTrackingConfigUpdateScheduleStep

- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithDuration:(int64_t)a3 minUpdateInterval:(int64_t)a4 schedulerConfigIdealInterval:(int64_t)a5 schedulerConfigMinInterval:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)BDSDistributedPriceTrackingConfigUpdateScheduleStep;
  result = [(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)&v11 init];
  if (result)
  {
    result->_duration = a3;
    result->_minUpdateInterval = a4;
    result->_schedulerConfigIdealInterval = a5;
    result->_schedulerConfigMinInterval = a6;
  }
  return result;
}

- (unint64_t)hash
{
  int64_t v3 = [(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self duration];
  unint64_t v4 = [(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self minUpdateInterval] ^ v3;
  int64_t v5 = [(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self schedulerConfigIdealInterval];
  return v4 ^ v5 ^ [(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self schedulerConfigIdealInterval];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int64_t v5 = BUDynamicCast();

  LOBYTE(self) = [(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self isEqualToStep:v5];
  return (char)self;
}

- (BOOL)isEqualToStep:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4
    && (id v6 = [v4 duration],
        v6 == (id)[(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self duration])
    && (id v7 = [v5 minUpdateInterval],
        v7 == (id)[(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self minUpdateInterval])
    && (id v8 = [v5 schedulerConfigIdealInterval],
        v8 == (id)[(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self schedulerConfigIdealInterval]))
  {
    id v9 = [v5 schedulerConfigMinInterval];
    BOOL v10 = v9 == (id)[(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self schedulerConfigMinInterval];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSDistributedPriceTrackingConfigUpdateScheduleStep duration](self, "duration"), @"duration");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSDistributedPriceTrackingConfigUpdateScheduleStep minUpdateInterval](self, "minUpdateInterval"), @"minUpdateInterval");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSDistributedPriceTrackingConfigUpdateScheduleStep schedulerConfigIdealInterval](self, "schedulerConfigIdealInterval"), @"schedulerConfigIdealInterval");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSDistributedPriceTrackingConfigUpdateScheduleStep schedulerConfigMinInterval](self, "schedulerConfigMinInterval"), @"schedulerConfigMinInterval");
}

- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"duration"];
  id v6 = [v4 decodeIntegerForKey:@"minUpdateInterval"];
  id v7 = [v4 decodeIntegerForKey:@"schedulerConfigIdealInterval"];
  id v8 = [v4 decodeIntegerForKey:@"schedulerConfigMinInterval"];

  return [(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)self initWithDuration:v5 minUpdateInterval:v6 schedulerConfigIdealInterval:v7 schedulerConfigMinInterval:v8];
}

- (int64_t)duration
{
  return self->_duration;
}

- (int64_t)minUpdateInterval
{
  return self->_minUpdateInterval;
}

- (int64_t)schedulerConfigIdealInterval
{
  return self->_schedulerConfigIdealInterval;
}

- (int64_t)schedulerConfigMinInterval
{
  return self->_schedulerConfigMinInterval;
}

@end
@interface GEODataConditionalConnectionProperties
+ (BOOL)supportsSecureCoding;
- (GEODataConditionalConnectionProperties)initWithCoder:(id)a3;
- (GEODataConditionalConnectionProperties)initWithWorkload:(unint64_t)a3 timeWindowDuration:(double)a4;
- (GEODataConditionalConnectionProperties)initWithWorkload:(unint64_t)a3 timeWindowStartTime:(double)a4 timeWindowDuration:(double)a5;
- (double)timeWindowDuration;
- (double)timeWindowStartTime;
- (unint64_t)workLoad;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEODataConditionalConnectionProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEODataConditionalConnectionProperties)initWithWorkload:(unint64_t)a3 timeWindowStartTime:(double)a4 timeWindowDuration:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)GEODataConditionalConnectionProperties;
  result = [(GEODataConditionalConnectionProperties *)&v9 init];
  if (result)
  {
    result->_workLoad = a3;
    result->_timeWindowStartTime = a4;
    result->_timeWindowDuration = a5;
  }
  return result;
}

- (GEODataConditionalConnectionProperties)initWithWorkload:(unint64_t)a3 timeWindowDuration:(double)a4
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];

  return -[GEODataConditionalConnectionProperties initWithWorkload:timeWindowStartTime:timeWindowDuration:](self, "initWithWorkload:timeWindowStartTime:timeWindowDuration:", a3);
}

- (GEODataConditionalConnectionProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEODataConditionalConnectionProperties;
  v5 = [(GEODataConditionalConnectionProperties *)&v9 init];
  if (v5)
  {
    v5->_workLoad = [v4 decodeInt64ForKey:@"workload"];
    [v4 decodeDoubleForKey:@"startTime"];
    v5->_timeWindowStartTime = v6;
    [v4 decodeDoubleForKey:@"duration"];
    v5->_timeWindowDuration = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t workLoad = self->_workLoad;
  id v5 = a3;
  [v5 encodeInt64:workLoad forKey:@"workload"];
  [v5 encodeDouble:@"startTime" forKey:self->_timeWindowStartTime];
  [v5 encodeDouble:@"duration" forKey:self->_timeWindowDuration];
}

- (unint64_t)workLoad
{
  return self->_workLoad;
}

- (double)timeWindowStartTime
{
  return self->_timeWindowStartTime;
}

- (double)timeWindowDuration
{
  return self->_timeWindowDuration;
}

@end
@interface SPComplicationData
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (SPComplicationData)initWithCoder:(id)a3;
- (double)timeToLive;
- (void)encodeWithCoder:(id)a3;
- (void)setTimeToLive:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation SPComplicationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"_TimestampKey"];
  [v5 encodeDouble:@"_TimeToLiveKey" forKey:self->_timeToLive];
}

- (SPComplicationData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SPComplicationData *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_TimestampKey"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    [v4 decodeDoubleForKey:@"_TimeToLiveKey"];
    v5->_timeToLive = v8;
  }

  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)timeToLive
{
  return self->_timeToLive;
}

- (void)setTimeToLive:(double)a3
{
  self->_timeToLive = a3;
}

- (void).cxx_destruct
{
}

@end
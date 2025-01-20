@interface _HKDeepBreathingSessionConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)sessionConfigurationWithStartDate:(id)a3 sessionDuration:(double)a4 inhaleExhaleRatio:(double)a5 respirationsPerMinute:(double)a6;
- (NSDate)startDate;
- (_HKDeepBreathingSessionConfiguration)initWithCoder:(id)a3;
- (double)inhaleExhaleRatio;
- (double)respirationsPerMinute;
- (double)sessionDuration;
- (id)_initWithStartDate:(id)a3 sessionDuration:(double)a4 inhaleExhaleRatio:(double)a5 respirationsPerMinute:(double)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setInhaleExhaleRatio:(double)a3;
- (void)setRespirationsPerMinute:(double)a3;
- (void)setSessionDuration:(double)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _HKDeepBreathingSessionConfiguration

+ (id)sessionConfigurationWithStartDate:(id)a3 sessionDuration:(double)a4 inhaleExhaleRatio:(double)a5 respirationsPerMinute:(double)a6
{
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) _initWithStartDate:v10 sessionDuration:a4 inhaleExhaleRatio:a5 respirationsPerMinute:a6];

  return v11;
}

- (id)_initWithStartDate:(id)a3 sessionDuration:(double)a4 inhaleExhaleRatio:(double)a5 respirationsPerMinute:(double)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_HKDeepBreathingSessionConfiguration;
  v11 = [(_HKDeepBreathingSessionConfiguration *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    v11->_sessionDuration = a4;
    v11->_inhaleExhaleRatio = a5;
    v11->_respirationsPerMinute = a6;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  startDate = self->_startDate;
  v6 = [NSNumber numberWithDouble:self->_sessionDuration];
  v7 = [NSNumber numberWithDouble:self->_inhaleExhaleRatio];
  v8 = [NSNumber numberWithDouble:self->_respirationsPerMinute];
  v9 = [v3 stringWithFormat:@"<%@:%p, startDate:%@, sessionDuration:%@, inhaleExhaleRatio:%@, respirationsPerMinute:%@>", v4, self, startDate, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_HKDeepBreathingSessionConfiguration;
  uint64_t v4 = [(HKTaskConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDate *)self->_startDate copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[2] = *(void *)&self->_sessionDuration;
  v4[3] = *(void *)&self->_inhaleExhaleRatio;
  v4[4] = *(void *)&self->_respirationsPerMinute;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKDeepBreathingSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKDeepBreathingSessionConfiguration;
  uint64_t v5 = [(HKTaskConfiguration *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    [v4 decodeDoubleForKey:@"sessionDuration"];
    v5->_sessionDuration = v8;
    [v4 decodeDoubleForKey:@"inhaleExhaleRatio"];
    v5->_inhaleExhaleRatio = v9;
    [v4 decodeDoubleForKey:@"respirationsPerMinute"];
    v5->_respirationsPerMinute = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKDeepBreathingSessionConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, @"startDate", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"sessionDuration" forKey:self->_sessionDuration];
  [v4 encodeDouble:@"inhaleExhaleRatio" forKey:self->_inhaleExhaleRatio];
  [v4 encodeDouble:@"respirationsPerMinute" forKey:self->_respirationsPerMinute];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (double)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(double)a3
{
  self->_sessionDuration = a3;
}

- (double)inhaleExhaleRatio
{
  return self->_inhaleExhaleRatio;
}

- (void)setInhaleExhaleRatio:(double)a3
{
  self->_inhaleExhaleRatio = a3;
}

- (double)respirationsPerMinute
{
  return self->_respirationsPerMinute;
}

- (void)setRespirationsPerMinute:(double)a3
{
  self->_respirationsPerMinute = a3;
}

- (void).cxx_destruct
{
}

@end
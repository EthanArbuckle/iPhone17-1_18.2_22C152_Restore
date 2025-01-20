@interface STTimer
+ (BOOL)supportsSecureCoding;
- (NSDate)fireDate;
- (NSNumber)duration;
- (NSNumber)value;
- (NSString)label;
- (NSString)timerId;
- (STTimer)initWithCoder:(id)a3;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(id)a3;
- (void)setFireDate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTimerId:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation STTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_timerId, 0);
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setFireDate:(id)a3
{
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setTimerId:(id)a3
{
}

- (NSString)timerId
{
  return self->_timerId;
}

- (STTimer)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STTimer;
  v5 = [(STSiriModelObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TimerId"];
    timerId = v5->_timerId;
    v5->_timerId = (NSString *)v6;

    v5->_state = [v4 decodeIntegerForKey:@"State"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FireDate"];
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Duration"];
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Label"];
    label = v5->_label;
    v5->_label = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STTimer;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_timerId, @"TimerId", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_state forKey:@"State"];
  [v4 encodeObject:self->_value forKey:@"Value"];
  [v4 encodeObject:self->_fireDate forKey:@"FireDate"];
  [v4 encodeObject:self->_duration forKey:@"Duration"];
  [v4 encodeObject:self->_label forKey:@"Label"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface STAlarm
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isOverrideAlarm;
- (BOOL)isSleepAlarm;
- (NSString)label;
- (STAlarm)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bedtimeHour;
- (int64_t)bedtimeMinute;
- (int64_t)daysOfWeek;
- (int64_t)hourOfDay;
- (int64_t)minuteOfHour;
- (void)encodeWithCoder:(id)a3;
- (void)setBedtimeHour:(int64_t)a3;
- (void)setBedtimeMinute:(int64_t)a3;
- (void)setDaysOfWeek:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHourOfDay:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setMinuteOfHour:(int64_t)a3;
- (void)setOverrideAlarm:(BOOL)a3;
- (void)setSleepAlarm:(BOOL)a3;
@end

@implementation STAlarm

- (void).cxx_destruct
{
}

- (void)setBedtimeMinute:(int64_t)a3
{
  self->_bedtimeMinute = a3;
}

- (int64_t)bedtimeMinute
{
  return self->_bedtimeMinute;
}

- (void)setBedtimeHour:(int64_t)a3
{
  self->_bedtimeHour = a3;
}

- (int64_t)bedtimeHour
{
  return self->_bedtimeHour;
}

- (void)setOverrideAlarm:(BOOL)a3
{
  self->_overrideAlarm = a3;
}

- (BOOL)isOverrideAlarm
{
  return self->_overrideAlarm;
}

- (void)setSleepAlarm:(BOOL)a3
{
  self->_sleepAlarm = a3;
}

- (BOOL)isSleepAlarm
{
  return self->_sleepAlarm;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setMinuteOfHour:(int64_t)a3
{
  self->_minuteOfHour = a3;
}

- (int64_t)minuteOfHour
{
  return self->_minuteOfHour;
}

- (void)setHourOfDay:(int64_t)a3
{
  self->_hourOfDay = a3;
}

- (int64_t)hourOfDay
{
  return self->_hourOfDay;
}

- (void)setDaysOfWeek:(int64_t)a3
{
  self->_daysOfWeek = a3;
}

- (int64_t)daysOfWeek
{
  return self->_daysOfWeek;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (STAlarm)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAlarm;
  v5 = [(STSiriModelObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"_enabled"];
    v5->_daysOfWeek = [v4 decodeIntegerForKey:@"_daysOfWeek"];
    v5->_hourOfDay = [v4 decodeIntegerForKey:@"_hourOfDay"];
    v5->_minuteOfHour = [v4 decodeIntegerForKey:@"_minuteOfHour"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_sleepAlarm = [v4 decodeBoolForKey:@"_sleepAlarm"];
    v5->_overrideAlarm = [v4 decodeBoolForKey:@"_overrideAlarm"];
    v5->_bedtimeHour = [v4 decodeIntegerForKey:@"_bedtimeHour"];
    v5->_bedtimeMinute = [v4 decodeIntegerForKey:@"_bedtimeMinute"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STAlarm;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_enabled, @"_enabled", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_daysOfWeek forKey:@"_daysOfWeek"];
  [v4 encodeInteger:self->_hourOfDay forKey:@"_hourOfDay"];
  [v4 encodeInteger:self->_minuteOfHour forKey:@"_minuteOfHour"];
  [v4 encodeObject:self->_label forKey:@"_label"];
  [v4 encodeBool:self->_sleepAlarm forKey:@"_sleepAlarm"];
  [v4 encodeBool:self->_overrideAlarm forKey:@"_overrideAlarm"];
  [v4 encodeInteger:self->_bedtimeHour forKey:@"_bedtimeHour"];
  [v4 encodeInteger:self->_bedtimeMinute forKey:@"_bedtimeMinute"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objc_super v5 = [(STSiriModelObject *)self identifier];
  [v4 setIdentifier:v5];

  objc_msgSend(v4, "setEnabled:", -[STAlarm isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setDaysOfWeek:", -[STAlarm daysOfWeek](self, "daysOfWeek"));
  objc_msgSend(v4, "setHourOfDay:", -[STAlarm hourOfDay](self, "hourOfDay"));
  objc_msgSend(v4, "setMinuteOfHour:", -[STAlarm minuteOfHour](self, "minuteOfHour"));
  uint64_t v6 = [(STAlarm *)self label];
  [v4 setLabel:v6];

  objc_msgSend(v4, "setSleepAlarm:", -[STAlarm isSleepAlarm](self, "isSleepAlarm"));
  objc_msgSend(v4, "setOverrideAlarm:", -[STAlarm isOverrideAlarm](self, "isOverrideAlarm"));
  objc_msgSend(v4, "setBedtimeHour:", -[STAlarm bedtimeHour](self, "bedtimeHour"));
  objc_msgSend(v4, "setBedtimeMinute:", -[STAlarm bedtimeMinute](self, "bedtimeMinute"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
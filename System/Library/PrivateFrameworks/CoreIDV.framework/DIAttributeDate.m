@interface DIAttributeDate
+ (BOOL)supportsSecureCoding;
- (BOOL)requireDay;
- (BOOL)requireMonth;
- (BOOL)requireYear;
- (DIAttributeDate)init;
- (DIAttributeDate)initWithCoder:(id)a3;
- (NSDate)defaultValue;
- (NSDate)getCurrentValue;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setRequireDay:(BOOL)a3;
- (void)setRequireMonth:(BOOL)a3;
- (void)setRequireYear:(BOOL)a3;
@end

@implementation DIAttributeDate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeDate;
  id v4 = a3;
  [(DIAttribute *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeBool:forKey:", self->_requireDay, @"requireDay", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_requireMonth forKey:@"requireMonth"];
  [v4 encodeBool:self->_requireYear forKey:@"requireYear"];

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeDate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DIAttributeDate;
  objc_super v5 = [(DIAttribute *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_requireDay = [v4 decodeBoolForKey:@"requireDay"];
    v5->_requireMonth = [v4 decodeBoolForKey:@"requireMonth"];
    v5->_requireYear = [v4 decodeBoolForKey:@"requireYear"];
  }

  return v5;
}

- (DIAttributeDate)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeDate;
  v2 = [(DIAttribute *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(DIAttribute *)v2 setAttributeType:2];
    v3->_requireDay = 1;
    v3->_requireMonth = 1;
    v3->_requireYear = 1;
  }
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDate;
  [(DIAttribute *)&v3 setCurrentValue:a3];
}

- (void)setDefaultValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDate;
  [(DIAttribute *)&v3 setDefaultValue:a3];
}

- (void)setRequireDay:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_requireDay = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRequireMonth:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_requireMonth = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRequireYear:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_requireYear = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSDate)getCurrentValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeDate;
  v2 = [(DIAttribute *)&v4 getCurrentValue];
  return (NSDate *)v2;
}

- (NSDate)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeDate;
  v2 = [(DIAttribute *)&v4 defaultValue];
  return (NSDate *)v2;
}

- (BOOL)requireDay
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_requireDay;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)requireMonth
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_requireMonth;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)requireYear
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_requireYear;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:&stru_26C5761E0];
  v11.receiver = self;
  v11.super_class = (Class)DIAttributeDate;
  objc_super v4 = [(DIAttribute *)&v11 description];
  [v3 appendFormat:@"%@", v4];

  os_unfair_lock_lock(&self->super._lock);
  if (self->_requireDay) {
    objc_super v5 = @"YES";
  }
  else {
    objc_super v5 = @"NO";
  }
  [v3 appendFormat:@"requireDay: '%@'; ", v5];
  if (self->_requireMonth) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@"requireMonth: '%@'; ", v6];
  if (self->_requireYear) {
    objc_super v7 = @"YES";
  }
  else {
    objc_super v7 = @"NO";
  }
  [v3 appendFormat:@"requireYear: '%@'; ", v7];
  os_unfair_lock_unlock(&self->super._lock);
  v8 = [(DIAttributeDate *)self defaultValue];
  [v3 appendFormat:@"defaultValue: '%@'; ", v8];

  v9 = [(DIAttributeDate *)self getCurrentValue];
  [v3 appendFormat:@"currentValue: '%@'; ", v9];

  [v3 appendFormat:@">"];
  return v3;
}

@end
@interface DIAttributeSMSOTP
+ (BOOL)supportsSecureCoding;
- (DIAttributeSMSOTP)init;
- (DIAttributeSMSOTP)initWithCoder:(id)a3;
- (id)defaultValue;
- (id)description;
- (id)getCurrentValue;
- (id)submissionString;
- (unint64_t)validityInSeconds;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setValidityInSeconds:(unint64_t)a3;
@end

@implementation DIAttributeSMSOTP

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeSMSOTP;
  id v4 = a3;
  [(DIAttributeText *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_validityInSeconds), @"validityInSeconds", v5.receiver, v5.super_class);
}

- (DIAttributeSMSOTP)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DIAttributeSMSOTP;
  objc_super v5 = [(DIAttributeText *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_validityInSeconds = [v4 decodeIntegerForKey:@"validityInSeconds"];
  }

  return v5;
}

- (DIAttributeSMSOTP)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeSMSOTP;
  v2 = [(DIAttributeText *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DIAttribute *)v2 setAttributeType:8];
  }
  return v3;
}

- (id)submissionString
{
  v6.receiver = self;
  v6.super_class = (Class)DIAttributeSMSOTP;
  v2 = [(DIAttributeText *)&v6 submissionString];
  v3 = v2;
  if (v2 && ([v2 isEqualToString:&stru_26C5761E0] & 1) != 0) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

- (void)setCurrentValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeSMSOTP;
  [(DIAttributeText *)&v3 setCurrentValue:a3];
}

- (void)setDefaultValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeSMSOTP;
  [(DIAttributeText *)&v3 setDefaultValue:a3];
}

- (void)setValidityInSeconds:(unint64_t)a3
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  self->_validityInSeconds = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)getCurrentValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeSMSOTP;
  v2 = [(DIAttributeText *)&v4 getCurrentValue];
  return v2;
}

- (id)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeSMSOTP;
  v2 = [(DIAttributeText *)&v4 defaultValue];
  return v2;
}

- (unint64_t)validityInSeconds
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  unint64_t validityInSeconds = self->_validityInSeconds;
  os_unfair_lock_unlock(p_lock);
  return validityInSeconds;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v6.receiver = self;
  v6.super_class = (Class)DIAttributeSMSOTP;
  objc_super v4 = [(DIAttributeText *)&v6 description];
  [v3 appendFormat:@"%@", v4];

  os_unfair_lock_lock(&self->super.super._lock);
  objc_msgSend(v3, "appendFormat:", @"validityInSeconds: '%lu'; ", self->_validityInSeconds);
  os_unfair_lock_unlock(&self->super.super._lock);
  [v3 appendFormat:@">"];
  return v3;
}

@end
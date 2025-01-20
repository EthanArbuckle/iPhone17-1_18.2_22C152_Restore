@interface DNDBehaviorSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDBehaviorSettings)init;
- (DNDBehaviorSettings)initWithCoder:(id)a3;
- (id)_initWithInterruptionBehaviorSetting:(unint64_t)a3;
- (id)_initWithSettings:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)interruptionBehaviorSetting;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDBehaviorSettings

- (DNDBehaviorSettings)init
{
  return (DNDBehaviorSettings *)[(DNDBehaviorSettings *)self _initWithSettings:0];
}

- (id)_initWithSettings:(id)a3
{
  uint64_t v4 = [a3 interruptionBehaviorSetting];
  return [(DNDBehaviorSettings *)self _initWithInterruptionBehaviorSetting:v4];
}

- (id)_initWithInterruptionBehaviorSetting:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DNDBehaviorSettings;
  id result = [(DNDBehaviorSettings *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDBehaviorSettings *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unint64_t v6 = [(DNDBehaviorSettings *)self interruptionBehaviorSetting];
      uint64_t v7 = [(DNDBehaviorSettings *)v5 interruptionBehaviorSetting];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = DNDStringFromInterruptionBehaviorSetting([(DNDBehaviorSettings *)self interruptionBehaviorSetting]);
  unint64_t v6 = [v3 stringWithFormat:@"<%@: %p; interruptionBehaviorSetting: %@>", v4, self, v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDMutableBehaviorSettings alloc];
  return [(DNDBehaviorSettings *)v4 _initWithSettings:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDBehaviorSettings)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"interruptionBehaviorSetting"];
  return (DNDBehaviorSettings *)[(DNDBehaviorSettings *)self _initWithInterruptionBehaviorSetting:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDBehaviorSettings interruptionBehaviorSetting](self, "interruptionBehaviorSetting"), @"interruptionBehaviorSetting");
}

- (unint64_t)interruptionBehaviorSetting
{
  return self->_interruptionBehaviorSetting;
}

@end
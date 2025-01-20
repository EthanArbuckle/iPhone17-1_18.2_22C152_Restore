@interface DNDModeConfigurationTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSecureData;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (DNDModeConfigurationTrigger)init;
- (DNDModeConfigurationTrigger)initWithCoder:(id)a3;
- (DNDModeConfigurationTrigger)initWithEnabledSetting:(unint64_t)a3;
- (id)description;
- (int64_t)compatibilityVersion;
- (unint64_t)enabledSetting;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeConfigurationTrigger

- (DNDModeConfigurationTrigger)init
{
  return [(DNDModeConfigurationTrigger *)self initWithEnabledSetting:0];
}

- (DNDModeConfigurationTrigger)initWithEnabledSetting:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DNDModeConfigurationTrigger;
  result = [(DNDModeConfigurationTrigger *)&v5 init];
  if (result) {
    result->_enabledSetting = a3;
  }
  return result;
}

- (BOOL)isEnabled
{
  return self->_enabledSetting != 1;
}

- (BOOL)hasSecureData
{
  return 0;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:self->_enabledSetting];
  uint64_t v4 = [v3 hash];
  objc_super v5 = [NSNumber numberWithInteger:self->_compatibilityVersion];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDModeConfigurationTrigger *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unint64_t v6 = [(DNDModeConfigurationTrigger *)self enabledSetting];
      uint64_t v7 = [(DNDModeConfigurationTrigger *)v5 enabledSetting];
      int64_t v8 = [(DNDModeConfigurationTrigger *)self compatibilityVersion];
      uint64_t v9 = [(DNDModeConfigurationTrigger *)v5 compatibilityVersion];

      BOOL v11 = v6 == v7 && v8 == v9;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDModeConfigurationTrigger *)self enabledSetting];
  unint64_t v6 = DNDEnabledSettingToString([(DNDModeConfigurationTrigger *)self enabledSetting]);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDModeConfigurationTrigger compatibilityVersion](self, "compatibilityVersion"));
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; enabledSetting: %llu (%@); compatibilityVersion: %@>",
    v4,
    self,
    v5,
    v6,
  int64_t v8 = v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfigurationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_enabledSetting = [v4 decodeIntegerForKey:@"enabledSetting"];
  int64_t v5 = [v4 decodeIntegerForKey:@"compatibilityVersion"];

  self->_compatibilityVersion = v5;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfigurationTrigger enabledSetting](self, "enabledSetting"), @"enabledSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfigurationTrigger compatibilityVersion](self, "compatibilityVersion"), @"compatibilityVersion");
}

- (unint64_t)enabledSetting
{
  return self->_enabledSetting;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

@end
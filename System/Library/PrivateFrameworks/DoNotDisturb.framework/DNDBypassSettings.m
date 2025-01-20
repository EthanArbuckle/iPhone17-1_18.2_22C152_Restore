@interface DNDBypassSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDBypassSettings)init;
- (DNDBypassSettings)initWithCoder:(id)a3;
- (NSString)immediateBypassCNGroupIdentifier;
- (id)_initWithImmediateBypassEventSourceType:(unint64_t)a3 immediateBypassCNGroupIdentifier:(id)a4 repeatEventSourceBehaviorEnabledSetting:(unint64_t)a5;
- (id)_initWithSettings:(id)a3;
- (id)description;
- (id)diffDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)immediateBypassEventSourceType;
- (unint64_t)repeatEventSourceBehaviorEnabledSetting;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDBypassSettings

- (DNDBypassSettings)init
{
  return (DNDBypassSettings *)[(DNDBypassSettings *)self _initWithSettings:0];
}

- (id)_initWithSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 immediateBypassEventSourceType];
  v6 = [v4 immediateBypassCNGroupIdentifier];
  uint64_t v7 = [v4 repeatEventSourceBehaviorEnabledSetting];

  id v8 = [(DNDBypassSettings *)self _initWithImmediateBypassEventSourceType:v5 immediateBypassCNGroupIdentifier:v6 repeatEventSourceBehaviorEnabledSetting:v7];
  return v8;
}

- (id)_initWithImmediateBypassEventSourceType:(unint64_t)a3 immediateBypassCNGroupIdentifier:(id)a4 repeatEventSourceBehaviorEnabledSetting:(unint64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDBypassSettings;
  v9 = [(DNDBypassSettings *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_immediateBypassEventSourceType = a3;
    uint64_t v11 = [v8 copy];
    immediateBypassCNGroupIdentifier = v10->_immediateBypassCNGroupIdentifier;
    v10->_immediateBypassCNGroupIdentifier = (NSString *)v11;

    v10->_repeatEventSourceBehaviorEnabledSetting = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDBypassSettings *)self immediateBypassEventSourceType];
  id v4 = [(DNDBypassSettings *)self immediateBypassCNGroupIdentifier];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(DNDBypassSettings *)self repeatEventSourceBehaviorEnabledSetting];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = (DNDBypassSettings *)a3;
  if (self == v8)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v8;
      unint64_t v10 = [(DNDBypassSettings *)self immediateBypassEventSourceType];
      if (v10 != [(DNDBypassSettings *)v9 immediateBypassEventSourceType])
      {
        BOOL v15 = 0;
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v11 = [(DNDBypassSettings *)self immediateBypassCNGroupIdentifier];
      v12 = [(DNDBypassSettings *)v9 immediateBypassCNGroupIdentifier];
      if (v11 != v12)
      {
        uint64_t v13 = [(DNDBypassSettings *)self immediateBypassCNGroupIdentifier];
        if (!v13)
        {
          BOOL v15 = 0;
          goto LABEL_17;
        }
        unint64_t v3 = (void *)v13;
        uint64_t v14 = [(DNDBypassSettings *)v9 immediateBypassCNGroupIdentifier];
        if (!v14)
        {
          BOOL v15 = 0;
          goto LABEL_16;
        }
        id v4 = (void *)v14;
        uint64_t v5 = [(DNDBypassSettings *)self immediateBypassCNGroupIdentifier];
        unint64_t v6 = [(DNDBypassSettings *)v9 immediateBypassCNGroupIdentifier];
        if (![v5 isEqual:v6])
        {
          BOOL v15 = 0;
LABEL_13:

LABEL_16:
          goto LABEL_17;
        }
      }
      unint64_t v16 = [(DNDBypassSettings *)self repeatEventSourceBehaviorEnabledSetting];
      BOOL v15 = v16 == [(DNDBypassSettings *)v9 repeatEventSourceBehaviorEnabledSetting];
      if (v11 != v12) {
        goto LABEL_13;
      }
LABEL_17:

      goto LABEL_18;
    }
    BOOL v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = DNDEventSourceTypeToString([(DNDBypassSettings *)self immediateBypassEventSourceType]);
  unint64_t v6 = [(DNDBypassSettings *)self immediateBypassCNGroupIdentifier];
  uint64_t v7 = DNDEnabledSettingToString([(DNDBypassSettings *)self repeatEventSourceBehaviorEnabledSetting]);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; immediateBypassEventSourceType: %@; immediateBypassCNGroupIdentifier: '%@'; repeatEventSourceBehaviorEnabledSetting: %@>",
    v4,
    self,
    v5,
    v6,
  id v8 = v7);

  return v8;
}

- (id)diffDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = DNDEventSourceTypeToString([(DNDBypassSettings *)self immediateBypassEventSourceType]);
  uint64_t v5 = [(DNDBypassSettings *)self immediateBypassCNGroupIdentifier];
  unint64_t v6 = DNDEnabledSettingToString([(DNDBypassSettings *)self repeatEventSourceBehaviorEnabledSetting]);
  objc_msgSend(v3, "stringWithFormat:", @"immediateBypassEventSourceType:%@;immediateBypassCNGroupIdentifier:%@;repeatEventSourceBehaviorEnabledSetting:%@",
    v4,
    v5,
  uint64_t v7 = v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDMutableBypassSettings alloc];
  return [(DNDBypassSettings *)v4 _initWithSettings:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDBypassSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"immediateBypassEventSourceType"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"immediateBypassCNGroupIdentifier"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"repeatEventSourceBehaviorEnabledSetting"];

  id v8 = [(DNDBypassSettings *)self _initWithImmediateBypassEventSourceType:v5 immediateBypassCNGroupIdentifier:v6 repeatEventSourceBehaviorEnabledSetting:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDBypassSettings immediateBypassEventSourceType](self, "immediateBypassEventSourceType"), @"immediateBypassEventSourceType");
  id v4 = [(DNDBypassSettings *)self immediateBypassCNGroupIdentifier];
  [v5 encodeObject:v4 forKey:@"immediateBypassCNGroupIdentifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDBypassSettings repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting"), @"repeatEventSourceBehaviorEnabledSetting");
}

- (unint64_t)immediateBypassEventSourceType
{
  return self->_immediateBypassEventSourceType;
}

- (NSString)immediateBypassCNGroupIdentifier
{
  return self->_immediateBypassCNGroupIdentifier;
}

- (unint64_t)repeatEventSourceBehaviorEnabledSetting
{
  return self->_repeatEventSourceBehaviorEnabledSetting;
}

- (void).cxx_destruct
{
}

@end
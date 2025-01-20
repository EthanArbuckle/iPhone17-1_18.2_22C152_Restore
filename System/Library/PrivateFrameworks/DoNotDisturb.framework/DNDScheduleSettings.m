@interface DNDScheduleSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDScheduleSettings)init;
- (DNDScheduleSettings)initWithCoder:(id)a3;
- (DNDScheduleSettings)initWithScheduleEnabledSetting:(unint64_t)a3 timePeriod:(id)a4 bedtimeBehaviorEnabledSetting:(unint64_t)a5;
- (DNDScheduleTimePeriod)timePeriod;
- (id)_initWithSettings:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)bedtimeBehaviorEnabledSetting;
- (unint64_t)hash;
- (unint64_t)scheduleEnabledSetting;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDScheduleSettings

- (DNDScheduleSettings)init
{
  return (DNDScheduleSettings *)[(DNDScheduleSettings *)self _initWithSettings:0];
}

- (id)_initWithSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 scheduleEnabledSetting];
  v6 = [v4 timePeriod];
  uint64_t v7 = [v4 bedtimeBehaviorEnabledSetting];

  v8 = [(DNDScheduleSettings *)self initWithScheduleEnabledSetting:v5 timePeriod:v6 bedtimeBehaviorEnabledSetting:v7];
  return v8;
}

- (DNDScheduleSettings)initWithScheduleEnabledSetting:(unint64_t)a3 timePeriod:(id)a4 bedtimeBehaviorEnabledSetting:(unint64_t)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDScheduleSettings;
  v9 = [(DNDScheduleSettings *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_scheduleEnabledSetting = a3;
    v11 = (void *)[v8 copy];
    v12 = v11;
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = objc_alloc_init(DNDScheduleTimePeriod);
    }
    timePeriod = v10->_timePeriod;
    v10->_timePeriod = v13;

    v10->_bedtimeBehaviorEnabledSetting = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDScheduleSettings *)self scheduleEnabledSetting];
  id v4 = [(DNDScheduleSettings *)self timePeriod];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(DNDScheduleSettings *)self bedtimeBehaviorEnabledSetting];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = (DNDScheduleSettings *)a3;
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
      unint64_t v10 = [(DNDScheduleSettings *)self scheduleEnabledSetting];
      if (v10 != [(DNDScheduleSettings *)v9 scheduleEnabledSetting])
      {
        BOOL v15 = 0;
LABEL_18:

        goto LABEL_19;
      }
      v11 = [(DNDScheduleSettings *)self timePeriod];
      v12 = [(DNDScheduleSettings *)v9 timePeriod];
      if (v11 != v12)
      {
        uint64_t v13 = [(DNDScheduleSettings *)self timePeriod];
        if (!v13)
        {
          BOOL v15 = 0;
          goto LABEL_17;
        }
        unint64_t v3 = (void *)v13;
        uint64_t v14 = [(DNDScheduleSettings *)v9 timePeriod];
        if (!v14)
        {
          BOOL v15 = 0;
          goto LABEL_16;
        }
        id v4 = (void *)v14;
        uint64_t v5 = [(DNDScheduleSettings *)self timePeriod];
        unint64_t v6 = [(DNDScheduleSettings *)v9 timePeriod];
        if (![v5 isEqual:v6])
        {
          BOOL v15 = 0;
LABEL_13:

LABEL_16:
          goto LABEL_17;
        }
      }
      unint64_t v16 = [(DNDScheduleSettings *)self bedtimeBehaviorEnabledSetting];
      BOOL v15 = v16 == [(DNDScheduleSettings *)v9 bedtimeBehaviorEnabledSetting];
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
  id v4 = DNDEnabledSettingToString([(DNDScheduleSettings *)self scheduleEnabledSetting]);
  uint64_t v5 = [(DNDScheduleSettings *)self timePeriod];
  unint64_t v6 = DNDEnabledSettingToString([(DNDScheduleSettings *)self bedtimeBehaviorEnabledSetting]);
  uint64_t v7 = [v3 stringWithFormat:@"<schedule: enabled: %@; period: %@; bedtime: %@>", v4, v5, v6];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [DNDMutableScheduleSettings alloc];
  return [(DNDScheduleSettings *)v4 _initWithSettings:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDScheduleSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"scheduleEnabledSetting"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timePeriod"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"bedtimeBehaviorEnabledSetting"];

  id v8 = [(DNDScheduleSettings *)self initWithScheduleEnabledSetting:v5 timePeriod:v6 bedtimeBehaviorEnabledSetting:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting"), @"scheduleEnabledSetting");
  id v4 = [(DNDScheduleSettings *)self timePeriod];
  [v5 encodeObject:v4 forKey:@"timePeriod"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting"), @"bedtimeBehaviorEnabledSetting");
}

- (unint64_t)scheduleEnabledSetting
{
  return self->_scheduleEnabledSetting;
}

- (DNDScheduleTimePeriod)timePeriod
{
  return self->_timePeriod;
}

- (unint64_t)bedtimeBehaviorEnabledSetting
{
  return self->_bedtimeBehaviorEnabledSetting;
}

- (void).cxx_destruct
{
}

@end
@interface DNDSScheduleSettings
+ (BOOL)supportsSecureCoding;
+ (id)defaultScheduleSettings;
+ (id)settingsForRecord:(id)a3;
+ (id)settingsWithClientSettings:(id)a3 creationDate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (DNDSScheduleSettings)initWithScheduleEnabledSetting:(unint64_t)a3 timePeriod:(id)a4 bedtimeBehaviorEnabledSetting:(unint64_t)a5 creationDate:(id)a6;
- (NSDate)creationDate;
- (id)description;
- (id)makeRecord;
- (id)replacementObjectForCoder:(id)a3;
- (unint64_t)hash;
@end

@implementation DNDSScheduleSettings

+ (id)defaultScheduleSettings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F5F740]);
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = +[DNDSScheduleSettings settingsWithClientSettings:v2 creationDate:v3];

  return v4;
}

+ (id)settingsWithClientSettings:(id)a3 creationDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = [v7 scheduleEnabledSetting];
  v10 = [v7 timePeriod];
  uint64_t v11 = [v7 bedtimeBehaviorEnabledSetting];

  v12 = (void *)[v8 initWithScheduleEnabledSetting:v9 timePeriod:v10 bedtimeBehaviorEnabledSetting:v11 creationDate:v6];
  return v12;
}

- (DNDSScheduleSettings)initWithScheduleEnabledSetting:(unint64_t)a3 timePeriod:(id)a4 bedtimeBehaviorEnabledSetting:(unint64_t)a5 creationDate:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)DNDSScheduleSettings;
  uint64_t v11 = [(DNDScheduleSettings *)&v15 initWithScheduleEnabledSetting:a3 timePeriod:a4 bedtimeBehaviorEnabledSetting:a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v12;
  }
  return v11;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)DNDSScheduleSettings;
  unint64_t v3 = [(DNDScheduleSettings *)&v7 hash];
  v4 = [(DNDSScheduleSettings *)self creationDate];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDSScheduleSettings *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)DNDSScheduleSettings;
      if ([(DNDScheduleSettings *)&v14 isEqual:v5])
      {
        id v6 = [(DNDSScheduleSettings *)self creationDate];
        objc_super v7 = [(DNDSScheduleSettings *)v5 creationDate];
        if (v6 == v7)
        {
          char v12 = 1;
        }
        else
        {
          id v8 = [(DNDSScheduleSettings *)self creationDate];
          if (v8)
          {
            uint64_t v9 = [(DNDSScheduleSettings *)v5 creationDate];
            if (v9)
            {
              id v10 = [(DNDSScheduleSettings *)self creationDate];
              uint64_t v11 = [(DNDSScheduleSettings *)v5 creationDate];
              char v12 = [v10 isEqual:v11];
            }
            else
            {
              char v12 = 0;
            }
          }
          else
          {
            char v12 = 0;
          }
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  [(DNDScheduleSettings *)self scheduleEnabledSetting];
  v4 = DNDEnabledSettingToString();
  unint64_t v5 = [(DNDScheduleSettings *)self timePeriod];
  [(DNDScheduleSettings *)self bedtimeBehaviorEnabledSetting];
  id v6 = DNDEnabledSettingToString();
  objc_super v7 = [(DNDSScheduleSettings *)self creationDate];
  id v8 = [v3 stringWithFormat:@"<schedule: enabled: %@; %@; bedtime: %@; creation: %@>", v4, v5, v6, v7];

  return v8;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F5F740]);
  unint64_t v5 = [(DNDScheduleSettings *)self scheduleEnabledSetting];
  id v6 = [(DNDScheduleSettings *)self timePeriod];
  objc_super v7 = objc_msgSend(v4, "initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:", v5, v6, -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting"));

  return v7;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
}

+ (id)settingsForRecord:(id)a3
{
  unint64_t v3 = (objc_class *)MEMORY[0x1E4F5F720];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 timePeriodStartTimeHour];
  objc_msgSend(v5, "setHour:", objc_msgSend(v6, "unsignedIntegerValue"));

  objc_super v7 = [v4 timePeriodStartTimeMinute];
  objc_msgSend(v5, "setMinute:", objc_msgSend(v7, "unsignedIntegerValue"));

  id v8 = objc_alloc_init(MEMORY[0x1E4F5F720]);
  uint64_t v9 = [v4 timePeriodEndTimeHour];
  objc_msgSend(v8, "setHour:", objc_msgSend(v9, "unsignedIntegerValue"));

  id v10 = [v4 timePeriodEndTimeMinute];
  objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "unsignedIntegerValue"));

  uint64_t v11 = [v4 timePeriodWeekdays];
  uint64_t v12 = [v11 integerValue];

  id v13 = objc_alloc_init(MEMORY[0x1E4F5F728]);
  [v13 setStartTime:v5];
  [v13 setEndTime:v8];
  [v13 setWeekdays:v12];
  objc_super v14 = [v4 scheduleEnabledSetting];
  uint64_t v15 = [v14 unsignedIntegerValue];

  v16 = [v4 bedtimeBehaviorEnabledSetting];
  uint64_t v17 = [v16 unsignedIntegerValue];

  v18 = (void *)MEMORY[0x1E4F1C9C8];
  v19 = [v4 lastUpdatedTimestamp];

  [v19 doubleValue];
  v20 = objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");

  v21 = [[DNDSScheduleSettings alloc] initWithScheduleEnabledSetting:v15 timePeriod:v13 bedtimeBehaviorEnabledSetting:v17 creationDate:v20];
  return v21;
}

- (id)makeRecord
{
  unint64_t v3 = objc_alloc_init(DNDSMutableScheduleSettingsRecord);
  id v4 = NSNumber;
  id v5 = [(DNDSScheduleSettings *)self creationDate];
  [v5 timeIntervalSinceReferenceDate];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  [(DNDSMutableScheduleSettingsRecord *)v3 setLastUpdatedTimestamp:v6];

  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting"));
  [(DNDSMutableScheduleSettingsRecord *)v3 setScheduleEnabledSetting:v7];

  id v8 = [(DNDScheduleSettings *)self timePeriod];
  uint64_t v9 = [v8 weekdays];
  id v10 = [NSNumber numberWithUnsignedInteger:v9];
  [(DNDSMutableScheduleSettingsRecord *)v3 setTimePeriodWeekdays:v10];

  uint64_t v11 = [v8 startTime];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "hour"));
  [(DNDSMutableScheduleSettingsRecord *)v3 setTimePeriodStartTimeHour:v12];

  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "minute"));
  [(DNDSMutableScheduleSettingsRecord *)v3 setTimePeriodStartTimeMinute:v13];

  objc_super v14 = [v8 endTime];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "hour"));
  [(DNDSMutableScheduleSettingsRecord *)v3 setTimePeriodEndTimeHour:v15];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "minute"));
  [(DNDSMutableScheduleSettingsRecord *)v3 setTimePeriodEndTimeMinute:v16];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting"));
  [(DNDSMutableScheduleSettingsRecord *)v3 setBedtimeBehaviorEnabledSetting:v17];

  return v3;
}

@end
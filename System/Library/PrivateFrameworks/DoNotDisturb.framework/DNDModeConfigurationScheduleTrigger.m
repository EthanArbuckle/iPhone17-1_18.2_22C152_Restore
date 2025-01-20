@interface DNDModeConfigurationScheduleTrigger
+ (BOOL)supportsSecureCoding;
+ (id)defaultScheduleTrigger;
+ (id)triggerWithClientTrigger:(id)a3 creationDate:(id)a4;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (DNDModeConfigurationScheduleTrigger)initWithCoder:(id)a3;
- (DNDModeConfigurationScheduleTrigger)initWithTimePeriod:(id)a3 creationDate:(id)a4 enabledSetting:(unint64_t)a5;
- (DNDModeConfigurationScheduleTrigger)initWithTimePeriod:(id)a3 enabledSetting:(unint64_t)a4;
- (DNDScheduleTimePeriod)timePeriod;
- (NSDate)creationDate;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeConfigurationScheduleTrigger

+ (id)defaultScheduleTrigger
{
  v2 = [DNDModeConfigurationScheduleTrigger alloc];
  v3 = objc_alloc_init(DNDScheduleTimePeriod);
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(DNDModeConfigurationScheduleTrigger *)v2 initWithTimePeriod:v3 creationDate:v4 enabledSetting:0];

  return v5;
}

+ (id)triggerWithClientTrigger:(id)a3 creationDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [DNDModeConfigurationScheduleTrigger alloc];
  v8 = [v6 timePeriod];
  uint64_t v9 = [v6 enabledSetting];

  v10 = [(DNDModeConfigurationScheduleTrigger *)v7 initWithTimePeriod:v8 creationDate:v5 enabledSetting:v9];
  return v10;
}

- (DNDModeConfigurationScheduleTrigger)initWithTimePeriod:(id)a3 enabledSetting:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  v8 = [v6 date];
  uint64_t v9 = [(DNDModeConfigurationScheduleTrigger *)self initWithTimePeriod:v7 creationDate:v8 enabledSetting:a4];

  return v9;
}

- (DNDModeConfigurationScheduleTrigger)initWithTimePeriod:(id)a3 creationDate:(id)a4 enabledSetting:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDModeConfigurationScheduleTrigger;
  v10 = [(DNDModeConfigurationTrigger *)&v16 initWithEnabledSetting:a5];
  if (v10)
  {
    v11 = (DNDScheduleTimePeriod *)[v8 copy];
    v12 = v11;
    if (!v11) {
      v12 = objc_alloc_init(DNDScheduleTimePeriod);
    }
    objc_storeStrong((id *)&v10->_timePeriod, v12);
    if (!v11) {

    }
    uint64_t v13 = [v9 copy];
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v13;
  }
  return v10;
}

- (BOOL)isEnabled
{
  return [(DNDModeConfigurationTrigger *)self enabledSetting] == 2;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)DNDModeConfigurationScheduleTrigger;
  unint64_t v3 = [(DNDModeConfigurationTrigger *)&v6 hash];
  unint64_t v4 = [(DNDScheduleTimePeriod *)self->_timePeriod hash] ^ v3;
  return v4 ^ [(NSDate *)self->_creationDate hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (DNDModeConfigurationScheduleTrigger *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v27.receiver = self;
      v27.super_class = (Class)DNDModeConfigurationScheduleTrigger;
      if (![(DNDModeConfigurationTrigger *)&v27 isEqual:v5])
      {
        char v13 = 0;
LABEL_27:

        goto LABEL_28;
      }
      objc_super v6 = [(DNDModeConfigurationScheduleTrigger *)self timePeriod];
      id v7 = [(DNDModeConfigurationScheduleTrigger *)v5 timePeriod];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDModeConfigurationScheduleTrigger *)self timePeriod];
        if (!v8)
        {
          char v13 = 0;
LABEL_26:

          goto LABEL_27;
        }
        id v9 = (void *)v8;
        v10 = [(DNDModeConfigurationScheduleTrigger *)v5 timePeriod];
        if (!v10)
        {
          char v13 = 0;
LABEL_25:

          goto LABEL_26;
        }
        v11 = [(DNDModeConfigurationScheduleTrigger *)self timePeriod];
        v12 = [(DNDModeConfigurationScheduleTrigger *)v5 timePeriod];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      v14 = [(DNDModeConfigurationScheduleTrigger *)self creationDate];
      uint64_t v15 = [(DNDModeConfigurationScheduleTrigger *)v5 creationDate];
      if (v14 == (void *)v15)
      {

        char v13 = 1;
      }
      else
      {
        objc_super v16 = (void *)v15;
        uint64_t v17 = [(DNDModeConfigurationScheduleTrigger *)self creationDate];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [(DNDModeConfigurationScheduleTrigger *)v5 creationDate];
          if (v19)
          {
            v22 = [(DNDModeConfigurationScheduleTrigger *)self creationDate];
            v20 = [(DNDModeConfigurationScheduleTrigger *)v5 creationDate];
            char v13 = [v22 isEqual:v20];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {

          char v13 = 0;
        }
      }
      v10 = v25;
      id v9 = v26;
      v12 = v23;
      v11 = v24;
      if (v6 == v7) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    char v13 = 0;
  }
LABEL_28:

  return v13;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDModeConfigurationTrigger *)self enabledSetting];
  objc_super v6 = [(DNDModeConfigurationScheduleTrigger *)self timePeriod];
  id v7 = [(DNDModeConfigurationScheduleTrigger *)self creationDate];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; enabledSetting: %llu; timePeriod: %@; creationDate: %@>",
    v4,
    self,
    v5,
    v6,
  uint64_t v8 = v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfigurationScheduleTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DNDModeConfigurationScheduleTrigger;
  unint64_t v5 = [(DNDModeConfigurationTrigger *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timePeriod"];
    uint64_t v7 = [v6 copy];
    timePeriod = v5->_timePeriod;
    v5->_timePeriod = (DNDScheduleTimePeriod *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    uint64_t v10 = [v9 copy];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DNDModeConfigurationScheduleTrigger;
  id v4 = a3;
  [(DNDModeConfigurationTrigger *)&v7 encodeWithCoder:v4];
  unint64_t v5 = [(DNDModeConfigurationScheduleTrigger *)self timePeriod];
  [v4 encodeObject:v5 forKey:@"timePeriod"];

  objc_super v6 = [(DNDModeConfigurationScheduleTrigger *)self creationDate];
  [v4 encodeObject:v6 forKey:@"creationDate"];
}

- (DNDScheduleTimePeriod)timePeriod
{
  return self->_timePeriod;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_creationdate, 0);
  objc_storeStrong((id *)&self->_timePeriod, 0);
}

@end
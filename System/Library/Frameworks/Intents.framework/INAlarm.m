@interface INAlarm
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAlarm)initWithCoder:(id)a3;
- (INAlarm)initWithIdentifier:(id)a3 dateTime:(id)a4 label:(id)a5 enabled:(id)a6 firing:(id)a7 alarmRepeatScheduleOptions:(unint64_t)a8 sleepAlarmAttribute:(id)a9;
- (INSleepAlarmAttribute)sleepAlarmAttribute;
- (INSpeakableString)label;
- (NSDateComponents)dateTime;
- (NSNumber)enabled;
- (NSNumber)firing;
- (NSString)description;
- (NSString)identifier;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)alarmRepeatScheduleOptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAlarm

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarmAttribute, 0);
  objc_storeStrong((id *)&self->_firing, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dateTime, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (INSleepAlarmAttribute)sleepAlarmAttribute
{
  return self->_sleepAlarmAttribute;
}

- (unint64_t)alarmRepeatScheduleOptions
{
  return self->_alarmRepeatScheduleOptions;
}

- (NSNumber)firing
{
  return self->_firing;
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (INSpeakableString)label
{
  return self->_label;
}

- (NSDateComponents)dateTime
{
  return self->_dateTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_dictionaryRepresentation
{
  v23[7] = *MEMORY[0x1E4F143B8];
  uint64_t identifier = (uint64_t)self->_identifier;
  uint64_t v21 = identifier;
  v22[0] = @"identifier";
  if (!identifier)
  {
    uint64_t identifier = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)identifier;
  v23[0] = identifier;
  v22[1] = @"dateTime";
  dateTime = self->_dateTime;
  uint64_t v5 = (uint64_t)dateTime;
  if (!dateTime)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v5;
  v23[1] = v5;
  v22[2] = @"label";
  label = self->_label;
  uint64_t v7 = (uint64_t)label;
  if (!label)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v7;
  v23[2] = v7;
  v22[3] = @"enabled";
  enabled = self->_enabled;
  v9 = enabled;
  if (!enabled)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v7, v19, v20);
  }
  v23[3] = v9;
  v22[4] = @"firing";
  firing = self->_firing;
  v11 = firing;
  if (!firing)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v11;
  v22[5] = @"alarmRepeatScheduleOptions";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_alarmRepeatScheduleOptions, v17);
  v23[5] = v12;
  v22[6] = @"sleepAlarmAttribute";
  sleepAlarmAttribute = self->_sleepAlarmAttribute;
  v14 = sleepAlarmAttribute;
  if (!sleepAlarmAttribute)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[6] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  if (!sleepAlarmAttribute) {

  }
  if (firing)
  {
    if (enabled) {
      goto LABEL_17;
    }
  }
  else
  {

    if (enabled)
    {
LABEL_17:
      if (label) {
        goto LABEL_18;
      }
LABEL_26:

      if (dateTime) {
        goto LABEL_19;
      }
      goto LABEL_27;
    }
  }

  if (!label) {
    goto LABEL_26;
  }
LABEL_18:
  if (dateTime) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:
  if (!v21) {

  }
  return v15;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INAlarm;
  v6 = [(INAlarm *)&v11 description];
  uint64_t v7 = [(INAlarm *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INAlarm *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"identifier");

  v9 = [v6 encodeObject:self->_dateTime];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"dateTime");

  v10 = [v6 encodeObject:self->_label];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"label");

  objc_super v11 = [v6 encodeObject:self->_enabled];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"enabled");

  v12 = [v6 encodeObject:self->_firing];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"firing");

  v13 = INAlarmRepeatScheduleOptionsGetNames(self->_alarmRepeatScheduleOptions);
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"alarmRepeatScheduleOptions");

  v14 = [v6 encodeObject:self->_sleepAlarmAttribute];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"sleepAlarmAttribute");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_dateTime forKey:@"dateTime"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_enabled forKey:@"enabled"];
  [v5 encodeObject:self->_firing forKey:@"firing"];
  [v5 encodeInteger:self->_alarmRepeatScheduleOptions forKey:@"alarmRepeatScheduleOptions"];
  [v5 encodeObject:self->_sleepAlarmAttribute forKey:@"sleepAlarmAttribute"];
}

- (INAlarm)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"identifier"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"dateTime"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  objc_super v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"enabled"];
  v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"firing"];
  uint64_t v13 = [v5 decodeIntegerForKey:@"alarmRepeatScheduleOptions"];
  v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"sleepAlarmAttribute"];

  v15 = [(INAlarm *)self initWithIdentifier:v8 dateTime:v9 label:v10 enabled:v11 firing:v12 alarmRepeatScheduleOptions:v13 sleepAlarmAttribute:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INAlarm *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t identifier = self->_identifier;
      BOOL v12 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        dateTime = self->_dateTime;
        if (dateTime == v5->_dateTime || -[NSDateComponents isEqual:](dateTime, "isEqual:"))
        {
          label = self->_label;
          if (label == v5->_label || -[INSpeakableString isEqual:](label, "isEqual:"))
          {
            enabled = self->_enabled;
            if (enabled == v5->_enabled || -[NSNumber isEqual:](enabled, "isEqual:"))
            {
              firing = self->_firing;
              if ((firing == v5->_firing || -[NSNumber isEqual:](firing, "isEqual:"))
                && self->_alarmRepeatScheduleOptions == v5->_alarmRepeatScheduleOptions)
              {
                sleepAlarmAttribute = self->_sleepAlarmAttribute;
                if (sleepAlarmAttribute == v5->_sleepAlarmAttribute
                  || -[INSleepAlarmAttribute isEqual:](sleepAlarmAttribute, "isEqual:"))
                {
                  BOOL v12 = 1;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = [(NSDateComponents *)self->_dateTime hash] ^ v3;
  unint64_t v5 = [(INSpeakableString *)self->_label hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_enabled hash];
  uint64_t v7 = v6 ^ [(NSNumber *)self->_firing hash];
  v8 = [NSNumber numberWithUnsignedInteger:self->_alarmRepeatScheduleOptions];
  uint64_t v9 = [v8 hash];
  unint64_t v10 = v7 ^ v9 ^ [(INSleepAlarmAttribute *)self->_sleepAlarmAttribute hash];

  return v10;
}

- (INAlarm)initWithIdentifier:(id)a3 dateTime:(id)a4 label:(id)a5 enabled:(id)a6 firing:(id)a7 alarmRepeatScheduleOptions:(unint64_t)a8 sleepAlarmAttribute:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)INAlarm;
  uint64_t v21 = [(INAlarm *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    uint64_t identifier = v21->_identifier;
    v21->_uint64_t identifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    dateTime = v21->_dateTime;
    v21->_dateTime = (NSDateComponents *)v24;

    uint64_t v26 = [v17 copy];
    label = v21->_label;
    v21->_label = (INSpeakableString *)v26;

    uint64_t v28 = [v18 copy];
    enabled = v21->_enabled;
    v21->_enabled = (NSNumber *)v28;

    uint64_t v30 = [v19 copy];
    firing = v21->_firing;
    v21->_firing = (NSNumber *)v30;

    v21->_alarmRepeatScheduleOptions = a8;
    uint64_t v32 = [v20 copy];
    sleepAlarmAttribute = v21->_sleepAlarmAttribute;
    v21->_sleepAlarmAttribute = (INSleepAlarmAttribute *)v32;
  }
  return v21;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = [v8 objectForKeyedSubscript:@"identifier"];
    uint64_t v9 = objc_opt_class();
    unint64_t v10 = [v8 objectForKeyedSubscript:@"dateTime"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v8 objectForKeyedSubscript:@"label"];
    v14 = [v7 decodeObjectOfClass:v12 from:v13];

    id v15 = [v8 objectForKeyedSubscript:@"enabled"];
    id v16 = [v8 objectForKeyedSubscript:@"firing"];
    id v17 = [v8 objectForKeyedSubscript:@"alarmRepeatScheduleOptions"];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
    id v20 = v18;

    uint64_t v21 = INAlarmRepeatScheduleOptionsWithNames(v20);
    uint64_t v22 = objc_opt_class();
    v23 = [v8 objectForKeyedSubscript:@"sleepAlarmAttribute"];
    uint64_t v24 = [v7 decodeObjectOfClass:v22 from:v23];

    id v19 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v26 dateTime:v11 label:v14 enabled:v15 firing:v16 alarmRepeatScheduleOptions:v21 sleepAlarmAttribute:v24];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
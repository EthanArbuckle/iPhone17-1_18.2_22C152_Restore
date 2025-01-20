@interface INAlarmSearch
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAlarmSearch)initWithAlarmReferenceType:(int64_t)a3 identifier:(id)a4 time:(id)a5 label:(id)a6 alarmSearchStatus:(int64_t)a7 includeSleepAlarm:(id)a8 period:(int64_t)a9 isMeridianInferred:(id)a10;
- (INAlarmSearch)initWithCoder:(id)a3;
- (INDateComponentsRange)time;
- (INSpeakableString)label;
- (NSNumber)includeSleepAlarm;
- (NSNumber)isMeridianInferred;
- (NSString)description;
- (NSString)identifier;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)alarmReferenceType;
- (int64_t)alarmSearchStatus;
- (int64_t)period;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAlarmSearch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isMeridianInferred, 0);
  objc_storeStrong((id *)&self->_includeSleepAlarm, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_time, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSNumber)isMeridianInferred
{
  return self->_isMeridianInferred;
}

- (int64_t)period
{
  return self->_period;
}

- (NSNumber)includeSleepAlarm
{
  return self->_includeSleepAlarm;
}

- (int64_t)alarmSearchStatus
{
  return self->_alarmSearchStatus;
}

- (INSpeakableString)label
{
  return self->_label;
}

- (INDateComponentsRange)time
{
  return self->_time;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)alarmReferenceType
{
  return self->_alarmReferenceType;
}

- (id)_dictionaryRepresentation
{
  v22[8] = *MEMORY[0x1E4F143B8];
  v21[0] = @"alarmReferenceType";
  v20 = [NSNumber numberWithInteger:self->_alarmReferenceType];
  v22[0] = v20;
  v21[1] = @"identifier";
  uint64_t identifier = (uint64_t)self->_identifier;
  uint64_t v19 = identifier;
  if (!identifier)
  {
    uint64_t identifier = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)identifier;
  v22[1] = identifier;
  v21[2] = @"time";
  time = self->_time;
  uint64_t v5 = (uint64_t)time;
  if (!time)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v16 = v5;
  v22[2] = v5;
  v21[3] = @"label";
  label = self->_label;
  v7 = label;
  if (!label)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v5, v18);
  }
  v22[3] = v7;
  v21[4] = @"alarmSearchStatus";
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", self->_alarmSearchStatus, v16);
  v22[4] = v8;
  v21[5] = @"includeSleepAlarm";
  includeSleepAlarm = self->_includeSleepAlarm;
  v10 = includeSleepAlarm;
  if (!includeSleepAlarm)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v10;
  v21[6] = @"period";
  v11 = [NSNumber numberWithInteger:self->_period];
  v22[6] = v11;
  v21[7] = @"isMeridianInferred";
  isMeridianInferred = self->_isMeridianInferred;
  v13 = isMeridianInferred;
  if (!isMeridianInferred)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[7] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:8];
  if (!isMeridianInferred) {

  }
  if (!includeSleepAlarm) {
  if (label)
  }
  {
    if (time) {
      goto LABEL_17;
    }
  }
  else
  {

    if (time) {
      goto LABEL_17;
    }
  }

LABEL_17:
  if (!v19) {

  }
  return v14;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INAlarmSearch;
  v6 = [(INAlarmSearch *)&v11 description];
  v7 = [(INAlarmSearch *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INAlarmSearch *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  unint64_t v8 = self->_alarmReferenceType - 1;
  if (v8 > 3) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E55207C0[v8];
  }
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"alarmReferenceType");

  objc_super v11 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"identifier");

  v12 = [v6 encodeObject:self->_time];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"time");

  v13 = [v6 encodeObject:self->_label];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"label");

  unint64_t v14 = self->_alarmSearchStatus - 1;
  if (v14 > 3) {
    v15 = @"unknown";
  }
  else {
    v15 = off_1E5520950[v14];
  }
  uint64_t v16 = v15;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"alarmSearchStatus");

  v17 = [v6 encodeObject:self->_includeSleepAlarm];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"includeSleepAlarm");

  unint64_t v18 = self->_period - 1;
  if (v18 > 7) {
    uint64_t v19 = @"unknown";
  }
  else {
    uint64_t v19 = off_1E55206B0[v18];
  }
  v20 = v19;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, @"period");

  v21 = [v6 encodeObject:self->_isMeridianInferred];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, @"isMeridianInferred");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t alarmReferenceType = self->_alarmReferenceType;
  id v5 = a3;
  [v5 encodeInteger:alarmReferenceType forKey:@"alarmReferenceType"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_time forKey:@"time"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeInteger:self->_alarmSearchStatus forKey:@"alarmSearchStatus"];
  [v5 encodeObject:self->_includeSleepAlarm forKey:@"includeSleepAlarm"];
  [v5 encodeInteger:self->_period forKey:@"period"];
  [v5 encodeObject:self->_isMeridianInferred forKey:@"isMeridianInferred"];
}

- (INAlarmSearch)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"alarmReferenceType"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"identifier"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  uint64_t v12 = [v4 decodeIntegerForKey:@"alarmSearchStatus"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeSleepAlarm"];
  uint64_t v14 = [v4 decodeIntegerForKey:@"period"];
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isMeridianInferred"];

  uint64_t v16 = [(INAlarmSearch *)self initWithAlarmReferenceType:v5 identifier:v9 time:v10 label:v11 alarmSearchStatus:v12 includeSleepAlarm:v13 period:v14 isMeridianInferred:v15];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INAlarmSearch *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v11 = 0;
      if (self->_alarmReferenceType == v5->_alarmReferenceType)
      {
        uint64_t identifier = self->_identifier;
        if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
        {
          time = self->_time;
          if (time == v5->_time || -[INDateComponentsRange isEqual:](time, "isEqual:"))
          {
            label = self->_label;
            if ((label == v5->_label || -[INSpeakableString isEqual:](label, "isEqual:"))
              && self->_alarmSearchStatus == v5->_alarmSearchStatus)
            {
              includeSleepAlarm = self->_includeSleepAlarm;
              if ((includeSleepAlarm == v5->_includeSleepAlarm
                 || -[NSNumber isEqual:](includeSleepAlarm, "isEqual:"))
                && self->_period == v5->_period)
              {
                isMeridianInferred = self->_isMeridianInferred;
                if (isMeridianInferred == v5->_isMeridianInferred
                  || -[NSNumber isEqual:](isMeridianInferred, "isEqual:"))
                {
                  BOOL v11 = 1;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_alarmReferenceType];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  unint64_t v6 = v5 ^ [(INDateComponentsRange *)self->_time hash];
  unint64_t v7 = v6 ^ [(INSpeakableString *)self->_label hash] ^ v4;
  unint64_t v8 = [NSNumber numberWithInteger:self->_alarmSearchStatus];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = v7 ^ v9 ^ [(NSNumber *)self->_includeSleepAlarm hash];
  BOOL v11 = [NSNumber numberWithInteger:self->_period];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v10 ^ v12 ^ [(NSNumber *)self->_isMeridianInferred hash];

  return v13;
}

- (INAlarmSearch)initWithAlarmReferenceType:(int64_t)a3 identifier:(id)a4 time:(id)a5 label:(id)a6 alarmSearchStatus:(int64_t)a7 includeSleepAlarm:(id)a8 period:(int64_t)a9 isMeridianInferred:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a10;
  v34.receiver = self;
  v34.super_class = (Class)INAlarmSearch;
  v21 = [(INAlarmSearch *)&v34 init];
  v22 = v21;
  if (v21)
  {
    v21->_int64_t alarmReferenceType = a3;
    uint64_t v23 = [v16 copy];
    uint64_t identifier = v22->_identifier;
    v22->_uint64_t identifier = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    time = v22->_time;
    v22->_time = (INDateComponentsRange *)v25;

    uint64_t v27 = [v18 copy];
    label = v22->_label;
    v22->_label = (INSpeakableString *)v27;

    v22->_alarmSearchStatus = a7;
    uint64_t v29 = [v19 copy];
    includeSleepAlarm = v22->_includeSleepAlarm;
    v22->_includeSleepAlarm = (NSNumber *)v29;

    v22->_period = a9;
    uint64_t v31 = [v20 copy];
    isMeridianInferred = v22->_isMeridianInferred;
    v22->_isMeridianInferred = (NSNumber *)v31;
  }
  return v22;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"alarmReferenceType"];
    uint64_t v25 = INAlarmReferenceTypeWithString(v9);

    uint64_t v10 = [v8 objectForKeyedSubscript:@"identifier"];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v8 objectForKeyedSubscript:@"time"];
    unint64_t v13 = [v7 decodeObjectOfClass:v11 from:v12];

    uint64_t v14 = objc_opt_class();
    v15 = [v8 objectForKeyedSubscript:@"label"];
    id v16 = [v7 decodeObjectOfClass:v14 from:v15];

    id v17 = [v8 objectForKeyedSubscript:@"alarmSearchStatus"];
    uint64_t v18 = INAlarmSearchStatusWithString(v17);

    id v19 = [v8 objectForKeyedSubscript:@"includeSleepAlarm"];
    id v20 = [v8 objectForKeyedSubscript:@"period"];
    uint64_t v21 = INAlarmPeriodWithString(v20);

    v22 = [v8 objectForKeyedSubscript:@"isMeridianInferred"];
    uint64_t v23 = (void *)[objc_alloc((Class)a1) initWithAlarmReferenceType:v25 identifier:v10 time:v13 label:v16 alarmSearchStatus:v18 includeSleepAlarm:v19 period:v21 isMeridianInferred:v22];
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface AFClockAlarm
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFClockAlarm)init;
- (AFClockAlarm)initWithAlarmID:(id)a3 alarmURL:(id)a4 isFiring:(BOOL)a5 title:(id)a6 type:(unint64_t)a7 hour:(unint64_t)a8 minute:(unint64_t)a9 repeatOptions:(unint64_t)a10 isEnabled:(BOOL)a11 isSnoozed:(BOOL)a12 firedDate:(id)a13 dismissedDate:(id)a14 lastModifiedDate:(id)a15;
- (AFClockAlarm)initWithBuilder:(id)a3;
- (AFClockAlarm)initWithCoder:(id)a3;
- (AFClockAlarm)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFiring;
- (BOOL)isSnoozed;
- (NSDate)dismissedDate;
- (NSDate)firedDate;
- (NSDate)lastModifiedDate;
- (NSString)description;
- (NSString)title;
- (NSURL)alarmURL;
- (NSUUID)alarmID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)hour;
- (unint64_t)minute;
- (unint64_t)repeatOptions;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFClockAlarm

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alarmURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)dismissedDate
{
  return self->_dismissedDate;
}

- (NSDate)firedDate
{
  return self->_firedDate;
}

- (BOOL)isSnoozed
{
  return self->_isSnoozed;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (unint64_t)repeatOptions
{
  return self->_repeatOptions;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isFiring
{
  return self->_isFiring;
}

- (NSURL)alarmURL
{
  return self->_alarmURL;
}

- (NSUUID)alarmID
{
  return self->_alarmID;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  alarmID = self->_alarmID;
  if (alarmID) {
    [v3 setObject:alarmID forKey:@"alarmID"];
  }
  alarmURL = self->_alarmURL;
  if (alarmURL) {
    [v4 setObject:alarmURL forKey:@"alarmURL"];
  }
  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFiring];
  [v4 setObject:v7 forKey:@"isFiring"];

  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  v9 = AFClockAlarmTypeGetNames(self->_type);
  [v4 setObject:v9 forKey:@"type"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_hour];
  [v4 setObject:v10 forKey:@"hour"];

  v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_minute];
  [v4 setObject:v11 forKey:@"minute"];

  v12 = AFClockAlarmRepeatOptionsGetNames(self->_repeatOptions);
  [v4 setObject:v12 forKey:@"repeatOptions"];

  v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isEnabled];
  [v4 setObject:v13 forKey:@"isEnabled"];

  v14 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSnoozed];
  [v4 setObject:v14 forKey:@"isSnoozed"];

  firedDate = self->_firedDate;
  if (firedDate) {
    [v4 setObject:firedDate forKey:@"firedDate"];
  }
  dismissedDate = self->_dismissedDate;
  if (dismissedDate) {
    [v4 setObject:dismissedDate forKey:@"dismissedDate"];
  }
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate) {
    [v4 setObject:lastModifiedDate forKey:@"lastModifiedDate"];
  }
  v18 = (void *)[v4 copy];

  return v18;
}

- (AFClockAlarm)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"alarmID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v39 = v6;
    }
    else {
      id v39 = 0;
    }

    v8 = [v5 objectForKey:@"alarmURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v38 = v8;
    }
    else {
      id v38 = 0;
    }

    v9 = [v5 objectForKey:@"isFiring"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    unsigned int v37 = [v10 BOOLValue];
    v11 = [v5 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v36 = v11;
    }
    else {
      id v36 = 0;
    }

    v12 = [v5 objectForKey:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v35 = AFClockAlarmTypeGetFromNames(v12);
    }
    else {
      uint64_t v35 = 0;
    }

    v13 = [v5 objectForKey:@"hour"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    uint64_t v34 = [v14 unsignedIntegerValue];
    v15 = [v5 objectForKey:@"minute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    uint64_t v33 = [v16 unsignedIntegerValue];
    v17 = [v5 objectForKey:@"repeatOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v18 = AFClockAlarmRepeatOptionsGetFromNames(v17);
    }
    else {
      uint64_t v18 = 0;
    }

    v19 = [v5 objectForKey:@"isEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    char v21 = [v20 BOOLValue];
    v22 = [v5 objectForKey:@"isSnoozed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    char v24 = [v23 BOOLValue];
    v25 = [v5 objectForKey:@"firedDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }

    v27 = [v5 objectForKey:@"dismissedDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }

    v29 = [v5 objectForKey:@"lastModifiedDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }

    BYTE1(v32) = v24;
    LOBYTE(v32) = v21;
    self = -[AFClockAlarm initWithAlarmID:alarmURL:isFiring:title:type:hour:minute:repeatOptions:isEnabled:isSnoozed:firedDate:dismissedDate:lastModifiedDate:](self, "initWithAlarmID:alarmURL:isFiring:title:type:hour:minute:repeatOptions:isEnabled:isSnoozed:firedDate:dismissedDate:lastModifiedDate:", v39, v38, v37, v36, v35, v34, v33, v18, v32, v26, v28, v30);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  alarmID = self->_alarmID;
  id v12 = a3;
  [v12 encodeObject:alarmID forKey:@"AFClockAlarm::alarmID"];
  [v12 encodeObject:self->_alarmURL forKey:@"AFClockAlarm::alarmURL"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFiring];
  [v12 encodeObject:v5 forKey:@"AFClockAlarm::isFiring"];

  [v12 encodeObject:self->_title forKey:@"AFClockAlarm::title"];
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_type];
  [v12 encodeObject:v6 forKey:@"AFClockAlarm::type"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_hour];
  [v12 encodeObject:v7 forKey:@"AFClockAlarm::hour"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_minute];
  [v12 encodeObject:v8 forKey:@"AFClockAlarm::minute"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_repeatOptions];
  [v12 encodeObject:v9 forKey:@"AFClockAlarm::repeatOptions"];

  id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isEnabled];
  [v12 encodeObject:v10 forKey:@"AFClockAlarm::isEnabled"];

  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSnoozed];
  [v12 encodeObject:v11 forKey:@"AFClockAlarm::isSnoozed"];

  [v12 encodeObject:self->_firedDate forKey:@"AFClockAlarm::firedDate"];
  [v12 encodeObject:self->_dismissedDate forKey:@"AFClockAlarm::dismissedDate"];
  [v12 encodeObject:self->_lastModifiedDate forKey:@"AFClockAlarm::lastModifiedDate"];
}

- (AFClockAlarm)initWithCoder:(id)a3
{
  id v3 = a3;
  v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::alarmID"];
  char v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::alarmURL"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::isFiring"];
  unsigned int v23 = [v4 BOOLValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::title"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::type"];
  uint64_t v22 = [v6 unsignedIntegerValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::hour"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::minute"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::repeatOptions"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::isEnabled"];
  LOBYTE(v11) = [v13 BOOLValue];

  id v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::isSnoozed"];
  char v15 = [v14 BOOLValue];

  id v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::firedDate"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::dismissedDate"];
  uint64_t v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarm::lastModifiedDate"];

  BYTE1(v21) = v15;
  LOBYTE(v21) = (_BYTE)v11;
  v19 = -[AFClockAlarm initWithAlarmID:alarmURL:isFiring:title:type:hour:minute:repeatOptions:isEnabled:isSnoozed:firedDate:dismissedDate:lastModifiedDate:](self, "initWithAlarmID:alarmURL:isFiring:title:type:hour:minute:repeatOptions:isEnabled:isSnoozed:firedDate:dismissedDate:lastModifiedDate:", v25, v24, v23, v5, v22, v8, v10, v12, v21, v16, v17, v18);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFClockAlarm *)a3;
  if (self == v4)
  {
    BOOL v25 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isFiring = self->_isFiring;
      if (isFiring == [(AFClockAlarm *)v5 isFiring]
        && (unint64_t type = self->_type, type == [(AFClockAlarm *)v5 type])
        && (unint64_t hour = self->_hour, hour == [(AFClockAlarm *)v5 hour])
        && (unint64_t minute = self->_minute, minute == [(AFClockAlarm *)v5 minute])
        && (unint64_t repeatOptions = self->_repeatOptions, repeatOptions == [(AFClockAlarm *)v5 repeatOptions])
        && (BOOL isEnabled = self->_isEnabled, isEnabled == [(AFClockAlarm *)v5 isEnabled])
        && (BOOL isSnoozed = self->_isSnoozed, isSnoozed == [(AFClockAlarm *)v5 isSnoozed]))
      {
        v13 = [(AFClockAlarm *)v5 alarmID];
        alarmID = self->_alarmID;
        if (alarmID == v13 || [(NSUUID *)alarmID isEqual:v13])
        {
          char v15 = [(AFClockAlarm *)v5 alarmURL];
          alarmURL = self->_alarmURL;
          if (alarmURL == v15 || [(NSURL *)alarmURL isEqual:v15])
          {
            v17 = [(AFClockAlarm *)v5 title];
            title = self->_title;
            if (title == v17 || [(NSString *)title isEqual:v17])
            {
              v19 = [(AFClockAlarm *)v5 firedDate];
              firedDate = self->_firedDate;
              if (firedDate == v19 || [(NSDate *)firedDate isEqual:v19])
              {
                uint64_t v21 = [(AFClockAlarm *)v5 dismissedDate];
                dismissedDate = self->_dismissedDate;
                if (dismissedDate == v21 || [(NSDate *)dismissedDate isEqual:v21])
                {
                  unsigned int v23 = [(AFClockAlarm *)v5 lastModifiedDate];
                  lastModifiedDate = self->_lastModifiedDate;
                  BOOL v25 = lastModifiedDate == v23 || [(NSDate *)lastModifiedDate isEqual:v23];
                }
                else
                {
                  BOOL v25 = 0;
                }
              }
              else
              {
                BOOL v25 = 0;
              }
            }
            else
            {
              BOOL v25 = 0;
            }
          }
          else
          {
            BOOL v25 = 0;
          }
        }
        else
        {
          BOOL v25 = 0;
        }
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_alarmID hash];
  uint64_t v4 = [(NSURL *)self->_alarmURL hash] ^ v3;
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFiring];
  uint64_t v6 = [v5 hash];
  NSUInteger v7 = v4 ^ [(NSString *)self->_title hash] ^ v6;
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_type];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_hour];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_minute];
  uint64_t v13 = [v12 hash];
  id v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_repeatOptions];
  uint64_t v15 = v13 ^ [v14 hash];
  id v16 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isEnabled];
  uint64_t v17 = v11 ^ v15 ^ [v16 hash];
  uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSnoozed];
  uint64_t v19 = [v18 hash];
  uint64_t v20 = v19 ^ [(NSDate *)self->_firedDate hash];
  uint64_t v21 = v20 ^ [(NSDate *)self->_dismissedDate hash];
  unint64_t v22 = v17 ^ v21 ^ [(NSDate *)self->_lastModifiedDate hash];

  return v22;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v22 = [NSString alloc];
  v23.receiver = self;
  v23.super_class = (Class)AFClockAlarm;
  uint64_t v4 = [(AFClockAlarm *)&v23 description];
  alarmID = self->_alarmID;
  uint64_t v21 = (void *)v4;
  title = self->_title;
  if (self->_isFiring) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v18 = v6;
  alarmURL = self->_alarmURL;
  NSUInteger v7 = AFClockAlarmTypeGetNames(self->_type);
  uint64_t v8 = [v7 componentsJoinedByString:@"|"];
  unint64_t hour = self->_hour;
  unint64_t minute = self->_minute;
  uint64_t v11 = AFClockAlarmRepeatOptionsGetNames(self->_repeatOptions);
  uint64_t v12 = [v11 componentsJoinedByString:@"|"];
  uint64_t v13 = (void *)v12;
  if (self->_isEnabled) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  if (self->_isSnoozed) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  id v16 = (void *)[v22 initWithFormat:@"%@ {alarmID = %@, alarmURL = %@, isFiring = %@, title = %@, type = %@, hour = %llu, minute = %llu, repeatOptions = %@, isEnabled = %@, isSnoozed = %@, firedDate = %@, dismissedDate = %@, lastModifiedDate = %@}", v21, alarmID, alarmURL, v18, title, v8, hour, minute, v12, v14, v15, self->_firedDate, self->_dismissedDate, self->_lastModifiedDate];

  return v16;
}

- (NSString)description
{
  return (NSString *)[(AFClockAlarm *)self _descriptionWithIndent:0];
}

- (AFClockAlarm)initWithAlarmID:(id)a3 alarmURL:(id)a4 isFiring:(BOOL)a5 title:(id)a6 type:(unint64_t)a7 hour:(unint64_t)a8 minute:(unint64_t)a9 repeatOptions:(unint64_t)a10 isEnabled:(BOOL)a11 isSnoozed:(BOOL)a12 firedDate:(id)a13 dismissedDate:(id)a14 lastModifiedDate:(id)a15
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __148__AFClockAlarm_initWithAlarmID_alarmURL_isFiring_title_type_hour_minute_repeatOptions_isEnabled_isSnoozed_firedDate_dismissedDate_lastModifiedDate___block_invoke;
  v35[3] = &unk_1E592C2D8;
  id v36 = v18;
  id v37 = v19;
  BOOL v46 = a5;
  unint64_t v42 = a7;
  unint64_t v43 = a8;
  unint64_t v44 = a9;
  unint64_t v45 = a10;
  BOOL v47 = a11;
  BOOL v48 = a12;
  id v38 = v20;
  id v39 = v21;
  id v40 = v22;
  id v41 = v23;
  id v24 = v23;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  id v30 = [(AFClockAlarm *)self initWithBuilder:v35];

  return v30;
}

void __148__AFClockAlarm_initWithAlarmID_alarmURL_isFiring_title_type_hour_minute_repeatOptions_isEnabled_isSnoozed_firedDate_dismissedDate_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAlarmID:v3];
  [v4 setAlarmURL:*(void *)(a1 + 40)];
  [v4 setIsFiring:*(unsigned __int8 *)(a1 + 112)];
  [v4 setTitle:*(void *)(a1 + 48)];
  [v4 setType:*(void *)(a1 + 80)];
  [v4 setHour:*(void *)(a1 + 88)];
  [v4 setMinute:*(void *)(a1 + 96)];
  [v4 setRepeatOptions:*(void *)(a1 + 104)];
  [v4 setIsEnabled:*(unsigned __int8 *)(a1 + 113)];
  [v4 setIsSnoozed:*(unsigned __int8 *)(a1 + 114)];
  [v4 setFiredDate:*(void *)(a1 + 56)];
  [v4 setDismissedDate:*(void *)(a1 + 64)];
  [v4 setLastModifiedDate:*(void *)(a1 + 72)];
}

- (AFClockAlarm)init
{
  return [(AFClockAlarm *)self initWithBuilder:0];
}

- (AFClockAlarm)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFClockAlarmMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)AFClockAlarm;
  v5 = [(AFClockAlarm *)&v27 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFClockAlarmMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFClockAlarmMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_AFClockAlarmMutation *)v7 getAlarmID];
      uint64_t v9 = [v8 copy];
      alarmID = v6->_alarmID;
      v6->_alarmID = (NSUUID *)v9;

      uint64_t v11 = [(_AFClockAlarmMutation *)v7 getAlarmURL];
      uint64_t v12 = [v11 copy];
      alarmURL = v6->_alarmURL;
      v6->_alarmURL = (NSURL *)v12;

      v6->_BOOL isFiring = [(_AFClockAlarmMutation *)v7 getIsFiring];
      id v14 = [(_AFClockAlarmMutation *)v7 getTitle];
      uint64_t v15 = [v14 copy];
      title = v6->_title;
      v6->_title = (NSString *)v15;

      v6->_unint64_t type = [(_AFClockAlarmMutation *)v7 getType];
      v6->_unint64_t hour = [(_AFClockAlarmMutation *)v7 getHour];
      v6->_unint64_t minute = [(_AFClockAlarmMutation *)v7 getMinute];
      v6->_unint64_t repeatOptions = [(_AFClockAlarmMutation *)v7 getRepeatOptions];
      v6->_BOOL isEnabled = [(_AFClockAlarmMutation *)v7 getIsEnabled];
      v6->_BOOL isSnoozed = [(_AFClockAlarmMutation *)v7 getIsSnoozed];
      uint64_t v17 = [(_AFClockAlarmMutation *)v7 getFiredDate];
      uint64_t v18 = [v17 copy];
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v18;

      id v20 = [(_AFClockAlarmMutation *)v7 getDismissedDate];
      uint64_t v21 = [v20 copy];
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v21;

      id v23 = [(_AFClockAlarmMutation *)v7 getLastModifiedDate];
      uint64_t v24 = [v23 copy];
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v24;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFClockAlarmMutation *))a3;
  if (v4)
  {
    v5 = [[_AFClockAlarmMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFClockAlarmMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFClockAlarm);
      NSUInteger v7 = [(_AFClockAlarmMutation *)v5 getAlarmID];
      uint64_t v8 = [v7 copy];
      alarmID = v6->_alarmID;
      v6->_alarmID = (NSUUID *)v8;

      uint64_t v10 = [(_AFClockAlarmMutation *)v5 getAlarmURL];
      uint64_t v11 = [v10 copy];
      alarmURL = v6->_alarmURL;
      v6->_alarmURL = (NSURL *)v11;

      v6->_BOOL isFiring = [(_AFClockAlarmMutation *)v5 getIsFiring];
      uint64_t v13 = [(_AFClockAlarmMutation *)v5 getTitle];
      uint64_t v14 = [v13 copy];
      title = v6->_title;
      v6->_title = (NSString *)v14;

      v6->_unint64_t type = [(_AFClockAlarmMutation *)v5 getType];
      v6->_unint64_t hour = [(_AFClockAlarmMutation *)v5 getHour];
      v6->_unint64_t minute = [(_AFClockAlarmMutation *)v5 getMinute];
      v6->_unint64_t repeatOptions = [(_AFClockAlarmMutation *)v5 getRepeatOptions];
      v6->_BOOL isEnabled = [(_AFClockAlarmMutation *)v5 getIsEnabled];
      v6->_BOOL isSnoozed = [(_AFClockAlarmMutation *)v5 getIsSnoozed];
      id v16 = [(_AFClockAlarmMutation *)v5 getFiredDate];
      uint64_t v17 = [v16 copy];
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v17;

      id v19 = [(_AFClockAlarmMutation *)v5 getDismissedDate];
      uint64_t v20 = [v19 copy];
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v20;

      id v22 = [(_AFClockAlarmMutation *)v5 getLastModifiedDate];
      uint64_t v23 = [v22 copy];
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v23;
    }
    else
    {
      uint64_t v6 = (AFClockAlarm *)[(AFClockAlarm *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFClockAlarm *)[(AFClockAlarm *)self copy];
  }

  return v6;
}

@end
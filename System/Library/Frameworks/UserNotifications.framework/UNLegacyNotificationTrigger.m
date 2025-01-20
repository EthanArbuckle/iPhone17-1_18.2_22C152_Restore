@interface UNLegacyNotificationTrigger
+ (BOOL)supportsSecureCoding;
+ (id)triggerWithDate:(id)a3 timeZone:(id)a4 remainingRepeatCount:(int)a5 totalRepeatCount:(int)a6 repeatInterval:(unint64_t)a7 repeatCalendar:(id)a8;
+ (id)triggerWithDate:(id)a3 timeZone:(id)a4 repeatInterval:(unint64_t)a5 repeatCalendar:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4;
- (NSCalendar)repeatCalendar;
- (NSDate)date;
- (NSTimeZone)timeZone;
- (UNLegacyNotificationTrigger)initWithCoder:(id)a3;
- (double)_retroactiveTriggerHysteresis;
- (id)_initWithDate:(id)a3 timeZone:(id)a4 remainingRepeatCount:(int)a5 totalRepeatCount:(int)a6 repeatInterval:(unint64_t)a7 repeatCalendar:(id)a8;
- (id)_nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4 defaultTimeZone:(id)a5;
- (id)description;
- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4;
- (int)remainingRepeatCount;
- (int)totalRepeatCount;
- (unint64_t)hash;
- (unint64_t)repeatInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setRemainingRepeatCount:(int)a3;
- (void)setRepeatCalendar:(id)a3;
- (void)setRepeatInterval:(unint64_t)a3;
- (void)setTimeZone:(id)a3;
- (void)setTotalRepeatCount:(int)a3;
@end

@implementation UNLegacyNotificationTrigger

+ (id)triggerWithDate:(id)a3 timeZone:(id)a4 remainingRepeatCount:(int)a5 totalRepeatCount:(int)a6 repeatInterval:(unint64_t)a7 repeatCalendar:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) _initWithDate:v16 timeZone:v15 remainingRepeatCount:v10 totalRepeatCount:v9 repeatInterval:a7 repeatCalendar:v14];

  return v17;
}

+ (id)triggerWithDate:(id)a3 timeZone:(id)a4 repeatInterval:(unint64_t)a5 repeatCalendar:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) _initWithDate:v12 timeZone:v11 remainingRepeatCount:0x80000000 totalRepeatCount:0x80000000 repeatInterval:a5 repeatCalendar:v10];

  return v13;
}

- (id)_initWithDate:(id)a3 timeZone:(id)a4 remainingRepeatCount:(int)a5 totalRepeatCount:(int)a6 repeatInterval:(unint64_t)a7 repeatCalendar:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)UNLegacyNotificationTrigger;
  v17 = [(UNNotificationTrigger *)&v25 _initWithRepeats:a7 != 0];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    v19 = (void *)v17[3];
    v17[3] = v18;

    uint64_t v20 = [v15 copy];
    v21 = (void *)v17[4];
    v17[4] = v20;

    *((_DWORD *)v17 + 3) = a5;
    uint64_t v22 = [v16 copy];
    v23 = (void *)v17[5];
    v17[5] = v22;

    v17[6] = a7;
    *((_DWORD *)v17 + 4) = a6;
  }

  return v17;
}

- (unint64_t)hash
{
  v14.receiver = self;
  v14.super_class = (Class)UNLegacyNotificationTrigger;
  unint64_t v3 = [(UNNotificationTrigger *)&v14 hash];
  v4 = [(UNLegacyNotificationTrigger *)self date];
  uint64_t v5 = [v4 hash];
  v6 = [(UNLegacyNotificationTrigger *)self timeZone];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = v7 ^ [(UNLegacyNotificationTrigger *)self remainingRepeatCount];
  uint64_t v9 = [(UNLegacyNotificationTrigger *)self repeatCalendar];
  uint64_t v10 = v8 ^ [v9 hash];
  unint64_t v11 = v10 ^ [(UNLegacyNotificationTrigger *)self repeatInterval] ^ v3;
  unint64_t v12 = v11 ^ [(UNLegacyNotificationTrigger *)self totalRepeatCount];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v16.receiver = self,
        v16.super_class = (Class)UNLegacyNotificationTrigger,
        [(UNNotificationTrigger *)&v16 isEqual:v4]))
  {
    uint64_t v5 = [(UNLegacyNotificationTrigger *)self date];
    v6 = [v4 date];
    if (UNEqualObjects(v5, v6))
    {
      uint64_t v7 = [(UNLegacyNotificationTrigger *)self repeatCalendar];
      uint64_t v8 = [v4 repeatCalendar];
      if (UNEqualObjects(v7, v8)
        && (int v9 = [(UNLegacyNotificationTrigger *)self remainingRepeatCount],
            v9 == [v4 remainingRepeatCount])
        && (unint64_t v10 = [(UNLegacyNotificationTrigger *)self repeatInterval],
            v10 == [v4 repeatInterval])
        && (int v11 = [(UNLegacyNotificationTrigger *)self totalRepeatCount],
            v11 == [v4 totalRepeatCount]))
      {
        unint64_t v12 = [(UNLegacyNotificationTrigger *)self timeZone];
        v13 = [v4 timeZone];
        char v14 = UNEqualObjects(v12, v13);
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)description
{
  char v14 = NSString;
  uint64_t v3 = objc_opt_class();
  [(UNNotificationTrigger *)self repeats];
  id v4 = NSStringFromBOOL();
  uint64_t v5 = [(UNLegacyNotificationTrigger *)self date];
  v6 = [(UNLegacyNotificationTrigger *)self timeZone];
  uint64_t v7 = [(UNLegacyNotificationTrigger *)self remainingRepeatCount];
  uint64_t v8 = [(UNLegacyNotificationTrigger *)self totalRepeatCount];
  unint64_t v9 = [(UNLegacyNotificationTrigger *)self repeatInterval];
  unint64_t v10 = [(UNLegacyNotificationTrigger *)self repeatCalendar];
  int v11 = [v10 calendarIdentifier];
  objc_msgSend(v14, "stringWithFormat:", @"<%@: %p; repeats: %@, date: %@, timeZone: %@, remainingRepeatCount: %ld, totalRepeatCount: %ld, repeatInterval: %ld, repeatCalendar: %@>",
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
  unint64_t v12 = v11);

  return v12;
}

- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UNNotificationTrigger *)self repeats]
    && ![(UNLegacyNotificationTrigger *)self remainingRepeatCount])
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UNLegacyNotificationTrigger;
    BOOL v8 = [(UNNotificationTrigger *)&v10 willTriggerAfterDate:v6 withRequestedDate:v7];
  }

  return v8;
}

- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAF0];
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [v6 defaultTimeZone];
  objc_super v10 = [(UNLegacyNotificationTrigger *)self _nextTriggerDateAfterDate:v8 withRequestedDate:v7 defaultTimeZone:v9];

  return v10;
}

- (id)_nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4 defaultTimeZone:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:302 description:@"afterDate must not be nil"];
  }
  unint64_t v12 = [(UNLegacyNotificationTrigger *)self repeatInterval];
  uint64_t v13 = v12;
  if (v12)
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = qword_1AE75E730[v14];
      if (v14 > 6) {
        break;
      }
      ++v14;
    }
    while (v15 != v12);
    if (v15 != v12)
    {
      id v20 = 0;
      goto LABEL_39;
    }
  }
  objc_super v16 = [(UNLegacyNotificationTrigger *)self date];
  v17 = [(UNLegacyNotificationTrigger *)self repeatCalendar];
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v21 = v19;

  uint64_t v22 = [(UNLegacyNotificationTrigger *)self timeZone];
  v23 = v22;
  if (v22 && ([v22 isEqual:v11] & 1) == 0)
  {
    v24 = (void *)[v21 copy];
    [v24 setTimeZone:v23];
    objc_super v25 = [v24 components:254 fromDate:v16];
    uint64_t v26 = [v21 dateFromComponents:v25];

    objc_super v16 = (void *)v26;
  }
  v27 = 0;
  if (v13 > 63)
  {
    if (v13 > 511)
    {
      if (v13 == 512) {
        goto LABEL_30;
      }
      if (v13 != 0x2000) {
        goto LABEL_35;
      }
    }
    else
    {
      if (v13 == 64)
      {
        uint64_t v28 = 128;
        goto LABEL_33;
      }
      if (v13 != 256) {
        goto LABEL_35;
      }
    }
    uint64_t v28 = 736;
    goto LABEL_33;
  }
  if (v13 <= 15)
  {
    if (v13 == 4)
    {
      uint64_t v28 = 248;
      goto LABEL_33;
    }
    if (v13 == 8)
    {
      uint64_t v28 = 240;
LABEL_33:
      v29 = [v21 components:v28 fromDate:v16];
      v30 = (void *)MEMORY[0x1B3E70390]();
      v27 = [v21 nextDateAfterDate:v9 matchingComponents:v29 options:512];

      if (v27)
      {
        id v20 = v27;
        if ([v27 compare:v16] != -1) {
          goto LABEL_36;
        }
      }
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (v13 == 16)
  {
LABEL_30:
    uint64_t v28 = 224;
    goto LABEL_33;
  }
  if (v13 == 32)
  {
    uint64_t v28 = 192;
    goto LABEL_33;
  }
LABEL_35:
  id v20 = v16;

LABEL_36:
  if ([v20 compare:v9] != 1)
  {

    id v20 = 0;
  }

LABEL_39:

  return v20;
}

- (double)_retroactiveTriggerHysteresis
{
  if (([(UNLegacyNotificationTrigger *)self repeatInterval] & 0xC0) != 0) {
    return 60.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UNLegacyNotificationTrigger;
  [(UNNotificationTrigger *)&v4 _retroactiveTriggerHysteresis];
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UNLegacyNotificationTrigger;
  id v4 = a3;
  [(UNNotificationTrigger *)&v8 encodeWithCoder:v4];
  uint64_t v5 = [(UNLegacyNotificationTrigger *)self date];
  [v4 encodeObject:v5 forKey:@"date"];

  id v6 = [(UNLegacyNotificationTrigger *)self timeZone];
  [v4 encodeObject:v6 forKey:@"timeZone"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[UNLegacyNotificationTrigger remainingRepeatCount](self, "remainingRepeatCount"), @"remainingRepeatCount");
  id v7 = [(UNLegacyNotificationTrigger *)self repeatCalendar];
  [v4 encodeObject:v7 forKey:@"repeatCalendar"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNLegacyNotificationTrigger repeatInterval](self, "repeatInterval"), @"repeatInterval");
  objc_msgSend(v4, "encodeInt32:forKey:", -[UNLegacyNotificationTrigger totalRepeatCount](self, "totalRepeatCount"), @"totalRepeatCount");
}

- (UNLegacyNotificationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UNLegacyNotificationTrigger;
  uint64_t v5 = [(UNNotificationTrigger *)&v16 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    uint64_t v7 = [v6 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    uint64_t v10 = [v9 copy];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v10;

    *((_DWORD *)&v5->super._repeats + 1) = [v4 decodeInt32ForKey:@"remainingRepeatCount"];
    unint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"repeatCalendar"];
    uint64_t v13 = [v12 copy];
    repeatCalendar = v5->_repeatCalendar;
    v5->_repeatCalendar = (NSCalendar *)v13;

    v5->_repeatInterval = [v4 decodeIntegerForKey:@"repeatInterval"];
    v5->_remainingRepeatCount = [v4 decodeInt32ForKey:@"totalRepeatCount"];
  }

  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSCalendar)repeatCalendar
{
  return self->_repeatCalendar;
}

- (void)setRepeatCalendar:(id)a3
{
}

- (int)remainingRepeatCount
{
  return *((_DWORD *)&self->super._repeats + 1);
}

- (void)setRemainingRepeatCount:(int)a3
{
  *((_DWORD *)&self->super._repeats + 1) = a3;
}

- (int)totalRepeatCount
{
  return self->_remainingRepeatCount;
}

- (void)setTotalRepeatCount:(int)a3
{
  self->_remainingRepeatCount = a3;
}

- (unint64_t)repeatInterval
{
  return self->_repeatInterval;
}

- (void)setRepeatInterval:(unint64_t)a3
{
  self->_repeatInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatCalendar, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end
@interface UNCalendarNotificationTrigger
+ (BOOL)supportsSecureCoding;
+ (UNCalendarNotificationTrigger)triggerWithDateMatchingComponents:(NSDateComponents *)dateComponents repeats:(BOOL)repeats;
- (BOOL)isEqual:(id)a3;
- (NSDate)nextTriggerDate;
- (NSDateComponents)dateComponents;
- (UNCalendarNotificationTrigger)initWithCoder:(id)a3;
- (id)_initWithDateComponents:(id)a3 repeats:(BOOL)a4;
- (id)description;
- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNCalendarNotificationTrigger

+ (UNCalendarNotificationTrigger)triggerWithDateMatchingComponents:(NSDateComponents *)dateComponents repeats:(BOOL)repeats
{
  BOOL v4 = repeats;
  v6 = dateComponents;
  v7 = (void *)[objc_alloc((Class)a1) _initWithDateComponents:v6 repeats:v4];

  return (UNCalendarNotificationTrigger *)v7;
}

- (id)_initWithDateComponents:(id)a3 repeats:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:133 description:@"dateComponents must not be nil"];
  }
  v13.receiver = self;
  v13.super_class = (Class)UNCalendarNotificationTrigger;
  v8 = [(UNNotificationTrigger *)&v13 _initWithRepeats:v4];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    v10 = (void *)v8[2];
    v8[2] = v9;
  }
  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)UNCalendarNotificationTrigger;
  unint64_t v3 = [(UNNotificationTrigger *)&v7 hash];
  BOOL v4 = [(UNCalendarNotificationTrigger *)self dateComponents];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)UNCalendarNotificationTrigger,
        [(UNNotificationTrigger *)&v9 isEqual:v4]))
  {
    unint64_t v5 = [(UNCalendarNotificationTrigger *)self dateComponents];
    v6 = [v4 dateComponents];
    char v7 = UNEqualObjects(v5, v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(UNCalendarNotificationTrigger *)self dateComponents];
  [(UNNotificationTrigger *)self repeats];
  v6 = NSStringFromBOOL();
  char v7 = [v3 stringWithFormat:@"<%@: %p; dateComponents: %@, repeats: %@>", v4, self, v5, v6];

  return v7;
}

- (NSDate)nextTriggerDate
{
  v4.receiver = self;
  v4.super_class = (Class)UNCalendarNotificationTrigger;
  v2 = [(UNNotificationTrigger *)&v4 nextTriggerDate];

  return (NSDate *)v2;
}

- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:164 description:@"afterDate must not be nil"];

    if (v9) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:165 description:@"requestedDate must not be nil"];

LABEL_3:
  v10 = [(UNCalendarNotificationTrigger *)self dateComponents];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 calendar];
    if (!v12)
    {
      v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      objc_super v13 = [v11 timeZone];

      if (v13)
      {
        v14 = [v11 timeZone];
        [v12 setTimeZone:v14];
      }
    }
    if ([(UNNotificationTrigger *)self repeats]) {
      v15 = v7;
    }
    else {
      v15 = v9;
    }
    id v16 = v15;
    v17 = (void *)MEMORY[0x1B3E70390]();
    v18 = [v12 nextDateAfterDate:v16 matchingComponents:v11 options:512];
    if ([v18 compare:v7] != 1)
    {

      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UNCalendarNotificationTrigger;
  id v4 = a3;
  [(UNNotificationTrigger *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(UNCalendarNotificationTrigger *)self dateComponents];
  [v4 encodeObject:v5 forKey:@"matchingDateComponents"];
}

- (UNCalendarNotificationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNCalendarNotificationTrigger;
  unint64_t v5 = [(UNNotificationTrigger *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchingDateComponents"];
    uint64_t v7 = [v6 copy];
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v7;
  }
  return v5;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void).cxx_destruct
{
}

@end
@interface UNNotificationTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)repeats;
- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4;
- (UNNotificationTrigger)init;
- (UNNotificationTrigger)initWithCoder:(id)a3;
- (double)_retroactiveTriggerHysteresis;
- (id)_init;
- (id)_initWithRepeats:(BOOL)a3;
- (id)description;
- (id)nextTriggerDate;
- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4;
- (id)nextTriggerDateAfterLastTriggerDate:(id)a3 withRequestedDate:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationTrigger

- (UNNotificationTrigger)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:36 description:@"use subclasses"];

  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UNNotificationTrigger;
  return [(UNNotificationTrigger *)&v3 init];
}

- (id)_initWithRepeats:(BOOL)a3
{
  id result = [(UNNotificationTrigger *)self _init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (unint64_t)hash
{
  return [(UNNotificationTrigger *)self repeats];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(UNNotificationTrigger *)self repeats];
    int v6 = v5 ^ [v4 repeats] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(UNNotificationTrigger *)self repeats];
  BOOL v5 = NSStringFromBOOL();
  int v6 = [v3 stringWithFormat:@"<%@: %p; repeats: %@>", v4, self, v5];

  return v6;
}

- (id)nextTriggerDate
{
  objc_super v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [(UNNotificationTrigger *)self nextTriggerDateAfterDate:v3 withRequestedDate:v3];

  return v4;
}

- (id)nextTriggerDateAfterLastTriggerDate:(id)a3 withRequestedDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UNNotificationTrigger *)self _retroactiveTriggerHysteresis];
  v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v8];
  v10 = [v7 laterDate:v9];

  v11 = [(UNNotificationTrigger *)self nextTriggerDateAfterDate:v10 withRequestedDate:v6];

  return v11;
}

- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4
{
  return 0;
}

- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UNNotificationTrigger *)self repeats])
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = [(UNNotificationTrigger *)self nextTriggerDateAfterDate:v6 withRequestedDate:v7];
    BOOL v8 = v9 != 0;
  }
  return v8;
}

- (double)_retroactiveTriggerHysteresis
{
  return 900.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationTrigger repeats](self, "repeats"), @"repeats");
}

- (UNNotificationTrigger)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"repeats"];

  return (UNNotificationTrigger *)[(UNNotificationTrigger *)self _initWithRepeats:v4];
}

- (BOOL)repeats
{
  return self->_repeats;
}

@end
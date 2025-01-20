@interface UNTimeIntervalNotificationTrigger
+ (BOOL)supportsSecureCoding;
+ (UNTimeIntervalNotificationTrigger)triggerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats;
- (BOOL)isEqual:(id)a3;
- (NSDate)nextTriggerDate;
- (NSTimeInterval)timeInterval;
- (UNTimeIntervalNotificationTrigger)initWithCoder:(id)a3;
- (id)_initWithTimeInterval:(double)a3 repeats:(BOOL)a4;
- (id)description;
- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNTimeIntervalNotificationTrigger

+ (UNTimeIntervalNotificationTrigger)triggerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats
{
  v4 = (void *)[objc_alloc((Class)a1) _initWithTimeInterval:repeats repeats:timeInterval];

  return (UNTimeIntervalNotificationTrigger *)v4;
}

- (id)_initWithTimeInterval:(double)a3 repeats:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 60.0 && a4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:536 description:@"time interval must be at least 60 if repeating"];
  }
  if (a3 <= 0.0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:537 description:@"time interval must be greater than 0"];
  }
  v12.receiver = self;
  v12.super_class = (Class)UNTimeIntervalNotificationTrigger;
  id result = [(UNNotificationTrigger *)&v12 _initWithRepeats:v4];
  if (result) {
    *((double *)result + 2) = a3;
  }
  return result;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)UNTimeIntervalNotificationTrigger;
  unint64_t v3 = [(UNNotificationTrigger *)&v8 hash];
  BOOL v4 = NSNumber;
  [(UNTimeIntervalNotificationTrigger *)self timeInterval];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)UNTimeIntervalNotificationTrigger,
        [(UNNotificationTrigger *)&v10 isEqual:v4]))
  {
    [(UNTimeIntervalNotificationTrigger *)self timeInterval];
    double v6 = v5;
    [v4 timeInterval];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(UNNotificationTrigger *)self repeats];
  double v5 = NSStringFromBOOL();
  [(UNTimeIntervalNotificationTrigger *)self timeInterval];
  double v7 = [v3 stringWithFormat:@"<%@: %p; repeats: %@, timeInterval: %lf>", v4, self, v5, v6];

  return v7;
}

- (NSDate)nextTriggerDate
{
  v4.receiver = self;
  v4.super_class = (Class)UNTimeIntervalNotificationTrigger;
  v2 = [(UNNotificationTrigger *)&v4 nextTriggerDate];

  return (NSDate *)v2;
}

- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:569 description:@"date must not be nil"];

    if (v9) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2 object:self file:@"UNNotificationTrigger.m" lineNumber:570 description:@"requestedDate must not be nil"];

LABEL_3:
  objc_super v10 = [v7 laterDate:v9];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  [v9 timeIntervalSinceReferenceDate];
  double v14 = v13;
  [(UNTimeIntervalNotificationTrigger *)self timeInterval];
  double v16 = v15;
  BOOL v17 = [(UNNotificationTrigger *)self repeats];
  double v18 = 1.0;
  if (v17) {
    double v18 = (double)(uint64_t)((v12 - v14) / v16 + 1.0);
  }
  v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v14 + v18 * v16];
  if ([v19 compare:v7] != 1)
  {

    v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UNTimeIntervalNotificationTrigger;
  id v4 = a3;
  [(UNNotificationTrigger *)&v5 encodeWithCoder:v4];
  [(UNTimeIntervalNotificationTrigger *)self timeInterval];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeInterval");
}

- (UNTimeIntervalNotificationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UNTimeIntervalNotificationTrigger;
  objc_super v5 = [(UNNotificationTrigger *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timeInterval"];
    v5->_timeInterval = v6;
  }

  return v5;
}

- (NSTimeInterval)timeInterval
{
  return self->_timeInterval;
}

@end
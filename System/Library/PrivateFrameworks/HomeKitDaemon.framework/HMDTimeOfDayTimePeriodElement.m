@interface HMDTimeOfDayTimePeriodElement
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDTimeOfDayTimePeriodElement)initWithCoder:(id)a3;
- (HMDTimeOfDayTimePeriodElement)initWithDictionary:(id)a3;
- (HMDTimeOfDayTimePeriodElement)initWithHour:(unint64_t)a3 minute:(unint64_t)a4;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (unint64_t)hour;
- (unint64_t)minute;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDTimeOfDayTimePeriodElement

- (unint64_t)minute
{
  return self->_minute;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDTimeOfDayTimePeriodElement hour](self, "hour"));
  v5 = (void *)[v3 initWithName:@"Hour" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDTimeOfDayTimePeriodElement minute](self, "minute"));
  v8 = (void *)[v6 initWithName:@"Minute" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDTimeOfDayTimePeriodElement)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HMDTODTPE.ck.h"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HMDTODTPE.ck.m"];

  return [(HMDTimeOfDayTimePeriodElement *)self initWithHour:v5 minute:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDTimeOfDayTimePeriodElement hour](self, "hour"), @"HMDTODTPE.ck.h");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDTimeOfDayTimePeriodElement minute](self, "minute"), @"HMDTODTPE.ck.m");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6 && (unint64_t v7 = -[HMDTimeOfDayTimePeriodElement hour](self, "hour"), v7 == [v6 hour]))
  {
    unint64_t v8 = [(HMDTimeOfDayTimePeriodElement *)self minute];
    BOOL v9 = v8 == [v6 minute];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)serializedRegistrationForRemoteMessage
{
  v8.receiver = self;
  v8.super_class = (Class)HMDTimeOfDayTimePeriodElement;
  id v3 = [(HMDTimePeriodElement *)&v8 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDTimeOfDayTimePeriodElement hour](self, "hour"));
  [v4 setObject:v5 forKeyedSubscript:@"HMDTODTPE.ck.h"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDTimeOfDayTimePeriodElement minute](self, "minute"));
  [v4 setObject:v6 forKeyedSubscript:@"HMDTODTPE.ck.m"];

  return v4;
}

- (HMDTimeOfDayTimePeriodElement)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (v5)
  {
    unint64_t v7 = [v4 objectForKeyedSubscript:@"HMDTODTPE.ck.h"];
    uint64_t v8 = [v7 integerValue];

    BOOL v9 = [v4 objectForKeyedSubscript:@"HMDTODTPE.ck.m"];
    uint64_t v10 = [v9 integerValue];

    self = [(HMDTimeOfDayTimePeriodElement *)self initWithHour:v8 minute:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (HMDTimeOfDayTimePeriodElement)initWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDTimeOfDayTimePeriodElement;
  result = [(HMDTimeOfDayTimePeriodElement *)&v7 init];
  if (result)
  {
    result->_hour = a3;
    result->_minute = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDTODTPE.type";
}

@end
@interface HMPresenceEventActivation
+ (id)activationGranularityWithCoder:(id)a3;
+ (id)activationGranularityWithDict:(id)a3;
+ (id)activationGranularityWithMessage:(id)a3;
+ (id)activationGranularityWithNumber:(id)a3;
+ (id)activationGranularityWithValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMPresenceEventActivation)initWithNumber:(id)a3;
- (NSNumber)number;
- (id)description;
- (unint64_t)value;
- (void)addToCoder:(id)a3;
- (void)addToPayload:(id)a3;
@end

@implementation HMPresenceEventActivation

- (unint64_t)value
{
  return self->_value;
}

- (id)description
{
  v2 = NSString;
  v3 = HMPresenceEventActivationGranularityAsString([(HMPresenceEventActivation *)self value]);
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMPresenceEventActivation *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      unint64_t v7 = [(HMPresenceEventActivation *)self value];
      BOOL v8 = v7 == [(HMPresenceEventActivation *)v6 value];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (NSNumber)number
{
  v2 = NSNumber;
  unint64_t v3 = [(HMPresenceEventActivation *)self value];

  return (NSNumber *)[v2 numberWithUnsignedInteger:v3];
}

- (void)addToPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMPresenceEventActivation *)self number];
  [v4 setObject:v5 forKeyedSubscript:@"kPresenceEventActivationGranularity"];
}

- (void)addToCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMPresenceEventActivation *)self number];
  [v4 encodeObject:v5 forKey:@"kPresenceEventActivationGranularity"];
}

- (HMPresenceEventActivation)initWithNumber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMPresenceEventActivation;
    id v5 = [(HMPresenceEventActivation *)&v8 init];
    if (v5) {
      v5->_value = [v4 unsignedIntegerValue];
    }
    self = v5;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)activationGranularityWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"kPresenceEventActivationGranularity"];

  id v5 = +[HMPresenceEventActivation activationGranularityWithNumber:v4];

  return v5;
}

+ (id)activationGranularityWithDict:(id)a3
{
  id v3 = objc_msgSend(a3, "hmf_numberForKey:", @"kPresenceEventActivationGranularity");
  id v4 = +[HMPresenceEventActivation activationGranularityWithNumber:v3];

  return v4;
}

+ (id)activationGranularityWithMessage:(id)a3
{
  id v3 = [a3 numberForKey:@"kPresenceEventActivationGranularity"];
  id v4 = +[HMPresenceEventActivation activationGranularityWithNumber:v3];

  return v4;
}

+ (id)activationGranularityWithNumber:(id)a3
{
  id v3 = a3;
  id v4 = [[HMPresenceEventActivation alloc] initWithNumber:v3];

  return v4;
}

+ (id)activationGranularityWithValue:(unint64_t)a3
{
  id v4 = [HMPresenceEventActivation alloc];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [(HMPresenceEventActivation *)v4 initWithNumber:v5];

  return v6;
}

@end
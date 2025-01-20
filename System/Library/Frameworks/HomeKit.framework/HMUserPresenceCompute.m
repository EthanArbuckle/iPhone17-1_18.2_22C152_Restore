@interface HMUserPresenceCompute
+ (HMUserPresenceCompute)computeWithCoder:(id)a3;
+ (HMUserPresenceCompute)computeWithDict:(id)a3;
+ (HMUserPresenceCompute)computeWithMessage:(id)a3;
+ (HMUserPresenceCompute)computeWithNumber:(id)a3;
+ (HMUserPresenceCompute)computeWithValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMUserPresenceCompute)initWithNumber:(id)a3;
- (NSNumber)number;
- (id)description;
- (unint64_t)value;
- (void)addToCoder:(id)a3;
- (void)addToPayload:(id)a3;
@end

@implementation HMUserPresenceCompute

- (unint64_t)value
{
  return self->_value;
}

- (id)description
{
  v2 = NSString;
  v3 = HMUserPresenceComputeStatusAsString([(HMUserPresenceCompute *)self value]);
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMUserPresenceCompute *)a3;
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
      unint64_t v7 = [(HMUserPresenceCompute *)self value];
      BOOL v8 = v7 == [(HMUserPresenceCompute *)v6 value];
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
  unint64_t v3 = [(HMUserPresenceCompute *)self value];

  return (NSNumber *)[v2 numberWithUnsignedInteger:v3];
}

- (void)addToPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMUserPresenceCompute *)self number];
  [v4 setObject:v5 forKeyedSubscript:@"kUserPresenceComputeStatusKey"];
}

- (void)addToCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMUserPresenceCompute *)self number];
  [v4 encodeObject:v5 forKey:@"kUserPresenceComputeStatusKey"];
}

- (HMUserPresenceCompute)initWithNumber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMUserPresenceCompute;
    id v5 = [(HMUserPresenceCompute *)&v8 init];
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

+ (HMUserPresenceCompute)computeWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"kUserPresenceComputeStatusKey"];

  id v5 = +[HMUserPresenceCompute computeWithNumber:v4];

  return (HMUserPresenceCompute *)v5;
}

+ (HMUserPresenceCompute)computeWithDict:(id)a3
{
  id v3 = objc_msgSend(a3, "hmf_numberForKey:", @"kUserPresenceComputeStatusKey");
  id v4 = +[HMUserPresenceCompute computeWithNumber:v3];

  return (HMUserPresenceCompute *)v4;
}

+ (HMUserPresenceCompute)computeWithMessage:(id)a3
{
  id v3 = [a3 numberForKey:@"kUserPresenceComputeStatusKey"];
  id v4 = +[HMUserPresenceCompute computeWithNumber:v3];

  return (HMUserPresenceCompute *)v4;
}

+ (HMUserPresenceCompute)computeWithNumber:(id)a3
{
  id v3 = a3;
  id v4 = [[HMUserPresenceCompute alloc] initWithNumber:v3];

  return v4;
}

+ (HMUserPresenceCompute)computeWithValue:(unint64_t)a3
{
  id v4 = [HMUserPresenceCompute alloc];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [(HMUserPresenceCompute *)v4 initWithNumber:v5];

  return v6;
}

@end
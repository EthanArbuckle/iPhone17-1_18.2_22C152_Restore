@interface HMDUserPresenceRegion
+ (HMDUserPresenceRegion)regionWithCoder:(id)a3;
+ (HMDUserPresenceRegion)regionWithDict:(id)a3;
+ (HMDUserPresenceRegion)regionWithMessage:(id)a3;
+ (HMDUserPresenceRegion)regionWithNumber:(id)a3;
+ (HMDUserPresenceRegion)regionWithValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMDUserPresenceRegion)initWithNumber:(id)a3;
- (NSNumber)number;
- (id)description;
- (unint64_t)value;
- (void)addToCoder:(id)a3;
- (void)addToPayload:(id)a3;
@end

@implementation HMDUserPresenceRegion

- (unint64_t)value
{
  return self->_value;
}

- (id)description
{
  v2 = NSString;
  v3 = HMDUserPresenceRegionStatusAsString([(HMDUserPresenceRegion *)self value]);
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDUserPresenceRegion *)a3;
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
      unint64_t v7 = [(HMDUserPresenceRegion *)self value];
      BOOL v8 = v7 == [(HMDUserPresenceRegion *)v6 value];
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
  unint64_t v3 = [(HMDUserPresenceRegion *)self value];
  return (NSNumber *)[v2 numberWithUnsignedInteger:v3];
}

- (void)addToPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserPresenceRegion *)self number];
  [v4 setObject:v5 forKeyedSubscript:@"kUserPresenceRegionStatusKey"];
}

- (void)addToCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserPresenceRegion *)self number];
  [v4 encodeObject:v5 forKey:@"kUserPresenceRegionStatusKey"];
}

- (HMDUserPresenceRegion)initWithNumber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMDUserPresenceRegion;
    id v5 = [(HMDUserPresenceRegion *)&v8 init];
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

+ (HMDUserPresenceRegion)regionWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"kUserPresenceRegionStatusKey"];

  id v5 = +[HMDUserPresenceRegion regionWithNumber:v4];

  return (HMDUserPresenceRegion *)v5;
}

+ (HMDUserPresenceRegion)regionWithDict:(id)a3
{
  id v3 = objc_msgSend(a3, "hmf_numberForKey:", @"kUserPresenceRegionStatusKey");
  id v4 = +[HMDUserPresenceRegion regionWithNumber:v3];

  return (HMDUserPresenceRegion *)v4;
}

+ (HMDUserPresenceRegion)regionWithMessage:(id)a3
{
  id v3 = [a3 numberForKey:@"kUserPresenceRegionStatusKey"];
  id v4 = +[HMDUserPresenceRegion regionWithNumber:v3];

  return (HMDUserPresenceRegion *)v4;
}

+ (HMDUserPresenceRegion)regionWithNumber:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDUserPresenceRegion alloc] initWithNumber:v3];

  return v4;
}

+ (HMDUserPresenceRegion)regionWithValue:(unint64_t)a3
{
  id v4 = [HMDUserPresenceRegion alloc];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [(HMDUserPresenceRegion *)v4 initWithNumber:v5];

  return v6;
}

@end
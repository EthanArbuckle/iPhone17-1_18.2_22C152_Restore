@interface HMUserPresenceAuthorization
+ (id)authWithCoder:(id)a3;
+ (id)authWithDict:(id)a3;
+ (id)authWithMessage:(id)a3;
+ (id)authWithNumber:(id)a3;
+ (id)authWithValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMUserPresenceAuthorization)initWithNumber:(id)a3;
- (NSNumber)number;
- (id)description;
- (unint64_t)value;
- (void)addToCoder:(id)a3;
- (void)addToPayload:(id)a3;
@end

@implementation HMUserPresenceAuthorization

- (unint64_t)value
{
  return self->_value;
}

- (id)description
{
  v2 = NSString;
  v3 = HMUserPresenceAuthorizationStatusAsString([(HMUserPresenceAuthorization *)self value]);
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMUserPresenceAuthorization *)a3;
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
      unint64_t v7 = [(HMUserPresenceAuthorization *)self value];
      BOOL v8 = v7 == [(HMUserPresenceAuthorization *)v6 value];
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
  unint64_t v3 = [(HMUserPresenceAuthorization *)self value];

  return (NSNumber *)[v2 numberWithUnsignedInteger:v3];
}

- (void)addToPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMUserPresenceAuthorization *)self number];
  [v4 setObject:v5 forKeyedSubscript:@"kUserPresenceAuthorizationStatusKey"];
}

- (void)addToCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMUserPresenceAuthorization *)self number];
  [v4 encodeObject:v5 forKey:@"kUserPresenceAuthorizationStatusKey"];
}

- (HMUserPresenceAuthorization)initWithNumber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMUserPresenceAuthorization;
    id v5 = [(HMUserPresenceAuthorization *)&v8 init];
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

+ (id)authWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"kUserPresenceAuthorizationStatusKey"];

  id v5 = +[HMUserPresenceAuthorization authWithNumber:v4];

  return v5;
}

+ (id)authWithDict:(id)a3
{
  id v3 = objc_msgSend(a3, "hmf_numberForKey:", @"kUserPresenceAuthorizationStatusKey");
  id v4 = +[HMUserPresenceAuthorization authWithNumber:v3];

  return v4;
}

+ (id)authWithMessage:(id)a3
{
  id v3 = [a3 numberForKey:@"kUserPresenceAuthorizationStatusKey"];
  id v4 = +[HMUserPresenceAuthorization authWithNumber:v3];

  return v4;
}

+ (id)authWithNumber:(id)a3
{
  id v3 = a3;
  id v4 = [[HMUserPresenceAuthorization alloc] initWithNumber:v3];

  return v4;
}

+ (id)authWithValue:(unint64_t)a3
{
  id v4 = [HMUserPresenceAuthorization alloc];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [(HMUserPresenceAuthorization *)v4 initWithNumber:v5];

  return v6;
}

@end
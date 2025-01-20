@interface HMDUserPresenceUpdateReason
+ (HMDUserPresenceUpdateReason)reasonWithCoder:(id)a3;
+ (HMDUserPresenceUpdateReason)reasonWithDict:(id)a3;
+ (HMDUserPresenceUpdateReason)reasonWithMessage:(id)a3;
+ (HMDUserPresenceUpdateReason)reasonWithNumber:(id)a3;
+ (HMDUserPresenceUpdateReason)reasonWithValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMDUserPresenceUpdateReason)initWithNumber:(id)a3;
- (NSNumber)number;
- (id)description;
- (unint64_t)value;
- (void)addToCoder:(id)a3;
- (void)addToPayload:(id)a3;
@end

@implementation HMDUserPresenceUpdateReason

- (unint64_t)value
{
  return self->_value;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(HMDUserPresenceUpdateReason *)self value];
  if (v3 - 2 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDUserPresenceUpdateReasonStatus %tu", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E6A19608[v3 - 2];
  }
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDUserPresenceUpdateReason *)a3;
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
      unint64_t v7 = [(HMDUserPresenceUpdateReason *)self value];
      BOOL v8 = v7 == [(HMDUserPresenceUpdateReason *)v6 value];
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
  unint64_t v3 = [(HMDUserPresenceUpdateReason *)self value];
  return (NSNumber *)[v2 numberWithUnsignedInteger:v3];
}

- (void)addToPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserPresenceUpdateReason *)self number];
  [v4 setObject:v5 forKeyedSubscript:@"kUserPresenceStatusUpdateReasonKey"];
}

- (void)addToCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserPresenceUpdateReason *)self number];
  [v4 encodeObject:v5 forKey:@"kUserPresenceStatusUpdateReasonKey"];
}

- (HMDUserPresenceUpdateReason)initWithNumber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMDUserPresenceUpdateReason;
    id v5 = [(HMDUserPresenceUpdateReason *)&v8 init];
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

+ (HMDUserPresenceUpdateReason)reasonWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"kUserPresenceStatusUpdateReasonKey"];

  id v5 = +[HMDUserPresenceUpdateReason reasonWithNumber:v4];

  return (HMDUserPresenceUpdateReason *)v5;
}

+ (HMDUserPresenceUpdateReason)reasonWithDict:(id)a3
{
  id v3 = objc_msgSend(a3, "hmf_numberForKey:", @"kUserPresenceStatusUpdateReasonKey");
  id v4 = +[HMDUserPresenceUpdateReason reasonWithNumber:v3];

  return (HMDUserPresenceUpdateReason *)v4;
}

+ (HMDUserPresenceUpdateReason)reasonWithMessage:(id)a3
{
  id v3 = [a3 numberForKey:@"kUserPresenceStatusUpdateReasonKey"];
  id v4 = +[HMDUserPresenceUpdateReason reasonWithNumber:v3];

  return (HMDUserPresenceUpdateReason *)v4;
}

+ (HMDUserPresenceUpdateReason)reasonWithNumber:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDUserPresenceUpdateReason alloc] initWithNumber:v3];

  return v4;
}

+ (HMDUserPresenceUpdateReason)reasonWithValue:(unint64_t)a3
{
  id v4 = [HMDUserPresenceUpdateReason alloc];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [(HMDUserPresenceUpdateReason *)v4 initWithNumber:v5];

  return v6;
}

@end
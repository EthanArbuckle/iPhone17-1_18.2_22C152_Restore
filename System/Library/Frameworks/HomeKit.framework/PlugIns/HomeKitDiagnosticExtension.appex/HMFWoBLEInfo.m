@interface HMFWoBLEInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMFWoBLEInfo)initWithBLEIdentifier:(id)a3;
- (HMFWoBLEInfo)initWithCoder:(id)a3;
- (NSData)bleIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFWoBLEInfo

- (void).cxx_destruct
{
}

- (NSData)bleIdentifier
{
  return self->_bleIdentifier;
}

- (id)description
{
  v2 = [(HMFWoBLEInfo *)self bleIdentifier];
  v3 = +[NSString stringWithFormat:@"<BTLE Identifier: %@>", v2];

  return v3;
}

- (HMFWoBLEInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFCI.woBLE.ID"];

  v6 = [(HMFWoBLEInfo *)self initWithBLEIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFWoBLEInfo *)self bleIdentifier];
  [v4 encodeObject:v5 forKey:@"HMFCI.woBLE.ID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMFWoBLEInfo *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMFWoBLEInfo *)self bleIdentifier];
      v8 = [(HMFWoBLEInfo *)v6 bleIdentifier];
      char v9 = HMFEqualObjects();
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMFWoBLEInfo *)self bleIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (HMFWoBLEInfo)initWithBLEIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFWoBLEInfo;
  v6 = [(HMFWoBLEInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bleIdentifier, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
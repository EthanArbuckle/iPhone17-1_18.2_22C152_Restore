@interface HMDResidentReachabilityState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachable;
- (HMDResidentReachabilityState)initWithCoder:(id)a3;
- (HMDResidentReachabilityState)initWithResidentDeviceIdentifier:(id)a3 isReachable:(BOOL)a4;
- (NSUUID)residentDeviceIdentifier;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDResidentReachabilityState

- (void).cxx_destruct
{
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (NSUUID)residentDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDResidentReachabilityState *)self residentDeviceIdentifier];
  v5 = (void *)[v3 initWithName:@"Resident device identifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDResidentReachabilityState *)self isReachable];
  v7 = HMFBooleanToString();
  v8 = (void *)[v6 initWithName:@"IsReachable" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDResidentReachabilityState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"isReachable"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"residentDeviceIdentifier"];

  if (v6)
  {
    self = [(HMDResidentReachabilityState *)self initWithResidentDeviceIdentifier:v6 isReachable:v5];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(HMDResidentReachabilityState *)self residentDeviceIdentifier];
  [v5 encodeObject:v4 forKey:@"residentDeviceIdentifier"];

  objc_msgSend(v5, "encodeBool:forKey:", -[HMDResidentReachabilityState isReachable](self, "isReachable"), @"isReachable");
}

- (unint64_t)hash
{
  uint64_t v3 = [(HMDResidentReachabilityState *)self isReachable];
  id v4 = [(HMDResidentReachabilityState *)self residentDeviceIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMDResidentReachabilityState *)self residentDeviceIdentifier];
    v8 = [v6 residentDeviceIdentifier];
    if ([v7 isEqual:v8])
    {
      BOOL v9 = [(HMDResidentReachabilityState *)self isReachable];
      int v10 = v9 ^ [v6 isReachable] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (HMDResidentReachabilityState)initWithResidentDeviceIdentifier:(id)a3 isReachable:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDResidentReachabilityState;
  v7 = [(HMDResidentReachabilityState *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    residentDeviceIdentifier = v7->_residentDeviceIdentifier;
    v7->_residentDeviceIdentifier = (NSUUID *)v8;

    v7->_isReachable = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
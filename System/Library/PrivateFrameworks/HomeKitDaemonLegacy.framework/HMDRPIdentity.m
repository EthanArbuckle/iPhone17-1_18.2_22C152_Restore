@interface HMDRPIdentity
+ (BOOL)supportsSecureCoding;
+ (id)identityWithRPIdentity:(id)a3;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRPIndentity:(id)a3;
- (HMDRPIdentity)init;
- (HMDRPIdentity)initWithCoder:(id)a3;
- (HMDRPIdentity)initWithDeviceIRK:(id)a3;
- (HMFKey)deviceIRK;
- (id)logIdentifier;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDRPIdentity

- (void).cxx_destruct
{
}

- (HMFKey)deviceIRK
{
  return (HMFKey *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRPIdentity *)self deviceIRK];
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F2D0A8]];
}

- (HMDRPIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2D0A8]];

  v6 = [(HMDRPIdentity *)self initWithDeviceIRK:v5];
  return v6;
}

- (id)logIdentifier
{
  v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (BOOL)isEqualToRPIndentity:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRPIdentity *)self deviceIRK];
  v6 = [v4 deviceIRKData];

  LOBYTE(v4) = [v5 isEqualToData:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDRPIdentity *)a3;
  if (v4 == self)
  {
    char v10 = 1;
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
    v7 = v6;
    if (v6)
    {
      v8 = [(HMDRPIdentity *)v6 deviceIRK];
      v9 = [(HMDRPIdentity *)self deviceIRK];
      char v10 = HMFEqualObjects();
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  v2 = [(HMDRPIdentity *)self deviceIRK];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)shortDescription
{
  v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (HMDRPIdentity)initWithDeviceIRK:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDRPIdentity;
    id v5 = [(HMDRPIdentity *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      deviceIRK = v5->_deviceIRK;
      v5->_deviceIRK = (HMFKey *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HMDRPIdentity)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_75393 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_75393, &__block_literal_global_75394);
  }
  v2 = (void *)logCategory__hmf_once_v2_75395;
  return v2;
}

uint64_t __28__HMDRPIdentity_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_75395;
  logCategory__hmf_once_v2_75395 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)identityWithRPIdentity:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F65460];
    id v4 = a3;
    id v5 = [v3 alloc];
    uint64_t v6 = *MEMORY[0x1E4F64EE8];
    uint64_t v7 = *MEMORY[0x1E4F64EE0];
    v8 = [v4 deviceIRKData];

    v9 = (void *)[v5 initWithType:v6 size:v7 data:v8];
    objc_super v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDeviceIRK:v9];
  }
  else
  {
    objc_super v10 = 0;
  }
  return v10;
}

@end
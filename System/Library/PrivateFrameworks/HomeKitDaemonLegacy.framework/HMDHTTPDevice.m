@interface HMDHTTPDevice
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMDHTTPDevice)init;
- (HMDHTTPDevice)initWithIdentifier:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSUUID)identifier;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)logIdentifier;
- (id)shortDescription;
- (unint64_t)hash;
@end

@implementation HMDHTTPDevice

- (void).cxx_destruct
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)logIdentifier
{
  v2 = [(HMDHTTPDevice *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDHTTPDevice *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HMDHTTPDevice *)v4 identifier];
      v6 = [(HMDHTTPDevice *)self identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMDHTTPDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(HMDHTTPDevice *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDHTTPDevice *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = NSString;
  v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v7 = &stru_1F2C9F1A8;
  }
  v8 = [(HMDHTTPDevice *)self identifier];
  v9 = [v8 UUIDString];
  v10 = [v5 stringWithFormat:@"<%@%@, Identifier = %@>", v6, v7, v9];

  if (v3) {
  return v10;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDHTTPDevice *)self identifier];
  v6 = [v5 UUIDString];
  char v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (HMDHTTPDevice)initWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDHTTPDevice;
    v5 = [(HMDHTTPDevice *)&v14 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = +[HMDHTTPDevice description];
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%@] A valid identifier is required", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (HMDHTTPDevice)init
{
  BOOL v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [(HMDHTTPDevice *)self initWithIdentifier:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_43301 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_43301, &__block_literal_global_43302);
  }
  v2 = (void *)logCategory__hmf_once_v2_43303;
  return v2;
}

uint64_t __28__HMDHTTPDevice_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_43303;
  logCategory__hmf_once_v2_43303 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
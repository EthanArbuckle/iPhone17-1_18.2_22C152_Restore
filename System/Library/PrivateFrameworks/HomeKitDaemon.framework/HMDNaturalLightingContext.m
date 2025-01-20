@interface HMDNaturalLightingContext
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMDNaturalLightingContext)initWithCoder:(id)a3;
- (HMDNaturalLightingContext)initWithCurve:(id)a3 timeZone:(id)a4;
- (HMDNaturalLightingCurve)curve;
- (NSTimeZone)timeZone;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDNaturalLightingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_curve, 0);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 16, 1);
}

- (HMDNaturalLightingCurve)curve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDNaturalLightingContext *)self curve];
  v5 = (void *)[v3 initWithName:@"Curve" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDNaturalLightingContext *)self timeZone];
  v8 = (void *)[v6 initWithName:@"Time Zone" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [(HMDNaturalLightingContext *)self curve];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDNaturalLightingContext *)self timeZone];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 curve];
    v9 = [(HMDNaturalLightingContext *)self curve];
    if ([v8 isEqual:v9])
    {
      v10 = [v7 timeZone];
      v11 = [v7 timeZone];
      char v12 = [v10 isEqual:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDNaturalLightingContext *)self curve];
  [v4 encodeObject:v5 forKey:@"HHNLC.cck"];

  id v6 = [(HMDNaturalLightingContext *)self timeZone];
  [v4 encodeObject:v6 forKey:@"HHNLC.tzk"];
}

- (HMDNaturalLightingContext)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HHNLC.cck"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HHNLC.tzk"];
    if (v6)
    {
      v7 = [(HMDNaturalLightingContext *)self initWithCurve:v5 timeZone:v6];
      v8 = v7;
    }
    else
    {
      char v12 = (void *)MEMORY[0x230FBD990]();
      v7 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        int v16 = 138543362;
        v17 = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode time zone", (uint8_t *)&v16, 0xCu);
      }
      v8 = 0;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode curve", (uint8_t *)&v16, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (HMDNaturalLightingContext)initWithCurve:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDNaturalLightingContext;
  v8 = [(HMDNaturalLightingContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    curve = v8->_curve;
    v8->_curve = (HMDNaturalLightingCurve *)v9;

    uint64_t v11 = [v7 copy];
    timeZone = v8->_timeZone;
    v8->_timeZone = (NSTimeZone *)v11;
  }
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_254801 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_254801, &__block_literal_global_254802);
  }
  v2 = (void *)logCategory__hmf_once_v4_254803;
  return v2;
}

void __40__HMDNaturalLightingContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_254803;
  logCategory__hmf_once_v4_254803 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
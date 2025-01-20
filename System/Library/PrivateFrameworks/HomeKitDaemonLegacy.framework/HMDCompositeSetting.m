@interface HMDCompositeSetting
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeSetting)initWithReadVersion:(id)a3 writeVersion:(id)a4;
- (HMFVersion)readVersion;
- (HMFVersion)writeVersion;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeVersion, 0);
  objc_storeStrong((id *)&self->_readVersion, 0);
}

- (HMFVersion)writeVersion
{
  return (HMFVersion *)objc_getProperty(self, a2, 16, 1);
}

- (HMFVersion)readVersion
{
  return (HMFVersion *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqualValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMDCompositeSetting *)self readVersion];
  v5 = (void *)[v3 initWithName:@"readVersion" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDCompositeSetting *)self writeVersion];
  v8 = (void *)[v6 initWithName:@"writeVersion" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDCompositeSetting *)a3;
  if (v4 == self)
  {
    char v11 = 1;
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
    id v6 = v5;
    v7 = [(HMDCompositeSetting *)v6 readVersion];
    v8 = [(HMDCompositeSetting *)self readVersion];
    if ([v7 isEqualToVersion:v8])
    {
      v9 = [(HMDCompositeSetting *)v6 writeVersion];
      id v10 = [(HMDCompositeSetting *)self writeVersion];
      char v11 = [v9 isEqualToVersion:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (HMDCompositeSetting)initWithReadVersion:(id)a3 writeVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCompositeSetting;
  v8 = [(HMDCompositeSetting *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v6];
    readVersion = v8->_readVersion;
    v8->_readVersion = (HMFVersion *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v7];
    writeVersion = v8->_writeVersion;
    v8->_writeVersion = (HMFVersion *)v11;
  }
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_27793 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_27793, &__block_literal_global_27794);
  }
  v2 = (void *)logCategory__hmf_once_v2_27795;
  return v2;
}

uint64_t __34__HMDCompositeSetting_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_27795;
  logCategory__hmf_once_v2_27795 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
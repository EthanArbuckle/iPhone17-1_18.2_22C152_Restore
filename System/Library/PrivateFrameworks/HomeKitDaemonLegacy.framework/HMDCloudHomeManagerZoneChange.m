@interface HMDCloudHomeManagerZoneChange
- (HMDCloudHomeManagerZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4;
@end

@implementation HMDCloudHomeManagerZoneChange

- (HMDCloudHomeManagerZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDCloudHomeManagerZoneChange;
    v9 = [(HMDCloudZoneChange *)&v15 initWithZone:v8 temporaryCache:v4];
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not a home manager zone %@", buf, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

@end
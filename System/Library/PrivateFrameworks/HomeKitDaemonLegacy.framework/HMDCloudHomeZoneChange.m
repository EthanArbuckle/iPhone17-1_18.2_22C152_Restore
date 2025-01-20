@interface HMDCloudHomeZoneChange
- (HMDCloudHomeZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4;
@end

@implementation HMDCloudHomeZoneChange

- (HMDCloudHomeZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
    v14.receiver = self;
    v14.super_class = (Class)HMDCloudHomeZoneChange;
    self = [(HMDCloudZoneChange *)&v14 initWithZone:v8 temporaryCache:v4];
    v9 = self;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Not a home zone %@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

@end
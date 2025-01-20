@interface __HMDExtensionApplicationInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstalled;
- (__HMDExtensionApplicationInfo)initWithRecord:(id)a3;
- (id)attributeDescriptions;
- (id)hostApplicationInfo;
- (id)vendorIdentifier;
@end

@implementation __HMDExtensionApplicationInfo

- (void).cxx_destruct
{
}

- (id)hostApplicationInfo
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isInstalled
{
  v2 = [(__HMDExtensionApplicationInfo *)self hostApplicationInfo];
  v3 = v2;
  if (v2) {
    char v4 = [v2 isInstalled];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)vendorIdentifier
{
  v8.receiver = self;
  v8.super_class = (Class)__HMDExtensionApplicationInfo;
  v3 = [(HMDApplicationInfo *)&v8 vendorIdentifier];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(__HMDExtensionApplicationInfo *)self hostApplicationInfo];
    id v5 = [v6 vendorIdentifier];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (__HMDExtensionApplicationInfo *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)__HMDExtensionApplicationInfo;
    if ([(HMDApplicationInfo *)&v12 isEqual:v4])
    {
      id v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      v7 = v6;

      if (v7)
      {
        objc_super v8 = [(HMDApplicationInfo *)self bundleURL];
        v9 = [(HMDApplicationInfo *)v7 bundleURL];
        char v10 = HMFEqualObjects();
      }
      else
      {
        char v10 = 1;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)__HMDExtensionApplicationInfo;
  v3 = [(HMDApplicationInfo *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v5 = [(__HMDExtensionApplicationInfo *)self hostApplicationInfo];
  v6 = (void *)[v4 initWithName:@"Host Application" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  objc_super v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (__HMDExtensionApplicationInfo)initWithRecord:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v26.receiver = self;
    v26.super_class = (Class)__HMDExtensionApplicationInfo;
    id v5 = [(__HMDBundleApplicationInfo *)&v26 initWithRecord:v4];
    if (v5)
    {
      v6 = [v4 containingBundleRecord];
      v7 = (void *)MEMORY[0x1D9452090]();
      objc_super v8 = v5;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_super v10 = HMFGetLogIdentifier();
        v11 = [v4 bundleIdentifier];
        objc_super v12 = [v4 effectiveBundleIdentifier];
        *(_DWORD *)buf = 138544130;
        v28 = v10;
        __int16 v29 = 2112;
        id v30 = v6;
        __int16 v31 = 2112;
        v32 = v11;
        __int16 v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@container: %@/ bundleID: %@, effective bundle id: %@", buf, 0x2Au);
      }
      uint64_t v13 = [v4 bundleIdentifier];
      bundleIdentifier = v8->super.super._bundleIdentifier;
      v8->super.super._bundleIdentifier = (NSString *)v13;

      id v15 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        v18 = (void *)MEMORY[0x1D9452090]();
        v19 = v8;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v28 = v21;
          __int16 v29 = 2112;
          id v30 = v17;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@host record: %@", buf, 0x16u);
        }
        v22 = [[__HMDApplicationInfo alloc] initWithRecord:v17];
        hostApplicationInfo = v19->_hostApplicationInfo;
        v19->_hostApplicationInfo = &v22->super.super;
      }
    }
    self = v5;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
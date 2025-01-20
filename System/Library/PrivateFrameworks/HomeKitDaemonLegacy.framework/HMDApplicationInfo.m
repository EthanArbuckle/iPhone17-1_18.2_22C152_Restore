@interface HMDApplicationInfo
+ (NSData)privateVendorIdentifier;
+ (id)applicationInfoForBundleIdentifier:(id)a3;
+ (id)applicationInfoForBundleURL:(id)a3;
+ (id)logCategory;
- (BOOL)isEntitledForAPIAccess;
- (BOOL)isEntitledForSPIAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstalled;
- (HMDApplicationInfo)hostApplicationInfo;
- (HMDApplicationInfo)init;
- (HMDApplicationInfo)initWithBundleIdentifier:(id)a3 bundleURL:(id)a4;
- (NSArray)processes;
- (NSData)vendorIdentifier;
- (NSString)bundleIdentifier;
- (NSURL)bundleURL;
- (id)attributeDescriptions;
- (id)clientIdentifierSalt:(id *)a3;
- (id)shortDescription;
- (unint64_t)hash;
- (void)addProcess:(id)a3;
- (void)removeProcess:(id)a3;
@end

@implementation HMDApplicationInfo

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDApplicationInfo *)self bundleIdentifier];
  v5 = (void *)[v3 initWithName:@"Bundle Identifier" value:v4];
  v12[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDApplicationInfo *)self vendorIdentifier];
  v8 = [MEMORY[0x1E4F65538] defaultFormatter];
  v9 = (void *)[v6 initWithName:@"Vendor Identifier" value:v7 options:1 formatter:v8];
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)vendorIdentifier
{
  if ([(HMDApplicationInfo *)self isEntitledForSPIAccess])
  {
    id v3 = +[HMDApplicationInfo privateVendorIdentifier];
  }
  else
  {
    v4 = +[HMDApplicationVendorIDStore sharedStore];
    v5 = [(HMDApplicationInfo *)self bundleIdentifier];
    id v3 = [v4 vendorIDForApplication:v5];
  }
  return (NSData *)v3;
}

+ (NSData)privateVendorIdentifier
{
  return (NSData *)[@"29E1AAEC-B83A-445E-920E-582C3E9DFF99" dataUsingEncoding:4];
}

- (NSURL)bundleURL
{
  bundleURL = self->_bundleURL;
  if (!bundleURL)
  {
    v4 = (void *)MEMORY[0x1E4F28B50];
    v5 = [(HMDApplicationInfo *)self bundleIdentifier];
    id v6 = [v4 bundleWithIdentifier:v5];

    v7 = [v6 bundleURL];
    v8 = self->_bundleURL;
    self->_bundleURL = v7;

    bundleURL = self->_bundleURL;
  }
  return bundleURL;
}

- (void)addProcess:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSHashTable *)self->_processes addObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

+ (id)applicationInfoForBundleURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v16 = 0;
    goto LABEL_11;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithURL:v4 error:0];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = a1;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v20 = v9;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Initializing application info with URL: %@, extension: %@", buf, 0x20u);
  }
  id v18 = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithURL:v4 allowPlaceholder:0 error:&v18];
  id v11 = v18;
  v12 = [v10 applicationState];
  int v13 = [v12 isValid];

  if (v13)
  {
    v14 = [__HMDApplicationInfo alloc];
    v15 = v10;
  }
  else
  {
    if (!v5)
    {
      v16 = 0;
      goto LABEL_10;
    }
    v14 = [__HMDExtensionApplicationInfo alloc];
    v15 = v5;
  }
  v16 = [(__HMDApplicationInfo *)v14 initWithRecord:v15];
LABEL_10:

LABEL_11:
  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_83492 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_83492, &__block_literal_global_83493);
  }
  v2 = (void *)logCategory__hmf_once_v7_83494;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)removeProcess:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSHashTable *)self->_processes removeObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (NSArray)processes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSHashTable *)self->_processes allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)clientIdentifierSalt:(id *)a3
{
  if ([(HMDApplicationInfo *)self isEntitledForSPIAccess])
  {
    id v5 = +[HMDProcessInfo privateClientIdentifierSalt];
    goto LABEL_12;
  }
  id v6 = [(HMDApplicationInfo *)self vendorIdentifier];
  if (v6)
  {
    uint64_t v7 = +[HMDHomeManager createIdentifierSalt:v6 deviceSpecific:1];
    id v5 = (void *)v7;
    if (!a3 || v7) {
      goto LABEL_11;
    }
    v8 = @"Unable to generate device specific salt.";
  }
  else
  {
    if (!a3)
    {
      id v5 = 0;
      goto LABEL_11;
    }
    v8 = @"Unable to determine vendor identifier.";
  }
  [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:0 reason:v8 suggestion:0];
  id v5 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v5;
}

- (BOOL)isEntitledForSPIAccess
{
  return 0;
}

- (BOOL)isEntitledForAPIAccess
{
  return 0;
}

- (BOOL)isInstalled
{
  return 0;
}

- (HMDApplicationInfo)hostApplicationInfo
{
  return 0;
}

- (id)shortDescription
{
  v2 = NSString;
  id v3 = [(HMDApplicationInfo *)self bundleIdentifier];
  id v4 = [v2 stringWithFormat:@"Application %@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDApplicationInfo *)a3;
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
    id v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMDApplicationInfo *)self bundleIdentifier];
      v8 = [(HMDApplicationInfo *)v6 bundleIdentifier];
      char v9 = [v7 isEqualToString:v8];
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
  v2 = [(HMDApplicationInfo *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMDApplicationInfo)initWithBundleIdentifier:(id)a3 bundleURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v17 = (HMDApplicationInfo *)_HMFPreconditionFailure();
    [(HMDApplicationInfo *)v17 init];
  }
  v8 = v7;
  v19.receiver = self;
  v19.super_class = (Class)HMDApplicationInfo;
  char v9 = [(HMDApplicationInfo *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    bundleURL = v9->_bundleURL;
    v9->_bundleURL = (NSURL *)v10;

    uint64_t v12 = [v6 copy];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v12;

    v9->_independent = 1;
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    processes = v9->_processes;
    v9->_processes = (NSHashTable *)v14;
  }
  return v9;
}

- (HMDApplicationInfo)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

uint64_t __33__HMDApplicationInfo_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_83494;
  logCategory__hmf_once_v7_83494 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)applicationInfoForBundleIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v16 = 0;
    goto LABEL_11;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v4 error:0];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = a1;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v20 = v9;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Initializing application info with URL: %@, extension: %@", buf, 0x20u);
  }
  id v18 = 0;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v18];
  id v11 = v18;
  uint64_t v12 = [v10 applicationState];
  int v13 = [v12 isValid];

  if (v13)
  {
    uint64_t v14 = [__HMDApplicationInfo alloc];
    v15 = v10;
  }
  else
  {
    if (!v5)
    {
      v16 = 0;
      goto LABEL_10;
    }
    uint64_t v14 = [__HMDExtensionApplicationInfo alloc];
    v15 = v5;
  }
  v16 = [(__HMDApplicationInfo *)v14 initWithRecord:v15];
LABEL_10:

LABEL_11:
  return v16;
}

@end
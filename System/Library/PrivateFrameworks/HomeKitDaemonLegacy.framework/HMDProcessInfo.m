@interface HMDProcessInfo
+ (NSData)privateClientIdentifierSalt;
+ (id)locationAuthorizationFromEffectiveBundleIdentifier:(id)a3 processInfo:(id)a4;
+ (id)logCategory;
- (BOOL)isBackgroundUpgradedToForeground;
- (BOOL)isBackgrounded;
- (BOOL)isEntitledForAPIAccess;
- (BOOL)isEntitledForSPIAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForegrounded;
- (BOOL)isSuspended;
- (BOOL)isTerminated;
- (BOOL)shouldMonitor;
- (HMDApplicationInfo)applicationInfo;
- (HMDProcessInfo)init;
- (HMDProcessInfo)initWithAuditToken:(id *)a3;
- (HMFLocationAuthorization)locationAuthorization;
- (NSString)bundleIdentifier;
- (RBSProcessHandle)processHandle;
- (id)attributeDescriptions;
- (id)clientIdentifierSalt:(id *)a3;
- (id)logIdentifier;
- (unint64_t)state;
- (void)setState:(unint64_t)a3;
@end

@implementation HMDProcessInfo

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (BOOL)isBackgrounded
{
  unint64_t v3 = [(HMDProcessInfo *)self state];
  if (v3 != 1) {
    LOBYTE(v3) = ![(HMDProcessInfo *)self isEntitledForSPIAccess]
  }
              && [(HMDProcessInfo *)self state] == -1;
  return v3;
}

- (BOOL)isEntitledForSPIAccess
{
  return self->_entitledForSPIAccess;
}

- (BOOL)isTerminated
{
  return [(HMDProcessInfo *)self state] == 4;
}

- (id)attributeDescriptions
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HMDProcessInfo;
  unint64_t v3 = [(HMFProcessInfo *)&v18 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v5 = [(HMDProcessInfo *)self state];
  if (v5 > 4) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E6A12288[v5];
  }
  v7 = v6;
  v8 = (void *)[v4 initWithName:@"State" value:v7];
  v19[0] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDProcessInfo *)self shouldMonitor];
  v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"Monitored" value:v10];
  v19[1] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMDProcessInfo *)self applicationInfo];
  v14 = (void *)[v12 initWithName:@"Application" value:v13 options:1 formatter:0];
  v19[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v16 = [v3 arrayByAddingObjectsFromArray:v15];

  return v16;
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(&p_lock->lock);
  return state;
}

- (BOOL)shouldMonitor
{
  v2 = [(HMDProcessInfo *)self applicationInfo];

  return v2 != 0;
}

- (HMDApplicationInfo)applicationInfo
{
  return (HMDApplicationInfo *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isSuspended
{
  return [(HMDProcessInfo *)self state] == 3;
}

- (void)setState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t state = a3;
  os_unfair_lock_unlock(&p_lock->lock);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDProcessInfo *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDProcessInfo;
    if ([(HMFProcessInfo *)&v13 isEqual:v4])
    {
      unint64_t v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      v7 = v6;

      BOOL v11 = 1;
      if (v7)
      {
        v8 = [(HMDProcessInfo *)self applicationInfo];
        id v9 = [(HMDProcessInfo *)v7 applicationInfo];
        int v10 = HMFEqualObjects();

        if (!v10) {
          BOOL v11 = 0;
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)clientIdentifierSalt:(id *)a3
{
  if ([(HMDProcessInfo *)self isEntitledForSPIAccess])
  {
    unint64_t v5 = +[HMDProcessInfo privateClientIdentifierSalt];
  }
  else
  {
    v6 = [(HMDProcessInfo *)self applicationInfo];
    v7 = v6;
    if (v6)
    {
      unint64_t v5 = [v6 clientIdentifierSalt:a3];
    }
    else if (a3)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:0 reason:@"Cannot generate client identifier for non-application process." suggestion:0];
      unint64_t v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  return v5;
}

+ (NSData)privateClientIdentifierSalt
{
  if (privateClientIdentifierSalt_onceToken != -1) {
    dispatch_once(&privateClientIdentifierSalt_onceToken, &__block_literal_global_164592);
  }
  v2 = (void *)privateClientIdentifierSalt_privateClientIdentifierSalt;
  return (NSData *)v2;
}

- (HMFLocationAuthorization)locationAuthorization
{
  return (HMFLocationAuthorization *)objc_getProperty(self, a2, 96, 1);
}

+ (id)locationAuthorizationFromEffectiveBundleIdentifier:(id)a3 processInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (((__HMDProcessInfoBoolForEntitlement(v6, @"com.apple.private.homekit.location") & 1) != 0
     || __HMDProcessInfoBoolForEntitlement(v6, @"com.apple.private.homekit.home-location"))
    && ([(id)objc_opt_class() bundleForLocationManager], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F65468]) initWithBundle:v7];
  }
  else if (v5)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F65468]) initWithBundleIdentifier:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (HMDProcessInfo)initWithAuditToken:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)HMDProcessInfo;
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v5;
  id v6 = [(HMFProcessInfo *)&v40 initWithAuditToken:buf];
  uint64_t v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_unint64_t state = -1;
  v8 = (void *)MEMORY[0x1E4F963E8];
  id v9 = objc_msgSend(MEMORY[0x1E4F963F8], "identifierWithPid:", -[HMFProcessInfo identifier](v6, "identifier"));
  id v39 = 0;
  int v10 = [v8 handleForIdentifier:v9 error:&v39];
  id v11 = v39;
  uint64_t v12 = 104;
  processHandle = v7->_processHandle;
  v7->_processHandle = v10;

  if (!v7->_processHandle)
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    int v10 = v7;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v3 = HMFGetLogIdentifier();
      v15 = objc_msgSend(NSNumber, "numberWithInt:", -[RBSProcessHandle identifier](v10, "identifier"));
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v11;
      _os_log_impl(&dword_1D49D5000, (os_log_t)v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine process handle for pid %@: %@", buf, 0x20u);
    }
  }
  v7->_entitledForAPIAccess = __HMDProcessInfoBoolForEntitlement(v7, @"com.apple.developer.homekit");
  char v16 = __HMDProcessInfoBoolForEntitlement(v7, @"com.apple.private.homekit");
  v7->_entitledForSPIAccess = v16;
  if ((v16 & 1) == 0) {
    v7->_entitledForSPIAccess = __HMDProcessInfoBoolForEntitlement(v7, @"com.apple.homekit.private-spi-access");
  }
  long long v17 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v17;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = 0;
LABEL_21:

    goto LABEL_22;
  }
  v19 = [(HMFProcessInfo *)v7 isPlatformBinary];

  if (v19)
  {
    v20 = [(HMDProcessInfo *)v7 processHandle];
    bundleIdentifier = [v20 identity];

    uint64_t v21 = [bundleIdentifier embeddedApplicationIdentifier];
    v22 = (void *)v21;
    if (v21)
    {
      int v23 = 0;
      v24 = (void *)v21;
    }
    else
    {
      uint64_t v25 = [bundleIdentifier xpcServiceIdentifier];
      int v10 = (RBSProcessHandle *)v25;
      if (v25)
      {
        int v23 = 0;
        v24 = (void *)v25;
      }
      else
      {
        uint64_t v12 = [(HMDProcessInfo *)v7 processHandle];
        unint64_t v3 = [(id)v12 bundle];
        v24 = [v3 identifier];
        int v23 = 1;
      }
    }
    objc_storeStrong((id *)&v7->_bundleIdentifier, v24);
    if (v23)
    {
    }
    if (!v22) {

    }
    goto LABEL_21;
  }
LABEL_22:
  v26 = [(HMFProcessInfo *)v7 mainBundleURL];
  if (v26)
  {
    v27 = +[HMDApplicationRegistry sharedRegistry];
    uint64_t v28 = [v27 applicationInfoForBundleURL:v26];
    applicationInfo = v7->_applicationInfo;
    v7->_applicationInfo = (HMDApplicationInfo *)v28;

    [(HMDApplicationInfo *)v7->_applicationInfo addProcess:v7];
  }
  else if (v7->_bundleIdentifier)
  {
    v30 = +[HMDApplicationRegistry sharedRegistry];
    uint64_t v31 = [v30 applicationInfoForBundleIdentifier:v7->_bundleIdentifier];
    v32 = v7->_applicationInfo;
    v7->_applicationInfo = (HMDApplicationInfo *)v31;

    [(HMDApplicationInfo *)v7->_applicationInfo addProcess:v7];
  }
  v33 = v7->_bundleIdentifier;
  v34 = [(HMDApplicationInfo *)v7->_applicationInfo bundleIdentifier];

  if (v34)
  {
    uint64_t v35 = [(HMDApplicationInfo *)v7->_applicationInfo bundleIdentifier];

    v33 = (NSString *)v35;
  }
  uint64_t v36 = [(id)objc_opt_class() locationAuthorizationFromEffectiveBundleIdentifier:v33 processInfo:v7];
  locationAuthorization = v7->_locationAuthorization;
  v7->_locationAuthorization = (HMFLocationAuthorization *)v36;

  return v7;
}

- (BOOL)isForegrounded
{
  return ![(HMDProcessInfo *)self state] || [(HMDProcessInfo *)self state] == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_locationAuthorization, 0);
  objc_storeStrong((id *)&self->_applicationInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (BOOL)isEntitledForAPIAccess
{
  return self->_entitledForAPIAccess;
}

- (id)logIdentifier
{
  v2 = NSString;
  unint64_t v3 = [(HMDProcessInfo *)self bundleIdentifier];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isBackgroundUpgradedToForeground
{
  return [(HMDProcessInfo *)self state] == 2;
}

- (HMDProcessInfo)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  long long v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_164583 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_164583, &__block_literal_global_35_164584);
  }
  v2 = (void *)logCategory__hmf_once_v6_164585;
  return v2;
}

uint64_t __29__HMDProcessInfo_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6_164585;
  logCategory__hmf_once_v6_164585 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __45__HMDProcessInfo_privateClientIdentifierSalt__block_invoke()
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FDAF31D2-4895-48A8-BE45-04B4E974F0CD"];
  uint64_t v0 = objc_msgSend(v5, "hm_convertToData");
  uint64_t v1 = +[HMDApplicationInfo privateVendorIdentifier];
  v2 = (void *)[v1 mutableCopy];

  [v2 appendData:v0];
  uint64_t v3 = objc_msgSend(v2, "hm_generateSHA1");
  id v4 = (void *)privateClientIdentifierSalt_privateClientIdentifierSalt;
  privateClientIdentifierSalt_privateClientIdentifierSalt = v3;
}

@end
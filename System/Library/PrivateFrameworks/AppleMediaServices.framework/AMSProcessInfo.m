@interface AMSProcessInfo
+ (AMSProcessInfo)currentProcess;
+ (BOOL)BOOLForEntitlement:(id)a3;
+ (BOOL)BOOLForMachLookupAccess:(id)a3;
+ (BOOL)hasAMSEntitlement;
+ (BOOL)hasValue:(id)a3 inArrayForEntitlement:(id)a4;
+ (BOOL)isBuddyRunning;
+ (BOOL)supportsSecureCoding;
+ (NSString)defaultMediaTypeForCurrentProcess;
+ (id)_bundleForIdentifier:(id)a3 record:(id)a4;
+ (id)_bundleRecordForIdentifier:(id)a3;
+ (id)_cachedProcessInfoForIdentifier:(id)a3;
+ (id)_currentProcessBundleIdentifier;
+ (id)arrayForEntitlement:(id)a3;
+ (id)stringForEntitlement:(id)a3;
+ (id)valueForEntitlement:(id)a3;
+ (void)_accessProcessInfoCache:(id)a3;
+ (void)_cacheProcessInfo:(id)a3;
+ (void)copyPropertiesFrom:(id)a3 to:(id)a4;
+ (void)setDefaultMediaTypeForCurrentProcess:(id)a3;
- (AMSMappedBundleInfo)mappedBundleInfo;
- (AMSProcessInfo)init;
- (AMSProcessInfo)initWithBundleIdentifier:(id)a3;
- (AMSProcessInfo)initWithCoder:(id)a3;
- (BOOL)isAccountsDaemon;
- (BOOL)isEqual:(id)a3;
- (NSData)auditTokenData;
- (NSString)accountMediaType;
- (NSString)bundleIdentifier;
- (NSString)clientVersion;
- (NSString)executableName;
- (NSString)localizedName;
- (NSString)partnerHeader;
- (NSString)proxyAppBundleID;
- (NSString)treatmentNamespace;
- (NSString)userAgentSuffix;
- (NSURL)bundleURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)generateConfiguration;
- (id)generateConfigurationFromBag:(id)a3;
- (id)generateConfigurationFromBagContract:(id)a3;
- (void)_setComputedPropertiesForBundleIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountMediaType:(id)a3;
- (void)setAuditTokenData:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setExecutableName:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setPartnerHeader:(id)a3;
- (void)setProxyAppBundleID:(id)a3;
- (void)setTreatmentNamespace:(id)a3;
- (void)setUserAgentSuffix:(id)a3;
@end

@implementation AMSProcessInfo

uint64_t __42__AMSProcessInfo__accessProcessInfoCache___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __50__AMSProcessInfo__cachedProcessInfoForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

+ (id)_cachedProcessInfoForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[AMSUnitTests isRunningUnitTests];
  id v6 = 0;
  if (v4 && !v5)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__57;
    v15 = __Block_byref_object_dispose__57;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__AMSProcessInfo__cachedProcessInfoForIdentifier___block_invoke;
    v8[3] = &unk_1E55A55B8;
    v10 = &v11;
    id v9 = v4;
    [a1 _accessProcessInfoCache:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

+ (NSString)defaultMediaTypeForCurrentProcess
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&_MergedGlobals_138);
  if (+[AMSUnitTests isRunningUnitTests])
  {
    v3 = [AMSProcessInfo alloc];
    id v4 = [a1 _currentProcessBundleIdentifier];
    BOOL v5 = [(AMSProcessInfo *)v3 initWithBundleIdentifier:v4];

    id v6 = [(AMSProcessInfo *)v5 accountMediaType];
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_138);
    v7 = (void *)qword_1EB38DEC8;
    if (!qword_1EB38DEC8)
    {
      v8 = +[AMSProcessInfo currentProcess];
      id v9 = [v8 accountMediaType];
      uint64_t v10 = [v9 copy];
      uint64_t v11 = (void *)qword_1EB38DEC8;
      qword_1EB38DEC8 = v10;

      v7 = (void *)qword_1EB38DEC8;
    }
    id v6 = (void *)[v7 copy];
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_138);
  }
  return (NSString *)v6;
}

+ (void)_accessProcessInfoCache:(id)a3
{
  id v3 = a3;
  if (qword_1EB38DED0 != -1) {
    dispatch_once(&qword_1EB38DED0, &__block_literal_global_105);
  }
  id v4 = (id)qword_1EB38DED8;
  if (qword_1EB38DEE0 != -1) {
    dispatch_once(&qword_1EB38DEE0, &__block_literal_global_82);
  }
  BOOL v5 = (void *)qword_1EB38DEE8;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__AMSProcessInfo__accessProcessInfoCache___block_invoke_3;
  v9[3] = &unk_1E559F868;
  id v10 = v4;
  id v11 = v3;
  id v6 = v4;
  id v7 = v3;
  v8 = v5;
  dispatch_sync(v8, v9);
}

+ (void)copyPropertiesFrom:(id)a3 to:(id)a4
{
  BOOL v5 = (void *)*((void *)a3 + 3);
  id v6 = a4;
  id v7 = (id *)a3;
  uint64_t v8 = [v5 copy];
  id v9 = (void *)v6[3];
  v6[3] = v8;

  uint64_t v10 = [v7[4] copy];
  id v11 = (void *)v6[4];
  v6[4] = v10;

  uint64_t v12 = [v7[5] copy];
  uint64_t v13 = (void *)v6[5];
  v6[5] = v12;

  uint64_t v14 = [v7[6] copy];
  v15 = (void *)v6[6];
  v6[6] = v14;

  uint64_t v16 = [v7[7] copy];
  v17 = (void *)v6[7];
  v6[7] = v16;

  uint64_t v18 = [v7[8] copy];
  v19 = (void *)v6[8];
  v6[8] = v18;

  uint64_t v20 = [v7[9] copy];
  v21 = (void *)v6[9];
  v6[9] = v20;

  uint64_t v22 = [v7[2] copy];
  v23 = (void *)v6[2];
  v6[2] = v22;

  uint64_t v24 = [v7[10] copy];
  v25 = (void *)v6[10];
  v6[10] = v24;

  uint64_t v26 = [v7[11] copy];
  v27 = (void *)v6[11];
  v6[11] = v26;

  id v28 = v7[12];
  uint64_t v29 = [v28 copy];
  id v30 = (id)v6[12];
  v6[12] = v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AMSProcessInfo);
  +[AMSProcessInfo copyPropertiesFrom:self to:v4];
  return v4;
}

+ (AMSProcessInfo)currentProcess
{
  v2 = +[AMSProcessInfo _currentProcessBundleIdentifier];
  id v3 = [[AMSProcessInfo alloc] initWithBundleIdentifier:v2];
  id v4 = [(AMSProcessInfo *)v3 executableName];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    id v7 = [v6 processName];
    [(AMSProcessInfo *)v3 setExecutableName:v7];
  }
  return v3;
}

- (AMSProcessInfo)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(AMSProcessInfo *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v8 = +[AMSProcessInfo _cachedProcessInfoForIdentifier:v5];
    if (v8)
    {
      +[AMSProcessInfo copyPropertiesFrom:v8 to:v7];
    }
    else
    {
      [(AMSProcessInfo *)v7 _setComputedPropertiesForBundleIdentifier:v5];
      id v9 = (void *)[(AMSProcessInfo *)v7 copy];
      +[AMSProcessInfo _cacheProcessInfo:v9];
    }
  }

  return v7;
}

- (AMSProcessInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)AMSProcessInfo;
  v2 = [(AMSProcessInfo *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    clientVersion = v2->_clientVersion;
    v2->_clientVersion = (NSString *)@"0.0";

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.AppleMediaServices.AMSClientInfo", v5);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (NSString)executableName
{
  return self->_executableName;
}

+ (id)_currentProcessBundleIdentifier
{
  if (qword_1EB38DEF8 != -1) {
    dispatch_once(&qword_1EB38DEF8, &__block_literal_global_85_1);
  }
  v2 = (void *)qword_1EB38DEF0;
  return v2;
}

- (void)setExecutableName:(id)a3
{
}

+ (void)_cacheProcessInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];

  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__AMSProcessInfo__cacheProcessInfo___block_invoke;
    v6[3] = &unk_1E55A5590;
    id v7 = v4;
    [a1 _accessProcessInfoCache:v6];
  }
}

- (NSString)accountMediaType
{
  return self->_accountMediaType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)userAgentSuffix
{
  return self->_userAgentSuffix;
}

- (NSString)proxyAppBundleID
{
  return self->_proxyAppBundleID;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedBundleInfo, 0);
  objc_storeStrong((id *)&self->_userAgentSuffix, 0);
  objc_storeStrong((id *)&self->_treatmentNamespace, 0);
  objc_storeStrong((id *)&self->_proxyAppBundleID, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_executableName, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_accountMediaType, 0);
  objc_storeStrong((id *)&self->_partnerHeader, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setTreatmentNamespace:(id)a3
{
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (BOOL)isAccountsDaemon
{
  v2 = [(AMSProcessInfo *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.accountsd"];

  return v3;
}

void __36__AMSProcessInfo__cacheProcessInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 bundleIdentifier];
  [v3 setObject:v2 forKey:v4];
}

+ (BOOL)BOOLForEntitlement:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_queue_t v6 = [a1 valueForEntitlement:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
    }
    else
    {

      uint64_t v16 = +[AMSLogConfig sharedConfig];
      if (!v16)
      {
        uint64_t v16 = +[AMSLogConfig sharedConfig];
      }
      v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = AMSLogKey();
        v19 = NSString;
        uint64_t v20 = objc_opt_class();
        if (v18)
        {
          v21 = AMSLogKey();
          NSStringFromSelector(a2);
          a2 = (SEL)objc_claimAutoreleasedReturnValue();
          [v19 stringWithFormat:@"%@: [%@] %@ ", v20, v21, a2];
        }
        else
        {
          v21 = NSStringFromSelector(a2);
          [v19 stringWithFormat:@"%@: %@ ", v20, v21];
        uint64_t v22 = };
        v25 = AMSHashIfNeeded(v5);
        *(_DWORD *)buf = 138543618;
        id v28 = v22;
        __int16 v29 = 2114;
        id v30 = v25;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@Entitlement fetch failed. Value is not a BOOLean. entitlementName = %{public}@", buf, 0x16u);
        if (v18)
        {

          uint64_t v22 = (void *)a2;
        }
      }
      id v9 = 0;
    }
    char v24 = [v9 BOOLValue];
  }
  else
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = AMSLogKey();
      uint64_t v12 = NSString;
      uint64_t v13 = objc_opt_class();
      if (v11)
      {
        uint64_t v14 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        [v12 stringWithFormat:@"%@: [%@] %@ ", v13, v14, a2];
      }
      else
      {
        uint64_t v14 = NSStringFromSelector(a2);
        [v12 stringWithFormat:@"%@: %@ ", v13, v14];
      v15 = };
      v23 = AMSHashIfNeeded(v5);
      *(_DWORD *)buf = 138543618;
      id v28 = v15;
      __int16 v29 = 2114;
      id v30 = v23;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Did not find entitlement named %{public}@", buf, 0x16u);
      if (v11)
      {

        v15 = (void *)a2;
      }
    }
    char v24 = 0;
  }

  return v24;
}

+ (id)valueForEntitlement:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  if (v4 && (id v5 = SecTaskCreateFromSelf(0)) != 0)
  {
    dispatch_queue_t v6 = v5;
    CFErrorRef error = 0;
    id v7 = (void *)SecTaskCopyValueForEntitlement(v5, v4, &error);
    if (error)
    {
      id v8 = +[AMSLogConfig sharedConfig];
      if (!v8)
      {
        id v8 = +[AMSLogConfig sharedConfig];
      }
      id v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = AMSLogableError(error);
        *(_DWORD *)buf = 138543618;
        id v14 = a1;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Entitlement fetch failed with error: %{public}@", buf, 0x16u);
      }
      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (BOOL)hasAMSEntitlement
{
  return [a1 BOOLForEntitlement:@"com.apple.private.applemediaservices"];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSProcessInfo *)self accountMediaType];
  [v4 encodeObject:v5 forKey:@"mediaType"];

  dispatch_queue_t v6 = [(AMSProcessInfo *)self auditTokenData];
  [v4 encodeObject:v6 forKey:@"auditTokenData"];

  id v7 = [(AMSProcessInfo *)self bundleIdentifier];
  [v4 encodeObject:v7 forKey:@"bundleID"];

  id v8 = [(AMSProcessInfo *)self bundleURL];
  [v4 encodeObject:v8 forKey:@"bundleURL"];

  id v9 = [(AMSProcessInfo *)self clientVersion];
  [v4 encodeObject:v9 forKey:@"clientVersion"];

  uint64_t v10 = [(AMSProcessInfo *)self executableName];
  [v4 encodeObject:v10 forKey:@"executableName"];

  id v11 = [(AMSProcessInfo *)self localizedName];
  [v4 encodeObject:v11 forKey:@"localizedName"];

  uint64_t v12 = [(AMSProcessInfo *)self partnerHeader];
  [v4 encodeObject:v12 forKey:@"partnerHeader"];

  uint64_t v13 = [(AMSProcessInfo *)self proxyAppBundleID];
  [v4 encodeObject:v13 forKey:@"proxyAppBundleID"];

  id v14 = [(AMSProcessInfo *)self treatmentNamespace];
  [v4 encodeObject:v14 forKey:@"treatmentNamespace"];

  id v15 = [(AMSProcessInfo *)self userAgentSuffix];
  [v4 encodeObject:v15 forKey:@"userAgentSuffix"];
}

- (NSString)treatmentNamespace
{
  return self->_treatmentNamespace;
}

- (NSString)partnerHeader
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__57;
  uint64_t v10 = __Block_byref_object_dispose__57;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AMSProcessInfo_partnerHeader__block_invoke;
  v5[3] = &unk_1E559F2A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (AMSProcessInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSProcessInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    accountMediaType = v5->_accountMediaType;
    v5->_accountMediaType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditTokenData"];
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientVersion"];
    clientVersion = v5->_clientVersion;
    v5->_clientVersion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executableName"];
    executableName = v5->_executableName;
    v5->_executableName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerHeader"];
    partnerHeader = v5->_partnerHeader;
    v5->_partnerHeader = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAppBundleID"];
    proxyAppBundleID = v5->_proxyAppBundleID;
    v5->_proxyAppBundleID = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"treatmentNamespace"];
    treatmentNamespace = v5->_treatmentNamespace;
    v5->_treatmentNamespace = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userAgentSuffix"];
    userAgentSuffix = v5->_userAgentSuffix;
    v5->_userAgentSuffix = (NSString *)v26;
  }
  return v5;
}

uint64_t __42__AMSProcessInfo__accessProcessInfoCache___block_invoke()
{
  qword_1EB38DED8 = [[AMSLRUCache alloc] initWithMaxSize:20];
  return MEMORY[0x1F41817F8]();
}

uint64_t __31__AMSProcessInfo_partnerHeader__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  return MEMORY[0x1F41817F8]();
}

- (void)setClientVersion:(id)a3
{
}

- (void)setAuditTokenData:(id)a3
{
}

- (void)setBundleURL:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
  id v5 = a3;
  [(AMSProcessInfo *)self _setComputedPropertiesForBundleIdentifier:v5];
}

- (void)_setComputedPropertiesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x192FA47D0]();
  uint64_t v6 = +[AMSProcessInfo _bundleRecordForIdentifier:v4];
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__57;
  v52[4] = __Block_byref_object_dispose__57;
  id v53 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__AMSProcessInfo__setComputedPropertiesForBundleIdentifier___block_invoke;
  aBlock[3] = &unk_1E55A55E0;
  v51 = v52;
  id v7 = v4;
  id v49 = v7;
  id v8 = v6;
  id v50 = v8;
  id v9 = _Block_copy(aBlock);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __60__AMSProcessInfo__setComputedPropertiesForBundleIdentifier___block_invoke_2;
  v45[3] = &unk_1E55A5608;
  id v10 = v8;
  id v46 = v10;
  id v11 = v9;
  id v47 = v11;
  uint64_t v12 = (void (**)(void *, void, uint64_t))_Block_copy(v45);
  uint64_t v13 = [v10 URL];
  uint64_t v14 = v13;
  context = (void *)v5;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    uint64_t v16 = v11[2](v11);
    objc_msgSend(v16, "bundleURL", v5);
    id v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v17 = [v10 executableURL];
  uint64_t v18 = [v17 lastPathComponent];
  v19 = [v18 stringByDeletingPathExtension];
  uint64_t v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    uint64_t v22 = objc_opt_class();
    v12[2](v12, *MEMORY[0x1E4F1CFF0], v22);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v21;

  uint64_t v24 = [v10 localizedName];
  v25 = v24;
  if (v24)
  {
    uint64_t v26 = v24;
  }
  else
  {
    uint64_t v27 = objc_opt_class();
    v12[2](v12, *MEMORY[0x1E4F1CC48], v27);
    uint64_t v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  id v28 = v26;

  uint64_t v29 = objc_opt_class();
  id v30 = v12[2](v12, *MEMORY[0x1E4F1CC70], v29);
  uint64_t v31 = v30;
  if (v30)
  {
    id v32 = v30;
  }
  else
  {
    uint64_t v33 = objc_opt_class();
    v12[2](v12, *MEMORY[0x1E4F1D020], v33);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = v32;

  if (self->_bundleURL) {
    bundleURL = self->_bundleURL;
  }
  else {
    bundleURL = v15;
  }
  objc_storeStrong((id *)&self->_bundleURL, bundleURL);
  if (self->_executableName) {
    executableName = self->_executableName;
  }
  else {
    executableName = v23;
  }
  objc_storeStrong((id *)&self->_executableName, executableName);
  if (self->_localizedName) {
    localizedName = self->_localizedName;
  }
  else {
    localizedName = v28;
  }
  objc_storeStrong((id *)&self->_localizedName, localizedName);
  clientVersion = self->_clientVersion;
  if (!clientVersion || [(NSString *)clientVersion isEqualToString:@"0.0"]) {
    objc_storeStrong((id *)&self->_clientVersion, v34);
  }

  _Block_object_dispose(v52, 8);
  v39 = +[AMSMappedBundleInfo bundleInfoForProcessInfo:self];
  mappedBundleInfo = self->_mappedBundleInfo;
  self->_mappedBundleInfo = v39;

  accountMediaType = self->_accountMediaType;
  if (accountMediaType)
  {
    v42 = accountMediaType;
  }
  else
  {
    v42 = [(AMSMappedBundleInfo *)self->_mappedBundleInfo accountMediaType];
  }
  v43 = self->_accountMediaType;
  self->_accountMediaType = v42;
}

id __60__AMSProcessInfo__setComputedPropertiesForBundleIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) infoDictionary];
  id v7 = [v6 objectForKey:a2 ofClass:a3];

  if (!v7)
  {
    id v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v9 = [v8 infoDictionary];
    id v7 = [v9 objectForKeyedSubscript:a2];
  }
  return v7;
}

+ (id)_bundleRecordForIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSProcessInfo _currentProcessBundleIdentifier];
  uint64_t v6 = v5;
  if (v4)
  {
    if (!v5)
    {
LABEL_8:
      id v17 = 0;
      id v7 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v4 allowPlaceholder:1 error:&v17];
      id v8 = v17;
      if (v7) {
        goto LABEL_21;
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v4 = v5;
    if (!v4)
    {
      id v8 = 0;
      goto LABEL_11;
    }
  }
  if (![v4 isEqualToString:v6]) {
    goto LABEL_8;
  }
  id v7 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  id v8 = 0;
  if (v7) {
    goto LABEL_21;
  }
LABEL_11:
  id v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = AMSLogKey();
    uint64_t v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v13;
    if (v11)
    {
      AMSLogKey();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      [v12 stringWithFormat:@"%@: [%@] ", v14, a1];
    }
    else
    {
      [v12 stringWithFormat:@"%@: ", v13];
    id v15 = };
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch bundle record, error: %{public}@", buf, 0x16u);
    if (v11)
    {

      id v15 = a1;
    }
  }
  id v7 = 0;
LABEL_21:

  return v7;
}

void __42__AMSProcessInfo__accessProcessInfoCache___block_invoke_2()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AMSProcessInfo", v2);
  v1 = (void *)qword_1EB38DEE8;
  qword_1EB38DEE8 = (uint64_t)v0;
}

- (void)setProxyAppBundleID:(id)a3
{
}

- (void)setAccountMediaType:(id)a3
{
}

- (AMSMappedBundleInfo)mappedBundleInfo
{
  return self->_mappedBundleInfo;
}

void __49__AMSProcessInfo__currentProcessBundleIdentifier__block_invoke()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  v2 = (void *)qword_1EB38DEF0;
  qword_1EB38DEF0 = v1;

  if (!qword_1EB38DEF0)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
      if (InfoDictionary)
      {
        id v17 = CFDictionaryGetValue(InfoDictionary, (const void *)*MEMORY[0x1E4F1CFF8]);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v18 = v17;
        }
        else {
          id v18 = 0;
        }

        v19 = (void *)qword_1EB38DEF0;
        qword_1EB38DEF0 = (uint64_t)v18;
      }
    }
  }
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  id v4 = [v3 processName];
  int v5 = [v4 isEqualToString:@"amsaccountsd"];

  if (v5)
  {
    uint64_t v6 = (void *)qword_1EB38DEF0;
    qword_1EB38DEF0 = @"com.apple.amsaccountsd";
  }
  if (!qword_1EB38DEF0)
  {
    id v7 = [MEMORY[0x1E4F28F80] processInfo];
    id v8 = [v7 processName];
    int v9 = [v8 isEqualToString:@"amstool"];

    if (v9)
    {
      id v10 = (void *)qword_1EB38DEF0;
      qword_1EB38DEF0 = @"amstool";
    }
    if (!qword_1EB38DEF0)
    {
      id v11 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v12 = [v11 processName];
      int v13 = [v12 isEqualToString:@"amstoold"];

      if (v13)
      {
        uint64_t v14 = (void *)qword_1EB38DEF0;
        qword_1EB38DEF0 = @"amstoold";
      }
    }
  }
}

+ (BOOL)isBuddyRunning
{
  return softLinkBYSetupAssistantNeedsToRun();
}

- (void)setPartnerHeader:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AMSProcessInfo_setPartnerHeader___block_invoke;
  block[3] = &unk_1E55A4328;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  int v13 = &v14;
  dispatch_sync(internalQueue, block);
  if (*((unsigned char *)v15 + 24))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v8 = v6;
    if (!v6)
    {
      id v8 = [MEMORY[0x1E4F1CA98] null];
    }
    int v9 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, @"ISClientValueParameter", 0);
    if (!v6) {

    }
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"ISClientPartnerHeaderChangedNotification" object:self userInfo:v9];
  }
  _Block_object_dispose(&v14, 8);
}

void __35__AMSProcessInfo_setPartnerHeader___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

+ (id)arrayForEntitlement:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a1 valueForEntitlement:v5];
  id v7 = v6;
  if (!v6)
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_21;
    }
    id v12 = AMSLogKey();
    int v13 = NSString;
    uint64_t v14 = objc_opt_class();
    if (v12)
    {
      id v15 = AMSLogKey();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, a2];
    }
    else
    {
      id v15 = NSStringFromSelector(a2);
      [v13 stringWithFormat:@"%@: %@ ", v14, v15];
    uint64_t v16 = };
    v19 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    __int16 v20 = "%{public}@Did not find entitlement named %{public}@";
    id v21 = v11;
    os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
    goto LABEL_18;
  }
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;

    goto LABEL_22;
  }

  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = AMSLogKey();
    char v17 = NSString;
    uint64_t v18 = objc_opt_class();
    if (v12)
    {
      id v15 = AMSLogKey();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v17 stringWithFormat:@"%@: [%@] %@ ", v18, v15, a2];
    }
    else
    {
      id v15 = NSStringFromSelector(a2);
      [v17 stringWithFormat:@"%@: %@ ", v18, v15];
    uint64_t v16 = };
    v19 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    __int16 v20 = "%{public}@Entitlement fetch failed. Value is not an array. entitlementName = %{public}@";
    id v21 = v11;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
LABEL_18:
    _os_log_impl(&dword_18D554000, v21, v22, v20, buf, 0x16u);
    if (v12)
    {

      uint64_t v16 = (void *)a2;
    }
  }
LABEL_21:

  id v9 = 0;
LABEL_22:

  return v9;
}

+ (BOOL)BOOLForMachLookupAccess:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  getpid();
  id v4 = v3;
  [v4 UTF8String];

  return sandbox_check() == 0;
}

+ (BOOL)hasValue:(id)a3 inArrayForEntitlement:(id)a4
{
  id v6 = a3;
  id v7 = [a1 arrayForEntitlement:a4];
  LOBYTE(a1) = [v7 containsObject:v6];

  return (char)a1;
}

+ (void)setDefaultMediaTypeForCurrentProcess:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&_MergedGlobals_138);
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = a1;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting the default media type for the process. defaultMediaType = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  os_unfair_lock_lock_with_options();
  uint64_t v7 = [v4 copy];
  id v8 = (void *)qword_1EB38DEC8;
  qword_1EB38DEC8 = v7;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_138);
}

+ (id)stringForEntitlement:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a1 valueForEntitlement:v5];
  uint64_t v7 = v6;
  if (!v6)
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    __int16 v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_21;
    }
    id v12 = AMSLogKey();
    uint64_t v13 = NSString;
    uint64_t v14 = objc_opt_class();
    if (v12)
    {
      id v15 = AMSLogKey();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, a2];
    }
    else
    {
      id v15 = NSStringFromSelector(a2);
      [v13 stringWithFormat:@"%@: %@ ", v14, v15];
    uint64_t v16 = };
    v19 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    __int16 v20 = "%{public}@Did not find entitlement named %{public}@";
    id v21 = v11;
    os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
    goto LABEL_18;
  }
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;

    goto LABEL_22;
  }

  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  __int16 v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = AMSLogKey();
    char v17 = NSString;
    uint64_t v18 = objc_opt_class();
    if (v12)
    {
      id v15 = AMSLogKey();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v17 stringWithFormat:@"%@: [%@] %@ ", v18, v15, a2];
    }
    else
    {
      id v15 = NSStringFromSelector(a2);
      [v17 stringWithFormat:@"%@: %@ ", v18, v15];
    uint64_t v16 = };
    v19 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    __int16 v20 = "%{public}@Entitlement fetch failed. Value is not a string. entitlementName = %{public}@";
    id v21 = v11;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
LABEL_18:
    _os_log_impl(&dword_18D554000, v21, v22, v20, buf, 0x16u);
    if (v12)
    {

      uint64_t v16 = (void *)a2;
    }
  }
LABEL_21:

  id v9 = 0;
LABEL_22:

  return v9;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(AMSProcessInfo *)self executableName];
  id v5 = [(AMSProcessInfo *)self bundleIdentifier];
  id v6 = [(AMSProcessInfo *)self clientVersion];
  uint64_t v7 = [(AMSProcessInfo *)self accountMediaType];
  id v8 = [(AMSProcessInfo *)self proxyAppBundleID];
  id v9 = [(AMSProcessInfo *)self treatmentNamespace];
  id v10 = [(AMSProcessInfo *)self userAgentSuffix];
  __int16 v11 = [v3 stringWithFormat:@"<AMSProcessInfo: %p name = %@ | bundleIdentifier = %@ | clientVersion = %@ | mediaType = %@ | proxyAppBundleID = %@ | treatmentNamespace = %@ | userAgentSuffix = %@>", self, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [(AMSProcessInfo *)self accountMediaType];
    if (v7 || ([v6 accountMediaType], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = [(AMSProcessInfo *)self accountMediaType];
      id v9 = [v6 accountMediaType];
      int v10 = [v8 isEqual:v9];

      if (v7)
      {

        if (!v10) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v10 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v13 = [(AMSProcessInfo *)self auditTokenData];
    if (v13 || ([v6 auditTokenData], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v14 = [(AMSProcessInfo *)self auditTokenData];
      id v15 = [v6 auditTokenData];
      int v16 = [v14 isEqual:v15];

      if (v13)
      {

        if (!v16) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v16 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    char v17 = [(AMSProcessInfo *)self bundleIdentifier];
    if (v17 || ([v6 bundleIdentifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v18 = [(AMSProcessInfo *)self bundleIdentifier];
      v19 = [v6 bundleIdentifier];
      int v20 = [v18 isEqual:v19];

      if (v17)
      {

        if (!v20) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v20 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    id v21 = [(AMSProcessInfo *)self bundleURL];
    if (v21 || ([v6 bundleURL], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      os_log_type_t v22 = [(AMSProcessInfo *)self bundleURL];
      v23 = [v6 bundleURL];
      int v24 = [v22 isEqual:v23];

      if (v21)
      {

        if (!v24) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v24 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    v25 = [(AMSProcessInfo *)self clientVersion];
    if (v25 || ([v6 clientVersion], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      __int16 v26 = [(AMSProcessInfo *)self clientVersion];
      uint64_t v27 = [v6 clientVersion];
      int v28 = [v26 isEqual:v27];

      if (v25)
      {

        if (!v28) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v28 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v29 = [(AMSProcessInfo *)self executableName];
    if (v29 || ([v6 executableName], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v30 = [(AMSProcessInfo *)self executableName];
      uint64_t v31 = [v6 executableName];
      int v32 = [v30 isEqual:v31];

      if (v29)
      {

        if (!v32) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v32 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v33 = [(AMSProcessInfo *)self localizedName];
    if (v33 || ([v6 localizedName], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v34 = [(AMSProcessInfo *)self localizedName];
      v35 = [v6 localizedName];
      int v36 = [v34 isEqual:v35];

      if (v33)
      {

        if (!v36) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v36 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    v37 = [(AMSProcessInfo *)self partnerHeader];
    if (v37 || ([v6 partnerHeader], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v38 = [(AMSProcessInfo *)self partnerHeader];
      v39 = [v6 partnerHeader];
      int v40 = [v38 isEqual:v39];

      if (v37)
      {

        if (!v40) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v40 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    v41 = [(AMSProcessInfo *)self proxyAppBundleID];
    if (v41 || ([v6 proxyAppBundleID], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v42 = [(AMSProcessInfo *)self proxyAppBundleID];
      v43 = [v6 proxyAppBundleID];
      int v44 = [v42 isEqual:v43];

      if (v41)
      {

        if (!v44) {
          goto LABEL_9;
        }
      }
      else
      {

        if ((v44 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    v45 = [(AMSProcessInfo *)self treatmentNamespace];
    if (v45 || ([v6 treatmentNamespace], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v46 = [(AMSProcessInfo *)self treatmentNamespace];
      id v47 = [v6 treatmentNamespace];
      int v48 = [v46 isEqual:v47];

      if (v45)
      {

        if (v48) {
          goto LABEL_66;
        }
        goto LABEL_9;
      }

      if ((v48 & 1) == 0) {
        goto LABEL_9;
      }
    }
LABEL_66:
    id v49 = [(AMSProcessInfo *)self userAgentSuffix];
    if (v49 || ([v6 userAgentSuffix], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v50 = [(AMSProcessInfo *)self userAgentSuffix];
      v51 = [v6 userAgentSuffix];
      int v52 = [v50 isEqual:v51] ^ 1;

      if (v49)
      {
LABEL_72:

        char v11 = v52 ^ 1;
        goto LABEL_10;
      }
    }
    else
    {
      LOBYTE(v52) = 0;
    }

    goto LABEL_72;
  }
LABEL_9:
  char v11 = 0;
LABEL_10:

  return v11;
}

+ (id)_bundleForIdentifier:(id)a3 record:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    id v8 = [a1 _currentProcessBundleIdentifier];
    int v9 = [v8 isEqualToString:v7];

    if (!v9) {
      goto LABEL_7;
    }
    int v10 = [MEMORY[0x1E4F28B50] mainBundle];
    if (v10)
    {
LABEL_14:
      a3 = v10;

      goto LABEL_15;
    }
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle && (CFURLRef v12 = CFBundleCopyBundleURL(MainBundle)) != 0)
    {
      CFURLRef v13 = v12;
      uint64_t v14 = (void *)MEMORY[0x1E4F28B50];
      id v15 = [(__CFURL *)v12 path];
      int v10 = [v14 bundleWithPath:v15];

      CFRelease(v13);
    }
    else
    {
LABEL_7:
      int v10 = 0;
    }
    if (v6 && !v10)
    {
      int v16 = [v6 URL];
      if (v16)
      {
        int v10 = [MEMORY[0x1E4F28B50] bundleWithURL:v16];
      }
      else
      {
        int v10 = 0;
      }
    }
    goto LABEL_14;
  }
LABEL_15:

  return a3;
}

id __60__AMSProcessInfo__setComputedPropertiesForBundleIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[6] + 8);
  id v3 = *(void **)(v2 + 40);
  if (v3)
  {
    id v4 = v3;
    id v5 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v4;
  }
  else
  {
    uint64_t v6 = +[AMSProcessInfo _bundleForIdentifier:a1[4] record:a1[5]];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  id v8 = *(void **)(*(void *)(a1[6] + 8) + 40);
  return v8;
}

- (id)generateConfiguration
{
  return (id)objc_msgSend(MEMORY[0x1E4F18DD0], "ams_configurationWithProcessInfo:bag:", self, 0);
}

- (id)generateConfigurationFromBag:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F18DD0], "ams_configurationWithProcessInfo:bag:", self, a3);
}

- (id)generateConfigurationFromBagContract:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F18DD0];
  id v5 = a3;
  uint64_t v6 = [[AMSContractBagShim alloc] initWithBagContract:v5];

  uint64_t v7 = objc_msgSend(v4, "ams_configurationWithProcessInfo:bag:", self, v6);

  return v7;
}

- (void)setLocalizedName:(id)a3
{
}

- (void)setUserAgentSuffix:(id)a3
{
}

@end
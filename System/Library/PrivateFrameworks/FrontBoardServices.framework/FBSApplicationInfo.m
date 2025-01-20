@interface FBSApplicationInfo
+ (id)_configureEnvironment:(id)a3 withInfo:(id)a4 isPreApex:(BOOL)a5;
+ (unint64_t)_applicationTypeForProxy:(id)a3;
+ (unint64_t)_applicationTypeForRecord:(id)a3;
- (BOOL)_isInstalling;
- (BOOL)_isPendingUninstall;
- (BOOL)_isTentativeUninstall;
- (BOOL)_isUninstalling;
- (BOOL)builtOnOrAfterSDKVersion:(id)a3;
- (BOOL)hasViewServicesEntitlement;
- (BOOL)isBeta;
- (BOOL)isBlocked;
- (BOOL)isBlockedForScreenTimeExpiration;
- (BOOL)isEnabled;
- (BOOL)isExitsOnSuspend;
- (BOOL)isFreeDeveloperProvisioningProfileValidated;
- (BOOL)isProvisioningProfileValidated;
- (BOOL)isRestricted;
- (BOOL)isSignatureVersionSupportEndingSoon;
- (BOOL)isSignatureVersionSupported;
- (BOOL)isUPPProvisioningProfileValidated;
- (BOOL)requiresPersistentWiFi;
- (BOOL)supportsAllInterfaceOrientations;
- (BOOL)supportsBackgroundMode:(id)a3;
- (BOOL)supportsDeviceFamily:(unint64_t)a3;
- (BOOL)supportsInterfaceOrientation:(int64_t)a3;
- (BOOL)supportsMultiwindow;
- (BOOL)wasBuiltWithTSAN;
- (FBSApplicationInfo)initWithApplicationProxy:(id)a3;
- (FBSApplicationInfo)initWithApplicationRecord:(id)a3;
- (LSApplicationIdentity)applicationIdentity;
- (NSArray)customMachServices;
- (NSArray)deviceFamilies;
- (NSArray)externalAccessoryProtocols;
- (NSArray)requiredCapabilities;
- (NSArray)tags;
- (NSDictionary)entitlements;
- (NSDictionary)environmentVariables;
- (NSNumber)downloaderDSID;
- (NSNumber)itemID;
- (NSNumber)purchaserDSID;
- (NSString)_appIDEntitlement;
- (NSString)preferenceDomain;
- (NSString)sdkVersion;
- (NSString)shortVersionString;
- (NSString)signerIdentity;
- (NSString)teamIdentifier;
- (NSURL)advertisingAttributionReportEndpoint;
- (NSURL)bundleContainerURL;
- (NSURL)dataContainerURL;
- (NSURL)executableURL;
- (NSURL)sandboxURL;
- (RBSProcessIdentity)processIdentity;
- (_FBSCDHashCacheInfo)cachedCDHashInfo;
- (double)lastModifiedDate;
- (float)minimumBrightnessLevel;
- (id)_initWithApplicationProxy:(id)a3 record:(id)a4 appIdentity:(id)a5 processIdentity:(id)a6 overrideURL:(id)a7;
- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4;
- (id)_initWithBundleProxy:(id)a3 overrideURL:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)fallbackFolderName;
- (id)folderNames;
- (id)succinctDescriptionBuilder;
- (int64_t)interfaceOrientation;
- (int64_t)ratingRank;
- (int64_t)screenTimePolicy;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)type;
- (unint64_t)unauthoritativeTrustState;
- (unsigned)signatureVersion;
- (void)_overrideTags:(id)a3;
- (void)_setInstalling:(BOOL)a3;
- (void)_setPendingUninstall:(BOOL)a3;
- (void)_setTentativeUninstall:(BOOL)a3;
- (void)_setUninstalling:(BOOL)a3;
- (void)_synchronize:(id)a3;
- (void)setCachedCDHashInfo:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
@end

@implementation FBSApplicationInfo

- (BOOL)isBlockedForScreenTimeExpiration
{
  return [(FBSApplicationInfo *)self screenTimePolicy] != 0;
}

- (int64_t)screenTimePolicy
{
  return self->_screenTimePolicy;
}

- (BOOL)builtOnOrAfterSDKVersion:(id)a3
{
  sdkVersion = self->_sdkVersion;
  if (sdkVersion) {
    LOBYTE(sdkVersion) = (unint64_t)[(NSString *)sdkVersion compare:a3 options:64] < 2;
  }
  return (char)sdkVersion;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (BOOL)hasViewServicesEntitlement
{
  return self->_hasViewServicesEntitlement;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (unint64_t)unauthoritativeTrustState
{
  v3 = objc_opt_new();
  unint64_t v4 = [v3 trustStateForApplication:self];

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)tags
{
  return self->_tags;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (LSApplicationIdentity)applicationIdentity
{
  return self->_applicationIdentity;
}

- (float)minimumBrightnessLevel
{
  return self->_minimumBrightnessLevel;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (NSURL)bundleContainerURL
{
  return self->_bundleContainerURL;
}

- (BOOL)supportsInterfaceOrientation:(int64_t)a3
{
  return (self->_supportedInterfaceOrientations & (1 << a3)) != 0;
}

- (BOOL)_isUninstalling
{
  return self->_uninstalling;
}

- (BOOL)_isPendingUninstall
{
  return self->_pendingUninstall;
}

- (BOOL)_isInstalling
{
  return self->_installing;
}

- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [NSString stringWithFormat:@"this initializer is unavailable"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"FBSApplicationInfo.m";
    __int16 v21 = 1024;
    int v22 = 72;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_initWithBundleProxy:(id)a3 overrideURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [NSString stringWithFormat:@"this initializer is unavailable"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"FBSApplicationInfo.m";
    __int16 v21 = 1024;
    int v22 = 77;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSApplicationInfo)initWithApplicationProxy:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F398F90]();
  v6 = [v4 fbs_correspondingApplicationRecord];
  id v7 = [v6 identities];
  id v8 = [v7 firstObject];

  v9 = [v6 fbs_processIdentityForApplicationIdentity:v8];
  v10 = (FBSApplicationInfo *)[(FBSApplicationInfo *)self _initWithApplicationProxy:v4 record:v6 appIdentity:v8 processIdentity:v9 overrideURL:0];

  return v10;
}

- (FBSApplicationInfo)initWithApplicationRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F398F90]();
  v6 = [v4 fbs_correspondingApplicationProxy];
  id v7 = [v4 identities];
  id v8 = [v7 firstObject];

  v9 = [v4 fbs_processIdentityForApplicationIdentity:v8];
  v10 = (FBSApplicationInfo *)[(FBSApplicationInfo *)self _initWithApplicationProxy:v6 record:v4 appIdentity:v8 processIdentity:v9 overrideURL:0];

  return v10;
}

- (id)_initWithApplicationProxy:(id)a3 record:(id)a4 appIdentity:(id)a5 processIdentity:(id)a6 overrideURL:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v37 = a7;
  context = (void *)MEMORY[0x19F398F90]();
  if (_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL__onceToken != -1) {
    dispatch_once(&_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL__onceToken, &__block_literal_global_8);
  }
  __int16 v17 = [v13 bundleURL];
  if (!v17
    || ([v13 appState],
        v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = [v18 isValid],
        v18,
        !v16)
    || !v15
    || !v14
    || (v19 & 1) == 0)
  {
    if (v37)
    {
      id v33 = v37;
    }
    v34 = FBSLogApplicationLibrary();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      id v41 = v13;
      __int16 v42 = 2114;
      id v43 = v14;
      __int16 v44 = 2114;
      id v45 = v15;
      __int16 v46 = 2114;
      id v47 = v16;
      _os_log_error_impl(&dword_19C680000, v34, OS_LOG_TYPE_ERROR, "Invalid application proxy %{public}@, record %{public}@, app identity %{public}@, or process identity %{public}@", buf, 0x2Au);
    }

    v35 = [NSString stringWithFormat:@"Invalid Application Proxy provided"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationInfo _initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:](a2, (uint64_t)self, (uint64_t)v35);
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
  }
  v38 = v16;
  v39.receiver = self;
  v39.super_class = (Class)FBSApplicationInfo;
  v20 = [(FBSBundleInfo *)&v39 _initWithBundleProxy:v13 overrideURL:v17];
  __int16 v21 = v20;
  if (v20)
  {
    v20[22] = 0;
    [v13 objectsForInfoDictionaryKeys:_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____infoKeys];
    objc_claimAutoreleasedReturnValue();
    [v13 entitlementValuesForKeys:_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____entitlementKeys];
    objc_claimAutoreleasedReturnValue();
    *((void *)v21 + 27) = +[FBSApplicationInfo _applicationTypeForProxy:v13];
    objc_storeStrong((id *)v21 + 14, a5);
    uint64_t v22 = [v38 copy];
    __int16 v23 = (void *)*((void *)v21 + 15);
    *((void *)v21 + 15) = v22;

    uint64_t v24 = [v13 canonicalExecutablePath];
    if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24 isDirectory:0];
      v26 = (void *)*((void *)v21 + 16);
      *((void *)v21 + 16) = v25;
    }
    uint64_t v27 = [v13 bundleContainerURL];
    v28 = (void *)*((void *)v21 + 17);
    *((void *)v21 + 17) = v27;

    uint64_t v29 = [v13 dataContainerURL];
    v30 = (void *)*((void *)v21 + 18);
    *((void *)v21 + 18) = v29;

    v21[18] = [v14 codeSignatureVersion];
    [v17 path];
    objc_claimAutoreleasedReturnValue();
    BSModificationDateForPath();
  }
  id v31 = 0;

  return v31;
}

uint64_t __95__FBSApplicationInfo__initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL___block_invoke()
{
  uint64_t v0 = [[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:@"disabled", @"UIInterfaceOrientation", @"UISupportedInterfaceOrientations", @"UIRequiresPersistentWiFi", @"BKDisplayBrightnessAbsoluteOverride", @"UISupportedExternalAccessoryProtocols", @"MallocBehavior", @"SBMachServices", @"NSAdvertisingAttributionReportEndpoint", nil] autorelease];
  v1 = (void *)_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____infoKeys;
  _initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____infoKeys = v0;

  uint64_t v2 = [[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:@"com.apple.UIKit.vends-view-services", @"application-identifier", nil] retain];
  uint64_t v3 = _initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____entitlementKeys;
  _initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____entitlementKeys = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

- (NSDictionary)entitlements
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__FBSApplicationInfo_entitlements__block_invoke;
  v4[3] = &unk_1E58F4B00;
  v4[4] = self;
  [(FBSApplicationInfo *)self _synchronize:v4];
  return self->_lazy_entitlements;
}

void __34__FBSApplicationInfo_entitlements__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  if (!v1[8])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F223B8];
    id v4 = [v1 bundleIdentifier];
    v5 = [v3 applicationProxyForIdentifier:v4];

    v6 = FBSLogApplicationLibrary();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v8 = [*v2 bundleIdentifier];
        int v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_19C680000, v7, OS_LOG_TYPE_INFO, "inefficient loading of all entitlements for '%@'", (uint8_t *)&v11, 0xCu);
      }
      uint64_t v9 = [v5 entitlements];
      id v7 = v9;
      if (v9) {
        v10 = (void *)v9;
      }
      else {
        v10 = (void *)MEMORY[0x1E4F1CC08];
      }
      objc_storeStrong((id *)*v2 + 8, v10);
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __34__FBSApplicationInfo_entitlements__block_invoke_cold_1(v2, v7);
    }
  }
}

- (id)folderNames
{
  return 0;
}

- (id)fallbackFolderName
{
  return 0;
}

- (unsigned)signatureVersion
{
  return self->_signatureVersion;
}

- (BOOL)isExitsOnSuspend
{
  return 0;
}

- (BOOL)supportsBackgroundMode:(id)a3
{
  return [(NSSet *)self->_backgroundModes containsObject:a3];
}

- (BOOL)supportsAllInterfaceOrientations
{
  return (~LODWORD(self->_supportedInterfaceOrientations) & 0x1ELL) == 0;
}

- (BOOL)supportsDeviceFamily:(unint64_t)a3
{
  deviceFamilies = self->_deviceFamilies;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(deviceFamilies) = [(NSArray *)deviceFamilies containsObject:v4];

  return (char)deviceFamilies;
}

- (void)_overrideTags:(id)a3
{
  id v5 = a3;
  if (!self->_initialized) {
    BSEqualObjects();
  }
  v6 = [NSString stringWithFormat:@"can not call this method after initialization has finished"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(FBSApplicationInfo *)a2 _overrideTags:(uint64_t)v6];
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
}

- (void)_synchronize:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_lock);
    v4[2](v4);

    os_unfair_lock_unlock(p_lock);
  }
}

+ (unint64_t)_applicationTypeForProxy:(id)a3
{
  uint64_t v3 = [a3 applicationType];
  if (([v3 isEqual:*MEMORY[0x1E4F22380]] & 1) != 0
    || ([v3 isEqual:*MEMORY[0x1E4F22348]] & 1) != 0)
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqual:*MEMORY[0x1E4F22350]])
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = 2;
  }

  return v4;
}

+ (unint64_t)_applicationTypeForRecord:(id)a3
{
  unint64_t v4 = [a3 fbs_correspondingApplicationProxy];
  unint64_t v5 = [a1 _applicationTypeForProxy:v4];

  return v5;
}

+ (id)_configureEnvironment:(id)a3 withInfo:(id)a4 isPreApex:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __63__FBSApplicationInfo__configureEnvironment_withInfo_isPreApex___block_invoke;
  __int16 v23 = &unk_1E58F4B28;
  uint64_t v25 = &v26;
  id v9 = v7;
  id v24 = v9;
  uint64_t v10 = MEMORY[0x19F3991F0](&v20);
  int v11 = (void (**)(void, void, void))v10;
  if (v5) {
    (*(void (**)(uint64_t, __CFString *, __CFString *))(v10 + 16))(v10, @"MallocCorruptionAbort", @"0");
  }
  v12 = [v8 dictionaryForKey:@"MallocBehavior" withKeysAndValues:v20, v21, v22, v23];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = [v12 bs_safeNumberForKey:@"NanoAllocator"];
    id v15 = v14;
    if (v14)
    {
      if ([v14 BOOLValue]) {
        id v16 = @"1";
      }
      else {
        id v16 = @"0";
      }
      ((void (**)(void, __CFString *, __CFString *))v11)[2](v11, @"MallocNanoZone", v16);
    }
  }
  __int16 v17 = (void *)v27[5];
  if (!v17) {
    __int16 v17 = v9;
  }
  id v18 = v17;

  _Block_object_dispose(&v26, 8);

  return v18;
}

void __63__FBSApplicationInfo__configureEnvironment_withInfo_isPreApex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v6 setObject:v5 forKey:v10];
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)FBSApplicationInfo;
  uint64_t v3 = [(FBSBundleInfo *)&v8 succinctDescriptionBuilder];
  unint64_t v4 = [(LSApplicationIdentity *)self->_applicationIdentity fbs_personaUniqueString];

  if (v4)
  {
    id v5 = [(LSApplicationIdentity *)self->_applicationIdentity fbs_personaUniqueString];
    id v6 = (id)[v3 appendObject:v5 withName:@"persona"];
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSApplicationInfo *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FBSApplicationInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  int v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __60__FBSApplicationInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) sdkVersion];
  id v4 = (id)[v2 appendObject:v3 withName:@"sdk"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) signerIdentity];
  id v7 = (id)[v5 appendObject:v6 withName:@"signerIdentity" skipIfNil:1];

  objc_super v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) bundleContainerURL];
  id v10 = [v9 path];
  id v11 = (id)[v8 appendObject:v10 withName:@"bundleContainer" skipIfNil:1];

  v12 = *(void **)(a1 + 32);
  uint64_t v13 = [*(id *)(a1 + 40) dataContainerURL];
  id v14 = [v13 path];
  id v15 = (id)[v12 appendObject:v14 withName:@"dataContainer" skipIfNil:1];

  id v16 = *(void **)(a1 + 32);
  __int16 v17 = [*(id *)(a1 + 40) tags];
  [v16 appendArraySection:v17 withName:@"tags" skipIfEmpty:1];

  id v18 = *(void **)(a1 + 32);
  id v19 = [*(id *)(a1 + 40) customMachServices];
  [v18 appendArraySection:v19 withName:@"machServices" skipIfEmpty:1];
}

- (NSURL)executableURL
{
  return self->_executableURL;
}

- (NSURL)sandboxURL
{
  return self->_sandboxURL;
}

- (double)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)preferenceDomain
{
  return self->_preferenceDomain;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (BOOL)isProvisioningProfileValidated
{
  return self->_provisioningProfileValidated;
}

- (BOOL)isUPPProvisioningProfileValidated
{
  return self->_uppProvisioningProfileValidated;
}

- (BOOL)isFreeDeveloperProvisioningProfileValidated
{
  return self->_freeDeveloperProvisioningProfileValidated;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (NSArray)customMachServices
{
  return self->_customMachServices;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (BOOL)requiresPersistentWiFi
{
  return self->_requiresPersistentWiFi;
}

- (NSArray)externalAccessoryProtocols
{
  return self->_externalAccessoryProtocols;
}

- (int64_t)ratingRank
{
  return self->_ratingRank;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (NSNumber)purchaserDSID
{
  return self->_purchaserDSID;
}

- (NSNumber)downloaderDSID
{
  return self->_downloaderDSID;
}

- (BOOL)wasBuiltWithTSAN
{
  return self->_builtWithTSAN;
}

- (NSURL)advertisingAttributionReportEndpoint
{
  return self->_advertisingAttributionReportEndpoint;
}

- (NSString)_appIDEntitlement
{
  return self->_appIDEntitlement;
}

- (void)_setInstalling:(BOOL)a3
{
  self->_installing = a3;
}

- (void)_setUninstalling:(BOOL)a3
{
  self->_uninstalling = a3;
}

- (void)_setPendingUninstall:(BOOL)a3
{
  self->_pendingUninstall = a3;
}

- (BOOL)_isTentativeUninstall
{
  return self->_tentativeUninstall;
}

- (void)_setTentativeUninstall:(BOOL)a3
{
  self->_tentativeUninstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIDEntitlement, 0);
  objc_storeStrong((id *)&self->_advertisingAttributionReportEndpoint, 0);
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalAccessoryProtocols, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_customMachServices, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_preferenceDomain, 0);
  objc_storeStrong((id *)&self->_sandboxURL, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_bundleContainerURL, 0);
  objc_storeStrong((id *)&self->_executableURL, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_backgroundModes, 0);

  objc_storeStrong((id *)&self->_lazy_entitlements, 0);
}

- (BOOL)isSignatureVersionSupported
{
  unsigned int v2 = [(FBSApplicationInfo *)self signatureVersion];
  return v2 >= getkMISMinSupportedSignatureVersion();
}

- (BOOL)isSignatureVersionSupportEndingSoon
{
  unsigned int v2 = [(FBSApplicationInfo *)self signatureVersion];
  return v2 < getkMISFutureMinSupportedSignatureVersion();
}

- (void)setCachedCDHashInfo:(id)a3
{
}

- (_FBSCDHashCacheInfo)cachedCDHashInfo
{
  return (_FBSCDHashCacheInfo *)objc_getAssociatedObject(self, "_fb_cachedCDHashInfo");
}

- (void)_initWithApplicationProxy:(uint64_t)a3 record:appIdentity:processIdentity:overrideURL:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"FBSApplicationInfo.m";
  __int16 v10 = 1024;
  int v11 = 137;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

void __34__FBSApplicationInfo_entitlements__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 bundleIdentifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "failed to load entitlements for '%@' because we could not find the proxy", (uint8_t *)&v4, 0xCu);
}

- (void)_overrideTags:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"FBSApplicationInfo.m";
  __int16 v10 = 1024;
  int v11 = 371;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end
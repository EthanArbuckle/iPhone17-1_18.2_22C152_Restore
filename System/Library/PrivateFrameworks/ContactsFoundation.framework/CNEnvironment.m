@interface CNEnvironment
+ (CNEnvironmentBase)defaultEnvironment;
+ (char)environmentStackKey;
+ (id)os_log;
- (BOOL)isAquaSession;
- (BOOL)isCommLimitsEnabled;
- (BOOL)isCommLimitsEnabledImpl;
- (BOOL)isExtendedGreenTeaDevice;
- (BOOL)isGreenTeaDevice;
- (BOOL)isInternalBuild;
- (BOOL)isKeychainEnabled;
- (BOOL)isKeychainEnabledImpl;
- (CNAuthorizationContext)authorizationContext;
- (CNEntitlementVerification)entitlementVerifier;
- (CNEnvironment)init;
- (CNFeatureFlags)featureFlags;
- (CNFileManager)fileManager;
- (CNLocalizationServices)localizationServices;
- (CNProbabilityUtility)probabilityUtility;
- (CNSchedulerProvider)schedulerProvider;
- (CNTimeProvider)timeProvider;
- (CNUserDefaults)userDefaults;
- (CNWatchdog)watchdog;
- (NSDistributedNotificationCenter)distributedNotificationCenter;
- (NSLocale)currentLocale;
- (NSNotificationCenter)notificationCenter;
- (NSString)currentCountryCode;
- (NSString)defaultCountryCode;
- (NSString)getCurrentRegionCode;
- (NSString)homeCountryCode;
- (NSString)mainBundleIdentifier;
- (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_)keychainFacade;
- (id)getCurrentCountryCode;
- (id)getDefaultCountryCode;
- (id)getHomeCountryCode;
- (id)valueForKey:(id)a3 onCacheMiss:(id)a4;
- (void)isExtendedGreenTeaDevice;
- (void)isGreenTeaDevice;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation CNEnvironment

id __32__CNEnvironment_isInternalBuild__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 160);
  if (!v2)
  {
    uint64_t v3 = [NSNumber numberWithBool:os_variant_has_internal_content()];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 160);
  }

  return v2;
}

id __33__CNEnvironment_isGreenTeaDevice__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 176);
  if (!v2)
  {
    uint64_t v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 176);
    *(void *)(v4 + 176) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 176);
  }

  return v2;
}

id __35__CNEnvironment_defaultCountryCode__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[15];
  if (!v3)
  {
    uint64_t v4 = [v2 getDefaultCountryCode];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 120);
  }

  return v3;
}

- (id)getDefaultCountryCode
{
  return +[CNPhoneNumberHelper defaultCountryCode];
}

- (CNAuthorizationContext)authorizationContext
{
  return (CNAuthorizationContext *)objc_getProperty(self, a2, 80, 1);
}

uint64_t __35__CNEnvironment_defaultEnvironment__block_invoke(uint64_t a1)
{
  defaultEnvironment_cn_once_object_3 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (CNEnvironment)init
{
  v35.receiver = self;
  v35.super_class = (Class)CNEnvironment;
  v2 = [(CNEnvironment *)&v35 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(CNFileManager);
    fileManager = v2->_fileManager;
    v2->_fileManager = v3;

    uint64_t v5 = +[CNUserDefaults standardPreferences];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (CNUserDefaults *)v5;

    uint64_t v7 = +[CNFeatureFlags currentFlags];
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = (CNFeatureFlags *)v7;

    v9 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v10 = [v9 bundleIdentifier];
    v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = &stru_1EE0267A8;
    }
    objc_storeStrong((id *)&v2->_mainBundleIdentifier, v12);

    uint64_t v13 = +[CNSchedulerProvider defaultProvider];
    schedulerProvider = v2->_schedulerProvider;
    v2->_schedulerProvider = (CNSchedulerProvider *)v13;

    uint64_t v15 = +[CNTimeProvider defaultProvider];
    timeProvider = v2->_timeProvider;
    v2->_timeProvider = (CNTimeProvider *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28C40] defaultCenter];
    distributedNotificationCenter = v2->_distributedNotificationCenter;
    v2->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v19;

    v21 = objc_alloc_init(CNEntitlementVerifier);
    entitlementVerifier = v2->_entitlementVerifier;
    v2->_entitlementVerifier = (CNEntitlementVerification *)v21;

    uint64_t v23 = +[CNAuthorizationContext sharedInstance];
    authorizationContext = v2->_authorizationContext;
    v2->_authorizationContext = (CNAuthorizationContext *)v23;

    uint64_t v25 = +[CNLocalizationServices defaultServices];
    localizationServices = v2->_localizationServices;
    v2->_localizationServices = (CNLocalizationServices *)v25;

    v27 = objc_alloc_init(CNProbabilityUtility);
    probabilityUtility = v2->_probabilityUtility;
    v2->_probabilityUtility = v27;

    uint64_t v29 = +[CNWatchdog defaultWatchdog];
    watchdog = v2->_watchdog;
    v2->_watchdog = (CNWatchdog *)v29;

    uint64_t v31 = objc_opt_new();
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v31;

    v33 = v2;
  }

  return v2;
}

id __41__CNEnvironment_valueForKey_onCacheMiss___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v3 = (*(void (**)(void))(a1[6] + 16))();
    [*(id *)(a1[4] + 8) setObject:v3 forKeyedSubscript:a1[5]];
  }

  return v3;
}

- (CNSchedulerProvider)schedulerProvider
{
  return (CNSchedulerProvider *)objc_getProperty(self, a2, 40, 1);
}

+ (CNEnvironmentBase)defaultEnvironment
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CNEnvironment_defaultEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultEnvironment_cn_once_token_3 != -1) {
    dispatch_once(&defaultEnvironment_cn_once_token_3, block);
  }
  id v2 = (void *)defaultEnvironment_cn_once_object_3;

  return (CNEnvironmentBase *)v2;
}

+ (char)environmentStackKey
{
  return "com.apple.contacts.environment-stack";
}

- (CNFeatureFlags)featureFlags
{
  return (CNFeatureFlags *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isGreenTeaDevice
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__CNEnvironment_isGreenTeaDevice__block_invoke;
  v9[3] = &unk_1E569F360;
  v9[4] = self;
  uint64_t v3 = cn_objectResultWithObjectLock(self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__CNEnvironment_isGreenTeaDevice__block_invoke_2;
  v8[3] = &unk_1E569F360;
  v8[4] = self;
  uint64_t v4 = cn_objectResultWithObjectLock(self, v8);
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(CNEnvironment *)(uint64_t)v4 isGreenTeaDevice];
  }

  char v6 = [v3 BOOLValue];
  return v6;
}

- (CNEntitlementVerification)entitlementVerifier
{
  return (CNEntitlementVerification *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isInternalBuild
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CNEnvironment_isInternalBuild__block_invoke;
  v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)valueForKey:(id)a3 onCacheMiss:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__CNEnvironment_valueForKey_onCacheMiss___block_invoke;
  v12[3] = &unk_1E569F960;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = cn_objectResultWithObjectLock(self, v12);

  return v10;
}

- (CNTimeProvider)timeProvider
{
  return (CNTimeProvider *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)defaultCountryCode
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__CNEnvironment_defaultCountryCode__block_invoke;
  v4[3] = &unk_1E569F360;
  v4[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v4);

  return (NSString *)v2;
}

+ (id)os_log
{
  if (os_log_cn_once_token_2 != -1) {
    dispatch_once(&os_log_cn_once_token_2, &__block_literal_global_23_0);
  }
  id v2 = (void *)os_log_cn_once_object_2;

  return v2;
}

uint64_t __23__CNEnvironment_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.foundation", "CNEnvironment");
  uint64_t v1 = os_log_cn_once_object_2;
  os_log_cn_once_object_2 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSString)homeCountryCode
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__CNEnvironment_homeCountryCode__block_invoke;
  v4[3] = &unk_1E56A0720;
  v4[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v4);

  return (NSString *)v2;
}

id __32__CNEnvironment_homeCountryCode__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[16];
  if (!v3)
  {
    uint64_t v4 = [v2 getHomeCountryCode];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  id v7 = off_1EE025F60;

  return v7((uint64_t)&__block_literal_global_4_4, v3);
}

- (id)getHomeCountryCode
{
  return +[_CNCPPhoneNumberUtilitiesFacade homeCountryCode];
}

- (NSString)currentCountryCode
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__CNEnvironment_currentCountryCode__block_invoke;
  v4[3] = &unk_1E56A0720;
  v4[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v4);

  return (NSString *)v2;
}

id __35__CNEnvironment_currentCountryCode__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[17];
  if (!v3)
  {
    uint64_t v4 = [v2 getCurrentCountryCode];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  id v7 = off_1EE025F60;

  return v7((uint64_t)&__block_literal_global_4_4, v3);
}

- (id)getCurrentCountryCode
{
  return +[_CNCPPhoneNumberUtilitiesFacade currentCountryCode];
}

- (NSLocale)currentLocale
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__CNEnvironment_currentLocale__block_invoke;
  v4[3] = &unk_1E569F360;
  v4[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v4);

  return (NSLocale *)v2;
}

id __30__CNEnvironment_currentLocale__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 144);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  }

  return v2;
}

- (NSString)getCurrentRegionCode
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__CNEnvironment_getCurrentRegionCode__block_invoke;
  v4[3] = &unk_1E569F360;
  v4[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v4);

  return (NSString *)v2;
}

id __37__CNEnvironment_getCurrentRegionCode__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 152);
  if (!v2)
  {
    uint64_t v3 = MGCopyAnswer();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 152);
  }

  return v2;
}

id __33__CNEnvironment_isGreenTeaDevice__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 152);
  if (!v2)
  {
    uint64_t v3 = MGCopyAnswer();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 152);
  }

  return v2;
}

- (BOOL)isExtendedGreenTeaDevice
{
  BOOL v3 = [(CNEnvironment *)self isGreenTeaDevice];
  uint64_t v4 = [(CNEnvironment *)self getCurrentRegionCode];
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = [v4 caseInsensitiveCompare:@"CH"] == 0;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = v3 || v6;
  id v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(CNEnvironment *)v7 isExtendedGreenTeaDevice];
  }

  return v7;
}

- (BOOL)isCommLimitsEnabled
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__CNEnvironment_isCommLimitsEnabled__block_invoke;
  v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

id __36__CNEnvironment_isCommLimitsEnabled__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[23];
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isCommLimitsEnabledImpl"));
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 184);
  }

  return v3;
}

- (BOOL)isCommLimitsEnabledImpl
{
  return 1;
}

- (BOOL)isKeychainEnabled
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CNEnvironment_isKeychainEnabled__block_invoke;
  v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

id __34__CNEnvironment_isKeychainEnabled__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[24];
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isKeychainEnabledImpl"));
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 192);
  }

  return v3;
}

- (BOOL)isKeychainEnabledImpl
{
  return 1;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__CNEnvironment_setValue_forKey___block_invoke;
  v10[3] = &unk_1E569F988;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  cn_runWithObjectLock(self, v10);
}

uint64_t __33__CNEnvironment_setValue_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (CNFileManager)fileManager
{
  return (CNFileManager *)objc_getProperty(self, a2, 16, 1);
}

- (CNUserDefaults)userDefaults
{
  return (CNUserDefaults *)objc_getProperty(self, a2, 24, 1);
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return (NSDistributedNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (CNLocalizationServices)localizationServices
{
  return (CNLocalizationServices *)objc_getProperty(self, a2, 88, 1);
}

- (CNProbabilityUtility)probabilityUtility
{
  return (CNProbabilityUtility *)objc_getProperty(self, a2, 96, 1);
}

- (CNWatchdog)watchdog
{
  return (CNWatchdog *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)mainBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)isAquaSession
{
  return self->_aquaSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isKeychainEnabledStorage, 0);
  objc_storeStrong((id *)&self->_isCommLimitsEnabledStorage, 0);
  objc_storeStrong((id *)&self->_isGreenTeaDeviceStorage, 0);
  objc_storeStrong((id *)&self->_isExtendedGreenTeaDeviceStorage, 0);
  objc_storeStrong((id *)&self->_isInternalBuildStorage, 0);
  objc_storeStrong((id *)&self->_currentRegionCode, 0);
  objc_storeStrong((id *)&self->_currentLocaleOverride, 0);
  objc_storeStrong((id *)&self->_currentCountryCode, 0);
  objc_storeStrong((id *)&self->_homeCountryCode, 0);
  objc_storeStrong((id *)&self->_defaultCountryCode, 0);
  objc_storeStrong((id *)&self->_mainBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_probabilityUtility, 0);
  objc_storeStrong((id *)&self->_localizationServices, 0);
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_entitlementVerifier, 0);
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_)keychainFacade
{
  id v2 = self;
  char v3 = (void *)sub_19099DF14();

  return (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_ *)v3;
}

- (void)isGreenTeaDevice
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Is regulated SKU: %@", (uint8_t *)&v2, 0xCu);
}

- (void)isExtendedGreenTeaDevice
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = @"NO";
  if (a1) {
    int v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Is regulated SKU: %@", (uint8_t *)&v3, 0xCu);
}

@end
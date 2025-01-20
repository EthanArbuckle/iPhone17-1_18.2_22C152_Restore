@interface AKURLBag
+ (AKURLBagDictionaryProvider)sharedMemorySpaceBagProvider;
+ (BOOL)looksLikeiForgotURLKey:(id)a3;
+ (id)_currentBagsUnderLockWithBlock:(id)a3;
+ (id)_requestEnvironmentsWithBag:(id)a3;
+ (id)bagForAltDSID:(id)a3;
+ (id)keyForEscapeHatchURL;
+ (id)sharedBag;
+ (unint64_t)IDMSEnvironmentFromBag:(id)a3;
+ (unint64_t)_IDMSEnvironmentFromString:(id)a3;
+ (void)setSharedMemorySpaceBagProvider:(id)a3;
- (AKURLBag)initWithAltDSID:(id)a3;
- (AKURLBagDictionaryProvider)bagProvider;
- (BOOL)IsInlineFlowSupportedConfig;
- (BOOL)disablePSCreateAndForgetLink;
- (BOOL)isBaaEnabledForKey:(id)a3;
- (BOOL)isBackgroundiCloudSignInEnabled;
- (BOOL)isEasyStudentSignInDisabled;
- (BOOL)isFirstPartyURLEntitlementCheckDisabled;
- (BOOL)isMIDDriftTTRDisabled;
- (BOOL)isPasskeyCleanupDisabled;
- (BOOL)isPhoneNumberSupportedConfig;
- (BOOL)isSettingsInlineLogoViewDisabled;
- (BOOL)isTokenCacheDisabled;
- (BOOL)isTrustedDeviceListHashDisabled;
- (BOOL)requestNewURLBagIfNecessaryWithError:(id *)a3;
- (NSArray)allKeys;
- (NSArray)securityUpgradeServiceNames;
- (NSDictionary)baaConfiguration;
- (NSDictionary)custodianCodeConfiguration;
- (NSDictionary)inheritanceConfiguration;
- (NSSet)appleIDAuthorizationURLs;
- (NSSet)appleOwnedDomains;
- (NSString)APSEnvironment;
- (NSString)altDSID;
- (NSString)baaCertIssuer;
- (NSString)continuationHeaderPrefix;
- (NSURL)absintheCertURL;
- (NSURL)absintheSessionURL;
- (NSURL)acsURL;
- (NSURL)appleIDAuthorizeHTMLResponseURL;
- (NSURL)changePasswordURL;
- (NSURL)checkInURL;
- (NSURL)configurationInfoURL;
- (NSURL)contactKeyVerificationIneligibleDevicesURL;
- (NSURL)createAppleIDURL;
- (NSURL)createChildAccountURL;
- (NSURL)dataRecoveryServiceDisableURL;
- (NSURL)dataRecoveryServiceEnableURL;
- (NSURL)deleteAuthorizedAppURL;
- (NSURL)deviceInfoURL;
- (NSURL)deviceListURL;
- (NSURL)escapeHatchURL;
- (NSURL)fetchAppInfoURL;
- (NSURL)fetchAuthenticationModeURL;
- (NSURL)fetchConfigDataURL;
- (NSURL)fetchGlobalConfigURL;
- (NSURL)fetchPrimaryBundleIDURL;
- (NSURL)fetchUserInfoURL;
- (NSURL)finishFidoAuthURL;
- (NSURL)finishFidoRecoveryAuthURL;
- (NSURL)finishPasskeyRegistrationURL;
- (NSURL)generateVerificationTokenURL;
- (NSURL)goldilocksIncompatibleDevicesURL;
- (NSURL)iForgotContinuationURL;
- (NSURL)iForgotURL;
- (NSURL)iForgotWebURLToIntercept;
- (NSURL)manageSiwaForChildUrl;
- (NSURL)notificationAckURL;
- (NSURL)privacyRepairURL;
- (NSURL)privateEmailManageURL;
- (NSURL)renewRecoveryTokenURL;
- (NSURL)repairURL;
- (NSURL)siwaFetchSharedGroups;
- (NSURL)siwaGenerateShareToken;
- (NSURL)siwaManagementURL;
- (NSURL)siwaRevokeShareToken;
- (NSURL)siwaRotateShareTokens;
- (NSURL)siwaUpdateShareToken;
- (NSURL)startFidoAuthURL;
- (NSURL)startFidoRecoveryAuthURL;
- (NSURL)startPasskeyRegistrationURL;
- (NSURL)tokenUpgradeURL;
- (NSURL)trustedDevicesSummaryURL;
- (NSURL)trustedDevicesURL;
- (NSURL)unenrollPasskeyURL;
- (NSURL)upgradeEligibilityCheckURL;
- (NSURL)upgradeUIURL;
- (NSURL)userVerificationURL;
- (NSURL)validateCodeURL;
- (NSURL)validateVettingTokenURL;
- (NSURL)walrusCountryAnchorKBURL;
- (NSURL)walrusKBURL;
- (NSURL)webAccessDisableURL;
- (NSURL)webAccessEnableURL;
- (NSURL)webAccessKBURL;
- (id)_configurationsFromCache:(BOOL)a3 withError:(id *)a4;
- (id)_requestEnvironmentsWithError:(id *)a3;
- (id)_requestNewURLBagIfNecessaryWithError:(id *)a3;
- (id)_urlAtKey:(id)a3;
- (id)_urlAtKey:(id)a3 fromURLBag:(id)a4;
- (id)_urlBagFromCache:(BOOL)a3 withError:(id *)a4;
- (id)configurationAtKey:(id)a3;
- (id)configurationAtKey:(id)a3 fromCache:(BOOL)a4;
- (id)ttrConfigurationAtKey:(id)a3;
- (id)urlDictionaryAtKey:(id)a3;
- (unint64_t)IDMSEnvironment;
- (unint64_t)baaValidity;
- (unint64_t)lastKnownIDMSEnvironment;
- (void)_fetchURLBagFromCache:(BOOL)a3 withCompletion:(id)a4;
- (void)configurationValueForKey:(id)a3 completion:(id)a4;
- (void)configurationValueForKey:(id)a3 fromCache:(BOOL)a4 completion:(id)a5;
- (void)environmentValueForKey:(id)a3 completion:(id)a4;
- (void)forceUpdateBagWithUrlSwitchData:(id)a3 completion:(id)a4;
- (void)requestNewURLBagIfNecessaryWithCompletion:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setBagProvider:(id)a3;
- (void)urlForKey:(id)a3 completion:(id)a4;
- (void)urlForKey:(id)a3 fromCache:(BOOL)a4 completion:(id)a5;
@end

@implementation AKURLBag

+ (id)bagForAltDSID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __26__AKURLBag_bagForAltDSID___block_invoke;
    v7[3] = &unk_1E57614B8;
    id v8 = v4;
    v5 = [a1 _currentBagsUnderLockWithBlock:v7];
  }
  else
  {
    v5 = [a1 sharedBag];
  }

  return v5;
}

+ (id)sharedBag
{
  if (sharedBag_onceToken != -1) {
    dispatch_once(&sharedBag_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)sharedBag_sharedURLBag;

  return v2;
}

- (unint64_t)lastKnownIDMSEnvironment
{
  v2 = +[AKConfiguration sharedConfiguration];
  unint64_t v3 = [v2 lastKnownIDMSEnvironment];

  return v3;
}

AKURLBag *__26__AKURLBag_bagForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v4)
  {
    id v4 = [[AKURLBag alloc] initWithAltDSID:*(void *)(a1 + 32)];
    [v3 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
  }

  return v4;
}

uint64_t __21__AKURLBag_sharedBag__block_invoke()
{
  sharedBag_sharedURLBag = objc_alloc_init(AKURLBag);

  return MEMORY[0x1F41817F8]();
}

+ (id)_currentBagsUnderLockWithBlock:(id)a3
{
  uint64_t v3 = _currentBagsUnderLockWithBlock__onceToken;
  id v4 = (void (**)(id, uint64_t))a3;
  if (v3 != -1) {
    dispatch_once(&_currentBagsUnderLockWithBlock__onceToken, &__block_literal_global_385);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_currentBagsUnderLockWithBlock__lock);
  v5 = v4[2](v4, _currentBagsUnderLockWithBlock__currentBags);

  os_unfair_lock_unlock((os_unfair_lock_t)&_currentBagsUnderLockWithBlock__lock);

  return v5;
}

uint64_t __43__AKURLBag__currentBagsUnderLockWithBlock___block_invoke()
{
  _currentBagsUnderLockWithBlock__lock = 0;
  _currentBagsUnderLockWithBlock__currentBags = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

- (AKURLBag)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKURLBag;
  v6 = [(AKURLBag *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

+ (AKURLBagDictionaryProvider)sharedMemorySpaceBagProvider
{
  return (AKURLBagDictionaryProvider *)(id)__sharedMemorySpaceBagProvider;
}

+ (void)setSharedMemorySpaceBagProvider:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "AKURLBag SharedMemorySpaceBagProvider ==> %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = (void *)__sharedMemorySpaceBagProvider;
  __sharedMemorySpaceBagProvider = (uint64_t)v3;
}

- (AKURLBagDictionaryProvider)bagProvider
{
  v2 = self->_bagProvider;
  id v3 = v2;
  id v4 = (AKURLBagDictionaryProvider *)__sharedMemorySpaceBagProvider;
  if (v2) {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (NSURL)privateEmailManageURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"managePrivateEmailAddress"];
}

- (NSURL)upgradeEligibilityCheckURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"securityUpgradeEligibility"];
}

- (NSURL)upgradeUIURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"securityUpgrade"];
}

- (NSURL)validateCodeURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"validateCode"];
}

- (NSURL)escapeHatchURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"secondaryAuth"];
}

- (NSURL)privacyRepairURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"privacyRepair"];
}

- (NSURL)goldilocksIncompatibleDevicesURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"goldilocksIncompatibleDevices"];
}

+ (id)keyForEscapeHatchURL
{
  return @"secondaryAuth";
}

- (NSURL)checkInURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"postData"];
}

- (NSURL)notificationAckURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"teardown"];
}

- (NSURL)iForgotURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"iForgot"];
}

- (NSURL)iForgotContinuationURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"iForgotResetNotification"];
}

+ (BOOL)looksLikeiForgotURLKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"iForgotAppleIdLocked"] & 1) != 0
    || ([v3 isEqualToString:@"iForgot"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"iForgotResetNotification"];
  }

  return v4;
}

- (NSURL)createAppleIDURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"createAccount"];
}

- (NSURL)deviceListURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"device_list_self"];
}

- (NSURL)trustedDevicesURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"trustedDevices"];
}

- (NSURL)trustedDevicesSummaryURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"trustedDevicesSummaryUrl"];
}

- (NSURL)deviceInfoURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"fetchDeviceInfo"];
}

- (NSURL)absintheCertURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"qualifyCert"];
}

- (NSURL)absintheSessionURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"qualifySession"];
}

- (NSURL)tokenUpgradeURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"tokenUpgrade"];
}

- (NSURL)configurationInfoURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"postConfigData"];
}

- (NSURL)fetchConfigDataURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"fetchConfigData"];
}

- (NSURL)changePasswordURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"changePasswordUrl"];
}

- (NSURL)manageSiwaForChildUrl
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"manageSiwaForChildUrl"];
}

- (NSURL)validateVettingTokenURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"validateVettingToken"];
}

- (NSURL)renewRecoveryTokenURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"renewRecoveryToken"];
}

- (NSURL)fetchUserInfoURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"fetchUserInfo"];
}

- (NSURL)fetchGlobalConfigURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"fetchGlobalConfigs"];
}

- (NSURL)fetchAppInfoURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"fetchAuthorizedApps"];
}

- (NSURL)fetchPrimaryBundleIDURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"fetchPrimaryApp"];
}

- (NSURL)fetchAuthenticationModeURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"fetchAuthMode"];
}

- (BOOL)isPhoneNumberSupportedConfig
{
  v2 = [(AKURLBag *)self configurationAtKey:@"is-phone-number-supported"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isBackgroundiCloudSignInEnabled
{
  v2 = [(AKURLBag *)self configurationAtKey:@"background-iCloud-SignIn-enable"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)disablePSCreateAndForgetLink
{
  v2 = [(AKURLBag *)self configurationAtKey:@"disablePSCreateAndForgetLink"];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSURL)acsURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"acsURL"];
}

- (NSURL)repairURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"repair"];
}

- (NSURL)userVerificationURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"userVerificationResult"];
}

- (NSURL)deleteAuthorizedAppURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"deleteAuthorizedApp"];
}

- (NSURL)startFidoAuthURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"startFidoAuth"];
}

- (NSURL)finishFidoAuthURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"finishFidoAuth"];
}

- (NSURL)startFidoRecoveryAuthURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"startFidoRecoveryAuth"];
}

- (NSURL)finishFidoRecoveryAuthURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"finishFidoRecoveryAuth"];
}

- (NSSet)appleOwnedDomains
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  char v3 = [(AKURLBag *)self configurationAtKey:@"appleOwnedDomains" fromCache:1];
  char v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSSet)appleIDAuthorizationURLs
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  char v3 = [(AKURLBag *)self configurationAtKey:@"appleIDAuthorizationUrls" fromCache:1];
  char v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSURL)appleIDAuthorizeHTMLResponseURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"appleIDAuthorizeHTMLResponse"];
}

- (NSURL)createChildAccountURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"createChildAccount"];
}

- (NSDictionary)custodianCodeConfiguration
{
  return (NSDictionary *)[(AKURLBag *)self configurationAtKey:@"custodian" fromCache:1];
}

- (NSDictionary)inheritanceConfiguration
{
  return (NSDictionary *)[(AKURLBag *)self configurationAtKey:@"inheritance-cfg" fromCache:1];
}

- (NSString)APSEnvironment
{
  v2 = [(AKURLBag *)self _requestEnvironmentsWithError:0];
  char v3 = [v2 objectForKeyedSubscript:@"apsEnv"];

  return (NSString *)v3;
}

- (unint64_t)IDMSEnvironment
{
  v2 = [(AKURLBag *)self _requestEnvironmentsWithError:0];
  char v3 = [v2 objectForKeyedSubscript:@"idmsEnv"];

  unint64_t v4 = [(id)objc_opt_class() _IDMSEnvironmentFromString:v3];
  return v4;
}

- (BOOL)IsInlineFlowSupportedConfig
{
  v2 = [(AKURLBag *)self configurationAtKey:@"is-in-line-flow-supported"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isSettingsInlineLogoViewDisabled
{
  v2 = [(AKURLBag *)self configurationAtKey:@"settingsInlineLogoViewDisabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isEasyStudentSignInDisabled
{
  v2 = [(AKURLBag *)self configurationAtKey:@"easyStudentSignInDisabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)continuationHeaderPrefix
{
  v2 = [(AKURLBag *)self configurationAtKey:@"continuation-header-prefix"];
  char v3 = v2;
  if (!v2) {
    v2 = @"X-Apple-I-Cont";
  }
  unint64_t v4 = v2;

  return v4;
}

- (NSArray)securityUpgradeServiceNames
{
  return (NSArray *)[(AKURLBag *)self configurationAtKey:@"2faUpgradeAccountTypePriority" fromCache:1];
}

+ (unint64_t)IDMSEnvironmentFromBag:(id)a3
{
  unint64_t v4 = [a1 _requestEnvironmentsWithBag:a3];
  id v5 = [v4 objectForKeyedSubscript:@"idmsEnv"];

  unint64_t v6 = [a1 _IDMSEnvironmentFromString:v5];
  return v6;
}

+ (unint64_t)_IDMSEnvironmentFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"IdMS1"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqual:@"IdMS2"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqual:@"IdMS3"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)configurationAtKey:(id)a3
{
  return [(AKURLBag *)self configurationAtKey:a3 fromCache:0];
}

- (id)configurationAtKey:(id)a3 fromCache:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v7 = [(AKURLBag *)self _configurationsFromCache:v4 withError:0];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)ttrConfigurationAtKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AKURLBag *)self configurationAtKey:@"ttr-cfgs"];
  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)requestNewURLBagIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__AKURLBag_requestNewURLBagIfNecessaryWithCompletion___block_invoke;
  v6[3] = &unk_1E575EAE8;
  id v7 = v4;
  id v5 = v4;
  [(AKURLBag *)self _fetchURLBagFromCache:0 withCompletion:v6];
}

uint64_t __54__AKURLBag_requestNewURLBagIfNecessaryWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (BOOL)requestNewURLBagIfNecessaryWithError:(id *)a3
{
  id v3 = [(AKURLBag *)self _requestNewURLBagIfNecessaryWithError:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)configurationValueForKey:(id)a3 completion:(id)a4
{
}

- (void)configurationValueForKey:(id)a3 fromCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__AKURLBag_configurationValueForKey_fromCache_completion___block_invoke;
  v12[3] = &unk_1E575F898;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(AKURLBag *)self _fetchURLBagFromCache:v6 withCompletion:v12];
}

void __58__AKURLBag_configurationValueForKey_fromCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    BOOL v6 = [v11 objectForKeyedSubscript:@"cfgs"];
    id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(a1 + 40);
    if (v7)
    {
      if (v8) {
        (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v7, 0);
      }
    }
    else if (v8)
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7097);
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (!v9) {
      goto LABEL_11;
    }
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:underlyingError:", -7122, v5);
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v6);
  }

LABEL_11:
}

- (void)urlForKey:(id)a3 completion:(id)a4
{
}

- (id)urlDictionaryAtKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AKURLBag *)self _requestNewURLBagIfNecessaryWithError:0];
    objc_opt_class();
    BOOL v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = v6;
    id v8 = 0;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)urlForKey:(id)a3 fromCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__AKURLBag_urlForKey_fromCache_completion___block_invoke;
  v12[3] = &unk_1E57608C8;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(AKURLBag *)self _fetchURLBagFromCache:v6 withCompletion:v12];
}

void __43__AKURLBag_urlForKey_fromCache_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v13)
  {
    BOOL v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    id v8 = [v13 objectForKeyedSubscript:@"urls"];
    id v9 = [v6 _urlAtKey:v7 fromURLBag:v8];

    uint64_t v10 = a1[6];
    if (v9)
    {
      if (v10) {
        (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v9, 0);
      }
    }
    else if (v10)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7097);
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v12);
    }
  }
  else
  {
    uint64_t v11 = a1[6];
    if (!v11) {
      goto LABEL_11;
    }
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:underlyingError:", -7122, v5);
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v9);
  }

LABEL_11:
}

- (id)_urlAtKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AKURLBag *)self _requestNewURLBagIfNecessaryWithError:0];
    BOOL v6 = [(AKURLBag *)self _urlAtKey:v4 fromURLBag:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_urlAtKey:(id)a3 fromURLBag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v9 = [v5 objectForKeyedSubscript:v6];

  if (isKindOfClass)
  {
    uint64_t v10 = [v9 objectForKeyedSubscript:@"url"];

    id v9 = (void *)v10;
  }
  uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:v9];

  return v11;
}

- (BOOL)isBaaEnabledForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    char v7 = 0;
    goto LABEL_11;
  }
  id v5 = +[AKDevice currentDevice];
  if ([v5 isInternalBuild])
  {
    char v6 = [v4 isEqualToString:@"postData"];

    if (v6)
    {
      char v7 = 1;
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v8 = [(AKURLBag *)self _requestNewURLBagIfNecessaryWithError:0];
  id v9 = [v8 objectForKeyedSubscript:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v4];
    v12 = [v11 objectForKeyedSubscript:@"baa"];
    char v7 = [v12 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

LABEL_11:
  return v7;
}

- (NSDictionary)baaConfiguration
{
  return (NSDictionary *)[(AKURLBag *)self configurationAtKey:@"baa-support" fromCache:1];
}

- (unint64_t)baaValidity
{
  v2 = [(AKURLBag *)self baaConfiguration];
  id v3 = [v2 objectForKeyedSubscript:@"cert-validity-in-days"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (NSString)baaCertIssuer
{
  v2 = [(AKURLBag *)self baaConfiguration];
  id v3 = [v2 objectForKeyedSubscript:@"cert-to-use"];

  return (NSString *)v3;
}

- (id)_requestNewURLBagIfNecessaryWithError:(id *)a3
{
  id v3 = [(AKURLBag *)self _urlBagFromCache:0 withError:a3];
  unint64_t v4 = [v3 objectForKeyedSubscript:@"urls"];

  return v4;
}

- (void)environmentValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__AKURLBag_environmentValueForKey_completion___block_invoke;
  v10[3] = &unk_1E575F898;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AKURLBag *)self _fetchURLBagFromCache:0 withCompletion:v10];
}

void __46__AKURLBag_environmentValueForKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    id v6 = [v11 objectForKeyedSubscript:@"env"];
    id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(a1 + 40);
    if (v7)
    {
      if (v8) {
        (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v7, 0);
      }
    }
    else if (v8)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7097);
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (!v9) {
      goto LABEL_11;
    }
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:underlyingError:", -7122, v5);
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v6);
  }

LABEL_11:
}

- (id)_requestEnvironmentsWithError:(id *)a3
{
  id v5 = objc_opt_class();
  id v6 = [(AKURLBag *)self _urlBagFromCache:0 withError:a3];
  id v7 = [v5 _requestEnvironmentsWithBag:v6];

  return v7;
}

+ (id)_requestEnvironmentsWithBag:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"env"];
}

- (id)_configurationsFromCache:(BOOL)a3 withError:(id *)a4
{
  unint64_t v4 = [(AKURLBag *)self _urlBagFromCache:a3 withError:a4];
  id v5 = [v4 objectForKeyedSubscript:@"cfgs"];

  return v5;
}

- (id)_urlBagFromCache:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  id v7 = [(AKURLBag *)self bagProvider];

  if (v7)
  {
    uint64_t v8 = [(AKURLBag *)self bagProvider];
    uint64_t v9 = [(AKURLBag *)self altDSID];
    [(AKAppleIDAuthenticationController *)v8 urlBagFromCache:v5 altDSID:v9 error:a4];
  }
  else
  {
    uint64_t v8 = objc_alloc_init(AKAppleIDAuthenticationController);
    uint64_t v9 = [(AKURLBag *)self altDSID];
    [(AKAppleIDAuthenticationController *)v8 _urlBagFromCache:v5 altDSID:v9 withError:a4];
  uint64_t v10 = };

  return v10;
}

- (void)_fetchURLBagFromCache:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = [(AKURLBag *)self bagProvider];

  if (v4)
  {
    if (v7)
    {
      id v8 = [(AKURLBag *)self bagProvider];
      uint64_t v9 = [(AKURLBag *)self altDSID];
      [v8 fetchURLBagForAltDSID:v9 fromCache:1 completion:v6];
    }
    else
    {
      id v11 = 0;
      uint64_t v9 = [(AKURLBag *)self _urlBagFromCache:1 withError:&v11];
      id v8 = v11;
      if (v6) {
        v6[2](v6, v9, v8);
      }
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v10 = [(AKURLBag *)self bagProvider];
    }
    else
    {
      uint64_t v10 = objc_alloc_init(AKAppleIDAuthenticationController);
    }
    id v8 = v10;
    uint64_t v9 = [(AKURLBag *)self altDSID];
    [v8 fetchURLBagForAltDSID:v9 completion:v6];
  }
}

- (void)forceUpdateBagWithUrlSwitchData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKURLBag *)self bagProvider];

  if (v8)
  {
    bagProvider = self->_bagProvider;
    id v11 = [(AKURLBag *)self altDSID];
    -[AKURLBagDictionaryProvider forceURLBagUpdateForAltDSID:urlSwitchData:completion:](bagProvider, "forceURLBagUpdateForAltDSID:urlSwitchData:completion:");
  }
  else
  {
    id v11 = objc_alloc_init(AKAppleIDAuthenticationController);
    uint64_t v10 = [(AKURLBag *)self altDSID];
    [(AKAppleIDAuthenticationController *)v11 forceURLBagUpdateForAltDSID:v10 urlSwitchData:v7 completion:v6];

    id v6 = v7;
    id v7 = (id)v10;
  }
}

- (NSURL)webAccessDisableURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"webAccessDisable"];
}

- (NSURL)webAccessEnableURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"webAccessEnable"];
}

- (NSURL)dataRecoveryServiceDisableURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"dataRecoveryServiceDisable"];
}

- (NSURL)dataRecoveryServiceEnableURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"dataRecoveryServiceEnable"];
}

- (NSURL)walrusKBURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"walrusKB"];
}

- (NSURL)walrusCountryAnchorKBURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"walrusCountryAnchorKB"];
}

- (NSURL)webAccessKBURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"webAccessKB"];
}

- (NSURL)contactKeyVerificationIneligibleDevicesURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"contactKeyVerificationIneligibleDevices"];
}

- (NSURL)startPasskeyRegistrationURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"startPasskeyRegistration"];
}

- (NSURL)finishPasskeyRegistrationURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"finishPasskeyRegistration"];
}

- (NSURL)generateVerificationTokenURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"generateVerificationToken"];
}

- (NSURL)unenrollPasskeyURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"deletePasskey"];
}

- (BOOL)isPasskeyCleanupDisabled
{
  v2 = [(AKURLBag *)self configurationAtKey:@"passkeyCleanupDisabled"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isFirstPartyURLEntitlementCheckDisabled
{
  objc_opt_class();
  id v3 = [(AKURLBag *)self configurationAtKey:@"firstPartyURLEntitlementCheckDisabled"];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  char v5 = [v4 BOOLValue];
  return v5;
}

- (BOOL)isTokenCacheDisabled
{
  objc_opt_class();
  id v3 = [(AKURLBag *)self configurationAtKey:@"tokenCacheDisabled"];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  char v5 = [v4 BOOLValue];
  return v5;
}

- (BOOL)isMIDDriftTTRDisabled
{
  objc_opt_class();
  id v3 = [(AKURLBag *)self configurationAtKey:@"midDriftTTRDisabled"];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  char v5 = [v4 BOOLValue];
  return v5;
}

- (NSURL)siwaGenerateShareToken
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"generateSharedToken"];
}

- (NSURL)siwaUpdateShareToken
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"updateSharedToken"];
}

- (NSURL)siwaRevokeShareToken
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"revokeSharedToken"];
}

- (NSURL)siwaFetchSharedGroups
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"fetchSharedTokenGroups"];
}

- (NSURL)siwaRotateShareTokens
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"rollSharedToken"];
}

- (NSURL)siwaManagementURL
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"siwaManagementUrl"];
}

- (NSArray)allKeys
{
  v2 = [(AKURLBag *)self _requestNewURLBagIfNecessaryWithError:0];
  id v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (NSURL)iForgotWebURLToIntercept
{
  return (NSURL *)[(AKURLBag *)self _urlAtKey:@"InterceptRecoveryUrl"];
}

- (BOOL)isTrustedDeviceListHashDisabled
{
  v2 = [(AKURLBag *)self configurationAtKey:@"trustedDeviceListHashDisabled"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void)setBagProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagProvider, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
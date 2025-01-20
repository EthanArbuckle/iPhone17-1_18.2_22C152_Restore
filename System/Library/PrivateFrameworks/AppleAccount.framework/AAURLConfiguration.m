@interface AAURLConfiguration
+ (AARemoteServer)remoteServer;
+ (BOOL)supportsSecureCoding;
+ (id)_urlConfigurationWithError:(id *)a3;
+ (id)itemForKey:(id)a3 error:(id *)a4;
+ (id)urlConfiguration;
+ (int64_t)beneficiaryDurationBeforeNotSetupCFU;
+ (int64_t)beneficiaryStaleInviteDuration;
+ (void)setRemoteServer:(id)a3;
- (AAURLConfiguration)init;
- (AAURLConfiguration)initWithCoder:(id)a3;
- (AAURLConfiguration)initWithDictionary:(id)a3;
- (NSArray)urlsStoringCookies;
- (NSNumber)absintheEnable;
- (NSNumber)homepodSetupiCloudTerms;
- (NSNumber)termsUIType;
- (NSString)aboutURL;
- (NSString)acceptChildTransferURL;
- (NSString)acceptFamilyInviteURL;
- (NSString)acceptFamilyInviteV2URL;
- (NSString)accountCreationUIURL;
- (NSString)accountCreationURL;
- (NSString)accountManagementUIURL;
- (NSString)addEmailURL;
- (NSString)addFamilyMemberUIURL;
- (NSString)apsEnvironment;
- (NSString)authenticateURL;
- (NSString)checkiCloudMembershipURL;
- (NSString)childAccountCreationUIURL;
- (NSString)cloudKitDevicesListURL;
- (NSString)cloudKitMigrationStateURL;
- (NSString)cloudKitStartMigrationURL;
- (NSString)completeValidateEmailURL;
- (NSString)createDelegatesURL;
- (NSString)declineFamilyInviteURL;
- (NSString)deviceListURL;
- (NSString)devicesUIURL;
- (NSString)dismissAlertURL;
- (NSString)emailLookupURL;
- (NSString)existingAppleIDTermsUIURL;
- (NSString)familyEligibilityURL;
- (NSString)familyInviteSentV2URL;
- (NSString)familyLearnMoreURL;
- (NSString)familyMemberDetailsUIURL;
- (NSString)familyPaymentCardUIURL;
- (NSString)familyPaymentInfoURL;
- (NSString)familySetupUIURL;
- (NSString)familyUIURL;
- (NSString)fetchAccountSettingsURL;
- (NSString)fetchFamilyInviteV2URL;
- (NSString)finishProvisioningURL;
- (NSString)fmipAuthenticate;
- (NSString)genericTermsURL;
- (NSString)getAccountEventDetailsURL;
- (NSString)getDeviceListURL;
- (NSString)getFamilyDetailsURL;
- (NSString)getFamilyMemberPhotoURL;
- (NSString)getFamilyPushDetailsURL;
- (NSString)getMyPhotoURL;
- (NSString)grandslamURL;
- (NSString)iForgotUIURL;
- (NSString)initiateFamilyV2URL;
- (NSString)initiateValidateEmailURL;
- (NSString)loginAccountURL;
- (NSString)loginDelegatesURL;
- (NSString)loginOrCreateDelegatesURL;
- (NSString)mobileMeOfferAlertURL;
- (NSString)passwordSecurityUIURL;
- (NSString)paymentInfoUIURL;
- (NSString)paymentSummaryURL;
- (NSString)pendingFamilyInvitesUIURL;
- (NSString)personalInfoUIURL;
- (NSString)registerDeviceURL;
- (NSString)registerURL;
- (NSString)rejectChildTransferURL;
- (NSString)repairCloudAccountUIURL;
- (NSString)secondaryAuthenticationURL;
- (NSString)sendCodeURL;
- (NSString)signInURL;
- (NSString)signingSessionCertURL;
- (NSString)signingSessionURL;
- (NSString)startFamilyInviteV2URL;
- (NSString)syncMachineURL;
- (NSString)termsReportUserActionURL;
- (NSString)unregisterDeviceURL;
- (NSString)updateAccountUIURL;
- (NSString)updateAccountURL;
- (NSString)updateMyPhotoURL;
- (NSString)updateNameURL;
- (NSString)validateURL;
- (NSString)verifyCodeURL;
- (NSString)walrusWebAccessPCSAuthURL;
- (id)_envStringForKey:(id)a3;
- (id)_urlStringForKey:(id)a3;
- (id)description;
- (id)urlForEndpoint:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAURLConfiguration

+ (AARemoteServer)remoteServer
{
  if (remoteServer_onceToken != -1) {
    dispatch_once(&remoteServer_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)_AAURLConfigurationRemoteServer;

  return (AARemoteServer *)v2;
}

void __34__AAURLConfiguration_remoteServer__block_invoke()
{
  if (!_AAURLConfigurationRemoteServer)
  {
    _AAURLConfigurationRemoteServer = +[AARemoteServer sharedServer];
    MEMORY[0x1F41817F8]();
  }
}

+ (void)setRemoteServer:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"AAURLConfiguration.m", 42, @"Invalid parameter not satisfying: %@", @"remoteServer" object file lineNumber description];
  }
  v6 = (void *)_AAURLConfigurationRemoteServer;
  _AAURLConfigurationRemoteServer = (uint64_t)v5;
}

- (AAURLConfiguration)init
{
  return 0;
}

- (AAURLConfiguration)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"AAURLConfiguration.m", 57, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)AAURLConfiguration;
  v6 = [(AAURLConfiguration *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v7;
  }
  return v6;
}

- (AAURLConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AAURLConfiguration;
  id v5 = [(AAURLConfiguration *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    objc_super v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"configuration-dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)urlForEndpoint:(id)a3
{
  dictionary = self->_dictionary;
  id v4 = a3;
  id v5 = [(NSDictionary *)dictionary objectForKeyedSubscript:@"urls"];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSNumber)absintheEnable
{
  objc_opt_class();
  v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"configuration"];
  id v4 = [v3 objectForKeyedSubscript:@"abs-enable"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSNumber)termsUIType
{
  objc_opt_class();
  v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"configuration"];
  id v4 = [v3 objectForKeyedSubscript:@"terms-ui-type"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSNumber)homepodSetupiCloudTerms
{
  objc_opt_class();
  v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"configuration"];
  id v4 = [v3 objectForKeyedSubscript:@"homepod-setup-icloud-terms"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v5, self, self->_dictionary];

  return v6;
}

- (void).cxx_destruct
{
}

+ (id)urlConfiguration
{
  return (id)[a1 _urlConfigurationWithError:0];
}

+ (id)itemForKey:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v17 = 0;
  uint64_t v7 = [a1 _urlConfigurationWithError:&v17];
  id v8 = v17;
  uint64_t v9 = v8;
  if (a4 && v8)
  {
    uint64_t v10 = 0;
    *a4 = v8;
  }
  else
  {
    uint64_t v11 = [v7 _urlStringForKey:v6];
    uint64_t v10 = (void *)v11;
    if (a4 && !v11)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v14 = [v13 localizedStringForKey:@"ICLOUD_CONFIG_ERROR" value:0 table:@"Localizable"];
      v19[0] = v14;
      objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a4 = [v12 errorWithDomain:@"com.apple.appleaccount" code:-2 userInfo:v15];
    }
  }

  return v10;
}

+ (id)_urlConfigurationWithError:(id *)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [a1 remoteServer];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__AAURLConfiguration_Deprecated___urlConfigurationWithError___block_invoke;
  v10[3] = &unk_1E5A49DD8;
  uint64_t v12 = &v20;
  v13 = &v14;
  uint64_t v7 = v5;
  uint64_t v11 = v7;
  [v6 configurationWithCompletion:v10];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __61__AAURLConfiguration_Deprecated___urlConfigurationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSArray)urlsStoringCookies
{
  objc_opt_class();
  id v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"cookieDomainUrls"];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (id)_envStringForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"env"];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  objc_opt_class();
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (NSString)apsEnvironment
{
  return (NSString *)[(AAURLConfiguration *)self _envStringForKey:@"apsEnv"];
}

- (id)_urlStringForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"urls"];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  objc_opt_class();
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (NSString)accountCreationURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"newAccount"];
}

- (NSString)updateAccountURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"updateAccount"];
}

- (NSString)registerURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"register"];
}

- (NSString)validateURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"validate"];
}

- (NSString)accountCreationUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"newAccountUI"];
}

- (NSString)updateAccountUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"updateAccountUI"];
}

- (NSString)signInURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loginOrCreateAccount"];
}

- (NSString)fetchAccountSettingsURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"getAccountSettings"];
}

- (NSString)authenticateURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"authenticate"];
}

- (NSString)initiateValidateEmailURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"validateEmail"];
}

- (NSString)addEmailURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"addEmailUI"];
}

- (NSString)completeValidateEmailURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"completeVetting"];
}

- (NSString)mobileMeOfferAlertURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"rampAlert"];
}

- (NSString)signingSessionCertURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"qualifyCert"];
}

- (NSString)signingSessionURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"qualifySession"];
}

- (NSString)emailLookupURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"emailLookup"];
}

- (NSString)genericTermsURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"genericTermsUI"];
}

- (NSString)termsReportUserActionURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"termsReportUserAction"];
}

- (NSString)fmipAuthenticate
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"fmipauthenticate"];
}

- (NSString)iForgotUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"iForgotBuddyML"];
}

- (NSString)existingAppleIDTermsUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"existingAppleIdTermsUI"];
}

- (NSString)finishProvisioningURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"md-finish-provisioning"];
}

- (NSString)syncMachineURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"md-sync-machine"];
}

- (NSString)loginAccountURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"unifiedLoginAccount"];
}

- (NSString)loginDelegatesURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loginDelegates"];
}

- (NSString)createDelegatesURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"createDelegateAccounts"];
}

- (NSString)loginOrCreateDelegatesURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loginOrCreateSSODelegates"];
}

- (NSString)deviceListURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"deviceListUrl"];
}

- (NSString)sendCodeURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"sendCodeUrl"];
}

- (NSString)verifyCodeURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"verifyCodeUrl"];
}

- (NSString)accountManagementUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadAccountUI"];
}

- (NSString)familyUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadFamilyUI"];
}

- (NSString)devicesUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadDevicesUI"];
}

- (NSString)paymentSummaryURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadPaymentInfoUI"];
}

- (NSString)familySetupUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"setUpFamilyUI"];
}

- (NSString)personalInfoUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadPersonalInfoUI"];
}

- (NSString)passwordSecurityUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadPasswordSecurityUI"];
}

- (NSString)paymentInfoUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadPaymentUI"];
}

- (NSString)registerDeviceURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"registerDevice"];
}

- (NSString)unregisterDeviceURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"deregisterDevice"];
}

- (NSString)getFamilyPushDetailsURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"getFamilyEventDetails"];
}

- (NSString)getAccountEventDetailsURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"getAccountEventDetails"];
}

- (NSString)acceptFamilyInviteURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"acceptFamilyInvitation"];
}

- (NSString)declineFamilyInviteURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"rejectFamilyInvitation"];
}

- (NSString)secondaryAuthenticationURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"secondaryAuthUrl"];
}

- (NSString)getMyPhotoURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"getMeCardPhoto"];
}

- (NSString)updateMyPhotoURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"putMeCardPhoto"];
}

- (NSString)getFamilyMemberPhotoURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"getFamilyMemberPhoto"];
}

- (NSString)familyEligibilityURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"checkFamilyEligibility"];
}

- (NSString)checkiCloudMembershipURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"checkiCloudMembership"];
}

- (NSString)pendingFamilyInvitesUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadFamilyInvitationsUI"];
}

- (NSString)updateNameURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"updateNameUrl"];
}

- (NSString)familyMemberDetailsUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"viewMemberDetailsUI"];
}

- (NSString)addFamilyMemberUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"addFamilyMemberUI"];
}

- (NSString)getFamilyDetailsURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"getFamilyDetails"];
}

- (NSString)childAccountCreationUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"createChildAccountUI"];
}

- (NSString)grandslamURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"grandslamUrl"];
}

- (NSString)acceptChildTransferURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"acceptChildTransferRequest"];
}

- (NSString)rejectChildTransferURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"rejectChildTransferRequest"];
}

- (NSString)familyLearnMoreURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"familyLearnMoreURL"];
}

- (NSString)cloudKitMigrationStateURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"icdMigrateStatus"];
}

- (NSString)cloudKitStartMigrationURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"icdMigrateInit"];
}

- (NSString)cloudKitDevicesListURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"icdMigrateDevices"];
}

- (NSString)familyPaymentInfoURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"getFamilyPaymentInfo"];
}

- (NSString)aboutURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"about"];
}

- (NSString)familyPaymentCardUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"loadFamilyPaymentCardUI"];
}

- (NSString)dismissAlertURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"dismissAccountAlert"];
}

- (NSString)getDeviceListURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"getDeviceList"];
}

- (NSString)repairCloudAccountUIURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"repairCloudAccountUI"];
}

- (NSString)walrusWebAccessPCSAuthURL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"walrusWebAccessPCSAuthKey"];
}

- (NSString)initiateFamilyV2URL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"initiateFamily.v2"];
}

- (NSString)startFamilyInviteV2URL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"startFamilyInvite.v2"];
}

- (NSString)familyInviteSentV2URL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"familyInviteSent.v2"];
}

- (NSString)fetchFamilyInviteV2URL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"fetchFamilyInvite.v2"];
}

- (NSString)acceptFamilyInviteV2URL
{
  return (NSString *)[(AAURLConfiguration *)self _urlStringForKey:@"acceptFamilyInvite.v2"];
}

+ (int64_t)beneficiaryStaleInviteDuration
{
  v2 = [MEMORY[0x1E4F4F0C8] bagForAltDSID:0];
  id v3 = [v2 inheritanceConfiguration];

  id v4 = [v3 objectForKeyedSubscript:AAInheritanceConfigStaleInviteDurationKey[0]];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 integerValue];
    if (v6 >= 0) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = -v6;
    }
  }
  else
  {
    id v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[AAURLConfiguration(Deprecated) beneficiaryStaleInviteDuration](v8);
    }

    int64_t v7 = 43200;
  }

  return v7;
}

+ (int64_t)beneficiaryDurationBeforeNotSetupCFU
{
  v2 = [MEMORY[0x1E4F4F0C8] bagForAltDSID:0];
  id v3 = [v2 inheritanceConfiguration];

  id v4 = [v3 objectForKeyedSubscript:AAInheritanceConfigDurationBeforeNotSetupCFUKey];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 integerValue];
    if (v6 >= 0) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = -v6;
    }
  }
  else
  {
    id v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[AAURLConfiguration(Deprecated) beneficiaryDurationBeforeNotSetupCFU](v8);
    }

    int64_t v7 = 86400;
  }

  return v7;
}

@end
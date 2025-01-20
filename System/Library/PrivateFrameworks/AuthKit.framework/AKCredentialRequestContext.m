@interface AKCredentialRequestContext
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationRequest)authorizationRequest;
- (AKAuthorizationUpgradeContext)_upgradeContext;
- (AKCredentialRequestContext)init;
- (AKCredentialRequestContext)initWithCoder:(id)a3;
- (AKCredentialRequestContext)initWithProxiedClientContext:(id)a3;
- (AKCredentialRequestContext)initWithUpgradeContext:(id)a3;
- (AKPasswordRequest)passwordRequest;
- (BOOL)_clientShouldAuthenticateExternally;
- (BOOL)_isEligibleForUpgradeFromPassword;
- (BOOL)_isFirstPartyLogin;
- (BOOL)_isItunesLogin;
- (BOOL)_isRapportLogin;
- (BOOL)_isSubscriptionLogin;
- (BOOL)_isWebLogin;
- (BOOL)_requirePassword;
- (BOOL)_shouldForcePrivateEmail;
- (BOOL)_shouldForceUI;
- (BOOL)_shouldShowAdditionalCTA;
- (BOOL)_shouldSkipAuthorizationUI;
- (BOOL)_shouldSkipBiometrics;
- (BOOL)_shouldUseProxiedClientBundleIDForSRP;
- (NSArray)_proxiedAssociatedDomains;
- (NSArray)credentialRequests;
- (NSData)_externalLocalAuthData;
- (NSData)_iconData;
- (NSNumber)_iconScale;
- (NSString)_callerBundleID;
- (NSString)_callerSceneID;
- (NSString)_continuationRequestIdentifier;
- (NSString)_externalAuthToken;
- (NSString)_iconName;
- (NSString)_informativeText;
- (NSString)_proxiedClientAppID;
- (NSString)_proxiedClientAppName;
- (NSString)_proxiedClientBundleID;
- (NSString)_proxiedClientServiceID;
- (NSString)_proxiedClientTeamID;
- (NSString)_proxiedDeviceClass;
- (NSString)_proxiedDeviceName;
- (NSString)_sessionID;
- (NSUUID)requestIdentifier;
- (NSValue)_iconSize;
- (double)_authSessionTimeoutInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)requestOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationRequest:(id)a3;
- (void)setCredentialRequests:(id)a3;
- (void)setPasswordRequest:(id)a3;
- (void)setRequestOptions:(unint64_t)a3;
- (void)set_authSessionTimeoutInterval:(double)a3;
- (void)set_callerBundleID:(id)a3;
- (void)set_callerSceneID:(id)a3;
- (void)set_clientShouldAuthenticateExternally:(BOOL)a3;
- (void)set_continuationRequestIdentifier:(id)a3;
- (void)set_externalAuthToken:(id)a3;
- (void)set_externalLocalAuthData:(id)a3;
- (void)set_iconData:(id)a3;
- (void)set_iconName:(id)a3;
- (void)set_iconScale:(id)a3;
- (void)set_iconSize:(id)a3;
- (void)set_informativeText:(id)a3;
- (void)set_isFirstPartyLogin:(BOOL)a3;
- (void)set_isItunesLogin:(BOOL)a3;
- (void)set_isRapportLogin:(BOOL)a3;
- (void)set_isWebLogin:(BOOL)a3;
- (void)set_proxiedAssociatedDomains:(id)a3;
- (void)set_proxiedClientAppID:(id)a3;
- (void)set_proxiedClientAppName:(id)a3;
- (void)set_proxiedClientBundleID:(id)a3;
- (void)set_proxiedClientServiceID:(id)a3;
- (void)set_proxiedClientTeamID:(id)a3;
- (void)set_proxiedDeviceClass:(id)a3;
- (void)set_proxiedDeviceName:(id)a3;
- (void)set_requirePassword:(BOOL)a3;
- (void)set_sessionID:(id)a3;
- (void)set_shouldForcePrivateEmail:(BOOL)a3;
- (void)set_shouldForceUI:(BOOL)a3;
- (void)set_shouldShowAdditionalCTA:(BOOL)a3;
- (void)set_shouldSkipAuthorizationUI:(BOOL)a3;
- (void)set_shouldSkipBiometrics:(BOOL)a3;
- (void)set_shouldUseProxiedClientBundleIDForSRP:(BOOL)a3;
@end

@implementation AKCredentialRequestContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  requestIdentifier = self->_requestIdentifier;
  id v5 = a3;
  [v5 encodeObject:requestIdentifier forKey:@"_requestIdentifier"];
  [v5 encodeBool:self->_shouldForceUI forKey:@"_shoudlForceUI"];
  [v5 encodeBool:self->_shouldSkipBiometrics forKey:@"_shoudlSkipBiometrics"];
  [v5 encodeBool:self->_shouldSkipAuthorizationUI forKey:@"_shoudlSkipUI"];
  [v5 encodeObject:self->_iconName forKey:@"_iconName"];
  [v5 encodeObject:self->_iconData forKey:@"_iconData"];
  [v5 encodeObject:self->_iconScale forKey:@"_iconScale"];
  [v5 encodeObject:self->_iconSize forKey:@"_iconSize"];
  [v5 encodeBool:self->_shouldForcePrivateEmail forKey:@"_shouldForcePrivateEmail"];
  [v5 encodeObject:self->_proxiedClientAppName forKey:@"_proxiedClientAppName"];
  [v5 encodeObject:self->_proxiedClientBundleID forKey:@"_proxiedClientBundleID"];
  [v5 encodeObject:self->_proxiedClientTeamID forKey:@"_proxiedClientTeamID"];
  [v5 encodeObject:self->_proxiedClientAppID forKey:@"_proxiedClientAppID"];
  [v5 encodeObject:self->_proxiedAssociatedDomains forKey:@"_proxiedAssociatedDomains"];
  [v5 encodeObject:self->_proxiedDeviceName forKey:@"_proxiedDeviceName"];
  [v5 encodeObject:self->_proxiedDeviceClass forKey:@"_proxiedDeviceClass"];
  [v5 encodeObject:self->_authorizationRequest forKey:@"_authorizationRequests"];
  [v5 encodeObject:self->_passwordRequest forKey:@"_passwordRequests"];
  [v5 encodeBool:self->_isWebLogin forKey:@"_isWebLogin"];
  [v5 encodeBool:self->_isFirstPartyLogin forKey:@"_isFirstPartyLogin"];
  [v5 encodeBool:self->_isRapportLogin forKey:@"_isRapportLogin"];
  [v5 encodeBool:self->_isEligibleForUpgradeFromPassword forKey:@"_upgradeFromPassword"];
  [v5 encodeObject:self->_callerBundleID forKey:@"_callerBundleID"];
  [v5 encodeObject:self->_callerSceneID forKey:@"_callerSceneID"];
  [v5 encodeBool:self->_requirePassword forKey:@"_requirePassword"];
  [v5 encodeObject:self->_proxiedClientServiceID forKey:@"_proxiedServiceID"];
  [v5 encodeObject:self->_upgradeContext forKey:@"_upgradeContext"];
  [v5 encodeBool:self->_clientShouldAuthenticateExternally forKey:@"_clientShouldAuthenticateExternally"];
  [v5 encodeDouble:@"_authSessionTimeout" forKey:self->_authSessionTimeoutInterval];
  [v5 encodeObject:self->_externalAuthToken forKey:@"_externalAuthToken"];
  [v5 encodeObject:self->_externalLocalAuthData forKey:@"_externalLocalAuthData"];
  [v5 encodeObject:self->_continuationRequestIdentifier forKey:@"_continuationRequestIdentifier"];
  [v5 encodeInteger:self->_requestOptions forKey:@"_requestOptions"];
  [v5 encodeObject:self->_sessionID forKey:@"_sessionID"];
  [v5 encodeBool:self->_shouldUseProxiedClientBundleIDForSRP forKey:@"_shouldUseProxiedClientBundleIDForSRP"];
  [v5 encodeBool:self->_isItunesLogin forKey:@"_isItunesLogin"];
  [v5 encodeBool:self->_shouldShowAdditionalCTA forKey:@"_shouldShowAdditionalCTA"];
}

- (AKCredentialRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)AKCredentialRequestContext;
  id v5 = [(AKCredentialRequestContext *)&v56 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v9;

    v5->_shouldForceUI = [v4 decodeBoolForKey:@"_shoudlForceUI"];
    v5->_shouldSkipBiometrics = [v4 decodeBoolForKey:@"_shoudlSkipBiometrics"];
    v5->_shouldSkipAuthorizationUI = [v4 decodeBoolForKey:@"_shoudlSkipUI"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_iconName"];
    iconName = v5->_iconName;
    v5->_iconName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_iconData"];
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_iconScale"];
    iconScale = v5->_iconScale;
    v5->_iconScale = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_iconSize"];
    iconSize = v5->_iconSize;
    v5->_iconSize = (NSValue *)v17;

    v5->_shouldForcePrivateEmail = [v4 decodeBoolForKey:@"_shouldForcePrivateEmail"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedClientAppName"];
    proxiedClientAppName = v5->_proxiedClientAppName;
    v5->_proxiedClientAppName = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedClientBundleID"];
    proxiedClientBundleID = v5->_proxiedClientBundleID;
    v5->_proxiedClientBundleID = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedClientTeamID"];
    proxiedClientTeamID = v5->_proxiedClientTeamID;
    v5->_proxiedClientTeamID = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedClientAppID"];
    proxiedClientAppID = v5->_proxiedClientAppID;
    v5->_proxiedClientAppID = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClasses:v8 forKey:@"_proxiedAssociatedDomains"];
    proxiedAssociatedDomains = v5->_proxiedAssociatedDomains;
    v5->_proxiedAssociatedDomains = (NSArray *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedDeviceName"];
    proxiedDeviceName = v5->_proxiedDeviceName;
    v5->_proxiedDeviceName = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedDeviceClass"];
    proxiedDeviceClass = v5->_proxiedDeviceClass;
    v5->_proxiedDeviceClass = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_authorizationRequests"];
    authorizationRequest = v5->_authorizationRequest;
    v5->_authorizationRequest = (AKAuthorizationRequest *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passwordRequests"];
    passwordRequest = v5->_passwordRequest;
    v5->_passwordRequest = (AKPasswordRequest *)v35;

    v5->_isWebLogin = [v4 decodeBoolForKey:@"_isWebLogin"];
    v5->_isFirstPartyLogin = [v4 decodeBoolForKey:@"_isFirstPartyLogin"];
    v5->_isRapportLogin = [v4 decodeBoolForKey:@"_isRapportLogin"];
    v5->_isEligibleForUpgradeFromPassword = [v4 decodeBoolForKey:@"_upgradeFromPassword"];
    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_callerBundleID"];
    callerBundleID = v5->_callerBundleID;
    v5->_callerBundleID = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_callerSceneID"];
    callerSceneID = v5->_callerSceneID;
    v5->_callerSceneID = (NSString *)v39;

    v5->_requirePassword = [v4 decodeBoolForKey:@"_requirePassword"];
    v41 = +[AKDevice currentDevice];
    v5->_passcodeProtected = [v41 isProtectedWithPasscode];

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedServiceID"];
    proxiedClientServiceID = v5->_proxiedClientServiceID;
    v5->_proxiedClientServiceID = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_upgradeContext"];
    upgradeContext = v5->_upgradeContext;
    v5->_upgradeContext = (AKAuthorizationUpgradeContext *)v44;

    v5->_clientShouldAuthenticateExternally = [v4 decodeBoolForKey:@"_clientShouldAuthenticateExternally"];
    [v4 decodeDoubleForKey:@"_authSessionTimeout"];
    v5->_authSessionTimeoutInterval = v46;
    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalAuthToken"];
    externalAuthToken = v5->_externalAuthToken;
    v5->_externalAuthToken = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalLocalAuthData"];
    externalLocalAuthData = v5->_externalLocalAuthData;
    v5->_externalLocalAuthData = (NSData *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_continuationRequestIdentifier"];
    continuationRequestIdentifier = v5->_continuationRequestIdentifier;
    v5->_continuationRequestIdentifier = (NSString *)v51;

    v5->_requestOptions = [v4 decodeIntegerForKey:@"_requestOptions"];
    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v53;

    v5->_shouldUseProxiedClientBundleIDForSRP = [v4 decodeBoolForKey:@"_shouldUseProxiedClientBundleIDForSRP"];
    v5->_isItunesLogin = [v4 decodeBoolForKey:@"_isItunesLogin"];
    v5->_shouldShowAdditionalCTA = [v4 decodeBoolForKey:@"_shouldShowAdditionalCTA"];
  }
  return v5;
}

- (AKCredentialRequestContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKCredentialRequestContext;
  v2 = [(AKCredentialRequestContext *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    requestIdentifier = v2->_requestIdentifier;
    v2->_requestIdentifier = (NSUUID *)v3;

    id v5 = +[AKDevice currentDevice];
    v2->_passcodeProtected = [v5 isProtectedWithPasscode];
  }
  return v2;
}

- (AKCredentialRequestContext)initWithUpgradeContext:(id)a3
{
  id v5 = a3;
  v6 = [(AKCredentialRequestContext *)self init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_upgradeContext, a3);
    v8 = objc_alloc_init(AKAuthorizationRequest);
    authorizationRequest = v7->_authorizationRequest;
    v7->_authorizationRequest = v8;

    v10 = [v5 bundleID];
    [(AKAuthorizationRequest *)v7->_authorizationRequest setClientID:v10];

    uint64_t v11 = [v5 teamID];
    [(AKAuthorizationRequest *)v7->_authorizationRequest setTeamID:v11];

    v12 = [v5 nonce];
    [(AKAuthorizationRequest *)v7->_authorizationRequest setNonce:v12];

    uint64_t v13 = [v5 state];
    [(AKAuthorizationRequest *)v7->_authorizationRequest setState:v13];

    [(AKAuthorizationRequest *)v7->_authorizationRequest setIsEligibleForUpgradeFromPassword:1];
  }

  return v7;
}

- (AKCredentialRequestContext)initWithProxiedClientContext:(id)a3
{
  id v4 = a3;
  id v5 = [(AKCredentialRequestContext *)self init];
  if (v5)
  {
    v6 = [v4 teamID];
    uint64_t v7 = [v6 copy];
    proxiedClientTeamID = v5->_proxiedClientTeamID;
    v5->_proxiedClientTeamID = (NSString *)v7;

    uint64_t v9 = [v4 bundleID];
    uint64_t v10 = [v9 copy];
    proxiedClientBundleID = v5->_proxiedClientBundleID;
    v5->_proxiedClientBundleID = (NSString *)v10;

    v12 = [v4 appID];
    uint64_t v13 = [v12 copy];
    proxiedClientAppID = v5->_proxiedClientAppID;
    v5->_proxiedClientAppID = (NSString *)v13;

    uint64_t v15 = [v4 appName];
    uint64_t v16 = [v15 copy];
    proxiedClientAppName = v5->_proxiedClientAppName;
    v5->_proxiedClientAppName = (NSString *)v16;

    v18 = [v4 associatedDomains];
    uint64_t v19 = [v18 copy];
    proxiedAssociatedDomains = v5->_proxiedAssociatedDomains;
    v5->_proxiedAssociatedDomains = (NSArray *)v19;

    uint64_t v21 = [v4 deviceClass];
    uint64_t v22 = [v21 copy];
    proxiedDeviceClass = v5->_proxiedDeviceClass;
    v5->_proxiedDeviceClass = (NSString *)v22;

    v24 = [v4 deviceName];
    uint64_t v25 = [v24 copy];
    proxiedDeviceName = v5->_proxiedDeviceName;
    v5->_proxiedDeviceName = (NSString *)v25;

    v5->_isRapportLogin = [v4 isRapportLogin];
    v5->_shouldSkipAuthorizationUI = [v4 shouldSkipAuthorizationUI];
  }

  return v5;
}

- (void)setCredentialRequests:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "aaf_firstObjectPassingTest:", &__block_literal_global_13);
  id v5 = (AKPasswordRequest *)objc_claimAutoreleasedReturnValue();
  passwordRequest = self->_passwordRequest;
  self->_passwordRequest = v5;

  objc_msgSend(v4, "aaf_firstObjectPassingTest:", &__block_literal_global_142);
  uint64_t v7 = (AKAuthorizationRequest *)objc_claimAutoreleasedReturnValue();

  authorizationRequest = self->_authorizationRequest;
  self->_authorizationRequest = v7;
}

uint64_t __52__AKCredentialRequestContext_setCredentialRequests___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__AKCredentialRequestContext_setCredentialRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isEligibleForUpgradeFromPassword
{
  return self->_upgradeContext
      || [(AKAuthorizationRequest *)self->_authorizationRequest isEligibleForUpgradeFromPassword];
}

- (BOOL)_isSubscriptionLogin
{
  return self->_clientShouldAuthenticateExternally || self->_shouldUseProxiedClientBundleIDForSRP;
}

- (NSString)_proxiedClientAppName
{
  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    id v4 = [(AKAuthorizationUpgradeContext *)upgradeContext appName];
  }
  else
  {
    id v4 = self->_proxiedClientAppName;
  }

  return v4;
}

- (NSString)_proxiedClientBundleID
{
  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    id v4 = [(AKAuthorizationUpgradeContext *)upgradeContext bundleID];
  }
  else
  {
    id v4 = self->_proxiedClientBundleID;
  }

  return v4;
}

- (NSString)_proxiedClientServiceID
{
  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    id v4 = [(AKAuthorizationUpgradeContext *)upgradeContext serviceID];
  }
  else
  {
    id v4 = self->_proxiedClientServiceID;
  }

  return v4;
}

- (NSString)_proxiedClientTeamID
{
  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    id v4 = [(AKAuthorizationUpgradeContext *)upgradeContext teamID];
  }
  else
  {
    id v4 = self->_proxiedClientTeamID;
  }

  return v4;
}

- (NSString)_proxiedClientAppID
{
  upgradeContext = self->_upgradeContext;
  if (upgradeContext)
  {
    id v4 = [(AKAuthorizationUpgradeContext *)upgradeContext appID];
  }
  else
  {
    id v4 = self->_proxiedClientAppID;
  }

  return v4;
}

- (NSArray)credentialRequests
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_passwordRequest) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_authorizationRequest) {
    objc_msgSend(v4, "addObject:");
  }

  return (NSArray *)v4;
}

- (BOOL)_requirePassword
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AKCredentialRequestContext *)self authorizationRequest];

  if (v3)
  {
    id v4 = [(AKCredentialRequestContext *)self authorizationRequest];
    id v5 = [v4 authkitAccount];

    if (v5)
    {
      v6 = +[AKAccountManager sharedInstance];
      uint64_t v7 = [v6 continuationTokenForAccount:v5];
      BOOL v8 = v7 == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v9 = _AKLogSiwa();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_passcodeProtected) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    int v12 = 138412290;
    uint64_t v13 = v10;
    _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Passcode protected: %@", (uint8_t *)&v12, 0xCu);
  }

  if (self->_requirePassword) {
    return 1;
  }
  if (self->_passcodeProtected) {
    return v8;
  }
  return 1;
}

- (void)set_requirePassword:(BOOL)a3
{
  self->_requirePassword = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AKCredentialRequestContext);
  uint64_t v5 = [(NSUUID *)self->_requestIdentifier copy];
  requestIdentifier = v4->_requestIdentifier;
  v4->_requestIdentifier = (NSUUID *)v5;

  v4->_shouldForceUI = self->_shouldForceUI;
  v4->_shouldSkipBiometrics = self->_shouldSkipBiometrics;
  v4->_shouldSkipAuthorizationUI = self->_shouldSkipAuthorizationUI;
  uint64_t v7 = [(NSString *)self->_iconName copy];
  iconName = v4->_iconName;
  v4->_iconName = (NSString *)v7;

  uint64_t v9 = [(NSData *)self->_iconData copy];
  iconData = v4->_iconData;
  v4->_iconData = (NSData *)v9;

  uint64_t v11 = [(NSNumber *)self->_iconScale copy];
  iconScale = v4->_iconScale;
  v4->_iconScale = (NSNumber *)v11;

  uint64_t v13 = [(NSValue *)self->_iconSize copy];
  iconSize = v4->_iconSize;
  v4->_iconSize = (NSValue *)v13;

  v4->_shouldForcePrivateEmail = self->_shouldForcePrivateEmail;
  uint64_t v15 = [(NSString *)self->_proxiedClientAppName copy];
  proxiedClientAppName = v4->_proxiedClientAppName;
  v4->_proxiedClientAppName = (NSString *)v15;

  uint64_t v17 = [(NSString *)self->_proxiedClientBundleID copy];
  proxiedClientBundleID = v4->_proxiedClientBundleID;
  v4->_proxiedClientBundleID = (NSString *)v17;

  uint64_t v19 = [(NSString *)self->_proxiedClientTeamID copy];
  proxiedClientTeamID = v4->_proxiedClientTeamID;
  v4->_proxiedClientTeamID = (NSString *)v19;

  uint64_t v21 = [(NSString *)self->_proxiedClientAppID copy];
  proxiedClientAppID = v4->_proxiedClientAppID;
  v4->_proxiedClientAppID = (NSString *)v21;

  uint64_t v23 = [(NSArray *)self->_proxiedAssociatedDomains copy];
  proxiedAssociatedDomains = v4->_proxiedAssociatedDomains;
  v4->_proxiedAssociatedDomains = (NSArray *)v23;

  uint64_t v25 = [(NSString *)self->_proxiedDeviceName copy];
  proxiedDeviceName = v4->_proxiedDeviceName;
  v4->_proxiedDeviceName = (NSString *)v25;

  uint64_t v27 = [(NSString *)self->_proxiedDeviceClass copy];
  proxiedDeviceClass = v4->_proxiedDeviceClass;
  v4->_proxiedDeviceClass = (NSString *)v27;

  uint64_t v29 = [(AKAuthorizationRequest *)self->_authorizationRequest copy];
  authorizationRequest = v4->_authorizationRequest;
  v4->_authorizationRequest = (AKAuthorizationRequest *)v29;

  uint64_t v31 = [(AKPasswordRequest *)self->_passwordRequest copy];
  passwordRequest = v4->_passwordRequest;
  v4->_passwordRequest = (AKPasswordRequest *)v31;

  v4->_isWebLogin = self->_isWebLogin;
  v4->_isFirstPartyLogin = self->_isFirstPartyLogin;
  v4->_isRapportLogin = self->_isRapportLogin;
  v4->_isEligibleForUpgradeFromPassword = self->_isEligibleForUpgradeFromPassword;
  uint64_t v33 = [(NSString *)self->_callerBundleID copy];
  callerBundleID = v4->_callerBundleID;
  v4->_callerBundleID = (NSString *)v33;

  uint64_t v35 = [(NSString *)self->_callerSceneID copy];
  callerSceneID = v4->_callerSceneID;
  v4->_callerSceneID = (NSString *)v35;

  v4->_requirePassword = self->_requirePassword;
  uint64_t v37 = +[AKDevice currentDevice];
  v4->_passcodeProtected = [v37 isProtectedWithPasscode];

  uint64_t v38 = [(NSString *)self->_proxiedClientServiceID copy];
  proxiedClientServiceID = v4->_proxiedClientServiceID;
  v4->_proxiedClientServiceID = (NSString *)v38;

  uint64_t v40 = [(AKAuthorizationUpgradeContext *)self->_upgradeContext copy];
  upgradeContext = v4->_upgradeContext;
  v4->_upgradeContext = (AKAuthorizationUpgradeContext *)v40;

  v4->_clientShouldAuthenticateExternally = self->_clientShouldAuthenticateExternally;
  v4->_authSessionTimeoutInterval = self->_authSessionTimeoutInterval;
  uint64_t v42 = [(NSString *)self->_externalAuthToken copy];
  externalAuthToken = v4->_externalAuthToken;
  v4->_externalAuthToken = (NSString *)v42;

  uint64_t v44 = [(NSData *)self->_externalLocalAuthData copy];
  externalLocalAuthData = v4->_externalLocalAuthData;
  v4->_externalLocalAuthData = (NSData *)v44;

  uint64_t v46 = [(NSString *)self->_continuationRequestIdentifier copy];
  continuationRequestIdentifier = v4->_continuationRequestIdentifier;
  v4->_continuationRequestIdentifier = (NSString *)v46;

  v4->_requestOptions = self->_requestOptions;
  uint64_t v48 = [(NSString *)self->_sessionID copy];
  sessionID = v4->_sessionID;
  v4->_sessionID = (NSString *)v48;

  v4->_shouldUseProxiedClientBundleIDForSRP = self->_shouldUseProxiedClientBundleIDForSRP;
  v4->_isItunesLogin = self->_isItunesLogin;
  v4->_shouldShowAdditionalCTA = self->_shouldShowAdditionalCTA;
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p> \nAuthorization Request %@ \nPassword Request: %@ \nProxied App Name: %@\nProxied BundleID: %@\nProxied Team: %@ \nSession ID: %@ \n_isWebLogin: %d \n_isFirstPartyLogin: %d \n", v5, self, self->_authorizationRequest, self->_passwordRequest, self->_proxiedClientAppName, self->_proxiedClientBundleID, self->_proxiedClientTeamID, self->_sessionID, self->_isWebLogin, self->_isFirstPartyLogin];

  return v6;
}

- (NSString)_sessionID
{
  return self->_sessionID;
}

- (void)set_sessionID:(id)a3
{
}

- (BOOL)_shouldForceUI
{
  return self->_shouldForceUI;
}

- (void)set_shouldForceUI:(BOOL)a3
{
  self->_shouldForceUI = a3;
}

- (BOOL)_shouldSkipBiometrics
{
  return self->_shouldSkipBiometrics;
}

- (void)set_shouldSkipBiometrics:(BOOL)a3
{
  self->_shouldSkipBiometrics = a3;
}

- (BOOL)_shouldSkipAuthorizationUI
{
  return self->_shouldSkipAuthorizationUI;
}

- (void)set_shouldSkipAuthorizationUI:(BOOL)a3
{
  self->_shouldSkipAuthorizationUI = a3;
}

- (NSString)_informativeText
{
  return self->_informativeText;
}

- (void)set_informativeText:(id)a3
{
}

- (NSString)_iconName
{
  return self->_iconName;
}

- (void)set_iconName:(id)a3
{
}

- (NSData)_iconData
{
  return self->_iconData;
}

- (void)set_iconData:(id)a3
{
}

- (NSNumber)_iconScale
{
  return self->_iconScale;
}

- (void)set_iconScale:(id)a3
{
}

- (NSValue)_iconSize
{
  return self->_iconSize;
}

- (void)set_iconSize:(id)a3
{
}

- (BOOL)_shouldForcePrivateEmail
{
  return self->_shouldForcePrivateEmail;
}

- (void)set_shouldForcePrivateEmail:(BOOL)a3
{
  self->_shouldForcePrivateEmail = a3;
}

- (void)set_proxiedClientAppName:(id)a3
{
}

- (void)set_proxiedClientBundleID:(id)a3
{
}

- (void)set_proxiedClientAppID:(id)a3
{
}

- (void)set_proxiedClientTeamID:(id)a3
{
}

- (NSArray)_proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)set_proxiedAssociatedDomains:(id)a3
{
}

- (BOOL)_isWebLogin
{
  return self->_isWebLogin;
}

- (void)set_isWebLogin:(BOOL)a3
{
  self->_isWebLogin = a3;
}

- (BOOL)_isFirstPartyLogin
{
  return self->_isFirstPartyLogin;
}

- (void)set_isFirstPartyLogin:(BOOL)a3
{
  self->_isFirstPartyLogin = a3;
}

- (BOOL)_isRapportLogin
{
  return self->_isRapportLogin;
}

- (void)set_isRapportLogin:(BOOL)a3
{
  self->_isRapportLogin = a3;
}

- (NSString)_callerBundleID
{
  return self->_callerBundleID;
}

- (void)set_callerBundleID:(id)a3
{
}

- (NSString)_callerSceneID
{
  return self->_callerSceneID;
}

- (void)set_callerSceneID:(id)a3
{
}

- (NSString)_proxiedDeviceName
{
  return self->_proxiedDeviceName;
}

- (void)set_proxiedDeviceName:(id)a3
{
}

- (NSString)_proxiedDeviceClass
{
  return self->_proxiedDeviceClass;
}

- (void)set_proxiedDeviceClass:(id)a3
{
}

- (void)set_proxiedClientServiceID:(id)a3
{
}

- (AKAuthorizationUpgradeContext)_upgradeContext
{
  return self->_upgradeContext;
}

- (BOOL)_clientShouldAuthenticateExternally
{
  return self->_clientShouldAuthenticateExternally;
}

- (void)set_clientShouldAuthenticateExternally:(BOOL)a3
{
  self->_clientShouldAuthenticateExternally = a3;
}

- (double)_authSessionTimeoutInterval
{
  return self->_authSessionTimeoutInterval;
}

- (void)set_authSessionTimeoutInterval:(double)a3
{
  self->_authSessionTimeoutInterval = a3;
}

- (NSString)_externalAuthToken
{
  return self->_externalAuthToken;
}

- (void)set_externalAuthToken:(id)a3
{
}

- (NSData)_externalLocalAuthData
{
  return self->_externalLocalAuthData;
}

- (void)set_externalLocalAuthData:(id)a3
{
}

- (NSString)_continuationRequestIdentifier
{
  return self->_continuationRequestIdentifier;
}

- (void)set_continuationRequestIdentifier:(id)a3
{
}

- (BOOL)_shouldUseProxiedClientBundleIDForSRP
{
  return self->_shouldUseProxiedClientBundleIDForSRP;
}

- (void)set_shouldUseProxiedClientBundleIDForSRP:(BOOL)a3
{
  self->_shouldUseProxiedClientBundleIDForSRP = a3;
}

- (BOOL)_isItunesLogin
{
  return self->_isItunesLogin;
}

- (void)set_isItunesLogin:(BOOL)a3
{
  self->_isItunesLogin = a3;
}

- (BOOL)_shouldShowAdditionalCTA
{
  return self->_shouldShowAdditionalCTA;
}

- (void)set_shouldShowAdditionalCTA:(BOOL)a3
{
  self->_shouldShowAdditionalCTA = a3;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (unint64_t)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(unint64_t)a3
{
  self->_requestOptions = a3;
}

- (AKAuthorizationRequest)authorizationRequest
{
  return self->_authorizationRequest;
}

- (void)setAuthorizationRequest:(id)a3
{
}

- (AKPasswordRequest)passwordRequest
{
  return self->_passwordRequest;
}

- (void)setPasswordRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordRequest, 0);
  objc_storeStrong((id *)&self->_authorizationRequest, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_continuationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_externalLocalAuthData, 0);
  objc_storeStrong((id *)&self->_externalAuthToken, 0);
  objc_storeStrong((id *)&self->_upgradeContext, 0);
  objc_storeStrong((id *)&self->_proxiedClientServiceID, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceClass, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceName, 0);
  objc_storeStrong((id *)&self->_callerSceneID, 0);
  objc_storeStrong((id *)&self->_callerBundleID, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_proxiedClientTeamID, 0);
  objc_storeStrong((id *)&self->_proxiedClientAppID, 0);
  objc_storeStrong((id *)&self->_proxiedClientBundleID, 0);
  objc_storeStrong((id *)&self->_proxiedClientAppName, 0);
  objc_storeStrong((id *)&self->_iconSize, 0);
  objc_storeStrong((id *)&self->_iconScale, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
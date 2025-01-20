@interface SOKerberosContext
- (ASAuthorizationProviderExtensionAuthorizationRequest)authorizationRequest;
- (BOOL)attemptedToGetCredsFromKeychain;
- (BOOL)credsCameFromKeychain;
- (BOOL)forceLoginViewController;
- (BOOL)isManagedApp;
- (BOOL)refreshCredential;
- (BOOL)requestCancelled;
- (BOOL)requestStarted;
- (BOOL)returnCredentialOnly;
- (BOOL)smartCardNeedsInsert;
- (BOOL)useKerberosPasswordInsteadOfMDMIdentity;
- (BOOL)userNameIsReadOnly;
- (LAContext)keychainLAContext;
- (LAContext)smartCardLAContext;
- (NSData)auditToken;
- (NSData)pkinitPersistientRef;
- (NSDate)loginTimeStamp;
- (NSString)cacheName;
- (NSString)callerBundleIdentifier;
- (NSString)callerLocalizedName;
- (NSString)certificateTokenID;
- (NSString)changedPassword;
- (NSString)hostName;
- (NSString)impersonationBundleIdentifier;
- (NSString)password;
- (NSString)realm;
- (NSString)serviceName;
- (NSString)servicePrincipalName;
- (NSString)userName;
- (NSString)userPrincipalName;
- (NSUUID)credentialUUID;
- (OS_dispatch_group)dispatchGroup;
- (OS_dispatch_group)siteCodeGroup;
- (SOKerberosContext)initWithRequest:(id)a3 extensionData:(id)a4;
- (SOKerberosExtensionData)extensionData;
- (SOKerberosExtensionUserData)extensionUserData;
- (SOKerberosPacData)pacData;
- (SOKerberosRealmSettings)currentSettings;
- (SONetworkIdentity)networkIdentity;
- (SOSiteCode)siteCode;
- (__SecIdentity)pkinitIdentity;
- (int)laContextFailureCount;
- (void)cancelRequest;
- (void)cancelRequest:(BOOL)a3;
- (void)completeRequest;
- (void)completeRequestWithDoNotHandle;
- (void)completeRequestWithError:(id)a3;
- (void)completeRequestWithHTTPResponse:(id)a3 httpBody:(id)a4;
- (void)completeRequestWithHTTPResponseHeaders:(id)a3;
- (void)completeRequestWithHeaders:(id)a3;
- (void)finishRequest;
- (void)presentAuthorizationViewControllerWithCompletion:(id)a3;
- (void)setAttemptedToGetCredsFromKeychain:(BOOL)a3;
- (void)setAuditToken:(id)a3;
- (void)setAuthorizationRequest:(id)a3;
- (void)setCacheName:(id)a3;
- (void)setCallerBundleIdentifier:(id)a3;
- (void)setCallerLocalizedName:(id)a3;
- (void)setCertificateTokenID:(id)a3;
- (void)setChangedPassword:(id)a3;
- (void)setCredentialUUID:(id)a3;
- (void)setCredsCameFromKeychain:(BOOL)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setExtensionData:(id)a3;
- (void)setExtensionUserData:(id)a3;
- (void)setForceLoginViewController:(BOOL)a3;
- (void)setHostName:(id)a3;
- (void)setImpersonationBundleIdentifier:(id)a3;
- (void)setIsManagedApp:(BOOL)a3;
- (void)setKeychainLAContext:(id)a3;
- (void)setLaContextFailureCount:(int)a3;
- (void)setLoginTimeStamp:(id)a3;
- (void)setNetworkIdentity:(id)a3;
- (void)setPacData:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPkinitIdentity:(__SecIdentity *)a3;
- (void)setPkinitPersistientRef:(id)a3;
- (void)setRealm:(id)a3;
- (void)setRefreshCredential:(BOOL)a3;
- (void)setRequestCancelled:(BOOL)a3;
- (void)setRequestStarted:(BOOL)a3;
- (void)setReturnCredentialOnly:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)setServicePrincipalName:(id)a3;
- (void)setSiteCode:(id)a3;
- (void)setSiteCodeGroup:(id)a3;
- (void)setSmartCardLAContext:(id)a3;
- (void)setSmartCardNeedsInsert:(BOOL)a3;
- (void)setUseKerberosPasswordInsteadOfMDMIdentity:(BOOL)a3;
- (void)setUserName:(id)a3;
- (void)setUserNameIsReadOnly:(BOOL)a3;
- (void)setUserPrincipalName:(id)a3;
- (void)setUserPrincipalNameAfterAuth:(id)a3;
- (void)startRequest;
- (void)waitForCompletion;
@end

@implementation SOKerberosContext

- (SOKerberosContext)initWithRequest:(id)a3 extensionData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v61.receiver = self;
  v61.super_class = (Class)SOKerberosContext;
  v9 = [(SOKerberosContext *)&v61 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorizationRequest, a3);
    uint64_t v11 = [(ASAuthorizationProviderExtensionAuthorizationRequest *)v10->_authorizationRequest localizedCallerDisplayName];
    callerLocalizedName = v10->_callerLocalizedName;
    v10->_callerLocalizedName = (NSString *)v11;

    v13 = [v7 realm];
    uint64_t v14 = [v13 uppercaseString];
    realm = v10->_realm;
    v10->_realm = (NSString *)v14;

    v16 = [v7 url];
    uint64_t v17 = [v16 host];
    hostName = v10->_hostName;
    v10->_hostName = (NSString *)v17;

    objc_storeStrong((id *)&v10->_extensionData, a4);
    v19 = objc_alloc_init(SOKerberosExtensionUserData);
    extensionUserData = v10->_extensionUserData;
    v10->_extensionUserData = v19;

    v10->_returnCredentialOnly = 0;
    dispatch_group_t v21 = dispatch_group_create();
    dispatchGroup = v10->_dispatchGroup;
    v10->_dispatchGroup = (OS_dispatch_group *)v21;

    uint64_t v23 = [(ASAuthorizationProviderExtensionAuthorizationRequest *)v10->_authorizationRequest callerBundleIdentifier];
    callerBundleIdentifier = v10->_callerBundleIdentifier;
    v10->_callerBundleIdentifier = (NSString *)v23;

    v25 = [(ASAuthorizationProviderExtensionAuthorizationRequest *)v10->_authorizationRequest authorizationRequest];
    uint64_t v26 = [v25 impersonationBundleIdentifier];
    impersonationBundleIdentifier = v10->_impersonationBundleIdentifier;
    v10->_impersonationBundleIdentifier = (NSString *)v26;

    if ([(NSString *)v10->_impersonationBundleIdentifier isEqualToString:&stru_26D3372C0])
    {
      v28 = v10->_impersonationBundleIdentifier;
      v10->_impersonationBundleIdentifier = 0;
    }
    v10->_isManagedApp = [v7 isCallerManaged];
    *(_WORD *)&v10->_attemptedToGetCredsFromKeychain = 0;
    v10->_laContextFailureCount = 0;
    v10->_refreshCredential = 0;
    *(_WORD *)&v10->_smartCardNeedsInsert = 0;
    dispatch_group_t v29 = dispatch_group_create();
    siteCodeGroup = v10->_siteCodeGroup;
    v10->_siteCodeGroup = (OS_dispatch_group *)v29;

    v31 = [v7 authorizationRequest];
    uint64_t v32 = [v31 auditTokenData];
    auditToken = v10->_auditToken;
    v10->_auditToken = (NSData *)v32;

    v10->_useKerberosPasswordInsteadOfMDMIdentity = 0;
    v34 = [SOKerberosRealmSettings alloc];
    v35 = [(SOKerberosContext *)v10 realm];
    uint64_t v36 = [(SOKerberosRealmSettings *)v34 initWithRealm:v35];
    currentSettings = v10->_currentSettings;
    v10->_currentSettings = (SOKerberosRealmSettings *)v36;

    [(SOKerberosRealmSettings *)v10->_currentSettings startListeningForPlatformSSOTGTChanges];
    v38 = v10->_currentSettings;
    if (v38)
    {
      uint64_t v39 = [(SOKerberosRealmSettings *)v38 credentialUUID];
      credentialUUID = v10->_credentialUUID;
      v10->_credentialUUID = (NSUUID *)v39;

      uint64_t v41 = [(SOKerberosRealmSettings *)v10->_currentSettings pkinitPersistientRef];
      pkinitPersistientRef = v10->_pkinitPersistientRef;
      v10->_pkinitPersistientRef = (NSData *)v41;

      uint64_t v43 = [(SOKerberosRealmSettings *)v10->_currentSettings smartCardTokenID];
      certificateTokenID = v10->_certificateTokenID;
      v10->_certificateTokenID = (NSString *)v43;

      v45 = [(SOKerberosRealmSettings *)v10->_currentSettings userPrincipalName];

      if (v45)
      {
        v46 = SO_LOG_SOKerberosContext();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosContext initWithRequest:extensionData:].cold.4((id *)&v10->_currentSettings);
        }

        uint64_t v47 = [(SOKerberosRealmSettings *)v10->_currentSettings userPrincipalName];
        userPrincipalName = v10->_userPrincipalName;
        v10->_userPrincipalName = (NSString *)v47;

        uint64_t v49 = [(SOKerberosRealmSettings *)v10->_currentSettings userName];
        userName = v10->_userName;
        v10->_userName = (NSString *)v49;

        v10->_userNameIsReadOnly = 1;
      }
      else
      {
        v51 = [v8 principalName];

        if (v51)
        {
          v52 = SO_LOG_SOKerberosContext();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
            -[SOKerberosContext initWithRequest:extensionData:](v8);
          }

          uint64_t v53 = [v8 principalName];
          v54 = v10->_userName;
          v10->_userName = (NSString *)v53;
        }
        else
        {
          v55 = [v7 httpHeaders];
          v56 = [v55 objectForKey:@"user_name"];
          if (v56)
          {
            v57 = SO_LOG_SOKerberosContext();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
              -[SOKerberosContext initWithRequest:extensionData:]();
            }

            objc_storeStrong((id *)&v10->_userName, v56);
            v10->_userNameIsReadOnly = 1;
          }
        }
      }
      v58 = [v8 principalName];

      if (v58)
      {
        v59 = SO_LOG_SOKerberosContext();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosContext initWithRequest:extensionData:](v59);
        }

        v10->_userNameIsReadOnly = 1;
      }
    }
  }

  return v10;
}

- (NSString)userPrincipalName
{
  v3 = [NSString stringWithFormat:@"@%@", self->_realm];
  userPrincipalName = self->_userPrincipalName;
  if (userPrincipalName && self->_realm)
  {
    BOOL v5 = [(NSString *)userPrincipalName hasSuffix:v3];
    v6 = self->_userPrincipalName;
    if (!v5)
    {
      id v7 = [(NSString *)v6 lowercaseString];
      id v8 = [v3 lowercaseString];
      int v9 = [v7 hasSuffix:v8];

      if (v9)
      {
        v10 = self->_userPrincipalName;
LABEL_13:
        -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](v10, "stringByReplacingOccurrencesOfString:withString:options:range:", v3, v3, 1, 0, [(NSString *)v10 length]);
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v18 = NSString;
      v19 = self->_userPrincipalName;
      goto LABEL_16;
    }
  }
  else
  {
    userName = self->_userName;
    if (!userName || !self->_realm)
    {
      uint64_t v14 = 0;
      goto LABEL_18;
    }
    BOOL v12 = [(NSString *)userName hasSuffix:v3];
    v6 = self->_userName;
    if (!v12)
    {
      v15 = [(NSString *)v6 lowercaseString];
      v16 = [v3 lowercaseString];
      int v17 = [v15 hasSuffix:v16];

      if (v17)
      {
        v10 = self->_userName;
        goto LABEL_13;
      }
      v18 = NSString;
      v19 = self->_userName;
LABEL_16:
      v13 = [v18 stringWithFormat:@"%@@%@", v19, self->_realm];
      goto LABEL_17;
    }
  }
  v13 = v6;
LABEL_17:
  uint64_t v14 = v13;
LABEL_18:

  return v14;
}

- (NSString)serviceName
{
  return (NSString *)[NSString stringWithFormat:@"Kerberos:%@", self->_realm];
}

- (void)setUserName:(id)a3
{
  id v5 = a3;
  if (!self->_userNameIsReadOnly)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_userName, a3);
    userPrincipalName = self->_userPrincipalName;
    self->_userPrincipalName = 0;

    id v5 = v7;
  }
}

- (void)setUserPrincipalNameAfterAuth:(id)a3
{
}

- (void)startRequest
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** starting request: %@", v2, v3, v4, v5, v6);
}

- (void)finishRequest
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** finishing request: %@", v2, v3, v4, v5, v6);
}

- (void)waitForCompletion
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** waitForCompletion: %@", v2, v3, v4, v5, v6);
}

- (void)cancelRequest
{
}

- (void)cancelRequest:(BOOL)a3
{
  uint64_t v4 = SO_LOG_SOKerberosContext();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosContext cancelRequest:]();
  }

  [(SOKerberosContext *)self setRequestCancelled:1];
  [(SOKerberosContext *)self finishRequest];
  uint64_t v5 = [(SOKerberosContext *)self authorizationRequest];
  [v5 cancel];
}

- (void)completeRequest
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** completeRequest: %@", v2, v3, v4, v5, v6);
}

- (void)completeRequestWithHeaders:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosContext();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosContext completeRequestWithHeaders:]();
  }

  [(SOKerberosContext *)self finishRequest];
  uint8_t v6 = [(SOKerberosContext *)self authorizationRequest];
  [v6 completeWithHTTPAuthorizationHeaders:v4];
}

- (void)completeRequestWithHTTPResponseHeaders:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosContext();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosContext completeRequestWithHTTPResponseHeaders:]();
  }

  id v6 = objc_alloc(MEMORY[0x263F088A0]);
  id v7 = [(SOKerberosContext *)self authorizationRequest];
  id v8 = [v7 url];
  int v9 = (void *)[v6 initWithURL:v8 statusCode:200 HTTPVersion:@"HTTP/1.1" headerFields:v4];

  v10 = objc_opt_new();
  [(SOKerberosContext *)self completeRequestWithHTTPResponse:v9 httpBody:v10];
}

- (void)completeRequestWithHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = SO_LOG_SOKerberosContext();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosContext completeRequestWithHTTPResponse:httpBody:]();
  }

  [(SOKerberosContext *)self finishRequest];
  int v9 = [(SOKerberosContext *)self authorizationRequest];
  [v9 completeWithHTTPResponse:v7 httpBody:v6];
}

- (void)completeRequestWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosContext();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosContext completeRequestWithError:]();
  }

  [(SOKerberosContext *)self finishRequest];
  id v6 = [(SOKerberosContext *)self authorizationRequest];
  [v6 completeWithError:v4];
}

- (void)completeRequestWithDoNotHandle
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "completeRequestWithDoNotHandle: %{public}@", v2, v3, v4, v5, v6);
}

- (void)presentAuthorizationViewControllerWithCompletion:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosContext();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosContext presentAuthorizationViewControllerWithCompletion:]();
  }

  uint8_t v6 = [(SOKerberosContext *)self authorizationRequest];
  id v7 = [v6 authorizationRequest];
  int v9 = &unk_26D33C230;
  v10[0] = &unk_26D33C230;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v7 presentAuthorizationViewControllerWithHints:v8 completion:v4];
}

- (void)setUserPrincipalName:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (SOKerberosRealmSettings)currentSettings
{
  return self->_currentSettings;
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (SOKerberosExtensionData)extensionData
{
  return self->_extensionData;
}

- (void)setExtensionData:(id)a3
{
}

- (SOKerberosExtensionUserData)extensionUserData
{
  return self->_extensionUserData;
}

- (void)setExtensionUserData:(id)a3
{
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
}

- (NSString)servicePrincipalName
{
  return self->_servicePrincipalName;
}

- (void)setServicePrincipalName:(id)a3
{
}

- (void)setServiceName:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)changedPassword
{
  return self->_changedPassword;
}

- (void)setChangedPassword:(id)a3
{
}

- (BOOL)userNameIsReadOnly
{
  return self->_userNameIsReadOnly;
}

- (void)setUserNameIsReadOnly:(BOOL)a3
{
  self->_userNameIsReadOnly = a3;
}

- (NSUUID)credentialUUID
{
  return self->_credentialUUID;
}

- (void)setCredentialUUID:(id)a3
{
}

- (NSString)certificateTokenID
{
  return self->_certificateTokenID;
}

- (void)setCertificateTokenID:(id)a3
{
}

- (__SecIdentity)pkinitIdentity
{
  return self->_pkinitIdentity;
}

- (void)setPkinitIdentity:(__SecIdentity *)a3
{
  self->_pkinitIdentity = a3;
}

- (NSData)pkinitPersistientRef
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPkinitPersistientRef:(id)a3
{
}

- (LAContext)smartCardLAContext
{
  return (LAContext *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSmartCardLAContext:(id)a3
{
}

- (LAContext)keychainLAContext
{
  return (LAContext *)objc_getProperty(self, a2, 152, 1);
}

- (void)setKeychainLAContext:(id)a3
{
}

- (BOOL)useKerberosPasswordInsteadOfMDMIdentity
{
  return self->_useKerberosPasswordInsteadOfMDMIdentity;
}

- (void)setUseKerberosPasswordInsteadOfMDMIdentity:(BOOL)a3
{
  self->_useKerberosPasswordInsteadOfMDMIdentity = a3;
}

- (SOSiteCode)siteCode
{
  return self->_siteCode;
}

- (void)setSiteCode:(id)a3
{
}

- (NSString)cacheName
{
  return self->_cacheName;
}

- (void)setCacheName:(id)a3
{
}

- (BOOL)returnCredentialOnly
{
  return self->_returnCredentialOnly;
}

- (void)setReturnCredentialOnly:(BOOL)a3
{
  self->_returnCredentialOnly = a3;
}

- (BOOL)refreshCredential
{
  return self->_refreshCredential;
}

- (void)setRefreshCredential:(BOOL)a3
{
  self->_refreshCredential = a3;
}

- (NSString)callerBundleIdentifier
{
  return self->_callerBundleIdentifier;
}

- (void)setCallerBundleIdentifier:(id)a3
{
}

- (NSString)impersonationBundleIdentifier
{
  return self->_impersonationBundleIdentifier;
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
}

- (NSString)callerLocalizedName
{
  return self->_callerLocalizedName;
}

- (void)setCallerLocalizedName:(id)a3
{
}

- (BOOL)credsCameFromKeychain
{
  return self->_credsCameFromKeychain;
}

- (void)setCredsCameFromKeychain:(BOOL)a3
{
  self->_credsCameFromKeychain = a3;
}

- (BOOL)requestCancelled
{
  return self->_requestCancelled;
}

- (void)setRequestCancelled:(BOOL)a3
{
  self->_requestCancelled = a3;
}

- (BOOL)attemptedToGetCredsFromKeychain
{
  return self->_attemptedToGetCredsFromKeychain;
}

- (void)setAttemptedToGetCredsFromKeychain:(BOOL)a3
{
  self->_attemptedToGetCredsFromKeychain = a3;
}

- (int)laContextFailureCount
{
  return self->_laContextFailureCount;
}

- (void)setLaContextFailureCount:(int)a3
{
  self->_laContextFailureCount = a3;
}

- (BOOL)forceLoginViewController
{
  return self->_forceLoginViewController;
}

- (void)setForceLoginViewController:(BOOL)a3
{
  self->_forceLoginViewController = a3;
}

- (NSDate)loginTimeStamp
{
  return self->_loginTimeStamp;
}

- (void)setLoginTimeStamp:(id)a3
{
}

- (OS_dispatch_group)siteCodeGroup
{
  return self->_siteCodeGroup;
}

- (void)setSiteCodeGroup:(id)a3
{
}

- (SONetworkIdentity)networkIdentity
{
  return self->_networkIdentity;
}

- (void)setNetworkIdentity:(id)a3
{
}

- (NSData)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (BOOL)isManagedApp
{
  return self->_isManagedApp;
}

- (void)setIsManagedApp:(BOOL)a3
{
  self->_isManagedApp = a3;
}

- (BOOL)smartCardNeedsInsert
{
  return self->_smartCardNeedsInsert;
}

- (void)setSmartCardNeedsInsert:(BOOL)a3
{
  self->_smartCardNeedsInsert = a3;
}

- (SOKerberosPacData)pacData
{
  return self->_pacData;
}

- (void)setPacData:(id)a3
{
}

- (ASAuthorizationProviderExtensionAuthorizationRequest)authorizationRequest
{
  return self->_authorizationRequest;
}

- (void)setAuthorizationRequest:(id)a3
{
}

- (OS_dispatch_group)dispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDispatchGroup:(id)a3
{
}

- (BOOL)requestStarted
{
  return self->_requestStarted;
}

- (void)setRequestStarted:(BOOL)a3
{
  self->_requestStarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_authorizationRequest, 0);
  objc_storeStrong((id *)&self->_pacData, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_networkIdentity, 0);
  objc_storeStrong((id *)&self->_siteCodeGroup, 0);
  objc_storeStrong((id *)&self->_loginTimeStamp, 0);
  objc_storeStrong((id *)&self->_callerLocalizedName, 0);
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_siteCode, 0);
  objc_storeStrong((id *)&self->_keychainLAContext, 0);
  objc_storeStrong((id *)&self->_smartCardLAContext, 0);
  objc_storeStrong((id *)&self->_pkinitPersistientRef, 0);
  objc_storeStrong((id *)&self->_certificateTokenID, 0);
  objc_storeStrong((id *)&self->_credentialUUID, 0);
  objc_storeStrong((id *)&self->_changedPassword, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_servicePrincipalName, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_extensionUserData, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_currentSettings, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userPrincipalName, 0);
}

- (void)initWithRequest:(os_log_t)log extensionData:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_221304000, log, OS_LOG_TYPE_DEBUG, "user name is read only", v1, 2u);
}

- (void)initWithRequest:extensionData:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "user principal name is set in request: %@", v2, v3, v4, v5, v6);
}

- (void)initWithRequest:(void *)a1 extensionData:.cold.3(void *a1)
{
  uint64_t v1 = [a1 principalName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "user name is set in extensiondata: %@", v4, v5, v6, v7, v8);
}

- (void)initWithRequest:(id *)a1 extensionData:.cold.4(id *a1)
{
  uint64_t v1 = [*a1 userPrincipalName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "user principal name is set in saved settings: %@", v4, v5, v6, v7, v8);
}

- (void)cancelRequest:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** canceling request: %@", v2, v3, v4, v5, v6);
}

- (void)completeRequestWithHeaders:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** completeRequestWithHeaders: %{private}@", v2, v3, v4, v5, v6);
}

- (void)completeRequestWithHTTPResponseHeaders:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** completeRequesWithHTTPBody: %{private}@", v2, v3, v4, v5, v6);
}

- (void)completeRequestWithHTTPResponse:httpBody:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** completeRequesWithHTTPResponse: %{private}@", v2, v3, v4, v5, v6);
}

- (void)completeRequestWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** completeRequestWithError: %{public}@", v2, v3, v4, v5, v6);
}

- (void)presentAuthorizationViewControllerWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "*************** presentAuthorizationViewControllerWithCompletion: %{public}@", v2, v3, v4, v5, v6);
}

@end
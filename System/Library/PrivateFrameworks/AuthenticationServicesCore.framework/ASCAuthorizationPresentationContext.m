@interface ASCAuthorizationPresentationContext
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationRequest)appleIDAuthorizationRequest;
- (ASCAuthorizationPresentationContext)initWithCoder:(id)a3;
- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4;
- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 frameIdentifier:(id)a5 shouldUseRelyingPartyForServiceName:(BOOL)a6;
- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 frameIdentifier:(id)a5 shouldUseRelyingPartyForServiceName:(BOOL)a6 auditTokenData:(id)a7;
- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 shouldUseRelyingPartyForServiceName:(BOOL)a5;
- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 shouldUseRelyingPartyForServiceName:(BOOL)a5 auditTokenData:(id)a6;
- (ASCPublicKeyCredentialAssertionOptions)passkeyAssertionOptionsForExternalProvider;
- (ASCPublicKeyCredentialCreationOptions)passkeyCreationOptionsForExternalProvider;
- (BOOL)_passwordLoginChoice:(id)a3 hasSameHighLevelDomainAndUsernameAsPasskeyLoginChoice:(id)a4;
- (BOOL)hasExternalPasswords;
- (BOOL)hasPlatformCredentialRequest;
- (BOOL)isCABLEAuthenticatorRequest;
- (BOOL)isCombinedPublicKeyCredentialRegistrationRequest;
- (BOOL)isConditionalRegistrationRequest;
- (BOOL)isProxiedRequest;
- (BOOL)isRegistrationRequest;
- (BOOL)shouldAllowSecurityKeysFromCABLEView;
- (BOOL)shouldRequireCABLEAuthenticatorConsent;
- (BOOL)shouldUseFallbackPasskeyUI;
- (BOOL)useAlternativeSecurityKeysIcon;
- (NSArray)allowedCredentialsForSecurityKeyAssertion;
- (NSArray)credentialLoginChoices;
- (NSArray)localAccountLoginChoices;
- (NSArray)loginChoices;
- (NSArray)otherAccountsLoginChoices;
- (NSArray)proxiedAssociatedDomains;
- (NSData)auditTokenData;
- (NSData)proxiedIconData;
- (NSNumber)proxiedIconScale;
- (NSString)appIdentifier;
- (NSString)bundleIdentifier;
- (NSString)destinationSiteForCrossSiteAssertion;
- (NSString)overrideHeader;
- (NSString)overrideNoCredentialsErrorMessage;
- (NSString)overrideNoCredentialsErrorTitle;
- (NSString)overrideSubtitle;
- (NSString)overrideTitle;
- (NSString)platformUserVerificationPreference;
- (NSString)proxiedOriginDeviceName;
- (NSString)serviceName;
- (NSString)teamIdentifier;
- (NSString)windowSceneIdentifier;
- (NSURL)cableAuthenticatorURL;
- (WBSGlobalFrameIdentifier)frameIdentifier;
- (id)_initWithCABLEAuthenticatorURL:(id)a3 shouldRequireConsent:(BOOL)a4 passkeyURLType:(int64_t)a5;
- (id)_passkeyLoginChoices;
- (int64_t)_passkeyURLType;
- (int64_t)cableAuthenticatorRequirement;
- (int64_t)externalPasskeyLoginChoiceCount;
- (int64_t)iCloudKeychainPasskeyLoginChoiceCount;
- (unint64_t)requestTypes;
- (unint64_t)serviceType;
- (void)_getPrimaryLoginChoices:(id *)a3 otherLoginChoices:(id *)a4;
- (void)addLoginChoice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleIDAuthorizationRequest:(id)a3;
- (void)setDestinationSiteForCrossSiteAssertion:(id)a3;
- (void)setIsProxiedRequest:(BOOL)a3;
- (void)setProxiedAssociatedDomains:(id)a3;
- (void)setProxiedIconData:(id)a3;
- (void)setProxiedIconScale:(id)a3;
- (void)setProxiedOriginDeviceName:(id)a3;
- (void)setServiceName:(id)a3;
- (void)updateLoginChoices:(id)a3;
@end

@implementation ASCAuthorizationPresentationContext

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4
{
  return [(ASCAuthorizationPresentationContext *)self initWithRequestContext:a3 appIdentifier:a4 shouldUseRelyingPartyForServiceName:0 auditTokenData:0];
}

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 shouldUseRelyingPartyForServiceName:(BOOL)a5
{
  return [(ASCAuthorizationPresentationContext *)self initWithRequestContext:a3 appIdentifier:a4 shouldUseRelyingPartyForServiceName:a5 auditTokenData:0];
}

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 shouldUseRelyingPartyForServiceName:(BOOL)a5 auditTokenData:(id)a6
{
  return [(ASCAuthorizationPresentationContext *)self initWithRequestContext:a3 appIdentifier:a4 frameIdentifier:0 shouldUseRelyingPartyForServiceName:a5 auditTokenData:a6];
}

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 frameIdentifier:(id)a5 shouldUseRelyingPartyForServiceName:(BOOL)a6
{
  return [(ASCAuthorizationPresentationContext *)self initWithRequestContext:a3 appIdentifier:a4 frameIdentifier:a5 shouldUseRelyingPartyForServiceName:a6 auditTokenData:0];
}

- (ASCAuthorizationPresentationContext)initWithRequestContext:(id)a3 appIdentifier:(id)a4 frameIdentifier:(id)a5 shouldUseRelyingPartyForServiceName:(BOOL)a6 auditTokenData:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v124.receiver = self;
  v124.super_class = (Class)ASCAuthorizationPresentationContext;
  v16 = [(ASCAuthorizationPresentationContext *)&v124 init];
  if (!v16) {
    goto LABEL_42;
  }
  v120 = v15;
  uint64_t v17 = [v13 copy];
  appIdentifier = v16->_appIdentifier;
  v16->_appIdentifier = (NSString *)v17;

  id v121 = v14;
  uint64_t v19 = [v14 copy];
  frameIdentifier = v16->_frameIdentifier;
  v16->_frameIdentifier = (WBSGlobalFrameIdentifier *)v19;

  v21 = [v12 proxiedAppName];
  uint64_t v22 = [v21 copy];
  serviceName = v16->_serviceName;
  v16->_serviceName = (NSString *)v22;

  if ([v12 isProxiedRequest])
  {
    uint64_t v24 = [v12 proxiedBundleIdentifier];
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v24;

    uint64_t v26 = [v12 proxiedTeamIdentifier];
    teamIdentifier = v16->_teamIdentifier;
    v16->_teamIdentifier = (NSString *)v26;
LABEL_16:

    goto LABEL_17;
  }
  if ([v13 length])
  {
    v28 = v16->_appIdentifier;
    id v123 = 0;
    v29 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:v28 error:&v123];
    teamIdentifier = (NSString *)v123;
    if (v29)
    {
      id v30 = v29;
    }
    else
    {
      id v31 = objc_alloc(MEMORY[0x263F01858]);
      v32 = v16->_appIdentifier;
      v122 = teamIdentifier;
      id v30 = (id)objc_msgSend(v31, "safari_initWithExtensionApplicationIdentifier:error:", v32, &v122);
      v33 = v122;

      teamIdentifier = v33;
    }

    if (teamIdentifier)
    {
      v34 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[ASCAuthorizationPresentationContext initWithRequestContext:appIdentifier:frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:](v34, teamIdentifier);
      }
    }
    uint64_t v35 = [v30 bundleIdentifier];
    v36 = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v35;

    uint64_t v37 = [v30 teamIdentifier];
    v38 = v16->_teamIdentifier;
    v16->_teamIdentifier = (NSString *)v37;

    if (!v16->_serviceName)
    {
      uint64_t v39 = [v30 localizedName];
      v40 = v16->_serviceName;
      v16->_serviceName = (NSString *)v39;

      if (!v16->_serviceName)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v41 = [v30 containingBundleRecord];
          uint64_t v42 = [v41 localizedName];
          v43 = v16->_serviceName;
          v16->_serviceName = (NSString *)v42;
        }
      }
    }

    goto LABEL_16;
  }
LABEL_17:
  v16->_serviceType = 0;
  v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  loginChoices = v16->_loginChoices;
  v16->_loginChoices = v44;

  uint64_t v46 = [v12 appleIDAuthorizationRequest];
  appleIDAuthorizationRequest = v16->_appleIDAuthorizationRequest;
  v16->_appleIDAuthorizationRequest = (AKAuthorizationRequest *)v46;

  if (v8)
  {
    v48 = [v12 platformKeyCredentialAssertionOptions];
    v49 = [v48 origin];
    uint64_t v50 = [v49 length];

    if (v50)
    {
      v51 = NSURL;
      v52 = [v12 platformKeyCredentialAssertionOptions];
      v53 = [v52 origin];
      v54 = [v51 URLWithString:v53];

      v55 = [v54 host];
      v56 = objc_msgSend(v55, "safari_highLevelDomainForPasswordManager");
      v57 = v56;
      if (v56)
      {
        v58 = v56;
        v59 = v16->_serviceName;
        v16->_serviceName = v58;
      }
      else
      {
        v59 = [v12 relyingPartyIdentifier];
        uint64_t v61 = [v59 copy];
        v62 = v16->_serviceName;
        v16->_serviceName = (NSString *)v61;
      }
    }
    else
    {
      v54 = [v12 relyingPartyIdentifier];
      uint64_t v60 = [v54 copy];
      v55 = v16->_serviceName;
      v16->_serviceName = (NSString *)v60;
    }

    v16->_serviceType = 1;
  }
  v63 = [v12 platformKeyCredentialCreationOptions];
  v64 = [v12 platformKeyCredentialAssertionOptions];
  v65 = v64;
  if (v63)
  {
    uint64_t v66 = [v63 userVerificationPreference];
    platformUserVerificationPreference = v16->_platformUserVerificationPreference;
    v16->_platformUserVerificationPreference = (NSString *)v66;

    uint64_t v68 = [v63 copy];
    passkeyCreationOptionsForExternalProvider = v16->_passkeyCreationOptionsForExternalProvider;
    v16->_passkeyCreationOptionsForExternalProvider = (ASCPublicKeyCredentialCreationOptions *)v68;
  }
  else
  {
    uint64_t v70 = [v64 userVerificationPreference];
    passkeyCreationOptionsForExternalProvider = (ASCPublicKeyCredentialCreationOptions *)v16->_platformUserVerificationPreference;
    v16->_platformUserVerificationPreference = (NSString *)v70;
  }

  objc_storeStrong((id *)&v16->_passkeyAssertionOptionsForExternalProvider, v65);
  uint64_t v71 = [v65 destinationSiteForCrossSiteAssertion];
  destinationSiteForCrossSiteAssertion = v16->_destinationSiteForCrossSiteAssertion;
  v16->_destinationSiteForCrossSiteAssertion = (NSString *)v71;

  if (!v16->_destinationSiteForCrossSiteAssertion)
  {
    v73 = [v12 securityKeyCredentialAssertionOptions];
    uint64_t v74 = [v73 destinationSiteForCrossSiteAssertion];
    v75 = v16->_destinationSiteForCrossSiteAssertion;
    v16->_destinationSiteForCrossSiteAssertion = (NSString *)v74;
  }
  id v119 = v13;
  v16->_isProxiedRequest = [v12 isProxiedRequest];
  v76 = [v12 proxiedAssociatedDomains];
  uint64_t v77 = [v76 copy];
  proxiedAssociatedDomains = v16->_proxiedAssociatedDomains;
  v16->_proxiedAssociatedDomains = (NSArray *)v77;

  v79 = [v12 proxiedIconData];
  uint64_t v80 = [v79 copy];
  proxiedIconData = v16->_proxiedIconData;
  v16->_proxiedIconData = (NSData *)v80;

  v82 = [v12 proxiedIconScale];
  uint64_t v83 = [v82 copy];
  proxiedIconScale = v16->_proxiedIconScale;
  v16->_proxiedIconScale = (NSNumber *)v83;

  v85 = [v12 proxiedOriginDeviceName];
  uint64_t v86 = [v85 copy];
  proxiedOriginDeviceName = v16->_proxiedOriginDeviceName;
  v16->_proxiedOriginDeviceName = (NSString *)v86;

  v16->_isCABLEAuthenticatorRequest = [v12 isCABLEAuthenticatorRequest];
  BOOL v88 = v8;
  if ([v12 requestStyle] == 1)
  {
    v89 = [v12 securityKeyCredentialAssertionOptions];
    v16->_shouldAllowSecurityKeysFromCABLEView = v89 != 0;
  }
  else
  {
    v16->_shouldAllowSecurityKeysFromCABLEView = 0;
  }
  id v90 = v12;
  v91 = [v90 platformKeyCredentialAssertionOptions];
  v92 = v91;
  if (v91)
  {
    v93 = [v91 extensions];
    uint64_t v94 = [v93 caBLEAuthenticatorMinimumRequirement];
  }
  else
  {
    v95 = [v90 platformKeyCredentialCreationOptions];
    v93 = v95;
    if (v95)
    {
      v96 = [v95 extensions];
      uint64_t v94 = [v96 caBLEAuthenticatorMinimumRequirement];
    }
    else
    {
      uint64_t v94 = 0;
    }
  }

  v16->_cableAuthenticatorRequirement = v94;
  uint64_t v97 = [v90 proxySheetHeaderOverride];
  overrideHeader = v16->_overrideHeader;
  v16->_overrideHeader = (NSString *)v97;

  uint64_t v99 = [v90 proxySheetTitleOverride];
  overrideTitle = v16->_overrideTitle;
  v16->_overrideTitle = (NSString *)v99;

  uint64_t v101 = [v90 proxySheetSubtitleOverride];
  overrideSubtitle = v16->_overrideSubtitle;
  v16->_overrideSubtitle = (NSString *)v101;

  uint64_t v103 = [v90 proxySheetNoCredentialsErrorTitleOverride];
  overrideNoCredentialsErrorTitle = v16->_overrideNoCredentialsErrorTitle;
  v16->_overrideNoCredentialsErrorTitle = (NSString *)v103;

  uint64_t v105 = [v90 proxySheetNoCredentialsErrorMessageOverride];
  overrideNoCredentialsErrorMessage = v16->_overrideNoCredentialsErrorMessage;
  v16->_overrideNoCredentialsErrorMessage = (NSString *)v105;

  v16->_useAlternativeSecurityKeysIcon = [v90 useAlternativeSecurityKeysIcon];
  if (v88)
  {
    v107 = +[ASFeatureManager sharedManager];
    v108 = [v90 relyingPartyIdentifier];
    v16->_shouldUseFallbackPasskeyUI = [v107 shouldUseFallbackUIForRelyingParty:v108];
  }
  else
  {
    v16->_shouldUseFallbackPasskeyUI = 0;
  }
  v109 = [v90 securityKeyCredentialAssertionOptions];
  v110 = [v109 allowedCredentials];
  uint64_t v111 = objc_msgSend(v110, "safari_filterObjectsUsingBlock:", &__block_literal_global_371_0);

  allowedCredentialsForSecurityKeyAssertion = v16->_allowedCredentialsForSecurityKeyAssertion;
  v16->_allowedCredentialsForSecurityKeyAssertion = (NSArray *)v111;

  uint64_t v113 = [v90 windowSceneIdentifier];
  windowSceneIdentifier = v16->_windowSceneIdentifier;
  v16->_windowSceneIdentifier = (NSString *)v113;

  v16->_isConditionalRegistrationRequest = [v90 isConditionalRegistrationRequest];
  id v15 = v120;
  uint64_t v115 = [v120 copy];
  auditTokenData = v16->_auditTokenData;
  v16->_auditTokenData = (NSData *)v115;

  v117 = v16;
  id v14 = v121;
  id v13 = v119;
LABEL_42:

  return v16;
}

- (id)_initWithCABLEAuthenticatorURL:(id)a3 shouldRequireConsent:(BOOL)a4 passkeyURLType:(int64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASCAuthorizationPresentationContext;
  v9 = [(ASCAuthorizationPresentationContext *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    cableAuthenticatorURL = v9->_cableAuthenticatorURL;
    v9->_cableAuthenticatorURL = (NSURL *)v10;

    v9->_shouldRequireCABLEAuthenticatorConsent = a4;
    v9->_passkeyURLType = a5;
    id v12 = v9;
  }

  return v9;
}

- (void)addLoginChoice:(id)a3
{
  loginChoices = self->_loginChoices;
  id v5 = a3;
  [(NSMutableArray *)loginChoices safari_insertObject:v5 inSortedOrderUsingComparator:&__block_literal_global_4];
  uint64_t v6 = requestTypeForLoginChoice(v5);

  self->_requestTypes |= v6;
}

uint64_t __54__ASCAuthorizationPresentationContext_addLoginChoice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return compareLoginChoices(a2, a3);
}

- (void)updateLoginChoices:(id)a3
{
  v4 = (NSMutableArray *)[a3 mutableCopy];
  loginChoices = self->_loginChoices;
  self->_loginChoices = v4;

  uint64_t v6 = self->_loginChoices;

  [(NSMutableArray *)v6 sortUsingComparator:&__block_literal_global_127];
}

uint64_t __58__ASCAuthorizationPresentationContext_updateLoginChoices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return compareLoginChoices(a2, a3);
}

- (BOOL)isRegistrationRequest
{
  return (self->_requestTypes & 0x14) != 0;
}

- (BOOL)isCombinedPublicKeyCredentialRegistrationRequest
{
  return self->_requestTypes == 20;
}

- (BOOL)hasExternalPasswords
{
  return [(NSMutableArray *)self->_loginChoices safari_containsObjectPassingTest:&__block_literal_global_130];
}

uint64_t __59__ASCAuthorizationPresentationContext_hasExternalPasswords__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 loginChoiceKind] == 1) {
    uint64_t v3 = [v2 isExternal];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)localAccountLoginChoices
{
  return (NSArray *)[(NSMutableArray *)self->_loginChoices safari_filterObjectsUsingBlock:&__block_literal_global_132];
}

uint64_t __63__ASCAuthorizationPresentationContext_localAccountLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 loginChoiceKind];
  if (v3 < 2)
  {
    uint64_t v4 = 1;
  }
  else if (v3 == 3)
  {
    uint64_t v4 = [v2 credentialKind] == 1;
  }
  else if (v3 == 2)
  {
    uint64_t v4 = [v2 isRegistrationRequest] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_getPrimaryLoginChoices:(id *)a3 otherLoginChoices:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = [(ASCAuthorizationPresentationContext *)self _passkeyLoginChoices];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  v7 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v20 = self;
  id v8 = self->_loginChoices;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v13 loginChoiceKind] == 1 && objc_msgSend(v5, "count") == 1)
        {
          objc_super v14 = [v5 firstObject];
          BOOL v15 = [(ASCAuthorizationPresentationContext *)v20 _passwordLoginChoice:v13 hasSameHighLevelDomainAndUsernameAsPasskeyLoginChoice:v14];

          if (v15) {
            v16 = v7;
          }
          else {
            v16 = v6;
          }
        }
        else if ((unint64_t)[v13 loginChoiceKind] >= 3)
        {
          v16 = v7;
        }
        else
        {
          v16 = v6;
        }
        [v16 addObject:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  if ([v6 count])
  {
    uint64_t v17 = a4;
    *a3 = (id)[v6 copy];
  }
  else
  {
    uint64_t v17 = a3;
  }
  *uint64_t v17 = (id)[v7 copy];
}

- (id)_passkeyLoginChoices
{
  return (id)[(NSMutableArray *)self->_loginChoices safari_filterObjectsUsingBlock:&__block_literal_global_134];
}

BOOL __59__ASCAuthorizationPresentationContext__passkeyLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 loginChoiceKind] == 2;
}

- (BOOL)_passwordLoginChoice:(id)a3 hasSameHighLevelDomainAndUsernameAsPasskeyLoginChoice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 site];
  id v8 = objc_msgSend(v7, "safari_highLevelDomainForPasswordManager");
  uint64_t v9 = [v6 relyingPartyIdentifier];
  uint64_t v10 = objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
  if ([v8 isEqualToString:v10])
  {
    uint64_t v11 = [v5 username];
    id v12 = [v6 userVisibleName];
    char v13 = [v11 isEqualToString:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)hasPlatformCredentialRequest
{
  return (self->_requestTypes & 0xC) != 0;
}

- (int64_t)iCloudKeychainPasskeyLoginChoiceCount
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v3 = +[ASFeatureManager sharedManager];
  int v4 = [v3 isDeviceConfiguredToAllowPasskeys];

  if (!v4) {
    return 0;
  }
  objc_opt_class();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_loginChoices;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v12 = objc_msgSend(v11, "externalCredentialProviderName", (void)v14);

          if (!v12) {
            ++v8;
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)externalPasskeyLoginChoiceCount
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_opt_class();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v3 = self->_loginChoices;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = objc_msgSend(v9, "externalCredentialProviderName", (void)v12);

          if (v10) {
            ++v6;
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (NSArray)credentialLoginChoices
{
  return (NSArray *)[(NSMutableArray *)self->_loginChoices safari_filterObjectsUsingBlock:&__block_literal_global_137];
}

BOOL __61__ASCAuthorizationPresentationContext_credentialLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 loginChoiceKind] != 5 && objc_msgSend(v2, "loginChoiceKind") != 6;

  return v3;
}

- (NSArray)otherAccountsLoginChoices
{
  return (NSArray *)[(NSMutableArray *)self->_loginChoices safari_filterObjectsUsingBlock:&__block_literal_global_139];
}

BOOL __64__ASCAuthorizationPresentationContext_otherAccountsLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 loginChoiceKind] == 5 || objc_msgSend(v2, "loginChoiceKind") == 6;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  loginChoices = self->_loginChoices;
  id v6 = a3;
  [v6 encodeObject:loginChoices forKey:@"loginChoices"];
  [v6 encodeObject:self->_appIdentifier forKey:@"appIdentifier"];
  [v6 encodeObject:self->_frameIdentifier forKey:@"frameIdentifier"];
  [v6 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v6 encodeObject:self->_teamIdentifier forKey:@"teamIdentifier"];
  [v6 encodeObject:self->_serviceName forKey:@"serviceName"];
  [v6 encodeInteger:self->_serviceType forKey:@"serviceType"];
  [v6 encodeObject:self->_destinationSiteForCrossSiteAssertion forKey:@"destinationSiteForCrossSiteAssertion"];
  [v6 encodeObject:self->_proxiedAssociatedDomains forKey:@"associatedDomains"];
  [v6 encodeObject:self->_proxiedIconData forKey:@"iconData"];
  [v6 encodeObject:self->_proxiedIconScale forKey:@"iconScale"];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_requestTypes];
  [v6 encodeObject:v5 forKey:@"requestTypes"];

  [v6 encodeBool:self->_isProxiedRequest forKey:@"isProxiedRequestKey"];
  [v6 encodeObject:self->_proxiedOriginDeviceName forKey:@"proxiedOriginDeviceName"];
  [v6 encodeObject:self->_allowedCredentialsForSecurityKeyAssertion forKey:@"allowedCredentialsForSecurityKeyAssertion"];
  [v6 encodeBool:self->_useAlternativeSecurityKeysIcon forKey:@"useAlternativeSecurityKeysIcon"];
  [v6 encodeObject:self->_appleIDAuthorizationRequest forKey:@"appleIDAuthorizationRequest"];
  [v6 encodeObject:self->_platformUserVerificationPreference forKey:@"platformUserVerificationPreference"];
  [v6 encodeBool:self->_shouldUseFallbackPasskeyUI forKey:@"shouldUseFallbackPasskeyUI"];
  [v6 encodeObject:self->_cableAuthenticatorURL forKey:@"cableAuthenticatorURL"];
  [v6 encodeBool:self->_isCABLEAuthenticatorRequest forKey:@"isCABLEAuthenticatorRequest"];
  [v6 encodeBool:self->_shouldRequireCABLEAuthenticatorConsent forKey:@"shouldRequireCABLEAuthenticatorConsent"];
  [v6 encodeBool:self->_shouldAllowSecurityKeysFromCABLEView forKey:@"shouldAllowSecurityKeysFromCABLEView"];
  [v6 encodeInteger:self->_cableAuthenticatorRequirement forKey:@"cableAuthenticatorRequirement"];
  [v6 encodeInteger:self->_passkeyURLType forKey:@"passkeyURLType"];
  [v6 encodeObject:self->_overrideHeader forKey:@"overrideHeader"];
  [v6 encodeObject:self->_overrideTitle forKey:@"overrideTitle"];
  [v6 encodeObject:self->_overrideSubtitle forKey:@"overrideSubtitle"];
  [v6 encodeObject:self->_overrideNoCredentialsErrorTitle forKey:@"overrideNoCredentialsErrorTitle"];
  [v6 encodeObject:self->_overrideNoCredentialsErrorMessage forKey:@"overrideNoCredentialsErrorMessage"];
  [v6 encodeObject:self->_windowSceneIdentifier forKey:@"windowSceneIdentifier"];
  [v6 encodeObject:self->_passkeyCreationOptionsForExternalProvider forKey:@"passkeyCreationOptionsForExternalProvider"];
  [v6 encodeObject:self->_passkeyAssertionOptionsForExternalProvider forKey:@"passkeyAssertionOptionsForExternalProvider"];
  [v6 encodeBool:self->_isConditionalRegistrationRequest forKey:@"isConditionalRegistrationRequest"];
  [v6 encodeObject:self->_auditTokenData forKey:@"auditTokenData"];
}

- (ASCAuthorizationPresentationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)ASCAuthorizationPresentationContext;
  uint64_t v5 = [(ASCAuthorizationPresentationContext *)&v65 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIdentifier"];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frameIdentifier"];
    frameIdentifier = v5->_frameIdentifier;
    v5->_frameIdentifier = (WBSGlobalFrameIdentifier *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v12;

    long long v14 = ASAllLoginChoiceClasses();
    long long v15 = [v14 setByAddingObject:objc_opt_class()];

    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"loginChoices"];
    loginChoices = v5->_loginChoices;
    v5->_loginChoices = (NSMutableArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v18;

    v5->_serviceType = [v4 decodeIntegerForKey:@"serviceType"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationSiteForCrossSiteAssertion"];
    destinationSiteForCrossSiteAssertion = v5->_destinationSiteForCrossSiteAssertion;
    v5->_destinationSiteForCrossSiteAssertion = (NSString *)v20;

    long long v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    long long v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"associatedDomains"];
    proxiedAssociatedDomains = v5->_proxiedAssociatedDomains;
    v5->_proxiedAssociatedDomains = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconData"];
    proxiedIconData = v5->_proxiedIconData;
    v5->_proxiedIconData = (NSData *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconScale"];
    proxiedIconScale = v5->_proxiedIconScale;
    v5->_proxiedIconScale = (NSNumber *)v29;

    id v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestTypes"];
    v5->_requestTypes = [v31 unsignedIntegerValue];
    v5->_isProxiedRequest = [v4 decodeBoolForKey:@"isProxiedRequestKey"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxiedOriginDeviceName"];
    proxiedOriginDeviceName = v5->_proxiedOriginDeviceName;
    v5->_proxiedOriginDeviceName = (NSString *)v32;

    v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"allowedCredentialsForSecurityKeyAssertion"];
    allowedCredentialsForSecurityKeyAssertion = v5->_allowedCredentialsForSecurityKeyAssertion;
    v5->_allowedCredentialsForSecurityKeyAssertion = (NSArray *)v37;

    v5->_useAlternativeSecurityKeysIcon = [v4 decodeBoolForKey:@"useAlternativeSecurityKeysIcon"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleIDAuthorizationRequest"];
    appleIDAuthorizationRequest = v5->_appleIDAuthorizationRequest;
    v5->_appleIDAuthorizationRequest = (AKAuthorizationRequest *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformUserVerificationPreference"];
    platformUserVerificationPreference = v5->_platformUserVerificationPreference;
    v5->_platformUserVerificationPreference = (NSString *)v41;

    v5->_shouldUseFallbackPasskeyUI = [v4 decodeBoolForKey:@"shouldUseFallbackPasskeyUI"];
    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cableAuthenticatorURL"];
    cableAuthenticatorURL = v5->_cableAuthenticatorURL;
    v5->_cableAuthenticatorURL = (NSURL *)v43;

    v5->_isCABLEAuthenticatorRequest = [v4 decodeBoolForKey:@"isCABLEAuthenticatorRequest"];
    v5->_shouldRequireCABLEAuthenticatorConsent = [v4 decodeBoolForKey:@"shouldRequireCABLEAuthenticatorConsent"];
    v5->_shouldAllowSecurityKeysFromCABLEView = [v4 decodeBoolForKey:@"shouldAllowSecurityKeysFromCABLEView"];
    v5->_cableAuthenticatorRequirement = [v4 decodeIntegerForKey:@"cableAuthenticatorRequirement"];
    v5->_passkeyURLType = [v4 decodeIntegerForKey:@"passkeyURLType"];
    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrideHeader"];
    overrideHeader = v5->_overrideHeader;
    v5->_overrideHeader = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrideTitle"];
    overrideTitle = v5->_overrideTitle;
    v5->_overrideTitle = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrideSubtitle"];
    overrideSubtitle = v5->_overrideSubtitle;
    v5->_overrideSubtitle = (NSString *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrideNoCredentialsErrorTitle"];
    overrideNoCredentialsErrorTitle = v5->_overrideNoCredentialsErrorTitle;
    v5->_overrideNoCredentialsErrorTitle = (NSString *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrideNoCredentialsErrorMessage"];
    overrideNoCredentialsErrorMessage = v5->_overrideNoCredentialsErrorMessage;
    v5->_overrideNoCredentialsErrorMessage = (NSString *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"windowSceneIdentifier"];
    windowSceneIdentifier = v5->_windowSceneIdentifier;
    v5->_windowSceneIdentifier = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passkeyCreationOptionsForExternalProvider"];
    passkeyCreationOptionsForExternalProvider = v5->_passkeyCreationOptionsForExternalProvider;
    v5->_passkeyCreationOptionsForExternalProvider = (ASCPublicKeyCredentialCreationOptions *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passkeyAssertionOptionsForExternalProvider"];
    passkeyAssertionOptionsForExternalProvider = v5->_passkeyAssertionOptionsForExternalProvider;
    v5->_passkeyAssertionOptionsForExternalProvider = (ASCPublicKeyCredentialAssertionOptions *)v59;

    v5->_isConditionalRegistrationRequest = [v4 decodeBoolForKey:@"isConditionalRegistrationRequest"];
    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditTokenData"];
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v61;

    v63 = v5;
  }

  return v5;
}

- (int64_t)_passkeyURLType
{
  return self->_passkeyURLType;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (WBSGlobalFrameIdentifier)frameIdentifier
{
  return self->_frameIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSArray)loginChoices
{
  return &self->_loginChoices->super;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)destinationSiteForCrossSiteAssertion
{
  return self->_destinationSiteForCrossSiteAssertion;
}

- (void)setDestinationSiteForCrossSiteAssertion:(id)a3
{
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (unint64_t)requestTypes
{
  return self->_requestTypes;
}

- (BOOL)isProxiedRequest
{
  return self->_isProxiedRequest;
}

- (void)setIsProxiedRequest:(BOOL)a3
{
  self->_isProxiedRequest = a3;
}

- (NSArray)proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)setProxiedAssociatedDomains:(id)a3
{
}

- (NSData)proxiedIconData
{
  return self->_proxiedIconData;
}

- (void)setProxiedIconData:(id)a3
{
}

- (NSNumber)proxiedIconScale
{
  return self->_proxiedIconScale;
}

- (void)setProxiedIconScale:(id)a3
{
}

- (NSString)proxiedOriginDeviceName
{
  return self->_proxiedOriginDeviceName;
}

- (void)setProxiedOriginDeviceName:(id)a3
{
}

- (AKAuthorizationRequest)appleIDAuthorizationRequest
{
  return self->_appleIDAuthorizationRequest;
}

- (void)setAppleIDAuthorizationRequest:(id)a3
{
}

- (NSString)platformUserVerificationPreference
{
  return self->_platformUserVerificationPreference;
}

- (NSURL)cableAuthenticatorURL
{
  return self->_cableAuthenticatorURL;
}

- (BOOL)isCABLEAuthenticatorRequest
{
  return self->_isCABLEAuthenticatorRequest;
}

- (BOOL)shouldRequireCABLEAuthenticatorConsent
{
  return self->_shouldRequireCABLEAuthenticatorConsent;
}

- (BOOL)shouldAllowSecurityKeysFromCABLEView
{
  return self->_shouldAllowSecurityKeysFromCABLEView;
}

- (int64_t)cableAuthenticatorRequirement
{
  return self->_cableAuthenticatorRequirement;
}

- (NSString)overrideHeader
{
  return self->_overrideHeader;
}

- (NSString)overrideTitle
{
  return self->_overrideTitle;
}

- (NSString)overrideSubtitle
{
  return self->_overrideSubtitle;
}

- (NSString)overrideNoCredentialsErrorTitle
{
  return self->_overrideNoCredentialsErrorTitle;
}

- (NSString)overrideNoCredentialsErrorMessage
{
  return self->_overrideNoCredentialsErrorMessage;
}

- (BOOL)useAlternativeSecurityKeysIcon
{
  return self->_useAlternativeSecurityKeysIcon;
}

- (BOOL)shouldUseFallbackPasskeyUI
{
  return self->_shouldUseFallbackPasskeyUI;
}

- (NSString)windowSceneIdentifier
{
  return self->_windowSceneIdentifier;
}

- (NSArray)allowedCredentialsForSecurityKeyAssertion
{
  return self->_allowedCredentialsForSecurityKeyAssertion;
}

- (ASCPublicKeyCredentialCreationOptions)passkeyCreationOptionsForExternalProvider
{
  return self->_passkeyCreationOptionsForExternalProvider;
}

- (ASCPublicKeyCredentialAssertionOptions)passkeyAssertionOptionsForExternalProvider
{
  return self->_passkeyAssertionOptionsForExternalProvider;
}

- (BOOL)isConditionalRegistrationRequest
{
  return self->_isConditionalRegistrationRequest;
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_passkeyAssertionOptionsForExternalProvider, 0);
  objc_storeStrong((id *)&self->_passkeyCreationOptionsForExternalProvider, 0);
  objc_storeStrong((id *)&self->_allowedCredentialsForSecurityKeyAssertion, 0);
  objc_storeStrong((id *)&self->_windowSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideNoCredentialsErrorMessage, 0);
  objc_storeStrong((id *)&self->_overrideNoCredentialsErrorTitle, 0);
  objc_storeStrong((id *)&self->_overrideSubtitle, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
  objc_storeStrong((id *)&self->_overrideHeader, 0);
  objc_storeStrong((id *)&self->_cableAuthenticatorURL, 0);
  objc_storeStrong((id *)&self->_platformUserVerificationPreference, 0);
  objc_storeStrong((id *)&self->_appleIDAuthorizationRequest, 0);
  objc_storeStrong((id *)&self->_proxiedOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_proxiedIconScale, 0);
  objc_storeStrong((id *)&self->_proxiedIconData, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_destinationSiteForCrossSiteAssertion, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_frameIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);

  objc_storeStrong((id *)&self->_loginChoices, 0);
}

- (void)initWithRequestContext:(void *)a1 appIdentifier:(void *)a2 frameIdentifier:shouldUseRelyingPartyForServiceName:auditTokenData:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_219326000, v3, OS_LOG_TYPE_ERROR, "Unable to fetch bundle record for app identifier on credential request context with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end